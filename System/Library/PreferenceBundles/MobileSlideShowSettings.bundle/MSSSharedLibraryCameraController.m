@interface MSSSharedLibraryCameraController
- (id)_disableCameraAutoShare:(id)a3;
- (id)_enableCameraAutoShare:(id)a3;
- (id)deepLinkURL;
- (id)paneTitleLocalizedResource;
- (id)pathComponentsLocalizedResource;
- (id)shareFromCameraEnabledForSpecifier:(id)a3;
- (id)specifiers;
- (void)_setCameraAutoShareEnabled:(id)a3 enableAutoshare:(BOOL)a4;
- (void)setShareFromCameraEnabled:(id)a3 forSpecifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MSSSharedLibraryCameraController

- (id)pathComponentsLocalizedResource
{
  v3 = +[MSSSettingsUtilities photosMainPaneLocalizedResource];
  v4 = +[MSSSettingsUtilities sharedLibraryPaneLocalizedResource];
  v8[1] = v4;
  v5 = [(MSSSharedLibraryCameraController *)self paneTitleLocalizedResource];
  v8[2] = v5;
  v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

- (id)deepLinkURL
{
  v2 = +[NSString stringWithFormat:@"%@/%@/%@/%@", @"settings-navigation://com.apple.Settings.Apps", @"com.apple.mobileslideshow", @"SharedStreamsTitleGroup", @"shareFromCameraGroup"];
  v3 = +[NSURL URLWithString:v2];

  return v3;
}

- (id)paneTitleLocalizedResource
{
  return +[MSSSettingsUtilities sharedLibraryPaneLocalizedResource];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSSSharedLibraryCameraController;
  [(MSSSharedLibraryCameraController *)&v7 viewDidAppear:a3];
  v4 = [(MSSSharedLibraryCameraController *)self paneTitleLocalizedResource];
  v5 = [(MSSSharedLibraryCameraController *)self pathComponentsLocalizedResource];
  v6 = [(MSSSharedLibraryCameraController *)self deepLinkURL];
  [(MSSSharedLibraryCameraController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobileslideshow" title:v4 localizedNavigationComponents:v5 deepLink:v6];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier groupSpecifierWithID:@"shareFromCameraGroup"];
    objc_super v7 = PXLocalizedSharedLibraryString();
    uint64_t v8 = PSFooterTextGroupKey;
    [v6 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v9 = PXLocalizedSharedLibraryString();
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setShareFromCameraEnabled:forSpecifier:" get:"shareFromCameraEnabledForSpecifier:" detail:0 cell:6 edit:0];

    uint64_t v11 = PSDefaultValueKey;
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    uint64_t v32 = PSAllowMultilineTitleKey;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
    [v5 addObject:v10];
    v12 = [(MSSSharedLibraryCameraController *)self shareFromCameraEnabledForSpecifier:v10];
    unsigned int v13 = [v12 BOOLValue];

    if (v13)
    {
      v14 = +[PSSpecifier groupSpecifierWithID:@"SharedLibraryAutoSelectionGroup"];
      v15 = PXLocalizedSharedLibraryString();
      [v14 setObject:v15 forKeyedSubscript:v8];

      [v5 addObject:v14];
      [v14 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
      v16 = PXLocalizedSharedLibraryString();
      +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];
      v17 = uint64_t v30 = v11;

      PXLocalizedSharedLibraryString();
      v18 = v31 = v6;
      v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:3 edit:0];

      LODWORD(v15) = PXPreferencesIsCameraAutoShareEnabled();
      [v17 setControllerLoadAction:"_enableCameraAutoShare:"];
      [v19 setControllerLoadAction:"_disableCameraAutoShare:"];
      if (v15) {
        v20 = v17;
      }
      else {
        v20 = v19;
      }
      uint64_t v21 = PSRadioGroupCheckedSpecifierKey;
      id v22 = v20;
      [v14 setProperty:v22 forKey:v21];
      [v5 addObject:v17];
      [v5 addObject:v19];

      v23 = +[PSSpecifier groupSpecifierWithID:@"shareAtHomeGroup"];
      v24 = PXLocalizedSharedLibraryString();
      [v23 setObject:v24 forKeyedSubscript:v8];

      [v5 addObject:v23];
      v25 = PXLocalizedSharedLibraryString();
      v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

      [v26 setObject:@"com.apple.mobileslideshow" forKeyedSubscript:PSDefaultsKey];
      [v26 setObject:@"CameraShareFromHomeEnabled" forKeyedSubscript:PSKeyNameKey];
      [v26 setObject:&__kCFBooleanFalse forKeyedSubscript:v30];
      [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:v32];
      [v5 addObject:v26];

      v6 = v31;
    }
    id v27 = [v5 copy];
    v28 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v27;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_disableCameraAutoShare:(id)a3
{
  return 0;
}

- (id)_enableCameraAutoShare:(id)a3
{
  return 0;
}

- (void)_setCameraAutoShareEnabled:(id)a3 enableAutoshare:(BOOL)a4
{
  PXPreferencesSetCameraAutoShareEnabled();

  [(MSSSharedLibraryCameraController *)self reloadSpecifiers];
}

- (id)shareFromCameraEnabledForSpecifier:(id)a3
{
  uint64_t IsCameraSharingEnabled = PXPreferencesIsCameraSharingEnabled();

  return +[NSNumber numberWithBool:IsCameraSharingEnabled];
}

- (void)setShareFromCameraEnabled:(id)a3 forSpecifier:(id)a4
{
  [a3 BOOLValue];
  PXPreferencesSetCameraSharingEnabled();

  [(MSSSharedLibraryCameraController *)self reloadSpecifiers];
}

@end