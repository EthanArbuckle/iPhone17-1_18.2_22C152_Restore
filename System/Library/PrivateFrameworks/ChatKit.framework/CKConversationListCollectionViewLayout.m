@interface CKConversationListCollectionViewLayout
- (BOOL)_sectionNeedsRecoverableDisclosureHeader:(int64_t)a3;
- (CKConversationListCollectionViewController)conversationListController;
- (CKConversationListCollectionViewLayout)init;
- (double)_edgeToAvatarWidthForPinnedConversationLayoutStyle:(int64_t)a3;
- (double)_leadingSeparatorInsetForEnvironment:(id)a3;
- (double)_minimumEdgeToCellSpacingForLayoutStyle:(int64_t)a3;
- (double)_totalVerticalRowSpacingForLayoutStyle:(int64_t)a3;
- (double)conversationCellHeight;
- (double)pinnedConversationCellHeightForLayoutStyle:(int64_t)a3 cellWidth:(double)a4;
- (double)widthForPinnedConversationCellInCollectionViewOfSize:(CGSize)a3 numberOfItems:(int64_t)a4;
- (id)_emptyLayoutSection;
- (id)conversationListLayout;
- (id)focusFilterLayoutSectionForEnvironment:(id)a3;
- (id)pinGridLayoutGroupForCollectionViewSize:(CGSize)a3 numberOfItems:(int64_t)a4;
- (id)pinGridLayoutSectionForEnvironment:(id)a3 withNumberOfItems:(int64_t)a4 isShowingFocusFilterBanner:(BOOL)a5;
- (id)pinningOnboardingTitleLayoutSectionForEnvironment:(id)a3;
- (id)rowLayoutSectionForEnvironment:(id)a3 withRowHeight:(double)a4 usingEstimatedRowHeight:(BOOL)a5 needsPinnedSectionSeparator:(BOOL)a6 forSection:(int64_t)a7;
- (id)tipKitLayoutSectionForEnvironment:(id)a3;
- (int64_t)_numberOfItemsInSection:(unint64_t)a3;
- (int64_t)_pinnedConversationViewLayoutStyleForCollectionViewSize:(CGSize)a3;
- (int64_t)numberOfPinnedConversationColumnsForLayoutStyle:(int64_t)a3;
- (void)setConversationListController:(id)a3;
- (void)updatePinnedConversationViewLayoutStyle;
@end

@implementation CKConversationListCollectionViewLayout

- (void)updatePinnedConversationViewLayoutStyle
{
  v3 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  v4 = [v3 collectionView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  int64_t v9 = -[CKConversationListCollectionViewLayout _pinnedConversationViewLayoutStyleForCollectionViewSize:](self, "_pinnedConversationViewLayoutStyleForCollectionViewSize:", v6, v8);
  id v10 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  [v10 setPinnedConversationViewLayoutStyle:v9];
}

- (double)_leadingSeparatorInsetForEnvironment:(id)a3
{
  id v4 = a3;
  double v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 conversationListCellUsesLargeTextLayout];

  if (v6)
  {
    double v7 = +[CKUIBehavior sharedBehaviors];
    [v7 conversationListCellLargeTextLeftMargin];
  }
  else
  {
    int64_t v9 = [(CKConversationListCollectionViewLayout *)self conversationListController];
    uint64_t v10 = [v9 filterMode];

    v11 = +[CKUIBehavior sharedBehaviors];
    double v7 = v11;
    if (v10 == 9) {
      [v11 conversationListCellLeftMargin];
    }
    else {
      [v11 conversationCellLeadingSeparatorInsetForEnvironment:v4];
    }
  }
  double v12 = v8;

  return v12;
}

id __64__CKConversationListCollectionViewLayout_conversationListLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = [v5 container];
  [v6 effectiveContentSize];
  double v8 = v7;

  if (CKIsRunningInMacCatalyst())
  {
    int64_t v9 = +[CKUIBehavior sharedBehaviors];
    [v9 snapToMinConversationListWidth];
    BOOL v11 = v8 < v10;
  }
  else
  {
    BOOL v11 = 0;
  }
  if (a2 != 2 || v11)
  {
    if (a2)
    {
      if (a2 == 1)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        uint64_t v17 = [WeakRetained pinningOnboardingTitleLayoutSectionForEnvironment:v5];
      }
      else
      {
        if (a2 != 3)
        {
          v20 = [v5 _dataSourceSnapshot];
          uint64_t v21 = [v20 numberOfItemsInSection:2];

          BOOL v22 = a2 == 2 && v11;
          BOOL v23 = v21 > 0 && v22;
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          [WeakRetained conversationCellHeight];
          double v25 = v24;
          v26 = +[CKUIBehavior sharedBehaviors];
          v18 = objc_msgSend(WeakRetained, "rowLayoutSectionForEnvironment:withRowHeight:usingEstimatedRowHeight:needsPinnedSectionSeparator:forSection:", v5, objc_msgSend(v26, "isAccessibilityPreferredContentSizeCategory"), v23, a2, v25);

          goto LABEL_14;
        }
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        uint64_t v17 = [WeakRetained tipKitLayoutSectionForEnvironment:v5];
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      uint64_t v17 = [WeakRetained focusFilterLayoutSectionForEnvironment:v5];
    }
  }
  else
  {
    double v12 = [v5 _dataSourceSnapshot];
    uint64_t v13 = [v12 numberOfItemsInSection:2];

    v14 = [v5 _dataSourceSnapshot];
    BOOL v15 = [v14 numberOfItemsInSection:0] > 0;

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v17 = [WeakRetained pinGridLayoutSectionForEnvironment:v5 withNumberOfItems:v13 isShowingFocusFilterBanner:v15];
  }
  v18 = (void *)v17;
LABEL_14:

  return v18;
}

- (id)rowLayoutSectionForEnvironment:(id)a3 withRowHeight:(double)a4 usingEstimatedRowHeight:(BOOL)a5 needsPinnedSectionSeparator:(BOOL)a6 forSection:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v54[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  v14 = [v13 delegate];
  if ([v14 isCollapsed]) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 4;
  }

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F43110]) initWithAppearanceStyle:v15 layoutEnvironment:v12];
  if (!CKIsRunningInMacCatalyst()) {
    goto LABEL_9;
  }
  uint64_t v17 = [v12 container];
  [v17 contentSize];
  double v19 = v18;
  v20 = +[CKUIBehavior sharedBehaviors];
  [v20 snapToMinConversationListWidth];
  double v22 = v21;

  if (v19 >= v22)
  {
LABEL_9:
    BOOL v23 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v16, "setSeparatorStyle:", objc_msgSend(v23, "conversationListSeparatorStyle"));

    CKIsRunningInMacCatalyst();
LABEL_10:
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke;
    v52[3] = &unk_1E5621E38;
    v52[4] = self;
    [v16 setLeadingSwipeActionsConfigurationProvider:v52];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_2;
    v51[3] = &unk_1E5621E38;
    v51[4] = self;
    [v16 setTrailingSwipeActionsConfigurationProvider:v51];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_3;
    v50[3] = &unk_1E5620C40;
    v50[4] = self;
    [v16 setWillBeginSwipingHandler:v50];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_4;
    v49[3] = &unk_1E5620C40;
    v49[4] = self;
    [v16 setDidEndSwipingHandler:v49];
    if (v9) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  [v16 setSeparatorStyle:0];
  if (!CKIsRunningInMacCatalyst()) {
    goto LABEL_10;
  }
  if (v9)
  {
LABEL_8:
    [v16 setEstimatedRowHeight:*MEMORY[0x1E4F43FA0]];
    goto LABEL_12;
  }
LABEL_11:
  [v16 setRowHeight:a4];
LABEL_12:
  [(CKConversationListCollectionViewLayout *)self _leadingSeparatorInsetForEnvironment:v12];
  objc_msgSend(v16, "setSeparatorInset:", 0.0, v24, 0.0, 0.0);
  double v25 = (void *)[objc_alloc(MEMORY[0x1E4F43108]) initWithConfiguration:v16 layoutEnvironment:v12];
  if (v8)
  {
    v26 = [v12 container];
    [v26 effectiveContentSize];
    double v28 = v27;
    double v30 = v29;

    +[CKPinnedSectionSeparatorView heightWithPadding];
    v31 = objc_msgSend(MEMORY[0x1E4F42608], "absoluteDimension:");
    -[CKConversationListCollectionViewLayout _edgeToAvatarWidthForPinnedConversationLayoutStyle:](self, "_edgeToAvatarWidthForPinnedConversationLayoutStyle:", -[CKConversationListCollectionViewLayout _pinnedConversationViewLayoutStyleForCollectionViewSize:](self, "_pinnedConversationViewLayoutStyleForCollectionViewSize:", v28, v30));
    double v33 = v28 + v32 * -2.0;
    if (v33 <= 0.0)
    {
      double v48 = v33;
      _IMWarn();
      double v33 = 0.0;
    }
    v34 = objc_msgSend(MEMORY[0x1E4F42608], "absoluteDimension:", v33, *(void *)&v48);
    v35 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v34 heightDimension:v31];
    v36 = (void *)MEMORY[0x1E4F425F8];
    v37 = +[CKPinnedSectionSeparatorView reuseIdentifier];
    v38 = [v36 boundarySupplementaryItemWithLayoutSize:v35 elementKind:v37 alignment:5];

    v54[0] = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    [v25 setBoundarySupplementaryItems:v39];
  }
  if ([(CKConversationListCollectionViewLayout *)self _sectionNeedsRecoverableDisclosureHeader:a7])
  {
    v40 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
    v41 = [MEMORY[0x1E4F42608] estimatedDimension:50.0];
    v42 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v40 heightDimension:v41];
    v43 = (void *)MEMORY[0x1E4F425F8];
    v44 = +[CKRecoverableSectionDisclosureView reuseIdentifier];
    v45 = [v43 boundarySupplementaryItemWithLayoutSize:v42 elementKind:v44 alignment:1];

    v53 = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    [v25 setBoundarySupplementaryItems:v46];
  }

  return v25;
}

- (double)conversationCellHeight
{
  id v4 = +[CKUIBehavior sharedBehaviors];
  char v5 = [v4 isAccessibilityPreferredContentSizeCategory];

  if (v5) {
    return 0.0;
  }
  double v7 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  BOOL v8 = [v7 cellLayout];

  if (!v8)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"CKConversationListCollectionViewLayout.m", 520, @"%@ needs a cell layout.", v15 object file lineNumber description];
  }
  BOOL v9 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  double v10 = [v9 traitCollection];
  [v10 displayScale];
  objc_msgSend(v8, "cellHeightForDisplayScale:");
  double v12 = v11;

  return v12;
}

- (CKConversationListCollectionViewController)conversationListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_conversationListController);

  return (CKConversationListCollectionViewController *)WeakRetained;
}

- (BOOL)_sectionNeedsRecoverableDisclosureHeader:(int64_t)a3
{
  if (CKIsRunningInMacCatalyst()) {
    return 0;
  }
  if (a3 == 6)
  {
    double v12 = [(CKConversationListCollectionViewLayout *)self conversationListController];
    char v13 = [v12 isRecentlyDeletedModal];

    if ((v13 & 1) == 0)
    {
      BOOL v9 = [(CKConversationListCollectionViewLayout *)self conversationListController];
      if ([v9 filterMode] == 7) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
    return 1;
  }
  if (a3 == 5)
  {
    double v7 = [(CKConversationListCollectionViewLayout *)self conversationListController];
    char v8 = [v7 isOscarModal];

    if ((v8 & 1) == 0)
    {
      BOOL v9 = [(CKConversationListCollectionViewLayout *)self conversationListController];
      if ([v9 filterMode] == 9)
      {
LABEL_8:
        double v10 = [(CKConversationListCollectionViewLayout *)self conversationListController];
        double v11 = [v10 delegate];
        char v5 = [v11 isCollapsed];

LABEL_13:
        return v5;
      }
LABEL_12:
      char v5 = 0;
      goto LABEL_13;
    }
    return 1;
  }
  return 0;
}

- (int64_t)_pinnedConversationViewLayoutStyleForCollectionViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (CKIsRunningInMacCatalyst()) {
    return 5;
  }
  if (width > height) {
    return 4;
  }
  if (width < 315.0) {
    return 3;
  }
  if (width >= 350.0) {
    return width >= 400.0;
  }
  return 2;
}

- (id)pinGridLayoutSectionForEnvironment:(id)a3 withNumberOfItems:(int64_t)a4 isShowingFocusFilterBanner:(BOOL)a5
{
  if (a4 < 1)
  {
    v14 = [(CKConversationListCollectionViewLayout *)self _emptyLayoutSection];
  }
  else
  {
    BOOL v6 = a5;
    char v8 = [a3 container];
    [v8 effectiveContentSize];
    double v10 = v9;
    double v12 = v11;

    char v13 = -[CKConversationListCollectionViewLayout pinGridLayoutGroupForCollectionViewSize:numberOfItems:](self, "pinGridLayoutGroupForCollectionViewSize:numberOfItems:", a4, v10, v12);
    v14 = [MEMORY[0x1E4F42630] sectionWithGroup:v13];
    uint64_t v15 = +[CKUIBehavior sharedBehaviors];
    [v15 totalTopSpacingFromSearchBarToPinnedItems:v6];
    double v17 = v16;
    +[CKPinnedConversationView avatarViewPadding];
    double v19 = v17 - v18;
    v20 = [v13 edgeSpacing];
    double v21 = [v20 top];
    [v21 spacing];
    double v23 = v19 - v22;

    double v24 = +[CKUIBehavior sharedBehaviors];
    [v24 conversationListTotalLastPinNameToFirstCellSpacing];
    double v26 = v25;
    +[CKPinnedConversationView titleLabelVerticalPadding];
    double v28 = v26 - v27;
    double v29 = [v13 edgeSpacing];
    double v30 = [v29 bottom];
    [v30 spacing];
    double v32 = v28 - v31;

    objc_msgSend(v14, "setContentInsets:", v23, 0.0, v32, 0.0);
  }

  return v14;
}

- (id)focusFilterLayoutSectionForEnvironment:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F42608], "fractionalWidthDimension:", a3, 1.0);
  id v4 = [MEMORY[0x1E4F42608] estimatedDimension:44.0];
  char v5 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v3 heightDimension:v4];
  BOOL v6 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v5];
  double v7 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  char v8 = [MEMORY[0x1E4F42608] estimatedDimension:44.0];
  double v9 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v7 heightDimension:v8];
  double v10 = (void *)MEMORY[0x1E4F42618];
  v15[0] = v6;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  double v12 = [v10 verticalGroupWithLayoutSize:v9 subitems:v11];

  char v13 = [MEMORY[0x1E4F42630] sectionWithGroup:v12];

  return v13;
}

- (id)pinningOnboardingTitleLayoutSectionForEnvironment:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F42608], "fractionalWidthDimension:", a3, 1.0);
  id v4 = [MEMORY[0x1E4F42608] estimatedDimension:138.0];
  char v5 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v3 heightDimension:v4];
  BOOL v6 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v5];
  double v7 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  char v8 = [MEMORY[0x1E4F42608] estimatedDimension:138.0];
  double v9 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v7 heightDimension:v8];
  double v10 = (void *)MEMORY[0x1E4F42618];
  v15[0] = v6;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  double v12 = [v10 verticalGroupWithLayoutSize:v9 subitems:v11];

  char v13 = [MEMORY[0x1E4F42630] sectionWithGroup:v12];

  return v13;
}

- (id)tipKitLayoutSectionForEnvironment:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F42608], "fractionalWidthDimension:", a3, 1.0);
  id v4 = [MEMORY[0x1E4F42608] estimatedDimension:10.0];
  char v5 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v3 heightDimension:v4];
  BOOL v6 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v5];
  double v7 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  char v8 = [MEMORY[0x1E4F42608] estimatedDimension:10.0];
  double v9 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v7 heightDimension:v8];
  double v10 = (void *)MEMORY[0x1E4F42618];
  v24[0] = v6;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  double v12 = [v10 verticalGroupWithLayoutSize:v9 subitems:v11];

  char v13 = [MEMORY[0x1E4F42630] sectionWithGroup:v12];
  [v13 contentInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = +[CKUIBehavior sharedBehaviors];
  [v20 conversationListBottomTipSectionPadding];
  double v22 = v21;

  objc_msgSend(v13, "setContentInsets:", v15, v17, v22, v19);

  return v13;
}

- (id)_emptyLayoutSection
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F42608] absoluteDimension:0.0];
  v3 = [MEMORY[0x1E4F42608] absoluteDimension:0.0];
  id v4 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v2 heightDimension:v3];
  char v5 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v4];
  BOOL v6 = [MEMORY[0x1E4F42608] absoluteDimension:0.0];
  double v7 = [MEMORY[0x1E4F42608] absoluteDimension:0.0];
  char v8 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v6 heightDimension:v7];
  double v9 = (void *)MEMORY[0x1E4F42618];
  v14[0] = v5;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  double v11 = [v9 horizontalGroupWithLayoutSize:v8 subitems:v10];

  double v12 = [MEMORY[0x1E4F42630] sectionWithGroup:v11];

  return v12;
}

- (void)setConversationListController:(id)a3
{
}

- (CKConversationListCollectionViewLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKConversationListCollectionViewLayout;
  return [(CKConversationListCollectionViewLayout *)&v3 init];
}

- (id)conversationListLayout
{
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4F42870]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CKConversationListCollectionViewLayout_conversationListLayout__block_invoke;
  v5[3] = &unk_1E5621E10;
  objc_copyWeak(&v6, &location);
  objc_super v3 = (void *)[v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (id)pinGridLayoutGroupForCollectionViewSize:(CGSize)a3 numberOfItems:(int64_t)a4
{
  double width = a3.width;
  v61[1] = *MEMORY[0x1E4F143B8];
  int64_t v7 = -[CKConversationListCollectionViewLayout _pinnedConversationViewLayoutStyleForCollectionViewSize:](self, "_pinnedConversationViewLayoutStyleForCollectionViewSize:", a3.width, a3.height);
  char v8 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  uint64_t v9 = [v8 pinnedConversationViewLayoutStyle];

  if (v9 != v7)
  {
    double v10 = [(CKConversationListCollectionViewLayout *)self conversationListController];
    [v10 _setPinnedConversationViewLayoutStyle:v7 shouldInvalidateLayout:0];
  }
  uint64_t v11 = [(CKConversationListCollectionViewLayout *)self numberOfPinnedConversationColumnsForLayoutStyle:v7];
  [(CKConversationListCollectionViewLayout *)self _edgeToAvatarWidthForPinnedConversationLayoutStyle:v7];
  double v13 = v12;
  double v14 = (width + v12 * -2.0 + (double)(v11 - 1) * -0.0) / (double)v11;
  if (CKMainScreenScale_once_9 != -1) {
    dispatch_once(&CKMainScreenScale_once_9, &__block_literal_global_19);
  }
  double v15 = *(double *)&CKMainScreenScale_sMainScreenScale_9;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_9 == 0.0) {
    double v15 = 1.0;
  }
  double v16 = floor(v14 * v15) / v15;
  +[CKPinnedConversationView avatarViewSizeFittingSize:layoutStyle:](CKPinnedConversationView, "avatarViewSizeFittingSize:layoutStyle:", v7, v16, v16);
  double v18 = v17;
  [(CKConversationListCollectionViewLayout *)self _minimumEdgeToCellSpacingForLayoutStyle:v7];
  double v19 = (width - (double)v11 * v18 + v13 * -2.0) / (double)(v11 - 1);
  v20 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  double v21 = [v20 view];
  UIFloorToViewScale();
  double v23 = v22;

  double v24 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  double v25 = [v24 view];
  UIFloorToViewScale();
  double v27 = v26;

  if (v23 >= v27) {
    double v28 = v27;
  }
  else {
    double v28 = v23;
  }
  double v29 = v18 + v28 * 2.0;
  if (v29 <= 0.0)
  {
    double v56 = v29;
    _IMWarn();
    double v29 = 0.0;
  }
  double v30 = v19 + v28 * -2.0;
  double v31 = 0.0;
  if (a4 < 1) {
    goto LABEL_14;
  }
  double v32 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  double v33 = [v32 view];
  UICeilToViewScale();
  double v31 = v34;

  if (v31 <= 0.0)
  {
LABEL_14:
    double v57 = v31;
    _IMWarn();
    double v31 = 0.0;
  }
  double v35 = v13 - v28;
  -[CKConversationListCollectionViewLayout pinnedConversationCellHeightForLayoutStyle:cellWidth:](self, "pinnedConversationCellHeightForLayoutStyle:cellWidth:", v7, v29, *(void *)&v57);
  double v37 = v36;
  v60 = [MEMORY[0x1E4F42608] absoluteDimension:v29];
  v59 = [MEMORY[0x1E4F42608] absoluteDimension:v37];
  v58 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v60 heightDimension:v59];
  v38 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v58];
  v39 = [MEMORY[0x1E4F42608] absoluteDimension:v31];
  v40 = [MEMORY[0x1E4F42608] absoluteDimension:v37];
  v41 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v39 heightDimension:v40];
  v42 = (void *)MEMORY[0x1E4F42618];
  v61[0] = v38;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
  v44 = [v42 horizontalGroupWithLayoutSize:v41 subitems:v43];

  v45 = [MEMORY[0x1E4F42640] fixedSpacing:v30];
  [v44 setInterItemSpacing:v45];

  v46 = [MEMORY[0x1E4F42640] flexibleSpacing:v35];
  v47 = [MEMORY[0x1E4F42640] flexibleSpacing:v35];
  [(CKConversationListCollectionViewLayout *)self _totalVerticalRowSpacingForLayoutStyle:v7];
  double v49 = v48;
  +[CKPinnedConversationView avatarViewPadding];
  double v51 = v49 - v50;
  +[CKPinnedConversationView titleLabelVerticalPadding];
  v53 = [MEMORY[0x1E4F42640] fixedSpacing:(v51 - v52) * 0.5];
  v54 = [MEMORY[0x1E4F42610] spacingForLeading:v46 top:v53 trailing:v47 bottom:v53];
  [v44 setEdgeSpacing:v54];

  return v44;
}

- (double)widthForPinnedConversationCellInCollectionViewOfSize:(CGSize)a3 numberOfItems:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if (CKIsRunningInMacCatalyst()
    && (+[CKUIBehavior sharedBehaviors],
        char v8 = objc_claimAutoreleasedReturnValue(),
        [v8 snapToMinConversationListWidth],
        double v10 = v9,
        v8,
        width < v10))
  {
    uint64_t v11 = +[CKUIBehavior sharedBehaviors];
    [v11 conversationListCellRightMargin];
    double v13 = v12;
    double v14 = +[CKUIBehavior sharedBehaviors];
    [v14 conversationListContactImageTrailingSpace];
    double v16 = v13 + v15;

    return width + v16 * -2.0;
  }
  else
  {
    double v18 = -[CKConversationListCollectionViewLayout pinGridLayoutGroupForCollectionViewSize:numberOfItems:](self, "pinGridLayoutGroupForCollectionViewSize:numberOfItems:", a4, width, height);
    double v19 = [v18 subitems];
    v20 = [v19 firstObject];

    double v21 = [v20 layoutSize];
    double v22 = [v21 widthDimension];
    [v22 dimension];
    double v24 = v23;

    return v24;
  }
}

- (int64_t)numberOfPinnedConversationColumnsForLayoutStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  if (a3 == 4)
  {
    objc_super v3 = +[CKUIBehavior sharedBehaviors];
    uint64_t v4 = [v3 maximumNumberOfPinnedConversations];
  }
  else
  {
    objc_super v3 = +[CKUIBehavior sharedBehaviors];
    uint64_t v4 = [v3 conversationListLayoutPinnedSectionNumberOfColumns];
  }
  int64_t v5 = v4;

  return v5;
}

- (double)_minimumEdgeToCellSpacingForLayoutStyle:(int64_t)a3
{
  double result = 3.0;
  if (a3 == 5) {
    return 10.0;
  }
  return result;
}

- (double)_totalVerticalRowSpacingForLayoutStyle:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 6) {
    return dbl_18F81ACA0[a3];
  }
  return result;
}

id __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 conversationListController];
  int64_t v5 = [v4 leadingSwipeActionsConfigurationForIndexPath:v3];

  return v5;
}

id __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 conversationListController];
  int64_t v5 = [v4 trailingSwipeActionsConfigurationForIndexPath:v3];

  return v5;
}

void __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) conversationListController];
  [v1 setIsShowingSwipeDeleteConfirmation:1];
}

void __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) conversationListController];
  [v1 setIsShowingSwipeDeleteConfirmation:0];
}

- (double)pinnedConversationCellHeightForLayoutStyle:(int64_t)a3 cellWidth:(double)a4
{
  int64_t v7 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  char v8 = [v7 prototypePinnedConversationCollectionViewCell];

  if (!v8)
  {
    double v9 = [CKPinnedConversationCollectionViewCell alloc];
    char v8 = -[CKPinnedConversationCollectionViewCell initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v10 = [(CKPinnedConversationCollectionViewCell *)v8 pinnedConversationView];
    [v10 configureAsPrototypeCell];

    uint64_t v11 = [(CKConversationListCollectionViewLayout *)self conversationListController];
    [v11 setPrototypePinnedConversationCollectionViewCell:v8];
  }
  double v12 = [(CKPinnedConversationCollectionViewCell *)v8 pinnedConversationView];
  [v12 setLayoutStyle:a3];

  -[CKPinnedConversationCollectionViewCell sizeThatFits:](v8, "sizeThatFits:", a4, 1.79769313e308);
  double v14 = v13;

  return v14;
}

- (int64_t)_numberOfItemsInSection:(unint64_t)a3
{
  uint64_t v4 = [(CKConversationListCollectionViewLayout *)self conversationListController];
  int64_t v5 = [v4 collectionView];
  int64_t v6 = [v5 numberOfItemsInSection:a3];

  return v6;
}

- (double)_edgeToAvatarWidthForPinnedConversationLayoutStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0.0;
  }
  if (((1 << a3) & 0x3C) != 0) {
    return 20.0;
  }
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  int v5 = [v4 conversationListCellUsesLargeTextLayout];

  int64_t v6 = +[CKUIBehavior sharedBehaviors];
  int64_t v7 = v6;
  if (v5) {
    [v6 conversationListCellLargeTextLeftMargin];
  }
  else {
    [v6 conversationListCellLeftMargin];
  }
  double v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
}

@end