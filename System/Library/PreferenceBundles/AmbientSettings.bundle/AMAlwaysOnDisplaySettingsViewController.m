@interface AMAlwaysOnDisplaySettingsViewController
- (BOOL)_isMotionToWakeAllowed;
- (BOOL)_isNightModeRequired;
- (id)_ambientDefaults;
- (id)_ambientFeatureName;
- (id)_motionToWakeSpecifierGroup;
- (id)_nightModeEnabled:(id)a3;
- (id)specifiers;
- (void)_updateModeSelectionFromPreferences;
- (void)_updateModeSelectionFromPreferencesAnimated:(BOOL)a3;
- (void)_updateSpecifiersFromPreferences;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AMAlwaysOnDisplaySettingsViewController

- (id)specifiers
{
  v3 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    location = v3;
    v5 = +[NSMutableArray array];
    v6 = AMAmbientSettingsBundle();
    v7 = [v6 localizedStringForKey:@"TURN_DISPLAY_OFF_GROUP_HEADER" value:&stru_8320 table:@"AmbientSettings"];
    v8 = +[PSSpecifier groupSpecifierWithID:@"ALWAYS_ON_DISPLAY_MODE" name:v7];

    [v8 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    objc_storeStrong((id *)&self->_modeGroupSpecifier, v8);
    v38 = v8;
    [v5 addObject:v8];
    v9 = AMAmbientSettingsBundle();
    v10 = [v9 localizedStringForKey:@"ALWAYS_ON_DISPLAY_TURN_OFF_AUTOMATICALLY" value:&stru_8320 table:@"AmbientSettings"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v12 = PSIDKey;
    [v11 setProperty:@"ALWAYS_ON_DISPLAY_TURN_OFF_AUTOMATICALLY" forKey:PSIDKey];
    objc_storeStrong((id *)&self->_modeAutomaticallySpecifier, v11);
    [v5 addObject:v11];
    v13 = AMAmbientSettingsBundle();
    v14 = [v13 localizedStringForKey:@"ALWAYS_ON_DISPLAY_TURN_OFF_AFTER_IDLE" value:&stru_8320 table:@"AmbientSettings"];
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v15 setProperty:@"ALWAYS_ON_DISPLAY_TURN_OFF_AFTER_IDLE" forKey:v12];
    objc_storeStrong((id *)&self->_modeAfterIdleSpecifier, v15);
    v37 = v15;
    [v5 addObject:v15];
    v16 = AMAmbientSettingsBundle();
    v17 = [v16 localizedStringForKey:@"ALWAYS_ON_DISPLAY_TURN_OFF_NEVER" value:&stru_8320 table:@"AmbientSettings"];
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v18 setProperty:@"ALWAYS_ON_DISPLAY_TURN_OFF_NEVER" forKey:v12];
    objc_storeStrong((id *)&self->_modeNeverSpecifier, v18);
    v36 = v18;
    [v5 addObject:v18];
    v19 = AMAmbientSettingsBundle();
    v20 = [v19 localizedStringForKey:@"AT_NIGHT_GROUP_HEADER" value:&stru_8320 table:@"AmbientSettings"];
    v21 = +[PSSpecifier groupSpecifierWithID:@"AT_NIGHT" name:v20];

    v22 = AMAmbientSettingsBundle();
    v23 = [v22 localizedStringForKey:@"NIGHT_MODE_ENABLED_FOOTER" value:&stru_8320 table:@"AmbientSettings"];
    v24 = [(AMAlwaysOnDisplaySettingsViewController *)self _ambientFeatureName];
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24);
    [v21 setProperty:v25 forKey:PSFooterTextGroupKey];

    [v5 addObject:v21];
    v26 = AMAmbientSettingsBundle();
    v27 = [v26 localizedStringForKey:@"NIGHT_MODE_ENABLED" value:&stru_8320 table:@"AmbientSettings"];
    v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:"setPreferenceValue:specifier:" get:"_nightModeEnabled:" detail:0 cell:6 edit:0];

    [v28 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v28 setProperty:@"NIGHT_MODE_ENABLED" forKey:v12];
    [v28 setProperty:@"com.apple.ambient" forKey:PSDefaultsKey];
    [v28 setProperty:@"AMNightModeEnabled" forKey:PSKeyNameKey];
    [v28 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];
    objc_storeStrong((id *)&self->_nightModeEnabledSpecifier, v28);
    [v5 addObject:v28];
    if ([(AMAlwaysOnDisplaySettingsViewController *)self _isMotionToWakeAllowed])
    {
      v29 = [(AMAlwaysOnDisplaySettingsViewController *)self _motionToWakeSpecifierGroup];
      [v5 addObjectsFromArray:v29];
    }
    objc_storeStrong(location, v5);
    [(AMAlwaysOnDisplaySettingsViewController *)self _updateSpecifiersFromPreferences];
    [(BSDefaultObserver *)self->_observerToken invalidate];
    v30 = [(AMAlwaysOnDisplaySettingsViewController *)self _ambientDefaults];
    objc_initWeak(&from, self);
    v31 = +[NSString stringWithUTF8String:"alwaysOnMode"];
    id v32 = &_dispatch_main_q;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_4880;
    v40[3] = &unk_8270;
    objc_copyWeak(&v41, &from);
    v33 = [v30 observeDefault:v31 onQueue:&_dispatch_main_q withBlock:v40];
    observerToken = self->_observerToken;
    self->_observerToken = v33;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&from);

    id v4 = *location;
  }

  return v4;
}

- (void)dealloc
{
  [(BSDefaultObserver *)self->_observerToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AMAlwaysOnDisplaySettingsViewController;
  [(AMAlwaysOnDisplaySettingsViewController *)&v3 dealloc];
}

- (id)_motionToWakeSpecifierGroup
{
  objc_super v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier groupSpecifierWithID:@"MOTION_TO_WAKE_GROUP"];
  v5 = AMAmbientSettingsBundle();
  v6 = [v5 localizedStringForKey:@"MOTION_TO_WAKE_ENABLED_FOOTER" value:&stru_8320 table:@"AmbientSettings"];
  v7 = [(AMAlwaysOnDisplaySettingsViewController *)self _ambientFeatureName];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);
  [v4 setProperty:v8 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  v9 = AMAmbientSettingsBundle();
  v10 = [v9 localizedStringForKey:@"MOTION_TO_WAKE_ENABLED" value:&stru_8320 table:@"AmbientSettings"];
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v11 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v11 setProperty:@"MOTION_TO_WAKE_ENABLED" forKey:PSIDKey];
  [v11 setProperty:@"com.apple.ambient" forKey:PSDefaultsKey];
  [v11 setProperty:@"AMMotionToWakeEnabled" forKey:PSKeyNameKey];
  [v11 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];
  [v3 addObject:v11];

  return v3;
}

- (void)_updateSpecifiersFromPreferences
{
  objc_super v3 = [(AMAlwaysOnDisplaySettingsViewController *)self _ambientDefaults];
  unint64_t v4 = (unint64_t)[v3 alwaysOnMode];

  if (v4 > 2)
  {
    id v7 = 0;
    CFStringRef v6 = &stru_8320;
  }
  else
  {
    v5 = off_82B0[v4];
    CFStringRef v6 = *(&off_82C8 + v4);
    id v7 = *(id *)&self->PSListController_opaque[*v5];
  }
  id v14 = v7;
  [(PSSpecifier *)self->_modeGroupSpecifier setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
  modeGroupSpecifier = self->_modeGroupSpecifier;
  v9 = AMAmbientSettingsBundle();
  v10 = [@"ALWAYS_ON_DISPLAY_TURN_OFF_FOOTER" stringByAppendingString:v6];
  v11 = [v9 localizedStringForKey:v10 value:&stru_8320 table:@"AmbientSettings"];
  [(PSSpecifier *)modeGroupSpecifier setProperty:v11 forKey:PSFooterTextGroupKey];

  uint64_t v12 = [(AMAlwaysOnDisplaySettingsViewController *)self specifierForID:@"NIGHT_MODE_ENABLED"];
  v13 = +[NSNumber numberWithInt:[(AMAlwaysOnDisplaySettingsViewController *)self _isNightModeRequired] ^ 1];
  [v12 setProperty:v13 forKey:PSEnabledKey];
}

- (void)_updateModeSelectionFromPreferences
{
}

- (void)_updateModeSelectionFromPreferencesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[PSSpecifierUpdates updatesWithSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers]];
  [(AMAlwaysOnDisplaySettingsViewController *)self _updateSpecifiersFromPreferences];
  [(AMAlwaysOnDisplaySettingsViewController *)self reloadSpecifier:self->_modeGroupSpecifier];
  unsigned int v6 = [(AMAlwaysOnDisplaySettingsViewController *)self _isMotionToWakeAllowed];
  id v7 = [(AMAlwaysOnDisplaySettingsViewController *)self _motionToWakeSpecifierGroup];
  v8 = [v7 firstObject];
  v9 = [v8 identifier];
  id v10 = [(AMAlwaysOnDisplaySettingsViewController *)self indexOfSpecifierID:v9];

  if (v6 && v10 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [v5 insertContiguousSpecifiers:v7 afterSpecifierWithID:@"NIGHT_MODE_ENABLED"];
  }
  else
  {
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
      char v11 = 1;
    }
    else {
      char v11 = v6;
    }
    if ((v11 & 1) == 0)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "identifier", (void)v19);
            [v5 removeSpecifierWithID:v17];
          }
          id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }
    }
  }
  objc_msgSend(v5, "reloadSpecifier:", self->_nightModeEnabledSpecifier, (void)v19);
  v18 = [v5 context];
  [v18 setAnimated:v3];

  [(AMAlwaysOnDisplaySettingsViewController *)self performSpecifierUpdates:v5];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AMAlwaysOnDisplaySettingsViewController;
  id v6 = a4;
  [(AMAlwaysOnDisplaySettingsViewController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[AMAlwaysOnDisplaySettingsViewController indexForIndexPath:](self, "indexForIndexPath:", v6, v12.receiver, v12.super_class);

  v8 = [(AMAlwaysOnDisplaySettingsViewController *)self specifierAtIndex:v7];
  v9 = [(AMAlwaysOnDisplaySettingsViewController *)self _ambientDefaults];
  id v10 = v9;
  if (v8 == self->_modeNeverSpecifier)
  {
    uint64_t v11 = 2;
    goto LABEL_7;
  }
  if (v8 == self->_modeAfterIdleSpecifier)
  {
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  if (v8 == self->_modeAutomaticallySpecifier)
  {
    uint64_t v11 = 1;
LABEL_7:
    [v9 setAlwaysOnMode:v11];
  }
}

- (id)_ambientFeatureName
{
  v2 = AMAmbientSettingsBundle();
  BOOL v3 = [v2 localizedStringForKey:@"AMBIENT_FEATURE_NAME" value:&stru_8320 table:@"AmbientSettings"];

  return v3;
}

- (id)_ambientDefaults
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_8290);
  }
  v2 = (void *)qword_C620;

  return v2;
}

- (BOOL)_isNightModeRequired
{
  v2 = [(AMAlwaysOnDisplaySettingsViewController *)self _ambientDefaults];
  BOOL v3 = [v2 alwaysOnMode] == (char *)&dword_0 + 2;

  return v3;
}

- (BOOL)_isMotionToWakeAllowed
{
  v2 = [(AMAlwaysOnDisplaySettingsViewController *)self _ambientDefaults];
  BOOL v3 = [v2 alwaysOnMode] == (char *)&dword_0 + 1
    && _AXSAttentionAwarenessFeaturesEnabled() != 0;

  return v3;
}

- (id)_nightModeEnabled:(id)a3
{
  if ([(AMAlwaysOnDisplaySettingsViewController *)self _isNightModeRequired])
  {
    unint64_t v4 = +[NSNumber numberWithInt:1];
  }
  else
  {
    v5 = [(AMAlwaysOnDisplaySettingsViewController *)self _ambientDefaults];
    unint64_t v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 nightModeEnabled]);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_nightModeEnabledSpecifier, 0);
  objc_storeStrong((id *)&self->_modeNeverSpecifier, 0);
  objc_storeStrong((id *)&self->_modeAfterIdleSpecifier, 0);
  objc_storeStrong((id *)&self->_modeAutomaticallySpecifier, 0);

  objc_storeStrong((id *)&self->_modeGroupSpecifier, 0);
}

@end