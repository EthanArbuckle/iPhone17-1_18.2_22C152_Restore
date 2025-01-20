@interface HSPCResumeWelcomeViewController
- (HSPCResumeWelcomeViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)commitConfiguration;
- (void)viewDidLoad;
@end

@implementation HSPCResumeWelcomeViewController

- (HSPCResumeWelcomeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HSPCResumeWelcomeViewController;
  v7 = [(HSPCDetectedViewController *)&v15 initWithCoordinator:v6 config:a4];
  if (v7)
  {
    v8 = [v6 activeTuple];
    v9 = [v8 accessoryCategoryOrPrimaryServiceType];

    v10 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    v11 = [v6 activeTuple];
    v12 = [v11 titleForAccessoryWithDefaultValue:v10];
    [(HSPCResumeWelcomeViewController *)v7 setTitle:v12];

    v13 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [(HSPCResumeWelcomeViewController *)v7 setSubtitle:v13];
  }
  return v7;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HSPCResumeWelcomeViewController;
  [(HSPCCenterIconViewController *)&v2 viewDidLoad];
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0130];
}

@end