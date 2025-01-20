@interface GKDashboardChallengePlayerPickerDataSource
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)showingAllFriendSuggestions;
- (BOOL)showingFriendSuggestions;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKChallenge)challenge;
- (GKDashboardChallengePlayerPickerDataSource)initWithChallenge:(id)a3;
- (NSArray)players;
- (NSArray)searchPlayers;
- (NSArray)selectedPlayers;
- (NSArray)suggestedFriends;
- (NSMutableDictionary)playerAchievementDates;
- (NSMutableDictionary)playerStates;
- (NSMutableSet)invitedFriendContactIdentifiers;
- (double)preferredCollectionHeight;
- (id)addInvitedFriendContactIdentifier:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)currentPlayers;
- (id)headerTextForSection:(int64_t)a3;
- (id)indexPathForPlayer:(id)a3;
- (id)inviteFriendHandler;
- (id)playerForIndexPath:(id)a3;
- (id)searchKeyForSection:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)friendSuggestionsCount;
- (int64_t)itemCount;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)clearSelection;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)searchTextHasChanged;
- (void)setChallenge:(id)a3;
- (void)setInviteFriendHandler:(id)a3;
- (void)setInvitedFriendContactIdentifiers:(id)a3;
- (void)setPlayerAchievementDates:(id)a3;
- (void)setPlayerStates:(id)a3;
- (void)setPlayers:(id)a3;
- (void)setSearchPlayers:(id)a3;
- (void)setShowingAllFriendSuggestions:(BOOL)a3;
- (void)setShowingFriendSuggestions:(BOOL)a3;
- (void)setSuggestedFriends:(id)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKDashboardChallengePlayerPickerDataSource

- (GKDashboardChallengePlayerPickerDataSource)initWithChallenge:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardChallengePlayerPickerDataSource;
  v5 = [(GKCollectionDataSource *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(GKDashboardChallengePlayerPickerDataSource *)v5 setChallenge:v4];
    [(GKCollectionDataSource *)v6 setUseStandardHeaders:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(GKDashboardChallengePlayerPickerDataSource *)v6 setInvitedFriendContactIdentifiers:v7];
  }
  return v6;
}

- (void)setupCollectionView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardChallengePlayerPickerDataSource;
  id v3 = a3;
  [(GKCollectionDataSource *)&v6 setupCollectionView:v3];
  id v4 = +[NSObject _gkNib];
  [v3 registerNib:v4 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"GKCollectionDataSourceHeader"];
  v5 = +[NSObject _gkNib];
  [v3 registerNib:v5 forCellWithReuseIdentifier:@"friendCell"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"friendSuggestionCell"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"inviteFriendButtonCell"];
  [v3 setAllowsMultipleSelection:1];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F636D8];
  objc_super v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDashboardChallengePlayerPickerDataSource.m", 122, "-[GKDashboardChallengePlayerPickerDataSource loadDataWithCompletionHandler:]");
  id v7 = [v5 dispatchGroupWithName:v6];

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  id v20 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E5F63628;
  v17 = v19;
  v18 = v21;
  v15[4] = self;
  id v8 = v7;
  id v16 = v8;
  [v8 perform:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_53;
  v14[3] = &unk_1E5F63650;
  v14[4] = self;
  [v8 perform:v14];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_56;
  v10[3] = &unk_1E5F63678;
  id v9 = v4;
  id v11 = v9;
  v12 = v21;
  v13 = v19;
  [v8 notifyOnMainQueueWithBlock:v10];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F63760] localPlayer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5F63600;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 48);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  [v4 loadChallengableFriendsWithFetchOptions:1 completion:v7];
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v32 = a1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  uint64_t v7 = [v5 count];
  if (!v6 || v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlayers:", v5, v6, v5);
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = *(id *)(*(void *)(a1 + 32) + 80);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v15 = *(void **)(*(void *)(v32 + 32) + 88);
          id v16 = [v14 referenceKey];
          v17 = [v15 objectForKeyedSubscript:v16];

          if (!v17) {
            v17 = &unk_1F0811BE0;
          }
          v18 = [v14 referenceKey];
          [v8 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v11);
    }

    [*(id *)(v32 + 32) setPlayerStates:v8];
    *(unsigned char *)(*(void *)(*(void *)(v32 + 64) + 8) + 24) = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [*(id *)(*(void *)(v32 + 32) + 72) achievement];
      id v20 = [v19 identifier];
      id v21 = objc_alloc(MEMORY[0x1E4F636F0]);
      char v22 = [*(id *)(*(void *)(v32 + 32) + 72) internal];
      v23 = [v22 game];
      v24 = (void *)[v21 initWithInternalRepresentation:v23];

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_42;
      v33[3] = &unk_1E5F635D8;
      id v34 = v24;
      id v35 = v19;
      uint64_t v25 = *(void *)(v32 + 56);
      id v37 = v20;
      uint64_t v38 = v25;
      v26 = *(void **)(v32 + 40);
      uint64_t v36 = *(void *)(v32 + 32);
      id v27 = v20;
      id v28 = v19;
      id v29 = v24;
      [v26 perform:v33];
    }
    id v6 = v30;
    id v5 = v31;
  }
  (*(void (**)(void))(*(void *)(v32 + 48) + 16))();
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) internal];
  id v6 = [v5 identifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_43;
  v11[3] = &unk_1E5F635B0;
  uint64_t v16 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(a1 + 56);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v9;
  id v15 = v3;
  id v10 = v3;
  [v4 getGameMatchesForAchievement:v6 handler:v11];
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v23 + 1) + 8 * v12) player];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  id v14 = (void *)MEMORY[0x1E4F63668];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3;
  v18[3] = &unk_1E5F63588;
  uint64_t v22 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(a1 + 48);
  v18[4] = *(void *)(a1 + 40);
  id v19 = v8;
  id v20 = v16;
  id v21 = *(id *)(a1 + 56);
  id v17 = v8;
  [v14 loadAchievementsForGameV2:v15 players:v7 includeUnreported:0 includeHidden:0 withCompletionHandler:v18];
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  [*(id *)(a1 + 32) setPlayerAchievementDates:v7];

  id v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 80)];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4;
  v13[3] = &unk_1E5F63560;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v14 = v10;
  uint64_t v15 = v11;
  id v16 = v9;
  id v12 = v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];
  [v8 removeObjectsInArray:v12];
  [v8 addObjectsFromArray:v12];
  [*(id *)(a1 + 32) setPlayers:v8];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v8[3] = &unk_1E5F63538;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  [a3 enumerateObjectsUsingBlock:v8];
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v14 = a2;
  if ([v14 isCompleted])
  {
    id v3 = [v14 identifier];
    int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

    if (v4)
    {
      id v5 = *(void **)(*(void *)(a1 + 40) + 80);
      uint64_t v6 = [v14 player];
      uint64_t v7 = [v5 indexOfObject:v6];

      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v8 = [*(id *)(*(void *)(a1 + 40) + 80) objectAtIndexedSubscript:v7];
        id v9 = [v14 lastReportedDate];
        uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 96);
        id v11 = [v8 referenceKey];
        [v10 setObject:v9 forKeyedSubscript:v11];

        if (([v14 isReplayable] & 1) == 0)
        {
          id v12 = *(void **)(*(void *)(a1 + 40) + 88);
          uint64_t v13 = [v8 referenceKey];
          [v12 setObject:&unk_1F0811BF8 forKeyedSubscript:v13];

          [*(id *)(a1 + 48) addObject:v8];
        }
      }
    }
  }
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_55;
  v5[3] = &unk_1E5F63300;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  +[GameCenterObjcHelper fetchSuggestedFriendsWithCompletionHandler:v5];
}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_55(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    id v8 = *MEMORY[0x1E4F63858];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63858], OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1AF250000, v8, OS_LOG_TYPE_INFO, "GKDashboardChallengePlayerPickerDataSource: Unable to fetch suggested friends: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [*(id *)(a1 + 32) setSuggestedFriends:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_56(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (id)currentPlayers
{
  id v3 = [(GKCollectionDataSource *)self searchText];
  uint64_t v4 = [v3 length];
  id v5 = &OBJC_IVAR___GKDashboardChallengePlayerPickerDataSource__searchPlayers;
  if (!v4) {
    id v5 = &OBJC_IVAR___GKDashboardChallengePlayerPickerDataSource__players;
  }
  id v6 = *(id *)((char *)&self->super.super.isa + *v5);

  return v6;
}

- (int64_t)itemCount
{
  v2 = [(GKDashboardChallengePlayerPickerDataSource *)self currentPlayers];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)friendSuggestionsCount
{
  BOOL showingAllFriendSuggestions = self->_showingAllFriendSuggestions;
  int64_t v3 = [(GKDashboardChallengePlayerPickerDataSource *)self suggestedFriends];
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

- (double)preferredCollectionHeight
{
  +[GKDashboardPlayerCell preferredCollectionHeight];
  return result;
}

- (id)playerForIndexPath:(id)a3
{
  unint64_t v4 = [a3 item];
  int64_t v5 = [(GKDashboardChallengePlayerPickerDataSource *)self currentPlayers];
  if ([v5 count] <= v4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:v4];
  }

  return v6;
}

- (NSArray)selectedPlayers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v3 = self->_players;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        playerStates = self->_playerStates;
        id v10 = [v8 referenceKey];
        uint64_t v11 = [(NSMutableDictionary *)playerStates objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 integerValue];

        if (v12 == 1) {
          [v14 addObject:v8];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return (NSArray *)v14;
}

- (void)clearSelection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v3 = [(NSMutableDictionary *)self->_playerStates allKeys];
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
        int v9 = [(NSMutableDictionary *)self->_playerStates objectForKey:v8];
        uint64_t v10 = [v9 integerValue];

        if (v10 == 1) {
          [(NSMutableDictionary *)self->_playerStates setObject:&unk_1F0811BE0 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)indexPathForPlayer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(GKDashboardChallengePlayerPickerDataSource *)self currentPlayers];
    uint64_t v6 = [v5 indexOfObject:v4];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)searchKeyForSection:(int64_t)a3
{
  return @"searchName";
}

- (void)searchTextHasChanged
{
  int64_t v3 = [(GKCollectionDataSource *)self searchText];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [(NSArray *)self->_players count];
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
        int v9 = -[NSArray objectAtIndexedSubscript:](self->_players, "objectAtIndexedSubscript:", [v8 item]);
        if ([(GKCollectionDataSource *)self searchMatchesItem:v9 inSection:0]) {
          [v10 addObject:v9];
        }
      }
    }
    [(GKDashboardChallengePlayerPickerDataSource *)self setSearchPlayers:v10];
  }
  else
  {
    [(GKDashboardChallengePlayerPickerDataSource *)self setSearchPlayers:0];
  }
}

- (id)addInvitedFriendContactIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && (-[GKDashboardChallengePlayerPickerDataSource invitedFriendContactIdentifiers](self, "invitedFriendContactIdentifiers"), v5 = objc_claimAutoreleasedReturnValue(), char v6 = [v5 containsObject:v4], v5, (v6 & 1) == 0))
  {
    uint64_t v8 = [(GKDashboardChallengePlayerPickerDataSource *)self invitedFriendContactIdentifiers];
    [v8 addObject:v4];

    int v9 = [(GKDashboardChallengePlayerPickerDataSource *)self suggestedFriends];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__GKDashboardChallengePlayerPickerDataSource_addInvitedFriendContactIdentifier___block_invoke;
    v12[3] = &unk_1E5F636A0;
    id v13 = v4;
    uint64_t v10 = [v9 indexOfObjectPassingTest:v12];

    id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __80__GKDashboardChallengePlayerPickerDataSource_addInvitedFriendContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 contact];
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = objc_msgSend(&unk_1F0812640, "mutableCopy", a3);
  if ([(GKDashboardChallengePlayerPickerDataSource *)self showingFriendSuggestions]) {
    [v4 addObject:&unk_1F0811C28];
  }
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    int64_t v7 = [(GKDashboardChallengePlayerPickerDataSource *)self friendSuggestionsCount] + 1;
  }
  else if (a4)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [(GKDashboardChallengePlayerPickerDataSource *)self itemCount];
  }

  return v7;
}

- (id)headerTextForSection:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
  {
    id v4 = 0;
  }
  else
  {
    int64_t v3 = GKGameCenterUIFrameworkBundle();
    id v4 = GKGetLocalizedStringFromTableInBundle();
  }

  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    if ([v7 section] != 1)
    {
      int v9 = 0;
      goto LABEL_13;
    }
    uint64_t v8 = [v7 item];
    if (v8 >= [(GKDashboardChallengePlayerPickerDataSource *)self friendSuggestionsCount])
    {
      int v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"inviteFriendButtonCell" forIndexPath:v7];
      long long v11 = [MEMORY[0x1E4FB1618] labelColor];
      [v9 updateTextColorWith:v11];
    }
    else
    {
      int v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"friendSuggestionCell" forIndexPath:v7];
      uint64_t v10 = [(GKDashboardChallengePlayerPickerDataSource *)self suggestedFriends];
      long long v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));

      long long v12 = [(GKDashboardChallengePlayerPickerDataSource *)self invitedFriendContactIdentifiers];
      id v13 = [v11 contact];
      long long v14 = [v13 identifier];
      objc_msgSend(v9, "applyWithSuggestedFriend:previouslyInvited:", v11, objc_msgSend(v12, "containsObject:", v14));

      long long v15 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      [v9 setInviteButtonTitleColor:v15];

      objc_initWeak(&location, self);
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = __84__GKDashboardChallengePlayerPickerDataSource_collectionView_cellForItemAtIndexPath___block_invoke;
      v47 = &unk_1E5F636C8;
      objc_copyWeak(&v48, &location);
      [v9 setTapHandler:&v44];
      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    int v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"friendCell" forIndexPath:v7];
    long long v11 = [(GKDashboardChallengePlayerPickerDataSource *)self playerForIndexPath:v7];
    [v9 setPlayer:v11];
    playerStates = self->_playerStates;
    long long v17 = [v11 referenceKey];
    long long v18 = [(NSMutableDictionary *)playerStates objectForKey:v17];
    uint64_t v19 = [v18 integerValue];

    [v9 setSelectable:v19 != 2];
    [v9 setSelected:v19 == 1];
    if (([v9 isSelectable] & 1) == 0)
    {
      playerAchievementDates = self->_playerAchievementDates;
      id v21 = [v11 referenceKey];
      uint64_t v22 = [(NSMutableDictionary *)playerAchievementDates objectForKeyedSubscript:v21];

      if (v22)
      {
        long long v23 = [(GKChallenge *)self->_challenge achievement];
        objc_msgSend(v9, "setStatusWithAchievementEarnedPoints:andDate:", objc_msgSend(v23, "maximumPoints"), v22);
      }
    }
    long long v24 = [v11 internal];
    long long v25 = [v24 contact];

    [v9 setShowsPlayerSubtitle:v25 != 0];
    long long v26 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0700000003];
    id v27 = [v9 contentView];
    [v27 setBackgroundColor:v26];

    [v9 setDefaultContentBackgroundColor:v26];
  }

LABEL_13:
  int64_t v28 = [(GKDashboardChallengePlayerPickerDataSource *)self itemCount];
  if ([v7 section] == 1) {
    int64_t v28 = [(GKDashboardChallengePlayerPickerDataSource *)self friendSuggestionsCount] + 1;
  }
  if (![v7 item])
  {
    uint64_t v38 = [v9 layer];
    [v38 setMasksToBounds:1];

    uint64_t v39 = *MEMORY[0x1E4F39EA8];
    long long v40 = [v9 layer];
    [v40 setCornerCurve:v39];

    long long v41 = [v9 layer];
    [v41 setCornerRadius:10.0];

    id v35 = [v9 layer];
    uint64_t v36 = v35;
    uint64_t v37 = 3;
    goto LABEL_19;
  }
  uint64_t v29 = [v7 item];
  v30 = [v9 layer];
  v31 = v30;
  if (v29 == v28 - 1)
  {
    [v30 setMasksToBounds:1];

    uint64_t v32 = *MEMORY[0x1E4F39EA8];
    v33 = [v9 layer];
    [v33 setCornerCurve:v32];

    id v34 = [v9 layer];
    [v34 setCornerRadius:10.0];

    id v35 = [v9 layer];
    uint64_t v36 = v35;
    uint64_t v37 = 12;
LABEL_19:
    [v35 setMaskedCorners:v37];
    goto LABEL_21;
  }
  [v30 setMaskedCorners:0];

  long long v42 = [v9 layer];
  [v42 setMasksToBounds:0];

  uint64_t v36 = [v9 layer];
  [v36 setCornerRadius:0.0];
LABEL_21:

  return v9;
}

void __84__GKDashboardChallengePlayerPickerDataSource_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained inviteFriendHandler];
  ((void (**)(void, id))v4)[2](v4, v3);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x1E4FB2770];
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    long long v12 = [v8 dequeueReusableSupplementaryViewOfKind:v11 withReuseIdentifier:@"GKCollectionDataSourceHeader" forIndexPath:v10];
    id v13 = -[GKDashboardChallengePlayerPickerDataSource headerTextForSection:](self, "headerTextForSection:", [v10 section]);
    long long v14 = [v12 titleLabel];
    [v14 setText:v13];

    if ([v10 section] == 1)
    {
      long long v15 = [(GKDashboardChallengePlayerPickerDataSource *)self suggestedFriends];
      unint64_t v16 = [v15 count];

      if (v16 < 4)
      {
        long long v24 = [v12 secondaryLabel];
        [v24 setText:0];

        uint64_t v20 = [v12 secondaryLabel];
        id v21 = v20;
        uint64_t v22 = 1;
      }
      else
      {
        [(GKDashboardChallengePlayerPickerDataSource *)self showingAllFriendSuggestions];
        long long v17 = GKGameCenterUIFrameworkBundle();
        long long v18 = GKGetLocalizedStringFromTableInBundle();
        uint64_t v19 = [v12 secondaryLabel];
        [v19 setText:v18];

        uint64_t v20 = [v12 secondaryLabel];
        id v21 = v20;
        uint64_t v22 = 0;
      }
      [v20 setHidden:v22];

      long long v25 = [v12 secondaryLabel];
      [v25 setUserInteractionEnabled:1];

      objc_initWeak(&location, self);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __107__GKDashboardChallengePlayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
      v27[3] = &unk_1E5F636F0;
      objc_copyWeak(&v30, &location);
      id v28 = v8;
      id v29 = v10;
      [v12 setSecondaryLabelTapHandler:v27];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      long long v23 = [v12 secondaryLabel];
      [v23 setHidden:1];
    }
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

void __107__GKDashboardChallengePlayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained showingAllFriendSuggestions] ^ 1;
  id v5 = objc_loadWeakRetained(v2);
  [v5 setShowingAllFriendSuggestions:v4];

  id v6 = *(void **)(a1 + 32);
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v6 reloadSections:v7];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a3;
  if ([a5 section])
  {
    [v6 bounds];
    +[GKDashboardFriendSuggestionCollectionViewCell sizeWithFitting:in:](_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell, "sizeWithFitting:in:", v6, v7, 0.0);
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    +[GKDashboardPlayerPickerCell defaultSize];
    double v11 = v12;
    double v9 = 0.0;
    id v13 = [v6 traitCollection];

    long long v14 = [v13 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

    if (IsAccessibilityCategory) {
      double v11 = v11 + v11;
    }
  }
  double v16 = v9;
  double v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    BOOL v7 = 0;
    if ([v5 section] == 1)
    {
      uint64_t v6 = [v5 item];
      if (v6 >= [(GKDashboardChallengePlayerPickerDataSource *)self friendSuggestionsCount]) {
        BOOL v7 = 1;
      }
    }
  }
  else
  {
    double v8 = [(GKDashboardChallengePlayerPickerDataSource *)self playerForIndexPath:v5];
    playerStates = self->_playerStates;
    double v10 = [v8 referenceKey];
    double v11 = [(NSMutableDictionary *)playerStates objectForKey:v10];
    uint64_t v12 = [v11 integerValue];

    BOOL v7 = v12 == 0;
  }

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v17 = a4;
  if (![v17 section])
  {
    double v10 = [(GKDashboardChallengePlayerPickerDataSource *)self playerForIndexPath:v17];
    double v9 = v10;
    if (v10)
    {
      playerStates = self->_playerStates;
      uint64_t v12 = [v10 referenceKey];
      id v13 = [(NSMutableDictionary *)playerStates objectForKey:v12];
      uint64_t v14 = [v13 integerValue];

      if (!v14)
      {
        long long v15 = self->_playerStates;
        double v16 = [v9 referenceKey];
        [(NSMutableDictionary *)v15 setObject:&unk_1F0811C40 forKeyedSubscript:v16];
      }
    }
    goto LABEL_9;
  }
  BOOL v5 = [v17 section] == 1;
  uint64_t v6 = v17;
  if (v5)
  {
    uint64_t v7 = [v17 item];
    BOOL v8 = v7 < [(GKDashboardChallengePlayerPickerDataSource *)self friendSuggestionsCount];
    uint64_t v6 = v17;
    if (!v8)
    {
      double v9 = [(GKDashboardChallengePlayerPickerDataSource *)self inviteFriendHandler];
      v9[2](v9, 0);
LABEL_9:

      uint64_t v6 = v17;
    }
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v13 = a4;
  if (![v13 section])
  {
    BOOL v5 = [(GKDashboardChallengePlayerPickerDataSource *)self playerForIndexPath:v13];
    uint64_t v6 = v5;
    if (v5)
    {
      playerStates = self->_playerStates;
      BOOL v8 = [v5 referenceKey];
      double v9 = [(NSMutableDictionary *)playerStates objectForKey:v8];
      uint64_t v10 = [v9 integerValue];

      if (v10 != 2)
      {
        double v11 = self->_playerStates;
        uint64_t v12 = [v6 referenceKey];
        [(NSMutableDictionary *)v11 setObject:&unk_1F0811BE0 forKeyedSubscript:v12];
      }
    }
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)showingFriendSuggestions
{
  return self->_showingFriendSuggestions;
}

- (void)setShowingFriendSuggestions:(BOOL)a3
{
  self->_showingFriendSuggestions = a3;
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

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (NSMutableDictionary)playerStates
{
  return self->_playerStates;
}

- (void)setPlayerStates:(id)a3
{
}

- (NSMutableDictionary)playerAchievementDates
{
  return self->_playerAchievementDates;
}

- (void)setPlayerAchievementDates:(id)a3
{
}

- (NSArray)searchPlayers
{
  return self->_searchPlayers;
}

- (void)setSearchPlayers:(id)a3
{
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
  objc_storeStrong((id *)&self->_searchPlayers, 0);
  objc_storeStrong((id *)&self->_playerAchievementDates, 0);
  objc_storeStrong((id *)&self->_playerStates, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_challenge, 0);

  objc_storeStrong(&self->_inviteFriendHandler, 0);
}

@end