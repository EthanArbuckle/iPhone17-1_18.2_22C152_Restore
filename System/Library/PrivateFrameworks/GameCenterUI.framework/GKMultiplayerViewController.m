@interface GKMultiplayerViewController
- (BOOL)addButtonEnabled;
- (BOOL)allowAutoMatch;
- (BOOL)allowPlayerCountSelection;
- (BOOL)canStartForcedAutomatch;
- (BOOL)canStartGroupActivities;
- (BOOL)canStartWithMinimumPlayers;
- (BOOL)didAcceptGameInvite;
- (BOOL)didStartForcedAutomatch;
- (BOOL)isCanceling;
- (BOOL)isInSetupMode;
- (BOOL)isLoading;
- (BOOL)isParticipantInvitedByLocalPlayer:(id)a3;
- (BOOL)setupInvitesForSource:(unint64_t)a3 completion:(id)a4;
- (BOOL)showCancelButton;
- (BOOL)showNavigationBar;
- (GKBoopHandler)boopHandler;
- (GKDashboardMultiplayerPickerViewController)playerPickerViewController;
- (GKDashboardNearbyBrowserDelegate)nearbyDelegate;
- (GKGame)game;
- (GKMatchRequest)matchRequest;
- (GKMatchRequest)originalMatchRequest;
- (GKMultiplayerViewController)init;
- (GKMultiplayerViewController)initWithMatchRequest:(id)a3;
- (NSMutableSet)participantsInvitedByLocalPlayer;
- (NSString)defaultInvitationMessage;
- (NSURL)shareURL;
- (UIEdgeInsets)collectionViewContentInset;
- (UIView)buttonHeaderView;
- (_TtC12GameCenterUI23GKMultiplayerFooterView)footerView;
- (id)makeButtonHeaderView;
- (id)makeDoubleHeaderView;
- (id)pageId;
- (id)preferredFocusEnvironments;
- (int64_t)automatchParticipantStatus;
- (int64_t)invitationType;
- (int64_t)matchmakingMode;
- (int64_t)maxAvailablePlayers;
- (int64_t)multiplayerCellLayoutMode;
- (unint64_t)messagesInviteStatus;
- (void)addAutomatchPlayer;
- (void)cancel;
- (void)cancelButtonPressed;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureAutoBounce;
- (void)configureDataSource;
- (void)configureDataSourceWithCompletionHandler:(id)a3;
- (void)configureMatchRequest;
- (void)dataSource:(id)a3 didRefreshSections:(id)a4;
- (void)dealloc;
- (void)determineInvitationType;
- (void)didPickPlayers:(id)a3 messageGroups:(id)a4 source:(unint64_t)a5 completion:(id)a6;
- (void)didTapRemoveParticipant:(id)a3;
- (void)didUpdateParticipants;
- (void)dismissPickerViewController;
- (void)handleNewParticipantCount:(int64_t)a3;
- (void)handleServiceUnavailable:(id)a3;
- (void)inviteContactPlayers:(id)a3 source:(unint64_t)a4 completion:(id)a5;
- (void)inviteFriendsButtonPressed;
- (void)layoutSubviews;
- (void)loadShareURLWithContactPlayers:(id)a3 completion:(id)a4;
- (void)localPlayerAcceptedGameInvite:(id)a3;
- (void)multiplayerPicker:(id)a3 didPickPlayers:(id)a4 messageGroups:(id)a5 customMessage:(id)a6;
- (void)multiplayerPickerDidCancel:(id)a3;
- (void)performActionsForButtonStartGame;
- (void)playersToInvite:(id)a3;
- (void)preparePlayerPicker;
- (void)presentPlayerPicker;
- (void)refreshHeaderAndFooterMaterials;
- (void)removeAutomatchPlayer;
- (void)removePlayer:(id)a3;
- (void)sendInvitesToPlayersInOriginalMatchRequest;
- (void)setAddButtonEnabled:(BOOL)a3;
- (void)setBoopHandler:(id)a3;
- (void)setButtonHeaderView:(id)a3;
- (void)setCanStartGroupActivities:(BOOL)a3;
- (void)setCanStartWithMinimumPlayers:(BOOL)a3;
- (void)setDefaultInvitationMessage:(id)a3;
- (void)setDidAcceptGameInvite:(BOOL)a3;
- (void)setDidStartForcedAutomatch:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setGame:(id)a3;
- (void)setInvitationType:(int64_t)a3;
- (void)setMatchmakingMode:(int64_t)a3;
- (void)setMessagesInviteStatus:(unint64_t)a3;
- (void)setMultiplayerDataSource:(id)a3;
- (void)setNearbyDelegate:(id)a3;
- (void)setParticipantsInvitedByLocalPlayer:(id)a3;
- (void)setPlayerPickerViewController:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)setShowNavigationBar:(BOOL)a3;
- (void)setViewNeedsLayout;
- (void)setupCancelButton;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCollectionViewContentInset;
- (void)updateDataSourceInvitationEnabled;
- (void)updateFooterButtonStates;
- (void)updateHeaderFooterLayoutMargins;
- (void)updateTitle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKMultiplayerViewController

- (GKMultiplayerViewController)init
{
  v3 = objc_alloc_init(_TtC12GameCenterUI33GKMultiplayerViewControllerLayout);
  v11.receiver = self;
  v11.super_class = (Class)GKMultiplayerViewController;
  v4 = [(GKCollectionViewController *)&v11 initWithCollectionViewLayout:v3];

  if (v4)
  {
    v4->_showCancelButton = 1;
    v4->_addButtonEnabled = 1;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F63048];
    v7 = [MEMORY[0x1E4F63760] localPlayer];
    [v5 addObserver:v4 selector:sel_localPlayerAcceptedGameInvite_ name:v6 object:v7];

    uint64_t v8 = *MEMORY[0x1E4F63408];
    v9 = [MEMORY[0x1E4F63760] localPlayer];
    [v5 addObserver:v4 selector:sel_playersToInvite_ name:v8 object:v9];

    [(GKMultiplayerViewController *)v4 setInvitationType:0];
  }
  return v4;
}

- (GKMultiplayerViewController)initWithMatchRequest:(id)a3
{
  id v4 = a3;
  v5 = [(GKMultiplayerViewController *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    matchRequest = v5->_matchRequest;
    v5->_matchRequest = (GKMatchRequest *)v6;

    uint64_t v8 = [v4 copy];
    originalMatchRequest = v5->_originalMatchRequest;
    v5->_originalMatchRequest = (GKMatchRequest *)v8;

    [(GKMultiplayerViewController *)v5 configureMatchRequest];
    v10 = [(GKMatchRequest *)v5->_matchRequest inviteMessage];
    uint64_t v11 = [v10 copy];
    defaultInvitationMessage = v5->_defaultInvitationMessage;
    v5->_defaultInvitationMessage = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    participantsInvitedByLocalPlayer = v5->_participantsInvitedByLocalPlayer;
    v5->_participantsInvitedByLocalPlayer = (NSMutableSet *)v13;

    if (v4)
    {
      objc_initWeak(&location, v5);
      v15 = [GKBoopHandler alloc];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke;
      v19[3] = &unk_1E5F64A88;
      objc_copyWeak(&v21, &location);
      v16 = v5;
      v20 = v16;
      v17 = [(GKBoopHandler *)v15 initWithUrlProvider:v19];
      [(GKMultiplayerViewController *)v16 setBoopHandler:v17];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  return v5;
}

id __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_alloc_init(GKContactDataSource);
  uint64_t v6 = [(GKContactDataSource *)v5 fetchContactWithID:v3];
  if (!v6)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v10 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
      __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  v7 = [*(id *)(a1 + 32) participantsInvitedByLocalPlayer];
  int v8 = [v7 containsObject:v3];

  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v9 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
      __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_cold_2();
    }
LABEL_11:
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F63788]) initWithContact:v6];
  uint64_t v13 = (void *)MEMORY[0x1E4F636D8];
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerViewController.m", 138, "-[GKMultiplayerViewController initWithMatchRequest:]_block_invoke");
  v15 = [v13 dispatchGroupWithName:v14];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_2;
  v22[3] = &unk_1E5F62F28;
  id v16 = WeakRetained;
  id v23 = v16;
  id v24 = v12;
  id v17 = v12;
  [v15 perform:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_4;
  v20[3] = &unk_1E5F62EB0;
  id v18 = v16;
  id v21 = v18;
  [v15 notifyOnMainQueueWithBlock:v20];
  [v15 waitWithTimeout:60.0];
  uint64_t v11 = [v18 shareURL];

LABEL_13:

  return v11;
}

void __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = *(void *)(a1 + 40);
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_3;
  v7[3] = &unk_1E5F639B0;
  id v8 = v3;
  id v6 = v3;
  [v4 didPickPlayers:v5 messageGroups:0 source:0 completion:v7];
}

uint64_t __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_4(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F637F8] reporter];
  [v2 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63230]];

  id v3 = [*(id *)(a1 + 32) playerPickerViewController];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 dismissPickerViewController];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKMultiplayerViewController;
  [(GKCollectionViewController *)&v4 dealloc];
}

- (void)configureMatchRequest
{
  matchRequest = self->_matchRequest;
  if (matchRequest)
  {
    [(GKMatchRequest *)matchRequest removeLocalPlayerFromPlayersToInvite];
    if ([(GKMatchRequest *)self->_matchRequest defaultNumberOfPlayers])
    {
      NSUInteger v4 = [(GKMatchRequest *)self->_matchRequest defaultNumberOfPlayers];
      NSUInteger v5 = [(GKMatchRequest *)self->_matchRequest minPlayers];
      id v6 = self->_matchRequest;
      if (v4 >= v5)
      {
        unint64_t v8 = [(GKMatchRequest *)v6 defaultNumberOfPlayers];
        if (v8 <= [(GKMatchRequest *)self->_matchRequest maxPlayers]) {
          return;
        }
        uint64_t v7 = [(GKMatchRequest *)self->_matchRequest maxPlayers];
      }
      else
      {
        uint64_t v7 = [(GKMatchRequest *)v6 minPlayers];
      }
      uint64_t v9 = v7;
      id v10 = self->_matchRequest;
      [(GKMatchRequest *)v10 setDefaultNumberOfPlayers:v9];
    }
  }
}

- (void)sendInvitesToPlayersInOriginalMatchRequest
{
  id v3 = [(GKMultiplayerViewController *)self originalMatchRequest];
  NSUInteger v4 = [v3 recipients];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(GKMultiplayerViewController *)self originalMatchRequest];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke;
    v7[3] = &unk_1E5F634C0;
    objc_copyWeak(&v8, &location);
    [v6 loadRecipientsWithCompletionHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v3 count])
  {
    uint64_t v5 = [WeakRetained defaultInvitationMessage];
    id v6 = [WeakRetained matchRequest];
    [v6 setInviteMessage:v5];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke_102;
    v9[3] = &unk_1E5F62EB0;
    id v10 = v3;
    [WeakRetained didPickPlayers:v10 messageGroups:0 source:1 completion:v9];
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    id v8 = (void *)*MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke_cold_1(v8, WeakRetained);
    }
  }
}

void __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke_102(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F63860]) {
    id v2 = (id)GKOSLoggers();
  }
  id v3 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1AF250000, v3, OS_LOG_TYPE_INFO, "Invitation sent to recipients in the match request: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)GKMultiplayerViewController;
  [(GKCollectionViewController *)&v13 viewDidLoad];
  [(GKMultiplayerViewController *)self updateTitle];
  [(GKCollectionViewController *)self setShouldSlideInContents:0];
  id v3 = objc_alloc_init(_TtC12GameCenterUI23GKMultiplayerFooterView);
  [(GKMultiplayerFooterView *)v3 setFooterStatusString:0];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__GKMultiplayerViewController_viewDidLoad__block_invoke;
  v10[3] = &unk_1E5F634E8;
  objc_copyWeak(&v11, &location);
  [(GKMultiplayerFooterView *)v3 setStartGameHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__GKMultiplayerViewController_viewDidLoad__block_invoke_2;
  v8[3] = &unk_1E5F634E8;
  objc_copyWeak(&v9, &location);
  [(GKMultiplayerFooterView *)v3 setInviteFriendsHandler:v8];
  uint64_t v4 = [(GKMultiplayerViewController *)self matchRequest];

  if (v4)
  {
    int v5 = [(GKMultiplayerViewController *)self matchRequest];
    [(GKMultiplayerFooterView *)v3 configureUsing:v5];
  }
  uint64_t v6 = [(GKMultiplayerViewController *)self matchRequest];

  if (v6)
  {
    uint64_t v7 = [(GKMultiplayerViewController *)self view];
    [v7 addSubview:v3];
  }
  [(GKMultiplayerViewController *)self setFooterView:v3];
  [(GKMultiplayerViewController *)self sendInvitesToPlayersInOriginalMatchRequest];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __42__GKMultiplayerViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startGameButtonPressed];
}

void __42__GKMultiplayerViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained inviteFriendsButtonPressed];
}

- (void)viewWillAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)GKMultiplayerViewController;
  [(GKCollectionViewController *)&v18 viewWillAppear:a3];
  uint64_t v4 = [(GKCollectionViewController *)self collectionView];
  [v4 setBackgroundColor:0];
  [v4 setOpaque:0];
  [v4 setDirectionalLockEnabled:1];
  [v4 setAlwaysBounceVertical:0];
  [v4 setShowsHorizontalScrollIndicator:0];
  [v4 setShowsVerticalScrollIndicator:0];
  int v5 = [(GKMultiplayerViewController *)self navigationController];
  objc_msgSend(v5, "setNavigationBarHidden:animated:", -[GKMultiplayerViewController showNavigationBar](self, "showNavigationBar") ^ 1, 0);

  uint64_t v6 = [(GKMultiplayerViewController *)self navigationController];
  uint64_t v7 = [v6 navigationBar];
  id v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v7 setTintColor:v8];

  [(GKMultiplayerViewController *)self setViewNeedsLayout];
  id v9 = [(GKCollectionViewController *)self collectionView];
  [v9 reloadData];

  id v10 = [(GKCollectionViewController *)self collectionView];
  id v11 = [v10 collectionViewLayout];
  [v11 invalidateLayout];

  if ([(GKMultiplayerViewController *)self matchmakingMode] == 2
    || [(GKMultiplayerViewController *)self canStartGroupActivities])
  {
    v12 = [(GKMultiplayerViewController *)self footerView];
    objc_super v13 = v12;
    uint64_t v14 = 1;
  }
  else
  {
    v12 = [(GKMultiplayerViewController *)self footerView];
    objc_super v13 = v12;
    uint64_t v14 = 0;
  }
  [v12 setInviteFriendsButtonHidden:v14];

  v15 = [(GKMultiplayerViewController *)self buttonHeaderView];
  [v15 setBackgroundColor:0];

  id v16 = [(GKMultiplayerViewController *)self footerView];
  [v16 setBackgroundColor:0];

  [(GKMultiplayerViewController *)self configureAutoBounce];
  id v17 = [(GKMultiplayerViewController *)self boopHandler];
  [v17 startNearbyDiscoveryWithCompletionHandler:&__block_literal_global_22];
}

void __46__GKMultiplayerViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F63860];
  if (v2)
  {
    if (!v3) {
      id v4 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
      __46__GKMultiplayerViewController_viewWillAppear___block_invoke_cold_2();
    }
  }
  else
  {
    if (!v3) {
      id v5 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
      __46__GKMultiplayerViewController_viewWillAppear___block_invoke_cold_1();
    }
  }
}

- (void)refreshHeaderAndFooterMaterials
{
  uint64_t v3 = [(GKCollectionViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;

  uint64_t v6 = [(GKCollectionViewController *)self collectionView];
  [v6 contentInset];
  double v8 = v7;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIView *)self->_buttonHeaderView wantsMaterialBackgroundWithScrollOffset:v5 + v8];
  }
  id v9 = [(GKCollectionViewController *)self collectionView];
  [v9 contentSize];
  double v11 = v10;

  footerView = self->_footerView;
  [(GKMultiplayerFooterView *)footerView frame];

  [(GKMultiplayerFooterView *)footerView wantsMaterialBackgroundWithScrollOffset:v11 - v5 - v13];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerViewController;
  [(GKMultiplayerViewController *)&v3 viewDidLayoutSubviews];
  [(GKMultiplayerViewController *)self layoutSubviews];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerViewController;
  [(GKMultiplayerViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(GKMultiplayerViewController *)self updateCollectionViewContentInset];
  [(GKMultiplayerViewController *)self updateHeaderFooterLayoutMargins];
}

- (void)layoutSubviews
{
  objc_super v3 = [(GKMultiplayerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView sizeThatFits:](self->_buttonHeaderView, "sizeThatFits:", v9, v11);
  double v13 = v12;
  double v15 = v14;
  -[GKMultiplayerFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v9, v11);
  double v17 = v16;
  double v19 = v18;
  [(UIView *)self->_buttonHeaderView layoutMargins];
  double v21 = v15 + v20;
  [(UIView *)self->_buttonHeaderView layoutMargins];
  double v23 = v21 + v22;
  [(GKMultiplayerFooterView *)self->_footerView layoutMargins];
  double v25 = v19 + v24;
  [(GKMultiplayerFooterView *)self->_footerView layoutMargins];
  double v27 = v25 + v26;
  -[UIView setFrame:](self->_buttonHeaderView, "setFrame:", v5, v7, v13, v23);
  -[GKMultiplayerFooterView setFrame:](self->_footerView, "setFrame:", v5, v7 + v11 - v27, v17, v27);
  [(GKMultiplayerViewController *)self updateCollectionViewContentInset];
  [(GKMultiplayerViewController *)self refreshHeaderAndFooterMaterials];

  [(GKMultiplayerViewController *)self updateHeaderFooterLayoutMargins];
}

- (void)updateCollectionViewContentInset
{
  [(GKMultiplayerViewController *)self collectionViewContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(GKCollectionViewController *)self collectionView];
  [v11 contentInset];
  if (v6 == v15 && v4 == v12 && v10 == v14)
  {
    double v18 = v13;

    if (v8 == v18) {
      return;
    }
  }
  else
  {
  }
  double v19 = [(GKCollectionViewController *)self collectionView];
  objc_msgSend(v19, "setContentInset:", v4, v6, v8, v10);

  double v20 = [(GKCollectionViewController *)self collectionView];
  objc_msgSend(v20, "setContentOffset:", -v6, -v4);

  id v22 = [(GKCollectionViewController *)self collectionView];
  double v21 = [v22 collectionViewLayout];
  [v21 invalidateLayout];
}

- (void)updateHeaderFooterLayoutMargins
{
  double v3 = [(GKMultiplayerViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(GKCollectionViewController *)self collectionView];
  +[GKMultiplayerViewControllerLayout minimumContentInsetIn:v12];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  [(UIView *)self->_buttonHeaderView setInsetsLayoutMarginsFromSafeArea:0];
  if (v5 >= v14) {
    double v21 = v5;
  }
  else {
    double v21 = v14;
  }
  if (v7 >= v16) {
    double v22 = v7;
  }
  else {
    double v22 = v16;
  }
  if (v11 >= v20) {
    double v23 = v11;
  }
  else {
    double v23 = v20;
  }
  -[UIView setLayoutMargins:](self->_buttonHeaderView, "setLayoutMargins:", v21, v22, 0.0, v23);
  [(GKMultiplayerFooterView *)self->_footerView setInsetsLayoutMarginsFromSafeArea:0];
  footerView = self->_footerView;
  if (v9 >= v18) {
    double v25 = v9;
  }
  else {
    double v25 = v18;
  }

  -[GKMultiplayerFooterView setLayoutMargins:](footerView, "setLayoutMargins:", 0.0, v22, v25, v23);
}

- (UIEdgeInsets)collectionViewContentInset
{
  double v3 = [(GKMultiplayerViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(GKCollectionViewController *)self collectionView];
  +[GKMultiplayerViewControllerLayout minimumContentInsetIn:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  [(UIView *)self->_buttonHeaderView frame];
  double v18 = v10 + v17;
  if (v5 <= 0.0) {
    double v5 = v12;
  }
  [(GKMultiplayerFooterView *)self->_footerView frame];
  double v20 = v14 + v19;
  if (v7 <= 0.0) {
    double v21 = v16;
  }
  else {
    double v21 = v7;
  }
  double v22 = v18;
  double v23 = v5;
  result.right = v21;
  result.bottom = v20;
  result.left = v23;
  result.top = v22;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKMultiplayerViewController;
  [(GKCollectionViewController *)&v4 viewDidAppear:a3];
  [(GKMultiplayerViewController *)self setPlayerPickerViewController:0];
  if ([(GKMultiplayerViewController *)self invitationType] == 2)
  {
    if ([(GKMultiplayerViewController *)self canStartForcedAutomatch])
    {
      [(GKMultiplayerViewController *)self setDidStartForcedAutomatch:1];
      [(GKMultiplayerViewController *)self startGameButtonPressed];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerViewController;
  [(GKCollectionViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(GKMultiplayerViewController *)self boopHandler];
  [v4 stopWithCompletionHandler:&__block_literal_global_121];
}

void __48__GKMultiplayerViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F63860];
  if (v2)
  {
    if (!v3) {
      id v4 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
      __48__GKMultiplayerViewController_viewDidDisappear___block_invoke_cold_2();
    }
  }
  else
  {
    if (!v3) {
      id v5 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
      __48__GKMultiplayerViewController_viewDidDisappear___block_invoke_cold_1();
    }
  }
}

- (id)pageId
{
  id v2 = NSString;
  uint64_t v3 = [NSString stringWithFormat:@"Subclasses must provide a valid pageId"];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerViewController.m"];
  id v5 = [v4 lastPathComponent];
  double v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKMultiplayerViewController pageId]", objc_msgSend(v5, "UTF8String"), 468];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v6 format];
  return @"lobby";
}

- (void)configureDataSource
{
}

- (void)configureDataSourceWithCompletionHandler:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  id v5 = [GKMultiplayerDataSource alloc];
  double v6 = [(GKMultiplayerViewController *)self pageId];
  double v7 = [(GKMultiplayerDataSource *)v5 initWithMetricsPageId:v6];

  double v8 = [(GKCollectionViewController *)self collectionView];
  [(GKMultiplayerDataSource *)v7 configureCollectionView:v8];

  [(GKMultiplayerDataSource *)v7 setDelegate:self];
  double v9 = [(GKMultiplayerViewController *)self originalMatchRequest];

  if (v9)
  {
    double v10 = [(GKMultiplayerViewController *)self originalMatchRequest];
    double v11 = (GKMatchRequest *)[v10 copy];
    matchRequest = self->_matchRequest;
    self->_matchRequest = v11;

    [(GKMultiplayerViewController *)self configureMatchRequest];
  }
  double v13 = [(GKMultiplayerViewController *)self matchRequest];

  if (v13)
  {
    double v14 = [(GKMatchRequest *)self->_matchRequest recipients];
    double v15 = [v14 _gkGuestPlayersFromPlayers];

    [(GKMultiplayerDataSource *)v7 addPlayers:v15 withStatus:7 replaceAutomatches:1 complete:0];
    double v16 = [(GKMultiplayerViewController *)self matchRequest];
    -[GKMultiplayerDataSource setMinPlayers:](v7, "setMinPlayers:", [v16 minPlayers]);

    double v17 = [(GKMultiplayerViewController *)self matchRequest];
    -[GKMultiplayerDataSource setMaxPlayers:](v7, "setMaxPlayers:", [v17 maxPlayers]);

    double v18 = [(GKMultiplayerViewController *)self matchRequest];
    if ([v18 defaultNumberOfPlayersIsValid])
    {
      double v19 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v20 = [v19 defaultNumberOfPlayers];

      if (v20)
      {
        if (!*MEMORY[0x1E4F63860]) {
          id v21 = (id)GKOSLoggers();
        }
        double v22 = (void *)*MEMORY[0x1E4F63870];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
        {
          double v23 = v22;
          double v24 = [(GKMultiplayerViewController *)self matchRequest];
          *(_DWORD *)buf = 134217984;
          uint64_t v50 = [v24 defaultNumberOfPlayers];
          _os_log_impl(&dword_1AF250000, v23, OS_LOG_TYPE_INFO, "set automatchPlayers by _matchRequest.defaultNumberOfPlayers  %lu. This is to respect what developers set.", buf, 0xCu);
        }
        double v25 = [(GKMultiplayerViewController *)self matchRequest];
        uint64_t v26 = [v25 defaultNumberOfPlayers];
        goto LABEL_23;
      }
    }
    else
    {
    }
    double v27 = [(GKMultiplayerViewController *)self matchRequest];
    uint64_t v28 = [v27 defaultNumberOfPlayers];

    if (!v28)
    {
      v29 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v30 = [v29 maxPlayers];
      v31 = [(GKMultiplayerViewController *)self matchRequest];
      [v31 setDefaultNumberOfPlayers:v30];
    }
    v32 = [(GKMultiplayerViewController *)self matchRequest];
    uint64_t v33 = [v32 defaultNumberOfPlayers];

    v34 = [MEMORY[0x1E4F637E8] shared];
    v35 = [(GKMultiplayerViewController *)self game];
    v36 = [v35 bundleIdentifier];
    unint64_t v37 = [v34 recentNumberOfPlayersForBundleID:v36];

    if (v37 <= 1) {
      unint64_t v38 = v33;
    }
    else {
      unint64_t v38 = v37;
    }
    v39 = [(GKMultiplayerViewController *)self matchRequest];
    unint64_t v40 = [v39 minPlayers];

    v41 = [(GKMultiplayerViewController *)self matchRequest];
    double v25 = v41;
    if (v38 >= v40)
    {
      unint64_t v42 = [v41 maxPlayers];

      if (v38 <= v42)
      {
LABEL_24:
        -[GKMultiplayerDataSource setAutomatchPlayerCount:](v7, "setAutomatchPlayerCount:", v38 + ~[v15 count]);
        [(GKMultiplayerDataSource *)v7 setImplicitAutomatchPlayerCount:[(GKMultiplayerDataSource *)v7 automatchPlayerCount]];
        v43 = [(GKMultiplayerViewController *)self game];
        [(GKMultiplayerDataSource *)v7 setGame:v43];

        v44 = [(GKMultiplayerViewController *)self matchRequest];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke;
        v45[3] = &unk_1E5F64AD8;
        v46 = v7;
        v47 = self;
        v48 = v4;
        [v44 loadRecipientsWithCompletionHandler:v45];

        goto LABEL_25;
      }
      double v25 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v26 = [v25 maxPlayers];
    }
    else
    {
      uint64_t v26 = [v41 minPlayers];
    }
LABEL_23:
    unint64_t v38 = v26;

    goto LABEL_24;
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_25:
  [(GKCollectionViewController *)self setDataSource:v7];
  [(GKMultiplayerViewController *)self updateDataSourceInvitationEnabled];
}

void __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5F64AB0;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v13 = v5;
  double v7 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) code] == 10)
  {
    uint64_t v2 = *(void *)(a1 + 64);
    if (v2) {
      (*(void (**)(void))(v2 + 16))();
    }
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v10 = __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke_3;
    id v11 = &unk_1E5F63E30;
    id v5 = *(void **)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = v5;
    [v3 addPlayers:v4 withStatus:11 replaceAutomatches:1 complete:&v8];
  }
  id v6 = objc_msgSend(*(id *)(a1 + 56), "matchRequest", v8, v9, v10, v11, v12);
  [v6 setRecipients:0];

  double v7 = [*(id *)(a1 + 56) matchRequest];
  [v7 setPlayersToInvite:0];
}

uint64_t __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStartGameButtonTitle];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)updateTitle
{
  BOOL v3 = [(GKMultiplayerViewController *)self allowPlayerCountSelection];
  uint64_t v4 = [(GKMultiplayerViewController *)self buttonHeaderView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v3)
  {
    if (isKindOfClass)
    {
      id v6 = NSString;
      double v7 = GKGameCenterUIFrameworkBundle();
      uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
      uint64_t v9 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v10 = [v9 minPlayers];
      id v11 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v12 = objc_msgSend(v6, "stringWithFormat:", v8, v10, objc_msgSend(v11, "maxPlayers"));
      id v13 = [(GKMultiplayerViewController *)self buttonHeaderView];
      [v13 setSubtitleText:v12];
    }
    else
    {
      double v17 = [(GKMultiplayerViewController *)self buttonHeaderView];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) == 0) {
        goto LABEL_10;
      }
      double v7 = [(GKMultiplayerViewController *)self buttonHeaderView];
      uint64_t v8 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v19 = [v8 minPlayers];
      uint64_t v9 = [(GKMultiplayerViewController *)self matchRequest];
      objc_msgSend(v7, "updateCountWithMinPlayers:maxPlayers:", v19, objc_msgSend(v9, "maxPlayers"));
    }
    goto LABEL_8;
  }
  if (isKindOfClass)
  {
    uint64_t v14 = NSString;
    double v7 = GKGameCenterUIFrameworkBundle();
    uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
    uint64_t v9 = [(GKMultiplayerViewController *)self matchRequest];
    id v15 = objc_msgSend(v14, "stringWithFormat:", v8, objc_msgSend(v9, "minPlayers"));
    double v16 = [(GKMultiplayerViewController *)self buttonHeaderView];
    [v16 setSubtitleText:v15];

LABEL_8:
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v20 = [(GKMultiplayerViewController *)self buttonHeaderView];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    double v7 = [(GKMultiplayerViewController *)self buttonHeaderView];
    double v22 = [(GKMultiplayerViewController *)self matchRequest];
    unint64_t v23 = [v22 minPlayers];

    double v24 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    double v25 = [v24 players];
    unint64_t v26 = [v25 count];

    if (v23 <= v26) {
      unint64_t v23 = v26;
    }
    uint64_t v8 = [(GKMultiplayerViewController *)self matchRequest];
    objc_msgSend(v7, "updateCountWithMinPlayers:maxPlayers:", v23, objc_msgSend(v8, "maxPlayers"));
    goto LABEL_9;
  }
LABEL_10:

  [(GKMultiplayerViewController *)self updateStartGameButtonTitle];
}

- (void)setCanStartGroupActivities:(BOOL)a3
{
  if (self->_canStartGroupActivities != a3)
  {
    self->_canStartGroupActivities = a3;
    [(GKMultiplayerViewController *)self updateTitle];
  }
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    self->_showCancelButton = a3;
    [(GKMultiplayerViewController *)self setupCancelButton];
  }
}

- (void)setupCancelButton
{
  id v4 = [(GKMultiplayerViewController *)self navigationItem];
  if (self->_showCancelButton)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed];
    [v4 setLeftBarButtonItem:v3];
  }
  else
  {
    [v4 setLeftBarButtonItem:0];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)addAutomatchPlayer
{
  if (self->_addButtonEnabled)
  {
    id v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    BOOL v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    objc_msgSend(v4, "setAutomatchPlayerCount:complete:", objc_msgSend(v3, "automatchPlayerCount") + 1, 0);
  }
}

- (void)removeAutomatchPlayer
{
  if (self->_addButtonEnabled)
  {
    id v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    BOOL v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    objc_msgSend(v4, "setAutomatchPlayerCount:complete:", objc_msgSend(v3, "automatchPlayerCount") - 1, 0);
  }
}

- (void)removePlayer:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__GKMultiplayerViewController_removePlayer___block_invoke;
  v8[3] = &unk_1E5F63350;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 removePlayers:v6 complete:v8];
}

void __44__GKMultiplayerViewController_removePlayer___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStartGameButtonTitle];
  [*(id *)(a1 + 32) removedPlayer:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) participantsInvitedByLocalPlayer];
  uint64_t v2 = [*(id *)(a1 + 40) internal];
  BOOL v3 = [v2 playerID];
  [v4 removeObject:v3];
}

- (int64_t)maxAvailablePlayers
{
  uint64_t v2 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  int64_t v3 = [v2 maxAvailablePlayers];

  return v3;
}

- (void)loadShareURLWithContactPlayers:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)presentPlayerPicker
{
  [(GKMultiplayerViewController *)self preparePlayerPicker];
  int64_t v3 = [(GKMultiplayerViewController *)self playerPickerViewController];
  [(GKMultiplayerViewController *)self willPresentPlayerPicker:v3];

  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "Will present player picker view controller", buf, 2u);
  }
  id v6 = [MEMORY[0x1E4F637F8] reporter];
  [v6 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63280]];

  id v7 = objc_alloc(MEMORY[0x1E4FB19E8]);
  uint64_t v8 = [(GKMultiplayerViewController *)self playerPickerViewController];
  id v9 = (void *)[v7 initWithRootViewController:v8];

  if (GKIsXRUIIdiomShouldUsePadUI()) {
    uint64_t v10 = 16;
  }
  else {
    uint64_t v10 = 2;
  }
  [v9 setModalPresentationStyle:v10];
  [v9 setOverrideUserInterfaceStyle:2];
  id v11 = [v9 presentationController];
  [v11 setDelegate:self];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__GKMultiplayerViewController_presentPlayerPicker__block_invoke;
  v12[3] = &unk_1E5F62EB0;
  v12[4] = self;
  [(GKMultiplayerViewController *)self presentViewController:v9 animated:1 completion:v12];
}

uint64_t __50__GKMultiplayerViewController_presentPlayerPicker__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFooterButtonStates];
}

- (void)preparePlayerPicker
{
  int64_t v3 = [(GKMultiplayerViewController *)self maxAvailablePlayers];
  id v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v6 = [v4 currentPlayers];

  id v5 = [[GKDashboardMultiplayerPickerViewController alloc] initWithMaxSelectable:v3 hiddenPlayers:v6 nearbyOnly:[(GKMultiplayerViewController *)self matchmakingMode] == 1 pickerOrigin:1];
  [(GKDashboardMultiplayerPickerViewController *)v5 setMultiplayerPickerDelegate:self];
  [(GKMultiplayerViewController *)self setPlayerPickerViewController:v5];
}

- (void)multiplayerPicker:(id)a3 didPickPlayers:(id)a4 messageGroups:(id)a5 customMessage:(id)a6
{
  id v9 = (void *)MEMORY[0x1E4F637F8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [v9 reporter];
  uint64_t v14 = *MEMORY[0x1E4F63530];
  [v13 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63268]];

  id v15 = [MEMORY[0x1E4F637F8] reporter];
  [v15 reportEvent:v14 type:*MEMORY[0x1E4F63250]];

  double v16 = [(GKMultiplayerViewController *)self matchRequest];
  [v16 setInviteMessage:v10];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__GKMultiplayerViewController_multiplayerPicker_didPickPlayers_messageGroups_customMessage___block_invoke;
  v17[3] = &unk_1E5F62EB0;
  v17[4] = self;
  [(GKMultiplayerViewController *)self didPickPlayers:v12 messageGroups:v11 source:1 completion:v17];
}

uint64_t __92__GKMultiplayerViewController_multiplayerPicker_didPickPlayers_messageGroups_customMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissPickerViewController];
}

- (void)didPickPlayers:(id)a3 messageGroups:(id)a4 source:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  [v13 setSelectedMessageGroups:v12];

  uint64_t v14 = (void *)MEMORY[0x1E4F636D8];
  id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerViewController.m", 729, "-[GKMultiplayerViewController didPickPlayers:messageGroups:source:completion:]");
  double v16 = [v14 dispatchGroupWithName:v15];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke;
  v22[3] = &unk_1E5F62F28;
  void v22[4] = self;
  id v23 = v10;
  id v17 = v10;
  [v16 perform:v22];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_4;
  v19[3] = &unk_1E5F64B28;
  id v20 = v11;
  unint64_t v21 = a5;
  void v19[4] = self;
  id v18 = v11;
  [v16 notifyOnMainQueueWithBlock:v19];
}

void __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) multiplayerDataSource];
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_2;
  v7[3] = &unk_1E5F64B00;
  objc_copyWeak(&v10, &location);
  id v8 = *(id *)(a1 + 40);
  id v6 = v3;
  id v9 = v6;
  [v4 addPlayers:v5 withStatus:11 replaceAutomatches:1 complete:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained participantsInvitedByLocalPlayer];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [*(id *)(a1 + 32) _gkMapWithBlock:&__block_literal_global_156];
  uint64_t v5 = [v3 setWithArray:v4];
  [v2 unionSet:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 internal];
  id v3 = [v2 playerID];

  return v3;
}

void __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStartGameButtonTitle];
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_5;
  v4[3] = &unk_1E5F639B0;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 setupInvitesForSource:v2 completion:v4];
}

uint64_t __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)multiplayerPickerDidCancel:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F637F8], "reporter", a3);
  [v4 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63240]];

  id v5 = [(GKMultiplayerViewController *)self playerPickerViewController];
  id v6 = [v5 presentingViewController];

  if (v6)
  {
    [(GKMultiplayerViewController *)self dismissPickerViewController];
  }
}

- (void)dismissPickerViewController
{
  id v3 = [(GKMultiplayerViewController *)self playerPickerViewController];
  [v3 setSupportsNearby:0];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__GKMultiplayerViewController_dismissPickerViewController__block_invoke;
  v4[3] = &unk_1E5F62EB0;
  void v4[4] = self;
  [(GKMultiplayerViewController *)self dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __58__GKMultiplayerViewController_dismissPickerViewController__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playerPickerViewController];
  id v3 = [v2 navigationController];
  [v3 setViewControllers:MEMORY[0x1E4F1CBF0]];

  id v4 = [*(id *)(a1 + 32) playerPickerViewController];
  id v5 = [v4 navigationController];
  [v5 removeFromParentViewController];

  id v6 = *(void **)(a1 + 32);

  return [v6 setPlayerPickerViewController:0];
}

- (BOOL)canStartForcedAutomatch
{
  return 0;
}

- (BOOL)allowPlayerCountSelection
{
  id v3 = [(GKMultiplayerViewController *)self matchRequest];
  if (v3)
  {
    id v4 = [(GKMultiplayerViewController *)self matchRequest];
    unint64_t v5 = [v4 maxPlayers];
    id v6 = [(GKMultiplayerViewController *)self matchRequest];
    BOOL v7 = v5 > [v6 minPlayers];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setInvitationType:(int64_t)a3
{
  if (self->_invitationType != a3)
  {
    self->_invitationType = a3;
    [(GKMultiplayerViewController *)self updateDataSourceInvitationEnabled];
  }
}

- (void)updateDataSourceInvitationEnabled
{
  int64_t v3 = [(GKMultiplayerViewController *)self invitationType];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3) {
      return;
    }
    BOOL v6 = [(GKMultiplayerViewController *)self isInSetupMode];
    id v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v7 = v4;
    BOOL v5 = v6;
  }
  else
  {
    id v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v7 = v4;
    BOOL v5 = 0;
  }
  [v4 setInvitingEnabled:v5];
}

- (void)setMatchmakingMode:(int64_t)a3
{
  self->_matchmakingMode = a3;
  [(GKMultiplayerViewController *)self determineInvitationType];
}

- (void)determineInvitationType
{
  [(GKMultiplayerViewController *)self setInvitationType:0];
  if ([(GKMultiplayerViewController *)self matchmakingMode] == 2)
  {
    int64_t v3 = [(GKMultiplayerViewController *)self footerView];
    [v3 setInviteFriendsButtonHidden:1];

    if ([(GKMultiplayerViewController *)self allowPlayerCountSelection]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    [(GKMultiplayerViewController *)self setInvitationType:v4];
  }
}

- (void)inviteFriendsButtonPressed
{
  int64_t v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  [v3 revertFailedPlayers];

  uint64_t v4 = [(GKMultiplayerViewController *)self footerView];
  [v4 setStartGameButtonEnabled:0];

  BOOL v5 = [(GKMultiplayerViewController *)self footerView];
  [v5 setInviteFriendsButtonEnabled:0];

  [(GKMultiplayerViewController *)self presentPlayerPicker];
}

- (id)preferredFocusEnvironments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(GKMultiplayerViewController *)self footerView];
  v7[0] = v3;
  uint64_t v4 = [(GKCollectionViewController *)self collectionView];
  v7[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (BOOL)setupInvitesForSource:(unint64_t)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  BOOL v5 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  [v5 revertFailedPlayers];

  BOOL v6 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v7 = [v6 playersToBeInvited];

  uint64_t v33 = [v7 count];
  if (v33)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v7;
      _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "Multiplayer - sendInvites, playersToInvite = %@", buf, 0xCu);
    }
    id v10 = objc_msgSend(MEMORY[0x1E4F636C8], "proxyForLocalPlayer", a3);
    id v11 = [v10 utilityService];
    id v12 = NSNumber;
    id v13 = [(GKMultiplayerViewController *)self matchRequest];
    uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "minPlayers"));
    id v15 = NSNumber;
    double v16 = [(GKMultiplayerViewController *)self matchRequest];
    id v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "maxPlayers"));
    [v11 recordMatchStart:@"unknown" minPlayers:v14 maxPlayers:v17];

    id v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v20);
          }
          double v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          double v25 = [v24 contact];

          if (v25) {
            unint64_t v26 = v19;
          }
          else {
            unint64_t v26 = v18;
          }
          [v26 addObject:v24];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v21);
    }

    objc_initWeak((id *)buf, self);
    double v27 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __64__GKMultiplayerViewController_setupInvitesForSource_completion___block_invoke;
    v35[3] = &unk_1E5F64B50;
    objc_copyWeak(v39, (id *)buf);
    id v28 = v19;
    id v36 = v28;
    id v29 = v18;
    id v37 = v29;
    v39[1] = v32;
    id v38 = v34;
    [v27 setStatus:1 forPlayers:v20 complete:v35];

    objc_destroyWeak(v39);
    objc_destroyWeak((id *)buf);
  }
  return v33 != 0;
}

void __64__GKMultiplayerViewController_setupInvitesForSource_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__GKMultiplayerViewController_setupInvitesForSource_completion___block_invoke_2;
  block[3] = &unk_1E5F638E8;
  void block[4] = WeakRetained;
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v7 = v3;
  uint64_t v9 = v4;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__GKMultiplayerViewController_setupInvitesForSource_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendInvitesToContactPlayers:*(void *)(a1 + 40) legacyPlayers:*(void *)(a1 + 48) source:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)performActionsForButtonStartGame
{
  id v3 = [MEMORY[0x1E4F637F8] reporter];
  [v3 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63290]];

  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  BOOL v5 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "Multiplayer Game - performActionsForButtonStartGame - Starting game", v6, 2u);
  }
  [(GKMultiplayerViewController *)self playNow];
}

- (void)cancelButtonPressed
{
  if (self->_matchRequest)
  {
    int v3 = [(GKMultiplayerFooterView *)self->_footerView isUserInteractionEnabled];
    id v4 = [MEMORY[0x1E4F637F8] reporter];
    BOOL v5 = v4;
    id v6 = (void *)MEMORY[0x1E4F63248];
    if (v3) {
      id v6 = (void *)MEMORY[0x1E4F63278];
    }
    [v4 reportEvent:*MEMORY[0x1E4F63530] type:*v6];
  }
  id v7 = [MEMORY[0x1E4F63660] reporter];
  id v8 = [(GKMultiplayerViewController *)self pageId];
  [v7 recordClickWithAction:@"dismiss" targetId:@"close" targetType:@"button" pageId:v8 pageType:@"multiplayer"];

  uint64_t v9 = [(GKMultiplayerViewController *)self footerView];
  [v9 setStartGameButtonEnabled:0];

  id v10 = [(GKMultiplayerViewController *)self footerView];
  [v10 setInviteFriendsButtonEnabled:0];

  [(GKMultiplayerViewController *)self cancel];
}

- (void)cancel
{
}

- (void)inviteContactPlayers:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F636D8];
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerViewController.m", 969, "-[GKMultiplayerViewController inviteContactPlayers:source:completion:]");
  id v12 = [v10 dispatchGroupWithName:v11];

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke;
  v22[3] = &unk_1E5F64BA0;
  void v22[4] = v23;
  [v12 perform:v22];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_177;
  v16[3] = &unk_1E5F64CB8;
  v16[4] = self;
  id v20 = v23;
  id v13 = v9;
  id v19 = v13;
  id v14 = v12;
  id v17 = v14;
  id v15 = v8;
  id v18 = v15;
  unint64_t v21 = a4;
  [v14 notifyOnMainQueueWithBlock:v16];

  _Block_object_dispose(v23, 8);
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  BOOL v5 = [v4 multiplayerService];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2;
  v8[3] = &unk_1E5F64B78;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v5 hasExistingInviteSessionWithHandler:v8];
}

uint64_t __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  BOOL v5 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = NSNumber;
    id v7 = v5;
    id v8 = [v6 numberWithBool:a2];
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "current invite session existence: %@", (uint8_t *)&v10, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_177(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) matchRequest];
  if (!v2) {
    goto LABEL_3;
  }
  id v3 = (void *)v2;
  uint64_t v4 = [*(id *)(a1 + 32) invitationType];

  if (v4) {
    goto LABEL_3;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = [*(id *)(a1 + 32) shareURL];
  if (v9)
  {
    char v10 = (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0) | isKindOfClass;

    if (v10)
    {
      if (!*MEMORY[0x1E4F63860]) {
        id v11 = (id)GKOSLoggers();
      }
      uint64_t v12 = (void *)*MEMORY[0x1E4F63870];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
      {
        id v13 = *(void **)(a1 + 32);
        id v14 = v12;
        id v15 = [v13 shareURL];
        *(_DWORD *)buf = 138412290;
        id v29 = v15;
        _os_log_impl(&dword_1AF250000, v14, OS_LOG_TYPE_INFO, "we have previously got the share URL: %@, trying to setShareInvitees", buf, 0xCu);
      }
      [*(id *)(a1 + 32) setShareInvitees];
      goto LABEL_3;
    }
  }
  if (!*MEMORY[0x1E4F63860]) {
    id v16 = (id)GKOSLoggers();
  }
  id v17 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v17, OS_LOG_TYPE_INFO, "loading share URL for Messages invites", buf, 2u);
  }
  [*(id *)(a1 + 32) setMessagesInviteStatus:0];
  if ([MEMORY[0x1E4F350F8] canSendText])
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_180;
    v25[3] = &unk_1E5F63008;
    id v18 = *(void **)(a1 + 40);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v18;
    id v27 = *(id *)(a1 + 48);
    [v26 perform:v25];

LABEL_3:
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_186;
    v20[3] = &unk_1E5F64C90;
    BOOL v5 = *(void **)(a1 + 40);
    void v20[4] = *(void *)(a1 + 32);
    id v21 = v5;
    id v23 = *(id *)(a1 + 56);
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 72);
    id v22 = v6;
    uint64_t v24 = v7;
    [v21 notifyOnMainQueueWithBlock:v20];

    return;
  }
  [*(id *)(a1 + 32) setMessagesInviteStatus:1];
  uint64_t v19 = *(void *)(a1 + 56);
  if (v19) {
    (*(void (**)(void))(v19 + 16))();
  }
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_180(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F636C8] daemonProxy];
  BOOL v5 = [v4 accountServicePrivate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_181;
  v8[3] = &unk_1E5F64BF0;
  id v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v11 = v3;
  id v10 = *(id *)(a1 + 48);
  id v7 = v3;
  [v5 isICloudAvailableWithHandler:v8];
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_181(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    uint64_t v6 = [*(id *)(a1 + 32) messagesInviteStatus];
  }
  else {
    uint64_t v6 = 2;
  }
  [*(id *)(a1 + 32) setMessagesInviteStatus:v6];
  if (v5 || (a2 & 1) == 0)
  {
    [*(id *)(a1 + 40) setError:v5];
    if (!*MEMORY[0x1E4F63860]) {
      id v12 = (id)GKOSLoggers();
    }
    id v13 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_181_cold_1(v13, a2, (uint64_t)v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    id v8 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF250000, v8, OS_LOG_TYPE_INFO, "CloudKit is available.", buf, 2u);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_182;
    v14[3] = &unk_1E5F64BC8;
    id v10 = *(void **)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = v11;
    [v10 loadShareURLWithContactPlayers:v9 completion:v14];
  }
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_182(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F63860];
  if (v6)
  {
    if (!v7) {
      id v8 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_182_cold_1();
    }
    [*(id *)(a1 + 32) setError:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (!v7) {
      id v9 = (id)GKOSLoggers();
    }
    id v10 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1AF250000, v10, OS_LOG_TYPE_INFO, "Received shareURL for Messages invites: %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_183;
    block[3] = &unk_1E5F647F8;
    void block[4] = *(void *)(a1 + 40);
    id v12 = v5;
    id v13 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_183(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8)) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 3;
  }
  [v2 setMessagesInviteStatus:v4];
  [*(id *)(a1 + 32) setShareURL:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setShareInvitees];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_186(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) shareURL];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [*(id *)(a1 + 40) error],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    id v15 = [MEMORY[0x1E4F637F8] reporter];
    [v15 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F632B8]];

    uint64_t v16 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    id v17 = [v16 utilityService];
    id v18 = NSNumber;
    uint64_t v19 = [*(id *)(a1 + 32) matchRequest];
    id v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "minPlayers"));
    id v21 = NSNumber;
    id v22 = [*(id *)(a1 + 32) matchRequest];
    id v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "maxPlayers"));
    [v17 recordMatchStart:@"contact" minPlayers:v20 maxPlayers:v23];

    uint64_t v24 = [*(id *)(a1 + 32) matchRequest];
    uint64_t v25 = [v24 minPlayers];
    id v26 = [*(id *)(a1 + 32) matchRequest];
    uint64_t v27 = [v26 maxPlayers];
    id v28 = [*(id *)(a1 + 32) matchRequest];
    uint64_t v29 = v27 - [v28 minPlayers];

    uint64_t v30 = [*(id *)(a1 + 32) shareURL];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_191;
    v34[3] = &unk_1E5F64C68;
    v34[4] = *(void *)(a1 + 32);
    id v31 = *(id *)(a1 + 48);
    uint64_t v33 = *(void **)(a1 + 56);
    uint64_t v32 = *(void *)(a1 + 64);
    id v35 = v31;
    uint64_t v37 = v32;
    id v36 = v33;
    +[GKMessageUtilities linkMetadataWithPlayerRange:shareURL:completionHandler:](GKMessageUtilities, "linkMetadataWithPlayerRange:shareURL:completionHandler:", v25, v29, v30, v34);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    id v8 = (os_log_t *)MEMORY[0x1E4F63870];
    id v9 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_186_cold_2(v2, v9, a1);
    }
    id v10 = [*(id *)(a1 + 40) error];

    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = [*(id *)(a1 + 40) error];
      [v11 handleServiceUnavailable:v12];

      [*(id *)(a1 + 32) performActionsForButtonCancelCurrentMatching];
    }
    else
    {
      if (!*v6) {
        id v13 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
        __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_186_cold_1();
      }
    }
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14) {
      (*(void (**)(void))(v14 + 16))();
    }
  }
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_191(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F30AA8]);
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setMetadata:v34];
    id v59 = 0;
    uint64_t v33 = v4;
    id v5 = [v4 dataRepresentationWithOutOfLineAttachments:&v59];
    id v6 = v59;
    id v7 = [MEMORY[0x1E4F1CA80] set];
    id v8 = [*(id *)(a1 + 32) multiplayerDataSource];
    id v9 = [v8 selectedMessageGroups];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_193;
    v53[3] = &unk_1E5F64C18;
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 32);
    id v40 = v10;
    id v54 = v10;
    uint64_t v55 = v11;
    id v35 = v34;
    id v56 = v35;
    id v36 = v5;
    id v57 = v36;
    id v37 = v6;
    id v58 = v37;
    [v9 enumerateObjectsUsingBlock:v53];

    id v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v52 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v49 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v50;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v49 + 1) + 8 * v14);
          uint64_t v45 = 0;
          v46 = &v45;
          uint64_t v47 = 0x2020000000;
          char v48 = 0;
          uint64_t v16 = [*(id *)(a1 + 32) multiplayerDataSource];
          id v17 = [v16 selectedMessageGroups];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_199;
          v41[3] = &unk_1E5F64C40;
          id v42 = v40;
          long long v43 = v15;
          v44 = &v45;
          [v17 enumerateObjectsUsingBlock:v41];

          if (*((unsigned char *)v46 + 24))
          {
            if (!*MEMORY[0x1E4F63860]) {
              id v18 = (id)GKOSLoggers();
            }
            uint64_t v19 = *MEMORY[0x1E4F63870];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v61 = v15;
              _os_log_debug_impl(&dword_1AF250000, v19, OS_LOG_TYPE_DEBUG, "Skipping individual contact already included in group invite: %@", buf, 0xCu);
            }
          }
          else
          {
            id v20 = [v15 contact];

            if (v20)
            {
              id v21 = [v15 contact];
              id v22 = +[GKMessageUtilities messagesRecipientHandleForContact:v21];

              if (v22 && *(void *)(a1 + 56))
              {
                id v23 = [*(id *)(a1 + 32) matchRequest];
                uint64_t v24 = [v23 inviteMessage];
                uint64_t v25 = [v24 length];

                if (v25)
                {
                  id v26 = [*(id *)(a1 + 32) matchRequest];
                  [v26 inviteMessage];
                }
                else
                {
                  id v26 = GKGameCenterUIFrameworkBundle();
                  GKGetLocalizedStringFromTableInBundle();
                uint64_t v27 = };
                IMSPISendMessageWithAttachments();

                uint64_t v29 = [v35 originalURL];
                IMSPISendRichLink();

                if (!*MEMORY[0x1E4F63860]) {
                  id v30 = (id)GKOSLoggers();
                }
                id v31 = *MEMORY[0x1E4F63870];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v61 = v22;
                  _os_log_debug_impl(&dword_1AF250000, v31, OS_LOG_TYPE_DEBUG, "Sent message invitation via IMSPISendRichLink, to: %@", buf, 0xCu);
                }
              }
            }
            else
            {
              id v28 = [v15 displayNameWithOptions:0];
              [v38 setObject:v15 forKeyedSubscript:v28];
            }
          }

          _Block_object_dispose(&v45, 8);
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
      }
      while (v12);
    }

    [*(id *)(a1 + 32) didInviteContactPlayers];
    uint64_t v4 = v33;
  }
  uint64_t v32 = *(void *)(a1 + 48);
  if (v32) {
    (*(void (**)(void))(v32 + 16))();
  }
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_193(id *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 conversationIdentifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v27 = [v3 conversationIdentifier];
    id v6 = (void *)MEMORY[0x1E4F1CA48];
    id v7 = [v3 players];
    id v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = [v3 players];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v28 + 1) + 8 * v13) contact];
          id v15 = +[GKMessageUtilities messagesRecipientHandleForContact:v14];

          if (v15) {
            [v8 addObject:v15];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }

    uint64_t v16 = [v3 players];
    uint64_t v17 = [v16 count];
    uint64_t v18 = [v8 count];

    if (v17 == v18)
    {
      uint64_t v19 = [a1[5] matchRequest];
      id v20 = [v19 inviteMessage];
      if ([v20 length])
      {
        id v21 = [a1[5] matchRequest];
        [v21 inviteMessage];
      }
      else
      {
        id v21 = GKGameCenterUIFrameworkBundle();
        GKGetLocalizedStringFromTableInBundle();
      uint64_t v24 = };
      id v23 = (void *)v27;

      IMSPISendMessageWithAttachmentsToMany();
      uint64_t v25 = [a1[6] originalURL];
      IMSPISendRichLinkToMany();

      if (!*MEMORY[0x1E4F63860]) {
        id v26 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
        __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_193_cold_1();
      }
    }
    else
    {
      [a1[4] addObject:v3];
      if (!*MEMORY[0x1E4F63860]) {
        id v22 = (id)GKOSLoggers();
      }
      id v23 = (void *)v27;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
        __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_193_cold_2();
      }
    }
  }
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_199(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    uint64_t v5 = [v8 conversationIdentifier];
    if ([v5 length])
    {
      id v6 = [v8 players];
      int v7 = [v6 containsObject:*(void *)(a1 + 40)];

      if (v7)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
    else
    {
    }
  }
}

- (void)setShareURL:(id)a3
{
  p_shareURL = &self->_shareURL;
  objc_storeStrong((id *)&self->_shareURL, a3);
  unint64_t v5 = 3;
  if (*p_shareURL) {
    unint64_t v5 = 4;
  }
  self->_messagesInviteStatus = v5;
}

- (void)handleServiceUnavailable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke;
  v6[3] = &unk_1E5F63350;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1418];
  id v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  id v5 = [v2 alertControllerWithTitle:0 message:v4 preferredStyle:1];

  id v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = GKGameCenterUIFrameworkBundle();
  id v8 = GKGetLocalizedStringFromTableInBundle();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke_2;
  v14[3] = &unk_1E5F63170;
  void v14[4] = *(void *)(a1 + 40);
  id v9 = [v6 actionWithTitle:v8 style:1 handler:v14];

  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v11 = GKGameCenterUIFrameworkBundle();
  uint64_t v12 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v13 = [v10 actionWithTitle:v12 style:0 handler:&__block_literal_global_217];

  [v5 addAction:v9];
  [v5 addAction:v13];
  [*(id *)(a1 + 40) presentViewController:v5 animated:1 completion:0];
}

uint64_t __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didClickCancelForServiceUnavailableAlert];
}

void __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke_3()
{
  id v1 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v0 = [v1 utilityService];
  [v0 openICloudSettings];
}

- (void)localPlayerAcceptedGameInvite:(id)a3
{
  [(GKMultiplayerViewController *)self setDidAcceptGameInvite:1];

  [(GKMultiplayerViewController *)self cancel];
}

- (void)playersToInvite:(id)a3
{
  [(GKMultiplayerViewController *)self setDidAcceptGameInvite:1];

  [(GKMultiplayerViewController *)self cancel];
}

- (void)handleNewParticipantCount:(int64_t)a3
{
  id v14 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v5 = [v14 participants];
  uint64_t v6 = [v5 count];

  if (v6 != a3)
  {
    id v7 = [v14 players];
    uint64_t v8 = [v7 count];

    int64_t v9 = a3 - v8;
    if (a3 - v8 >= 0) {
      [v14 setAutomatchPlayerCount:v9 complete:0];
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F637E8], "shared", v9);
    [v10 setRecentNumberOfPlayers:a3];

    uint64_t v11 = [MEMORY[0x1E4F637E8] shared];
    uint64_t v12 = [(GKMultiplayerViewController *)self game];
    uint64_t v13 = [v12 bundleIdentifier];
    [v11 setRecentNumberOfPlayers:a3 forBundleID:v13];
  }
}

- (void)didTapRemoveParticipant:(id)a3
{
  id v4 = [a3 player];
  [(GKMultiplayerViewController *)self removePlayer:v4];
}

- (void)dataSource:(id)a3 didRefreshSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GKMultiplayerViewController *)self isViewLoaded])
  {
    uint64_t v8 = [(GKMultiplayerViewController *)self view];
    int64_t v9 = [v8 window];

    if (v9)
    {
      uint64_t v10 = [(GKMultiplayerViewController *)self buttonHeaderView];

      if (v10)
      {
        if ([(GKMultiplayerViewController *)self isLoading])
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __61__GKMultiplayerViewController_dataSource_didRefreshSections___block_invoke;
          block[3] = &unk_1E5F63E80;
          id v13 = v6;
          id v14 = v7;
          id v15 = self;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
        else
        {
          v11.receiver = self;
          v11.super_class = (Class)GKMultiplayerViewController;
          [(GKCollectionViewController *)&v11 dataSource:v6 didRefreshSections:v7];
        }
      }
    }
  }
}

id __61__GKMultiplayerViewController_dataSource_didRefreshSections___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)GKMultiplayerViewController;
  return objc_msgSendSuper2(&v4, sel_dataSource_didRefreshSections_, v2, v1);
}

- (BOOL)isLoading
{
  uint64_t v2 = [(GKCollectionViewController *)self loadingState];
  BOOL v3 = 1;
  if (v2)
  {
    if (v2 != @"Initial" && v2 != @"LoadingState") {
      BOOL v3 = v2 == @"RefreshingState";
    }
  }

  return v3;
}

- (int64_t)multiplayerCellLayoutMode
{
  uint64_t v2 = [(GKMultiplayerViewController *)self viewControllerLayout];
  int64_t v3 = [v2 cellLayoutMode];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GKMultiplayerViewController;
  [(GKCollectionViewController *)&v17 traitCollectionDidChange:v4];
  id v5 = [(GKMultiplayerViewController *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];
  if (v6 == [v4 horizontalSizeClass])
  {
    id v7 = [(GKMultiplayerViewController *)self traitCollection];
    uint64_t v8 = [v7 verticalSizeClass];
    if (v8 == [v4 verticalSizeClass])
    {
      int64_t v9 = [(GKMultiplayerViewController *)self traitCollection];
      uint64_t v10 = [v9 layoutDirection];
      if (v10 == [v4 layoutDirection])
      {
        objc_super v11 = [(GKMultiplayerViewController *)self traitCollection];
        uint64_t v12 = [v11 preferredContentSizeCategory];
        id v13 = [v4 preferredContentSizeCategory];

        if (v12 == v13) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  [(GKMultiplayerViewController *)self setViewNeedsLayout];
  id v14 = [(GKCollectionViewController *)self collectionView];
  [v14 reloadData];

  id v15 = [(GKCollectionViewController *)self collectionView];
  uint64_t v16 = [v15 collectionViewLayout];
  [v16 invalidateLayout];

LABEL_10:
  [(GKMultiplayerViewController *)self configureAutoBounce];
}

- (void)configureAutoBounce
{
  int64_t v3 = [(GKMultiplayerViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    id v5 = [(GKCollectionViewController *)self collectionView];
    uint64_t v6 = v5;
  }
  else
  {
    id v7 = [(GKMultiplayerViewController *)self traitCollection];
    uint64_t v8 = [v7 verticalSizeClass];

    id v5 = [(GKCollectionViewController *)self collectionView];
    uint64_t v6 = v5;
    if (v8 == 1)
    {
      [v5 setAlwaysBounceVertical:0];

      int64_t v9 = [(GKCollectionViewController *)self collectionView];
      id v11 = v9;
      uint64_t v10 = 1;
      goto LABEL_6;
    }
  }
  [v5 setAlwaysBounceVertical:1];

  int64_t v9 = [(GKCollectionViewController *)self collectionView];
  id v11 = v9;
  uint64_t v10 = 0;
LABEL_6:
  [v9 setAlwaysBounceHorizontal:v10];
}

- (void)didUpdateParticipants
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [(GKMultiplayerViewController *)self updateFooterButtonStates];
  int64_t v3 = [(GKMultiplayerViewController *)self buttonHeaderView];

  if (!v3)
  {
    if ([(GKMultiplayerViewController *)self showNavigationBar])
    {
      uint64_t v4 = [(GKMultiplayerViewController *)self makeDoubleHeaderView];
    }
    else
    {
      uint64_t v4 = [(GKMultiplayerViewController *)self makeButtonHeaderView];
      [v4 applyGame:self->_game];
      id v5 = [(GKMultiplayerViewController *)self view];
      [v5 addSubview:v4];

      if (v4)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4FB1780]);
        v9[0] = v4;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
        [v6 setPreferredFocusEnvironments:v7];

        uint64_t v8 = [(GKMultiplayerViewController *)self view];
        [v8 addLayoutGuide:v6];

        [MEMORY[0x1E4F28DC8] _gkInstallEdgeConstraintsForLayoutGuide:v6 containedWithinParentView:v4];
      }
    }
    [(GKMultiplayerViewController *)self setButtonHeaderView:v4];
  }
  [(GKMultiplayerViewController *)self updateTitle];
  [(GKMultiplayerViewController *)self setViewNeedsLayout];
}

- (void)updateFooterButtonStates
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(GKMultiplayerViewController *)self maxAvailablePlayers] > 0;
  uint64_t v4 = [(GKMultiplayerViewController *)self footerView];
  [v4 setInviteFriendsButtonEnabled:v3];

  id v5 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v6 = [v5 participants];
  unint64_t v7 = [v6 count];
  BOOL v8 = v7 >= [v5 minPlayers];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int64_t v9 = objc_msgSend(v5, "participants", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v15 = [v14 player];
        char v16 = [v15 isLocalPlayer];

        if ((v16 & 1) == 0
          && ([(GKMultiplayerViewController *)self matchmakingMode] == 3
           || [(GKMultiplayerViewController *)self matchmakingMode] == 1
           || [v14 type] != 1)
          && [v14 status] != 7
          && [v14 status] != 21
          && [v14 status] != 20)
        {
          BOOL v8 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if ([(GKMultiplayerViewController *)self canStartWithMinimumPlayers])
  {
    objc_super v17 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    uint64_t v18 = [v17 readyPlayers];
    unint64_t v19 = [v18 count];
    id v20 = [(GKMultiplayerViewController *)self matchRequest];
    unint64_t v21 = [v20 minPlayers];

    if (v19 >= v21) {
      BOOL v8 = 1;
    }
  }
  id v22 = [(GKMultiplayerViewController *)self matchRequest];
  uint64_t v23 = v8 & ~[v22 hasFutureRecipientProperties];
  uint64_t v24 = [(GKMultiplayerViewController *)self footerView];
  [v24 setStartGameButtonEnabled:v23];
}

- (id)makeButtonHeaderView
{
  objc_initWeak(&location, self);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  unint64_t v19 = __51__GKMultiplayerViewController_makeButtonHeaderView__block_invoke;
  id v20 = &unk_1E5F634E8;
  objc_copyWeak(&v21, &location);
  BOOL v3 = _Block_copy(&v17);
  uint64_t v4 = [_TtC12GameCenterUI29GKMultiplayerButtonHeaderView alloc];
  id v5 = [(GKMultiplayerViewController *)self matchRequest];
  unint64_t v6 = [v5 minPlayers];

  unint64_t v7 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  BOOL v8 = [v7 players];
  unint64_t v9 = [v8 count];

  if (v6 <= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v6;
  }
  uint64_t v11 = [(GKMultiplayerViewController *)self matchRequest];
  uint64_t v12 = [v11 maxPlayers];
  id v13 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v14 = [v13 participants];
  id v15 = -[GKMultiplayerButtonHeaderView initWithMinimumValue:maximumValue:initialValue:cancelButtonHandler:](v4, "initWithMinimumValue:maximumValue:initialValue:cancelButtonHandler:", v10, v12, [v14 count], v3);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v15;
}

void __51__GKMultiplayerViewController_makeButtonHeaderView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancelButtonPressed];
}

- (id)makeDoubleHeaderView
{
  BOOL v3 = [_TtC12GameCenterUI26NavigationDoubleHeaderView alloc];
  uint64_t v4 = -[NavigationDoubleHeaderView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v5 = [(GKGame *)self->_game name];
  [(NavigationDoubleHeaderView *)v4 setTitleText:v5];

  [(GKMultiplayerViewController *)self updateTitle];
  unint64_t v6 = [(GKMultiplayerViewController *)self navigationItem];
  [v6 setTitleView:v4];

  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed];
  BOOL v8 = [(GKMultiplayerViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  return v4;
}

- (int64_t)automatchParticipantStatus
{
  return 0;
}

- (BOOL)isInSetupMode
{
  return 0;
}

- (BOOL)isCanceling
{
  return 0;
}

- (BOOL)allowAutoMatch
{
  if ([(GKMultiplayerViewController *)self matchmakingMode] == 3
    || [(GKMultiplayerViewController *)self matchmakingMode] == 1)
  {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F637E8] shared];
  BOOL v3 = [v4 multiplayerAllowedPlayerType] == 2;

  return v3;
}

- (BOOL)isParticipantInvitedByLocalPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMultiplayerViewController *)self participantsInvitedByLocalPlayer];
  unint64_t v6 = [v4 player];

  unint64_t v7 = [v6 internal];
  BOOL v8 = [v7 playerID];
  char v9 = [v5 containsObject:v8];

  return v9;
}

- (void)setViewNeedsLayout
{
  id v2 = [(GKMultiplayerViewController *)self view];
  [v2 setNeedsLayout];
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (GKMatchRequest)originalMatchRequest
{
  return self->_originalMatchRequest;
}

- (NSString)defaultInvitationMessage
{
  return self->_defaultInvitationMessage;
}

- (void)setDefaultInvitationMessage:(id)a3
{
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (BOOL)showNavigationBar
{
  return self->_showNavigationBar;
}

- (void)setShowNavigationBar:(BOOL)a3
{
  self->_showNavigationBar = a3;
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (BOOL)didAcceptGameInvite
{
  return self->_didAcceptGameInvite;
}

- (void)setDidAcceptGameInvite:(BOOL)a3
{
  self->_didAcceptGameInvite = a3;
}

- (GKDashboardNearbyBrowserDelegate)nearbyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nearbyDelegate);

  return (GKDashboardNearbyBrowserDelegate *)WeakRetained;
}

- (void)setNearbyDelegate:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (BOOL)didStartForcedAutomatch
{
  return self->_didStartForcedAutomatch;
}

- (void)setDidStartForcedAutomatch:(BOOL)a3
{
  self->_didStartForcedAutomatch = a3;
}

- (int64_t)matchmakingMode
{
  return self->_matchmakingMode;
}

- (_TtC12GameCenterUI23GKMultiplayerFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (BOOL)canStartWithMinimumPlayers
{
  return self->_canStartWithMinimumPlayers;
}

- (void)setCanStartWithMinimumPlayers:(BOOL)a3
{
  self->_canStartWithMinimumPlayers = a3;
}

- (BOOL)canStartGroupActivities
{
  return self->_canStartGroupActivities;
}

- (NSMutableSet)participantsInvitedByLocalPlayer
{
  return self->_participantsInvitedByLocalPlayer;
}

- (void)setParticipantsInvitedByLocalPlayer:(id)a3
{
}

- (void)setMultiplayerDataSource:(id)a3
{
}

- (BOOL)addButtonEnabled
{
  return self->_addButtonEnabled;
}

- (void)setAddButtonEnabled:(BOOL)a3
{
  self->_addButtonEnabled = a3;
}

- (UIView)buttonHeaderView
{
  return self->_buttonHeaderView;
}

- (void)setButtonHeaderView:(id)a3
{
}

- (GKDashboardMultiplayerPickerViewController)playerPickerViewController
{
  return self->_playerPickerViewController;
}

- (void)setPlayerPickerViewController:(id)a3
{
}

- (int64_t)invitationType
{
  return self->_invitationType;
}

- (unint64_t)messagesInviteStatus
{
  return self->_messagesInviteStatus;
}

- (void)setMessagesInviteStatus:(unint64_t)a3
{
  self->_messagesInviteStatus = a3;
}

- (GKBoopHandler)boopHandler
{
  return self->_boopHandler;
}

- (void)setBoopHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boopHandler, 0);
  objc_storeStrong((id *)&self->_playerPickerViewController, 0);
  objc_storeStrong((id *)&self->_buttonHeaderView, 0);
  objc_storeStrong((id *)&self->_multiplayerDataSource, 0);
  objc_storeStrong((id *)&self->_participantsInvitedByLocalPlayer, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_destroyWeak((id *)&self->_nearbyDelegate);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_defaultInvitationMessage, 0);
  objc_storeStrong((id *)&self->_originalMatchRequest, 0);

  objc_storeStrong((id *)&self->_matchRequest, 0);
}

void __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "Unable to find booped contact.", v2, v3, v4, v5, v6);
}

void __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "Contact has already been invited, will not construct a new share URL.", v2, v3, v4, v5, v6);
}

void __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 originalMatchRequest];
  uint64_t v5 = [v4 recipients];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1AF250000, v3, OS_LOG_TYPE_ERROR, "Failed to load recipients from: %@", v6, 0xCu);
}

void __46__GKMultiplayerViewController_viewWillAppear___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "Started boop nearby discovery.", v2, v3, v4, v5, v6);
}

void __46__GKMultiplayerViewController_viewWillAppear___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "Error occured while starting boop nearby discovery: %@", v2, v3, v4, v5, v6);
}

void __48__GKMultiplayerViewController_viewDidDisappear___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "Stopped boop handling.", v2, v3, v4, v5, v6);
}

void __48__GKMultiplayerViewController_viewDidDisappear___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "Error occured while stopping boop handler: %@", v2, v3, v4, v5, v6);
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_181_cold_1(void *a1, char a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  uint8_t v6 = a1;
  uint64_t v7 = [v5 numberWithBool:a2 & 1];
  OUTLINED_FUNCTION_4();
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_1AF250000, v6, OS_LOG_TYPE_ERROR, "CloudKit is not available. availibility: %@ error: %@", v8, 0x16u);
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_182_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1AF250000, v1, OS_LOG_TYPE_ERROR, "Error encountered for loadShareURLWithContactPlayers:completion:, in Messages invites: %@ error: %@", v2, 0x16u);
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_186_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1AF250000, v0, OS_LOG_TYPE_ERROR, "It should not happen. ShareURL is nil but there is no error found.", v1, 2u);
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_186_cold_2(id *a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  id v6 = *a1;
  uint64_t v7 = a2;
  BOOL v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "messagesInviteStatus"));
  uint64_t v9 = [*a1 shareURL];
  uint64_t v10 = [*(id *)(a3 + 40) error];
  int v11 = 138412802;
  uint64_t v12 = v8;
  __int16 v13 = 2112;
  id v14 = v9;
  __int16 v15 = 2112;
  char v16 = v10;
  _os_log_error_impl(&dword_1AF250000, v7, OS_LOG_TYPE_ERROR, "Cannot invite contact players - no shareURL or encountered error. Message Invite Status: %@, shareURL: %@, error: %@", (uint8_t *)&v11, 0x20u);
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_193_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "Sent group message invitation via IMSPISendRichLink, to: %@", v2, v3, v4, v5, v6);
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_193_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "Skipping group message invitation to: %@, due to one or more nil participant handles", v2, v3, v4, v5, v6);
}

@end