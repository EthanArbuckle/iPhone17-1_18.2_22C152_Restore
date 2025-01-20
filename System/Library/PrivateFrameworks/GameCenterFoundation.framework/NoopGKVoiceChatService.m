@interface NoopGKVoiceChatService
- (BOOL)acceptCallID:(int64_t)a3 error:(id *)a4;
- (BOOL)isInputMeteringEnabled;
- (BOOL)isMicrophoneMuted;
- (BOOL)isOutputMeteringEnabled;
- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4;
- (float)inputMeterLevel;
- (float)outputMeterLevel;
- (float)remoteParticipantVolume;
- (id)getClient;
@end

@implementation NoopGKVoiceChatService

- (BOOL)isInputMeteringEnabled
{
  return 0;
}

- (float)inputMeterLevel
{
  return 0.0;
}

- (BOOL)isMicrophoneMuted
{
  return 1;
}

- (float)remoteParticipantVolume
{
  return 0.0;
}

- (BOOL)isOutputMeteringEnabled
{
  return 0;
}

- (float)outputMeterLevel
{
  return 0.0;
}

- (BOOL)acceptCallID:(int64_t)a3 error:(id *)a4
{
  return 0;
}

- (id)getClient
{
  return 0;
}

- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4
{
  return 0;
}

@end