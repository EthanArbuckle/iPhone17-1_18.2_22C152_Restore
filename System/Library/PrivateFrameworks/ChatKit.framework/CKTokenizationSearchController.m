@interface CKTokenizationSearchController
+ (BOOL)isVisibleInCollectionView;
+ (BOOL)supportsMenuInteraction;
+ (Class)cellClassForMode:(unint64_t)a3;
+ (id)reuseIdentifier;
+ (id)reuseIdentifierForMode:(unint64_t)a3;
+ (id)sectionIdentifier;
+ (id)supportedCellClasses;
+ (unint64_t)recencyRankedTargetResultCount;
- (BOOL)_hasCategoryTokenStaged;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)isTokenizationSearchController;
- (BOOL)shouldShowConversationTokenSuggestionForConversationGUID:(id)a3;
- (BOOL)shouldShowFilterTokenSuggestion:(id)a3;
- (BOOL)useSemanticQuery;
- (BOOL)wantsHeaderSection;
- (NSArray)searchTokens;
- (NSDirectionalEdgeInsets)additionalGroupInsets;
- (double)interGroupSpacing;
- (id)_tokenAddressesForSearchableItem:(id)a3 inConversation:(id)a4;
- (id)appropriateCategoryTokensForSearchText:(id)a3;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)customLayoutSectionForEnvironment:(id)a3;
- (id)tokenizedQueryResultsForItems:(id)a3;
- (unint64_t)maxResultsForMode:(unint64_t)a3;
- (unint64_t)searchTokenContentType;
- (void)_prependTokenClarificationOptionsToResults:(id)a3;
- (void)discardSuggestionResults;
- (void)searchWithText:(id)a3 mode:(unint64_t)a4;
- (void)setSearchTokens:(id)a3;
@end

@implementation CKTokenizationSearchController

+ (BOOL)isVisibleInCollectionView
{
  return CKIsRunningInMacCatalyst() == 0;
}

+ (id)reuseIdentifier
{
  return @"TokenizationSearchCell";
}

+ (id)sectionIdentifier
{
  return @"TokenizationSearchSection";
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return (Class)objc_opt_class();
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKTokenizationSearchController reuseIdentifier];
}

+ (id)supportedCellClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)supportsMenuInteraction
{
  return 0;
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  return 4 * (a3 == 0);
}

- (BOOL)useSemanticQuery
{
  return 0;
}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 10;
}

- (unint64_t)searchTokenContentType
{
  return 9;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  if (a4) {
    [(CKConversationSearchController *)self searchEnded];
  }
  else {
    -[CKConversationSearchController searchSpotlightWithText:mode:](self, "searchSpotlightWithText:mode:", a3);
  }
}

- (void)discardSuggestionResults
{
}

- (id)tokenizedQueryResultsForItems:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v60 = [(CKTokenizationSearchController *)self maxResultsForMode:[(CKSearchController *)self mode]];
  [(CKTokenizationSearchController *)self _prependTokenClarificationOptionsToResults:v5];
  v6 = [(CKSearchController *)self currentSearchText];
  v7 = [(CKTokenizationSearchController *)self appropriateCategoryTokensForSearchText:v6];

  v8 = [(CKSearchController *)self currentSearchText];
  v9 = +[CKTokenizationDateParser appropriateDateTokensForSearchText:v8];

  uint64_t v10 = [v7 count];
  v54 = v9;
  uint64_t v11 = [v9 count];
  v12 = [(CKSearchController *)self currentSearchText];
  uint64_t v13 = [v12 length];

  v55 = v4;
  if (v13)
  {
    v53 = v7;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v69 objects:v75 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v57 = v60 - v10 - v11;
      uint64_t v58 = *(void *)v70;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v70 != v58) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v69 + 1) + 8 * v17);
        v19 = [(CKTokenizationSearchController *)self chatGUIDForSearchableItem:v18];
        v20 = [(CKSearchController *)self delegate];
        v21 = [v20 searchController:self conversationForChatGUID:v19];

        if (v21 && ([v21 isBlockedByCommunicationLimits] & 1) == 0)
        {
          v22 = [v21 chat];
          v23 = [v22 guid];

          if (([v56 containsObject:v23] & 1) == 0
            && [(CKTokenizationSearchController *)self shouldShowConversationTokenSuggestionForConversationGUID:v23])
          {
            v24 = [(CKTokenizationSearchController *)self _tokenAddressesForSearchableItem:v18 inConversation:v21];
            v25 = [[CKSearchTokenQueryResult alloc] initWithContentType:0 filterOptions:0 conversation:v21 itemIdentifier:v23 tokenAddresses:v24];
            [v5 addObject:v25];
            [v56 addObject:v23];
          }
        }
        unint64_t v26 = [v5 count];

        if (v26 >= v57) {
          break;
        }
        if (v16 == ++v17)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v69 objects:v75 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v7 = v53;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v27 = v7;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v66;
LABEL_19:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v66 != v30) {
        objc_enumerationMutation(v27);
      }
      v32 = *(void **)(*((void *)&v65 + 1) + 8 * v31);
      if ([v5 count] >= v60) {
        break;
      }
      v33 = [CKSearchTokenQueryResult alloc];
      uint64_t v34 = [v32 contentType];
      uint64_t v35 = [v32 filterOptions];
      v36 = [v32 itemIdentifier];
      v37 = [v32 tokenAddresses];
      v38 = [(CKSearchTokenQueryResult *)v33 initWithContentType:v34 filterOptions:v35 conversation:0 itemIdentifier:v36 tokenAddresses:v37];

      [v5 addObject:v38];
      if (v29 == ++v31)
      {
        uint64_t v29 = [v27 countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (v29) {
          goto LABEL_19;
        }
        break;
      }
    }
  }
  v59 = v27;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v39 = v54;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v62;
LABEL_27:
    uint64_t v43 = 0;
    while (1)
    {
      if (*(void *)v62 != v42) {
        objc_enumerationMutation(v39);
      }
      v44 = *(void **)(*((void *)&v61 + 1) + 8 * v43);
      if ([v5 count] >= v60) {
        break;
      }
      v45 = [CKSearchTokenQueryResult alloc];
      uint64_t v46 = [v44 contentType];
      uint64_t v47 = [v44 filterOptions];
      v48 = [v44 itemIdentifier];
      v49 = [v44 tokenAddresses];
      v50 = [(CKSearchTokenQueryResult *)v45 initWithContentType:v46 filterOptions:v47 conversation:0 itemIdentifier:v48 tokenAddresses:v49];

      [v5 addObject:v50];
      if (v41 == ++v43)
      {
        uint64_t v41 = [v39 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v41) {
          goto LABEL_27;
        }
        break;
      }
    }
  }

  v51 = (void *)[v5 copy];

  return v51;
}

- (void)_prependTokenClarificationOptionsToResults:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CKSearchController *)self delegate];
  v6 = [v5 searchTokenFiltersForSearchController:self];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v8)
  {
    uint64_t v10 = 0;
    v20 = v7;
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if (!objc_msgSend(v14, "contentType", (void)v27))
      {
        id v15 = v14;

        ++v11;
        uint64_t v10 = v15;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v9);

  if (v11 == 1)
  {
    uint64_t v16 = [v10 conversation];
    char v17 = [v16 isGroupConversation];

    if ((v17 & 1) == 0 && ([v10 hasFilterOption:2] & 1) == 0)
    {
      uint64_t v18 = [v10 conversation];
      v19 = [v18 chat];
      v20 = [v19 guid];

      v21 = [CKSearchTokenQueryResult alloc];
      uint64_t v22 = [v10 contentType];
      uint64_t v23 = [v10 filterOptions];
      v24 = [v10 conversation];
      v25 = [v10 tokenAddresses];
      unint64_t v26 = [(CKSearchTokenQueryResult *)v21 initWithContentType:v22 filterOptions:v23 conversation:v24 itemIdentifier:v20 tokenAddresses:v25];

      [(CKSearchTokenQueryResult *)v26 addFilterOption:2];
      [(CKSearchTokenQueryResult *)v26 setAssociatedStagedFilter:v10];
      [v4 insertObject:v26 atIndex:0];

LABEL_15:
    }
  }
}

- (id)_tokenAddressesForSearchableItem:(id)a3 inConversation:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 isGroupConversation])
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else if ([v6 isBusinessConversation] {
         && ([v6 businessHandle],
  }
             uint64_t v8 = objc_claimAutoreleasedReturnValue(),
             [v8 ID],
             uint64_t v9 = objc_claimAutoreleasedReturnValue(),
             v9,
             v8,
             v9))
  {
    uint64_t v10 = [v6 businessHandle];
    uint64_t v11 = [v10 ID];
    v18[0] = v11;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    uint64_t v12 = [v5 attributeSet];
    uint64_t v13 = [v12 recipientAddresses];
    id v14 = [v13 firstObject];

    id v15 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    uint64_t v16 = [v15 fetchCNContactForHandleWithID:v14];

    id v7 = +[CKSpotlightQueryUtilities tokenAddressesForFilteringWithContact:v16];
  }

  return v7;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  v3 = [a3 attributeSet];
  id v4 = [v3 accountIdentifier];

  return v4;
}

- (id)customLayoutSectionForEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchController *)self delegate];
  LODWORD(self) = [v5 shouldInsetResultsForSearchController:self];

  if (self) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 4;
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42848]) initWithAppearance:v6];
  [v7 setShowsSeparators:1];
  [v7 setItemSeparatorHandler:&__block_literal_global_154];
  uint64_t v8 = [MEMORY[0x1E4F42630] sectionWithListConfiguration:v7 layoutEnvironment:v4];

  return v8;
}

id __68__CKTokenizationSearchController_customLayoutSectionForEnvironment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = +[CKUIBehavior sharedBehaviors];
  [v4 searchSuggestionsSeparatorLeadingInset];
  objc_msgSend(v3, "setTopSeparatorInsets:", 0.0, v5, 0.0, 0.0);

  [v3 setTopSeparatorVisibility:1];
  [v3 setBottomSeparatorVisibility:2];

  return v3;
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

- (double)interGroupSpacing
{
  return 0.0;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 0;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CKTokenizationSearchController;
  double v5 = [(CKConversationSearchController *)&v7 cellForItemInCollectionView:a3 atIndexPath:a4 withIdentifier:a5];

  return v5;
}

- (BOOL)wantsHeaderSection
{
  return 0;
}

- (id)appropriateCategoryTokensForSearchText:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v4 = [a3 searchSafeText];
  uint64_t v5 = [v4 length];
  if ([(CKTokenizationSearchController *)self _hasCategoryTokenStaged])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v7 = [(CKTokenizationSearchController *)self searchTokens];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = [v12 itemIdentifier];
          id v14 = [v13 searchSafeText];

          if ((!v5 || [v14 hasPrefix:v4])
            && [(CKTokenizationSearchController *)self shouldShowFilterTokenSuggestion:v12])
          {
            [v16 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    uint64_t v6 = (void *)[v16 copy];
  }

  return v6;
}

- (BOOL)shouldShowFilterTokenSuggestion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKSearchController *)self delegate];
  uint64_t v6 = [v5 searchTokenFiltersForSearchController:self];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "itemIdentifier", (void)v17);
        uint64_t v13 = [v4 itemIdentifier];
        char v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)_hasCategoryTokenStaged
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKSearchController *)self delegate];
  id v4 = [v3 searchTokenFiltersForSearchController:self];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "contentType", (void)v11) && objc_msgSend(v9, "contentType") != 8)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)shouldShowConversationTokenSuggestionForConversationGUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKSearchController *)self delegate];
  uint64_t v6 = [v5 searchTokenFiltersForSearchController:self];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "itemIdentifier", (void)v16);
        char v13 = [v4 isEqualToString:v12];

        if (v13)
        {
          BOOL v14 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

- (NSArray)searchTokens
{
  v30[4] = *MEMORY[0x1E4F143B8];
  searchTokens = self->_searchTokens;
  if (!searchTokens)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v4 = [CKSearchTokenFilter alloc];
    long long v29 = CKFrameworkBundle();
    long long v28 = [v29 localizedStringForKey:@"SEARCH_LINK_TOKEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    long long v27 = [(CKSearchTokenFilter *)v4 initWithContentType:2 itemIdentifier:v28];
    v30[0] = v27;
    id v5 = [CKSearchTokenFilter alloc];
    v25 = CKFrameworkBundle();
    v24 = [v25 localizedStringForKey:@"SEARCH_PHOTO_TOKEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v23 = [(CKSearchTokenFilter *)v5 initWithContentType:3 itemIdentifier:v24];
    v30[1] = v23;
    uint64_t v6 = [CKSearchTokenFilter alloc];
    id v7 = CKFrameworkBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"SEARCH_LOCATION_TOKEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v9 = [(CKSearchTokenFilter *)v6 initWithContentType:4 itemIdentifier:v8];
    v30[2] = v9;
    uint64_t v10 = [CKSearchTokenFilter alloc];
    long long v11 = CKFrameworkBundle();
    long long v12 = [v11 localizedStringForKey:@"SEARCH_DOCUMENT_TOKEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    char v13 = [(CKSearchTokenFilter *)v10 initWithContentType:6 itemIdentifier:v12];
    v30[3] = v13;
    BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    BOOL v15 = (void *)[v26 initWithArray:v14];

    if (+[CKSpotlightQueryUtilities shouldDisplayWalletSearchController])
    {
      long long v16 = [CKSearchTokenFilter alloc];
      long long v17 = CKFrameworkBundle();
      long long v18 = [v17 localizedStringForKey:@"SEARCH_WALLET_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      long long v19 = [(CKSearchTokenFilter *)v16 initWithContentType:5 itemIdentifier:v18];
      [v15 addObject:v19];
    }
    long long v20 = (NSArray *)objc_msgSend(v15, "copy", v23);
    uint64_t v21 = self->_searchTokens;
    self->_searchTokens = v20;

    searchTokens = self->_searchTokens;
  }

  return searchTokens;
}

- (BOOL)isTokenizationSearchController
{
  return 1;
}

- (void)setSearchTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end