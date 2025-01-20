@interface SFCreditCardFillingViewController
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (SFCreditCardFillingViewController)initWithFormAutocompleteState:(id)a3;
- (SFFormAutocompleteState)formAutocompleteState;
- (double)_calculateCellWidthForCollectionViewWidth:(double)a3;
- (double)preferredHeightForTraitCollection:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_cardDataChanged:(id)a3;
- (void)_loadCardData;
- (void)_scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SFCreditCardFillingViewController

- (SFCreditCardFillingViewController)initWithFormAutocompleteState:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCreditCardFillingViewController;
  v5 = [(SFCreditCardFillingViewController *)&v10 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_formAutocompleteState, v4);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__cardDataChanged_ name:*MEMORY[0x1E4FB2730] object:0];

    v8 = v6;
  }

  return v6;
}

- (double)_calculateCellWidthForCollectionViewWidth:(double)a3
{
  if (self->_lastLayoutWidth == a3) {
    return self->_cachedCellWidth;
  }
  self->_lastLayoutWidth = a3;
  int v4 = 30;
  while (v4 != 5)
  {
    double v3 = floor((a3 - (double)v4) / floor((a3 - (double)v4) / 180.0));
    v4 -= 5;
    if (v3 <= 285.0) {
      goto LABEL_8;
    }
  }
  double v3 = 180.0;
LABEL_8:
  self->_cachedCellWidth = v3;
  return v3;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1588]);
  [v3 setScrollDirection:1];
  id v4 = objc_alloc(MEMORY[0x1E4FB1580]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __45__SFCreditCardFillingViewController_loadView__block_invoke;
  v27[3] = &unk_1E5C72E60;
  v27[4] = self;
  v5 = (void *)[v4 initWithSectionProvider:v27 configuration:v3];
  v6 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v5, 0.0, 0.0, 320.0, 47.0);
  collectionView = self->_collectionView;
  self->_collectionView = v6;

  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v8];

  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setClipsToBounds:1];
  [(UICollectionView *)self->_collectionView setDelaysContentTouches:0];
  [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:0];
  v9 = self->_collectionView;
  uint64_t v10 = objc_opt_class();
  v11 = +[SFCreditCardCollectionViewCell reuseIdentifier];
  [(UICollectionView *)v9 registerClass:v10 forCellWithReuseIdentifier:v11];

  v12 = self->_collectionView;
  uint64_t v13 = objc_opt_class();
  v14 = +[SFScanningCreditCardCollectionViewCell reuseIdentifier];
  [(UICollectionView *)v12 registerClass:v13 forCellWithReuseIdentifier:v14];

  v15 = self->_collectionView;
  uint64_t v16 = objc_opt_class();
  v17 = +[SFCreditCardSeparator reuseIdentifier];
  [(UICollectionView *)v15 registerClass:v16 forSupplementaryViewOfKind:@"SFCreditCardSeparator" withReuseIdentifier:v17];

  id v18 = objc_alloc(MEMORY[0x1E4FB1838]);
  v19 = objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"CreditCardShadowLeft");
  v20 = (UIImageView *)[v18 initWithImage:v19];
  leftShadowView = self->_leftShadowView;
  self->_leftShadowView = v20;

  [(UICollectionView *)self->_collectionView addSubview:self->_leftShadowView];
  id v22 = objc_alloc(MEMORY[0x1E4FB1838]);
  v23 = objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"CreditCardShadowRight");
  v24 = (UIImageView *)[v22 initWithImage:v23];
  rightShadowView = self->_rightShadowView;
  self->_rightShadowView = v24;

  [(UICollectionView *)self->_collectionView addSubview:self->_rightShadowView];
  [(SFCreditCardFillingViewController *)self setView:self->_collectionView];
  v26 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v26 addObserver:self selector:sel__cardDataChanged_ name:*MEMORY[0x1E4F990F8] object:0];
}

id __45__SFCreditCardFillingViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 == 1)
  {
    +[SFScanningCreditCardCollectionViewCell desiredCellWidth];
    double v7 = fmax(v6, *(double *)(*(void *)(a1 + 32) + 1016));
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = objc_msgSend(v5, "container", v5);
    [v9 contentSize];
    objc_msgSend(v8, "_calculateCellWidthForCollectionViewWidth:");
    double v7 = v10;
  }
  v11 = (void *)MEMORY[0x1E4FB1338];
  v12 = [MEMORY[0x1E4FB1308] absoluteDimension:v7];
  uint64_t v13 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  v14 = [v11 sizeWithWidthDimension:v12 heightDimension:v13];

  v15 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v14];
  uint64_t v16 = (void *)MEMORY[0x1E4FB1338];
  v17 = [MEMORY[0x1E4FB1308] absoluteDimension:v7];
  id v18 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  v19 = [v16 sizeWithWidthDimension:v17 heightDimension:v18];

  v20 = (void *)MEMORY[0x1E4FB1318];
  v34[0] = v15;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  id v22 = [v20 horizontalGroupWithLayoutSize:v19 subitems:v21];

  v23 = [MEMORY[0x1E4FB1330] sectionWithGroup:v22];
  uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 976) count];
  if (a2 == 1 && v24)
  {
    v25 = (void *)MEMORY[0x1E4FB1338];
    v26 = [MEMORY[0x1E4FB1308] absoluteDimension:1.0];
    v27 = [MEMORY[0x1E4FB1308] absoluteDimension:24.0];
    v28 = [v25 sizeWithWidthDimension:v26 heightDimension:v27];

    v29 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v28 elementKind:@"SFCreditCardSeparator" alignment:3];
    v33 = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    [v23 setBoundarySupplementaryItems:v30];
  }

  return v23;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFCreditCardFillingViewController;
  [(SFCreditCardFillingViewController *)&v4 viewWillAppear:a3];
  [(SFCreditCardFillingViewController *)self _loadCardData];
}

- (void)_loadCardData
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x1E4FB6ED8] sharedCreditCardDataController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__SFCreditCardFillingViewController__loadCardData__block_invoke;
  v3[3] = &unk_1E5C742E0;
  objc_copyWeak(&v4, &location);
  [v2 getCreditCardDataWithCompletionHandler:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__SFCreditCardFillingViewController__loadCardData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SFCreditCardFillingViewController__loadCardData__block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __50__SFCreditCardFillingViewController__loadCardData__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "safari_filterObjectsUsingBlock:", &__block_literal_global_16);
    id v3 = (void *)v2;
    if (v2) {
      id v4 = (void *)v2;
    }
    else {
      id v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong(WeakRetained + 122, v4);
    [WeakRetained[123] reloadData];
    [WeakRetained _scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased];
  }
}

uint64_t __50__SFCreditCardFillingViewController__loadCardData__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 shouldHide] ^ 1;
}

- (void)_scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased
{
  id v3 = [(SFCreditCardFillingViewController *)self formAutocompleteState];
  id v4 = [v3 previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance];
  id v5 = v4;
  if (v4)
  {
    creditCards = self->_creditCards;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __98__SFCreditCardFillingViewController__scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased__block_invoke;
    v12[3] = &unk_1E5C74308;
    id v13 = v4;
    uint64_t v7 = [(NSArray *)creditCards indexOfObjectPassingTest:v12];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v3 setPreviouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance:0];
    }
    else
    {
      uint64_t v8 = v7;
      v9 = [(NSArray *)self->_creditCards objectAtIndexedSubscript:v7];
      char v10 = [v9 isCardBalanceZeroOrNegative];

      if ((v10 & 1) == 0)
      {
        v11 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:0];
        [(UICollectionView *)self->_collectionView scrollToItemAtIndexPath:v11 atScrollPosition:16 animated:1];
        [v3 setPreviouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance:0];
      }
    }
  }
}

uint64_t __98__SFCreditCardFillingViewController__scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 balance];

  if (v4) {
    uint64_t v5 = [v3 hasSameCreditCardInformationAs:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)viewDidLayoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)SFCreditCardFillingViewController;
  [(SFCreditCardFillingViewController *)&v31 viewDidLayoutSubviews];
  [(UICollectionView *)self->_collectionView contentSize];
  double v4 = v3;
  [(UICollectionView *)self->_collectionView bounds];
  double v6 = v5;
  uint64_t v7 = [(UICollectionView *)self->_collectionView superview];
  [v7 bounds];
  double v9 = v8;

  double v10 = -2.0;
  if (v9 >= 52.0) {
    double v10 = 5.0;
  }
  double v11 = 0.0;
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", 0.0, v10, v6, 47.0);
  [(UICollectionView *)self->_collectionView contentInset];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if (v4 <= v6)
  {
    _SFRoundFloatToPixels();
    double v11 = v18;
  }
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v13, v11, v15, v17);
  collectionView = self->_collectionView;
  if (v6 <= 450.0)
  {
    [(UICollectionView *)collectionView _setContinuousCornerRadius:0.0];
    [(UIImageView *)self->_leftShadowView setAlpha:0.0];
    [(UIImageView *)self->_rightShadowView setAlpha:0.0];
  }
  else
  {
    [(UICollectionView *)collectionView _setContinuousCornerRadius:12.0];
    v20 = [(UIImageView *)self->_leftShadowView image];
    [v20 size];
    double v22 = v21;
    double v24 = v23;

    [(UICollectionView *)self->_collectionView contentOffset];
    SFChromeVisibilityForScrollDistance();
    -[UIImageView setAlpha:](self->_leftShadowView, "setAlpha:");
    [(UICollectionView *)self->_collectionView bounds];
    -[UIImageView setFrame:](self->_leftShadowView, "setFrame:", CGRectGetMinX(v32), 0.0, v22, v24);
    v25 = [(UIImageView *)self->_rightShadowView image];
    [v25 size];
    double v27 = v26;
    double v29 = v28;

    [(UICollectionView *)self->_collectionView contentOffset];
    SFChromeVisibilityForScrollDistance();
    [(UIImageView *)self->_rightShadowView setAlpha:1.0 - v30];
    [(UICollectionView *)self->_collectionView bounds];
    -[UIImageView setFrame:](self->_rightShadowView, "setFrame:", v6 + CGRectGetMinX(v33) - v27, 0.0, v27, v29);
  }
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  return 52.0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 section];
  if (v9 == 1)
  {
    double v11 = +[SFScanningCreditCardCollectionViewCell reuseIdentifier];
    double v4 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];
  }
  else
  {
    if (v9) {
      goto LABEL_6;
    }
    double v10 = +[SFCreditCardCollectionViewCell reuseIdentifier];
    double v4 = [v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v8];

    double v11 = -[NSArray objectAtIndexedSubscript:](self->_creditCards, "objectAtIndexedSubscript:", [v8 row]);
    [v4 configureViewWithCardData:v11];
  }

LABEL_6:

  return v4;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = +[SFCreditCardSeparator reuseIdentifier];
  double v11 = [v9 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v10 forIndexPath:v7];

  return v11;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  creditCards = self->_creditCards;
  BOOL v4 = +[_SFCreditCardCaptureViewController canCapture];
  int64_t v5 = 1;
  if (creditCards) {
    int64_t v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return creditCards != 0;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return [(NSArray *)self->_creditCards count];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formAutocompleteState);
  uint64_t v6 = [v9 section];
  if (v6 == 1)
  {
    [WeakRetained captureCreditCardDataWithCameraAndFill];
  }
  else if (!v6)
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](self->_creditCards, "objectAtIndexedSubscript:", [v9 row]);
    id v8 = +[_SFTextSuggestion textSuggestionWithCreditCardData:v7];

    [WeakRetained autoFillTextSuggestion:v8];
  }
}

- (void)_cardDataChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SFCreditCardFillingViewController__cardDataChanged___block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__SFCreditCardFillingViewController__cardDataChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadCardData];
}

- (SFFormAutocompleteState)formAutocompleteState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formAutocompleteState);

  return (SFFormAutocompleteState *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_formAutocompleteState);
  objc_storeStrong((id *)&self->_rightShadowView, 0);
  objc_storeStrong((id *)&self->_leftShadowView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_creditCards, 0);
}

@end