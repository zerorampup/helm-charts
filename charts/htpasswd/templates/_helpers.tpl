{{- define "gen.secret" -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace .Values.name -}}
{{- if $secret -}}
{{/*
   Reusing existing secret data
*/}}
auth: {{ $secret.data.auth }}
{{- else -}}
{{/*
    Generate new data
*/}}
auth: {{ htpasswd .Values.username .Values.password | b64enc | quote }}
{{- end -}}
{{- end -}}