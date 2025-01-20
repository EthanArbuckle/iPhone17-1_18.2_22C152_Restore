@interface TouchIdViewControllerWithCoachings
- (BOOL)prefersStatusBarHidden;
- (void)_configureUI;
- (void)_dismissUIWithCompletionHandler:(id)a3;
- (void)_presentUI:(id)a3;
- (void)_setupCoachingView;
- (void)_setupDimming;
- (void)_setupUI;
- (void)_updateUI;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TouchIdViewControllerWithCoachings

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TouchIdViewControllerWithCoachings;
  -[TouchIdViewControllerWithCoachings viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  [(TouchIdViewControllerWithCoachings *)self _updateUI];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TouchIdViewControllerWithCoachings;
  [(TouchIdViewControllerWithCoachings *)&v3 viewWillLayoutSubviews];
  [(TouchIdViewControllerWithCoachings *)self _updateUI];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TouchIdViewControllerWithCoachings;
  [(TouchIdViewControllerWithCoachings *)&v6 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
  objc_super v5 = [(TouchIdViewControllerWithCoachings *)self traitCollection];
  -[LAUIPhysicalButtonView setStyle:](self->_coachingView, "setStyle:", [v5 userInterfaceStyle] == (id)2);
}

- (void)_setupUI
{
  [(TouchIdViewControllerWithCoachings *)self _setupCoachingView];
  v3.receiver = self;
  v3.super_class = (Class)TouchIdViewControllerWithCoachings;
  [(TouchIdViewController *)&v3 _setupUI];
}

- (void)_configureUI
{
  v3.receiver = self;
  v3.super_class = (Class)TouchIdViewControllerWithCoachings;
  [(TouchIdViewController *)&v3 _configureUI];
  [(LAUIPhysicalButtonView *)self->_coachingView setIsInstructionHidden:[(TouchIdViewController *)self _isSensorActive] ^ 1];
}

- (void)_presentUI:(id)a3
{
  [(TouchIdViewControllerWithCoachings *)self _setupDimming];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000104E4;
  v5[3] = &unk_100085F40;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)TouchIdViewControllerWithCoachings;
  [(TouchIdViewController *)&v4 _presentUI:v5];
}

- (void)_dismissUIWithCompletionHandler:(id)a3
{
  coachingView = self->_coachingView;
  id v5 = a3;
  [(LAUIPhysicalButtonView *)coachingView removeFromSuperview];
  v6.receiver = self;
  v6.super_class = (Class)TouchIdViewControllerWithCoachings;
  [(TouchIdViewController *)&v6 _dismissUIWithCompletionHandler:v5];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)_setupCoachingView
{
  objc_super v3 = (LAUIPhysicalButtonView *)[objc_alloc((Class)LAUIPhysicalButtonView) initWithStyle:1];
  coachingView = self->_coachingView;
  self->_coachingView = v3;

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"TOUCH_ID" value:&stru_100088CF0 table:@"MobileUI"];
  [(LAUIPhysicalButtonView *)self->_coachingView setInstruction:v6];

  [(LAUIPhysicalButtonView *)self->_coachingView setAnimationStyle:2];
  v7 = self->_coachingView;

  [(LAUIPhysicalButtonView *)v7 setAnimating:1];
}

- (void)_setupDimming
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010730;
  v6[3] = &unk_100086420;
  v6[4] = self;
  double v3 = sub_100010730((uint64_t)v6);
  objc_super v4 = [(TouchIdViewController *)self dimmingView];
  [v4 setDimLevel:v3];

  id v5 = [(TouchIdViewController *)self dimmingView];
  [v5 setDimEnabled:1];
}

- (void)_updateUI
{
  [(LAUIPhysicalButtonView *)self->_coachingView setAnimating:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001082C;
  block[3] = &unk_100085F40;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
}

@end