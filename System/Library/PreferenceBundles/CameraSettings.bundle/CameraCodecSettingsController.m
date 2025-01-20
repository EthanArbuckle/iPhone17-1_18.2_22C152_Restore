@interface CameraCodecSettingsController
+ (id)_titleForColorSpace:(int64_t)a3;
- (BOOL)_didAppearAtLeastOnce;
- (id)_enhancedRAWResolution:(id)a3;
- (id)_enhancedResolution:(id)a3;
- (id)_enhancedResolutionFooterForPhotoEncodingBehavior:(int64_t)a3 allow48MP:(BOOL)a4 capabilities:(id)a5;
- (id)_photoResolutionValuesForPhotoEncodingBehavior:(int64_t)a3 allow48MP:(BOOL)a4 outTitles:(id *)a5 capabilities:(id)a6;
- (id)_proResColorSpace:(id)a3;
- (id)_secondaryPhotoFormat:(id)a3;
- (id)specifiers;
- (void)_setLinearDNGControlEnabled:(id)a3 specifier:(id)a4;
- (void)_setProResControlEnabled:(id)a3 specifier:(id)a4;
- (void)emitNavigationEvent;
- (void)set_didAppearAtLeastOnce:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CameraCodecSettingsController

- (id)specifiers
{
  v3 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_92;
  }
  uint64_t v106 = OBJC_IVAR___PSListController__specifiers;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = +[CameraSettingsBaseController capabilities];
  if ([v5 isHEVCEncodingSupported])
  {
    v6 = sub_6C5C(@"CAM_FORMATS_CAPTURE_FOOTER");
    id v7 = [v5 back4kMaxFPS];
    id v8 = [v5 backHighFrameRate1080pMaxFPS];
    if ((uint64_t)v7 < 31 || (uint64_t)v8 < 121)
    {
LABEL_13:
      v11 = sub_6C5C(@"CAM_FORMATS_CAPTURE_TITLE");
      v12 = +[PSSpecifier groupSpecifierWithName:v11];

      [v12 setProperty:v6 forKey:PSFooterTextGroupKey];
      [v12 setProperty:@"CameraCaptureGroupSpecifier" forKey:PSIDKey];
      [v12 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
      v13 = sub_6C5C(@"CAM_FORMATS_CAPTURE_HIGH_EFFICIENCY");
      v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

      v15 = sub_6C5C(@"CAM_FORMATS_CAPTURE_MOST_COMPATIBLE");
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

      if (+[PFMediaCapabilities newFormatsConfiguration] == (char *)&dword_0 + 1) {
        v17 = v16;
      }
      else {
        v17 = v14;
      }
      uint64_t v18 = PSRadioGroupCheckedSpecifierKey;
      id v19 = v17;
      [v12 setProperty:v19 forKey:v18];
      [v4 addObject:v12];
      [v4 addObject:v14];
      [v4 addObject:v16];

      goto LABEL_17;
    }
    if ((unint64_t)v7 < 0x3D)
    {
      if ([v5 isCinematicModeSupported])
      {
        v9 = @"CAM_FORMATS_CAPTURE_FOOTER_CINEMATIC_4k60_1080P240_HDR_VIDEO";
      }
      else
      {
        if (![v5 isHDR10BitVideoSupported])
        {
          v95 = +[NSBundle bundleForClass:objc_opt_class()];
          uint64_t v10 = [v95 localizedStringForKey:@"CAM_FORMATS_CAPTURE_FOOTER_4k60_1080P240" value:&stru_20A70 table:@"CameraSettings"];

          v6 = v95;
          goto LABEL_12;
        }
        v9 = @"CAM_FORMATS_CAPTURE_FOOTER_4k60_1080P240_HDR_VIDEO";
      }
    }
    else
    {
      v9 = @"CAM_FORMATS_CAPTURE_FOOTER_CINEMATIC_4k120_1080P240_HDR_VIDEO";
    }
    uint64_t v10 = sub_6C5C(v9);
LABEL_12:

    v6 = (void *)v10;
    goto LABEL_13;
  }
LABEL_17:
  unsigned int v20 = [v5 isLinearDNGSupported];
  unsigned int v21 = [v5 isPhotoResolutionSupported:3 forPhotoEncoding:1];
  unsigned int v22 = [v5 isPhotoResolutionSupported:2 forPhotoEncoding:1];
  unsigned int v23 = v22;
  if ((v20 & 1) != 0 || (v21 & 1) != 0 || v22)
  {
    v25 = sub_6C5C(@"CAM_PHOTO_CAPTURE_HEADER");
    v24 = +[PSSpecifier groupSpecifierWithName:v25];

    [v4 addObject:v24];
  }
  else
  {
    v24 = 0;
  }
  v107 = v24;
  if (v23)
  {
    BOOL v102 = +[PFMediaCapabilities newFormatsConfiguration] != (char *)&dword_0 + 1;
    if ([v5 isCameraButtonSupported]) {
      v26 = @"ENHANCED_RESOLUTION_FOOTER_CAMERA_BUTTON";
    }
    else {
      v26 = @"ENHANCED_RESOLUTION_FOOTER";
    }
    v27 = sub_6C5C(v26);
    [v24 setObject:v27 forKeyedSubscript:PSFooterTextGroupKey];

    v28 = sub_6C5C(@"ENHANCED_RESOLUTION_TITLE");
    v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:"setPreferenceValue:specifier:" get:"_enhancedResolution:" detail:objc_opt_class() cell:2 edit:0];

    [v29 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v29 setObject:CAMUserPreferencePreferredHEICPhotoResolution forKeyedSubscript:PSKeyNameKey];
    [v4 addObject:v29];
    id v113 = 0;
    v30 = [(CameraCodecSettingsController *)self _photoResolutionValuesForPhotoEncodingBehavior:v102 allow48MP:0 outTitles:&v113 capabilities:v5];
    id v31 = v113;
    [v29 setValues:v30 titles:v31 shortTitles:v31];
    v32 = [(CameraCodecSettingsController *)self _enhancedResolutionFooterForPhotoEncodingBehavior:v102 allow48MP:0 capabilities:v5];
    [v29 setObject:v32 forKeyedSubscript:PSStaticTextMessageKey];

    v24 = v107;
  }
  if (v20)
  {
    unsigned int v33 = [v5 enhancedRAWResolutionSupported];
    unsigned __int8 v34 = [v5 isBackQuadraSuperWideSupported];
    unsigned int v103 = v21;
    unsigned int v98 = v33;
    if (v21)
    {
      unsigned __int8 v35 = v34;
      v36 = sub_6C5C(@"CAM_PRO_RAW_48MP_TITLE");
      unsigned int v37 = [v5 isCameraButtonSupported];
      CFStringRef v38 = @"CAM_PRO_RAW_48MP_FOOTER";
      if (v37)
      {
        CFStringRef v38 = @"CAM_PRO_RAW_48MP_FOOTER_CAMERA_BUTTON";
        CFStringRef v39 = @"CAM_PRO_RAW_48MP_FOOTER_ULTRA_WIDE_CAMERA_BUTTON";
      }
      else
      {
        CFStringRef v39 = @"CAM_PRO_RAW_48MP_FOOTER_ULTRA_WIDE";
      }
      CFStringRef v40 = @"CAM_PRO_RAW_48MP_FOOTER_24MP";
      if (v37) {
        CFStringRef v40 = @"CAM_PRO_RAW_48MP_FOOTER_24MP_CAMERA_BUTTON";
      }
      if ((v35 & 1) == 0) {
        CFStringRef v39 = v40;
      }
      if (v23) {
        v41 = (__CFString *)v39;
      }
      else {
        v41 = (__CFString *)v38;
      }
    }
    else
    {
      v36 = sub_6C5C(@"CAM_LINEAR_DNG_TITLE");
      if (v33)
      {
        if ([v5 isCameraButtonSupported]) {
          v41 = @"CAM_LINEAR_DNG_10_BIT_NO_SIZE_FOOTER_CAMERA_BUTTON";
        }
        else {
          v41 = @"CAM_LINEAR_DNG_10_BIT_NO_SIZE_FOOTER";
        }
      }
      else
      {
        v41 = @"CAM_LINEAR_DNG_FOOTER";
      }
    }
    uint64_t v46 = sub_6C5C(v41);
    v47 = [v4 lastObject];

    v100 = (void *)v46;
    if (v47 == v24)
    {
      [v24 setObject:v46 forKeyedSubscript:PSFooterTextGroupKey];
    }
    else
    {
      v48 = +[PSSpecifier groupSpecifierWithID:@"linearDNGGroup"];
      [v48 setObject:v46 forKeyedSubscript:PSFooterTextGroupKey];
      [v4 addObject:v48];
    }
    v49 = v4;
    v50 = +[PSSpecifier preferenceSpecifierNamed:v36 target:self set:"_setLinearDNGControlEnabled:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
    uint64_t v51 = PSDefaultsKey;
    [v50 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    CFStringRef v52 = (const __CFString *)CAMUserPreferenceEnableLinearDNGControl;
    uint64_t v53 = PSKeyNameKey;
    [v50 setObject:CAMUserPreferenceEnableLinearDNGControl forKeyedSubscript:PSKeyNameKey];
    [v50 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
    [v49 addObject:v50];
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v52, @"com.apple.camera", 0);
    int v55 = v98 ^ 1;
    if (!AppBooleanValue) {
      int v55 = 1;
    }
    if ((v55 | v103))
    {
      id v4 = v49;
      v24 = v107;
      v56 = (void *)v46;
      if (!AppBooleanValue || ((v103 ^ 1) & 1) != 0) {
        goto LABEL_61;
      }
      v57 = sub_6C5C(@"CAM_SECONDARY_PHOTO_FORMAT_TITLE");
      v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:self set:0 get:"_secondaryPhotoFormat:" detail:objc_opt_class() cell:2 edit:0];

      [v4 addObject:v58];
    }
    else
    {
      v59 = sub_6C5C(@"CAM_PRO_RES_RESOLUTION");
      v104 = v36;
      v58 = +[PSSpecifier preferenceSpecifierNamed:v59 target:self set:"setPreferenceValue:specifier:" get:"_enhancedRAWResolution:" detail:objc_opt_class() cell:2 edit:0];

      id v112 = 0;
      v60 = [(CameraCodecSettingsController *)self _photoResolutionValuesForPhotoEncodingBehavior:2 allow48MP:1 outTitles:&v112 capabilities:v5];
      id v61 = v112;
      [v58 setValues:v60 titles:v61 shortTitles:v61];
      [v58 setObject:@"com.apple.camera" forKeyedSubscript:v51];
      [v58 setObject:CAMUserPreferenceMaximumRAWPhotoResolution forKeyedSubscript:v53];
      [v49 addObject:v58];
      v62 = [(CameraCodecSettingsController *)self _enhancedResolutionFooterForPhotoEncodingBehavior:2 allow48MP:1 capabilities:v5];
      [v58 setObject:v62 forKeyedSubscript:PSStaticTextMessageKey];

      v36 = v104;
      id v4 = v49;
      v24 = v107;
      v56 = v100;
    }

LABEL_61:
LABEL_64:

    goto LABEL_65;
  }
  if (v21)
  {
    if ([v5 isCameraButtonSupported]) {
      v42 = @"48MP_CONTROL_FOOTER_CAMERA_BUTTON";
    }
    else {
      v42 = @"48MP_CONTROL_FOOTER";
    }
    v36 = sub_6C5C(v42);
    uint64_t v43 = PSFooterTextGroupKey;
    v44 = [v24 objectForKeyedSubscript:PSFooterTextGroupKey];

    if (v44)
    {
      v45 = +[PSSpecifier groupSpecifierWithID:@"48MPControlGroup"];
      [v45 setObject:v36 forKeyedSubscript:v43];
      [v4 addObject:v45];
    }
    else
    {
      [v24 setObject:v36 forKeyedSubscript:v43];
    }
    v63 = sub_6C5C(@"48MP_CONTROL_TITLE");
    v56 = +[PSSpecifier preferenceSpecifierNamed:v63 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    [v56 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v56 setObject:CAMUserPreferenceEnablePhotoFormatControl forKeyedSubscript:PSKeyNameKey];
    [v56 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
    [v4 addObject:v56];
    goto LABEL_64;
  }
LABEL_65:
  if ([v5 isSpatialVideoCaptureSupported])
  {
    v64 = sub_6C5C(@"CAM_FORMATS_VIDEO_CAPTURE_GROUP_TITLE");
    v65 = +[PSSpecifier groupSpecifierWithName:v64];

    v66 = sub_6C5C(@"SPATIAL_VIDEO_CAPTURE_FOOTER");
    [v65 setObject:v66 forKeyedSubscript:PSFooterTextGroupKey];

    [v4 addObject:v65];
    v67 = sub_6C5C(@"SPATIAL_VIDEO_CAPTURE_SWITCH_LABEL");
    v68 = +[PSSpecifier preferenceSpecifierNamed:v67 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    [v68 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v68 setObject:CAMUserPreferenceEnableSpatialVideoCaptureControl forKeyedSubscript:PSKeyNameKey];
    [v68 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    [v4 addObject:v68];
  }
  if ([v5 isProResVideoSupported])
  {
    v69 = sub_6C5C(@"CAM_FORMATS_PRO_RES_TITLE");
    unsigned int v70 = [v5 isProResVideoSupportedForMode:1 videoConfiguration:5 outputToExternalStorage:0];
    unsigned int v71 = [v5 isProResVideoSupportedForMode:1 videoConfiguration:13 outputToExternalStorage:1];
    unsigned int v72 = [v5 externalStorageSupported];
    CFStringRef v73 = @"CAM_FORMATS_PRO_RES_1080P_ONLY_FOOTER";
    if (v70) {
      CFStringRef v73 = @"CAM_FORMATS_PRO_RES_FOOTER";
    }
    CFStringRef v74 = @"CAM_FORMATS_PRO_RES_EXTERNAL_STORAGE_1080P_ONLY_FOOTER";
    if (v70) {
      CFStringRef v74 = @"CAM_FORMATS_PRO_RES_EXTERNAL_STORAGE_FOOTER";
    }
    if (v71) {
      CFStringRef v74 = @"CAM_FORMATS_PRO_RES_EXTERNAL_STORAGE_FOOTER_4k_120";
    }
    if (v72) {
      v75 = (__CFString *)v74;
    }
    else {
      v75 = (__CFString *)v73;
    }
    v76 = sub_6C5C(v75);
    if ([v5 isSpatialVideoCaptureSupported])
    {
      v77 = +[PSSpecifier groupSpecifierWithID:@"proResGroup"];
    }
    else
    {
      v78 = sub_6C5C(@"CAM_FORMATS_VIDEO_CAPTURE_GROUP_TITLE");
      v77 = +[PSSpecifier groupSpecifierWithName:v78];
    }
    [v77 setObject:v76 forKeyedSubscript:PSFooterTextGroupKey];
    [v4 addObject:v77];
    v79 = +[PSSpecifier preferenceSpecifierNamed:v69 target:self set:"_setProResControlEnabled:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
    uint64_t v105 = PSDefaultsKey;
    objc_msgSend(v79, "setObject:forKeyedSubscript:", @"com.apple.camera");
    CFStringRef v80 = (const __CFString *)CAMUserPreferenceEnableProResControl;
    uint64_t v101 = PSKeyNameKey;
    objc_msgSend(v79, "setObject:forKeyedSubscript:", CAMUserPreferenceEnableProResControl);
    [v79 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
    [v4 addObject:v79];
    if (CFPreferencesGetAppBooleanValue(v80, @"com.apple.camera", 0)
      && [v5 isProResLogColorSpaceSupported])
    {
      v96 = v76;
      v97 = v69;
      v99 = v4;
      v81 = [v5 supportedProResColorSpaces];
      id v82 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v81, "count"));
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v83 = v81;
      id v84 = [v83 countByEnumeratingWithState:&v108 objects:v114 count:16];
      if (v84)
      {
        id v85 = v84;
        uint64_t v86 = *(void *)v109;
        do
        {
          for (i = 0; i != v85; i = (char *)i + 1)
          {
            if (*(void *)v109 != v86) {
              objc_enumerationMutation(v83);
            }
            v88 = objc_msgSend((id)objc_opt_class(), "_titleForColorSpace:", objc_msgSend(*(id *)(*((void *)&v108 + 1) + 8 * i), "integerValue"));
            [v82 addObject:v88];
          }
          id v85 = [v83 countByEnumeratingWithState:&v108 objects:v114 count:16];
        }
        while (v85);
      }

      v89 = sub_6C5C(@"PRO_RES_COLOR_SPACE_TITLE");
      v90 = +[PSSpecifier preferenceSpecifierNamed:v89 target:self set:"setPreferenceValue:specifier:" get:"_proResColorSpace:" detail:objc_opt_class() cell:2 edit:0];

      [v90 setObject:@"com.apple.camera" forKeyedSubscript:v105];
      [v90 setObject:CAMUserPreferenceExplicitProResColorSpace forKeyedSubscript:v101];
      [v90 setValues:v83 titles:v82 shortTitles:v82];
      v91 = sub_6C5C(@"PRO_RES_COLOR_SPACE_FOOTER");
      [v90 setObject:v91 forKeyedSubscript:PSStaticTextMessageKey];

      id v4 = v99;
      [v99 addObject:v90];

      v24 = v107;
      v76 = v96;
      v69 = v97;
    }
  }
  +[CameraSettingsBaseController allowMultilineTitlesForSpecifiers:v4];
  id v92 = [v4 copy];
  v93 = *(void **)&self->super.PSListController_opaque[v106];
  *(void *)&self->super.PSListController_opaque[v106] = v92;

  v3 = *(void **)&self->super.PSListController_opaque[v106];
LABEL_92:

  return v3;
}

+ (id)_titleForColorSpace:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v4 = @"PRO_RES_COLOR_SPACE_SDR";
      goto LABEL_7;
    case 2:
      id v4 = @"PRO_RES_COLOR_SPACE_HDR";
LABEL_7:
      v5 = sub_6C5C(v4);
      return v5;
    case 3:
      id v4 = @"PRO_RES_COLOR_SPACE_LOG";
      goto LABEL_7;
  }
  v5 = 0;
  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CameraCodecSettingsController;
  [(CameraCodecSettingsController *)&v4 viewDidAppear:a3];
  [(CameraCodecSettingsController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  uint64_t v3 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Camera/CameraFormatsSettingsList"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"CAM_FORMATS_TITLE" table:@"CameraSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  uint64_t v10 = +[NSLocale currentLocale];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"CAMERA_SETTINGS_TITLE" table:@"CameraSettings" locale:v10 bundleURL:v12];

  id v15 = v13;
  v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(CameraCodecSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.camera" title:v8 localizedNavigationComponents:v14 deepLink:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CameraCodecSettingsController;
  [(CameraSettingsBaseController *)&v4 viewWillAppear:a3];
  if ([(CameraCodecSettingsController *)self _didAppearAtLeastOnce]) {
    [(CameraSettingsBaseController *)self reloadSpecifiers];
  }
  [(CameraCodecSettingsController *)self set_didAppearAtLeastOnce:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CameraCodecSettingsController;
  [(CameraCodecSettingsController *)&v15 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(CameraCodecSettingsController *)self specifierForID:@"CameraCaptureGroupSpecifier"];
  if (v7)
  {
    id v8 = [(CameraCodecSettingsController *)self indexPathForSpecifier:v7];
    uint64_t v9 = (uint64_t)[v8 section];
  }
  else
  {
    uint64_t v9 = -1;
  }
  if ([v6 section] == (id)v9)
  {
    BOOL v10 = [v6 row] == (char *)&dword_0 + 1;
    id v11 = +[PFMediaCapabilities newFormatsConfiguration];
    +[PFMediaCapabilities setNewFormatsConfiguration:v10 fromSource:2];
    if (v11 != (id)v10)
    {
      v12 = +[NSNotificationCenter defaultCenter];
      CFStringRef v16 = @"PFMediaCaptureEncodingBehaviorKey";
      id v13 = +[NSNumber numberWithInteger:v10];
      v17 = v13;
      v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      [v12 postNotificationName:@"PFMediaCaptureEncodingBehaviorChangedNotification" object:self userInfo:v14];

      [(CameraSettingsBaseController *)self reloadSpecifiers];
    }
  }
}

- (void)_setLinearDNGControlEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(CAMUserPreferenceEnableLinearDNGControl, a3, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");

  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (void)_setProResControlEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(CAMUserPreferenceEnableProResControl, a3, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");

  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (id)_enhancedResolution:(id)a3
{
  BOOL v3 = +[PFMediaCapabilities newFormatsConfiguration] != (char *)&dword_0 + 1;
  objc_super v4 = +[CameraSettingsBaseController capabilities];
  Boolean keyExistsAndHasValidFormat = 0;
  v5 = +[NSNumber numberWithLong:CFPreferencesGetAppIntegerValue(CAMUserPreferencePreferredHEICPhotoResolution, @"com.apple.camera", &keyExistsAndHasValidFormat)];
  id v6 = [v4 defaultPhotoResolutionForMode:0 devicePosition:0 encodingBehavior:v3];
  id v7 = v6;
  if (keyExistsAndHasValidFormat) {
    id v8 = [v5 integerValue];
  }
  else {
    id v8 = v6;
  }
  if ([v4 isPhotoResolutionSupported:v8 forMode:0 device:0 photoEncoding:v3]) {
    id v9 = v8;
  }
  else {
    id v9 = v7;
  }
  BOOL v10 = +[NSNumber numberWithInteger:v9];

  return v10;
}

- (id)_enhancedRAWResolution:(id)a3
{
  BOOL v3 = +[CameraSettingsBaseController capabilities];
  Boolean keyExistsAndHasValidFormat = 0;
  objc_super v4 = +[NSNumber numberWithLong:CFPreferencesGetAppIntegerValue(CAMUserPreferenceMaximumRAWPhotoResolution, @"com.apple.camera", &keyExistsAndHasValidFormat)];
  id v5 = [v3 defaultPhotoResolutionForMode:0 devicePosition:0 encodingBehavior:2];
  id v6 = v5;
  if (keyExistsAndHasValidFormat) {
    id v7 = [v4 integerValue];
  }
  else {
    id v7 = v5;
  }
  if ([v3 isPhotoResolutionSupported:v7 forMode:0 device:0 photoEncoding:2]) {
    id v8 = v7;
  }
  else {
    id v8 = v6;
  }
  id v9 = +[NSNumber numberWithInteger:v8];

  return v9;
}

- (id)_photoResolutionValuesForPhotoEncodingBehavior:(int64_t)a3 allow48MP:(BOOL)a4 outTitles:(id *)a5 capabilities:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  BOOL v10 = +[NSMutableArray array];
  id v11 = +[NSMutableArray array];
  if ([v9 isPhotoResolutionSupported:1 forMode:0 device:0 photoEncoding:a3])
  {
    [v10 addObject:&off_246A0];
    v12 = sub_6C5C(@"CAM_PHOTO_RESOLUTION_12MP");
    [v11 addObject:v12];
  }
  if ([v9 isPhotoResolutionSupported:2 forMode:0 device:0 photoEncoding:a3])
  {
    [v10 addObject:&off_246B8];
    id v13 = sub_6C5C(@"CAM_PHOTO_RESOLUTION_24MP");
    [v11 addObject:v13];
  }
  if (v7
    && [v9 isPhotoResolutionSupported:3 forMode:0 device:0 photoEncoding:a3])
  {
    [v10 addObject:&off_246D0];
    v14 = sub_6C5C(@"CAM_PHOTO_RESOLUTION_48MP");
    [v11 addObject:v14];
  }
  id v15 = v11;
  *a5 = v15;

  return v10;
}

- (id)_enhancedResolutionFooterForPhotoEncodingBehavior:(int64_t)a3 allow48MP:(BOOL)a4 capabilities:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (a3 == 2) {
    id v8 = @"ENHANCED_RAW_RESOLUTION_SIZE_FOOTER";
  }
  else {
    id v8 = @"ENHANCED_RESOLUTION_SIZE_FOOTER";
  }
  id v9 = sub_6C5C(v8);
  BOOL v10 = +[NSMutableString stringWithString:v9];

  if ([v7 isPhotoResolutionSupported:1 forMode:0 device:0 photoEncoding:a3])
  {
    if ((unint64_t)a3 > 2)
    {
      id v11 = 0;
    }
    else
    {
      id v11 = sub_6C5C(off_20720[a3]);
    }
    [v10 appendFormat:@"\n%@", v11];
  }
  if ([v7 isPhotoResolutionSupported:2 forMode:0 device:0 photoEncoding:a3])
  {
    if ((unint64_t)a3 > 2)
    {
      v12 = 0;
    }
    else
    {
      v12 = sub_6C5C(off_20738[a3]);
    }
    [v10 appendFormat:@"\n%@", v12];
  }
  if (v5
    && [v7 isPhotoResolutionSupported:3 forMode:0 device:0 photoEncoding:a3])
  {
    if (a3 == 2) {
      id v13 = @"ENHANCED_RAW_RESOLUTION_SIZE_FOOTER_48MP";
    }
    else {
      id v13 = @"ENHANCED_RESOLUTION_SIZE_FOOTER_48MP";
    }
    v14 = sub_6C5C(v13);
    [v10 appendFormat:@"\n%@", v14];
  }

  return v10;
}

- (id)_proResColorSpace:(id)a3
{
  BOOL v3 = +[CAMCaptureCapabilities capabilities];
  objc_super v4 = [v3 supportedProResColorSpaces];

  BOOL v5 = [v4 firstObject];
  id v6 = [v5 integerValue];

  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(CAMUserPreferenceExplicitProResColorSpace, @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    id v8 = (void *)AppIntegerValue;
    id v9 = +[NSNumber numberWithInteger:AppIntegerValue];
    unsigned int v10 = [v4 containsObject:v9];

    if (v10) {
      id v6 = v8;
    }
  }
  id v11 = +[NSNumber numberWithInteger:v6];

  return v11;
}

- (id)_secondaryPhotoFormat:(id)a3
{
  BOOL v3 = +[CameraProRawCodecSettingsController selectedPhotoFormat];
  objc_super v4 = +[CameraProRawCodecSettingsController photoFormatPreferenceShortTitleForValue:v3];

  return v4;
}

- (BOOL)_didAppearAtLeastOnce
{
  return self->__didAppearAtLeastOnce;
}

- (void)set_didAppearAtLeastOnce:(BOOL)a3
{
  self->__didAppearAtLeastOnce = a3;
}

@end