@interface GKLeaderboardChallengeParticipantInternal
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardChallengeParticipantInternal)initWithServerFragment:(id)a3;
- (NSNumber)attemptCount;
- (NSNumber)rank;
- (NSNumber)scoreValue;
- (NSString)formattedScoreValue;
- (NSString)playerID;
- (void)setAttemptCount:(id)a3;
- (void)setFormattedScoreValue:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRank:(id)a3;
- (void)setScoreValue:(id)a3;
@end

@implementation GKLeaderboardChallengeParticipantInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_51 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_51, &__block_literal_global_53);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_50;

  return v2;
}

void __68__GKLeaderboardChallengeParticipantInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"playerID";
  v3[0] = objc_opt_class();
  v2[1] = @"formattedScoreValue";
  v3[1] = objc_opt_class();
  v2[2] = @"scoreValue";
  v3[2] = objc_opt_class();
  v2[3] = @"attemptCount";
  v3[3] = objc_opt_class();
  v2[4] = @"rank";
  v3[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_50;
  secureCodedPropertyKeys_sSecureCodedKeys_50 = v0;
}

- (GKLeaderboardChallengeParticipantInternal)initWithServerFragment:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKLeaderboardChallengeParticipantInternal;
  v5 = [(GKLeaderboardChallengeParticipantInternal *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"player-id"];
    [(GKLeaderboardChallengeParticipantInternal *)v5 setPlayerID:v6];

    v7 = [v4 objectForKeyedSubscript:@"formatted-score-value"];
    [(GKLeaderboardChallengeParticipantInternal *)v5 setFormattedScoreValue:v7];

    v8 = [v4 objectForKeyedSubscript:@"score-value"];
    [(GKLeaderboardChallengeParticipantInternal *)v5 setScoreValue:v8];

    v9 = [v4 objectForKeyedSubscript:@"attempt-count"];
    [(GKLeaderboardChallengeParticipantInternal *)v5 setAttemptCount:v9];

    v10 = [v4 objectForKeyedSubscript:@"rank"];
    [(GKLeaderboardChallengeParticipantInternal *)v5 setRank:v10];
  }
  return v5;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSString)formattedScoreValue
{
  return self->_formattedScoreValue;
}

- (void)setFormattedScoreValue:(id)a3
{
}

- (NSNumber)scoreValue
{
  return self->_scoreValue;
}

- (void)setScoreValue:(id)a3
{
}

- (NSNumber)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(id)a3
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
  objc_storeStrong((id *)&self->_attemptCount, 0);
  objc_storeStrong((id *)&self->_scoreValue, 0);
  objc_storeStrong((id *)&self->_formattedScoreValue, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

@end