@interface GKLeaderboardChallengeParticipantSummaryInternal
+ (id)initWithServerFragment:(id)a3;
+ (id)secureCodedPropertyKeys;
- (NSNumber)rank;
- (NSString)playerID;
- (void)setPlayerID:(id)a3;
- (void)setRank:(id)a3;
@end

@implementation GKLeaderboardChallengeParticipantSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_324 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_324, &__block_literal_global_326);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_323;

  return v2;
}

void __75__GKLeaderboardChallengeParticipantSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"playerID";
  v2[1] = @"rank";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_323;
  secureCodedPropertyKeys_sSecureCodedKeys_323 = v0;
}

+ (id)initWithServerFragment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeParticipantSummaryInternal);
  v5 = [v3 objectForKeyedSubscript:@"player-id"];
  [(GKLeaderboardChallengeParticipantSummaryInternal *)v4 setPlayerID:v5];

  v6 = [v3 objectForKeyedSubscript:@"rank"];

  [(GKLeaderboardChallengeParticipantSummaryInternal *)v4 setRank:v6];

  return v4;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rank, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

@end