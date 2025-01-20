@interface CSAudioRecordContext(Helper)
- (uint64_t)shouldUseLocalAudioFileWriter;
@end

@implementation CSAudioRecordContext(Helper)

- (uint64_t)shouldUseLocalAudioFileWriter
{
  return [a1 isContinuousConversation] ^ 1;
}

@end