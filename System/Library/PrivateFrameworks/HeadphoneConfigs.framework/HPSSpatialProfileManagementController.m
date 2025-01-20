@interface HPSSpatialProfileManagementController
- (HPSSpatialProfileManagementController)init;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_processDownloadHRTFAsset:(id)a3 isDownloaded:(BOOL)a4 path:(id)a5 error:(id)a6 downloadResult:(unint64_t)a7;
- (void)cancelEnrollment;
- (void)presentProfileEnrollmentController:(id)a3;
- (void)promptResetProfile:(id)a3;
- (void)resetProfile:(id)a3;
- (void)spatialAudioProfileUpdateHandler:(id)a3;
- (void)startAssetDownloadAndPresentEnrollmentController:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)userDidTapSpatialProfilePrivacyLink:(id)a3;
@end

@implementation HPSSpatialProfileManagementController

- (HPSSpatialProfileManagementController)init
{
  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileManagementController;
  v2 = [(HPSSpatialProfileManagementController *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_spatialAudioProfileUpdateHandler_ name:@"HPSSpatialAudioProfileUpdated" object:0];

    v2->_spatialProfileAssetState = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v4;

    downloadAssetPath = v2->_downloadAssetPath;
    v2->_downloadAssetPath = 0;
  }
  return v2;
}

- (id)specifiers
{
  v50[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"HPSSpatialAudioProfileTapped" object:0];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  v48.receiver = self;
  v48.super_class = (Class)HPSSpatialProfileManagementController;
  v5 = [(HPSSpatialProfileManagementController *)&v48 specifiers];
  v6 = [v4 arrayWithArray:v5];

  v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SP_TOP_GROUP_ID"];
  objc_super v8 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SP_MGMT_GROUP_ID"];
  if (+[HPSSpatialProfileManager isProfileExisting])
  {
    v9 = NSString;
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v10 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_WHAT_ENROLLED_INFO" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
    v11 = v46 = v8;
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"SPATIAL_AUDIO_DETAIL_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
    v14 = objc_msgSend(v9, "stringWithFormat:", v11, v13);

    v15 = (void *)MEMORY[0x1E4F92E70];
    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_RESET" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
    v18 = [v15 preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v18 setButtonAction:sel_promptResetProfile_];
    objc_super v8 = v46;
    [v18 setProperty:@"SPATIAL_AUDIO_PROFILE_RESET" forKey:*MEMORY[0x1E4F93188]];
  }
  else
  {
    BOOL v19 = +[HPSSpatialProfileManager isSettingsEnrollmentSupported];
    v20 = NSString;
    v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = v21;
    if (v19)
    {
      v47 = v8;
      v23 = [v21 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_WHAT_INFO" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
      v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"SPATIAL_AUDIO_DETAIL_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v14 = objc_msgSend(v20, "stringWithFormat:", v23, v25);

      v26 = (void *)MEMORY[0x1E4F92E70];
      v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_CREATE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
      v18 = [v26 preferenceSpecifierNamed:v28 target:self set:0 get:0 detail:0 cell:13 edit:0];

      if (_os_feature_enabled_impl())
      {
        id v29 = objc_alloc(MEMORY[0x1E4F1CA60]);
        uint64_t v49 = *MEMORY[0x1E4F930A8];
        v50[0] = objc_opt_class();
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
        v31 = (void *)[v29 initWithDictionary:v30];

        [v18 setProperties:v31];
        [v18 setButtonAction:sel_startAssetDownloadAndPresentEnrollmentController_];
      }
      else
      {
        [v18 setButtonAction:sel_presentProfileEnrollmentController_];
      }
      objc_super v8 = v47;
    }
    else
    {
      v32 = [v21 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_USER_INFO" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
      v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"SPATIAL_AUDIO_DETAIL_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v14 = objc_msgSend(v20, "stringWithFormat:", v32, v34);

      v18 = 0;
    }
  }
  [v7 setProperty:v14 forKey:*MEMORY[0x1E4F93170]];
  v35 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v35);
  [v7 setProperty:v36 forKey:*MEMORY[0x1E4F93140]];

  [v7 setProperty:v14 forKey:*MEMORY[0x1E4F93160]];
  v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v38 = [v37 localizedStringForKey:@"SPATIAL_AUDIO_DETAIL_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
  v51.location = [v14 rangeOfString:v38];
  v39 = NSStringFromRange(v51);
  [v7 setProperty:v39 forKey:*MEMORY[0x1E4F93150]];

  v40 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v7 setProperty:v40 forKey:*MEMORY[0x1E4F93158]];

  [v7 setProperty:@"userDidTapSpatialProfilePrivacyLink:" forKey:*MEMORY[0x1E4F93148]];
  [v6 addObject:v7];
  [v6 addObject:v8];
  if (v18) {
    [v6 addObject:v18];
  }
  v41 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
  uint64_t v42 = (int)*MEMORY[0x1E4F92F08];
  v43 = *(Class *)((char *)&self->super.super.super.super.super.isa + v42);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v42) = v41;

  id v44 = *(id *)((char *)&self->super.super.super.super.super.isa + v42);
  return v44;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v13;
    v6 = [v5 titleLabel];
    [v6 setLineBreakMode:0];

    v7 = [v5 titleLabel];
    [v7 setNumberOfLines:0];

    objc_super v8 = [v5 specifier];
    v9 = [v8 identifier];
    int v10 = [v9 isEqualToString:@"SPATIAL_AUDIO_PROFILE_RESET"];

    if (v10)
    {
      v11 = [MEMORY[0x1E4FB1618] redColor];
      v12 = [v5 textLabel];
      [v12 setTextColor:v11];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)spatialAudioProfileUpdateHandler:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HPSSpatialProfileManagementController_spatialAudioProfileUpdateHandler___block_invoke;
  block[3] = &unk_1E6EA82F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__HPSSpatialProfileManagementController_spatialAudioProfileUpdateHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)resetProfile:(id)a3
{
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Reset Profile", buf, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F50B80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HPSSpatialProfileManagementController_resetProfile___block_invoke;
  v6[3] = &unk_1E6EA8250;
  id v7 = v4;
  id v5 = v4;
  [v5 deleteSoundProfileRecordWithCompletion:v6];
}

void __54__HPSSpatialProfileManagementController_resetProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    sharedBluetoothSettingsLogComponent();
    id v4 = (HPSSpatialProfileAnalytics *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR)) {
      __54__HPSSpatialProfileManagementController_resetProfile___block_invoke_cold_1((uint64_t)v3, &v4->super);
    }
  }
  else
  {
    id v4 = objc_alloc_init(HPSSpatialProfileAnalytics);
    [(HPSSpatialProfileAnalytics *)v4 submitHPSSpatialProfileResetAnalytics];
    id v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Profile Reset Completed", v7, 2u);
    }

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"HPSSpatialAudioProfileUpdated" object:0];
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)promptResetProfile:(id)a3
{
  id v4 = a3;
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Prompt Reset", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v8 = [v7 localizedStringForKey:@"RESET_SPATIAL_AUDIO_PROFILE_PROMPT_HEAD" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v10 = [v9 localizedStringForKey:@"RESET_SPATIAL_AUDIO_PROFILE_PROMPT_CONTENT" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:0];

  v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"RESET_SPATIAL_AUDIO_PROFILE_CONFIRM" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __60__HPSSpatialProfileManagementController_promptResetProfile___block_invoke;
  v24 = &unk_1E6EA86E0;
  v25 = self;
  id v26 = v4;
  id v15 = v4;
  v16 = [v12 actionWithTitle:v14 style:2 handler:&v21];

  v17 = (void *)MEMORY[0x1E4FB1410];
  v18 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class(), v21, v22, v23, v24, v25);
  BOOL v19 = [v18 localizedStringForKey:@"RESET_SPATIAL_AUDIO_PROFILE_CANCEL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v20 = [v17 actionWithTitle:v19 style:1 handler:0];

  [v11 addAction:v16];
  [v11 addAction:v20];
  [(HPSSpatialProfileManagementController *)self presentViewController:v11 animated:1 completion:0];
}

uint64_t __60__HPSSpatialProfileManagementController_promptResetProfile___block_invoke(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Reset Sound Profile", v4, 2u);
  }

  return [*(id *)(a1 + 32) resetProfile:*(void *)(a1 + 40)];
}

- (void)userDidTapSpatialProfilePrivacyLink:(id)a3
{
  id v4 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.spatialAudioProfiles"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)cancelEnrollment
{
}

- (void)startAssetDownloadAndPresentEnrollmentController:(id)a3
{
  id v4 = a3;
  self->_spatialProfileAssetState = 1;
  [(HPSSpatialProfileManagementController *)self spatialAudioProfileUpdateHandler:0];
  [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93130]];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F655B0]) initWithCameraSession:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__HPSSpatialProfileManagementController_startAssetDownloadAndPresentEnrollmentController___block_invoke;
  v7[3] = &unk_1E6EA8708;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 downloadHRTFAssetV2:0 withCompletion:v7];
}

uint64_t __90__HPSSpatialProfileManagementController_startAssetDownloadAndPresentEnrollmentController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _processDownloadHRTFAsset:*(void *)(a1 + 40) isDownloaded:a2 path:a3 error:a4 downloadResult:a5];
}

- (void)_processDownloadHRTFAsset:(id)a3 isDownloaded:(BOOL)a4 path:(id)a5 error:(id)a6 downloadResult:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__HPSSpatialProfileManagementController__processDownloadHRTFAsset_isDownloaded_path_error_downloadResult___block_invoke;
  v18[3] = &unk_1E6EA8730;
  id v19 = v12;
  v20 = self;
  BOOL v24 = a4;
  id v21 = v13;
  id v22 = v14;
  unint64_t v23 = a7;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

void __106__HPSSpatialProfileManagementController__processDownloadHRTFAsset_isDownloaded_path_error_downloadResult___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93130]];
  [*(id *)(a1 + 40) spatialAudioProfileUpdateHandler:0];
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    unint64_t v6 = *(void *)(a1 + 64) - 1;
    if (v6 > 3) {
      id v7 = "Unknown";
    }
    else {
      id v7 = off_1E6EA8750[v6];
    }
    v27[0] = 67109890;
    v27[1] = v3;
    __int16 v28 = 2112;
    uint64_t v29 = v5;
    __int16 v30 = 2112;
    uint64_t v31 = v4;
    __int16 v32 = 2080;
    v33 = v7;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "HRTF Asset Download: downloadHRTFAsset isDownloaded %d, path %@ error %@ result %s", (uint8_t *)v27, 0x26u);
  }

  if (*(unsigned char *)(a1 + 72))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1400), *(id *)(a1 + 48));
    [*(id *)(a1 + 40) presentProfileEnrollmentController:*(void *)(a1 + 32)];
    *(_DWORD *)(*(void *)(a1 + 40) + 1384) = 3;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 1384) = 2;
    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_ASSET_DOWNLOAD_FAIL_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];

    int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_ASSET_DOWNLOAD_FAIL_MESSAGE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];

    id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"TRY_AGAIN" value:&stru_1F4097960 table:@"SpatialAudioProfile"];

    switch(*(void *)(a1 + 64))
    {
      case 1:
        id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v15 = v14;
        id v16 = @"DOWNLOAD_FAIL_MESSAGE_NOT_CONNCTED_TO_INTERNET";
        goto LABEL_14;
      case 2:
        id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v18 = v17;
        id v19 = @"DOWNLOAD_FAIL_MESSAGE_CANCELLED";
        goto LABEL_12;
      case 3:
        id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v18 = v17;
        id v19 = @"DOWNLOAD_FAIL_MESSAGE_NO_SPACE_LEFT";
LABEL_12:
        uint64_t v20 = [v17 localizedStringForKey:v19 value:&stru_1F4097960 table:@"SpatialAudioProfile"];

        id v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v22 = v21;
        unint64_t v23 = @"TRY_AGAIN";
        goto LABEL_15;
      case 4:
        id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v15 = v14;
        id v16 = @"DOWNLOAD_FAIL_MESSAGE_TIMED_OUT";
LABEL_14:
        uint64_t v20 = [v14 localizedStringForKey:v16 value:&stru_1F4097960 table:@"SpatialAudioProfile"];

        id v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v22 = v21;
        unint64_t v23 = @"OK";
LABEL_15:
        uint64_t v24 = [v21 localizedStringForKey:v23 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
        v11 = (void *)v20;

        id v13 = (void *)v24;
        break;
      default:
        break;
    }
    v25 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v11 preferredStyle:1];
    id v26 = [MEMORY[0x1E4FB1410] actionWithTitle:v13 style:0 handler:&__block_literal_global_120];
    [v25 addAction:v26];

    [*(id *)(a1 + 40) presentViewController:v25 animated:1 completion:0];
  }
}

- (void)presentProfileEnrollmentController:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    id v7 = objc_alloc_init(HPSSpatialProfileSingeStepEnrollmentController);
    [(HPSSpatialProfileSingeStepEnrollmentController *)v7 setDownloadAssetPath:self->_downloadAssetPath];
  }
  else
  {
    id v7 = objc_alloc_init(HPSSpatialProfileEnrollmentController);
  }
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelEnrollment];
  uint64_t v5 = [(HPSSpatialProfileSingeStepEnrollmentController *)v7 navigationItem];
  [v5 setLeftBarButtonItem:v4];

  unint64_t v6 = [[HPSSpatialProfileNavigationController alloc] initWithRootViewController:v7];
  [(HPSSpatialProfileNavigationController *)v6 setModalPresentationStyle:0];
  [(HPSSpatialProfileNavigationController *)v6 setModalInPresentation:1];
  [(HPSSpatialProfileManagementController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileManagementController;
  uint64_t v5 = [(HPSSpatialProfileManagementController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 13)
  {
    uint64_t v6 = objc_opt_class();
    if (v6 == objc_opt_class())
    {
      [v5 setAccessoryView:self->_spinner];
      spinner = self->_spinner;
      if (self->_spatialProfileAssetState == 1) {
        [(UIActivityIndicatorView *)spinner startAnimating];
      }
      else {
        [(UIActivityIndicatorView *)spinner stopAnimating];
      }
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadAssetPath, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

void __54__HPSSpatialProfileManagementController_resetProfile___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_ERROR, "Spatial Profile: Cannot Reset Profile, Error: %@", (uint8_t *)&v2, 0xCu);
}

@end