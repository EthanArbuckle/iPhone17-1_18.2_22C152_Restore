@interface DMCReturnToServiceController
- (BOOL)installWiFiProfileIfNeeded:(id *)a3;
- (BOOL)shouldDoReturnToService;
- (DMCEnrollmentFlowController)enrollmentFlowController;
- (DMCObliterationShelter)obliterationShelter;
- (DMCReturnToServiceController)init;
- (OS_dispatch_queue)workerQueue;
- (id)_ORGONotSupportedError;
- (id)_cloudConfigMissingError;
- (id)_configurationURLMissingError;
- (id)_webURLNotSupportedError;
- (id)languageStrings;
- (id)localeString;
- (void)_fetchAndInstallMDMProfileIfNeededWithCloudConfig:(id)a3 completionHandler:(id)a4;
- (void)_fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler:(id)a3;
- (void)_handleORGOEnrollmentWithCompletionHandler:(id)a3;
- (void)_markWiFiProfileAsManagedIfNeeded;
- (void)configureMDMWithCompletionHandler:(id)a3;
- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7;
- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6;
- (void)returnToServiceFlowCompleted;
- (void)setEnrollmentFlowController:(id)a3;
- (void)setObliterationShelter:(id)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation DMCReturnToServiceController

- (DMCReturnToServiceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMCReturnToServiceController;
  v2 = [(DMCReturnToServiceController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("DMCReturnToServiceController_worker_queue", 0);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)shouldDoReturnToService
{
  v2 = [(DMCReturnToServiceController *)self obliterationShelter];
  char v3 = [v2 hasConfigFile];

  return v3;
}

- (id)languageStrings
{
  if ([(DMCReturnToServiceController *)self shouldDoReturnToService])
  {
    char v3 = [(DMCReturnToServiceController *)self obliterationShelter];
    v4 = [v3 languageStrings];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)localeString
{
  if ([(DMCReturnToServiceController *)self shouldDoReturnToService])
  {
    char v3 = [(DMCReturnToServiceController *)self obliterationShelter];
    v4 = [v3 localeString];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)installWiFiProfileIfNeeded:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(DMCReturnToServiceController *)self shouldDoReturnToService]) {
    return 1;
  }
  v5 = [(DMCReturnToServiceController *)self obliterationShelter];
  objc_super v6 = [v5 wifiProfileData];

  if (v6)
  {
    v7 = [MEMORY[0x263F53C50] sharedConnection];
    id v14 = 0;
    id v8 = (id)[v7 installProfileData:v6 options:0 outError:&v14];
    id v9 = v14;

    BOOL v10 = v9 == 0;
    if (v9)
    {
      v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v9;
        _os_log_impl(&dword_221CC5000, v11, OS_LOG_TYPE_ERROR, "Failed to install WiFi data with error: %{public}@", buf, 0xCu);
      }
      if (a3) {
        *a3 = v9;
      }
    }
  }
  else
  {
    v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v12, OS_LOG_TYPE_DEFAULT, "No WiFi data, return.", buf, 2u);
    }
    BOOL v10 = 1;
  }

  return v10;
}

- (void)configureMDMWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(DMCReturnToServiceController *)self workerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke;
  v7[3] = &unk_2645E9348;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldDoReturnToService])
  {
    v2 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_2645E98A0;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    [v2 _fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler:v4];
  }
  else
  {
    char v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    v7 = [*(id *)(a1 + 32) obliterationShelter];
    [v7 clear];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_2645E9878;
    id v9 = *(id *)(a1 + 40);
    [v6 _fetchAndInstallMDMProfileIfNeededWithCloudConfig:a2 completionHandler:v8];
  }
}

uint64_t __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)returnToServiceFlowCompleted
{
  if ([(DMCReturnToServiceController *)self shouldDoReturnToService])
  {
    id v3 = [(DMCReturnToServiceController *)self obliterationShelter];
    [v3 clear];
  }
}

- (void)_fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCReturnToServiceController *)self workerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__DMCReturnToServiceController__fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler___block_invoke;
  v7[3] = &unk_2645E9348;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __94__DMCReturnToServiceController__fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  id v3 = [*(id *)(a1 + 32) obliterationShelter];
  id v4 = [v3 cloudConfigurationDetails];

  int v5 = [v2 activationRecordIndicatesCloudConfigurationIsAvailable];
  id v6 = *(NSObject **)DMCLogObjects();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0 || v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_INFO, "Activation record indicates cloud configuration is available, will fetch...", buf, 2u);
    }
    id v8 = [v2 cloudConfigurationDetails];
    if (v8)
    {
      id v9 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_INFO, "Cloud Configuration is available already, returning...", buf, 2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      id v16 = __94__DMCReturnToServiceController__fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler___block_invoke_4;
      uint64_t v17 = &unk_2645E98C8;
      id v19 = *(id *)(a1 + 40);
      id v10 = v2;
      id v18 = v10;
      v11 = (void *)MEMORY[0x223C90320](&v14);
      v12 = *(NSObject **)DMCLogObjects();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221CC5000, v12, OS_LOG_TYPE_DEFAULT, "Fetching cloud config from cloud...", buf, 2u);
        }
        objc_msgSend(v10, "retrieveAndStoreCloudConfigurationDetailsCompletionBlock:", v11, v14, v15, v16, v17);
      }
      else
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221CC5000, v12, OS_LOG_TYPE_DEFAULT, "Restoring stashed cloud config from disk...", buf, 2u);
        }
        objc_msgSend(v10, "storeCloudConfigurationDetails:completion:", v4, v11, v14, v15, v16, v17);
      }
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_INFO, "No cloud configuration according to activation record and obliteration shelter.", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __94__DMCReturnToServiceController__fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)DMCLogObjects();
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_ERROR, "Failed to retrieve and store cloud configuration with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_INFO, "Cloud Configuration fetched & stored.", (uint8_t *)&v7, 2u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) cloudConfigurationDetails];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
}

- (void)_fetchAndInstallMDMProfileIfNeededWithCloudConfig:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMCReturnToServiceController *)self workerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke;
  block[3] = &unk_2645E9968;
  BOOL v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke(id *a1)
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  id v3 = [v2 installedMDMProfileIdentifier];

  if (v3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_2;
    v37[3] = &unk_2645E9918;
    id v4 = v2;
    id v38 = v4;
    id v5 = a1[4];
    id v6 = a1[5];
    id v39 = v5;
    id v40 = v6;
    id v7 = (void (**)(void, void, void))MEMORY[0x223C90320](v37);
    id v8 = [a1[5] obliterationShelter];
    char v9 = [v8 isSupervised];

    if ((v9 & 1) != 0
      || ([a1[4] objectForKeyedSubscript:*MEMORY[0x263F38970]],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 BOOLValue],
          v10,
          !v11))
    {
      BOOL v13 = [a1[5] obliterationShelter];
      id v14 = [v13 mdmProfileData];

      if (v14)
      {
        uint64_t v15 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221CC5000, v15, OS_LOG_TYPE_INFO, "MDM profile exists.", buf, 2u);
        }
        ((void (**)(void, void *, id))v7)[2](v7, v14, a1[6]);
      }
      else
      {
        id v16 = a1[4];
        if (v16)
        {
          uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F38968]];
          if (v17)
          {
            [a1[5] _handleORGOEnrollmentWithCompletionHandler:a1[6]];
          }
          else
          {
            v21 = NSURL;
            v22 = [a1[4] objectForKeyedSubscript:*MEMORY[0x263F38958]];
            v23 = [v21 URLWithString:v22];

            if (v23)
            {
              v24 = *(NSObject **)DMCLogObjects();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_221CC5000, v24, OS_LOG_TYPE_ERROR, "WebURL is not supported during Return to Service.", buf, 2u);
              }
              v25 = (void (**)(id, void *))a1[6];
              v26 = [a1[5] _webURLNotSupportedError];
              v25[2](v25, v26);
            }
            else
            {
              v27 = NSURL;
              v28 = [a1[4] objectForKeyedSubscript:*MEMORY[0x263F38950]];
              v26 = [v27 URLWithString:v28];

              if (v26)
              {
                v29 = [a1[4] objectForKeyedSubscript:*MEMORY[0x263F53CE0]];
                v30 = certificatesFromDERCertificateDataArray();
                v33[0] = MEMORY[0x263EF8330];
                v33[1] = 3221225472;
                v33[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_12;
                v33[3] = &unk_2645E9940;
                id v34 = a1[6];
                v35 = v7;
                [v4 retrieveCloudConfigurationFromURL:v26 username:0 password:0 anchorCertificates:v30 completionBlock:v33];
              }
              else
              {
                v31 = *(NSObject **)DMCLogObjects();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_221CC5000, v31, OS_LOG_TYPE_ERROR, "Configuration URL is missing.", buf, 2u);
                }
                v32 = (void (**)(id, void *))a1[6];
                v29 = [a1[5] _configurationURLMissingError];
                v32[2](v32, v29);
              }
            }
          }
        }
        else
        {
          id v18 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_221CC5000, v18, OS_LOG_TYPE_ERROR, "No local mdm profile or cloud config, returning...", buf, 2u);
          }
          id v19 = (void (**)(id, void *))a1[6];
          v20 = [a1[5] _cloudConfigMissingError];
          v19[2](v19, v20);
        }
      }
    }
    else
    {
      id v12 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221CC5000, v12, OS_LOG_TYPE_DEFAULT, "Device was unsupervised and now we are changing supervision state. Abort", buf, 2u);
      }
      (*((void (**)(void))a1[6] + 2))();
    }
  }
}

void __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_INFO, "Storing mdm profile %@...", buf, 0xCu);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_5;
  v12[3] = &unk_2645E98F0;
  id v16 = v6;
  id v8 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  id v14 = v9;
  uint64_t v15 = v10;
  id v11 = v6;
  [v8 storeProfileData:v5 completion:v12];
}

void __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v3;
      _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_ERROR, "Failed to store mdm data with error: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(void *)(a1 + 32)) {
      [*(id *)(a1 + 40) cloudConfigurationUIDidCompleteWasApplied:1];
    }
    id v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_INFO, "Installing mdm profile...", buf, 2u);
    }
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    [v6 setObject:*MEMORY[0x263F38C18] forKeyedSubscript:*MEMORY[0x263F53D68]];
    id v7 = [*(id *)(a1 + 48) obliterationShelter];
    id v8 = [v7 wifiProfileData];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x263F53C48];
      uint64_t v10 = [*(id *)(a1 + 48) obliterationShelter];
      id v11 = [v10 wifiProfileData];
      id v12 = [v9 profileWithData:v11 outError:0];

      id v13 = [v12 identifier];

      if (v13)
      {
        id v14 = [v12 identifier];
        uint64_t v19 = v14;
        uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
        [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F53D50]];
      }
    }
    id v16 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_9;
    v17[3] = &unk_2645E9878;
    id v18 = *(id *)(a1 + 56);
    [v16 installStoredProfileDataWithExtraOptions:v6 completion:v17];
  }
}

uint64_t __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5 || !a3)
  {
    id v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve mdm profile data with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_handleORGOEnrollmentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = (void *)[objc_alloc(MEMORY[0x263F389C8]) initWithPresenter:self managedConfigurationHelper:v5];
  [(DMCReturnToServiceController *)self setEnrollmentFlowController:v6];

  int v7 = [(DMCReturnToServiceController *)self enrollmentFlowController];
  id v8 = [MEMORY[0x263F52808] sharedConfiguration];
  uint64_t v9 = [v8 enrollmentServerURL];
  uint64_t v10 = [MEMORY[0x263F52808] sharedConfiguration];
  id v11 = [v10 enrollmentAnchorCertificates];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__DMCReturnToServiceController__handleORGOEnrollmentWithCompletionHandler___block_invoke;
  v13[3] = &unk_2645E9990;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v7 startORGOEnrollmentFlowWithServiceURL:v9 anchorCertificates:v11 restartIfFail:0 completionHandler:v13];
}

void __75__DMCReturnToServiceController__handleORGOEnrollmentWithCompletionHandler___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  id v11 = v7;
  if (a2)
  {
    id v8 = [MEMORY[0x263F53C50] sharedConnection];
    [v8 cloudConfigurationUIDidCompleteWasApplied:1];

    [*(id *)(a1 + 32) _markWiFiProfileAsManagedIfNeeded];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (a3)
    {
      uint64_t v10 = [*(id *)(a1 + 32) _ORGONotSupportedError];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
    else
    {
      (*(void (**)(void, id))(v9 + 16))(*(void *)(a1 + 40), v7);
    }
  }
}

- (void)_markWiFiProfileAsManagedIfNeeded
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = [(DMCReturnToServiceController *)self obliterationShelter];
  id v4 = [v3 wifiProfileData];

  if (v4)
  {
    id v5 = [MEMORY[0x263F53C50] sharedConnection];
    id v6 = [v5 installedMDMProfileIdentifier];
    id v16 = 0;
    id v7 = [MEMORY[0x263F53C48] profileWithData:v4 outError:&v16];
    id v8 = v16;
    uint64_t v9 = [v7 identifier];

    if (v8) {
      goto LABEL_4;
    }
    [v5 removeProfileWithIdentifier:v9];
    uint64_t v10 = [(DMCReturnToServiceController *)self obliterationShelter];
    id v11 = [v10 wifiProfileData];
    uint64_t v19 = *MEMORY[0x263F53DA0];
    v20[0] = v6;
    id v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v15 = 0;
    id v13 = (id)[v5 installProfileData:v11 options:v12 outError:&v15];
    id v8 = v15;

    if (v8)
    {
LABEL_4:
      id v14 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v8;
        _os_log_impl(&dword_221CC5000, v14, OS_LOG_TYPE_ERROR, "Failed to update wifi profile with error: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7
{
  id v7 = a7;
  id v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_221CC5000, v8, OS_LOG_TYPE_ERROR, "Return to Service is not supported with ORGO enrollment + user subscription.", v9, 2u);
  }
  (*((void (**)(id, void, uint64_t, void))v7 + 2))(v7, 0, 1, 0);
}

- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6
{
  id v6 = a6;
  id v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_ERROR, "Return to Service is not supported with ORGO enrollment + user subscription.", v8, 2u);
  }
  (*((void (**)(id, void, uint64_t, void))v6 + 2))(v6, 0, 1, 0);
}

- (id)_webURLNotSupportedError
{
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38AE8];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 16000, v4, 0, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_ORGONotSupportedError
{
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38AE8];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 16003, v4, 0, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_cloudConfigMissingError
{
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38AE8];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 16001, v4, 0, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_configurationURLMissingError
{
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38AE8];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 16002, v4, 0, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (DMCObliterationShelter)obliterationShelter
{
  obliterationShelter = self->_obliterationShelter;
  if (!obliterationShelter)
  {
    id v4 = (DMCObliterationShelter *)objc_opt_new();
    id v5 = self->_obliterationShelter;
    self->_obliterationShelter = v4;

    id v6 = self->_obliterationShelter;
    uint64_t v8 = 0;
    [(DMCObliterationShelter *)v6 retrieveWithError:&v8];
    obliterationShelter = self->_obliterationShelter;
  }
  return obliterationShelter;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (void)setObliterationShelter:(id)a3
{
}

- (DMCEnrollmentFlowController)enrollmentFlowController
{
  return self->_enrollmentFlowController;
}

- (void)setEnrollmentFlowController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentFlowController, 0);
  objc_storeStrong((id *)&self->_obliterationShelter, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end