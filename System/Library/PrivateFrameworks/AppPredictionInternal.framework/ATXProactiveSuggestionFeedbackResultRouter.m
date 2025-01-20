@interface ATXProactiveSuggestionFeedbackResultRouter
- (ATXProactiveSuggestionFeedbackResultRouter)init;
- (ATXProactiveSuggestionFeedbackResultRouter)initWithFeedbackListeners:(id)a3;
- (id)clientModelIdsWithFeedbackListeners;
- (void)_initializeFeedbackListenersDictWith:(id)a3;
- (void)handleNewFeedbackResult:(id)a3;
@end

@implementation ATXProactiveSuggestionFeedbackResultRouter

- (ATXProactiveSuggestionFeedbackResultRouter)init
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v3 = +[ATXActionFeedback sharedInstance];
  v10[0] = v3;
  v4 = +[ATXFallbackActionsFeedback sharedInstance];
  v10[1] = v4;
  v5 = objc_opt_new();
  v10[2] = v5;
  v6 = objc_opt_new();
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8 = [(ATXProactiveSuggestionFeedbackResultRouter *)self initWithFeedbackListeners:v7];

  return v8;
}

- (id)clientModelIdsWithFeedbackListeners
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4 = [(NSDictionary *)self->_feedbackListeners allKeys];
  v5 = (void *)[v3 initWithArray:v4];

  return v5;
}

- (ATXProactiveSuggestionFeedbackResultRouter)initWithFeedbackListeners:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXProactiveSuggestionFeedbackResultRouter;
  v5 = [(ATXProactiveSuggestionFeedbackResultRouter *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ATXProactiveSuggestionFeedbackResultRouter *)v5 _initializeFeedbackListenersDictWith:v4];
  }

  return v6;
}

- (void)_initializeFeedbackListenersDictWith:(id)a3
{
  v15 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (NSDictionary *)objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v3;
  uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v7 = objc_msgSend(v6, "clientModelIds", v15);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * j);
              v13 = [(NSDictionary *)v4 objectForKey:v12];
              if (!v13)
              {
                v13 = objc_opt_new();
                [(NSDictionary *)v4 setObject:v13 forKey:v12];
              }
              [v13 addObject:v6];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v9);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }

  feedbackListeners = v15->_feedbackListeners;
  v15->_feedbackListeners = v4;
}

- (void)handleNewFeedbackResult:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 clientCacheUpdate];
  v6 = [v5 clientModelId];

  v7 = [(NSDictionary *)self->_feedbackListeners objectForKey:v6];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
          [v12 receiveUIFeedbackResult:v4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
}

@end