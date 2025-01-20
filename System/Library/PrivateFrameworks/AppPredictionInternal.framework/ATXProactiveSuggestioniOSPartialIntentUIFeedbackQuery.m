@interface ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery
- (id)uiFeedbackPublisherChain;
- (void)uiFeedbackPublisherChain;
@end

@implementation ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery

- (id)uiFeedbackPublisherChain
{
  v19.receiver = self;
  v19.super_class = (Class)ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery;
  v3 = [(ATXProactiveSuggestionUIFeedbackQuery *)&v19 uiFeedbackPublisherChain];
  v4 = BiomeLibrary();
  v5 = [v4 App];
  v6 = [v5 InFocus];
  v7 = [(ATXProactiveSuggestionUIFeedbackQuery *)self startDateForResults];
  v8 = objc_msgSend(v6, "atx_publisherFromStartDate:", v7);

  v9 = BiomeLibrary();
  v10 = [v9 App];
  v11 = [v10 Intent];
  v12 = [(ATXProactiveSuggestionUIFeedbackQuery *)self startDateForResults];
  v13 = objc_msgSend(v11, "atx_publisherFromStartDate:", v12);

  if (!v3 || !v8 || !v13)
  {
    if (v3)
    {
      if (v8) {
        goto LABEL_7;
      }
    }
    else
    {
      v16 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery uiFeedbackPublisherChain]();
      }

      if (v8)
      {
LABEL_7:
        if (v13)
        {
LABEL_8:
          v15 = 0;
          goto LABEL_19;
        }
LABEL_15:
        __atxlog_handle_blending_ecosystem();
        v14 = (ATXProactiveSuggestionPartialIntentHandlingPublisher *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR)) {
          -[ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery uiFeedbackPublisherChain]();
        }
        v15 = 0;
        goto LABEL_18;
      }
    }
    v17 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery uiFeedbackPublisherChain]();
    }

    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  v14 = [[ATXProactiveSuggestionPartialIntentHandlingPublisher alloc] initWithUIFeedbackPublisher:v3 appLaunchPublisher:v8 intentPublisher:v13];
  v15 = [(ATXProactiveSuggestionPartialIntentHandlingPublisher *)v14 partialIntentUIFeedbackPublisher];
LABEL_18:

LABEL_19:
  return v15;
}

- (void)uiFeedbackPublisherChain
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "%@ - could not initialize uiFeedbackPublisherChain, returning early", v4, v5, v6, v7, 2u);
}

@end