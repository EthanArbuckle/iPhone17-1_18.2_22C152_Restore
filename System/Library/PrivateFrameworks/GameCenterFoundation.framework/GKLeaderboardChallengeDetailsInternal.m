@interface GKLeaderboardChallengeDetailsInternal
+ (id)initWithServerFragment:(id)a3;
+ (id)secureCodedPropertyKeys;
- (NSArray)participants;
- (NSNumber)participantCount;
- (NSNumber)rank;
- (NSNumber)remainingAttempts;
- (void)setParticipantCount:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setRank:(id)a3;
- (void)setRemainingAttempts:(id)a3;
- (void)updateWithServerFragment:(id)a3;
@end

@implementation GKLeaderboardChallengeDetailsInternal

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__GKLeaderboardChallengeDetailsInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_334 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_334, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_333;

  return v2;
}

void __64__GKLeaderboardChallengeDetailsInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___GKLeaderboardChallengeDetailsInternal;
  v2 = objc_msgSendSuper2(&v10, sel_secureCodedPropertyKeys);
  v3 = [v1 dictionaryWithDictionary:v2];

  v12[0] = @"participants";
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v6 = [v4 setWithArray:v5];
  v13[0] = v6;
  v12[1] = @"participantCount";
  v13[1] = objc_opt_class();
  v12[2] = @"rank";
  v13[2] = objc_opt_class();
  v12[3] = @"remainingAttempts";
  v13[3] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  [v3 addEntriesFromDictionary:v7];

  uint64_t v8 = [v3 copy];
  v9 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_333;
  secureCodedPropertyKeys_sSecureCodedKeys_333 = v8;
}

- (void)updateWithServerFragment:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKLeaderboardChallengeDetailsInternal;
  id v4 = a3;
  [(GKBaseLeaderboardChallengeInternal *)&v10 updateWithServerResponse:v4];
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", @"participants-summary", v10.receiver, v10.super_class);
  v6 = [v5 _gkMapWithBlock:&__block_literal_global_348];
  [(GKLeaderboardChallengeDetailsInternal *)self setParticipants:v6];

  v7 = [v4 objectForKeyedSubscript:@"participants-count"];
  [(GKLeaderboardChallengeDetailsInternal *)self setParticipantCount:v7];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"rank"];
  [(GKLeaderboardChallengeDetailsInternal *)self setRank:v8];

  v9 = [v4 objectForKeyedSubscript:@"remaining-attempts"];

  [(GKLeaderboardChallengeDetailsInternal *)self setRemainingAttempts:v9];
}

GKLeaderboardChallengeParticipantSummaryInternal *__66__GKLeaderboardChallengeDetailsInternal_updateWithServerFragment___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GKLeaderboardChallengeParticipantSummaryInternal initWithServerFragment:a2];
}

+ (id)initWithServerFragment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(GKLeaderboardChallengeDetailsInternal);
  [(GKLeaderboardChallengeDetailsInternal *)v4 updateWithServerFragment:v3];

  return v4;
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
}

- (NSNumber)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSNumber)participantCount
{
  return self->_participantCount;
}

- (void)setParticipantCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantCount, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_remainingAttempts, 0);

  objc_storeStrong((id *)&self->_rank, 0);
}

@end