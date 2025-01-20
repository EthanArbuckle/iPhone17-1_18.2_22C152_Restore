@interface GKGame
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)isFirstParty;
+ (BOOL)isGameCenter;
+ (BOOL)isNewsApp:(id)a3;
+ (BOOL)isPreferences;
+ (BOOL)supportsSecureCoding;
+ (id)createNonStaticCurrentGame;
+ (id)currentGame;
+ (id)currentGameIncludingGameCenter:(BOOL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (void)loadGamesWithBundleIDs:(id)a3 withCompletionHandler:(id)a4;
+ (void)loadTopGamesWithCompletionHandler:(id)a3;
+ (void)setCurrentGameFromInternal:(id)a3 serverEnvironment:(int64_t)a4;
+ (void)updateGames:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)isAppStore;
- (BOOL)isContacts;
- (BOOL)isDaemon;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGameCenter;
- (BOOL)isGameCenterHostingContainer;
- (BOOL)isGameControllerDaemon;
- (BOOL)isInternalTestApp;
- (BOOL)isNewsApp;
- (BOOL)isSpringBoard;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKGame)init;
- (GKGame)initWithCoder:(id)a3;
- (GKGame)initWithInternalRepresentation:(id)a3;
- (GKGameDescriptor)gameDescriptor;
- (GKGameInfo)gameInfo;
- (GKGameInternal)internal;
- (GKUtilityService)utilityService;
- (NSDictionary)gameDescriptorDictionary;
- (NSURL)storeURL;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)environment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getGameMatchesForAchievement:(id)a3 handler:(id)a4;
- (void)getGameMatchesForLeaderboard:(id)a3 handler:(id)a4;
- (void)getGameMatchesIncludingCompatibleGames:(BOOL)a3 handler:(id)a4;
- (void)setEnvironment:(int64_t)a3;
- (void)setInternal:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKGame

- (NSURL)storeURL
{
  v2 = [(GKGame *)self internal];
  v3 = [v2 storeURL];

  return (NSURL *)v3;
}

- (GKUtilityService)utilityService
{
  v2 = +[GKDaemonProxy daemonProxy];
  v3 = [v2 utilityService];

  return (GKUtilityService *)v3;
}

+ (BOOL)isPreferences
{
  if (isPreferences_onceToken != -1) {
    dispatch_once(&isPreferences_onceToken, &__block_literal_global_5);
  }
  return isPreferences_isPreferences;
}

void __23__GKGame_isPreferences__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  isPreferences_isPreferences = [v0 _gkIsPreferences];
}

+ (BOOL)isFirstParty
{
  if (isFirstParty_onceToken != -1) {
    dispatch_once(&isFirstParty_onceToken, &__block_literal_global_3);
  }
  return isFirstParty_isFirstParty;
}

void __22__GKGame_isFirstParty__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  isFirstParty_isFirstParty = [v0 _gkIsKnownFirstParty];
}

+ (BOOL)isGameCenter
{
  if (isGameCenter_sDispatchOnceToken != -1) {
    dispatch_once(&isGameCenter_sDispatchOnceToken, &__block_literal_global_5);
  }
  return isGameCenter_sGameCenter;
}

void __22__GKGame_isGameCenter__block_invoke()
{
  id v0 = +[GKGame currentGame];
  isGameCenter_sGameCenter = [v0 isGameCenter];
}

+ (BOOL)isNewsApp:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"com.apple.news";
  v7[1] = @"com.apple.news.gamecentertest";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v7 count:2];
  LOBYTE(v3) = [v5 containsObject:v4];

  return (char)v3;
}

- (BOOL)isSpringBoard
{
  v2 = [(GKGame *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.springboard"];

  return v3;
}

- (BOOL)isGameControllerDaemon
{
  v2 = [(GKGame *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.GameController.gamecontrollerd"];

  return v3;
}

- (BOOL)isDaemon
{
  v2 = [(GKGame *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.gamed"];

  return v3;
}

- (BOOL)isGameCenter
{
  v2 = [(GKGame *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.gamecenter"];

  return v3;
}

- (BOOL)isAppStore
{
  char v3 = [(GKGame *)self bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.AppStore"];
  v5 = [(GKGame *)self bundleIdentifier];
  char v6 = v4 | [v5 isEqualToString:@"com.apple.TVAppStore"];

  return v6;
}

- (BOOL)isGameCenterHostingContainer
{
  v2 = [(GKGame *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.GameCenterUI.GameCenterHostingContainer"];

  return v3;
}

- (BOOL)isContacts
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  char v3 = [(GKGame *)self bundleIdentifier];
  LOBYTE(v2) = [v2 _gkBundleIdentifierIsRelatedToContactsUI:v3];

  return (char)v2;
}

- (BOOL)isInternalTestApp
{
  if (isInternalTestApp_onceToken != -1) {
    dispatch_once(&isInternalTestApp_onceToken, &__block_literal_global_9);
  }
  char v3 = (void *)isInternalTestApp_sInternalTestAppIdentifiers;
  char v4 = [(GKGame *)self bundleIdentifier];
  LOBYTE(v3) = [v3 containsObject:v4];

  return (char)v3;
}

void __27__GKGame_isInternalTestApp__block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.iosframeworksqa.GameKitTester";
  v4[1] = @"com.apple.gamekit.GKTester2";
  v4[2] = @"com.iosframeworksqa.GKTester2";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 setWithArray:v1];
  char v3 = (void *)isInternalTestApp_sInternalTestAppIdentifiers;
  isInternalTestApp_sInternalTestAppIdentifiers = v2;
}

- (BOOL)isNewsApp
{
  uint64_t v2 = [(GKGame *)self bundleIdentifier];
  BOOL v3 = +[GKGame isNewsApp:v2];

  return v3;
}

+ (id)currentGame
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__GKGame_currentGame__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentGame_sDispatchOnceToken != -1) {
    dispatch_once(&currentGame_sDispatchOnceToken, block);
  }
  uint64_t v2 = (void *)currentGame_sCurrentGame;

  return v2;
}

uint64_t __21__GKGame_currentGame__block_invoke(uint64_t a1)
{
  currentGame_sCurrentGame = [*(id *)(a1 + 32) createNonStaticCurrentGame];

  return MEMORY[0x1F41817F8]();
}

+ (id)createNonStaticCurrentGame
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v3 = +[GKInternalRepresentation internalRepresentation];
  char v4 = [v2 bundleIdentifier];
  [v3 setBundleIdentifier:v4];

  v5 = [v2 _gkBundleVersion];
  [v3 setBundleVersion:v5];

  char v6 = [v2 _gkBundleShortVersion];
  [v3 setShortBundleVersion:v6];

  v7 = [v2 _gkLocalizedName];
  [v3 setName:v7];

  objc_msgSend(v3, "setPlatform:", +[GKGameDescriptor currentPlatform](GKGameDescriptor, "currentPlatform"));
  v8 = [[GKGame alloc] initWithInternalRepresentation:v3];

  return v8;
}

+ (id)currentGameIncludingGameCenter:(BOOL)a3
{
  if (currentGameIncludingGameCenter__sDispatchOnceToken != -1) {
    dispatch_once(&currentGameIncludingGameCenter__sDispatchOnceToken, &__block_literal_global_14);
  }
  if (currentGameIncludingGameCenter__isGameCenter && !a3)
  {
    char v4 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v5 = GKOSLoggers();
      char v4 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[GKGame currentGameIncludingGameCenter:](v4);
    }
  }
  char v6 = (void *)currentGameIncludingGameCenter__sCurrentGame;

  return v6;
}

void __41__GKGame_currentGameIncludingGameCenter___block_invoke()
{
  id v8 = [MEMORY[0x1E4F28B50] mainBundle];
  id v0 = +[GKInternalRepresentation internalRepresentation];
  v1 = [v8 bundleIdentifier];
  [v0 setBundleIdentifier:v1];

  uint64_t v2 = [v8 _gkBundleVersion];
  [v0 setBundleVersion:v2];

  BOOL v3 = [v8 _gkBundleShortVersion];
  [v0 setShortBundleVersion:v3];

  char v4 = [v8 _gkLocalizedName];
  [v0 setName:v4];

  id v5 = [v0 bundleIdentifier];
  currentGameIncludingGameCenter__isGameCenter = [v5 isEqualToString:@"com.apple.gamecenter"];

  objc_msgSend(v0, "setPlatform:", +[GKGameDescriptor currentPlatform](GKGameDescriptor, "currentPlatform"));
  char v6 = [[GKGame alloc] initWithInternalRepresentation:v0];
  v7 = (void *)currentGameIncludingGameCenter__sCurrentGame;
  currentGameIncludingGameCenter__sCurrentGame = (uint64_t)v6;
}

+ (void)setCurrentGameFromInternal:(id)a3 serverEnvironment:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 bundleIdentifier];

  if (v7)
  {
    id v8 = [a1 currentGame];
    [v8 setEnvironment:a4];
    [v8 setInternal:v6];
  }
  else
  {
    v9 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v10 = GKOSLoggers();
      v9 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[GKGame setCurrentGameFromInternal:serverEnvironment:]((uint64_t)v6, v9);
    }
  }
}

- (GKGame)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[GKInternalRepresentation internalRepresentation];
  }
  v8.receiver = self;
  v8.super_class = (Class)GKGame;
  id v5 = [(GKGame *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_internal, v4);
  }

  return v6;
}

- (GKGame)init
{
  BOOL v3 = +[GKInternalRepresentation internalRepresentation];
  id v4 = [(GKGame *)self initWithInternalRepresentation:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGame)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"internal"];
  id v6 = [(GKGame *)self initWithInternalRepresentation:v5];
  if (v6)
  {
    v6->_environment = [v4 decodeIntegerForKey:@"environment"];
    v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(GKGame *)self internal];
  [v5 encodeObject:v4 forKey:@"internal"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[GKGame environment](self, "environment"), @"environment");
}

- (unint64_t)hash
{
  uint64_t v2 = [(GKGame *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(GKGame *)self internal];
    v7 = [v5 internal];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)GKGame;
  unint64_t v3 = [(GKGame *)&v13 description];
  id v4 = [(GKGame *)self bundleIdentifier];
  id v5 = [(GKGame *)self adamID];
  id v6 = [(GKGame *)self shortBundleVersion];
  v7 = [(GKGame *)self bundleVersion];
  char v8 = [(GKGame *)self externalVersion];
  v9 = [(GKGame *)self name];
  if (v9)
  {
    id v10 = [(GKGame *)self name];
    v11 = [v3 stringByAppendingFormat:@"bundleID:%@ adamID:%@ shortBundleVersion:%@ bundleVersion:%@ externalVersion:%@ (%@)", v4, v5, v6, v7, v8, v10];
  }
  else
  {
    v11 = [v3 stringByAppendingFormat:@"bundleID:%@ adamID:%@ shortBundleVersion:%@ bundleVersion:%@ externalVersion:%@ (%@)", v4, v5, v6, v7, v8, @"<no metadata>"];
  }

  return v11;
}

- (GKGameDescriptor)gameDescriptor
{
  uint64_t v2 = [(GKGame *)self internal];
  unint64_t v3 = [v2 gameDescriptor];

  return (GKGameDescriptor *)v3;
}

- (NSDictionary)gameDescriptorDictionary
{
  uint64_t v2 = [(GKGame *)self internal];
  unint64_t v3 = [v2 serverRepresentation];

  return (NSDictionary *)v3;
}

- (GKGameInfo)gameInfo
{
  retstr->var11 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  id v5 = [(GKGame *)self internal];
  retstr->var0 = [v5 supportsLeaderboards];
  retstr->var1 = [v5 supportsLeaderboardSets];
  retstr->var2 = [v5 supportsAchievements];
  retstr->var3 = [v5 supportsMultiplayer];
  retstr->var5 = [v5 isArcadeGame];
  retstr->var6 = [v5 supportsChallenges];
  retstr->var7 = [v5 hasAggregateLeaderboard];
  retstr->var8 = [v5 numberOfCategories];
  retstr->var9 = [v5 numberOfLeaderboardSets];
  retstr->var10 = [v5 numberOfAchievements];
  retstr->var11 = [v5 maxAchievementPoints];
  retstr->var4 = [v5 supportsTurnBasedMultiplayer];

  return result;
}

+ (void)loadGamesWithBundleIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKGame.m", 310, "+[GKGame loadGamesWithBundleIDs:withCompletionHandler:]");
  char v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  uint64_t v9 = [v5 count];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    v12 = [v11 allObjects];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E646DC08;
    id v18 = v12;
    id v19 = v8;
    uint64_t v21 = v10;
    id v20 = v5;
    id v13 = v12;
    [v19 perform:v17];
  }
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke_3;
    v14[3] = &unk_1E646DC30;
    id v16 = v6;
    id v15 = v8;
    [v15 notifyOnMainQueueWithBlock:v14];
  }
}

void __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameServicePrivate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E646DBE0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v12 = v7;
  uint64_t v15 = v8;
  id v13 = v9;
  id v14 = v3;
  id v10 = v3;
  [v5 getGameMetadataForBundleIDs:v6 handler:v11];
}

void __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if ([v5 count])
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 56)];
    id v7 = [v5 _gkMapDictionaryWithKeyPath:@"bundleIdentifier"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v16 = a1;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKey:", v13, v16);
          id v14 = (GKGameInternal *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            id v14 = objc_alloc_init(GKGameInternal);
            [(GKGameDescriptor *)v14 setBundleIdentifier:v13];
          }
          uint64_t v15 = [[GKGame alloc] initWithInternalRepresentation:v14];
          [v6 addObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    a1 = v16;
    [*(id *)(v16 + 32) setObject:v6 forKeyedSubscript:@"games"];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"games"];
  id v6 = (id)v3;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
  }
  id v5 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v5);
}

+ (void)loadTopGamesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKGame.m", 354, "+[GKGame loadTopGamesWithCompletionHandler:]");
    id v5 = +[GKDispatchGroup dispatchGroupWithName:v4];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E646DCA0;
    id v6 = v5;
    id v12 = v6;
    [v6 perform:v11];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E646DC30;
    id v9 = v6;
    id v10 = v3;
    id v7 = v6;
    [v7 notifyOnMainQueueWithBlock:v8];
  }
}

void __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameServicePrivate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_2;
  void v7[3] = &unk_1E646DC78;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  [v5 getTopGamesWithHandler:v7];
}

uint64_t __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 _gkMapConcurrentlyWithBlock:&__block_literal_global_48];
  [v5 setObject:v7 forKeyedSubscript:@"games"];

  [*(id *)(a1 + 32) setError:v6];
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v8();
}

GKGame *__44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKGame alloc] initWithInternalRepresentation:v2];

  return v3;
}

void __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"games"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

+ (void)updateGames:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKGame.m", 372, "+[GKGame updateGames:withCompletionHandler:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  uint64_t v9 = [v5 count];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [v5 _gkDistinctValuesForKeyPath:@"bundleIdentifier"];
    id v12 = [v11 allObjects];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__GKGame_updateGames_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E646DC08;
    id v18 = v12;
    uint64_t v21 = v10;
    id v19 = v5;
    id v20 = v8;
    id v13 = v12;
    [v20 perform:v17];
  }
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__GKGame_updateGames_withCompletionHandler___block_invoke_3;
    v14[3] = &unk_1E646DC30;
    id v16 = v6;
    id v15 = v8;
    [v15 notifyOnMainQueueWithBlock:v14];
  }
}

void __44__GKGame_updateGames_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameServicePrivate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__GKGame_updateGames_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E646DBE0;
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v7 = v3;
  [v5 getGameMetadataForBundleIDs:v6 handler:v8];
}

void __44__GKGame_updateGames_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v23 = v6;
    id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(a1 + 56)];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v14 = [v13 bundleIdentifier];
          if (v14) {
            [v7 setObject:v13 forKey:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          uint64_t v21 = [v20 bundleIdentifier];
          if (v21)
          {
            uint64_t v22 = [v7 objectForKey:v21];
            if (v22) {
              [v20 setInternal:v22];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v17);
    }

    id v6 = v23;
  }
  [*(id *)(a1 + 40) setError:v6];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __44__GKGame_updateGames_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKGame;
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
  v10.super_class = (Class)GKGame;
  id v5 = -[GKGame methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(GKGame *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKGame;
  if (-[GKGame respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKGame *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      int v4 = GKApplicationLinkedOnOrAfter(393216, 657920);
      if (v4)
      {
        LOBYTE(v4) = +[GKGameInternal instancesRespondToSelector:a3];
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  char v5 = [(GKGame *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKGame *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (GKGameInternal)internal
{
  return (GKGameInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (void).cxx_destruct
{
}

- (void)getGameMatchesIncludingCompatibleGames:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[GKDaemonProxy proxyForLocalPlayer];
  id v8 = [v7 gameStatService];
  objc_super v9 = [(GKGame *)self gameDescriptor];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__GKGame_GKEntitled__getGameMatchesIncludingCompatibleGames_handler___block_invoke;
  v11[3] = &unk_1E646DC78;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 getRecentMatchesForGameDescriptor:v9 includeCompatibleMultiplayerGames:v4 handler:v11];
}

void __69__GKGame_GKEntitled__getGameMatchesIncludingCompatibleGames_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          id v15 = [GKGameMatch alloc];
          uint64_t v16 = -[GKGameMatch initWithInternalRepresentation:game:](v15, "initWithInternalRepresentation:game:", v14, *(void *)(a1 + 32), (void)v18);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v8, v6);
  }
}

- (void)getGameMatchesForLeaderboard:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[GKDaemonProxy proxyForLocalPlayer];
  id v9 = [v8 gameStatService];
  uint64_t v10 = [(GKGame *)self gameDescriptor];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__GKGame_GKEntitled__getGameMatchesForLeaderboard_handler___block_invoke;
  v12[3] = &unk_1E646DC78;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 getRecentMatchesForGameDescriptor:v10 leaderboardIdentifier:v7 handler:v12];
}

void __59__GKGame_GKEntitled__getGameMatchesForLeaderboard_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          id v15 = [GKGameMatch alloc];
          uint64_t v16 = -[GKGameMatch initWithInternalRepresentation:game:](v15, "initWithInternalRepresentation:game:", v14, *(void *)(a1 + 32), (void)v18);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v8, v6);
  }
}

- (void)getGameMatchesForAchievement:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[GKDaemonProxy proxyForLocalPlayer];
  id v9 = [v8 gameStatService];
  uint64_t v10 = [(GKGame *)self gameDescriptor];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__GKGame_GKEntitled__getGameMatchesForAchievement_handler___block_invoke;
  v12[3] = &unk_1E646DC78;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 getRecentMatchesForGameDescriptor:v10 achievementIdentifier:v7 handler:v12];
}

void __59__GKGame_GKEntitled__getGameMatchesForAchievement_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          id v15 = [GKGameMatch alloc];
          uint64_t v16 = -[GKGameMatch initWithInternalRepresentation:game:](v15, "initWithInternalRepresentation:game:", v14, *(void *)(a1 + 32), (void)v18);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v8, v6);
  }
}

+ (void)currentGameIncludingGameCenter:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F29060];
  id v2 = a1;
  id v3 = [v1 callStackSymbols];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1C2D22000, v2, OS_LOG_TYPE_DEBUG, "+[GKGame currentGame] called from Game Center %@.", (uint8_t *)&v4, 0xCu);
}

+ (void)setCurrentGameFromInternal:(uint64_t)a1 serverEnvironment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_DEBUG, "setCurrentGameFromInternal: ignoring -- nil bundleIdentifier :%@", (uint8_t *)&v2, 0xCu);
}

@end