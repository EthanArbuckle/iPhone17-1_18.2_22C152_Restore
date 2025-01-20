@interface ATXFakeCoreAnalyticsLogger
+ (BOOL)hasReceivedEventWithMetricName:(id)a3 partialDictionary:(id)a4;
+ (id)sharedInstance;
+ (void)resetEvents;
- (ATXFakeCoreAnalyticsLogger)init;
- (BOOL)hasReceivedEventWithMetricName:(id)a3 partialDictionary:(id)a4;
- (BOOL)partialDictionaryMatches:(id)a3 eventDictionary:(id)a4;
- (double)numberOfReceivedEvents;
- (void)resetEvents;
- (void)sendEventWithMetricName:(id)a3 eventDictionary:(id)a4;
@end

@implementation ATXFakeCoreAnalyticsLogger

- (ATXFakeCoreAnalyticsLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXFakeCoreAnalyticsLogger;
  v2 = [(ATXFakeCoreAnalyticsLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    loggedEvents = v2->_loggedEvents;
    v2->_loggedEvents = (NSMutableArray *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_3;
  return v2;
}

void __44__ATXFakeCoreAnalyticsLogger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_3;
  sharedInstance__pasExprOnceResult_3 = v1;
}

- (void)resetEvents
{
}

+ (void)resetEvents
{
  id v2 = [a1 sharedInstance];
  [v2 resetEvents];
}

- (void)sendEventWithMetricName:(id)a3 eventDictionary:(id)a4
{
  id v5 = [MEMORY[0x1E4F93BB8] tupleWithFirst:a3 second:a4];
  [(NSMutableArray *)self->_loggedEvents addObject:v5];
}

- (BOOL)partialDictionaryMatches:(id)a3 eventDictionary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v19);
        uint64_t v14 = [v6 objectForKeyedSubscript:v12];
        v15 = (void *)v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16 || ![v13 isEqual:v14])
        {

          BOOL v17 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      BOOL v17 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_16:

  return v17;
}

- (BOOL)hasReceivedEventWithMetricName:(id)a3 partialDictionary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_loggedEvents;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "first", (void)v19);
        if ([v6 isEqualToString:v14])
        {
          v15 = [v13 second];
          BOOL v16 = [(ATXFakeCoreAnalyticsLogger *)self partialDictionaryMatches:v7 eventDictionary:v15];

          if (v16)
          {
            BOOL v17 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

+ (BOOL)hasReceivedEventWithMetricName:(id)a3 partialDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 sharedInstance];
  char v9 = [v8 hasReceivedEventWithMetricName:v7 partialDictionary:v6];

  return v9;
}

- (double)numberOfReceivedEvents
{
  return (double)(unint64_t)[(NSMutableArray *)self->_loggedEvents count];
}

- (void).cxx_destruct
{
}

@end