@interface ATXProactiveSuggestionShadowLoggerXPCScheduler
- (id)shadowLoggingURLPathWithFileName:(id)a3;
- (void)shadowLogWithXPCActivity:(id)a3;
@end

@implementation ATXProactiveSuggestionShadowLoggerXPCScheduler

- (id)shadowLoggingURLPathWithFileName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F4B650];
  id v4 = a3;
  v5 = [v3 feedbackRootDirectory];
  v6 = [v5 stringByAppendingPathComponent:@"shadowLogging"];

  v7 = [v6 stringByAppendingPathComponent:v4];

  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];

  return v8;
}

- (void)shadowLogWithXPCActivity:(id)a3
{
  v49[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  v33 = [MEMORY[0x1E4F1C9C8] now];
  v48[0] = &unk_1F27F2100;
  v48[1] = &unk_1F27F2130;
  v49[0] = &unk_1F27F37E0;
  v49[1] = &unk_1F27F37F8;
  v48[2] = &unk_1F27F2118;
  v48[3] = &unk_1F27F2160;
  v49[2] = &unk_1F27F3810;
  v49[3] = &unk_1F27F3828;
  v48[4] = &unk_1F27F2178;
  v48[5] = &unk_1F27F2190;
  v49[4] = &unk_1F27F3840;
  v49[5] = &unk_1F27F3858;
  v48[6] = &unk_1F27F21A8;
  v48[7] = &unk_1F27F21C0;
  v49[6] = &unk_1F27F3870;
  v49[7] = &unk_1F27F3888;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    unint64_t v9 = 0x1E4F93000uLL;
    v30 = v5;
    v31 = v4;
    uint64_t v27 = *(void *)v41;
    do
    {
      uint64_t v10 = 0;
      uint64_t v28 = v7;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
        uint64_t v12 = [v11 integerValue];
        if ((unint64_t)(v12 - 49) < 0xFFFFFFFFFFFFFFD0) {
          goto LABEL_24;
        }
        uint64_t v29 = v10;
        uint64_t v32 = v12;
        v35 = [*(id *)(v9 + 2368) clientModelIdFromClientModelType:v12];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v13 = [v4 objectForKeyedSubscript:v11];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (!v14) {
          goto LABEL_23;
        }
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if ([v3 didDefer])
            {

              v5 = v30;
              id v4 = v31;
              goto LABEL_28;
            }
            uint64_t v19 = [v18 integerValue];
            if ((unint64_t)(v19 - 11) >= 0xFFFFFFFFFFFFFFF6)
            {
              uint64_t v20 = v19;
              if (v19 == 1)
              {
                v21 = off_1E68A8A80;
              }
              else
              {
                if (v19 != 2) {
                  continue;
                }
                v21 = off_1E68A8A78;
              }
              v22 = (void *)[objc_alloc(*v21) initWithClientModelType:v32];
              v23 = (void *)[objc_alloc(MEMORY[0x1E4F93988]) initWithDataSource:v22];
              v24 = [v23 computeResultFromStartDate:v34 toEndDate:v33];
              v25 = [v24 asCoreAnalyticsMessageWithModelId:v35 executableType:v20];
              v26 = __atxlog_handle_metrics();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v25;
                _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "Sending shadow metrics event to CoreAnalytics %@", buf, 0xCu);
              }

              AnalyticsSendEvent();
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
          if (v15) {
            continue;
          }
          break;
        }
LABEL_23:

        v5 = v30;
        id v4 = v31;
        uint64_t v8 = v27;
        uint64_t v7 = v28;
        unint64_t v9 = 0x1E4F93000;
        uint64_t v10 = v29;
LABEL_24:
        ++v10;
      }
      while (v10 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v7);
  }
LABEL_28:
}

@end