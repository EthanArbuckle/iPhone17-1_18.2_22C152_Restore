@interface HPRFSessionTrackerPaceSettingViewController
+ (id)selectedPaceViewString;
- (HPRFSessionTrackerPaceSettingViewController)init;
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)syncManager;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)setDomainAccessor:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HPRFSessionTrackerPaceSettingViewController

+ (id)selectedPaceViewString
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanolifestyle.sessiontrackerapp"];
  id v3 = [v2 synchronize];
  unsigned int v4 = [v2 BOOLForKey:@"ShowAveragePace"];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v4) {
    CFStringRef v7 = @"AVERAGE_PACE_LABEL";
  }
  else {
    CFStringRef v7 = @"CURRENT_PACE_LABEL";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v8;
}

- (HPRFSessionTrackerPaceSettingViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)HPRFSessionTrackerPaceSettingViewController;
  id v2 = [(HPRFSessionTrackerPaceSettingViewController *)&v8 init];
  if (v2)
  {
    id v3 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    v5 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanolifestyle.sessiontrackerapp"];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = v5;
  }
  return v2;
}

- (id)localizedPaneTitle
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PACE_VIEW_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  unsigned int v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(HPRFSessionTrackerPaceSettingViewController *)self loadSpecifiersFromPlistName:@"SessionTrackerPaceSettings" target:self];
    v6 = [v5 specifierForID:@"CURRENT_PACE_ID"];
    CFStringRef v7 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v8 = [v7 localizedStringForKey:@"CURRENT_PACE_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v9 = +[NSString stringWithFormat:v8];

    [v6 setName:v9];
    v10 = [v5 specifierForID:@"AVERAGE_PACE_ID"];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"AVERAGE_PACE_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v13 = +[NSString stringWithFormat:v12];

    [v10 setName:v13];
    id v14 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
    if ([(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:@"ShowAveragePace"]) {
      v15 = v10;
    }
    else {
      v15 = v6;
    }
    id v16 = v15;
    v17 = [v5 specifierForID:@"PACE_VIEW_GROUP_ID"];
    [v17 setProperty:v16 forKey:PSRadioGroupCheckedSpecifierKey];

    v18 = [(HPRFSessionTrackerPaceSettingViewController *)self localizedPaneTitle];
    [(HPRFSessionTrackerPaceSettingViewController *)self setTitle:v18];

    v19 = *(void **)&self->BPSNotificationAppController_opaque[v3];
    *(void *)&self->BPSNotificationAppController_opaque[v3] = v5;

    unsigned int v4 = *(void **)&self->BPSNotificationAppController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HPRFSessionTrackerPaceSettingViewController *)self indexForIndexPath:v6];
  v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = [v9 identifier];
  id v11 = [v10 isEqualToString:@"AVERAGE_PACE_ID"];

  if (v11
    || ([v9 identifier],
        v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 isEqualToString:@"CURRENT_PACE_ID"],
        v12,
        v13))
  {
    [(NPSDomainAccessor *)self->_domainAccessor setBool:v11 forKey:@"ShowAveragePace"];
  }
  id v14 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  syncManager = self->_syncManager;
  CFStringRef v21 = @"ShowAveragePace";
  id v16 = +[NSArray arrayWithObjects:&v21 count:1];
  v17 = +[NSSet setWithArray:v16];
  [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.nanolifestyle.sessiontrackerapp" keys:v17];

  [(HPRFSessionTrackerPaceSettingViewController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v19 = [(HPRFSessionTrackerPaceSettingViewController *)self specifier];
  [WeakRetained reloadSpecifier:v19];

  v20.receiver = self;
  v20.super_class = (Class)HPRFSessionTrackerPaceSettingViewController;
  [(HPRFSessionTrackerPaceSettingViewController *)&v20 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFSessionTrackerPaceSettingViewController *)self bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);

  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end