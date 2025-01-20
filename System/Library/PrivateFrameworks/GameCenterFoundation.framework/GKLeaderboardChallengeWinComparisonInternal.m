@interface GKLeaderboardChallengeWinComparisonInternal
+ (id)initWithServerFragment:(id)a3;
+ (id)secureCodedPropertyKeys;
- (NSNumber)otherPlayerWinCount;
- (NSNumber)playerWinCount;
- (NSString)bundleID;
- (void)setBundleID:(id)a3;
- (void)setOtherPlayerWinCount:(id)a3;
- (void)setPlayerWinCount:(id)a3;
@end

@implementation GKLeaderboardChallengeWinComparisonInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_485 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_485, &__block_literal_global_487);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_484;

  return v2;
}

void __70__GKLeaderboardChallengeWinComparisonInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"bundleID";
  v3[0] = objc_opt_class();
  v2[1] = @"playerWinCount";
  v3[1] = objc_opt_class();
  v2[2] = @"otherPlayerWinCount";
  v3[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_484;
  secureCodedPropertyKeys_sSecureCodedKeys_484 = v0;
}

+ (id)initWithServerFragment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeWinComparisonInternal);
  v5 = [v3 objectForKeyedSubscript:@"bundle-id"];
  [(GKLeaderboardChallengeWinComparisonInternal *)v4 setBundleID:v5];

  v6 = [v3 objectForKeyedSubscript:@"player-win-count"];
  [(GKLeaderboardChallengeWinComparisonInternal *)v4 setPlayerWinCount:v6];

  v7 = [v3 objectForKeyedSubscript:@"compare-to-player-win-count"];

  [(GKLeaderboardChallengeWinComparisonInternal *)v4 setOtherPlayerWinCount:v7];

  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)playerWinCount
{
  return self->_playerWinCount;
}

- (void)setPlayerWinCount:(id)a3
{
}

- (NSNumber)otherPlayerWinCount
{
  return self->_otherPlayerWinCount;
}

- (void)setOtherPlayerWinCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherPlayerWinCount, 0);
  objc_storeStrong((id *)&self->_playerWinCount, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end