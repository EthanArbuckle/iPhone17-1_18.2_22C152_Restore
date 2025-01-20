@interface UIViewPropertyAnimator(EKExpandedReminderStackLayoutAdditions)
+ (id)collapsingStackedRemindersSpringAnimator;
+ (id)expandingLayoutAttributesStackedRemindersSpringAnimator;
+ (id)expandingStackedRemindersSpringAnimator;
@end

@implementation UIViewPropertyAnimator(EKExpandedReminderStackLayoutAdditions)

+ (id)expandingStackedRemindersSpringAnimator
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 365.074, 38.2138, 0.0, 0.0);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v0 timingParameters:0.0];

  return v1;
}

+ (id)expandingLayoutAttributesStackedRemindersSpringAnimator
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 203.917, 19.992, 0.0, 0.0);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v0 timingParameters:0.0];

  return v1;
}

+ (id)collapsingStackedRemindersSpringAnimator
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithMass:stiffness:damping:initialVelocity:", 1.8, 480.0, 60.0, 0.0, 0.0);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v0 timingParameters:0.0];

  return v1;
}

@end