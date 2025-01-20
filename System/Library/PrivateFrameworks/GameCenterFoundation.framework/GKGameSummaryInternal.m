@interface GKGameSummaryInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)isArcade;
- (NSDate)playedAt;
- (NSNumber)adamID;
- (NSSet)compatiblePlatforms;
- (NSString)bundleID;
- (id)description;
- (void)setAdamID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCompatiblePlatforms:(id)a3;
- (void)setIsArcade:(BOOL)a3;
- (void)setPlayedAt:(id)a3;
@end

@implementation GKGameSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_4 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_4, &__block_literal_global_27);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_4;

  return v2;
}

void __48__GKGameSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_4;
  secureCodedPropertyKeys_sSecureCodedKeys_4 = (uint64_t)v0;

  [(id)secureCodedPropertyKeys_sSecureCodedKeys_4 setObject:objc_opt_class() forKeyedSubscript:@"bundleID"];
  [(id)secureCodedPropertyKeys_sSecureCodedKeys_4 setObject:objc_opt_class() forKeyedSubscript:@"playedAt"];
  [(id)secureCodedPropertyKeys_sSecureCodedKeys_4 setObject:objc_opt_class() forKeyedSubscript:@"adamID"];
  [(id)secureCodedPropertyKeys_sSecureCodedKeys_4 setObject:objc_opt_class() forKeyedSubscript:@"isArcade"];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)secureCodedPropertyKeys_sSecureCodedKeys_4 setObject:v4 forKeyedSubscript:@"compatiblePlatforms"];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(GKGameSummaryInternal *)self adamID];
  v5 = [(GKGameSummaryInternal *)self bundleID];
  v6 = [(GKGameSummaryInternal *)self playedAt];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[GKGameSummaryInternal isArcade](self, "isArcade"));
  v8 = [(GKGameSummaryInternal *)self compatiblePlatforms];
  v9 = [v3 stringWithFormat:@"adamID: %@ bundleID: %@ playedAt: %@ isArcade: %@ compatiblePlatforms: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSDate)playedAt
{
  return self->_playedAt;
}

- (void)setPlayedAt:(id)a3
{
}

- (NSSet)compatiblePlatforms
{
  return self->_compatiblePlatforms;
}

- (void)setCompatiblePlatforms:(id)a3
{
}

- (BOOL)isArcade
{
  return self->_isArcade;
}

- (void)setIsArcade:(BOOL)a3
{
  self->_isArcade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatiblePlatforms, 0);
  objc_storeStrong((id *)&self->_playedAt, 0);
  objc_storeStrong((id *)&self->_adamID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end