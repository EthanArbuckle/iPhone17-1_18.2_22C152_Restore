@interface SCATSwitchSourceController
- (BOOL)_shouldEnableCameraSource;
- (BOOL)_shouldEnableEarbudSource;
- (BOOL)_shouldEnableExternalSource;
- (BOOL)_shouldEnableScreenSource;
- (BOOL)_shouldEnableSoundSource;
- (id)specifiers;
- (void)soundActionsAssetDidUpdate;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATSwitchSourceController

- (void)soundActionsAssetDidUpdate
{
  id v4 = [(SCATSwitchSourceController *)self specifierForID:@"SoundSwitchSourceIdentifier"];
  v3 = +[NSNumber numberWithBool:[(SCATSwitchSourceController *)self _shouldEnableSoundSource]];
  [v4 setProperty:v3 forKey:PSEnabledKey];

  [(SCATSwitchSourceController *)self reloadSpecifier:v4];
}

- (BOOL)_shouldEnableSoundSource
{
  v2 = [(SCATSwitchSourceController *)self soundActionslocalURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_shouldEnableEarbudSource
{
  return 1;
}

- (BOOL)_shouldEnableCameraSource
{
  if (_shouldEnableCameraSource_onceToken[0] != -1) {
    dispatch_once(_shouldEnableCameraSource_onceToken, &__block_literal_global_74);
  }
  return _shouldEnableCameraSource_shouldEnableCameraSource;
}

void __55__SCATSwitchSourceController__shouldEnableCameraSource__block_invoke(id a1)
{
  v4[0] = AVCaptureDeviceTypeBuiltInWideAngleCamera;
  v4[1] = AVCaptureDeviceTypeBuiltInTelephotoCamera;
  v4[2] = AVCaptureDeviceTypeBuiltInUltraWideCamera;
  v4[3] = AVCaptureDeviceTypeBuiltInDualCamera;
  v4[4] = AVCaptureDeviceTypeBuiltInDualWideCamera;
  v4[5] = AVCaptureDeviceTypeBuiltInTripleCamera;
  v4[6] = AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  v1 = +[NSArray arrayWithObjects:v4 count:7];
  v2 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v1 mediaType:AVMediaTypeVideo position:2];
  BOOL v3 = [v2 devices];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_291];
}

void __55__SCATSwitchSourceController__shouldEnableCameraSource__block_invoke_2(id a1, AVCaptureDevice *a2, unint64_t a3, BOOL *a4)
{
  v5 = a2;
  if ((char *)[(AVCaptureDevice *)v5 position] == (char *)&dword_0 + 2
    && [(AVCaptureDevice *)v5 isFaceDetectionSupported])
  {
    _shouldEnableCameraSource_shouldEnableCameraSource = 1;
    *a4 = 1;
  }
}

- (BOOL)_shouldEnableExternalSource
{
  return 1;
}

- (BOOL)_shouldEnableScreenSource
{
  return 1;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = AXParameterizedLocalizedString();
    v7 = +[PSSpecifier groupSpecifierWithName:v6];

    v8 = AXParameterizedLocalizedString();
    [v7 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v5 addObject:v7];
    if ([(SCATSwitchSourceController *)self _shouldEnableExternalSource])
    {
      v9 = AXParameterizedLocalizedString();
      v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:1 edit:0];

      [v10 setIdentifier:@"ExternalSwitchSourceIdentifier"];
      [v10 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      [v5 addObject:v10];
    }
    if ([(SCATSwitchSourceController *)self _shouldEnableScreenSource])
    {
      v11 = AXParameterizedLocalizedString();
      v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:1 edit:0];

      [v12 setIdentifier:@"ScreenSwitchSourceIdentifier"];
      [v12 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      [v5 addObject:v12];
    }
    if ([(SCATSwitchSourceController *)self _shouldEnableCameraSource])
    {
      v13 = AXParameterizedLocalizedString();
      v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:1 edit:0];

      [v14 setIdentifier:@"CameraSwitchSourceIdentifier"];
      [v14 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      [v5 addObject:v14];
    }
    if (AXDeviceSupportsBackTap())
    {
      v15 = settingsLocString(@"BACK_TAP", @"Accessibility");
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:1 edit:0];

      [v16 setIdentifier:@"BackTapSwitchSourceIdentifier"];
      [v16 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      [v5 addObject:v16];
    }
    if (AXDeviceSupportsVoiceTriggers())
    {
      v17 = settingsLocString(@"SOUND_ACTION", @"Accessibility");
      v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:1 edit:0];

      [v18 setIdentifier:@"SoundSwitchSourceIdentifier"];
      v19 = +[NSNumber numberWithBool:AXRuntimeCheck_SoundRecognitionMedinaSupportEnabled() | [(SCATSwitchSourceController *)self _shouldEnableSoundSource]];
      [v18 setProperty:v19 forKey:PSEnabledKey];

      [v18 setObject:&__kCFBooleanFalse forKeyedSubscript:AXInBuddySetupKey];
      [v5 addObject:v18];
    }
    if (AXDeviceSupportsAirPodsHeadGestures())
    {
      v20 = AXParameterizedLocalizedString();
      v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:1 edit:0];
      [v21 setIdentifier:@"HeadGesturesSwitchSourceIdentifier"];
      [v21 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      [v21 setObject:&__kCFBooleanFalse forKeyedSubscript:AXInBuddySetupKey];
      [v5 addObject:v21];
    }
    v22 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;

    id v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SCATSwitchSourceController;
  v5 = [(SCATSwitchSourceController *)&v16 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [v5 specifier];
  v7 = [v6 identifier];

  if (![v7 isEqualToString:@"ExternalSwitchSourceIdentifier"]
    && ![v7 isEqualToString:@"ScreenSwitchSourceIdentifier"]
    && ![v7 isEqualToString:@"CameraSwitchSourceIdentifier"])
  {
    if (![v7 isEqualToString:@"BackTapSwitchSourceIdentifier"])
    {
      if ([v7 isEqualToString:@"SoundSwitchSourceIdentifier"])
      {
        v8 = objc_opt_new();
        v12 = [(SCATSwitchSourceController *)self soundActionslocalURL];
        [v8 setAssetURL:v12];

        v13 = v8;
LABEL_13:
        [v13 setParentController:self];
        v14 = [(SCATSwitchSourceController *)self rootController];
        [v8 setRootController:v14];

        v10 = [v5 specifier];
        v11 = [v10 name];
        v15 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:-1 edit:0];
        [v8 setSpecifier:v15];

        goto LABEL_6;
      }
      if (![v7 isEqualToString:@"HeadGesturesSwitchSourceIdentifier"]) {
        goto LABEL_7;
      }
    }
    v13 = objc_opt_new();
    v8 = v13;
    goto LABEL_13;
  }
  v8 = objc_opt_new();
  [v8 setParentController:self];
  v9 = [(SCATSwitchSourceController *)self rootController];
  [v8 setRootController:v9];

  v10 = AXParameterizedLocalizedString();
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v8 setSpecifier:v11];
LABEL_6:

  [(SCATSwitchSourceController *)self showController:v8 animate:1];
LABEL_7:
}

@end