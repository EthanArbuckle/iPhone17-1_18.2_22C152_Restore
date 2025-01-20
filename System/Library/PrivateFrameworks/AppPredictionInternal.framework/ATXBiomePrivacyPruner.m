@interface ATXBiomePrivacyPruner
- (void)pruneActivitySuggestionFeedbackStreamWithActivity:(id)a3;
- (void)pruneAllStreamsWithActivity:(id)a3;
- (void)pruneAppLaunchInferredModeStreamWithActivity:(id)a3;
- (void)pruneBlendingStreamsWithActivity:(id)a3;
- (void)pruneContextHeuristicsStreamWithActivity:(id)a3;
- (void)pruneDigestOnboardingAppSelectionLoggingStreamWithActivity:(id)a3;
- (void)pruneDigestOnboardingLoggingStreamWithActivity:(id)a3;
- (void)pruneDigestOnboardingSuggestionLoggingStreamWithActivity:(id)a3;
- (void)pruneERMStreamWithActivity:(id)a3;
- (void)pruneFaceGalleryStreamWithActivity:(id)a3;
- (void)pruneLightweightClientModelCacheUpdatesStreamWithActivity:(id)a3;
- (void)pruneLocationStreamWithActivity:(id)a3;
- (void)pruneMissedNotificationRankingStreamWithActivity:(id)a3;
- (void)pruneModeConfigurationUIFlowLoggingStreamWithActivity:(id)a3;
- (void)pruneNotificationDigestStreamWithActivity:(id)a3;
- (void)pruneNotificationEventStreamWithActivity:(id)a3;
- (void)pruneNotificationGroupEventStreamWithActivity:(id)a3;
- (void)pruneNotificationSuggestionInteractionStreamWithActivity:(id)a3;
- (void)pruneNotificationSuggestionStreamWithActivity:(id)a3;
- (void)prunePredictionContextStreamWithActivity:(id)a3;
- (void)prunePrivateStreamWithStreamIdentifier:(id)a3 activity:(id)a4;
- (void)pruneProactiveSuggestionUIFeedbackResultStreamWithActivity:(id)a3;
- (void)pruneSpotlightUIStreamWithActivity:(id)a3;
- (void)pruneWithStreamIdentifier:(id)a3 activity:(id)a4 config:(id)a5 endTime:(double)a6;
@end

@implementation ATXBiomePrivacyPruner

- (void)pruneAllStreamsWithActivity:(id)a3
{
  id v4 = a3;
  [(ATXBiomePrivacyPruner *)self pruneBlendingStreamsWithActivity:v4];
  if (([v4 didDefer] & 1) == 0)
  {
    [(ATXBiomePrivacyPruner *)self prunePredictionContextStreamWithActivity:v4];
    if (([v4 didDefer] & 1) == 0)
    {
      [(ATXBiomePrivacyPruner *)self pruneContextHeuristicsStreamWithActivity:v4];
      if (([v4 didDefer] & 1) == 0)
      {
        [(ATXBiomePrivacyPruner *)self pruneSpotlightUIStreamWithActivity:v4];
        if (([v4 didDefer] & 1) == 0)
        {
          [(ATXBiomePrivacyPruner *)self pruneLocationStreamWithActivity:v4];
          if (([v4 didDefer] & 1) == 0)
          {
            [(ATXBiomePrivacyPruner *)self pruneProactiveSuggestionUIFeedbackResultStreamWithActivity:v4];
            if (([v4 didDefer] & 1) == 0)
            {
              [(ATXBiomePrivacyPruner *)self pruneLightweightClientModelCacheUpdatesStreamWithActivity:v4];
              if (([v4 didDefer] & 1) == 0)
              {
                [(ATXBiomePrivacyPruner *)self pruneActivitySuggestionFeedbackStreamWithActivity:v4];
                if (([v4 didDefer] & 1) == 0)
                {
                  [(ATXBiomePrivacyPruner *)self pruneERMStreamWithActivity:v4];
                  if (([v4 didDefer] & 1) == 0)
                  {
                    [(ATXBiomePrivacyPruner *)self pruneNotificationDigestStreamWithActivity:v4];
                    if (([v4 didDefer] & 1) == 0)
                    {
                      [(ATXBiomePrivacyPruner *)self pruneMissedNotificationRankingStreamWithActivity:v4];
                      if (([v4 didDefer] & 1) == 0)
                      {
                        [(ATXBiomePrivacyPruner *)self pruneNotificationEventStreamWithActivity:v4];
                        if (([v4 didDefer] & 1) == 0)
                        {
                          [(ATXBiomePrivacyPruner *)self pruneNotificationGroupEventStreamWithActivity:v4];
                          if (([v4 didDefer] & 1) == 0)
                          {
                            [(ATXBiomePrivacyPruner *)self pruneNotificationSuggestionStreamWithActivity:v4];
                            if (([v4 didDefer] & 1) == 0)
                            {
                              [(ATXBiomePrivacyPruner *)self pruneNotificationSuggestionInteractionStreamWithActivity:v4];
                              if (([v4 didDefer] & 1) == 0)
                              {
                                [(ATXBiomePrivacyPruner *)self pruneModeConfigurationUIFlowLoggingStreamWithActivity:v4];
                                if (([v4 didDefer] & 1) == 0)
                                {
                                  [(ATXBiomePrivacyPruner *)self pruneDigestOnboardingSuggestionLoggingStreamWithActivity:v4];
                                  if (([v4 didDefer] & 1) == 0)
                                  {
                                    [(ATXBiomePrivacyPruner *)self pruneDigestOnboardingLoggingStreamWithActivity:v4];
                                    if (([v4 didDefer] & 1) == 0)
                                    {
                                      [(ATXBiomePrivacyPruner *)self pruneDigestOnboardingAppSelectionLoggingStreamWithActivity:v4];
                                      if (([v4 didDefer] & 1) == 0)
                                      {
                                        [(ATXBiomePrivacyPruner *)self pruneAppLaunchInferredModeStreamWithActivity:v4];
                                        if (([v4 didDefer] & 1) == 0) {
                                          [(ATXBiomePrivacyPruner *)self pruneFaceGalleryStreamWithActivity:v4];
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)pruneBlendingStreamsWithActivity:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = objc_opt_new();
  v6 = [v5 streamIdentifiers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D25F6CC0]();
        v13 = objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfig");
        [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:v11 activity:v4 config:v13 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  v14 = objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfig");
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"homeScreen" activity:v4 config:v14 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v15 = objc_opt_new();
  v16 = objc_msgSend(v15, "streamIdentifiers", 0);

  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1D25F6CC0]();
        [(ATXBiomePrivacyPruner *)self prunePrivateStreamWithStreamIdentifier:v21 activity:v4];
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  [(ATXBiomePrivacyPruner *)self prunePrivateStreamWithStreamIdentifier:@"blending" activity:v4];
  [(ATXBiomePrivacyPruner *)self prunePrivateStreamWithStreamIdentifier:@"clientModel" activity:v4];
}

- (void)prunePredictionContextStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"predictionContext" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneContextHeuristicsStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"contextHeuristics" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneSpotlightUIStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"spotlightUI" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneLocationStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"location" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -172800.0];
}

- (void)pruneProactiveSuggestionUIFeedbackResultStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"proactiveSuggestionUIFeedbackResultStreamWriterBookmarkURL" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneLightweightClientModelCacheUpdatesStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"lightweightClientModelCacheUpdates" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneActivitySuggestionFeedbackStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"ActivitySuggestionFeedback" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneERMStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"ERM" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneNotificationDigestStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"notificationDigestLoggingEvents" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -1209600.0];
}

- (void)pruneMissedNotificationRankingStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"missedNotificationRankingLoggingEvent" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -1209600.0];
}

- (void)pruneNotificationEventStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"userNotificationEvents" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneNotificationGroupEventStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"notificationGroupEvent" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneNotificationSuggestionStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"notificationSuggestion" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneNotificationSuggestionInteractionStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"notificationSuggestionInteraction" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneAppLaunchInferredModeStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"appLaunchInferredMode" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneModeConfigurationUIFlowLoggingStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"modeConfigurationUIFlowLoggingEvent" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneDigestOnboardingSuggestionLoggingStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"digestOnboardingSuggestionLoggingEvent" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneDigestOnboardingLoggingStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"digestOnboardingLoggingEvent" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneDigestOnboardingAppSelectionLoggingStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"digestOnboardingAppSelectionLoggingEvent" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)pruneFaceGalleryStreamWithActivity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F50278];
  id v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:@"faceGallery" activity:v5 config:v6 endTime:CFAbsoluteTimeGetCurrent() + -2419200.0];
}

- (void)prunePrivateStreamWithStreamIdentifier:(id)a3 activity:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F50278];
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v6, "atx_storeConfig");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXBiomePrivacyPruner *)self pruneWithStreamIdentifier:v8 activity:v7 config:v9 endTime:CFAbsoluteTimeGetCurrent() + -172800.0];
}

- (void)pruneWithStreamIdentifier:(id)a3 activity:(id)a4 config:(id)a5 endTime:(double)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = __atxlog_handle_default();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v9;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Pruning stream identifier: %@ based on max size", buf, 0xCu);
  }

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50288]) initWithStream:v9 permission:2 config:v11];
  [v13 pruneStreamToMaxStreamSizeInBytes:*MEMORY[0x1E4F4B730]];
  v14 = __atxlog_handle_default();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a6;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Pruning stream identifier: %@ based on endTime: %f", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v34 = 0;
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F50290]) initWithStream:v9 config:v11];
  v16 = (void *)MEMORY[0x1D25F6CC0]();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__ATXBiomePrivacyPruner_pruneWithStreamIdentifier_activity_config_endTime___block_invoke;
  v28[3] = &unk_1E68AE4F0;
  long long v30 = buf;
  id v17 = v10;
  id v29 = v17;
  [v15 removeEventsFrom:1 to:v28 reason:0.0 usingBlock:a6];

  *(_DWORD *)(*(void *)&buf[8] + 24) = 0;
  uint64_t v18 = __atxlog_handle_default();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v31 = 138412546;
    *(void *)v32 = v9;
    *(_WORD *)&v32[8] = 2048;
    *(double *)&v32[10] = a6;
    _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "Pruning tombstones for stream identifier: %@ based on endTime: %f", v31, 0x16u);
  }

  uint64_t v19 = (void *)[v11 copy];
  [v19 setStoreLocationOption:2];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50290]) initWithStream:v9 config:v19];
  uint64_t v21 = (void *)MEMORY[0x1D25F6CC0]();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__ATXBiomePrivacyPruner_pruneWithStreamIdentifier_activity_config_endTime___block_invoke_84;
  v25[3] = &unk_1E68AE4F0;
  long long v27 = buf;
  id v22 = v17;
  id v26 = v22;
  [v20 removeEventsFrom:1 to:v25 reason:0.0 usingBlock:a6];

  long long v23 = __atxlog_handle_default();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = *(_DWORD *)(*(void *)&buf[8] + 24);
    *(_DWORD *)v31 = 67109378;
    *(_DWORD *)v32 = v24;
    *(_WORD *)&v32[4] = 2112;
    *(void *)&v32[6] = v9;
    _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Removed %d tombstone events for stream identifier: %@", v31, 0x12u);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __75__ATXBiomePrivacyPruner_pruneWithStreamIdentifier_activity_config_endTime___block_invoke(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  int v3 = *(_DWORD *)(v2 + 24) + 1;
  *(_DWORD *)(v2 + 24) = v3;
  HIDWORD(v4) = -1030792151 * v3;
  LODWORD(v4) = -1030792151 * v3;
  if ((v4 >> 2) <= 0x28F5C28)
  {
    result = [*(id *)(result + 32) didDefer];
    if (result) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __75__ATXBiomePrivacyPruner_pruneWithStreamIdentifier_activity_config_endTime___block_invoke_84(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  int v3 = *(_DWORD *)(v2 + 24) + 1;
  *(_DWORD *)(v2 + 24) = v3;
  HIDWORD(v4) = -1030792151 * v3;
  LODWORD(v4) = -1030792151 * v3;
  if ((v4 >> 2) <= 0x28F5C28)
  {
    result = [*(id *)(result + 32) didDefer];
    if (result) {
      *a2 = 1;
    }
  }
  return result;
}

@end