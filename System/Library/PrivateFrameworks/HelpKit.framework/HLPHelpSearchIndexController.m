@interface HLPHelpSearchIndexController
+ (id)_stopwordsForLanguage:(id)a3;
- (BOOL)useCSSearch;
- (CSPrivateSearchableIndex)privateSearchableIndex;
- (HLPHelpBookController)helpBookController;
- (NSArray)spotlightSearchResults;
- (NSDictionary)searchIndex;
- (NSMutableArray)spotlightSearchScores;
- (double)_relevanceScore:(double)a3 forRankingQueries:(id)a4;
- (id)_csQueryStringForSearchTerm:(id)a3;
- (id)_fetchAttributesForCSSearchQuery;
- (id)_rankingQueriesForSearchTerm:(id)a3;
- (id)_strippedSearchTermFromSearchTerm:(id)a3;
- (id)_tokenizeSearchTerm:(id)a3;
- (id)getAllIdentifiersFromTree:(id)a3 withMaxDepth:(int)a4;
- (id)mergeDictionary:(id)a3 withDictionary:(id)a4;
- (id)resultsWithSearchText:(id)a3 localeCode:(id)a4 searchTerms:(id *)a5;
- (id)searchTermsForSearchText:(id)a3 localeCode:(id)a4;
- (id)searchTree:(id)a3 forQueryWord:(id)a4 withMaxDepth:(int)a5;
- (void)CSSearchForSearchText:(id)a3 completionHandler:(id)a4;
- (void)_hpdResultsFromCSSearchableItems:(id)a3 rankingQueries:(id)a4;
- (void)cancelSpotlightSearch;
- (void)dealloc;
- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5;
- (void)processData:(id)a3 formattedData:(id)a4;
- (void)processFileURLWithCompletionHandler:(id)a3;
- (void)setHelpBookController:(id)a3;
- (void)setPrivateSearchableIndex:(id)a3;
- (void)setSearchIndex:(id)a3;
- (void)setSpotlightSearchScores:(id)a3;
- (void)setUseCSSearch:(BOOL)a3;
@end

@implementation HLPHelpSearchIndexController

- (void)dealloc
{
  [(HLPHelpSearchIndexController *)self cancelSpotlightSearch];
  v3.receiver = self;
  v3.super_class = (Class)HLPHelpSearchIndexController;
  [(HLPRemoteDataController *)&v3 dealloc];
}

- (void)setUseCSSearch:(BOOL)a3
{
  if (self->_useCSSearch != a3)
  {
    self->_useCSSearch = a3;
    if (a3)
    {
      if (self->_privateSearchableIndex) {
        return;
      }
      v4 = [MEMORY[0x263F02AA8] defaultSearchableIndex];
    }
    else
    {
      v4 = 0;
    }
    self->_privateSearchableIndex = v4;
    MEMORY[0x270F9A758]();
  }
}

- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = +[HLPCommonDefines assetRequestHeaderFields];
  [(HLPRemoteDataController *)self setHeaderFields:v10];

  v11.receiver = self;
  v11.super_class = (Class)HLPHelpSearchIndexController;
  [(HLPRemoteDataController *)&v11 fetchDataWithDataType:a3 identifier:v9 completionHandler:v8];
}

- (void)processFileURLWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, BOOL, id, void))a3;
  v5 = (void *)MEMORY[0x263EFF8F8];
  v6 = [(HLPRemoteDataController *)self URL];
  v7 = [v5 dataWithContentsOfURL:v6];

  if (v7)
  {
    id v10 = 0;
    id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v10];
    id v9 = v10;
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }
  [(HLPHelpSearchIndexController *)self processData:v7 formattedData:v8];
  v4[2](v4, v8 != 0, v9, 0);
}

- (void)processData:(id)a3 formattedData:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([(HLPHelpBookController *)self->_helpBookController isSemanticHTML])
    {
      [(HLPHelpSearchIndexController *)self setSearchIndex:v6];
    }
    else
    {
      id v8 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke;
      v15[3] = &unk_264578F08;
      id v16 = v8;
      id v9 = v8;
      [v6 enumerateKeysAndObjectsUsingBlock:v15];
      id v10 = [NSDictionary dictionaryWithDictionary:v9];
      [(HLPHelpSearchIndexController *)self setSearchIndex:v10];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_initWeak(&location, self);
      v7 = dispatch_get_global_queue(0, 0);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_3;
      v11[3] = &unk_264578F78;
      objc_copyWeak(&v13, &location);
      id v12 = v5;
      dispatch_async(v7, v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2;
  v9[3] = &unk_264578EE0;
  id v10 = v7;
  id v8 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init(HLPHelpSearchResult);
  [(HLPHelpSearchResult *)v8 setIdentifier:v6];

  uint64_t v7 = [v5 integerValue];
  [(HLPHelpSearchResult *)v8 setWeight:v7];
  [*(id *)(a1 + 32) addObject:v8];
}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:*(void *)(a1 + 32)];
  v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "hpd_decompressedDataUsingAlgorithm:", 2049);

    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = (void *)MEMORY[0x263F08928];
      id v8 = _allowedClassesForIndexArchive();
      id v15 = 0;
      id v9 = [v7 unarchivedObjectOfClasses:v8 fromData:v6 error:&v15];
      id v10 = v15;
      id v5 = (void *)[v9 mutableCopy];

      if (v5)
      {
        objc_super v11 = [v5 objectForKeyedSubscript:@"CS_INDEXABLE_ITEMS"];
      }
      else
      {
        id v12 = HLPLogForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v10;
          _os_log_impl(&dword_220BD8000, v12, OS_LOG_TYPE_DEFAULT, "Unable to achive search index file. %@", buf, 0xCu);
        }

        objc_super v11 = 0;
      }
    }
    else
    {
      objc_super v11 = 0;
    }
    if ([v11 count])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_41;
      block[3] = &unk_264578F50;
      block[4] = WeakRetained;
      id v14 = v11;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_41(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) privateSearchableIndex];
  [v2 indexSearchableItems:*(void *)(a1 + 40) completionHandler:&__block_literal_global_1];
}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2_42()
{
  v0 = HLPLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2_42_cold_1(v0);
  }
}

- (id)searchTermsForSearchText:(id)a3 localeCode:(id)a4
{
  id v5 = (__CFString *)a3;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFLocaleRef v7 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFLocaleIdentifier)a4);
  if (!MEMORY[0x223C700F0]())
  {
    CFRelease(v7);
    CFLocaleRef v7 = CFLocaleCopyCurrent();
  }
  v18.length = [(__CFString *)v5 length];
  v18.id location = 0;
  id v8 = CFStringTokenizerCreate(v6, v5, v18, 4uLL, v7);
  id v9 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  if (CFStringTokenizerAdvanceToNextToken(v8))
  {
    char v10 = 0;
    do
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
      objc_super v11 = (id)CFStringCreateWithSubstring(v6, v5, CurrentTokenRange);
      if ([(__CFString *)v11 length])
      {
        if ([(__CFString *)v11 isEqualToString:@"-"])
        {
          id v12 = [v9 lastObject];
          id v13 = [v12 stringByAppendingString:v11];

          [v9 removeLastObject];
          [v9 addObject:v13];

          char v10 = 1;
        }
        else if ([(__CFString *)v11 length] != 1 {
               || ([(__CFString *)v11 isEqualToString:@" "] & 1) == 0)
        }
        {
          if (v10)
          {
            id v14 = [v9 lastObject];
            id v15 = [v14 stringByAppendingString:v11];

            [v9 removeLastObject];
            [v9 addObject:v15];
          }
          else
          {
            [v9 addObject:v11];
          }
          char v10 = 0;
        }
      }
      CFRelease(v11);
    }
    while (CFStringTokenizerAdvanceToNextToken(v8));
  }
  CFRelease(v8);
  CFRelease(v7);

  return v9;
}

- (id)resultsWithSearchText:(id)a3 localeCode:(id)a4 searchTerms:(id *)a5
{
  v51[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  id v50 = (id)[MEMORY[0x263EFFA78] mutableCopy];
  if ([v8 length])
  {
    char v10 = (void *)MEMORY[0x263EFF980];
    objc_super v11 = [(HLPHelpSearchIndexController *)self searchTermsForSearchText:v8 localeCode:v9];
    id v12 = [v10 arrayWithArray:v11];

    if ([(HLPHelpBookController *)self->_helpBookController isSemanticHTML])
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke;
      v44[3] = &unk_264578FA0;
      v44[4] = self;
      v44[5] = &v45;
      [v12 enumerateObjectsUsingBlock:v44];
      if ([(id)v46[5] count])
      {
        id v13 = [(id)v46[5] keysSortedByValueUsingComparator:&__block_literal_global_55_0];
        id v14 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_3;
        v42[3] = &unk_264578E18;
        v42[4] = self;
        id v15 = v14;
        id v43 = v15;
        [v13 enumerateObjectsUsingBlock:v42];
        *a5 = [MEMORY[0x263EFF8C0] arrayWithArray:v12];
        id v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v15];
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      v30 = objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 1);
      if ([v30 isEqualToString:@" "])
      {
        v31 = 0;
      }
      else
      {
        v31 = [v12 lastObject];
      }
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_4;
      v40[3] = &unk_264578E18;
      v40[4] = self;
      id v17 = v12;
      id v41 = v17;
      [v17 enumerateObjectsUsingBlock:v40];
      if (v31)
      {
        CFRange v18 = [(HLPHelpSearchIndexController *)self searchIndex];
        v19 = [v18 allKeys];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_5;
        v37[3] = &unk_264578E18;
        id v38 = v31;
        id v39 = v17;
        [v19 enumerateObjectsUsingBlock:v37];
      }
      v20 = [(HLPHelpBookController *)self->_helpBookController copyrightTopicIdentifier];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_6;
      v34[3] = &unk_264579010;
      v34[4] = self;
      v36 = &v45;
      id v21 = v20;
      id v35 = v21;
      [v17 enumerateObjectsUsingBlock:v34];
      if ([(id)v46[5] count])
      {
        *a5 = [MEMORY[0x263EFF8C0] arrayWithArray:v17];
        v22 = [(id)v46[5] allValues];
        v23 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"matchCount" ascending:0];
        v51[0] = v23;
        v24 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"weight" ascending:0];
        v51[1] = v24;
        v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
        v26 = [v22 sortedArrayUsingDescriptors:v25];

        v27 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_8;
        v32[3] = &unk_264579038;
        v32[4] = self;
        id v28 = v27;
        id v33 = v28;
        [v26 enumerateObjectsUsingBlock:v32];
        id v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v28];
      }
      else
      {
        id v16 = 0;
      }
    }
  }
  else
  {
    id v16 = 0;
  }
  _Block_object_dispose(&v45, 8);

  return v16;
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 length])
  {
    objc_super v3 = *(void **)(a1 + 32);
    v4 = [v3 searchIndex];
    id v5 = [v3 searchTree:v4 forQueryWord:v9 withMaxDepth:10];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [*(id *)(a1 + 32) mergeDictionary:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withDictionary:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 integerValue];
  if (v6 <= [v5 integerValue])
  {
    uint64_t v8 = [v4 integerValue];
    uint64_t v7 = v8 < [v5 integerValue];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_3(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 helpBookController];
  id v7 = [v5 helpItemForID:v4];

  uint64_t v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    uint64_t v6 = v7;
  }
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_super v3 = [*(id *)(a1 + 32) searchIndex];
  id v4 = [v3 objectForKeyedSubscript:v5];

  if (!v4) {
    [*(id *)(a1 + 40) removeObject:v5];
  }
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasPrefix:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 searchIndex];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = (void *)[v6 mutableCopy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_7;
  v10[3] = &unk_264578FE8;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v9;
  long long v11 = v9;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_7(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 identifier];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v3];
  id v5 = [v9 identifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    [v9 setWeight:-1];
    id v7 = v9;
    uint64_t v8 = -1;
  }
  else
  {
    id v7 = v9;
    if (v4)
    {
      objc_msgSend(v4, "setWeight:", objc_msgSend(v4, "weight") + objc_msgSend(v9, "weight"));
      objc_msgSend(v4, "setMatchCount:", objc_msgSend(v4, "matchCount") + 1);
      goto LABEL_7;
    }
    uint64_t v8 = 1;
  }
  [v7 setMatchCount:v8];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKeyedSubscript:v3];
LABEL_7:
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 helpBookController];
  int v6 = [v4 identifier];

  id v8 = [v5 helpItemForID:v6];

  id v7 = v8;
  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v8];
    id v7 = v8;
  }
}

- (id)searchTree:(id)a3 forQueryWord:(id)a4 withMaxDepth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  uint64_t v9 = [a3 objectForKeyedSubscript:@"_"];
  char v10 = (void *)v9;
  long long v11 = 0;
  if (v8 && v9)
  {
    if ([v8 length])
    {
      id v12 = objc_msgSend(v8, "substringWithRange:", 0, 1);
      id v13 = [v10 objectForKeyedSubscript:v12];
      id v14 = [v8 substringFromIndex:1];
      if ([v8 length] == 1) {
        [(HLPHelpSearchIndexController *)self getAllIdentifiersFromTree:v13 withMaxDepth:v5];
      }
      else {
      long long v11 = [(HLPHelpSearchIndexController *)self searchTree:v13 forQueryWord:v14 withMaxDepth:v5];
      }
    }
    else
    {
      long long v11 = 0;
    }
  }

  return v11;
}

- (id)getAllIdentifiersFromTree:(id)a3 withMaxDepth:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    id v8 = [v6 objectForKeyedSubscript:@"_"];
    uint64_t v9 = v8;
    if (v8)
    {
      char v10 = [v8 objectEnumerator];
      uint64_t v11 = [v10 nextObject];
      if (v11)
      {
        id v12 = (void *)v11;
        id v13 = 0;
        uint64_t v14 = (a4 - 1);
        do
        {
          id v15 = [(HLPHelpSearchIndexController *)self getAllIdentifiersFromTree:v12 withMaxDepth:v14];
          id v16 = [(HLPHelpSearchIndexController *)self mergeDictionary:v13 withDictionary:v15];

          uint64_t v17 = [v10 nextObject];

          id v12 = (void *)v17;
          id v13 = v16;
        }
        while (v17);
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
    v19 = [v7 objectForKeyedSubscript:@"$"];
    if (v19)
    {
      uint64_t v20 = [(HLPHelpSearchIndexController *)self mergeDictionary:v16 withDictionary:v19];

      id v16 = (void *)v20;
    }
    id v18 = v16;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)mergeDictionary:(id)a3 withDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (v5)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __63__HLPHelpSearchIndexController_mergeDictionary_withDictionary___block_invoke;
      v10[3] = &unk_264579060;
      id v5 = v5;
      id v11 = v5;
      [v7 enumerateKeysAndObjectsUsingBlock:v10];
    }
    else
    {
      id v5 = (id)[v6 mutableCopy];
    }
  }
  id v8 = v5;

  return v8;
}

void __63__HLPHelpSearchIndexController_mergeDictionary_withDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    id v8 = [v7 objectForKeyedSubscript:v12];
    uint64_t v9 = [v8 integerValue];

    uint64_t v10 = [v5 integerValue];
    id v11 = [NSNumber numberWithLong:v10 + v9];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v12];
  }
  else
  {
    [v7 setObject:v5 forKeyedSubscript:v12];
  }
}

+ (id)_stopwordsForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HLPHelpSearchIndexController__stopwordsForLanguage___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_stopwordsForLanguage__pred == -1)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    id v7 = 0;
    goto LABEL_11;
  }
  dispatch_once(&_stopwordsForLanguage__pred, block);
  if (!v5) {
    goto LABEL_10;
  }
LABEL_3:
  id v6 = a1;
  objc_sync_enter(v6);
  id v7 = [(id)_stopwordsForLanguage__stopwordsCache objectForKeyedSubscript:v5];
  objc_sync_exit(v6);

  if (!v7)
  {
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = [(id)_stopwordsForLanguage__stopwordsDictionary objectForKeyedSubscript:v5];
    id v7 = [v8 setWithArray:v9];

    if (![v7 count] && (unint64_t)objc_msgSend(v5, "length") >= 3)
    {
      uint64_t v10 = [v5 substringToIndex:2];
      id v11 = (void *)MEMORY[0x263EFFA08];
      id v12 = [(id)_stopwordsForLanguage__stopwordsDictionary objectForKeyedSubscript:v10];
      uint64_t v13 = [v11 setWithArray:v12];

      id v7 = (void *)v13;
    }
    if (v7)
    {
      id v14 = v6;
      objc_sync_enter(v14);
      [(id)_stopwordsForLanguage__stopwordsCache setObject:v7 forKeyedSubscript:v5];
      objc_sync_exit(v14);
    }
  }
LABEL_11:

  return v7;
}

uint64_t __54__HLPHelpSearchIndexController__stopwordsForLanguage___block_invoke()
{
  id v0 = objc_alloc(NSDictionary);
  v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v2 = [v1 pathForResource:@"stopwords" ofType:@"plist"];
  uint64_t v3 = [v0 initWithContentsOfFile:v2];
  id v4 = (void *)_stopwordsForLanguage__stopwordsDictionary;
  _stopwordsForLanguage__stopwordsDictionary = v3;

  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  _stopwordsForLanguage__stopwordsCache = objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)_stopwordsForLanguage__stopwordsDictionary, "count"));
  return MEMORY[0x270F9A758]();
}

- (id)_strippedSearchTermFromSearchTerm:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08948] dominantLanguageForString:v4];
  id v6 = v5;
  if (v5 && ([v5 isEqualToString:@"und"] & 1) == 0)
  {
    id v7 = [(id)objc_opt_class() _stopwordsForLanguage:v6];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(HLPHelpSearchIndexController *)self _tokenizeSearchTerm:v4];
  uint64_t v9 = [v8 count] - 1;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __66__HLPHelpSearchIndexController__strippedSearchTermFromSearchTerm___block_invoke;
  v19 = &unk_264579088;
  id v20 = v7;
  id v21 = v6;
  id v22 = v10;
  uint64_t v23 = v9;
  id v11 = v10;
  id v12 = v6;
  id v13 = v7;
  [v8 enumerateObjectsUsingBlock:&v16];
  id v14 = objc_msgSend(v11, "componentsJoinedByString:", @" ", v16, v17, v18, v19);

  return v14;
}

uint64_t __66__HLPHelpSearchIndexController__strippedSearchTermFromSearchTerm___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (*(void *)(a1 + 56) == a3
    || ([*(id *)(a1 + 32) containsObject:v6] & 1) == 0
    && (![*(id *)(a1 + 40) hasPrefix:@"en"]
     || (unint64_t)[v6 length] >= 3))
  {
    [*(id *)(a1 + 48) addObject:v6];
  }
  return MEMORY[0x270F9A758]();
}

- (id)_tokenizeSearchTerm:(id)a3
{
  id v3 = a3;
  if (_tokenizeSearchTerm__onceToken != -1) {
    dispatch_once(&_tokenizeSearchTerm__onceToken, &__block_literal_global_87);
  }
  id v4 = objc_opt_new();
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = [v3 lowercaseString];
  id v5 = (void *)_tokenizeSearchTerm__doNotSplitList;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke_2;
  v20[3] = &unk_2645790B0;
  id v22 = &v23;
  id v6 = v4;
  id v21 = v6;
  [v5 enumerateObjectsUsingBlock:v20];
  id v7 = objc_opt_new();
  id v8 = (void *)v24[5];
  uint64_t v9 = [v3 length];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke_3;
  uint64_t v17 = &unk_2645790D8;
  id v10 = v6;
  id v18 = v10;
  id v11 = v7;
  id v19 = v11;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, &v14);
  id v12 = objc_msgSend(v11, "copy", v14, v15, v16, v17);

  _Block_object_dispose(&v23, 8);
  return v12;
}

void __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke()
{
  id v0 = (void *)_tokenizeSearchTerm__doNotSplitList;
  _tokenizeSearchTerm__doNotSplitList = (uint64_t)&unk_26D2A8598;
}

void __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "containsString:"))
  {
    id v3 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByReplacingOccurrencesOfString:v7 withString:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    [*(id *)(a1 + 32) setValue:v7 forKey:v3];
  }
}

void __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:v7];
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v7;
  }
  id v6 = v5;

  [*(id *)(a1 + 40) addObject:v6];
}

- (id)_csQueryStringForSearchTerm:(id)a3
{
  return (id)[NSString stringWithFormat:@"**==\"%@*\"cdwt", a3];
}

- (id)_rankingQueriesForSearchTerm:(id)a3
{
  v27[14] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v22 = objc_opt_new();
  uint64_t v5 = [(HLPHelpSearchIndexController *)self _strippedSearchTermFromSearchTerm:v4];
  uint64_t v6 = *MEMORY[0x263F028D0];
  v26 = [NSString stringWithFormat:@"%@=\"%@*\"cdwt", *MEMORY[0x263F028D0], v5];
  v27[0] = v26;
  uint64_t v7 = *MEMORY[0x263F024B8];
  uint64_t v25 = [NSString stringWithFormat:@"%@=\"%@*\"cdwt", *MEMORY[0x263F024B8], v5];
  v27[1] = v25;
  uint64_t v8 = *MEMORY[0x263F02000];
  v24 = [NSString stringWithFormat:@"%@=\"%@*\"cdwt", *MEMORY[0x263F02000], v5];
  v27[2] = v24;
  uint64_t v9 = *MEMORY[0x263F02010];
  uint64_t v23 = [NSString stringWithFormat:@"%@=\"%@*\"cdwt", *MEMORY[0x263F02010], v5];
  v27[3] = v23;
  id v21 = [NSString stringWithFormat:@"%@=\"%@\"cdwt", v6, v5];
  v27[4] = v21;
  id v20 = [NSString stringWithFormat:@"%@=\"%@\"cdwt", v7, v5];
  v27[5] = v20;
  id v19 = [NSString stringWithFormat:@"%@=\"%@\"cdwt", v8, v5];
  v27[6] = v19;
  id v18 = [NSString stringWithFormat:@"%@=\"%@\"cdwt", v9, v5];
  v27[7] = v18;
  id v10 = [NSString stringWithFormat:@"%@=\"%@*\"cdwt", v7, v4];
  v27[8] = v10;
  id v11 = [NSString stringWithFormat:@"%@=\"%@*\"cdwt", v8, v4];
  v27[9] = v11;
  id v12 = [NSString stringWithFormat:@"%@=\"%@*\"cdwt", v9, v4];
  v27[10] = v12;
  id v13 = [NSString stringWithFormat:@"%@=\"%@\"cdwt", v7, v4];
  v27[11] = v13;
  uint64_t v14 = [NSString stringWithFormat:@"%@=\"%@\"cdwt", v8, v4];
  v27[12] = v14;
  uint64_t v15 = [NSString stringWithFormat:@"%@=\"%@\"cdwt", v9, v4];

  v27[13] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:14];
  [v22 addObjectsFromArray:v16];

  return v22;
}

- (id)_fetchAttributesForCSSearchQuery
{
  if (_fetchAttributesForCSSearchQuery_onceToken != -1) {
    dispatch_once(&_fetchAttributesForCSSearchQuery_onceToken, &__block_literal_global_102);
  }
  id v2 = (void *)_fetchAttributesForCSSearchQuery_attributes;
  return v2;
}

void __64__HLPHelpSearchIndexController__fetchAttributesForCSSearchQuery__block_invoke()
{
  v5[11] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F023D0];
  v5[0] = *MEMORY[0x263F02A00];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x263F024B8];
  v5[2] = *MEMORY[0x263F02010];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x263F02620];
  v5[4] = *MEMORY[0x263F02000];
  v5[5] = v2;
  v5[6] = @"_kMDItemHelpTags";
  v5[7] = @"_kMDItemHelpIdentifier";
  v5[8] = @"_kMDItemHelpTitle";
  v5[9] = @"_kMDItemHelpSummary";
  v5[10] = @"_kMDItemHelpPath";
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:11];
  id v4 = (void *)_fetchAttributesForCSSearchQuery_attributes;
  _fetchAttributesForCSSearchQuery_attributes = v3;
}

- (double)_relevanceScore:(double)a3 forRankingQueries:(id)a4
{
  return a3 / (exp2((double)(unint64_t)[a4 count]) + -1.0);
}

- (void)_hpdResultsFromCSSearchableItems:(id)a3 rankingQueries:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__HLPHelpSearchIndexController__hpdResultsFromCSSearchableItems_rankingQueries___block_invoke;
  v9[3] = &unk_264579100;
  void v9[4] = self;
  id v8 = v7;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [v6 enumerateObjectsUsingBlock:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __80__HLPHelpSearchIndexController__hpdResultsFromCSSearchableItems_rankingQueries___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 attributeSet];
  id v4 = [v3 attributeForKey:@"_kMDItemHelpIdentifier"];

  if (v4)
  {
    uint64_t v5 = [v13 attributeSet];
    id v6 = [v5 queryResultRelevance];
    double v7 = (double)[v6 integerValue];

    [*(id *)(a1 + 32) _relevanceScore:*(void *)(a1 + 40) forRankingQueries:v7];
    double v9 = v8;
    id v10 = objc_alloc_init(HLPHelpSearchResult);
    [(HLPHelpSearchResult *)v10 setIdentifier:v4];
    [(HLPHelpSearchResult *)v10 setRelevanceScore:v9];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v12 = [WeakRetained spotlightSearchScores];
    [v12 addObject:v10];
  }
}

- (NSArray)spotlightSearchResults
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->_spotlightSearchScores sortedArrayUsingComparator:&__block_literal_global_106];
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [(HLPHelpSearchIndexController *)self helpBookController];
        id v12 = [v10 identifier];
        id v13 = [v11 helpItemForID:v12];

        if (v13) {
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

uint64_t __54__HLPHelpSearchIndexController_spotlightSearchResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 relevanceScore];
  double v6 = v5;
  [v4 relevanceScore];
  double v8 = v7;

  if (v6 < v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)cancelSpotlightSearch
{
  spotlightSearchQuery = self->_spotlightSearchQuery;
  if (spotlightSearchQuery)
  {
    [(CSSearchQuery *)spotlightSearchQuery setFoundItemsHandler:0];
    [(CSSearchQuery *)self->_spotlightSearchQuery setCompletionHandler:0];
    [(CSSearchQuery *)self->_spotlightSearchQuery cancel];
    id v4 = self->_spotlightSearchQuery;
    self->_spotlightSearchQuery = 0;

    spotlightSearchScores = self->_spotlightSearchScores;
    [(NSMutableArray *)spotlightSearchScores removeAllObjects];
  }
}

- (void)CSSearchForSearchText:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HLPHelpSearchIndexController *)self cancelSpotlightSearch];
  if (!self->_spotlightSearchScores)
  {
    double v8 = [MEMORY[0x263EFF980] array];
    spotlightSearchScores = self->_spotlightSearchScores;
    self->_spotlightSearchScores = v8;
  }
  id v10 = [v6 stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
  id v11 = [v10 stringByReplacingOccurrencesOfString:@"\" withString:@"\\\"];

  id v12 = [(HLPHelpSearchIndexController *)self _strippedSearchTermFromSearchTerm:v11];
  id v13 = NSString;
  uint64_t v14 = [(HLPHelpSearchIndexController *)self _csQueryStringForSearchTerm:v12];
  long long v15 = [v13 stringWithFormat:@"(%@)", v14];

  long long v16 = [(HLPHelpSearchIndexController *)self _rankingQueriesForSearchTerm:v11];
  long long v17 = objc_opt_new();
  long long v18 = [(HLPHelpSearchIndexController *)self _fetchAttributesForCSSearchQuery];
  [v17 setFetchAttributes:v18];

  [v17 setRankingQueries:v16];
  objc_initWeak(&location, self);
  id v19 = (CSSearchQuery *)[objc_alloc(MEMORY[0x263F02AA0]) initWithQueryString:v15 queryContext:v17];
  spotlightSearchQuery = self->_spotlightSearchQuery;
  self->_spotlightSearchQuery = v19;

  [(CSSearchQuery *)self->_spotlightSearchQuery setCompletionHandler:v7];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __72__HLPHelpSearchIndexController_CSSearchForSearchText_completionHandler___block_invoke;
  v22[3] = &unk_264579148;
  objc_copyWeak(&v24, &location);
  id v21 = v16;
  id v23 = v21;
  [(CSSearchQuery *)self->_spotlightSearchQuery setFoundItemsHandler:v22];
  [(CSSearchQuery *)self->_spotlightSearchQuery start];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __72__HLPHelpSearchIndexController_CSSearchForSearchText_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _hpdResultsFromCSSearchableItems:v4 rankingQueries:*(void *)(a1 + 32)];
}

- (BOOL)useCSSearch
{
  return self->_useCSSearch;
}

- (HLPHelpBookController)helpBookController
{
  return self->_helpBookController;
}

- (void)setHelpBookController:(id)a3
{
}

- (NSDictionary)searchIndex
{
  return self->_searchIndex;
}

- (void)setSearchIndex:(id)a3
{
}

- (CSPrivateSearchableIndex)privateSearchableIndex
{
  return self->_privateSearchableIndex;
}

- (void)setPrivateSearchableIndex:(id)a3
{
}

- (NSMutableArray)spotlightSearchScores
{
  return self->_spotlightSearchScores;
}

- (void)setSpotlightSearchScores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightSearchScores, 0);
  objc_storeStrong((id *)&self->_privateSearchableIndex, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_helpBookController, 0);
  objc_storeStrong((id *)&self->_spotlightSearchQuery, 0);
}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2_42_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_220BD8000, log, OS_LOG_TYPE_DEBUG, "searchable items indexed", v1, 2u);
}

@end