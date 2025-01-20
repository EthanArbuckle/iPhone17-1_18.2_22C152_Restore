@interface FPDTelemetryService
- (FPDExtensionManager)extensionManager;
- (FPDTelemetryService)init;
- (void)_replaceFPCKTelemetryValuesInTelemetryReport:(id)a3;
- (void)setExtensionManager:(id)a3;
- (void)start;
@end

@implementation FPDTelemetryService

- (FPDTelemetryService)init
{
  v7.receiver = self;
  v7.super_class = (Class)FPDTelemetryService;
  v2 = [(FPDTelemetryService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("telemetry-service", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)_replaceFPCKTelemetryValuesInTelemetryReport:(id)a3
{
  id v3 = a3;
  id v11 = [v3 objectForKeyedSubscript:@"startTime"];
  if (v11)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v11 doubleValue];
    uint64_t v5 = objc_msgSend(v4, "initWithTimeIntervalSince1970:");
    v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSinceDate:v5];

    objc_super v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v8 = [MEMORY[0x1E4F1C9C8] now];
    v9 = [v7 components:16 fromDate:v5 toDate:v8 options:0];

    v10 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(v9, "day"));
    [v3 setObject:v10 forKeyedSubscript:@"reportAge"];

    [v3 setObject:0 forKeyedSubscript:@"startTime"];
    id v3 = (id)v5;
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"startTime"];
    [v3 setObject:0 forKeyedSubscript:@"reportAge"];
  }
}

- (void)start
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F141F8]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14340], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  id location = 0;
  objc_initWeak(&location, self);
  id v4 = (const char *)[(id)FPDTelemetryXPCActivityId UTF8String];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__FPDTelemetryService_start__block_invoke;
  v5[3] = &unk_1E6A736E8;
  objc_copyWeak(&v6, &location);
  xpc_activity_register(v4, v3, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __28__FPDTelemetryService_start__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t v3 = a2;
  id v4 = (void *)MEMORY[0x1D9471CC0]();
  uint64_t section = __fp_create_section();
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __28__FPDTelemetryService_start__block_invoke_cold_1(&section, v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v7 = objc_opt_new();
    v8 = objc_opt_new();
    [v7 setObject:v8 forKeyedSubscript:&unk_1F2EDBB98];

    v9 = objc_opt_new();
    [v7 setObject:v9 forKeyedSubscript:&unk_1F2EDBBB0];

    xpc_activity_set_state(v3, 4);
    dispatch_group_t v10 = dispatch_group_create();
    id v11 = [*((id *)WeakRetained + 2) providerDomainsByID];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __28__FPDTelemetryService_start__block_invoke_15;
    v19[3] = &unk_1E6A73698;
    v19[4] = WeakRetained;
    v12 = v10;
    v20 = v12;
    id v13 = v7;
    id v21 = v13;
    [v11 enumerateKeysAndObjectsUsingBlock:v19];

    v14 = *((void *)WeakRetained + 1);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __28__FPDTelemetryService_start__block_invoke_4;
    v16[3] = &unk_1E6A736C0;
    id v17 = v13;
    v18 = v3;
    id v15 = v13;
    dispatch_group_notify(v12, v14, v16);
  }
  else
  {
    activityDone(v3);
  }

  __fp_leave_section_Debug();
}

void __28__FPDTelemetryService_start__block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend(v3, "fp_toProviderID");
  id v6 = [v4 providerWithIdentifier:v5 reason:0];

  if (v6)
  {
    objc_super v7 = objc_msgSend(v3, "fp_toDomainIdentifier");
    v8 = [v6 domainForIdentifier:v7 reason:0];

    if (v8)
    {
      if ([v8 isUsingFPFS])
      {
        v9 = [v8 defaultBackend];
        char v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          id v11 = [v8 defaultBackend];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __28__FPDTelemetryService_start__block_invoke_2;
          v13[3] = &unk_1E6A73670;
          v12 = *(void **)(a1 + 40);
          v13[4] = *(void *)(a1 + 32);
          id v14 = v12;
          id v15 = v6;
          id v16 = v8;
          id v17 = *(id *)(a1 + 48);
          [v11 fetchTelemetryReportWithCompletionHandler:v13];
        }
      }
    }
  }
}

void __28__FPDTelemetryService_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__FPDTelemetryService_start__block_invoke_3;
  v8[3] = &unk_1E6A73648;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __28__FPDTelemetryService_start__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) _replaceFPCKTelemetryValuesInTelemetryReport:v10];
    v2 = [*(id *)(a1 + 56) identifier];
    [v10 setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F61970]];

    id v3 = [*(id *)(a1 + 56) bundleVersion];
    [v10 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F61978]];

    id v4 = NSNumber;
    id v5 = [*(id *)(a1 + 64) volume];
    uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInt:", objc_msgSend(v5, "role"));
    [v10 setObject:v6 forKeyedSubscript:@"volumeRole"];

    id v7 = [*(id *)(a1 + 72) objectForKeyedSubscript:&unk_1F2EDBB98];
    [v7 addObject:v10];

    v8 = [*(id *)(a1 + 72) objectForKeyedSubscript:&unk_1F2EDBBB0];
    [v8 addObject:v10];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    id v9 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v9);
  }
}

void __28__FPDTelemetryService_start__block_invoke_4(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F61980] defaultManager];
  [v2 postMultipleReports:*(void *)(a1 + 32) type:1 userinfo:0 session:0 observer:0];

  id v3 = *(_xpc_activity_s **)(a1 + 40);
  activityDone(v3);
}

- (FPDExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __28__FPDTelemetryService_start__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx gathering and reporting FPFS usage telemetry", (uint8_t *)&v3, 0xCu);
}

@end