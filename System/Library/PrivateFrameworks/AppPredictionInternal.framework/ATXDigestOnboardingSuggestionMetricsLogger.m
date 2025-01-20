@interface ATXDigestOnboardingSuggestionMetricsLogger
- (ATXDigestOnboardingSuggestionMetricsLogger)init;
- (ATXDigestOnboardingSuggestionMetricsLogger)initWithDigestOnboardingSuggestionLoggingBiomeStream:(id)a3;
- (id)digestOnboardingSuggestionBookmark;
- (void)logDigestOnboardingSuggestionMetrics;
- (void)logDigestOnboardingSuggestionMetricsWithXPCActivity:(id)a3;
- (void)writeBookmarkToFile:(id)a3;
@end

@implementation ATXDigestOnboardingSuggestionMetricsLogger

- (ATXDigestOnboardingSuggestionMetricsLogger)init
{
  v3 = objc_opt_new();
  v4 = [(ATXDigestOnboardingSuggestionMetricsLogger *)self initWithDigestOnboardingSuggestionLoggingBiomeStream:v3];

  return v4;
}

- (ATXDigestOnboardingSuggestionMetricsLogger)initWithDigestOnboardingSuggestionLoggingBiomeStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDigestOnboardingSuggestionMetricsLogger;
  v6 = [(ATXDigestOnboardingSuggestionMetricsLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_digestOnboardingSuggestionLoggingBiomeStream, a3);
  }

  return v7;
}

- (id)digestOnboardingSuggestionBookmark
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v3 = [MEMORY[0x1E4F4B650] bookmarksPathFile:@"digestOnboardingSuggestionBookmark"];
  v4 = (void *)[v2 initFileURLWithPath:v3];

  id v5 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:v4 maxFileSize:1000000 versionNumber:&unk_1F27F2310];
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4B618]);
    v7 = [NSNumber numberWithUnsignedInt:1];
    id v5 = (void *)[v6 initWithURLPath:v4 versionNumber:v7 bookmark:0 metadata:0];
  }
  return v5;
}

- (void)logDigestOnboardingSuggestionMetricsWithXPCActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXDigestOnboardingSuggestionMetricsLogger *)self digestOnboardingSuggestionBookmark];
  digestOnboardingSuggestionLoggingBiomeStream = self->_digestOnboardingSuggestionLoggingBiomeStream;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v8 = [(ATXDigestOnboardingSuggestionLoggingBiomeStream *)digestOnboardingSuggestionLoggingBiomeStream publisherFromStartTime:v7 + -1209600.0];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  objc_super v9 = [v5 bookmark];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__ATXDigestOnboardingSuggestionMetricsLogger_logDigestOnboardingSuggestionMetricsWithXPCActivity___block_invoke;
  v16[3] = &unk_1E68ACE10;
  v18 = v19;
  v16[4] = self;
  id v10 = v5;
  id v17 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__ATXDigestOnboardingSuggestionMetricsLogger_logDigestOnboardingSuggestionMetricsWithXPCActivity___block_invoke_20;
  v13[3] = &unk_1E68ACE38;
  id v11 = v4;
  id v14 = v11;
  v15 = v19;
  id v12 = (id)[v8 drivableSinkWithBookmark:v9 completion:v16 shouldContinue:v13];

  _Block_object_dispose(v19, 8);
}

void __98__ATXDigestOnboardingSuggestionMetricsLogger_logDigestOnboardingSuggestionMetricsWithXPCActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      objc_super v9 = v7;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", (uint8_t *)&v8, 0xCu);
    }
  }
  [*(id *)(a1 + 40) setBookmark:v4];
  [*(id *)(a1 + 32) writeBookmarkToFile:*(void *)(a1 + 40)];
}

uint64_t __98__ATXDigestOnboardingSuggestionMetricsLogger_logDigestOnboardingSuggestionMetricsWithXPCActivity___block_invoke_20(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  id v4 = objc_opt_new();
  id v5 = [v3 sessionUUID];
  id v6 = [v5 UUIDString];
  [v4 setSessionUUID:v6];

  [v3 outcome];
  double v7 = ATXDigestOnboardingSuggestionOutcomeToString();
  [v4 setOutcome:v7];

  [v3 timeToResolution];
  objc_msgSend(v4, "setTimeToResolution:");
  [v4 logToCoreAnalytics];
  int v8 = [*(id *)(a1 + 32) didDefer];
  if (v8) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v9 = v8 ^ 1u;

  return v9;
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

- (void)logDigestOnboardingSuggestionMetrics
{
}

- (void).cxx_destruct
{
}

@end