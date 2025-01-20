@interface GKLeaderboardEntryInternal
+ (id)secureCodedPropertyKeys;
- (GKPlayerInternal)player;
- (NSDate)date;
- (NSString)baseLeaderboardID;
- (NSString)formattedScore;
- (int64_t)rank;
- (int64_t)score;
- (int64_t)state;
- (unint64_t)context;
- (void)setBaseLeaderboardID:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setFormattedScore:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setScore:(int64_t)a3;
- (void)setState:(int64_t)a3;
@end

@implementation GKLeaderboardEntryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_287 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_287, &__block_literal_global_289);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_286;

  return v2;
}

void __53__GKLeaderboardEntryInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"player";
  v3[0] = objc_opt_class();
  v2[1] = @"rank";
  v3[1] = objc_opt_class();
  v2[2] = @"score";
  v3[2] = objc_opt_class();
  v2[3] = @"formattedScore";
  v3[3] = objc_opt_class();
  v2[4] = @"context";
  v3[4] = objc_opt_class();
  v2[5] = @"date";
  v3[5] = objc_opt_class();
  v2[6] = @"state";
  v3[6] = objc_opt_class();
  v2[7] = @"baseLeaderboardID";
  v3[7] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_286;
  secureCodedPropertyKeys_sSecureCodedKeys_286 = v0;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (int64_t)score
{
  return self->_score;
}

- (void)setScore:(int64_t)a3
{
  self->_score = a3;
}

- (NSString)formattedScore
{
  return self->_formattedScore;
}

- (void)setFormattedScore:(id)a3
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

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)baseLeaderboardID
{
  return self->_baseLeaderboardID;
}

- (void)setBaseLeaderboardID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLeaderboardID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_formattedScore, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end