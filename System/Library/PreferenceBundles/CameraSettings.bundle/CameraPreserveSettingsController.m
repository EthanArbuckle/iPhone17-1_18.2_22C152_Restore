@interface CameraPreserveSettingsController
- (id)_groupSpecifierWithID:(id)a3 footer:(id)a4;
- (id)_switchSpecifierWithLabel:(id)a3 key:(id)a4 defaultValue:(BOOL)a5;
- (id)specifiers;
- (void)emitNavigationEvent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CameraPreserveSettingsController

- (id)specifiers
{
  v3 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_66;
  }
  uint64_t v90 = OBJC_IVAR___PSListController__specifiers;
  v4 = +[CameraSettingsBaseController capabilities];
  +[CAMUserPreferences performApertureMigrationWithCapabilities:v4];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"CAM_PRESERVE_CAMERA_MODE_SWITCH" value:&stru_20A70 table:@"CameraSettings"];
  v7 = [v5 localizedStringForKey:@"CAM_PRESERVE_CAMERA_MODE_FOOTER" value:&stru_20A70 table:@"CameraSettings"];
  unsigned int v8 = [v4 isCTMSupported];
  if (v8)
  {
    uint64_t v9 = [v5 localizedStringForKey:@"CAM_PRESERVE_CAMERA_MODE_VIDEO_FOOTER" value:&stru_20A70 table:@"CameraSettings"];

    v7 = (void *)v9;
  }
  v89 = (void *)v6;
  uint64_t v10 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v6 key:@"CAMUserPreferencePreserveCaptureMode" defaultValue:0];
  v87 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"modeGroup" footer:v7];
  v88 = (void *)v10;
  v11 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v10, 0);
  unsigned int v86 = [v4 isLivePhotoSupported];
  if (v8)
  {
    v12 = sub_AAD8(@"CAM_PRESERVE_LAST_OPENED_DRAWER_CONTROL_FOOTER");
    v13 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"preserveLastOpenedDrawerControlGroup" footer:v12];
    [v11 addObject:v13];

    v14 = sub_AAD8(@"CAM_PRESERVE_LAST_OPENED_DRAWER_CONTROL_SWITCH");
    v15 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v14 key:CAMUserPreferencePreservePreferredDrawerControl defaultValue:0];
    [v11 addObject:v15];
  }
  if ([v4 smartStylesSupported])
  {
    v16 = sub_AAD8(@"CAM_PRESERVE_SMART_STYLE_FOOTER");
    v17 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"preserveSmartStyleGroup" footer:v16];
    [v11 addObject:v17];

    v18 = sub_AAD8(@"CAM_PRESERVE_SMART_STYLE_SWITCH");
    v19 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v18 key:CAMUserPreferencePreserveSmartStyle defaultValue:0];
    [v11 addObject:v19];
  }
  if ([v4 isPreserveCreativeControlsSupported])
  {
    unsigned int v20 = [v4 arePortraitEffectsSupported];
    if (v20) {
      CFStringRef v21 = @"CAM_PRESERVE_PHOTO_FILTER_LIGHTING_FOOTER";
    }
    else {
      CFStringRef v21 = @"CAM_PRESERVE_PHOTO_FILTER_FOOTER";
    }
    if (v20) {
      CFStringRef v22 = @"CAM_PRESERVE_PHOTO_FILTER_LIGHTING_SWITCH";
    }
    else {
      CFStringRef v22 = @"CAM_PRESERVE_PHOTO_FILTER_SWITCH";
    }
    v23 = [v5 localizedStringForKey:v22 value:&stru_20A70 table:@"CameraSettings"];
    v24 = [v5 localizedStringForKey:v21 value:&stru_20A70 table:@"CameraSettings"];
    unsigned int v25 = [v4 isDepthEffectApertureSupported];
    if ([v4 smartStylesSupported])
    {
      uint64_t v26 = sub_AAD8(@"CAM_PRESERVE_LIGHTING_ASPECT_SWITCH");

      uint64_t v27 = sub_AAD8(@"CAM_PRESERVE_LIGHTING_ASPECT_FOOTER");
      v23 = (void *)v26;
    }
    else
    {
      if (v8)
      {
        uint64_t v28 = [v5 localizedStringForKey:@"CAM_PRESERVE_PHOTO_FILTER_LIGHTING_APERTURE_SWITCH" value:&stru_20A70 table:@"CameraSettings"];

        CFStringRef v29 = @"CAM_PRESERVE_PHOTO_FILTER_LIGHTING_ASPECT_FOOTER";
      }
      else
      {
        if (!v25)
        {
LABEL_23:
          v30 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v23 key:CAMUserPreferencePreserveEffectFilter defaultValue:0];
          v31 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"filterGroup" footer:v24];
          [v11 addObject:v31];
          [v11 addObject:v30];

          goto LABEL_24;
        }
        uint64_t v28 = [v5 localizedStringForKey:@"CAM_PRESERVE_PHOTO_FILTER_LIGHTING_APERTURE_SWITCH" value:&stru_20A70 table:@"CameraSettings"];

        CFStringRef v29 = @"CAM_PRESERVE_PHOTO_FILTER_LIGHTING_FOOTER";
      }
      uint64_t v27 = [v5 localizedStringForKey:v29 value:&stru_20A70 table:@"CameraSettings"];
      v23 = (void *)v28;
    }

    v24 = (void *)v27;
    goto LABEL_23;
  }
LABEL_24:
  if ([v4 isDepthEffectApertureSupported])
  {
    v32 = [v5 localizedStringForKey:@"CAM_PRESERVE_APERTURE_SWITCH" value:&stru_20A70 table:@"CameraSettings"];
    if ([v4 photoModeDepthSuggestionSupported]) {
      v33 = @"CAM_PRESERVE_APERTURE_FOOTER_PHOTO_MODE";
    }
    else {
      v33 = @"CAM_PRESERVE_APERTURE_FOOTER";
    }
    v34 = sub_AAD8(v33);
    v35 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v32 key:CAMUserPreferencePreserveAperture defaultValue:0];
    v36 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"apertureGroup" footer:v34];
    [v11 addObject:v36];
    [v11 addObject:v35];
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceEnableSuperWideAutoMacro", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if (AppBooleanValue) {
      goto LABEL_35;
    }
  }
  else if (([v4 macroControlEnabledByDefault] & 1) == 0)
  {
    goto LABEL_35;
  }
  if ([v4 isSuperWideAutoMacroSupported])
  {
    v38 = sub_AAD8(@"AUTO_MACRO_SWITCH");
    v39 = sub_AAD8(@"CAM_PRESERVE_AUTO_MACRO_FOOTER");
    v40 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v38 key:@"CAMUserPreferencePreserveSuperWideAutoMacro" defaultValue:0];
    v41 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"autoMacroGroup" footer:v39];
    [v11 addObject:v41];
    [v11 addObject:v40];
  }
LABEL_35:
  if ([v4 isExposureSliderSupported])
  {
    v42 = [v5 localizedStringForKey:@"CAM_PRESERVE_EXPOSURE_SWITCH" value:&stru_20A70 table:@"CameraSettings"];
    v43 = [v5 localizedStringForKey:@"CAM_PRESERVE_EXPOSURE_FOOTER" value:&stru_20A70 table:@"CameraSettings"];
    v44 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v42 key:@"CAMUserPreferencePreserveExposure" defaultValue:0];
    v45 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"exposureGroup" footer:v43];
    [v11 addObject:v45];
    [v11 addObject:v44];
  }
  if ([v4 isLowLightSupported])
  {
    v46 = [v5 localizedStringForKey:@"CAM_PRESERVE_NIGHT_MODE_SWITCH" value:&stru_20A70 table:@"CameraSettings"];
    v47 = [v5 localizedStringForKey:@"CAM_PRESERVE_NIGHT_MODE_FOOTER" value:&stru_20A70 table:@"CameraSettings"];
    v48 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v46 key:@"CAMUserPreferencePreserveNightMode" defaultValue:0];
    v49 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"nightModeGroup" footer:v47];
    [v11 addObject:v49];
    [v11 addObject:v48];
  }
  if ([v4 portraitZoomSupported])
  {
    v50 = sub_AAD8(@"CAM_PRESERVE_PORTRAIT_ZOOM_SWITCH");
    v51 = sub_AAD8(@"CAM_PRESERVE_PORTRAIT_ZOOM_FOOTER");
    v52 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v50 key:@"CAMUserPreferencePreservePortraitZoom" defaultValue:1];
    v53 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"portraitZoomGroup" footer:v51];
    [v11 addObject:v53];
    [v11 addObject:v52];
  }
  if ([v4 isVideoStabilizationControlSupported])
  {
    v54 = sub_AAD8(@"CAM_PRESERVE_VIDEO_STABILIZATION_SWITCH");
    v55 = sub_AAD8(@"CAM_PRESERVE_VIDEO_STABILIZATION_FOOTER");
    v56 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v54 key:CAMUserPreferencePreserveVideoStabilization defaultValue:0];
    v57 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"videoStabilizationGroup" footer:v55];
    [v11 addObject:v57];
    [v11 addObject:v56];
  }
  unsigned int v58 = [v4 isPhotoResolutionSupported:3 forPhotoEncoding:1];
  int v59 = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceEnableLinearDNGControl", @"com.apple.camera", 0);
  unsigned int v60 = [v4 isLinearDNGSupported];
  int v61 = CFPreferencesGetAppBooleanValue(CAMUserPreferenceEnablePhotoFormatControl, @"com.apple.camera", 0);
  if (v60)
  {
    if (!v59) {
      goto LABEL_58;
    }
    if (v58) {
      v62 = @"CAM_PRESERVE_PRO_RAW_48MP_SWITCH";
    }
    else {
      v62 = @"CAM_PRESERVE_LINEAR_DNG_SWITCH";
    }
    if (v58) {
      v63 = @"CAM_PRESERVE_PRO_RAW_48MP_FOOTER";
    }
    else {
      v63 = @"CAM_PRESERVE_LINEAR_DNG_FOOTER";
    }
    v64 = sub_AAD8(v62);
    v65 = sub_AAD8(v63);
    v66 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v64 key:@"CAMUserPreferencePreserveRAW" defaultValue:0];
    CFStringRef v67 = @"rawGroup";
  }
  else
  {
    if (v61) {
      unsigned int v68 = v58;
    }
    else {
      unsigned int v68 = 0;
    }
    if (v68 != 1) {
      goto LABEL_58;
    }
    v64 = sub_AAD8(@"CAM_PRESERVE_48MP_CONTROL_SWITCH");
    v65 = sub_AAD8(@"CAM_PRESERVE_48MP_CONTROL_FOOTER");
    v66 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v64 key:CAMUserPreferencePreservePhotoResolution defaultValue:0];
    CFStringRef v67 = @"photoFormatControlGroup";
  }
  v69 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:v67 footer:v65];
  [v11 addObject:v69];
  [v11 addObject:v66];

LABEL_58:
  int v70 = CFPreferencesGetAppBooleanValue(CAMUserPreferenceEnableProResControl, @"com.apple.camera", 0);
  if ([v4 isProResVideoSupported] && v70)
  {
    v71 = sub_AAD8(@"CAM_PRESERVE_PRO_RES_SWITCH");
    v72 = sub_AAD8(@"CAM_PRESERVE_PRO_RES_FOOTER");
    v73 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v71 key:@"CAMUserPreferencePreserveProRes" defaultValue:0];
    v74 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"proResGroup" footer:v72];
    [v11 addObject:v74];
    [v11 addObject:v73];
  }
  if (v86)
  {
    v75 = [v5 localizedStringForKey:@"CAM_PRESERVE_LIVE_PHOTO_SWITCH" value:&stru_20A70 table:@"CameraSettings"];
    v76 = [v5 localizedStringForKey:@"CAM_PRESERVE_LIVE_PHOTO_FOOTER" value:&stru_20A70 table:@"CameraSettings"];
    v77 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v75 key:@"CAMUserPreferencePreserveLivePhoto" defaultValue:1];
    v78 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"livePhotoGroup" footer:v76];
    [v11 addObject:v78];
    [v11 addObject:v77];
  }
  if ([v4 isSpatialVideoCaptureSupported])
  {
    v79 = sub_AAD8(@"CAM_PRESERVE_SPATIAL_VIDEO_ENABLED_SWITCH");
    v80 = sub_AAD8(@"CAM_PRESERVE_SPATIAL_VIDEO_ENABLED_FOOTER");
    v81 = [(CameraPreserveSettingsController *)self _switchSpecifierWithLabel:v79 key:CAMUserPreferencePreserveSpatialVideoEnabled defaultValue:0];
    v82 = [(CameraPreserveSettingsController *)self _groupSpecifierWithID:@"spatialVideoGroup" footer:v80];
    [v11 addObject:v82];
    [v11 addObject:v81];
  }
  +[CameraSettingsBaseController allowMultilineTitlesForSpecifiers:v11];
  id v83 = [v11 copy];
  v84 = *(void **)&self->super.PSListController_opaque[v90];
  *(void *)&self->super.PSListController_opaque[v90] = v83;

  v3 = *(void **)&self->super.PSListController_opaque[v90];
LABEL_66:

  return v3;
}

- (id)_switchSpecifierWithLabel:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
  [v9 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
  [v9 setObject:v8 forKeyedSubscript:PSKeyNameKey];

  uint64_t v10 = +[NSNumber numberWithBool:v5];
  [v9 setObject:v10 forKeyedSubscript:PSDefaultValueKey];

  return v9;
}

- (id)_groupSpecifierWithID:(id)a3 footer:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[PSSpecifier groupSpecifierWithID:a3];
  [v6 setObject:v5 forKeyedSubscript:PSFooterTextGroupKey];

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CameraPreserveSettingsController;
  [(CameraPreserveSettingsController *)&v4 viewDidAppear:a3];
  [(CameraPreserveSettingsController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  v3 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Camera/CameraPreserveSettingsSwitch"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  id v5 = +[NSLocale currentLocale];
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"CAM_PRESERVE_SETTINGS_TITLE" table:@"CameraSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  uint64_t v10 = +[NSLocale currentLocale];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"CAMERA_SETTINGS_TITLE" table:@"CameraSettings" locale:v10 bundleURL:v12];

  id v15 = v13;
  v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(CameraPreserveSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.camera" title:v8 localizedNavigationComponents:v14 deepLink:v3];
}

@end