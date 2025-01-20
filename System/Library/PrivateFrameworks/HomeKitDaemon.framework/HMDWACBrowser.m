@interface HMDWACBrowser
+ (id)logCategory;
- (BOOL)scanIsActive;
- (HMDWACBrowser)initWithWACScanner:(id)a3 messageDispatcher:(id)a4;
- (HMDWACBrowserDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (void)clearBackoff;
- (void)requestBackoff;
- (void)scanner:(id)a3 didAddDevice:(id)a4;
- (void)scanner:(id)a3 didError:(id)a4;
- (void)scanner:(id)a3 didRemoveDevice:(id)a4;
- (void)scanner:(id)a3 didUpdateDevice:(id)a4;
- (void)scannerDidStop:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setScanIsActive:(BOOL)a3;
- (void)startBrowsingForAccessories;
- (void)startBrowsingForAirPlayWACAccessoriesWithBrowser:(id)a3;
- (void)stopBrowsingForAccessories;
@end

@implementation HMDWACBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_unassociatedAccessories, 0);
  objc_storeStrong((id *)&self->_wacScanner, 0);
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

- (HMDWACBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDWACBrowserDelegate *)WeakRetained;
}

- (void)setScanIsActive:(BOOL)a3
{
  self->_scanIsActive = a3;
}

- (BOOL)scanIsActive
{
  return self->_scanIsActive;
}

- (void)scannerDidStop:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@WAC Scan Stopped...", buf, 0xCu);
  }
  if ([(HMDWACBrowser *)v6 scanIsActive])
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = v6;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = 2;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Scan was still flagged as active, restarting after %lu seconds...", buf, 0x16u);
    }
    __removeAllAccessories(v10);
    dispatch_time_t v13 = dispatch_time(0, 2000000000);
    dispatchQueue = v10->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__HMDWACBrowser_scannerDidStop___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v10;
    dispatch_after(v13, dispatchQueue, block);
  }
}

uint64_t __32__HMDWACBrowser_scannerDidStop___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) start];
}

- (void)scanner:(id)a3 didError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    dispatch_time_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error while scanning for WAC devices: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)scanner:(id)a3 didUpdateDevice:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = v7;
  unassociatedAccessories = v8->_unassociatedAccessories;
  v11 = [v9 identifier];
  int v12 = [(NSMutableDictionary *)unassociatedAccessories objectForKey:v11];

  if (v12)
  {
    dispatch_time_t v13 = (void *)MEMORY[0x230FBD990]();
    __int16 v14 = v8;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      v17 = [v12 wacDevice];
      *(_DWORD *)uint64_t v20 = 138543874;
      *(void *)&v20[4] = v16;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v17;
      *(_WORD *)&v20[22] = 2112;
      v21 = v9;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating WAC device: %@ -> %@", v20, 0x20u);
    }
    [v12 setWACDevice:v9];
    __int16 v18 = [(HMDWACBrowser *)v14 delegate];
    if (v18)
    {
      uint64_t v19 = [(HMDWACBrowser *)v14 delegateQueue];
      *(void *)uint64_t v20 = MEMORY[0x263EF8330];
      *(void *)&v20[8] = 3221225472;
      *(void *)&v20[16] = ____updateDevice_block_invoke;
      v21 = &unk_264A2F820;
      id v22 = v18;
      id v23 = v12;
      dispatch_async(v19, v20);
    }
  }
  else
  {
    __addDevice(v8, v9);
  }
}

- (void)scanner:(id)a3 didRemoveDevice:(id)a4
{
  objc_msgSend(a4, "identifier", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  __removeUnassociatedAccessory(self, v5);
}

- (void)scanner:(id)a3 didAddDevice:(id)a4
{
}

- (void)clearBackoff
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Backoff cleared", buf, 0xCu);
  }
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HMDWACBrowser_clearBackoff__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HMDWACBrowser_clearBackoff__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) resume];
}

- (void)requestBackoff
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Backoff requested", buf, 0xCu);
  }
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HMDWACBrowser_requestBackoff__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__HMDWACBrowser_requestBackoff__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) backoff];
}

- (void)stopBrowsingForAccessories
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMDWACBrowser_stopBrowsingForAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__HMDWACBrowser_stopBrowsingForAccessories__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) stop];
  __removeAllAccessories(*(void **)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  return [v2 setScanIsActive:0];
}

- (void)startBrowsingForAirPlayWACAccessoriesWithBrowser:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDWACBrowser_startBrowsingForAirPlayWACAccessoriesWithBrowser___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __66__HMDWACBrowser_startBrowsingForAirPlayWACAccessoriesWithBrowser___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) startDiscoveringAirPlayAccessoriesWithBrowser:*(void *)(a1 + 40)];
}

- (void)startBrowsingForAccessories
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HMDWACBrowser_startBrowsingForAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__HMDWACBrowser_startBrowsingForAccessories__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) scanIsActive];
  if ((result & 1) == 0)
  {
    v3 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setScanIsActive:1]);
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Activating WAC Scanner...", (uint8_t *)&v7, 0xCu);
    }
    return [*(id *)(*(void *)(a1 + 32) + 16) start];
  }
  return result;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMDWACBrowser_setDelegate_queue___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__HMDWACBrowser_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  return [v3 setDelegateQueue:v2];
}

- (HMDWACBrowser)initWithWACScanner:(id)a3 messageDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDWACBrowser;
  id v9 = [(HMDWACBrowser *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageDispatcher, a4);
    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    unassociatedAccessories = v10->_unassociatedAccessories;
    v10->_unassociatedAccessories = v11;

    id v13 = (const char *)HAPDispatchQueueName();
    __int16 v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    dispatchQueue = v10->_dispatchQueue;
    v10->_dispatchQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v10->_wacScanner, a3);
    [(HMDWACScanner *)v10->_wacScanner setDelegate:v10 queue:v10->_dispatchQueue];
    v10->_scanIsActive = 0;
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_160748 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_160748, &__block_literal_global_160749);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v10_160750;
  return v2;
}

void __28__HMDWACBrowser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_160750;
  logCategory__hmf_once_v10_160750 = v0;
}

@end