@interface GKLeaderboardChallengeInviteStatusInternal
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardChallengeInviteStatusInternal)initWithServerRepresentation:(id)a3;
- (NSArray)invitees;
- (void)setInvitees:(id)a3;
@end

@implementation GKLeaderboardChallengeInviteStatusInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_264 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_264, &__block_literal_global_266);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_263;

  return v2;
}

void __69__GKLeaderboardChallengeInviteStatusInternal_secureCodedPropertyKeys__block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"invitees";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  v2 = [v0 setWithArray:v1];
  v7[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_263;
  secureCodedPropertyKeys_sSecureCodedKeys_263 = v3;
}

- (GKLeaderboardChallengeInviteStatusInternal)initWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardChallengeInviteStatusInternal;
  v5 = [(GKLeaderboardChallengeInviteStatusInternal *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"responses"];
    v7 = [v6 _gkMapWithBlock:&__block_literal_global_273];
    [(GKLeaderboardChallengeInviteStatusInternal *)v5 setInvitees:v7];
  }
  return v5;
}

GKLeaderboardChallengeInviteeStatusInternal *__75__GKLeaderboardChallengeInviteStatusInternal_initWithServerRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[GKLeaderboardChallengeInviteeStatusInternal alloc] initWithServerFragment:v2];

  return v3;
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
}

@end