@interface DTNetQualSettingsFooter
- (DTNetQualSettingsFooter)initWithSpecifier:(id)a3;
- (void)_networkQualityOpenURL;
- (void)_openNetworkQualityDetails:(id)a3;
- (void)donePressed;
@end

@implementation DTNetQualSettingsFooter

- (DTNetQualSettingsFooter)initWithSpecifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTNetQualSettingsFooter;
  v6 = [(DTNetQualSettingsFooter *)&v13 initWithSpecifier:v5];
  if (v6)
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"FOOTER_TEXT" value:&stru_35910 table:@"DTNetQualSettings"];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"FOOTER_LEARN" value:&stru_35910 table:@"DTNetQualSettings"];

    v11 = +[NSString stringWithFormat:@"%@ %@", v8, v10];
    objc_storeStrong((id *)&v6->specifier, a3);
    -[DTNetQualSettingsFooter setLinkRange:](v6, "setLinkRange:", (unsigned char *)[v11 length] - (unsigned char *)objc_msgSend(v10, "length"), objc_msgSend(v10, "length"));
    [(DTNetQualSettingsFooter *)v6 setText:v11];
    [(DTNetQualSettingsFooter *)v6 setTarget:v6];
    [(DTNetQualSettingsFooter *)v6 setAction:"_openNetworkQualityDetails:"];
  }
  return v6;
}

- (void)_networkQualityOpenURL
{
  id v3 = +[UIApplication sharedApplication];
  v2 = +[NSURL URLWithString:@"https://support.apple.com/kb/HT212313"];
  [v3 openURL:v2 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)_openNetworkQualityDetails:(id)a3
{
  id v4 = objc_alloc((Class)OBTextWelcomeController);
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"LEARN_TITLE" value:&stru_35910 table:@"DTNetQualSettings"];
  id v27 = [v4 initWithTitle:v6 detailText:0 symbolName:0 contentLayout:2];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"LEARN_SECTION1_TITLE" value:&stru_35910 table:@"DTNetQualSettings"];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = SFLocalizableWAPIStringKeyForKey();
  v11 = [v9 localizedStringForKey:v10 value:&stru_35910 table:@"DTNetQualSettings"];
  [v27 addSectionWithHeader:v8 content:v11];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v13 = [v12 localizedStringForKey:@"LEARN_SECTION2_TITLE" value:&stru_35910 table:@"DTNetQualSettings"];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"LEARN_SECTION2_TEXT" value:&stru_35910 table:@"DTNetQualSettings"];
  [v27 addSectionWithHeader:v13 content:v15];

  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"LEARN_SECTION3_TITLE" value:&stru_35910 table:@"DTNetQualSettings"];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"LEARN_SECTION3_TEXT" value:&stru_35910 table:@"DTNetQualSettings"];
  [v27 addSectionWithHeader:v17 content:v19];

  v20 = +[OBTextSectionAccessoryButton accessoryButton];
  [v20 setTitle:@"https://support.apple.com/kb/HT212313" forState:0];
  [v20 addTarget:self action:"_networkQualityOpenURL" forControlEvents:64];
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"LEARN_KB_TITLE" value:&stru_35910 table:@"DTNetQualSettings"];
  [v27 addSectionWithHeader:0 content:v22 accessoryButton:v20];

  id v23 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"donePressed"];
  v24 = [v27 navigationItem];
  [v24 setRightBarButtonItem:v23];

  id v25 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v27];
  v26 = [(PSSpecifier *)self->specifier target];
  [v26 presentViewController:v25 animated:1 completion:0];
}

- (void)donePressed
{
  id v2 = [(PSSpecifier *)self->specifier target];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
}

@end