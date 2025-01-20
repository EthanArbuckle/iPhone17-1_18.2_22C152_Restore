@interface GKVoiceChatService
+ (BOOL)isVoIPAllowed;
+ (GKVoiceChatService)defaultVoiceChatService;
+ (void)initialize;
- (BOOL)acceptCallID:(NSInteger)callID error:(NSError *)error;
- (BOOL)isInputMeteringEnabled;
- (BOOL)isMicrophoneMuted;
- (BOOL)isOutputMeteringEnabled;
- (BOOL)startVoiceChatWithParticipantID:(NSString *)participantID error:(NSError *)error;
- (GKViceroyVoiceChatService)voiceChatService;
- (GKVoiceChatService)init;
- (float)inputMeterLevel;
- (float)outputMeterLevel;
- (float)remoteParticipantVolume;
- (id)client;
- (void)denyCallID:(NSInteger)callID;
- (void)receivedData:(NSData *)arbitraryData fromParticipantID:(NSString *)participantID;
- (void)setClient:(id)client;
- (void)setInputMeteringEnabled:(BOOL)inputMeteringEnabled;
- (void)setMicrophoneMuted:(BOOL)microphoneMuted;
- (void)setOutputMeteringEnabled:(BOOL)outputMeteringEnabled;
- (void)setRemoteParticipantVolume:(float)remoteParticipantVolume;
- (void)setVoiceChatService:(id)a3;
- (void)stopVoiceChatWithParticipantID:(NSString *)participantID;
@end

@implementation GKVoiceChatService

- (GKVoiceChatService)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKVoiceChatService;
  v2 = [(GKVoiceChatService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[GKViceroyVoiceChatServiceFactory makeService];
    voiceChatService = v2->_voiceChatService;
    v2->_voiceChatService = (GKViceroyVoiceChatService *)v3;
  }
  return v2;
}

+ (void)initialize
{
}

+ (GKVoiceChatService)defaultVoiceChatService
{
  v2 = (void *)defaultVoiceChatService__GKVoiceChatService;
  if (!defaultVoiceChatService__GKVoiceChatService)
  {
    uint64_t v3 = objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultVoiceChatService__GKVoiceChatService)
    {
      v4 = objc_alloc_init(GKVoiceChatService);
      v5 = (void *)defaultVoiceChatService__GKVoiceChatService;
      defaultVoiceChatService__GKVoiceChatService = (uint64_t)v4;
    }
    objc_sync_exit(v3);

    v2 = (void *)defaultVoiceChatService__GKVoiceChatService;
  }

  return (GKVoiceChatService *)v2;
}

- (id)client
{
  v2 = [(GKVoiceChatService *)self voiceChatService];
  uint64_t v3 = [v2 getClient];

  return v3;
}

- (void)setClient:(id)client
{
  id v4 = client;
  id v5 = [(GKVoiceChatService *)self voiceChatService];
  [v5 setClient:v4 gkVoiceChatService:self];
}

- (BOOL)startVoiceChatWithParticipantID:(NSString *)participantID error:(NSError *)error
{
  objc_super v6 = participantID;
  v7 = [(GKVoiceChatService *)self voiceChatService];
  LOBYTE(error) = [v7 startVoiceChatWithParticipantID:v6 error:error];

  return (char)error;
}

- (void)stopVoiceChatWithParticipantID:(NSString *)participantID
{
  id v4 = participantID;
  id v5 = [(GKVoiceChatService *)self voiceChatService];
  [v5 stopVoiceChatWithParticipantID:v4];
}

- (BOOL)acceptCallID:(NSInteger)callID error:(NSError *)error
{
  unsigned int v5 = callID;
  objc_super v6 = [(GKVoiceChatService *)self voiceChatService];
  LOBYTE(error) = [v6 acceptCallID:v5 error:error];

  return (char)error;
}

- (void)denyCallID:(NSInteger)callID
{
  unsigned int v3 = callID;
  id v4 = [(GKVoiceChatService *)self voiceChatService];
  [v4 denyCallID:v3];
}

- (void)receivedData:(NSData *)arbitraryData fromParticipantID:(NSString *)participantID
{
  objc_super v6 = participantID;
  v7 = arbitraryData;
  id v8 = [(GKVoiceChatService *)self voiceChatService];
  [v8 receivedData:v7 fromParticipantID:v6];
}

- (void)setMicrophoneMuted:(BOOL)microphoneMuted
{
  BOOL v3 = microphoneMuted;
  id v4 = [(GKVoiceChatService *)self voiceChatService];
  [v4 setMicrophoneMuted:v3];
}

- (BOOL)isMicrophoneMuted
{
  v2 = [(GKVoiceChatService *)self voiceChatService];
  char v3 = [v2 isMicrophoneMuted];

  return v3;
}

- (float)remoteParticipantVolume
{
  v2 = [(GKVoiceChatService *)self voiceChatService];
  [v2 remoteParticipantVolume];
  float v4 = v3;

  return v4;
}

- (void)setRemoteParticipantVolume:(float)remoteParticipantVolume
{
  id v5 = [(GKVoiceChatService *)self voiceChatService];
  *(float *)&double v4 = remoteParticipantVolume;
  [v5 setRemoteParticipantVolume:v4];
}

- (BOOL)isOutputMeteringEnabled
{
  v2 = [(GKVoiceChatService *)self voiceChatService];
  char v3 = [v2 isOutputMeteringEnabled];

  return v3;
}

- (void)setOutputMeteringEnabled:(BOOL)outputMeteringEnabled
{
  BOOL v3 = outputMeteringEnabled;
  id v4 = [(GKVoiceChatService *)self voiceChatService];
  [v4 setOutputMeteringEnabled:v3];
}

- (BOOL)isInputMeteringEnabled
{
  v2 = [(GKVoiceChatService *)self voiceChatService];
  char v3 = [v2 isInputMeteringEnabled];

  return v3;
}

- (void)setInputMeteringEnabled:(BOOL)inputMeteringEnabled
{
  BOOL v3 = inputMeteringEnabled;
  id v4 = [(GKVoiceChatService *)self voiceChatService];
  [v4 setInputMeteringEnabled:v3];
}

- (float)outputMeterLevel
{
  v2 = [(GKVoiceChatService *)self voiceChatService];
  [v2 outputMeterLevel];
  float v4 = v3;

  return v4;
}

- (float)inputMeterLevel
{
  v2 = [(GKVoiceChatService *)self voiceChatService];
  [v2 inputMeterLevel];
  float v4 = v3;

  return v4;
}

+ (BOOL)isVoIPAllowed
{
  return +[GKVoiceChat isVoIPAllowed];
}

- (GKViceroyVoiceChatService)voiceChatService
{
  return self->_voiceChatService;
}

- (void)setVoiceChatService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end