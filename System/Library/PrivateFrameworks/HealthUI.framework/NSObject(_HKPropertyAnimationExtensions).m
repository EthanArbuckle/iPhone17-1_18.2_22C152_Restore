@interface NSObject(_HKPropertyAnimationExtensions)
- (uint64_t)hk_animatable;
@end

@implementation NSObject(_HKPropertyAnimationExtensions)

- (uint64_t)hk_animatable
{
  return 0;
}

@end