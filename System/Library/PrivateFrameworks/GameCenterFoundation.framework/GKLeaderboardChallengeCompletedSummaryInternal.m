@interface GKLeaderboardChallengeCompletedSummaryInternal
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardChallengeCompletedSummaryInternal)initWithServerRepresentation:(id)a3;
- (NSArray)gameCounts;
- (NSArray)playerCounts;
- (NSNumber)totalCount;
- (NSNumber)totalFriends;
- (NSNumber)totalGames;
- (void)setGameCounts:(id)a3;
- (void)setPlayerCounts:(id)a3;
- (void)setTotalCount:(id)a3;
- (void)setTotalFriends:(id)a3;
- (void)setTotalGames:(id)a3;
@end

@implementation GKLeaderboardChallengeCompletedSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_618 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_618, &__block_literal_global_620);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_617;

  return v2;
}

void __73__GKLeaderboardChallengeCompletedSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"totalCount";
  v11[0] = objc_opt_class();
  v10[1] = @"totalGames";
  v11[1] = objc_opt_class();
  v10[2] = @"totalFriends";
  v11[2] = objc_opt_class();
  v10[3] = @"gameCounts";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v2 = [v0 setWithArray:v1];
  v11[3] = v2;
  v10[4] = @"playerCounts";
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v5 = [v3 setWithArray:v4];
  v11[4] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  v7 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_617;
  secureCodedPropertyKeys_sSecureCodedKeys_617 = v6;
}

- (GKLeaderboardChallengeCompletedSummaryInternal)initWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKLeaderboardChallengeCompletedSummaryInternal;
  v5 = [(GKLeaderboardChallengeCompletedSummaryInternal *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"total-count"];
    [(GKLeaderboardChallengeCompletedSummaryInternal *)v5 setTotalCount:v6];

    v7 = [v4 objectForKeyedSubscript:@"total-games"];
    [(GKLeaderboardChallengeCompletedSummaryInternal *)v5 setTotalGames:v7];

    v8 = [v4 objectForKeyedSubscript:@"total-friends"];
    [(GKLeaderboardChallengeCompletedSummaryInternal *)v5 setTotalFriends:v8];

    v9 = [v4 objectForKeyedSubscript:@"by-games"];
    v10 = [v9 _gkMapWithBlock:&__block_literal_global_650];
    [(GKLeaderboardChallengeCompletedSummaryInternal *)v5 setGameCounts:v10];

    v11 = [v4 objectForKeyedSubscript:@"by-players"];
    v12 = [v11 _gkMapWithBlock:&__block_literal_global_655];
    [(GKLeaderboardChallengeCompletedSummaryInternal *)v5 setPlayerCounts:v12];
  }
  return v5;
}

GKLeaderboardChallengeBundleAndCountInternal *__79__GKLeaderboardChallengeCompletedSummaryInternal_initWithServerRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GKLeaderboardChallengeBundleAndCountInternal initWithServerFragment:a2];
}

GKLeaderboardChallengePlayerAndCountInternal *__79__GKLeaderboardChallengeCompletedSummaryInternal_initWithServerRepresentation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[GKLeaderboardChallengePlayerAndCountInternal initWithServerFragment:a2];
}

- (NSNumber)totalCount
{
  return self->_totalCount;
}

- (void)setTotalCount:(id)a3
{
}

- (NSNumber)totalGames
{
  return self->_totalGames;
}

- (void)setTotalGames:(id)a3
{
}

- (NSNumber)totalFriends
{
  return self->_totalFriends;
}

- (void)setTotalFriends:(id)a3
{
}

- (NSArray)gameCounts
{
  return self->_gameCounts;
}

- (void)setGameCounts:(id)a3
{
}

- (NSArray)playerCounts
{
  return self->_playerCounts;
}

- (void)setPlayerCounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerCounts, 0);
  objc_storeStrong((id *)&self->_gameCounts, 0);
  objc_storeStrong((id *)&self->_totalFriends, 0);
  objc_storeStrong((id *)&self->_totalGames, 0);

  objc_storeStrong((id *)&self->_totalCount, 0);
}

@end