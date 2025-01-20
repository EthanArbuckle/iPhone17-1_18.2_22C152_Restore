@interface GetGaplessTransitionBufferingProgressThreshold
@end

@implementation GetGaplessTransitionBufferingProgressThreshold

uint64_t __fpfs_GetGaplessTransitionBufferingProgressThreshold_block_invoke()
{
  uint64_t result = FigGetCFPreferenceDoubleWithDefault();
  gGaplessTransitionBufferingProgressThreshold = v1;
  return result;
}

@end