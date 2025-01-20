@interface CameraSharedLibrarySettingController
- (id)_isShareAtHomeEnabled:(id)a3;
- (id)_isShareFromCameraEnabled:(id)a3;
- (id)specifiers;
- (void)_setShareAtHome:(id)a3 specifier:(id)a4;
- (void)_setShareFromCamera:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CameraSharedLibrarySettingController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"shareFromCameraGroup"];
    v7 = sub_98F4(@"SHARED_LIBRARY_SHARE_FROM_CAMERA_FOOTER");
    uint64_t v8 = PSFooterTextGroupKey;
    [v6 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v9 = sub_98F4(@"SHARED_LIBRARY_SHARE_FROM_CAMERA_TITLE");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"_setShareFromCamera:specifier:" get:"_isShareFromCameraEnabled:" detail:0 cell:6 edit:0];

    uint64_t v11 = PSDefaultValueKey;
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    [v5 addObject:v10];
    v12 = [(CameraSharedLibrarySettingController *)self _isShareFromCameraEnabled:v10];
    unsigned int v13 = [v12 BOOLValue];

    if (v13)
    {
      uint64_t v32 = v11;
      v34 = v6;
      v14 = +[PSSpecifier groupSpecifierWithID:@"autoShareBehaviorSelectionGroup"];
      v15 = sub_98F4(@"SHARED_LIBRARY_SHARE_SELECTION_FOOTER");
      uint64_t v33 = v8;
      [v14 setObject:v15 forKeyedSubscript:v8];

      [v5 addObject:v14];
      [v14 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
      v16 = sub_98F4(@"SHARED_LIBRARY_SHARE_AUTOMATICALLY");
      v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

      v18 = sub_98F4(@"SHARED_LIBRARY_SHARE_MANUALLY");
      v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:3 edit:0];

      int IsCameraAutoShareEnabled = PXPreferencesIsCameraAutoShareEnabled();
      if (IsCameraAutoShareEnabled) {
        v21 = v17;
      }
      else {
        v21 = v19;
      }
      uint64_t v22 = PSRadioGroupCheckedSpecifierKey;
      id v23 = v21;
      [v14 setProperty:v23 forKey:v22];
      [v5 addObject:v17];
      [v5 addObject:v19];

      if (IsCameraAutoShareEnabled)
      {
        v24 = +[PSSpecifier groupSpecifierWithID:@"shareAtHomeGroup"];
        v25 = sub_98F4(@"SHARED_LIBRARY_SHARE_AT_HOME_FOOTER");
        [v24 setObject:v25 forKeyedSubscript:v33];

        [v5 addObject:v24];
        v26 = sub_98F4(@"SHARED_LIBRARY_SHARE_AT_HOME_TITLE");
        v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:"_setShareAtHome:specifier:" get:"_isShareAtHomeEnabled:" detail:0 cell:6 edit:0];

        [v27 setObject:@"com.apple.mobileslideshow" forKeyedSubscript:PSDefaultsKey];
        [v27 setObject:@"CameraShareFromHomeEnabled" forKeyedSubscript:PSKeyNameKey];
        [v27 setObject:&__kCFBooleanFalse forKeyedSubscript:v32];
        v28 = sub_98F4(@"SHARED_LIBRARY_SHARE_AT_HOME_FOOTER");
        [v27 setObject:v28 forKeyedSubscript:v33];

        [v5 addObject:v27];
      }

      v6 = v34;
    }
    +[CameraSettingsBaseController allowMultilineTitlesForSpecifiers:v5];
    id v29 = [v5 copy];
    v30 = *(void **)&self->super.PSListController_opaque[v3];
    *(void *)&self->super.PSListController_opaque[v3] = v29;

    v4 = *(void **)&self->super.PSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CameraSharedLibrarySettingController;
  [(CameraSharedLibrarySettingController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(CameraSharedLibrarySettingController *)self specifierForID:@"autoShareBehaviorSelectionGroup"];
  if (v7)
  {
    uint64_t v8 = [(CameraSharedLibrarySettingController *)self indexPathForSpecifier:v7];
    uint64_t v9 = (uint64_t)[v8 section];
  }
  else
  {
    uint64_t v9 = -1;
  }
  if ([v6 section] == (id)v9)
  {
    [v6 row];
    PXPreferencesSetCameraAutoShareEnabled();
    +[CAMUserPreferences removeSharedLibraryAlgorithmsPreferences];
    [(CameraSettingsBaseController *)self reloadSpecifiers];
  }
}

- (void)_setShareFromCamera:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"CameraSharingEnabled", a3, @"com.apple.mobileslideshow");
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  +[CAMUserPreferences removeSharedLibraryAlgorithmsPreferences];

  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (id)_isShareFromCameraEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CameraSharingEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  uint64_t v4 = v3;
  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (void)_setShareAtHome:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"CameraShareFromHomeEnabled", a3, @"com.apple.mobileslideshow");
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  +[CAMUserPreferences removeSharedLibraryAlgorithmsPreferences];

  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (id)_isShareAtHomeEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v3 = +[NSNumber numberWithBool:CFPreferencesGetAppBooleanValue(@"CameraShareFromHomeEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0];

  return v3;
}

@end