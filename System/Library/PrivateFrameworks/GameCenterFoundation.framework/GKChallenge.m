@interface GKChallenge
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (id)challengeForGame:(id)a3 andPlayer:(id)a4 withAchievement:(id)a5;
+ (id)challengeForGame:(id)a3 andPlayer:(id)a4 withScore:(id)a5;
+ (id)challengeForInternalRepresentation:(id)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)stringForState:(int64_t)a3;
+ (void)getCountOfChallenges:(id)a3;
+ (void)loadChallengesForGame:(id)a3 receivingPlayer:(id)a4 withCompletionHandler:(id)a5;
+ (void)loadChallengesForReceivingPlayer:(id)a3 withCompletionHandler:(id)a4;
+ (void)loadReceivedChallengesWithCompletionHandler:(void *)completionHandler;
+ (void)loadReceivedPendingChallengesWithCompletionHandler:(id)a3;
- (BOOL)detailsLoaded;
- (BOOL)hasLoadedUIDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKChallenge)initWithCoder:(id)a3;
- (GKChallenge)initWithInternalRepresentation:(id)a3;
- (GKChallengeInternal)internal;
- (GKGame)game;
- (GKPlayer)issuingPlayer;
- (GKPlayer)receivingPlayer;
- (NSString)issuingPlayerID;
- (NSString)receivingPlayerID;
- (id)infoTextForIssuingPlayer:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)decline;
- (void)declineWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)issueToPlayers:(id)a3 message:(id)a4;
- (void)issuingPlayerID;
- (void)loadDetailsWithCompletionHandler:(id)a3;
- (void)loadUIDetailsWithHandler:(id)a3;
- (void)receivingPlayerID;
- (void)setInternal:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKChallenge

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GKChallenge *)self internal];
    v7 = [v5 internal];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(GKChallenge *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (GKChallenge)initWithInternalRepresentation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKChallenge;
  return [(GKChallenge *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKChallenge)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"internal"];

  v6 = [(GKChallenge *)self initWithInternalRepresentation:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GKChallenge *)self internal];
  [v4 encodeObject:v5 forKey:@"internal"];
}

+ (id)stringForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"GKChallengeStateInvalid";
  }
  else {
    return off_1E6470A80[a3 - 1];
  }
}

+ (id)challengeForInternalRepresentation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = off_1E646C508;
LABEL_5:
    id v5 = (void *)[objc_alloc(*v4) initWithInternalRepresentation:v3];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = off_1E646C058;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

+ (id)challengeForGame:(id)a3 andPlayer:(id)a4 withScore:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 leaderboardIdentifier];
  if (!v10
    || (v11 = (void *)v10,
        [v9 leaderboardIdentifier],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:&stru_1F1E47DF8],
        v12,
        v11,
        v13))
  {
    if (v9)
    {
      v23 = @"score";
      v24[0] = v9;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    }
    else
    {
      uint64_t v21 = 0;
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"GKScore must have a defined category" userInfo:v21];
    objc_exception_throw(v22);
  }
  v14 = +[GKScoreChallengeInternal internalRepresentation];
  v15 = [v7 internal];
  [v14 setGame:v15];

  v16 = [v7 bundleIdentifier];
  [v14 setBundleID:v16];

  v17 = [v8 internal];
  [v14 setIssuingPlayer:v17];

  v18 = [v9 internal];
  [v14 setScore:v18];

  v19 = [[GKScoreChallenge alloc] initWithInternalRepresentation:v14];

  return v19;
}

+ (id)challengeForGame:(id)a3 andPlayer:(id)a4 withAchievement:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 identifier];
  if (!v10
    || (v11 = (void *)v10,
        [v9 identifier],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:&stru_1F1E47DF8],
        v12,
        v11,
        v13))
  {
    if (v9)
    {
      v23 = @"achievement";
      v24[0] = v9;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    }
    else
    {
      uint64_t v21 = 0;
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"GKAchievement must have a defined identifier" userInfo:v21];
    objc_exception_throw(v22);
  }
  v14 = +[GKAchievementChallengeInternal internalRepresentation];
  v15 = [v7 internal];
  [v14 setGame:v15];

  v16 = [v7 bundleIdentifier];
  [v14 setBundleID:v16];

  v17 = [v8 internal];
  [v14 setIssuingPlayer:v17];

  v18 = [v9 internal];
  [v14 setAchievement:v18];

  v19 = [[GKAchievementChallenge alloc] initWithInternalRepresentation:v14];

  return v19;
}

+ (void)getCountOfChallenges:(id)a3
{
  id v3 = a3;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 challengeServicePrivate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__GKChallenge_getCountOfChallenges___block_invoke;
  v7[3] = &unk_1E646FC58;
  id v8 = v3;
  id v6 = v3;
  [v5 getCountOfChallengesWithHandler:v7];
}

uint64_t __36__GKChallenge_getCountOfChallenges___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)loadChallengesForGame:(id)a3 receivingPlayer:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKChallenge.m", 188, "+[GKChallenge loadChallengesForGame:receivingPlayer:withCompletionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E64709D0;
  id v10 = v6;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  id v12 = v7;
  id v19 = v12;
  [v11 perform:v16];
  if (v12)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_5;
    v13[3] = &unk_1E646DC30;
    id v15 = v12;
    id v14 = v11;
    [v14 notifyOnMainQueueWithBlock:v13];
  }
}

void __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 challengeService];
  id v6 = [a1[4] gameDescriptorDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E64709A8;
  id v9 = a1[5];
  id v11 = a1[6];
  id v12 = v3;
  id v10 = a1[4];
  id v7 = v3;
  [v5 getChallengesForGameDescriptor:v6 handler:v8];
}

void __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if (*(void *)(a1 + 48) && [v5 count])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
          int v13 = *(void **)(a1 + 40);
          if (v13)
          {
            id v14 = [v13 internal];
            [v12 setGame:v14];
          }
          id v15 = +[GKChallenge challengeForInternalRepresentation:v12];
          if (v15) {
            [v6 addObject:v15];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    v16 = [v6 _gkMapWithBlock:&__block_literal_global_37];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E646EA20;
    id v19 = *(id *)(a1 + 32);
    id v20 = v6;
    id v21 = *(id *)(a1 + 56);
    id v17 = v6;
    [v16 _gkUpdateInternalPlayersScopedIDs:v18];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 score];
    id v4 = [v3 internal];
    id v5 = [v4 player];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"challenges"];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"challenges"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

+ (void)loadChallengesForReceivingPlayer:(id)a3 withCompletionHandler:(id)a4
{
}

+ (void)loadReceivedPendingChallengesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E646DCF0;
  id v6 = v3;
  id v4 = v3;
  +[GKChallenge loadReceivedChallengesWithCompletionHandler:v5];
}

void __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    uint64_t v8 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_61];
  uint64_t v10 = [v5 filteredArrayUsingPredicate:v9];
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v10, v6);
  }
}

BOOL __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke_58(uint64_t a1, void *a2)
{
  return [a2 state] == 1;
}

+ (void)loadReceivedChallengesWithCompletionHandler:(void *)completionHandler
{
  id v3 = completionHandler;
  id v4 = +[GKGame currentGame];
  id v5 = +[GKLocalPlayer localPlayer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__GKChallenge_loadReceivedChallengesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E646DCF0;
  id v8 = v3;
  id v6 = v3;
  +[GKChallenge loadChallengesForGame:v4 receivingPlayer:v5 withCompletionHandler:v7];
}

void __59__GKChallenge_loadReceivedChallengesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)issueToPlayers:(id)a3 message:(id)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [v20 count];
  if (!v20 || !v7)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"players must be provided to issue a challenge", 0, v20);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  id v8 = +[GKLocalPlayer localPlayer];
  int v9 = [v20 containsObject:v8];

  if (v9)
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v21[0] = @"challenge";
    v21[1] = @"players";
    v22[0] = self;
    v22[1] = v20;
    v21[2] = @"localPlayer";
    id v17 = +[GKLocalPlayer localPlayer];
    v22[2] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    id v19 = [v15 exceptionWithName:v16 reason:@"Issuing challenges to yourself is not allowed" userInfo:v18];

    objc_exception_throw(v19);
  }
  if ([v20 count])
  {
    [(GKChallenge *)self setMessage:v6];
    uint64_t v10 = [v20 _gkMapWithBlock:&__block_literal_global_81];
    uint64_t v11 = +[GKDaemonProxy proxyForLocalPlayer];
    id v12 = [v11 challengeService];
    int v13 = [(GKChallenge *)self internal];
    [v12 issueChallenge:v13 toPlayers:v10 handler:&__block_literal_global_84];
  }
}

uint64_t __38__GKChallenge_issueToPlayers_message___block_invoke(uint64_t a1, void *a2)
{
  return [a2 internal];
}

- (void)declineWithCompletionHandler:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(GKChallenge *)self state] != GKChallengeStatePending)
  {
    int v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    id v14 = @"invalidChallenge";
    v15[0] = self;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v9 exceptionWithName:v10 reason:@"Canceling challenges that are not currently pending is not allowed" userInfo:v11];

    objc_exception_throw(v12);
  }
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v6 = [v5 challengeService];
  uint64_t v7 = [(GKChallenge *)self internal];
  int v13 = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v6 abortChallenges:v8 handler:v4];
}

- (void)decline
{
}

- (GKGame)game
{
  id v3 = [GKGame alloc];
  id v4 = [(GKChallenge *)self internal];
  id v5 = [v4 game];
  id v6 = [(GKGame *)v3 initWithInternalRepresentation:v5];

  return v6;
}

- (NSString)issuingPlayerID
{
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    id v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKChallenge issuingPlayerID](v4);
    }
    id v5 = @"playerID is no longer available";
  }
  else
  {
    id v6 = [(GKChallenge *)self internal];
    uint64_t v7 = [v6 issuingPlayer];
    id v5 = [v7 playerID];
  }

  return (NSString *)v5;
}

- (NSString)receivingPlayerID
{
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    id v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKChallenge receivingPlayerID](v4);
    }
    id v5 = @"playerID is no longer available";
  }
  else
  {
    id v6 = [(GKChallenge *)self internal];
    uint64_t v7 = [v6 receivingPlayer];
    id v5 = [v7 playerID];
  }

  return (NSString *)v5;
}

- (GKPlayer)issuingPlayer
{
  uint64_t v2 = [(GKChallenge *)self internal];
  id v3 = [v2 issuingPlayer];
  id v4 = +[GKPlayer canonicalizedPlayerForInternal:v3];

  return (GKPlayer *)v4;
}

- (GKPlayer)receivingPlayer
{
  id v3 = [(GKChallenge *)self internal];
  id v4 = [v3 receivingPlayer];
  if (v4)
  {
    id v5 = [(GKChallenge *)self internal];
    id v6 = [v5 receivingPlayer];
    uint64_t v7 = +[GKPlayer canonicalizedPlayerForInternal:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (GKPlayer *)v7;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKChallenge;
  id v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
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
  v10.super_class = (Class)GKChallenge;
  id v5 = -[GKChallenge methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(GKChallenge *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKChallenge;
  if (-[GKChallenge respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKChallenge *)self forwardingTargetForSelector:a3];
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
    return +[GKChallengeInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKChallenge *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKChallenge *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (BOOL)hasLoadedUIDetails
{
  return 0;
}

- (void)loadUIDetailsWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (id)infoTextForIssuingPlayer:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  int v5 = +[GCFLocalizedStrings CHALLENGE_DETAIL_GOAL_FORMAT];
  id v6 = [v4 displayNameWithOptions:0];

  id v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);

  return v7;
}

- (BOOL)detailsLoaded
{
  return 0;
}

- (void)loadDetailsWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (GKChallengeInternal)internal
{
  return (GKChallengeInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

void __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "cannot load received challenges due to error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)issuingPlayerID
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  int v2 = "-[GKChallenge issuingPlayerID]";
  __int16 v3 = 2114;
  uint64_t v4 = @"14.0";
  __int16 v5 = 2114;
  id v6 = @"11.0";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

- (void)receivingPlayerID
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  int v2 = "-[GKChallenge receivingPlayerID]";
  __int16 v3 = 2114;
  uint64_t v4 = @"14.0";
  __int16 v5 = 2114;
  id v6 = @"11.0";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

@end