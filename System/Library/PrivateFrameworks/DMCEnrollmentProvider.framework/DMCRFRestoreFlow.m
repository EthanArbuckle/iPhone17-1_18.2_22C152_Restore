@interface DMCRFRestoreFlow
+ (id)_intersectionOfSet:(id)a3 set:(id)a4;
+ (id)_set:(id)a3 subtracting:(id)a4;
- (DMCRFDeviceEnvironment)deviceEnvironment;
- (DMCRFInteractionClient)interactionClient;
- (DMCRFRestoreFlow)initWithSnapshotSource:(id)a3 interactionClient:(id)a4 deviceEnvironment:(id)a5 completion:(id)a6;
- (DMCRFSnapshotSource)snapshotSource;
- (NSSet)appsToRestore;
- (id)_appBundleIdentifiersSetDebugDescription:(id)a3;
- (id)completion;
- (void)_checkSnapshotForConflictingApps:(id)a3;
- (void)_compareAppsOnDeviceToAppBundleIdentifiers:(id)a3 fromSnapshot:(id)a4;
- (void)_handleSnapshots:(id)a3;
- (void)_restoreSnapshot:(id)a3 skippingApps:(id)a4;
- (void)_restoreSnapshotNoConflicts:(id)a3;
- (void)_startRestoreFromSnapshot:(id)a3 skippingApps:(id)a4;
- (void)setAppsToRestore:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDeviceEnvironment:(id)a3;
- (void)setInteractionClient:(id)a3;
- (void)setSnapshotSource:(id)a3;
- (void)startManagedRestoreWorkflow;
@end

@implementation DMCRFRestoreFlow

- (DMCRFRestoreFlow)initWithSnapshotSource:(id)a3 interactionClient:(id)a4 deviceEnvironment:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DMCRFRestoreFlow;
  v15 = [(DMCRFRestoreFlow *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_snapshotSource, a3);
    objc_storeStrong((id *)&v16->_interactionClient, a4);
    objc_storeStrong((id *)&v16->_deviceEnvironment, a5);
    uint64_t v17 = [v14 copy];
    id completion = v16->_completion;
    v16->_id completion = (id)v17;
  }
  return v16;
}

- (void)startManagedRestoreWorkflow
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v3 = dispatch_queue_create("fetch_restorable_snapshots_queue", 0);
  dispatch_time_t v4 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke;
  block[3] = &unk_2645E94A8;
  block[4] = v12;
  dispatch_after(v4, v3, block);
  v5 = [(DMCRFRestoreFlow *)self snapshotSource];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke_10;
  v7[3] = &unk_2645E9A30;
  v6 = v3;
  v9 = self;
  v10 = v12;
  v8 = v6;
  [v5 fetchRestorableSnapshotsWithCompletion:v7];

  _Block_object_dispose(v12, 8);
}

void __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v1 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      v6 = "fetch_restorable_snapshots";
      __int16 v7 = 2048;
      uint64_t v8 = 0x403E000000000000;
      _os_log_impl(&dword_221CC5000, v1, OS_LOG_TYPE_ERROR, "Task %s hasn't finished within %.1f seconds", (uint8_t *)&v5, 0x16u);
    }
    v2 = [@"fetch_restorable_snapshots" stringByAppendingString:@"_stackshot.ips"];
    v3 = (void *)MEMORY[0x263F38B48];
    dispatch_time_t v4 = DMCHangTracerDirectory();
    [v3 dumpStackshotToPath:v4 fileName:v2];
  }
}

void __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke_2;
  block[3] = &unk_2645E94A8;
  block[4] = *(void *)(a1 + 48);
  dispatch_async(v7, block);
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F38AE0];
    v10 = DMCErrorArray();
    id v11 = objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v9, 59002, v10, v6, *MEMORY[0x263F38A58], 0);

    id v12 = [*(id *)(a1 + 40) completion];
    ((void (**)(void, void *))v12)[2](v12, v11);
  }
  else
  {
    [*(id *)(a1 + 40) _handleSnapshots:v5];
  }
}

uint64_t __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_handleSnapshots:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    [(DMCRFRestoreFlow *)self _checkSnapshotForConflictingApps:v6];
  }
  else
  {
    __int16 v7 = *(NSObject **)(DMCLogObjects() + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_DEFAULT, "managed restore skipped because no restorable snapshots are available", v9, 2u);
    }
    uint64_t v8 = [(DMCRFRestoreFlow *)self completion];
    v8[2](v8, 0);
  }
}

- (void)_checkSnapshotForConflictingApps:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  id v6 = dispatch_queue_create("fetch_app_bundle_ids_queue", 0);
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke;
  block[3] = &unk_2645E94A8;
  block[4] = v17;
  dispatch_after(v7, v6, block);
  uint64_t v8 = [(DMCRFRestoreFlow *)self snapshotSource];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke_21;
  v11[3] = &unk_2645E9A58;
  uint64_t v9 = v6;
  v15 = v17;
  id v12 = v9;
  char v13 = self;
  id v10 = v4;
  id v14 = v10;
  [v8 fetchAppBundleIDsForSnapshot:v5 completion:v11];

  _Block_object_dispose(v17, 8);
}

void __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v1 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "fetch_app_bundle_ids";
      __int16 v7 = 2048;
      uint64_t v8 = 0x403E000000000000;
      _os_log_impl(&dword_221CC5000, v1, OS_LOG_TYPE_ERROR, "Task %s hasn't finished within %.1f seconds", (uint8_t *)&v5, 0x16u);
    }
    v2 = [@"fetch_app_bundle_ids" stringByAppendingString:@"_stackshot.ips"];
    v3 = (void *)MEMORY[0x263F38B48];
    id v4 = DMCHangTracerDirectory();
    [v3 dumpStackshotToPath:v4 fileName:v2];
  }
}

void __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke_2;
  block[3] = &unk_2645E94A8;
  block[4] = *(void *)(a1 + 56);
  dispatch_async(v7, block);
  if (v6)
  {
    uint64_t v8 = *(NSObject **)(DMCLogObjects() + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v8;
      id v10 = [v6 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      char v18 = v10;
      _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_ERROR, "managed restore failed because list of app bundle identifers in snapshot was not available: %{public}@", buf, 0xCu);
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F38AE0];
    char v13 = DMCErrorArray();
    id v14 = objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v12, 59003, v13, v6, *MEMORY[0x263F38A58], 0);

    v15 = [*(id *)(a1 + 40) completion];
    ((void (**)(void, void *))v15)[2](v15, v14);
  }
  else
  {
    [*(id *)(a1 + 40) _compareAppsOnDeviceToAppBundleIdentifiers:v5 fromSnapshot:*(void *)(a1 + 48)];
  }
}

uint64_t __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_compareAppsOnDeviceToAppBundleIdentifiers:(id)a3 fromSnapshot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(DMCRFRestoreFlow *)self deviceEnvironment];
  id v10 = [v9 installedAppBundleIdentifiers];
  id v11 = [v8 _intersectionOfSet:v7 set:v10];

  uint64_t v12 = [(id)objc_opt_class() _set:v7 subtracting:v11];

  [(DMCRFRestoreFlow *)self setAppsToRestore:v12];
  char v13 = [(DMCRFRestoreFlow *)self interactionClient];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__DMCRFRestoreFlow__compareAppsOnDeviceToAppBundleIdentifiers_fromSnapshot___block_invoke;
  v16[3] = &unk_2645E9A80;
  v16[4] = self;
  id v17 = v6;
  id v18 = v11;
  id v14 = v11;
  id v15 = v6;
  [v13 doesUserWantToRestoreSnapshot:v15 withConflictingApps:v14 completion:v16];
}

void __76__DMCRFRestoreFlow__compareAppsOnDeviceToAppBundleIdentifiers_fromSnapshot___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *(NSObject **)(DMCLogObjects() + 32);
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      uint64_t v8 = [v5 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_ERROR, "managed restore failed, user could not choose conflict action: %{public}@", buf, 0xCu);
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F38AE0];
    id v11 = DMCErrorArray();
    objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v10, 59006, v11, v5, *MEMORY[0x263F38A40], 0);
    uint64_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

    char v13 = [*(id *)(a1 + 32) completion];
    v13[2](v13, v12);
  }
  else
  {
    BOOL v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_DEFAULT, "managed restore, user wants to restore and skip conflicting apps (if any)", buf, 2u);
      }
      id v15 = *(void **)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) identifier];
      [v15 _restoreSnapshot:v12 skippingApps:*(void *)(a1 + 48)];
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_DEFAULT, "managed restore, user does not want to restore", buf, 2u);
      }
      uint64_t v12 = [*(id *)(a1 + 32) completion];
      v12[2](v12, 0);
    }
  }
}

+ (id)_set:(id)a3 subtracting:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  [v6 minusSet:v5];

  id v7 = (void *)[v6 copy];
  return v7;
}

+ (id)_intersectionOfSet:(id)a3 set:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  [v6 intersectSet:v5];

  id v7 = (void *)[v6 copy];
  return v7;
}

- (void)_restoreSnapshotNoConflicts:(id)a3
{
}

- (void)_restoreSnapshot:(id)a3 skippingApps:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    uint64_t v10 = [(DMCRFRestoreFlow *)self appsToRestore];
    id v11 = [(DMCRFRestoreFlow *)self _appBundleIdentifiersSetDebugDescription:v10];
    *(_DWORD *)buf = 138543362;
    v30 = v11;
    _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_DEFAULT, "managed restore, marking apps as managed [%{public}@]", buf, 0xCu);
  }
  uint64_t v12 = [(DMCRFRestoreFlow *)self appsToRestore];
  char v13 = [v12 allObjects];

  BOOL v14 = [MDMClientCoreRestoreAppHelper alloc];
  id v15 = [(DMCRFRestoreFlow *)self snapshotSource];
  v16 = [v15 personaIdentifier];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __50__DMCRFRestoreFlow__restoreSnapshot_skippingApps___block_invoke;
  v24 = &unk_2645E9AA8;
  v25 = self;
  id v26 = v13;
  id v27 = v6;
  id v28 = v7;
  id v17 = v7;
  id v18 = v6;
  id v19 = v13;
  objc_super v20 = [(MDMClientCoreRestoreAppHelper *)v14 initWithApps:v19 persona:v16 operation:0 originator:@"MobileBackup" completion:&v21];

  [(MDMClientCoreRestoreAppHelper *)v20 start];
}

void __50__DMCRFRestoreFlow__restoreSnapshot_skippingApps___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(DMCLogObjects() + 32);
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      BOOL v14 = v6;
      _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_ERROR, "managed restore, could not mark apps as managed: %{public}@", buf, 0xCu);
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F38AE0];
    uint64_t v9 = DMCErrorArray();
    uint64_t v10 = objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v8, 59007, v9, v3, *MEMORY[0x263F38A40], 0);

    id v11 = [*(id *)(a1 + 32) completion];
    ((void (**)(void, void *))v11)[2](v11, v10);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      BOOL v14 = v12;
      _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_DEFAULT, "managed restore, marked these apps as managed: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _startRestoreFromSnapshot:*(void *)(a1 + 48) skippingApps:*(void *)(a1 + 56)];
  }
}

- (void)_startRestoreFromSnapshot:(id)a3 skippingApps:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    uint64_t v10 = [(DMCRFRestoreFlow *)self _appBundleIdentifiersSetDebugDescription:v6];
    *(_DWORD *)buf = 138543362;
    BOOL v14 = v10;
    _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_DEFAULT, "managed restore, starting restore, skipping apps [%{public}@]", buf, 0xCu);
  }
  id v11 = [(DMCRFRestoreFlow *)self snapshotSource];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__DMCRFRestoreFlow__startRestoreFromSnapshot_skippingApps___block_invoke;
  void v12[3] = &unk_2645E9AD0;
  v12[4] = self;
  [v11 startRestoreForSnapshot:v7 excludingAppBundleIdentifiers:v6 completion:v12];
}

void __59__DMCRFRestoreFlow__startRestoreFromSnapshot_skippingApps___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263F38AE0];
    id v5 = a2;
    id v6 = DMCErrorArray();
    objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 59004, v6, v5, *MEMORY[0x263F38A58], 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  id v7 = [*(id *)(a1 + 32) completion];
  ((void (**)(void, id))v7)[2](v7, v8);
}

- (id)_appBundleIdentifiersSetDebugDescription:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 debugDescription];
  }
  else
  {
    uint64_t v4 = &stru_26D435FC0;
  }
  return v4;
}

- (DMCRFSnapshotSource)snapshotSource
{
  return self->_snapshotSource;
}

- (void)setSnapshotSource:(id)a3
{
}

- (DMCRFInteractionClient)interactionClient
{
  return self->_interactionClient;
}

- (void)setInteractionClient:(id)a3
{
}

- (DMCRFDeviceEnvironment)deviceEnvironment
{
  return self->_deviceEnvironment;
}

- (void)setDeviceEnvironment:(id)a3
{
}

- (NSSet)appsToRestore
{
  return self->_appsToRestore;
}

- (void)setAppsToRestore:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_appsToRestore, 0);
  objc_storeStrong((id *)&self->_deviceEnvironment, 0);
  objc_storeStrong((id *)&self->_interactionClient, 0);
  objc_storeStrong((id *)&self->_snapshotSource, 0);
}

@end