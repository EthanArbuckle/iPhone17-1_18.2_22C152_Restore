@interface CTCellularPlanProvisioning
- (BOOL)supportsCellularPlan;
- (BOOL)supportsEmbeddedSIM;
- (CTCellularPlanProvisioning)init;
- (void)addPlanWith:(CTCellularPlanProvisioningRequest *)request completionHandler:(void *)completionHandler;
- (void)supportsCellularPlan;
@end

@implementation CTCellularPlanProvisioning

- (CTCellularPlanProvisioning)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTCellularPlanProvisioning;
  v2 = [(CTCellularPlanProvisioning *)&v7 init];
  if (v2)
  {
    v3 = [CoreTelephonyClient alloc];
    uint64_t v4 = [(CoreTelephonyClient *)v3 initWithQueue:MEMORY[0x1E4F14428]];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v4;

    v2->_supportsEmbeddedSIM = [(CoreTelephonyClient *)v2->_client supportsEmbeddedSIM];
  }
  return v2;
}

- (BOOL)supportsCellularPlan
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 infoDictionary];
  v5 = [v4 objectForKey:@"SmdpUrl"];

  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v7 = [v6 infoDictionary];
  v8 = [v7 objectForKey:@"IccidPrefix"];

  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 infoDictionary];
  v11 = [v10 objectForKey:@"CarrierDescriptors"];

  if ((unint64_t)[v11 count] < 0x10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v14 = 138412802;
      v15 = v5;
      __int16 v16 = 2112;
      v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = [v11 count];
      _os_log_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "SMDP Url: %@, Iccid Prefix: %@, Carrier Descriptors count: %lu", (uint8_t *)&v14, 0x20u);
    }
    BOOL v12 = [(CoreTelephonyClient *)self->_client supportsPlanProvisioning:0 carrierDescriptors:v11 smdpUrl:v5 iccidPrefix:v8];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CTCellularPlanProvisioning supportsCellularPlan]();
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)addPlanWith:(CTCellularPlanProvisioningRequest *)request completionHandler:(void *)completionHandler
{
  v6 = request;
  objc_super v7 = completionHandler;
  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 infoDictionary];
  v10 = [v9 objectForKey:@"CFBundleDisplayName"];

  if (v10) {
    goto LABEL_3;
  }
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v12 = [v11 infoDictionary];
  v10 = [v12 objectForKey:@"CFBundleName"];

  if (v10)
  {
LABEL_3:
    client = self->_client;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__CTCellularPlanProvisioning_addPlanWith_completionHandler___block_invoke;
    v14[3] = &unk_1E5262CD8;
    id v15 = v7;
    [(CoreTelephonyClient *)client addPlanWith:v6 appName:v10 appType:0 completionHandler:v14];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CTCellularPlanProvisioning addPlanWith:completionHandler:]();
    }
    (*((void (**)(void *, uint64_t))v7 + 2))(v7, 1);
  }
}

uint64_t __60__CTCellularPlanProvisioning_addPlanWith_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)supportsEmbeddedSIM
{
  return self->_supportsEmbeddedSIM;
}

- (void).cxx_destruct
{
}

- (void)supportsCellularPlan
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Carrier Descriptors Array size more than allowed limit (15)", v0, 2u);
}

- (void)addPlanWith:completionHandler:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "App Name is not available - Check keys CFBundleDisplayName or CFBundleName are set", v0, 2u);
}

@end