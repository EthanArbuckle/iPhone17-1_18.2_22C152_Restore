@interface HMXPCClient
+ (id)exportedInterface;
+ (id)logCategory;
+ (id)remoteObjectInterface;
- (BOOL)isAuthorizedForHomeDataAccess;
- (BOOL)requiresCheckin;
- (HMXPCClient)initWithConfiguration:(id)a3;
- (HMXPCClient)initWithConfiguration:(id)a3 userInfo:(id)a4;
- (HMXPCMessageTransportConfiguration)configuration;
- (NSDictionary)userInfo;
- (NSMutableArray)reconnectionHandlers;
- (NSString)logIdentifier;
- (NSUUID)UUID;
- (NSXPCConnection)connection;
- (int)notifyRegisterToken;
- (unint64_t)homeDataAuthorizationStatus;
- (void)dealloc;
- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4;
- (void)registerReconnectionHandler:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setConnection:(id)a3;
- (void)setHomeDataAuthorizationStatus:(unint64_t)a3;
- (void)setNotifyRegisterToken:(int)a3;
- (void)setRequiresCheckin:(BOOL)a3;
@end

@implementation HMXPCClient

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23 != -1) {
    dispatch_once(&logCategory__hmf_once_t23, &__block_literal_global_2415);
  }
  v2 = (void *)logCategory__hmf_once_v24;

  return v2;
}

void __25__HMXPCClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x19F3A64A0]();
    v3 = (os_unfair_lock_s *)WeakRetained;
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = HMFGetLogIdentifier();
      v6 = [(os_unfair_lock_s *)v3 reconnectionHandlers];
      *(_DWORD *)buf = 138543618;
      v20 = v5;
      __int16 v21 = 2048;
      uint64_t v22 = [v6 count];
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu reconnection handlers about refresh", buf, 0x16u);
    }
    v7 = v3 + 4;
    os_unfair_lock_lock_with_options();
    v8 = [(os_unfair_lock_s *)v3 reconnectionHandlers];
    v9 = (void *)[v8 copy];

    os_unfair_lock_unlock(v7);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13));
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)registerReconnectionHandler:(id)a3
{
  id aBlock = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMXPCClient *)self reconnectionHandlers];
  v6 = _Block_copy(aBlock);
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableArray)reconnectionHandlers
{
  return self->_reconnectionHandlers;
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    id v10 = v7;
  }
  else {
    id v10 = (id)[v7 mutableCopy];
  }
  uint64_t v11 = v10;

  uint64_t v12 = (void *)MEMORY[0x19F3A64A0]([v11 setTransport:self]);
  uint64_t v13 = self;
  long long v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v15 = HMFGetLogIdentifier();
    long long v16 = [v7 shortDescription];
    int v19 = 138543618;
    v20 = v15;
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Received message %@ from XPC server", (uint8_t *)&v19, 0x16u);
  }
  long long v17 = [(HMFMessageTransport *)v13 delegate];
  v18 = (void *)[v11 copy];
  [v17 messageTransport:v13 didReceiveMessage:v18];
}

- (HMXPCClient)initWithConfiguration:(id)a3
{
  return [(HMXPCClient *)self initWithConfiguration:a3 userInfo:MEMORY[0x1E4F1CC08]];
}

- (NSXPCConnection)connection
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_connection = &self->_connection;
  connection = self->_connection;
  if (connection)
  {
    id v6 = connection;
  }
  else
  {
    [(HMXPCClient *)self setRequiresCheckin:1];
    objc_initWeak(&location, self);
    id v7 = [HMXPCClientConnectionProxy alloc];
    v8 = [(HMXPCClient *)self userInfo];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __25__HMXPCClient_connection__block_invoke;
    v45[3] = &unk_1E59455B8;
    v33 = &v46;
    objc_copyWeak(&v46, &location);
    v34 = [(HMXPCClientConnectionProxy *)v7 initWithUserInfo:v8 refreshHandler:v45];

    [(HMFMessageTransport *)v34 setDelegate:self];
    id v9 = objc_alloc(MEMORY[0x1E4F29268]);
    id v10 = [(HMXPCClient *)self configuration];
    uint64_t v11 = [v10 machServiceName];
    id v6 = (NSXPCConnection *)[v9 initWithMachServiceName:v11 options:0];

    uint64_t v12 = +[HMXPCClient remoteObjectInterface];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v12];

    uint64_t v13 = +[HMXPCClient exportedInterface];
    [(NSXPCConnection *)v6 setExportedInterface:v13];

    [(NSXPCConnection *)v6 setExportedObject:v34];
    long long v14 = [(HMXPCClient *)self configuration];
    long long v15 = [v14 queue];
    [(NSXPCConnection *)v6 _setQueue:v15];

    objc_initWeak(&from, v6);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __25__HMXPCClient_connection__block_invoke_73;
    v41[3] = &unk_1E593E708;
    v31 = &v42;
    objc_copyWeak(&v42, &location);
    v32 = &v43;
    objc_copyWeak(&v43, &from);
    [(NSXPCConnection *)v6 setInterruptionHandler:v41];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __25__HMXPCClient_connection__block_invoke_75;
    v38[3] = &unk_1E593E708;
    objc_copyWeak(&v39, &location);
    objc_copyWeak(&v40, &from);
    [(NSXPCConnection *)v6 setInvalidationHandler:v38];
    if ([(HMXPCClient *)self notifyRegisterToken] == -1)
    {
      int out_token = 0;
      long long v16 = [(HMXPCClient *)self configuration];
      id v17 = [v16 serverStartNotification];
      v18 = (const char *)[v17 UTF8String];
      int v19 = dispatch_get_global_queue(17, 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __25__HMXPCClient_connection__block_invoke_76;
      handler[3] = &unk_1E5943C28;
      v30 = &v36;
      objc_copyWeak(&v36, &location);
      uint32_t v20 = notify_register_dispatch(v18, &out_token, v19, handler);

      if (v20)
      {
        v25 = (void *)MEMORY[0x19F3A64A0](v21, v22, v23, v24);
        v26 = self;
        HMFGetOSLogHandle();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v49 = v28;
          __int16 v50 = 1024;
          uint32_t v51 = v20;
          _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for HomeKit daemon ready notification: %u", buf, 0x12u);
        }
      }
      else
      {
        -[HMXPCClient setNotifyRegisterToken:](self, "setNotifyRegisterToken:", out_token, &v36, &v42, &v43, &v46);
      }
      objc_destroyWeak(v30);
    }
    [(NSXPCConnection *)v6 resume];
    objc_storeStrong((id *)p_connection, v6);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);
    objc_destroyWeak(v32);
    objc_destroyWeak(v31);
    objc_destroyWeak(&from);

    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  v8 = [(HMXPCClient *)self configuration];
  if ([v8 requiresHomeDataAccess])
  {
    BOOL v9 = [(HMXPCClient *)self isAuthorizedForHomeDataAccess];

    if (!v9)
    {
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        long long v14 = [v6 shortDescription];
        *(_DWORD *)buf = 138543618;
        v53 = v13;
        __int16 v54 = 2112;
        v55 = v14;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Message send failed for %@ because client is not authorized for home data access", buf, 0x16u);
      }
      long long v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:47];
      [v6 respondWithError:v15];
      if (v7) {
        v7[2](v7, v15);
      }
      goto LABEL_28;
    }
  }
  else
  {
  }
  long long v15 = [(HMXPCClient *)self connection];
  os_unfair_lock_lock_with_options();
  if ([(HMXPCClient *)self requiresCheckin])
  {
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v53 = v19;
      __int16 v54 = 2048;
      v55 = v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Connecting to the daemon using connection: %p", buf, 0x16u);
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __45__HMXPCClient_sendMessage_completionHandler___block_invoke;
    v51[3] = &unk_1E5945188;
    v51[4] = v17;
    uint32_t v20 = [v15 remoteObjectProxyWithErrorHandler:v51];
    uint64_t v21 = [(HMXPCClient *)v17 userInfo];
    [v20 updateUserInfo:v21];
  }
  [(HMXPCClient *)self setRequiresCheckin:0];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v22 = objc_opt_class();
  if (v22 == objc_opt_class()) {
    id v23 = v6;
  }
  else {
    id v23 = (id)[v6 mutableCopy];
  }
  uint64_t v24 = v23;
  if ([v6 qualityOfService] == -1)
  {
    v31 = [MEMORY[0x1E4F29060] currentThread];
    objc_msgSend(v24, "setQualityOfService:", objc_msgSend(v31, "qualityOfService"));

    v25 = (void *)MEMORY[0x19F3A64A0]();
    v32 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      v34 = [v6 shortDescription];
      [v24 qualityOfService];
      v35 = HMFQualityOfServiceToString();
      *(_DWORD *)buf = 138543874;
      v53 = v33;
      __int16 v54 = 2112;
      v55 = v34;
      __int16 v56 = 2112;
      v57 = v35;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ to XPC server with adopted QOS: %@", buf, 0x20u);
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      v29 = [v6 shortDescription];
      [v24 qualityOfService];
      v30 = HMFQualityOfServiceToString();
      *(_DWORD *)buf = 138543874;
      v53 = v28;
      __int16 v54 = 2112;
      v55 = v29;
      __int16 v56 = 2112;
      v57 = v30;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ to XPC server with QOS: %@", buf, 0x20u);
    }
  }

  id v36 = [v6 activity];
  v37 = [v36 clientMetricIdentifier];

  if (v37)
  {
    v38 = [v6 activity];
    id v39 = [v38 clientMetricIdentifier];
    [v24 setHeaderValue:v39 forKey:@"HMActivityMetricIdentifierKey"];
  }
  id v40 = (void *)[v24 copy];

  v41 = [v40 responseHandler];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __45__HMXPCClient_sendMessage_completionHandler___block_invoke_83;
  v48[3] = &unk_1E59449F0;
  v48[4] = self;
  id v6 = v40;
  id v49 = v6;
  id v42 = v41;
  id v50 = v42;
  id v43 = [v15 remoteObjectProxyWithErrorHandler:v48];
  v44 = v43;
  if (v42)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __45__HMXPCClient_sendMessage_completionHandler___block_invoke_84;
    v45[3] = &unk_1E5945510;
    void v45[4] = self;
    id v46 = v6;
    id v47 = v42;
    [v44 handleMessage:v46 responseHandler:v45];
  }
  else
  {
    [v43 handleMessage:v6];
  }
  if (v7) {
    v7[2](v7, 0);
  }

LABEL_28:
}

- (HMXPCMessageTransportConfiguration)configuration
{
  return (HMXPCMessageTransportConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequiresCheckin:(BOOL)a3
{
  self->_requiresCheckin = a3;
}

- (BOOL)requiresCheckin
{
  return self->_requiresCheckin;
}

- (BOOL)isAuthorizedForHomeDataAccess
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (([(HMXPCClient *)self homeDataAuthorizationStatus] & 1) == 0) {
    [(HMXPCClient *)self setHomeDataAuthorizationStatus:HMPrivacyGetAuthorizationStatusForHomeKit()];
  }
  unint64_t v4 = ([(HMXPCClient *)self homeDataAuthorizationStatus] >> 2) & 1;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)homeDataAuthorizationStatus
{
  return self->_homeDataAuthorizationStatus;
}

- (HMXPCClient)initWithConfiguration:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v26 = (HMMutableXPCMessageTransportConfiguration *)_HMFPreconditionFailure();
    return (HMXPCClient *)[(HMMutableXPCMessageTransportConfiguration *)v26 copyWithZone:v28];
  }
  BOOL v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = (void *)[v8 mutableCopy];
  uint64_t v11 = [MEMORY[0x1E4F65540] processInfo];
  uint64_t v12 = [v11 name];
  [v10 setObject:v12 forKeyedSubscript:@"HMProcessNameKey"];

  uint64_t v13 = [v9 UUIDString];
  [v10 setObject:v13 forKeyedSubscript:@"HMXPCClientUUIDKey"];

  v29.receiver = self;
  v29.super_class = (Class)HMXPCClient;
  long long v14 = [(HMXPCClient *)&v29 init];
  if (v14)
  {
    uint64_t v15 = [v6 copy];
    configuration = v14->_configuration;
    v14->_configuration = (HMXPCMessageTransportConfiguration *)v15;

    uint64_t v17 = [v10 copy];
    userInfo = v14->_userInfo;
    v14->_userInfo = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_UUID, v9);
    int v19 = NSString;
    uint32_t v20 = [(HMXPCMessageTransportConfiguration *)v14->_configuration machServiceName];
    uint64_t v21 = [v19 stringWithFormat:@"%@/%@", v20, v14->_UUID];
    logIdentifier = v14->_logIdentifier;
    v14->_logIdentifier = (NSString *)v21;

    v14->_notifyRegisterToken = -1;
    v14->_requiresCheckin = 1;
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    reconnectionHandlers = v14->_reconnectionHandlers;
    v14->_reconnectionHandlers = (NSMutableArray *)v23;
  }
  return v14;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNotifyRegisterToken:(int)a3
{
  self->_notifyRegisterToken = a3;
}

- (void)setHomeDataAuthorizationStatus:(unint64_t)a3
{
  self->_homeDataAuthorizationStatus = a3;
}

- (int)notifyRegisterToken
{
  return self->_notifyRegisterToken;
}

+ (id)remoteObjectInterface
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&remoteObjectInterface_remoteObjectInterface);
  if (!WeakRetained)
  {
    id WeakRetained = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF6FB18];
    unint64_t v4 = [MEMORY[0x1E4F65480] allowedClassesForXPC];
    [WeakRetained setClasses:v4 forSelector:sel_handleMessage_responseHandler_ argumentIndex:1 ofReply:1];

    objc_storeWeak(&remoteObjectInterface_remoteObjectInterface, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)exportedInterface
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&exportedInterface_exportedInterface);
  if (!WeakRetained)
  {
    id WeakRetained = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF58508];
    objc_storeWeak(&exportedInterface_exportedInterface, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

void __45__HMXPCClient_sendMessage_completionHandler___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  BOOL v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = [*(id *)(a1 + 40) shortDescription];
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response from XPC server for message: %@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __26__HMXPCClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v24;
  logCategory__hmf_once_uint64_t v24 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconnectionHandlers, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setConnection:(id)a3
{
}

void __45__HMXPCClient_sendMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    BOOL v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote object proxy for connecting to the daemon: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __45__HMXPCClient_sendMessage_completionHandler___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = [*(id *)(a1 + 40) shortDescription];
    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote object proxy for sending message %@: %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v3, 0);
  }
}

void __25__HMXPCClient_connection__block_invoke_73(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    unint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = (os_unfair_lock_s *)WeakRetained;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      int v10 = v7;
      __int16 v11 = 2048;
      id v12 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Connection to daemon was interrupted: %p", (uint8_t *)&v9, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    [(os_unfair_lock_s *)v5 setRequiresCheckin:1];
    os_unfair_lock_unlock(v5 + 4);
    int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"kHomeKitDaemonInterruptedNotification" object:0];
  }
}

void __25__HMXPCClient_connection__block_invoke_75(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    unint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = (os_unfair_lock_s *)WeakRetained;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v7;
      __int16 v16 = 2048;
      id v17 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Connection to daemon was invalidated: %p", (uint8_t *)&v14, 0x16u);
    }
    int v8 = v5 + 4;
    uint64_t v9 = os_unfair_lock_lock_with_options();
    if (v3 == *(id *)&v5[8]._os_unfair_lock_opaque)
    {
      int v10 = (void *)MEMORY[0x19F3A64A0](v9);
      __int16 v11 = v5;
      HMFGetOSLogHandle();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v14 = 138543618;
        id v15 = v13;
        __int16 v16 = 2048;
        id v17 = v3;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Resetting connection due to invalidation: %p", (uint8_t *)&v14, 0x16u);
      }
      [(os_unfair_lock_s *)v11 setConnection:0];
    }
    os_unfair_lock_unlock(v8);
  }
}

void __25__HMXPCClient_connection__block_invoke_76(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = WeakRetained;
    unint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = [v3 configuration];
      id v7 = [v6 serverStartNotification];
      *(_DWORD *)buf = 138543618;
      __int16 v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification that HomeKit daemon is ready: %@", buf, 0x16u);
    }
    int v8 = [v3 connection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__HMXPCClient_connection__block_invoke_77;
    v9[3] = &unk_1E59452E8;
    v9[4] = v3;
    [v8 scheduleSendBarrierBlock:v9];
  }
}

void __25__HMXPCClient_connection__block_invoke_77(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  unint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint32_t v20 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying reconnection handlers that HomeKit daemon is ready", buf, 0xCu);
  }
  id v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_lock_with_options();
  [*(id *)(a1 + 32) setRequiresCheckin:1];
  id v7 = [*(id *)(a1 + 32) reconnectionHandlers];
  int v8 = (void *)[v7 copy];

  os_unfair_lock_unlock(v6);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", (void)v14);
  [v13 postNotificationName:@"HMDaemonReconnectedNotification" object:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t notifyRegisterToken = self->_notifyRegisterToken;
  if (notifyRegisterToken != -1) {
    uint64_t notifyRegisterToken = notify_cancel(notifyRegisterToken);
  }
  unint64_t v4 = (void *)MEMORY[0x19F3A64A0](notifyRegisterToken);
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to invalidate the XPC connection with HomeKitDaemon.", buf, 0xCu);
  }
  [(NSXPCConnection *)v5->_connection invalidate];
  v8.receiver = v5;
  v8.super_class = (Class)HMXPCClient;
  [(HMXPCClient *)&v8 dealloc];
}

@end