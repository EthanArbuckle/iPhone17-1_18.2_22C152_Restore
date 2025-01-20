@interface GKChallengePlayerPickerViewController
- (BOOL)shouldApplyInitialOffset;
- (BOOL)shouldIgnoreClearSelection;
- (BOOL)textFieldShouldReturn:(id)a3;
- (GKChallenge)challenge;
- (GKChallengePlayerPickerViewController)initWithChallenge:(id)a3 initiallySelectedPlayers:(id)a4;
- (NSArray)initiallySelectedPlayers;
- (NSLayoutConstraint)scrollingHeaderTopConstraint;
- (NSString)message;
- (UIButton)cancelButton;
- (UIButton)sendButton;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UISearchBar)searchBar;
- (UITextField)messageField;
- (UIView)scrollingHeader;
- (UIView)titleView;
- (UIViewController)composeController;
- (id)completionHandler;
- (id)inviteFriendHandler;
- (id)preferredFocusEnvironments;
- (void)addMessage:(id)a3;
- (void)applyInitialContentOffset;
- (void)cancel:(id)a3;
- (void)clearSelection;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureButtonsFocusEffect;
- (void)configureCollectionView;
- (void)configureFocusGuides;
- (void)dataUpdated:(BOOL)a3 withError:(id)a4;
- (void)dealloc;
- (void)loadData;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)selectPlayersAtIndexPaths:(id)a3;
- (void)send:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setComposeController:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setInitiallySelectedPlayers:(id)a3;
- (void)setInviteFriendHandler:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageField:(id)a3;
- (void)setScrollingHeader:(id)a3;
- (void)setScrollingHeaderTopConstraint:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSendButton:(id)a3;
- (void)setShouldApplyInitialOffset:(BOOL)a3;
- (void)setShouldIgnoreClearSelection:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setupNoContentView:(id)a3 withError:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateButtonEnableState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation GKChallengePlayerPickerViewController

- (GKChallengePlayerPickerViewController)initWithChallenge:(id)a3 initiallySelectedPlayers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() _gkPlatformNibName];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v15.receiver = self;
  v15.super_class = (Class)GKChallengePlayerPickerViewController;
  v10 = [(GKDashboardCollectionViewController *)&v15 initWithNibName:v8 bundle:v9];

  if (v10)
  {
    [(GKChallengePlayerPickerViewController *)v10 setChallenge:v6];
    [(GKChallengePlayerPickerViewController *)v10 setInitiallySelectedPlayers:v7];
    v11 = [[GKDashboardChallengePlayerPickerDataSource alloc] initWithChallenge:v6];
    [(GKDashboardChallengePlayerPickerDataSource *)v11 setShowingFriendSuggestions:1];
    [(GKDashboardCollectionViewController *)v10 setDataSource:v11];
    v12 = GKGameCenterUIFrameworkBundle();
    v13 = GKGetLocalizedStringFromTableInBundle();
    [(GKChallengePlayerPickerViewController *)v10 setTitle:v13];

    [(GKLoadingViewController *)v10 setLoadingIndicatorDelay:0.0];
  }

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F636C8] daemonProxy];
  [v3 removeDataUpdateDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v47 viewDidLoad];
  v3 = [MEMORY[0x1E4F636C8] daemonProxy];
  [v3 addDataUpdateDelegate:self];

  objc_initWeak(&location, self);
  objc_super v4 = [(GKDashboardCollectionViewController *)self dataSource];
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  v43 = __52__GKChallengePlayerPickerViewController_viewDidLoad__block_invoke;
  v44 = &unk_1E5F636C8;
  objc_copyWeak(&v45, &location);
  [v4 setInviteFriendHandler:&v41];

  v5 = [(GKChallengePlayerPickerViewController *)self searchBar];
  [v5 setShowsCancelButton:0];

  id v6 = [(GKChallengePlayerPickerViewController *)self navigationItem];
  [v6 _setAutoScrollEdgeTransitionDistance:40.0];

  id v7 = [(GKChallengePlayerPickerViewController *)self navigationItem];
  [v7 _setManualScrollEdgeAppearanceEnabled:1];

  v8 = [(GKChallengePlayerPickerViewController *)self title];
  v9 = [(GKChallengePlayerPickerViewController *)self navigationItem];
  [v9 setTitle:v8];

  [(GKChallengePlayerPickerViewController *)self setOverrideUserInterfaceStyle:2];
  v10 = [(GKChallengePlayerPickerViewController *)self navigationController];
  [v10 setNavigationBarHidden:1];

  v11 = [(GKChallenge *)self->_challenge detailGoalText];
  [(UILabel *)self->_descriptionLabel setText:v11];

  v12 = [(GKDashboardCollectionViewController *)self collectionView];
  [(GKDashboardCollectionViewController *)self setToHorizontalLayout:0];
  [(GKDashboardCollectionViewController *)self setAutoWidthUsesTwoColumnsWhenSpace:0];
  id v13 = [v12 collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 setCentersItemsInExcessSpace:1];
    [v13 setFocusScaleFactor:1.0];
  }
  [v12 setDelegate:self];
  [v12 setClipsToBounds:1];
  if (self->_scrollingHeaderTopConstraint)
  {
    [(GKChallengePlayerPickerViewController *)self setShouldApplyInitialOffset:1];
    [v12 contentInset];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(UIView *)self->_scrollingHeader bounds];
    objc_msgSend(v12, "setContentInset:", v20, v15, v17, v19);
  }
  if (!self->_sendButton)
  {
    id v21 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v22 = GKGameCenterUIFrameworkBundle();
    v23 = GKGetLocalizedStringFromTableInBundle();
    v24 = (void *)[v21 initWithTitle:v23 style:2 target:self action:sel_send_];
    v25 = [(GKChallengePlayerPickerViewController *)self navigationItem];
    [v25 setRightBarButtonItem:v24];
  }
  [(GKChallengePlayerPickerViewController *)self configureCollectionView];
  v26 = [(GKChallengePlayerPickerViewController *)self title];
  v27 = [(GKChallengePlayerPickerViewController *)self titleLabel];
  [v27 setText:v26];

  v28 = GKGameCenterUIFrameworkBundle();
  v29 = GKGetLocalizedStringFromTableInBundle();
  v30 = [(GKChallengePlayerPickerViewController *)self searchBar];
  [v30 setPlaceholder:v29];

  v31 = [(GKChallengePlayerPickerViewController *)self searchBar];
  v32 = [v31 cancelButton];
  v33 = GKGameCenterUIFrameworkBundle();
  v34 = GKGetLocalizedStringFromTableInBundle();
  [v32 setTitle:v34 forState:0];

  v35 = [(GKChallengePlayerPickerViewController *)self sendButton];
  v36 = GKGameCenterUIFrameworkBundle();
  v37 = GKGetLocalizedStringFromTableInBundle();
  [v35 setTitle:v37 forState:0];

  v38 = [(GKChallengePlayerPickerViewController *)self cancelButton];
  v39 = GKGameCenterUIFrameworkBundle();
  v40 = GKGetLocalizedStringFromTableInBundle();
  [v38 setTitle:v40 forState:0];

  [(GKChallengePlayerPickerViewController *)self updateButtonEnableState];
  [(GKChallengePlayerPickerViewController *)self configureButtonsFocusEffect];
  [(GKChallengePlayerPickerViewController *)self configureFocusGuides];

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);
}

void __52__GKChallengePlayerPickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained inviteFriendHandler];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    id v7 = [v6 inviteFriendHandler];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)configureButtonsFocusEffect
{
  v3 = [(GKChallengePlayerPickerViewController *)self sendButton];
  [v3 bounds];
  CGRect v22 = CGRectInset(v21, -8.0, -4.0);
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;

  uint64_t v8 = *MEMORY[0x1E4F39EA8];
  v9 = objc_msgSend(MEMORY[0x1E4FB1788], "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E4F39EA8], x, y, width, height, 8.0);
  v10 = [(GKChallengePlayerPickerViewController *)self sendButton];
  [v10 setFocusEffect:v9];

  v11 = [(GKChallengePlayerPickerViewController *)self cancelButton];
  [v11 bounds];
  CGRect v24 = CGRectInset(v23, -8.0, -4.0);
  double v12 = v24.origin.x;
  double v13 = v24.origin.y;
  double v14 = v24.size.width;
  double v15 = v24.size.height;

  double v16 = objc_msgSend(MEMORY[0x1E4FB1788], "effectWithRoundedRect:cornerRadius:curve:", v8, v12, v13, v14, v15, 8.0);
  double v17 = [(GKChallengePlayerPickerViewController *)self cancelButton];
  [v17 setFocusEffect:v16];

  id v19 = [MEMORY[0x1E4FB1618] whiteColor];
  double v18 = [(GKChallengePlayerPickerViewController *)self view];
  [v18 setTintColor:v19];
}

- (void)configureFocusGuides
{
  v52[1] = *MEMORY[0x1E4F143B8];
  v3 = [(GKChallengePlayerPickerViewController *)self cancelButton];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1780]);
    v5 = [(GKChallengePlayerPickerViewController *)self cancelButton];
    v52[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    [v4 setPreferredFocusEnvironments:v6];

    id v7 = [(GKChallengePlayerPickerViewController *)self view];
    [v7 addLayoutGuide:v4];

    v33 = (void *)MEMORY[0x1E4F28DC8];
    id v45 = [v4 leadingAnchor];
    objc_super v47 = [(GKChallengePlayerPickerViewController *)self view];
    v43 = [v47 leadingAnchor];
    uint64_t v41 = [v45 constraintEqualToAnchor:v43];
    v51[0] = v41;
    v37 = [v4 trailingAnchor];
    v39 = [(GKChallengePlayerPickerViewController *)self view];
    v35 = [v39 centerXAnchor];
    v31 = [v37 constraintEqualToAnchor:v35];
    v51[1] = v31;
    v29 = [v4 topAnchor];
    v30 = [(GKChallengePlayerPickerViewController *)self view];
    uint64_t v8 = [v30 topAnchor];
    v9 = [v29 constraintEqualToAnchor:v8];
    v51[2] = v9;
    v10 = [v4 bottomAnchor];
    v11 = [(GKChallengePlayerPickerViewController *)self view];
    double v12 = [v11 topAnchor];
    double v13 = [v10 constraintEqualToAnchor:v12 constant:1.0];
    v51[3] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
    [v33 activateConstraints:v14];
  }
  double v15 = [(GKChallengePlayerPickerViewController *)self sendButton];

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FB1780]);
    double v17 = [(GKChallengePlayerPickerViewController *)self sendButton];
    v50 = v17;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    [v16 setPreferredFocusEnvironments:v18];

    id v19 = [(GKChallengePlayerPickerViewController *)self view];
    [v19 addLayoutGuide:v16];

    v34 = (void *)MEMORY[0x1E4F28DC8];
    v46 = [v16 leadingAnchor];
    v48 = [(GKChallengePlayerPickerViewController *)self view];
    v44 = [v48 centerXAnchor];
    uint64_t v42 = [v46 constraintEqualToAnchor:v44];
    v49[0] = v42;
    v38 = [v16 trailingAnchor];
    v40 = [(GKChallengePlayerPickerViewController *)self view];
    v36 = [v40 trailingAnchor];
    v32 = [v38 constraintEqualToAnchor:v36];
    v49[1] = v32;
    double v20 = [v16 topAnchor];
    CGRect v21 = [(GKChallengePlayerPickerViewController *)self view];
    CGRect v22 = [v21 topAnchor];
    CGRect v23 = [v20 constraintEqualToAnchor:v22];
    v49[2] = v23;
    CGRect v24 = [v16 bottomAnchor];
    v25 = [(GKChallengePlayerPickerViewController *)self view];
    v26 = [v25 topAnchor];
    v27 = [v24 constraintEqualToAnchor:v26 constant:1.0];
    v49[3] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
    [v34 activateConstraints:v28];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v14 viewWillAppear:a3];
  [(GKChallengePlayerPickerViewController *)self applyInitialContentOffset];
  [(GKChallengePlayerPickerViewController *)self setShouldApplyInitialOffset:0];
  id v4 = [(GKChallengePlayerPickerViewController *)self navigationController];
  v5 = [v4 viewControllers];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    id v7 = [(GKChallengePlayerPickerViewController *)self navigationItem];
    uint64_t v8 = [v7 leftBarButtonItem];

    if (!v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v10 = GKGameCenterUIFrameworkBundle();
      v11 = GKGetLocalizedStringFromTableInBundle();
      double v12 = (void *)[v9 initWithTitle:v11 style:0 target:self action:sel_cancel_];
      double v13 = [(GKChallengePlayerPickerViewController *)self navigationItem];
      [v13 setLeftBarButtonItem:v12];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKChallengePlayerPickerViewController *)self setShouldIgnoreClearSelection:1];
  v8.receiver = self;
  v8.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v8 viewDidAppear:v3];
  [(GKChallengePlayerPickerViewController *)self setShouldIgnoreClearSelection:0];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1D38]);
  [v5 addTarget:self action:sel_cancel_];
  [v5 setAllowedPressTypes:&unk_1F08126D0];
  uint64_t v6 = [(GKChallengePlayerPickerViewController *)self view];
  [v6 addGestureRecognizer:v5];

  id v7 = [MEMORY[0x1E4F63660] reporter];
  [v7 recordPageWithID:@"friendSelect" pageContext:@"dashboard" pageType:@"challenge"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKChallengePlayerPickerViewController *)self view];
  [v5 removeAllGestureRecognizers];

  v6.receiver = self;
  v6.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKChallengePlayerPickerViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKChallengePlayerPickerViewController *)&v3 viewWillLayoutSubviews];
  [(GKChallengePlayerPickerViewController *)self configureCollectionView];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKChallengePlayerPickerViewController *)&v2 viewDidLayoutSubviews];
}

- (void)configureCollectionView
{
  objc_super v3 = [(GKDashboardCollectionViewController *)self collectionView];
  id v38 = [v3 collectionViewLayout];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v38;
    [v4 setMinimumLineSpacing:0.0];
    [v4 setMinimumInteritemSpacing:0.0];
    [v4 sectionInset];
    objc_msgSend(v4, "setSectionInset:");
  }
  id v5 = [(GKDashboardCollectionViewController *)self collectionView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = [(GKDashboardCollectionViewController *)self collectionView];
  [v6 setShowsVerticalScrollIndicator:1];

  id v7 = [(GKDashboardCollectionViewController *)self collectionView];
  [v7 _gkRemoveAllConstraints];

  objc_super v8 = [(GKChallengePlayerPickerViewController *)self traitCollection];
  uint64_t v9 = [v8 verticalSizeClass];

  v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  double v12 = [(GKDashboardCollectionViewController *)self collectionView];
  double v13 = v12;
  if (v11 == 1 || v9 != 1)
  {
    id v16 = [v12 leftAnchor];
    double v17 = [(GKChallengePlayerPickerViewController *)self view];
    double v18 = [v17 leftAnchor];
    id v19 = [v16 constraintEqualToAnchor:v18 constant:0.0];
    [v19 setActive:1];

    double v13 = [(GKDashboardCollectionViewController *)self collectionView];
    objc_super v14 = [v13 rightAnchor];
    double v15 = [(GKChallengePlayerPickerViewController *)self view];
    double v20 = [v15 rightAnchor];
    CGRect v21 = [v14 constraintEqualToAnchor:v20 constant:0.0];
    [v21 setActive:1];
  }
  else
  {
    objc_super v14 = [v12 widthAnchor];
    double v15 = [v14 constraintEqualToConstant:500.0];
    [v15 setActive:1];
  }

  CGRect v22 = [(GKDashboardCollectionViewController *)self collectionView];
  CGRect v23 = [v22 centerXAnchor];
  CGRect v24 = [(GKChallengePlayerPickerViewController *)self view];
  v25 = [v24 centerXAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [(GKDashboardCollectionViewController *)self collectionView];
  v28 = [v27 topAnchor];
  v29 = [(GKChallengePlayerPickerViewController *)self titleView];
  v30 = [v29 bottomAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  v32 = [(GKDashboardCollectionViewController *)self collectionView];
  v33 = [v32 bottomAnchor];
  v34 = [(GKChallengePlayerPickerViewController *)self view];
  v35 = [v34 bottomAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  v37 = [(GKDashboardCollectionViewController *)self collectionView];
  [v37 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v13 traitCollectionDidChange:v4];
  id v5 = [(GKChallengePlayerPickerViewController *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];
  if (v6 == [v4 horizontalSizeClass])
  {
    id v7 = [(GKChallengePlayerPickerViewController *)self traitCollection];
    uint64_t v8 = [v7 layoutDirection];
    if (v8 == [v4 layoutDirection])
    {
      uint64_t v9 = [(GKChallengePlayerPickerViewController *)self traitCollection];
      v10 = [v9 preferredContentSizeCategory];
      uint64_t v11 = [v4 preferredContentSizeCategory];

      if (v10 == v11) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GKChallengePlayerPickerViewController_traitCollectionDidChange___block_invoke;
  block[3] = &unk_1E5F62EB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_8:
}

void __66__GKChallengePlayerPickerViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 reloadData];
}

- (void)applyInitialContentOffset
{
  if (self->_shouldApplyInitialOffset)
  {
    objc_super v3 = [(GKDashboardCollectionViewController *)self dataSource];
    id v4 = [v3 selectedPlayers];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      uint64_t v6 = [(GKDashboardCollectionViewController *)self collectionView];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__GKChallengePlayerPickerViewController_applyInitialContentOffset__block_invoke;
      block[3] = &unk_1E5F62EB0;
      id v9 = v6;
      id v7 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __66__GKChallengePlayerPickerViewController_applyInitialContentOffset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", 0, 0.0, 0.0);
}

- (void)setMessage:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    message = self->_message;
    self->_message = v4;

    [(UITextField *)self->_messageField setText:v6];
  }
}

- (void)loadData
{
  if ([(GKChallenge *)self->_challenge detailsLoaded])
  {
    v4.receiver = self;
    v4.super_class = (Class)GKChallengePlayerPickerViewController;
    [(GKDashboardCollectionViewController *)&v4 loadData];
  }
  else
  {
    challenge = self->_challenge;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__GKChallengePlayerPickerViewController_loadData__block_invoke;
    v5[3] = &unk_1E5F62EB0;
    v5[4] = self;
    [(GKChallenge *)challenge loadDetailsWithCompletionHandler:v5];
  }
}

id __49__GKChallengePlayerPickerViewController_loadData__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)GKChallengePlayerPickerViewController;
  return objc_msgSendSuper2(&v2, sel_loadData);
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v23 dataUpdated:a3 withError:a4];
  uint64_t v5 = [(GKDashboardCollectionViewController *)self dataSource];
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  NSUInteger v7 = [(NSArray *)self->_initiallySelectedPlayers count];
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = [v6 arrayWithCapacity:v8];
  if ([(NSArray *)self->_initiallySelectedPlayers count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_initiallySelectedPlayers;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = objc_msgSend(v5, "indexPathForPlayer:", *(void *)(*((void *)&v19 + 1) + 8 * v14), (void)v19);
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    [(GKChallengePlayerPickerViewController *)self setInitiallySelectedPlayers:0];
  }
  else if ([v5 itemCount] == 1)
  {
    id v16 = [v5 searchText];
    uint64_t v17 = [v16 length];

    if (!v17)
    {
      double v18 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      [v9 addObject:v18];
    }
  }
  if (objc_msgSend(v9, "count", (void)v19)) {
    [(GKChallengePlayerPickerViewController *)self selectPlayersAtIndexPaths:v9];
  }
  [(GKChallengePlayerPickerViewController *)self updateButtonEnableState];
}

- (void)selectPlayersAtIndexPaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GKDashboardCollectionViewController *)self dataSource];
  id v6 = [(GKDashboardCollectionViewController *)self collectionView];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v5, "collectionView:shouldSelectItemAtIndexPath:", v6, v13, (void)v14))
        {
          [v6 selectItemAtIndexPath:v13 animated:0 scrollPosition:18];
          [(GKChallengePlayerPickerViewController *)self collectionView:v6 didSelectItemAtIndexPath:v13];
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);

    if (v10) {
      [(GKChallengePlayerPickerViewController *)self setNeedsFocusUpdate];
    }
  }
  else
  {
  }
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GKDashboardCollectionViewController *)self dataSource];
  uint64_t v9 = [v8 searchText];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    uint64_t v11 = GKGameCenterUIFrameworkBundle();
    uint64_t v12 = GKGetLocalizedStringFromTableInBundle();
    [v6 setMessage:v12];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GKChallengePlayerPickerViewController;
    [(GKDashboardCollectionViewController *)&v13 setupNoContentView:v6 withError:v7];
  }
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(GKDashboardCollectionViewController *)self collectionView];
  if (v3)
  {
    id v4 = [(GKDashboardCollectionViewController *)self collectionView];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GKChallengePlayerPickerViewController;
    uint64_t v5 = [(GKDashboardCollectionViewController *)&v7 preferredFocusEnvironments];
  }

  return v5;
}

- (void)clearSelection
{
  if (!self->_shouldIgnoreClearSelection)
  {
    v4.receiver = self;
    v4.super_class = (Class)GKChallengePlayerPickerViewController;
    [(GKDashboardCollectionViewController *)&v4 clearSelection];
    objc_super v3 = [(GKDashboardCollectionViewController *)self dataSource];
    [v3 clearSelection];

    [(GKChallengePlayerPickerViewController *)self updateButtonEnableState];
  }
}

- (void)send:(id)a3
{
  id v7 = [(GKDashboardCollectionViewController *)self dataSource];
  objc_super v4 = [v7 selectedPlayers];
  if ((unint64_t)[v4 count] < 0xB)
  {
    if ([v4 count])
    {
      [(GKChallenge *)self->_challenge issueToPlayers:v4 message:self->_message];
      completionHandler = (void (**)(id, void *, NSString *))self->_completionHandler;
      if (completionHandler) {
        completionHandler[2](completionHandler, v4, self->_message);
      }
      [(UIViewController *)self _gkRemoveViewController:self animated:1];
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F636A8] tooManyPlayersAlertController];
    [(GKChallengePlayerPickerViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)addMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKDashboardCollectionViewController *)self dataSource];
  id v6 = [GKChallengeComposeController alloc];
  challenge = self->_challenge;
  message = self->_message;
  uint64_t v9 = [v5 selectedPlayers];
  uint64_t v10 = [(GKChallengeComposeController *)v6 initWithChallenge:challenge defaultMessage:message players:v9];

  objc_initWeak(&location, v10);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__GKChallengePlayerPickerViewController_addMessage___block_invoke;
  v11[3] = &unk_1E5F63BB0;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  [(GKSimpleComposeController *)v10 setDoneHandler:v11];
  [(UIViewController *)self _gkShowViewController:v10];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __52__GKChallengePlayerPickerViewController_addMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__GKChallengePlayerPickerViewController_addMessage___block_invoke_2;
    v11[3] = &unk_1E5F63350;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v8);
  [v7 _gkRemoveViewController:WeakRetained animated:1];

  id v10 = objc_loadWeakRetained(v8);
  [v10 setDoneHandler:0];
}

uint64_t __52__GKChallengePlayerPickerViewController_addMessage___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMessage:*(void *)(a1 + 40)];
  objc_super v2 = *(void **)(a1 + 32);

  return [v2 send:v2];
}

- (void)cancel:(id)a3
{
  id completionHandler = self->_completionHandler;
  if (completionHandler) {
    (*((void (**)(id, void, void))completionHandler + 2))(completionHandler, 0, 0);
  }

  [(UIViewController *)self _gkRemoveViewController:self animated:1];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  messageField = self->_messageField;
  if (messageField == a3)
  {
    id v6 = [a3 text];
    [(GKChallengePlayerPickerViewController *)self setMessage:v6];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__GKChallengePlayerPickerViewController_textFieldShouldReturn___block_invoke;
    block[3] = &unk_1E5F62EB0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return messageField != a3;
}

uint64_t __63__GKChallengePlayerPickerViewController_textFieldShouldReturn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send:*(void *)(a1 + 32)];
}

- (void)updateButtonEnableState
{
  id v7 = [(GKDashboardCollectionViewController *)self dataSource];
  objc_super v3 = [v7 selectedPlayers];
  uint64_t v4 = [v3 count];

  [(UIButton *)self->_sendButton setEnabled:v4 != 0];
  if (!self->_sendButton)
  {
    id v5 = [(GKChallengePlayerPickerViewController *)self navigationItem];
    id v6 = [v5 rightBarButtonItem];
    [v6 setEnabled:v4 != 0];
  }
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__GKChallengePlayerPickerViewController_refreshContentsForDataType_userInfo___block_invoke;
  block[3] = &unk_1E5F65260;
  unsigned int v11 = a3;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__GKChallengePlayerPickerViewController_refreshContentsForDataType_userInfo___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 48) == 4)
  {
    objc_super v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F630B0]];
    objc_super v3 = [*(id *)(a1 + 40) dataSource];
    uint64_t v4 = [v3 addInvitedFriendContactIdentifier:v2];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) collectionView];
      v7[0] = v4;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [v5 reloadItemsAtIndexPaths:v6];
    }
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  [v4 setText:0];
  [v4 resignFirstResponder];

  [(GKChallengePlayerPickerViewController *)self setSearchText:0];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)setSearchText:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GKDashboardCollectionViewController *)self dataSource];
  [v5 setSearchText:v4];
  [(GKChallengePlayerPickerViewController *)self dataUpdated:1 withError:0];
  id v6 = [(GKDashboardCollectionViewController *)self collectionView];
  id v7 = [v5 selectedPlayers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [v5 indexPathForPlayer:*(void *)(*((void *)&v13 + 1) + 8 * v11)];
        [v6 selectItemAtIndexPath:v12 animated:0 scrollPosition:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v5 collectionView:a3 didSelectItemAtIndexPath:a4];
  [(GKChallengePlayerPickerViewController *)self updateButtonEnableState];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v5 collectionView:a3 didDeselectItemAtIndexPath:a4];
  [(GKChallengePlayerPickerViewController *)self updateButtonEnableState];
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_scrollingHeaderTopConstraint)
  {
    [a3 contentOffset];
    double v5 = -v4;
    id v6 = [(GKDashboardCollectionViewController *)self collectionView];
    [v6 contentInset];
    [(NSLayoutConstraint *)self->_scrollingHeaderTopConstraint setConstant:v5 - v7];
  }
  id v8 = [(GKChallengePlayerPickerViewController *)self searchBar];
  [v8 resignFirstResponder];
}

- (NSString)message
{
  return self->_message;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)inviteFriendHandler
{
  return self->_inviteFriendHandler;
}

- (void)setInviteFriendHandler:(id)a3
{
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSArray)initiallySelectedPlayers
{
  return self->_initiallySelectedPlayers;
}

- (void)setInitiallySelectedPlayers:(id)a3
{
}

- (BOOL)shouldIgnoreClearSelection
{
  return self->_shouldIgnoreClearSelection;
}

- (void)setShouldIgnoreClearSelection:(BOOL)a3
{
  self->_shouldIgnoreClearSelection = a3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  self->_descriptionLabel = (UILabel *)a3;
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (void)setSendButton:(id)a3
{
  self->_sendButton = (UIButton *)a3;
}

- (UITextField)messageField
{
  return self->_messageField;
}

- (void)setMessageField:(id)a3
{
  self->_messageField = (UITextField *)a3;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)scrollingHeader
{
  return self->_scrollingHeader;
}

- (void)setScrollingHeader:(id)a3
{
  self->_scrollingHeader = (UIView *)a3;
}

- (NSLayoutConstraint)scrollingHeaderTopConstraint
{
  return self->_scrollingHeaderTopConstraint;
}

- (void)setScrollingHeaderTopConstraint:(id)a3
{
  self->_scrollingHeaderTopConstraint = (NSLayoutConstraint *)a3;
}

- (BOOL)shouldApplyInitialOffset
{
  return self->_shouldApplyInitialOffset;
}

- (void)setShouldApplyInitialOffset:(BOOL)a3
{
  self->_shouldApplyInitialOffset = a3;
}

- (UIViewController)composeController
{
  return self->_composeController;
}

- (void)setComposeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeController, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_initiallySelectedPlayers, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong(&self->_inviteFriendHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end