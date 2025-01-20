@interface __HMDHomeAdministratorDynamicRelay
+ (id)logCategory;
- (void)__handleRemoteMessage:(id)a3;
- (void)__handleXPCMessage:(id)a3;
- (void)registerForMessage:(id)a3 policies:(id)a4;
@end

@implementation __HMDHomeAdministratorDynamicRelay

- (void)__handleRemoteMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(__HMDHomeAdministratorReceiver *)self receiver];

  if (v5)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [v4 shortDescription];
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Locally dispatching remote configuration message: %@", buf, 0x16u);
    }
    v11 = [(__HMDHomeAdministratorReceiver *)v7 handler];
    v12 = [v11 home];
    v13 = [v12 residentSyncManager];

    if (v13)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __60____HMDHomeAdministratorDynamicRelay___handleRemoteMessage___block_invoke;
      v14[3] = &unk_264A2F558;
      id v15 = v11;
      [v13 interceptRemoteResidentRequest:v4 proceed:v14];
    }
    else
    {
      [v11 dispatchMessage:v4];
    }
  }
}

- (void)__handleXPCMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(__HMDHomeAdministratorReceiver *)self receiver];

  if (v5)
  {
    v6 = [(__HMDHomeAdministratorReceiver *)self handler];
    if ([v6 shouldRelayMessage:v4])
    {
      id v7 = v4;
      if ([v6 allowLocalFallbackForMessage:v7])
      {
        v8 = (void *)[v7 mutableCopy];
        v9 = [v7 identifier];
        [v8 setIdentifier:v9];

        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __57____HMDHomeAdministratorDynamicRelay___handleXPCMessage___block_invoke;
        v18[3] = &unk_264A2AEE8;
        id v19 = v6;
        uint64_t v20 = self;
        id v21 = v7;
        [v8 setResponseHandler:v18];
        id v7 = (id)[v8 copy];
      }
      id v17 = 0;
      v10 = [v6 operationForMessage:v7 error:&v17];
      id v11 = v17;
      if (v10)
      {
        [v10 setShouldSuspendSyncing:1];
        [v6 addOperation:v10];
      }
      else
      {
        v12 = (void *)MEMORY[0x230FBD990]();
        v13 = self;
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v24 = v15;
          __int16 v25 = 2112;
          id v26 = v11;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create operation with error: %@", buf, 0x16u);
        }
        if (v11)
        {
          [v7 respondWithError:v11];
        }
        else
        {
          v16 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
          [v7 respondWithError:v16];
        }
      }
    }
    else
    {
      v22.receiver = self;
      v22.super_class = (Class)__HMDHomeAdministratorDynamicRelay;
      [(__HMDHomeAdministratorReceiver *)&v22 __handleXPCMessage:v4];
    }
  }
}

- (void)registerForMessage:(id)a3 policies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)__HMDHomeAdministratorDynamicRelay;
  [(__HMDHomeAdministratorReceiver *)&v16 registerForMessage:v6 policies:v7];
  v8 = [(__HMDHomeAdministratorReceiver *)self handler];
  v9 = [v8 home];
  if (![v9 isOwnerUser]) {
    goto LABEL_4;
  }
  v10 = +[HMDDeviceCapabilities deviceCapabilities];
  int v11 = [v10 isResidentCapable];

  if (v11)
  {
    v12 = objc_msgSend(v7, "hmf_objectsPassingTest:", &__block_literal_global_163_240724);
    v9 = (void *)[v12 mutableCopy];

    v13 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    [v13 setRoles:8];
    v14 = (void *)[v13 copy];
    [v9 addObject:v14];

    id v15 = [v8 dispatcher];
    [v15 registerForMessage:v6 receiver:self policies:v9 selector:sel___handleRemoteMessage_];

LABEL_4:
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_240773 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_240773, &__block_literal_global_171_240774);
  }
  v2 = (void *)logCategory__hmf_once_v13_240775;
  return v2;
}

@end