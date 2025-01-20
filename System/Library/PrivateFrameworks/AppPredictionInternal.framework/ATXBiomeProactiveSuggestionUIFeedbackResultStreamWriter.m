@interface ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter
- (void)writeEventsToStreamWithXPCActivity:(id)a3;
- (void)writeForConsumerSubType:(unsigned __int8)a3;
@end

@implementation ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter

- (void)writeEventsToStreamWithXPCActivity:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 didDefer])
  {
    v5 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Deferring due to xpcActivity.", buf, 0xCu);
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [&unk_1F27F38B8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(&unk_1F27F38B8);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1D25F6CC0]();
          -[ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter writeForConsumerSubType:](self, "writeForConsumerSubType:", [v12 unsignedIntValue]);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [&unk_1F27F38B8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)writeForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:");
  v6 = [@"proactiveSuggestionUIFeedbackResultStreamWriterBookmarkURL" stringByAppendingFormat:@"-%@", v5];

  id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v8 = [MEMORY[0x1E4F4B650] bookmarksPathFile:v6];
  uint64_t v9 = (void *)[v7 initFileURLWithPath:v8];

  uint64_t v10 = [[ATXProactiveSuggestioniOSUIFeedbackQuery alloc] initWithClientModelIds:0 consumerSubTypeToConsider:v3 startDateForResults:0 bookmarkURLPath:v9];
  uint64_t v11 = objc_opt_new();
  v12 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    long long v15 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
    *(_DWORD *)buf = 138412546;
    v22 = v14;
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%@ - Beginning query for %@", buf, 0x16u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke;
  v18[3] = &unk_1E68B5280;
  id v19 = v11;
  v20 = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke_31;
  v17[3] = &unk_1E68B36D8;
  v17[4] = self;
  id v16 = v11;
  [(ATXProactiveSuggestionUIFeedbackQuery *)v10 enumerateUIFeedbackResultsWithBlock:v18 completionBlock:v17];
}

void __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F938B0]) initWithProactiveSuggestionUIFeedbackResult:v3];
  if (v4)
  {
    [*(id *)(a1 + 32) sendEvent:v4];
    v5 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Wrote UI Feedback Result to Biome:\n%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    v5 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
}

void __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - Finished enumerating results with error - %@", (uint8_t *)&v6, 0x16u);
  }
}

void __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  __int16 v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - Unable to initialize corresponding biome object for feedback result:\n%@", (uint8_t *)&v7, 0x16u);
}

@end