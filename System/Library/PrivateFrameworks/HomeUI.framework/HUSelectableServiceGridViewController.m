@interface HUSelectableServiceGridViewController
+ (id)defaultItemProviderCreatorWithOptions:(unint64_t)a3;
+ (id)itemServiceTypesToHide;
+ (id)transformationBlockWithOptions:(unint64_t)a3;
- (BOOL)_shouldShowToggleButtonForSection:(int64_t)a3;
- (BOOL)_wantsToggleButtonForSection:(unint64_t)a3;
- (BOOL)allowsEmptySelection;
- (BOOL)allowsMultipleSelection;
- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4;
- (HFMutableSetDiff)mutableSelectedItems;
- (HFSetDiff)selectedItems;
- (HUSelectableServiceGridViewController)initWithItemManager:(id)a3;
- (HUSelectableServiceGridViewController)initWithServiceGridItemManager:(id)a3;
- (HUServiceGridItemManager)serviceGridItemManager;
- (double)headerViewHeightForSectionIndex:(unint64_t)a3;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (void)_addAllServicesInSectionFromButton:(id)a3;
- (void)_addItemToSelection:(id)a3;
- (void)_deleteItemFromSelection:(id)a3;
- (void)_removeAllServicesInSectionFromButton:(id)a3;
- (void)_setSelected:(BOOL)a3 forItemsInSection:(int64_t)a4;
- (void)_updateSelectionState:(BOOL)a3 forCell:(id)a4;
- (void)_updateToggleStateForSection:(int64_t)a3 headerViewCell:(id)a4;
- (void)addItemToSelection:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)deleteItemFromSelection:(id)a3;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setAllowsEmptySelection:(BOOL)a3;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setMutableSelectedItems:(id)a3;
- (void)setSelectedItems:(id)a3;
- (void)setServiceGridItemManager:(id)a3;
@end

@implementation HUSelectableServiceGridViewController

+ (id)itemServiceTypesToHide
{
  return (id)objc_msgSend(MEMORY[0x1E4F2EA88], "hf_serviceTypesHiddenFromScenesOrAutomations");
}

+ (id)transformationBlockWithOptions:(unint64_t)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HUSelectableServiceGridViewController_transformationBlockWithOptions___block_invoke;
  aBlock[3] = &__block_descriptor_40_e33___HFTransformItem_16__0__HFItem_8l;
  aBlock[4] = a3;
  v3 = _Block_copy(aBlock);

  return v3;
}

id __72__HUSelectableServiceGridViewController_transformationBlockWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  if ([v3 conformsToProtocol:&unk_1F1A3D460]) {
    v4 = (objc_class *)objc_opt_class();
  }
  id v5 = [v4 alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HUSelectableServiceGridViewController_transformationBlockWithOptions___block_invoke_2;
  v10[3] = &unk_1E6389080;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v3;
  uint64_t v12 = v6;
  id v7 = v3;
  v8 = (void *)[v5 initWithSourceItem:v7 transformationBlock:v10];

  return v8;
}

id __72__HUSelectableServiceGridViewController_transformationBlockWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 setObject:&unk_1F19B4EE0 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  if (*(unsigned char *)(a1 + 40)) {
    [v3 removeObjectForKey:*MEMORY[0x1E4F68980]];
  }
  if ([*(id *)(a1 + 32) conformsToProtocol:&unk_1F1A3D9B0]
    && ([*(id *)(a1 + 32) containsActions] & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if ((v4 & 2) != 0)
    {
      id v5 = _HULocalizedStringWithDefaultValue(@"HUSceneServicePickerItemDescriptionNoActionableCharacteristics", @"HUSceneServicePickerItemDescriptionNoActionableCharacteristics", 1);
      [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      uint64_t v4 = *(void *)(a1 + 40);
    }
    if ((v4 & 4) != 0) {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    }
  }
  if ((*(unsigned char *)(a1 + 40) & 8) != 0)
  {
    uint64_t v6 = *MEMORY[0x1E4F689E8];
    id v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (objc_class *)MEMORY[0x1E4F691E0];
      id v9 = v7;
      id v10 = [v8 alloc];
      id v11 = [v9 identifier];

      uint64_t v12 = [v10 initWithIdentifier:v11 incrementalState:&unk_1F19B6300];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = (objc_class *)MEMORY[0x1E4F68F38];
      id v14 = v7;
      id v15 = [v13 alloc];
      id v11 = [v14 packageIdentifier];

      uint64_t v12 = [v15 initWithPackageIdentifier:v11 state:*MEMORY[0x1E4F68360]];
    }
    v16 = (void *)v12;

    [v3 setObject:v16 forKeyedSubscript:v6];
    goto LABEL_15;
  }
LABEL_16:
  v17 = (void *)[v3 copy];

  return v17;
}

+ (id)defaultItemProviderCreatorWithOptions:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__HUSelectableServiceGridViewController_defaultItemProviderCreatorWithOptions___block_invoke;
  v5[3] = &__block_descriptor_48_e25___NSArray_16__0__HMHome_8l;
  v5[4] = a1;
  v5[5] = a3;
  id v3 = _Block_copy(v5);

  return v3;
}

id __79__HUSelectableServiceGridViewController_defaultItemProviderCreatorWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() transformationBlockWithOptions:*(void *)(a1 + 40)];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_alloc_init(MEMORY[0x1E4F69360]);
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F69558]) initWithHome:v3 serviceTypes:0];
  [v7 setValueSource:v6];
  v17 = v7;
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F696B0]) initWithSourceProvider:v7 transformationBlock:v4];
  objc_msgSend(v5, "addObject:");
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F69540]) initWithHome:v3];
  v18 = v6;
  [v8 setValueSource:v6];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F696B0]) initWithSourceProvider:v8 transformationBlock:v4];
  [v5 addObject:v9];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F69428]) initWithHome:v3];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F696B0]) initWithSourceProvider:v10 transformationBlock:v4];
  [v5 addObject:v11];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F69288]) initWithHome:v3 includeSiriEndPointProfiles:1];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F696B0]) initWithSourceProvider:v12 transformationBlock:v4];
  [v5 addObject:v13];
  if ((*(unsigned char *)(a1 + 40) & 0x10) != 0)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F68EC0]) initWithHome:v3 actionSetItemStyle:0];
    [v14 setValueSource:v18];
    [v5 addObject:v14];
  }

  return v5;
}

- (HUSelectableServiceGridViewController)initWithServiceGridItemManager:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUSelectableServiceGridViewController;
  id v5 = [(HUServiceGridViewController *)&v12 initWithItemManager:v4];
  id v6 = v5;
  if (v5)
  {
    [(HUServiceGridViewController *)v5 setShouldShowLoadingState:0];
    objc_storeWeak((id *)&v6->_serviceGridItemManager, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F692F8]);
    v8 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v9 = [v7 initWithFromSet:v8];
    mutableSelectedItems = v6->_mutableSelectedItems;
    v6->_mutableSelectedItems = (HFMutableSetDiff *)v9;

    v6->_allowsEmptySelection = 1;
    v6->_allowsMultipleSelection = 1;
  }

  return v6;
}

- (HUSelectableServiceGridViewController)initWithItemManager:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(sel_initWithServiceGridItemManager_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSelectableServiceGridViewController.m", 149, @"%s is unavailable; use %@ instead",
    "-[HUSelectableServiceGridViewController initWithItemManager:]",
    v6);

  return 0;
}

- (HFSetDiff)selectedItems
{
  v2 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
  id v3 = (void *)[v2 copy];

  return (HFSetDiff *)v3;
}

- (void)setSelectedItems:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v4 = (HFMutableSetDiff *)[v31 mutableCopy];
  mutableSelectedItems = self->_mutableSelectedItems;
  self->_mutableSelectedItems = v4;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = [(HUSelectableServiceGridViewController *)self collectionView];
  id v7 = [v6 indexPathsForVisibleItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v13 = [(HUSelectableServiceGridViewController *)self collectionView];
        id v14 = [v13 cellForItemAtIndexPath:v12];

        if (v14 && [v14 conformsToProtocol:&unk_1F19F56E8])
        {
          id v15 = [(HUItemCollectionViewController *)self itemManager];
          v16 = [v15 displayedItemAtIndexPath:v12];

          v17 = [v31 toSet];
          uint64_t v18 = [v17 containsObject:v16];

          [(HUSelectableServiceGridViewController *)self _updateSelectionState:v18 forCell:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v9);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v19 = [(HUSelectableServiceGridViewController *)self collectionView];
  uint64_t v20 = *MEMORY[0x1E4F43758];
  v21 = [v19 indexPathsForVisibleSupplementaryElementsOfKind:*MEMORY[0x1E4F43758]];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        objc_opt_class();
        v27 = [(HUSelectableServiceGridViewController *)self collectionView];
        v28 = [v27 supplementaryViewForElementKind:v20 atIndexPath:v26];
        if (objc_opt_isKindOfClass()) {
          v29 = v28;
        }
        else {
          v29 = 0;
        }
        id v30 = v29;

        if (v30) {
          -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", [v26 section], v30);
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v23);
  }
}

- (void)_addAllServicesInSectionFromButton:(id)a3
{
  uint64_t v4 = [a3 tag];

  [(HUSelectableServiceGridViewController *)self _setSelected:1 forItemsInSection:v4];
}

- (void)_removeAllServicesInSectionFromButton:(id)a3
{
  uint64_t v4 = [a3 tag];

  [(HUSelectableServiceGridViewController *)self _setSelected:0 forItemsInSection:v4];
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUSelectableServiceGridViewController;
  [(HUServiceGridViewController *)&v17 configureCell:v6 forItem:v7];
  if ([v6 conformsToProtocol:&unk_1F19F56E8])
  {
    id v8 = v6;
    uint64_t v9 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v10 = [v9 indexPathForItem:v7];
    BOOL v11 = [(HUSelectableServiceGridViewController *)self canSelectItem:v7 indexPath:v10];

    if (v11)
    {
      uint64_t v12 = [HUCheckmarkAccessoryView alloc];
      v13 = -[HUCheckmarkAccessoryView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [v8 setAccessoryView:v13];

      id v14 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
      id v15 = [v14 toSet];
      uint64_t v16 = [v15 containsObject:v7];
    }
    else
    {
      [v8 setAccessoryView:0];
      uint64_t v16 = 0;
    }
    [(HUSelectableServiceGridViewController *)self _updateSelectionState:v16 forCell:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setDisableContinuousIconAnimation:1];
    }
  }
}

- (void)itemManagerDidUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)HUSelectableServiceGridViewController;
  [(HUItemCollectionViewController *)&v21 itemManagerDidUpdate:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(HUSelectableServiceGridViewController *)self collectionView];
  uint64_t v5 = *MEMORY[0x1E4F43758];
  id v6 = [v4 indexPathsForVisibleSupplementaryElementsOfKind:*MEMORY[0x1E4F43758]];

  obuint64_t j = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        uint64_t v12 = [(HUSelectableServiceGridViewController *)self collectionView];
        v13 = [v12 supplementaryViewForElementKind:v5 atIndexPath:v11];
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }
        id v15 = v14;

        if (v15) {
          -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", [v11 section], v15);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }
}

- (double)headerViewHeightForSectionIndex:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F42B58] prominentInsetGroupedHeaderConfiguration];
  id v6 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v7 = [v6 titleForSection:a3];

  [v5 setText:v7];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F42B60]) initWithConfiguration:v5];
  objc_msgSend(v8, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v10 = v9;

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUSelectableServiceGridViewController;
  [(HUItemCollectionViewController *)&v20 collectionView:a3 didSelectItemAtIndexPath:v6];
  uint64_t v7 = [(HUSelectableServiceGridViewController *)self collectionView];
  uint64_t v8 = [v7 cellForItemAtIndexPath:v6];

  if ([v8 conformsToProtocol:&unk_1F19F56E8])
  {
    double v9 = [(HUItemCollectionViewController *)self itemManager];
    double v10 = [v9 displayedItemAtIndexPath:v6];

    if ([(HUSelectableServiceGridViewController *)self canSelectItem:v10 indexPath:v6])
    {
      BOOL v11 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
      uint64_t v12 = [v11 toSet];
      int v13 = [v12 containsObject:v10];

      if (v13) {
        [(HUSelectableServiceGridViewController *)self deleteItemFromSelection:v10];
      }
      else {
        [(HUSelectableServiceGridViewController *)self addItemToSelection:v10];
      }
      [(HUSelectableServiceGridViewController *)self didChangeSelection];
    }
    objc_opt_class();
    id v14 = [(HUSelectableServiceGridViewController *)self collectionView];
    uint64_t v15 = *MEMORY[0x1E4F43758];
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v6, "section"));
    long long v17 = [v14 supplementaryViewForElementKind:v15 atIndexPath:v16];
    if (objc_opt_isKindOfClass()) {
      long long v18 = v17;
    }
    else {
      long long v18 = 0;
    }
    id v19 = v18;

    if (v19) {
      -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", [v6 section], v19);
    }
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4F43758];
  id v11 = a3;
  if (([v8 isEqualToString:v10] & 1) == 0) {
    NSLog(&cfstr_AskedForAViewF.isa, v8);
  }
  uint64_t v12 = [(HUItemCollectionViewController *)self itemManager];
  int v13 = objc_msgSend(v12, "titleForSection:", objc_msgSend(v9, "section"));

  if (!v13) {
    NSLog(&cfstr_AskedForHeader.isa, v9);
  }
  objc_opt_class();
  id v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  uint64_t v16 = [v11 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v15 forIndexPath:v9];

  if (objc_opt_isKindOfClass()) {
    long long v17 = v16;
  }
  else {
    long long v17 = 0;
  }
  id v18 = v17;

  id v19 = [MEMORY[0x1E4F42B58] prominentInsetGroupedHeaderConfiguration];
  objc_super v20 = -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", [v9 section]);
  [v19 directionalLayoutMargins];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [v20 sectionLeadingMargin];
  objc_msgSend(v19, "setDirectionalLayoutMargins:", v22, v24 + v29, v26, v28);
  [v19 setText:v13];
  [v18 setContentConfiguration:v19];
  id v30 = [MEMORY[0x1E4F427B0] clearConfiguration];
  [v18 setBackgroundConfiguration:v30];

  [v18 directionalLayoutMargins];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  [v20 sectionTrailingMargin];
  objc_msgSend(v18, "setDirectionalLayoutMargins:", v32, v34, v36, v38 + v39);
  v40 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  v41 = [v19 secondaryTextProperties];
  uint64_t v42 = [v41 font];
  [v40 setFont:v42];

  objc_msgSend(v40, "setTag:", objc_msgSend(v9, "section"));
  v43 = (void *)[objc_alloc(MEMORY[0x1E4F42828]) initWithCustomView:v40 placement:1];
  [v43 setReservedLayoutWidth:0.0];
  [v43 setMaintainsFixedSize:0];
  objc_msgSend(v43, "setHidden:", -[HUSelectableServiceGridViewController _shouldShowToggleButtonForSection:](self, "_shouldShowToggleButtonForSection:", objc_msgSend(v9, "section")) ^ 1);
  v46[0] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  [v18 setAccessories:v44];

  -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", [v9 section], v18);

  return v18;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)HUSelectableServiceGridViewController;
  id v8 = a5;
  id v9 = a4;
  [(HUControllableItemCollectionViewController *)&v15 collectionView:a3 willDisplayCell:v9 forItemAtIndexPath:v8];
  uint64_t v10 = [(HUItemCollectionViewController *)self itemManager];
  id v11 = [v10 displayedItemAtIndexPath:v8];

  uint64_t v12 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
  int v13 = [v12 toSet];
  uint64_t v14 = [v13 containsObject:v11];

  [(HUSelectableServiceGridViewController *)self _updateSelectionState:v14 forCell:v9];
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  return 1;
}

- (void)deleteItemFromSelection:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v5 = [v4 indexPathForItem:v13];

  id v6 = [(HUSelectableServiceGridViewController *)self collectionView];
  uint64_t v7 = [v6 cellForItemAtIndexPath:v5];
  if ([v7 conformsToProtocol:&unk_1F19F56E8]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    if ([(HUSelectableServiceGridViewController *)self allowsEmptySelection]
      || ([(HUSelectableServiceGridViewController *)self mutableSelectedItems],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v10 toSet],
          id v11 = objc_claimAutoreleasedReturnValue(),
          unint64_t v12 = [v11 count],
          v11,
          v10,
          v12 >= 2))
    {
      [(HUSelectableServiceGridViewController *)self _deleteItemFromSelection:v13];
      [(HUSelectableServiceGridViewController *)self _updateSelectionState:0 forCell:v9];
    }
  }
}

- (void)addItemToSelection:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HUItemCollectionViewController *)self itemManager];
  id v6 = [v5 indexPathForItem:v4];

  uint64_t v7 = [(HUSelectableServiceGridViewController *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v6];
  if ([v8 conformsToProtocol:&unk_1F19F56E8]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    if (![(HUSelectableServiceGridViewController *)self allowsMultipleSelection])
    {
      double v23 = v6;
      id v24 = v4;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
      unint64_t v12 = [v11 toSet];
      id v13 = (void *)[v12 copy];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            [(HUSelectableServiceGridViewController *)self _deleteItemFromSelection:v18];
            id v19 = [(HUItemCollectionViewController *)self itemManager];
            objc_super v20 = [v19 indexPathForItem:v18];

            if (v20)
            {
              double v21 = [(HUSelectableServiceGridViewController *)self collectionView];
              double v22 = [v21 cellForItemAtIndexPath:v20];

              if (v22 && [v22 conformsToProtocol:&unk_1F19F56E8]) {
                [(HUSelectableServiceGridViewController *)self _updateSelectionState:0 forCell:v22];
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v15);
      }

      id v6 = v23;
      id v4 = v24;
    }
    [(HUSelectableServiceGridViewController *)self _addItemToSelection:v4];
    [(HUSelectableServiceGridViewController *)self _updateSelectionState:1 forCell:v10];
  }
}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v4 = a4;
  if ([v4 conformsToProtocol:&unk_1F1A3D460]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 services];
    id v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_239);

    id v10 = [(id)objc_opt_class() itemServiceTypesToHide];
    char v11 = [v10 intersectsSet:v9];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

uint64_t __79__HUSelectableServiceGridViewController_serviceGridItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serviceType];
}

- (void)_updateSelectionState:(BOOL)a3 forCell:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  objc_opt_class();
  id v6 = [v5 accessoryView];

  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  [v8 setChecked:v4];
}

- (void)_setSelected:(BOOL)a3 forItemsInSection:(int64_t)a4
{
  uint64_t v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = [v7 displayedItemsInSection:a4];

  if (a3) {
    goto LABEL_4;
  }
  if ([(HUSelectableServiceGridViewController *)self allowsEmptySelection]) {
    goto LABEL_4;
  }
  id v9 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
  id v10 = [v9 toSet];
  char v11 = (void *)[v10 mutableCopy];

  unint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  [v11 minusSet:v12];

  uint64_t v13 = [v11 count];
  if (v13)
  {
LABEL_4:
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__HUSelectableServiceGridViewController__setSelected_forItemsInSection___block_invoke;
    v20[3] = &unk_1E63901B8;
    BOOL v21 = a3;
    v20[4] = self;
    v20[5] = a4;
    [v8 enumerateObjectsUsingBlock:v20];
    objc_opt_class();
    uint64_t v14 = [(HUSelectableServiceGridViewController *)self collectionView];
    uint64_t v15 = *MEMORY[0x1E4F43758];
    uint64_t v16 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a4];
    long long v17 = [v14 supplementaryViewForElementKind:v15 atIndexPath:v16];
    if (objc_opt_isKindOfClass()) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = v18;

    if (v19) {
      [(HUSelectableServiceGridViewController *)self _updateToggleStateForSection:a4 headerViewCell:v19];
    }
    [(HUSelectableServiceGridViewController *)self didChangeSelection];
  }
}

void __72__HUSelectableServiceGridViewController__setSelected_forItemsInSection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48) && [*(id *)(a1 + 32) canSelectItem:v8 indexPath:v5]) {
    [*(id *)(a1 + 32) _addItemToSelection:v8];
  }
  else {
    [*(id *)(a1 + 32) _deleteItemFromSelection:v8];
  }
  id v6 = [*(id *)(a1 + 32) collectionView];
  uint64_t v7 = [v6 cellForItemAtIndexPath:v5];

  if (v7 && [v7 conformsToProtocol:&unk_1F19F56E8]) {
    [*(id *)(a1 + 32) _updateSelectionState:*(unsigned __int8 *)(a1 + 48) forCell:v7];
  }
}

- (void)_updateToggleStateForSection:(int64_t)a3 headerViewCell:(id)a4
{
  id v6 = a4;
  if ([(HUSelectableServiceGridViewController *)self _wantsToggleButtonForSection:a3])
  {
    objc_opt_class();
    uint64_t v7 = [v6 accessories];
    id v8 = [v7 firstObject];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    objc_opt_class();
    char v11 = [v10 customView];
    if (objc_opt_isKindOfClass()) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = 0;
    }
    id v13 = v12;

    [v13 removeTarget:self action:0 forControlEvents:64];
    if ([(HUSelectableServiceGridViewController *)self _shouldShowToggleButtonForSection:a3])
    {
      double v36 = v13;
      double v37 = v10;
      double v38 = v6;
      uint64_t v14 = [(HUItemCollectionViewController *)self itemManager];
      uint64_t v15 = [v14 displayedItemsInSection:a3];
      uint64_t v16 = [v15 count];

      uint64_t v17 = 0;
      if (v16)
      {
        unint64_t v18 = 0;
        do
        {
          id v19 = [MEMORY[0x1E4F28D58] indexPathForItem:v18 inSection:a3];
          objc_super v20 = [(HUItemCollectionViewController *)self itemManager];
          BOOL v21 = [v20 displayedItemAtIndexPath:v19];

          double v22 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
          double v23 = [v22 toSet];
          unsigned int v24 = [v23 containsObject:v21];

          v17 += v24;
          ++v18;
          long long v25 = [(HUItemCollectionViewController *)self itemManager];
          long long v26 = [v25 displayedItemsInSection:a3];
          unint64_t v27 = [v26 count];
        }
        while (v18 < v27);
      }
      long long v28 = (void *)MEMORY[0x1E4F42FF0];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __85__HUSelectableServiceGridViewController__updateToggleStateForSection_headerViewCell___block_invoke_2;
      v39[3] = &unk_1E63901E0;
      double v29 = &v40;
      uint64_t v30 = (id *)v41;
      id v13 = v36;
      id v10 = v37;
      v40 = v37;
      v41[0] = v36;
      uint64_t v43 = v17;
      v41[1] = self;
      id v6 = v38;
      id v42 = v38;
      id v31 = v36;
      id v32 = v37;
      [v28 performWithoutAnimation:v39];
    }
    else
    {
      double v33 = (void *)MEMORY[0x1E4F42FF0];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __85__HUSelectableServiceGridViewController__updateToggleStateForSection_headerViewCell___block_invoke;
      v44[3] = &unk_1E63850E0;
      double v29 = &v45;
      uint64_t v30 = &v46;
      id v45 = v13;
      id v46 = v10;
      id v34 = v13;
      id v35 = v10;
      [v33 performWithoutAnimation:v44];
    }
  }
}

uint64_t __85__HUSelectableServiceGridViewController__updateToggleStateForSection_headerViewCell___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitle:0 forState:0];
  v2 = *(void **)(a1 + 40);

  return [v2 setHidden:1];
}

uint64_t __85__HUSelectableServiceGridViewController__updateToggleStateForSection_headerViewCell___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:0];
  uint64_t v2 = *(void *)(a1 + 64);
  id v3 = *(void **)(a1 + 40);
  if (v2) {
    BOOL v4 = @"HUSelectableServiceGridSectionButtonRemoveAll";
  }
  else {
    BOOL v4 = @"HUSelectableServiceGridSectionButtonAddAll";
  }
  if (v2) {
    id v5 = &selRef__removeAllServicesInSectionFromButton_;
  }
  else {
    id v5 = &selRef__addAllServicesInSectionFromButton_;
  }
  id v6 = _HULocalizedStringWithDefaultValue(v4, v4, 1);
  [v3 setTitle:v6 forState:0];

  [*(id *)(a1 + 40) addTarget:*(void *)(a1 + 48) action:*v5 forControlEvents:64];
  uint64_t v7 = *(void **)(a1 + 56);

  return [v7 setNeedsLayout];
}

- (BOOL)_shouldShowToggleButtonForSection:(int64_t)a3
{
  if (!-[HUSelectableServiceGridViewController _wantsToggleButtonForSection:](self, "_wantsToggleButtonForSection:")) {
    return 0;
  }
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  id v6 = [v5 displayedItemsInSection:a3];
  uint64_t v7 = [v6 count];

  if (v7 < 2) {
    return 0;
  }
  id v8 = [(HUSelectableServiceGridViewController *)self serviceGridItemManager];
  BOOL v9 = [v8 actionSetSectionIndex] != a3
    && [(HUSelectableServiceGridViewController *)self allowsMultipleSelection];

  return v9;
}

- (BOOL)_wantsToggleButtonForSection:(unint64_t)a3
{
  return 1;
}

- (void)_addItemToSelection:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
  [v4 addObject:v5];

  [(HUSelectableServiceGridViewController *)self didSelectItem:v5];
}

- (void)_deleteItemFromSelection:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(HUSelectableServiceGridViewController *)self mutableSelectedItems];
  [v4 deleteObject:v5];

  [(HUSelectableServiceGridViewController *)self didDeselectItem:v5];
}

- (BOOL)allowsEmptySelection
{
  return self->_allowsEmptySelection;
}

- (void)setAllowsEmptySelection:(BOOL)a3
{
  self->_allowsEmptySelection = a3;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  self->_allowsMultipleSelection = a3;
}

- (HUServiceGridItemManager)serviceGridItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceGridItemManager);

  return (HUServiceGridItemManager *)WeakRetained;
}

- (void)setServiceGridItemManager:(id)a3
{
}

- (HFMutableSetDiff)mutableSelectedItems
{
  return self->_mutableSelectedItems;
}

- (void)setMutableSelectedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSelectedItems, 0);

  objc_destroyWeak((id *)&self->_serviceGridItemManager);
}

@end