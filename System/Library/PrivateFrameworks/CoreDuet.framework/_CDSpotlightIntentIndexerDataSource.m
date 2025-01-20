@interface _CDSpotlightIntentIndexerDataSource
+ (unint64_t)currentVersion;
- (_CDSpotlightIntentIndexerDataSource)initWithKnowledgeStore:(id)a3;
- (id)bundleIDToSearchableItemsDictionaryFromEvents:(id)a3;
@end

@implementation _CDSpotlightIntentIndexerDataSource

+ (unint64_t)currentVersion
{
  return [MEMORY[0x1E4F30508] _searchableItemVersion] + 2;
}

- (_CDSpotlightIntentIndexerDataSource)initWithKnowledgeStore:(id)a3
{
  id v4 = a3;
  v5 = +[_DKSystemEventStreams appIntentsStream];
  v8.receiver = self;
  v8.super_class = (Class)_CDSpotlightIntentIndexerDataSource;
  v6 = [(_CDSpotlightEventIndexerDataSource *)&v8 initWithKnowledgeStore:v4 eventStream:v5];

  return v6;
}

- (id)bundleIDToSearchableItemsDictionaryFromEvents:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v16 = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v3 reverseObjectEnumerator];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        objc_super v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x192FB2F20]();
        v10 = [v8 interaction];
        v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "_indexingHash"));
        if (([v4 containsObject:v11] & 1) == 0)
        {
          v12 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v8;
            _os_log_debug_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_DEBUG, "[Spotlight Indexer] Skipping indexing event into Spotlight because CDSpotlightIntentIndexerIntentShouldBeIndexed says so: %@", buf, 0xCu);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }

  v13 = (void *)[v15 copy];
  return v13;
}

@end