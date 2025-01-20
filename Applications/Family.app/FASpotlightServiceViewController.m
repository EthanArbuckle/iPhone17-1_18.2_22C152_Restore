@interface FASpotlightServiceViewController
+ (id)_exportedInterface;
- (SPUIContactViewController)spotlightViewController;
- (void)updateWithContactIdentifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation FASpotlightServiceViewController

- (void)viewDidLoad
{
  p_spotlightViewController = &self->_spotlightViewController;
  id v31 = objc_alloc_init((Class)SPUIContactViewController);
  objc_storeStrong((id *)p_spotlightViewController, v31);
  v4 = (objc_class *)objc_opt_class();
  if (class_getProperty(v4, "isBackgroundColorViewHidden"))
  {
    v5 = *p_spotlightViewController;
    id v6 = [objc_alloc((Class)NSNumber) initWithBool:1];
    [(SPUIContactViewController *)v5 setValue:v6 forKey:@"isBackgroundColorViewHidden"];
  }
  [(SPUIContactViewController *)*p_spotlightViewController setDelegate:self];
  [(FASpotlightServiceViewController *)self addChildViewController:*p_spotlightViewController];
  v7 = [(FASpotlightServiceViewController *)self view];
  v8 = [(SPUIContactViewController *)*p_spotlightViewController view];
  [v7 addSubview:v8];

  v9 = [(SPUIContactViewController *)*p_spotlightViewController view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(SPUIContactViewController *)*p_spotlightViewController view];
  v28 = [v30 topAnchor];
  v29 = [(FASpotlightServiceViewController *)self view];
  v27 = [v29 topAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v32[0] = v26;
  v25 = [(SPUIContactViewController *)*p_spotlightViewController view];
  v23 = [v25 leftAnchor];
  v24 = [(FASpotlightServiceViewController *)self view];
  v22 = [v24 leftAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v32[1] = v21;
  v20 = [(SPUIContactViewController *)*p_spotlightViewController view];
  v18 = [v20 rightAnchor];
  v19 = [(FASpotlightServiceViewController *)self view];
  v10 = [v19 rightAnchor];
  v11 = [v18 constraintEqualToAnchor:v10];
  v32[2] = v11;
  v12 = [(SPUIContactViewController *)*p_spotlightViewController view];
  v13 = [v12 bottomAnchor];
  v14 = [(FASpotlightServiceViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v32[3] = v16;
  v17 = +[NSArray arrayWithObjects:v32 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  [(SPUIContactViewController *)*p_spotlightViewController didMoveToParentViewController:self];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FASpotlightServiceVCProtocol];
}

- (void)updateWithContactIdentifier:(id)a3
{
}

- (SPUIContactViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (void).cxx_destruct
{
}

@end