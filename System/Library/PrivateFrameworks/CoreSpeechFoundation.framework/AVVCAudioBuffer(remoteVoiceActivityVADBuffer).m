@interface AVVCAudioBuffer(remoteVoiceActivityVADBuffer)
- (id)remoteVoiceActivityVADBuffer;
@end

@implementation AVVCAudioBuffer(remoteVoiceActivityVADBuffer)

- (id)remoteVoiceActivityVADBuffer
{
  if ([a1 remoteVoiceActivityAvailable])
  {
    char v4 = [a1 remoteVoiceActivityVAD];
    v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end