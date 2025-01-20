@interface HDDiagnosticManager
+ (id)sharedDiagnosticManager;
- (HDDiagnosticManager)init;
- (id)_diagnosticsForKeys:(id)a3 shouldLog:(BOOL)a4;
- (id)_diagnosticsOverview;
- (id)diagnosticsForKeys:(id)a3;
- (void)addObject:(id)a3;
- (void)logAllDiagnostics;
- (void)removeObject:(id)a3;
@end

@implementation HDDiagnosticManager

- (void)removeObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_objects removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)addObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_objects addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

+ (id)sharedDiagnosticManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HDDiagnosticManager_sharedDiagnosticManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDiagnosticManager_onceToken != -1) {
    dispatch_once(&sharedDiagnosticManager_onceToken, block);
  }
  v2 = (void *)sharedDiagnosticManager___sharedDiagnosticManager;

  return v2;
}

uint64_t __46__HDDiagnosticManager_sharedDiagnosticManager__block_invoke(uint64_t a1)
{
  sharedDiagnosticManager___sharedDiagnosticManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (HDDiagnosticManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDDiagnosticManager;
  v2 = [(HDDiagnosticManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    objects = v2->_objects;
    v2->_objects = (NSHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)logAllDiagnostics
{
  id v2 = [(HDDiagnosticManager *)self _diagnosticsForKeys:0 shouldLog:1];
}

- (id)diagnosticsForKeys:(id)a3
{
  return [(HDDiagnosticManager *)self _diagnosticsForKeys:a3 shouldLog:0];
}

- (id)_diagnosticsForKeys:(id)a3 shouldLog:(BOOL)a4
{
  BOOL v40 = a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v41 = [MEMORY[0x263F089D8] string];
  if (![v5 count])
  {
    objc_super v6 = [(HDDiagnosticManager *)self _diagnosticsOverview];
    _LogOrAppend(v6, v41, v40);
  }
  os_unfair_lock_lock(&self->_lock);
  v7 = [(NSHashTable *)self->_objects allObjects];
  os_unfair_lock_unlock(&self->_lock);
  v37 = [MEMORY[0x263EFF9A0] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        if (![v5 count] || objc_msgSend(v5, "containsObject:", v15))
        {
          v16 = [v37 objectForKeyedSubscript:v15];
          if (!v16)
          {
            v16 = [MEMORY[0x263EFF980] array];
            [v37 setObject:v16 forKeyedSubscript:v15];
          }
          [v16 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v10);
  }
  v32 = v8;
  v33 = v5;

  v17 = [v37 allKeys];
  v18 = [v17 sortedArrayUsingSelector:sel_compare_];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v18;
  uint64_t v36 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v47;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v19;
        uint64_t v20 = *(void *)(*((void *)&v46 + 1) + 8 * v19);
        v21 = [v37 objectForKeyedSubscript:v20];
        v38 = [NSString stringWithFormat:@"\n======== %@ ==========", v20];
        _LogOrAppend(v38, v41, v40);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v43 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              v28 = NSString;
              v29 = [v27 diagnosticDescription];
              v30 = [v28 stringWithFormat:@"<%@:%p> %@", v20, v27, v29];

              _LogOrAppend(v30, v41, v40);
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v54 count:16];
          }
          while (v24);
        }

        uint64_t v19 = v39 + 1;
      }
      while (v39 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v36);
  }

  return v41;
}

- (id)_diagnosticsOverview
{
  id v2 = [MEMORY[0x263F089D8] stringWithString:@"======== Overview ==========\n"];
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  v4 = HKDiagnosticStringFromDate();
  [v2 appendFormat:@"Date: %@\n", v4];

  id v5 = [MEMORY[0x263F0A980] currentDeviceProductType];
  [v2 appendFormat:@"Device: %@\n", v5];

  if ([MEMORY[0x263F0A980] isAppleInternalInstall])
  {
    objc_super v6 = [MEMORY[0x263F0A980] sharedBehavior];
    v7 = [v6 currentInternalDeviceModel];
    [v2 appendFormat:@"Internal Model: %@\n", v7];
  }
  id v8 = [MEMORY[0x263F0A980] currentOSVersion];
  uint64_t v9 = [MEMORY[0x263F0A980] currentOSBuild];
  [v2 appendFormat:@"Build: %@ (%@)\n", v8, v9];

  uint64_t v10 = [MEMORY[0x263F0A980] sharedBehavior];
  objc_msgSend(v2, "appendFormat:", @"Disk capacity: %.1f GB\n", (double)(unint64_t)objc_msgSend(v10, "totalDiskCapacity") * 9.31322575e-10);

  uint64_t v11 = [MEMORY[0x263F0A980] sharedBehavior];
  objc_msgSend(v2, "appendFormat:", @"Disk space available: %.3f GB", (double)(unint64_t)objc_msgSend(v11, "currentDiskSpaceAvailable") * 9.31322575e-10);

  return v2;
}

- (void).cxx_destruct
{
}

@end