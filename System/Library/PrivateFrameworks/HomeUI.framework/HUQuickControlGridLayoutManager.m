@interface HUQuickControlGridLayoutManager
- (HUQuickControlCollectionItemManaging)itemManager;
- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions;
- (HUQuickControlGridLayoutManager)init;
- (HUQuickControlGridLayoutManager)initWithCollectionView:(id)a3 itemManager:(id)a4 layoutOptions:(id)a5;
- (NSArray)collectionSectionSettings;
- (NSMutableArray)sectionSettingsArray;
- (UICollectionView)collectionView;
- (double)interItemSpacingForItemSize:(unint64_t)a3 layoutOptions:(id)a4;
- (double)sectionTopPaddingInSection:(unint64_t)a3 withLayoutOptions:(id)a4;
- (id)_settingsForSectionNumber:(unint64_t)a3 sectionIdentifier:(id)a4 layoutOptions:(id)a5;
- (id)_viewProfileClassesForSection:(unint64_t)a3;
- (int64_t)viewSizeSubclass;
- (unint64_t)_mostImportantItemTypeForSection:(unint64_t)a3;
- (unint64_t)itemSizeForSection:(unint64_t)a3;
- (unint64_t)numberOfColumnsInSection:(unint64_t)a3;
- (unint64_t)titlePositionForSection:(unint64_t)a3;
- (void)generateSectionSettings;
- (void)setCollectionView:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setSectionSettingsArray:(id)a3;
@end

@implementation HUQuickControlGridLayoutManager

- (HUQuickControlGridLayoutManager)initWithCollectionView:(id)a3 itemManager:(id)a4 layoutOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlGridLayoutManager;
  v11 = [(HUQuickControlGridLayoutManager *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_collectionView, v8);
    objc_storeStrong((id *)&v12->_itemManager, a4);
    objc_storeStrong((id *)&v12->_layoutOptions, a5);
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    sectionSettingsArray = v12->_sectionSettingsArray;
    v12->_sectionSettingsArray = (NSMutableArray *)v13;

    [(HUQuickControlGridLayoutManager *)v12 generateSectionSettings];
  }

  return v12;
}

- (HUQuickControlGridLayoutManager)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCollectionView_itemManager_layoutOptions_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUQuickControlGridLayoutManager.m", 57, @"%s is unavailable; use %@ instead",
    "-[HUQuickControlGridLayoutManager init]",
    v5);

  return 0;
}

- (void)setLayoutOptions:(id)a3
{
  v5 = (HUQuickControlCollectionViewControllerLayoutOptions *)a3;
  if (self->_layoutOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    [(HUQuickControlGridLayoutManager *)self generateSectionSettings];
    v5 = v6;
  }
}

- (NSArray)collectionSectionSettings
{
  v2 = [(HUQuickControlGridLayoutManager *)self sectionSettingsArray];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (unint64_t)itemSizeForSection:(unint64_t)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v5 = [(HUQuickControlGridLayoutManager *)self itemManager];
  uint64_t v6 = [v5 displayedItemsInSection:a3];
  unint64_t v7 = [(id)v6 count];

  id v8 = [(HUQuickControlGridLayoutManager *)self itemManager];
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6)
  {
    if (v7 > 2) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    uint64_t v10 = [(HUQuickControlGridLayoutManager *)self viewSizeSubclass];
    v11 = [(HUQuickControlGridLayoutManager *)self itemManager];
    v12 = [v11 displayedSectionIdentifierForSectionIndex:a3];

    unint64_t v13 = [(HUQuickControlGridLayoutManager *)self _mostImportantItemTypeForSection:a3];
    if ([v12 hasSuffix:@"supplementary"])
    {
      if (v13 == 4)
      {
        v33[0] = &unk_1F19B3AD0;
        v33[1] = &unk_1F19B3B00;
        v34[0] = &unk_1F19B3AE8;
        v34[1] = &unk_1F19B3B18;
        v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = v34;
        objc_super v16 = v33;
LABEL_8:
        uint64_t v17 = 2;
LABEL_18:
        v21 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
        unint64_t v9 = HUConstantIntegerForViewSizeSubclass(v10, v21);
      }
      else
      {
LABEL_19:
        unint64_t v9 = 1;
      }
    }
    else
    {
      unint64_t v9 = 2;
      switch(v13)
      {
        case 0uLL:
          v18 = [(HUQuickControlGridLayoutManager *)self itemManager];
          v19 = [v18 displayedItemsInSectionWithIdentifier:@"supplementary"];
          int v20 = objc_msgSend(v19, "na_any:", &__block_literal_global_26);

          if (v20)
          {
            v29[0] = &unk_1F19B3AD0;
            v29[1] = &unk_1F19B3B00;
            v30[0] = &unk_1F19B3B30;
            v30[1] = &unk_1F19B3B18;
            v14 = (void *)MEMORY[0x1E4F1C9E8];
            v15 = v30;
            objc_super v16 = v29;
          }
          else
          {
            v27[0] = &unk_1F19B3AD0;
            v27[1] = &unk_1F19B3B00;
            v28[0] = &unk_1F19B3AE8;
            v28[1] = &unk_1F19B3B48;
            v14 = (void *)MEMORY[0x1E4F1C9E8];
            v15 = v28;
            objc_super v16 = v27;
          }
          goto LABEL_8;
        case 1uLL:
          if (v7 >= 8)
          {
            v31[0] = &unk_1F19B3AD0;
            v31[1] = &unk_1F19B3B00;
            v32[0] = &unk_1F19B3AE8;
            v32[1] = &unk_1F19B3B18;
            v14 = (void *)MEMORY[0x1E4F1C9E8];
            v15 = v32;
            objc_super v16 = v31;
            goto LABEL_8;
          }
          if (v7 > 2) {
            unint64_t v9 = 2;
          }
          else {
            unint64_t v9 = 3;
          }
          break;
        case 2uLL:
          v25[0] = &unk_1F19B3AD0;
          v25[1] = &unk_1F19B3B00;
          v26[0] = &unk_1F19B3AE8;
          v26[1] = &unk_1F19B3B48;
          v25[2] = &unk_1F19B3B60;
          v26[2] = &unk_1F19B3B48;
          v14 = (void *)MEMORY[0x1E4F1C9E8];
          v15 = v26;
          objc_super v16 = v25;
          goto LABEL_17;
        case 7uLL:
          if (v7 != 1) {
            goto LABEL_19;
          }
          v23[0] = &unk_1F19B3AD0;
          v23[1] = &unk_1F19B3B00;
          v24[0] = &unk_1F19B3B18;
          v24[1] = &unk_1F19B3B48;
          v23[2] = &unk_1F19B3B60;
          v24[2] = &unk_1F19B3B48;
          v14 = (void *)MEMORY[0x1E4F1C9E8];
          v15 = v24;
          objc_super v16 = v23;
LABEL_17:
          uint64_t v17 = 3;
          goto LABEL_18;
        default:
          break;
      }
    }
  }
  return v9;
}

uint64_t __54__HUQuickControlGridLayoutManager_itemSizeForSection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)generateSectionSettings
{
  v3 = [(HUQuickControlGridLayoutManager *)self itemManager];
  uint64_t v4 = [v3 numberOfSections];

  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  [(HUQuickControlGridLayoutManager *)self setSectionSettingsArray:v5];

  uint64_t v6 = [(HUQuickControlGridLayoutManager *)self itemManager];
  if ([v6 sectionIndexForDisplayedSectionIdentifier:@"sensors"])
  {
    int v7 = 0;
  }
  else
  {
    id v8 = [(HUQuickControlGridLayoutManager *)self itemManager];
    unint64_t v9 = [v8 displayedSectionIdentifierForSectionIndex:1];
    int v7 = [v9 hasSuffix:@"grid"];
  }
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v11 = [(HUQuickControlGridLayoutManager *)self itemManager];
      v12 = [v11 displayedSectionIdentifierForSectionIndex:i];

      unint64_t v13 = [(HUQuickControlGridLayoutManager *)self layoutOptions];
      char v14 = [v12 isEqualToString:@"sensors"];
      v15 = off_1E6382340;
      if ((v14 & 1) != 0
        || (unint64_t v16 = [(HUQuickControlGridLayoutManager *)self _mostImportantItemTypeForSection:i], v15 = off_1E6382230, v16 == 6))
      {
        uint64_t v17 = *v15;
        v18 = [(HUQuickControlGridLayoutManager *)self layoutOptions];
        [v18 viewSize];
        uint64_t v19 = -[__objc2_class defaultOptionsForViewSize:](v17, "defaultOptionsForViewSize:");

        unint64_t v13 = (void *)v19;
      }
      int v20 = [(HUQuickControlGridLayoutManager *)self _settingsForSectionNumber:i sectionIdentifier:v12 layoutOptions:v13];
      if (v7 && [v12 isEqualToString:@"grid"])
      {
        [v13 minimumSectionToSensorSectionSpacing];
        objc_msgSend(v20, "setSectionTopPadding:");
      }
      else if ([v12 isEqualToString:@"sensors"])
      {
        [v20 setHorizontalAlignment:3];
      }
      v21 = [(HUQuickControlGridLayoutManager *)self sectionSettingsArray];
      [v21 addObject:v20];
    }
  }
}

- (id)_settingsForSectionNumber:(unint64_t)a3 sectionIdentifier:(id)a4 layoutOptions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = objc_alloc_init(HUQuickControlCollectionGridLayoutSettings);
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setSectionNumber:a3];
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setSectionIdentifier:v9];

  v11 = [(HUQuickControlGridLayoutManager *)self itemManager];
  v12 = [v11 titleForSection:a3];
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setSectionHeader:v12];

  unint64_t v13 = [(HUQuickControlGridLayoutManager *)self itemManager];
  char v14 = [v13 attributedTitleForSection:a3];
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setSectionAttributedHeader:v14];

  [(HUQuickControlCollectionGridLayoutSettings *)v10 setTitlePosition:[(HUQuickControlGridLayoutManager *)self titlePositionForSection:a3]];
  [(HUQuickControlGridLayoutManager *)self sectionTopPaddingInSection:a3 withLayoutOptions:v8];
  -[HUQuickControlCollectionGridLayoutSettings setSectionTopPadding:](v10, "setSectionTopPadding:");
  [v8 rowSpacing];
  -[HUQuickControlCollectionGridLayoutSettings setRowSpacing:](v10, "setRowSpacing:");
  -[HUQuickControlCollectionGridLayoutSettings setPreferredLayoutStyle:](v10, "setPreferredLayoutStyle:", [v8 preferredLayoutStyle]);
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setHorizontalAlignment:3];
  unint64_t v15 = [(HUQuickControlGridLayoutManager *)self itemSizeForSection:a3];
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setItemSize:v15];
  [(HUQuickControlGridLayoutManager *)self interItemSpacingForItemSize:v15 layoutOptions:v8];
  double v17 = v16;

  [(HUQuickControlCollectionGridLayoutSettings *)v10 setInteritemSpacing:v17];
  v18 = [(HUQuickControlGridLayoutManager *)self itemManager];
  uint64_t v19 = [v18 displayedItemsInSection:a3];
  unint64_t v20 = [v19 count];

  unint64_t v21 = [(HUQuickControlGridLayoutManager *)self numberOfColumnsInSection:a3];
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setNumberOfItems:v20];
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setNumberOfColumns:v21];
  if (v20 <= v21) {
    unint64_t v22 = 1;
  }
  else {
    unint64_t v22 = vcvtpd_u64_f64((double)v20 / (double)v21);
  }
  [(HUQuickControlCollectionGridLayoutSettings *)v10 setNumberOfRows:v22];

  return v10;
}

- (double)interItemSpacingForItemSize:(unint64_t)a3 layoutOptions:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  switch(a3)
  {
    case 0uLL:
      [v6 interitemSpacingForExtraSmallControlSize];
      goto LABEL_6;
    case 1uLL:
      [v6 interitemSpacingForSmallControlSize];
      goto LABEL_6;
    case 2uLL:
      [v6 interitemSpacingForRegularControlSize];
      goto LABEL_6;
    case 3uLL:
      [v6 interitemSpacingForLargeControlSize];
LABEL_6:
      double v4 = v8;
      break;
    default:
      break;
  }

  return v4;
}

- (double)sectionTopPaddingInSection:(unint64_t)a3 withLayoutOptions:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  if (a3)
  {
    [v6 minimumSectionSpacing];
    double v9 = v8;
    uint64_t v10 = [(HUQuickControlGridLayoutManager *)self itemManager];
    v11 = [v10 displayedSectionIdentifierForSectionIndex:a3];

    if ([v11 hasSuffix:@"supplementary"])
    {
      unint64_t v12 = [(HUQuickControlGridLayoutManager *)self _mostImportantItemTypeForSection:a3];
      unint64_t v13 = [(HUQuickControlGridLayoutManager *)self _mostImportantItemTypeForSection:a3 - 1];
      if (v12 == 3 && v13 == 2)
      {
        [v7 thermostatSectionSpacingOverride];
        double v9 = v14;
      }
    }
    else
    {
      int v16 = [v11 isEqualToString:@"sensors"];
      unint64_t v17 = a3 - 2;
      if (a3 >= 2 && v16)
      {
        v18 = [(HUQuickControlGridLayoutManager *)self itemManager];
        unint64_t v19 = a3 - 1;
        unint64_t v20 = [v18 displayedSectionIdentifierForSectionIndex:a3 - 1];

        unint64_t v21 = [(HUQuickControlGridLayoutManager *)self itemManager];
        unint64_t v22 = [v21 displayedSectionIdentifierForSectionIndex:v17];

        unint64_t v23 = [(HUQuickControlGridLayoutManager *)self _mostImportantItemTypeForSection:v19];
        unint64_t v24 = [(HUQuickControlGridLayoutManager *)self _mostImportantItemTypeForSection:v17];
        if ([v20 hasSuffix:@"supplementary"]
          && [v22 hasSuffix:@"grid"]
          && v23 == 3
          && v24 == 2)
        {
          [v7 thermostatSectionSpacingOverride];
          double v9 = v25;
        }
      }
    }
  }
  else
  {
    [v6 minimumNavBarToControlsSpacing];
    double v9 = v15;
  }

  return v9;
}

- (unint64_t)numberOfColumnsInSection:(unint64_t)a3
{
  v5 = [(HUQuickControlGridLayoutManager *)self itemManager];
  id v6 = [v5 displayedItemsInSection:a3];
  unint64_t v7 = [v6 count];

  double v8 = [(HUQuickControlGridLayoutManager *)self itemManager];
  double v9 = [v8 displayedSectionIdentifierForSectionIndex:a3];

  if ([v9 hasSuffix:@"grid"])
  {
    unint64_t v10 = [(HUQuickControlGridLayoutManager *)self _mostImportantItemTypeForSection:a3];
    uint64_t v11 = 2;
    if (v7 < 2) {
      uint64_t v11 = v7;
    }
    uint64_t v12 = 1;
    if (v7 >= 4) {
      uint64_t v12 = 2;
    }
    if (v10 == 1) {
      uint64_t v11 = v12;
    }
    if (v10 == 2) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = v11;
    }
  }
  else if ([v9 isEqualToString:@"sensors"])
  {
    if (v7 >= 2) {
      unint64_t v7 = 2;
    }
  }
  else
  {
    unint64_t v13 = [(HUQuickControlGridLayoutManager *)self _mostImportantItemTypeForSection:a3]- 3;
    uint64_t v14 = 3;
    if (v7 < 3) {
      uint64_t v14 = v7;
    }
    if (v13 < 3) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = v14;
    }
  }

  return v7;
}

- (unint64_t)titlePositionForSection:(unint64_t)a3
{
  v5 = [(HUQuickControlGridLayoutManager *)self itemManager];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  unint64_t v7 = (void *)MEMORY[0x1E4F28BD0];
  double v8 = [(HUQuickControlGridLayoutManager *)self _viewProfileClassesForSection:a3];
  double v9 = [v7 setWithArray:v8];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke;
  v21[3] = &unk_1E63865E0;
  id v22 = v9;
  id v10 = v9;
  LODWORD(v8) = objc_msgSend(v10, "na_any:", v21);
  uint64_t v11 = [(HUQuickControlGridLayoutManager *)self itemManager];
  uint64_t v12 = [v11 displayedItemsInSection:a3];

  unint64_t v13 = (void *)MEMORY[0x1E4F28BD0];
  uint64_t v14 = objc_msgSend(v12, "na_map:", &__block_literal_global_35_2);
  double v15 = [v13 setWithArray:v14];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke_3;
  v19[3] = &unk_1E6386608;
  id v20 = v15;
  id v16 = v15;
  if (v8 | objc_msgSend(v16, "na_any:", v19)) {
    unint64_t v17 = 1;
  }
  else {
    unint64_t v17 = 2;
  }

  return v17;
}

uint64_t __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [*(id *)(a1 + 32) countForObject:a2];
  LODWORD(result) = [a2 isEqual:objc_opt_class()];
  if (v3 > 2) {
    return result;
  }
  else {
    return 0;
  }
}

id __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 valueSource];
  unint64_t v7 = [v6 primaryServiceDescriptor];
  double v8 = [v7 serviceType];

  return v8;
}

BOOL __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (unint64_t)[*(id *)(a1 + 32) countForObject:a2] > 1;
}

- (int64_t)viewSizeSubclass
{
  id v2 = [(HUQuickControlGridLayoutManager *)self layoutOptions];
  int64_t v3 = [v2 viewSizeSubclass];

  return v3;
}

- (unint64_t)_mostImportantItemTypeForSection:(unint64_t)a3
{
  id v5 = [(HUQuickControlGridLayoutManager *)self itemManager];
  char v6 = [v5 displayedSectionIdentifierForSectionIndex:a3];

  int v7 = [v6 hasSuffix:@"supplementary"];
  double v8 = [(HUQuickControlGridLayoutManager *)self itemManager];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(HUQuickControlGridLayoutManager *)self _viewProfileClassesForSection:a3];
    uint64_t v11 = v10;
    if (!v7) {
      goto LABEL_11;
    }
    int v12 = objc_msgSend(v10, "na_any:", &__block_literal_global_39);
    int v13 = objc_msgSend(v11, "na_any:", &__block_literal_global_42);
    char v14 = objc_msgSend(v11, "na_any:", &__block_literal_global_45);
    uint64_t v15 = 4;
    if (!v13) {
      uint64_t v15 = 5;
    }
    unint64_t v16 = v12 ? 3 : v15;
    if ((v12 & 1) == 0 && (v13 & 1) == 0 && (v14 & 1) == 0)
    {
LABEL_11:
      int v17 = objc_msgSend(v11, "na_all:", &__block_literal_global_48);
      int v18 = objc_msgSend(v11, "na_any:", &__block_literal_global_50);
      char v19 = objc_msgSend(v11, "na_any:", &__block_literal_global_54);
      int v20 = objc_msgSend(v11, "na_all:", &__block_literal_global_57);
      uint64_t v21 = 1;
      if (!v17) {
        uint64_t v21 = 2;
      }
      uint64_t v22 = 7;
      if (!v20) {
        uint64_t v22 = 8;
      }
      if (v18) {
        uint64_t v22 = 0;
      }
      if (v19) {
        uint64_t v22 = v21;
      }
      if (v17) {
        unint64_t v16 = v21;
      }
      else {
        unint64_t v16 = v22;
      }
    }
  }
  else if (v7)
  {
    unint64_t v16 = 6;
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_opt_class();

  return [a2 isEqual:v3];
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_opt_class();

  return [a2 isEqual:v3];
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_opt_class();

  return [a2 isEqual:v3];
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_opt_class();

  return [a2 isEqual:v3];
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_5(uint64_t a1, void *a2)
{
  if (([a2 isEqual:objc_opt_class()] & 1) != 0
    || ([a2 isEqual:objc_opt_class()] & 1) != 0)
  {
    return 1;
  }
  uint64_t v4 = objc_opt_class();

  return [a2 isEqual:v4];
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_opt_class();

  return [a2 isEqual:v3];
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_opt_class();

  return [a2 isEqual:v3];
}

- (id)_viewProfileClassesForSection:(unint64_t)a3
{
  id v5 = [(HUQuickControlGridLayoutManager *)self itemManager];
  char v6 = [v5 displayedItemsInSection:a3];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HUQuickControlGridLayoutManager__viewProfileClassesForSection___block_invoke;
  v10[3] = &unk_1E6386650;
  v10[4] = self;
  int v7 = objc_msgSend(v6, "na_map:", v10);
  double v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_61_0);

  return v8;
}

id __65__HUQuickControlGridLayoutManager__viewProfileClassesForSection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 itemManager];
  id v5 = [v4 quickControlContextForItem:v3];

  return v5;
}

uint64_t __65__HUQuickControlGridLayoutManager__viewProfileClassesForSection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 viewProfileClass];
}

- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HUQuickControlCollectionItemManaging)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (NSMutableArray)sectionSettingsArray
{
  return self->_sectionSettingsArray;
}

- (void)setSectionSettingsArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionSettingsArray, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_itemManager, 0);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end