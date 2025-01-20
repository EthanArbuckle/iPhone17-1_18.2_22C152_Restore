@interface BatteryUILinkSuggestion
- (BatteryUILinkSuggestion)initWithSuggestionType:(int)a3 andData:(id)a4;
- (int)getSuggestionType;
- (int)suggestionType;
- (void)setSuggestionType:(int)a3;
@end

@implementation BatteryUILinkSuggestion

- (BatteryUILinkSuggestion)initWithSuggestionType:(int)a3 andData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v60.receiver = self;
  v60.super_class = (Class)BatteryUILinkSuggestion;
  v7 = [(BatteryUILinkSuggestion *)&v60 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_30;
  }
  [(BatteryUILinkSuggestion *)v7 setSuggestionType:v4];
  v9 = 0;
  if ((int)v4 > 1)
  {
    if (v4 == 10)
    {
      v42 = [v6 objectForKeyedSubscript:@"PLBatteryUIInsightAverageDrainKey"];
      [v42 doubleValue];
      v43 = +[PLBatteryUIUtilities localizedStringWithPercentage:](PLBatteryUIUtilities, "localizedStringWithPercentage:");
      v12 = +[NSString stringWithFormat:@"%@", v43];

      v44 = +[NSString stringWithFormat:@"%@_INFO_TEXT", @"BACKGROUNDUSAGE"];
      v45 = [v6 objectForKeyedSubscript:@"PLBatteryUIInsightBundleIDKey"];
      uint64_t v59 = 0;
      id v46 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v45 allowPlaceholder:1 error:&v59];
      v47 = v46;
      if (v46)
      {
        v48 = [v46 localizedName];
      }
      else
      {
        v48 = 0;
      }
      BOOL v49 = +[CLLocationManager authorizationStatusForBundleIdentifier:v45] == 3;
      if ([v45 isEqualToString:@"BackgroundAppUsageTestApp"])
      {
        [v6 objectForKeyedSubscript:@"PLBatteryUIInsightAppNameKey"];
        uint64_t v51 = v50 = v44;

        BOOL v49 = 1;
        v48 = (void *)v51;
        v44 = v50;
      }
      if (!v49 || !v48 || !v44 || !v45)
      {

        v9 = 0;
        goto LABEL_31;
      }
      [(BatteryUILinkSuggestion *)v8 setTitle:&stru_C3A18];
      [(BatteryUILinkSuggestion *)v8 setDetailControllerClass:NSClassFromString(@"PUILocationServicesAuthorizationLevelController")];
      [(BatteryUILinkSuggestion *)v8 specifier];
      v52 = v58 = v44;
      [v52 setName:v48];

      [(BatteryUILinkSuggestion *)v8 setIdentifier:v45];
      v53 = [(BatteryUILinkSuggestion *)v8 specifier];
      [v53 setObject:v45 forKeyedSubscript:PSLazyIconAppID];

      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (v54 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        v54 = BatteryUILocalization(v58);
      }
      v55 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v54, v48, v12);
      [(BatteryUILinkSuggestion *)v8 setInfoText:v55];

      v56 = [(BatteryUILinkSuggestion *)v8 specifier];
      [v56 setProperty:v45 forKey:PSIDKey];

      v57 = [(BatteryUILinkSuggestion *)v8 specifier];
      [v57 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

LABEL_12:
      v19 = [(BatteryUILinkSuggestion *)v8 title];

      if (!v19)
      {
        v20 = [(BatteryUILinkSuggestion *)v8 identifier];
        v21 = +[NSString stringWithFormat:@"%@_TITLE", v20];

        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v22 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v22 = BatteryUILocalization(v21);
        }
        [(BatteryUILinkSuggestion *)v8 setTitle:v22];
      }
      v23 = objc_opt_new();
      [(BatteryUILinkSuggestion *)v8 setIcon:v23];

      v24 = [(BatteryUILinkSuggestion *)v8 specifier];
      [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconLoading];

      v25 = +[PLBatteryUIUtilities iconUTTypeIdentifierForSuggestion:v4];
      if (v25)
      {
        v26 = [(BatteryUILinkSuggestion *)v8 specifier];
        [v26 setObject:v25 forKeyedSubscript:PSIconUTTypeIdentifierKey];
      }
      v27 = [(BatteryUILinkSuggestion *)v8 infoText];

      if (!v27)
      {
        v28 = [(BatteryUILinkSuggestion *)v8 identifier];
        v29 = +[NSString stringWithFormat:@"%@_INFO_TEXT", v28];

        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v30 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v30 = BatteryUILocalization(v29);
        }
        [(BatteryUILinkSuggestion *)v8 setInfoText:v30];
      }
      uint64_t v31 = [(BatteryUILinkSuggestion *)v8 identifier];
      if (!v31) {
        goto LABEL_29;
      }
      v32 = (void *)v31;
      uint64_t v33 = [(BatteryUILinkSuggestion *)v8 specifier];
      if (v33)
      {
        v34 = (void *)v33;
        v35 = [(BatteryUILinkSuggestion *)v8 infoSpecifier];

        if (!v35)
        {
LABEL_29:

LABEL_30:
          v9 = v8;
          goto LABEL_31;
        }
        v36 = [(BatteryUILinkSuggestion *)v8 identifier];
        v37 = [v36 stringByAppendingString:@"_SPECIFIER"];
        v38 = [(BatteryUILinkSuggestion *)v8 specifier];
        [v38 setIdentifier:v37];

        v32 = [(BatteryUILinkSuggestion *)v8 identifier];
        v39 = [v32 stringByAppendingString:@"_INFO_SPECIFIER"];
        v40 = [(BatteryUILinkSuggestion *)v8 infoSpecifier];
        [v40 setIdentifier:v39];
      }
      goto LABEL_29;
    }
    if (v4 == 2)
    {
      [(BatteryUILinkSuggestion *)v8 setIdentifier:@"REDUCEBRIGHTNESS"];
      v10 = @"DBSSettingsController";
      goto LABEL_9;
    }
  }
  else
  {
    if (!v4)
    {
      [(BatteryUILinkSuggestion *)v8 setIdentifier:@"AUTOBRIGHTNESS"];
      [(BatteryUILinkSuggestion *)v8 setDetailControllerClass:NSClassFromString(@"AXDisplayController")];
      v14 = [(BatteryUILinkSuggestion *)v8 specifier];
      [v14 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

      v15 = [(BatteryUILinkSuggestion *)v8 specifier];
      [v15 setProperty:@"AXDisplayController" forKey:PSDetailControllerClassKey];

      v16 = [(BatteryUILinkSuggestion *)v8 specifier];
      v17 = NSOpenStepRootDirectory();
      v18 = [v17 stringByAppendingString:@"System/Library/PreferenceBundles/AccessibilitySettings.bundle"];
      [v16 setProperty:v18 forKey:PSLazilyLoadedBundleKey];

      v11 = [(BatteryUILinkSuggestion *)v8 specifier];
      v12 = v11;
      uint64_t v13 = PSBundleOverridePrincipalClassKey;
      goto LABEL_11;
    }
    if (v4 == 1)
    {
      [(BatteryUILinkSuggestion *)v8 setIdentifier:@"AUTOLOCK"];
      v10 = @"MyAutoLockController";
LABEL_9:
      [(BatteryUILinkSuggestion *)v8 setDetailControllerClass:NSClassFromString(&v10->isa)];
      v11 = [(BatteryUILinkSuggestion *)v8 specifier];
      v12 = v11;
      uint64_t v13 = PSEnabledKey;
LABEL_11:
      [v11 setProperty:&__kCFBooleanTrue forKey:v13];
      goto LABEL_12;
    }
  }
LABEL_31:

  return v9;
}

- (int)getSuggestionType
{
  return [(BatteryUILinkSuggestion *)self suggestionType];
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(int)a3
{
  self->_suggestionType = a3;
}

@end