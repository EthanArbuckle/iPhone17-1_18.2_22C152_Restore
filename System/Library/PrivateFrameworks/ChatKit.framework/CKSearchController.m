@interface CKSearchController
+ (BOOL)isVisibleInCollectionView;
+ (BOOL)previewControllerPresentsModally;
+ (BOOL)supportsMacSelection;
+ (BOOL)supportsMenuInteraction;
+ (BOOL)supportsQuicklookForResult:(id)a3;
+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3;
+ (Class)cellClassForMode:(unint64_t)a3;
+ (id)indexingString;
+ (id)reuseIdentifierForMode:(unint64_t)a3;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
+ (id)supportedCellClasses;
+ (int64_t)orthogonalScrollingBehavior;
+ (unint64_t)recencyRankedTargetResultCount;
- (BOOL)_currentModeIsDetails;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)handleSelectionForResult:(id)a3;
- (BOOL)hasMoreResults;
- (BOOL)isTokenizationSearchController;
- (BOOL)queryRunning;
- (BOOL)shouldIncludeResultsIfFiltered;
- (BOOL)shouldResetSearchResultsWhenEnded;
- (BOOL)shouldStartMenuInteractionForResult:(id)a3;
- (BOOL)suppressAvatars;
- (BOOL)useSemanticQuery;
- (BOOL)wantsFooterSection;
- (BOOL)wantsHeaderSection;
- (CKQLPreviewControllerDataSource)qlPreviewDataSource;
- (CKSearchControllerDelegate)delegate;
- (CSSearchQuery)query;
- (Class)footerClass;
- (Class)headerOverrideClass;
- (NSArray)results;
- (NSDirectionalEdgeInsets)additionalGroupInsets;
- (NSString)currentQueryIdentifier;
- (NSString)currentSearchText;
- (double)interGroupSpacing;
- (id)_activityItemProviderForResult:(id)a3;
- (id)_additionalMenuElementsForResult:(id)a3;
- (id)_overridingMenuElementsForResult:(id)a3;
- (id)_queryContextWithText:(id)a3;
- (id)_queryStringWithText:(id)a3;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)customLayoutSectionForEnvironment:(id)a3;
- (id)detailsFilterQueriesForChatGUIDs:(id)a3;
- (id)fetchAttributes;
- (id)filterQueries;
- (id)itemProviderForSearchResult:(id)a3;
- (id)layoutGroupWithEnvironment:(id)a3;
- (id)menuElementsForResult:(id)a3 atIndexPath:(id)a4 sourceRect:(CGRect)a5;
- (id)navigationBarTitleSummaryForSearchText:(id)a3;
- (id)previewViewControllerForResult:(id)a3;
- (id)queryAttributesForText:(id)a3;
- (id)queryCompletionHandler;
- (id)queryFoundItemHandler;
- (id)queryResultsForItems:(id)a3;
- (id)rankingQueriesWithText:(id)a3;
- (id)tokenQueryStringForSearchController:(id)a3;
- (id)zkwFilterQueries;
- (unint64_t)layoutWidth;
- (unint64_t)maxResultsForMode:(unint64_t)a3;
- (unint64_t)mode;
- (unint64_t)queriedResultsCount;
- (unint64_t)queryTypeForSearchText:(id)a3;
- (unint64_t)searchTokenContentType;
- (void)cancelCurrentSearch;
- (void)didSelectResult:(id)a3 visibleResults:(id)a4;
- (void)removeResult:(id)a3;
- (void)searchEnded;
- (void)searchWithText:(id)a3 mode:(unint64_t)a4;
- (void)setCurrentQueryIdentifier:(id)a3;
- (void)setCurrentSearchText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setQlPreviewDataSource:(id)a3;
- (void)setQueriedResultsCount:(unint64_t)a3;
- (void)setQuery:(id)a3;
- (void)setQueryCompletionHandler:(id)a3;
- (void)setQueryFoundItemHandler:(id)a3;
- (void)setQueryRunning:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)setSuppressAvatars:(BOOL)a3;
@end

@implementation CKSearchController

- (void)setDelegate:(id)a3
{
}

+ (BOOL)isVisibleInCollectionView
{
  return 1;
}

- (void)setQlPreviewDataSource:(id)a3
{
}

- (id)queryAttributesForText:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)fetchAttributes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)tokenQueryStringForSearchController:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = [(CKSearchController *)self delegate];
  v5 = [v4 searchTokenFiltersForSearchController:self];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "contentType", (void)v17))
        {
          if ([v12 contentType] != 8) {
            continue;
          }
          uint64_t v13 = [v12 queryStringForDateTypeSearch];
        }
        else
        {
          uint64_t v13 = [v12 queryStringForConversationSearch];
        }
        v14 = (void *)v13;
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v9)
      {
LABEL_14:

        break;
      }
    }
  }
  v15 = +[CKSpotlightQueryUtilities queryStringFromSubqueries:combineOperator:](CKSpotlightQueryUtilities, "queryStringFromSubqueries:combineOperator:", v6, 1, (void)v17);

  return v15;
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  return 0;
}

- (BOOL)useSemanticQuery
{
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSemanticSearchEnabled];

  return v4
      && ![(CKSearchController *)self _currentModeIsDetails]
      && [(CKSearchController *)self mode] != 1;
}

- (BOOL)hasMoreResults
{
  v2 = [(CKSearchController *)self results];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)filterQueries
{
  return 0;
}

- (id)zkwFilterQueries
{
  return 0;
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  return 0;
}

- (id)rankingQueriesWithText:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3
{
  return 0;
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 0;
}

+ (BOOL)supportsMenuInteraction
{
  return 1;
}

+ (BOOL)supportsMacSelection
{
  return 0;
}

+ (BOOL)previewControllerPresentsModally
{
  return 0;
}

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  return 1;
}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 0;
}

- (id)navigationBarTitleSummaryForSearchText:(id)a3
{
  id v3 = a3;
  int v4 = [(id)objc_opt_class() sectionTitle];
  if ([v3 length])
  {
    v5 = NSString;
    id v6 = CKFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"SEARCH_RESULTS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", v7, v3, v4);

    uint64_t v9 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v10 = [v9 userInterfaceLayoutDirection];

    if (v10 == 1) {
      v11 = @"\u200F";
    }
    else {
      v11 = @"\u200E";
    }
    id v12 = [(__CFString *)v11 stringByAppendingString:v8];
  }
  else
  {
    id v12 = v4;
  }

  return v12;
}

+ (id)sectionTitle
{
  return 0;
}

+ (id)sectionIdentifier
{
  return 0;
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return 0;
}

+ (id)indexingString
{
  return 0;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return 0;
}

+ (id)supportedCellClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[a1 cellClassForMode:0];
  if (v2)
  {
    v4[0] = v2;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }

  return v2;
}

- (double)interGroupSpacing
{
  return 0.0;
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  double v2 = *MEMORY[0x1E4F424F0];
  double v3 = *(double *)(MEMORY[0x1E4F424F0] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F424F0] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F424F0] + 24);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (int64_t)orthogonalScrollingBehavior
{
  return 0;
}

- (BOOL)wantsHeaderSection
{
  if (CKIsRunningInMacCatalyst()) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = [(CKSearchController *)self mode] != 2 && [(CKSearchController *)self mode] != 4;
  }
  double v4 = [(CKSearchController *)self results];
  uint64_t v5 = [v4 count];

  return v5 && v3;
}

- (BOOL)wantsFooterSection
{
  return 0;
}

- (Class)headerOverrideClass
{
  return 0;
}

- (Class)footerClass
{
  return 0;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)customLayoutSectionForEnvironment:(id)a3
{
  return 0;
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  return 0;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [v7 row];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v10 = [(CKSearchController *)self reuseIdentifierForIndex:v9];
  }
  else
  {
    uint64_t v10 = objc_msgSend((id)objc_opt_class(), "reuseIdentifierForMode:", -[CKSearchController mode](self, "mode"));
  }
  v11 = (void *)v10;
  id v12 = [v8 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v7];

  uint64_t v13 = [(CKSearchController *)self results];
  unint64_t v14 = [v13 count];

  if (v9 >= v14)
  {
    v16 = 0;
  }
  else
  {
    v15 = [(CKSearchController *)self results];
    v16 = [v15 objectAtIndex:v9];
  }
  long long v17 = [(CKSearchController *)self currentSearchText];
  objc_msgSend(v12, "configureWithQueryResult:searchText:mode:", v16, v17, -[CKSearchController mode](self, "mode"));

  return v12;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  return 0;
}

- (unint64_t)queryTypeForSearchText:(id)a3
{
  return 0;
}

- (unint64_t)layoutWidth
{
  BOOL v3 = [(CKSearchController *)self delegate];
  [v3 containerWidthForController:self];
  double v5 = v4;

  id v6 = +[CKUIBehavior sharedBehaviors];
  [v6 searchCellPreferredWidth];
  double v8 = v7;

  if (CKIsRunningInMacCatalyst())
  {
    if ([(CKSearchController *)self mode] == 3 || [(CKSearchController *)self mode] == 4) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else
  {
    uint64_t v10 = +[CKUIBehavior sharedBehaviors];
    char v11 = [v10 isAccessibilityPreferredContentSizeCategory];

    unint64_t result = 0;
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = (uint64_t)(v5 / v8);
      if (v12 >= 2)
      {
        if (v12 == 2) {
          return 1;
        }
        else {
          return 2;
        }
      }
    }
  }
  return result;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  [(CKSearchController *)self setMode:a4];
  [(CKSearchController *)self cancelCurrentSearch];
  if ([(CKSearchController *)self useSemanticQuery])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F23890]);
    double v8 = [(CKSearchController *)self _queryContextWithText:v6];
    unint64_t v9 = (void *)[v7 initWithUserQueryString:v6 userQueryContext:v8];
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F23828]);
    double v8 = [(CKSearchController *)self _queryStringWithText:v6];
    char v11 = [(CKSearchController *)self _queryContextWithText:v6];
    unint64_t v9 = (void *)[v10 initWithQueryString:v8 context:v11];
  }
  uint64_t v12 = [(CKSearchController *)self queryFoundItemHandler];
  [v9 setFoundItemsHandler:v12];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__CKSearchController_searchWithText_mode___block_invoke;
  v13[3] = &unk_1E5626E68;
  v13[4] = self;
  [v9 setCompletionHandler:v13];
  [(CKSearchController *)self setQuery:v9];
  [(CKSearchController *)self setCurrentSearchText:v6];
  [(CKSearchController *)self setQueryRunning:1];
  [v9 start];
}

void __42__CKSearchController_searchWithText_mode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    double v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = [*(id *)(a1 + 32) queryCompletionHandler];
      double v8 = _Block_copy(v7);
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      unint64_t v14 = v8;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Query returned for %@. Calling handler {%@}.", (uint8_t *)&v11, 0x16u);
    }
  }
  unint64_t v9 = [*(id *)(a1 + 32) queryCompletionHandler];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) queryCompletionHandler];
    ((void (**)(void, id))v10)[2](v10, v3);
  }
}

- (void)setQuery:(id)a3
{
  id v8 = a3;
  id v5 = [(CKSearchController *)self query];

  if (v5 != v8)
  {
    objc_storeStrong((id *)&self->_query, a3);
    if (self->_query)
    {
      id v6 = [NSString stringGUID];
      currentQueryIdentifier = self->_currentQueryIdentifier;
      self->_currentQueryIdentifier = v6;
    }
    else
    {
      currentQueryIdentifier = self->_currentQueryIdentifier;
      self->_currentQueryIdentifier = 0;
    }
  }
}

- (id)_queryStringWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchController *)self queryAttributesForText:v4];
  id v6 = +[CKSpotlightQueryUtilities queryStringForSearchString:v4 attributes:v5 matchType:[(CKSearchController *)self queryTypeForSearchText:v4]];

  return v6;
}

- (id)_queryContextWithText:(id)a3
{
  id v4 = a3;
  if ([(CKSearchController *)self useSemanticQuery])
  {
    uint64_t v5 = [MEMORY[0x1E4F23898] userQueryContext];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v6 = (void *)v5;
  id v7 = [(CKSearchController *)self fetchAttributes];
  [v6 setFetchAttributes:v7];

  id v8 = [(CKSearchController *)self filterQueries];
  if ([(CKSearchController *)self mode] == 1)
  {
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F1C978] array];
    }
    unint64_t v9 = [(CKSearchController *)self zkwFilterQueries];
    uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];
    goto LABEL_13;
  }
  if ([(CKSearchController *)self _currentModeIsDetails])
  {
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F1C978] array];
    }
    int v11 = [(CKSearchController *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      __int16 v13 = [(CKSearchController *)self delegate];
      unint64_t v9 = [v13 searchControllerChatGUIDsForDetailsSearch:self];

      uint64_t v14 = [(CKSearchController *)self detailsFilterQueriesForChatGUIDs:v9];
      uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v14];

      id v8 = (void *)v14;
LABEL_13:

      id v8 = (void *)v10;
    }
  }
  if (![(CKSearchController *)self isTokenizationSearchController])
  {
    uint64_t v15 = [(CKSearchController *)self tokenQueryStringForSearchController:self];
    uint64_t v16 = [v15 length];
    if (v8)
    {
      if (v16)
      {
        uint64_t v17 = [v8 arrayByAddingObject:v15];

        id v8 = (void *)v17;
      }
    }
    else if (v16)
    {
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
    }
    else
    {
      id v8 = 0;
    }
  }
  if ([(CKSearchController *)self useSemanticQuery])
  {
    [v6 setEnableRankedResults:1];
  }
  else
  {
    long long v18 = [(CKSearchController *)self rankingQueriesWithText:v4];
    [v6 setRankingQueries:v18];
  }
  [v6 setFilterQueries:v8];
  if (objc_msgSend((id)objc_opt_class(), "useRecencyRankedSearchForMode:", -[CKSearchController mode](self, "mode")))
  {
    objc_msgSend(v6, "setMaxCount:", objc_msgSend((id)objc_opt_class(), "recencyRankedTargetResultCount"));
    if ([(CKSearchController *)self useSemanticQuery]) {
      objc_msgSend(v6, "setMaxRankedResultCount:", objc_msgSend((id)objc_opt_class(), "recencyRankedTargetResultCount"));
    }
  }
  [v6 setDisableBlockingOnIndex:1];
  [v6 setBundleIDs:&unk_1EDF15380];

  return v6;
}

- (BOOL)_currentModeIsDetails
{
  return [(CKSearchController *)self mode] == 3 || [(CKSearchController *)self mode] == 4;
}

- (void)cancelCurrentSearch
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      char v12 = "-[CKSearchController cancelCurrentSearch]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%@ - %s", (uint8_t *)&v9, 0x16u);
    }
  }
  id v6 = [(CKSearchController *)self query];
  [v6 cancel];

  id v7 = [(CKSearchController *)self query];
  [v7 setFoundItemHandler:0];

  id v8 = [(CKSearchController *)self query];
  [v8 setCompletionHandler:0];

  [(CKSearchController *)self setQuery:0];
}

- (void)searchEnded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412546;
      id v5 = (id)objc_opt_class();
      __int16 v6 = 2080;
      id v7 = "-[CKSearchController searchEnded]";
      id v3 = v5;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%@ %s - Implement in subclass", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (BOOL)shouldResetSearchResultsWhenEnded
{
  if (CKIsRunningInMacCatalyst()) {
    return 1;
  }
  unint64_t v4 = [(CKSearchController *)self mode];
  unint64_t v5 = [(CKSearchController *)self mode];
  return v4 == 1 || v5 == 0;
}

- (BOOL)shouldIncludeResultsIfFiltered
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSearchTokensEnabled];

  if (v4)
  {
    unint64_t v5 = [(CKSearchController *)self delegate];
    __int16 v6 = [v5 searchTokenFiltersForSearchController:self];

    if ([v6 count])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        char v10 = 0;
        uint64_t v11 = *(void *)v19;
        char v12 = 1;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v15 = objc_msgSend(v14, "contentType", (void)v18);
            BOOL v16 = v15 == [(CKSearchController *)self searchTokenContentType];
            if ([v14 contentType]) {
              v12 &= [v14 contentType] == 8;
            }
            v10 |= v16;
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }
      else
      {
        char v10 = 0;
        char v12 = 1;
      }

      if ([(CKSearchController *)self searchTokenContentType]) {
        v12 |= v10;
      }
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 1;
  }
  return v12 & 1;
}

- (unint64_t)searchTokenContentType
{
  return 9;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  return 0;
}

- (id)queryResultsForItems:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)menuElementsForResult:(id)a3 atIndexPath:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [(CKSearchController *)self _overridingMenuElementsForResult:v11];
  if ([v13 count])
  {
    id v14 = v13;
  }
  else
  {
    v35 = [MEMORY[0x1E4F42A80] systemImageNamed:@"doc.on.doc"];
    uint64_t v32 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.and.arrow.up"];
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v15 = (void *)MEMORY[0x1E4F426E8];
    BOOL v16 = CKFrameworkBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"SEARCH_COPY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __67__CKSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke;
    v39[3] = &unk_1E5624B40;
    v39[4] = self;
    id v18 = v11;
    id v40 = v18;
    v34 = [v15 actionWithTitle:v17 image:v35 identifier:0 handler:v39];

    id v19 = objc_loadWeakRetained(&location);
    long long v20 = [v19 _activityItemProviderForResult:v18];

    if (v20)
    {
      long long v21 = (void *)MEMORY[0x1E4F426E8];
      uint64_t v22 = CKFrameworkBundle();
      uint64_t v23 = [v22 localizedStringForKey:@"SEARCH_SHARE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __67__CKSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke_2;
      v36[3] = &unk_1E5626E90;
      id v37 = v20;
      objc_copyWeak(v38, &location);
      v38[1] = *(id *)&x;
      v38[2] = *(id *)&y;
      v38[3] = *(id *)&width;
      v38[4] = *(id *)&height;
      v24 = [v21 actionWithTitle:v23 image:v32 identifier:0 handler:v36];

      objc_destroyWeak(v38);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = [v18 identifier];
          *(_DWORD *)buf = 138412290;
          v43 = v26;
          _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Unable to generate share content for result: %@", buf, 0xCu);
        }
      }
      v24 = 0;
    }
    v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v34, v32);
    v28 = v27;
    if (v24) {
      [v27 addObject:v24];
    }
    v29 = [(CKSearchController *)self _additionalMenuElementsForResult:v18];
    if (!v29)
    {
      v29 = [MEMORY[0x1E4F1C978] array];
    }
    if (CKIsRunningInMacCatalyst())
    {
      v30 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v28];
      id v14 = [v29 arrayByAddingObject:v30];
    }
    else
    {
      id v14 = [v29 arrayByAddingObjectsFromArray:v28];
    }

    objc_destroyWeak(&location);
  }

  return v14;
}

void __67__CKSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) itemProviderForSearchResult:*(void *)(a1 + 40)];
  if (v1)
  {
    double v2 = [MEMORY[0x1E4F42C50] generalPasteboard];
    v4[0] = v1;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
    [v2 setItemProviders:v3];
  }
}

void __67__CKSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v8[0] = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  int v4 = (void *)[v2 initWithActivityItems:v3 applicationActivities:0];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v6 = [WeakRetained delegate];
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "searchController:requestsPresentationOfShareController:atRect:", v7, v4, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)previewViewControllerForResult:(id)a3
{
  return 0;
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  unint64_t v5 = [v3 array];
  __int16 v6 = [v4 item];

  id v7 = [v6 attributeSet];

  uint64_t v8 = [v7 contentURL];
  uint64_t v9 = (void *)[v5 copy];

  return v9;
}

- (id)_overridingMenuElementsForResult:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)itemProviderForSearchResult:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unint64_t v5 = (objc_class *)objc_opt_class();
      __int16 v6 = NSStringFromClass(v5);
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "This should be overridden for this search controller: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return 0;
}

- (id)_activityItemProviderForResult:(id)a3
{
  return 0;
}

- (void)didSelectResult:(id)a3 visibleResults:(id)a4
{
  id v5 = a3;
  __int16 v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isSemanticSearchEnabled];

  if (v7)
  {
    uint64_t v8 = [(CKSearchController *)self query];
    if (v8
      && (uint64_t v9 = (void *)v8,
          [(CKSearchController *)self results],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 containsObject:v5],
          v10,
          v9,
          v11))
    {
      id v12 = [v5 item];
      uint64_t v13 = [(CKSearchController *)self query];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v15 = [(CKSearchController *)self query];
        BOOL v16 = [(CKSearchController *)self results];
        uint64_t v17 = [v16 arrayByApplyingSelector:sel_item];

        [v15 userEngagedWithItem:v12 visibleItems:v17 userInteractionType:0];
      }
    }
    else
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[CKSearchController didSelectResult:visibleResults:]((uint64_t)self, v12);
      }
    }
  }
}

- (BOOL)handleSelectionForResult:(id)a3
{
  return 0;
}

- (BOOL)isTokenizationSearchController
{
  return 0;
}

- (void)removeResult:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchController *)self results];
  id v6 = (id)[v5 mutableCopy];

  [v6 removeObject:v4];
  [(CKSearchController *)self setResults:v6];
}

- (CKSearchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSearchControllerDelegate *)WeakRetained;
}

- (NSString)currentSearchText
{
  return self->_currentSearchText;
}

- (void)setCurrentSearchText:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (CSSearchQuery)query
{
  return self->_query;
}

- (NSString)currentQueryIdentifier
{
  return self->_currentQueryIdentifier;
}

- (void)setCurrentQueryIdentifier:(id)a3
{
}

- (id)queryFoundItemHandler
{
  return self->_queryFoundItemHandler;
}

- (void)setQueryFoundItemHandler:(id)a3
{
}

- (id)queryCompletionHandler
{
  return self->_queryCompletionHandler;
}

- (void)setQueryCompletionHandler:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (unint64_t)queriedResultsCount
{
  return self->_queriedResultsCount;
}

- (void)setQueriedResultsCount:(unint64_t)a3
{
  self->_queriedResultsCount = a3;
}

- (BOOL)suppressAvatars
{
  return self->_suppressAvatars;
}

- (void)setSuppressAvatars:(BOOL)a3
{
  self->_suppressAvatars = a3;
}

- (CKQLPreviewControllerDataSource)qlPreviewDataSource
{
  return self->_qlPreviewDataSource;
}

- (BOOL)queryRunning
{
  return self->_queryRunning;
}

- (void)setQueryRunning:(BOOL)a3
{
  self->_queryRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qlPreviewDataSource, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong(&self->_queryFoundItemHandler, 0);
  objc_storeStrong((id *)&self->_currentQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_currentSearchText, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didSelectResult:(uint64_t)a1 visibleResults:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18EF18000, a2, OS_LOG_TYPE_FAULT, "Search controller %@ was told user interacted with item, but no active query is running or index out of bounds", (uint8_t *)&v2, 0xCu);
}

@end