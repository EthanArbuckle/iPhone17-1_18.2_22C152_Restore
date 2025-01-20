@interface CKPhotosSearchController
+ (BOOL)supportsMacSelection;
+ (BOOL)supportsQuicklookForResult:(id)a3;
+ (Class)cellClassForMode:(unint64_t)a3;
+ (id)indexingString;
+ (id)relativeDateFormatter;
+ (id)reuseIdentifierForMode:(unint64_t)a3;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (BOOL)useSemanticQuery;
- (BOOL)wantsHeaderSection;
- (CKPhotosSearchController)init;
- (Class)headerOverrideClass;
- (NSDirectionalEdgeInsets)additionalGroupInsets;
- (double)_internalInterGroupSpacing;
- (double)interGroupSpacing;
- (id)_activityItemProviderForResult:(id)a3;
- (id)_additionalMenuElementsForResult:(id)a3;
- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)detailsFilterQueriesForChatGUIDs:(id)a3;
- (id)fetchAttributes;
- (id)filterQueriesBase;
- (id)itemProviderForSearchResult:(id)a3;
- (id)layoutGroupWithEnvironment:(id)a3;
- (id)previewViewControllerForResult:(id)a3;
- (id)queryAttributesForText:(id)a3;
- (id)queryResultsForItems:(id)a3;
- (id)sectionSubtitle;
- (unint64_t)contentMode;
- (unint64_t)maxResultsForMode:(unint64_t)a3;
- (unint64_t)searchTokenContentType;
- (void)_filterControlTapped:(id)a3;
- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5;
- (void)saveAttachmentForResult:(id)a3;
- (void)setContentMode:(unint64_t)a3;
- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4;
@end

@implementation CKPhotosSearchController

- (CKPhotosSearchController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKPhotosSearchController;
  v2 = [(CKPhotosSearchController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CKPhotosSearchController *)v2 setContentMode:0];
    v4 = objc_alloc_init(CKQLPreviewControllerDataSource);
    [(CKSearchController *)v3 setQlPreviewDataSource:v4];
  }
  return v3;
}

- (void)setContentMode:(unint64_t)a3
{
  self->_contentMode = a3;
}

- (unint64_t)searchTokenContentType
{
  return 3;
}

- (id)fetchAttributes
{
  v9[11] = *MEMORY[0x1E4F143B8];
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
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:11];

  return v7;
}

- (id)queryAttributesForText:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", *MEMORY[0x1E4F234B0], *MEMORY[0x1E4F23498], *MEMORY[0x1E4F235F8], *MEMORY[0x1E4F23340], *MEMORY[0x1E4F23350], *MEMORY[0x1E4F232F8], 0);
    uint64_t v4 = (void *)[v3 copy];
  }
  else
  {
    v6[0] = *MEMORY[0x1E4F235F8];
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }

  return v4;
}

- (BOOL)useSemanticQuery
{
  return 0;
}

- (id)filterQueriesBase
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (![(CKPhotosSearchController *)self contentMode])
  {
    uint64_t v3 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F22D28], @"attachmentDomain""];
    v10[0] = v3;
    uint64_t v4 = [NSString stringWithFormat:@"%@ == \"%@\" || %@ == \"%@\" || %@ == \"%@\" || %@ == \"%@\", *MEMORY[0x1E4F23148], @"pto", *MEMORY[0x1E4F23148], @"mov", *MEMORY[0x1E4F23148], @"apto", *MEMORY[0x1E4F23148], @"scr""];
    v10[1] = v4;
    uint64_t v5 = v10;
    goto LABEL_7;
  }
  if ([(CKPhotosSearchController *)self contentMode] == 1)
  {
    uint64_t v3 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F22D28], @"attachmentDomain""];
    v9[0] = v3;
    uint64_t v4 = [NSString stringWithFormat:@"%@ == \"%@\" || %@ == \"%@\" || %@ == \"%@\", *MEMORY[0x1E4F23148], @"pto", *MEMORY[0x1E4F23148], @"mov", *MEMORY[0x1E4F23148], @"apto""];
    v9[1] = v4;
    uint64_t v5 = v9;
LABEL_7:
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

    goto LABEL_8;
  }
  if ([(CKPhotosSearchController *)self contentMode] == 2)
  {
    uint64_t v3 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F22D28], @"attachmentDomain""];
    v8[0] = v3;
    uint64_t v4 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F23148], @"scr""];
    v8[1] = v4;
    uint64_t v5 = v8;
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_8:

  return v6;
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
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  id v19 = [NSString string];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__CKPhotosSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E5621A30;
  v13[4] = &v14;
  [v4 enumerateObjectsUsingBlock:v13];
  uint64_t v24 = v15[5];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __61__CKPhotosSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

- (id)queryResultsForItems:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKSearchController *)self mode] == 1)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = [(CKSearchController *)self delegate];
    uint64_t v7 = [v6 searchTokenFiltersForSearchController:self];
    uint64_t v30 = [v7 count];

    unint64_t v8 = [(CKPhotosSearchController *)self maxResultsForMode:[(CKSearchController *)self mode]];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v32 = *(void *)v35;
      id v28 = v9;
      unint64_t v29 = v8;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
        uint64_t v14 = -[CKPhotosSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v13, v27);
        v15 = [(CKSearchController *)self delegate];
        uint64_t v16 = [v15 searchController:self conversationForChatGUID:v14];

        if (v16 && ([v16 isBlockedByCommunicationLimits] & 1) == 0)
        {
          v17 = v5;
          v18 = [v13 attributeSet];
          id v19 = [v18 authorAddresses];
          long long v20 = [v19 firstObject];

          if (v30 || ([v31 containsObject:v20] & 1) == 0)
          {
            if (v20) {
              [v31 addObject:v20];
            }
            long long v21 = [CKSpotlightQueryResult alloc];
            long long v22 = [(id)objc_opt_class() sectionIdentifier];
            long long v23 = [(CKSpotlightQueryResult *)v21 initWithSearchableItem:v13 inSection:v22 withConversation:v16];

            [v17 addObject:v23];
          }

          id v5 = v17;
          id v9 = v28;
          unint64_t v8 = v29;
        }
        unint64_t v24 = [v5 count];

        if (v24 >= v8) {
          break;
        }
        if (v11 == ++v12)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v11) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v25 = (void *)[v5 copy];
    id v4 = v27;
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)CKPhotosSearchController;
    v25 = [(CKMessageTypeSearchController *)&v33 queryResultsForItems:v4];
  }

  return v25;
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 1;
}

+ (BOOL)supportsMacSelection
{
  return 1;
}

+ (id)sectionTitle
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"SEARCH_PHOTOS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (id)sectionSubtitle
{
  uint64_t v2 = [(CKSearchController *)self results];
  id v3 = [v2 firstObject];
  id v4 = [v3 item];
  id v5 = [v4 attributeSet];
  uint64_t v6 = [v5 contentCreationDate];

  uint64_t v7 = +[CKPhotosSearchController relativeDateFormatter];
  unint64_t v8 = [v7 stringFromDate:v6];
  id v9 = NSString;
  uint64_t v10 = CKFrameworkBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"LAST_UPDATED_TIMESTAMP" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);

  v13 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v14 = [v13 userInterfaceLayoutDirection];

  if (v14 == 1) {
    v15 = @"\u200F";
  }
  else {
    v15 = @"\u200E";
  }
  uint64_t v16 = [(__CFString *)v15 stringByAppendingString:v12];

  return v16;
}

+ (id)relativeDateFormatter
{
  if (relativeDateFormatter_once != -1) {
    dispatch_once(&relativeDateFormatter_once, &__block_literal_global_16);
  }
  uint64_t v2 = (void *)relativeDateFormatter_sRelativeDateFormatter;

  return v2;
}

uint64_t __49__CKPhotosSearchController_relativeDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)relativeDateFormatter_sRelativeDateFormatter;
  relativeDateFormatter_sRelativeDateFormatter = (uint64_t)v0;

  [(id)relativeDateFormatter_sRelativeDateFormatter setTimeStyle:0];
  [(id)relativeDateFormatter_sRelativeDateFormatter setDateStyle:1];
  uint64_t v2 = (void *)relativeDateFormatter_sRelativeDateFormatter;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "__ck_currentLocale");
  [v2 setLocale:v3];

  [(id)relativeDateFormatter_sRelativeDateFormatter setDoesRelativeDateFormatting:1];
  id v4 = (void *)relativeDateFormatter_sRelativeDateFormatter;

  return [v4 setFormattingContext:2];
}

+ (id)sectionIdentifier
{
  return @"PhotosSearchSection";
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v3 = [a3 attributeSet];
  id v4 = [v3 accountIdentifier];

  return v4;
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKPhotoSearchResultCell reuseIdentifier];
}

+ (id)indexingString
{
  uint64_t v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"PHOTOS_INDEXING_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return (Class)objc_opt_class();
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  switch([(CKSearchController *)self mode])
  {
    case 0uLL:
    case 1uLL:
      if (CKIsRunningInMacCatalyst()) {
        unint64_t result = 9;
      }
      else {
        unint64_t result = -[CKMessageTypeSearchController maxResultsForMode:](&v7, sel_maxResultsForMode_, a3, v6.receiver, v6.super_class, self, CKPhotosSearchController);
      }
      break;
    case 2uLL:
    case 4uLL:
      unint64_t result = -[CKMessageTypeSearchController maxResultsForMode:](&v6, sel_maxResultsForMode_, a3, self, CKPhotosSearchController, v7.receiver, v7.super_class);
      break;
    case 3uLL:
      if (CKIsRunningInMacCatalyst()) {
        unint64_t result = 9;
      }
      else {
        unint64_t result = 6;
      }
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (double)_internalInterGroupSpacing
{
  if ([(CKSearchController *)self mode] == 2 || [(CKSearchController *)self mode] == 4)
  {
    id v3 = +[CKUIBehavior sharedBehaviors];
    [v3 searchPhotosZKWAndDetailsInterItemSpacing];
  }
  else
  {
    unint64_t v7 = [(CKSearchController *)self mode];
    unint64_t v8 = +[CKUIBehavior sharedBehaviors];
    id v3 = v8;
    if (v7 == 3) {
      [v8 searchPhotosInterItemSpacingDetailsView];
    }
    else {
      [v8 searchPhotosInterItemSpacing];
    }
  }
  double v5 = v4;

  return v5;
}

- (double)interGroupSpacing
{
  [(CKPhotosSearchController *)self _internalInterGroupSpacing];
  return v2 * 0.5;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  if (CKIsRunningInMacCatalyst()) {
    return 1;
  }
  if ([(CKSearchController *)self mode] == 2) {
    return 0;
  }
  return [(CKSearchController *)self mode] != 4;
}

- (BOOL)wantsHeaderSection
{
  if ([(CKSearchController *)self mode] == 2 || [(CKSearchController *)self mode] == 4) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKPhotosSearchController;
  return [(CKSearchController *)&v4 wantsHeaderSection];
}

- (Class)headerOverrideClass
{
  if (CKIsRunningInMacCatalyst()
    || [(CKSearchController *)self mode] == 2
    || [(CKSearchController *)self mode] == 4)
  {
    id v3 = objc_opt_class();
  }
  else
  {
    id v3 = 0;
  }

  return (Class)v3;
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
    v13 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
    uint64_t v14 = +[CKDetailsSearchResultsFooterCell reuseIdentifier];
    v15 = [v8 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v14 forIndexPath:v9];

    uint64_t v16 = NSString;
    v17 = CKFrameworkBundle();
    v18 = [v17 localizedStringForKey:@"SEE_ALL_PHOTOS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v19 = [v16 stringWithFormat:v18];

    long long v20 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v21 = [v20 userInterfaceLayoutDirection];

    if (v21 == 1) {
      long long v22 = @"\u200F";
    }
    else {
      long long v22 = @"\u200E";
    }
    long long v23 = [(__CFString *)v22 stringByAppendingString:v19];

    [v15 setTitle:v23];
    unint64_t v24 = [(id)objc_opt_class() sectionIdentifier];
    [v15 setSectionIdentifier:v24];
    goto LABEL_11;
  }
  v25 = +[CKSearchAvatarSupplementryView supplementaryViewType];
  int v26 = [v10 isEqualToString:v25];

  if (v26)
  {
    id v27 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    id v28 = +[CKSearchAvatarSupplementryView reuseIdentifier];
    v15 = [v8 dequeueReusableSupplementaryViewOfKind:v27 withReuseIdentifier:v28 forIndexPath:v9];

    unint64_t v29 = [v9 row];
    uint64_t v30 = [(CKSearchController *)self results];
    unint64_t v31 = [v30 count];

    if (v29 >= v31) {
      goto LABEL_12;
    }
    uint64_t v32 = [(CKSearchController *)self results];
    unint64_t v24 = objc_msgSend(v32, "objectAtIndex:", objc_msgSend(v9, "row"));

    objc_super v33 = +[CKSpotlightQueryResultUtilities contactForResult:v24];
    [v15 setContact:v33];
    [v15 setAssociatedResult:v24];
    [v15 setParentContentType:0];

    goto LABEL_11;
  }
  long long v34 = +[CKPhotosSearchResultsModeHeaderReusableView supplementaryViewType];
  int v35 = [v10 isEqualToString:v34];

  if (v35)
  {
    long long v36 = +[CKPhotosSearchResultsModeHeaderReusableView supplementaryViewType];
    long long v37 = +[CKPhotosSearchResultsModeHeaderReusableView reuseIdentifier];
    v15 = [v8 dequeueReusableSupplementaryViewOfKind:v36 withReuseIdentifier:v37 forIndexPath:v9];

    unint64_t v24 = [v15 control];
    [v24 addTarget:self action:sel__filterControlTapped_ forControlEvents:4096];
LABEL_11:

    goto LABEL_12;
  }
  v15 = 0;
LABEL_12:

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

    v13 = [v16 associatedResult];
    char v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      v15 = +[CKSpotlightQueryResultUtilities contactForResult:v12];
      [v16 setContact:v15];
      [v16 setAssociatedResult:v12];
      [v16 setNeedsLayout];
    }
  }
}

- (void)_filterControlTapped:(id)a3
{
  uint64_t v4 = [a3 selectedSegmentIndex];
  if (v4 == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * (v4 == 2);
  }
  if ([(CKPhotosSearchController *)self contentMode] != v5)
  {
    [(CKPhotosSearchController *)self setContentMode:v5];
    id v6 = [(CKSearchController *)self currentSearchText];
    [(CKMessageTypeSearchController *)self searchWithText:v6 mode:[(CKSearchController *)self mode]];
  }
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  if ([(CKSearchController *)self mode] == 2 || [(CKSearchController *)self mode] == 4)
  {
    if (a5)
    {
      if (a5 == 2)
      {
        if (CKIsRunningInMacCatalyst()) {
          double v9 = 0.33;
        }
        else {
          double v9 = 0.25;
        }
        int v10 = CKIsRunningInMacCatalyst();
        unint64_t v11 = 3;
        if (!v10) {
          unint64_t v11 = 4;
        }
        if (!a3)
        {
LABEL_22:
          if (!a4) {
            return;
          }
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t v11 = 3;
        double v9 = 0.33;
        if (!a3) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      double v9 = 0.5;
      unint64_t v11 = 2;
      if (!a3) {
        goto LABEL_22;
      }
    }
    *a3 = v9;
    goto LABEL_22;
  }
  if ([(CKSearchController *)self mode] != 3 && !CKIsRunningInMacCatalyst())
  {
    v12.receiver = self;
    v12.super_class = (Class)CKPhotosSearchController;
    [(CKMessageTypeSearchController *)&v12 fractionalWidth:a3 count:a4 forLayoutWidth:a5];
    return;
  }
  if (a3) {
    *a3 = 0.33;
  }
  if (a4)
  {
    unint64_t v11 = 3;
LABEL_23:
    *a4 = v11;
  }
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  double v28 = 0.0;
  [(CKPhotosSearchController *)self fractionalWidth:&v28 count:&v27 forLayoutWidth:[(CKSearchController *)self layoutWidth]];
  uint64_t v4 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v28];
  uint64_t v5 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v4 heightDimension:v4];
  if ([(CKSearchController *)self suppressAvatars])
  {
    id v6 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F42608];
    unint64_t v8 = +[CKUIBehavior sharedBehaviors];
    [v8 searchResultAvatarSize];
    double v9 = objc_msgSend(v7, "absoluteDimension:");

    int v10 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v9 heightDimension:v9];
    uint64_t v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    if (v11 == 1) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 9;
    }
    double v13 = -6.0;
    if (v11 == 1) {
      double v13 = 6.0;
    }
    char v14 = [MEMORY[0x1E4F425F0] layoutAnchorWithEdges:v12 absoluteOffset:v13];
    v15 = (void *)MEMORY[0x1E4F42648];
    id v16 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    v17 = [v15 supplementaryItemWithLayoutSize:v10 elementKind:v16 containerAnchor:v14];

    [v17 setZIndex:2];
    v18 = (void *)MEMORY[0x1E4F42628];
    v29[0] = v17;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    id v6 = [v18 itemWithLayoutSize:v5 supplementaryItems:v19];
  }
  long long v20 = (void *)MEMORY[0x1E4F42638];
  uint64_t v21 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  long long v22 = [v20 sizeWithWidthDimension:v21 heightDimension:v4];

  long long v23 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v22 subitem:v6 count:v27];
  unint64_t v24 = (void *)MEMORY[0x1E4F42640];
  [(CKPhotosSearchController *)self _internalInterGroupSpacing];
  v25 = objc_msgSend(v24, "fixedSpacing:");
  [v23 setInterItemSpacing:v25];

  return v23;
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.and.arrow.down"];
  id location = 0;
  objc_initWeak(&location, self);
  if (CKIsRunningInMacCatalyst())
  {
    id v6 = CKFrameworkBundle();
    [v6 localizedStringForKey:@"SEARCH_ADD_TO_PHOTOS_LIBRARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    id v6 = CKFrameworkBundle();
    [v6 localizedStringForKey:@"SEARCH_SAVE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v7 = };

  unint64_t v8 = (void *)MEMORY[0x1E4F426E8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__CKPhotosSearchController__additionalMenuElementsForResult___block_invoke;
  v15[3] = &unk_1E56210D8;
  objc_copyWeak(&v17, &location);
  id v9 = v4;
  id v16 = v9;
  int v10 = [v8 actionWithTitle:v7 image:v5 identifier:0 handler:v15];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = v11;
  if (v10) {
    [v11 addObject:v10];
  }
  double v13 = (void *)[v12 copy];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __61__CKPhotosSearchController__additionalMenuElementsForResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained saveAttachmentForResult:*(void *)(a1 + 32)];
}

- (id)previewViewControllerForResult:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v5 = [MEMORY[0x1E4F3A658] requestPreviewMockSceneActivation];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(CKQLPreviewController);
  }
  id v6 = v5;
  id v7 = [(CKSearchController *)self qlPreviewDataSource];
  unint64_t v8 = [(CKSearchController *)self results];
  [v7 setPreviewItems:v8];

  id v9 = [(CKSearchController *)self qlPreviewDataSource];
  [(QLPreviewController *)v6 setDataSource:v9];

  [(QLPreviewController *)v6 reloadData];
  int v10 = [(CKSearchController *)self results];
  uint64_t v11 = [v10 indexOfObject:v4];

  [(QLPreviewController *)v6 setCurrentPreviewItemIndex:v11];
  [(QLPreviewController *)v6 refreshCurrentPreviewItem];
  [(QLPreviewController *)v6 setDelegate:self];

  return v6;
}

- (id)itemProviderForSearchResult:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKPhotosSearchController;
  uint64_t v5 = [(CKMessageTypeSearchController *)&v17 itemProviderForSearchResult:v4];
  if (!v5)
  {
LABEL_6:
    id v11 = v5;
    goto LABEL_12;
  }
  id v6 = [v4 item];
  id v7 = [v6 attributeSet];
  unint64_t v8 = [v7 contentURL];

  if (v8)
  {
    id v9 = +[CKLivePhotoBundleUtilities calculateLivePhotoVideoPath:v8];
    int v10 = v9;
    if (v9)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__CKPhotosSearchController_itemProviderForSearchResult___block_invoke;
      v14[3] = &unk_1E5621A58;
      id v15 = v9;
      [v5 registerDataRepresentationForTypeIdentifier:@"com.apple.MobileSMS.appendedURL" visibility:0 loadHandler:v14];
    }
    goto LABEL_6;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "search result returned nil URL while create NSItemProvider", buf, 2u);
    }
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __56__CKPhotosSearchController_itemProviderForSearchResult___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 dataUsingEncoding:4];
  v3[2](v3, v4, 0);

  return 0;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v3 = a3;
  id v4 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  uint64_t v5 = [v4 cachedPreviewForQueryResult:v3];

  if (v5)
  {
    id v6 = [v3 item];
    id v7 = [v6 attributeSet];

    unint64_t v8 = [v7 contentURL];
    id v9 = objc_msgSend(v7, "__ck_spotlightItemSnippet");
    id v10 = objc_alloc_init(MEMORY[0x1E4F30A28]);
    id v11 = IMUTITypeForFilename();
    [v10 setType:v11];

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v5];
    [v10 setThumbnail:v12];
    id v13 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    [v13 setSpecialization:v10];
    char v14 = [[CKSearchActivityItemProvider alloc] initWithPlaceholderItem:v8 metadata:v13];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)saveAttachmentForResult:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 item];
  uint64_t v5 = [v4 attributeSet];

  id v6 = [v5 contentURL];
  id v7 = [v3 item];

  unint64_t v8 = [v7 uniqueIdentifier];

  id v9 = [v5 ownerIdentifier];
  id v10 = [v5 contentCreationDate];
  id v11 = [CKAttachmentItem alloc];
  uint64_t v12 = -[CKAttachmentItem initWithFileURL:size:transferGUID:guid:createdDate:shareURL:](v11, "initWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v6, v8, v9, v10, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  id v13 = [CKAttachmentSaver alloc];
  v16[0] = v12;
  char v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = [(CKAttachmentSaver *)v13 initWithAttachments:v14];

  [(CKAttachmentSaver *)v15 runToCompletion];
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  id v3 = [(CKSearchController *)self delegate];
  [v3 parentMarginInsetsForSearchController:self];
  double v5 = v4;
  double v7 = v6;

  if ([(CKSearchController *)self mode] == 3)
  {
    double v7 = v5;
  }
  else
  {
    [(CKSearchController *)self mode];
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

- (unint64_t)contentMode
{
  return self->_contentMode;
}

@end