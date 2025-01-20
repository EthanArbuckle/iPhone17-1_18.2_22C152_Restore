@interface CKMentionSuggestionView
- (BOOL)hasCompletedInitialLayoutPass;
- (CGSize)intrinsicContentSize;
- (CKMentionSuggestionView)init;
- (CKMentionSuggestionView)initWithFrame:(CGRect)a3;
- (CKMentionSuggestionViewDataSource)dataSource;
- (CKMentionSuggestionViewDelegate)delegate;
- (UICollectionView)collectionView;
- (UICollectionViewCompositionalLayout)suggestionViewLayout;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (id)suggestionsLayout;
- (id)suggestionsLayoutSectionForEnvironment:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)reloadData;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setHasCompletedInitialLayoutPass:(BOOL)a3;
- (void)setSuggestionViewLayout:(id)a3;
@end

@implementation CKMentionSuggestionView

- (id)suggestionsLayoutSectionForEnvironment:(id)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = 1.0;
  if (!CKIsRunningInMacCatalyst())
  {
    v6 = [v4 traitCollection];
    [v6 displayScale];
    double v5 = 1.0 / v7;
  }
  uint64_t v8 = [MEMORY[0x1E4F42608] absoluteDimension:v5];
  v45 = [MEMORY[0x1E4F42608] fractionalHeightDimension:1.0];
  v46 = (void *)v8;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F42638], "sizeWithWidthDimension:heightDimension:", v8);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F425F0], "layoutAnchorWithEdges:absoluteOffset:", 8, 0.0, 0.0);
  v11 = (void *)MEMORY[0x1E4F42648];
  v12 = +[CKMentionSuggestionAccessoryCell supplementryViewKind];
  v43 = (void *)v10;
  v44 = (void *)v9;
  uint64_t v13 = [v11 supplementaryItemWithLayoutSize:v9 elementKind:v12 containerAnchor:v10];

  v14 = [v4 container];
  [v14 contentSize];
  double v16 = v15;

  v47 = v4;
  if ([(CKMentionSuggestionView *)self hasCompletedInitialLayoutPass])
  {
    v17 = [(CKMentionSuggestionView *)self dataSource];
    uint64_t v18 = [v17 numberOfSuggestionsInSuggestionView:self forSection:0];

    if (v18)
    {
      uint64_t v19 = 0;
      double v20 = 86.0;
      do
      {
        v21 = [MEMORY[0x1E4F28D58] indexPathForItem:v19 inSection:0];
        v22 = [(CKMentionSuggestionView *)self collectionView];
        v23 = [v22 cellForItemAtIndexPath:v21];

        if (v23)
        {
          [v23 frame];
          if (v24 >= v20) {
            double v20 = v24;
          }
          [v23 frame];
          if (v25 >= v16) {
            double v16 = v25;
          }
        }

        ++v19;
      }
      while (v18 != v19);
    }
    else
    {
      double v20 = 86.0;
    }
    uint64_t v26 = [MEMORY[0x1E4F42608] absoluteDimension:v20];
    uint64_t v27 = [MEMORY[0x1E4F42608] absoluteDimension:v16];
  }
  else
  {
    double v20 = 86.0;
    uint64_t v26 = [MEMORY[0x1E4F42608] estimatedDimension:86.0];
    uint64_t v27 = [MEMORY[0x1E4F42608] estimatedDimension:v16];
  }
  v28 = (void *)v27;
  v29 = objc_msgSend(MEMORY[0x1E4F42638], "sizeWithWidthDimension:heightDimension:", v26, v27, v26);
  v30 = (void *)MEMORY[0x1E4F42628];
  v42 = (void *)v13;
  v49[0] = v13;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  v32 = [v30 itemWithLayoutSize:v29 supplementaryItems:v31];

  v33 = [MEMORY[0x1E4F42608] estimatedDimension:v20];
  v34 = [MEMORY[0x1E4F42608] estimatedDimension:v16];
  v35 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v33 heightDimension:v34];
  v36 = (void *)MEMORY[0x1E4F42618];
  v48 = v32;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v38 = [v36 horizontalGroupWithLayoutSize:v35 subitems:v37];

  v39 = [MEMORY[0x1E4F42630] sectionWithGroup:v38];
  [(CKMentionSuggestionView *)self setHasCompletedInitialLayoutPass:1];

  return v39;
}

- (id)suggestionsLayout
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42878]);
  [v3 setScrollDirection:1];
  id location = 0;
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F42870]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CKMentionSuggestionView_suggestionsLayout__block_invoke;
  v7[3] = &unk_1E5621E10;
  objc_copyWeak(&v8, &location);
  double v5 = (void *)[v4 initWithSectionProvider:v7 configuration:v3];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

id __44__CKMentionSuggestionView_suggestionsLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v3 = 0;
  }
  else
  {
    id v4 = (id *)(a1 + 32);
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained(v4);
    id v3 = [WeakRetained suggestionsLayoutSectionForEnvironment:v5];
  }

  return v3;
}

- (CKMentionSuggestionView)initWithFrame:(CGRect)a3
{
  v40[4] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)CKMentionSuggestionView;
  id v3 = -[CKMentionSuggestionView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(CKMentionSuggestionView *)v3 suggestionsLayout];
    suggestionViewLayout = v4->_suggestionViewLayout;
    v4->_suggestionViewLayout = (UICollectionViewCompositionalLayout *)v5;

    double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42858]), "initWithFrame:collectionViewLayout:", v4->_suggestionViewLayout, 0.0, 0.0, 64.0, 64.0);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = +[CKMentionSuggestionCell reuseIdentifier];
    [v7 registerClass:v8 forCellWithReuseIdentifier:v9];

    uint64_t v10 = objc_opt_class();
    v11 = +[CKMentionSuggestionAccessoryCell supplementryViewKind];
    v12 = +[CKMentionSuggestionAccessoryCell reuseIdentifier];
    [v7 registerClass:v10 forSupplementaryViewOfKind:v11 withReuseIdentifier:v12];

    [v7 setClipsToBounds:1];
    [v7 setOpaque:0];
    uint64_t v13 = [MEMORY[0x1E4F428B8] clearColor];
    [v7 setBackgroundColor:v13];

    [v7 setAllowsSelection:1];
    [v7 setShowsVerticalScrollIndicator:0];
    [v7 setShowsHorizontalScrollIndicator:0];
    [v7 setAccessibilityIdentifier:@"suggestionSelectionIdentifier"];
    [v7 setDelegate:v4];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = +[CKUIBehavior sharedBehaviors];
    [v14 paddleOverlayRadius];
    objc_msgSend(v7, "_setContinuousCornerRadius:");

    objc_storeStrong((id *)&v4->_collectionView, v7);
    [(CKMentionSuggestionView *)v4 addSubview:v7];
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [v7 topAnchor];
    v32 = [(CKMentionSuggestionView *)v4 topAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v40[0] = v31;
    v30 = [v7 bottomAnchor];
    v29 = [(CKMentionSuggestionView *)v4 bottomAnchor];
    double v15 = [v30 constraintEqualToAnchor:v29];
    v40[1] = v15;
    double v16 = [v7 leadingAnchor];
    v17 = [(CKMentionSuggestionView *)v4 leadingAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17];
    v40[2] = v18;
    uint64_t v19 = [v7 trailingAnchor];
    double v20 = [(CKMentionSuggestionView *)v4 trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v40[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
    [v28 activateConstraints:v22];

    id location = 0;
    objc_initWeak(&location, v4);
    id v23 = objc_alloc(MEMORY[0x1E4F42880]);
    double v24 = [(CKMentionSuggestionView *)v4 collectionView];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __41__CKMentionSuggestionView_initWithFrame___block_invoke;
    v36[3] = &unk_1E5625CD0;
    objc_copyWeak(&v37, &location);
    double v25 = (void *)[v23 initWithCollectionView:v24 cellProvider:v36];
    [(CKMentionSuggestionView *)v4 setDiffableDataSource:v25];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __41__CKMentionSuggestionView_initWithFrame___block_invoke_2;
    v34[3] = &unk_1E5625CF8;
    objc_copyWeak(&v35, &location);
    uint64_t v26 = [(CKMentionSuggestionView *)v4 diffableDataSource];
    [v26 setSupplementaryViewProvider:v34];

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __41__CKMentionSuggestionView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = [WeakRetained dataSource];
  id v9 = objc_loadWeakRetained(v4);
  uint64_t v10 = objc_msgSend(v8, "suggestionView:entityAtIndex:", v9, objc_msgSend(v5, "item"));

  v11 = +[CKMentionSuggestionCell reuseIdentifier];
  v12 = [v6 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v5];

  [v12 setSuggestedEntity:v10];

  return v12;
}

id __41__CKMentionSuggestionView_initWithFrame___block_invoke_2(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  uint64_t v8 = +[CKMentionSuggestionAccessoryCell supplementryViewKind];
  id v9 = +[CKMentionSuggestionAccessoryCell reuseIdentifier];
  uint64_t v10 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v9 forIndexPath:v6];

  unint64_t v11 = [v6 item];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v13 = [WeakRetained dataSource];
  id v14 = objc_loadWeakRetained(a1);
  objc_msgSend(v10, "setHidden:", v11 >= objc_msgSend(v13, "numberOfSuggestionsInSuggestionView:forSection:", v14, 0) - 1);

  return v10;
}

- (CKMentionSuggestionView)init
{
  return -[CKMentionSuggestionView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)dealloc
{
  [(UICollectionView *)self->_collectionView setDelegate:0];
  [(UICollectionView *)self->_collectionView setDataSource:0];
  collectionView = self->_collectionView;
  self->_collectionView = 0;

  suggestionViewLayout = self->_suggestionViewLayout;
  self->_suggestionViewLayout = 0;

  v5.receiver = self;
  v5.super_class = (Class)CKMentionSuggestionView;
  [(CKMentionSuggestionView *)&v5 dealloc];
}

- (CGSize)intrinsicContentSize
{
  id v3 = [(CKMentionSuggestionView *)self suggestionViewLayout];
  [v3 invalidateLayout];

  [(CKMentionSuggestionView *)self layoutIfNeeded];
  id v4 = [(CKMentionSuggestionView *)self suggestionViewLayout];
  [v4 collectionViewContentSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);

  [(CKMentionSuggestionView *)self reloadData];
}

- (void)reloadData
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42650]);
  v18[0] = @"MainSection";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v6 = [(CKMentionSuggestionView *)self dataSource];
  double v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "numberOfSuggestionsInSuggestionView:forSection:", self, 0));

  double v8 = [(CKMentionSuggestionView *)self dataSource];
  uint64_t v9 = [v8 numberOfSuggestionsInSuggestionView:self forSection:0];

  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      unint64_t v11 = [(CKMentionSuggestionView *)self dataSource];
      v12 = [v11 suggestionView:self entityAtIndex:v10];

      uint64_t v13 = [v12 defaultIMHandle];
      id v14 = [v13 ID];

      if ([v14 length]) {
        [v7 addObject:v14];
      }

      ++v10;
      double v15 = [(CKMentionSuggestionView *)self dataSource];
      unint64_t v16 = [v15 numberOfSuggestionsInSuggestionView:self forSection:0];
    }
    while (v10 < v16);
  }
  [v3 appendItemsWithIdentifiers:v7];
  v17 = [(CKMentionSuggestionView *)self diffableDataSource];
  [v17 applySnapshot:v3 animatingDifferences:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(CKMentionSuggestionView *)self dataSource];
  uint64_t v7 = [v5 item];

  id v9 = [v6 suggestionView:self entityAtIndex:v7];

  double v8 = [(CKMentionSuggestionView *)self delegate];
  [v8 suggestionView:self didSelectEntity:v9];
}

- (CKMentionSuggestionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMentionSuggestionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKMentionSuggestionViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CKMentionSuggestionViewDataSource *)WeakRetained;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (UICollectionViewCompositionalLayout)suggestionViewLayout
{
  return self->_suggestionViewLayout;
}

- (void)setSuggestionViewLayout:(id)a3
{
}

- (BOOL)hasCompletedInitialLayoutPass
{
  return self->_hasCompletedInitialLayoutPass;
}

- (void)setHasCompletedInitialLayoutPass:(BOOL)a3
{
  self->_hasCompletedInitialLayoutPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionViewLayout, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_destroyWeak((id *)&self->_delegate);
}

@end