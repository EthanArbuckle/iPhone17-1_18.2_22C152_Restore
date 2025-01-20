@interface HMCameraObjectFetchServer
+ (id)logCategory;
- (BOOL)canHandleMoreFetchedObjects;
- (HMCameraObjectFetchServer)initWithClientUUID:(id)a3 transport:(id)a4 workQueue:(id)a5;
- (HMCameraObjectFetchServer)initWithFetchMessage:(id)a3 workQueue:(id)a4;
- (HMFMessageTransport)transport;
- (NSMutableArray)currentlyBatchedFetchedObjects;
- (NSUUID)clientUUID;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (unint64_t)fetchedObjectsBatchLimit;
- (unint64_t)totalFetchedObjectsCount;
- (unint64_t)totalFetchedObjectsLimit;
- (void)_notifyTransport:(id)a3 ofFetchedObjects:(id)a4 forClientUUID:(id)a5 responseHandler:(id)a6;
- (void)handleFetchedObject:(id)a3;
- (void)sendCurrentlyBatchedFetchedObjectsWithCompletion:(id)a3;
- (void)setFetchedObjectsBatchLimit:(unint64_t)a3;
- (void)setTotalFetchedObjectsCount:(unint64_t)a3;
- (void)setTotalFetchedObjectsLimit:(unint64_t)a3;
- (void)setTransport:(id)a3;
@end

@implementation HMCameraObjectFetchServer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_currentlyBatchedFetchedObjects, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_clientUUID, 0);
}

- (void)setTotalFetchedObjectsCount:(unint64_t)a3
{
  self->_totalFetchedObjectsCount = a3;
}

- (unint64_t)totalFetchedObjectsCount
{
  return self->_totalFetchedObjectsCount;
}

- (void)setTransport:(id)a3
{
}

- (HMFMessageTransport)transport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);

  return (HMFMessageTransport *)WeakRetained;
}

- (NSMutableArray)currentlyBatchedFetchedObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTotalFetchedObjectsLimit:(unint64_t)a3
{
  self->_totalFetchedObjectsLimit = a3;
}

- (unint64_t)totalFetchedObjectsLimit
{
  return self->_totalFetchedObjectsLimit;
}

- (void)setFetchedObjectsBatchLimit:(unint64_t)a3
{
  self->_fetchedObjectsBatchLimit = a3;
}

- (unint64_t)fetchedObjectsBatchLimit
{
  return self->_fetchedObjectsBatchLimit;
}

- (NSUUID)clientUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMCameraObjectFetchServer *)self clientUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_notifyTransport:(id)a3 ofFetchedObjects:(id)a4 forClientUUID:(id)a5 responseHandler:(id)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17 = @"HMCOFC.mk.fo";
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = encodeRootObject(a4);
  v18[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  id v14 = objc_alloc(MEMORY[0x1E4F654B0]);
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v10];

  v16 = (void *)[v14 initWithName:@"HMCOFC.m.dfo" destination:v15 payload:v13];
  [v16 setTransport:v11];
  [v16 setResponseHandler:v9];

  [v11 sendMessage:v16 completionHandler:0];
}

- (void)sendCurrentlyBatchedFetchedObjectsWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  v5 = [(HMCameraObjectFetchServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMCameraObjectFetchServer *)self transport];
  if (v6)
  {
    v7 = [(HMCameraObjectFetchServer *)self currentlyBatchedFetchedObjects];
    v8 = [(HMCameraObjectFetchServer *)self clientUUID];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __78__HMCameraObjectFetchServer_sendCurrentlyBatchedFetchedObjectsWithCompletion___block_invoke;
    v17 = &unk_1E5944EF0;
    v18 = self;
    v19 = v4;
    [(HMCameraObjectFetchServer *)self _notifyTransport:v6 ofFetchedObjects:v7 forClientUUID:v8 responseHandler:&v14];

    id v9 = [(HMCameraObjectFetchServer *)self currentlyBatchedFetchedObjects];
    [v9 removeAllObjects];
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot send currently batched fetched objects because transport no longer exists", buf, 0xCu);
    }
    v4[2](v4);
  }
}

void __78__HMCameraObjectFetchServer_sendCurrentlyBatchedFetchedObjectsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HMCameraObjectFetchServer_sendCurrentlyBatchedFetchedObjectsWithCompletion___block_invoke_2;
  block[3] = &unk_1E59454C0;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __78__HMCameraObjectFetchServer_sendCurrentlyBatchedFetchedObjectsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleFetchedObject:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMCameraObjectFetchServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMCameraObjectFetchServer *)self transport];
  if (!v6)
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v20;
      v21 = "%{public}@Cannot handle fetched object because transport no longer exists";
LABEL_12:
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v23, 0xCu);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (![(HMCameraObjectFetchServer *)self canHandleMoreFetchedObjects])
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v20;
      v21 = "%{public}@Asked to handle fetched object while unable to handle more fetched objects";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v7 = [(HMCameraObjectFetchServer *)self currentlyBatchedFetchedObjects];
  [v7 addObject:v4];

  v8 = [(HMCameraObjectFetchServer *)self currentlyBatchedFetchedObjects];
  unint64_t v9 = [v8 count];
  unint64_t v10 = [(HMCameraObjectFetchServer *)self fetchedObjectsBatchLimit];

  if (v9 >= v10)
  {
    id v11 = [(HMCameraObjectFetchServer *)self currentlyBatchedFetchedObjects];
    v12 = [(HMCameraObjectFetchServer *)self clientUUID];
    [(HMCameraObjectFetchServer *)self _notifyTransport:v6 ofFetchedObjects:v11 forClientUUID:v12 responseHandler:0];

    v13 = [(HMCameraObjectFetchServer *)self currentlyBatchedFetchedObjects];
    [v13 removeAllObjects];
  }
  [(HMCameraObjectFetchServer *)self setTotalFetchedObjectsCount:[(HMCameraObjectFetchServer *)self totalFetchedObjectsCount] + 1];
  unint64_t v14 = [(HMCameraObjectFetchServer *)self totalFetchedObjectsCount];
  if (v14 >= [(HMCameraObjectFetchServer *)self totalFetchedObjectsLimit])
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v18;
      __int16 v25 = 2048;
      uint64_t v26 = [(HMCameraObjectFetchServer *)v16 totalFetchedObjectsLimit];
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Reached limit of %lu fetched objects", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)canHandleMoreFetchedObjects
{
  v3 = [(HMCameraObjectFetchServer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMCameraObjectFetchServer *)self transport];
  if (v4)
  {
    unint64_t v5 = [(HMCameraObjectFetchServer *)self totalFetchedObjectsCount];
    BOOL v6 = v5 < [(HMCameraObjectFetchServer *)self totalFetchedObjectsLimit];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (HMCameraObjectFetchServer)initWithClientUUID:(id)a3 transport:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMCameraObjectFetchServer;
  id v11 = [(HMCameraObjectFetchServer *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workQueue, a5);
    uint64_t v13 = [v8 copy];
    clientUUID = v12->_clientUUID;
    v12->_clientUUID = (NSUUID *)v13;

    objc_storeWeak((id *)&v12->_transport, v9);
    v12->_fetchedObjectsBatchLimit = 100;
    v12->_totalFetchedObjectsLimit = -1;
    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12->_fetchedObjectsBatchLimit];
    currentlyBatchedFetchedObjects = v12->_currentlyBatchedFetchedObjects;
    v12->_currentlyBatchedFetchedObjects = (NSMutableArray *)v15;
  }
  return v12;
}

- (HMCameraObjectFetchServer)initWithFetchMessage:(id)a3 workQueue:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuidForKey:@"HMCOFC.mk.u"];
  if (v8)
  {
    id v9 = [v6 transport];
    if (v9)
    {
      id v10 = [(HMCameraObjectFetchServer *)self initWithClientUUID:v8 transport:v9 workQueue:v7];
      id v11 = v10;
    }
    else
    {
      v16 = (void *)MEMORY[0x19F3A64A0]();
      id v10 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_super v18 = HMFGetLogIdentifier();
        int v20 = 138543618;
        v21 = v18;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find transport on message: %@", (uint8_t *)&v20, 0x16u);
      }
      id v11 = 0;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v6 messagePayload];
      int v20 = 138543618;
      v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not find client UUID in message payload: %@", (uint8_t *)&v20, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_35539 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_35539, &__block_literal_global_35540);
  }
  v2 = (void *)logCategory__hmf_once_v7_35541;

  return v2;
}

uint64_t __40__HMCameraObjectFetchServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_35541;
  logCategory__hmf_once_v7_35541 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end