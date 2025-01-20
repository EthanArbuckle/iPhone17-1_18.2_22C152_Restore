@interface GKLeaderboardChallengeInternal
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardChallengeInternal)initWithServerRepresentation:(id)a3;
- (NSArray)invitees;
- (NSArray)participants;
- (NSNumber)attemptLimit;
- (NSString)creatorPlayerID;
- (NSString)leaderboardID;
- (NSString)state;
- (double)scheduledDuration;
- (void)setAttemptLimit:(id)a3;
- (void)setCreatorPlayerID:(id)a3;
- (void)setInvitees:(id)a3;
- (void)setLeaderboardID:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setScheduledDuration:(double)a3;
- (void)setState:(id)a3;
@end

@implementation GKLeaderboardChallengeInternal

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GKLeaderboardChallengeInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_158 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_158, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_157;

  return v2;
}

void __57__GKLeaderboardChallengeInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v17[7] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___GKLeaderboardChallengeInternal;
  v2 = objc_msgSendSuper2(&v13, sel_secureCodedPropertyKeys);
  v3 = [v1 dictionaryWithDictionary:v2];

  v16[0] = @"leaderboardID";
  v17[0] = objc_opt_class();
  v16[1] = @"attemptLimit";
  v17[1] = objc_opt_class();
  v16[2] = @"state";
  v17[2] = objc_opt_class();
  v16[3] = @"creatorPlayerID";
  v17[3] = objc_opt_class();
  v16[4] = @"scheduledDuration";
  v17[4] = objc_opt_class();
  v16[5] = @"participants";
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v6 = [v4 setWithArray:v5];
  v17[5] = v6;
  v16[6] = @"invitees";
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v9 = [v7 setWithArray:v8];
  v17[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];
  [v3 addEntriesFromDictionary:v10];

  uint64_t v11 = [v3 copy];
  v12 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_157;
  secureCodedPropertyKeys_sSecureCodedKeys_157 = v11;
}

- (GKLeaderboardChallengeInternal)initWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GKLeaderboardChallengeInternal;
  v5 = [(GKLeaderboardChallengeInternal *)&v18 init];
  v6 = v5;
  if (v5)
  {
    [(GKBaseLeaderboardChallengeInternal *)v5 updateWithServerResponse:v4];
    v7 = [v4 objectForKeyedSubscript:@"leaderboard-id"];
    [(GKLeaderboardChallengeInternal *)v6 setLeaderboardID:v7];

    v8 = [v4 objectForKeyedSubscript:@"attempt-limit"];
    [(GKLeaderboardChallengeInternal *)v6 setAttemptLimit:v8];

    v9 = [v4 objectForKeyedSubscript:@"state"];
    [(GKLeaderboardChallengeInternal *)v6 setState:v9];

    v10 = [v4 objectForKeyedSubscript:@"creator-player-id"];
    [(GKLeaderboardChallengeInternal *)v6 setCreatorPlayerID:v10];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"scheduled-duration"];
    [v11 doubleValue];
    [(GKLeaderboardChallengeInternal *)v6 setScheduledDuration:v12 / 1000.0];

    objc_super v13 = [v4 objectForKeyedSubscript:@"participants"];
    v14 = [v13 _gkMapWithBlock:&__block_literal_global_203];
    [(GKLeaderboardChallengeInternal *)v6 setParticipants:v14];

    v15 = [v4 objectForKeyedSubscript:@"invited-players"];
    v16 = [v15 _gkMapWithBlock:&__block_literal_global_208];
    [(GKLeaderboardChallengeInternal *)v6 setInvitees:v16];
  }
  return v6;
}

GKLeaderboardChallengeParticipantInternal *__63__GKLeaderboardChallengeInternal_initWithServerRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GKLeaderboardChallengeParticipantInternal alloc] initWithServerFragment:v2];

  return v3;
}

GKLeaderboardChallengeInviteeInternal *__63__GKLeaderboardChallengeInternal_initWithServerRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GKLeaderboardChallengeInviteeInternal alloc] initWithServerFragment:v2];

  return v3;
}

- (NSString)leaderboardID
{
  return self->_leaderboardID;
}

- (void)setLeaderboardID:(id)a3
{
}

- (NSNumber)attemptLimit
{
  return self->_attemptLimit;
}

- (void)setAttemptLimit:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)creatorPlayerID
{
  return self->_creatorPlayerID;
}

- (void)setCreatorPlayerID:(id)a3
{
}

- (double)scheduledDuration
{
  return self->_scheduledDuration;
}

- (void)setScheduledDuration:(double)a3
{
  self->_scheduledDuration = a3;
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSArray)invitees
{
  return self->_invitees;
}

- (void)setInvitees:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitees, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_creatorPlayerID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_attemptLimit, 0);

  objc_storeStrong((id *)&self->_leaderboardID, 0);
}

@end