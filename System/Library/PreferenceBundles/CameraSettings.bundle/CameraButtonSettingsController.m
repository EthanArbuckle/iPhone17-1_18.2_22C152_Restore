@interface CameraButtonSettingsController
- (CameraCaptureButtonAppConfigurationCoordinator)_appConfigurationCoordinator;
- (NSSet)_eligibleAppsBundleIDs;
- (NSString)_associatedAppBundleID;
- (id)_createSpecifiers;
- (id)_eligibleAppsSpecifiers;
- (id)_listItemSpecifierForBundleID:(id)a3 appAuthorized:(BOOL)a4;
- (id)_localizedTitleForGesture:(int64_t)a3;
- (id)specifiers;
- (int64_t)_selectedLaunchGesture;
- (void)_setupAppConfigurationCoordinatorIfNecessary;
- (void)emitNavigationEvent;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CameraButtonSettingsController

- (id)specifiers
{
  [(CameraButtonSettingsController *)self _setupAppConfigurationCoordinatorIfNecessary];
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(CameraButtonSettingsController *)self _createSpecifiers];
    +[CameraSettingsBaseController allowMultilineTitlesForSpecifiers:v5];
    id v6 = [v5 copy];
    v7 = *(void **)&self->super.PSListController_opaque[v3];
    *(void *)&self->super.PSListController_opaque[v3] = v6;

    v4 = *(void **)&self->super.PSListController_opaque[v3];
  }

  return v4;
}

- (id)_createSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = sub_878C(@"CAPTURE_BUTTON_CAPTURE_FOOTER");
  v5 = sub_878C(@"CAPTURE_BUTTON_LIGHT_PRESS_TITLE");
  id v6 = +[PSSpecifier groupSpecifierWithName:v5];

  uint64_t v47 = PSFooterTextGroupKey;
  v43 = (void *)v4;
  objc_msgSend(v6, "setProperty:forKey:", v4);
  uint64_t v46 = PSIDKey;
  objc_msgSend(v6, "setProperty:forKey:", @"CameraCaptureButtonGroupSpecifier");
  uint64_t v44 = PSIsRadioGroupKey;
  objc_msgSend(v6, "setProperty:forKey:", &__kCFBooleanTrue);
  v42 = v6;
  [v3 addObject:v6];
  v7 = sub_878C(@"HIDE_CAMERA_CONTROLS");
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  uint64_t v9 = PSDefaultsKey;
  [v8 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
  uint64_t v10 = PSKeyNameKey;
  [v8 setObject:@"systemOverlay.hidesClientControls" forKeyedSubscript:PSKeyNameKey];
  uint64_t v11 = PSDefaultValueKey;
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
  [v8 setIdentifier:@"CAMERA_BUTTON_HIDE_CONTROLS_SWITCH"];
  v41 = v8;
  [v3 addObject:v8];
  v12 = sub_878C(@"LOCK_TO_FOCUS");
  v13 = self;
  v14 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v14 setObject:@"com.apple.camera" forKeyedSubscript:v9];
  [v14 setObject:@"systemOverlay.focusLockEnabled" forKeyedSubscript:v10];
  [v14 setObject:&__kCFBooleanFalse forKeyedSubscript:v11];
  [v14 setIdentifier:@"CAMERA_BUTTON_LOCK_FOCUS_SWITCH"];
  v40 = v14;
  [v3 addObject:v14];
  v15 = sub_878C(@"CAPTURE_BUTTON_LAUNCH_APP_TITLE");
  v16 = +[PSSpecifier groupSpecifierWithName:v15];

  [v16 setProperty:&__kCFBooleanTrue forKey:v44];
  [v16 setObject:@"CAMAppLaunchGroupSpecifier" forKeyedSubscript:v46];
  v17 = sub_878C(@"CAPTURE_BUTTON_APP_LAUNCH_FOOTER");
  [v16 setObject:v17 forKeyedSubscript:v47];

  v18 = v3;
  v45 = v16;
  [v3 addObject:v16];
  v19 = +[NSMutableDictionary dictionaryWithCapacity:3];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v20 = [&off_24D50 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v50;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(&off_24D50);
        }
        v24 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v25 = -[CameraButtonSettingsController _localizedTitleForGesture:](v13, "_localizedTitleForGesture:", [v24 integerValue]);
        v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:0 set:0 get:0 detail:0 cell:3 edit:0];
        [v26 setProperty:v24 forKey:@"CAMAppLaunchGestureProperty"];
        [v18 addObject:v26];
        [v19 setObject:v26 forKeyedSubscript:v24];
      }
      id v21 = [&off_24D50 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v21);
  }
  v27 = +[NSNumber numberWithInteger:[(CameraButtonSettingsController *)v13 _selectedLaunchGesture]];
  v28 = [v19 objectForKeyedSubscript:v27];
  uint64_t v29 = PSRadioGroupCheckedSpecifierKey;
  [v45 setProperty:v28 forKey:PSRadioGroupCheckedSpecifierKey];

  v30 = +[PSSpecifier groupSpecifierWithID:@"appListGroup"];
  [v30 setProperty:&__kCFBooleanTrue forKey:v44];
  [v30 setObject:@"CAMAppListGroupSpecifier" forKeyedSubscript:v46];
  v31 = sub_878C(@"CAMERA_BUTTON_APP_LIST_FOOTER");
  [v30 setObject:v31 forKeyedSubscript:v47];

  v32 = v18;
  [v18 addObject:v30];
  v33 = [(CameraButtonSettingsController *)v13 _eligibleAppsSpecifiers];
  [v18 addObjectsFromArray:v33];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_88F8;
  v48[3] = &unk_20760;
  v48[4] = v13;
  id v34 = [v33 indexOfObjectPassingTest:v48];
  if (v34 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v35 = 0;
  }
  else
  {
    v35 = [v33 objectAtIndexedSubscript:v34];
  }
  [v30 setProperty:v35 forKey:v29];
  v36 = +[PSSpecifier groupSpecifierWithID:@"accessiblityGroup"];
  [v18 addObject:v36];
  v37 = sub_878C(@"CAMERA_BUTTON_ACCESSIBILITY");
  v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:v13 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v32 addObject:v38];

  return v32;
}

- (id)_eligibleAppsSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = [(CameraButtonSettingsController *)self _eligibleAppsBundleIDs];
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_8AAC;
  v13 = &unk_20788;
  v14 = self;
  id v5 = v3;
  id v15 = v5;
  [v4 enumerateObjectsUsingBlock:&v10];

  objc_msgSend(v5, "sortUsingComparator:", &stru_207C8, v10, v11, v12, v13, v14);
  id v6 = [(CameraButtonSettingsController *)self _listItemSpecifierForBundleID:0 appAuthorized:1];
  [v5 addObject:v6];

  v7 = v15;
  id v8 = v5;

  return v8;
}

- (id)_listItemSpecifierForBundleID:(id)a3 appAuthorized:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6) {
    +[CameraSettingsUtilities displayNameForBundleID:v6];
  }
  else {
  v7 = sub_878C(@"CAMERA_BUTTON_APP_LIST_NO_ACTION");
  }
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];
  uint64_t v9 = v8;
  if (v6)
  {
    [v8 setIdentifier:v6];
    [v9 setProperty:v6 forKey:PSLazyIconAppID];
    [v9 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
    uint64_t v10 = +[NSNumber numberWithBool:v4];
    uint64_t v11 = &PSEnabledKey;
  }
  else
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = +[UIImage imageNamed:@"no-action-icon" inBundle:v12];

    [v9 setIdentifier:@"CAMNoActionSpecifierID"];
    uint64_t v11 = &PSIconImageKey;
  }
  [v9 setProperty:v10 forKey:*v11];

  return v9;
}

- (int64_t)_selectedLaunchGesture
{
  return CFPreferencesGetAppIntegerValue(@"SBCaptureButtonClickCount", @"com.apple.springboard", 0) == 2;
}

- (id)_localizedTitleForGesture:(int64_t)a3
{
  if (!a3)
  {
    BOOL v4 = @"CAPTURE_BUTTON_LAUNCH_SINGLE_CLICK";
LABEL_5:
    id v5 = sub_878C(v4);
    return v5;
  }
  if (a3 == 1)
  {
    BOOL v4 = @"CAPTURE_BUTTON_LAUNCH_DOUBLE_CLICK";
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void)_setupAppConfigurationCoordinatorIfNecessary
{
  if (!*(void *)(&self->super + 1))
  {
    uint64_t v3 = (id *)&self->super.PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
    id WeakRetained = objc_loadWeakRetained(v3);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = objc_loadWeakRetained(v3);
      uint64_t v7 = [v6 captureButtonAppConfigurationCoordinator];
      id v8 = *(void **)(&self->super + 1);
      *(void *)(&self->super + 1) = v7;
    }
    uint64_t v9 = *(void **)(&self->super + 1);
    if (!v9)
    {
      uint64_t v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Could not get app configuration coordinator for CameraSettingsController. Creating new one.", v13, 2u);
      }

      uint64_t v11 = objc_alloc_init(CameraCaptureButtonAppConfigurationCoordinator);
      v12 = *(void **)(&self->super + 1);
      *(void *)(&self->super + 1) = v11;

      uint64_t v9 = *(void **)(&self->super + 1);
    }
    [v9 setDelegate:self];
  }
}

- (NSString)_associatedAppBundleID
{
  v2 = [(CameraButtonSettingsController *)self _appConfigurationCoordinator];
  uint64_t v3 = [v2 associatedAppBundleID];

  return (NSString *)v3;
}

- (NSSet)_eligibleAppsBundleIDs
{
  v2 = [(CameraButtonSettingsController *)self _appConfigurationCoordinator];
  uint64_t v3 = [v2 eligibleAppsBundleIDs];

  return (NSSet *)v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CameraButtonSettingsController;
  [(CameraButtonSettingsController *)&v21 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = [(CameraButtonSettingsController *)self specifierAtIndexPath:v6];
  id v8 = [(CameraButtonSettingsController *)self specifierForID:@"CAMAppLaunchGroupSpecifier"];
  uint64_t v9 = [(CameraButtonSettingsController *)self specifierForID:@"CAMAppListGroupSpecifier"];
  if (v9)
  {
    uint64_t v10 = [(CameraButtonSettingsController *)self indexPathForSpecifier:v9];
    uint64_t v11 = (uint64_t)[v10 section];
  }
  else
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([v6 section] == (id)v11)
  {
    v12 = [v7 identifier];
    if (v12)
    {
      [v9 setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
      if (v12 == @"CAMNoActionSpecifierID") {
        v13 = 0;
      }
      else {
        v13 = v12;
      }
      v14 = [(CameraButtonSettingsController *)self _appConfigurationCoordinator];
      [v14 setAssociatedAppBundleID:v13];
    }
    else
    {
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_150D0((uint64_t)v7, v14);
      }
    }

LABEL_20:
    goto LABEL_21;
  }
  if (v8)
  {
    id v15 = [v6 section];
    v16 = [(CameraButtonSettingsController *)self indexPathForSpecifier:v8];
    id v17 = [v16 section];

    if (v15 == v17)
    {
      v18 = [v7 propertyForKey:@"CAMAppLaunchGestureProperty"];
      v12 = v18;
      if (v18)
      {
        v19 = (char *)[(__CFString *)v18 integerValue];
        if (v19) {
          uint64_t v20 = 2 * (v19 == (unsigned char *)&dword_0 + 1);
        }
        else {
          uint64_t v20 = 1;
        }
        CFPreferencesSetAppValue(@"SBCaptureButtonClickCount", +[NSNumber numberWithInteger:v20], @"com.apple.springboard");
        CFPreferencesAppSynchronize(@"com.apple.springboard");
      }
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CameraButtonSettingsController;
  [(CameraButtonSettingsController *)&v4 viewDidAppear:a3];
  [(CameraButtonSettingsController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  uint64_t v3 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Camera/CAMERA_BUTTON_SETTINGS"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  id v5 = +[NSLocale currentLocale];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"CAMERA_CONTROL_TITLE" table:@"CameraSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  uint64_t v10 = +[NSLocale currentLocale];
  uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"CAMERA_SETTINGS_TITLE" table:@"CameraSettings" locale:v10 bundleURL:v12];

  id v15 = v13;
  v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(CameraButtonSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.camera" title:v8 localizedNavigationComponents:v14 deepLink:v3];
}

- (CameraCaptureButtonAppConfigurationCoordinator)_appConfigurationCoordinator
{
  return *(CameraCaptureButtonAppConfigurationCoordinator **)(&self->super + 1);
}

- (void).cxx_destruct
{
}

@end