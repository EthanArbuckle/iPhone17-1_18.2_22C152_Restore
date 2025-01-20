@interface HMDUserCloudShareController
+ (id)identifierForConnection:(id)a3;
+ (id)logCategory;
- (HMDUserCloudShareController)initWithDelegate:(id)a3 queue:(id)a4 pendingRequestTimeoutInterval:(double)a5;
- (HMDUserCloudShareControllerDelegate)delegate;
- (HMFTimer)pendingRequestTimer;
- (NSHashTable)connectedClients;
- (NSMutableArray)pendingRequests;
- (NSMutableDictionary)containerIdToConnectionIdentifierMap;
- (OS_dispatch_queue)clientQueue;
- (double)pendingRequestTimeoutInterval;
- (id)_connectionForContainerID:(id)a3;
- (void)_addRequestToPending:(id)a3;
- (void)_deregisterXpcClient:(id)a3;
- (void)_handlePendingRequestTimeouts;
- (void)_handleShareForRemoteClientRequest:(id)a3;
- (void)_invalidateXpcClient:(id)a3;
- (void)_registerWithXpcClient:(id)a3 containerIDs:(id)a4;
- (void)_removeTimerIfNotNeeded;
- (void)_resumeRequestsForContainerID:(id)a3 connection:(id)a4;
- (void)_sendRepairRequest:(id)a3 toConnection:(id)a4;
- (void)_sendShareRequest:(id)a3 toConnection:(id)a4;
- (void)_startTimerIfNeeded;
- (void)deregisterXpcClient:(id)a3;
- (void)handleShareForRemoteClientRequest:(id)a3 home:(id)a4 completionHandler:(id)a5;
- (void)handleShareRepairForRemoteClientRequest:(id)a3 home:(id)a4 completion:(id)a5;
- (void)invalidateXpcClient:(id)a3;
- (void)registerWithXpcClient:(id)a3 containerIDs:(id)a4;
- (void)setContainerIdToConnectionIdentifierMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingRequestTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDUserCloudShareController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestTimer, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerIdToConnectionIdentifierMap, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setPendingRequestTimer:(id)a3
{
}

- (HMFTimer)pendingRequestTimer
{
  return self->_pendingRequestTimer;
}

- (double)pendingRequestTimeoutInterval
{
  return self->_pendingRequestTimeoutInterval;
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HMDUserCloudShareControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserCloudShareControllerDelegate *)WeakRetained;
}

- (void)setContainerIdToConnectionIdentifierMap:(id)a3
{
}

- (void)invalidateXpcClient:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserCloudShareController *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMDUserCloudShareController_invalidateXpcClient___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__HMDUserCloudShareController_invalidateXpcClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateXpcClient:*(void *)(a1 + 40)];
}

- (void)_invalidateXpcClient:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDUserCloudShareController *)self connectedClients];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v11;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Found invalidated connection %@ will de-register.", (uint8_t *)&v12, 0x16u);
    }
    [(HMDUserCloudShareController *)v9 _deregisterXpcClient:v4];
  }
}

- (void)deregisterXpcClient:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserCloudShareController *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMDUserCloudShareController_deregisterXpcClient___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__HMDUserCloudShareController_deregisterXpcClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deregisterXpcClient:*(void *)(a1 + 40)];
}

- (void)_deregisterXpcClient:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  v26 = v4;
  id v6 = +[HMDUserCloudShareController identifierForConnection:v4];
  int v7 = [(HMDUserCloudShareController *)self containerIdToConnectionIdentifierMap];
  id v8 = [v7 allKeys];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      uint64_t v28 = v11;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v13);
        id v15 = [(HMDUserCloudShareController *)self containerIdToConnectionIdentifierMap];
        uint64_t v16 = [v15 objectForKeyedSubscript:v14];

        if ([v16 isEqualToString:v6])
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          v18 = self;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = self;
            id v21 = v9;
            v23 = v22 = v6;
            *(_DWORD *)buf = 138543874;
            v34 = v23;
            __int16 v35 = 2112;
            v36 = v22;
            __int16 v37 = 2112;
            uint64_t v38 = v14;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Deregistering connection %@ from container %@.", buf, 0x20u);

            id v6 = v22;
            id v9 = v21;
            self = v20;
            uint64_t v12 = v27;
          }

          v24 = [(HMDUserCloudShareController *)v18 containerIdToConnectionIdentifierMap];
          [v24 removeObjectForKey:v14];

          uint64_t v11 = v28;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v11);
  }

  v25 = [(HMDUserCloudShareController *)self connectedClients];
  [v25 removeObject:v26];
}

- (void)registerWithXpcClient:(id)a3 containerIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDUserCloudShareController *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMDUserCloudShareController_registerWithXpcClient_containerIDs___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __66__HMDUserCloudShareController_registerWithXpcClient_containerIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerWithXpcClient:*(void *)(a1 + 40) containerIDs:*(void *)(a1 + 48)];
}

- (void)_registerWithXpcClient:(id)a3 containerIDs:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v38 = +[HMDUserCloudShareController identifierForConnection:v6];
  if (v38)
  {
    id v35 = v7;
    id v36 = v6;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v14 = [(HMDUserCloudShareController *)self containerIdToConnectionIdentifierMap];
          id v15 = [v14 objectForKeyedSubscript:v13];

          if (v15 && ([v15 isEqual:v38] & 1) == 0)
          {
            id v21 = (void *)MEMORY[0x230FBD990]();
            v22 = self;
            v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v49 = v24;
              __int16 v50 = 2112;
              v51 = v15;
              __int16 v52 = 2112;
              uint64_t v53 = v13;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Another connection with identifier: %@ is registered for the same container: %@.", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v16 = (void *)MEMORY[0x230FBD990]();
            v17 = self;
            v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v49 = v19;
              __int16 v50 = 2112;
              v51 = v38;
              __int16 v52 = 2112;
              uint64_t v53 = v13;
              _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Registering connection identifier: %@ for container: %@.", buf, 0x20u);
            }
            v20 = [(HMDUserCloudShareController *)v17 containerIdToConnectionIdentifierMap];
            [v20 setObject:v38 forKeyedSubscript:v13];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v10);
    }

    v25 = [(HMDUserCloudShareController *)self connectedClients];
    id v6 = v36;
    [v25 addObject:v36];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v26 = obj;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(v26);
          }
          -[HMDUserCloudShareController _resumeRequestsForContainerID:connection:](self, "_resumeRequestsForContainerID:connection:", *(void *)(*((void *)&v39 + 1) + 8 * j), v36, v35);
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v28);
    }

    id v7 = v35;
  }
  else
  {
    long long v31 = (void *)MEMORY[0x230FBD990]();
    long long v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v49 = v34;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot register a client without a valid connection identifier.", buf, 0xCu);
    }
  }
}

- (void)timerDidFire:(id)a3
{
  id v4 = [(HMDUserCloudShareController *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HMDUserCloudShareController_timerDidFire___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __44__HMDUserCloudShareController_timerDidFire___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handlePendingRequestTimeouts];
  [*(id *)(a1 + 32) setPendingRequestTimer:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _startTimerIfNeeded];
}

- (NSHashTable)connectedClients
{
  v3 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  connectedClients = self->_connectedClients;
  return connectedClients;
}

- (NSMutableDictionary)containerIdToConnectionIdentifierMap
{
  v3 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  containerIdToConnectionIdentifierMap = self->_containerIdToConnectionIdentifierMap;
  return containerIdToConnectionIdentifierMap;
}

- (void)handleShareRepairForRemoteClientRequest:(id)a3 home:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F0DD40]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  id v15 = [v8 objectForKeyedSubscript:*MEMORY[0x263F0DD70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  id v36 = 0;
  v18 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:&v36];
  id v35 = v36;
  if (v14) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing required items in payload", buf, 0xCu);
    }
    v24 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Could not decode payload" reason:@"Unable to find required items in payload" suggestion:0];
    v10[2](v10, v24);
  }
  else
  {
    v24 = [(HMDUserCloudShareController *)self delegate];
    v25 = [HMDUserCloudShareRepairRequest alloc];
    id v26 = [v24 currentDateForUserCloudShareController:self];
    id v34 = v9;
    uint64_t v27 = [(HMDUserCloudShareRepairRequest *)v25 initWithStartDate:v26 containerID:v14 home:v9 repairInfo:v18];

    uint64_t v28 = [(HMDUserCloudShareController *)self _connectionForContainerID:v14];
    uint64_t v29 = (void *)v28;
    if (v28)
    {
      [(HMDUserCloudShareController *)self _sendRepairRequest:v27 toConnection:v28];
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      long long v30 = self;
      long long v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        long long v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v38 = v32;
        __int16 v39 = 2112;
        long long v40 = v27;
        __int16 v41 = 2112;
        id v42 = v14;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Add repair request %@ to pending for %@", buf, 0x20u);
      }
      [(HMDUserCloudShareController *)v30 _addRequestToPending:v27];
      [v24 userCloudShareController:v30 wakeClientForRepairWithContainerID:v14];
    }
    v10[2](v10, 0);

    id v9 = v34;
  }
}

- (void)handleShareForRemoteClientRequest:(id)a3 home:(id)a4 completionHandler:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v68 = a5;
  id v10 = v8;
  id v11 = v9;
  v69 = v11;
  if (v10)
  {
    id v12 = v11;
    v66 = self;
    uint64_t v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F0DD50]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    v64 = v15;
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v15];
    id v17 = [v12 uuid];
    LODWORD(v15) = [v17 isEqual:v16];

    if (v15)
    {
      v18 = [v10 objectForKeyedSubscript:*MEMORY[0x263F0DD48]];
      __findUserWithUUID(v18, v12);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      v20 = [v10 objectForKeyedSubscript:*MEMORY[0x263F0DD80]];
      __findUserWithUUID(v20, v12);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      v22 = [v10 objectForKeyedSubscript:*MEMORY[0x263F0DD90]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      id v24 = v23;

      v25 = [v10 objectForKeyedSubscript:*MEMORY[0x263F0DD88]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v26 = v25;
      }
      else {
        id v26 = 0;
      }
      id v27 = v26;

      uint64_t v28 = [v10 objectForKeyedSubscript:*MEMORY[0x263F0DD40]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = 0;
      }
      id v30 = v29;

      if (v19 && v21 && v24 && v30 && v27)
      {
        long long v31 = 0;
      }
      else
      {
        id v38 = v10;
        __int16 v39 = (void *)MEMORY[0x230FBD990]();
        long long v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          __int16 v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v76 = v41;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode all required items from payload.", buf, 0xCu);
        }
        long long v31 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Could not decode payload" reason:@"Unable to decode all required items" suggestion:0];
        id v10 = v38;
      }
    }
    else
    {
      id v35 = (void *)MEMORY[0x230FBD990]();
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        __int16 v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v76 = v37;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Messaged home had different identifier from payload.", buf, 0xCu);
      }
      long long v31 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Inconsistent payload home and originating home" reason:@"Messaged home must match home in payload" suggestion:0];
      id v19 = 0;
      id v21 = 0;
      id v24 = 0;
      id v27 = 0;
      id v30 = 0;
    }

    self = v66;
  }
  else
  {
    long long v32 = (void *)MEMORY[0x230FBD990]();
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v76 = v34;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not decode Remote ClientRequestPayload.", buf, 0xCu);
    }
    long long v31 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Could not decode payload" reason:@"Need a valid payload" suggestion:0];
    id v19 = 0;
    id v21 = 0;
    id v24 = 0;
    id v27 = 0;
    id v30 = 0;
  }

  v67 = v10;
  id v42 = v19;
  id v43 = v21;
  id v44 = v24;
  id v45 = v27;
  id v46 = v30;
  id v47 = v46;
  if (v31)
  {
    id v65 = v46;
    v48 = (void *)MEMORY[0x230FBD990]();
    v49 = self;
    __int16 v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v76 = v51;
      _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Could not decode payload.", buf, 0xCu);
    }
    __int16 v52 = v68;
    (*((void (**)(id, void, void *))v68 + 2))(v68, 0, v31);
    uint64_t v53 = v69;
    v54 = v65;
  }
  else
  {
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v47;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MultiUser.Share.Req", "container=%{signpost.description:attribute}@ ", buf, 0xCu);
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__HMDUserCloudShareController_handleShareForRemoteClientRequest_home_completionHandler___block_invoke;
    aBlock[3] = &unk_264A20880;
    aBlock[4] = self;
    unint64_t v74 = 0xEEEEB0B5B2B2EEEELL;
    id v73 = v68;
    v63 = _Block_copy(aBlock);
    v56 = [HMDUserCloudShareEstablishShareRequest alloc];
    [(HMDUserCloudShareController *)self delegate];
    v57 = v54 = v47;
    v58 = [v57 currentDateForUserCloudShareController:self];
    v59 = self;
    uint64_t v53 = v69;
    v60 = [(HMDUserCloudShareEstablishShareRequest *)v56 initWithHome:v69 fromUser:v42 toUser:v43 encodedShareURL:v44 shareToken:v45 containerID:v54 currentDate:v58 completion:v63];

    v61 = [(HMDUserCloudShareController *)v59 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__HMDUserCloudShareController_handleShareForRemoteClientRequest_home_completionHandler___block_invoke_109;
    block[3] = &unk_264A2F820;
    block[4] = v59;
    v71 = v60;
    v62 = v60;
    dispatch_async(v61, block);

    __int16 v52 = v68;
    long long v31 = 0;
  }
}

void __88__HMDUserCloudShareController_handleShareForRemoteClientRequest_home_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1[4] + 8);
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MultiUser.Share.Req", "error=%{signpost.description:attribute}@ ", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __88__HMDUserCloudShareController_handleShareForRemoteClientRequest_home_completionHandler___block_invoke_109(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleShareForRemoteClientRequest:*(void *)(a1 + 40)];
}

- (void)_handleShareForRemoteClientRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 containerID];
  id v7 = [(HMDUserCloudShareController *)self _connectionForContainerID:v6];

  if (v7)
  {
    [(HMDUserCloudShareController *)self _sendShareRequest:v4 toConnection:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    os_signpost_id_t v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v4 containerID];
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No process registered to handle container %@", (uint8_t *)&v15, 0x16u);
    }
    [(HMDUserCloudShareController *)v9 _addRequestToPending:v4];
    uint64_t v13 = [(HMDUserCloudShareController *)v9 delegate];
    id v14 = [v4 containerID];
    [v13 userCloudShareController:v9 wakeClientWithContainerID:v14];
  }
}

- (void)_sendRepairRequest:(id)a3 toConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  os_signpost_id_t v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v17 = 138543874;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Sending repair request %@ to client %@", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v13 = [(HMDUserCloudShareController *)v10 delegate];
  id v14 = [v6 repairInfo];
  int v15 = [v6 home];
  uint64_t v16 = [v6 containerID];
  [v13 userCloudShareController:v10 sendRepairInfo:v14 toConnection:v7 home:v15 containerID:v16];
}

- (void)_sendShareRequest:(id)a3 toConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v16 = [(HMDUserCloudShareController *)self delegate];
  os_signpost_id_t v9 = [v7 fromUser];
  int v10 = [v7 toUser];
  id v11 = [v7 home];
  uint64_t v12 = [v7 encodedShareURL];
  uint64_t v13 = [v7 shareToken];
  id v14 = [v7 containerID];
  int v15 = [v7 completion];

  [v16 userCloudShareController:self sendShareRequestMessageWithConnection:v6 fromUser:v9 toUser:v10 home:v11 shareURL:v12 shareToken:v13 containerID:v14 completion:v15];
}

- (void)_resumeRequestsForContainerID:(id)a3 connection:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v35 = a4;
  id v7 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v7);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v36 = self;
  id v8 = [(HMDUserCloudShareController *)self pendingRequests];
  os_signpost_id_t v9 = (void *)[v8 copy];

  obuint64_t j = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v39;
    *(void *)&long long v11 = 138543362;
    long long v32 = v11;
    id v33 = v6;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "containerID", v32);
        int v17 = [v16 isEqualToString:v6];

        if (v17)
        {
          v18 = (void *)MEMORY[0x230FBD990]();
          __int16 v19 = v36;
          id v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            __int16 v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v43 = v21;
            __int16 v44 = 2112;
            id v45 = v15;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Resuming request %@", buf, 0x16u);
          }
          id v22 = v15;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v23 = v22;
          }
          else {
            uint64_t v23 = 0;
          }
          id v24 = v23;

          id v25 = v22;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v26 = v25;
          }
          else {
            id v26 = 0;
          }
          id v27 = v26;

          if (v24)
          {
            [(HMDUserCloudShareController *)v19 _sendShareRequest:v24 toConnection:v35];
          }
          else if (v27)
          {
            [(HMDUserCloudShareController *)v19 _sendRepairRequest:v27 toConnection:v35];
          }
          else
          {
            context = (void *)MEMORY[0x230FBD990]();
            uint64_t v28 = v19;
            uint64_t v29 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              id v30 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v32;
              id v43 = v30;
              _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not determine request type.", buf, 0xCu);

              id v6 = v33;
            }
          }
          long long v31 = [(HMDUserCloudShareController *)v19 pendingRequests];
          [v31 removeObject:v25];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v12);
  }

  [(HMDUserCloudShareController *)v36 _removeTimerIfNotNeeded];
}

- (void)_handlePendingRequestTimeouts
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(HMDUserCloudShareController *)self pendingRequests];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v29;
    *(void *)&long long v7 = 138543618;
    long long v27 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "startDate", v27);
        [v12 timeIntervalSinceNow];
        double v14 = -v13;
        [(HMDUserCloudShareController *)self pendingRequestTimeoutInterval];
        double v16 = v15;

        if (v16 < v14)
        {
          int v17 = (void *)MEMORY[0x230FBD990]();
          v18 = self;
          __int16 v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            id v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v27;
            id v33 = v20;
            __int16 v34 = 2112;
            id v35 = v11;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Timing out pending request %@", buf, 0x16u);
          }
          id v21 = v11;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v22 = v21;
          }
          else {
            id v22 = 0;
          }
          id v23 = v22;

          if (v23)
          {
            id v24 = [v23 completion];
            id v25 = [MEMORY[0x263F087E8] hmErrorWithCode:8 description:@"No process received pending request in time" reason:@"No process received share message in required time." suggestion:0];
            ((void (**)(void, void, void *))v24)[2](v24, 0, v25);
          }
          id v26 = [(HMDUserCloudShareController *)v18 pendingRequests];
          [v26 removeObject:v21];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v8);
  }
}

- (void)_addRequestToPending:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  long long v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding request to pending %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(HMDUserCloudShareController *)v7 pendingRequests];
  [v10 addObject:v4];

  [(HMDUserCloudShareController *)v7 _startTimerIfNeeded];
}

- (void)_removeTimerIfNotNeeded
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v9 = [(HMDUserCloudShareController *)self pendingRequests];
  if ([v9 count])
  {
  }
  else
  {
    id v4 = [(HMDUserCloudShareController *)self pendingRequestTimer];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      uint64_t v6 = self;
      long long v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v11 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing timer as there are no more pending requests", buf, 0xCu);
      }
      [(HMDUserCloudShareController *)v6 setPendingRequestTimer:0];
    }
  }
}

- (void)_startTimerIfNeeded
{
  v3 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v8 = [(HMDUserCloudShareController *)self pendingRequests];
  if ([v8 count])
  {
    id v4 = [(HMDUserCloudShareController *)self pendingRequestTimer];

    if (v4) {
      return;
    }
    id v5 = [(HMDUserCloudShareController *)self delegate];
    [(HMDUserCloudShareController *)self pendingRequestTimeoutInterval];
    uint64_t v6 = objc_msgSend(v5, "userCloudShareController:timerWithInterval:", self);
    [(HMDUserCloudShareController *)self setPendingRequestTimer:v6];

    long long v7 = [(HMDUserCloudShareController *)self pendingRequestTimer];
    [v7 setDelegate:self];

    id v8 = [(HMDUserCloudShareController *)self pendingRequestTimer];
    [v8 resume];
  }
}

- (id)_connectionForContainerID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUserCloudShareController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDUserCloudShareController *)self containerIdToConnectionIdentifierMap];
  long long v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = [(HMDUserCloudShareController *)self connectedClients];
    id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          __int16 v13 = +[HMDUserCloudShareController identifierForConnection:v12];
          if ([v13 isEqualToString:v7])
          {
            id v9 = v12;

            goto LABEL_12;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (HMDUserCloudShareController)initWithDelegate:(id)a3 queue:(id)a4 pendingRequestTimeoutInterval:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserCloudShareController;
  uint64_t v10 = [(HMDUserCloudShareController *)&v20 init];
  if (v10)
  {
    uint64_t v11 = HMFGetOSLogHandle();
    logger = v10->_logger;
    v10->_logger = (OS_os_log *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeStrong((id *)&v10->_clientQueue, a4);
    uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    connectedClients = v10->_connectedClients;
    v10->_connectedClients = (NSHashTable *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    containerIdToConnectionIdentifierMap = v10->_containerIdToConnectionIdentifierMap;
    v10->_containerIdToConnectionIdentifierMap = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF980] array];
    pendingRequests = v10->_pendingRequests;
    v10->_pendingRequests = (NSMutableArray *)v17;

    v10->_pendingRequestTimeoutInterval = a5;
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_131833 != -1) {
    dispatch_once(&logCategory__hmf_once_t27_131833, &__block_literal_global_131834);
  }
  v2 = (void *)logCategory__hmf_once_v28_131835;
  return v2;
}

void __42__HMDUserCloudShareController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v28_131835;
  logCategory__hmf_once_v28_131835 = v0;
}

+ (id)identifierForConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 processInfo];
  uint64_t v6 = [v4 processInfo];
  long long v7 = [v6 bundleIdentifier];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      __int16 v19 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get identifier for connection: %@ process info: %@", (uint8_t *)&v14, 0x20u);
    }
  }

  return v7;
}

@end