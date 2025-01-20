@interface DKNotificationTimeZoneChangeMonitor
@end

@implementation DKNotificationTimeZoneChangeMonitor

uint64_t __43___DKNotificationTimeZoneChangeMonitor_log__block_invoke()
{
  log_log_3 = (uint64_t)os_log_create("com.apple.coreduet.monitors", "_DKNotificationTimeZoneChangeMonitor");
  return MEMORY[0x270F9A758]();
}

void __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 146))
  {
    v2 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225002000, v2, OS_LOG_TYPE_DEFAULT, "Checking current state of timezone stream", buf, 2u);
    }

    v3 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:0 endDate:0 maxEvents:1 lastN:1 reversed:0];
    v4 = BiomeLibrary();
    v5 = [v4 Device];
    v6 = [v5 TimeZone];
    v7 = [v6 publisherWithOptions:v3];

    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    id v25 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke_2;
    v19[3] = &unk_264714F48;
    v19[4] = *(void *)(a1 + 32);
    v19[5] = buf;
    id v8 = (id)[v7 sinkWithCompletion:&__block_literal_global_21 receiveInput:v19];
    double Current = CFAbsoluteTimeGetCurrent();
    [*((id *)v21 + 5) timestamp];
    double v11 = v10;
    v12 = [*((id *)v21 + 5) eventBody];
    char v13 = [v12 isEqual:*(void *)(a1 + 40)];
    if (Current - v11 <= 604800.0) {
      char v14 = v13;
    }
    else {
      char v14 = 0;
    }

    if (v14)
    {
      uint64_t v15 = [*((id *)v21 + 5) eventBody];
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(v16 + 160);
      *(void *)(v16 + 160) = v15;

      [*((id *)v21 + 5) timestamp];
      *(void *)(*(void *)(a1 + 32) + 152) = v18;
    }
    else
    {
      [*(id *)(a1 + 32) _updateWithTimeZone:*(void *)(a1 + 40) timestamp:*(double *)(a1 + 48)];
    }
    _Block_object_dispose(buf, 8);
  }
}

void __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 eventBody];
    [v4 timestamp];
    int v8 = 138412546;
    v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_225002000, v5, OS_LOG_TYPE_DEFAULT, "Loaded last timezone event %@ at %f", (uint8_t *)&v8, 0x16u);
  }
}

void __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke_24(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 145) = 1;
}

uint64_t __61___DKNotificationTimeZoneChangeMonitor_enqueueTimeZoneUpdate__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 146))
  {
    v1 = (double *)result;
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v3 = *((void *)v1 + 4);
    double v4 = *(double *)(v3 + 152);
    result = [*(id *)(v3 + 160) isEqual:*((void *)v1 + 5)];
    if (!result || Current - v4 > 604800.0)
    {
      v5 = (void *)*((void *)v1 + 4);
      uint64_t v6 = *((void *)v1 + 5);
      double v7 = v1[6];
      return [v5 _updateWithTimeZone:v6 timestamp:v7];
    }
  }
  return result;
}

@end