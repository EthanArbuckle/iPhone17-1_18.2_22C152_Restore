@interface HSPCDetectedPairedAccessoryViewController
- (HSPCDetectedPairedAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)commitConfiguration;
- (id)config;
- (id)coordinator;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCDetectedPairedAccessoryViewController

- (HSPCDetectedPairedAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 category];
  v10 = [v9 categoryType];

  id v11 = [objc_alloc((Class)HUHomeAccessoryTileView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v17.receiver = self;
  v17.super_class = (Class)HSPCDetectedPairedAccessoryViewController;
  v12 = [(HSPCDetectedViewController *)&v17 initWithCenterContentView:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [(HSPCDetectedPairedAccessoryViewController *)v13 setTitle:v14];

    id v15 = [(HSPCDetectedPairedAccessoryViewController *)v13 addProminentDismissButtonWithTitleKey:@"HUOkTitle"];
  }

  return v13;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B03A0];
}

- (id)config
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setConfig:(id)a3
{
}

- (id)coordinator
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end