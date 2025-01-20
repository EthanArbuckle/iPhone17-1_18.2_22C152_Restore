@interface ICSCallAnnouncementSettingsController
+ (id)localizationTableName;
+ (id)localizedDescriptionForAnnounceCallsConfiguration:(unint64_t)a3;
+ (id)localizedStringForKey:(id)a3;
+ (id)localizedlabelTextForAnnounceCallsConfiguration:(unint64_t)a3;
- (PSSpecifier)alwaysListItemSpecifier;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)handsFreeListItemSpecifier;
- (PSSpecifier)headphonesOnlyListItemSpecifier;
- (PSSpecifier)neverListItemSpecifier;
- (TUUserConfiguration)userConfiguration;
- (id)specifiers;
- (void)donateAnnounceCallsEnabledSignalForState:(unint64_t)a3 previousState:(unint64_t)a4;
- (void)emitNavigationEvent;
- (void)loadDataSource;
- (void)refreshGroupForSpecifier:(id)a3;
- (void)setAlwaysListItemSpecifier:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setHandsFreeListItemSpecifier:(id)a3;
- (void)setHeadphonesOnlyListItemSpecifier:(id)a3;
- (void)setNeverListItemSpecifier:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setUserConfiguration:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSCallAnnouncementSettingsController

+ (id)localizedlabelTextForAnnounceCallsConfiguration:(unint64_t)a3
{
  if (a3 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(id)objc_opt_class() localizedStringForKey:*(&off_8370 + a3)];
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSCallAnnouncementSettingsController;
  [(ICSCallAnnouncementSettingsController *)&v7 viewDidAppear:a3];
  v4 = [(ICSCallAnnouncementSettingsController *)self specifier];
  v5 = [v4 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(ICSCallAnnouncementSettingsController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  uint64_t v3 = [(ICSCallAnnouncementSettingsController *)self specifier];
  v4 = [v3 target];
  v5 = [v4 parentListController];
  id v27 = [v5 specifierID];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v7 = +[NSLocale currentLocale];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  id v10 = [v6 initWithKey:@"Apps" table:0 locale:v7 bundleURL:v9];

  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v10, 0);
  if ([v27 isEqualToString:@"com.apple.preferences.facetime"])
  {
    id v26 = v10;
    id v12 = TUBundleIdentifierFaceTimeApplication;
    id v13 = objc_alloc((Class)_NSLocalizedStringResource);
    v14 = +[NSLocale currentLocale];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    CFStringRef v17 = @"FaceTime";
  }
  else
  {
    if (![v27 isEqualToString:@"com.apple.preferences.phone"]) {
      goto LABEL_6;
    }
    id v26 = v10;
    id v12 = TUBundleIdentifierPhoneApplication;
    id v13 = objc_alloc((Class)_NSLocalizedStringResource);
    v14 = +[NSLocale currentLocale];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    CFStringRef v17 = @"Phone";
  }
  id v18 = [v13 initWithKey:v17 table:0 locale:v14 bundleURL:v16];
  [v11 addObject:v18];

  v19 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", v12, @"ANNOUNCE_CALLS"];
  v20 = +[NSURL URLWithString:v19];
  id v21 = objc_alloc((Class)_NSLocalizedStringResource);
  v22 = +[NSLocale currentLocale];
  v23 = +[NSBundle bundleForClass:objc_opt_class()];
  v24 = [v23 bundleURL];
  id v25 = [v21 initWithKey:@"Announce Calls" table:0 locale:v22 bundleURL:v24];

  [(ICSCallAnnouncementSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v12 title:v25 localizedNavigationComponents:v11 deepLink:v20];
  id v10 = v26;
LABEL_6:
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSCallAnnouncementSettingsController;
  id v5 = [(ICSCallAnnouncementSettingsController *)&v9 specifier];

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)ICSCallAnnouncementSettingsController;
    [(ICSCallAnnouncementSettingsController *)&v8 setSpecifier:v4];
    id v6 = objc_msgSend(v4, "tu_userConfiguration");
    if (v6)
    {
      [(ICSCallAnnouncementSettingsController *)self setUserConfiguration:v6];
    }
    else
    {
      id v7 = objc_alloc_init((Class)TUUserConfiguration);
      [(ICSCallAnnouncementSettingsController *)self setUserConfiguration:v7];
    }
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(ICSCallAnnouncementSettingsController *)self loadSpecifiersFromPlistName:@"ICSCallAnnouncementSettings" target:self];
    if ([v5 count])
    {
      id v6 = [v5 copy];
      id v7 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v6;

      objc_super v8 = [*(id *)&self->PSListController_opaque[v3] specifierForID:@"ANNOUNCE_CALLS_GROUP_ID"];
      [(ICSCallAnnouncementSettingsController *)self setGroupSpecifier:v8];

      objc_super v9 = [*(id *)&self->PSListController_opaque[v3] specifierForID:@"ANNOUNCE_CALLS_LIST_ITEM_ID_ALWAYS"];
      [(ICSCallAnnouncementSettingsController *)self setAlwaysListItemSpecifier:v9];

      id v10 = [*(id *)&self->PSListController_opaque[v3] specifierForID:@"ANNOUNCE_CALLS_LIST_ITEM_ID_NEVER"];
      [(ICSCallAnnouncementSettingsController *)self setNeverListItemSpecifier:v10];

      id v11 = [*(id *)&self->PSListController_opaque[v3] specifierForID:@"ANNOUNCE_CALLS_LIST_ITEM_ID_HANDSFREE"];
      [(ICSCallAnnouncementSettingsController *)self setHandsFreeListItemSpecifier:v11];

      id v12 = [*(id *)&self->PSListController_opaque[v3] specifierForID:@"ANNOUNCE_CALLS_LIST_ITEM_ID_HEADPHONES_ONLY"];
      [(ICSCallAnnouncementSettingsController *)self setHeadphonesOnlyListItemSpecifier:v12];

      [(ICSCallAnnouncementSettingsController *)self loadDataSource];
    }

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICSCallAnnouncementSettingsController;
  id v6 = a4;
  [(ICSCallAnnouncementSettingsController *)&v9 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[ICSCallAnnouncementSettingsController indexForIndexPath:](self, "indexForIndexPath:", v6, v9.receiver, v9.super_class);

  objc_super v8 = [(ICSCallAnnouncementSettingsController *)self specifierAtIndex:v7];
  [(ICSCallAnnouncementSettingsController *)self refreshGroupForSpecifier:v8];
}

+ (id)localizationTableName
{
  return @"ICSCallAnnouncementSettings-AZDENE_FEATURES";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [a1 localizationTableName];
  id v7 = [v5 localizedStringForKey:v4 value:&stru_8868 table:v6];

  return v7;
}

+ (id)localizedDescriptionForAnnounceCallsConfiguration:(unint64_t)a3
{
  uint64_t v3 = @"ANNOUNCE_CALLS_LIST_ITEM_DESCRIPTION_NEVER";
  switch(a3)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      uint64_t v3 = @"ANNOUNCE_CALLS_LIST_ITEM_DESCRIPTION_ALWAYS";
      goto LABEL_6;
    case 2uLL:
      uint64_t v3 = @"ANNOUNCE_CALLS_LIST_ITEM_DESCRIPTION_HANDSFREE";
      goto LABEL_6;
    case 3uLL:
      uint64_t v3 = @"ANNOUNCE_CALLS_LIST_ITEM_DESCRIPTION_HEADPHONES_ONLY";
      goto LABEL_6;
    default:
      uint64_t v3 = 0;
LABEL_6:
      id v4 = objc_alloc_init((Class)TUFeatureFlags);
      if ([v4 announceCalls])
      {
        uint64_t v3 = [(__CFString *)v3 stringByAppendingString:@"_ANSWER"];
      }

LABEL_9:
      id v5 = [(id)objc_opt_class() localizedStringForKey:v3];

      return v5;
  }
}

- (void)loadDataSource
{
  uint64_t v3 = [(ICSCallAnnouncementSettingsController *)self userConfiguration];
  id v4 = [v3 announceCalls];

  switch((unint64_t)v4)
  {
    case 0uLL:
      uint64_t v5 = [(ICSCallAnnouncementSettingsController *)self neverListItemSpecifier];
      goto LABEL_7;
    case 1uLL:
      uint64_t v5 = [(ICSCallAnnouncementSettingsController *)self alwaysListItemSpecifier];
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = [(ICSCallAnnouncementSettingsController *)self handsFreeListItemSpecifier];
      goto LABEL_7;
    case 3uLL:
      uint64_t v5 = [(ICSCallAnnouncementSettingsController *)self headphonesOnlyListItemSpecifier];
LABEL_7:
      id v9 = (id)v5;
      break;
    default:
      id v9 = 0;
      break;
  }
  id v6 = [(ICSCallAnnouncementSettingsController *)self groupSpecifier];
  [v6 setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];

  id v7 = [(id)objc_opt_class() localizedDescriptionForAnnounceCallsConfiguration:v4];
  objc_super v8 = [(ICSCallAnnouncementSettingsController *)self groupSpecifier];
  [v8 setProperty:v7 forKey:PSFooterTextGroupKey];
}

- (void)refreshGroupForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICSCallAnnouncementSettingsController *)self userConfiguration];
  id v6 = [v5 announceCalls];

  id v7 = [(ICSCallAnnouncementSettingsController *)self alwaysListItemSpecifier];

  if (v7 == v4) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = (uint64_t)v6;
  }
  id v9 = [(ICSCallAnnouncementSettingsController *)self handsFreeListItemSpecifier];

  if (v9 == v4) {
    uint64_t v8 = 2;
  }
  id v10 = [(ICSCallAnnouncementSettingsController *)self headphonesOnlyListItemSpecifier];

  if (v10 == v4) {
    uint64_t v8 = 3;
  }
  id v11 = [(ICSCallAnnouncementSettingsController *)self neverListItemSpecifier];

  if (v11 == v4) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v8;
  }
  id v16 = [(id)objc_opt_class() localizedDescriptionForAnnounceCallsConfiguration:v12];
  id v13 = [(ICSCallAnnouncementSettingsController *)self groupSpecifier];
  [v13 setProperty:v16 forKey:PSFooterTextGroupKey];

  v14 = [(ICSCallAnnouncementSettingsController *)self groupSpecifier];
  [(ICSCallAnnouncementSettingsController *)self reloadSpecifier:v14];

  [(ICSCallAnnouncementSettingsController *)self donateAnnounceCallsEnabledSignalForState:v12 previousState:v6];
  v15 = [(ICSCallAnnouncementSettingsController *)self userConfiguration];
  [v15 setAnnounceCalls:v12];
}

- (void)donateAnnounceCallsEnabledSignalForState:(unint64_t)a3 previousState:(unint64_t)a4
{
  if (a3)
  {
    if (!a4) {
      +[ICSTipsHelper donateEventAnnouceCallsEnabled];
    }
  }
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void)setUserConfiguration:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)alwaysListItemSpecifier
{
  return self->_alwaysListItemSpecifier;
}

- (void)setAlwaysListItemSpecifier:(id)a3
{
}

- (PSSpecifier)neverListItemSpecifier
{
  return self->_neverListItemSpecifier;
}

- (void)setNeverListItemSpecifier:(id)a3
{
}

- (PSSpecifier)handsFreeListItemSpecifier
{
  return self->_handsFreeListItemSpecifier;
}

- (void)setHandsFreeListItemSpecifier:(id)a3
{
}

- (PSSpecifier)headphonesOnlyListItemSpecifier
{
  return self->_headphonesOnlyListItemSpecifier;
}

- (void)setHeadphonesOnlyListItemSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headphonesOnlyListItemSpecifier, 0);
  objc_storeStrong((id *)&self->_handsFreeListItemSpecifier, 0);
  objc_storeStrong((id *)&self->_neverListItemSpecifier, 0);
  objc_storeStrong((id *)&self->_alwaysListItemSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);

  objc_storeStrong((id *)&self->_userConfiguration, 0);
}

@end