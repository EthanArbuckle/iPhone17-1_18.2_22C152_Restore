@interface HMDAccessoryDataStreamAdapter
+ (id)logCategory;
- (BOOL)_handleFrame:(id)a3;
- (BOOL)didBulkSendComplete;
- (BOOL)didBulkSendFail;
- (BOOL)isBulkSendActive;
- (BOOL)isSessionOpenInProgress;
- (BOOL)transportReady;
- (HMDAccessoryDataStreamAdapter)initWithAccessory:(id)a3 workQueue:(id)a4 fileType:(id)a5 metadata:(id)a6 reason:(id)a7;
- (HMDAccessoryDataStreamAdapterDelegate)delegate;
- (HMDDataStreamBulkSendSession)currentBulkSendSession;
- (HMDHAPAccessory)accessory;
- (NSDictionary)metadata;
- (NSString)fileType;
- (NSString)reason;
- (OS_dispatch_queue)workQueue;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)pendingOpenSessionCallback;
- (void)_bulkSendDidComplete;
- (void)_bulkSendDidFail;
- (void)_callPendingOpenSessionCallbackWithResult:(id)a3 error:(id)a4;
- (void)_handleAccessoryDidClose;
- (void)_openSession;
- (void)_setUpTransport;
- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4;
- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4;
- (void)accessoryDidStartListening:(id)a3;
- (void)callPendingOpenSessionCallbackWithResult:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)readData;
- (void)setCurrentBulkSendSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidBulkSendComplete:(BOOL)a3;
- (void)setDidBulkSendFail:(BOOL)a3;
- (void)setPendingOpenSessionCallback:(id)a3;
- (void)setTransportReady:(BOOL)a3;
- (void)setUpWithCallback:(id)a3;
- (void)shutDown;
@end

@implementation HMDAccessoryDataStreamAdapter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingOpenSessionCallback, 0);
  objc_storeStrong((id *)&self->_currentBulkSendSession, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDidBulkSendComplete:(BOOL)a3
{
  self->_didBulkSendComplete = a3;
}

- (BOOL)didBulkSendComplete
{
  return self->_didBulkSendComplete;
}

- (void)setDidBulkSendFail:(BOOL)a3
{
  self->_didBulkSendFail = a3;
}

- (BOOL)didBulkSendFail
{
  return self->_didBulkSendFail;
}

- (void)setTransportReady:(BOOL)a3
{
  self->_transportReady = a3;
}

- (BOOL)transportReady
{
  return self->_transportReady;
}

- (void)setPendingOpenSessionCallback:(id)a3
{
}

- (id)pendingOpenSessionCallback
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentBulkSendSession:(id)a3
{
}

- (HMDDataStreamBulkSendSession)currentBulkSendSession
{
  return (HMDDataStreamBulkSendSession *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMDAccessoryDataStreamAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAccessoryDataStreamAdapterDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryDataStreamAdapter *)self accessory];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4
{
  id v5 = a3;
  v6 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__HMDAccessoryDataStreamAdapter_accessory_didCloseDataStreamWithError___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __71__HMDAccessoryDataStreamAdapter_accessory_didCloseDataStreamWithError___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accessory];
  v3 = *(void **)(a1 + 40);

  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 32) accessory];
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory:%@ closed data stream", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) _handleAccessoryDidClose];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 32) accessory];
      uint64_t v10 = *(void *)(a1 + 40);
      int v13 = 138543874;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Accessory Closed Data Stream, expected accessory: %@ actual accessory: %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)accessoryDidStartListening:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HMDAccessoryDataStreamAdapter_accessoryDidStartListening___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__HMDAccessoryDataStreamAdapter_accessoryDidStartListening___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accessory];
  v3 = *(void **)(a1 + 40);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 32) accessory];
      int v18 = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory:%@ started listening", (uint8_t *)&v18, 0x16u);
    }
    [*(id *)(a1 + 32) setTransportReady:1];
    int v13 = [*(id *)(a1 + 32) pendingOpenSessionCallback];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 32);
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        uint64_t v19 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling pending start bulk send session request", (uint8_t *)&v18, 0xCu);
      }
      [*(id *)(a1 + 32) _openSession];
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 32) accessory];
      uint64_t v10 = *(void *)(a1 + 40);
      int v18 = 138543874;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Accessory start listening failed, expected accessory: %@ actual accessory: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4
{
}

- (void)_bulkSendDidComplete
{
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDAccessoryDataStreamAdapter *)self isBulkSendActive]) {
    [(HMDAccessoryDataStreamAdapter *)self setDidBulkSendComplete:1];
  }
  id v4 = [(HMDAccessoryDataStreamAdapter *)self delegate];
  [v4 dataStreamAdapterDidCompleteDataRead:self];
}

- (void)_bulkSendDidFail
{
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDAccessoryDataStreamAdapter *)self isBulkSendActive]) {
    [(HMDAccessoryDataStreamAdapter *)self setDidBulkSendFail:1];
  }
  id v4 = [(HMDAccessoryDataStreamAdapter *)self delegate];
  [v4 dataStreamAdapterDidFailDataRead:self];
}

- (BOOL)_handleFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryDataStreamAdapter *)self delegate];
  LOBYTE(self) = [v6 dataStreamAdapter:self didReceiveData:v4];

  return (char)self;
}

- (BOOL)isSessionOpenInProgress
{
  v2 = self;
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryDataStreamAdapter *)v2 pendingOpenSessionCallback];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (void)_handleAccessoryDidClose
{
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryDataStreamAdapter *)self accessory];
  id v5 = HAPStringFromAccessoryServerSession();
  [v4 deregisterFromSessionRestore:v5];

  id v6 = [(HMDAccessoryDataStreamAdapter *)self pendingOpenSessionCallback];

  if (v6)
  {
    [(HMDAccessoryDataStreamAdapter *)self setTransportReady:0];
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [(HMDAccessoryDataStreamAdapter *)self _callPendingOpenSessionCallbackWithResult:0 error:v7];
  }
  else if ([(HMDAccessoryDataStreamAdapter *)self isBulkSendActive])
  {
    [(HMDAccessoryDataStreamAdapter *)self _bulkSendDidFail];
  }
}

- (void)_callPendingOpenSessionCallbackWithResult:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 session];
  [(HMDAccessoryDataStreamAdapter *)self setCurrentBulkSendSession:v9];

  uint64_t v10 = [(HMDAccessoryDataStreamAdapter *)self pendingOpenSessionCallback];
  uint64_t v11 = [(HMDAccessoryDataStreamAdapter *)self setPendingOpenSessionCallback:0];
  if (!v7)
  {
    v12 = [(HMDAccessoryDataStreamAdapter *)self accessory];
    int v13 = HAPStringFromAccessoryServerSession();
    [v12 registerForSessionRestore:v13];
  }
  v14 = (void *)MEMORY[0x1D9452090](v11);
  id v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    int v18 = 138543874;
    uint64_t v19 = v17;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Calling pending callback with result: %@ error: %@", (uint8_t *)&v18, 0x20u);
  }
  ((void (**)(void, id, id))v10)[2](v10, v6, v7);
}

- (void)callPendingOpenSessionCallbackWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__HMDAccessoryDataStreamAdapter_callPendingOpenSessionCallbackWithResult_error___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __80__HMDAccessoryDataStreamAdapter_callPendingOpenSessionCallbackWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) pendingOpenSessionCallback];

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 _callPendingOpenSessionCallbackWithResult:v4 error:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Pending open session callback was unexpectedly nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_openSession
{
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  uint64_t v4 = [(HMDAccessoryDataStreamAdapter *)self accessory];
  uint64_t v5 = [(HMDAccessoryDataStreamAdapter *)self fileType];
  id v6 = [(HMDAccessoryDataStreamAdapter *)self reason];
  id v7 = [(HMDAccessoryDataStreamAdapter *)self metadata];
  id v8 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__HMDAccessoryDataStreamAdapter__openSession__block_invoke;
  v9[3] = &unk_1E6A08EC8;
  objc_copyWeak(&v10, &location);
  [v4 openBulkSendSessionForFileType:v5 reason:v6 metadata:v7 queue:v8 callback:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__HMDAccessoryDataStreamAdapter__openSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained callPendingOpenSessionCallbackWithResult:v6 error:v5];
}

- (void)_setUpTransport
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Setting up data stream transport", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [(HMDAccessoryDataStreamAdapter *)v5 accessory];
  id v9 = [(HMDAccessoryDataStreamAdapter *)v5 fileType];
  [v8 addDataStreamBulkSendListener:v5 fileType:v9];
}

- (void)readData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDAccessoryDataStreamAdapter *)self currentBulkSendSession];

  if (v4)
  {
    id v5 = [(HMDAccessoryDataStreamAdapter *)self currentBulkSendSession];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__HMDAccessoryDataStreamAdapter_readData__block_invoke;
    v11[3] = &unk_1E6A18CB8;
    v11[4] = self;
    [v5 read:v11];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = [(HMDAccessoryDataStreamAdapter *)v7 accessory];
      *(_DWORD *)buf = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Read data failed with no bulkSend session present for accessory:%@", buf, 0x16u);
    }
    [(HMDAccessoryDataStreamAdapter *)v7 _bulkSendDidFail];
  }
}

void __41__HMDAccessoryDataStreamAdapter_readData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    int v10 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      [*(id *)(a1 + 32) _bulkSendDidFail];
      goto LABEL_6;
    }
    uint64_t v11 = HMFGetLogIdentifier();
    int v20 = 138543618;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics transfer read data channel has error:(%@)", (uint8_t *)&v20, 0x16u);
LABEL_4:

    goto LABEL_5;
  }
  if (v5 && ([*(id *)(a1 + 32) _handleFrame:v5] & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    int v10 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v19 = [*(id *)(a1 + 32) accessory];
    int v20 = 138543618;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v19;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Received data frame is not accepted for accessory:%@", (uint8_t *)&v20, 0x16u);

    goto LABEL_4;
  }
  uint64_t v12 = [*(id *)(a1 + 32) currentBulkSendSession];
  int v13 = [v12 isActive];

  if (v13)
  {
    [*(id *)(a1 + 32) readData];
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v18 = [*(id *)(a1 + 32) accessory];
      int v20 = 138543618;
      id v21 = v17;
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Diagnostics data transfer is completed for accessory:%@", (uint8_t *)&v20, 0x16u);
    }
    [*(id *)(a1 + 32) _bulkSendDidComplete];
  }
LABEL_6:
}

- (void)setUpWithCallback:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryDataStreamAdapter *)self pendingOpenSessionCallback];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Session is being setup already", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    v4[2](v4, 0, v11);
  }
  else
  {
    [(HMDAccessoryDataStreamAdapter *)self _setUpTransport];
    [(HMDAccessoryDataStreamAdapter *)self setPendingOpenSessionCallback:v4];
  }
}

- (BOOL)isBulkSendActive
{
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDAccessoryDataStreamAdapter *)self currentBulkSendSession];
  if (v4 && ![(HMDAccessoryDataStreamAdapter *)self didBulkSendFail]) {
    BOOL v5 = ![(HMDAccessoryDataStreamAdapter *)self didBulkSendComplete];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDAccessoryDataStreamAdapter;
  [(HMDAccessoryDataStreamAdapter *)&v7 dealloc];
}

- (void)shutDown
{
  v3 = [(HMDAccessoryDataStreamAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDAccessoryDataStreamAdapter *)self currentBulkSendSession];

  if (v4)
  {
    BOOL v5 = [(HMDAccessoryDataStreamAdapter *)self didBulkSendComplete];
    id v6 = [(HMDAccessoryDataStreamAdapter *)self currentBulkSendSession];
    objc_super v7 = v6;
    if (v5) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 5;
    }
    [v6 cancelWithReason:v8];

    [(HMDAccessoryDataStreamAdapter *)self setCurrentBulkSendSession:0];
  }
  id v9 = [(HMDAccessoryDataStreamAdapter *)self pendingOpenSessionCallback];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [(HMDAccessoryDataStreamAdapter *)self _callPendingOpenSessionCallbackWithResult:0 error:v10];
  }
  id v12 = [(HMDAccessoryDataStreamAdapter *)self accessory];
  if (v12)
  {
    [v12 removeDataStreamBulkSendListener:self];
    uint64_t v11 = HAPStringFromAccessoryServerSession();
    [v12 deregisterFromSessionRestore:v11];
  }
  [(HMDAccessoryDataStreamAdapter *)self setTransportReady:0];
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v4 = [(HMDAccessoryDataStreamAdapter *)self fileType];
  BOOL v5 = (void *)[v3 initWithName:@"Diagnostics DataStream File Type" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAccessoryDataStreamAdapter *)self transportReady];
  objc_super v7 = HMFBooleanToString();
  uint64_t v8 = (void *)[v6 initWithName:@"TransportReady" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAccessoryDataStreamAdapter *)self didBulkSendFail];
  uint64_t v10 = HMFBooleanToString();
  uint64_t v11 = (void *)[v9 initWithName:@"DidBulkSendFail" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAccessoryDataStreamAdapter *)self didBulkSendComplete];
  int v13 = HMFBooleanToString();
  uint64_t v14 = (void *)[v12 initWithName:@"DidBulkSendComplete" value:v13];
  v17[3] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (HMDAccessoryDataStreamAdapter)initWithAccessory:(id)a3 workQueue:(id)a4 fileType:(id)a5 metadata:(id)a6 reason:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HMDAccessoryDataStreamAdapter;
  __int16 v17 = [(HMDAccessoryDataStreamAdapter *)&v20 init];
  int v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_fileType, a5);
    objc_storeStrong((id *)&v18->_reason, a7);
    objc_storeStrong((id *)&v18->_metadata, a6);
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_28653 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_28653, &__block_literal_global_28654);
  }
  v2 = (void *)logCategory__hmf_once_v15_28655;
  return v2;
}

uint64_t __44__HMDAccessoryDataStreamAdapter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v15_28655;
  logCategory__hmf_once_v15_28655 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end