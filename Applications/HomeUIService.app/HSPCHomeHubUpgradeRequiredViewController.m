@interface HSPCHomeHubUpgradeRequiredViewController
- (HSPCHomeHubUpgradeRequiredViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)handleLearnMoreURL;
- (id)iconDescriptor;
@end

@implementation HSPCHomeHubUpgradeRequiredViewController

- (HSPCHomeHubUpgradeRequiredViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HSPCHomeHubUpgradeRequiredViewController;
  v4 = [(HSPCCenterIconViewController *)&v9 initWithCoordinator:a3 config:a4];
  if (v4)
  {
    v5 = HULocalizedString();
    [(HSPCHomeHubUpgradeRequiredViewController *)v4 setTitle:v5];

    v6 = HULocalizedString();
    [(HSPCHomeHubUpgradeRequiredViewController *)v4 setSubtitle:v6];

    id v7 = [(HSPCHomeHubUpgradeRequiredViewController *)v4 addProminentButtonWithTitleKey:@"HULearnMoreTitle" target:v4 futureSelector:"handleLearnMoreURL"];
  }
  return v4;
}

- (id)iconDescriptor
{
  v2 = +[UIColor hf_keyColor];
  v3 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v2];

  id v4 = objc_alloc((Class)HFImageIconDescriptor);
  id v5 = [v4 initWithSystemImageNamed:HFSymbolIconIdentifierHomeKit configuration:v3];

  return v5;
}

- (id)handleLearnMoreURL
{
  v2 = +[HFOpenURLRouter sharedInstance];
  v3 = +[HFURLComponents homeHub2OnboardingURL];
  id v4 = [v2 openSensitiveURL:v3];

  return +[NAFuture futureWithResult:&off_1000B02E0];
}

@end