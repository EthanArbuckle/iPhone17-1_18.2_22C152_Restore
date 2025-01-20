@interface GKLeaderboardChallengeSummaryInternal
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardChallengeActivePageInternal)activeChallenges;
- (GKLeaderboardChallengeInvitePageInternal)invitedPlayers;
- (GKLeaderboardChallengeSummaryInternal)initWithServerRepresentation:(id)a3;
- (NSNumber)completedCount;
- (NSNumber)winCount;
- (void)setActiveChallenges:(id)a3;
- (void)setCompletedCount:(id)a3;
- (void)setInvitedPlayers:(id)a3;
- (void)setWinCount:(id)a3;
@end

@implementation GKLeaderboardChallengeSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_432 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_432, &__block_literal_global_434);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_431;

  return v2;
}

void __64__GKLeaderboardChallengeSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"completedCount";
  v3[0] = objc_opt_class();
  v2[1] = @"winCount";
  v3[1] = objc_opt_class();
  v2[2] = @"invitedPlayers";
  v3[2] = objc_opt_class();
  v2[3] = @"activeChallenges";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_431;
  secureCodedPropertyKeys_sSecureCodedKeys_431 = v0;
}

- (GKLeaderboardChallengeSummaryInternal)initWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKLeaderboardChallengeSummaryInternal;
  v5 = [(GKLeaderboardChallengeSummaryInternal *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"completed"];
    [(GKLeaderboardChallengeSummaryInternal *)v5 setCompletedCount:v6];

    v7 = [v4 objectForKeyedSubscript:@"wins"];
    [(GKLeaderboardChallengeSummaryInternal *)v5 setWinCount:v7];

    v8 = [v4 objectForKeyedSubscript:@"invites"];
    v9 = +[GKLeaderboardChallengeInvitePageInternal initWithServerFragment:v8];
    [(GKLeaderboardChallengeSummaryInternal *)v5 setInvitedPlayers:v9];

    v10 = [v4 objectForKeyedSubscript:@"active-challenges"];
    v11 = +[GKLeaderboardChallengeActivePageInternal initWithServerFragment:v10];
    [(GKLeaderboardChallengeSummaryInternal *)v5 setActiveChallenges:v11];
  }
  return v5;
}

- (NSNumber)completedCount
{
  return self->_completedCount;
}

- (void)setCompletedCount:(id)a3
{
}

- (NSNumber)winCount
{
  return self->_winCount;
}

- (void)setWinCount:(id)a3
{
}

- (GKLeaderboardChallengeInvitePageInternal)invitedPlayers
{
  return self->_invitedPlayers;
}

- (void)setInvitedPlayers:(id)a3
{
}

- (GKLeaderboardChallengeActivePageInternal)activeChallenges
{
  return self->_activeChallenges;
}

- (void)setActiveChallenges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeChallenges, 0);
  objc_storeStrong((id *)&self->_invitedPlayers, 0);
  objc_storeStrong((id *)&self->_winCount, 0);

  objc_storeStrong((id *)&self->_completedCount, 0);
}

@end