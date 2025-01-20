@interface GKScore
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (void)reportScores:(NSArray *)scores withCompletionHandler:(void *)completionHandler;
+ (void)reportScores:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 withCompletionHandler:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldSetDefaultLeaderboard;
- (GKGame)game;
- (GKPlayer)player;
- (GKScore)init;
- (GKScore)initWithCoder:(id)a3;
- (GKScore)initWithInternalRepresentation:(id)a3;
- (GKScore)initWithInternalRepresentation:(id)a3 playerID:(id)a4;
- (GKScore)initWithInternalRepresentation:(id)a3 playerInternal:(id)a4;
- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier;
- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier forPlayer:(NSString *)playerID;
- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier player:(GKPlayer *)player;
- (GKScoreInternal)internal;
- (NSString)playerID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)player;
- (void)reportScoreWithCompletionHandler:(void *)completionHandler;
- (void)setGame:(id)a3;
- (void)setInternal:(id)a3;
- (void)setShouldSetDefaultLeaderboard:(BOOL)shouldSetDefaultLeaderboard;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKScore

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [GKScore alloc];
  v5 = [(GKScore *)self internal];
  v6 = (void *)[v5 copy];
  v7 = [(GKScore *)v4 initWithInternalRepresentation:v6];

  return v7;
}

- (GKScore)initWithInternalRepresentation:(id)a3 playerInternal:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKScore;
  v8 = [(GKScore *)&v13 init];
  if (v8)
  {
    if (!v6)
    {
      id v6 = +[GKInternalRepresentation internalRepresentation];
    }
    objc_storeStrong((id *)&v8->_internal, v6);
    uint64_t v9 = +[GKGame currentGame];
    game = v8->_game;
    v8->_game = (GKGame *)v9;

    v11 = [(GKScoreInternal *)v8->_internal player];

    if (!v11) {
      [(GKScoreInternal *)v8->_internal setPlayer:v7];
    }
  }

  return v8;
}

- (GKScore)initWithInternalRepresentation:(id)a3 playerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 player];
  if (!v8)
  {
    if (v7)
    {
      v10 = 0;
    }
    else
    {
      v11 = +[GKLocalPlayer localPlayer];
      v12 = [v11 internal];
      id v7 = [v12 playerID];

      v10 = [v11 alias];

      if (!v7)
      {
        uint64_t v9 = 0;
        goto LABEL_7;
      }
    }
    uint64_t v9 = +[GKInternalRepresentation internalRepresentation];
    [v9 setPlayerID:v7];
    [v9 setAlias:v10];
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
LABEL_8:
  objc_super v13 = [(GKScore *)self initWithInternalRepresentation:v6 playerInternal:v9];

  return v13;
}

- (GKScore)initWithInternalRepresentation:(id)a3
{
  return [(GKScore *)self initWithInternalRepresentation:a3 playerID:0];
}

- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier
{
  v4 = identifier;
  v5 = +[GKInternalRepresentation internalRepresentation];
  [v5 setLeaderboardIdentifier:v4];

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setDate:v6];

  id v7 = [(GKScore *)self initWithInternalRepresentation:v5 playerID:0];
  return v7;
}

- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier player:(GKPlayer *)player
{
  id v6 = player;
  id v7 = identifier;
  uint64_t v8 = +[GKInternalRepresentation internalRepresentation];
  [v8 setLeaderboardIdentifier:v7];

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  [v8 setDate:v9];

  v10 = [(GKPlayer *)v6 internal];

  v11 = [v10 minimalInternal];
  v12 = [(GKScore *)self initWithInternalRepresentation:v8 playerInternal:v11];

  return v12;
}

- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier forPlayer:(NSString *)playerID
{
  id v6 = identifier;
  id v7 = playerID;
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    uint64_t v9 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKScore initWithLeaderboardIdentifier:forPlayer:](v9);
    }
    v10 = 0;
  }
  else
  {
    v11 = +[GKInternalRepresentation internalRepresentation];
    [v11 setLeaderboardIdentifier:v6];
    v12 = [MEMORY[0x1E4F1C9C8] date];
    [v11 setDate:v12];

    self = [(GKScore *)self initWithInternalRepresentation:v11 playerID:v7];
    v10 = self;
  }

  return v10;
}

- (GKScore)init
{
  v3 = +[GKGame currentGame];
  v4 = [v3 defaultCategory];
  v5 = [(GKScore *)self initWithLeaderboardIdentifier:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKScore)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"internal"];
  id v6 = [(GKScore *)self initWithInternalRepresentation:v5];
  id v7 = v6;
  if (!v5)
  {
    v5 = [(GKScore *)v6 internal];
    objc_msgSend(v5, "setValue:", objc_msgSend(v4, "decodeInt64ForKey:", @"value"));
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formattedValue"];
    [v5 setFormattedValue:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    [v5 setLeaderboardIdentifier:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    [v5 setDate:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerID"];
    v12 = +[GKInternalRepresentation internalRepresentation];
    [v12 setPlayerID:v11];
    [v5 setPlayer:v12];
    objc_msgSend(v5, "setRank:", objc_msgSend(v4, "decodeIntegerForKey:", @"rank"));
    objc_msgSend(v5, "setContext:", objc_msgSend(v4, "decodeInt64ForKey:", @"context"));
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GKScore *)self internal];
  [v4 encodeObject:v5 forKey:@"internal"];
}

- (NSString)playerID
{
  v2 = [(GKScoreInternal *)self->_internal player];
  v3 = [v2 playerID];

  return (NSString *)v3;
}

- (GKPlayer)player
{
  v3 = [(GKScoreInternal *)self->_internal player];
  uint64_t v4 = [v3 playerID];
  if (v4
    && (id v5 = (void *)v4,
        [v3 alias],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = +[GKPlayer canonicalizedPlayerForInternal:v3];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    uint64_t v9 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      [(GKScore *)(uint64_t)self player];
    }
    id v7 = 0;
  }

  return (GKPlayer *)v7;
}

+ (void)reportScores:(NSArray *)scores withCompletionHandler:(void *)completionHandler
{
}

+ (void)reportScores:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a5;
  id v33 = a6;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = @"GKInvalidArgumentException";
    uint64_t v12 = *(void *)v45;
    uint64_t v35 = *(void *)v45;
    do
    {
      uint64_t v13 = 0;
      uint64_t v36 = v10;
      do
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
        v15 = [v14 leaderboardIdentifier];
        if (v15)
        {
        }
        else if (GKApplicationLinkedOnOrAfter(262912, 0))
        {
          [MEMORY[0x1E4F1CA00] raise:v11 format:@"A GKScore must specify a leaderboard."];
        }
        if (([v14 valueSet] & 1) == 0 && GKApplicationLinkedOnOrAfter(393216, 0)) {
          [MEMORY[0x1E4F1CA00] raise:v11 format:@"A GKScore must contain an initialized value."];
        }
        v16 = [v14 player];
        v17 = v16;
        if (v16)
        {
          if ([v16 isLocalPlayer]) {
            goto LABEL_22;
          }
          v18 = (void *)MEMORY[0x1E4F1CA00];
          v19 = [v17 internal];
          v20 = [v19 conciseDescription];
          [v18 raise:v11, @"A GKScore can only be submitted for another player when ending a turn-based match (trying to submit score for %@)", v20 format];
        }
        else
        {
          v19 = [v14 playerID];
          if (v19)
          {
            v21 = v11;
            id v22 = v8;
            v23 = +[GKLocalPlayer localPlayer];
            v24 = [v23 internal];
            v25 = [v24 playerID];
            char v26 = [v19 isEqualToString:v25];

            if (v26)
            {
              id v8 = v22;
              v11 = v21;
            }
            else
            {
              v11 = v21;
              [MEMORY[0x1E4F1CA00] raise:v21, @"A GKScore can only be submitted for another player when ending a turn-based match (trying to submit score for %@)", v19 format];
              id v8 = v22;
            }
            uint64_t v12 = v35;
            uint64_t v10 = v36;
          }
        }

LABEL_22:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v10);
  }
  v27 = +[GKPreferences shared];
  int v28 = [v27 isStoreDemoModeEnabled];

  if (!v28)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2;
    v37[3] = &unk_1E6470048;
    v31 = &v38;
    id v38 = v8;
    BOOL v41 = a4;
    v29 = v34;
    id v39 = v34;
    v30 = v33;
    id v40 = v33;
    gk_dispatch_as_group(v37);

    goto LABEL_28;
  }
  v30 = v33;
  v29 = v34;
  if (v33)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke;
    block[3] = &unk_1E646D7A0;
    v31 = &v43;
    id v43 = v33;
    dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_28:
  }
}

uint64_t __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__8;
  v19[4] = __Block_byref_object_dispose__8;
  id v20 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_50;
  aBlock[3] = &unk_1E646FFA8;
  aBlock[4] = v19;
  uint64_t v4 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2_52;
  v13[3] = &unk_1E646FFF8;
  id v14 = *(id *)(a1 + 32);
  char v17 = *(unsigned char *)(a1 + 56);
  id v15 = *(id *)(a1 + 40);
  id v5 = v4;
  id v16 = v5;
  gk_dispatch_group_do(v3, v13);
  id v6 = [*(id *)(a1 + 32) lastObject];
  if ([v6 shouldSetDefaultLeaderboard])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_4;
    v10[3] = &unk_1E6470020;
    id v11 = v6;
    id v12 = v5;
    gk_dispatch_group_do(v3, v10);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_6;
  block[3] = &unk_1E646E980;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = v19;
  dispatch_group_notify(v3, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v19, 8);
}

void __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_50(uint64_t a1, void *a2)
{
}

void __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2_52(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  id v6 = [*(id *)(a1 + 32) _gkValuesForKeyPath:@"internal"];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  id v8 = [*(id *)(a1 + 40) _gkValuesForKeyPath:@"challengeID"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E646FFD0;
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  id v9 = v3;
  [v5 submitScores:v6 whileScreeningChallenges:v7 withEligibleChallenges:v8 handler:v10];
}

uint64_t __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKLocalPlayer localPlayer];
  id v5 = [*(id *)(a1 + 32) leaderboardIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E646FFD0;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v4 setDefaultLeaderboardIdentifier:v5 completionHandler:v7];
}

uint64_t __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (void)reportScoreWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = completionHandler;
  id v6 = [v4 arrayWithObject:self];
  +[GKScore reportScores:v6 withCompletionHandler:v5];
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)GKScore;
  id v15 = [(GKScore *)&v16 description];
  id v3 = [(GKScore *)self player];
  uint64_t v4 = [v3 internal];
  id v5 = [v4 conciseDescription];
  NSInteger v6 = [(GKScore *)self rank];
  uint64_t v7 = [(GKScore *)self date];
  int64_t v8 = [(GKScore *)self value];
  id v9 = [(GKScore *)self formattedValue];
  uint64_t v10 = [(GKScore *)self context];
  id v11 = [(GKScore *)self leaderboardIdentifier];
  id v12 = [(GKScore *)self groupLeaderboardIdentifier];
  uint64_t v13 = [v15 stringByAppendingFormat:@"player:%@ rank:%ld date:%@ value:%lld formattedValue:%@ context:0x%llx leaderboard:%@ group:%@", v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (unint64_t)hash
{
  v2 = [(GKScore *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(GKScore *)self internal];
    NSInteger v6 = [v4 internal];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKScore;
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
  char v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKScore;
  id v5 = -[GKScore methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    int64_t v8 = [(GKScore *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKScore;
  if (-[GKScore respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKScore *)self forwardingTargetForSelector:a3];
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
    return +[GKScoreInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKScore *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKScore *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (GKScoreInternal)internal
{
  return (GKScoreInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternal:(id)a3
{
}

- (BOOL)shouldSetDefaultLeaderboard
{
  return self->_shouldSetDefaultLeaderboard;
}

- (void)setShouldSetDefaultLeaderboard:(BOOL)shouldSetDefaultLeaderboard
{
  self->_shouldSetDefaultLeaderboard = shouldSetDefaultLeaderboard;
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_game, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)initWithLeaderboardIdentifier:(os_log_t)log forPlayer:.cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  v2 = "-[GKScore initWithLeaderboardIdentifier:forPlayer:]";
  __int16 v3 = 2114;
  id v4 = @"14.0";
  __int16 v5 = 2114;
  id v6 = @"11.0";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

- (void)player
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "<GKScore %p> has a nil or invalid internal player, will return a nil player", (uint8_t *)&v2, 0xCu);
}

@end