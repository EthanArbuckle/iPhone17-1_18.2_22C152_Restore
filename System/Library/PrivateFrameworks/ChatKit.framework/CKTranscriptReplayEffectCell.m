@interface CKTranscriptReplayEffectCell
- (BOOL)wantsDrawerLayout;
- (double)testOffset;
@end

@implementation CKTranscriptReplayEffectCell

- (double)testOffset
{
  return 3.0;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

@end