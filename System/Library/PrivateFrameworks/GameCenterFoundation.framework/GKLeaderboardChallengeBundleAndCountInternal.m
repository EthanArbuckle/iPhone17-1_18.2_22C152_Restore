@interface GKLeaderboardChallengeBundleAndCountInternal
+ (id)initWithServerFragment:(id)a3;
+ (id)secureCodedPropertyKeys;
- (NSNumber)count;
- (NSString)bundleID;
- (void)setBundleID:(id)a3;
- (void)setCount:(id)a3;
@end

@implementation GKLeaderboardChallengeBundleAndCountInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_590 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_590, &__block_literal_global_592);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_589;

  return v2;
}

void __71__GKLeaderboardChallengeBundleAndCountInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"bundleID";
  v2[1] = @"count";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_589;
  secureCodedPropertyKeys_sSecureCodedKeys_589 = v0;
}

+ (id)initWithServerFragment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeBundleAndCountInternal);
  v5 = [v3 objectForKeyedSubscript:@"bundle-id"];
  [(GKLeaderboardChallengeBundleAndCountInternal *)v4 setBundleID:v5];

  v6 = [v3 objectForKeyedSubscript:@"count"];

  [(GKLeaderboardChallengeBundleAndCountInternal *)v4 setCount:v6];

  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end