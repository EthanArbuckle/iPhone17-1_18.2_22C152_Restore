@interface _DKEventStreamCache
+ (id)sharedCached;
- (id)eventStreamWithName:(id)a3 valueType:(id)a4;
@end

@implementation _DKEventStreamCache

+ (id)sharedCached
{
  if (sharedCached_onceToken != -1) {
    dispatch_once(&sharedCached_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharedCached_sharedCache;
  return v2;
}

- (id)eventStreamWithName:(id)a3 valueType:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = [(_DKEventStreamCache *)v8 objectForKey:v6];
    v10 = v9;
    if (v9
      && (!v7
       || ([v9 eventValueType],
           v11 = objc_claimAutoreleasedReturnValue(),
           int v12 = [v11 isEqual:v7],
           v11,
           v12)))
    {
      v13 = v10;
    }
    else
    {
      v13 = [[_DKEventStream alloc] initWithName:v6 valueType:v7 cache:0];
      if (v10)
      {
        v14 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v16 = [v10 eventValueType];
          int v17 = 138412802;
          id v18 = v6;
          __int16 v19 = 2112;
          v20 = v16;
          __int16 v21 = 2112;
          id v22 = v7;
          _os_log_error_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_ERROR, "Conflicting types for event stream %@. Cached: %@ vs. New: %@.", (uint8_t *)&v17, 0x20u);
        }
      }
      if (v13) {
        [(_DKEventStreamCache *)v8 setObject:v13 forKey:v6];
      }
    }

    objc_sync_exit(v8);
  }
  else
  {
    v8 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR)) {
      -[_DKEventStream initWithName:valueType:cache:](&v8->super.super);
    }
    v13 = 0;
  }

  return v13;
}

@end