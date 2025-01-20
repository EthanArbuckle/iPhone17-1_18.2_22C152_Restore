@interface OBWelcomeController
+ (void)setAdditionalScaleForAnimation:(double)a3 headerView:(id)a4;
+ (void)setStandardBuddyScaleForAnimation:(id)a3;
- (id)buddy_animationController:(id)a3;
- (id)buddy_animationController:(id)a3 animatedStates:(id)a4 startAtFirstState:(BOOL)a5;
- (id)bundleUrlForPackageName:(id)a3;
- (void)markPaneToAnimateHeaderOnNextAppearance;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
- (void)setAdditionalScaleForAnimation:(double)a3;
- (void)setStandardBuddyScaleForAnimation;
@end

@implementation OBWelcomeController

- (id)buddy_animationController:(id)a3 animatedStates:(id)a4 startAtFirstState:(BOOL)a5
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  BOOL v17 = a5;
  id v16 = 0;
  if (a5)
  {
    id v7 = [v18 firstObject];
    id v8 = v16;
    id v16 = v7;
  }
  id v9 = objc_alloc((Class)OBAnimationController);
  id v10 = [(OBWelcomeController *)v20 bundleUrlForPackageName:location[0]];
  id v11 = [(OBWelcomeController *)v20 headerView];
  id v12 = [v11 animationView];
  id v15 = [v9 initWithUrlToPackage:v10 animationView:v12 animatedStates:v18 startAtFirstState:v16];

  [(OBWelcomeController *)v20 setStandardBuddyScaleForAnimation];
  id v13 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)buddy_animationController:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
  v10[0] = v3;
  id v4 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.0 transitionSpeed:0.5];
  v10[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];

  id v5 = [(OBWelcomeController *)v9 buddy_animationController:location[0] animatedStates:v7 startAtFirstState:1];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)bundleUrlForPackageName:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[NSBundle mainBundle];
  id v7 = [(NSBundle *)v3 URLForResource:location[0] withExtension:@"ca"];

  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Unable to find url to package %@:", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v9 = 0;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  id v4 = v9;

  return v4;
}

- (void)setStandardBuddyScaleForAnimation
{
}

- (void)setAdditionalScaleForAnimation:(double)a3
{
  id v3 = objc_opt_class();
  id v4 = [(OBWelcomeController *)self headerView];
  [v3 setAdditionalScaleForAnimation:v4 headerView:a3];
}

+ (void)setStandardBuddyScaleForAnimation:(id)a3
{
  id v4 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [v4 setAdditionalScaleForAnimation:location[0] headerView:0.0666666667];
  objc_storeStrong(location, 0);
}

+ (void)setAdditionalScaleForAnimation:(double)a3 headerView:(id)a4
{
  id v13 = a1;
  SEL v12 = a2;
  double v11 = a3;
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v4 = +[BYDevice currentDevice];
  id v5 = [v4 size];

  if (v5 == (id)2) {
    double v11 = v11 / 2.0;
  }
  id v6 = [v10 animationView];
  [v6 defaultScale];
  double v8 = v7 + v11;
  id v9 = [v10 animationView];
  [v9 setScale:v8];

  objc_storeStrong(&v10, 0);
}

- (void)markPaneToAnimateHeaderOnNextAppearance
{
  id v2 = [(OBWelcomeController *)self navigationController];
  id v3 = (OBWelcomeController *)[v2 topViewController];
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  BOOL v4 = 0;
  if (v3 == self)
  {
    id v16 = [(OBWelcomeController *)self navigationController];
    char v15 = 1;
    id v14 = [v16 viewControllers];
    char v13 = 1;
    SEL v12 = (OBWelcomeController *)[v14 firstObject];
    char v11 = 1;
    BOOL v4 = v12 == self;
  }
  if (v11) {

  }
  if (v13) {
  if (v15)
  }

  if (!v4)
  {
    char v9 = 0;
    char isKindOfClass = 0;
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(OBWelcomeController *)self navigationController];
      char v9 = 1;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    if (v9) {

    }
    if (isKindOfClass)
    {
      id v6 = [(OBWelcomeController *)self navigationController];
      [v6 addDelegateObserver:self];

      id v7 = [(OBWelcomeController *)self headerView];
      id v8 = [v7 animationView];
      [v8 setAlpha:0.0];
    }
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v14 == v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [(OBWelcomeController *)v14 animationController];
    [v7 stopAnimation];

    id v8 = [(OBWelcomeController *)v14 headerView];
    id v9 = [v8 animationView];
    [v9 setAlpha:1.0];

    id v10 = [(OBWelcomeController *)v14 animationController];
    [v10 startAnimation];

    id v11 = [(OBWelcomeController *)v14 navigationController];
    [v11 removeDelegateObserver:v14];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

@end