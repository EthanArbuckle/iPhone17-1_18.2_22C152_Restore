@interface HMDPairedSync
- (HMDPairedSync)initWithDelegate:(id)a3 queue:(id)a4;
- (HMDPairedSyncDelegate)delegate;
- (OS_dispatch_queue)workQueue;
- (PSYSyncCoordinator)coordinator;
- (id)restrictionAsString:(unint64_t)a3;
- (unint64_t)currentOperationCount;
- (void)_callStartSync;
- (void)needToSync;
- (void)setCurrentOperationCount:(unint64_t)a3;
- (void)syncComplete;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)syncPartiallyComplete;
@end

@implementation HMDPairedSync

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (PSYSyncCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCurrentOperationCount:(unint64_t)a3
{
  self->_currentOperationCount = a3;
}

- (unint64_t)currentOperationCount
{
  return self->_currentOperationCount;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDPairedSyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDPairedSyncDelegate *)WeakRetained;
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    v8 = -[HMDPairedSync restrictionAsString:](self, "restrictionAsString:", [v4 syncRestriction]);
    int v9 = 138543618;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Sync restriction is changing to %@", (uint8_t *)&v9, 0x16u);
  }
  if (![v4 syncRestriction]) {
    [(HMDPairedSync *)self _callStartSync];
  }
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    __int16 v11 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received delegate call syncCoordinator:didInvalidateSyncSession", (uint8_t *)&v10, 0xCu);
  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received an update to being-sync-session to watch", (uint8_t *)&v11, 0xCu);
  }
  [(HMDPairedSync *)self _callStartSync];
}

- (void)syncPartiallyComplete
{
  v3 = [(HMDPairedSync *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HMDPairedSync_syncPartiallyComplete__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __38__HMDPairedSync_syncPartiallyComplete__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) currentOperationCount];
  if (v2) {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "setCurrentOperationCount:", objc_msgSend(*(id *)(a1 + 32), "currentOperationCount") - 1);
  }
  v3 = (void *)MEMORY[0x1D9452090](v2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 32) currentOperationCount];
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Partially complete, Current operation count is %tu", (uint8_t *)&v7, 0x16u);
  }
}

- (void)syncComplete
{
  v3 = [(HMDPairedSync *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__HMDPairedSync_syncComplete__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __29__HMDPairedSync_syncComplete__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) currentOperationCount])
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "setCurrentOperationCount:", objc_msgSend(*(id *)(a1 + 32), "currentOperationCount") - 1);
  }
  else
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@Current operation count is already 0, cannot decrement further", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v6 = (void *)MEMORY[0x1D9452090](v2);
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v9 = [*(id *)(a1 + 32) currentOperationCount];
    int v15 = 138543618;
    v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Current operation count is %tu", (uint8_t *)&v15, 0x16u);
  }
  if (![*(id *)(a1 + 32) currentOperationCount])
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Informing sync coordinator that sync is complete", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v13 = [*(id *)(a1 + 32) coordinator];
    v14 = [v13 activeSyncSession];
    [v14 syncDidComplete];
  }
}

- (void)_callStartSync
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDPairedSync *)self delegate];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Calling the clients to start the sync", (uint8_t *)&v7, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [v3 pairedSyncDidStart:self];
    }
  }
}

- (void)needToSync
{
  v3 = [(HMDPairedSync *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__HMDPairedSync_needToSync__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __27__HMDPairedSync_needToSync__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentOperationCount:", objc_msgSend(*(id *)(a1 + 32), "currentOperationCount") + 1);
  uint64_t v2 = [*(id *)(a1 + 32) coordinator];
  uint64_t v3 = [v2 syncRestriction];

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = [*(id *)(a1 + 32) restrictionAsString:v3];
    uint64_t v8 = [*(id *)(a1 + 32) currentOperationCount];
    int v12 = 138543874;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    int v15 = v7;
    __int16 v16 = 2050;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Current sync restriction state: %{public}@, operation count: %{public}tu", (uint8_t *)&v12, 0x20u);
  }
  if (v3)
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Need to wait for the begin sync to happen for HomeKit.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _callStartSync];
  }
}

- (id)restrictionAsString:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"PSYSyncRestrictionLimitPush";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown restriction state: %tu", a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"PSYSyncRestrictionNone";
  }
  return v4;
}

- (HMDPairedSync)initWithDelegate:(id)a3 queue:(id)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDPairedSync;
  uint64_t v6 = [(HMDPairedSync *)&v16 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    HMDispatchQueueNameString();
    id v8 = objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (const char *)[v8 UTF8String];
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v11;

    v7->_currentOperationCount = 0;
    uint64_t v13 = [MEMORY[0x1E4F83B78] syncCoordinatorWithServiceName:@"com.apple.pairedsync.homekit"];
    coordinator = v7->_coordinator;
    v7->_coordinator = (PSYSyncCoordinator *)v13;

    [(PSYSyncCoordinator *)v7->_coordinator setDelegate:v7 queue:v7->_workQueue];
  }

  return v7;
}

@end