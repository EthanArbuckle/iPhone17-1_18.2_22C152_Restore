@interface EMFQueryResultOverrideList
- (EMFQueryResultOverrideList)initWithOverrideListURL:(id)a3;
- (id)_metadataForString:(id)a3;
- (id)_overriddenResultsRawStringExactMatchForQuery:(id)a3;
- (id)_overriddenResultsRawStringExactMatchForRawString:(id)a3 andSearchType:(unint64_t)a4;
- (id)_overriddenResultsRawStringPrefixMatchForQuery:(id)a3;
- (id)_overriddenResultsTokenExactMatchForQuery:(id)a3;
- (id)_overriddenResultsTokenPrefixMatchForQuery:(id)a3;
- (id)overriddenResultsForQuery:(id)a3;
- (id)overriddenResultsForQuery:(id)a3 searchType:(unint64_t)a4;
@end

@implementation EMFQueryResultOverrideList

- (EMFQueryResultOverrideList)initWithOverrideListURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)EMFQueryResultOverrideList;
    v5 = [(EMFQueryResultOverrideList *)&v12 init];
    if (v5 == self)
    {
      id v11 = 0;
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v4 error:&v11];
      id v8 = v11;
      if (v8)
      {
        v9 = emf_logging_get_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(EMFQueryResultOverrideList *)(uint64_t)v4 initWithOverrideListURL:v9];
        }

        v6 = 0;
      }
      else
      {
        objc_storeStrong((id *)&self->_overrideMap, v7);
        v6 = self;
      }
    }
    else
    {
      v6 = 0;
      self = v5;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)overriddenResultsForQuery:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 queryString];

    if (v6)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = [(EMFQueryResultOverrideList *)self overriddenResultsForQuery:v5 searchType:kEMFSearchTypeFallbackOrdering[v7]];
        if (v8) {
          BOOL v9 = 1;
        }
        else {
          BOOL v9 = v7 == 3;
        }
        ++v7;
      }
      while (!v9);
      v6 = (void *)v8;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)overriddenResultsForQuery:(id)a3 searchType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && ([v6 queryString], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    switch(a4)
    {
      case 0uLL:
        uint64_t v9 = [(EMFQueryResultOverrideList *)self _overriddenResultsRawStringExactMatchForQuery:v7];
        break;
      case 1uLL:
        uint64_t v9 = [(EMFQueryResultOverrideList *)self _overriddenResultsRawStringPrefixMatchForQuery:v7];
        break;
      case 2uLL:
        uint64_t v9 = [(EMFQueryResultOverrideList *)self _overriddenResultsTokenExactMatchForQuery:v7];
        break;
      case 3uLL:
        uint64_t v9 = [(EMFQueryResultOverrideList *)self _overriddenResultsTokenPrefixMatchForQuery:v7];
        break;
      default:
        goto LABEL_5;
    }
    v10 = (void *)v9;
  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (id)_metadataForString:(id)a3
{
  return [(NSDictionary *)self->_overrideMap objectForKey:a3];
}

- (id)_overriddenResultsRawStringExactMatchForRawString:(id)a3 andSearchType:(unint64_t)a4
{
  v5 = [(EMFQueryResultOverrideList *)self _metadataForString:a3];
  id v6 = v5;
  if (v5 && _searchTypeForEntryMetadata(v5) == a4)
  {
    id v7 = v6;
    uint64_t v8 = [EMFQueryResultOverride alloc];
    uint64_t v9 = [v7 objectForKey:@"results"];
    v10 = (void *)v9;
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (v9) {
      id v11 = (void *)v9;
    }
    id v12 = v11;

    uint64_t v13 = _searchTypeForEntryMetadata(v7);
    v14 = [v7 objectForKey:@"overrideBehaviorType"];

    if (v14) {
      uint64_t v15 = [v14 unsignedIntegerValue];
    }
    else {
      uint64_t v15 = 0;
    }

    v16 = [(EMFQueryResultOverride *)v8 initWithOverridesArray:v12 searchType:v13 behavior:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_overriddenResultsRawStringExactMatchForQuery:(id)a3
{
  id v4 = [a3 normalizedQueryString];
  v5 = [(EMFQueryResultOverrideList *)self _overriddenResultsRawStringExactMatchForRawString:v4 andSearchType:0];

  return v5;
}

- (id)_overriddenResultsTokenExactMatchForQuery:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(a3, "tokens", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(EMFQueryResultOverrideList *)self _overriddenResultsRawStringExactMatchForRawString:*(void *)(*((void *)&v12 + 1) + 8 * i) andSearchType:2];
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_overriddenResultsRawStringPrefixMatchForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__2;
  long long v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  uint64_t v5 = [v4 normalizedQueryString];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__EMFQueryResultOverrideList__overriddenResultsRawStringPrefixMatchForQuery___block_invoke;
  v8[3] = &unk_1E61A9A88;
  v8[4] = self;
  v8[5] = &v9;
  _enumeratePrefixesInStringUsingBlock(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __77__EMFQueryResultOverrideList__overriddenResultsRawStringPrefixMatchForQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) _overriddenResultsRawStringExactMatchForRawString:a2 andSearchType:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)_overriddenResultsTokenPrefixMatchForQuery:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 tokens];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__EMFQueryResultOverrideList__overriddenResultsTokenPrefixMatchForQuery___block_invoke;
      v12[3] = &unk_1E61A9A88;
      v12[4] = self;
      v12[5] = &v17;
      _enumeratePrefixesInStringUsingBlock(v9, v12);
      if (v18[5]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __73__EMFQueryResultOverrideList__overriddenResultsTokenPrefixMatchForQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) _overriddenResultsRawStringExactMatchForRawString:a2 andSearchType:3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (void).cxx_destruct
{
}

- (void)initWithOverrideListURL:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1B8C45000, a3, OS_LOG_TYPE_ERROR, "Override list '%@' could not be loaded: %@", (uint8_t *)&v6, 0x16u);
}

@end