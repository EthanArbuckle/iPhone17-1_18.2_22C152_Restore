@interface GKMultiplayerDataSource
- (BOOL)autoMatching;
- (BOOL)automatchAddedToMinInHeader;
- (BOOL)canCancelCurrentMatchmaking;
- (BOOL)haveNonGuestPlayers;
- (BOOL)havePendingPlayers;
- (BOOL)invitingEnabled;
- (BOOL)participantShouldBeRemovable:(id)a3 atIndexPath:(id)a4;
- (BOOL)removingEnabled;
- (BOOL)sharePlayEnabled;
- (BOOL)shouldRevertStatus:(int64_t)a3;
- (BOOL)shouldUpdateStatus:(int64_t)a3 withNewStatus:(int64_t)a4;
- (GKGame)game;
- (GKMultiplayerDataSource)initWithMetricsPageId:(id)a3;
- (GKMultiplayerDataSourceDelegate)delegate;
- (GKMultiplayerParticipant)placeholderItem;
- (NSArray)participants;
- (NSMutableDictionary)playerStatus;
- (NSMutableOrderedSet)orderedPlayerIDList;
- (NSMutableOrderedSet)players;
- (NSSet)selectedMessageGroups;
- (NSString)pageId;
- (_NSRange)playerRange;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionViewDebugDescription;
- (id)connectingPlayers;
- (id)currentPlayers;
- (id)currentPlayersDebugDescription;
- (id)currentPlayersNotInvitedViaMessages;
- (id)currentRemotePlayers;
- (id)firstInvitedContactPlayer;
- (id)guestPlayers;
- (id)participantForAutoMatchNumber:(int64_t)a3;
- (id)participantForPlayer:(id)a3;
- (id)playersDebugDescription:(id)a3 newStatus:(int64_t)a4;
- (id)playersInvited;
- (id)playersToBeInvited;
- (id)playersWithStatus:(int64_t)a3;
- (id)readyPlayers;
- (id)shareplayInvitedPlayers;
- (id)shareplayPrepopulatedPlayers;
- (int64_t)automatchPlayerCount;
- (int64_t)automatchPlayersAddedByUser;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)implicitAutomatchPlayerCount;
- (int64_t)maxAvailablePlayers;
- (int64_t)maxPlayers;
- (int64_t)minPlayers;
- (int64_t)statusForPlayer:(id)a3;
- (os_unfair_lock_s)automatchPlayerCountLock;
- (void)addPlayers:(id)a3 withStatus:(int64_t)a4 complete:(id)a5;
- (void)addPlayers:(id)a3 withStatus:(int64_t)a4 replaceAutomatches:(BOOL)a5 complete:(id)a6;
- (void)clearDataSource;
- (void)configureCollectionView:(id)a3;
- (void)didChangeMode;
- (void)failedToInvitePlayers:(id)a3;
- (void)prepopulateConversationParticipants:(id)a3 complete:(id)a4;
- (void)recordButtonClickAction:(id)a3 targetId:(id)a4;
- (void)recordRemoveFriendClickAction:(id)a3;
- (void)refreshParticipantsStatuses;
- (void)refreshStatusForParticipant:(id)a3;
- (void)removePlayers:(id)a3 complete:(id)a4;
- (void)removePrepopulatedPlayersIfExisted:(id)a3 completionHandler:(id)a4;
- (void)replacePlayers:(id)a3 withGKPlayers:(id)a4 completionHandler:(id)a5;
- (void)replacePrepopulatedPlayerWithNormalPlayer:(id)a3 participantServerIdentifier:(id)a4 completionHandler:(id)a5;
- (void)reportMultiplayerSelection:(id)a3;
- (void)restoreOrderOfPlayers;
- (void)revertFailedPlayers;
- (void)setAutomatchAddedToMinInHeader:(BOOL)a3;
- (void)setAutomatchPlayerCount:(int64_t)a3;
- (void)setAutomatchPlayerCount:(int64_t)a3 complete:(id)a4;
- (void)setAutomatchPlayerCountLock:(os_unfair_lock_s)a3;
- (void)setAutomatchPlayersAddedByUser:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setGame:(id)a3;
- (void)setImplicitAutomatchPlayerCount:(int64_t)a3;
- (void)setInvitingEnabled:(BOOL)a3;
- (void)setMaxPlayers:(int64_t)a3;
- (void)setMinPlayers:(int64_t)a3;
- (void)setOrderedPlayerIDList:(id)a3;
- (void)setParticipantsWithPlayers:(id)a3 automatchPlayerCount:(int64_t)a4 shouldUpdateAutomatchPlayerCount:(BOOL)a5 andStatuses:(id)a6 complete:(id)a7;
- (void)setPlaceholderItem:(id)a3;
- (void)setPlayerStatus:(id)a3;
- (void)setPlayers:(id)a3;
- (void)setRemovingEnabled:(BOOL)a3;
- (void)setSelectedMessageGroups:(id)a3;
- (void)setSharePlayEnabled:(BOOL)a3;
- (void)setStatus:(int64_t)a3 forPlayers:(id)a4 complete:(id)a5;
- (void)setStatus:(int64_t)a3 forPlayers:(id)a4 uuid:(id)a5;
- (void)updateDataStructuresForRemovedPlayer:(id)a3;
- (void)updateParticipants;
@end

@implementation GKMultiplayerDataSource

- (void)configureCollectionView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKMultiplayerDataSource;
  id v3 = a3;
  [(GKBasicCollectionViewDataSource *)&v8 configureCollectionView:v3];
  uint64_t v4 = objc_opt_class();
  v5 = +[GKMultiplayerParticipantCollectionViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  v7 = +[GKMultiplayerAddSlotCollectionViewCell reuseIdentifier];
  [v3 registerClass:v6 forCellWithReuseIdentifier:v7];

  [v3 setContentInsetAdjustmentBehavior:2];
}

- (GKMultiplayerDataSource)initWithMetricsPageId:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GKMultiplayerDataSource;
  uint64_t v6 = [(GKBasicCollectionViewDataSource *)&v23 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F63760] localPlayer];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithObject:v7];
    players = v6->_players;
    v6->_players = (NSMutableOrderedSet *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v11 = [v7 referenceKey];
    v24 = v11;
    v25[0] = &unk_1F0811F10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v13 = [v10 initWithDictionary:v12];
    playerStatus = v6->_playerStatus;
    v6->_playerStatus = (NSMutableDictionary *)v13;

    v6->_removingEnabled = 1;
    v6->_invitingEnabled = 1;
    id v15 = objc_alloc(MEMORY[0x1E4F1CA70]);
    v16 = [v7 internal];
    v17 = [v16 playerID];
    uint64_t v18 = [v15 initWithObject:v17];
    orderedPlayerIDList = v6->_orderedPlayerIDList;
    v6->_orderedPlayerIDList = (NSMutableOrderedSet *)v18;

    v20 = objc_alloc_init(GKMultiplayerParticipant);
    placeholderItem = v6->_placeholderItem;
    v6->_placeholderItem = v20;

    [(GKMultiplayerParticipant *)v6->_placeholderItem setIsPlaceHolderItem:1];
    v6->_automatchPlayerCountLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pageId, a3);
  }
  return v6;
}

- (id)currentPlayers
{
  return (id)[(NSMutableOrderedSet *)self->_players array];
}

- (id)currentPlayersNotInvitedViaMessages
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(GKMultiplayerDataSource *)self players];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GKMultiplayerDataSource_currentPlayersNotInvitedViaMessages__block_invoke;
  v7[3] = &unk_1E5F64F20;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __62__GKMultiplayerDataSource_currentPlayersNotInvitedViaMessages__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 internal];
  uint64_t v4 = [v3 messagesID];

  if (!v4) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)currentRemotePlayers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(GKMultiplayerDataSource *)self players];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 isGuestPlayer] & 1) == 0 && (objc_msgSend(v9, "isLocalPlayer") & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)guestPlayers
{
  v2 = [(GKMultiplayerDataSource *)self currentPlayers];
  id v3 = [v2 _gkGuestPlayersFromPlayers];

  return v3;
}

- (id)playersWithStatus:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_players;
  uint64_t v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[GKMultiplayerDataSource statusForPlayer:](self, "statusForPlayer:", v11, (void)v13) == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)connectingPlayers
{
  return [(GKMultiplayerDataSource *)self playersWithStatus:6];
}

- (id)readyPlayers
{
  return [(GKMultiplayerDataSource *)self playersWithStatus:7];
}

- (id)playersToBeInvited
{
  return [(GKMultiplayerDataSource *)self playersWithStatus:11];
}

- (id)playersInvited
{
  return [(GKMultiplayerDataSource *)self playersWithStatus:1];
}

- (id)shareplayPrepopulatedPlayers
{
  return [(GKMultiplayerDataSource *)self playersWithStatus:20];
}

- (id)shareplayInvitedPlayers
{
  return [(GKMultiplayerDataSource *)self playersWithStatus:21];
}

- (BOOL)havePendingPlayers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(GKMultiplayerDataSource *)self automatchPlayerCount] <= 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)self->_playerStatus allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v3 = 0;
      uint64_t v7 = *(void *)v13;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) integerValue];
        if (v9 - 1 <= 0x14) {
          v3 |= 0x180C21u >> (v9 - 1);
        }
        if (v9 <= 0x15 && ((1 << v9) & 0x301842) != 0) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3 & 1;
}

- (_NSRange)playerRange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v3 = [(GKMultiplayerDataSource *)self participants];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v10 type] || objc_msgSend(v10, "type") == 2) {
          ++v7;
        }
      }
      v6 += v5;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
  }

  if (v7 <= self->_minPlayers) {
    NSUInteger minPlayers = self->_minPlayers;
  }
  else {
    NSUInteger minPlayers = v7;
  }
  NSUInteger v12 = v6 - minPlayers;
  result.length = v12;
  result.location = minPlayers;
  return result;
}

- (NSArray)participants
{
  v2 = [(GKBasicCollectionViewDataSource *)self items];
  int v3 = [v2 _gkFilterWithBlock:&__block_literal_global_25];

  return (NSArray *)v3;
}

id __39__GKMultiplayerDataSource_participants__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPlaceHolderItem]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return v3;
}

- (int64_t)maxAvailablePlayers
{
  int64_t maxPlayers = self->_maxPlayers;
  return maxPlayers - [(NSMutableOrderedSet *)self->_players count];
}

- (id)participantForPlayer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(GKMultiplayerDataSource *)self participants];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 player];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)participantForAutoMatchNumber:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(GKMultiplayerDataSource *)self participants];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 type] == 1)
        {
          if (v7 == a3)
          {
            id v11 = v10;
            goto LABEL_13;
          }
          ++v7;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (id)firstInvitedContactPlayer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_players;
  id v3 = (id)[(NSMutableOrderedSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        int v7 = objc_msgSend(v6, "contact", (void)v9);

        if (v7)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSMutableOrderedSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (int64_t)statusForPlayer:(id)a3
{
  if (!a3) {
    return 7;
  }
  playerStatus = self->_playerStatus;
  uint64_t v4 = [a3 referenceKey];
  uint64_t v5 = [(NSMutableDictionary *)playerStatus objectForKeyedSubscript:v4];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (BOOL)participantShouldBeRemovable:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  if ([(GKMultiplayerDataSource *)self removingEnabled])
  {
    uint64_t v6 = [v5 type];
    if (v6 == 1)
    {
      long long v10 = [(GKMultiplayerDataSource *)self participants];
      unint64_t v9 = [v10 count];
      LOBYTE(v9) = v9 > [(GKMultiplayerDataSource *)self minPlayers];
    }
    else if (v6)
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      int v7 = [v5 player];
      char v8 = [v7 isLocalPlayer];

      if (v8)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        unint64_t v11 = [v5 status];
        if (v11 >= 0x15) {
          LOBYTE(v9) = 1;
        }
        else {
          LODWORD(v9) = (0xFEF3Fu >> v11) & 1;
        }
      }
    }
    if ([v5 status] == 12
      || [v5 status] == 6
      || [v5 status] == 7
      || [v5 status] == 20 && objc_msgSend(v5, "type") != 1)
    {
      LOBYTE(v9) = 0;
    }
    if ([v5 status] == 6)
    {
      long long v12 = [(GKMultiplayerDataSource *)self delegate];
      char v13 = [v12 isParticipantInvitedByLocalPlayer:v5];

      LOBYTE(v9) = v13 | v9;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)recordButtonClickAction:(id)a3 targetId:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v24 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v7 = +[GKMultiplayerParticipant allStatuses];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        char v13 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", (int)[v12 intValue]);
        uint64_t v14 = NSNumber;
        long long v15 = -[GKMultiplayerDataSource playersWithStatus:](self, "playersWithStatus:", (int)[v12 intValue]);
        long long v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        [v6 setObject:v16 forKeyedSubscript:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }

  uint64_t v17 = [MEMORY[0x1E4F63660] reporter];
  uint64_t v18 = [(GKMultiplayerDataSource *)self pageId];
  v32 = @"location";
  v30[0] = @"playersCount";
  v19 = NSNumber;
  v20 = [(GKMultiplayerDataSource *)self players];
  v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
  v30[1] = @"statusCounts";
  v31[0] = v21;
  v31[1] = v6;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  v33 = v22;
  objc_super v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  [v17 recordClickWithAction:v25 targetId:v24 targetType:@"button" pageId:v18 pageType:@"multiplayer" additionalFields:v23];
}

- (void)recordRemoveFriendClickAction:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F63660];
  id v5 = a3;
  uint64_t v6 = [v4 reporter];
  int v7 = [(GKMultiplayerDataSource *)self pageId];
  char v13 = @"location";
  unint64_t v11 = @"status";
  uint64_t v8 = [v5 statusName];

  long long v12 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v14[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v6 recordClickWithAction:@"remove" targetId:@"removeFriend" targetType:@"button" pageId:v7 pageType:@"multiplayer" additionalFields:v10];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GKMultiplayerDataSource *)self delegate];
  if (![v8 allowAutoMatch]) {
    goto LABEL_6;
  }
  uint64_t v9 = [v7 item];
  uint64_t v10 = [(GKBasicCollectionViewDataSource *)self items];
  if (v9 != [v10 count] - 1)
  {

LABEL_6:
    goto LABEL_7;
  }
  unint64_t v11 = [(GKMultiplayerDataSource *)self maxPlayers];
  long long v12 = [(GKMultiplayerDataSource *)self participants];
  unint64_t v13 = [v12 count];

  if (v11 > v13)
  {
    uint64_t v14 = +[GKMultiplayerAddSlotCollectionViewCell reuseIdentifier];
    long long v15 = [v6 dequeueReusableCellWithReuseIdentifier:v14 forIndexPath:v7];

    int64_t v16 = [(GKMultiplayerDataSource *)self maxPlayers];
    uint64_t v17 = [(GKMultiplayerDataSource *)self participants];
    objc_msgSend(v15, "setMaximumAdditionalPlayers:", v16 - objc_msgSend(v17, "count"));

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke;
    v31[3] = &unk_1E5F64F68;
    v31[4] = self;
    [v15 setAddSlotActionHandler:v31];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v18 = +[GKMultiplayerParticipantCollectionViewCell reuseIdentifier];
  long long v15 = [v6 dequeueReusableCellWithReuseIdentifier:v18 forIndexPath:v7];

  objc_msgSend(v15, "setSharePlayEnabled:", -[GKMultiplayerDataSource sharePlayEnabled](self, "sharePlayEnabled"));
  v19 = [(GKMultiplayerDataSource *)self participants];
  v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  [(GKMultiplayerDataSource *)self refreshStatusForParticipant:v20];
  uint64_t v21 = [v7 item] + 1;
  BOOL v22 = [(GKMultiplayerDataSource *)self removingEnabled];
  BOOL v23 = [(GKMultiplayerDataSource *)self invitingEnabled];
  id v24 = [(GKMultiplayerDataSource *)self delegate];
  objc_msgSend(v15, "applyWithParticipant:number:isRemovingEnabled:isInvitingEnabled:layoutMode:", v20, v21, v22, v23, objc_msgSend(v24, "multiplayerCellLayoutMode"));

  objc_msgSend(v15, "setRemoveButtonHidden:", -[GKMultiplayerDataSource participantShouldBeRemovable:atIndexPath:](self, "participantShouldBeRemovable:atIndexPath:", v20, v7) ^ 1);
  objc_initWeak(&location, v15);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v27[3] = &unk_1E5F64F90;
  v27[4] = self;
  objc_copyWeak(&v29, &location);
  id v25 = v20;
  id v28 = v25;
  [v15 setTapHandler:v27];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

LABEL_8:

  return v15;
}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) participants];
  uint64_t v5 = [v4 count] + a2;

  id v6 = [*(id *)(a1 + 32) players];
  uint64_t v7 = v5 - [v6 count];

  if ((v7 & 0x8000000000000000) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    long long v15 = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_2;
    int64_t v16 = &unk_1E5F634E8;
    objc_copyWeak(&v17, &location);
    [v8 setAutomatchPlayerCount:v7 complete:&v13];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F637E8], "shared", v13, v14, v15, v16);
  [v9 setRecentNumberOfPlayers:v5];

  uint64_t v10 = [MEMORY[0x1E4F637E8] shared];
  unint64_t v11 = [*(id *)(a1 + 32) game];
  long long v12 = [v11 bundleIdentifier];
  [v10 setRecentNumberOfPlayers:v5 forBundleID:v12];
}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 didUpdateAutoMatchPlayerCount];
}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_3(id *a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      uint64_t v4 = [a1[4] participants];
      uint64_t v5 = [v4 count] - 1;

      id v6 = [a1[4] players];
      uint64_t v7 = v5 - [v6 count];

      if ((v7 & 0x8000000000000000) == 0)
      {
        objc_initWeak(&location, a1[4]);
        id v8 = a1[4];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_5;
        v23[3] = &unk_1E5F634E8;
        objc_copyWeak(&v24, &location);
        [v8 setAutomatchPlayerCount:v7 complete:v23];
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      uint64_t v9 = [MEMORY[0x1E4F637E8] shared];
      [v9 setRecentNumberOfPlayers:v5];

      uint64_t v10 = [MEMORY[0x1E4F637E8] shared];
      unint64_t v11 = [a1[4] game];
      long long v12 = [v11 bundleIdentifier];
      [v10 setRecentNumberOfPlayers:v5 forBundleID:v12];

      goto LABEL_15;
    case 1:
      uint64_t v13 = [a1[5] player];

      id v14 = a1[4];
      if (v13)
      {
        long long v15 = [v14 delegate];
        [v15 didTapRemoveParticipant:a1[5]];
      }
      else
      {
        int64_t v16 = [v14 participants];
        uint64_t v17 = [v16 count];
        uint64_t v18 = [a1[4] players];
        uint64_t v19 = v17 + ~[v18 count];

        if ((v19 & 0x8000000000000000) == 0)
        {
          objc_initWeak(&location, a1[4]);
          id v20 = a1[4];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          void v25[2] = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_4;
          v25[3] = &unk_1E5F634E8;
          objc_copyWeak(&v26, &location);
          [v20 setAutomatchPlayerCount:v19 complete:v25];
          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v21 = [MEMORY[0x1E4F637F8] reporter];
      [v21 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F632B0]];

LABEL_15:
      [a1[4] recordRemoveFriendClickAction:a1[5]];
      return;
    case 0:
      id v22 = [a1[4] delegate];
      id WeakRetained = objc_loadWeakRetained(a1 + 6);
      [v22 didTapInviteOnCell:WeakRetained];

      break;
  }
}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 didUpdateAutoMatchPlayerCount];
}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 didUpdateAutoMatchPlayerCount];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  uint64_t v5 = [(GKBasicCollectionViewDataSource *)self items];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)collectionViewDebugDescription
{
  id v3 = NSString;
  uint64_t v4 = [(GKMultiplayerDataSource *)self currentPlayersDebugDescription];
  orderedPlayerIDList = self->_orderedPlayerIDList;
  int64_t v6 = [(GKMultiplayerDataSource *)self participants];
  uint64_t v7 = [v3 stringWithFormat:@"CollectionView Debug Description - players: %@\n            orderedPlayerIDList: %@\n            participants: %@ \n", v4, orderedPlayerIDList, v6];

  return v7;
}

- (id)currentPlayersDebugDescription
{
  id v3 = NSString;
  uint64_t v4 = [(GKMultiplayerDataSource *)self players];
  uint64_t v5 = [v4 array];
  int64_t v6 = [(GKMultiplayerDataSource *)self playersDebugDescription:v5 newStatus:-1];
  uint64_t v7 = [v3 stringWithFormat:@"current players: %@", v6];

  return v7;
}

- (id)playersDebugDescription:(id)a3 newStatus:(int64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = [&stru_1F07B2408 stringByAppendingFormat:@"players: {\n"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v27 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(obj);
          }
          unint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v12 = [v7 stringByAppendingFormat:@"\t%@", v11];

          uint64_t v13 = [(GKMultiplayerDataSource *)self playerStatus];
          id v14 = [v11 referenceKey];
          long long v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            int64_t v16 = [(GKMultiplayerDataSource *)self playerStatus];
            uint64_t v17 = [v11 referenceKey];
            uint64_t v18 = [v16 objectForKeyedSubscript:v17];
            uint64_t v19 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:v18];
            uint64_t v20 = [v12 stringByAppendingFormat:@"- current status: %@", v19];

            long long v12 = (void *)v20;
          }
          if ((a4 & 0x8000000000000000) == 0)
          {
            uint64_t v21 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:a4];
            uint64_t v22 = [v12 stringByAppendingFormat:@" - new status: %@", v21];

            long long v12 = (void *)v22;
          }
          uint64_t v7 = [v12 stringByAppendingFormat:@",\n"];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v9);
    }

    BOOL v23 = [NSString stringWithFormat:@"%@}\n", v7];

    id v6 = v25;
  }
  else
  {
    BOOL v23 = [&stru_1F07B2408 stringByAppendingFormat:@"players: - No Players - "];
  }

  return v23;
}

- (void)addPlayers:(id)a3 withStatus:(int64_t)a4 complete:(id)a5
{
}

- (void)prepopulateConversationParticipants:(id)a3 complete:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        id v13 = objc_alloc(MEMORY[0x1E4F63788]);
        id v14 = [(GKMultiplayerDataSource *)self game];
        long long v15 = [v14 bundleIdentifier];
        int64_t v16 = (void *)[v13 initWithParticipant:v12 forBundleID:v15];

        if (v16)
        {
          [v7 addObject:v16];
        }
        else
        {
          if (!*MEMORY[0x1E4F63860]) {
            id v17 = (id)GKOSLoggers();
          }
          uint64_t v18 = *MEMORY[0x1E4F63870];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v26 = v12;
            _os_log_error_impl(&dword_1AF250000, v18, OS_LOG_TYPE_ERROR, "cannot convert TUConversationParticipant(%@) to GKPlayer.", buf, 0xCu);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v9);
  }

  [(GKMultiplayerDataSource *)self addPlayers:v7 withStatus:20 replaceAutomatches:1 complete:v19];
}

- (void)addPlayers:(id)a3 withStatus:(int64_t)a4 replaceAutomatches:(BOOL)a5 complete:(id)a6
{
  BOOL v7 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (char *)a3;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v14 = (id)GKOSLoggers();
  }
  long long v15 = (os_log_t *)MEMORY[0x1E4F63838];
  int64_t v16 = (void *)*MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
  {
    long long v30 = NSString;
    uint64_t v27 = v16;
    uint64_t v28 = [(GKMultiplayerDataSource *)self playersDebugDescription:v10 newStatus:a4];
    v32 = (void *)v28;
    long long v29 = @"NO";
    if (v7) {
      long long v29 = @"YES";
    }
    long long v31 = [v30 stringWithFormat:@"- START - uuid: %@, %@, replaceAutomatch: %@", v12, v28, v29];
    *(_DWORD *)buf = 136315394;
    v43 = "-[GKMultiplayerDataSource addPlayers:withStatus:replaceAutomatches:complete:]";
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v31;
    _os_log_debug_impl(&dword_1AF250000, v27, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);
  }
  if (!*v13) {
    id v17 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG)) {
    -[GKMultiplayerDataSource addPlayers:withStatus:replaceAutomatches:complete:]();
  }
  [(GKMultiplayerDataSource *)self reportMultiplayerSelection:v10];
  if (!*v13) {
    id v18 = (id)GKOSLoggers();
  }
  id v19 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = v19;
    uint64_t v21 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:a4];
    long long v22 = (void *)v21;
    long long v23 = @"NO";
    *(_DWORD *)buf = 138412802;
    v43 = v10;
    __int16 v44 = 2112;
    if (v7) {
      long long v23 = @"YES";
    }
    uint64_t v45 = v21;
    __int16 v46 = 2112;
    v47 = v23;
    _os_log_impl(&dword_1AF250000, v20, OS_LOG_TYPE_INFO, "add players: %@ - status: %@ - replaceAutomatch: %@", buf, 0x20u);
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke;
  v37[3] = &unk_1E5F64FB8;
  v37[4] = self;
  v38 = v10;
  BOOL v41 = v7;
  int64_t v40 = a4;
  id v39 = v12;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke_2;
  v33[3] = &unk_1E5F647F8;
  id v34 = v39;
  uint64_t v35 = self;
  id v36 = v11;
  id v24 = v11;
  id v25 = v39;
  uint64_t v26 = v10;
  [(GKCollectionViewDataSource *)self notifyBatchUpdate:v37 complete:v33];
}

uint64_t __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) automatchPlayerCount];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "players", (void)v19);
        char v10 = [v9 containsObject:v8];

        if ((v10 & 1) == 0)
        {
          id v11 = [*(id *)(a1 + 32) players];
          [v11 addObject:v8];

          uint64_t v12 = [*(id *)(a1 + 32) orderedPlayerIDList];
          id v13 = [v8 internal];
          id v14 = [v13 playerID];
          [v12 addObject:v14];

          --v2;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) setAutomatchPlayerCount:v2 & ~(v2 >> 63)];
    uint64_t v15 = [*(id *)(a1 + 32) automatchPlayerCount];
    if (v15 < [*(id *)(a1 + 32) automatchPlayersAddedByUser])
    {
      unint64_t v16 = *(void *)(a1 + 56);
      if (v16 <= 0x15 && ((1 << v16) & 0x200802) != 0) {
        objc_msgSend(*(id *)(a1 + 32), "setAutomatchPlayerCount:", objc_msgSend(*(id *)(a1 + 32), "automatchPlayersAddedByUser"));
      }
    }
    id v17 = objc_msgSend(*(id *)(a1 + 32), "delegate", (void)v19);
    [v17 didUpdateAutoMatchPlayerCount];
  }
  objc_msgSend(*(id *)(a1 + 32), "setStatus:forPlayers:uuid:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v19);
  return [*(id *)(a1 + 32) updateParticipants];
}

uint64_t __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke_2(uint64_t a1)
{
  if (!*MEMORY[0x1E4F63860]) {
    id v2 = (id)GKOSLoggers();
  }
  id v3 = (void *)*MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke_2_cold_1(a1, v3);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateDataStructuresForRemovedPlayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKMultiplayerDataSource *)self playerStatus];
  uint64_t v6 = [v4 referenceKey];
  [v5 removeObjectForKey:v6];

  BOOL v7 = [(GKMultiplayerDataSource *)self players];
  [v7 removeObject:v4];

  uint64_t v8 = [(GKMultiplayerDataSource *)self orderedPlayerIDList];
  uint64_t v9 = [v4 internal];

  char v10 = [v9 playerID];
  [v8 removeObject:v10];

  int64_t v11 = [(GKMultiplayerDataSource *)self automatchPlayerCount] + 1;

  [(GKMultiplayerDataSource *)self setAutomatchPlayerCount:v11];
}

- (void)removePlayers:(id)a3 complete:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v10 = (id)GKOSLoggers();
  }
  int64_t v11 = (os_log_t *)MEMORY[0x1E4F63838];
  uint64_t v12 = (void *)*MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
  {
    long long v19 = NSString;
    long long v20 = v12;
    long long v21 = [(GKMultiplayerDataSource *)self playersDebugDescription:v6 newStatus:-1];
    long long v22 = [v19 stringWithFormat:@"- START - uuid: %@, %@", v8, v21];
    *(_DWORD *)buf = 136315394;
    long long v31 = "-[GKMultiplayerDataSource removePlayers:complete:]";
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    _os_log_debug_impl(&dword_1AF250000, v20, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);
  }
  if (!*v9) {
    id v13 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG)) {
    -[GKMultiplayerDataSource removePlayers:complete:]();
  }
  if (!*v9) {
    id v14 = (id)GKOSLoggers();
  }
  uint64_t v15 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v31 = v6;
    _os_log_impl(&dword_1AF250000, v15, OS_LOG_TYPE_INFO, "remove players: %@", buf, 0xCu);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke;
  v27[3] = &unk_1E5F63350;
  uint64_t v28 = v6;
  long long v29 = self;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke_2;
  v23[3] = &unk_1E5F647F8;
  id v24 = v8;
  id v25 = self;
  id v26 = v7;
  id v16 = v7;
  id v17 = v8;
  id v18 = v6;
  [(GKCollectionViewDataSource *)self notifyBatchUpdate:v27 complete:v23];
}

uint64_t __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "updateDataStructuresForRemovedPlayer:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) updateParticipants];
}

uint64_t __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke_2(uint64_t a1)
{
  if (!*MEMORY[0x1E4F63860]) {
    id v2 = (id)GKOSLoggers();
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke_2_cold_1(a1, v3);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)shouldRevertStatus:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldUpdateStatus:(int64_t)a3 withNewStatus:(int64_t)a4
{
  uint64_t v6 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v7 = *MEMORY[0x1E4F63538];
  [v6 reportEvent:*MEMORY[0x1E4F63538] type:*MEMORY[0x1E4F63330]];

  if (a3 == a4) {
    return 0;
  }
  if (a3 == 6)
  {
    BOOL result = 0;
    if (a4 > 8)
    {
      if (a4 == 9) {
        return result;
      }
LABEL_11:
      if (a4 != 12) {
        return 1;
      }
    }
    else
    {
      if (!a4) {
        return result;
      }
      if (a4 != 1) {
        return 1;
      }
    }
LABEL_8:
    long long v9 = [MEMORY[0x1E4F637F8] reporter];
    [v9 reportEvent:v7 type:*MEMORY[0x1E4F63338]];

    return 0;
  }
  if (a3 != 7) {
    return 1;
  }
  BOOL result = 0;
  switch(a4)
  {
    case 0:
    case 9:
      return result;
    case 1:
    case 6:
      goto LABEL_8;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
      return 1;
    default:
      goto LABEL_11;
  }
  return result;
}

- (void)setStatus:(int64_t)a3 forPlayers:(id)a4 uuid:(id)a5
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v97 = a5;
  v96 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v111 objects:v123 count:16];
  long long v10 = (uint64_t *)MEMORY[0x1E4F63860];
  long long v11 = (os_log_t *)MEMORY[0x1E4F63838];
  v98 = self;
  id v99 = v8;
  uint64_t v101 = v9;
  if (v9)
  {
    uint64_t v100 = *(void *)v112;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v112 != v100) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v111 + 1) + 8 * v12);
        id v14 = [(GKMultiplayerDataSource *)self playerStatus];
        uint64_t v15 = [v13 referenceKey];
        id v16 = [v14 objectForKeyedSubscript:v15];
        uint64_t v17 = [v16 integerValue];

        if (!*v10) {
          id v18 = (id)GKOSLoggers();
        }
        os_log_t v19 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
        {
          v55 = NSString;
          v56 = v19;
          v57 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:v17];
          v58 = [v55 stringWithFormat:@"- MIDDLE 1 - uuid: %@, Settings status for player: %@ with current status: %@", v97, v13, v57];
          *(_DWORD *)buf = 136315394;
          v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
          __int16 v118 = 2112;
          v119 = v58;
          _os_log_debug_impl(&dword_1AF250000, v56, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);
        }
        BOOL v20 = [(GKMultiplayerDataSource *)self shouldUpdateStatus:v17 withNewStatus:a3];
        uint64_t v21 = *v10;
        if (v20)
        {
          if (!v21) {
            id v22 = (id)GKOSLoggers();
          }
          os_log_t v23 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
          {
            v95 = NSString;
            v59 = v23;
            v60 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:v17];
            v61 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:a3];
            v62 = [v95 stringWithFormat:@"- MIDDLE 2 - uuid: %@, should update status for player: %@ from status %@ to new status: %@", v97, v13, v60, v61];
            *(_DWORD *)buf = 136315394;
            v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
            __int16 v118 = 2112;
            v119 = v62;
            _os_log_debug_impl(&dword_1AF250000, v59, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);
          }
          id v24 = [(GKMultiplayerDataSource *)self players];
          uint64_t v25 = [v24 indexOfObject:v13];

          uint64_t v26 = *v10;
          if (v25 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!v26) {
              id v27 = (id)GKOSLoggers();
            }
            os_log_t v28 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
            {
              long long v29 = NSString;
              long long v30 = v28;
              long long v31 = [v29 stringWithFormat:@"- MIDDLE 5 - uuid: %@, cannot find index path for player: %@", v97, v13];
              *(_DWORD *)buf = 136315394;
              v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
              __int16 v118 = 2112;
              v119 = v31;
              _os_log_debug_impl(&dword_1AF250000, v30, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);
            }
          }
          else
          {
            if (!v26) {
              id v41 = (id)GKOSLoggers();
            }
            os_log_t v42 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
            {
              v68 = NSString;
              v69 = v42;
              v70 = [v13 referenceKey];
              v71 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:a3];
              v72 = [v68 stringWithFormat:@"- MIDDLE 3 - uuid: %@, updating player: %@ with referencekey %@ to status: %@", v97, v13, v70, v71];
              *(_DWORD *)buf = 136315394;
              v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
              __int16 v118 = 2112;
              v119 = v72;
              _os_log_debug_impl(&dword_1AF250000, v69, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);
            }
            v43 = [NSNumber numberWithInteger:a3];
            __int16 v44 = [(GKMultiplayerDataSource *)self playerStatus];
            uint64_t v45 = [v13 referenceKey];
            [v44 setObject:v43 forKeyedSubscript:v45];

            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            id v36 = [(GKMultiplayerDataSource *)self participants];
            uint64_t v46 = [v36 countByEnumeratingWithState:&v107 objects:v122 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v108;
              while (2)
              {
                for (uint64_t i = 0; i != v47; ++i)
                {
                  if (*(void *)v108 != v48) {
                    objc_enumerationMutation(v36);
                  }
                  v50 = *(void **)(*((void *)&v107 + 1) + 8 * i);
                  v51 = [v50 player];
                  int v52 = [v51 isEqual:v13];

                  if (v52)
                  {
                    [v50 setStatus:a3];
                    id v39 = [MEMORY[0x1E4F28D58] indexPathForItem:v25 inSection:0];
                    [v96 addObject:v39];
                    long long v10 = (uint64_t *)MEMORY[0x1E4F63860];
                    if (!*MEMORY[0x1E4F63860]) {
                      id v53 = (id)GKOSLoggers();
                    }
                    long long v11 = (os_log_t *)MEMORY[0x1E4F63838];
                    v54 = (void *)*MEMORY[0x1E4F63838];
                    self = v98;
                    id v8 = v99;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
                    {
                      v73 = NSString;
                      v74 = v54;
                      v75 = [v73 stringWithFormat:@"- MIDDLE 4 - uuid: %@, marking index path row: %@ to refresh", v97, v39];
                      *(_DWORD *)buf = 136315394;
                      v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
                      __int16 v118 = 2112;
                      v119 = v75;
                      _os_log_debug_impl(&dword_1AF250000, v74, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

                      long long v11 = (os_log_t *)MEMORY[0x1E4F63838];
                    }
                    goto LABEL_45;
                  }
                }
                uint64_t v47 = [v36 countByEnumeratingWithState:&v107 objects:v122 count:16];
                if (v47) {
                  continue;
                }
                break;
              }
            }

            self = v98;
            id v8 = v99;
            long long v11 = (os_log_t *)MEMORY[0x1E4F63838];
            long long v10 = (uint64_t *)MEMORY[0x1E4F63860];
          }
        }
        else
        {
          if (!v21) {
            id v32 = (id)GKOSLoggers();
          }
          os_log_t v33 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
          {
            v63 = NSString;
            v64 = v33;
            v65 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:v17];
            v66 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:a3];
            v67 = [v63 stringWithFormat:@"- MIDDLE 6 - should not update status for player: %@ from status %@ to new status: %@", v13, v65, v66];
            *(_DWORD *)buf = 136315394;
            v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
            __int16 v118 = 2112;
            v119 = v67;
            _os_log_debug_impl(&dword_1AF250000, v64, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

            long long v10 = (uint64_t *)MEMORY[0x1E4F63860];
            long long v11 = (os_log_t *)MEMORY[0x1E4F63838];
          }
          if (!*v10) {
            id v34 = (id)GKOSLoggers();
          }
          uint64_t v35 = (void *)*MEMORY[0x1E4F63870];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
          {
            id v36 = v35;
            v37 = [v13 internal];
            v38 = [v37 debugDescription];
            id v39 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:v17];
            int64_t v40 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:a3];
            *(_DWORD *)buf = 138412802;
            v117 = v38;
            __int16 v118 = 2112;
            v119 = v39;
            __int16 v120 = 2112;
            v121 = v40;
            _os_log_impl(&dword_1AF250000, v36, OS_LOG_TYPE_INFO, "Should not update datasource status for player: %@ - from: %@ - to: %@", buf, 0x20u);

            long long v11 = (os_log_t *)MEMORY[0x1E4F63838];
            long long v10 = (uint64_t *)MEMORY[0x1E4F63860];
LABEL_45:
          }
        }
        ++v12;
      }
      while (v12 != v101);
      uint64_t v101 = [v8 countByEnumeratingWithState:&v111 objects:v123 count:16];
    }
    while (v101);
  }

  uint64_t v76 = [v96 count];
  uint64_t v77 = *v10;
  if (v76)
  {
    if (!v77) {
      id v78 = (id)GKOSLoggers();
    }
    os_log_t v79 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG)) {
      -[GKMultiplayerDataSource setStatus:forPlayers:uuid:](v79);
    }
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v80 = v96;
    uint64_t v81 = [v80 countByEnumeratingWithState:&v103 objects:v115 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v104;
      do
      {
        for (uint64_t j = 0; j != v82; ++j)
        {
          if (*(void *)v104 != v83) {
            objc_enumerationMutation(v80);
          }
          uint64_t v85 = *(void *)(*((void *)&v103 + 1) + 8 * j);
          if (!*MEMORY[0x1E4F63860]) {
            id v86 = (id)GKOSLoggers();
          }
          os_log_t v87 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
          {
            v88 = NSString;
            v89 = v87;
            v90 = [v88 stringWithFormat:@"- MIDDLE 8 - uuid: %@, \t\tRefreshing: %@", v97, v85];
            *(_DWORD *)buf = 136315394;
            v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
            __int16 v118 = 2112;
            v119 = v90;
            _os_log_debug_impl(&dword_1AF250000, v89, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

            long long v11 = (os_log_t *)MEMORY[0x1E4F63838];
          }
        }
        uint64_t v82 = [v80 countByEnumeratingWithState:&v103 objects:v115 count:16];
      }
      while (v82);
    }

    v91 = [MEMORY[0x1E4F637E8] shared];
    int v92 = [v91 multiplayerShouldAlwaysReloadCollectionView];

    if (v92) {
      [(GKCollectionViewDataSource *)v98 notifyDidReloadData];
    }
    else {
      [(GKCollectionViewDataSource *)v98 notifyItemsRefreshedAtIndexPaths:v80];
    }
    id v8 = v99;
  }
  else
  {
    if (!v77) {
      id v93 = (id)GKOSLoggers();
    }
    os_log_t v94 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG)) {
      -[GKMultiplayerDataSource setStatus:forPlayers:uuid:](v94);
    }
  }
}

- (void)setStatus:(int64_t)a3 forPlayers:(id)a4 complete:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x1E4F29128] UUID];
  long long v11 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v12 = (id)GKOSLoggers();
  }
  uint64_t v13 = (void *)*MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = NSString;
    log = v13;
    id v24 = [(GKMultiplayerDataSource *)self playersDebugDescription:v8 newStatus:a3];
    id v22 = [(GKMultiplayerDataSource *)self collectionViewDebugDescription];
    os_log_t v23 = [v21 stringWithFormat:@"- START - uuid: %@, %@,\n %@", v10, v24, v22];
    *(_DWORD *)buf = 136315394;
    id v36 = "-[GKMultiplayerDataSource setStatus:forPlayers:complete:]";
    __int16 v37 = 2112;
    v38 = v23;
    _os_log_debug_impl(&dword_1AF250000, log, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);
  }
  if (!*v11) {
    id v14 = (id)GKOSLoggers();
  }
  uint64_t v15 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v16 = v15;
    uint64_t v17 = +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:a3];
    *(_DWORD *)buf = 138412546;
    id v36 = v8;
    __int16 v37 = 2112;
    v38 = v17;
    _os_log_impl(&dword_1AF250000, v16, OS_LOG_TYPE_INFO, "Multiplayer datasource set players: %@ - status:%@", buf, 0x16u);
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  void v31[2] = __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke;
  v31[3] = &unk_1E5F64760;
  v31[4] = self;
  int64_t v34 = a3;
  id v32 = v8;
  id v33 = v10;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_2;
  v26[3] = &unk_1E5F638E8;
  id v29 = v9;
  int64_t v30 = a3;
  v26[4] = self;
  id v27 = v32;
  id v28 = v33;
  id v18 = v9;
  id v19 = v33;
  BOOL v20 = v32;
  [(GKCollectionViewDataSource *)self notifyBatchUpdate:v31 complete:v26];
}

uint64_t __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStatus:*(void *)(a1 + 56) forPlayers:*(void *)(a1 + 40) uuid:*(void *)(a1 + 48)];
}

void __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if ([*(id *)(a1 + 32) shouldRevertStatus:*(void *)(a1 + 64)])
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F63318] * 1000000000.0));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_3;
    v8[3] = &unk_1E5F63350;
    uint64_t v4 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v4;
    dispatch_after(v3, MEMORY[0x1E4F14428], v8);
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v5 = (id)GKOSLoggers();
    }
    uint64_t v6 = (void *)*MEMORY[0x1E4F63838];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
      __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_2_cold_1(a1, v2, v6);
    }
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

void __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_3(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_4;
  v5[3] = &unk_1E5F63350;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 notifyBatchUpdate:v5];
}

uint64_t __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "players", (void)v11);
        int v9 = [v8 containsObject:v7];

        if (v9) {
          [*(id *)(a1 + 40) updateDataStructuresForRemovedPlayer:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) updateParticipants];
}

- (void)setParticipantsWithPlayers:(id)a3 automatchPlayerCount:(int64_t)a4 shouldUpdateAutomatchPlayerCount:(BOOL)a5 andStatuses:(id)a6 complete:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v34 = a6;
  id v30 = a7;
  if (!*MEMORY[0x1E4F63860]) {
    id v12 = (id)GKOSLoggers();
  }
  long long v13 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    long long v14 = NSNumber;
    uint64_t v15 = v13;
    uint64_t v16 = [v14 numberWithInteger:a4];
    *(_DWORD *)buf = 138412802;
    id v47 = v11;
    __int16 v48 = 2112;
    v49 = v16;
    __int16 v50 = 2112;
    id v51 = v34;
    _os_log_impl(&dword_1AF250000, v15, OS_LOG_TYPE_INFO, "players: %@ - automatchCount: %@ - statuses: %@", buf, 0x20u);
  }
  int64_t v32 = a4;
  uint64_t v17 = (void *)MEMORY[0x1E4F636D8];
  id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerDataSource.m", 673, "-[GKMultiplayerDataSource setParticipantsWithPlayers:automatchPlayerCount:shouldUpdateAutomatchPlayerCount:andStatuses:complete:]");
  id v19 = [v17 dispatchGroupWithName:v18];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  id obj = v11;
  uint64_t v20 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v41 + 1) + 8 * v23);
        uint64_t v25 = [(GKMultiplayerDataSource *)self players];
        [v25 indexOfObject:v24];

        uint64_t v26 = [v24 referenceKey];
        id v27 = [v34 objectForKey:v26];

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_3;
        v39[3] = &unk_1E5F63008;
        v39[4] = self;
        v39[5] = v24;
        id v40 = v27;
        id v28 = v27;
        [v19 perform:v39];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v21);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_5;
  v35[3] = &unk_1E5F64FE0;
  BOOL v38 = a5;
  v35[4] = self;
  id v36 = v30;
  int64_t v37 = v32;
  id v29 = v30;
  [v19 notifyOnMainQueueWithBlock:v35];
}

void __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_3(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v10[0] = *(void *)(a1 + 40);
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v6 = [*(id *)(a1 + 48) integerValue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_4;
  v8[3] = &unk_1E5F639B0;
  id v9 = v3;
  id v7 = v3;
  [v4 addPlayers:v5 withStatus:v6 complete:v8];
}

uint64_t __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) setAutomatchPlayerCount:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) updateParticipants];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)revertFailedPlayers
{
  id v2 = NSString;
  id v3 = a1;
  OUTLINED_FUNCTION_7();
  uint64_t v4 = [v2 stringWithFormat:@"- START - uuid: %@"];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1AF250000, v5, v6, "****** - GKCVC - %s \n%@", v7, v8, v9, v10, v11, v12, 2u);
}

- (void)failedToInvitePlayers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSMutableOrderedSet *)a3;
  int v5 = [MEMORY[0x1E4F29128] UUID];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  int v7 = (os_log_t *)MEMORY[0x1E4F63838];
  int v8 = (void *)*MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    -[GKMultiplayerDataSource failedToInvitePlayers:](v8);
  }
  int v9 = [MEMORY[0x1E4F1CA48] array];
  players = v4;
  if (!v4) {
    players = self->_players;
  }
  uint64_t v11 = players;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = [(NSMutableOrderedSet *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([(GKMultiplayerDataSource *)self statusForPlayer:v16] == 1) {
          [v9 addObject:v16];
        }
      }
      uint64_t v13 = [(NSMutableOrderedSet *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
  if ([v9 count])
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v17 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG)) {
      -[GKMultiplayerDataSource failedToInvitePlayers:]();
    }
    [(GKMultiplayerDataSource *)self setStatus:4 forPlayers:v9 complete:0];
  }
}

- (BOOL)canCancelCurrentMatchmaking
{
  id v3 = [(GKMultiplayerDataSource *)self players];
  uint64_t v4 = [v3 count];
  int v5 = [(GKMultiplayerDataSource *)self readyPlayers];
  BOOL v6 = v4 != [v5 count]
    || [(GKMultiplayerDataSource *)self automatchPlayerCount] > 0;

  return v6;
}

- (BOOL)haveNonGuestPlayers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(GKMultiplayerDataSource *)self players];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v6 isGuestPlayer] & 1) == 0 && !objc_msgSend(v6, "isLocalPlayer"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  p_automatchPlayerCountLock = &self->_automatchPlayerCountLock;
  os_unfair_lock_lock(&self->_automatchPlayerCountLock);
  BOOL v6 = [(GKMultiplayerDataSource *)self delegate];
  int v7 = [v6 allowAutoMatch];

  if (v7) {
    int64_t v8 = a3;
  }
  else {
    int64_t v8 = 0;
  }
  self->_automatchPlayerCount = v8;

  os_unfair_lock_unlock(p_automatchPlayerCountLock);
}

- (void)setAutomatchPlayerCount:(int64_t)a3 complete:(id)a4
{
  if (self->_automatchPlayerCount != a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__GKMultiplayerDataSource_setAutomatchPlayerCount_complete___block_invoke;
    v4[3] = &unk_1E5F64DF0;
    v4[4] = self;
    v4[5] = a3;
    [(GKCollectionViewDataSource *)self notifyBatchUpdate:v4 complete:a4];
  }
}

uint64_t __60__GKMultiplayerDataSource_setAutomatchPlayerCount_complete___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAutomatchPlayerCount:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) implicitAutomatchPlayerCount];
  if (v2 > [*(id *)(a1 + 32) automatchPlayerCount]) {
    objc_msgSend(*(id *)(a1 + 32), "setImplicitAutomatchPlayerCount:", objc_msgSend(*(id *)(a1 + 32), "automatchPlayerCount"));
  }
  objc_msgSend(*(id *)(a1 + 32), "setAutomatchPlayersAddedByUser:", objc_msgSend(*(id *)(a1 + 32), "automatchPlayerCount")- objc_msgSend(*(id *)(a1 + 32), "implicitAutomatchPlayerCount"));
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 updateParticipants];
}

- (void)refreshStatusForParticipant:(id)a3
{
  id v17 = a3;
  int v5 = [(GKMultiplayerDataSource *)self delegate];
  int v6 = [v5 isCanceling];

  if (v6)
  {
    int v7 = v17;
    uint64_t v8 = 14;
LABEL_10:
    [v7 setStatus:v8];
    goto LABEL_11;
  }
  if ([v17 type] == 1)
  {
    long long v9 = [(GKMultiplayerDataSource *)self delegate];
    int v10 = [v9 allowAutoMatch];

    if (v10)
    {
      long long v11 = [(GKMultiplayerDataSource *)self delegate];
      objc_msgSend(v17, "setStatus:", objc_msgSend(v11, "automatchParticipantStatus"));

      goto LABEL_11;
    }
    int v7 = v17;
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = [(GKMultiplayerDataSource *)self players];
  uint64_t v13 = [v17 player];
  char v14 = [v12 containsObject:v13];

  if ((v14 & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"GKMultiplayerDataSource.m" lineNumber:795 description:&stru_1F07B2408];
  }
  uint64_t v15 = [v17 player];
  objc_msgSend(v17, "setStatus:", -[GKMultiplayerDataSource statusForPlayer:](self, "statusForPlayer:", v15));

LABEL_11:
}

- (void)didChangeMode
{
  [(GKMultiplayerDataSource *)self refreshParticipantsStatuses];
  id v3 = [(GKMultiplayerDataSource *)self delegate];
  [v3 didUpdateParticipants];
}

- (void)refreshParticipantsStatuses
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(GKMultiplayerDataSource *)self participants];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(GKMultiplayerDataSource *)self refreshStatusForParticipant:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)updateParticipants
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  id v4 = v3;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_6() collectionViewDebugDescription];
  uint64_t v6 = [v2 stringWithFormat:@"- START - uuid: %@, %@", v0, v5];
  v8[0] = 136315394;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_1AF250000, v1, v7, "****** - GKCVC - %s \n%@", (uint8_t *)v8);
}

- (void)replacePlayers:(id)a3 withGKPlayers:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!*MEMORY[0x1E4F63860]) {
    id v11 = (id)GKOSLoggers();
  }
  uint64_t v12 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_1AF250000, v12, OS_LOG_TYPE_INFO, "Replace contactPlayers: %@ \nwith gkPlayers:%@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__GKMultiplayerDataSource_replacePlayers_withGKPlayers_completionHandler___block_invoke;
  v15[3] = &unk_1E5F63E80;
  id v16 = v8;
  id v17 = v9;
  long long v18 = self;
  id v13 = v9;
  id v14 = v8;
  [(GKCollectionViewDataSource *)self notifyBatchUpdate:v15 complete:v10];
}

void __74__GKMultiplayerDataSource_replacePlayers_withGKPlayers_completionHandler___block_invoke(id *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] count];
  if ([a1[5] count] == v2)
  {
    if (v2 >= 1)
    {
      uint64_t v4 = 0;
      *(void *)&long long v3 = 138412290;
      long long v32 = v3;
      uint64_t v33 = v2;
      do
      {
        uint64_t v5 = objc_msgSend(a1[4], "objectAtIndexedSubscript:", v4, v32);
        uint64_t v6 = [a1[6] players];
        uint64_t v7 = [v6 indexOfObject:v5];

        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!*MEMORY[0x1E4F63860]) {
            id v8 = (id)GKOSLoggers();
          }
          id v9 = *MEMORY[0x1E4F63870];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            int64_t v37 = v5;
            _os_log_error_impl(&dword_1AF250000, v9, OS_LOG_TYPE_ERROR, "error: tried to replace a player not in the data source: %@", buf, 0xCu);
          }
        }
        else
        {
          id v10 = [a1[5] objectAtIndexedSubscript:v4];
          id v11 = [a1[6] playerStatus];
          [v5 internal];
          uint64_t v12 = v35 = v5;
          [v12 playerID];
          id v13 = v34 = v7;
          id v14 = [v11 objectForKeyedSubscript:v13];
          uint64_t v15 = [a1[6] playerStatus];
          id v16 = [v10 internal];
          id v17 = [v16 playerID];
          [v15 setObject:v14 forKeyedSubscript:v17];

          long long v18 = v10;
          uint64_t v5 = v35;

          long long v19 = [a1[6] playerStatus];
          id v20 = [v35 internal];
          __int16 v21 = [v20 playerID];
          [v19 removeObjectForKey:v21];

          id v22 = [a1[6] players];
          [v22 replaceObjectAtIndex:v34 withObject:v10];

          uint64_t v23 = [a1[6] orderedPlayerIDList];
          id v24 = [v35 internal];
          uint64_t v25 = [v24 playerID];
          uint64_t v26 = [v23 indexOfObject:v25];

          if (v26 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v27 = [a1[6] orderedPlayerIDList];
            id v28 = [v18 internal];
            id v29 = [v28 playerID];
            [v27 replaceObjectAtIndex:v26 withObject:v29];
          }
          uint64_t v2 = v33;
        }

        ++v4;
      }
      while (v2 != v4);
    }
    [a1[6] updateParticipants];
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v30 = (id)GKOSLoggers();
    }
    long long v31 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      __74__GKMultiplayerDataSource_replacePlayers_withGKPlayers_completionHandler___block_invoke_cold_1(v31);
    }
  }
}

- (void)replacePrepopulatedPlayerWithNormalPlayer:(id)a3 participantServerIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (!*MEMORY[0x1E4F63860]) {
    id v11 = (id)GKOSLoggers();
  }
  uint64_t v12 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v8;
    _os_log_impl(&dword_1AF250000, v12, OS_LOG_TYPE_INFO, "Replace a prepopulated player with normalPlayer:%@", buf, 0xCu);
  }
  id v29 = v8;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = [(GKMultiplayerDataSource *)self players];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
LABEL_7:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v31 != v16) {
        objc_enumerationMutation(v13);
      }
      long long v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
      long long v19 = [v18 internal];
      id v20 = [v19 playerID];
      char v21 = [v20 isEqualToString:v9];

      if (v21) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v15) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    id v22 = v18;

    if (!v22) {
      goto LABEL_16;
    }
    id v35 = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    id v24 = v29;
    id v34 = v29;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v28 replacePlayers:v23 withGKPlayers:v25 completionHandler:v10];
  }
  else
  {
LABEL_13:

LABEL_16:
    id v24 = v29;
    if (!*MEMORY[0x1E4F63860]) {
      id v26 = (id)GKOSLoggers();
    }
    id v27 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v9;
      _os_log_impl(&dword_1AF250000, v27, OS_LOG_TYPE_INFO, "Cannot find matching prepopulated player for participantID: %@", buf, 0xCu);
    }
    if (v10) {
      v10[2](v10);
    }
  }
}

- (void)removePrepopulatedPlayersIfExisted:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v19 = self;
  id v8 = [(GKMultiplayerDataSource *)self players];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = [v13 internal];
        uint64_t v15 = [v14 playerID];
        int v16 = [v6 containsObject:v15];

        if (v16) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v17 = (id)GKOSLoggers();
    }
    long long v18 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_1AF250000, v18, OS_LOG_TYPE_INFO, "found prepopulated players matching removed participants' server identifiers. serverIdentifiers: %@", buf, 0xCu);
    }
    [(GKMultiplayerDataSource *)v19 removePlayers:v7 complete:v20];
  }
}

- (void)clearDataSource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v3 = [(GKMultiplayerDataSource *)self players];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(GKMultiplayerDataSource *)self updateDataStructuresForRemovedPlayer:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(GKMultiplayerDataSource *)self updateParticipants];
}

- (void)restoreOrderOfPlayers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v3 = [(NSMutableOrderedSet *)self->_players valueForKeyPath:@"internal.playerID"];
  [(NSMutableOrderedSet *)self->_orderedPlayerIDList unionOrderedSet:v3];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", -[NSMutableOrderedSet count](self->_players, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_orderedPlayerIDList;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(v3, "indexOfObject:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v11 = [(NSMutableOrderedSet *)self->_players objectAtIndexedSubscript:v10];
          [v4 addObject:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(GKMultiplayerDataSource *)self setPlayers:v4];
}

- (void)reportMultiplayerSelection:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    uint64_t v6 = *MEMORY[0x1E4F63558];
    uint64_t v7 = *MEMORY[0x1E4F63548];
    uint64_t v8 = *MEMORY[0x1E4F63560];
    uint64_t v9 = *MEMORY[0x1E4F63550];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v12 = [v11 contact];

        if (v12)
        {
          long long v13 = [MEMORY[0x1E4F637F8] reporter];
          [v13 reportEvent:v6 type:v7];
        }
        long long v14 = [v11 friendPlayedWith];
        if (v14)
        {
        }
        else
        {
          long long v15 = [v11 friendPlayedNearby];

          if (!v15) {
            goto LABEL_12;
          }
        }
        int v16 = [MEMORY[0x1E4F637F8] reporter];
        [v16 reportEvent:v6 type:v8];

LABEL_12:
        uint64_t v17 = [v11 friendBiDirectional];

        if (v17)
        {
          long long v18 = [MEMORY[0x1E4F637F8] reporter];
          [v18 reportEvent:v6 type:v9];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
}

- (GKMultiplayerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKMultiplayerDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)minPlayers
{
  return self->_minPlayers;
}

- (void)setMinPlayers:(int64_t)a3
{
  self->_NSUInteger minPlayers = a3;
}

- (int64_t)maxPlayers
{
  return self->_maxPlayers;
}

- (void)setMaxPlayers:(int64_t)a3
{
  self->_int64_t maxPlayers = a3;
}

- (int64_t)automatchPlayerCount
{
  return self->_automatchPlayerCount;
}

- (int64_t)implicitAutomatchPlayerCount
{
  return self->_implicitAutomatchPlayerCount;
}

- (void)setImplicitAutomatchPlayerCount:(int64_t)a3
{
  self->_implicitAutomatchPlayerCount = a3;
}

- (BOOL)automatchAddedToMinInHeader
{
  return self->_automatchAddedToMinInHeader;
}

- (void)setAutomatchAddedToMinInHeader:(BOOL)a3
{
  self->_automatchAddedToMinInHeader = a3;
}

- (BOOL)removingEnabled
{
  return self->_removingEnabled;
}

- (void)setRemovingEnabled:(BOOL)a3
{
  self->_removingEnabled = a3;
}

- (BOOL)invitingEnabled
{
  return self->_invitingEnabled;
}

- (void)setInvitingEnabled:(BOOL)a3
{
  self->_invitingEnabled = a3;
}

- (NSMutableOrderedSet)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (BOOL)autoMatching
{
  return self->_autoMatching;
}

- (BOOL)sharePlayEnabled
{
  return self->_sharePlayEnabled;
}

- (void)setSharePlayEnabled:(BOOL)a3
{
  self->_sharePlayEnabled = a3;
}

- (NSSet)selectedMessageGroups
{
  return self->_selectedMessageGroups;
}

- (void)setSelectedMessageGroups:(id)a3
{
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (NSMutableDictionary)playerStatus
{
  return self->_playerStatus;
}

- (void)setPlayerStatus:(id)a3
{
}

- (NSMutableOrderedSet)orderedPlayerIDList
{
  return self->_orderedPlayerIDList;
}

- (void)setOrderedPlayerIDList:(id)a3
{
}

- (int64_t)automatchPlayersAddedByUser
{
  return self->_automatchPlayersAddedByUser;
}

- (void)setAutomatchPlayersAddedByUser:(int64_t)a3
{
  self->_automatchPlayersAddedByUser = a3;
}

- (GKMultiplayerParticipant)placeholderItem
{
  return self->_placeholderItem;
}

- (void)setPlaceholderItem:(id)a3
{
}

- (os_unfair_lock_s)automatchPlayerCountLock
{
  return self->_automatchPlayerCountLock;
}

- (void)setAutomatchPlayerCountLock:(os_unfair_lock_s)a3
{
  self->_automatchPlayerCountLock = a3;
}

- (NSString)pageId
{
  return self->_pageId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageId, 0);
  objc_storeStrong((id *)&self->_placeholderItem, 0);
  objc_storeStrong((id *)&self->_orderedPlayerIDList, 0);
  objc_storeStrong((id *)&self->_playerStatus, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_selectedMessageGroups, 0);
  objc_storeStrong((id *)&self->_players, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addPlayers:withStatus:replaceAutomatches:complete:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  id v4 = v3;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_6() collectionViewDebugDescription];
  uint64_t v6 = [v2 stringWithFormat:@"uuid: %@, %@", v0, v5];
  v8[0] = 136315394;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_1AF250000, v1, v7, "****** - GKCVC - %s \n%@", (uint8_t *)v8);
}

void __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = NSString;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [(id)OUTLINED_FUNCTION_5() collectionViewDebugDescription];
  uint64_t v7 = [v3 stringWithFormat:@"- END - uuid: %@, completed with %@"];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1AF250000, v8, v9, "****** - GKCVC - %s \n%@", v10, v11, v12, v13, v4, (uint64_t)v6, 2u);
}

- (void)removePlayers:complete:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  id v4 = v3;
  id v5 = [(id)OUTLINED_FUNCTION_6() collectionViewDebugDescription];
  uint64_t v6 = [v2 stringWithFormat:@"uuid: %@, %@", v0, v5];
  v8[0] = 136315394;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_1AF250000, v1, v7, "****** - GKCVC - %s \n%@", (uint8_t *)v8);
}

void __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = NSString;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [(id)OUTLINED_FUNCTION_5() collectionViewDebugDescription];
  uint64_t v7 = [v3 stringWithFormat:@"- END - uuid: %@, completed with %@"];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1AF250000, v8, v9, "****** - GKCVC - %s \n%@", v10, v11, v12, v13, v4, (uint64_t)v6, 2u);
}

- (void)setStatus:(void *)a1 forPlayers:uuid:.cold.1(void *a1)
{
  uint64_t v2 = NSString;
  id v3 = a1;
  OUTLINED_FUNCTION_7();
  uint64_t v4 = [v2 stringWithFormat:@"- MIDDLE 9 - uuid: %@, no refresh is needed as index path count is 0"];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1AF250000, v5, v6, "****** - GKCVC - %s \n%@", v7, v8, v9, v10, v11, v12, 2u);
}

- (void)setStatus:(void *)a1 forPlayers:uuid:.cold.2(void *a1)
{
  uint64_t v2 = NSString;
  id v3 = a1;
  OUTLINED_FUNCTION_7();
  uint64_t v4 = [v2 stringWithFormat:@"- MIDDLE 7 - uuid: %@, refreshing index paths:"];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1AF250000, v5, v6, "****** - GKCVC - %s \n%@", v7, v8, v9, v10, v11, v12, 2u);
}

void __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = NSString;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a3;
  int v7 = [(id)OUTLINED_FUNCTION_5() collectionViewDebugDescription];
  int v8 = [v4 stringWithFormat:@"- END - uuid: %@, completed with %@"];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1AF250000, v9, v10, "****** - GKCVC - %s \n%@", v11, v12, v13, v14, v5, (uint64_t)v7, 2u);
}

- (void)failedToInvitePlayers:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  uint64_t v4 = v3;
  uint64_t v5 = [v2 stringWithFormat:@"- END - uuid: %@, failedPlayers: %@", v1, v0];
  v7[0] = 136315394;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_1AF250000, v4, v6, "****** - GKCVC - %s \n%@", (uint8_t *)v7);
}

- (void)failedToInvitePlayers:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = NSString;
  id v3 = a1;
  OUTLINED_FUNCTION_7();
  uint64_t v4 = [v2 stringWithFormat:@"- START - uuid: %@"];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1AF250000, v5, v6, "****** - GKCVC - %s \n%@", v7, v8, v9, v10, v11, v12, 2u);
}

void __74__GKMultiplayerDataSource_replacePlayers_withGKPlayers_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "replacePlayers: error: number of contact players and normal players doesn't match, can't replace!", v1, 2u);
}

@end