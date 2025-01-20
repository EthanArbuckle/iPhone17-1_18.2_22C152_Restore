@interface HDCacheDeleteCoordinator
+ (id)unitTesting_cacheDeleteUrgencies;
- (HDCacheDeleteCoordinator)init;
- (id)purgeSpace:(int)a3 info:(id)a4;
- (id)queryPurgeableSpace:(int)a3 info:(id)a4;
- (void)activate;
- (void)registerCacheDeleteProvider:(id)a3;
- (void)unregisterCacheDeleteProvider:(id)a3;
@end

@implementation HDCacheDeleteCoordinator

- (HDCacheDeleteCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDCacheDeleteCoordinator;
  v2 = [(HDCacheDeleteCoordinator *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v4 = HKLogInfrastructure();
    uint64_t v5 = [v3 initWithName:@"cache-delete-providers" loggingCategory:v4];
    providers = v2->_providers;
    v2->_providers = (HKSynchronousObserverSet *)v5;
  }
  return v2;
}

- (void)activate
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__HDCacheDeleteCoordinator_activate__block_invoke;
  aBlock[3] = &unk_1E63047E8;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__HDCacheDeleteCoordinator_activate__block_invoke_281;
  v7[3] = &unk_1E63047E8;
  v7[4] = self;
  v4 = _Block_copy(v7);
  _HKInitializeLogging();
  uint64_t v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "Registering CacheDelete callbacks", v6, 2u);
  }

  CacheDeleteRegisterInfoCallbacks();
}

uint64_t __36__HDCacheDeleteCoordinator_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _HKInitializeLogging();
  v6 = HKLogInfrastructure();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v8 = 0;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Determining CacheDelete purgable", v8, 2u);
  }

  [*(id *)(a1 + 32) queryPurgeableSpace:a2 info:a3];
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __36__HDCacheDeleteCoordinator_activate__block_invoke_281(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _HKInitializeLogging();
  v6 = HKLogInfrastructure();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v8 = 0;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Determining CacheDelete purged", v8, 2u);
  }

  [*(id *)(a1 + 32) purgeSpace:a2 info:a3];
  return objc_claimAutoreleasedReturnValue();
}

void __36__HDCacheDeleteCoordinator_activate__block_invoke_282()
{
  _HKInitializeLogging();
  v0 = HKLogInfrastructure();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BCB7D000, v0, OS_LOG_TYPE_DEFAULT, "CacheDelete Cancel unsupported", v1, 2u);
  }
}

uint64_t __36__HDCacheDeleteCoordinator_activate__block_invoke_284()
{
  _HKInitializeLogging();
  v0 = HKLogInfrastructure();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1BCB7D000, v0, OS_LOG_TYPE_DEFAULT, "CacheDelete Periodic unsupported", v2, 2u);
  }

  return 0;
}

- (void)registerCacheDeleteProvider:(id)a3
{
}

- (void)unregisterCacheDeleteProvider:(id)a3
{
}

- (id)queryPurgeableSpace:(int)a3 info:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  providers = self->_providers;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__HDCacheDeleteCoordinator_queryPurgeableSpace_info___block_invoke;
  v15[3] = &unk_1E6304830;
  v17 = &v19;
  int v18 = a3;
  id v9 = v7;
  id v16 = v9;
  [(HKSynchronousObserverSet *)providers notifyObservers:v15];
  _HKInitializeLogging();
  v10 = HKLogInfrastructure();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v20[3];
    *(_DWORD *)buf = 138543618;
    id v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "CacheDelete purgeable amount for volume %{public}@ in bytes %llu ", buf, 0x16u);
  }

  v24[0] = v9;
  v23[0] = @"CACHE_DELETE_VOLUME";
  v23[1] = @"CACHE_DELETE_AMOUNT";
  v12 = [NSNumber numberWithLongLong:v20[3]];
  v24[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  _Block_object_dispose(&v19, 8);

  return v13;
}

uint64_t __53__HDCacheDeleteCoordinator_queryPurgeableSpace_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 purgeableSpaceForUrgency:*(unsigned int *)(a1 + 48) volume:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

- (id)purgeSpace:(int)a3 info:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  providers = self->_providers;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__HDCacheDeleteCoordinator_purgeSpace_info___block_invoke;
  v15[3] = &unk_1E6304830;
  v17 = &v19;
  int v18 = a3;
  id v9 = v7;
  id v16 = v9;
  [(HKSynchronousObserverSet *)providers notifyObservers:v15];
  _HKInitializeLogging();
  v10 = HKLogInfrastructure();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v20[3];
    *(_DWORD *)buf = 138543618;
    id v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "CacheDelete purged amount for volume %{public}@ in bytes: %llu", buf, 0x16u);
  }

  v24[0] = v9;
  v23[0] = @"CACHE_DELETE_VOLUME";
  v23[1] = @"CACHE_DELETE_AMOUNT";
  v12 = [NSNumber numberWithLongLong:v20[3]];
  v24[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  _Block_object_dispose(&v19, 8);

  return v13;
}

uint64_t __44__HDCacheDeleteCoordinator_purgeSpace_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 purgeSpaceForUrgency:*(unsigned int *)(a1 + 48) volume:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

+ (id)unitTesting_cacheDeleteUrgencies
{
  return &unk_1F17EA410;
}

- (void).cxx_destruct
{
}

@end