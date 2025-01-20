@interface ATXUserEducationSuggestion
@end

@implementation ATXUserEducationSuggestion

void __52__ATXUserEducationSuggestion_Internal__logFeedback___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 136315394;
    v10 = "-[ATXUserEducationSuggestion(Internal) logFeedback:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%s: Processing feedback: %@", (uint8_t *)&v9, 0x16u);
  }

  unint64_t v4 = [*(id *)(a1 + 32) feedbackType] - 1;
  if (v4 <= 5 && ((0x2Du >> v4) & 1) != 0) {
    [*(id *)(a1 + 40) writeSuggestionState:qword_1D142B950[v4]];
  }
  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 40), "metricClass")), "initWithFeedback:", *(void *)(a1 + 32));
  [v5 logToCoreAnalytics];
  v6 = [v5 coreAnalyticsDictionary];
  v7 = (void *)[v6 mutableCopy];

  [(id)objc_opt_class() suggestionType];
  v8 = ATXUserEducationSuggestionTypeToString();
  [v7 setObject:v8 forKey:@"suggestionType"];

  AnalyticsSendEvent();
}

@end