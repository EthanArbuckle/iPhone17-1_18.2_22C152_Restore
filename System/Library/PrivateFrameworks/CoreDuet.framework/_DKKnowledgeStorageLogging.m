@interface _DKKnowledgeStorageLogging
+ (id)sharedInstance;
- (_DKKnowledgeStorageLogging)init;
- (id)portraitStreamNames;
- (id)streamNamesNotificationWhitelist;
- (void)_sendDistributedNotificationName:(void *)a3 object:(void *)a4 throttledActivityName:;
- (void)_sendDistributedNotificationName:(void *)a3 streamNameCounts:;
- (void)_updateCounter:(void *)a3 streamNameCounts:;
- (void)knowledgeStorage:(id)a3 didDeleteEventsWithStreamNameCounts:(id)a4;
- (void)knowledgeStorage:(id)a3 didInsertEventsWithStreamNameCounts:(id)a4;
- (void)knowledgeStorage:(id)a3 didInsertLocalEventsWithStreamNameCounts:(id)a4;
- (void)knowledgeStorage:(id)a3 didTombstoneEventsWithStreamNameCounts:(id)a4;
@end

@implementation _DKKnowledgeStorageLogging

- (void)knowledgeStorage:(id)a3 didInsertLocalEventsWithStreamNameCounts:(id)a4
{
  uint64_t v5 = knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestCounterInitialized;
  id v6 = a4;
  id v8 = v6;
  if (v5 == -1)
  {
    v7 = v6;
  }
  else
  {
    dispatch_once(&knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestCounterInitialized, &__block_literal_global_35);
    v7 = v8;
  }
  -[_DKKnowledgeStorageLogging _updateCounter:streamNameCounts:](self, (void *)knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestLocalCounter, v7);
  -[_DKKnowledgeStorageLogging _sendDistributedNotificationName:streamNameCounts:](self, @"_DKKnowledgeStorageDidInsertLocalEventsNotification", v8);
}

- (void)knowledgeStorage:(id)a3 didInsertEventsWithStreamNameCounts:(id)a4
{
  uint64_t v5 = knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounterInitialized;
  id v6 = a4;
  id v8 = v6;
  if (v5 == -1)
  {
    v7 = v6;
  }
  else
  {
    dispatch_once(&knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounterInitialized, &__block_literal_global_23);
    v7 = v8;
  }
  -[_DKKnowledgeStorageLogging _updateCounter:streamNameCounts:](self, (void *)knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounter, v7);
  -[_DKKnowledgeStorageLogging _sendDistributedNotificationName:streamNameCounts:](self, @"_DKKnowledgeStorageDidInsertEventsNotification", v8);
}

- (void)_updateCounter:(void *)a3 streamNameCounts:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  id v5 = a3;
  if (a1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = -[_DKKnowledgeStorageLogging portraitStreamNames](a1);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v12 = [v5 countForObject:v11];
          if (v12)
          {
            uint64_t v13 = v12;
            v14 = +[_CDPortraitStreams entityStream];
            v15 = [v14 name];
            char v16 = [v11 isEqualToString:v15];

            v17 = @"entity";
            if (v16) {
              goto LABEL_10;
            }
            v18 = +[_CDPortraitStreams topicStream];
            v19 = [v18 name];
            int v20 = [v11 isEqualToString:v19];

            v17 = @"topic";
            if (v20) {
LABEL_10:
            }
              -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:]((uint64_t)v21, v13, v17);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }
  }
}

- (id)portraitStreamNames
{
  if (a1)
  {
    if (portraitStreamNames_initialized != -1) {
      dispatch_once(&portraitStreamNames_initialized, &__block_literal_global_3_0);
    }
    a1 = (id)portraitStreamNames_portraitStreamNames;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_sendDistributedNotificationName:(void *)a3 streamNameCounts:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = -[_DKKnowledgeStorageLogging streamNamesNotificationWhitelist](a1);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v6 countForObject:v12])
          {
            uint64_t v13 = [NSString stringWithFormat:@"_DKKnowledgeStorageLogging%@:%@", v5, v12, (void)v14];
            -[_DKKnowledgeStorageLogging _sendDistributedNotificationName:object:throttledActivityName:]((uint64_t)a1, v5, v12, v13);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (id)streamNamesNotificationWhitelist
{
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62___DKKnowledgeStorageLogging_streamNamesNotificationWhitelist__block_invoke;
    block[3] = &unk_1E560D578;
    block[4] = a1;
    if (streamNamesNotificationWhitelist_initialized != -1) {
      dispatch_once(&streamNamesNotificationWhitelist_initialized, block);
    }
    a1 = (id)streamNamesNotificationWhitelist_streamNamesNotificationWhitelist;
    uint64_t v1 = block[6];
  }
  return a1;
}

+ (id)sharedInstance
{
  self;
  if (sharedInstance_initialized_5 != -1) {
    dispatch_once(&sharedInstance_initialized_5, &__block_literal_global_76);
  }
  v0 = (void *)sharedInstance_logger;
  return v0;
}

- (_DKKnowledgeStorageLogging)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DKKnowledgeStorageLogging;
  v2 = [(_DKKnowledgeStorageLogging *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.coreduet.KnowledgeStorageLogging.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_sendDistributedNotificationName:(void *)a3 object:(void *)a4 throttledActivityName:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = a4;
    uint64_t v10 = +[_DKThrottledActivity standardInstance];
    uint64_t v11 = *(void *)(a1 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92___DKKnowledgeStorageLogging__sendDistributedNotificationName_object_throttledActivityName___block_invoke;
    v12[3] = &unk_1E560D848;
    id v13 = v7;
    id v14 = v8;
    [v10 performWithMinimumIntervalInSecondsOf:v9 name:v11 queue:v12 activityBlock:2.0];
  }
}

- (void)knowledgeStorage:(id)a3 didDeleteEventsWithStreamNameCounts:(id)a4
{
}

- (void)knowledgeStorage:(id)a3 didTombstoneEventsWithStreamNameCounts:(id)a4
{
}

- (void).cxx_destruct
{
}

@end