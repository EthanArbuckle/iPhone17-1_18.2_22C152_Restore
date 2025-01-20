@interface MUIAppleIntelligenceOnboardingViewController
+ (NSString)continueButtonTitle;
+ (NSString)welcomeTitle;
+ (UIImage)welcomeImage;
+ (id)_imageWithName:(id)a3;
+ (id)_symbolImageWithName:(id)a3;
+ (int64_t)currentAppleIntelligenceOnboardingState;
- (MUIAppleIntelligenceOnboardingViewController)init;
- (void)addBulletListItems;
- (void)continueOnboarding:(id)a3;
@end

@implementation MUIAppleIntelligenceOnboardingViewController

- (MUIAppleIntelligenceOnboardingViewController)init
{
  v3 = +[MUIAppleIntelligenceOnboardingViewController welcomeTitle];
  v4 = +[MUIAppleIntelligenceOnboardingViewController welcomeImage];
  v10.receiver = self;
  v10.super_class = (Class)MUIAppleIntelligenceOnboardingViewController;
  v5 = [(MUIAppleIntelligenceOnboardingViewController *)&v10 initWithTitle:v3 detailText:0 icon:v4 contentLayout:2];

  if (v5)
  {
    [(MUIAppleIntelligenceOnboardingViewController *)v5 setModalPresentationStyle:2];
    [(MUIAppleIntelligenceOnboardingViewController *)v5 setModalInPresentation:1];
    [(MUIAppleIntelligenceOnboardingViewController *)v5 addBulletListItems];
    v6 = [MEMORY[0x1E4F83A80] boldButton];
    v7 = +[MUIAppleIntelligenceOnboardingViewController continueButtonTitle];
    [v6 setTitle:v7 forState:0];

    [v6 addTarget:v5 action:sel_continueOnboarding_ forControlEvents:0x2000];
    v8 = [(MUIAppleIntelligenceOnboardingViewController *)v5 buttonTray];
    [v8 addButton:v6];
  }
  return v5;
}

- (void)continueOnboarding:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults", a3);
  [v3 setBool:1 forKey:*MEMORY[0x1E4F60108]];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"AppleIntelligenceOnboardingViewControllerDidCompleteNotification" object:0];
}

- (void)addBulletListItems
{
  _EFLocalizedString();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = _EFLocalizedString();
  id v4 = +[MUIAppleIntelligenceOnboardingViewController _symbolImageWithName:@"apple.intelligence"];
  v5 = _EFLocalizedString();
  v6 = _EFLocalizedString();
  v7 = +[MUIAppleIntelligenceOnboardingViewController _imageWithName:@"text.line.2.summary"];
  v13 = _EFLocalizedString();
  v8 = _EFLocalizedString();
  v9 = +[MUIAppleIntelligenceOnboardingViewController _imageWithName:@"arrowshape.turn.up.left"];
  objc_super v10 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(MUIAppleIntelligenceOnboardingViewController *)self addBulletedListItemWithTitle:v14 description:v3 image:v4 tintColor:v10];

  v11 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(MUIAppleIntelligenceOnboardingViewController *)self addBulletedListItemWithTitle:v5 description:v6 image:v7 tintColor:v11];

  v12 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(MUIAppleIntelligenceOnboardingViewController *)self addBulletedListItemWithTitle:v13 description:v8 image:v9 tintColor:v12];
}

+ (int64_t)currentAppleIntelligenceOnboardingState
{
  if (!EMIsGreymatterSupportedWithOverride()) {
    return 1;
  }
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F60108]];

  if (v3) {
    return 4;
  }
  if (!_os_feature_enabled_impl()
    || !EMIsGreymatterAvailableWithOverride()
    || !_os_feature_enabled_impl())
  {
    return 2;
  }
  if (EMIsGreymatterAvailableWithOverride()) {
    return 3;
  }
  return 2;
}

+ (NSString)welcomeTitle
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)continueButtonTitle
{
  return (NSString *)_EFLocalizedString();
}

+ (UIImage)welcomeImage
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithType:@"com.apple.application-icon.apple-intelligence"];
  char v3 = objc_opt_new();
  [v3 setShape:0];
  id v4 = [v2 imageForDescriptor:v3];
  v5 = v4;
  if (v4 && [v4 placeholder])
  {
    uint64_t v6 = [v2 prepareImageForDescriptor:v3];

    v5 = (void *)v6;
  }
  uint64_t v7 = [v5 CGImage];
  if (v7)
  {
    v8 = [MEMORY[0x1E4FB1818] imageWithCGImage:v7];
  }
  else
  {
    v8 = 0;
  }

  return (UIImage *)v8;
}

+ (id)_symbolImageWithName:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x1E4FB1818], "mui_imageWithPrivateSystemSymbolName:", a3);
  id v4 = [MEMORY[0x1E4FB1830] configurationPreferringMulticolor];
  v5 = [v3 imageWithSymbolConfiguration:v4];

  return v5;
}

+ (id)_imageWithName:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  uint64_t v6 = [v4 bundleForClass:objc_opt_class()];
  uint64_t v7 = [v3 imageNamed:v5 inBundle:v6];

  v8 = [MEMORY[0x1E4FB1830] configurationPreferringMulticolor];
  v9 = [v7 imageWithSymbolConfiguration:v8];

  return v9;
}

@end