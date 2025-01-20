@interface DNDSCoreDataBackingStore
- (id)_initWithURL:(id)a3;
- (id)newManagedObjectContext;
- (void)setupPersistentStoreIfNeeded;
@end

@implementation DNDSCoreDataBackingStore

- (id)_initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSCoreDataBackingStore;
  v6 = [(DNDSCoreDataBackingStore *)&v9 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    v6->_setupLock._os_unfair_lock_opaque = 0;
    if (v5)
    {
      if (os_variant_has_internal_content()) {
        objc_storeStrong(p_isa + 3, a3);
      }
    }
  }

  return p_isa;
}

- (void)setupPersistentStoreIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Failed to create backing store directory.", v1, 2u);
}

void __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = DNDSLogSettings;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT)) {
      __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke_cold_2((uint64_t)v6, v7);
    }
    v8 = [*(id *)(a1 + 32) persistentStoreCoordinator];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *MEMORY[0x1E4F1BF70];
    id v17 = 0;
    [v8 destroyPersistentStoreAtURL:v9 withType:v10 options:0 error:&v17];
    id v11 = v17;

    v12 = DNDSLogSettings;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT)) {
        __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke_cold_1((uint64_t)v11, v12);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v19 = v16;
      _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Destroyed persistent store to retry load. url=%@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Loaded persistent store with description: %@", buf, 0xCu);
    }
    v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = v13;
    id v11 = *(id *)(v14 + 16);
    *(void *)(v14 + 16) = v15;
  }
}

- (id)newManagedObjectContext
{
  [(DNDSCoreDataBackingStore *)self setupPersistentStoreIfNeeded];
  v3 = [(NSPersistentContainer *)self->_persistentContainer newBackgroundContext];
  [(NSManagedObjectContext *)v3 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDatabaseURL, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

void __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3052000, a2, OS_LOG_TYPE_FAULT, "Failed to destroy persistent store: %@", (uint8_t *)&v2, 0xCu);
}

void __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3052000, a2, OS_LOG_TYPE_FAULT, "Error adding persistent store: %@", (uint8_t *)&v2, 0xCu);
}

@end