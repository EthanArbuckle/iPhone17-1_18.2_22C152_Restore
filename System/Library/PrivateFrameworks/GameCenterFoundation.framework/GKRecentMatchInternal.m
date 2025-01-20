@interface GKRecentMatchInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKGameRecordInternal)game;
- (GKPlayerInternal)player;
- (NSDate)date;
- (unint64_t)hash;
- (void)setDate:(id)a3;
- (void)setGame:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation GKRecentMatchInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_318 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_318, &__block_literal_global_320_0);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_317;

  return v2;
}

void __48__GKRecentMatchInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"player";
  v3[0] = objc_opt_class();
  v2[1] = @"game";
  v3[1] = objc_opt_class();
  v2[2] = @"date";
  v3[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_317;
  secureCodedPropertyKeys_sSecureCodedKeys_317 = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GKRecentMatchInternal *)self game];
    v7 = [(GKRecentMatchInternal *)self player];
    v8 = [(GKRecentMatchInternal *)self date];
    v9 = [v5 game];
    v10 = [v5 player];
    v11 = [v5 date];
    if ((v7 == v10 || [v7 isEqual:v10])
      && (v6 == v9 || [v6 isEqual:v9]))
    {
      if (v8 == v11) {
        char v12 = 1;
      }
      else {
        char v12 = [v8 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(GKRecentMatchInternal *)self player];
  uint64_t v4 = [v3 hash];

  id v5 = [(GKRecentMatchInternal *)self game];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(GKRecentMatchInternal *)self date];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (GKGameRecordInternal)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_game, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end