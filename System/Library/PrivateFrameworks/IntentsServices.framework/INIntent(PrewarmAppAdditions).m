@interface INIntent(PrewarmAppAdditions)
- (uint64_t)ins_shouldPrewarmApp;
@end

@implementation INIntent(PrewarmAppAdditions)

- (uint64_t)ins_shouldPrewarmApp
{
  return 0;
}

@end