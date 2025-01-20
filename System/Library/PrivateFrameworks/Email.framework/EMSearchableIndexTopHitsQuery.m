@interface EMSearchableIndexTopHitsQuery
+ (OS_os_log)log;
- (BOOL)generateSuggestions;
- (CSTopHitQuery)topHitSearchQuery;
- (EFPromise)spotlightTopHitsQueryInstantAnswersResultPromise;
- (EFPromise)spotlightTopHitsQueryResultPromise;
- (EFPromise)spotlightTopHitsQuerySuggestionsResultPromise;
- (EMSearchableIndexTopHitsQuery)initWithSearchString:(id)a3 filterQueries:(id)a4 bundleID:(id)a5 keyboardLanguage:(id)a6 updatedSuggestion:(id)a7 generateSuggestions:(BOOL)a8 logDescription:(id)a9 resultLimit:(unint64_t)a10 suggestionLimit:(unint64_t)a11 customFlags:(id)a12 feedbackQueryID:(int64_t)a13;
- (NSArray)filterQueries;
- (NSLock)lock;
- (NSMutableArray)foundInstantAnswersSuggestions;
- (NSMutableArray)foundItems;
- (NSMutableArray)foundSuggestions;
- (NSMutableDictionary)foundMatchingHintsByPersistentID;
- (NSProgress)internalProgress;
- (NSProgress)progress;
- (NSString)bundleID;
- (NSString)description;
- (NSString)keyboardLanguage;
- (NSString)logDescription;
- (NSString)logPrefix;
- (NSString)searchString;
- (id)topHitsQueryInstantAnswersResult;
- (id)topHitsQueryResult;
- (id)topHitsQuerySuggestionResult;
- (unint64_t)resultLimit;
- (void)_cancel;
- (void)_configureTopHitsSearchQuery:(id)a3;
- (void)_searchDidCompleteWithError:(id)a3;
- (void)_searchFoundInstantAnswers:(id)a3;
- (void)_searchFoundItems:(id)a3;
- (void)_searchFoundSuggestions:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)setBundleID:(id)a3;
- (void)setFoundInstantAnswersSuggestions:(id)a3;
- (void)setFoundItems:(id)a3;
- (void)setFoundMatchingHintsByPersistentID:(id)a3;
- (void)setFoundSuggestions:(id)a3;
- (void)setGenerateSuggestions:(BOOL)a3;
- (void)setInternalProgress:(id)a3;
- (void)setLock:(id)a3;
- (void)setLogPrefix:(id)a3;
- (void)setProgress:(id)a3;
- (void)setSpotlightTopHitsQueryInstantAnswersResultPromise:(id)a3;
- (void)setSpotlightTopHitsQueryResultPromise:(id)a3;
- (void)setSpotlightTopHitsQuerySuggestionsResultPromise:(id)a3;
- (void)setTopHitSearchQuery:(id)a3;
- (void)start;
@end

@implementation EMSearchableIndexTopHitsQuery

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EMSearchableIndexTopHitsQuery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_89 != -1) {
    dispatch_once(&log_onceToken_89, block);
  }
  v2 = (void *)log_log_88;
  return (OS_os_log *)v2;
}

void __36__EMSearchableIndexTopHitsQuery_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_88;
  log_log_88 = (uint64_t)v1;
}

- (EMSearchableIndexTopHitsQuery)initWithSearchString:(id)a3 filterQueries:(id)a4 bundleID:(id)a5 keyboardLanguage:(id)a6 updatedSuggestion:(id)a7 generateSuggestions:(BOOL)a8 logDescription:(id)a9 resultLimit:(unint64_t)a10 suggestionLimit:(unint64_t)a11 customFlags:(id)a12 feedbackQueryID:(int64_t)a13
{
  v96[9] = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v83 = a4;
  id v79 = a5;
  id v19 = a6;
  id v82 = a7;
  id v80 = a9;
  id v20 = a12;
  v88.receiver = self;
  v88.super_class = (Class)EMSearchableIndexTopHitsQuery;
  v21 = [(EMSearchableIndexTopHitsQuery *)&v88 init];
  if (v21)
  {
    uint64_t v22 = [v81 copy];
    searchString = v21->_searchString;
    v21->_searchString = (NSString *)v22;

    uint64_t v24 = [v83 copy];
    filterQueries = v21->_filterQueries;
    v21->_filterQueries = (NSArray *)v24;

    uint64_t v26 = [v19 copy];
    keyboardLanguage = v21->_keyboardLanguage;
    v21->_keyboardLanguage = (NSString *)v26;

    v21->_generateSuggestions = a8;
    v21->_resultLimit = a10;
    objc_storeStrong((id *)&v21->_bundleID, a5);
    objc_storeStrong((id *)&v21->_logDescription, a9);
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    foundItems = v21->_foundItems;
    v21->_foundItems = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    foundSuggestions = v21->_foundSuggestions;
    v21->_foundSuggestions = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    foundInstantAnswersSuggestions = v21->_foundInstantAnswersSuggestions;
    v21->_foundInstantAnswersSuggestions = v32;

    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    foundMatchingHintsByPersistentID = v21->_foundMatchingHintsByPersistentID;
    v21->_foundMatchingHintsByPersistentID = v34;

    v36 = (EFPromise *)objc_alloc_init(MEMORY[0x1E4F60E18]);
    spotlightTopHitsQueryResultPromise = v21->_spotlightTopHitsQueryResultPromise;
    v21->_spotlightTopHitsQueryResultPromise = v36;

    v38 = (EFPromise *)objc_alloc_init(MEMORY[0x1E4F60E18]);
    spotlightTopHitsQuerySuggestionsResultPromise = v21->_spotlightTopHitsQuerySuggestionsResultPromise;
    v21->_spotlightTopHitsQuerySuggestionsResultPromise = v38;

    v40 = (EFPromise *)objc_alloc_init(MEMORY[0x1E4F60E18]);
    spotlightTopHitsQueryInstantAnswersResultPromise = v21->_spotlightTopHitsQueryInstantAnswersResultPromise;
    v21->_spotlightTopHitsQueryInstantAnswersResultPromise = v40;

    uint64_t v42 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    progress = v21->_progress;
    v21->_progress = (NSProgress *)v42;

    uint64_t v44 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
    internalProgress = v21->_internalProgress;
    v21->_internalProgress = (NSProgress *)v44;

    [(NSProgress *)v21->_progress addChild:v21->_internalProgress withPendingUnitCount:1];
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v48 = *MEMORY[0x1E4F234E0];
    v96[0] = *MEMORY[0x1E4F236F0];
    v96[1] = v48;
    uint64_t v49 = *MEMORY[0x1E4F23748];
    v96[2] = *MEMORY[0x1E4F23700];
    v96[3] = v49;
    uint64_t v50 = *MEMORY[0x1E4F23678];
    v96[4] = *MEMORY[0x1E4F23710];
    v96[5] = v50;
    uint64_t v51 = *MEMORY[0x1E4F23790];
    v96[6] = *MEMORY[0x1E4F23680];
    v96[7] = v51;
    v96[8] = *MEMORY[0x1E4F23760];
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:9];
    [v46 addObjectsFromArray:v52];

    v53 = [(EMSearchableIndexTopHitsQuery *)v21 bundleID];

    if (v53)
    {
      v54 = [(EMSearchableIndexTopHitsQuery *)v21 bundleID];
      [v47 addObject:v54];
    }
    if (_os_feature_enabled_impl()) {
      [v46 addObject:*MEMORY[0x1E4F23770]];
    }
    v55 = [MEMORY[0x1E4F23880] topHitQueryContextWithCurrentSuggestion:v82];
    [v55 setMaxSuggestionCount:a11];
    [v55 setMaxItemCount:a10];
    [v55 setKeyboardLanguage:v19];
    [v55 setFetchAttributes:v46];
    [v55 setFilterQueries:v83];
    [v55 setBundleIDs:v47];
    [v55 setFeedbackQueryID:a13];
    if (_os_feature_enabled_impl())
    {
      v56 = +[EMSearchableIndexTopHitsQuery log];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BEFDB000, v56, OS_LOG_TYPE_DEFAULT, "[instant answers] Enabling instant answers in csTopHits query context", buf, 2u);
      }

      [v55 setEnableInstantAnswers:1];
    }
    if (v20 && [v20 count])
    {
      id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __203__EMSearchableIndexTopHitsQuery_initWithSearchString_filterQueries_bundleID_keyboardLanguage_updatedSuggestion_generateSuggestions_logDescription_resultLimit_suggestionLimit_customFlags_feedbackQueryID___block_invoke;
      v86[3] = &unk_1E63E62B0;
      id v58 = v57;
      id v87 = v58;
      [v20 enumerateKeysAndObjectsUsingBlock:v86];
      v59 = (void *)[v58 copy];
      [v55 setCustomFieldSpecifications:v59];

      v60 = +[EMSearchableIndexTopHitsQuery log];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (void *)[v58 copy];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v61;
        _os_log_impl(&dword_1BEFDB000, v60, OS_LOG_TYPE_DEFAULT, "Setting customFieldSpecifications: %@ on csContext", buf, 0xCu);
      }
    }
    uint64_t v95 = *MEMORY[0x1E4F28340];
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
    [v55 setProtectionClasses:v62];

    v63 = [MEMORY[0x1E4F60D58] currentDevice];
    int v64 = [v63 isAppleSilicon];

    if (v64)
    {
      uint64_t v94 = *MEMORY[0x1E4F28358];
      v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
      [v55 setProtectionClasses:v65];
    }
    uint64_t v66 = [objc_alloc(MEMORY[0x1E4F23878]) initWithUserQueryString:v21->_searchString queryContext:v55];
    topHitSearchQuery = v21->_topHitSearchQuery;
    v21->_topHitSearchQuery = (CSTopHitQuery *)v66;

    v68 = +[EMSearchableIndexTopHitsQuery log];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v21->_searchString];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v69;
      __int16 v90 = 2112;
      v91 = v55;
      __int16 v92 = 2112;
      id v93 = v82;
      _os_log_impl(&dword_1BEFDB000, v68, OS_LOG_TYPE_DEFAULT, "Setting top hits query with searchString: %@ and csContext: %@ with suggestion: %@", buf, 0x20u);
    }
    [(EMSearchableIndexTopHitsQuery *)v21 _configureTopHitsSearchQuery:v21->_topHitSearchQuery];
    v70 = NSString;
    uint64_t v71 = [(EMSearchableIndexTopHitsQuery *)v21 logDescription];
    v72 = (void *)v71;
    v73 = &stru_1F1A3DFB0;
    if (v71) {
      v73 = (__CFString *)v71;
    }
    uint64_t v74 = [v70 stringWithFormat:@"[%p %@]", v21, v73];
    logPrefix = v21->_logPrefix;
    v21->_logPrefix = (NSString *)v74;

    v76 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v21->_lock;
    v21->_lock = v76;

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v21);
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __203__EMSearchableIndexTopHitsQuery_initWithSearchString_filterQueries_bundleID_keyboardLanguage_updatedSuggestion_generateSuggestions_logDescription_resultLimit_suggestionLimit_customFlags_feedbackQueryID___block_invoke_113;
    v84[3] = &unk_1E63E2688;
    objc_copyWeak(&v85, (id *)buf);
    [(NSProgress *)v21->_internalProgress setCancellationHandler:v84];
    objc_destroyWeak(&v85);
    objc_destroyWeak((id *)buf);
  }
  return v21;
}

void __203__EMSearchableIndexTopHitsQuery_initWithSearchString_filterQueries_bundleID_keyboardLanguage_updatedSuggestion_generateSuggestions_logDescription_resultLimit_suggestionLimit_customFlags_feedbackQueryID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F237D0]);
  v7 = (void *)[v6 initWithDisplayName:v5 attribute:*MEMORY[0x1E4F23708] status:v8 token:@"Flag"];
  [*(id *)(a1 + 32) addObject:v7];
}

void __203__EMSearchableIndexTopHitsQuery_initWithSearchString_filterQueries_bundleID_keyboardLanguage_updatedSuggestion_generateSuggestions_logDescription_resultLimit_suggestionLimit_customFlags_feedbackQueryID___block_invoke_113(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

- (void)dealloc
{
  [(EMSearchableIndexTopHitsQuery *)self _cancel];
  v3.receiver = self;
  v3.super_class = (Class)EMSearchableIndexTopHitsQuery;
  [(EMSearchableIndexTopHitsQuery *)&v3 dealloc];
}

- (void)_configureTopHitsSearchQuery:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke;
  v11[3] = &unk_1E63E6160;
  objc_copyWeak(&v12, &location);
  [v4 setFoundItemsHandler:v11];
  if ([(EMSearchableIndexTopHitsQuery *)self generateSuggestions])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_2;
    v9[3] = &unk_1E63E6160;
    objc_copyWeak(&v10, &location);
    [v4 setFoundSuggestionsHandler:v9];
    objc_destroyWeak(&v10);
  }
  if (_os_feature_enabled_impl())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_3;
    v7[3] = &unk_1E63E6160;
    objc_copyWeak(&v8, &location);
    [v4 setFoundInstantAnswersHandler:v7];
    objc_destroyWeak(&v8);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_4;
  v5[3] = &unk_1E63E6188;
  objc_copyWeak(&v6, &location);
  [v4 setCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _searchFoundItems:v3];
}

void __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _searchFoundSuggestions:v3];
}

void __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _searchFoundInstantAnswers:v3];
}

void __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _searchDidCompleteWithError:v3];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ : %p> query: %@", objc_opt_class(), self, self->_topHitSearchQuery];
}

- (void)_searchFoundItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v5 lock];

  id v6 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryResultPromise];
  v7 = [v6 future];
  int v8 = [v7 isFinished];

  v9 = +[EMSearchableIndexTopHitsQuery log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(EMSearchableIndexTopHitsQuery *)self logPrefix];
    int v15 = 138543874;
    v16 = v10;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 1024;
    int v20 = v8;
    _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _searchFoundItems:%@ isFinished:%d", (uint8_t *)&v15, 0x1Cu);
  }
  if ((v8 & 1) == 0)
  {
    v11 = [(EMSearchableIndexTopHitsQuery *)self internalProgress];
    [v11 becomeCurrentWithPendingUnitCount:1];

    id v12 = [(EMSearchableIndexTopHitsQuery *)self foundItems];
    [v12 addObjectsFromArray:v4];

    v13 = [(EMSearchableIndexTopHitsQuery *)self internalProgress];
    [v13 resignCurrent];
  }
  v14 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v14 unlock];
}

- (void)_searchFoundSuggestions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v5 lock];

  id v6 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQuerySuggestionsResultPromise];
  v7 = [v6 future];
  int v8 = [v7 isFinished];

  v9 = +[EMSearchableIndexTopHitsQuery log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(EMSearchableIndexTopHitsQuery *)self logPrefix];
    v11 = +[EMCSLoggingAdditions publicDescriptionForSuggestionArray:v4];
    int v16 = 138543874;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    __int16 v20 = 1024;
    int v21 = v8;
    _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _searchFoundSuggestions:%@ isFinished:%d", (uint8_t *)&v16, 0x1Cu);
  }
  if ((v8 & 1) == 0)
  {
    id v12 = [(EMSearchableIndexTopHitsQuery *)self internalProgress];
    [v12 becomeCurrentWithPendingUnitCount:1];

    v13 = [(EMSearchableIndexTopHitsQuery *)self foundSuggestions];
    [v13 addObjectsFromArray:v4];

    v14 = [(EMSearchableIndexTopHitsQuery *)self internalProgress];
    [v14 resignCurrent];
  }
  int v15 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v15 unlock];
}

- (void)_searchFoundInstantAnswers:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v4 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v4 lock];

  id v5 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryInstantAnswersResultPromise];
  id v6 = [v5 future];
  int v7 = [v6 isFinished];

  int v8 = +[EMSearchableIndexTopHitsQuery log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(EMSearchableIndexTopHitsQuery *)self logPrefix];
    uint64_t v10 = [v28 count];
    *(_DWORD *)buf = 138544130;
    uint64_t v35 = (uint64_t)v9;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v28;
    __int16 v38 = 1024;
    int v39 = v7;
    __int16 v40 = 2048;
    uint64_t v41 = v10;
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "[instant answers] %{public}@ _searchFoundInstantAnswers:%@ isFinished:%d with instant answers count: %ld", buf, 0x26u);
  }
  if ((v7 & 1) == 0)
  {
    v11 = [(EMSearchableIndexTopHitsQuery *)self internalProgress];
    [v11 becomeCurrentWithPendingUnitCount:1];

    id v12 = +[EMSearchableIndexTopHitsQuery log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = 1;
      _os_log_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_DEFAULT, "[instant answers] Sending %lu eligible instant answer to the suggester", buf, 0xCu);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v28;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v13);
          }
          __int16 v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          __int16 v18 = [(EMSearchableIndexTopHitsQuery *)self foundInstantAnswersSuggestions];
          if (![v18 count])
          {
            __int16 v19 = NSNumber;
            __int16 v20 = [v17 instantAnswer];
            int v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "instantAnswersKind"));
            LODWORD(v19) = [&unk_1F1A62028 containsObject:v21];

            if (!v19) {
              continue;
            }
            __int16 v18 = [(EMSearchableIndexTopHitsQuery *)self foundInstantAnswersSuggestions];
            [v18 addObject:v17];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    uint64_t v22 = +[EMSearchableIndexTopHitsQuery log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(EMSearchableIndexTopHitsQuery *)self foundInstantAnswersSuggestions];
      uint64_t v24 = [(EMSearchableIndexTopHitsQuery *)self foundInstantAnswersSuggestions];
      uint64_t v25 = [v24 count];
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = (uint64_t)v23;
      __int16 v36 = 2048;
      uint64_t v37 = v25;
      _os_log_impl(&dword_1BEFDB000, v22, OS_LOG_TYPE_DEFAULT, "[instant answers] Final found instant answers are:%@ with count:%lu", buf, 0x16u);
    }
    uint64_t v26 = [(EMSearchableIndexTopHitsQuery *)self internalProgress];
    [v26 resignCurrent];
  }
  v27 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v27 unlock];
}

- (void)_searchDidCompleteWithError:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EMSearchableIndexTopHitsQuery log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(EMSearchableIndexTopHitsQuery *)self logPrefix];
    int v7 = objc_msgSend(v4, "ef_publicDescription");
    *(_DWORD *)buf = 138543618;
    __int16 v36 = v6;
    __int16 v37 = 2114;
    __int16 v38 = v7;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ _searchDidComplete error:%{public}@", buf, 0x16u);
  }
  int v8 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v8 lock];

  v9 = [EMSearchableIndexTopHitsQueryResult alloc];
  uint64_t v10 = [(EMSearchableIndexTopHitsQuery *)self topHitSearchQuery];
  v11 = [(EMSearchableIndexTopHitsQuery *)self foundItems];
  id v12 = [(EMSearchableIndexTopHitsQuery *)self foundMatchingHintsByPersistentID];
  v34 = [(EMSearchableIndexTopHitsQueryResult *)v9 initWithTopHitSearchQuery:v10 foundItems:v11 foundMatchingHintsByPersistentID:v12];

  [(EMSearchableIndexTopHitsQuery *)self setTopHitSearchQuery:0];
  id v13 = [EMSearchableIndexSuggestionsQueryResult alloc];
  uint64_t v14 = [(EMSearchableIndexTopHitsQuery *)self foundSuggestions];
  uint64_t v15 = [(EMSearchableIndexSuggestionsQueryResult *)v13 initWithSuggestions:v14];

  if (_os_feature_enabled_impl())
  {
    int v16 = [EMSearchableIndexInstantAnswersQueryResult alloc];
    __int16 v17 = [(EMSearchableIndexTopHitsQuery *)self foundInstantAnswersSuggestions];
    __int16 v18 = [(EMSearchableIndexInstantAnswersQueryResult *)v16 initWithInstantAnswersSuggestions:v17];
  }
  else
  {
    __int16 v18 = 0;
  }
  __int16 v19 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v19 unlock];

  __int16 v20 = [(EMSearchableIndexTopHitsQuery *)self internalProgress];
  uint64_t v21 = [v20 completedUnitCount];
  uint64_t v22 = [(EMSearchableIndexTopHitsQuery *)self internalProgress];
  [v22 setTotalUnitCount:v21];

  if (v4)
  {
    v23 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQuerySuggestionsResultPromise];
    [v23 finishWithError:v4];

    uint64_t v24 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryResultPromise];
    [v24 finishWithError:v4];

    if (_os_feature_enabled_impl())
    {
      uint64_t v25 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryInstantAnswersResultPromise];
      [v25 finishWithError:v4];
LABEL_13:
    }
  }
  else
  {
    uint64_t v26 = +[EMSearchableIndexTopHitsQuery log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(EMSearchableIndexTopHitsQuery *)self logPrefix];
      id v28 = [(EMSearchableIndexTopHitsQuery *)self foundItems];
      long long v29 = [(EMSearchableIndexTopHitsQuery *)self foundSuggestions];
      long long v30 = +[EMCSLoggingAdditions publicDescriptionForSuggestionArray:v29];
      long long v31 = [(EMSearchableIndexTopHitsQuery *)self foundInstantAnswersSuggestions];
      *(_DWORD *)buf = 138544130;
      __int16 v36 = v27;
      __int16 v37 = 2112;
      __int16 v38 = v28;
      __int16 v39 = 2112;
      __int16 v40 = v30;
      __int16 v41 = 2112;
      uint64_t v42 = v31;
      _os_log_impl(&dword_1BEFDB000, v26, OS_LOG_TYPE_DEFAULT, "[instant answers] %{public}@ _searchDidComplete foundLibraryItems:%@ foundSuggestionItems:%@ foundInstantAnswersItems: %@", buf, 0x2Au);
    }
    long long v32 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQuerySuggestionsResultPromise];
    [v32 finishWithResult:v15];

    v33 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryResultPromise];
    [v33 finishWithResult:v34];

    if (_os_feature_enabled_impl())
    {
      uint64_t v25 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryInstantAnswersResultPromise];
      [v25 finishWithResult:v18];
      goto LABEL_13;
    }
  }
}

- (id)topHitsQueryResult
{
  v2 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryResultPromise];
  id v3 = [v2 future];

  return v3;
}

- (id)topHitsQuerySuggestionResult
{
  v2 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQuerySuggestionsResultPromise];
  id v3 = [v2 future];

  return v3;
}

- (id)topHitsQueryInstantAnswersResult
{
  v2 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryInstantAnswersResultPromise];
  id v3 = [v2 future];

  return v3;
}

- (void)start
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v3 lock];

  id v4 = +[EMSearchableIndexTopHitsQuery log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(EMSearchableIndexTopHitsQuery *)self logPrefix];
    id v6 = [(EMSearchableIndexTopHitsQuery *)self topHitSearchQuery];
    int v7 = (void *)MEMORY[0x1E4F60E00];
    int v8 = [(EMSearchableIndexTopHitsQuery *)self searchString];
    v9 = [v7 partiallyRedactedStringForString:v8];
    uint64_t v10 = [(EMSearchableIndexTopHitsQuery *)self filterQueries];
    int v13 = 138544130;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    int v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v10;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ starting query:%@ searchString:%@ filter:%@", (uint8_t *)&v13, 0x2Au);
  }
  v11 = [(EMSearchableIndexTopHitsQuery *)self topHitSearchQuery];
  [v11 start];

  id v12 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v12 unlock];
}

- (void)cancel
{
  id v2 = [(EMSearchableIndexTopHitsQuery *)self progress];
  [v2 cancel];
}

- (void)_cancel
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v3 lock];

  id v4 = [(EMSearchableIndexTopHitsQuery *)self topHitSearchQuery];
  id v5 = +[EMSearchableIndexTopHitsQuery log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(EMSearchableIndexTopHitsQuery *)self logPrefix];
    int v15 = 138543618;
    int v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v4;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling query:%@", (uint8_t *)&v15, 0x16u);
  }
  [(CSTopHitQuery *)self->_topHitSearchQuery setCompletionHandler:0];
  [(CSTopHitQuery *)self->_topHitSearchQuery setFoundItemHandler:0];
  [(CSTopHitQuery *)self->_topHitSearchQuery setFoundSuggestionsHandler:0];
  if (_os_feature_enabled_impl()) {
    [(CSTopHitQuery *)self->_topHitSearchQuery setFoundInstantAnswersHandler:0];
  }
  [v4 cancel];
  topHitSearchQuery = self->_topHitSearchQuery;
  self->_topHitSearchQuery = 0;

  int v8 = [(EMSearchableIndexTopHitsQuery *)self lock];
  [v8 unlock];

  v9 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryResultPromise];
  uint64_t v10 = [v9 future];
  [v10 cancel];

  v11 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQuerySuggestionsResultPromise];
  id v12 = [v11 future];
  [v12 cancel];

  if (_os_feature_enabled_impl())
  {
    int v13 = [(EMSearchableIndexTopHitsQuery *)self spotlightTopHitsQueryInstantAnswersResultPromise];
    uint64_t v14 = [v13 future];
    [v14 cancel];
  }
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSArray)filterQueries
{
  return self->_filterQueries;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (NSString)logDescription
{
  return self->_logDescription;
}

- (CSTopHitQuery)topHitSearchQuery
{
  return (CSTopHitQuery *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTopHitSearchQuery:(id)a3
{
}

- (BOOL)generateSuggestions
{
  return self->_generateSuggestions;
}

- (void)setGenerateSuggestions:(BOOL)a3
{
  self->_generateSuggestions = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSMutableArray)foundItems
{
  return self->_foundItems;
}

- (void)setFoundItems:(id)a3
{
}

- (NSMutableArray)foundSuggestions
{
  return self->_foundSuggestions;
}

- (void)setFoundSuggestions:(id)a3
{
}

- (NSMutableArray)foundInstantAnswersSuggestions
{
  return self->_foundInstantAnswersSuggestions;
}

- (void)setFoundInstantAnswersSuggestions:(id)a3
{
}

- (NSMutableDictionary)foundMatchingHintsByPersistentID
{
  return self->_foundMatchingHintsByPersistentID;
}

- (void)setFoundMatchingHintsByPersistentID:(id)a3
{
}

- (EFPromise)spotlightTopHitsQueryResultPromise
{
  return self->_spotlightTopHitsQueryResultPromise;
}

- (void)setSpotlightTopHitsQueryResultPromise:(id)a3
{
}

- (EFPromise)spotlightTopHitsQuerySuggestionsResultPromise
{
  return self->_spotlightTopHitsQuerySuggestionsResultPromise;
}

- (void)setSpotlightTopHitsQuerySuggestionsResultPromise:(id)a3
{
}

- (EFPromise)spotlightTopHitsQueryInstantAnswersResultPromise
{
  return self->_spotlightTopHitsQueryInstantAnswersResultPromise;
}

- (void)setSpotlightTopHitsQueryInstantAnswersResultPromise:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)internalProgress
{
  return self->_internalProgress;
}

- (void)setInternalProgress:(id)a3
{
}

- (NSString)logPrefix
{
  return self->_logPrefix;
}

- (void)setLogPrefix:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_spotlightTopHitsQueryInstantAnswersResultPromise, 0);
  objc_storeStrong((id *)&self->_spotlightTopHitsQuerySuggestionsResultPromise, 0);
  objc_storeStrong((id *)&self->_spotlightTopHitsQueryResultPromise, 0);
  objc_storeStrong((id *)&self->_foundMatchingHintsByPersistentID, 0);
  objc_storeStrong((id *)&self->_foundInstantAnswersSuggestions, 0);
  objc_storeStrong((id *)&self->_foundSuggestions, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_topHitSearchQuery, 0);
  objc_storeStrong((id *)&self->_logDescription, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_filterQueries, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end