@interface DBAppToAppAnimation
+ (id)animationWithSettings:(id)a3;
@end

@implementation DBAppToAppAnimation

+ (id)animationWithSettings:(id)a3
{
  v3 = (void (**)(id, DBAnimationSettings *))a3;
  v4 = objc_alloc_init(DBAnimationSettings);
  v3[2](v3, v4);

  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v6 = off_2649B3920;
  if (!IsReduceMotionEnabled) {
    v6 = off_2649B3918;
  }
  v7 = (void *)[objc_alloc(*v6) initWithSettings:v4];

  return v7;
}

@end