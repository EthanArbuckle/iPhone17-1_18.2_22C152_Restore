@interface GKLeaderboardChallengeComparisonInternal
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardChallengeComparisonInternal)initWithServerRepresentation:(id)a3;
- (GKLeaderboardChallengeDetailsPageInternal)completedChallenges;
- (GKLeaderboardChallengeWinComparisonPageInternal)wonChallenges;
- (NSNumber)completedChallengeCount;
- (NSNumber)completedChallengeGameCount;
- (void)setCompletedChallengeCount:(id)a3;
- (void)setCompletedChallengeGameCount:(id)a3;
- (void)setCompletedChallenges:(id)a3;
- (void)setWonChallenges:(id)a3;
@end

@implementation GKLeaderboardChallengeComparisonInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_537 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_537, &__block_literal_global_539);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_536;

  return v2;
}

void __67__GKLeaderboardChallengeComparisonInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"completedChallengeCount";
  v3[0] = objc_opt_class();
  v2[1] = @"completedChallengeGameCount";
  v3[1] = objc_opt_class();
  v2[2] = @"completedChallenges";
  v3[2] = objc_opt_class();
  v2[3] = @"wonChallenges";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_536;
  secureCodedPropertyKeys_sSecureCodedKeys_536 = v0;
}

- (GKLeaderboardChallengeComparisonInternal)initWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKLeaderboardChallengeComparisonInternal;
  v5 = [(GKLeaderboardChallengeComparisonInternal *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"challenges-count"];
    [(GKLeaderboardChallengeComparisonInternal *)v5 setCompletedChallengeCount:v6];

    v7 = [v4 objectForKeyedSubscript:@"challenge-games-count"];
    [(GKLeaderboardChallengeComparisonInternal *)v5 setCompletedChallengeGameCount:v7];

    v8 = [v4 objectForKeyedSubscript:@"completed-challenges"];
    v9 = +[GKLeaderboardChallengeDetailsPageInternal initWithServerFragment:v8];
    [(GKLeaderboardChallengeComparisonInternal *)v5 setCompletedChallenges:v9];

    v10 = [v4 objectForKeyedSubscript:@"wins"];
    v11 = +[GKLeaderboardChallengeWinComparisonPageInternal initWithServerFragment:v10];
    [(GKLeaderboardChallengeComparisonInternal *)v5 setWonChallenges:v11];
  }
  return v5;
}

- (NSNumber)completedChallengeCount
{
  return self->_completedChallengeCount;
}

- (void)setCompletedChallengeCount:(id)a3
{
}

- (NSNumber)completedChallengeGameCount
{
  return self->_completedChallengeGameCount;
}

- (void)setCompletedChallengeGameCount:(id)a3
{
}

- (GKLeaderboardChallengeDetailsPageInternal)completedChallenges
{
  return self->_completedChallenges;
}

- (void)setCompletedChallenges:(id)a3
{
}

- (GKLeaderboardChallengeWinComparisonPageInternal)wonChallenges
{
  return self->_wonChallenges;
}

- (void)setWonChallenges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wonChallenges, 0);
  objc_storeStrong((id *)&self->_completedChallenges, 0);
  objc_storeStrong((id *)&self->_completedChallengeGameCount, 0);

  objc_storeStrong((id *)&self->_completedChallengeCount, 0);
}

@end