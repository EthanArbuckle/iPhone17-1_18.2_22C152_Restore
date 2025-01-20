@interface UIViewPropertyAnimator(Helper)
+ (id)ck_viewPropertyAnimatorWithMass:()Helper stiffness:damping:initialVelocity:;
+ (uint64_t)ck_viewPropertyAnimatorWithMass:()Helper stiffness:damping:;
@end

@implementation UIViewPropertyAnimator(Helper)

+ (id)ck_viewPropertyAnimatorWithMass:()Helper stiffness:damping:initialVelocity:
{
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E18]), "initWithMass:stiffness:damping:initialVelocity:", a2, a3, a4, a5, a6);
  v8 = (void *)[[a1 alloc] initWithDuration:v7 timingParameters:0.0];

  return v8;
}

+ (uint64_t)ck_viewPropertyAnimatorWithMass:()Helper stiffness:damping:
{
  return objc_msgSend(a1, "ck_viewPropertyAnimatorWithMass:stiffness:damping:initialVelocity:", a3, a4, a5, 0.0, 0.0);
}

@end