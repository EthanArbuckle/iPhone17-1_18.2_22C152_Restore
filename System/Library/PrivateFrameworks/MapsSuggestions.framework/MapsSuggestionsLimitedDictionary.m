@interface MapsSuggestionsLimitedDictionary
- (MapsSuggestionsLimitedDictionary)initWithMaximumCapacity:(unint64_t)a3;
- (NSString)description;
- (NSString)uniqueName;
- (double)totalHitRatio;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (unint64_t)hitsOnKey:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)triggerFired:(id)a3;
@end

@implementation MapsSuggestionsLimitedDictionary

- (MapsSuggestionsLimitedDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  v3 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)MapsSuggestionsLimitedDictionary;
    v5 = [(MapsSuggestionsLimitedDictionary *)&v16 init];
    v6 = v5;
    if (v5)
    {
      v5->_maxCapacity = a3;
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
      dict = v6->_dict;
      v6->_dict = (NSMutableDictionary *)v7;

      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
      hits = v6->_hits;
      v6->_hits = (NSMutableDictionary *)v9;

      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
      order = v6->_order;
      v6->_order = (NSMutableArray *)v11;

      v6->_totalHits = 0;
      v6->_totalMisses = 0;
    }
    v3 = v6;
    v13 = v3;
  }
  else
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      __int16 v19 = 1024;
      int v20 = 32;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsLimitedDictionary initWithMaximumCapacity:]";
      __int16 v23 = 2082;
      v24 = "0u == maxCapacity";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This collection won't grow, so zero doens't make any sense.", buf, 0x26u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = [(NSMutableDictionary *)v5->_hits objectForKey:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 unsignedIntegerValue] + 1;
      hits = v5->_hits;
      v10 = [NSNumber numberWithUnsignedInteger:v8];
      [(NSMutableDictionary *)hits setObject:v10 forKey:v4];

      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          [(MapsSuggestionsLimitedDictionary *)v5 totalHitRatio];
          int v17 = 138412802;
          v18 = v4;
          __int16 v19 = 1024;
          *(_DWORD *)int v20 = v8;
          *(_WORD *)&v20[4] = 2048;
          *(void *)&v20[6] = v12;
          _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "HIT '%@' x %u (total ratio: %.2f)", (uint8_t *)&v17, 0x1Cu);
        }
      }
      ++v5->_totalHits;
      v13 = [(NSMutableDictionary *)v5->_dict objectForKey:v4];
    }
    else
    {
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          [(MapsSuggestionsLimitedDictionary *)v5 totalHitRatio];
          int v17 = 138412546;
          v18 = v4;
          __int16 v19 = 2048;
          *(void *)int v20 = v15;
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "MISSED '%@' (total ratio: %.2f)", (uint8_t *)&v17, 0x16u);
        }
      }
      v13 = 0;
      ++v5->_totalMisses;
    }

    objc_sync_exit(v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsLimitedDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      __int16 v19 = 1024;
      *(_DWORD *)int v20 = 48;
      *(_WORD *)&v20[4] = 2082;
      *(void *)&v20[6] = "-[MapsSuggestionsLimitedDictionary objectForKeyedSubscript:]";
      __int16 v21 = 2082;
      v22 = "nil == (key)";
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v17, 0x26u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      __int16 v14 = 1024;
      int v15 = 73;
      __int16 v16 = 2082;
      int v17 = "-[MapsSuggestionsLimitedDictionary setObject:forKeyedSubscript:]";
      __int16 v18 = 2082;
      __int16 v19 = "nil == (key)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v6)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      __int16 v14 = 1024;
      int v15 = 74;
      __int16 v16 = 2082;
      int v17 = "-[MapsSuggestionsLimitedDictionary setObject:forKeyedSubscript:]";
      __int16 v18 = 2082;
      __int16 v19 = "nil == (obj)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an object", (uint8_t *)&v12, 0x26u);
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSMutableArray *)v8->_order indexOfObject:v7];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)v8->_order removeObjectAtIndex:v9];
  }
  if ([(NSMutableArray *)v8->_order count] + 1 > v8->_maxCapacity)
  {
    v10 = [(NSMutableArray *)v8->_order firstObject];
    [(NSMutableArray *)v8->_order removeObjectAtIndex:0];
    [(NSMutableDictionary *)v8->_dict removeObjectForKey:v10];
    [(NSMutableDictionary *)v8->_hits removeObjectForKey:v10];
  }
  [(NSMutableDictionary *)v8->_dict setObject:v6 forKey:v7];
  [(NSMutableDictionary *)v8->_hits setObject:&unk_1EFC89888 forKey:v7];
  [(NSMutableArray *)v8->_order addObject:v7];
  objc_sync_exit(v8);

LABEL_14:
}

- (void)removeObjectForKey:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_dict removeObjectForKey:v5];
  [(NSMutableDictionary *)v4->_hits removeObjectForKey:v5];
  [(NSMutableArray *)v4->_order removeObject:v5];
  objc_sync_exit(v4);
}

- (void)removeAllObjects
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_dict removeAllObjects];
  [(NSMutableArray *)obj->_order removeAllObjects];
  obj->_totalHits = 0;
  obj->_totalMisses = 0;
  objc_sync_exit(obj);
}

- (unint64_t)count
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(NSMutableDictionary *)v2->_dict count];
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)hitsOnKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)v5->_hits objectForKey:v4];
    unint64_t v7 = [v6 unsignedIntegerValue];

    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      __int16 v12 = 1024;
      int v13 = 127;
      __int16 v14 = 2082;
      int v15 = "-[MapsSuggestionsLimitedDictionary hitsOnKey:]";
      __int16 v16 = 2082;
      int v17 = "nil == (key)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v10, 0x26u);
    }

    unint64_t v7 = 0;
  }

  return v7;
}

- (double)totalHitRatio
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t totalHits = v2->_totalHits;
  unint64_t v4 = v2->_totalMisses + totalHits;
  if (v4) {
    double v5 = (double)totalHits / (double)v4;
  }
  else {
    double v5 = 0.0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (NSString)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  context = (void *)MEMORY[0x1AD0C8E80](v3);
  v22.receiver = v2;
  v22.super_class = (Class)MapsSuggestionsLimitedDictionary;
  unint64_t v4 = [(MapsSuggestionsLimitedDictionary *)&v22 description];
  double v5 = (void *)[v4 mutableCopy];

  objc_msgSend(v5, "appendFormat:", @"(%u){ ", -[NSMutableDictionary count](v2->_dict, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = v2->_order;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int v10 = [(NSMutableDictionary *)v2->_hits objectForKeyedSubscript:v9];
        uint64_t v11 = [v10 unsignedIntegerValue];
        __int16 v12 = [(NSMutableDictionary *)v2->_dict objectForKeyedSubscript:v9];
        [v5 appendFormat:@"'%@' (%u hits) => '%@', ", v9, v11, v12];
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  [(MapsSuggestionsLimitedDictionary *)v2 totalHitRatio];
  [v5 appendFormat:@"} (hit ratio: %.2f)", v13];
  __int16 v14 = (void *)[v5 copy];

  objc_sync_exit(v2);

  return (NSString *)v14;
}

- (void)triggerFired:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    double v5 = [(MapsSuggestionsLimitedDictionary *)self uniqueName];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Throwing away all content for %@", (uint8_t *)&v6, 0xCu);
  }
  [(MapsSuggestionsLimitedDictionary *)self removeAllObjects];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_hits, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end