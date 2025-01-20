@interface ATXActivitySuggestionsFeedbackProcessor
+ (id)queue;
- (ATXActivitySuggestionsFeedbackProcessor)init;
- (ATXActivitySuggestionsFeedbackProcessor)initWithFeedbackStream:(id)a3 feedbackHistogramHelper:(id)a4;
- (id)_activitySuggestionsFeedbackBookmark;
- (void)processFeedbackWithXPCActivity:(id)a3;
@end

@implementation ATXActivitySuggestionsFeedbackProcessor

- (ATXActivitySuggestionsFeedbackProcessor)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXActivitySuggestionsFeedbackProcessor *)self initWithFeedbackStream:v3 feedbackHistogramHelper:v4];

  return v5;
}

- (ATXActivitySuggestionsFeedbackProcessor)initWithFeedbackStream:(id)a3 feedbackHistogramHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXActivitySuggestionsFeedbackProcessor;
  v9 = [(ATXActivitySuggestionsFeedbackProcessor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feedbackStream, a3);
    objc_storeStrong((id *)&v10->_feedbackHistogramHelper, a4);
  }

  return v10;
}

+ (id)queue
{
  if (queue__pasOnceToken6 != -1) {
    dispatch_once(&queue__pasOnceToken6, &__block_literal_global_84);
  }
  v2 = (void *)queue__pasExprOnceResult;
  return v2;
}

void __48__ATXActivitySuggestionsFeedbackProcessor_queue__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("ATXActivitySuggestionsFeedbackProcessorQueue", v1);
  v3 = (void *)queue__pasExprOnceResult;
  queue__pasExprOnceResult = (uint64_t)v2;
}

- (void)processFeedbackWithXPCActivity:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke;
  v7[3] = &unk_1E68AB870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) _activitySuggestionsFeedbackBookmark];
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) publisherFromStartTime:0.0];
  id v4 = [v2 bookmark];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_2;
  v13[3] = &unk_1E68ABA68;
  id v5 = v2;
  id v14 = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_3;
  v11[3] = &unk_1E68AFD98;
  id v6 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v7 = (id)[v3 drivableSinkWithBookmark:v4 completion:v13 shouldContinue:v11];

  id v10 = 0;
  [v5 saveBookmarkWithError:&v10];
  id v8 = v10;
  if (v8)
  {
    v9 = __atxlog_handle_modes();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_cold_1((uint64_t)v8, v9);
    }
  }
}

uint64_t __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBookmark:");
}

uint64_t __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  if (v3)
  {
    id v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_3_cold_1((uint64_t)v3, v4);
    }

    id v5 = [v3 activity];
    if ([v5 activityType] == 4 && !objc_msgSend(v3, "eventType"))
    {
      uint64_t v8 = [v3 suggestionType];

      if (v8) {
        goto LABEL_7;
      }
      id v9 = objc_alloc(MEMORY[0x1E4F1CB18]);
      id v5 = (void *)[v9 initWithSuiteName:*MEMORY[0x1E4F4B688]];
      id v10 = [v3 eventDate];
      [v5 setObject:v10 forKey:@"dateDrivingSetupSuggestionLastShown"];
    }
LABEL_7:
    [*(id *)(*(void *)(a1 + 32) + 16) updateFeedbackHistogramWithEvent:v3];
  }
  uint64_t v6 = [*(id *)(a1 + 40) didDefer] ^ 1;

  return v6;
}

- (id)_activitySuggestionsFeedbackBookmark
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v3 = [MEMORY[0x1E4F4B650] bookmarksPathFile:@"activitySuggestionsFeedbackPublisherBookmarkFile"];
  id v4 = (void *)[v2 initFileURLWithPath:v3];

  id v5 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:v4 maxFileSize:1000000 versionNumber:&unk_1F27F0D20];
  if (!v5) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4B618]) initWithURLPath:v4 versionNumber:&unk_1F27F0D20 bookmark:0 metadata:0];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackHistogramHelper, 0);
  objc_storeStrong((id *)&self->_feedbackStream, 0);
}

void __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXActivitySuggestionsFeedbackProcessor: Unable to save activity suggestion bookmark, error: %@", (uint8_t *)&v2, 0xCu);
}

void __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXActivitySuggestionsFeedbackProcessor processFeedbackWithXPCActivity:]_block_invoke_3";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "%s: Processing feedback eventBody: %@", (uint8_t *)&v2, 0x16u);
}

@end