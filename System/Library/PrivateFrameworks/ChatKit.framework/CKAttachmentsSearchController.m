@interface CKAttachmentsSearchController
+ (BOOL)supportsMacSelection;
+ (BOOL)supportsQuicklookForResult:(id)a3;
+ (Class)cellClassForMode:(unint64_t)a3;
+ (id)indexingString;
+ (id)reuseIdentifierForMode:(unint64_t)a3;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)handleSelectionForResult:(id)a3;
- (BOOL)useSemanticQuery;
- (double)interGroupSpacing;
- (id)_activityItemProviderForResult:(id)a3;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)detailsFilterQueriesForChatGUIDs:(id)a3;
- (id)fetchAttributes;
- (id)filterQueries;
- (id)layoutGroupWithEnvironment:(id)a3;
- (id)previewViewControllerForResult:(id)a3;
- (id)queryAttributesForText:(id)a3;
- (unint64_t)maxResultsForMode:(unint64_t)a3;
- (unint64_t)searchTokenContentType;
- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5;
@end

@implementation CKAttachmentsSearchController

- (unint64_t)searchTokenContentType
{
  return 6;
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
  v11[5] = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    uint64_t v3 = *MEMORY[0x1E4F22B30];
    v11[0] = *MEMORY[0x1E4F234B0];
    v11[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F22D00];
    v11[2] = *MEMORY[0x1E4F235F8];
    v11[3] = v4;
    v11[4] = *MEMORY[0x1E4F22D18];
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = v11;
    uint64_t v7 = 5;
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F235F8];
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = &v10;
    uint64_t v7 = 1;
  }
  v8 = [v5 arrayWithObjects:v6 count:v7];

  return v8;
}

- (id)filterQueries
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F22D28], @"attachmentDomain""];
  v6[0] = v2;
  uint64_t v3 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F23148], @"at""];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
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
        uint64_t v10 = [NSString stringWithFormat:@"%@ == \"%@\"", v8, *(void *)(*((void *)&v20 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__45;
  v18 = __Block_byref_object_dispose__45;
  id v19 = 0;
  id v19 = [NSString string];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__CKAttachmentsSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E5621A30;
  v13[4] = &v14;
  [v4 enumerateObjectsUsingBlock:v13];
  uint64_t v24 = v15[5];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __66__CKAttachmentsSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  unint64_t v5 = [(CKSearchController *)self layoutWidth];
  switch([(CKSearchController *)self mode])
  {
    case 0uLL:
      if (v5) {
        unint64_t result = 9;
      }
      else {
        unint64_t result = 6;
      }
      break;
    case 1uLL:
    case 3uLL:
      if (v5)
      {
        if (v5 == 2)
        {
          if (CKIsRunningInMacCatalyst()) {
            unint64_t result = 9;
          }
          else {
            unint64_t result = 8;
          }
        }
        else
        {
          unint64_t result = 6;
        }
      }
      else
      {
        unint64_t result = 2;
      }
      break;
    case 2uLL:
    case 4uLL:
      v7.receiver = self;
      v7.super_class = (Class)CKAttachmentsSearchController;
      unint64_t result = [(CKMessageTypeSearchController *)&v7 maxResultsForMode:a3];
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (BOOL)useSemanticQuery
{
  return 0;
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  if (!a5)
  {
    double v7 = 0.5;
    unint64_t v9 = 2;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (a5 != 2)
  {
    unint64_t v9 = 3;
    double v7 = 0.33;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (CKIsRunningInMacCatalyst()) {
    double v7 = 0.33;
  }
  else {
    double v7 = 0.25;
  }
  int v8 = CKIsRunningInMacCatalyst();
  unint64_t v9 = 3;
  if (!v8) {
    unint64_t v9 = 4;
  }
  if (a3) {
LABEL_13:
  }
    *a3 = v7;
LABEL_14:
  if (a4) {
    *a4 = v9;
  }
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  id v3 = [a3 item];
  uint64_t v4 = [v3 attributeSet];
  unint64_t v5 = objc_msgSend(v4, "__ck_spotlightItemSnippet");

  uint64_t v6 = IMUTITypeForFilename();
  LOBYTE(v4) = IMUTTypeWantsQuicklook();

  return (char)v4;
}

+ (BOOL)supportsMacSelection
{
  return 1;
}

+ (id)sectionTitle
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"SEARCH_ATTACHMENTS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)sectionIdentifier
{
  return @"AttachmentsSearchSection";
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v3 = [a3 attributeSet];
  uint64_t v4 = [v3 accountIdentifier];

  return v4;
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKAttachmentSearchResultCell reuseIdentifier];
}

+ (id)indexingString
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"ATTACHMENTS_INDEXING_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return (Class)objc_opt_class();
}

- (double)interGroupSpacing
{
  uint64_t v2 = +[CKUIBehavior sharedBehaviors];
  [v2 searchAttachmentsInterItemSpacing];
  double v4 = v3 * 0.5;

  return v4;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  uint64_t v15 = 0;
  double v16 = 0.0;
  [(CKAttachmentsSearchController *)self fractionalWidth:&v16 count:&v15 forLayoutWidth:[(CKSearchController *)self layoutWidth]];
  double v3 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v16];
  double v4 = [MEMORY[0x1E4F42608] estimatedDimension:300.0];
  unint64_t v5 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v3 heightDimension:v4];
  uint64_t v6 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v5];
  double v7 = (void *)MEMORY[0x1E4F42638];
  int v8 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  unint64_t v9 = [v7 sizeWithWidthDimension:v8 heightDimension:v4];

  uint64_t v10 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v9 subitem:v6 count:v15];
  uint64_t v11 = (void *)MEMORY[0x1E4F42640];
  uint64_t v12 = +[CKUIBehavior sharedBehaviors];
  [v12 searchAttachmentsInterItemSpacing];
  v13 = objc_msgSend(v11, "fixedSpacing:");
  [v10 setInterItemSpacing:v13];

  return v10;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CKAttachmentsSearchController;
  uint64_t v6 = [(CKSearchController *)&v8 cellForItemInCollectionView:a3 atIndexPath:a4 withIdentifier:a5];
  objc_msgSend(v6, "setSuppressAvatars:", -[CKSearchController suppressAvatars](self, "suppressAvatars"));

  return v6;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
    v13 = +[CKDetailsSearchResultsFooterCell reuseIdentifier];
    uint64_t v14 = [v7 dequeueReusableSupplementaryViewOfKind:v12 withReuseIdentifier:v13 forIndexPath:v8];

    uint64_t v15 = NSString;
    double v16 = CKFrameworkBundle();
    v17 = [v16 localizedStringForKey:@"SEE_ALL_ATTACHMENTS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v18 = [v15 stringWithFormat:v17];

    id v19 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v20 = [v19 userInterfaceLayoutDirection];

    if (v20 == 1) {
      long long v21 = @"\u200F";
    }
    else {
      long long v21 = @"\u200E";
    }
    long long v22 = [(__CFString *)v21 stringByAppendingString:v18];

    [v14 setTitle:v22];
    long long v23 = [(id)objc_opt_class() sectionIdentifier];
    [v14 setSectionIdentifier:v23];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)previewViewControllerForResult:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    unint64_t v5 = [MEMORY[0x1E4F3A658] requestPreviewMockSceneActivation];
LABEL_5:
    [(QLPreviewController *)v5 setDelegate:self];
    uint64_t v10 = objc_alloc_init(CKQLPreviewControllerDataSource);
    [(CKSearchController *)self setQlPreviewDataSource:v10];

    int v11 = [(CKSearchController *)self qlPreviewDataSource];
    [(QLPreviewController *)v5 setDataSource:v11];

    uint64_t v12 = [(CKSearchController *)self qlPreviewDataSource];
    v13 = [(CKSearchController *)self results];
    [v12 setPreviewItems:v13];

    [(QLPreviewController *)v5 reloadData];
    uint64_t v14 = [(CKSearchController *)self results];
    -[QLPreviewController setCurrentPreviewItemIndex:](v5, "setCurrentPreviewItemIndex:", [v14 indexOfObject:v4]);

    [(QLPreviewController *)v5 refreshCurrentPreviewItem];
    goto LABEL_7;
  }
  uint64_t v6 = [v4 item];
  id v7 = [v6 attributeSet];
  id v8 = objc_msgSend(v7, "__ck_spotlightItemSnippet");

  id v9 = IMUTITypeForFilename();
  if (IMUTTypeWantsQuicklook())
  {
    unint64_t v5 = objc_alloc_init(CKQLPreviewController);

    goto LABEL_5;
  }

  unint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v3 = a3;
  id v4 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  unint64_t v5 = [v4 cachedPreviewForQueryResult:v3];

  if (v5)
  {
    uint64_t v6 = [v3 item];
    id v7 = [v6 attributeSet];

    id v8 = [v7 contentURL];
    id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
    uint64_t v10 = objc_msgSend(v7, "__ck_spotlightItemSnippet");
    id v11 = objc_alloc_init(MEMORY[0x1E4F30A28]);
    [v11 setName:v10];
    uint64_t v12 = IMUTITypeForFilename();
    [v11 setType:v12];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v5];
    [v11 setThumbnail:v13];
    id v14 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    [v14 setSpecialization:v11];
    uint64_t v15 = [[CKSearchActivityItemProvider alloc] initWithPlaceholderItem:v9 metadata:v14];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 item];
  uint64_t v6 = [v5 attributeSet];

  id v7 = objc_msgSend(v6, "__ck_spotlightItemSnippet");
  id v8 = IMUTITypeForFilename();
  id v9 = [v6 contentURL];
  if (IMUTTypeIsWatchface()) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v13.receiver = self;
    v13.super_class = (Class)CKAttachmentsSearchController;
    BOOL v11 = [(CKSearchController *)&v13 handleSelectionForResult:v4];
  }
  else
  {
    +[CKWatchfaceUtilities addWatchFaceAtURL:v9 completionHandler:&__block_literal_global_158];
    BOOL v11 = 1;
  }

  return v11;
}

void __58__CKAttachmentsSearchController_handleSelectionForResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(25);
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v5 = v2;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "Failed to import URL: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
  }
}

@end