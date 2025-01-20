@interface CPApplicationLauncher
+ (id)sharedInstance;
- (BOOL)_acquireAssertionForBundleID:(id)a3;
- (BOOL)_sessionAlreadyAuthorizingOrAuthorizedForPiP:(id)a3;
- (CPApplicationLauncher)init;
- (CPFeatureFlags)featureFlags;
- (NSMutableDictionary)bundleIDToAssertionMap;
- (NSMutableDictionary)sessionIDtoAuthMap;
- (NSMutableDictionary)sessionIDtoCompletionMap;
- (NSString)placementSceneIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_authorizationForActivitySession:(id)a3;
- (id)_authorizationsForBundleID:(id)a3;
- (id)_openApplicationOptionsForActivitySession:(id)a3 options:(int64_t)a4;
- (id)_sessionIDForActivity:(id)a3;
- (id)_sessionIDForAuthorization:(id)a3;
- (void)_authorizePiPForActivity:(id)a3 withCompletion:(id)a4;
- (void)_handleStateTransitionForAuthorization:(id)a3 activitySession:(id)a4 state:(int64_t)a5;
- (void)_insertAuth:(id)a3 completion:(id)a4 forSessionID:(id)a5;
- (void)_insertBKSAssertion:(id)a3 forBundleID:(id)a4;
- (void)_invalidateBKSAssertionForBundleID:(id)a3;
- (void)_invokeAndDequeueCompletionForSessionID:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_launchAndAcquireAssertionIfNecessaryForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)_launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)_launchApplicationForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)_revokeAndRemoveAuthForSessionID:(id)a3;
- (void)_revokeAuthorizations:(id)a3;
- (void)_validatePiPStartedFor:(id)a3 bundleID:(id)a4;
- (void)authorizePiPForActivity:(id)a3 withCompletion:(id)a4;
- (void)launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)revokeBackgroundAuthorizationForBundleID:(id)a3;
- (void)revokeBackgroundAuthorizationForSession:(id)a3;
- (void)setBundleIDToAssertionMap:(id)a3;
- (void)setPlacementSceneIdentifier:(id)a3;
- (void)setSessionIDtoAuthMap:(id)a3;
- (void)setSessionIDtoCompletionMap:(id)a3;
@end

@implementation CPApplicationLauncher

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sLauncher;
  return v2;
}

uint64_t __39__CPApplicationLauncher_sharedInstance__block_invoke()
{
  sharedInstance_sLauncher = objc_alloc_init(CPApplicationLauncher);
  return MEMORY[0x1F41817F8]();
}

- (CPApplicationLauncher)init
{
  v16.receiver = self;
  v16.super_class = (Class)CPApplicationLauncher;
  v2 = [(CPApplicationLauncher *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.copresence.applauncher", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionIDtoAuthMap = v2->_sessionIDtoAuthMap;
    v2->_sessionIDtoAuthMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionIDtoCompletionMap = v2->_sessionIDtoCompletionMap;
    v2->_sessionIDtoCompletionMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bundleIDToAssertionMap = v2->_bundleIDToAssertionMap;
    v2->_bundleIDToAssertionMap = v9;

    v11 = objc_alloc_init(CPFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v11;

    v13 = objc_alloc_init(CPApplicationLauncherSwift);
    newApplicationLauncher = v2->_newApplicationLauncher;
    v2->_newApplicationLauncher = v13;
  }
  return v2;
}

- (NSString)placementSceneIdentifier
{
  dispatch_queue_t v3 = [(CPApplicationLauncher *)self featureFlags];
  int v4 = [v3 newApplicationLauncherEnabled];

  if (v4)
  {
    v5 = [(CPApplicationLauncherSwift *)self->_newApplicationLauncher placementSceneIdentifier];
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setPlacementSceneIdentifier:(id)a3
{
  id v6 = a3;
  int v4 = [(CPApplicationLauncher *)self featureFlags];
  int v5 = [v4 newApplicationLauncherEnabled];

  if (v5) {
    [(CPApplicationLauncherSwift *)self->_newApplicationLauncher setPlacementSceneIdentifier:v6];
  }
}

- (void)launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(CPApplicationLauncher *)self featureFlags];
  int v11 = [v10 newApplicationLauncherEnabled];

  if (v11)
  {
    [(CPApplicationLauncherSwift *)self->_newApplicationLauncher launchAppForActivitySession:v8 options:a4 completion:v9];
  }
  else
  {
    v12 = [(CPApplicationLauncher *)self workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__CPApplicationLauncher_launchAppForActivitySession_options_completion___block_invoke;
    v13[3] = &unk_1E5FF1858;
    v13[4] = self;
    id v14 = v8;
    int64_t v16 = a4;
    id v15 = v9;
    dispatch_async(v12, v13);
  }
}

uint64_t __72__CPApplicationLauncher_launchAppForActivitySession_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchAppForActivitySession:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)revokeBackgroundAuthorizationForBundleID:(id)a3
{
  id v4 = a3;
  int v5 = [(CPApplicationLauncher *)self featureFlags];
  int v6 = [v5 newApplicationLauncherEnabled];

  if (v6)
  {
    [(CPApplicationLauncherSwift *)self->_newApplicationLauncher revokeBackgroundAuthorizationForBundleID:v4];
  }
  else
  {
    v7 = [(CPApplicationLauncher *)self workQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__CPApplicationLauncher_revokeBackgroundAuthorizationForBundleID___block_invoke;
    v8[3] = &unk_1E5FF1880;
    id v9 = v4;
    v10 = self;
    dispatch_async(v7, v8);
  }
}

void __66__CPApplicationLauncher_revokeBackgroundAuthorizationForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) length];
  dispatch_queue_t v3 = CPDefaultLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315394;
      id v9 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForBundleID:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1B0DF7000, v4, OS_LOG_TYPE_INFO, "%s Request to remove pip authorizations for %@", (uint8_t *)&v8, 0x16u);
    }

    id v4 = [*(id *)(a1 + 40) _authorizationsForBundleID:*(void *)(a1 + 32)];
    if ([v4 count])
    {
      [*(id *)(a1 + 40) _revokeAuthorizations:v4];
    }
    else
    {
      int v6 = CPDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 136315394;
        id v9 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForBundleID:]_block_invoke";
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1B0DF7000, v6, OS_LOG_TYPE_INFO, "%s [PiP] No existing background pip authorizations to remove for %@", (uint8_t *)&v8, 0x16u);
      }
    }
    [*(id *)(a1 + 40) _invalidateBKSAssertionForBundleID:*(void *)(a1 + 32)];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __66__CPApplicationLauncher_revokeBackgroundAuthorizationForBundleID___block_invoke_cold_1(v4);
  }
}

- (void)revokeBackgroundAuthorizationForSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPApplicationLauncher *)self featureFlags];
  int v6 = [v5 newApplicationLauncherEnabled];

  if (v6)
  {
    [(CPApplicationLauncherSwift *)self->_newApplicationLauncher revokeBackgroundAuthorizationForSession:v4];
  }
  else
  {
    uint64_t v7 = [(CPApplicationLauncher *)self workQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__CPApplicationLauncher_revokeBackgroundAuthorizationForSession___block_invoke;
    v8[3] = &unk_1E5FF1880;
    id v9 = v4;
    __int16 v10 = self;
    dispatch_async(v7, v8);
  }
}

void __65__CPApplicationLauncher_revokeBackgroundAuthorizationForSession___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CPDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForSession:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1B0DF7000, v2, OS_LOG_TYPE_INFO, "%s Request to remove pip authorizations for %@", buf, 0x16u);
  }

  uint64_t v4 = [*(id *)(a1 + 40) _authorizationForActivitySession:*(void *)(a1 + 32)];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    int v6 = *(void **)(a1 + 40);
    uint64_t v12 = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [v6 _revokeAuthorizations:v7];
  }
  else
  {
    uint64_t v7 = CPDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v14 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForSession:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1B0DF7000, v7, OS_LOG_TYPE_INFO, "%s No pip authorizations found for %@", buf, 0x16u);
    }
  }

  id v9 = *(void **)(a1 + 40);
  __int16 v10 = [*(id *)(a1 + 32) activity];
  uint64_t v11 = [v10 bundleIdentifier];
  [v9 _invalidateBKSAssertionForBundleID:v11];
}

- (void)_launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if ((a4 & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v11 = [v8 activity];
  uint64_t v12 = [v11 metadata];
  v13 = [v12 context];
  id v14 = [v13 typedIdentifier];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4FADEA0]];

  if (v15)
  {
    uint64_t v16 = [(CPApplicationLauncher *)self _sessionIDForActivity:v8];
    id v17 = objc_alloc(MEMORY[0x1E4F88560]);
    v18 = [v8 activity];
    v19 = [v18 bundleIdentifier];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __73__CPApplicationLauncher__launchAppForActivitySession_options_completion___block_invoke;
    v24 = &unk_1E5FF18D0;
    v25 = self;
    id v26 = v8;
    v20 = (void *)[v17 initWithActivitySessionIdentifier:v16 appBundleIdentifier:v19 stateTransitionHandler:&v21];

    -[CPApplicationLauncher _insertAuth:completion:forSessionID:](self, "_insertAuth:completion:forSessionID:", v20, v9, v16, v21, v22, v23, v24, v25);
  }
  else
  {
LABEL_4:
    [(CPApplicationLauncher *)self _launchAndAcquireAssertionIfNecessaryForActivitySession:v8 options:a4 completion:v9];
  }
}

void __73__CPApplicationLauncher__launchAppForActivitySession_options_completion___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = CPDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3 > 5) {
      uint64_t v7 = @"Unknown state";
    }
    else {
      uint64_t v7 = off_1E5FF19E0[a3];
    }
    id v8 = [v5 activitySessionIdentifier];
    *(_DWORD *)buf = 136315650;
    id v17 = "-[CPApplicationLauncher _launchAppForActivitySession:options:completion:]_block_invoke";
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1B0DF7000, v6, OS_LOG_TYPE_INFO, "%s Got PGBackgroundPIPAuthorization authorization transitioned to state %@ for session id %@", buf, 0x20u);
  }
  id v9 = [*(id *)(a1 + 32) workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CPApplicationLauncher__launchAppForActivitySession_options_completion___block_invoke_63;
  v12[3] = &unk_1E5FF18A8;
  __int16 v10 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v10;
  unint64_t v15 = a3;
  id v11 = v5;
  dispatch_async(v9, v12);
}

uint64_t __73__CPApplicationLauncher__launchAppForActivitySession_options_completion___block_invoke_63(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStateTransitionForAuthorization:*(void *)(a1 + 40) activitySession:*(void *)(a1 + 48) state:*(void *)(a1 + 56)];
}

- (void)_launchApplicationForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  __int16 v10 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [v9 activity];
  uint64_t v12 = [v11 representativeBundleIdentifier];

  id v13 = [(CPApplicationLauncher *)self _openApplicationOptionsForActivitySession:v9 options:a4];

  id v14 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke;
  v17[3] = &unk_1E5FF1920;
  v17[4] = self;
  id v18 = v12;
  id v19 = v8;
  id v15 = v8;
  id v16 = v12;
  [v14 openApplication:v16 withOptions:v13 completion:v17];
}

void __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke_2;
  v11[3] = &unk_1E5FF18F8;
  id v12 = v5;
  id v13 = a1[5];
  id v8 = a1[6];
  id v14 = v6;
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = CPDefaultLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = a1[5];
      int v8 = 136315394;
      id v9 = "-[CPApplicationLauncher _launchApplicationForActivitySession:options:completion:]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1B0DF7000, v4, OS_LOG_TYPE_INFO, "%s Successfully launched application with bundle identifier %@", (uint8_t *)&v8, 0x16u);
    }

    id v6 = *(uint64_t (**)(void))(a1[7] + 16);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke_2_cold_1((uint64_t)a1, v4);
    }

    id v6 = *(uint64_t (**)(void))(a1[7] + 16);
  }
  return v6();
}

- (id)_openApplicationOptionsForActivitySession:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v6 = v5;
  if (v4)
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F625F8]];
  }
  else
  {
    uint64_t v7 = TUUnlockDeviceWithPromptFrontBoardOptionsDictionary();
    [v6 addEntriesFromDictionary:v7];
  }
  int v8 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v6];

  return v8;
}

- (void)_launchAndAcquireAssertionIfNecessaryForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__CPApplicationLauncher__launchAndAcquireAssertionIfNecessaryForActivitySession_options_completion___block_invoke;
  v13[3] = &unk_1E5FF1948;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  [(CPApplicationLauncher *)self _launchApplicationForActivitySession:v12 options:a4 completion:v13];
}

uint64_t __100__CPApplicationLauncher__launchAndAcquireAssertionIfNecessaryForActivitySession_options_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if ((*(unsigned char *)(a1 + 56) & 1) == 0) {
      goto LABEL_4;
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "activity", v5);
    id v8 = [v7 bundleIdentifier];
    LOBYTE(v6) = [v6 _acquireAssertionForBundleID:v8];

    if ((v6 & 1) == 0)
    {
      uint64_t v12 = *(void *)(a1 + 48);
      if (!v12) {
        goto LABEL_11;
      }
      __int16 v10 = *(void (**)(void))(v12 + 16);
    }
    else
    {
LABEL_4:
      uint64_t v9 = *(void *)(a1 + 48);
      if (!v9) {
        goto LABEL_11;
      }
      __int16 v10 = *(void (**)(void))(v9 + 16);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (!v11) {
      goto LABEL_11;
    }
    __int16 v10 = *(void (**)(void))(v11 + 16);
  }
  v10();
LABEL_11:
  return MEMORY[0x1F4181820]();
}

- (id)_sessionIDForActivity:(id)a3
{
  uint64_t v3 = [a3 UUID];
  char v4 = [v3 UUIDString];

  return v4;
}

- (id)_sessionIDForAuthorization:(id)a3
{
  return (id)[a3 activitySessionIdentifier];
}

- (void)_invokeAndDequeueCompletionForSessionID:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [(CPApplicationLauncher *)self sessionIDtoCompletionMap];
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];

  if (v12)
  {
    id v13 = CPDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315650;
      int64_t v16 = "-[CPApplicationLauncher _invokeAndDequeueCompletionForSessionID:success:error:]";
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1B0DF7000, v13, OS_LOG_TYPE_INFO, "%s Invoking completion for %@ error %@", (uint8_t *)&v15, 0x20u);
    }

    ((void (**)(void, BOOL, id))v12)[2](v12, v6, v9);
    id v14 = [(CPApplicationLauncher *)self sessionIDtoCompletionMap];
    [v14 removeObjectForKey:v8];
  }
}

- (void)_insertBKSAssertion:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v6 && [v7 length])
  {
    id v9 = [(CPApplicationLauncher *)self bundleIDToAssertionMap];
    [v9 setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    id v9 = CPDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CPApplicationLauncher _insertBKSAssertion:forBundleID:]();
    }
  }
}

- (void)_invalidateBKSAssertionForBundleID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 length])
  {
    id v6 = [(CPApplicationLauncher *)self bundleIDToAssertionMap];
    id v7 = [v6 objectForKeyedSubscript:v4];

    id v8 = CPDefaultLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        int v10 = 136315394;
        uint64_t v11 = "-[CPApplicationLauncher _invalidateBKSAssertionForBundleID:]";
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_1B0DF7000, v8, OS_LOG_TYPE_INFO, "%s Removing process assertion for %@", (uint8_t *)&v10, 0x16u);
      }

      [v7 invalidate];
      id v8 = [(CPApplicationLauncher *)self bundleIDToAssertionMap];
      [v8 removeObjectForKey:v4];
    }
    else if (v9)
    {
      int v10 = 136315394;
      uint64_t v11 = "-[CPApplicationLauncher _invalidateBKSAssertionForBundleID:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1B0DF7000, v8, OS_LOG_TYPE_INFO, "%s No existing process assertion for %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    id v7 = CPDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CPApplicationLauncher _invalidateBKSAssertionForBundleID:](v7);
    }
  }
}

- (BOOL)_acquireAssertionForBundleID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CPProcessAssertion processAssertionWithBundleIdentifier:v4];
  int v7 = [v6 acquire];
  if (v7)
  {
    [(CPApplicationLauncher *)self _insertBKSAssertion:v6 forBundleID:v4];
    id v8 = CPDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[CPApplicationLauncher _acquireAssertionForBundleID:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1B0DF7000, v8, OS_LOG_TYPE_INFO, "%s Acquired assertion for %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    id v8 = CPDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CPApplicationLauncher _acquireAssertionForBundleID:]();
    }
  }

  return v7;
}

- (void)_validatePiPStartedFor:(id)a3 bundleID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
  int v10 = [v9 objectForKeyedSubscript:v6];

  uint64_t v11 = [v10 state];
  __int16 v12 = CPDefaultLog();
  id v13 = v12;
  if (v11 == 3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      int v15 = "-[CPApplicationLauncher _validatePiPStartedFor:bundleID:]";
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1B0DF7000, v13, OS_LOG_TYPE_INFO, "%s [PiP] %@ started pip successfully", (uint8_t *)&v14, 0x16u);
    }

    [(CPApplicationLauncher *)self _invokeAndDequeueCompletionForSessionID:v6 success:1 error:0];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CPApplicationLauncher _validatePiPStartedFor:bundleID:]();
    }

    [(CPApplicationLauncher *)self _invalidateBKSAssertionForBundleID:v7];
    [(CPApplicationLauncher *)self _revokeAndRemoveAuthForSessionID:v6];
  }
}

- (void)_handleStateTransitionForAuthorization:(id)a3 activitySession:(id)a4 state:(int64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v10);

  switch(a5)
  {
    case 0:
    case 1:
      break;
    case 2:
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __86__CPApplicationLauncher__handleStateTransitionForAuthorization_activitySession_state___block_invoke;
      v14[3] = &unk_1E5FF1970;
      v14[4] = self;
      id v15 = v8;
      [(CPApplicationLauncher *)self _launchAndAcquireAssertionIfNecessaryForActivitySession:v9 options:1 completion:v14];

      break;
    case 3:
      uint64_t v11 = [v8 activitySessionIdentifier];
      [(CPApplicationLauncher *)self _invokeAndDequeueCompletionForSessionID:v11 success:1 error:0];
      goto LABEL_8;
    case 4:
    case 5:
      uint64_t v11 = [v8 activitySessionIdentifier];
      [(CPApplicationLauncher *)self _revokeAndRemoveAuthForSessionID:v11];
LABEL_8:

      break;
    default:
      __int16 v12 = CPDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [NSNumber numberWithInteger:a5];
        *(_DWORD *)buf = 136315650;
        id v17 = "-[CPApplicationLauncher _handleStateTransitionForAuthorization:activitySession:state:]";
        __int16 v18 = 2112;
        id v19 = v8;
        __int16 v20 = 2112;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1B0DF7000, v12, OS_LOG_TYPE_INFO, "%s [PiP] Got unexpected auth state %@ for authorization %@", buf, 0x20u);
      }
      break;
  }
}

void __86__CPApplicationLauncher__handleStateTransitionForAuthorization_activitySession_state___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    id v4 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__CPApplicationLauncher__handleStateTransitionForAuthorization_activitySession_state___block_invoke_2;
    block[3] = &unk_1E5FF1880;
    id v5 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v10 = v5;
    dispatch_after(v3, v4, block);
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) activitySessionIdentifier];
    id v7 = +[CPError errorWithCode:22];
    [v6 _invokeAndDequeueCompletionForSessionID:v8 success:0 error:v7];
  }
}

void __86__CPApplicationLauncher__handleStateTransitionForAuthorization_activitySession_state___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) activitySessionIdentifier];
  dispatch_time_t v3 = [*(id *)(a1 + 40) appBundleIdentifier];
  [v2 _validatePiPStartedFor:v4 bundleID:v3];
}

- (void)_revokeAndRemoveAuthForSessionID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    id v8 = CPDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      __int16 v12 = "-[CPApplicationLauncher _revokeAndRemoveAuthForSessionID:]";
      __int16 v13 = 2112;
      int v14 = v7;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1B0DF7000, v8, OS_LOG_TYPE_INFO, "%s [PiP] Revoking and removing auth %@ sessionID %@", (uint8_t *)&v11, 0x20u);
    }

    [v7 revoke];
    id v9 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
    [v9 removeObjectForKey:v4];
  }
  id v10 = +[CPError errorWithCode:23];
  [(CPApplicationLauncher *)self _invokeAndDequeueCompletionForSessionID:v4 success:0 error:v10];
}

- (void)_insertAuth:(id)a3 completion:(id)a4 forSessionID:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  int v11 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v11);

  __int16 v12 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
  __int16 v13 = [v12 objectForKeyedSubscript:v9];

  if (v13)
  {
    int v14 = CPDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315650;
      id v19 = "-[CPApplicationLauncher _insertAuth:completion:forSessionID:]";
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_1B0DF7000, v14, OS_LOG_TYPE_INFO, "%s [PiP] Revoking and removing auth %@ sessionID %@", (uint8_t *)&v18, 0x20u);
    }

    [v13 revoke];
  }
  __int16 v15 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
  [v15 setObject:v10 forKeyedSubscript:v9];

  if (v8)
  {
    id v16 = _Block_copy(v8);
    uint64_t v17 = [(CPApplicationLauncher *)self sessionIDtoCompletionMap];
    [v17 setObject:v16 forKeyedSubscript:v9];
  }
}

- (BOOL)_sessionAlreadyAuthorizingOrAuthorizedForPiP:(id)a3
{
  id v4 = a3;
  id v5 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7) {
    BOOL v8 = (unint64_t)([v7 state] - 1) < 3;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_authorizePiPForActivity:(id)a3 withCompletion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, BOOL, void))a4;
  BOOL v8 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CPApplicationLauncher *)self _sessionIDForActivity:v6];
  if ([(CPApplicationLauncher *)self _sessionAlreadyAuthorizingOrAuthorizedForPiP:v9])
  {
    v7[2](v7, v9 != 0, 0);
  }
  else
  {
    id v10 = [v6 activity];
    int v11 = [v10 metadata];
    __int16 v12 = [v11 context];
    __int16 v13 = [v12 typedIdentifier];
    int v14 = [v13 isEqualToString:@"CPGroupActivityWatchTogetherContext"];

    if (v14)
    {
      __int16 v15 = CPDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[CPApplicationLauncher _authorizePiPForActivity:withCompletion:]";
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl(&dword_1B0DF7000, v15, OS_LOG_TYPE_INFO, "%s [PiP] Requesting PiP auth for activity session %@", buf, 0x16u);
      }

      id v16 = objc_alloc(MEMORY[0x1E4F88560]);
      uint64_t v17 = [v6 activity];
      int v18 = [v17 bundleIdentifier];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __65__CPApplicationLauncher__authorizePiPForActivity_withCompletion___block_invoke;
      v25 = &unk_1E5FF18D0;
      id v26 = self;
      id v19 = v9;
      id v27 = v19;
      __int16 v20 = (void *)[v16 initWithActivitySessionIdentifier:v19 appBundleIdentifier:v18 stateTransitionHandler:&v22];

      -[CPApplicationLauncher _insertAuth:completion:forSessionID:](self, "_insertAuth:completion:forSessionID:", v20, v7, v19, v22, v23, v24, v25, v26);
    }
    else
    {
      uint64_t v21 = +[CPError errorWithCode:23];
      ((void (**)(id, BOOL, void *))v7)[2](v7, 0, v21);
    }
  }
}

void __65__CPApplicationLauncher__authorizePiPForActivity_withCompletion___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = CPDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3 > 5) {
      id v7 = @"Unknown state";
    }
    else {
      id v7 = off_1E5FF19E0[a3];
    }
    BOOL v8 = [v5 activitySessionIdentifier];
    *(_DWORD *)buf = 136315650;
    id v16 = "-[CPApplicationLauncher _authorizePiPForActivity:withCompletion:]_block_invoke";
    __int16 v17 = 2112;
    int v18 = v7;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    _os_log_impl(&dword_1B0DF7000, v6, OS_LOG_TYPE_INFO, "%s [PiP] PGBackgroundPIPAuthorization authorization transitioned to state %@ for sessionID %@", buf, 0x20u);
  }
  id v9 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CPApplicationLauncher__authorizePiPForActivity_withCompletion___block_invoke_74;
  block[3] = &unk_1E5FF1998;
  uint64_t v10 = *(void *)(a1 + 32);
  int v11 = *(void **)(a1 + 40);
  unint64_t v14 = a3;
  block[4] = v10;
  id v13 = v11;
  dispatch_async(v9, block);
}

void __65__CPApplicationLauncher__authorizePiPForActivity_withCompletion___block_invoke_74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ((unint64_t)(v2 - 4) >= 2)
  {
    if (v2 == 2)
    {
      dispatch_time_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      [v3 _invokeAndDequeueCompletionForSessionID:v4 success:1 error:0];
    }
  }
  else
  {
    id v5 = +[CPError errorWithCode:23];
    [*(id *)(a1 + 32) _invokeAndDequeueCompletionForSessionID:*(void *)(a1 + 40) success:0 error:v5];
  }
}

- (void)authorizePiPForActivity:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CPApplicationLauncher *)self featureFlags];
  int v9 = [v8 newApplicationLauncherEnabled];

  if (v9)
  {
    [(CPApplicationLauncherSwift *)self->_newApplicationLauncher authorizePiPForActivitySession:v6 completion:v7];
  }
  else
  {
    uint64_t v10 = [(CPApplicationLauncher *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__CPApplicationLauncher_authorizePiPForActivity_withCompletion___block_invoke;
    block[3] = &unk_1E5FF19C0;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v10, block);
  }
}

uint64_t __64__CPApplicationLauncher_authorizePiPForActivity_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authorizePiPForActivity:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (id)_authorizationsForBundleID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CPApplicationLauncher *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
  BOOL v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v14 = [v13 appBundleIdentifier];
        int v15 = [v14 isEqualToString:v4];

        if (v15) {
          [v6 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = (void *)[v6 copy];
  return v16;
}

- (id)_authorizationForActivitySession:(id)a3
{
  id v4 = [(CPApplicationLauncher *)self _sessionIDForActivity:a3];
  if (v4)
  {
    id v5 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_revokeAuthorizations:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = CPDefaultLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = [v10 activitySessionIdentifier];
            *(_DWORD *)buf = 136315650;
            long long v20 = "-[CPApplicationLauncher _revokeAuthorizations:]";
            __int16 v21 = 2112;
            uint64_t v22 = v10;
            __int16 v23 = 2112;
            uint64_t v24 = v12;
            _os_log_impl(&dword_1B0DF7000, v11, OS_LOG_TYPE_INFO, "%s [PiP] Revoking and removing auth %@ sessionID %@", buf, 0x20u);
          }
          [v10 revoke];
          id v13 = [(CPApplicationLauncher *)self sessionIDtoAuthMap];
          unint64_t v14 = [(CPApplicationLauncher *)self _sessionIDForAuthorization:v10];
          [v13 removeObjectForKey:v14];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
      }
      while (v7);
    }
  }
}

- (NSMutableDictionary)sessionIDtoAuthMap
{
  return self->_sessionIDtoAuthMap;
}

- (void)setSessionIDtoAuthMap:(id)a3
{
}

- (NSMutableDictionary)sessionIDtoCompletionMap
{
  return self->_sessionIDtoCompletionMap;
}

- (void)setSessionIDtoCompletionMap:(id)a3
{
}

- (NSMutableDictionary)bundleIDToAssertionMap
{
  return self->_bundleIDToAssertionMap;
}

- (void)setBundleIDToAssertionMap:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (CPFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_bundleIDToAssertionMap, 0);
  objc_storeStrong((id *)&self->_sessionIDtoCompletionMap, 0);
  objc_storeStrong((id *)&self->_sessionIDtoAuthMap, 0);
  objc_storeStrong((id *)&self->_newApplicationLauncher, 0);
}

void __66__CPApplicationLauncher_revokeBackgroundAuthorizationForBundleID___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForBundleID:]_block_invoke";
  _os_log_error_impl(&dword_1B0DF7000, log, OS_LOG_TYPE_ERROR, "%s Invalid input trying to revoke app background pip authorization", (uint8_t *)&v1, 0xCu);
}

void __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 136315650;
  id v5 = "-[CPApplicationLauncher _launchApplicationForActivitySession:options:completion:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_1B0DF7000, a2, OS_LOG_TYPE_ERROR, "%s Attempt to open application with bundle identifier %@ failed with error %@", (uint8_t *)&v4, 0x20u);
}

- (void)_insertBKSAssertion:forBundleID:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1B0DF7000, v2, OS_LOG_TYPE_ERROR, "%s Error inserting assertion %@ for bundleID %@", (uint8_t *)v3, 0x20u);
}

- (void)_invalidateBKSAssertionForBundleID:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  os_log_t v2 = "-[CPApplicationLauncher _invalidateBKSAssertionForBundleID:]";
  _os_log_error_impl(&dword_1B0DF7000, log, OS_LOG_TYPE_ERROR, "%s Invalid bundle id passed into to remove BKS assertion", (uint8_t *)&v1, 0xCu);
}

- (void)_acquireAssertionForBundleID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B0DF7000, v0, OS_LOG_TYPE_ERROR, "%s Failed to acquire assertion for %@", (uint8_t *)v1, 0x16u);
}

- (void)_validatePiPStartedFor:bundleID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B0DF7000, v0, OS_LOG_TYPE_ERROR, "%s [PiP] %@ failed to start pip", (uint8_t *)v1, 0x16u);
}

@end