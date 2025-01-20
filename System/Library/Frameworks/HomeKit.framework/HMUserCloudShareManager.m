@interface HMUserCloudShareManager
+ (id)logCategory;
- (BOOL)isRegistered;
- (HMUserCloudShareManager)initWithDataSource:(id)a3;
- (HMUserCloudShareManager)initWithDataSource:(id)a3 context:(id)a4;
- (HMUserCloudShareManagerDataSource)dataSource;
- (HMUserCloudShareManagerDelegate)delegate;
- (NSArray)containerIDs;
- (NSUUID)identifier;
- (_HMContext)context;
- (id)messageDestination;
- (void)__registerForMessages;
- (void)_handleDidReceiveRepairRequest:(id)a3;
- (void)_handleDidReceiveShare:(id)a3;
- (void)_registerWithCompletion:(id)a3;
- (void)_unconfigure;
- (void)configure;
- (void)reconnect;
- (void)registerForContainerIDs:(id)a3 completion:(id)a4;
- (void)setContainerIDs:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRegistered:(BOOL)a3;
@end

@implementation HMUserCloudShareManager

void __36__HMUserCloudShareManager_configure__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 xpcClient];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __36__HMUserCloudShareManager_configure__block_invoke_2;
  v7 = &unk_1E59455B8;
  objc_copyWeak(&v8, &location);
  [v3 registerReconnectionHandler:&v4];

  objc_msgSend(*(id *)(a1 + 32), "__registerForMessages", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)__registerForMessages
{
  v3 = [(HMUserCloudShareManager *)self context];
  uint64_t v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"HMUCSM.rs" receiver:self selector:sel__handleDidReceiveShare_];

  id v6 = [(HMUserCloudShareManager *)self context];
  uint64_t v5 = [v6 messageDispatcher];
  [v5 registerForMessage:@"HMUCSM.rRep" receiver:self selector:sel__handleDidReceiveRepairRequest_];
}

- (_HMContext)context
{
  return self->_context;
}

- (HMUserCloudShareManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_HMContext alloc] initWithName:@"com.apple.HomeKit.UserCSManager"];
  id v6 = [(HMUserCloudShareManager *)self initWithDataSource:v4 context:v5];

  return v6;
}

- (HMUserCloudShareManager)initWithDataSource:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMUserCloudShareManager;
  id v8 = [(HMUserCloudShareManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_context, a4);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4BEBFE01-79E8-4433-8EAA-D41948E39F02"];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;
  }
  return v9;
}

- (void)configure
{
  v3 = [(HMUserCloudShareManager *)self context];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HMUserCloudShareManager_configure__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setContainerIDs:(id)a3
{
}

- (NSArray)containerIDs
{
  return self->_containerIDs;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)isRegistered
{
  return self->_registered;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMUserCloudShareManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HMUserCloudShareManagerDataSource *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMUserCloudShareManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMUserCloudShareManagerDelegate *)WeakRetained;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMUserCloudShareManager *)self messageTargetUUID];
  uint64_t v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)_registerWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMUserCloudShareManager *)self context];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F654B0];
    id v7 = [(HMUserCloudShareManager *)self messageDestination];
    v21 = @"containerIds";
    id v8 = [(HMUserCloudShareManager *)self containerIDs];
    v22 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v10 = [v6 messageWithName:@"HMUCSM.reg" destination:v7 payload:v9];

    objc_initWeak((id *)location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__HMUserCloudShareManager__registerWithCompletion___block_invoke;
    v17[3] = &unk_1E59441D8;
    objc_copyWeak(&v20, (id *)location);
    id v11 = v5;
    id v18 = v11;
    id v19 = v4;
    [v10 setResponseHandler:v17];
    v12 = [v11 messageDispatcher];
    [v12 sendMessage:v10 completionHandler:0];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_super v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v16;
      __int16 v24 = 2080;
      v25 = "-[HMUserCloudShareManager _registerWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __51__HMUserCloudShareManager__registerWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v5 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMUserCloudShareManager__registerWithCompletion___block_invoke_2;
    block[3] = &unk_1E5945138;
    id v7 = v3;
    id v8 = WeakRetained;
    id v9 = a1[5];
    dispatch_async(v5, block);
  }
}

void __51__HMUserCloudShareManager__registerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 32);
    int v15 = 138543618;
    v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    id v9 = "%{public}@Failed to start with error: %@";
    uint64_t v10 = v6;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v7 = HMFGetLogIdentifier();
    int v15 = 138543362;
    v16 = v7;
    id v9 = "%{public}@Registered Successfully";
    uint64_t v10 = v6;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
  }
  _os_log_impl(&dword_19D1A8000, v10, v11, v9, (uint8_t *)&v15, v12);

LABEL_7:
  if (*(void *)(a1 + 48))
  {
    objc_super v13 = [*(id *)(a1 + 40) context];
    v14 = [v13 delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 48) error:*(void *)(a1 + 32)];
  }
}

- (void)reconnect
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMUserCloudShareManager *)self context];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HMUserCloudShareManager_reconnect__block_invoke;
    block[3] = &unk_1E59452E8;
    void block[4] = self;
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint32_t v12 = v9;
      __int16 v13 = 2080;
      v14 = "-[HMUserCloudShareManager reconnect]";
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __36__HMUserCloudShareManager_reconnect__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isRegistered];
  if (result)
  {
    id v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Re-registering", (uint8_t *)&v7, 0xCu);
    }
    return [*(id *)(a1 + 32) _registerWithCompletion:0];
  }
  return result;
}

- (void)registerForContainerIDs:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMUserCloudShareManager *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUserCloudShareManager registerForContainerIDs:completion:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HMUserCloudShareManager_registerForContainerIDs_completion___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v24 = v7;
    id v23 = v6;
    dispatch_async(v10, block);
  }
  else
  {
    os_log_type_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint32_t v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      v28 = "-[HMUserCloudShareManager registerForContainerIDs:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

void __62__HMUserCloudShareManager_registerForContainerIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isRegistered])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:1 description:@"Already registered" reason:@"Cannot register more than once" suggestion:0];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    [*(id *)(a1 + 32) setRegistered:1];
    id v3 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) setContainerIDs:*(void *)(a1 + 40)]);
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _registerWithCompletion:*(void *)(a1 + 48)];
  }
}

- (void)_handleDidReceiveRepairRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 messagePayload];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"HM.u.homeuuid");

  id v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v4 messagePayload];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"HM.u.repairInfo"];
  id v27 = 0;
  os_log_type_t v11 = [v7 unarchivedObjectOfClass:v8 fromData:v10 error:&v27];
  id v12 = v27;

  __int16 v13 = [(HMUserCloudShareManager *)self dataSource];
  v14 = [v13 shareManager:self homeWithUUID:v6];

  if (v14 && v11)
  {
    uint64_t v15 = [(HMUserCloudShareManager *)self delegate];
    char v16 = objc_opt_respondsToSelector();
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v20)
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v21;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Calling repair delegate.", buf, 0xCu);
      }
      [v15 shareManager:v18 didReceiveRepairInfo:v11 home:v14];
    }
    else
    {
      if (v20)
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v26;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Client does not respond to repair.", buf, 0xCu);
      }
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x19F3A64A0]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v25;
      __int16 v30 = 2112;
      v31 = v6;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Did not find home %@ or repairInfo %@", buf, 0x20u);
    }
  }
}

- (void)_handleDidReceiveShare:(id)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMUserCloudShareManager *)self delegate];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v129 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Decoding share message.", buf, 0xCu);
    }
    os_log_type_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = v7;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v129 = v14;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Decoding user.", buf, 0xCu);
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v16 = objc_opt_class();
    __int16 v17 = [v4 messagePayload];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"HM.u.to"];
    id v125 = 0;
    uint64_t v19 = [v15 unarchivedObjectOfClass:v16 fromData:v18 error:&v125];
    id v20 = v125;

    if (v20)
    {
      id v111 = v20;
      v114 = 0;
      id v21 = 0;
      v22 = 0;
      id v23 = 0;
      v115 = 0;
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
      id v27 = v12;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v129 = v29;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Decoding share URL.", buf, 0xCu);
      }
      __int16 v30 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v31 = objc_opt_class();
      __int16 v32 = [v4 messagePayload];
      id v33 = [v32 objectForKeyedSubscript:@"HM.u.url"];
      id v124 = 0;
      uint64_t v109 = [v30 unarchivedObjectOfClass:v31 fromData:v33 error:&v124];
      id v34 = v124;

      if (v34)
      {
        id v111 = v34;
        v114 = 0;
        v22 = 0;
        id v23 = 0;
        v115 = 0;
        id v21 = (void *)v109;
      }
      else
      {
        v35 = (void *)MEMORY[0x19F3A64A0]();
        v36 = v27;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v129 = v38;
          _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Decoding encoded share Token.", buf, 0xCu);
        }
        v39 = [v4 messagePayload];
        uint64_t v108 = [v39 objectForKeyedSubscript:@"HM.u.token"];

        v40 = (void *)MEMORY[0x19F3A64A0]();
        v41 = v36;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v129 = v43;
          _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Decoding containerID.", buf, 0xCu);
        }
        v44 = [v4 messagePayload];
        id v23 = [v44 objectForKeyedSubscript:@"HM.u.container"];

        v45 = (void *)MEMORY[0x19F3A64A0]();
        v46 = v41;
        v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v129 = v48;
          _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Decoding fromUser.", buf, 0xCu);
        }
        v49 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v50 = objc_opt_class();
        v51 = [v4 messagePayload];
        v52 = [v51 objectForKeyedSubscript:@"HM.u.from"];
        id v123 = 0;
        v115 = [v49 unarchivedObjectOfClass:v50 fromData:v52 error:&v123];
        id v53 = v123;

        if (v53)
        {
          id v111 = v53;
          v114 = 0;
          id v21 = (void *)v109;
        }
        else
        {
          v54 = (void *)MEMORY[0x19F3A64A0]();
          v55 = v46;
          v56 = HMFGetOSLogHandle();
          id v21 = (void *)v109;
          v112 = v55;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            v57 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v129 = v57;
            _os_log_impl(&dword_19D1A8000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Decoding token.", buf, 0xCu);

            v55 = v112;
          }

          id v58 = objc_alloc(MEMORY[0x1E4F28DC0]);
          v59 = [v4 messagePayload];
          v60 = [v59 objectForKeyedSubscript:@"HM.u.home"];
          id v122 = 0;
          v61 = (void *)[v58 initForReadingFromData:v60 error:&v122];
          id v62 = v122;

          [v61 _allowDecodingCyclesInSecureMode];
          uint64_t v63 = objc_opt_class();
          uint64_t v64 = *MEMORY[0x1E4F284E8];
          id v121 = v62;
          v114 = [v61 decodeTopLevelObjectOfClass:v63 forKey:v64 error:&v121];
          id v65 = v121;

          if (!v65)
          {
            context = v61;
            v81 = (void *)MEMORY[0x19F3A64A0]();
            v82 = v112;
            v83 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              v84 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v129 = v84;
              _os_log_impl(&dword_19D1A8000, v83, OS_LOG_TYPE_DEBUG, "%{public}@Decoding share token.", buf, 0xCu);
            }
            v107 = v82;

            v85 = (void *)MEMORY[0x1E4F28DC0];
            v86 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
            id v120 = 0;
            v76 = [v85 _strictlyUnarchivedObjectOfClasses:v86 fromData:v108 error:&v120];
            id v87 = v120;

            v113 = v76;
            if (v87)
            {
              v88 = (void *)MEMORY[0x19F3A64A0]();
              id v89 = v107;
              v90 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
              {
                v91 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v129 = v91;
                _os_log_impl(&dword_19D1A8000, v90, OS_LOG_TYPE_INFO, "%{public}@Skipping shareToken check.", buf, 0xCu);
              }

              v76 = v113;
            }

            v77 = [[HMUserCloudShareInvitation alloc] initWithUser:v19 URL:v109 shareToken:v76 containerID:v23 forHome:v114 fromUser:v115];
            if (objc_opt_respondsToSelector())
            {
              v92 = (void *)MEMORY[0x19F3A64A0]();
              id v93 = v107;
              v94 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                v95 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v129 = v95;
                _os_log_impl(&dword_19D1A8000, v94, OS_LOG_TYPE_INFO, "%{public}@Calling share invitation delegate.", buf, 0xCu);
              }
              v118[0] = MEMORY[0x1E4F143A8];
              v118[1] = 3221225472;
              v118[2] = __50__HMUserCloudShareManager__handleDidReceiveShare___block_invoke;
              v118[3] = &unk_1E5943A28;
              v118[4] = v93;
              id v119 = v4;
              [v5 shareManager:v93 didReceiveShareInvitation:v77 completionHandler:v118];

              v22 = (void *)v108;
              v76 = v113;
            }
            else
            {
              char v96 = objc_opt_respondsToSelector();
              contexta = (void *)MEMORY[0x19F3A64A0]();
              id v97 = v107;
              v98 = HMFGetOSLogHandle();
              v99 = v98;
              if (v96)
              {
                if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
                {
                  v100 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v129 = v100;
                  _os_log_impl(&dword_19D1A8000, v99, OS_LOG_TYPE_INFO, "%{public}@Calling legacy share invitation delegate.", buf, 0xCu);
                }
                v116[0] = MEMORY[0x1E4F143A8];
                v116[1] = 3221225472;
                v116[2] = __50__HMUserCloudShareManager__handleDidReceiveShare___block_invoke_60;
                v116[3] = &unk_1E5943A50;
                v116[4] = v97;
                id v117 = v4;
                [v5 shareManager:v97 didReceiveShareInvitation:v77 completion:v116];
              }
              else
              {
                if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                {
                  v101 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v129 = v101;
                  _os_log_impl(&dword_19D1A8000, v99, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement any of the methods to accept a share", buf, 0xCu);
                }
                v102 = [v4 responseHandler];

                if (v102)
                {
                  v103 = [v4 responseHandler];
                  v104 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Delegate does implement method to accept shares" reason:@"Need a delegate implements method to accept shares" suggestion:0];
                  ((void (**)(void, void *, void))v103)[2](v103, v104, 0);
                }
              }
              v22 = (void *)v108;
            }
            goto LABEL_33;
          }
          id v111 = v65;
        }
        v22 = (void *)v108;
      }
    }
    v66 = (void *)MEMORY[0x19F3A64A0]();
    v67 = v12;
    v68 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v69 = HMFGetLogIdentifier();
      [v4 messagePayload];
      v110 = v23;
      id v70 = v4;
      v71 = v5;
      v72 = v22;
      v73 = v19;
      v75 = v74 = v21;
      *(_DWORD *)buf = 138543618;
      v129 = v69;
      __int16 v130 = 2112;
      v131 = v75;
      _os_log_impl(&dword_19D1A8000, v68, OS_LOG_TYPE_ERROR, "%{public}@Could not decode all items in payload: %@", buf, 0x16u);

      id v21 = v74;
      uint64_t v19 = v73;
      v22 = v72;
      uint64_t v5 = v71;
      id v4 = v70;
      id v23 = v110;
    }
    v76 = v111;
    v77 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Unable to decode payload" reason:@"Could not decode all items in payload" suggestion:0 underlyingError:v111];
    v78 = [v4 responseHandler];

    if (v78)
    {
      v79 = [v4 responseHandler];
      v126 = @"didAccept";
      uint64_t v127 = MEMORY[0x1E4F1CC28];
      v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
      ((void (**)(void, HMUserCloudShareInvitation *, void *))v79)[2](v79, v77, v80);
    }
LABEL_33:

    goto LABEL_34;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v129 = v24;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Do not have a delegate that responds to shares", buf, 0xCu);
  }
  v25 = [v4 responseHandler];

  if (v25)
  {
    uint64_t v19 = [v4 responseHandler];
    id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Delegate does not respond to shares" reason:@"Need a delegate that responds to shares" suggestion:0];
    ((void (**)(void, void *, void))v19)[2](v19, v21, 0);
LABEL_34:
  }
}

void __50__HMUserCloudShareManager__handleDidReceiveShare___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = *(id *)(a1 + 32);
    os_log_type_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v12;
      __int16 v13 = "%{public}@Client accepted share";
LABEL_7:
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, v13, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = *(id *)(a1 + 32);
  v14 = HMFGetOSLogHandle();
  os_log_type_t v11 = v14;
  if (v8)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v12;
      __int16 v13 = "%{public}@Client rejected share.";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v34 = v24;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Client did not accept share but no error specified.", buf, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Required error not specified" reason:@"Need error when share is not accepted" suggestion:0];
LABEL_9:
  uint64_t v15 = [*(id *)(a1 + 40) responseHandler];

  if (v15)
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    __int16 v17 = [NSNumber numberWithBool:a2];
    [v16 setObject:v17 forKeyedSubscript:@"didAccept"];

    if (v7)
    {
      uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
      id v19 = *(id *)(a1 + 32);
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v34 = v21;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Forwarding received clientInfo.", buf, 0xCu);
      }
      id v32 = 0;
      v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v32];
      id v23 = v32;
      if (v22)
      {
        [v16 setObject:v22 forKeyedSubscript:@"clientInfo"];
      }
      else
      {
        v25 = (void *)MEMORY[0x19F3A64A0]();
        id v26 = *(id *)(a1 + 32);
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v34 = v28;
          __int16 v35 = 2112;
          id v36 = v23;
          _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Error encoding client Info. %@", buf, 0x16u);
        }

        id v29 = v23;
        uint64_t v16 = 0;
        id v8 = v29;
      }
    }
    __int16 v30 = [*(id *)(a1 + 40) responseHandler];
    uint64_t v31 = (void *)[v16 copy];
    ((void (**)(void, id, void *))v30)[2](v30, v8, v31);
  }
}

void __50__HMUserCloudShareManager__handleDidReceiveShare___block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v9;
      id v10 = "%{public}@Client accepted share";
LABEL_7:
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, v10, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = *(id *)(a1 + 32);
  os_log_type_t v11 = HMFGetOSLogHandle();
  id v8 = v11;
  if (v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v9;
      id v10 = "%{public}@Client rejected share.";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v20 = v16;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Client did not accept share but no error specified.", buf, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Required error not specified" reason:@"Need error when share is not accepted" suggestion:0];
LABEL_9:
  id v12 = [*(id *)(a1 + 40) responseHandler];

  if (v12)
  {
    __int16 v13 = [*(id *)(a1 + 40) responseHandler];
    v14 = objc_msgSend(NSNumber, "numberWithBool:", a2, @"didAccept");
    uint64_t v18 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    ((void (**)(void, id, void *))v13)[2](v13, v5, v15);
  }
}

void __36__HMUserCloudShareManager_configure__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconnect];
}

- (void)_unconfigure
{
  id v4 = [(HMUserCloudShareManager *)self context];
  id v3 = [v4 messageDispatcher];
  [v3 deregisterReceiver:self];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33 != -1) {
    dispatch_once(&logCategory__hmf_once_t33, &__block_literal_global_47075);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v34;

  return v2;
}

uint64_t __38__HMUserCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v34;
  logCategory__hmf_once_id v34 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end