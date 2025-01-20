@interface ICSSettingsBundleController
+ (id)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
- (ICSSettingsBundleController)initWithParentListController:(id)a3;
- (PSListController)parentListController;
- (PSSpecifier)announceCallsSpecifier;
- (TUUserConfiguration)userConfiguration;
- (id)announceCallStyleIcon;
- (id)announceCallsLabelText:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)propertiesDidChangeForConfiguration:(id)a3;
- (void)setAnnounceCallsSpecifier:(id)a3;
@end

@implementation ICSSettingsBundleController

- (ICSSettingsBundleController)initWithParentListController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSSettingsBundleController;
  v3 = [(ICSSettingsBundleController *)&v7 initWithParentListController:a3];
  if (v3)
  {
    v4 = (TUUserConfiguration *)objc_alloc_init((Class)TUUserConfiguration);
    userConfiguration = v3->_userConfiguration;
    v3->_userConfiguration = v4;

    [(TUUserConfiguration *)v3->_userConfiguration addDelegate:v3 queue:&_dispatch_main_q];
  }
  return v3;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = +[NSMutableArray array];
  v5 = [(ICSSettingsBundleController *)self announceCallsSpecifier];

  if (!v5)
  {
    v6 = [(id)objc_opt_class() localizedStringForKey:@"ANNOUNCE_CALLS_LIST_TITLE"];
    objc_super v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"announceCallsLabelText:" detail:objc_opt_class() cell:2 edit:0];
    v8 = v7;
    if (v7)
    {
      [v7 setIdentifier:@"ANNOUNCE_CALLS"];
      v9 = [(ICSSettingsBundleController *)self announceCallStyleIcon];
      [v8 setProperty:v9 forKey:PSIconImageKey];

      v10 = [(ICSSettingsBundleController *)self userConfiguration];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      [v8 setProperty:v10 forKey:v12];

      [v4 addObject:v8];
    }
    [(ICSSettingsBundleController *)self setAnnounceCallsSpecifier:v8];
  }
  id v13 = [v4 copy];

  return v13;
}

+ (id)localizationTableName
{
  return @"ICSSettingsBundle";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [a1 localizationTableName];
  objc_super v7 = [v5 localizedStringForKey:v4 value:&stru_8868 table:v6];

  return v7;
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return (PSListController *)WeakRetained;
}

- (id)announceCallsLabelText:(id)a3
{
  v3 = [(ICSSettingsBundleController *)self userConfiguration];
  id v4 = +[ICSCallAnnouncementSettingsController localizedlabelTextForAnnounceCallsConfiguration:](ICSCallAnnouncementSettingsController, "localizedlabelTextForAnnounceCallsConfiguration:", [v3 announceCalls]);

  return v4;
}

- (id)announceCallStyleIcon
{
  v2 = [(ICSSettingsBundleController *)self parentListController];
  v3 = [v2 specifier];
  id v4 = [v3 identifier];
  unsigned int v5 = [v4 isEqualToString:@"FACETIME"];

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v5) {
    CFStringRef v7 = @"announcingcalls_facetime";
  }
  else {
    CFStringRef v7 = @"announcingcalls_phone";
  }
  v8 = +[UIImage imageNamed:v7 inBundle:v6];

  return v8;
}

- (void)propertiesDidChangeForConfiguration:(id)a3
{
  id v5 = [(ICSSettingsBundleController *)self parentListController];
  id v4 = [(ICSSettingsBundleController *)self announceCallsSpecifier];
  [v5 reloadSpecifier:v4];
}

- (PSSpecifier)announceCallsSpecifier
{
  return self->_announceCallsSpecifier;
}

- (void)setAnnounceCallsSpecifier:(id)a3
{
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userConfiguration, 0);

  objc_storeStrong((id *)&self->_announceCallsSpecifier, 0);
}

@end