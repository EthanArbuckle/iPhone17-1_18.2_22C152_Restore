@interface HMITaskService
+ (id)allowedClasses;
+ (id)taskService;
+ (id)taskServiceClient;
- (BOOL)cancelTask:(int)a3;
- (id)initPrivate;
- (int)submitTask:(id)a3 progressHandler:(id)a4 completionHander:(id)a5;
- (int)submitTaskWithOptions:(id)a3 completionHandler:(id)a4;
- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation HMITaskService

+ (id)taskService
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HMITaskService_taskService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (taskService_onceToken != -1) {
    dispatch_once(&taskService_onceToken, block);
  }
  v2 = (void *)taskService_server;
  return v2;
}

void __29__HMITaskService_taskService__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A641C70]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_225DC6000, v4, OS_LOG_TYPE_INFO, "%{public}@Initializing HMITaskServiceServer", (uint8_t *)&v8, 0xCu);
  }
  v6 = objc_alloc_init(HMITaskServiceServer);
  v7 = (void *)taskService_server;
  taskService_server = (uint64_t)v6;
}

+ (id)taskServiceClient
{
  id v3 = +[HMIPreference sharedInstance];
  char v4 = [v3 BOOLPreferenceForKey:@"taskServiceRunLocally" defaultValue:0];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__HMITaskService_taskServiceClient__block_invoke;
  v7[3] = &__block_descriptor_41_e5_v8__0l;
  char v8 = v4;
  v7[4] = a1;
  if (taskServiceClient_onceToken != -1) {
    dispatch_once(&taskServiceClient_onceToken, v7);
  }
  v5 = (void *)taskServiceClient_client;
  return v5;
}

void __35__HMITaskService_taskServiceClient__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = (void *)MEMORY[0x22A641C70]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@RUNNING TASK SERVICE LOCALLY: returning taskService", (uint8_t *)&v11, 0xCu);
    }
    char v8 = +[HMITaskService taskService];
  }
  else
  {
    if (v6)
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@Initializing HMITaskServiceClient", (uint8_t *)&v11, 0xCu);
    }
    char v8 = objc_alloc_init(HMITaskServiceClient);
  }
  uint64_t v10 = (void *)taskServiceClient_client;
  taskServiceClient_client = (uint64_t)v8;
}

+ (id)allowedClasses
{
  v6[8] = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)HMITaskService;
  return [(HMITaskService *)&v3 init];
}

- (int)submitTaskWithOptions:(id)a3 completionHandler:(id)a4
{
  return [(HMITaskService *)self submitTaskWithOptions:a3 progressHandler:0 completionHandler:a4];
}

- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = *MEMORY[0x263EFF498];
  uint64_t v13 = NSString;
  v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (BOOL)cancelTask:(int)a3
{
  objc_super v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSString;
  BOOL v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (int)submitTask:(id)a3 progressHandler:(id)a4 completionHander:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = *MEMORY[0x263EFF498];
  uint64_t v13 = NSString;
  v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

@end