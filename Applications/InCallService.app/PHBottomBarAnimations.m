@interface PHBottomBarAnimations
+ (id)backgroundColorAnimationFromColor:(CGColor *)a3 toColor:(CGColor *)a4;
+ (id)crossFadeAnimationFromImage:(CGImage *)a3 toImage:(CGImage *)a4;
+ (id)rollAnimation;
@end

@implementation PHBottomBarAnimations

+ (id)rollAnimation
{
  v2 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
  [v2 setMass:2.0];
  [v2 setStiffness:300.0];
  [v2 setDamping:50.0];
  [v2 setDuration:0.910000026];
  [v2 setEndAngle:2.35619449];

  return v2;
}

+ (id)crossFadeAnimationFromImage:(CGImage *)a3 toImage:(CGImage *)a4
{
  v6 = +[CABasicAnimation animationWithKeyPath:@"contents"];
  [v6 setDuration:0.300000012];
  [v6 setFromValue:a3];
  [v6 setToValue:a4];
  [v6 setRemovedOnCompletion:0];
  [v6 setFillMode:kCAFillModeForwards];

  return v6;
}

+ (id)backgroundColorAnimationFromColor:(CGColor *)a3 toColor:(CGColor *)a4
{
  v6 = +[CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
  v9[0] = a3;
  v9[1] = a4;
  v7 = +[NSArray arrayWithObjects:v9 count:2];
  [v6 setValues:v7];

  [v6 setKeyTimes:&off_1002DF788];
  [v6 setDuration:0.254999995];

  return v6;
}

@end