@interface GKLeaderboardChallengeInviteeInternal
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardChallengeInviteeInternal)initWithServerFragment:(id)a3;
- (NSDate)invitedDate;
- (NSString)fromPlayerID;
- (NSString)playerID;
- (NSString)status;
- (void)setFromPlayerID:(id)a3;
- (void)setInvitedDate:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation GKLeaderboardChallengeInviteeInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_2 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_2, &__block_literal_global_15);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_2;

  return v2;
}

void __64__GKLeaderboardChallengeInviteeInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"playerID";
  v3[0] = objc_opt_class();
  v2[1] = @"fromPlayerID";
  v3[1] = objc_opt_class();
  v2[2] = @"invitedDate";
  v3[2] = objc_opt_class();
  v2[3] = @"status";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_2;
  secureCodedPropertyKeys_sSecureCodedKeys_2 = v0;
}

- (GKLeaderboardChallengeInviteeInternal)initWithServerFragment:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKLeaderboardChallengeInviteeInternal;
  v5 = [(GKLeaderboardChallengeInviteeInternal *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"player-id"];
    [(GKLeaderboardChallengeInviteeInternal *)v5 setPlayerID:v6];

    v7 = [v4 objectForKeyedSubscript:@"from-player-id"];
    [(GKLeaderboardChallengeInviteeInternal *)v5 setFromPlayerID:v7];

    v8 = [v4 objectForKeyedSubscript:@"invited-timestamp"];
    v9 = v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x1E4F1C9C8];
      [v8 doubleValue];
      v12 = [v10 dateWithTimeIntervalSince1970:v11 / 1000.0];
      [(GKLeaderboardChallengeInviteeInternal *)v5 setInvitedDate:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"status"];
    [(GKLeaderboardChallengeInviteeInternal *)v5 setStatus:v13];
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

- (NSString)fromPlayerID
{
  return self->_fromPlayerID;
}

- (void)setFromPlayerID:(id)a3
{
}

- (NSDate)invitedDate
{
  return self->_invitedDate;
}

- (void)setInvitedDate:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_invitedDate, 0);
  objc_storeStrong((id *)&self->_fromPlayerID, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

@end