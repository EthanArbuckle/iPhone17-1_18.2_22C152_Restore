@interface UIView(MPUAnimationFactory)
+ (uint64_t)MPU_animateWithDuration:()MPUAnimationFactory delay:options:animationFactory:animations:completion:;
@end

@implementation UIView(MPUAnimationFactory)

+ (uint64_t)MPU_animateWithDuration:()MPUAnimationFactory delay:options:animationFactory:animations:completion:
{
  return objc_msgSend(MEMORY[0x263F1CB60], "_animateWithDuration:delay:options:factory:animations:completion:", a1, 0.0);
}

@end