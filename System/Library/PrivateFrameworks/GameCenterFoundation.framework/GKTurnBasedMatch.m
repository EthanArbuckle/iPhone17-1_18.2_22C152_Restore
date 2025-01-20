@interface GKTurnBasedMatch
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)_localizableMessageWithKey:(id)a3 arguments:(id)a4 defaultMessage:(id)a5;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)keyPathsForValuesAffectingStatus;
+ (id)matchesWithInternalRepresentations:(id)a3;
+ (void)findMatchForRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler;
+ (void)getTurnBasedBadgeCountWithHandler:(id)a3;
+ (void)loadMatchWithID:(NSString *)matchID withCompletionHandler:(void *)completionHandler;
+ (void)loadMatchesIncludingCompatibleBundleID:(BOOL)a3 withCompletionHandler:(id)a4;
+ (void)loadMatchesWithCompletionHandler:(void *)completionHandler;
+ (void)loadTurnBasedMatchDetailsForMatchIDs:(id)a3 loadGameData:(BOOL)a4 withCompletionHandler:(id)a5;
+ (void)loadTurnBasedMatchSummaries:(id)a3;
+ (void)loadTurnBasedMatchSummariesIncludingCompatibleBundleID:(BOOL)a3 withCompletionHandler:(id)a4;
+ (void)loadTurnBasedMatchWithDetailsForMatchID:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMyTurn;
- (BOOL)localPlayerHasRecentTurn;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKGame)game;
- (GKPlayer)currentPlayer;
- (GKPlayer)showcasePlayer;
- (GKTurnBasedMatch)init;
- (GKTurnBasedMatch)initWithInternalRepresentation:(id)a3;
- (GKTurnBasedMatchInternal)internal;
- (GKTurnBasedMatchStatus)status;
- (GKTurnBasedParticipant)currentParticipant;
- (GKTurnBasedParticipant)firstWinnerOrTiedOrLastLoser;
- (GKTurnBasedParticipant)localPlayerParticipant;
- (GKTurnBasedParticipant)playingWithParticipantOrFirstKnownPlayer;
- (GKTurnBasedParticipant)previousParticipant;
- (GKTurnBasedParticipant)previousParticipantOrFirstKnownPlayer;
- (NSArray)activeExchanges;
- (NSArray)completedExchanges;
- (NSArray)exchanges;
- (NSArray)participants;
- (NSDate)dateSortKey;
- (NSString)description;
- (NSString)message;
- (NSUInteger)exchangeDataMaximumSize;
- (NSUInteger)exchangeMaxInitiatedExchangesPerPlayer;
- (NSUInteger)matchDataMaximumSize;
- (id)_exchangesForInternalRepresentation:(id)a3 participants:(id)a4;
- (id)_participantsForInternalRepresentation:(id)a3;
- (id)daemonProxy;
- (id)exchangeForID:(id)a3;
- (id)indexesForParticipants:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unsigned)state;
- (void)_updateWithInternal:(id)a3;
- (void)acceptInviteWithCompletionHandler:(void *)completionHandler;
- (void)declineInviteWithCompletionHandler:(void *)completionHandler;
- (void)endMatchInTurnWithMatchData:(NSData *)matchData completionHandler:(void *)completionHandler;
- (void)endMatchInTurnWithMatchData:(NSData *)matchData leaderboardScores:(NSArray *)scores achievements:(NSArray *)achievements completionHandler:(void *)completionHandler;
- (void)endMatchInTurnWithMatchData:(NSData *)matchData scores:(NSArray *)scores achievements:(NSArray *)achievements completionHandler:(void *)completionHandler;
- (void)endTurnWithNextParticipant:(GKTurnBasedParticipant *)nextParticipant matchData:(NSData *)matchData completionHandler:(void *)completionHandler;
- (void)endTurnWithNextParticipants:(NSArray *)nextParticipants turnTimeout:(NSTimeInterval)timeout matchData:(NSData *)matchData completionHandler:(void *)completionHandler;
- (void)loadMatchDataWithCompletionHandler:(void *)completionHandler;
- (void)loadURLWithMatchRequest:(id)a3 completionHandler:(id)a4;
- (void)participantQuitInTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome nextParticipant:(GKTurnBasedParticipant *)nextParticipant matchData:(NSData *)matchData completionHandler:(void *)completionHandler;
- (void)participantQuitInTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome nextParticipants:(NSArray *)nextParticipants turnTimeout:(NSTimeInterval)timeout matchData:(NSData *)matchData completionHandler:(void *)completionHandler;
- (void)participantQuitOutOfTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome withCompletionHandler:(void *)completionHandler;
- (void)rematchWithCompletionHandler:(void *)completionHandler;
- (void)removeWithCompletionHandler:(void *)completionHandler;
- (void)reserveShareParticipantSlots:(int64_t)a3 minPlayerCount:(int64_t)a4 maxPlayerCount:(int64_t)a5 andInvitePlayers:(id)a6 withMessage:(id)a7 handler:(id)a8;
- (void)saveCurrentTurnWithMatchData:(NSData *)matchData completionHandler:(void *)completionHandler;
- (void)saveMergedMatchData:(NSData *)matchData withResolvedExchanges:(NSArray *)exchanges completionHandler:(void *)completionHandler;
- (void)sendExchangeToParticipants:(NSArray *)participants data:(NSData *)data localizableMessageKey:(NSString *)key arguments:(NSArray *)arguments timeout:(NSTimeInterval)timeout completionHandler:(void *)completionHandler;
- (void)sendReminderToParticipants:(NSArray *)participants localizableMessageKey:(NSString *)key arguments:(NSArray *)arguments completionHandler:(void *)completionHandler;
- (void)setCurrentParticipant:(id)a3;
- (void)setInternal:(id)a3;
- (void)setLocalizableMessageWithKey:(NSString *)key arguments:(NSArray *)arguments;
- (void)setMessage:(NSString *)message;
- (void)setState:(unsigned int)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)state;
@end

@implementation GKTurnBasedMatch

- (NSUInteger)matchDataMaximumSize
{
  v2 = +[GKPreferences shared];
  NSUInteger v3 = [v2 maxGameStateSizeTurnBased];

  return v3;
}

- (NSUInteger)exchangeDataMaximumSize
{
  v2 = +[GKPreferences shared];
  NSUInteger v3 = [v2 exchangeDataMaximumSize];

  return v3;
}

- (NSUInteger)exchangeMaxInitiatedExchangesPerPlayer
{
  v2 = +[GKPreferences shared];
  NSUInteger v3 = [v2 exchangeMaxInitiatedExchangesPerPlayer];

  return v3;
}

+ (void)getTurnBasedBadgeCountWithHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[GKDaemonProxy proxyForLocalPlayer];
    v5 = [v4 turnBasedServicePrivate];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__GKTurnBasedMatch_getTurnBasedBadgeCountWithHandler___block_invoke;
    v6[3] = &unk_1E646FC58;
    id v7 = v3;
    [v5 getTurnBasedBadgeCountWithHandler:v6];
  }
}

uint64_t __54__GKTurnBasedMatch_getTurnBasedBadgeCountWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)matchesWithInternalRepresentations:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  }
  else
  {
    v5 = 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "matchID", (void)v15);

        if (v12)
        {
          v13 = [[GKTurnBasedMatch alloc] initWithInternalRepresentation:v11];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (void)findMatchForRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler
{
  v5 = request;
  id v6 = completionHandler;
  if (v6)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 710, "+[GKTurnBasedMatch findMatchForRequest:withCompletionHandler:]");
    uint64_t v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

    uint64_t v9 = [(GKMatchRequest *)v5 validateForTurnBased];
    if (v9)
    {
      [v8 setError:v9];
    }
    else
    {
      v10 = +[GKPreferences shared];
      uint64_t v11 = [v10 multiplayerAllowedPlayerType];

      if (v11)
      {
        if (![(GKMatchRequest *)v5 isIncorrectlyInvitingPlayers])
        {
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke;
          v20[3] = &unk_1E646D928;
          v21 = v5;
          id v22 = v8;
          [v22 perform:v20];

          goto LABEL_10;
        }
        v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = 30;
      }
      else
      {
        v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = 10;
      }
      v14 = [v12 userErrorForCode:v13 underlyingError:0];
      [v8 setError:v14];
    }
LABEL_10:
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_4;
    v17[3] = &unk_1E646DC30;
    id v18 = v8;
    id v19 = v6;
    id v15 = v8;
    [v15 notifyOnMainQueueWithBlock:v17];
    long long v16 = +[GKReporter reporter];
    [v16 reportEvent:@"com.apple.GameKit.turnBased" type:@"matchFind"];
  }
}

void __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E646E640;
  id v7 = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v5 = v3;
  [v7 loadRecipientsWithCompletionHandler:v6];
}

void __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 code] == 10)
  {
    [a1[5] setError:v4];
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v5 = +[GKDaemonProxy proxyForLocalPlayer];
    id v6 = [v5 turnBasedServicePrivate];
    id v7 = [a1[4] internal];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E6470188;
    id v9 = a1[5];
    id v10 = a1[6];
    [v6 createTurnBasedGameForMatchRequest:v7 individualMessages:0 handler:v8];
  }
}

void __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [[GKTurnBasedMatch alloc] initWithInternalRepresentation:v6];

    [v5 setObject:v7 forKeyedSubscript:@"match"];
  }
  [*(id *)(a1 + 32) setError:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"match"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

+ (void)loadMatchesWithCompletionHandler:(void *)completionHandler
{
}

+ (void)loadMatchesIncludingCompatibleBundleID:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 757, "+[GKTurnBasedMatch loadMatchesIncludingCompatibleBundleID:withCompletionHandler:]");
  id v7 = +[GKDispatchGroup dispatchGroupWithName:v6];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E64701B0;
  BOOL v16 = a3;
  id v8 = v7;
  id v15 = v8;
  [v8 perform:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E646DC30;
  id v12 = v8;
  id v13 = v5;
  id v9 = v8;
  id v10 = v5;
  [v9 notifyOnMainQueueWithBlock:v11];
}

void __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E646DC78;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  +[GKTurnBasedMatch loadTurnBasedMatchSummariesIncludingCompatibleBundleID:v4 withCompletionHandler:v6];
}

uint64_t __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"items"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) error];

    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (v2)
    {
      id v7 = [v3 error];
      (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v7);
    }
    else
    {
      uint64_t v5 = [v3 objectForKeyedSubscript:@"items"];
      id v7 = (id)v5;
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = MEMORY[0x1E4F1CBF0];
      }
      (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, v6, 0);
    }
  }
}

+ (void)loadTurnBasedMatchSummaries:(id)a3
{
}

+ (void)loadTurnBasedMatchSummariesIncludingCompatibleBundleID:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = +[GKDaemonProxy proxyForLocalPlayer];
    id v7 = [v6 turnBasedService];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__GKTurnBasedMatch_loadTurnBasedMatchSummariesIncludingCompatibleBundleID_withCompletionHandler___block_invoke;
    v8[3] = &unk_1E646DCF0;
    id v9 = v5;
    [v7 getTurnBasedMatchesAndCompatibleBundleID:v4 handler:v8];
  }
}

void __97__GKTurnBasedMatch_loadTurnBasedMatchSummariesIncludingCompatibleBundleID_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = +[GKTurnBasedMatch matchesWithInternalRepresentations:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

+ (void)loadTurnBasedMatchDetailsForMatchIDs:(id)a3 loadGameData:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 count];
  if (!v9 && GKApplicationLinkedOnOrAfter(458752, 657920))
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Must pass in a non-nil and non-empty array of matchIDs" userInfo:0];
    objc_exception_throw(v14);
  }
  if (v8)
  {
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 804, "+[GKTurnBasedMatch loadTurnBasedMatchDetailsForMatchIDs:loadGameData:withCompletionHandler:]");
    uint64_t v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

    if (v9)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke;
      v18[3] = &unk_1E646ED70;
      id v19 = v7;
      BOOL v21 = a4;
      id v20 = v11;
      [v20 perform:v18];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
      [v11 setError:v12];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E646DC30;
    id v16 = v11;
    id v17 = v8;
    id v13 = v11;
    [v13 notifyOnMainQueueWithBlock:v15];
  }
}

void __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E646DC78;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v8 = v3;
  [v5 getDetailsForTurnBasedMatchIDs:v7 includeGameData:v6 handler:v9];
}

uint64_t __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = +[GKTurnBasedMatch matchesWithInternalRepresentations:a2];
  [v5 setObject:v7 forKeyedSubscript:@"matches"];

  [*(id *)(a1 + 32) setError:v6];
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v8();
}

void __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"matches"];
    id v3 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);
  }
}

+ (void)loadMatchWithID:(NSString *)matchID withCompletionHandler:(void *)completionHandler
{
  id v5 = matchID;
  id v6 = completionHandler;
  uint64_t v7 = v6;
  if (!v5)
  {
    [MEMORY[0x1E4F1CA00] raise:@"GKInvalidArgumentException" format:@"Must specify a non-nil matchID"];
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__GKTurnBasedMatch_loadMatchWithID_withCompletionHandler___block_invoke;
    v9[3] = &unk_1E646DCF0;
    id v10 = v7;
    +[GKTurnBasedMatch loadTurnBasedMatchDetailsForMatchIDs:v8 loadGameData:1 withCompletionHandler:v9];
  }
LABEL_4:
}

void __58__GKTurnBasedMatch_loadMatchWithID_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = [a2 lastObject];
  id v6 = [v5 bundleID];

  if (v6)
  {
    uint64_t v7 = (uint64_t)v8;
  }
  else
  {

    uint64_t v7 = (uint64_t)v8;
    if (!v8)
    {
      uint64_t v7 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
    }
    id v5 = 0;
  }
  id v9 = (id)v7;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (GKTurnBasedMatch)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[GKInternalRepresentation internalRepresentation];
  }
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMatch;
  id v5 = [(GKTurnBasedMatch *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_internal, v4);
    [(GKTurnBasedMatch *)v6 _updateWithInternal:v4];
  }

  return v6;
}

- (GKTurnBasedMatch)init
{
  return [(GKTurnBasedMatch *)self initWithInternalRepresentation:0];
}

- (unint64_t)hash
{
  uint64_t v2 = [(GKTurnBasedMatch *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(GKTurnBasedMatch *)self internal];
    id v6 = [v4 internal];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (GKTurnBasedMatchInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
  id v6 = (GKTurnBasedMatchInternal *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_internal != v6)
  {
    objc_storeStrong((id *)&v5->_internal, a3);
    [(GKTurnBasedMatch *)v5 _updateWithInternal:v6];
  }
  objc_sync_exit(v5);
}

- (void)_updateWithInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(GKTurnBasedMatch *)self _participantsForInternalRepresentation:v4];
  participants = self->_participants;
  self->_participants = v5;

  char v7 = [(GKTurnBasedMatch *)self _exchangesForInternalRepresentation:v4 participants:self->_participants];

  exchanges = self->_exchanges;
  self->_exchanges = v7;
}

- (id)_participantsForInternalRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 participants];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 participants];
    char v7 = [v6 _gkMapWithBlock:&__block_literal_global_276];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

GKTurnBasedParticipant *__59__GKTurnBasedMatch__participantsForInternalRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKTurnBasedParticipant alloc] initWithInternalRepresentation:v2];

  return v3;
}

- (id)daemonProxy
{
  return +[GKDaemonProxy daemonProxy];
}

- (id)_exchangesForInternalRepresentation:(id)a3 participants:(id)a4
{
  id v5 = a3;
  id v6 = [v5 exchanges];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    objc_super v8 = [(GKTurnBasedMatch *)self participants];
    uint64_t v9 = [v8 count];
    id v10 = [v5 exchanges];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke;
    v14[3] = &unk_1E6470248;
    void v14[4] = self;
    id v15 = v8;
    uint64_t v16 = v9;
    id v11 = v8;
    id v12 = [v10 _gkMapWithBlock:v14];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

GKTurnBasedExchange *__69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [GKTurnBasedExchange alloc];
  id v5 = [*(id *)(a1 + 32) daemonProxy];
  id v6 = [(GKTurnBasedExchange *)v4 initWithInternalRepresentation:v3 daemonProxy:v5];

  [(GKTurnBasedExchange *)v6 setMatch:*(void *)(a1 + 32)];
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v3, "senderIndex"));
  [(GKTurnBasedExchange *)v6 setSender:v7];

  objc_super v8 = [v3 recipientIndexes];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke_2;
  v21[3] = &unk_1E64701F8;
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v23 = *(void *)(a1 + 48);
  id v22 = v9;
  id v10 = [v8 _gkMapWithBlock:v21];
  [(GKTurnBasedExchange *)v6 setRecipients:v10];

  id v11 = [v3 replies];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke_3;
  id v18 = &unk_1E6470220;
  id v12 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = v12;
  id v13 = [v11 _gkMapWithBlock:&v15];
  -[GKTurnBasedExchange setReplies:](v6, "setReplies:", v13, v15, v16, v17, v18, v19);

  return v6;
}

uint64_t __69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  uint64_t v4 = v3;
  if (v3 < 0 || v3 >= *(void *)(a1 + 40))
  {
    id v5 = NSString;
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"recipientIndex %ld is invalid", v3);
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m"];
    id v8 = [v7 lastPathComponent];
    uint64_t v9 = [v5 stringWithFormat:@"%@ (recipientIndex >= 0 && recipientIndex < participantCount)\n[%s (%s:%d)]", v6, "-[GKTurnBasedMatch _exchangesForInternalRepresentation:participants:]_block_invoke_2", objc_msgSend(v8, "UTF8String"), 928];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = *(void **)(a1 + 32);

  return [v10 objectAtIndex:v4];
}

GKTurnBasedExchangeReply *__69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [GKTurnBasedExchangeReply alloc];
  id v5 = [*(id *)(a1 + 32) daemonProxy];
  id v6 = [(GKTurnBasedExchangeReply *)v4 initWithInternalRepresentation:v3 daemonProxy:v5];

  uint64_t v7 = *(void **)(a1 + 40);
  unsigned int v8 = [v3 recipientIndex];

  uint64_t v9 = [v7 objectAtIndex:v8];
  [(GKTurnBasedExchangeReply *)v6 setRecipient:v9];

  [(GKTurnBasedExchangeReply *)v6 setMatch:*(void *)(a1 + 32)];

  return v6;
}

- (BOOL)isMyTurn
{
  id v2 = [(GKTurnBasedMatch *)self internal];
  id v3 = [v2 currentPlayer];
  char v4 = [v3 isLocalPlayer];

  return v4;
}

- (BOOL)localPlayerHasRecentTurn
{
  return [(GKTurnBasedMatch *)self state] == 1
      || [(GKTurnBasedMatch *)self state] == 3
      || [(GKTurnBasedMatch *)self state] == 2;
}

- (GKGame)game
{
  id v3 = [GKGame alloc];
  char v4 = [(GKTurnBasedMatch *)self internal];
  id v5 = [v4 game];
  id v6 = [(GKGame *)v3 initWithInternalRepresentation:v5];

  return v6;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKTurnBasedMatch;
  char v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedMatch;
  id v5 = -[GKTurnBasedMatch methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    unsigned int v8 = [(GKTurnBasedMatch *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMatch;
  if (-[GKTurnBasedMatch respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKTurnBasedMatch *)self forwardingTargetForSelector:a3];
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
    return +[GKTurnBasedMatchInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKTurnBasedMatch *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKTurnBasedMatch *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (NSString)message
{
  id v3 = [(GKTurnBasedMatch *)self internal];
  id v4 = [(GKTurnBasedMatch *)self daemonProxy];
  int v5 = [v3 localizableMessage];
  id v6 = [(GKTurnBasedMatch *)self bundleID];
  id v7 = [v4 localizedMessageFromDictionary:v5 forBundleID:v6];

  if (!v7)
  {
    id v7 = [v3 message];
  }

  return (NSString *)v7;
}

- (void)setMessage:(NSString *)message
{
  int v5 = message;
  id v4 = [(GKTurnBasedMatch *)self internal];
  [v4 setMessage:v5];

  [(GKTurnBasedMatch *)self setLocalizableMessageWithKey:v5 arguments:0];
}

+ (id)_localizableMessageWithKey:(id)a3 arguments:(id)a4 defaultMessage:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v31 = (__CFString *)a5;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  if (!v7)
  {
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil key" userInfo:0];
    objc_exception_throw(v30);
  }
  objc_super v10 = (void *)v9;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = (__CFString *)v8;
  uint64_t v12 = [(__CFString *)v11 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            BOOL v21 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v22 = *MEMORY[0x1E4F1C3C8];
            v38[0] = @"key";
            v38[1] = @"arguments";
            uint64_t v23 = @"nil";
            if (v11) {
              uint64_t v23 = v11;
            }
            v39[0] = v7;
            v39[1] = v23;
            v24 = (void *)MEMORY[0x1E4F1C9E8];
            v25 = v39;
            v26 = v38;
LABEL_25:
            v28 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:2];
            id v29 = [v21 exceptionWithName:v22 reason:@"localized message arguments must be strings or implement stringValue" userInfo:v28];

            objc_exception_throw(v29);
          }
          uint64_t v17 = [v16 stringValue];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v21 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v22 = *MEMORY[0x1E4F1C3C8];
            v40[0] = @"key";
            v40[1] = @"arguments";
            v27 = @"nil";
            if (v11) {
              v27 = v11;
            }
            v41[0] = v7;
            v41[1] = v27;
            v24 = (void *)MEMORY[0x1E4F1C9E8];
            v25 = v41;
            v26 = v40;
            goto LABEL_25;
          }
          id v16 = (id)v17;
        }
        [v10 addObject:v16];
      }
      uint64_t v13 = [(__CFString *)v11 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v13);
  }

  v36[0] = @"loc-key";
  v36[1] = @"loc-args";
  v37[0] = v7;
  v37[1] = v10;
  v36[2] = @"loc-default";
  if (v31) {
    id v18 = v31;
  }
  else {
    id v18 = &stru_1F1E47DF8;
  }
  v37[2] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];

  return v19;
}

- (void)setLocalizableMessageWithKey:(NSString *)key arguments:(NSArray *)arguments
{
  uint64_t v13 = key;
  id v6 = arguments;
  if (v13)
  {
    id v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v8 = v7;
    if (v6) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    objc_super v10 = [v7 _gkLocalizedStringForKey:v13 defaultValue:v13 arguments:v9];
    id v11 = +[GKTurnBasedMatch _localizableMessageWithKey:v13 arguments:v6 defaultMessage:v10];
    uint64_t v12 = [(GKTurnBasedMatch *)self internal];
    [v12 setLocalizableMessage:v11];
  }
  else
  {
    id v8 = [(GKTurnBasedMatch *)self internal];
    [v8 setLocalizableMessage:0];
  }
}

- (unsigned)state
{
  unsigned int result = self->_state;
  if (!result)
  {
    id v4 = [(GKTurnBasedMatch *)self activeExchanges];
    if ([v4 count])
    {
      unsigned int v5 = 2;
LABEL_30:
      self->_state = v5;

      return self->_state;
    }
    GKTurnBasedMatchStatus v6 = [(GKTurnBasedMatch *)self status];
    if (v6 != GKTurnBasedMatchStatusMatching)
    {
      if (v6 == GKTurnBasedMatchStatusEnded)
      {
        unsigned int v5 = 5;
        goto LABEL_30;
      }
      if (v6 != GKTurnBasedMatchStatusOpen)
      {
        if (!os_log_GKGeneral) {
          id v17 = GKOSLoggers();
        }
        id v18 = (void *)os_log_GKError;
        if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
          [(GKTurnBasedMatch *)v18 state];
        }
        unsigned int v5 = 3;
        goto LABEL_30;
      }
    }
    id v7 = [(GKTurnBasedMatch *)self currentParticipant];
    id v8 = [v7 player];

    uint64_t v9 = [(GKTurnBasedMatch *)self localPlayerParticipant];
    objc_super v10 = v9;
    if (v9 && [v9 status] == 5)
    {
      unsigned int v5 = 5;
LABEL_29:

      goto LABEL_30;
    }
    id v11 = [v8 internal];
    if ([v11 isGuestPlayer])
    {
      v26 = [v8 internal];
      uint64_t v12 = [v26 hostPlayerInternal];
      uint64_t v13 = [v12 playerID];
      uint64_t v14 = +[GKLocalPlayer localPlayer];
      uint64_t v15 = [v14 internal];
      id v16 = [v15 playerID];
      char v25 = [v13 isEqualToString:v16];

      if (v25)
      {
        unsigned int v5 = 6;
        goto LABEL_29;
      }
    }
    else
    {
    }
    if ([v8 isLocalPlayer])
    {
      uint64_t v19 = [(GKTurnBasedMatch *)self currentParticipant];
      uint64_t v20 = [v19 status];

      if (v20 == 1) {
        unsigned int v5 = 1;
      }
      else {
        unsigned int v5 = 3;
      }
    }
    else
    {
      BOOL v21 = [(GKTurnBasedMatch *)self participants];
      if ([v21 count])
      {

        unsigned int v5 = 4;
      }
      else
      {
        uint64_t v22 = [(GKTurnBasedMatch *)self internal];
        uint64_t v23 = [v22 currentPlayer];
        int v24 = [v23 isLocalPlayer];

        if (v24) {
          unsigned int v5 = 3;
        }
        else {
          unsigned int v5 = 4;
        }
      }
    }
    goto LABEL_29;
  }
  return result;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (GKPlayer)currentPlayer
{
  id v2 = [(GKTurnBasedMatch *)self internal];
  id v3 = [v2 currentPlayer];

  if (v3)
  {
    id v4 = +[GKPlayer canonicalizedPlayerForInternal:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (GKPlayer *)v4;
}

- (NSString)description
{
  if (description_onceToken_329 != -1) {
    dispatch_once(&description_onceToken_329, &__block_literal_global_331);
  }
  id v3 = (void *)description_matchStatusEnumLookupDict;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKTurnBasedMatch status](self, "status"));
  uint64_t v5 = [v3 objectForKey:v4];

  if (v5) {
    GKTurnBasedMatchStatus v6 = (__CFString *)v5;
  }
  else {
    GKTurnBasedMatchStatus v6 = @"INVALID";
  }
  char v25 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v30 = [(GKTurnBasedMatch *)self matchID];
  uint64_t v9 = [(GKTurnBasedMatch *)self bundleID];
  objc_super v10 = @"<nil>";
  v26 = (void *)v9;
  if (v9) {
    objc_super v10 = (__CFString *)v9;
  }
  int v24 = v10;
  id v11 = [(GKTurnBasedMatch *)self message];
  v27 = (void *)v8;
  v28 = v6;
  if (v11)
  {
    uint64_t v12 = NSString;
    uint64_t v23 = [(GKTurnBasedMatch *)self message];
    id v29 = [v12 stringWithFormat:@"'%@'", v23];
  }
  else
  {
    id v29 = 0;
  }
  uint64_t v13 = [(GKTurnBasedMatch *)self creationDate];
  uint64_t v14 = [(GKTurnBasedMatch *)self currentParticipant];
  uint64_t v15 = [(GKTurnBasedMatch *)self participants];
  id v16 = [v15 componentsJoinedByString:@","];
  id v17 = [(GKTurnBasedMatch *)self matchData];
  uint64_t v18 = [v17 length];
  NSUInteger v19 = [(GKTurnBasedMatch *)self matchDataMaximumSize];
  uint64_t v20 = [(GKTurnBasedMatch *)self exchanges];
  BOOL v21 = [v25 stringWithFormat:@"<%@ %p - matchID:%@ bundleID:%@ status:%@ message:%@ creationDate:%@ currentParticipant:%@ participants:%@ matchData.length:%ld matchDataMaximumSize:%ld exchanges:%@ state:%u>", v27, self, v30, v24, v28, v29, v13, v14, v16, v18, v19, v20, -[GKTurnBasedMatch state](self, "state")];

  if (v11)
  {
  }

  return (NSString *)v21;
}

void __31__GKTurnBasedMatch_description__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  GKTurnBasedMatchStatus v6 = [NSNumber numberWithInteger:0];
  uint64_t v1 = [NSNumber numberWithInteger:1];
  id v2 = [NSNumber numberWithInteger:2];
  id v3 = [NSNumber numberWithInteger:3];
  uint64_t v4 = objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", @"GKTurnBasedMatchStatusUnknown", v6, @"GKTurnBasedMatchStatusOpen", v1, @"GKTurnBasedMatchStatusEnded", v2, @"GKTurnBasedMatchStatusMatching", v3, 0);
  uint64_t v5 = (void *)description_matchStatusEnumLookupDict;
  description_matchStatusEnumLookupDict = v4;
}

+ (id)keyPathsForValuesAffectingStatus
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"internal.status"];
}

- (GKTurnBasedMatchStatus)status
{
  id v2 = [(GKTurnBasedMatch *)self internal];
  id v3 = [v2 status];

  if (v3)
  {
    if ([v3 isEqualToString:@"Active"])
    {
      GKTurnBasedMatchStatus v4 = GKTurnBasedMatchStatusOpen;
    }
    else if ([v3 isEqualToString:@"Complete"])
    {
      GKTurnBasedMatchStatus v4 = GKTurnBasedMatchStatusEnded;
    }
    else if ([v3 isEqualToString:@"Matching"])
    {
      GKTurnBasedMatchStatus v4 = GKTurnBasedMatchStatusMatching;
    }
    else
    {
      GKTurnBasedMatchStatus v4 = GKTurnBasedMatchStatusUnknown;
    }
  }
  else
  {
    GKTurnBasedMatchStatus v4 = GKTurnBasedMatchStatusUnknown;
  }

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GKTurnBasedMatch *)self state];
  unsigned int v6 = [v4 state];
  if (v5 == v6)
  {
    id v7 = [(GKTurnBasedMatch *)self dateSortKey];
    uint64_t v8 = [v4 dateSortKey];
    int64_t v9 = -[v7 compare:v8];
  }
  else if (v5 < v6)
  {
    int64_t v9 = -1;
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (NSDate)dateSortKey
{
  id v3 = [(GKTurnBasedMatch *)self internal];
  id v4 = [v3 lastTurnDate];
  unsigned int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(GKTurnBasedMatch *)self internal];
    id v6 = [v7 creationDate];
  }

  return (NSDate *)v6;
}

- (void)rematchWithCompletionHandler:(void *)completionHandler
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = completionHandler;
  unsigned int v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1207, "-[GKTurnBasedMatch rematchWithCompletionHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  id v7 = [(GKTurnBasedMatch *)self participants];
  uint64_t v8 = [v7 valueForKeyPath:@"player"];

  int64_t v9 = [(GKTurnBasedMatch *)self participants];
  uint64_t v10 = [v9 count];

  if (!+[GKMatchmaker canPlayMultiplayerGameWithPlayers:v8])
  {
    uint64_t v31 = [MEMORY[0x1E4F28C58] userErrorForCode:10 userInfo:0];
LABEL_21:
    long long v32 = (void *)v31;
    [v6 setError:v31];

    goto LABEL_22;
  }
  if (v10 < 2 || [(GKTurnBasedMatch *)self status] != GKTurnBasedMatchStatusEnded)
  {
    uint64_t v31 = [MEMORY[0x1E4F28C58] userErrorForCode:13 underlyingError:0];
    goto LABEL_21;
  }
  v36 = v6;
  v37 = v8;
  v38 = v4;
  id v11 = objc_alloc_init(GKMatchRequest);
  [(GKMatchRequest *)v11 setMinPlayers:v10];
  [(GKMatchRequest *)v11 setMaxPlayers:v10];
  long long v35 = v11;
  uint64_t v12 = [(GKMatchRequest *)v11 internal];
  [v12 setMatchType:2];

  uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10 - 1];
  uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v15 = [(GKTurnBasedMatch *)self participants];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v46;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v45 + 1) + 8 * v19) player];
        BOOL v21 = v20;
        if (v20)
        {
          uint64_t v22 = [v20 internal];
          uint64_t v23 = [v22 playerID];
          if (v23 && ![v21 isLocalPlayer])
          {
            char v24 = [v14 containsObject:v21];

            if ((v24 & 1) == 0)
            {
              char v25 = [v21 internal];
              v26 = [v25 playerID];
              [v13 addObject:v26];

              [v14 addObject:v21];
            }
          }
          else
          {
          }
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v27 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
      uint64_t v17 = v27;
    }
    while (v27);
  }

  v28 = [v14 allObjects];
  [(GKMatchRequest *)v35 setRecipients:v28];

  id v29 = [(GKMatchRequest *)v35 internal];
  [v29 setRecipientPlayerIDs:v13];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke;
  v42[3] = &unk_1E646D928;
  uint64_t v43 = v35;
  id v6 = v36;
  id v44 = v36;
  id v30 = v35;
  [v44 perform:v42];

  uint64_t v8 = v37;
  id v4 = v38;
LABEL_22:
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  void v39[2] = __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke_3;
  v39[3] = &unk_1E646E198;
  id v40 = v6;
  id v41 = v4;
  id v33 = v4;
  id v34 = v6;
  [v34 notifyOnMainQueueWithBlock:v39];
}

void __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  unsigned int v5 = [v4 turnBasedService];
  id v6 = [*(id *)(a1 + 32) internal];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E6470188;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 createTurnBasedGameForMatchRequest:v6 individualMessages:0 handler:v8];
}

void __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  id v10 = v5;
  if (a2 && !v5)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = a2;
    id v9 = [[GKTurnBasedMatch alloc] initWithInternalRepresentation:v8];

    [v7 setObject:v9 forKeyedSubscript:@"match"];
    id v6 = v10;
  }
  [*(id *)(a1 + 32) setError:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"match"];
  id v4 = [v3 matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v4];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"match"];
    id v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
  }
}

- (void)acceptInviteWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1260, "-[GKTurnBasedMatch acceptInviteWithCompletionHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  id v7 = +[GKPreferences shared];
  uint64_t v8 = [v7 multiplayerAllowedPlayerType];

  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
    [v6 setError:v10];

    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E646D928;
  void v14[4] = self;
  id v15 = v6;
  [v15 perform:v14];

  if (v4)
  {
LABEL_3:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E646E198;
    id v12 = v6;
    id v13 = v4;
    [v12 notifyOnMainQueueWithBlock:v11];
  }
LABEL_4:
  id v9 = +[GKReporter reporter];
  [v9 reportEvent:@"com.apple.GameKit.turnBased" type:@"matchAccept"];
}

void __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v5 = [v4 turnBasedService];
  id v6 = [*(id *)(a1 + 32) internal];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E6470270;
  id v7 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  [v5 acceptInviteForTurnBasedMatch:v6 handler:v9];
}

void __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    [*(id *)(a1 + 32) setInternal:v8];
    if (!v5)
    {
      id v6 = *(void **)(a1 + 40);
      id v7 = [[GKTurnBasedMatch alloc] initWithInternalRepresentation:v8];
      [v6 setObject:v7 forKeyedSubscript:@"match"];
    }
  }
  [*(id *)(a1 + 40) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"match"];
  id v4 = [v3 matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v4];

  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"match"];
  id v6 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
}

- (void)declineInviteWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  uint64_t v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v6 = [v5 turnBasedService];
  id v7 = [(GKTurnBasedMatch *)self internal];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __55__GKTurnBasedMatch_declineInviteWithCompletionHandler___block_invoke;
  id v13 = &unk_1E6470188;
  uint64_t v14 = self;
  id v15 = v4;
  id v8 = v4;
  [v6 declineInviteForTurnBasedMatch:v7 handler:&v10];

  id v9 = +[GKReporter reporter];
  [v9 reportEvent:@"com.apple.GameKit.turnBased" type:@"matchDecline"];
}

void __55__GKTurnBasedMatch_declineInviteWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9) {
    [*(id *)(a1 + 32) setInternal:v9];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
  id v7 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v8 = [*(id *)(a1 + 32) matchID];
  [v7 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v8];
}

- (GKTurnBasedParticipant)currentParticipant
{
  id v3 = [(GKTurnBasedMatch *)self internal];
  int v4 = [v3 currentParticipant];

  if (v4 < 0
    || ([(GKTurnBasedMatch *)self participants],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= v4))
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [(GKTurnBasedMatch *)self participants];
    id v8 = [v7 objectAtIndex:v4];
  }

  return (GKTurnBasedParticipant *)v8;
}

- (void)setCurrentParticipant:(id)a3
{
  id v6 = [a3 internal];
  char v4 = [v6 slot];
  id v5 = [(GKTurnBasedMatch *)self internal];
  [v5 setCurrentParticipant:v4];
}

- (GKTurnBasedParticipant)previousParticipant
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [(GKTurnBasedMatch *)self participants];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 lastTurnDate];

        if (v9)
        {
          if (!v5
            || ([v8 lastTurnDate],
                uint64_t v10 = objc_claimAutoreleasedReturnValue(),
                [v5 lastTurnDate],
                uint64_t v11 = objc_claimAutoreleasedReturnValue(),
                uint64_t v12 = [v10 compare:v11],
                v11,
                v10,
                v12 == 1))
          {
            id v13 = v8;

            id v5 = v13;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (GKTurnBasedParticipant *)v5;
}

- (GKTurnBasedParticipant)previousParticipantOrFirstKnownPlayer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(GKTurnBasedMatch *)self previousParticipant];
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_3;
  }
  id v5 = [v3 internal];
  uint64_t v6 = [v5 player];
  int v7 = [v6 isLocalPlayer];

  id v8 = v4;
  if (v7)
  {
LABEL_3:
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [(GKTurnBasedMatch *)self participants];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    id v8 = v4;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v15 = [v14 internal];
          long long v16 = [v15 player];

          if (v16 && ([v16 isLocalPlayer] & 1) == 0)
          {
            id v8 = v14;

            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      id v8 = v4;
    }
LABEL_14:

    if (!v8) {
      id v8 = v4;
    }
  }

  return (GKTurnBasedParticipant *)v8;
}

- (GKTurnBasedParticipant)playingWithParticipantOrFirstKnownPlayer
{
  id v3 = [(GKTurnBasedMatch *)self currentParticipant];
  if (!v3)
  {
    id v3 = [(GKTurnBasedMatch *)self firstWinnerOrTiedOrLastLoser];
  }
  uint64_t v4 = [v3 internal];
  id v5 = [v4 player];
  int v6 = [v5 isLocalPlayer];

  if (v6)
  {
    uint64_t v7 = [(GKTurnBasedMatch *)self previousParticipantOrFirstKnownPlayer];

    id v3 = (void *)v7;
  }

  return (GKTurnBasedParticipant *)v3;
}

- (GKTurnBasedParticipant)localPlayerParticipant
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(GKTurnBasedMatch *)self participants];
  id v3 = (id)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = [v6 internal];
        id v8 = [v7 player];
        char v9 = [v8 isLocalPlayer];

        if (v9)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (GKTurnBasedParticipant *)v3;
}

- (GKPlayer)showcasePlayer
{
  if ([(GKTurnBasedMatch *)self state] == 1)
  {
    id v3 = [(GKTurnBasedMatch *)self currentParticipant];
    [v3 invitedBy];
  }
  else
  {
    id v3 = [(GKTurnBasedMatch *)self playingWithParticipantOrFirstKnownPlayer];
    [v3 player];
  uint64_t v4 = };

  if (!v4)
  {
    uint64_t v4 = +[GKPlayer automatchPlayer];
  }

  return (GKPlayer *)v4;
}

- (GKTurnBasedParticipant)firstWinnerOrTiedOrLastLoser
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = [(GKTurnBasedMatch *)self participants];
  uint64_t v24 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v24)
  {

    id v3 = 0;
LABEL_27:
    id v3 = v3;
    uint64_t v4 = v3;
    goto LABEL_29;
  }
  id v3 = 0;
  uint64_t v4 = 0;
  id v5 = 0;
  id obj = v2;
  uint64_t v23 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v26 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if ([v7 isWinner])
      {
        if (v5)
        {
          id v8 = [v7 lastTurnDate];
          char v9 = [v5 lastTurnDate];
          uint64_t v10 = [v8 compare:v9];

          long long v11 = v5;
          id v12 = v3;
          long long v13 = v4;
          long long v14 = v7;
LABEL_12:
          if (v10 != -1) {
            continue;
          }
        }
        else
        {
          long long v11 = 0;
          id v12 = v3;
          long long v13 = v4;
          long long v14 = v7;
        }
LABEL_21:
        id v20 = v7;

        id v3 = v12;
        uint64_t v4 = v13;
        id v5 = v14;
        continue;
      }
      if ([v7 matchOutcome] == 4)
      {
        if (v4)
        {
          long long v15 = [v7 lastTurnDate];
          uint64_t v16 = [v4 lastTurnDate];
          uint64_t v10 = [v15 compare:v16];

          long long v11 = v4;
          id v12 = v3;
          long long v13 = v7;
          long long v14 = v5;
          goto LABEL_12;
        }
        long long v11 = 0;
        id v12 = v3;
        long long v13 = v7;
        goto LABEL_20;
      }
      if (!v3)
      {
        long long v11 = 0;
        id v12 = v7;
        long long v13 = v4;
LABEL_20:
        long long v14 = v5;
        goto LABEL_21;
      }
      long long v17 = [v7 lastTurnDate];
      long long v18 = [v3 lastTurnDate];
      uint64_t v19 = [v17 compare:v18];

      long long v11 = v3;
      id v12 = v7;
      long long v13 = v4;
      long long v14 = v5;
      if (v19 == 1) {
        goto LABEL_21;
      }
    }
    uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v24);

  if (v5)
  {

    uint64_t v4 = v5;
    goto LABEL_29;
  }
  if (!v4) {
    goto LABEL_27;
  }
LABEL_29:

  return (GKTurnBasedParticipant *)v4;
}

- (NSArray)activeExchanges
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(GKTurnBasedMatch *)self status] == GKTurnBasedMatchStatusOpen)
  {
    id v3 = [(GKTurnBasedMatch *)self localPlayerParticipant];
    long long v25 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [(GKTurnBasedMatch *)self exchanges];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v31;
      uint64_t v23 = *(void *)v31;
      uint64_t v24 = v4;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v9 status] == 1)
          {
            uint64_t v10 = [v9 recipients];
            uint64_t v11 = [v10 indexOfObject:v3];

            if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v12 = [v9 replies];
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (!v13) {
                goto LABEL_17;
              }
              uint64_t v14 = v13;
              char v15 = 0;
              uint64_t v16 = *(void *)v27;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v12);
                  }
                  long long v18 = [*(id *)(*((void *)&v26 + 1) + 8 * j) recipient];
                  BOOL v19 = v18 == v3;

                  v15 |= v19;
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v14);
              uint64_t v7 = v23;
              uint64_t v4 = v24;
              if ((v15 & 1) == 0) {
LABEL_17:
              }
                [v25 addObject:v9];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v6);
    }
    if ([v25 count]) {
      id v20 = v25;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;
  }
  else
  {
    id v21 = 0;
  }

  return (NSArray *)v21;
}

- (NSArray)completedExchanges
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(GKTurnBasedMatch *)self status] == GKTurnBasedMatchStatusOpen)
  {
    id v3 = [(GKTurnBasedMatch *)self localPlayerParticipant];
    uint64_t v4 = [(GKTurnBasedMatch *)self currentParticipant];
    if (v3 == v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v7 = [(GKTurnBasedMatch *)self exchanges];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if ([v12 status] == 2) {
              [v6 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
      if ([v6 count]) {
        uint64_t v13 = v6;
      }
      else {
        uint64_t v13 = 0;
      }
      id v5 = v13;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)removeWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1461, "-[GKTurnBasedMatch removeWithCompletionHandler:]");
  uint64_t v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  uint64_t v7 = [(GKTurnBasedMatch *)self localPlayerParticipant];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E646D9A0;
  id v16 = v7;
  long long v17 = self;
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  [v8 perform:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_4;
  v12[3] = &unk_1E646E578;
  id v13 = v8;
  id v14 = v4;
  v12[4] = self;
  id v10 = v8;
  id v11 = v4;
  [v10 notifyOnMainQueueWithBlock:v12];
}

void __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] status] == 1 && objc_msgSend(a1[5], "status") == 3)
  {
    id v4 = a1[5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E646E098;
    id v5 = &v15;
    id v15 = v3;
    id v6 = v3;
    [v4 declineInviteWithCompletionHandler:v14];
  }
  else
  {
    uint64_t v7 = +[GKDaemonProxy proxyForLocalPlayer];
    id v8 = [v7 turnBasedService];
    id v9 = [a1[5] internal];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E646D978;
    id v5 = &v12;
    id v12 = a1[6];
    id v13 = v3;
    id v10 = v3;
    [v8 removeTurnBasedMatch:v9 handler:v11];
  }
}

uint64_t __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v3];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)loadMatchDataWithCompletionHandler:(void *)completionHandler
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = completionHandler;
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v6 = [v5 turnBasedService];
  uint64_t v7 = [(GKTurnBasedMatch *)self matchID];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__GKTurnBasedMatch_loadMatchDataWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E646DC78;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v6 getDetailsForTurnBasedMatchIDs:v8 includeGameData:1 handler:v10];
}

void __55__GKTurnBasedMatch_loadMatchDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 count])
  {
    id v6 = [v9 objectAtIndex:0];
    [*(id *)(a1 + 32) setInternal:v6];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) matchData];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
  }
}

+ (void)loadTurnBasedMatchWithDetailsForMatchID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1495, "+[GKTurnBasedMatch loadTurnBasedMatchWithDetailsForMatchID:withCompletionHandler:]");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E646E198;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[GKActivity named:v7 execute:v10];
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1496, "+[GKTurnBasedMatch loadTurnBasedMatchWithDetailsForMatchID:withCompletionHandler:]_block_invoke");
  id v3 = +[GKDispatchGroup dispatchGroupWithName:v2];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_369;
    v15[3] = &unk_1E646D928;
    id v16 = v4;
    id v17 = v3;
    [v17 perform:v15];

    id v5 = v16;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    uint64_t v7 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_cold_1(v7);
    }
    if (GKApplicationLinkedOnOrAfter(458752, 657920))
    {
      id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil matchID" userInfo:0];
      objc_exception_throw(v11);
    }
    id v5 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
    [v3 setError:v5];
  }

  if (*(void *)(a1 + 40))
  {
    id v8 = [MEMORY[0x1E4F28C40] defaultCenter];
    id v9 = [v3 objectForKeyedSubscript:@"match"];
    id v10 = [v9 matchID];
    [v8 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v10];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_370;
    v12[3] = &unk_1E646DC30;
    id v14 = *(id *)(a1 + 40);
    id v13 = v3;
    [v13 notifyOnMainQueueWithBlock:v12];
  }
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_369(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  v12[0] = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E646E640;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v7 = v3;
  [v5 getDetailsForTurnBasedMatchIDs:v6 includeGameData:1 handler:v8];
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_2_cold_1(a1, (uint64_t)v6, v8);
    }
  }
  id v9 = +[GKTurnBasedMatch matchesWithInternalRepresentations:v5];
  id v10 = *(void **)(a1 + 40);
  id v11 = [v9 lastObject];
  [v10 setObject:v11 forKeyedSubscript:@"match"];

  [*(id *)(a1 + 40) setError:v6];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_370(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"match"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)loadURLWithMatchRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E646E098;
  id v8 = v7;
  id v36 = v8;
  id v9 = _Block_copy(aBlock);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_2;
  v33[3] = &unk_1E646FA08;
  id v10 = v9;
  id v34 = v10;
  id v11 = (void (**)(void *, uint64_t))_Block_copy(v33);
  if (!os_log_GKGeneral) {
    id v12 = GKOSLoggers();
  }
  id v13 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "GKMatchmaker: matchWithRequest: currentMatch: - Check for Local Player Authentication", buf, 2u);
  }
  id v14 = +[GKLocalPlayer localPlayer];
  char v15 = [v14 isAuthenticated];

  if (v15)
  {
    if (!os_log_GKGeneral) {
      id v16 = GKOSLoggers();
    }
    id v17 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "GKMatchmaker: matchWithRequest: currentMatch: - Check parental controls", buf, 2u);
    }
    id v18 = +[GKPreferences shared];
    uint64_t v19 = [v18 multiplayerAllowedPlayerType];

    if (v19)
    {
      uint64_t v20 = [v6 validateForTurnBased];
      if (v20)
      {
        if (!os_log_GKGeneral) {
          id v21 = GKOSLoggers();
        }
        uint64_t v22 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v6;
          _os_log_impl(&dword_1C2D22000, v22, OS_LOG_TYPE_INFO, "TBGame - isTurnBasedValid: NO, request = %@", buf, 0xCu);
        }
        (*((void (**)(id, void *))v10 + 2))(v10, v20);
      }
      else
      {
        uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1568, "-[GKTurnBasedMatch loadURLWithMatchRequest:completionHandler:]");
        uint64_t v24 = +[GKDispatchGroup dispatchGroupWithName:v23];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_373;
        v30[3] = &unk_1E646D9A0;
        v30[4] = self;
        id v31 = v6;
        id v25 = v24;
        id v32 = v25;
        [v25 perform:v30];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_376;
        v27[3] = &unk_1E646DC30;
        id v28 = v25;
        id v29 = v8;
        id v26 = v25;
        [v26 notifyOnMainQueueWithBlock:v27];
      }
    }
    else
    {
      v11[2](v11, 10);
    }
  }
  else
  {
    v11[2](v11, 6);
  }
}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
    __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_cold_1(v5, v3);
  }
  if (*(void *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_371;
    v6[3] = &unk_1E646DC30;
    id v8 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_371(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] userErrorForCode:a2 underlyingError:0];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_373(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  id v6 = [a1[4] internal];
  id v7 = +[GKLocalPlayer localPlayer];
  id v8 = [v7 internal];
  id v9 = [a1[5] internal];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_2_374;
  v11[3] = &unk_1E6470298;
  id v12 = a1[6];
  id v13 = v3;
  id v10 = v3;
  [v5 loadURLWithTBGMatch:v6 player:v8 matchRequest:v9 handler:v11];
}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_2_374(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  id v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "TBGame - turnBasedService loadURLWithTBGMatch result, url = %@, error = %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) setError:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_376(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) result];
    id v3 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);
  }
}

- (void)reserveShareParticipantSlots:(int64_t)a3 minPlayerCount:(int64_t)a4 maxPlayerCount:(int64_t)a5 andInvitePlayers:(id)a6 withMessage:(id)a7 handler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v19 = +[GKDaemonProxy proxyForLocalPlayer];
  id v17 = [v19 turnBasedService];
  id v18 = [(GKTurnBasedMatch *)self internal];
  [v17 reserveShareParticipantSlots:a3 minPlayerCount:a4 maxPlayerCount:a5 andInvitePlayers:v16 withMessage:v15 forMatch:v18 handler:v14];
}

- (void)endTurnWithNextParticipant:(GKTurnBasedParticipant *)nextParticipant matchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  id v8 = (void *)MEMORY[0x1E4F1C978];
  int v9 = completionHandler;
  id v10 = matchData;
  id v11 = [v8 arrayWithObject:nextParticipant];
  [(GKTurnBasedMatch *)self endTurnWithNextParticipants:v11 turnTimeout:v10 matchData:v9 completionHandler:GKTurnTimeoutDefault];
}

- (id)indexesForParticipants:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v16 = v4;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v12 = [(GKTurnBasedMatch *)self participants];
          uint64_t v13 = [v12 indexOfObject:v11];

          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {

            id v5 = 0;
            goto LABEL_12;
          }
          id v14 = [NSNumber numberWithInteger:v13];
          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_12:
      id v4 = v16;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)endTurnWithNextParticipants:(NSArray *)nextParticipants turnTimeout:(NSTimeInterval)timeout matchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v10 = nextParticipants;
  uint64_t v11 = matchData;
  id v12 = completionHandler;
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1616, "-[GKTurnBasedMatch endTurnWithNextParticipants:turnTimeout:matchData:completionHandler:]");
  id v14 = +[GKDispatchGroup dispatchGroupWithName:v13];

  id v15 = +[GKPreferences shared];
  uint64_t v16 = [v15 multiplayerAllowedPlayerType];

  if (v16)
  {
    long long v17 = [(GKTurnBasedMatch *)self indexesForParticipants:v10];
    if (GKApplicationLinkedOnOrAfter(458752, 657920))
    {
      if (!v11)
      {
        id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil matchData" userInfo:0];
        objc_exception_throw(v23);
      }
      if (!v17)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v25 = *MEMORY[0x1E4F1C3C8];
        if (v10) {
          id v26 = (__CFString *)v10;
        }
        else {
          id v26 = @"nil";
        }
        id v36 = @"nextParticipants";
        v37[0] = v26;
        long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
        id v28 = [v24 exceptionWithName:v25 reason:@"invalid list of nextParticipants" userInfo:v27];

        objc_exception_throw(v28);
      }
    }
    if (v11 && v17)
    {
      long long v18 = [(NSArray *)v10 objectAtIndex:0];
      [(GKTurnBasedMatch *)self setCurrentParticipant:v18];

      long long v19 = [(GKTurnBasedMatch *)self internal];
      [v19 setMatchData:v11];

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke;
      v32[3] = &unk_1E646DC08;
      v32[4] = self;
      id v33 = v17;
      NSTimeInterval v35 = timeout;
      id v34 = v14;
      [v34 perform:v32];
    }
    else
    {
      long long v20 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
      [v14 setError:v20];
    }
  }
  else
  {
    long long v17 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
    [v14 setError:v17];
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke_3;
  v29[3] = &unk_1E646E578;
  id v30 = v14;
  id v31 = v12;
  v29[4] = self;
  id v21 = v14;
  id v22 = v12;
  [v21 notifyOnMainQueueWithBlock:v29];
}

void __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  id v6 = [*(id *)(a1 + 32) internal];
  double v7 = *(double *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke_2;
  v10[3] = &unk_1E6470270;
  uint64_t v8 = *(void *)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  id v9 = v3;
  [v5 submitTurnForTurnBasedMatch:v6 nextParticipantIndexes:v8 turnTimeout:v10 handler:v7];
}

void __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setInternal:a2];
  }
  [*(id *)(a1 + 40) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v3];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)participantQuitInTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome nextParticipant:(GKTurnBasedParticipant *)nextParticipant matchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = completionHandler;
  id v12 = matchData;
  id v13 = [v10 arrayWithObject:nextParticipant];
  [(GKTurnBasedMatch *)self participantQuitInTurnWithOutcome:matchOutcome nextParticipants:v13 turnTimeout:v12 matchData:v11 completionHandler:GKTurnTimeoutDefault];
}

- (void)participantQuitInTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome nextParticipants:(NSArray *)nextParticipants turnTimeout:(NSTimeInterval)timeout matchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v12 = nextParticipants;
  id v13 = matchData;
  id v14 = completionHandler;
  id v15 = [(GKTurnBasedMatch *)self indexesForParticipants:v12];
  BOOL v16 = +[GKTurnBasedParticipant matchOutcomeIsValidForDoneState:matchOutcome];
  if (GKApplicationLinkedOnOrAfter(458752, 657920))
  {
    if (!v13)
    {
      id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil matchData" userInfo:0];
      objc_exception_throw(v20);
    }
    if (!v16)
    {
      id v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      id v36 = @"matchOutcome";
      id v23 = [(GKTurnBasedMatch *)self participants];
      uint64_t v24 = +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:](GKTurnBasedParticipant, "stringForMatchOutcome:totalParticipant:", matchOutcome, [v23 count]);
      v37[0] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      id v26 = [v21 exceptionWithName:v22 reason:@"invalid matchOutcome" userInfo:v25];

      objc_exception_throw(v26);
    }
    if (!v15)
    {
      long long v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3C8];
      if (v12) {
        id v29 = (__CFString *)v12;
      }
      else {
        id v29 = @"nil";
      }
      id v34 = @"nextParticipants";
      NSTimeInterval v35 = v29;
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      id v31 = [v27 exceptionWithName:v28 reason:@"invalid nextParticipants" userInfo:v30];

      objc_exception_throw(v31);
    }
  }
  if (v15) {
    BOOL v17 = v16;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    long long v18 = [(GKTurnBasedMatch *)self currentParticipant];
    [v18 setStatus:5];

    long long v19 = [(GKTurnBasedMatch *)self currentParticipant];
    [v19 setMatchOutcome:matchOutcome];

    [(GKTurnBasedMatch *)self endTurnWithNextParticipants:v12 turnTimeout:v13 matchData:v14 completionHandler:timeout];
  }
  else if (v14)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__GKTurnBasedMatch_participantQuitInTurnWithOutcome_nextParticipants_turnTimeout_matchData_completionHandler___block_invoke;
    block[3] = &unk_1E646E198;
    block[4] = self;
    id v33 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __110__GKTurnBasedMatch_participantQuitInTurnWithOutcome_nextParticipants_turnTimeout_matchData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v3];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

- (void)participantQuitOutOfTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome withCompletionHandler:(void *)completionHandler
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = completionHandler;
  double v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1687, "-[GKTurnBasedMatch participantQuitOutOfTurnWithOutcome:withCompletionHandler:]");
  uint64_t v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  if (+[GKTurnBasedParticipant matchOutcomeIsValidForDoneState:matchOutcome])
  {
    id v9 = [(GKTurnBasedMatch *)self localPlayerParticipant];
    id v10 = [(GKTurnBasedMatch *)self currentParticipant];
    if ([v10 isEqual:v9])
    {
      if (GKApplicationLinkedOnOrAfter(458752, 657920))
      {
        id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"current turn holder can not quit out of turn" userInfo:0];
        objc_exception_throw(v21);
      }
      id v11 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
      [v8 setError:v11];
    }
    else
    {
      [v9 setStatus:5];
      [v9 setMatchOutcome:matchOutcome];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke;
      v25[3] = &unk_1E646E7B8;
      v25[4] = self;
      GKTurnBasedMatchOutcome v27 = matchOutcome;
      id v26 = v8;
      [v26 perform:v25];
    }
  }
  else
  {
    if (GKApplicationLinkedOnOrAfter(458752, 657920))
    {
      id v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3C8];
      uint64_t v28 = @"matchOutcome";
      BOOL v17 = [(GKTurnBasedMatch *)self participants];
      long long v18 = +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:](GKTurnBasedParticipant, "stringForMatchOutcome:totalParticipant:", matchOutcome, [v17 count]);
      v29[0] = v18;
      long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v20 = [v15 exceptionWithName:v16 reason:@"invalid matchOutcome" userInfo:v19];

      objc_exception_throw(v20);
    }
    id v12 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
    [v8 setError:v12];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E646E578;
  id v23 = v8;
  id v24 = v6;
  v22[4] = self;
  id v13 = v8;
  id v14 = v6;
  [v13 notifyOnMainQueueWithBlock:v22];
}

void __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  id v6 = [*(id *)(a1 + 32) internal];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E6470270;
  double v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v7;
  id v12 = v3;
  id v9 = v3;
  [v5 resignFromTurnBasedGame:v6 outcome:v8 handler:v10];
}

void __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = [v9 game];

    if (!v6)
    {
      double v7 = [*(id *)(a1 + 32) internal];
      uint64_t v8 = [v7 game];
      [v9 setGame:v8];
    }
    [*(id *)(a1 + 32) setInternal:v9];
  }
  [*(id *)(a1 + 40) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v3];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)endMatchInTurnWithMatchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
}

- (void)endMatchInTurnWithMatchData:(NSData *)matchData scores:(NSArray *)scores achievements:(NSArray *)achievements completionHandler:(void *)completionHandler
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = matchData;
  id v11 = scores;
  id v12 = achievements;
  id v13 = completionHandler;
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1730, "-[GKTurnBasedMatch endMatchInTurnWithMatchData:scores:achievements:completionHandler:]");
  id v15 = +[GKDispatchGroup dispatchGroupWithName:v14];

  uint64_t v16 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touchdowns on level 1\"";
  if (v10)
  {
    long long v46 = self;
    long long v47 = v11;
    long long v45 = v10;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    BOOL v17 = [(GKTurnBasedMatch *)self participants];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v60;
LABEL_4:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(__CFString **)(*((void *)&v59 + 1) + 8 * v21);
        if (([(__CFString *)v22 status] & 0xFFFFFFFFFFFFFFFELL) == 4
          && !+[GKTurnBasedParticipant matchOutcomeIsValidForDoneState:[(__CFString *)v22 matchOutcome]])
        {
          if (GKApplicationLinkedOnOrAfter(458752, 657920))
          {
            id v36 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v37 = *MEMORY[0x1E4F1C3C8];
            id v38 = @"nil";
            if (v22) {
              id v38 = v22;
            }
            v65[0] = v38;
            v64[0] = @"participant";
            v64[1] = @"matchOutcome";
            uint64_t v39 = [(__CFString *)v22 matchOutcome];
            id v40 = [(GKTurnBasedMatch *)v46 participants];
            id v41 = +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:](GKTurnBasedParticipant, "stringForMatchOutcome:totalParticipant:", v39, [v40 count]);
            v65[1] = v41;
            v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
            id v43 = [v36 exceptionWithName:v37 reason:@"invalid matchOutcome for participant" userInfo:v42];

            objc_exception_throw(v43);
          }
          id v23 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
          [v15 setError:v23];
        }
        id v24 = [v15 error];

        if (v24) {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [v17 countByEnumeratingWithState:&v59 objects:v66 count:16];
          if (v19) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v25 = [v15 error];

    id v10 = v45;
    self = v46;
    id v11 = v47;
    uint64_t v16 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touchdo"
          "wns on level 1\"";
    if (!v25)
    {
      id v26 = [(GKTurnBasedMatch *)v46 currentParticipant];
      [v26 setStatus:5];

      GKTurnBasedMatchOutcome v27 = [(GKTurnBasedMatch *)v46 internal];
      [v27 setMatchData:v45];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v56 = 0u;
      long long v55 = 0u;
      uint64_t v28 = [(GKTurnBasedMatch *)v46 participants];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v56 != v31) {
              objc_enumerationMutation(v28);
            }
            [*(id *)(*((void *)&v55 + 1) + 8 * i) setStatus:5];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v30);
      }

      v51[0] = MEMORY[0x1E4F143A8];
      uint64_t v16 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touch"
            "downs on level 1\"";
      v51[1] = 3221225472;
      v51[2] = __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke;
      v51[3] = &unk_1E646E5C8;
      v51[4] = v46;
      id v11 = v47;
      v52 = v47;
      v53 = v12;
      id v54 = v15;
      [v54 perform:v51];
    }
  }
  else
  {
    if (GKApplicationLinkedOnOrAfter(458752, 657920))
    {
      id v44 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil matchData" userInfo:0];
      objc_exception_throw(v44);
    }
    id v33 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
    [v15 setError:v33];
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = *((void *)v16 + 462);
  v48[2] = __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke_3;
  v48[3] = &unk_1E646E578;
  id v49 = v15;
  id v50 = v13;
  v48[4] = self;
  id v34 = v15;
  id v35 = v13;
  [v34 notifyOnMainQueueWithBlock:v48];
}

void __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  id v6 = [a1[4] internal];
  double v7 = [a1[5] _gkValuesForKeyPath:@"internal"];
  uint64_t v8 = [a1[6] _gkValuesForKeyPath:@"internal"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6470270;
  id v9 = a1[7];
  id v10 = a1[4];
  id v13 = v9;
  id v14 = v10;
  id v15 = v3;
  id v11 = v3;
  [v5 completeTurnBasedMatch:v6 scores:v7 achievements:v8 handler:v12];
}

void __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if (v5) {
    [*(id *)(a1 + 40) setInternal:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v3];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)endMatchInTurnWithMatchData:(NSData *)matchData leaderboardScores:(NSArray *)scores achievements:(NSArray *)achievements completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  id v11 = achievements;
  id v12 = matchData;
  id v13 = +[GKLeaderboardScore convertToGKScore:scores];
  [(GKTurnBasedMatch *)self endMatchInTurnWithMatchData:v12 scores:v13 achievements:v11 completionHandler:v10];
}

- (void)saveCurrentTurnWithMatchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  id v6 = matchData;
  double v7 = completionHandler;
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1791, "-[GKTurnBasedMatch saveCurrentTurnWithMatchData:completionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  if (!v6)
  {
    if (GKApplicationLinkedOnOrAfter(458752, 657920))
    {
      id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil matchData" userInfo:0];
      objc_exception_throw(v18);
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 17;
    goto LABEL_7;
  }
  id v10 = +[GKPreferences shared];
  uint64_t v11 = [v10 multiplayerAllowedPlayerType];

  if (!v11)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 10;
LABEL_7:
    id v15 = [v13 userErrorForCode:v14 underlyingError:0];
    [v9 setError:v15];

    goto LABEL_8;
  }
  id v12 = [(GKTurnBasedMatch *)self internal];
  [v12 setMatchData:v6];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke;
  v22[3] = &unk_1E646D928;
  v22[4] = self;
  id v23 = v9;
  [v23 perform:v22];

LABEL_8:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke_3;
  v19[3] = &unk_1E646E578;
  id v20 = v9;
  id v21 = v7;
  v19[4] = self;
  id v16 = v9;
  id v17 = v7;
  [v16 notifyOnMainQueueWithBlock:v19];
}

void __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  id v6 = [*(id *)(a1 + 32) internal];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke_2;
  v9[3] = &unk_1E6470270;
  double v7 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  [v5 saveDataForTurnBasedMatch:v6 resolvedExchangeIDs:MEMORY[0x1E4F1CBF0] handler:v9];
}

void __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setInternal:a2];
  }
  [*(id *)(a1 + 40) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v3];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (id)exchangeForID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(GKTurnBasedMatch *)self exchanges];
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
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 exchangeID];
        char v11 = [v4 isEqualToString:v10];

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

- (void)saveMergedMatchData:(NSData *)matchData withResolvedExchanges:(NSArray *)exchanges completionHandler:(void *)completionHandler
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = matchData;
  id v9 = exchanges;
  id v10 = completionHandler;
  char v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1833, "-[GKTurnBasedMatch saveMergedMatchData:withResolvedExchanges:completionHandler:]");
  id v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  if (!v8)
  {
    if (GKApplicationLinkedOnOrAfter(458752, 657920))
    {
      id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil matchData" userInfo:0];
      objc_exception_throw(v29);
    }
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = 17;
    goto LABEL_14;
  }
  long long v13 = +[GKPreferences shared];
  uint64_t v14 = [v13 multiplayerAllowedPlayerType];

  if (!v14)
  {
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = 10;
LABEL_14:
    id v26 = [v24 userErrorForCode:v25 underlyingError:0];
    [v12 setError:v26];

    goto LABEL_15;
  }
  long long v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v9, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v30 = v9;
  long long v16 = v9;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v37 + 1) + 8 * i) exchangeID];
        [v15 addObject:v21];
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v18);
  }

  uint64_t v22 = [(GKTurnBasedMatch *)self internal];
  [v22 setMatchData:v8];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke;
  v34[3] = &unk_1E646D9A0;
  v34[4] = self;
  id v35 = v15;
  id v36 = v12;
  id v23 = v15;
  [v36 perform:v34];

  id v9 = v30;
LABEL_15:
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke_3;
  v31[3] = &unk_1E646E578;
  id v32 = v12;
  id v33 = v10;
  v31[4] = self;
  id v27 = v12;
  id v28 = v10;
  [v27 notifyOnMainQueueWithBlock:v31];
}

void __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  id v6 = [*(id *)(a1 + 32) internal];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke_2;
  v9[3] = &unk_1E6470270;
  uint64_t v7 = *(void *)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v8 = v3;
  [v5 saveDataForTurnBasedMatch:v6 resolvedExchangeIDs:v7 handler:v9];
}

void __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setInternal:a2];
  }
  [*(id *)(a1 + 40) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v3];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)sendExchangeToParticipants:(NSArray *)participants data:(NSData *)data localizableMessageKey:(NSString *)key arguments:(NSArray *)arguments timeout:(NSTimeInterval)timeout completionHandler:(void *)completionHandler
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = participants;
  long long v15 = data;
  long long v16 = key;
  uint64_t v17 = arguments;
  uint64_t v18 = completionHandler;
  uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1870, "-[GKTurnBasedMatch sendExchangeToParticipants:data:localizableMessageKey:arguments:timeout:completionHandler:]");
  id v20 = +[GKDispatchGroup dispatchGroupWithName:v19];

  id v21 = +[GKPreferences shared];
  uint64_t v22 = [v21 multiplayerAllowedPlayerType];

  if (v22)
  {
    if (!v16)
    {
      id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil or invalid localizable message key" userInfo:0];
      objc_exception_throw(v28);
    }
    uint64_t v23 = [(GKTurnBasedMatch *)self indexesForParticipants:v14];
    if (!v23)
    {
      id v29 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v30 = *MEMORY[0x1E4F1C3C8];
      if (v14) {
        uint64_t v31 = (__CFString *)v14;
      }
      else {
        uint64_t v31 = @"nil";
      }
      long long v45 = @"participants";
      v46[0] = v31;
      id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      id v33 = [v29 exceptionWithName:v30 reason:@"invalid list of recipient participants" userInfo:v32];

      objc_exception_throw(v33);
    }
    id v24 = (void *)v23;
    if (!v17) {
      uint64_t v17 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke;
    void v37[3] = &unk_1E64702E8;
    long long v38 = v16;
    uint64_t v17 = v17;
    long long v39 = v17;
    id v40 = v24;
    NSTimeInterval v44 = timeout;
    id v41 = v15;
    uint64_t v42 = self;
    id v43 = v20;
    id v25 = v24;
    [v43 perform:v37];
  }
  else
  {
    id v25 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
    [v20 setError:v25];
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke_3;
  v34[3] = &unk_1E646E578;
  id v35 = v20;
  id v36 = v18;
  v34[4] = self;
  id v26 = v20;
  id v27 = v18;
  [v26 notifyOnMainQueueWithBlock:v34];
}

void __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 _gkLocalizedStringForKey:*(void *)(a1 + 32) defaultValue:*(void *)(a1 + 32) arguments:*(void *)(a1 + 40)];
  id v6 = +[GKTurnBasedMatch _localizableMessageWithKey:*(void *)(a1 + 32) arguments:*(void *)(a1 + 40) defaultMessage:v5];
  uint64_t v7 = +[GKDaemonProxy proxyForLocalPlayer];
  id v8 = [v7 turnBasedService];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  double v11 = *(double *)(a1 + 80);
  id v12 = [*(id *)(a1 + 64) internal];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke_2;
  v15[3] = &unk_1E64702C0;
  long long v13 = *(void **)(a1 + 72);
  void v15[4] = *(void *)(a1 + 64);
  id v16 = v13;
  id v17 = v3;
  id v14 = v3;
  [v8 sendExchangeToParticipants:v9 data:v10 message:v6 timeout:v12 match:v15 handler:v11];
}

void __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a3)
  {
    id v18 = v8;
    [*(id *)(a1 + 32) setInternal:a3];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [*(id *)(a1 + 32) exchanges];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v16 = [v15 exchangeID];
          int v17 = [v7 isEqualToString:v16];

          if (v17) {
            [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:@"exchange"];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    uint64_t v9 = v18;
  }
  [*(id *)(a1 + 40) setError:v9];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v3];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"exchange"];
    id v5 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
  }
}

- (void)sendReminderToParticipants:(NSArray *)participants localizableMessageKey:(NSString *)key arguments:(NSArray *)arguments completionHandler:(void *)completionHandler
{
  v41[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = participants;
  uint64_t v11 = key;
  uint64_t v12 = arguments;
  uint64_t v13 = completionHandler;
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 1914, "-[GKTurnBasedMatch sendReminderToParticipants:localizableMessageKey:arguments:completionHandler:]");
  long long v15 = +[GKDispatchGroup dispatchGroupWithName:v14];

  id v16 = +[GKPreferences shared];
  uint64_t v17 = [v16 multiplayerAllowedPlayerType];

  if (!v17)
  {
    long long v22 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
    [v15 setError:v22];

    if (!v13) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  void v38[2] = __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke;
  v38[3] = &unk_1E6470310;
  id v18 = v10;
  long long v39 = v18;
  [(NSArray *)v18 enumerateObjectsUsingBlock:v38];
  uint64_t v19 = [(GKTurnBasedMatch *)self indexesForParticipants:v18];
  if (!v19)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    if (v18) {
      id v25 = (__CFString *)v18;
    }
    else {
      id v25 = @"nil";
    }
    id v40 = @"participants";
    v41[0] = v25;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v27 = [v23 exceptionWithName:v24 reason:@"invalid list of recipient participants" userInfo:v26];

    objc_exception_throw(v27);
  }
  if (!v11)
  {
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil or invalid localizable message key" userInfo:0];
    objc_exception_throw(v28);
  }
  long long v20 = (void *)v19;
  if (!v12) {
    uint64_t v12 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_2;
  v32[3] = &unk_1E646F940;
  id v33 = v11;
  uint64_t v12 = v12;
  id v34 = v12;
  id v35 = v20;
  id v36 = self;
  id v37 = v15;
  id v21 = v20;
  [v37 perform:v32];

  if (v13)
  {
LABEL_7:
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_4;
    v29[3] = &unk_1E646DC30;
    id v31 = v13;
    id v30 = v15;
    [v30 notifyOnMainQueueWithBlock:v29];
  }
LABEL_8:
}

void __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v3 = [v11 player];
  uint64_t v4 = +[GKLocalPlayer localPlayer];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v12 = @"participants";
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v10 = [v6 exceptionWithName:v7 reason:@"localPlayer is not a valid participant for reminder" userInfo:v9];

    objc_exception_throw(v10);
  }
}

void __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  int v5 = [v4 _gkLocalizedStringForKey:*(void *)(a1 + 32) defaultValue:*(void *)(a1 + 32) arguments:*(void *)(a1 + 40)];
  id v6 = +[GKTurnBasedMatch _localizableMessageWithKey:*(void *)(a1 + 32) arguments:*(void *)(a1 + 40) defaultMessage:v5];
  uint64_t v7 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v8 = [v7 turnBasedService];
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 56) internal];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_3;
  v12[3] = &unk_1E646D978;
  id v13 = *(id *)(a1 + 64);
  id v14 = v3;
  id v11 = v3;
  [v8 sendReminderToParticipants:v9 message:v6 match:v10 handler:v12];
}

uint64_t __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSArray)exchanges
{
  return self->_exchanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exchanges, 0);
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)state
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4[0] = 67109378;
  v4[1] = [a2 status];
  __int16 v5 = 2112;
  id v6 = a2;
  _os_log_error_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_ERROR, "Unexpected match status encountered: %d for match:%@", (uint8_t *)v4, 0x12u);
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "loadTurnBasedMatchWithDetailsForMatchID:Failed to load TBG Match Details: No Match ID", v1, 2u);
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "loadTurnBasedMatchWithDetailsForMatchID:Failed to get details for TBG MatchID:%@ .Error: %@", (uint8_t *)&v4, 0x16u);
}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_ERROR, "GKTurnBasedMatch loadURLWithMatchRequest completed with error: %@", v5, 0xCu);
}

@end