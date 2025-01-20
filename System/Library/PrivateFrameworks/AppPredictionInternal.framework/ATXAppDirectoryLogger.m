@interface ATXAppDirectoryLogger
- (id)_retrieveAllUnprocessedEvents;
- (id)_retrieveLastLogProcessedDate;
- (id)_retrieveSessionsFromUnprocessedEvents:(id)a3 lastSessionEndDate:(id *)a4;
- (id)_summarizeSession:(id)a3;
- (void)_retrieveLastLogProcessedDate;
- (void)_storeLastLogProcessedDate:(id)a3;
- (void)_uploadToCoreAnalytics:(id)a3;
- (void)uploadSummariesToCoreAnalyticsWithActivity:(id)a3;
@end

@implementation ATXAppDirectoryLogger

- (id)_retrieveLastLogProcessedDate
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v4 = [v3 objectForKey:@"AppDirectoryLastLogProcessedDate"];
  if (!v4)
  {
    v5 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryLogger _retrieveLastLogProcessedDate](v5);
    }

    v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  }

  return v4;
}

- (void)_storeLastLogProcessedDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (id)[v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v6 setObject:v4 forKey:@"AppDirectoryLastLogProcessedDate"];
}

- (id)_retrieveAllUnprocessedEvents
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = [(ATXAppDirectoryLogger *)self _retrieveLastLogProcessedDate];
  id v5 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryLogger: Processing events since %@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F5B5F8] appDirectoryInteractionStream];
  v7 = +[_ATXDuetHelper sharedInstance];
  v8 = [v7 _queryDuetStreamUnbatched:v6 startDate:v4 endDate:v3 ascending:1 otherPredicates:0 limit:-1 offset:0];

  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_166];

  return v9;
}

uint64_t __54__ATXAppDirectoryLogger__retrieveAllUnprocessedEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 metadata];
  uint64_t v6 = *MEMORY[0x1E4F4B4D8];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4B4D8]];
  v8 = [v4 metadata];

  v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v7 compare:v9];

  return v10;
}

- (id)_retrieveSessionsFromUnprocessedEvents:(id)a3 lastSessionEndDate:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__78;
  v24 = __Block_byref_object_dispose__78;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke;
  v12[3] = &unk_1E68B3C50;
  v15 = v18;
  v16 = v26;
  id v7 = v6;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  v17 = &v20;
  [v8 enumerateObjectsUsingBlock:v12];
  if (a4) {
    *a4 = (id) v21[5];
  }
  v9 = v14;
  id v10 = v7;

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
  return v10;
}

void __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 integerValue];
  if (ATXIsSessionStartedByEvent())
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v6 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke_cold_1(v5, v6);
      }

      goto LABEL_13;
    }
LABEL_12:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_13;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v13 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke_cold_2(v5, v13);
    }

    goto LABEL_12;
  }
  [v5 integerValue];
  if (ATXIsSessionEndedByEvent())
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:");
    [v7 addObject:v8];

    v9 = [v5 metadata];
    uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4B4D8]];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
LABEL_13:
}

- (id)_summarizeSession:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v4 metadata];
  uint64_t v62 = *MEMORY[0x1E4F4B4D8];
  uint64_t v6 = objc_msgSend(v5, "objectForKeyedSubscript:");

  id v7 = objc_opt_new();
  id v8 = v6;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v3;
  v46 = v8;
  uint64_t v60 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v60)
  {
    uint64_t v61 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v73;
    v64 = (void *)*MEMORY[0x1E4F4B4C8];
    v63 = (void *)*MEMORY[0x1E4F4B4D0];
    uint64_t v11 = *MEMORY[0x1E4F4B4B8];
    uint64_t v67 = *MEMORY[0x1E4F4B4C0];
    uint64_t v66 = *MEMORY[0x1E4F4B4E0];
    uint64_t v65 = *MEMORY[0x1E4F4B4E8];
    uint64_t v52 = *MEMORY[0x1E4F4B470];
    uint64_t v51 = *MEMORY[0x1E4F4B498];
    uint64_t v50 = *MEMORY[0x1E4F4B488];
    uint64_t v49 = *MEMORY[0x1E4F4B490];
    double v12 = 0.0;
    uint64_t v48 = *MEMORY[0x1E4F4B4A0];
    double v13 = 0.0;
    double v14 = 0.0;
    uint64_t v47 = *MEMORY[0x1E4F4B480];
    uint64_t v59 = *(void *)v73;
    do
    {
      uint64_t v15 = 0;
      v16 = v8;
      do
      {
        if (*(void *)v73 != v10) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v72 + 1) + 8 * v15);
        v18 = [v17 metadata];
        char v19 = [v18 objectForKeyedSubscript:v62];
        [v19 timeIntervalSinceDate:v16];
        double v21 = v20;

        switch(v9)
        {
          case 0:
          case 2:
          case 9:
            double v14 = v14 + v21;
            break;
          case 1:
            double v13 = v13 + v21;
            break;
          case 7:
            double v12 = v12 + v21;
            break;
          default:
            break;
        }
        if ([v17 integerValue] == 1)
        {
          v56 = [v17 metadata];
          v54 = [v56 objectForKeyedSubscript:v64];
          uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v61);
          v23 = [v64 stringByAppendingString:v22];
          [v7 setObject:v54 forKeyedSubscript:v23];

          v57 = [v17 metadata];
          v24 = [v57 objectForKeyedSubscript:v63];
          id v25 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v61);
          v26 = [v63 stringByAppendingString:v25];
          [v7 setObject:v24 forKeyedSubscript:v26];

          uint64_t v10 = v59;
          ++v61;
        }
        [v17 integerValue];
        if (ATXIsSessionEndedByEvent())
        {
          v55 = v16;
          uint64_t v58 = v15;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          v27 = [v17 metadata];
          v28 = [v27 allKeys];

          uint64_t v29 = [v28 countByEnumeratingWithState:&v68 objects:v76 count:16];
          if (!v29) {
            goto LABEL_30;
          }
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v69;
          while (1)
          {
            uint64_t v32 = 0;
            do
            {
              if (*(void *)v69 != v31) {
                objc_enumerationMutation(v28);
              }
              id v33 = *(id *)(*((void *)&v68 + 1) + 8 * v32);
              if (([v33 isEqualToString:v11] & 1) != 0
                || ([v33 isEqualToString:v67] & 1) != 0
                || ([v33 isEqualToString:v66] & 1) != 0
                || ([v33 isEqualToString:v65] & 1) != 0
                || [v33 isEqualToString:v64])
              {

LABEL_24:
                v34 = [v17 metadata];
                v35 = [v34 objectForKeyedSubscript:v33];
                [v7 setObject:v35 forKeyedSubscript:v33];

                goto LABEL_25;
              }
              int v36 = [v33 isEqualToString:v63];

              if (v36) {
                goto LABEL_24;
              }
LABEL_25:
              ++v32;
            }
            while (v30 != v32);
            uint64_t v37 = [v28 countByEnumeratingWithState:&v68 objects:v76 count:16];
            uint64_t v30 = v37;
            if (!v37)
            {
LABEL_30:

              v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "integerValue"));
              [v7 setObject:v38 forKeyedSubscript:v52];

              v39 = [NSNumber numberWithDouble:v12];
              [v7 setObject:v39 forKeyedSubscript:v51];

              v40 = [NSNumber numberWithDouble:v13];
              [v7 setObject:v40 forKeyedSubscript:v50];

              v41 = [NSNumber numberWithDouble:v14];
              [v7 setObject:v41 forKeyedSubscript:v49];

              v42 = [NSNumber numberWithInteger:v61];
              [v7 setObject:v42 forKeyedSubscript:v48];

              v43 = [NSNumber numberWithDouble:v21];
              [v7 setObject:v43 forKeyedSubscript:v47];

              uint64_t v15 = v58;
              uint64_t v10 = v59;
              v16 = v55;
              break;
            }
          }
        }
        v44 = [v17 metadata];
        id v8 = [v44 objectForKeyedSubscript:v62];

        uint64_t v9 = [v17 integerValue];
        ++v15;
        v16 = v8;
      }
      while (v15 != v60);
      uint64_t v60 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v60);
  }

  return v7;
}

- (void)_uploadToCoreAnalytics:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = AnalyticsSendEventLazy();
  id v5 = __atxlog_handle_app_library();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryLogger: Attached log successfully uploaded to CoreAnalytics - %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[ATXAppDirectoryLogger _uploadToCoreAnalytics:](v6);
  }
}

id __48__ATXAppDirectoryLogger__uploadToCoreAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)uploadSummariesToCoreAnalyticsWithActivity:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXAppDirectoryLogger *)self _retrieveAllUnprocessedEvents];
  if ([v4 didDefer])
  {
    uint64_t v6 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryLogger: deferring uploading of logs to Core Analytics after merely fetching unprocessed events", buf, 2u);
    }
  }
  else
  {
    id v26 = 0;
    id v7 = [(ATXAppDirectoryLogger *)self _retrieveSessionsFromUnprocessedEvents:v5 lastSessionEndDate:&v26];
    uint64_t v6 = v26;
    if ([v4 didDefer])
    {
      id v8 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryLogger: deferring uploading of logs to Core Analytics after merely fetching sessions", buf, 2u);
      }
    }
    else
    {
      if ([v5 count] && v6) {
        [(ATXAppDirectoryLogger *)self _storeLastLogProcessedDate:v6];
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        v18 = v7;
        char v19 = v6;
        double v20 = v5;
        id v21 = v4;
        uint64_t v11 = *(void *)v23;
        uint64_t v12 = *MEMORY[0x1E4F4B478];
        char v13 = 1;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v15 = -[ATXAppDirectoryLogger _summarizeSession:](self, "_summarizeSession:", *(void *)(*((void *)&v22 + 1) + 8 * i), v18, v19, v20, v21);
            v16 = [NSNumber numberWithBool:v13 & 1];
            [v15 setObject:v16 forKeyedSubscript:v12];

            v17 = __atxlog_handle_app_library();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v15;
              _os_log_debug_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEBUG, "ATXAppDirectoryLogger: Uploading session %@", buf, 0xCu);
            }

            [(ATXAppDirectoryLogger *)self _uploadToCoreAnalytics:v15];
            char v13 = 0;
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
          char v13 = 0;
        }
        while (v10);
        id v5 = v20;
        id v4 = v21;
        id v7 = v18;
        uint64_t v6 = v19;
      }
    }
  }
}

- (void)_retrieveLastLogProcessedDate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXAppDirectoryLogger: Failed to retrieve date of last log processed.", v1, 2u);
}

void __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 metadata];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4B4D8]];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXAppDirectoryLogger: Malformed event sequence - session start seen at %@ seen before previous session ended", (uint8_t *)&v5, 0xCu);
}

void __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 metadata];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4B4D8]];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXAppDirectoryLogger: Event sequence - event at %@ seen before session start. Expected due to current SB behavior - will result in some inaccuracy in time data.", (uint8_t *)&v5, 0xCu);
}

- (void)_uploadToCoreAnalytics:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXAppDirectoryLogger: Logging failure - event not enabled", v1, 2u);
}

@end