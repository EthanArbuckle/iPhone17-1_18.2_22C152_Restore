@interface HSPCMatterAccessoryDoneViewController
- (HFIconDescriptor)iconDescriptor;
- (HSPCMatterAccessoryDoneViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HUIconView)iconView;
- (id)commitConfiguration;
- (id)config;
- (id)coordinator;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setIconView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCMatterAccessoryDoneViewController

- (HSPCMatterAccessoryDoneViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)HUIconView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v9 setIconSize:5];
  v22.receiver = self;
  v22.super_class = (Class)HSPCMatterAccessoryDoneViewController;
  v10 = [(HSPCFixedSizeCenterContentViewController *)&v22 initWithCenterContentView:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a4);
    objc_storeStrong((id *)&v11->_coordinator, a3);
    objc_storeStrong((id *)&v11->_iconView, v9);
    v12 = [v7 activeTuple];
    id v13 = [v7 numberOfAccessoriesInSameCategory];
    v14 = [v7 matterDeviceSetupRequest];
    v15 = [v14 ecosystemName];

    v16 = [v12 accessoryCategoryOrPrimaryServiceType];
    v17 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    if (v13 == (id)1) {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v15, v21);
    }
    else {
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v13, v15);
    }
    [(HSPCMatterAccessoryDoneViewController *)v11 setTitle:v18];

    id v19 = [(HSPCMatterAccessoryDoneViewController *)v11 addProminentDismissButtonWithTitleKey:@"HUDoneTitle"];
  }

  return v11;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HSPCMatterAccessoryDoneViewController;
  [(HSPCFixedSizeCenterContentViewController *)&v5 viewDidLoad];
  v3 = [(HSPCMatterAccessoryDoneViewController *)self iconDescriptor];
  v4 = [(HSPCMatterAccessoryDoneViewController *)self iconView];
  [v4 updateWithIconDescriptor:v3 displayStyle:1 animated:0];
}

- (HFIconDescriptor)iconDescriptor
{
  v3 = [(HSPCMatterAccessoryDoneViewController *)self coordinator];
  v4 = [v3 activeTuple];
  objc_super v5 = [v4 accessoryCategoryOrPrimaryServiceType];
  v6 = +[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:v5];

  id v7 = [(HSPCMatterAccessoryDoneViewController *)self coordinator];
  id v8 = [v7 activeTuple];
  id v9 = [v8 accessory];
  v10 = +[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:v9 iconDescriptor:v6];

  return (HFIconDescriptor *)v10;
}

- (id)commitConfiguration
{
  v2 = [(HSPCMatterAccessoryDoneViewController *)self coordinator];
  uint64_t v3 = [v2 requiresDismissalConfirmation] ^ 1;

  v4 = +[NSNumber numberWithUnsignedInteger:v3];
  objc_super v5 = +[NAFuture futureWithResult:v4];

  return v5;
}

- (id)config
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setConfig:(id)a3
{
}

- (id)coordinator
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end