@interface BatteryUISuggestion
- (BOOL)isInsight;
- (BatteryUISuggestion)init;
- (BatteryUISuggestion)initWithSuggestionType:(int)a3 andData:(id)a4;
- (NSDictionary)dataDict;
- (NSDictionary)locationDict;
- (int)getSuggestionType;
- (void)enableOptionForTip:(id)a3;
- (void)setDataDict:(id)a3;
- (void)setIsInsight:(BOOL)a3;
- (void)setLocationDict:(id)a3;
@end

@implementation BatteryUISuggestion

- (BatteryUISuggestion)init
{
  v7.receiver = self;
  v7.super_class = (Class)BatteryUISuggestion;
  v2 = [(BatteryUISuggestion *)&v7 init];
  if (v2)
  {
    if (+[PLModelingUtilities isiPhone])
    {
      platformString = v2->_platformString;
      CFStringRef v4 = @"iPhone";
    }
    else if (+[PLModelingUtilities isiPod])
    {
      platformString = v2->_platformString;
      CFStringRef v4 = @"iPod";
    }
    else
    {
      unsigned int v5 = +[PLModelingUtilities isiPad];
      platformString = v2->_platformString;
      if (v5) {
        CFStringRef v4 = @"iPad";
      }
      else {
        CFStringRef v4 = @"Device";
      }
    }
    v2->_platformString = &v4->isa;
  }
  return v2;
}

- (BatteryUISuggestion)initWithSuggestionType:(int)a3 andData:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v8 = [(BatteryUISuggestion *)self init];
  v9 = v8;
  if (!v8) {
    goto LABEL_71;
  }
  v8->_suggestionType = v5;
  v8->_isInsight = 0;
  uint64_t v10 = [v7 objectForKeyedSubscript:@"PLBatteryUILocationDictKey"];
  locationDict = v9->_locationDict;
  v9->_locationDict = (NSDictionary *)v10;

  objc_storeStrong((id *)&v9->_dataDict, a4);
  v69 = v7;
  if ((v5 & 0xFFFFFFFE) != 6)
  {
    v25 = 0;
    uint64_t v26 = 0;
    v27 = 0;
    v13 = 0;
    switch((int)v5)
    {
      case 0:
        uint64_t v26 = [v7 objectForKeyedSubscript:@"PLBatteryUISuggestionEnergyPercentKey"];
        buttonName = v9->_buttonName;
        v9->_buttonName = (NSString *)@"ENABLE";

        v27 = +[NSString stringWithFormat:@"%@_INFO_TEXT", @"AUTOBRIGHTNESS"];
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v29 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v29 = BatteryUILocalization(v27);
        }
        v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v9->_platformString);
        [(BatteryUISuggestion *)v9 setInfoText:v30];

        v25 = 0;
        v13 = @"AUTOBRIGHTNESS";
        goto LABEL_42;
      case 1:
        uint64_t v26 = [v7 objectForKeyedSubscript:@"PLBatteryUISuggestionEnergyPercentKey"];
        v31 = v9->_buttonName;
        v9->_buttonName = (NSString *)@"ENABLE";

        v27 = +[NSString stringWithFormat:@"%@_INFO_TEXT", @"AUTOLOCK"];
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v29 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v29 = BatteryUILocalization(v27);
        }
        v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v9->_platformString);
        [(BatteryUISuggestion *)v9 setInfoText:v32];

        v25 = 0;
        v13 = @"AUTOLOCK";
        goto LABEL_42;
      case 2:
        uint64_t v26 = [v7 objectForKeyedSubscript:@"PLBatteryUISuggestionEnergyPercentKey"];
        v33 = v9->_buttonName;
        v9->_buttonName = (NSString *)@"->";

        v27 = +[NSString stringWithFormat:@"%@_INFO_TEXT", @"REDUCEBRIGHTNESS"];
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v29 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v29 = BatteryUILocalization(v27);
        }
        [(BatteryUISuggestion *)v9 setInfoText:v29];
        v25 = 0;
        v13 = @"REDUCEBRIGHTNESS";
        goto LABEL_42;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 11:
        goto LABEL_43;
      case 8:
        v9->_isInsight = 1;
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v34 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v34 = BatteryUILocalization(@"UPGRADE_INFO_TEXT");
        }
        v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v9->_platformString);
        [(BatteryUISuggestion *)v9 setInfoText:v35];

        v13 = @"UPGRADE";
        goto LABEL_60;
      case 9:
        v9->_isInsight = 1;
        if (_os_feature_enabled_impl())
        {
          if (!+[BatteryUIResourceClass inDemoMode]
            || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"DEVICE_SETUP_INFO_TEXT"), +[BatteryUIResourceClass containerPath], (v36 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
          {
            v37 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DEVICE_SETUP_INFO_TEXT"];
            v36 = BatteryUILocalization(v37);
          }
          [(BatteryUISuggestion *)v9 setInfoText:v36];

          if (!+[BatteryUIResourceClass inDemoMode]
            || (+[BatteryUIResourceClass containerPath],
                (v38 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
          {
            v38 = BatteryUILocalization(@"DEVICE_SETUP_TITLE");
          }
          [(BatteryUISuggestion *)v9 setTitle:v38];

          v25 = 0;
          v67 = 0;
          v68 = 0;
          v13 = @"RESTORE";
        }
        else
        {
          if (!+[BatteryUIResourceClass inDemoMode]
            || (+[BatteryUIResourceClass containerPath],
                (v52 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
          {
            v52 = BatteryUILocalization(@"RESTORE_INFO_TEXT");
          }
          v53 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v52, v9->_platformString);
          [(BatteryUISuggestion *)v9 setInfoText:v53];

          v13 = @"RESTORE";
LABEL_60:
          [(BatteryUISuggestion *)v9 setIdentifier:v13];
          v25 = 0;
          v67 = 0;
          v68 = 0;
        }
        goto LABEL_61;
      case 10:
        v25 = [v7 objectForKeyedSubscript:@"PLBatteryUIInsightAppNameKey"];
        uint64_t v26 = [v7 objectForKeyedSubscript:@"PLBatteryUISuggestionEnergyKey"];
        v39 = +[NSString stringWithFormat:@"%@_INFO_TEXT", @"BACKGROUNDUSAGE"];
        v40 = v39;
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v41 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v41 = BatteryUILocalization(v39);
        }
        v42 = +[NSString stringWithFormat:@"%@%%", v26];
        v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v41, v25, v42);
        [(BatteryUISuggestion *)v9 setInfoText:v43];

        v27 = v40;
        v29 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        v44 = [(BatteryUISuggestion *)v9 specifier];
        [v44 setObject:v29 forKeyedSubscript:PSLazyIconAppID];

        v13 = @"BACKGROUNDUSAGE";
LABEL_42:

        goto LABEL_43;
      case 12:
        v9->_isInsight = 1;
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"ONGOING_UPGRADE_INFO_TEXT"), +[BatteryUIResourceClass containerPath], (v49 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v50 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ONGOING_UPGRADE_INFO_TEXT"];
          v49 = BatteryUILocalization(v50);
        }
        [(BatteryUISuggestion *)v9 setInfoText:v49];

        [(BatteryUISuggestion *)v9 setIdentifier:@"ONGOING_UPGRADE"];
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v51 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v51 = BatteryUILocalization(@"ONGOING_UPGRADE_TITLE");
        }
        [(BatteryUISuggestion *)v9 setTitle:v51];

        v25 = 0;
        v67 = 0;
        v68 = 0;
        v13 = @"ONGOING_UPGRADE";
        goto LABEL_61;
      default:
        uint64_t v26 = 0;
        v27 = 0;
        v13 = 0;
LABEL_43:
        v67 = v27;
        v68 = (void *)v26;
        [(BatteryUISuggestion *)v9 setIdentifier:v13];
        v45 = [(BatteryUISuggestion *)v9 specifier];
        unsigned int v46 = +[BatteryUIResourceClass inDemoMode];
        v47 = v9->_buttonName;
        if (!v46) {
          goto LABEL_46;
        }
        +[BatteryUIResourceClass containerPath];
        v48 = (void *)_CFPreferencesCopyValueWithContainer();
        if (!v48)
        {
          v47 = v9->_buttonName;
LABEL_46:
          v48 = BatteryUILocalization(v47);
        }
        [v45 setProperty:v48 forKey:STStorageTipEnableButtonTitleKey];

        break;
    }
    goto LABEL_61;
  }
  v9->_isInsight = 1;
  v12 = @"BACKGROUNDLOCATION";
  if (v5 == 7) {
    v12 = @"BACKGROUNDCPU";
  }
  v13 = v12;
  [(BatteryUISuggestion *)v9 setIdentifier:v13];
  v14 = v9->_buttonName;
  v9->_buttonName = (NSString *)@"DISABLE";

  v15 = [(BatteryUISuggestion *)v9 specifier];
  unsigned int v16 = +[BatteryUIResourceClass inDemoMode];
  v17 = v9->_buttonName;
  if (v16)
  {
    +[BatteryUIResourceClass containerPath];
    v18 = (void *)_CFPreferencesCopyValueWithContainer();
    if (v18) {
      goto LABEL_9;
    }
    v17 = v9->_buttonName;
  }
  v18 = BatteryUILocalization(v17);
LABEL_9:
  [v15 setProperty:v18 forKey:STStorageTipEnableButtonTitleKey];

  v19 = [v69 objectForKeyedSubscript:@"PLBatteryUIInsightAppNameKey"];
  v20 = [v69 objectForKeyedSubscript:@"PLBatteryUISuggestionPercentKey"];
  [v20 doubleValue];
  v21 = +[PLBatteryUIUtilities localizedStringWithPercentage:](PLBatteryUIUtilities, "localizedStringWithPercentage:");
  v22 = +[NSString stringWithFormat:@"%@_INFO_TEXT", v13, v21];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v23 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v23 = BatteryUILocalization(v22);
  }
  v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v19);
  [(BatteryUISuggestion *)v9 setInfoText:v24];

  v25 = 0;
  v67 = 0;
  v68 = 0;
LABEL_61:
  v54 = [(BatteryUISuggestion *)v9 specifier];
  uint64_t v55 = PSIDKey;
  [v54 setProperty:v13 forKey:PSIDKey];

  v56 = [(BatteryUISuggestion *)v9 infoSpecifier];
  v57 = [(__CFString *)v13 stringByAppendingString:@"_INFO"];
  [v56 setProperty:v57 forKey:v55];

  v58 = +[NSString stringWithFormat:@"%@_TITLE", v13];
  v59 = [(BatteryUISuggestion *)v9 title];
  if (v59)
  {
    v60 = [(BatteryUISuggestion *)v9 title];
    id v7 = v69;
  }
  else
  {
    id v7 = v69;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v60 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v60 = BatteryUILocalization(v58);
    }
  }
  [(BatteryUISuggestion *)v9 setTitle:v60];

  v61 = objc_opt_new();
  [(BatteryUISuggestion *)v9 setIcon:v61];

  v62 = [(BatteryUISuggestion *)v9 specifier];
  [v62 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconLoading];

  v63 = +[PLBatteryUIUtilities iconUTTypeIdentifierForSuggestion:v5];
  if (v63)
  {
    v64 = [(BatteryUISuggestion *)v9 specifier];
    [v64 setObject:v63 forKeyedSubscript:PSIconUTTypeIdentifierKey];
  }
  [(BatteryUISuggestion *)v9 setDelegate:v9];
  if (v9->_isInsight)
  {
    v65 = [(BatteryUISuggestion *)v9 specifier];
    [v65 setProperty:STStorageTipKindActionKey forKey:STStorageTipKindKey];
  }
LABEL_71:

  return v9;
}

- (void)enableOptionForTip:(id)a3
{
  id v4 = a3;
  if (!qword_D7370)
  {
    dispatch_queue_t v5 = dispatch_queue_create("opQ", 0);
    v6 = (void *)qword_D7370;
    qword_D7370 = (uint64_t)v5;
  }
  int suggestionType = self->_suggestionType;
  v8 = self->_locationDict;
  v9 = qword_D7370;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7E70;
  v12[3] = &unk_BE660;
  int v16 = suggestionType;
  id v13 = v4;
  v14 = self;
  v15 = v8;
  uint64_t v10 = v8;
  id v11 = v4;
  dispatch_async(v9, v12);
}

- (int)getSuggestionType
{
  return self->_suggestionType;
}

- (BOOL)isInsight
{
  return self->_isInsight;
}

- (void)setIsInsight:(BOOL)a3
{
  self->_isInsight = a3;
}

- (NSDictionary)locationDict
{
  return self->_locationDict;
}

- (void)setLocationDict:(id)a3
{
}

- (NSDictionary)dataDict
{
  return self->_dataDict;
}

- (void)setDataDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDict, 0);
  objc_storeStrong((id *)&self->_locationDict, 0);
  objc_storeStrong((id *)&self->_platformString, 0);

  objc_storeStrong((id *)&self->_buttonName, 0);
}

@end