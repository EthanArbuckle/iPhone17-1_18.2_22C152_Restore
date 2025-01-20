@interface FBKEnhancedLoggingPersistence
+ (FBKEnhancedLoggingPersistence)sharedInstance;
- (BOOL)hasLoggingSessions;
- (FBKEnhancedLoggingPersistence)init;
- (NSArray)items;
- (NSArray)sessions;
- (NSString)searchText;
- (id)deserializeSessionData:(id)a3;
- (id)mutableSessionDictionary;
- (int64_t)loggingSessionCount;
- (void)deleteSession:(id)a3;
- (void)deleteSessionWithFeedbackID:(id)a3;
- (void)saveSession:(id)a3;
- (void)saveSessionForContentItem:(id)a3 followup:(id)a4 filePredicate:(id)a5 devices:(id)a6;
@end

@implementation FBKEnhancedLoggingPersistence

+ (FBKEnhancedLoggingPersistence)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_19);
  }
  v2 = (void *)sharedInstance_instance;

  return (FBKEnhancedLoggingPersistence *)v2;
}

uint64_t __47__FBKEnhancedLoggingPersistence_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (FBKEnhancedLoggingPersistence)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBKEnhancedLoggingPersistence;
  return [(FBKEnhancedLoggingPersistence *)&v3 init];
}

- (void)saveSessionForContentItem:(id)a3 followup:(id)a4 filePredicate:(id)a5 devices:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[FBKEnhancedLoggingSessionInformation alloc] initWithContentItem:v13 followup:v12 filePredicate:v11 devices:v10];

  [(FBKEnhancedLoggingPersistence *)self saveSession:v14];
}

- (void)saveSession:(id)a3
{
  id v4 = a3;
  v5 = [(FBKEnhancedLoggingPersistence *)self mutableSessionDictionary];
  uint64_t v11 = 0;
  v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  if (v11)
  {
    v7 = +[FBKLog model];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FBKEnhancedLoggingPersistence saveSession:](v7);
    }
  }
  else
  {
    v8 = [v4 feedbackID];
    v9 = [v8 stringValue];
    [v5 setObject:v6 forKeyedSubscript:v9];

    v7 = +[FBKSharedConstants sharedUserDefaults];
    id v10 = [NSDictionary dictionaryWithDictionary:v5];
    [v7 setObject:v10 forKey:@"EnhancedLoggingSessions"];
  }
}

- (void)deleteSession:(id)a3
{
  id v4 = [a3 feedbackID];
  [(FBKEnhancedLoggingPersistence *)self deleteSessionWithFeedbackID:v4];
}

- (void)deleteSessionWithFeedbackID:(id)a3
{
  id v4 = a3;
  id v7 = [(FBKEnhancedLoggingPersistence *)self mutableSessionDictionary];
  v5 = [v4 stringValue];

  [v7 removeObjectForKey:v5];
  v6 = +[FBKSharedConstants sharedUserDefaults];
  [v6 setObject:v7 forKey:@"EnhancedLoggingSessions"];
}

- (id)deserializeSessionData:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F08928];
  id v4 = a3;
  uint64_t v9 = 0;
  v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];

  if (v9)
  {
    v6 = +[FBKLog model];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FBKEnhancedLoggingPersistence deserializeSessionData:](v6);
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)mutableSessionDictionary
{
  v2 = +[FBKSharedConstants sharedUserDefaults];
  objc_super v3 = [v2 dictionaryForKey:@"EnhancedLoggingSessions"];

  if (v3) {
    [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];
  }
  else {
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  }

  return v4;
}

- (NSArray)sessions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v3 = +[FBKSharedConstants sharedUserDefaults];
  id v4 = [v3 dictionaryForKey:@"EnhancedLoggingSessions"];

  v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [v4 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v11)
        {
          id v12 = [(FBKEnhancedLoggingPersistence *)self deserializeSessionData:v11];
          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return (NSArray *)v13;
}

- (NSArray)items
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(FBKEnhancedLoggingPersistence *)self sessions];
  objc_super v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "contentItem", (void)v12);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return (NSArray *)v10;
}

- (int64_t)loggingSessionCount
{
  v2 = +[FBKSharedConstants sharedUserDefaults];
  objc_super v3 = [v2 dictionaryForKey:@"EnhancedLoggingSessions"];

  int64_t v4 = [v3 count];
  return v4;
}

- (BOOL)hasLoggingSessions
{
  return [(FBKEnhancedLoggingPersistence *)self loggingSessionCount] > 0;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void).cxx_destruct
{
}

- (void)saveSession:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Failed to archive enhanced logging session", v1, 2u);
}

- (void)deserializeSessionData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Failed to unarchive enhanced logging session", v1, 2u);
}

@end