@interface DMCEnrollmentFlowManagedConfigurationHelper
+ (id)_createProfileInvalidError;
+ (id)_mdmProfileInfo;
+ (id)organizationNameFromProfile:(id)a3 payload:(id)a4;
- (BOOL)isDeviceConfigured;
- (BOOL)isDeviceMDMEnrolled;
- (BOOL)isDevicePasscodeSet;
- (BOOL)isDeviceSharediPad;
- (BOOL)isDeviceSupervised;
- (BOOL)isMDMProfileLocked;
- (BOOL)isStoredProfileInstalled;
- (BOOL)removeProfileAssociatedWithPersonaID:(id)a3;
- (BOOL)validateESSOConfigurationProfile:(id)a3 error:(id *)a4;
- (DMCBYODEnrollmentFlowUIPresenter)presenter;
- (NSData)installingProfileData;
- (NSString)devicePasscode;
- (id)awaitDeviceConfigurationCompletionHandler;
- (id)detailsFromMDMProfile:(id)a3 error:(id *)a4;
- (id)extensionIDsFromESSOConfigurationProfile:(id)a3;
- (id)getMachineInfoForEnrollmentType:(unint64_t)a3 enrollmentMethod:(unint64_t)a4;
- (id)profileInstallationCompletionHandler;
- (void)_awaitESSOConfigActivationWithExtensionIdentifierEnumerator:(id)a3 completionHandler:(id)a4;
- (void)_awaitESSOConfigActivationWithExtensionIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)_cloudConfigDidChange:(id)a3;
- (void)_handleUserInputRequest:(id)a3;
- (void)awaitDeviceConfiguredWithCompletionHandler:(id)a3;
- (void)blockAppInstallsWithCompletion:(id)a3;
- (void)fetchCloudConfigWithCompletionHandler:(id)a3;
- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7;
- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 isESSO:(BOOL)a7 essoAppITunesStoreID:(id)a8 managedProfileIdentifiers:(id)a9 installationSource:(id)a10 completionHandler:(id)a11;
- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 managedProfileIdentifiers:(id)a7 installationSource:(id)a8 completionHandler:(id)a9;
- (void)manageApplicationWithBundleID:(id)a3 iTunesItemID:(id)a4 organization:(id)a5 personaID:(id)a6 associatedDomains:(id)a7 associatedDomainsEnableDirectDownloads:(id)a8 configuration:(id)a9 completionHandler:(id)a10;
- (void)markCloudConfigurationAsUICompletedWithCompletionHandler:(id)a3;
- (void)markStoredProfileAsInstalled;
- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5;
- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4;
- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5;
- (void)profileConnection:(id)a3 didRequestManagedRestoreWithManagedAppleID:(id)a4 personaID:(id)a5;
- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4;
- (void)profileConnection:(id)a3 didShowUserWarnings:(id)a4;
- (void)profileConnectionDidRequestCurrentPasscode:(id)a3;
- (void)reauthenticationComplete;
- (void)removeApplicationWithBundleID:(id)a3 completionHandler:(id)a4;
- (void)removeProfileWithIdentifier:(id)a3 async:(BOOL)a4;
- (void)requestEnrollmentFlowMonitorWithPersonaID:(id)a3;
- (void)restoreSetAsideCloudConfigAndProfilesWithCompletionHandler:(id)a3;
- (void)setAwaitDeviceConfigurationCompletionHandler:(id)a3;
- (void)setDevicePasscode:(id)a3;
- (void)setInstallingProfileData:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setProfileInstallationCompletionHandler:(id)a3;
- (void)stopEnrollmentFlowMonitor;
- (void)storeCloudConfig:(id)a3 completionHandler:(id)a4;
- (void)unblockAppInstallsWithCompletion:(id)a3;
@end

@implementation DMCEnrollmentFlowManagedConfigurationHelper

- (BOOL)isDevicePasscodeSet
{
  return MKBGetDeviceLockState() != 3;
}

- (BOOL)isDeviceMDMEnrolled
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  v3 = [v2 installedMDMProfileIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isDeviceSupervised
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isSupervised];

  return v3;
}

- (BOOL)isDeviceSharediPad
{
  return [MEMORY[0x263F38BA0] isSharediPad];
}

- (BOOL)isStoredProfileInstalled
{
  v2 = [MEMORY[0x263F52808] sharedConfiguration];
  char v3 = [v2 isStoredProfileInstalled];

  return v3;
}

- (id)getMachineInfoForEnrollmentType:(unint64_t)a3 enrollmentMethod:(unint64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a3 - 1 <= 1)
  {
    v5 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v10 = *MEMORY[0x263F52988];
    v6 = [NSNumber numberWithBool:1];
    v11[0] = v6;
    v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    BOOL v4 = [v5 getMachineInfoWithAdditionalInfo:v7];

LABEL_7:
    goto LABEL_8;
  }
  if (a3 <= 9 && ((1 << a3) & 0x388) != 0) {
    goto LABEL_5;
  }
  if (a4 <= 6)
  {
    if (((1 << a4) & 0x35) != 0)
    {
      v5 = [MEMORY[0x263F53C50] sharedConnection];
      uint64_t v8 = [v5 getReducedMachineInfo];
      goto LABEL_6;
    }
LABEL_5:
    v5 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v8 = [v5 getMachineInfo];
LABEL_6:
    BOOL v4 = (void *)v8;
    goto LABEL_7;
  }
LABEL_8:
  return v4;
}

- (id)detailsFromMDMProfile:(id)a3 error:(id *)a4
{
  v5 = objc_msgSend(MEMORY[0x263F53C48], "profileWithData:outError:", a3);
  if (v5)
  {
    v6 = [v5 payloadsWithClass:objc_opt_class()];
    id v7 = [v6 firstObject];

    if (v7)
    {
      id v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:7];
      v9 = [v5 identifier];
      [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F38A08]];

      uint64_t v10 = [v7 managedAppleID];
      [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F389F8]];

      v11 = [v7 assignedManagedAppleID];
      [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F389E0]];

      v12 = [v7 friendlyName];
      [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F389F0]];

      v13 = +[DMCEnrollmentFlowManagedConfigurationHelper organizationNameFromProfile:v5 payload:v7];
      [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x263F38A00]];

      v14 = [v7 enrollmentMode];
      [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x263F389E8]];

      v15 = [v7 serverCapabilities];
      [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x263F38A18]];

      v16 = [v7 requiredAppIDForMDM];
      [v8 setObject:v16 forKeyedSubscript:*MEMORY[0x263F38A10]];

      v17 = (void *)[v8 copy];
LABEL_4:

LABEL_12:
      goto LABEL_13;
    }
    if (a4)
    {
      v19 = +[DMCEnrollmentFlowManagedConfigurationHelper _createProfileInvalidError];
      id v8 = v19;
      if (v19)
      {
        id v8 = v19;
        v17 = 0;
        *a4 = v8;
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_4;
    }
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  if (a4)
  {
    v18 = +[DMCEnrollmentFlowManagedConfigurationHelper _createProfileInvalidError];
    id v7 = v18;
    if (v18)
    {
      id v7 = v18;
      v17 = 0;
      *a4 = v7;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v17 = 0;
LABEL_13:

  return v17;
}

+ (id)organizationNameFromProfile:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F52808] sharedConfiguration];
  id v8 = [v7 details];

  uint64_t v9 = *MEMORY[0x263F38990];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F38990]];

  if (v10)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v9];
LABEL_8:
    v15 = (void *)v11;
    goto LABEL_9;
  }
  v12 = [v6 organization];

  if (v12)
  {
    v13 = v6;
LABEL_7:
    uint64_t v11 = [v13 organization];
    goto LABEL_8;
  }
  v14 = [v5 organization];

  if (v14)
  {
    v13 = v5;
    goto LABEL_7;
  }
  v15 = [v6 serverURLString];

  if (v15)
  {
    v17 = NSURL;
    v18 = [v6 serverURLString];
    v19 = [v17 URLWithString:v18];

    if (v19)
    {
      v15 = [v19 host];
    }
    else
    {
      v15 = 0;
    }
  }
LABEL_9:

  return v15;
}

- (BOOL)isMDMProfileLocked
{
  v2 = [MEMORY[0x263F52808] sharedConfiguration];
  char v3 = [v2 isMDMUnremovable];

  return v3;
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7
{
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 managedProfileIdentifiers:(id)a7 installationSource:(id)a8 completionHandler:(id)a9
{
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 isESSO:(BOOL)a7 essoAppITunesStoreID:(id)a8 managedProfileIdentifiers:(id)a9 installationSource:(id)a10 completionHandler:(id)a11
{
  BOOL v12 = a7;
  id v37 = a3;
  id v17 = a8;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a6;
  id v22 = a5;
  [(DMCEnrollmentFlowManagedConfigurationHelper *)self setDevicePasscode:a4];
  [(DMCEnrollmentFlowManagedConfigurationHelper *)self setInstallingProfileData:v37];
  [(DMCEnrollmentFlowManagedConfigurationHelper *)self setProfileInstallationCompletionHandler:v18];

  v23 = objc_opt_new();
  [v23 setObject:v22 forKeyedSubscript:*MEMORY[0x263F53DA8]];

  [v23 setObject:v21 forKeyedSubscript:*MEMORY[0x263F53DB0]];
  [v23 setObject:v20 forKeyedSubscript:*MEMORY[0x263F53D50]];

  [v23 setObject:v19 forKeyedSubscript:*MEMORY[0x263F53D68]];
  v24 = [MEMORY[0x263F53C48] profileWithData:v37 outError:0];
  v25 = [v24 payloadsWithClass:objc_opt_class()];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    v27 = [MEMORY[0x263F52808] sharedConfiguration];
    uint64_t v28 = [v27 isMDMUnremovable];

    v29 = [MEMORY[0x263F52808] sharedConfiguration];
    v30 = [v29 details];
    v31 = [v30 objectForKeyedSubscript:*MEMORY[0x263F38948]];
    BOOL v32 = [v31 intValue] == 1;

    v33 = [NSNumber numberWithBool:v28];
    [v23 setObject:v33 forKeyedSubscript:*MEMORY[0x263F53D80]];

    v34 = [NSNumber numberWithBool:v32];
    [v23 setObject:v34 forKeyedSubscript:*MEMORY[0x263F53D88]];
  }
  if (v12)
  {
    [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F53D90]];
    [v23 setObject:v17 forKeyedSubscript:*MEMORY[0x263F53D60]];
  }
  v35 = [MEMORY[0x263F53C50] sharedConnection];
  v36 = (void *)[v23 copy];
  [v35 installProfileData:v37 options:v36 interactionDelegate:self];
}

- (void)removeProfileWithIdentifier:(id)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    id v7 = v6;
    if (v4) {
      [v6 removeProfileAsyncWithIdentifier:v8];
    }
    else {
      [v6 removeProfileWithIdentifier:v8];
    }

    id v5 = v8;
  }
}

- (BOOL)removeProfileAssociatedWithPersonaID:(id)a3
{
  char v3 = (void *)MEMORY[0x263F52810];
  id v4 = a3;
  id v5 = [v3 sharedConfiguration];
  id v6 = [v5 personaID];
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    id v8 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v9 = [MEMORY[0x263F52810] sharedConfiguration];
    uint64_t v10 = [v9 memberQueueManagingProfileIdentifier];
    [v8 removeProfileWithIdentifier:v10];
  }
  return v7;
}

- (BOOL)validateESSOConfigurationProfile:(id)a3 error:(id *)a4
{
  v28[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFFA08];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
  id v8 = [v6 setWithArray:v7];

  uint64_t v9 = [MEMORY[0x263F53C48] profileWithData:v5 outError:a4];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 payloads];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
      objc_msgSend(v10, "payloads", 0, 0);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            if (([v8 containsObject:objc_opt_class()] & 1) == 0)
            {
              if (a4)
              {
                id v20 = +[DMCEnrollmentFlowManagedConfigurationHelper _createProfileInvalidError];
                id v21 = v20;
                if (v20) {
                  *a4 = v20;
                }
              }
              goto LABEL_19;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
          BOOL v18 = 1;
          if (v15) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v18 = 1;
      }
      goto LABEL_22;
    }
  }
  if (a4)
  {
    id v19 = +[DMCEnrollmentFlowManagedConfigurationHelper _createProfileInvalidError];
    id v13 = v19;
    if (v19)
    {
      id v13 = v19;
      BOOL v18 = 0;
      *a4 = v13;
    }
    else
    {
LABEL_19:
      BOOL v18 = 0;
    }
LABEL_22:

    goto LABEL_23;
  }
  BOOL v18 = 0;
LABEL_23:

  return v18;
}

- (id)extensionIDsFromESSOConfigurationProfile:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F53C48] profileWithData:v3 outError:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(v5, "payloadsWithClass:", objc_opt_class(), 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "esso_extensionIdentifier");
        [v4 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

- (void)_awaitESSOConfigActivationWithExtensionIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectEnumerator];
  [(DMCEnrollmentFlowManagedConfigurationHelper *)self _awaitESSOConfigActivationWithExtensionIdentifierEnumerator:v7 completionHandler:v6];
}

- (void)_awaitESSOConfigActivationWithExtensionIdentifierEnumerator:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __125__DMCEnrollmentFlowManagedConfigurationHelper__awaitESSOConfigActivationWithExtensionIdentifierEnumerator_completionHandler___block_invoke;
  block[3] = &unk_2645E8FB0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __125__DMCEnrollmentFlowManagedConfigurationHelper__awaitESSOConfigActivationWithExtensionIdentifierEnumerator_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nextObject];
  id v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x263F25280];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __125__DMCEnrollmentFlowManagedConfigurationHelper__awaitESSOConfigActivationWithExtensionIdentifierEnumerator_completionHandler___block_invoke_2;
    v7[3] = &unk_2645E9528;
    id v8 = v2;
    int8x16_t v6 = *(int8x16_t *)(a1 + 32);
    id v5 = (id)v6.i64[0];
    int8x16_t v9 = vextq_s8(v6, v6, 8uLL);
    id v10 = *(id *)(a1 + 48);
    [v4 isConfigurationActiveForExtensionIdentifier:v8 completion:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __125__DMCEnrollmentFlowManagedConfigurationHelper__awaitESSOConfigActivationWithExtensionIdentifierEnumerator_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *(NSObject **)DMCLogObjects();
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)id v12 = 138543618;
      *(void *)&v12[4] = v6;
      *(_WORD *)&v12[12] = 2114;
      *(void *)&v12[14] = v4;
      id v7 = "ESSO configuration with identifier %{public}@ is not active with error: %{public}@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_221CC5000, v8, v9, v7, v12, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)id v12 = 138543362;
    *(void *)&v12[4] = v11;
    id v7 = "ESSO configuration with identifier %{public}@ is active";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "_awaitESSOConfigActivationWithExtensionIdentifierEnumerator:completionHandler:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(_OWORD *)v12, *(void *)&v12[16], v13);
}

- (void)reauthenticationComplete
{
  id v2 = [MEMORY[0x263F52800] sharedClient];
  [v2 reauthenticationComplete];
}

- (void)requestEnrollmentFlowMonitorWithPersonaID:(id)a3
{
  id v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  [v5 startMonitoringEnrollmentStateWithPersonaID:v4];
}

- (void)stopEnrollmentFlowMonitor
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  [v2 stopMonitoringEnrollmentState];
}

- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  uint32_t v10 = [(DMCEnrollmentFlowManagedConfigurationHelper *)self profileInstallationCompletionHandler];

  if (v10)
  {
    if (v9 && [v9 code] == 4045)
    {
      uint64_t v11 = (void *)MEMORY[0x263F53C48];
      id v12 = [(DMCEnrollmentFlowManagedConfigurationHelper *)self installingProfileData];
      uint64_t v13 = [v11 profileWithData:v12 outError:0];
      id v14 = [v13 identifier];

      id v15 = v14;
      long long v16 = [v18 installedProfileWithIdentifier:v15];

      if (v16)
      {

        id v9 = 0;
      }
      id v8 = v15;
    }
    long long v17 = [(DMCEnrollmentFlowManagedConfigurationHelper *)self profileInstallationCompletionHandler];
    ((void (**)(void, id, void, id))v17)[2](v17, v8, 0, v9);

    [(DMCEnrollmentFlowManagedConfigurationHelper *)self setProfileInstallationCompletionHandler:0];
  }
  [(DMCEnrollmentFlowManagedConfigurationHelper *)self setInstallingProfileData:0];
}

- (void)profileConnectionDidRequestCurrentPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCEnrollmentFlowManagedConfigurationHelper *)self devicePasscode];
  [v4 respondToCurrentPasscodeRequestContinue:1 passcode:v5];
}

- (void)profileConnection:(id)a3 didShowUserWarnings:(id)a4
{
}

- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5
{
}

- (void)profileConnection:(id)a3 didRequestManagedRestoreWithManagedAppleID:(id)a4 personaID:(id)a5
{
}

- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4
{
}

- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __93__DMCEnrollmentFlowManagedConfigurationHelper_profileConnection_didFinishPreflightWithError___block_invoke;
  v7[3] = &unk_2645E92D0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __93__DMCEnrollmentFlowManagedConfigurationHelper_profileConnection_didFinishPreflightWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presenter];
  [v2 informQuestionViewControllerOfPreflightResult:*(void *)(a1 + 40)];
}

+ (id)_mdmProfileInfo
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  id v6 = 0;
  id v3 = (id)[v2 installedConfigurationProfileInfoWithOutMDMProfileInfo:&v6];
  id v4 = v6;

  return v4;
}

- (void)_handleUserInputRequest:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_DEFAULT, "Will ask for user input", buf, 2u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__DMCEnrollmentFlowManagedConfigurationHelper__handleUserInputRequest___block_invoke;
  v7[3] = &unk_2645E92D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __71__DMCEnrollmentFlowManagedConfigurationHelper__handleUserInputRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presenter];
  id v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__DMCEnrollmentFlowManagedConfigurationHelper__handleUserInputRequest___block_invoke_2;
  v4[3] = &unk_2645E9550;
  id v5 = v3;
  [v2 requestUserInputWithRequest:v5 completionHandler:v4];
}

void __71__DMCEnrollmentFlowManagedConfigurationHelper__handleUserInputRequest___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  if ((a3 & 1) != 0 || ![*(id *)(a1 + 32) count])
  {
    id v5 = [MEMORY[0x263F53C50] sharedConnection];
    [v5 cancelUserInputResponses];
  }
  else
  {
    id v5 = [MEMORY[0x263F53C50] sharedConnection];
    [v5 submitUserInputResponses:v6];
  }
}

+ (id)_createProfileInvalidError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15016, v4, 0, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F52800];
  id v4 = a3;
  id v5 = [v3 sharedClient];
  [v5 blockAppInstallsWithCompletion:v4];
}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F52800];
  id v4 = a3;
  id v5 = [v3 sharedClient];
  [v5 unblockAppInstallsWithCompletion:v4];
}

- (void)manageApplicationWithBundleID:(id)a3 iTunesItemID:(id)a4 organization:(id)a5 personaID:(id)a6 associatedDomains:(id)a7 associatedDomainsEnableDirectDownloads:(id)a8 configuration:(id)a9 completionHandler:(id)a10
{
  id v15 = a10;
  long long v16 = (void *)MEMORY[0x263F39D18];
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  long long v23 = [v16 currentUserConnection];
  long long v24 = objc_opt_new();
  [v24 setBundleIdentifier:v22];

  [v24 setOriginator:v21];
  [v24 setPersonaIdentifier:v20];

  [v24 setManagementOptions:1];
  [v24 setInternal:MEMORY[0x263EFFA88]];
  [v24 setAssociatedDomains:v19];

  [v24 setAssociatedDomainsEnableDirectDownloads:v18];
  [v24 setRemovable:MEMORY[0x263EFFA80]];
  [v24 setConfiguration:v17];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __202__DMCEnrollmentFlowManagedConfigurationHelper_manageApplicationWithBundleID_iTunesItemID_organization_personaID_associatedDomains_associatedDomainsEnableDirectDownloads_configuration_completionHandler___block_invoke;
  v26[3] = &unk_2645E9578;
  id v27 = v15;
  id v25 = v15;
  [v23 performRequest:v24 completion:v26];
}

uint64_t __202__DMCEnrollmentFlowManagedConfigurationHelper_manageApplicationWithBundleID_iTunesItemID_organization_personaID_associatedDomains_associatedDomainsEnableDirectDownloads_configuration_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeApplicationWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F39D18] currentUserConnection];
  id v8 = objc_opt_new();
  [v8 setBundleIdentifier:v5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __95__DMCEnrollmentFlowManagedConfigurationHelper_removeApplicationWithBundleID_completionHandler___block_invoke;
  v11[3] = &unk_2645E95A0;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v7 performRequest:v8 completion:v11];
}

void __95__DMCEnrollmentFlowManagedConfigurationHelper_removeApplicationWithBundleID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_ERROR, "Failed to remove application with bundle ID: %{public}@, error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
}

- (void)fetchCloudConfigWithCompletionHandler:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, void))a3;
  id v4 = [MEMORY[0x263F53C50] sharedConnection];
  char v5 = [v4 activationRecordIndicatesCloudConfigurationIsAvailable];
  id v6 = *(NSObject **)DMCLogObjects();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_DEFAULT, "Activation record indicates cloud configuration is available, will fetch...", buf, 2u);
    }
    uint64_t v8 = [v4 cloudConfigurationDetails];
    uint64_t v9 = *(NSObject **)DMCLogObjects();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_DEFAULT, "Cloud Configuration is available already, returning...", buf, 2u);
      }
      v3[2](v3, v8, 0);
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_DEFAULT, "Fetching cloud config from cloud...", buf, 2u);
      }
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __85__DMCEnrollmentFlowManagedConfigurationHelper_fetchCloudConfigWithCompletionHandler___block_invoke;
      v11[3] = &unk_2645E95C8;
      __int16 v12 = v3;
      [v4 retrieveCloudConfigurationDetailsCompletionBlock:v11];
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_DEFAULT, "No cloud configuration according to activation record and obliteration shelter.", buf, 2u);
    }
    v3[2](v3, 0, 0);
  }
}

void __85__DMCEnrollmentFlowManagedConfigurationHelper_fetchCloudConfigWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = *(NSObject **)DMCLogObjects();
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_ERROR, "Failed to retrieve and store cloud configuration with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_DEFAULT, "Cloud Configuration fetched", (uint8_t *)&v9, 2u);
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (void)storeCloudConfig:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedConnection];
  [v8 storeCloudConfigurationDetails:v7 completion:v6];
}

- (void)awaitDeviceConfiguredWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(DMCEnrollmentFlowManagedConfigurationHelper *)self isDeviceConfigured])
  {
    v4[2]();
  }
  else
  {
    [(DMCEnrollmentFlowManagedConfigurationHelper *)self setAwaitDeviceConfigurationCompletionHandler:v4];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__cloudConfigDidChange_ name:*MEMORY[0x263F536D8] object:0];
  }
}

- (BOOL)isDeviceConfigured
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isAwaitingDeviceConfigured] ^ 1;

  return v3;
}

- (void)_cloudConfigDidChange:(id)a3
{
  BOOL v4 = [(DMCEnrollmentFlowManagedConfigurationHelper *)self isDeviceConfigured];
  id v5 = *(NSObject **)DMCLogObjects();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_DEFAULT, "Device is configured!", v10, 2u);
    }
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self];

    id v8 = [(DMCEnrollmentFlowManagedConfigurationHelper *)self awaitDeviceConfigurationCompletionHandler];

    if (v8)
    {
      int v9 = [(DMCEnrollmentFlowManagedConfigurationHelper *)self awaitDeviceConfigurationCompletionHandler];
      v9[2]();

      [(DMCEnrollmentFlowManagedConfigurationHelper *)self setAwaitDeviceConfigurationCompletionHandler:0];
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_DEFAULT, "Cloud config changed but device is not configured.", buf, 2u);
  }
}

- (void)restoreSetAsideCloudConfigAndProfilesWithCompletionHandler:(id)a3
{
  char v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  [v5 restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:v4];
}

- (void)markCloudConfigurationAsUICompletedWithCompletionHandler:(id)a3
{
  char v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  [v5 cloudConfigurationUIDidCompleteWasApplied:1 completionHandler:v4];
}

- (void)markStoredProfileAsInstalled
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  [v2 markStoredProfileAsInstalled];
}

- (DMCBYODEnrollmentFlowUIPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (DMCBYODEnrollmentFlowUIPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (NSData)installingProfileData
{
  return self->_installingProfileData;
}

- (void)setInstallingProfileData:(id)a3
{
}

- (id)profileInstallationCompletionHandler
{
  return self->_profileInstallationCompletionHandler;
}

- (void)setProfileInstallationCompletionHandler:(id)a3
{
}

- (NSString)devicePasscode
{
  return self->_devicePasscode;
}

- (void)setDevicePasscode:(id)a3
{
}

- (id)awaitDeviceConfigurationCompletionHandler
{
  return self->_awaitDeviceConfigurationCompletionHandler;
}

- (void)setAwaitDeviceConfigurationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_awaitDeviceConfigurationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_devicePasscode, 0);
  objc_storeStrong(&self->_profileInstallationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_installingProfileData, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end