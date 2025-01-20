@interface HMDHomeKitPersonDataInterface
+ (id)logCategory;
- (HMDActiveXPCClientConnectionsPeriodicTimer)clientConnectionsTimer;
- (HMDHomeKitPersonDataInterface)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5;
- (HMDHomeKitPersonDataInterface)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5 clientConnectionsTimer:(id)a6;
- (HMDPersonDataSource)dataSource;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (id)fetchServerFactory;
- (id)logIdentifier;
- (void)_notifySubscribersOfMessageWithName:(id)a3 payload:(id)a4;
- (void)clientConnectionsTimerDidFire:(id)a3;
- (void)configureWithDataSource:(id)a3 home:(id)a4;
- (void)handleAddOrUpdateFaceCropsMessage:(id)a3;
- (void)handleAddOrUpdateFaceprintsMessage:(id)a3;
- (void)handleAddOrUpdatePersonsMessage:(id)a3;
- (void)handleAssociateFaceCropsMessage:(id)a3;
- (void)handleDisassociateFaceCropsMessage:(id)a3;
- (void)handleFetchFaceCropsMessage:(id)a3;
- (void)handleFetchFaceprintsMessage:(id)a3;
- (void)handleFetchPersonFaceCropsMessage:(id)a3;
- (void)handleFetchPersonsMessage:(id)a3;
- (void)handleFetchUnassociatedFaceCropsMessage:(id)a3;
- (void)handlePerformCloudPullMessage:(id)a3;
- (void)handleRemoveFaceCropsMessage:(id)a3;
- (void)handleRemoveFaceprintsMessage:(id)a3;
- (void)handleRemovePersonsMessage:(id)a3;
- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleRemovedFaceprintWithUUID:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleSubscribeMessage:(id)a3;
- (void)handleUnsubscribeMessage:(id)a3;
- (void)handleUpdatedFaceprint:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedUnassociatedFaceCrop:(id)a3 mirrorOutputFuture:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setFetchServerFactory:(id)a3;
@end

@implementation HMDHomeKitPersonDataInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchServerFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_clientConnectionsTimer, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setFetchServerFactory:(id)a3
{
}

- (id)fetchServerFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDPersonDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPersonDataSource *)WeakRetained;
}

- (HMDActiveXPCClientConnectionsPeriodicTimer)clientConnectionsTimer
{
  return (HMDActiveXPCClientConnectionsPeriodicTimer *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)clientConnectionsTimerDidFire:(id)a3
{
  v4 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v6 = [(HMDHomeKitPersonDataInterface *)self dataSource];
  id v5 = (id)[v6 performCloudPull];
}

- (void)handleRemovedFaceprintWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of removed faceprint UUID: %@", buf, 0x16u);
  }
  v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", v6, *MEMORY[0x263F0D410]);
  v16 = v13;
  v14 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  [(HMDHomeKitPersonDataInterface *)v10 _notifySubscribersOfMessageWithName:*MEMORY[0x263F0D3A0] payload:v14];
}

- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of removed face crop UUID: %@", buf, 0x16u);
  }
  v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", v6, *MEMORY[0x263F0D408]);
  v16 = v13;
  v14 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  [(HMDHomeKitPersonDataInterface *)v10 _notifySubscribersOfMessageWithName:*MEMORY[0x263F0D3A0] payload:v14];
}

- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of removed person UUID: %@", buf, 0x16u);
  }
  v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", v6, *MEMORY[0x263F0D418]);
  v16 = v13;
  v14 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  [(HMDHomeKitPersonDataInterface *)v10 _notifySubscribersOfMessageWithName:*MEMORY[0x263F0D3A0] payload:v14];
}

- (void)handleUpdatedFaceprint:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying subscribers of updated faceprint: %@", buf, 0x16u);
  }
  v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", v6, *MEMORY[0x263F0D428]);
  v14 = encodeRootObject();
  v17 = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  [(HMDHomeKitPersonDataInterface *)v10 _notifySubscribersOfMessageWithName:*MEMORY[0x263F0D3A0] payload:v15];
}

- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v6 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v12;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying subscribers of updated person face crop: %@", buf, 0x16u);
  }
  v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", v6, *MEMORY[0x263F0D430]);
  uint64_t v15 = encodeRootObject();
  v18 = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  [(HMDHomeKitPersonDataInterface *)v10 _notifySubscribersOfMessageWithName:*MEMORY[0x263F0D3A0] payload:v16];
}

- (void)handleUpdatedUnassociatedFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of updated unassociated face crop: %@", buf, 0x16u);
  }
  v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", v6, *MEMORY[0x263F0D440]);
  v14 = encodeRootObject();
  uint64_t v17 = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  [(HMDHomeKitPersonDataInterface *)v10 _notifySubscribersOfMessageWithName:*MEMORY[0x263F0D3A0] payload:v15];
}

- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of updated person: %@", buf, 0x16u);
  }
  v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", v6, *MEMORY[0x263F0D438]);
  v14 = encodeRootObject();
  uint64_t v17 = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  [(HMDHomeKitPersonDataInterface *)v10 _notifySubscribersOfMessageWithName:*MEMORY[0x263F0D3A0] payload:v15];
}

- (void)configureWithDataSource:(id)a3 home:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  if (!v7) {
    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v47 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring HomeKit person data interface", buf, 0xCu);
  }
  [(HMDHomeKitPersonDataInterface *)v10 setDataSource:v6];
  v13 = +[HMDXPCMessagePolicy policyWithEntitlements:8197];
  v40 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:0 remoteAccessRequired:0];
  +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:4 remoteAccessRequired:0];
  v14 = v41 = v6;
  v38 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:1];
  uint64_t v15 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:4];
  uint64_t v16 = v39 = v7;
  v45[0] = v13;
  v45[1] = v40;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
  v18 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v18 registerForMessage:*MEMORY[0x263F0D468] receiver:v10 policies:v17 selector:sel_handleSubscribeMessage_];

  __int16 v19 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v19 registerForMessage:*MEMORY[0x263F0D470] receiver:v10 policies:v17 selector:sel_handleUnsubscribeMessage_];

  __int16 v20 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v20 registerForMessage:*MEMORY[0x263F0D448] receiver:v10 policies:v17 selector:sel_handlePerformCloudPullMessage_];

  id v21 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v21 registerForMessage:*MEMORY[0x263F0D3C8] receiver:v10 policies:v17 selector:sel_handleFetchPersonsMessage_];

  uint64_t v22 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v22 registerForMessage:*MEMORY[0x263F0D3B0] receiver:v10 policies:v17 selector:sel_handleFetchFaceCropsMessage_];

  uint64_t v23 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v23 registerForMessage:*MEMORY[0x263F0D3C0] receiver:v10 policies:v17 selector:sel_handleFetchPersonFaceCropsMessage_];

  v24 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v24 registerForMessage:*MEMORY[0x263F0D3D0] receiver:v10 policies:v17 selector:sel_handleFetchUnassociatedFaceCropsMessage_];

  v25 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v25 registerForMessage:*MEMORY[0x263F0D3B8] receiver:v10 policies:v17 selector:sel_handleFetchFaceprintsMessage_];

  v44[0] = v13;
  v44[1] = v14;
  v44[2] = v38;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
  v43[0] = v13;
  v43[1] = v14;
  v43[2] = v15;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
  v42[0] = v13;
  v42[1] = v14;
  v42[2] = v16;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
  v29 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v29 registerForMessage:*MEMORY[0x263F0D390] receiver:v10 policies:v26 selector:sel_handleAddOrUpdatePersonsMessage_];

  v30 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v30 registerForMessage:*MEMORY[0x263F0D380] receiver:v10 policies:v26 selector:sel_handleAddOrUpdateFaceCropsMessage_];

  v31 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v31 registerForMessage:*MEMORY[0x263F0D388] receiver:v10 policies:v26 selector:sel_handleAddOrUpdateFaceprintsMessage_];

  v32 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v32 registerForMessage:*MEMORY[0x263F0D398] receiver:v10 policies:v27 selector:sel_handleAssociateFaceCropsMessage_];

  v33 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v33 registerForMessage:*MEMORY[0x263F0D3A8] receiver:v10 policies:v27 selector:sel_handleDisassociateFaceCropsMessage_];

  v34 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v34 registerForMessage:*MEMORY[0x263F0D460] receiver:v10 policies:v28 selector:sel_handleRemovePersonsMessage_];

  v35 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v35 registerForMessage:*MEMORY[0x263F0D450] receiver:v10 policies:v28 selector:sel_handleRemoveFaceCropsMessage_];

  v36 = [(HMDHomeKitPersonDataInterface *)v10 messageDispatcher];
  [v36 registerForMessage:*MEMORY[0x263F0D458] receiver:v10 policies:v28 selector:sel_handleRemoveFaceprintsMessage_];

  v37 = [(HMDHomeKitPersonDataInterface *)v10 clientConnectionsTimer];
  [v37 setDelegate:v10];
}

- (id)logIdentifier
{
  v2 = [(HMDHomeKitPersonDataInterface *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleRemoveFaceprintsMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remove face crops message payload: %@", buf, 0x16u);
  }
  v11 = [v4 setForKey:*MEMORY[0x263F0D3E8]];
  if (v11)
  {
    v12 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
    v13 = [v12 removeFaceprintsWithUUIDs:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __63__HMDHomeKitPersonDataInterface_handleRemoveFaceprintsMessage___block_invoke;
    v21[3] = &unk_264A2D1D0;
    id v22 = v4;
    id v14 = (id)[v13 addCompletionBlock:v21];

    uint64_t v15 = v22;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      __int16 v20 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find faceprints UUIDs in message payload: %@", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v15];
  }
}

uint64_t __63__HMDHomeKitPersonDataInterface_handleRemoveFaceprintsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleRemoveFaceCropsMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remove face crops message payload: %@", buf, 0x16u);
  }
  v11 = [v4 setForKey:*MEMORY[0x263F0D3D8]];
  if (v11)
  {
    v12 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
    v13 = [v12 removeFaceCropsWithUUIDs:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __62__HMDHomeKitPersonDataInterface_handleRemoveFaceCropsMessage___block_invoke;
    v21[3] = &unk_264A2D1D0;
    id v22 = v4;
    id v14 = (id)[v13 addCompletionBlock:v21];

    uint64_t v15 = v22;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      __int16 v20 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crop UUIDs in message payload: %@", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v15];
  }
}

uint64_t __62__HMDHomeKitPersonDataInterface_handleRemoveFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleRemovePersonsMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remove persons message payload: %@", buf, 0x16u);
  }
  v11 = [v4 setForKey:*MEMORY[0x263F0D3F8]];
  if (v11)
  {
    v12 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
    v13 = [v12 removePersonsWithUUIDs:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __60__HMDHomeKitPersonDataInterface_handleRemovePersonsMessage___block_invoke;
    v21[3] = &unk_264A2D1D0;
    id v22 = v4;
    id v14 = (id)[v13 addCompletionBlock:v21];

    uint64_t v15 = v22;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      __int16 v20 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find person UUIDs in message payload: %@", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v15];
  }
}

uint64_t __60__HMDHomeKitPersonDataInterface_handleRemovePersonsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleDisassociateFaceCropsMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling disassociate face crops message payload: %@", buf, 0x16u);
  }
  v11 = [v4 setForKey:*MEMORY[0x263F0D3D8]];
  if (v11)
  {
    v12 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
    v13 = [v12 disassociateFaceCropsWithUUIDs:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __68__HMDHomeKitPersonDataInterface_handleDisassociateFaceCropsMessage___block_invoke;
    v21[3] = &unk_264A2D1D0;
    id v22 = v4;
    id v14 = (id)[v13 addCompletionBlock:v21];

    uint64_t v15 = v22;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      __int16 v20 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crop UUIDs in message payload: %@", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v15];
  }
}

uint64_t __68__HMDHomeKitPersonDataInterface_handleDisassociateFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleAssociateFaceCropsMessage:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v39 = v9;
    __int16 v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling associate face crops message payload: %@", buf, 0x16u);
  }
  v11 = [v4 setForKey:*MEMORY[0x263F0D3D8]];
  if (v11)
  {
    v12 = [v4 setForKey:*MEMORY[0x263F0D3F8]];
    v13 = [v12 anyObject];

    if (v13)
    {
      id v14 = [v4 numberForKey:*MEMORY[0x263F0D420]];
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v16 = [v14 integerValue];
        uint64_t v17 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
        v18 = [v17 associateFaceCropsWithUUIDs:v11 toPersonWithUUID:v13 forSource:v16];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __65__HMDHomeKitPersonDataInterface_handleAssociateFaceCropsMessage___block_invoke;
        v36[3] = &unk_264A2D1D0;
        id v37 = v4;
        id v19 = (id)[v18 addCompletionBlock:v36];

        __int16 v20 = v37;
      }
      else
      {
        v31 = (void *)MEMORY[0x230FBD990]();
        v32 = v7;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          v35 = [v4 messagePayload];
          *(_DWORD *)buf = 138543618;
          v39 = v34;
          __int16 v40 = 2112;
          v41 = v35;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find source in message payload: %@", buf, 0x16u);
        }
        __int16 v20 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        [v4 respondWithError:v20];
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      uint64_t v27 = v7;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        v30 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v39 = v29;
        __int16 v40 = 2112;
        v41 = v30;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find person UUID in message payload: %@", buf, 0x16u);
      }
      uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v4 respondWithError:v15];
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = v7;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      __int16 v25 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v39 = v24;
      __int16 v40 = 2112;
      v41 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crop UUIDs in message payload: %@", buf, 0x16u);
    }
    v13 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v13];
  }
}

uint64_t __65__HMDHomeKitPersonDataInterface_handleAssociateFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleAddOrUpdateFaceprintsMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling add/update faceprints message payload: %@", buf, 0x16u);
  }
  uint64_t v11 = *MEMORY[0x263F0D3F0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v13 = [v4 unarchivedObjectForKey:v11 ofClasses:v12];

  if (v13)
  {
    id v14 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
    uint64_t v15 = [v14 addOrUpdateFaceprints:v13];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __68__HMDHomeKitPersonDataInterface_handleAddOrUpdateFaceprintsMessage___block_invoke;
    v23[3] = &unk_264A2D1D0;
    id v24 = v4;
    id v16 = (id)[v15 addCompletionBlock:v23];

    uint64_t v17 = v24;
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v7;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find faceprints in message payload: %@", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v17];
  }
}

uint64_t __68__HMDHomeKitPersonDataInterface_handleAddOrUpdateFaceprintsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleAddOrUpdateFaceCropsMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling add/update face crops message payload: %@", buf, 0x16u);
  }
  uint64_t v11 = *MEMORY[0x263F0D3E0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v13 = [v4 unarchivedObjectForKey:v11 ofClasses:v12];

  if (v13)
  {
    id v14 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
    uint64_t v15 = [v14 addOrUpdateFaceCrops:v13];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __67__HMDHomeKitPersonDataInterface_handleAddOrUpdateFaceCropsMessage___block_invoke;
    v23[3] = &unk_264A2D1D0;
    id v24 = v4;
    id v16 = (id)[v15 addCompletionBlock:v23];

    uint64_t v17 = v24;
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v7;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crops in message payload: %@", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v17];
  }
}

uint64_t __67__HMDHomeKitPersonDataInterface_handleAddOrUpdateFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleAddOrUpdatePersonsMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling add/update persons message payload: %@", buf, 0x16u);
  }
  uint64_t v11 = *MEMORY[0x263F0D400];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v13 = [v4 unarchivedObjectForKey:v11 ofClasses:v12];

  if (v13)
  {
    id v14 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
    uint64_t v15 = [v14 addOrUpdatePersons:v13];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__HMDHomeKitPersonDataInterface_handleAddOrUpdatePersonsMessage___block_invoke;
    v23[3] = &unk_264A2D1D0;
    id v24 = v4;
    id v16 = (id)[v15 addCompletionBlock:v23];

    uint64_t v17 = v24;
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v7;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find persons in message payload: %@", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v17];
  }
}

uint64_t __65__HMDHomeKitPersonDataInterface_handleAddOrUpdatePersonsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleFetchFaceprintsMessage:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch faceprints message payload: %@", buf, 0x16u);
  }
  uint64_t v11 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
  if ([v11 isDataAvailable])
  {
    v12 = [v4 setForKey:*MEMORY[0x263F0D3D8]];
    if (v12)
    {
      id v13 = [v11 faceprintsForFaceCropsWithUUIDs:v12];
      uint64_t v30 = *MEMORY[0x263F0D3F0];
      id v14 = encodeRootObjectForIncomingXPCMessage(v13, 0);
      v31 = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [v4 respondWithPayload:v15];
    }
    else
    {
      __int16 v20 = [(HMDHomeKitPersonDataInterface *)v7 fetchServerFactory];
      id v21 = ((void (**)(void, id))v20)[2](v20, v4);

      if (v21)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __62__HMDHomeKitPersonDataInterface_handleFetchFaceprintsMessage___block_invoke;
        v28[3] = &unk_264A254F8;
        id v13 = v21;
        id v29 = v13;
        [v11 enumerateFaceprintsUsingBlock:v28];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __62__HMDHomeKitPersonDataInterface_handleFetchFaceprintsMessage___block_invoke_2;
        v26[3] = &unk_264A2F7F8;
        id v27 = v4;
        [v13 sendCurrentlyBatchedFetchedObjectsWithCompletion:v26];

        id v14 = v29;
      }
      else
      {
        id v22 = (void *)MEMORY[0x230FBD990]();
        uint64_t v23 = v7;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v33 = v25;
          __int16 v34 = 2112;
          id v35 = v4;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);
        }
        id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
        [v4 respondWithError:v14];
        id v13 = 0;
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch faceprints because data is not available", buf, 0xCu);
    }
    v12 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

uint64_t __62__HMDHomeKitPersonDataInterface_handleFetchFaceprintsMessage___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) handleFetchedObject:a2];
  uint64_t result = [*(id *)(a1 + 32) canHandleMoreFetchedObjects];
  *a3 = result ^ 1;
  return result;
}

uint64_t __62__HMDHomeKitPersonDataInterface_handleFetchFaceprintsMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (void)handleFetchUnassociatedFaceCropsMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch unassociated face crops message payload: %@", buf, 0x16u);
  }
  uint64_t v11 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
  if ([v11 isDataAvailable])
  {
    v12 = [(HMDHomeKitPersonDataInterface *)v7 fetchServerFactory];
    id v13 = ((void (**)(void, id))v12)[2](v12, v4);

    if (v13)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __73__HMDHomeKitPersonDataInterface_handleFetchUnassociatedFaceCropsMessage___block_invoke;
      v26[3] = &unk_264A254A8;
      id v14 = v13;
      id v27 = v14;
      [v11 enumerateUnassociatedFaceCropsUsingBlock:v26];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __73__HMDHomeKitPersonDataInterface_handleFetchUnassociatedFaceCropsMessage___block_invoke_2;
      v24[3] = &unk_264A2F7F8;
      id v25 = v4;
      [v14 sendCurrentlyBatchedFetchedObjectsWithCompletion:v24];

      uint64_t v15 = v27;
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = v7;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v29 = v23;
        __int16 v30 = 2112;
        id v31 = v4;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);
      }
      uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      [v4 respondWithError:v15];
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch face crops because data is not available", buf, 0xCu);
    }
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v13];
  }
}

uint64_t __73__HMDHomeKitPersonDataInterface_handleFetchUnassociatedFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) handleFetchedObject:a2];
  uint64_t result = [*(id *)(a1 + 32) canHandleMoreFetchedObjects];
  *a3 = result ^ 1;
  return result;
}

uint64_t __73__HMDHomeKitPersonDataInterface_handleFetchUnassociatedFaceCropsMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (void)handleFetchPersonFaceCropsMessage:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch person face crops message payload: %@", buf, 0x16u);
  }
  uint64_t v11 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
  if ([v11 isDataAvailable])
  {
    v12 = [v4 setForKey:*MEMORY[0x263F0D3F8]];
    if (v12)
    {
      id v13 = [v11 faceCropsForPersonsWithUUIDs:v12];
      uint64_t v30 = *MEMORY[0x263F0D3E0];
      id v14 = encodeRootObjectForIncomingXPCMessage(v13, 0);
      id v31 = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [v4 respondWithPayload:v15];
    }
    else
    {
      __int16 v20 = [(HMDHomeKitPersonDataInterface *)v7 fetchServerFactory];
      id v21 = ((void (**)(void, id))v20)[2](v20, v4);

      if (v21)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __67__HMDHomeKitPersonDataInterface_handleFetchPersonFaceCropsMessage___block_invoke;
        v28[3] = &unk_264A254D0;
        id v13 = v21;
        id v29 = v13;
        [v11 enumeratePersonFaceCropsUsingBlock:v28];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __67__HMDHomeKitPersonDataInterface_handleFetchPersonFaceCropsMessage___block_invoke_2;
        v26[3] = &unk_264A2F7F8;
        id v27 = v4;
        [v13 sendCurrentlyBatchedFetchedObjectsWithCompletion:v26];

        id v14 = v29;
      }
      else
      {
        id v22 = (void *)MEMORY[0x230FBD990]();
        uint64_t v23 = v7;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v33 = v25;
          __int16 v34 = 2112;
          id v35 = v4;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);
        }
        id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
        [v4 respondWithError:v14];
        id v13 = 0;
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch person face crops because data is not available", buf, 0xCu);
    }
    v12 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

uint64_t __67__HMDHomeKitPersonDataInterface_handleFetchPersonFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) handleFetchedObject:a2];
  uint64_t result = [*(id *)(a1 + 32) canHandleMoreFetchedObjects];
  *a3 = result ^ 1;
  return result;
}

uint64_t __67__HMDHomeKitPersonDataInterface_handleFetchPersonFaceCropsMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (void)handleFetchFaceCropsMessage:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch face crops message payload: %@", buf, 0x16u);
  }
  uint64_t v11 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
  if ([v11 isDataAvailable])
  {
    v12 = [v4 setForKey:*MEMORY[0x263F0D3D8]];
    if (v12)
    {
      id v13 = [v11 faceCropsWithUUIDs:v12];
      uint64_t v30 = *MEMORY[0x263F0D3E0];
      id v14 = encodeRootObjectForIncomingXPCMessage(v13, 0);
      id v31 = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [v4 respondWithPayload:v15];
    }
    else
    {
      __int16 v20 = [(HMDHomeKitPersonDataInterface *)v7 fetchServerFactory];
      id v21 = ((void (**)(void, id))v20)[2](v20, v4);

      if (v21)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __61__HMDHomeKitPersonDataInterface_handleFetchFaceCropsMessage___block_invoke;
        v28[3] = &unk_264A254A8;
        id v13 = v21;
        id v29 = v13;
        [v11 enumerateFaceCropsUsingBlock:v28];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __61__HMDHomeKitPersonDataInterface_handleFetchFaceCropsMessage___block_invoke_2;
        v26[3] = &unk_264A2F7F8;
        id v27 = v4;
        [v13 sendCurrentlyBatchedFetchedObjectsWithCompletion:v26];

        id v14 = v29;
      }
      else
      {
        id v22 = (void *)MEMORY[0x230FBD990]();
        uint64_t v23 = v7;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v33 = v25;
          __int16 v34 = 2112;
          id v35 = v4;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);
        }
        id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
        [v4 respondWithError:v14];
        id v13 = 0;
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch person face crops because data is not available", buf, 0xCu);
    }
    v12 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

uint64_t __61__HMDHomeKitPersonDataInterface_handleFetchFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) handleFetchedObject:a2];
  uint64_t result = [*(id *)(a1 + 32) canHandleMoreFetchedObjects];
  *a3 = result ^ 1;
  return result;
}

uint64_t __61__HMDHomeKitPersonDataInterface_handleFetchFaceCropsMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (void)handleFetchPersonsMessage:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch persons message payload: %@", buf, 0x16u);
  }
  uint64_t v11 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
  if ([v11 isDataAvailable])
  {
    v12 = [v4 setForKey:*MEMORY[0x263F0D3F8]];
    if (v12)
    {
      id v13 = [v11 personsWithUUIDs:v12];
      uint64_t v30 = *MEMORY[0x263F0D400];
      id v14 = encodeRootObjectForIncomingXPCMessage(v13, 0);
      id v31 = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [v4 respondWithPayload:v15];
    }
    else
    {
      __int16 v20 = [(HMDHomeKitPersonDataInterface *)v7 fetchServerFactory];
      id v21 = ((void (**)(void, id))v20)[2](v20, v4);

      if (v21)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __59__HMDHomeKitPersonDataInterface_handleFetchPersonsMessage___block_invoke;
        v28[3] = &unk_264A25480;
        id v13 = v21;
        id v29 = v13;
        [v11 enumeratePersonsUsingBlock:v28];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __59__HMDHomeKitPersonDataInterface_handleFetchPersonsMessage___block_invoke_2;
        v26[3] = &unk_264A2F7F8;
        id v27 = v4;
        [v13 sendCurrentlyBatchedFetchedObjectsWithCompletion:v26];

        id v14 = v29;
      }
      else
      {
        id v22 = (void *)MEMORY[0x230FBD990]();
        uint64_t v23 = v7;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v33 = v25;
          __int16 v34 = 2112;
          id v35 = v4;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);
        }
        id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
        [v4 respondWithError:v14];
        id v13 = 0;
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch persons because data is not available", buf, 0xCu);
    }
    v12 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

uint64_t __59__HMDHomeKitPersonDataInterface_handleFetchPersonsMessage___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) handleFetchedObject:a2];
  uint64_t result = [*(id *)(a1 + 32) canHandleMoreFetchedObjects];
  *a3 = result ^ 1;
  return result;
}

uint64_t __59__HMDHomeKitPersonDataInterface_handleFetchPersonsMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (void)handlePerformCloudPullMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling perform cloud pull message", buf, 0xCu);
  }
  v10 = [(HMDHomeKitPersonDataInterface *)v7 dataSource];
  uint64_t v11 = [v10 performCloudPull];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__HMDHomeKitPersonDataInterface_handlePerformCloudPullMessage___block_invoke;
  v14[3] = &unk_264A2D1D0;
  id v15 = v4;
  id v12 = v4;
  id v13 = (id)[v11 addCompletionBlock:v14];
}

uint64_t __63__HMDHomeKitPersonDataInterface_handlePerformCloudPullMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleUnsubscribeMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v21 = 138543362;
    id v22 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling unsubscribe message", (uint8_t *)&v21, 0xCu);
  }
  v10 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [(HMDHomeKitPersonDataInterface *)v7 clientConnectionsTimer];
    [v13 removeClientConnection:v12];

    [v4 respondWithSuccess];
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = v7;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = objc_opt_class();
      id v19 = [v4 transport];
      int v21 = 138543874;
      id v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unsubscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);
    }
    __int16 v20 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v20];
  }
}

- (void)handleSubscribeMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v21 = 138543362;
    id v22 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling subscribe message", (uint8_t *)&v21, 0xCu);
  }
  v10 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [(HMDHomeKitPersonDataInterface *)v7 clientConnectionsTimer];
    [v13 addClientConnection:v12];

    [v4 respondWithSuccess];
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = v7;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = objc_opt_class();
      id v19 = [v4 transport];
      int v21 = 138543874;
      id v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);
    }
    __int16 v20 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v20];
  }
}

- (void)_notifySubscribersOfMessageWithName:(id)a3 payload:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v30 = a4;
  id v6 = [(HMDHomeKitPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDHomeKitPersonDataInterface *)self clientConnectionsTimer];
  v8 = [v7 clientConnections];
  uint64_t v9 = [v8 count];

  v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [(HMDHomeKitPersonDataInterface *)v11 clientConnectionsTimer];
      id v16 = [v15 clientConnections];
      *(_DWORD *)buf = 138543618;
      v38 = v14;
      __int16 v39 = 2048;
      uint64_t v40 = [v16 count];
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribers", buf, 0x16u);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v17 = [(HMDHomeKitPersonDataInterface *)v11 clientConnectionsTimer];
    uint64_t v18 = [v17 clientConnections];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * v22);
          uint64_t v24 = [MEMORY[0x263F42590] entitledMessageWithName:v31 messagePayload:v30];
          [v24 setTransport:v23];
          id v25 = objc_alloc(MEMORY[0x263F42570]);
          v26 = [(HMDHomeKitPersonDataInterface *)v11 UUID];
          uint64_t v27 = (void *)[v25 initWithTarget:v26];
          [v24 setDestination:v27];

          [v24 setRequiresPersonManagerEntitlement];
          __int16 v28 = [(HMDHomeKitPersonDataInterface *)v11 messageDispatcher];
          [v28 sendMessage:v24];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v20);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v38 = v29;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed transports to notify", buf, 0xCu);
    }
  }
}

- (HMDHomeKitPersonDataInterface)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5 clientConnectionsTimer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomeKitPersonDataInterface;
  id v14 = [(HMDHomeKitPersonDataInterface *)&v23 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_workQueue, a5);
    uint64_t v16 = [v10 copy];
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v16;

    objc_storeStrong((id *)&v15->_messageDispatcher, a4);
    objc_storeStrong((id *)&v15->_clientConnectionsTimer, a6);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__HMDHomeKitPersonDataInterface_initWithUUID_messageDispatcher_workQueue_clientConnectionsTimer___block_invoke;
    aBlock[3] = &unk_264A269B0;
    id v22 = v12;
    uint64_t v18 = _Block_copy(aBlock);
    id fetchServerFactory = v15->_fetchServerFactory;
    v15->_id fetchServerFactory = v18;
  }
  return v15;
}

id __97__HMDHomeKitPersonDataInterface_initWithUUID_messageDispatcher_workQueue_clientConnectionsTimer___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F0E1E0];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithFetchMessage:v4 workQueue:*(void *)(a1 + 32)];

  return v5;
}

- (HMDHomeKitPersonDataInterface)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [HMDActiveXPCClientConnectionsPeriodicTimer alloc];
  id v12 = [v10 UUIDString];
  id v13 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)v11 initWithTimeInterval:v12 logIdentifier:v8 workQueue:60.0];

  id v14 = [(HMDHomeKitPersonDataInterface *)self initWithUUID:v10 messageDispatcher:v9 workQueue:v8 clientConnectionsTimer:v13];
  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_192737 != -1) {
    dispatch_once(&logCategory__hmf_once_t42_192737, &__block_literal_global_192738);
  }
  v2 = (void *)logCategory__hmf_once_v43_192739;
  return v2;
}

void __44__HMDHomeKitPersonDataInterface_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v43_192739;
  logCategory__hmf_once_v43_192739 = v0;
}

@end