@interface ATXChangeAlarmBeforeHolidayDataSource
- (ATXChangeAlarmBeforeHolidayDataSource)initWithDevice:(id)a3;
- (void)predictedBedTimeWithCallback:(id)a3;
- (void)scheduledBedTimeWithCallback:(id)a3;
@end

@implementation ATXChangeAlarmBeforeHolidayDataSource

- (ATXChangeAlarmBeforeHolidayDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXChangeAlarmBeforeHolidayDataSource;
  v6 = [(ATXChangeAlarmBeforeHolidayDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)scheduledBedTimeWithCallback:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, uint64_t, void))a3;
  v4 = +[ATXHeuristicDevice sharedAlarmManager];
  id v5 = [v4 sleepAlarmSync];
  char v6 = [v5 isEnabled];
  v7 = __atxlog_handle_heuristic();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v10 = 134218240;
      uint64_t v11 = [v5 bedtimeHour];
      __int16 v12 = 2048;
      uint64_t v13 = [v5 bedtimeMinute];
      _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "changeAlarmBeforeHoliday: Found scheduled bed time: %ld:%ld", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3600 * objc_msgSend(v5, "bedtimeHour") + 60 * objc_msgSend(v5, "bedtimeMinute"));
    v3[2](v3, v9, 0);

    v3 = (void (**)(id, uint64_t, void))v9;
  }
  else
  {
    if (v8)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "changeAlarmBeforeHoliday: No scheduled bed time", (uint8_t *)&v10, 2u);
    }

    v3[2](v3, (uint64_t)&unk_1F2727470, 0);
  }
}

- (void)predictedBedTimeWithCallback:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v6 = [v5 integerForKey:*MEMORY[0x1E4F4B768]];
  if (v6)
  {
    v7 = [NSNumber numberWithInteger:v6];
    v3[2](v3, v7, 0);
  }
  else
  {
    BOOL v8 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "changeAlarmBeforeHoliday: No cached predicted bed time; getting predicted bed time",
        buf,
        2u);
    }

    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    uint64_t v9 = (void *)getATXSleepSuggestionServerClass_softClass;
    uint64_t v22 = getATXSleepSuggestionServerClass_softClass;
    if (!getATXSleepSuggestionServerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __getATXSleepSuggestionServerClass_block_invoke;
      v17 = &unk_1E68A4E08;
      v18 = &v19;
      __getATXSleepSuggestionServerClass_block_invoke((uint64_t)buf);
      uint64_t v9 = (void *)v20[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v19, 8);
    uint64_t v11 = [v10 sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__ATXChangeAlarmBeforeHolidayDataSource_predictedBedTimeWithCallback___block_invoke;
    v12[3] = &unk_1E68A4DE0;
    uint64_t v13 = v3;
    [v11 predictedSleepSuggestionWithCompletionHandler:v12];
  }
}

void __70__ATXChangeAlarmBeforeHolidayDataSource_predictedBedTimeWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 occurrence];
  v7 = [v6 bedtimeComponents];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", 3600 * objc_msgSend(v7, "hour") + 60 * objc_msgSend(v7, "minute"));
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    id v10 = __atxlog_handle_heuristic();
    uint64_t v11 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __70__ATXChangeAlarmBeforeHolidayDataSource_predictedBedTimeWithCallback___block_invoke_cold_1((uint64_t)v5, v11);
      }

      __int16 v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "changeAlarmBeforeHoliday: No suggested sleep schedule available", v13, 2u);
      }

      __int16 v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v12();
  }
}

- (void).cxx_destruct
{
}

void __70__ATXChangeAlarmBeforeHolidayDataSource_predictedBedTimeWithCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "changeAlarmBeforeHoliday: Failed to get suggested sleep schedule with error: %@", (uint8_t *)&v2, 0xCu);
}

@end