@interface HMDeviceSetupOperationHandlerBase
+ (id)logCategory;
- (HMDeviceSetupOperationHandlerBase)init;
- (HMDeviceSetupOperationHandlerBase)initWithSetupSessionFactory:(id)a3;
- (HMDeviceSetupSession)setupSession;
- (id)logIdentifier;
- (void)configureSessionForMessages;
- (void)dealloc;
- (void)setupSession:(id)a3 didReceiveExchangeData:(id)a4 completionHandler:(id)a5;
@end

@implementation HMDeviceSetupOperationHandlerBase

- (void).cxx_destruct
{
}

- (HMDeviceSetupSession)setupSession
{
  return self->_setupSession;
}

- (id)logIdentifier
{
  v2 = [(HMDeviceSetupOperationHandlerBase *)self setupSession];
  v3 = [v2 identifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)setupSession:(id)a3 didReceiveExchangeData:(id)a4 completionHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v14;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Received request to send unexpected received exchange data, dropping", (uint8_t *)&v16, 0xCu);
  }
  if (v10)
  {
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    v10[2](v10, 0, v15);
  }
}

- (void)configureSessionForMessages
{
  v3 = [(HMDeviceSetupOperationHandlerBase *)self setupSession];
  [v3 configure];

  id v4 = [(HMDeviceSetupOperationHandlerBase *)self setupSession];
  [v4 open];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = objc_opt_class();
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating %@", buf, 0x16u);
  }
  v7 = [(HMDeviceSetupOperationHandlerBase *)v4 setupSession];
  [v7 cleanUpSession];

  v8.receiver = v4;
  v8.super_class = (Class)HMDeviceSetupOperationHandlerBase;
  [(HMDeviceSetupOperationHandlerBase *)&v8 dealloc];
}

- (HMDeviceSetupOperationHandlerBase)initWithSetupSessionFactory:(id)a3
{
  id v4 = (void (**)(id, HMDeviceSetupOperationHandlerBase *))a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceSetupOperationHandlerBase;
  v5 = [(HMDeviceSetupOperationHandlerBase *)&v9 init];
  if (v5)
  {
    uint64_t v6 = v4[2](v4, v5);
    setupSession = v5->_setupSession;
    v5->_setupSession = (HMDeviceSetupSession *)v6;
  }
  return v5;
}

- (HMDeviceSetupOperationHandlerBase)init
{
  return [(HMDeviceSetupOperationHandlerBase *)self initWithSetupSessionFactory:&__block_literal_global_23502];
}

HMDeviceSetupSession *__41__HMDeviceSetupOperationHandlerBase_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [HMDeviceSetupSession alloc];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [(HMDeviceSetupSession *)v3 initWithRole:1 identifier:v4 delegate:v2];

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_23512 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_23512, &__block_literal_global_7_23513);
  }
  id v2 = (void *)logCategory__hmf_once_v3_23514;

  return v2;
}

uint64_t __48__HMDeviceSetupOperationHandlerBase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_23514;
  logCategory__hmf_once_v3_23514 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end