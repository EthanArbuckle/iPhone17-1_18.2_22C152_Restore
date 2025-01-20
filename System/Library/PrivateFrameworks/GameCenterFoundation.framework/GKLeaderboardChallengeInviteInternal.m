@interface GKLeaderboardChallengeInviteInternal
+ (id)initWithServerFragment:(id)a3;
+ (id)secureCodedPropertyKeys;
- (NSDate)invitedDate;
- (NSString)bundleID;
- (NSString)challengeID;
- (NSString)fromPlayerID;
- (void)setBundleID:(id)a3;
- (void)setChallengeID:(id)a3;
- (void)setFromPlayerID:(id)a3;
- (void)setInvitedDate:(id)a3;
@end

@implementation GKLeaderboardChallengeInviteInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_280 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_280, &__block_literal_global_282);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_279;

  return v2;
}

void __63__GKLeaderboardChallengeInviteInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"challengeID";
  v3[0] = objc_opt_class();
  v2[1] = @"bundleID";
  v3[1] = objc_opt_class();
  v2[2] = @"fromPlayerID";
  v3[2] = objc_opt_class();
  v2[3] = @"invitedDate";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_279;
  secureCodedPropertyKeys_sSecureCodedKeys_279 = v0;
}

+ (id)initWithServerFragment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeInviteInternal);
  v5 = [v3 objectForKeyedSubscript:@"challenge-id"];
  [(GKLeaderboardChallengeInviteInternal *)v4 setChallengeID:v5];

  v6 = [v3 objectForKeyedSubscript:@"bundle-id"];
  [(GKLeaderboardChallengeInviteInternal *)v4 setBundleID:v6];

  v7 = [v3 objectForKeyedSubscript:@"from-player-id"];
  [(GKLeaderboardChallengeInviteInternal *)v4 setFromPlayerID:v7];

  v8 = (void *)MEMORY[0x1E4F1C9C8];
  v9 = [v3 objectForKeyedSubscript:@"invited-timestamp"];

  v10 = [v8 _gkDateFromServerTimestamp:v9];
  [(GKLeaderboardChallengeInviteInternal *)v4 setInvitedDate:v10];

  return v4;
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedDate, 0);
  objc_storeStrong((id *)&self->_fromPlayerID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_challengeID, 0);
}

@end