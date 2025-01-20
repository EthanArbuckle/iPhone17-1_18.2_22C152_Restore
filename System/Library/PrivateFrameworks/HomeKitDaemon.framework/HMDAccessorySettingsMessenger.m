@interface HMDAccessorySettingsMessenger
+ (id)logCategory;
- (HMDAccessorySettingsLocalMessageHandler)messageHandler;
- (HMDAccessorySettingsMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 messageRouter:(id)a5 messageHandler:(id)a6 logEventSubmitter:(id)a7;
- (HMDMessageRouter)messageRouter;
- (HMFMessageDispatcher)messageDispatcher;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)messageTargetUUID;
- (id)fetchLogEventFromMessage:(id)a3;
- (id)logIdentifier;
- (void)registerForMessagesWithHome:(id)a3;
- (void)routeAccessorySettingsFetchRequestMessage:(id)a3;
- (void)routeAccessorySettingsUpdateRequestMessage:(id)a3;
- (void)sendFetchAccessorySettingsRequestWithAccessoryUUID:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5;
- (void)sendUpdateAccessorySettingRequestWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6;
- (void)updateAndPostFetchSettingsEvent:(id)a3 responsePayload:(id)a4 responseError:(id)a5;
@end

@implementation HMDAccessorySettingsMessenger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_messageRouter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 40, 1);
}

- (HMDAccessorySettingsLocalMessageHandler)messageHandler
{
  return (HMDAccessorySettingsLocalMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (HMDMessageRouter)messageRouter
{
  return (HMDMessageRouter *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (void)routeAccessorySettingsUpdateRequestMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing accessory settings update request message: %@", buf, 0x16u);
  }
  id v9 = v4;
  v10 = [(HMDAccessorySettingsMessenger *)v6 messageRouter];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__HMDAccessorySettingsMessenger_routeAccessorySettingsUpdateRequestMessage___block_invoke;
  v12[3] = &unk_264A2AFF0;
  v12[4] = v6;
  id v13 = v9;
  id v11 = v9;
  [v10 routeMessage:v11 localHandler:v12];
}

void __76__HMDAccessorySettingsMessenger_routeAccessorySettingsUpdateRequestMessage___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageHandler];
  [v2 handleAccessorySettingsUpdateRequestMessage:*(void *)(a1 + 40)];
}

- (void)routeAccessorySettingsFetchRequestMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v30 = v8;
    __int16 v31 = 2112;
    id v32 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing accessory settings fetch request message: %@", buf, 0x16u);
  }
  id v9 = v4;
  if ([v9 isRemote] & 1) != 0 || (objc_msgSend(v9, "isSecureRemote"))
  {
    id v10 = 0;
    id v11 = v9;
  }
  else
  {
    v12 = [(HMDAccessorySettingsMessenger *)v6 fetchLogEventFromMessage:v9];
    id v13 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15) {
      id v16 = v13;
    }
    else {
      id v16 = (id)[v13 mutableCopy];
    }
    id v17 = v16;

    uint64_t v18 = [v13 responseHandler];
    objc_initWeak((id *)buf, v6);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __75__HMDAccessorySettingsMessenger_routeAccessorySettingsFetchRequestMessage___block_invoke;
    v25[3] = &unk_264A2B560;
    objc_copyWeak(&v28, (id *)buf);
    id v10 = v12;
    id v26 = v10;
    id v19 = v18;
    id v27 = v19;
    [v17 setResponseHandler:v25];
    id v11 = v17;

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  id v20 = v11;
  v21 = [(HMDAccessorySettingsMessenger *)v6 messageRouter];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __75__HMDAccessorySettingsMessenger_routeAccessorySettingsFetchRequestMessage___block_invoke_2;
  v23[3] = &unk_264A2AFF0;
  v23[4] = v6;
  id v24 = v20;
  id v22 = v20;
  [v21 routeMessage:v22 localHandler:v23];
}

void __75__HMDAccessorySettingsMessenger_routeAccessorySettingsFetchRequestMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    [WeakRetained updateAndPostFetchSettingsEvent:v8 responsePayload:v5 responseError:v10];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v5);
  }
}

void __75__HMDAccessorySettingsMessenger_routeAccessorySettingsFetchRequestMessage___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageHandler];
  [v2 handleAccessorySettingsFetchRequestMessage:*(void *)(a1 + 40)];
}

- (id)logIdentifier
{
  id v2 = [(HMDAccessorySettingsMessenger *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)sendUpdateAccessorySettingRequestWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v34 = v17;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v12;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending update request with accessoryUUID: %@ keypath: %@ value: %@", buf, 0x2Au);
  }
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F0E070]) initWithAccessoryUUID:v10 keyPath:v11 settingValue:v12];
  id v19 = objc_alloc(MEMORY[0x263F42570]);
  id v20 = [(HMDAccessorySettingsMessenger *)v15 messageTargetUUID];
  v21 = (void *)[v19 initWithTarget:v20];

  id v22 = objc_alloc(MEMORY[0x263F42590]);
  uint64_t v23 = *MEMORY[0x263F0B5C8];
  id v24 = [v18 payloadCopy];
  v25 = (void *)[v22 initWithName:v23 destination:v21 payload:v24];

  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __123__HMDAccessorySettingsMessenger_sendUpdateAccessorySettingRequestWithAccessoryUUID_keyPath_settingValue_completionHandler___block_invoke;
  v30 = &unk_264A2B228;
  __int16 v31 = v15;
  id v32 = v13;
  id v26 = v13;
  [v25 setResponseHandler:&v27];
  -[HMDAccessorySettingsMessenger routeAccessorySettingsUpdateRequestMessage:](v15, "routeAccessorySettingsUpdateRequestMessage:", v25, v27, v28, v29, v30, v31);
}

void __123__HMDAccessorySettingsMessenger_sendUpdateAccessorySettingRequestWithAccessoryUUID_keyPath_settingValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Send update request responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Send update request responded", (uint8_t *)&v13, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateAndPostFetchSettingsEvent:(id)a3 responsePayload:(id)a4 responseError:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  mach_absolute_time();
  uint64_t v11 = [v8 setResponseTimeStamp:UpTicksToMilliseconds()];
  if (v10)
  {
    [v8 setError:v10];
LABEL_3:
    id v12 = [v8 keyPaths];
    [v8 setFailedKeyPaths:v12];

LABEL_4:
    int v13 = [(HMDAccessorySettingsMessenger *)self logEventSubmitter];
    [v13 submitLogEvent:v8];
    goto LABEL_5;
  }
  if (!v9)
  {
    id v32 = (void *)MEMORY[0x230FBD990](v11);
    uint64_t v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      __int16 v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v35;
      __int16 v52 = 2112;
      id v53 = 0;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Send fetch request responded with error: %@", buf, 0x16u);
    }
    id v36 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v8 setError:v36];

    goto LABEL_3;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x263F0E060]) initWithPayload:v9];
  if (v14)
  {
    __int16 v15 = v14;
    v43 = self;
    id v44 = v9;
    id v16 = (void *)MEMORY[0x263EFF980];
    uint64_t v17 = [v14 fetchResults];
    uint64_t v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

    id v19 = (void *)MEMORY[0x263EFF980];
    id v20 = [v15 fetchResults];
    v21 = objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v42 = v15;
    id v22 = [v15 fetchResults];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v28 = [v27 setting];

          v29 = [v27 keyPath];
          if (v28)
          {
            [v18 addObject:v29];
          }
          else
          {
            [v21 addObject:v29];

            v29 = [v27 error];
            [v8 setError:v29];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v24);
    }

    v30 = (void *)[v18 copy];
    [v8 setSucceededKeyPaths:v30];

    __int16 v31 = (void *)[v21 copy];
    [v8 setFailedKeyPaths:v31];

    id v10 = 0;
    id v9 = v44;
    self = v43;
    goto LABEL_4;
  }
  __int16 v37 = (void *)MEMORY[0x230FBD990]();
  id v38 = self;
  __int16 v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    id v40 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v40;
    __int16 v52 = 2112;
    id v53 = v9;
    _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode fetch request response payload: %@", buf, 0x16u);
  }
  uint64_t v41 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  [v8 setError:v41];

  int v13 = [v8 keyPaths];
  [v8 setFailedKeyPaths:v13];
LABEL_5:
}

- (id)fetchLogEventFromMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  mach_absolute_time();
  uint64_t v5 = UpTicksToMilliseconds();
  id v6 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [v8 name];
    if (v9) {
      id v10 = (__CFString *)v9;
    }
    else {
      id v10 = @"unknown xpc client";
    }
  }
  else
  {
    id v10 = @"homed";
  }
  id v11 = objc_alloc(MEMORY[0x263F0E058]);
  id v12 = [v4 messagePayload];
  int v13 = (void *)[v11 initWithPayload:v12];

  if (v13)
  {
    v14 = [HMDFetchAccessorySettingsLogEvent alloc];
    __int16 v15 = [v13 keyPaths];
    id v16 = [(HMDFetchAccessorySettingsLogEvent *)v14 initWithKeyPaths:v15 startTime:v5 requestingClientName:v10 error:0];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode fetch request payload for metric generation", (uint8_t *)&v22, 0xCu);
    }
    id v16 = 0;
  }

  return v16;
}

- (void)sendFetchAccessorySettingsRequestWithAccessoryUUID:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v29 = v14;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending fetch request with accessoryUUID: %@ keypaths: %@", buf, 0x20u);
  }
  __int16 v15 = (void *)[objc_alloc(MEMORY[0x263F0E058]) initWithAccessoryUUID:v8 keyPaths:v9];
  id v16 = objc_alloc(MEMORY[0x263F42570]);
  uint64_t v17 = [(HMDAccessorySettingsMessenger *)v12 messageTargetUUID];
  uint64_t v18 = (void *)[v16 initWithTarget:v17];

  id v19 = objc_alloc(MEMORY[0x263F42590]);
  uint64_t v20 = *MEMORY[0x263F0B5B8];
  v21 = [v15 payloadCopy];
  int v22 = (void *)[v19 initWithName:v20 destination:v18 payload:v21];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __111__HMDAccessorySettingsMessenger_sendFetchAccessorySettingsRequestWithAccessoryUUID_keyPaths_completionHandler___block_invoke;
  v25[3] = &unk_264A2B910;
  id v26 = v9;
  id v27 = v10;
  void v25[4] = v12;
  id v23 = v9;
  id v24 = v10;
  [v22 setResponseHandler:v25];
  [(HMDAccessorySettingsMessenger *)v12 routeAccessorySettingsFetchRequestMessage:v22];
}

void __111__HMDAccessorySettingsMessenger_sendFetchAccessorySettingsRequestWithAccessoryUUID_keyPaths_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F0E060]) initWithPayload:v6];
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    id v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        int v22 = 138543362;
        id v23 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Send fetch request responded", (uint8_t *)&v22, 0xCu);
      }
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = [v7 fetchResults];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        int v22 = 138543618;
        id v23 = v20;
        __int16 v24 = 2112;
        id v25 = v6;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode fetch request response payload: %@", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = [MEMORY[0x263F0E040] fetchResultsWithKeyPaths:*(void *)(a1 + 40) failureType:3];
    }
    v21 = (void *)v14;
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v14);
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v22 = 138543618;
      id v23 = v18;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Send fetch request responded with error: %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v19 = *(void *)(a1 + 48);
    v7 = [MEMORY[0x263F0E040] fetchResultsWithKeyPaths:*(void *)(a1 + 40) failureType:0];
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v7);
  }
}

- (void)registerForMessagesWithHome:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  id v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:0 remoteAccessRequired:0];
  id v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];

  id v9 = [(HMDAccessorySettingsMessenger *)self messageDispatcher];
  uint64_t v10 = *MEMORY[0x263F0B5B8];
  v16[0] = v5;
  v16[1] = v6;
  v16[2] = v7;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  [v9 registerForMessage:v10 receiver:self policies:v11 selector:sel_routeAccessorySettingsFetchRequestMessage_];

  id v12 = [(HMDAccessorySettingsMessenger *)self messageDispatcher];
  uint64_t v13 = *MEMORY[0x263F0B5C8];
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v8;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  [v12 registerForMessage:v13 receiver:self policies:v14 selector:sel_routeAccessorySettingsUpdateRequestMessage_];
}

- (HMDAccessorySettingsMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 messageRouter:(id)a5 messageHandler:(id)a6 logEventSubmitter:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id obj = a7;
  id v17 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v14)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  uint64_t v18 = v17;
  if (!v17)
  {
LABEL_13:
    int v22 = (void *)_HMFPreconditionFailure();
    return (HMDAccessorySettingsMessenger *)+[HMDAccessorySettingsMessenger logCategory];
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDAccessorySettingsMessenger;
  uint64_t v19 = [(HMDAccessorySettingsMessenger *)&v25 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageDispatcher, a4);
    objc_storeStrong((id *)&v20->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v20->_messageRouter, a5);
    objc_storeStrong((id *)&v20->_messageHandler, a6);
    objc_storeStrong((id *)&v20->_logEventSubmitter, obj);
  }

  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_241740 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_241740, &__block_literal_global_241741);
  }
  id v2 = (void *)logCategory__hmf_once_v12_241742;
  return v2;
}

void __44__HMDAccessorySettingsMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v12_241742;
  logCategory__hmf_once_v12_241742 = v0;
}

@end