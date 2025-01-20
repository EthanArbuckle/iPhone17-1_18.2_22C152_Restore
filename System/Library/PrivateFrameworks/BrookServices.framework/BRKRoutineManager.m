@interface BRKRoutineManager
+ (void)fetchLocationsOfInterestWithSingleRetryOfType:(int64_t)a3 routineManager:(id)a4 withHandler:(id)a5;
@end

@implementation BRKRoutineManager

+ (void)fetchLocationsOfInterestWithSingleRetryOfType:(int64_t)a3 routineManager:(id)a4 withHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__BRKRoutineManager_fetchLocationsOfInterestWithSingleRetryOfType_routineManager_withHandler___block_invoke;
  v12[3] = &unk_264DB6380;
  id v14 = v8;
  int64_t v15 = a3;
  id v13 = v7;
  id v9 = v8;
  id v10 = v7;
  v11 = (void *)MEMORY[0x23ECAA650](v12);
  [v10 fetchLocationsOfInterestOfType:a3 withHandler:v11];
}

void __94__BRKRoutineManager_fetchLocationsOfInterestWithSingleRetryOfType_routineManager_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 code] == 8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __94__BRKRoutineManager_fetchLocationsOfInterestWithSingleRetryOfType_routineManager_withHandler___block_invoke_cold_1((uint64_t)v7);
    }
    [*(id *)(a1 + 32) fetchLocationsOfInterestOfType:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __94__BRKRoutineManager_fetchLocationsOfInterestWithSingleRetryOfType_routineManager_withHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "+[BRKRoutineManager fetchLocationsOfInterestWithSingleRetryOfType:routineManager:withHandler:]_block_invoke";
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_2399EB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Retrying once %{public}@", (uint8_t *)&v1, 0x16u);
}

@end