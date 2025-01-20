@interface HULocationDeviceManager
+ (HULocationDeviceManager)sharedInstance;
- (HULocationDeviceManager)init;
- (NAFuture)activeFMFDeviceFuture;
- (NAFuture)thisDeviceFuture;
- (NSHashTable)observers;
- (_TtC6HomeUI19FindMyLocateSession)findMyLocateSession;
- (id)updateActiveLocationDeviceToThisDevice;
- (void)_updateActiveFMFDevice:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didChangeActiveLocationSharingDevice:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveFMFDeviceFuture:(id)a3;
- (void)setThisDeviceFuture:(id)a3;
- (void)startUpdatingFindMyPreferences;
- (void)stopUpdatingFindMyPreferences;
@end

@implementation HULocationDeviceManager

+ (HULocationDeviceManager)sharedInstance
{
  if (qword_1EBA47890 != -1) {
    dispatch_once(&qword_1EBA47890, &__block_literal_global_180);
  }
  v2 = (void *)qword_1EBA47888;

  return (HULocationDeviceManager *)v2;
}

void __41__HULocationDeviceManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HULocationDeviceManager);
  v1 = (void *)qword_1EBA47888;
  qword_1EBA47888 = (uint64_t)v0;
}

- (HULocationDeviceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HULocationDeviceManager;
  v2 = [(HULocationDeviceManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC6HomeUI19FindMyLocateSession);
    findMyLocateSession = v2->_findMyLocateSession;
    v2->_findMyLocateSession = v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    [(HULocationDeviceManager *)v2 startUpdatingFindMyPreferences];
  }
  return v2;
}

- (void)dealloc
{
  [(HULocationDeviceManager *)self stopUpdatingFindMyPreferences];
  v3.receiver = self;
  v3.super_class = (Class)HULocationDeviceManager;
  [(HULocationDeviceManager *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HULocationDeviceManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HULocationDeviceManager *)self observers];
  [v5 removeObject:v4];
}

- (void)startUpdatingFindMyPreferences
{
  objc_initWeak(&location, self);
  [(FindMyLocateSession *)self->_findMyLocateSession startMonitoringPrefrenceChangesWithCompletionHandler:&__block_literal_global_189];
  findMyLocateSession = self->_findMyLocateSession;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__HULocationDeviceManager_startUpdatingFindMyPreferences__block_invoke_190;
  v4[3] = &unk_1E638BCC0;
  objc_copyWeak(&v5, &location);
  [(FindMyLocateSession *)findMyLocateSession setMeDeviceUpdateCallback:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__HULocationDeviceManager_startUpdatingFindMyPreferences__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = HFLogForCategory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "findmylocate: startMonitoringPrefrenceChanges error %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "findmylocate: startMonitoringPrefrenceChanges completed successfully", (uint8_t *)&v5, 2u);
  }
}

void __57__HULocationDeviceManager_startUpdatingFindMyPreferences__block_invoke_190(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "findmylocate: didUpdateMeDevice: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HULocationDeviceManager_startUpdatingFindMyPreferences__block_invoke_191;
  v6[3] = &unk_1E63882F0;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v8);
}

void __57__HULocationDeviceManager_startUpdatingFindMyPreferences__block_invoke_191(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didChangeActiveLocationSharingDevice:*(void *)(a1 + 32)];
}

- (void)stopUpdatingFindMyPreferences
{
}

void __56__HULocationDeviceManager_stopUpdatingFindMyPreferences__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "findmylocate: stopMonitoringPrefrenceChanges error %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "findmylocate: stopMonitoringPrefrenceChanges completed successfully", (uint8_t *)&v5, 2u);
  }
}

- (NAFuture)activeFMFDeviceFuture
{
  activeFMFDeviceFuture = self->_activeFMFDeviceFuture;
  if (!activeFMFDeviceFuture)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    int v5 = [(HULocationDeviceManager *)self findMyLocateSession];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__HULocationDeviceManager_activeFMFDeviceFuture__block_invoke;
    v12[3] = &unk_1E638BCE8;
    id v6 = v4;
    id v13 = v6;
    [v5 getActiveLocationSharingDeviceWithCompletionHandler:v12];

    uint64_t v7 = self->_activeFMFDeviceFuture;
    self->_activeFMFDeviceFuture = (NAFuture *)v6;
    id v8 = v6;

    activeFMFDeviceFuture = self->_activeFMFDeviceFuture;
  }
  v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v10 = [(NAFuture *)activeFMFDeviceFuture reschedule:v9];

  return (NAFuture *)v10;
}

void __48__HULocationDeviceManager_activeFMFDeviceFuture__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  uint64_t v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
LABEL_7:
    uint64_t v11 = (void *)v10;
    [v9 finishWithError:v10];

    goto LABEL_8;
  }
  if (!v5)
  {
    v9 = *(void **)(a1 + 32);
    if (v6)
    {
      [v9 finishWithError:v6];
      goto LABEL_8;
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "na_genericError");
    goto LABEL_7;
  }
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    unint64_t v13 = v5;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "findmylocate: successfully fetched me device %@", (uint8_t *)&v12, 0xCu);
  }

  [*(id *)(a1 + 32) finishWithResult:v5];
LABEL_8:
}

- (id)updateActiveLocationDeviceToThisDevice
{
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "findmylocate: Updating active location device to this device", buf, 2u);
  }

  *(void *)buf = 0;
  v17 = buf;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__17;
  v20 = __Block_byref_object_dispose__17;
  id v21 = 0;
  id v4 = [(HULocationDeviceManager *)self findMyLocateSession];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__HULocationDeviceManager_updateActiveLocationDeviceToThisDevice__block_invoke;
  v15[3] = &unk_1E6386900;
  v15[4] = buf;
  [v4 getThisDeviceWithCompletionHandler:v15];

  id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  unint64_t v6 = [(HULocationDeviceManager *)self findMyLocateSession];
  uint64_t v7 = [v5 errorOnlyCompletionHandlerAdapter];
  [v6 setActiveLocationSharingDeviceToThisDeviceWithCompletionHandler:v7];

  id v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v9 = [v5 reschedule:v8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HULocationDeviceManager_updateActiveLocationDeviceToThisDevice__block_invoke_199;
  v14[3] = &unk_1E638BD10;
  v14[4] = self;
  v14[5] = buf;
  uint64_t v10 = [v9 addSuccessBlock:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HULocationDeviceManager_updateActiveLocationDeviceToThisDevice__block_invoke_201;
  v13[3] = &unk_1E638BD38;
  v13[4] = buf;
  uint64_t v11 = [v10 addFailureBlock:v13];

  _Block_object_dispose(buf, 8);

  return v11;
}

void __65__HULocationDeviceManager_updateActiveLocationDeviceToThisDevice__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "findmylocate: Failed to update active location device to this device, no thisDevice Id", v8, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

uint64_t __65__HULocationDeviceManager_updateActiveLocationDeviceToThisDevice__block_invoke_199(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "findmylocate: Successfully updated active location device to this device: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) _updateActiveFMFDevice:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __65__HULocationDeviceManager_updateActiveLocationDeviceToThisDevice__block_invoke_201(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_1BE345000, v2, OS_LOG_TYPE_ERROR, "Failed to update active location device to this device: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (NAFuture)thisDeviceFuture
{
  thisDeviceFuture = self->_thisDeviceFuture;
  if (!thisDeviceFuture)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    uint64_t v5 = [(HULocationDeviceManager *)self findMyLocateSession];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__HULocationDeviceManager_thisDeviceFuture__block_invoke;
    v12[3] = &unk_1E638BCE8;
    id v6 = v4;
    id v13 = v6;
    [v5 getThisDeviceWithCompletionHandler:v12];

    uint64_t v7 = self->_thisDeviceFuture;
    self->_thisDeviceFuture = (NAFuture *)v6;
    id v8 = v6;

    thisDeviceFuture = self->_thisDeviceFuture;
  }
  v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  uint64_t v10 = [(NAFuture *)thisDeviceFuture reschedule:v9];

  return (NAFuture *)v10;
}

void __43__HULocationDeviceManager_thisDeviceFuture__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  uint64_t v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
LABEL_7:
    uint64_t v11 = (void *)v10;
    [v9 finishWithError:v10];

    goto LABEL_8;
  }
  if (!v5)
  {
    v9 = *(void **)(a1 + 32);
    if (v6)
    {
      [v9 finishWithError:v6];
      goto LABEL_8;
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "na_genericError");
    goto LABEL_7;
  }
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    unint64_t v13 = v5;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "findmylocate: successfully fetched this device %@", (uint8_t *)&v12, 0xCu);
  }

  [*(id *)(a1 + 32) finishWithResult:v5];
LABEL_8:
}

- (void)_updateActiveFMFDevice:(id)a3
{
  id v8 = a3;
  activeFMFDeviceFuture = self->_activeFMFDeviceFuture;
  if (activeFMFDeviceFuture && ([(NAFuture *)activeFMFDeviceFuture isFinished] & 1) == 0) {
    unint64_t v5 = self->_activeFMFDeviceFuture;
  }
  else {
    unint64_t v5 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  }
  unint64_t v6 = v5;
  if (v8)
  {
    [(NAFuture *)v5 finishWithResult:v8];
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    [(NAFuture *)v6 finishWithError:v7];
  }
  [(HULocationDeviceManager *)self setActiveFMFDeviceFuture:v6];
}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "findmylocate: didChangeActiveLocationSharingDevice: %@", buf, 0xCu);
  }

  [(HULocationDeviceManager *)self _updateActiveFMFDevice:v4];
  objc_initWeak((id *)buf, self);
  unint64_t v6 = [(HULocationDeviceManager *)self activeLocationDeviceFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HULocationDeviceManager_didChangeActiveLocationSharingDevice___block_invoke;
  v8[3] = &unk_1E638BCC0;
  objc_copyWeak(&v9, (id *)buf);
  id v7 = (id)[v6 addSuccessBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __64__HULocationDeviceManager_didChangeActiveLocationSharingDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = objc_msgSend(WeakRetained, "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 locationDeviceManager:WeakRetained didUpdateActiveLocationDevice:v3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setThisDeviceFuture:(id)a3
{
}

- (_TtC6HomeUI19FindMyLocateSession)findMyLocateSession
{
  return self->_findMyLocateSession;
}

- (void)setActiveFMFDeviceFuture:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeFMFDeviceFuture, 0);
  objc_storeStrong((id *)&self->_findMyLocateSession, 0);

  objc_storeStrong((id *)&self->_thisDeviceFuture, 0);
}

@end