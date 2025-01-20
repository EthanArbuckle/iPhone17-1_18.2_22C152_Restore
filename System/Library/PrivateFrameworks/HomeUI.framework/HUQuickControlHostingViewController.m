@interface HUQuickControlHostingViewController
- (HUQuickControlHostingViewController)initWithViewController:(id)a3 profile:(id)a4;
- (HUQuickControlViewProfile)profile;
- (UIViewController)contraption;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation HUQuickControlHostingViewController

- (HUQuickControlHostingViewController)initWithViewController:(id)a3 profile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlHostingViewController;
  v9 = [(HUQuickControlHostingViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a4);
    objc_storeStrong((id *)&v10->_contraption, a3);
  }

  return v10;
}

- (void)loadView
{
  v3 = [_HUQuickControlControllableHostView alloc];
  id v5 = [(HUQuickControlHostingViewController *)self profile];
  v4 = [(_HUQuickControlControllableHostView *)v3 initWithProfile:v5];
  [(HUQuickControlHostingViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlHostingViewController;
  [(HUQuickControlHostingViewController *)&v21 viewDidLoad];
  v3 = [(HUQuickControlHostingViewController *)self contraption];
  [(HUQuickControlHostingViewController *)self addChildViewController:v3];

  v4 = [(HUQuickControlHostingViewController *)self contraption];
  id v5 = [v4 view];
  [v5 setAutoresizingMask:18];

  v6 = [(HUQuickControlHostingViewController *)self view];
  id v7 = [(HUQuickControlHostingViewController *)self contraption];
  id v8 = [v7 view];
  [v6 addSubview:v8];

  v9 = [(HUQuickControlHostingViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(HUQuickControlHostingViewController *)self contraption];
  v19 = [v18 view];
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  v20 = [(HUQuickControlHostingViewController *)self contraption];
  [v20 didMoveToParentViewController:self];
}

- (HUQuickControlViewProfile)profile
{
  return self->_profile;
}

- (UIViewController)contraption
{
  return self->_contraption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contraption, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end