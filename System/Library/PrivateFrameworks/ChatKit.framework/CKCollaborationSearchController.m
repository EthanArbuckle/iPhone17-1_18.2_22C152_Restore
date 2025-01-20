@interface CKCollaborationSearchController
+ (BOOL)supportsQuicklookForResult:(id)a3;
+ (id)indexingString;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
+ (id)supportedCellClasses;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)handleSelectionForResult:(id)a3;
- (BOOL)shouldStartMenuInteractionForResult:(id)a3;
- (double)interGroupSpacing;
- (id)_activityItemProviderForResult:(id)a3;
- (id)_additionalMenuElementsForResult:(id)a3;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)createFoundItemsHandler;
- (id)detailsFilterQueriesForChatGUIDs:(id)a3;
- (id)fetchAttributes;
- (id)filterQueries;
- (id)itemProviderForSearchResult:(id)a3;
- (id)layoutGroupWithEnvironment:(id)a3;
- (id)linksController;
- (id)previewViewControllerForResult:(id)a3;
- (id)queryAttributesForText:(id)a3;
- (id)reuseIdentifierForIndex:(int64_t)a3;
- (unint64_t)searchTokenContentType;
- (void)deleteAttachmentForResult:(id)a3;
- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5;
- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4;
@end

@implementation CKCollaborationSearchController

- (unint64_t)searchTokenContentType
{
  return 1;
}

- (id)fetchAttributes
{
  v10[14] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F23498];
  v10[0] = *MEMORY[0x1E4F234B0];
  v10[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F22B00];
  v10[2] = *MEMORY[0x1E4F22B30];
  v10[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22C70];
  v10[4] = *MEMORY[0x1E4F22C38];
  v10[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F231D0];
  v10[6] = *MEMORY[0x1E4F23598];
  v10[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F23080];
  v10[8] = *MEMORY[0x1E4F22A10];
  v10[9] = v6;
  v10[10] = *MEMORY[0x1E4F23148];
  v10[11] = @"com_apple_mobilesms_lpPluginPaths";
  uint64_t v7 = *MEMORY[0x1E4F230A8];
  v10[12] = *MEMORY[0x1E4F23660];
  v10[13] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:14];

  return v8;
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    uint64_t v3 = *MEMORY[0x1E4F23660];
    v14 = @"com_apple_mobilesms_lpDescription";
    uint64_t v15 = v3;
    uint64_t v4 = *MEMORY[0x1E4F22B30];
    uint64_t v16 = *MEMORY[0x1E4F234B0];
    uint64_t v17 = v4;
    uint64_t v5 = *MEMORY[0x1E4F230A8];
    uint64_t v18 = *MEMORY[0x1E4F235F8];
    uint64_t v19 = v5;
    uint64_t v20 = *MEMORY[0x1E4F22A10];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v7 = &v14;
    uint64_t v8 = 7;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F23660];
    uint64_t v12 = *MEMORY[0x1E4F235F8];
    uint64_t v13 = v9;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v7 = (__CFString **)&v12;
    uint64_t v8 = 2;
  }
  v10 = objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v12, v13, v14, v15, v16, v17, v18, v19, v20);

  return v10;
}

- (id)filterQueries
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%tu", 4);
  uint64_t v3 = [NSString stringWithFormat:@"%@ == \"%@\" && %@ > \"0\"cwd && %@ != \"%@\", *MEMORY[0x1E4F23148], @"lnk"", *MEMORY[0x1E4F230A8], *MEMORY[0x1E4F235E8], v2];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [NSString stringWithFormat:@"_kMDItemDomainIdentifier == \"%@\"", *(void *)(*((void *)&v19 + 1) + 8 * i)];
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__11;
  uint64_t v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  id v18 = [NSString string];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CKCollaborationSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v12[3] = &unk_1E5621A30;
  v12[4] = &v13;
  [v4 enumerateObjectsUsingBlock:v12];
  uint64_t v23 = v14[5];
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __68__CKCollaborationSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  if (a3)
  {
    uint64_t v12 = [NSString stringWithFormat:@" || %@", a2];
    uint64_t v6 = [v5 stringByAppendingString:v12];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = (void *)v12;
  }
  else
  {
    uint64_t v10 = [*(id *)(v4 + 40) stringByAppendingString:a2];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  id v3 = [a3 item];
  uint64_t v4 = [v3 attributeSet];
  id v5 = objc_msgSend(v4, "__ck_spotlightItemSnippet");

  uint64_t v6 = IMUTITypeForFilename();
  LOBYTE(v4) = IMUTTypeWantsQuicklook();

  return (char)v4;
}

+ (id)sectionTitle
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"SEARCH_COLLABORATION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)sectionIdentifier
{
  return @"CollaborationSearchController";
}

- (id)reuseIdentifierForIndex:(int64_t)a3
{
  uint64_t v4 = [(CKSearchController *)self results];
  id v5 = [v4 objectAtIndexedSubscript:a3];
  uint64_t v6 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v5];

  uint64_t v7 = off_1E561DAB0;
  if (([v6 isEqualToString:@"lnk"] & 1) == 0
    && [v6 isEqualToString:@"at"])
  {
    uint64_t v7 = off_1E561D340;
  }
  uint64_t v8 = [(__objc2_class *)*v7 reuseIdentifier];

  return v8;
}

+ (id)indexingString
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"COLLABORATION_INDEXING_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)supportedCellClasses
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isSWYAttachmentsEnabled];

  uint64_t v4 = objc_opt_class();
  if (v3)
  {
    uint64_t v11 = v4;
    uint64_t v12 = objc_opt_class();
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = &v11;
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v10 = v4;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = &v10;
    uint64_t v7 = 1;
  }
  uint64_t v8 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v10, v11, v12);

  return v8;
}

- (double)interGroupSpacing
{
  uint64_t v2 = +[CKUIBehavior sharedBehaviors];
  [v2 searchCollaborationInterItemSpacing];
  double v4 = v3;

  return v4;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  double v33 = 0.0;
  [(CKCollaborationSearchController *)self fractionalWidth:&v33 count:&v32 forLayoutWidth:[(CKSearchController *)self layoutWidth]];
  double v4 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v33];
  id v5 = (void *)MEMORY[0x1E4F42608];
  double v6 = v33;
  uint64_t v7 = +[CKUIBehavior sharedBehaviors];
  [v7 searchLinksFractionalHeightScale];
  uint64_t v9 = [v5 fractionalWidthDimension:v6 * v8];

  uint64_t v10 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v4 heightDimension:v9];
  if ([(CKSearchController *)self suppressAvatars])
  {
    uint64_t v11 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v10];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F42608];
    uint64_t v13 = +[CKUIBehavior sharedBehaviors];
    [v13 searchResultAvatarSize];
    v14 = objc_msgSend(v12, "absoluteDimension:");

    uint64_t v15 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v14 heightDimension:v14];
    uint64_t v16 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    if (v16 == 1) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = 9;
    }
    double v18 = -8.0;
    if (v16 == 1) {
      double v18 = 8.0;
    }
    long long v19 = [MEMORY[0x1E4F425F0] layoutAnchorWithEdges:v17 absoluteOffset:v18];
    long long v20 = (void *)MEMORY[0x1E4F42648];
    long long v21 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    long long v22 = [v20 supplementaryItemWithLayoutSize:v15 elementKind:v21 containerAnchor:v19];

    uint64_t v23 = (void *)MEMORY[0x1E4F42628];
    v34[0] = v22;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    uint64_t v11 = [v23 itemWithLayoutSize:v10 supplementaryItems:v24];
  }
  uint64_t v25 = (void *)MEMORY[0x1E4F42638];
  v26 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  v27 = [v25 sizeWithWidthDimension:v26 heightDimension:v9];

  v28 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v27 subitem:v11 count:v32];
  v29 = (void *)MEMORY[0x1E4F42640];
  [(CKCollaborationSearchController *)self interGroupSpacing];
  v30 = objc_msgSend(v29, "fixedSpacing:");
  [v28 setInterItemSpacing:v30];

  return v28;
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  if (CKIsRunningInMacCatalyst())
  {
    if (a3) {
      *a3 = 0.5;
    }
    if (a4) {
      *a4 = 2;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKCollaborationSearchController;
    [(CKMessageTypeSearchController *)&v9 fractionalWidth:a3 count:a4 forLayoutWidth:a5];
  }
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CKSearchController *)self results];
  uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
  uint64_t v13 = [v12 item];

  v14 = +[CKSpotlightQueryResultUtilities indexItemTypeForItem:v13];
  if ([v14 isEqualToString:@"lnk"])
  {
    v19.receiver = self;
    v19.super_class = (Class)CKCollaborationSearchController;
    -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v19, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v8, v9, v10, v17.receiver, v17.super_class);
  }
  else
  {
    if ([v14 isEqualToString:@"at"])
    {
      v18.receiver = self;
      v18.super_class = (Class)CKCollaborationSearchController;
      uint64_t v15 = [(CKSearchController *)&v18 cellForItemInCollectionView:v8 atIndexPath:v9 withIdentifier:v10];
      objc_msgSend(v15, "setSuppressAvatars:", -[CKSearchController suppressAvatars](self, "suppressAvatars"));
      goto LABEL_7;
    }
    -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v17, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v8, v9, v10, self, CKCollaborationSearchController);
  uint64_t v15 = };
LABEL_7:

  return v15;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
    v14 = +[CKDetailsSearchResultsFooterCell reuseIdentifier];
    uint64_t v15 = [v8 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v14 forIndexPath:v9];

    uint64_t v16 = NSString;
    objc_super v17 = CKFrameworkBundle();
    objc_super v18 = [v17 localizedStringForKey:@"SEE_ALL_LINKS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    objc_super v19 = [v16 stringWithFormat:v18];

    long long v20 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v21 = [v20 userInterfaceLayoutDirection];

    if (v21 == 1) {
      long long v22 = @"\u200F";
    }
    else {
      long long v22 = @"\u200E";
    }
    uint64_t v23 = [(__CFString *)v22 stringByAppendingString:v19];

    [v15 setTitle:v23];
    v24 = [(id)objc_opt_class() sectionIdentifier];
    [v15 setSectionIdentifier:v24];
LABEL_9:

    goto LABEL_11;
  }
  uint64_t v25 = +[CKSearchAvatarSupplementryView supplementaryViewType];
  int v26 = [v10 isEqualToString:v25];

  if (v26)
  {
    v27 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    v28 = +[CKSearchAvatarSupplementryView reuseIdentifier];
    uint64_t v15 = [v8 dequeueReusableSupplementaryViewOfKind:v27 withReuseIdentifier:v28 forIndexPath:v9];

    unint64_t v29 = [v9 row];
    v30 = [(CKSearchController *)self results];
    unint64_t v31 = [v30 count];

    if (v29 >= v31) {
      goto LABEL_11;
    }
    uint64_t v32 = [(CKSearchController *)self results];
    v24 = objc_msgSend(v32, "objectAtIndex:", objc_msgSend(v9, "row"));

    double v33 = +[CKSpotlightQueryResultUtilities contactForResult:v24];
    [v15 setContact:v33];
    [v15 setAssociatedResult:v24];
    [v15 setParentContentType:2];

    goto LABEL_9;
  }
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = v6;
  unint64_t v8 = [v7 row];
  id v9 = [(CKSearchController *)self results];
  unint64_t v10 = [v9 count];

  if (v8 >= v10)
  {
    int v12 = 0;
  }
  else
  {
    uint64_t v11 = [(CKSearchController *)self results];
    int v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));

    uint64_t v13 = [v16 associatedResult];
    char v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = +[CKSpotlightQueryResultUtilities contactForResult:v12];
      [v16 setContact:v15];
      [v16 setAssociatedResult:v12];
      [v16 setNeedsLayout];
    }
  }
}

- (id)itemProviderForSearchResult:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v4];
    if ([v5 isEqualToString:@"lnk"])
    {
      id v6 = [(CKCollaborationSearchController *)self linksController];
      id v7 = [v6 itemProviderForSearchResult:v4];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Unexpected nil search result when trying to create NSItemProvider for link", v10, 2u);
      }
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v4 = a3;
  id v5 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v4];
  if ([v5 isEqualToString:@"lnk"])
  {
    id v6 = [(CKCollaborationSearchController *)self linksController];
    id v7 = [v6 _activityItemProviderForResult:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  id v4 = a3;
  id v5 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v4];
  if ([v5 isEqualToString:@"lnk"])
  {
    id v6 = [(CKCollaborationSearchController *)self linksController];
    char v7 = [v6 handleSelectionForResult:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)createFoundItemsHandler
{
  id location = 0;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CKCollaborationSearchController_createFoundItemsHandler__block_invoke;
  v4[3] = &unk_1E5623920;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __58__CKCollaborationSearchController_createFoundItemsHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  char v6 = [WeakRetained searchTerminated];

  if ((v6 & 1) == 0)
  {
    id location = v4;
    id v7 = objc_loadWeakRetained(v4);
    [v7 setGotResults:1];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v15 = +[CKSpotlightQueryResultUtilities indexItemTypeForItem:](CKSpotlightQueryResultUtilities, "indexItemTypeForItem:", v14, location);
          if (([v15 isEqualToString:@"lnk"] & 1) != 0
            || [v15 isEqualToString:@"at"])
          {
            if (!v11)
            {
              uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
            }
            [v11 addObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }

    id v16 = objc_loadWeakRetained(location);
    objc_super v17 = [v16 intermediaryResults];
    if (v17)
    {
      id v18 = objc_loadWeakRetained(location);
      objc_super v19 = [v18 intermediaryResults];
    }
    else
    {
      objc_super v19 = [MEMORY[0x1E4F1CAD0] set];
    }

    long long v20 = [v19 setByAddingObjectsFromArray:v11];

    id v21 = objc_loadWeakRetained(location);
    [v21 setIntermediaryResults:v20];
  }
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  id v4 = a3;
  id v5 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v4];
  if ([v5 isEqualToString:@"lnk"])
  {
    char v6 = [(CKCollaborationSearchController *)self linksController];
    id v7 = [v6 _additionalMenuElementsForResult:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id location = 0;
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v9 = CKFrameworkBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"HIDE_DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v11 = [MEMORY[0x1E4F42A80] systemImageNamed:@"minus.circle"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__CKCollaborationSearchController__additionalMenuElementsForResult___block_invoke;
  v18[3] = &unk_1E56210D8;
  objc_copyWeak(&v20, &location);
  id v12 = v4;
  id v19 = v12;
  uint64_t v13 = [v8 actionWithTitle:v10 image:v11 identifier:@"ckHideMenuItem" handler:v18];

  uint64_t v14 = CKFrameworkBundle();
  uint64_t v15 = [v14 localizedStringForKey:@"HIDE_DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v13 setTitle:v15];

  id v16 = [v7 arrayByAddingObject:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v16;
}

void __68__CKCollaborationSearchController__additionalMenuElementsForResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained sendSyndicationActionForResult:*(void *)(a1 + 32) actionType:16];
}

- (void)deleteAttachmentForResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 item];
  char v6 = [v5 uniqueIdentifier];

  id v7 = [MEMORY[0x1E4F6BC30] sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CKCollaborationSearchController_deleteAttachmentForResult___block_invoke;
  v9[3] = &unk_1E5621A80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 loadMessageItemWithGUID:v6 completionBlock:v9];
}

void __61__CKCollaborationSearchController_deleteAttachmentForResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 removeResult:v4];
  char v6 = [*(id *)(a1 + 32) delegate];
  [v6 searchControllerContentsDidChange:*(void *)(a1 + 32)];

  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 deleteMessageItem:v5];
}

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  id v3 = [a3 item];
  uint64_t v4 = [v3 attributeSet];

  id v5 = [v4 URL];
  if (v5)
  {
    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:0];
    id v7 = [v6 host];
    uint64_t v8 = [v7 caseInsensitiveCompare:@"itunes.apple.com"];

    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = [v6 host];
    uint64_t v10 = [v9 caseInsensitiveCompare:@"itunes.com"];

    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v11 = [v6 host];
    uint64_t v12 = [v11 caseInsensitiveCompare:@"itun.es"];

    if (!v12) {
      goto LABEL_7;
    }
    uint64_t v13 = [v6 host];
    uint64_t v14 = [v13 caseInsensitiveCompare:@"appsto.re"];

    if (v14)
    {
      uint64_t v15 = objc_msgSend(v5, "iCloudSharingURL_noFragment");

      BOOL v16 = v15 != 0;
    }
    else
    {
LABEL_7:
      BOOL v16 = 1;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return !v16;
}

- (id)previewViewControllerForResult:(id)a3
{
  id v4 = a3;
  id v5 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v4];
  if ([v5 isEqualToString:@"lnk"])
  {
    char v6 = [(CKCollaborationSearchController *)self linksController];
    id v7 = [v6 previewViewControllerForResult:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)linksController
{
  uint64_t v2 = objc_alloc_init(CKLinkSearchController);

  return v2;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v3 = [a3 attributeSet];
  id v4 = [v3 domainIdentifier];

  return v4;
}

@end