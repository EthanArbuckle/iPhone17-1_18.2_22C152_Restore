@interface ATXModeConfigurationUIFlowMetricLogger
- (ATXModeConfigurationUIFlowMetricLogger)initWithContactStore:(id)a3;
- (ATXModeConfigurationUIFlowMetricLogger)initWithFocusModeSignalsLogger:(id)a3 contactStore:(id)a4;
- (ATXModeConfigurationUIFlowMetricLogger)initWithModeConfigurationUIFlowLoggingBiomeStream:(id)a3 focusModeSignalsLogger:(id)a4 contactStore:(id)a5;
- (id)modeConfigurationUIFlowBookmark;
- (unint64_t)numEntitiesAdded:(id)a3;
- (unint64_t)numEntitiesRemoved:(id)a3;
- (unint64_t)numSuggestedEntitiesAdded:(id)a3;
- (unint64_t)numSuggestedEntitiesRemoved:(id)a3;
- (void)logCompletion:(id)a3;
- (void)logModeConfigurationUIFlowMetric;
- (void)logModeConfigurationUIFlowMetricWithXPCActivity:(id)a3;
- (void)writeBookmarkToFile:(id)a3;
@end

@implementation ATXModeConfigurationUIFlowMetricLogger

- (ATXModeConfigurationUIFlowMetricLogger)initWithContactStore:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(ATXModeConfigurationUIFlowMetricLogger *)self initWithModeConfigurationUIFlowLoggingBiomeStream:v5 focusModeSignalsLogger:v6 contactStore:v4];

  return v7;
}

- (ATXModeConfigurationUIFlowMetricLogger)initWithFocusModeSignalsLogger:(id)a3 contactStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [(ATXModeConfigurationUIFlowMetricLogger *)self initWithModeConfigurationUIFlowLoggingBiomeStream:v8 focusModeSignalsLogger:v7 contactStore:v6];

  return v9;
}

- (ATXModeConfigurationUIFlowMetricLogger)initWithModeConfigurationUIFlowLoggingBiomeStream:(id)a3 focusModeSignalsLogger:(id)a4 contactStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXModeConfigurationUIFlowMetricLogger;
  v12 = [(ATXModeConfigurationUIFlowMetricLogger *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modeConfigurationUIFlowLoggingBiomeStream, a3);
    objc_storeStrong((id *)&v13->_focusModeSignalsLogger, a4);
    v14 = [[ATXFocusModeContactsMetricLogger alloc] initWithContactStore:v11];
    focusModeContactsLogger = v13->_focusModeContactsLogger;
    v13->_focusModeContactsLogger = v14;
  }
  return v13;
}

- (void)logModeConfigurationUIFlowMetric
{
}

- (id)modeConfigurationUIFlowBookmark
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v3 = [MEMORY[0x1E4F4B650] bookmarksPathFile:@"modeConfigurationUIFlowBookmark"];
  id v4 = (void *)[v2 initFileURLWithPath:v3];

  v5 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:v4 maxFileSize:1000000 versionNumber:&unk_1F27F20E8];
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4B618]);
    id v7 = [NSNumber numberWithUnsignedInt:1];
    v5 = (void *)[v6 initWithURLPath:v4 versionNumber:v7 bookmark:0 metadata:0];
  }
  return v5;
}

- (void)logCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 state];
  v5 = __atxlog_handle_hero();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = [v3 error];
      id v8 = [v7 description];
      int v9 = 136315138;
      uint64_t v10 = [v8 UTF8String];
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Error in receiving events from modeConfigurationUIFlowLogging stream: %s\n", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v6)
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Received all events from modeConfigurationUIFlowLogging stream\n", (uint8_t *)&v9, 2u);
  }
}

- (void)logModeConfigurationUIFlowMetricWithXPCActivity:(id)a3
{
  id v4 = a3;
  v5 = [(ATXModeConfigurationUIFlowMetricLogger *)self modeConfigurationUIFlowBookmark];
  modeConfigurationUIFlowLoggingBiomeStream = self->_modeConfigurationUIFlowLoggingBiomeStream;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v8 = [(ATXModeConfigurationUIFlowLoggingBiomeStream *)modeConfigurationUIFlowLoggingBiomeStream publisherFromStartTime:v7 + -1209600.0];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  int v9 = [v5 bookmark];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__ATXModeConfigurationUIFlowMetricLogger_logModeConfigurationUIFlowMetricWithXPCActivity___block_invoke;
  v16[3] = &unk_1E68B4A60;
  v16[4] = self;
  v18 = v19;
  id v10 = v5;
  id v17 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__ATXModeConfigurationUIFlowMetricLogger_logModeConfigurationUIFlowMetricWithXPCActivity___block_invoke_22;
  v13[3] = &unk_1E68AC778;
  v13[4] = self;
  id v11 = v4;
  id v14 = v11;
  v15 = v19;
  id v12 = (id)[v8 drivableSinkWithBookmark:v9 completion:v16 shouldContinue:v13];

  _Block_object_dispose(v19, 8);
}

void __90__ATXModeConfigurationUIFlowMetricLogger_logModeConfigurationUIFlowMetricWithXPCActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) logCompletion:a2];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    BOOL v6 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", (uint8_t *)&v9, 0xCu);
    }
  }
  [*(id *)(a1 + 40) setBookmark:v5];
  [*(id *)(a1 + 32) writeBookmarkToFile:*(void *)(a1 + 40)];
}

uint64_t __90__ATXModeConfigurationUIFlowMetricLogger_logModeConfigurationUIFlowMetricWithXPCActivity___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = objc_opt_new();
  id v5 = [v3 dndModeUUID];
  BOOL v6 = [v5 UUIDString];
  [v4 setModeUUID:v6];

  double v7 = [MEMORY[0x1E4F4AF78] sharedInstance];
  id v8 = [v3 dndModeUUID];
  [v7 atxModeForDNDMode:v8];
  int v9 = ATXModeToString();
  [v4 setModeSemanticType:v9];

  [v3 modeConfigurationUI];
  id v10 = ATXModeConfigurationUIToString();
  [v4 setModeConfigurationUI:v10];

  if ([v3 modeConfigurationEntityType])
  {
    if ([v3 modeConfigurationEntityType] == 1)
    {
      objc_msgSend(v4, "setNumContactsAdded:", objc_msgSend(*(id *)(a1 + 32), "numEntitiesAdded:", v3));
      objc_msgSend(v4, "setNumContactsRemoved:", objc_msgSend(*(id *)(a1 + 32), "numEntitiesRemoved:", v3));
      uint64_t v11 = [v3 suggestedEntityIdentifiers];
      objc_msgSend(v4, "setNumContactsSuggested:", objc_msgSend(v11, "count"));

      id v12 = [v3 currentEntityIdentifiers];
      objc_msgSend(v4, "setNumExistingAllowedContacts:", objc_msgSend(v12, "count"));

      objc_msgSend(v4, "setNumSuggestedContactsAdded:", objc_msgSend(*(id *)(a1 + 32), "numSuggestedEntitiesAdded:", v3));
      objc_msgSend(v4, "setNumSuggestedContactsRemoved:", objc_msgSend(*(id *)(a1 + 32), "numSuggestedEntitiesRemoved:", v3));
    }
  }
  else
  {
    objc_msgSend(v4, "setNumAppsAdded:", objc_msgSend(*(id *)(a1 + 32), "numEntitiesAdded:", v3));
    objc_msgSend(v4, "setNumAppsRemoved:", objc_msgSend(*(id *)(a1 + 32), "numEntitiesRemoved:", v3));
    v13 = [v3 suggestedEntityIdentifiers];
    objc_msgSend(v4, "setNumAppsSuggested:", objc_msgSend(v13, "count"));

    id v14 = [v3 currentEntityIdentifiers];
    objc_msgSend(v4, "setNumExistingAllowedApps:", objc_msgSend(v14, "count"));

    objc_msgSend(v4, "setNumSuggestedAppsAdded:", objc_msgSend(*(id *)(a1 + 32), "numSuggestedEntitiesAdded:", v3));
    objc_msgSend(v4, "setNumSuggestedAppsRemoved:", objc_msgSend(*(id *)(a1 + 32), "numSuggestedEntitiesRemoved:", v3));
  }
  [v4 logToCoreAnalytics];
  [*(id *)(*(void *)(a1 + 32) + 16) logFocusModeAppSignalsWithModeConfigurationUIFlowLoggingEvent:v3 xpcActivity:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) logFocusModeContactSignalsWithModeConfigurationUIFlowLoggingEvent:v3 xpcActivity:*(void *)(a1 + 40)];
  int v15 = [*(id *)(a1 + 40) didDefer];
  if (v15) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t v16 = v15 ^ 1u;

  return v16;
}

- (void)writeBookmarkToFile:(id)a3
{
  id v6 = 0;
  [a3 saveBookmarkWithError:&v6];
  id v4 = v6;
  if (v4)
  {
    id v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ATXDigestOnboardingAppSelectionMetricsLogger *)(uint64_t)self writeBookmarkToFile:v5];
    }
  }
}

- (unint64_t)numEntitiesAdded:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [v3 previousEntityIdentifiers];
  id v6 = (void *)[v4 initWithArray:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v7 = objc_msgSend(v3, "currentEntityIdentifiers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 += [v6 containsObject:*(void *)(*((void *)&v14 + 1) + 8 * i)] ^ 1;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (unint64_t)numEntitiesRemoved:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [v3 currentEntityIdentifiers];
  id v6 = (void *)[v4 initWithArray:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v7 = objc_msgSend(v3, "previousEntityIdentifiers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 += [v6 containsObject:*(void *)(*((void *)&v14 + 1) + 8 * i)] ^ 1;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (unint64_t)numSuggestedEntitiesAdded:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [v3 suggestedEntityIdentifiers];
  id v6 = (void *)[v4 initWithArray:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = [v3 previousEntityIdentifiers];
  uint64_t v9 = (void *)[v7 initWithArray:v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v10 = objc_msgSend(v3, "currentEntityIdentifiers", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (([v9 containsObject:v16] & 1) == 0) {
          v13 += [v6 containsObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (unint64_t)numSuggestedEntitiesRemoved:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F4AF78] sharedInstance];
  id v7 = [v3 dndModeUUID];
  uint64_t v8 = [v6 atxModeForDNDMode:v7];

  if ([v3 modeConfigurationEntityType])
  {
    if ([v3 modeConfigurationEntityType] != 1) {
      goto LABEL_19;
    }
    uint64_t v9 = +[ATXModeEntityScorerServer sharedInstance];
    unint64_t v10 = [v9 rankedContactsForMode:v8 options:0];
    uint64_t v11 = [v4 recommendedAllowedContactsForContactScores:v10];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = [*(id *)(*((void *)&v38 + 1) + 8 * i) identifier];
          [v5 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v12 = [v4 recommendedAllowedAppsForMode:v8];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v18 = [v12 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v12);
          }
          v22 = [*(id *)(*((void *)&v42 + 1) + 8 * j) identifier];
          [v5 addObject:v22];
        }
        uint64_t v19 = [v12 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v19);
    }
  }

LABEL_19:
  id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v24 = [v3 currentEntityIdentifiers];
  v25 = (void *)[v23 initWithArray:v24];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v26 = objc_msgSend(v3, "previousEntityIdentifiers", 0);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    unint64_t v29 = 0;
    uint64_t v30 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v26);
        }
        uint64_t v32 = *(void *)(*((void *)&v34 + 1) + 8 * k);
        if (([v25 containsObject:v32] & 1) == 0) {
          v29 += [v5 containsObject:v32];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v28);
  }
  else
  {
    unint64_t v29 = 0;
  }

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusModeContactsLogger, 0);
  objc_storeStrong((id *)&self->_focusModeSignalsLogger, 0);
  objc_storeStrong((id *)&self->_modeConfigurationUIFlowLoggingBiomeStream, 0);
}

@end