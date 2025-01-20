@interface HMDRemoteMessageForwarder
+ (id)logCategory;
+ (id)remoteMessageForwarderUUIDFromUUID:(id)a3;
- (HMDHome)home;
- (HMDRemoteMessageForwarder)initWithHome:(id)a3 UUID:(id)a4 workQueue:(id)a5;
- (HMFMessageDispatcher)messageDispatcher;
- (NSMutableDictionary)messagesByIdentifier;
- (NSUUID)UUID;
- (NSUUID)contextUUID;
- (OS_dispatch_queue)workQueue;
- (id)messageForForwardedMessage:(id)a3;
- (void)configureWithMessageDispatcher:(id)a3;
- (void)handleResponseMessage:(id)a3;
- (void)redispatchToResidentMessage:(id)a3;
@end

@implementation HMDRemoteMessageForwarder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesByIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (NSMutableDictionary)messagesByIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)contextUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)handleResponseMessage:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDRemoteMessageForwarder *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [v4 respondWithSuccess];
  v6 = [v4 dictionaryForKey:@"HMDRemoteMessageForwarderPayloadKey"];
  v37[0] = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  v8 = [v4 unarchivedObjectForKey:@"HMDRemoteMessageForwarderErrorKey" ofClasses:v7];

  id v9 = objc_alloc(MEMORY[0x263F08C38]);
  v10 = [v4 stringForKey:@"HMDRemoteMessageForwarderOriginalMessageUUIDStringKey"];
  v11 = (void *)[v9 initWithUUIDString:v10];

  v12 = (void *)MEMORY[0x230FBD990]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = HMFGetLogIdentifier();
    v16 = [v4 name];
    v17 = [v4 identifier];
    *(_DWORD *)buf = 138544130;
    v30 = v15;
    __int16 v31 = 2112;
    v32 = v16;
    __int16 v33 = 2112;
    v34 = v17;
    __int16 v35 = 2112;
    v36 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling response message with name: %@, identifier: %@, originalMessageIdentifier: %@", buf, 0x2Au);
  }
  v18 = [(HMDRemoteMessageForwarder *)v13 messagesByIdentifier];
  v19 = [v18 objectForKeyedSubscript:v11];

  if (v19)
  {
    [v19 respondWithPayload:v6 error:v8];
    v20 = [(HMDRemoteMessageForwarder *)v13 messagesByIdentifier];
    v21 = [v4 identifier];
    [v20 setObject:0 forKeyedSubscript:v21];
  }
  else
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = v13;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      v26 = [v4 name];
      [v4 identifier];
      v27 = v28 = v22;
      *(_DWORD *)buf = 138543874;
      v30 = v25;
      __int16 v31 = 2112;
      v32 = v26;
      __int16 v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Did not find a cached message for message response with name: %@, identifier: %@", buf, 0x20u);

      v22 = v28;
    }
  }
}

- (id)messageForForwardedMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDRemoteMessageForwarder *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    v10 = [v4 name];
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    __int16 v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Determining message for message with name: %@", buf, 0x16u);
  }
  v11 = [v4 stringForKey:@"HMDRemoteMessageForwarderOriginalMessageUUIDStringKey"];
  if ([v4 isRemote] && v11)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v11];
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = v7;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      __int16 v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Message with original message identifier: %@, is remote, returning a copy and responding to the original.", buf, 0x16u);
    }
    v17 = (void *)[v4 mutableCopy];
    [v4 respondWithSuccess];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __56__HMDRemoteMessageForwarder_messageForForwardedMessage___block_invoke;
    v25[3] = &unk_264A2AEE8;
    id v26 = v12;
    v27 = v14;
    id v28 = v4;
    id v18 = v4;
    id v19 = v12;
    [v17 setResponseHandler:v25];

    id v4 = v17;
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v7;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Message was not forwarded, returning as is.", buf, 0xCu);
    }
  }

  return v4;
}

void __56__HMDRemoteMessageForwarder_messageForForwardedMessage___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setObject:v6 forKeyedSubscript:@"HMDRemoteMessageForwarderPayloadKey"];
  if (v5)
  {
    v8 = encodeRootObjectForIncomingXPCMessage(v5, 0);
    [v7 setObject:v8 forKeyedSubscript:@"HMDRemoteMessageForwarderErrorKey"];
  }
  else
  {
    [v7 setObject:0 forKeyedSubscript:@"HMDRemoteMessageForwarderErrorKey"];
  }
  id v9 = [a1[4] UUIDString];
  [v7 setObject:v9 forKeyedSubscript:@"HMDRemoteMessageForwarderOriginalMessageUUIDStringKey"];

  v10 = [HMDRemoteMessage alloc];
  v11 = [HMDRemoteDeviceMessageDestination alloc];
  v12 = [a1[5] UUID];
  v13 = [a1[6] remoteSourceDevice];
  v14 = [(HMDRemoteDeviceMessageDestination *)v11 initWithTarget:v12 device:v13];
  v15 = [(HMDRemoteMessage *)v10 initWithName:@"HMDRemoteMessageForwarderResponseMessage" destination:v14 payload:v7 type:0 timeout:1 secure:0.0];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __56__HMDRemoteMessageForwarder_messageForForwardedMessage___block_invoke_2;
  v28[3] = &unk_264A2AEE8;
  id v16 = a1[6];
  v28[4] = a1[5];
  id v29 = v16;
  id v30 = a1[4];
  v17 = (void *)MEMORY[0x230FBD990]([(HMDRemoteMessage *)v15 setResponseHandler:v28]);
  id v18 = a1[5];
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = id v27 = v6;
    v21 = [a1[6] name];
    id v22 = v5;
    id v23 = a1[4];
    [(HMDRemoteMessage *)v15 identifier];
    v24 = id v26 = v17;
    *(_DWORD *)buf = 138544130;
    v32 = v20;
    __int16 v33 = 2112;
    v34 = v21;
    __int16 v35 = 2112;
    id v36 = v23;
    id v5 = v22;
    __int16 v37 = 2112;
    v38 = v24;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending response message for message with name: %@, originalMessageIdentifier: %@, responseMessageIdentifier: %@", buf, 0x2Au);

    v17 = v26;
    id v6 = v27;
  }

  v25 = [a1[5] messageDispatcher];
  [v25 sendMessage:v15];
}

void __56__HMDRemoteMessageForwarder_messageForForwardedMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [*(id *)(a1 + 40) name];
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = 138544130;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to send response message for message with name: %@, originalMessageIdentifier: %@, error: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (void)redispatchToResidentMessage:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDRemoteMessageForwarder *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    v10 = [v4 name];
    v11 = [v4 identifier];
    *(_DWORD *)buf = 138543874;
    v34 = v9;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    v38 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Redispatching to resident message with name: %@, identifier: %@", buf, 0x20u);
  }
  uint64_t v12 = [(HMDRemoteMessageForwarder *)v7 home];
  if (v12)
  {
    int v13 = (void *)[v4 mutableCopy];
    v14 = [v4 messagePayload];
    __int16 v15 = (void *)[v14 mutableCopy];

    id v16 = [v4 identifier];
    __int16 v17 = [v16 UUIDString];
    [v15 setObject:v17 forKeyedSubscript:@"HMDRemoteMessageForwarderOriginalMessageUUIDStringKey"];

    [v13 setMessagePayload:v15];
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    id v29 = __57__HMDRemoteMessageForwarder_redispatchToResidentMessage___block_invoke;
    id v30 = &unk_264A2D870;
    __int16 v31 = v7;
    id v18 = v4;
    id v32 = v18;
    [v13 setResponseHandler:&v27];
    __int16 v19 = [(HMDRemoteMessageForwarder *)v7 messagesByIdentifier];
    id v20 = [v18 identifier];
    [v19 setObject:v18 forKeyedSubscript:v20];

    uint64_t v21 = [(HMDRemoteMessageForwarder *)v7 contextUUID];
    id v22 = [(HMDRemoteMessageForwarder *)v7 workQueue];
    [v12 redispatchToResidentMessage:v13 target:v21 responseQueue:v22];
  }
  else
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    v24 = v7;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home property is nil on HMDRemoteMessageForwarder", buf, 0xCu);
    }
  }
}

void __57__HMDRemoteMessageForwarder_redispatchToResidentMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v14 = 138543874;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to forward message to resident: %@ with error: %@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v12 = [*(id *)(a1 + 32) messagesByIdentifier];
    int v13 = [*(id *)(a1 + 40) identifier];
    [v12 setObject:0 forKeyedSubscript:v13];

    [*(id *)(a1 + 40) respondWithError:v5];
  }
}

- (void)configureWithMessageDispatcher:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HMDRemoteMessageForwarder *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    uint64_t v11 = [(HMDRemoteMessageForwarder *)v8 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring HMDRemoteMessageForwarder with UUID: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&v8->_messageDispatcher, a3);
  if (!v5)
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = v8;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Message dispatcher property is nil on HMDRemoteMessageForwarder", buf, 0xCu);
    }
  }
  __int16 v16 = [(HMDRemoteMessageForwarder *)v8 home];
  if (v16)
  {
    uint64_t v17 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    __int16 v18 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v16 userPrivilege:0 remoteAccessRequired:0];
    v25[0] = v17;
    v25[1] = v18;
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    uint64_t v20 = [(HMDRemoteMessageForwarder *)v8 messageDispatcher];
    [v20 registerForMessage:@"HMDRemoteMessageForwarderResponseMessage" receiver:v8 policies:v19 selector:sel_handleResponseMessage_];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = v8;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Home property is nil on HMDRemoteMessageForwarder", buf, 0xCu);
    }
  }
}

- (HMDRemoteMessageForwarder)initWithHome:(id)a3 UUID:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDRemoteMessageForwarder;
  uint64_t v11 = [(HMDRemoteMessageForwarder *)&v18 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_home, v8);
    objc_storeStrong((id *)&v12->_contextUUID, a4);
    uint64_t v13 = +[HMDRemoteMessageForwarder remoteMessageForwarderUUIDFromUUID:v9];
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_workQueue, a5);
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    messagesByIdentifier = v12->_messagesByIdentifier;
    v12->_messagesByIdentifier = (NSMutableDictionary *)v15;
  }
  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_112469 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_112469, &__block_literal_global_112470);
  }
  v2 = (void *)logCategory__hmf_once_v14_112471;
  return v2;
}

void __40__HMDRemoteMessageForwarder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v14_112471;
  logCategory__hmf_once_v14_112471 = v0;
}

+ (id)remoteMessageForwarderUUIDFromUUID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"CB9FD9B1-29D4-4CA4-97DF-22611DF4AFEC"];
  id v6 = (void *)MEMORY[0x263F08C38];
  v7 = [v4 UUIDString];

  id v8 = [v7 dataUsingEncoding:4];
  id v9 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);

  return v9;
}

@end