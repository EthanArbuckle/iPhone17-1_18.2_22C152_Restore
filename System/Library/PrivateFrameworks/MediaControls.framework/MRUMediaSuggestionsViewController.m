@interface MRUMediaSuggestionsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)supportsHorizontalLayout;
- (MRUMediaSuggestionsViewController)initWithMediaSuggestions:(id)a3;
- (MRUMediaSuggestionsViewControllerDelegate)delegate;
- (MRUVisualStylingProvider)stylingProvider;
- (NSArray)mediaSuggestions;
- (NSDictionary)suggestions;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIEdgeInsets)contentEdgeInsets;
- (int64_t)layout;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setMediaSuggestions:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setSupportsHorizontalLayout:(BOOL)a3;
- (void)updateCell:(id)a3 forIdentifier:(id)a4;
- (void)updateSuggestions;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MRUMediaSuggestionsViewController

- (MRUMediaSuggestionsViewController)initWithMediaSuggestions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUMediaSuggestionsViewController;
  v6 = [(MRUMediaSuggestionsViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaSuggestions, a3);
  }

  return v7;
}

- (void)loadView
{
  v3 = [MRUMediaSuggestionsView alloc];
  v4 = -[MRUMediaSuggestionsView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MRUMediaSuggestionsViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)MRUMediaSuggestionsViewController;
  [(MRUMediaSuggestionsViewController *)&v28 viewDidLoad];
  int64_t layout = self->_layout;
  v4 = [(MRUMediaSuggestionsViewController *)self view];
  [v4 setLayout:layout];

  BOOL supportsHorizontalLayout = self->_supportsHorizontalLayout;
  v6 = [(MRUMediaSuggestionsViewController *)self view];
  [v6 setSupportsHorizontalLayout:supportsHorizontalLayout];

  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  v11 = [(MRUMediaSuggestionsViewController *)self view];
  objc_msgSend(v11, "setContentEdgeInsets:", top, left, bottom, right);

  v12 = [(MRUMediaSuggestionsViewController *)self view];
  v13 = [v12 collectionView];
  [v13 setDelegate:self];

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v15 = objc_opt_class();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__MRUMediaSuggestionsViewController_viewDidLoad__block_invoke;
  v25[3] = &unk_1E5F0E548;
  objc_copyWeak(&v26, &location);
  v16 = [v14 registrationWithCellClass:v15 configurationHandler:v25];
  id v17 = objc_alloc(MEMORY[0x1E4FB1598]);
  v18 = [(MRUMediaSuggestionsViewController *)self view];
  v19 = [v18 collectionView];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__MRUMediaSuggestionsViewController_viewDidLoad__block_invoke_2;
  v23[3] = &unk_1E5F0E570;
  id v20 = v16;
  id v24 = v20;
  v21 = (UICollectionViewDiffableDataSource *)[v17 initWithCollectionView:v19 cellProvider:v23];
  dataSource = self->_dataSource;
  self->_dataSource = v21;

  [(MRUMediaSuggestionsViewController *)self updateSuggestions];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __48__MRUMediaSuggestionsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained updateCell:v7 forIdentifier:v6];
}

uint64_t __48__MRUMediaSuggestionsViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MRUMediaSuggestionsViewController;
  [(MRUMediaSuggestionsViewController *)&v9 viewWillAppear:a3];
  v4 = [(MRUMediaSuggestionsViewController *)self view];
  [v4 updateCollectionViewLayout];

  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v7 = [(MRUMediaSuggestionsViewController *)self view];
  v8 = [v7 collectionView];
  objc_msgSend(v8, "setContentOffset:", v5, v6);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)MRUMediaSuggestionsViewController;
  -[MRUMediaSuggestionsViewController viewWillDisappear:](&v19, sel_viewWillDisappear_);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(MRUMediaSuggestionsViewController *)self view];
  double v6 = [v5 collectionView];
  id v7 = [v6 indexPathsForSelectedItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        v13 = [(MRUMediaSuggestionsViewController *)self view];
        v14 = [v13 collectionView];
        [v14 deselectItemAtIndexPath:v12 animated:v3];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setMediaSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSuggestions, a3);
  if ([(MRUMediaSuggestionsViewController *)self isViewLoaded])
  {
    [(MRUMediaSuggestionsViewController *)self updateSuggestions];
  }
}

- (void)setStylingProvider:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_stylingProvider, a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v6 = [(MRUMediaSuggestionsViewController *)self view];
  id v7 = [v6 collectionView];
  uint64_t v8 = [v7 visibleCells];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setStylingProvider:v5];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_int64_t layout = a3;
    id v4 = [(MRUMediaSuggestionsViewController *)self viewIfLoaded];
    [v4 setLayout:a3];
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self->_contentEdgeInsets.top;
  if (self->_contentEdgeInsets.left != a3.left
    || v7 != top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets.double top = top;
    self->_contentEdgeInsets.double left = a3.left;
    self->_contentEdgeInsets.double bottom = a3.bottom;
    self->_contentEdgeInsets.double right = a3.right;
    id v11 = [(MRUMediaSuggestionsViewController *)self viewIfLoaded];
    objc_msgSend(v11, "setContentEdgeInsets:", top, left, bottom, right);
  }
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  if (self->_supportsHorizontalLayout != a3)
  {
    BOOL v3 = a3;
    self->_BOOL supportsHorizontalLayout = a3;
    id v4 = [(MRUMediaSuggestionsViewController *)self viewIfLoaded];
    [v4 setSupportsHorizontalLayout:v3];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v4 = [a3 indexPathsForSelectedItems];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = self->_dataSource;
  uint64_t v8 = [(UICollectionViewDiffableDataSource *)v7 itemIdentifierForIndexPath:a4];
  uint64_t v9 = [(NSDictionary *)self->_suggestions objectForKeyedSubscript:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__MRUMediaSuggestionsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v14[3] = &unk_1E5F0DC48;
  long long v15 = v7;
  id v16 = v8;
  id v17 = v6;
  id v11 = v6;
  id v12 = v8;
  long long v13 = v7;
  [WeakRetained mediaSuggestionsViewController:self didSelectSuggestion:v9 completion:v14];
}

void __77__MRUMediaSuggestionsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) indexPathForItemIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) deselectItemAtIndexPath:v2 animated:1];
}

- (void)updateSuggestions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_mediaSuggestions, "count"));
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_mediaSuggestions, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v5 = self->_mediaSuggestions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "identifier", (void)v17);

        if (v11)
        {
          id v12 = [v10 identifier];
          [v3 addObject:v12];

          long long v13 = [v10 identifier];
          [v4 setObject:v10 forKeyedSubscript:v13];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  long long v14 = (NSDictionary *)[v4 copy];
  suggestions = self->_suggestions;
  self->_suggestions = v14;

  id v16 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v16 appendSectionsWithIdentifiers:&unk_1F069F2A8];
  [v16 appendItemsWithIdentifiers:v3];
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v16 animatingDifferences:0];
}

- (void)updateCell:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSDictionary *)self->_suggestions objectForKeyedSubscript:v7];
  [v6 setSuggestionIdentifier:v7];
  uint64_t v9 = [v8 title];
  [v6 setTitle:v9];

  uint64_t v10 = [v8 artist];
  [v6 setSubtitle:v10];

  id v11 = +[MRUMediaSuggestionsCache sharedCache];
  id v12 = [v11 artworkForMediaSuggestion:v8];
  [v6 setArtworkImage:v12];

  long long v13 = +[MRUAssetsProvider sharedAssetsProvider];
  long long v14 = [v8 bundleID];
  long long v15 = [(MRUMediaSuggestionsViewController *)self view];
  id v16 = [v15 traitCollection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__MRUMediaSuggestionsViewController_updateCell_forIdentifier___block_invoke;
  v21[3] = &unk_1E5F0E598;
  id v22 = v6;
  id v23 = v7;
  id v24 = v8;
  id v17 = v8;
  id v18 = v7;
  id v19 = v6;
  [v13 applicationIconForBundleIdentifier:v14 traitCollection:v16 completion:v21];

  long long v20 = [(MRUMediaSuggestionsViewController *)self stylingProvider];
  [v19 setStylingProvider:v20];

  [v19 setLayout:self->_layout];
}

void __62__MRUMediaSuggestionsViewController_updateCell_forIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) suggestionIdentifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 40)];

  id v6 = MCLogCategoryDefault();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 48) bundleID];
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEBUG, "[MRUMediaSuggestionsVC] Loaded icon(%@) into cell", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MRUMediaSuggestionsViewController_updateCell_forIdentifier___block_invoke_18;
    block[3] = &unk_1E5F0DC48;
    long long v13 = *(id *)(a1 + 32);
    id v14 = v3;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v6 = v13;
  }
  else if (v7)
  {
    uint64_t v9 = [*(id *)(a1 + 48) bundleID];
    uint64_t v10 = [*(id *)(a1 + 32) suggestionIdentifier];
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEBUG, "[MRUMediaSuggestionsVC] Did not load icon(%@) into cell; Identifier mismatch (%@, %@)",
      buf,
      0x20u);
  }
}

void __62__MRUMediaSuggestionsViewController_updateCell_forIdentifier___block_invoke_18(uint64_t a1)
{
  [*(id *)(a1 + 32) setIconImage:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) bundleID];
  id v2 = +[MRUStringsProvider localizedNameForBundleIdentifier:v4];
  id v3 = [*(id *)(a1 + 32) iconImage];
  [v3 setAccessibilityLabel:v2];
}

- (NSArray)mediaSuggestions
{
  return self->_mediaSuggestions;
}

- (MRUMediaSuggestionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUMediaSuggestionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDictionary)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mediaSuggestions, 0);
}

@end