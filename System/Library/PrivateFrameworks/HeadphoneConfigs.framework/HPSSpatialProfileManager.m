@interface HPSSpatialProfileManager
+ (BOOL)isProfileExisting;
+ (BOOL)isProxCardEnrollmentSupportedForDevice:(id)a3;
+ (BOOL)isProxCardShowed;
+ (BOOL)isSettingsEnrollmentSupported;
+ (id)profileEnrollmentViewController;
+ (id)profileManagementSpecifier;
+ (id)spatialProfileStatus;
+ (void)profileEnrollmentViewController;
+ (void)setProxCardShowed:(BOOL)a3;
+ (void)setProxCardShowed:(BOOL)a3 forDevice:(id)a4;
@end

@implementation HPSSpatialProfileManager

+ (BOOL)isSettingsEnrollmentSupported
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v2 = (void *)MGCopyAnswer();
    int v3 = [v2 BOOLValue];
    v4 = MGGetStringAnswer();
    int v5 = [v4 isEqualToString:@"iPhone"];
    int v6 = MGGetBoolAnswer();
    int v7 = v3 & v5;
    v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "No";
      if (v7) {
        v10 = "Yes";
      }
      else {
        v10 = "No";
      }
      if (v3) {
        v11 = "Yes";
      }
      else {
        v11 = "No";
      }
      int v14 = 136315906;
      v15 = v10;
      if (v5) {
        v12 = "Yes";
      }
      else {
        v12 = "No";
      }
      __int16 v16 = 2080;
      v17 = v11;
      __int16 v18 = 2080;
      v19 = v12;
      if (v6) {
        v9 = "Yes";
      }
      __int16 v20 = 2080;
      v21 = v9;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Feature Enabled, Local Support: %s, HW Support: %s, is iPhone: %s iPhone with ANE: %s", (uint8_t *)&v14, 0x2Au);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (BOOL)isProxCardEnrollmentSupportedForDevice:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    __int16 v16 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[HPSSpatialProfileManager isProxCardEnrollmentSupportedForDevice:]();
    }
    LOBYTE(v17) = 0;
LABEL_49:

    goto LABEL_50;
  }
  if (_os_feature_enabled_impl())
  {
    id v34 = a1;
    int v35 = [a1 isSettingsEnrollmentSupported];
    BOOL v36 = +[HPSSpatialProfileManager isProxCardShowed];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    int v5 = [MEMORY[0x1E4F50B70] sharedInstance];
    int v6 = [v5 pairedDevices];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v41;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        v11 = [v10 address];
        v12 = [v11 uppercaseString];
        v13 = [v4 uppercaseString];
        int v14 = [v12 isEqualToString:v13];

        if (v14) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v52 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      int v18 = [v10 getSpatialAudioPlatformSupport];
      BOOL v15 = v18 == 1;
      v19 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = "NO";
        if (v18 == 1) {
          __int16 v20 = "YES";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_1E4BFE000, v19, OS_LOG_TYPE_DEFAULT, "Spatial Profile: %@, Remote Support: %s", buf, 0x16u);
      }

      if ((v35 & (v18 == 1)) == 1)
      {
        int v17 = ([v34 isProfileExisting] | v36) ^ 1;
        BOOL v15 = 1;
        goto LABEL_23;
      }
    }
    else
    {
LABEL_11:

      BOOL v15 = 0;
    }
    int v17 = 0;
LABEL_23:
    if (!v36 && _os_feature_enabled_impl())
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F655B0]) initWithCameraSession:0];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v45) = 0;
      uint64_t v22 = dispatch_group_create();
      dispatch_group_enter(v22);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __67__HPSSpatialProfileManager_isProxCardEnrollmentSupportedForDevice___block_invoke;
      v37[3] = &unk_1E6EA8CF0;
      v39 = buf;
      v23 = v22;
      v38 = v23;
      [v21 downloadHRTFAsset:1 withCompletion:v37];
      dispatch_time_t v24 = dispatch_time(0, 500000000);
      intptr_t v25 = dispatch_group_wait(v23, v24);
      v26 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = @"timed out";
        if (!v25) {
          v27 = @"succeeded";
        }
        *(_DWORD *)v50 = 138412290;
        v51 = v27;
        _os_log_impl(&dword_1E4BFE000, v26, OS_LOG_TYPE_DEFAULT, "Spatial Profile: downloadAsset %@", v50, 0xCu);
      }

      if (v17) {
        int v17 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
      }

      _Block_object_dispose(buf, 8);
    }
    __int16 v16 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v17) {
        v28 = "Yes";
      }
      else {
        v28 = "No";
      }
      if (v35) {
        v29 = "Yes";
      }
      else {
        v29 = "No";
      }
      if (v15) {
        v30 = "Yes";
      }
      else {
        v30 = "No";
      }
      if ([v34 isProfileExisting]) {
        v31 = "Yes";
      }
      else {
        v31 = "No";
      }
      *(_DWORD *)buf = 136316162;
      if (v36) {
        v32 = "Yes";
      }
      else {
        v32 = "No";
      }
      *(void *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2080;
      v45 = v30;
      __int16 v46 = 2080;
      v47 = v31;
      __int16 v48 = 2080;
      v49 = v32;
      _os_log_impl(&dword_1E4BFE000, v16, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Overall Support: %s => Feature Enabled, Local Support: %s, Remote Support: %s, Profile Existing: %s, Prox Card Presented: %s", buf, 0x34u);
    }
    goto LABEL_49;
  }
  LOBYTE(v17) = 0;
LABEL_50:

  return v17;
}

void __67__HPSSpatialProfileManager_isProxCardEnrollmentSupportedForDevice___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: downloadHRTFAsset isDownloaded %d, path %@, error %@", (uint8_t *)v10, 0x1Cu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    CFPreferencesSetAppValue(@"downloadAssetPath", v7, @"com.apple.BTServer");
    CFPreferencesAppSynchronize(@"com.apple.BTServer");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)setProxCardShowed:(BOOL)a3 forDevice:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    int v6 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
    if (!v4) {
      int v6 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
    }
    CFPreferencesSetAppValue(@"isSpatialProfileShowed", *v6, @"com.apple.BTServer");
    CFPreferencesAppSynchronize(@"com.apple.BTServer");
    id v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "NO";
      if (v4) {
        id v8 = "YES";
      }
      int v9 = 136315394;
      v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Set Prox Card Showd to %s for Device: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[HPSSpatialProfileManager setProxCardShowed:forDevice:]();
    }
  }
}

+ (void)setProxCardShowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  if (a3) {
    BOOL v4 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  }
  CFPreferencesSetAppValue(@"isSpatialProfileShowed", *v4, @"com.apple.BTServer");
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = "NO";
    if (v3) {
      int v6 = "YES";
    }
    int v7 = 136315138;
    id v8 = v6;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: update prox card status via Enrollment : %s ", (uint8_t *)&v7, 0xCu);
  }
}

+ (BOOL)isProxCardShowed
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"isSpatialProfileShowed", @"com.apple.BTServer", &keyExistsAndHasValidFormat);
  BOOL v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = "YES";
    if (AppBooleanValue) {
      id v5 = "YES";
    }
    else {
      id v5 = "NO";
    }
    if (!keyExistsAndHasValidFormat) {
      BOOL v4 = "NO";
    }
    *(_DWORD *)buf = 136315394;
    v10 = v5;
    __int16 v11 = 2080;
    id v12 = v4;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Check if prox card is shown, showed %s %s ", buf, 0x16u);
  }

  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

+ (id)profileEnrollmentViewController
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl())
  {
    v2 = objc_alloc_init(HPSSpatialProfileEnrollmentController);
LABEL_7:
    BOOL v6 = [[HPSSpatialProfileNavigationController alloc] initWithRootViewController:v2];
    goto LABEL_8;
  }
  v2 = objc_alloc_init(HPSSpatialProfileSingeStepEnrollmentController);
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  BOOL v3 = CFPreferencesCopyAppValue(@"downloadAssetPath", @"com.apple.BTServer");
  BOOL v4 = sharedBluetoothSettingsLogComponent();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: settting savedHRTFAssetPath %@", (uint8_t *)&v8, 0xCu);
    }

    [(HPSSpatialProfileEnrollmentController *)v2 setDownloadAssetPath:v3];
    goto LABEL_7;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[HPSSpatialProfileManager profileEnrollmentViewController]();
  }

  BOOL v6 = 0;
LABEL_8:

  return v6;
}

+ (id)profileManagementSpecifier
{
  BOOL v3 = (void *)MEMORY[0x1E4F92E70];
  BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  BOOL v6 = [v3 preferenceSpecifierNamed:v5 target:a1 set:0 get:sel_spatialProfileStatus detail:objc_opt_class() cell:2 edit:0];

  return v6;
}

+ (id)spatialProfileStatus
{
  if ([a1 isProfileExisting])
  {
    v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v3 = [v2 localizedStringForKey:@"ON" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  }
  else
  {
    BOOL v3 = &stru_1F4097960;
  }

  return v3;
}

+ (BOOL)isProfileExisting
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v2 = objc_alloc_init(MEMORY[0x1E4F50B80]);
  BOOL v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __45__HPSSpatialProfileManager_isProfileExisting__block_invoke;
  uint64_t v13 = &unk_1E6EA8D18;
  uint64_t v15 = &v16;
  BOOL v4 = v3;
  id v14 = v4;
  [v2 fetchSoundProfileRecordWithCompletion:&v10];

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v4, v5);
  BOOL v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((unsigned __int8 *)v17 + 24);
    *(_DWORD *)buf = 67109120;
    int v21 = v7;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: isProfileExisting %i", buf, 8u);
  }

  objc_msgSend(v2, "invalidate", v10, v11, v12, v13);
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __45__HPSSpatialProfileManager_isProfileExisting__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__HPSSpatialProfileManager_isProfileExisting__block_invoke_cold_2((uint64_t)v6, v7);
    }
LABEL_4:

    goto LABEL_5;
  }
  BOOL v8 = sharedBluetoothSettingsLogComponent();
  int v7 = v8;
  if (!v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __45__HPSSpatialProfileManager_isProfileExisting__block_invoke_cold_1();
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 soundProfileData];
    int v12 = 134217984;
    uint64_t v13 = [v9 length];
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: isProfileExisting Profile Data Size: %lu", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v10 = [v5 soundProfileData];
  uint64_t v11 = [v10 length];

  if (v11) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)isProxCardEnrollmentSupportedForDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Cannot Get Prox Card Support, Invalid BT Address", v2, v3, v4, v5, v6);
}

+ (void)setProxCardShowed:forDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Cannot Set Prox Card Showed, Invalid BT Address", v2, v3, v4, v5, v6);
}

+ (void)profileEnrollmentViewController
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: downloadAsset failed returning nil", v2, v3, v4, v5, v6);
}

void __45__HPSSpatialProfileManager_isProfileExisting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: isProfileExisting Profile Record is empty", v2, v3, v4, v5, v6);
}

void __45__HPSSpatialProfileManager_isProfileExisting__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_ERROR, "Spatial Profile: isProfileExisting Error: %@", (uint8_t *)&v2, 0xCu);
}

@end