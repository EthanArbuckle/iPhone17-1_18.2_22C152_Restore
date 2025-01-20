@interface ExternalHangTracerFooterView
- (ExternalHangTracerFooterView)initWithSpecifier:(id)a3;
- (PSSpecifier)specifier;
- (void)didTapLearnMore;
- (void)didTapLearnMoreLink;
- (void)didTapOpenSettings;
- (void)setSpecifier:(id)a3;
@end

@implementation ExternalHangTracerFooterView

- (ExternalHangTracerFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ExternalHangTracerFooterView;
  v5 = [(ExternalHangTracerFooterView *)&v21 initWithSpecifier:v4];
  if (v5)
  {
    v6 = HTUIActivationToggleFooterPart1();
    v7 = HTUIActivationToggleFooterPart2();
    v8 = HTUIActivationToggleFooterPartJoiner_Part1_Part2();
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6, v7);

    v10 = [v9 length];
    int64_t v11 = v10 - (unsigned char *)[v7 length];
    id v12 = [v7 length];
    v13 = objc_opt_new();
    unsigned int v14 = [v13 isInternalBuild];

    if (v14)
    {
      v15 = HTUIInternalRedirect();
      v16 = +[NSString localizedStringWithFormat:@"%@%@", v9, v15];

      uint64_t v17 = HTUIAsteriskedRangeFromString();
      uint64_t v19 = v18;
      v9 = [v16 stringByReplacingOccurrencesOfString:@"*" withString:&stru_35910];
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [v4 setProperty:v9 forKey:PSFooterTextGroupKey];
    objc_msgSend(v4, "addFooterHyperlinkWithRange:target:action:", v11, v12, v5, "didTapLearnMore");
    if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v4, "addFooterHyperlinkWithRange:target:action:", v17, v19, v5, "didTapOpenSettings");
    }
    [(ExternalHangTracerFooterView *)v5 setSpecifier:v4];
    [(ExternalHangTracerFooterView *)v5 refreshContentsWithSpecifier:v4];
  }
  return v5;
}

- (void)didTapLearnMore
{
  id v3 = objc_alloc((Class)OBTextWelcomeController);
  id v4 = HTUILearnMoreTitle();
  id v5 = [v3 initWithTitle:v4 detailText:0 symbolName:0 contentLayout:2];

  v6 = HTUILearnMoreWhatAreHangsTitle();
  v7 = HTUILearnMoreWhatAreHangsContent();
  [v5 addSectionWithHeader:v6 content:v7];

  v8 = HTUILearnMoreHUDTitle();
  v9 = HTUILearnMoreHUDContent();
  [v5 addSectionWithHeader:v8 content:v9];

  v10 = HTUILearnMoreLogLimitTitle();
  int64_t v11 = HTUILearnMoreLogLimitContent();
  [v5 addSectionWithHeader:v10 content:v11];

  id v12 = HTUILearnMoreFileTypesTitle();
  [v5 addSectionWithHeader:0 content:v12];

  v13 = HTUILearnMoreFileTypesIPS();
  [v5 addBulletedListItemWithTitle:v13 description:0 accessoryButton:0];

  unsigned int v14 = HTUILearnMoreFileTypesTailspin();
  [v5 addBulletedListItemWithTitle:v14 description:0 accessoryButton:0];

  v15 = HTUILearnMoreFileTypesShare();
  [v5 addSectionWithHeader:0 content:v15];

  v16 = +[OBTextSectionAccessoryButton accessoryButton];
  uint64_t v17 = HTUILearnMoreURL();
  [v16 setTitle:v17 forState:0];

  [v16 addTarget:self action:"didTapLearnMoreLink" forControlEvents:64];
  uint64_t v18 = HTUILearnMoreURLPrefix();
  [v5 addSectionWithHeader:0 content:v18 accessoryButton:v16];

  id v19 = objc_alloc((Class)UIBarButtonItem);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_B4C4;
  v27[3] = &unk_34EB8;
  id v28 = v5;
  id v20 = v5;
  objc_super v21 = +[UIAction actionWithHandler:v27];
  id v22 = [v19 initWithBarButtonSystemItem:0 primaryAction:v21];

  v23 = [v20 navigationItem];
  [v23 setRightBarButtonItem:v22];

  id v24 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v20];
  v25 = [(ExternalHangTracerFooterView *)self specifier];
  v26 = [v25 target];
  [v26 presentModalViewController:v24 withTransition:3];
}

- (void)didTapLearnMoreLink
{
  id v4 = +[UIApplication sharedApplication];
  v2 = HTUILearnMoreURL();
  id v3 = +[NSURL URLWithString:v2];
  [v4 openURL:v3 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)didTapOpenSettings
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  v2 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Internal.Classic/HANGTRACER/"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end