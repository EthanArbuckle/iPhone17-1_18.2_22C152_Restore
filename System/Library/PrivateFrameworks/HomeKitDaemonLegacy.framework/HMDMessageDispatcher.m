@interface HMDMessageDispatcher
+ (HMDMessageDispatcher)defaultDispatcher;
+ (id)destinationWithTarget:(id)a3 userID:(id)a4 destination:(id)a5 multicast:(BOOL)a6;
+ (id)destinationWithTarget:(id)a3 userID:(id)a4 destination:(id)a5 multicast:(BOOL)a6 accountRegistry:(id)a7;
+ (id)logCategory;
- (HMDHomeManager)homeManager;
- (HMDMessageDispatcher)initWithXPCTransport:(id)a3 secureRemoteTransport:(id)a4 messageFilterChain:(id)a5;
- (HMDMessageFilterChain)messageFilterChain;
- (HMDSecureRemoteMessageFilter)secureRemoteMessageFilter;
- (HMDSecureRemoteMessageTransport)secureRemoteTransport;
- (HMDXPCMessageTransport)XPCTransport;
- (NSCache)homeForTarget;
- (NSMutableDictionary)remoteGateways;
- (id)homeForMessageTarget:(id)a3;
- (id)httpMessageTransport;
- (id)messageHandlerWithReceiver:(id)a3 name:(id)a4 policies:(id)a5 selector:(SEL)a6;
- (id)remoteAccessDeviceForHome:(id)a3;
- (id)residentCommunicationHandlerForHome:(id)a3;
- (id)sendMessageExpectingResponse:(id)a3;
- (void)_setRemoteAccessDevice:(id)a3 forHome:(id)a4 sendNotification:(BOOL)a5;
- (void)configureHTTPTransport:(id)a3;
- (void)configureHomeManager:(id)a3;
- (void)dealloc;
- (void)disableMessageServer;
- (void)dispatchMessage:(id)a3;
- (void)electDeviceForHH1User:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 responseHandler:(id)a8;
- (void)enableMessageServer;
- (void)handleSecureSessionError:(id)a3;
- (void)reset;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendSecureMessage:(id)a3 target:(id)a4 userID:(id)a5 destination:(id)a6 responseQueue:(id)a7 responseHandler:(id)a8;
- (void)setCompanionDevice:(id)a3 forHome:(id)a4;
- (void)setHomeForTarget:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setRemoteAccessDevice:(id)a3 forHome:(id)a4;
- (void)setRemoteGateways:(id)a3;
@end

@implementation HMDMessageDispatcher

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_77760 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_77760, &__block_literal_global_77761);
  }
  v2 = (void *)logCategory__hmf_once_v10_77762;
  return v2;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v6)
  {
    v8 = [v6 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      id v16 = v6;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v18 = [(HMDMessageDispatcher *)self XPCTransport];
        v15 = v18;
        id v19 = v16;
        goto LABEL_11;
      }
    }
    v18 = [(HMDMessageDispatcher *)self secureRemoteTransport];
    v15 = v18;
    id v19 = v6;
LABEL_11:
    [v18 sendMessage:v19 completionHandler:v7];
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = @"Requested to send nil message";
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: %@", buf, 0x16u);
  }
  v13 = [[HMDAssertionLogEvent alloc] initWithReason:@"%@", @"Requested to send nil message"];
  v14 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v14 submitLogEvent:v13];

  v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8 reason:@"Requested to send nil message"];
  if (v7) {
    v7[2](v7, v15);
  }
LABEL_12:
}

- (HMDXPCMessageTransport)XPCTransport
{
  return self->_XPCTransport;
}

- (void)dispatchMessage:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMessageDispatcher *)self messageFilterChain];
  id v29 = 0;
  char v6 = [v5 acceptMessage:v4 error:&v29];
  id v7 = v29;

  v8 = [v4 responseHandler];
  v9 = v8;
  if (v6)
  {
    if (v8)
    {
      v10 = [v4 name];
      v11 = [v4 identifier];
      char v12 = [v4 isRemote];
      id v13 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
      id v15 = v14;

      char v16 = [v15 isSecure];
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x2810000000;
      v27[3] = &unk_1D5667A7F;
      char v28 = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __40__HMDMessageDispatcher_dispatchMessage___block_invoke;
      v20[3] = &unk_1E6A0D168;
      uint64_t v24 = v27;
      v20[4] = self;
      id v17 = v10;
      id v21 = v17;
      id v18 = v11;
      id v22 = v18;
      char v25 = v12;
      char v26 = v16;
      v23 = v9;
      [v13 setResponseHandler:v20];

      _Block_object_dispose(v27, 8);
    }
    v19.receiver = self;
    v19.super_class = (Class)HMDMessageDispatcher;
    [(HMFMessageDispatcher *)&v19 dispatchMessage:v4];
    goto LABEL_10;
  }

  if (v9)
  {
    v9 = [v4 responseHandler];
    ((void (**)(void, id, void))v9)[2](v9, v7, 0);
LABEL_10:
  }
}

- (HMDMessageFilterChain)messageFilterChain
{
  return self->_messageFilterChain;
}

void __40__HMDMessageDispatcher_dispatchMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 32), 1u) & 1) == 0)
  {
    id v7 = v5;
    v8 = v7;
    if (!v7) {
      goto LABEL_15;
    }
    v9 = [v7 domain];
    if ([v9 isEqualToString:*MEMORY[0x1E4F64ED0]])
    {
      uint64_t v10 = [v8 code];

      if (v10 != 14) {
        goto LABEL_15;
      }
      if (*(unsigned char *)(a1 + 72))
      {
        if (!*(unsigned char *)(a1 + 73))
        {
          v11 = (void *)MEMORY[0x1D9452090]();
          id v12 = *(id *)(a1 + 32);
          id v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = HMFGetLogIdentifier();
            uint64_t v15 = *(void *)(a1 + 40);
            uint64_t v16 = *(void *)(a1 + 48);
            int v26 = 138543874;
            v27 = v14;
            __int16 v28 = 2112;
            uint64_t v29 = v15;
            __int16 v30 = 2112;
            uint64_t v31 = v16;
            _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping unhandled remote message as it is not secure: %@ (%@)", (uint8_t *)&v26, 0x20u);
          }
          goto LABEL_16;
        }
LABEL_15:
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_16:

        goto LABEL_17;
      }
      v23 = (void *)MEMORY[0x1E4F28C58];
      v9 = [v8 domain];
      uint64_t v24 = [v8 userInfo];
      uint64_t v25 = [v23 errorWithDomain:v9 code:2 userInfo:v24];

      v8 = (void *)v25;
    }

    goto LABEL_15;
  }
  id v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = *(id *)(a1 + 32);
  objc_super v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    int v26 = 138543874;
    v27 = v20;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    __int16 v30 = 2112;
    uint64_t v31 = v22;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Multiple invocations of response handler for message: %@ (%@)", (uint8_t *)&v26, 0x20u);
  }
LABEL_17:
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_homeForTarget, 0);
  objc_storeStrong((id *)&self->_secureRemoteMessageFilter, 0);
  objc_storeStrong((id *)&self->_remoteGateways, 0);
  objc_storeStrong((id *)&self->_messageFilterChain, 0);
  objc_storeStrong((id *)&self->_secureRemoteTransport, 0);
  objc_storeStrong((id *)&self->_XPCTransport, 0);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setHomeForTarget:(id)a3
{
}

- (NSCache)homeForTarget
{
  return self->_homeForTarget;
}

- (HMDSecureRemoteMessageFilter)secureRemoteMessageFilter
{
  return self->_secureRemoteMessageFilter;
}

- (void)setRemoteGateways:(id)a3
{
}

- (NSMutableDictionary)remoteGateways
{
  return self->_remoteGateways;
}

- (HMDSecureRemoteMessageTransport)secureRemoteTransport
{
  return self->_secureRemoteTransport;
}

- (id)sendMessageExpectingResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 responseHandler];

    if (v7)
    {
      uint64_t v10 = _HMFPreconditionFailure();
      return (id)__53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke(v10, v11);
    }
    id v16 = 0;
    v8 = [MEMORY[0x1E4F65438] futureWithPromise:&v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke;
    v14[3] = &unk_1E6A18C18;
    id v15 = v16;
    [v6 setResponseHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke_2;
    v12[3] = &unk_1E6A197F0;
    id v13 = v16;
    [(HMDMessageDispatcher *)self sendMessage:v6 completionHandler:v12];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDMessageDispatcher;
    v8 = [(HMFMessageDispatcher *)&v17 sendMessageExpectingResponse:v4];
  }

  return v8;
}

uint64_t __53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 rejectWithError:a2];
  }
  else {
    return objc_msgSend(v2, "fulfillWithValue:");
  }
}

uint64_t __53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) rejectWithError:a2];
  }
  return result;
}

- (id)messageHandlerWithReceiver:(id)a3 name:(id)a4 policies:(id)a5 selector:(SEL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [MEMORY[0x1E4F65498] policyOfClass:objc_opt_class() fromPolicies:v12];

  if (v13)
  {
    v14 = [v10 messageTargetUUID];
    id v15 = [(HMDMessageDispatcher *)self homeForMessageTarget:v14];

    id v16 = [v15 administratorHandler];
    objc_super v17 = [v16 wrapReceiver:v10];

    if (v17)
    {
      if (([v17 conformsToProtocol:&unk_1F2EB1A10] & 1) == 0)
      {
        uint64_t v21 = (HMDMessageDispatcher *)_HMFPreconditionFailure();
        [(HMDMessageDispatcher *)v21 configureHTTPTransport:v23];
        return result;
      }
      id v18 = v17;

      a6 = sel_handleAdministratorMessage_;
      id v10 = v18;
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDMessageDispatcher;
  objc_super v19 = [(HMFMessageDispatcher *)&v24 messageHandlerWithReceiver:v10 name:v11 policies:v12 selector:a6];

  return v19;
}

- (void)configureHTTPTransport:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessageDispatcher *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMDMessageDispatcher_configureHTTPTransport___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__HMDMessageDispatcher_configureHTTPTransport___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) httpMessageTransport];
  [v2 configureWithDevice:*(void *)(a1 + 40)];
}

- (void)disableMessageServer
{
  id v2 = [(HMDMessageDispatcher *)self httpMessageTransport];
  [v2 setServerEnabled:0];
}

- (void)enableMessageServer
{
  id v2 = [(HMDMessageDispatcher *)self httpMessageTransport];
  [v2 setServerEnabled:1];
}

- (id)httpMessageTransport
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(HMDMessageDispatcher *)self secureRemoteTransport];
  v3 = [v2 transports];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)configureHomeManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMFMessageDispatcher *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HMDMessageDispatcher_configureHomeManager___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__HMDMessageDispatcher_configureHomeManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHomeManager:*(void *)(a1 + 40)];
}

- (id)homeForMessageTarget:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSCache *)self->_homeForTarget objectForKey:v4];
  if (!v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(HMDMessageDispatcher *)self homeManager];
    id v7 = [v6 homes];

    id v5 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v8 = 0;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        long long v10 = 0;
        long long v11 = v8;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          id v8 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v10);

          long long v12 = [v8 resolveReceiverForMessageTargetUUID:v4];

          if (v12)
          {
            if (self) {
              [(NSCache *)self->_homeForTarget setObject:v8 forKey:v4];
            }
            id v5 = v8;
            id v8 = v7;
            id v7 = v5;
            goto LABEL_14;
          }
          long long v10 = (char *)v10 + 1;
          long long v11 = v8;
        }
        while (v5 != v10);
        id v5 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
LABEL_14:
    }
  }

  return v5;
}

- (void)reset
{
  id v2 = [(HMDMessageDispatcher *)self secureRemoteTransport];
  [v2 reset];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDMessageDispatcher;
  [(HMDMessageDispatcher *)&v4 dealloc];
}

- (HMDMessageDispatcher)initWithXPCTransport:(id)a3 secureRemoteTransport:(id)a4 messageFilterChain:(id)a5
{
  v30[7] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HMDMessageDispatcher;
  long long v12 = [(HMFMessageDispatcher *)&v29 initWithTransport:0];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_XPCTransport, a3);
    [(HMFMessageTransport *)v13->_XPCTransport setDelegate:v13];
    objc_storeStrong((id *)&v13->_secureRemoteTransport, a4);
    [(HMFMessageTransport *)v13->_secureRemoteTransport setDelegate:v13];
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    remoteGateways = v13->_remoteGateways;
    v13->_remoteGateways = (NSMutableDictionary *)v14;

    objc_storeStrong((id *)&v13->_messageFilterChain, a5);
    long long v16 = [(HMDMessageFilter *)[HMDSecureRemoteMessageFilter alloc] initWithName:@"SecureRemote"];
    secureRemoteMessageFilter = v13->_secureRemoteMessageFilter;
    v13->_secureRemoteMessageFilter = v16;

    [(HMDMessageFilterChain *)v13->_messageFilterChain addMessageFilter:v13->_secureRemoteMessageFilter];
    v28.receiver = v13;
    v28.super_class = (Class)HMDMessageDispatcher;
    id v18 = [(HMFMessageDispatcher *)&v28 filterClasses];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    v30[4] = objc_opt_class();
    v30[5] = objc_opt_class();
    v30[6] = objc_opt_class();
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:7];
    v20 = [v18 setByAddingObjectsFromArray:v19];
    [(HMFMessageDispatcher *)v13 setFilterClasses:v20];

    uint64_t v21 = objc_opt_new();
    homeForTarget = v13->_homeForTarget;
    v13->_homeForTarget = (NSCache *)v21;

    id v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v13 selector:sel_handleSecureSessionError_ name:@"HMDSecureRemoteSessionErrorNotification" object:0];

    objc_initWeak(&location, v13);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__HMDMessageDispatcher_initWithXPCTransport_secureRemoteTransport_messageFilterChain___block_invoke;
    v25[3] = &unk_1E6A0D140;
    objc_copyWeak(&v26, &location);
    [(HMFMessageDispatcher *)v13 setResolveHook:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v13;
}

id __86__HMDMessageDispatcher_initWithXPCTransport_secureRemoteTransport_messageFilterChain___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(WeakRetained, "homeManager", 0);
  id v6 = [v5 homes];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 resolveReceiverForMessageTargetUUID:v3];
        if (v12)
        {
          id v13 = (void *)v12;
          if (WeakRetained) {
            [WeakRetained[14] setObject:v11 forKey:v3];
          }
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_12:

  return v13;
}

uint64_t __35__HMDMessageDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v10_77762;
  logCategory__hmf_once_v10_77762 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDMessageDispatcher)defaultDispatcher
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HMDMessageDispatcher_defaultDispatcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultDispatcher_onceToken != -1) {
    dispatch_once(&defaultDispatcher_onceToken, block);
  }
  id v2 = (void *)defaultDispatcher_defaultDispatcher;
  return (HMDMessageDispatcher *)v2;
}

void __41__HMDMessageDispatcher_defaultDispatcher__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [HMDMessageDispatcher alloc];
  id v3 = +[HMDXPCMessageTransport defaultTransport];
  objc_super v4 = +[HMDSecureRemoteMessageTransport defaultTransport];
  id v5 = objc_alloc_init(HMDMessageFilterChain);
  uint64_t v6 = [(HMDMessageDispatcher *)v2 initWithXPCTransport:v3 secureRemoteTransport:v4 messageFilterChain:v5];
  uint64_t v7 = (void *)defaultDispatcher_defaultDispatcher;
  defaultDispatcher_defaultDispatcher = v6;

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating default message dispatcher", (uint8_t *)&v12, 0xCu);
  }
}

+ (id)destinationWithTarget:(id)a3 userID:(id)a4 destination:(id)a5 multicast:(BOOL)a6 accountRegistry:(id)a7
{
  BOOL v8 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v14)
  {
    uint64_t v16 = +[HMDDeviceHandle deviceHandleForDestination:v14];
    if (v16)
    {
      long long v17 = (void *)v16;
      long long v18 = [v15 deviceForHandle:v16];
      uint64_t v19 = [[HMDRemoteDeviceMessageDestination alloc] initWithTarget:v12 device:v18];

LABEL_7:
      goto LABEL_11;
    }
  }
  if (v13)
  {
    uint64_t v20 = +[HMDAccountHandle accountHandleForDestination:v13];
    if (v20)
    {
      long long v17 = (void *)v20;
      uint64_t v19 = [[HMDRemoteAccountMessageDestination alloc] initWithTarget:v12 handle:v20 multicast:v8];
      goto LABEL_7;
    }
  }
  uint64_t v21 = (void *)MEMORY[0x1D9452090]();
  id v22 = a1;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v24 = HMFGetLogIdentifier();
    int v26 = 138543874;
    v27 = v24;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    id v31 = v14;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Could not create message destination with userID: %@ and destination: %@", (uint8_t *)&v26, 0x20u);
  }
  uint64_t v19 = 0;
LABEL_11:

  return v19;
}

+ (id)destinationWithTarget:(id)a3 userID:(id)a4 destination:(id)a5 multicast:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_opt_class();
  id v13 = +[HMDAccountRegistry sharedRegistry];
  id v14 = [v12 destinationWithTarget:v11 userID:v10 destination:v9 multicast:v6 accountRegistry:v13];

  return v14;
}

- (void)electDeviceForHH1User:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 responseHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(HMDMessageDispatcher *)self secureRemoteTransport];
  [v19 electDeviceForHH1User:v18 destination:v17 deviceCapabilities:v16 responseTimeout:v15 responseQueue:v14 responseHandler:a6];
}

- (void)sendSecureMessage:(id)a3 target:(id)a4 userID:(id)a5 destination:(id)a6 responseQueue:(id)a7 responseHandler:(id)a8
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v59 = a4;
  id v61 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = [v13 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_4:
    uint64_t v20 = [v13 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = v21;

    if (v22)
    {
      id v23 = [v22 remoteDestinationString];
      char v24 = [v23 isEqualToString:v14];

      if ((v24 & 1) == 0)
      {
        v39 = (void *)MEMORY[0x1D9452090]();
        v40 = self;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        {
          v42 = HMFGetLogIdentifier();
          [v13 shortDescription];
          *(_DWORD *)buf = 138543618;
          v66 = v42;
          v68 = __int16 v67 = 2112;
          v57 = v39;
          v43 = (void *)v68;
          _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Mismatched device message destination: %@", buf, 0x16u);

          v39 = v57;
        }

        v44 = [HMDAssertionLogEvent alloc];
        v45 = [v13 shortDescription];
        v46 = [(HMDAssertionLogEvent *)v44 initWithReason:@"Mismatched device message destination: %@", v45];

        v47 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v47 submitLogEvent:v46];
      }
    }
    uint64_t v25 = v14;

    int v26 = [v13 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    if (v28)
    {
      id v29 = +[HMDAccountHandleFormatter defaultFormatter];
      __int16 v30 = [v28 remoteDestinationString];
      id v31 = [v29 stringForObjectValue:v30];
      uint64_t v32 = [v29 stringForObjectValue:v61];
      char v33 = [v31 isEqualToString:v32];

      if ((v33 & 1) == 0)
      {
        v48 = (void *)MEMORY[0x1D9452090]();
        v49 = self;
        v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v51 = v58 = v49;
          v52 = [v13 shortDescription];
          *(_DWORD *)buf = 138543618;
          v66 = v51;
          __int16 v67 = 2112;
          uint64_t v68 = (uint64_t)v52;
          _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Mismatched account message destination: %@", buf, 0x16u);

          v49 = v58;
        }

        v53 = [HMDAssertionLogEvent alloc];
        v54 = [v13 shortDescription];
        v55 = [(HMDAssertionLogEvent *)v53 initWithReason:@"Mismatched account message destination: %@", v54];

        v56 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v56 submitLogEvent:v55];
      }
    }

    v34 = v59;
    goto LABEL_19;
  }
  id v18 = [v13 destination];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
  v34 = v59;
  uint64_t v25 = v14;
  v35 = +[HMDMessageDispatcher destinationWithTarget:v59 userID:v61 destination:v14 multicast:0];
  if (v35) {
    [v13 setDestination:v35];
  }

LABEL_19:
  v36 = [(HMDMessageDispatcher *)self homeManager];
  v37 = [v36 accountRegistry];
  v38 = +[HMDRemoteMessageTransport remoteMessageFromMessage:v13 secure:1 accountRegistry:v37];

  if (v15 && v16)
  {
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __110__HMDMessageDispatcher_Deprecated__sendSecureMessage_target_userID_destination_responseQueue_responseHandler___block_invoke;
    v62[3] = &unk_1E6A16B58;
    id v63 = v15;
    id v64 = v16;
    [v38 setResponseHandler:v62];
  }
  [(HMDMessageDispatcher *)self sendMessage:v38 completionHandler:0];
}

void __110__HMDMessageDispatcher_Deprecated__sendSecureMessage_target_userID_destination_responseQueue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__HMDMessageDispatcher_Deprecated__sendSecureMessage_target_userID_destination_responseQueue_responseHandler___block_invoke_2;
  block[3] = &unk_1E6A193D0;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __110__HMDMessageDispatcher_Deprecated__sendSecureMessage_target_userID_destination_responseQueue_responseHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)remoteAccessDeviceForHome:(id)a3
{
  id v3 = [(HMDMessageDispatcher *)self residentCommunicationHandlerForHome:a3];
  objc_super v4 = [v3 preferredDevice];

  return v4;
}

- (id)residentCommunicationHandlerForHome:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__77828;
  id v16 = __Block_byref_object_dispose__77829;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(HMFMessageDispatcher *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMDMessageDispatcher_Deprecated__residentCommunicationHandlerForHome___block_invoke;
    block[3] = &unk_1E6A19A00;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __72__HMDMessageDispatcher_Deprecated__residentCommunicationHandlerForHome___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) remoteGateways];
  id v2 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_setRemoteAccessDevice:(id)a3 forHome:(id)a4 sendNotification:(BOOL)a5
{
  BOOL v5 = a5;
  v77[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = [(HMDMessageDispatcher *)self remoteGateways];
    id v11 = [v9 uuid];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];

    id v13 = [(HMDResidentCommunicationHandler *)v12 deviceForType:2];
    if ([v13 isEqual:v8])
    {
LABEL_47:
      id v63 = [(HMDResidentCommunicationHandler *)v12 preferredDevice];
      [v9 remoteAccessEnabled:v63 != 0];

      goto LABEL_48;
    }
    uint64_t v14 = [v9 residentDeviceManager];
    int v15 = [v14 isResidentAvailable];

    if (!v15)
    {
      char v24 = 0;
      char v29 = 1;
      if (v8 && v13)
      {
        __int16 v30 = (void *)MEMORY[0x1D9452090]();
        id v31 = self;
        uint64_t v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          char v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v71 = v33;
          __int16 v72 = 2112;
          id v73 = v9;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Ignoring setting a new peer since we already have an existing peer for home: %@", buf, 0x16u);
        }
        goto LABEL_47;
      }
      goto LABEL_31;
    }
    id v16 = [v9 primaryResident];
    id v17 = v16;
    if (v12
      && [v16 isReachable]
      && ([v17 device],
          id v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 isEqual:v13],
          v18,
          v19))
    {
      BOOL v65 = v5;
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      uint64_t v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v71 = v23;
        __int16 v72 = 2112;
        id v73 = v9;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Ignoring setting a new remote access device as the current resident is reachable for home: %@", buf, 0x16u);
      }
      char v24 = 1;
      BOOL v5 = v65;
    }
    else
    {
      char v24 = 0;
    }
    v34 = [MEMORY[0x1E4F65548] productInfo];
    if ([(HMDHomeKitVersion *)v34 productPlatform] == 3)
    {
      v35 = [v8 version];

      if (!v35)
      {
        char v29 = 1;
LABEL_30:

LABEL_31:
        if (v12 && (v24 & 1) == 0)
        {
          char contexta = v29;
          v40 = (void *)MEMORY[0x1D9452090]();
          v41 = self;
          v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v43 = BOOL v67 = v5;
            v44 = [v9 shortDescription];
            *(_DWORD *)buf = 138543618;
            v71 = v43;
            __int16 v72 = 2112;
            id v73 = v44;
            _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Disabling resident remote access for home: %@", buf, 0x16u);

            BOOL v5 = v67;
          }

          uint64_t v45 = [(HMDResidentCommunicationHandler *)v12 removeDeviceForType:2];
          char v29 = contexta;
          if (v5)
          {
            v46 = (void *)MEMORY[0x1D9452090](v45);
            v47 = v41;
            v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              v49 = HMFGetLogIdentifier();
              v50 = [v9 shortDescription];
              *(_DWORD *)buf = 138543618;
              v71 = v49;
              __int16 v72 = 2112;
              id v73 = v50;
              _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Sending notification that remote session was torn down for home: %@", buf, 0x16u);
            }
            v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v76 = @"kHomeUUID";
            v52 = [v9 uuid];
            v77[0] = v52;
            v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
            [v51 postNotificationName:@"HMDMessageDispatcherRemoteSessionTornDownNotification" object:v47 userInfo:v53];

            char v29 = contexta;
          }
        }
        char v54 = v29 ^ 1;
        if (!v8) {
          char v54 = 1;
        }
        if ((v54 & 1) == 0)
        {
          v55 = (void *)MEMORY[0x1D9452090]();
          v56 = self;
          v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            v58 = HMFGetLogIdentifier();
            id v59 = [v9 shortDescription];
            v60 = [v8 shortDescription];
            *(_DWORD *)buf = 138543874;
            v71 = v58;
            __int16 v72 = 2112;
            id v73 = v59;
            __int16 v74 = 2112;
            v75 = v60;
            _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@Enabling resident remote access for home %@ via device: %@", buf, 0x20u);
          }
          if (!v12)
          {
            uint64_t v12 = [[HMDResidentCommunicationHandler alloc] initWithHome:v9 remoteDispatcher:v56];
            id v61 = [(HMDMessageDispatcher *)v56 remoteGateways];
            v62 = [v9 uuid];
            [v61 setObject:v12 forKeyedSubscript:v62];
          }
          [(HMDResidentCommunicationHandler *)v12 setDevice:v8 forType:2];
        }
        goto LABEL_47;
      }
      BOOL v66 = v5;
      v34 = [[HMDHomeKitVersion alloc] initWithVersionString:@"4.0"];
      v36 = [v8 version];
      char v37 = [v36 isAtLeastVersion:v34];

      if (v37)
      {
        char v29 = 1;
      }
      else
      {
        context = (void *)MEMORY[0x1D9452090]();
        v38 = self;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v64 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v71 = v64;
          __int16 v72 = 2112;
          id v73 = v8;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Watch does not support the current resident: %@", buf, 0x16u);
        }
        char v29 = 0;
      }
      BOOL v5 = v66;
    }
    else
    {
      char v29 = 1;
    }

    goto LABEL_30;
  }
  uint64_t v25 = (void *)MEMORY[0x1D9452090]();
  int v26 = self;
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    id v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v71 = v28;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid home specified to setup/disable remote access", buf, 0xCu);
  }
LABEL_48:
}

- (void)setRemoteAccessDevice:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMFMessageDispatcher *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HMDMessageDispatcher_Deprecated__setRemoteAccessDevice_forHome___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __66__HMDMessageDispatcher_Deprecated__setRemoteAccessDevice_forHome___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setRemoteAccessDevice:*(void *)(a1 + 40) forHome:*(void *)(a1 + 48) sendNotification:0];
}

- (void)setCompanionDevice:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMFMessageDispatcher *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HMDMessageDispatcher_Deprecated__setCompanionDevice_forHome___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __63__HMDMessageDispatcher_Deprecated__setCompanionDevice_forHome___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] remoteGateways];
  uint64_t v3 = [a1[5] uuid];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = a1[6];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = a1[4];
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] shortDescription];
      id v12 = [a1[6] shortDescription];
      int v19 = 138543874;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2112;
      char v24 = v12;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Enabling companion remote access for home %@ via device: %@", (uint8_t *)&v19, 0x20u);
    }
    if (!v4)
    {
      uint64_t v4 = [[HMDResidentCommunicationHandler alloc] initWithHome:a1[5] remoteDispatcher:a1[4]];
      id v13 = [a1[4] remoteGateways];
      uint64_t v14 = [a1[5] uuid];
      [v13 setObject:v4 forKeyedSubscript:v14];
    }
  }
  else
  {
    if (v9)
    {
      int v15 = HMFGetLogIdentifier();
      id v16 = [a1[5] shortDescription];
      int v19 = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Disabling companion remote access for home: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  [(HMDResidentCommunicationHandler *)v4 setDevice:a1[6] forType:1];
  id v17 = a1[5];
  id v18 = [(HMDResidentCommunicationHandler *)v4 preferredDevice];
  [v17 remoteAccessEnabled:v18 != 0];
}

- (void)handleSecureSessionError:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessageDispatcher *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMDMessageDispatcher_Deprecated__handleSecureSessionError___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDMessageDispatcher_Deprecated__handleSecureSessionError___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  id v31 = v4;
  if (v4)
  {
    id v5 = [*(id *)(v1 + 40) remoteGateways];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)[v5 copy];
    uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    uint64_t v29 = v1;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v33;
      char v10 = 1;
      *(void *)&long long v7 = 138543874;
      long long v28 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, v28);
          if ([v13 containsDevice:v31])
          {
            uint64_t v14 = (void *)MEMORY[0x1D9452090]();
            int v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              id v16 = HMFGetLogIdentifier();
              id v17 = [v12 UUIDString];
              *(_DWORD *)buf = v28;
              char v37 = v16;
              __int16 v38 = 2112;
              v39 = v31;
              __int16 v40 = 2112;
              v41 = v17;
              _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Tearing down remote access session to device, %@, for home '%@'", buf, 0x20u);

              uint64_t v1 = v29;
            }

            id v18 = [*(id *)(v1 + 40) homeManager];
            int v19 = [v18 _homeWithUUID:v12];

            if (v19) {
              [*(id *)(v1 + 40) _setRemoteAccessDevice:0 forHome:v19 sendNotification:1];
            }

            char v10 = 0;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v8);
    }
    else
    {
      char v10 = 1;
    }

    uint64_t v20 = [*(id *)(v1 + 32) userInfo];
    __int16 v21 = objc_msgSend(v20, "hmf_errorForKey:", @"HMDSecureRemoteSessionErrorKey");

    if ((v10 & 1) == 0) {
      goto LABEL_27;
    }
    id v22 = [v21 domain];
    if ([v22 isEqualToString:*MEMORY[0x1E4F28760]])
    {
      uint64_t v23 = [v21 code];

      if (v23 != -6752)
      {
LABEL_27:

        goto LABEL_28;
      }
      char v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = *(id *)(v1 + 40);
      int v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        char v37 = v27;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Posting notification that remote session was torn down for an unknown home", buf, 0xCu);
      }
      id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v22 postNotificationName:@"HMDMessageDispatcherRemoteSessionTornDownNotification" object:*(void *)(v29 + 40) userInfo:0];
    }

    goto LABEL_27;
  }
LABEL_28:
}

@end