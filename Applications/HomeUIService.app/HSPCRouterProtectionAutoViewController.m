@interface HSPCRouterProtectionAutoViewController
- (BOOL)_hasNetworkCustomizableAccessories;
- (HSPCRouterProtectionAutoViewController)initWithCoordinator:(id)a3 configurationDelegate:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HUConfigurationViewControllerDelegate)delegate;
- (void)_updateNetworkProtection:(int64_t)a3 andFinishWithActionResult:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCRouterProtectionAutoViewController

- (HSPCRouterProtectionAutoViewController)initWithCoordinator:(id)a3 configurationDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)UIImageView);
  v10 = HUImageNamed();
  id v11 = [v9 initWithImage:v10];

  [v11 setContentMode:1];
  v12 = [v11 image];
  [v12 size];
  double v14 = v13;
  v15 = [v11 image];
  [v15 size];
  double v17 = v14 / v16;

  v39.receiver = self;
  v39.super_class = (Class)HSPCRouterProtectionAutoViewController;
  v18 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v39, "initWithCenterContentView:size:", v11, 160.0, v17 * 160.0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_coordinator, a3);
    objc_storeWeak((id *)&v19->_delegate, v8);
    v20 = HULocalizedString();
    [(HSPCRouterProtectionAutoViewController *)v19 setTitle:v20];

    v21 = HULocalizedString();
    [(HSPCRouterProtectionAutoViewController *)v19 setSubtitle:v21];

    v22 = +[NSURL hf_learnAboutNetworkProtectionURL];
    [(HSPCRouterProtectionAutoViewController *)v19 addLearnMoreButtonWithURL:v22];

    v23 = HULocalizedString();
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100043340;
    v37[3] = &unk_1000AA270;
    v24 = v19;
    v38 = v24;
    v25 = +[PRXAction actionWithTitle:v23 style:0 handler:v37];
    id v26 = [(HSPCRouterProtectionAutoViewController *)v24 addAction:v25];

    v27 = HULocalizedString();
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_100043350;
    v35 = &unk_1000AA270;
    v28 = v24;
    v36 = v28;
    v29 = +[PRXAction actionWithTitle:v27 style:1 handler:&v32];
    id v30 = -[HSPCRouterProtectionAutoViewController addAction:](v28, "addAction:", v29, v32, v33, v34, v35);
  }
  return v19;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSPCRouterProtectionAutoViewController;
  [(HSPCRouterProtectionAutoViewController *)&v5 viewWillAppear:a3];
  v4 = [(HSPCRouterProtectionAutoViewController *)self delegate];
  [v4 viewControllerWillAppear:self];
}

- (BOOL)_hasNetworkCustomizableAccessories
{
  v2 = [(HSPCRouterProtectionAutoViewController *)self coordinator];
  v3 = [v2 activeTuple];
  v4 = [v3 configuration];
  objc_super v5 = [v4 home];

  v6 = [v5 accessoryProtectionGroups];
  if ([v6 count]) {
    unsigned __int8 v7 = [v5 hf_isNetworkProtectionSupportedForAccessories];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)_updateNetworkProtection:(int64_t)a3 andFinishWithActionResult:(unint64_t)a4
{
  unsigned __int8 v7 = [(HSPCRouterProtectionAutoViewController *)self coordinator];
  id v8 = [v7 activeTuple];
  id v9 = [v8 configuration];
  v10 = [v9 home];

  [(HSPCRouterProtectionAutoViewController *)self showActivityIndicatorWithStatus:&stru_1000ABBA8];
  objc_initWeak(&location, self);
  id v11 = [v10 hf_updateNetworkProtection:a3];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000435B4;
  v13[3] = &unk_1000AAC70;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a4;
  id v12 = [v11 addCompletionBlock:v13];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end