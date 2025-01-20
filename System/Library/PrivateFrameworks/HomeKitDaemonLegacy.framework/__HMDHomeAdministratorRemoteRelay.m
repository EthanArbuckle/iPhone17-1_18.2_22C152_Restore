@interface __HMDHomeAdministratorRemoteRelay
+ (id)logCategory;
- (void)__handleXPCMessage:(id)a3;
@end

@implementation __HMDHomeAdministratorRemoteRelay

- (void)__handleXPCMessage:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(__HMDHomeAdministratorReceiver *)self receiver];

  if (v5)
  {
    v6 = [(__HMDHomeAdministratorReceiver *)self handler];
    id v27 = 0;
    v7 = [v6 operationForMessage:v4 error:&v27];
    id v8 = v27;
    if (v7)
    {
      [v7 setShouldSuspendSyncing:1];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __56____HMDHomeAdministratorRemoteRelay___handleXPCMessage___block_invoke;
      v24[3] = &unk_1E6A196E0;
      id v9 = v6;
      v25 = (void (**)(void, void, void))v9;
      id v10 = v4;
      id v26 = v10;
      [v7 setSendCompletionBlock:v24];
      [v7 setResponseHandler:0];
      objc_initWeak((id *)location, v7);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __56____HMDHomeAdministratorRemoteRelay___handleXPCMessage___block_invoke_2;
      v20 = &unk_1E6A16550;
      objc_copyWeak(&v23, (id *)location);
      v21 = self;
      id v22 = v10;
      [v7 setCompletionBlock:&v17];
      objc_msgSend(v9, "addOperation:", v7, v17, v18, v19, v20, v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)location);

      v11 = v25;
    }
    else
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v15;
        __int16 v29 = 2112;
        id v30 = v8;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create operation with error: %@", location, 0x16u);
      }
      v16 = [v4 responseHandler];

      if (!v16) {
        goto LABEL_9;
      }
      v11 = [v4 responseHandler];
      ((void (**)(void, id, void))v11)[2](v11, v8, 0);
    }

LABEL_9:
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_167014 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_167014, &__block_literal_global_167);
  }
  v2 = (void *)logCategory__hmf_once_v17_167015;
  return v2;
}

@end