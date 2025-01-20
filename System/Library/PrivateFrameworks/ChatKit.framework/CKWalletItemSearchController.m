@interface CKWalletItemSearchController
+ (BOOL)previewControllerPresentsModally;
+ (BOOL)supportsQuicklookForResult:(id)a3;
+ (Class)cellClass;
+ (id)indexingString;
+ (id)reuseIdentifier;
+ (id)reuseIdentifierForMode:(unint64_t)a3;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
+ (id)supportedCellClasses;
+ (unint64_t)recencyRankedTargetResultCount;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)useSemanticQuery;
- (double)interGroupSpacing;
- (id)_activityItemProviderForResult:(id)a3;
- (id)_addOrderViewControllerForURL:(id)a3;
- (id)_addPassViewControllerForURL:(id)a3;
- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)detailsFilterQueriesForChatGUIDs:(id)a3;
- (id)fetchAttributes;
- (id)filterQueries;
- (id)layoutGroupWithEnvironment:(id)a3;
- (id)previewViewControllerForResult:(id)a3;
- (id)queryAttributesForText:(id)a3;
- (unint64_t)searchTokenContentType;
- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4;
@end

@implementation CKWalletItemSearchController

- (unint64_t)searchTokenContentType
{
  return 5;
}

- (id)filterQueries
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F22D28], @"attachmentDomain""];
  v6[0] = v2;
  v3 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F23148], @"pa""];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)sectionTitle
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"SEARCH_WALLET_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)sectionIdentifier
{
  return @"WalletItemSearchSection";
}

+ (id)reuseIdentifier
{
  return +[CKWalletItemLinkSearchResultCell reuseIdentifier];
}

+ (id)indexingString
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"WALLET_ITEMS_INDEXING_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (Class)cellClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedCellClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = [a1 cellClass];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKWalletItemLinkSearchResultCell reuseIdentifier];
}

- (id)fetchAttributes
{
  v9[10] = *MEMORY[0x1E4F143B8];
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
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:10];

  return v7;
}

- (id)queryAttributesForText:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    uint64_t v3 = *MEMORY[0x1E4F22B30];
    v10[0] = *MEMORY[0x1E4F234B0];
    v10[1] = v3;
    v10[2] = *MEMORY[0x1E4F235F8];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v5 = v10;
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F235F8];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v5 = &v9;
    uint64_t v6 = 1;
  }
  v7 = [v4 arrayWithObjects:v5 count:v6];

  return v7;
}

- (BOOL)useSemanticQuery
{
  return 0;
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
    uint64_t v8 = *MEMORY[0x1E4F22A10];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        v10 = [NSString stringWithFormat:@"%@ == \"%@\"", v8, *(void *)(*((void *)&v20 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__73;
  v18 = __Block_byref_object_dispose__73;
  id v19 = 0;
  id v19 = [NSString string];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__CKWalletItemSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E5621A30;
  v13[4] = &v14;
  [v4 enumerateObjectsUsingBlock:v13];
  uint64_t v24 = v15[5];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __65__CKWalletItemSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

+ (unint64_t)recencyRankedTargetResultCount
{
  return 10;
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 0;
}

+ (BOOL)previewControllerPresentsModally
{
  return 1;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v3 = [a3 attributeSet];
  uint64_t v4 = [v3 accountIdentifier];

  return v4;
}

- (double)interGroupSpacing
{
  return 5.0;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)previewViewControllerForResult:(id)a3
{
  uint64_t v4 = [a3 item];
  id v5 = [v4 attributeSet];
  uint64_t v6 = [v5 contentURL];

  uint64_t v7 = [v6 pathExtension];
  LODWORD(v5) = [v7 isEqualToString:@"pkpass"];

  if (v5)
  {
    uint64_t v8 = [(CKWalletItemSearchController *)self _addPassViewControllerForURL:v6];
LABEL_5:
    uint64_t v11 = (void *)v8;
    goto LABEL_7;
  }
  uint64_t v9 = [v6 pathExtension];
  int v10 = [v9 isEqualToString:@"order"];

  if (v10)
  {
    uint64_t v8 = [(CKWalletItemSearchController *)self _addOrderViewControllerForURL:v6];
    goto LABEL_5;
  }
  uint64_t v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v15 = [v6 pathExtension];
  _IMWarn();

  uint64_t v11 = 0;
LABEL_7:

  return v11;
}

- (id)_addPassViewControllerForURL:(id)a3
{
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:8 error:0];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc((Class)MEMORY[0x192FBA860](@"PKPass", @"PassKit")), "initWithData:error:", v3, 0);
    id v5 = +[CKPassKitHelper addPassesViewControllerForPass:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_addOrderViewControllerForURL:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v4 = (void *)getFKOrderImportPreviewControllerProviderClass_softClass_0;
  uint64_t v17 = getFKOrderImportPreviewControllerProviderClass_softClass_0;
  if (!getFKOrderImportPreviewControllerProviderClass_softClass_0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getFKOrderImportPreviewControllerProviderClass_block_invoke_0;
    v13[3] = &unk_1E5620B90;
    v13[4] = &v14;
    __getFKOrderImportPreviewControllerProviderClass_block_invoke_0((uint64_t)v13);
    uint64_t v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CKWalletItemSearchController__addOrderViewControllerForURL___block_invoke;
  v11[3] = &unk_1E5627C78;
  id v12 = 0;
  uint64_t v6 = [v5 makeViewControllerWithOrderURL:v3 completion:v11 error:&v10];
  id v7 = v10;
  if (v7)
  {
    uint64_t v9 = [v3 absoluteString];
    _IMWarn();
  }

  return v6;
}

void __62__CKWalletItemSearchController__addOrderViewControllerForURL___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = [v1 localizedDescription];
    _IMWarn();
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
  id v7 = [(CKSearchController *)self delegate];
  uint64_t v8 = [v7 searchController:self cellForResult:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = 0;
    goto LABEL_7;
  }
  uint64_t v9 = [v8 previewSnapshot];

  if (!v9)
  {
LABEL_5:
    id v19 = 0;
    goto LABEL_8;
  }
  id v10 = [v4 item];
  uint64_t v11 = [v10 attributeSet];

  id v12 = [v11 contentURL];
  v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  uint64_t v14 = objc_msgSend(v11, "__ck_spotlightItemSnippet");
  id v15 = objc_alloc_init(MEMORY[0x1E4F30A28]);
  [v15 setName:v14];
  uint64_t v16 = IMUTITypeForFilename();
  [v15 setType:v16];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v9];
  [v15 setThumbnail:v17];
  id v18 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  [v18 setSpecialization:v15];
  id v19 = [[CKSearchActivityItemProvider alloc] initWithPlaceholderItem:v13 metadata:v18];

  uint64_t v8 = (void *)v9;
LABEL_7:

LABEL_8:

  return v19;
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  double v37 = 0.0;
  [(CKMessageTypeSearchController *)self fractionalWidth:&v37 count:&v36 forLayoutWidth:[(CKSearchController *)self layoutWidth]];
  id v4 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v37];
  id v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 isAccessibilityPreferredContentSizeCategory];

  id v7 = (void *)MEMORY[0x1E4F42608];
  double v8 = v37;
  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  id v10 = v9;
  if (v6) {
    [v9 searchLinksFractionalWidthScale];
  }
  else {
    [v9 searchLinksFractionalHeightScale];
  }
  id v12 = [v7 fractionalWidthDimension:v8 * v11];

  v13 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v4 heightDimension:v12];
  if ([(CKSearchController *)self suppressAvatars])
  {
    uint64_t v14 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v13];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F42608];
    uint64_t v16 = +[CKUIBehavior sharedBehaviors];
    [v16 searchResultAvatarSize];
    uint64_t v17 = objc_msgSend(v15, "absoluteDimension:");

    id v18 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v17 heightDimension:v17];
    uint64_t v19 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    if (v19 == 1) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 9;
    }
    double v21 = -8.0;
    if (v19 == 1) {
      double v21 = 8.0;
    }
    long long v22 = [MEMORY[0x1E4F425F0] layoutAnchorWithEdges:v20 absoluteOffset:v21];
    long long v23 = (void *)MEMORY[0x1E4F42648];
    uint64_t v24 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    v25 = [v23 supplementaryItemWithLayoutSize:v18 elementKind:v24 containerAnchor:v22];

    uint64_t v26 = (void *)MEMORY[0x1E4F42628];
    v38[0] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    uint64_t v14 = [v26 itemWithLayoutSize:v13 supplementaryItems:v27];
  }
  v28 = (void *)MEMORY[0x1E4F42638];
  v29 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  v30 = [v28 sizeWithWidthDimension:v29 heightDimension:v12];

  v31 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v30 subitem:v14 count:v36];
  v32 = (void *)MEMORY[0x1E4F42640];
  v33 = +[CKUIBehavior sharedBehaviors];
  [v33 searchLinksInterItemSpacing];
  v34 = objc_msgSend(v32, "fixedSpacing:");
  [v31 setInterItemSpacing:v34];

  return v31;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  double v11 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    v13 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
    uint64_t v14 = +[CKDetailsSearchResultsFooterCell reuseIdentifier];
    id v15 = [v10 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v14 forIndexPath:v8];

    uint64_t v16 = NSString;
    uint64_t v17 = CKFrameworkBundle();
    id v18 = [v17 localizedStringForKey:@"SEE_ALL_LINKS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v19 = [v16 stringWithFormat:v18];

    uint64_t v20 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v21 = [v20 userInterfaceLayoutDirection];

    if (v21 == 1) {
      long long v22 = @"\u200F";
    }
    else {
      long long v22 = @"\u200E";
    }
    long long v23 = [(__CFString *)v22 stringByAppendingString:v19];

    [v15 setTitle:v23];
    uint64_t v24 = [(id)objc_opt_class() sectionIdentifier];
    [v15 setSectionIdentifier:v24];
  }
  else
  {
    v25 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    uint64_t v26 = +[CKSearchAvatarSupplementryView reuseIdentifier];
    id v15 = [v10 dequeueReusableSupplementaryViewOfKind:v25 withReuseIdentifier:v26 forIndexPath:v8];

    unint64_t v27 = [v8 row];
    v28 = [(CKSearchController *)self results];
    unint64_t v29 = [v28 count];

    if (v27 >= v29) {
      goto LABEL_9;
    }
    v30 = [(CKSearchController *)self results];
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
    double v11 = [(CKSearchController *)self results];
    int v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));

    v13 = [v16 associatedResult];
    char v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      id v15 = +[CKSpotlightQueryResultUtilities contactForResult:v12];
      [v16 setContact:v15];
      [v16 setAssociatedResult:v12];
      [v16 setNeedsLayout];
    }
  }
}

@end