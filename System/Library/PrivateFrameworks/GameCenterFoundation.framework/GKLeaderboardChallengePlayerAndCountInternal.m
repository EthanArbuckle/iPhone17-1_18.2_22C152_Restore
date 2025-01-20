@interface GKLeaderboardChallengePlayerAndCountInternal
+ (id)initWithServerFragment:(id)a3;
+ (id)secureCodedPropertyKeys;
- (NSNumber)count;
- (NSString)playerID;
- (void)setCount:(id)a3;
- (void)setPlayerID:(id)a3;
@end

@implementation GKLeaderboardChallengePlayerAndCountInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_608 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_608, &__block_literal_global_610);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_607;

  return v2;
}

void __71__GKLeaderboardChallengePlayerAndCountInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"playerID";
  v2[1] = @"count";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_607;
  secureCodedPropertyKeys_sSecureCodedKeys_607 = v0;
}

+ (id)initWithServerFragment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengePlayerAndCountInternal);
  v5 = [v3 objectForKeyedSubscript:@"player-id"];
  [(GKLeaderboardChallengePlayerAndCountInternal *)v4 setPlayerID:v5];

  v6 = [v3 objectForKeyedSubscript:@"count"];

  [(GKLeaderboardChallengePlayerAndCountInternal *)v4 setCount:v6];

  return v4;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
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

  objc_storeStrong((id *)&self->_playerID, 0);
}

@end