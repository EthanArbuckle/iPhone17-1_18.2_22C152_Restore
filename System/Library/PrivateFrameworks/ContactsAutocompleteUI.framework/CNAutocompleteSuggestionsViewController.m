@interface CNAutocompleteSuggestionsViewController
+ (id)os_log;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)suggestionsAreUpdating;
- (BOOL)useAccessibleLayout;
- (CGRect)latestKeyboardFrame;
- (CGSize)avatarSize;
- (CNAutocompleteSearchManager)searchManager;
- (CNAutocompleteSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNAutocompleteSuggestionsViewController)initWithOptions:(id)a3;
- (CNAutocompleteSuggestionsViewController)initWithSearchType:(unint64_t)a3;
- (CNAutocompleteSuggestionsViewControllerDelegate)delegate;
- (CNAutocompleteSuggestionsViewControllerOptions)options;
- (CNAvatarImageRenderer)avatarRenderer;
- (NSArray)items;
- (NSArray)otherRecipientAddresses;
- (NSArray)recipients;
- (NSArray)selectedRecipients;
- (NSDirectionalEdgeInsets)additionalContentInsets;
- (NSMutableArray)fetchedRecipients;
- (NSNumber)taskID;
- (NSObject)keyboardWillHideNotificationObserver;
- (NSObject)keyboardWillShowNotificationObserver;
- (NSString)suggestionsHeaderTitle;
- (OS_dispatch_source)suggestionsFetchDebounceTimer;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UICollectionViewLayout)layout;
- (id)compositionalLayout;
- (id)contactsForAvatarForRecipient:(id)a3;
- (id)selectedRecipientHandles;
- (id)suggestionPreWarmCompletionBlock;
- (id)unknownContactForRecipient:(id)a3;
- (void)adjustInsetsForKeyboardFrame:(CGRect)a3;
- (void)buildCollectionView;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)conformResultsForDeselection:(id)a3;
- (void)conformResultsForSelection;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)dealloc;
- (void)fetchRecipients;
- (void)fetchRecipientsIfNeeded;
- (void)fetchSuggestedRecipientsWithCompletionBlock:(id)a3;
- (void)finishedTaskWithID:(id)a3;
- (void)imageForRecipient:(id)a3 imageUpdateBlock:(id)a4;
- (void)invalidateSelectedRecipients;
- (void)prepareForReuse;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAdditionalContentInset:(NSDirectionalEdgeInsets)a3;
- (void)setAdditionalContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setAvatarRenderer:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setFetchedRecipients:(id)a3;
- (void)setItems:(id)a3;
- (void)setKeyboardWillHideNotificationObserver:(id)a3;
- (void)setKeyboardWillShowNotificationObserver:(id)a3;
- (void)setLatestKeyboardFrame:(CGRect)a3;
- (void)setLayout:(id)a3;
- (void)setOtherRecipientAddresses:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setRecipients:(id)a3 animated:(BOOL)a4;
- (void)setSearchManager:(id)a3;
- (void)setSelectedRecipients:(id)a3;
- (void)setSuggestionPreWarmCompletionBlock:(id)a3;
- (void)setSuggestionsAreUpdating:(BOOL)a3;
- (void)setSuggestionsFetchDebounceTimer:(id)a3;
- (void)setSuggestionsHeaderTitle:(id)a3;
- (void)setTaskID:(id)a3;
- (void)titleLabelTapped:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNAutocompleteSuggestionsViewController

+ (id)os_log
{
  if (os_log_cn_once_token_2 != -1) {
    dispatch_once(&os_log_cn_once_token_2, &__block_literal_global_1);
  }
  v2 = (void *)os_log_cn_once_object_2;

  return v2;
}

uint64_t __49__CNAutocompleteSuggestionsViewController_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "suggestions");
  uint64_t v1 = os_log_cn_once_object_2;
  os_log_cn_once_object_2 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNAutocompleteSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CNAutocompleteSuggestionsViewController initWithSearchType:](self, "initWithSearchType:", 1, a4);
}

- (CNAutocompleteSuggestionsViewController)initWithSearchType:(unint64_t)a3
{
  v5 = objc_alloc_init(CNAutocompleteSuggestionsViewControllerOptions);
  [(CNAutocompleteSuggestionsViewControllerOptions *)v5 setSearchType:a3];
  [(CNAutocompleteSuggestionsViewControllerOptions *)v5 setMaxNumberOfSuggestions:8];
  v6 = [(CNAutocompleteSuggestionsViewController *)self initWithOptions:v5];

  return v6;
}

- (CNAutocompleteSuggestionsViewController)initWithOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteSuggestionsViewController;
  v5 = [(CNAutocompleteSuggestionsViewController *)&v10 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    options = v5->_options;
    v5->_options = (CNAutocompleteSuggestionsViewControllerOptions *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(CNAutocompleteSuggestionsViewController *)self keyboardWillShowNotificationObserver];
  [v3 removeObserver:v4];

  v5 = [(CNAutocompleteSuggestionsViewController *)self keyboardWillHideNotificationObserver];
  [v3 removeObserver:v5];

  v6.receiver = self;
  v6.super_class = (Class)CNAutocompleteSuggestionsViewController;
  [(CNAutocompleteSuggestionsViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)CNAutocompleteSuggestionsViewController;
  [(CNAutocompleteSuggestionsViewController *)&v17 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  id v4 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v5 setInsetsLayoutMarginsFromSafeArea:0];

  objc_super v6 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v6 setClipsToBounds:1];

  [(CNAutocompleteSuggestionsViewController *)self buildCollectionView];
  [(CNAutocompleteSuggestionsViewController *)self setSuggestionPreWarmCompletionBlock:0];
  [(CNAutocompleteSuggestionsViewController *)self fetchRecipients];
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_initWeak(&location, self);
  uint64_t v8 = *MEMORY[0x1E4F43B88];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__CNAutocompleteSuggestionsViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E6128460;
  objc_copyWeak(&v15, &location);
  v9 = [v7 addObserverForName:v8 object:0 queue:0 usingBlock:v14];
  [(CNAutocompleteSuggestionsViewController *)self setKeyboardWillShowNotificationObserver:v9];

  uint64_t v10 = *MEMORY[0x1E4F43B80];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__CNAutocompleteSuggestionsViewController_viewDidLoad__block_invoke_2;
  v12[3] = &unk_1E6128460;
  objc_copyWeak(&v13, &location);
  v11 = [v7 addObserverForName:v10 object:0 queue:0 usingBlock:v12];
  [(CNAutocompleteSuggestionsViewController *)self setKeyboardWillHideNotificationObserver:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __54__CNAutocompleteSuggestionsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 userInfo];

  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F43AF0]];
  [v5 CGRectValue];
  objc_msgSend(WeakRetained, "setLatestKeyboardFrame:");

  [WeakRetained latestKeyboardFrame];
  objc_msgSend(WeakRetained, "adjustInsetsForKeyboardFrame:");
}

void __54__CNAutocompleteSuggestionsViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 userInfo];

  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F43AF0]];
  [v5 CGRectValue];
  objc_msgSend(WeakRetained, "setLatestKeyboardFrame:");

  [WeakRetained latestKeyboardFrame];
  objc_msgSend(WeakRetained, "adjustInsetsForKeyboardFrame:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNAutocompleteSuggestionsViewController;
  [(CNAutocompleteSuggestionsViewController *)&v4 viewWillAppear:a3];
  [(CNAutocompleteSuggestionsViewController *)self fetchRecipientsIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CNAutocompleteSuggestionsViewController;
  id v4 = a3;
  [(CNAutocompleteSuggestionsViewController *)&v12 traitCollectionDidChange:v4];
  v5 = [(CNAutocompleteSuggestionsViewController *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    uint64_t v8 = [(CNAutocompleteSuggestionsViewController *)self compositionalLayout];
    [(CNAutocompleteSuggestionsViewController *)self setLayout:v8];

    v9 = [(CNAutocompleteSuggestionsViewController *)self collectionView];
    uint64_t v10 = [(CNAutocompleteSuggestionsViewController *)self layout];
    [v9 setCollectionViewLayout:v10 animated:1];

    v11 = [(CNAutocompleteSuggestionsViewController *)self collectionView];
    [v11 reloadData];
  }
}

- (BOOL)useAccessibleLayout
{
  v2 = [(CNAutocompleteSuggestionsViewController *)self traitCollection];
  char v3 = isTraitCollectionAccessible(v2);

  return v3;
}

- (void)adjustInsetsForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v48 = [(CNAutocompleteSuggestionsViewController *)self collectionView];
  uint64_t v8 = [v48 window];
  objc_msgSend(v8, "convertRect:fromWindow:", 0, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v48, "convertRect:fromView:", 0, v10, v12, v14, v16);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [v48 frame];
  v52.origin.double x = v18;
  v52.origin.double y = v20;
  v52.size.double width = v22;
  v52.size.double height = v24;
  CGRect v51 = CGRectIntersection(v50, v52);
  double v25 = CGRectGetHeight(v51);
  v26 = [(CNAutocompleteSuggestionsViewController *)self collectionView];
  [v26 contentInset];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  [(CNAutocompleteSuggestionsViewController *)self additionalContentInsets];
  double v34 = v28 + v33;
  [(CNAutocompleteSuggestionsViewController *)self additionalContentInsets];
  double v36 = v25 + v35;
  v37 = [(CNAutocompleteSuggestionsViewController *)self collectionView];
  objc_msgSend(v37, "setContentInset:", v34, v30, v36, v32);

  v38 = [(CNAutocompleteSuggestionsViewController *)self collectionView];
  [v38 contentInset];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  v47 = [(CNAutocompleteSuggestionsViewController *)self collectionView];
  objc_msgSend(v47, "setVerticalScrollIndicatorInsets:", v40, v42, v44, v46);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteSuggestionsViewController;
  id v7 = a4;
  -[CNAutocompleteSuggestionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__CNAutocompleteSuggestionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6128488;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __94__CNAutocompleteSuggestionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 reloadData];
}

- (void)setAdditionalContentInset:(NSDirectionalEdgeInsets)a3
{
  if (self->_additionalContentInsets.leading != a3.leading
    || self->_additionalContentInsets.top != a3.top
    || self->_additionalContentInsets.trailing != a3.trailing
    || self->_additionalContentInsets.bottom != a3.bottom)
  {
    self->_additionalContentInsets = a3;
    [(CNAutocompleteSuggestionsViewController *)self latestKeyboardFrame];
    -[CNAutocompleteSuggestionsViewController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
  }
}

- (void)titleLabelTapped:(id)a3
{
  id v4 = [(CNAutocompleteSuggestionsViewController *)self delegate];
  [v4 suggestionsControllerTitleLabelWasTapped:self];
}

- (void)prepareForReuse
{
  -[CNAutocompleteSuggestionsViewController setAdditionalContentInsets:](self, "setAdditionalContentInsets:", *MEMORY[0x1E4F424F0], *(double *)(MEMORY[0x1E4F424F0] + 8), *(double *)(MEMORY[0x1E4F424F0] + 16), *(double *)(MEMORY[0x1E4F424F0] + 24));
  -[CNAutocompleteSuggestionsViewController setLatestKeyboardFrame:](self, "setLatestKeyboardFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNAutocompleteSuggestionsViewController *)self latestKeyboardFrame];
  -[CNAutocompleteSuggestionsViewController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
  [(CNAutocompleteSuggestionsViewController *)self setRecipients:0];

  [(CNAutocompleteSuggestionsViewController *)self setTaskID:0];
}

- (id)compositionalLayout
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if ([(CNAutocompleteSuggestionsViewController *)self useAccessibleLayout]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.25;
  }
  if ([(CNAutocompleteSuggestionsViewController *)self useAccessibleLayout]) {
    double v4 = 96.0;
  }
  else {
    double v4 = 140.0;
  }
  v5 = (void *)MEMORY[0x1E4F42638];
  objc_super v6 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v3];
  id v7 = [MEMORY[0x1E4F42608] estimatedDimension:v4];
  uint64_t v8 = [v5 sizeWithWidthDimension:v6 heightDimension:v7];

  objc_super v9 = (void *)MEMORY[0x1E4F42638];
  double v10 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  double v11 = [MEMORY[0x1E4F42608] estimatedDimension:v4];
  double v12 = [v9 sizeWithWidthDimension:v10 heightDimension:v11];

  double v13 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v8];
  objc_msgSend(v13, "setContentInsets:", 10.0, 5.0, 10.0, 5.0);
  double v14 = (void *)MEMORY[0x1E4F42618];
  v27[0] = v13;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  double v16 = [v14 horizontalGroupWithLayoutSize:v12 subitems:v15];

  double v17 = [MEMORY[0x1E4F42630] sectionWithGroup:v16];
  objc_msgSend(v17, "setContentInsets:", 10.0, 10.0, 10.0, 10.0);
  [v17 setInterGroupSpacing:0.0];
  CGFloat v18 = (void *)MEMORY[0x1E4F42638];
  double v19 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  CGFloat v20 = [MEMORY[0x1E4F42608] estimatedDimension:44.0];
  double v21 = [v18 sizeWithWidthDimension:v19 heightDimension:v20];

  CGFloat v22 = [MEMORY[0x1E4F425F8] boundarySupplementaryItemWithLayoutSize:v21 elementKind:*MEMORY[0x1E4F43758] alignment:1];
  objc_msgSend(v22, "setContentInsets:", 0.0, 3.0, 0.0, 3.0);
  v26 = v22;
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v17 setBoundarySupplementaryItems:v23];

  CGFloat v24 = (void *)[objc_alloc(MEMORY[0x1E4F42870]) initWithSection:v17];

  return v24;
}

- (void)buildCollectionView
{
  double v3 = [(CNAutocompleteSuggestionsViewController *)self compositionalLayout];
  [(CNAutocompleteSuggestionsViewController *)self setLayout:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F42858]);
  v5 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v5 bounds];
  double v7 = v6 + 0.0;
  uint64_t v8 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v11 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v11 bounds];
  double v13 = v12;
  double v14 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v17 = [(CNAutocompleteSuggestionsViewController *)self layout];
  CGFloat v18 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v17, v7, v10, v13, v16);

  [v18 setDelegate:self];
  double v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  CGFloat v20 = [v19 localizedStringForKey:@"ZKW_SUGGESTIONS" value:&stru_1F0EC0C28 table:@"Localized"];
  [v18 setAccessibilityLabel:v20];

  objc_initWeak(&location, self);
  id v21 = objc_alloc(MEMORY[0x1E4F42880]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke;
  v31[3] = &unk_1E61284D8;
  objc_copyWeak(&v32, &location);
  CGFloat v22 = (void *)[v21 initWithCollectionView:v18 cellProvider:v31];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke_3;
  v29[3] = &unk_1E6128500;
  objc_copyWeak(&v30, &location);
  [v22 setSupplementaryViewProvider:v29];
  [(CNAutocompleteSuggestionsViewController *)self setDiffableDataSource:v22];
  [v18 setDataSource:v22];
  [v18 setClipsToBounds:0];
  uint64_t v23 = objc_opt_class();
  CGFloat v24 = +[CNAutocompleteSuggestionsCell cellIdentifier];
  [v18 registerClass:v23 forCellWithReuseIdentifier:v24];

  uint64_t v25 = objc_opt_class();
  v26 = +[CNAutocompleteSuggestionsViewSectionHeader reuseIdentifier];
  [v18 registerClass:v25 forSupplementaryViewOfKind:*MEMORY[0x1E4F43758] withReuseIdentifier:v26];

  double v27 = [MEMORY[0x1E4F428B8] clearColor];
  [v18 setBackgroundColor:v27];

  [v18 setAlwaysBounceVertical:0];
  [v18 setShowsVerticalScrollIndicator:0];
  [v18 setShowsHorizontalScrollIndicator:0];
  [v18 setContentInsetAdjustmentBehavior:2];
  [v18 setAutomaticallyAdjustsScrollIndicatorInsets:0];
  double v28 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v28 addSubview:v18];

  [v18 setAutoresizingMask:18];
  [(CNAutocompleteSuggestionsViewController *)self setCollectionView:v18];
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

id __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = +[CNAutocompleteSuggestionsCell cellIdentifier];
  double v9 = [v6 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v5];

  double v10 = [WeakRetained items];
  uint64_t v11 = [v5 item];

  double v12 = [v10 objectAtIndexedSubscript:v11];

  double v13 = [v12 title];
  [v9 setDisplayString:v13];

  double v14 = [v12 recipient];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke_2;
  v17[3] = &unk_1E61284B0;
  id v15 = v9;
  id v18 = v15;
  [WeakRetained imageForRecipient:v14 imageUpdateBlock:v17];

  return v15;
}

uint64_t __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2];
}

id __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ((id)*MEMORY[0x1E4F43758] == v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    double v12 = +[CNAutocompleteSuggestionsViewSectionHeader reuseIdentifier];
    id v10 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v12 forIndexPath:v9];

    double v13 = [WeakRetained suggestionsHeaderTitle];
    double v14 = [v10 titleLabel];
    [v14 setText:v13];

    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:WeakRetained action:sel_titleLabelTapped_];
    [v15 setNumberOfTapsRequired:1];
    [v10 addGestureRecognizer:v15];
    [v10 setUserInteractionEnabled:1];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F42850]);
  }

  return v10;
}

- (void)fetchRecipientsIfNeeded
{
  double v3 = [(CNAutocompleteSuggestionsViewController *)self recipients];

  if (!v3)
  {
    [(CNAutocompleteSuggestionsViewController *)self fetchRecipients];
  }
}

- (void)setOtherRecipientAddresses:(id)a3
{
  id v5 = a3;
  if ((-[NSArray isEqual:](self->_otherRecipientAddresses, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_otherRecipientAddresses, a3);
    if ([(CNAutocompleteSuggestionsViewController *)self isViewLoaded]) {
      [(CNAutocompleteSuggestionsViewController *)self fetchRecipients];
    }
  }
}

- (void)fetchRecipients
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v3 = [(CNAutocompleteSuggestionsViewController *)self taskID];

  if (v3)
  {
    id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5AF5000, v4, OS_LOG_TYPE_INFO, "Suggestions fetchRecipients called while fetch already in flight, ignoring", buf, 2u);
    }
  }
  else
  {
    id v5 = [(CNAutocompleteSuggestionsViewController *)self searchManager];

    if (!v5)
    {
      id v6 = [CNAutocompleteSearchManager alloc];
      id v7 = [(CNAutocompleteSuggestionsViewController *)self options];
      id v8 = -[CNAutocompleteSearchManager initWithAutocompleteSearchType:](v6, "initWithAutocompleteSearchType:", [v7 searchType]);
      [(CNAutocompleteSuggestionsViewController *)self setSearchManager:v8];
    }
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = [(CNAutocompleteSuggestionsViewController *)self otherRecipientAddresses];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          [v4 addObject:*(void *)(*((void *)&v29 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v11);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v14 = [(CNAutocompleteSuggestionsViewController *)self selectedRecipients];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = [*(id *)(*((void *)&v25 + 1) + 8 * v18) address];
          [v4 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v16);
    }

    id v20 = objc_alloc_init(MEMORY[0x1E4F5A060]);
    id v21 = [v4 copy];
    [v20 setOtherAddressesAlreadyChosen:v21];

    CGFloat v22 = [MEMORY[0x1E4F1CA48] array];
    [(CNAutocompleteSuggestionsViewController *)self setFetchedRecipients:v22];

    uint64_t v23 = [(CNAutocompleteSuggestionsViewController *)self searchManager];
    CGFloat v24 = [v23 searchForText:&stru_1F0EC0C28 withAutocompleteFetchContext:v20 consumer:self];
    [(CNAutocompleteSuggestionsViewController *)self setTaskID:v24];
  }
}

- (void)fetchSuggestedRecipientsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(CNAutocompleteSuggestionsViewController *)self setTaskID:&unk_1F0ECF3A0];
  id v5 = (void *)[v4 copy];

  [(CNAutocompleteSuggestionsViewController *)self setSuggestionPreWarmCompletionBlock:v5];

  [(CNAutocompleteSuggestionsViewController *)self fetchRecipients];
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if ([v6 integerValue] == -1
    && ([(CNAutocompleteSuggestionsViewController *)self suggestionPreWarmCompletionBlock], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    double v14 = [(CNAutocompleteSuggestionsViewController *)self suggestionPreWarmCompletionBlock];
    ((void (**)(void, id))v14)[2](v14, v15);

    [(CNAutocompleteSuggestionsViewController *)self setSuggestionPreWarmCompletionBlock:0];
  }
  else
  {
    id v7 = [(CNAutocompleteSuggestionsViewController *)self taskID];
    int v8 = [v7 isEqualToNumber:v6];

    if (v8)
    {
      id v9 = [(CNAutocompleteSuggestionsViewController *)self fetchedRecipients];
      [v9 addObjectsFromArray:v15];

      uint64_t v10 = [(CNAutocompleteSuggestionsViewController *)self fetchedRecipients];
      uint64_t v11 = objc_msgSend(v10, "_cn_take:", 8);
      uint64_t v12 = (void *)[v11 copy];
      [(CNAutocompleteSuggestionsViewController *)self setRecipients:v12];
    }
  }
}

- (void)finishedTaskWithID:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(CNAutocompleteSuggestionsViewController *)self taskID];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(CNAutocompleteSuggestionsViewController *)self taskID];
    int v7 = [v10 isEqualToNumber:v6];

    if (v7)
    {
      int v8 = [(CNAutocompleteSuggestionsViewController *)self fetchedRecipients];
      uint64_t v9 = [v8 count];

      if (!v9) {
        [(CNAutocompleteSuggestionsViewController *)self setRecipients:MEMORY[0x1E4F1CBF0]];
      }
      [(CNAutocompleteSuggestionsViewController *)self setTaskID:0];
    }
  }
}

- (void)setRecipients:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  int v7 = (NSArray *)a3;
  if (self->_recipients != v7)
  {
    objc_storeStrong((id *)&self->_recipients, a3);
    int v8 = [(NSArray *)v7 _cn_map:&__block_literal_global_142];
    [(CNAutocompleteSuggestionsViewController *)self setItems:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F42650]);
    if ([(NSArray *)v7 count])
    {
      v14[0] = @"Main";
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [v9 appendSectionsWithIdentifiers:v10];

      uint64_t v11 = [(CNAutocompleteSuggestionsViewController *)self items];
      [v9 appendItemsWithIdentifiers:v11];
    }
    uint64_t v12 = [(CNAutocompleteSuggestionsViewController *)self diffableDataSource];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__CNAutocompleteSuggestionsViewController_setRecipients_animated___block_invoke_2;
    v13[3] = &unk_1E6128548;
    v13[4] = self;
    [v12 applySnapshot:v9 animatingDifferences:v4 completion:v13];
  }
  [(CNAutocompleteSuggestionsViewController *)self setSuggestionsAreUpdating:0];
}

CNSuggestedRecipientItem *__66__CNAutocompleteSuggestionsViewController_setRecipients_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [[CNSuggestedRecipientItem alloc] initWithRecipient:v2];

  return v3;
}

uint64_t __66__CNAutocompleteSuggestionsViewController_setRecipients_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSuggestionsAreUpdating:0];
}

- (void)setRecipients:(id)a3
{
}

- (CGSize)avatarSize
{
  if ([(CNAutocompleteSuggestionsViewController *)self useAccessibleLayout]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 4.0;
  }
  BOOL v4 = [(CNAutocompleteSuggestionsViewController *)self view];
  [v4 bounds];
  double v5 = (CGRectGetWidth(v10) + (v3 + 1.0) * -20.0) / v3;

  BOOL v6 = [(CNAutocompleteSuggestionsViewController *)self useAccessibleLayout];
  double v7 = 80.0;
  if (v6) {
    double v7 = 60.0;
  }
  if (v7 >= v5) {
    double v7 = v5;
  }
  double v8 = v7;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)imageForRecipient:(id)a3 imageUpdateBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CNAutocompleteSuggestionsViewController *)self avatarRenderer];

  if (!v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1BB20]);
    CGRect v10 = [MEMORY[0x1E4F1BB28] defaultSettingsWithCacheSize:8];
    uint64_t v11 = (void *)[v9 initWithSettings:v10];
    [(CNAutocompleteSuggestionsViewController *)self setAvatarRenderer:v11];
  }
  [(CNAutocompleteSuggestionsViewController *)self avatarSize];
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(CNAutocompleteSuggestionsViewController *)self view];
  uint64_t v17 = [v16 window];
  uint64_t v18 = [(id)v17 screen];
  [v18 scale];
  double v20 = v19;

  id v21 = [(CNAutocompleteSuggestionsViewController *)self delegate];
  LOBYTE(v17) = objc_opt_respondsToSelector();

  if ((v17 & 1) == 0) {
    goto LABEL_14;
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke;
  v43[3] = &unk_1E6128598;
  double v45 = v13;
  double v46 = v15;
  double v47 = v20;
  id v44 = v7;
  CGFloat v22 = (void *)MEMORY[0x1BA9A6470](v43);
  uint64_t v23 = [(CNAutocompleteSuggestionsViewController *)self delegate];
  char v24 = [v23 suggestionsController:self imageDataForRecipient:v6 imageUpdateBlock:v22];

  if ((v24 & 1) == 0)
  {
LABEL_14:
    if ([v6 isGroup])
    {
      long long v25 = objc_alloc_init(CNAUIMessagesImagesFacade);
      long long v26 = [v6 autocompleteResult];
      long long v27 = [(CNAUIMessagesImagesFacade *)v25 imageForResult:v26];

      if (v27)
      {
        long long v28 = +[CNUIImage resizeImage:v27 toFitWidth:v13 scale:v20];

        long long v29 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
        long long v30 = [v29 schedulerProvider];
        long long v31 = [v30 mainThreadScheduler];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_3;
        v40[3] = &unk_1E6128570;
        long long v32 = &v42;
        double v41 = v28;
        id v42 = v7;
        id v33 = v28;
        [v31 performBlock:v40];

        double v34 = v41;
LABEL_10:

        goto LABEL_11;
      }
    }
    long long v25 = [(CNAutocompleteSuggestionsViewController *)self contactsForAvatarForRecipient:v6];
    double v35 = [(CNAutocompleteSuggestionsViewController *)self traitCollection];
    BOOL v36 = [v35 layoutDirection] == 1;

    objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v36, 0, v13, v15, v20);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    double v34 = [(CNAutocompleteSuggestionsViewController *)self avatarRenderer];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_4;
    v38[3] = &unk_1E61285C0;
    long long v32 = &v39;
    id v39 = v7;
    id v37 = (id)[v34 renderAvatarsForContacts:v25 scope:v33 imageHandler:v38];
    goto LABEL_10;
  }
LABEL_11:
}

void __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [MEMORY[0x1E4F42A80] imageWithData:a2];
  BOOL v4 = +[CNUIImage resizeImage:v3 toFitWidth:*(double *)(a1 + 40) scale:*(double *)(a1 + 56)];

  double v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v6 = [v5 schedulerProvider];
  id v7 = [v6 mainThreadScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_2;
  v10[3] = &unk_1E6128570;
  id v8 = *(id *)(a1 + 32);
  id v11 = v4;
  id v12 = v8;
  id v9 = v4;
  [v7 performBlock:v10];
}

uint64_t __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  double v5 = [v4 schedulerProvider];
  id v6 = [v5 mainThreadScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_5;
  v9[3] = &unk_1E6128570;
  id v7 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  [v6 performBlock:v9];
}

uint64_t __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)contactsForAvatarForRecipient:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
  v17[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  if (v4)
  {
    if ([v4 isGroup])
    {
      id v7 = [v4 children];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __73__CNAutocompleteSuggestionsViewController_contactsForAvatarForRecipient___block_invoke;
      v14[3] = &unk_1E61285E8;
      void v14[4] = self;
      uint64_t v8 = objc_msgSend(v7, "_cn_map:", v14);
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1BB20] descriptorForRequiredKeys];
      uint64_t v16 = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      id v7 = [v4 contactWithKeysToFetch:v10];

      if (!v7)
      {
        id v7 = [(CNAutocompleteSuggestionsViewController *)self unknownContactForRecipient:v4];
      }
      double v15 = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    }
    id v11 = (void *)v8;

    id v6 = v11;
  }
  id v12 = v6;

  return v12;
}

id __73__CNAutocompleteSuggestionsViewController_contactsForAvatarForRecipient___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1BB20] descriptorForRequiredKeys];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [v3 contactWithKeysToFetch:v5];

  if (!v6)
  {
    id v6 = [*(id *)(a1 + 32) unknownContactForRecipient:v3];
  }

  return v6;
}

- (id)unknownContactForRecipient:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  id v5 = [v3 compositeName];
  id v6 = [v3 address];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F5A470];
    id v9 = [v3 displayString];
    id v10 = [v8 componentsFromString:v9];

    id v11 = [v10 givenName];
    [v4 setGivenName:v11];

    id v12 = [v10 familyName];
    [v4 setFamilyName:v12];
  }
  if ([v3 kind] == 1)
  {
    double v13 = (void *)MEMORY[0x1E4F1BA70];
    double v14 = [v3 normalizedAddress];
    double v15 = [v13 phoneNumberWithStringValue:v14];

    uint64_t v16 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v15];
    v22[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v4 setPhoneNumbers:v17];
  }
  else
  {
    if ([v3 kind]) {
      goto LABEL_8;
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F1BA20];
    double v19 = [v3 normalizedAddress];
    double v15 = [v18 labeledValueWithLabel:0 value:v19];

    id v21 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v4 setEmailAddresses:v16];
  }

LABEL_8:

  return v4;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return ![(CNAutocompleteSuggestionsViewController *)self suggestionsAreUpdating];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSuggestionsViewController *)self items];
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v10 setIsSelected:1];
  char v7 = [(CNAutocompleteSuggestionsViewController *)self delegate];
  uint64_t v8 = [v10 recipient];
  [v7 suggestionsController:self didSelectRecipient:v8];

  id v9 = [(CNAutocompleteSuggestionsViewController *)self collectionView];
  [v9 deselectItemAtIndexPath:v5 animated:1];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(CNAutocompleteSuggestionsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNAutocompleteSuggestionsViewController *)self delegate];
    [v6 suggestionsControllerWillBeginScroll:self];
  }
}

- (void)invalidateSelectedRecipients
{
  id v3 = [(CNAutocompleteSuggestionsViewController *)self suggestionsFetchDebounceTimer];

  if (v3)
  {
    id v4 = [(CNAutocompleteSuggestionsViewController *)self suggestionsFetchDebounceTimer];
    dispatch_source_cancel(v4);

    [(CNAutocompleteSuggestionsViewController *)self setSuggestionsFetchDebounceTimer:0];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CNAutocompleteSuggestionsViewController_invalidateSelectedRecipients__block_invoke;
  v6[3] = &unk_1E6128548;
  v6[4] = self;
  char v5 = CreateSuggestionsFetchDebounceDispatchTimer(MEMORY[0x1E4F14428], v6, 0.2);
  [(CNAutocompleteSuggestionsViewController *)self setSuggestionsFetchDebounceTimer:v5];
}

void __71__CNAutocompleteSuggestionsViewController_invalidateSelectedRecipients__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSuggestionsAreUpdating:1];
  id v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 selectedRecipientsForSuggestionsController:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) setSelectedRecipients:v3];
  [*(id *)(a1 + 32) fetchRecipients];
}

- (id)selectedRecipientHandles
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNAutocompleteSuggestionsViewController *)self delegate];
  id v4 = [v3 selectedRecipientsForSuggestionsController:self];

  char v5 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "normalizedAddress", (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)conformResultsForSelection
{
  id v3 = [(CNAutocompleteSuggestionsViewController *)self selectedRecipientHandles];
  id v4 = [(CNAutocompleteSuggestionsViewController *)self items];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CNAutocompleteSuggestionsViewController_conformResultsForSelection__block_invoke;
  v6[3] = &unk_1E6128610;
  id v7 = v3;
  uint64_t v8 = self;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __69__CNAutocompleteSuggestionsViewController_conformResultsForSelection__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  int v5 = [v8 isSelectedForHandles:*(void *)(a1 + 32)];
  if (([v8 isSelected] & 1) == 0 && v5)
  {
    [v8 setIsSelected:1];
    id v6 = [*(id *)(a1 + 40) collectionView];
    id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
    [v6 selectItemAtIndexPath:v7 animated:1 scrollPosition:0];
  }
}

- (void)conformResultsForDeselection:(id)a3
{
  id v4 = a3;
  int v5 = [(CNAutocompleteSuggestionsViewController *)self items];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CNAutocompleteSuggestionsViewController_conformResultsForDeselection___block_invoke;
  v7[3] = &unk_1E6128610;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __72__CNAutocompleteSuggestionsViewController_conformResultsForDeselection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  int v5 = [*(id *)(a1 + 32) handles];
  int v6 = [v12 shouldDeselectForHandles:v5];

  if ([v12 isSelected] && v6)
  {
    [v12 setIsSelected:0];
    id v7 = [*(id *)(a1 + 40) delegate];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [v12 recipient];
    [v7 suggestionsController:v8 didDeselectRecipient:v9];

    id v10 = [*(id *)(a1 + 40) collectionView];
    id v11 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
    [v10 deselectItemAtIndexPath:v11 animated:1];
  }
}

- (CNAutocompleteSuggestionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAutocompleteSuggestionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSArray)otherRecipientAddresses
{
  return self->_otherRecipientAddresses;
}

- (NSString)suggestionsHeaderTitle
{
  return self->_suggestionsHeaderTitle;
}

- (void)setSuggestionsHeaderTitle:(id)a3
{
}

- (NSDirectionalEdgeInsets)additionalContentInsets
{
  double top = self->_additionalContentInsets.top;
  double leading = self->_additionalContentInsets.leading;
  double bottom = self->_additionalContentInsets.bottom;
  double trailing = self->_additionalContentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setAdditionalContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_additionalContentInsets = a3;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (NSNumber)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
}

- (NSArray)selectedRecipients
{
  return self->_selectedRecipients;
}

- (void)setSelectedRecipients:(id)a3
{
}

- (CNAutocompleteSearchManager)searchManager
{
  return self->_searchManager;
}

- (void)setSearchManager:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (NSMutableArray)fetchedRecipients
{
  return self->_fetchedRecipients;
}

- (void)setFetchedRecipients:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (BOOL)suggestionsAreUpdating
{
  return self->_suggestionsAreUpdating;
}

- (void)setSuggestionsAreUpdating:(BOOL)a3
{
  self->_suggestionsAreUpdating = a3;
}

- (CNAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (void)setAvatarRenderer:(id)a3
{
}

- (NSObject)keyboardWillShowNotificationObserver
{
  return self->_keyboardWillShowNotificationObserver;
}

- (void)setKeyboardWillShowNotificationObserver:(id)a3
{
}

- (NSObject)keyboardWillHideNotificationObserver
{
  return self->_keyboardWillHideNotificationObserver;
}

- (void)setKeyboardWillHideNotificationObserver:(id)a3
{
}

- (CGRect)latestKeyboardFrame
{
  double x = self->_latestKeyboardFrame.origin.x;
  double y = self->_latestKeyboardFrame.origin.y;
  double width = self->_latestKeyboardFrame.size.width;
  double height = self->_latestKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLatestKeyboardFrame:(CGRect)a3
{
  self->_latestKeyboardFrame = a3;
}

- (id)suggestionPreWarmCompletionBlock
{
  return self->_suggestionPreWarmCompletionBlock;
}

- (void)setSuggestionPreWarmCompletionBlock:(id)a3
{
}

- (OS_dispatch_source)suggestionsFetchDebounceTimer
{
  return self->_suggestionsFetchDebounceTimer;
}

- (void)setSuggestionsFetchDebounceTimer:(id)a3
{
}

- (CNAutocompleteSuggestionsViewControllerOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_suggestionsFetchDebounceTimer, 0);
  objc_storeStrong(&self->_suggestionPreWarmCompletionBlock, 0);
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, 0);
  objc_storeStrong((id *)&self->_keyboardWillShowNotificationObserver, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_fetchedRecipients, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_selectedRecipients, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_suggestionsHeaderTitle, 0);
  objc_storeStrong((id *)&self->_otherRecipientAddresses, 0);
  objc_storeStrong((id *)&self->_recipients, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end