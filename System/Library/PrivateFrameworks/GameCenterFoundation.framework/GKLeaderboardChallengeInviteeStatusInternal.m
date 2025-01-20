@interface GKLeaderboardChallengeInviteeStatusInternal
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardChallengeInviteeStatusInternal)initWithServerFragment:(id)a3;
- (NSString)playerID;
- (NSString)status;
- (void)setPlayerID:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation GKLeaderboardChallengeInviteeStatusInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_254 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_254, &__block_literal_global_256);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_253;

  return v2;
}

void __70__GKLeaderboardChallengeInviteeStatusInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"status";
  v2[1] = @"playerID";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_253;
  secureCodedPropertyKeys_sSecureCodedKeys_253 = v0;
}

- (GKLeaderboardChallengeInviteeStatusInternal)initWithServerFragment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardChallengeInviteeStatusInternal;
  v5 = [(GKLeaderboardChallengeInviteeStatusInternal *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"status"];
    [(GKLeaderboardChallengeInviteeStatusInternal *)v5 setStatus:v6];

    v7 = [v4 objectForKeyedSubscript:@"player-id"];
    [(GKLeaderboardChallengeInviteeStatusInternal *)v5 setPlayerID:v7];
  }
  return v5;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerID, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

@end