@interface EMFQueryResult
+ (__EmojiTokenWrapper)_emojiTokenForDocumentID:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4;
+ (id)_emojiStringForDocumentID:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4;
- (BOOL)_matchingDocumentWeightsContainsOnlyBlackLivesMatterResults;
- (EMFQuery)query;
- (EMFQueryResult)initWithQuery:(id)a3 andMatchingDocumentWeights:(id)a4;
- (EMFQueryResult)initWithQuery:(id)a3 matchingDocumentWeights:(id)a4 resultOverride:(id)a5;
- (EMFQueryResultOverride)resultOverride;
- (NSArray)documentMatches;
- (NSDictionary)matchingDocumentWeights;
- (id)_handleOverrideResultInterpolationForStandardResults:(id)a3;
- (id)_interpolateOverriddenResultsByAppending:(id)a3;
- (id)_interpolateOverriddenResultsByAppendingAndMoving:(id)a3;
- (id)_interpolateOverriddenResultsByFiltering:(id)a3;
- (id)_interpolateOverriddenResultsByOverwriting;
- (id)_interpolateOverriddenResultsByPrepending:(id)a3;
- (id)description;
- (id)emojiMatchesAndDocumentWeightsUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3;
- (id)emojiMatchesForOverriddenResultsUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3;
- (id)emojiStringMatchesUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3;
@end

@implementation EMFQueryResult

- (EMFQueryResult)initWithQuery:(id)a3 andMatchingDocumentWeights:(id)a4
{
  return [(EMFQueryResult *)self initWithQuery:a3 matchingDocumentWeights:a4 resultOverride:0];
}

- (EMFQueryResult)initWithQuery:(id)a3 matchingDocumentWeights:(id)a4 resultOverride:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(EMFQueryResult *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_query, a3);
    uint64_t v14 = [v10 copy];
    matchingDocumentWeights = v13->_matchingDocumentWeights;
    v13->_matchingDocumentWeights = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_resultOverride, a5);
  }

  return v13;
}

- (NSArray)documentMatches
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_matchingDocumentWeights)
  {
    documentMatches = self->_documentMatches;
    if (!documentMatches)
    {
      if ([(EMFQueryResult *)self _matchingDocumentWeightsContainsOnlyBlackLivesMatterResults])
      {
        v4 = &unk_1F12868F0;
      }
      else
      {
        v4 = [(NSDictionary *)self->_matchingDocumentWeights keysSortedByValueUsingComparator:&__block_literal_global_0];
      }
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "integerValue", (void)v18));
            [v6 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }

      v13 = (void *)[v6 copy];
      uint64_t v14 = [(EMFQueryResult *)self resultOverride];
      if (v14)
      {
        v15 = [(EMFQueryResult *)self _handleOverrideResultInterpolationForStandardResults:v13];
      }
      else
      {
        v15 = v13;
      }
      v16 = self->_documentMatches;
      self->_documentMatches = v15;

      documentMatches = self->_documentMatches;
    }
    v5 = documentMatches;
  }
  else
  {
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

uint64_t __33__EMFQueryResult_documentMatches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)emojiStringMatchesUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    sortedResultSet = self->_sortedResultSet;
    if (sortedResultSet)
    {
      v5 = [(NSOrderedSet *)sortedResultSet array];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v8 = [(EMFQueryResult *)self documentMatches];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [(id)objc_opt_class() _emojiStringForDocumentID:*(void *)(*((void *)&v17 + 1) + 8 * i) usingLocaleData:a3];
            if (v13) {
              [v7 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      v5 = +[EMFQueryResultSorter sortResults:v7 withLocaleData:a3 sortType:1];
      uint64_t v14 = (NSOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v5];
      v15 = self->_sortedResultSet;
      self->_sortedResultSet = v14;
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (id)emojiMatchesAndDocumentWeightsUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(EMFQueryResult *)self documentMatches];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      v12 = v8;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
        uint64_t v8 = [(id)objc_opt_class() _emojiStringForDocumentID:v13 usingLocaleData:a3];

        if (v8)
        {
          uint64_t v14 = [(NSDictionary *)self->_matchingDocumentWeights objectForKeyedSubscript:v13];

          v15 = &unk_1F1286B78;
          if (v14) {
            v15 = (void *)v14;
          }
          v24[0] = v8;
          v24[1] = v15;
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
          [v5 addObject:v16];

          uint64_t v9 = (void *)v14;
        }
        ++v11;
        v12 = v8;
      }
      while (v7 != v11);
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  long long v17 = (void *)[v5 copy];
  return v17;
}

- (id)emojiMatchesForOverriddenResultsUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(EMFQueryResultOverride *)self->_resultOverride results];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(id)objc_opt_class() _emojiStringForDocumentID:*(void *)(*((void *)&v14 + 1) + 8 * i) usingLocaleData:a3];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

- (id)description
{
  v3 = [(EMFQueryResult *)self documentMatches];
  v4 = [(EMFQuery *)self->_query tokens];
  id v5 = [v4 componentsJoinedByString:@" "];

  uint64_t v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = [v6 stringWithFormat:@"<%@: query tokens: '%@', matches: %lu>", v8, v5, objc_msgSend(v3, "count")];

  return v9;
}

+ (__EmojiTokenWrapper)_emojiTokenForDocumentID:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  if ((unsigned __int16)[a3 unsignedIntValue] != 1263 || (EMFIsDeviceInGreaterChina() & 1) == 0)
  {
    result = (__EmojiTokenWrapper *)CEMEmojiTokenCreateWithIndex();
    if (result) {
      return result;
    }
    log_emoji_token_creation_error();
  }
  return 0;
}

+ (id)_emojiStringForDocumentID:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  id v6 = a3;
  uint64_t v7 = (const void *)[a1 _emojiTokenForDocumentID:v6 usingLocaleData:a4];
  CFStringRef String = (const __CFString *)CEMEmojiTokenGetString();
  if (String)
  {
    Copy = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], String);
    CFRelease(v7);
  }
  else
  {
    [v6 unsignedIntValue];
    log_emoji_string_lookup_error();
    if (v7) {
      CFRelease(v7);
    }
    Copy = 0;
  }

  return Copy;
}

- (BOOL)_matchingDocumentWeightsContainsOnlyBlackLivesMatterResults
{
  v3 = [(NSDictionary *)self->_matchingDocumentWeights allKeys];
  if ([v3 count] == 3)
  {
    v4 = [(NSDictionary *)self->_matchingDocumentWeights objectForKeyedSubscript:&unk_1F1286800];
    if (v4)
    {
      id v5 = [(NSDictionary *)self->_matchingDocumentWeights objectForKeyedSubscript:&unk_1F1286818];
      if (v5)
      {
        id v6 = [(NSDictionary *)self->_matchingDocumentWeights objectForKeyedSubscript:&unk_1F1286830];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_handleOverrideResultInterpolationForStandardResults:(id)a3
{
  id v4 = a3;
  switch([(EMFQueryResultOverride *)self->_resultOverride overrideBehavior])
  {
    case 0uLL:
      id v5 = [(EMFQueryResult *)self _interpolateOverriddenResultsByOverwriting];
      break;
    case 1uLL:
      id v5 = [(EMFQueryResult *)self _interpolateOverriddenResultsByPrepending:v4];
      break;
    case 2uLL:
      id v5 = [(EMFQueryResult *)self _interpolateOverriddenResultsByAppending:v4];
      break;
    case 3uLL:
      id v5 = [(EMFQueryResult *)self _interpolateOverriddenResultsByAppendingAndMoving:v4];
      break;
    case 4uLL:
      id v5 = [(EMFQueryResult *)self _interpolateOverriddenResultsByFiltering:v4];
      break;
    default:
      id v5 = v4;
      break;
  }
  id v6 = v5;

  return v6;
}

- (id)_interpolateOverriddenResultsByPrepending:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v7 = [(EMFQueryResultOverride *)self->_resultOverride results];
  uint64_t v8 = (void *)[v6 initWithArray:v7];

  [v8 addObjectsFromArray:v5];
  uint64_t v9 = [v8 array];

  return v9;
}

- (id)_interpolateOverriddenResultsByAppending:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithArray:v5];

  BOOL v7 = [(EMFQueryResultOverride *)self->_resultOverride results];
  [v6 addObjectsFromArray:v7];

  uint64_t v8 = [v6 array];

  return v8;
}

- (id)_interpolateOverriddenResultsByAppendingAndMoving:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithArray:v5];

  BOOL v7 = [(EMFQueryResultOverride *)self->_resultOverride results];
  [v6 removeObjectsInArray:v7];

  uint64_t v8 = [(EMFQueryResultOverride *)self->_resultOverride results];
  [v6 addObjectsFromArray:v8];

  uint64_t v9 = [v6 array];

  return v9;
}

- (id)_interpolateOverriddenResultsByFiltering:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithArray:v5];

  BOOL v7 = [(EMFQueryResultOverride *)self->_resultOverride results];
  [v6 removeObjectsInArray:v7];

  uint64_t v8 = [v6 array];

  return v8;
}

- (id)_interpolateOverriddenResultsByOverwriting
{
  return [(EMFQueryResultOverride *)self->_resultOverride results];
}

- (EMFQueryResultOverride)resultOverride
{
  return self->_resultOverride;
}

- (EMFQuery)query
{
  return self->_query;
}

- (NSDictionary)matchingDocumentWeights
{
  return self->_matchingDocumentWeights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingDocumentWeights, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_resultOverride, 0);
  objc_storeStrong((id *)&self->_documentMatches, 0);
  objc_storeStrong((id *)&self->_sortedResultSet, 0);
}

@end