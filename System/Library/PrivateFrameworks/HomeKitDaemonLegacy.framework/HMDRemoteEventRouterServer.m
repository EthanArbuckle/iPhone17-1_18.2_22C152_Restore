@interface HMDRemoteEventRouterServer
+ (id)logCategory;
- (BOOL)isErrorHMENotAcceptingConnections:(id)a3;
- (BOOL)server:(id)a3 isConnectionTerminatingError:(id)a4;
- (BOOL)server:(id)a3 shouldProcessEventsForConnection:(id)a4 shouldLogState:(BOOL)a5;
- (BOOL)serverSupportFragmentCachedEvents:(id)a3;
- (BOOL)shouldAllowEvent:(id)a3 topic:(id)a4 connection:(id)a5;
- (HMDRemoteEventRouterServer)initWithPrimaryModeUUID:(id)a3 residentModeUUID:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 dataSource:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 logCategory:(const char *)a12 logEventSubmitter:(id)a13 connectionServerFactory:(id)a14;
- (HMDRemoteEventRouterServer)initWithPrimaryModeUUID:(id)a3 residentModeUUID:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 dataSource:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 subscriptionProvider:(id)a12 registrationEventRouter:(id)a13 storeReadHandle:(id)a14;
- (NSMutableArray)currentConnections;
- (NSString)description;
- (NSUUID)messageTargetUUID;
- (NSUUID)residentModeUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (double)diagnosticLastConnectTime;
- (double)server:(id)a3 timeoutIntervalForConnection:(id)a4;
- (double)serverDebounceTimeInterval:(id)a3;
- (id)_underlyingMessageDataFromFragmentMessageData:(id)a3 error:(id *)a4;
- (id)diagnosticInfo;
- (id)dumpStateDescription;
- (id)logIdentifier;
- (id)messageTargetForMode:(int64_t)a3;
- (id)responseHandlerForSendMessageIdentifier:(id)a3 completion:(id)a4;
- (id)server:(id)a3 expandedTopicsForTopics:(id)a4;
- (id)server:(id)a3 forwardingTopicsForTopics:(id)a4;
- (id)server:(id)a3 upstreamTopicsForTopic:(id)a4;
- (id)serverTimerProvider:(id)a3;
- (os_unfair_lock_s)isPrimaryResident;
- (unint64_t)serverFragmentEventsDataSize:(id)a3;
- (void)_handleChangeRegistrationsRequest:(id)a3 originalMessage:(id)a4;
- (void)_handleConnectRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5;
- (void)_handleDisconnectRequest:(id)a3 originalMessage:(id)a4;
- (void)_handleFetchEventsRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5;
- (void)_handleKeepAliveRequest:(id)a3 originalMessage:(id)a4;
- (void)_handlePrimaryRequestMessage:(id)a3;
- (void)_handleProtoRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5;
- (void)_handleRequestMessage:(id)a3 connectionMode:(int64_t)a4;
- (void)_handleUserPrivilegeChange:(id)a3;
- (void)_registerForAccessoryMessages:(id)a3;
- (void)_registerForMessages:(id)a3 withHome:(id)a4;
- (void)configureWithHome:(id)a3 isPrimaryResident:(BOOL)a4 isResidentEventProviding:(BOOL)a5 additionalPolicies:(id)a6;
- (void)handleHomeUserRemovedNotification:(id)a3;
- (void)handlePrimaryResidentIsCurrentDeviceChangeNotification:(id)a3;
- (void)logMetricsForLiveEvents:(id)a3 cachedEvents:(id)a4 destinationDevice:(id)a5 destinationDeviceIdentifier:(id)a6 responseMessageType:(unint64_t)a7;
- (void)pendingEventCollectionDidComplete:(id)a3;
- (void)refreshConnections:(id)a3;
- (void)respondToMessage:(id)a3 underlyingResponseData:(id)a4 connection:(id)a5 label:(id)a6;
- (void)respondToMessage:(id)a3 underlyingResponseData:(id)a4 supportsFragmentMessage:(BOOL)a5 label:(id)a6;
- (void)sendMessageWithPayloadMessage:(id)a3 destination:(id)a4 messageType:(int64_t)a5 completion:(id)a6;
- (void)server:(id)a3 connectionDidConnect:(id)a4;
- (void)server:(id)a3 connectionDidExpire:(id)a4;
- (void)server:(id)a3 connectionDidFail:(id)a4;
- (void)server:(id)a3 logMetricsForMessageDatagramFragmentation:(BOOL)a4 isFragmented:(BOOL)a5;
- (void)server:(id)a3 sendEvents:(id)a4 cachedEvents:(id)a5 connection:(id)a6 completion:(id)a7;
- (void)submitLogEvent:(id)a3;
- (void)submitLogEvent:(id)a3 error:(id)a4;
@end

@implementation HMDRemoteEventRouterServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnections, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong((id *)&self->_accessoryMessageReceiver, 0);
  objc_storeStrong((id *)&self->_pendingFetchRequests, 0);
  objc_storeStrong((id *)&self->_accessControls, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_connectionServer, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_routerMultiHopFetchResponseMessageName, 0);
  objc_storeStrong((id *)&self->_routerUpdateMessageName, 0);
  objc_storeStrong((id *)&self->_routerRequestMessageName, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (NSMutableArray)currentConnections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)pendingEventCollectionDidComplete:(id)a3
{
  id v5 = a3;
  if (self) {
    Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 128, 1);
  }
  uint64_t v5 = [Property objectForKey:*(void *)(a1 + 40)];
  if (!v5)
  {
    v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = *(id *)(a1 + 32);
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = HMFGetLogIdentifier();
      uint64_t v30 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      __int16 v41 = 2112;
      uint64_t v42 = v30;
      v31 = "%{public}@Fetch collection completed with no connection found for collection %@";
LABEL_15:
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, v31, buf, 0x16u);
    }
LABEL_16:

    goto LABEL_21;
  }
  id v6 = *(id *)(a1 + 32);
  if (v6) {
    id v6 = objc_getProperty(v6, v4, 128, 1);
  }
  [v6 removeObjectForKey:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 40) hasEventItem] & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = *(id *)(a1 + 32);
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = HMFGetLogIdentifier();
      uint64_t v32 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      __int16 v41 = 2112;
      uint64_t v42 = v32;
      v31 = "%{public}@Fetch collection completed with no items. %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  id v7 = *(id *)(v5 + 24);
  if (v7)
  {
    v8 = objc_alloc_init(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse);
    id v9 = [*(id *)(a1 + 40) popEventItemsUpWithFragments:0 toSizeInBytes:0 usedBytes:0];
    v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_184);
    v11 = (void *)[v10 mutableCopy];
    [(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *)v8 setChangedEvents:v11];

    v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = v10;
      v16 = v15 = v9;
      v17 = [(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *)v8 changedEvents];
      *(_DWORD *)buf = 138543618;
      v40 = v16;
      __int16 v41 = 2048;
      uint64_t v42 = [v17 count];
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Fetch collection completed with %ld items.", buf, 0x16u);

      id v9 = v15;
      v10 = v37;
    }

    v18 = objc_alloc_init(HMDRemoteEventRouterProtoServerMessage);
    v19 = [MEMORY[0x1E4F29128] UUID];
    v20 = [v19 UUIDString];
    [(HMDRemoteEventRouterProtoServerMessage *)v18 setIdentifier:v20];

    [(HMDRemoteEventRouterProtoServerMessage *)v18 setMultiHopFetchEventsResponse:v8];
    v21 = [HMDRemoteDeviceMessageDestination alloc];
    v22 = [*(id *)(a1 + 32) messageTargetForMode:*(void *)(v5 + 40)];
    v23 = [(HMDRemoteDeviceMessageDestination *)v21 initWithTarget:v22 device:v7];

    v24 = *(void **)(a1 + 32);
    v25 = [(HMDRemoteEventRouterProtoServerMessage *)v18 data];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke_185;
    v38[3] = &unk_1E6A197F0;
    v38[4] = *(void *)(a1 + 32);
    [v24 sendMessageWithPayloadMessage:v25 destination:v23 messageType:2 completion:v38];
  }
  else
  {
    v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = *(id *)(a1 + 32);
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v36;
      __int16 v41 = 2112;
      uint64_t v42 = v5;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Device no longer available %@", buf, 0x16u);
    }
  }

LABEL_21:
}

void __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke_185(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    v8 = (void *)v7;
    id v9 = @"error : ";
    if (!v3) {
      id v9 = @"success";
    }
    int v11 = 138543874;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    v14 = v9;
    if (v3) {
      v10 = v3;
    }
    else {
      v10 = &stru_1F2C9F1A8;
    }
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetch collection response completed with %@%@", (uint8_t *)&v11, 0x20u);
  }
}

uint64_t __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke_182(uint64_t a1, void *a2)
{
  return [a2 pbEventInfo];
}

- (id)diagnosticInfo
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F2EA50]);
  [v3 setVersion:1];
  [v3 setConnectionState:0];
  [v3 setMode:0];
  if (fabs(-[HMDRemoteEventRouterServer diagnosticLastConnectTime]((uint64_t)self)) >= 2.22044605e-16) {
    [v3 setLastConnected:-[HMDRemoteEventRouterServer diagnosticLastConnectTime]((uint64_t)self)];
  }
  v4 = [(HMDRemoteEventRouterServer *)self currentConnections];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [v3 setConnectionState:1];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v3 setConnectedClients:v6];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [(HMDRemoteEventRouterServer *)self currentConnections];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
          id v13 = objc_alloc_init(MEMORY[0x1E4F2EA48]);
          if (v12) {
            v14 = *(void **)(v12 + 16);
          }
          else {
            v14 = 0;
          }
          id v15 = v14;
          v16 = [v15 UUIDString];
          [v13 setConnectedClientIdentifierString:v16];

          uint64_t v17 = [v3 connectedClients];
          [v17 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v18 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v9 = v18;
      }
      while (v18);
    }
  }
  else
  {
    [v3 setConnectionState:2];
  }
  if (-[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self)) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 2;
  }
  [v3 setMode:v19];
  return v3;
}

- (double)diagnosticLastConnectTime
{
  if (!a1) {
    return 0.0;
  }
  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock_with_options();
  double v3 = *(double *)(a1 + 24);
  os_unfair_lock_unlock(v2);
  return v3;
}

- (os_unfair_lock_s)isPrimaryResident
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock_with_options();
    v1 = (os_unfair_lock_s *)(LOBYTE(v1[5]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)dumpStateDescription
{
  double v3 = NSString;
  -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  v4 = HMFBooleanToString();
  id v6 = HMFBooleanToString();
  if (self) {
    id Property = objc_getProperty(self, v5, 104, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v8 = [Property dumpStateDescription];
  uint64_t v9 = [v3 stringWithFormat:@"[HMDRemoteEventRouterServer primary: %@, resident event providing: %@, \n\t server: %@]", v4, v6, v8];

  return v9;
}

- (void)configureWithHome:(id)a3 isPrimaryResident:(BOOL)a4 isResidentEventProviding:(BOOL)a5 additionalPolicies:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSNumber;
    v14 = logger;
    id v15 = [v13 numberWithBool:v8];
    v16 = [NSNumber numberWithBool:v7];
    int v17 = 138412546;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "Configuring on device isPrimaryResident. %@ isResidentEventProviding: %@", (uint8_t *)&v17, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  self->_isPrimaryResident = v8;
  os_unfair_lock_unlock(&self->_lock);
  self->_isResidentEventProviding = v7;
  [(HMDRemoteEventRouterServer *)self _registerForMessages:v11 withHome:v10];
  [(HMDRemoteEventRouterServer *)self _registerForAccessoryMessages:v11];
}

- (NSUUID)residentModeUUID
{
  if (self)
  {
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 48, 1);
    uint64_t v2 = vars8;
  }
  return (NSUUID *)self;
}

- (BOOL)shouldAllowEvent:(id)a3 topic:(id)a4 connection:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v10;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_debug_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_DEBUG, "Checking access control connection: %@, topic: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  BOOL isPrimaryResident = self->_isPrimaryResident;
  int v14 = self->_isPrimaryResident;
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    id v15 = v10[3];
    v16 = v15;
    if (v15)
    {
      id v33 = v7;
      int v17 = [v15 productInfo];
      uint64_t v18 = [v17 productPlatform];

      uint64_t v19 = 1;
      if (v18 != 4) {
        uint64_t v19 = 2;
      }
      uint64_t v31 = v19;
      id v20 = v10[2];
      int v21 = [WeakRetained isDeviceIdentifierPrimaryResident:v20];

      id v22 = v10[4];
      long long v23 = [WeakRetained routerServerUserAccessControlProviderForIdentifier:v22];

      if (v23)
      {
        id v7 = v33;
        if (!isPrimaryResident && ((v21 ^ 1) & 1) == 0) {
          int v14 = [WeakRetained canTopicBeForwardedToPrimaryFromResident:v33];
        }
        long long v24 = objc_msgSend(v16, "identifier", v31);
        int v25 = [WeakRetained shouldAllowTopic:v33 forDeviceWithMessageIdentifier:v24];

        char v26 = 0;
        if (v14 && v25)
        {
          id v27 = [WeakRetained remoteEventAccessControlProvider];
          char v26 = objc_msgSend(v27, "remoteEventAllowedForTopic:deviceType:userType:", v33, v32, objc_msgSend(v23, "allowedRemoteEventAccessUserTypes"));
        }
        goto LABEL_26;
      }
      v29 = self->_logger;
      id v7 = v33;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v10;
        _os_log_error_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "Could not find user ACL provider for %@", buf, 0xCu);
      }
    }
    else
    {
      v28 = self->_logger;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v35 = (id *)v7;
        __int16 v36 = 2112;
        id v37 = v8;
        _os_log_debug_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEBUG, "No device when attempting to check access control for %@ to %@", buf, 0x16u);
      }
    }
    char v26 = 0;
LABEL_26:

    goto LABEL_27;
  }
  char v26 = 0;
LABEL_27:

  return v26;
}

- (void)logMetricsForLiveEvents:(id)a3 cachedEvents:(id)a4 destinationDevice:(id)a5 destinationDeviceIdentifier:(id)a6 responseMessageType:(unint64_t)a7
{
  id v11 = a6;
  id v9 = a5;
  -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  if (self)
  {
    self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_dataSource);
    [(HMDRemoteEventRouterServer *)self isDeviceIdentifierPrimaryResident:v11];
    id v10 = [v9 productInfo];
    [v10 productPlatform];
  }
  else
  {
    [0 isDeviceIdentifierPrimaryResident:v11];
  }
}

- (void)server:(id)a3 logMetricsForMessageDatagramFragmentation:(BOOL)a4 isFragmented:(BOOL)a5
{
  if (a5)
  {
    id v6 = [[HMDEventRouterMessageFragmentationLogEvent alloc] initWithIsCachedEventQueue:a4 isFragmented:1];
    if (self) {
      self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
    }
    [(HMDRemoteEventRouterServer *)self submitLogEvent:v6];
  }
}

- (void)server:(id)a3 sendEvents:(id)a4 cachedEvents:(id)a5 connection:(id)a6 completion:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void (**)(id, void *))a7;
  id v15 = objc_alloc_init(HMDRemoteEventRouterProtoServerMessage);
  v16 = [MEMORY[0x1E4F29128] UUID];
  int v17 = [v16 UUIDString];
  [(HMDRemoteEventRouterProtoServerMessage *)v15 setIdentifier:v17];

  uint64_t v18 = objc_alloc_init(HMDRemoteEventRouterProtoEventsMessage);
  [(HMDRemoteEventRouterProtoServerMessage *)v15 setUpdatedEvents:v18];

  uint64_t v19 = objc_msgSend(v11, "na_map:", &__block_literal_global_171_70223);
  id v20 = (void *)[v19 mutableCopy];
  int v21 = [(HMDRemoteEventRouterProtoServerMessage *)v15 updatedEvents];
  [v21 setEvents:v20];

  id v22 = objc_msgSend(v12, "na_map:", &__block_literal_global_173_70224);
  long long v23 = (void *)[v22 mutableCopy];
  long long v24 = [(HMDRemoteEventRouterProtoServerMessage *)v15 updatedEvents];
  [v24 setCachedEvents:v23];

  id v25 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v26 = v25;
  }
  else {
    char v26 = 0;
  }
  id v27 = v26;

  if (v27)
  {
    id v28 = v27[3];
    if (v28)
    {
      v29 = v28;
      uint64_t v30 = [HMDRemoteDeviceMessageDestination alloc];
      uint64_t v31 = [(HMDRemoteEventRouterServer *)self messageTargetForMode:v27[5]];
      uint64_t v32 = [(HMDRemoteDeviceMessageDestination *)v30 initWithTarget:v31 device:v29];

      if (v32)
      {
        id v33 = v27[2];
        [(HMDRemoteEventRouterServer *)self logMetricsForLiveEvents:v11 cachedEvents:v12 destinationDevice:v29 destinationDeviceIdentifier:v33 responseMessageType:4];

        logger = self->_logger;
        id v45 = v11;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
        {
          v35 = NSNumber;
          __int16 v36 = logger;
          v44 = [(HMDRemoteEventRouterProtoServerMessage *)v15 data];
          id v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v44, "length"));
          *(_DWORD *)buf = 138412290;
          id v47 = v37;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEFAULT, "Sending events of size: %@", buf, 0xCu);

          id v11 = v45;
          logger = self->_logger;
        }
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v11;
          _os_log_debug_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_DEBUG, "Sending events: %@", buf, 0xCu);
        }
        uint64_t v38 = [(HMDRemoteEventRouterProtoServerMessage *)v15 data];
        [(HMDRemoteEventRouterServer *)self sendMessageWithPayloadMessage:v38 destination:v32 messageType:1 completion:v14];

        id v11 = v45;
      }
      else
      {
        uint64_t v42 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
        v14[2](v14, v42);

        uint64_t v43 = self->_logger;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "Could not create destination", buf, 2u);
        }
      }
    }
    else
    {
      v40 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v14[2](v14, v40);

      __int16 v41 = self->_logger;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v25;
        _os_log_error_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "Device no longer available %@", buf, 0xCu);
      }
      v29 = 0;
    }
  }
  else
  {
    v39 = self->_logger;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v25;
      _os_log_error_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "Could not find remote connection for connection %@", buf, 0xCu);
    }
    v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v14[2](v14, v29);
  }
}

uint64_t __83__HMDRemoteEventRouterServer_server_sendEvents_cachedEvents_connection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 pbEventInfo];
}

uint64_t __83__HMDRemoteEventRouterServer_server_sendEvents_cachedEvents_connection_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pbEventInfo];
}

- (void)server:(id)a3 connectionDidFail:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_error_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_ERROR, "Removing connection on error %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDRemoteEventRouterServer *)self currentConnections];
  [v7 removeObject:v5];
}

- (void)server:(id)a3 connectionDidExpire:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_error_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_ERROR, "Removing connection on expiry %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDRemoteEventRouterServer *)self currentConnections];
  [v7 removeObject:v5];
}

- (void)server:(id)a3 connectionDidConnect:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  if (self)
  {
    double v8 = v7;
    os_unfair_lock_lock_with_options();
    self->_diagnosticLastConnectTime = v8;
    os_unfair_lock_unlock(&self->_lock);
  }

  if (-[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self))
  {
    id v9 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if (v11) {
      id v12 = (void *)v11[3];
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    int v14 = [v13 deviceAddress];
    id v15 = [v14 idsIdentifier];

    if (v15)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v15;
        _os_log_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_DEFAULT, "Notifying on connecting to primary %@", buf, 0xCu);
      }
      id Property = objc_getProperty(self, v17, 88, 1);
      id v22 = @"idsIdentifier";
      long long v23 = v15;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = Property;
      int v21 = [v19 dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      objc_msgSend(v20, "postNotificationName:object:userInfo:", @"RemoteEventRouterServerDidReceiveConnectionToPrimary", self, v21, v22, v23);
    }
  }
}

- (BOOL)serverSupportFragmentCachedEvents:(id)a3
{
  return _os_feature_enabled_impl();
}

- (unint64_t)serverFragmentEventsDataSize:(id)a3
{
  if (_os_feature_enabled_impl()) {
    return 0x80000;
  }
  else {
    return 0;
  }
}

- (id)serverTimerProvider:(id)a3
{
  if (self)
  {
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 96, 1);
    uint64_t v3 = vars8;
  }
  return self;
}

- (double)serverDebounceTimeInterval:(id)a3
{
  unsigned int v3 = -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  double result = 0.5;
  if (v3) {
    return 5.0;
  }
  return result;
}

- (double)server:(id)a3 timeoutIntervalForConnection:(id)a4
{
  return 4500.0;
}

- (BOOL)server:(id)a3 shouldProcessEventsForConnection:(id)a4 shouldLogState:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v10 = a4;
  if (self)
  {
    id Property = objc_getProperty(self, v9, 32, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = (objc_class *)objc_loadWeakRetained((id *)&self->_dataSource);
    if (!v5) {
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id WeakRetained = 0;
    if (!v5) {
      goto LABEL_5;
    }
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138412546;
    v35 = v10;
    __int16 v36 = 2112;
    id v37 = WeakRetained;
    _os_log_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_DEFAULT, "Checking if server should process events for connection: %@, dataSource: %@", (uint8_t *)&v34, 0x16u);
  }
LABEL_5:
  int v14 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  v16 = v15;

  if (!v16) {
    goto LABEL_14;
  }
  Class isa = v16[5].isa;
  if (isa == (Class)1)
  {
    id v20 = v16[3].isa;
    if (v20)
    {
      id v22 = v16[2].isa;
      int v23 = [(objc_class *)WeakRetained isDeviceIdentifierPrimaryResident:v22];

      if (!-[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self) || !v23)
      {
        if (self)
        {
          if (self->_isResidentEventProviding) {
            unsigned __int8 v18 = v23;
          }
          else {
            unsigned __int8 v18 = 0;
          }
          if (!v5) {
            goto LABEL_33;
          }
        }
        else
        {
          unsigned __int8 v18 = 0;
          if (!v5) {
            goto LABEL_33;
          }
        }
        v29 = self->_logger;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = v29;
          uint64_t v30 = HMFBooleanToString();
          HMFBooleanToString();
          uint64_t v31 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v32 = v16[2].isa;
          int v34 = 138544130;
          v35 = v30;
          __int16 v36 = 2114;
          id v37 = v31;
          __int16 v38 = 2112;
          v39 = v32;
          __int16 v40 = 2112;
          __int16 v41 = v20;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "Allow connection: %{public}@, for resident connection mode. isReceiverPrimary: %{public}@, incoming device:%@, primary device: %@", (uint8_t *)&v34, 0x2Au);

          goto LABEL_32;
        }
        goto LABEL_33;
      }
      if (v5)
      {
        long long v24 = self->_logger;
        unsigned __int8 v18 = 0;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = v24;
          uint64_t v26 = HMFBooleanToString();
          id v27 = v16[2].isa;
          int v34 = 138543874;
          v35 = v26;
          __int16 v36 = 2112;
          id v37 = v27;
          __int16 v38 = 2112;
          v39 = v20;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "Not allowing connection while both devices are known as primary, this should resolve shortly. isReceiverPrimary: %{public}@, incoming device:%@, primary device: %@", (uint8_t *)&v34, 0x20u);

LABEL_23:
          goto LABEL_24;
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      id v28 = self->_logger;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v25 = v28;
        uint64_t v26 = v16[2].isa;
        int v34 = 138412290;
        v35 = v26;
        _os_log_error_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "Unexpectedly did not find device for resident. %@", (uint8_t *)&v34, 0xCu);
        goto LABEL_23;
      }
    }
LABEL_24:
    unsigned __int8 v18 = 0;
    goto LABEL_33;
  }
  if (isa)
  {
LABEL_14:
    unsigned __int8 v18 = 0;
    goto LABEL_34;
  }
  unsigned __int8 v18 = -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  if (v5)
  {
    uint64_t v19 = self->_logger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      int v21 = HMFBooleanToString();
      int v34 = 138543362;
      v35 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "Allow connection: %{public}@, for primary connection mode.", (uint8_t *)&v34, 0xCu);
LABEL_32:

      goto LABEL_33;
    }
  }
LABEL_34:

  return v18;
}

- (BOOL)server:(id)a3 isConnectionTerminatingError:(id)a4
{
  return 1;
}

- (id)server:(id)a3 forwardingTopicsForTopics:(id)a4
{
  id v6 = a4;
  if (self) {
    id Property = objc_getProperty(self, v5, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = +[HMDHomeEventsGenerated forwardingTopicsWithTopics:v6 forHomeRouterWithUUID:Property];

  return v8;
}

- (id)server:(id)a3 expandedTopicsForTopics:(id)a4
{
  id v5 = a4;
  if (self) {
    self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_dataSource);
  }
  id v6 = [(HMDRemoteEventRouterServer *)self expandedTopicsWithTopics:v5];
  double v7 = v6;
  if (!v6) {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v6;

  return v8;
}

- (id)server:(id)a3 upstreamTopicsForTopic:(id)a4
{
  id v5 = a4;
  if (-[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self))
  {
    double v7 = +[HMDHomeEventsGenerated upstreamTopicsForTopic:v5];
  }
  else
  {
    if (self)
    {
      id v8 = objc_getProperty(self, v6, 40, 1);
      id Property = objc_getProperty(self, v9, 48, 1);
    }
    else
    {
      id v8 = 0;
      id Property = 0;
    }
    double v7 = +[HMDHomeEventsGenerated upstreamHomeAndAccessoryTopicsForTopic:v5 homeUUID:v8 accessoryUUID:Property];
  }
  return v7;
}

- (id)responseHandlerForSendMessageIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__HMDRemoteEventRouterServer_responseHandlerForSendMessageIdentifier_completion___block_invoke;
  v12[3] = &unk_1E6A159F8;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = _Block_copy(v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

void __81__HMDRemoteEventRouterServer_responseHandlerForSendMessageIdentifier_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id Property = objc_getProperty(WeakRetained, v5, 32, 1);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__HMDRemoteEventRouterServer_responseHandlerForSendMessageIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E6A18398;
    id v9 = v3;
    uint64_t v10 = v6;
    id v11 = a1[4];
    id v12 = a1[5];
    dispatch_async(Property, v8);
  }
}

uint64_t __81__HMDRemoteEventRouterServer_responseHandlerForSendMessageIdentifier_completion___block_invoke_2(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v3 = *(NSObject **)(a1[5] + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = a1[6];
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v2;
      _os_log_error_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_ERROR, "Failed to send message: %@ error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[6];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_DEFAULT, "Successfully sent message: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a1[4]);
  }
  return result;
}

- (void)sendMessageWithPayloadMessage:(id)a3 destination:(id)a4 messageType:(int64_t)a5 completion:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  unsigned int v14 = -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  if (a5 == 2)
  {
    if (self)
    {
      ptrdiff_t v15 = 72;
      goto LABEL_7;
    }
LABEL_17:
    id Property = 0;
    goto LABEL_8;
  }
  if (a5 == 1)
  {
    if (self)
    {
      ptrdiff_t v15 = 64;
LABEL_7:
      id Property = objc_getProperty(self, v13, v15, 1);
LABEL_8:
      id v17 = Property;
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  id v17 = 0;
LABEL_10:
  if (v14) {
    uint64_t v18 = -1;
  }
  else {
    uint64_t v18 = 8;
  }
  uint64_t v26 = @"message.payload";
  uint64_t v19 = (void *)[v10 copy];
  v27[0] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  int v21 = +[HMDRemoteMessage secureMessageWithName:v17 qualityOfService:-1 destination:v12 messagePayload:v20 timeout:v18 restriction:150.0];

  id v22 = [v21 identifier];
  int v23 = [(HMDRemoteEventRouterServer *)self responseHandlerForSendMessageIdentifier:v22 completion:v11];

  [v21 setResponseHandler:v23];
  if (self) {
    id v25 = objc_getProperty(self, v24, 80, 1);
  }
  else {
    id v25 = 0;
  }
  [v25 sendMessage:v21];
}

- (void)submitLogEvent:(id)a3
{
  id v4 = a3;
  if (self) {
    self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  }
  [(HMDRemoteEventRouterServer *)self submitLogEvent:v4];
}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (self) {
    self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  }
  [(HMDRemoteEventRouterServer *)self submitLogEvent:v7 error:v6];
}

- (void)_handleFetchEventsRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5
{
  id v8 = a3;
  id v10 = a4;
  if (self) {
    id Property = objc_getProperty(self, v9, 32, 1);
  }
  else {
    id Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  if (v8)
  {
    id v12 = [v10 remoteSourceDevice];
    uint64_t v13 = [v12 identifier];
    unsigned int v14 = (void *)v13;
    if (v12 && v13)
    {
      if (self && self->_isResidentEventProviding)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        v16 = [WeakRetained routerServerUserAccessControlProviderIdentifierForMessage:v10];
        if (v16
          && ([WeakRetained routerServerUserAccessControlProviderForIdentifier:v16],
              (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v18 = (void *)v17;
          v51 = -[HMDRemoteEventRouterServerConnection initWithDevice:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:]([HMDRemoteEventRouterServerConnection alloc], "initWithDevice:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:", v12, a5, [v10 BOOLForKey:@"isFragmented"], v16);
          uint64_t v19 = [v8 topics];
          uint64_t v20 = [v19 count];

          if (v20)
          {
            v50 = v18;
            int v21 = [v8 topics];
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __87__HMDRemoteEventRouterServer__handleFetchEventsRequest_originalMessage_connectionMode___block_invoke;
            v53[3] = &unk_1E6A0CC30;
            v53[4] = self;
            uint64_t v22 = objc_msgSend(v21, "na_map:", v53);

            id v23 = objc_alloc_init(MEMORY[0x1E4F69F88]);
            [v23 setDelegate:self];
            id v25 = objc_getProperty(self, v24, 104, 1);
            id v52 = 0;
            v49 = (void *)v22;
            LOBYTE(v22) = objc_msgSend(v25, "fetchCachedEventsForTopics:isMultiHop:connection:cachedEventCollection:error:", v22, objc_msgSend(v8, "fetchType") == 1, v51, v23, &v52);

            id v26 = v52;
            uint64_t v27 = (uint64_t)v26;
            if (v22)
            {
              id v47 = v26;
              char v45 = [v23 isFinishedAddingItems];
              id v48 = v23;
              id v28 = [v23 popEventItemsUpWithFragments:0 toSizeInBytes:0 usedBytes:0];
              v29 = objc_msgSend(v28, "na_map:", &__block_literal_global_157);
              [(HMDRemoteEventRouterServer *)self logMetricsForLiveEvents:MEMORY[0x1E4F1CBF0] cachedEvents:v28 destinationDevice:v12 destinationDeviceIdentifier:v14 responseMessageType:1];
              uint64_t v30 = objc_alloc_init(HMDRemoteEventRouterProtoFetchEventsResponse);
              v46 = v29;
              uint64_t v31 = (void *)[v29 mutableCopy];
              [(HMDRemoteEventRouterProtoFetchEventsResponse *)v30 setChangedEvents:v31];

              uint64_t v32 = [(HMDRemoteEventRouterProtoFetchEventsResponse *)v30 data];
              [(HMDRemoteEventRouterServer *)self respondToMessage:v10 underlyingResponseData:v32 supportsFragmentMessage:0 label:@"FetchEvents"];

              int v34 = v51;
              if ((v45 & 1) == 0) {
                objc_msgSend(objc_getProperty(self, v33, 128, 1), "setObject:forKey:", v51, v48);
              }

              id v23 = v48;
              v35 = v49;
              __int16 v36 = v47;
            }
            else
            {
              if (!v26)
              {
                uint64_t v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
              }
              __int16 v36 = (void *)v27;
              [v10 respondWithError:v27];
              int v34 = v51;
              v35 = v49;
            }

            uint64_t v18 = v50;
          }
          else
          {
            int v34 = v51;
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_ERROR, "Got a fetch request with no topics.", buf, 2u);
            }
            v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
            [v10 respondWithError:v44];
          }
        }
        else
        {
          __int16 v41 = self->_logger;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "Could not find user for incoming request.", buf, 2u);
          }
          uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          [v10 respondWithError:v18];
        }

        goto LABEL_37;
      }
      uint64_t v42 = self->_logger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "Could not process fetch as non-resident event providing device.", buf, 2u);
      }
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = 48;
    }
    else
    {
      __int16 v38 = self->_logger;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
      }
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = 2;
    }
    id WeakRetained = [v39 hmErrorWithCode:v40];
    [v10 respondWithError:WeakRetained];
LABEL_37:

    goto LABEL_38;
  }
  id v37 = self->_logger;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "Did not find fetch request in payload.", buf, 2u);
  }
  id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  [v10 respondWithError:v12];
LABEL_38:
}

id __87__HMDRemoteEventRouterServer__handleFetchEventsRequest_originalMessage_connectionMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 hasTopic] & 1) == 0)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v9 = 0;
      _os_log_error_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "No topic found!", v9, 2u);
    }
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F654E8];
  id v6 = [v3 topic];
  id v7 = objc_msgSend(v5, "hmf_cachedInstanceForString:", v6);

  return v7;
}

uint64_t __87__HMDRemoteEventRouterServer__handleFetchEventsRequest_originalMessage_connectionMode___block_invoke_155(uint64_t a1, void *a2)
{
  return [a2 pbEventInfo];
}

- (void)_handleKeepAliveRequest:(id)a3 originalMessage:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    __int16 v9 = [v7 remoteSourceDevice];
    uint64_t v10 = [v9 identifier];
    id v11 = (void *)v10;
    if (v9 && v10)
    {
      id v12 = [(HMDRemoteEventRouterServer *)self currentConnections];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __70__HMDRemoteEventRouterServer__handleKeepAliveRequest_originalMessage___block_invoke;
      v25[3] = &unk_1E6A0CB28;
      id v13 = v11;
      id v26 = v13;
      unsigned int v14 = objc_msgSend(v12, "na_firstObjectPassingTest:", v25);

      if (v14)
      {
        if (self) {
          self = (HMDRemoteEventRouterServer *)objc_getProperty(self, v15, 104, 1);
        }
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __70__HMDRemoteEventRouterServer__handleKeepAliveRequest_originalMessage___block_invoke_151;
        v23[3] = &unk_1E6A197F0;
        id v24 = v8;
        [(HMDRemoteEventRouterServer *)self keepAliveConnection:v14 completion:v23];
        v16 = v24;
      }
      else
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          int v21 = logger;
          uint64_t v22 = [(HMDRemoteEventRouterServer *)self currentConnections];
          *(_DWORD *)buf = 138412546;
          id v28 = v22;
          __int16 v29 = 2112;
          id v30 = v13;
          _os_log_error_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "No connection was found for keep alive request in current connections: %@ device identifier: %@", buf, 0x16u);
        }
        v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v8 respondWithError:v16];
      }

      uint64_t v19 = v26;
    }
    else
    {
      uint64_t v18 = self->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
      }
      uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v8 respondWithError:v19];
    }
  }
  else
  {
    uint64_t v17 = self->_logger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "Did not keep-alive request in payload.", buf, 2u);
    }
    __int16 v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v8 respondWithError:v9];
  }
}

uint64_t __70__HMDRemoteEventRouterServer__handleKeepAliveRequest_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v3 = *(void **)(a2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v5;
}

uint64_t __70__HMDRemoteEventRouterServer__handleKeepAliveRequest_originalMessage___block_invoke_151(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)_handleChangeRegistrationsRequest:(id)a3 originalMessage:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    __int16 v9 = [v7 remoteSourceDevice];
    uint64_t v10 = [v9 identifier];
    id v11 = (void *)v10;
    if (v9 && v10)
    {
      id v12 = [(HMDRemoteEventRouterServer *)self currentConnections];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke;
      v36[3] = &unk_1E6A0CB28;
      id v13 = v11;
      id v37 = v13;
      unsigned int v14 = objc_msgSend(v12, "na_firstObjectPassingTest:", v36);

      if (v14)
      {
        __int16 v29 = v13;
        if (self) {
          id Property = objc_getProperty(self, v15, 104, 1);
        }
        else {
          id Property = 0;
        }
        id v17 = Property;
        id v28 = [v6 topicFilterAdditions];
        uint64_t v18 = objc_msgSend(v28, "na_map:", &__block_literal_global_140_70270);
        uint64_t v19 = [v6 topicFilterRemovals];
        uint64_t v20 = objc_msgSend(v19, "na_map:", &__block_literal_global_142_70271);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_3;
        v30[3] = &unk_1E6A0CC08;
        id v31 = v14;
        uint64_t v32 = self;
        id v33 = v8;
        id v34 = v9;
        id v35 = v29;
        [v17 changeRegistrationsForConnection:v31 topicFilterAdditions:v18 topicFilterRemovals:v20 completion:v30];

        int v21 = v31;
      }
      else
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          id v26 = logger;
          uint64_t v27 = [(HMDRemoteEventRouterServer *)self currentConnections];
          *(_DWORD *)buf = 138412546;
          v39 = v27;
          __int16 v40 = 2112;
          id v41 = v13;
          _os_log_error_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "No connection was found during change registrations request in current connections: %@ device identifier: %@", buf, 0x16u);
        }
        int v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v8 respondWithError:v21];
      }

      id v24 = v37;
    }
    else
    {
      id v23 = self->_logger;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
      }
      id v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v8 respondWithError:v24];
    }
  }
  else
  {
    uint64_t v22 = self->_logger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "Did not change registrations request in payload.", buf, 2u);
    }
    __int16 v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v8 respondWithError:v9];
  }
}

uint64_t __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v3 = *(void **)(a2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v5;
}

void __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v15 = v5;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    if ((!v7 || !*(void *)(v7 + 40))
      && [*(id *)(a1 + 40) isErrorHMENotAcceptingConnections:v6])
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3202];

      id v6 = (id)v8;
    }
    [*(id *)(a1 + 48) respondWithError:v6];
  }
  else
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_144);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v9 = objc_msgSend(v6, "na_map:", &__block_literal_global_146);
    [*(id *)(a1 + 40) logMetricsForLiveEvents:MEMORY[0x1E4F1CBF0] cachedEvents:v6 destinationDevice:*(void *)(a1 + 56) destinationDeviceIdentifier:*(void *)(a1 + 64) responseMessageType:3];
    uint64_t v10 = objc_alloc_init(HMDRemoteEventRouterProtoChangeRegistrationsResponse);
    id v11 = (void *)[v9 mutableCopy];
    [(HMDRemoteEventRouterProtoChangeRegistrationsResponse *)v10 setCachedEvents:v11];

    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    unsigned int v14 = [(HMDRemoteEventRouterProtoChangeRegistrationsResponse *)v10 data];
    [v12 respondToMessage:v13 underlyingResponseData:v14 connection:*(void *)(a1 + 32) label:@"ChangeRegistration"];
  }
}

uint64_t __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 pbEventInfo];
}

id __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x1E4F69F40];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (void *)[[v4 alloc] initWithEvent:v5 topic:v6];

  return v7;
}

uint64_t __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", a2);
}

uint64_t __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_138(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", a2);
}

- (void)_handleDisconnectRequest:(id)a3 originalMessage:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 32, 1);
  }
  else {
    id Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  if (v6)
  {
    uint64_t v10 = [v8 remoteSourceDevice];
    uint64_t v11 = [v10 identifier];
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      uint64_t v13 = [(HMDRemoteEventRouterServer *)self currentConnections];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __71__HMDRemoteEventRouterServer__handleDisconnectRequest_originalMessage___block_invoke;
      v22[3] = &unk_1E6A0CB28;
      id v23 = v12;
      unsigned int v14 = objc_msgSend(v13, "na_firstObjectPassingTest:", v22);

      if (v14)
      {
        if (self) {
          id v16 = objc_getProperty(self, v15, 104, 1);
        }
        else {
          id v16 = 0;
        }
        [v16 disconnectConnection:v14];
        [v8 respondWithSuccess];
      }
      else
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_ERROR, "No connection was found to disconnect.", buf, 2u);
        }
        int v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v8 respondWithError:v21];
      }
      uint64_t v19 = v23;
    }
    else
    {
      uint64_t v18 = self->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
      }
      uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v8 respondWithError:v19];
    }
  }
  else
  {
    id v17 = self->_logger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "Did not find disconnect request in payload.", buf, 2u);
    }
    uint64_t v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v8 respondWithError:v10];
  }
}

uint64_t __71__HMDRemoteEventRouterServer__handleDisconnectRequest_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v3 = *(void **)(a2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v5;
}

- (void)refreshConnections:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  __int16 v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Refresh connections for user:%@", buf, 0x16u);
  }
  uint64_t v11 = [(HMDRemoteEventRouterServer *)v8 currentConnections];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__HMDRemoteEventRouterServer_refreshConnections___block_invoke;
  v13[3] = &unk_1E6A0CBE0;
  id v14 = v5;
  id v15 = v8;
  id v12 = v5;
  objc_msgSend(v11, "na_each:", v13);
}

void __49__HMDRemoteEventRouterServer_refreshConnections___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3) {
    id v4 = (void *)*((void *)v3 + 4);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (HMFEqualObjects())
  {
    id Property = *(id *)(a1 + 40);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 104, 1);
    }
    [Property refreshConnection:v8];
  }
}

- (void)_handleConnectRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v10 = a4;
  if (self)
  {
    id Property = objc_getProperty(self, v9, 32, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (v8)
    {
LABEL_3:
      uint64_t v13 = [v10 remoteSourceDevice];
      uint64_t v14 = [v13 identifier];
      id v15 = (void *)v14;
      if (!v13 || !v14)
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
        }
        id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v10 respondWithError:v16];
        goto LABEL_38;
      }
      id v16 = [WeakRetained routerServerUserAccessControlProviderIdentifierForMessage:v10];
      if (!v16)
      {
        id v24 = self->_logger;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "Could not find user for incoming request.", buf, 2u);
        }
        id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v10 respondWithError:v25];
        goto LABEL_37;
      }
      id v17 = [(HMDRemoteEventRouterServer *)self currentConnections];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke;
      v58[3] = &unk_1E6A0CB28;
      v50 = v15;
      id v49 = v15;
      id v59 = v49;
      objc_msgSend(v17, "na_firstObjectPassingTest:", v58);
      __int16 v18 = (HMDRemoteEventRouterServerConnection *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if (v18->_connectionMode == a5)
        {
LABEL_26:
          if ([v8 hasConnectEvent])
          {
            id v31 = (void *)MEMORY[0x1E4F69F40];
            uint64_t v32 = [v8 connectEvent];
            id v48 = [v31 fromProtobuff:v32];
          }
          else
          {
            id v48 = 0;
          }
          id v51 = WeakRetained;
          if ([v8 hasUnregisterEvent])
          {
            id v33 = (void *)MEMORY[0x1E4F69F40];
            id v34 = [v8 unregisterEvent];
            uint64_t v46 = [v33 fromProtobuff:v34];
          }
          else
          {
            uint64_t v46 = 0;
          }
          id v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v46);
          __int16 v36 = [v8 topicFilterAdditions];
          uint64_t v37 = [v36 count];

          if (v37)
          {
            v39 = [v8 topicFilterAdditions];
            __int16 v40 = objc_msgSend(v39, "na_map:", &__block_literal_global_125);
            [v35 addObjectsFromArray:v40];
          }
          if (self) {
            id v41 = objc_getProperty(self, v38, 104, 1);
          }
          else {
            id v41 = 0;
          }
          id v42 = v41;
          uint64_t v43 = (void *)[v35 copy];
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_2;
          v52[3] = &unk_1E6A0CBB8;
          int64_t v57 = a5;
          v52[4] = self;
          id v53 = v10;
          id v54 = v13;
          id v55 = v49;
          v56 = v18;
          v44 = v18;
          [v42 connectWithConnection:v44 connectEvent:v48 unregisterEvent:v47 topicFilterAdditions:v43 completion:v52];

          id v25 = v59;
          id v15 = v50;
          id WeakRetained = v51;
LABEL_37:

LABEL_38:
          goto LABEL_43;
        }
        id v19 = self->_logger;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v18;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "Connection mode is different remove existing %@", buf, 0xCu);
        }
        uint64_t v20 = [(HMDRemoteEventRouterServer *)self currentConnections];
        [v20 removeObject:v18];
      }
      __int16 v18 = -[HMDRemoteEventRouterServerConnection initWithDevice:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:]([HMDRemoteEventRouterServerConnection alloc], "initWithDevice:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:", v13, a5, [v10 BOOLForKey:@"isFragmented"], v16);
      if (a5 == 1)
      {
        int v21 = self->_logger;
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138412290;
        v61 = v18;
        uint64_t v22 = "Created resident connection %@";
      }
      else
      {
        if (a5 || (int v21 = self->_logger, !os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)))
        {
LABEL_24:
          id v26 = [(HMDRemoteEventRouterServer *)self currentConnections];
          [v26 addObject:v18];

          uint64_t v27 = self->_logger;
          if (os_signpost_enabled(v27))
          {
            id v28 = NSNumber;
            __int16 v29 = v27;
            id v30 = [v28 numberWithInteger:a5];
            *(_DWORD *)buf = 138412290;
            v61 = v30;
            _os_signpost_emit_with_name_impl(&dword_1D49D5000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRouterServerConnectionCreated", "connectionMode=%{signpost.description:attribute}@ ", buf, 0xCu);
          }
          goto LABEL_26;
        }
        *(_DWORD *)buf = 138412290;
        v61 = v18;
        uint64_t v22 = "Created primary client connection %@";
      }
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      goto LABEL_24;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id WeakRetained = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  char v45 = self->_logger;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "Did not find connect request in payload.", buf, 2u);
  }
  uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  [v10 respondWithError:v13];
LABEL_43:
}

uint64_t __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v3 = *(void **)(a2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v5;
}

void __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if (!*(void *)(a1 + 72) && [*(id *)(a1 + 32) isErrorHMENotAcceptingConnections:v7])
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3202];

      id v7 = (id)v8;
    }
    [*(id *)(a1 + 40) respondWithError:v7];
  }
  else
  {
    objc_msgSend(v16, "na_map:", &__block_literal_global_129);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v9 = objc_msgSend(v7, "na_map:", &__block_literal_global_132_70293);
    [*(id *)(a1 + 32) logMetricsForLiveEvents:MEMORY[0x1E4F1CBF0] cachedEvents:v7 destinationDevice:*(void *)(a1 + 48) destinationDeviceIdentifier:*(void *)(a1 + 56) responseMessageType:2];
    id v10 = objc_alloc_init(HMDRemoteEventRouterProtoConnectResponse);
    uint64_t v11 = (void *)[v9 mutableCopy];
    [(HMDRemoteEventRouterProtoConnectResponse *)v10 setCachedEvents:v11];

    id v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = [(HMDRemoteEventRouterProtoConnectResponse *)v10 data];
    [v13 respondToMessage:v14 underlyingResponseData:v15 connection:*(void *)(a1 + 64) label:@"ConnectResponse"];
  }
}

uint64_t __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 pbEventInfo];
}

id __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x1E4F69F40];
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)[[v4 alloc] initWithEvent:v5 topic:v6];

  return v7;
}

uint64_t __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_122(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", a2);
}

- (id)_underlyingMessageDataFromFragmentMessageData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[HMDRemoteEventRouterProtoFragmentedMessage alloc] initWithData:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([(HMDRemoteEventRouterProtoFragmentedMessage *)v7 fragmentNumber]
      || [(HMDRemoteEventRouterProtoFragmentedMessage *)v8 totalFragments] != 1)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_error_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_ERROR, "Cannot decode fragmented data yet.", v13, 2u);
      }
      [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = [(HMDRemoteEventRouterProtoFragmentedMessage *)v8 fragmentData];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_handleProtoRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  switch([v8 request])
  {
    case 0u:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D49D5000, logger, OS_LOG_TYPE_ERROR, "Unable to find request type.", buf, 2u);
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = 3;
      goto LABEL_8;
    case 1u:
      id v15 = [v8 connect];
      [(HMDRemoteEventRouterServer *)self _handleConnectRequest:v15 originalMessage:v9 connectionMode:a5];
      goto LABEL_15;
    case 2u:
      id v16 = [v8 changeRegistrations];
      [(HMDRemoteEventRouterServer *)self _handleChangeRegistrationsRequest:v16 originalMessage:v9];
      goto LABEL_13;
    case 3u:
      id v16 = [v8 keepAlive];
      [(HMDRemoteEventRouterServer *)self _handleKeepAliveRequest:v16 originalMessage:v9];
      goto LABEL_13;
    case 4u:
      id v16 = [v8 disconnect];
      [(HMDRemoteEventRouterServer *)self _handleDisconnectRequest:v16 originalMessage:v9];
LABEL_13:

      break;
    case 5u:
      id v15 = [v8 fetchEvents];
      [(HMDRemoteEventRouterServer *)self _handleFetchEventsRequest:v15 originalMessage:v9 connectionMode:a5];
LABEL_15:

      break;
    default:
      uint64_t v13 = self->_logger;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v17 = 0;
        _os_log_error_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "Received an unrecognized request type.", v17, 2u);
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = -1;
LABEL_8:
      uint64_t v14 = [v11 hmErrorWithCode:v12];
      [v9 respondWithError:v14];

      break;
  }
}

- (void)_handleRequestMessage:(id)a3 connectionMode:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    id v8 = logger;
    id v9 = [v6 identifier];
    id v10 = [NSNumber numberWithInteger:a4];
    *(_DWORD *)buf = 138412546;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "Handle request message: %@ connection mode: %@", buf, 0x16u);
  }
  int v11 = [v6 BOOLForKey:@"isFragmented"];
  uint64_t v12 = [v6 dataForKey:@"message.payload"];
  if (!v12)
  {
    id v16 = self->_logger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "Did not find message payload.", buf, 2u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
    goto LABEL_23;
  }
  uint64_t v13 = (void *)v12;
  if (!v11)
  {
    id v15 = (id)v12;
    goto LABEL_11;
  }
  id v22 = 0;
  uint64_t v14 = [(HMDRemoteEventRouterServer *)self _underlyingMessageDataFromFragmentMessageData:v12 error:&v22];
  id v15 = v22;

  if (!v14)
  {
    if (!v15)
    {
      uint64_t v20 = self->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "No payload from fragment message", buf, 2u);
      }
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    }
    int v21 = self->_logger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v15;
      _os_log_error_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "Could not decode payload from fragment message %@", buf, 0xCu);
    }
LABEL_23:
    [v6 respondWithError:v15];
    goto LABEL_24;
  }

  id v15 = (id)v14;
LABEL_11:
  id v17 = [[HMDRemoteEventRouterProtoMessage alloc] initWithData:v15];
  if ([(HMDRemoteEventRouterProtoMessage *)v17 hasRequest])
  {
    [(HMDRemoteEventRouterServer *)self _handleProtoRequest:v17 originalMessage:v6 connectionMode:a4];
  }
  else
  {
    __int16 v18 = self->_logger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "Decoded payload does not have request.", buf, 2u);
    }
    id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v6 respondWithError:v19];
  }
LABEL_24:
}

- (void)_handlePrimaryRequestMessage:(id)a3
{
}

- (void)_handleUserPrivilegeChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"kUserUUIDKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    if (self) {
      id Property = objc_getProperty(self, v9, 32, 1);
    }
    else {
      id Property = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__HMDRemoteEventRouterServer__handleUserPrivilegeChange___block_invoke;
    v15[3] = &unk_1E6A197C8;
    v15[4] = self;
    id v16 = v8;
    dispatch_async(Property, v15);
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@user UUID missed", buf, 0xCu);
    }
  }
}

uint64_t __57__HMDRemoteEventRouterServer__handleUserPrivilegeChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshConnections:*(void *)(a1 + 40)];
}

- (BOOL)isErrorHMENotAcceptingConnections:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F69F28]]) {
    BOOL v5 = [v3 code] == 4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)respondToMessage:(id)a3 underlyingResponseData:(id)a4 supportsFragmentMessage:(BOOL)a5 label:(id)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7)
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSNumber;
      id v16 = logger;
      id v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
      *(_DWORD *)buf = 138412546;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "Responding to %@ with message size: %@, fragment: 0", buf, 0x16u);
    }
    __int16 v18 = objc_alloc_init(HMDRemoteEventRouterProtoFragmentedMessage);
    [(HMDRemoteEventRouterProtoFragmentedMessage *)v18 setFragmentData:v11];
    [(HMDRemoteEventRouterProtoFragmentedMessage *)v18 setFragmentNumber:0];
    [(HMDRemoteEventRouterProtoFragmentedMessage *)v18 setTotalFragments:1];
    -[HMDRemoteEventRouterProtoFragmentedMessage setTotalSize:](v18, "setTotalSize:", [v11 length]);
    [(HMDRemoteEventRouterProtoFragmentedMessage *)v18 setRouterVersion:0];
    v28[0] = @"message.payload";
    uint64_t v19 = [(HMDRemoteEventRouterProtoFragmentedMessage *)v18 data];
    v28[1] = @"isFragmented";
    v29[0] = v19;
    v29[1] = MEMORY[0x1E4F1CC38];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    [v10 respondWithPayload:v20];
  }
  else
  {
    int v21 = self->_logger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = NSNumber;
      id v23 = v21;
      id v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
      *(_DWORD *)buf = 138412546;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "Responding to %@ with message size: %@", buf, 0x16u);
    }
    id v26 = @"message.payload";
    id v27 = v11;
    __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v10 respondWithPayload:v25];
  }
}

- (void)respondToMessage:(id)a3 underlyingResponseData:(id)a4 connection:(id)a5 label:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  if (a5) {
    BOOL v13 = *((unsigned char *)a5 + 8) != 0;
  }
  else {
    BOOL v13 = 0;
  }
  id v14 = v12;
  [(HMDRemoteEventRouterServer *)self respondToMessage:v12 underlyingResponseData:v11 supportsFragmentMessage:v13 label:v10];
}

- (id)messageTargetForMode:(int64_t)a3
{
  if (a3 == 1)
  {
    if (!self) {
      goto LABEL_7;
    }
    ptrdiff_t v4 = 48;
  }
  else
  {
    if (!self) {
      goto LABEL_7;
    }
    ptrdiff_t v4 = 40;
  }
  self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, v4, 1);
LABEL_7:
  return self;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
  {
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 32, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NSUUID)messageTargetUUID
{
  if (self)
  {
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return (NSUUID *)self;
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke;
  v8[3] = &unk_1E6A197C8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKey:@"HMDUserNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    ptrdiff_t v4 = v3;
  }
  else {
    ptrdiff_t v4 = 0;
  }
  id v5 = v4;

  if (!v5) {
    _HMFPreconditionFailure();
  }
  id v6 = [*(id *)(a1 + 40) currentConnections];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke_2;
  v15[3] = &unk_1E6A0CB28;
  id v7 = v5;
  id v16 = v7;
  id v8 = objc_msgSend(v6, "na_filter:", v15);

  if ([v8 count])
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 40);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      BOOL v13 = [v7 uuid];
      *(_DWORD *)buf = 138543874;
      __int16 v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing connections: %@ due to removed user: %@", buf, 0x20u);
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke_113;
  v14[3] = &unk_1E6A0CB50;
  v14[4] = *(void *)(a1 + 40);
  objc_msgSend(v8, "na_each:", v14);
}

uint64_t __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  id v5 = [*(id *)(a1 + 32) uuid];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke_113(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 currentConnections];
  [v4 removeObject:v3];
}

- (void)handlePrimaryResidentIsCurrentDeviceChangeNotification:(id)a3
{
  id v3 = self;
  if (self) {
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 32, 1);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HMDRemoteEventRouterServer_handlePrimaryResidentIsCurrentDeviceChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = v3;
  dispatch_async(&self->super, block);
}

os_unfair_lock_s *__85__HMDRemoteEventRouterServer_handlePrimaryResidentIsCurrentDeviceChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v4 = [WeakRetained isCurrentDevicePrimaryResident];

  uint64_t result = -[HMDRemoteEventRouterServer isPrimaryResident](*(os_unfair_lock_s **)(a1 + 32));
  if (v4 != result)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 8);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    id v8 = NSNumber;
    id v9 = v7;
    id v10 = [v8 numberWithBool:v4];
    int v15 = 138412290;
    id v16 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "Primary resident status changed to %@", (uint8_t *)&v15, 0xCu);

    uint64_t v6 = *(void *)(a1 + 32);
    if (!v6)
    {
      id v11 = 0;
    }
    else
    {
LABEL_6:
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v6 + 20) = v4;
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 16));
      id v11 = *(void **)(a1 + 32);
    }
    id v12 = [v11 currentConnections];
    [v12 removeAllObjects];

    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v13, 104, 1);
    }
    return (os_unfair_lock_s *)[Property reset];
  }
  return result;
}

- (void)_registerForAccessoryMessages:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_106);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = logger;
    id Property = objc_getProperty(self, v10, 48, 1);
    id v12 = NSNumber;
    id v13 = Property;
    id v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v7, "userPrivilege"));
    *(_DWORD *)__int16 v38 = 138412802;
    *(void *)&v38[4] = Property;
    *(_WORD *)&v38[12] = 1024;
    *(_DWORD *)&v38[14] = v7 != 0;
    __int16 v39 = 2112;
    __int16 v40 = v14;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "Registering for accessory messages %@, user privilege: (exists: %d) %@", v38, 0x1Cu);
  }
  int v15 = [HMDRemoteEventRouterServerMessageReceiver alloc];
  id v17 = objc_getProperty(self, v16, 48, 1);
  id v18 = v17;
  id v20 = objc_getProperty(self, v19, 32, 1);
  id v21 = v18;
  id v22 = v20;
  uint64_t v23 = self;
  if (v15)
  {
    *(void *)__int16 v38 = v15;
    *(void *)&v38[8] = HMDRemoteEventRouterServerMessageReceiver;
    id v24 = (id *)objc_msgSendSuper2((objc_super *)v38, sel_init);
    __int16 v25 = v24;
    if (v24)
    {
      objc_storeStrong(v24 + 1, v17);
      objc_storeStrong(v25 + 2, v20);
      objc_storeWeak(v25 + 3, v23);
    }
  }
  else
  {
    __int16 v25 = 0;
  }

  objc_setProperty_atomic(v23, v26, v25, 136);
  id v28 = (id *)objc_getProperty(v23, v27, 136, 1);
  id v30 = objc_getProperty(v23, v29, 80, 1);
  if (v28)
  {
    id v31 = v4;
    id WeakRetained = objc_loadWeakRetained(v28 + 3);
    id v33 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    *(void *)__int16 v38 = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    id v35 = [v34 arrayByAddingObjectsFromArray:v31];

    if (WeakRetained) {
      id v37 = objc_getProperty(WeakRetained, v36, 56, 1);
    }
    else {
      id v37 = 0;
    }
    [v30 registerForMessage:v37 receiver:v28 policies:v35 selector:sel_handleRequestMessage_];
  }
}

uint64_t __60__HMDRemoteEventRouterServer__registerForAccessoryMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

- (void)_registerForMessages:(id)a3 withHome:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  id v9 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v31[0] = v9;
  SEL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  id v11 = [v10 arrayByAddingObjectsFromArray:v6];

  if (self) {
    id Property = objc_getProperty(self, v12, 80, 1);
  }
  else {
    id Property = 0;
  }
  id v14 = Property;
  int v15 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_95_70328);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    SEL v16 = v15;
  }
  else {
    SEL v16 = 0;
  }
  id v17 = v16;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = NSNumber;
    id v21 = logger;
    id v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v17, "userPrivilege"));
    v28[0] = 67109378;
    v28[1] = v17 != 0;
    __int16 v29 = 2112;
    id v30 = v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "Registering for messages with user privilege: (exists: %d) %@", (uint8_t *)v28, 0x12u);
  }
  objc_msgSend(v14, "registerForMessage:receiver:policies:selector:", objc_getProperty(self, v19, 56, 1), self, v11, sel__handlePrimaryRequestMessage_);

  id v24 = objc_getProperty(self, v23, 88, 1);
  __int16 v25 = [WeakRetained primaryResidentChangeMonitorForRouterServer:self];
  [v24 addObserver:self selector:sel_handlePrimaryResidentIsCurrentDeviceChangeNotification_ name:@"HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification" object:v25];

  objc_msgSend(objc_getProperty(self, v26, 88, 1), "addObserver:selector:name:object:", self, sel_handleHomeUserRemovedNotification_, @"HMDHomeUserRemovedNotification", v7);
  objc_msgSend(objc_getProperty(self, v27, 88, 1), "addObserver:selector:name:object:", self, sel__handleUserPrivilegeChange_, @"HMDUserPrivilegeDidChangeNotification", 0);
}

uint64_t __60__HMDRemoteEventRouterServer__registerForMessages_withHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

- (id)logIdentifier
{
  if (self)
  {
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 48, 1);
    uint64_t v2 = vars8;
  }
  return (id)[(HMDRemoteEventRouterServer *)self UUIDString];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v4);
  if (self)
  {
    id v7 = objc_getProperty(self, v5, 40, 1);
    id Property = objc_getProperty(self, v8, 48, 1);
    SEL v10 = NSNumber;
    id v11 = Property;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    self = (HMDRemoteEventRouterServer *)self->_isPrimaryResident;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    SEL v10 = NSNumber;
    id v7 = 0;
    id v11 = 0;
  }
  id v13 = [v10 numberWithBool:self];
  id v14 = [v3 stringWithFormat:@"<%@ home: %@, accessory: %@, mode: %@>", v6, v7, v11, v13];

  return (NSString *)v14;
}

- (HMDRemoteEventRouterServer)initWithPrimaryModeUUID:(id)a3 residentModeUUID:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 dataSource:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 logCategory:(const char *)a12 logEventSubmitter:(id)a13 connectionServerFactory:(id)a14
{
  id v49 = a3;
  id v40 = a4;
  id v48 = a4;
  id v47 = a5;
  id v46 = a6;
  id v19 = a7;
  id v45 = a8;
  id v44 = a9;
  id v43 = a10;
  id v42 = a11;
  id v20 = v19;
  id v50 = a13;
  id v21 = (void (**)(void))a14;
  v51.receiver = self;
  v51.super_class = (Class)HMDRemoteEventRouterServer;
  id v22 = [(HMDRemoteEventRouterServer *)&v51 init];
  SEL v23 = v22;
  if (v22)
  {
    v22->_lock._os_unfair_lock_opaque = 0;
    uint64_t v24 = HMFGetOSLogHandle();
    logger = v23->_logger;
    v23->_logger = (OS_os_log *)v24;

    os_log_t v26 = os_log_create("com.apple.HomeKitDaemon", a12);
    SEL v27 = v23->_logger;
    v23->_logger = (OS_os_log *)v26;

    id v28 = objc_alloc_init(HMDEventRouterTimerProvider);
    timerProvider = v23->_timerProvider;
    v23->_timerProvider = v28;

    objc_storeStrong((id *)&v23->_homeUUID, a3);
    objc_storeStrong((id *)&v23->_accessoryUUID, v40);
    objc_storeStrong((id *)&v23->_messageDispatcher, a6);
    objc_storeStrong((id *)&v23->_workQueue, a5);
    objc_storeWeak((id *)&v23->_dataSource, v20);
    objc_storeStrong((id *)&v23->_notificationCenter, a8);
    objc_storeStrong((id *)&v23->_routerRequestMessageName, a9);
    objc_storeStrong((id *)&v23->_routerUpdateMessageName, a10);
    objc_storeStrong((id *)&v23->_routerMultiHopFetchResponseMessageName, a11);
    uint64_t v30 = v21[2](v21);
    connectionServer = v23->_connectionServer;
    v23->_connectionServer = (HMEMessageDatagramServer *)v30;

    [(HMEMessageDatagramServer *)v23->_connectionServer setDelegate:v23];
    [(HMEMessageDatagramServer *)v23->_connectionServer setDataSource:v23];
    uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
    currentConnections = v23->_currentConnections;
    v23->_currentConnections = (NSMutableArray *)v32;

    *(_WORD *)&v23->_BOOL isPrimaryResident = 0;
    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
    accessControls = v23->_accessControls;
    v23->_accessControls = (NSMutableDictionary *)v34;

    uint64_t v36 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    pendingFetchRequests = v23->_pendingFetchRequests;
    v23->_pendingFetchRequests = (NSMapTable *)v36;

    objc_storeWeak((id *)&v23->_logEventSubmitter, v50);
  }

  return v23;
}

- (HMDRemoteEventRouterServer)initWithPrimaryModeUUID:(id)a3 residentModeUUID:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 dataSource:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 subscriptionProvider:(id)a12 registrationEventRouter:(id)a13 storeReadHandle:(id)a14
{
  id v37 = a5;
  id v32 = a12;
  id v18 = a13;
  id v19 = a14;
  id v42 = a11;
  id v41 = a10;
  id v39 = a9;
  id v40 = a8;
  id v38 = a7;
  id v36 = a6;
  id v20 = a4;
  id v21 = a3;
  id v22 = [v21 UUIDString];
  SEL v23 = [@"RemoteEventRouter.Server." stringByAppendingString:v22];

  id v24 = v23;
  uint64_t v25 = [v24 UTF8String];
  __int16 v29 = +[HMDMetricsManager sharedLogEventSubmitter];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __256__HMDRemoteEventRouterServer_initWithPrimaryModeUUID_residentModeUUID_queue_messageDispatcher_dataSource_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_subscriptionProvider_registrationEventRouter_storeReadHandle___block_invoke;
  v44[3] = &unk_1E6A0CAE0;
  id v45 = v37;
  id v46 = v32;
  id v47 = v18;
  id v48 = v19;
  id v49 = v24;
  id v35 = v24;
  id v31 = v19;
  id v30 = v18;
  id v33 = v32;
  id v26 = v37;
  SEL v27 = [(HMDRemoteEventRouterServer *)self initWithPrimaryModeUUID:v21 residentModeUUID:v20 queue:v26 messageDispatcher:v36 dataSource:v38 notificationCenter:v40 requestMessageName:v39 updateMessageName:v41 multiHopFetchResponseMessageName:v42 logCategory:v25 logEventSubmitter:v29 connectionServerFactory:v44];

  return v27;
}

id __256__HMDRemoteEventRouterServer_initWithPrimaryModeUUID_residentModeUUID_queue_messageDispatcher_dataSource_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_subscriptionProvider_registrationEventRouter_storeReadHandle___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F69F68]), "initWithQueue:provider:registrationEventRouter:storeReadHandle:logCategory:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "UTF8String"));
  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_70350 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_70350, &__block_literal_global_70351);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v5_70352;
  return v2;
}

uint64_t __41__HMDRemoteEventRouterServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_70352;
  logCategory__hmf_once_v5_70352 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end