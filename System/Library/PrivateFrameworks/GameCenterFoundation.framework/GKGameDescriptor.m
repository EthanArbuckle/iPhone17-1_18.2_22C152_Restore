@interface GKGameDescriptor
+ (BOOL)supportsPlatform:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (GKGameDescriptor)gameDescriptorWithBundleID:(id)a3 bundleVersion:(id)a4 shortBundleVersion:(id)a5 adamID:(id)a6;
+ (id)currentPlatformServerPushString;
+ (id)currentPlatformServerString;
+ (id)secureCodedPropertyKeys;
+ (id)stringForPlatform:(int64_t)a3;
+ (id)supportedPlatforms;
+ (int64_t)currentPlatform;
+ (int64_t)gamePlatformFromServerGameDescriptorString:(id)a3;
+ (int64_t)gamePlatformFromServerPushString:(id)a3;
- (GKGameDescriptor)initWithDictionary:(id)a3;
- (GKGameDescriptor)initWithPushDictionary:(id)a3;
- (NSNumber)adamID;
- (NSNumber)externalVersion;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)shortBundleVersion;
- (id)description;
- (id)dictionaryForRequest;
- (int64_t)platform;
- (void)setAdamID:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setExternalVersion:(id)a3;
- (void)setPlatform:(int64_t)a3;
- (void)setShortBundleVersion:(id)a3;
@end

@implementation GKGameDescriptor

+ (GKGameDescriptor)gameDescriptorWithBundleID:(id)a3 bundleVersion:(id)a4 shortBundleVersion:(id)a5 adamID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(GKGameDescriptor);
  [(GKGameDescriptor *)v14 setBundleIdentifier:v13];

  [(GKGameDescriptor *)v14 setBundleVersion:v12];
  [(GKGameDescriptor *)v14 setShortBundleVersion:v11];

  [(GKGameDescriptor *)v14 setAdamID:v10];
  -[GKGameDescriptor setPlatform:](v14, "setPlatform:", [a1 currentPlatform]);

  return v14;
}

+ (int64_t)gamePlatformFromServerGameDescriptorString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ios"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"xros"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"macos"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"appletvos"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"watchos"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)gamePlatformFromServerPushString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"i"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"r"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"m"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"t"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"w"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)currentPlatform
{
  return 1;
}

+ (id)currentPlatformServerString
{
  return @"ios";
}

+ (id)currentPlatformServerPushString
{
  return @"i";
}

+ (BOOL)supportsPlatform:(int64_t)a3
{
  int64_t v4 = +[GKGameDescriptor supportedPlatforms];
  v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

+ (id)supportedPlatforms
{
  return &unk_1F1E7E990;
}

- (GKGameDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKGameDescriptor;
  v5 = [(GKGameDescriptor *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"bundle-id"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"bundle-version"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"adam-id"];
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"external-version"];
    externalVersion = v5->_externalVersion;
    v5->_externalVersion = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"short-bundle-version"];
    shortBundleVersion = v5->_shortBundleVersion;
    v5->_shortBundleVersion = (NSString *)v14;

    v16 = objc_opt_class();
    v17 = [v4 objectForKeyedSubscript:@"platform"];
    v5->_platform = [v16 gamePlatformFromServerGameDescriptorString:v17];
  }
  return v5;
}

- (GKGameDescriptor)initWithPushDictionary:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKGameDescriptor: initWithPushDictionary", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)GKGameDescriptor;
  v7 = [(GKGameDescriptor *)&v19 init];
  if (v7)
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"i"];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"v"];
    bundleVersion = v7->_bundleVersion;
    v7->_bundleVersion = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"a"];
    adamID = v7->_adamID;
    v7->_adamID = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"V"];
    shortBundleVersion = v7->_shortBundleVersion;
    v7->_shortBundleVersion = (NSString *)v14;

    v16 = objc_opt_class();
    v17 = [v4 objectForKeyedSubscript:@"p"];
    v7->_platform = [v16 gamePlatformFromServerPushString:v17];
  }
  return v7;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_0 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_0;

  return v2;
}

void __43__GKGameDescriptor_secureCodedPropertyKeys__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"adamID";
  v3[0] = objc_opt_class();
  v2[1] = @"externalVersion";
  v3[1] = objc_opt_class();
  v2[2] = @"bundleIdentifier";
  v3[2] = objc_opt_class();
  v2[3] = @"bundleVersion";
  v3[3] = objc_opt_class();
  v2[4] = @"shortBundleVersion";
  v3[4] = objc_opt_class();
  v2[5] = @"platform";
  v3[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_0;
  secureCodedPropertyKeys_sSecureCodedKeys_0 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringForPlatform:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) < 5) {
    return off_1E646DE50[a3 - 1];
  }
  id v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    id v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = NSNumber;
    uint64_t v8 = v5;
    v9 = [v7 numberWithInteger:a3];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "No platform string for specified GKGamePlatform value (%@), defaulting to iOS.", (uint8_t *)&v10, 0xCu);
  }
  return @"ios";
}

- (id)dictionaryForRequest
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
  id v4 = v3;
  adamID = self->_adamID;
  if (adamID) {
    [v3 setObject:adamID forKeyedSubscript:@"adam-id"];
  }
  externalVersion = self->_externalVersion;
  if (externalVersion) {
    [v4 setObject:externalVersion forKeyedSubscript:@"external-version"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKeyedSubscript:@"bundle-id"];
  }
  bundleVersion = self->_bundleVersion;
  if (bundleVersion) {
    [v4 setObject:bundleVersion forKeyedSubscript:@"bundle-version"];
  }
  shortBundleVersion = self->_shortBundleVersion;
  if (shortBundleVersion) {
    [v4 setObject:shortBundleVersion forKeyedSubscript:@"short-bundle-version"];
  }
  int v10 = objc_msgSend((id)objc_opt_class(), "stringForPlatform:", -[GKGameDescriptor platform](self, "platform"));
  if (v10) {
    [v4 setObject:v10 forKeyedSubscript:@"platform"];
  }
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  return v11;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)GKGameDescriptor;
  id v3 = [(GKInternalRepresentation *)&v12 description];
  id v4 = [(GKGameDescriptor *)self bundleIdentifier];
  id v5 = [(GKGameDescriptor *)self bundleVersion];
  id v6 = [(GKGameDescriptor *)self adamID];
  v7 = [(GKGameDescriptor *)self externalVersion];
  uint64_t v8 = [(GKGameDescriptor *)self shortBundleVersion];
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKGameDescriptor platform](self, "platform"));
  int v10 = [v3 stringByAppendingFormat:@"bundleIdentifier:%@\nbundleVersion:%@\nadamID:%@\nexternalVersion:%@\nshortBundleVersion:%@\nplatform:%@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSNumber)externalVersion
{
  return self->_externalVersion;
}

- (void)setExternalVersion:(id)a3
{
}

- (NSString)shortBundleVersion
{
  return self->_shortBundleVersion;
}

- (void)setShortBundleVersion:(id)a3
{
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortBundleVersion, 0);
  objc_storeStrong((id *)&self->_externalVersion, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end