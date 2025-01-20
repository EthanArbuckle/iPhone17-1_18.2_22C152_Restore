@interface CSUserQuery
+ (BOOL)skipTextSemanticSearchForSearchString:(id)a3 tokenCount:(id)a4 queryContext:(id)a5 skipReason:(id *)a6;
+ (double)computeScoreForNameUnigrams:(id)a3 queryUnigrams:(id)a4 queryString:(id)a5 locale:(id)a6 isContactsSuggestion:(BOOL)a7;
+ (double)computeTopicalityScoreForName:(id)a3 inputName:(id)a4 numTokensInName:(unint64_t)a5 isContactsSuggestion:(BOOL)a6 queryUnigrams:(id)a7 isFirstName:(BOOL)a8 locale:(id)a9;
+ (id)advancedComponentsWithSearchString:(id)a3 userQueryString:(id)a4 parseResult:(id)a5 parseOptions:(id)a6 userQueryOptions:(unsigned int)a7;
+ (id)collectUnigrams:(id)a3 locale:(id)a4;
+ (id)computeEmailAddressTopicalityScore:(id)a3 inputEmailAddress:(id)a4 queryUnigrams:(id)a5 locale:(id)a6;
+ (id)computeRankingScoreForSuggestion:(id)a3 queryString:(id)a4 locale:(id)a5;
+ (id)dedupSuggestions:(id)a3 queryContextScopeIsToPerson:(BOOL)a4 seenContactInfoToSuggestion:(id)a5;
+ (id)dedupedDateSuggestions:(id)a3;
+ (id)dedupedNextTokenSuggestions:(id)a3 context:(id)a4;
+ (id)dedupedSuggestions:(id)a3 options:(id)a4;
+ (id)dedupedSuggestions:(id)a3 queryContextScopeIsToPerson:(BOOL)a4 options:(id)a5;
+ (id)defaultParseOptionsForClientContext:(id)a3;
+ (id)emailSpecialChars;
+ (id)flattenCSFieldSpecifications:(id)a3;
+ (id)generateFilterQueriesBasedOnPreviousSuggestions:(id)a3;
+ (id)mailResources;
+ (id)normalizeAndTrimContacts:(id)a3 maxCount:(int64_t)a4;
+ (id)orderedSuggestions:(id)a3 options:(id)a4;
+ (id)orderedSuggestionsForPhotos:(id)a3 options:(id)a4;
+ (id)parseResultWithSearchString:(id)a3 parseOptions:(id)a4 queryContext:(id)a5 isZKW:(BOOL)a6;
+ (id)parseSearchString:(id)a3 parseOptions:(id)a4 userQueryOptions:(unsigned int)a5;
+ (id)queryContextWithUserQueryString:(id)a3 searchString:(id)a4 clientContext:(id)a5;
+ (id)removeSuggestionsAndTrimChars:(id)a3;
+ (id)suggestionsByDetectingEmailIntentForPeopleSuggestions:(id)a3;
+ (id)trimCharactersInString:(id)a3;
+ (id)trimSuggestions:(id)a3 options:(id)a4 peopleSelectedScope:(int64_t)a5 isShortQuery:(BOOL)a6;
+ (void)computeRankingScoreForSuggestions:(id)a3 queryString:(id)a4 locale:(id)a5;
+ (void)filteredTemplateSuggestions:(id)a3 nlpSuggestions:(id)a4;
+ (void)preheat:(id)a3;
+ (void)prepare;
+ (void)prepareLocalResources;
+ (void)prepareProtectionClasses:(id)a3;
+ (void)sortSearchableItems:(id)a3;
+ (void)updateWithTemplateSuggestions:(id)a3 searchString:(id)a4 currentSuggestion:(id)a5;
- (BOOL)isTopHitQuery;
- (BOOL)queryRewritten;
- (CSUserQuery)initWithQueryString:(id)a3 context:(id)a4;
- (CSUserQuery)initWithQueryString:(id)a3 queryContext:(id)a4;
- (CSUserQuery)initWithSearchString:(id)a3 keyboardLanguage:(id)a4 attributes:(id)a5;
- (CSUserQuery)initWithUserAttributedQueryString:(id)a3 userQueryContext:(id)a4;
- (CSUserQuery)initWithUserQueryString:(NSString *)userQueryString userQueryContext:(CSUserQueryContext *)userQueryContext;
- (CSUserQuery)initWithUserQueryString:(id)a3 queryContext:(id)a4;
- (CSUserQuery)initWithUserString:(id)a3 queryContext:(id)a4;
- (NSArray)contactSearchResults;
- (NSInteger)foundSuggestionCount;
- (OS_dispatch_semaphore)contactSearchSemaphore;
- (id)attributedQueryHandler;
- (id)clientContext;
- (id)filterQueries;
- (id)foundCompletions;
- (id)foundInstantAnswers;
- (id)foundInstantAnswersHandler;
- (id)foundInstantAnswersHandlerOld;
- (id)foundNLPSuggestions;
- (id)foundSuggestions;
- (id)foundTemplateSuggestions;
- (id)keyboardLanguage;
- (id)peopleSuggestionsWithContactSearchResults:(id)a3;
- (id)processFromContacts:(id)a3 resultsFromMultiQuery:(id)a4 contactsFrom:(id)a5 processedContacts:(id)a6;
- (id)processToContacts:(id)a3 resultsToMultiQuery:(id)a4 contactsTo:(id)a5 processedContacts:(id)a6;
- (id)queryContext;
- (id)queryStringWithQueryContext:(id)a3 searchString:(id)a4 options:(id)a5;
- (unint64_t)contactSearchSemaphoreWaitTime;
- (void)cancel;
- (void)filterContactPeopleSuggestions:(id)a3 cachedSuggestionsEmailToScope:(id)a4 completionHandler:(id)a5;
- (void)foundSuggestionsHandler;
- (void)handleCompletion:(id)a3;
- (void)handleFoundCompletions:(id)a3;
- (void)handleFoundInstantAnswer:(id)a3;
- (void)handleFoundInstantAnswers:(id)a3;
- (void)handleFoundItems:(id)a3;
- (void)handleFoundNLPSuggestions:(id)a3;
- (void)handleFoundSuggestions:(id)a3;
- (void)handleFoundTemplateSuggestions:(id)a3;
- (void)handleInstantAnswers;
- (void)handleParseResult:(id)a3;
- (void)handleQueryRewritten;
- (void)handleSuggestions;
- (void)prepareSearch;
- (void)processInstantAnswersWithFoundItems:(id)a3;
- (void)setAttributedQueryHandler:(id)a3;
- (void)setContactSearchResults:(id)a3;
- (void)setFilterQueries:(id)a3;
- (void)setFoundInstantAnswersHandler:(id)a3;
- (void)setFoundInstantAnswersHandlerOld:(id)a3;
- (void)setFoundSuggestionsHandler:(void *)foundSuggestionsHandler;
- (void)start;
- (void)startContactSearchIfNeededWithSearchQuery:(id)a3;
- (void)startContactSearchWithUserQuery:(id)a3 maxCount:(int64_t)a4;
- (void)userEngagedWithItem:(id)a3 visibleItems:(id)a4 userInteractionType:(int64_t)a5;
- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4;
- (void)userEngagedWithResult:(id)a3 visibleResults:(id)a4 interactionType:(int)a5;
- (void)willStartQuery;
@end

@implementation CSUserQuery

+ (void)prepare
{
}

+ (void)prepareLocalResources
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CSUserQuery_prepareLocalResources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (prepareLocalResources_onceToken != -1) {
    dispatch_once(&prepareLocalResources_onceToken, block);
  }
  v2 = [(id)objc_opt_class() defaultParseOptionsForClientContext:prepareLocalResources_sBundleID];
  v3 = GetCSUserQueryParser();
  [v3 _CSUserQueryPreheatWithOptionsDict:v2];
}

id __36__CSUserQuery_prepareLocalResources__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  uint64_t v2 = [v1 copy];
  v3 = (void *)prepareLocalResources_sBundleID;
  prepareLocalResources_sBundleID = v2;

  id result = (id)[(id)prepareLocalResources_sBundleID isEqualToString:@"com.apple.mobilemail"];
  if (result) {
    return (id)[(id)objc_opt_class() mailResources];
  }
  return result;
}

+ (void)prepareProtectionClasses:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CSUserQuery_prepareProtectionClasses___block_invoke;
  block[3] = &unk_1E5548F00;
  id v8 = v4;
  uint64_t v5 = prepareProtectionClasses__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&prepareProtectionClasses__onceToken, block);
  }
  [a1 prepareLocalResources];
}

uint64_t __40__CSUserQuery_prepareProtectionClasses___block_invoke(uint64_t a1)
{
  return +[CSSearchQuery preheat:*(void *)(a1 + 32)];
}

+ (void)preheat:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__CSUserQuery_preheat___block_invoke;
  block[3] = &unk_1E5548F00;
  id v8 = v4;
  uint64_t v5 = preheat__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&preheat__onceToken, block);
  }
  [a1 prepareLocalResources];
}

uint64_t __23__CSUserQuery_preheat___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    v1 = *(void **)(a1 + 32);
  }
  else {
    v1 = &unk_1EDBD5AB8;
  }
  return +[CSSearchQuery preheat:v1];
}

+ (id)mailResources
{
  if (mailResources_onceMailResourcesToken != -1) {
    dispatch_once(&mailResources_onceMailResourcesToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)mailResources_sMailResources;

  return v2;
}

void __28__CSUserQuery_mailResources__block_invoke()
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v0 = (void *)getSRResourcesManagerClass_softClass;
  uint64_t v11 = getSRResourcesManagerClass_softClass;
  if (!getSRResourcesManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getSRResourcesManagerClass_block_invoke;
    v7[3] = &unk_1E5548E88;
    v7[4] = &v8;
    __getSRResourcesManagerClass_block_invoke((uint64_t)v7);
    v0 = (void *)v9[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v8, 8);
  uint64_t v2 = logForCSLogCategoryQuery();
  v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __28__CSUserQuery_mailResources__block_invoke_cold_5();
    }

    if (objc_opt_respondsToSelector())
    {
      v3 = [v1 performSelector:sel_sharedResourcesManager];
      if (objc_opt_respondsToSelector())
      {
        [v3 performSelector:sel_loadAllParametersForClient_ withObject:@"Mail"];
      }
      else
      {
        id v4 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          __28__CSUserQuery_mailResources__block_invoke_cold_3();
        }
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v5 = [v3 performSelector:sel_resourcesForClient_options_ withObject:@"Mail" withObject:&unk_1EDBD6B38];
        id v6 = mailResources_sMailResources;
        mailResources_sMailResources = v5;
      }
      else
      {
        id v6 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __28__CSUserQuery_mailResources__block_invoke_cold_2();
        }
      }
    }
    else
    {
      v3 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __28__CSUserQuery_mailResources__block_invoke_cold_4();
      }
    }
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    __28__CSUserQuery_mailResources__block_invoke_cold_1();
  }
}

+ (void)sortSearchableItems:(id)a3
{
}

uint64_t __35__CSUserQuery_sortSearchableItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 attributeSet];
  id v6 = [v5 attributeDictionary];
  v7 = [v6 objectForKeyedSubscript:@"kMDQueryResultScoreL2"];

  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = [NSNumber numberWithFloat:0.0];

    v7 = (void *)v8;
  }
  v9 = [v4 attributeSet];
  uint64_t v10 = [v9 attributeDictionary];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"kMDQueryResultScoreL2"];

  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v12 = [NSNumber numberWithFloat:0.0];

    uint64_t v11 = (void *)v12;
  }
  [v7 floatValue];
  float v14 = v13;
  [v11 floatValue];
  if (v14 <= v15)
  {
    [v7 floatValue];
    float v18 = v17;
    [v11 floatValue];
    uint64_t v16 = v18 < v19;
  }
  else
  {
    uint64_t v16 = -1;
  }

  return v16;
}

+ (void)updateWithTemplateSuggestions:(id)a3 searchString:(id)a4 currentSuggestion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v11 = [v8 stringByTrimmingCharactersInSet:v10];

    if ([v11 length])
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      float v13 = objc_msgSend(v9, "suggestionTokens", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            float v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ([v18 internalType] != 1) {
              [v12 addObject:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v15);
      }

      float v19 = [v9 userQueryString];
      uint64_t v20 = +[CSSuggestion updatedSuggestionWithCurrentSuggestion:v9 userString:v19 tokens:v12];

      v21 = [MEMORY[0x1E4F1CA48] array];
      v22 = +[CSSuggestion subjectSuggestionWithUserString:0 currentSuggestion:v20];
      if (v22) {
        [v21 addObject:v22];
      }
      v23 = +[CSSuggestion attachmentNameSuggestionWithUserString:0 currentSuggestion:v20];
      if (v23) {
        [v21 addObject:v23];
      }
      v24 = +[CSSuggestion messageWithAttachmentsSuggestionWithUserString:0 currentSuggestion:v20];
      if (v24) {
        [v21 addObject:v24];
      }
      if (_os_feature_enabled_impl() && (unint64_t)[v11 length] >= 2)
      {
        v25 = +[CSSuggestion senderContainsSuggestionWithUserString:v11 currentSuggestion:v20];
        if (v25) {
          [v21 addObject:v25];
        }
      }
      [v7 addObjectsFromArray:v21];

      id v9 = (id)v20;
    }
  }
}

+ (id)flattenCSFieldSpecifications:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "dictionaryFormat", (void)v14);
        id v12 = [v10 displayName];
        [v4 setValue:v11 forKey:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)queryContextWithUserQueryString:(id)a3 searchString:(id)a4 clientContext:(id)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  v48 = v9;
  if (!v9)
  {
    id v9 = +[CSUserQueryContext userQueryContextWithCurrentSuggestion:0];
    v50[0] = @"kMDItemDisplayName";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    [v9 setFetchAttributes:v10];

    [v9 setMaxRankedResultCount:100];
    [v9 setMaxSuggestionCount:10];
  }
  uint64_t v11 = [CSSearchQueryContext alloc];
  id v12 = objc_msgSend(v9, "xpc_dictionary");
  float v13 = [(CSSearchQueryContext *)v11 initWithXPCDictionary:v12];

  if ([v9 generateSuggestions]) {
    BOOL v14 = [v9 maxSuggestionCount] > 0;
  }
  else {
    BOOL v14 = 0;
  }
  [(CSSearchQueryContext *)v13 setGenerateSuggestions:v14];
  -[CSSearchQueryContext setMaxCount:](v13, "setMaxCount:", [v9 maxResultCount]);
  -[CSSearchQueryContext setMaxRankedResultCount:](v13, "setMaxRankedResultCount:", [v9 maxRankedResultCount]);
  -[CSSearchQueryContext setMaxSuggestionCount:](v13, "setMaxSuggestionCount:", [v9 maxSuggestionCount]);
  [v9 embeddingRelevanceThreshold];
  -[CSSearchQueryContext setEmbeddingRelevanceThreshold:](v13, "setEmbeddingRelevanceThreshold:");
  uint64_t v15 = [v9 enableSuggestionTokens];
  uint64_t v16 = [v9 enableRecentSuggestions];
  uint64_t v17 = [v9 enableResultCountsPerSuggestion];
  BOOL v18 = ([v9 enableRankedResults] & 1) != 0 || objc_msgSend(v9, "rankingType") == 1;
  int v19 = [v9 isMail];
  if (v19)
  {
    if ([(CSSearchQueryContext *)v13 maxRankedResultCount] <= 0) {
      [(CSSearchQueryContext *)v13 setMaxRankedResultCount:[(CSSearchQueryContext *)v13 maxCount]];
    }
    uint64_t v15 = 1;
    [(CSSearchQueryContext *)v13 setFilterTopHits:1];
    uint64_t v16 = 1;
    uint64_t v17 = 1;
  }
  [(CSSearchQueryContext *)v13 setEnableSuggestionTokens:v15];
  [(CSSearchQueryContext *)v13 setEnableRecentSuggestions:v16];
  [(CSSearchQueryContext *)v13 setEnableResultCountsPerSuggestion:v17];
  uint64_t v20 = [v9 customFieldSpecifications];
  [(CSSearchQueryContext *)v13 setCustomFieldSpecifications:v20];

  v21 = [v9 options];
  [(CSSearchQueryContext *)v13 setOptions:v21];

  -[CSSearchQueryContext setFeedbackQueryID:](v13, "setFeedbackQueryID:", [v9 feedbackQueryID]);
  if (v18)
  {
    [(CSSearchQueryContext *)v13 setLowPriority:0];
    [(CSSearchQueryContext *)v13 setRankingType:1];
    [(CSSearchQueryContext *)v13 setFilterTopHits:0];
    if ([(CSSearchQueryContext *)v13 maxCount] >= 1) {
      [(CSSearchQueryContext *)v13 setFilterTopHits:1];
    }
    v49[0] = @"kMDQueryResultNewMatchedExtraQueriesField";
    v49[1] = @"kMDQueryResultScoreL1";
    v49[2] = @"kMDQueryResultScoreL2";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    v23 = [v9 fetchAttributes];
    if ([v23 count])
    {
      [v9 fetchAttributes];
      v24 = v7;
      long long v26 = v25 = v8;
      long long v27 = [v26 arrayByAddingObjectsFromArray:v22];
      [(CSSearchQueryContext *)v13 setFetchAttributes:v27];

      id v8 = v25;
      uint64_t v7 = v24;
    }
    else
    {
      [(CSSearchQueryContext *)v13 setFetchAttributes:v22];
    }
  }
  long long v28 = [v9 suggestion];
  long long v29 = (void *)[v28 copy];

  [v29 setEnableFragments:v15];
  [(CSSearchQueryContext *)v13 setSuggestion:v29];
  v30 = &stru_1EDBB3A50;
  if (v7) {
    v30 = v7;
  }
  uint64_t v31 = v30;
  v32 = [(CSSearchQueryContext *)v13 suggestion];

  if (v32)
  {
    v33 = [(CSSearchQueryContext *)v13 suggestion];
    v34 = [v33 userQueryString];

    if ([(CSSearchQueryContext *)v13 enableSuggestionTokens])
    {
      if (!v19 || v7 && v34 && ([(__CFString *)v31 isEqualToString:v34] & 1) != 0) {
        goto LABEL_36;
      }
      v47 = v7;
      id v35 = v8;
      v36 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        +[CSUserQuery queryContextWithUserQueryString:searchString:clientContext:](v48);
      }

      v37 = [(CSSearchQueryContext *)v13 suggestion];
      v38 = [(CSSearchQueryContext *)v13 suggestion];
      v39 = [v38 currentTokens];
      v40 = +[CSSuggestion updatedSuggestionWithCurrentSuggestion:v37 userString:v31 tokens:v39];
      [(CSSearchQueryContext *)v13 setSuggestion:v40];
    }
    else
    {
      v47 = v7;
      id v35 = v8;
      v42 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        +[CSUserQuery queryContextWithUserQueryString:searchString:clientContext:](v48);
      }

      v37 = [(CSSearchQueryContext *)v13 suggestion];
      v38 = +[CSSuggestion suggestionWithUserString:v31 currentSuggestion:v37];
      [(CSSearchQueryContext *)v13 setSuggestion:v38];
    }

    id v8 = v35;
    uint64_t v7 = v47;
LABEL_36:
    v43 = [(CSSearchQueryContext *)v13 suggestion];
    uint64_t v44 = [v43 userQueryString];

    v45 = [(CSSearchQueryContext *)v13 suggestion];
    v41 = [v45 searchString];

    uint64_t v31 = (__CFString *)v44;
    goto LABEL_37;
  }
  v41 = v31;
LABEL_37:
  [(CSSearchQueryContext *)v13 setUserQuery:v31];
  if (v8 && v41) {
    [v8 appendString:v41];
  }

  return v13;
}

+ (id)advancedComponentsWithSearchString:(id)a3 userQueryString:(id)a4 parseResult:(id)a5 parseOptions:(id)a6 userQueryOptions:(unsigned int)a7
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v110 = a4;
  id v82 = a5;
  id v93 = a6;
  v84 = v10;
  v96 = objc_msgSend(v10, "cs_escapedStringForSearchQuery");
  v102 = [v93 objectForKeyedSubscript:@"kMDQueryOptionContextIdentifier"];
  id v90 = [MEMORY[0x1E4F1CA60] dictionary];
  id v104 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v82 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryAdvancedComponentsKey"];
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v87 = [obj countByEnumeratingWithState:&v144 objects:v151 count:16];
  if (!v87)
  {
    char v85 = 0;
    v109 = 0;
    goto LABEL_149;
  }
  char v85 = 0;
  v109 = 0;
  uint64_t v86 = *(void *)v145;
  uint64_t v105 = *MEMORY[0x1E4F28540];
  uint64_t v95 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v145 != v86)
      {
        uint64_t v12 = v11;
        objc_enumerationMutation(obj);
        uint64_t v11 = v12;
      }
      uint64_t v89 = v11;
      float v13 = *(void **)(*((void *)&v144 + 1) + 8 * v11);
      BOOL v14 = objc_msgSend(obj, "lastObject", v82);
      LODWORD(v103) = [v13 isEqualToDictionary:v14];

      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v111 = v13;
      uint64_t v108 = [v111 countByEnumeratingWithState:&v140 objects:v150 count:16];
      if (!v108)
      {

        if (v103)
        {
          v54 = 0;
          uint64_t v55 = 0;
          uint64_t v94 = -1;
          goto LABEL_116;
        }
        v76 = 0;
        goto LABEL_145;
      }
      uint64_t v15 = 0;
      uint64_t v106 = *(void *)v141;
      uint64_t v107 = 0;
      uint64_t v94 = -1;
      uint64_t v112 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v113 = 0;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v141 != v106)
          {
            uint64_t v17 = v16;
            objc_enumerationMutation(v111);
            uint64_t v16 = v17;
          }
          uint64_t v115 = v16;
          BOOL v18 = *(void **)(*((void *)&v140 + 1) + 8 * v16);
          v117 = [v111 objectForKeyedSubscript:v18];

          int v19 = [v117 objectForKeyedSubscript:@"ATTRS"];
          v116 = v19;
          if (!v19)
          {
            v21 = [v117 objectForKeyedSubscript:@"TYPE"];
            if (v102 && [v102 isEqualToString:@"com.apple.mail"])
            {
              if (([v21 hasPrefix:@"DATES"] & 1) == 0)
              {
                if ([v21 hasSuffix:@"MAIL"]) {
                  goto LABEL_18;
                }
                int v31 = [v21 hasSuffix:@"MESSAGES"];
                uint64_t v22 = 14;
                if (!v31) {
                  uint64_t v22 = 2;
                }
LABEL_54:
                uint64_t v113 = v22;

                goto LABEL_55;
              }
            }
            else if (([v21 hasPrefix:@"DATES"] & 1) == 0)
            {
              if ([v21 hasSuffix:@"CONTACT"])
              {
                uint64_t v22 = 16;
                goto LABEL_54;
              }
              if (([v21 hasSuffix:@"DOCUMENTS"] & 1) == 0)
              {
                if ([v21 hasSuffix:@"EMAIL"]) {
                  goto LABEL_46;
                }
                if ([v21 hasSuffix:@"EVENT"])
                {
                  uint64_t v22 = 7;
                  goto LABEL_54;
                }
                if (([v21 hasSuffix:@"TODO"] & 1) != 0
                  || ([v21 hasSuffix:@"EVENT_TODO"] & 1) != 0)
                {
                  uint64_t v22 = 21;
                  goto LABEL_54;
                }
                if ([v21 hasSuffix:@"IMAGES"])
                {
                  uint64_t v22 = 10;
                  goto LABEL_54;
                }
                if ([v21 hasSuffix:@"MOVIES"])
                {
                  uint64_t v22 = 36;
                  goto LABEL_54;
                }
                if ([v21 hasSuffix:@"MUSIC"])
                {
                  uint64_t v22 = 3;
                  goto LABEL_54;
                }
                if ([v21 hasSuffix:@"MAIL"])
                {
LABEL_46:
                  uint64_t v22 = 11;
                  goto LABEL_54;
                }
                if ([v21 hasSuffix:@"MESSAGES"])
                {
LABEL_18:
                  uint64_t v22 = 14;
                  goto LABEL_54;
                }
                if (([v21 hasSuffix:@"PDF"] & 1) == 0)
                {
                  if ([v21 hasSuffix:@"PRESENTATIONS"])
                  {
                    uint64_t v22 = 18;
                  }
                  else if ([v21 hasSuffix:@"SPREADSHEETS"])
                  {
                    uint64_t v22 = 23;
                  }
                  else
                  {
                    int v52 = [v21 hasSuffix:@"SOURCE"];
                    uint64_t v22 = 6;
                    if (v52) {
                      uint64_t v22 = 22;
                    }
                  }
                  goto LABEL_54;
                }
              }
              uint64_t v22 = 6;
              goto LABEL_54;
            }
            uint64_t v22 = 5;
            goto LABEL_54;
          }
          if ([v19 containsObject:@"kMDItemContentCreationDate"])
          {
            uint64_t v20 = 5;
LABEL_21:
            uint64_t v113 = v20;
            goto LABEL_55;
          }
          if ([v116 containsObject:@"kMDItemAuthors"])
          {
            uint64_t v94 = 0;
            uint64_t v20 = 16;
            goto LABEL_21;
          }
          if ([v116 containsObject:@"kMDItemRecipients"])
          {
            uint64_t v113 = 16;
            uint64_t v94 = 1;
          }
          else if (([v116 containsObject:@"kMDItemSubject"] & 1) != 0 {
                 || ([v116 containsObject:@"kMDItemTitle"] & 1) != 0
          }
                 || [v116 containsObject:@"kMDItemDisplayName"])
          {
            v21 = [v18 stringByReplacingOccurrencesOfString:@":" withString:@" "];
            v23 = +[CSUserQuery parseSearchString:v21 parseOptions:v93 userQueryOptions:a7];
            v24 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryUniversalSuggestionsKey"];
            if ([v24 count])
            {
              long long v138 = 0u;
              long long v139 = 0u;
              long long v136 = 0u;
              long long v137 = 0u;
              id v25 = v24;
              uint64_t v26 = [v25 countByEnumeratingWithState:&v136 objects:v149 count:16];
              if (v26)
              {
                uint64_t v27 = *(void *)v137;
                while (2)
                {
                  for (uint64_t i = 0; i != v26; ++i)
                  {
                    if (*(void *)v137 != v27) {
                      objc_enumerationMutation(v25);
                    }
                    long long v29 = [*(id *)(*((void *)&v136 + 1) + 8 * i) objectForKeyedSubscript:@"suggestionTypeKey"];
                    v30 = v29;
                    if (v29
                      && (([v29 isEqualToString:@"kQPTokenSubject"] & 1) != 0
                       || [v30 isEqualToString:@"kQPTokenTitle"]))
                    {
                      [v90 setObject:v25 forKey:@"suggestionResults"];

                      goto LABEL_51;
                    }
                  }
                  uint64_t v26 = [v25 countByEnumeratingWithState:&v136 objects:v149 count:16];
                  if (v26) {
                    continue;
                  }
                  break;
                }
              }
LABEL_51:
            }
            else
            {
              [v90 setObject:MEMORY[0x1E4F1CBF0] forKey:@"suggestionResults"];
            }

            uint64_t v22 = 34;
            goto LABEL_54;
          }
LABEL_55:
          uint64_t v130 = 0;
          v131 = &v130;
          uint64_t v132 = 0x3032000000;
          v133 = __Block_byref_object_copy__0;
          v134 = __Block_byref_object_dispose__0;
          id v135 = 0;
          id v135 = [MEMORY[0x1E4F1CA48] array];
          v128[0] = 0;
          v128[1] = v128;
          v128[2] = 0x2020000000;
          char v129 = 0;
          uint64_t v124 = 0;
          v125 = &v124;
          uint64_t v126 = 0x2020000000;
          char v127 = 0;
          uint64_t v32 = [v18 length];
          v123[0] = MEMORY[0x1E4F143A8];
          v123[1] = 3221225472;
          v123[2] = __108__CSUserQuery_advancedComponentsWithSearchString_userQueryString_parseResult_parseOptions_userQueryOptions___block_invoke;
          v123[3] = &unk_1E5548F48;
          v123[4] = v18;
          v123[5] = v128;
          v123[6] = &v130;
          v123[7] = &v124;
          objc_msgSend(v18, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v32, v105, 4, 0, v123);
          if ([(id)v131[5] count] && *((unsigned char *)v125 + 24)) {
            [(id)v131[5] addObject:@""]);
          }
          v33 = [(id)v131[5] componentsJoinedByString:&stru_1EDBB3A50];
          id v122 = 0;
          v34 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v33 options:1 error:&v122];
          id v114 = v122;
          id v35 = objc_msgSend(v34, "matchesInString:options:range:", v110, 0, 0, objc_msgSend(v110, "length"));
          if ([v35 count])
          {
            v36 = [v35 lastObject];
            if ((unint64_t)[v36 numberOfRanges] >= 2)
            {
              uint64_t v95 = [v36 rangeAtIndex:0];
              uint64_t v112 = objc_msgSend(v36, "rangeAtIndex:", objc_msgSend(v36, "numberOfRanges") - 1);
              uint64_t v107 = v37;
              if (v103)
              {
                v98 = objc_msgSend(v110, "substringWithRange:", v112, v37);
                uint64_t v100 = [v110 length] - v112;
                v101 = objc_msgSend(v110, "substringWithRange:");

                if (v113 == 5)
                {
                  v91 = +[CSUserQuery parseSearchString:v101 parseOptions:v93 userQueryOptions:a7];
                  v97 = [v91 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryUniversalSuggestionsKey"];
                  if ([v97 count])
                  {
                    long long v120 = 0u;
                    long long v121 = 0u;
                    long long v118 = 0u;
                    long long v119 = 0u;
                    id v103 = v97;
                    uint64_t v38 = [v103 countByEnumeratingWithState:&v118 objects:v148 count:16];
                    if (v38)
                    {
                      uint64_t v39 = *(void *)v119;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v38; ++j)
                        {
                          if (*(void *)v119 != v39) {
                            objc_enumerationMutation(v103);
                          }
                          v41 = *(void **)(*((void *)&v118 + 1) + 8 * j);
                          v42 = [v41 objectForKeyedSubscript:@"suggestionTypeKey"];
                          if (v42)
                          {
                            v43 = [v41 objectForKeyedSubscript:@"suggestionTypeKey"];
                            char v44 = [v43 isEqualToString:@"kQPTokenDate"];

                            if (v44)
                            {

                              [v90 setObject:v103 forKey:@"suggestionResults"];
                              LOBYTE(v103) = 1;
                              goto LABEL_79;
                            }
                          }
                        }
                        uint64_t v38 = [v103 countByEnumeratingWithState:&v118 objects:v148 count:16];
                        if (v38) {
                          continue;
                        }
                        break;
                      }
                    }
                  }
                  id v45 = v98;

                  LOBYTE(v103) = 0;
                  uint64_t v100 = v107;
                  v101 = v45;
LABEL_79:
                }
                else
                {
                  LOBYTE(v103) = 1;
                  if (v113 != 16) {
                    uint64_t v100 = v107;
                  }
                }

                uint64_t v107 = v100;
                uint64_t v99 = v112;
                v96 = v101;
              }
              else
              {
                LOBYTE(v103) = 0;
              }
            }
            uint64_t v46 = [v117 objectForKeyedSubscript:@"QUERY"];

            if (v113 == 5 && v46 && v112 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v47 = objc_msgSend(v110, "substringWithRange:", v112, v107);
              v48 = [v104 objectForKeyedSubscript:v46];
              BOOL v49 = v48 == 0;

              if (v49)
              {
                v50 = [MEMORY[0x1E4F1CA80] set];
                [v104 setObject:v50 forKey:v46];
              }
              v51 = [v104 objectForKeyedSubscript:v46];
              [v51 addObject:v47];
            }
            v109 = (void *)v46;
          }

          _Block_object_dispose(&v124, 8);
          _Block_object_dispose(v128, 8);
          _Block_object_dispose(&v130, 8);

          uint64_t v16 = v115 + 1;
          uint64_t v15 = v117;
        }
        while (v115 + 1 != v108);
        uint64_t v53 = [v111 countByEnumeratingWithState:&v140 objects:v150 count:16];
        uint64_t v108 = v53;
        uint64_t v15 = v117;
      }
      while (v53);

      if ((v103 & 1) == 0)
      {
        if (v112 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_144;
        }
        uint64_t v61 = [v110 length];
        uint64_t v62 = v112 + v107;
        if (v112 + v107 == [v110 length]) {
          goto LABEL_144;
        }
        v63 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        uint64_t v64 = v61 - v62;
        uint64_t v65 = objc_msgSend(v110, "rangeOfCharacterFromSet:options:range:", v63, 8, v62, v64);
        uint64_t v67 = v66;

        if (v65 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v62 = v65 + v67;
          uint64_t v64 = [v110 length] - (v65 + v67);
        }
        v68 = v110;
        if (v99 != 0x7FFFFFFFFFFFFFFFLL && v109)
        {
          v69 = objc_msgSend(v110, "substringWithRange:");
          v70 = [v104 objectForKeyedSubscript:v109];
          BOOL v71 = v70 == 0;

          if (v71)
          {
            v72 = [MEMORY[0x1E4F1CA80] set];
            [v104 setObject:v72 forKey:v109];
          }
          v73 = [v104 objectForKeyedSubscript:v109];
          [v73 addObject:v69];

          v68 = v110;
        }
        if (v62)
        {
          v74 = objc_msgSend(v68, "substringWithRange:", 0, v62);
          [v90 setObject:v74 forKey:@"internalString"];

          v68 = v110;
        }
        objc_msgSend(v68, "substringWithRange:", v62, v64);
        char v85 = 1;
        v96 = v75 = v96;
LABEL_142:

        goto LABEL_143;
      }
      v54 = v117;
      uint64_t v55 = v113;
LABEL_116:
      if (v95 && v95 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v56 = v55;
        v57 = objc_msgSend(v110, "substringWithRange:", 0, v95);
        [v90 setObject:v57 forKey:@"internalString"];

        uint64_t v55 = v56;
      }
      v117 = v54;
      if (v54)
      {
        uint64_t v58 = v55;
        [v90 setObject:v54 forKey:@"advancedComponents"];
        uint64_t v55 = v58;
      }
      v59 = [NSNumber numberWithInteger:v55];
      [v90 setObject:v59 forKey:@"suggestionTokenKind"];

      v60 = [NSNumber numberWithInteger:v94];
      [v90 setObject:v60 forKey:@"suggestionTokenScope"];

      if ([v96 length])
      {
        char v85 = 1;
      }
      else
      {
        id v77 = v84;

        v96 = v77;
      }
      v75 = [v90 objectForKeyedSubscript:@"suggestionResults"];
      if (v75) {
        goto LABEL_142;
      }
      if ([v96 length])
      {
        v75 = +[CSUserQuery parseSearchString:v96 parseOptions:v93 userQueryOptions:a7];
        v78 = [v75 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryUniversalSuggestionsKey"];
        if ([v78 count]) {
          [v90 setObject:v78 forKey:@"suggestionResults"];
        }

        goto LABEL_142;
      }
LABEL_143:
      uint64_t v99 = 0;
LABEL_144:
      v76 = v117;
LABEL_145:

      uint64_t v11 = v89 + 1;
    }
    while (v89 + 1 != v87);
    uint64_t v87 = [obj countByEnumeratingWithState:&v144 objects:v151 count:16];
  }
  while (v87);
LABEL_149:

  if ([v104 count]) {
    [v90 setObject:v104 forKey:@"reparseDateKeys"];
  }
  objc_msgSend(v90, "setObject:forKey:", v96, @"suggestionString", v82);
  v79 = [NSNumber numberWithBool:v85 & 1];
  [v90 setObject:v79 forKey:@"hasAdvancedComponents"];

  id v80 = v90;
  return v80;
}

void __108__CSUserQuery_advancedComponentsWithSearchString_userQueryString_parseResult_parseOptions_userQueryOptions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isEqualToString:@":"];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v2];
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:@"\\s*?"];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addObject:", @"(");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] >= 3 {
         && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  }
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:@"\\s*?"];
  }
}

+ (BOOL)skipTextSemanticSearchForSearchString:(id)a3 tokenCount:(id)a4 queryContext:(id)a5 skipReason:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (!v11 || ([v11 isPhotos] & 1) == 0)
  {
    if (!v9)
    {
      uint64_t v15 = 0;
      if (a6)
      {
        BOOL v18 = @"nil query";
LABEL_26:
        *a6 = v18;
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if (![v9 length])
    {
      if (!a6)
      {
        BOOL v13 = 1;
        goto LABEL_29;
      }
      BOOL v18 = @"empty query";
      uint64_t v15 = v9;
      goto LABEL_26;
    }
    uint64_t v14 = [v9 length];
    uint64_t v15 = [v9 normalizeForSemanticSearch];

    if (![v15 length])
    {
      if (a6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"nil / empty query after normalization (originalQueryLength: %lu)", v14, v24, v26);
LABEL_25:
        BOOL v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if ([v15 isAllNumbersOrSpaces])
    {
      if (a6)
      {
        uint64_t v16 = NSString;
        uint64_t v23 = v14;
        uint64_t v25 = [v15 length];
        uint64_t v17 = @"normalized query is all numbers or spaces (originalQueryLength: %lu, normalizedQueryLength: %lu)";
LABEL_24:
        objc_msgSend(v16, "stringWithFormat:", v17, v23, v25, v26);
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    if ([v10 unsignedIntValue] >= 2)
    {
      int v19 = [v15 containsCJK];
      unint64_t v20 = [v15 length];
      if (v19)
      {
        if (v20 >= 3)
        {
LABEL_19:
          BOOL v13 = 0;
LABEL_28:
          id v9 = v15;
          goto LABEL_29;
        }
      }
      else if (v20 > 5)
      {
        goto LABEL_19;
      }
    }
    if (a6)
    {
      uint64_t v16 = NSString;
      uint64_t v21 = [v10 unsignedIntValue];
      uint64_t v25 = [v15 length];
      uint64_t v26 = [v15 containsCJK];
      uint64_t v23 = v21;
      uint64_t v17 = @"query does not match length criteria (tokenCount: %u, normalizedQueryLength: %lu, containsCJK: %d)";
      goto LABEL_24;
    }
LABEL_27:
    BOOL v13 = 1;
    goto LABEL_28;
  }
  BOOL v13 = 0;
LABEL_29:

  return v13;
}

+ (id)trimCharactersInString:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  v5 = id v4 = a3;
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  uint64_t v7 = [v6 componentsJoinedByString:@" "];

  return v7;
}

+ (id)removeSuggestionsAndTrimChars:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [v4 string];
  uint64_t v7 = [v6 length];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __45__CSUserQuery_removeSuggestionsAndTrimChars___block_invoke;
  v23[3] = &unk_1E5548F70;
  id v8 = v5;
  id v24 = v8;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v23);
  if ([v8 count])
  {
    id v9 = (void *)[v6 mutableCopy];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = objc_msgSend(v8, "reverseObjectEnumerator", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) rangeValue];
          objc_msgSend(v9, "replaceCharactersInRange:withString:", v15, v16, &stru_1EDBB3A50);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v12);
    }

    uint64_t v17 = [a1 trimCharactersInString:v9];
  }
  else
  {
    uint64_t v17 = [a1 trimCharactersInString:v6];
  }

  return v17;
}

void __45__CSUserQuery_removeSuggestionsAndTrimChars___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  if ([v10 count])
  {
    uint64_t v7 = [v10 objectForKeyedSubscript:@"kMDItemTextContent"];

    if (!v7)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
      [v8 addObject:v9];
    }
  }
}

+ (id)parseSearchString:(id)a3 parseOptions:(id)a4 userQueryOptions:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    id v9 = GetCSUserQueryParser();
    id v10 = [v9 _CSQueryCreateQueryDictionaryWithOptionsDict:v8 attribute:0 input:v7 options:v5];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)parseResultWithSearchString:(id)a3 parseOptions:(id)a4 queryContext:(id)a5 isZKW:(BOOL)a6
{
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v13 = [v10 suggestion];
  uint64_t v14 = [v13 queryString];

  v198 = v14;
  if ([v14 length])
  {
    uint64_t v15 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.7(v10);
    }

    [v12 addObject:v14];
  }
  uint64_t v16 = [v10 userQuery];
  if ([v10 isFinder])
  {
    uint64_t v17 = [v16 stringByReplacingOccurrencesOfString:@"\uFFFC" withString:&stru_1EDBB3A50];

    uint64_t v16 = (void *)v17;
  }
  BOOL v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v189 = v8;
  long long v19 = [v8 stringByTrimmingCharactersInSet:v18];

  long long v20 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v195 = v16;
  long long v21 = [v16 stringByTrimmingCharactersInSet:v20];
  v199 = v19;
  if ([v21 length])
  {

    goto LABEL_10;
  }
  uint64_t v22 = [v19 length];

  if (v22)
  {
LABEL_10:
    v191 = v12;
    v201 = v11;
    uint64_t v23 = +[CSUserQuery parseSearchString:parseOptions:userQueryOptions:](CSUserQuery, "parseSearchString:parseOptions:userQueryOptions:", v195, v9, [v10 userQueryOptions]);
    id v24 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v25 = [v9 objectForKeyedSubscript:@"disableKeywordSearch"];
    char v26 = [v25 BOOLValue];

    uint64_t v27 = [v10 attributedUserQuery];
    v190 = v9;
    long long v28 = v199;
    if (v27)
    {
      long long v29 = (void *)v27;
      v30 = [v10 bundleIDs];
      if ([v30 count])
      {
        int v31 = [v10 bundleIDs];
        uint64_t v32 = [v31 objectAtIndexedSubscript:0];
        int v33 = [v32 isEqual:@"com.apple.mobileslideshow"];

        id v9 = v190;
        long long v28 = v199;

        if (v33)
        {
          v34 = [v10 attributedUserQuery];
          id v35 = +[CSUserQuery removeSuggestionsAndTrimChars:v34];
          if ([v35 length])
          {
            v197 = [NSString stringWithFormat:@"%@ = \"%@*\"cdwt", @"kMDItemTextContent", v35];
          }
          else
          {
            v197 = 0;
          }

LABEL_17:
          id v11 = v201;
          v36 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryAttributedInputKey"];
          uint64_t v37 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryUnderstandingOutputKey"];
          v187 = v37;
          if (v37)
          {
            uint64_t v38 = [v37 mutableCopy];
          }
          else
          {
            uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          v200 = (void *)v38;
          uint64_t v39 = v198;
          if ([v36 count]) {
            [v200 setObject:v36 forKeyedSubscript:@"attributedParses"];
          }
          if ([v198 length]) {
            [v200 setObject:v198 forKeyedSubscript:@"suggestionFilter"];
          }
          if (v197) {
            char v40 = v26;
          }
          else {
            char v40 = 1;
          }
          if ((v40 & 1) == 0) {
            [v24 addObject:v197];
          }
          v188 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryConfidenceKey"];
          v192 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryNLPStringKey"];
          v193 = [v9 objectForKeyedSubscript:@"kMDQueryOptionContextIdentifier"];
          v196 = v36;
          if ((v26 & 1) != 0
            || ![v192 length]
            || ([v197 isEqualToString:v192] & 1) != 0
            || ([v188 isEqualToString:@"kMDUserQueryDictionaryQueryConfidenceLowValue"] & 1) != 0
            || ([v188 isEqualToString:@"kMDUserQueryDictionaryQueryConfidenceNoneValue"] & 1) != 0)
          {
LABEL_58:
            v194 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryInputAttributesKey"];
            if (!v194)
            {
LABEL_162:
              [v11 setObject:v200 forKey:@"queryUnderstandingOutput"];
              long long v141 = [v11 objectForKeyedSubscript:@"queryUnderstandingOutput"];
              [v10 setQueryUnderstandingOutput:v141];

              if ([v193 isEqualToString:@"com.apple.mobileslideshow"])
              {
                long long v142 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryUniversalSuggestionsKey"];
                long long v143 = v142;
                if (v142)
                {
                  id v144 = v10;
                  long long v206 = 0u;
                  long long v207 = 0u;
                  long long v204 = 0u;
                  long long v205 = 0u;
                  id v145 = v142;
                  uint64_t v146 = [v145 countByEnumeratingWithState:&v204 objects:v217 count:16];
                  if (v146)
                  {
                    uint64_t v147 = v146;
                    uint64_t v148 = *(void *)v205;
                    do
                    {
                      for (uint64_t i = 0; i != v147; ++i)
                      {
                        if (*(void *)v205 != v148) {
                          objc_enumerationMutation(v145);
                        }
                        v150 = [*(id *)(*((void *)&v204 + 1) + 8 * i) objectForKeyedSubscript:@"descriptionKey"];
                        if ([v150 length] && (objc_msgSend(v24, "containsObject:", v150) & 1) == 0) {
                          [v24 addObject:v150];
                        }
                      }
                      uint64_t v147 = [v145 countByEnumeratingWithState:&v204 objects:v217 count:16];
                    }
                    while (v147);
                  }

                  id v9 = v190;
                  id v10 = v144;
                  id v11 = v201;
                  uint64_t v39 = v198;
                  long long v28 = v199;
                  v36 = v196;
                }
              }
              if ([v24 count])
              {
                if ((unint64_t)[v24 count] > 1)
                {
                  v154 = NSString;
                  v151 = [v24 allObjects];
                  id v152 = [v151 componentsJoinedByString:@" || "];
                  id v153 = [v154 stringWithFormat:@"(%@)", v152];
                }
                else
                {
                  v151 = [v24 allObjects];
                  id v152 = [v151 lastObject];
                  id v153 = v152;
                }

                [v191 addObject:v153];
                v36 = v196;
              }
              if ([v28 length])
              {
                id v186 = v10;
                v155 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryUniversalSuggestionsKey"];
                if ([v155 count]) {
                  [v11 setObject:v155 forKey:@"suggestions"];
                }
                id obja = v155;
                v156 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryAttributedInputKey"];
                v157 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryAttributedInputSourcesKey"];
                if ([v156 count])
                {
                  unint64_t v158 = 0;
                  do
                  {
                    v159 = [v156 objectAtIndexedSubscript:v158];
                    if (v158 >= [v157 count]
                      || ([v157 objectAtIndexedSubscript:v158],
                          v160 = objc_claimAutoreleasedReturnValue(),
                          char v161 = [v160 isEqual:@"kMDUserQueryDictionaryAttributedInputSourceU2Based"], v160, (v161 & 1) == 0))
                    {
                      if ([v159 length])
                      {
                        v162 = objc_msgSend(v159, "attribute:atIndex:longestEffectiveRange:inRange:", @"kQPSender", 0, 0, 0, objc_msgSend(v159, "length"));
                        if ([v162 length])
                        {
                          [v201 setObject:v162 forKey:@"senderCompletionString"];
                        }
                        else
                        {
                          v163 = objc_msgSend(v159, "attribute:atIndex:longestEffectiveRange:inRange:", @"kQPRecipient", 0, 0, 0, objc_msgSend(v159, "length"));
                          if ([v163 length]) {
                            [v201 setObject:v163 forKey:@"recipientCompletionString"];
                          }
                        }
                      }
                    }

                    ++v158;
                  }
                  while (v158 < [v156 count]);
                }

                id v9 = v190;
                id v10 = v186;
                id v11 = v201;
                uint64_t v39 = v198;
                long long v28 = v199;
                v36 = v196;
              }

              id v12 = v191;
              goto LABEL_198;
            }
            uint64_t v52 = [v9 objectForKeyedSubscript:@"kMDQueryOptionEmbeddingEnabledKey"];
            if (!v52
              || (uint64_t v53 = (void *)v52,
                  [v9 objectForKeyedSubscript:@"kMDQueryOptionEmbeddingEnabledKey"],
                  v54 = objc_claimAutoreleasedReturnValue(),
                  int v55 = [v54 BOOLValue],
                  v54,
                  v53,
                  !v55))
            {
LABEL_154:
              id v135 = [v194 objectForKeyedSubscript:@"attributedResultKey"];
              v36 = v196;
              if (v135)
              {
                uint64_t v136 = [v9 objectForKeyedSubscript:@"forwardAttributedInput"];
                if (v136)
                {
                  long long v137 = (void *)v136;
                  long long v138 = [v9 objectForKeyedSubscript:@"forwardAttributedInput"];
                  int v139 = [v138 BOOLValue];

                  v36 = v196;
                  if (v139) {
                    [v11 setObject:v135 forKey:@"attributedInput"];
                  }
                }
                long long v140 = logForCSLogCategoryQuery();
                if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG)) {
                  +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:]();
                }

                long long v28 = v199;
              }

              goto LABEL_162;
            }
            uint64_t v56 = [v9 objectForKeyedSubscript:@"forwardEmbeddings"];
            if (v56)
            {
              v57 = [v9 objectForKeyedSubscript:@"forwardEmbeddings"];
              int v184 = [v57 BOOLValue] ^ 1;
            }
            else
            {
              LOBYTE(v184) = 1;
            }

            uint64_t v58 = [v9 objectForKeyedSubscript:@"addAnnNode"];
            if (!v58)
            {
              int v61 = 0;
              goto LABEL_87;
            }
            v59 = (void *)v58;
            v60 = [v9 objectForKeyedSubscript:@"addAnnNode"];
            int v61 = [v60 BOOLValue];

            if (!v61) {
              goto LABEL_87;
            }
            if (v23
              && ([v23 objectForKey:@"kMDUserQueryDictionaryQueryTokenCountKey"],
                  uint64_t v62 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  char isKindOfClass = objc_opt_isKindOfClass(),
                  v62,
                  (isKindOfClass & 1) != 0))
            {
              uint64_t v64 = [v23 objectForKey:@"kMDUserQueryDictionaryQueryTokenCountKey"];
            }
            else
            {
              uint64_t v64 = &unk_1EDBD6460;
            }
            id v214 = 0;
            BOOL v65 = +[CSUserQuery skipTextSemanticSearchForSearchString:v195 tokenCount:v64 queryContext:v10 skipReason:&v214];
            id v182 = v214;
            if (v65)
            {
              uint64_t v66 = v64;
              uint64_t v67 = [v10 clientBundleID];
              int v68 = objc_msgSend(v67, "cs_isCslinguistics");

              v69 = logForCSLogCategoryQuery();
              v70 = v69;
              if (v68)
              {
                BOOL v71 = v182;
                if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v171 = [v10 queryID];
                  int v61 = 1;
                  CSRedactString(v195, 1);
                  id v172 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218498;
                  *(void *)&buf[4] = v171;
                  BOOL v71 = v182;
                  __int16 v222 = 2112;
                  id v223 = v172;
                  __int16 v224 = 2112;
                  id v225 = v182;
                  _os_log_fault_impl(&dword_18D0E3000, v70, OS_LOG_TYPE_FAULT, "[CSUserQuery][qid=%ld] Text client would skip text semantic search for query \"%@\" because %@", buf, 0x20u);
                }
                else
                {
                  int v61 = 1;
                }
                goto LABEL_82;
              }
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v79 = [v10 queryID];
                CSRedactString(v195, 1);
                id v80 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                *(void *)&buf[4] = v79;
                __int16 v222 = 2112;
                id v223 = v80;
                __int16 v224 = 2112;
                BOOL v71 = v182;
                id v225 = v182;
                _os_log_impl(&dword_18D0E3000, v70, OS_LOG_TYPE_DEFAULT, "[CSUserQuery][qid=%ld] skipping text semantic search for query \"%@\" because %@", buf, 0x20u);

                int v61 = 0;
LABEL_82:
                uint64_t v64 = v66;
LABEL_85:

                uint64_t v39 = v198;
                goto LABEL_86;
              }
              int v61 = 0;
              uint64_t v64 = v66;
            }
            else
            {
              if (![v10 isMail]
                || ([(id)objc_opt_class() mailResources],
                    v72 = objc_claimAutoreleasedReturnValue(),
                    v72,
                    !v72))
              {
                int v61 = 1;
                BOOL v71 = v182;
LABEL_86:

LABEL_87:
                v81 = [v194 objectForKeyedSubscript:@"embeddingResultKey"];
                v179 = v81;
                if (v81)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    int v176 = v61;
                    id v82 = (void *)MEMORY[0x1E4F28DC0];
                    id v83 = (void *)MEMORY[0x1E4F1CAD0];
                    uint64_t v84 = objc_opt_class();
                    uint64_t v85 = objc_opt_class();
                    uint64_t v86 = objc_msgSend(v83, "setWithObjects:", v84, v85, objc_opt_class(), 0);
                    id v212 = 0;
                    v81 = [v82 unarchivedObjectOfClasses:v86 fromData:v81 error:&v212];
                    id v87 = v212;

                    id v11 = v201;
                    if (v87)
                    {
                      v88 = logForCSLogCategoryDefault();
                      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                        +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.4();
                      }
                    }
                    long long v28 = v199;
                    int v61 = v176;
                  }
                  else
                  {
                    v81 = 0;
                    id v11 = v201;
                  }
                }
                uint64_t v89 = [v194 objectForKeyedSubscript:@"embeddingErrorDescriptionKey"];

                if (v89)
                {
                  id v90 = (void *)[objc_alloc(NSNumber) initWithLong:CFErrorGetCode((CFErrorRef)v89)];
                  [v200 setObject:v90 forKeyedSubscript:@"embeddingErrorDescriptionKey"];
                }
                v181 = v81;
                if (![v81 count])
                {
                  id v122 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
                    +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:](v10);
                  }
                  v123 = 0;
                  id v9 = v190;
                  goto LABEL_148;
                }
                v91 = [v81 objectForKeyedSubscript:@"_kMDItemPhotoEmbedding"];
                v175 = v91;
                if ([v91 length])
                {
                  v92 = [[_CSEmbedding alloc] initWithEncodedData:v91];
                  id v93 = v92;
                  if (v92)
                  {
                    int v177 = v61;
                    uint64_t v94 = [(_CSEmbedding *)v92 properties];
                    uint64_t v95 = [v94 objectForKey:@"vec_scale"];

                    v96 = [(_CSEmbedding *)v93 properties];
                    v97 = [v96 objectForKey:@"vec_bias"];

                    if ((v184 & 1) == 0)
                    {
                      v98 = NSNumber;
                      [v10 embeddingRelevanceThreshold];
                      uint64_t v99 = objc_msgSend(v98, "numberWithDouble:");
                      [v200 setObject:v99 forKeyedSubscript:@"embeddingRelevanceThreshold"];

                      uint64_t v100 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[_CSEmbedding version](v93, "version"));
                      [v200 setObject:v100 forKeyedSubscript:@"embeddingVersion"];

                      if (v95 && v97)
                      {
                        [v200 setObject:v95 forKeyedSubscript:@"embeddingScale"];
                        [v200 setObject:v97 forKeyedSubscript:@"embeddingBias"];
                      }
                      [v11 setObject:v93 forKey:@"kQPPhotosEmbedding"];
                    }

                    long long v28 = v199;
                    int v61 = v177;
                    v91 = v175;
                  }
                  [v200 setObject:v91 forKeyedSubscript:@"kQPQueryPhotoEmbeddingEncodedData"];
                }
                if (!v61)
                {
                  v123 = 0;
                  id v9 = v190;
LABEL_145:
                  uint64_t v132 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v133 = [v10 queryID];
                    *(_DWORD *)buf = 134217984;
                    *(void *)&buf[4] = v133;
                    _os_log_impl(&dword_18D0E3000, v132, OS_LOG_TYPE_DEFAULT, "[CSUserQuery][qid=%ld] semanticQuery, enabled", buf, 0xCu);
                  }

                  id v122 = v175;
LABEL_148:

                  if (v61 && ![v123 length])
                  {
                    v134 = logForCSLogCategoryDefault();
                    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
                      +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:](v10);
                    }

                    [v24 addObject:@"(false)"];
                  }

                  goto LABEL_154;
                }
                v101 = [v81 objectForKeyedSubscript:@"_kMDItemPrimaryTextEmbedding"];
                id v9 = v190;
                if (![v101 length])
                {
                  v123 = 0;
LABEL_144:

                  goto LABEL_145;
                }
                v174 = v101;
                int v178 = v61;
                v183 = v23;
                v185 = v10;
                v102 = [v190 objectForKeyedSubscript:@"annMaxCount"];
                uint64_t v103 = [v102 unsignedLongValue];
                if (v103) {
                  uint64_t v104 = v103;
                }
                else {
                  uint64_t v104 = 100;
                }

                uint64_t v105 = [v190 objectForKeyedSubscript:@"annMaxDistance"];
                [v105 floatValue];
                if (v106 == 0.0) {
                  float v107 = *(float *)"ףp?";
                }
                else {
                  float v107 = v106;
                }

                uint64_t v108 = [v190 objectForKeyedSubscript:@"annBruteForce"];
                BOOL v109 = [v108 unsignedIntValue] != 0;

                v220 = @"_kMDItemPrimaryTextEmbedding";
                id v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v220 count:1];
                id v111 = [v190 objectForKeyedSubscript:@"annIncludeSecondaryTextEmbedding"];
                int v112 = [v111 BOOLValue];

                if (v112)
                {
                  v219[0] = @"_kMDItemPrimaryTextEmbedding";
                  v219[1] = @"_kMDItemSecondaryTextEmbedding";
                  uint64_t v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v219 count:2];

                  id v110 = (void *)v113;
                }
                long long v210 = 0u;
                long long v211 = 0u;
                long long v208 = 0u;
                long long v209 = 0u;
                obuint64_t j = v110;
                uint64_t v114 = [obj countByEnumeratingWithState:&v208 objects:v218 count:16];
                if (v114)
                {
                  uint64_t v115 = v114;
                  v116 = 0;
                  uint64_t v117 = *(void *)v209;
                  double v118 = v107;
                  do
                  {
                    uint64_t v119 = 0;
                    long long v120 = v116;
                    do
                    {
                      if (*(void *)v209 != v117) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v121 = *(void *)(*((void *)&v208 + 1) + 8 * v119);
                      if ([v120 length]) {
                        [NSString stringWithFormat:@"%@ || aNN.data(%@, 0, %ld, %f, %u)", v120, v121, v104, *(void *)&v118, v109];
                      }
                      else {
                      v116 = [NSString stringWithFormat:@"aNN.data(%@, 0, %ld, %f, %u)", v121, v104, *(void *)&v118, v109, v173];
                      }

                      ++v119;
                      long long v120 = v116;
                    }
                    while (v115 != v119);
                    uint64_t v115 = [obj countByEnumeratingWithState:&v208 objects:v218 count:16];
                  }
                  while (v115);
                }
                else
                {
                  v116 = 0;
                }

                id v11 = v201;
                if (![v116 length])
                {
                  v123 = v116;
                  id v9 = v190;
                  uint64_t v23 = v183;
                  id v10 = v185;
                  uint64_t v39 = v198;
                  long long v28 = v199;
                  int v61 = v178;
                  v101 = v174;
LABEL_143:

                  goto LABEL_144;
                }
                v123 = [NSString stringWithFormat:@"(%@)", v116];

                [v24 addObject:v123];
                id v10 = v185;
                int v124 = [v185 privateQuery];
                v125 = logForCSLogCategoryDefault();
                BOOL v126 = os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT);
                id v9 = v190;
                uint64_t v39 = v198;
                uint64_t v23 = v183;
                if (v124)
                {
                  long long v28 = v199;
                  int v61 = v178;
                  if (v126)
                  {
                    uint64_t v127 = [v185 queryID];
                    *(_DWORD *)buf = 134217984;
                    *(void *)&buf[4] = v127;
                    v128 = "[CSUserQuery][qid=%ld] semanticQuery, enabled";
                    char v129 = v125;
                    uint32_t v130 = 12;
LABEL_141:
                    _os_log_impl(&dword_18D0E3000, v129, OS_LOG_TYPE_DEFAULT, v128, buf, v130);
                  }
                }
                else
                {
                  long long v28 = v199;
                  int v61 = v178;
                  if (v126)
                  {
                    uint64_t v131 = [v185 queryID];
                    *(_DWORD *)buf = 134218242;
                    *(void *)&buf[4] = v131;
                    __int16 v222 = 2112;
                    id v223 = v123;
                    v128 = "[CSUserQuery][qid=%ld] semanticQuery, using <%@>";
                    char v129 = v125;
                    uint32_t v130 = 22;
                    goto LABEL_141;
                  }
                }

                v101 = v174;
                [v185 setQueryEmbedding:v174];
                goto LABEL_143;
              }
              v180 = v64;
              v73 = [(id)objc_opt_class() mailResources];
              char v74 = objc_opt_respondsToSelector();

              if ((v74 & 1) == 0)
              {
                int v61 = 1;
                uint64_t v64 = v180;
                BOOL v71 = v182;
                goto LABEL_86;
              }
              v75 = (void *)MEMORY[0x1E4F1CA18];
              v76 = [(id)objc_opt_class() mailResources];
              id v77 = [v76 methodSignatureForSelector:sel_logForTrigger_queryID_];
              v70 = [v75 invocationWithMethodSignature:v77];

              long long v28 = v199;
              [v70 setSelector:sel_logForTrigger_queryID_];
              v78 = [(id)objc_opt_class() mailResources];
              [v70 setTarget:v78];

              *(void *)buf = 0;
              *(void *)buf = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8F368B27-2C13-43A2-89E6-E6FF80E2FE94"];
              [v70 setArgument:buf atIndex:2];
              uint64_t v213 = [v10 feedbackQueryID];
              [v70 setArgument:&v213 atIndex:3];
              [v70 invoke];

              int v61 = 1;
              uint64_t v64 = v180;
            }
            BOOL v71 = v182;
            goto LABEL_85;
          }
          v41 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
            +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.6();
          }

          if (([v10 isPhotos] & 1) == 0)
          {
            v42 = [v10 bundleIDs];
            if ([v42 count] == 1)
            {
              v43 = [v10 bundleIDs];
              if ([v43 containsObject:@"com.apple.mobileslideshow"])
              {

                goto LABEL_53;
              }
              char v170 = [v193 isEqualToString:@"com.apple.photos"];

              if (v170) {
                goto LABEL_53;
              }
            }
            else
            {
              char v50 = [v193 isEqualToString:@"com.apple.photos"];

              if (v50) {
                goto LABEL_53;
              }
            }
            [v24 addObject:v192];
          }
LABEL_53:
          v36 = v196;
          if ([v10 enableInstantAnswers]
            && [v192 rangeOfString:@"kMDItemEvent"] != 0x7FFFFFFFFFFFFFFFLL)
          {
            v51 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
              +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.5();
            }

            [v201 setObject:v192 forKey:@"instantAnswers"];
          }
          goto LABEL_58;
        }
      }
      else
      {
      }
    }
    v197 = [v23 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryDefaultStringKey"];
    goto LABEL_17;
  }
  if ([v10 isMail])
  {
    int v44 = 1;
    uint64_t v39 = v198;
    long long v28 = v19;
    id v45 = v189;
  }
  else
  {
    uint64_t v46 = [v10 bundleIDs];
    uint64_t v39 = v198;
    id v45 = v189;
    if ([v46 count])
    {
      v47 = [v10 bundleIDs];
      int v44 = [v47 containsObject:@"com.apple.mobilemail"];
    }
    else
    {
      int v44 = 0;
    }
    long long v28 = v199;
  }
  v48 = [v10 clientBundleID];
  int v49 = objc_msgSend(v48, "cs_isPommesCtl");

  if ([v39 length] && v44 | v49)
  {
    v215 = @"suggestionFilter";
    v216 = v39;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v216 forKeys:&v215 count:1];
    [v10 setQueryUnderstandingOutput:v23];
LABEL_198:

    id v45 = v189;
  }
  if ([v12 count])
  {
    if ((unint64_t)[v12 count] > 1)
    {
      v168 = NSString;
      v164 = [v12 allObjects];
      id v165 = [v164 componentsJoinedByString:@" && "];
      id v166 = [v168 stringWithFormat:@"(%@)", v165];
    }
    else
    {
      v164 = [v12 allObjects];
      id v165 = [v164 lastObject];
      id v166 = v165;
    }

    [v11 setObject:v166 forKey:@"queryString"];
    if ([v166 containsString:@"**"]) {
      [v10 setHasFreeTextQuery:1];
    }
    id v167 = v11;
  }
  else
  {
    id v167 = 0;
  }

  return v167;
}

+ (id)defaultParseOptionsForClientContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = CSGetCurrentLocale(0, 0);
  uint64_t v6 = [v5 languageIdentifier];
  [v4 setValue:v6 forKey:@"localeLanguage"];

  if (v3) {
    [v4 setObject:v3 forKey:@"kMDQueryOptionContextIdentifier"];
  }

  return v4;
}

- (id)queryStringWithQueryContext:(id)a3 searchString:(id)a4 options:(id)a5
{
  uint64_t v334 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v291 = a4;
  id v279 = a5;
  v301 = v8;
  v300 = [v8 userQuery];
  id v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v273 = [v291 stringByTrimmingCharactersInSet:v9];

  uint64_t v10 = [v8 bundleIDs];
  id v11 = (void *)v10;
  id v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    id v12 = (void *)v10;
  }
  id v13 = v12;

  uint64_t v14 = (void *)0x1E4F28000;
  uint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v16 = [v15 bundleIdentifier];

  if (v16)
  {
    uint64_t v17 = v13;
    if (([v13 containsObject:v16] & 1) == 0)
    {
      uint64_t v17 = [v13 arrayByAddingObject:v16];
    }
  }
  else
  {
    uint64_t v17 = v13;
  }
  if ([v301 isMail])
  {
    int v299 = 1;
  }
  else if ([v17 count])
  {
    int v299 = [v17 containsObject:@"com.apple.mobilemail"];
  }
  else
  {
    int v299 = 0;
  }
  if ([v301 isPhotos])
  {
    int v284 = 1;
  }
  else if ([v17 count])
  {
    int v284 = [v17 containsObject:@"com.apple.mobileslideshow"];
  }
  else
  {
    int v284 = 0;
  }
  if ([v301 isSafari])
  {
    int v281 = 1;
  }
  else if ([v17 count])
  {
    int v281 = [v17 containsObject:@"com.apple.mobilesafari"];
  }
  else
  {
    int v281 = 0;
  }
  if ([v301 isNotes])
  {
    int v18 = 1;
  }
  else if ([v17 count])
  {
    int v18 = [v17 containsObject:@"com.apple.mobilenotes"];
  }
  else
  {
    int v18 = 0;
  }
  v274 = v17;
  if ([v17 count]) {
    int v280 = [v17 containsObject:@"com.apple.Spotlight"];
  }
  else {
    int v280 = 0;
  }
  int v292 = objc_msgSend(v16, "cs_isPommesCtl");
  int v272 = _os_feature_enabled_impl();
  int v271 = _os_feature_enabled_impl();
  unsigned __int8 v315 = 0;
  id v19 = CSGetCurrentLocale(0, (uint64_t)&v315);
  if (v299) {
    unsigned int v278 = [v301 pommesZKW];
  }
  else {
    unsigned int v278 = 0;
  }
  long long v20 = v16;
  v277 = v20;
  if (((v299 ^ 1 | v284 | v281 | v18 | v280) & 1) == 0)
  {

    long long v20 = @"com.apple.mobilemail";
  }
  if (((v284 ^ 1 | v299 | v281 | v18 | v280) & 1) == 0)
  {

    long long v20 = @"com.apple.mobileslideshow";
  }
  if (((v281 ^ 1 | v299 | v284 | v18 | v280) & 1) == 0)
  {

    long long v20 = @"com.apple.mobilesafari";
  }
  if (((v18 ^ 1 | v299 | v284 | v281 | v280) & 1) == 0)
  {

    long long v20 = @"com.apple.mobilenotes";
  }
  if (v280)
  {

    v276 = @"com.apple.Spotlight";
  }
  else
  {
    v276 = v20;
  }
  v283 = [MEMORY[0x1E4F1CA80] set];
  long long v21 = [(id)objc_opt_class() defaultParseOptionsForClientContext:v276];
  v287 = (void *)[v21 mutableCopy];

  [v287 addEntriesFromDictionary:v279];
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v301, "queryID"));
  [v287 setObject:v22 forKey:@"queryID"];

  uint64_t v23 = [v301 keyboardLanguage];
  [v287 setValue:v23 forKey:@"keyboardLanguage"];

  if (((v299 | v292 | v284) & 1) != 0 || (v281 & _os_feature_enabled_impl()) == 1)
  {
    id v24 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.9(v301);
    }

    [v301 setPommes:1];
  }
  if (([v301 disableSemanticSearch] & 1) == 0)
  {
    v313[0] = MEMORY[0x1E4F143A8];
    v313[1] = 3221225472;
    v313[2] = __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke;
    v313[3] = &__block_descriptor_33_e5_v8__0l;
    char v314 = v284;
    uint64_t v25 = v313;
    if (queryStringWithQueryContext_searchString_options__onceToken != -1) {
      dispatch_once(&queryStringWithQueryContext_searchString_options__onceToken, v25);
    }

    int v26 = [(__CFString *)v277 hasPrefix:@"com.apple."];
    if (v284) {
      goto LABEL_56;
    }
    int v27 = v299;
    if (!queryStringWithQueryContext_searchString_options__isMailSemanticSearchEnabled) {
      int v27 = 0;
    }
    if ((v27 | v292)) {
LABEL_56:
    }
      int v28 = 1;
    else {
      int v28 = [(__CFString *)v277 cs_isCslinguistics] | v26 ^ 1;
    }
    uint64_t v316 = 0;
    v317 = &v316;
    uint64_t v318 = 0x2050000000;
    long long v29 = (void *)getGMAvailabilityWrapperClass_softClass;
    uint64_t v319 = getGMAvailabilityWrapperClass_softClass;
    if (!getGMAvailabilityWrapperClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getGMAvailabilityWrapperClass_block_invoke;
      v330 = (__CFString *)&unk_1E5548E88;
      *(void *)v331 = &v316;
      __getGMAvailabilityWrapperClass_block_invoke((uint64_t)buf);
      long long v29 = (void *)v317[3];
    }
    id v30 = v29;
    _Block_object_dispose(&v316, 8);
    unint64_t v31 = [v30 currentWithUseCaseIdentifiers:&unk_1EDBD5AD0];
    unint64_t v32 = v31;
    BOOL v33 = queryStringWithQueryContext_searchString_options__isFeatureFlagsEnabled != 0;
    int v34 = v292;
    if (!queryStringWithQueryContext_searchString_options__isFeatureFlagsEnabled) {
      int v34 = 0;
    }
    if (v31 >= 2) {
      BOOL v33 = 0;
    }
    if (v34 == 1)
    {
      id v35 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D0E3000, v35, OS_LOG_TYPE_INFO, "[CSUserQuery] WARN - forcing allowSemanticSearch=YES for pommesctl", buf, 2u);
      }

      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v5 = v33 & v28;
    }
    v36 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      BOOL v37 = v32 < 2;
      uint64_t v38 = [v301 queryID];
      uint64_t v39 = @"disallowing";
      if (v5) {
        uint64_t v39 = @"allowing";
      }
      char v40 = @"YES";
      *(_DWORD *)buf = 134219010;
      *(void *)&buf[4] = v38;
      if (queryStringWithQueryContext_searchString_options__isFeatureFlagsEnabled) {
        v41 = @"YES";
      }
      else {
        v41 = @"NO";
      }
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v39;
      if (v28) {
        v42 = @"YES";
      }
      else {
        v42 = @"NO";
      }
      *(_WORD *)&buf[22] = 2112;
      v330 = v41;
      *(_WORD *)v331 = 2112;
      if (!v37) {
        char v40 = @"NO";
      }
      *(void *)&v331[2] = v42;
      __int16 v332 = 2112;
      v333 = v40;
      _os_log_impl(&dword_18D0E3000, v36, OS_LOG_TYPE_INFO, "[CSUserQuery][qid=%ld] %@ semantic search, isFeatureFlagsEnabled: %@, isClientAllowed: %@, isGMOptedIn: %@", buf, 0x34u);
    }

    [v301 setDisableSemanticSearch:v5 ^ 1];
  }
  if (([v301 generateSuggestions] & 1) == 0) {
    objc_msgSend(v301, "setUserQueryOptions:", objc_msgSend(v301, "userQueryOptions") | 0x1000);
  }
  if (([v301 disableSemanticSearch] & 1) != 0 || objc_msgSend(v301, "disableNLP"))
  {
    [v287 setValue:MEMORY[0x1E4F1CC28] forKey:@"kMDQueryOptionEmbeddingEnabledKey"];
    [v287 setValue:MEMORY[0x1E4F1CC28] forKey:@"addAnnNode"];
  }
  else
  {
    [v287 setValue:MEMORY[0x1E4F1CC38] forKey:@"kMDQueryOptionEmbeddingEnabledKey"];
    [v287 setValue:MEMORY[0x1E4F1CC38] forKey:@"addAnnNode"];
    v43 = [v301 fetchAttributes];
    v328[0] = @"kMDQueryResultRetrievalType";
    v328[1] = @"kMDQueryResultEmbeddingDistances";
    int v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v328 count:2];
    id v45 = [v43 arrayByAddingObjectsFromArray:v44];
    [v301 setFetchAttributes:v45];
  }
  uint64_t v46 = [v301 customFieldSpecifications];
  BOOL v47 = v46 == 0;
  id v275 = v46;

  if (!v47)
  {
    v48 = +[CSUserQuery flattenCSFieldSpecifications:v275];
    [v287 setValue:v48 forKey:@"kMDQueryOptionCustomFieldSpecifications"];
  }
  if ([v301 privateQuery]) {
    [v287 setObject:MEMORY[0x1E4F1CC38] forKey:@"kMDQueryOptionPrivateParsingKey"];
  }
  if (v279) {
    [v287 addEntriesFromDictionary:v279];
  }
  if (v299 | v292) {
    [v287 setValue:&unk_1EDBD6478 forKey:@"kMDQueryOptionEmbeddingGenerationTimeout"];
  }
  if (v284)
  {
    [v287 setObject:@"com.apple.photos" forKeyedSubscript:@"kMDQueryOptionContextIdentifier"];
    uint64_t v49 = MEMORY[0x1E4F1CC38];
    [v287 setValue:MEMORY[0x1E4F1CC38] forKey:@"forwardEmbeddings"];
    char v50 = NSNumber;
    v51 = [v301 bundleIDs];
    unint64_t v52 = [v51 count];
    if (v52 < 2)
    {
      uint64_t v53 = 0;
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v5 = [v14 bundleIdentifier];
      uint64_t v53 = [(id)v5 isEqualToString:@"com.apple.mobileslideshow"] ^ 1;
    }
    v54 = [v50 numberWithInt:v53];
    [v287 setValue:v54 forKey:@"addAnnNode"];

    if (v52 > 1)
    {
    }
    char v55 = [v301 disableNLP];
    uint64_t v56 = MEMORY[0x1E4F1CC28];
    uint64_t v57 = MEMORY[0x1E4F1CC28];
    if ((v55 & 1) == 0)
    {
      if (objc_msgSend(v301, "disableU2", MEMORY[0x1E4F1CC28])) {
        uint64_t v57 = v56;
      }
      else {
        uint64_t v57 = v49;
      }
    }
    [v287 setValue:v57 forKey:@"kMDQueryOptionU2EnabledKey"];
    if (([(CSSearchQueryContext *)self->_clientContext embeddingGenerationTimeout] & 0x8000000000000000) == 0)
    {
      uint64_t v58 = objc_msgSend(NSNumber, "numberWithInteger:", -[CSSearchQueryContext embeddingGenerationTimeout](self->_clientContext, "embeddingGenerationTimeout"));
      [v287 setValue:v58 forKey:@"kMDQueryOptionEmbeddingGenerationTimeout"];
    }
    if ([v301 disableSafetyCheck])
    {
      [v287 setValue:MEMORY[0x1E4F1CC28] forKey:@"loadAnnotations"];
    }
    else
    {
      uint64_t v59 = MEMORY[0x1E4F1CC38];
      [v287 setValue:MEMORY[0x1E4F1CC38] forKey:@"loadAnnotations"];
      v60 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v61 = [v60 objectForKey:@"EmbeddingQuerySafetyCheck"];

      if (v61)
      {
        uint64_t v62 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        int v63 = [v62 BOOLForKey:@"EmbeddingQuerySafetyCheck"];

        uint64_t v64 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v63;
          _os_log_impl(&dword_18D0E3000, v64, OS_LOG_TYPE_INFO, "[EmbeddingQuerySafetyCheck]: %d", buf, 8u);
        }

        if (v63) {
          uint64_t v65 = v59;
        }
        else {
          uint64_t v65 = v56;
        }
        [v287 setValue:v65 forKey:@"loadAnnotations"];
      }
    }
    uint64_t v66 = [v301 filterQueries];
    if (v66)
    {
      id v67 = [v301 filterQueries];
    }
    else
    {
      id v67 = (id)MEMORY[0x1E4F1CBF0];
    }

    [v301 setFilterQueries:v67];
  }
  int v68 = +[CSUserQuery parseResultWithSearchString:v291 parseOptions:v287 queryContext:v301 isZKW:v278];
  v285 = v68;
  if (v68)
  {
    v69 = [v68 objectForKeyedSubscript:@"queryString"];
    if (v69) {
      [v283 addObject:v69];
    }
    [(CSUserQuery *)self handleParseResult:v285];

    if (!v278) {
      goto LABEL_133;
    }
    goto LABEL_128;
  }
  if (v278)
  {
LABEL_128:
    v70 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v71 = [v70 dateByAddingTimeInterval:-2678400.0];
    [v71 timeIntervalSinceReferenceDate];
    uint64_t v73 = v72;

    if (v299)
    {
      v327[0] = @"com_apple_mail_dateReceived";
      v327[1] = @"kMDItemUserSharedReceivedDate";
      v327[2] = @"kMDItemUserSharedSentDate";
      v327[3] = @"kMDItemContentCreationDate";
      char v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v327 count:4];
      v75 = @"com_apple_mail_read = 1";
    }
    else
    {
      v326[0] = @"kMDItemContentCreationDate";
      v326[1] = @"kMDItemContentModificationDate";
      char v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v326 count:2];
      v75 = @"true";
    }
    id v76 = v74;

    id v77 = [MEMORY[0x1E4F1CA48] array];
    v310[0] = MEMORY[0x1E4F143A8];
    v310[1] = 3221225472;
    v310[2] = __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_481;
    v310[3] = &unk_1E5548FB8;
    id v78 = v77;
    id v311 = v78;
    uint64_t v312 = v73;
    [v76 enumerateObjectsUsingBlock:v310];
    uint64_t v79 = [v78 componentsJoinedByString:@" || "];
    id v80 = [NSString stringWithFormat:@"((%@) && (%@))", v79, v75];
    [v283 addObject:v80];

    [v301 setPommesZKW:1];
    goto LABEL_133;
  }
  [v283 addObject:@"(true)"];
LABEL_133:
  if (![v301 generateSuggestions])
  {
    v295 = v273;
    id v293 = v291;
    goto LABEL_312;
  }
  if (v299 | v284)
  {
    v81 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
      -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.8(v301);
    }

    [v301 setPommesSuggestions:1];
  }
  id v82 = [v285 objectForKeyedSubscript:@"hasAdvancedComponents"];
  int v83 = [v82 BOOLValue];

  if (v83)
  {
    uint64_t v84 = [v285 objectForKeyedSubscript:@"internalString"];

    if (v84)
    {
      uint64_t v85 = [v285 objectForKeyedSubscript:@"internalString"];
      uint64_t v86 = [v285 objectForKeyedSubscript:@"internalQuery"];
      -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self->_searchString, "stringByReplacingOccurrencesOfString:withString:options:range:", v85, &stru_1EDBB3A50, 8, 0, [(NSString *)self->_searchString length]);
      id v87 = (NSString *)objc_claimAutoreleasedReturnValue();
      searchString = self->_searchString;
      self->_searchString = v87;

      uint64_t v89 = [[_CSSuggestionToken alloc] initWithUserString:v85 queryString:v86];
      id v90 = [v301 suggestion];
      v91 = [v90 suggestionTokens];
      v92 = [v91 arrayByAddingObject:v89];

      id v93 = [v301 suggestion];
      uint64_t v94 = +[CSSuggestion updatedSuggestionWithCurrentSuggestion:v93 userString:v300 tokens:v92];
      [v301 setSuggestion:v94];

      uint64_t v95 = [v301 suggestion];
      v96 = [v95 userQueryString];
      [v301 setUserQuery:v96];
    }
    uint64_t v97 = [v285 objectForKeyedSubscript:@"suggestionString"];
    v98 = (void *)v97;
    if (v97) {
      uint64_t v99 = (void *)v97;
    }
    else {
      uint64_t v99 = v291;
    }
    id v293 = v99;

    uint64_t v100 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v295 = [v293 stringByTrimmingCharactersInSet:v100];

    [v301 setNormalizedSearchQuery:v295];
    v101 = [v285 objectForKeyedSubscript:@"suggestionTokenKind"];
    if (v101)
    {
      v102 = [v285 objectForKeyedSubscript:@"suggestionTokenKind"];
      p_currentTokenKind = &self->_currentTokenKind;
      self->_currentTokenKind = (int)[v102 intValue];
    }
    else
    {
      p_currentTokenKind = &self->_currentTokenKind;
      self->_currentTokenKind = 0;
    }

    uint64_t v127 = [v285 objectForKeyedSubscript:@"suggestionTokenKind"];
    if (v127)
    {
      v128 = [v285 objectForKeyedSubscript:@"suggestionTokenScope"];
      if (v128)
      {
        char v129 = [v285 objectForKeyedSubscript:@"suggestionTokenScope"];
        self->_int64_t currentTokenScope = (int)[v129 intValue];
      }
      else
      {
        self->_int64_t currentTokenScope = -1;
      }
    }
    else
    {
      self->_int64_t currentTokenScope = -1;
    }

    obuint64_t j = [v285 objectForKeyedSubscript:@"suggestions"];
    if (*p_currentTokenKind == 16
      && [obj count]
      && ([obj firstObject],
          uint32_t v130 = objc_claimAutoreleasedReturnValue(),
          [v130 objectForKeyedSubscript:@"suggestionTypeKey"],
          uint64_t v131 = objc_claimAutoreleasedReturnValue(),
          v130,
          LODWORD(v130) = [v131 isEqualToString:@"kQPTokenMe"],
          v131,
          v130))
    {
      id v104 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v308 = 0u;
      long long v309 = 0u;
      long long v306 = 0u;
      long long v307 = 0u;
      obuint64_t j = obj;
      uint64_t v132 = [obj countByEnumeratingWithState:&v306 objects:v325 count:16];
      if (v132)
      {
        uint64_t v298 = *(void *)v307;
        do
        {
          for (uint64_t i = 0; i != v132; ++i)
          {
            if (*(void *)v307 != v298) {
              objc_enumerationMutation(obj);
            }
            v134 = *(void **)(*((void *)&v306 + 1) + 8 * i);
            id v135 = [v134 objectForKeyedSubscript:@"suggestionTokensKey"];
            uint64_t v136 = (void *)[v134 mutableCopy];
            if ([v135 count])
            {
              unint64_t v137 = 0;
              do
              {
                long long v138 = [v135 objectAtIndexedSubscript:v137];
                [v136 setObject:v138 forKeyedSubscript:@"suggestionTokensKey"];

                int v139 = [CSSuggestion alloc];
                long long v140 = [v301 suggestion];
                long long v141 = [(CSSuggestion *)v139 initWithUserString:v300 currentSuggestion:v140 suggestionTokenResult:v136];

                if (v141)
                {
                  -[CSSuggestion setEnableFragments:](v141, "setEnableFragments:", [v301 enableSuggestionTokens]);
                  [v104 addObject:v141];
                }

                ++v137;
              }
              while (v137 < [v135 count]);
            }
          }
          uint64_t v132 = [obj countByEnumeratingWithState:&v306 objects:v325 count:16];
        }
        while (v132);
      }

      v289 = [v104 allObjects];
      [(CSUserQuery *)self handleFoundSuggestions:v289];
    }
    else
    {
      long long v142 = [v301 suggestion];
      id v104 = +[CSSuggestion advancedSuggestionWithUserString:v300 currentSuggestion:v142 parseResult:v285];

      if (v104)
      {
        objc_msgSend(v104, "setEnableFragments:", objc_msgSend(v301, "enableSuggestionTokens"));
        id v324 = v104;
        v290 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v324 count:1];
        [(CSUserQuery *)self handleFoundNLPSuggestions:v290];
      }
    }
    goto LABEL_222;
  }
  obuint64_t j = [v285 objectForKeyedSubscript:@"suggestions"];
  if (![obj count])
  {
    v295 = v273;
    id v293 = v291;
    goto LABEL_223;
  }
  id v104 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v288 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v304 = 0u;
  long long v305 = 0u;
  long long v302 = 0u;
  long long v303 = 0u;
  obuint64_t j = obj;
  uint64_t v297 = [obj countByEnumeratingWithState:&v302 objects:v323 count:16];
  if (!v297) {
    goto LABEL_191;
  }
  uint64_t v296 = *(void *)v303;
  do
  {
    uint64_t v105 = 0;
    do
    {
      if (*(void *)v303 != v296) {
        objc_enumerationMutation(obj);
      }
      float v106 = *(void **)(*((void *)&v302 + 1) + 8 * v105);
      float v107 = [v106 objectForKeyedSubscript:@"suggestionTypeKey"];
      uint64_t v108 = v107;
      if (v299)
      {
        if (!v107) {
          goto LABEL_170;
        }
      }
      else
      {
        if (v107) {
          char v109 = v292;
        }
        else {
          char v109 = 0;
        }
        if ((v109 & 1) == 0)
        {
          if (v107)
          {
LABEL_163:
            if ([v108 isEqualToString:@"kQPTokenMe"])
            {
              id v110 = [v106 objectForKeyedSubscript:@"suggestionTokensKey"];
              id v111 = (void *)[v106 mutableCopy];
              if ([(CSSuggestion *)v110 count])
              {
                unint64_t v112 = 0;
                do
                {
                  uint64_t v113 = [(CSSuggestion *)v110 objectAtIndexedSubscript:v112];
                  [v111 setObject:v113 forKeyedSubscript:@"suggestionTokensKey"];

                  uint64_t v114 = [CSSuggestion alloc];
                  uint64_t v115 = [v301 suggestion];
                  v116 = [(CSSuggestion *)v114 initWithUserString:v300 currentSuggestion:v115 suggestionTokenResult:v111];

                  if (v116)
                  {
                    -[CSSuggestion setEnableFragments:](v116, "setEnableFragments:", [v301 enableSuggestionTokens]);
                    [v104 addObject:v116];
                  }

                  ++v112;
                }
                while (v112 < [(CSSuggestion *)v110 count]);
              }

              goto LABEL_175;
            }
          }
LABEL_170:
          uint64_t v117 = [CSSuggestion alloc];
          double v118 = [v301 suggestion];
          id v110 = [(CSSuggestion *)v117 initWithUserString:v300 currentSuggestion:v118 suggestionTokenResult:v106];

          if (!v110)
          {
LABEL_175:

            goto LABEL_176;
          }
          uint64_t v119 = [(CSSuggestion *)v110 currentToken];
          objc_msgSend(v301, "setIsDateQueryContext:", objc_msgSend(v119, "tokenKind") == 5);

          -[CSSuggestion setEnableFragments:](v110, "setEnableFragments:", [v301 enableSuggestionTokens]);
          long long v120 = [(CSSuggestion *)v110 currentToken];
          BOOL v121 = [v120 tokenKind] == 16;

          if (v121)
          {
            [v104 addObject:v110];
            goto LABEL_175;
          }
          if (v315)
          {
LABEL_174:
            [v288 addObject:v110];
            goto LABEL_175;
          }
          unint64_t v122 = [v291 length];
          if (v122 > 2)
          {
            if ((unint64_t)[v291 length] >= 2) {
              goto LABEL_174;
            }
          }
          else
          {
            v286 = [(CSSuggestion *)v110 currentToken];
            if ([v286 tokenKind] == 5)
            {

              goto LABEL_175;
            }
            if ((unint64_t)[v291 length] >= 2)
            {

              goto LABEL_174;
            }
          }
          v123 = [(CSSuggestion *)v110 currentToken];
          uint64_t v124 = [v123 tokenKind];

          if (v122 >= 3)
          {
            if (v124 != 5) {
              goto LABEL_175;
            }
          }
          else
          {

            if (v124 != 5) {
              goto LABEL_175;
            }
          }
          goto LABEL_174;
        }
      }
      if (([v107 isEqualToString:@"kQPSuggestion"] & 1) == 0) {
        goto LABEL_163;
      }
LABEL_176:

      ++v105;
    }
    while (v105 != v297);
    uint64_t v125 = [obj countByEnumeratingWithState:&v302 objects:v323 count:16];
    uint64_t v297 = v125;
  }
  while (v125);
LABEL_191:

  BOOL v126 = [v285 objectForKeyedSubscript:@"senderCompletionString"];
  if ([v126 length])
  {

    goto LABEL_220;
  }
  long long v143 = [v285 objectForKeyedSubscript:@"recipientCompletionString"];
  BOOL v144 = [v143 length] == 0;

  if (!v144) {
LABEL_220:
  }
    [v288 removeAllObjects];
  id v145 = [v104 allObjects];
  [(CSUserQuery *)self handleFoundSuggestions:v145];

  uint64_t v146 = [v288 allObjects];
  [(CSUserQuery *)self handleFoundNLPSuggestions:v146];

  v295 = v273;
  id v293 = v291;

LABEL_222:
LABEL_223:

  if (v299 && [v301 enableSuggestionTokens])
  {
    id v147 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v148 = [v301 suggestion];
    +[CSUserQuery updateWithTemplateSuggestions:v147 searchString:v295 currentSuggestion:v148];

    [(CSUserQuery *)self handleFoundTemplateSuggestions:v147];
  }
  if (v284)
  {
    v149 = [v301 suggestion];
    v150 = [v149 queryString];
    BOOL v151 = [v150 length] != 0;
  }
  else
  {
    BOOL v151 = 0;
  }
  if ([v295 length] || (objc_msgSend(v301, "pommesZKW") | v151) == 1)
  {
    id v152 = [v301 completionString];
    BOOL v153 = [v152 length] == 0;

    if (v153)
    {
      if ([v301 pommesSuggestions])
      {
        if (queryStringWithQueryContext_searchString_options__onceAttributesToken == -1) {
          goto LABEL_239;
        }
        v270 = &__block_literal_global_513;
LABEL_410:
        dispatch_once(&queryStringWithQueryContext_searchString_options__onceAttributesToken, v270);
        goto LABEL_239;
      }
      if (!v272)
      {
        if (queryStringWithQueryContext_searchString_options__onceAttributesToken == -1) {
          goto LABEL_239;
        }
        v270 = &__block_literal_global_640;
        goto LABEL_410;
      }
      if (queryStringWithQueryContext_searchString_options__onceAttributesToken != -1)
      {
        v270 = &__block_literal_global_635;
        goto LABEL_410;
      }
LABEL_239:
      v154 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG)) {
        -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.7(v301);
      }

      id v155 = v293;
      v156 = [v285 objectForKeyedSubscript:@"senderCompletionString"];
      uint64_t v157 = [v156 length];

      if (v157)
      {
        int64_t v158 = 0;
        v159 = @"senderCompletionString";
        goto LABEL_245;
      }
      v160 = [v285 objectForKeyedSubscript:@"recipientCompletionString"];
      uint64_t v161 = [v160 length];

      if (v161)
      {
        v159 = @"recipientCompletionString";
        int64_t v158 = 1;
LABEL_245:
        uint64_t v162 = [v285 objectForKeyedSubscript:v159];

        self->_int64_t currentTokenScope = v158;
        self->_currentTokenKind = 16;
        id v155 = (id)v162;
      }
      v163 = [v155 stringByAppendingString:@"*"];
      [v301 setCompletionString:v163];

      v164 = [v301 completionString];
      unint64_t v165 = [v164 length];

      if (([v301 pommesSuggestions] | v272) == 1)
      {
        [v301 setCompletionResultCount:100];
        if ((v299 | v284 | v281 | v280))
        {
          id v166 = &queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
          if (v165 > 4)
          {
            int v168 = 352;
          }
          else if (v165 > 1 || v151)
          {
            int v168 = 288;
          }
          else
          {
            id v166 = &queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes;
            int v168 = 256;
          }
LABEL_265:
          [v301 setCompletionAttributes:*v166];
        }
        else
        {
          if (v165)
          {
            int v168 = 4352;
            id v166 = &queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
            goto LABEL_265;
          }
          int v168 = 256;
        }
        if (v272 && v271) {
          v168 |= 0x4000u;
        }
      }
      else
      {
        if (v165 > 4)
        {
          if (v165 <= 8)
          {
            if (v165 == 8)
            {
              uint64_t v169 = 50;
            }
            else if (v165 <= 6)
            {
              uint64_t v169 = 25;
            }
            else
            {
              uint64_t v169 = 40;
            }
          }
          else
          {
            uint64_t v169 = 65;
          }
          [v301 setCompletionResultCount:v169];
          [v301 setCompletionAttributes:queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes];
        }
        else
        {
          [v301 setCompletionResultCount:20];
          if (v165 <= 1)
          {
            [v301 setCompletionAttributes:queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes];
            int v168 = 4096;
            goto LABEL_277;
          }
          [v301 setCompletionAttributes:queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes];
        }
        int v168 = 12320;
      }
LABEL_277:
      int v170 = [v301 pommesSuggestions];
      uint64_t v171 = v168 | 4u;
      if (v170)
      {
        int64_t currentTokenScope = self->_currentTokenScope;
        if ((unint64_t)(currentTokenScope + 1) <= 1) {
          LODWORD(v171) = v168 | 0x204;
        }
        if (currentTokenScope == 1 || currentTokenScope == -1) {
          LODWORD(v171) = v171 | 0x400;
        }
        if (self->_currentTokenKind == 5) {
          uint64_t v171 = v171;
        }
        else {
          uint64_t v171 = v171 | 0x800;
        }
      }
      [v301 setCompletionOptions:v171];
      [v301 setCompletionWeights:0];
    }
  }
  uint64_t v173 = [v301 suggestion];
  if (v173)
  {
    v174 = [v301 suggestion];
    v175 = [v174 suggestionTokens];
    if ([v175 count])
    {
      int v176 = [v301 enableResultCountsPerSuggestion];

      if (!v176) {
        goto LABEL_312;
      }
    }
    else
    {
    }
  }
  if (_os_feature_enabled_impl())
  {
    int v177 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_DEBUG)) {
      -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.6(v301);
    }

    int v178 = [v301 normalizedSearchQuery];

    if (v178)
    {
      id v179 = [v301 normalizedSearchQuery];
    }
    else
    {
      v180 = [(CSUserQuery *)self queryContext];
      v181 = [v180 userQuery];
      BOOL v182 = [v181 length] == 0;
      v183 = [(CSUserQuery *)self queryContext];
      int v184 = v183;
      if (v182)
      {
        id v185 = [v183 suggestion];
        id v179 = [v185 userQueryString];
      }
      else
      {
        id v185 = [v183 userQuery];
        id v179 = v185;
      }
    }
    if ([v179 length])
    {
      [NSString stringWithFormat:@"(kMDItemContentType=\"<:b:>.contact\" && kMDItemDisplayName=\"%@*\"cwdt)", v179];
      id v186 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (v278)
    {
      id v186 = @"(kMDItemContentType=\"<:b:>.contact\" && _kMDItemPersonScore<1)";
    }
    else
    {
      id v186 = 0;
    }
    if ([(__CFString *)v186 length])
    {
      v187 = [v301 fetchAttributes];
      if (v187)
      {
        [v301 setFetchAttributes:v187];
      }
      else
      {
        v188 = [MEMORY[0x1E4F1C978] array];
        [v301 setFetchAttributes:v188];
      }
      id v189 = [MEMORY[0x1E4F1CA80] set];
      [v189 addObject:@"kMDItemDisplayName"];
      [v189 addObject:@"kMDItemEmailAddresses"];
      [v189 addObject:@"kMDItemAlternateEmailAddresses"];
      [v189 addObject:@"kMDItemPhoneNumbers"];
      [v189 addObject:@"kMDItemAlternatePhoneNumbers"];
      [v189 addObject:@"kMDItemAlternateNames"];
      [v189 addObject:@"kMDItemContactKeywords"];
      [v189 addObject:@"_kMDItemPersonScore"];
      [v189 addObject:@"_kMDItemPersonVersion"];
      [v189 addObject:@"_kMDItemPersonInCount"];
      [v189 addObject:@"_kMDItemPersonOutCount"];
      [v189 addObject:@"_kMDItemPersonCount"];
      [v189 addObject:@"_kMDItemPersonEntityIdentifier"];
      [v189 addObject:@"_kMDItemDomainIdentifier"];
      [v189 addObject:@"com_apple_spotlight_contacts_type"];
      v190 = [v301 fetchAttributes];
      v191 = [v189 allObjects];
      v192 = [v190 arrayByAddingObjectsFromArray:v191];
      [v301 setFetchAttributes:v192];

      v322 = v186;
      v193 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v322 count:1];
      [v301 setAdditionalQueries:v193];

      [v301 setAdditionalBundleIDs:&unk_1EDBD5B60];
      [v301 setGrouped:1];
    }
  }
LABEL_312:
  v194 = [v285 objectForKey:@"instantAnswers"];
  v195 = [v295 lowercaseString];
  if (![v301 enableInstantAnswers]
    || (([v301 advancedQuery] | v278) & 1) != 0
    || !+[CSInstantAnswers isInstantAnswerTriggerQuery:v195 isCJK:v315 isSearchTool:0])
  {
    goto LABEL_399;
  }
  if (!_os_feature_enabled_impl())
  {
    if (!_os_feature_enabled_impl()) {
      goto LABEL_399;
    }
    LOBYTE(v197) = 0;
LABEL_325:
    v199 = [v301 clientBundleID];
    if ([v199 hasPrefix:@"com.apple.omniSearch"])
    {
      int v200 = 1;
    }
    else
    {
      v201 = [v301 clientBundleID];
      if ([v201 hasPrefix:@"com.apple.intelligenceflow"])
      {
        int v200 = 1;
      }
      else if ([v274 containsObject:@"com.apple.omniSearch"])
      {
        v202 = [v301 clientBundleID];
        if ([v202 isEqualToString:@"com.apple.corespotlight.InternalTestsHost"])
        {
          int v200 = 1;
        }
        else
        {
          v203 = [v301 clientBundleID];
          int v200 = [v203 hasPrefix:@"com.apple.SpotlightUITests"];
        }
      }
      else
      {
        int v200 = 0;
      }
    }
    if ((v197 & 1) == 0) {
      goto LABEL_371;
    }
LABEL_339:
    long long v204 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v205 = [v301 queryID];
      CSRedactString(v195, 1);
      id v206 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v205;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v206;
      _os_log_impl(&dword_18D0E3000, v204, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] CSUserQuery: enabling instant answers for searchString = %@", buf, 0x16u);
    }
    long long v207 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v207, OS_LOG_TYPE_DEBUG)) {
      -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.5();
    }

    if (+[CSInstantAnswers overrideParsedQuery:v195])
    {
      long long v208 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v209 = [v301 queryID];
        CSRedactString(v195, 1);
        id v210 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v209;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v210;
        _os_log_impl(&dword_18D0E3000, v208, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] Overriding parsed query for searchString = %@", buf, 0x16u);
      }
    }
    else if (v194)
    {
      long long v211 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v212 = [v301 queryID];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v212;
        _os_log_impl(&dword_18D0E3000, v211, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] using instantAnswersQuery from QueryParser", buf, 0xCu);
      }

      v321 = v194;
      uint64_t v213 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v321 count:1];
      [v301 setInstantAnswersQueries:v213];
LABEL_354:

      v217 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v218 = [v301 queryID];
        v219 = [v301 instantAnswersQueries];
        CSRedactStringArray(v219, 1);
        id v220 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v218;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v220;
        _os_log_impl(&dword_18D0E3000, v217, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] instantAnswersQuery = %@", buf, 0x16u);
      }
      v221 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG)) {
        -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.4(v301);
      }

      __int16 v222 = [v301 instantAnswersQueries];

      if (v222)
      {
        id v223 = [v301 filterQueries];
        __int16 v224 = +[CSInstantAnswers instantAnswersMailboxes:v223];

        id v225 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v226 = [v301 queryID];
          CSRedactStringArray(v224, 1);
          id v227 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = v226;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v227;
          _os_log_impl(&dword_18D0E3000, v225, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] mailboxes = %@", buf, 0x16u);
        }
        v228 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v228, OS_LOG_TYPE_DEBUG)) {
          -[CSUserQuery queryStringWithQueryContext:searchString:options:]();
        }

        if (v224)
        {
          v229 = [v301 instantAnswersQueries];
          v230 = [v229 arrayByAddingObjectsFromArray:v224];

          v231 = [v230 componentsJoinedByString:@" && "];
          v320 = v231;
          v232 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v320 count:1];
          [v301 setInstantAnswersQueries:v232];
        }
        v233 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v234 = [v301 queryID];
          v235 = [v301 instantAnswersQueries];
          CSRedactStringArray(v235, 1);
          id v236 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = v234;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v236;
          _os_log_impl(&dword_18D0E3000, v233, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] final instantAnswersQuery = %@", buf, 0x16u);
        }
        v237 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v237, OS_LOG_TYPE_DEBUG)) {
          -[CSUserQuery queryStringWithQueryContext:searchString:options:](v301);
        }

        v238 = [v301 fetchAttributes];
        if (v238)
        {
          [v301 setFetchAttributes:v238];
        }
        else
        {
          v239 = objc_opt_new();
          [v301 setFetchAttributes:v239];
        }
        v240 = [MEMORY[0x1E4F1CA80] set];
        if (queryStringWithQueryContext_searchString_options__onceAttributesToken_726 != -1) {
          dispatch_once(&queryStringWithQueryContext_searchString_options__onceAttributesToken_726, &__block_literal_global_729);
        }
        [v240 addObjectsFromArray:queryStringWithQueryContext_searchString_options__commonEventAttributes];
        [v240 addObjectsFromArray:queryStringWithQueryContext_searchString_options__flightEventAttributes];
        [v240 addObjectsFromArray:queryStringWithQueryContext_searchString_options__hotelEventAttributes];
        v241 = [v301 fetchAttributes];
        v242 = [v240 allObjects];
        v243 = [v241 arrayByAddingObjectsFromArray:v242];
        [v301 setFetchAttributes:v243];

        [v301 setInstantAnswersBundleIDs:&unk_1EDBD5B78];
        [v301 setGrouped:1];

        if ((v200 & 1) == 0) {
          goto LABEL_399;
        }
LABEL_377:
        v244 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v245 = [v301 queryID];
          CSRedactString(v195, 1);
          id v246 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = v245;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v246;
          _os_log_impl(&dword_18D0E3000, v244, OS_LOG_TYPE_DEFAULT, "[personal answers][query][qid=%ld] CSUserQuery: enabling personal answers for searchString = %@", buf, 0x16u);
        }
        v247 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v247, OS_LOG_TYPE_DEBUG)) {
          -[CSUserQuery queryStringWithQueryContext:searchString:options:]();
        }

        if (+[CSInstantAnswers overrideParsedQuery:v195])
        {
          v248 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v249 = [v301 queryID];
            CSRedactString(v195, 1);
            id v250 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = v249;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v250;
            _os_log_impl(&dword_18D0E3000, v248, OS_LOG_TYPE_DEFAULT, "[personal answers][query][qid=%ld] Overriding parsed query for searchString = %@", buf, 0x16u);
          }
        }
        v251 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v252 = [v301 queryID];
          CSRedactString(v195, 1);
          id v253 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = v252;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v253;
          _os_log_impl(&dword_18D0E3000, v251, OS_LOG_TYPE_DEFAULT, "[personal answers][query][qid=%ld] using fallback personalAnswerQuery for searchString = %@", buf, 0x16u);
        }
        v254 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v255 = [v195 componentsSeparatedByCharactersInSet:v254];

        if ((unint64_t)[v255 count] >= 2) {
          unint64_t v256 = 2;
        }
        else {
          unint64_t v256 = 3;
        }
        if (v315)
        {
          if ((unint64_t)[v195 length] < 3)
          {
            BOOL v257 = 1;
LABEL_396:
            v258 = [MEMORY[0x1E4F1CA80] set];
            v259 = +[CSPersonalAnswers personalAnswersFallbackQueries:v255 queryComponents:MEMORY[0x1E4F1CBF0] searchString:v195 answerAttributeIntents:v258 isShortQuery:v257 locale:@"en"];
            if (v259)
            {
              v260 = +[CSPersonalAnswers attributesFromIntent:v258];
              v261 = [v301 fetchAttributes];
              v262 = [v260 allObjects];
              v263 = [v261 arrayByAddingObjectsFromArray:v262];
              [v301 setFetchAttributes:v263];

              [v301 setInstantAnswersBundleIDs:&unk_1EDBD5B90];
              [v301 setInstantAnswersQueries:v259];
              v264 = [v258 allObjects];
              [v301 setAnswerAttributes:v264];

              [v301 setGrouped:1];
            }

            goto LABEL_399;
          }
          if (v315)
          {
            BOOL v257 = 0;
            goto LABEL_396;
          }
        }
        BOOL v257 = [v195 length] <= v256;
        goto LABEL_396;
      }
LABEL_371:
      if (!v200) {
        goto LABEL_399;
      }
      goto LABEL_377;
    }
    id v214 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v215 = [v301 queryID];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v215;
      _os_log_impl(&dword_18D0E3000, v214, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] NOT using instantAnswersQuery from QueryParser", buf, 0xCu);
    }

    uint64_t v213 = [v283 allObjects];
    v216 = +[CSInstantAnswers instantAnswersFallbackQueries:v195 queryComponents:v213 isCJK:v315];
    [v301 setInstantAnswersQueries:v216];

    goto LABEL_354;
  }
  v196 = [v301 clientBundleID];
  if ([v196 isEqualToString:@"com.apple.mobilemail"])
  {
    int v197 = 1;
  }
  else
  {
    v198 = [v301 clientBundleID];
    if ([v198 isEqualToString:@"com.apple.corespotlight.InternalTestsHost"]) {
      int v197 = [v274 containsObject:@"com.apple.omniSearch"] ^ 1;
    }
    else {
      int v197 = 0;
    }
  }
  if (_os_feature_enabled_impl()) {
    goto LABEL_325;
  }
  if (v197)
  {
    int v200 = 0;
    goto LABEL_339;
  }
LABEL_399:
  [v301 setCurrentTokenScope:self->_currentTokenScope];
  [v301 setDisableNLP:1];
  if (![v283 count]) {
    [v283 addObject:@"(true)"];
  }
  BOOL v265 = [v283 count] == 1;
  v266 = [v283 allObjects];
  v267 = v266;
  if (v265) {
    [v266 firstObject];
  }
  else {
  v268 = [v266 componentsJoinedByString:@" && "];
  }

  return v268;
}

uint64_t __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke(uint64_t a1)
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      if (_os_feature_enabled_impl())
      {
        LOBYTE(v2) = 1;
        goto LABEL_8;
      }
      if (*(unsigned char *)(a1 + 32))
      {
        LOBYTE(v2) = 0;
        goto LABEL_8;
      }
    }
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
LABEL_8:
  queryStringWithQueryContext_searchString_options__isFeatureFlagsEnabled = v2;
  uint64_t result = _os_feature_enabled_impl();
  queryStringWithQueryContext_searchString_options__isMailSemanticSearchEnabled = result;
  return result;
}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_481(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"(%@ > %f)", a2, *(void *)(a1 + 40)];
  [v2 addObject:v3];
}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_511()
{
  v0 = (void *)queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes = (uint64_t)&unk_1EDBD5AE8;

  id v1 = (void *)queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes = (uint64_t)&unk_1EDBD5B00;
}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_2()
{
  v0 = (void *)queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes = (uint64_t)&unk_1EDBD5B18;

  id v1 = (void *)queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;

  objc_storeStrong((id *)&queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes, v1);
}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_3()
{
  v0 = (void *)queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes = (uint64_t)&unk_1EDBD5B30;

  id v1 = (void *)queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes = (uint64_t)&unk_1EDBD5B48;
}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_727()
{
  v8[8] = *MEMORY[0x1E4F143B8];
  v8[0] = @"kMDItemEventMessageIdentifier";
  v8[1] = @"kMDItemEventGroupIdentifier";
  v8[2] = @"kMDItemEventFallbackGroupIdentifier";
  v8[3] = @"kMDItemEventType";
  v8[4] = @"kMDItemEventIsAllDay";
  v8[5] = @"kMDItemStartDate";
  v8[6] = @"kMDItemEndDate";
  v8[7] = @"com_apple_mail_messageID";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
  id v1 = (void *)queryStringWithQueryContext_searchString_options__commonEventAttributes;
  queryStringWithQueryContext_searchString_options__commonEventAttributes = v0;

  v7[0] = @"kMDItemEventFlightNumber";
  v7[1] = @"kMDItemEventFlightCheckInUrl";
  v7[2] = @"kMDItemEventFlightBookingInfoUrl";
  v7[3] = @"kMDItemEventFlightStatus";
  v7[4] = @"kMDItemEventFlightCarrier";
  void v7[5] = @"kMDItemEventFlightCarrierCode";
  v7[6] = @"kMDItemEventFlightArrivalDateTime";
  v7[7] = @"kMDItemEventFlightArrivalTimeZone";
  v7[8] = @"kMDItemEventFlightDepartureDateTime";
  v7[9] = @"kMDItemEventFlightDepartureTimeZone";
  v7[10] = @"kMDItemEventFlightArrivalAirportCode";
  v7[11] = @"kMDItemEventFlightDepartureAirportCode";
  v7[12] = @"kMDItemEventFlightArrivalTerminal";
  v7[13] = @"kMDItemEventFlightDepartureTerminal";
  v7[14] = @"kMDItemEventFlightConfirmationNumber";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:15];
  id v3 = (void *)queryStringWithQueryContext_searchString_options__flightEventAttributes;
  queryStringWithQueryContext_searchString_options__flightEventAttributes = v2;

  v6[0] = @"kMDItemEventHotelReservationId";
  v6[1] = @"kMDItemEventHotelUnderName";
  v6[2] = @"kMDItemEventHotelProvider";
  v6[3] = @"kMDItemEventHotelModifyReservationUrl";
  v6[4] = @"kMDItemEventHotelCheckinDate";
  v6[5] = @"kMDItemEventHotelCheckinTime";
  v6[6] = @"kMDItemEventHotelCheckoutDate";
  v6[7] = @"kMDItemEventHotelCheckoutTime";
  v6[8] = @"kMDItemEventHotelTimeZone";
  v6[9] = @"kMDItemEventHotelReservationForName";
  v6[10] = @"kMDItemEventHotelReservationForAddress";
  v6[11] = @"kMDItemEventHotelReservationForStreetAddress";
  v6[12] = @"kMDItemEventHotelReservationForAddressLocality";
  v6[13] = @"kMDItemEventHotelReservationForAddressRegion";
  v6[14] = @"kMDItemEventHotelReservationForAddressPostalCode";
  v6[15] = @"kMDItemEventHotelReservationForAddressCountry";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:16];
  uint64_t v5 = (void *)queryStringWithQueryContext_searchString_options__hotelEventAttributes;
  queryStringWithQueryContext_searchString_options__hotelEventAttributes = v4;
}

- (CSUserQuery)initWithQueryString:(id)a3 queryContext:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSUserQuery;
  id v7 = [(CSSearchQuery *)&v10 initWithQueryString:a3 queryContext:v6];
  id v8 = v7;
  if (v7) {
    commonInit(v7, v6, v6, &stru_1EDBB3A50, 0);
  }

  return v8;
}

- (CSUserQuery)initWithQueryString:(id)a3 context:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSUserQuery;
  id v7 = [(CSSearchQuery *)&v10 initWithQueryString:a3 context:v6];
  id v8 = v7;
  if (v7) {
    commonInit(v7, v6, v6, &stru_1EDBB3A50, 0);
  }

  return v8;
}

- (CSUserQuery)initWithUserQueryString:(id)a3 queryContext:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F28E78];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  objc_super v10 = +[CSUserQuery queryContextWithUserQueryString:v8 searchString:v9 clientContext:v6];

  id v11 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CSUserQuery initWithUserQueryString:queryContext:]();
  }

  v15.receiver = self;
  v15.super_class = (Class)CSUserQuery;
  id v12 = [(CSSearchQuery *)&v15 initWithQueryString:&stru_1EDBB3A50 queryContext:v10];
  if (v12)
  {
    id v13 = [v6 getParserOptions];
    commonInit(v12, v10, v6, v9, v13);
  }
  return v12;
}

- (CSUserQuery)initWithUserAttributedQueryString:(id)a3 userQueryContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 setAttributedUserQuery:v7];
  id v8 = [v7 string];

  id v9 = [(CSUserQuery *)self initWithUserQueryString:v8 userQueryContext:v6];
  return v9;
}

- (CSUserQuery)initWithUserQueryString:(NSString *)userQueryString userQueryContext:(CSUserQueryContext *)userQueryContext
{
  id v6 = userQueryContext;
  id v7 = (objc_class *)MEMORY[0x1E4F28E78];
  id v8 = userQueryString;
  id v9 = objc_alloc_init(v7);
  objc_super v10 = +[CSUserQuery queryContextWithUserQueryString:v8 searchString:v9 clientContext:v6];

  id v11 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CSUserQuery initWithUserQueryString:queryContext:]();
  }

  v15.receiver = self;
  v15.super_class = (Class)CSUserQuery;
  id v12 = [(CSSearchQuery *)&v15 initWithQueryString:&stru_1EDBB3A50 queryContext:v10];
  if (v12)
  {
    id v13 = [(CSUserQueryContext *)v6 getParserOptions];
    commonInit(v12, v10, v6, v9, v13);
  }
  return v12;
}

- (BOOL)isTopHitQuery
{
  return self->_queryIsTopHit;
}

- (id)queryContext
{
  v4.receiver = self;
  v4.super_class = (Class)CSUserQuery;
  uint64_t v2 = [(CSSearchQuery *)&v4 queryContext];

  return v2;
}

- (id)clientContext
{
  return self->_clientContext;
}

- (id)foundNLPSuggestions
{
  return self->_nlpSuggestions;
}

- (id)foundTemplateSuggestions
{
  return self->_templateSuggestions;
}

- (id)foundSuggestions
{
  return self->_suggestions;
}

- (id)foundCompletions
{
  return self->_completions;
}

- (id)foundInstantAnswers
{
  return self->_instantAnswers;
}

- (void)handleFoundNLPSuggestions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__CSUserQuery_handleFoundNLPSuggestions___block_invoke;
    v5[3] = &unk_1E5548FE0;
    v5[4] = self;
    id v6 = v4;
    [(CSSearchQuery *)self populateSuggestionCount:v6 completionHandler:v5];
  }
}

void __41__CSUserQuery_handleFoundNLPSuggestions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [*(id *)(a1 + 32) queryContext];
    uint64_t v5 = [v4 queryID];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle suggestion batches %@ for query:%@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 336) addObjectsFromArray:*(void *)(a1 + 40)];
  objc_sync_exit(v2);
}

- (void)handleFoundTemplateSuggestions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__CSUserQuery_handleFoundTemplateSuggestions___block_invoke;
    v5[3] = &unk_1E5548FE0;
    v5[4] = self;
    id v6 = v4;
    [(CSSearchQuery *)self populateSuggestionCount:v6 completionHandler:v5];
  }
}

void __46__CSUserQuery_handleFoundTemplateSuggestions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [*(id *)(a1 + 32) queryContext];
    uint64_t v5 = [v4 queryID];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle suggestion batches %@ for query:%@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 344) addObjectsFromArray:*(void *)(a1 + 40)];
  objc_sync_exit(v2);
}

- (void)handleFoundInstantAnswers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [(CSUserQuery *)v5 queryContext];
      int v8 = 134218498;
      uint64_t v9 = [v7 queryID];
      __int16 v10 = 2112;
      id v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_debug_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle instant answer batches %@ for query:%@", (uint8_t *)&v8, 0x20u);
    }
    [(NSMutableArray *)v5->_instantAnswers addObjectsFromArray:v4];
    objc_sync_exit(v5);
  }
}

- (void)handleFoundSuggestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"resultCount != %lu", 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  if ([v6 count])
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    int v8 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(CSUserQuery *)v7 queryContext];
      *(_DWORD *)buf = 134218498;
      uint64_t v15 = [v11 queryID];
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_debug_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle suggestion batches %@ for query:%@", buf, 0x20u);
    }
    [(NSMutableArray *)v7->_suggestions addObjectsFromArray:v6];
    objc_sync_exit(v7);
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"resultCount == %lu", 0x7FFFFFFFFFFFFFFFLL);
  __int16 v10 = [v4 filteredArrayUsingPredicate:v9];

  if ([v10 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__CSUserQuery_handleFoundSuggestions___block_invoke;
    v12[3] = &unk_1E5548FE0;
    v12[4] = self;
    id v13 = v10;
    [(CSSearchQuery *)self populateSuggestionCount:v13 completionHandler:v12];
  }
}

void __38__CSUserQuery_handleFoundSuggestions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [*(id *)(a1 + 32) queryContext];
    uint64_t v5 = [v4 queryID];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle suggestion batches %@ for query:%@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 352) addObjectsFromArray:*(void *)(a1 + 40)];
  objc_sync_exit(v2);
}

- (void)handleParseResult:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CSUserQuery *)self attributedQueryHandler];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"kQPPhotosEmbedding"];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"queryUnderstandingOutput"];
    int v8 = v7;
    if (v7)
    {
      v36 = [v7 objectForKeyedSubscript:@"embeddingScale"];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"embeddingBias"];
      __int16 v10 = [v8 objectForKey:@"embeddingErrorDescriptionKey"];

      if (v10)
      {
        uint64_t v11 = [v8 objectForKeyedSubscript:@"embeddingErrorDescriptionKey"];
        BOOL v12 = [v11 longValue] == -8008;
      }
      else
      {
        BOOL v12 = 0;
      }
      uint64_t v15 = [v8 objectForKeyedSubscript:@"attributedParse"];
      if (v15)
      {
        __int16 v16 = [v8 objectForKeyedSubscript:@"kQPQUOutputTokenInfo"];
        BOOL v17 = v12;
        __int16 v18 = [CSAttributedQuery alloc];
        v37[0] = v15;
        id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
        [v36 floatValue];
        int v21 = v20;
        [v9 floatValue];
        LODWORD(v23) = v22;
        LODWORD(v24) = v21;
        uint64_t v25 = [(CSAttributedQuery *)v18 initWithAttributedParses:v19 outputTokenInfo:v16 embedding:v6 embeddingScale:v17 embeddingBias:0 isUnsafeQuery:v24 error:v23];

        int v26 = [(CSUserQuery *)self attributedQueryHandler];
        ((void (**)(void, CSAttributedQuery *))v26)[2](v26, v25);
      }
      else
      {
        int v27 = [v8 objectForKeyedSubscript:@"attributedParses"];
        int v28 = [CSAttributedQuery alloc];
        [v36 floatValue];
        int v30 = v29;
        [v9 floatValue];
        LODWORD(v32) = v31;
        LODWORD(v33) = v30;
        int v34 = [(CSAttributedQuery *)v28 initWithAttributedParses:v27 outputTokenInfo:0 embedding:v6 embeddingScale:v12 embeddingBias:0 isUnsafeQuery:v33 error:v32];
        id v35 = [(CSUserQuery *)self attributedQueryHandler];
        ((void (**)(void, CSAttributedQuery *))v35)[2](v35, v34);
      }
    }
    else
    {
      uint64_t v13 = [[CSAttributedQuery alloc] initWithAttributedQuery:0 embedding:v6];
      uint64_t v14 = [(CSUserQuery *)self attributedQueryHandler];
      ((void (**)(void, CSAttributedQuery *))v14)[2](v14, v13);
    }
  }
}

- (void)handleFoundItems:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSUserQuery;
  id v4 = a3;
  [(CSSearchQuery *)&v5 handleFoundItems:v4];
  -[CSUserQuery processInstantAnswersWithFoundItems:](self, "processInstantAnswersWithFoundItems:", v4, v5.receiver, v5.super_class);
}

- (void)handleFoundCompletions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__CSUserQuery_handleFoundCompletions___block_invoke;
    v5[3] = &unk_1E5548FE0;
    v5[4] = self;
    id v6 = v4;
    [(CSSearchQuery *)self populateSuggestionCount:v6 completionHandler:v5];
  }
}

void __38__CSUserQuery_handleFoundCompletions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [*(id *)(a1 + 32) queryContext];
    uint64_t v5 = [v4 queryID];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle completion batches %@ for query:%@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 360) addObjectsFromArray:*(void *)(a1 + 40)];
  objc_sync_exit(v2);
}

- (NSInteger)foundSuggestionCount
{
  id v2 = self;
  objc_sync_enter(v2);
  NSInteger foundSuggestionCount = v2->_foundSuggestionCount;
  objc_sync_exit(v2);

  return foundSuggestionCount;
}

- (id)processToContacts:(id)a3 resultsToMultiQuery:(id)a4 contactsTo:(id)a5 processedContacts:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(CSSearchQuery *)self isCancelled])
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = [v12 count];
    if (v15 == [v11 count])
    {
      uint64_t v38 = self;
      __int16 v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      if ([v12 count])
      {
        unint64_t v17 = 0;
        do
        {
          __int16 v18 = [v11 objectAtIndexedSubscript:v17];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            int v20 = [v12 objectAtIndexedSubscript:v17];
            [v20 setScope:2];

            int v21 = [v12 objectAtIndexedSubscript:v17];
            [v16 addObject:v21];

            int v22 = [v12 objectAtIndexedSubscript:v17];
            [v13 addObject:v22];
          }
          ++v17;
        }
        while (v17 < [v12 count]);
      }
      double v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v39 = v10;
      id v24 = v10;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v41 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            if ([v13 containsObject:v29]) {
              [v23 addObject:v29];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v52 count:16];
        }
        while (v26);
      }

      int v30 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v31 = [(CSUserQuery *)v38 queryContext];
        uint64_t v32 = [v31 queryID];
        uint64_t v33 = [v13 count];
        uint64_t v34 = [v16 count];
        uint64_t v35 = [v23 count];
        *(_DWORD *)buf = 134218752;
        uint64_t v45 = v32;
        __int16 v46 = 2048;
        uint64_t v47 = v33;
        __int16 v48 = 2048;
        uint64_t v49 = v34;
        __int16 v50 = 2048;
        uint64_t v51 = v35;
        _os_log_impl(&dword_18D0E3000, v30, OS_LOG_TYPE_INFO, "qid=%ld - [ContactSearch] Processed contacts: %lu, Recipient contacts: %lu, Total trimmed contacts: %lu", buf, 0x2Au);
      }
      uint64_t v14 = (void *)[v23 copy];

      id v10 = v39;
    }
    else
    {
      __int16 v16 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        BOOL v37 = [(CSUserQuery *)self queryContext];
        *(_DWORD *)buf = 134218496;
        uint64_t v45 = [v37 queryID];
        __int16 v46 = 2048;
        uint64_t v47 = [v12 count];
        __int16 v48 = 2048;
        uint64_t v49 = [v11 count];
        _os_log_fault_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_FAULT, "qid=%ld - [ContactSearch] suggestions.count %lu != results.count %lu", buf, 0x20u);
      }
      uint64_t v14 = 0;
    }
  }

  return v14;
}

- (id)processFromContacts:(id)a3 resultsFromMultiQuery:(id)a4 contactsFrom:(id)a5 processedContacts:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(CSSearchQuery *)self isCancelled])
  {
    id v12 = 0;
    goto LABEL_27;
  }
  id v13 = [(CSUserQuery *)self queryContext];
  if ([v13 currentTokenScope] == 1)
  {

LABEL_6:
    __int16 v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    unint64_t v17 = [(CSUserQuery *)self queryContext];
    if ([v17 currentTokenScope] == 1)
    {
LABEL_12:
    }
    else
    {
      unint64_t v18 = 0;
      while (1)
      {
        unint64_t v19 = [v10 count];

        if (v18 >= v19) {
          break;
        }
        int v20 = [v9 objectAtIndexedSubscript:v18];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          int v22 = [v10 objectAtIndexedSubscript:v18];
          [v22 setScope:1];

          double v23 = [v10 objectAtIndexedSubscript:v18];
          [v16 addObject:v23];

          id v24 = [v10 objectAtIndexedSubscript:v18];
          [v11 addObject:v24];
        }
        ++v18;
        unint64_t v17 = [(CSUserQuery *)self queryContext];
        if ([v17 currentTokenScope] == 1) {
          goto LABEL_12;
        }
      }
    }
    id v39 = v11;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v25 = [v10 differenceFromArray:v16];
    uint64_t v26 = [v25 insertions];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v26);
          }
          int v31 = [*(id *)(*((void *)&v40 + 1) + 8 * i) object];
          [v12 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v28);
    }

    uint64_t v32 = logForCSLogCategoryDefault();
    id v11 = v39;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = [(CSUserQuery *)self queryContext];
      uint64_t v34 = [v33 queryID];
      uint64_t v35 = [v39 count];
      uint64_t v36 = [v16 count];
      *(_DWORD *)buf = 134218496;
      uint64_t v46 = v34;
      __int16 v47 = 2048;
      uint64_t v48 = v35;
      __int16 v49 = 2048;
      uint64_t v50 = v36;
      _os_log_impl(&dword_18D0E3000, v32, OS_LOG_TYPE_INFO, "qid=%ld - [ContactSearch] Processed contacts: %lu, Author contacts: %lu", buf, 0x20u);
    }
    goto LABEL_26;
  }
  uint64_t v14 = [v10 count];
  uint64_t v15 = [v9 count];

  if (v14 == v15) {
    goto LABEL_6;
  }
  __int16 v16 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    uint64_t v38 = [(CSUserQuery *)self queryContext];
    *(_DWORD *)buf = 134218496;
    uint64_t v46 = [v38 queryID];
    __int16 v47 = 2048;
    uint64_t v48 = [v10 count];
    __int16 v49 = 2048;
    uint64_t v50 = [v9 count];
    _os_log_fault_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_FAULT, "qid=%ld - [ContactSearch] suggestions.count %lu != results.count %lu", buf, 0x20u);
  }
  id v12 = 0;
LABEL_26:

LABEL_27:

  return v12;
}

- (void)filterContactPeopleSuggestions:(id)a3 cachedSuggestionsEmailToScope:(id)a4 completionHandler:(id)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v71 = a4;
  id v9 = (void (**)(id, void))a5;
  uint64_t v72 = self;
  if ([(CSSearchQuery *)self isCancelled])
  {
    v9[2](v9, 0);
    goto LABEL_49;
  }
  if (![v8 count])
  {
    ((void (**)(id, id))v9)[2](v9, v8);
    goto LABEL_49;
  }
  int v61 = v9;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__0;
  uint64_t v99 = __Block_byref_object_dispose__0;
  id v100 = 0;
  id v100 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v65 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v10 = [(CSUserQuery *)self queryContext];
  id v11 = [v10 userQuery];
  int v12 = [v11 containsString:@"@"];

  if (v12)
  {
    id v13 = [(CSUserQuery *)v72 queryContext];
    uint64_t v14 = [v13 userQuery];
    uint64_t v15 = +[_CSContactSearch filterContactsBasedOnUserQueryString:v14 contacts:v8];

    id v8 = (id)v15;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = v8;
  uint64_t v64 = [obj countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (!v64) {
    goto LABEL_42;
  }
  uint64_t v63 = *(void *)v92;
  do
  {
    for (uint64_t i = 0; i != v64; ++i)
    {
      if (*(void *)v92 != v63) {
        objc_enumerationMutation(obj);
      }
      __int16 v16 = *(void **)(*((void *)&v91 + 1) + 8 * i);
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      uint64_t v66 = v16;
      objc_msgSend(v16, "emailAddresses", v61);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v74 = [v68 countByEnumeratingWithState:&v87 objects:v106 count:16];
      if (!v74)
      {
        uint64_t v69 = 1;
        char v70 = 0;
        goto LABEL_38;
      }
      uint64_t v73 = *(void *)v88;
      uint64_t v69 = 1;
      char v70 = 0;
      do
      {
        for (uint64_t j = 0; j != v74; ++j)
        {
          if (*(void *)v88 != v73) {
            objc_enumerationMutation(v68);
          }
          uint64_t v17 = *(void *)(*((void *)&v87 + 1) + 8 * j);
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          unint64_t v18 = [(CSUserQuery *)v72 queryContext];
          unint64_t v19 = [v18 suggestion];
          int v20 = [v19 previousSuggestionTokens];

          uint64_t v21 = [v20 countByEnumeratingWithState:&v83 objects:v105 count:16];
          if (!v21) {
            goto LABEL_32;
          }
          uint64_t v22 = *(void *)v84;
          while (2)
          {
            for (uint64_t k = 0; k != v21; ++k)
            {
              if (*(void *)v84 != v22) {
                objc_enumerationMutation(v20);
              }
              id v24 = *(void **)(*((void *)&v83 + 1) + 8 * k);
              uint64_t v25 = [v24 itemSummary];
              if (v25)
              {
                uint64_t v26 = [v24 itemSummary];
                uint64_t v27 = [v26 allEmailAddresses];
                BOOL v28 = [v27 count] == 0;

                if (!v28)
                {
                  uint64_t v29 = [v24 itemSummary];
                  int v30 = [v29 allEmailAddresses];
                  int v31 = [v30 containsObject:v17];

                  if (v31)
                  {
                    if ([v24 selectedScope])
                    {
                      if ([v24 selectedScope] != 1) {
                        continue;
                      }
                      char v70 = 1;
                      uint64_t v32 = 1;
                    }
                    else
                    {
                      char v70 = 1;
                      uint64_t v32 = 2;
                    }
                    uint64_t v69 = v32;
                    goto LABEL_32;
                  }
                }
              }
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v83 objects:v105 count:16];
            if (v21) {
              continue;
            }
            break;
          }
LABEL_32:

          uint64_t v33 = [v71 objectForKeyedSubscript:v17];
          char v34 = [v33 isEqualToNumber:&unk_1EDBD6490];

          if (v34)
          {
            char v70 = 1;
            uint64_t v69 = 2;
            goto LABEL_38;
          }
        }
        uint64_t v74 = [v68 countByEnumeratingWithState:&v87 objects:v106 count:16];
      }
      while (v74);
LABEL_38:

      [v66 setScope:v69];
      uint64_t v35 = v65;
      if (v70) {
        uint64_t v35 = (void *)v96[5];
      }
      [v35 addObject:v66];
    }
    uint64_t v64 = [obj countByEnumeratingWithState:&v91 objects:v107 count:16];
  }
  while (v64);
LABEL_42:

  uint64_t v36 = [(CSUserQuery *)v72 queryContext];
  BOOL v37 = +[CSUserQuery generateFilterQueriesBasedOnPreviousSuggestions:v36];

  uint64_t v38 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    id v39 = [(CSUserQuery *)v72 queryContext];
    uint64_t v40 = [v39 queryID];
    uint64_t v41 = [obj count];
    uint64_t v42 = [(id)v96[5] count];
    uint64_t v43 = [v65 count];
    *(_DWORD *)buf = 134218752;
    *(void *)&uint8_t buf[4] = v40;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v41;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v102 = v42;
    __int16 v103 = 2048;
    uint64_t v104 = v43;
    _os_log_impl(&dword_18D0E3000, v38, OS_LOG_TYPE_INFO, "qid=%ld - [ContactSearch] Total contacts: %lu, Cached contacts: %lu, Fresh contacts: %lu", buf, 0x2Au);
  }
  int v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v65, "count"));
  for (unint64_t m = 0; ; ++m)
  {
    uint64_t v46 = [(CSUserQuery *)v72 queryContext];
    if ([v46 currentTokenScope] == 1) {
      break;
    }
    BOOL v47 = m < [v65 count];

    if (!v47) {
      goto LABEL_51;
    }
    uint64_t v48 = [v65 objectAtIndexedSubscript:m];
    __int16 v49 = [v48 emailAddresses];
    [v44 addObject:v49];
  }
LABEL_51:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v102) = 0;
  uint64_t v50 = [(CSUserQuery *)v72 queryContext];
  uint64_t v51 = [v50 suggestion];
  unint64_t v52 = [v51 previousSuggestionTokens];
  BOOL v53 = [v52 count] != 0;

  LOBYTE(v102) = v53;
  v54 = (void *)[v44 copy];
  char v55 = [(CSUserQuery *)v72 queryContext];
  uint64_t v56 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke;
  v76[3] = &unk_1E5549030;
  v76[4] = v72;
  id v8 = obj;
  id v77 = v8;
  id v57 = v65;
  id v78 = v57;
  v81 = &v95;
  id v80 = v61;
  id v58 = v37;
  id v79 = v58;
  id v82 = buf;
  uint64_t v59 = +[_CSMultiQuery countingQueryForEmailsArrays:v54 scope:1 context:v55 contextualFilterQueries:v58 includeSecondaryRecipients:v56 completionHandler:v76];
  contactCountingQuerySearchFrounint64_t m = v72->_contactCountingQuerySearchFrom;
  v72->_contactCountingQuerySearchFrounint64_t m = (_CSMultiQuery *)v59;

  [(_CSMultiQuery *)v72->_contactCountingQuerySearchFrom start];
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v95, 8);
  id v9 = (void (**)(id, void))v61;
LABEL_49:
}

void __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) processFromContacts:*(void *)(a1 + 40) resultsFromMultiQuery:a2 contactsFrom:*(void *)(a1 + 48) processedContacts:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v5 = v4;
  if (!v4)
  {
LABEL_18:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_19;
  }
  if ([v4 count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = [*(id *)(*((void *)&v31 + 1) + 8 * v11) emailAddresses];
          [v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v9);
    }

    id v13 = [*(id *)(a1 + 32) queryContext];
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_774;
    v27[3] = &unk_1E5549008;
    __int16 v16 = *(void **)(a1 + 40);
    v27[4] = *(void *)(a1 + 32);
    id v28 = v16;
    id v29 = v7;
    long long v26 = *(_OWORD *)(a1 + 64);
    id v17 = (id)v26;
    long long v30 = v26;
    uint64_t v18 = +[_CSMultiQuery countingQueryForEmailsArrays:v6 scope:2 context:v13 contextualFilterQueries:v14 includeSecondaryRecipients:v15 completionHandler:v27];
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = *(void **)(v19 + 392);
    *(void *)(v19 + 392) = v18;

    [*(id *)(*(void *)(a1 + 32) + 392) start];
    goto LABEL_19;
  }
  uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
  uint64_t v22 = logForCSLogCategoryDefault();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (!v21)
  {
    if (v23) {
      __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_cold_1(v3);
    }

    goto LABEL_18;
  }
  if (v23) {
    __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_cold_2(v3);
  }

  uint64_t v24 = *(void *)(a1 + 64);
  uint64_t v25 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) copy];
  (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);

LABEL_19:
}

void __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_774(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) processToContacts:*(void *)(a1 + 40) resultsToMultiQuery:a2 contactsTo:*(void *)(a1 + 48) processedContacts:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)peopleSuggestionsWithContactSearchResults:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v30 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v3;
  uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v5 scope] == 2) {
          uint64_t v6 = &unk_1EDBD64A8;
        }
        else {
          uint64_t v6 = &unk_1EDBD6460;
        }
        if ([v5 sourceType]) {
          uint64_t v7 = 12;
        }
        else {
          uint64_t v7 = 4;
        }
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSString length](self->_searchString, "length"));
        v41[0] = v8;
        v41[1] = &unk_1EDBD64A8;
        v41[2] = &unk_1EDBD64C0;
        v41[3] = &unk_1EDBD64D8;
        v41[4] = &unk_1EDBD6BD8;
        v41[5] = &unk_1EDBD6BE8;
        v41[6] = &unk_1EDBD64A8;
        v41[7] = &unk_1EDBD64A8;
        v41[8] = &unk_1EDBD64A8;
        v41[9] = &unk_1EDBD64A8;
        v41[10] = &unk_1EDBD64A8;
        v41[11] = &unk_1EDBD64F0;
        v41[12] = &unk_1EDBD6BF8;
        v41[13] = &unk_1EDBD6C08;
        v41[14] = &unk_1EDBD6508;
        v41[15] = v6;
        uint64_t v9 = v5;
        v41[16] = &unk_1EDBD64A8;
        v41[17] = &unk_1EDBD6460;
        v41[18] = &unk_1EDBD64A8;
        v41[19] = &unk_1EDBD64A8;
        uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v7];
        v41[20] = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:21];

        int v12 = [CSSuggestion alloc];
        id v13 = [(CSUserQuery *)self queryContext];
        uint64_t v14 = [v13 userQuery];
        uint64_t v15 = [(CSUserQuery *)self queryContext];
        __int16 v16 = [v15 suggestion];
        id v17 = [v9 displayName];
        uint64_t v18 = (uint64_t)v17;
        if (!v17)
        {
          long long v32 = [v9 emailAddresses];
          uint64_t v18 = [v32 firstObject];
          long long v31 = (void *)v18;
        }
        uint64_t v36 = v9;
        uint64_t v19 = [v9 emailAddresses];
        int v20 = [(CSSuggestion *)v12 initWithUserString:v14 currentSuggestion:v16 displayString:v18 attributeValues:v11 attributeStrings:v19 options:MEMORY[0x1E4F1CC08]];

        if (!v17)
        {
        }
        uint64_t v21 = [(CSSuggestion *)v20 currentToken];
        [v21 setInternalType:4];

        uint64_t v22 = [(CSSuggestion *)v20 currentToken];
        [v22 setBundleType:1];

        BOOL v23 = [(CSSuggestion *)v20 currentToken];
        uint64_t v24 = [v23 itemSummary];

        if (v24)
        {
          uint64_t v25 = [(CSSuggestion *)v20 currentToken];
          long long v26 = [v25 itemSummary];
          uint64_t v27 = [v36 nameComponents];
          [v26 setNameComponents:v27];
        }
        if (v20) {
          [v30 addObject:v20];
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v35);
  }

  return v30;
}

- (void)handleSuggestions
{
  id v3 = [a1 queryContext];
  [v3 queryID];
  [a2 count];
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v4, v5, "[CSUserQuery][qid=%ld] returning %lu suggestions", v6, v7, v8, v9, 0);
}

- (void)handleInstantAnswers
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(CSUserQuery *)v2 foundInstantAnswers];
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v7 addObjectsFromArray:v4];
  }
  else
  {
    id v7 = 0;
  }

  objc_sync_exit(v2);
  uint64_t v5 = [(CSUserQuery *)v2 foundInstantAnswersHandler];
  uint64_t v6 = (void *)v5;
  if (v5 && v7) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
}

- (void)handleCompletion:(id)a3
{
  id v4 = a3;
  [(CSUserQuery *)self handleSuggestions];
  [(CSUserQuery *)self handleInstantAnswers];
  v5.receiver = self;
  v5.super_class = (Class)CSUserQuery;
  [(CSSearchQuery *)&v5 handleCompletion:v4];
}

- (void)handleQueryRewritten
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  obj->_queryRewritten = 1;
  objc_sync_exit(obj);
}

- (void)userEngagedWithItem:(id)a3 visibleItems:(id)a4 userInteractionType:(int64_t)a5
{
  if (!a5) {
    [(CSUserQuery *)self userEngagedWithResult:a3 visibleResults:a4 interactionType:8];
  }
}

- (void)userEngagedWithResult:(id)a3 visibleResults:(id)a4 interactionType:(int)a5
{
}

- (BOOL)queryRewritten
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL queryRewritten = v2->_queryRewritten;
  objc_sync_exit(v2);

  return queryRewritten;
}

- (void)willStartQuery
{
  [a1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] generating query", v3, v4, v5, v6, v7);
}

- (void)start
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(CSSearchQuery *)self queryString];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = 0;
    goto LABEL_18;
  }
  uint8_t v7 = [(CSUserQuery *)self queryContext];
  uint64_t v6 = [v7 normalizedSearchQuery];
  int v8 = [v7 live];
  if (v8)
  {
    uint64_t v2 = [v7 clientBundleID];
    if ([v2 isEqualToString:@"com.apple.mobilemail"])
    {

LABEL_10:
      uint64_t v11 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = [(CSUserQuery *)self queryContext];
        uint64_t v13 = [v12 queryID];
        uint64_t v14 = [(CSUserQuery *)self queryContext];
        id v15 = [v14 clientBundleID];
        *(_DWORD *)buf = 134218242;
        uint64_t v30 = v13;
        __int16 v31 = 2080;
        uint64_t v32 = [v15 UTF8String];
        _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_DEFAULT, "[CSUserQuery][qid=%ld] %s query is a live query; also disabling blocking on index here.",
          buf,
          0x16u);
      }
      [v7 setDisableBlockingOnIndex:1];
      goto LABEL_13;
    }
  }
  uint64_t v9 = [v7 clientBundleID];
  int v10 = [v9 isEqualToString:@"com.apple.mobileslideshow"];

  if (v8)
  {

    if (v10) {
      goto LABEL_10;
    }
  }
  else if (v10)
  {
    goto LABEL_10;
  }
LABEL_13:
  __int16 v16 = [(CSUserQuery *)self foundSuggestionsHandler];
  BOOL v17 = v16 && [v7 maxSuggestionCount];
  [v7 setGenerateSuggestions:v17];
  uint64_t v18 = [(CSUserQuery *)self foundInstantAnswersHandler];
  [v7 setEnableInstantAnswers:v18 != 0];
  [(CSSearchQuery *)self updateQueryContext:v7];

LABEL_18:
  uint64_t v19 = [(CSUserQuery *)self queryContext];
  if ([v19 isMail])
  {
    NSUInteger v20 = [(NSString *)self->_searchString length];

    if (v20) {
      goto LABEL_22;
    }
    uint64_t v19 = [(id)objc_opt_class() mailResources];
  }

LABEL_22:
  if (![v6 length])
  {
    uint64_t v21 = [(CSUserQuery *)self queryContext];
    uint64_t v22 = [v21 userQuery];
    uint64_t v23 = [v22 length];
    uint64_t v24 = [(CSUserQuery *)self queryContext];
    uint64_t v25 = v24;
    if (v23)
    {
      uint64_t v26 = [v24 userQuery];
    }
    else
    {
      uint64_t v27 = [v24 suggestion];
      uint64_t v26 = [v27 userQueryString];

      uint64_t v6 = v27;
    }

    uint64_t v6 = (void *)v26;
  }
  [(CSUserQuery *)self startContactSearchIfNeededWithSearchQuery:v6];
  v28.receiver = self;
  v28.super_class = (Class)CSUserQuery;
  [(CSSearchQuery *)&v28 start];
}

- (void)cancel
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GetCSUserQueryParser();
  int v12 = @"queryID";
  uint64_t v4 = NSNumber;
  uint64_t v5 = [(CSUserQuery *)self queryContext];
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "queryID"));
  v13[0] = v6;
  uint8_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v3 _CSUserQueryCancelQueryWithReferenceDict:v7];

  contactSearch = self->_contactSearch;
  if (contactSearch) {
    [(_CSContactSearch *)contactSearch cancel];
  }
  contactCountingQuerySearchFrounint64_t m = self->_contactCountingQuerySearchFrom;
  if (contactCountingQuerySearchFrom) {
    [(_CSMultiQuery *)contactCountingQuerySearchFrom cancel];
  }
  contactCountingQuerySearchTo = self->_contactCountingQuerySearchTo;
  if (contactCountingQuerySearchTo) {
    [(_CSMultiQuery *)contactCountingQuerySearchTo cancel];
  }
  v11.receiver = self;
  v11.super_class = (Class)CSUserQuery;
  [(CSSearchQuery *)&v11 cancel];
}

+ (id)normalizeAndTrimContacts:(id)a3 maxCount:(int64_t)a4
{
  unint64_t v27 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        objc_super v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "contactIdentifier", v27);

        if (v12)
        {
          uint64_t v13 = [v11 contactIdentifier];
          uint64_t v14 = [v5 objectForKey:v13];

          if (v14)
          {
            id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
            __int16 v16 = [v11 contactIdentifier];
            BOOL v17 = [v5 objectForKeyedSubscript:v16];
            uint64_t v18 = [v17 emailAddresses];
            uint64_t v19 = (void *)[v15 initWithArray:v18];

            NSUInteger v20 = [v11 emailAddresses];
            [v19 addObjectsFromArray:v20];

            uint64_t v21 = [v11 contactIdentifier];
            uint64_t v22 = [v5 objectForKeyedSubscript:v21];
            [v22 setEmailAddresses:v19];
          }
          else
          {
            [v6 addObject:v11];
            uint64_t v19 = [v11 contactIdentifier];
            [v5 setObject:v11 forKey:v19];
          }
        }
        else
        {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  unint64_t v23 = [v6 count];
  if (v23 >= v27) {
    unint64_t v24 = v27;
  }
  else {
    unint64_t v24 = v23;
  }
  uint64_t v25 = objc_msgSend(v6, "subarrayWithRange:", 0, v24, v27);

  return v25;
}

- (void)startContactSearchWithUserQuery:(id)a3 maxCount:(int64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = 10;
  if (a4) {
    int64_t v7 = a4;
  }
  objc_super v28 = (void *)v7;
  long long v29 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  val = v9;
  obuint64_t j = v9->_suggestions;
  uint64_t v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v45;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v44 + 1) + 8 * v34);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        objc_super v11 = objc_msgSend(v10, "currentToken", v28);
        int v12 = [v11 itemSummary];
        uint64_t v13 = [v12 emailAddresses];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v41;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v41 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * v16);
              uint64_t v18 = NSNumber;
              uint64_t v19 = [v10 currentToken];
              NSUInteger v20 = objc_msgSend(v18, "numberWithUnsignedLong:", objc_msgSend(v19, "selectedScope"));
              [v8 setObject:v20 forKeyedSubscript:v17];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v14);
        }

        ++v34;
      }
      while (v34 != v33);
      uint64_t v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v33);
  }

  objc_sync_exit(val);
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  objc_storeStrong((id *)&val->_contactSearchSemaphore, v21);
  val->_contactSearchSemaphoreWaitTime = dispatch_time(0, 350000000);
  uint64_t v22 = [_CSContactSearch alloc];
  unint64_t v23 = [(CSUserQuery *)val queryContext];
  uint64_t v24 = -[_CSContactSearch initWithQuery:queryID:autocompleteEnabled:](v22, "initWithQuery:queryID:autocompleteEnabled:", v29, [v23 queryID], 1);
  contactSearch = val->_contactSearch;
  val->_contactSearch = (_CSContactSearch *)v24;

  id location = 0;
  objc_initWeak(&location, val);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __56__CSUserQuery_startContactSearchWithUserQuery_maxCount___block_invoke;
  v35[3] = &unk_1E5549080;
  objc_copyWeak(v38, &location);
  uint64_t v26 = v21;
  uint64_t v36 = v26;
  v38[1] = v28;
  id v27 = v8;
  id v37 = v27;
  [(_CSContactSearch *)val->_contactSearch setCompletionHandler:v35];
  [(_CSContactSearch *)val->_contactSearch start];

  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
}

void __56__CSUserQuery_startContactSearchWithUserQuery_maxCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained isCancelled] & 1) != 0 || !objc_msgSend(v5, "count"))
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    else
    {
      uint64_t v9 = +[CSUserQuery normalizeAndTrimContacts:v5 maxCount:*(void *)(a1 + 56)];
      int v10 = (void *)[*(id *)(a1 + 40) copy];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__CSUserQuery_startContactSearchWithUserQuery_maxCount___block_invoke_2;
      v11[3] = &unk_1E5549058;
      objc_copyWeak(&v13, (id *)(a1 + 48));
      id v12 = *(id *)(a1 + 32);
      [v8 filterContactPeopleSuggestions:v9 cachedSuggestionsEmailToScope:v10 completionHandler:v11];

      objc_destroyWeak(&v13);
    }
  }
}

void __56__CSUserQuery_startContactSearchWithUserQuery_maxCount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    objc_sync_enter(v6);
    int64_t v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134217984;
      uint64_t v9 = [v3 count];
      _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_INFO, "[ContactSearch]: %lu available after contact filtering", (uint8_t *)&v8, 0xCu);
    }

    [v6 setContactSearchResults:v3];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    objc_sync_exit(v6);
  }
}

+ (id)generateFilterQueriesBasedOnPreviousSuggestions:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 filterQueries];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v6 = [v3 filterQueries];
    id v7 = (id)[v5 initWithArray:v6];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  int v8 = [v3 suggestion];
  uint64_t v9 = [v8 previousSuggestionTokens];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = objc_msgSend(v3, "suggestion", 0);
    id v13 = [v12 previousSuggestionTokens];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v19 = [v18 tokenQueryString];

          if (v19)
          {
            NSUInteger v20 = [v18 tokenQueryString];
            [v11 addObject:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    [v7 addObjectsFromArray:v11];
  }
  dispatch_semaphore_t v21 = (void *)[v7 copy];

  return v21;
}

- (void)startContactSearchIfNeededWithSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(CSUserQuery *)self queryContext];
  if (([v5 isMail] & 1) == 0) {
    goto LABEL_5;
  }
  id v6 = [(CSUserQuery *)self queryContext];
  int v7 = [v6 generateSuggestions];

  if (v7)
  {
    if ([v4 length])
    {
      id v5 = [(CSUserQuery *)self queryContext];
      -[CSUserQuery startContactSearchWithUserQuery:maxCount:](self, "startContactSearchWithUserQuery:maxCount:", v4, [v5 maxSuggestionCount]);
LABEL_5:

      goto LABEL_6;
    }
    int v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CSUserQuery startContactSearchIfNeededWithSearchQuery:]();
    }
  }
LABEL_6:
}

- (CSUserQuery)initWithSearchString:(id)a3 keyboardLanguage:(id)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  [v11 setKeyboardLanguage:v9];

  [v11 setFetchAttributes:v8];
  [v11 setUserQuery:v10];

  [v11 setLowPriority:0];
  id v12 = [(CSUserQuery *)self initWithQueryString:&stru_1EDBB3A50 context:v11];

  return v12;
}

- (CSUserQuery)initWithUserString:(id)a3 queryContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setUserQuery:v6];
  objc_msgSend(v7, "setGenerateSuggestions:", objc_msgSend(v7, "maxSuggestionCount") != 0);
  id v8 = [(CSUserQuery *)self queryStringWithQueryContext:v7 searchString:0 options:MEMORY[0x1E4F1CC08]];
  v12.receiver = self;
  v12.super_class = (Class)CSUserQuery;
  id v9 = [(CSSearchQuery *)&v12 initWithQueryString:v8 queryContext:v7];
  id v10 = v9;
  if (v9) {
    commonInit(v9, v7, v7, v6, 0);
  }

  return v10;
}

- (id)keyboardLanguage
{
  uint64_t v2 = [(CSUserQuery *)self queryContext];
  id v3 = [v2 keyboardLanguage];

  return v3;
}

- (void)setFilterQueries:(id)a3
{
  id v4 = a3;
  id v5 = [(CSUserQuery *)self queryContext];
  [v5 setFilterQueries:v4];
}

- (id)filterQueries
{
  uint64_t v2 = [(CSUserQuery *)self queryContext];
  id v3 = [v2 filterQueries];

  return v3;
}

- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CSUserQuery;
  [(CSSearchQuery *)&v4 userEngagedWithResult:a3 interactionType:*(void *)&a4];
}

- (void)prepareSearch
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CSUserQuery;
  [(CSSearchQuery *)&v17 prepareSearch];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(CSUserQuery *)self queryContext];
  objc_super v4 = [v3 fetchAttributes];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      if ([v9 isEqualToString:@"kMDItemDonatedEvent"]) {
        break;
      }
      if ([v9 isEqualToString:@"kMDQueryResultInstantAnswers"])
      {

        objc_super v4 = [(CSUserQuery *)self queryContext];
        id v10 = [v4 fetchAttributes];
        id v11 = [v10 arrayByAddingObject:@"kMDItemDonatedEvent"];
        objc_super v12 = [(CSUserQuery *)self queryContext];
        [v12 setFetchAttributes:v11];

        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)foundSuggestionsHandler
{
  return objc_getProperty(self, a2, 440, 1);
}

- (void)setFoundSuggestionsHandler:(void *)foundSuggestionsHandler
{
}

- (id)foundInstantAnswersHandler
{
  return objc_getProperty(self, a2, 448, 1);
}

- (void)setFoundInstantAnswersHandler:(id)a3
{
}

- (id)foundInstantAnswersHandlerOld
{
  return objc_getProperty(self, a2, 456, 1);
}

- (void)setFoundInstantAnswersHandlerOld:(id)a3
{
}

- (id)attributedQueryHandler
{
  return objc_getProperty(self, a2, 464, 1);
}

- (void)setAttributedQueryHandler:(id)a3
{
}

- (NSArray)contactSearchResults
{
  return self->_contactSearchResults;
}

- (void)setContactSearchResults:(id)a3
{
}

- (OS_dispatch_semaphore)contactSearchSemaphore
{
  return self->_contactSearchSemaphore;
}

- (unint64_t)contactSearchSemaphoreWaitTime
{
  return self->_contactSearchSemaphoreWaitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSearchSemaphore, 0);
  objc_storeStrong((id *)&self->_contactSearchResults, 0);
  objc_storeStrong(&self->_attributedQueryHandler, 0);
  objc_storeStrong(&self->_foundInstantAnswersHandlerOld, 0);
  objc_storeStrong(&self->_foundInstantAnswersHandler, 0);
  objc_storeStrong(&self->_foundSuggestionsHandler, 0);
  objc_storeStrong((id *)&self->_contactCountingQuerySearchTo, 0);
  objc_storeStrong((id *)&self->_contactCountingQuerySearchFrom, 0);
  objc_storeStrong((id *)&self->_contactSearch, 0);
  objc_storeStrong((id *)&self->_instantAnswers, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_templateSuggestions, 0);
  objc_storeStrong((id *)&self->_nlpSuggestions, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_parserOptions, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)handleFoundInstantAnswer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSUserQuery(CSInstantAnswer) handleFoundInstantAnswer:]();
  }

  uint64_t v6 = [(CSUserQuery *)self foundInstantAnswersHandlerOld];

  if (v6)
  {
    uint64_t v7 = [(CSUserQuery *)self foundInstantAnswersHandlerOld];
    ((void (**)(void, id))v7)[2](v7, v4);
  }
}

- (void)processInstantAnswersWithFoundItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CSUserQuery *)self foundInstantAnswersHandlerOld];

  if (v5)
  {
    objc_super v17 = self;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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
          objc_super v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) attributeSet];
          long long v13 = [v12 donatedEvent];

          if (v13)
          {
            long long v14 = [v13 type];
            int v15 = [v14 isEqualToString:@"flight"];

            if (v15)
            {
              long long v16 = [[CSInstantAnswer alloc] initWithEvent:v13];
              [v6 addObject:v16];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [(CSUserQuery *)v17 handleFoundInstantAnswer:v6];
  }
}

+ (id)trimSuggestions:(id)a3 options:(id)a4 peopleSelectedScope:(int64_t)a5 isShortQuery:(BOOL)a6
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v88 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9)
  {
    uint64_t v10 = [v9 objectForKeyedSubscript:@"maxCount"];
    if (v10)
    {
      id v11 = [v9 objectForKeyedSubscript:@"maxCount"];
      unint64_t v12 = (int)[v11 intValue];
    }
    else
    {
      unint64_t v12 = 5;
    }
  }
  else
  {
    unint64_t v12 = 5;
  }
  id v81 = v9;
  id v82 = v8;
  if ([v8 count] && objc_msgSend(v8, "count") > v12)
  {
    unint64_t v80 = v12;
    id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v87 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v85 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v90 objects:v98 count:16];
    if (!v14) {
      goto LABEL_35;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v91;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v91 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        long long v19 = objc_msgSend(v18, "suggestionTokens", v80);
        long long v20 = [v19 lastObject];
        uint64_t v21 = [v20 tokenKind];

        uint64_t v22 = [v18 suggestionTokens];
        uint64_t v23 = [v22 lastObject];
        uint64_t v24 = [v23 internalType];

        long long v25 = [v18 currentToken];
        LODWORD(v23) = [v25 isMailingList];

        if (!v23 || !a6)
        {
          long long v26 = [v18 currentToken];
          [v26 megadomeCompositeScore];
          if (v27 == 0.0)
          {
          }
          else
          {
            uint64_t v28 = [v18 currentToken];
            [v28 megadomeCompositeScore];
            double v30 = v29;

            if (v30 <= 0.000001) {
              continue;
            }
          }
          if ((a5 & 0x8000000000000000) == 0 && v21 == 16)
          {
            long long v31 = [v18 suggestionTokens];
            uint64_t v32 = [v31 lastObject];
            [v32 updateScopeSelection:a5];
          }
          id v33 = v87;
          if (v21 != 16) {
            id v33 = v86;
          }
          if (v24 != 6) {
            id v33 = v84;
          }
          if (v24 == 4) {
            id v33 = v83;
          }
          if (v24 == 3) {
            uint64_t v34 = v85;
          }
          else {
            uint64_t v34 = v33;
          }
          [v34 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v90 objects:v98 count:16];
      if (!v15)
      {
LABEL_35:

        int v35 = _os_feature_enabled_impl();
        unint64_t v36 = [v83 count];
        unint64_t v37 = v80;
        if (v36 >= v80) {
          unint64_t v38 = v80;
        }
        else {
          unint64_t v38 = v36;
        }
        if (v35)
        {
          long long v39 = objc_msgSend(v83, "subarrayWithRange:", 0, v38);
          long long v40 = (void *)[v39 mutableCopy];

          unint64_t v41 = [v87 count];
          if (v41 >= v80) {
            unint64_t v42 = v80;
          }
          else {
            unint64_t v42 = v41;
          }
          long long v43 = objc_msgSend(v87, "subarrayWithRange:", 0, v42, v80);
          [v40 addObjectsFromArray:v43];

          [v40 sortUsingSelector:sel_compareByRank_];
          long long v44 = v88;
        }
        else
        {
          [v83 sortUsingSelector:sel_compareByRank_];
          uint64_t v66 = objc_msgSend(v83, "subarrayWithRange:", 0, v38);
          long long v44 = v88;
          [v88 addObjectsFromArray:v66];

          unint64_t v67 = [v87 count];
          if (v67 >= v80) {
            unint64_t v68 = v80;
          }
          else {
            unint64_t v68 = v67;
          }
          objc_msgSend(v87, "sortUsingSelector:", sel_compareByRank_, v80);
          long long v40 = objc_msgSend(v87, "subarrayWithRange:", 0, v68);
        }
        uint64_t v64 = v81;
        uint64_t v65 = v82;
        [v44 addObjectsFromArray:v40];

        unint64_t v69 = [v86 count];
        if (v69 >= v37) {
          unint64_t v70 = v37;
        }
        else {
          unint64_t v70 = v69;
        }
        [v86 sortUsingSelector:sel_compareByRank_];
        id v71 = objc_msgSend(v86, "subarrayWithRange:", 0, v70);
        [v44 addObjectsFromArray:v71];

        unint64_t v72 = [v85 count];
        if (v72 >= v37) {
          unint64_t v73 = v37;
        }
        else {
          unint64_t v73 = v72;
        }
        [v85 sortUsingSelector:sel_compareByRank_];
        uint64_t v74 = objc_msgSend(v85, "subarrayWithRange:", 0, v73);
        [v44 addObjectsFromArray:v74];

        unint64_t v75 = [v84 count];
        if (v75 >= v37) {
          unint64_t v76 = v37;
        }
        else {
          unint64_t v76 = v75;
        }
        [v84 sortUsingSelector:sel_compareByRank_];
        id v77 = objc_msgSend(v84, "subarrayWithRange:", 0, v76);
        [v44 addObjectsFromArray:v77];

        id v78 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
          +[CSUserQuery(CSSuggestionBlending) trimSuggestions:options:peopleSelectedScope:isShortQuery:](v44);
        }

        goto LABEL_80;
      }
    }
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v45 = v8;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v94 objects:v99 count:16];
  if (!v46) {
    goto LABEL_62;
  }
  uint64_t v47 = v46;
  uint64_t v48 = *(void *)v95;
  do
  {
    for (uint64_t j = 0; j != v47; ++j)
    {
      if (*(void *)v95 != v48) {
        objc_enumerationMutation(v45);
      }
      uint64_t v50 = *(void **)(*((void *)&v94 + 1) + 8 * j);
      uint64_t v51 = [v50 suggestionTokens];
      unint64_t v52 = [v51 lastObject];
      uint64_t v53 = [v52 internalType];

      v54 = [v50 suggestionTokens];
      char v55 = [v54 lastObject];
      uint64_t v56 = [v55 tokenKind];

      id v57 = [v50 currentToken];
      LODWORD(v55) = [v57 isMailingList];

      if (!v55 || !a6)
      {
        id v58 = [v50 currentToken];
        if ([v58 isMegadomeToken])
        {
          uint64_t v59 = [v50 currentToken];
          [v59 megadomeCompositeScore];
          double v61 = v60;

          if (v61 <= 0.000001) {
            continue;
          }
        }
        else
        {
        }
        if ((a5 & 0x8000000000000000) == 0 && v56 == 16 && (v53 == 6 || v53 == 3))
        {
          uint64_t v62 = [v50 suggestionTokens];
          uint64_t v63 = [v62 lastObject];
          [v63 updateScopeSelection:a5];
        }
        [v88 addObject:v50];
      }
    }
    uint64_t v47 = [v45 countByEnumeratingWithState:&v94 objects:v99 count:16];
  }
  while (v47);
LABEL_62:

  uint64_t v64 = v81;
  uint64_t v65 = v82;
  long long v44 = v88;
  if (_os_feature_enabled_impl()) {
    [v88 sortUsingSelector:sel_compareByRank_];
  }
LABEL_80:

  return v44;
}

+ (id)dedupSuggestions:(id)a3 queryContextScopeIsToPerson:(BOOL)a4 seenContactInfoToSuggestion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v7;
  uint64_t v62 = [obj countByEnumeratingWithState:&v70 objects:v87 count:16];
  if (v62)
  {
    uint64_t v61 = *(void *)v71;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v71 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v70 + 1) + 8 * v9);
        id v11 = [v10 currentToken];
        unint64_t v12 = [v11 itemSummary];
        id v13 = [v12 name];
        uint64_t v14 = [v13 lowercaseString];

        uint64_t v64 = v14;
        uint64_t v65 = v9;
        if ([v14 length])
        {
          uint64_t v15 = [v8 objectForKeyedSubscript:v14];
          id v16 = v15;
          if (v15)
          {
            [v15 mergeSuggestionAndUpdateLocalizedAttributedString:v10 queryContextScopeIsToPerson:v6];
            id v17 = v16;
          }
        }
        else
        {
          id v16 = 0;
        }
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v18 = [v10 currentToken];
        long long v19 = [v18 itemSummary];
        long long v20 = [v19 allEmailAddresses];

        uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v86 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v67 != v23) {
                objc_enumerationMutation(v20);
              }
              if (!v16)
              {
                long long v25 = [*(id *)(*((void *)&v66 + 1) + 8 * i) lowercaseString];
                id v16 = [v8 objectForKey:v25];

                if (v16)
                {
                  [v16 mergeSuggestionAndUpdateLocalizedAttributedString:v10 queryContextScopeIsToPerson:v6];
                  id v26 = v16;
                }
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v66 objects:v86 count:16];
          }
          while (v22);
        }

        if (!v16)
        {
          id v16 = v10;
          [v59 addObject:v16];
        }
        id v27 = v8;
        id v28 = v10;
        id v29 = v16;
        double v30 = [v28 currentToken];
        long long v31 = [v30 itemSummary];
        uint64_t v32 = [v31 name];
        id v33 = [v32 lowercaseString];

        if ([v33 length]) {
          [v27 setObject:v29 forKeyedSubscript:v33];
        }
        uint64_t v63 = v33;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        uint64_t v34 = [v28 currentToken];
        int v35 = [v34 itemSummary];
        unint64_t v36 = [v35 allEmailAddresses];

        uint64_t v37 = [v36 countByEnumeratingWithState:&v82 objects:v90 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v83 != v39) {
                objc_enumerationMutation(v36);
              }
              unint64_t v41 = [*(id *)(*((void *)&v82 + 1) + 8 * j) lowercaseString];
              [v27 setObject:v29 forKeyedSubscript:v41];
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v82 objects:v90 count:16];
          }
          while (v38);
        }

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        unint64_t v42 = [v28 currentToken];
        long long v43 = [v42 itemSummary];
        long long v44 = [v43 alternateNames];

        uint64_t v45 = [v44 countByEnumeratingWithState:&v78 objects:v89 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v79;
          do
          {
            for (uint64_t k = 0; k != v46; ++k)
            {
              if (*(void *)v79 != v47) {
                objc_enumerationMutation(v44);
              }
              __int16 v49 = [*(id *)(*((void *)&v78 + 1) + 8 * k) lowercaseString];
              [v27 setObject:v29 forKeyedSubscript:v49];
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v78 objects:v89 count:16];
          }
          while (v46);
        }

        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v50 = [v28 currentToken];
        uint64_t v51 = [v50 itemSummary];
        unint64_t v52 = [v51 phoneNumbers];

        uint64_t v53 = [v52 countByEnumeratingWithState:&v74 objects:v88 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v75;
          do
          {
            for (uint64_t m = 0; m != v54; ++m)
            {
              if (*(void *)v75 != v55) {
                objc_enumerationMutation(v52);
              }
              id v57 = [*(id *)(*((void *)&v74 + 1) + 8 * m) lowercaseString];
              [v27 setObject:v29 forKeyedSubscript:v57];
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v74 objects:v88 count:16];
          }
          while (v54);
        }

        uint64_t v9 = v65 + 1;
      }
      while (v65 + 1 != v62);
      uint64_t v62 = [obj countByEnumeratingWithState:&v70 objects:v87 count:16];
    }
    while (v62);
  }

  return v59;
}

+ (id)suggestionsByDetectingEmailIntentForPeopleSuggestions:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];

  return v3;
}

+ (id)dedupedDateSuggestions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v8 suggestionTokens];
        uint64_t v10 = [v9 lastObject];
        uint64_t v11 = [v10 tokenKind];

        uint64_t v16 = 0;
        id v17 = &v16;
        uint64_t v18 = 0x2020000000;
        char v19 = 0;
        if (v11 != 5
          || (v15[0] = MEMORY[0x1E4F143A8],
              v15[1] = 3221225472,
              v15[2] = __60__CSUserQuery_CSSuggestionBlending__dedupedDateSuggestions___block_invoke,
              v15[3] = &unk_1E554C9A8,
              v15[4] = v8,
              v15[5] = &v16,
              [v4 enumerateObjectsUsingBlock:v15],
              !*((unsigned char *)v17 + 24)))
        {
          [v4 addObject:v8];
          [v14 addObject:v8];
        }
        _Block_object_dispose(&v16, 8);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  return v14;
}

void __60__CSUserQuery_CSSuggestionBlending__dedupedDateSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 suggestionTokens];
  id v7 = [v6 lastObject];
  id v8 = [v7 displayString];
  uint64_t v9 = [*(id *)(a1 + 32) suggestionTokens];
  uint64_t v10 = [v9 lastObject];
  uint64_t v11 = [v10 displayString];
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)dedupedSuggestions:(id)a3 options:(id)a4
{
  return +[CSUserQuery dedupedSuggestions:a3 queryContextScopeIsToPerson:0 options:a4];
}

+ (id)dedupedSuggestions:(id)a3 queryContextScopeIsToPerson:(BOOL)a4 options:(id)a5
{
  BOOL v53 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  uint64_t v54 = v7;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = [v7 objectForKeyedSubscript:@"filterByCount"];
    if (v9)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"filterByCount"];
      char v11 = [v10 BOOLValue] ^ 1;
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 1;
  }
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v6;
  uint64_t v13 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v61;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v61 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v60 + 1) + 8 * v16);
        uint64_t v18 = [v17 suggestionTokens];
        char v19 = [v18 lastObject];
        uint64_t v20 = [v19 tokenKind];

        long long v21 = [v17 suggestionTokens];
        long long v22 = [v21 lastObject];
        uint64_t v23 = [v22 internalType];

        if ((v11 & 1) != 0 || [v17 resultCount])
        {
          uint64_t v24 = v59;
          if (v23 == 3) {
            goto LABEL_21;
          }
          if (v23 != 4)
          {
            id v25 = v57;
            if (v20 != 16) {
              id v25 = v12;
            }
            if (v23 == 6) {
              uint64_t v24 = v25;
            }
            else {
              uint64_t v24 = v12;
            }
            goto LABEL_21;
          }
          id v26 = [v17 currentToken];
          uint64_t v27 = [v26 bundleType];

          if (v27 == 1)
          {
            id v28 = [v17 currentToken];
            int v29 = [v28 isMegadomeToken];

            if (v29) {
              uint64_t v24 = v56;
            }
            else {
              uint64_t v24 = v55;
            }
LABEL_21:
            [v24 addObject:v17];
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v30 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
      uint64_t v14 = v30;
    }
    while (v30);
  }

  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (_os_feature_enabled_impl())
  {
    id v33 = +[CSUserQuery dedupSuggestions:v55 queryContextScopeIsToPerson:v53 seenContactInfoToSuggestion:v31];

    uint64_t v34 = +[CSUserQuery dedupSuggestions:v57 queryContextScopeIsToPerson:v53 seenContactInfoToSuggestion:v31];

    uint64_t v35 = +[CSUserQuery dedupSuggestions:v56 queryContextScopeIsToPerson:v53 seenContactInfoToSuggestion:v31];

    unint64_t v36 = [v33 arrayByAddingObjectsFromArray:v34];
    uint64_t v37 = [v36 arrayByAddingObjectsFromArray:v35];

    uint64_t v38 = [v37 sortedArrayUsingSelector:sel_compareByRank_];

    uint64_t v39 = [v12 sortedArrayUsingSelector:sel_compareByRank_];
    long long v40 = (void *)[v39 mutableCopy];

    unint64_t v41 = +[CSUserQuery dedupSuggestions:v40 queryContextScopeIsToPerson:v53 seenContactInfoToSuggestion:v31];

    [v32 addObjectsFromArray:v59];
    [v32 addObjectsFromArray:v38];

    id v56 = (id)v35;
    unint64_t v42 = 0x1E5547000;
  }
  else
  {
    long long v43 = [v55 sortedArrayUsingSelector:sel_compareByRank_];
    long long v44 = (void *)[v43 mutableCopy];

    uint64_t v45 = +[CSUserQuery dedupSuggestions:v44 queryContextScopeIsToPerson:v53 seenContactInfoToSuggestion:v31];

    uint64_t v46 = [v57 sortedArrayUsingSelector:sel_compareByRank_];
    uint64_t v47 = (void *)[v46 mutableCopy];

    id v33 = (void *)v45;
    unint64_t v42 = 0x1E5547000uLL;

    uint64_t v34 = +[CSUserQuery dedupSuggestions:v47 queryContextScopeIsToPerson:v53 seenContactInfoToSuggestion:v31];

    uint64_t v48 = [v12 sortedArrayUsingSelector:sel_compareByRank_];
    __int16 v49 = (void *)[v48 mutableCopy];

    unint64_t v41 = +[CSUserQuery dedupSuggestions:v49 queryContextScopeIsToPerson:v53 seenContactInfoToSuggestion:v31];

    [v32 addObjectsFromArray:v59];
    [v32 addObjectsFromArray:v33];
    [v32 addObjectsFromArray:v34];
  }
  [v32 addObjectsFromArray:v41];
  uint64_t v50 = [*(id *)(v42 + 3968) suggestionsByDetectingEmailIntentForPeopleSuggestions:v32];

  uint64_t v51 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
    +[CSUserQuery(CSSuggestionBlending) dedupedSuggestions:queryContextScopeIsToPerson:options:](v50);
  }

  return v50;
}

+ (id)orderedSuggestionsForPhotos:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"maxCount"];
    if (v8)
    {
      uint64_t v9 = [v7 objectForKeyedSubscript:@"maxCount"];
      unint64_t v10 = (int)[v9 intValue];
    }
    else
    {
      unint64_t v10 = 5;
    }
  }
  else
  {
    unint64_t v10 = 5;
  }
  char v11 = +[CSUserQuery orderedSuggestions:v5 options:v7];
  unint64_t v12 = [v11 count];
  if (v10 >= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v10;
  }
  uint64_t v14 = objc_msgSend(v11, "subarrayWithRange:", 0, v13);

  return v14;
}

+ (id)collectUnigrams:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = [v6 localeIdentifier];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __60__CSUserQuery_CSSuggestionBlending__collectUnigrams_locale___block_invoke;
    uint64_t v18 = &unk_1E554C9D0;
    id v9 = v7;
    id v19 = v9;
    +[CSAttributeEvaluator enumerateTokensForString:v5 locale:v8 options:0 withHandler:&v15];

    if ([v9 count])
    {
      unint64_t v10 = NSString;
      char v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
      unint64_t v12 = [v10 stringWithFormat:@"%@*", v11, v15, v16, v17, v18];
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v12, objc_msgSend(v9, "count") - 1);

      unint64_t v13 = (void *)[v9 copy];
    }
    else
    {
      unint64_t v13 = 0;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

uint64_t __60__CSUserQuery_CSSuggestionBlending__collectUnigrams_locale___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)emailSpecialChars
{
  if (emailSpecialChars_onceToken != -1) {
    dispatch_once(&emailSpecialChars_onceToken, &__block_literal_global_28);
  }
  uint64_t v2 = (void *)emailSpecialChars_specialChars;

  return v2;
}

uint64_t __54__CSUserQuery_CSSuggestionBlending__emailSpecialChars__block_invoke()
{
  emailSpecialChars_specialChars = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDBD6220];

  return MEMORY[0x1F41817F8]();
}

+ (id)computeEmailAddressTopicalityScore:(id)a3 inputEmailAddress:(id)a4 queryUnigrams:(id)a5 locale:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (![v9 length] || !objc_msgSend(v10, "length"))
  {
    uint64_t v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CSUserQuery(CSSuggestionBlending) computeEmailAddressTopicalityScore:inputEmailAddress:queryUnigrams:locale:](v14);
    }
    goto LABEL_8;
  }
  uint64_t v13 = [v10 rangeOfString:@"@" options:4];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CSUserQuery(CSSuggestionBlending) computeEmailAddressTopicalityScore:inputEmailAddress:queryUnigrams:locale:](v14);
    }
LABEL_8:

    uint64_t v15 = 0;
    goto LABEL_9;
  }
  unint64_t v17 = v13;
  unint64_t v18 = [v10 length] - 1;
  while (1)
  {
    unint64_t v19 = 0;
    if (!v18 || v18 < v17) {
      break;
    }
    int v20 = [v10 characterAtIndex:v18--];
    if (v20 == 46)
    {
      unint64_t v19 = v18 + 1;
      break;
    }
  }
  double v21 = 0.0;
  if ([v11 count])
  {
    char v39 = 0;
    char v38 = 0;
    unint64_t v22 = 0;
    id v40 = v12;
    unint64_t v41 = 0;
    do
    {
      uint64_t v23 = +[CSUserQuery emailSpecialChars];
      uint64_t v24 = [v11 objectAtIndexedSubscript:v22];
      char v25 = [v23 containsObject:v24];

      if ((v25 & 1) == 0)
      {
        id v26 = [v11 objectAtIndexedSubscript:v22];
        uint64_t v27 = [v26 UTF8String];
        id v28 = [v12 localeIdentifier];
        [v28 UTF8String];
        if (v27)
        {
          uint64_t v29 = icu_search_context_create();

          if (v29)
          {
            if (v41 >= [v10 length])
            {
              icu_ctx_release();
              id v12 = v40;
            }
            else
            {
              id v30 = [v10 substringFromIndex:v41];
              [v30 UTF8String];
              int v31 = icu_search_match();

              if (v31)
              {
                if (v41 > v17)
                {
                  if (v19) {
                    BOOL v32 = v41 > v19;
                  }
                  else {
                    BOOL v32 = 0;
                  }
                  char v33 = v32;
                  char v38 = v33;
                  char v39 = 1;
                }
                ++v41;
              }
              id v12 = v40;
              icu_ctx_release();
            }
          }
        }
        else
        {
        }
      }
      ++v22;
    }
    while (v22 < [v11 count]);
    double v21 = 0.0;
    if (v39)
    {
      double v34 = fmin((double)0 / (double)([v10 length] + ~v17), 1.0);
      if ((v38 & 1) != 0 && (unint64_t)[v9 length] <= 3)
      {
        uint64_t v35 = [v10 substringFromIndex:v19 + 1];
        int v36 = [v35 isEqualToString:@".com"];

        if (v36) {
          double v37 = 0.005;
        }
        else {
          double v37 = 0.05;
        }
      }
      else
      {
        double v37 = 0.8;
      }
      double v21 = v34 * v37;
    }
  }
  uint64_t v15 = [NSNumber numberWithDouble:v21 + 0.0];
LABEL_9:

  return v15;
}

+ (double)computeTopicalityScoreForName:(id)a3 inputName:(id)a4 numTokensInName:(unint64_t)a5 isContactsSuggestion:(BOOL)a6 queryUnigrams:(id)a7 isFirstName:(BOOL)a8 locale:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  double v18 = 0.0;
  if (![v14 length]) {
    goto LABEL_33;
  }
  uint64_t v19 = [v15 length];
  if (!a5 || !v19) {
    goto LABEL_33;
  }
  id v36 = [NSString stringWithFormat:@"%@*", v14];
  uint64_t v20 = [v36 UTF8String];
  id v21 = [v17 localeIdentifier];
  [v21 UTF8String];
  if (v20)
  {
    uint64_t v22 = icu_search_context_create();

    if (v22)
    {
      [v15 UTF8String];
      char v35 = icu_search_match();
      icu_ctx_release();
    }
    else
    {
      char v35 = 0;
    }
  }
  else
  {

    char v35 = 0;
  }
  BOOL v37 = v9;
  BOOL v34 = a6;
  if ([v16 count])
  {
    unint64_t v23 = 0;
    int v24 = 0;
    do
    {
      id v25 = [v16 objectAtIndexedSubscript:v23];
      uint64_t v26 = [v25 UTF8String];
      id v27 = [v17 localeIdentifier];
      [v27 UTF8String];
      if (v26)
      {
        uint64_t v28 = icu_search_context_create();

        if (v28)
        {
          [v15 UTF8String];
          v24 += icu_search_match();
          icu_ctx_release();
        }
      }
      else
      {
      }
      ++v23;
    }
    while (v23 < [v16 count]);
  }
  else
  {
    int v24 = 0;
  }
  if (v35)
  {
    double v18 = 1.0;
    if ([v16 count] == a5)
    {
      BOOL v29 = v37;
      id v30 = v36;
      if (v34 || (unint64_t)[v14 length] >= 4)
      {
        if ([v15 length]) {
          double v18 = 2.0;
        }
        else {
          double v18 = 2.1;
        }
      }
      goto LABEL_30;
    }
  }
  else
  {
    unint64_t v31 = [v16 count];
    if (v31 <= a5) {
      unint64_t v32 = a5;
    }
    else {
      unint64_t v32 = v31;
    }
    double v18 = (double)v24 / (double)v32;
  }
  BOOL v29 = v37;
  id v30 = v36;
LABEL_30:
  if (v29) {
    double v18 = v18 * 1.05;
  }

LABEL_33:
  return v18;
}

+ (double)computeScoreForNameUnigrams:(id)a3 queryUnigrams:(id)a4 queryString:(id)a5 locale:(id)a6 isContactsSuggestion:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (![v11 count])
  {
    double v19 = 0.0;
    goto LABEL_17;
  }
  id v15 = [v11 objectAtIndexedSubscript:0];
  if (computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__onceToken != -1)
  {
    dispatch_once(&computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__onceToken, &__block_literal_global_64);
    if (v14) {
      goto LABEL_4;
    }
LABEL_7:
    char v18 = 1;
    goto LABEL_8;
  }
  if (!v14) {
    goto LABEL_7;
  }
LABEL_4:
  id v16 = (void *)computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__cjkLocales;
  id v17 = [v14 languageCode];
  char v18 = [v16 containsObject:v17] ^ 1;

LABEL_8:
  +[CSUserQuery computeTopicalityScoreForName:v13 inputName:v15 numTokensInName:1 isContactsSuggestion:v7 queryUnigrams:v12 isFirstName:1 locale:v14];
  double v19 = v20;
  if ([v11 count] != 1)
  {
    id v21 = objc_msgSend(v11, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
    uint64_t v22 = [v21 componentsJoinedByString:@" "];

    +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v13, v22, [v11 count] - 1, v7, v12, 0, v14);
    if (v19 < v23) {
      double v19 = v23;
    }
    if ((v18 & 1) == 0)
    {
      int v24 = objc_msgSend(v11, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
      uint64_t v25 = [v24 componentsJoinedByString:&stru_1EDBB3A50];

      +[CSUserQuery computeTopicalityScoreForName:v13 inputName:v25 numTokensInName:1 isContactsSuggestion:v7 queryUnigrams:v12 isFirstName:0 locale:v14];
      if (v19 < v26) {
        double v19 = v26;
      }
      uint64_t v22 = (void *)v25;
    }
  }
LABEL_17:

  return v19;
}

uint64_t __119__CSUserQuery_CSSuggestionBlending__computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion___block_invoke()
{
  computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__cjkLocales = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDBD6238];

  return MEMORY[0x1F41817F8]();
}

+ (id)computeRankingScoreForSuggestion:(id)a3 queryString:(id)a4 locale:(id)a5
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [a3 currentToken];
  unint64_t v10 = 0x1E5547000uLL;
  uint64_t v136 = v8;
  id v135 = +[CSUserQuery collectUnigrams:v7 locale:v8];
  if (![v135 count])
  {
    double v26 = 0;
    goto LABEL_115;
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v134 = v9;
  id v11 = [v9 itemSummary];
  id v12 = [v11 allEmailAddresses];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v141 objects:v178 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v142;
    double v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v142 != v16) {
          objc_enumerationMutation(v12);
        }
        double v19 = *(void **)(*((void *)&v141 + 1) + 8 * i);
        double v20 = [*(id *)(v10 + 3968) computeEmailAddressTopicalityScore:v7 inputEmailAddress:v19 queryUnigrams:v135 locale:v136];
        id v21 = v20;
        if (v20)
        {
          [v20 doubleValue];
          if (v17 < v22) {
            double v17 = v22;
          }
          if (v15)
          {
            char v23 = 0;
          }
          else
          {
            int v24 = [v134 itemSummary];
            uint64_t v25 = [v24 name];
            char v23 = [v19 isEqualToString:v25];

            unint64_t v10 = 0x1E5547000;
          }
          v15 |= v23;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v141 objects:v178 count:16];
    }
    while (v14);
  }
  else
  {
    char v15 = 0;
    double v17 = 0.0;
  }

  id v27 = v134;
  if ([v134 suggestionTokenDataSources]
    && [v134 suggestionTokenDataSources])
  {
    uint64_t v28 = ([v134 suggestionTokenDataSources] >> 1) & 1;
    BOOL v131 = [v134 suggestionTokenDataSources] & 1;
    unsigned int v29 = ([v134 suggestionTokenDataSources] >> 2) & 1;
  }
  else
  {
    if ([v134 internalType] == 4 && objc_msgSend(v134, "bundleType") == 1) {
      uint64_t v28 = [v134 isMegadomeToken] ^ 1;
    }
    else {
      uint64_t v28 = 0;
    }
    BOOL v131 = [v134 internalType] == 6 && objc_msgSend(v134, "tokenKind") == 16;
    unsigned int v29 = [v134 isMegadomeToken];
  }
  double v30 = 0.0;
  unsigned int v130 = v28;
  if ((v15 & 1) == 0)
  {
    unint64_t v31 = *(void **)(v10 + 3968);
    unint64_t v32 = [v134 itemSummary];
    char v33 = [v32 name];
    BOOL v34 = [v31 collectUnigrams:v33 locale:v136];

    char v35 = *(void **)(v10 + 3968);
    id v36 = [v134 itemSummary];
    BOOL v37 = [v36 name];
    objc_msgSend(v35, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v7, v37, objc_msgSend(v34, "count"), v28, v135, 0, v136);
    double v30 = v38;

    uint64_t v39 = [v134 itemSummary];
    if (!v39) {
      goto LABEL_36;
    }
    id v40 = (void *)v39;
    unint64_t v41 = [v134 itemSummary];
    unint64_t v42 = [v41 nameComponents];

    if (!v42)
    {
LABEL_36:
      uint64_t v50 = *(void **)(v10 + 3968);
      uint64_t v28 = [v134 itemSummary];
      uint64_t v51 = [(id)v28 name];
      unint64_t v52 = [v50 collectUnigrams:v51 locale:v136];

      LODWORD(v28) = v130;
      [*(id *)(v10 + 3968) computeScoreForNameUnigrams:v52 queryUnigrams:v135 queryString:v7 locale:v136 isContactsSuggestion:v130];
      if (v30 < v53) {
        double v30 = v53;
      }
      goto LABEL_48;
    }
    long long v43 = [v134 itemSummary];
    long long v44 = [v43 nameComponents];
    uint64_t v45 = [v44 givenName];
    uint64_t v46 = [v45 length];

    if (!v46)
    {
LABEL_49:

      goto LABEL_50;
    }
    uint64_t v47 = [v134 itemSummary];
    uint64_t v48 = [v47 nameComponents];
    __int16 v49 = [v48 middleName];
    v128 = v34;
    if ([v49 length])
    {
    }
    else
    {
      uint64_t v54 = [v134 itemSummary];
      id v55 = [v54 nameComponents];
      id v56 = [v55 familyName];
      uint64_t v57 = [v56 length];

      id v27 = v134;
      if (!v57)
      {
        uint64_t v28 = [v134 itemSummary];
        v116 = [(id)v28 nameComponents];
        uint64_t v117 = [v116 givenName];
        unint64_t v52 = +[CSUserQuery collectUnigrams:v117 locale:v136];

        LODWORD(v28) = v130;
        +[CSUserQuery computeScoreForNameUnigrams:v52 queryUnigrams:v135 queryString:v7 locale:v136 isContactsSuggestion:v130];
        if (v30 < v118) {
          double v30 = v118;
        }
        goto LABEL_47;
      }
    }
    id v58 = [v27 itemSummary];
    id v59 = [v58 nameComponents];
    long long v60 = [v59 givenName];
    unint64_t v52 = +[CSUserQuery collectUnigrams:v60 locale:v136];

    long long v61 = [v27 itemSummary];
    long long v62 = [v61 nameComponents];
    long long v63 = [v62 middleName];
    uint64_t v132 = +[CSUserQuery collectUnigrams:v63 locale:v136];

    uint64_t v64 = [v27 itemSummary];
    uint64_t v65 = [v64 nameComponents];
    long long v66 = [v65 familyName];
    BOOL v126 = +[CSUserQuery collectUnigrams:v66 locale:v136];

    long long v67 = [v27 itemSummary];
    long long v68 = [v67 nameComponents];
    long long v69 = [v68 givenName];
    +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v7, v69, [v52 count], v130, v135, 1, v136);
    double v71 = v70;

    if (v30 >= v71) {
      double v71 = v30;
    }
    long long v72 = [v27 itemSummary];
    long long v73 = [v72 nameComponents];
    long long v74 = [v73 middleName];
    +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v7, v74, [v132 count], v130, v135, 0, v136);
    double v76 = v75;

    if (v71 < v76) {
      double v71 = v76;
    }
    uint64_t v28 = [v134 itemSummary];
    long long v77 = [(id)v28 nameComponents];
    long long v78 = [v77 familyName];
    +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v7, v78, [v126 count], v130, v135, 0, v136);
    double v30 = v79;

    LODWORD(v28) = v130;
    if (v71 >= v30) {
      double v30 = v71;
    }

LABEL_47:
    BOOL v34 = v128;
LABEL_48:

    id v27 = v134;
    goto LABEL_49;
  }
LABEL_50:
  uint64_t v129 = [v27 selectedScope];
  if (v129)
  {
    double v80 = v30 * 0.35;
    double v81 = 0.15;
  }
  else
  {
    double v80 = v30 * 0.7;
    double v81 = 0.3;
  }
  double v82 = v17 * v81;
  if (v80 >= v82) {
    double v83 = v80;
  }
  else {
    double v83 = v82;
  }
  double v84 = v83 * 4.0;
  if (v131) {
    double v84 = v83 * 4.0 + 0.15;
  }
  if (v28) {
    double v85 = v84 + 0.5;
  }
  else {
    double v85 = v84;
  }
  if (v29)
  {
    [v27 megadomeCompositeScore];
    if (v86 > 0.000001)
    {
      [v27 megadomeCompositeScore];
      double v85 = v85 + v87 * 0.1;
      if ([v27 isMailingList]) {
        double v85 = v85 * 0.01;
      }
    }
  }
  if ([v27 hasRecentActivity]) {
    double v85 = v85 + 0.5;
  }
  if ([v27 hasUsedDate]) {
    double v88 = v85 + 0.5;
  }
  else {
    double v88 = v85;
  }
  [v27 age];
  id v133 = v7;
  if (v89 > 0.1)
  {
    [v27 age];
    if (v90 < 15552000.0)
    {
      [v27 age];
      double v88 = v88 + v91 * 0.5 / -15552000.0 + 0.5;
    }
  }
  id v92 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v93 = [v27 itemSummary];
  long long v94 = [v93 allEmailAddresses];

  uint64_t v95 = [v94 countByEnumeratingWithState:&v137 objects:v177 count:16];
  if (v95)
  {
    uint64_t v96 = v95;
    uint64_t v97 = *(void *)v138;
    do
    {
      for (uint64_t j = 0; j != v96; ++j)
      {
        if (*(void *)v138 != v97) {
          objc_enumerationMutation(v94);
        }
        uint64_t v99 = *(void **)(*((void *)&v137 + 1) + 8 * j);
        if ((unint64_t)[v99 length] > 1)
        {
          uint64_t v100 = objc_msgSend(NSString, "stringWithFormat:", @"%c%lu%c", objc_msgSend(v99, "characterAtIndex:", 0), objc_msgSend(v99, "length") - 2, objc_msgSend(v99, "characterAtIndex:", objc_msgSend(v99, "length") - 1));
          [v92 addObject:v100];
        }
        else
        {
          [v92 addObject:v99];
        }
      }
      uint64_t v96 = [v94 countByEnumeratingWithState:&v137 objects:v177 count:16];
    }
    while (v96);
  }

  v101 = logForCSLogCategoryDefault();
  id v7 = v133;
  BOOL v9 = v134;
  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
  {
    uint64_t v127 = [v134 itemSummary];
    uint64_t v125 = [v127 name];
    uint64_t v124 = [v134 itemSummary];
    v123 = [v124 allEmailAddresses];
    uint64_t v122 = [v123 count];
    if (v122)
    {
      BOOL v121 = [v92 componentsJoinedByString:@", "];
    }
    else
    {
      BOOL v121 = @"NIL";
    }
    if ([v134 hasRecentActivity]) {
      uint64_t v102 = @"YES";
    }
    else {
      uint64_t v102 = @"NO";
    }
    long long v120 = v102;
    if ([v134 hasUsedDate]) {
      __int16 v103 = @"YES";
    }
    else {
      __int16 v103 = @"NO";
    }
    uint64_t v119 = v103;
    [v134 age];
    if (v130) {
      uint64_t v105 = @"YES";
    }
    else {
      uint64_t v105 = @"NO";
    }
    if (v131) {
      float v106 = @"YES";
    }
    else {
      float v106 = @"NO";
    }
    if (v129) {
      float v107 = @"NO";
    }
    else {
      float v107 = @"YES";
    }
    double v108 = v104 / 86400.0;
    if ([v134 isMegadomeToken]) {
      char v109 = @"YES";
    }
    else {
      char v109 = @"NO";
    }
    [v134 megadomeCompositeScore];
    if (v110 == 0.0)
    {
      double v112 = -1.0;
    }
    else
    {
      [v134 megadomeCompositeScore];
      double v112 = v111;
    }
    int v113 = [v134 isMailingList];
    *(_DWORD *)buf = 138416130;
    if (v113) {
      uint64_t v114 = @"YES";
    }
    else {
      uint64_t v114 = @"NO";
    }
    id v146 = v133;
    __int16 v147 = 2112;
    uint64_t v148 = v125;
    __int16 v149 = 2048;
    double v150 = v30;
    __int16 v151 = 2112;
    id v152 = v121;
    __int16 v153 = 2048;
    double v154 = v17;
    __int16 v155 = 2048;
    double v156 = v88;
    __int16 v157 = 2048;
    double v158 = v83;
    __int16 v159 = 2112;
    v160 = v120;
    __int16 v161 = 2112;
    uint64_t v162 = v119;
    __int16 v163 = 2048;
    double v164 = v108;
    __int16 v165 = 2112;
    id v166 = v105;
    __int16 v167 = 2112;
    int v168 = v106;
    __int16 v169 = 2112;
    int v170 = v107;
    __int16 v171 = 2112;
    id v172 = v109;
    __int16 v173 = 2048;
    double v174 = v112;
    __int16 v175 = 2112;
    int v176 = v114;
    _os_log_impl(&dword_18D0E3000, v101, OS_LOG_TYPE_INFO, "[Pommes_Suggestions]: query: %@, name: %@ (score: %f), email: %@ (score: %f), composite_score: %f, text_score: %f, recent_activity: %@, has_used_date: %@, age: %f, is_contact: %@, is_pommes: %@, is_author: %@, is_megadome: %@, megadome_score: %f, mailing_list: %@", buf, 0xA2u);
    if (v122) {

    }
    id v7 = v133;
    BOOL v9 = v134;
  }

  double v26 = [NSNumber numberWithDouble:v88];

LABEL_115:

  return v26;
}

+ (void)computeRankingScoreForSuggestions:(id)a3 queryString:(id)a4 locale:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v20 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          double v17 = [v16 suggestionTokens];
          char v18 = [v17 lastObject];

          if ([v18 internalType] == 4
            || [v18 localCompletionType] == 10
            || [v18 tokenKind] == 16)
          {
            double v19 = [a1 computeRankingScoreForSuggestion:v16 queryString:v9 locale:v10];
            if (v19) {
              [v18 setScore:v19];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    id v8 = v20;
  }
}

+ (id)orderedSuggestions:(id)a3 options:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"maxCount"];
    if (v8)
    {
      id v9 = [v7 objectForKeyedSubscript:@"maxCount"];
      uint64_t v74 = [v9 integerValue];
    }
    else
    {
      uint64_t v74 = 5;
    }

    uint64_t v12 = [v7 objectForKeyedSubscript:@"filterByCount"];
    if (v12)
    {
      uint64_t v13 = [v7 objectForKeyedSubscript:@"filterByCount"];
      char v11 = [v13 BOOLValue] ^ 1;
    }
    else
    {
      char v11 = 1;
    }

    uint64_t v14 = [v7 objectForKeyedSubscript:@"personWeight"];
    if (v14)
    {
      char v15 = [v7 objectForKeyedSubscript:@"personWeight"];
      [v15 doubleValue];
      double v10 = v16;
    }
    else
    {
      double v10 = 0.0;
    }
  }
  else
  {
    double v10 = 0.0;
    char v11 = 1;
    uint64_t v74 = 5;
  }
  double v75 = v7;
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v82 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v80 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obuint64_t j = v5;
  uint64_t v17 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
  if (!v17)
  {
    double v81 = 0;
    goto LABEL_47;
  }
  uint64_t v18 = v17;
  double v81 = 0;
  uint64_t v19 = *(void *)v98;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v98 != v19) {
        objc_enumerationMutation(obj);
      }
      long long v21 = *(__CFString **)(*((void *)&v97 + 1) + 8 * i);
      if ((v11 & 1) != 0 || [*(id *)(*((void *)&v97 + 1) + 8 * i) resultCount])
      {
        long long v22 = [(__CFString *)v21 localizedAttributedSuggestion];
        long long v23 = [v22 string];

        if (v23) {
          long long v24 = v23;
        }
        else {
          long long v24 = &stru_1EDBB3A50;
        }
        uint64_t v25 = v24;
        uint64_t v26 = [(__CFString *)v21 suggestionKind];
        if (v26 == 1)
        {
          [v83 addObject:v21];
          goto LABEL_42;
        }
        if (v26 == 2)
        {
          id v27 = [(__CFString *)v21 suggestionTokens];
          uint64_t v28 = [v27 lastObject];

          uint64_t v29 = [v28 tokenKind];
          if (v29 == 46)
          {
            BOOL v34 = v21;

            double v81 = v34;
            goto LABEL_41;
          }
          id v30 = v82;
          if (v29 == 16)
          {
            id v30 = v80;
            if ([v80 containsObject:v25]) {
              goto LABEL_41;
            }
            unint64_t v31 = v77;
LABEL_34:
            [v31 addObject:v21];
            unint64_t v32 = v30;
            char v33 = v25;
          }
          else
          {
            if (!v29)
            {
              if ([v28 internalType] == 3 || (objc_msgSend(v82, "containsObject:", v25) & 1) == 0)
              {
                unint64_t v31 = v79;
                goto LABEL_34;
              }
LABEL_41:

              goto LABEL_42;
            }
            if ([v28 internalType] == 3) {
              unint64_t v32 = v78;
            }
            else {
              unint64_t v32 = v76;
            }
            char v33 = v21;
          }
          [v32 addObject:v33];
          goto LABEL_41;
        }
LABEL_42:

        continue;
      }
    }
    uint64_t v18 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
  }
  while (v18);
LABEL_47:

  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v36 = v74 - [v78 count];
  if (v36 < 0)
  {
    unint64_t v49 = 0;
    double v38 = v79;
  }
  else
  {
    unint64_t v37 = [v77 count];
    double v38 = v79;
    unint64_t v39 = [v79 count];
    double v40 = (1.0 - v10) * (double)(unint64_t)v36;
    unint64_t v41 = (unint64_t)v40;
    unint64_t v42 = v36 - (unint64_t)v40;
    unint64_t v43 = v36 - v39;
    if (v36 - v39 >= v37) {
      unint64_t v43 = v37;
    }
    if (v39 < v41)
    {
      unint64_t v44 = v39;
    }
    else
    {
      unint64_t v43 = v36 - (unint64_t)v40;
      unint64_t v44 = (unint64_t)v40;
    }
    unint64_t v45 = v36 - v37;
    if (v36 - v37 >= v39) {
      unint64_t v45 = v39;
    }
    if (v39 >= v41) {
      unint64_t v46 = v45;
    }
    else {
      unint64_t v46 = v39;
    }
    if (v42 > v37) {
      unint64_t v47 = v37;
    }
    else {
      unint64_t v47 = v43;
    }
    if (v42 > v37) {
      unint64_t v48 = v46;
    }
    else {
      unint64_t v48 = v44;
    }
    unint64_t v49 = 0;
    if (v47)
    {
      while (v49 < [v77 count])
      {
        uint64_t v50 = [v77 objectAtIndexedSubscript:v49];
        [v50 setRank:v49];
        [v35 addObject:v50];

        if (v47 == ++v49)
        {
          unint64_t v49 = v47;
          break;
        }
      }
    }
    if (v81)
    {
      if ([v77 count]) {
        uint64_t v51 = v35;
      }
      else {
        uint64_t v51 = v78;
      }
      [v51 addObject:v81];
    }
    if (v48)
    {
      unint64_t v52 = 0;
      while (v52 < [v79 count])
      {
        double v53 = [v79 objectAtIndexedSubscript:v52];
        [v53 setRank:v49 + v52];
        [v35 addObject:v53];

        if (v48 == ++v52)
        {
          v49 += v52;
          goto LABEL_80;
        }
      }
      v49 += v52;
    }
  }
LABEL_80:
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v54 = v78;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v94;
    do
    {
      for (uint64_t j = 0; j != v56; ++j)
      {
        if (*(void *)v94 != v57) {
          objc_enumerationMutation(v54);
        }
        id v59 = *(void **)(*((void *)&v93 + 1) + 8 * j);
        [v59 setRank:v49 + j];
        [v35 addObject:v59];
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v93 objects:v103 count:16];
      v49 += j;
    }
    while (v56);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v60 = v76;
  uint64_t v61 = [v60 countByEnumeratingWithState:&v89 objects:v102 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v90;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v90 != v63) {
          objc_enumerationMutation(v60);
        }
        uint64_t v65 = *(void **)(*((void *)&v89 + 1) + 8 * k);
        [v65 setRank:v49 + k];
        [v35 addObject:v65];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v89 objects:v102 count:16];
      v49 += k;
    }
    while (v62);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v66 = v83;
  uint64_t v67 = [v66 countByEnumeratingWithState:&v85 objects:v101 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v86;
    do
    {
      for (uint64_t m = 0; m != v68; ++m)
      {
        if (*(void *)v86 != v69) {
          objc_enumerationMutation(v66);
        }
        double v71 = *(void **)(*((void *)&v85 + 1) + 8 * m);
        [v71 setRank:v49 + m];
        [v35 addObject:v71];
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v85 objects:v101 count:16];
      v49 += m;
    }
    while (v68);
  }

  long long v72 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
    +[CSUserQuery(CSSuggestionBlending) orderedSuggestions:options:](v35);
  }

  return v35;
}

+ (id)dedupedNextTokenSuggestions:(id)a3 context:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = [v6 suggestion];
  double v10 = [v9 suggestionTokens];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [v6 suggestion];
      uint64_t v14 = [v13 suggestionTokens];
      char v15 = [v14 objectAtIndexedSubscript:v12];
      double v16 = [v15 displayString];

      [v8 addObject:v16];
      ++v12;
      uint64_t v17 = [v6 suggestion];
      uint64_t v18 = [v17 suggestionTokens];
      unint64_t v19 = [v18 count];
    }
    while (v12 < v19);
  }
  id v30 = v6;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = v5;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v26 = [v25 suggestionTokens];
        id v27 = [v26 lastObject];
        uint64_t v28 = [v27 displayString];

        if (([v8 containsObject:v28] & 1) == 0) {
          [v7 addObject:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v22);
  }

  return v7;
}

+ (void)filteredTemplateSuggestions:(id)a3 nlpSuggestions:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v27 = v6;
    uint64_t v28 = v5;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "currentToken", v27);
        if ([v14 tokenKind] == 2)
        {
          char v15 = [v13 currentToken];
          double v16 = [v15 nlpCompletionType];
          char v17 = [v16 isEqualToString:@"kQPTokenAttachmentAny"];

          if (v17)
          {
            id v18 = v13;
            [v8 removeObject:v18];

            if (!v18) {
              goto LABEL_24;
            }
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v5 = v28;
            id v19 = v28;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v30;
              while (2)
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v30 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  long long v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                  uint64_t v25 = [v24 currentToken];
                  uint64_t v26 = [v25 internalType];

                  if (v26 == 9)
                  {
                    [v19 removeObject:v24];
                    goto LABEL_26;
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }
LABEL_26:

            if ([v18 numberOfMessageWithAttachmentTokens] <= 1) {
              [v19 addObject:v18];
            }
            goto LABEL_28;
          }
        }
        else
        {
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v18 = 0;
LABEL_24:
    id v5 = v28;
LABEL_28:
    id v7 = v27;
  }
}

void __28__CSUserQuery_mailResources__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "Failed to soft-link SpotlightResources", v2, v3, v4, v5, v6);
}

void __28__CSUserQuery_mailResources__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "Failed to soft-link resourcesForClient", v2, v3, v4, v5, v6);
}

void __28__CSUserQuery_mailResources__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "Failed to soft-link loadAllParametersForClient", v2, v3, v4, v5, v6);
}

void __28__CSUserQuery_mailResources__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "Failed to soft-link sharedResourcesManager", v2, v3, v4, v5, v6);
}

void __28__CSUserQuery_mailResources__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_DEBUG, "CSUserQuery: loading trial parameters", v1, 2u);
}

+ (void)queryContextWithUserQueryString:(void *)a1 searchString:clientContext:.cold.1(void *a1)
{
  [a1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] updating current suggestion with userQueryString", v3, v4, v5, v6, v7);
}

+ (void)parseResultWithSearchString:parseOptions:queryContext:isZKW:.cold.1()
{
  OUTLINED_FUNCTION_7();
  [v0 queryID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] annotated input \"<%@>\"", v3, v4, v5, v6, v7);
}

+ (void)parseResultWithSearchString:(void *)a1 parseOptions:queryContext:isZKW:.cold.2(void *a1)
{
  [a1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] semanticQuery failed to generate, using \"(false)\"", v3, v4, v5, v6, v7);
}

+ (void)parseResultWithSearchString:(void *)a1 parseOptions:queryContext:isZKW:.cold.3(void *a1)
{
  [a1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] got a nil / empty embedding data dictionary", v3, v4, v5, v6, v7);
}

+ (void)parseResultWithSearchString:parseOptions:queryContext:isZKW:.cold.4()
{
  OUTLINED_FUNCTION_7();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [v1 queryID];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_ERROR, "[CSUserQuery][qid=%ld] failed to deserialize the embedding data dictionary with error: %@", v2, 0x16u);
}

+ (void)parseResultWithSearchString:parseOptions:queryContext:isZKW:.cold.5()
{
  OUTLINED_FUNCTION_7();
  [v0 queryID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] instantAnswersQuery <%@>", v3, v4, v5, v6, v7);
}

+ (void)parseResultWithSearchString:parseOptions:queryContext:isZKW:.cold.6()
{
  OUTLINED_FUNCTION_7();
  [v0 queryID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] nlQuery <%@>", v3, v4, v5, v6, v7);
}

+ (void)parseResultWithSearchString:(void *)a1 parseOptions:queryContext:isZKW:.cold.7(void *a1)
{
  [a1 queryID];
  uint64_t v1 = [(id)OUTLINED_FUNCTION_8() suggestion];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v2, v3, "[CSUserQuery][qid=%ld] suggestion engagement %@", v4, v5, v6, v7, v8);
}

- (void)queryStringWithQueryContext:searchString:options:.cold.1()
{
  OUTLINED_FUNCTION_7();
  [v0 queryID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v1, v2, "[debug][personal answers][query][qid=%ld] CSUserQuery: enabling personal answers for searchString = %@", v3, v4, v5, v6, v7);
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.2(void *a1)
{
  [a1 queryID];
  uint64_t v1 = [(id)OUTLINED_FUNCTION_8() instantAnswersQueries];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v2, v3, "[debug][instant answers][query][qid=%ld] final instantAnswersQuery = %@", v4, v5, v6, v7, v8);
}

- (void)queryStringWithQueryContext:searchString:options:.cold.3()
{
  OUTLINED_FUNCTION_7();
  [v0 queryID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v1, v2, "[debug][instant answers][query][qid=%ld] mailboxes = %@", v3, v4, v5, v6, v7);
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.4(void *a1)
{
  [a1 queryID];
  uint64_t v1 = [(id)OUTLINED_FUNCTION_8() instantAnswersQueries];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v2, v3, "[debug][instant answers][query][qid=%ld] instantAnswersQuery = %@", v4, v5, v6, v7, v8);
}

- (void)queryStringWithQueryContext:searchString:options:.cold.5()
{
  OUTLINED_FUNCTION_7();
  [v0 queryID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v1, v2, "[debug][instant answers][query][qid=%ld] CSUserQuery: enabling instant answers for searchString = %@", v3, v4, v5, v6, v7);
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.6(void *a1)
{
  [a1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] enabling kg people suggestions", v3, v4, v5, v6, v7);
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.7(void *a1)
{
  [a1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] enabling completions", v3, v4, v5, v6, v7);
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.8(void *a1)
{
  [a1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] enabling pommes suggestions", v3, v4, v5, v6, v7);
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.9(void *a1)
{
  [a1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "[CSUserQuery][qid=%ld] enabling pommes ranking", v3, v4, v5, v6, v7);
}

- (void)initWithUserQueryString:queryContext:.cold.1()
{
  OUTLINED_FUNCTION_7();
  [v0 queryID];
  uint64_t v1 = [(id)OUTLINED_FUNCTION_8() suggestion];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v2, v3, "[CSUserQuery][qid=%ld] creating query with suggestion object <%@>", v4, v5, v6, v7, v8);
}

void __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 queryContext];
  [v1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v2, v3, "qid=%ld - [ContactSearch] Autoscoping couldn't be computed for any contacts", v4, v5, v6, v7, v8);
}

void __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_cold_2(id *a1)
{
  uint64_t v1 = [*a1 queryContext];
  [v1 queryID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v2, v3, "qid=%ld - [ContactSearch] All contacts are already processed or have [FROM] scopes", v4, v5, v6, v7, v8);
}

- (void)startContactSearchIfNeededWithSearchQuery:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_DEBUG, "[ContactSearch] Not fetching contacts for empty query string", v1, 2u);
}

@end