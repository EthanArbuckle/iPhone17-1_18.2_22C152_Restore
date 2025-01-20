@interface HMDXPCClientConnection
+ (id)logCategory;
+ (unint64_t)entitlementsForConnection:(id)a3;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)hasExternallyManagedActivation;
- (BOOL)isActivated;
- (BOOL)isAuthorizedForHomeDataAccess;
- (BOOL)isAuthorizedForLocationAccess;
- (BOOL)isAuthorizedForMicrophoneAccess;
- (BOOL)isEntitledForAPIAccess;
- (BOOL)isEntitledForAssistantIdentifiers;
- (BOOL)isEntitledForBackgroundMode;
- (BOOL)isEntitledForCameraClipsAccess;
- (BOOL)isEntitledForHomeLocationAccess;
- (BOOL)isEntitledForHomeLocationFeedbackAccess;
- (BOOL)isEntitledForModernMessaging;
- (BOOL)isEntitledForMultiUserSetupAccess;
- (BOOL)isEntitledForPersonManagerAccess;
- (BOOL)isEntitledForSPIAccess;
- (BOOL)isEntitledForSecureAccess;
- (BOOL)isEntitledForShortcutsAutomationAccess;
- (BOOL)isEntitledForStateDump;
- (BOOL)isEntitledForWalletKeyAccess;
- (BOOL)isEntitledToProvideAccessorySetupPayload;
- (BOOL)isEntitledToProvideMatterSetupPayload;
- (BOOL)isPlatformBinary;
- (BOOL)sendMessage:(id)a3 error:(id *)a4;
- (Class)principalClass;
- (HMDProcessInfo)processInfo;
- (HMDXPCClientConnection)initWithConnection:(id)a3 queue:(id)a4;
- (HMDXPCClientConnection)initWithConnection:(id)a3 queue:(id)a4 messageCountTracker:(id)a5 requestTracker:(id)a6;
- (HMDXPCClientConnectionDelegate)delegate;
- (HMDXPCConnection)xpcConnection;
- (HMDXPCMessageCountTracker)messageCountTracker;
- (HMDXPCMessageSendPolicyParameters)sendPolicyParameters;
- (HMDXPCRequestTracker)requestTracker;
- (NSDictionary)stateDump;
- (NSDictionary)userInfo;
- (NSString)applicationBundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)clientName;
- (NSString)companionAppBundleIdentifier;
- (NSString)logIdentifier;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)_displayName;
- (id)attributeDescriptions;
- (id)clientUUID;
- (id)shortDescription;
- (int)clientPid;
- (unint64_t)entitlements;
- (unint64_t)homeManagerOptions;
- (unint64_t)inactiveUpdatingLevel;
- (unint64_t)state;
- (void)_activate;
- (void)_deactivate;
- (void)_handleMessage:(id)a3 responseHandler:(id)a4;
- (void)_invalidate;
- (void)_start;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)handleMessage:(id)a3;
- (void)handleMessage:(id)a3 responseHandler:(id)a4;
- (void)handleProcessStateDidChange;
- (void)initiateRefresh;
- (void)invalidate;
- (void)notifyOfExternallyManagedActivation;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHasExternallyManagedActivation:(BOOL)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setProcessInfo:(id)a3;
- (void)setSendPolicyParameters:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)updateSendPolicyParameters:(id)a3;
- (void)updateUserInfo:(id)a3;
@end

@implementation HMDXPCClientConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTracker, 0);
  objc_storeStrong((id *)&self->_messageCountTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sendPolicyParameters, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setHasExternallyManagedActivation:(BOOL)a3
{
  self->_hasExternallyManagedActivation = a3;
}

- (BOOL)hasExternallyManagedActivation
{
  return self->_hasExternallyManagedActivation;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (HMDXPCRequestTracker)requestTracker
{
  return (HMDXPCRequestTracker *)objc_getProperty(self, a2, 112, 1);
}

- (HMDXPCMessageCountTracker)messageCountTracker
{
  return (HMDXPCMessageCountTracker *)objc_getProperty(self, a2, 104, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isEntitledForWalletKeyAccess
{
  return self->_entitledForWalletKeyAccess;
}

- (BOOL)isEntitledForPersonManagerAccess
{
  return self->_entitledForPersonManagerAccess;
}

- (BOOL)isEntitledForMultiUserSetupAccess
{
  return self->_entitledForMultiUserSetupAccess;
}

- (BOOL)isEntitledForCameraClipsAccess
{
  return self->_entitledForCameraClipsAccess;
}

- (BOOL)isEntitledForBackgroundMode
{
  return self->_entitledForBackgroundMode;
}

- (BOOL)isEntitledForAPIAccess
{
  return self->_entitledForAPIAccess;
}

- (unint64_t)entitlements
{
  return self->_entitlements;
}

- (HMDXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setLogIdentifier:(id)a3
{
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDXPCClientConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDXPCClientConnectionDelegate *)WeakRetained;
}

- (BOOL)sendMessage:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(HMDXPCClientConnection *)self canSendMessage:v6];
  if (v7)
  {
    if (([v6 isLocationAuthorized] & 1) != 0
      || [v6 requiresHomeLocationEntitlement])
    {
      v8 = (void *)MEMORY[0x230FBD990]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        v12 = [v6 shortDescription];
        *(_DWORD *)buf = 138543618;
        v29 = v11;
        __int16 v30 = 2112;
        v31 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Marking location for message: %@", buf, 0x16u);
      }
      v13 = [(HMDXPCClientConnection *)v9 processInfo];
      v14 = [v13 locationAuthorization];
      [v14 mark];
    }
    v15 = (void *)[v6 mutableCopy];
    v16 = [v6 identifier];
    [v15 setIdentifier:v16];

    v17 = [MEMORY[0x263EFF910] date];
    [v15 setHeaderValue:v17 forKey:*MEMORY[0x263F0DEA0]];

    v18 = [(HMDXPCClientConnection *)self xpcConnection];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __44__HMDXPCClientConnection_sendMessage_error___block_invoke;
    v27[3] = &unk_264A2F3E8;
    v27[4] = self;
    v19 = [v18 remoteObjectProxyWithErrorHandler:v27];

    v20 = [v15 responseHandler];

    v21 = (void *)[v15 copy];
    if (v20)
    {
      v22 = [v15 responseHandler];
      [v19 handleMessage:v21 responseHandler:v22];
    }
    else
    {
      [v19 handleMessage:v21];
    }

    v23 = [(HMDXPCClientConnection *)self clientIdentifier];
    if (v23)
    {
      v24 = [(HMDXPCClientConnection *)self messageCountTracker];
      v25 = [v6 name];
      [v24 incrementCounterOfType:2 clientIdentifier:v23 messageName:v25];
    }
  }
  else if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
  }

  return v7;
}

void __44__HMDXPCClientConnection_sendMessage_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get remote object proxy for sending message: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v11 = 0;
  id v6 = a4;
  BOOL v7 = [(HMDXPCClientConnection *)self sendMessage:a3 error:&v11];
  id v8 = v11;
  v9 = (void (**)(void *, void))_Block_copy(v6);

  if (v9)
  {
    if (v7) {
      id v10 = 0;
    }
    else {
      id v10 = v8;
    }
    ((void (**)(void *, id))v9)[2](v9, v10);
  }
}

- (void)updateUserInfo:(id)a3
{
  id v5 = a3;
  v4 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v4);

  [(HMDXPCClientConnection *)self setUserInfo:v5];
}

- (void)handleMessage:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  BOOL v7 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v7);

  [(HMDXPCClientConnection *)self _handleMessage:v8 responseHandler:v6];
}

- (void)handleMessage:(id)a3
{
  id v5 = a3;
  v4 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v4);

  [(HMDXPCClientConnection *)self _handleMessage:v5 responseHandler:0];
}

- (void)_invalidate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(HMDXPCClientConnection *)self state];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4 == 3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Not invalidating already invalidated XPC connection", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Invalidating XPC connection", (uint8_t *)&v12, 0xCu);
    }
    [(HMDXPCClientConnection *)v6 _deactivate];
    [(HMDXPCClientConnection *)v6 setState:3];
    id v11 = [(HMDXPCClientConnection *)v6 delegate];
    [v11 connectionDidInvalidate:v6];
  }
}

- (void)_deactivate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDXPCClientConnection *)self state] == 3) {
    _HMFPreconditionFailure();
  }
  unint64_t v4 = [(HMDXPCClientConnection *)self state];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4 == 2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Not de-activating already de-activated XPC connection", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Deactivating XPC connection", (uint8_t *)&v12, 0xCu);
    }
    [(HMDXPCClientConnection *)v6 setState:2];
    id v11 = [(HMDXPCClientConnection *)v6 delegate];
    [v11 connectionDidDeactivate:v6];
  }
}

- (void)_activate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDXPCClientConnection *)self state] == 3) {
    _HMFPreconditionFailure();
  }
  unint64_t v4 = [(HMDXPCClientConnection *)self state];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4 == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Not activating already activated XPC connection", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Activating XPC connection", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v11 = [(HMDXPCClientConnection *)v6 state];
    [(HMDXPCClientConnection *)v6 setState:1];
    int v12 = [(HMDXPCClientConnection *)v6 delegate];
    [v12 connectionDidActivate:v6];

    if (v11 == 2) {
      [(HMDXPCClientConnection *)v6 initiateRefresh];
    }
  }
}

- (void)_start
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDXPCClientConnection *)self state] == 3) {
    _HMFPreconditionFailure();
  }
  unint64_t v4 = [(HMDXPCClientConnection *)self state];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Not starting already started XPC connection", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Starting XPC connection", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = [(HMDXPCClientConnection *)v6 delegate];
    [v11 connectionDidStart:v6];

    if (![(HMDXPCClientConnection *)v6 hasExternallyManagedActivation]) {
      [(HMDXPCClientConnection *)v6 _activate];
    }
    [(HMDXPCClientConnection *)v6 handleProcessStateDidChange];
  }
}

- (void)invalidate
{
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  [(HMDXPCClientConnection *)self _invalidate];
}

- (void)deactivate
{
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDXPCClientConnection *)self hasExternallyManagedActivation])
  {
    [(HMDXPCClientConnection *)self _deactivate];
  }
  else
  {
    unint64_t v4 = (HMDXPCClientConnection *)_HMFPreconditionFailure();
    [(HMDXPCClientConnection *)v4 activate];
  }
}

- (void)activate
{
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDXPCClientConnection *)self hasExternallyManagedActivation])
  {
    [(HMDXPCClientConnection *)self _activate];
  }
  else
  {
    unint64_t v4 = (HMDXPCClientConnection *)_HMFPreconditionFailure();
    [(HMDXPCClientConnection *)v4 _handleMessage:v6 responseHandler:v7];
  }
}

- (void)_handleMessage:(id)a3 responseHandler:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v55 = a4;
  id v7 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v7);

  v51 = (void *)MEMORY[0x230FBD990]();
  id v8 = objc_alloc(MEMORY[0x263F424F0]);
  v9 = (void *)MEMORY[0x263F42568];
  id v10 = [v6 name];
  uint64_t v11 = [v9 activityNameWithMessageName:v10];
  v56 = (void *)[v8 initWithName:v11];

  int v12 = [v6 headers];
  int v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F0B988]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  [v56 setClientMetricIdentifier:v15];
  v53 = [v6 name];
  v54 = [v6 identifier];
  context = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v47 = HMFGetLogIdentifier();
    v50 = [v56 identifier];
    v49 = [v50 shortDescription];
    v46 = [v54 UUIDString];
    v48 = [(HMDXPCClientConnection *)v16 name];
    v18 = [v6 destination];
    v19 = [v18 target];
    v45 = [v19 UUIDString];
    if (v55) {
      v20 = "";
    }
    else {
      v20 = " not";
    }
    v21 = [v6 messagePayload];
    if (getDenylistKeys_onceToken != -1) {
      dispatch_once(&getDenylistKeys_onceToken, &__block_literal_global_417);
    }
    id v22 = (id)getDenylistKeys_denylistKeys;
    v23 = [v21 secureDescriptionWithBlacklistKeys:v22];
    [v6 qualityOfService];
    v24 = HMFQualityOfServiceToString();
    *(_DWORD *)buf = 138545410;
    v64 = v47;
    __int16 v65 = 2114;
    v66 = v49;
    __int16 v67 = 2114;
    v68 = v53;
    __int16 v69 = 2114;
    v70 = v46;
    __int16 v71 = 2114;
    v72 = v48;
    __int16 v73 = 2114;
    v74 = v45;
    __int16 v75 = 2082;
    v76 = v20;
    __int16 v77 = 2114;
    v78 = v23;
    __int16 v79 = 2114;
    v80 = v24;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received incoming message %{public}@ (%{public}@) from client '%{public}@' for target %{public}@ that does%{public}s expect a response, payload %{public}@, QoS: %{public}@", buf, 0x5Cu);
  }
  v25 = [(HMDXPCClientConnection *)v16 clientIdentifier];
  if (v25)
  {
    v26 = [(HMDXPCClientConnection *)v16 messageCountTracker];
    v27 = [v6 name];
    [v26 incrementCounterOfType:0 clientIdentifier:v25 messageName:v27];
  }
  [(HMDXPCClientConnection *)v16 clientName];

  v28 = (void *)[v6 mutableCopy];
  if (shouldEnableInternalDebugInterfaces__hmf_once_t31 != -1) {
    dispatch_once(&shouldEnableInternalDebugInterfaces__hmf_once_t31, &__block_literal_global_867);
  }
  if (!shouldEnableInternalDebugInterfaces__hmf_once_v32
    || ([v6 messagePayload],
        v29 = objc_claimAutoreleasedReturnValue(),
        [v29 objectForKeyedSubscript:@"kNewObjectUUIDKey"],
        __int16 v30 = objc_claimAutoreleasedReturnValue(),
        BOOL v31 = v30 == 0,
        v30,
        v29,
        v31))
  {
    uint64_t v32 = [v6 messagePayload];
    v33 = (void *)[v32 mutableCopy];

    v34 = [MEMORY[0x263F08C38] UUID];
    v35 = [v34 UUIDString];
    [v33 setObject:v35 forKeyedSubscript:@"kNewObjectUUIDKey"];

    v36 = (void *)[v33 copy];
    [v28 setMessagePayload:v36];
  }
  [v28 setTransport:v16];
  [v28 setActivity:v56];
  v37 = [(HMDXPCClientConnection *)v16 clientIdentifier];
  [v28 setUntrustedClientIdentifier:v37];

  if (v55)
  {
    v38 = [(HMDXPCClientConnection *)v16 requestTracker];
    v39 = [v6 identifier];
    v40 = [v6 name];
    objc_msgSend(v38, "addRequestWithIdentifier:name:qualityOfService:isTimeoutDisabled:responseHandler:", v39, v40, objc_msgSend(v6, "qualityOfService"), objc_msgSend(v6, "hm_isXPCTimeoutDisabled"), v55);

    v41 = [(HMDXPCClientConnection *)v16 clientName];
    objc_initWeak((id *)buf, v16);
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __57__HMDXPCClientConnection__handleMessage_responseHandler___block_invoke;
    v57[3] = &unk_264A1C730;
    objc_copyWeak(&v62, (id *)buf);
    id v58 = v56;
    id v42 = v41;
    id v59 = v42;
    id v60 = v54;
    id v61 = v6;
    [v28 setResponseHandler:v57];

    objc_destroyWeak(&v62);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [v56 end];
  }
  v43 = [(HMDXPCClientConnection *)v16 delegate];
  v44 = (void *)[v28 copy];
  [v43 messageTransport:v16 didReceiveMessage:v44];
}

void __57__HMDXPCClientConnection__handleMessage_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    [v11 domain];

    [v11 code];
    id v7 = [WeakRetained requestTracker];
    [v7 respondToRequestWithIdentifier:*(void *)(a1 + 48) withPayload:v5 error:v11];

    if (v11)
    {
      id v8 = [WeakRetained clientIdentifier];
      if (v8)
      {
        v9 = [WeakRetained messageCountTracker];
        id v10 = [*(id *)(a1 + 56) name];
        [v9 incrementCounterOfType:1 clientIdentifier:v8 messageName:v10];
      }
    }
    [*(id *)(a1 + 32) end];
  }
}

- (BOOL)canSendMessage:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 transport];
  id v6 = v5;
  if (v5 && ([v5 isEqual:self] & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543874;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      __int16 v45 = 2112;
      v46 = v6;
      int v12 = "%{public}@Cannot send message %@: This XPC client connection does not match the message's transport: %@";
      v24 = v9;
      uint32_t v25 = 32;
LABEL_53:
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v41, v25);

LABEL_54:
      goto LABEL_55;
    }
    goto LABEL_55;
  }
  if ([v4 requiresSPIEntitlement]
    && ![(HMDXPCClientConnection *)self isEntitledForSPIAccess])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v26 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not SPI entitled and message requires SPI entitlement";
      goto LABEL_52;
    }
LABEL_55:

    BOOL v22 = 0;
    goto LABEL_56;
  }
  if ([v4 requiresNoSPIEntitlement]
    && [(HMDXPCClientConnection *)self isEntitledForSPIAccess])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is SPI entitled and message requires no SPI entitlement";
LABEL_52:
      v24 = v9;
      uint32_t v25 = 22;
      goto LABEL_53;
    }
    goto LABEL_55;
  }
  if ([v4 isLocationAuthorized]
    && ![(HMDXPCClientConnection *)self isAuthorizedForLocationAccess])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v27 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not location authorized and message requires location authorization";
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  if ([v4 requiresHomeLocationEntitlement]
    && ![(HMDXPCClientConnection *)self isEntitledForHomeLocationAccess])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not entitled for the HomeKit location data. Please make sure the"
            " client has com.apple.private.homekit.home-location & com.apple.private.homekit.location entitlements.";
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  if ([v4 requiresCameraClipsEntitlement]
    && ![(HMDXPCClientConnection *)self isEntitledForCameraClipsAccess])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not camera clips entitled and message requires camera clips entitlement";
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  if ([v4 requiresMultiUserSetupEntitlement]
    && ![(HMDXPCClientConnection *)self isEntitledForMultiUserSetupAccess])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    __int16 v30 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not multi user entitled and message requires multi user entitlement";
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  if ([v4 requiresSetupPayloadEntitlement]
    && ![(HMDXPCClientConnection *)self isEntitledToProvideAccessorySetupPayload])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    BOOL v31 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not setup payload entitled and message requires setup payload entitlement";
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  if ([v4 requiresMatterSetupPayloadEntitlement]
    && ![(HMDXPCClientConnection *)self isEntitledToProvideMatterSetupPayload])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v32 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not matter setup payload entitled and message requires matter se"
            "tup payload entitlement";
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  if ([v4 requiresPersonManagerEntitlement]
    && ![(HMDXPCClientConnection *)self isEntitledForPersonManagerAccess])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v33 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not person manager entitled and message requires person manager entitlement";
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  if ([v4 requiresWalletKeyEntitlement]
    && ![(HMDXPCClientConnection *)self isEntitledForWalletKeyAccess])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v34 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      int v41 = 138543618;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v11;
      int v12 = "%{public}@Cannot send message %@: Client is not wallet key entitled and message requires wallet key entitlement";
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  if (![(HMDXPCClientConnection *)self isActivated])
  {
    int v13 = [(HMDXPCClientConnection *)self requestTracker];
    uint64_t v14 = [v13 requestIdentifiers];
    id v15 = [v4 identifier];
    char v16 = [v14 containsObject:v15];

    if ((v16 & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      v35 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = HMFGetLogIdentifier();
        id v11 = [v4 shortDescription];
        int v41 = 138543618;
        id v42 = v10;
        __int16 v43 = 2112;
        v44 = v11;
        int v12 = "%{public}@Cannot send message %@: Connection is not activated and the message isn't responding to a pending request";
        goto LABEL_52;
      }
      goto LABEL_55;
    }
  }
  uint64_t v17 = [v4 sendPolicy];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [v4 sendPolicy];
    v20 = [(HMDXPCClientConnection *)self sendPolicyParameters];
    char v21 = [v19 canSendWithPolicyParameters:v20];

    if ((v21 & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      v37 = self;
      v9 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_55;
      }
      id v10 = HMFGetLogIdentifier();
      v38 = [v4 shortDescription];
      v39 = [v4 sendPolicy];
      v40 = [(HMDXPCClientConnection *)v37 sendPolicyParameters];
      int v41 = 138544130;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v38;
      __int16 v45 = 2112;
      v46 = v39;
      __int16 v47 = 2112;
      v48 = v40;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Cannot send message %@: Message send policy %@ does not pass client connection send policy: %@", (uint8_t *)&v41, 0x2Au);

      goto LABEL_54;
    }
  }
  BOOL v22 = 1;
LABEL_56:

  return v22;
}

- (NSDictionary)stateDump
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMDXPCClientConnection *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"Name"];

  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDXPCClientConnection clientPid](self, "clientPid"));
  [v3 setObject:v5 forKeyedSubscript:@"PID"];

  [(HMDXPCClientConnection *)self entitlements];
  id v6 = HMXPCClientEntitlementsShortDescription();
  [v3 setObject:v6 forKeyedSubscript:@"Entitlements"];

  [(HMDXPCClientConnection *)self isActivated];
  id v7 = HMFBooleanToString();
  [v3 setObject:v7 forKeyedSubscript:@"Activated"];

  id v8 = [(HMDXPCClientConnection *)self sendPolicyParameters];
  v9 = [v8 description];
  [v3 setObject:v9 forKeyedSubscript:@"Send Policy Parameters"];

  id v10 = [(HMDXPCClientConnection *)self userInfo];
  [v3 setObject:v10 forKeyedSubscript:@"User Info"];

  id v11 = [(HMDXPCClientConnection *)self requestTracker];
  int v12 = [v11 requestIdentifiers];
  [v3 setObject:v12 forKeyedSubscript:@"Active Requests"];

  int v13 = (void *)[v3 copy];
  return (NSDictionary *)v13;
}

- (void)updateSendPolicyParameters:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating sendPolicyParameters to %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMDXPCClientConnection *)v6 setSendPolicyParameters:v4];
}

- (void)initiateRefresh
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDXPCClientConnection *)self state] != 1) {
    _HMFPreconditionFailure();
  }
  id v4 = (void *)MEMORY[0x263F42568];
  uint64_t v5 = *MEMORY[0x263F0DE68];
  id v6 = [MEMORY[0x263F42570] allMessageDestinations];
  id v7 = [v4 messageWithName:v5 qualityOfService:9 destination:v6 payload:0];

  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    id v12 = [v7 identifier];

    if (v12)
    {
      uint64_t v13 = [v7 identifier];
      [v13 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v14 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 1042;
    *(_DWORD *)&buf[14] = 16;
    __int16 v16 = 2098;
    uint64_t v17 = &v14;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Initiating refresh using message with identifier: %{public,uuid_t}.16P", buf, 0x1Cu);
  }
  [(HMDXPCClientConnection *)v9 sendMessage:v7 completionHandler:0];
}

- (NSString)companionAppBundleIdentifier
{
  return 0;
}

- (NSString)applicationBundleIdentifier
{
  v2 = [(HMDXPCClientConnection *)self processInfo];
  id v3 = [v2 applicationInfo];
  id v4 = [v3 bundleIdentifier];

  if (v4) {
    id v5 = v4;
  }

  return (NSString *)v4;
}

- (void)setSendPolicyParameters:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (HMDXPCMessageSendPolicyParameters *)[v6 copy];
  sendPolicyParameters = self->_sendPolicyParameters;
  self->_sendPolicyParameters = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDXPCMessageSendPolicyParameters)sendPolicyParameters
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_sendPolicyParameters;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)notifyOfExternallyManagedActivation
{
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDXPCClientConnection *)self state])
  {
    id v4 = (HMDXPCClientConnection *)_HMFPreconditionFailure();
    [(HMDXPCClientConnection *)v4 handleProcessStateDidChange];
  }
  else
  {
    [(HMDXPCClientConnection *)self setHasExternallyManagedActivation:1];
  }
}

- (void)handleProcessStateDidChange
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(HMDXPCClientConnection *)self hasExternallyManagedActivation])
  {
    id v4 = [(HMDXPCClientConnection *)self processInfo];
    uint64_t v5 = [v4 state];

    if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      if ([(HMDXPCClientConnection *)self state] == 1)
      {
        id v10 = (void *)MEMORY[0x230FBD990]();
        __int16 v11 = self;
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = HMFGetLogIdentifier();
          int v14 = 138543362;
          id v15 = v13;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Deactivating XPC connection that is now in the background", (uint8_t *)&v14, 0xCu);
        }
        [(HMDXPCClientConnection *)v11 _deactivate];
      }
    }
    else if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 0 && [(HMDXPCClientConnection *)self state] == 2)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = HMFGetLogIdentifier();
        int v14 = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Activating XPC connection that is now in the foreground and initiating refresh", (uint8_t *)&v14, 0xCu);
      }
      [(HMDXPCClientConnection *)v7 _activate];
    }
  }
}

- (void)setProcessInfo:(id)a3
{
  id v4 = (HMDProcessInfo *)a3;
  os_unfair_lock_lock_with_options();
  processInfo = self->_processInfo;
  self->_processInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDProcessInfo)processInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_processInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isPlatformBinary
{
  id v3 = [(HMDXPCClientConnection *)self xpcConnection];
  id v4 = v3;
  if (v3) {
    [v3 auditToken];
  }

  [(HMDXPCClientConnection *)self clientPid];
  if (csops_audittoken()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (int)clientPid
{
  v2 = [(HMDXPCClientConnection *)self xpcConnection];
  int v3 = [v2 processIdentifier];
  if (v3) {
    int v4 = v3;
  }
  else {
    int v4 = -1;
  }

  return v4;
}

- (NSString)name
{
  int v3 = [(HMDXPCClientConnection *)self processInfo];
  int v4 = [v3 name];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(HMDXPCClientConnection *)self clientName];
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (id)_displayName
{
  int v3 = [(HMDXPCClientConnection *)self name];

  if (v3)
  {
    int v4 = [(HMDXPCClientConnection *)self name];
  }
  else
  {
    uint64_t v5 = [(HMDXPCClientConnection *)self processInfo];
    id v6 = [v5 applicationInfo];
    id v7 = [v6 bundleIdentifier];

    if (v7)
    {
      id v8 = [(HMDXPCClientConnection *)self processInfo];
      int v9 = [v8 applicationInfo];
      int v4 = [v9 bundleIdentifier];
    }
    else
    {
      int v4 = @"unknown";
    }
  }
  return v4;
}

- (BOOL)isEntitledForHomeLocationFeedbackAccess
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 20) & 1;
}

- (BOOL)isEntitledForModernMessaging
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 22) & 1;
}

- (BOOL)isEntitledForAssistantIdentifiers
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 18) & 1;
}

- (BOOL)isEntitledForStateDump
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 16) & 1;
}

- (BOOL)isEntitledForSecureAccess
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 14) & 1;
}

- (BOOL)isEntitledForShortcutsAutomationAccess
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 11) & 1;
}

- (BOOL)isEntitledToProvideMatterSetupPayload
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 21) & 1;
}

- (BOOL)isEntitledToProvideAccessorySetupPayload
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 6) & 1;
}

- (BOOL)isEntitledForHomeLocationAccess
{
  v2 = [(HMDXPCClientConnection *)self xpcConnection];
  char v3 = validateEntitlementForConnection(@"com.apple.private.homekit.home-location", v2);

  return v3;
}

- (BOOL)isAuthorizedForLocationAccess
{
  if (([(HMDXPCClientConnection *)self entitlements] & 0x400) != 0)
  {
    char v3 = [(id)objc_opt_class() bundleForLocationManager];
    if (!v3)
    {
      uint64_t v5 = 0;
      goto LABEL_7;
    }
    uint64_t v4 = [objc_alloc(MEMORY[0x263F42550]) initWithBundle:v3];
  }
  else
  {
    char v3 = [(HMDXPCClientConnection *)self processInfo];
    uint64_t v4 = [v3 locationAuthorization];
  }
  uint64_t v5 = (void *)v4;
LABEL_7:

  char v6 = [v5 isAuthorized];
  return v6;
}

- (BOOL)isEntitledForSPIAccess
{
  return ([(HMDXPCClientConnection *)self entitlements] >> 2) & 1;
}

- (BOOL)isAuthorizedForMicrophoneAccess
{
  v2 = [(HMDXPCClientConnection *)self xpcConnection];
  char v3 = v2;
  if (v2) {
    [v2 auditToken];
  }
  BOOL v4 = TCCAccessCheckAuditToken() != 0;

  return v4;
}

- (BOOL)isAuthorizedForHomeDataAccess
{
  v2 = [(HMDXPCClientConnection *)self xpcConnection];
  char v3 = v2;
  if (v2) {
    [v2 auditToken];
  }
  BOOL v4 = TCCAccessCheckAuditToken() != 0;

  return v4;
}

- (NSString)clientIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  clientIdentifier = self->_clientIdentifier;
  if (!clientIdentifier)
  {
    uint64_t v5 = [(HMDProcessInfo *)self->_processInfo applicationInfo];
    char v6 = [v5 bundleIdentifier];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
      int v9 = self->_clientIdentifier;
      self->_clientIdentifier = v8;
    }
    else
    {
      id v10 = [(HMFProcessInfo *)self->_processInfo name];
      int v9 = v10;
      if (v10)
      {
        __int16 v11 = v10;
      }
      else
      {
        __int16 v11 = [(NSDictionary *)self->_userInfo hmf_stringForKey:*MEMORY[0x263F0D4F0]];
      }
      id v12 = self->_clientIdentifier;
      self->_clientIdentifier = v11;
    }
    clientIdentifier = self->_clientIdentifier;
  }
  uint64_t v13 = clientIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (unint64_t)homeManagerOptions
{
  if (![(objc_class *)[(HMDXPCClientConnection *)self principalClass] isEqual:objc_opt_class()])return -1; {
  char v3 = [(HMDXPCClientConnection *)self userInfo];
  }
  BOOL v4 = objc_msgSend(v3, "hmf_numberForKey:", *MEMORY[0x263F0CBA8]);

  if (v4)
  {
    uint64_t v5 = [v4 unsignedIntegerValue];
    if (([(HMDXPCClientConnection *)self entitlements] & 4) != 0) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = v5 & 0xFFFFFFFFFFFF372FLL;
    }
  }
  else
  {
    unint64_t v6 = -1;
  }

  return v6;
}

- (Class)principalClass
{
  v2 = [(HMDXPCClientConnection *)self userInfo];
  objc_msgSend(v2, "hmf_stringForKey:", *MEMORY[0x263F0D4E8]);
  char v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    BOOL v4 = NSClassFromString(v3);
  }
  else
  {
    BOOL v4 = 0;
  }

  return (Class)v4;
}

- (unint64_t)inactiveUpdatingLevel
{
  v2 = [(HMDXPCClientConnection *)self userInfo];
  char v3 = objc_msgSend(v2, "hmf_numberForKey:", *MEMORY[0x263F0CB20]);
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (id)clientUUID
{
  v2 = [(HMDXPCClientConnection *)self userInfo];
  char v3 = objc_msgSend(v2, "hmf_UUIDForKey:", *MEMORY[0x263F0DE70]);

  return v3;
}

- (NSString)clientName
{
  v2 = [(HMDXPCClientConnection *)self userInfo];
  char v3 = objc_msgSend(v2, "hmf_stringForKey:", *MEMORY[0x263F0D4F0]);

  return (NSString *)v3;
}

- (void)setUserInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDXPCClientConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    userInfo = self->_userInfo;
    id v7 = (NSDictionary *)[v4 copy];
    id v8 = self->_userInfo;
    self->_userInfo = v7;

    os_unfair_lock_unlock(&self->_lock);
    int v9 = [(HMDXPCClientConnection *)self clientName];
    if (v9)
    {
      id v10 = [(HMDXPCClientConnection *)self requestTracker];
      [v10 setClientName:v9];
    }
    __int16 v11 = NSString;
    id v12 = [(HMDXPCClientConnection *)self name];
    uint64_t v13 = [(HMDXPCClientConnection *)self clientPid];
    int v14 = [(HMDXPCClientConnection *)self clientUUID];
    id v15 = [v11 stringWithFormat:@"%@/%d/%@", v12, v13, v14];
    [(HMDXPCClientConnection *)self setLogIdentifier:v15];

    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v21 = v19;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updated user info: %@", buf, 0x16u);
    }
    if (!userInfo) {
      [(HMDXPCClientConnection *)v17 _start];
    }
  }
}

- (NSDictionary)userInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isActivated
{
  return [(HMDXPCClientConnection *)self state] == 1;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDXPCClientConnection *)self _displayName];
  uint64_t v5 = (void *)[v3 initWithName:@"Name" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDXPCClientConnection clientPid](self, "clientPid", v5));
  id v8 = (void *)[v6 initWithName:@"PID" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDXPCClientConnection *)self entitlements];
  id v10 = HMXPCClientEntitlementsShortDescription();
  __int16 v11 = (void *)[v9 initWithName:@"Entitlements" value:v10];
  v14[2] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  uint64_t v5 = [(HMDXPCClientConnection *)self name];
  id v6 = [v3 stringWithFormat:@"%@ %@ (%d)", v4, v5, -[HMDXPCClientConnection clientPid](self, "clientPid")];

  return v6;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(HMDXPCClientConnection *)self requestTracker];
  [v4 cancelAllRequests];

  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v11 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@XPC connection got deallocated.", buf, 0xCu);
  }
  v9.receiver = v6;
  v9.super_class = (Class)HMDXPCClientConnection;
  [(HMDXPCClientConnection *)&v9 dealloc];
}

- (HMDXPCClientConnection)initWithConnection:(id)a3 queue:(id)a4 messageCountTracker:(id)a5 requestTracker:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  id v15 = v14;
  if (!v14)
  {
LABEL_11:
    __int16 v22 = (HMDXPCClientConnection *)_HMFPreconditionFailure();
    return [(HMDXPCClientConnection *)v22 initWithConnection:v24 queue:v25];
  }
  v26.receiver = self;
  v26.super_class = (Class)HMDXPCClientConnection;
  uint64_t v16 = [(HMDXPCClientConnection *)&v26 init];
  if (v16)
  {
    [v11 setQueue:v12];
    objc_storeStrong((id *)&v16->_xpcConnection, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    objc_storeStrong((id *)&v16->_messageCountTracker, a5);
    objc_storeStrong((id *)&v16->_requestTracker, a6);
    v16->_state = 0;
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v11, "processIdentifier"));
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v17;

    v16->_entitlements = +[HMDXPCClientConnection entitlementsForConnection:v11];
    v16->_entitledForAPIAccess = validateEntitlementForConnection(@"com.apple.developer.homekit", v11);
    v16->_entitledForBackgroundMode = validateEntitlementForConnection(@"com.apple.developer.homekit.background-mode", v11);
    v16->_entitledForCameraClipsAccess = validateEntitlementForConnection(@"com.apple.private.homekit.cameraclips", v11);
    v16->_entitledForMultiUserSetupAccess = validateEntitlementForConnection(@"com.apple.private.homekit.multi-user.setup", v11);
    v16->_entitledForPersonManagerAccess = validateEntitlementForConnection(@"com.apple.private.homekit.person-manager", v11);
    v16->_entitledForWalletKeyAccess = validateEntitlementForConnection(@"com.apple.private.homekit.wallet-key", v11);
    v19 = [[HMDXPCMessageSendPolicyParameters alloc] initWithEntitlements:v16->_entitlements];
    sendPolicyParameters = v16->_sendPolicyParameters;
    v16->_sendPolicyParameters = v19;
  }
  return v16;
}

- (HMDXPCClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v7;
    objc_super v9 = +[HMDXPCMessageCountTracker sharedTracker];
    id v10 = [[HMDXPCRequestTracker alloc] initWithQueue:v8];
    id v11 = [(HMDXPCClientConnection *)self initWithConnection:v6 queue:v8 messageCountTracker:v9 requestTracker:v10];

    return v11;
  }
  else
  {
    id v13 = (void *)_HMFPreconditionFailure();
    return (HMDXPCClientConnection *)+[HMDXPCClientConnection logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42 != -1) {
    dispatch_once(&logCategory__hmf_once_t42, &__block_literal_global_55391);
  }
  v2 = (void *)logCategory__hmf_once_v43;
  return v2;
}

void __37__HMDXPCClientConnection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v43;
  logCategory__hmf_once___int16 v43 = v0;
}

+ (unint64_t)entitlementsForConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = validateEntitlementForConnection(@"com.apple.developer.homekit", v4);
  if (validateEntitlementForConnection(@"com.apple.developer.homekit.background-mode", v4)) {
    uint64_t v6 = v5 | 2;
  }
  else {
    uint64_t v6 = v5;
  }
  if (!validateEntitlementForConnection(@"com.apple.private.homekit", v4))
  {
    if (!validateEntitlementForConnection(@"com.apple.homekit.private-spi-access", v4)) {
      goto LABEL_10;
    }
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    objc_super v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v13 = 138543874;
      SEL v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = @"com.apple.private.homekit";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Client should adopt %@ entitlement: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  v6 |= 4uLL;
LABEL_10:
  if (validateEntitlementForConnection(@"com.apple.private.homekit.pairing-identity.private", v4))
  {
    unint64_t v11 = v6 | 0x18;
  }
  else if (validateEntitlementForConnection(@"com.apple.private.homekit.pairing-identity", v4))
  {
    unint64_t v11 = v6 | 8;
  }
  else
  {
    unint64_t v11 = v6;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.remote-login.private", v4)) {
    v11 |= 0x20uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.developer.homekit.allow-setup-payload", v4)) {
    v11 |= 0x40uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.developer.matter.allow-setup-payload", v4)) {
    v11 |= 0x200000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.cameraclips", v4)) {
    v11 |= 0x80uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.connectivity-info", v4)) {
    v11 |= 0x100uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.multi-user.setup", v4)) {
    v11 |= 0x200uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.location", v4)) {
    v11 |= 0x400uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.home-location", v4)) {
    v11 |= 0x80000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.shortcuts-automation-access", v4))v11 |= 0x800uLL; {
  if (validateEntitlementForConnection(@"com.apple.private.homekit.messaging", v4))
  }
    v11 |= 0x1000uLL;
  if (validateEntitlementForConnection(@"com.apple.private.homekit.person-manager", v4)) {
    v11 |= 0x2000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.allow-secure-access", v4)) {
    v11 |= 0x4000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.diagnostics", v4)) {
    v11 |= 0x8000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.state-dump", v4)) {
    v11 |= 0x10000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.wallet-key", v4)) {
    v11 |= 0x20000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.assistant-identifiers", v4)) {
    v11 |= 0x40000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.location-feedback-debug", v4)) {
    v11 |= 0x100000uLL;
  }
  if (validateEntitlementForConnection(@"com.apple.private.homekit.modern-messaging", v4)) {
    v11 |= 0x400000uLL;
  }

  return v11;
}

@end