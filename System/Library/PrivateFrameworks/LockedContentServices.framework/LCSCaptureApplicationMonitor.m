@interface LCSCaptureApplicationMonitor
+ (BOOL)_hasCameraUsageDescriptionForBundleIdentifier:(id)a3;
+ (BOOL)_hasCaptureAppIntentForBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4;
+ (id)_bundleRecordForBundleIdentifier:(id)a3;
- (BOOL)isCaptureApplication:(id)a3;
- (LCSCaptureApplicationMonitor)init;
- (NSDictionary)knownCaptureApplicationsByBundleIdentifier;
- (id)_captureApplicationsFromKnownExtensions:(id)a3 currentCaptureApplications:(id)a4;
- (id)_lock_evaluateCaptureApplicationRequirementsForKnownExtensions:(id)a3;
- (void)_beginObservingMetadataChanges;
- (void)_endObservingMetadataChanges;
- (void)_lock_updateKnownCaptureApplications:(id)a3;
- (void)_processMetadataChangeForBundleIdentifiers:(id)a3;
- (void)_queue_cancel;
- (void)_queue_start;
- (void)_reevaluateCaptureApplicationRequirements;
- (void)_updateTCCMonitorForBundleIdentifiers:(id)a3;
- (void)addObserver:(id)a3;
- (void)captureExtensionProvider:(id)a3 didUpdateKnownExtensions:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)tccMonitor:(id)a3 didUpdateCameraTCCStatuses:(id)a4;
@end

@implementation LCSCaptureApplicationMonitor

- (NSDictionary)knownCaptureApplicationsByBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSDictionary *)self->_lock_knownCaptureApplicationsByBundleIdentifier copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

+ (BOOL)_hasCaptureAppIntentForBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v36 = a4;
  v6 = (void *)[objc_alloc(MEMORY[0x263F520A8]) initWithOptions:0];
  v7 = [MEMORY[0x263F51D30] cameraCaptureProtocol];
  v8 = objc_opt_new();
  v31 = v6;
  uint64_t v9 = [v6 actionsConformingToSystemProtocol:v7 withParametersOfTypes:v8 bundleIdentifier:v5 error:0];

  v30 = (void *)v9;
  v10 = (void *)v9;
  v11 = v5;
  v12 = [v10 objectForKeyedSubscript:v5];
  v13 = [v12 allValues];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v13;
  uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v34)
  {
    char v14 = 0;
    uint64_t v33 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v17 = [v16 effectiveBundleIdentifiers];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v51 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v35 = i;
          char v20 = 0;
          uint64_t v21 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v38 != v21) {
                objc_enumerationMutation(v17);
              }
              v23 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              v24 = [v23 bundleIdentifier];
              char v25 = [v24 isEqualToString:v11];

              v14 |= v25;
              v26 = [v23 bundleIdentifier];
              LOBYTE(v23) = [v26 isEqualToString:v36];

              v20 |= v23;
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v51 count:16];
          }
          while (v19);

          if (v20)
          {
            int v27 = 1;
            goto LABEL_21;
          }
          uint64_t i = v35;
        }
        else
        {
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
      if (v34) {
        continue;
      }
      break;
    }
    int v27 = 0;
  }
  else
  {
    int v27 = 0;
    char v14 = 0;
  }
LABEL_21:

  v28 = LCSLogCommon();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v46 = v11;
    __int16 v47 = 1024;
    int v48 = v14 & 1;
    __int16 v49 = 1024;
    int v50 = v27;
    _os_log_impl(&dword_255087000, v28, OS_LOG_TYPE_DEFAULT, "Capture Application (%@): appHasCaptureAppIntent %{BOOL}u, extensionHasCaptureAppIntent %{BOOL}u", buf, 0x18u);
  }

  return v27 & v14;
}

+ (BOOL)_hasCameraUsageDescriptionForBundleIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [(id)objc_opt_class() _bundleRecordForBundleIdentifier:v3];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 infoDictionary];
    v7 = [v6 objectForKey:@"NSCameraUsageDescription" ofClass:objc_opt_class()];
    v8 = LCSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_255087000, v8, OS_LOG_TYPE_DEFAULT, "NSCameraUsageDescription for %@", (uint8_t *)&v11, 0xCu);
    }

    if (v7) {
      int v9 = [v7 isEqualToString:&stru_27043D4E0] ^ 1;
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    v6 = LCSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_255087000, v6, OS_LOG_TYPE_DEFAULT, "No NSCameraUsageDescription for %@", (uint8_t *)&v11, 0xCu);
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)_bundleRecordForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  v4 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = LCSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[LCSCaptureApplicationMonitor _bundleRecordForBundleIdentifier:v6];
    }
  }
  return v4;
}

- (LCSCaptureApplicationMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)LCSCaptureApplicationMonitor;
  v2 = [(LCSCaptureApplicationMonitor *)&v15 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    queue_observers = v3->_queue_observers;
    v3->_queue_observers = (NSHashTable *)v6;

    id v8 = [[LCSExtensionMonitor alloc] initWithExtensionPointIdentifier:@"com.apple.securecapture"];
    queue_extensionMonitor = v3->_queue_extensionMonitor;
    v3->_queue_extensionMonitor = (LCSExtensionProvider *)v8;

    [(LCSExtensionProvider *)v3->_queue_extensionMonitor addObserver:v3];
    [(LCSCaptureApplicationMonitor *)v3 _beginObservingMetadataChanges];
    objc_initWeak(&location, v3);
    v10 = objc_alloc_init(LCSFirstUnlockManager);
    if (![(LCSFirstUnlockManager *)v10 hasUnlockedSinceBoot])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __36__LCSCaptureApplicationMonitor_init__block_invoke;
      v12[3] = &unk_2653BEA18;
      objc_copyWeak(&v13, &location);
      [(LCSFirstUnlockManager *)v10 setPostFirstUnlockHandler:v12];
      objc_storeStrong((id *)&v3->_firstUnlockManager, v10);
      objc_destroyWeak(&v13);
    }

    objc_destroyWeak(&location);
  }
  return v3;
}

void __36__LCSCaptureApplicationMonitor_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _reevaluateCaptureApplicationRequirements];
    v2 = (void *)v3[6];
    v3[6] = 0;

    WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(LCSCaptureApplicationMonitor *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LCSCaptureApplicationMonitor;
  [(LCSCaptureApplicationMonitor *)&v3 dealloc];
}

- (void)invalidate
{
  [(LCSCaptureApplicationMonitor *)self _endObservingMetadataChanges];
  [(LCSCaptureApplicationTCCObservationToken *)self->_tccObservationToken invalidate];
  tccObservationToken = self->_tccObservationToken;
  self->_tccObservationToken = 0;

  os_unfair_lock_lock(&self->_lock);
  lock_knownCaptureApplicationsByBundleIdentifier = self->_lock_knownCaptureApplicationsByBundleIdentifier;
  self->_lock_knownCaptureApplicationsByBundleIdentifier = 0;

  os_unfair_lock_unlock(&self->_lock);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__LCSCaptureApplicationMonitor_invalidate__block_invoke;
  block[3] = &unk_2653BEA40;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __42__LCSCaptureApplicationMonitor_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__LCSCaptureApplicationMonitor_addObserver___block_invoke;
    v7[3] = &unk_2653BE9F0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __44__LCSCaptureApplicationMonitor_addObserver___block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    uint64_t v2 = LCSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_255087000, v2, OS_LOG_TYPE_DEFAULT, "Starting extension monitor because first observer added", v4, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_start");
  }
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__LCSCaptureApplicationMonitor_removeObserver___block_invoke;
    v7[3] = &unk_2653BE9F0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __47__LCSCaptureApplicationMonitor_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (!result)
  {
    objc_super v3 = LCSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_255087000, v3, OS_LOG_TYPE_DEFAULT, "Suspending extension monitor because no observers left", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_queue_cancel");
  }
  return result;
}

- (BOOL)isCaptureApplication:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)[(NSDictionary *)self->_lock_knownCaptureApplicationsByBundleIdentifier copy];
  os_unfair_lock_unlock(p_lock);
  if (v6
    && ([v6 objectForKey:v4], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    BOOL v8 = 1;
  }
  else
  {
    int v9 = (void *)[objc_alloc(MEMORY[0x263F04DE8]) initWithExtensionPointIdentifier:@"com.apple.securecapture"];
    v10 = [MEMORY[0x263F04DF0] executeQuery:v9];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__LCSCaptureApplicationMonitor_isCaptureApplication___block_invoke;
    v13[3] = &unk_2653BEA68;
    id v14 = v4;
    int v11 = objc_msgSend(v10, "bs_firstObjectPassingTest:", v13);
    BOOL v8 = v11 != 0;
  }
  return v8;
}

uint64_t __53__LCSCaptureApplicationMonitor_isCaptureApplication___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 containingBundleRecord];
  id v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)_reevaluateCaptureApplicationRequirements
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__LCSCaptureApplicationMonitor__reevaluateCaptureApplicationRequirements__block_invoke;
  v5[3] = &unk_2653BEA90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(LCSCaptureApplicationMonitor *)self _lock_evaluateCaptureApplicationRequirementsForKnownExtensions:v7[5]];
  [(LCSCaptureApplicationMonitor *)self _lock_updateKnownCaptureApplications:v4];
  os_unfair_lock_unlock(&self->_lock);

  _Block_object_dispose(&v6, 8);
}

void __73__LCSCaptureApplicationMonitor__reevaluateCaptureApplicationRequirements__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 40) knownCaptureExtensions];
  uint64_t v3 = [v2 setWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_lock_evaluateCaptureApplicationRequirementsForKnownExtensions:(id)a3
{
  lock_knownCaptureApplicationsByBundleIdentifier = self->_lock_knownCaptureApplicationsByBundleIdentifier;
  id v5 = a3;
  id v6 = (void *)[(NSDictionary *)lock_knownCaptureApplicationsByBundleIdentifier copy];
  v7 = [(LCSCaptureApplicationMonitor *)self _captureApplicationsFromKnownExtensions:v5 currentCaptureApplications:v6];

  uint64_t v8 = (void *)[v7 copy];
  return v8;
}

- (void)_lock_updateKnownCaptureApplications:(id)a3
{
  id v5 = a3;
  id v6 = (void *)[(NSDictionary *)self->_lock_knownCaptureApplicationsByBundleIdentifier copy];
  objc_storeStrong((id *)&self->_lock_knownCaptureApplicationsByBundleIdentifier, a3);
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = [v5 allKeys];
  int v9 = [v7 setWithArray:v8];

  v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = [v6 allKeys];
  id v12 = [v10 setWithArray:v11];

  if (([v12 isEqualToSet:v9] & 1) == 0)
  {
    id v13 = [v5 allKeys];
    [(LCSCaptureApplicationMonitor *)self _updateTCCMonitorForBundleIdentifiers:v13];
  }
  id v14 = (void *)MEMORY[0x263EFFA08];
  objc_super v15 = [v5 allValues];
  v16 = [v14 setWithArray:v15];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__LCSCaptureApplicationMonitor__lock_updateKnownCaptureApplications___block_invoke;
  block[3] = &unk_2653BEAB8;
  block[4] = self;
  id v21 = v16;
  id v22 = v6;
  id v18 = v6;
  id v19 = v16;
  dispatch_async(queue, block);
}

id __69__LCSCaptureApplicationMonitor__lock_updateKnownCaptureApplications___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 captureApplicationProvider:*(void *)(a1 + 32) didUpdateKnownApplications:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return self;
}

- (void)_queue_start
{
}

- (void)_queue_cancel
{
}

- (void)_beginObservingMetadataChanges
{
  if (!self->_metadataChangedObserverToken)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = [MEMORY[0x263F087C8] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F51E08];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__LCSCaptureApplicationMonitor__beginObservingMetadataChanges__block_invoke;
    v7[3] = &unk_2653BEAE0;
    objc_copyWeak(&v8, &location);
    uint64_t v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];

    metadataChangedObserverToken = self->_metadataChangedObserverToken;
    self->_metadataChangedObserverToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __62__LCSCaptureApplicationMonitor__beginObservingMetadataChanges__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v6 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F51E10]];

    [WeakRetained _processMetadataChangeForBundleIdentifiers:v5];
  }
}

- (void)_processMetadataChangeForBundleIdentifiers:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__LCSCaptureApplicationMonitor__processMetadataChangeForBundleIdentifiers___block_invoke;
  block[3] = &unk_2653BEA90;
  block[4] = self;
  void block[5] = &v27;
  dispatch_sync(queue, block);
  if ([(id)v28[5] count])
  {
    id v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", 2 * objc_msgSend((id)v28[5], "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (id)v28[5];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v12 = [v11 bundleIdentifier];
          [v6 addObject:v12];

          id v13 = [v11 containerBundleIdentifier];
          [v6 addObject:v13];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v8);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v19;
      while (2)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend(v6, "containsObject:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18))
          {

            goto LABEL_20;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v33 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if (!v14) {
LABEL_20:
    }
      [(LCSCaptureApplicationMonitor *)self _reevaluateCaptureApplicationRequirements];
  }
  _Block_object_dispose(&v27, 8);
}

uint64_t __75__LCSCaptureApplicationMonitor__processMetadataChangeForBundleIdentifiers___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) knownCaptureExtensions];
  return MEMORY[0x270F9A758]();
}

- (void)_endObservingMetadataChanges
{
  uint64_t v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self->_metadataChangedObserverToken];

  metadataChangedObserverToken = self->_metadataChangedObserverToken;
  self->_metadataChangedObserverToken = 0;
}

- (id)_captureApplicationsFromKnownExtensions:(id)a3 currentCaptureApplications:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __99__LCSCaptureApplicationMonitor__captureApplicationsFromKnownExtensions_currentCaptureApplications___block_invoke;
  v14[3] = &unk_2653BEB08;
  v14[4] = self;
  id v15 = v6;
  id v9 = v8;
  id v16 = v9;
  id v10 = v6;
  objc_msgSend(v7, "bs_each:", v14);

  long long v11 = v16;
  id v12 = v9;

  return v12;
}

void __99__LCSCaptureApplicationMonitor__captureApplicationsFromKnownExtensions_currentCaptureApplications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 containerBundleIdentifier];
  uint64_t v5 = [v3 bundleIdentifier];
  int v6 = [(id)objc_opt_class() _hasCaptureAppIntentForBundleIdentifier:v4 extensionBundleIdentifier:v5];
  int v7 = [(id)objc_opt_class() _hasCameraUsageDescriptionForBundleIdentifier:v4];
  int v8 = [(id)objc_opt_class() _hasCameraUsageDescriptionForBundleIdentifier:v5];
  uint64_t v9 = [v3 visibilityOverride];
  id v10 = LCSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138413570;
    id v16 = v4;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 2112;
    long long v20 = v5;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 1024;
    int v24 = v6;
    __int16 v25 = 1024;
    BOOL v26 = v9 == 2;
    _os_log_impl(&dword_255087000, v10, OS_LOG_TYPE_DEFAULT, "Capture Application (%@): appHasCameraUsageDescription: %{BOOL}u; Extension (%@): extensionHasCameraUsageDescripti"
      "on: %{BOOL}u; bundleHasCaptureAppIntent %{BOOL}u, visibilityHidden: %{BOOL}u",
      (uint8_t *)&v15,
      0x2Eu);
  }

  if ((v7 & v8 & v6) == 1 && v9 != 2)
  {
    long long v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
    if (!v11)
    {
      id v12 = +[LCSCaptureApplicationTCCMonitor sharedMonitor];
      uint64_t v13 = [v12 cameraTCCStatusForBundleIdentifier:v4];

      id v14 = [[LCSCaptureApplicationAttributes alloc] initWithCameraTCCStatus:v13];
      long long v11 = [[LCSCaptureApplication alloc] initWithExtensionInfo:v3 attributes:v14];
    }
    [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v4];
  }
}

- (void)_updateTCCMonitorForBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id v7 = +[LCSCaptureApplicationTCCMonitor sharedMonitor];
  uint64_t v5 = [v7 addObserver:self forBundleIdentifiers:v4];

  tccObservationToken = self->_tccObservationToken;
  self->_tccObservationToken = v5;
}

- (void)captureExtensionProvider:(id)a3 didUpdateKnownExtensions:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  id v7 = [(LCSCaptureApplicationMonitor *)self _lock_evaluateCaptureApplicationRequirementsForKnownExtensions:v6];

  [(LCSCaptureApplicationMonitor *)self _lock_updateKnownCaptureApplications:v7];
  os_unfair_lock_unlock(p_lock);
}

- (void)tccMonitor:(id)a3 didUpdateCameraTCCStatuses:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)[(NSDictionary *)self->_lock_knownCaptureApplicationsByBundleIdentifier mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "bundleIdentifier", lock);
        uint64_t v13 = [(NSDictionary *)self->_lock_knownCaptureApplicationsByBundleIdentifier objectForKeyedSubscript:v12];
        if (v13)
        {
          id v14 = -[LCSCaptureApplicationAttributes initWithCameraTCCStatus:]([LCSCaptureApplicationAttributes alloc], "initWithCameraTCCStatus:", [v11 tccStatus]);
          int v15 = [LCSCaptureApplication alloc];
          id v16 = [v13 extension];
          __int16 v17 = [(LCSCaptureApplication *)v15 initWithExtensionInfo:v16 attributes:v14];

          [v6 setObject:v17 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  int v18 = (void *)[v6 copy];
  [(LCSCaptureApplicationMonitor *)self _lock_updateKnownCaptureApplications:v18];

  os_unfair_lock_unlock(lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccObservationToken, 0);
  objc_storeStrong((id *)&self->_metadataChangedObserverToken, 0);
  objc_storeStrong((id *)&self->_firstUnlockManager, 0);
  objc_storeStrong((id *)&self->_queue_extensionMonitor, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock_knownCaptureApplicationsByBundleIdentifier, 0);
}

+ (void)_bundleRecordForBundleIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_255087000, a3, OS_LOG_TYPE_ERROR, "Unable to resolve bundle record for %@: %@", (uint8_t *)&v6, 0x16u);
}

@end