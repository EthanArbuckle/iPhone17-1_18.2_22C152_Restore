@interface CKLinkSearchController
+ (BOOL)handleSelectionForResult:(id)a3;
+ (Class)cellClassForMode:(unint64_t)a3;
+ (id)_additionalMenuElementsForResult:(id)a3;
+ (id)indexingString;
+ (id)itemProviderForSearchResult:(id)a3;
+ (id)reuseIdentifierForMode:(unint64_t)a3;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)handleSelectionForResult:(id)a3;
- (BOOL)shouldStartMenuInteractionForResult:(id)a3;
- (Class)_richLinkDatasourceClass;
- (double)interGroupSpacing;
- (id)_activityItemProviderForResult:(id)a3;
- (id)_additionalMenuElementsForResult:(id)a3;
- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5;
- (id)detailsFilterQueriesForChatGUIDs:(id)a3;
- (id)fetchAttributes;
- (id)filterQueries;
- (id)itemProviderForSearchResult:(id)a3;
- (id)layoutGroupWithEnvironment:(id)a3;
- (id)previewViewControllerForResult:(id)a3;
- (id)queryAttributesForText:(id)a3;
- (id)queryResultsForItems:(id)a3;
- (unint64_t)searchTokenContentType;
- (void)deleteAttachmentForResult:(id)a3;
- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5;
- (void)postProcessAndUpdateResults:(id)a3;
- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4;
@end

@implementation CKLinkSearchController

- (unint64_t)searchTokenContentType
{
  return 2;
}

- (id)fetchAttributes
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F23080];
  v6[0] = @"com_apple_mobilesms_lpPluginPaths";
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F22C38];
  v6[2] = *MEMORY[0x1E4F23660];
  v6[3] = v3;
  v6[4] = *MEMORY[0x1E4F22B00];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];

  return v4;
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    uint64_t v3 = *MEMORY[0x1E4F23660];
    v11 = @"com_apple_mobilesms_lpDescription";
    uint64_t v12 = v3;
    uint64_t v4 = *MEMORY[0x1E4F234B0];
    uint64_t v13 = *MEMORY[0x1E4F22B30];
    uint64_t v14 = v4;
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v11;
    uint64_t v7 = 4;
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F23660];
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = (__CFString **)&v10;
    uint64_t v7 = 1;
  }
  v8 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v10, v11, v12, v13, v14);

  return v8;
}

- (id)filterQueries
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F23148], @"lnk""];
  v13[0] = v2;
  uint64_t v3 = NSString;
  uint64_t v4 = *MEMORY[0x1E4F22B10];
  uint64_t v5 = *MEMORY[0x1E4F234A0];
  uint64_t v6 = *MEMORY[0x1E4F23080];
  uint64_t v7 = [NSNumber numberWithBool:1];
  v8 = [NSNumber numberWithBool:1];
  v9 = [NSNumber numberWithBool:0];
  uint64_t v10 = [v3 stringWithFormat:@"(%@ == \"*\" || %@ == \"*\" || %@ == \"%@\" || %@ == \"%@\", v4, v5, v6, v7, @"com_apple_mobilesms_businessChat", v8, @"com_apple_mobilesms_dataDetectedLink"", v9];
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = *MEMORY[0x1E4F22D28];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [NSString stringWithFormat:@"%@ == \"%@\"", v8, *(void *)(*((void *)&v20 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  id v19 = [NSString string];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__CKLinkSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  void v13[3] = &unk_1E5621A30;
  v13[4] = &v14;
  [v4 enumerateObjectsUsingBlock:v13];
  uint64_t v24 = v15[5];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __59__CKLinkSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

+ (id)sectionTitle
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"SEARCH_LINKS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)sectionIdentifier
{
  return @"LinkSearchSection";
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKLinkSearchResultCell reuseIdentifier];
}

+ (id)indexingString
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"LINKS_INDEXING_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return (Class)objc_opt_class();
}

- (double)interGroupSpacing
{
  uint64_t v2 = +[CKUIBehavior sharedBehaviors];
  [v2 searchLinksInterItemSpacing];
  double v4 = v3 * 0.5;

  return v4;
}

- (id)queryResultsForItems:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v26 = [(CKMessageTypeSearchController *)self maxResultsForMode:[(CKSearchController *)self mode]];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = [v4 count];
      __int16 v34 = 2048;
      unint64_t v35 = v26;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Got %lu results. Max is %lu", buf, 0x16u);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v25 = *(void *)v28;
LABEL_7:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v28 != v25) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
      uint64_t v10 = [(CKMessageTypeSearchController *)self chatGUIDForSearchableItem:v9];
      uint64_t v11 = [(CKSearchController *)self delegate];
      uint64_t v12 = [v11 searchController:self conversationForChatGUID:v10];

      if (v12 && ([v12 isBlockedByCommunicationLimits] & 1) == 0)
      {
        uint64_t v13 = [v9 attributeSet];
        uint64_t v14 = [v13 URL];

        if (([v23 containsObject:v14] & 1) == 0)
        {
          if (v14) {
            [v23 addObject:v14];
          }
          uint64_t v15 = [CKSpotlightQueryResult alloc];
          uint64_t v16 = [(id)objc_opt_class() sectionIdentifier];
          v17 = [(CKSpotlightQueryResult *)v15 initWithSearchableItem:v9 inSection:v16 withConversation:v12];

          [v22 addObject:v17];
          ++v7;
        }
      }
      if (v7 >= v26) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v6) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v22 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v19;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Returning %lu results", buf, 0xCu);
    }
  }
  long long v20 = (void *)[v22 copy];

  return v20;
}

- (void)postProcessAndUpdateResults:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[CKLinkSearchController postProcessAndUpdateResults:]";
      __int16 v9 = 2048;
      uint64_t v10 = [v4 count];
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s got %lu results", (uint8_t *)&v7, 0x16u);
    }
  }
  [(CKSearchController *)self setResults:v4];
  uint64_t v6 = [(CKSearchController *)self delegate];
  [v6 searchControllerContentsDidChange:self];
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
    uint64_t v14 = +[CKDetailsSearchResultsFooterCell reuseIdentifier];
    uint64_t v15 = [v10 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v14 forIndexPath:v8];

    uint64_t v16 = NSString;
    v17 = CKFrameworkBundle();
    v18 = [v17 localizedStringForKey:@"SEE_ALL_LINKS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v19 = [v16 stringWithFormat:v18];

    long long v20 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v21 = [v20 userInterfaceLayoutDirection];

    if (v21 == 1) {
      long long v22 = @"\u200F";
    }
    else {
      long long v22 = @"\u200E";
    }
    id v23 = [(__CFString *)v22 stringByAppendingString:v19];

    [v15 setTitle:v23];
    uint64_t v24 = [(id)objc_opt_class() sectionIdentifier];
    [v15 setSectionIdentifier:v24];
  }
  else
  {
    uint64_t v25 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    unint64_t v26 = +[CKSearchAvatarSupplementryView reuseIdentifier];
    uint64_t v15 = [v10 dequeueReusableSupplementaryViewOfKind:v25 withReuseIdentifier:v26 forIndexPath:v8];

    unint64_t v27 = [v8 row];
    long long v28 = [(CKSearchController *)self results];
    unint64_t v29 = [v28 count];

    if (v27 >= v29) {
      goto LABEL_9;
    }
    long long v30 = [(CKSearchController *)self results];
    uint64_t v24 = objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v8, "row"));

    v31 = +[CKSpotlightQueryResultUtilities contactForResult:v24];
    [v15 setContact:v31];
    [v15 setAssociatedResult:v24];
    [v15 setParentContentType:2];
  }
LABEL_9:

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

- (id)layoutGroupWithEnvironment:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  double v36 = 0.0;
  [(CKLinkSearchController *)self fractionalWidth:&v36 count:&v35 forLayoutWidth:[(CKSearchController *)self layoutWidth]];
  id v4 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v36];
  id v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 isAccessibilityPreferredContentSizeCategory];

  id v7 = (void *)MEMORY[0x1E4F42608];
  double v8 = v36;
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v36 * 1.2];
  }
  else
  {
    unint64_t v10 = +[CKUIBehavior sharedBehaviors];
    [v10 searchLinksFractionalHeightScale];
    id v9 = [v7 fractionalWidthDimension:v8 * v11];
  }
  int v12 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v4 heightDimension:v9];
  if ([(CKSearchController *)self suppressAvatars])
  {
    uint64_t v13 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v12];
  }
  else
  {
    char v14 = (void *)MEMORY[0x1E4F42608];
    uint64_t v15 = +[CKUIBehavior sharedBehaviors];
    [v15 searchResultAvatarSize];
    id v16 = objc_msgSend(v14, "absoluteDimension:");

    v17 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v16 heightDimension:v16];
    uint64_t v18 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    if (v18 == 1) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 9;
    }
    double v20 = -8.0;
    if (v18 == 1) {
      double v20 = 8.0;
    }
    uint64_t v21 = [MEMORY[0x1E4F425F0] layoutAnchorWithEdges:v19 absoluteOffset:v20];
    long long v22 = (void *)MEMORY[0x1E4F42648];
    id v23 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    uint64_t v24 = [v22 supplementaryItemWithLayoutSize:v17 elementKind:v23 containerAnchor:v21];

    uint64_t v25 = (void *)MEMORY[0x1E4F42628];
    v37[0] = v24;
    unint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v13 = [v25 itemWithLayoutSize:v12 supplementaryItems:v26];
  }
  unint64_t v27 = (void *)MEMORY[0x1E4F42638];
  long long v28 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  unint64_t v29 = [v27 sizeWithWidthDimension:v28 heightDimension:v9];

  long long v30 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v29 subitem:v13 count:v35];
  v31 = (void *)MEMORY[0x1E4F42640];
  v32 = +[CKUIBehavior sharedBehaviors];
  [v32 searchLinksInterItemSpacing];
  uint64_t v33 = objc_msgSend(v31, "fixedSpacing:");
  [v30 setInterItemSpacing:v33];

  return v30;
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
    v9.super_class = (Class)CKLinkSearchController;
    [(CKMessageTypeSearchController *)&v9 fractionalWidth:a3 count:a4 forLayoutWidth:a5];
  }
}

- (Class)_richLinkDatasourceClass
{
  uint64_t v2 = [MEMORY[0x1E4F6BC18] sharedInstance];
  double v3 = [v2 dataSourceClassForBundleID:*MEMORY[0x1E4F6CC10]];

  return (Class)v3;
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  return +[CKLinkSearchController _additionalMenuElementsForResult:a3];
}

+ (id)_additionalMenuElementsForResult:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"safari"];
  id v5 = (void *)MEMORY[0x1E4F426E8];
  int v6 = CKFrameworkBundle();
  id v7 = [v6 localizedStringForKey:@"SEARCH_OPEN_LINK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__CKLinkSearchController__additionalMenuElementsForResult___block_invoke;
  v12[3] = &unk_1E56211C8;
  id v13 = v3;
  id v8 = v3;
  objc_super v9 = [v5 actionWithTitle:v7 image:v4 identifier:0 handler:v12];

  v14[0] = v9;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  return v10;
}

void __59__CKLinkSearchController__additionalMenuElementsForResult___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) item];
  uint64_t v2 = [v1 attributeSet];
  id v4 = [v2 URL];

  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 openURL:v4 withCompletionHandler:0];
}

- (id)itemProviderForSearchResult:(id)a3
{
  return +[CKLinkSearchController itemProviderForSearchResult:a3];
}

+ (id)itemProviderForSearchResult:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 item];
    int v6 = [v5 attributeSet];
    id v7 = [v6 URL];

    if (v7)
    {
      id v8 = [v7 absoluteString];
      objc_super v9 = [v8 dataUsingEncoding:4];
      id v10 = objc_alloc_init(MEMORY[0x1E4F28D78]);
      uint64_t v11 = *MEMORY[0x1E4F226F8];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__CKLinkSearchController_itemProviderForSearchResult___block_invoke;
      v20[3] = &unk_1E5621A58;
      id v12 = v9;
      id v21 = v12;
      [v10 registerDataRepresentationForTypeIdentifier:v11 visibility:0 loadHandler:v20];
      uint64_t v13 = *MEMORY[0x1E4F22708];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__CKLinkSearchController_itemProviderForSearchResult___block_invoke_2;
      v18[3] = &unk_1E5621A58;
      id v19 = v12;
      id v14 = v12;
      [v10 registerDataRepresentationForTypeIdentifier:v13 visibility:0 loadHandler:v18];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Unexpected nil URL for link search results", buf, 2u);
        }
      }
      id v10 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Unexpected nil search result when trying to create NSItemProvider for link", buf, 2u);
      }
    }
    id v10 = 0;
  }

  return v10;
}

uint64_t __54__CKLinkSearchController_itemProviderForSearchResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __54__CKLinkSearchController_itemProviderForSearchResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v3 = a3;
  id v4 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  id v5 = [v4 cachedLinkMetadataForQueryResult:v3];

  if (v5)
  {
    int v6 = [v3 item];
    id v7 = [v6 attributeSet];

    id v8 = [v7 URL];
    objc_super v9 = [[CKSearchActivityItemProvider alloc] initWithPlaceholderItem:v8 metadata:v5];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)deleteAttachmentForResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 item];
  int v6 = [v5 uniqueIdentifier];

  id v7 = [MEMORY[0x1E4F6BC30] sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__CKLinkSearchController_deleteAttachmentForResult___block_invoke;
  v9[3] = &unk_1E5621A80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 loadMessageItemWithGUID:v6 completionBlock:v9];
}

void __52__CKLinkSearchController_deleteAttachmentForResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 removeResult:v4];
  int v6 = [*(id *)(a1 + 32) delegate];
  [v6 searchControllerContentsDidChange:*(void *)(a1 + 32)];

  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 deleteMessageItem:v5];
}

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  id v3 = [a3 item];
  uint64_t v4 = [v3 attributeSet];

  id v5 = [v4 URL];
  BOOL v6 = !shouldDisable3DTouchPreviewWithNegativeFeedbackForURL(v5);

  return v6;
}

- (id)previewViewControllerForResult:(id)a3
{
  id v3 = [a3 item];
  uint64_t v4 = [v3 attributeSet];

  id v5 = [v4 URL];
  if (shouldDisable3DTouchPreviewWithNegativeFeedbackForURL(v5)
    || (BOOL v6 = (objc_class *)MEMORY[0x192FBA860](@"MLULookupItem", @"MobileLookup")) == 0)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = objc_msgSend([v6 alloc], "initWithURL:dataDetectorsResult:text:range:", v5, 0, &stru_1EDE4CA38, 0, 0);
    [v7 resolve];
    id v8 = [v7 viewControllerToPresent];
  }

  return v8;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  return +[CKLinkSearchController handleSelectionForResult:a3];
}

+ (BOOL)handleSelectionForResult:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 item];
  id v5 = [v4 attributeSet];
  BOOL v6 = [v5 URL];

  id v7 = (void *)MEMORY[0x1E4F6BC10];
  id v8 = [v3 conversation];
  objc_super v9 = [v8 chat];
  id v10 = [v9 lastAddressedHandleID];
  uint64_t v11 = [v3 linkMetadata];

  id v12 = [v7 URLForDugongShareURL:v6 handle:v10 metadata:v11];

  uint64_t v13 = [MEMORY[0x1E4F42738] sharedApplication];
  [v13 openURL:v12 withCompletionHandler:0];

  return 1;
}

@end