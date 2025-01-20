@interface GKPlayer
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)isGuestPlayerID:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (GKPlayer)anonymousGuestPlayerWithIdentifier:(NSString *)guestIdentifier;
+ (id)anonymousPlayer;
+ (id)automatchPlayer;
+ (id)cacheKeyForPlayerID:(id)a3;
+ (id)canonicalizedPlayerForInternal:(id)a3;
+ (id)gameBundleID;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)playerFromPlayerID:(id)a3;
+ (id)unknownPlayer;
+ (void)_loadPlayersForIdentifiers:(id)a3 withCompletionHandler:(id)a4;
+ (void)loadCompletePlayersForPlayers:(id)a3 completionHandler:(id)a4;
+ (void)loadPlayersForIdentifiers:(NSArray *)identifiers withCompletionHandler:(void *)completionHandler;
+ (void)loadScopedIDsForPlayerIDs:(id)a3 gameBundleID:(id)a4 handler:(id)a5;
- ($C4B24A06E922887A36692F481211F72A)stats;
- (BOOL)hasPhoto;
- (BOOL)isArcadeGame;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamiliarFriend;
- (BOOL)isFriendablePlayer;
- (BOOL)isInContacts;
- (BOOL)isInvitable;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)scopedIDsArePersistent;
- (GKGame)lastPlayedGame;
- (GKPlayer)init;
- (GKPlayer)initWithCoder:(id)a3;
- (GKPlayer)initWithInternalRepresentation:(id)a3;
- (GKPlayerInternal)internal;
- (NSArray)friends;
- (NSAttributedString)whenString;
- (NSNumber)acceptedGameInviteFromThisFriend;
- (NSNumber)automatchedTogether;
- (NSNumber)friendBiDirectional;
- (NSNumber)friendLevel;
- (NSNumber)friendPlayedNearby;
- (NSNumber)friendPlayedWith;
- (NSNumber)initiatedGameInviteToThisFriend;
- (NSString)alias;
- (NSString)cacheKey;
- (NSString)displayName;
- (NSString)gamePlayerID;
- (NSString)messagesID;
- (NSString)playerID;
- (NSString)referenceKey;
- (NSString)teamPlayerID;
- (id)description;
- (id)displayNameWithOptions:(unsigned __int8)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)minimalPlayer;
- (id)searchName;
- (id)sortName;
- (id)valueForUndefinedKey:(id)a3;
- (id)vendibleScopedIDs;
- (int64_t)avatarType;
- (unint64_t)hash;
- (void)_postChangeNotification;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadCommonFriends:(BOOL)a3 asPlayersWithCompletionHandler:(id)a4;
- (void)loadFriendsAsPlayersWithCompletionHandler:(id)a3;
- (void)loadFriendsWithFilter:(id)a3 withCompletionHandler:(id)a4;
- (void)loadGamesPlayed:(id)a3;
- (void)loadGamesPlayedDetailsWithCompletionHandler:(id)a3;
- (void)loadGamesPlayedIncludingInstalledGames:(BOOL)a3 completionHandler:(id)a4;
- (void)loadProfileDiscardingStaleData:(BOOL)a3 completionHandler:(id)a4;
- (void)loadProfileWithCompletionHandler:(id)a3;
- (void)loadRecentMatchesForGame:(id)a3 block:(id)a4;
- (void)logAndReportIllegalArcadeAccessTo:(id)a3;
- (void)logAndReportScopedIDsError:(id)a3;
- (void)postChangeNotification;
- (void)setAcceptedGameInviteFromThisFriend:(id)a3;
- (void)setAutomatchedTogether:(id)a3;
- (void)setFriendBiDirectional:(id)a3;
- (void)setFriendLevel:(id)a3;
- (void)setFriendPlayedNearby:(id)a3;
- (void)setFriendPlayedWith:(id)a3;
- (void)setFriends:(id)a3;
- (void)setInitiatedGameInviteToThisFriend:(id)a3;
- (void)setInternal:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWhenString:(id)a3;
- (void)updateScopedIDs:(id)a3;
@end

@implementation GKPlayer

- (GKPlayerInternal)internal
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKPlayer;
  if (-[GKPlayer respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(GKPlayer *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (GKPlayer)init
{
  v3 = +[GKInternalRepresentation internalRepresentation];
  v4 = [(GKPlayer *)self initWithInternalRepresentation:v3];

  return v4;
}

- (GKPlayer)initWithInternalRepresentation:(id)a3
{
  id v5 = a3;
  if ([v5 isLocalPlayer])
  {
    v6 = objc_alloc_init(GKLocalPlayer);
    [(GKPlayer *)v6 setInternal:v5];
    v7 = +[GKLocalPlayer localPlayers];
    objc_super v8 = v7;
    if (v7 && (uint64_t v9 = [v7 indexOfObject:v6], v9 != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v10 = [v8 objectAtIndexedSubscript:v9];
    }
    else
    {
      if (GKApplicationLinkedOnOrAfter(525056, 657923)) {
        goto LABEL_10;
      }
      uint64_t v10 = +[GKLocalPlayer localPlayer];
    }
    v12 = (GKLocalPlayer *)v10;

    v6 = v12;
LABEL_10:
    uint64_t v13 = [v5 scopedIDs];
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [(GKPlayer *)v6 internal];
      v16 = [v15 scopedIDs];

      if (!v16)
      {
        v17 = [v5 scopedIDs];
        v18 = [(GKPlayer *)v6 internal];
        [v18 setScopedIDs:v17];
      }
    }

    goto LABEL_14;
  }
  v22.receiver = self;
  v22.super_class = (Class)GKPlayer;
  v11 = [(GKPlayer *)&v22 init];
  v6 = (GKLocalPlayer *)v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_internal, a3);
  }
LABEL_14:
  v19 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v20 = GKOSLoggers();
    v19 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[GKPlayer initWithInternalRepresentation:]();
  }

  return &v6->super;
}

+ (id)anonymousPlayer
{
  v2 = [GKPlayer alloc];
  v3 = +[GKInternalRepresentation internalRepresentation];
  v4 = [(GKPlayer *)v2 initWithInternalRepresentation:v3];

  return v4;
}

+ (id)unknownPlayer
{
  v2 = [GKPlayer alloc];
  v3 = +[GKInternalRepresentation internalRepresentation];
  v4 = [(GKPlayer *)v2 initWithInternalRepresentation:v3];

  return v4;
}

+ (id)automatchPlayer
{
  v2 = [GKPlayer alloc];
  v3 = +[GKInternalRepresentation internalRepresentation];
  v4 = [(GKPlayer *)v2 initWithInternalRepresentation:v3];

  return v4;
}

+ (GKPlayer)anonymousGuestPlayerWithIdentifier:(NSString *)guestIdentifier
{
  v3 = guestIdentifier;
  v4 = +[GKLocalPlayer localPlayer];
  id v5 = [GKAnonymousGuestPlayerInternal alloc];
  v6 = [v4 internal];
  v7 = [(GKAnonymousGuestPlayerInternal *)v5 initWithHostPlayerInternal:v6 guestIdentifier:v3];

  objc_super v8 = [[GKPlayer alloc] initWithInternalRepresentation:v7];

  return v8;
}

- (GKPlayer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"internal"];

  v6 = [(GKPlayer *)self initWithInternalRepresentation:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPlayer *)self internal];
  [v4 encodeObject:v5 forKey:@"internal"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKPlayer;
  [(GKPlayer *)&v4 dealloc];
}

- (GKGame)lastPlayedGame
{
  v3 = [GKGame alloc];
  objc_super v4 = [(GKPlayer *)self internal];
  id v5 = [v4 lastPlayedGame];
  v6 = [(GKGame *)v3 initWithInternalRepresentation:v5];

  return v6;
}

- ($C4B24A06E922887A36692F481211F72A)stats
{
  retstr->var8 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  id v5 = [(GKPlayer *)self internal];
  retstr->var0 = [v5 numberOfFriends];
  retstr->var1 = [v5 numberOfFriendsInCommon];
  retstr->var2 = [v5 numberOfGames];
  retstr->var3 = [v5 numberOfGamesInCommon];
  retstr->var4 = [v5 numberOfAchievements];
  retstr->var5 = [v5 numberOfAchievementPoints];
  retstr->var6 = [v5 numberOfRequests];
  retstr->var7 = [v5 numberOfChallenges];
  retstr->var8 = [v5 numberOfTurns];

  return result;
}

- (NSString)messagesID
{
  v2 = [(GKPlayer *)self internal];
  v3 = [v2 messagesID];

  return (NSString *)v3;
}

- (BOOL)isInContacts
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 isInContacts];

  return v3;
}

- (BOOL)isArcadeGame
{
  if (isArcadeGame_onceToken != -1) {
    dispatch_once(&isArcadeGame_onceToken, &__block_literal_global_26);
  }
  return isArcadeGame_isArcadeGame;
}

void __24__GKPlayer_isArcadeGame__block_invoke()
{
  v0 = +[GKDaemonProxy proxyForLocalPlayer];
  id v1 = [v0 profileService];

  [v1 getOcelotStateForCurrentAppWithHandler:&__block_literal_global_27];
}

void __24__GKPlayer_isArcadeGame__block_invoke_2(uint64_t a1, char a2)
{
  isArcadeGame_isArcadeGame = a2;
}

- (NSString)playerID
{
  if ([(GKPlayer *)self isArcadeGame])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__GKPlayer_playerID__block_invoke;
    block[3] = &unk_1E646D7F0;
    block[4] = self;
    if (playerID_onceToken != -1) {
      dispatch_once(&playerID_onceToken, block);
    }
    char v3 = @"playerID is not available for Arcade games";
  }
  else
  {
    objc_super v4 = [(GKPlayer *)self internal];
    char v3 = [v4 playerID];
  }

  return (NSString *)v3;
}

uint64_t __20__GKPlayer_playerID__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logAndReportIllegalArcadeAccessTo:@"playerID"];
}

+ (id)gameBundleID
{
  v2 = +[GKGame currentGame];
  char v3 = [v2 bundleIdentifier];

  return v3;
}

- (NSString)gamePlayerID
{
  v2 = [(GKPlayer *)self vendibleScopedIDs];
  char v3 = [v2 gamePlayerID];

  return (NSString *)v3;
}

- (NSString)teamPlayerID
{
  if ([(GKPlayer *)self isArcadeGame])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__GKPlayer_teamPlayerID__block_invoke;
    block[3] = &unk_1E646D7F0;
    block[4] = self;
    if (teamPlayerID_onceToken != -1) {
      dispatch_once(&teamPlayerID_onceToken, block);
    }
  }
  char v3 = [(GKPlayer *)self vendibleScopedIDs];
  objc_super v4 = [v3 teamPlayerID];

  return (NSString *)v4;
}

uint64_t __24__GKPlayer_teamPlayerID__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logAndReportIllegalArcadeAccessTo:@"teamPlayerID"];
}

- (void)logAndReportIllegalArcadeAccessTo:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[GKPreferences shared];
  int v5 = [v4 isInternalBuild];

  v6 = os_log_GKGeneral;
  if (v5)
  {
    if (!os_log_GKGeneral)
    {
      id v7 = GKOSLoggers();
      v6 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[GKPlayer logAndReportIllegalArcadeAccessTo:]();
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKPlayer logAndReportIllegalArcadeAccessTo:]();
    }
  }
  uint64_t v9 = +[GKAPIReporter reporter];
  v11[0] = @"eventType";
  v11[1] = @"apiType";
  v12[0] = @"deprecatedAPIUsage";
  v12[1] = @"property";
  v11[2] = @"apiName";
  v12[2] = v3;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v9 recordPerformanceMetrics:v10];
}

- (BOOL)scopedIDsArePersistent
{
  v2 = [(GKPlayer *)self vendibleScopedIDs];
  char v3 = [v2 arePersistent];

  return v3;
}

- (id)vendibleScopedIDs
{
  char v3 = [(GKPlayer *)self internal];
  objc_super v4 = [v3 playerID];

  int v5 = +[GKPlayer gameBundleID];
  v6 = [(GKPlayer *)self internal];
  id v7 = [v6 scopedIDs];

  if ([v7 isForPlayerID:v4 gameBundleID:v5])
  {
    id v8 = v7;
    goto LABEL_9;
  }
  if (v7)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __29__GKPlayer_vendibleScopedIDs__block_invoke_2;
    v16 = &unk_1E646D7F0;
    v17 = self;
    if (vendibleScopedIDs_onceToken_59 == -1) {
      goto LABEL_8;
    }
    v11 = &vendibleScopedIDs_onceToken_59;
    p_uint64_t block = &v13;
  }
  else
  {
    if (!+[GKScopedIDs availableForPlayerID:v4]) {
      goto LABEL_8;
    }
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __29__GKPlayer_vendibleScopedIDs__block_invoke;
    v21 = &unk_1E646D7F0;
    objc_super v22 = self;
    if (vendibleScopedIDs_onceToken == -1) {
      goto LABEL_8;
    }
    v11 = &vendibleScopedIDs_onceToken;
    p_uint64_t block = &block;
  }
  dispatch_once(v11, p_block);
LABEL_8:
  +[GKScopedIDs makeNonpersistentWithPlayerID:gameBundleID:](GKScopedIDs, "makeNonpersistentWithPlayerID:gameBundleID:", v4, v5, v13, v14, v15, v16, v17, block, v19, v20, v21, v22);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  uint64_t v9 = v8;

  return v9;
}

uint64_t __29__GKPlayer_vendibleScopedIDs__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logAndReportScopedIDsError:@"Nil"];
}

uint64_t __29__GKPlayer_vendibleScopedIDs__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) logAndReportScopedIDsError:@"Invalid"];
}

- (void)logAndReportScopedIDsError:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[GKPreferences shared];
  int v6 = [v5 isInternalBuild];

  if (v6)
  {
    id v7 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v8 = GKOSLoggers();
      id v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(GKPlayer *)(uint64_t)v4 logAndReportScopedIDsError:self];
    }
  }
  uint64_t v9 = +[GKAPIReporter reporter];
  v11[0] = @"eventType";
  v11[1] = @"errorType";
  v12[0] = @"scopedIDsError";
  v12[1] = v4;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v9 recordPerformanceMetrics:v10];
}

- (void)updateScopedIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  int v5 = [(GKPlayer *)self internal];
  int v6 = [v5 playerID];

  if (+[GKScopedIDs availableForPlayerID:v6])
  {
    id v7 = +[GKPlayer gameBundleID];
    id v8 = [(GKPlayer *)self internal];
    uint64_t v9 = [v8 scopedIDs];

    if ([v9 arePersistent]
      && [v9 isForPlayerID:v6 gameBundleID:v7])
    {
      if (!os_log_GKGeneral) {
        id v10 = GKOSLoggers();
      }
      v11 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v6;
        __int16 v21 = 2112;
        objc_super v22 = v7;
        _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "Not updating persistent scoped ids for playerID: %@ gameBundleID: %@", buf, 0x16u);
      }
      v4[2](v4);
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v18 = v6;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __28__GKPlayer_updateScopedIDs___block_invoke;
      v15[3] = &unk_1E646FD20;
      objc_copyWeak(&v17, (id *)buf);
      v15[4] = self;
      v16 = v4;
      +[GKPlayer loadScopedIDsForPlayerIDs:v14 gameBundleID:v7 handler:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v12 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v13 = GKOSLoggers();
      v12 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[GKPlayer updateScopedIDs:](v12, self);
    }
    v4[2](v4);
  }
}

void __28__GKPlayer_updateScopedIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [v6 allValues];

  uint64_t v9 = [v8 firstObject];
  id v10 = [WeakRetained internal];
  [v10 setScopedIDs:v9];

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    v12 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __28__GKPlayer_updateScopedIDs___block_invoke_cold_1(a1, v12, (uint64_t)v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)loadScopedIDsForPlayerIDs:(id)a3 gameBundleID:(id)a4 handler:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v10 = +[GKDaemonProxy proxyForLocalPlayer];
    id v11 = [v10 profileService];

    v17[0] = v8;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__GKPlayer_loadScopedIDsForPlayerIDs_gameBundleID_handler___block_invoke;
    v13[3] = &unk_1E646E640;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v11 loadScopedPlayerIDs:v14 gameBundleIDs:v12 handler:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CC08], 0);
  }
}

void __59__GKPlayer_loadScopedIDsForPlayerIDs_gameBundleID_handler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    id v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    int v13 = 138413058;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_DEBUG, "Loaded scoped ids: %@ for playerIDs: %@, gameBundleID: %@, error: %@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v9 = a1[6];
  if (v6)
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, MEMORY[0x1E4F1CC08], v6);
  }
  else
  {
    id v10 = +[GKScopedIDs makePlayerIDtoScopedIDsDictFromScopedIDs:v5];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
}

- (NSNumber)friendLevel
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 friendLevel];

  return (NSNumber *)v3;
}

- (NSNumber)friendBiDirectional
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 friendBiDirectional];

  return (NSNumber *)v3;
}

- (NSNumber)friendPlayedWith
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 friendPlayedWith];

  return (NSNumber *)v3;
}

- (NSNumber)friendPlayedNearby
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 friendPlayedNearby];

  return (NSNumber *)v3;
}

- (NSNumber)acceptedGameInviteFromThisFriend
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 acceptedGameInviteFromThisFriend];

  return (NSNumber *)v3;
}

- (NSNumber)initiatedGameInviteToThisFriend
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 initiatedGameInviteToThisFriend];

  return (NSNumber *)v3;
}

- (NSNumber)automatchedTogether
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 automatchedTogether];

  return (NSNumber *)v3;
}

- (NSString)alias
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 alias];

  if (![v3 length])
  {
    if (alias_onceToken != -1) {
      dispatch_once(&alias_onceToken, &__block_literal_global_73_0);
    }
    id v4 = (id)alias_sUnknownPlayerNickname;

    char v3 = v4;
  }

  return (NSString *)v3;
}

uint64_t __17__GKPlayer_alias__block_invoke()
{
  alias_sUnknownPlayerNickname = +[GCFLocalizedStrings UNKNOWN_PLAYER_NICKNAME];

  return MEMORY[0x1F41817F8]();
}

- (int64_t)avatarType
{
  v2 = [(GKPlayer *)self internal];
  char v3 = [v2 avatarType];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setFriendLevel:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPlayer *)self internal];
  [v5 setFriendLevel:v4];
}

- (void)setFriendBiDirectional:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPlayer *)self internal];
  [v5 setFriendBiDirectional:v4];
}

- (void)setFriendPlayedWith:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPlayer *)self internal];
  [v5 setFriendPlayedWith:v4];
}

- (void)setFriendPlayedNearby:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPlayer *)self internal];
  [v5 setFriendPlayedNearby:v4];
}

- (void)setAcceptedGameInviteFromThisFriend:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPlayer *)self internal];
  [v5 setAcceptedGameInviteFromThisFriend:v4];
}

- (void)setInitiatedGameInviteToThisFriend:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPlayer *)self internal];
  [v5 setInitiatedGameInviteToThisFriend:v4];
}

- (void)setAutomatchedTogether:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPlayer *)self internal];
  [v5 setAutomatchedTogether:v4];
}

- (BOOL)isInvitable
{
  char v3 = [(GKPlayer *)self internal];
  char v4 = [v3 isLocalPlayer];

  if (v4) {
    return 0;
  }
  id v6 = [(GKPlayer *)self internal];
  id v7 = [v6 friendBiDirectional];
  if ([v7 isEqualToNumber:&unk_1F1E7EB58])
  {
    char v5 = 1;
  }
  else
  {
    id v8 = [(GKPlayer *)self internal];
    uint64_t v9 = [v8 friendPlayedWith];
    if ([v9 isEqualToNumber:&unk_1F1E7EB58])
    {
      char v5 = 1;
    }
    else
    {
      id v10 = [(GKPlayer *)self internal];
      uint64_t v11 = [v10 friendPlayedNearby];
      char v5 = [v11 isEqualToNumber:&unk_1F1E7EB58];
    }
  }

  return v5;
}

- (id)description
{
  char v3 = [(GKPlayer *)self internal];
  if (v3 && [MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess])
  {
    char v4 = NSString;
    char v5 = [(GKPlayer *)self internal];
    id v6 = [v5 playerID];
    id v7 = [v4 stringWithFormat:@"playerID:%@ ", v6];
  }
  else
  {
    id v7 = &stru_1F1E47DF8;
  }

  id v8 = [(GKPlayer *)self internal];

  if (v8)
  {
    uint64_t v9 = [(GKPlayer *)self internal];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v43.receiver = self;
      v43.super_class = (Class)GKPlayer;
      uint64_t v11 = [(GKPlayer *)&v43 description];
      uint64_t v12 = [(GKPlayer *)self alias];
      int v13 = [(GKPlayer *)self displayNameWithOptions:0];
      id v14 = [(GKPlayer *)self internal];
      __int16 v15 = [v14 date];
      uint64_t v16 = [(GKPlayer *)self internal];
      __int16 v17 = [v16 message];
      uint64_t v18 = [v11 stringByAppendingFormat:@"(%@alias:%@ name:%@ date:%@ message:%@)", v7, v12, v13, v15, v17];
    }
    else
    {
      v42.receiver = self;
      v42.super_class = (Class)GKPlayer;
      v30 = [(GKPlayer *)&v42 description];
      v41 = [(GKPlayer *)self alias];
      v40 = +[GKPlayer gameBundleID];
      v37 = [(GKPlayer *)self internal];
      v36 = [v37 scopedIDs];
      v31 = [v36 gamePlayerID];
      v35 = [(GKPlayer *)self internal];
      v34 = [v35 scopedIDs];
      v38 = [v34 teamPlayerID];
      __int16 v19 = NSNumber;
      v33 = [(GKPlayer *)self internal];
      v32 = [v33 scopedIDs];
      id v20 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v32, "arePersistent"));
      v29 = [(GKPlayer *)self displayNameWithOptions:0];
      [(GKPlayer *)self status];
      v28 = v39 = v7;
      uint64_t v21 = [(GKPlayer *)self friendBiDirectional];
      objc_super v22 = [(GKPlayer *)self friendPlayedWith];
      uint64_t v23 = [(GKPlayer *)self friendPlayedNearby];
      v24 = [(GKPlayer *)self acceptedGameInviteFromThisFriend];
      v25 = [(GKPlayer *)self initiatedGameInviteToThisFriend];
      v26 = [(GKPlayer *)self automatchedTogether];
      uint64_t v11 = v30;
      uint64_t v18 = [v30 stringByAppendingFormat:@"(%@alias:%@ gameBundleID:%@ gamePlayerID:%@ teamPlayerID:%@ scopedIDsArePersistent:%@ name:%@ status:%@ friendBiDirectional:%@ friendPlayedWith:%@ friendPlayedNearby:%@ acceptedGameInviteFromThisFriend:%@ initiatedGameInviteToThisFriend:%@ automatchedTogether:%@)", v39, v41, v40, v31, v38, v20, v29, v28, v21, v22, v23, v24, v25, v26];

      id v7 = v39;
    }
  }
  else
  {
    v44.receiver = self;
    v44.super_class = (Class)GKPlayer;
    uint64_t v11 = [(GKPlayer *)&v44 description];
    uint64_t v18 = [v11 stringByAppendingString:@" ****** EMPTY ******"];
  }

  return v18;
}

- (unint64_t)hash
{
  v2 = [(GKPlayer *)self internal];
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
    id v6 = [(GKPlayer *)self internal];
    id v7 = [v5 internal];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)cacheKeyForPlayerID:(id)a3
{
  id v3 = a3;

  return v3;
}

- (NSString)cacheKey
{
  id v3 = objc_opt_class();
  id v4 = [(GKPlayer *)self internal];
  id v5 = [v4 playerID];
  id v6 = [v3 cacheKeyForPlayerID:v5];

  return (NSString *)v6;
}

- (BOOL)hasPhoto
{
  v2 = [(GKPlayer *)self internal];
  id v3 = [v2 photos];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)isFamiliarFriend
{
  v2 = [(GKPlayer *)self internal];
  BOOL v3 = [v2 defaultFamiliarity] == 2;

  return v3;
}

+ (void)loadPlayersForIdentifiers:(NSArray *)identifiers withCompletionHandler:(void *)completionHandler
{
  id v6 = identifiers;
  id v7 = completionHandler;
  char v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer.m", 514, "+[GKPlayer loadPlayersForIdentifiers:withCompletionHandler:]");
  uint64_t v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E646FD70;
  v17[4] = v18;
  [v9 perform:v17];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3;
  void v12[3] = &unk_1E646FD98;
  __int16 v15 = v18;
  id v10 = v7;
  id v14 = v10;
  id v16 = a1;
  uint64_t v11 = v6;
  int v13 = v11;
  [v9 notifyOnMainQueueWithBlock:v12];

  _Block_object_dispose(v18, 8);
}

void __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 profileService];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E646FD48;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v5 getOcelotStateForCurrentAppWithHandler:v8];
}

uint64_t __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    v2 = [MEMORY[0x1E4F28C58] userErrorForCode:31 underlyingError:0];
    id v3 = v2;
    if (a1[5])
    {
      if (!os_log_GKGeneral) {
        id v4 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_cold_1();
      }
      (*(void (**)(void))(a1[5] + 16))();

      return;
    }
  }
  id v5 = (void *)a1[7];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];

  [v5 _loadPlayersForIdentifiers:v6 withCompletionHandler:v7];
}

+ (void)_loadPlayersForIdentifiers:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  char v8 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "GKPlayer: _loadPlayersForIdentifiers:", buf, 2u);
  }
  [v5 enumerateObjectsWithOptions:1 usingBlock:&__block_literal_global_106_0];
  uint64_t v9 = [v5 count];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2;
  v26[3] = &unk_1E646FDE0;
  id v12 = v11;
  id v27 = v12;
  id v13 = v10;
  id v28 = v13;
  [v5 enumerateObjectsUsingBlock:v26];
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer.m", 570, "+[GKPlayer _loadPlayersForIdentifiers:withCompletionHandler:]");
  __int16 v15 = +[GKDispatchGroup dispatchGroupWithName:v14];

  if (v9 < 1)
  {
    id v16 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
    [v15 setError:v16];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3;
    v20[3] = &unk_1E646FE80;
    id v21 = v13;
    uint64_t v25 = v9;
    id v22 = v12;
    id v23 = v5;
    id v24 = v15;
    [v24 perform:v20];

    id v16 = v21;
  }

  if (v6)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_130;
    v17[3] = &unk_1E646DC30;
    id v19 = v6;
    id v18 = v15;
    [v18 notifyOnMainQueueWithBlock:v17];
  }
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v2 = NSString;
    id v3 = [NSString stringWithFormat:@"Invalid parameter: 'identifiers' parameter must contain an array of playerIDs as NSString objects, received %@ instead.", objc_opt_class()];
    id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v5 = [v4 lastPathComponent];
    id v6 = [v2 stringWithFormat:@"%@ ([obj isKindOfClass:[NSString class]])\n[%s (%s:%d)]", v3, "+[GKPlayer _loadPlayersForIdentifiers:withCompletionHandler:]_block_invoke", objc_msgSend(v5, "UTF8String"), 548];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v6 format];
  }
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = +[GKPlayer isGuestPlayerID:v5];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 32;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKLocalPlayer localPlayer];
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v6 = [v5 profileService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_4;
  v10[3] = &unk_1E646FE58;
  uint64_t v16 = *(void *)(a1 + 64);
  id v11 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = v3;
  id v8 = v3;
  id v9 = v4;
  [v6 getProfilesForPlayerIDs:v7 handler:v10];
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_4_cold_1();
    }
  }
  id v8 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_123;
  void v11[3] = &unk_1E646FE30;
  uint64_t v19 = *(void *)(a1 + 72);
  id v12 = *(id *)(a1 + 32);
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = v6;
  id v18 = *(id *)(a1 + 64);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_123(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(a1 + 88) + 1];
  id v3 = [*(id *)(a1 + 32) internal];
  uint64_t v4 = [v3 playerID];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 internal];
    id v7 = [v6 playerID];
    [v2 setObject:v5 forKeyedSubscript:v7];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [[GKPlayer alloc] initWithInternalRepresentation:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        id v14 = [(GKPlayer *)v13 internal];
        id v15 = [v14 playerID];

        if (v15) {
          [v2 setObject:v13 forKeyedSubscript:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  id v16 = *(void **)(a1 + 48);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2_125;
  v27[3] = &unk_1E646FE08;
  id v17 = v2;
  id v28 = v17;
  [v16 enumerateObjectsUsingBlock:v27];
  id v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(a1 + 88)];
  uint64_t v19 = *(void **)(a1 + 56);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_126;
  v24[3] = &unk_1E646FDE0;
  id v20 = v17;
  id v25 = v20;
  id v21 = v18;
  id v26 = v21;
  [v19 enumerateObjectsUsingBlock:v24];
  id v22 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v23 = GKOSLoggers();
    id v22 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_123_cold_1((void **)(a1 + 48), v22, v21);
  }
  [*(id *)(a1 + 64) setObject:v21 forKeyedSubscript:@"players"];
  [*(id *)(a1 + 64) setError:*(void *)(a1 + 72)];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2_125(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 componentsSeparatedByString:@"_"];
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v3 objectAtIndexedSubscript:1];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (v6)
  {
    id v7 = [GKAnonymousGuestPlayerInternal alloc];
    id v8 = [v6 internal];
    uint64_t v9 = [(GKAnonymousGuestPlayerInternal *)v7 initWithHostPlayerInternal:v8 guestIdentifier:v5];

    uint64_t v10 = [[GKPlayer alloc] initWithInternalRepresentation:v9];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
  }
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_126(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v3)
  {
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v4 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v5 = GKOSLoggers();
      uint64_t v4 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_126_cold_1(v3, v4);
    }
  }
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_130(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"players"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)_postChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__GKPlayer__postChangeNotification__block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __35__GKPlayer__postChangeNotification__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:GKPlayerDidChangeNotificationName object:*(void *)(a1 + 32)];
}

- (void)postChangeNotification
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];

  [(GKPlayer *)self performSelector:sel__postChangeNotification withObject:0 afterDelay:0.1];
}

- (void)loadFriendsAsPlayersWithCompletionHandler:(id)a3
{
}

- (void)loadFriendsWithFilter:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer.m", 664, "-[GKPlayer loadFriendsWithFilter:withCompletionHandler:]");
  id v7 = +[GKDispatchGroup dispatchGroupWithName:v6];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E646D928;
  v15[4] = self;
  id v8 = v7;
  id v16 = v8;
  [v8 perform:v15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_3;
  void v11[3] = &unk_1E646EA20;
  id v12 = v8;
  id v13 = self;
  id v14 = v5;
  id v9 = v5;
  id v10 = v8;
  [v10 notifyOnMainQueueWithBlock:v11];
}

void __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 friendServicePrivate];
  id v6 = [*(id *)(a1 + 32) internal];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E646DC78;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 getCommonFriendsForPlayer:v6 handler:v8];
}

uint64_t __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"friends"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"friends"];
  id v2 = [v6 _gkValuesForKeyPath:@"playerID"];
  [*(id *)(a1 + 40) setFriends:v2];

  [*(id *)(a1 + 40) postChangeNotification];
  id v3 = [v6 _gkMapConcurrentlyWithBlock:&__block_literal_global_139];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);
  }
}

GKPlayer *__56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKPlayer alloc] initWithInternalRepresentation:v2];

  return v3;
}

- (void)loadCommonFriends:(BOOL)a3 asPlayersWithCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer.m", 690, "-[GKPlayer loadCommonFriends:asPlayersWithCompletionHandler:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  if (v4)
  {
    id v9 = v19;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v10 = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke;
  }
  else
  {
    id v9 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v10 = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_3;
  }
  v9[2] = v10;
  v9[3] = &unk_1E646D928;
  v9[4] = self;
  id v11 = v8;
  v9[5] = v11;
  [v11 perform:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_5;
  v14[3] = &unk_1E646EA20;
  id v15 = v11;
  id v16 = self;
  id v17 = v6;
  id v12 = v6;
  id v13 = v11;
  [v13 notifyOnMainQueueWithBlock:v14];
}

void __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 friendServicePrivate];
  id v6 = [*(id *)(a1 + 32) internal];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E646DC78;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 getCommonFriendsForPlayer:v6 handler:v8];
}

uint64_t __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"friends"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 friendService];
  id v6 = [*(id *)(a1 + 32) internal];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_4;
  v8[3] = &unk_1E646DC78;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 getFriendsForPlayer:v6 handler:v8];
}

uint64_t __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"friends"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"friends"];
  id v2 = [v6 _gkValuesForKeyPath:@"playerID"];
  [*(id *)(a1 + 40) setFriends:v2];

  [*(id *)(a1 + 40) postChangeNotification];
  id v3 = [v6 _gkMapConcurrentlyWithBlock:&__block_literal_global_141];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);
  }
}

GKPlayer *__61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKPlayer alloc] initWithInternalRepresentation:v2];

  return v3;
}

- (void)loadRecentMatchesForGame:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer.m", 730, "-[GKPlayer loadRecentMatchesForGame:block:]");
    id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke;
    v15[3] = &unk_1E646D9A0;
    id v16 = v6;
    id v17 = self;
    id v10 = v9;
    id v18 = v10;
    [v10 perform:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_4;
    void v12[3] = &unk_1E646DC30;
    id v13 = v10;
    id v14 = v7;
    id v11 = v10;
    [v11 notifyOnMainQueueWithBlock:v12];
  }
}

void __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  id v6 = [a1[4] gameDescriptor];
  char v7 = [a1[5] isLocalPlayer];
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [a1[5] internal];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_2;
  v10[3] = &unk_1E646FEF0;
  id v11 = a1[6];
  id v12 = a1[4];
  id v13 = v3;
  id v9 = v3;
  [v5 getRecentMatchesForGameDescriptor:v6 otherPlayer:v8 handler:v10];
  if ((v7 & 1) == 0) {
}
  }

void __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_3;
    v10[3] = &unk_1E646FEC8;
    id v8 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v9 = [v6 _gkMapConcurrentlyWithBlock:v10];
    [v8 setObject:v9 forKeyedSubscript:@"matches"];
  }
  [*(id *)(a1 + 32) setError:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

GKGameMatch *__43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[GKGameMatch alloc] initWithInternalRepresentation:v3 game:*(void *)(a1 + 32)];

  return v4;
}

void __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"matches"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)loadGamesPlayed:(id)a3
{
}

- (void)loadGamesPlayedIncludingInstalledGames:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer.m", 760, "-[GKPlayer loadGamesPlayedIncludingInstalledGames:completionHandler:]");
    id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke;
    v14[3] = &unk_1E646ED70;
    void v14[4] = self;
    BOOL v16 = a3;
    id v9 = v8;
    id v15 = v9;
    [v9 perform:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_4;
    void v11[3] = &unk_1E646DC30;
    id v12 = v9;
    id v13 = v6;
    id v10 = v9;
    [v10 notifyOnMainQueueWithBlock:v11];
  }
}

void __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameServicePrivate];
  id v6 = [*(id *)(a1 + 32) internal];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_2;
  void v11[3] = &unk_1E646FEF0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v8;
  uint64_t v13 = v9;
  id v14 = v3;
  id v10 = v3;
  [v5 getGamesForPlayer:v6 includeInstalled:v7 handler:v11];
}

uint64_t __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_3;
  void v12[3] = &unk_1E646FF18;
  uint64_t v7 = *(void **)(a1 + 32);
  void v12[4] = *(void *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = [a2 _gkMapConcurrentlyWithBlock:v12];
  [v7 setObject:v10 forKeyedSubscript:@"games"];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"seed"];
  [*(id *)(a1 + 32) setError:v8];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

GKGameRecord *__69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[GKGameRecord alloc] initWithInternalRepresentation:v3 player:*(void *)(a1 + 32)];

  return v4;
}

void __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"games"];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"seed"];
  id v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

- (void)loadGamesPlayedDetailsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer.m", 783, "-[GKPlayer loadGamesPlayedDetailsWithCompletionHandler:]");
    id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke;
    void v12[3] = &unk_1E646D928;
    void v12[4] = self;
    id v7 = v6;
    id v13 = v7;
    [v7 perform:v12];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_4;
    v9[3] = &unk_1E646DC30;
    id v10 = v7;
    id v11 = v4;
    id v8 = v7;
    [v8 notifyOnMainQueueWithBlock:v9];
  }
}

void __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameServicePrivate];
  id v6 = [*(id *)(a1 + 32) internal];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E646FEF0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v3;
  id v9 = v3;
  [v5 getGamesWithAchievementStatsForPlayer:v6 handler:v10];
}

uint64_t __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_3;
  void v12[3] = &unk_1E646FF18;
  id v7 = *(void **)(a1 + 32);
  void v12[4] = *(void *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = [a2 _gkMapConcurrentlyWithBlock:v12];
  [v7 setObject:v10 forKeyedSubscript:@"games"];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"seed"];
  [*(id *)(a1 + 32) setError:v8];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

GKGameRecord *__56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[GKGameRecord alloc] initWithInternalRepresentation:v3 player:*(void *)(a1 + 32)];

  return v4;
}

void __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"games"];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"seed"];
  id v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

- (void)loadProfileWithCompletionHandler:(id)a3
{
}

- (void)loadProfileDiscardingStaleData:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKPlayer.m", 808, "-[GKPlayer loadProfileDiscardingStaleData:completionHandler:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  id v9 = [(GKPlayer *)self internal];
  id v10 = [v9 playerID];

  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F28C58] userErrorForCode:8 underlyingError:0];
    [v8 setError:v11];

    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke;
  v15[3] = &unk_1E646FC80;
  void v15[4] = self;
  id v16 = v10;
  BOOL v18 = a3;
  id v17 = v8;
  [v17 perform:v15];

  if (v6)
  {
LABEL_3:
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke_3;
    void v12[3] = &unk_1E646DC30;
    id v14 = v6;
    id v13 = v8;
    [v13 notifyOnMainQueueWithBlock:v12];
  }
LABEL_4:
}

void __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(id *)(a1 + 32);
  }
  else
  {
    id v4 = +[GKLocalPlayer localPlayer];
  }
  id v5 = v4;
  id v6 = +[GKDaemonProxy proxyForPlayer:v4];
  id v7 = [v6 profileService];
  v17[0] = *(void *)(a1 + 40);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke_2;
  v13[3] = &unk_1E646E640;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v14 = v10;
  uint64_t v15 = v11;
  id v16 = v3;
  id v12 = v3;
  [v7 getProfilesForPlayerIDs:v8 discardingStaleData:v9 handler:v13];
}

void __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if ([v10 count])
  {
    id v5 = [v10 firstObject];
    id v6 = [*(id *)(a1 + 40) internal];
    id v7 = [v6 onboarding];
    [v5 setOnboarding:v7];

    id v8 = [*(id *)(a1 + 40) internal];
    uint64_t v9 = [v8 accountName];
    [v5 setAccountName:v9];

    [*(id *)(a1 + 40) setInternal:v5];
    [*(id *)(a1 + 40) postChangeNotification];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (void)loadCompletePlayersForPlayers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [a3 _gkMapWithBlock:&__block_literal_global_158];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__GKPlayer_loadCompletePlayersForPlayers_completionHandler___block_invoke_2;
  v8[3] = &unk_1E646DCF0;
  id v9 = v5;
  id v7 = v5;
  +[GKPlayer loadPlayersForIdentifiersPrivate:v6 withCompletionHandler:v8];
}

id __60__GKPlayer_loadCompletePlayersForPlayers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 internal];
  id v3 = [v2 playerID];

  return v3;
}

uint64_t __60__GKPlayer_loadCompletePlayersForPlayers_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)displayNameWithOptions:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(GKPlayer *)self internal];
  id v5 = [v4 displayNameWithOptions:v3];

  return v5;
}

- (NSString)displayName
{
  return (NSString *)[(GKPlayer *)self displayNameWithOptions:1];
}

- (id)sortName
{
  id v2 = [(GKPlayer *)self displayNameWithOptions:1];
  uint64_t v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (id)searchName
{
  id v2 = [(GKPlayer *)self displayNameWithOptions:0];
  uint64_t v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKPlayer;
  id v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[GKPlayerInternal instanceMethodSignatureForSelector:a3];
  }
  id v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKPlayer;
  id v5 = -[GKPlayer methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(GKPlayer *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
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
    return +[GKPlayerInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKPlayer *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKPlayer *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (BOOL)isFriendablePlayer
{
  uint64_t v3 = +[GKLocalPlayer localPlayer];
  if (v3 == self
    || ([(GKPlayer *)self isUnknownPlayer] & 1) != 0
    || ([(GKPlayer *)self isAnonymousPlayer] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [(GKPlayer *)self isAutomatchPlayer] ^ 1;
  }

  return v4;
}

+ (BOOL)isGuestPlayerID:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3 && [v3 length])
  {
    unint64_t v5 = [v4 rangeOfString:@"_"];
    BOOL v7 = v5 != 0x7FFFFFFFFFFFFFFFLL && v5 > 2;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setInternal:(id)a3
{
}

- (NSAttributedString)whenString
{
  return self->_whenString;
}

- (void)setWhenString:(id)a3
{
}

- (NSArray)friends
{
  return self->_friends;
}

- (void)setFriends:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friends, 0);
  objc_storeStrong((id *)&self->_whenString, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

+ (id)playerFromPlayerID:(id)a3
{
  id v3 = a3;
  int v4 = +[GKInternalRepresentation internalRepresentation];
  [v4 setPlayerID:v3];

  unint64_t v5 = +[GKPlayer canonicalizedPlayerForInternal:v4];

  return v5;
}

+ (id)canonicalizedPlayerForInternal:(id)a3
{
  id v3 = a3;
  int v4 = +[GKLocalPlayer localPlayer];
  unint64_t v5 = [v3 playerID];
  id v6 = [v4 internal];
  BOOL v7 = [v6 playerID];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    objc_super v9 = [v4 internal];
    char v10 = [v9 isLocalPlayer];

    if ((v10 & 1) == 0) {
      [v4 promotePlayerInternalToLocalPlayerInternal:v4];
    }
    uint64_t v11 = v4;
  }
  else
  {
    uint64_t v11 = [[GKPlayer alloc] initWithInternalRepresentation:v3];
  }
  id v12 = v11;

  return v12;
}

- (NSString)referenceKey
{
  id v2 = [(GKPlayer *)self internal];
  id v3 = [v2 playerID];

  return (NSString *)v3;
}

- (id)minimalPlayer
{
  id v3 = [GKPlayer alloc];
  int v4 = [(GKPlayer *)self internal];
  unint64_t v5 = [v4 minimalInternal];
  id v6 = [(GKPlayer *)v3 initWithInternalRepresentation:v5];

  return v6;
}

- (void)initWithInternalRepresentation:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "Initialized player with internal representation: %@", v1, 0xCu);
}

- (void)logAndReportIllegalArcadeAccessTo:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_FAULT, "Arcade game is attempting to read '%@'", v1, 0xCu);
}

- (void)logAndReportIllegalArcadeAccessTo:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "ERROR: Illegal access to '%{public}@'", v2, v3, v4, v5, v6);
}

- (void)logAndReportScopedIDsError:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint8_t v6 = [a3 internal];
  BOOL v7 = +[GKPlayer gameBundleID];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  _os_log_fault_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_FAULT, "%@ scoped ids for player: %@ game bundle id: %@", (uint8_t *)&v8, 0x20u);
}

- (void)updateScopedIDs:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 internal];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_DEBUG, "Attempting to load scoped ids for invalid internal: %@", v5, 0xCu);
}

void __28__GKPlayer_updateScopedIDs___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 internal];
  BOOL v7 = [v6 playerID];
  int v8 = +[GKPlayer gameBundleID];
  int v9 = 138412802;
  __int16 v10 = v7;
  __int16 v11 = 2112;
  __int16 v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_ERROR, "Failed to load scoped ids for playerID: %@, gameBundleID: %@, error: %@", (uint8_t *)&v9, 0x20u);
}

void __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "***The current application is not allowed to use this API***:%@", v2, v3, v4, v5, v6);
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "GKPlayer: _loadPlayersForIdentifiers: - Failed to get profiles and scoped IDs for Player IDs due to error: %@", v2, v3, v4, v5, v6);
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_123_cold_1(void **a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  int v6 = 134218240;
  uint64_t v7 = [v4 count];
  __int16 v8 = 2048;
  uint64_t v9 = [a3 count];
  _os_log_debug_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_DEBUG, "ScopedIDs number of Guests: %lu vs Friends: %lu", (uint8_t *)&v6, 0x16u);
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_126_cold_1(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = [a1 gamePlayerID];
  uint64_t v5 = [a1 teamPlayerID];
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  __int16 v11 = v5;
  _os_log_debug_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_DEBUG, "ScopedIDs for Player: %@ gameID: %@ teamID: %@", (uint8_t *)&v6, 0x20u);
}

@end