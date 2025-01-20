@interface HKClinicalSharingSyncObserver
- (HKClinicalSharingSyncObserver)initWithConnection:(id)a3 delegateQueue:(id)a4;
- (HKClinicalSharingSyncObserver)initWithDelegateQueue:(id)a3;
- (HKClinicalSharingSyncObserverDelegate)delegate;
- (void)client_syncDidFinishWithError:(id)a3;
- (void)client_syncDidStartWithInfo:(id)a3;
- (void)connectionInterrupted;
- (void)invalidate;
- (void)resume;
- (void)resumeWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HKClinicalSharingSyncObserver

- (HKClinicalSharingSyncObserver)initWithDelegateQueue:(id)a3
{
  id v4 = a3;
  v5 = +[HKHealthRecordsDaemonConnection sharedConnection];
  v6 = [(HKClinicalSharingSyncObserver *)self initWithConnection:v5 delegateQueue:v4];

  return v6;
}

- (HKClinicalSharingSyncObserver)initWithConnection:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKClinicalSharingSyncObserver;
  v8 = [(HKClinicalSharingSyncObserver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegateQueue, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    v10 = [[HKHealthRecordsDaemonProxyProvider alloc] initWithConnection:v6 serviceIdentifier:@"ClinicalSharingSyncObserver" exportedObject:v9];
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = &v10->super;
  }
  return v9;
}

- (void)resume
{
}

- (void)resumeWithCompletion:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKClinicalSharingSyncObserver.m" lineNumber:59 description:@"Delegate must be set before resume"];
  }
  os_unfair_lock_lock(&self->_lock);
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke;
  v15[3] = &unk_2645EF628;
  id v16 = v5;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_290;
  objc_super v13 = &unk_2645EE630;
  id v14 = v16;
  id v8 = v16;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:&v10];
  -[HKProxyProvider setAutomaticProxyReconnectionHandler:](self->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &__block_literal_global_295_0, v10, v11, v12, v13);
  os_unfair_lock_unlock(&self->_lock);
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2;
  v3[3] = &unk_2645EF600;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_startObservingSyncStatusWithCompletion:", v3);
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_290(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_292(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "remote_startObservingSyncStatusWithCompletion:", &__block_literal_global_298_0);
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_296(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v5 = *MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_296_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_didSyncStart = 0;
  [(HKProxyProvider *)self->_proxyProvider setAutomaticProxyReconnectionHandler:0];
  [(HKProxyProvider *)self->_proxyProvider invalidate];

  os_unfair_lock_unlock(p_lock);
}

- (void)client_syncDidFinishWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x263F09908];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = v5;
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2114;
      id v19 = v4;
      uint64_t v8 = "%@: sync failed: %{public}@";
      uint64_t v9 = v7;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_221D38000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
  else if (v6)
  {
    uint64_t v7 = v5;
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = objc_opt_class();
    uint64_t v8 = "%@: sync finished";
    uint64_t v9 = v7;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_didSyncStart = 0;
  delegateQueue = self->_delegateQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__HKClinicalSharingSyncObserver_client_syncDidFinishWithError___block_invoke;
  v14[3] = &unk_2645EF670;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(delegateQueue, v14);
  os_unfair_lock_unlock(p_lock);
}

void __63__HKClinicalSharingSyncObserver_client_syncDidFinishWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 clinicalSharingSyncObserver:*(void *)(a1 + 32) syncDidFinishWithError:*(void *)(a1 + 40)];
}

- (void)client_syncDidStartWithInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_221D38000, v6, OS_LOG_TYPE_DEFAULT, "%@: sync did start: %{public}@", buf, 0x16u);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_didSyncStart = 1;
  delegateQueue = self->_delegateQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HKClinicalSharingSyncObserver_client_syncDidStartWithInfo___block_invoke;
  v10[3] = &unk_2645EF670;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(delegateQueue, v10);
  os_unfair_lock_unlock(p_lock);
}

void __61__HKClinicalSharingSyncObserver_client_syncDidStartWithInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 clinicalSharingSyncObserver:*(void *)(a1 + 32) syncDidStartWithInfo:*(void *)(a1 + 40)];
}

- (void)connectionInterrupted
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didSyncStart)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__HKClinicalSharingSyncObserver_connectionInterrupted__block_invoke;
    block[3] = &unk_2645EF698;
    block[4] = self;
    dispatch_async(delegateQueue, block);
    self->_didSyncStart = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

void __54__HKClinicalSharingSyncObserver_connectionInterrupted__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4097 userInfo:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 clinicalSharingSyncObserver:*(void *)(a1 + 32) syncDidFinishWithError:v3];
}

- (HKClinicalSharingSyncObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKClinicalSharingSyncObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_296_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end