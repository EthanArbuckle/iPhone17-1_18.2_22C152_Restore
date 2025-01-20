@interface HMDCloudShareMessenger
+ (id)logCategory;
- (BOOL)isConfigured;
- (HMDCloudShareMessenger)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 home:(id)a5;
- (HMDCloudShareMessenger)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 home:(id)a5 messageDispatcher:(id)a6;
- (HMDCloudShareMessengerDelegate)delegate;
- (HMDHome)home;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (id)shareInvitationRetryHandler;
- (void)_requestShareInvitationDataFromUser:(id)a3 retryCount:(unint64_t)a4 activity:(id)a5;
- (void)_sendShareInvitationData:(id)a3 toDestination:(id)a4 retryCount:(unint64_t)a5 activity:(id)a6 completion:(id)a7;
- (void)configure;
- (void)handleShareInviteMessage:(id)a3;
- (void)handleShareRequestInviteMessage:(id)a3;
- (void)handleShareRevokeMessage:(id)a3;
- (void)notifyOfShareAccessRevocationForUser:(id)a3;
- (void)requestShareInvitationDataFromUser:(id)a3;
- (void)sendShareInvitationData:(id)a3 toDevice:(id)a4 completion:(id)a5;
- (void)sendShareInvitationData:(id)a3 toUser:(id)a4 minimumHomeKitVersion:(id)a5 requiredSupportedFeatures:(id)a6 completion:(id)a7;
- (void)setConfigured:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setShareInvitationRetryHandler:(id)a3;
- (void)unconfigure;
@end

@implementation HMDCloudShareMessenger

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareInvitationRetryHandler, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (void)setShareInvitationRetryHandler:(id)a3
{
}

- (id)shareInvitationRetryHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (BOOL)isConfigured
{
  return self->_configured;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCloudShareMessengerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCloudShareMessengerDelegate *)WeakRetained;
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCloudShareMessenger *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleShareRevokeMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 shortDescription];
    int v12 = 138543618;
    v13 = v9;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received share revoke message: %@", (uint8_t *)&v12, 0x16u);
  }
  v11 = [(HMDCloudShareMessenger *)v7 delegate];
  [v11 messengerDidReceiveShareAccessRevocation:v7];

  [v4 respondWithSuccess];
}

- (void)handleShareRequestInviteMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 shortDescription];
    int v29 = 138543618;
    v30 = v9;
    __int16 v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received share share request invite message: %@", (uint8_t *)&v29, 0x16u);
  }
  v11 = [(HMDCloudShareMessenger *)v7 home];
  if (v11)
  {
    int v12 = [v4 userForHome:v11];
    if (v12)
    {
      uint64_t v13 = [v4 remoteSourceDevice];
      if (v13)
      {
        __int16 v14 = (void *)v13;
        v15 = [(HMDCloudShareMessenger *)v7 delegate];
        [v15 messenger:v7 didReceiveInvitationRequestFromUser:v12 device:v14];

        [v4 respondWithSuccess];
      }
      else
      {
        v24 = (void *)MEMORY[0x1D9452090]();
        v25 = v7;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          int v29 = 138543362;
          v30 = v27;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle share request invite message because requesting device cannot be determined", (uint8_t *)&v29, 0xCu);
        }
        v28 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
        [v4 respondWithError:v28];

        __int16 v14 = 0;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1D9452090]();
      v21 = v7;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        int v29 = 138543362;
        v30 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle share request invite message because requesting user cannot be determined", (uint8_t *)&v29, 0xCu);
      }
      __int16 v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
      [v4 respondWithError:v14];
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    v17 = v7;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle share request invite message because home reference is nil", (uint8_t *)&v29, 0xCu);
    }
    int v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    [v4 respondWithError:v12];
  }
}

- (void)handleShareInviteMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received share invite message: %@", buf, 0x16u);
  }
  v10 = [v4 messagePayload];
  v11 = [v10 objectForKeyedSubscript:@"invitationData"];

  if (v11)
  {
    int v12 = [(HMDCloudShareMessenger *)v7 delegate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__HMDCloudShareMessenger_handleShareInviteMessage___block_invoke;
    v19[3] = &unk_1E6A0F9D0;
    v19[4] = v7;
    id v20 = v4;
    [v12 messenger:v7 didReceiveInvitationData:v11 completion:v19];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    __int16 v14 = v7;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      v17 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to find invitation data in share invite message payload: %@", buf, 0x16u);
    }
    v18 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    [v4 respondWithError:v18];
  }
}

void __51__HMDCloudShareMessenger_handleShareInviteMessage___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  v8 = HMFGetOSLogHandle();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Delegate successfully accepted share invitation", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithSuccess];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Delegate failed to accept share invitation: %@", (uint8_t *)&v12, 0x16u);
    }
    if (!v5)
    {
      id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
    }
    [*(id *)(a1 + 40) respondWithError:v5];
  }
}

- (void)_requestShareInvitationDataFromUser:(id)a3 retryCount:(unint64_t)a4 activity:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v8 = (HMDRemoteMessage *)a3;
  id v9 = a5;
  v10 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v11 = [(HMDRemoteMessage *)v8 accountHandle];
  if (v11)
  {
    int v12 = [HMDRemoteAccountMessageDestination alloc];
    uint64_t v13 = [(HMDCloudShareMessenger *)self messageTargetUUID];
    __int16 v14 = [(HMDRemoteAccountMessageDestination *)v12 initWithTarget:v13 handle:v11 multicast:0 deviceCapabilities:0];

    id v15 = [[HMDRemoteMessage alloc] initWithName:@"HMDCloudShareRequestInviteMessage" qualityOfService:17 destination:v14 payload:0 type:0 timeout:1 secure:0.0];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke;
    int v29 = &unk_1E6A08C08;
    v30 = self;
    id v31 = v9;
    unint64_t v33 = a4;
    uint64_t v16 = v8;
    v32 = v16;
    v17 = (void *)MEMORY[0x1D9452090]([(HMDRemoteMessage *)v15 setResponseHandler:&v26]);
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v35 = v20;
      __int16 v36 = 2112;
      v37 = v15;
      __int16 v38 = 2112;
      v39 = v16;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending request CKShare invite message %@ to %@", buf, 0x20u);
    }
    v21 = [(HMDCloudShareMessenger *)v18 messageDispatcher];
    [v21 sendMessage:v15];
  }
  else
  {
    v22 = (void *)MEMORY[0x1D9452090]();
    __int16 v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      __int16 v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not request share invitation data from user with no account handle: %@", buf, 0x16u);
    }
  }
}

void __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke_2;
  block[3] = &unk_1E6A12CA0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v5;
  id v7 = v6;
  id v9 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v14 = v7;
  uint64_t v16 = v8;
  id v15 = v9;
  id v10 = v3;
  dispatch_async(v4, block);
}

void __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      v6 = [*(id *)(a1 + 48) identifier];
      id v7 = [v6 shortDescription];
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v31 = v5;
      __int16 v32 = 2114;
      unint64_t v33 = v7;
      __int16 v34 = 2114;
      uint64_t v35 = v8;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to send request CKShare invite message: %{public}@", buf, 0x20u);
    }
    BOOL v9 = *(void *)(a1 + 64) == 3;
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    uint64_t v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        id v15 = [*(id *)(a1 + 48) identifier];
        uint64_t v16 = [v15 shortDescription];
        uint64_t v17 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138543874;
        id v31 = v14;
        __int16 v32 = 2114;
        unint64_t v33 = v16;
        __int16 v34 = 2048;
        uint64_t v35 = v17;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to send request share invitation message and reached retry limit %lu", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [*(id *)(a1 + 48) identifier];
        id v20 = [v19 shortDescription];
        uint64_t v21 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138544130;
        id v31 = v18;
        __int16 v32 = 2114;
        unint64_t v33 = v20;
        __int16 v34 = 2048;
        uint64_t v35 = 0x4072C00000000000;
        __int16 v36 = 2048;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Will retry sending request CKShare invite message in %fs (already retried %lu time(s))", buf, 0x2Au);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      v22 = [*(id *)(a1 + 40) shareInvitationRetryHandler];
      __int16 v23 = [*(id *)(a1 + 40) workQueue];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke_48;
      v26[3] = &unk_1E6A108B0;
      objc_copyWeak(v29, (id *)buf);
      id v24 = *(id *)(a1 + 56);
      uint64_t v25 = *(void **)(a1 + 64);
      id v27 = v24;
      v29[1] = v25;
      id v28 = *(id *)(a1 + 48);
      ((void (**)(void, void *, void *, double))v22)[2](v22, v23, v26, 300.0);

      objc_destroyWeak(v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke_48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isConfigured]) {
    [WeakRetained _requestShareInvitationDataFromUser:*(void *)(a1 + 32) retryCount:*(void *)(a1 + 56) + 1 activity:*(void *)(a1 + 40)];
  }
}

- (void)_sendShareInvitationData:(id)a3 toDestination:(id)a4 retryCount:(unint64_t)a5 activity:(id)a6 completion:(id)a7
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v16);

  v47 = @"invitationData";
  v48[0] = v12;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  v18 = [[HMDRemoteMessage alloc] initWithName:@"HMDCloudShareInviteMessage" qualityOfService:17 destination:v13 payload:v17 type:0 timeout:1 secure:0.0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke;
  v35[3] = &unk_1E6A0BEF8;
  v35[4] = self;
  id v19 = v14;
  id v36 = v19;
  unint64_t v40 = a5;
  id v20 = v15;
  id v39 = v20;
  id v21 = v12;
  id v37 = v21;
  id v22 = v13;
  id v38 = v22;
  __int16 v23 = (void *)MEMORY[0x1D9452090]([(HMDRemoteMessage *)v18 setResponseHandler:v35]);
  id v24 = self;
  uint64_t v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    uint64_t v26 = v34 = v17;
    [v19 identifier];
    id v27 = v32 = v23;
    [v27 shortDescription];
    v28 = id v33 = v21;
    [(HMFObject *)v18 shortDescription];
    v30 = id v29 = v20;
    *(_DWORD *)buf = 138543874;
    v42 = v26;
    __int16 v43 = 2114;
    v44 = v28;
    __int16 v45 = 2112;
    v46 = v30;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Sending CKShare invite message: %@", buf, 0x20u);

    id v20 = v29;
    id v21 = v33;

    __int16 v23 = v32;
    uint64_t v17 = v34;
  }

  id v31 = [(HMDCloudShareMessenger *)v24 messageDispatcher];
  [v31 sendMessage:v18];
}

void __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke_2;
  block[3] = &unk_1E6A15BD8;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v5;
  id v7 = v6;
  BOOL v9 = *(void **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  id v14 = v7;
  uint64_t v18 = v8;
  id v17 = v9;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v10 = v3;
  dispatch_async(v4, block);
}

void __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      v6 = [*(id *)(a1 + 48) identifier];
      id v7 = [v6 shortDescription];
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v36 = v5;
      __int16 v37 = 2114;
      id v38 = v7;
      __int16 v39 = 2114;
      uint64_t v40 = v8;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to send CKShare invite message: %{public}@", buf, 0x20u);
    }
    BOOL v9 = *(void *)(a1 + 80) == 3;
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    uint64_t v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        id v15 = [*(id *)(a1 + 48) identifier];
        id v16 = [v15 shortDescription];
        uint64_t v17 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 138543874;
        id v36 = v14;
        __int16 v37 = 2114;
        id v38 = v16;
        __int16 v39 = 2048;
        uint64_t v40 = v17;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to send share invitation message and reached retry limit %lu", buf, 0x20u);
      }
      uint64_t v18 = *(void *)(a1 + 72);
      if (v18) {
        (*(void (**)(uint64_t, void, void))(v18 + 16))(v18, 0, *(void *)(a1 + 32));
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = [*(id *)(a1 + 48) identifier];
        __int16 v23 = [v22 shortDescription];
        uint64_t v24 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 138544130;
        id v36 = v21;
        __int16 v37 = 2114;
        id v38 = v23;
        __int16 v39 = 2048;
        uint64_t v40 = 0x4072C00000000000;
        __int16 v41 = 2048;
        uint64_t v42 = v24;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Will retry sending CKShare invite message in %fs (already retried %lu time(s))", buf, 0x2Au);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      uint64_t v25 = [*(id *)(a1 + 40) shareInvitationRetryHandler];
      uint64_t v26 = [*(id *)(a1 + 40) workQueue];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      id v29[2] = __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke_45;
      v29[3] = &unk_1E6A08BE0;
      objc_copyWeak(v34, (id *)buf);
      id v30 = *(id *)(a1 + 56);
      id v27 = *(id *)(a1 + 64);
      id v28 = *(void **)(a1 + 80);
      id v31 = v27;
      v34[1] = v28;
      id v32 = *(id *)(a1 + 48);
      id v33 = *(id *)(a1 + 72);
      ((void (**)(void, void *, void *, double))v25)[2](v25, v26, v29, 300.0);

      objc_destroyWeak(v34);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 72);
    if (v19)
    {
      id v20 = *(void (**)(void))(v19 + 16);
      v20();
    }
  }
}

void __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke_45(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([WeakRetained isConfigured]) {
    [WeakRetained _sendShareInvitationData:*(void *)(a1 + 32) toDestination:*(void *)(a1 + 40) retryCount:*(void *)(a1 + 72) + 1 activity:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

- (void)notifyOfShareAccessRevocationForUser:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (HMDRemoteMessage *)a3;
  uint64_t v5 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDRemoteMessage *)v4 accountHandle];
  if (v6)
  {
    id v7 = [HMDRemoteAccountMessageDestination alloc];
    uint64_t v8 = [(HMDCloudShareMessenger *)self messageTargetUUID];
    BOOL v9 = [(HMDRemoteAccountMessageDestination *)v7 initWithTarget:v8 handle:v6 multicast:1];

    id v10 = [[HMDRemoteMessage alloc] initWithName:@"HMDCloudShareAccessRevokedMessage" qualityOfService:17 destination:v9 payload:0 type:2 timeout:0 secure:0.0];
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      id v21 = v14;
      __int16 v22 = 2112;
      __int16 v23 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending share access revoked message: %@", (uint8_t *)&v20, 0x16u);
    }
    id v15 = [(HMDCloudShareMessenger *)v12 messageDispatcher];
    [v15 sendMessage:v10];
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v20 = 138543618;
      id v21 = v19;
      __int16 v22 = 2112;
      __int16 v23 = v4;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not notify of share access revocation for user with no account handle: %@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)requestShareInvitationDataFromUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Send request share invitation"];
  [(HMDCloudShareMessenger *)self _requestShareInvitationDataFromUser:v4 retryCount:0 activity:v6];
  __HMFActivityScopeLeave();
}

- (void)sendShareInvitationData:(id)a3 toDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [HMDRemoteDeviceMessageDestination alloc];
  uint64_t v13 = [(HMDCloudShareMessenger *)self messageTargetUUID];
  id v14 = [(HMDRemoteDeviceMessageDestination *)v12 initWithTarget:v13 device:v9];

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Send share invitation to device"];
  [(HMDCloudShareMessenger *)self _sendShareInvitationData:v8 toDestination:v14 retryCount:0 activity:v15 completion:v10];
  __HMFActivityScopeLeave();
}

- (void)sendShareInvitationData:(id)a3 toUser:(id)a4 minimumHomeKitVersion:(id)a5 requiredSupportedFeatures:(id)a6 completion:(id)a7
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(HMDCloudShareMessenger *)self workQueue];
  dispatch_assert_queue_V2(v16);

  id v38 = @"kRequiredCapabilitiesKey";
  v36[0] = @"kHomedVersionKey";
  uint64_t v17 = NSNumber;
  uint64_t v18 = [v13 versionString];
  [v18 doubleValue];
  uint64_t v19 = objc_msgSend(v17, "numberWithDouble:");
  v36[1] = @"kHomedSupportedFeaturesKey";
  v37[0] = v19;
  int v20 = [v14 allObjects];
  v37[1] = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  v39[0] = v21;
  __int16 v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];

  __int16 v23 = [v12 accountHandle];
  if (v23)
  {
    uint64_t v24 = [HMDRemoteAccountMessageDestination alloc];
    uint64_t v25 = [(HMDCloudShareMessenger *)self messageTargetUUID];
    uint64_t v26 = [(HMDRemoteAccountMessageDestination *)v24 initWithTarget:v25 handle:v23 multicast:0 deviceCapabilities:v22];

    *(void *)buf = [objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Send share invitation to user"];
    [(HMDCloudShareMessenger *)self _sendShareInvitationData:v32 toDestination:v26 retryCount:0 activity:*(void *)buf completion:v15];
    __HMFActivityScopeLeave();
  }
  else
  {
    id v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v30;
      __int16 v34 = 2112;
      id v35 = v12;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not send share invitation data to user with no account handle: %@", buf, 0x16u);
    }
    uint64_t v26 = (HMDRemoteAccountMessageDestination *)_Block_copy(v15);
    if (v26)
    {
      id v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      (*(void (**)(HMDRemoteAccountMessageDestination *, void, void *))&v26->_multicast)(v26, 0, v31);
    }
  }
}

- (void)unconfigure
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@De-registering from message dispatcher.", (uint8_t *)&v8, 0xCu);
  }
  [(HMDCloudShareMessenger *)v4 setConfigured:0];
  id v7 = [(HMDCloudShareMessenger *)v4 messageDispatcher];
  [v7 deregisterReceiver:v4];
}

- (void)configure
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareMessenger *)self home];
  if (v3)
  {
    id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    uint64_t v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:0 remoteAccessRequired:0];
    v14[0] = v4;
    v14[1] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    id v7 = [(HMDCloudShareMessenger *)self messageDispatcher];
    [v7 registerForMessage:@"HMDCloudShareInviteMessage" receiver:self policies:v6 selector:sel_handleShareInviteMessage_];

    int v8 = [(HMDCloudShareMessenger *)self messageDispatcher];
    [v8 registerForMessage:@"HMDCloudShareRequestInviteMessage" receiver:self policies:v6 selector:sel_handleShareRequestInviteMessage_];

    id v9 = [(HMDCloudShareMessenger *)self messageDispatcher];
    [v9 registerForMessage:@"HMDCloudShareAccessRevokedMessage" receiver:self policies:v6 selector:sel_handleShareRevokeMessage_];

    [(HMDCloudShareMessenger *)self setConfigured:1];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v16 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot configure cloud share messenger because home reference is nil", buf, 0xCu);
    }
  }
}

- (HMDCloudShareMessenger)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 home:(id)a5 messageDispatcher:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v12)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    uint64_t v20 = _HMFPreconditionFailure();
    return (HMDCloudShareMessenger *)__85__HMDCloudShareMessenger_initWithMessageTargetUUID_workQueue_home_messageDispatcher___block_invoke(v20);
  }
  id v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)HMDCloudShareMessenger;
  id v16 = [(HMDCloudShareMessenger *)&v21 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v17->_messageTargetUUID, a3);
    objc_storeWeak((id *)&v17->_home, v13);
    objc_storeStrong((id *)&v17->_messageDispatcher, a6);
    id shareInvitationRetryHandler = v17->_shareInvitationRetryHandler;
    v17->_id shareInvitationRetryHandler = &__block_literal_global_26695;
  }
  return v17;
}

void __85__HMDCloudShareMessenger_initWithMessageTargetUUID_workQueue_home_messageDispatcher___block_invoke(double a1, uint64_t a2, void *a3, void *a4)
{
  int64_t v5 = (uint64_t)(a1 * 1000000000.0);
  id v6 = a4;
  queue = a3;
  dispatch_time_t v7 = dispatch_time(0, v5);
  dispatch_after(v7, queue, v6);
}

- (HMDCloudShareMessenger)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 home:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[HMDMessageDispatcher defaultDispatcher];
  id v12 = [(HMDCloudShareMessenger *)self initWithMessageTargetUUID:v10 workQueue:v9 home:v8 messageDispatcher:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_26709 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_26709, &__block_literal_global_51);
  }
  v2 = (void *)logCategory__hmf_once_v25_26710;
  return v2;
}

uint64_t __37__HMDCloudShareMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v25_26710;
  logCategory__hmf_once_v25_26710 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end