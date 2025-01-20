@interface ATXMissedNotificationRankingFeedbackProcessingPipeline
- (ATXMissedNotificationRankingFeedbackProcessingPipeline)init;
- (ATXMissedNotificationRankingFeedbackProcessingPipeline)initWithBookmark:(id)a3 path:(id)a4 trackedMNRStream:(id)a5;
- (BOOL)_fileExistsAtPath:(id)a3;
- (void)_readBookmarkFromPath;
- (void)_writeBookmarkToPath;
- (void)logMetrics;
- (void)logMetricsForRanking:(id)a3;
- (void)logMetricsWithXPCActivity:(id)a3;
@end

@implementation ATXMissedNotificationRankingFeedbackProcessingPipeline

- (ATXMissedNotificationRankingFeedbackProcessingPipeline)init
{
  v3 = [MEMORY[0x1E4F4B650] metricsRootDirectory];
  v4 = [v3 stringByAppendingPathComponent:@"mnrLoggingBookmark"];

  v5 = objc_opt_new();
  v6 = [(ATXMissedNotificationRankingFeedbackProcessingPipeline *)self initWithBookmark:0 path:v4 trackedMNRStream:v5];

  return v6;
}

- (ATXMissedNotificationRankingFeedbackProcessingPipeline)initWithBookmark:(id)a3 path:(id)a4 trackedMNRStream:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXMissedNotificationRankingFeedbackProcessingPipeline;
  v12 = [(ATXMissedNotificationRankingFeedbackProcessingPipeline *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmark, a3);
    objc_storeStrong((id *)&v13->_path, a4);
    objc_storeStrong((id *)&v13->_trackedMNRStream, a5);
    if (!v13->_bookmark) {
      [(ATXMissedNotificationRankingFeedbackProcessingPipeline *)v13 _readBookmarkFromPath];
    }
  }

  return v13;
}

- (void)logMetricsWithXPCActivity:(id)a3
{
  id v4 = a3;
  trackedMNRStream = self->_trackedMNRStream;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-172800.0];
  [v6 timeIntervalSinceReferenceDate];
  v7 = -[ATXEngagementTrackedMissedNotificationRankingBiomeStream publisherFromStartTime:](trackedMNRStream, "publisherFromStartTime:");

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  bookmark = self->_bookmark;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke;
  v15[3] = &unk_1E68AC280;
  v15[4] = self;
  v15[5] = v16;
  v15[6] = v17;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_15;
  v11[3] = &unk_1E68B0948;
  v11[4] = self;
  v13 = v16;
  id v9 = v4;
  id v12 = v9;
  v14 = v17;
  id v10 = (id)[v7 drivableSinkWithBookmark:bookmark completion:v15 shouldContinue:v11];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
}

void __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 error];

  if (!v7)
  {
    int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    v8 = __atxlog_handle_metrics();
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (!v10) {
        goto LABEL_10;
      }
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v20 = 138412546;
      v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v13;
      v14 = "[%@] Stopping missed notification ranking metrics due to XPC deferral.  Logged %lu rankings.";
    }
    else
    {
      if (!v10) {
        goto LABEL_10;
      }
      objc_super v15 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v15);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v20 = 138412546;
      v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v16;
      v14 = "[%@] Finished logging missed notification ranking metrics.  Logged %lu digests.";
    }
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v20, 0x16u);

    goto LABEL_10;
  }
  v8 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_cold_1(a1, v5, v8);
  }
LABEL_10:

  uint64_t v17 = *(void *)(a1 + 32);
  char v18 = *(void **)(v17 + 8);
  *(void *)(v17 + 8) = v6;
  id v19 = v6;

  [*(id *)(a1 + 32) _writeBookmarkToPath];
}

uint64_t __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_15(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) logMetricsForRanking:a2];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  int v3 = [*(id *)(a1 + 40) didDefer];
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return v3 ^ 1u;
}

- (void)logMetrics
{
}

- (void)logMetricsForRanking:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [v3 uuid];
    v8 = [v7 UUIDString];
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    __int16 v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_INFO, "[%@] Logging metrics for missed notification ranking %@", buf, 0x16u);
  }
  int v9 = objc_opt_new();
  [v9 populateMetricsFromRanking:v3];
  [v9 logToCoreAnalytics];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v10 = objc_msgSend(v3, "rankedGroups", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v16 = [v15 digestEngagementTrackingMetrics];

        if (v16)
        {
          uint64_t v17 = objc_opt_new();
          char v18 = [v3 uuid];
          [v17 populateMetricsFromDigestGroup:v15 mnbUUID:v18];

          [v17 logToCoreAnalytics];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)_readBookmarkFromPath
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:self->_path];
  id v3 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:v6 maxFileSize:2000000 versionNumber:&unk_1F27F0DF8];
  id v4 = [v3 bookmark];
  bookmark = self->_bookmark;
  self->_bookmark = v4;
}

- (void)_writeBookmarkToPath
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ – Error writing missed notification ranking metrics bookmark: %@", (uint8_t *)&v7, 0x16u);
}

- (BOOL)_fileExistsAtPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedMNRStream, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

void __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  v8 = [a2 error];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  int v10 = 138412802;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2048;
  uint64_t v15 = v9;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "[%@] Error while sinking Biome stream: %@.  Logged %lu rankings.", (uint8_t *)&v10, 0x20u);
}

@end