@interface HMDUserCloudShareManager
+ (id)logCategory;
- (HMDHomeManager)homeManager;
- (HMDUserCloudShareController)userCloudShareController;
- (HMDUserCloudShareManager)initWithHomeManager:(id)a3;
- (HMDUserCloudShareManager)initWithHomeManager:(id)a3 dependency:(id)a4;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)identifier;
- (OS_dispatch_queue)clientQueue;
- (id)currentDateForUserCloudShareController:(id)a3;
- (id)messageDestination;
- (id)userCloudShareController:(id)a3 timerWithInterval:(double)a4;
- (void)_handleAccessoryAdded:(id)a3;
- (void)_handleDeregisterRequest:(id)a3;
- (void)_handleEnableMultiUserChangedNotification:(id)a3;
- (void)_handleLocalHomeDataRemovedNotification:(id *)a3;
- (void)_handleRegisterRequest:(id)a3;
- (void)_handleUserSettingsUpdatedNotification:(id)a3;
- (void)_postMultiUserStatusChangedNotification;
- (void)configureWithMessageDispatcher:(id)a3;
- (void)handleHomeChangedNotification:(id)a3;
- (void)handleRemoteUserClientCloudShareRepairRequest:(id)a3;
- (void)handleRemoteUserClientCloudShareRequest:(id)a3;
- (void)handleUsersChangedNotification:(id)a3;
- (void)handleXPCConnectionInvalidated:(id)a3;
- (void)registerForMessages;
- (void)setMessageDispatcher:(id)a3;
- (void)userCloudShareController:(id)a3 sendRepairInfo:(id)a4 toConnection:(id)a5 home:(id)a6 containerID:(id)a7;
- (void)userCloudShareController:(id)a3 sendShareRequestMessageWithConnection:(id)a4 fromUser:(id)a5 toUser:(id)a6 home:(id)a7 shareURL:(id)a8 shareToken:(id)a9 containerID:(id)a10 completion:(id)a11;
- (void)userCloudShareController:(id)a3 wakeClientForRepairWithContainerID:(id)a4;
- (void)userCloudShareController:(id)a3 wakeClientWithContainerID:(id)a4;
@end

@implementation HMDUserCloudShareManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCloudShareController, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HMDUserCloudShareController)userCloudShareController
{
  return self->_userCloudShareController;
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  v4 = [(HMDUserCloudShareManager *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)handleXPCConnectionInvalidated:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserCloudShareManager *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMDUserCloudShareManager_handleXPCConnectionInvalidated___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMDUserCloudShareManager_handleXPCConnectionInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"connection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) userCloudShareController];
    [v6 invalidateXpcClient:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 40);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received connection invalidated notification, but no connection object was found: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_handleDeregisterRequest:(id)a3
{
  id v11 = a3;
  id v4 = [v11 transport];

  if (v4)
  {
    id v5 = [v11 transport];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = [(HMDUserCloudShareManager *)self userCloudShareController];
      [v8 deregisterXpcClient:v7];
    }
  }
  v9 = [v11 responseHandler];

  if (v9)
  {
    v10 = [v11 responseHandler];
    v10[2](v10, 0, 0);
  }
}

- (void)handleRemoteUserClientCloudShareRepairRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserCloudShareManager *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRepairRequest___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __74__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRepairRequest___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuidForKey:*MEMORY[0x263F0DD50]];
  id v3 = [*(id *)(a1 + 40) homeManager];
  id v4 = [v3 _homeWithUUID:v2];

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Handling share repair message %@.", buf, 0x16u);
    }
    id v11 = [*(id *)(a1 + 40) userCloudShareController];
    int v12 = [*(id *)(a1 + 32) messagePayload];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRepairRequest___block_invoke_80;
    v16[3] = &unk_264A2F3E8;
    id v17 = *(id *)(a1 + 32);
    [v11 handleShareRepairForRemoteClientRequest:v12 home:v4 completion:v16];

    v13 = v17;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not find home for share repair request on remote.", buf, 0xCu);
    }
    uint64_t v15 = *(void **)(a1 + 32);
    v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Home in share repair request not found in remote." reason:@"Home is needed for share repair" suggestion:0];
    [v15 respondWithError:v13];
  }
}

void __74__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRepairRequest___block_invoke_80(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

- (void)handleRemoteUserClientCloudShareRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserCloudShareManager *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRequest___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRequest___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuidForKey:*MEMORY[0x263F0DD50]];
  id v3 = [*(id *)(a1 + 40) homeManager];
  id v4 = [v3 _homeWithUUID:v2];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) userCloudShareController];
    id v6 = [*(id *)(a1 + 32) messagePayload];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRequest___block_invoke_2;
    v16[3] = &unk_264A296D8;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v17 = (void (**)(void, void, void))v7;
    uint64_t v18 = v8;
    [v5 handleShareForRemoteClientRequest:v6 home:v4 completionHandler:v16];

    v9 = v17;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 40);
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v20 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not find home for share request on remote.", buf, 0xCu);
  }
  __int16 v14 = [*(id *)(a1 + 32) responseHandler];

  if (v14)
  {
    v9 = [*(id *)(a1 + 32) responseHandler];
    uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Home in share request not found in remote." reason:@"Home is needed to share" suggestion:0];
    ((void (**)(void, void *, void))v9)[2](v9, v15, 0);

    goto LABEL_7;
  }
LABEL_8:
}

void __68__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) responseHandler];

  if (v7)
  {
    if (v5)
    {
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v17 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Forwarding received client info.", buf, 0xCu);
      }
      uint64_t v14 = *MEMORY[0x263F0DD30];
      id v15 = v5;
      int v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    }
    else
    {
      int v12 = 0;
    }
    v13 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void *))v13)[2](v13, v6, v12);
  }
}

- (void)_handleRegisterRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 transport];

  if (v5)
  {
    id v6 = [v4 transport];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    int v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        int v29 = 138543362;
        v30 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Found xpc connection in message", (uint8_t *)&v29, 0xCu);
      }
      uint64_t v14 = [v4 arrayForKey:*MEMORY[0x263F0DC10]];
      if (v14)
      {
        id v15 = [(HMDUserCloudShareManager *)v10 userCloudShareController];
        [v15 registerWithXpcClient:v8 containerIDs:v14];

        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v22 = (void *)MEMORY[0x230FBD990]();
        v23 = v10;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = HMFGetLogIdentifier();
          v26 = [v8 applicationBundleIdentifier];
          int v29 = 138543618;
          v30 = v25;
          __int16 v31 = 2112;
          v32 = v26;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Missing container IDs while trying to register from process %@", (uint8_t *)&v29, 0x16u);
        }
        uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Container IDs required" reason:@"No containerIDs specified" suggestion:0];
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        int v29 = 138543362;
        v30 = v21;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Transport is not XPC connection.", (uint8_t *)&v29, 0xCu);
      }
      uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Transport is not XPC" reason:@"Need xpc connection" suggestion:0];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@No transport on message.", (uint8_t *)&v29, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Did not find transport" reason:@"Need xpc connection" suggestion:0];
  }
  v27 = [v4 responseHandler];

  if (v27)
  {
    v28 = [v4 responseHandler];
    ((void (**)(void, void *, void))v28)[2](v28, v16, 0);
  }
}

- (void)_handleLocalHomeDataRemovedNotification:(id *)a3
{
  id v4 = [(HMDUserCloudShareManager *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDUserCloudShareManager__handleLocalHomeDataRemovedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __68__HMDUserCloudShareManager__handleLocalHomeDataRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Local home data removed, notifying clients", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _postMultiUserStatusChangedNotification];
}

- (void)_handleUserSettingsUpdatedNotification:(id)a3
{
  id v4 = [(HMDUserCloudShareManager *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMDUserCloudShareManager__handleUserSettingsUpdatedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __67__HMDUserCloudShareManager__handleUserSettingsUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@User settings updated, notifying clients.", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _postMultiUserStatusChangedNotification];
}

- (void)_handleEnableMultiUserChangedNotification:(id)a3
{
  id v4 = [(HMDUserCloudShareManager *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDUserCloudShareManager__handleEnableMultiUserChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __70__HMDUserCloudShareManager__handleEnableMultiUserChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Enable Multi-User changed, notifying clients.", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _postMultiUserStatusChangedNotification];
}

- (void)_postMultiUserStatusChangedNotification
{
}

- (void)_handleAccessoryAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserCloudShareManager *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HMDUserCloudShareManager__handleAccessoryAdded___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__HMDUserCloudShareManager__handleAccessoryAdded___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:@"HMDNotificationAddedAccessoryKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client on adding accessory %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) _postMultiUserStatusChangedNotification];
  }
}

- (void)handleUsersChangedNotification:(id)a3
{
  id v4 = [(HMDUserCloudShareManager *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMDUserCloudShareManager_handleUsersChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __59__HMDUserCloudShareManager_handleUsersChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client on users changed", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _postMultiUserStatusChangedNotification];
}

- (void)handleHomeChangedNotification:(id)a3
{
  id v4 = [(HMDUserCloudShareManager *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDUserCloudShareManager_handleHomeChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __58__HMDUserCloudShareManager_handleHomeChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client on home change", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _postMultiUserStatusChangedNotification];
}

- (id)currentDateForUserCloudShareController:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF910], "date", a3);
}

- (id)userCloudShareController:(id)a3 timerWithInterval:(double)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a4];
  return v4;
}

- (void)userCloudShareController:(id)a3 wakeClientForRepairWithContainerID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"%s%@", *MEMORY[0x263F0DC30], v7];
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client to repair share %@", buf, 0x16u);
  }
  id v13 = v8;
  notify_post((const char *)[v13 UTF8String]);
}

- (void)userCloudShareController:(id)a3 wakeClientWithContainerID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"%s%@", *MEMORY[0x263F0DC40], v7];
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client %@", buf, 0x16u);
  }
  id v13 = v8;
  notify_post((const char *)[v13 UTF8String]);
}

- (void)userCloudShareController:(id)a3 sendRepairInfo:(id)a4 toConnection:(id)a5 home:(id)a6 containerID:(id)a7
{
  v26[3] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F0DD40];
  v26[0] = a7;
  uint64_t v12 = *MEMORY[0x263F0DD70];
  v25[0] = v11;
  v25[1] = v12;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  __int16 v16 = encodeRootObjectForIncomingXPCMessage(a4, 0);
  v26[1] = v16;
  v25[2] = *MEMORY[0x263F0DD58];
  id v17 = [v14 uuid];

  v26[2] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

  id v19 = objc_alloc(MEMORY[0x263F42570]);
  id v20 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v21 = (void *)[v20 initWithUUIDString:*MEMORY[0x263F0DC38]];
  uint64_t v22 = (void *)[v19 initWithTarget:v21];

  v23 = [MEMORY[0x263F42568] messageWithName:*MEMORY[0x263F0DC18] destination:v22 payload:v18];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __98__HMDUserCloudShareManager_userCloudShareController_sendRepairInfo_toConnection_home_containerID___block_invoke;
  v24[3] = &unk_264A2F3E8;
  v24[4] = self;
  [v15 sendMessage:v23 completionHandler:v24];
}

void __98__HMDUserCloudShareManager_userCloudShareController_sendRepairInfo_toConnection_home_containerID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message to client.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)userCloudShareController:(id)a3 sendShareRequestMessageWithConnection:(id)a4 fromUser:(id)a5 toUser:(id)a6 home:(id)a7 shareURL:(id)a8 shareToken:(id)a9 containerID:(id)a10 completion:(id)a11
{
  v50[6] = *MEMORY[0x263EF8340];
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  if (v17)
  {
    v49[0] = *MEMORY[0x263F0DD80];
    id v20 = a7;
    id v21 = a5;
    id v22 = a4;
    v23 = encodeRootObjectForIncomingXPCMessage(a6, 0);
    v50[0] = v23;
    v49[1] = *MEMORY[0x263F0DD48];
    v24 = encodeRootObjectForIncomingXPCMessage(v21, 0);

    v50[1] = v24;
    v49[2] = *MEMORY[0x263F0DD50];
    v25 = encodeRootObjectForIncomingXPCMessage(v20, 0);

    uint64_t v26 = *MEMORY[0x263F0DD90];
    v50[2] = v25;
    v50[3] = v16;
    uint64_t v27 = *MEMORY[0x263F0DD88];
    v49[3] = v26;
    v49[4] = v27;
    v49[5] = *MEMORY[0x263F0DD40];
    v50[4] = v17;
    v50[5] = v18;
    v28 = NSDictionary;
    int v29 = v50;
    v30 = v49;
    uint64_t v31 = 6;
  }
  else
  {
    v47[0] = *MEMORY[0x263F0DD80];
    id v32 = a7;
    id v33 = a5;
    id v34 = a4;
    v23 = encodeRootObjectForIncomingXPCMessage(a6, 0);
    v48[0] = v23;
    v47[1] = *MEMORY[0x263F0DD48];
    v24 = encodeRootObjectForIncomingXPCMessage(v33, 0);

    v48[1] = v24;
    v47[2] = *MEMORY[0x263F0DD50];
    v25 = encodeRootObjectForIncomingXPCMessage(v32, 0);

    uint64_t v35 = *MEMORY[0x263F0DD90];
    v48[2] = v25;
    v48[3] = v16;
    uint64_t v36 = *MEMORY[0x263F0DD40];
    v47[3] = v35;
    v47[4] = v36;
    v48[4] = v18;
    v28 = NSDictionary;
    int v29 = v48;
    v30 = v47;
    uint64_t v31 = 5;
  }
  v37 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:v31];

  v38 = (void *)MEMORY[0x263F42568];
  uint64_t v39 = *MEMORY[0x263F0DC20];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __155__HMDUserCloudShareManager_userCloudShareController_sendShareRequestMessageWithConnection_fromUser_toUser_home_shareURL_shareToken_containerID_completion___block_invoke;
  v45[3] = &unk_264A2B228;
  v45[4] = self;
  id v40 = v19;
  id v46 = v40;
  v41 = [v38 messageWithName:v39 messagePayload:v37 responseHandler:v45];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __155__HMDUserCloudShareManager_userCloudShareController_sendShareRequestMessageWithConnection_fromUser_toUser_home_shareURL_shareToken_containerID_completion___block_invoke_47;
  v43[3] = &unk_264A2EDE0;
  v43[4] = self;
  id v44 = v40;
  id v42 = v40;
  [a4 sendMessage:v41 completionHandler:v43];
}

void __155__HMDUserCloudShareManager_userCloudShareController_sendShareRequestMessageWithConnection_fromUser_toUser_home_shareURL_shareToken_containerID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    int v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Got error from client %@.", (uint8_t *)&v19, 0x16u);
    }
LABEL_10:
    id v14 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x263F0DC08]];
  char v13 = [v12 BOOLValue];

  if ((v13 & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@No error but client did not accept share, treating as error.", (uint8_t *)&v19, 0xCu);
    }
    id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Client failed to accept share" reason:@"Did not accept share" suggestion:0];
    goto LABEL_10;
  }
  id v14 = objc_msgSend(v7, "hmf_dataForKey:", *MEMORY[0x263F0DC00]);
  id v5 = 0;
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __155__HMDUserCloudShareManager_userCloudShareController_sendShareRequestMessageWithConnection_fromUser_toUser_home_shareURL_shareToken_containerID_completion___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message to client.", (uint8_t *)&v8, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)registerForMessages
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserCloudShareManager *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Registering for user share messages.", buf, 0xCu);
  }
  int v8 = [(HMDUserCloudShareManager *)v5 messageDispatcher];
  uint64_t v9 = *MEMORY[0x263F0DC28];
  uint64_t v10 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  uint64_t v12 = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  [v8 registerForMessage:v9 receiver:v5 policies:v11 selector:sel__handleRegisterRequest_];
}

- (void)configureWithMessageDispatcher:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserCloudShareManager *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMDUserCloudShareManager_configureWithMessageDispatcher___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMDUserCloudShareManager_configureWithMessageDispatcher___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) homeManager];
  [*(id *)(a1 + 32) setMessageDispatcher:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) registerForMessages];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_handleHomeChangedNotification_ name:@"HMDHomeAddedNotification" object:v10];

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel_handleHomeChangedNotification_ name:@"HMDHomeRemovedNotification" object:v10];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel_handleXPCConnectionInvalidated_ name:@"HMDXPCClientConnectionDidInvalidateNotification" object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__handleAccessoryAdded_ name:@"HMDNotificationHomeAddedAccessory" object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel__handleEnableMultiUserChangedNotification_ name:*MEMORY[0x263F0CCE8] object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:*(void *)(a1 + 32) selector:sel__handleUserSettingsUpdatedNotification_ name:@"HMDUserSettingsUpdatedNotificationKey" object:0];

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:*(void *)(a1 + 32) selector:sel__handleLocalHomeDataRemovedNotification_ name:@"HMDHomeManagerLocalHomeDataRemovedNotification" object:0];

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:*(void *)(a1 + 32) selector:sel_handleUsersChangedNotification_ name:@"HMDHomeUserRemovedNotification" object:0];
}

- (HMDUserCloudShareManager)initWithHomeManager:(id)a3 dependency:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserCloudShareManager;
  id v8 = [(HMDUserCloudShareManager *)&v20 init];
  if (v8)
  {
    HMDispatchQueueNameString();
    id v9 = objc_claimAutoreleasedReturnValue();
    id v10 = (const char *)[v9 UTF8String];
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v12;

    id v14 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v15 = [v14 initWithUUIDString:*MEMORY[0x263F0DC38]];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v15;

    objc_storeWeak((id *)&v8->_homeManager, v6);
    uint64_t v17 = [v7 createUserCloudShareControllerWithDelegate:v8 queue:v8->_clientQueue];
    userCloudShareController = v8->_userCloudShareController;
    v8->_userCloudShareController = (HMDUserCloudShareController *)v17;
  }
  return v8;
}

- (HMDUserCloudShareManager)initWithHomeManager:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDUserCloudShareManagerCreatorDependency);
  id v6 = [(HMDUserCloudShareManager *)self initWithHomeManager:v4 dependency:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26 != -1) {
    dispatch_once(&logCategory__hmf_once_t26, &__block_literal_global_2793);
  }
  v2 = (void *)logCategory__hmf_once_v27;
  return v2;
}

void __39__HMDUserCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v27;
  logCategory__hmf_once_uint64_t v27 = v0;
}

@end