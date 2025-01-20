@interface AFOpportuneSpeakingModelFeedbackManager
- (AFOpportuneSpeakingModelFeedbackManager)init;
- (BOOL)interactionDetectedForSpeakableId:(id)a3;
- (id)lastNegativeFeedbackForContact:(id)a3;
- (void)fetchNotificationUsageForSpeakableId:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withHandler:(id)a6;
- (void)loadIfNecessary;
- (void)save;
- (void)setLastNegativeFeedbackForContact:(id)a3;
@end

@implementation AFOpportuneSpeakingModelFeedbackManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageEventsBySpeakableId, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

- (void)save
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_feedback)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v4 = AFOpportuneSpeakingModelFeedbackPath();
    v5 = [v4 stringByDeletingLastPathComponent];
    id v19 = 0;
    char v6 = [v3 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v19];
    v7 = (AFOpportuneSpeakingModelFeedback *)v19;

    if (v6)
    {
      feedback = self->_feedback;
      v18 = v7;
      v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:feedback requiringSecureCoding:1 error:&v18];
      v10 = v18;

      if (v9)
      {
        v17 = v10;
        char v11 = [v9 writeToFile:v4 options:1 error:&v17];
        v7 = v17;

        if ((v11 & 1) == 0)
        {
          v12 = AFSiriLogContextService;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
          {
            v13 = self->_feedback;
            *(_DWORD *)buf = 136315650;
            v21 = "-[AFOpportuneSpeakingModelFeedbackManager save]";
            __int16 v22 = 2112;
            v23 = v13;
            __int16 v24 = 2112;
            v25 = v7;
            _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Failed to save feedback to disk %@: %@", buf, 0x20u);
          }
        }
      }
      else
      {
        v15 = AFSiriLogContextService;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
        {
          v16 = self->_feedback;
          *(_DWORD *)buf = 136315650;
          v21 = "-[AFOpportuneSpeakingModelFeedbackManager save]";
          __int16 v22 = 2112;
          v23 = v16;
          __int16 v24 = 2112;
          v25 = v10;
          _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, "%s Failed to archive feedback %@: %@", buf, 0x20u);
        }
        v7 = v10;
      }
    }
    else
    {
      v14 = AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[AFOpportuneSpeakingModelFeedbackManager save]";
        __int16 v22 = 2112;
        v23 = v7;
        _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Error creating directory: %@", buf, 0x16u);
      }
    }
  }
}

- (void)loadIfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_feedback)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v4 = AFOpportuneSpeakingModelFeedbackPath();
    if ([v3 fileExistsAtPath:v4])
    {
      id v12 = 0;
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v4 options:2 error:&v12];
      id v6 = v12;
      if (v6 || !v5)
      {
        char v11 = AFSiriLogContextService;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "-[AFOpportuneSpeakingModelFeedbackManager loadIfNecessary]";
          __int16 v15 = 2112;
          id v16 = v6;
          _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s Error reading data: %@", buf, 0x16u);
        }
      }
      else
      {
        v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
        v8 = [v7 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
        feedback = self->_feedback;
        self->_feedback = v8;

        [v7 finishDecoding];
      }
    }
    else
    {
      v10 = AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[AFOpportuneSpeakingModelFeedbackManager loadIfNecessary]";
        _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s No feedback persisted", buf, 0xCu);
      }
    }
  }
}

- (BOOL)interactionDetectedForSpeakableId:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableDictionary *)self->_usageEventsBySpeakableId objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "objectForKey:", @"EventType", (void)v16);
          char v11 = [MEMORY[0x1E4F28ED0] numberWithInt:6];
          id v12 = [v11 stringValue];

          if (v10) {
            BOOL v13 = v12 == 0;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13 && ([v10 isEqualToString:v12] & 1) != 0)
          {

            BOOL v14 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_17:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)fetchNotificationUsageForSpeakableId:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withHandler:(id)a6
{
  id v10 = a3;
  char v11 = (void (**)(id, id, BOOL))a6;
  id v12 = a5;
  id v13 = a4;
  BOOL v14 = BiomeLibrary();
  __int16 v15 = [v14 Notification];
  long long v16 = [v15 Usage];

  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v13 endDate:v12 maxEvents:0 lastN:0 reversed:0];
  long long v18 = [v16 publisherWithUseCase:@"Assistant" options:v17];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __118__AFOpportuneSpeakingModelFeedbackManager_fetchNotificationUsageForSpeakableId_withStartDate_withEndDate_withHandler___block_invoke;
  v29[3] = &unk_1E592BE10;
  id v30 = v10;
  id v19 = v10;
  v20 = [v18 filterWithIsIncluded:v29];

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __118__AFOpportuneSpeakingModelFeedbackManager_fetchNotificationUsageForSpeakableId_withStartDate_withEndDate_withHandler___block_invoke_57;
  v27 = &unk_1E592BEA8;
  id v28 = v21;
  id v22 = v21;
  id v23 = (id)[v20 sinkWithCompletion:&__block_literal_global_21411 receiveInput:&v24];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_usageEventsBySpeakableId, "setObject:forKeyedSubscript:", v22, v19, v24, v25, v26, v27);
  v11[2](v11, v22, [v22 count] != 0);
}

uint64_t __118__AFOpportuneSpeakingModelFeedbackManager_fetchNotificationUsageForSpeakableId_withStartDate_withEndDate_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = [v3 uniqueID];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __118__AFOpportuneSpeakingModelFeedbackManager_fetchNotificationUsageForSpeakableId_withStartDate_withEndDate_withHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v9 = [a2 eventBody];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v9, "usageType"));
  uint64_t v5 = [v4 stringValue];
  [v3 setObject:v5 forKey:@"EventType"];

  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v7 = [v9 absoluteTimestamp];
  [v7 timeIntervalSinceReferenceDate];
  uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v8 forKey:@"StartDate"];

  [*(id *)(a1 + 32) addObject:v3];
}

void __118__AFOpportuneSpeakingModelFeedbackManager_fetchNotificationUsageForSpeakableId_withStartDate_withEndDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      uint64_t v5 = [v2 error];
      int v6 = 136315394;
      uint64_t v7 = "-[AFOpportuneSpeakingModelFeedbackManager fetchNotificationUsageForSpeakableId:withStartDate:withEndDate:with"
           "Handler:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching notification event: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)setLastNegativeFeedbackForContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextService;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315394;
    BOOL v14 = "-[AFOpportuneSpeakingModelFeedbackManager setLastNegativeFeedbackForContact:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s contact: %@", (uint8_t *)&v13, 0x16u);
  }
  if (!self->_feedback)
  {
    int v6 = objc_alloc_init(AFOpportuneSpeakingModelFeedback);
    feedback = self->_feedback;
    self->_feedback = v6;
  }
  __int16 v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [v4 length];
  uint64_t v10 = self->_feedback;
  if (v9)
  {
    char v11 = [(AFOpportuneSpeakingModelFeedback *)v10 negativeFeedbackByContact];
    id v12 = (void *)[v11 mutableCopy];

    [v12 setObject:v8 forKey:v4];
    [(AFOpportuneSpeakingModelFeedback *)self->_feedback setNegativeFeedbackByContact:v12];
  }
  else
  {
    [(AFOpportuneSpeakingModelFeedback *)v10 setLastNegativeFeedback:v8];
  }
  [(AFOpportuneSpeakingModelFeedbackManager *)self save];
}

- (id)lastNegativeFeedbackForContact:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AFOpportuneSpeakingModelFeedbackManager *)self loadIfNecessary];
  uint64_t v5 = [v4 length];
  feedback = self->_feedback;
  if (v5)
  {
    uint64_t v7 = [(AFOpportuneSpeakingModelFeedback *)feedback negativeFeedbackByContact];
    __int16 v8 = [v7 objectForKey:v4];
  }
  else
  {
    __int16 v8 = [(AFOpportuneSpeakingModelFeedback *)feedback lastNegativeFeedback];
  }
  uint64_t v9 = AFSiriLogContextService;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    id v12 = "-[AFOpportuneSpeakingModelFeedbackManager lastNegativeFeedbackForContact:]";
    __int16 v13 = 2112;
    BOOL v14 = v8;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (AFOpportuneSpeakingModelFeedbackManager)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)AFOpportuneSpeakingModelFeedbackManager;
  id v2 = [(AFOpportuneSpeakingModelFeedbackManager *)&v9 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    usageEventsBySpeakableId = v2->_usageEventsBySpeakableId;
    v2->_usageEventsBySpeakableId = v3;

    uint64_t v5 = [get_DKKnowledgeStoreClass() knowledgeStore];
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v5;

    if (!v2->_knowledgeStore)
    {
      uint64_t v7 = AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        int v11 = "-[AFOpportuneSpeakingModelFeedbackManager init]";
        _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s Error obtaining CoreDuet knowledge store.", buf, 0xCu);
      }
    }
  }
  return v2;
}

@end