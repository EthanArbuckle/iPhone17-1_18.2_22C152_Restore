@interface HSPCThreadRouterWarningViewController
- (HSPCThreadRouterWarningViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)_handleLearnMoreURL;
- (id)handleContinue;
- (id)iconDescriptor;
@end

@implementation HSPCThreadRouterWarningViewController

- (HSPCThreadRouterWarningViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HSPCThreadRouterWarningViewController;
  v7 = [(HSPCCenterIconViewController *)&v28 initWithCoordinator:a3 config:v6];
  if (v7)
  {
    v8 = HULocalizedString();
    [(HSPCThreadRouterWarningViewController *)v7 setTitle:v8];

    v9 = HULocalizedString();
    v10 = [v6 home];
    v11 = [v10 residentDevices];
    id v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = HULocalizedString();

      v9 = (void *)v13;
    }
    v14 = HULocalizedString();
    v15 = +[NSString stringWithFormat:@" %@...", v14];

    id v16 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v29 = NSForegroundColorAttributeName;
    v17 = +[UIColor hf_keyColor];
    v30 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v19 = [v16 initWithString:v15 attributes:v18];

    id v20 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v9];
    [v20 appendAttributedString:v19];
    [(HSPCThreadRouterWarningViewController *)v7 setAttributedSubtitle:v20];
    id v21 = [objc_alloc((Class)HUStringInLabelTapGestureRecognizer) initWithTarget:v7 action:"_handleLearnMoreURL" hitBoxString:v15 userInfo:&__NSDictionary0__struct];
    v22 = [(HSPCThreadRouterWarningViewController *)v7 contentView];
    v23 = [v22 subtitleLabel];
    [v23 setUserInteractionEnabled:1];

    v24 = [(HSPCThreadRouterWarningViewController *)v7 contentView];
    v25 = [v24 subtitleLabel];
    [v25 addGestureRecognizer:v21];

    id v26 = [(HSPCThreadRouterWarningViewController *)v7 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v7 futureSelector:"handleContinue"];
  }

  return v7;
}

- (id)iconDescriptor
{
  v2 = +[UIColor hf_keyColor];
  v3 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v2];

  id v4 = [objc_alloc((Class)HFImageIconDescriptor) initWithSystemImageNamed:@"exclamationmark.triangle.fill" configuration:v3];

  return v4;
}

- (id)handleContinue
{
  return +[NAFuture futureWithResult:&off_1000B0400];
}

- (id)_handleLearnMoreURL
{
  v3 = +[NSURL hf_threadNetworkRequiredLearnMoreURL];
  [(HSPCThreadRouterWarningViewController *)self openURL:v3];

  return +[NAFuture futureWithResult:&off_1000B0418];
}

@end