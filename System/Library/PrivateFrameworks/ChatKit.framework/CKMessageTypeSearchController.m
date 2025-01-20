@interface CKMessageTypeSearchController
+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3;
+ (id)timeRankedQueries;
+ (unint64_t)recencyRankedTargetResultCount;
- (BOOL)gotResults;
- (BOOL)isTokenizationSearchController;
- (BOOL)searchTerminated;
- (BOOL)wantsDeleteAction;
- (BOOL)wantsFooterSection;
- (Class)footerClass;
- (IMTimingCollection)timingCollection;
- (NSArray)resultsToCheck;
- (NSDirectionalEdgeInsets)additionalGroupInsets;
- (NSMutableSet)itemsVerifiedOnDiskCache;
- (NSSet)intermediaryResults;
- (NSString)priorQueryIdentifier;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)createFoundItemsHandler;
- (id)itemProviderForSearchResult:(id)a3;
- (id)menuElementsForResult:(id)a3 atIndexPath:(id)a4 sourceRect:(CGRect)a5;
- (id)queryResultsForItems:(id)a3;
- (id)rankingQueriesWithText:(id)a3;
- (id)tokenQueryStringForSearchController:(id)a3;
- (id)zkwFilterQueries;
- (unint64_t)maxResultsForMode:(unint64_t)a3;
- (unint64_t)searchTokenContentType;
- (void)_asyncCheckIfResultsExistOnDisk:(id)a3 firstBatch:(BOOL)a4;
- (void)checkIfResultsExistOnDiskAndNotify:(id)a3;
- (void)deleteAttachmentForResult:(id)a3;
- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5;
- (void)removeFromCache:(id)a3;
- (void)searchEnded;
- (void)searchWithText:(id)a3 mode:(unint64_t)a4;
- (void)sendSyndicationActionForResult:(id)a3 actionType:(unsigned __int8)a4;
- (void)setGotResults:(BOOL)a3;
- (void)setIntermediaryResults:(id)a3;
- (void)setItemsVerifiedOnDiskCache:(id)a3;
- (void)setPriorQueryIdentifier:(id)a3;
- (void)setResultsToCheck:(id)a3;
- (void)setSearchTerminated:(BOOL)a3;
- (void)setTimingCollection:(id)a3;
@end

@implementation CKMessageTypeSearchController

- (unint64_t)searchTokenContentType
{
  return 9;
}

- (id)zkwFilterQueries
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CKSearchController *)self delegate];
  v4 = [v3 searchTokenFiltersForSearchController:self];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v7 = NSString;
    uint64_t v8 = *MEMORY[0x1E4F23080];
    v9 = [NSNumber numberWithBool:0];
    v10 = [v7 stringWithFormat:@"%@ == \"%@\"", v8, v9];
    v12[0] = v10;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }

  return v6;
}

- (id)rankingQueriesWithText:(id)a3
{
  if ([(CKSearchController *)self mode] == 1 || [(CKSearchController *)self mode] == 3)
  {
    v4 = [(id)objc_opt_class() timeRankedQueries];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)timeRankedQueries
{
  v2 = objc_opt_new();
  uint64_t v3 = 0;
  uint64_t v4 = *MEMORY[0x1E4F22C38];
  do
  {
    uint64_t v5 = [NSString stringWithFormat:@"InRange(%@, $time.now(-%ld), $time.now)", v4, 60 * qword_18F81AFA0[v3]];
    [v2 addObject:v5];

    ++v3;
  }
  while (v3 != 9);
  v6 = [NSString stringWithFormat:@"%@ >= $time.now", v4];
  [v2 addObject:v6];

  return v2;
}

+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3
{
  return !a3 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  unint64_t v4 = [(CKSearchController *)self layoutWidth];
  unint64_t result = 0x7FFFFFFFLL;
  switch(a3)
  {
    case 0uLL:
      if (v4) {
        unint64_t result = 6;
      }
      else {
        unint64_t result = 2;
      }
      break;
    case 1uLL:
    case 3uLL:
      if (v4)
      {
        if (v4 == 2 && !CKIsRunningInMacCatalyst())
        {
          unint64_t result = 6;
        }
        else
        {
          v6 = +[CKUIBehavior sharedBehaviors];
          unint64_t v7 = [v6 searchDefaultMaxResults];

          unint64_t result = v7;
        }
      }
      else
      {
        unint64_t result = 1;
      }
      break;
    case 2uLL:
    case 4uLL:
      return result;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 10;
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  if (a5)
  {
    if (a5 == 2)
    {
      unint64_t v5 = 3;
      double v6 = 0.33;
      if (!a3) {
        goto LABEL_9;
      }
    }
    else
    {
      double v6 = 0.5;
      unint64_t v5 = 2;
      if (!a3) {
        goto LABEL_9;
      }
    }
LABEL_8:
    *a3 = v6;
    goto LABEL_9;
  }
  double v6 = 1.0;
  unint64_t v5 = 1;
  if (a3) {
    goto LABEL_8;
  }
LABEL_9:
  if (a4) {
    *a4 = v5;
  }
}

- (id)tokenQueryStringForSearchController:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(CKSearchController *)self delegate];
  double v6 = [v5 searchTokenFiltersForSearchController:self];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = +[CKSearchTokenFilter conversationTokensFromTokenFilters:v6];
  if ([v9 count])
  {
    v10 = +[CKSearchTokenFilter queryStringForMessageTypeSearch:v9];
    [v7 addObject:v10];
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v31 = [v9 count];
        __int16 v32 = 2048;
        uint64_t v33 = [v6 count];
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Found {%ld} conversation tokens from {%ld} total tokens.", buf, 0x16u);
      }
    }
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_11;
    }
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "No conversation search tokens found. Skipping query generation for conversations/people for this search evaluation.", buf, 2u);
    }
  }

LABEL_11:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v16, "contentType", (void)v25) == 8)
        {
          v17 = [v16 queryStringForDateTypeSearch];
          if (([v16 filterOptions] & 0x10) != 0) {
            v18 = v8;
          }
          else {
            v18 = v7;
          }
          [v18 addObject:v17];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  if ([v8 count])
  {
    v19 = +[CKSpotlightQueryUtilities queryStringFromSubqueries:v8 combineOperator:0];
    [v7 addObject:v19];
  }
  v20 = +[CKSpotlightQueryUtilities queryStringFromSubqueries:combineOperator:](CKSpotlightQueryUtilities, "queryStringFromSubqueries:combineOperator:", v7, 1, (void)v25);
  v21 = v20;
  if (v20)
  {
    v22 = objc_msgSend(v20, "__ck_stringByRedactingQuotedSubstrings");
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = (uint64_t)v22;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Generated final query: {%@}", buf, 0xCu);
      }
    }
  }

  return v21;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [(CKMessageTypeSearchController *)self setTimingCollection:v7];
  id v8 = [NSString stringWithFormat:@"%@-Search", objc_opt_class()];
  [v7 startTimingForKey:v8];

  v9 = [NSString stringWithFormat:@"%@-Query", objc_opt_class()];
  [v7 startTimingForKey:v9];

  id location = 0;
  objc_initWeak(&location, self);
  v10 = [(CKMessageTypeSearchController *)self createFoundItemsHandler];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke;
  aBlock[3] = &unk_1E5623CA8;
  objc_copyWeak(&v19, &location);
  id v11 = v7;
  id v18 = v11;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(CKMessageTypeSearchController *)self itemsVerifiedOnDiskCache];

  if (!v13)
  {
    uint64_t v14 = objc_opt_new();
    [(CKMessageTypeSearchController *)self setItemsVerifiedOnDiskCache:v14];
  }
  [(CKMessageTypeSearchController *)self setSearchTerminated:0];
  [(CKSearchController *)self setQueryFoundItemHandler:v10];
  [(CKSearchController *)self setQueryCompletionHandler:v12];
  v15 = [MEMORY[0x1E4F1CAD0] set];
  [(CKMessageTypeSearchController *)self setIntermediaryResults:v15];

  [(CKMessageTypeSearchController *)self setResultsToCheck:0];
  [(CKSearchController *)self setResults:0];
  [(CKMessageTypeSearchController *)self setGotResults:0];
  if ([(CKSearchController *)self shouldIncludeResultsIfFiltered])
  {
    v16.receiver = self;
    v16.super_class = (Class)CKMessageTypeSearchController;
    [(CKSearchController *)&v16 searchWithText:v6 mode:a4];
  }
  else
  {
    [(CKSearchController *)self setResults:0];
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v6 = [WeakRetained searchTerminated];

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = objc_loadWeakRetained((id *)(a1 + 40));
        id v9 = (id)objc_opt_class();
        id v10 = objc_loadWeakRetained((id *)(a1 + 40));
        id v11 = [v10 intermediaryResults];
        *(_DWORD *)buf = 138412802;
        id v29 = v9;
        __int16 v30 = 2112;
        id v31 = v3;
        __int16 v32 = 2048;
        uint64_t v33 = [v11 count];
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "%@ Finished searching with error %@. Results count %lu", buf, 0x20u);
      }
    }
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = NSString;
    id v14 = objc_loadWeakRetained((id *)(a1 + 40));
    v15 = [v13 stringWithFormat:@"%@-Query", objc_opt_class()];
    [v12 stopTimingForKey:v15];

    id v16 = objc_loadWeakRetained(v4);
    v17 = [v16 intermediaryResults];
    if (v17)
    {
      id v18 = objc_loadWeakRetained(v4);
      id v19 = [v18 intermediaryResults];
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1CAD0] set];
    }

    v20 = [v19 allObjects];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke_100;
    v26[3] = &unk_1E5623C80;
    objc_copyWeak(&v27, v4);
    v21 = [v20 sortedArrayUsingComparator:v26];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke_2;
    block[3] = &unk_1E5622AB8;
    objc_copyWeak(&v25, v4);
    id v24 = v21;
    id v22 = v21;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
  }
}

uint64_t __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke_100(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = [WeakRetained useSemanticQuery];

  if (v8)
  {
    uint64_t v9 = [v5 compareByRank:v6];
  }
  else
  {
    id v10 = [v6 attributeSet];

    id v11 = [v10 contentCreationDate];
    id v12 = [v5 attributeSet];
    uint64_t v13 = [v12 contentCreationDate];
    uint64_t v9 = [v11 compare:v13];

    id v6 = v10;
  }

  return v9;
}

void __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained queryResultsForItems:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setQueriedResultsCount:", objc_msgSend(*(id *)(a1 + 32), "count"));

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = objc_loadWeakRetained(v2);
      id v8 = (id)objc_opt_class();
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2048;
      uint64_t v13 = [v4 count];
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%@ got %lu query results", (uint8_t *)&v10, 0x16u);
    }
  }
  id v9 = objc_loadWeakRetained(v2);
  [v9 postProcessAndUpdateResults:v4];
}

- (id)createFoundItemsHandler
{
  id location = 0;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__CKMessageTypeSearchController_createFoundItemsHandler__block_invoke;
  v4[3] = &unk_1E5623920;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __56__CKMessageTypeSearchController_createFoundItemsHandler__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  char v5 = [WeakRetained searchTerminated];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 setGotResults:1];

    id v7 = objc_loadWeakRetained(v3);
    id v8 = [v7 intermediaryResults];
    if (v8)
    {
      id v9 = objc_loadWeakRetained(v3);
      int v10 = [v9 intermediaryResults];
    }
    else
    {
      int v10 = [MEMORY[0x1E4F1CAD0] set];
    }

    id v11 = [v10 setByAddingObjectsFromArray:v13];

    id v12 = objc_loadWeakRetained(v3);
    [v12 setIntermediaryResults:v11];
  }
}

- (void)searchEnded
{
  [(CKMessageTypeSearchController *)self setSearchTerminated:1];
  [(CKMessageTypeSearchController *)self setGotResults:0];
  [(CKSearchController *)self cancelCurrentSearch];
  if ([(CKSearchController *)self shouldResetSearchResultsWhenEnded])
  {
    [(CKSearchController *)self setResults:MEMORY[0x1E4F1CBF0]];
    id v3 = [(CKSearchController *)self delegate];
    [v3 searchControllerContentsDidChange:self];
  }
}

- (id)queryResultsForItems:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = CKSearchSignpostLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = CKSearchSignpostLogHandle();
  id v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v39 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "queryResultsForItems", "", buf, 2u);
  }

  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v15 = -[CKMessageTypeSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v14, spid);
        id v16 = v15;
        if (v15 && [v15 length]) {
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v11);
  }

  unint64_t v40 = [(CKMessageTypeSearchController *)self maxResultsForMode:[(CKSearchController *)self mode]];
  v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = (id)objc_opt_class();
      uint64_t v19 = [v9 count];
      *(_DWORD *)buf = 138412802;
      id v52 = v18;
      __int16 v53 = 2048;
      uint64_t v54 = v19;
      __int16 v55 = 2048;
      unint64_t v56 = v40;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "%@ got %lu items with valid chat GUIDs, checking chat existence up to max results %lu", buf, 0x20u);
    }
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v9;
  uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v44;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        id v24 = -[CKMessageTypeSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v23, spid);
        id v25 = [(CKSearchController *)self delegate];
        long long v26 = [v25 searchController:self conversationForChatGUID:v24];

        if (IMOSLoggingEnabled())
        {
          id v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            id v28 = (id)objc_opt_class();
            int v29 = [v26 isBlockedByCommunicationLimits];
            *(_DWORD *)buf = 138413058;
            __int16 v30 = @"NO";
            if (v29) {
              __int16 v30 = @"YES";
            }
            id v52 = v28;
            __int16 v53 = 2112;
            uint64_t v54 = (uint64_t)v24;
            __int16 v55 = 2048;
            unint64_t v56 = (unint64_t)v26;
            __int16 v57 = 2112;
            v58 = v30;
            _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "%@ chat guid %@ got conversation %p commLimit state %@", buf, 0x2Au);
          }
        }
        if (v26)
        {
          if (([v26 isBlockedByCommunicationLimits] & 1) == 0)
          {
            id v31 = [CKSpotlightQueryResult alloc];
            __int16 v32 = [(id)objc_opt_class() sectionIdentifier];
            uint64_t v33 = [(CKSpotlightQueryResult *)v31 initWithSearchableItem:v23 inSection:v32 withConversation:v26];

            [v42 addObject:v33];
            LODWORD(v32) = [v42 count] < v40;

            if (!v32)
            {

              goto LABEL_36;
            }
          }
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v59 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_36:

  uint64_t v34 = CKSearchSignpostLogHandle();
  v35 = v34;
  if (v39 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v35, OS_SIGNPOST_INTERVAL_END, spid, "queryResultsForItems", "", buf, 2u);
  }

  v36 = (void *)[v42 copy];

  return v36;
}

- (void)checkIfResultsExistOnDiskAndNotify:(id)a3
{
  id v4 = a3;
  [(CKMessageTypeSearchController *)self setResultsToCheck:v4];
  [(CKMessageTypeSearchController *)self _asyncCheckIfResultsExistOnDisk:v4 firstBatch:1];
}

- (void)_asyncCheckIfResultsExistOnDisk:(id)a3 firstBatch:(BOOL)a4
{
  if (a4) {
    unint64_t v5 = 100;
  }
  else {
    unint64_t v5 = 1000;
  }
  id v6 = a3;
  unint64_t v7 = [v6 count];
  if (v5 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v5;
  }
  id v9 = objc_msgSend(v6, "subarrayWithRange:", 0, v8);
  id v10 = (void *)[v6 mutableCopy];

  [v10 removeObjectsInArray:v9];
  [(CKMessageTypeSearchController *)self setResultsToCheck:v10];
  id location = 0;
  objc_initWeak(&location, self);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__15;
  v25[4] = __Block_byref_object_dispose__15;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__15;
  v23[4] = __Block_byref_object_dispose__15;
  id v24 = 0;
  uint64_t v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  uint64_t v12 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke;
  block[3] = &unk_1E5623CF8;
  uint64_t v20 = v25;
  id v18 = v9;
  id v13 = v9;
  objc_copyWeak(&v22, &location);
  uint64_t v21 = v23;
  uint64_t v19 = v11;
  uint64_t v14 = v11;
  dispatch_async(v12, block);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke_3;
  v15[3] = &unk_1E5623D20;
  v15[4] = self;
  v15[5] = v23;
  objc_copyWeak(&v16, &location);
  v15[6] = v25;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], v15);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v22);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  objc_destroyWeak(&location);
}

void __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke_2;
  v9[3] = &unk_1E5623CD0;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  uint64_t v3 = objc_msgSend(v2, "__imArrayByFilteringWithBlock:", v9);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) arrayByApplyingSelector:sel_identifier];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  objc_destroyWeak(&v10);
}

uint64_t __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v5 = [WeakRetained itemsVerifiedOnDiskCache];
  uint64_t v6 = [v3 identifier];
  char v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [v3 item];
    id v10 = [v9 attributeSet];
    uint64_t v11 = [v10 contentURL];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v13 = [v11 path];
      uint64_t v8 = [v12 fileExistsAtPath:v13];
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  return v8;
}

void __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke_3(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    v2 = [*(id *)(a1 + 32) itemsVerifiedOnDiskCache];
    [v2 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  id v3 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v66 = [WeakRetained priorQueryIdentifier];

  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  v67 = [v5 currentQueryIdentifier];

  if (v66 && ![v66 isEqual:v67])
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = objc_loadWeakRetained(v3);
        *(_DWORD *)buf = 138412290;
        id v69 = (id)objc_opt_class();
        id v15 = v69;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%@ finished processing results for a stale query, resetting", buf, 0xCu);
      }
    }
    id v16 = objc_loadWeakRetained(v3);
    [v16 setPriorQueryIdentifier:0];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 56));
    [v6 setPriorQueryIdentifier:v67];

    id v7 = objc_loadWeakRetained((id *)(a1 + 56));
    unint64_t v8 = objc_msgSend(v7, "maxResultsForMode:", objc_msgSend(v7, "mode"));

    id v9 = objc_loadWeakRetained((id *)(a1 + 56));
    id v10 = [v9 results];
    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v12 = [v11 results];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1C978] array];
    }

    v17 = [v12 arrayByAddingObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    unint64_t v18 = [v17 count];
    unint64_t v19 = [v17 count];
    if (v8 >= v19) {
      unint64_t v20 = v19;
    }
    else {
      unint64_t v20 = v8;
    }
    id v16 = objc_msgSend(v17, "subarrayWithRange:", 0, v20);

    id v21 = objc_loadWeakRetained(v3);
    [v21 setResults:v16];

    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = objc_loadWeakRetained(v3);
        id v24 = (id)objc_opt_class();
        uint64_t v25 = [v16 count];
        id v26 = objc_loadWeakRetained(v3);
        id v27 = [v26 priorQueryIdentifier];
        *(_DWORD *)buf = 138412802;
        id v69 = v24;
        __int16 v70 = 2048;
        uint64_t v71 = v25;
        __int16 v72 = 2112;
        uint64_t v73 = (uint64_t)v27;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "%@ now has %lu results against query identifier %@", buf, 0x20u);
      }
    }
    id v28 = objc_loadWeakRetained(v3);
    int v29 = [v28 delegate];
    id v30 = objc_loadWeakRetained(v3);
    [v29 searchControllerContentsDidChange:v30];

    id v31 = objc_loadWeakRetained(v3);
    __int16 v32 = [v31 timingCollection];

    if (v32)
    {
      id v33 = objc_loadWeakRetained(v3);
      uint64_t v34 = [v33 timingCollection];
      v35 = NSString;
      id v36 = objc_loadWeakRetained(v3);
      v37 = [v35 stringWithFormat:@"%@-Search", objc_opt_class()];
      [v34 stopTimingForKey:v37];

      if (IMOSLoggingEnabled())
      {
        v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v39 = objc_loadWeakRetained(v3);
          unint64_t v40 = [v39 timingCollection];
          *(_DWORD *)buf = 138412290;
          id v69 = v40;
          _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "Timing for first batch %@", buf, 0xCu);
        }
      }
      id v41 = objc_loadWeakRetained(v3);
      [v41 setTimingCollection:0];
    }
    BOOL v42 = v18 > v8;
    id v43 = objc_loadWeakRetained(v3);
    if (([v43 searchTerminated] | v42) == 1)
    {

      goto LABEL_37;
    }
    id v44 = objc_loadWeakRetained(v3);
    long long v45 = [v44 resultsToCheck];
    BOOL v46 = [v45 count] == 0;

    if (v46)
    {
LABEL_37:
      id v57 = objc_loadWeakRetained(v3);
      [v57 setPriorQueryIdentifier:0];

      if (IMOSLoggingEnabled())
      {
        v58 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          id v59 = objc_loadWeakRetained(v3);
          id v60 = (id)objc_opt_class();
          id v61 = objc_loadWeakRetained(v3);
          if ([v61 searchTerminated]) {
            v62 = @"YES";
          }
          else {
            v62 = @"NO";
          }
          id v63 = objc_loadWeakRetained(v3);
          v64 = [v63 resultsToCheck];
          uint64_t v65 = [v64 count];
          *(_DWORD *)buf = 138412802;
          id v69 = v60;
          __int16 v70 = 2112;
          uint64_t v71 = (uint64_t)v62;
          __int16 v72 = 2048;
          uint64_t v73 = v65;
          _os_log_impl(&dword_18EF18000, v58, OS_LOG_TYPE_INFO, "%@ Terminating next chunk check, searchTerminated %@ resultsToCheck %lu", buf, 0x20u);
        }
      }
      goto LABEL_44;
    }
    if (IMOSLoggingEnabled())
    {
      long long v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        id v48 = objc_loadWeakRetained(v3);
        id v49 = (id)objc_opt_class();
        id v50 = objc_loadWeakRetained(v3);
        if ([v50 searchTerminated]) {
          v51 = @"YES";
        }
        else {
          v51 = @"NO";
        }
        id v52 = objc_loadWeakRetained(v3);
        __int16 v53 = [v52 resultsToCheck];
        uint64_t v54 = [v53 count];
        *(_DWORD *)buf = 138412802;
        id v69 = v49;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v51;
        __int16 v72 = 2048;
        uint64_t v73 = v54;
        _os_log_impl(&dword_18EF18000, v47, OS_LOG_TYPE_INFO, "%@ Kicking next chunk check, searchTerminated %@ resultsToCheck %lu", buf, 0x20u);
      }
    }
    id v55 = objc_loadWeakRetained(v3);
    unint64_t v56 = [v55 resultsToCheck];
    [v55 _asyncCheckIfResultsExistOnDisk:v56 firstBatch:0];
  }
LABEL_44:
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  return (id)[a3 domainIdentifier];
}

- (BOOL)wantsFooterSection
{
  if ([(CKSearchController *)self mode] != 3) {
    return 0;
  }

  return [(CKSearchController *)self hasMoreResults];
}

- (Class)footerClass
{
  return (Class)objc_opt_class();
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  id v3 = [(CKSearchController *)self delegate];
  [v3 parentMarginInsetsForSearchController:self];
  double v5 = v4;
  double v7 = v6;

  if ([(CKSearchController *)self mode] == 3
    || [(CKSearchController *)self mode] == 4
    || [(CKSearchController *)self mode] == 2)
  {
    double v7 = v5;
  }
  else
  {
    double v5 = 0.0;
  }
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = v5;
  double v11 = v7;
  result.trailing = v9;
  result.bottom = v11;
  result.leading = v8;
  result.top = v10;
  return result;
}

- (BOOL)wantsDeleteAction
{
  return [(CKSearchController *)self mode] == 3 || [(CKSearchController *)self mode] == 4;
}

- (id)menuElementsForResult:(id)a3 atIndexPath:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CKMessageTypeSearchController;
  id v13 = -[CKSearchController menuElementsForResult:atIndexPath:sourceRect:](&v24, sel_menuElementsForResult_atIndexPath_sourceRect_, v11, v12, x, y, width, height);
  if ([(CKMessageTypeSearchController *)self wantsDeleteAction])
  {
    id v14 = [MEMORY[0x1E4F42A80] systemImageNamed:@"trash"];
    id v15 = (void *)MEMORY[0x1E4F426E8];
    id v16 = CKFrameworkBundle();
    v17 = [v16 localizedStringForKey:@"SEARCH_DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__CKMessageTypeSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke;
    v21[3] = &unk_1E5623D48;
    v21[4] = self;
    id v22 = v11;
    id v23 = v12;
    unint64_t v18 = [v15 actionWithTitle:v17 image:v14 identifier:0 handler:v21];

    [v18 setAttributes:2];
    uint64_t v19 = [v13 arrayByAddingObject:v18];

    id v13 = (void *)v19;
  }

  return v13;
}

void __78__CKMessageTypeSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  double v4 = [*(id *)(a1 + 32) results];
  uint64_t v5 = [v4 indexOfObject:*(void *)(a1 + 40)];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = objc_loadWeakRetained(&location);
    double v7 = [v6 delegate];
    id v8 = objc_loadWeakRetained(&location);
    [v7 searchController:v8 requestsItemDeletionAtIndexPath:*(void *)(a1 + 48)];
  }
  objc_destroyWeak(&location);
}

- (void)deleteAttachmentForResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  id v6 = [v5 uniqueIdentifier];

  double v7 = IMMessageGuidFromIMFileTransferGuid();
  id v8 = [MEMORY[0x1E4F6BC30] sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CKMessageTypeSearchController_deleteAttachmentForResult___block_invoke;
  v11[3] = &unk_1E5623D70;
  v11[4] = self;
  id v12 = v6;
  id v13 = v4;
  id v9 = v4;
  id v10 = v6;
  [v8 loadMessageItemWithGUID:v7 completionBlock:v11];
}

void __59__CKMessageTypeSearchController_deleteAttachmentForResult___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    [v5 deleteChatItemWithTransferGUID:*(void *)(a1 + 40) fromMessageItem:v9];
  }
  [*(id *)(a1 + 32) removeResult:*(void *)(a1 + 48)];
  id v6 = *(void **)(a1 + 32);
  double v7 = [*(id *)(a1 + 48) identifier];
  [v6 removeFromCache:v7];

  id v8 = [*(id *)(a1 + 32) delegate];
  [v8 searchControllerContentsDidChange:*(void *)(a1 + 32)];
}

- (id)itemProviderForSearchResult:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 item];
    id v6 = [v5 attributeSet];
    double v7 = [v6 contentURL];

    if (v7)
    {
      id v8 = [v7 lastPathComponent];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithContentsOfURL:v7];
      [v9 setSuggestedName:v8];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v13 = 0;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Spotlight query result missing expected content URL", v13, 2u);
        }
      }
      id v9 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Unexpected nil search result when trying to create NSItemProvider", buf, 2u);
      }
    }
    id v9 = 0;
  }

  return v9;
}

- (void)removeFromCache:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessageTypeSearchController *)self itemsVerifiedOnDiskCache];
  [v5 removeObject:v4];
}

- (BOOL)isTokenizationSearchController
{
  return 0;
}

- (void)sendSyndicationActionForResult:(id)a3 actionType:(unsigned __int8)a4
{
  id v6 = a3;
  double v7 = [v6 item];
  id v8 = [(CKMessageTypeSearchController *)self chatGUIDForSearchableItem:v7];

  id v9 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  id v10 = [v9 existingChatWithGUID:v8];

  id v11 = [v6 item];
  id v12 = [v11 uniqueIdentifier];

  id v13 = [MEMORY[0x1E4F6BC30] sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__CKMessageTypeSearchController_sendSyndicationActionForResult_actionType___block_invoke;
  v17[3] = &unk_1E5623D98;
  id v18 = v12;
  id v19 = v10;
  unsigned __int8 v22 = a4;
  unint64_t v20 = self;
  id v21 = v6;
  id v14 = v6;
  id v15 = v10;
  id v16 = v12;
  [v13 loadMessageItemWithGUID:v16 completionBlock:v17];
}

void __75__CKMessageTypeSearchController_sendSyndicationActionForResult_actionType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (id)[*(id *)(a1 + 40) chatItems];
    id v8 = *(void **)(a1 + 40);
    id v33 = v5;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    id v10 = [v8 chatItemsForItems:v9];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = *(void **)(a1 + 40);
            uint64_t v17 = *(unsigned __int8 *)(a1 + 64);
            id v18 = v15;
            id v19 = [v18 guid];
            uint64_t v20 = [v18 messagePartRange];
            objc_msgSend(v16, "sendSyndicationAction:forMessagePartGUID:syndicatedMessagePartRange:", v17, v19, v20, v21);

            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __75__CKMessageTypeSearchController_sendSyndicationActionForResult_actionType___block_invoke_142;
            v26[3] = &unk_1E5620AF8;
            unsigned __int8 v22 = *(void **)(a1 + 56);
            void v26[4] = *(void *)(a1 + 48);
            id v27 = v22;
            dispatch_async(MEMORY[0x1E4F14428], v26);

            goto LABEL_12;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v24;
      __int16 v36 = 2112;
      uint64_t v37 = v25;
      _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Could not find message for messageGUID: %@, chat: %@", buf, 0x16u);
    }
  }
}

void __75__CKMessageTypeSearchController_sendSyndicationActionForResult_actionType___block_invoke_142(uint64_t a1)
{
  [*(id *)(a1 + 32) removeResult:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 searchControllerContentsDidChange:*(void *)(a1 + 32)];
}

- (BOOL)searchTerminated
{
  return self->_searchTerminated;
}

- (void)setSearchTerminated:(BOOL)a3
{
  self->_searchTerminated = a3;
}

- (NSSet)intermediaryResults
{
  return self->_intermediaryResults;
}

- (void)setIntermediaryResults:(id)a3
{
}

- (BOOL)gotResults
{
  return self->_gotResults;
}

- (void)setGotResults:(BOOL)a3
{
  self->_gotResults = a3;
}

- (NSString)priorQueryIdentifier
{
  return self->_priorQueryIdentifier;
}

- (void)setPriorQueryIdentifier:(id)a3
{
}

- (NSArray)resultsToCheck
{
  return self->_resultsToCheck;
}

- (void)setResultsToCheck:(id)a3
{
}

- (IMTimingCollection)timingCollection
{
  return self->_timingCollection;
}

- (void)setTimingCollection:(id)a3
{
}

- (NSMutableSet)itemsVerifiedOnDiskCache
{
  return self->_itemsVerifiedOnDiskCache;
}

- (void)setItemsVerifiedOnDiskCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsVerifiedOnDiskCache, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
  objc_storeStrong((id *)&self->_resultsToCheck, 0);
  objc_storeStrong((id *)&self->_priorQueryIdentifier, 0);

  objc_storeStrong((id *)&self->_intermediaryResults, 0);
}

@end