@interface GKLeaderboardInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)hasActiveChallenges;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsChallenges;
- (GKPlayerInternal)creator;
- (GKScoreInternal)playerScore;
- (NSArray)scores;
- (NSDate)lastSubmittedDate;
- (NSDate)nextStartDate;
- (NSDate)startDate;
- (NSDictionary)icons;
- (NSDictionary)userInfo;
- (NSString)activityType;
- (NSString)baseLeaderboardID;
- (NSString)context;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)leaderboardDescription;
- (NSString)leaderboardSetIdentifier;
- (NSString)recordID;
- (NSString)title;
- (double)duration;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)maxRange;
- (unint64_t)releaseState;
- (unsigned)friendRank;
- (unsigned)friendRankCount;
- (unsigned)maxRank;
- (unsigned)overallRank;
- (unsigned)overallRankCount;
- (void)setActivityType:(id)a3;
- (void)setBaseLeaderboardID:(id)a3;
- (void)setContext:(id)a3;
- (void)setCreator:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFriendRank:(unsigned __int16)a3;
- (void)setFriendRankCount:(unsigned __int16)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHasActiveChallenges:(BOOL)a3;
- (void)setIcons:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastSubmittedDate:(id)a3;
- (void)setLeaderboardDescription:(id)a3;
- (void)setLeaderboardSetIdentifier:(id)a3;
- (void)setMaxRank:(unsigned int)a3;
- (void)setNextStartDate:(id)a3;
- (void)setOverallRank:(unsigned int)a3;
- (void)setOverallRankCount:(unsigned int)a3;
- (void)setPlayerScore:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setReleaseState:(unint64_t)a3;
- (void)setScores:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setSupportsChallenges:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation GKLeaderboardInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_21 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_21, &__block_literal_global_61);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_21;

  return v2;
}

void __48__GKLeaderboardInternal_secureCodedPropertyKeys__block_invoke()
{
  v14[27] = *MEMORY[0x1E4F143B8];
  v13[0] = @"baseLeaderboardID";
  v14[0] = objc_opt_class();
  v13[1] = @"context";
  v14[1] = objc_opt_class();
  v13[2] = @"creator";
  v14[2] = objc_opt_class();
  v13[3] = @"duration";
  v14[3] = objc_opt_class();
  v13[4] = @"friendRank";
  v14[4] = objc_opt_class();
  v13[5] = @"friendRankCount";
  v14[5] = objc_opt_class();
  v13[6] = @"groupIdentifier";
  v14[6] = objc_opt_class();
  v13[7] = @"icons";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v14[7] = v3;
  v13[8] = @"identifier";
  v14[8] = objc_opt_class();
  v13[9] = @"lastSubmittedDate";
  v14[9] = objc_opt_class();
  v13[10] = @"leaderboardSetIdentifier";
  v14[10] = objc_opt_class();
  v13[11] = @"maxRank";
  v14[11] = objc_opt_class();
  v13[12] = @"nextStartDate";
  v14[12] = objc_opt_class();
  v13[13] = @"overallRank";
  v14[13] = objc_opt_class();
  v13[14] = @"overallRankCount";
  v14[14] = objc_opt_class();
  v13[15] = @"playerScore";
  v14[15] = objc_opt_class();
  v13[16] = @"recordID";
  v14[16] = objc_opt_class();
  v13[17] = @"releaseState";
  v14[17] = objc_opt_class();
  v13[18] = @"scores";
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v14[18] = v7;
  v13[19] = @"startDate";
  v14[19] = objc_opt_class();
  v13[20] = @"title";
  v14[20] = objc_opt_class();
  v13[21] = @"type";
  v14[21] = objc_opt_class();
  v13[22] = @"supportsChallenges";
  v14[22] = objc_opt_class();
  v13[23] = @"hasActiveChallenges";
  v14[23] = objc_opt_class();
  v13[24] = @"activityType";
  v14[24] = objc_opt_class();
  v13[25] = @"userInfo";
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = +[GKInternalRepresentation secureCodedJsonTypes];
  v10 = [v8 setWithSet:v9];
  v14[25] = v10;
  v13[26] = @"leaderboardDescription";
  v14[26] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:27];
  v12 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_21;
  secureCodedPropertyKeys_sSecureCodedKeys_21 = v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(GKLeaderboardInternal *)self identifier];
    v7 = [v5 identifier];
    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2 = [(GKLeaderboardInternal *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unint64_t)releaseState
{
  return self->_releaseState;
}

- (void)setReleaseState:(unint64_t)a3
{
  self->_releaseState = a3;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)baseLeaderboardID
{
  return self->_baseLeaderboardID;
}

- (void)setBaseLeaderboardID:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSString)leaderboardSetIdentifier
{
  return self->_leaderboardSetIdentifier;
}

- (void)setLeaderboardSetIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDate)lastSubmittedDate
{
  return self->_lastSubmittedDate;
}

- (void)setLastSubmittedDate:(id)a3
{
}

- (NSDictionary)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
}

- (unsigned)overallRank
{
  return self->_overallRank;
}

- (void)setOverallRank:(unsigned int)a3
{
  self->_overallRank = a3;
}

- (unsigned)overallRankCount
{
  return self->_overallRankCount;
}

- (void)setOverallRankCount:(unsigned int)a3
{
  self->_overallRankCount = a3;
}

- (unsigned)friendRank
{
  return self->_friendRank;
}

- (void)setFriendRank:(unsigned __int16)a3
{
  self->_friendRank = a3;
}

- (unsigned)friendRankCount
{
  return self->_friendRankCount;
}

- (void)setFriendRankCount:(unsigned __int16)a3
{
  self->_friendRankCount = a3;
}

- (unsigned)maxRank
{
  return self->_maxRank;
}

- (void)setMaxRank:(unsigned int)a3
{
  self->_maxRank = a3;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (GKScoreInternal)playerScore
{
  return self->_playerScore;
}

- (void)setPlayerScore:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)nextStartDate
{
  return self->_nextStartDate;
}

- (void)setNextStartDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (GKPlayerInternal)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)supportsChallenges
{
  return self->_supportsChallenges;
}

- (void)setSupportsChallenges:(BOOL)a3
{
  self->_supportsChallenges = a3;
}

- (BOOL)hasActiveChallenges
{
  return self->_hasActiveChallenges;
}

- (void)setHasActiveChallenges:(BOOL)a3
{
  self->_hasActiveChallenges = a3;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)leaderboardDescription
{
  return self->_leaderboardDescription;
}

- (void)setLeaderboardDescription:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_leaderboardDescription, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_nextStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_playerScore, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_lastSubmittedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_leaderboardSetIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_baseLeaderboardID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

- (unint64_t)maxRange
{
  return [(GKLeaderboardInternal *)self maxRank];
}

@end