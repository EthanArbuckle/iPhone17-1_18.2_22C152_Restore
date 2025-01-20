@interface ATXDigitalHealthBlacklist
+ (ATXDigitalHealthBlacklist)sharedInstance;
- (ATXDigitalHealthBlacklist)init;
- (BOOL)_updateBlacklistWithNewBlacklistedBundleIds:(id)a3 whitelistedBundleIds:(id)a4;
- (id)blacklistedBundleIds;
- (void)dealloc;
- (void)deviceManagementPolicyDidChange:(id)a3;
@end

@implementation ATXDigitalHealthBlacklist

+ (ATXDigitalHealthBlacklist)sharedInstance
{
  if (sharedInstance__pasOnceToken6_15 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_15, &__block_literal_global_101);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_19;
  return (ATXDigitalHealthBlacklist *)v2;
}

void __43__ATXDigitalHealthBlacklist_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_19;
  sharedInstance__pasExprOnceResult_19 = v1;
}

- (ATXDigitalHealthBlacklist)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXDigitalHealthBlacklist;
  v2 = [(ATXDigitalHealthBlacklist *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    v7 = (void *)MEMORY[0x1D25F6CC0]();
    v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v8 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATXDigitalHealthBlacklist;
  [(ATXDigitalHealthBlacklist *)&v4 dealloc];
}

- (id)blacklistedBundleIds
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__49;
  objc_super v10 = __Block_byref_object_dispose__49;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__ATXDigitalHealthBlacklist_blacklistedBundleIds__block_invoke;
  v5[3] = &unk_1E68B0B80;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__ATXDigitalHealthBlacklist_blacklistedBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "deviceManagementPolicy", (void)v16);
        v14 = [v12 bundleIdentifier];
        if (v13) {
          v15 = v5;
        }
        else {
          v15 = v6;
        }
        [v15 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if ([(ATXDigitalHealthBlacklist *)self _updateBlacklistWithNewBlacklistedBundleIds:v5 whitelistedBundleIds:v6])
  {
    ATXUpdatePredictionsImmediatelyWithReason(14);
    [MEMORY[0x1E4F93940] refreshBlendingLayerWithReason:@"Device management policy did change"];
  }
}

- (BOOL)_updateBlacklistWithNewBlacklistedBundleIds:(id)a3 whitelistedBundleIds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    lock = self->_lock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__ATXDigitalHealthBlacklist__updateBlacklistWithNewBlacklistedBundleIds_whitelistedBundleIds___block_invoke;
    v11[3] = &unk_1E68B0BA8;
    id v12 = v6;
    id v13 = v7;
    v14 = &v15;
    [(_PASLock *)lock runWithLockAcquired:v11];
    BOOL v9 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __94__ATXDigitalHealthBlacklist__updateBlacklistWithNewBlacklistedBundleIds_whitelistedBundleIds___block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  id v3 = v7[1];
  id v4 = (void *)[v7[1] mutableCopy];
  [v4 unionSet:a1[4]];
  [v4 minusSet:a1[5]];
  if (([v3 isEqualToSet:v4] & 1) == 0)
  {
    uint64_t v5 = [v4 copy];
    id v6 = v7[1];
    v7[1] = (id)v5;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (void).cxx_destruct
{
}

@end