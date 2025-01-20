@interface CBRemoteSetupConfiguringViewController
- (NSLayoutConstraint)heightConstraint;
- (UIActivityIndicatorView)activityView;
- (UIView)containerView;
- (void)setActivityView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setupView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CBRemoteSetupConfiguringViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CBRemoteSetupConfiguringViewController;
  [(CBRemoteSetupConfiguringViewController *)&v3 viewDidLoad];
  [(CBRemoteSetupConfiguringViewController *)self setupView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CBRemoteSetupConfiguringViewController;
  [(CBRemoteSetupConfiguringViewController *)&v6 viewDidAppear:a3];
  v4 = [(CBRemoteSetupConfiguringViewController *)self activityView];

  if (v4)
  {
    v5 = [(CBRemoteSetupConfiguringViewController *)self activityView];
    [v5 startAnimating];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CBRemoteSetupConfiguringViewController;
  [(CBRemoteSetupConfiguringViewController *)&v5 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)setupView
{
  [(CBRemoteSetupConfiguringViewController *)self setModalInPresentation:1];
  objc_super v3 = [(CBRemoteSetupConfiguringViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(CBRemoteSetupConfiguringViewController *)self headerView];
  [v4 setTitleHyphenationFactor:0.0];

  id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [(CBRemoteSetupConfiguringViewController *)self setActivityView:v5];

  objc_super v6 = [(CBRemoteSetupConfiguringViewController *)self activityView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = objc_alloc_init((Class)UIView);
  [(CBRemoteSetupConfiguringViewController *)self setContainerView:v7];

  objc_initWeak(&location, self);
  v8 = [(CBRemoteSetupConfiguringViewController *)self containerView];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000201D8;
  v36[3] = &unk_100079D58;
  objc_copyWeak(&v37, &location);
  [(CBRemoteSetupConfiguringViewController *)self addContentSubView:v8 heightConstraintForLayout:v36];

  v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  v11 = [(CBRemoteSetupConfiguringViewController *)self containerView];
  v12 = [(CBRemoteSetupConfiguringViewController *)self activityView];
  [v11 addSubview:v12];

  v35 = [(CBRemoteSetupConfiguringViewController *)self activityView];
  v33 = [v35 leadingAnchor];
  v34 = [(CBRemoteSetupConfiguringViewController *)self containerView];
  v32 = [v34 leadingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v39[0] = v31;
  v30 = [(CBRemoteSetupConfiguringViewController *)self activityView];
  v28 = [v30 trailingAnchor];
  v29 = [(CBRemoteSetupConfiguringViewController *)self containerView];
  v27 = [v29 trailingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v39[1] = v26;
  v25 = [(CBRemoteSetupConfiguringViewController *)self activityView];
  v24 = [v25 lastBaselineAnchor];
  v13 = [(CBRemoteSetupConfiguringViewController *)self containerView];
  v14 = [v13 topAnchor];
  double v15 = 96.0;
  if (v10 == (id)1) {
    double v15 = 106.0;
  }
  v16 = [v24 constraintEqualToAnchor:v14 constant:v15];
  v39[2] = v16;
  v17 = [(CBRemoteSetupConfiguringViewController *)self containerView];
  v18 = [v17 bottomAnchor];
  v19 = [(CBRemoteSetupConfiguringViewController *)self activityView];
  v20 = [v19 bottomAnchor];
  v21 = [v18 constraintGreaterThanOrEqualToAnchor:v20];
  v39[3] = v21;
  v22 = +[NSArray arrayWithObjects:v39 count:4];
  +[NSLayoutConstraint activateConstraints:v22];

  v23 = [(CBRemoteSetupConfiguringViewController *)self view];
  [v23 setNeedsLayout];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_activityView, 0);
}

@end