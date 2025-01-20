@interface MUBrowseCategoryViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)disableBottomPadding;
- (CGSize)preferredCellSize;
- (MKMapItem)mapItem;
- (MUBrowseCategoryCollectionView)collectionView;
- (MUBrowseCategoryViewController)initWithMapItem:(id)a3;
- (MUBrowseCategoryViewControllerDelegate)delegate;
- (MUFixedToTopCollectionViewFlowLayout)collectionViewFlowLayout;
- (NSArray)browseItems;
- (NSArray)buttons;
- (NSLayoutConstraint)collectionViewBottomConstraint;
- (UIFont)preferredCellTitleLabelFont;
- (double)collectionViewBottomPadding;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)didDisplayCategoriesNotificationName;
- (id)willStartDisplayCategoriesNotificationName;
- (int)placeCardTypeForAnalytics;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_ppt_postNotificationName:(id)a3 object:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)setBrowseItems:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewBottomConstraint:(id)a3;
- (void)setCollectionViewFlowLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableBottomPadding:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setPreferredCellSize:(CGSize)a3;
- (void)setPreferredCellTitleLabelFont:(id)a3;
- (void)setupCollectionView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MUBrowseCategoryViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MUBrowseCategoryViewController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MUBrowseCategoryViewController;
  v6 = [(MUBrowseCategoryViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v7;
}

- (void)viewDidLoad
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)MUBrowseCategoryViewController;
  [(MUBrowseCategoryViewController *)&v24 viewDidLoad];
  v3 = [(MUBrowseCategoryViewController *)self view];
  [v3 setPreservesSuperviewLayoutMargins:1];

  v4 = [(MUBrowseCategoryViewController *)self willStartDisplayCategoriesNotificationName];
  [(MUBrowseCategoryViewController *)self _ppt_postNotificationName:v4 object:0];

  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = [(MUBrowseCategoryViewController *)self mapItem];
  v7 = [v6 _browseCategories];
  v8 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v7, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(MUBrowseCategoryViewController *)self mapItem];
  objc_super v10 = [v9 _browseCategories];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
        v16 = [MUBrowseCategoryItem alloc];
        v17 = [(MUBrowseCategoryViewController *)self traitCollection];
        v18 = -[MUBrowseCategoryItem initWithCategory:nightMode:](v16, "initWithCategory:nightMode:", v15, [v17 userInterfaceStyle] == 2);
        [v8 addObject:v18];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v12);
  }

  v19 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
  [(MUBrowseCategoryViewController *)self setBrowseItems:v19];

  [(MUBrowseCategoryViewController *)self setupCollectionView];
}

- (void)setupCollectionView
{
  v50[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(MUFixedToTopCollectionViewFlowLayout);
  [(MUBrowseCategoryViewController *)self setCollectionViewFlowLayout:v3];

  v4 = [(MUBrowseCategoryViewController *)self collectionViewFlowLayout];
  [v4 setScrollDirection:0];

  id v5 = [(MUBrowseCategoryViewController *)self collectionViewFlowLayout];
  [v5 setMinimumLineSpacing:15.0];

  v6 = [(MUBrowseCategoryViewController *)self collectionViewFlowLayout];
  [v6 setMinimumInteritemSpacing:0.0];

  v7 = [MUBrowseCategoryCollectionView alloc];
  v8 = [(MUBrowseCategoryViewController *)self collectionViewFlowLayout];
  v9 = -[MUBrowseCategoryCollectionView initWithFrame:collectionViewLayout:](v7, "initWithFrame:collectionViewLayout:", v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MUBrowseCategoryViewController *)self setCollectionView:v9];

  objc_super v10 = [(MUBrowseCategoryViewController *)self collectionView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v11 = [(MUBrowseCategoryViewController *)self collectionView];
  [v11 setAccessibilityIdentifier:@"VenuesBrowseCategoryView"];

  uint64_t v12 = [(MUBrowseCategoryViewController *)self view];
  uint64_t v13 = [(MUBrowseCategoryViewController *)self collectionView];
  [v12 addSubview:v13];

  uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v15 = [(MUBrowseCategoryViewController *)self collectionView];
  [v15 setBackgroundColor:v14];

  v16 = [(MUBrowseCategoryViewController *)self collectionView];
  [v16 setDelegate:self];

  v17 = [(MUBrowseCategoryViewController *)self collectionView];
  [v17 setDataSource:self];

  v18 = [(MUBrowseCategoryViewController *)self collectionView];
  uint64_t v19 = objc_opt_class();
  long long v20 = +[MUBrowseCategoryCollectionViewCell reuseIdentifier];
  [v18 registerClass:v19 forCellWithReuseIdentifier:v20];

  long long v21 = [(MUBrowseCategoryViewController *)self collectionView];
  [v21 setScrollEnabled:0];

  long long v22 = [(MUBrowseCategoryViewController *)self collectionView];
  [v22 setClipsToBounds:0];

  long long v23 = [(MUBrowseCategoryViewController *)self collectionView];
  objc_super v24 = [v23 bottomAnchor];
  v25 = [(MUBrowseCategoryViewController *)self view];
  uint64_t v26 = [v25 layoutMarginsGuide];
  v27 = [v26 bottomAnchor];
  [(MUBrowseCategoryViewController *)self collectionViewBottomPadding];
  v29 = [v24 constraintEqualToAnchor:v27 constant:-v28];
  [(MUBrowseCategoryViewController *)self setCollectionViewBottomConstraint:v29];

  v42 = (void *)MEMORY[0x1E4F28DC8];
  v49 = [(MUBrowseCategoryViewController *)self collectionView];
  v47 = [v49 leadingAnchor];
  v48 = [(MUBrowseCategoryViewController *)self view];
  v46 = [v48 layoutMarginsGuide];
  v45 = [v46 leadingAnchor];
  v44 = [v47 constraintEqualToAnchor:v45];
  v50[0] = v44;
  v43 = [(MUBrowseCategoryViewController *)self collectionView];
  v40 = [v43 trailingAnchor];
  v41 = [(MUBrowseCategoryViewController *)self view];
  v30 = [v41 layoutMarginsGuide];
  v31 = [v30 trailingAnchor];
  v32 = [v40 constraintEqualToAnchor:v31];
  v50[1] = v32;
  v33 = [(MUBrowseCategoryViewController *)self collectionView];
  v34 = [v33 topAnchor];
  v35 = [(MUBrowseCategoryViewController *)self view];
  v36 = [v35 topAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v50[2] = v37;
  v38 = [(MUBrowseCategoryViewController *)self collectionViewBottomConstraint];
  v50[3] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
  [v42 activateConstraints:v39];
}

- (double)collectionViewBottomPadding
{
  BOOL v2 = [(MUBrowseCategoryViewController *)self disableBottomPadding];
  double result = 0.0;
  if (!v2)
  {
    if (qword_1E9315288 != -1) {
      dispatch_once(&qword_1E9315288, &__block_literal_global_29);
    }
    v4 = (void *)_MergedGlobals_1_1;
    id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    v6 = [v5 preferredContentSizeCategory];
    LODWORD(v4) = [v4 containsObject:v6];

    double result = 15.0;
    if (v4) {
      return 18.0;
    }
  }
  return result;
}

void __61__MUBrowseCategoryViewController_collectionViewBottomPadding__block_invoke()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB27C8];
  v5[0] = *MEMORY[0x1E4FB27F0];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4FB27D8];
  v5[2] = *MEMORY[0x1E4FB27E8];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4FB27C0];
  v5[4] = *MEMORY[0x1E4FB27D0];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E4FB27B8];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v4 = (void *)_MergedGlobals_1_1;
  _MergedGlobals_1_1 = v3;
}

- (void)viewWillLayoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)MUBrowseCategoryViewController;
  [(MUBrowseCategoryViewController *)&v26 viewWillLayoutSubviews];
  if (qword_1E9315298 != -1) {
    dispatch_once(&qword_1E9315298, &__block_literal_global_33);
  }
  uint64_t v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v4 = [(MUBrowseCategoryViewController *)self view];
  [v4 frame];
  double v6 = v5;

  if (v6 <= 320.0)
  {
    uint64_t v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];

    uint64_t v3 = (void *)v7;
  }
  v8 = [(MUBrowseCategoryViewController *)self view];
  [v8 layoutMargins];
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(MUBrowseCategoryViewController *)self view];
  [v13 frame];
  double Width = CGRectGetWidth(v27);

  uint64_t v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  v16 = [v15 preferredContentSizeCategory];

  if ([v16 isEqualToString:*MEMORY[0x1E4FB27B0]])
  {
    double v17 = 85.0;
  }
  else if ([(id)qword_1E9315290 containsObject:v16])
  {
    [v3 pointSize];
    double v17 = 110.0;
    if (v18 > 27.0)
    {
      uint64_t v19 = [v3 fontWithSize:27.0];

      uint64_t v3 = (void *)v19;
    }
  }
  else
  {
    double v17 = (Width - v10 - v12 + -3.0) * 0.25;
  }
  long long v20 = [(MUBrowseCategoryViewController *)self preferredCellTitleLabelFont];
  if (![v20 isEqual:v3])
  {

    -[MUBrowseCategoryViewController setPreferredCellSize:](self, "setPreferredCellSize:", v17, 56.0);
    [(MUBrowseCategoryViewController *)self setPreferredCellTitleLabelFont:v3];
LABEL_16:
    v25 = [(MUBrowseCategoryViewController *)self collectionView];
    [v25 reloadData];

    goto LABEL_17;
  }
  [(MUBrowseCategoryViewController *)self preferredCellSize];
  double v22 = v21;
  double v24 = v23;

  -[MUBrowseCategoryViewController setPreferredCellSize:](self, "setPreferredCellSize:", v17, 56.0);
  [(MUBrowseCategoryViewController *)self setPreferredCellTitleLabelFont:v3];
  if (v22 != v17 || v24 != 56.0) {
    goto LABEL_16;
  }
LABEL_17:
}

void __56__MUBrowseCategoryViewController_viewWillLayoutSubviews__block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB2790];
  v4[0] = *MEMORY[0x1E4FB2798];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4FB2780];
  v4[2] = *MEMORY[0x1E4FB2788];
  v4[3] = v1;
  v4[4] = *MEMORY[0x1E4FB2778];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v3 = (void *)qword_1E9315290;
  qword_1E9315290 = v2;
}

- (void)viewDidLayoutSubviews
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)MUBrowseCategoryViewController;
  [(MUBrowseCategoryViewController *)&v24 viewDidLayoutSubviews];
  uint64_t v3 = [(MUBrowseCategoryViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfItemsInSection:0];

  if (v4 >= 1)
  {
    double v5 = [(MUBrowseCategoryViewController *)self browseItems];
    double v6 = [v5 firstObject];
    uint64_t v7 = [v6 searchCategory];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v8 = [(MUBrowseCategoryViewController *)self browseItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * v12) searchCategory];
          uint64_t v14 = [v13 subcategories];
          uint64_t v15 = [v14 count];

          if (v15)
          {

            goto LABEL_12;
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v13 = v7;
LABEL_12:

    v16 = [(MUBrowseCategoryViewController *)self didDisplayCategoriesNotificationName];
    [(MUBrowseCategoryViewController *)self _ppt_postNotificationName:v16 object:v13];

    double v17 = [(MUBrowseCategoryViewController *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v19 = [(MUBrowseCategoryViewController *)self delegate];
      [v19 categoryBrowseViewControllerDidDisplayBrowseCategories:self];
    }
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(MUBrowseCategoryViewController *)self collectionViewBottomPadding];
  double v5 = -v4;
  double v6 = [(MUBrowseCategoryViewController *)self collectionViewBottomConstraint];
  [v6 setConstant:v5];

  id v8 = [(MUBrowseCategoryViewController *)self collectionView];
  uint64_t v7 = [v8 collectionViewLayout];
  [v7 invalidateLayout];
}

- (void)setPreferredCellSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->_preferredCellSize.width || a3.height != self->_preferredCellSize.height)
  {
    self->_preferredCellSize = a3;
    id v6 = [(MUBrowseCategoryViewController *)self collectionViewFlowLayout];
    objc_msgSend(v6, "setEstimatedItemSize:", width, height);
  }
}

- (int)placeCardTypeForAnalytics
{
  uint64_t v2 = [(MUBrowseCategoryViewController *)self mapItem];
  int v3 = objc_msgSend(v2, "_browseCategory_placeCardType");

  return v3;
}

- (NSArray)buttons
{
  int v3 = [(MUBrowseCategoryViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfItemsInSection:0];

  if (v4 < 1)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v5 = [(MUBrowseCategoryViewController *)self collectionView];
    [v5 layoutIfNeeded];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:0];
      uint64_t v9 = [(MUBrowseCategoryViewController *)self collectionView];
      uint64_t v10 = [v9 cellForItemAtIndexPath:v8];

      if (v10) {
        [v6 addObject:v10];
      }
    }
    uint64_t v11 = (void *)[v6 copy];
  }
  return (NSArray *)v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(MUBrowseCategoryViewController *)self browseItems];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = [(MUBrowseCategoryViewController *)self browseItems];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v27 + 1) + 8 * v13) searchCategory];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [MEMORY[0x1E4F30F28] sharedService];
  v16 = [v7 title];
  double v17 = [(MUBrowseCategoryViewController *)self mapItem];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v19 = [(MUBrowseCategoryViewController *)self placeCardTypeForAnalytics];
  long long v20 = (void *)[v8 copy];
  long long v21 = [v7 searchCategory];
  [v15 capturePlaceCardUserAction:2004 onTarget:201 eventValue:v16 mapItem:v17 timestamp:v19 placeCardType:v20 categoriesDisplayed:Current categorySelected:v21];

  long long v22 = [v7 searchCategory];

  if (v22)
  {
    long long v23 = [(MUBrowseCategoryViewController *)self delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      v25 = [(MUBrowseCategoryViewController *)self delegate];
      uint64_t v26 = [v7 searchCategory];
      [v25 categoryBrowseViewController:self didTapOnSearchCategory:v26];
    }
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(MUBrowseCategoryViewController *)self browseItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MUBrowseCategoryCollectionViewCell reuseIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(MUBrowseCategoryViewController *)self preferredCellSize];
  objc_msgSend(v9, "setPreferredSize:");
  uint64_t v10 = [(MUBrowseCategoryViewController *)self preferredCellTitleLabelFont];
  [v9 setPreferredTitleLabelFont:v10];

  uint64_t v11 = [MEMORY[0x1E4FB1618] labelColor];
  [v9 setTitleLabelTextColor:v11];

  uint64_t v12 = [(MUBrowseCategoryViewController *)self browseItems];
  uint64_t v13 = [v6 row];

  uint64_t v14 = [v12 objectAtIndex:v13];
  [v9 setBrowseItem:v14];

  return v9;
}

- (id)willStartDisplayCategoriesNotificationName
{
  return @"WillStartDisplayBrowseCategories";
}

- (id)didDisplayCategoriesNotificationName
{
  return @"DidDisplayBrowseCategories";
}

- (void)_ppt_postNotificationName:(id)a3 object:(id)a4
{
  int64_t v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultCenter];
  [v8 postNotificationName:v7 object:v6];
}

- (MUBrowseCategoryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUBrowseCategoryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disableBottomPadding
{
  return self->_disableBottomPadding;
}

- (void)setDisableBottomPadding:(BOOL)a3
{
  self->_disableBottomPadding = a3;
}

- (NSArray)browseItems
{
  return self->_browseItems;
}

- (void)setBrowseItems:(id)a3
{
}

- (MUBrowseCategoryCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (MUFixedToTopCollectionViewFlowLayout)collectionViewFlowLayout
{
  return self->_collectionViewFlowLayout;
}

- (void)setCollectionViewFlowLayout:(id)a3
{
}

- (NSLayoutConstraint)collectionViewBottomConstraint
{
  return self->_collectionViewBottomConstraint;
}

- (void)setCollectionViewBottomConstraint:(id)a3
{
}

- (CGSize)preferredCellSize
{
  double width = self->_preferredCellSize.width;
  double height = self->_preferredCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIFont)preferredCellTitleLabelFont
{
  return self->_preferredCellTitleLabelFont;
}

- (void)setPreferredCellTitleLabelFont:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_preferredCellTitleLabelFont, 0);
  objc_storeStrong((id *)&self->_collectionViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_browseItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end