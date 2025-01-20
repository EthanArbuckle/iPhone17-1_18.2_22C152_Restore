@interface ATXAppDailyDose
@end

@implementation ATXAppDailyDose

void __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = v2[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_2;
  block[3] = &unk_1E68AF230;
  v5 = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  dispatch_async(v3, block);
}

void __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _loadHistoricalDoseFrom:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 64);
    if (v2)
    {
      v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = v4[2];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_3;
    v6[3] = &unk_1E68AF208;
    id v7 = v4;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    dispatch_async(v5, v6);
  }
}

void __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_4;
  v4[3] = &unk_1E68AB618;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _doTrainingOn:v2 timeZone:v3 completion:v4];
}

uint64_t __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __34___ATXAppDailyDose_getDoseForApp___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

uint64_t __41___ATXAppDailyDose_getCurrentDoseForApp___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 24) currentDoseFor:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

void __25___ATXAppDailyDose_train__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 todayWithTimeZone:v4];
  [v2 _doTrainingOn:v3 timeZone:v4 completion:0];
}

void __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v32 = objc_opt_new();
  uint64_t v2 = objc_opt_new();
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v29 = uint64_t v30 = a1;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "getAppLaunchesBetweenStartDate:endDate:batchSize:");
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v44 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1D25F6CC0]();
        id v9 = [v7 bundleId];
        id v10 = [v2 objectForKeyedSubscript:v9];

        if (v10)
        {
          v11 = [v7 startDate];
          v12 = [v7 endDate];
          [v10 addDuration:v11 endDate:v12];
        }
        else
        {
          v13 = [_ATXAppHistoricalAverageDose alloc];
          v11 = [v7 startDate];
          v12 = [v7 endDate];
          v14 = [(_ATXAppHistoricalAverageDose *)v13 initWith:v11 endDate:v12 timeZone:*(void *)(v30 + 48) alpha:*(double *)(*(void *)(v30 + 32) + 64)];
          v15 = [v7 bundleId];
          [v2 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v4);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v2;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        v22 = [v16 objectForKeyedSubscript:v21];
        [v22 skipTo:*(void *)(v30 + 40)];
        v23 = [v22 movingAverage];
        [v32 setObject:v23 forKeyedSubscript:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v18);
  }

  uint64_t v24 = *(void *)(v30 + 32);
  v25 = *(NSObject **)(v24 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke_2;
  block[3] = &unk_1E68AF2A8;
  void block[4] = v24;
  id v34 = v32;
  id v35 = *(id *)(v30 + 40);
  id v26 = *(id *)(v30 + 64);
  uint64_t v27 = *(void *)(v30 + 72);
  id v37 = v26;
  uint64_t v38 = v27;
  id v36 = *(id *)(v30 + 56);
  id v28 = v32;
  dispatch_async(v25, block);
}

void __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke_3;
  v5[3] = &unk_1E68AF280;
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  id v7 = v3;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 56);
  [v2 _writeHistoricalDoseWithCompletion:v5];
}

id __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = __atxlog_handle_default();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    int v7 = 136446210;
    uint64_t v8 = "_ATXAppDailyDose";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", (uint8_t *)&v7, 0xCu);
  }

  return self;
}

uint64_t __57___ATXAppDailyDose_addLaunchForBundleId_date_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[3];
  uint64_t v4 = [v2 now];
  LODWORD(v3) = [v3 isExpiredAt:v4];

  if (v3) {
    [*(id *)(a1 + 32) _backfillAppDurationMapDBForToday];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 48);
  if (v6)
  {
    uint64_t v7 = *(void *)(v5 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = v6;
    [(id)v5 _recordAppDurationForApp:v9 withStartTime:v7 andEndTime:v8];

    uint64_t v5 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v5 + 48), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

void __56___ATXAppDailyDose__asyncStopAppUsageAtDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    id v3 = v2;
    id v4 = *(id *)(*(void *)(a1 + 32) + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = 0;

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(NSObject **)(v9 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56___ATXAppDailyDose__asyncStopAppUsageAtDate_completion___block_invoke_2;
    block[3] = &unk_1E68AF230;
    void block[4] = v9;
    id v16 = v3;
    id v17 = v4;
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v11 = v4;
    id v12 = v3;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      v14 = *(void (**)(void))(v13 + 16);
      v14();
    }
  }
}

uint64_t __56___ATXAppDailyDose__asyncStopAppUsageAtDate_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _recordAppDurationForApp:*(void *)(a1 + 40) withStartTime:*(void *)(a1 + 48) andEndTime:*(void *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __55___ATXAppDailyDose__writeHistoricalDoseWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[_ATXAppDailyDose _defaultHistoricalDosePath];
  id v14 = 0;
  char v4 = [v2 writeToFile:v3 options:1073741825 error:&v14];
  id v5 = v14;

  if ((v4 & 1) == 0)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __55___ATXAppDailyDose__writeHistoricalDoseWithCompletion___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

void __36___ATXAppDailyDose_previousBundleId__block_invoke(uint64_t a1)
{
}

void __55___ATXAppDailyDose__writeHistoricalDoseWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end