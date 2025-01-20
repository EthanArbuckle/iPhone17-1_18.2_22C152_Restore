@interface HPRFHeartRateThresholdController
+ (BOOL)isDetectionEnabled;
+ (id)detectionEnabledDefaultsKey;
+ (id)footerText;
+ (id)localizedThresholdHeartRateString;
+ (id)localizedThresholdHeartRateStringWithValue:(int64_t)a3;
+ (id)paneTitleLocalizationKey;
+ (id)thresholdHeartRateDefaultsKey;
+ (id)thresholdHeartRateOptions;
+ (int64_t)thresholdHeartRate;
+ (int64_t)thresholdHeartRateDefault;
+ (void)saveThresholdValue:(id)a3;
- (HPRFHeartRateThresholdController)init;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)didSelectThresholdValue:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HPRFHeartRateThresholdController

+ (id)localizedThresholdHeartRateStringWithValue:(int64_t)a3
{
  if (qword_1E748 != -1) {
    dispatch_once(&qword_1E748, &stru_18680);
  }
  v4 = +[HKQuantity _quantityWithBeatsPerMinute:(double)a3];
  id v5 = [objc_alloc((Class)HKGenericQuantityDataProviderCurrentValue) initWithQuantity:v4];
  v6 = [v5 stringWithDisplayType:qword_1E738 unitController:qword_1E740];

  return v6;
}

+ (id)localizedThresholdHeartRateString
{
  if +[_HKHeartSettingsUtilities isHeartRateEnabled](_HKHeartSettingsUtilities, "isHeartRateEnabled")&& +[_HKHeartSettingsUtilities isWristDetectionEnabled](_HKHeartSettingsUtilities, "isWristDetectionEnabled")&& ([a1 isDetectionEnabled])
  {
    v3 = objc_msgSend(a1, "localizedThresholdHeartRateStringWithValue:", objc_msgSend(a1, "thresholdHeartRate"));
  }
  else
  {
    v3 = +[_HKHeartSettingsUtilities heartRateThresholdOffDescription];
  }

  return v3;
}

- (HPRFHeartRateThresholdController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFHeartRateThresholdController;
  v2 = [(HPRFHeartRateThresholdController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;
  }
  return v2;
}

- (id)localizedPaneTitle
{
  v2 = [(id)objc_opt_class() paneTitleLocalizationKey];
  uint64_t v3 = HKHeartRateLocalizedString();

  return v3;
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFHeartRateThresholdController *)self bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    location = v3;
    id v5 = [(HPRFHeartRateThresholdController *)self localizedPaneTitle];
    [(HPRFHeartRateThresholdController *)self setTitle:v5];

    objc_super v6 = +[NSMutableArray array];
    v7 = +[PSSpecifier groupSpecifierWithID:@"THRESHOLD_HEART_RATE_GROUP_ID"];
    [v7 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v26 = v7;
    [v6 addObject:v7];
    v8 = +[_HKHeartSettingsUtilities heartRateThresholdOffDescription];
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v9 setIdentifier:@"OFF"];
    v25 = v9;
    [v6 addObject:v9];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v10 = [(id)objc_opt_class() thresholdHeartRateOptions];
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%ld", @"ID_BPM_", [v15 integerValue]);
          v17 = +[HPRFHeartRateThresholdController localizedThresholdHeartRateStringWithValue:](HPRFHeartRateThresholdController, "localizedThresholdHeartRateStringWithValue:", [v15 integerValue]);
          v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:0 set:0 get:0 detail:0 cell:3 edit:0];
          [v18 setIdentifier:v16];
          [v6 addObject:v18];
        }
        id v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }

    objc_storeStrong(location, v6);
    id v19 = v25;
    v20 = v19;
    if ([(id)objc_opt_class() isDetectionEnabled])
    {
      id v21 = *location;
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%ld", @"ID_BPM_", [(id)objc_opt_class() thresholdHeartRate]);
      v20 = [v21 specifierForID:v22];
    }
    [v26 setObject:v20 forKeyedSubscript:PSRadioGroupCheckedSpecifierKey];
    v23 = [(id)objc_opt_class() footerText];
    [v26 setObject:v23 forKeyedSubscript:PSFooterTextGroupKey];

    id v4 = *location;
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HPRFHeartRateThresholdController *)self indexForIndexPath:v7];
  v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = [v9 identifier];
  unsigned int v11 = [v10 isEqualToString:@"OFF"];

  if (v11)
  {
    [(HPRFHeartRateThresholdController *)self didSelectThresholdValue:0];
  }
  else
  {
    id v22 = v7;
    id v23 = v6;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v21 = self;
    id obj = [(id)objc_opt_class() thresholdHeartRateOptions];
    id v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%ld", @"ID_BPM_", [v16 integerValue]);
          v18 = [v9 identifier];
          unsigned int v19 = [v17 isEqualToString:v18];

          if (v19)
          {
            v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 integerValue]);
            [(HPRFHeartRateThresholdController *)v21 didSelectThresholdValue:v20];

            goto LABEL_13;
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    id v7 = v22;
    id v6 = v23;
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (void)didSelectThresholdValue:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() saveThresholdValue:v4];

  [(HPRFHeartRateThresholdController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  id v5 = [(HPRFHeartRateThresholdController *)self specifier];
  [WeakRetained reloadSpecifier:v5];
}

- (void).cxx_destruct
{
}

+ (BOOL)isDetectionEnabled
{
  uint64_t v2 = sub_517C();
  sub_5160(v2);
  return 0;
}

+ (id)detectionEnabledDefaultsKey
{
  uint64_t v2 = sub_517C();
  sub_5160(v2);
  return 0;
}

+ (int64_t)thresholdHeartRate
{
  uint64_t v2 = sub_517C();
  sub_5160(v2);
  return 0;
}

+ (int64_t)thresholdHeartRateDefault
{
  uint64_t v2 = sub_517C();
  sub_5160(v2);
  return 0;
}

+ (id)thresholdHeartRateDefaultsKey
{
  uint64_t v2 = sub_517C();
  sub_5160(v2);
  return 0;
}

+ (id)thresholdHeartRateOptions
{
  uint64_t v2 = sub_517C();
  sub_5160(v2);
  return 0;
}

+ (void)saveThresholdValue:(id)a3
{
  sub_517C();

  _NSRequestConcreteImplementation(v3);
}

+ (id)footerText
{
  uint64_t v2 = sub_517C();
  sub_5160(v2);
  return 0;
}

+ (id)paneTitleLocalizationKey
{
  uint64_t v2 = sub_517C();
  sub_5160(v2);
  return 0;
}

@end