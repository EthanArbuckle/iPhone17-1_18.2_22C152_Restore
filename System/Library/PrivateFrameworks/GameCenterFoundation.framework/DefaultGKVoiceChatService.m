@interface DefaultGKVoiceChatService
- (BOOL)acceptCallID:(int64_t)a3 error:(id *)a4;
- (BOOL)isInputMeteringEnabled;
- (BOOL)isMicrophoneMuted;
- (BOOL)isOutputMeteringEnabled;
- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4;
- (GKVoiceChatServicePrivate)service;
- (float)inputMeterLevel;
- (float)outputMeterLevel;
- (float)remoteParticipantVolume;
- (id)getClient;
- (void)denyCallID:(int64_t)a3;
- (void)receivedData:(id)a3 fromParticipantID:(id)a4;
- (void)setClient:(id)a3 gkVoiceChatService:(id)a4;
- (void)setInputMeteringEnabled:(BOOL)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setOutputMeteringEnabled:(BOOL)a3;
- (void)setRemoteParticipantVolume:(float)a3;
- (void)setService:(id)a3;
- (void)stopVoiceChatWithParticipantID:(id)a3;
@end

@implementation DefaultGKVoiceChatService

- (BOOL)isInputMeteringEnabled
{
  v2 = [(DefaultGKVoiceChatService *)self service];
  char v3 = [v2 isInputMeteringEnabled];

  return v3;
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DefaultGKVoiceChatService *)self service];
  [v4 setInputMeteringEnabled:v3];
}

- (float)inputMeterLevel
{
  v2 = [(DefaultGKVoiceChatService *)self service];
  [v2 inputMeterLevel];
  float v4 = v3;

  return v4;
}

- (BOOL)isMicrophoneMuted
{
  v2 = [(DefaultGKVoiceChatService *)self service];
  char v3 = [v2 isMicrophoneMuted];

  return v3;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DefaultGKVoiceChatService *)self service];
  [v4 setMicrophoneMuted:v3];
}

- (BOOL)isOutputMeteringEnabled
{
  v2 = [(DefaultGKVoiceChatService *)self service];
  char v3 = [v2 isOutputMeteringEnabled];

  return v3;
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DefaultGKVoiceChatService *)self service];
  [v4 setOutputMeteringEnabled:v3];
}

- (float)outputMeterLevel
{
  v2 = [(DefaultGKVoiceChatService *)self service];
  [v2 outputMeterLevel];
  float v4 = v3;

  return v4;
}

- (float)remoteParticipantVolume
{
  v2 = [(DefaultGKVoiceChatService *)self service];
  [v2 remoteParticipantVolume];
  float v4 = v3;

  return v4;
}

- (void)setRemoteParticipantVolume:(float)a3
{
  id v5 = [(DefaultGKVoiceChatService *)self service];
  *(float *)&double v4 = a3;
  [v5 setRemoteParticipantVolume:v4];
}

- (BOOL)acceptCallID:(int64_t)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    v10 = [(DefaultGKVoiceChatService *)self service];
    int v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "[DefaultGKVoiceChatService] acceptCallID with %@", (uint8_t *)&v14, 0xCu);
  }
  v11 = [(DefaultGKVoiceChatService *)self service];
  char v12 = [v11 acceptCallID:a3 error:a4];

  return v12;
}

- (void)denyCallID:(int64_t)a3
{
  id v4 = [(DefaultGKVoiceChatService *)self service];
  [v4 denyCallID:a3];
}

- (id)getClient
{
  v2 = [(DefaultGKVoiceChatService *)self service];
  float v3 = [v2 client];

  return v3;
}

- (void)receivedData:(id)a3 fromParticipantID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DefaultGKVoiceChatService *)self service];
  [v8 receivedData:v7 fromParticipantID:v6];
}

- (void)setClient:(id)a3 gkVoiceChatService:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F63B58];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultVoiceChatService];
  service = self->_service;
  self->_service = v9;

  v11 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v12 = GKOSLoggers();
    v11 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = v11;
    int v14 = [(DefaultGKVoiceChatService *)self service];
    int v17 = 138412290;
    v18 = v14;
    _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "[DefaultGKVoiceChatService] initWithGKVoiceChatServicePrivate  = %@", (uint8_t *)&v17, 0xCu);
  }
  v15 = [(DefaultGKVoiceChatService *)self service];
  [v15 setWrapperService:v7];

  uint64_t v16 = [(DefaultGKVoiceChatService *)self service];
  [v16 setClient:v8];
}

- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    id v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    v10 = [(DefaultGKVoiceChatService *)self service];
    int v14 = 138412546;
    v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "[DefaultGKVoiceChatService] %@: startVoiceChatWithParticipantID with %@", (uint8_t *)&v14, 0x16u);
  }
  v11 = [(DefaultGKVoiceChatService *)self service];
  char v12 = [v11 startVoiceChatWithParticipantID:v6 error:a4];

  return v12;
}

- (void)stopVoiceChatWithParticipantID:(id)a3
{
  id v4 = a3;
  id v5 = [(DefaultGKVoiceChatService *)self service];
  [v5 stopVoiceChatWithParticipantID:v4];
}

- (GKVoiceChatServicePrivate)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end