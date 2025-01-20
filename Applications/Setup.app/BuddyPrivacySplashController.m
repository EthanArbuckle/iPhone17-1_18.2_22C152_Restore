@interface BuddyPrivacySplashController
- (OBAnimationController)animationController;
- (void)setAnimationController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyPrivacySplashController

- (void)viewDidLoad
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyPrivacySplashController;
  [(BuddyPrivacySplashController *)&v9 viewDidLoad];
  id v2 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Fade up" darkStateName:@"Fade up Dark" transitionDuration:0.1 transitionSpeed:1.0];
  v12[0] = v2;
  id v3 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Shake up" darkStateName:@"Shake up Dark" transitionDuration:0.5 transitionSpeed:0.5];
  v12[1] = v3;
  id v4 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Shake down" darkStateName:@"Shake down Dark" transitionDuration:0.5 transitionSpeed:0.5];
  v12[2] = v4;
  id v5 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Shake up" darkStateName:@"Shake up Dark" transitionDuration:0.5 transitionSpeed:0.5];
  v12[3] = v5;
  id v6 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Shake down" darkStateName:@"Shake down Dark" transitionDuration:0.5 transitionSpeed:0.5];
  v12[4] = v6;
  id location = +[NSArray arrayWithObjects:v12 count:5];

  id v7 = [(BuddyPrivacySplashController *)v11 buddy_animationController:@"PrivacyPane" animatedStates:location startAtFirstState:1];
  [(BuddyPrivacySplashController *)v11 setAnimationController:v7];

  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyPrivacySplashController;
  [(BuddyPrivacySplashController *)&v4 viewWillAppear:a3];
  id v3 = [(BuddyPrivacySplashController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end