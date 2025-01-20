@interface HKRegulatoryDomainManager
+ (BOOL)isOverridePresent;
+ (BOOL)unregisterForUpdatesWithToken:(id)a3;
+ (id)registerForUpdatesWithBlock:(id)a3 queue:(id)a4;
+ (void)setOverrideISOCountryCode:(id)a3;
- (HKRegulatoryDomainManager)init;
- (HKRegulatoryDomainManager)initWithCurrentEstimatesProvider:(id)a3;
- (id)currentCountryCode;
- (id)currentEstimate;
- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3;
@end

@implementation HKRegulatoryDomainManager

- (HKRegulatoryDomainManager)init
{
  return [(HKRegulatoryDomainManager *)self initWithCurrentEstimatesProvider:&__block_literal_global_23];
}

id __33__HKRegulatoryDomainManager_init__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getRDEstimateClass_softClass;
  uint64_t v8 = getRDEstimateClass_softClass;
  if (!getRDEstimateClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getRDEstimateClass_block_invoke;
    v4[3] = &unk_1E58BD760;
    v4[4] = &v5;
    __getRDEstimateClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  v2 = [v1 currentEstimates];

  return v2;
}

- (HKRegulatoryDomainManager)initWithCurrentEstimatesProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRegulatoryDomainManager;
  uint64_t v5 = [(HKRegulatoryDomainManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id currentEstimatesProvider = v5->_currentEstimatesProvider;
    v5->_id currentEstimatesProvider = (id)v6;
  }
  return v5;
}

- (id)currentCountryCode
{
  v2 = [(HKRegulatoryDomainManager *)self currentEstimate];
  v3 = [v2 ISOCode];

  return v3;
}

- (id)currentEstimate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = HKRegulatoryDomainEstimateOverrideISOCode();
  if (v3)
  {
    _HKInitializeLogging();
    id v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Returning ISO country code override override: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    if ([v3 isEqualToString:@"NONE"])
    {
      uint64_t v5 = 0;
      goto LABEL_9;
    }
    objc_super v9 = [HKRegulatoryDomainEstimate alloc];
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v8 = [(HKRegulatoryDomainEstimate *)v9 initWithISOCode:v3 timestamp:v7 provenance:103];
  }
  else
  {
    uint64_t v6 = (*((void (**)(void))self->_currentEstimatesProvider + 2))();
    uint64_t v7 = objc_msgSend(v6, "hk_firstObjectPassingTest:", &__block_literal_global_51);

    uint64_t v8 = (HKRegulatoryDomainEstimate *)-[HKRegulatoryDomainEstimate initWithEstimate:]([HKRegulatoryDomainEstimate alloc], v7);
  }
  uint64_t v5 = v8;

LABEL_9:

  return v5;
}

uint64_t __44__HKRegulatoryDomainManager_currentEstimate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v3 = (unsigned int *)getkRDPriorityServingCellMCCSymbolLoc_ptr;
  uint64_t v10 = getkRDPriorityServingCellMCCSymbolLoc_ptr;
  if (!getkRDPriorityServingCellMCCSymbolLoc_ptr)
  {
    id v4 = (void *)RegulatoryDomainLibrary();
    v8[3] = (uint64_t)dlsym(v4, "kRDPriorityServingCellMCC");
    getkRDPriorityServingCellMCCSymbolLoc_ptr = v8[3];
    v3 = (unsigned int *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    __44__HKRegulatoryDomainManager_currentEstimate__block_invoke_cold_1();
  }
  uint64_t v5 = [v2 priorityIsAtLeast:*v3];

  return v5;
}

- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3
{
  uint64_t v6 = (void (**)(id, void *, void *))a3;
  id v4 = [(HKRegulatoryDomainManager *)self currentEstimate];
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 109, @"No location determined");
  }
  v6[2](v6, v4, v5);
}

+ (id)registerForUpdatesWithBlock:(id)a3 queue:(id)a4
{
  id v5 = a3;
  uint64_t v6 = a4;
  int out_token = -1;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v7 = (id *)getkRegulatoryDomainUpdateNotificationSymbolLoc_ptr;
  uint64_t v25 = getkRegulatoryDomainUpdateNotificationSymbolLoc_ptr;
  if (!getkRegulatoryDomainUpdateNotificationSymbolLoc_ptr)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getkRegulatoryDomainUpdateNotificationSymbolLoc_block_invoke;
    v20 = &unk_1E58BD760;
    v21 = &v22;
    uint64_t v8 = (void *)RegulatoryDomainLibrary();
    v23[3] = (uint64_t)dlsym(v8, "kRegulatoryDomainUpdateNotification");
    getkRegulatoryDomainUpdateNotificationSymbolLoc_ptr = *(void *)(v21[1] + 24);
    uint64_t v7 = (id *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v7) {
    +[HKRegulatoryDomainManager registerForUpdatesWithBlock:queue:]();
  }
  id v9 = *v7;
  uint64_t v10 = (const char *)[v9 UTF8String];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __63__HKRegulatoryDomainManager_registerForUpdatesWithBlock_queue___block_invoke;
  handler[3] = &unk_1E58BFE40;
  id v11 = v5;
  id v15 = v11;
  LODWORD(v10) = notify_register_dispatch(v10, &out_token, v6, handler);

  if (v10)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [NSNumber numberWithInt:out_token];
  }

  return v12;
}

uint64_t __63__HKRegulatoryDomainManager_registerForUpdatesWithBlock_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)unregisterForUpdatesWithToken:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 intValue] != -1 && notify_cancel(objc_msgSend(v3, "intValue")) == 0;

  return v4;
}

+ (BOOL)isOverridePresent
{
  id v2 = [a1 overrideISOCountryCode];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (void)setOverrideISOCountryCode:(id)a3
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFPreferencesSetAppValue(@"HealthRegulatoryDomainISOCountryCodeOverride", a3, (CFStringRef)*MEMORY[0x1E4F1D3B8]);

  CFPreferencesAppSynchronize(v3);
}

- (void).cxx_destruct
{
}

void __44__HKRegulatoryDomainManager_currentEstimate__block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"unsigned int getkRDPriorityServingCellMCC(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKRegulatoryDomainManager.m", 38, @"%s", dlerror());

  __break(1u);
}

+ (void)registerForUpdatesWithBlock:queue:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"CFStringRef getkRegulatoryDomainUpdateNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKRegulatoryDomainManager.m", 39, @"%s", dlerror());

  __break(1u);
}

@end