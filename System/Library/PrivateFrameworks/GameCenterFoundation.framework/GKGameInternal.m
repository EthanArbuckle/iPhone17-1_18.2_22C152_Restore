@interface GKGameInternal
+ (id)createGameControllerDaemonGameInternal;
+ (id)createGamedGameInternal;
+ (id)secureCodedPropertyKeys;
- (BOOL)canBeIndexed;
- (BOOL)hasAggregateLeaderboard;
- (BOOL)isArcadeGame;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrerendered;
- (BOOL)isValid;
- (BOOL)supportsAchievements;
- (BOOL)supportsChallenges;
- (BOOL)supportsLeaderboardChallenges;
- (BOOL)supportsLeaderboardSets;
- (BOOL)supportsLeaderboards;
- (BOOL)supportsMultiplayer;
- (BOOL)supportsTurnBasedMultiplayer;
- (GKGameDescriptor)gameDescriptor;
- (NSDictionary)icons;
- (NSSet)compatiblePlatforms;
- (NSSet)supportedTransports;
- (NSString)defaultLeaderboardIdentifier;
- (NSString)name;
- (NSURL)storeURL;
- (id)description;
- (id)storeItemURLForURL:(id)a3 gamePlatform:(int64_t)a4 extraQueryParams:(id)a5;
- (unint64_t)hash;
- (unsigned)flags;
- (unsigned)maxAchievementPoints;
- (unsigned)numberOfAchievements;
- (unsigned)numberOfLeaderboardSets;
- (unsigned)numberOfLeaderboards;
- (void)setCompatiblePlatforms:(id)a3;
- (void)setDefaultLeaderboardIdentifier:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHasAggregateLeaderboard:(BOOL)a3;
- (void)setIcons:(id)a3;
- (void)setIsArcadeGame:(BOOL)a3;
- (void)setMaxAchievementPoints:(unsigned __int16)a3;
- (void)setName:(id)a3;
- (void)setNumberOfAchievements:(unsigned __int16)a3;
- (void)setNumberOfLeaderboardSets:(unsigned __int16)a3;
- (void)setNumberOfLeaderboards:(unsigned __int16)a3;
- (void)setPrerendered:(BOOL)a3;
- (void)setSupportedTransports:(id)a3;
- (void)setSupportsAchievements:(BOOL)a3;
- (void)setSupportsChallenges:(BOOL)a3;
- (void)setSupportsLeaderboardChallenges:(BOOL)a3;
- (void)setSupportsLeaderboardSets:(BOOL)a3;
- (void)setSupportsLeaderboards:(BOOL)a3;
- (void)setSupportsMultiplayer:(BOOL)a3;
- (void)setSupportsTurnBasedMultiplayer:(BOOL)a3;
- (void)setValid:(BOOL)a3;
- (void)storeItemURLForGamePlatform:(int64_t)a3 withContext:(id)a4 withHandler:(id)a5;
@end

@implementation GKGameInternal

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(GKGameDescriptor *)self bundleIdentifier];
    v6 = [v4 bundleIdentifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(GKGameDescriptor *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_16 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_16, &__block_literal_global_56);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_16;

  return v2;
}

void __41__GKGameInternal_secureCodedPropertyKeys__block_invoke()
{
  v13[17] = *MEMORY[0x1E4F143B8];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  unint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"bundleIdentifier", @"bundleVersion", @"adamID", @"externalVersion", @"name", @"icons");
  v13[5] = v3;
  v12[6] = @"defaultLeaderboardIdentifier";
  v13[6] = objc_opt_class();
  v12[7] = @"flags";
  v13[7] = objc_opt_class();
  v12[8] = @"numberOfLeaderboards";
  v13[8] = objc_opt_class();
  v12[9] = @"numberOfLeaderboardSets";
  v13[9] = objc_opt_class();
  v12[10] = @"numberOfAchievements";
  v13[10] = objc_opt_class();
  v12[11] = @"maxAchievementPoints";
  v13[11] = objc_opt_class();
  v12[12] = @"shortBundleVersion";
  v13[12] = objc_opt_class();
  v12[13] = @"platform";
  v13[13] = objc_opt_class();
  v12[14] = @"compatiblePlatforms";
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v13[14] = v6;
  v12[15] = @"supportedTransports";
  char v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v13[15] = v9;
  v12[16] = @"isArcadeGame";
  v13[16] = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:17];

  v11 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_16;
  secureCodedPropertyKeys_sSecureCodedKeys_16 = v10;
}

- (id)description
{
  int64_t v3 = [(GKGameDescriptor *)self platform];
  if ((unint64_t)(v3 - 1) > 4) {
    id v4 = @"unknown";
  }
  else {
    id v4 = off_1E6472570[v3 - 1];
  }
  v8.receiver = self;
  v8.super_class = (Class)GKGameInternal;
  uint64_t v5 = [(GKGameDescriptor *)&v8 description];
  v6 = [v5 stringByAppendingFormat:@" (%@)", v4];

  return v6;
}

- (BOOL)isPrerendered
{
  return *((unsigned char *)&self->_flags.var0 + 1) & 1;
}

- (void)setPrerendered:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_flags._value = self->_flags._value & 0xFFFFFEFF | v3;
}

- (BOOL)supportsLeaderboards
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 1) & 1;
}

- (void)setSupportsLeaderboards:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_flags._value = self->_flags._value & 0xFFFFFDFF | v3;
}

- (BOOL)supportsLeaderboardSets
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 2) & 1;
}

- (void)setSupportsLeaderboardSets:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_flags._value = self->_flags._value & 0xFFFFFBFF | v3;
}

- (BOOL)hasAggregateLeaderboard
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 3) & 1;
}

- (void)setHasAggregateLeaderboard:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_flags._value = self->_flags._value & 0xFFFFF7FF | v3;
}

- (BOOL)supportsAchievements
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 4) & 1;
}

- (void)setSupportsAchievements:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_flags._value = self->_flags._value & 0xFFFFEFFF | v3;
}

- (BOOL)supportsMultiplayer
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 5) & 1;
}

- (void)setSupportsMultiplayer:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_flags._value = self->_flags._value & 0xFFFFDFFF | v3;
}

- (BOOL)canBeIndexed
{
  if ([(GKGameInternal *)self supportsAchievements]
    || [(GKGameInternal *)self supportsLeaderboards]
    || [(GKGameInternal *)self supportsLeaderboardSets]
    || [(GKGameInternal *)self supportsMultiplayer])
  {
    return 1;
  }

  return [(GKGameInternal *)self supportsTurnBasedMultiplayer];
}

- (BOOL)isValid
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 6) & 1;
}

- (void)setValid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_flags._value = self->_flags._value & 0xFFFFBFFF | v3;
}

- (BOOL)supportsTurnBasedMultiplayer
{
  return BYTE2(self->_flags._value) & 1;
}

- (void)setSupportsTurnBasedMultiplayer:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_flags._value = self->_flags._value & 0xFFFEFFFF | v3;
}

- (unsigned)flags
{
  return self->_flags._value;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags._value = a3;
}

- (GKGameDescriptor)gameDescriptor
{
  int v3 = [(GKGameDescriptor *)self bundleIdentifier];
  id v4 = [(GKGameDescriptor *)self bundleVersion];
  uint64_t v5 = [(GKGameDescriptor *)self shortBundleVersion];
  v6 = [(GKGameDescriptor *)self adamID];
  char v7 = +[GKGameDescriptor gameDescriptorWithBundleID:v3 bundleVersion:v4 shortBundleVersion:v5 adamID:v6];

  objc_super v8 = [(GKGameDescriptor *)self externalVersion];
  [v7 setExternalVersion:v8];

  objc_msgSend(v7, "setPlatform:", -[GKGameDescriptor platform](self, "platform"));

  return (GKGameDescriptor *)v7;
}

- (BOOL)isArcadeGame
{
  return (BYTE2(self->_flags._value) >> 1) & 1;
}

- (BOOL)supportsChallenges
{
  unsigned int value = self->_flags._value;
  if ((value & 0x40000) == 0)
  {
    uint64_t v2 = +[GKPreferences shared];
    if (![v2 supportsChallenges])
    {
      BOOL v5 = 0;
      goto LABEL_9;
    }
  }
  if ([(GKGameInternal *)self supportsLeaderboards]
    || [(GKGameInternal *)self supportsLeaderboardSets])
  {
    BOOL v5 = 1;
    if ((value & 0x40000) != 0) {
      return v5;
    }
    goto LABEL_9;
  }
  BOOL v5 = [(GKGameInternal *)self supportsAchievements];
  if ((value & 0x40000) == 0) {
LABEL_9:
  }

  return v5;
}

- (void)setIsArcadeGame:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_flags._unsigned int value = self->_flags._value & 0xFFFDFFFF | v3;
}

- (void)setSupportsChallenges:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_flags._unsigned int value = self->_flags._value & 0xFFFBFFFF | v3;
}

- (BOOL)supportsLeaderboardChallenges
{
  return (BYTE2(self->_flags._value) >> 3) & 1;
}

- (void)setSupportsLeaderboardChallenges:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_flags._unsigned int value = self->_flags._value & 0xFFF7FFFF | v3;
}

+ (id)createGamedGameInternal
{
  uint64_t v2 = objc_opt_new();
  [v2 setBundleIdentifier:@"com.apple.gamed"];
  [v2 setName:@"gamed"];

  return v2;
}

+ (id)createGameControllerDaemonGameInternal
{
  uint64_t v2 = objc_opt_new();
  [v2 setBundleIdentifier:@"com.apple.GameController.gamecontrollerd"];
  [v2 setName:@"gamecontrollerd"];

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
}

- (NSString)defaultLeaderboardIdentifier
{
  return self->_defaultLeaderboardIdentifier;
}

- (void)setDefaultLeaderboardIdentifier:(id)a3
{
}

- (unsigned)numberOfLeaderboards
{
  return self->_numberOfLeaderboards;
}

- (void)setNumberOfLeaderboards:(unsigned __int16)a3
{
  self->_numberOfLeaderboards = a3;
}

- (unsigned)numberOfLeaderboardSets
{
  return self->_numberOfLeaderboardSets;
}

- (void)setNumberOfLeaderboardSets:(unsigned __int16)a3
{
  self->_numberOfLeaderboardSets = a3;
}

- (unsigned)numberOfAchievements
{
  return self->_numberOfAchievements;
}

- (void)setNumberOfAchievements:(unsigned __int16)a3
{
  self->_numberOfAchievements = a3;
}

- (unsigned)maxAchievementPoints
{
  return self->_maxAchievementPoints;
}

- (void)setMaxAchievementPoints:(unsigned __int16)a3
{
  self->_maxAchievementPoints = a3;
}

- (NSSet)compatiblePlatforms
{
  return self->_compatiblePlatforms;
}

- (void)setCompatiblePlatforms:(id)a3
{
}

- (NSSet)supportedTransports
{
  return self->_supportedTransports;
}

- (void)setSupportedTransports:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTransports, 0);
  objc_storeStrong((id *)&self->_compatiblePlatforms, 0);
  objc_storeStrong((id *)&self->_defaultLeaderboardIdentifier, 0);
  objc_storeStrong((id *)&self->_icons, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSURL)storeURL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = NSString;
  id v4 = [(GKGameDescriptor *)self adamID];
  BOOL v5 = [v3 stringWithFormat:@"https://apps.apple.com/app/id%@", v4];
  v6 = [v2 URLWithString:v5];

  return (NSURL *)v6;
}

- (id)storeItemURLForURL:(id)a3 gamePlatform:(int64_t)a4 extraQueryParams:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 1:
    case 3:
    case 5:
      v9 = @"itunes";
      goto LABEL_4;
    case 2:
      v9 = @"macappstore";
LABEL_4:
      id v10 = [v7 _gkURLByReplacingSchemeWithScheme:v9];
      break;
    default:
      id v10 = v7;
      break;
  }
  v11 = v10;
  v12 = [v10 _gkURLByAddingQueryParameters:v8];

  return v12;
}

- (void)storeItemURLForGamePlatform:(int64_t)a3 withContext:(id)a4 withHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *, void))a5;
  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  v11 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "GKGameInternal: storeItemURLForGamePlatform:", v15, 2u);
  }
  v12 = [(GKGameInternal *)self storeURL];
  v13 = v12;
  if (v9)
  {
    if (a3 == 3)
    {
      uint64_t v14 = [v12 _gkURLByReplacingSchemeWithScheme:@"com.apple.TVAppStore"];

      v13 = (void *)v14;
    }
    v9[2](v9, v13, 0);
  }
}

@end