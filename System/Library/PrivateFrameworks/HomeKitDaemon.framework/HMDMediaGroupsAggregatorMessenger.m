@interface HMDMediaGroupsAggregatorMessenger
+ (id)logCategory;
- (HMDMediaGroupsAggregatorMessenger)init;
- (HMDMediaGroupsAggregatorMessengerDataSource)dataSource;
- (HMDMediaGroupsAggregatorMessengerDelegate)delegate;
- (NSUUID)identifier;
- (id)logIdentifier;
- (id)router;
- (void)configureWithMessageDispatcher:(id)a3 home:(id)a4;
- (void)locallyHandleUpdateAssociatedGroupIdentifierRequestMessage:(id)a3;
- (void)notifyOfRequestToUpdateAssociatedGroupIdentifierWithPayload:(id)a3 message:(id)a4;
- (void)registerForMessagesWithMessageDispatcher:(id)a3 home:(id)a4;
- (void)routeMessage:(id)a3 localHandler:(id)a4;
- (void)routeUpdateAssociatedGroupIdentifierRequestMessage:(id)a3;
- (void)sendRequestToUpdateAssociatedGroupIdentifier:(id)a3 forGroupIdentifier:(id)a4 completion:(id)a5;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation HMDMediaGroupsAggregatorMessenger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaGroupsAggregatorMessengerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaGroupsAggregatorMessengerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaGroupsAggregatorMessengerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaGroupsAggregatorMessengerDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsAggregatorMessenger *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)router
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaGroupsAggregatorMessenger *)self dataSource];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 routerForMediaGroupsAggregatorMessenger:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get router due to no data source", (uint8_t *)&v11, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (void)notifyOfRequestToUpdateAssociatedGroupIdentifierWithPayload:(id)a3 message:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(HMDMediaGroupsAggregatorMessenger *)self delegate];
  if (v7)
  {
    v8 = [v10 groupIdentifier];
    v9 = [v10 associatedGroupIdentifier];
    [v7 didReceiveUpdateAssociatedGroupRequestMessage:v6 withGroupIdentifier:v8 associatedGroupIdentifier:v9 messenger:self];
  }
}

- (void)locallyHandleUpdateAssociatedGroupIdentifierRequestMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 name];
    id v10 = [v4 identifier];
    int v23 = 138543874;
    v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Locally handling update associated group identifier request message: %@/%@", (uint8_t *)&v23, 0x20u);
  }
  int v11 = [v4 messagePayload];
  if (v11)
  {
    v12 = [[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload alloc] initWithPayload:v11];
    if (v12)
    {
      uint64_t v13 = v12;
      [(HMDMediaGroupsAggregatorMessenger *)v6 notifyOfRequestToUpdateAssociatedGroupIdentifierWithPayload:v12 message:v4];
    }
    else
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = v6;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        int v23 = 138543618;
        v24 = v21;
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse message payload from message: %@", (uint8_t *)&v23, 0x16u);
      }
      v22 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v22];

      uint64_t v13 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = v6;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v17;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get a message payload from message: %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v13];
  }
}

- (void)routeUpdateAssociatedGroupIdentifierRequestMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 name];
    id v10 = [v4 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing update associated group identifier request message: %@/%@", buf, 0x20u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__HMDMediaGroupsAggregatorMessenger_routeUpdateAssociatedGroupIdentifierRequestMessage___block_invoke;
  v11[3] = &unk_264A2F558;
  v11[4] = v6;
  [(HMDMediaGroupsAggregatorMessenger *)v6 routeMessage:v4 localHandler:v11];
}

uint64_t __88__HMDMediaGroupsAggregatorMessenger_routeUpdateAssociatedGroupIdentifierRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) locallyHandleUpdateAssociatedGroupIdentifierRequestMessage:a2];
}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDMediaGroupsAggregatorMessenger *)self router];
  v9 = v8;
  if (v8)
  {
    [v8 routeMessage:v6 localHandler:v7];
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      __int16 v14 = [v6 name];
      v15 = [v6 identifier];
      int v17 = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message: %@/%@ due to no router", (uint8_t *)&v17, 0x20u);
    }
    __int16 v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
    [v6 respondWithError:v16];
  }
}

- (void)sendRequestToUpdateAssociatedGroupIdentifier:(id)a3 forGroupIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v35 = v14;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending request to update associated group identifier: %@ for group identifier: %@", buf, 0x20u);
  }
  v15 = [[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload alloc] initWithGroupIdentifier:v9 associatedGroupIdentifier:v8];
  id v16 = objc_alloc(MEMORY[0x263F42590]);
  int v17 = +[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload messageName];
  id v18 = objc_alloc(MEMORY[0x263F42570]);
  __int16 v19 = [(HMDMediaGroupsAggregatorMessenger *)v12 messageTargetUUID];
  v20 = (void *)[v18 initWithTarget:v19];
  __int16 v21 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)v15 payloadCopy];
  v22 = (void *)[v16 initWithName:v17 destination:v20 payload:v21];

  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __112__HMDMediaGroupsAggregatorMessenger_sendRequestToUpdateAssociatedGroupIdentifier_forGroupIdentifier_completion___block_invoke;
  uint64_t v29 = &unk_264A2F530;
  v30 = v12;
  id v31 = v8;
  id v32 = v9;
  id v33 = v10;
  id v23 = v10;
  id v24 = v9;
  id v25 = v8;
  [v22 setResponseHandler:&v26];
  -[HMDMediaGroupsAggregatorMessenger routeUpdateAssociatedGroupIdentifierRequestMessage:](v12, "routeUpdateAssociatedGroupIdentifierRequestMessage:", v22, v26, v27, v28, v29, v30);
}

void __112__HMDMediaGroupsAggregatorMessenger_sendRequestToUpdateAssociatedGroupIdentifier_forGroupIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = 138544130;
      __int16 v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Send request to update associated group identifier: %@ for group identifier: %@ responded with error: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)registerForMessagesWithMessageDispatcher:(id)a3 home:(id)a4
{
  v13[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  id v9 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  id v10 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:3 remoteAccessRequired:0];

  uint64_t v11 = +[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload messageName];
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = v10;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  [v7 registerForMessage:v11 receiver:self policies:v12 selector:sel_routeUpdateAssociatedGroupIdentifierRequestMessage_];
}

- (void)configureWithMessageDispatcher:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [v6 uuid];
  [(HMDMediaGroupsAggregatorMessenger *)self setIdentifier:v7];

  [(HMDMediaGroupsAggregatorMessenger *)self registerForMessagesWithMessageDispatcher:v8 home:v6];
}

- (HMDMediaGroupsAggregatorMessenger)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDMediaGroupsAggregatorMessenger;
  v2 = [(HMDMediaGroupsAggregatorMessenger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_273219 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_273219, &__block_literal_global_273220);
  }
  v2 = (void *)logCategory__hmf_once_v9_273221;
  return v2;
}

void __48__HMDMediaGroupsAggregatorMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9_273221;
  logCategory__hmf_once_v9_273221 = v0;
}

@end