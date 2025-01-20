@interface CameraSettingsController
- (BOOL)_isHDRVideoEnabled;
- (BOOL)_isPALVideoEnabled;
- (BOOL)_showHEVCOnlyFormatsOnCapableDevices;
- (CameraCaptureButtonAppConfigurationCoordinator)captureButtonAppConfigurationCoordinator;
- (id)_cinematicSpecifier;
- (id)_focalLengthStringForCustomLens:(int64_t)a3;
- (id)_getAssociatedAppDisplayName:(id)a3;
- (id)_initializeSpecifiers;
- (id)_isMacroControlEnabled:(id)a3;
- (id)_recordCinematicConfiguration:(id)a3;
- (id)_recordSlomoConfiguration:(id)a3;
- (id)_recordVideoConfiguration:(id)a3;
- (id)_selectedCustomLensGroup:(id)a3;
- (id)_sharedLibrarySpecifier;
- (id)specifiers;
- (void)_handleConfirmHighEfficiencyLearnMore:(id)a3;
- (void)_handleSlomoMostCompatibleConfirmed:(id)a3;
- (void)_launchCameraButtonTips:(id)a3;
- (void)_launchSemanticStylesSettings:(id)a3;
- (void)_launchSmartStylesSettings:(id)a3;
- (void)_privacyButtonPressed:(id)a3;
- (void)_setMacroControlEnabled:(id)a3 specifier:(id)a4;
- (void)_setRecordCinematicConfiguration:(id)a3 specifier:(id)a4;
- (void)_setRecordSlomoConfiguration:(id)a3 specifier:(id)a4;
- (void)_writeLastViewedDate;
- (void)cameraCaptureButtonAppConfigurationCoordinator:(id)a3 didChangeAssociatedAppBundleID:(id)a4;
- (void)emitNavigationEvent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CameraSettingsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(CameraSettingsController *)self _initializeSpecifiers];
    v6 = *(void **)&self->super.PSListController_opaque[v3];
    *(void *)&self->super.PSListController_opaque[v3] = v5;

    +[CameraSettingsBaseController allowMultilineTitlesForSpecifiers:*(void *)&self->super.PSListController_opaque[v3]];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"_handleApplicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v4 = *(void **)&self->super.PSListController_opaque[v3];
  }

  return v4;
}

- (id)_initializeSpecifiers
{
  id v3 = +[NSMutableArray array];
  v4 = +[CameraSettingsBaseController capabilities];
  if ([v4 isSuperWideAutoMacroSupported]) {
    +[CAMUserPreferences performSuperWideAutoMacroMigrationWithCapabilities:v4];
  }
  +[CAMUserPreferences performHorizonLevelUpgradeWithCapabilities:v4];
  +[CAMUserPreferences performAudioConfigurationMigrationWithCapabilities:v4];
  +[CAMUserPreferences performMostCompatibleConfirmationMigrationWithCapabilities:v4];
  unsigned int v5 = [v4 isCameraButtonSupported];
  v6 = &CFPreferencesAppSynchronize_ptr;
  v301 = v3;
  v306 = self;
  unsigned int v311 = [v4 smartStylesSupported];
  v298 = v4;
  if ((v311 & 1) != 0 || v5)
  {
    if (v5)
    {
      sub_112AC(@"SYSTEM_SETTINGS_HEADER");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
    v8 = +[PSSpecifier groupSpecifierWithID:@"systemSettings" name:v7];
    [v3 addObject:v8];
    id v9 = v8;
    v10 = v9;
    if (v5)
    {
      v11 = *(void **)(&self->super + 1);
      if (!v11)
      {
        v12 = objc_alloc_init(CameraCaptureButtonAppConfigurationCoordinator);
        v13 = *(void **)(&self->super + 1);
        *(void *)(&self->super + 1) = v12;

        v11 = *(void **)(&self->super + 1);
      }
      [v11 setCameraSettingsDelegate:self];
      v14 = sub_112AC(@"CAMERA_BUTTON_TITLE");
      v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:"_getAssociatedAppDisplayName:" detail:objc_opt_class() cell:2 edit:0];

      [v15 setIdentifier:@"CAMERA_BUTTON_SETTINGS"];
      [v3 addObject:v15];
      v16 = sub_112AC(@"CAMERA_BUTTON_%@_FOOTER");
      v17 = sub_112AC(@"CAMERA_BUTTON_LEARN_MORE_TITLE");
      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v17);

      self = v306;
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      [v10 setProperty:v20 forKey:PSFooterCellClassGroupKey];

      [v10 setProperty:v18 forKey:PSFooterHyperlinkViewTitleKey];
      v21 = sub_112AC(@"CAMERA_BUTTON_LEARN_MORE_TITLE");
      v327.location = (NSUInteger)[v18 rangeOfString:v21];
      v22 = NSStringFromRange(v327);
      [v10 setProperty:v22 forKey:PSFooterHyperlinkViewLinkRangeKey];

      v23 = +[NSValue valueWithNonretainedObject:v306];
      [v10 setProperty:v23 forKey:PSFooterHyperlinkViewTargetKey];

      v24 = NSStringFromSelector("_launchCameraButtonTips:");
      [v10 setProperty:v24 forKey:PSFooterHyperlinkViewActionKey];

      v25 = v10;
      if (!v311) {
        goto LABEL_29;
      }
      v26 = sub_112AC(@"APP_SETTINGS_HEADER");
      v25 = +[PSSpecifier groupSpecifierWithName:v26];

      [v3 addObject:v25];
    }
    else
    {
      v25 = v9;
      if (!v311)
      {
LABEL_29:
        v45 = +[PSSpecifier groupSpecifierWithName:0];
        [v3 addObject:v45];

        v6 = &CFPreferencesAppSynchronize_ptr;
        goto LABEL_30;
      }
    }
    v27 = +[CAMSmartStyleUtilities readAVCaptureSystemStyle];
    v28 = [v27 cast];
    v303 = v28;
    if ([v28 isEqualToString:AVSmartStyleCastTypeTanWarm])
    {
      char v29 = 1;
      uint64_t v30 = 2;
    }
    else if ([v28 isEqualToString:AVSmartStyleCastTypeBlushWarm])
    {
      char v29 = 1;
      uint64_t v30 = 3;
    }
    else if ([v28 isEqualToString:AVSmartStyleCastTypeGoldWarm])
    {
      char v29 = 1;
      uint64_t v30 = 4;
    }
    else if ([v28 isEqualToString:AVSmartStyleCastTypeCool])
    {
      char v29 = 1;
      uint64_t v30 = 5;
    }
    else
    {
      unsigned int v31 = [v28 isEqualToString:AVSmartStyleCastTypeNeutral];
      char v29 = v31;
      if (v31) {
        uint64_t v30 = 6;
      }
      else {
        uint64_t v30 = 1;
      }
    }
    id v32 = objc_alloc((Class)CEKSmartStyle);
    [v27 intensity];
    double v34 = v33;
    [v27 toneBias];
    double v36 = v35;
    [v27 colorBias];
    id v38 = [v32 initWithPresetType:v30 castIntensity:v34 toneBias:v36 colorBias:v37];
    unsigned __int8 v39 = [v38 isNeutral];
    v40 = +[CEKSmartStyle displayNameForPresetType:v30];
    if ((v29 & 1) == 0 && (v39 & 1) == 0)
    {
      uint64_t v41 = sub_112AC(@"SMART_STYLE_LABEL_SYSTEM_CUSTOMIZED");

      v40 = (void *)v41;
    }
    v42 = sub_112AC(@"SYSTEM_STYLES_TITLE");
    self = v306;
    v43 = +[PSSpecifier preferenceSpecifierNamed:v42 target:v306 set:0 get:0 detail:0 cell:2 edit:0];

    [v43 setProperty:@"SMART_STYLES" forKey:PSIDKey];
    [v43 setControllerLoadAction:"_launchSmartStylesSettings:"];
    [v43 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v43 setProperty:v40 forKey:@"CameraSettingsDetailTableCellTextKey"];
    [v301 addObject:v43];
    v44 = sub_112AC(@"SYSTEM_STYLES_FOOTER");
    [v25 setObject:v44 forKeyedSubscript:PSFooterTextGroupKey];

    id v3 = v301;
    v4 = v298;
    goto LABEL_29;
  }
LABEL_30:
  id v46 = [v4 back720pMaxFPS];
  id v47 = [v4 back1080pMaxFPS];
  uint64_t v48 = (uint64_t)v47;
  BOOL v50 = (uint64_t)v46 > 29 && (uint64_t)v47 > 29;
  if ([v4 isHEVCEncodingSupported])
  {
    unsigned int v51 = [(CameraSettingsController *)self _showHEVCOnlyFormatsOnCapableDevices];
  }
  else
  {
    v52 = [v3 specifierForID:@"CameraFormatsSettingsList"];
    if (v52)
    {
      v53 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        id v54 = (id)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v54;
        __int16 v325 = 2048;
        v326 = self;
        v6 = &CFPreferencesAppSynchronize_ptr;
        _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Hiding formats specifiers", buf, 0x16u);
      }
      [v3 removeObject:v52];
    }

    unsigned int v51 = 0;
  }
  id v55 = [v4 back4kMaxFPS];
  char v56 = v48 > 59 || v50;
  if ((v56 & 1) != 0 || (uint64_t)v55 >= 30)
  {
    v57 = sub_112AC(@"CAM_RECORD_VIDEO_TITLE");
    v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:self set:0 get:"_recordVideoConfiguration:" detail:objc_opt_class() cell:2 edit:0];

    [v58 setIdentifier:@"CameraVideoSettingsList"];
    [v3 addObject:v58];
  }
  id v59 = [v4 backHighFrameRate720pMaxFPS];
  id v60 = [v4 backHighFrameRate1080pMaxFPS];
  id obj = [v4 backHighFrameRate4kMaxFPS];
  if ((uint64_t)v60 > 239) {
    int v61 = v51;
  }
  else {
    int v61 = 0;
  }
  if ((uint64_t)v59 < 240) {
    int v61 = 1;
  }
  int v299 = v61;
  if ((uint64_t)v59 <= 239 && (uint64_t)v60 < 120)
  {
    v304 = &stru_20A70;
    goto LABEL_130;
  }
  v288 = sub_112AC(@"CAM_RECORD_SLOMO_TITLE");
  v286 = +[PSSpecifier preferenceSpecifierNamed:v288 target:self set:"_setRecordSlomoConfiguration:specifier:" get:"_recordSlomoConfiguration:" detail:objc_opt_class() cell:2 edit:0];
  [v286 setIdentifier:@"CameraSlomoSettingsList"];
  v62 = +[NSMutableString string];
  unsigned int v63 = [v4 isFrontSlomoSupported];
  id v64 = [v4 frontHighFrameRate1080pMaxFPS];
  if (v63 && (uint64_t)v60 >= 240 && (uint64_t)v64 <= 239)
  {
    v65 = sub_112AC(@"CAM_RECORD_SLOMO_FOOTER_FFC_120_ONLY");
    [v62 appendFormat:@"%@\n\n", v65];
  }
  v66 = sub_112AC(@"CAM_RECORD_SLOMO_FOOTER_HEAD");
  [v62 appendFormat:@"%@", v66];

  v67 = +[NSMutableArray array];
  v68 = +[NSMutableArray array];
  v69 = +[NSMutableArray array];
  unsigned int v70 = [(CameraSettingsController *)self _isHDRVideoEnabled];
  if ((uint64_t)obj > 119) {
    unsigned int v71 = v70;
  }
  else {
    unsigned int v71 = 0;
  }
  unsigned int v290 = v71;
  if ((uint64_t)v60 > 239) {
    int v72 = v299;
  }
  else {
    int v72 = 0;
  }
  int v284 = v72;
  unsigned int v285 = v70;
  v294 = v68;
  v296 = v67;
  v292 = v69;
  if ((uint64_t)v60 < 120)
  {
    [v67 addObject:&off_24868];
    v73 = sub_112AC(@"CAM_RECORD_SLOMO_720p_120");
    [v68 addObject:v73];

    v74 = sub_112AC(@"CAM_RECORD_SLOMO_720p_120_SHORT");
    [v69 addObject:v74];

    sub_112AC(@"CAM_RECORD_SLOMO_720p_120_FOOTER");
    v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v62 appendFormat:@"\n%@", v75];
    v304 = &stru_20A70;
    v76 = v62;
LABEL_97:

    goto LABEL_98;
  }
  unsigned int v283 = v51;
  if (v51)
  {
    unsigned __int8 v77 = 0;
    unsigned int v78 = 1;
  }
  else
  {
    unsigned int v78 = [(CameraSettingsController *)self _isHDRVideoEnabled];
    unsigned __int8 v77 = v78;
  }
  v76 = v62;
  if (v290) {
    uint64_t v79 = 0;
  }
  else {
    uint64_t v79 = 4;
  }
  if (v290) {
    CFStringRef v80 = @"CAM_RECORD_SLOMO_1080p_120_HEVC_FOOTER_DEFAULT";
  }
  else {
    CFStringRef v80 = @"CAM_RECORD_SLOMO_1080p_120_HEVC_FOOTER";
  }
  if (v290) {
    CFStringRef v81 = @"CAM_RECORD_SLOMO_1080p_120_FOOTER_DEFAULT";
  }
  else {
    CFStringRef v81 = @"CAM_RECORD_SLOMO_1080p_120_FOOTER";
  }
  v82 = +[NSNumber numberWithInteger:v79];
  [v296 addObject:v82];

  if ((((uint64_t)obj > 119) & v77) != 0) {
    v83 = @"CAM_RECORD_SLOMO_1080p_120_MOST_COMPATIBLE";
  }
  else {
    v83 = @"CAM_RECORD_SLOMO_1080p_120";
  }
  v84 = sub_112AC(v83);
  v85 = sub_112AC(@"CAM_RECORD_SLOMO_1080p_120_SHORT");
  if (v78) {
    v86 = (__CFString *)v80;
  }
  else {
    v86 = (__CFString *)v81;
  }
  v304 = v86;
  v87 = sub_112AC(v86);
  [v68 addObject:v84];
  [v292 addObject:v85];
  [v62 appendFormat:@"\n%@", v87];

  v4 = v298;
  self = v306;
  v6 = &CFPreferencesAppSynchronize_ptr;
  unsigned int v51 = v283;
  if ((uint64_t)v60 > 239)
  {
    if ((v284 & ~v290) != 0) {
      uint64_t v88 = 0;
    }
    else {
      uint64_t v88 = 8;
    }
    CFStringRef v89 = @"CAM_RECORD_SLOMO_1080p_240_FOOTER";
    if ((v284 & ~v290) != 0) {
      CFStringRef v89 = @"CAM_RECORD_SLOMO_1080p_240_FOOTER_DEFAULT";
    }
    v305 = (__CFString *)v89;
    v90 = +[NSNumber numberWithInteger:v88];
    [v296 addObject:v90];

    if (v283) {
      v91 = @"CAM_RECORD_SLOMO_1080p_240";
    }
    else {
      v91 = @"CAM_RECORD_SLOMO_1080p_240_MOST_COMPATIBLE";
    }
    v75 = v91;
    v92 = +[NSBundle bundleForClass:objc_opt_class()];
    v93 = [v92 localizedStringForKey:v75 value:&stru_20A70 table:@"CameraSettings"];

    v94 = +[NSBundle bundleForClass:objc_opt_class()];
    v95 = [v94 localizedStringForKey:@"CAM_RECORD_SLOMO_1080p_240_SHORT" value:&stru_20A70 table:@"CameraSettings"];

    v96 = v305;
    v97 = +[NSBundle bundleForClass:objc_opt_class()];
    v304 = v96;
    v98 = [v97 localizedStringForKey:v96 value:&stru_20A70 table:@"CameraSettings"];

    unsigned int v51 = v283;
    [v68 addObject:v93];
    [v292 addObject:v95];
    [v76 appendFormat:@"\n%@", v98];

    goto LABEL_97;
  }
LABEL_98:
  if (v299)
  {
    v99 = v292;
  }
  else
  {
    if (v290 | v284) {
      uint64_t v100 = 3;
    }
    else {
      uint64_t v100 = 0;
    }
    if (v290 | v284) {
      CFStringRef v101 = @"CAM_RECORD_SLOMO_720p_240_HEVC_FOOTER";
    }
    else {
      CFStringRef v101 = @"CAM_RECORD_SLOMO_720p_240_HEVC_FOOTER_DEFAULT";
    }
    if (v290 | v284) {
      CFStringRef v102 = @"CAM_RECORD_SLOMO_720p_240_FOOTER";
    }
    else {
      CFStringRef v102 = @"CAM_RECORD_SLOMO_720p_240_FOOTER_DEFAULT";
    }
    v103 = +[NSNumber numberWithInteger:v100];
    [v296 addObject:v103];

    v104 = sub_112AC(@"CAM_RECORD_SLOMO_720p_240");
    [v294 addObject:v104];

    v105 = sub_112AC(@"CAM_RECORD_SLOMO_720p_240_SHORT");
    v99 = v292;
    [v292 addObject:v105];

    if (v51) {
      v106 = (__CFString *)v101;
    }
    else {
      v106 = (__CFString *)v102;
    }
    v68 = v294;
    v304 = v106;
    v107 = sub_112AC(v106);
    [v76 appendFormat:@"\n%@", v107];
  }
  if ((uint64_t)obj >= 120)
  {
    if ([(CameraSettingsController *)self _isPALVideoEnabled])
    {
      [v296 addObject:&off_24880];
      if (v51) {
        v108 = @"CAM_RECORD_SLOMO_4k_100";
      }
      else {
        v108 = @"CAM_RECORD_SLOMO_4k_100_MOST_COMPATIBLE";
      }
      v109 = sub_112AC(v108);
      [v68 addObject:v109];

      v110 = sub_112AC(@"CAM_RECORD_SLOMO_4k_100_SHORT");
      [v99 addObject:v110];

      if (v285) {
        v111 = @"CAM_RECORD_SLOMO_4k_100_FOOTER_HDR";
      }
      else {
        v111 = @"CAM_RECORD_SLOMO_4k_100_FOOTER";
      }
      v112 = sub_112AC(v111);
      [v76 appendFormat:@"\n%@", v112];
    }
    [v296 addObject:&off_24898];
    if (v51) {
      v113 = @"CAM_RECORD_SLOMO_4k_120";
    }
    else {
      v113 = @"CAM_RECORD_SLOMO_4k_120_MOST_COMPATIBLE";
    }
    v114 = sub_112AC(v113);
    [v68 addObject:v114];

    v115 = sub_112AC(@"CAM_RECORD_SLOMO_4k_120_SHORT");
    [v99 addObject:v115];

    if (v285) {
      v116 = @"CAM_RECORD_SLOMO_4k_120_FOOTER_HDR";
    }
    else {
      v116 = @"CAM_RECORD_SLOMO_4k_120_FOOTER";
    }
    v117 = sub_112AC(v116);
    [v76 appendFormat:@"\n%@", v117];
  }
  [v286 setValues:v296 titles:v68 shortTitles:v99];
  [v286 setProperty:v76 forKey:PSStaticTextMessageKey];
  [v301 addObject:v286];

  id v3 = v301;
LABEL_130:
  if ([v4 cinematic4KSupported])
  {
    v118 = [(CameraSettingsController *)self _cinematicSpecifier];
    [v3 addObject:v118];
  }
  if (([v4 isStereoAudioRecordingSupported] & 1) != 0
    || ([v4 isCinematicAudioSupported] & 1) != 0
    || [v4 isWindRemovalSupported])
  {
    v119 = sub_112AC(@"CAM_AUDIO_CONFIGURATION_TITLE");
    uint64_t v120 = objc_opt_class();
    v121 = +[PSSpecifier preferenceSpecifierNamed:v119 target:v120 set:0 get:"titleForSelectedAudioConfiguration" detail:objc_opt_class() cell:2 edit:0];

    [v3 addObject:v121];
  }
  v297 = [(CameraSettingsController *)self loadSpecifiersFromPlistName:@"CameraSettings" target:self];
  objc_msgSend(v3, "addObjectsFromArray:");
  v122 = (char *)[v3 indexOfSpecifierWithID:@"CameraPreserveSettingsSwitch"];
  if ([v4 isCTMSupported]
    && [v4 multipleCaptureFeaturesSupported])
  {
    v123 = sub_112AC(@"VOLUME_UP_BURST");
    v124 = +[PSSpecifier preferenceSpecifierNamed:v123 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    [v124 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v124 setObject:@"CAMUserPreferenceVolumeUpBurst" forKeyedSubscript:PSKeyNameKey];
    [v124 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
    uint64_t v125 = 0x7FFFFFFFFFFFFFFFLL;
    if (v122 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v125 = (uint64_t)(v122 + 2);
      [v3 insertObject:v124 atIndex:v122 + 1];
    }

    v122 = (char *)v125;
  }
  if ([v4 isImageAnalysisSupported])
  {
    v126 = +[NSUserDefaults standardUserDefaults];
    v127 = [v126 objectForKey:@"AppleLiveTextEnabled" inDomain:NSGlobalDomain];

    if (v127)
    {
      unsigned __int8 v128 = [v127 BOOLValue];

      if ((v128 & 1) == 0) {
        goto LABEL_145;
      }
      goto LABEL_144;
    }
    if (_os_feature_enabled_impl())
    {
      v244 = [&off_24E10 arrayByAddingObjectsFromArray:&off_24E28];
    }
    else
    {
      v244 = &off_24E10;
    }
    v246 = v244;

    v247 = +[NSLocale _deviceLanguage];
    *(void *)buf = v247;
    v248 = +[NSArray arrayWithObjects:buf count:1];
    v249 = +[NSLocale matchedLanguagesFromAvailableLanguages:v246 forPreferredLanguages:v248];

    id v250 = [v249 count];
    v6 = &CFPreferencesAppSynchronize_ptr;
    if (v250)
    {
LABEL_144:
      v129 = v6[144];
      v130 = sub_112AC(@"QR_CODES");
      v131 = [v129 preferenceSpecifierNamed:v130 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

      [v131 setIdentifier:@"CameraQRBannerSwitch"];
      uint64_t v132 = PSDefaultsKey;
      [v131 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
      v133 = v4;
      uint64_t v134 = PSKeyNameKey;
      [v131 setObject:@"CAMUserPreferenceShowQRCodeBanners" forKeyedSubscript:PSKeyNameKey];
      uint64_t v135 = PSDefaultValueKey;
      [v131 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
      id objc = v122 + 1;
      [v3 insertObject:v131 atIndex:v122];
      v136 = sub_112AC(@"TEXT_ANALYSIS");
      id v3 = v301;
      v137 = +[PSSpecifier preferenceSpecifierNamed:v136 target:v306 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

      v6 = &CFPreferencesAppSynchronize_ptr;
      uint64_t v138 = v132;
      self = v306;
      [v137 setObject:@"com.apple.camera" forKeyedSubscript:v138];
      uint64_t v139 = v134;
      v4 = v133;
      [v137 setObject:@"CAMUserPreferenceShowImageAnalysis" forKeyedSubscript:v139];
      v140 = +[NSNumber numberWithBool:1];
      [v137 setObject:v140 forKeyedSubscript:v135];

      v122 += 2;
      [v301 insertObject:v137 atIndex:objc];
    }
  }
LABEL_145:
  if (+[CAMUserPreferences isSharedLibrarySupportedAndEnabledForCapabilities:v4])
  {
    v141 = [v6[144] groupSpecifierWithID:@"autoAddSharedLibraryGroup"];
    v142 = v122 + 1;
    [v3 insertObject:v141 atIndex:v122];
    v143 = [(CameraSettingsController *)self _sharedLibrarySpecifier];
    [v3 insertObject:v143 atIndex:v142];
  }
  v144 = (char *)[v3 indexOfSpecifierWithID:@"CameraLevelSwitch"];
  v145 = v144 + 1;
  if ([v4 isMirroredFrontCapturesSupported])
  {
    if ([v4 isMirroredFrontVideosSupported]) {
      v146 = @"MIRROR_FRONT_CAPTURES";
    }
    else {
      v146 = @"MIRROR_FRONT_PHOTOS";
    }
    sub_112AC(v146);
    id v147 = (id)objc_claimAutoreleasedReturnValue();

    v148 = [v6[144] preferenceSpecifierNamed:v147 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
    [v148 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v148 setObject:@"CAMUserPreferenceMirrorFrontCameraCaptures" forKeyedSubscript:PSKeyNameKey];
    [v148 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
    [v3 insertObject:v148 atIndex:v145];

    v145 = v144 + 2;
  }
  if ([v4 isSpatialOverCaptureSupported])
  {
    v149 = sub_112AC(@"OVER_CAPTURE_VIEW_OUTSIDE_THE_FRAME_SWITCH");
    v150 = [v6[144] preferenceSpecifierNamed:v149 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
    [v150 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v150 setObject:@"CAMUserPreferenceEnableViewOutsideTheFrame" forKeyedSubscript:PSKeyNameKey];
    [v150 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    [v3 insertObject:v150 atIndex:v145];

    ++v145;
  }
  if (((unint64_t)[v4 semanticStylesSupport] & 8) != 0) {
    char v151 = v311;
  }
  else {
    char v151 = 1;
  }
  v152 = v145;
  v300 = v145;
  if ((v151 & 1) == 0)
  {
    v153 = [v6[144] groupSpecifierWithID:@"semanticStyles"];
    v154 = sub_112AC(@"SEMANTIC_STYLES_ROW_FOOTER");
    [v153 setObject:v154 forKeyedSubscript:PSFooterTextGroupKey];

    v155 = v145 + 1;
    [v3 insertObject:v153 atIndex:v145];
    v156 = v6[144];
    v157 = sub_112AC(@"SEMANTIC_STYLES_ROW_TITLE");
    v158 = [v156 preferenceSpecifierNamed:v157 target:self set:0 get:0 detail:0 cell:13 edit:0];

    v145 = v300;
    [v158 setProperty:@"PHOTOGRAPHIC_STYLES" forKey:PSIDKey];
    [v158 setButtonAction:"_launchSemanticStylesSettings:"];
    v152 = v300 + 2;
    [v3 insertObject:v158 atIndex:v155];
  }
  if ([v4 focalLengthPickerSupported])
  {
    unint64_t v159 = (unint64_t)[v4 baseFocalLengthForWideCamera];
    double v160 = 0.0;
    if (v159 <= 3) {
      double v160 = dbl_1F6F0[v159];
    }
    v161 = [(id)objc_opt_class() integerFormatter];
    v162 = +[NSNumber numberWithDouble:v160];
    uint64_t v163 = [v161 stringFromNumber:v162];

    v164 = sub_112AC(@"FOCAL_LENGTH_ROW_%@_MM_FOOTER");
    v293 = (void *)v163;
    uint64_t v165 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v164, v163);

    v166 = [v6[144] groupSpecifierWithID:@"focalLength"];
    v291 = (void *)v165;
    [v166 setObject:v165 forKeyedSubscript:PSFooterTextGroupKey];
    v287 = v152 + 1;
    v289 = v166;
    v295 = v152;
    [v3 insertObject:v166 atIndex:v152];
    v167 = [v4 supportedCustomLensGroups];
    v168 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v167 count]);
    v312 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v167 count]);
    long long v318 = 0u;
    long long v319 = 0u;
    long long v320 = 0u;
    long long v321 = 0u;
    id obja = v167;
    id v169 = [obja countByEnumeratingWithState:&v318 objects:v323 count:16];
    if (v169)
    {
      id v170 = v169;
      uint64_t v171 = *(void *)v319;
      do
      {
        for (i = 0; i != v170; i = (char *)i + 1)
        {
          if (*(void *)v319 != v171) {
            objc_enumerationMutation(obja);
          }
          v173 = *(void **)(*((void *)&v318 + 1) + 8 * i);
          v174 = [(CameraSettingsController *)self _focalLengthStringForCustomLens:0];
          if ([v173 count] == (char *)&dword_0 + 1)
          {
            v175 = sub_112AC(@"FOCAL_LENGTH_GROUP_%@_MM_ONLY");
            v176 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v175, v174);
            [v312 addObject:v176];

            [v168 addObject:v173];
          }
          else if ([v173 count] == (char *)&dword_0 + 2)
          {
            v177 = [v173 objectAtIndexedSubscript:1];
            v178 = -[CameraSettingsController _focalLengthStringForCustomLens:](self, "_focalLengthStringForCustomLens:", [v177 integerValue]);

            v179 = sub_112AC(@"FOCAL_LENGTH_GROUP_%@_AND_%@_MM");
            v180 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v179, v174, v178);

            [v312 addObject:v180];
            [v168 addObject:v173];
          }
          else if ([v173 count] == (char *)&dword_0 + 3)
          {
            v181 = [v173 objectAtIndexedSubscript:1];
            v182 = -[CameraSettingsController _focalLengthStringForCustomLens:](self, "_focalLengthStringForCustomLens:", [v181 integerValue]);

            v183 = [v173 objectAtIndexedSubscript:2];
            v184 = -[CameraSettingsController _focalLengthStringForCustomLens:](self, "_focalLengthStringForCustomLens:", [v183 integerValue]);

            v185 = sub_112AC(@"FOCAL_LENGTH_GROUP_%@_AND_%@_AND_%@_MM");
            v186 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v185, v174, v182, v184);

            self = v306;
            [v312 addObject:v186];
            [v168 addObject:v173];
          }
        }
        id v170 = [obja countByEnumeratingWithState:&v318 objects:v323 count:16];
      }
      while (v170);
    }

    if ([v298 isCameraButtonSupported]) {
      v187 = @"FOCAL_LENGTH_ROW_TITLE_CAMERA_BUTTON";
    }
    else {
      v187 = @"FOCAL_LENGTH_ROW_TITLE";
    }
    v6 = &CFPreferencesAppSynchronize_ptr;
    v188 = sub_112AC(v187);
    v189 = +[PSSpecifier preferenceSpecifierNamed:v188 target:self set:0 get:"_selectedCustomLensGroup:" detail:objc_opt_class() cell:2 edit:0];

    [v189 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v189 setObject:CAMUserPreferencesSelectedCustomLensGroup forKeyedSubscript:PSKeyNameKey];
    v190 = v168;
    v191 = [v168 lastObject];
    [v189 setObject:v191 forKeyedSubscript:PSDefaultValueKey];

    [v189 setObject:v291 forKeyedSubscript:PSStaticTextMessageKey];
    [v189 setValues:v168 titles:v312];
    v152 = v295 + 2;
    id v3 = v301;
    [v301 insertObject:v189 atIndex:v287];

    v4 = v298;
    v145 = v300;
  }
  if ([v4 semanticDevelopmentSupported])
  {
    v192 = [v6[144] groupSpecifierWithID:@"semanticDevelopmentGroup"];
    v193 = sub_112AC(@"SEM_DEV_GROUP_FOOTER");
    [v192 setObject:v193 forKeyedSubscript:PSFooterTextGroupKey];

    v194 = v152 + 1;
    [v3 insertObject:v192 atIndex:v152];
    v195 = v152;
    v196 = v6[144];
    v197 = sub_112AC(@"SEM_DEV_SWITCH");
    v198 = [v196 preferenceSpecifierNamed:v197 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    [v198 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v198 setObject:@"CAMUserPreferenceEnableSemanticDevelopment" forKeyedSubscript:PSKeyNameKey];
    [v198 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    v199 = v195 + 2;
    [v3 insertObject:v198 atIndex:v194];
  }
  else
  {
    v199 = v152;
  }
  if ([v4 photoModeDepthSuggestionSupported])
  {
    v200 = [v6[144] groupSpecifierWithID:@"depthInPhotoModeGroup"];
    v201 = sub_112AC(@"PHOTO_MODE_DEPTH_GROUP_FOOTER");
    [v200 setObject:v201 forKeyedSubscript:PSFooterTextGroupKey];

    v202 = v199 + 1;
    [v3 insertObject:v200 atIndex:v199];
    v203 = v6[144];
    v204 = sub_112AC(@"PHOTO_MODE_DEPTH_SWITCH");
    v205 = [v203 preferenceSpecifierNamed:v204 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    [v205 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v205 setObject:@"CAMUserPreferenceEnableDepthSuggestion" forKeyedSubscript:PSKeyNameKey];
    [v205 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    v199 += 2;
    [v3 insertObject:v205 atIndex:v202];
  }
  if ([v4 responsiveShutterSupported])
  {
    v206 = [v6[144] groupSpecifierWithID:@"dynamicCaptureGroup"];
    v207 = sub_112AC(@"CAM_CAPTURE_GROUP_FOOTER");
    [v206 setObject:v207 forKeyedSubscript:PSFooterTextGroupKey];

    v208 = v199 + 1;
    [v3 insertObject:v206 atIndex:v199];
    v209 = v6[144];
    v210 = sub_112AC(@"CAM_CAPTURE_DYNAMIC_SHUTTER_SWITCH");
    v211 = [v209 preferenceSpecifierNamed:v210 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    [v211 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v211 setObject:@"CAMUserPreferenceEnableResponsiveShutter" forKeyedSubscript:PSKeyNameKey];
    [v211 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    v199 += 2;
    [v3 insertObject:v211 atIndex:v208];
  }
  if ([v4 contentAwareDistortionCorrectionSupported])
  {
    v212 = [v6[144] groupSpecifierWithID:@"intelligentDistortionCorrectionGroup"];
    if ([v4 isBackSuperWideSupported]) {
      v213 = @"IDC_FOOTER";
    }
    else {
      v213 = @"IDC_FOOTER_FRONT_ONLY";
    }
    sub_112AC(v213);
    id v214 = (id)objc_claimAutoreleasedReturnValue();

    [v212 setObject:v214 forKeyedSubscript:PSFooterTextGroupKey];
    v215 = v199 + 1;
    [v3 insertObject:v212 atIndex:v199];
    v216 = v6[144];
    v217 = sub_112AC(@"IDC_SWITCH");
    v218 = [v216 preferenceSpecifierNamed:v217 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    v145 = v300;
    [v218 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v218 setObject:@"CAMUserPreferenceContentAwareDistortionCorrection" forKeyedSubscript:PSKeyNameKey];
    [v218 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    v199 += 2;
    [v3 insertObject:v218 atIndex:v215];
  }
  if ([v4 isSuperWideAutoMacroSupported])
  {
    v219 = [v6[144] groupSpecifierWithID:@"superWideAutoMacroGroup"];
    v220 = sub_112AC(@"AUTO_MACRO_GROUP_FOOTER");
    [v219 setObject:v220 forKeyedSubscript:PSFooterTextGroupKey];

    v221 = v199 + 1;
    [v3 insertObject:v219 atIndex:v199];
    v222 = v6[144];
    v223 = sub_112AC(@"AUTO_MACRO_SWITCH");
    v224 = [v222 preferenceSpecifierNamed:v223 target:self set:"_setMacroControlEnabled:specifier:" get:"_isMacroControlEnabled:" detail:0 cell:6 edit:0];

    v199 += 2;
    [v3 insertObject:v224 atIndex:v221];
  }
  v225 = [v3 specifierForID:@"hdrTitleGroup"];
  if (v145 != v199)
  {
    v226 = [v3 objectAtIndexedSubscript:v145];
    v227 = sub_112AC(@"CAM_PHOTO_CAPTURE_GROUP_TITLE");
    [v226 setName:v227];

    [v225 setName:0];
  }
  if ([v4 isHDRSettingAllowed])
  {
    unsigned int v228 = [v4 isModernHDRSupported];
    unsigned int v229 = [v4 isSmartHDRSupported];
    unsigned __int8 v230 = [v4 isHDREV0CaptureSupported];
    if (v229)
    {
      id v231 = [v3 indexOfObject:v225];
      if (v231 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v232 = v231;
        v233 = v6[144];
        v234 = [v225 name];
        v235 = v225;
        v236 = [v225 target];
        v237 = [v233 preferenceSpecifierNamed:v234 target:v236 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:0 edit:0];

        if (v230)
        {
          CFStringRef v238 = @"CAM_MODERN_HDR_SMART_HDR_FOOTER";
        }
        else if ([v4 isFrontSmartHDRSupported])
        {
          CFStringRef v238 = @"CAM_MODERN_HDR_SMART_HDR_FOOTER_EV0_UNAVAILABLE";
        }
        else
        {
          CFStringRef v238 = @"CAM_MODERN_HDR_SMART_HDR_AUTO_HDR_FOOTER";
        }
        v251 = +[NSBundle bundleForClass:objc_opt_class()];
        v252 = [v251 localizedStringForKey:v238 value:&stru_20A70 table:@"CameraSettings"];
        [v237 setObject:v252 forKeyedSubscript:PSFooterTextGroupKey];

        [v3 setObject:v237 atIndexedSubscript:v232];
        v225 = v235;
      }
      v241 = +[NSBundle bundleForClass:objc_opt_class()];
      v242 = v241;
      CFStringRef v243 = @"CAM_MODERN_HDR_SMART_HDR";
    }
    else
    {
      if (!v228)
      {
        v245 = 0;
LABEL_221:

        goto LABEL_222;
      }
      v241 = +[NSBundle bundleForClass:objc_opt_class()];
      v242 = v241;
      CFStringRef v243 = @"CAM_MODERN_HDR_AUTO_HDR";
    }
    v245 = [v241 localizedStringForKey:v243 value:&stru_20A70 table:@"CameraSettings"];

    id v253 = [v3 indexOfSpecifierWithID:@"hdrKeepOriginalPhotoSwitch"];
    if (v253 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v254 = v253;
      id objb = v245;
      v313 = v225;
      v255 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v256 = [v255 localizedStringForKey:@"HDR_KEEP_ORIGINAL_PHOTO" value:&stru_20A70 table:@"CameraSettings"];

      unsigned __int8 v257 = v230;
      v302 = (void *)v256;
      v258 = [v6[144] preferenceSpecifierNamed:v256 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
      uint64_t v259 = PSDefaultsKey;
      [v258 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
      uint64_t v260 = PSKeyNameKey;
      [v258 setObject:@"CAMUserPreferenceModernHDRKeepNormalPhoto" forKeyedSubscript:PSKeyNameKey];
      uint64_t v261 = PSDefaultValueKey;
      [v258 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
      [v3 replaceObjectAtIndex:v254 withObject:v258];
      if ((v257 & 1) == 0) {
        [v3 removeObjectAtIndex:v254];
      }
      self = v306;
      v245 = objb;
      v6 = &CFPreferencesAppSynchronize_ptr;
      v262 = +[PSSpecifier preferenceSpecifierNamed:objb target:v306 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

      [v262 setObject:@"com.apple.camera" forKeyedSubscript:v259];
      [v262 setObject:@"CAMUserPreferenceModernHDRBehavior" forKeyedSubscript:v260];
      [v262 setObject:&__kCFBooleanTrue forKeyedSubscript:v261];
      [v3 insertObject:v262 atIndex:v254];

      v4 = v298;
      v225 = v313;
    }
    goto LABEL_221;
  }
  id v239 = [v3 indexOfSpecifierWithID:@"hdrTitleGroup"];
  if (v239 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [v3 removeObjectAtIndex:v239];
  }
  id v240 = [v3 indexOfSpecifierWithID:@"hdrKeepOriginalPhotoSwitch"];
  if (v240 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [v3 removeObjectAtIndex:v240];
  }
LABEL_222:
  if ([v4 isTimeOfFlightSupported])
  {
    v263 = +[OBBundleManager sharedManager];
    v264 = [v263 bundleWithIdentifier:@"com.apple.onboarding.camera"];

    v265 = [v264 privacyFlow];
    [v265 localizedButtonTitle];
    v266 = v314 = v225;
    id v267 = [v266 rangeOfString:v266];
    v268 = v6;
    NSUInteger v270 = v269;
    v271 = [v268[144] groupSpecifierWithID:@"Privacy"];
    v272 = (objc_class *)objc_opt_class();
    v273 = NSStringFromClass(v272);
    [v271 setProperty:v273 forKey:PSFooterCellClassGroupKey];

    [v271 setProperty:v266 forKey:PSFooterHyperlinkViewTitleKey];
    v328.location = (NSUInteger)v267;
    v328.length = v270;
    v274 = NSStringFromRange(v328);
    [v271 setProperty:v274 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v275 = +[NSValue valueWithNonretainedObject:self];
    [v271 setProperty:v275 forKey:PSFooterHyperlinkViewTargetKey];

    v276 = NSStringFromSelector("_privacyButtonPressed:");
    [v271 setProperty:v276 forKey:PSFooterHyperlinkViewActionKey];

    [v3 addObject:v271];
    v225 = v314;
  }
  if ((+[CAMCaptureCapabilities isCameraAppInstalled](CAMCaptureCapabilities, "isCameraAppInstalled") & 1) == 0&& (+[CAMCaptureCapabilities isMessagesAppInstalled] & 1) == 0)
  {
    v322[0] = @"systemSettings";
    v322[1] = @"CAMERA_BUTTON_SETTINGS";
    v277 = +[NSArray arrayWithObjects:v322 count:2];
    v278 = +[NSMutableArray array];
    v315[0] = _NSConcreteStackBlock;
    v315[1] = 3221225472;
    v315[2] = sub_11418;
    v315[3] = &unk_20908;
    id v279 = v3;
    id v316 = v279;
    id v280 = v278;
    id v317 = v280;
    [v277 enumerateObjectsUsingBlock:v315];
    id v3 = v280;
  }
  id v281 = v3;

  return v281;
}

- (BOOL)_showHEVCOnlyFormatsOnCapableDevices
{
  return +[PFMediaCapabilities newFormatsConfiguration] != (char *)&dword_0 + 1;
}

- (void)_handleConfirmHighEfficiencyLearnMore:(id)a3
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v3 localizedStringForKey:@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_LEARN_MORE_URL" value:&stru_20A70 table:@"CameraSettings"];

  if (v6)
  {
    v4 = +[NSURL URLWithString:](NSURL, "URLWithString:");
    if (v4)
    {
      unsigned int v5 = +[UIApplication sharedApplication];
      [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
    }
  }

  _objc_release_x2();
}

- (id)_recordVideoConfiguration:(id)a3
{
  id v3 = +[NSNumber numberWithLong:CFPreferencesGetAppIntegerValue(CAMUserPreferenceVideoConfiguration, @"com.apple.camera", 0)];
  v4 = +[CameraVideoSettingsController shortTitleForVideoConfiguration:v3];

  return v4;
}

- (BOOL)_isPALVideoEnabled
{
  return CFPreferencesGetAppBooleanValue(CAMUserPreferenceEnablePALVideoFormats, @"com.apple.camera", 0) != 0;
}

- (id)_recordSlomoConfiguration:(id)a3
{
  id v3 = [a3 values];
  v4 = +[PFMediaCapabilities recordSlomoConfigurationWithValidValues:v3];

  return v4;
}

- (void)_setRecordSlomoConfiguration:(id)a3 specifier:(id)a4
{
  id v19 = a3;
  unsigned int v5 = (int *)[v19 integerValue];
  BOOL v6 = (unint64_t)v5 - 13 < 2 || v5 == &dword_8;
  if ((v6 || v5 == &dword_4 && [(CameraSettingsController *)self _isHDRVideoEnabled])
    && (+[CameraSettingsBaseController capabilities],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isHEVCEncodingSupported],
        v7,
        unsigned __int8 v9 = [(CameraSettingsController *)self _showHEVCOnlyFormatsOnCapableDevices], v8)&& (v9 & 1) == 0&& !CFPreferencesGetAppBooleanValue(CAMUserPreferencesDidConfirmSlomoMostCompatible, @"com.apple.camera", 0))
  {
    id v10 = objc_alloc_init((Class)PSConfirmationSpecifier);
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_TITLE" value:&stru_20A70 table:@"CameraSettings"];
    [v10 setTitle:v12];

    if ([(CameraSettingsController *)self _isHDRVideoEnabled]) {
      v13 = @"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_SLOMO_HDR";
    }
    else {
      v13 = @"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_SLOMO";
    }
    v14 = sub_112AC(v13);
    [v10 setPrompt:v14];

    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_LEARN_MORE" value:&stru_20A70 table:@"CameraSettings"];
    [v10 setCancelButton:v16];

    v17 = +[NSBundle bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"CAM_CONFIRM_HIGH_EFFICIENCY_VIDEO_OK" value:&stru_20A70 table:@"CameraSettings"];
    [v10 setOkButton:v18];

    [v10 setTarget:self];
    [v10 setConfirmationAction:"_handleSlomoMostCompatibleConfirmed:"];
    [v10 setConfirmationCancelAction:"_handleConfirmHighEfficiencyLearnMore:"];
    [v10 setUserInfo:v19];
    [(CameraSettingsController *)self showConfirmationViewForSpecifier:v10 useAlert:1];
  }
  else
  {
    +[PFMediaCapabilities setRecordSlomoConfiguration:v19];
    CFPreferencesAppSynchronize(@"com.apple.camera");
  }
}

- (void)_handleSlomoMostCompatibleConfirmed:(id)a3
{
  id v3 = [a3 userInfo];
  +[PFMediaCapabilities setRecordSlomoConfiguration:v3];
  CFPreferencesSetAppValue(CAMUserPreferencesDidConfirmSlomoMostCompatible, &__kCFBooleanTrue, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (BOOL)_isHDRVideoEnabled
{
  BOOL v2 = [(CameraSettingsController *)self _showHEVCOnlyFormatsOnCapableDevices];
  id v3 = +[CameraSettingsBaseController capabilities];
  unsigned __int8 v4 = +[CAMUserPreferences shouldEnableHDR10BitVideoForHEVCEnabled:v2 capabilities:v3];

  return v4;
}

- (id)_cinematicSpecifier
{
  id v3 = sub_112AC(@"CAM_RECORD_CINEMATIC_TITLE");
  unsigned __int8 v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"_setRecordCinematicConfiguration:specifier:" get:"_recordCinematicConfiguration:" detail:objc_opt_class() cell:2 edit:0];
  unsigned int v5 = +[CameraSettingsBaseController capabilities];
  if ([v5 isPALVideoSupported]) {
    unsigned int v6 = [(CameraSettingsController *)self _isPALVideoEnabled];
  }
  else {
    unsigned int v6 = 0;
  }

  id v7 = +[NSMutableString string];
  unsigned int v8 = sub_112AC(@"CAM_RECORD_CINEMATIC_FOOTER_HEAD");
  [v7 appendFormat:@"%@", v8];

  unsigned __int8 v9 = +[NSMutableArray array];
  id v10 = +[NSMutableArray array];
  v11 = +[NSMutableArray array];
  [v9 addObject:&off_248B0];
  v12 = sub_112AC(@"CAM_RECORD_VIDEO_1080p_30");
  [v10 addObject:v12];

  v13 = sub_112AC(@"CAM_RECORD_VIDEO_1080p_30_SHORT");
  [v11 addObject:v13];

  v14 = sub_112AC(@"CAM_RECORD_VIDEO_1080p_30_HEVC_FOOTER");
  [v7 appendFormat:@"\n%@", v14];

  [v9 addObject:&off_248C8];
  v15 = sub_112AC(@"CAM_RECORD_VIDEO_4K_24");
  [v10 addObject:v15];

  v16 = sub_112AC(@"CAM_RECORD_VIDEO_4K_24_SHORT");
  [v11 addObject:v16];

  v17 = sub_112AC(@"CAM_RECORD_VIDEO_4K_24_HEVC_FOOTER");
  [v7 appendFormat:@"\n%@", v17];

  if (v6)
  {
    [v9 addObject:&off_248E0];
    v18 = sub_112AC(@"CAM_RECORD_VIDEO_4K_25");
    [v10 addObject:v18];

    id v19 = sub_112AC(@"CAM_RECORD_VIDEO_4K_25_SHORT");
    [v11 addObject:v19];

    v20 = sub_112AC(@"CAM_RECORD_VIDEO_4K_25_HEVC_FOOTER");
    [v7 appendFormat:@"\n%@", v20];
  }
  [v9 addObject:&off_248F8];
  v21 = sub_112AC(@"CAM_RECORD_VIDEO_4K_30");
  [v10 addObject:v21];

  v22 = sub_112AC(@"CAM_RECORD_VIDEO_4K_30_SHORT");
  [v11 addObject:v22];

  v23 = sub_112AC(@"CAM_RECORD_VIDEO_4K_30_HEVC_FOOTER");
  [v7 appendFormat:@"\n%@", v23];

  [v4 setValues:v9 titles:v10 shortTitles:v11];
  [v4 setProperty:v7 forKey:PSStaticTextMessageKey];

  return v4;
}

- (void)_setRecordCinematicConfiguration:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(CAMUserPreferenceCinematicConfiguration, a3, @"com.apple.camera");

  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (id)_recordCinematicConfiguration:(id)a3
{
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(CAMUserPreferenceCinematicConfiguration, @"com.apple.camera", 0);

  return +[NSNumber numberWithLong:AppIntegerValue];
}

- (id)_sharedLibrarySpecifier
{
  id v3 = sub_112AC(@"CAM_SHARED_LIBRARY_GROUP_HEADER");
  unsigned __int8 v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  return v4;
}

- (id)_isMacroControlEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceEnableSuperWideAutoMacro", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    unint64_t v4 = AppBooleanValue == 0;
  }
  else
  {
    unsigned int v5 = +[CAMCaptureCapabilities capabilities];
    unint64_t v4 = (unint64_t)[v5 macroControlEnabledByDefault];
  }
  unsigned int v6 = +[NSNumber numberWithBool:v4];

  return v6;
}

- (void)_setMacroControlEnabled:(id)a3 specifier:(id)a4
{
  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 BOOLValue] ^ 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(@"CAMUserPreferenceEnableSuperWideAutoMacro", v4, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (void)_launchSemanticStylesSettings:(id)a3
{
  id v4 = objc_alloc_init((Class)CAMSemanticStyleSettingsController);
  [v4 setModalPresentationStyle:0];
  [(CameraSettingsController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_launchSmartStylesSettings:(id)a3
{
  id v4 = objc_alloc_init((Class)CAMSmartStyleSettingsController);
  [v4 setModalPresentationStyle:0];
  [(CameraSettingsController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)_focalLengthStringForCustomLens:(int64_t)a3
{
  return +[CameraFocalLengthSettingsController focalLengthStringForCustomLens:a3];
}

- (id)_selectedCustomLensGroup:(id)a3
{
  if (+[CameraFocalLengthSettingsController canEnableCustomLenses])
  {
    id v3 = (void *)CFPreferencesCopyAppValue(CAMUserPreferencesSelectedCustomLensGroup, @"com.apple.camera");
    id v4 = +[CameraSettingsBaseController capabilities];
    unsigned int v5 = [v4 supportedCustomLensGroupForGroup:v3];
  }
  else
  {
    unsigned int v5 = &off_24DE0;
  }

  return v5;
}

- (void)_privacyButtonPressed:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.camera"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CameraSettingsController;
  [(CameraSettingsController *)&v4 viewDidAppear:a3];
  [(CameraSettingsController *)self _writeLastViewedDate];
  [(CameraSettingsController *)self emitNavigationEvent];
}

- (void)_writeLastViewedDate
{
}

- (void)emitNavigationEvent
{
  id v8 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Camera"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v4 = +[NSLocale currentLocale];
  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"CAMERA_SETTINGS_TITLE" table:@"CameraSettings" locale:v4 bundleURL:v6];

  [(CameraSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.camera" title:v7 localizedNavigationComponents:&__NSArray0__struct deepLink:v8];
}

- (void)_launchCameraButtonTips:(id)a3
{
  sub_112AC(@"CAMERA_BUTTON_TIPS_URL_TOPIC_ID");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = +[HLPHelpViewController URLWithTopicID:v7];
  unsigned int v5 = +[HLPHelpViewController helpViewControllerWithURL:v4];
  [v5 setShowTopicViewOnLoad:1];
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
  [v6 setModalPresentationStyle:1];
  [(CameraSettingsController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)cameraCaptureButtonAppConfigurationCoordinator:(id)a3 didChangeAssociatedAppBundleID:(id)a4
{
  uint64_t v5 = [(CameraSettingsController *)self getGroupSpecifierForSpecifierID:@"systemSettings", a4];
  if (v5) {
    [(CameraSettingsController *)self reloadSpecifier:v5];
  }

  _objc_release_x1();
}

- (id)_getAssociatedAppDisplayName:(id)a3
{
  objc_super v4 = objc_msgSend(*(id *)(&self->super + 1), "associatedAppBundleID", a3);

  if (v4)
  {
    uint64_t v5 = [*(id *)(&self->super + 1) associatedAppBundleID];
    id v6 = +[CameraSettingsUtilities displayNameForBundleID:v5];
  }
  else
  {
    id v6 = sub_112AC(@"CAMERA_BUTTON_APP_LIST_NO_ACTION");
  }

  return v6;
}

- (CameraCaptureButtonAppConfigurationCoordinator)captureButtonAppConfigurationCoordinator
{
  return *(CameraCaptureButtonAppConfigurationCoordinator **)(&self->super + 1);
}

- (void).cxx_destruct
{
}

@end