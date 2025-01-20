@interface FAFamilySettings
- (ACAccount)iTunesAccount;
- (BOOL)isAccountSignedIn;
- (BOOL)isFirstRun;
- (UIViewController)presentingViewController;
- (void)_launchPrefsUsingDaemonWithOptions:(id)a3;
- (void)familySetupPrompterDidFinish:(id)a3;
- (void)launchiCloudFamilySettings;
- (void)launchiCloudFamilySettingsWithOptions:(id)a3;
- (void)setITunesAccount:(id)a3;
- (void)setIsFirstRun:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation FAFamilySettings

- (void)launchiCloudFamilySettings
{
}

- (BOOL)isAccountSignedIn
{
  v2 = [MEMORY[0x1E4F179C8] defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)launchiCloudFamilySettingsWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F179C8] defaultStore];
  v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  if (v6)
  {
    v7 = objc_alloc_init(FAFetchFamilyCircleRequest);
    [(FAFetchFamilyCircleRequest *)v7 setDoNotFetchFromServer:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__FAFamilySettings_launchiCloudFamilySettingsWithOptions___block_invoke;
    v8[3] = &unk_1E6925540;
    v8[4] = self;
    id v9 = v4;
    [(FAFetchFamilyCircleRequest *)v7 startRequestWithCompletionHandler:v8];
  }
  else
  {
    [(FAFamilySettings *)self _launchPrefsUsingDaemonWithOptions:v4];
  }
}

void __58__FAFamilySettings_launchiCloudFamilySettingsWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 members];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [*(id *)(a1 + 32) _launchPrefsUsingDaemonWithOptions:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    id v9 = (void *)getAAUIFamilySetupPrompterClass_softClass;
    uint64_t v23 = getAAUIFamilySetupPrompterClass_softClass;
    if (!getAAUIFamilySetupPrompterClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getAAUIFamilySetupPrompterClass_block_invoke;
      v19[3] = &unk_1E69253D8;
      v19[4] = &v20;
      __getAAUIFamilySetupPrompterClass_block_invoke((uint64_t)v19);
      id v9 = (void *)v21[3];
    }
    v10 = v9;
    _Block_object_dispose(&v20, 8);
    id v11 = [v10 alloc];
    v12 = [*(id *)(a1 + 32) iTunesAccount];
    uint64_t v13 = [v11 initWithiTunesAccount:v12];
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void **)(v14 + 32);
    *(void *)(v14 + 32) = v13;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 32));
    v16 = *(void **)(a1 + 32);
    v17 = (void *)v16[4];
    v18 = [v16 presentingViewController];
    [v17 promptIfEligibleWithPresentingViewController:v18 isFirstRun:0];
  }
}

- (void)_launchPrefsUsingDaemonWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:&__block_literal_global_9];
  [v5 launchICloudFamilySettingsWithOptions:v4];
}

void __55__FAFamilySettings__launchPrefsUsingDaemonWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D252C000, v3, OS_LOG_TYPE_DEFAULT, "FAFamilySettings: Error from service launching family settings - %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)familySetupPrompterDidFinish:(id)a3
{
  retainedSelf = self->_retainedSelf;
  self->_retainedSelf = 0;

  prompter = self->_prompter;
  self->_prompter = 0;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  self->_presentingViewController = (UIViewController *)a3;
}

- (ACAccount)iTunesAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 64, 1);
}

- (void)setITunesAccount:(id)a3
{
}

- (BOOL)isFirstRun
{
  return self->_isFirstRun;
}

- (void)setIsFirstRun:(BOOL)a3
{
  self->_isFirstRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_prompter, 0);
}

@end