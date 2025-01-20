@interface CKConversationSearchController
+ (BOOL)_shouldUseAvatarCellsForMode:(unint64_t)a3;
+ (BOOL)supportsMenuInteraction;
+ (BOOL)supportsQuicklookForResult:(id)a3;
+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3;
+ (Class)cellClassForMode:(unint64_t)a3;
+ (id)reuseIdentifierForMode:(unint64_t)a3;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
+ (id)supportedCellClasses;
+ (unint64_t)recencyRankedTargetResultCount;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)gotResults;
- (BOOL)isTokenizationSearchController;
- (BOOL)searchTerminated;
- (BOOL)useSemanticQuery;
- (BOOL)wantsHeaderSection;
- (NSArray)currentZKWSuggestions;
- (NSDirectionalEdgeInsets)additionalGroupInsets;
- (NSSet)intermediaryResults;
- (_PSSuggester)zkwSuggester;
- (double)interGroupSpacing;
- (double)widthForDeterminingAvatarVisibility;
- (id)_additionalMenuElementsForResult:(id)a3;
- (id)_appendRecencyToRankingQuery:(id)a3 hours:(unint64_t)a4;
- (id)_sortedAndRankedItemsWithItems:(id)a3;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)customLayoutSectionForEnvironment:(id)a3;
- (id)fetchAttributes;
- (id)filterQueries;
- (id)layoutGroupWithEnvironment:(id)a3;
- (id)navigationBarTitleSummaryForSearchText:(id)a3;
- (id)queryAttributesForText:(id)a3;
- (id)queryResultsForItems:(id)a3;
- (id)rankingQueriesWithText:(id)a3;
- (id)tokenizedQueryResultsForItems:(id)a3;
- (unint64_t)maxResultsForMode:(unint64_t)a3;
- (unint64_t)searchTokenContentType;
- (void)_searchZKWWithText:(id)a3 mode:(unint64_t)a4;
- (void)didSelectResult:(id)a3 visibleResults:(id)a4;
- (void)searchEnded;
- (void)searchSpotlightWithText:(id)a3 mode:(unint64_t)a4;
- (void)searchWithText:(id)a3 mode:(unint64_t)a4;
- (void)setCurrentZKWSuggestions:(id)a3;
- (void)setGotResults:(BOOL)a3;
- (void)setIntermediaryResults:(id)a3;
- (void)setSearchTerminated:(BOOL)a3;
- (void)setZkwSuggester:(id)a3;
@end

@implementation CKConversationSearchController

- (id)fetchAttributes
{
  v7[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F235C0];
  v7[0] = *MEMORY[0x1E4F234B0];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F230F0];
  v7[2] = *MEMORY[0x1E4F23498];
  v7[3] = v3;
  v7[4] = *MEMORY[0x1E4F22A10];
  v7[5] = @"com_apple_mobilesms_chatStyle";
  uint64_t v4 = *MEMORY[0x1E4F23788];
  v7[6] = *MEMORY[0x1E4F23088];
  v7[7] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:8];

  return v5;
}

- (id)queryAttributesForText:(id)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F235C0];
  v6[0] = *MEMORY[0x1E4F234B0];
  v6[1] = v3;
  v6[2] = *MEMORY[0x1E4F23498];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];

  return v4;
}

- (unint64_t)searchTokenContentType
{
  return 0;
}

+ (BOOL)_shouldUseAvatarCellsForMode:(unint64_t)a3
{
  return a3 < 2;
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  if (a3 - 2 < 3) {
    return 0x7FFFFFFFLL;
  }
  if (a3 > 1) {
    return 0;
  }
  if ([(CKSearchController *)self layoutWidth]) {
    return 4;
  }
  return 3;
}

- (BOOL)useSemanticQuery
{
  return 0;
}

- (id)filterQueries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F22D28], @"chatDomain""];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)rankingQueriesWithText:(id)a3
{
  v18[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSString;
  uint64_t v5 = *MEMORY[0x1E4F23088];
  uint64_t v6 = *MEMORY[0x1E4F234B0];
  id v7 = a3;
  v8 = [v4 stringWithFormat:@"(%@ == \"%@\"", v5, MEMORY[0x1E4F1CC28], v6, v7];
  uint64_t v9 = *MEMORY[0x1E4F235C0];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  v11 = [NSString stringWithFormat:@"(%@ == \"%@\"", v5, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F235C0], v7];
  v12 = [NSString stringWithFormat:@"(%@ == \"%@\"", v5, v10, v6, v7, v9];

  v13 = [(CKConversationSearchController *)self _appendRecencyToRankingQuery:v8 hours:24];
  v14 = [(CKConversationSearchController *)self _appendRecencyToRankingQuery:v11 hours:24];
  v15 = [(CKConversationSearchController *)self _appendRecencyToRankingQuery:v12 hours:24];
  v18[0] = v12;
  v18[1] = v11;
  v18[2] = v8;
  v18[3] = v15;
  v18[4] = v14;
  v18[5] = v13;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:6];

  return v16;
}

+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3
{
  return 1;
}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 10;
}

- (id)_appendRecencyToRankingQuery:(id)a3 hours:(unint64_t)a4
{
  if (a3)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@ && (InRange(%@, $time.now(-%ld), $time.now))", a3, *MEMORY[0x1E4F230F0], 3600 * a4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  if ([(CKSearchController *)self shouldIncludeResultsIfFiltered])
  {
    if (a4 == 1) {
      [(CKConversationSearchController *)self _searchZKWWithText:v6 mode:1];
    }
    else {
      [(CKConversationSearchController *)self searchSpotlightWithText:v6 mode:a4];
    }
  }
  else
  {
    [(CKSearchController *)self setResults:0];
  }
}

- (void)_searchZKWWithText:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  [(CKSearchController *)self setMode:a4];
  [(CKSearchController *)self setCurrentSearchText:v6];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Performing ZKW search!", buf, 2u);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v8 startTimingForKey:@"zkwConvoSearch"];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  uint64_t v9 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke;
  block[3] = &unk_1E5628EA8;
  block[4] = self;
  v15[1] = (id)a4;
  objc_copyWeak(v15, (id *)buf);
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

void __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke(id *a1)
{
  uint64_t v2 = (objc_class *)MEMORY[0x192FBA860](@"_PSPredictionContext", @"PeopleSuggester");
  if (v2)
  {
    id v3 = objc_alloc_init(v2);
    [v3 setBundleID:@"com.apple.MobileSMS"];
    uint64_t v4 = [a1[4] zkwSuggester];
    if (objc_opt_respondsToSelector())
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Using CD for ZKW!", buf, 2u);
        }
      }
      id v6 = [v4 rankedZKWSuggestionsFromContext:v3];
      [a1[4] setCurrentZKWSuggestions:v6];
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke_110;
      block[3] = &unk_1E5628E80;
      id v8 = a1[4];
      v20[1] = a1[8];
      block[4] = v8;
      id v17 = v6;
      id v9 = v6;
      objc_copyWeak(v20, a1 + 7);
      id v18 = v7;
      id v19 = a1[5];
      id v10 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(v20);
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke_113;
      v13[3] = &unk_1E56233A0;
      objc_copyWeak(v15, a1 + 7);
      id v11 = a1[6];
      id v12 = a1[8];
      id v14 = v11;
      v15[1] = v12;
      dispatch_async(MEMORY[0x1E4F14428], v13);

      objc_destroyWeak(v15);
    }
  }
}

void __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke_110(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v24 = [*(id *)(a1 + 32) maxResultsForMode:*(void *)(a1 + 72)];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v26;
LABEL_3:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v26 != v3) {
        objc_enumerationMutation(obj);
      }
      uint64_t v5 = [*(id *)(*((void *)&v25 + 1) + 8 * v4) conversationIdentifier];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      id v7 = [WeakRetained delegate];
      id v8 = objc_loadWeakRetained((id *)(a1 + 64));
      id v9 = [v7 searchController:v8 conversationForChatGUID:v5];

      if (v9)
      {
        id v10 = [CKZKWQueryResult alloc];
        id v11 = objc_loadWeakRetained((id *)(a1 + 64));
        id v12 = [(id)objc_opt_class() sectionIdentifier];
        id v13 = [(CKZKWQueryResult *)v10 initWithSearchableItem:0 inSection:v12 withConversation:v9];

        [*(id *)(a1 + 48) addObject:v13];
      }
      BOOL v14 = [*(id *)(a1 + 48) count] < v24;

      if (!v14) {
        break;
      }
      if (v2 == ++v4)
      {
        uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v2) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [*(id *)(a1 + 56) stopTimingForKey:@"zkwConvoSearch"];
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v16;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "ZKW convo timing %@", buf, 0xCu);
    }
  }
  id v17 = (id *)(a1 + 64);
  id v18 = objc_loadWeakRetained((id *)(a1 + 64));
  id v19 = [*(id *)(a1 + 48) array];
  [v18 setResults:v19];

  id v20 = objc_loadWeakRetained(v17);
  v21 = [v20 delegate];
  id v22 = objc_loadWeakRetained(v17);
  [v21 searchControllerContentsDidChange:v22];
}

void __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke_113(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Using Spotlight for ZKW!", v4, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained searchSpotlightWithText:*(void *)(a1 + 32) mode:*(void *)(a1 + 48)];
}

- (_PSSuggester)zkwSuggester
{
  zkwSuggester = self->_zkwSuggester;
  if (!zkwSuggester)
  {
    uint64_t v4 = (_PSSuggester *)objc_alloc_init((Class)MEMORY[0x192FBA860](@"_PSSuggester", @"PeopleSuggester"));
    uint64_t v5 = self->_zkwSuggester;
    self->_zkwSuggester = v4;

    zkwSuggester = self->_zkwSuggester;
  }

  return zkwSuggester;
}

- (void)didSelectResult:(id)a3 visibleResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CKConversationSearchController;
  [(CKSearchController *)&v23 didSelectResult:v6 visibleResults:v7];
  id v8 = (void *)MEMORY[0x192FBA860](@"_PSMessagesZkwFeedback", @"PeopleSuggester");
  id location = 0;
  objc_initWeak(&location, self);
  id v9 = [v6 conversation];
  id v10 = [v9 chat];
  id v11 = [v10 guid];

  id v12 = [(CKConversationSearchController *)self currentZKWSuggestions];
  if ([v12 count])
  {
    id v13 = [(CKConversationSearchController *)self currentZKWSuggestions];
    BOOL v14 = (void *)[v13 copy];
  }
  else
  {
    BOOL v14 = [MEMORY[0x1E4F1C978] array];
  }

  v15 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CKConversationSearchController_didSelectResult_visibleResults___block_invoke;
  block[3] = &unk_1E5628ED0;
  v21[1] = v8;
  id v19 = v11;
  id v20 = v14;
  id v16 = v14;
  id v17 = v11;
  objc_copyWeak(v21, &location);
  dispatch_async(v15, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __65__CKConversationSearchController_didSelectResult_visibleResults___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(*(Class *)(a1 + 56)) initWithChatGuidEngagaged:*(void *)(a1 + 32) suggestions:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained zkwSuggester];
  [v4 provideFeedbackForMessagesZkwSuggestions:v2];

  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [*(id *)(a1 + 40) count];
      int v8 = 136315650;
      id v9 = "-[CKConversationSearchController didSelectResult:visibleResults:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s submitted PS feedback for guid %@ currently maintaining %lu zkw results", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)searchSpotlightWithText:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke;
  aBlock[3] = &unk_1E5623920;
  objc_copyWeak(&v13, &location);
  uint64_t v7 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_2;
  v10[3] = &unk_1E5623CA8;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  int v8 = _Block_copy(v10);
  [(CKConversationSearchController *)self setSearchTerminated:0];
  [(CKConversationSearchController *)self setIntermediaryResults:0];
  [(CKSearchController *)self setQueryFoundItemHandler:v7];
  [(CKSearchController *)self setQueryCompletionHandler:v8];
  [(CKConversationSearchController *)self setGotResults:0];
  v9.receiver = self;
  v9.super_class = (Class)CKConversationSearchController;
  [(CKSearchController *)&v9 searchWithText:v6 mode:a4];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  char v5 = [WeakRetained searchTerminated];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 setGotResults:1];

    id v7 = objc_loadWeakRetained(v3);
    int v8 = [v7 intermediaryResults];
    if (v8)
    {
      id v9 = objc_loadWeakRetained(v3);
      __int16 v10 = [v9 intermediaryResults];
    }
    else
    {
      __int16 v10 = [MEMORY[0x1E4F1CAD0] set];
    }

    id v11 = [v10 setByAddingObjectsFromArray:v13];

    id v12 = objc_loadWeakRetained(v3);
    [v12 setIntermediaryResults:v11];
  }
}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Finished searching with error %@", buf, 0xCu);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_124;
  v5[3] = &unk_1E5622AB8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_124(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = [WeakRetained gotResults];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 intermediaryResults];
    if (v6)
    {
      id v7 = objc_loadWeakRetained(v2);
      id v8 = [v7 intermediaryResults];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1CAD0] set];
    }

    id v17 = *(void **)(a1 + 32);
    id v18 = [v8 allObjects];
    id v19 = [v17 _sortedAndRankedItemsWithItems:v18];

    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v28 = [v19 count];
        __int16 v29 = 2048;
        uint64_t v30 = [v8 count];
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Got %ld results from top conversation query, truncated from initial %ld results", buf, 0x16u);
      }
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_126;
    v22[3] = &unk_1E5622AB8;
    objc_copyWeak(&v24, v2);
    id v23 = v19;
    id v21 = v19;
    dispatch_async(MEMORY[0x1E4F14428], v22);

    objc_destroyWeak(&v24);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Didn't get any results, cleaning up old results", buf, 2u);
      }
    }
    id v10 = objc_loadWeakRetained(v2);
    int v11 = [v10 isTokenizationSearchController];

    if (v11)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_125;
      block[3] = &unk_1E56215C8;
      objc_copyWeak(&v26, v2);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v26);
    }
    else
    {
      id v12 = objc_loadWeakRetained(v2);
      id v13 = [MEMORY[0x1E4F1C978] array];
      [v12 setResults:v13];

      id v14 = objc_loadWeakRetained(v2);
      v15 = [v14 delegate];
      id v16 = objc_loadWeakRetained(v2);
      [v15 searchControllerContentsDidChange:v16];
    }
  }
}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_125(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained tokenizedQueryResultsForItems:MEMORY[0x1E4F1CBF0]];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setResults:v7];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = [v4 delegate];
  id v6 = objc_loadWeakRetained(v1);
  [v5 searchControllerContentsDidChange:v6];
}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_126(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained isTokenizationSearchController];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v4) {
    [v5 tokenizedQueryResultsForItems:v7];
  }
  else {
  id v13 = [v5 queryResultsForItems:v7];
  }

  id v8 = objc_loadWeakRetained(v2);
  [v8 setResults:v13];

  id v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "setQueriedResultsCount:", objc_msgSend(*(id *)(a1 + 32), "count"));

  id v10 = objc_loadWeakRetained(v2);
  int v11 = [v10 delegate];
  id v12 = objc_loadWeakRetained(v2);
  [v11 searchControllerContentsDidChange:v12];
}

- (void)searchEnded
{
  [(CKConversationSearchController *)self setSearchTerminated:1];
  [(CKSearchController *)self cancelCurrentSearch];
  if ([(CKSearchController *)self shouldResetSearchResultsWhenEnded])
  {
    [(CKSearchController *)self setResults:MEMORY[0x1E4F1CBF0]];
    id v3 = [(CKSearchController *)self delegate];
    [v3 searchControllerContentsDidChange:self];
  }
}

- (id)_sortedAndRankedItemsWithItems:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKConversationSearchController *)self rankingQueriesWithText:&stru_1EDE4CA38];
  uint64_t v6 = [v5 count];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v32 = 0;
        id v13 = +[CKSpotlightQueryUtilities matchedRankingQueriesForResult:v12 withRankingQueryCount:v6 maxRankingQuery:&v32];
        id v14 = [NSNumber numberWithUnsignedInteger:v32];
        id v15 = [v7 objectForKey:v14];
        if (!v15) {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v15 addObject:v12];
        [v7 setObject:v15 forKey:v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v17 = [v7 allKeys];
  id v18 = (void *)[v17 mutableCopy];

  [v18 sortUsingComparator:&__block_literal_global_148];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [v7 objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * j)];
        long long v25 = v24;
        if (v24)
        {
          [v24 sortUsingComparator:&__block_literal_global_140_1];
          [v16 addObjectsFromArray:v25];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v21);
  }

  return v16;
}

uint64_t __65__CKConversationSearchController__sortedAndRankedItemsWithItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __65__CKConversationSearchController__sortedAndRankedItemsWithItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 attributeSet];
  uint64_t v6 = [v5 lastUsedDate];
  id v7 = [v4 attributeSet];

  uint64_t v8 = [v7 lastUsedDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)queryResultsForItems:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v7 = [(CKConversationSearchController *)self maxResultsForMode:[(CKSearchController *)self mode]];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v4;
  uint64_t v26 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v26)
  {
    unint64_t v27 = 0;
    unint64_t v24 = v7;
    uint64_t v25 = *(void *)v29;
    id v23 = v5;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        int v11 = [(CKConversationSearchController *)self chatGUIDForSearchableItem:v10];
        uint64_t v12 = [(CKSearchController *)self delegate];
        id v13 = [v12 searchController:self conversationForChatGUID:v11];

        if (v13 && ([v13 isBlockedByCommunicationLimits] & 1) == 0)
        {
          id v14 = v8;
          id v15 = v6;
          id v16 = [v13 chat];
          id v17 = [v16 personCentricID];

          if (!v17) {
            goto LABEL_11;
          }
          id v6 = v15;
          if (([v15 containsObject:v17] & 1) == 0)
          {
            id v18 = [CKSpotlightQueryResult alloc];
            id v19 = [(id)objc_opt_class() sectionIdentifier];
            uint64_t v20 = [(CKSpotlightQueryResult *)v18 initWithSearchableItem:v10 inSection:v19 withConversation:v13];

            id v5 = v23;
            [v23 addObject:v20];
            [v15 addObject:v17];
            ++v27;

LABEL_11:
            id v6 = v15;
          }
          id v8 = v14;

          unint64_t v7 = v24;
        }

        if (v27 >= v7) {
          goto LABEL_16;
        }
      }
      uint64_t v26 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v26);
  }
LABEL_16:

  uint64_t v21 = (void *)[v5 copy];

  return v21;
}

- (id)tokenizedQueryResultsForItems:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 0;
}

+ (BOOL)supportsMenuInteraction
{
  return 0;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v3 = [a3 attributeSet];
  id v4 = [v3 accountIdentifier];

  return v4;
}

- (id)navigationBarTitleSummaryForSearchText:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = NSString;
    id v5 = CKFrameworkBundle();
    id v6 = [v5 localizedStringForKey:@"CONVERSATION_SEARCH_RESULTS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    unint64_t v7 = objc_msgSend(v4, "stringWithFormat:", v6, v3);

    id v8 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v9 = [v8 userInterfaceLayoutDirection];

    if (v9 == 1) {
      uint64_t v10 = @"\u200F";
    }
    else {
      uint64_t v10 = @"\u200E";
    }
    int v11 = [(__CFString *)v10 stringByAppendingString:v7];
  }
  else
  {
    int v11 = [(id)objc_opt_class() sectionTitle];
  }

  return v11;
}

+ (id)sectionIdentifier
{
  return @"ConversationSearchSection";
}

+ (id)sectionTitle
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"SEARCH_CONVERSATIONS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  int v3 = [(id)objc_opt_class() _shouldUseAvatarCellsForMode:a3];
  id v4 = off_1E561D610;
  if (!v3) {
    id v4 = off_1E561D6B8;
  }
  id v5 = [(__objc2_class *)*v4 reuseIdentifier];

  return v5;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  [(id)objc_opt_class() _shouldUseAvatarCellsForMode:a3];
  int v3 = objc_opt_class();

  return (Class)v3;
}

+ (id)supportedCellClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  int v3 = [(CKSearchController *)self delegate];
  [v3 parentMarginInsetsForSearchController:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  if (objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode")))
  {
    uint64_t v10 = +[CKUIBehavior sharedBehaviors];
    [v10 searchConversationSectionInsets];
    double v5 = v11;
    double v13 = v12;
    double v7 = v14;
    double v16 = v15;
  }
  else
  {
    double v13 = 0.0;
    double v16 = 0.0;
    if (CKIsRunningInMacCatalyst()) {
      double v7 = v9;
    }
    else {
      double v5 = v7;
    }
  }
  if ([(CKSearchController *)self mode] != 1)
  {
    id v17 = [(CKSearchController *)self results];
    uint64_t v18 = [v17 count];

    if (!v18)
    {
      double v5 = *MEMORY[0x1E4F424F0];
      double v13 = *(double *)(MEMORY[0x1E4F424F0] + 8);
      double v7 = *(double *)(MEMORY[0x1E4F424F0] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F424F0] + 24);
    }
  }
  double v19 = v5;
  double v20 = v13;
  double v21 = v7;
  double v22 = v16;
  result.trailing = v22;
  result.bottom = v21;
  result.leading = v20;
  result.top = v19;
  return result;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CKConversationSearchController;
  double v6 = [(CKSearchController *)&v15 cellForItemInCollectionView:a3 atIndexPath:a4 withIdentifier:a5];
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode")))
  {
    id v7 = v6;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v9 = v6;
    if (isKindOfClass)
    {
      uint64_t v10 = v9;
      double v11 = [(CKSearchController *)self delegate];
      objc_msgSend(v10, "setShouldInsetResults:", objc_msgSend(v11, "shouldInsetResultsForSearchController:", self));

      double v12 = [v10 topHairline];
      [v12 setHidden:0];

      double v13 = [v10 bottomHairline];
      [v13 setHidden:1];

      [v10 setDelegate:self];
    }
  }

  return v6;
}

- (double)interGroupSpacing
{
  int v2 = objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode"));
  double result = 0.0;
  if (v2) {
    return 6.0;
  }
  return result;
}

- (BOOL)wantsHeaderSection
{
  if ([(CKSearchController *)self mode] == 1) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CKConversationSearchController;
  if (![(CKSearchController *)&v6 wantsHeaderSection]) {
    return 0;
  }
  int v3 = [(CKSearchController *)self delegate];
  char v4 = [v3 searchControllerCanShowSectionHeader:self];

  return v4;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  int v3 = objc_opt_class();
  unint64_t v4 = [(CKSearchController *)self mode];

  return [v3 _shouldUseAvatarCellsForMode:v4];
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode")))
  {
    unint64_t v5 = [(CKSearchController *)self layoutWidth];
    if (v5) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 3;
    }
    double v7 = 0.33;
    if (v5) {
      double v7 = 0.25;
    }
    double v8 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v7];
    id v9 = [MEMORY[0x1E4F42608] uniformAcrossSiblingsWithEstimate:88.0];
    uint64_t v10 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v8 heightDimension:v9];
    double v11 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v10];
    double v12 = (void *)MEMORY[0x1E4F42638];
    double v13 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
    double v14 = [v12 sizeWithWidthDimension:v13 heightDimension:v9];

    objc_super v15 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v14 repeatingSubitem:v11 count:v6];
    double v16 = (void *)MEMORY[0x1E4F42640];
    id v17 = +[CKUIBehavior sharedBehaviors];
    [v17 searchConversationAvatarCellInterItemSpacing];
    uint64_t v18 = objc_msgSend(v16, "flexibleSpacing:");
    [v15 setInterItemSpacing:v18];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CKConversationSearchController;
    objc_super v15 = [(CKSearchController *)&v20 layoutGroupWithEnvironment:v4];
  }

  return v15;
}

- (id)customLayoutSectionForEnvironment:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode")))
  {
    v20.receiver = self;
    v20.super_class = (Class)CKConversationSearchController;
    unint64_t v5 = [(CKSearchController *)&v20 customLayoutSectionForEnvironment:v4];
  }
  else
  {
    if (CKIsRunningInMacCatalyst())
    {
      uint64_t v6 = [v4 container];
      [v6 contentSize];
      double v8 = v7;
      id v9 = +[CKUIBehavior sharedBehaviors];
      [v9 snapToMinConversationListWidth];
      BOOL v11 = v8 >= v10;
    }
    else
    {
      BOOL v11 = 1;
    }
    double v12 = [(CKSearchController *)self delegate];
    int v13 = [v12 shouldInsetResultsForSearchController:self];

    if (v13) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 4;
    }
    objc_super v15 = (void *)[objc_alloc(MEMORY[0x1E4F43110]) initWithAppearanceStyle:v14 layoutEnvironment:v4];
    [v15 setSeparatorStyle:v11];
    double v16 = +[CKUIBehavior sharedBehaviors];
    [v16 conversationCellLeadingSeparatorInsetForEnvironment:v4];
    double v18 = v17;

    objc_msgSend(v15, "setSeparatorInset:", 0.0, v18, 0.0, 0.0);
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F43108]) initWithConfiguration:v15 layoutEnvironment:v4];
  }

  return v5;
}

- (BOOL)isTokenizationSearchController
{
  return 0;
}

- (double)widthForDeterminingAvatarVisibility
{
  int v2 = [(CKSearchController *)self delegate];
  [v2 widthForDeterminingAvatarVisibility];
  double v4 = v3;

  return v4;
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  double v4 = [a3 conversation];
  unint64_t v5 = [(CKSearchController *)self delegate];
  uint64_t v6 = [v5 contextMenusForConversation:v4];

  return v6;
}

- (BOOL)gotResults
{
  return self->_gotResults;
}

- (void)setGotResults:(BOOL)a3
{
  self->_gotResults = a3;
}

- (NSSet)intermediaryResults
{
  return self->_intermediaryResults;
}

- (void)setIntermediaryResults:(id)a3
{
}

- (BOOL)searchTerminated
{
  return self->_searchTerminated;
}

- (void)setSearchTerminated:(BOOL)a3
{
  self->_searchTerminated = a3;
}

- (void)setZkwSuggester:(id)a3
{
}

- (NSArray)currentZKWSuggestions
{
  return self->_currentZKWSuggestions;
}

- (void)setCurrentZKWSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentZKWSuggestions, 0);
  objc_storeStrong((id *)&self->_zkwSuggester, 0);

  objc_storeStrong((id *)&self->_intermediaryResults, 0);
}

@end