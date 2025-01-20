@interface HKCloudSyncObserver
+ (id)clientInterface;
+ (id)serverInterface;
- (HKCloudSyncObserver)initWithHealthStore:(id)a3 delegate:(id)a4;
- (HKCloudSyncObserverDelegate)delegate;
- (HKCloudSyncObserverStatus)status;
- (id)exportedInterface;
- (id)progress;
- (id)remoteInterface;
- (void)_clientQueue_didCompleteSyncWithStatus:(int64_t)a3 error:(id)a4;
- (void)clientRemote_didFailToPopulateStatusWithError:(id)a3;
- (void)clientRemote_didUpdateObserverWithSyncStatus:(id)a3;
- (void)clientRemote_syncDidStart;
- (void)clientRemote_syncRequestDidComplete:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)clientRemote_syncRequestDidStart:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProgress:(id)a3;
- (void)setStatus:(id)a3;
- (void)startObservingSyncRequestsMatchingFilter:(unint64_t)a3;
- (void)startObservingSyncStatus;
- (void)startSyncIfRestoreNotCompleted;
- (void)stopObservingSyncRequests;
@end

@implementation HKCloudSyncObserver

- (HKCloudSyncObserver)initWithHealthStore:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKCloudSyncObserver;
  v8 = [(HKCloudSyncObserver *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v11 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v6 taskIdentifier:@"HKCloudSyncObserverServerIdentifier" exportedObject:v8 taskUUID:v8->_identifier];
    proxyProvider = v8->_proxyProvider;
    v8->_proxyProvider = v11;

    [(HKProxyProvider *)v8->_proxyProvider setShouldRetryOnInterruption:0];
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_filter = 0;
    *(_WORD *)&v8->_isObservingSyncRequests = 0;
    objc_initWeak(&location, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__HKCloudSyncObserver_initWithHealthStore_delegate___block_invoke;
    v14[3] = &unk_1E58BE428;
    objc_copyWeak(&v15, &location);
    [(HKProxyProvider *)v8->_proxyProvider setAutomaticProxyReconnectionHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __52__HKCloudSyncObserver_initWithHealthStore_delegate___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 12;
    id v6 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 12);
    int os_unfair_lock_opaque_low = LOBYTE(v6[16]._os_unfair_lock_opaque);
    uint64_t v4 = *(void *)&v6[14]._os_unfair_lock_opaque;
    int v5 = BYTE1(v6[16]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v2);
    if (os_unfair_lock_opaque_low) {
      [(os_unfair_lock_s *)v6 startObservingSyncRequestsMatchingFilter:v4];
    }
    WeakRetained = v6;
    if (v5)
    {
      [(os_unfair_lock_s *)v6 startObservingSyncStatus];
      WeakRetained = v6;
    }
  }
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HKCloudSyncObserverDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HKCloudSyncObserverDelegate *)WeakRetained;
}

- (HKCloudSyncObserverStatus)status
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_status;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setStatus:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (HKCloudSyncObserverStatus *)[v5 copy];

  status = self->_status;
  self->_status = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)startObservingSyncStatus
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isObservingSyncStatus = 1;
  os_unfair_lock_unlock(p_lock);
  proxyProvider = self->_proxyProvider;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke;
  v6[3] = &unk_1E58C0A38;
  v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_172;
  v5[3] = &unk_1E58BBCC0;
  v5[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v6 errorHandler:v5];
}

uint64_t __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_2;
  v3[3] = &unk_1E58BBA00;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingSyncStatusWithCompletion:", v3);
}

void __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Started observing sync status", (uint8_t *)&v4, 0xCu);
  }
}

void __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_172()
{
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_172_cold_1();
  }
}

- (void)clientRemote_didUpdateObserverWithSyncStatus:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_status, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HKCloudSyncObserver_clientRemote_didUpdateObserverWithSyncStatus___block_invoke;
  block[3] = &unk_1E58BB9C8;
  id v11 = WeakRetained;
  v12 = self;
  id v13 = v5;
  id v8 = v5;
  id v9 = WeakRetained;
  dispatch_sync(v7, block);
}

uint64_t __68__HKCloudSyncObserver_clientRemote_didUpdateObserverWithSyncStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cloudSyncObserverStatusUpdated:*(void *)(a1 + 40) status:*(void *)(a1 + 48)];
}

- (void)clientRemote_didFailToPopulateStatusWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HKCloudSyncObserver_clientRemote_didFailToPopulateStatusWithError___block_invoke;
  block[3] = &unk_1E58BB9C8;
  id v10 = WeakRetained;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = WeakRetained;
  dispatch_sync(v6, block);
}

uint64_t __69__HKCloudSyncObserver_clientRemote_didFailToPopulateStatusWithError___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 cloudSyncObserver:v4 didFailToPopulateStatusWithError:v5];
  }
  return result;
}

- (id)progress
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_progress;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setProgress:(id)a3
{
  uint64_t v4 = (NSProgress *)a3;
  os_unfair_lock_lock(&self->_lock);
  progress = self->_progress;
  self->_progress = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)startSyncIfRestoreNotCompleted
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke;
  aBlock[3] = &unk_1E58C0A60;
  aBlock[4] = self;
  uint64_t v3 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_3;
  v8[3] = &unk_1E58C0A88;
  v8[4] = self;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_4;
  v6[3] = &unk_1E58BBC48;
  v6[4] = self;
  id v7 = v9;
  id v5 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v8 errorHandler:v6];
}

void __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_2;
  block[3] = &unk_1E58BBBF8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = a2;
  void block[4] = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_didCompleteSyncWithStatus:error:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

void __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a2;
  id v7 = [v4 UUID];
  uint64_t v6 = objc_msgSend(v5, "remote_startSyncIfRestoreNotCompletedWithUUID:completion:", v7, *(void *)(a1 + 40));

  [v3 setProgress:v6];
}

void __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_4_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_clientQueue_didCompleteSyncWithStatus:(int64_t)a3 error:(id)a4
{
  id v8 = a4;
  uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  dispatch_assert_queue_V2(v6);

  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  if (a3 == 2)
  {
    [WeakRetained cloudSyncObserverSyncCompleted:self];
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    [WeakRetained cloudSyncObserver:self syncFailedWithError:v8];
  }
}

- (void)clientRemote_syncDidStart
{
}

uint64_t __48__HKCloudSyncObserver_clientRemote_syncDidStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cloudSyncObserver:*(void *)(a1 + 40) syncDidStartWithProgress:*(void *)(*(void *)(a1 + 40) + 24)];
}

- (void)startObservingSyncRequestsMatchingFilter:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_filter = a3;
  self->_isObservingSyncRequests = 1;
  os_unfair_lock_unlock(p_lock);
  proxyProvider = self->_proxyProvider;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke;
  v8[3] = &__block_descriptor_40_e46_v16__0___HKCloudSyncObserverServerInterface__8l;
  v8[4] = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke_2;
  v7[3] = &unk_1E58BBCC0;
  v7[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v8 errorHandler:v7];
}

uint64_t __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingSyncRequestsMatchingFilter:", *(void *)(a1 + 32));
}

void __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke_2()
{
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke_2_cold_1();
  }
}

- (void)stopObservingSyncRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_filter = 0;
  self->_isObservingSyncRequests = 0;
  os_unfair_lock_unlock(p_lock);
  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke_2;
  v5[3] = &unk_1E58BBCC0;
  v5[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_30 errorHandler:v5];
}

uint64_t __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingSyncRequests");
}

void __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke_2()
{
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke_2_cold_1();
  }
}

- (void)clientRemote_syncRequestDidStart:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke;
  v8[3] = &unk_1E58C0AF0;
  id v9 = v4;
  id v10 = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_4;
  v7[3] = &unk_1E58BBCC0;
  v7[4] = self;
  id v6 = v4;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v8 errorHandler:v7];
}

void __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke(int8x16_t *a1, void *a2)
{
  id v3 = (void *)a1[2].i64[0];
  id v4 = a2;
  id v5 = [v3 identifier];
  id v6 = objc_msgSend(v4, "remote_retrieveProgressForIdentifier:completion:", v5, &__block_literal_global_179);

  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 48));
  id WeakRetained = objc_loadWeakRetained((id *)(a1[2].i64[1] + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 48));
  id v8 = [*(id *)(a1[2].i64[1] + 16) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_3;
  block[3] = &unk_1E58C0930;
  id v14 = WeakRetained;
  int8x16_t v12 = a1[2];
  id v9 = (id)v12.i64[0];
  int8x16_t v15 = vextq_s8(v12, v12, 8uLL);
  id v16 = v6;
  id v10 = v6;
  id v11 = WeakRetained;
  dispatch_async(v8, block);
}

uint64_t __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_3(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 cloudSyncObserver:v4 syncStartedForRequest:v5 withProgress:v6];
  }
  return result;
}

void __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_4()
{
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_4_cold_1();
  }
}

- (void)clientRemote_syncRequestDidComplete:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  id v11 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HKCloudSyncObserver_clientRemote_syncRequestDidComplete_success_error___block_invoke;
  block[3] = &unk_1E58C0B18;
  BOOL v20 = a4;
  id v16 = WeakRetained;
  objc_super v17 = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = WeakRetained;
  dispatch_sync(v11, block);
}

uint64_t __73__HKCloudSyncObserver_clientRemote_syncRequestDidComplete_success_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      return [v3 cloudSyncObserver:v4 syncCompletedForRequest:v5];
    }
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      return [v6 cloudSyncObserver:v7 syncFailedForRequest:v8 error:v9];
    }
  }
  return result;
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED524F0];
}

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECFF500];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_clientRemote_didUpdateObserverWithSyncStatus_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

void __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_172_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Failed to call remote method startObservingSyncStatusWithCompletion:", v2, v3, v4, v5, v6);
}

void __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Failed to call remote method startSyncIfRestoreNotCompletedWithUUID:completion", v2, v3, v4, v5, v6);
}

void __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Failed to call remote method startObservingSyncRequestsWithFilter:", v2, v3, v4, v5, v6);
}

void __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Failed to call remote method stopObservingSyncRequests", v2, v3, v4, v5, v6);
}

void __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Failed to call remote method retrieveProgressForIdentifier::completion:", v2, v3, v4, v5, v6);
}

@end