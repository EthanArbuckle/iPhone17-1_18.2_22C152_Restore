@interface LNConnectionManager
+ (id)sharedInstance;
- (LNConnectionManager)init;
- (LNTranscriptPrivilegedProvider)transcriptProvider;
- (NSMutableDictionary)connectionsByBundleIdentifier;
- (id)connectionForEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 mangledTypeName:(id)a6 userIdentity:(id)a7 error:(id *)a8;
- (id)newConnectionForEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 mangledTypeName:(id)a6 userIdentity:(id)a7 error:(id *)a8;
- (void)addConnection:(id)a3;
- (void)appWillResignActive:(id)a3;
- (void)connection:(id)a3 didCloseWithError:(id)a4;
- (void)donateActionRecord:(id)a3 completionHandler:(id)a4;
- (void)invalidateAllConnections;
- (void)removeConnection:(id)a3;
@end

@implementation LNConnectionManager

- (id)connectionForEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 mangledTypeName:(id)a6 userIdentity:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v45 = a5;
  id v44 = a6;
  id v15 = a7;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __143__LNConnectionManager_connectionForEffectiveBundleIdentifier_appBundleIdentifier_processInstanceIdentifier_mangledTypeName_userIdentity_error___block_invoke;
  aBlock[3] = &unk_1E5B3A0B0;
  aBlock[4] = self;
  v16 = (void (**)(void))_Block_copy(aBlock);
  if (!v14)
  {
    v17 = (void *)MEMORY[0x1E4F223F8];
    v18 = [v13 bundleIdentifier];
    v19 = [v17 bundleRecordWithBundleIdentifier:v18 allowPlaceholder:0 error:0];

    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
    id v21 = v20;

    v22 = [v21 entitlements];
    v23 = [v22 objectForKey:@"com.apple.private.appintents.attribution.bundle-identifier" ofClass:objc_opt_class()];

    if (v23)
    {
      id v14 = v23;
    }
    else
    {
      v24 = [v21 containingBundleRecord];
      id v14 = [v24 bundleIdentifier];
    }
  }
  v25 = [(LNConnectionManager *)self connectionsByBundleIdentifier];
  v26 = [v13 bundleIdentifier];
  v27 = [v25 objectForKeyedSubscript:v26];

  if (!v27) {
    goto LABEL_29;
  }
  id v28 = [v27 userIdentity];
  id v29 = v15;
  id v30 = v29;
  if (v28 == v29)
  {
  }
  else
  {
    if (!v29 || !v28)
    {
      id v32 = v28;
LABEL_24:

      goto LABEL_26;
    }
    int v31 = [v28 isEqual:v29];

    if (!v31) {
      goto LABEL_27;
    }
  }
  id v32 = [v27 appBundleIdentifier];
  id v33 = v14;
  id v30 = v33;
  if (v32 == v33)
  {
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  if (!v33 || !v32)
  {

    if (v30) {
      goto LABEL_26;
    }
    v36 = [v27 bundleIdentifier];
    v37 = [v13 bundleIdentifier];
    id v30 = v36;
    id v38 = v37;
    if (v30 != v38)
    {
      v39 = v38;
      if (v30 && v38)
      {
        char v42 = [v30 isEqual:v38];

        if (v42) {
          goto LABEL_40;
        }
        goto LABEL_28;
      }

      goto LABEL_24;
    }

    goto LABEL_38;
  }
  char v34 = [v32 isEqual:v33];

  if (v34) {
    goto LABEL_39;
  }
LABEL_26:

LABEL_27:
LABEL_28:
  [v27 close];
  [(LNConnectionManager *)self removeConnection:v27];
LABEL_29:
  id v35 = [(LNConnectionManager *)self newConnectionForEffectiveBundleIdentifier:v13 appBundleIdentifier:v14 processInstanceIdentifier:v45 mangledTypeName:v44 userIdentity:v15 error:a8];

  if (v35)
  {
    [(LNConnectionManager *)self addConnection:v35];
    v27 = v35;
  }
  else
  {
    v27 = 0;
  }
LABEL_40:
  id v40 = v27;

  v16[2](v16);
  return v40;
}

- (NSMutableDictionary)connectionsByBundleIdentifier
{
  return self->_connectionsByBundleIdentifier;
}

void __143__LNConnectionManager_connectionForEffectiveBundleIdentifier_appBundleIdentifier_processInstanceIdentifier_mangledTypeName_userIdentity_error___block_invoke(uint64_t a1)
{
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7672);
  }
  v2 = (void *)sharedInstance_value;
  return v2;
}

- (void)addConnection:(id)a3
{
  id v6 = a3;
  v4 = [(LNConnectionManager *)self connectionsByBundleIdentifier];
  v5 = [v6 bundleIdentifier];
  [v4 setObject:v6 forKeyedSubscript:v5];

  [v6 setManager:self];
  [v6 setIdleTimer];
}

- (id)newConnectionForEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 mangledTypeName:(id)a6 userIdentity:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v16)
  {
    v18 = [v13 bundleIdentifier];
    +[LNConnectionPolicy shouldHandleInProcessWithMangledTypeName:v16 bundleIdentifier:v18];
  }
  v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEffectiveBundleIdentifier:v13 appBundleIdentifier:v14 processInstanceIdentifier:v15 appIntentsEnabledOnly:1 userIdentity:v17 error:a8];

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptProvider, 0);
  objc_storeStrong((id *)&self->_connectionsByBundleIdentifier, 0);
}

- (LNTranscriptPrivilegedProvider)transcriptProvider
{
  return self->_transcriptProvider;
}

- (void)removeConnection:(id)a3
{
  id v9 = a3;
  v4 = [v9 bundleIdentifier];
  v5 = [(LNConnectionManager *)self connectionsByBundleIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  v7 = v9;
  if (v6 == v9)
  {
    v8 = [(LNConnectionManager *)self connectionsByBundleIdentifier];
    [v8 setObject:0 forKeyedSubscript:v4];

    v7 = v9;
  }
  [v7 setManager:0];
}

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__LNConnectionManager_connection_didCloseWithError___block_invoke;
  aBlock[3] = &unk_1E5B3A0B0;
  aBlock[4] = self;
  v8 = (void (**)(void))_Block_copy(aBlock);
  [(LNConnectionManager *)self removeConnection:v6];
  v8[2](v8);
}

void __52__LNConnectionManager_connection_didCloseWithError___block_invoke(uint64_t a1)
{
}

- (void)donateActionRecord:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 hasNextAction];
  id v9 = [(LNConnectionManager *)self transcriptProvider];
  id v21 = 0;
  v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v21];
  id v11 = v21;
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (v12)
  {
    id v13 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_1A4419000, v13, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  id v14 = [v6 bundleIdentifier];
  id v15 = [v6 executionDate];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__LNConnectionManager_donateActionRecord_completionHandler___block_invoke;
  v19[3] = &unk_1E5B3A550;
  id v20 = v7;
  id v18 = v7;
  [v9 donateActionRecordData:v10 bundleIdentifier:v14 timestamp:v8 writeImmediately:v19 reply:v17];
}

void __60__LNConnectionManager_donateActionRecord_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  if (v3)
  {
    v5 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_ERROR, "Error when donating action record to transcript: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)invalidateAllConnections
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(LNConnectionManager *)self connectionsByBundleIdentifier];
  v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v6 = [v5 allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v10++) close];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v11 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl(&dword_1A4419000, v11, OS_LOG_TYPE_INFO, "Closed all connections", v12, 2u);
  }
}

- (void)appWillResignActive:(id)a3
{
  BOOL v4 = +[LNEntitlementsValidator validateEntitlement:@"com.apple.private.appintents.exception.background-task-allowed" forCurrentTaskWithValidator:&__block_literal_global_19];
  v5 = getLNLogCategoryConnection();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "The app will resign active; The app will close all connections manually",
        buf,
        2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "The app will resign active; Closing all connections immediately...",
        v7,
        2u);
    }

    [(LNConnectionManager *)self invalidateAllConnections];
  }
}

uint64_t __43__LNConnectionManager_appWillResignActive___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

- (LNConnectionManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)LNConnectionManager;
  id v2 = [(LNConnectionManager *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    connectionsByBundleIdentifier = v3->_connectionsByBundleIdentifier;
    v3->_connectionsByBundleIdentifier = v4;

    BOOL v6 = objc_alloc_init(LNTranscriptPrivilegedProvider);
    transcriptProvider = v3->_transcriptProvider;
    v3->_transcriptProvider = v6;

    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v3 selector:sel_appWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];

    uint64_t v9 = v3;
  }

  return v3;
}

uint64_t __37__LNConnectionManager_sharedInstance__block_invoke()
{
  sharedInstance_value = objc_alloc_init(LNConnectionManager);
  return MEMORY[0x1F41817F8]();
}

@end