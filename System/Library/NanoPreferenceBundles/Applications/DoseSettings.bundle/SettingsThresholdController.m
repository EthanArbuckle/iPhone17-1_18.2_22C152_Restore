@interface SettingsThresholdController
+ (id)_allSPLOptions;
+ (id)thresholdSPLString;
- (NSNumberFormatter)dBFormatter;
- (SettingsThresholdController)init;
- (id)_specifierWithTitle:(id)a3 subtitle:(id)a4;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)setDBFormatter:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SettingsThresholdController

+ (id)thresholdSPLString
{
  v2 = +[HUNoiseSettings sharedInstance];
  v3 = +[HUNoiseSettings sharedInstance];
  v4 = objc_msgSend(v2, "localizedNoiseThresholdValue:", objc_msgSend(v3, "notificationThreshold"));

  return v4;
}

+ (id)_allSPLOptions
{
  v2 = +[NSMutableArray array];
  uint64_t v3 = 80;
  do
  {
    v4 = +[NSNumber numberWithInt:v3];
    [v2 addObject:v4];

    uint64_t v3 = (v3 + 5);
  }
  while (v3 != 105);

  return v2;
}

- (SettingsThresholdController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SettingsThresholdController;
  v2 = [(SettingsThresholdController *)&v7 init];
  id v3 = objc_alloc_init((Class)NSNumberFormatter);
  [v3 setNumberStyle:1];
  [v3 setMaximumFractionDigits:0];
  [v3 setRoundingMode:2];
  v4 = +[NSNumber numberWithInt:0];
  v5 = [v3 stringFromNumber:v4];
  [v3 setNotANumberSymbol:v5];

  [(SettingsThresholdController *)v2 setDBFormatter:v3];
  return v2;
}

- (id)localizedPaneTitle
{
  v2 = +[HUNoiseSettings sharedInstance];
  id v3 = [v2 noiseThresholdTitleDescription];

  return v3;
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(SettingsThresholdController *)self bundle];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)specifiers
{
  id v3 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    v40 = v3;
    v5 = [(SettingsThresholdController *)self localizedPaneTitle];
    [(SettingsThresholdController *)self setTitle:v5];

    v6 = +[NSMutableArray array];
    objc_super v7 = +[PSSpecifier groupSpecifierWithID:@"THRESHOLD_SPL_GROUP_ID"];
    [v7 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v39 = v7;
    [v6 addObject:v7];
    v8 = +[HUNoiseSettings sharedInstance];
    v9 = [v8 localizedNoiseThresholdValue:0];
    v10 = +[HUNoiseSettings sharedInstance];
    v11 = [v10 localizedNoiseThresholdDetailValue:0];
    v12 = [(SettingsThresholdController *)self _specifierWithTitle:v9 subtitle:v11];

    [v12 setIdentifier:@"OFF"];
    v41 = v6;
    v38 = v12;
    [v6 addObject:v12];
    uint64_t v13 = 0;
    uint64_t v14 = 80;
    v15 = &NSStringFromClass_ptr;
    CFStringRef v16 = @"ID_BPM_";
    do
    {
      v17 = [(id)objc_opt_class() _allSPLOptions];
      v18 = [v17 objectAtIndex:v13];

      v19 = [v15[47] stringWithFormat:@"%@%ld", v16, objc_msgSend(v18, "integerValue")];
      +[HUNoiseSettings sharedInstance];
      v20 = v15;
      v22 = CFStringRef v21 = v16;
      v23 = objc_msgSend(v22, "localizedNoiseThresholdValue:", objc_msgSend(v18, "integerValue"));

      if (v13 >= 5) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = v14;
      }
      v25 = +[HUNoiseSettings sharedInstance];
      v26 = [v25 localizedNoiseThresholdDetailValue:v24];

      v27 = [(SettingsThresholdController *)self _specifierWithTitle:v23 subtitle:v26];
      [v27 setIdentifier:v19];
      [v41 addObject:v27];

      CFStringRef v16 = v21;
      v15 = v20;

      ++v13;
      v14 += 5;
    }
    while (v13 != 5);
    objc_storeStrong(v40, v41);
    id v28 = v38;
    v29 = +[HUNoiseSettings sharedInstance];
    unsigned __int8 v30 = [v29 notificationsEnabled];

    v31 = v28;
    if (v30)
    {
      id v32 = *v40;
      v33 = +[HUNoiseSettings sharedInstance];
      v34 = [v20[47] stringWithFormat:@"%@%ld", v16, objc_msgSend(v33, "notificationThreshold")];
      v31 = [v32 specifierForID:v34];
    }
    [v39 setObject:v31 forKeyedSubscript:PSRadioGroupCheckedSpecifierKey];
    v35 = +[HUNoiseSettings sharedInstance];
    v36 = [v35 noiseThresholdValueFooterDescription];
    [v39 setObject:v36 forKeyedSubscript:PSFooterTextGroupKey];

    id v4 = *v40;
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SettingsThresholdController *)self indexForIndexPath:v7];
  v29 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v9 = [v29 identifier];
  unsigned int v10 = [v9 isEqualToString:@"OFF"];

  if (v10)
  {
    v11 = +[HUNoiseSettings sharedInstance];
    [v11 setNotificationsEnabled:0];

    v12 = +[HUNoiseSettings sharedInstance];
    [v12 setNotificationThreshold:0];
  }
  else
  {
    id v27 = v7;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v26 = self;
    id obj = [(id)objc_opt_class() _allSPLOptions];
    id v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%ld", @"ID_BPM_", [v17 integerValue]);
          v19 = [v29 identifier];
          unsigned int v20 = [v18 isEqualToString:v19];

          if (v20)
          {
            CFStringRef v21 = +[HUNoiseSettings sharedInstance];
            [v21 setNotificationsEnabled:1];

            id v22 = [v17 integerValue];
            v23 = +[HUNoiseSettings sharedInstance];
            [v23 setNotificationThreshold:v22];

            goto LABEL_13;
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    id v7 = v27;
    self = v26;
  }
  [(SettingsThresholdController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v25 = [(SettingsThresholdController *)self specifier];
  [WeakRetained reloadSpecifier:v25];

  v30.receiver = self;
  v30.super_class = (Class)SettingsThresholdController;
  [(SettingsThresholdController *)&v30 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (id)_specifierWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v8 setProperty:v7 forKey:@"EDSpecifierTitleKey"];

  [v8 setProperty:v6 forKey:@"EDSpecifierSubtitleKey"];

  return v8;
}

- (NSNumberFormatter)dBFormatter
{
  return self->_dBFormatter;
}

- (void)setDBFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end