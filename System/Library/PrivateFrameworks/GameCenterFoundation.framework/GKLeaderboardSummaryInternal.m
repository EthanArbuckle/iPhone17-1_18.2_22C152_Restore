@interface GKLeaderboardSummaryInternal
+ (id)secureCodedPropertyKeys;
- (NSString)baseLeaderboardID;
- (NSString)formattedScoreValue;
- (NSString)groupID;
- (NSString)leaderboardID;
- (NSString)timeScope;
- (NSString)title;
- (NSString)type;
- (unint64_t)context;
- (unint64_t)duration;
- (unint64_t)friendRank;
- (unint64_t)nextStartDate;
- (unint64_t)rank;
- (unint64_t)scoreValue;
- (unint64_t)startDate;
- (unint64_t)status;
- (unint64_t)totalEntries;
- (unint64_t)totalFriendEntries;
- (void)setBaseLeaderboardID:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setFormattedScoreValue:(id)a3;
- (void)setFriendRank:(unint64_t)a3;
- (void)setGroupID:(id)a3;
- (void)setLeaderboardID:(id)a3;
- (void)setNextStartDate:(unint64_t)a3;
- (void)setRank:(unint64_t)a3;
- (void)setScoreValue:(unint64_t)a3;
- (void)setStartDate:(unint64_t)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTimeScope:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalEntries:(unint64_t)a3;
- (void)setTotalFriendEntries:(unint64_t)a3;
- (void)setType:(id)a3;
@end

@implementation GKLeaderboardSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_26 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_26, &__block_literal_global_66);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_26;

  return v2;
}

void __55__GKLeaderboardSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[17] = *MEMORY[0x1E4F143B8];
  v2[0] = @"baseLeaderboardID";
  v3[0] = objc_opt_class();
  v2[1] = @"leaderboardID";
  v3[1] = objc_opt_class();
  v2[2] = @"timeScope";
  v3[2] = objc_opt_class();
  v2[3] = @"groupID";
  v3[3] = objc_opt_class();
  v2[4] = @"title";
  v3[4] = objc_opt_class();
  v2[5] = @"type";
  v3[5] = objc_opt_class();
  v2[6] = @"formattedScoreValue";
  v3[6] = objc_opt_class();
  v2[7] = @"context";
  v3[7] = objc_opt_class();
  v2[8] = @"status";
  v3[8] = objc_opt_class();
  v2[9] = @"startDate";
  v3[9] = objc_opt_class();
  v2[10] = @"duration";
  v3[10] = objc_opt_class();
  v2[11] = @"nextStartDate";
  v3[11] = objc_opt_class();
  v2[12] = @"scoreValue";
  v3[12] = objc_opt_class();
  v2[13] = @"rank";
  v3[13] = objc_opt_class();
  v2[14] = @"totalEntries";
  v3[14] = objc_opt_class();
  v2[15] = @"friendRank";
  v3[15] = objc_opt_class();
  v2[16] = @"totalFriendEntries";
  v3[16] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:17];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_26;
  secureCodedPropertyKeys_sSecureCodedKeys_26 = v0;
}

- (NSString)baseLeaderboardID
{
  return self->_baseLeaderboardID;
}

- (void)setBaseLeaderboardID:(id)a3
{
}

- (NSString)leaderboardID
{
  return self->_leaderboardID;
}

- (void)setLeaderboardID:(id)a3
{
}

- (NSString)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)formattedScoreValue
{
  return self->_formattedScoreValue;
}

- (void)setFormattedScoreValue:(id)a3
{
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(unint64_t)a3
{
  self->_startDate = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)nextStartDate
{
  return self->_nextStartDate;
}

- (void)setNextStartDate:(unint64_t)a3
{
  self->_nextStartDate = a3;
}

- (unint64_t)scoreValue
{
  return self->_scoreValue;
}

- (void)setScoreValue:(unint64_t)a3
{
  self->_scoreValue = a3;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (unint64_t)totalEntries
{
  return self->_totalEntries;
}

- (void)setTotalEntries:(unint64_t)a3
{
  self->_totalEntries = a3;
}

- (unint64_t)friendRank
{
  return self->_friendRank;
}

- (void)setFriendRank:(unint64_t)a3
{
  self->_friendRank = a3;
}

- (unint64_t)totalFriendEntries
{
  return self->_totalFriendEntries;
}

- (void)setTotalFriendEntries:(unint64_t)a3
{
  self->_totalFriendEntries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedScoreValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_timeScope, 0);
  objc_storeStrong((id *)&self->_leaderboardID, 0);

  objc_storeStrong((id *)&self->_baseLeaderboardID, 0);
}

@end