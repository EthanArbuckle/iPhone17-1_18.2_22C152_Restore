@interface WFGiphyViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)selectMultiple;
- (NSArray)objects;
- (NSString)query;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionViewLayout;
- (UIView)emptyListView;
- (WFGiphySessionManager)sessionManager;
- (WFGiphyViewController)initWithQuery:(id)a3 selectMultiple:(BOOL)a4;
- (WFGiphyViewControllerDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)cancel;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)done;
- (void)loadView;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObjects:(id)a3;
- (void)setQuery:(id)a3;
- (void)updateResults;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFGiphyViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_emptyListView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_query, 0);
}

- (NSArray)objects
{
  return self->_objects;
}

- (WFGiphySessionManager)sessionManager
{
  return self->_sessionManager;
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (UIView)emptyListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emptyListView);
  return (UIView *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFGiphyViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFGiphyViewControllerDelegate *)WeakRetained;
}

- (NSString)query
{
  return self->_query;
}

- (BOOL)selectMultiple
{
  return self->_selectMultiple;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"WFGiphyCellReuseIdentifier" forIndexPath:v6];
  v8 = [(WFGiphyViewController *)self objects];
  uint64_t v9 = [v6 item];

  v10 = [v8 objectAtIndex:v9];
  [v7 setObject:v10];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(WFGiphyViewController *)self objects];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if (![(WFGiphyViewController *)self selectMultiple])
  {
    [(WFGiphyViewController *)self done];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v5 = a3;
  v4 = [v5 text];
  [(WFGiphyViewController *)self setQuery:v4];

  [v5 resignFirstResponder];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  if (![v5 length]) {
    [(WFGiphyViewController *)self setQuery:v5];
  }
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (void)cancel
{
  v3 = [(WFGiphyViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFGiphyViewController *)self delegate];
    [v5 giphyViewControllerDidCancel:self];
  }
}

- (void)done
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v4 = [(WFGiphyViewController *)self collectionView];
  id v5 = [v4 indexPathsForSelectedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9++), "item"));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v10 = [(WFGiphyViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(WFGiphyViewController *)self delegate];
    v13 = [(WFGiphyViewController *)self objects];
    v14 = [v13 objectsAtIndexes:v3];
    [v12 giphyViewController:self didSelectObjects:v14];
  }
}

- (void)updateResults
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFGiphyViewController_updateResults__block_invoke;
  aBlock[3] = &unk_264900FC8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  char v4 = [(WFGiphyViewController *)self query];
  uint64_t v5 = [v4 length];

  uint64_t v6 = [(WFGiphyViewController *)self sessionManager];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [(WFGiphyViewController *)self query];
    [v7 search:v8 limit:100 completion:v3];
  }
  else
  {
    [v6 trendingWithLimit:100 completion:v3];
  }
}

void __38__WFGiphyViewController_updateResults__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) query];
  char v4 = [*(id *)(a1 + 32) query];
  int v5 = [v3 isEqualToString:v4];

  if (v5) {
    [*(id *)(a1 + 32) setObjects:v6];
  }
}

- (void)setQuery:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(NSString *)self->_query isEqualToString:v8];
  int v5 = (NSString *)[v8 copy];
  query = self->_query;
  self->_query = v5;

  if ([v8 length])
  {
    [(WFGiphyViewController *)self setTitle:v8];
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = WFLocalizedString(@"Trending");
  [(WFGiphyViewController *)self setTitle:v7];

  if (!v4) {
LABEL_3:
  }
    [(WFGiphyViewController *)self updateResults];
LABEL_4:
}

- (void)setObjects:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(NSArray *)self->_objects isEqualToArray:v10];
  int v5 = (NSArray *)[v10 copy];
  objects = self->_objects;
  self->_objects = v5;

  if (!v4)
  {
    BOOL v7 = [v10 count] != 0;
    id v8 = [(WFGiphyViewController *)self emptyListView];
    [v8 setHidden:v7];

    uint64_t v9 = [(WFGiphyViewController *)self collectionView];
    [v9 reloadData];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)WFGiphyViewController;
  [(WFGiphyViewController *)&v28 viewWillAppear:a3];
  BOOL v4 = [(WFGiphyViewController *)self view];
  [v4 bounds];
  double v5 = CGRectGetWidth(v29) / 125.0;
  double v6 = ceil(v5);
  unint64_t v7 = vcvtpd_u64_f64(v5);

  id v8 = [(WFGiphyViewController *)self view];
  [v8 bounds];
  double Width = CGRectGetWidth(v30);
  double v10 = (double)(v7 - 1);
  char v11 = [(WFGiphyViewController *)self collectionViewLayout];
  [v11 minimumInteritemSpacing];
  double v13 = (Width - v10 * v12) / (double)(unint64_t)v6;

  v14 = [(WFGiphyViewController *)self collectionViewLayout];
  objc_msgSend(v14, "setItemSize:", v13, v13);

  double v15 = *MEMORY[0x263F834E8];
  double v16 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v17 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v18 = *(double *)(MEMORY[0x263F834E8] + 24);
  v19 = [(WFGiphyViewController *)self collectionView];
  objc_msgSend(v19, "setContentInset:", v15, v16, v17, v18);

  uint64_t v20 = [(WFGiphyViewController *)self collectionView];
  objc_msgSend(v20, "setScrollIndicatorInsets:", v15, v16, v17, v18);

  id v21 = objc_alloc(MEMORY[0x263F82828]);
  v22 = [MEMORY[0x263F85308] actionKitImageNamed:@"GiphyLogo"];
  v23 = [v22 UIImage];
  v24 = (void *)[v21 initWithImage:v23];

  v25 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v24 setTintColor:v25];

  [v24 sizeToFit];
  v26 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v24];
  v27 = [(WFGiphyViewController *)self navigationItem];
  [v27 setLeftBarButtonItem:v26];
}

- (void)loadView
{
  v78[14] = *MEMORY[0x263EF8340];
  v77.receiver = self;
  v77.super_class = (Class)WFGiphyViewController;
  [(WFGiphyViewController *)&v77 loadView];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  BOOL v4 = [(WFGiphyViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x263F82528]);
  double v6 = [(WFGiphyViewController *)self collectionViewLayout];
  unint64_t v7 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [MEMORY[0x263F825C8] clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setDataSource:self];
  [v7 setDelegate:self];
  objc_msgSend(v7, "setAllowsMultipleSelection:", -[WFGiphyViewController selectMultiple](self, "selectMultiple"));
  [v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"WFGiphyCellReuseIdentifier"];
  uint64_t v9 = [(WFGiphyViewController *)self view];
  [v9 addSubview:v7];

  objc_storeWeak((id *)&self->_collectionView, v7);
  id v10 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setHidden:1];
  char v11 = [(WFGiphyViewController *)self view];
  [v11 addSubview:v10];

  v76 = self;
  objc_storeWeak((id *)&self->_emptyListView, v10);
  id v12 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v13 = [MEMORY[0x263F825C8] lightGrayColor];
  [v12 setTextColor:v13];

  v14 = WFLocalizedString(@"No Results Found");
  [v12 setText:v14];

  [v12 setTextAlignment:1];
  double v15 = [MEMORY[0x263F81708] systemFontOfSize:28.0];
  [v12 setFont:v15];

  [v10 addSubview:v12];
  id v16 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v17 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
  [v16 setFont:v17];

  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v18 = [MEMORY[0x263F825C8] lightGrayColor];
  [v16 setTextColor:v18];

  v19 = WFLocalizedString(@"Clear the search bar to view trending GIFs.");
  [v16 setText:v19];

  [v16 setNumberOfLines:0];
  [v16 setTextAlignment:1];
  [v10 addSubview:v16];
  uint64_t v20 = [(WFGiphyViewController *)self view];
  v54 = (void *)MEMORY[0x263F08938];
  v75 = [v10 widthAnchor];
  v74 = [v20 widthAnchor];
  v73 = [v75 constraintEqualToAnchor:v74 constant:-60.0];
  v78[0] = v73;
  v72 = [v10 centerXAnchor];
  v71 = [v20 centerXAnchor];
  v69 = [v72 constraintEqualToAnchor:v71];
  v78[1] = v69;
  v68 = [v10 centerYAnchor];
  v67 = [v20 centerYAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v78[2] = v66;
  v65 = [v12 topAnchor];
  v63 = [v10 topAnchor];
  v62 = [v65 constraintEqualToAnchor:v63];
  v78[3] = v62;
  v61 = [v12 leadingAnchor];
  v60 = [v10 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v78[4] = v59;
  v70 = v12;
  v58 = [v12 trailingAnchor];
  v56 = [v10 trailingAnchor];
  v55 = [v58 constraintEqualToAnchor:v56];
  v78[5] = v55;
  v52 = [v16 topAnchor];
  v51 = [v12 bottomAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:10.0];
  v78[6] = v50;
  v49 = [v16 leadingAnchor];
  v48 = [v10 leadingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v78[7] = v47;
  v64 = v16;
  v46 = [v16 trailingAnchor];
  v45 = [v10 trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v78[8] = v44;
  v43 = [v16 bottomAnchor];
  v42 = [v10 bottomAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v78[9] = v41;
  v40 = [v7 topAnchor];
  id v21 = v20;
  v39 = [v20 topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v78[10] = v38;
  v22 = v7;
  v37 = [v7 leadingAnchor];
  v23 = [v20 leadingAnchor];
  v24 = [v37 constraintEqualToAnchor:v23];
  v78[11] = v24;
  v57 = v22;
  v25 = [v22 bottomAnchor];
  v26 = v21;
  v53 = v21;
  v27 = [v21 bottomAnchor];
  objc_super v28 = [v25 constraintEqualToAnchor:v27];
  v78[12] = v28;
  CGRect v29 = [v22 trailingAnchor];
  CGRect v30 = [v26 trailingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v78[13] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:14];
  [v54 activateConstraints:v32];

  v33 = [(WFGiphyViewController *)v76 query];
  v34 = [(WFGiphyViewController *)v76 navigationItem];
  v35 = [v34 searchController];
  v36 = [v35 searchBar];
  [v36 setText:v33];

  [(WFGiphyViewController *)v76 updateResults];
}

- (WFGiphyViewController)initWithQuery:(id)a3 selectMultiple:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (!v8)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"WFGiphyViewController.m", 137, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)WFGiphyViewController;
  uint64_t v9 = [(WFGiphyViewController *)&v32 initWithNibName:0 bundle:0];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    v10->_selectMultiple = v4;
    uint64_t v11 = objc_opt_new();
    sessionManager = v10->_sessionManager;
    v10->_sessionManager = (WFGiphySessionManager *)v11;

    [(WFGiphySessionManager *)v10->_sessionManager setApiKey:*MEMORY[0x263F23288]];
    double v13 = [MEMORY[0x263F82B60] mainScreen];
    [v13 scale];
    double v15 = 1.0 / v14;

    uint64_t v16 = objc_opt_new();
    collectionViewLayout = v10->_collectionViewLayout;
    v10->_collectionViewLayout = (UICollectionViewFlowLayout *)v16;

    [(UICollectionViewFlowLayout *)v10->_collectionViewLayout setMinimumInteritemSpacing:v15];
    [(UICollectionViewFlowLayout *)v10->_collectionViewLayout setMinimumLineSpacing:v15];
    -[UICollectionViewFlowLayout setSectionInset:](v10->_collectionViewLayout, "setSectionInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    -[UICollectionViewFlowLayout setHeaderReferenceSize:](v10->_collectionViewLayout, "setHeaderReferenceSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v18 = WFLocalizedString(@"Giphy");
    [(WFGiphyViewController *)v10 setTitle:v18];

    v19 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
    [v19 setObscuresBackgroundDuringPresentation:0];
    [v19 setHidesNavigationBarDuringPresentation:0];
    uint64_t v20 = WFLocalizedString(@"Search Giphy");
    id v21 = [v19 searchBar];
    [v21 setPlaceholder:v20];

    v22 = [v19 searchBar];
    [v22 setShowsCancelButton:0];

    v23 = [v19 searchBar];
    [v23 setDelegate:v10];

    v24 = [v19 searchBar];
    [v24 setText:v8];

    v25 = [(WFGiphyViewController *)v10 navigationItem];
    [v25 setSearchController:v19];

    v26 = [(WFGiphyViewController *)v10 navigationItem];
    [v26 setHidesSearchBarWhenScrolling:0];

    id v27 = objc_alloc(MEMORY[0x263F824A8]);
    if (v4)
    {
      objc_super v28 = (void *)[v27 initWithBarButtonSystemItem:0 target:v10 action:sel_done];
      [v28 setStyle:2];
    }
    else
    {
      objc_super v28 = (void *)[v27 initWithBarButtonSystemItem:1 target:v10 action:sel_cancel];
    }
    CGRect v29 = [(WFGiphyViewController *)v10 navigationItem];
    [v29 setRightBarButtonItem:v28];
  }
  return v10;
}

@end