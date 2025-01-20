@interface GKPlayerActivityRelationshipLeaderboard
+ (id)secureCodedPropertyKeys;
- (GKLeaderboardInternal)leaderboardInternal;
- (GKPlayerActivityRelationshipLeaderboard)initWithDictionary:(id)a3;
- (NSArray)scores;
- (id)description;
- (int64_t)leaderboardType;
- (void)setLeaderboardInternal:(id)a3;
- (void)setLeaderboardType:(int64_t)a3;
- (void)setScores:(id)a3;
@end

@implementation GKPlayerActivityRelationshipLeaderboard

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GKPlayerActivityRelationshipLeaderboard_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_527 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_527, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_526;

  return v2;
}

void __66__GKPlayerActivityRelationshipLeaderboard_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipLeaderboard;
  v1 = objc_msgSendSuper2(&v8, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v9[0] = @"scores";
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v9[1] = @"leaderboardInternal";
  v10[0] = v5;
  v10[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 addEntriesFromDictionary:v6];

  v7 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_526;
  secureCodedPropertyKeys_sSecureCodedKeys_526 = (uint64_t)v2;
}

- (GKPlayerActivityRelationshipLeaderboard)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)GKPlayerActivityRelationshipLeaderboard;
  v5 = [(GKPlayerActivityRelationshipBase *)&v32 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    if ([v6 isEqualToString:@"FRIENDS"]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    [(GKPlayerActivityRelationshipLeaderboard *)v5 setLeaderboardType:v7];

    objc_super v8 = [v4 objectForKeyedSubscript:@"scores"];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v16 = [GKPlayerActivityRelationshipLeaderboardScore alloc];
          v17 = -[GKPlayerActivityRelationshipLeaderboardScore initWithDictionary:](v16, "initWithDictionary:", v15, (void)v28);
          [v9 addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    [(GKPlayerActivityRelationshipLeaderboard *)v5 setScores:v9];
    v18 = objc_opt_new();
    v19 = [(GKPlayerActivityRelationshipBase *)v5 identifier];
    [v18 setBaseLeaderboardID:v19];

    v20 = [(GKPlayerActivityRelationshipBase *)v5 name];
    [v18 setTitle:v20];

    v21 = [v4 objectForKeyedSubscript:@"instance-id"];
    v22 = [v4 objectForKeyedSubscript:@"start-date"];
    uint64_t v23 = [v4 objectForKeyedSubscript:@"duration"];
    v24 = (void *)v23;
    if (v21 && v22 && v23)
    {
      [v18 setIdentifier:v21];
      [v18 setType:1];
      v25 = [MEMORY[0x1E4F1C9C8] _gkDateFromServerTimestamp:v22];
      [v18 setStartDate:v25];

      [v24 doubleValue];
      objc_msgSend(v18, "setDuration:");
    }
    else
    {
      v26 = [(GKPlayerActivityRelationshipBase *)v5 identifier];
      [v18 setIdentifier:v26];

      [v18 setType:0];
    }
    -[GKPlayerActivityRelationshipLeaderboard setLeaderboardInternal:](v5, "setLeaderboardInternal:", v18, (void)v28);
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerActivityRelationshipLeaderboard;
  id v4 = [(GKPlayerActivityRelationshipBase *)&v11 description];
  v5 = [(GKPlayerActivityRelationshipBase *)self name];
  v6 = [(GKPlayerActivityRelationshipBase *)self image];
  uint64_t v7 = [(GKPlayerActivityRelationshipLeaderboard *)self scores];
  objc_super v8 = [(GKPlayerActivityRelationshipLeaderboard *)self leaderboardInternal];
  id v9 = [v3 stringWithFormat:@"%@ \nname: %@ \nimage: %@, scores: %@, leaderboard: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (int64_t)leaderboardType
{
  return self->_leaderboardType;
}

- (void)setLeaderboardType:(int64_t)a3
{
  self->_leaderboardType = a3;
}

- (GKLeaderboardInternal)leaderboardInternal
{
  return self->_leaderboardInternal;
}

- (void)setLeaderboardInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardInternal, 0);

  objc_storeStrong((id *)&self->_scores, 0);
}

@end