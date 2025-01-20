@interface DBHomeToAppAnimation
+ (id)animationWithSettings:(id)a3;
@end

@implementation DBHomeToAppAnimation

+ (id)animationWithSettings:(id)a3
{
  v3 = (void (**)(id, DBHomeToAppAnimationSettings *))a3;
  v4 = objc_alloc_init(DBHomeToAppAnimationSettings);
  v3[2](v3, v4);

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v5 = off_2649B3940;
  }
  else
  {
    v6 = [(DBHomeToAppAnimationSettings *)v4 iconView];

    v5 = off_2649B3950;
    if (!v6) {
      v5 = off_2649B3948;
    }
  }
  v7 = (void *)[objc_alloc(*v5) initWithSettings:v4];

  return v7;
}

@end