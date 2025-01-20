@interface HMITaskServiceClient
- (BOOL)cancelTask:(int)a3;
- (HMITaskServiceClient)init;
- (VCPHomeKitAnalysisService)remote;
- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation HMITaskServiceClient

- (HMITaskServiceClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMITaskServiceClient;
  v2 = [(HMITaskService *)&v8 initPrivate];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getVCPHomeKitAnalysisServiceClass_softClass;
    uint64_t v13 = getVCPHomeKitAnalysisServiceClass_softClass;
    if (!getVCPHomeKitAnalysisServiceClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getVCPHomeKitAnalysisServiceClass_block_invoke;
      v9[3] = &unk_26477B968;
      v9[4] = &v10;
      __getVCPHomeKitAnalysisServiceClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [v4 analysisService];
    remote = v2->_remote;
    v2->_remote = (VCPHomeKitAnalysisService *)v5;
  }
  return v2;
}

- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Progress handler is not available in the client task service." userInfo:0];
    objc_exception_throw(v19);
  }
  v11 = v10;
  uint64_t v12 = [(HMITaskServiceClient *)self remote];
  int v13 = [v12 requestResidentMaintenanceWithOptions:v8 andCompletionHandler:v11];

  if (v13 == -1)
  {
    v14 = (void *)MEMORY[0x22A641C70]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v17;
      _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_ERROR, "%{public}@requestResidentMaintenanceWithOptions failed", (uint8_t *)&v20, 0xCu);
    }
  }

  return v13;
}

- (BOOL)cancelTask:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(HMITaskServiceClient *)self remote];
  [v4 cancelRequest:v3];

  return 1;
}

- (VCPHomeKitAnalysisService)remote
{
  return (VCPHomeKitAnalysisService *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end