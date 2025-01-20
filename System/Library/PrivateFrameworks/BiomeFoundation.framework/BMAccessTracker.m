@interface BMAccessTracker
+ (id)sharedInstance;
- (BMAccessTracker)init;
- (void)_logMissingEntitlementsForAccess:(id)a3 useCase:(id)a4;
- (void)logMissingEntitlementsForAccessToResource:(id)a3 domain:(unint64_t)a4 withMode:(unint64_t)a5 useCase:(id)a6;
@end

@implementation BMAccessTracker

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __33__BMAccessTracker_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(BMAccessTracker);
  return MEMORY[0x1F41817F8]();
}

- (BMAccessTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)BMAccessTracker;
  v2 = [(BMAccessTracker *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;
  }
  return v2;
}

- (void)logMissingEntitlementsForAccessToResource:(id)a3 domain:(unint64_t)a4 withMode:(unint64_t)a5 useCase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)MEMORY[0x1B3EB5880]();
  v13 = [[BMAccessDescriptor alloc] initWithDomain:a4 accessMode:a5 resource:v10];
  lock = self->_lock;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__BMAccessTracker_logMissingEntitlementsForAccessToResource_domain_withMode_useCase___block_invoke;
  v17[3] = &unk_1E6022B28;
  v18 = v13;
  id v15 = v11;
  id v19 = v15;
  v20 = self;
  v16 = v13;
  [(_PASLock *)lock runWithLockAcquired:v17];
}

void __85__BMAccessTracker_logMissingEntitlementsForAccessToResource_domain_withMode_useCase___block_invoke(uint64_t a1, void *a2)
{
  v23 = a2;
  char v3 = [*(id *)(a1 + 32) mode];
  v4 = [*(id *)(a1 + 32) resource];
  uint64_t v5 = [v4 name];

  v6 = v23;
  if (v23) {
    v6 = (void *)v23[2];
  }
  v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  char v8 = [v7 containsObject:v5];

  if ((v8 & 1) == 0)
  {
    if ((v3 & 2) != 0)
    {
      v18 = v23;
      if (v23) {
        v18 = (void *)v23[2];
      }
      id v19 = [v18 objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (!v19)
      {
        v20 = objc_opt_new();
        v21 = v23;
        if (v23) {
          v21 = (void *)v23[2];
        }
        [v21 setObject:v20 forKeyedSubscript:*(void *)(a1 + 40)];
      }
      v16 = (char *)v23;
      if (!v23) {
        goto LABEL_25;
      }
      uint64_t v17 = 16;
      goto LABEL_24;
    }
    v9 = v23;
    if (v23) {
      v9 = (void *)v23[1];
    }
    id v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];
    char v11 = [v10 containsObject:v5];

    if ((v11 & 1) == 0)
    {
      v12 = v23;
      if (v23) {
        v12 = (void *)v23[1];
      }
      v13 = [v12 objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (!v13)
      {
        v14 = objc_opt_new();
        id v15 = v23;
        if (v23) {
          id v15 = (void *)v23[1];
        }
        [v15 setObject:v14 forKeyedSubscript:*(void *)(a1 + 40)];
      }
      v16 = (char *)v23;
      if (!v23) {
        goto LABEL_25;
      }
      uint64_t v17 = 8;
LABEL_24:
      v16 = *(char **)&v16[v17];
LABEL_25:
      v22 = [v16 objectForKeyedSubscript:*(void *)(a1 + 40)];
      [v22 addObject:v5];

      [*(id *)(a1 + 48) _logMissingEntitlementsForAccess:*(void *)(a1 + 32) useCase:*(void *)(a1 + 40)];
    }
  }
}

- (void)_logMissingEntitlementsForAccess:(id)a3 useCase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[BMProcess current];
  if ((unint64_t)([v7 processType] - 2) >= 7)
  {
    char v8 = @"com.apple.biome.access.user";
    if ([v5 domain] == 1)
    {
      v9 = @"com.apple.biome.access.system";

      char v8 = v9;
    }
    if (([v7 canPerformGlobalMachLookup:v8 report:0] & 1) == 0)
    {
      id v10 = __biome_log_for_category(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BMAccessTracker _logMissingEntitlementsForAccess:useCase:]((uint64_t)v8, v10);
      }
    }
    int v11 = [v6 hasPrefix:@"__"];
    v12 = __biome_log_for_category(6);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);
    if (v11)
    {
      if (v13) {
        -[BMAccessTracker _logMissingEntitlementsForAccess:useCase:](v5, v12);
      }
    }
    else if (v13)
    {
      -[BMAccessTracker _logMissingEntitlementsForAccess:useCase:](v5, (uint64_t)v6, v12);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)_logMissingEntitlementsForAccess:(void *)a1 useCase:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = BMAccessModePrintableDescription([a1 mode]);
  id v5 = [a1 resource];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_FAULT, "This process is not entitled for %@ access to %@", (uint8_t *)&v6, 0x16u);
}

- (void)_logMissingEntitlementsForAccess:(NSObject *)a3 useCase:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = BMAccessModePrintableDescription([a1 mode]);
  v7 = [a1 resource];
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  int v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_fault_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_FAULT, "This process is not entitled for %@ access to %@ for use case '%@'", (uint8_t *)&v8, 0x20u);
}

- (void)_logMissingEntitlementsForAccess:(uint64_t)a1 useCase:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Warning: This process is missing mach-lookup entitlement for %@", (uint8_t *)&v2, 0xCu);
}

@end