@interface GKPlayerActivityRelationshipLeaderboardScore
+ (id)secureCodedPropertyKeys;
- (BOOL)gained;
- (GKPlayerActivityRelationshipLeaderboardScore)initWithDictionary:(id)a3;
- (GKPlayerActivityRelationshipPlayer)player;
- (NSString)message;
- (NSString)score;
- (NSString)symbol;
- (id)description;
- (int64_t)rank;
- (void)setGained:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setScore:(id)a3;
- (void)setSymbol:(id)a3;
@end

@implementation GKPlayerActivityRelationshipLeaderboardScore

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_441 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_441, &__block_literal_global_443);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_440;

  return v2;
}

void __71__GKPlayerActivityRelationshipLeaderboardScore_secureCodedPropertyKeys__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"player";
  v3[0] = objc_opt_class();
  v2[1] = @"score";
  v3[1] = objc_opt_class();
  v2[2] = @"rank";
  v3[2] = objc_opt_class();
  v2[3] = @"message";
  v3[3] = objc_opt_class();
  v2[4] = @"gained";
  v3[4] = objc_opt_class();
  v2[5] = @"symbol";
  v3[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_440;
  secureCodedPropertyKeys_sSecureCodedKeys_440 = v0;
}

- (GKPlayerActivityRelationshipLeaderboardScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKPlayerActivityRelationshipLeaderboardScore;
  v5 = [(GKPlayerActivityRelationshipLeaderboardScore *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"description"];
    [(GKPlayerActivityRelationshipLeaderboardScore *)v5 setScore:v6];

    v7 = [GKPlayerActivityRelationshipPlayer alloc];
    v8 = [v4 objectForKeyedSubscript:@"player"];
    v9 = [(GKPlayerActivityRelationshipPlayer *)v7 initWithDictionary:v8];
    [(GKPlayerActivityRelationshipLeaderboardScore *)v5 setPlayer:v9];

    v10 = [v4 objectForKeyedSubscript:@"rank"];
    -[GKPlayerActivityRelationshipLeaderboardScore setRank:](v5, "setRank:", [v10 integerValue]);

    v11 = [v4 objectForKeyedSubscript:@"message"];
    [(GKPlayerActivityRelationshipLeaderboardScore *)v5 setMessage:v11];

    v12 = [v4 objectForKeyedSubscript:@"gained"];
    -[GKPlayerActivityRelationshipLeaderboardScore setGained:](v5, "setGained:", [v12 BOOLValue]);

    v13 = [v4 objectForKeyedSubscript:@"symbol"];
    [(GKPlayerActivityRelationshipLeaderboardScore *)v5 setSymbol:v13];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(GKPlayerActivityRelationshipLeaderboardScore *)self score];
  v5 = [(GKPlayerActivityRelationshipLeaderboardScore *)self player];
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKPlayerActivityRelationshipLeaderboardScore rank](self, "rank"));
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[GKPlayerActivityRelationshipLeaderboardScore gained](self, "gained"));
  v8 = [(GKPlayerActivityRelationshipLeaderboardScore *)self message];
  v9 = [(GKPlayerActivityRelationshipLeaderboardScore *)self symbol];
  v10 = [v3 stringWithFormat:@"score: %@ \nplayer: %@ \nrank: %@ \ngained: %@ \n message: %@ \n symbol: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (GKPlayerActivityRelationshipPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSString)score
{
  return self->_score;
}

- (void)setScore:(id)a3
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

- (BOOL)gained
{
  return self->_gained;
}

- (void)setGained:(BOOL)a3
{
  self->_gained = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_score, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end