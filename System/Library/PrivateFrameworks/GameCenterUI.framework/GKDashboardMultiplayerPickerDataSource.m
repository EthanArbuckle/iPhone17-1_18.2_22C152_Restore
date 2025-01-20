@interface GKDashboardMultiplayerPickerDataSource
- (BOOL)_canShowMoreFriends;
- (BOOL)browsingForNearbyPlayers;
- (BOOL)canSelectPlayerGroup:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)didLoad;
- (BOOL)excludesContacts;
- (BOOL)hasFriends;
- (BOOL)isPlayerAtIndexPathCoreRecent:(id)a3;
- (BOOL)isShowingAddFriendsFooter;
- (BOOL)isShowingNearbyExpanded;
- (BOOL)nearbyOnly;
- (BOOL)playerIsSelectable:(id)a3;
- (BOOL)playerIsSelected:(id)a3;
- (BOOL)selectionShouldSkipDelegateResponse;
- (BOOL)shouldSelectPlayerGroup:(id)a3;
- (BOOL)showingExpandedSearch;
- (BOOL)showsAllFriends;
- (BOOL)supportsNearby;
- (CGSize)boundingSizeForItemsInCollectionView:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKContactDataSource)contactSource;
- (GKDashboardMultiplayerPickerDataSource)initWithMaxSelectable:(int64_t)a3 previouslyInvitedPlayers:(id)a4 nearbyOnly:(BOOL)a5 pickerOrigin:(int64_t)a6;
- (GKDashboardMultiplayerPickerDatasourceDelegate)delegate;
- (GKDashboardNearbyBrowserDelegate)nearbyDelegate;
- (NSArray)friendPlayers;
- (NSArray)searchPlayersAndGroups;
- (NSArray)selectedPlayers;
- (NSArray)suggestedPlayers;
- (NSMutableArray)contactPlayers;
- (NSMutableArray)nearbyPlayers;
- (NSMutableArray)suggestedPlayerGroups;
- (NSMutableDictionary)playerStates;
- (NSMutableSet)previouslyInvitedPlayers;
- (NSMutableSet)selectedMessageGroups;
- (_TtC12GameCenterUI26GKSuggestionsContainerCell)suggestionContainerCell;
- (double)playerCellHeightInCollectionView:(id)a3;
- (double)preferredCollectionHeight;
- (id)alternateSearchKeyForSection:(int64_t)a3;
- (id)attributedFriendFilterTitle;
- (id)candidateIndexPaths;
- (id)collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)firstIndexPathForPlayer:(id)a3;
- (id)fullContactWithIdentifier:(id)a3;
- (id)headerTextForSection:(int64_t)a3;
- (id)indexPathForFirstPlayer;
- (id)indexPathForPlayer:(id)a3 inSection:(unint64_t)a4;
- (id)indexPathsForPlayer:(id)a3;
- (id)nearbyPlayersChangedHandler;
- (id)playerCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4;
- (id)playerForIndexPath:(id)a3;
- (id)playerForPlayerID:(id)a3;
- (id)playerGroupCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4;
- (id)playersForSection:(int64_t)a3 ignoreSearch:(BOOL)a4;
- (id)searchKeyForSection:(int64_t)a3;
- (id)suggestionsCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4;
- (int)numberOfFriendsToShowInitially;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)defaultFilterScopeFromPickerOrigin:(int64_t)a3;
- (int64_t)friendSortFilterScope;
- (int64_t)getSelectedPlayerCount;
- (int64_t)itemCount;
- (int64_t)maxSelectable;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)pickerOrigin;
- (int64_t)unmodifiedItemCount;
- (unint64_t)cornerMaskForItemAtIndexPath:(id)a3;
- (unint64_t)cornerMaskForSectionHeader;
- (void)clearSelection;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)didAddRecipientPlayers:(id)a3;
- (void)didAttemptSelectingAlreadySelectedPlayers:(id)a3 inGroup:(id)a4;
- (void)didDeselectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
- (void)didDeselectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
- (void)didPickContact:(id)a3;
- (void)didRemoveRecipientPlayers:(id)a3;
- (void)didSelectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
- (void)didSelectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
- (void)donateGroupToPeopleSuggester:(id)a3;
- (void)expandPlayerGroup:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5;
- (void)expandedGroupViewControllerWillDismiss;
- (void)handleLongPressGesture:(id)a3;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)pickerWillSendInvites;
- (void)searchTextHasChanged;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)setBrowsingForNearbyPlayers:(BOOL)a3;
- (void)setContactPlayers:(id)a3;
- (void)setContactSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidLoad:(BOOL)a3;
- (void)setExcludesContacts:(BOOL)a3;
- (void)setFriendPlayers:(id)a3;
- (void)setFriendSortFilterScope:(int64_t)a3;
- (void)setIsShowingNearbyExpanded:(BOOL)a3;
- (void)setMaxSelectable:(int64_t)a3;
- (void)setNearbyDelegate:(id)a3;
- (void)setNearbyOnly:(BOOL)a3;
- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4;
- (void)setNearbyPlayerID:(id)a3 reachable:(BOOL)a4;
- (void)setNearbyPlayers:(id)a3;
- (void)setNearbyPlayersChangedHandler:(id)a3;
- (void)setNumberOfFriendsToShowInitially:(int)a3;
- (void)setPickerOrigin:(int64_t)a3;
- (void)setPlayerStates:(id)a3;
- (void)setPreviouslyInvitedPlayers:(id)a3;
- (void)setSearchPlayersAndGroups:(id)a3;
- (void)setSelectedMessageGroups:(id)a3;
- (void)setSelectionShouldSkipDelegateResponse:(BOOL)a3;
- (void)setShowingExpandedSearch:(BOOL)a3;
- (void)setShowsAllFriends:(BOOL)a3;
- (void)setSuggestedPlayerGroups:(id)a3;
- (void)setSuggestedPlayers:(id)a3;
- (void)setSuggestionContainerCell:(id)a3;
- (void)setSupportsNearby:(BOOL)a3;
- (void)setupCollectionView:(id)a3;
- (void)showSelectionLimitAlert;
- (void)sortPlayersByNickname:(id)a3;
- (void)sortPlayersByRecentlyPlayed:(id)a3;
- (void)updateMessageGroupsPlayerSelection;
- (void)updatePlayerGroups:(id)a3 forPlayers:(id)a4 excludedIndexPath:(id)a5;
- (void)updateSelectionStateForCollectionView:(id)a3 indexPaths:(id)a4;
- (void)updateStateForUnreachableNearbyPlayer:(id)a3;
- (void)updateVisibleItemsWithPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
@end

@implementation GKDashboardMultiplayerPickerDataSource

- (GKDashboardMultiplayerPickerDataSource)initWithMaxSelectable:(int64_t)a3 previouslyInvitedPlayers:(id)a4 nearbyOnly:(BOOL)a5 pickerOrigin:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GKDashboardMultiplayerPickerDataSource;
  v11 = [(GKCollectionDataSource *)&v23 init];
  v12 = v11;
  if (v11)
  {
    [(GKDashboardMultiplayerPickerDataSource *)v11 setMaxSelectable:a3];
    v13 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setPreviouslyInvitedPlayers:v13];

    v14 = [MEMORY[0x1E4F1CA48] array];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setNearbyPlayers:v14];

    v15 = [MEMORY[0x1E4F1CA48] array];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setFriendPlayers:v15];

    v16 = [MEMORY[0x1E4F1CA48] array];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setSuggestedPlayers:v16];

    v17 = [MEMORY[0x1E4F1CA48] array];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setSuggestedPlayerGroups:v17];

    v12->_friendSortFilterScope = [(GKDashboardMultiplayerPickerDataSource *)v12 defaultFilterScopeFromPickerOrigin:a6];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setNearbyOnly:v7];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setIsShowingNearbyExpanded:0];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setShowsAllFriends:a6 != 1];
    v18 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v19 = [v18 userInterfaceIdiom];

    if (v19 == 1) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 5;
    }
    [(GKDashboardMultiplayerPickerDataSource *)v12 setNumberOfFriendsToShowInitially:v20];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setPickerOrigin:a6];
    [(GKDashboardMultiplayerPickerDataSource *)v12 setExcludesContacts:a6 != 1];
    if (![(GKDashboardMultiplayerPickerDataSource *)v12 excludesContacts])
    {
      v21 = [MEMORY[0x1E4F1CA48] array];
      [(GKDashboardMultiplayerPickerDataSource *)v12 setContactPlayers:v21];
    }
  }

  return v12;
}

- (id)collectionView
{
  v2 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
  v3 = [v2 pickerCollectionView];

  return v3;
}

- (void)setupCollectionView:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)GKDashboardMultiplayerPickerDataSource;
  id v3 = a3;
  [(GKCollectionDataSource *)&v17 setupCollectionView:v3];
  v4 = +[NSObject _gkNibWithBaseName:@"GKDashboardPickerPlayerCell", v17.receiver, v17.super_class];
  [v3 registerNib:v4 forCellWithReuseIdentifier:@"playerCell"];

  [v3 setAllowsMultipleSelection:1];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"playerPickerNearbyInstructionCell"];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *MEMORY[0x1E4FB2760];
  [v3 registerClass:v5 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"friendsSectionFooterShowMoreFriendsReuseIdentifier"];
  BOOL v7 = +[NSObject _gkNibWithBaseName:@"GKSuggestionsContainerCell"];
  v8 = +[GKSuggestionsContainerCell reuseIdentifier];
  [v3 registerNib:v7 forCellWithReuseIdentifier:v8];

  v9 = +[NSObject _gkNibWithBaseName:@"GKDashboardPickerPlayerGroupCell"];
  id v10 = +[GKDashboardPickerPlayerGroupCell reuseIdentifier];
  [v3 registerNib:v9 forCellWithReuseIdentifier:v10];

  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:v6 withReuseIdentifier:@"friendsSectionFooterPlayWithFriendsReuseIdentifier"];
  uint64_t v11 = objc_opt_class();
  v12 = +[GKMultiplayerPickerNoFriendsCell reuseIdentifier];
  [v3 registerClass:v11 forCellWithReuseIdentifier:v12];

  v13 = +[NSObject _gkNibWithBaseName:@"GKDashboardPickerPlayerCellAX"];
  [v3 registerNib:v13 forCellWithReuseIdentifier:@"playerCellAX"];

  v14 = +[NSObject _gkNibWithBaseName:@"GKDashboardPickerPlayerGroupCellAX"];
  v15 = +[GKDashboardPickerPlayerGroupCell reuseIdentifierAX];
  [v3 registerNib:v14 forCellWithReuseIdentifier:v15];

  v16 = +[NSObject _gkNib];
  [v3 registerNib:v16 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"friendsSectionHeaderReuseIdentifier"];
}

- (int64_t)defaultFilterScopeFromPickerOrigin:(int64_t)a3
{
  v4 = [MEMORY[0x1E4F636F0] currentGame];
  uint64_t v5 = [v4 bundleIdentifier];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F637E8] shared];
    unint64_t v7 = [v6 recentPlayerPickerSortPreferenceForBundleID:v5];

    if (!*MEMORY[0x1E4F63860]) {
      id v8 = (id)GKOSLoggers();
    }
    v9 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
      [(GKDashboardMultiplayerPickerDataSource *)(uint64_t)v5 defaultFilterScopeFromPickerOrigin:v7];
    }
    if (v7 >= 2) {
      int64_t v10 = a3 == 0;
    }
    else {
      int64_t v10 = v7;
    }
  }
  else
  {
    int64_t v10 = a3 == 0;
  }

  return v10;
}

- (void)setFriendSortFilterScope:(int64_t)a3
{
  if (self->_friendSortFilterScope != a3)
  {
    self->_friendSortFilterScope = a3;
    uint64_t v5 = [MEMORY[0x1E4F636F0] currentGame];
    uint64_t v6 = [v5 bundleIdentifier];

    if (v6)
    {
      unint64_t v7 = [MEMORY[0x1E4F637E8] shared];
      [v7 setRecentPlayerPickerSortPreference:a3 forBundleID:v6];

      if (!*MEMORY[0x1E4F63860]) {
        id v8 = (id)GKOSLoggers();
      }
      v9 = (void *)*MEMORY[0x1E4F63870];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
        [(GKDashboardMultiplayerPickerDataSource *)(uint64_t)v6 setFriendSortFilterScope:a3];
      }
    }
    int64_t v10 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
    uint64_t v11 = (void *)[v10 mutableCopy];

    if (a3) {
      [(GKDashboardMultiplayerPickerDataSource *)self sortPlayersByNickname:v11];
    }
    else {
      [(GKDashboardMultiplayerPickerDataSource *)self sortPlayersByRecentlyPlayed:v11];
    }
    v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v11];
    [(GKDashboardMultiplayerPickerDataSource *)self setFriendPlayers:v12];
  }
}

- (void)sortPlayersByNickname:(id)a3
{
}

uint64_t __64__GKDashboardMultiplayerPickerDataSource_sortPlayersByNickname___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 sortName];
  uint64_t v6 = [v4 sortName];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (void)sortPlayersByRecentlyPlayed:(id)a3
{
}

uint64_t __70__GKDashboardMultiplayerPickerDataSource_sortPlayersByRecentlyPlayed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F636F0] currentGame];
  uint64_t v7 = [v6 bundleIdentifier];
  id v8 = [v4 lastPlayedGame];
  v9 = [v8 bundleIdentifier];
  int v10 = [v7 isEqualToString:v9];

  uint64_t v11 = [MEMORY[0x1E4F636F0] currentGame];
  v12 = [v11 bundleIdentifier];
  v13 = [v5 lastPlayedGame];
  v14 = [v13 bundleIdentifier];
  int v15 = [v12 isEqualToString:v14];

  if (v10 && v15) {
    goto LABEL_3;
  }
  char v20 = v10 | v15;
  if (v10) {
    uint64_t v19 = -1;
  }
  else {
    uint64_t v19 = 1;
  }
  if ((v20 & 1) == 0)
  {
    v22 = [v5 lastPlayedDate];
    if (v22)
    {
    }
    else
    {
      objc_super v23 = [v4 lastPlayedDate];

      if (!v23)
      {
        v16 = [v4 sortName];
        objc_super v17 = [v5 sortName];
        uint64_t v18 = [v16 caseInsensitiveCompare:v17];
        goto LABEL_4;
      }
    }
    uint64_t v24 = [v5 lastPlayedDate];
    if (v24)
    {
      v25 = (void *)v24;
      v26 = [v4 lastPlayedDate];

      if (!v26)
      {
        uint64_t v19 = 1;
        goto LABEL_9;
      }
    }
    uint64_t v27 = [v4 lastPlayedDate];
    if (v27)
    {
      v28 = (void *)v27;
      v29 = [v5 lastPlayedDate];

      if (!v29)
      {
        uint64_t v19 = -1;
        goto LABEL_9;
      }
    }
LABEL_3:
    v16 = [v5 lastPlayedDate];
    objc_super v17 = [v4 lastPlayedDate];
    uint64_t v18 = [v16 compare:v17];
LABEL_4:
    uint64_t v19 = v18;
  }
LABEL_9:

  return v19;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F636D8];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDashboardMultiplayerPickerDataSource.m", 330, "-[GKDashboardMultiplayerPickerDataSource loadDataWithCompletionHandler:]");
  uint64_t v7 = [v5 dispatchGroupWithName:v6];

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__12;
  v49[4] = __Block_byref_object_dispose__12;
  id v50 = [MEMORY[0x1E4F1CA48] array];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__12;
  v47[4] = __Block_byref_object_dispose__12;
  id v48 = (id)MEMORY[0x1E4F1CBF0];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [MEMORY[0x1E4F1CA48] array];
  int v10 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v11 = [MEMORY[0x1E4F637E8] shared];
  if ([v11 multiplayerAllowedPlayerType] == 2)
  {
    BOOL v12 = [(GKDashboardMultiplayerPickerDataSource *)self excludesContacts];

    if (!v12)
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke;
      v45[3] = &unk_1E5F62F28;
      v45[4] = self;
      id v13 = v7;
      id v46 = v13;
      [v13 perform:v45];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3;
      v41[3] = &unk_1E5F66620;
      id v42 = v9;
      v43 = v47;
      v44 = &v51;
      [v13 perform:v41];
    }
  }
  else
  {
  }
  if ([(GKDashboardMultiplayerPickerDataSource *)self nearbyOnly])
  {
    *((unsigned char *)v52 + 24) = 1;
  }
  else
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_135;
    v36[3] = &unk_1E5F66690;
    id v14 = v7;
    id v37 = v14;
    v38 = self;
    v39 = v49;
    v40 = &v51;
    [v14 perform:v36];
    int v15 = [MEMORY[0x1E4F637E8] shared];
    uint64_t v16 = [v15 multiplayerAllowedPlayerType];

    if (v16 == 2)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_160;
      v32[3] = &unk_1E5F66728;
      id v33 = v10;
      id v34 = v8;
      v35 = &v51;
      [v14 perform:v32];
    }
  }
  objc_super v17 = dispatch_get_global_queue(0, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_168;
  v23[3] = &unk_1E5F667C0;
  v23[4] = self;
  v29 = v49;
  id v18 = v8;
  id v24 = v18;
  id v19 = v9;
  id v25 = v19;
  id v20 = v10;
  id v26 = v20;
  v30 = v47;
  id v21 = v4;
  id v28 = v21;
  v31 = &v51;
  id v22 = v7;
  id v27 = v22;
  [v22 notifyOnQueue:v17 block:v23];

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) contactSource];

  if (!v4)
  {
    id v5 = objc_alloc_init(GKContactDataSource);
    [*(id *)(a1 + 32) setContactSource:v5];
  }
  uint64_t v6 = [*(id *)(a1 + 32) contactSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5F64AD8;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v3;
  id v9 = v3;
  [v6 loadContactsWithHandler:v10];
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    [*(id *)(a1 + 32) setError:v6];
  }
  if ([v5 count])
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          id v14 = objc_alloc(MEMORY[0x1E4F63788]);
          int v15 = objc_msgSend(v14, "initWithContact:", v13, (void)v16);
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 40) setContactPlayers:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v19[6] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v5 = *MEMORY[0x1E4F1AE28];
  v19[0] = v4;
  v19[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1ADC8];
  v19[2] = *MEMORY[0x1E4F1AEE0];
  v19[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AE20];
  v19[4] = *MEMORY[0x1E4F1AF98];
  v19[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:6];

  uint64_t v9 = [MEMORY[0x1E4F636C8] daemonProxy];
  uint64_t v10 = [v9 utilityServicePrivate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4;
  v14[3] = &unk_1E5F665F8;
  id v15 = v8;
  id v11 = *(id *)(a1 + 32);
  long long v18 = *(_OWORD *)(a1 + 40);
  id v16 = v11;
  id v17 = v3;
  id v12 = v3;
  id v13 = v8;
  [v10 getGameInviteFriendSuggestionsWithHandler:v14];
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v89 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obuint64_t j = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v107 objects:v118 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v87 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v108 != v87) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        uint64_t v7 = [v6 recipients];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v103 objects:v117 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v104;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v104 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v103 + 1) + 8 * j);
              id v13 = [v12 identifier];

              if (v13)
              {
                uint64_t v14 = [v12 handle];
                id v15 = (void *)v14;
                if (v14) {
                  id v16 = (__CFString *)v14;
                }
                else {
                  id v16 = @"UNKNOWN_HANDLE";
                }
                id v17 = [v12 identifier];
                [v89 setObject:v16 forKey:v17];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v103 objects:v117 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v107 objects:v118 count:16];
    }
    while (v4);
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  long long v19 = (void *)MEMORY[0x1E4F1B8F8];
  id v20 = [v89 allKeys];
  uint64_t v21 = [v19 predicateForContactsWithIdentifiers:v20];

  uint64_t v22 = *(void *)(a1 + 32);
  id v102 = 0;
  v76 = (void *)v21;
  v77 = v18;
  objc_super v23 = [v18 unifiedContactsMatchingPredicate:v21 keysToFetch:v22 error:&v102];
  id v24 = v102;
  id v25 = (NSObject **)MEMORY[0x1E4F63860];
  if (v24)
  {
    id v26 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v27 = (id)GKOSLoggers();
      id v26 = *v25;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_cold_2();
    }
  }
  v75 = v24;
  id v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v79 = v23;
  uint64_t v29 = [v79 countByEnumeratingWithState:&v98 objects:v116 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v99;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v99 != v31) {
          objc_enumerationMutation(v79);
        }
        id v33 = *(void **)(*((void *)&v98 + 1) + 8 * k);
        id v34 = *v25;
        if (!*v25)
        {
          id v35 = (id)GKOSLoggers();
          id v34 = *v25;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_cold_1(v114, v34, v33, &v115);
        }
        v36 = [v33 identifier];
        id v37 = [v89 objectForKeyedSubscript:v36];

        if (([v37 isEqualToString:@"UNKNOWN_HANDLE"] & 1) == 0) {
          [v33 setSuggestedHandle:v37];
        }
        v38 = (void *)[objc_alloc(MEMORY[0x1E4F63788]) initWithContact:v33];
        v39 = [v33 identifier];
        [v28 setObject:v38 forKey:v39];
      }
      uint64_t v30 = [v79 countByEnumeratingWithState:&v98 objects:v116 count:16];
    }
    while (v30);
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v78 = obj;
  uint64_t v82 = [v78 countByEnumeratingWithState:&v94 objects:v113 count:16];
  if (v82)
  {
    uint64_t v80 = *(void *)v95;
    do
    {
      v40 = 0;
      do
      {
        if (*(void *)v95 != v80) {
          objc_enumerationMutation(v78);
        }
        obja = v40;
        v41 = *(void **)(*((void *)&v94 + 1) + 8 * (void)v40);
        v84 = objc_opt_new();
        id v42 = (void *)MEMORY[0x1E4F1CA48];
        v43 = [v41 recipients];
        v44 = objc_msgSend(v42, "arrayWithCapacity:", objc_msgSend(v43, "count"));

        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        v83 = v41;
        v45 = [v41 recipients];
        uint64_t v46 = [v45 countByEnumeratingWithState:&v90 objects:v112 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v91;
          do
          {
            for (uint64_t m = 0; m != v47; ++m)
            {
              if (*(void *)v91 != v48) {
                objc_enumerationMutation(v45);
              }
              id v50 = *(void **)(*((void *)&v90 + 1) + 8 * m);
              uint64_t v51 = [v50 identifier];
              if (v51)
              {
                v52 = (void *)v51;
                uint64_t v53 = [v50 identifier];
                char v54 = [v28 objectForKeyedSubscript:v53];

                if (v54)
                {
                  v55 = [v50 identifier];
                  uint64_t v56 = [v28 objectForKeyedSubscript:v55];
LABEL_56:
                  v58 = (void *)v56;
                  goto LABEL_61;
                }
              }
              v55 = [v50 handle];
              if (![(__CFString *)v55 length])
              {
                uint64_t v57 = [v50 displayName];

                v55 = (__CFString *)v57;
              }
              if (![(__CFString *)v55 length])
              {

                v55 = @"UNKNOWN_HANDLE";
              }
              uint64_t v56 = [v28 objectForKeyedSubscript:v55];
              if (v56) {
                goto LABEL_56;
              }
              v88 = (void *)MEMORY[0x1E4F1B8F8];
              uint64_t v59 = [v50 displayName];
              v60 = (void *)v59;
              if (v59) {
                uint64_t v61 = v59;
              }
              else {
                uint64_t v61 = (uint64_t)v55;
              }
              v111 = v55;
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
              uint64_t v62 = v47;
              uint64_t v63 = v48;
              v64 = v44;
              v65 = v28;
              v67 = v66 = v45;
              v68 = [v88 contactWithDisplayName:v61 handleStrings:v67];

              v45 = v66;
              id v28 = v65;
              v44 = v64;
              uint64_t v48 = v63;
              uint64_t v47 = v62;

              v58 = (void *)[objc_alloc(MEMORY[0x1E4F63788]) initWithContact:v68];
              [v28 setObject:v58 forKey:v55];

LABEL_61:
              [v44 addObject:v58];
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v90 objects:v112 count:16];
          }
          while (v47);
        }

        [v84 setPlayers:v44];
        [v84 setSource:1];
        v69 = [v83 groupName];
        [v84 setGroupName:v69];

        v70 = [v83 conversationIdentifier];
        [v84 setConversationIdentifier:v70];

        v71 = [v83 messagesGroupIdentifier];
        [v84 setMessagesGroupIdentifier:v71];

        [*(id *)(a1 + 40) addObject:v84];
        v40 = obja + 1;
      }
      while (obja + 1 != (char *)v82);
      uint64_t v82 = [v78 countByEnumeratingWithState:&v94 objects:v113 count:16];
    }
    while (v82);
  }

  uint64_t v72 = [v28 allValues];
  uint64_t v73 = *(void *)(*(void *)(a1 + 56) + 8);
  v74 = *(void **)(v73 + 40);
  *(void *)(v73 + 40) = v72;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_135(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F63760] local];
  uint64_t v5 = [MEMORY[0x1E4F636C8] proxyForPlayer:v4];
  uint64_t v6 = [v5 friendServicePrivate];
  uint64_t v7 = [v4 internal];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_137;
  v11[3] = &unk_1E5F66668;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v8;
  uint64_t v13 = v9;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v14 = v3;
  id v10 = v3;
  [v6 getFriendsForPlayer:v7 fetchOptions:1 handler:v11];
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_137(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 _gkMapWithBlock:&__block_literal_global_141];
  uint64_t v7 = (NSObject **)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F63870];
  id v10 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v6;
    _os_log_impl(&dword_1AF250000, v10, OS_LOG_TYPE_INFO, "Loaded player list: %@", buf, 0xCu);
  }
  id v11 = *v7;
  if (v5)
  {
    if (!v11) {
      id v12 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_137_cold_3();
    }
    [*(id *)(a1 + 32) setError:v5];
  }
  else
  {
    if (!v11)
    {
      id v13 = (id)GKOSLoggers();
      id v11 = *v7;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_137_cold_2();
    }
    id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"friendBiDirectional == %@", &unk_1F0812258];
    long long v15 = [v6 filteredArrayUsingPredicate:v14];
    id v16 = (void *)[v15 mutableCopy];

    id v17 = *v7;
    if (!*v7)
    {
      id v18 = (id)GKOSLoggers();
      id v17 = *v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_137_cold_1();
    }
    uint64_t v19 = [*(id *)(a1 + 40) friendSortFilterScope];
    id v20 = *(void **)(a1 + 40);
    if (v19) {
      [v20 sortPlayersByNickname:v16];
    }
    else {
      [v20 sortPlayersByRecentlyPlayed:v16];
    }
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithArray:v16];
    [*(id *)(a1 + 40) setFriendPlayers:v21];

    uint64_t v22 = [MEMORY[0x1E4F637E8] shared];
    uint64_t v23 = [v22 multiplayerAllowedPlayerType];

    if (v23 == 2)
    {
      v44 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"friendPlayedWith == %@", &unk_1F0812258];
      uint64_t v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"friendPlayedNearby == %@", &unk_1F0812258];
      uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"acceptedGameInviteFromThisFriend == %@ || initiatedGameInviteToThisFriend == %@", &unk_1F0812258, &unk_1F0812258];
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"automatchedTogether == %@", &unk_1F0812258];
      uint64_t v46 = (void *)v24;
      id v26 = v47 = v16;
      id v27 = (void *)MEMORY[0x1E4F28BA0];
      v50[0] = v24;
      v50[1] = v25;
      v45 = (void *)v25;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
      v43 = [v27 orPredicateWithSubpredicates:v28];

      uint64_t v29 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v30 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v24];
      v49[0] = v30;
      uint64_t v31 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v25];
      v49[1] = v31;
      v32 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v26];
      v49[2] = v32;
      id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
      id v34 = [v29 andPredicateWithSubpredicates:v33];

      id v35 = (void *)MEMORY[0x1E4F28BA0];
      v48[0] = v44;
      v48[1] = v43;
      v36 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v34];
      v48[2] = v36;
      id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
      v38 = [v35 andPredicateWithSubpredicates:v37];

      v39 = [v6 filteredArrayUsingPredicate:v38];
      uint64_t v40 = [v39 mutableCopy];
      uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
      id v42 = *(void **)(v41 + 40);
      *(void *)(v41 + 40) = v40;

      [*(id *)(a1 + 40) sortPlayersByRecentlyPlayed:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      id v16 = v47;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3_138(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F63788];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithInternalRepresentation:v3];

  return v4;
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_160(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F636C8] daemonProxy];
  id v5 = [v4 multiplayerService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_161;
  v9[3] = &unk_1E5F66700;
  id v10 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v12 = v3;
  uint64_t v13 = v7;
  id v11 = v6;
  id v8 = v3;
  [v5 getMultiPlayerGroups:v9];
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_161(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (NSObject **)MEMORY[0x1E4F63860];
    id v8 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v9 = (id)GKOSLoggers();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_161_cold_1();
    }
  }
  id v28 = v6;
  [v5 sortUsingComparator:&__block_literal_global_165];
  id v10 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v17 = [v16 participants];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v35;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v17);
              }
              [v10 addObject:*(void *)(*((void *)&v34 + 1) + 8 * v21++)];
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v19);
        }

        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v13);
  }

  uint64_t v22 = [MEMORY[0x1E4F636C8] daemonProxy];
  uint64_t v23 = [v22 profileServicePrivate];
  uint64_t v24 = [v10 allObjects];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_166;
  v29[3] = &unk_1E5F666D8;
  id v30 = *(id *)(a1 + 32);
  id v31 = v11;
  id v32 = *(id *)(a1 + 40);
  long long v27 = *(_OWORD *)(a1 + 48);
  id v25 = (id)v27;
  long long v33 = v27;
  id v26 = v11;
  [v23 getProfilesForPlayerIDs:v24 fetchOptions:1 handler:v29];
}

uint64_t __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 playedAt];
  if (v6 <= [v5 playedAt])
  {
    uint64_t v8 = [v4 playedAt];
    uint64_t v7 = v8 != [v5 playedAt];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_166(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (NSObject **)MEMORY[0x1E4F63860];
    uint64_t v8 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v9 = (id)GKOSLoggers();
      uint64_t v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_166_cold_1();
    }
  }
  long long v36 = v6;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F63788]) initWithInternalRepresentation:*(void *)(*((void *)&v48 + 1) + 8 * i)];
        id v17 = [v16 internal];
        uint64_t v18 = [v17 playerID];
        [v10 setObject:v16 forKeyedSubscript:v18];

        [*(id *)(a1 + 32) addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v13);
  }
  long long v35 = v11;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        uint64_t v21 = [v20 participants];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          uint64_t v23 = a1;
          uint64_t v24 = objc_opt_new();
          id v25 = (void *)MEMORY[0x1E4F1CA48];
          id v26 = [v20 participants];
          long long v27 = objc_msgSend(v25, "arrayWithCapacity:", objc_msgSend(v26, "count"));

          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v28 = [v20 participants];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v41;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v41 != v31) {
                  objc_enumerationMutation(v28);
                }
                long long v33 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v40 + 1) + 8 * k)];
                long long v34 = v33;
                if (v33 && ([v33 isLocalPlayer] & 1) == 0) {
                  [v27 addObject:v34];
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
            }
            while (v30);
          }

          [v24 setPlayers:v27];
          a1 = v23;
          [*(id *)(v23 + 48) addObject:v24];
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v39);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_168(uint64_t a1)
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA80] set];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_169;
  aBlock[3] = &unk_1E5F66770;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v65 = v3;
  id v89 = v3;
  uint64_t v90 = v4;
  v69 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = [*(id *)(a1 + 32) friendPlayers];
  uint64_t v7 = [v5 setWithArray:v6];

  v67 = v7;
  [v7 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v66 = a1;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v85;
    uint64_t v12 = (char *)(v69 + 2);
    do
    {
      uint64_t v13 = 0;
      uint64_t v68 = v10;
      do
      {
        if (*(void *)v85 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v84 + 1) + 8 * v13);
        uint64_t v15 = [v14 players];
        if ((unint64_t)[v15 count] >= 2)
        {

LABEL_11:
          v69[2](v69, v14);
          goto LABEL_13;
        }
        id v16 = [v14 players];
        if ([v16 count] == 1)
        {
          [v14 players];
          v18 = id v17 = v8;
          [v18 objectAtIndexedSubscript:0];
          v20 = uint64_t v19 = v12;
          int v21 = [v67 containsObject:v20];

          uint64_t v12 = v19;
          id v8 = v17;
          uint64_t v10 = v68;

          if (v21) {
            goto LABEL_11;
          }
        }
        else
        {
        }
LABEL_13:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v84 objects:v94 count:16];
    }
    while (v10);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v22 = *(id *)(*(void *)(*(void *)(v66 + 80) + 8) + 40);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v81 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        id v28 = objc_opt_new();
        uint64_t v92 = v27;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
        [v28 setPlayers:v29];

        v69[2](v69, v28);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v24);
  }

  uint64_t v30 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v32 = *(id *)(v66 + 48);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v91 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v77 != v35) {
          objc_enumerationMutation(v32);
        }
        long long v37 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        uint64_t v38 = [v37 players];
        uint64_t v39 = [v38 _gkPlayersIDsFromPlayers];

        long long v40 = [v39 sortedArrayUsingComparator:&__block_literal_global_177];
        if (([v30 containsObject:v40] & 1) == 0)
        {
          [v30 addObject:v40];
          [v31 addObject:v37];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v76 objects:v91 count:16];
    }
    while (v34);
  }

  if ([v31 count])
  {
    long long v41 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = [*(id *)(v66 + 32) suggestedPlayerGroups];
    unint64_t v43 = [v42 count];

    long long v44 = [*(id *)(v66 + 32) suggestedPlayerGroups];
    long long v45 = v44;
    if (v43 > 4)
    {
      long long v47 = objc_msgSend(v44, "subarrayWithRange:", 0, 4);
      [v41 addObjectsFromArray:v47];

      long long v46 = [*(id *)(v66 + 32) suggestedPlayerGroups];
      objc_msgSend(v46, "removeObjectsInRange:", 0, 4);
    }
    else
    {
      [v41 addObjectsFromArray:v44];

      long long v46 = [*(id *)(v66 + 32) suggestedPlayerGroups];
      [v46 removeAllObjects];
    }

    [v41 addObjectsFromArray:v31];
    long long v48 = [*(id *)(v66 + 32) suggestedPlayerGroups];
    uint64_t v49 = [v48 count];

    if (v49)
    {
      long long v50 = [*(id *)(v66 + 32) suggestedPlayerGroups];
      [v41 addObjectsFromArray:v50];
    }
    [*(id *)(v66 + 32) setSuggestedPlayerGroups:v41];
  }
  long long v51 = [*(id *)(v66 + 32) suggestedPlayerGroups];
  unint64_t v52 = [v51 count];

  if (v52 >= 0x11)
  {
    uint64_t v53 = [*(id *)(v66 + 32) suggestedPlayerGroups];
    char v54 = objc_msgSend(v53, "subarrayWithRange:", 0, 16);
    uint64_t v55 = (void *)[v54 mutableCopy];
    [*(id *)(v66 + 32) setSuggestedPlayerGroups:v55];
  }
  [*(id *)(v66 + 56) addObjectsFromArray:*(void *)(*(void *)(*(void *)(v66 + 80) + 8) + 40)];
  [*(id *)(v66 + 56) addObjectsFromArray:*(void *)(*(void *)(*(void *)(v66 + 88) + 8) + 40)];
  uint64_t v56 = [*(id *)(v66 + 56) allObjects];
  [*(id *)(v66 + 32) setSuggestedPlayers:v56];

  uint64_t v57 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(v66 + 32), "itemCount"));
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v74[3] = &unk_1E5F66798;
  v74[4] = *(void *)(v66 + 32);
  id v75 = v57;
  id v58 = v57;
  uint64_t v59 = (void (**)(void *, void *))_Block_copy(v74);
  v60 = [*(id *)(v66 + 32) nearbyPlayers];
  v59[2](v59, v60);

  uint64_t v61 = [*(id *)(v66 + 32) friendPlayers];
  v59[2](v59, v61);

  uint64_t v62 = [*(id *)(v66 + 32) suggestedPlayers];
  v59[2](v59, v62);

  [*(id *)(v66 + 32) setPlayerStates:v58];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_183;
  block[3] = &unk_1E5F64160;
  block[4] = *(void *)(v66 + 32);
  id v63 = *(id *)(v66 + 72);
  uint64_t v64 = *(void *)(v66 + 96);
  id v72 = v63;
  uint64_t v73 = v64;
  id v71 = *(id *)(v66 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_169(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 players];
  uint64_t v4 = [v3 _gkPlayersIDsFromPlayers];

  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_173];
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v6 = [*(id *)(a1 + 40) suggestedPlayerGroups];
    [v6 addObject:v7];
  }
}

uint64_t __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3_170(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_175(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 32) playerStates];
        uint64_t v10 = [v8 referenceKey];
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];

        uint64_t v12 = [*(id *)(a1 + 32) previouslyInvitedPlayers];
        LODWORD(v10) = [v12 containsObject:v8];

        if (v10)
        {

          uint64_t v11 = &unk_1F0812270;
        }
        else if (!v11)
        {
          uint64_t v11 = &unk_1F0812288;
        }
        uint64_t v13 = *(void **)(a1 + 40);
        uint64_t v14 = [v8 referenceKey];
        [v13 setObject:v11 forKeyedSubscript:v14];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_183(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidLoad:1];
  objc_msgSend(*(id *)(a1 + 32), "setBrowsingForNearbyPlayers:", objc_msgSend(*(id *)(a1 + 32), "supportsNearby"));
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v4 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
  }
}

- (int64_t)itemCount
{
  if ([(GKCollectionDataSource *)self isSearching])
  {
    uint64_t v3 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
    int64_t v4 = [v3 count];

    return v4;
  }
  else
  {
    return [(GKDashboardMultiplayerPickerDataSource *)self unmodifiedItemCount];
  }
}

- (int64_t)unmodifiedItemCount
{
  if ([(GKDashboardMultiplayerPickerDataSource *)self supportsNearby])
  {
    uint64_t v3 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
    if ([v3 count])
    {
      int64_t v4 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
      int64_t v5 = [v4 count];
    }
    else
    {
      int64_t v5 = 1;
    }
  }
  else
  {
    int64_t v5 = 0;
  }
  if (![(GKDashboardMultiplayerPickerDataSource *)self nearbyOnly])
  {
    uint64_t v6 = [(GKDashboardMultiplayerPickerDataSource *)self suggestedPlayers];
    uint64_t v7 = [v6 count];
    id v8 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
    v5 += v7 + [v8 count];
  }
  return v5;
}

- (double)preferredCollectionHeight
{
  +[GKDashboardPlayerCell preferredCollectionHeight];
  return result;
}

- (id)playersForSection:(int64_t)a3 ignoreSearch:(BOOL)a4
{
  if (!a4 && [(GKCollectionDataSource *)self isSearching])
  {
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v6 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  uint64_t v6 = [(GKDashboardMultiplayerPickerDataSource *)self suggestedPlayers];
LABEL_8:

  return v6;
}

- (id)playerForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[GKDashboardMultiplayerPickerDataSource playersForSection:ignoreSearch:](self, "playersForSection:ignoreSearch:", [v4 section], 0);
  unint64_t v6 = [v4 item];

  if ([v5 count] <= v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
  }

  return v7;
}

- (BOOL)isPlayerAtIndexPathCoreRecent:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    char v5 = 0;
  }
  else
  {
    unint64_t v6 = [(GKDashboardMultiplayerPickerDataSource *)self playerForIndexPath:v4];
    char v5 = [v6 isInContacts];
  }
  return v5;
}

- (id)playerForPlayerID:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  char v5 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v37 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
      uint64_t v11 = [v10 internal];
      uint64_t v12 = [v11 playerID];
      char v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    char v5 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
    uint64_t v14 = [v5 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
        long long v18 = [v10 internal];
        uint64_t v19 = [v18 playerID];
        char v20 = [v19 isEqualToString:v4];

        if (v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v5 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      char v5 = [(GKDashboardMultiplayerPickerDataSource *)self suggestedPlayers];
      id v21 = (id)[v5 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (!v21) {
        goto LABEL_27;
      }
      uint64_t v22 = *(void *)v29;
LABEL_19:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * v23);
        uint64_t v24 = [v10 internal];
        uint64_t v25 = [v24 playerID];
        char v26 = [v25 isEqualToString:v4];

        if (v26) {
          break;
        }
        if (v21 == (id)++v23)
        {
          id v21 = (id)[v5 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v21) {
            goto LABEL_19;
          }
          goto LABEL_27;
        }
      }
    }
  }
  id v21 = v10;
LABEL_27:

  return v21;
}

- (NSArray)selectedPlayers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __57__GKDashboardMultiplayerPickerDataSource_selectedPlayers__block_invoke;
  uint64_t v15 = &unk_1E5F66798;
  uint64_t v16 = self;
  id v17 = v3;
  id v4 = v3;
  char v5 = (void (**)(void *, void *))_Block_copy(&v12);
  uint64_t v6 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
  v5[2](v5, v6);

  uint64_t v7 = [(GKDashboardMultiplayerPickerDataSource *)self suggestedPlayers];
  v5[2](v5, v7);

  uint64_t v8 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
  v5[2](v5, v8);

  if (![(GKDashboardMultiplayerPickerDataSource *)self excludesContacts])
  {
    uint64_t v9 = [(GKDashboardMultiplayerPickerDataSource *)self contactPlayers];
    v5[2](v5, v9);
  }
  uint64_t v10 = [v4 allObjects];

  return (NSArray *)v10;
}

void __57__GKDashboardMultiplayerPickerDataSource_selectedPlayers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 32) playerStates];
        uint64_t v10 = [v8 referenceKey];
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 integerValue];

        if (v12 == 1) {
          [*(id *)(a1 + 40) addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)clearSelection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(NSMutableDictionary *)self->_playerStates allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = [(NSMutableDictionary *)self->_playerStates objectForKey:v8];
        uint64_t v10 = [v9 integerValue];

        if (v10 == 1) {
          [(NSMutableDictionary *)self->_playerStates setObject:&unk_1F0812288 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)pickerWillSendInvites
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(GKDashboardMultiplayerPickerDataSource *)self suggestedPlayerGroups];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  uint64_t v5 = (void *)MEMORY[0x1E4F63530];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 source] != 1 && objc_msgSend(v9, "source") != 2)
        {
          uint64_t v10 = [v9 players];
          unint64_t v11 = [v10 count];

          if (v11 >= 2
            && [(GKDashboardMultiplayerPickerDataSource *)self shouldSelectPlayerGroup:v9])
          {

            id v3 = [MEMORY[0x1E4F637F8] reporter];
            [v3 reportEvent:*v5 type:*MEMORY[0x1E4F63350]];
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  long long v12 = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    long long v14 = [MEMORY[0x1E4F637F8] reporter];
    [v14 reportEvent:*v5 type:*MEMORY[0x1E4F63358]];
  }
}

- (unint64_t)cornerMaskForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[GKDashboardMultiplayerPickerDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", [v4 section]);
  uint64_t v6 = [v4 section];
  if (v6)
  {
    if (v6 == 1)
    {
      if ([v4 item] == v5 - 1
        && ![(GKDashboardMultiplayerPickerDataSource *)self isShowingAddFriendsFooter])
      {
        if ([(GKDashboardMultiplayerPickerDataSource *)self _canShowMoreFriends]) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = 12;
        }
      }
      else
      {
        uint64_t v7 = 0;
      }
      if ([(GKDashboardMultiplayerPickerDataSource *)self hasFriends]) {
        unint64_t v8 = v7;
      }
      else {
        unint64_t v8 = 15;
      }
      goto LABEL_20;
    }
LABEL_13:
    unint64_t v8 = 0;
    goto LABEL_20;
  }
  if (![(GKCollectionDataSource *)self isSearching]) {
    goto LABEL_13;
  }
  if ([v4 item]) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = 3;
  }
  if ([v4 item] == v5 - 1) {
    v8 |= 0xCuLL;
  }
LABEL_20:

  return v8;
}

- (id)fullContactWithIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(GKDashboardMultiplayerPickerDataSource *)self contactSource];
  uint64_t v6 = [v5 fullContactWithIdentifier:v4];

  return v6;
}

- (id)firstIndexPathForPlayer:(id)a3
{
  id v3 = [(GKDashboardMultiplayerPickerDataSource *)self indexPathsForPlayer:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)indexPathsForPlayer:(id)a3
{
  id v4 = a3;
  int64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v7 = [(GKDashboardMultiplayerPickerDataSource *)self playersForSection:i ignoreSearch:0];
    uint64_t v8 = [v7 indexOfObject:v4];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:i];
      [v5 addObject:v9];
    }
  }
  uint64_t v10 = (void *)[v5 copy];

  return v10;
}

- (id)indexPathForPlayer:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(GKDashboardMultiplayerPickerDataSource *)self playersForSection:a4 ignoreSearch:0];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:a4];
  }

  return v9;
}

- (id)indexPathForFirstPlayer
{
  uint64_t v3 = 0;
  while (1)
  {
    id v4 = [(GKDashboardMultiplayerPickerDataSource *)self playersForSection:v3 ignoreSearch:0];
    uint64_t v5 = [v4 firstObject];
    if (v5) {
      break;
    }

    if (++v3 == 3)
    {
      id v6 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v7 = (void *)v5;
  id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v3];

LABEL_6:

  return v6;
}

- (id)searchKeyForSection:(int64_t)a3
{
  if (a3 == 1) {
    return @"groupName";
  }
  else {
    return @"searchName";
  }
}

- (id)alternateSearchKeyForSection:(int64_t)a3
{
  if (a3 == 1) {
    return @"groupName";
  }
  else {
    return @"internal.messagesID";
  }
}

- (void)searchTextHasChanged
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if ([(GKCollectionDataSource *)self isSearching])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v4 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
    uint64_t v5 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
    id v6 = objc_msgSend(v3, "initWithObjects:", v4, v5, 0);

    if (![(GKDashboardMultiplayerPickerDataSource *)self excludesContacts])
    {
      uint64_t v7 = [(GKDashboardMultiplayerPickerDataSource *)self contactPlayers];
      [v6 addObject:v7];
    }
    long long v38 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v39 = [MEMORY[0x1E4F1CA80] set];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = v6;
    id v34 = (id)[obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v53;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v8;
          uint64_t v9 = *(void **)(*((void *)&v52 + 1) + 8 * v8);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v59 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v49 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                if (([v15 isLocalPlayer] & 1) == 0
                  && [(GKCollectionDataSource *)self searchMatchesItem:v15 inSection:0])
                {
                  long long v16 = objc_opt_new();
                  id v58 = v15;
                  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
                  [v16 setPlayers:v17];

                  long long v18 = [v15 displayNameWithOptions:0];
                  [v16 setGroupName:v18];

                  [v38 addObject:v16];
                  [v39 addObject:v15];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v59 count:16];
            }
            while (v12);
          }

          uint64_t v8 = v36 + 1;
        }
        while ((id)(v36 + 1) != v34);
        id v34 = (id)[obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v34);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v35 = [(GKDashboardMultiplayerPickerDataSource *)self suggestedPlayerGroups];
    uint64_t v19 = [v35 countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v35);
          }
          uint64_t v22 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v23 = [v22 players];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v56 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v41;
            while (2)
            {
              for (uint64_t k = 0; k != v25; ++k)
              {
                if (*(void *)v41 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * k);
                if ([(GKCollectionDataSource *)self searchMatchesItem:v28 inSection:0])
                {
                  long long v29 = [v22 players];
                  if ((unint64_t)[v29 count] > 1)
                  {

LABEL_39:
                    [v38 addObject:v22];

                    goto LABEL_40;
                  }
                  char v30 = [v39 containsObject:v28];

                  if ((v30 & 1) == 0) {
                    goto LABEL_39;
                  }
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v56 count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }

          if ([(GKCollectionDataSource *)self searchMatchesItem:v22 inSection:1]) {
            [v38 addObject:v22];
          }
LABEL_40:
          ;
        }
        uint64_t v20 = [v35 countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v20);
    }

    long long v31 = [v38 array];
    [(GKDashboardMultiplayerPickerDataSource *)self setSearchPlayersAndGroups:v31];
  }
  else
  {
    [(GKDashboardMultiplayerPickerDataSource *)self setSearchPlayersAndGroups:0];
  }
}

- (void)setSupportsNearby:(BOOL)a3
{
  if (self->_supportsNearby != a3)
  {
    BOOL v3 = a3;
    self->_supportsNearby = a3;
    if ([(GKDashboardMultiplayerPickerDataSource *)self didLoad])
    {
      [(GKDashboardMultiplayerPickerDataSource *)self setBrowsingForNearbyPlayers:v3];
    }
  }
}

- (void)setBrowsingForNearbyPlayers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyDelegate];

  if (v5)
  {
    if (self->_browsingForNearbyPlayers != v3)
    {
      self->_browsingForNearbyPlayers = v3;
      if (v3)
      {
        objc_initWeak(&location, self);
        id v6 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyDelegate];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __70__GKDashboardMultiplayerPickerDataSource_setBrowsingForNearbyPlayers___block_invoke;
        v10[3] = &unk_1E5F667E8;
        objc_copyWeak(&v11, &location);
        [v6 startBrowsingForNearbyPlayersWithReachableHandler:v10];

        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
      }
      else
      {
        id v9 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyDelegate];
        [v9 stopBrowsingForNearbyPlayers];
      }
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    uint64_t v8 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      -[GKDashboardMultiplayerPickerDataSource setBrowsingForNearbyPlayers:](v8);
    }
  }
}

void __70__GKDashboardMultiplayerPickerDataSource_setBrowsingForNearbyPlayers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v6 = objc_loadWeakRetained(&to);
  [v6 setNearbyPlayerID:v5 reachable:a3];

  objc_destroyWeak(&to);
}

- (void)setNearbyPlayerID:(id)a3 reachable:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(GKDashboardMultiplayerPickerDataSource *)self playerForPlayerID:v6];
  if (v7)
  {
    [(GKDashboardMultiplayerPickerDataSource *)self setNearbyPlayer:v7 reachable:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v8 = (void *)MEMORY[0x1E4F63788];
    v15[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__GKDashboardMultiplayerPickerDataSource_setNearbyPlayerID_reachable___block_invoke;
    v10[3] = &unk_1E5F66810;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    BOOL v13 = v4;
    [v8 loadPlayersForIdentifiersPrivate:v9 withCompletionHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __70__GKDashboardMultiplayerPickerDataSource_setNearbyPlayerID_reachable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v7 = [v5 firstObject];
  if (v6)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR))
    {
      __70__GKDashboardMultiplayerPickerDataSource_setNearbyPlayerID_reachable___block_invoke_cold_1(a1, (uint64_t)v6, v9);
      if (!v7) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  if (v7)
  {
LABEL_6:
    id v10 = objc_loadWeakRetained(&to);
    [v10 setNearbyPlayer:v7 reachable:*(unsigned __int8 *)(a1 + 48)];
  }
LABEL_7:

  objc_destroyWeak(&to);
}

- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F636D8] dispatchGroupWithName:@"pickerDataSourceSetNearbyPlayer"];
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__12;
    v13[4] = __Block_byref_object_dispose__12;
    id v14 = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__GKDashboardMultiplayerPickerDataSource_setNearbyPlayer_reachable___block_invoke;
    v8[3] = &unk_1E5F66838;
    id v11 = v13;
    BOOL v12 = a4;
    id v9 = v14;
    id v10 = self;
    [v7 notifyOnMainQueueWithBlock:v8];

    _Block_object_dispose(v13, 8);
  }
}

void __68__GKDashboardMultiplayerPickerDataSource_setNearbyPlayer_reachable___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    return;
  }
  if (!*MEMORY[0x1E4F63860]) {
    id v2 = (id)GKOSLoggers();
  }
  BOOL v3 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v4;
    __int16 v29 = 1024;
    int v30 = v5;
    _os_log_impl(&dword_1AF250000, v3, OS_LOG_TYPE_INFO, "setNearbyPlayer: %@ reachable: %d", buf, 0x12u);
  }
  id v6 = [*(id *)(a1 + 40) nearbyPlayers];
  uint64_t v7 = [v6 count];

  int v8 = *(unsigned __int8 *)(a1 + 56);
  id v9 = [*(id *)(a1 + 40) nearbyPlayers];
  int v10 = [v9 containsObject:*(void *)(a1 + 32)];

  if (!v8)
  {
    if (v10)
    {
      long long v15 = [*(id *)(a1 + 40) nearbyPlayers];
      [v15 removeObject:*(void *)(a1 + 32)];

      [*(id *)(a1 + 40) updateStateForUnreachableNearbyPlayer:*(void *)(a1 + 32)];
    }
    goto LABEL_16;
  }
  if ((v10 & 1) == 0)
  {
    id v11 = [*(id *)(a1 + 40) nearbyPlayers];
    [v11 insertObject:*(void *)(a1 + 32) atIndex:0];

    BOOL v12 = [*(id *)(a1 + 40) friendPlayers];
    if ([v12 containsObject:*(void *)(a1 + 32)])
    {
LABEL_13:

      goto LABEL_16;
    }
    BOOL v13 = [*(id *)(a1 + 40) suggestedPlayers];
    if ([v13 containsObject:*(void *)(a1 + 32)])
    {
LABEL_12:

      goto LABEL_13;
    }
    id v14 = [*(id *)(a1 + 32) referenceKey];

    if (v14)
    {
      BOOL v12 = [*(id *)(a1 + 40) playerStates];
      BOOL v13 = [*(id *)(a1 + 32) referenceKey];
      [v12 setObject:&unk_1F0812288 forKeyedSubscript:v13];
      goto LABEL_12;
    }
  }
LABEL_16:
  if (([*(id *)(a1 + 40) isSearching] & 1) == 0)
  {
    [*(id *)(a1 + 40) nearbyPlayersChangedHandler];
  }
  if (([*(id *)(a1 + 40) isSearching] & 1) == 0)
  {
    long long v16 = [*(id *)(a1 + 40) nearbyPlayers];
    uint64_t v17 = [v16 count];

    if (v17 * v7
      || v17 + v7 < 1
      || ([*(id *)(a1 + 40) suggestedPlayerGroups],
          long long v18 = objc_claimAutoreleasedReturnValue(),
          uint64_t v19 = [v18 count],
          v18,
          v19))
    {
      id v20 = [*(id *)(a1 + 40) suggestionContainerCell];
      if (!v20)
      {
        id v21 = [*(id *)(a1 + 40) collectionView];
        uint64_t v22 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
        uint64_t v23 = [v21 cellForItemAtIndexPath:v22];

        if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
          id v20 = v23;
        }
        else {
          id v20 = 0;
        }
      }
      uint64_t v24 = [*(id *)(a1 + 40) nearbyPlayers];
      [v20 updateNearbyPlayers:v24];
    }
    else
    {
      id v20 = [*(id *)(a1 + 40) collectionView];
      uint64_t v24 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      uint64_t v26 = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [v20 reloadItemsAtIndexPaths:v25];
    }
  }
}

- (void)updateStateForUnreachableNearbyPlayer:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
  if ([v5 containsObject:v4]) {
    goto LABEL_4;
  }
  id v6 = [(GKDashboardMultiplayerPickerDataSource *)self suggestedPlayers];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    int v8 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
    id v9 = [v4 referenceKey];
    [v8 removeObjectForKey:v9];

    int v5 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
    v11[0] = v4;
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v5 pickerDatasource:self didDeselectPlayers:v10 inGroup:0];

LABEL_4:
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if ([(GKCollectionDataSource *)self isSearching]) {
    return 1;
  }
  else {
    return 3;
  }
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if ([(GKCollectionDataSource *)self isSearching])
  {
    int v5 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
    int64_t v6 = [v5 count];

    return v6;
  }
  char v7 = [(GKDashboardMultiplayerPickerDataSource *)self playersForSection:a3 ignoreSearch:1];
  int64_t v6 = [v7 count];

  if (!a3) {
    return [(GKDashboardMultiplayerPickerDataSource *)self pickerOrigin] == 1;
  }
  if (a3 != 1)
  {
    if (a3 != 2) {
      return v6;
    }
    return [(GKDashboardMultiplayerPickerDataSource *)self pickerOrigin] == 1;
  }
  if ([(GKDashboardMultiplayerPickerDataSource *)self nearbyOnly]) {
    return 0;
  }
  if (![(GKDashboardMultiplayerPickerDataSource *)self hasFriends]) {
    return 1;
  }
  if ([(GKDashboardMultiplayerPickerDataSource *)self showsAllFriends]
    || v6 == [(GKDashboardMultiplayerPickerDataSource *)self numberOfFriendsToShowInitially]+ 1)
  {
    return v6;
  }
  LODWORD(result) = [(GKDashboardMultiplayerPickerDataSource *)self numberOfFriendsToShowInitially];
  if (v6 >= (int)result) {
    return (int)result;
  }
  else {
    return v6;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(GKDashboardMultiplayerPickerDataSource *)self numberOfItemsInSection:a4];
}

- (BOOL)hasFriends
{
  id v2 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)playerCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  int64_t v6 = (void *)MEMORY[0x1E4FB1E20];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 currentTraitCollection];
  int v10 = [v9 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v10)) {
    id v11 = @"playerCellAX";
  }
  else {
    id v11 = @"playerCell";
  }
  BOOL v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

  BOOL v13 = [(GKDashboardMultiplayerPickerDataSource *)self playerForIndexPath:v8];
  playerStates = self->_playerStates;
  long long v15 = [v13 referenceKey];
  long long v16 = [(NSMutableDictionary *)playerStates objectForKey:v15];
  uint64_t v17 = [v16 integerValue];

  [v12 setSelectable:v17 != 2];
  int64_t v18 = -[GKDashboardMultiplayerPickerDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", [v8 section]);
  uint64_t v19 = [v8 section];
  uint64_t v20 = [v8 item];

  uint64_t v21 = v18 - 1;
  if (v19 == 1) {
    BOOL v22 = v20 != v21
  }
       || [(GKDashboardMultiplayerPickerDataSource *)self isShowingAddFriendsFooter]
       || [(GKDashboardMultiplayerPickerDataSource *)self _canShowMoreFriends];
  else {
    BOOL v22 = v20 < v21;
  }
  [v12 setLineVisible:v22];

  return v12;
}

- (id)playerGroupCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4FB1E20];
  id v8 = a4;
  id v9 = [v7 currentTraitCollection];
  int v10 = [v9 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v10)) {
    +[GKDashboardPickerPlayerGroupCell reuseIdentifierAX];
  }
  else {
  id v75 = +[GKDashboardPickerPlayerGroupCell reuseIdentifier];
  }
  id v11 = [v8 dequeueReusableCellWithReuseIdentifier:v75 forIndexPath:v6];

  [v11 setGroupCellDelegate:self];
  BOOL v12 = [(GKCollectionDataSource *)self searchText];
  [v11 setSearchText:v12];

  BOOL v13 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
  id v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  long long v15 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
  uint64_t v73 = [v15 count];

  long long v16 = [v14 groupName];
  v74 = v11;
  if (![(__CFString *)v16 length])
  {
    uint64_t v17 = [v14 players];
    if ((unint64_t)[v17 count] < 4)
    {
      if ((unint64_t)[v17 count] < 3)
      {
        if ((unint64_t)[v17 count] < 2)
        {
          if (![v17 count])
          {
LABEL_14:

            goto LABEL_15;
          }
          uint64_t v24 = [v17 objectAtIndexedSubscript:0];
          uint64_t v23 = [v24 displayNameWithOptions:0];
        }
        else
        {
          v69 = NSString;
          uint64_t v24 = GKGameCenterUIFrameworkBundle();
          uint64_t v63 = GKGetLocalizedStringFromTableInBundle();
          uint64_t v66 = [v17 objectAtIndexedSubscript:0];
          [v66 displayNameWithOptions:0];
          int v30 = v72 = v10;
          uint64_t v31 = [v17 objectAtIndexedSubscript:1];
          long long v32 = [v31 displayNameWithOptions:0];
          uint64_t v33 = objc_msgSend(v69, "stringWithFormat:", v63, v30, v32);

          uint64_t v23 = v33;
          int v10 = v72;

          long long v16 = (__CFString *)v63;
        }
      }
      else
      {
        uint64_t v62 = NSString;
        uint64_t v71 = GKGameCenterUIFrameworkBundle();
        uint64_t v68 = GKGetLocalizedStringFromTableInBundle();
        id v65 = [v17 objectAtIndexedSubscript:0];
        id v58 = [v65 displayNameWithOptions:0];
        v60 = [v17 objectAtIndexedSubscript:1];
        uint64_t v25 = [v60 displayNameWithOptions:0];
        uint64_t v26 = [v17 objectAtIndexedSubscript:2];
        [v26 displayNameWithOptions:0];
        uint64_t v27 = v17;
        v29 = uint64_t v28 = v10;
        uint64_t v23 = objc_msgSend(v62, "stringWithFormat:", v68, v58, v25, v29);

        int v10 = v28;
        uint64_t v17 = v27;
        uint64_t v24 = (void *)v71;

        long long v16 = (__CFString *)v68;
      }
    }
    else
    {
      uint64_t v61 = NSString;
      uint64_t v70 = GKGameCenterUIFrameworkBundle();
      uint64_t v55 = GKGetLocalizedStringFromTableInBundle();
      uint64_t v64 = [v17 objectAtIndexedSubscript:0];
      uint64_t v56 = [v64 displayNameWithOptions:0];
      uint64_t v59 = [v17 objectAtIndexedSubscript:1];
      long long v54 = [v59 displayNameWithOptions:0];
      uint64_t v57 = [v17 objectAtIndexedSubscript:2];
      int64_t v18 = [v57 displayNameWithOptions:0];
      [v17 objectAtIndexedSubscript:3];
      v67 = v17;
      v20 = uint64_t v19 = v10;
      uint64_t v21 = [v20 displayNameWithOptions:0];
      uint64_t v22 = objc_msgSend(v61, "stringWithFormat:", v55, v56, v54, v18, v21);

      uint64_t v23 = v22;
      int v10 = v19;
      uint64_t v17 = v67;
      uint64_t v24 = (void *)v70;

      long long v16 = (__CFString *)v55;
    }

    long long v16 = (__CFString *)v23;
    goto LABEL_14;
  }
LABEL_15:
  int v34 = [v14 isNearby];
  id v35 = [v14 players];
  unint64_t v36 = [v35 count];

  if (v34)
  {
    if (v36)
    {
      uint64_t v37 = [v14 players];
      long long v38 = [v37 objectAtIndexedSubscript:0];
      uint64_t v39 = [v38 displayNameWithOptions:0];

      long long v16 = (__CFString *)v39;
    }
    else
    {

      if (!*MEMORY[0x1E4F63860]) {
        id v47 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
        -[GKDashboardMultiplayerPickerDataSource playerGroupCellForItemAtIndexPath:inCollectionView:]();
      }
      long long v16 = 0;
    }
    long long v48 = GKGameCenterUIFrameworkBundle();
    long long v46 = GKGetLocalizedStringFromTableInBundle();
  }
  else if (v36 < 2)
  {
    long long v46 = 0;
  }
  else
  {
    long long v40 = NSString;
    long long v41 = GKGameCenterUIFrameworkBundle();
    long long v42 = GKGetLocalizedStringFromTableInBundle();
    [v14 players];
    id v43 = v6;
    v45 = long long v44 = v10;
    long long v46 = objc_msgSend(v40, "localizedStringWithFormat:", v42, objc_msgSend(v45, "count"));

    int v10 = v44;
    id v6 = v43;
  }
  long long v49 = [v14 players];
  if (v16) {
    long long v50 = v16;
  }
  else {
    long long v50 = &stru_1F07B2408;
  }
  long long v51 = [v14 messagesGroupIdentifier];
  objc_msgSend(v74, "configureWithPlayers:title:subtitle:messagesGroupIdentifier:source:playerSelectionProxy:", v49, v50, v46, v51, objc_msgSend(v14, "source"), self);

  BOOL v52 = [(GKDashboardMultiplayerPickerDataSource *)self shouldSelectPlayerGroup:v14];
  [v74 setSelected:v52];
  if (v52) {
    [(GKDashboardMultiplayerPickerDataSource *)self selectItemAtIndexPath:v6 animated:0 scrollPosition:0];
  }
  else {
    [(GKDashboardMultiplayerPickerDataSource *)self deselectItemAtIndexPath:v6 animated:0];
  }
  objc_msgSend(v74, "setLineVisible:", objc_msgSend(v6, "item") < v73 - 1);

  return v74;
}

- (id)suggestionsCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GKCollectionDataSource *)self isSearching])
  {
    id v8 = [(GKDashboardMultiplayerPickerDataSource *)self playerGroupCellForItemAtIndexPath:v6 inCollectionView:v7];
  }
  else
  {
    id v9 = +[GKSuggestionsContainerCell reuseIdentifier];
    id v8 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

    int v10 = [(GKCollectionDataSource *)self presentationViewController];
    [v8 setPresentationViewController:v10];

    [v8 setMultiplayerPickerDataSource:self];
    id v11 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
    [v8 configureWithDelegate:self nearbyPlayers:v11];

    [(GKDashboardMultiplayerPickerDataSource *)self setSuggestionContainerCell:v8];
  }

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    uint64_t v8 = [(GKDashboardMultiplayerPickerDataSource *)self suggestionsCellForItemAtIndexPath:v7 inCollectionView:v6];
    goto LABEL_8;
  }
  if ([v7 section] == 2)
  {
    uint64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"playerPickerNearbyInstructionCell" forIndexPath:v7];
LABEL_8:
    id v9 = (void *)v8;
    goto LABEL_9;
  }
  if ([v7 section] != 1 || -[GKDashboardMultiplayerPickerDataSource hasFriends](self, "hasFriends"))
  {
    uint64_t v8 = [(GKDashboardMultiplayerPickerDataSource *)self playerCellForItemAtIndexPath:v7 inCollectionView:v6];
    goto LABEL_8;
  }
  id v11 = +[GKMultiplayerPickerNoFriendsCell reuseIdentifier];
  id v9 = [v6 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v7];

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__GKDashboardMultiplayerPickerDataSource_collectionView_cellForItemAtIndexPath___block_invoke;
  v12[3] = &unk_1E5F634E8;
  objc_copyWeak(&v13, &location);
  [v9 setAddFriendsHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_9:

  return v9;
}

void __80__GKDashboardMultiplayerPickerDataSource_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 pickerDatasourceDidSelectAddFriend:v3];
}

- (id)headerTextForSection:(int64_t)a3
{
  if ([(GKCollectionDataSource *)self isSearching] || (unint64_t)a3 > 1)
  {
    int v5 = 0;
  }
  else
  {
    id v4 = GKGameCenterUIFrameworkBundle();
    int v5 = GKGetLocalizedStringFromTableInBundle();
  }

  return v5;
}

- (BOOL)isShowingAddFriendsFooter
{
  return ![(GKCollectionDataSource *)self isSearching];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(GKCollectionDataSource *)self isSearching]) {
    goto LABEL_2;
  }
  uint64_t v10 = [v8 section];
  if (!v10)
  {
    BOOL v12 = [(GKDashboardMultiplayerPickerDataSource *)self suggestedPlayerGroups];
    if ([v12 count])
    {
    }
    else
    {
      long long v15 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
      uint64_t v16 = [v15 count];

      if (!v16) {
        goto LABEL_16;
      }
    }
    +[GKSuggestionsContainerCell defaultCellHeight];
    goto LABEL_14;
  }
  if (v10 != 1)
  {
    if (v10 == 2)
    {
      id v11 = _TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell;
LABEL_11:
      [v7 bounds];
      -[__objc2_class itemHeightFitting:inTraitEnvironment:](v11, "itemHeightFitting:inTraitEnvironment:", v7, v13, v14);
      goto LABEL_14;
    }
LABEL_16:
    double v18 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_15;
  }
  if (![(GKDashboardMultiplayerPickerDataSource *)self hasFriends])
  {
    id v11 = _TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell;
    goto LABEL_11;
  }
LABEL_2:
  [(GKDashboardMultiplayerPickerDataSource *)self playerCellHeightInCollectionView:v7];
LABEL_14:
  double v17 = v9;
  double v18 = 0.0;
LABEL_15:

  double v19 = v18;
  double v20 = v17;
  result.height = v20;
  result.width = v19;
  return result;
}

- (BOOL)canSelectPlayerGroup:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 players];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v11);
        }
        v14 += [(GKDashboardMultiplayerPickerDataSource *)self playerIsSelectable:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  int64_t v17 = [(GKDashboardMultiplayerPickerDataSource *)self maxSelectable];
  double v18 = [(GKDashboardMultiplayerPickerDataSource *)self selectedPlayers];
  uint64_t v19 = [v18 count];

  if (!v14) {
    goto LABEL_17;
  }
  if (v14 == 1 && v17 == v19)
  {
    [(GKDashboardMultiplayerPickerDataSource *)self showSelectionLimitAlert];
LABEL_17:
    BOOL v20 = 0;
    goto LABEL_18;
  }
  BOOL v20 = 1;
  if (v14 >= 2 && v14 > v17 - v19)
  {
    [(GKDashboardMultiplayerPickerDataSource *)self expandPlayerGroup:v8 atIndexPath:v9 inCollectionView:v10];
    goto LABEL_17;
  }
LABEL_18:

  return v20;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(GKDashboardMultiplayerPickerDataSource *)self selectionShouldSkipDelegateResponse])
  {
    if (![v7 section])
    {
      if (![(GKCollectionDataSource *)self isSearching]
        || (unint64_t v15 = [v7 item],
            [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            unint64_t v17 = [v16 count],
            v16,
            v15 >= v17))
      {
        BOOL v8 = 0;
        goto LABEL_19;
      }
      double v18 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
      id v10 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

      if ([v10 fromPeopleSuggester]) {
        [(GKDashboardMultiplayerPickerDataSource *)self donateGroupToPeopleSuggester:v10];
      }
      BOOL v8 = [(GKDashboardMultiplayerPickerDataSource *)self canSelectPlayerGroup:v10 atIndexPath:v7 inCollectionView:v6];
LABEL_18:

      goto LABEL_19;
    }
    id v9 = [(GKDashboardMultiplayerPickerDataSource *)self playerForIndexPath:v7];
    id v10 = v9;
    if (!v9) {
      goto LABEL_6;
    }
    playerStates = self->_playerStates;
    uint64_t v12 = [v9 referenceKey];
    uint64_t v13 = [(NSMutableDictionary *)playerStates objectForKey:v12];
    uint64_t v14 = [v13 integerValue];

    if (v14 == 2)
    {
LABEL_6:
      BOOL v8 = 0;
      goto LABEL_18;
    }
    if (self->_maxSelectable >= 1)
    {
      uint64_t v19 = [(GKDashboardMultiplayerPickerDataSource *)self selectedPlayers];
      if ((unint64_t)[v19 count] >= self->_maxSelectable)
      {
        BOOL v20 = [(GKDashboardMultiplayerPickerDataSource *)self selectedPlayers];
        char v21 = [v20 containsObject:v10];

        if ((v21 & 1) == 0)
        {
          [(GKDashboardMultiplayerPickerDataSource *)self showSelectionLimitAlert];
          goto LABEL_6;
        }
      }
      else
      {
      }
    }
    BOOL v8 = [v7 section] != 2;
    goto LABEL_18;
  }
  BOOL v8 = 1;
LABEL_19:

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(GKDashboardMultiplayerPickerDataSource *)self selectionShouldSkipDelegateResponse])
  {
    if ([v7 section])
    {
      uint64_t v8 = [(GKDashboardMultiplayerPickerDataSource *)self playerForIndexPath:v7];
      id v9 = (void *)v8;
      if (v8)
      {
        v19[0] = v8;
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __82__GKDashboardMultiplayerPickerDataSource_collectionView_didSelectItemAtIndexPath___block_invoke;
        v16[3] = &unk_1E5F63E80;
        v16[4] = self;
        id v17 = v6;
        id v18 = v9;
        [(GKDashboardMultiplayerPickerDataSource *)self didSelectPlayers:v10 indexPath:v7 dataSourceIdentifier:@"GKPickerMainDataSourceIdentifier" completion:v16];
      }
      else
      {
        [(GKDashboardMultiplayerPickerDataSource *)self deselectItemAtIndexPath:v7 animated:0];
      }
      goto LABEL_10;
    }
    if ([(GKCollectionDataSource *)self isSearching])
    {
      unint64_t v11 = [v7 item];
      uint64_t v12 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
      unint64_t v13 = [v12 count];

      if (v11 < v13)
      {
        uint64_t v14 = [MEMORY[0x1E4F637F8] reporter];
        [v14 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63378]];

        id v9 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
        unint64_t v15 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
        [(GKDashboardMultiplayerPickerDataSource *)self didSelectPlayerGroup:v15 indexPath:v7 dataSourceIdentifier:@"GKPickerMainDataSourceIdentifier" completion:0];

LABEL_10:
        goto LABEL_11;
      }
    }
    [(GKDashboardMultiplayerPickerDataSource *)self deselectItemAtIndexPath:v7 animated:0];
  }
LABEL_11:
}

void __82__GKDashboardMultiplayerPickerDataSource_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isSearching] & 1) == 0)
  {
    id v2 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    id v3 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5[0] = *(void *)(a1 + 48);
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
      [v3 updateVisibleItemsWithPlayers:v4 excludedIndexPath:0];
    }
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(GKDashboardMultiplayerPickerDataSource *)self selectionShouldSkipDelegateResponse])
  {
    if ([v7 section])
    {
      uint64_t v8 = [(GKDashboardMultiplayerPickerDataSource *)self playerForIndexPath:v7];
      v18[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __84__GKDashboardMultiplayerPickerDataSource_collectionView_didDeselectItemAtIndexPath___block_invoke;
      v15[3] = &unk_1E5F63E80;
      v15[4] = self;
      id v16 = v6;
      id v17 = v8;
      id v10 = v8;
      [(GKDashboardMultiplayerPickerDataSource *)self didDeselectPlayers:v9 indexPath:v7 dataSourceIdentifier:@"GKPickerMainDataSourceIdentifier" completion:v15];

LABEL_4:
      goto LABEL_8;
    }
    if ([(GKCollectionDataSource *)self isSearching])
    {
      unint64_t v11 = [v7 item];
      uint64_t v12 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
      unint64_t v13 = [v12 count];

      if (v11 < v13)
      {
        id v10 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
        uint64_t v14 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
        [(GKDashboardMultiplayerPickerDataSource *)self didDeselectPlayerGroup:v14 indexPath:v7 dataSourceIdentifier:@"GKPickerMainDataSourceIdentifier" completion:0];

        goto LABEL_4;
      }
    }
  }
LABEL_8:
}

void __84__GKDashboardMultiplayerPickerDataSource_collectionView_didDeselectItemAtIndexPath___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isSearching] & 1) == 0)
  {
    id v2 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    id v3 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5[0] = *(void *)(a1 + 48);
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
      [v3 updateVisibleItemsWithPlayers:v4 excludedIndexPath:0];
    }
  }
}

- (BOOL)_canShowMoreFriends
{
  int64_t v3 = [(GKDashboardMultiplayerPickerDataSource *)self pickerOrigin];
  BOOL v4 = [(GKDashboardMultiplayerPickerDataSource *)self showsAllFriends];
  if (v3 != 1) {
    return !v4;
  }
  if (v4) {
    return 0;
  }
  id v6 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
  unint64_t v7 = [v6 count];
  BOOL v5 = v7 > [(GKDashboardMultiplayerPickerDataSource *)self numberOfFriendsToShowInitially]+ 1;

  return v5;
}

- (BOOL)shouldSelectPlayerGroup:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a3 players];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (-[GKDashboardMultiplayerPickerDataSource playerIsSelectable:](self, "playerIsSelectable:", v10, (void)v12))
        {
          if (![(GKDashboardMultiplayerPickerDataSource *)self playerIsSelected:v10]) {
            goto LABEL_12;
          }
          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
LABEL_12:
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)expandPlayerGroup:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v28 = a3;
  uint64_t v6 = [MEMORY[0x1E4F637F8] reporter];
  [v6 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63348]];

  char v7 = [v28 groupName];
  if (![v7 length])
  {
    uint64_t v8 = [v28 players];
    id v9 = [v8 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 displayNameWithOptions:0];

    char v7 = (void *)v10;
  }
  unint64_t v11 = [v28 players];
  unint64_t v12 = [v11 count];

  if (v12 < 2)
  {
    uint64_t v17 = 0;
  }
  else
  {
    long long v13 = NSString;
    long long v14 = GKGameCenterUIFrameworkBundle();
    long long v15 = GKGetLocalizedStringFromTableInBundle();
    id v16 = [v28 players];
    uint64_t v17 = objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v16, "count"));
  }
  id v18 = [_TtC12GameCenterUI29GKExpandedGroupViewController alloc];
  uint64_t v19 = GKGameCenterUIFrameworkBundle();
  BOOL v20 = [(GKExpandedGroupViewController *)v18 initWithNibName:@"GKExpandedGroupViewController_iOS" bundle:v19];

  [(GKExpandedGroupViewController *)v20 setModalPresentationStyle:8];
  double v21 = *MEMORY[0x1E4F1DB28];
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v25 = [(GKExpandedGroupViewController *)v20 view];
  objc_msgSend(v25, "setFrame:", v21, v22, v23, v24);

  uint64_t v26 = [v28 players];
  [(GKExpandedGroupViewController *)v20 configureWithPlayers:v26 groupName:v7 caption:v17 playerSelectionProxy:self];

  uint64_t v27 = [(GKCollectionDataSource *)self presentationViewController];
  [v27 presentViewController:v20 animated:1 completion:0];
}

- (void)updatePlayerGroups:(id)a3 forPlayers:(id)a4 excludedIndexPath:(id)a5
{
  long long v32 = self;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v36 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 count];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      unint64_t v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", i, 0, v32);
      [v10 addObject:v12];
    }
  }
  int v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v32);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        if ([v17 compare:v8])
        {
          id v18 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v17, "item"));
          uint64_t v19 = [v18 players];

          BOOL v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
          double v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v36];
          if ([v20 intersectsSet:v21]) {
            [v34 addObject:v17];
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v14);
  }

  double v22 = v34;
  if ([v34 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v23 = v34;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v37 + 1) + 8 * k);
          unint64_t v29 = [v28 item];
          if (v29 < [v7 count])
          {
            int v30 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v28, "item"));
            int v31 = [v33 shouldSelectPlayerGroup:v30];

            if (v31) {
              [v33 selectItemAtIndexPath:v28 animated:0 scrollPosition:0];
            }
            else {
              [v33 deselectItemAtIndexPath:v28 animated:0];
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v25);
    }

    double v22 = v34;
  }
}

- (void)updateVisibleItemsWithPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(void))a6;
  if ([(GKCollectionDataSource *)self isSearching])
  {
    uint64_t v14 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
    [(GKDashboardMultiplayerPickerDataSource *)self updatePlayerGroups:v14 forPlayers:v10 excludedIndexPath:v11];

    if (v13) {
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  long long v44 = v13;
  uint64_t v15 = [(GKDashboardMultiplayerPickerDataSource *)self candidateIndexPaths];
  long long v45 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v16) {
    goto LABEL_40;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v61;
  id v46 = v11;
  id v47 = v10;
  id v48 = v12;
  uint64_t v49 = *(void *)v61;
  do
  {
    uint64_t v19 = 0;
    uint64_t v50 = v17;
    do
    {
      if (*(void *)v61 != v18) {
        objc_enumerationMutation(obj);
      }
      BOOL v20 = *(void **)(*((void *)&v60 + 1) + 8 * v19);
      if (![v20 isEqual:v11]
        || ([v12 isEqualToString:@"GKPickerMainDataSourceIdentifier"] & 1) == 0)
      {
        if ([(GKCollectionDataSource *)self isSearching])
        {
          [v11 section];
          goto LABEL_38;
        }
        if ([v20 section] == 1)
        {
          unint64_t v21 = [v20 item];
          double v22 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
          unint64_t v23 = [v22 count];

          BOOL v24 = v21 >= v23;
          uint64_t v18 = v49;
          uint64_t v17 = v50;
          if (!v24)
          {
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v25 = v10;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v57;
LABEL_17:
              uint64_t v29 = 0;
              while (1)
              {
                if (*(void *)v57 != v28) {
                  objc_enumerationMutation(v25);
                }
                int v30 = *(void **)(*((void *)&v56 + 1) + 8 * v29);
                int v31 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
                long long v32 = objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v20, "item"));
                LODWORD(v30) = [v30 isEqual:v32];

                if (v30) {
                  goto LABEL_35;
                }
                if (v27 == ++v29)
                {
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v56 objects:v65 count:16];
                  if (v27) {
                    goto LABEL_17;
                  }
                  goto LABEL_36;
                }
              }
            }
            goto LABEL_36;
          }
        }
        if ([v20 section] == 2)
        {
          unint64_t v33 = [v20 item];
          int v34 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
          unint64_t v35 = [v34 count];

          BOOL v24 = v33 >= v35;
          uint64_t v17 = v50;
          if (!v24)
          {
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v25 = v10;
            uint64_t v36 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v53;
LABEL_28:
              uint64_t v39 = 0;
              while (1)
              {
                if (*(void *)v53 != v38) {
                  objc_enumerationMutation(v25);
                }
                long long v40 = *(void **)(*((void *)&v52 + 1) + 8 * v39);
                long long v41 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyPlayers];
                long long v42 = objc_msgSend(v41, "objectAtIndexedSubscript:", objc_msgSend(v20, "item"));
                LODWORD(v40) = [v40 isEqual:v42];

                if (v40) {
                  break;
                }
                if (v37 == ++v39)
                {
                  uint64_t v37 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
                  id v12 = v48;
                  if (v37) {
                    goto LABEL_28;
                  }
                  goto LABEL_34;
                }
              }
LABEL_35:
              [v45 addObject:v20];
LABEL_36:

              id v11 = v46;
              id v10 = v47;
              id v12 = v48;
            }
            else
            {
LABEL_34:

              id v11 = v46;
              id v10 = v47;
            }
            uint64_t v18 = v49;
            uint64_t v17 = v50;
          }
        }
      }
LABEL_38:
      ++v19;
    }
    while (v19 != v17);
    uint64_t v17 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  }
  while (v17);
LABEL_40:

  if ([v45 count])
  {
    long long v43 = [(GKDashboardMultiplayerPickerDataSource *)self collectionView];
    [(GKDashboardMultiplayerPickerDataSource *)self updateSelectionStateForCollectionView:v43 indexPaths:v45];
  }
  uint64_t v13 = v44;
  if (v44) {
LABEL_43:
  }
    v13[2](v13);
LABEL_44:
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(GKDashboardMultiplayerPickerDataSource *)self setSelectionShouldSkipDelegateResponse:1];
  uint64_t v9 = [(GKDashboardMultiplayerPickerDataSource *)self collectionView];
  [v9 selectItemAtIndexPath:v8 animated:v6 scrollPosition:a5];

  [(GKDashboardMultiplayerPickerDataSource *)self setSelectionShouldSkipDelegateResponse:0];
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(GKDashboardMultiplayerPickerDataSource *)self setSelectionShouldSkipDelegateResponse:1];
  id v7 = [(GKDashboardMultiplayerPickerDataSource *)self collectionView];
  [v7 deselectItemAtIndexPath:v6 animated:v4];

  [(GKDashboardMultiplayerPickerDataSource *)self setSelectionShouldSkipDelegateResponse:0];
}

- (void)updateSelectionStateForCollectionView:(id)a3 indexPaths:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = a4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
        id v12 = [(GKDashboardMultiplayerPickerDataSource *)self playerForIndexPath:v11];
        uint64_t v13 = [v6 cellForItemAtIndexPath:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v6;
          id v15 = v13;
          uint64_t v16 = self;
          playerStates = self->_playerStates;
          uint64_t v18 = [v12 referenceKey];
          uint64_t v19 = [(NSMutableDictionary *)playerStates objectForKey:v18];
          uint64_t v20 = [v19 integerValue];

          [v15 setSelectable:v20 != 2];
          [v15 setSelected:v20 == 1];
          if ([v15 isSelected]) {
            [(GKDashboardMultiplayerPickerDataSource *)v16 selectItemAtIndexPath:v11 animated:0 scrollPosition:0];
          }
          else {
            [(GKDashboardMultiplayerPickerDataSource *)v16 deselectItemAtIndexPath:v11 animated:0];
          }
          self = v16;

          id v6 = v14;
          uint64_t v9 = v21;
          uint64_t v8 = v22;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
}

- (double)playerCellHeightInCollectionView:(id)a3
{
  int64_t v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "currentTraitCollection", a3);
  BOOL v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4FB2778]])
    {
      double v5 = 362.0;
      goto LABEL_15;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FB2780]])
    {
      double v5 = 332.0;
      goto LABEL_15;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FB2788]])
    {
      double v5 = 282.0;
      goto LABEL_15;
    }
    BOOL v6 = [v4 isEqualToString:*MEMORY[0x1E4FB2790]] == 0;
    double v7 = 202.0;
    double v8 = 252.0;
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4FB27B0]])
    {
      double v5 = 78.0;
      goto LABEL_15;
    }
    BOOL v6 = [v4 isEqualToString:*MEMORY[0x1E4FB27B8]] == 0;
    double v7 = 60.0;
    double v8 = 78.0;
  }
  if (v6) {
    double v5 = v7;
  }
  else {
    double v5 = v8;
  }
LABEL_15:

  return v5;
}

- (id)attributedFriendFilterTitle
{
  [(GKDashboardMultiplayerPickerDataSource *)self friendSortFilterScope];
  id v2 = GKGameCenterUIFrameworkBundle();
  int64_t v3 = GKGetLocalizedStringFromTableInBundle();

  BOOL v4 = [v3 stringByAppendingString:@" "];

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];
  BOOL v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down"];
  double v7 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v6];
  double v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v7];
  [v5 appendAttributedString:v8];

  return v5;
}

- (unint64_t)cornerMaskForSectionHeader
{
  return 3;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    id v47 = v8;
    id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"friendsSectionHeaderReuseIdentifier" forIndexPath:v10];
    id v12 = -[GKDashboardMultiplayerPickerDataSource headerTextForSection:](self, "headerTextForSection:", [v10 section]);
    [v11 setTitle:v12];

    unint64_t v13 = [(GKDashboardMultiplayerPickerDataSource *)self cornerMaskForSectionHeader];
    uint64_t v14 = *MEMORY[0x1E4F39EA8];
    id v15 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v16 = [v15 colorWithAlphaComponent:0.08];

    uint64_t v17 = [v11 layer];
    [v17 setMaskedCorners:v13];

    uint64_t v18 = [v11 layer];
    [v18 setCornerRadius:14.0];

    uint64_t v19 = [v11 layer];
    [v19 setCornerCurve:v14];

    [v11 setBackgroundColor:v16];
    uint64_t v20 = *MEMORY[0x1E4F3A2E8];
    uint64_t v21 = [v11 layer];
    [v21 setCompositingFilter:v20];

    uint64_t v22 = [v11 backgroundPlatterView];
    unint64_t v23 = [v22 layer];
    [v23 setMaskedCorners:v13];

    long long v24 = [v11 backgroundPlatterView];
    long long v25 = [v24 layer];
    [v25 setCornerRadius:14.0];

    long long v26 = [v11 backgroundPlatterView];
    long long v27 = [v26 layer];
    [v27 setCornerCurve:v14];

    uint64_t v28 = [v11 backgroundPlatterView];
    [v28 setBackgroundColor:v16];

    uint64_t v29 = [v11 backgroundPlatterView];
    int v30 = [v29 layer];
    [v30 setCompositingFilter:v20];

    int v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    long long v32 = [v11 titleLabel];
    [v32 setTextColor:v31];

    unint64_t v33 = [v11 titleLabel];
    int v34 = [v33 layer];
    [v34 setCompositingFilter:v20];

    unint64_t v35 = [MEMORY[0x1E4FB08E0] _gkPreferredFontForTextStyle:*MEMORY[0x1E4FB28F0] symbolicTraits:2];
    [v11 setFont:v35];
    if ([v10 section] == 1)
    {
      [v11 setButtonTarget:self];
      uint64_t v36 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
      uint64_t v37 = [v36 createSortPickerMenu];
      [v11 setButtonMenu:v37];

      uint64_t v38 = [(GKDashboardMultiplayerPickerDataSource *)self attributedFriendFilterTitle];
      [v11 setAttributedButtonTitle:v38];

      [v11 setButtonHidden:0];
      uint64_t v39 = [MEMORY[0x1E4FB1618] whiteColor];
      [v11 setTintColor:v39];
    }
    else
    {
      [v11 setButtonHidden:1];
    }
    [v11 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.SectionHeader"];
    long long v45 = [v11 titleLabel];
    [v45 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.SectionHeaderTitle"];

    id v8 = v47;
    goto LABEL_14;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2760]]
    && [(GKDashboardMultiplayerPickerDataSource *)self _canShowMoreFriends]
    && [v10 section] == 1)
  {
    id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"friendsSectionFooterShowMoreFriendsReuseIdentifier" forIndexPath:v10];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v8);
    long long v40 = GKGameCenterUIFrameworkBundle();
    long long v41 = GKGetLocalizedStringFromTableInBundle();
    [v11 setShowMoreText:v41];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    void v50[2] = __103__GKDashboardMultiplayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
    v50[3] = &unk_1E5F66860;
    objc_copyWeak(&v51, &location);
    objc_copyWeak(&v52, &from);
    [v11 setActionHandler:v50];
    [v11 setHidden:0];
    objc_destroyWeak(&v52);
    objc_destroyWeak(&v51);
    p_frouint64_t m = &from;
LABEL_10:
    objc_destroyWeak(p_from);
    objc_destroyWeak(&location);

    goto LABEL_14;
  }
  BOOL v43 = [(GKDashboardMultiplayerPickerDataSource *)self isShowingAddFriendsFooter];
  long long v44 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"friendsSectionFooterPlayWithFriendsReuseIdentifier" forIndexPath:v10];
  id v11 = v44;
  if (v43)
  {
    id v11 = v44;
    objc_initWeak(&location, self);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __103__GKDashboardMultiplayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2;
    void v48[3] = &unk_1E5F634E8;
    objc_copyWeak(&v49, &location);
    [v11 setAddFriendsHandler:v48];
    objc_msgSend(v11, "setHidden:", objc_msgSend(v10, "section") != 1);
    p_frouint64_t m = &v49;
    goto LABEL_10;
  }
  [v44 setHidden:1];
LABEL_14:

  return v11;
}

void __103__GKDashboardMultiplayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setShowsAllFriends:1];
    objc_copyWeak(&to, (id *)(a1 + 40));
    id v4 = objc_loadWeakRetained(&to);
    double v5 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v4 reloadSections:v5];

    id v6 = objc_loadWeakRetained(&to);
    double v7 = [v6 superview];
    [v7 setNeedsFocusUpdate];

    objc_destroyWeak(&to);
  }
}

void __103__GKDashboardMultiplayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 pickerDatasourceDidSelectAddFriend:v3];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5
    || (+[GKDashboardButtonSectionHeaderView defaultHeight], double v11 = v10, [(GKCollectionDataSource *)self isSearching])|| (v12 = [(GKDashboardMultiplayerPickerDataSource *)self nearbyOnly], a5 == 2)|| v12|| (v13 = 0.0, a5 == 1) && ![(GKDashboardMultiplayerPickerDataSource *)self hasFriends])
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v14 = v13;
  double v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)boundingSizeForItemsInCollectionView:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  double v5 = v4;
  id v6 = [v3 collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 sectionInset];
    double v5 = v5 - v7 - v8;
  }
  [v3 bounds];
  double v10 = v9;

  double v11 = v5;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7 = a3;
  [(GKDashboardMultiplayerPickerDataSource *)self boundingSizeForItemsInCollectionView:v7];
  double v10 = 0.0;
  if (a5 == 1)
  {
    double v11 = v8;
    double v12 = v9;
    if (![(GKDashboardMultiplayerPickerDataSource *)self nearbyOnly]
      && ![(GKCollectionDataSource *)self isSearching])
    {
      if ([(GKDashboardMultiplayerPickerDataSource *)self _canShowMoreFriends])
      {
        double v13 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
        double v14 = [v13 preferredContentSizeCategory];

        if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v14))
        {
          if ([v14 isEqualToString:*MEMORY[0x1E4FB2778]]) {
            double v10 = 100.0;
          }
          else {
            double v10 = 50.0;
          }
          if ([v14 isEqualToString:*MEMORY[0x1E4FB2780]]) {
            double v10 = v10 + 40.0;
          }
          if ([v14 isEqualToString:*MEMORY[0x1E4FB2788]]) {
            double v10 = v10 + 30.0;
          }
          if ([v14 isEqualToString:*MEMORY[0x1E4FB2790]]) {
            double v10 = v10 + 20.0;
          }
          if ([v14 isEqualToString:*MEMORY[0x1E4FB2798]]) {
            double v10 = v10 + 10.0;
          }
        }
        else
        {
          double v10 = 50.0;
        }
      }
      else if ([(GKDashboardMultiplayerPickerDataSource *)self hasFriends] {
             && [(GKDashboardMultiplayerPickerDataSource *)self isShowingAddFriendsFooter])
      }
      {
        +[GKMultiplayerPickerAddFriendsSupplementary preferredHeightFitting:inTraitEnvironment:](_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary, "preferredHeightFitting:inTraitEnvironment:", v7, v11, v12);
        double v10 = v15;
      }
    }
  }

  double v16 = 0.0;
  double v17 = v10;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)showSelectionLimitAlert
{
  if (![(GKDashboardMultiplayerPickerDataSource *)self selectionShouldSkipDelegateResponse])
  {
    id v14 = (id)objc_opt_new();
    id v3 = GKGameCenterUIFrameworkBundle();
    double v4 = GKGetLocalizedStringFromTableInBundle();
    [v14 setTitle:v4];

    double v5 = NSString;
    id v6 = GKGameCenterUIFrameworkBundle();
    id v7 = GKGetLocalizedStringFromTableInBundle();
    double v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, -[GKDashboardMultiplayerPickerDataSource maxSelectable](self, "maxSelectable"));
    [v14 setMessage:v8];

    double v9 = (void *)MEMORY[0x1E4FB1410];
    double v10 = GKGameCenterUIFrameworkBundle();
    double v11 = GKGetLocalizedStringFromTableInBundle();
    double v12 = [v9 actionWithTitle:v11 style:0 handler:0];
    [v14 addAction:v12];

    double v13 = [(GKCollectionDataSource *)self presentationViewController];
    [v13 presentViewController:v14 animated:1 completion:0];
  }
}

- (void)didRemoveRecipientPlayers:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F28D58] indexPathForItem:-1 inSection:-1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__GKDashboardMultiplayerPickerDataSource_didRemoveRecipientPlayers___block_invoke;
  v7[3] = &unk_1E5F63350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GKDashboardMultiplayerPickerDataSource *)self didDeselectPlayers:v6 indexPath:v5 dataSourceIdentifier:@"GKPickerMainDataSourceIdentifier" completion:v7];
}

void __68__GKDashboardMultiplayerPickerDataSource_didRemoveRecipientPlayers___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isSearching] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    id v2 = [*(id *)(a1 + 32) collectionView];
    id v3 = [v2 cellForItemAtIndexPath:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 updateVisibleItemsWithPlayers:*(void *)(a1 + 40) excludedIndexPath:0];
    }
  }
}

- (void)didAddRecipientPlayers:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F28D58] indexPathForItem:-1 inSection:-1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__GKDashboardMultiplayerPickerDataSource_didAddRecipientPlayers___block_invoke;
  v7[3] = &unk_1E5F63350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GKDashboardMultiplayerPickerDataSource *)self didSelectPlayers:v6 indexPath:v5 dataSourceIdentifier:@"GKPickerMainDataSourceIdentifier" completion:v7];
}

void __65__GKDashboardMultiplayerPickerDataSource_didAddRecipientPlayers___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isSearching] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    id v2 = [*(id *)(a1 + 32) collectionView];
    id v3 = [v2 cellForItemAtIndexPath:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 updateVisibleItemsWithPlayers:*(void *)(a1 + 40) excludedIndexPath:0];
    }
  }
}

- (void)didPickContact:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F63788];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithContact:v5];

  id v7 = [(GKDashboardMultiplayerPickerDataSource *)self contactPlayers];
  char v8 = [v7 containsObject:v6];

  if ((v8 & 1) == 0)
  {
    double v9 = [(GKDashboardMultiplayerPickerDataSource *)self contactPlayers];
    [v9 addObject:v6];
  }
  double v10 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
  double v11 = [v6 referenceKey];
  double v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12)
  {
    double v13 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
    id v14 = [v6 referenceKey];
    double v12 = &unk_1F0812288;
    [v13 setObject:&unk_1F0812288 forKeyedSubscript:v14];
  }
  if ([v12 integerValue] == 1)
  {
    double v15 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
    v25[0] = v6;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v15 highlightAlreadySelectedPlayers:v16 inGroup:0];
  }
  else if (![v12 integerValue])
  {
    int64_t v17 = [(GKDashboardMultiplayerPickerDataSource *)self maxSelectable];
    uint64_t v18 = [(GKDashboardMultiplayerPickerDataSource *)self selectedPlayers];
    uint64_t v19 = [v18 count];

    if (v17 == v19)
    {
      [(GKDashboardMultiplayerPickerDataSource *)self showSelectionLimitAlert];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F28D58] indexPathForItem:-1 inSection:-1];
      long long v24 = v6;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __57__GKDashboardMultiplayerPickerDataSource_didPickContact___block_invoke;
      v22[3] = &unk_1E5F63350;
      v22[4] = self;
      id v23 = v6;
      [(GKDashboardMultiplayerPickerDataSource *)self didSelectPlayers:v21 indexPath:v20 dataSourceIdentifier:@"GKPickerMainDataSourceIdentifier" completion:v22];
    }
  }
}

void __57__GKDashboardMultiplayerPickerDataSource_didPickContact___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isSearching] & 1) == 0)
  {
    id v2 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    id v3 = [*(id *)(a1 + 32) collectionView];
    id v4 = [v3 cellForItemAtIndexPath:v2];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6[0] = *(void *)(a1 + 40);
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
      [v4 updateVisibleItemsWithPlayers:v5 excludedIndexPath:0];
    }
  }
}

- (int64_t)getSelectedPlayerCount
{
  id v2 = [(GKDashboardMultiplayerPickerDataSource *)self selectedPlayers];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)didSelectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  [MEMORY[0x1E4F1CA48] array];
  v34 = unint64_t v33 = v10;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v11 = [v10 players];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        int64_t v17 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
        uint64_t v18 = [v16 referenceKey];
        uint64_t v19 = [v17 objectForKeyedSubscript:v18];
        uint64_t v20 = [v19 integerValue];

        if (!v20)
        {
          [v34 addObject:v16];
          uint64_t v21 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
          uint64_t v22 = [v16 referenceKey];
          [v21 setObject:&unk_1F08122A0 forKeyedSubscript:v22];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }

  if ([v33 fromPeopleSuggester])
  {
    id v23 = [v33 players];
    unint64_t v24 = [v23 count];

    if (v24 >= 2)
    {
      long long v25 = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];

      if (!v25)
      {
        long long v26 = objc_opt_new();
        [(GKDashboardMultiplayerPickerDataSource *)self setSelectedMessageGroups:v26];
      }
      long long v27 = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];
      [v27 addObject:v33];
    }
  }
  uint64_t v28 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
  [v28 pickerDatasource:self didSelectPlayers:v34 inGroup:v33];

  uint64_t v29 = [v33 players];
  [(GKDashboardMultiplayerPickerDataSource *)self updateVisibleItemsWithPlayers:v29 indexPath:v32 dataSourceIdentifier:v31 completion:v30];
}

- (void)didSelectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  long long v27 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v28 + 1) + 8 * v15);
        int64_t v17 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
        uint64_t v18 = [v16 referenceKey];
        uint64_t v19 = [v17 objectForKeyedSubscript:v18];
        uint64_t v20 = [v19 integerValue];

        if (!v20)
        {
          [v27 addObject:v16];
          uint64_t v21 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
          uint64_t v22 = [v16 referenceKey];
          [v21 setObject:&unk_1F08122A0 forKeyedSubscript:v22];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  id v23 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
  [v23 pickerDatasource:self didSelectPlayers:v27 inGroup:0];

  [(GKDashboardMultiplayerPickerDataSource *)self updateVisibleItemsWithPlayers:v11 indexPath:v26 dataSourceIdentifier:v25 completion:v24];
}

- (void)didDeselectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v11 = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];
  [v11 removeObject:v10];

  [MEMORY[0x1E4F1CA48] array];
  v31 = long long v30 = v10;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [v10 players];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        int64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v18 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
        uint64_t v19 = [v17 referenceKey];
        uint64_t v20 = [v18 objectForKeyedSubscript:v19];
        uint64_t v21 = [v20 integerValue];

        if (v21 == 1)
        {
          [v31 addObject:v17];
          uint64_t v22 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
          id v23 = [v17 referenceKey];
          [v22 setObject:&unk_1F0812288 forKeyedSubscript:v23];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }

  id v24 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
  [v24 pickerDatasource:self didDeselectPlayers:v31 inGroup:v30];

  [(GKDashboardMultiplayerPickerDataSource *)self updateMessageGroupsPlayerSelection];
  id v25 = [v30 players];
  [(GKDashboardMultiplayerPickerDataSource *)self updateVisibleItemsWithPlayers:v25 indexPath:v29 dataSourceIdentifier:v28 completion:v27];

  if ([v30 isNearby])
  {
    id v26 = [MEMORY[0x1E4F637F8] reporter];
    [v26 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63360]];
  }
}

- (void)didDeselectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v40 = a4;
  id v39 = a5;
  id v38 = a6;
  if ((unint64_t)[v10 count] >= 2)
  {
    id v11 = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v13 = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v47;
LABEL_5:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v46 + 1) + 8 * v17);
          uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v20 = [v18 players];
          uint64_t v21 = [v19 setWithArray:v20];

          uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
          if ([v21 isEqualToSet:v22]) {
            break;
          }

          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
            if (v15) {
              goto LABEL_5;
            }
            goto LABEL_14;
          }
        }
        id v23 = v18;

        if (!v23) {
          goto LABEL_15;
        }
        id v24 = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];
        [v24 removeObject:v23];

        uint64_t v13 = v23;
      }
LABEL_14:
    }
  }
LABEL_15:
  long long v41 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v25 = v10;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v31 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
        long long v32 = [v30 referenceKey];
        long long v33 = [v31 objectForKeyedSubscript:v32];
        uint64_t v34 = [v33 integerValue];

        if (v34 == 1)
        {
          [v41 addObject:v30];
          long long v35 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
          long long v36 = [v30 referenceKey];
          [v35 setObject:&unk_1F0812288 forKeyedSubscript:v36];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v27);
  }

  uint64_t v37 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
  [v37 pickerDatasource:self didDeselectPlayers:v41 inGroup:0];

  [(GKDashboardMultiplayerPickerDataSource *)self updateMessageGroupsPlayerSelection];
  [(GKDashboardMultiplayerPickerDataSource *)self updateVisibleItemsWithPlayers:v25 indexPath:v40 dataSourceIdentifier:v39 completion:v38];
}

- (void)updateMessageGroupsPlayerSelection
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];
  uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v30 = v4;
        id v5 = [v4 players];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v38;
          while (2)
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v38 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              id v11 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
              uint64_t v12 = [v10 referenceKey];
              uint64_t v13 = [v11 objectForKeyedSubscript:v12];
              uint64_t v14 = [v13 integerValue];

              if (!v14)
              {
                [v27 addObject:v30];
                goto LABEL_16;
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v29);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v31 = v27;
  uint64_t v15 = [v31 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v31);
        }
        uint64_t v19 = *(void **)(*((void *)&v33 + 1) + 8 * k);
        uint64_t v20 = [(GKDashboardMultiplayerPickerDataSource *)self selectedMessageGroups];
        [v20 removeObject:v19];

        uint64_t v21 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
        uint64_t v22 = [v19 players];
        [v21 pickerDatasource:self didDeselectPlayers:v22 inGroup:v19];

        id v23 = [v19 players];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __76__GKDashboardMultiplayerPickerDataSource_updateMessageGroupsPlayerSelection__block_invoke;
        v32[3] = &unk_1E5F66888;
        void v32[4] = self;
        id v24 = [v23 _gkFilterWithBlock:v32];

        id v25 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
        [v25 pickerDatasource:self didSelectPlayers:v24 inGroup:0];
      }
      uint64_t v16 = [v31 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v16);
  }
}

id __76__GKDashboardMultiplayerPickerDataSource_updateMessageGroupsPlayerSelection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 playerStates];
  id v5 = [v3 referenceKey];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 1) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)candidateIndexPaths
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:20];
  if (![(GKCollectionDataSource *)self isSearching])
  {
    id v4 = [(GKDashboardMultiplayerPickerDataSource *)self friendPlayers];
    uint64_t v5 = [v4 count];

    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:1];
        [v3 addObject:v7];
      }
    }
  }

  return v3;
}

- (BOOL)playerIsSelectable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
  uint64_t v6 = [v4 referenceKey];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 integerValue];

  return v8 != 2;
}

- (BOOL)playerIsSelected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKDashboardMultiplayerPickerDataSource *)self playerStates];
  uint64_t v6 = [v4 referenceKey];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 integerValue];

  return v8 == 1;
}

- (void)donateGroupToPeopleSuggester:(id)a3
{
  id v15 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F89C70]);
  id v4 = [v15 players];
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v15 players];
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 contact];
    uint64_t v8 = [v7 suggestedHandle];

    id v9 = v15;
    if (v8)
    {
      id v10 = [v15 players];
      id v11 = [v10 objectAtIndexedSubscript:0];
      uint64_t v12 = [v11 contact];
      uint64_t v13 = [v12 suggestedHandle];
      [v3 gameCenterSuggestionConsumedWithContactHandle:v13];

      goto LABEL_7;
    }
  }
  else
  {

    id v9 = v15;
  }
  uint64_t v14 = [v9 conversationIdentifier];

  if (!v14) {
    goto LABEL_8;
  }
  id v10 = [v15 conversationIdentifier];
  [v3 gameCenterSuggestionConsumedWithGroupIdentifier:v10];
LABEL_7:

LABEL_8:
}

- (void)didAttemptSelectingAlreadySelectedPlayers:(id)a3 inGroup:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];

  if (v7)
  {
    uint64_t v8 = [(GKDashboardMultiplayerPickerDataSource *)self delegate];
    [v8 highlightAlreadySelectedPlayers:v9 inGroup:v6];
  }
}

- (void)expandedGroupViewControllerWillDismiss
{
}

- (void)handleLongPressGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKDashboardMultiplayerPickerDataSource *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(GKDashboardMultiplayerPickerDataSource *)self collectionView];
  objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (![v19 section])
  {
    if ([(GKCollectionDataSource *)self isSearching])
    {
      if (([v19 item] & 0x8000000000000000) == 0)
      {
        unint64_t v11 = [v19 item];
        uint64_t v12 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
        unint64_t v13 = [v12 count];

        if (v11 < v13)
        {
          uint64_t v14 = [(GKDashboardMultiplayerPickerDataSource *)self searchPlayersAndGroups];
          id v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v19, "item"));

          uint64_t v16 = [v15 players];
          unint64_t v17 = [v16 count];

          if (v17 >= 2)
          {
            uint64_t v18 = [(GKDashboardMultiplayerPickerDataSource *)self collectionView];
            [(GKDashboardMultiplayerPickerDataSource *)self expandPlayerGroup:v15 atIndexPath:v19 inCollectionView:v18];
          }
        }
      }
    }
  }
}

- (NSMutableDictionary)playerStates
{
  return self->_playerStates;
}

- (void)setPlayerStates:(id)a3
{
}

- (int64_t)maxSelectable
{
  return self->_maxSelectable;
}

- (void)setMaxSelectable:(int64_t)a3
{
  self->_maxSelectable = a3;
}

- (BOOL)showsAllFriends
{
  return self->_showsAllFriends;
}

- (void)setShowsAllFriends:(BOOL)a3
{
  self->_showsAllFriends = a3;
}

- (int)numberOfFriendsToShowInitially
{
  return self->_numberOfFriendsToShowInitially;
}

- (void)setNumberOfFriendsToShowInitially:(int)a3
{
  self->_numberOfFriendsToShowInitially = a3;
}

- (BOOL)showingExpandedSearch
{
  return self->_showingExpandedSearch;
}

- (void)setShowingExpandedSearch:(BOOL)a3
{
  self->_showingExpandedSearch = a3;
}

- (BOOL)supportsNearby
{
  return self->_supportsNearby;
}

- (BOOL)nearbyOnly
{
  return self->_nearbyOnly;
}

- (void)setNearbyOnly:(BOOL)a3
{
  self->_nearbyOnly = a3;
}

- (GKDashboardNearbyBrowserDelegate)nearbyDelegate
{
  return self->_nearbyDelegate;
}

- (void)setNearbyDelegate:(id)a3
{
  self->_nearbyDelegate = (GKDashboardNearbyBrowserDelegate *)a3;
}

- (id)nearbyPlayersChangedHandler
{
  return self->_nearbyPlayersChangedHandler;
}

- (void)setNearbyPlayersChangedHandler:(id)a3
{
}

- (int64_t)friendSortFilterScope
{
  return self->_friendSortFilterScope;
}

- (GKDashboardMultiplayerPickerDatasourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKDashboardMultiplayerPickerDatasourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)selectedMessageGroups
{
  return self->_selectedMessageGroups;
}

- (void)setSelectedMessageGroups:(id)a3
{
}

- (NSMutableArray)contactPlayers
{
  return self->_contactPlayers;
}

- (void)setContactPlayers:(id)a3
{
}

- (NSArray)friendPlayers
{
  return self->_friendPlayers;
}

- (void)setFriendPlayers:(id)a3
{
}

- (NSArray)suggestedPlayers
{
  return self->_suggestedPlayers;
}

- (void)setSuggestedPlayers:(id)a3
{
}

- (NSMutableArray)suggestedPlayerGroups
{
  return self->_suggestedPlayerGroups;
}

- (void)setSuggestedPlayerGroups:(id)a3
{
}

- (NSMutableArray)nearbyPlayers
{
  return self->_nearbyPlayers;
}

- (void)setNearbyPlayers:(id)a3
{
}

- (NSArray)searchPlayersAndGroups
{
  return self->_searchPlayersAndGroups;
}

- (void)setSearchPlayersAndGroups:(id)a3
{
}

- (NSMutableSet)previouslyInvitedPlayers
{
  return self->_previouslyInvitedPlayers;
}

- (void)setPreviouslyInvitedPlayers:(id)a3
{
}

- (BOOL)browsingForNearbyPlayers
{
  return self->_browsingForNearbyPlayers;
}

- (BOOL)didLoad
{
  return self->_didLoad;
}

- (void)setDidLoad:(BOOL)a3
{
  self->_didLoad = a3;
}

- (BOOL)excludesContacts
{
  return self->_excludesContacts;
}

- (void)setExcludesContacts:(BOOL)a3
{
  self->_excludesContacts = a3;
}

- (int64_t)pickerOrigin
{
  return self->_pickerOrigin;
}

- (void)setPickerOrigin:(int64_t)a3
{
  self->_pickerOrigin = a3;
}

- (GKContactDataSource)contactSource
{
  return self->_contactSource;
}

- (void)setContactSource:(id)a3
{
}

- (BOOL)selectionShouldSkipDelegateResponse
{
  return self->_selectionShouldSkipDelegateResponse;
}

- (void)setSelectionShouldSkipDelegateResponse:(BOOL)a3
{
  self->_selectionShouldSkipDelegateResponse = a3;
}

- (BOOL)isShowingNearbyExpanded
{
  return self->_isShowingNearbyExpanded;
}

- (void)setIsShowingNearbyExpanded:(BOOL)a3
{
  self->_isShowingNearbyExpanded = a3;
}

- (_TtC12GameCenterUI26GKSuggestionsContainerCell)suggestionContainerCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionContainerCell);

  return (_TtC12GameCenterUI26GKSuggestionsContainerCell *)WeakRetained;
}

- (void)setSuggestionContainerCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionContainerCell);
  objc_storeStrong((id *)&self->_contactSource, 0);
  objc_storeStrong((id *)&self->_previouslyInvitedPlayers, 0);
  objc_storeStrong((id *)&self->_searchPlayersAndGroups, 0);
  objc_storeStrong((id *)&self->_nearbyPlayers, 0);
  objc_storeStrong((id *)&self->_suggestedPlayerGroups, 0);
  objc_storeStrong((id *)&self->_suggestedPlayers, 0);
  objc_storeStrong((id *)&self->_friendPlayers, 0);
  objc_storeStrong((id *)&self->_contactPlayers, 0);
  objc_storeStrong((id *)&self->_selectedMessageGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_nearbyPlayersChangedHandler, 0);

  objc_storeStrong((id *)&self->_playerStates, 0);
}

- (void)defaultFilterScopeFromPickerOrigin:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  double v6 = [v4 numberWithInteger:a3];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_1(&dword_1AF250000, v7, v8, "Previous sort preference for %@: %@.", v9, v10, v11, v12, v13);
}

- (void)setFriendSortFilterScope:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  double v6 = [v4 numberWithInteger:a3];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_1(&dword_1AF250000, v7, v8, "Remember sort preference for %@: %@.", v9, v10, v11, v12, v13);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_cold_1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 identifier];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl(&dword_1AF250000, v7, OS_LOG_TYPE_DEBUG, "DashboardMultiplayerPickerDataSource - Adding player with contact identifier: %@", a1, 0xCu);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "DashboardMultiplayerPickerDatasource - error loading contacts from _PSRecipients: %@", v2, v3, v4, v5, v6);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_137_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "Filtered the array using predicate on friendBiDirectional:%@", v2, v3, v4, v5, v6);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_137_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "Going to filter the array using predicate (== 1) on friendBiDirectional: %@", v2, v3, v4, v5, v6);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_137_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1AF250000, v0, OS_LOG_TYPE_ERROR, "Multiplayer Player Picker->loadDataWithCompletionHandler: Error in player list: %@", v1, 0xCu);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_161_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "DashboardMultiplayerPickerDatasource - error loading player groups:%@", v2, v3, v4, v5, v6);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_166_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1AF250000, v0, v1, "DashboardMultiplayerPickerDatasource - error loading player profiles:%@", v2, v3, v4, v5, v6);
}

- (void)setBrowsingForNearbyPlayers:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "nearbyDelegate is nil while setting browsing state for nearyby players", v1, 2u);
}

void __70__GKDashboardMultiplayerPickerDataSource_setNearbyPlayerID_reachable___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "Error loading nearby player (%@) with identifier: %@", (uint8_t *)&v4, 0x16u);
}

- (void)playerGroupCellForItemAtIndexPath:inCollectionView:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1AF250000, v0, OS_LOG_TYPE_ERROR, "playerGroupCellForItemAtIndexPath - Unexpected empty playerGroup at indexPath (%@)", v1, 0xCu);
}

@end