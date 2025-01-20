@interface LUILogFilterViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (LUILogFilterView)filterView;
- (LUILogFilterViewControllerDelegate)delegate;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)predicateComparisonCandidates;
- (id)predicateKeyCandidates;
- (id)predicateValueCandidates;
- (id)predicateValueCandidatesSize;
- (id)sizeArrayWithStrings:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_clearCellsSelection;
- (void)_clearPredicateInput;
- (void)_setupButtons;
- (void)_setupCollectionView;
- (void)_setupTableView;
- (void)_shakeInputView:(id)a3;
- (void)_updatePredicateText;
- (void)addButtonTapped:(id)a3;
- (void)applyButtonTapped:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)predicateDataUpdated;
- (void)predicateTableViewCellDeleteButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation LUILogFilterViewController

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(LUILogFilterViewController *)self setFilterView:v3];
  [(LUILogFilterViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)LUILogFilterViewController;
  [(LUILogFilterViewController *)&v5 viewDidLoad];
  [(LUILogFilterViewController *)self _setupTableView];
  [(LUILogFilterViewController *)self _setupCollectionView];
  [(LUILogFilterViewController *)self _setupButtons];
  id v3 = [(LUILogFilterViewController *)self filterView];
  v4 = [v3 predicateTextField];
  [v4 setDelegate:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LUILogFilterViewController;
  [(LUILogFilterViewController *)&v10 viewDidAppear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x263F1D488] object:0];

  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x263F1D480] object:0];

  v6 = [(LUILogFilterViewController *)self delegate];
  uint64_t v7 = [v6 logFilterViewControllerShouldAllowTextEditing:self];
  v8 = [(LUILogFilterViewController *)self filterView];
  v9 = [v8 predicateTextField];
  [v9 setEnabled:v7];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LUILogFilterViewController;
  [(LUILogFilterViewController *)&v5 viewDidDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)LUILogFilterViewController;
  [(LUILogFilterViewController *)&v9 viewWillLayoutSubviews];
  id v3 = [(LUILogFilterViewController *)self filterView];
  v4 = [v3 predicatesKeyCandidateCollectionView];
  objc_super v5 = [v4 collectionViewLayout];
  [v5 invalidateLayout];

  v6 = [(LUILogFilterViewController *)self filterView];
  uint64_t v7 = [v6 predicatesComparisonCandidateCollectionView];
  v8 = [v7 collectionViewLayout];
  [v8 invalidateLayout];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)LUILogFilterViewController;
  [(LUILogFilterViewController *)&v9 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  objc_super v5 = [(LUILogFilterViewController *)self delegate];
  uint64_t v6 = [v5 logFilterViewControllerShouldAllowTextEditing:self];
  uint64_t v7 = [(LUILogFilterViewController *)self filterView];
  v8 = [v7 predicateTextField];
  [v8 setUserInteractionEnabled:v6];
}

- (void)_setupTableView
{
  id v3 = [(LUILogFilterViewController *)self filterView];
  v4 = [v3 existingPredicatesTableView];
  [v4 setDelegate:self];

  objc_super v5 = [(LUILogFilterViewController *)self filterView];
  uint64_t v6 = [v5 existingPredicatesTableView];
  [v6 setDataSource:self];

  id v8 = [(LUILogFilterViewController *)self filterView];
  uint64_t v7 = [v8 existingPredicatesTableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"currentPredicateCell"];
}

- (void)_setupCollectionView
{
  id v3 = [(LUILogFilterViewController *)self filterView];
  v4 = [v3 predicatesKeyCandidateCollectionView];
  [v4 setDelegate:self];

  objc_super v5 = [(LUILogFilterViewController *)self filterView];
  uint64_t v6 = [v5 predicatesKeyCandidateCollectionView];
  [v6 setDataSource:self];

  uint64_t v7 = [(LUILogFilterViewController *)self filterView];
  id v8 = [v7 predicatesComparisonCandidateCollectionView];
  [v8 setDelegate:self];

  objc_super v9 = [(LUILogFilterViewController *)self filterView];
  objc_super v10 = [v9 predicatesComparisonCandidateCollectionView];
  [v10 setDataSource:self];

  v11 = [(LUILogFilterViewController *)self filterView];
  v12 = [v11 predicatesValueCandidateCollectionView];
  [v12 setDelegate:self];

  v13 = [(LUILogFilterViewController *)self filterView];
  v14 = [v13 predicatesValueCandidateCollectionView];
  [v14 setDataSource:self];

  v15 = [(LUILogFilterViewController *)self filterView];
  v16 = [v15 predicatesKeyCandidateCollectionView];
  [v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"candidateCell"];

  v17 = [(LUILogFilterViewController *)self filterView];
  v18 = [v17 predicatesComparisonCandidateCollectionView];
  [v18 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"candidateCell"];

  v19 = [(LUILogFilterViewController *)self filterView];
  v20 = [v19 predicatesValueCandidateCollectionView];
  [v20 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"candidateCell"];

  id v22 = [(LUILogFilterViewController *)self filterView];
  v21 = [v22 predicatesValueCandidateCollectionView];
  [v21 setAllowsMultipleSelection:1];
}

- (void)_setupButtons
{
  id v3 = [(LUILogFilterViewController *)self filterView];
  v4 = [v3 addButton];
  [v4 addTarget:self action:sel_addButtonTapped_ forControlEvents:64];

  id v6 = [(LUILogFilterViewController *)self filterView];
  objc_super v5 = [v6 applyButton];
  [v5 addTarget:self action:sel_applyButtonTapped_ forControlEvents:64];
}

- (void)predicateDataUpdated
{
  id v3 = [(LUILogFilterViewController *)self filterView];
  v2 = [v3 existingPredicatesTableView];
  [v2 reloadData];
}

- (id)predicateKeyCandidates
{
  if (predicateKeyCandidates_onceToken != -1) {
    dispatch_once(&predicateKeyCandidates_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)predicateKeyCandidates_candidates;

  return v2;
}

void __52__LUILogFilterViewController_predicateKeyCandidates__block_invoke()
{
  v0 = (void *)predicateKeyCandidates_candidates;
  predicateKeyCandidates_candidates = (uint64_t)&unk_26F3E8458;
}

- (id)predicateComparisonCandidates
{
  if (predicateComparisonCandidates_onceToken != -1) {
    dispatch_once(&predicateComparisonCandidates_onceToken, &__block_literal_global_148);
  }
  v2 = (void *)predicateComparisonCandidates_candidates;

  return v2;
}

void __59__LUILogFilterViewController_predicateComparisonCandidates__block_invoke()
{
  v0 = (void *)predicateComparisonCandidates_candidates;
  predicateComparisonCandidates_candidates = (uint64_t)&unk_26F3E8470;
}

- (id)predicateValueCandidates
{
  if (predicateValueCandidates_onceToken != -1) {
    dispatch_once(&predicateValueCandidates_onceToken, &__block_literal_global_159);
  }
  v2 = (void *)predicateValueCandidates_candidates;

  return v2;
}

void __54__LUILogFilterViewController_predicateValueCandidates__block_invoke()
{
  v0 = (void *)predicateValueCandidates_candidates;
  predicateValueCandidates_candidates = (uint64_t)&unk_26F3E8488;
}

- (id)predicateValueCandidatesSize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__LUILogFilterViewController_predicateValueCandidatesSize__block_invoke;
  block[3] = &unk_265097790;
  block[4] = self;
  if (predicateValueCandidatesSize_onceToken != -1) {
    dispatch_once(&predicateValueCandidatesSize_onceToken, block);
  }
  return (id)predicateValueCandidatesSize_candidatesSize;
}

void __58__LUILogFilterViewController_predicateValueCandidatesSize__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 predicateValueCandidates];
  uint64_t v2 = [v1 sizeArrayWithStrings:v4];
  id v3 = (void *)predicateValueCandidatesSize_candidatesSize;
  predicateValueCandidatesSize_candidatesSize = v2;
}

- (id)sizeArrayWithStrings:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    uint64_t v8 = *MEMORY[0x263F1C238];
    double v9 = *MEMORY[0x263F1D330];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v31 = v8;
        v12 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:v9];
        v32 = v12;
        v13 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 1, v13, 0, 1000.0, 30.0);
        uint64_t v15 = v14;
        uint64_t v17 = v16;
        double v19 = v18;
        uint64_t v21 = v20;

        v26[0] = v15;
        v26[1] = v17;
        *(double *)&v26[2] = v19 + 22.0;
        v26[3] = v21;
        id v22 = [MEMORY[0x263F08D40] valueWithBytes:v26 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        [v4 addObject:v22];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }

  v23 = (void *)[v4 copy];

  return v23;
}

- (void)_updatePredicateText
{
  id v3 = objc_opt_new();
  id v4 = [(LUILogFilterViewController *)self filterView];
  uint64_t v5 = [v4 predicatesKeyCandidateCollectionView];
  uint64_t v6 = [v5 indexPathsForSelectedItems];

  uint64_t v7 = [(LUILogFilterViewController *)self filterView];
  uint64_t v8 = [v7 predicatesComparisonCandidateCollectionView];
  double v9 = [v8 indexPathsForSelectedItems];

  objc_super v10 = [(LUILogFilterViewController *)self filterView];
  v11 = [v10 predicatesValueCandidateCollectionView];
  v12 = [v11 indexPathsForSelectedItems];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __50__LUILogFilterViewController__updatePredicateText__block_invoke;
  v28[3] = &unk_265097A58;
  id v13 = v6;
  id v29 = v13;
  long long v30 = self;
  id v14 = v3;
  id v31 = v14;
  id v15 = v9;
  id v32 = v15;
  uint64_t v16 = (void (**)(void, void))MEMORY[0x2455DBD80](v28);
  uint64_t v17 = [v12 firstObject];

  if (v17)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __50__LUILogFilterViewController__updatePredicateText__block_invoke_2;
    v23 = &unk_265097A80;
    long long v27 = v16;
    id v24 = v14;
    v25 = self;
    id v26 = v12;
    [v26 enumerateObjectsUsingBlock:&v20];
  }
  else
  {
    ((void (**)(void, id))v16)[2](v16, v14);
  }
  double v18 = [(LUILogFilterViewController *)self filterView];
  double v19 = [v18 predicateTextField];
  [v19 setText:v14];
}

void __50__LUILogFilterViewController__updatePredicateText__block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] firstObject];

  if (v2)
  {
    id v3 = [a1[5] predicateKeyCandidates];
    id v4 = [a1[4] firstObject];
    uint64_t v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

    id v6 = a1[6];
    uint64_t v7 = [NSString stringWithFormat:@"%@ ", v5];
    [v6 appendString:v7];
  }
  uint64_t v8 = [a1[7] firstObject];

  if (v8)
  {
    double v9 = [a1[5] predicateComparisonCandidates];
    objc_super v10 = [a1[7] firstObject];
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    [a1[6] appendString:v11];
  }
}

void __50__LUILogFilterViewController__updatePredicateText__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v8 = a2;
  v7(v5, v6);
  double v9 = [*(id *)(a1 + 40) predicateValueCandidates];
  uint64_t v10 = [v8 row];

  id v15 = [v9 objectAtIndexedSubscript:v10];

  id v11 = *(void **)(a1 + 32);
  v12 = NSString;
  if ([*(id *)(a1 + 48) count] - 1 == a3) {
    id v13 = &stru_26F3E40B0;
  }
  else {
    id v13 = @" OR ";
  }
  id v14 = [v12 stringWithFormat:@" '%@'%@", v15, v13];
  [v11 appendString:v14];
}

- (void)_clearCellsSelection
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = [(LUILogFilterViewController *)self filterView];
  id v4 = [v3 predicatesKeyCandidateCollectionView];
  v29[0] = v4;
  uint64_t v5 = [(LUILogFilterViewController *)self filterView];
  uint64_t v6 = [v5 predicatesComparisonCandidateCollectionView];
  v29[1] = v6;
  uint64_t v7 = [(LUILogFilterViewController *)self filterView];
  id v8 = [v7 predicatesValueCandidateCollectionView];
  v29[2] = v8;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v15 = objc_msgSend(v14, "indexPathsForSelectedItems", 0);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v21;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v21 != v18) {
                objc_enumerationMutation(v15);
              }
              [v14 deselectItemAtIndexPath:*(void *)(*((void *)&v20 + 1) + 8 * v19++) animated:0];
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v17);
        }

        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v11);
  }
}

- (void)_clearPredicateInput
{
  id v3 = [(LUILogFilterViewController *)self filterView];
  id v4 = [v3 predicateTextField];
  [v4 setText:0];

  [(LUILogFilterViewController *)self _clearCellsSelection];
}

- (void)_shakeInputView:(id)a3
{
  id v3 = (void *)MEMORY[0x263F15760];
  id v4 = a3;
  id v15 = [v3 animationWithKeyPath:@"position"];
  [v15 setDuration:0.05];
  LODWORD(v5) = 2.0;
  [v15 setRepeatCount:v5];
  [v15 setAutoreverses:1];
  uint64_t v6 = (void *)MEMORY[0x263F08D40];
  [v4 center];
  double v8 = v7 + -15.0;
  [v4 center];
  double v9 = [v6 valueWithCGPoint:v8];
  [v15 setFromValue:v9];

  uint64_t v10 = (void *)MEMORY[0x263F08D40];
  [v4 center];
  double v12 = v11 + 15.0;
  [v4 center];
  uint64_t v13 = [v10 valueWithCGPoint:v12];
  [v15 setToValue:v13];

  id v14 = [v4 layer];

  [v14 addAnimation:v15 forKey:@"position"];
}

- (void)addButtonTapped:(id)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v4 = [(LUILogFilterViewController *)self filterView];
  double v5 = [v4 predicateTextField];
  v39 = [v5 text];

  LODWORD(v5) = [v39 length] == 0;
  uint64_t v6 = [(LUILogFilterViewController *)self filterView];
  double v7 = v6;
  if (v5)
  {
    uint64_t v16 = [v6 predicateTextField];
    [(LUILogFilterViewController *)self _shakeInputView:v16];
  }
  else
  {
    double v8 = [v6 predicatesValueCandidateCollectionView];
    double v9 = [v8 indexPathsForSelectedItems];
    if ([v9 count])
    {
      uint64_t v10 = [(LUILogFilterViewController *)self filterView];
      double v11 = [v10 predicatesKeyCandidateCollectionView];
      double v12 = [v11 indexPathsForSelectedItems];
      if ([v12 count])
      {
        uint64_t v13 = [(LUILogFilterViewController *)self filterView];
        id v14 = [v13 predicatesComparisonCandidateCollectionView];
        id v15 = [v14 indexPathsForSelectedItems];
        BOOL v37 = [v15 count] != 0;
      }
      else
      {
        BOOL v37 = 0;
      }
    }
    else
    {
      BOOL v37 = 0;
    }

    uint64_t v17 = [(LUILogFilterViewController *)self filterView];
    uint64_t v18 = [v17 predicatesValueCandidateCollectionView];
    uint64_t v19 = [v18 indexPathsForSelectedItems];
    if ([v19 count])
    {
      BOOL v20 = 0;
    }
    else
    {
      long long v21 = [(LUILogFilterViewController *)self filterView];
      long long v22 = [v21 predicatesKeyCandidateCollectionView];
      long long v23 = [v22 indexPathsForSelectedItems];
      if ([v23 count])
      {
        BOOL v20 = 0;
      }
      else
      {
        long long v24 = [(LUILogFilterViewController *)self filterView];
        long long v25 = [v24 predicatesComparisonCandidateCollectionView];
        long long v26 = [v25 indexPathsForSelectedItems];
        v36 = v24;
        BOOL v20 = [v26 count] == 0;
      }
    }

    if (v37 || v20)
    {
      long long v27 = (void *)MEMORY[0x263F08A98];
      long long v28 = [(LUILogFilterViewController *)self filterView];
      id v29 = [v28 predicateTextField];
      long long v30 = [v29 text];
      uint64_t v31 = [v27 predicateWithFormat:v30];

      id v32 = [(LUILogFilterViewController *)self delegate];
      v40[0] = v31;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
      [v32 logFilterViewController:self didAddPredicates:v33];

      [(LUILogFilterViewController *)self _clearPredicateInput];
    }
    else
    {
      uint64_t v34 = [(LUILogFilterViewController *)self filterView];
      v35 = [v34 predicateTextField];
      [(LUILogFilterViewController *)self _shakeInputView:v35];
    }
  }
}

- (void)applyButtonTapped:(id)a3
{
  id v4 = [(LUILogFilterViewController *)self delegate];
  [v4 logFilterViewControllerApplyButtonTapped:self];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"candidateCell" forIndexPath:v7];
  double v9 = [(LUILogFilterViewController *)self filterView];
  id v10 = [v9 predicatesKeyCandidateCollectionView];

  if (v10 == v6)
  {
    id v15 = [(LUILogFilterViewController *)self predicateKeyCandidates];
  }
  else
  {
    double v11 = [(LUILogFilterViewController *)self filterView];
    id v12 = [v11 predicatesComparisonCandidateCollectionView];

    if (v12 == v6)
    {
      id v15 = [(LUILogFilterViewController *)self predicateComparisonCandidates];
    }
    else
    {
      uint64_t v13 = [(LUILogFilterViewController *)self filterView];
      id v14 = [v13 predicatesValueCandidateCollectionView];

      if (v14 != v6) {
        goto LABEL_8;
      }
      id v15 = [(LUILogFilterViewController *)self predicateValueCandidates];
    }
  }
  uint64_t v16 = v15;
  uint64_t v17 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  uint64_t v18 = [v8 titleLabel];
  [v18 setText:v17];

LABEL_8:
  id v19 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v20 = [v19 CGColor];
  long long v21 = [v8 layer];
  [v21 setBorderColor:v20];

  long long v22 = [v8 layer];
  [v22 setBorderWidth:1.5];

  long long v23 = [v8 layer];
  [v23 setCornerRadius:5.0];

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(LUILogFilterViewController *)self filterView];
  id v7 = [v6 predicatesKeyCandidateCollectionView];

  if (v7 == v5)
  {
    uint64_t v13 = [(LUILogFilterViewController *)self predicateKeyCandidates];
LABEL_8:
    id v14 = v13;
    int64_t v12 = [v13 count];

    goto LABEL_9;
  }
  double v8 = [(LUILogFilterViewController *)self filterView];
  id v9 = [v8 predicatesComparisonCandidateCollectionView];

  if (v9 == v5)
  {
    uint64_t v13 = [(LUILogFilterViewController *)self predicateComparisonCandidates];
    goto LABEL_8;
  }
  id v10 = [(LUILogFilterViewController *)self filterView];
  id v11 = [v10 predicatesValueCandidateCollectionView];

  if (v11 == v5)
  {
    uint64_t v13 = [(LUILogFilterViewController *)self predicateValueCandidates];
    goto LABEL_8;
  }
  int64_t v12 = 0;
LABEL_9:

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(LUILogFilterViewController *)self filterView];
  id v10 = [v9 predicatesValueCandidateCollectionView];

  if (v10 == v7)
  {
    int64_t v12 = [(LUILogFilterViewController *)self predicateValueCandidatesSize];
    uint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    [v13 CGRectValue];
    double v11 = v14;
  }
  else
  {
    [v7 frame];
    double v11 = CGRectGetWidth(v18) + -20.0;
  }

  double v15 = 30.0;
  double v16 = v11;
  result.height = v15;
  result.width = v16;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 10.0;
  double v7 = 0.0;
  double v8 = 10.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"currentPredicateCell"];
  double v8 = [(LUILogFilterViewController *)self delegate];
  id v9 = [v8 currentPredicates:self];
  uint64_t v10 = [v6 section];

  double v11 = [v9 objectAtIndexedSubscript:v10];
  int64_t v12 = [v11 predicateFormat];
  uint64_t v13 = [v7 titleLabel];
  [v13 setText:v12];

  [v7 setDelegate:self];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = [(LUILogFilterViewController *)self delegate];
  double v5 = [v4 currentPredicates:self];
  unint64_t v6 = [v5 count];

  if (v6 <= 1) {
    return 1;
  }
  else {
    return v6;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v5 = [(LUILogFilterViewController *)self delegate];
  unint64_t v6 = [v5 currentPredicates:self];
  int64_t v7 = [v6 count] != 0;

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 10.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = objc_opt_new();
  double v5 = [MEMORY[0x263F1C550] clearColor];
  [v4 setBackgroundColor:v5];

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 30.0;
}

- (void)predicateTableViewCellDeleteButtonTapped:(id)a3
{
  id v4 = a3;
  double v5 = [(LUILogFilterViewController *)self filterView];
  unint64_t v6 = [v5 existingPredicatesTableView];
  id v11 = [v6 indexPathForCell:v4];

  int64_t v7 = [(LUILogFilterViewController *)self delegate];
  double v8 = [(LUILogFilterViewController *)self delegate];
  id v9 = [v8 currentPredicates:self];
  uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
  [v7 logFilterViewController:self didDeletePredicate:v10];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = a3;
  [(LUILogFilterViewController *)self _clearPredicateInput];
  char v5 = [v4 isFirstResponder];
  if ((v5 & 1) == 0) {
    [v4 setText:0];
  }

  return v5;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = [(LUILogFilterViewController *)self delegate];
  int v5 = [v4 logFilterViewControllerShouldAllowTextEditing:self];

  if (v5)
  {
    CGAffineTransformMakeTranslation(&v8, 0.0, -200.0);
    unint64_t v6 = [(LUILogFilterViewController *)self filterView];
    CGAffineTransform v7 = v8;
    [v6 setTransform:&v7];
  }
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = [(LUILogFilterViewController *)self delegate];
  int v5 = [v4 logFilterViewControllerShouldAllowTextEditing:self];

  if (v5)
  {
    CGAffineTransformMakeTranslation(&v8, 0.0, 0.0);
    unint64_t v6 = [(LUILogFilterViewController *)self filterView];
    CGAffineTransform v7 = v8;
    [v6 setTransform:&v7];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LUILogFilterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LUILogFilterViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LUILogFilterView)filterView
{
  return self->_filterView;
}

- (void)setFilterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end