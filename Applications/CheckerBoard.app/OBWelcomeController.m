@interface OBWelcomeController
+ (void)setAdditionalScaleForAnimation:(double)a3 headerView:(id)a4;
+ (void)setStandardScaleForAnimation:(id)a3;
- (id)animationController:(id)a3;
- (id)animationController:(id)a3 animatedStates:(id)a4 startAtFirstState:(BOOL)a5;
- (id)bundleUrlForPackageName:(id)a3;
- (void)setAdditionalScaleForAnimation:(double)a3;
- (void)setStandardScaleForAnimation;
@end

@implementation OBWelcomeController

- (id)animationController:(id)a3 animatedStates:(id)a4 startAtFirstState:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v5)
  {
    v11 = [v9 firstObject];
  }
  else
  {
    v11 = 0;
  }
  id v12 = objc_alloc((Class)OBAnimationController);
  v13 = [(OBWelcomeController *)self bundleUrlForPackageName:v8];
  v14 = [(OBWelcomeController *)self headerView];
  v15 = [v14 animationView];
  id v16 = [v12 initWithUrlToPackage:v13 animationView:v15 animatedStates:v10 startAtFirstState:v11];

  [(OBWelcomeController *)self setStandardScaleForAnimation];

  return v16;
}

- (id)animationController:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
  v10[0] = v5;
  id v6 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.0 transitionSpeed:0.5];
  v10[1] = v6;
  v7 = +[NSArray arrayWithObjects:v10 count:2];

  id v8 = [(OBWelcomeController *)self animationController:v4 animatedStates:v7 startAtFirstState:1];

  return v8;
}

- (id)bundleUrlForPackageName:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 URLForResource:v3 withExtension:@"ca"];

  if (!v5) {
    sub_100048BDC((uint64_t)v3);
  }

  return v5;
}

- (void)setStandardScaleForAnimation
{
}

- (void)setAdditionalScaleForAnimation:(double)a3
{
  id v5 = objc_opt_class();
  id v6 = [(OBWelcomeController *)self headerView];
  [v5 setAdditionalScaleForAnimation:v6 headerView:a3];
}

+ (void)setStandardScaleForAnimation:(id)a3
{
}

+ (void)setAdditionalScaleForAnimation:(double)a3 headerView:(id)a4
{
  id v5 = a4;
  id v9 = [v5 animationView];
  [v9 defaultScale];
  double v7 = v6 + a3;
  id v8 = [v5 animationView];

  [v8 setScale:v7];
}

@end