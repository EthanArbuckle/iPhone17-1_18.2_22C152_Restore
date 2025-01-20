@interface HMDRemoteLoginHandler
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)remoteMessages;
- (ACAccount)loggedInAccount;
- (ACAccountStore)accountStore;
- (BOOL)targetSupportsAccounts;
- (HMDAppleMediaAccessory)accessory;
- (HMDRemoteLoginAnisetteDataHandler)anisetteDataHandler;
- (HMDRemoteLoginHandler)initWithAccessory:(id)a3 loggedInAccountData:(id)a4;
- (HMDRemoteLoginHandler)initWithCoder:(id)a3;
- (HMDRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5;
- (HMDRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5 accountStore:(id)a6 targetSupportsAccounts:(BOOL)a7;
- (HMDRemoteLoginInitiator)initiator;
- (HMDRemoteLoginReceiver)receiver;
- (HMEEventForwarder)eventForwarder;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMFMessageDispatcher)msgDispatcher;
- (HMFStagedValue)stagedLoggedInAccount;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)accountInfoForAccount:(id)a3;
- (id)accountInfoFromLastEvent;
- (id)eventSource;
- (id)eventTopicForAccountInfo;
- (id)logIdentifier;
- (void)_handleUpdateLoggedInAccountMessage:(id)a3;
- (void)_postAccountInfoFromAccountStore;
- (void)_postUpdatedAccountInfo:(id)a3;
- (void)_registerForUsernameUpdates;
- (void)_updateLoggedInAccount:(id)a3;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4 eventStoreReadHandle:(id)a5 eventForwarder:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)handleAccountUsernameUpdatedOnCurrentDevice:(id)a3;
- (void)registerForMessages;
- (void)setEventForwarder:(id)a3;
- (void)setEventStoreReadHandle:(id)a3;
- (void)setLoggedInAccount:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)stageLoggedInAccount:(id)a3;
- (void)stagedValue:(id)a3 didExpireValue:(id)a4;
- (void)updateFrameworkWithReason:(id)a3;
@end

@implementation HMDRemoteLoginHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_stagedLoggedInAccount, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_loggedInAccount, 0);
  objc_storeStrong((id *)&self->_anisetteDataHandler, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (BOOL)targetSupportsAccounts
{
  return self->_targetSupportsAccounts;
}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)objc_getProperty(self, a2, 104, 1);
}

- (HMFStagedValue)stagedLoggedInAccount
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEventForwarder:(id)a3
{
}

- (HMEEventForwarder)eventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEventStoreReadHandle:(id)a3
{
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setLoggedInAccount:(id)a3
{
}

- (ACAccount)loggedInAccount
{
  return self->_loggedInAccount;
}

- (HMDRemoteLoginAnisetteDataHandler)anisetteDataHandler
{
  return self->_anisetteDataHandler;
}

- (HMDAppleMediaAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAppleMediaAccessory *)WeakRetained;
}

- (HMDRemoteLoginReceiver)receiver
{
  return self->_receiver;
}

- (HMDRemoteLoginInitiator)initiator
{
  return self->_initiator;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Unstaging logged in account: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDRemoteLoginHandler *)v9 updateFrameworkWithReason:@"HMDRemoteLoginHandlerStagedLoggedInAccount"];
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  v4 = [(HMDRemoteLoginHandler *)self uuid];
  [v11 encodeObject:v4 forKey:@"kIdentifierKey"];

  v5 = [(HMDRemoteLoginHandler *)self accessory];
  [v11 encodeConditionalObject:v5 forKey:@"accessory"];

  id v6 = [(HMDRemoteLoginHandler *)self loggedInAccount];
  [v11 encodeObject:v6 forKey:@"kRemoteLoginAccount"];

  if (objc_msgSend(v11, "hmd_isForXPCTransport"))
  {
    id v7 = [(HMDRemoteLoginHandler *)self initiator];
    v8 = [v7 anisetteProviderBridge];
    [v11 encodeObject:v8 forKey:@"kRemoteLoginAnisetterProviderBridge"];

    v9 = [(HMDRemoteLoginHandler *)self stagedLoggedInAccount];
    v10 = [v9 value];
    [v11 encodeObject:v10 forKey:@"kStagedRemoteLoginAccount"];
  }
}

- (HMDRemoteLoginHandler)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentifierKey"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRemoteLoginAccount"];

  v8 = [(HMDRemoteLoginHandler *)self initWithUUID:v5 accessory:v6 loggedInAccount:v7];
  return v8;
}

- (void)handleAccountUsernameUpdatedOnCurrentDevice:(id)a3
{
  id v4 = [(HMDRemoteLoginHandler *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDRemoteLoginHandler_handleAccountUsernameUpdatedOnCurrentDevice___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __69__HMDRemoteLoginHandler_handleAccountUsernameUpdatedOnCurrentDevice___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = +[HMDRemoteLoginUtilities primaryITunesAccount];
  v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [MEMORY[0x263F42610] defaultFormatter];
    v8 = [v7 privateStringForObjectValue:v2];
    int v19 = 138543618;
    v20 = v6;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEBUG, "%{public}@loggedInAccount On Update:%@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v9 = [*(id *)(a1 + 32) loggedInAccount];
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = [*(id *)(a1 + 32) loggedInAccount];
    int v12 = [v11 username];
    v13 = [v2 username];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = *(id *)(a1 + 32);
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = HMFGetLogIdentifier();
        int v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account on username change", (uint8_t *)&v19, 0xCu);
      }
      [*(id *)(a1 + 32) _updateLoggedInAccount:v2];
    }
  }
}

- (void)_registerForUsernameUpdates
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Register for username updates", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:v4 name:@"HMDHomeManagerIDMSAccountUsernameDidUpdateNotification" object:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:v4 selector:sel_handleAccountUsernameUpdatedOnCurrentDevice_ name:@"HMDHomeManagerIDMSAccountUsernameDidUpdateNotification" object:0];

  [(HMDRemoteLoginHandler *)v4 handleAccountUsernameUpdatedOnCurrentDevice:0];
}

- (void)_updateLoggedInAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = [(HMDRemoteLoginHandler *)v6 accessory];
    [v9 supportsMessagedHomePodSettings];
    v10 = HMFBooleanToString();
    int v14 = 138543874;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    int v19 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating logged in account to: %@, supportsMessagedHomePodSettings: %@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v11 = [(HMDRemoteLoginHandler *)v6 accessory];
  int v12 = [v11 supportsMessagedHomePodSettings];

  if (v12)
  {
    [(HMDRemoteLoginHandler *)v6 _postUpdatedAccountInfo:v4];
  }
  else
  {
    v13 = [MEMORY[0x263F42568] entitledMessageWithName:@"kRemoteLoginAccountUpdatedNotificationKey" messagePayload:0];
    __updateLoggedInAccount(v6, v4, v13);
  }
}

- (void)_postUpdatedAccountInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDRemoteLoginHandler *)self targetSupportsAccounts])
  {
    v5 = (void *)MEMORY[0x230FBD990]([(HMDRemoteLoginHandler *)self setLoggedInAccount:v4]);
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting event to update logged in account: %@", buf, 0x16u);
    }
    int v9 = [(HMDRemoteLoginHandler *)v6 workQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__HMDRemoteLoginHandler__postUpdatedAccountInfo___block_invoke;
    v14[3] = &unk_264A2F820;
    v14[4] = v6;
    id v15 = v4;
    dispatch_async(v9, v14);
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to post account: %@ due to unsupported account target", buf, 0x16u);
    }
  }
}

void __49__HMDRemoteLoginHandler__postUpdatedAccountInfo___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) eventTopicForAccountInfo];
  v3 = [*(id *)(a1 + 32) eventForwarder];
  uint64_t v4 = [*(id *)(a1 + 32) eventSource];
  v5 = (void *)v4;
  if (v2) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6 || v4 == 0)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138544386;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v2;
      __int16 v36 = 2112;
      v37 = v3;
      __int16 v38 = 2112;
      v39 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to post event to update logged in account: %@ due to missing topic: %@ event forwarder: %@ event source: %@", buf, 0x34u);
    }
  }
  else
  {
    v13 = [*(id *)(a1 + 32) accountInfoForAccount:*(void *)(a1 + 40)];
    int v14 = [*(id *)(a1 + 32) accountInfoFromLastEvent];
    id v15 = v14;
    if (v14 && [v14 isEqual:v13])
    {
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        __int16 v32 = 2112;
        v33 = v15;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Skip posting event to update logged in account as it matches account info from last event: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = *(id *)(a1 + 32);
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v31 = v23;
        __int16 v32 = 2112;
        v33 = v2;
        __int16 v34 = 2112;
        v35 = v13;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Forwarding account info event with topic: %@ for accountInfo: %@", buf, 0x20u);
      }
      id v24 = objc_alloc(MEMORY[0x263F49390]);
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      v25 = objc_msgSend(v24, "initWithSource:cachePolicy:combineType:timestamp:", v5, 2, 2);
      id v26 = objc_alloc(MEMORY[0x263F49380]);
      v27 = [v13 protoData];
      v28 = (void *)[v26 initWithEventData:v27 metadata:v25];

      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __49__HMDRemoteLoginHandler__postUpdatedAccountInfo___block_invoke_55;
      v29[3] = &unk_264A2F3E8;
      v29[4] = *(void *)(a1 + 32);
      [v3 forwardEvent:v28 topic:v2 completion:v29];
    }
  }
}

void __49__HMDRemoteLoginHandler__postUpdatedAccountInfo___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to forward account info event with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_postAccountInfoFromAccountStore
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDRemoteLoginHandler *)self accessory];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 supportsMessagedHomePodSettings]
      && [v4 isCurrentAccessory])
    {
      id v5 = [(HMDRemoteLoginHandler *)self accountStore];
      BOOL v6 = objc_msgSend(v5, "hmd_ams_activeiTunesAccount");

      id v7 = (void *)MEMORY[0x230FBD990]();
      int v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = HMFGetLogIdentifier();
        int v15 = 138543618;
        __int16 v16 = v10;
        __int16 v17 = 2112;
        __int16 v18 = v6;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Posting account store account: %@", (uint8_t *)&v15, 0x16u);
      }
      [(HMDRemoteLoginHandler *)v8 _postUpdatedAccountInfo:v6];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to post account info from account store due to missing accessory", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (id)eventTopicForAccountInfo
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDRemoteLoginHandler *)self accessory];
  uint64_t v4 = [v3 uuid];
  id v5 = [v3 home];
  BOOL v6 = [v5 uuid];

  if (v4 && v6)
  {
    id v7 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B2D8] homeUUID:v6 accessoryUUID:v4];
  }
  else
  {
    int v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      int v14 = v11;
      __int16 v15 = 2112;
      __int16 v16 = v4;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get account info event topic due to missing accessory uuid: %@ home uuid: %@", (uint8_t *)&v13, 0x20u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)accountInfoForAccount:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F0DFB0];
  id v4 = a3;
  id v5 = [v3 alloc];
  BOOL v6 = [v4 username];
  id v7 = objc_msgSend(v4, "hmd_aa_altDSID");
  int v8 = objc_msgSend(v4, "hmd_ams_altDSID");

  id v9 = (void *)[v5 initWithUsername:v6 aaAltDSID:v7 amsAltDSID:v8 signedIn:v4 != 0];
  return v9;
}

- (id)accountInfoFromLastEvent
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(HMDRemoteLoginHandler *)self eventTopicForAccountInfo];
  if (v3)
  {
    id v4 = [(HMDRemoteLoginHandler *)self eventStoreReadHandle];
    if (v4)
    {
      id v5 = [(HMDRemoteLoginHandler *)self eventStoreReadHandle];
      BOOL v6 = [v5 lastEventForTopic:v3];

      if (v6)
      {
        id v7 = objc_alloc(MEMORY[0x263F0DFB0]);
        int v8 = [v6 encodedData];
        id v9 = (void *)[v7 initWithProtoData:v8];

        if (v9)
        {
          id v10 = v9;
        }
        else
        {
          uint64_t v19 = (void *)MEMORY[0x230FBD990]();
          uint64_t v20 = self;
          id v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = HMFGetLogIdentifier();
            int v24 = 138543362;
            v25 = v22;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last account info event account due invalid stored event data", (uint8_t *)&v24, 0xCu);
          }
        }
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      __int16 v15 = (void *)MEMORY[0x230FBD990]();
      __int16 v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = HMFGetLogIdentifier();
        int v24 = 138543362;
        v25 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last account info event account due to no event store read handle", (uint8_t *)&v24, 0xCu);
      }
      id v9 = 0;
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v24 = 138543362;
      v25 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last account info event account due to no topic", (uint8_t *)&v24, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)eventSource
{
  v2 = [(HMDRemoteLoginHandler *)self accessory];
  id v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)updateFrameworkWithReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDRemoteLoginHandler *)self accessory];
  BOOL v6 = [v5 home];
  id v7 = [v6 homeManager];

  if (v7)
  {
    int v8 = [(HMDRemoteLoginHandler *)self uuid];
    [v7 updateGenerationCounterWithReason:v4 sourceUUID:v8 shouldNotifyClients:1];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v12;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update home graph without a home manager for reason: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)stageLoggedInAccount:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging logged in account: %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(HMDRemoteLoginHandler *)v6 stagedLoggedInAccount];
  [v9 stageValue:v4 withTimeout:600.0];

  [(HMDRemoteLoginHandler *)v6 updateFrameworkWithReason:@"HMDRemoteLoginHandlerStagedLoggedInAccount"];
}

- (void)_handleUpdateLoggedInAccountMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = [v4 shortDescription];
    int v40 = 138543618;
    v41 = v8;
    __int16 v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update logged in account message: %@", (uint8_t *)&v40, 0x16u);
  }
  int v10 = [v4 dataForKey:@"kRemoteLoginAccount"];
  if (v10)
  {
    id v11 = [MEMORY[0x263F08928] deserializeObjectWithData:v10 allowedClass:objc_opt_class() frameworkClasses:MEMORY[0x263EFFA68]];
    uint64_t v12 = [(HMDRemoteLoginHandler *)v6 loggedInAccount];
    if (!v12) {
      goto LABEL_10;
    }
    id v13 = (void *)v12;
    uint64_t v14 = objc_msgSend(v11, "aa_altDSID");
    __int16 v15 = [(HMDRemoteLoginHandler *)v6 loggedInAccount];
    id v16 = objc_msgSend(v15, "aa_altDSID");
    int v17 = HMFEqualObjects();

    if (v17)
    {
      __int16 v18 = (void *)MEMORY[0x230FBD990]();
      uint64_t v19 = v6;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        int v40 = 138543618;
        v41 = v21;
        __int16 v42 = 2112;
        v43 = v11;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Updated account matches the currently logged in account: %@", (uint8_t *)&v40, 0x16u);
      }
      v22 = [v4 responseHandler];

      if (!v22) {
        goto LABEL_25;
      }
    }
    else
    {
LABEL_10:
      uint64_t v23 = [(HMDRemoteLoginHandler *)v6 loggedInAccount];

      if (v23)
      {
        int v24 = (void *)MEMORY[0x230FBD990]();
        v25 = v6;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = HMFGetLogIdentifier();
          int v40 = 138543362;
          v41 = v27;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to update account, existing account present", (uint8_t *)&v40, 0xCu);
        }
        v28 = [v4 responseHandler];

        if (!v28) {
          goto LABEL_25;
        }
        v29 = [MEMORY[0x263F087E8] hmErrorWithCode:48 description:@"Not supported." reason:@"Existing account present." suggestion:0];
        v30 = [v4 responseHandler];
        ((void (**)(void, void *, void))v30)[2](v30, v29, 0);

        goto LABEL_24;
      }
      __int16 v38 = [(HMDRemoteLoginHandler *)v6 accessory];
      int v39 = [v38 supportsMessagedHomePodSettings];

      if (v39) {
        [(HMDRemoteLoginHandler *)v6 stageLoggedInAccount:v11];
      }
      else {
        __updateLoggedInAccount(v6, v11, v4);
      }
    }
    v29 = [v4 responseHandler];
    v37 = (void (*)(void))v29[2];
LABEL_23:
    v37();
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  v31 = (void *)MEMORY[0x230FBD990]();
  __int16 v32 = v6;
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    __int16 v34 = HMFGetLogIdentifier();
    v35 = [v4 messagePayload];
    int v40 = 138543618;
    v41 = v34;
    __int16 v42 = 2112;
    v43 = v35;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Missing serialized account in message payload: %@", (uint8_t *)&v40, 0x16u);
  }
  __int16 v36 = [v4 responseHandler];

  if (v36)
  {
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v29 = [v4 responseHandler];
    v37 = (void (*)(void))v29[2];
    goto LABEL_23;
  }
LABEL_26:
}

- (void)registerForMessages
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(HMDRemoteLoginHandler *)self msgDispatcher];
  uint64_t v4 = *MEMORY[0x263F0D500];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:33];
  v10[0] = v5;
  BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v3 registerForMessage:v4 receiver:self policies:v6 selector:sel__handleUpdateLoggedInAccountMessage_];

  id v7 = [(HMDRemoteLoginHandler *)self initiator];
  [v7 registerForMessages];

  int v8 = [(HMDRemoteLoginHandler *)self receiver];
  [v8 registerForMessages];

  id v9 = [(HMDRemoteLoginHandler *)self anisetteDataHandler];
  [v9 registerForMessages];
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4 eventStoreReadHandle:(id)a5 eventForwarder:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(HMDRemoteLoginHandler *)self setWorkQueue:v13];
  [(HMDRemoteLoginHandler *)self setMsgDispatcher:v12];
  [(HMDRemoteLoginHandler *)self setEventStoreReadHandle:v11];

  [(HMDRemoteLoginHandler *)self setEventForwarder:v10];
  uint64_t v14 = [(HMDRemoteLoginHandler *)self initiator];
  [v14 configureWithWorkQueue:v13 messageDispatcher:v12];

  __int16 v15 = [(HMDRemoteLoginHandler *)self receiver];
  [v15 configureWithWorkQueue:v13 messageDispatcher:v12];

  id v16 = [(HMDRemoteLoginHandler *)self anisetteDataHandler];
  [v16 configureWithWorkQueue:v13 messageDispatcher:v12];

  [(HMDRemoteLoginHandler *)self registerForMessages];
  [(HMDRemoteLoginHandler *)self _postAccountInfoFromAccountStore];
}

- (id)logIdentifier
{
  v2 = [(HMDRemoteLoginHandler *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (HMDRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5 accountStore:(id)a6 targetSupportsAccounts:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HMDRemoteLoginHandler;
  int v17 = [(HMDRemoteLoginHandler *)&v28 init];
  __int16 v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v14);
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v18->_loggedInAccount, a5);
    uint64_t v19 = [objc_alloc(MEMORY[0x263F42638]) initWithValue:0];
    stagedLoggedInAccount = v18->_stagedLoggedInAccount;
    v18->_stagedLoggedInAccount = (HMFStagedValue *)v19;

    [(HMFStagedValue *)v18->_stagedLoggedInAccount setDelegate:v18];
    id v21 = [[HMDRemoteLoginInitiator alloc] initWithUUID:v13 accessory:v14 remoteLoginHandler:v18];
    initiator = v18->_initiator;
    v18->_initiator = v21;

    uint64_t v23 = [(HMDRemoteLoginBase *)[HMDRemoteLoginReceiver alloc] initWithUUID:v13 accessory:v14 remoteLoginHandler:v18];
    receiver = v18->_receiver;
    v18->_receiver = v23;

    v25 = [[HMDRemoteLoginAnisetteDataHandler alloc] initWithUUID:v13 accessory:v14];
    anisetteDataHandler = v18->_anisetteDataHandler;
    v18->_anisetteDataHandler = v25;

    objc_storeStrong((id *)&v18->_accountStore, a6);
    v18->_targetSupportsAccounts = a7;
  }

  return v18;
}

- (HMDRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[HMDAppleAccountManager sharedManager];
  id v12 = [v11 accountStore];

  id v13 = [(HMDRemoteLoginHandler *)self initWithUUID:v10 accessory:v9 loggedInAccount:v8 accountStore:v12 targetSupportsAccounts:1];
  return v13;
}

- (HMDRemoteLoginHandler)initWithAccessory:(id)a3 loggedInAccountData:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v20 = 0;
    id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v20];
    id v9 = v20;
    if (v9)
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v13;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive logged in account from logged in account data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v9 = 0;
    id v8 = 0;
  }
  id v14 = (void *)MEMORY[0x263F08C38];
  id v15 = [v6 uuid];
  id v21 = @"HMDRemoteLoginHandler";
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  int v17 = objc_msgSend(v14, "hm_deriveUUIDFromBaseUUID:withSalts:", v15, v16);
  __int16 v18 = [(HMDRemoteLoginHandler *)self initWithUUID:v17 accessory:v6 loggedInAccount:v8];

  return v18;
}

+ (id)remoteMessages
{
  v9[16] = *MEMORY[0x263EF8340];
  v9[0] = @"kHMDRemoteLoginCompanionAuthenticationRequest";
  v9[1] = @"kHMDRemoteLoginProxyAuthenticationRequest";
  v9[2] = @"kHMDRemoteLoginAuthenticationResponse";
  v9[3] = @"kHMDRemoteLoginProxyDeviceRequest";
  v9[4] = @"kHMDRemoteLoginProxyDeviceResponse";
  v9[5] = @"kHMDRemoteLoginSignoutRequest";
  uint64_t v2 = *MEMORY[0x263F0EA18];
  v9[6] = *MEMORY[0x263F0EA10];
  v9[7] = v2;
  uint64_t v3 = *MEMORY[0x263F0EA28];
  v9[8] = *MEMORY[0x263F0EA20];
  v9[9] = v3;
  uint64_t v4 = *MEMORY[0x263F0E9E8];
  v9[10] = *MEMORY[0x263F0E9E0];
  v9[11] = v4;
  uint64_t v5 = *MEMORY[0x263F0E9F8];
  v9[12] = *MEMORY[0x263F0E9F0];
  v9[13] = v5;
  uint64_t v6 = *MEMORY[0x263F0EA08];
  v9[14] = *MEMORY[0x263F0EA00];
  v9[15] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:16];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_271814 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_271814, &__block_literal_global_271815);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v2_271816;
  return v2;
}

void __36__HMDRemoteLoginHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_271816;
  logCategory__hmf_once_v2_271816 = v0;
}

@end