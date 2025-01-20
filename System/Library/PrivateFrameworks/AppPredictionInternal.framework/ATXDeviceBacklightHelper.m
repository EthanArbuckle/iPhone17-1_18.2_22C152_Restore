@interface ATXDeviceBacklightHelper
+ (id)getScreenOnIntervalsBetweenStartDate:(id)a3 endDate:(id)a4;
@end

@implementation ATXDeviceBacklightHelper

+ (id)getScreenOnIntervalsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D25F6CC0]();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__65;
  v23[4] = __Block_byref_object_dispose__65;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v8 = objc_opt_new();
  v9 = BiomeLibrary();
  v10 = [v9 Device];
  v11 = [v10 Display];
  v12 = [v11 Backlight];
  v13 = objc_msgSend(v12, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v5, v6, 0, 0, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke_5;
  v17[3] = &unk_1E68B2CB8;
  v19 = v21;
  v20 = v23;
  id v14 = v8;
  id v18 = v14;
  id v15 = (id)[v13 sinkWithCompletion:&__block_literal_global_137 receiveInput:v17];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  return v14;
}

void __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke_cold_1(v2, v4);
    }
  }
}

void __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke_5(uint64_t a1, void *a2)
{
  id v25 = a2;
  v3 = [v25 eventBody];
  uint64_t v4 = [v3 backlightLevel];

  if (v4 == 1 && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = [v25 eventBody];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  v8 = [v25 eventBody];
  uint64_t v9 = [v8 backlightLevel];

  v10 = v25;
  if (!v9)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v11 = [v25 eventBody];
      v12 = [v11 absoluteTimestamp];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;
      id v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) absoluteTimestamp];
      [v15 timeIntervalSinceReferenceDate];
      double v17 = v16;

      if (v14 > v17)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
        v19 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) absoluteTimestamp];
        v20 = [v25 eventBody];
        v21 = [v20 absoluteTimestamp];
        char v22 = (void *)[v18 initWithStartDate:v19 endDate:v21];

        [*(id *)(a1 + 32) addObject:v22];
      }
    }
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = 0;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v10 = v25;
  }
}

void __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXDeviceUsageModeLoggingPipeline: Error querying Backlight stream: %@", (uint8_t *)&v4, 0xCu);
}

@end