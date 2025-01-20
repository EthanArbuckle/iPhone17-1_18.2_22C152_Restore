@interface GKAchievement
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)shouldShowBannerOnReport:(id)a3 achievementDescription:(id)a4 reportedAchievements:(id)a5;
+ (BOOL)shouldShowBannerOnReport:(id)a3 achievementDescription:(id)a4 reportedAchievements:(id)a5 uiFrameworkMethodsRequired:(BOOL)a6;
+ (BOOL)shouldShowBannerOnReport:(id)a3 reportedAchievements:(id)a4;
+ (BOOL)shouldShowBannerOnReport:(id)a3 reportedAchievements:(id)a4 uiFrameworkMethodsRequired:(BOOL)a5;
+ (BOOL)showBannerIsSupported;
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForAchievement:(id)a3 achievementDescriptions:(id)a4;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (void)loadAchievementWithID:(id)a3 forGame:(id)a4 players:(id)a5 complete:(id)a6;
+ (void)loadAchievementsForGameV2:(id)a3 player:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 withCompletionHandler:(id)a7;
+ (void)loadAchievementsForGameV2:(id)a3 players:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 withCompletionHandler:(id)a7;
+ (void)loadAchievementsWithCompletionHandler:(void *)completionHandler;
+ (void)reportAchievements:(NSArray *)achievements withCompletionHandler:(void *)completionHandler;
+ (void)reportAchievements:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 withCompletionHandler:(id)a6;
+ (void)resetAchievementsWithCompletionHandler:(void *)completionHandler;
- (BOOL)isCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)showsCompletionBanner;
- (GKAchievement)init;
- (GKAchievement)initWithCoder:(id)a3;
- (GKAchievement)initWithIdentifier:(NSString *)identifier;
- (GKAchievement)initWithIdentifier:(NSString *)identifier forPlayer:(NSString *)playerID;
- (GKAchievement)initWithIdentifier:(NSString *)identifier player:(GKPlayer *)player;
- (GKAchievement)initWithInternalRepresentation:(id)a3;
- (GKAchievement)initWithInternalRepresentation:(id)a3 playerID:(id)a4;
- (GKAchievementInternal)internal;
- (GKGame)game;
- (GKPlayer)player;
- (NSString)playerID;
- (id)_achievementDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)player;
- (void)playerID;
- (void)reportAchievementWithCompletionHandler:(void *)completionHandler;
- (void)setGame:(id)a3;
- (void)setInternal:(id)a3;
- (void)setShowsCompletionBanner:(BOOL)showsCompletionBanner;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKAchievement

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(GKAchievement *)self percentComplete];
    double v7 = v6;
    [v5 percentComplete];
    if (v7 == v8)
    {
      v9 = [(GKAchievement *)self internal];
      v10 = [v5 internal];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(GKAchievement *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (GKAchievement)initWithInternalRepresentation:(id)a3
{
  return [(GKAchievement *)self initWithInternalRepresentation:a3 playerID:0];
}

- (GKAchievement)initWithInternalRepresentation:(id)a3 playerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[GKInternalRepresentation internalRepresentation];
  }
  v22.receiver = self;
  v22.super_class = (Class)GKAchievement;
  double v8 = [(GKAchievement *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v6 gameHint], v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      char v11 = [GKGame alloc];
      v12 = [v6 gameHint];
      uint64_t v13 = [(GKGame *)v11 initWithInternalRepresentation:v12];
      game = v9->_game;
      v9->_game = (GKGame *)v13;
    }
    else
    {
      uint64_t v15 = +[GKGame currentGame];
      v12 = v9->_game;
      v9->_game = (GKGame *)v15;
    }

    v9->_showsCompletionBanner = 1;
    v16 = [(GKAchievementInternal *)v9->_internal player];

    if (!v16)
    {
      if (v7)
      {
        v17 = 0;
      }
      else
      {
        v18 = +[GKLocalPlayer localPlayer];
        v19 = [v18 internal];
        id v7 = [v19 playerID];

        v17 = [v18 alias];
      }
      v20 = +[GKInternalRepresentation internalRepresentation];
      [v20 setPlayerID:v7];
      [v20 setAlias:v17];
      [(GKAchievementInternal *)v9->_internal setPlayer:v20];
    }
  }

  return v9;
}

- (GKAchievement)initWithIdentifier:(NSString *)identifier
{
  id v4 = identifier;
  id v5 = +[GKInternalRepresentation internalRepresentation];
  [v5 setIdentifier:v4];

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setLastReportedDate:v6];

  id v7 = [(GKAchievement *)self initWithInternalRepresentation:v5];
  return v7;
}

- (GKAchievement)initWithIdentifier:(NSString *)identifier player:(GKPlayer *)player
{
  id v6 = identifier;
  id v7 = player;
  if (!v7)
  {
    id v7 = +[GKLocalPlayer localPlayer];
  }
  double v8 = +[GKInternalRepresentation internalRepresentation];
  [v8 setIdentifier:v6];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  [v8 setLastReportedDate:v9];

  v10 = [(GKPlayer *)v7 internal];
  char v11 = [v10 minimalInternal];
  [v8 setPlayer:v11];

  v12 = [(GKAchievement *)self initWithInternalRepresentation:v8];
  return v12;
}

- (GKAchievement)initWithIdentifier:(NSString *)identifier forPlayer:(NSString *)playerID
{
  id v6 = identifier;
  id v7 = playerID;
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    v9 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKAchievement initWithIdentifier:forPlayer:](v9);
    }
    v10 = 0;
  }
  else
  {
    char v11 = +[GKInternalRepresentation internalRepresentation];
    [v11 setIdentifier:v6];
    v12 = [MEMORY[0x1E4F1C9C8] date];
    [v11 setLastReportedDate:v12];

    self = [(GKAchievement *)self initWithInternalRepresentation:v11 playerID:v7];
    v10 = self;
  }

  return v10;
}

- (GKAchievement)init
{
  return [(GKAchievement *)self initWithIdentifier:@"*uninitialized achievement identifier*"];
}

- (NSString)playerID
{
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    id v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKAchievement playerID](v4);
    }
    id v5 = @"playerID is no longer available";
  }
  else
  {
    id v6 = [(GKAchievementInternal *)self->_internal player];
    id v5 = [v6 playerID];
  }

  return (NSString *)v5;
}

- (GKPlayer)player
{
  id v3 = [(GKAchievementInternal *)self->_internal player];
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
    v9 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      [(GKAchievement *)(uint64_t)self player];
    }
    id v7 = 0;
  }

  return (GKPlayer *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAchievement)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"internal"];
  id v6 = [(GKAchievement *)self initWithInternalRepresentation:v5];
  id v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      id v5 = [(GKAchievement *)v6 internal];
      id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      [v5 setIdentifier:v8];

      [v4 decodeDoubleForKey:@"percentComplete"];
      objc_msgSend(v5, "setPercentComplete:");
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastReportedDate"];
      [v5 setLastReportedDate:v9];
    }
    -[GKAchievement setShowsCompletionBanner:](v7, "setShowsCompletionBanner:", [v4 decodeBoolForKey:@"showsCompletionBanner"]);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(GKAchievement *)self internal];
  [v5 encodeObject:v4 forKey:@"internal"];

  objc_msgSend(v5, "encodeBool:forKey:", -[GKAchievement showsCompletionBanner](self, "showsCompletionBanner"), @"showsCompletionBanner");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [GKAchievement alloc];
  id v5 = [(GKAchievement *)self internal];
  id v6 = (void *)[v5 copy];
  id v7 = [(GKAchievement *)v4 initWithInternalRepresentation:v6];

  return v7;
}

- (BOOL)isCompleted
{
  [(GKAchievement *)self percentComplete];
  return v2 >= 100.0;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)GKAchievement;
  id v3 = [(GKAchievement *)&v8 description];
  id v4 = [(GKAchievement *)self identifier];
  [(GKAchievement *)self percentComplete];
  id v6 = [v3 stringByAppendingFormat:@"id: %@\t%f", v4, v5];

  return v6;
}

+ (void)loadAchievementsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  uint64_t v5 = +[GKLocalPlayer localPlayer];
  id v6 = +[GKGame currentGame];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__GKAchievement_loadAchievementsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E646DCF0;
  id v9 = v4;
  id v7 = v4;
  [a1 loadAchievementsForGameV2:v6 player:v5 includeUnreported:0 includeHidden:1 withCompletionHandler:v8];
}

void __55__GKAchievement_loadAchievementsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
      objc_super v8 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

+ (void)loadAchievementsForGameV2:(id)a3 player:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 withCompletionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a7;
  v21[0] = v11;
  uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
  id v14 = a3;
  uint64_t v15 = [v13 arrayWithObjects:v21 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__GKAchievement_loadAchievementsForGameV2_player_includeUnreported_includeHidden_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E646E2E0;
  id v19 = v11;
  id v20 = v12;
  id v16 = v11;
  id v17 = v12;
  +[GKAchievement loadAchievementsForGameV2:v14 players:v15 includeUnreported:v9 includeHidden:v8 withCompletionHandler:v18];
}

void __104__GKAchievement_loadAchievementsForGameV2_player_includeUnreported_includeHidden_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a3;
    id v7 = a2;
    id v9 = [v5 referenceKey];
    BOOL v8 = [v7 objectForKey:v9];

    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);
  }
}

+ (void)loadAchievementsForGameV2:(id)a3 players:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 withCompletionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v14 = [v12 count];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
  id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKAchievement.m", 245, "+[GKAchievement loadAchievementsForGameV2:players:includeUnreported:includeHidden:withCompletionHandler:]");
  id v17 = +[GKDispatchGroup dispatchGroupWithName:v16];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke;
  v26[3] = &unk_1E646E380;
  id v18 = v11;
  id v27 = v18;
  id v19 = v12;
  id v28 = v19;
  BOOL v31 = a5;
  BOOL v32 = a6;
  id v20 = v15;
  id v29 = v20;
  id v21 = v17;
  id v30 = v21;
  [v21 perform:v26];
  if (v13)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_5;
    v22[3] = &unk_1E646D950;
    id v25 = v13;
    id v23 = v20;
    id v24 = v21;
    [v24 notifyOnMainQueueWithBlock:v22];
  }
}

void __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  id v6 = [*(id *)(a1 + 32) gameDescriptor];
  id v7 = [*(id *)(a1 + 40) _gkInternalsFromPlayers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E646E358;
  id v10 = *(id *)(a1 + 40);
  __int16 v15 = *(_WORD *)(a1 + 64);
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = v3;
  id v8 = v3;
  [v5 getAchievementsForGameDescriptor:v6 players:v7 handler:v9];
}

void __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_3;
  id v12 = &unk_1E646E330;
  id v13 = v5;
  __int16 v16 = *(_WORD *)(a1 + 72);
  id v6 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v7 = v5;
  id v8 = a3;
  [v6 enumerateObjectsUsingBlock:&v9];
  objc_msgSend(*(id *)(a1 + 56), "setError:", v8, v9, v10, v11, v12);

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 internal];
  id v5 = [v4 playerID];

  if ([v5 length])
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_4;
    v11[3] = &unk_1E646E308;
    __int16 v14 = *(_WORD *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    id v7 = v3;
    id v13 = v7;
    id v8 = [v6 _gkFilterWithBlock:v11];

    if (v8)
    {
      uint64_t v9 = *(void **)(a1 + 48);
      uint64_t v10 = [v7 referenceKey];
      [v9 setObject:v8 forKey:v10];
    }
  }
}

GKAchievement *__105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48)
    || ([v3 lastReportedDate],
        id v5 = (GKAchievement *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if (*(unsigned char *)(a1 + 49)
      || ![v4 isHidden]
      || [v4 isCompleted])
    {
      id v5 = [[GKAchievement alloc] initWithInternalRepresentation:v4];
      [(GKAchievement *)v5 setGame:*(void *)(a1 + 32)];
      id v6 = [*(id *)(a1 + 40) internal];
      id v7 = [v6 minimalInternal];
      id v8 = [(GKAchievement *)v5 internal];
      [v8 setPlayer:v7];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

void __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) error];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

+ (void)loadAchievementWithID:(id)a3 forGame:(id)a4 players:(id)a5 complete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKAchievement.m", 284, "+[GKAchievement loadAchievementWithID:forGame:players:complete:]");
  id v15 = +[GKDispatchGroup dispatchGroupWithName:v14];

  uint64_t v16 = [v12 count];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke;
  v27[3] = &unk_1E646E3D0;
  id v33 = a1;
  id v18 = v11;
  id v28 = v18;
  id v19 = v12;
  id v29 = v19;
  id v20 = v10;
  id v30 = v20;
  id v21 = v17;
  id v31 = v21;
  id v22 = v15;
  id v32 = v22;
  [v22 perform:v27];
  if (v13)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke_3;
    v23[3] = &unk_1E646D950;
    id v26 = v13;
    id v24 = v21;
    id v25 = v22;
    [v25 notifyOnMainQueueWithBlock:v23];
  }
}

void __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke_2;
  v8[3] = &unk_1E646E3A8;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v12 = v3;
  id v7 = v3;
  [v4 loadAchievementsForGameV2:v5 players:v6 includeUnreported:0 includeHidden:0 withCompletionHandler:v8];
}

void __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [a2 allValues];
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              id v13 = [v12 identifier];
              if ([v13 isEqualToString:*(void *)(a1 + 32)])
              {
              }
              else
              {
                __int16 v14 = [v12 groupIdentifier];
                int v15 = [v14 isEqualToString:*(void *)(a1 + 32)];

                if (!v15) {
                  continue;
                }
              }
              [*(id *)(a1 + 40) addObject:v12];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v9);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  [*(id *)(a1 + 48) setError:v16];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) error];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

+ (void)resetAchievementsWithCompletionHandler:(void *)completionHandler
{
  id v3 = completionHandler;
  id v4 = +[GKPreferences shared];
  int v5 = [v4 isStoreDemoModeEnabled];

  if (v5)
  {
    if (v3) {
      v3[2](v3, 0);
    }
  }
  else
  {
    uint64_t v6 = +[GKDaemonProxy proxyForLocalPlayer];
    id v7 = [v6 gameStatService];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__GKAchievement_resetAchievementsWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E646E098;
    uint64_t v9 = v3;
    [v7 resetAchievementsWithHandler:v8];
  }
}

uint64_t __56__GKAchievement_resetAchievementsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)reportAchievements:(NSArray *)achievements withCompletionHandler:(void *)completionHandler
{
}

+ (void)reportAchievements:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void))a6;
  id v12 = +[GKPreferences shared];
  int v13 = [v12 isStoreDemoModeEnabled];

  if (v13)
  {
    if (v11) {
      v11[2](v11, 0);
    }
  }
  else
  {
    BOOL v34 = a4;
    v35 = v10;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    long long v45 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v20 = [v19 player];
          if (v20)
          {
            long long v21 = (void *)v20;
            long long v22 = [v19 player];
            char v23 = [v22 isLocalPlayer];

            if ((v23 & 1) == 0)
            {
              if (!os_log_GKGeneral) {
                id v29 = GKOSLoggers();
              }
              uint64_t v30 = os_log_GKError;
              id v10 = v35;
              if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
                +[GKAchievement reportAchievements:whileScreeningChallenges:withEligibleChallenges:withCompletionHandler:]((uint64_t)v19, v30);
              }
              id v31 = (void *)MEMORY[0x1E4F28C58];
              v49[0] = @"achievement";
              v49[1] = @"description";
              v50[0] = v19;
              v50[1] = @"A GKAchievement for another player can only be submitted when ending a turn-based match.";
              id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
              id v33 = [v31 userErrorForCode:17 userInfo:v32];

              ((void (**)(id, void *))v11)[2](v11, v33);
              goto LABEL_21;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    long long v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKAchievement.m", 351, "+[GKAchievement reportAchievements:whileScreeningChallenges:withEligibleChallenges:withCompletionHandler:]");
    long long v25 = +[GKDispatchGroup dispatchGroupWithName:v24];

    long long v26 = +[GKLocalPlayer localPlayer];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke;
    v39[3] = &unk_1E646E448;
    id v27 = v26;
    id v40 = v27;
    id v28 = v25;
    id v41 = v28;
    id v42 = v14;
    BOOL v44 = v34;
    id v10 = v35;
    id v43 = v35;
    [v28 perform:v39];
    if (v11)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_5;
      v36[3] = &unk_1E646DC30;
      v38 = v11;
      id v37 = v28;
      [v37 notifyOnMainQueueWithBlock:v36];
    }
  }
LABEL_21:
}

void __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKGame currentGame];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E646E420;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v9 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  +[GKAchievementDescription loadAchievementDescriptionsForGame:v4 withCompletionHandler:v6];
}

void __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKGame currentGame];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E646E3F8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  char v13 = *(unsigned char *)(a1 + 72);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  +[GKAchievement loadAchievementsForGameV2:v4 player:v5 includeUnreported:1 includeHidden:1 withCompletionHandler:v7];
}

void __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) setError:a3];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v12 = +[GKAchievement descriptionForAchievement:v11 achievementDescriptions:*(void *)(a1 + 48)];
          if (v12)
          {
            if (+[GKAchievement shouldShowBannerOnReport:v11 achievementDescription:v12 reportedAchievements:v5])
            {
              [v12 showBanner];
            }
            char v13 = [v12 rarityPercent];
            id v14 = [v11 internal];
            [v14 setRarityPercent:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    uint64_t v15 = +[GKDaemonProxy proxyForLocalPlayer];
    uint64_t v16 = [v15 gameStatService];
    uint64_t v17 = [*(id *)(a1 + 40) _gkValuesForKeyPath:@"internal"];
    uint64_t v18 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v19 = [*(id *)(a1 + 56) _gkValuesForKeyPath:@"challengeID"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_4;
    v20[3] = &unk_1E646D978;
    id v21 = *(id *)(a1 + 32);
    id v22 = *(id *)(a1 + 64);
    [v16 submitAchievements:v17 whileScreeningChallenges:v18 withEligibleChallenges:v19 handler:v20];
  }
}

uint64_t __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)descriptionForAchievement:(id)a3 achievementDescriptions:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = [v5 identifier];
  uint64_t v9 = [v6 predicateWithFormat:@"identifier == %@", v8];

  id v10 = [v7 filteredArrayUsingPredicate:v9];

  if ([v10 count])
  {
    if ((unint64_t)[v10 count] >= 2)
    {
      if (!os_log_GKGeneral) {
        id v11 = GKOSLoggers();
      }
      id v12 = (void *)os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        +[GKAchievement descriptionForAchievement:achievementDescriptions:](v12, v5);
      }
    }
    char v13 = [v10 firstObject];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v14 = GKOSLoggers();
    }
    uint64_t v15 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      +[GKAchievement descriptionForAchievement:achievementDescriptions:](v15, v5);
    }
    char v13 = 0;
  }

  return v13;
}

+ (BOOL)showBannerIsSupported
{
  if (showBannerIsSupported_supportsShowBannerOnceToken != -1) {
    dispatch_once(&showBannerIsSupported_supportsShowBannerOnceToken, &__block_literal_global_16);
  }
  return showBannerIsSupported_supportsShowBanner;
}

uint64_t __38__GKAchievement_showBannerIsSupported__block_invoke()
{
  uint64_t result = [(id)objc_opt_class() instancesRespondToSelector:sel_showBanner];
  showBannerIsSupported_supportsShowBanner = result;
  return result;
}

+ (BOOL)shouldShowBannerOnReport:(id)a3 reportedAchievements:(id)a4
{
  return +[GKAchievement shouldShowBannerOnReport:a3 achievementDescription:0 reportedAchievements:a4];
}

+ (BOOL)shouldShowBannerOnReport:(id)a3 achievementDescription:(id)a4 reportedAchievements:(id)a5
{
  return +[GKAchievement shouldShowBannerOnReport:a3 achievementDescription:a4 reportedAchievements:a5 uiFrameworkMethodsRequired:1];
}

+ (BOOL)shouldShowBannerOnReport:(id)a3 reportedAchievements:(id)a4 uiFrameworkMethodsRequired:(BOOL)a5
{
  return +[GKAchievement shouldShowBannerOnReport:a3 achievementDescription:0 reportedAchievements:a4 uiFrameworkMethodsRequired:a5];
}

+ (BOOL)shouldShowBannerOnReport:(id)a3 achievementDescription:(id)a4 reportedAchievements:(id)a5 uiFrameworkMethodsRequired:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = v11
     && [v11 isReplayable]
     && +[GKUtils applicationLinkedOnOrAfter:1179648 macVersion:983040];
  if ([v10 showsCompletionBanner]
    && [v10 isCompleted]
    && (!v6 || [a1 showBannerIsSupported]))
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __113__GKAchievement_shouldShowBannerOnReport_achievementDescription_reportedAchievements_uiFrameworkMethodsRequired___block_invoke;
    v16[3] = &unk_1E646E470;
    id v17 = v10;
    uint64_t v18 = &v20;
    BOOL v19 = v13;
    [v12 enumerateObjectsUsingBlock:v16];
    BOOL v14 = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __113__GKAchievement_shouldShowBannerOnReport_achievementDescription_reportedAchievements_uiFrameworkMethodsRequired___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  BOOL v6 = [v12 identifier];
  id v7 = [*(id *)(a1 + 32) identifier];
  int v8 = [v6 isEqualToString:v7];

  uint64_t v9 = v12;
  if (v8)
  {
    int v10 = [v12 isCompleted];
    BOOL v11 = 1;
    if (v10) {
      BOOL v11 = *(unsigned char *)(a1 + 48) != 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
    *a4 = 1;
    uint64_t v9 = v12;
  }
}

- (void)reportAchievementWithCompletionHandler:(void *)completionHandler
{
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = completionHandler;
  id v6 = [v4 arrayWithObject:self];
  +[GKAchievement reportAchievements:v6 withCompletionHandler:v5];
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKAchievement;
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
  id v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKAchievement;
  id v5 = -[GKAchievement methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    int v8 = [(GKAchievement *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKAchievement;
  if (-[GKAchievement respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKAchievement *)self forwardingTargetForSelector:a3];
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
    return +[GKAchievementInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKAchievement *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKAchievement *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (GKAchievementInternal)internal
{
  return (GKAchievementInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternal:(id)a3
{
}

- (BOOL)showsCompletionBanner
{
  return self->_showsCompletionBanner;
}

- (void)setShowsCompletionBanner:(BOOL)showsCompletionBanner
{
  self->_showsCompletionBanner = showsCompletionBanner;
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
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_game, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

- (id)_achievementDescription
{
  id v3 = [(GKAchievement *)self game];
  id v4 = [v3 gameDescriptorDictionary];
  int v5 = +[GKContentPropertyList localPropertyListForGameDescriptor:v4];

  if (v5
    && ([(GKAchievement *)self identifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v5 achievementDescriptionForIdentifier:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    uint64_t v8 = +[GKAchievementDescription _achievementDescriptionFromGame:v3 propertyListDictionary:v7];
  }
  else
  {
    objc_super v9 = [GKAchievementDescription alloc];
    id v7 = [(GKAchievement *)self internal];
    uint64_t v8 = [(GKAchievementDescription *)v9 initWithInternalRepresentation:v7];
  }
  objc_super v10 = (void *)v8;

  return v10;
}

- (void)initWithIdentifier:(os_log_t)log forPlayer:.cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  id v2 = "-[GKAchievement initWithIdentifier:forPlayer:]";
  __int16 v3 = 2114;
  id v4 = @"14.0";
  __int16 v5 = 2114;
  id v6 = @"11.0";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

- (void)playerID
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  id v2 = "-[GKAchievement playerID]";
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
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "<GKAchievement %p> has a nil or invalid internal player, will return a nil player", (uint8_t *)&v2, 0xCu);
}

+ (void)reportAchievements:(uint64_t)a1 whileScreeningChallenges:(NSObject *)a2 withEligibleChallenges:withCompletionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = @"A GKAchievement for another player can only be submitted when ending a turn-based match.";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "%@ %@", (uint8_t *)&v2, 0x16u);
}

+ (void)descriptionForAchievement:(void *)a1 achievementDescriptions:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  __int16 v4 = [a2 identifier];
  OUTLINED_FUNCTION_0_1(&dword_1C2D22000, v5, v6, "No AchievementDescription could be found for Achievement with ID: %@", v7, v8, v9, v10, 2u);
}

+ (void)descriptionForAchievement:(void *)a1 achievementDescriptions:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  __int16 v4 = [a2 identifier];
  OUTLINED_FUNCTION_0_1(&dword_1C2D22000, v5, v6, "More than one AchievementDescription found for Achievement with ID: %@. Using the first one found.", v7, v8, v9, v10, 2u);
}

@end