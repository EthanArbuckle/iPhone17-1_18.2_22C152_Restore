@interface GKPlayerCredentialController
+ (id)accessQueue;
+ (id)sharedController;
+ (void)migrateOldAccountInformation;
- (ACAccountStore)store;
- (BOOL)lastSaveFailed;
- (GKPlayerCredentialController)init;
- (GKPlayerCredentialController)initWithStore:(id)a3 notificationCenter:(id)a4;
- (GKSignInVisibilityManager)signInVisibilityManager;
- (GKThreadsafeDictionary)allCredentialsCache;
- (GKThreadsafeDictionary)primaryCredentialCache;
- (NSDate)lastRenewalAttempt;
- (NSString)gameBundleId;
- (id)_transactAndWait:(id)a3;
- (id)accessQueue;
- (id)allCredentialsForEnvironment:(int64_t)a3;
- (id)credentialForPlayer:(id)a3 environment:(int64_t)a4;
- (id)credentialForPlayerID:(id)a3 environment:(int64_t)a4;
- (id)credentialForUsername:(id)a3 environment:(int64_t)a4;
- (id)primaryCredentialForEnvironment:(int64_t)a3;
- (id)primaryCredentialForEnvironment:(int64_t)a3 accountStore:(id)a4;
- (id)suggestedUsername;
- (void)_transact:(id)a3 complete:(id)a4;
- (void)accountStoreDidChange:(id)a3;
- (void)accountStoreEmailDidChange:(id)a3;
- (void)getAltDSIDFromIDMSForCredential:(id)a3 completionHandler:(id)a4;
- (void)invalidateCredentialCaches;
- (void)removeAllCredentialsForEnvironment:(int64_t)a3 completionHandler:(id)a4;
- (void)removeCredential:(id)a3 completionHandler:(id)a4;
- (void)renewCredentialForUsername:(id)a3 ttl:(double)a4 completionHandler:(id)a5;
- (void)replaceCredential:(id)a3 withCredential:(id)a4 completionHandler:(id)a5;
- (void)setAllCredentialsCache:(id)a3;
- (void)setContactAssociationID:(id)a3 contactIntegrationConsent:(int)a4 serviceLastUpdateTimestamp:(id)a5 forEnvironment:(int64_t)a6 forcefully:(BOOL)a7 completionHandler:(id)a8;
- (void)setCredential:(id)a3 completionHandler:(id)a4;
- (void)setGameBundleId:(id)a3;
- (void)setLastRenewalAttempt:(id)a3;
- (void)setLastSaveFailed:(BOOL)a3;
- (void)setPrimaryCredential:(id)a3 completionHandler:(id)a4;
- (void)setPrimaryCredentialCache:(id)a3;
- (void)setSignInVisibilityManager:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation GKPlayerCredentialController

void __49__GKPlayerCredentialController__transactAndWait___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) accessQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__GKPlayerCredentialController__transactAndWait___block_invoke_2;
  v9[3] = &unk_1E646DEB8;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  id v11 = v5;
  v9[4] = v6;
  id v10 = v7;
  id v12 = v3;
  id v8 = v3;
  dispatch_sync(v4, v9);
}

- (id)accessQueue
{
  v2 = objc_opt_class();

  return (id)[v2 accessQueue];
}

+ (id)accessQueue
{
  if (accessQueue_onceToken != -1) {
    dispatch_once(&accessQueue_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)accessQueue_queue;

  return v2;
}

void __49__GKPlayerCredentialController__transactAndWait___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__GKPlayerCredentialController__transactAndWait___block_invoke_3;
  v4[3] = &unk_1E646DE90;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v4);
}

void __64__GKPlayerCredentialController_primaryCredentialForEnvironment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = [v4 primaryCredentialForEnvironment:v5 accountStore:a2];
  v6[2](v6, v7);
}

- (id)primaryCredentialForEnvironment:(int64_t)a3 accountStore:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithInteger:a3];
  id v8 = [(GKPlayerCredentialController *)self primaryCredentialCache];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    v9 = [v6 _gkPrimaryCredentialForEnvironment:a3];
    if (v9)
    {
      id v11 = [(GKPlayerCredentialController *)self primaryCredentialCache];
      [v11 setObject:v9 forKeyedSubscript:v7];

      if (!os_log_GKGeneral) {
        id v12 = GKOSLoggers();
      }
      v13 = os_log_GKDaemon;
      if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        v15 = "-[GKPlayerCredentialController primaryCredentialForEnvironment:accountStore:]";
        __int16 v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "%s - cached primary credential: %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }

  return v9;
}

- (id)_transactAndWait:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayerCredentialController.m", 129, "-[GKPlayerCredentialController _transactAndWait:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__GKPlayerCredentialController__transactAndWait___block_invoke;
  v11[3] = &unk_1E646DEE0;
  id v12 = v6;
  id v13 = v4;
  v11[4] = self;
  id v7 = v6;
  id v8 = v4;
  [v7 perform:v11];
  [v7 wait];
  v9 = [v7 objectForKeyedSubscript:@"object"];

  return v9;
}

uint64_t __49__GKPlayerCredentialController__transactAndWait___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:@"object"];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)primaryCredentialForEnvironment:(int64_t)a3
{
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v6 = [(GKPlayerCredentialController *)self primaryCredentialCache];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__GKPlayerCredentialController_primaryCredentialForEnvironment___block_invoke;
    v9[3] = &unk_1E646E0E8;
    v9[4] = self;
    void v9[5] = a3;
    id v7 = [(GKPlayerCredentialController *)self _transactAndWait:v9];
  }

  return v7;
}

- (GKThreadsafeDictionary)primaryCredentialCache
{
  return self->_primaryCredentialCache;
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_25);
  }
  uint64_t v2 = (void *)sharedController_controller;

  return v2;
}

- (GKPlayerCredentialController)init
{
  uint64_t v3 = [MEMORY[0x1E4F179C8] defaultStore];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = [(GKPlayerCredentialController *)self initWithStore:v3 notificationCenter:v4];

  return v5;
}

- (GKPlayerCredentialController)initWithStore:(id)a3 notificationCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GKPlayerCredentialController;
  v9 = [(GKPlayerCredentialController *)&v15 init];
  if (v9)
  {
    id v10 = [[GKThreadsafeDictionary alloc] initWithName:@"primaryCredentialCache"];
    primaryCredentialCache = v9->_primaryCredentialCache;
    v9->_primaryCredentialCache = v10;

    id v12 = [[GKThreadsafeDictionary alloc] initWithName:@"allCredentialsCache"];
    allCredentialsCache = v9->_allCredentialsCache;
    v9->_allCredentialsCache = v12;

    objc_storeStrong((id *)&v9->_store, a3);
    [v8 addObserver:v9 selector:sel_accountStoreDidChange_ name:*MEMORY[0x1E4F17728] object:v9->_store];
    [v8 addObserver:v9 selector:sel_accountStoreEmailDidChange_ name:*MEMORY[0x1E4F4ED78] object:v9->_store];
  }

  return v9;
}

uint64_t __43__GKPlayerCredentialController_accessQueue__block_invoke()
{
  accessQueue_queue = (uint64_t)dispatch_queue_create("com.apple.gamed.credentialController", 0);

  return MEMORY[0x1F41817F8]();
}

void __48__GKPlayerCredentialController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(GKPlayerCredentialController);
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;

  uint64_t v2 = [[GKSignInVisibilityManager alloc] initWithPersistence];
  [(id)sharedController_controller setSignInVisibilityManager:v2];
}

+ (void)migrateOldAccountInformation
{
  +[GKAuthenticationMachine migratePreSundanceAccountInformation];

  +[GKAuthenticationMachine migratePreBlacktailAccountInformation];
}

- (void)_transact:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayerCredentialController.m", 147, "-[GKPlayerCredentialController _transact:complete:]");
  v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__GKPlayerCredentialController__transact_complete___block_invoke;
  v16[3] = &unk_1E646DEE0;
  v16[4] = self;
  id v10 = v6;
  id v18 = v10;
  id v11 = v9;
  id v17 = v11;
  [v11 perform:v16];
  if (v7)
  {
    id v12 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__GKPlayerCredentialController__transact_complete___block_invoke_4;
    v13[3] = &unk_1E646DC30;
    id v15 = v7;
    id v14 = v11;
    [v14 notifyOnQueue:v12 block:v13];
  }
}

void __51__GKPlayerCredentialController__transact_complete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__GKPlayerCredentialController__transact_complete___block_invoke_2;
  v9[3] = &unk_1E646DEB8;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v11 = v5;
  v9[4] = v6;
  id v10 = v7;
  id v12 = v3;
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __51__GKPlayerCredentialController__transact_complete___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__GKPlayerCredentialController__transact_complete___block_invoke_3;
  v4[3] = &unk_1E646D978;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v4);
}

uint64_t __51__GKPlayerCredentialController__transact_complete___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __51__GKPlayerCredentialController__transact_complete___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)invalidateCredentialCaches
{
  uint64_t v3 = [(GKPlayerCredentialController *)self primaryCredentialCache];
  [v3 removeAllObjects];

  id v4 = [(GKPlayerCredentialController *)self allCredentialsCache];
  [v4 removeAllObjects];

  [(GKPlayerCredentialController *)self setGameBundleId:0];
}

- (void)accountStoreDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    id v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "the main account store attached to the account has changed.The notification is:%@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F17810]];
  int v9 = [v8 isEqual:@"com.apple.account.GameCenter"];

  if (v9) {
    [(GKPlayerCredentialController *)self invalidateCredentialCaches];
  }
}

- (void)accountStoreEmailDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    id v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "the email address attached to the account has changed.The notification is:%@", (uint8_t *)&v7, 0xCu);
  }
  [(GKPlayerCredentialController *)self invalidateCredentialCaches];
}

- (void)setCredential:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "CRED: save credential (%@) start", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__GKPlayerCredentialController_setCredential_completionHandler___block_invoke;
  v11[3] = &unk_1E646DF08;
  id v12 = v6;
  id v10 = v6;
  [(GKPlayerCredentialController *)self _transact:v11 complete:v7];
}

void __64__GKPlayerCredentialController_setCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__GKPlayerCredentialController_setCredential_completionHandler___block_invoke_2;
  v8[3] = &unk_1E646D978;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  [a2 _gkSaveCredential:v9 completionHandler:v8];
}

void __64__GKPlayerCredentialController_setCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "CRED: save credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setPrimaryCredential:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  __int16 v9 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "CRED: set primary credential (%@) start", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke;
  v11[3] = &unk_1E646DF58;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  [(GKPlayerCredentialController *)self _transact:v11 complete:v7];
}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v28 = a3;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayerCredentialController.m", 207, "-[GKPlayerCredentialController setPrimaryCredential:completionHandler:]_block_invoke");
  id v7 = +[GKDispatchGroup dispatchGroupWithName:v6];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_2;
  v41[3] = &unk_1E646D9A0;
  id v42 = *(id *)(a1 + 32);
  id v8 = v5;
  id v43 = v8;
  id v9 = v7;
  id v44 = v9;
  [v9 perform:v41];
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "environment"));
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) primaryCredentialCache];
  [v12 setObject:v11 forKeyedSubscript:v10];

  v29 = v8;
  id v13 = objc_msgSend(v8, "_gkAllCredentialsForEnvironment:", objc_msgSend(*(id *)(a1 + 32), "environment"));
  if (v13)
  {
    id v14 = [*(id *)(a1 + 40) allCredentialsCache];
    [v14 setObject:v13 forKeyedSubscript:v10];

    if (!os_log_GKGeneral) {
      id v15 = GKOSLoggers();
    }
    uint64_t v16 = os_log_GKDaemon;
    if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[GKPlayerCredentialController setPrimaryCredential:completionHandler:]_block_invoke";
      __int16 v48 = 2112;
      v49 = v13;
      _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "%s - cached all credentials: %@", buf, 0x16u);
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(char **)(*((void *)&v37 + 1) + 8 * i);
        if (([v22 scope] & 4) != 0 && (objc_msgSend(v22, "isEqual:", *(void *)(a1 + 32)) & 1) == 0)
        {
          if (!os_log_GKGeneral) {
            id v23 = GKOSLoggers();
          }
          v24 = os_log_GKDaemon;
          if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v22;
            _os_log_impl(&dword_1C2D22000, v24, OS_LOG_TYPE_INFO, "CRED: clear primary credential on other credential (%@) start", buf, 0xCu);
          }
          objc_msgSend(v22, "setScope:", objc_msgSend(v22, "scope") & 0xFFFFFFF3);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_43;
          v33[3] = &unk_1E646D9A0;
          id v34 = v29;
          v35 = v22;
          id v36 = v9;
          [v36 perform:v33];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v19);
  }

  v25 = [*(id *)(a1 + 40) accessQueue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_45;
  v30[3] = &unk_1E646DC30;
  id v31 = v9;
  id v32 = v28;
  id v26 = v9;
  id v27 = v28;
  [v26 notifyOnQueue:v25 block:v30];
}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setScope:", objc_msgSend(*(id *)(a1 + 32), "scope") | 0xC);
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_3;
  v7[3] = &unk_1E646DF30;
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  [v5 _gkSaveCredential:v8 completionHandler:v7];
}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "CRED: set primary credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) setError:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_2_44;
  v7[3] = &unk_1E646DF30;
  void v7[4] = v5;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 _gkSaveCredential:v5 completionHandler:v7];
}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_2_44(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  uint64_t v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "CRED: clear primary credential on other credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) setError:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_45(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setContactAssociationID:(id)a3 contactIntegrationConsent:(int)a4 serviceLastUpdateTimestamp:(id)a5 forEnvironment:(int64_t)a6 forcefully:(BOOL)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke;
  v18[3] = &unk_1E646DF80;
  id v19 = v15;
  uint64_t v20 = self;
  BOOL v24 = a7;
  id v21 = v14;
  int64_t v22 = a6;
  int v23 = a4;
  id v16 = v14;
  id v17 = v15;
  [(GKPlayerCredentialController *)self _transact:v18 complete:a8];
}

void __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (*(void *)(a1 + 32))
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    uint64_t v8 = os_log_GKDaemon;
    if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Updating contacts information on the IDS account and credentials.", buf, 2u);
    }
    __int16 v9 = [*(id *)(a1 + 40) primaryCredentialForEnvironment:*(void *)(a1 + 56) accountStore:v5];
    id v10 = [v9 playerInternal];
    uint64_t v11 = v10;
    if (!v10)
    {
      uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"GKContactsIntegrationErrorDomain" code:6 userInfo:0];
      v6[2](v6, v18);
LABEL_32:

      goto LABEL_33;
    }
    id v12 = [v10 serviceLastUpdatedTimestamp];
    if (([*(id *)(a1 + 40) lastSaveFailed] & 1) != 0
      || *(unsigned char *)(a1 + 68)
      || !v12
      || [*(id *)(a1 + 32) compare:v12] == 1)
    {
      [v11 setContactsAssociationID:*(void *)(a1 + 48)];
      [v11 setContactsIntegrationConsent:*(unsigned int *)(a1 + 64)];
      [v11 setServiceLastUpdatedTimestamp:*(void *)(a1 + 32)];
      id v13 = [v9 accountName];
      id v14 = [v5 _gkAccountForAppleID:v13];

      if (v14)
      {
        [v14 _gkSetPlayerInternal:v11];
        id v22 = 0;
        [v5 saveVerifiedAccount:v14 error:&v22];
        id v15 = v22;
      }
      else
      {
        id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"GKContactsIntegrationErrorDomain" code:2 userInfo:0];
      }
      uint64_t v18 = v15;
    }
    else
    {
      uint64_t v18 = 0;
    }
    [*(id *)(a1 + 40) setLastSaveFailed:v18 != 0];
    if (![*(id *)(a1 + 40) lastSaveFailed]) {
      goto LABEL_29;
    }
    if (!os_log_GKGeneral) {
      id v19 = GKOSLoggers();
    }
    uint64_t v20 = os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
      __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_3(v20);
    }
    if (!os_log_GKGeneral) {
      id v21 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    {
      __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_2();
      if (!v6) {
        goto LABEL_31;
      }
    }
    else
    {
LABEL_29:
      if (!v6)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    v6[2](v6, v18);
    goto LABEL_31;
  }
  if (!os_log_GKGeneral) {
    id v16 = GKOSLoggers();
  }
  id v17 = os_log_GKContacts;
  if (os_log_type_enabled((os_log_t)os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_1(v17);
  }
  v6[2](v6, 0);
LABEL_33:
}

- (void)getAltDSIDFromIDMSForCredential:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__GKPlayerCredentialController_getAltDSIDFromIDMSForCredential_completionHandler___block_invoke;
  v11[3] = &unk_1E646DFD0;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(GKPlayerCredentialController *)self _transactAndWait:v11];
}

void __82__GKPlayerCredentialController_getAltDSIDFromIDMSForCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__GKPlayerCredentialController_getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2;
  v8[3] = &unk_1E646DFA8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 _getAltDSIDFromIDMSForCredential:v6 completionHandler:v8];
}

void __82__GKPlayerCredentialController_getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  id v8 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "got missing altDSID from IDMS", v10, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

- (void)removeAllCredentialsForEnvironment:(int64_t)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke;
  v4[3] = &unk_1E646E020;
  void v4[4] = self;
  v4[5] = a3;
  [(GKPlayerCredentialController *)self _transact:v4 complete:a4];
}

void __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 _gkAllCredentialsForEnvironment:*(void *)(a1 + 40)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke_2;
  v11[3] = &unk_1E646DFF8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v11];
}

void __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke_3;
  v8[3] = &unk_1E646DF30;
  id v5 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v6 = (void *)a1[6];
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v6;
  id v7 = v3;
  [v5 _gkDeleteCredential:v7 completionHandler:v8];
}

void __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "CRED: delete credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) invalidateCredentialCaches];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removeCredential:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  __int16 v9 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "CRED: delete credential (%@) start", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__GKPlayerCredentialController_removeCredential_completionHandler___block_invoke;
  v11[3] = &unk_1E646DF58;
  id v12 = v6;
  uint64_t v13 = self;
  id v10 = v6;
  [(GKPlayerCredentialController *)self _transact:v11 complete:v7];
}

void __67__GKPlayerCredentialController_removeCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__GKPlayerCredentialController_removeCredential_completionHandler___block_invoke_2;
  v10[3] = &unk_1E646DF30;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v5;
  id v9 = v5;
  [a2 _gkDeleteCredential:v7 completionHandler:v10];
}

void __67__GKPlayerCredentialController_removeCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "CRED: delete credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) invalidateCredentialCaches];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)replaceCredential:(id)a3 withCredential:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = GKOSLoggers();
  }
  uint64_t v12 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "CRED: replace credential old:(%@) new:(%@) start", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke;
  v15[3] = &unk_1E646E070;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v13 = v9;
  id v14 = v8;
  [(GKPlayerCredentialController *)self _transact:v15 complete:v10];
}

void __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke_2;
  v12[3] = &unk_1E646E048;
  id v13 = v7;
  id v14 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = v6;
  id v10 = v6;
  id v11 = v5;
  [v11 _gkDeleteCredential:v13 completionHandler:v12];
}

void __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a1[4];
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "CRED: replace credential (%@) delete finished (error:%@)", buf, 0x16u);
  }
  id v8 = (void *)a1[5];
  int v7 = (void *)a1[6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke_49;
  v12[3] = &unk_1E646DF30;
  id v9 = v7;
  uint64_t v10 = a1[7];
  id v11 = (void *)a1[8];
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = v11;
  [v8 _gkSaveCredential:v9 completionHandler:v12];
}

void __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "CRED: replace credential (%@) save finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) invalidateCredentialCaches];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)renewCredentialForUsername:(id)a3 ttl:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__GKPlayerCredentialController_renewCredentialForUsername_ttl_completionHandler___block_invoke;
  v10[3] = &unk_1E646E0C0;
  double v12 = a4;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(GKPlayerCredentialController *)self _transact:v10 complete:a5];
}

void __81__GKPlayerCredentialController_renewCredentialForUsername_ttl_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  int v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [*(id *)(a1 + 32) lastRenewalAttempt];
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = (void *)v8;
  id v10 = [*(id *)(a1 + 32) lastRenewalAttempt];
  [v7 timeIntervalSinceDate:v10];
  double v12 = v11;
  double v13 = *(double *)(a1 + 48);

  if (v12 < v13)
  {
    v6[2](v6, 0);
  }
  else
  {
LABEL_4:
    [*(id *)(a1 + 32) setLastRenewalAttempt:v7];
    uint64_t v14 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__GKPlayerCredentialController_renewCredentialForUsername_ttl_completionHandler___block_invoke_2;
    v15[3] = &unk_1E646E098;
    uint64_t v16 = v6;
    [v5 _gkRenewCredentialForUsername:v14 completionHandler:v15];
  }
}

uint64_t __81__GKPlayerCredentialController_renewCredentialForUsername_ttl_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)credentialForPlayer:(id)a3 environment:(int64_t)a4
{
  uint64_t v6 = [a3 playerID];
  int v7 = [(GKPlayerCredentialController *)self credentialForPlayerID:v6 environment:a4];

  return v7;
}

- (id)credentialForPlayerID:(id)a3 environment:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(GKPlayerCredentialController *)self allCredentialsForEnvironment:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v12 = objc_msgSend(v11, "playerInternal", (void)v16);
        double v13 = [v12 playerID];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)credentialForUsername:(id)a3 environment:(int64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__GKPlayerCredentialController_credentialForUsername_environment___block_invoke;
  v10[3] = &unk_1E646E0E8;
  id v11 = v6;
  int64_t v12 = a4;
  id v7 = v6;
  id v8 = [(GKPlayerCredentialController *)self _transactAndWait:v10];

  return v8;
}

void __66__GKPlayerCredentialController_credentialForUsername_environment___block_invoke(uint64_t a1, void *a2, void (**a3)(void, void))
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = [a2 _gkCredentialForUsername:v5 environment:v6];
  ((void (**)(void, id))a3)[2](v7, v8);
}

- (id)allCredentialsForEnvironment:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v6 = [(GKPlayerCredentialController *)self allCredentialsCache];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__GKPlayerCredentialController_allCredentialsForEnvironment___block_invoke;
    v12[3] = &__block_descriptor_40_e34_v24__0__ACAccountStore_8___v____16l;
    void v12[4] = a3;
    id v7 = [(GKPlayerCredentialController *)self _transactAndWait:v12];
    if (v7)
    {
      uint64_t v9 = [(GKPlayerCredentialController *)self allCredentialsCache];
      [v9 setObject:v7 forKeyedSubscript:v5];

      if (!os_log_GKGeneral) {
        id v10 = GKOSLoggers();
      }
      id v11 = os_log_GKDaemon;
      if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        int v14 = "-[GKPlayerCredentialController allCredentialsForEnvironment:]";
        __int16 v15 = 2112;
        long long v16 = v7;
        _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "%s - cached all credentials: %@", buf, 0x16u);
      }
    }
  }

  return v7;
}

void __61__GKPlayerCredentialController_allCredentialsForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a3;
  id v6 = [a2 _gkAllCredentialsForEnvironment:v4];
  v5[2](v5, v6);
}

- (id)suggestedUsername
{
  id v2 = [MEMORY[0x1E4F179C8] defaultStore];
  id v3 = objc_msgSend(v2, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:", 0);

  return v3;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void)setPrimaryCredentialCache:(id)a3
{
}

- (NSString)gameBundleId
{
  return self->_gameBundleId;
}

- (void)setGameBundleId:(id)a3
{
}

- (GKThreadsafeDictionary)allCredentialsCache
{
  return self->_allCredentialsCache;
}

- (void)setAllCredentialsCache:(id)a3
{
}

- (GKSignInVisibilityManager)signInVisibilityManager
{
  return self->_signInVisibilityManager;
}

- (void)setSignInVisibilityManager:(id)a3
{
}

- (BOOL)lastSaveFailed
{
  return self->_lastSaveFailed;
}

- (void)setLastSaveFailed:(BOOL)a3
{
  self->_lastSaveFailed = a3;
}

- (NSDate)lastRenewalAttempt
{
  return self->_lastRenewalAttempt;
}

- (void)setLastRenewalAttempt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRenewalAttempt, 0);
  objc_storeStrong((id *)&self->_signInVisibilityManager, 0);
  objc_storeStrong((id *)&self->_allCredentialsCache, 0);
  objc_storeStrong((id *)&self->_gameBundleId, 0);
  objc_storeStrong((id *)&self->_primaryCredentialCache, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

void __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "Will not update contacts integration information since we are missing a timestamp", v1, 2u);
}

void __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "Account save error: %@", v1, 0xCu);
}

void __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "Failed to save account after contacts integration update", v1, 2u);
}

@end