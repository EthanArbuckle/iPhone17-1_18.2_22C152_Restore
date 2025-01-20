@interface SASExtractSpeechDataCompleted
- (BOOL)ad_shouldBeHandledByClientAsResponseToCommand:(id)a3 fromPeer:(id)a4;
@end

@implementation SASExtractSpeechDataCompleted

- (BOOL)ad_shouldBeHandledByClientAsResponseToCommand:(id)a3 fromPeer:(id)a4
{
  return 1;
}

@end