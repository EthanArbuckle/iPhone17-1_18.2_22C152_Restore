@interface GKBaseLeaderboardChallengeInternal
+ (id)secureCodedPropertyKeys;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)bundleID;
- (NSString)challengeID;
- (void)setBundleID:(id)a3;
- (void)setChallengeID:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)updateWithServerResponse:(id)a3;
@end

@implementation GKBaseLeaderboardChallengeInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_104 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_104, &__block_literal_global_106);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_103;

  return v2;
}

void __61__GKBaseLeaderboardChallengeInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"challengeID";
  v3[0] = objc_opt_class();
  v2[1] = @"bundleID";
  v3[1] = objc_opt_class();
  v2[2] = @"startDate";
  v3[2] = objc_opt_class();
  v2[3] = @"endDate";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_103;
  secureCodedPropertyKeys_sSecureCodedKeys_103 = v0;
}

- (void)updateWithServerResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"challenge-id"];
  [(GKBaseLeaderboardChallengeInternal *)self setChallengeID:v5];

  v6 = [v4 objectForKeyedSubscript:@"bundle-id"];
  [(GKBaseLeaderboardChallengeInternal *)self setBundleID:v6];

  v7 = (void *)MEMORY[0x1E4F1C9C8];
  v8 = [v4 objectForKeyedSubscript:@"start-timestamp"];
  v9 = [v7 _gkDateFromServerTimestamp:v8];
  [(GKBaseLeaderboardChallengeInternal *)self setStartDate:v9];

  v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v12 = [v4 objectForKeyedSubscript:@"end-timestamp"];

  v11 = [v10 _gkDateFromServerTimestamp:v12];
  [(GKBaseLeaderboardChallengeInternal *)self setEndDate:v11];
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

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_challengeID, 0);
}

@end