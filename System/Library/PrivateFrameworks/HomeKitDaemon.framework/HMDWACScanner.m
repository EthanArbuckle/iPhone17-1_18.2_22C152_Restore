@interface HMDWACScanner
+ (id)logCategory;
- (HMDWACScanner)init;
- (HMDWACScannerDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (void)backoff;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)start;
- (void)startDiscoveringAirPlayAccessoriesWithBrowser:(id)a3;
- (void)stop;
- (void)wacBrowser:(id)a3 didFindAirPlayDevice:(id)a4;
- (void)wacBrowser:(id)a3 didRemoveAirPlayDevice:(id)a4;
- (void)wacBrowser:(id)a3 didUpdateAirPlayDevice:(id)a4;
@end

@implementation HMDWACScanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wifiScanner, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HMDWACScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDWACScannerDelegate *)WeakRetained;
}

- (void)wacBrowser:(id)a3 didUpdateAirPlayDevice:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HMDWACScanner_wacBrowser_didUpdateAirPlayDevice___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void __51__HMDWACScanner_wacBrowser_didUpdateAirPlayDevice___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    v6 = [*(id *)(a1 + 40) ssid];
    id v7 = [*(id *)(a1 + 40) identifier];
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@wacBrowser updated device %@: (%@)", buf, 0x20u);
  }
  v8 = [*(id *)(a1 + 32) delegate];
  if (v8)
  {
    id v9 = __wrapCUWiFiDevice(*(void **)(a1 + 32), *(void **)(a1 + 40));
    v10 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__HMDWACScanner_wacBrowser_didUpdateAirPlayDevice___block_invoke_4;
    block[3] = &unk_264A2F2F8;
    id v11 = v8;
    uint64_t v12 = *(void *)(a1 + 32);
    id v15 = v11;
    uint64_t v16 = v12;
    id v17 = v9;
    id v13 = v9;
    dispatch_async(v10, block);
  }
}

uint64_t __51__HMDWACScanner_wacBrowser_didUpdateAirPlayDevice___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanner:*(void *)(a1 + 40) didUpdateDevice:*(void *)(a1 + 48)];
}

- (void)wacBrowser:(id)a3 didRemoveAirPlayDevice:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HMDWACScanner_wacBrowser_didRemoveAirPlayDevice___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void __51__HMDWACScanner_wacBrowser_didRemoveAirPlayDevice___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    v6 = [*(id *)(a1 + 40) ssid];
    id v7 = [*(id *)(a1 + 40) identifier];
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@wacBrowser lost device %@: (%@)", buf, 0x20u);
  }
  v8 = [*(id *)(a1 + 32) delegate];
  if (v8)
  {
    id v9 = __wrapCUWiFiDevice(*(void **)(a1 + 32), *(void **)(a1 + 40));
    v10 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__HMDWACScanner_wacBrowser_didRemoveAirPlayDevice___block_invoke_3;
    block[3] = &unk_264A2F2F8;
    id v11 = v8;
    uint64_t v12 = *(void *)(a1 + 32);
    id v15 = v11;
    uint64_t v16 = v12;
    id v17 = v9;
    id v13 = v9;
    dispatch_async(v10, block);
  }
}

uint64_t __51__HMDWACScanner_wacBrowser_didRemoveAirPlayDevice___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanner:*(void *)(a1 + 40) didRemoveDevice:*(void *)(a1 + 48)];
}

- (void)wacBrowser:(id)a3 didFindAirPlayDevice:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__HMDWACScanner_wacBrowser_didFindAirPlayDevice___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void __49__HMDWACScanner_wacBrowser_didFindAirPlayDevice___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    v6 = [*(id *)(a1 + 40) ssid];
    id v7 = [*(id *)(a1 + 40) identifier];
    *(_DWORD *)buf = 138543874;
    v23 = v5;
    __int16 v24 = 2112;
    v25 = v6;
    __int16 v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@wacBrowser found device %@: (%@)", buf, 0x20u);
  }
  v8 = [*(id *)(a1 + 32) delegate];
  if (v8)
  {
    id v9 = __wrapCUWiFiDevice(*(void **)(a1 + 32), *(void **)(a1 + 40));
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Device %@", buf, 0x16u);
    }
    v14 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__HMDWACScanner_wacBrowser_didFindAirPlayDevice___block_invoke_2;
    block[3] = &unk_264A2F2F8;
    id v15 = v8;
    uint64_t v16 = *(void *)(a1 + 32);
    id v19 = v15;
    uint64_t v20 = v16;
    id v21 = v9;
    id v17 = v9;
    dispatch_async(v14, block);
  }
}

uint64_t __49__HMDWACScanner_wacBrowser_didFindAirPlayDevice___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanner:*(void *)(a1 + 40) didAddDevice:*(void *)(a1 + 48)];
}

- (void)stop
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __21__HMDWACScanner_stop__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __21__HMDWACScanner_stop__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v1 = (id *)*(id *)(a1 + 32);
  if (v1[2])
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = v1;
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Invalidating CUWiFiScanner...", (uint8_t *)&v6, 0xCu);
    }
    [v1[2] invalidate];
  }
}

- (void)resume
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__HMDWACScanner_resume__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __23__HMDWACScanner_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) resume];
}

- (void)backoff
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__HMDWACScanner_backoff__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __24__HMDWACScanner_backoff__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) suspend];
}

- (void)startDiscoveringAirPlayAccessoriesWithBrowser:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMDWACScanner_startDiscoveringAirPlayAccessoriesWithBrowser___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __63__HMDWACScanner_startDiscoveringAirPlayAccessoriesWithBrowser___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startDiscoveringAirPlayAccessoriesWithDelegate:*(void *)(a1 + 40)];
}

- (void)start
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__HMDWACScanner_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __22__HMDWACScanner_start__block_invoke(uint64_t a1)
{
  v19[1] = *(id *)MEMORY[0x263EF8340];
  v1 = (id *)*(id *)(a1 + 32);
  if (!v1[2])
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = v1;
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Initializing CUWiFiScanner...", (uint8_t *)&buf, 0xCu);
    }
    id v6 = objc_alloc_init(MEMORY[0x263F38600]);
    [v6 setLabel:@"homed.wac"];
    [v6 setDispatchQueue:v3[1]];
    objc_initWeak(&location, v3);
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    id v17 = ____start_block_invoke;
    v18 = &unk_264A20C10;
    objc_copyWeak(v19, &location);
    [v6 setDeviceFoundHandler:&buf];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ____start_block_invoke_2;
    v13[3] = &unk_264A20C10;
    objc_copyWeak(&v14, &location);
    [v6 setDeviceLostHandler:v13];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ____start_block_invoke_2_148;
    v11[3] = &unk_264A20C38;
    objc_copyWeak(&v12, &location);
    [v6 setDeviceChangedHandler:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ____start_block_invoke_4;
    v9[3] = &unk_264A2DE60;
    objc_copyWeak(&v10, &location);
    [v6 setErrorHandler:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ____start_block_invoke_2_152;
    v7[3] = &unk_264A2C170;
    objc_copyWeak(&v8, &location);
    [v6 setInvalidationHandler:v7];
    objc_storeStrong(v1 + 2, v6);
    [v6 activate];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMDWACScanner_setDelegate_queue___block_invoke;
  block[3] = &unk_264A2F2F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__HMDWACScanner_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  return [v3 setDelegateQueue:v2];
}

- (HMDWACScanner)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDWACScanner;
  uint64_t v2 = [(HMDWACScanner *)&v8 init];
  if (v2)
  {
    id v3 = (const char *)HAPDispatchQueueName();
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create(v3, v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_133775 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_133775, &__block_literal_global_133776);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v8_133777;
  return v2;
}

void __28__HMDWACScanner_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_133777;
  logCategory__hmf_once_v8_133777 = v0;
}

@end