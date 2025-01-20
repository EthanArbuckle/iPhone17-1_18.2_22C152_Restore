@interface WFShortcutsSettingsLegalNoticesController
- (id)stringsFileName;
- (int64_t)numberOfParts;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WFShortcutsSettingsLegalNoticesController

- (id)stringsFileName
{
  return @"Acknowledgments";
}

- (int64_t)numberOfParts
{
  return 41;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFShortcutsSettingsLegalNoticesController;
  [(WFShortcutsSettingsLegalNoticesController *)&v10 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.shortcuts/Legal%20Notices"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Legal Notices" table:0 locale:v6 bundleURL:v8];

  [(WFShortcutsSettingsLegalNoticesController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:VCBundleIdentifierShortcutsiOS title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

@end