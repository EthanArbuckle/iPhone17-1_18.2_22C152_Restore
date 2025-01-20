@interface DBAppToHomeAnimation
+ (id)animationWithSettings:(id)a3;
@end

@implementation DBAppToHomeAnimation

+ (id)animationWithSettings:(id)a3
{
  v3 = (void (**)(id, DBAppToHomeAnimationSettings *))a3;
  v4 = objc_alloc_init(DBAppToHomeAnimationSettings);
  v3[2](v3, v4);

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v5 = off_2649B3968;
  }
  else
  {
    v6 = [(DBAppToHomeAnimationSettings *)v4 iconView];

    v5 = off_2649B3978;
    if (!v6) {
      v5 = off_2649B3970;
    }
  }
  v7 = (void *)[objc_alloc(*v5) initWithSettings:v4];

  return v7;
}

@end