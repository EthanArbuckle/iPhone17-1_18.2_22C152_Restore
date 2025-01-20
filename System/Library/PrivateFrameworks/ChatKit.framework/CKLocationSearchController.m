@interface CKLocationSearchController
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
- (id)_mapItemForResult:(id)a3;
- (id)additionalMenuElementsForResult:(id)a3;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5;
- (id)chatGUIDForSearchableItem:(id)a3;
- (id)detailsFilterQueriesForChatGUIDs:(id)a3;
- (id)fetchAttributes;
- (id)filterQueries;
- (id)itemProviderForSearchResult:(id)a3;
- (id)layoutGroupWithEnvironment:(id)a3;
- (id)previewViewControllerForResult:(id)a3;
- (id)queryAttributesForText:(id)a3;
- (id)reuseIdentifierForIndex:(int64_t)a3;
- (id)urlForQueryResult:(id)a3;
- (unint64_t)searchTokenContentType;
- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5;
- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4;
@end

@implementation CKLocationSearchController

- (unint64_t)searchTokenContentType
{
  return 4;
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
  uint64_t v4 = *MEMORY[0x1E4F230F8];
  v10[4] = *MEMORY[0x1E4F22C38];
  v10[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F23598];
  v10[6] = *MEMORY[0x1E4F23130];
  v10[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F23660];
  v10[8] = *MEMORY[0x1E4F22C70];
  v10[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F22A10];
  v10[10] = *MEMORY[0x1E4F231D0];
  v10[11] = v7;
  v10[12] = *MEMORY[0x1E4F23080];
  v10[13] = @"com_apple_mobilesms_lpPluginPaths";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:14];

  return v8;
}

- (id)queryAttributesForText:(id)a3
{
  v12[7] = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    uint64_t v3 = *MEMORY[0x1E4F23618];
    v12[0] = *MEMORY[0x1E4F235F8];
    v12[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F22C90];
    v12[2] = *MEMORY[0x1E4F22BE8];
    v12[3] = v4;
    uint64_t v5 = *MEMORY[0x1E4F22B30];
    v12[4] = *MEMORY[0x1E4F233B8];
    v12[5] = v5;
    v12[6] = *MEMORY[0x1E4F234B0];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v7 = v12;
    uint64_t v8 = 7;
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F235F8];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v7 = &v11;
    uint64_t v8 = 1;
  }
  v9 = [v6 arrayWithObjects:v7 count:v8];

  return v9;
}

- (BOOL)useSemanticQuery
{
  return 0;
}

+ (id)sectionTitle
{
  uint64_t v2 = CKFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"SEARCH_LOCATIONS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)sectionIdentifier
{
  return @"LocationSearchSection";
}

- (id)reuseIdentifierForIndex:(int64_t)a3
{
  uint64_t v4 = [(CKSearchController *)self results];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];
  uint64_t v6 = +[CKSpotlightQueryResultUtilities indexDomainForResult:v5];

  int v7 = [v6 isEqualToString:@"attachmentDomain"];
  uint64_t v8 = off_1E561DAE8;
  if (!v7) {
    uint64_t v8 = off_1E561DAB0;
  }
  v9 = [(__objc2_class *)*v8 reuseIdentifier];

  return v9;
}

+ (id)indexingString
{
  uint64_t v2 = CKFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"LOCATIONS_INDEXING_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)supportedCellClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (double)interGroupSpacing
{
  uint64_t v2 = +[CKUIBehavior sharedBehaviors];
  [v2 searchLocationsInterItemSpacing];
  double v4 = v3 * 0.5;

  return v4;
}

- (id)filterQueries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"%@ == \"%@\", *MEMORY[0x1E4F23148], @"loc""];
  v5[0] = v2;
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
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
  v17 = __Block_byref_object_copy__18;
  v18 = __Block_byref_object_dispose__18;
  id v19 = 0;
  id v19 = [NSString string];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__CKLocationSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E5621A30;
  v13[4] = &v14;
  [v4 enumerateObjectsUsingBlock:v13];
  uint64_t v24 = v15[5];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __63__CKLocationSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 attributeSet];
  id v5 = [v4 accountIdentifier];

  if (![v5 length])
  {
    uint64_t v6 = [v3 attributeSet];
    uint64_t v7 = [v6 domainIdentifier];

    id v5 = (void *)v7;
  }

  return v5;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(CKSearchController *)self results];
  uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
  v13 = [v12 item];

  uint64_t v14 = +[CKSpotlightQueryResultUtilities indexDomainForItem:v13];
  if ([v14 isEqualToString:@"attachmentDomain"])
  {
    id v19 = self;
    v15 = &v19;
  }
  else
  {
    v18 = self;
    v15 = &v18;
  }
  v15[1] = (CKLocationSearchController *)CKLocationSearchController;
  uint64_t v16 = objc_msgSendSuper2((objc_super *)v15, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v10, v9, v8, v18);

  return v16;
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
    v13 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
    uint64_t v14 = +[CKDetailsSearchResultsFooterCell reuseIdentifier];
    v15 = [v10 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v14 forIndexPath:v8];

    uint64_t v16 = NSString;
    v17 = CKFrameworkBundle();
    v18 = [v17 localizedStringForKey:@"SEE_ALL_LOCATIONS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
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
    uint64_t v24 = [(id)objc_opt_class() sectionIdentifier];
    [v15 setSectionIdentifier:v24];
  }
  else
  {
    v25 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    uint64_t v26 = +[CKSearchAvatarSupplementryView reuseIdentifier];
    v15 = [v10 dequeueReusableSupplementaryViewOfKind:v25 withReuseIdentifier:v26 forIndexPath:v8];

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
    [v15 setParentContentType:1];
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

- (id)layoutGroupWithEnvironment:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  double v34 = 0.0;
  [(CKLocationSearchController *)self fractionalWidth:&v34 count:&v33 forLayoutWidth:[(CKSearchController *)self layoutWidth]];
  uint64_t v4 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v34];
  id v5 = (void *)MEMORY[0x1E4F42608];
  double v6 = v34;
  id v7 = +[CKUIBehavior sharedBehaviors];
  [v7 searchLinksFractionalHeightScale];
  id v9 = [v5 fractionalWidthDimension:v6 * v8];

  unint64_t v10 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v4 heightDimension:v9];
  if ([(CKSearchController *)self suppressAvatars])
  {
    uint64_t v11 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v10];
  }
  else
  {
    int v12 = (void *)MEMORY[0x1E4F42608];
    v13 = +[CKUIBehavior sharedBehaviors];
    [v13 searchResultAvatarSize];
    char v14 = objc_msgSend(v12, "absoluteDimension:");

    v15 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v14 heightDimension:v14];
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
    id v19 = [MEMORY[0x1E4F425F0] layoutAnchorWithEdges:v17 absoluteOffset:v18];
    long long v20 = (void *)MEMORY[0x1E4F42648];
    uint64_t v21 = +[CKSearchAvatarSupplementryView supplementaryViewType];
    long long v22 = [v20 supplementaryItemWithLayoutSize:v15 elementKind:v21 containerAnchor:v19];

    long long v23 = (void *)MEMORY[0x1E4F42628];
    v35[0] = v22;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    uint64_t v11 = [v23 itemWithLayoutSize:v10 supplementaryItems:v24];
  }
  v25 = (void *)MEMORY[0x1E4F42638];
  uint64_t v26 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  unint64_t v27 = [v25 sizeWithWidthDimension:v26 heightDimension:v9];

  v28 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v27 subitem:v11 count:v33];
  unint64_t v29 = (void *)MEMORY[0x1E4F42640];
  v30 = +[CKUIBehavior sharedBehaviors];
  [v30 searchLocationsInterItemSpacing];
  v31 = objc_msgSend(v29, "fixedSpacing:");
  [v28 setInterItemSpacing:v31];

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
    v9.super_class = (Class)CKLocationSearchController;
    [(CKMessageTypeSearchController *)&v9 fractionalWidth:a3 count:a4 forLayoutWidth:a5];
  }
}

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  id v3 = [(CKLocationSearchController *)self _mapItemForResult:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)previewViewControllerForResult:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)MEMORY[0x192FBA860](@"MUPlaceViewController", @"MapsUI");
  double v6 = [(CKLocationSearchController *)self _mapItemForResult:v4];

  id v7 = 0;
  if (v5 && v6) {
    id v7 = (void *)[[v5 alloc] initWithMapItem:v6];
  }

  return v7;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchController *)self delegate];
  double v6 = [v5 containerTraitCollectionForController:self];

  id v7 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  double v8 = [v7 cachedMapPreviewForQueryResult:v4 traitCollection:v6];

  if (v8)
  {
    objc_super v9 = [v4 item];
    unint64_t v10 = [v9 attributeSet];

    uint64_t v11 = [v10 contentURL];
    long long v20 = [v11 lastPathComponent];
    int v12 = objc_msgSend(v10, "__ck_spotlightItemSnippet");
    id v13 = objc_alloc_init(MEMORY[0x1E4F30A28]);
    [v13 setName:v12];
    char v14 = IMUTITypeForFilename();
    [v13 setType:v14];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v8];
    [v13 setThumbnail:v15];
    uint64_t v16 = v6;
    id v17 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    [v17 setSpecialization:v13];
    double v18 = [[CKSearchActivityItemProvider alloc] initWithPlaceholderItem:v11 metadata:v17];

    double v6 = v16;
  }
  else
  {
    double v18 = 0;
  }

  return v18;
}

- (id)additionalMenuElementsForResult:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CKLocationSearchController *)self _mapItemForResult:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"mappin.and.ellipse"];
    id v5 = (void *)MEMORY[0x1E4F426E8];
    double v6 = CKFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"SEARCH_OPEN_IN_MAPS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__CKLocationSearchController_additionalMenuElementsForResult___block_invoke;
    v11[3] = &unk_1E56211C8;
    id v12 = v3;
    double v8 = [v5 actionWithTitle:v7 image:v4 identifier:0 handler:v11];

    v13[0] = v8;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

uint64_t __62__CKLocationSearchController_additionalMenuElementsForResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openInMapsWithLaunchOptions:0];
}

- (id)_mapItemForResult:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)MEMORY[0x192FBA860](@"MKPlacemark", @"MapKit");
  uint64_t v5 = MEMORY[0x192FBA860](@"MKMapItem", @"MapKit");
  double v6 = (objc_class *)v5;
  if (v4 && v5)
  {
    if (_mapItemForResult___pred_CLLocationCoordinate2DMakeCoreLocation != -1) {
      dispatch_once(&_mapItemForResult___pred_CLLocationCoordinate2DMakeCoreLocation, &__block_literal_global_48);
    }
    id v7 = [v3 item];
    double v8 = [v7 attributeSet];

    objc_super v9 = [v8 latitude];
    uint64_t v10 = [v8 longitude];
    uint64_t v11 = (void *)v10;
    if (v9 && v10)
    {
      id v12 = [v8 latitude];
      [v12 floatValue];
      float v14 = v13;

      v15 = [v8 longitude];
      [v15 floatValue];
      float v17 = v16;

      double v18 = _mapItemForResult___CLLocationCoordinate2DMake(v14, v17);
      long long v20 = objc_msgSend([v4 alloc], "initWithCoordinate:", v18, v19);
      uint64_t v21 = (void *)[[v6 alloc] initWithPlacemark:v20];
      long long v22 = objc_msgSend(v8, "__ck_spotlightItemSnippet");
      long long v23 = CKFrameworkBundle();
      uint64_t v24 = [v23 localizedStringForKey:@"Current Location" value:&stru_1EDE4CA38 table:@"ChatKit"];
      int v25 = [v22 isEqualToString:v24];

      if (v25)
      {
        v38 = objc_msgSend(v8, "__ck_itemContentCreationDate");
        uint64_t v26 = +[CKUIBehavior sharedBehaviors];
        v37 = [v26 locationRelativeDateFormatter];

        unint64_t v27 = [v37 stringFromDate:v38];
        v28 = NSString;
        unint64_t v29 = CKFrameworkBundle();
        [v29 localizedStringForKey:@"LOCATION_FOOTER_DETAILS_VIEW" value:&stru_1EDE4CA38 table:@"ChatKit"];
        v30 = v39 = v20;
        v31 = objc_msgSend(v28, "stringWithFormat:", v30, v27);

        v32 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v33 = [v32 userInterfaceLayoutDirection];

        if (v33 == 1) {
          double v34 = @"\u200F";
        }
        else {
          double v34 = @"\u200E";
        }
        uint64_t v35 = [(__CFString *)v34 stringByAppendingString:v31];

        long long v22 = (void *)v35;
        long long v20 = v39;
      }
      [v21 setName:v22];
    }
    else
    {
      _IMWarn();
      uint64_t v21 = 0;
    }
  }
  else
  {
    _IMWarn();
    uint64_t v21 = 0;
  }

  return v21;
}

void *__48__CKLocationSearchController__mapItemForResult___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DMake", @"CoreLocation");
  _mapItemForResult___CLLocationCoordinate2DMake = result;
  return result;
}

- (id)urlForQueryResult:(id)a3
{
  id v3 = a3;
  +[CKSpotlightQueryResultUtilities coordinateForResult:v3];
  double v5 = v4;
  double v7 = v6;
  double v8 = [v3 item];

  objc_super v9 = [v8 attributeSet];
  uint64_t v10 = objc_msgSend(v9, "__ck_spotlightItemSnippet");

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "__ck_appleMapsURLForCoordinate:coordinateName:", v10, v5, v7);

  return v11;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    double v5 = [(CKLocationSearchController *)self urlForQueryResult:v4];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      double v7 = [MEMORY[0x1E4F42738] sharedApplication];
      [v7 openURL:v5 withCompletionHandler:0];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)itemProviderForSearchResult:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 item];
    double v7 = [v6 attributeSet];
    double v8 = [v7 contentURL];

    if (v8)
    {
      objc_super v9 = [(CKLocationSearchController *)self urlForQueryResult:v5];
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D78], "__ck_itemProviderForAppleMapsCoordinateURL:vCardURL:", v9, v8);
      uint64_t v11 = v10;
      if (v10) {
        id v12 = v10;
      }
      else {
        _IMWarn();
      }
    }
    else
    {
      _IMWarn();
      uint64_t v11 = 0;
    }
  }
  else
  {
    _IMWarn();
    uint64_t v11 = 0;
  }

  return v11;
}

@end