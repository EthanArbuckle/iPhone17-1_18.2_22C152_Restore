@interface GKScoreInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (BOOL)valueSet;
- (GKPlayerInternal)player;
- (GKScoreInternal)initWithCoder:(id)a3;
- (NSDate)date;
- (NSString)formattedValue;
- (NSString)groupLeaderboardIdentifier;
- (NSString)leaderboardIdentifier;
- (NSString)playerID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serverRepresentation;
- (int64_t)value;
- (unint64_t)context;
- (unint64_t)hash;
- (unsigned)rank;
- (void)setContext:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setFormattedValue:(id)a3;
- (void)setGroupLeaderboardIdentifier:(id)a3;
- (void)setLeaderboardIdentifier:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setRank:(unsigned int)a3;
- (void)setValue:(int64_t)a3;
- (void)setValueSet:(BOOL)a3;
@end

@implementation GKScoreInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
  self->_valueSet = 1;
}

- (GKScoreInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GKScoreInternal;
  v5 = [(GKScoreInternal *)&v26 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"player"];
    [(GKScoreInternal *)v5 setPlayer:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leaderboardIdentifier"];
    [(GKScoreInternal *)v5 setLeaderboardIdentifier:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupLeaderboardIdentifier"];
    [(GKScoreInternal *)v5 setGroupLeaderboardIdentifier:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerID"];
    if (v9)
    {
      v10 = +[GKInternalRepresentation internalRepresentation];
      [v10 setPlayerID:v9];
      [(GKScoreInternal *)v5 setPlayer:v10];
    }
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    if (v11) {
      [(GKScoreInternal *)v5 setCategory:v11];
    }
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupCategory"];

    if (v12) {
      [(GKScoreInternal *)v5 setGroupCategory:v12];
    }
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formattedValue"];
    [(GKScoreInternal *)v5 setFormattedValue:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    [(GKScoreInternal *)v5 setDate:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rank"];
    v16 = v15;
    if (v15) {
      uint64_t v17 = [v15 unsignedIntegerValue];
    }
    else {
      uint64_t v17 = [v4 decodeIntegerForKey:@"rank"];
    }
    [(GKScoreInternal *)v5 setRank:v17];
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    v19 = v18;
    if (v18) {
      uint64_t v20 = [v18 longLongValue];
    }
    else {
      uint64_t v20 = [v4 decodeInt64ForKey:@"value"];
    }
    [(GKScoreInternal *)v5 setValue:v20];
    if ([v4 containsValueForKey:@"valueSet"])
    {
      v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueSet"];
      -[GKScoreInternal setValueSet:](v5, "setValueSet:", [v21 BOOLValue]);
    }
    else
    {
      [(GKScoreInternal *)v5 setValueSet:1];
    }
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    v23 = v22;
    if (v22) {
      uint64_t v24 = [v22 longLongValue];
    }
    else {
      uint64_t v24 = [v4 decodeInt64ForKey:@"context"];
    }
    [(GKScoreInternal *)v5 setContext:v24];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    [v4 setPlayer:self->_player];
    [v5 setLeaderboardIdentifier:self->_leaderboardIdentifier];
    [v5 setGroupLeaderboardIdentifier:self->_groupLeaderboardIdentifier];
    [v5 setFormattedValue:self->_formattedValue];
    [v5 setDate:self->_date];
    [v5 setValue:self->_value];
    [v5 setContext:self->_context];
    [v5 setRank:self->_rank];
    [v5 setValueSet:self->_valueSet];
  }
  return v5;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_22 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_22, &__block_literal_global_62);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_22;

  return v2;
}

void __42__GKScoreInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"player";
  v3[0] = objc_opt_class();
  v2[1] = @"leaderboardIdentifier";
  v3[1] = objc_opt_class();
  v2[2] = @"groupLeaderboardIdentifier";
  v3[2] = objc_opt_class();
  v2[3] = @"formattedValue";
  v3[3] = objc_opt_class();
  v2[4] = @"date";
  v3[4] = objc_opt_class();
  v2[5] = @"value";
  v3[5] = objc_opt_class();
  v2[6] = @"context";
  v3[6] = objc_opt_class();
  v2[7] = @"rank";
  v3[7] = objc_opt_class();
  v2[8] = @"valueSet";
  v3[8] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_22;
  secureCodedPropertyKeys_sSecureCodedKeys_22 = v0;
}

- (id)serverRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[GKScoreInternal value](self, "value"));
  v5 = [(GKScoreInternal *)self leaderboardIdentifier];
  v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[GKScoreInternal context](self, "context"));
  v7 = [(GKScoreInternal *)self date];
  if (v7) {
    v8 = self;
  }
  else {
    v8 = (GKScoreInternal *)MEMORY[0x1E4F1C9C8];
  }
  v9 = [(GKScoreInternal *)v8 date];
  v10 = [v9 _gkServerTimestamp];
  v11 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, @"score-value", v5, @"category", v6, @"context", v10, @"timestamp", 0);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    unsigned int v7 = [(GKScoreInternal *)self rank];
    if (v7 != [v6 rank]
      || (int64_t v8 = -[GKScoreInternal value](self, "value"), v8 != [v6 value])
      || (unint64_t v9 = -[GKScoreInternal context](self, "context"), v9 != [v6 context]))
    {
      char v13 = 0;
LABEL_10:

      goto LABEL_11;
    }
    v10 = [(GKScoreInternal *)self date];
    v11 = [v6 date];
    if (v10 != v11)
    {
      v3 = [(GKScoreInternal *)self date];
      v12 = [v6 date];
      if (![v3 isEqual:v12])
      {
        char v13 = 0;
LABEL_20:

LABEL_21:
        goto LABEL_10;
      }
      v22 = v12;
    }
    v15 = [(GKScoreInternal *)self playerID];
    v16 = [v6 playerID];
    if ([v15 isEqualToString:v16])
    {
      uint64_t v17 = [(GKScoreInternal *)self leaderboardIdentifier];
      v18 = [v6 leaderboardIdentifier];
      if ([v17 isEqual:v18])
      {
        char v13 = 1;
      }
      else
      {
        uint64_t v20 = [(GKScoreInternal *)self groupLeaderboardIdentifier];
        [v6 groupLeaderboardIdentifier];
        v19 = v21 = v3;
        char v13 = [v20 isEqual:v19];

        v3 = v21;
      }
    }
    else
    {

      char v13 = 0;
    }
    v12 = v22;
    if (v10 == v11) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  char v13 = 0;
LABEL_11:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(GKScoreInternal *)self playerID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSString)leaderboardIdentifier
{
  return self->_leaderboardIdentifier;
}

- (void)setLeaderboardIdentifier:(id)a3
{
}

- (NSString)groupLeaderboardIdentifier
{
  return self->_groupLeaderboardIdentifier;
}

- (void)setGroupLeaderboardIdentifier:(id)a3
{
}

- (NSString)formattedValue
{
  return self->_formattedValue;
}

- (void)setFormattedValue:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (int64_t)value
{
  return self->_value;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setRank:(unsigned int)a3
{
  self->_rank = a3;
}

- (BOOL)valueSet
{
  return self->_valueSet;
}

- (void)setValueSet:(BOOL)a3
{
  self->_valueSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_formattedValue, 0);
  objc_storeStrong((id *)&self->_groupLeaderboardIdentifier, 0);
  objc_storeStrong((id *)&self->_leaderboardIdentifier, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

- (NSString)playerID
{
  v2 = [(GKScoreInternal *)self player];
  unint64_t v3 = [v2 playerID];

  return (NSString *)v3;
}

@end