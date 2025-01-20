@interface HMDRemoteEventRouterResidentClient
- (BOOL)clientIsEnabled:(id)a3;
- (NSUUID)homeUUID;
- (id)client:(id)a3 upstreamTopicsForTopic:(id)a4;
- (id)dumpStateDescription;
- (id)forwardingTopicsForTopics:(id)a3 downstreamRouter:(id)a4;
- (id)initWitAccessoryUUID:(id)a3 homeUUID:(id)a4 queue:(id)a5 dataSource:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 storeReadHandle:(id)a12 storeWriteHandle:(id)a13 retryIntervalProvider:(id)a14 logCategory:(const char *)a15;
- (void)_registerForNotifications;
- (void)configureIsPrimaryResident:(BOOL)a3 networkAvailable:(BOOL)a4 additionalPolicies:(id)a5;
- (void)handleAccessoryDeviceDidUpdateNotification:(id)a3;
- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3;
- (void)handlePrimaryResidentReceivedIncomingConnection:(id)a3;
@end

@implementation HMDRemoteEventRouterResidentClient

- (void).cxx_destruct
{
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (id)forwardingTopicsForTopics:(id)a3 downstreamRouter:(id)a4
{
  id v5 = a3;
  v6 = [(HMDRemoteEventRouterResidentClient *)self accessoryUUID];
  v7 = [(HMDRemoteEventRouterResidentClient *)self homeUUID];
  v8 = +[HMDAccessoryEventsGenerated forwardingTopicsForTopics:v5 residentAccessoryUUID:v6 homeUUID:v7];

  return v8;
}

- (id)client:(id)a3 upstreamTopicsForTopic:(id)a4
{
  id v5 = a4;
  v6 = [(HMDRemoteEventRouterResidentClient *)self homeUUID];
  v7 = [(HMDRemoteEventRouterResidentClient *)self accessoryUUID];
  v8 = +[HMDHomeEventsGenerated upstreamHomeAndAccessoryTopicsForTopic:v5 homeUUID:v6 accessoryUUID:v7];

  return v8;
}

- (id)dumpStateDescription
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteEventRouterResidentClient;
  v3 = [(HMDRemoteEventRouterClient *)&v6 dumpStateDescription];
  v4 = [v2 stringWithFormat:@"[HMDRemoteEventRouterResidentClient: %@]", v3];

  return v4;
}

- (BOOL)clientIsEnabled:(id)a3
{
  id v4 = a3;
  if (self)
  {
    id v5 = [(HMDRemoteEventRouterClient *)self workQueue];
    dispatch_assert_queue_V2(v5);

    id v6 = [(HMDRemoteEventRouterClient *)self eventRouterClient];

    LOBYTE(self) = v6 == v4 && [(HMDRemoteEventRouterClient *)self isPrimaryResident];
  }

  return (char)self;
}

- (void)handlePrimaryResidentReceivedIncomingConnection:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"idsIdentifier"];

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
    v8 = [(HMDRemoteEventRouterClient *)self dataSource];
    v9 = [(HMDRemoteEventRouterResidentClient *)self accessoryUUID];
    int v10 = [v8 client:self isIdsIdentifier:v7 ofAccessory:v9];

    if (v10)
    {
      v11 = [(HMDRemoteEventRouterClient *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__HMDRemoteEventRouterResidentClient_handlePrimaryResidentReceivedIncomingConnection___block_invoke;
      block[3] = &unk_1E6A19B30;
      block[4] = self;
      dispatch_async(v11, block);
    }
  }
}

void __86__HMDRemoteEventRouterResidentClient_handlePrimaryResidentReceivedIncomingConnection___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 112))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Primary resident received incoming connection from client reset connection timer.", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [*(id *)(a1 + 32) eventRouterClient];
    [v6 resetReconnectTimerToInitialState];

    *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
  }
}

- (void)handleAccessoryDeviceDidUpdateNotification:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  int v7 = [v6 uuid];

  v8 = [(HMDRemoteEventRouterResidentClient *)self accessoryUUID];
  int v9 = objc_msgSend(v8, "hmf_isEqualToUUID:", v7);

  if (v9)
  {
    int v10 = [(HMDRemoteEventRouterClient *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__HMDRemoteEventRouterResidentClient_handleAccessoryDeviceDidUpdateNotification___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v10, block);
  }
}

void __81__HMDRemoteEventRouterResidentClient_handleAccessoryDeviceDidUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory device updated, kicking event router client", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) eventRouterClient];
  [v6 connectionCapabilityDidChange];
}

- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRemoteEventRouterClient *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__HMDRemoteEventRouterResidentClient_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __103__HMDRemoteEventRouterResidentClient_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Resident Client received primary resident change notification %@", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)HMDRemoteEventRouterResidentClient;
  objc_msgSendSuper2(&v9, sel_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification_, v7);
  id v8 = [*(id *)(a1 + 32) eventRouterClient];
  [v8 connectionCapabilityDidChange];
}

- (void)_registerForNotifications
{
  id v3 = [(HMDRemoteEventRouterClient *)self notificationCenter];
  [v3 addObserver:self selector:sel_handleAccessoryDeviceDidUpdateNotification_ name:@"HMDAppleMediaAccessoryDeviceUpdatedNotification" object:0];

  id v4 = [(HMDRemoteEventRouterClient *)self notificationCenter];
  [v4 addObserver:self selector:sel_handlePrimaryResidentReceivedIncomingConnection_ name:@"RemoteEventRouterServerDidReceiveConnectionToPrimary" object:0];
}

- (void)configureIsPrimaryResident:(BOOL)a3 networkAvailable:(BOOL)a4 additionalPolicies:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteEventRouterResidentClient;
  [(HMDRemoteEventRouterClient *)&v6 configureIsPrimaryResident:a3 networkAvailable:a4 additionalPolicies:a5];
  [(HMDRemoteEventRouterResidentClient *)self _registerForNotifications];
}

- (id)initWitAccessoryUUID:(id)a3 homeUUID:(id)a4 queue:(id)a5 dataSource:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 storeReadHandle:(id)a12 storeWriteHandle:(id)a13 retryIntervalProvider:(id)a14 logCategory:(const char *)a15
{
  id v40 = a4;
  id v19 = a5;
  id v37 = a12;
  id v35 = a13;
  id v33 = a14;
  id v32 = a11;
  id v30 = a10;
  id v31 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a3;
  v24 = +[HMDMetricsManager sharedLogEventSubmitter];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __259__HMDRemoteEventRouterResidentClient_initWitAccessoryUUID_homeUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_retryIntervalProvider_logCategory___block_invoke;
  v42[3] = &unk_1E6A0C600;
  id v25 = v19;
  id v43 = v25;
  id v38 = v37;
  id v44 = v38;
  id v36 = v35;
  id v45 = v36;
  id v34 = v33;
  id v46 = v34;
  v47 = a15;
  v41.receiver = self;
  v41.super_class = (Class)HMDRemoteEventRouterResidentClient;
  v26 = [(HMDRemoteEventRouterClient *)&v41 initWithMessageTargetUUID:v23 queue:v25 dataSource:v22 messageDispatcher:v21 notificationCenter:v20 requestMessageName:v31 updateMessageName:v30 multiHopFetchResponseMessageName:v32 logCategory:a15 logEventSubmitter:v24 eventRouterClientFactory:v42];

  if (v26) {
    objc_storeStrong((id *)&v26->_homeUUID, a4);
  }

  return v26;
}

HMDRemoteEventRouterClient *__259__HMDRemoteEventRouterResidentClient_initWitAccessoryUUID_homeUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_retryIntervalProvider_logCategory___block_invoke(void *a1)
{
  return +[HMDRemoteEventRouterClient routerClientWithQueue:a1[4] storeReadHandle:a1[5] storeWriteHandle:a1[6] retryIntervalProvider:a1[7] logCategory:a1[8]];
}

@end