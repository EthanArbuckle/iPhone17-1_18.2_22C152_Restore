@interface CameraVideoSettingsController
+ (id)_footerForVideoConfiguration:(id)a3 willUseHEVC:(BOOL)a4 willUseDolbyVision:(BOOL)a5;
+ (id)_titleForVideoConfiguration:(int64_t)a3 isHEVCEnabled:(BOOL)a4 isHDR10BitVideoEnabled:(BOOL)a5;
+ (id)_videoConfigurationFooterForPrefixString:(id)a3 useHEVC:(BOOL)a4 useDolbyVision:(BOOL)a5;
+ (id)shortTitleForVideoConfiguration:(id)a3;
- (BOOL)_isPALVideoEnabled;
- (BOOL)_showHEVCOnlyFormatsOnCapableDevices;
- (id)_isAutoLowLightVideoEnabled:(id)a3;
- (id)_isHDRVideoEnabled:(id)a3;
- (id)_isPALVideoEnabled:(id)a3;
- (id)_shouldDisableCameraSwitchingDuringVideoRecording:(id)a3;
- (id)_vfrVideoMode:(id)a3;
- (id)specifiers;
- (int64_t)_cinematicConfiguration;
- (int64_t)_slomoConfiguration;
- (int64_t)_videoConfiguration;
- (void)_addSwitchWithTitle:(id)a3 footer:(id)a4 domain:(id)a5 keyName:(id)a6 defaultValue:(BOOL)a7 toSpecifiers:(id)a8;
- (void)_handleConfirmHDRVideoHighEfficiencyLearnMore:(id)a3;
- (void)_handleConfirmHighEfficiencyLearnMore:(id)a3;
- (void)_handleHDR10BitVideoMostCompatibleConfirmed:(id)a3;
- (void)_handleVideoMostCompatibleConfirmed:(id)a3;
- (void)_setAutoLowLightVideoEnabled:(id)a3 specifier:(id)a4;
- (void)_setHDR10BitVideoEnabled:(id)a3 specifier:(id)a4;
- (void)_setPALVideoEnabled:(id)a3 specifier:(id)a4;
- (void)_setRecordVideoConfiguration:(id)a3;
- (void)_setShouldDisableCameraSwitchingDuringVideoRecording:(id)a3 specifier:(id)a4;
- (void)_showConfirmationSpecifierWithTitle:(id)a3 prompt:(id)a4 cancelText:(id)a5 okText:(id)a6 target:(id)a7 confirmationAction:(SEL)a8 cancelAction:(SEL)a9 value:(id)a10;
- (void)emitNavigationEvent;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CameraVideoSettingsController

- (id)specifiers
{
  v3 = +[CameraSettingsBaseController capabilities];
  if ([v3 isVariableFramerateVideoSupported]) {
    +[CAMUserPreferences performLowLightVideoMigrationWithCapabilities:v3];
  }
  if ([v3 responsiveShutterSupported]) {
    +[CAMUserPreferences performResponsiveShutterMigrationWithCapabilities:v3];
  }
  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  v5 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v5)
  {
    id v92 = objc_alloc_init((Class)NSMutableArray);
    int64_t v84 = [(CameraVideoSettingsController *)self _videoConfiguration];
    id v6 = [v3 back720pMaxFPS];
    id v7 = [v3 back1080pMaxFPS];
    id v8 = [v3 front1080pMaxFPS];
    uint64_t v79 = (uint64_t)v8;
    BOOL v10 = (uint64_t)v7 > 59 || (uint64_t)v8 > 59;
    BOOL v80 = v10;
    BOOL v12 = (uint64_t)v6 > 29 && (uint64_t)v7 > 29;
    if ([v3 isHEVCEncodingSupported]) {
      unsigned int v86 = [(CameraVideoSettingsController *)self _showHEVCOnlyFormatsOnCapableDevices];
    }
    else {
      unsigned int v86 = 0;
    }
    uint64_t v78 = v4;
    unsigned int v81 = [v3 isBack4k30VideoSupported];
    unsigned int v13 = [v3 isBack4k24VideoSupported];
    unsigned int v87 = [v3 isBack4k60VideoSupported];
    unsigned int v85 = [v3 isBack4k120VideoSupported];
    unsigned int v14 = [v3 isBack4k120VideoSupported];
    v15 = [(CameraVideoSettingsController *)self _isHDRVideoEnabled:0];
    unsigned __int8 v89 = [v15 BOOLValue];

    v16 = self;
    if ([v3 isPALVideoSupported]) {
      unsigned int v17 = [(CameraVideoSettingsController *)self _isPALVideoEnabled];
    }
    else {
      unsigned int v17 = 0;
    }
    v83 = +[PSSpecifier groupSpecifierWithID:@"VideoConfigurationGroupSpecifierID"];
    [v83 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v18 = +[NSMutableString string];
    if ([v3 isTrueVideoSupported])
    {
      v19 = @"CAM_RECORD_VIDEO_FOOTER_TRUE_VIDEO";
    }
    else
    {
      if (![v3 deviceSupportsCTM]) {
        goto LABEL_29;
      }
      v19 = @"CAM_RECORD_VIDEO_FOOTER_QUICKTAKE";
    }
    v20 = sub_BF7C(v19);
    [v18 appendFormat:@"%@\n\n", v20];

LABEL_29:
    v21 = sub_BF7C(@"CAM_RECORD_VIDEO_FOOTER_HEAD");
    [v18 appendString:v21];

    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_C0E8;
    v109[3] = &unk_20808;
    id v22 = v3;
    id v110 = v22;
    v23 = objc_retainBlock(v109);
    v91 = +[NSMutableArray array];
    if (v12) {
      [v91 addObject:&off_24718];
    }
    if (v17 && ((unsigned int (*)(void *, uint64_t))v23[2])(v23, 11)) {
      [v91 addObject:&off_24730];
    }
    [v91 addObject:&off_24748];
    v24 = v83;
    if (v80)
    {
      [v91 addObject:&off_24760];
      if (!v14)
      {
LABEL_36:
        if (!v13) {
          goto LABEL_37;
        }
        goto LABEL_41;
      }
    }
    else if (!v14)
    {
      goto LABEL_36;
    }
    [v91 addObject:&off_24778];
    if (!v13)
    {
LABEL_37:
      if (!v17) {
        goto LABEL_44;
      }
      goto LABEL_42;
    }
LABEL_41:
    [v91 addObject:&off_24790];
    if (!v17) {
      goto LABEL_44;
    }
LABEL_42:
    if (((unsigned int (*)(void *, uint64_t))v23[2])(v23, 12)) {
      [v91 addObject:&off_247A8];
    }
LABEL_44:
    if (v81) {
      [v91 addObject:&off_247C0];
    }
    if (v87) {
      [v91 addObject:&off_247D8];
    }
    if (v85)
    {
      if (v17) {
        [v91 addObject:&off_247F0];
      }
      [v91 addObject:&off_24808];
    }
    v82 = v23;
    [v92 addObject:v83];
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x3032000000;
    v106 = sub_C154;
    v107 = sub_C164;
    id v108 = 0;
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_C16C;
    v94[3] = &unk_20830;
    unsigned __int8 v101 = v89;
    id v25 = v22;
    char v102 = v86;
    id v95 = v25;
    v96 = v16;
    v99 = &v103;
    int64_t v100 = v84;
    id v93 = v92;
    id v97 = v93;
    id v88 = v18;
    id v98 = v88;
    [v91 enumerateObjectsUsingBlock:v94];
    if (v79 >= 60 && (uint64_t)v7 <= 59)
    {
      v26 = sub_BF7C(@"CAM_FORMATS_CAPTURE_FOOTER_1080p60_FRONT_ONLY");
      [v88 appendFormat:@"\n%@", v26];
    }
    uint64_t v90 = PSFooterTextGroupKey;
    objc_msgSend(v83, "setProperty:forKey:", v88);
    [v83 setProperty:v104[5] forKey:PSRadioGroupCheckedSpecifierKey];
    if ([v25 isPALVideoSupported])
    {
      v27 = +[PSSpecifier groupSpecifierWithName:0];
      v28 = sub_BF7C(@"CAM_PAL_VIDEO_FORMATS_FOOTER");
      [v27 setProperty:v28 forKey:v90];

      [v93 addObject:v27];
      v29 = sub_BF7C(@"CAM_PAL_VIDEO_FORMATS_TITLE");
      v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:v16 set:"_setPALVideoEnabled:specifier:" get:"_isPALVideoEnabled:" detail:0 cell:6 edit:0];

      [v93 addObject:v30];
    }
    if ([v25 isVideoStabilizationControlSupported])
    {
      uint64_t v31 = sub_BF7C(@"CAM_ENABLE_VIDEO_STABILIZATION_SWITCH");
      uint64_t v32 = sub_BF7C(@"CAM_ENABLE_VIDEO_STABILIZATION_FOOTER");
      v33 = +[PSSpecifier groupSpecifierWithName:0];
      [v33 setProperty:v32 forKey:v90];
      [v93 addObject:v33];
      v76 = v33;
      v77 = (void *)v32;
      v34 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, v16, 0);
      uint64_t v35 = PSDefaultsKey;
      [v34 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
      uint64_t v36 = PSKeyNameKey;
      [v34 setObject:CAMUserPreferenceEnhancedVideoStabilization forKeyedSubscript:PSKeyNameKey];
      uint64_t v37 = PSDefaultValueKey;
      [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
      [v93 addObject:v34];
      v38 = sub_BF7C(@"CAM_ACTION_MODE_LOW_LIGHT");
      v75 = (void *)v31;
      v39 = sub_BF7C(@"CAM_ACTION_MODE_LOW_LIGHT_FOOTER");
      v40 = +[PSSpecifier groupSpecifierWithName:0];
      [v40 setProperty:v39 forKey:v90];
      [v93 addObject:v40];
      v74 = v16;
      v41 = +[PSSpecifier preferenceSpecifierNamed:v38 target:v16 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
      [v41 setObject:@"com.apple.camera" forKeyedSubscript:v35];
      [v41 setObject:CAMUserPreferenceActionModeLowLightEnabled forKeyedSubscript:v36];
      [v41 setObject:&__kCFBooleanFalse forKeyedSubscript:v37];
      [v93 addObject:v41];

      v16 = v74;
      v24 = v83;
    }
    if ([v25 isHDR10BitVideoSupported])
    {
      unsigned int v42 = [v25 isHDR10BitVideoSupports60FPS];
      unsigned int v43 = [v25 isCinematicModeSupported];
      if (v86) {
        v44 = @"CAM_HDR_VIDEO_TITLE";
      }
      else {
        v44 = @"CAM_HDR_VIDEO_MOST_COMPATIBLE_TITLE";
      }
      v45 = sub_BF7C(v44);
      CFStringRef v46 = @"CAM_HDR_VIDEO_FOOTER";
      if (v43) {
        CFStringRef v46 = @"CAM_HDR_VIDEO_AND_CINEMATIC_FOOTER";
      }
      if (!v42) {
        CFStringRef v46 = @"CAM_HDR_VIDEO_60FPS_UNSUPPORTED_FOOTER";
      }
      if (v85) {
        v47 = @"CAM_HDR_VIDEO_FOOTER_4k120";
      }
      else {
        v47 = (__CFString *)v46;
      }
      v48 = sub_BF7C(v47);
      v49 = +[PSSpecifier groupSpecifierWithName:0];
      [v49 setProperty:v48 forKey:v90];
      [v93 addObject:v49];
      v50 = +[PSSpecifier preferenceSpecifierNamed:v45 target:v16 set:"_setHDR10BitVideoEnabled:specifier:" get:"_isHDRVideoEnabled:" detail:0 cell:6 edit:0];
      [v93 addObject:v50];
    }
    if ([v25 isVariableFramerateVideoSupported])
    {
      v51 = +[PSSpecifier groupSpecifierWithName:0];
      v52 = sub_BF7C(@"CAM_AUTO_FPS_VFR_FOOTER");
      [v51 setProperty:v52 forKey:v90];

      [v93 addObject:v51];
      v53 = sub_BF7C(@"CAM_AUTO_FPS_TITLE");
      v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:v16 set:0 get:"_vfrVideoMode:" detail:objc_opt_class() cell:2 edit:0];

      [v93 addObject:v54];
    }
    else
    {
      if (![v25 isAutoLowLightVideoSupportedForMode:1 videoConfiguration:v84 videoEncodingBehavior:1])
      {
LABEL_76:
        unsigned int v57 = [v25 interactiveVideoFormatControlSupported];
        if (((v57 ^ 1 | [v25 interactiveVideoFormatControlAlwaysEnabled]) & 1) == 0)
        {
          v58 = sub_BF7C(@"CAM_ENABLE_VIDEO_CONFIGURATION_CONTROL_TITLE");
          v59 = sub_BF7C(@"CAM_ENABLE_VIDEO_CONFIGURATION_CONTROL_FOOTER");
          v60 = +[PSSpecifier groupSpecifierWithName:0];
          [v60 setProperty:v59 forKey:v90];
          [v93 addObject:v60];
          v61 = +[PSSpecifier preferenceSpecifierNamed:v58 target:v16 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
          [v61 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
          [v61 setObject:@"CAMUserPreferenceEnableVideoConfigurationControl" forKeyedSubscript:PSKeyNameKey];
          [v61 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
          [v93 addObject:v61];
        }
        if (([v25 isBackTelephotoSupported] & 1) != 0
          || [v25 isBackSuperWideSupported])
        {
          v62 = sub_BF7C(@"CAM_VIDEO_RECORDING_DISABLE_CAMERA_SWITCHING_TITLE");
          v63 = sub_BF7C(@"CAM_VIDEO_RECORDING_DISABLE_CAMERA_SWITCHING_FOOTER");
          v64 = +[PSSpecifier groupSpecifierWithName:0];
          [v64 setProperty:v63 forKey:v90];
          [v93 addObject:v64];
          v65 = +[PSSpecifier preferenceSpecifierNamed:v62 target:v16 set:"_setShouldDisableCameraSwitchingDuringVideoRecording:specifier:" get:"_shouldDisableCameraSwitchingDuringVideoRecording:" detail:0 cell:6 edit:0];
          [v93 addObject:v65];
        }
        if ([v25 isWhiteBalanceLockingForVideoRecordingSupported])
        {
          v66 = sub_BF7C(@"CAM_VIDEO_RECORDING_LOCK_WHITE_BALANCE_TITLE");
          v67 = sub_BF7C(@"CAM_VIDEO_RECORDING_LOCK_WHITE_BALANCE_FOOTER");
          v68 = +[PSSpecifier groupSpecifierWithName:0];
          [v68 setProperty:v67 forKey:v90];
          [v93 addObject:v68];
          v69 = +[PSSpecifier preferenceSpecifierNamed:v66 target:v16 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
          [v69 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
          [v69 setObject:CAMUserPreferenceLockWhiteBalanceDuringVideoRecording forKeyedSubscript:PSKeyNameKey];
          [v69 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
          [v93 addObject:v69];
        }
        +[CameraSettingsBaseController allowMultilineTitlesForSpecifiers:v93];
        id v70 = [v93 copy];
        v71 = *(void **)&v16->super.PSListController_opaque[v78];
        *(void *)&v16->super.PSListController_opaque[v78] = v70;

        _Block_object_dispose(&v103, 8);
        v5 = *(void **)&v16->super.PSListController_opaque[v78];
        goto LABEL_84;
      }
      v51 = +[PSSpecifier groupSpecifierWithName:0];
      v55 = sub_BF7C(@"CAM_AUTO_LOW_LIGHT_FOOTER");
      [v51 setProperty:v55 forKey:v90];

      [v93 addObject:v51];
      v56 = sub_BF7C(@"CAM_AUTO_LOW_LIGHT_TITLE");
      v54 = +[PSSpecifier preferenceSpecifierNamed:v56 target:v16 set:"_setAutoLowLightVideoEnabled:specifier:" get:"_isAutoLowLightVideoEnabled:" detail:0 cell:6 edit:0];

      [v93 addObject:v54];
    }

    goto LABEL_76;
  }
LABEL_84:
  id v72 = v5;

  return v72;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CameraVideoSettingsController;
  [(CameraVideoSettingsController *)&v4 viewDidAppear:a3];
  [(CameraVideoSettingsController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  v3 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Camera/CameraVideoSettingsList"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"CAM_RECORD_VIDEO_TITLE" table:@"CameraSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  BOOL v10 = +[NSLocale currentLocale];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"CAMERA_SETTINGS_TITLE" table:@"CameraSettings" locale:v10 bundleURL:v12];

  id v15 = v13;
  unsigned int v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(CameraVideoSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.camera" title:v8 localizedNavigationComponents:v14 deepLink:v3];
}

- (void)_addSwitchWithTitle:(id)a3 footer:(id)a4 domain:(id)a5 keyName:(id)a6 defaultValue:(BOOL)a7 toSpecifiers:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v21 = +[PSSpecifier groupSpecifierWithName:0];
  [v21 setObject:v17 forKeyedSubscript:PSFooterTextGroupKey];

  [v14 addObject:v21];
  v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v19 setObject:v16 forKeyedSubscript:PSDefaultsKey];
  [v19 setObject:v15 forKeyedSubscript:PSKeyNameKey];

  v20 = +[NSNumber numberWithBool:v8];
  [v19 setObject:v20 forKeyedSubscript:PSDefaultValueKey];

  [v14 addObject:v19];
}

- (int64_t)_videoConfiguration
{
  v2 = +[NSNumber numberWithLong:CFPreferencesGetAppIntegerValue(CAMUserPreferenceVideoConfiguration, @"com.apple.camera", 0)];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)_cinematicConfiguration
{
  v2 = +[NSNumber numberWithLong:CFPreferencesGetAppIntegerValue(CAMUserPreferenceCinematicConfiguration, @"com.apple.camera", 0)];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)_slomoConfiguration
{
  v2 = +[NSNumber numberWithLong:CFPreferencesGetAppIntegerValue(CAMUserPreferenceSlomoConfiguration, @"com.apple.camera", 0)];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CameraVideoSettingsController;
  [(CameraVideoSettingsController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(CameraVideoSettingsController *)self specifierForID:@"VideoConfigurationGroupSpecifierID"];
  if (v7)
  {
    BOOL v8 = [(CameraVideoSettingsController *)self indexPathForSpecifier:v7];
    uint64_t v9 = (uint64_t)[v8 section];
  }
  else
  {
    uint64_t v9 = -1;
  }
  if ([v6 section] == (id)v9)
  {
    BOOL v10 = [(CameraVideoSettingsController *)self specifierAtIndexPath:v6];
    v11 = [v10 propertyForKey:PSValueKey];
    [(CameraVideoSettingsController *)self _setRecordVideoConfiguration:v11];
  }
  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (BOOL)_showHEVCOnlyFormatsOnCapableDevices
{
  return +[PFMediaCapabilities newFormatsConfiguration] != (char *)&dword_0 + 1;
}

+ (id)_titleForVideoConfiguration:(int64_t)a3 isHEVCEnabled:(BOOL)a4 isHDR10BitVideoEnabled:(BOOL)a5
{
  id v6 = 0;
  int v7 = a5 & ~a4;
  switch(a3)
  {
    case 0:
    case 7:
      CFStringRef v8 = @"CAM_RECORD_VIDEO_1080p_30";
      CFStringRef v9 = @"CAM_RECORD_VIDEO_1080p_30_MOST_COMPATIBLE";
      goto LABEL_11;
    case 1:
      CFStringRef v8 = @"CAM_RECORD_VIDEO_1080p_60";
      CFStringRef v9 = @"CAM_RECORD_VIDEO_1080p_60_MOST_COMPATIBLE";
      goto LABEL_11;
    case 4:
      int v7 = !a5 || a4;
      CFStringRef v8 = @"CAM_RECORD_VIDEO_1080P_120_MOST_COMPATIBLE";
      CFStringRef v9 = @"CAM_RECORD_VIDEO_1080P_120";
      goto LABEL_11;
    case 5:
      CFStringRef v8 = @"CAM_RECORD_VIDEO_4K_30";
      CFStringRef v9 = @"CAM_RECORD_VIDEO_4K_30_MOST_COMPATIBLE";
      goto LABEL_11;
    case 6:
      CFStringRef v8 = @"CAM_RECORD_VIDEO_720p_30";
      CFStringRef v9 = @"CAM_RECORD_VIDEO_720p_30_MOST_COMPATIBLE";
      goto LABEL_11;
    case 9:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_60_MOST_COMPATIBLE";
      CFStringRef v11 = @"CAM_RECORD_VIDEO_4K_60";
      goto LABEL_16;
    case 10:
      CFStringRef v8 = @"CAM_RECORD_VIDEO_4K_24";
      CFStringRef v9 = @"CAM_RECORD_VIDEO_4K_24_MOST_COMPATIBLE";
      goto LABEL_11;
    case 11:
      CFStringRef v8 = @"CAM_RECORD_VIDEO_1080p_25";
      CFStringRef v9 = @"CAM_RECORD_VIDEO_1080p_25_MOST_COMPATIBLE";
      goto LABEL_11;
    case 12:
      CFStringRef v8 = @"CAM_RECORD_VIDEO_4K_25";
      CFStringRef v9 = @"CAM_RECORD_VIDEO_4K_25_MOST_COMPATIBLE";
LABEL_11:
      if (v7) {
        objc_super v12 = (__CFString *)v9;
      }
      else {
        objc_super v12 = (__CFString *)v8;
      }
      goto LABEL_19;
    case 13:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_120_MOST_COMPATIBLE";
      CFStringRef v11 = @"CAM_RECORD_VIDEO_4K_120";
      goto LABEL_16;
    case 14:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_100_MOST_COMPATIBLE";
      CFStringRef v11 = @"CAM_RECORD_VIDEO_4K_100";
LABEL_16:
      if (a4) {
        objc_super v12 = (__CFString *)v11;
      }
      else {
        objc_super v12 = (__CFString *)v10;
      }
LABEL_19:
      id v6 = sub_BF7C(v12);
      break;
    default:
      break;
  }
  return v6;
}

+ (id)shortTitleForVideoConfiguration:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 integerValue];
  if (v3 <= 0xE && ((0x7EF3u >> v3) & 1) != 0)
  {
    id v4 = sub_BF7C(off_20850[v3]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_footerForVideoConfiguration:(id)a3 willUseHEVC:(BOOL)a4 willUseDolbyVision:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = [a3 integerValue];
  CFStringRef v9 = 0;
  CFStringRef v10 = @"CAM_RECORD_VIDEO_720p_30";
  switch((unint64_t)v8)
  {
    case 0uLL:
    case 7uLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_1080p_30";
      goto LABEL_13;
    case 1uLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_1080p_60";
      goto LABEL_13;
    case 4uLL:
      uint64_t v6 = v6 | v5;
      CFStringRef v10 = @"CAM_RECORD_VIDEO_1080P_120";
      goto LABEL_13;
    case 5uLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_30";
      goto LABEL_13;
    case 6uLL:
      goto LABEL_13;
    case 9uLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_60";
      goto LABEL_12;
    case 0xAuLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_24";
      goto LABEL_13;
    case 0xBuLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_1080p_25";
      goto LABEL_13;
    case 0xCuLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_25";
      goto LABEL_13;
    case 0xDuLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_120";
      goto LABEL_12;
    case 0xEuLL:
      CFStringRef v10 = @"CAM_RECORD_VIDEO_4K_100";
LABEL_12:
      uint64_t v6 = 1;
LABEL_13:
      CFStringRef v11 = [a1 _videoConfigurationFooterForPrefixString:v10 useHEVC:v6 useDolbyVision:v5];
      CFStringRef v9 = sub_BF7C(v11);

      break;
    default:
      break;
  }

  return v9;
}

+ (id)_videoConfigurationFooterForPrefixString:(id)a3 useHEVC:(BOOL)a4 useDolbyVision:(BOOL)a5
{
  uint64_t v6 = @"_HEVC";
  if (!a4) {
    uint64_t v6 = &stru_20A70;
  }
  if (a5) {
    CFStringRef v7 = @"_DOLBY";
  }
  else {
    CFStringRef v7 = &stru_20A70;
  }
  id v8 = v6;
  CFStringRef v9 = +[NSString stringWithFormat:@"%@%@%@_FOOTER", a3, v8, v7];

  return v9;
}

- (void)_setRecordVideoConfiguration:(id)a3
{
  id v14 = a3;
  unint64_t v4 = (unint64_t)[v14 integerValue];
  BOOL v5 = v4 > 0xE || ((1 << v4) & 0x6210) == 0;
  if (v5
    || (unint64_t v6 = v4,
        +[CameraSettingsBaseController capabilities],
        CFStringRef v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isHEVCEncodingSupported],
        v7,
        unsigned __int8 v9 = [(CameraVideoSettingsController *)self _showHEVCOnlyFormatsOnCapableDevices], !v8)|| (v9 & 1) != 0|| v6 > 0xE|| ((1 << v6) & 0x6210) == 0|| CFPreferencesGetAppBooleanValue(CAMUserPreferencesDidConfirmVideoMostCompatible, @"com.apple.camera", 0))
  {
    +[PFMediaCapabilities setRecordVideoConfiguration:v14];
    CFPreferencesAppSynchronize(@"com.apple.camera");
  }
  else
  {
    CFStringRef v10 = 0;
    if (((1 << v6) & 0x6210) != 0)
    {
      CFStringRef v10 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO");
      if (v10)
      {
        if ("_handleVideoMostCompatibleConfirmed:")
        {
          CFStringRef v11 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_TITLE");
          objc_super v12 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_LEARN_MORE");
          id v13 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_OK");
          [(CameraVideoSettingsController *)self _showConfirmationSpecifierWithTitle:v11 prompt:v10 cancelText:v12 okText:v13 target:self confirmationAction:"_handleVideoMostCompatibleConfirmed:" cancelAction:"_handleConfirmHighEfficiencyLearnMore:" value:v14];
        }
      }
    }
  }
}

- (void)_showConfirmationSpecifierWithTitle:(id)a3 prompt:(id)a4 cancelText:(id)a5 okText:(id)a6 target:(id)a7 confirmationAction:(SEL)a8 cancelAction:(SEL)a9 value:(id)a10
{
  id v17 = a10;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = objc_alloc_init((Class)PSConfirmationSpecifier);
  [v23 setTitle:v22];

  [v23 setPrompt:v21];
  [v23 setCancelButton:v20];

  [v23 setOkButton:v19];
  [v23 setUserInfo:v17];

  [v23 setTarget:v18];
  [v23 setConfirmationAction:a8];
  [v23 setConfirmationCancelAction:a9];
  [(CameraVideoSettingsController *)self showConfirmationViewForSpecifier:v23 useAlert:1];
}

- (void)_handleVideoMostCompatibleConfirmed:(id)a3
{
  id v4 = [a3 userInfo];
  +[PFMediaCapabilities setRecordVideoConfiguration:v4];
  CFPreferencesSetAppValue(CAMUserPreferencesDidConfirmVideoMostCompatible, &__kCFBooleanTrue, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");
  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (void)_handleConfirmHighEfficiencyLearnMore:(id)a3
{
  unint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v3 localizedStringForKey:@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_LEARN_MORE_URL" value:&stru_20A70 table:@"CameraSettings"];

  if (v6)
  {
    id v4 = +[NSURL URLWithString:](NSURL, "URLWithString:");
    if (v4)
    {
      BOOL v5 = +[UIApplication sharedApplication];
      [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
    }
  }

  _objc_release_x2();
}

- (void)_setHDR10BitVideoEnabled:(id)a3 specifier:(id)a4
{
  id value = a3;
  if ([value BOOLValue]
    && (+[CameraSettingsBaseController capabilities],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isHEVCEncodingSupported],
        v5,
        unsigned __int8 v7 = [(CameraVideoSettingsController *)self _showHEVCOnlyFormatsOnCapableDevices], v6)&& (v7 & 1) == 0&& !CFPreferencesGetAppBooleanValue(didConfirmHDR10BitVideoMostCompatiblePreference, @"com.apple.camera", 0))
  {
    unsigned int v8 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_HDR_VIDEO_TITLE");
    unsigned __int8 v9 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_HDR_VIDEO");
    CFStringRef v10 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_LEARN_MORE");
    CFStringRef v11 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_OK");
    [(CameraVideoSettingsController *)self _showConfirmationSpecifierWithTitle:v8 prompt:v9 cancelText:v10 okText:v11 target:self confirmationAction:"_handleHDR10BitVideoMostCompatibleConfirmed:" cancelAction:"_handleConfirmHDRVideoHighEfficiencyLearnMore:" value:0];
  }
  else
  {
    CFPreferencesSetAppValue(@"CAMUserPreferenceHDR10BitVideoEnabled", value, @"com.apple.camera");
    CFPreferencesAppSynchronize(@"com.apple.camera");
    [(CameraSettingsBaseController *)self reloadSpecifiers];
  }
}

- (void)_handleHDR10BitVideoMostCompatibleConfirmed:(id)a3
{
  CFPreferencesSetAppValue(@"CAMUserPreferenceHDR10BitVideoEnabled", &__kCFBooleanTrue, @"com.apple.camera");
  CFPreferencesSetAppValue(didConfirmHDR10BitVideoMostCompatiblePreference, &__kCFBooleanTrue, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");

  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (void)_handleConfirmHDRVideoHighEfficiencyLearnMore:(id)a3
{
  uint64_t v3 = sub_BF7C(@"CAM_CONFIRM_HIGH_EFFICIENCY_HDR_VIDEO_LEARN_MORE_URL");
  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
    if (v4)
    {
      BOOL v5 = +[UIApplication sharedApplication];
      [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
    }
  }

  _objc_release_x1();
}

- (id)_isHDRVideoEnabled:(id)a3
{
  BOOL v3 = [(CameraVideoSettingsController *)self _showHEVCOnlyFormatsOnCapableDevices];
  id v4 = +[CameraSettingsBaseController capabilities];
  BOOL v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[CAMUserPreferences shouldEnableHDR10BitVideoForHEVCEnabled:v3 capabilities:v4]);

  return v5;
}

- (BOOL)_isPALVideoEnabled
{
  return CFPreferencesGetAppBooleanValue(CAMUserPreferenceEnablePALVideoFormats, @"com.apple.camera", 0) != 0;
}

- (id)_isPALVideoEnabled:(id)a3
{
  BOOL v3 = [(CameraVideoSettingsController *)self _isPALVideoEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setPALVideoEnabled:(id)a3 specifier:(id)a4
{
  CFStringRef v5 = (const __CFString *)CAMUserPreferenceEnablePALVideoFormats;
  id v6 = a3;
  CFPreferencesSetAppValue(v5, v6, @"com.apple.camera");
  LOBYTE(v5) = [v6 BOOLValue];

  if ((v5 & 1) == 0)
  {
    int64_t v7 = [(CameraVideoSettingsController *)self _videoConfiguration];
    if (+[CAMCaptureCapabilities isPALVideoConfiguration:v7])
    {
      unsigned int v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        switch(v7)
        {
          case 0:
            CFStringRef v9 = @"Auto";
            break;
          case 1:
            CFStringRef v9 = @"1080p60";
            break;
          case 2:
            CFStringRef v9 = @"720p120";
            break;
          case 3:
            CFStringRef v9 = @"720p240";
            break;
          case 4:
            CFStringRef v9 = @"1080p120";
            break;
          case 5:
            CFStringRef v9 = @"4k30";
            break;
          case 6:
            CFStringRef v9 = @"720p30";
            break;
          case 7:
            CFStringRef v9 = @"1080p30";
            break;
          case 8:
            CFStringRef v9 = @"1080p240";
            break;
          case 9:
            CFStringRef v9 = @"4k60";
            break;
          case 10:
            CFStringRef v9 = @"4k24";
            break;
          case 11:
            CFStringRef v9 = @"1080p25";
            break;
          case 12:
            CFStringRef v9 = @"4k25";
            break;
          case 13:
            CFStringRef v9 = @"4k120";
            break;
          case 14:
            CFStringRef v9 = @"4k100";
            break;
          default:
            switch(v7)
            {
              case 10000:
                CFStringRef v9 = @"ImagePickerHigh";
                break;
              case 10001:
                CFStringRef v9 = @"ImagePickerMedium";
                break;
              case 10002:
                CFStringRef v9 = @"ImagePickerLow";
                break;
              case 10003:
                CFStringRef v9 = @"ImagePickerVGA";
                break;
              case 10004:
                CFStringRef v9 = @"ImagePickeriFrame720p";
                break;
              case 10005:
                CFStringRef v9 = @"ImagePickeriFrame540p";
                break;
              default:
                CFStringRef v9 = 0;
                break;
            }
            break;
        }
        int v15 = 138543362;
        CFStringRef v16 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Resetting PAL video configuration %{public}@ to Auto after disabling PAL", (uint8_t *)&v15, 0xCu);
      }

      CFPreferencesSetAppValue(CAMUserPreferenceVideoConfiguration, &off_24748, @"com.apple.camera");
    }
    int64_t v10 = [(CameraVideoSettingsController *)self _cinematicConfiguration];
    if (+[CAMCaptureCapabilities isPALVideoConfiguration:v10])
    {
      CFStringRef v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        switch(v10)
        {
          case 0:
            CFStringRef v12 = @"Auto";
            break;
          case 1:
            CFStringRef v12 = @"1080p60";
            break;
          case 2:
            CFStringRef v12 = @"720p120";
            break;
          case 3:
            CFStringRef v12 = @"720p240";
            break;
          case 4:
            CFStringRef v12 = @"1080p120";
            break;
          case 5:
            CFStringRef v12 = @"4k30";
            break;
          case 6:
            CFStringRef v12 = @"720p30";
            break;
          case 7:
            CFStringRef v12 = @"1080p30";
            break;
          case 8:
            CFStringRef v12 = @"1080p240";
            break;
          case 9:
            CFStringRef v12 = @"4k60";
            break;
          case 10:
            CFStringRef v12 = @"4k24";
            break;
          case 11:
            CFStringRef v12 = @"1080p25";
            break;
          case 12:
            CFStringRef v12 = @"4k25";
            break;
          case 13:
            CFStringRef v12 = @"4k120";
            break;
          case 14:
            CFStringRef v12 = @"4k100";
            break;
          default:
            switch(v10)
            {
              case 10000:
                CFStringRef v12 = @"ImagePickerHigh";
                break;
              case 10001:
                CFStringRef v12 = @"ImagePickerMedium";
                break;
              case 10002:
                CFStringRef v12 = @"ImagePickerLow";
                break;
              case 10003:
                CFStringRef v12 = @"ImagePickerVGA";
                break;
              case 10004:
                CFStringRef v12 = @"ImagePickeriFrame720p";
                break;
              case 10005:
                CFStringRef v12 = @"ImagePickeriFrame540p";
                break;
              default:
                CFStringRef v12 = 0;
                break;
            }
            break;
        }
        int v15 = 138543362;
        CFStringRef v16 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Resetting PAL cinematic video configuration %{public}@ to Auto after disabling PAL", (uint8_t *)&v15, 0xCu);
      }

      CFPreferencesSetAppValue(CAMUserPreferenceCinematicConfiguration, &off_24748, @"com.apple.camera");
    }
    if (+[CAMCaptureCapabilities isPALVideoConfiguration:[(CameraVideoSettingsController *)self _slomoConfiguration]])
    {
      id v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        switch(v10)
        {
          case 0:
            CFStringRef v14 = @"Auto";
            break;
          case 1:
            CFStringRef v14 = @"1080p60";
            break;
          case 2:
            CFStringRef v14 = @"720p120";
            break;
          case 3:
            CFStringRef v14 = @"720p240";
            break;
          case 4:
            CFStringRef v14 = @"1080p120";
            break;
          case 5:
            CFStringRef v14 = @"4k30";
            break;
          case 6:
            CFStringRef v14 = @"720p30";
            break;
          case 7:
            CFStringRef v14 = @"1080p30";
            break;
          case 8:
            CFStringRef v14 = @"1080p240";
            break;
          case 9:
            CFStringRef v14 = @"4k60";
            break;
          case 10:
            CFStringRef v14 = @"4k24";
            break;
          case 11:
            CFStringRef v14 = @"1080p25";
            break;
          case 12:
            CFStringRef v14 = @"4k25";
            break;
          case 13:
            CFStringRef v14 = @"4k120";
            break;
          case 14:
            CFStringRef v14 = @"4k100";
            break;
          default:
            switch(v10)
            {
              case 10000:
                CFStringRef v14 = @"ImagePickerHigh";
                break;
              case 10001:
                CFStringRef v14 = @"ImagePickerMedium";
                break;
              case 10002:
                CFStringRef v14 = @"ImagePickerLow";
                break;
              case 10003:
                CFStringRef v14 = @"ImagePickerVGA";
                break;
              case 10004:
                CFStringRef v14 = @"ImagePickeriFrame720p";
                break;
              case 10005:
                CFStringRef v14 = @"ImagePickeriFrame540p";
                break;
              default:
                CFStringRef v14 = 0;
                break;
            }
            break;
        }
        int v15 = 138543362;
        CFStringRef v16 = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Resetting PAL slomo video configuration %{public}@ to Auto after disabling PAL", (uint8_t *)&v15, 0xCu);
      }

      CFPreferencesSetAppValue(CAMUserPreferenceSlomoConfiguration, &off_24748, @"com.apple.camera");
    }
  }
  CFPreferencesAppSynchronize(@"com.apple.camera");
  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (id)_isAutoLowLightVideoEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceAutoLowLightVideoEnabled", @"com.apple.camera", &keyExistsAndHasValidFormat))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  uint64_t v4 = v3;
  CFStringRef v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (void)_setAutoLowLightVideoEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"CAMUserPreferenceAutoLowLightVideoEnabled", a3, @"com.apple.camera");

  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (id)_vfrVideoMode:(id)a3
{
  unint64_t AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceVFRMode", @"com.apple.camera", 0);
  uint64_t v4 = 0;
  if (AppIntegerValue <= 2)
  {
    uint64_t v4 = sub_BF7C(off_208C8[AppIntegerValue]);
  }

  return v4;
}

- (id)_shouldDisableCameraSwitchingDuringVideoRecording:(id)a3
{
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceDisableCameraSwitchingDuringVideoRecording", @"com.apple.camera", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)_setShouldDisableCameraSwitchingDuringVideoRecording:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"CAMUserPreferenceDisableCameraSwitchingDuringVideoRecording", a3, @"com.apple.camera");

  CFPreferencesAppSynchronize(@"com.apple.camera");
}

@end