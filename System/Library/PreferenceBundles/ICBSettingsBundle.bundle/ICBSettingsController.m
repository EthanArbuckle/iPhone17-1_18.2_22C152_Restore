@interface ICBSettingsController
+ (id)localizationTableName;
+ (id)localizedDescriptionForStyle:(BOOL)a3;
+ (id)localizedStringForKey:(id)a3;
+ (id)shortTextForCurrentSelection;
- (PSSpecifier)bannerSpecifier;
- (PSSpecifier)fullScreenSpecifier;
- (PSSpecifier)groupSpecifier;
- (id)specifiers;
- (int64_t)controllerParent;
- (void)emitNavigationEvent;
- (void)loadDataSource;
- (void)refreshGroupForSpecifier:(id)a3;
- (void)setBannerSpecifier:(id)a3;
- (void)setFullScreenSpecifier:(id)a3;
- (void)setGroupAliasLabelText;
- (void)setGroupFooterText;
- (void)setGroupSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICBSettingsController

+ (id)shortTextForCurrentSelection
{
  v3 = +[ICSPreferences sharedPreferences];
  v4 = objc_msgSend(a1, "localizedDescriptionForStyle:", objc_msgSend(v3, "hasBannersEnabled"));

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICBSettingsController;
  [(ICBSettingsController *)&v7 viewDidAppear:a3];
  v4 = [(ICBSettingsController *)self specifier];
  v5 = [v4 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(ICBSettingsController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  v4 = +[NSLocale currentLocale];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 bundleURL];
  id v22 = [v3 initWithKey:@"Apps" table:0 locale:v4 bundleURL:v6];

  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v22, 0);
  if ([(ICBSettingsController *)self controllerParent])
  {
    if ((char *)[(ICBSettingsController *)self controllerParent] != (char *)&dword_0 + 1) {
      goto LABEL_6;
    }
    id v8 = objc_alloc((Class)_NSLocalizedStringResource);
    v9 = +[NSLocale currentLocale];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 bundleURL];
    id v12 = [v8 initWithKey:@"FaceTime" table:0 locale:v9 bundleURL:v11];
    CFStringRef v13 = @"com.apple.facetime";
  }
  else
  {
    id v14 = objc_alloc((Class)_NSLocalizedStringResource);
    v9 = +[NSLocale currentLocale];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 bundleURL];
    id v12 = [v14 initWithKey:@"Phone" table:0 locale:v9 bundleURL:v11];
    CFStringRef v13 = @"com.apple.mobilephone";
  }
  [v7 addObject:v12];

  v15 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", v13, @"INCOMING_CALL_STYLE"];
  v16 = +[NSURL URLWithString:v15];
  id v17 = objc_alloc((Class)_NSLocalizedStringResource);
  v18 = +[NSLocale currentLocale];
  v19 = +[NSBundle bundleForClass:objc_opt_class()];
  v20 = [v19 bundleURL];
  id v21 = [v17 initWithKey:@"Incoming Calls" table:0 locale:v18 bundleURL:v20];

  [(ICBSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v13 title:v21 localizedNavigationComponents:v7 deepLink:v16];
LABEL_6:
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(ICBSettingsController *)self loadSpecifiersFromPlistName:@"ICBSettingsBundle" target:self];
    if ([v5 count])
    {
      id v6 = [v5 copy];
      id v7 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v6;

      id v8 = [*(id *)&self->PSListController_opaque[v3] specifierForID:@"INCOMING_CALL_STYLE_GROUP_ID"];
      [(ICBSettingsController *)self setGroupSpecifier:v8];

      v9 = [*(id *)&self->PSListController_opaque[v3] specifierForID:@"INCOMING_CALL_STYLE_LIST_ITEM_ID_BANNER"];
      [(ICBSettingsController *)self setBannerSpecifier:v9];

      v10 = [*(id *)&self->PSListController_opaque[v3] specifierForID:@"INCOMING_CALL_STYLE_LIST_ITEM_ID_FULL_SCREEN"];
      [(ICBSettingsController *)self setFullScreenSpecifier:v10];

      [(ICBSettingsController *)self setGroupAliasLabelText];
      [(ICBSettingsController *)self setGroupFooterText];
      [(ICBSettingsController *)self loadDataSource];
    }

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICBSettingsController;
  id v6 = a4;
  [(ICBSettingsController *)&v9 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[ICBSettingsController indexForIndexPath:](self, "indexForIndexPath:", v6, v9.receiver, v9.super_class);

  id v8 = [(ICBSettingsController *)self specifierAtIndex:v7];
  [(ICBSettingsController *)self refreshGroupForSpecifier:v8];
}

+ (id)localizationTableName
{
  return @"ICBSettingsBundle";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [a1 localizationTableName];
  id v7 = [v5 localizedStringForKey:v4 value:&stru_84F8 table:v6];

  return v7;
}

+ (id)localizedDescriptionForStyle:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"INCOMING_CALL_STYLE_LIST_BANNER";
  }
  else {
    CFStringRef v3 = @"INCOMING_CALL_STYLE_LIST_FULL_SCREEN";
  }
  id v4 = [a1 localizedStringForKey:v3];

  return v4;
}

- (void)loadDataSource
{
  CFStringRef v3 = +[ICSPreferences sharedPreferences];
  unsigned int v4 = [v3 hasBannersEnabled];

  if (v4) {
    [(ICBSettingsController *)self bannerSpecifier];
  }
  else {
  id v6 = [(ICBSettingsController *)self fullScreenSpecifier];
  }
  v5 = [(ICBSettingsController *)self groupSpecifier];
  [v5 setProperty:v6 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (void)setGroupAliasLabelText
{
  CFStringRef v3 = +[FTDeviceSupport sharedInstance];
  unsigned int v4 = (char *)[v3 deviceType];

  if (v4 == (unsigned char *)&dword_0 + 3)
  {
    v5 = objc_opt_class();
    CFStringRef v6 = @"INCOMING_CALL_STYLE_ALIAS_LABEL_IPOD";
  }
  else
  {
    id v7 = +[FTDeviceSupport sharedInstance];
    id v8 = (int *)[v7 deviceType];

    v5 = objc_opt_class();
    if (v8 == &dword_4) {
      CFStringRef v6 = @"INCOMING_CALL_STYLE_ALIAS_LABEL_IPAD";
    }
    else {
      CFStringRef v6 = @"INCOMING_CALL_STYLE_ALIAS_LABEL_IPHONE";
    }
  }
  id v11 = [v5 localizedStringForKey:v6];
  objc_super v9 = [(ICBSettingsController *)self groupSpecifier];
  [v9 setProperty:v11 forKey:PSTitleKey];

  v10 = [(ICBSettingsController *)self groupSpecifier];
  [v10 setName:v11];
}

- (void)setGroupFooterText
{
  CFStringRef v3 = +[FTDeviceSupport sharedInstance];
  unsigned int v4 = (char *)[v3 deviceType];

  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    int64_t v5 = [(ICBSettingsController *)self controllerParent];
    CFStringRef v6 = objc_opt_class();
    if (v5 == 1) {
      CFStringRef v7 = @"INCOMING_CALL_STYLE_FACETIME_FOOTER_IPHONE";
    }
    else {
      CFStringRef v7 = @"INCOMING_CALL_STYLE_PHONE_FOOTER_IPHONE";
    }
  }
  else
  {
    CFStringRef v6 = objc_opt_class();
    CFStringRef v7 = @"INCOMING_CALL_STYLE_FACETIME_FOOTER_OTHER";
  }
  id v9 = [v6 localizedStringForKey:v7];
  id v8 = [(ICBSettingsController *)self groupSpecifier];
  [v8 setProperty:v9 forKey:PSFooterTextGroupKey];
}

- (void)refreshGroupForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBSettingsController *)self bannerSpecifier];

  CFStringRef v6 = [(ICBSettingsController *)self groupSpecifier];
  [(ICBSettingsController *)self reloadSpecifier:v6];

  CFStringRef v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5 == v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "setting hasBannersEnabled to %d", (uint8_t *)v9, 8u);
  }

  id v8 = +[ICSPreferences sharedPreferences];
  [v8 setHasBannersEnabled:v5 == v4];
}

- (int64_t)controllerParent
{
  v2 = [(ICBSettingsController *)self specifier];
  CFStringRef v3 = [v2 target];
  id v4 = [v3 parentListController];
  id v5 = [v4 specifierID];
  unsigned int v6 = [v5 isEqualToString:@"com.apple.preferences.facetime"];

  return v6;
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)bannerSpecifier
{
  return self->_bannerSpecifier;
}

- (void)setBannerSpecifier:(id)a3
{
}

- (PSSpecifier)fullScreenSpecifier
{
  return self->_fullScreenSpecifier;
}

- (void)setFullScreenSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenSpecifier, 0);
  objc_storeStrong((id *)&self->_bannerSpecifier, 0);

  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end