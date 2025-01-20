@interface GKGameRecordInternal
+ (id)gameRecordForGame:(id)a3;
+ (id)secureCodedPropertyKeys;
- (GKScoreInternal)score;
- (NSDate)lastPlayedDate;
- (NSDate)purchaseDate;
- (signed)achievementPoints;
- (unsigned)achievements;
- (unsigned)friendRank;
- (unsigned)maxFriendRank;
- (unsigned)maxRank;
- (unsigned)rank;
- (void)setAchievementPoints:(signed __int16)a3;
- (void)setAchievements:(unsigned __int16)a3;
- (void)setFriendRank:(unsigned __int16)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setMaxFriendRank:(unsigned __int16)a3;
- (void)setMaxRank:(unsigned int)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setRank:(unsigned int)a3;
- (void)setScore:(id)a3;
- (void)updateWithGame:(id)a3;
@end

@implementation GKGameRecordInternal

+ (id)gameRecordForGame:(id)a3
{
  id v3 = a3;
  v4 = +[GKInternalRepresentation internalRepresentation];
  [v4 updateWithGame:v3];

  return v4;
}

- (void)updateWithGame:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "secureCodedPropertyKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [v4 valueForKey:v10];
        [(GKGameRecordInternal *)self setValue:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__GKGameRecordInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_226_0 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_226_0, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_225_0;

  return v2;
}

void __47__GKGameRecordInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v7[9] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKGameRecordInternal;
  v1 = objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v6[0] = @"score";
  v7[0] = objc_opt_class();
  v6[1] = @"lastPlayedDate";
  v7[1] = objc_opt_class();
  v6[2] = @"purchaseDate";
  v7[2] = objc_opt_class();
  v6[3] = @"achievements";
  v7[3] = objc_opt_class();
  v6[4] = @"achievementPoints";
  v7[4] = objc_opt_class();
  v6[5] = @"friendRank";
  v7[5] = objc_opt_class();
  v6[6] = @"maxFriendRank";
  v7[6] = objc_opt_class();
  v6[7] = @"rank";
  v7[7] = objc_opt_class();
  v6[8] = @"maxRank";
  v7[8] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:9];
  [v2 addEntriesFromDictionary:v3];

  id v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_225_0;
  secureCodedPropertyKeys_sSecureCodedKeys_225_0 = (uint64_t)v2;
}

- (GKScoreInternal)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
}

- (unsigned)achievements
{
  return self->_achievements;
}

- (void)setAchievements:(unsigned __int16)a3
{
  self->_achievements = a3;
}

- (signed)achievementPoints
{
  return self->_achievementPoints;
}

- (void)setAchievementPoints:(signed __int16)a3
{
  self->_achievementPoints = a3;
}

- (unsigned)friendRank
{
  return self->_friendRank;
}

- (void)setFriendRank:(unsigned __int16)a3
{
  self->_friendRank = a3;
}

- (unsigned)maxFriendRank
{
  return self->_maxFriendRank;
}

- (void)setMaxFriendRank:(unsigned __int16)a3
{
  self->_maxFriendRank = a3;
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setRank:(unsigned int)a3
{
  self->_rank = a3;
}

- (unsigned)maxRank
{
  return self->_maxRank;
}

- (void)setMaxRank:(unsigned int)a3
{
  self->_maxRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);

  objc_storeStrong((id *)&self->_score, 0);
}

@end