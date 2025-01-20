@interface GKLeaderboardScoreDataSource
- (BOOL)autoScrollToLocalPlayerPosition;
- (BOOL)firstLoad;
- (BOOL)hasData;
- (BOOL)isLoadingData;
- (BOOL)isLoadingNextData;
- (BOOL)isLoadingPreviousData;
- (BOOL)restrictToFriendsOnly;
- (BOOL)shouldDisplayFriendSuggestions;
- (BOOL)showingAllFriendSuggestions;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKLeaderboard)leaderboard;
- (GKLeaderboardAddFriendsCell)sizingAddFriendsCell;
- (GKLeaderboardEntry)localPlayerEntry;
- (GKLeaderboardScoreDataSource)initWithGameRecord:(id)a3 leaderboard:(id)a4;
- (GKLeaderboardScoreDelegate)leaderboardScoreDelegate;
- (NSArray)entries;
- (NSArray)suggestedFriends;
- (NSMutableSet)invitedFriendContactIdentifiers;
- (NSSet)localPlayerFriendIDs;
- (NSString)additionalNextDataLoadToken;
- (NSString)additionalPreviousDataLoadToken;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)cellSpacing;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)addInvitedFriendContactIdentifier:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)indexPathForPlayerId:(id)a3;
- (id)inviteFriendHandler;
- (id)itemForIndexPath:(id)a3;
- (id)localPlayerEntryIndexPath;
- (id)makeContextMenuForCell:(id)a3 withScore:(id)a4;
- (id)targetedPreviewForUIContextMenuConfiguration:(id)a3 inCollectionView:(id)a4;
- (int64_t)addFriendCellItem;
- (int64_t)bottomLoadingCellItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)friendCount;
- (int64_t)friendSuggestionsCount;
- (int64_t)itemCount;
- (int64_t)leaderboardOccurrence;
- (int64_t)maxRange;
- (int64_t)noFriendsCellItem;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)playerScope;
- (int64_t)startingRank;
- (int64_t)timeScope;
- (int64_t)topLoadingCellItem;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)loadInitialDataWithCompletionHandler:(id)a3;
- (void)loadMoreDataWithStartIndex:(int64_t)a3 completionHandler:(id)a4;
- (void)presentFriendInvite;
- (void)processEntries:(id)a3 localPlayerEntry:(id)a4 totalPlayerCount:(int64_t)a5 error:(id)a6 completionHandler:(id)a7;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAddFriendCellItem:(int64_t)a3;
- (void)setAdditionalNextDataLoadToken:(id)a3;
- (void)setAdditionalPreviousDataLoadToken:(id)a3;
- (void)setAutoScrollToLocalPlayerPosition:(BOOL)a3;
- (void)setBottomLoadingCellItem:(int64_t)a3;
- (void)setCollectionView:(id)a3;
- (void)setEntries:(id)a3;
- (void)setFirstLoad:(BOOL)a3;
- (void)setFriendCount:(int64_t)a3;
- (void)setInviteFriendHandler:(id)a3;
- (void)setInvitedFriendContactIdentifiers:(id)a3;
- (void)setIsLoadingData:(BOOL)a3;
- (void)setIsLoadingNextData:(BOOL)a3;
- (void)setIsLoadingPreviousData:(BOOL)a3;
- (void)setLeaderboard:(id)a3;
- (void)setLeaderboardOccurrence:(int64_t)a3;
- (void)setLeaderboardScoreDelegate:(id)a3;
- (void)setLocalPlayerEntry:(id)a3;
- (void)setLocalPlayerFriendIDs:(id)a3;
- (void)setMaxRange:(int64_t)a3;
- (void)setNoFriendsCellItem:(int64_t)a3;
- (void)setPlayerScope:(int64_t)a3;
- (void)setRestrictToFriendsOnly:(BOOL)a3;
- (void)setShouldDisplayFriendSuggestions:(BOOL)a3;
- (void)setShowingAllFriendSuggestions:(BOOL)a3;
- (void)setSizingAddFriendsCell:(id)a3;
- (void)setStartingRank:(int64_t)a3;
- (void)setSuggestedFriends:(id)a3;
- (void)setTimeScope:(int64_t)a3;
- (void)setTopLoadingCellItem:(int64_t)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKLeaderboardScoreDataSource

- (GKLeaderboardScoreDataSource)initWithGameRecord:(id)a3 leaderboard:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKLeaderboardScoreDataSource;
  v7 = [(GKGameLayerCollectionDataSource *)&v11 initWithGameRecord:a3];
  v8 = v7;
  if (v7)
  {
    [(GKLeaderboardScoreDataSource *)v7 setLeaderboard:v6];
    [(GKLeaderboardScoreDataSource *)v8 setAutoScrollToLocalPlayerPosition:1];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(GKLeaderboardScoreDataSource *)v8 setInvitedFriendContactIdentifiers:v9];
  }
  return v8;
}

- (void)setPlayerScope:(int64_t)a3
{
  id v4 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  [v4 setPlayerScope:a3];
}

- (int64_t)playerScope
{
  v2 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  int64_t v3 = [v2 playerScope];

  return v3;
}

- (void)setTimeScope:(int64_t)a3
{
  id v4 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  [v4 setTimeScope:a3];
}

- (int64_t)timeScope
{
  v2 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  int64_t v3 = [v2 timeScope];

  return v3;
}

- (void)setupCollectionView:(id)a3
{
  id v19 = a3;
  -[GKLeaderboardScoreDataSource setCollectionView:](self, "setCollectionView:");
  uint64_t v4 = +[GKLeaderboardScoreCell lowRankNib];
  v5 = +[GKLeaderboardScoreCell highRankNib];
  id v6 = +[NSObject _gkNib];
  v7 = +[NSObject _gkNib];
  v8 = +[NSObject _gkNib];
  id v9 = [v8 instantiateWithOwner:0 options:0];
  if ([v9 count])
  {
    v10 = [v9 objectAtIndexedSubscript:0];
    [(GKLeaderboardScoreDataSource *)self setSizingAddFriendsCell:v10];
  }
  objc_super v11 = objc_alloc_init(GKLeaderboardScoreFlowLayout);
  [v19 setCollectionViewLayout:v11];

  v18 = (void *)v4;
  [v19 registerNib:v4 forCellWithReuseIdentifier:@"lowRankCell"];
  [v19 registerNib:v5 forCellWithReuseIdentifier:@"highRankCell"];
  [v19 registerNib:v6 forCellWithReuseIdentifier:@"loadingCell"];
  [v19 registerNib:v7 forCellWithReuseIdentifier:@"addFriendsCell"];
  v12 = (void *)MEMORY[0x1E4FB19F8];
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v12 nibWithNibName:@"GKLeaderboardScoreCellAX_iOS" bundle:v13];
  [v19 registerNib:v14 forCellWithReuseIdentifier:@"AXCell"];

  LODWORD(v14) = GKIsXRUIIdiomShouldUsePadUI();
  [v19 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"friendSuggestionCell"];
  [v19 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"inviteFriendButtonCell"];
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4FB19F8];
    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v15 nibWithNibName:@"GKChallengeListViewSectionHeader_xrOS" bundle:v16];
  }
  else
  {
    v17 = +[NSObject _gkNib];
  }
  [v19 registerNib:v17 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"GKCollectionDataSourceHeader"];

  [v19 setDataSource:self];
  [v19 setDelegate:self];
}

- (void)processEntries:(id)a3 localPlayerEntry:(id)a4 totalPlayerCount:(int64_t)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = (void *)MEMORY[0x1E4F636D8];
  v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboardScoreDataSource.m", 268, "-[GKLeaderboardScoreDataSource processEntries:localPlayerEntry:totalPlayerCount:error:completionHandler:]");
  v18 = [v16 dispatchGroupWithName:v17];

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__5;
  v39[4] = __Block_byref_object_dispose__5;
  id v19 = v12;
  id v40 = v19;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke;
  v33[3] = &unk_1E5F654E0;
  int64_t v38 = a5;
  v33[4] = self;
  v36 = v39;
  id v20 = v13;
  id v34 = v20;
  id v21 = v14;
  id v35 = v21;
  v37 = v41;
  [v18 perform:v33];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_96;
  v32[3] = &unk_1E5F63650;
  v32[4] = self;
  [v18 perform:v32];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_100;
  v25[3] = &unk_1E5F65508;
  id v22 = v15;
  id v29 = v22;
  v30 = v41;
  id v23 = v21;
  id v26 = v23;
  v27 = self;
  v31 = v39;
  id v24 = v20;
  id v28 = v24;
  [v18 notifyOnMainQueueWithBlock:v25];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

void __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = a2;
  if ([*(id *)(a1 + 32) playerScope])
  {
    if ([*(id *)(a1 + 32) restrictToFriendsOnly])
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      v15[3] = 1;
      uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      objc_super v11 = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_2;
      id v12 = &unk_1E5F654B8;
      id v14 = v15;
      id v13 = *(id *)(a1 + 40);
      uint64_t v5 = [v4 _gkFilterWithBlock:&v9];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      _Block_object_dispose(v15, 8);
    }
    uint64_t v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count", v9, v10, v11, v12);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 72);
  }
  [*(id *)(a1 + 32) setMaxRange:v8];
  [*(id *)(a1 + 32) setLocalPlayerEntry:*(void *)(a1 + 40)];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) || !*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setEntries:");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  v3[2](v3);
}

id __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 player];
  int v5 = [v4 isLocalPlayer];

  uint64_t v6 = [v3 player];
  v7 = [v6 friendBiDirectional];
  char v8 = [v7 isEqualToNumber:&unk_1F0811F70];

  if ((v8 & 1) != 0 || v5)
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    objc_super v11 = [v3 internal];
    [v11 setRank:v10];

    if (v5)
    {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v13 = [*(id *)(a1 + 32) internal];
      [v13 setRank:v12];
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v9 = v3;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_2_98;
  v5[3] = &unk_1E5F63300;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  +[GameCenterObjcHelper fetchSuggestedFriendsWithCompletionHandler:v5];
}

void __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_2_98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    char v8 = *MEMORY[0x1E4F63858];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63858], OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1AF250000, v8, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: Unable to fetch suggested friends: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [*(id *)(a1 + 32) setSuggestedFriends:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_100(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(a1 + 32));
    [*(id *)(a1 + 40) setIsLoadingData:0];
    objc_msgSend(*(id *)(a1 + 40), "setShouldDisplayFriendSuggestions:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "count") == 0);
    id v3 = [*(id *)(a1 + 40) leaderboardScoreDelegate];

    if (v3)
    {
      if ([*(id *)(a1 + 40) playerScope]
        || ![*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
      {
        id v9 = 0;
      }
      else
      {
        id v9 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:0];
      }
      if ([*(id *)(a1 + 48) rank] >= 1
        && (unint64_t v4 = [*(id *)(a1 + 48) rank],
            v4 <= [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count]))
      {
        if ([*(id *)(a1 + 48) rank] < 2)
        {
          id v5 = 0;
        }
        else
        {
          id v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "rank") - 2);
        }
        unint64_t v6 = [*(id *)(a1 + 48) rank];
        if (v6 >= [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
        {
          id v7 = 0;
        }
        else
        {
          id v7 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "rank"));
        }
        char v8 = [*(id *)(a1 + 40) leaderboardScoreDelegate];
        objc_msgSend(v8, "didLoadScoresWithLocalPlayerEntry:topPlayer:playerAbove:playerBelow:totalEntries:", *(void *)(a1 + 48), v9, v5, v7, objc_msgSend(*(id *)(a1 + 40), "maxRange"));
      }
      else
      {
        id v5 = [*(id *)(a1 + 40) leaderboardScoreDelegate];
        objc_msgSend(v5, "didLoadScoresWithLocalPlayerEntry:topPlayer:playerAbove:playerBelow:totalEntries:", *(void *)(a1 + 48), v9, 0, 0, objc_msgSend(*(id *)(a1 + 40), "maxRange"));
      }
    }
  }
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F63760] local];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GKLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5F63300;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 loadFriendsAsPlayersWithCompletionHandler:v7];
}

void __62__GKLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v6 = (id)GKOSLoggers();
    }
    id v7 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __62__GKLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke_cold_1((uint64_t)v5, v7);
    }
  }
  id v26 = v5;
  id v8 = objc_opt_new();
  [*(id *)(a1 + 32) setFriendCount:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0x1E4F63000uLL;
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v15 = NSString;
          v16 = [NSString stringWithFormat:@"expected GKPlayer, got %@", v14];
          [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardScoreDataSource.m"];
          v18 = unint64_t v17 = v11;
          id v19 = [v18 lastPathComponent];
          id v20 = [v15 stringWithFormat:@"%@ ([player isKindOfClass:[GKPlayer class]])\n[%s (%s:%d)]", v16, "-[GKLeaderboardScoreDataSource loadDataWithCompletionHandler:]_block_invoke", objc_msgSend(v19, "UTF8String"), 348];

          unint64_t v11 = v17;
          [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v20 format];
        }
        id v21 = [v14 friendBiDirectional];
        int v22 = [v21 BOOLValue];

        if (v22) {
          objc_msgSend(*(id *)(a1 + 32), "setFriendCount:", objc_msgSend(*(id *)(a1 + 32), "friendCount") + 1);
        }
        id v23 = [v14 internal];
        id v24 = [v23 playerID];
        [v8 addObject:v24];

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  [*(id *)(a1 + 32) setLocalPlayerFriendIDs:v25];

  [*(id *)(a1 + 32) loadInitialDataWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)loadInitialDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(GKLeaderboardScoreDataSource *)self setFirstLoad:1];
  [(GKLeaderboardScoreDataSource *)self setIsLoadingData:1];
  [(GKLeaderboardScoreDataSource *)self setIsLoadingNextData:0];
  [(GKLeaderboardScoreDataSource *)self setIsLoadingPreviousData:0];
  [(GKLeaderboardScoreDataSource *)self setAdditionalNextDataLoadToken:0];
  [(GKLeaderboardScoreDataSource *)self setAdditionalPreviousDataLoadToken:0];
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3010000000;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  v33 = &unk_1AF895502;
  id v5 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  uint64_t v6 = [v5 playerScope];

  id v7 = v31;
  uint64_t v8 = 100;
  if (v6 == 1) {
    uint64_t v8 = 600;
  }
  v31[4] = 1;
  void v7[5] = v8;
  [(GKLeaderboardScoreDataSource *)self setStartingRank:1];
  uint64_t v9 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  uint64_t v10 = [v9 playerScope];

  unint64_t v11 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  uint64_t v12 = [v11 timeScope];

  uint64_t v13 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  int v22 = [v13 identifier];

  id v14 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  id v15 = [(GKGameLayerCollectionDataSource *)self gameRecord];
  v16 = [v15 gameDescriptor];
  int64_t v17 = [(GKLeaderboardScoreDataSource *)self playerScope];
  int64_t v18 = [(GKLeaderboardScoreDataSource *)self timeScope];
  id v19 = v31;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__GKLeaderboardScoreDataSource_loadInitialDataWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E5F65558;
  uint64_t v27 = v10;
  uint64_t v28 = v12;
  v23[4] = self;
  id v20 = v22;
  id v24 = v20;
  id v21 = v4;
  id v25 = v21;
  id v26 = &v30;
  uint64_t v29 = 1;
  objc_msgSend(v14, "loadEntriesWithGameDescriptor:fetchOptions:playerScope:timeScope:range:completionHandler:", v16, 1, v17, v18, v19[4], v19[5], v23);

  _Block_object_dispose(&v30, 8);
}

void __69__GKLeaderboardScoreDataSource_loadInitialDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = [*(id *)(a1 + 32) leaderboard];
  if (v12 != [v13 playerScope]) {
    goto LABEL_9;
  }
  uint64_t v14 = *(void *)(a1 + 72);
  id v15 = [*(id *)(a1 + 32) leaderboard];
  if (v14 != [v15 timeScope])
  {

LABEL_9:
    goto LABEL_10;
  }
  v16 = *(void **)(a1 + 40);
  int64_t v17 = [*(id *)(a1 + 32) leaderboard];
  int64_t v18 = [v17 identifier];
  LOBYTE(v16) = [v16 isEqualToString:v18];

  if ((v16 & 1) == 0)
  {
LABEL_10:
    [*(id *)(a1 + 32) loadInitialDataWithCompletionHandler:*(void *)(a1 + 48)];
    goto LABEL_11;
  }
  int v19 = [*(id *)(a1 + 32) autoScrollToLocalPlayerPosition];
  if (v9
    && v19
    && (unint64_t)[v9 rank] > *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
                                                  + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = (100 * ([v9 rank] / 100)) | 1;
    [*(id *)(a1 + 32) setStartingRank:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32)];
    id v20 = [*(id *)(a1 + 32) leaderboard];
    id v21 = [*(id *)(a1 + 32) gameRecord];
    int v22 = [v21 gameDescriptor];
    uint64_t v27 = *(void *)(a1 + 80);
    uint64_t v26 = [*(id *)(a1 + 32) playerScope];
    uint64_t v23 = [*(id *)(a1 + 32) timeScope];
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__GKLeaderboardScoreDataSource_loadInitialDataWithCompletionHandler___block_invoke_2;
    v28[3] = &unk_1E5F65530;
    id v25 = *(void **)(a1 + 40);
    v28[4] = *(void *)(a1 + 32);
    long long v31 = *(_OWORD *)(a1 + 64);
    id v29 = v25;
    id v30 = *(id *)(a1 + 48);
    objc_msgSend(v20, "loadEntriesWithGameDescriptor:fetchOptions:playerScope:timeScope:range:completionHandler:", v22, v27, v26, v23, *(void *)(v24 + 32), *(void *)(v24 + 40), v28);
  }
  else
  {
    [*(id *)(a1 + 32) processEntries:v10 localPlayerEntry:v9 totalPlayerCount:a4 error:v11 completionHandler:*(void *)(a1 + 48)];
  }
LABEL_11:
}

void __69__GKLeaderboardScoreDataSource_loadInitialDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v18 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = [*(id *)(a1 + 32) leaderboard];
  if (v11 != [v12 playerScope]) {
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = [*(id *)(a1 + 32) leaderboard];
  if (v13 != [v14 timeScope])
  {

LABEL_6:
    goto LABEL_7;
  }
  id v15 = *(void **)(a1 + 40);
  v16 = [*(id *)(a1 + 32) leaderboard];
  int64_t v17 = [v16 identifier];
  LOBYTE(v15) = [v15 isEqualToString:v17];

  if (v15)
  {
    [*(id *)(a1 + 32) processEntries:v9 localPlayerEntry:v18 totalPlayerCount:a4 error:v10 completionHandler:*(void *)(a1 + 48)];
    goto LABEL_8;
  }
LABEL_7:
  [*(id *)(a1 + 32) loadInitialDataWithCompletionHandler:*(void *)(a1 + 48)];
LABEL_8:
}

- (void)loadMoreDataWithStartIndex:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(GKLeaderboardScoreDataSource *)self leaderboard];
  uint64_t v8 = [(GKGameLayerCollectionDataSource *)self gameRecord];
  id v9 = [v8 gameDescriptor];
  int64_t v10 = [(GKLeaderboardScoreDataSource *)self playerScope];
  int64_t v11 = [(GKLeaderboardScoreDataSource *)self timeScope];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__GKLeaderboardScoreDataSource_loadMoreDataWithStartIndex_completionHandler___block_invoke;
  v13[3] = &unk_1E5F65580;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  objc_msgSend(v7, "loadEntriesWithGameDescriptor:fetchOptions:playerScope:timeScope:range:completionHandler:", v9, 1, v10, v11, a3, 100, v13);
}

void __77__GKLeaderboardScoreDataSource_loadMoreDataWithStartIndex_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v12 = a3;
  id v9 = a5;
  [*(id *)(a1 + 32) setLocalPlayerEntry:a2];
  if (![*(id *)(a1 + 32) playerScope]) {
    [*(id *)(a1 + 32) setMaxRange:a4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int64_t v10 = [*(id *)(a1 + 32) leaderboardScoreDelegate];

  if (v10)
  {
    int64_t v11 = [*(id *)(a1 + 32) leaderboardScoreDelegate];
    objc_msgSend(v11, "didLoadAdditionalScoresWithUpdatedTotalEntries:", objc_msgSend(*(id *)(a1 + 32), "maxRange"));
  }
}

- (id)localPlayerEntryIndexPath
{
  id v3 = [(GKLeaderboardScoreDataSource *)self localPlayerEntry];
  uint64_t v4 = [v3 rank];

  if (v4 < 1)
  {
    id v9 = 0;
  }
  else
  {
    id v5 = [(GKLeaderboardScoreDataSource *)self localPlayerEntry];
    uint64_t v6 = [v5 rank];
    uint64_t v7 = v6 - [(GKLeaderboardScoreDataSource *)self startingRank];
    if ([(GKLeaderboardScoreDataSource *)self startingRank] <= 1) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v7 + 1;
    }

    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:0];
  }

  return v9;
}

- (id)indexPathForPlayerId:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(GKLeaderboardScoreDataSource *)self entries];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v20 = self;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        int64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int64_t v11 = [v10 player];
        id v12 = [v11 internal];
        uint64_t v13 = [v12 playerID];
        char v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          uint64_t v16 = [v10 rank];
          uint64_t v17 = v16 - [(GKLeaderboardScoreDataSource *)v20 startingRank];
          if ([(GKLeaderboardScoreDataSource *)v20 startingRank] <= 1) {
            uint64_t v18 = v17;
          }
          else {
            uint64_t v18 = v17 + 1;
          }
          id v15 = [MEMORY[0x1E4F28D58] indexPathForItem:v18 inSection:0];
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_14:

  return v15;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(GKLeaderboardScoreDataSource *)self isLoadingData]) {
    goto LABEL_15;
  }
  uint64_t v11 = [(GKLeaderboardScoreDataSource *)self localPlayerEntryIndexPath];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = [(GKLeaderboardScoreDataSource *)self localPlayerEntryIndexPath];
    uint64_t v14 = [v13 compare:v10];

    if (!v14)
    {
      id v15 = [(GKLeaderboardScoreDataSource *)self leaderboardScoreDelegate];
      [v15 setPreferredFocusCell:v9];
    }
  }
  if (![(GKLeaderboardScoreDataSource *)self isLoadingNextData])
  {
    int64_t v16 = [(GKLeaderboardScoreDataSource *)self startingRank];
    id v17 = [(GKLeaderboardScoreDataSource *)self entries];
    unint64_t v18 = v16 + [v17 count] - 1;
    if (v18 >= [(GKLeaderboardScoreDataSource *)self maxRange])
    {
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v19 = [v10 item];
    int64_t v20 = [(GKLeaderboardScoreDataSource *)self bottomLoadingCellItem] - 25;

    if (v19 >= v20)
    {
      [(GKLeaderboardScoreDataSource *)self setIsLoadingNextData:1];
      long long v21 = [MEMORY[0x1E4F29128] UUID];
      long long v22 = [v21 UUIDString];
      [(GKLeaderboardScoreDataSource *)self setAdditionalNextDataLoadToken:v22];

      long long v23 = [(GKLeaderboardScoreDataSource *)self additionalNextDataLoadToken];
      int64_t v24 = [(GKLeaderboardScoreDataSource *)self startingRank];
      id v25 = [(GKLeaderboardScoreDataSource *)self entries];
      uint64_t v26 = [v25 count] + v24;

      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
      void v41[3] = &unk_1E5F655D0;
      id v42 = v23;
      v43 = self;
      id v44 = v8;
      id v45 = v10;
      id v17 = v23;
      [(GKLeaderboardScoreDataSource *)self loadMoreDataWithStartIndex:v26 completionHandler:v41];

      goto LABEL_9;
    }
  }
LABEL_10:
  if (![(GKLeaderboardScoreDataSource *)self isLoadingPreviousData]
    && [(GKLeaderboardScoreDataSource *)self startingRank] >= 2)
  {
    uint64_t v27 = [v10 item];
    if (v27 >= [(GKLeaderboardScoreDataSource *)self topLoadingCellItem])
    {
      int64_t v28 = [v10 item];
      if (v28 <= [(GKLeaderboardScoreDataSource *)self topLoadingCellItem] + 25)
      {
        [(GKLeaderboardScoreDataSource *)self setIsLoadingPreviousData:1];
        id v29 = [MEMORY[0x1E4F29128] UUID];
        id v30 = [v29 UUIDString];
        [(GKLeaderboardScoreDataSource *)self setAdditionalPreviousDataLoadToken:v30];

        long long v31 = [(GKLeaderboardScoreDataSource *)self additionalPreviousDataLoadToken];
        int64_t v32 = [(GKLeaderboardScoreDataSource *)self startingRank];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_126;
        v35[3] = &unk_1E5F65620;
        int64_t v33 = v32 - 100;
        id v36 = v31;
        v37 = self;
        int64_t v40 = v32 - 100;
        id v38 = v8;
        id v39 = v10;
        id v34 = v31;
        [(GKLeaderboardScoreDataSource *)self loadMoreDataWithStartIndex:v33 completionHandler:v35];
      }
    }
  }
LABEL_15:
}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) additionalNextDataLoadToken];
    LODWORD(v4) = [v4 isEqualToString:v5];

    if (v4)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_2;
      v8[3] = &unk_1E5F655A8;
      uint64_t v6 = *(void **)(a1 + 48);
      v8[4] = *(void *)(a1 + 40);
      id v9 = v3;
      id v10 = *(id *)(a1 + 56);
      id v11 = *(id *)(a1 + 48);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_124;
      v7[3] = &unk_1E5F63198;
      v7[4] = *(void *)(a1 + 40);
      [v6 performBatchUpdates:v8 completion:v7];
    }
  }
}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (NSObject **)MEMORY[0x1E4F63860];
  id v3 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v4 = (id)GKOSLoggers();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v3;
    uint64_t v7 = [v5 entries];
    int v28 = 134217984;
    uint64_t v29 = [v7 count];
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update after fetching more data, previous entry count: %ld", (uint8_t *)&v28, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) entries];
  uint64_t v9 = [v8 count];

  id v10 = [*(id *)(a1 + 32) entries];
  id v11 = [v10 arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setEntries:v11];

  id v12 = *v2;
  if (!*v2)
  {
    id v13 = (id)GKOSLoggers();
    id v12 = *v2;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void **)(a1 + 32);
    id v15 = v12;
    int64_t v16 = [v14 entries];
    uint64_t v17 = [v16 count];
    int v28 = 134217984;
    uint64_t v29 = v17;
    _os_log_impl(&dword_1AF250000, v15, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update after fetching more data, updated entry count: %ld", (uint8_t *)&v28, 0xCu);
  }
  unint64_t v18 = [*(id *)(a1 + 32) entries];
  uint64_t v19 = [v18 count] - v9;

  int64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v19];
  uint64_t v21 = [*(id *)(a1 + 32) startingRank];
  long long v22 = [*(id *)(a1 + 32) entries];
  uint64_t v23 = v21 + [v22 count] - 1;
  if (v23 == [*(id *)(a1 + 32) maxRange])
  {
    uint64_t v24 = [*(id *)(a1 + 32) bottomLoadingCellItem] != -1;

    v19 -= v24;
  }
  else
  {
  }
  if (v19 >= 1)
  {
    do
    {
      if ([*(id *)(a1 + 32) startingRank] <= 1) {
        uint64_t v25 = v9;
      }
      else {
        uint64_t v25 = v9 + 1;
      }
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v25, objc_msgSend(*(id *)(a1 + 48), "section"));
      [v20 addObject:v26];

      ++v9;
      --v19;
    }
    while (v19);
  }
  uint64_t v27 = [*(id *)(a1 + 56) collectionViewLayout];
  [v27 setIsInsertingItemsAbove:0];

  [*(id *)(a1 + 56) insertItemsAtIndexPaths:v20];
  [*(id *)(a1 + 32) setIsLoadingNextData:0];
}

uint64_t __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_124(uint64_t a1)
{
  uint64_t v2 = (NSObject **)MEMORY[0x1E4F63860];
  id v3 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v4 = (id)GKOSLoggers();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1AF250000, v3, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update completed for load more action.", v6, 2u);
  }
  return [*(id *)(a1 + 32) setFirstLoad:0];
}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) additionalPreviousDataLoadToken];
    LODWORD(v4) = [v4 isEqualToString:v5];

    if (v4)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      uint64_t v6 = [*(id *)(a1 + 40) entries];
      uint64_t v7 = [v6 count];

      [*(id *)(a1 + 40) setStartingRank:*(void *)(a1 + 64)];
      id v8 = [*(id *)(a1 + 48) collectionViewLayout];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_2_128;
      v15[3] = &unk_1E5F655F8;
      uint64_t v9 = *(void **)(a1 + 48);
      void v15[4] = *(void *)(a1 + 40);
      id v16 = v3;
      uint64_t v20 = v7;
      id v17 = *(id *)(a1 + 56);
      id v18 = v8;
      id v19 = *(id *)(a1 + 48);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_129;
      v12[3] = &unk_1E5F643B0;
      id v10 = *(void **)(a1 + 48);
      v12[4] = *(void *)(a1 + 40);
      id v13 = v18;
      id v14 = v10;
      id v11 = v18;
      [v9 performBatchUpdates:v15 completion:v12];
    }
  }
}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_2_128(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (NSObject **)MEMORY[0x1E4F63860];
  id v3 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v4 = (id)GKOSLoggers();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v3;
    uint64_t v7 = [v5 entries];
    int v22 = 134217984;
    uint64_t v23 = [v7 count];
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update after fetching previous data, previous entry count: %ld", (uint8_t *)&v22, 0xCu);
  }
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 32) entries];
  id v10 = [v8 arrayByAddingObjectsFromArray:v9];
  [*(id *)(a1 + 32) setEntries:v10];

  id v11 = *v2;
  if (!*v2)
  {
    id v12 = (id)GKOSLoggers();
    id v11 = *v2;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = v11;
    id v15 = [v13 entries];
    uint64_t v16 = [v15 count];
    int v22 = 134217984;
    uint64_t v23 = v16;
    _os_log_impl(&dword_1AF250000, v14, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update after fetching previous data, updated entry count: %ld", (uint8_t *)&v22, 0xCu);
  }
  id v17 = [*(id *)(a1 + 32) entries];
  uint64_t v18 = [v17 count] - *(void *)(a1 + 72);

  id v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
  if ([*(id *)(a1 + 32) startingRank] == 1) {
    v18 -= [*(id *)(a1 + 32) topLoadingCellItem] != -1;
  }
  if (v18 >= 1)
  {
    uint64_t v20 = 0;
    do
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", ++v20, objc_msgSend(*(id *)(a1 + 48), "section"));
      [v19 addObject:v21];
    }
    while (v18 != v20);
  }
  [*(id *)(a1 + 56) setIsInsertingItemsAbove:1];
  [*(id *)(a1 + 56) collectionViewContentSize];
  objc_msgSend(*(id *)(a1 + 56), "setContentSizeBeforeInsertingItemsAbove:");
  [*(id *)(a1 + 64) insertItemsAtIndexPaths:v19];
}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_129(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (NSObject **)MEMORY[0x1E4F63860];
  id v3 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v4 = (id)GKOSLoggers();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1AF250000, v3, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update completed for load previous data.", v9, 2u);
  }
  [*(id *)(a1 + 32) setIsLoadingPreviousData:0];
  [*(id *)(a1 + 40) setIsInsertingItemsAbove:0];
  [*(id *)(a1 + 32) setFirstLoad:0];
  [MEMORY[0x1E4F39CF8] commit];
  if ([*(id *)(a1 + 32) firstLoad])
  {
    id v5 = [*(id *)(a1 + 32) localPlayerEntryIndexPath];

    if (v5)
    {
      uint64_t v6 = *(void **)(a1 + 48);
      uint64_t v7 = [*(id *)(a1 + 32) localPlayerEntryIndexPath];
      v10[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [v6 reloadItemsAtIndexPaths:v8];
    }
  }
}

- (int64_t)itemCount
{
  [(GKLeaderboardScoreDataSource *)self setTopLoadingCellItem:-1];
  [(GKLeaderboardScoreDataSource *)self setBottomLoadingCellItem:-1];
  [(GKLeaderboardScoreDataSource *)self setAddFriendCellItem:-1];
  [(GKLeaderboardScoreDataSource *)self setNoFriendsCellItem:-1];
  id v3 = [(GKLeaderboardScoreDataSource *)self entries];
  int64_t v4 = [v3 count];

  if (v4 < 1)
  {
    [(GKLeaderboardScoreDataSource *)self setNoFriendsCellItem:0];
    return 1;
  }
  else
  {
    if ([(GKLeaderboardScoreDataSource *)self startingRank] >= 2)
    {
      [(GKLeaderboardScoreDataSource *)self setTopLoadingCellItem:0];
      ++v4;
    }
    int64_t v5 = [(GKLeaderboardScoreDataSource *)self startingRank] + v4;
    if (v5 < [(GKLeaderboardScoreDataSource *)self maxRange])
    {
      [(GKLeaderboardScoreDataSource *)self setBottomLoadingCellItem:v4];
      return ++v4;
    }
    if ([(GKLeaderboardScoreDataSource *)self restrictToFriendsOnly])
    {
      [(GKLeaderboardScoreDataSource *)self setAddFriendCellItem:v4];
      return ++v4;
    }
  }
  return v4;
}

- (int64_t)friendSuggestionsCount
{
  BOOL showingAllFriendSuggestions = self->_showingAllFriendSuggestions;
  id v3 = [(GKLeaderboardScoreDataSource *)self suggestedFriends];
  unint64_t v4 = [v3 count];

  int64_t v5 = 3;
  if (v4 < 3) {
    int64_t v5 = v4;
  }
  if (showingAllFriendSuggestions) {
    return v4;
  }
  else {
    return v5;
  }
}

- (BOOL)hasData
{
  uint64_t v2 = [(GKLeaderboardScoreDataSource *)self entries];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(GKLeaderboardScoreDataSource *)self topLoadingCellItem] != -1;
  uint64_t v6 = [v4 item];

  uint64_t v7 = v6 - v5;
  if (v7 < 0)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = [(GKLeaderboardScoreDataSource *)self entries];
    if (v7 >= (unint64_t)[v8 count])
    {
      id v10 = 0;
    }
    else
    {
      uint64_t v9 = [(GKLeaderboardScoreDataSource *)self entries];
      id v10 = [v9 objectAtIndexedSubscript:v7];
    }
  }

  return v10;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 section])
  {
    if ([v8 section] == 1)
    {
      [v7 bounds];
      +[GKDashboardFriendSuggestionCollectionViewCell sizeWithFitting:in:](_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell, "sizeWithFitting:in:", v7, v9, 0.0);
      double v11 = v10;
      double v13 = v12;
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DB30];
      double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    goto LABEL_27;
  }
  [v7 frame];
  double v11 = v14;
  int64_t v15 = [(GKLeaderboardScoreDataSource *)self noFriendsCellItem];
  uint64_t v16 = [v8 item];
  int64_t v17 = [(GKLeaderboardScoreDataSource *)self addFriendCellItem];
  uint64_t v18 = [v8 item];
  id v19 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  uint64_t v20 = [v19 preferredContentSizeCategory];

  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v20))
  {
    if ([v20 isEqualToString:*MEMORY[0x1E4FB27B0]])
    {
      double v13 = 72.0;
      goto LABEL_19;
    }
    BOOL v21 = [v20 isEqualToString:*MEMORY[0x1E4FB27B8]] == 0;
    double v22 = 60.0;
    double v23 = 72.0;
LABEL_16:
    if (v21) {
      double v13 = v22;
    }
    else {
      double v13 = v23;
    }
    goto LABEL_19;
  }
  if ([v20 isEqualToString:*MEMORY[0x1E4FB2778]])
  {
    double v13 = 264.0;
    goto LABEL_19;
  }
  if ([v20 isEqualToString:*MEMORY[0x1E4FB2780]])
  {
    double v13 = 234.0;
    goto LABEL_19;
  }
  if (([v20 isEqualToString:*MEMORY[0x1E4FB2788]] & 1) == 0)
  {
    BOOL v21 = [v20 isEqualToString:*MEMORY[0x1E4FB2790]] == 0;
    double v22 = 144.0;
    double v23 = 174.0;
    goto LABEL_16;
  }
  double v13 = 204.0;
LABEL_19:
  if (v15 == v16 || v17 == v18)
  {
    uint64_t v24 = [(GKLeaderboardScoreDataSource *)self sizingAddFriendsCell];
    uint64_t v25 = v24;
    if (v15 == v16) {
      [v24 configureNoFriendsViewWithHandler:&__block_literal_global_29];
    }
    else {
      [v24 configureAddFriendsLockupWithMetricsPageId:&stru_1F07B2408 handler:&__block_literal_global_136];
    }

    uint64_t v26 = [(GKLeaderboardScoreDataSource *)self sizingAddFriendsCell];
    objc_msgSend(v26, "preferredLayoutSizeFittingSize:", v11, 1.79769313e308);
    double v28 = v27;

    if (v13 < v28) {
      double v13 = v28;
    }
  }

LABEL_27:
  double v29 = v11;
  double v30 = v13;
  result.height = v30;
  result.width = v29;
  return result;
}

- (double)cellSpacing
{
  return 0.0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = objc_msgSend(&unk_1F08126E8, "mutableCopy", a3);
  if ([(GKLeaderboardScoreDataSource *)self shouldDisplayFriendSuggestions]) {
    [v4 addObject:&unk_1F0811FA0];
  }
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    int64_t v7 = [(GKLeaderboardScoreDataSource *)self friendSuggestionsCount] + 1;
  }
  else if (a4)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [(GKLeaderboardScoreDataSource *)self itemCount];
  }

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x1E4FB2770];
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]] && objc_msgSend(v10, "section") == 1)
  {
    double v12 = [v8 dequeueReusableSupplementaryViewOfKind:v11 withReuseIdentifier:@"GKCollectionDataSourceHeader" forIndexPath:v10];
    GKIsXRUIIdiomShouldUsePadUI();
    double v13 = GKGameCenterUIFrameworkBundle();
    double v14 = GKGetLocalizedStringFromTableInBundle();
    int64_t v15 = [v12 titleLabel];
    [v15 setText:v14];

    uint64_t v16 = [v12 leadingConstraint];
    [v16 setConstant:12.0];

    int64_t v17 = [v12 trailingConstraint];
    [v17 setConstant:12.0];

    uint64_t v18 = [(GKLeaderboardScoreDataSource *)self suggestedFriends];
    unint64_t v19 = [v18 count];

    if (v19 < 4)
    {
      uint64_t v26 = [v12 secondaryLabel];
      [v26 setText:0];

      double v23 = [v12 secondaryLabel];
      uint64_t v24 = v23;
      uint64_t v25 = 1;
    }
    else
    {
      [(GKLeaderboardScoreDataSource *)self showingAllFriendSuggestions];
      uint64_t v20 = GKGameCenterUIFrameworkBundle();
      BOOL v21 = GKGetLocalizedStringFromTableInBundle();
      double v22 = [v12 secondaryLabel];
      [v22 setText:v21];

      double v23 = [v12 secondaryLabel];
      uint64_t v24 = v23;
      uint64_t v25 = 0;
    }
    [v23 setHidden:v25];

    double v27 = [v12 secondaryLabel];
    [v27 setUserInteractionEnabled:1];

    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __93__GKLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
    v29[3] = &unk_1E5F65648;
    objc_copyWeak(&v33, &location);
    id v30 = v8;
    id v31 = v10;
    int64_t v32 = self;
    [v12 setSecondaryLabelTapHandler:v29];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

void __93__GKLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [WeakRetained showingAllFriendSuggestions] ^ 1;
  id v5 = objc_loadWeakRetained(v2);
  [v5 setShowingAllFriendSuggestions:v4];

  id v6 = *(void **)(a1 + 32);
  int64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v6 reloadSections:v7];

  id v8 = [*(id *)(a1 + 48) leaderboardScoreDelegate];
  [v8 didExpandOrContractFriendSuggestions];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    uint64_t v10 = [v7 item];
    if (v10 == [(GKLeaderboardScoreDataSource *)self bottomLoadingCellItem]
      || (uint64_t v11 = [v7 item],
          v11 == [(GKLeaderboardScoreDataSource *)self topLoadingCellItem]))
    {
      id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"loadingCell" forIndexPath:v7];
      double v12 = [v9 activityIndicator];
      [v12 startAnimating];

      goto LABEL_25;
    }
    uint64_t v13 = [v7 item];
    if (v13 == [(GKLeaderboardScoreDataSource *)self addFriendCellItem]
      || (uint64_t v14 = [v7 item],
          v14 == [(GKLeaderboardScoreDataSource *)self noFriendsCellItem]))
    {
      id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"addFriendsCell" forIndexPath:v7];
      objc_msgSend(v9, "setFriendCount:", -[GKLeaderboardScoreDataSource friendCount](self, "friendCount"));
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke;
      aBlock[3] = &unk_1E5F634E8;
      objc_copyWeak(&v52, &location);
      int64_t v15 = _Block_copy(aBlock);
      uint64_t v16 = [v7 item];
      if (v16 == [(GKLeaderboardScoreDataSource *)self addFriendCellItem])
      {
        int64_t v17 = [(GKLeaderboardScoreDataSource *)self leaderboard];
        uint64_t v18 = [v17 baseLeaderboardID];
        [v9 configureAddFriendsLockupWithMetricsPageId:v18 handler:v15];
      }
      else
      {
        [v9 configureNoFriendsViewWithHandler:v15];
      }
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v7, "item") - 1, objc_msgSend(v7, "section"));
      uint64_t v26 = [(GKLeaderboardScoreDataSource *)self itemForIndexPath:v25];
      uint64_t v27 = [v7 item];
      BOOL v30 = 0;
      if (v27 != [(GKLeaderboardScoreDataSource *)self noFriendsCellItem])
      {
        if (!v26
          || ([v26 player],
              double v28 = objc_claimAutoreleasedReturnValue(),
              int v29 = [v28 isLocalPlayer],
              v28,
              !v29))
        {
          BOOL v30 = 1;
        }
      }
      [v9 setLineVisible:v30];

      objc_destroyWeak(&v52);
      objc_destroyWeak(&location);
      goto LABEL_25;
    }
    BOOL v21 = [(GKLeaderboardScoreDataSource *)self itemForIndexPath:v7];
    uint64_t v32 = [v21 rank];
    id v33 = @"lowRankCell";
    if (v32 > 99) {
      id v33 = @"highRankCell";
    }
    id v34 = v33;
    uint64_t v35 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    id v36 = [v35 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v36);

    if (IsAccessibilityCategory)
    {

      id v34 = @"AXCell";
    }
    id v9 = [v6 dequeueReusableCellWithReuseIdentifier:v34 forIndexPath:v7];
    id v38 = [(GKGameLayerCollectionDataSource *)self presentationViewController];
    [v9 setDelegate:v38];

    if (v21) {
      [v9 setEntry:v21];
    }
    if ([v7 item] <= 0)
    {
      [v9 setLineVisible:0];
LABEL_44:
      id v44 = [(GKLeaderboardScoreDataSource *)self localPlayerFriendIDs];
      id v45 = [v21 player];
      v46 = [v45 internal];
      v47 = [v46 playerID];
      objc_msgSend(v9, "setShouldShowContextMenu:", objc_msgSend(v44, "containsObject:", v47));

      goto LABEL_17;
    }
    id v39 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v7, "item") - 1, objc_msgSend(v7, "section"));
    int64_t v40 = [(GKLeaderboardScoreDataSource *)self itemForIndexPath:v39];
    v41 = [v21 player];
    if ([v41 isLocalPlayer])
    {

LABEL_40:
      uint64_t v43 = 0;
LABEL_43:
      [v9 setLineVisible:v43];

      goto LABEL_44;
    }
    if (v40)
    {
      id v42 = [v40 player];
      char v48 = [v42 isLocalPlayer];

      if (v48) {
        goto LABEL_40;
      }
    }
    else
    {
    }
    uint64_t v43 = 1;
    goto LABEL_43;
  }
  if ([v7 section] != 1)
  {
    id v9 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = [v7 item];
  if (v8 >= [(GKLeaderboardScoreDataSource *)self friendSuggestionsCount])
  {
    id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"inviteFriendButtonCell" forIndexPath:v7];
    [v9 setDisplayBackground:0];
    [v9 setWantsAdditionalHorizontalPadding:0];
    goto LABEL_25;
  }
  id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"friendSuggestionCell" forIndexPath:v7];
  [v9 setDisplayBackground:0];
  [v9 setWantsAdditionalHorizontalPadding:0];
  if (*MEMORY[0x1E4F63830]) {
    [MEMORY[0x1E4FB1618] systemWhiteColor];
  }
  else {
  unint64_t v19 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  [v9 setInviteButtonTitleColor:v19];

  uint64_t v20 = [(GKLeaderboardScoreDataSource *)self suggestedFriends];
  BOOL v21 = objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v7, "item"));

  double v22 = [(GKLeaderboardScoreDataSource *)self invitedFriendContactIdentifiers];
  double v23 = [v21 contact];
  uint64_t v24 = [v23 identifier];
  objc_msgSend(v9, "applyWithSuggestedFriend:previouslyInvited:", v21, objc_msgSend(v22, "containsObject:", v24));

  objc_initWeak(&location, self);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v49[3] = &unk_1E5F636C8;
  objc_copyWeak(&v50, &location);
  [v9 setTapHandler:v49];
  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);
LABEL_17:

LABEL_25:

  return v9;
}

void __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v2 = [MEMORY[0x1E4F637E8] shared];
    int v3 = [v2 isAddingFriendsRestricted];

    objc_copyWeak(&to, (id *)(a1 + 32));
    if (v3)
    {
      uint64_t v4 = (void *)MEMORY[0x1E4FB1418];
      id v5 = GKGameCenterUIFrameworkBundle();
      id v6 = GKGetLocalizedStringFromTableInBundle();
      id v7 = GKGameCenterUIFrameworkBundle();
      uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
      id v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

      uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v11 = GKGameCenterUIFrameworkBundle();
      double v12 = GKGetLocalizedStringFromTableInBundle();
      uint64_t v13 = [v10 actionWithTitle:v12 style:0 handler:0];
      [v9 addAction:v13];
    }
    else
    {
      uint64_t v11 = objc_loadWeakRetained(&to);
      double v12 = [v11 presentationViewController];
      id v9 = +[GKFriendingViewControllers inviteFriendsWithContainerViewController:v12];
    }

    id v14 = objc_loadWeakRetained(&to);
    int64_t v15 = [v14 presentationViewController];
    [v15 presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    objc_copyWeak(&to, (id *)(a1 + 32));
    id v9 = objc_loadWeakRetained(&to);
    [v9 presentFriendInvite];
  }

  objc_destroyWeak(&to);
}

void __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [WeakRetained inviteFriendHandler];
  ((void (**)(void, id))v4)[2](v4, v3);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6 = a3;
  if (a5 == 1)
  {
    int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
    [v6 bounds];
    double v9 = v8;
    if (ShouldUsePadUI) {
      double v10 = 50.0;
    }
    else {
      double v10 = 30.0;
    }
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  double result = 0.0;
  if (ShouldUsePadUI) {
    return 2.0;
  }
  return result;
}

- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if ([v6 section])
  {
    if ([v6 section] != 1) {
      goto LABEL_14;
    }
    double v7 = [(GKLeaderboardScoreDataSource *)self inviteFriendHandler];
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v8 = [v6 item];
    double v7 = [(GKGameLayerCollectionDataSource *)self presentationViewController];
    if (v7
      && v8 != [(GKLeaderboardScoreDataSource *)self topLoadingCellItem]
      && v8 != [(GKLeaderboardScoreDataSource *)self bottomLoadingCellItem]
      && v8 != [(GKLeaderboardScoreDataSource *)self addFriendCellItem])
    {
      int64_t v9 = [(GKLeaderboardScoreDataSource *)self noFriendsCellItem];

      if (v8 == v9) {
        goto LABEL_14;
      }
      uint64_t v10 = v8 - ([(GKLeaderboardScoreDataSource *)self topLoadingCellItem] != -1);
      if (v10 < 0
        || ([(GKLeaderboardScoreDataSource *)self entries],
            double v11 = objc_claimAutoreleasedReturnValue(),
            unint64_t v12 = [v11 count],
            v11,
            v12 <= v10))
      {
        uint64_t v13 = NSString;
        id v14 = [NSString stringWithFormat:@"Assertion failed"];
        int64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardScoreDataSource.m"];
        id v16 = [v15 lastPathComponent];
        int64_t v17 = [v13 stringWithFormat:@"%@ (index >= 0 && self.entries.count > index)\n[%s (%s:%d)]", v14, "-[GKLeaderboardScoreDataSource handleSelectionInCollectionView:forItemAtIndexPath:]", objc_msgSend(v16, "UTF8String"), 987];

        [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v17 format];
      }
      double v7 = [(NSArray *)self->_entries objectAtIndexedSubscript:v10];
      uint64_t v18 = [v7 player];
      unint64_t v19 = [v18 internal];
      uint64_t v20 = [v19 playerID];
      BOOL v21 = [(GKGameLayerCollectionDataSource *)self presentationViewController];
      +[PlayerProfileViewController showProfileFor:v20 from:v21 completion:0];

      double v22 = [MEMORY[0x1E4F637F8] reporter];
      [v22 reportEvent:*MEMORY[0x1E4F63528] type:*MEMORY[0x1E4F631D8]];
    }
  }

LABEL_14:
  [v23 deselectItemAtIndexPath:v6 animated:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4 = [(GKLeaderboardScoreDataSource *)self leaderboardScoreDelegate];

  if (v4)
  {
    id v5 = [(GKLeaderboardScoreDataSource *)self leaderboardScoreDelegate];
    [v5 collectionViewDidScroll];
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 item];
  if (v9 == [(GKLeaderboardScoreDataSource *)self topLoadingCellItem]
    || v9 == [(GKLeaderboardScoreDataSource *)self bottomLoadingCellItem]
    || v9 == [(GKLeaderboardScoreDataSource *)self addFriendCellItem]
    || v9 == [(GKLeaderboardScoreDataSource *)self noFriendsCellItem])
  {
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v12 = [v7 cellForItemAtIndexPath:v8];
    uint64_t v13 = (void *)MEMORY[0x1E4FB1678];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__GKLeaderboardScoreDataSource_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
    v15[3] = &unk_1E5F65670;
    void v15[4] = self;
    id v16 = v8;
    id v17 = v12;
    id v14 = v12;
    uint64_t v10 = [v13 configurationWithIdentifier:v16 previewProvider:0 actionProvider:v15];
  }

  return v10;
}

id __96__GKLeaderboardScoreDataSource_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) itemForIndexPath:*(void *)(a1 + 40)];
  id v3 = [v2 _gkScore];

  uint64_t v4 = [*(id *)(a1 + 32) makeContextMenuForCell:*(void *)(a1 + 48) withScore:v3];

  return v4;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return [(GKLeaderboardScoreDataSource *)self targetedPreviewForUIContextMenuConfiguration:a4 inCollectionView:a3];
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return [(GKLeaderboardScoreDataSource *)self targetedPreviewForUIContextMenuConfiguration:a4 inCollectionView:a3];
}

- (id)targetedPreviewForUIContextMenuConfiguration:(id)a3 inCollectionView:(id)a4
{
  id v5 = a4;
  id v6 = [a3 identifier];
  id v7 = [v5 cellForItemAtIndexPath:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 setBackgroundColor:v9];

  id v10 = objc_alloc(MEMORY[0x1E4FB1B38]);
  [v7 center];
  double v12 = v11;
  double v14 = v13;
  int64_t v15 = [v7 superview];
  objc_msgSend(v5, "convertPoint:fromView:", v15, v12, v14);
  id v16 = objc_msgSend(v10, "initWithContainer:center:", v5);

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v7 parameters:v8 target:v16];

  return v17;
}

- (id)makeContextMenuForCell:(id)a3 withScore:(id)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F636F0] currentGame];
  id v8 = [v7 internal];
  if ([v8 supportsChallenges])
  {
    uint64_t v9 = [v5 entry];
    id v10 = [v9 player];
    char v11 = [v10 isLocalPlayer];

    if ((v11 & 1) == 0)
    {
      double v12 = (void *)MEMORY[0x1E4FB13F0];
      double v13 = GKGameCenterUIFrameworkBundle();
      double v14 = GKGetLocalizedStringFromTableInBundle();
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __65__GKLeaderboardScoreDataSource_makeContextMenuForCell_withScore___block_invoke;
      v36[3] = &unk_1E5F65698;
      id v37 = v5;
      id v38 = v6;
      int64_t v15 = [v12 actionWithTitle:v14 image:0 identifier:0 handler:v36];

      goto LABEL_6;
    }
  }
  else
  {
  }
  int64_t v15 = 0;
LABEL_6:
  id v16 = (void *)MEMORY[0x1E4FB13F0];
  id v17 = GKGameCenterUIFrameworkBundle();
  uint64_t v18 = GKGetLocalizedStringFromTableInBundle();
  unint64_t v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __65__GKLeaderboardScoreDataSource_makeContextMenuForCell_withScore___block_invoke_2;
  id v33 = &unk_1E5F65698;
  id v20 = v5;
  id v34 = v20;
  id v21 = v6;
  id v35 = v21;
  double v22 = [v16 actionWithTitle:v18 image:v19 identifier:0 handler:&v30];

  id v23 = (void *)MEMORY[0x1E4FB1970];
  if (v15)
  {
    v40[0] = v22;
    v40[1] = v15;
    uint64_t v24 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v25 = (void **)v40;
    uint64_t v26 = 2;
  }
  else
  {
    id v39 = v22;
    uint64_t v24 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v25 = &v39;
    uint64_t v26 = 1;
  }
  uint64_t v27 = objc_msgSend(v24, "arrayWithObjects:count:", v25, v26, v30, v31, v32, v33);
  double v28 = [v23 menuWithTitle:&stru_1F07B2408 children:v27];

  return v28;
}

void __65__GKLeaderboardScoreDataSource_makeContextMenuForCell_withScore___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 challengeWithScore:*(void *)(a1 + 40)];

  id v3 = [MEMORY[0x1E4F637F8] reporter];
  [v3 reportEvent:*MEMORY[0x1E4F63528] type:*MEMORY[0x1E4F631D0]];
}

void __65__GKLeaderboardScoreDataSource_makeContextMenuForCell_withScore___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 shareWithScore:*(void *)(a1 + 40) fromView:*(void *)(a1 + 32)];

  id v3 = [MEMORY[0x1E4F637F8] reporter];
  [v3 reportEvent:*MEMORY[0x1E4F63528] type:*MEMORY[0x1E4F631E0]];
}

- (void)presentFriendInvite
{
  if (*MEMORY[0x1E4F63830])
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __51__GKLeaderboardScoreDataSource_presentFriendInvite__block_invoke_2;
    v2[3] = &unk_1E5F64228;
    v2[4] = self;
    +[FriendRequestFacilitator makeViewControllerWithRecipients:MEMORY[0x1E4F1CBF0] chatGUID:0 completionHandler:v2];
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __51__GKLeaderboardScoreDataSource_presentFriendInvite__block_invoke;
    v3[3] = &unk_1E5F656C0;
    v3[4] = self;
    +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:MEMORY[0x1E4F1CBF0] chatGUID:0 resultHandler:v3];
  }
}

void __51__GKLeaderboardScoreDataSource_presentFriendInvite__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10) {
    id v6 = v10;
  }
  else {
    id v6 = v5;
  }
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    uint64_t v9 = [v7 presentationViewController];
    [v9 presentViewController:v8 animated:1 completion:0];
  }
}

void __51__GKLeaderboardScoreDataSource_presentFriendInvite__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 presentationViewController];
  [v4 presentViewController:v3 animated:1 completion:0];
}

- (id)addInvitedFriendContactIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  id v5 = [(GKLeaderboardScoreDataSource *)self invitedFriendContactIdentifiers];
  char v6 = [v5 containsObject:v4];

  if (v6) {
    goto LABEL_8;
  }
  id v7 = [(GKLeaderboardScoreDataSource *)self invitedFriendContactIdentifiers];
  [v7 addObject:v4];

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = -1;
  id v8 = [(GKLeaderboardScoreDataSource *)self suggestedFriends];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __66__GKLeaderboardScoreDataSource_addInvitedFriendContactIdentifier___block_invoke;
  double v14 = &unk_1E5F656E8;
  id v15 = v4;
  id v16 = &v17;
  [v8 enumerateObjectsUsingBlock:&v11];

  if (v18[3] == -1
    || ![(GKLeaderboardScoreDataSource *)self shouldDisplayFriendSuggestions])
  {
    char v9 = 1;
  }
  else
  {
    self = [MEMORY[0x1E4F28D58] indexPathForItem:v18[3] inSection:1];
    char v9 = 0;
  }

  _Block_object_dispose(&v17, 8);
  if (v9) {
LABEL_8:
  }
    self = 0;

  return self;
}

void __66__GKLeaderboardScoreDataSource_addInvitedFriendContactIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 contact];
  id v8 = [v7 identifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (BOOL)restrictToFriendsOnly
{
  return self->_restrictToFriendsOnly;
}

- (void)setRestrictToFriendsOnly:(BOOL)a3
{
  self->_restrictToFriendsOnly = a3;
}

- (int64_t)leaderboardOccurrence
{
  return self->_leaderboardOccurrence;
}

- (void)setLeaderboardOccurrence:(int64_t)a3
{
  self->_leaderboardOccurrence = a3;
}

- (GKLeaderboardScoreDelegate)leaderboardScoreDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leaderboardScoreDelegate);

  return (GKLeaderboardScoreDelegate *)WeakRetained;
}

- (void)setLeaderboardScoreDelegate:(id)a3
{
}

- (int64_t)startingRank
{
  return self->_startingRank;
}

- (void)setStartingRank:(int64_t)a3
{
  self->_startingRank = a3;
}

- (BOOL)autoScrollToLocalPlayerPosition
{
  return self->_autoScrollToLocalPlayerPosition;
}

- (void)setAutoScrollToLocalPlayerPosition:(BOOL)a3
{
  self->_autoScrollToLocalPlayerPosition = a3;
}

- (id)inviteFriendHandler
{
  return self->_inviteFriendHandler;
}

- (void)setInviteFriendHandler:(id)a3
{
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (BOOL)isLoadingData
{
  return self->_isLoadingData;
}

- (void)setIsLoadingData:(BOOL)a3
{
  self->_isLoadingData = a3;
}

- (BOOL)isLoadingNextData
{
  return self->_isLoadingNextData;
}

- (void)setIsLoadingNextData:(BOOL)a3
{
  self->_isLoadingNextData = a3;
}

- (BOOL)isLoadingPreviousData
{
  return self->_isLoadingPreviousData;
}

- (void)setIsLoadingPreviousData:(BOOL)a3
{
  self->_isLoadingPreviousData = a3;
}

- (NSString)additionalNextDataLoadToken
{
  return self->_additionalNextDataLoadToken;
}

- (void)setAdditionalNextDataLoadToken:(id)a3
{
}

- (NSString)additionalPreviousDataLoadToken
{
  return self->_additionalPreviousDataLoadToken;
}

- (void)setAdditionalPreviousDataLoadToken:(id)a3
{
}

- (int64_t)topLoadingCellItem
{
  return self->_topLoadingCellItem;
}

- (void)setTopLoadingCellItem:(int64_t)a3
{
  self->_topLoadingCellItem = a3;
}

- (int64_t)bottomLoadingCellItem
{
  return self->_bottomLoadingCellItem;
}

- (void)setBottomLoadingCellItem:(int64_t)a3
{
  self->_bottomLoadingCellItem = a3;
}

- (int64_t)addFriendCellItem
{
  return self->_addFriendCellItem;
}

- (void)setAddFriendCellItem:(int64_t)a3
{
  self->_addFriendCellItem = a3;
}

- (int64_t)noFriendsCellItem
{
  return self->_noFriendsCellItem;
}

- (void)setNoFriendsCellItem:(int64_t)a3
{
  self->_noFriendsCellItem = a3;
}

- (int64_t)maxRange
{
  return self->_maxRange;
}

- (void)setMaxRange:(int64_t)a3
{
  self->_maxRange = a3;
}

- (GKLeaderboardEntry)localPlayerEntry
{
  return self->_localPlayerEntry;
}

- (void)setLocalPlayerEntry:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (int64_t)friendCount
{
  return self->_friendCount;
}

- (void)setFriendCount:(int64_t)a3
{
  self->_friendCount = a3;
}

- (BOOL)firstLoad
{
  return self->_firstLoad;
}

- (void)setFirstLoad:(BOOL)a3
{
  self->_firstLoad = a3;
}

- (NSSet)localPlayerFriendIDs
{
  return self->_localPlayerFriendIDs;
}

- (void)setLocalPlayerFriendIDs:(id)a3
{
}

- (GKLeaderboardAddFriendsCell)sizingAddFriendsCell
{
  return self->_sizingAddFriendsCell;
}

- (void)setSizingAddFriendsCell:(id)a3
{
}

- (BOOL)shouldDisplayFriendSuggestions
{
  return self->_shouldDisplayFriendSuggestions;
}

- (void)setShouldDisplayFriendSuggestions:(BOOL)a3
{
  self->_shouldDisplayFriendSuggestions = a3;
}

- (NSArray)suggestedFriends
{
  return self->_suggestedFriends;
}

- (void)setSuggestedFriends:(id)a3
{
}

- (BOOL)showingAllFriendSuggestions
{
  return self->_showingAllFriendSuggestions;
}

- (void)setShowingAllFriendSuggestions:(BOOL)a3
{
  self->_BOOL showingAllFriendSuggestions = a3;
}

- (NSMutableSet)invitedFriendContactIdentifiers
{
  return self->_invitedFriendContactIdentifiers;
}

- (void)setInvitedFriendContactIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedFriendContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestedFriends, 0);
  objc_storeStrong((id *)&self->_sizingAddFriendsCell, 0);
  objc_storeStrong((id *)&self->_localPlayerFriendIDs, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_localPlayerEntry, 0);
  objc_storeStrong((id *)&self->_additionalPreviousDataLoadToken, 0);
  objc_storeStrong((id *)&self->_additionalNextDataLoadToken, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong(&self->_inviteFriendHandler, 0);
  objc_destroyWeak((id *)&self->_leaderboardScoreDelegate);

  objc_storeStrong((id *)&self->_leaderboard, 0);
}

void __62__GKLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "cannot load local player's friends due to: %@", (uint8_t *)&v2, 0xCu);
}

@end