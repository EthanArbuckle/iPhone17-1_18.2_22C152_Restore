@interface HMDSoftwareUpdateManager
+ (BOOL)isSupported;
- (HMDAppleMediaAccessory)accessory;
- (HMDSoftwareUpdateManager)init;
- (NSHashTable)activeClients;
- (NSUUID)identifier;
- (OS_dispatch_queue)clientQueue;
- (id)messageDestination;
- (id)messageDispatcher;
- (void)_handleStart:(id)a3;
- (void)_handleStop:(id)a3;
- (void)registerForMessages;
- (void)setAccessory:(id)a3;
- (void)startUpdate:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDSoftwareUpdateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeClients, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (NSHashTable)activeClients
{
  return self->_activeClients;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAppleMediaAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAppleMediaAccessory *)WeakRetained;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  v4 = [(HMDSoftwareUpdateManager *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)startUpdate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDSoftwareUpdateManager *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke(id *a1)
{
  v29[1] = *MEMORY[0x263EF8340];
  v2 = [a1[4] activeClients];
  id v3 = [v2 anyObject];

  if (v3)
  {
    uint64_t v28 = *MEMORY[0x263F0DA78];
    v4 = encodeRootObjectForIncomingXPCMessage(a1[5], 0);
    v29[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

    id v6 = [MEMORY[0x263F42590] entitledMessageWithName:*MEMORY[0x263F0DA60] messagePayload:v5];
    id v7 = (void *)[v6 mutableCopy];

    v8 = [a1[4] messageDestination];
    [v7 setDestination:v8];

    [v7 setTransport:v3];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_14;
    v22[3] = &unk_264A2C400;
    p_long long buf = &buf;
    id v23 = a1[6];
    [v7 setResponseHandler:v22];
    id v9 = [a1[4] messageDispatcher];
    id v10 = (void *)[v7 copy];
    [v9 sendMessage:v10 completionHandler:0];

    dispatch_time_t v11 = dispatch_time(0, 30000000000);
    id v12 = [a1[4] clientQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_2;
    v18[3] = &unk_264A2C428;
    v21 = &buf;
    v18[4] = a1[4];
    id v19 = v7;
    id v20 = a1[6];
    id v13 = v7;
    dispatch_after(v11, v12, v18);

    _Block_object_dispose(&buf, 8);
LABEL_7:

    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = a1[4];
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot handle start update, no active clients", (uint8_t *)&buf, 0xCu);
  }
  if (a1[6])
  {
    v5 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_7;
  }
LABEL_8:
}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v6 + 24) && *(void *)(a1 + 32))
  {
    id v7 = v10;
    v8 = v7;
    if (v7 && ([v7 isHMError] & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:23 description:0 reason:0 suggestion:0 underlyingError:v8];

      v8 = (void *)v9;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v6 + 24) = 1;
}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Client failed to respond to message: %@", (uint8_t *)&v8, 0x16u);
    }
    if (*(void *)(a1 + 48))
    {
      id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (void)_handleStop:(id)a3
{
  id v8 = a3;
  v4 = [v8 transport];
  if (v4)
  {
    id v5 = [(HMDSoftwareUpdateManager *)self activeClients];
    [v5 removeObject:v4];
  }
  uint64_t v6 = [v8 responseHandler];

  if (v6)
  {
    id v7 = [v8 responseHandler];
    v7[2](v7, 0, 0);
  }
}

- (void)_handleStart:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 transport];
  if (v5)
  {
    uint64_t v6 = [(HMDSoftwareUpdateManager *)self activeClients];
    [v6 addObject:v5];
  }
  id v7 = [v4 responseHandler];

  if (v7)
  {
    id v8 = [(HMDSoftwareUpdateManager *)self accessory];
    uint64_t v9 = [v8 softwareUpdate];

    if (v9)
    {
      uint64_t v13 = *MEMORY[0x263F0DA78];
      __int16 v10 = encodeRootObjectForIncomingXPCMessage(v9, 0);
      v14[0] = v10;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [v4 responseHandler];
    ((void (**)(void, void, void *))v12)[2](v12, 0, v11);
  }
}

- (void)registerForMessages
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(HMDSoftwareUpdateManager *)self messageDispatcher];
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  uint64_t v5 = *MEMORY[0x263F0DA58];
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v3 registerForMessage:v5 receiver:self policies:v6 selector:sel__handleStart_];

  uint64_t v7 = *MEMORY[0x263F0DA68];
  uint64_t v9 = v4;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v3 registerForMessage:v7 receiver:self policies:v8 selector:sel__handleStop_];
}

- (id)messageDispatcher
{
  return +[HMDMessageDispatcher defaultDispatcher];
}

- (HMDSoftwareUpdateManager)init
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (+[HMDSoftwareUpdateManager isSupported])
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDSoftwareUpdateManager;
    id v3 = [(HMDSoftwareUpdateManager *)&v19 init];
    if (v3)
    {
      HMDispatchQueueNameString();
      id v4 = objc_claimAutoreleasedReturnValue();
      uint64_t v5 = (const char *)[v4 UTF8String];
      uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
      clientQueue = v3->_clientQueue;
      v3->_clientQueue = (OS_dispatch_queue *)v7;

      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v10 = [v9 initWithUUIDString:*MEMORY[0x263F0DA70]];
      identifier = v3->_identifier;
      v3->_identifier = (NSUUID *)v10;

      uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      activeClients = v3->_activeClients;
      v3->_activeClients = (NSHashTable *)v12;

      [(HMDSoftwareUpdateManager *)v3 registerForMessages];
    }
    self = v3;
    v14 = self;
  }
  else
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Software updates are not valid on this target", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isSupported
{
  v2 = [MEMORY[0x263F42620] productInfo];
  BOOL v3 = [v2 productClass] == 6;

  return v3;
}

@end