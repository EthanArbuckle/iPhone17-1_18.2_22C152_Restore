@interface CKHighlightsSearchController
+ (BOOL)supportsQuicklookForResult:(id)a3;
+ (id)indexingString;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
+ (id)supportedCellClasses;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)handleSelectionForResult:(id)a3;
- (BOOL)shouldStartMenuInteractionForResult:(id)a3;
- (BOOL)useSemanticQuery;
- (double)interGroupSpacing;
- (id)_activityItemProviderForResult:(id)a3;
- (id)_additionalMenuElementsForResult:(id)a3;
- (id)attachmentsController;
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

@implementation CKHighlightsSearchController

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  v3 = [a3 item];
  v4 = [v3 attributeSet];

  id v5 = [v4 URL];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:0];
    v7 = [v6 host];
    uint64_t v8 = [v7 caseInsensitiveCompare:@"itunes.apple.com"];

    if (!v8) {
      goto LABEL_7;
    }
    v9 = [v6 host];
    uint64_t v10 = [v9 caseInsensitiveCompare:@"itunes.com"];

    if (!v10) {
      goto LABEL_7;
    }
    v11 = [v6 host];
    uint64_t v12 = [v11 caseInsensitiveCompare:@"itun.es"];

    if (!v12) {
      goto LABEL_7;
    }
    v13 = [v6 host];
    uint64_t v14 = [v13 caseInsensitiveCompare:@"appsto.re"];

    if (v14)
    {
      v15 = objc_msgSend(v5, "iCloudSharingURL_noFragment");

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

- (id)fetchAttributes
{
  v9[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F23498];
  v9[0] = *MEMORY[0x1E4F234B0];
  v9[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F22B00];
  v9[2] = *MEMORY[0x1E4F22B30];
  v9[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22C70];
  v9[4] = *MEMORY[0x1E4F22C38];
  v9[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F231D0];
  v9[6] = *MEMORY[0x1E4F23598];
  v9[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F23080];
  v9[8] = *MEMORY[0x1E4F22A10];
  v9[9] = v6;
  v9[10] = *MEMORY[0x1E4F23148];
  v9[11] = @"com_apple_mobilesms_lpPluginPaths";
  v9[12] = *MEMORY[0x1E4F23660];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:13];

  return v7;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CKSpotlightQueryResultUtilities indexItemTypeForItem:v4];
  if ([v5 isEqualToString:@"at"])
  {
    uint64_t v6 = [(CKHighlightsSearchController *)self attachmentsController];
    v7 = [v6 chatGUIDForSearchableItem:v4];
  }
  else
  {
    v7 = [v4 domainIdentifier];
  }

  return v7;
}

void __58__CKHighlightsSearchController_deleteAttachmentForResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 removeResult:v4];
  uint64_t v6 = [*(id *)(a1 + 32) delegate];
  [v6 searchControllerContentsDidChange:*(void *)(a1 + 32)];

  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 deleteMessageItem:v5];
}

- (unint64_t)searchTokenContentType
{
  return 7;
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    uint64_t v3 = *MEMORY[0x1E4F23660];
    v13 = @"com_apple_mobilesms_lpDescription";
    uint64_t v14 = v3;
    uint64_t v4 = *MEMORY[0x1E4F22B30];
    uint64_t v15 = *MEMORY[0x1E4F234B0];
    uint64_t v16 = v4;
    uint64_t v17 = *MEMORY[0x1E4F235F8];
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = &v13;
    uint64_t v7 = 5;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F23660];
    uint64_t v11 = *MEMORY[0x1E4F235F8];
    uint64_t v12 = v8;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = (__CFString **)&v11;
    uint64_t v7 = 2;
  }
  v9 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v11, v12, v13, v14, v15, v16, v17);

  return v9;
}

- (id)filterQueries
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%tu", 2);
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%tu", 6);
  uint64_t v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isSWYAttachmentsEnabled];

  if (v5) {
    [NSString stringWithFormat:@"%@ == \"%@\" || %@ == \"%@\", *MEMORY[0x1E4F23148], @"lnk", *MEMORY[0x1E4F23148], @"at""];
  }
  else {
  uint64_t v6 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F23148], @"lnk"", v10, v11];
  }
  uint64_t v7 = [NSString stringWithFormat:@"%@ == \"%@\" || %@ == \"%@\"", *MEMORY[0x1E4F235E8], v2, *MEMORY[0x1E4F235E8], v3];
  v12[0] = v7;
  v12[1] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v8;
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
        v9 = [NSString stringWithFormat:@"kMDItemAccountIdentifier == \"%@\" || _kMDItemDomainIdentifier == \"%@\"", *(void *)(*((void *)&v19 + 1) + 8 * i), *(void *)(*((void *)&v19 + 1) + 8 * i)];
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__64;
  uint64_t v17 = __Block_byref_object_dispose__64;
  id v18 = 0;
  id v18 = [NSString string];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CKHighlightsSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  void v12[3] = &unk_1E5621A30;
  v12[4] = &v13;
  [v4 enumerateObjectsUsingBlock:v12];
  uint64_t v23 = v14[5];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__CKHighlightsSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

    v9 = (void *)v12;
  }
  else
  {
    uint64_t v10 = [*(id *)(v4 + 40) stringByAppendingString:a2];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (BOOL)useSemanticQuery
{
  return 0;
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
  id v3 = [v2 localizedStringForKey:@"SEARCH_PINS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)sectionIdentifier
{
  return @"HighlightsSearchSection";
}

- (id)reuseIdentifierForIndex:(int64_t)a3
{
  uint64_t v4 = [(CKSearchController *)self results];
  id v5 = [v4 objectAtIndexedSubscript:a3];
  uint64_t v6 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v5];

  int v7 = [v6 isEqualToString:@"at"];
  uint64_t v8 = off_1E561D340;
  if (!v7) {
    uint64_t v8 = off_1E561DAB0;
  }
  v9 = [(__objc2_class *)*v8 reuseIdentifier];

  return v9;
}

+ (id)indexingString
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"PINS_INDEXING_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

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
  [v2 searchHighlightsInterItemSpacing];
  double v4 = v3;

  return v4;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  unint64_t v49 = 0;
  double v50 = 0.0;
  [(CKHighlightsSearchController *)self fractionalWidth:&v50 count:&v49 forLayoutWidth:[(CKSearchController *)self layoutWidth]];
  double v4 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v50];
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isSWYAttachmentsEnabled];

  if (v6)
  {
    uint64_t v7 = [(CKSearchController *)self delegate];
    [v7 containerWidthForController:self];
    double v9 = v8;

    uint64_t v10 = [(CKSearchController *)self delegate];
    [v10 parentMarginInsetsForSearchController:self];
    double v12 = v11;
    double v14 = v13;

    double v15 = v9 - (v12 + v14);
    double v16 = (double)(v49 - 1);
    uint64_t v17 = +[CKUIBehavior sharedBehaviors];
    [v17 searchCollaborationInterItemSpacing];
    double v19 = v15 - v16 * v18;

    double v20 = v19 / (double)v49;
    long long v21 = objc_opt_new();
    objc_msgSend(v21, "setFrame:", 0.0, 0.0, v20, 1.79769313e308);
    long long v22 = objc_alloc_init(CKDetailsAttachmentsSearchController);
    uint64_t v23 = [(CKDetailsAttachmentsSearchController *)v22 sizingCell];
    v24 = [v23 preferredLayoutAttributesFittingAttributes:v21];

    [v24 frame];
    id v25 = [MEMORY[0x1E4F42608] absoluteDimension:CGRectGetHeight(v53)];
    v26 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v4 heightDimension:v25];
  }
  else
  {
    id v25 = v4;
    v26 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v25 heightDimension:v25];
  }
  if ([(CKSearchController *)self suppressAvatars])
  {
    v27 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v26];
  }
  else
  {
    v28 = (void *)MEMORY[0x1E4F42608];
    v29 = +[CKUIBehavior sharedBehaviors];
    [v29 searchResultAvatarSize];
    v30 = objc_msgSend(v28, "absoluteDimension:");

    v31 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v30 heightDimension:v30];
    uint64_t v32 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    if (v32 == 1) {
      uint64_t v33 = 3;
    }
    else {
      uint64_t v33 = 9;
    }
    double v34 = -8.0;
    if (v32 == 1) {
      double v34 = 8.0;
    }
    v35 = [MEMORY[0x1E4F425F0] layoutAnchorWithEdges:v33 absoluteOffset:v34];
    v36 = (void *)MEMORY[0x1E4F42648];
    v37 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    v38 = [v36 supplementaryItemWithLayoutSize:v31 elementKind:v37 containerAnchor:v35];

    v39 = (void *)MEMORY[0x1E4F42628];
    v51[0] = v38;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    v27 = [v39 itemWithLayoutSize:v26 supplementaryItems:v40];
  }
  v41 = (void *)MEMORY[0x1E4F42638];
  v42 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  v43 = [v41 sizeWithWidthDimension:v42 heightDimension:v25];

  v44 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v43 subitem:v27 count:v49];
  v45 = (void *)MEMORY[0x1E4F42640];
  v46 = +[CKUIBehavior sharedBehaviors];
  [v46 searchHighlightsInterItemSpacing];
  v47 = objc_msgSend(v45, "fixedSpacing:");
  [v44 setInterItemSpacing:v47];

  return v44;
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
    v9.super_class = (Class)CKHighlightsSearchController;
    [(CKMessageTypeSearchController *)&v9 fractionalWidth:a3 count:a4 forLayoutWidth:a5];
  }
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(CKSearchController *)self results];
  double v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
  double v13 = [v12 item];

  double v14 = +[CKSpotlightQueryResultUtilities indexItemTypeForItem:v13];
  if ([v14 isEqualToString:@"lnk"])
  {
    v19.receiver = self;
    v19.super_class = (Class)CKHighlightsSearchController;
    -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v19, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v8, v9, v10, v17.receiver, v17.super_class);
  }
  else
  {
    if ([v14 isEqualToString:@"at"])
    {
      v18.receiver = self;
      v18.super_class = (Class)CKHighlightsSearchController;
      double v15 = [(CKSearchController *)&v18 cellForItemInCollectionView:v8 atIndexPath:v9 withIdentifier:v10];
      objc_msgSend(v15, "setSuppressAvatars:", -[CKSearchController suppressAvatars](self, "suppressAvatars"));
      goto LABEL_7;
    }
    -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v17, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v8, v9, v10, self, CKHighlightsSearchController);
  double v15 = };
LABEL_7:

  return v15;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    double v13 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
    double v14 = +[CKDetailsSearchResultsFooterCell reuseIdentifier];
    double v15 = [v8 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v14 forIndexPath:v9];

    double v16 = NSString;
    objc_super v17 = CKFrameworkBundle();
    objc_super v18 = [v17 localizedStringForKey:@"SEE_ALL_LINKS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    objc_super v19 = [v16 stringWithFormat:v18];

    double v20 = [MEMORY[0x1E4F42738] sharedApplication];
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
  id v25 = +[CKSearchAvatarSupplementryView supplementaryViewType];
  int v26 = [v10 isEqualToString:v25];

  if (v26)
  {
    v27 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    v28 = +[CKSearchAvatarSupplementryView reuseIdentifier];
    double v15 = [v8 dequeueReusableSupplementaryViewOfKind:v27 withReuseIdentifier:v28 forIndexPath:v9];

    unint64_t v29 = [v9 row];
    v30 = [(CKSearchController *)self results];
    unint64_t v31 = [v30 count];

    if (v29 >= v31) {
      goto LABEL_11;
    }
    uint64_t v32 = [(CKSearchController *)self results];
    v24 = objc_msgSend(v32, "objectAtIndex:", objc_msgSend(v9, "row"));

    uint64_t v33 = +[CKSpotlightQueryResultUtilities contactForResult:v24];
    [v15 setContact:v33];
    [v15 setAssociatedResult:v24];
    [v15 setParentContentType:2];

    goto LABEL_9;
  }
  double v15 = 0;
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
    double v11 = [(CKSearchController *)self results];
    int v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));

    double v13 = [v16 associatedResult];
    char v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      double v15 = +[CKSpotlightQueryResultUtilities contactForResult:v12];
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
      id v6 = [(CKHighlightsSearchController *)self linksController];
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
  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isSWYAttachmentsEnabled];

  int v8 = [v5 isEqualToString:@"lnk"];
  if (!v7)
  {
    if (!v8) {
      goto LABEL_8;
    }
LABEL_6:
    id v9 = [(CKHighlightsSearchController *)self linksController];
    goto LABEL_7;
  }
  if (v8) {
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"at"])
  {
    id v9 = [(CKHighlightsSearchController *)self attachmentsController];
LABEL_7:
    unint64_t v10 = v9;
    double v11 = [v9 _activityItemProviderForResult:v4];

    goto LABEL_9;
  }
LABEL_8:
  double v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  id v4 = a3;
  id v5 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v4];
  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isSWYAttachmentsEnabled];

  int v8 = [v5 isEqualToString:@"lnk"];
  if (!v7)
  {
    if (!v8) {
      goto LABEL_8;
    }
LABEL_6:
    id v9 = [(CKHighlightsSearchController *)self linksController];
    goto LABEL_7;
  }
  if (v8) {
    goto LABEL_6;
  }
  if (![v5 isEqualToString:@"at"])
  {
LABEL_8:
    char v11 = 0;
    goto LABEL_9;
  }
  id v9 = [(CKHighlightsSearchController *)self attachmentsController];
LABEL_7:
  unint64_t v10 = v9;
  char v11 = [v9 handleSelectionForResult:v4];

LABEL_9:
  return v11;
}

- (id)createFoundItemsHandler
{
  id location = 0;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CKHighlightsSearchController_createFoundItemsHandler__block_invoke;
  v4[3] = &unk_1E5623920;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __55__CKHighlightsSearchController_createFoundItemsHandler__block_invoke(uint64_t a1, void *a2)
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
      char v11 = 0;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          double v15 = +[CKSpotlightQueryResultUtilities indexItemTypeForItem:](CKSpotlightQueryResultUtilities, "indexItemTypeForItem:", v14, location);
          if (([v15 isEqualToString:@"lnk"] & 1) != 0
            || [v15 isEqualToString:@"at"])
          {
            if (!v11)
            {
              char v11 = [MEMORY[0x1E4F1CA48] array];
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
      char v11 = 0;
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

    double v20 = [v19 setByAddingObjectsFromArray:v11];

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
    char v6 = [(CKHighlightsSearchController *)self linksController];
    id v7 = [v6 _additionalMenuElementsForResult:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)deleteAttachmentForResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 item];
  char v6 = [v5 uniqueIdentifier];

  id v7 = [MEMORY[0x1E4F6BC30] sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CKHighlightsSearchController_deleteAttachmentForResult___block_invoke;
  v9[3] = &unk_1E5621A80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 loadMessageItemWithGUID:v6 completionBlock:v9];
}

- (id)previewViewControllerForResult:(id)a3
{
  id v4 = a3;
  id v5 = +[CKSpotlightQueryResultUtilities indexItemTypeForResult:v4];
  char v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isSWYAttachmentsEnabled];

  int v8 = [v5 isEqualToString:@"lnk"];
  if (!v7)
  {
    if (!v8) {
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v9 = [(CKHighlightsSearchController *)self linksController];
    goto LABEL_7;
  }
  if (v8) {
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"at"])
  {
    uint64_t v9 = [(CKHighlightsSearchController *)self attachmentsController];
LABEL_7:
    id v10 = v9;
    char v11 = [v9 previewViewControllerForResult:v4];

    goto LABEL_9;
  }
LABEL_8:
  char v11 = 0;
LABEL_9:

  return v11;
}

- (id)attachmentsController
{
  uint64_t v2 = objc_alloc_init(CKAttachmentsSearchController);

  return v2;
}

- (id)linksController
{
  uint64_t v2 = objc_alloc_init(CKLinkSearchController);

  return v2;
}

@end