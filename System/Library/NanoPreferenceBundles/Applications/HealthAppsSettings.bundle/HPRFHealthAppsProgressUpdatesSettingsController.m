@interface HPRFHealthAppsProgressUpdatesSettingsController
+ (id)progressUpdateFrequency;
- (HPRFHealthAppsProgressUpdatesSettingsController)init;
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

@implementation HPRFHealthAppsProgressUpdatesSettingsController

+ (id)progressUpdateFrequency
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanolifestyle"];
  id v3 = [v2 synchronize];
  v4 = [v2 objectForKey:@"ProgressUpdateFrequency"];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (uint64_t)[v4 integerValue];
    if (!v6)
    {
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"PROGRESS_UPDATE_NONE" value:&stru_86D0 table:@"ProgressUpdateFrequency"];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 14400;
  }
  v9 = +[NSNumber numberWithInteger:v6 / 3600];
  v7 = +[NSNumberFormatter localizedStringFromNumber:v9 numberStyle:0];

  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"SELECTED_PROGRESS_UPDATE_%@" value:&stru_86D0 table:@"ProgressUpdateFrequency"];

  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7);

LABEL_6:

  return v8;
}

- (HPRFHealthAppsProgressUpdatesSettingsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFHealthAppsProgressUpdatesSettingsController;
  id v2 = [(HPRFHealthAppsProgressUpdatesSettingsController *)&v6 init];
  uint64_t v3 = objc_opt_new();
  syncManager = v2->_syncManager;
  v2->_syncManager = (NPSManager *)v3;

  return v2;
}

- (id)localizedPaneTitle
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"PROGRESS_UPDATE_PANE_TITLE" value:&stru_86D0 table:@"ProgressUpdateFrequency"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v47 = OBJC_IVAR___PSListController__specifiers;
    v4 = [(HPRFHealthAppsProgressUpdatesSettingsController *)self loadSpecifiersFromPlistName:@"ProgressUpdateFrequency" target:self];
    v5 = [v4 specifierForID:@"ZERO_HOURS_ID"];
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"PROGRESS_UPDATE_NONE" value:&stru_86D0 table:@"ProgressUpdateFrequency"];
    uint64_t v8 = +[NSString stringWithFormat:v7];

    v58 = v5;
    v50 = (void *)v8;
    [v5 setName:v8];
    v9 = [v4 specifierForID:@"TWO_HOURS_ID"];
    uint64_t v10 = +[NSNumberFormatter localizedStringFromNumber:&off_8BA0 numberStyle:0];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"PROGRESS_UPDATE_%@" value:&stru_86D0 table:@"ProgressUpdateFrequency"];
    v56 = (void *)v10;
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10);

    v57 = v9;
    v49 = (void *)v13;
    [v9 setName:v13];
    v14 = [v4 specifierForID:@"FOUR_HOURS_ID"];
    uint64_t v15 = +[NSNumberFormatter localizedStringFromNumber:&off_8BB8 numberStyle:0];
    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"PROGRESS_UPDATE_%@" value:&stru_86D0 table:@"ProgressUpdateFrequency"];
    v54 = (void *)v15;
    uint64_t v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v15);

    v55 = v14;
    v48 = (void *)v18;
    [v14 setName:v18];
    v19 = [v4 specifierForID:@"SIX_HOURS_ID"];
    uint64_t v20 = +[NSNumberFormatter localizedStringFromNumber:&off_8BD0 numberStyle:0];
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"PROGRESS_UPDATE_%@" value:&stru_86D0 table:@"ProgressUpdateFrequency"];
    v52 = (void *)v20;
    uint64_t v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v20);

    v53 = v19;
    v46 = (void *)v23;
    [v19 setName:v23];
    v24 = [v4 specifierForID:@"EIGHT_HOURS_ID"];
    uint64_t v25 = +[NSNumberFormatter localizedStringFromNumber:&off_8BE8 numberStyle:0];
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"PROGRESS_UPDATE_%@" value:&stru_86D0 table:@"ProgressUpdateFrequency"];
    v51 = (void *)v25;
    uint64_t v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v25);

    v29 = v24;
    v45 = (void *)v28;
    [v24 setName:v28];
    v30 = [(HPRFHealthAppsProgressUpdatesSettingsController *)self domainAccessor];
    id v31 = [v30 synchronize];
    v32 = [v30 objectForKey:@"ProgressUpdateFrequency"];
    v33 = v32;
    if (v32) {
      v34 = (uint64_t (*)())[v32 integerValue];
    }
    else {
      v34 = (uint64_t (*)())&loc_3840;
    }
    v35 = +[NSBundle bundleForClass:objc_opt_class()];
    v36 = [v35 localizedStringForKey:@"PROGRESS_UPDATE_GROUP_FOOTER_FORMAT_%@" value:&stru_86D0 table:@"ProgressUpdateFrequency"];

    if ((uint64_t)v34 <= 14399)
    {
      if (!v34)
      {
        v39 = +[NSBundle bundleForClass:objc_opt_class()];
        v37 = [v39 localizedStringForKey:@"PROGRESS_UPDATE_GROUP_FOOTER_NONE" value:&stru_86D0 table:@"ProgressUpdateFrequency"];

        v38 = v58;
        goto LABEL_16;
      }
      if (v34 == (uint64_t (*)())&loc_1C20)
      {
        v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v56);
        v38 = v57;
        goto LABEL_16;
      }
    }
    else
    {
      if (v34 == (uint64_t (*)())&loc_3840)
      {
        v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v54);
        v38 = v55;
        goto LABEL_16;
      }
      if (v34 == objc_release_x26)
      {
        v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v20);
        v38 = v53;
        goto LABEL_16;
      }
      if (v34 == (uint64_t (*)())"g:")
      {
        v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v51);
        v38 = v29;
LABEL_16:
        id v40 = v38;
        v41 = [v4 specifierForID:@"PROGRESS_UPDATE_GROUP_ID"];
        [v41 setProperty:v40 forKey:PSRadioGroupCheckedSpecifierKey];
        [v41 setProperty:v37 forKey:PSFooterTextGroupKey];
        v42 = [(HPRFHealthAppsProgressUpdatesSettingsController *)self localizedPaneTitle];
        [(HPRFHealthAppsProgressUpdatesSettingsController *)self setTitle:v42];

        v43 = *(void **)&self->BPSNotificationAppController_opaque[v47];
        *(void *)&self->BPSNotificationAppController_opaque[v47] = v4;

        uint64_t v3 = *(void **)&self->BPSNotificationAppController_opaque[v47];
        goto LABEL_17;
      }
    }
    sub_4D7C();
  }
LABEL_17:

  return v3;
}

- (NPSDomainAccessor)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v4 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanolifestyle"];
    v5 = self->_domainAccessor;
    self->_domainAccessor = v4;

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HPRFHealthAppsProgressUpdatesSettingsController *)self indexForIndexPath:v6];
  v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  uint64_t v10 = [(HPRFHealthAppsProgressUpdatesSettingsController *)self domainAccessor];
  v11 = [v9 identifier];
  unsigned int v12 = [v11 isEqualToString:@"ZERO_HOURS_ID"];

  id v31 = v6;
  if (v12)
  {
    id v13 = v7;
    uint64_t v14 = 0;
LABEL_11:
    uint64_t v23 = +[NSNumber numberWithInteger:v14];
    [v10 setObject:v23 forKey:@"ProgressUpdateFrequency"];

    id v24 = [v10 synchronize];
    syncManager = self->_syncManager;
    CFStringRef v33 = @"ProgressUpdateFrequency";
    v26 = +[NSArray arrayWithObjects:&v33 count:1];
    v27 = +[NSSet setWithArray:v26];
    [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.nanolifestyle" keys:v27];

    uint64_t v28 = +[NSNumber numberWithBool:v12 ^ 1];
    FIActivityAnalyticsSubmission();

    id v7 = v13;
    id v6 = v31;
    goto LABEL_12;
  }
  uint64_t v15 = [v9 identifier];
  unsigned __int8 v16 = [v15 isEqualToString:@"TWO_HOURS_ID"];

  if (v16)
  {
    id v13 = v7;
    uint64_t v14 = 7200;
    goto LABEL_11;
  }
  v17 = [v9 identifier];
  unsigned __int8 v18 = [v17 isEqualToString:@"FOUR_HOURS_ID"];

  if (v18)
  {
    id v13 = v7;
    uint64_t v14 = 14400;
    goto LABEL_11;
  }
  v19 = [v9 identifier];
  unsigned __int8 v20 = [v19 isEqualToString:@"SIX_HOURS_ID"];

  if (v20)
  {
    id v13 = v7;
    uint64_t v14 = 21600;
    goto LABEL_11;
  }
  v21 = [v9 identifier];
  unsigned int v22 = [v21 isEqualToString:@"EIGHT_HOURS_ID"];

  if (v22)
  {
    id v13 = v7;
    uint64_t v14 = 28800;
    goto LABEL_11;
  }
LABEL_12:
  [(HPRFHealthAppsProgressUpdatesSettingsController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v30 = [(HPRFHealthAppsProgressUpdatesSettingsController *)self specifier];
  [WeakRetained reloadSpecifier:v30];

  v32.receiver = self;
  v32.super_class = (Class)HPRFHealthAppsProgressUpdatesSettingsController;
  [(HPRFHealthAppsProgressUpdatesSettingsController *)&v32 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFHealthAppsProgressUpdatesSettingsController *)self bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
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