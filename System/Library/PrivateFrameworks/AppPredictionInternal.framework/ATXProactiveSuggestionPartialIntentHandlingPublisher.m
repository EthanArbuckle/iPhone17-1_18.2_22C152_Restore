@interface ATXProactiveSuggestionPartialIntentHandlingPublisher
- (ATXProactiveSuggestionPartialIntentHandlingPublisher)initWithUIFeedbackPublisher:(id)a3 appLaunchPublisher:(id)a4 intentPublisher:(id)a5;
- (BMBookmarkablePublisher)appLaunchPublisher;
- (BMBookmarkablePublisher)intentPublisher;
- (BPSPublisher)uiFeedbackPublisher;
- (id)_timestampFromEvent:(id)a3;
- (id)partialIntentUIFeedbackPublisher;
- (void)setAppLaunchPublisher:(id)a3;
- (void)setIntentPublisher:(id)a3;
- (void)setUiFeedbackPublisher:(id)a3;
@end

@implementation ATXProactiveSuggestionPartialIntentHandlingPublisher

- (ATXProactiveSuggestionPartialIntentHandlingPublisher)initWithUIFeedbackPublisher:(id)a3 appLaunchPublisher:(id)a4 intentPublisher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXProactiveSuggestionPartialIntentHandlingPublisher;
  v12 = [(ATXProactiveSuggestionPartialIntentHandlingPublisher *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uiFeedbackPublisher, a3);
    objc_storeStrong((id *)&v13->_appLaunchPublisher, a4);
    objc_storeStrong((id *)&v13->_intentPublisher, a5);
  }

  return v13;
}

- (id)partialIntentUIFeedbackPublisher
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uiFeedbackPublisher = self->_uiFeedbackPublisher;
  intentPublisher = self->_intentPublisher;
  v14[0] = self->_appLaunchPublisher;
  v14[1] = intentPublisher;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__ATXProactiveSuggestionPartialIntentHandlingPublisher_partialIntentUIFeedbackPublisher__block_invoke;
  v13[3] = &unk_1E68AC7A0;
  v13[4] = self;
  v6 = [(BPSPublisher *)uiFeedbackPublisher orderedMergeWithOthers:v5 comparator:v13];

  id v7 = objc_alloc(MEMORY[0x1E4F4B668]);
  v8 = objc_opt_new();
  id v9 = (void *)[v7 initWithFirst:0 second:v8];

  id v10 = [v6 scanWithInitial:v9 nextPartialResult:&__block_literal_global_181];
  id v11 = [v10 flatMapWithTransform:&__block_literal_global_23_4];

  return v11;
}

uint64_t __88__ATXProactiveSuggestionPartialIntentHandlingPublisher_partialIntentUIFeedbackPublisher__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 _timestampFromEvent:a2];
  v8 = [*(id *)(a1 + 32) _timestampFromEvent:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

id __88__ATXProactiveSuggestionPartialIntentHandlingPublisher_partialIntentUIFeedbackPublisher__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 second];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 handleNewFeedbackResultAndReturnCompletedResults:v4];
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = 0;
    goto LABEL_12;
  }
  id v7 = [v4 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v5 handleAppLaunchAndReturnCompletedResults:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = 0;
      goto LABEL_11;
    }
    uint64_t v8 = [v5 handleNewIntentEventAndReturnCompletedResults:v7];
  }
  id v6 = (void *)v8;
LABEL_11:

LABEL_12:
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4B668]) initWithFirst:v6 second:v5];

  return v9;
}

id __88__ATXProactiveSuggestionPartialIntentHandlingPublisher_partialIntentUIFeedbackPublisher__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 first];

  if (v3)
  {
    id v4 = [v2 first];
  }
  else
  {
    id v4 = objc_opt_new();
  }
  v5 = v4;
  id v6 = [v4 bpsPublisher];

  return v6;
}

- (id)_timestampFromEvent:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = NSNumber;
    [v5 timestamp];
    id v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v5;
      uint64_t v9 = [v8 session];
      id v10 = [v9 sessionEndDate];

      if (!v10)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"ATXProactiveSuggestionPartialIntentHandlingPublisher.m", 75, @"_timestampFromEvent received nil sessionEndDate with uiFeedbackResult: %@", v8 object file lineNumber description];
      }
      id v11 = NSNumber;
      v12 = [v8 session];
      v13 = [v12 sessionEndDate];
      [v13 timeIntervalSinceReferenceDate];
      id v7 = objc_msgSend(v11, "numberWithDouble:");
    }
    else
    {
      v14 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(ATXProactiveSuggestionPartialIntentHandlingPublisher *)(uint64_t)self _timestampFromEvent:v14];
      }

      objc_super v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3B8];
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      [v15 raise:v16, @"%@ - _timestampFromEvent invoked with unknown object: %@", v18, v5 format];

      id v7 = &unk_1F27F1E78;
    }
  }

  return v7;
}

- (BPSPublisher)uiFeedbackPublisher
{
  return self->_uiFeedbackPublisher;
}

- (void)setUiFeedbackPublisher:(id)a3
{
}

- (BMBookmarkablePublisher)appLaunchPublisher
{
  return self->_appLaunchPublisher;
}

- (void)setAppLaunchPublisher:(id)a3
{
}

- (BMBookmarkablePublisher)intentPublisher
{
  return self->_intentPublisher;
}

- (void)setIntentPublisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentPublisher, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_uiFeedbackPublisher, 0);
}

- (void)_timestampFromEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - _timestampFromEvent invoked with unknown object: %@", (uint8_t *)&v7, 0x16u);
}

@end