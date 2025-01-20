@interface GKLeaderboard
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)leaderboardEntriesHandlerForGroup:(id)a3 gameBundleID:(id)a4 proxy:(id)a5 done:(id)a6;
+ (void)loadCategoriesWithCompletionHandler:(void *)completionHandler;
+ (void)loadHighlightsWithPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 game:(id)a5 handler:(id)a6;
+ (void)loadHighlightsWithPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 handler:(id)a5;
+ (void)loadLeaderboardWithIdentifier:(id)a3 forGame:(id)a4 withPlayer:(id)a5 withCompletionHandler:(id)a6;
+ (void)loadLeaderboardsForGame:(id)a3 forSet:(id)a4 withPlayer:(id)a5 withCompletionHandler:(id)a6;
+ (void)loadLeaderboardsForGame:(id)a3 withCompletionHandler:(id)a4;
+ (void)loadLeaderboardsForGame:(id)a3 withPlayer:(id)a4 withCompletionHandler:(id)a5;
+ (void)loadLeaderboardsWithCompletionHandler:(void *)completionHandler;
+ (void)loadLeaderboardsWithIDs:(NSArray *)leaderboardIDs completionHandler:(void *)completionHandler;
+ (void)loadLeaderboardsWithIDs:(id)a3 game:(id)a4 completionHandler:(id)a5;
+ (void)loadLeaderboardsWithIDs:(id)a3 setIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)loadLeaderboardsWithIDs:(id)a3 setIdentifier:(id)a4 game:(id)a5 completionHandler:(id)a6;
+ (void)setDefaultLeaderboard:(NSString *)leaderboardIdentifier withCompletionHandler:(void *)completionHandler;
+ (void)submitScore:(NSInteger)score context:(NSUInteger)context player:(GKPlayer *)player leaderboardIDs:(NSArray *)leaderboardIDs completionHandler:(void *)completionHandler;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoading;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKLeaderboard)init;
- (GKLeaderboard)initWithInternalRepresentation:(id)a3;
- (GKLeaderboard)initWithPlayerIDs:(NSArray *)playerIDs;
- (GKLeaderboard)initWithPlayers:(NSArray *)players;
- (GKLeaderboardDelegate)delegate;
- (GKLeaderboardInternal)internal;
- (GKLeaderboardPlayerScope)playerScope;
- (GKLeaderboardTimeScope)timeScope;
- (GKScore)localPlayerScore;
- (NSArray)players;
- (NSArray)scores;
- (NSRange)range;
- (NSTimeInterval)duration;
- (id)creator;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)scoreRequestForGame:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int)loadingCount;
- (os_unfair_lock_s)lock;
- (unint64_t)hash;
- (void)decrementLoadingCountAtomically;
- (void)deleteWithHandler:(id)a3;
- (void)endWithHandler:(id)a3;
- (void)incrementLoadingCountAtomically;
- (void)loadEntriesForPlayerScope:(GKLeaderboardPlayerScope)playerScope timeScope:(GKLeaderboardTimeScope)timeScope range:(NSRange)range completionHandler:(void *)completionHandler;
- (void)loadEntriesForPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 range:(_NSRange)a5 locale:(id)a6 completionHandler:(id)a7;
- (void)loadEntriesForPlayers:(NSArray *)players timeScope:(GKLeaderboardTimeScope)timeScope completionHandler:(void *)completionHandler;
- (void)loadEntriesForPlayers:(id)a3 timeScope:(int64_t)a4 locale:(id)a5 completionHandler:(id)a6;
- (void)loadEntriesWithGameDescriptor:(id)a3 fetchOptions:(unint64_t)a4 playerScope:(int64_t)a5 timeScope:(int64_t)a6 range:(_NSRange)a7 completionHandler:(id)a8;
- (void)loadEntriesWithGameDescriptor:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 range:(_NSRange)a6 completionHandler:(id)a7;
- (void)loadEntriesWithGameDescriptor:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 range:(_NSRange)a6 locale:(id)a7 completionHandler:(id)a8;
- (void)loadPreviousOccurrenceWithCompletionHandler:(void *)completionHandler;
- (void)loadPreviousOccurrenceWithGameDescriptor:(id)a3 completionHandler:(id)a4;
- (void)loadScoresForGame:(id)a3 withCompletionHandler:(id)a4;
- (void)loadScoresForRequest:(id)a3 handler:(id)a4;
- (void)loadScoresWithCompletionHandler:(void *)completionHandler;
- (void)loadSummaryWithTimeScope:(int64_t)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInternal:(id)a3;
- (void)setLoadingCount:(int)a3;
- (void)setLocalPlayerScore:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPlayerScope:(GKLeaderboardPlayerScope)playerScope;
- (void)setPlayers:(id)a3;
- (void)setRange:(NSRange)range;
- (void)setScores:(id)a3;
- (void)setTimeScope:(GKLeaderboardTimeScope)timeScope;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)startWithHandler:(id)a3;
- (void)submitScore:(NSInteger)score context:(NSUInteger)context player:(GKPlayer *)player completionHandler:(void *)completionHandler;
@end

@implementation GKLeaderboard

- (GKLeaderboard)initWithInternalRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboard;
  v6 = [(GKLeaderboard *)&v9 init];
  v7 = (GKLeaderboard *)v6;
  if (v6)
  {
    *((_OWORD *)v6 + 2) = xmmword_1C2EBCF60;
    *(_OWORD *)(v6 + 72) = xmmword_1C2EBCF70;
    objc_storeStrong((id *)v6 + 6, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (GKLeaderboard)init
{
  v3 = +[GKInternalRepresentation internalRepresentation];
  v4 = [(GKLeaderboard *)self initWithInternalRepresentation:v3];

  return v4;
}

- (GKLeaderboard)initWithPlayers:(NSArray *)players
{
  id v5 = players;
  if (!v5 && GKApplicationLinkedOnOrAfter(393216, 0)) {
    [MEMORY[0x1E4F1CA00] raise:@"GKInvalidParameter" format:@"players argument is nil -- you must pass a valid player array to -[GKLeaderboard initWithPlayers:]. Or use -[GKLeaderboard init] instead."];
  }
  v6 = +[GKInternalRepresentation internalRepresentation];
  v7 = [(GKLeaderboard *)self initWithInternalRepresentation:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_players, players);
  }

  return v7;
}

- (GKLeaderboard)initWithPlayerIDs:(NSArray *)playerIDs
{
  v4 = [(NSArray *)playerIDs _gkIncompletePlayersFromPlayerIDs];
  id v5 = [(GKLeaderboard *)self initWithPlayers:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    GKLeaderboardTimeScope v6 = [(GKLeaderboard *)self timeScope];
    if (v6 == [v5 timeScope])
    {
      GKLeaderboardPlayerScope v7 = [(GKLeaderboard *)self playerScope];
      if (v7 == [v5 playerScope])
      {
        uint64_t v8 = [(GKLeaderboard *)self range];
        uint64_t v10 = v9;
        char v12 = 0;
        if (v8 != [v5 range] || v10 != v11) {
          goto LABEL_11;
        }
        v13 = [(GKLeaderboard *)self identifier];
        v14 = [v5 identifier];
        int v15 = [v13 isEqual:v14];

        if (v15)
        {
          v16 = [(GKLeaderboard *)self players];
          uint64_t v17 = [v5 players];
          if (v16 == (void *)v17)
          {
            char v12 = 1;
            v18 = v16;
          }
          else
          {
            v18 = (void *)v17;
            v19 = [(GKLeaderboard *)self players];
            v20 = [v5 players];
            char v12 = [v19 isEqual:v20];
          }
          goto LABEL_11;
        }
      }
    }
    char v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(GKLeaderboard *)self identifier];
  uint64_t v4 = [v3 hash];

  GKLeaderboardTimeScope v5 = [(GKLeaderboard *)self timeScope];
  uint64_t v6 = v5 ^ [(GKLeaderboard *)self playerScope] ^ v4;
  uint64_t v7 = [(GKLeaderboard *)self range];
  [(GKLeaderboard *)self range];
  return v6 ^ v7 ^ v8;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)GKLeaderboard;
  uint64_t v4 = [(GKLeaderboard *)&v14 description];
  GKLeaderboardTimeScope v5 = [(GKLeaderboard *)self baseLeaderboardID];
  uint64_t v6 = [(GKLeaderboard *)self title];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKLeaderboard type](self, "type"));
  uint64_t v8 = [(GKLeaderboard *)self startDate];
  uint64_t v9 = [(GKLeaderboard *)self nextStartDate];
  uint64_t v10 = NSNumber;
  [(GKLeaderboard *)self duration];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  char v12 = [v3 stringWithFormat:@"%@ baseLeaderboardID:%@ title:%@ type:%@ startDate:%@ nextStartDate:%@ duration:%@", v4, v5, v6, v7, v8, v9, v11];

  return v12;
}

- (void)setRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v6 = [(GKLeaderboard *)self players];

  if (!v6)
  {
    if (!location || length >= 0x65)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C4A8];
      uint64_t v9 = +[GCFLocalizedStrings LEADERBOARD_RANGE_LIMITS_EXECPTION];
      objc_msgSend(v7, "raise:format:", v8, v9, location, length, 1, 100);
    }
    self->_range.NSUInteger location = location;
    self->_range.NSUInteger length = length;
  }
}

- (NSRange)range
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;
  os_unfair_lock_unlock(p_lock);
  NSUInteger v6 = location;
  NSUInteger v7 = length;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (BOOL)isLoading
{
  return self->_loadingCount != 0;
}

- (NSTimeInterval)duration
{
  v2 = [(GKLeaderboard *)self internal];
  [v2 duration];
  double v4 = v3;

  int v5 = GKApplicationLinkedOnOrAfter(918016, 721152);
  NSTimeInterval result = v4 / 1000.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (void)loadScoresWithCompletionHandler:(void *)completionHandler
{
  double v4 = completionHandler;
  id v5 = +[GKGame currentGame];
  [(GKLeaderboard *)self loadScoresForGame:v5 withCompletionHandler:v4];
}

- (id)scoreRequestForGame:(id)a3
{
  id v4 = a3;
  id v5 = [(GKLeaderboard *)self players];
  NSUInteger v6 = [v5 _gkInternalsFromPlayers];

  NSUInteger v7 = [(GKLeaderboard *)self players];
  if (v7)
  {
    +[GKLeaderboardScoreRequest requestForPlayerInternals:v6];
  }
  else
  {
    uint64_t v8 = [(GKLeaderboard *)self range];
    +[GKLeaderboardScoreRequest requestForRankRange:](GKLeaderboardScoreRequest, "requestForRankRange:", v8, v9);
  uint64_t v10 = };

  uint64_t v11 = +[GKLocalPlayer localPlayer];
  char v12 = [v11 internal];
  v13 = [v12 minimalInternal];
  [v10 setPlayerInternal:v13];

  objc_super v14 = [v4 bundleIdentifier];

  [v10 setGameBundleID:v14];
  int v15 = [(GKLeaderboard *)self identifier];
  [v10 setIdentifier:v15];

  v16 = [(GKLeaderboard *)self groupIdentifier];
  [v10 setGroupIdentifier:v16];

  objc_msgSend(v10, "setTimeScope:", -[GKLeaderboard timeScope](self, "timeScope"));
  objc_msgSend(v10, "setFriendsOnly:", -[GKLeaderboard playerScope](self, "playerScope") == GKLeaderboardPlayerScopeFriendsOnly);

  return v10;
}

- (void)loadScoresForRequest:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[GKDaemonProxy proxyForLocalPlayer];
  NSUInteger v7 = [v8 gameStatService];
  [v7 getLeaderboardForRequest:v6 handler:v5];
}

- (void)loadScoresForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(GKLeaderboard *)self incrementLoadingCountAtomically];
  id v8 = [(GKLeaderboard *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 leaderboardDidBeginLoading:self];
  }
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 210, "-[GKLeaderboard loadScoresForGame:withCompletionHandler:]");
  uint64_t v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E646D9A0;
  v18[4] = self;
  id v19 = v6;
  id v11 = v10;
  id v20 = v11;
  id v12 = v6;
  [v11 perform:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_4;
  v15[3] = &unk_1E646E578;
  id v16 = v11;
  id v17 = v7;
  v15[4] = self;
  id v13 = v11;
  id v14 = v7;
  [v13 notifyOnMainQueueWithBlock:v15];
}

void __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] scoreRequestForGame:a1[5]];
  id v5 = a1[4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E646E550;
  v8[4] = v5;
  id v9 = a1[5];
  id v10 = v4;
  id v11 = a1[6];
  id v12 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 loadScoresForRequest:v7 handler:v8];
}

void __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setInternal:v5];
    id v7 = [v5 scores];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = [v5 scores];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_3;
      v19[3] = &unk_1E646E528;
      id v20 = *(id *)(a1 + 40);
      id v10 = [v9 _gkMapConcurrentlyWithBlock:v19];
    }
    else
    {
      id v10 = 0;
    }
    [*(id *)(a1 + 32) setScores:v10];
    id v11 = [v5 playerScore];

    if (!v11
      || (id v12 = [GKScore alloc],
          [v5 playerScore],
          id v13 = objc_claimAutoreleasedReturnValue(),
          id v14 = [(GKScore *)v12 initWithInternalRepresentation:v13],
          v13,
          [(GKScore *)v14 setGame:*(void *)(a1 + 40)],
          !v14))
    {
      if (GKApplicationLinkedOnOrAfter(262656, 657920))
      {
        id v14 = 0;
      }
      else
      {
        int v15 = +[GKInternalRepresentation internalRepresentation];
        id v16 = [*(id *)(a1 + 48) identifier];
        [v15 setLeaderboardIdentifier:v16];

        id v17 = [*(id *)(a1 + 48) groupIdentifier];
        [v15 setGroupLeaderboardIdentifier:v17];

        v18 = [*(id *)(a1 + 48) playerInternal];
        [v15 setPlayer:v18];

        id v14 = [[GKScore alloc] initWithInternalRepresentation:v15];
      }
    }
    [*(id *)(a1 + 32) setLocalPlayerScore:v14];
  }
  [*(id *)(a1 + 56) setError:v6];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

GKScore *__57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[GKScore alloc] initWithInternalRepresentation:v3];

  [(GKScore *)v4 setGame:*(void *)(a1 + 32)];

  return v4;
}

void __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) decrementLoadingCountAtomically];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 leaderboardDidFinishLoading:*(void *)(a1 + 32)];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) scores];
    id v6 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
  }
}

+ (void)loadCategoriesWithCompletionHandler:(void *)completionHandler
{
  char v3 = completionHandler;
  id v4 = +[GKGame currentGame];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__GKLeaderboard_loadCategoriesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E646E5A0;
  id v7 = v3;
  id v5 = v3;
  +[GKLeaderboard loadLeaderboardsForGame:v4 withCompletionHandler:v6];
}

void __53__GKLeaderboard_loadCategoriesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v16 = [v15 identifier];
        if (v16)
        {
          id v17 = (void *)v16;
          v18 = [v15 localizedTitle];

          if (v18)
          {
            id v19 = [v15 identifier];
            [v8 addObject:v19];

            id v20 = [v15 localizedTitle];
            [v9 addObject:v20];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    (*(void (**)(uint64_t, void *, void *, id))(v21 + 16))(v21, v8, v9, v6);
  }
}

+ (void)loadLeaderboardsWithCompletionHandler:(void *)completionHandler
{
  char v3 = completionHandler;
  id v4 = +[GKGame currentGame];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__GKLeaderboard_loadLeaderboardsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E646E5A0;
  id v7 = v3;
  id v5 = v3;
  +[GKLeaderboard loadLeaderboardsForGame:v4 withCompletionHandler:v6];
}

void __55__GKLeaderboard_loadLeaderboardsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    if (v8)
    {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v8);
    }
    else if (v12)
    {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v12, 0);
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
    }
  }
}

+ (void)loadLeaderboardsForGame:(id)a3 forSet:(id)a4 withPlayer:(id)a5 withCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 309, "+[GKLeaderboard loadLeaderboardsForGame:forSet:withPlayer:withCompletionHandler:]");
    id v14 = +[GKDispatchGroup dispatchGroupWithName:v13];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke;
    v25[3] = &unk_1E646E5C8;
    id v26 = v9;
    id v15 = v11;
    id v27 = v15;
    id v28 = v10;
    id v16 = v14;
    id v29 = v16;
    [v16 perform:v25];
    if ([v15 isLocalPlayer])
    {
      id v17 = v15;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_3;
      v22[3] = &unk_1E646D928;
      id v23 = v17;
      id v24 = v16;
      [v24 perform:v22];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_5;
    v19[3] = &unk_1E646E198;
    id v20 = v16;
    id v21 = v12;
    id v18 = v16;
    [v18 notifyOnMainQueueWithBlock:v19];
  }
}

void __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  id v6 = [a1[4] gameDescriptor];
  id v7 = [a1[5] internal];
  id v8 = [a1[6] identifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E646DC78;
  id v11 = a1[7];
  id v12 = v3;
  id v9 = v3;
  [v5 getLeaderboardsForGameDescriptor:v6 player:v7 setIdentifier:v8 handler:v10];
}

uint64_t __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"results"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E646E5F0;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 loadDefaultLeaderboardIdentifierWithCompletionHandler:v6];
}

uint64_t __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:@"default"];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"default"];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"results"];
  if ([v3 count])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_6;
    id v12 = &unk_1E646E618;
    id v13 = v2;
    id v14 = &v15;
    id v4 = [v3 _gkMapConcurrentlyWithBlock:&v9];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = v16[3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v4 objectAtIndex:v16[3]];
  }
  id v8 = objc_msgSend(*(id *)(a1 + 32), "error", v9, v10, v11, v12);
  (*(void (**)(uint64_t, void *, void *, void *))(v5 + 16))(v5, v4, v7, v8);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
  _Block_object_dispose(&v15, 8);
  }
}

GKLeaderboard *__81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [[GKLeaderboard alloc] initWithInternalRepresentation:v5];

  id v7 = [(GKLeaderboard *)v6 identifier];
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
  }
  else
  {
    id v8 = [(GKLeaderboard *)v6 groupIdentifier];
    int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

    if (!v9) {
      goto LABEL_5;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
LABEL_5:

  return v6;
}

+ (void)loadLeaderboardWithIdentifier:(id)a3 forGame:(id)a4 withPlayer:(id)a5 withCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 357, "+[GKLeaderboard loadLeaderboardWithIdentifier:forGame:withPlayer:withCompletionHandler:]");
    id v14 = +[GKDispatchGroup dispatchGroupWithName:v13];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke;
    v20[3] = &unk_1E646E5C8;
    id v21 = v10;
    id v22 = v11;
    id v23 = v9;
    id v15 = v14;
    id v24 = v15;
    [v15 perform:v20];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke_3;
    v17[3] = &unk_1E646DC30;
    id v18 = v15;
    id v19 = v12;
    id v16 = v15;
    [v16 notifyOnMainQueueWithBlock:v17];
  }
}

void __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  uint64_t v6 = [a1[4] gameDescriptor];
  id v7 = [a1[5] internal];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E646E640;
  id v10 = a1[6];
  id v11 = a1[7];
  id v12 = v3;
  id v8 = v3;
  [v5 getLeaderboardsForGameDescriptor:v6 player:v7 setIdentifier:0 handler:v9];
}

void __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "groupIdentifier", (void)v18);
        if ([v13 isEqualToString:*(void *)(a1 + 32)])
        {

LABEL_12:
          id v16 = *(void **)(a1 + 40);
          uint64_t v17 = [[GKLeaderboard alloc] initWithInternalRepresentation:v12];
          [v16 setObject:v17 forKeyedSubscript:@"leaderboard"];

          goto LABEL_13;
        }
        id v14 = [v12 identifier];
        int v15 = [v14 isEqualToString:*(void *)(a1 + 32)];

        if (v15) {
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  [*(id *)(a1 + 40) setError:v6];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"leaderboard"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

+ (void)loadLeaderboardsForGame:(id)a3 withPlayer:(id)a4 withCompletionHandler:(id)a5
{
}

+ (void)loadLeaderboardsForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKLocalPlayer localPlayer];
  +[GKLeaderboard loadLeaderboardsForGame:v6 withPlayer:v7 withCompletionHandler:v5];
}

- (void)incrementLoadingCountAtomically
{
}

- (void)decrementLoadingCountAtomically
{
}

+ (void)setDefaultLeaderboard:(NSString *)leaderboardIdentifier withCompletionHandler:(void *)completionHandler
{
  id v5 = completionHandler;
  id v6 = leaderboardIdentifier;
  id v7 = +[GKLocalPlayer localPlayer];
  [v7 setDefaultLeaderboardIdentifier:v6 completionHandler:v5];
}

+ (void)loadLeaderboardsWithIDs:(NSArray *)leaderboardIDs completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  id v7 = leaderboardIDs;
  id v8 = +[GKGame currentGame];
  [a1 loadLeaderboardsWithIDs:v7 game:v8 completionHandler:v6];
}

+ (void)loadLeaderboardsWithIDs:(id)a3 game:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__GKLeaderboard_loadLeaderboardsWithIDs_game_completionHandler___block_invoke;
  v10[3] = &unk_1E646DCF0;
  id v11 = v8;
  id v9 = v8;
  [a1 loadLeaderboardsWithIDs:a3 setIdentifier:0 game:a4 completionHandler:v10];
}

void __64__GKLeaderboard_loadLeaderboardsWithIDs_game_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

+ (void)loadLeaderboardsWithIDs:(id)a3 setIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[GKGame currentGame];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_1E646DCF0;
  id v14 = v8;
  id v12 = v8;
  [a1 loadLeaderboardsWithIDs:v10 setIdentifier:v9 game:v11 completionHandler:v13];
}

void __73__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

+ (void)loadLeaderboardsWithIDs:(id)a3 setIdentifier:(id)a4 game:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 446, "+[GKLeaderboard loadLeaderboardsWithIDs:setIdentifier:game:completionHandler:]");
  id v14 = +[GKDispatchGroup dispatchGroupWithName:v13];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke;
  v24[3] = &unk_1E646E5C8;
  id v25 = v9;
  id v26 = v11;
  id v27 = v10;
  id v15 = v14;
  id v28 = v15;
  id v16 = v10;
  id v17 = v11;
  id v18 = v9;
  [v15 perform:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_4;
  v21[3] = &unk_1E646DC30;
  id v22 = v15;
  id v23 = v12;
  id v19 = v15;
  id v20 = v12;
  [v19 notifyOnMainQueueWithBlock:v21];
}

void __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v6 = [v5 gameStatService];
  uint64_t v7 = [*(id *)(a1 + 40) gameDescriptor];
  id v8 = +[GKLocalPlayer local];
  id v9 = [v8 internal];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_2;
  v12[3] = &unk_1E646DC78;
  uint64_t v10 = *(void *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = v3;
  id v11 = v3;
  [v6 getLeaderboardsForGameDescriptor:v7 player:v9 leaderboardIDs:v4 setIdentifier:v10 handler:v12];
}

void __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 count])
  {
    id v6 = [v7 _gkMapWithBlock:&__block_literal_global_18];
    [*(id *)(a1 + 32) setResult:v6];
  }
  [*(id *)(a1 + 32) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

GKLeaderboard *__78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKLeaderboard alloc] initWithInternalRepresentation:v2];

  return v3;
}

void __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)loadPreviousOccurrenceWithGameDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 470, "-[GKLeaderboard loadPreviousOccurrenceWithGameDescriptor:completionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke;
  v17[3] = &unk_1E646D9A0;
  void v17[4] = self;
  id v18 = v6;
  id v10 = v9;
  id v19 = v10;
  id v11 = v6;
  [v10 perform:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke_3;
  v14[3] = &unk_1E646DC30;
  id v15 = v10;
  id v16 = v7;
  id v12 = v10;
  id v13 = v7;
  [v12 notifyOnMainQueueWithBlock:v14];
}

void __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  id v6 = [*(id *)(a1 + 32) internal];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = +[GKLocalPlayer local];
  id v9 = [v8 internal];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke_2;
  v11[3] = &unk_1E646E688;
  id v12 = *(id *)(a1 + 48);
  id v13 = v3;
  id v10 = v3;
  [v5 getPreviousInstanceForLeaderboard:v6 gameDescriptor:v7 player:v9 handler:v11];
}

void __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    id v5 = a2;
    id v6 = [[GKLeaderboard alloc] initWithInternalRepresentation:v5];

    [*(id *)(a1 + 32) setResult:v6];
  }
  [*(id *)(a1 + 32) setError:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)loadPreviousOccurrenceWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 491, "-[GKLeaderboard loadPreviousOccurrenceWithCompletionHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E646D928;
  void v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  [v7 perform:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E646DC30;
  id v11 = v7;
  id v12 = v4;
  id v8 = v7;
  id v9 = v4;
  [v8 notifyOnMainQueueWithBlock:v10];
}

void __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  id v6 = [*(id *)(a1 + 32) internal];
  id v7 = +[GKGame currentGame];
  id v8 = [v7 gameDescriptor];
  id v9 = +[GKLocalPlayer local];
  id v10 = [v9 internal];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E646E688;
  id v13 = *(id *)(a1 + 40);
  id v14 = v3;
  id v11 = v3;
  [v5 getPreviousInstanceForLeaderboard:v6 gameDescriptor:v8 player:v10 handler:v12];
}

void __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    id v5 = a2;
    id v6 = [[GKLeaderboard alloc] initWithInternalRepresentation:v5];

    [*(id *)(a1 + 32) setResult:v6];
  }
  [*(id *)(a1 + 32) setError:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

+ (void)submitScore:(NSInteger)score context:(NSUInteger)context player:(GKPlayer *)player leaderboardIDs:(NSArray *)leaderboardIDs completionHandler:(void *)completionHandler
{
  id v11 = player;
  id v12 = leaderboardIDs;
  id v13 = completionHandler;
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 516, "+[GKLeaderboard submitScore:context:player:leaderboardIDs:completionHandler:]");
  id v15 = +[GKDispatchGroup dispatchGroupWithName:v14];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke;
  v22[3] = &unk_1E646E6B0;
  NSInteger v26 = score;
  NSUInteger v27 = context;
  id v16 = v12;
  id v23 = v16;
  id v17 = v11;
  id v24 = v17;
  id v18 = v15;
  id v25 = v18;
  [v18 perform:v22];
  if (v13)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke_3;
    v19[3] = &unk_1E646DC30;
    id v21 = v13;
    id v20 = v18;
    [v20 notifyOnMainQueueWithBlock:v19];
  }
}

void __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) internal];
  id v8 = v7;
  if (!v7)
  {
    id v12 = +[GKLocalPlayer local];
    id v8 = [v12 internal];
  }
  id v9 = +[GKGame currentGame];
  id v10 = [v9 gameDescriptor];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke_2;
  v15[3] = &unk_1E646D978;
  id v16 = *(id *)(a1 + 48);
  id v17 = v3;
  id v11 = v3;
  [v5 submitScore:v14 context:v13 leaderboardIDs:v6 forPlayer:v8 whileScreeningChallenges:0 withEligibleChallenges:0 gameDescriptor:v10 handler:v15];

  if (!v7)
  {
  }
}

uint64_t __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)submitScore:(NSInteger)score context:(NSUInteger)context player:(GKPlayer *)player completionHandler:(void *)completionHandler
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = player;
  id v11 = completionHandler;
  if ([(GKLeaderboard *)self type])
  {
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 548, "-[GKLeaderboard submitScore:context:player:completionHandler:]");
    uint64_t v13 = +[GKDispatchGroup dispatchGroupWithName:v12];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke;
    v19[3] = &unk_1E646E6B0;
    NSInteger v22 = score;
    NSUInteger v23 = context;
    void v19[4] = self;
    id v20 = v10;
    id v14 = v13;
    id v21 = v14;
    [v14 perform:v19];
    if (v11)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke_3;
      v16[3] = &unk_1E646DC30;
      id v18 = v11;
      id v17 = v14;
      [v17 notifyOnMainQueueWithBlock:v16];
    }
  }
  else
  {
    id v14 = [(GKLeaderboard *)self baseLeaderboardID];
    v24[0] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    +[GKLeaderboard submitScore:score context:context player:v10 leaderboardIDs:v15 completionHandler:v11];
  }
}

void __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = [*(id *)(a1 + 32) internal];
  id v9 = [*(id *)(a1 + 40) internal];
  id v10 = v9;
  if (!v9)
  {
    id v12 = +[GKLocalPlayer local];
    id v10 = [v12 internal];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke_2;
  v13[3] = &unk_1E646D978;
  id v14 = *(id *)(a1 + 48);
  id v15 = v3;
  id v11 = v3;
  [v5 submitInstanceScore:v6 context:v7 leaderboard:v8 forPlayer:v10 whileScreeningChallenges:0 withEligibleChallenges:0 handler:v13];
  if (!v9)
  {
  }
}

uint64_t __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)loadEntriesForPlayerScope:(GKLeaderboardPlayerScope)playerScope timeScope:(GKLeaderboardTimeScope)timeScope range:(NSRange)range completionHandler:(void *)completionHandler
{
}

- (void)loadEntriesForPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 range:(_NSRange)a5 locale:(id)a6 completionHandler:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v19 = a6;
  id v13 = a7;
  if (!location || length >= 0x65)
  {
    id v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C4A8];
    id v16 = +[GCFLocalizedStrings LEADERBOARD_RANGE_LIMITS_EXECPTION];
    objc_msgSend(v14, "raise:format:", v15, v16, location, length, 1, 100);
  }
  id v17 = +[GKGame currentGame];
  id v18 = [v17 gameDescriptor];
  -[GKLeaderboard loadEntriesWithGameDescriptor:playerScope:timeScope:range:locale:completionHandler:](self, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:locale:completionHandler:", v18, a3, a4, location, length, v19, v13);
}

- (void)loadEntriesWithGameDescriptor:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 range:(_NSRange)a6 completionHandler:(id)a7
{
}

+ (id)leaderboardEntriesHandlerForGroup:(id)a3 gameBundleID:(id)a4 proxy:(id)a5 done:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__GKLeaderboard_leaderboardEntriesHandlerForGroup_gameBundleID_proxy_done___block_invoke;
  v13[3] = &unk_1E646E6F8;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = _Block_copy(v13);

  return v11;
}

void __75__GKLeaderboard_leaderboardEntriesHandlerForGroup_gameBundleID_proxy_done___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  if (a5)
  {
    [*(id *)(a1 + 32) setError:a5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v11 = [NSNumber numberWithInteger:a4];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"totalPlayerCount"];

    id v12 = [MEMORY[0x1E4F1CA48] array];
    id v13 = [v9 player];
    id v14 = [v13 playerID];

    if (v14)
    {
      id v15 = [v9 player];
      id v16 = [v15 playerID];
      [v12 addObject:v16];
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v31 = v10;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          NSInteger v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          NSUInteger v23 = [v22 player];
          id v24 = [v23 playerID];

          if (v24)
          {
            id v25 = [v22 player];
            NSInteger v26 = [v25 playerID];
            [v12 addObject:v26];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }

    if (v9)
    {
      NSUInteger v27 = [[GKLeaderboardEntry alloc] initWithInternalRepresentation:v9];
      [*(id *)(a1 + 32) setObject:v27 forKeyedSubscript:@"localPlayerEntry"];
    }
    uint64_t v28 = [v17 _gkMapWithBlock:&__block_literal_global_66_0];
    id v29 = (void *)v28;
    if (v28) {
      uint64_t v30 = v28;
    }
    else {
      uint64_t v30 = MEMORY[0x1E4F1CBF0];
    }
    [*(id *)(a1 + 32) setObject:v30 forKeyedSubscript:@"entries"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v10 = v31;
  }
}

GKLeaderboardEntry *__75__GKLeaderboard_leaderboardEntriesHandlerForGroup_gameBundleID_proxy_done___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKLeaderboardEntry alloc] initWithInternalRepresentation:v2];

  return v3;
}

- (void)loadEntriesWithGameDescriptor:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 range:(_NSRange)a6 locale:(id)a7 completionHandler:(id)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 652, "-[GKLeaderboard loadEntriesWithGameDescriptor:playerScope:timeScope:range:locale:completionHandler:]");
  uint64_t v18 = +[GKDispatchGroup dispatchGroupWithName:v17];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __100__GKLeaderboard_loadEntriesWithGameDescriptor_playerScope_timeScope_range_locale_completionHandler___block_invoke;
  v27[3] = &unk_1E646E720;
  v27[4] = self;
  id v28 = v14;
  int64_t v32 = a5;
  NSUInteger v33 = location;
  NSUInteger v34 = length;
  int64_t v31 = a4;
  id v29 = v15;
  id v19 = v18;
  id v30 = v19;
  id v20 = v15;
  id v21 = v14;
  [v19 perform:v27];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __100__GKLeaderboard_loadEntriesWithGameDescriptor_playerScope_timeScope_range_locale_completionHandler___block_invoke_2;
  v24[3] = &unk_1E646DC30;
  id v25 = v19;
  id v26 = v16;
  id v22 = v19;
  id v23 = v16;
  [v22 notifyOnMainQueueWithBlock:v24];
}

void __100__GKLeaderboard_loadEntriesWithGameDescriptor_playerScope_timeScope_range_locale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = +[GKDaemonProxy proxyForLocalPlayer];
  id v14 = [v15 gameStatService];
  id v12 = [*(id *)(a1 + 32) internal];
  uint64_t v13 = *(void *)(a1 + 40);
  id v4 = +[GKLocalPlayer local];
  id v5 = [v4 internal];
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 40) bundleIdentifier];
  id v11 = +[GKLeaderboard leaderboardEntriesHandlerForGroup:v9 gameBundleID:v10 proxy:v15 done:v3];

  objc_msgSend(v14, "getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:handler:", v12, v13, v5, v7, v6, *(void *)(a1 + 80), *(void *)(a1 + 88), 0, v8, v11);
}

void __100__GKLeaderboard_loadEntriesWithGameDescriptor_playerScope_timeScope_range_locale_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) error];

    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (v2)
    {
      id v7 = [v3 error];
      (*(void (**)(uint64_t, void, void, void))(v4 + 16))(v4, 0, 0, 0);
    }
    else
    {
      id v7 = [v3 objectForKeyedSubscript:@"localPlayerEntry"];
      id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"entries"];
      uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"totalPlayerCount"];
      (*(void (**)(uint64_t, id, void *, uint64_t, void))(v4 + 16))(v4, v7, v5, [v6 integerValue], 0);
    }
  }
}

- (void)loadEntriesWithGameDescriptor:(id)a3 fetchOptions:(unint64_t)a4 playerScope:(int64_t)a5 timeScope:(int64_t)a6 range:(_NSRange)a7 completionHandler:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a3;
  id v15 = a8;
  id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 693, "-[GKLeaderboard loadEntriesWithGameDescriptor:fetchOptions:playerScope:timeScope:range:completionHandler:]");
  id v17 = +[GKDispatchGroup dispatchGroupWithName:v16];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __106__GKLeaderboard_loadEntriesWithGameDescriptor_fetchOptions_playerScope_timeScope_range_completionHandler___block_invoke;
  v25[3] = &unk_1E646E748;
  void v25[4] = self;
  id v26 = v14;
  unint64_t v28 = a4;
  int64_t v29 = a5;
  int64_t v30 = a6;
  NSUInteger v31 = location;
  NSUInteger v32 = length;
  id v18 = v17;
  id v27 = v18;
  id v19 = v14;
  [v18 perform:v25];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__GKLeaderboard_loadEntriesWithGameDescriptor_fetchOptions_playerScope_timeScope_range_completionHandler___block_invoke_2;
  v22[3] = &unk_1E646DC30;
  id v23 = v18;
  id v24 = v15;
  id v20 = v18;
  id v21 = v15;
  [v20 notifyOnMainQueueWithBlock:v22];
}

void __106__GKLeaderboard_loadEntriesWithGameDescriptor_fetchOptions_playerScope_timeScope_range_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = +[GKDaemonProxy proxyForLocalPlayer];
  id v14 = [v15 gameStatServicePrivate];
  uint64_t v4 = [*(id *)(a1 + 32) internal];
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  id v5 = +[GKLocalPlayer local];
  uint64_t v6 = [v5 internal];
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 40) bundleIdentifier];
  id v11 = +[GKLeaderboard leaderboardEntriesHandlerForGroup:v9 gameBundleID:v10 proxy:v15 done:v3];

  objc_msgSend(v14, "getEntriesForLeaderboard:fetchOptions:gameDescriptor:localPlayer:playerScope:timeScope:range:players:handler:", v4, v13, v12, v6, v7, v8, *(void *)(a1 + 80), *(void *)(a1 + 88), 0, v11);
}

void __106__GKLeaderboard_loadEntriesWithGameDescriptor_fetchOptions_playerScope_timeScope_range_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) error];

    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (v2)
    {
      id v7 = [v3 error];
      (*(void (**)(uint64_t, void, void, void))(v4 + 16))(v4, 0, 0, 0);
    }
    else
    {
      id v7 = [v3 objectForKeyedSubscript:@"localPlayerEntry"];
      id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"entries"];
      uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"totalPlayerCount"];
      (*(void (**)(uint64_t, id, void *, uint64_t, void))(v4 + 16))(v4, v7, v5, [v6 integerValue], 0);
    }
  }
}

- (void)loadEntriesForPlayers:(NSArray *)players timeScope:(GKLeaderboardTimeScope)timeScope completionHandler:(void *)completionHandler
{
}

- (void)loadEntriesForPlayers:(id)a3 timeScope:(int64_t)a4 locale:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 734, "-[GKLeaderboard loadEntriesForPlayers:timeScope:locale:completionHandler:]");
  uint64_t v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke;
  v20[3] = &unk_1E646DC08;
  id v21 = v9;
  id v22 = self;
  int64_t v24 = a4;
  id v13 = v12;
  id v23 = v13;
  id v14 = v9;
  [v13 perform:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke_3;
  v17[3] = &unk_1E646DC30;
  id v18 = v13;
  id v19 = v10;
  id v15 = v13;
  id v16 = v10;
  [v15 notifyOnMainQueueWithBlock:v17];
}

void __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v19 = [v3 _gkMapWithBlock:&__block_literal_global_73];
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v6 = +[GKGame currentGame];
  id v7 = [v6 gameDescriptor];

  id v17 = [v5 gameStatService];
  id v16 = [*(id *)(a1 + 40) internal];
  id v18 = +[GKGame currentGame];
  uint64_t v8 = [v18 gameDescriptor];
  id v9 = +[GKLocalPlayer local];
  id v10 = [v9 internal];
  uint64_t v13 = a1 + 48;
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(v13 + 8);
  id v14 = [v7 bundleIdentifier];
  id v15 = +[GKLeaderboard leaderboardEntriesHandlerForGroup:v12 gameBundleID:v14 proxy:v5 done:v4];

  objc_msgSend(v17, "getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:handler:", v16, v8, v10, 0, v11, 1, 0, v19, v15);
}

uint64_t __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 internal];
}

void __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) error];

    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (v2)
    {
      id v6 = [v3 error];
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, 0);
    }
    else
    {
      id v6 = [v3 objectForKeyedSubscript:@"localPlayerEntry"];
      id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"entries"];
      (*(void (**)(uint64_t, id, void *, void))(v4 + 16))(v4, v6, v5, 0);
    }
  }
}

- (void)loadSummaryWithTimeScope:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 767, "-[GKLeaderboard loadSummaryWithTimeScope:completionHandler:]");
  uint64_t v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke;
  v15[3] = &unk_1E646E7B8;
  void v15[4] = self;
  int64_t v17 = a3;
  id v9 = v8;
  id v16 = v9;
  [v9 perform:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke_3;
  v12[3] = &unk_1E646DC30;
  id v13 = v9;
  id v14 = v6;
  id v10 = v9;
  id v11 = v6;
  [v10 notifyOnMainQueueWithBlock:v12];
}

void __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = +[GKDaemonProxy proxyForLocalPlayer];
  id v13 = [v15 gameStatService];
  id v14 = +[GKGame currentGame];
  uint64_t v4 = [v14 gameDescriptor];
  id v5 = +[GKLocalPlayer local];
  id v6 = [v5 internal];
  id v7 = [*(id *)(a1 + 32) internal];
  uint64_t v8 = [v7 baseLeaderboardID];
  id v9 = [*(id *)(a1 + 32) internal];
  id v10 = [v9 identifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke_2;
  v16[3] = &unk_1E646E790;
  uint64_t v11 = *(void *)(a1 + 48);
  id v17 = *(id *)(a1 + 40);
  id v18 = v3;
  id v12 = v3;
  [v13 getLeaderboardSummaryForGameDescriptor:v4 localPlayer:v6 baseLeaderboardID:v8 leaderboardID:v10 timeScope:v11 handler:v16];
}

void __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    id v6 = a2;
    id v7 = [[GKLeaderboardSummary alloc] initWithInternalRepresentation:v6];

    [*(id *)(a1 + 32) setResult:v7];
    id v5 = 0;
  }
  [*(id *)(a1 + 32) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

+ (void)loadHighlightsWithPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = +[GKGame currentGame];
  [a1 loadHighlightsWithPlayerScope:a3 timeScope:a4 game:v9 handler:v8];
}

+ (void)loadHighlightsWithPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 game:(id)a5 handler:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = +[GKLocalPlayer localPlayer];
  id v12 = +[GKGameRecord gameRecordForPlayer:v11 game:v9];

  id v13 = [v12 defaultLeaderboardIdentifier];
  if (v13)
  {
    id v14 = [v12 defaultLeaderboardIdentifier];
    v23[0] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  }
  else
  {
    id v15 = 0;
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke;
  v18[3] = &unk_1E646E830;
  int64_t v21 = a3;
  int64_t v22 = a4;
  id v19 = v9;
  id v20 = v10;
  id v16 = v10;
  id v17 = v9;
  +[GKLeaderboard loadLeaderboardsWithIDs:v15 game:v17 completionHandler:v18];
}

void __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    if (*(void *)(a1 + 48) == 1) {
      uint64_t v5 = 600;
    }
    else {
      uint64_t v5 = 100;
    }
    id v6 = [*(id *)(a1 + 32) gameDescriptor];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke_2;
    v11[3] = &unk_1E646E808;
    uint64_t v14 = v7;
    id v9 = *(id *)(a1 + 40);
    id v12 = v4;
    id v13 = v9;
    id v10 = v4;
    objc_msgSend(v10, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:completionHandler:", v6, v7, v8, 1, v5, v11);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v9 || v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (*(void *)(a1 + 48) == 1)
    {
      v24[0] = 0;
      v24[1] = v24;
      void v24[2] = 0x2020000000;
      v24[3] = 1;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke_3;
      int64_t v21 = &unk_1E646E7E0;
      id v23 = v24;
      id v22 = v8;
      id v12 = [v9 _gkFilterWithBlock:&v18];

      objc_msgSend(v12, "count", v18, v19, v20, v21);
      _Block_object_dispose(v24, 8);
      id v9 = v12;
    }
    if ([v9 count])
    {
      id v13 = [v9 objectAtIndexedSubscript:0];
    }
    else
    {
      id v13 = 0;
    }
    if ([v8 rank] >= 1 && (unint64_t v14 = objc_msgSend(v8, "rank"), v14 <= objc_msgSend(v9, "count")))
    {
      if ([v8 rank] < 2)
      {
        id v15 = 0;
      }
      else
      {
        id v15 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "rank") - 2);
      }
      unint64_t v16 = [v8 rank];
      if (v16 >= [v9 count])
      {
        id v17 = 0;
      }
      else
      {
        id v17 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "rank"));
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

id __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 player];
  int v5 = [v4 isLocalPlayer];

  id v6 = [v3 player];
  uint64_t v7 = [v6 friendBiDirectional];
  char v8 = [v7 isEqualToNumber:&unk_1F1E7EAE0];

  if ((v8 & 1) != 0 || v5)
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v11 = [v3 internal];
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

- (id)creator
{
  id v3 = [GKPlayer alloc];
  id v4 = [(GKLeaderboard *)self internal];
  int v5 = [v4 creator];
  id v6 = [(GKPlayer *)v3 initWithInternalRepresentation:v5];

  return v6;
}

- (void)startWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 854, "-[GKLeaderboard startWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__GKLeaderboard_startWithHandler___block_invoke;
  v11[3] = &unk_1E646D928;
  void v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v7 perform:v11];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __34__GKLeaderboard_startWithHandler___block_invoke_3;
    v8[3] = &unk_1E646DC30;
    id v10 = v4;
    id v9 = v7;
    [v9 notifyOnMainQueueWithBlock:v8];
  }
}

void __34__GKLeaderboard_startWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  int v5 = [v4 gameStatService];
  id v6 = [*(id *)(a1 + 32) internal];
  id v7 = [v6 identifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__GKLeaderboard_startWithHandler___block_invoke_2;
  v9[3] = &unk_1E646D978;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v8 = v3;
  [v5 startLeaderboardWithID:v7 handler:v9];
}

uint64_t __34__GKLeaderboard_startWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __34__GKLeaderboard_startWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)endWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 871, "-[GKLeaderboard endWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__GKLeaderboard_endWithHandler___block_invoke;
  v11[3] = &unk_1E646D928;
  void v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v7 perform:v11];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__GKLeaderboard_endWithHandler___block_invoke_3;
    v8[3] = &unk_1E646DC30;
    id v10 = v4;
    id v9 = v7;
    [v9 notifyOnMainQueueWithBlock:v8];
  }
}

void __32__GKLeaderboard_endWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  int v5 = [v4 gameStatService];
  id v6 = [*(id *)(a1 + 32) internal];
  id v7 = [v6 identifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__GKLeaderboard_endWithHandler___block_invoke_2;
  v9[3] = &unk_1E646D978;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v8 = v3;
  [v5 endLeaderboardWithID:v7 handler:v9];
}

uint64_t __32__GKLeaderboard_endWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __32__GKLeaderboard_endWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)deleteWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboard.m", 888, "-[GKLeaderboard deleteWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  id v7 = [(GKLeaderboard *)self internal];
  id v8 = [v7 creator];
  id v9 = [v8 playerID];
  id v10 = +[GKLocalPlayer localPlayer];
  id v11 = [v10 internal];
  id v12 = [v11 playerID];
  int v13 = [v9 isEqualToString:v12];

  if (v13)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __35__GKLeaderboard_deleteWithHandler___block_invoke;
    v18[3] = &unk_1E646D928;
    void v18[4] = self;
    id v19 = v6;
    [v19 perform:v18];

    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  unint64_t v14 = [MEMORY[0x1E4F28C58] userErrorForCode:32 underlyingError:0];
  [v6 setError:v14];

  if (v4)
  {
LABEL_5:
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __35__GKLeaderboard_deleteWithHandler___block_invoke_3;
    v15[3] = &unk_1E646DC30;
    id v17 = v4;
    id v16 = v6;
    [v16 notifyOnMainQueueWithBlock:v15];
  }
LABEL_6:
}

void __35__GKLeaderboard_deleteWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  int v5 = [v4 gameStatService];
  id v6 = [*(id *)(a1 + 32) internal];
  id v7 = [v6 identifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__GKLeaderboard_deleteWithHandler___block_invoke_2;
  v9[3] = &unk_1E646D978;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v8 = v3;
  [v5 deleteLeaderboardWithID:v7 handler:v9];
}

uint64_t __35__GKLeaderboard_deleteWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __35__GKLeaderboard_deleteWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKLeaderboard;
  id v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  id v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKLeaderboard;
  int v5 = -[GKLeaderboard methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(GKLeaderboard *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboard;
  if (-[GKLeaderboard respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKLeaderboard *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (!a3) {
    return 0;
  }
  if (class_respondsToSelector((Class)a1, a3)) {
    return 1;
  }
  int v5 = GKApplicationLinkedOnOrAfter(393216, 0);
  BOOL result = 0;
  if (v5)
  {
    return +[GKLeaderboardInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKLeaderboard *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKLeaderboard *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (GKLeaderboardTimeScope)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(GKLeaderboardTimeScope)timeScope
{
  self->_timeScope = timeScope;
}

- (GKLeaderboardPlayerScope)playerScope
{
  return self->_playerScope;
}

- (void)setPlayerScope:(GKLeaderboardPlayerScope)playerScope
{
  self->_playerScope = playerScope;
}

- (GKLeaderboardInternal)internal
{
  return (GKLeaderboardInternal *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternal:(id)a3
{
}

- (GKLeaderboardDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKLeaderboardDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GKScore)localPlayerScore
{
  return self->_localPlayerScore;
}

- (void)setLocalPlayerScore:(id)a3
{
}

- (int)loadingCount
{
  return self->_loadingCount;
}

- (void)setLoadingCount:(int)a3
{
  self->_loadingCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPlayerScore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_scores, 0);

  objc_storeStrong((id *)&self->_players, 0);
}

@end