@interface EMFEmojiSearchEngine
+ (BOOL)isLocaleSupported:(id)a3;
- (BOOL)enableAutocomplete;
- (EMFAutocompleteCandidateProvider)autocompleteProvider;
- (EMFEmojiSearchEngine)init;
- (EMFEmojiSearchEngine)initWithLocale:(id)a3;
- (EMFEmojiSearchEngine)initWithLocale:(id)a3 andAssetBundle:(id)a4;
- (EMFEmojiSearchEngine)initWithLocale:(id)a3 andIndexManager:(id)a4 andStringStemmer:(id)a5 andAutocompleteProvider:(id)a6;
- (EMFIndexManager)indexManager;
- (EMFQueryResultOverrideList)overrideList;
- (EMFStringStemmer)stringStemmer;
- (NSLocale)locale;
- (id)_performAutocompletedQueryForQuery:(id)a3 usingIndex:(id)a4;
- (id)_performStringQuery:(id)a3 usingIndex:(id)a4 shouldAutocomplete:(BOOL)a5 shouldStem:(BOOL)a6;
- (id)_performStringQueryOverride:(id)a3 usingIndex:(id)a4;
- (id)_performStringQueryUntokenized:(id)a3 usingIndex:(id)a4;
- (id)performQuery:(id)a3 usingIndex:(id)a4;
- (id)performStringQuery:(id)a3;
- (void)dealloc;
- (void)preheat;
- (void)setEnableAutocomplete:(BOOL)a3;
@end

@implementation EMFEmojiSearchEngine

+ (BOOL)isLocaleSupported:(id)a3
{
  return +[EMFSearchEngineBundleLoader isLocaleSupported:a3];
}

- (EMFEmojiSearchEngine)init
{
  return [(EMFEmojiSearchEngine *)self initWithLocale:0];
}

- (EMFEmojiSearchEngine)initWithLocale:(id)a3
{
  id v4 = a3;
  v5 = +[EMFSearchEngineBundleLoader assetBundleForLocale:v4];
  if (v5)
  {
    self = [(EMFEmojiSearchEngine *)self initWithLocale:v4 andAssetBundle:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EMFEmojiSearchEngine)initWithLocale:(id)a3 andAssetBundle:(id)a4
{
  id v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    id v8 = a4;
    v9 = [[EMFIndexManager alloc] initWithBundle:v8];
    v10 = [[EMFDefaultAutocompleteCandidateProvider alloc] initWithBundle:v8];

    if (+[EMFStringStemmer supportsLocale:v6]) {
      v11 = [[EMFStringStemmer alloc] initWithLocale:v6];
    }
    else {
      v11 = 0;
    }
    self = [(EMFEmojiSearchEngine *)self initWithLocale:v6 andIndexManager:v9 andStringStemmer:v11 andAutocompleteProvider:v10];

    v7 = self;
  }

  return v7;
}

- (EMFEmojiSearchEngine)initWithLocale:(id)a3 andIndexManager:(id)a4 andStringStemmer:(id)a5 andAutocompleteProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)EMFEmojiSearchEngine;
  v15 = [(EMFEmojiSearchEngine *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_indexManager, a4);
    objc_storeStrong((id *)&v16->_locale, a3);
    objc_storeStrong((id *)&v16->_stringStemmer, a5);
    objc_storeStrong((id *)&v16->_autocompleteProvider, a6);
    [v11 localeIdentifier];
    v16->_localeData = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
    v17 = [[EMFQueryLogger alloc] initWithEmojiLocaleData:v16->_localeData];
    queryLogger = v16->_queryLogger;
    v16->_queryLogger = v17;

    uint64_t v19 = +[EMFQueryResultOverrideListLoader overrideListForLocale:v11];
    overrideList = v16->_overrideList;
    v16->_overrideList = (EMFQueryResultOverrideList *)v19;

    v16->_enableAutocomplete = 1;
  }

  return v16;
}

- (void)dealloc
{
  localeData = self->_localeData;
  if (localeData) {
    CFRelease(localeData);
  }
  v4.receiver = self;
  v4.super_class = (Class)EMFEmojiSearchEngine;
  [(EMFEmojiSearchEngine *)&v4 dealloc];
}

- (void)preheat
{
  id v2 = [(EMFEmojiSearchEngine *)self indexManager];
  [v2 preheatIndexes];
}

- (id)performStringQuery:(id)a3
{
  id v4 = a3;
  v5 = emf_signpost_get_log();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = emf_signpost_get_log();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B8C45000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PerformSearchEngineQuery", (const char *)&unk_1B8CB9A5E, buf, 2u);
  }

  v9 = [(EMFEmojiSearchEngine *)self indexManager];
  v10 = [v9 stemmedIndex];

  id v11 = [(EMFEmojiSearchEngine *)self indexManager];
  id v12 = [v11 defaultIndex];
  if (v10)
  {
    id v13 = [(EMFEmojiSearchEngine *)self _performStringQueryUntokenized:v4 usingIndex:v12];

    if ([v13 count])
    {
      id v13 = v13;
      BOOL v14 = 0;
      id v15 = v13;
    }
    else
    {
      v16 = [(EMFEmojiSearchEngine *)self indexManager];
      v17 = [v16 defaultIndex];
      v18 = [(EMFEmojiSearchEngine *)self _performStringQueryOverride:v4 usingIndex:v17];

      BOOL v14 = v18 != 0;
      if (v18)
      {
        id v15 = v18;
      }
      else
      {
        uint64_t v19 = [(EMFEmojiSearchEngine *)self indexManager];
        v20 = [v19 defaultIndex];
        id v15 = [(EMFEmojiSearchEngine *)self _performStringQuery:v4 usingIndex:v20 shouldAutocomplete:1 shouldStem:0];
      }
    }
  }
  else
  {
    id v15 = [(EMFEmojiSearchEngine *)self _performStringQuery:v4 usingIndex:v12 shouldAutocomplete:1 shouldStem:1];

    BOOL v14 = 0;
    id v13 = v11;
  }

  id v21 = v15;
  uint64_t v22 = [v21 count];
  v23 = v21;
  if (!v14)
  {
    v23 = v21;
    if (!v22)
    {
      v24 = [(EMFEmojiSearchEngine *)self indexManager];
      v25 = [v24 stemmedIndex];
      v23 = [(EMFEmojiSearchEngine *)self _performStringQuery:v4 usingIndex:v25 shouldAutocomplete:0 shouldStem:1];
    }
  }
  v26 = emf_signpost_get_log();
  v27 = v26;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B8C45000, v27, OS_SIGNPOST_INTERVAL_END, v6, "PerformSearchEngineQuery", (const char *)&unk_1B8CB9A5E, v31, 2u);
  }

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v23];
  v29 = [v28 array];

  return v29;
}

- (id)performQuery:(id)a3 usingIndex:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[EMFQueryEvaluator alloc] initWithIndex:v6 andOverrideList:self->_overrideList];

  v9 = [(EMFQueryEvaluator *)v8 performQuery:v7];

  [(EMFQueryLogger *)self->_queryLogger logQueryResult:v9];
  return v9;
}

- (id)_performStringQueryOverride:(id)a3 usingIndex:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[EMFQueryEvaluator alloc] initWithIndex:v6 andOverrideList:self->_overrideList];

  v9 = [[EMFQuery alloc] initWithQueryString:v7 andLocale:self->_locale];
  v10 = [(EMFQueryEvaluator *)v8 performQuery:v9];
  [(EMFQueryLogger *)self->_queryLogger logQueryResult:v10];
  id v11 = [v10 resultOverride];
  if (v11)
  {
    id v12 = [v10 emojiStringMatchesUsingEmojiLocaleData:self->_localeData];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_performStringQueryUntokenized:(id)a3 usingIndex:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[EMFQueryUntokenized alloc] initWithQueryString:v7 andLocale:self->_locale];

  if ([(EMFQueryUntokenized *)v8 hasMultipleConstituentTokens])
  {
    v9 = [(EMFEmojiSearchEngine *)self performQuery:v8 usingIndex:v6];
    v10 = [v9 emojiStringMatchesUsingEmojiLocaleData:self->_localeData];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (id)_performStringQuery:(id)a3 usingIndex:(id)a4 shouldAutocomplete:(BOOL)a5 shouldStem:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[EMFQuery alloc] initWithQueryString:v11 andLocale:self->_locale];

  if (v6 && self->_stringStemmer) {
    -[EMFQuery setStringStemmer:](v12, "setStringStemmer:");
  }
  id v13 = [(EMFEmojiSearchEngine *)self performQuery:v12 usingIndex:v10];
  BOOL v14 = [v13 emojiStringMatchesUsingEmojiLocaleData:self->_localeData];
  id v15 = v14;
  if (v7 && self->_enableAutocomplete)
  {
    v16 = [(EMFEmojiSearchEngine *)self _performAutocompletedQueryForQuery:v12 usingIndex:v10];
    uint64_t v17 = [v15 count];
    uint64_t v18 = [v16 count];
    if ((unint64_t)(v18 + v17) >= 0x12C) {
      uint64_t v19 = 300;
    }
    else {
      uint64_t v19 = v18 + v17;
    }
    if (v19)
    {
      v20 = [v15 arrayByAddingObjectsFromArray:v16];
      objc_msgSend(v20, "subarrayWithRange:", 0, v19);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v21 = v15;
    }
  }
  else
  {
    id v21 = v14;
  }

  return v21;
}

- (id)_performAutocompletedQueryForQuery:(id)a3 usingIndex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  id v8 = [v6 tokens];
  id v45 = (id)[v8 mutableCopy];

  if (v41[5])
  {
    v9 = [v6 finalTokenUnanalyzed];
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v11 = [v10 integerForKey:@"com.apple.EmojiFoundation.maxResults"];

      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 300;
      }
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy_;
      v38 = __Block_byref_object_dispose_;
      id v39 = (id)[v6 copy];
      [(id)v35[5] reset];
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x3032000000;
      v32[3] = __Block_byref_object_copy_;
      v32[4] = __Block_byref_object_dispose_;
      id v33 = 0;
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x3032000000;
      v29 = __Block_byref_object_copy_;
      v30 = __Block_byref_object_dispose_;
      id v31 = (id)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:v12];
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy_;
      v24[4] = __Block_byref_object_dispose_;
      v25 = [[EMFQuery alloc] initWithLocale:self->_locale];
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x3032000000;
      v22[3] = __Block_byref_object_copy_;
      v22[4] = __Block_byref_object_dispose_;
      id v13 = objc_alloc(MEMORY[0x1E4F1CA80]);
      BOOL v14 = [v6 tokens];
      id v15 = [v14 firstObject];
      id v23 = (id)objc_msgSend(v13, "initWithObjects:", v15, 0);

      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy_;
      v20[4] = __Block_byref_object_dispose_;
      id v21 = v7;
      v16 = [(EMFEmojiSearchEngine *)self autocompleteProvider];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__EMFEmojiSearchEngine__performAutocompletedQueryForQuery_usingIndex___block_invoke;
      v19[3] = &unk_1E61A98D8;
      v19[6] = v32;
      v19[7] = v22;
      v19[8] = &v40;
      v19[9] = v24;
      v19[4] = self;
      v19[5] = &v34;
      v19[10] = v20;
      v19[11] = &v26;
      v19[12] = v12;
      [v16 enumerateCandidatesMatchingPrefix:v9 withEnumerationType:0 maxCandidates:20 usingBlock:v19];

      uint64_t v17 = [(id)v27[5] array];
      _Block_object_dispose(v20, 8);

      _Block_object_dispose(v22, 8);
      _Block_object_dispose(v24, 8);

      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(v32, 8);

      _Block_object_dispose(&v34, 8);
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v40, 8);

  return v17;
}

void __70__EMFEmojiSearchEngine__performAutocompletedQueryForQuery_usingIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setQueryString:a2];
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) tokens];
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "containsObject:") & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeLastObject];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setTokens:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    id v16 = [*(id *)(a1 + 32) performQuery:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) usingIndex:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    id v10 = [v16 emojiStringMatchesUsingEmojiLocaleData:*(void *)(*(void *)(a1 + 32) + 8)];
    unint64_t v11 = [v10 count];
    uint64_t v12 = *(void *)(a1 + 96);
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
    if (v11 >= v12 - v13) {
      unint64_t v14 = v12 - v13;
    }
    else {
      unint64_t v14 = v11;
    }
    id v15 = objc_msgSend(v10, "subarrayWithRange:", 0, v14);
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObjectsFromArray:v15];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    if ([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count] == *(void *)(a1 + 96)) {
      *a4 = 1;
    }
  }
}

- (NSLocale)locale
{
  return self->_locale;
}

- (EMFIndexManager)indexManager
{
  return self->_indexManager;
}

- (EMFStringStemmer)stringStemmer
{
  return self->_stringStemmer;
}

- (EMFQueryResultOverrideList)overrideList
{
  return self->_overrideList;
}

- (BOOL)enableAutocomplete
{
  return self->_enableAutocomplete;
}

- (void)setEnableAutocomplete:(BOOL)a3
{
  self->_enableAutocomplete = a3;
}

- (EMFAutocompleteCandidateProvider)autocompleteProvider
{
  return self->_autocompleteProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteProvider, 0);
  objc_storeStrong((id *)&self->_overrideList, 0);
  objc_storeStrong((id *)&self->_stringStemmer, 0);
  objc_storeStrong((id *)&self->_indexManager, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_queryLogger, 0);
}

@end