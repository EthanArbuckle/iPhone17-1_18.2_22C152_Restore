@interface ICBSettingsBundleController
+ (id)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
- (ICBSettingsBundleController)initWithParentListController:(id)a3;
- (PSListController)parentListController;
- (PSSpecifier)styleSpecifier;
- (id)incomingCallStyleIcon;
- (id)incomingCallStyleText:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)handleICSPreferencesDidChangeNotification:(id)a3;
- (void)setStyleSpecifier:(id)a3;
@end

@implementation ICBSettingsBundleController

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return (PSListController *)WeakRetained;
}

- (ICBSettingsBundleController)initWithParentListController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICBSettingsBundleController;
  v3 = [(ICBSettingsBundleController *)&v7 initWithParentListController:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    v5 = +[ICSPreferences sharedPreferences];
    [v4 addObserver:v3 selector:"handleICSPreferencesDidChangeNotification:" name:@"ICSPreferencesDidChangeNotification" object:v5];
  }
  return v3;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = +[NSMutableArray array];
  if (_os_feature_enabled_impl())
  {
    v5 = [(ICBSettingsBundleController *)self styleSpecifier];

    if (!v5)
    {
      v6 = [(id)objc_opt_class() localizedStringForKey:@"INCOMING_CALL_STYLE_LIST_TITLE"];
      objc_super v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"incomingCallStyleText:" detail:objc_opt_class() cell:2 edit:0];
      v8 = v7;
      if (v7)
      {
        [v7 setIdentifier:@"INCOMING_CALL_STYLE"];
        v9 = [(ICBSettingsBundleController *)self incomingCallStyleIcon];
        [v8 setProperty:v9 forKey:PSIconImageKey];

        [v4 addObject:v8];
      }
      [(ICBSettingsBundleController *)self setStyleSpecifier:v8];
    }
  }
  id v10 = [v4 copy];

  return v10;
}

+ (id)localizationTableName
{
  return @"ICBSettingsBundle";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [a1 localizationTableName];
  objc_super v7 = [v5 localizedStringForKey:v4 value:&stru_84F8 table:v6];

  return v7;
}

- (id)incomingCallStyleText:(id)a3
{
  return +[ICBSettingsController shortTextForCurrentSelection];
}

- (id)incomingCallStyleIcon
{
  v2 = [(ICBSettingsBundleController *)self parentListController];
  v3 = [v2 specifier];
  id v4 = [v3 identifier];
  unsigned int v5 = [v4 isEqualToString:@"FACETIME"];

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v5) {
    CFStringRef v7 = @"incomingcalls_facetime";
  }
  else {
    CFStringRef v7 = @"incomingcalls_phone";
  }
  v8 = +[UIImage imageNamed:v7 inBundle:v6];

  return v8;
}

- (void)handleICSPreferencesDidChangeNotification:(id)a3
{
  id v5 = [(ICBSettingsBundleController *)self parentListController];
  id v4 = [(ICBSettingsBundleController *)self styleSpecifier];
  [v5 reloadSpecifier:v4];
}

- (PSSpecifier)styleSpecifier
{
  return self->_styleSpecifier;
}

- (void)setStyleSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end