@interface EMFQueryLogger
+ (id)documentWeightsStringFromQueryResult:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4;
+ (id)overriddenResultsStringFromQueryResult:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4;
- (EMFQueryLogger)initWithEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3;
- (__EmojiLocaleDataWrapper)localeData;
- (void)dealloc;
- (void)logQueryResult:(id)a3;
@end

@implementation EMFQueryLogger

- (EMFQueryLogger)initWithEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EMFQueryLogger;
  v4 = [(EMFQueryLogger *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_localeData = a3;
  }
  return v4;
}

- (void)dealloc
{
  localeData = self->_localeData;
  if (localeData) {
    CFRelease(localeData);
  }
  v4.receiver = self;
  v4.super_class = (Class)EMFQueryLogger;
  [(EMFQueryLogger *)&v4 dealloc];
}

- (void)logQueryResult:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 query];
  objc_super v6 = [v5 queryString];

  v7 = [v4 query];
  v8 = [v7 tokens];
  v9 = [v8 componentsJoinedByString:@", "];

  v10 = [(id)objc_opt_class() documentWeightsStringFromQueryResult:v4 usingLocaleData:self->_localeData];
  v11 = [(id)objc_opt_class() overriddenResultsStringFromQueryResult:v4 usingLocaleData:self->_localeData];

  v12 = emf_logging_get_query_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138413058;
    v14 = v6;
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 2080;
    uint64_t v18 = [v10 cStringUsingEncoding:4];
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_debug_impl(&dword_1B8C45000, v12, OS_LOG_TYPE_DEBUG, "\nQuery Result Info\nQuery string: '%@'\nQuery tokens: '%@'\nDocument Weights:\n%s\nQueryOverride: '%@'", (uint8_t *)&v13, 0x2Au);
  }
}

+ (id)documentWeightsStringFromQueryResult:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 emojiMatchesAndDocumentWeightsUsingEmojiLocaleData:a4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = NSString;
        int v13 = [v11 objectAtIndexedSubscript:0];
        v14 = [v11 objectAtIndexedSubscript:1];
        __int16 v15 = [v12 stringWithFormat:@"%@:\t %@", v13, v14, (void)v18];

        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v16 = [v5 componentsJoinedByString:@"\n"];

  return v16;
}

+ (id)overriddenResultsStringFromQueryResult:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 resultOverride];

  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<["];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [v5 emojiMatchesForOverriddenResultsUsingEmojiLocaleData:a4];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 appendString:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    int v13 = [v5 resultOverride];
    uint64_t v14 = [v13 overrideBehavior];
    __int16 v15 = [v5 resultOverride];
    objc_msgSend(v7, "appendFormat:", @"] behavior=%lu; searchType=%lu>",
      v14,
      [v15 overrideSearchType]);

    v16 = (__CFString *)[v7 copy];
  }
  else
  {
    v16 = &stru_1F126FA78;
  }

  return v16;
}

- (__EmojiLocaleDataWrapper)localeData
{
  return self->_localeData;
}

@end