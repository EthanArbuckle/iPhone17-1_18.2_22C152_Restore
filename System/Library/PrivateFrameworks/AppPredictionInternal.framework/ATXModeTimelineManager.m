@interface ATXModeTimelineManager
- (id)_formatModeStream:(id)a3;
- (id)_modeTimelineDataFrom:(id)a3 toDate:(id)a4;
- (id)modeFromStartDate:(id)a3 toEndDate:(id)a4;
@end

@implementation ATXModeTimelineManager

- (id)_modeTimelineDataFrom:(id)a3 toDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  v10 = BiomeLibrary();
  v11 = [v10 UserFocus];
  v12 = [v11 InferredMode];
  v13 = objc_msgSend(v12, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v7, v6, 0, 0, 0);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke_28;
  v18[3] = &unk_1E68AF140;
  id v19 = v9;
  id v14 = v9;
  id v15 = (id)[v13 sinkWithCompletion:&__block_literal_global_240 shouldContinue:v18];

  v16 = [(ATXModeTimelineManager *)self _formatModeStream:v14];
  [v8 setModeTimeline:v16];

  return v8;
}

void __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke_cold_1(v2, v4);
    }
  }
}

BOOL __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) count];
  if (v4 <= 0x186A0)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = [v3 eventBody];
    [v5 addObject:v6];
  }
  return v4 < 0x186A1;
}

- (id)_formatModeStream:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_32_3);
}

id __44__ATXModeTimelineManager__formatModeStream___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1D25F6CC0]();
  [v2 modeType];
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  unint64_t v4 = ATXModeToString();
  if ([v4 length])
  {
    v5 = objc_opt_new();
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "modeType"));
    [v5 setObject:v6 forKeyedSubscript:@"mode"];

    [v5 setObject:v4 forKeyedSubscript:@"modeString"];
    id v7 = NSNumber;
    v8 = [v2 absoluteTimestamp];
    [v8 timeIntervalSinceReferenceDate];
    v9 = objc_msgSend(v7, "numberWithDouble:");
    [v5 setObject:v9 forKeyedSubscript:@"startTimestamp"];

    [v2 origin];
    v10 = BMUserFocusInferredModeOriginToString();
    if (v10) {
      [v5 setObject:v10 forKeyedSubscript:@"modeOrigin"];
    }
    [v5 setObject:&stru_1F2740B58 forKeyedSubscript:@"contextVector"];
    [v5 setObject:@"contextstored" forKeyedSubscript:@"process"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)modeFromStartDate:(id)a3 toEndDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = __atxlog_handle_modes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXModeAppUsageManager: request mode timeline", (uint8_t *)&v18, 2u);
  }

  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = (void *)MEMORY[0x1D25F6CC0]();
  v11 = v6;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v12 = v7;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F1C9C8] date];
  }
  v13 = [(ATXModeTimelineManager *)self _modeTimelineDataFrom:v11 toDate:v12];
  id v14 = [v13 dictionaryRepresentation];

  if (v7)
  {
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {

    if (v6) {
      goto LABEL_9;
    }
  }

LABEL_9:
  id v15 = __atxlog_handle_modes();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    [v9 timeIntervalSinceNow];
    int v18 = 134217984;
    double v19 = -v16;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "ATXModeAppUsageManager: request finished (%lf seconds)", (uint8_t *)&v18, 0xCu);
  }

  return v14;
}

void __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeAppUsageManager: Error reading inferred mode stream: %@", (uint8_t *)&v4, 0xCu);
}

@end