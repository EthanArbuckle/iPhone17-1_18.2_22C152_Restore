@interface GKPlayerActivityRelationships
+ (id)secureCodedPropertyKeys;
- (GKPlayerActivityRelationships)initWithDictionary:(id)a3;
- (NSArray)achievements;
- (NSArray)games;
- (NSArray)leaderboards;
- (NSArray)players;
- (id)description;
- (void)setAchievements:(id)a3;
- (void)setGames:(id)a3;
- (void)setLeaderboards:(id)a3;
- (void)setPlayers:(id)a3;
@end

@implementation GKPlayerActivityRelationships

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_572 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_572, &__block_literal_global_574);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_571;

  return v2;
}

void __56__GKPlayerActivityRelationships_secureCodedPropertyKeys__block_invoke()
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"players";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v15[0] = v2;
  v14[1] = @"games";
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v15[1] = v5;
  v14[2] = @"leaderboards";
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v15[2] = v8;
  v14[3] = @"achievements";
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v15[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v13 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_571;
  secureCodedPropertyKeys_sSecureCodedKeys_571 = v12;
}

- (GKPlayerActivityRelationships)initWithDictionary:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)GKPlayerActivityRelationships;
  v5 = [(GKPlayerActivityRelationships *)&v59 init];
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"players"];
    v6 = v42 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v8 = v6;
    v5 = v42;
    id v9 = v8;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v56 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[GKPlayerActivityRelationshipPlayer alloc] initWithDictionary:*(void *)(*((void *)&v55 + 1) + 8 * i)];
          [v7 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v11);
    }
    v40 = v9;

    [(GKPlayerActivityRelationships *)v42 setPlayers:v7];
    v15 = [v4 objectForKeyedSubscript:@"games"];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [[GKPlayerActivityRelationshipGame alloc] initWithDictionary:*(void *)(*((void *)&v51 + 1) + 8 * j)];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v62 count:16];
      }
      while (v19);
    }

    [(GKPlayerActivityRelationships *)v42 setGames:v16];
    v23 = [v4 objectForKeyedSubscript:@"leaderboards"];

    id v41 = v4;
    if (v23)
    {
      v24 = [MEMORY[0x1E4F1CA48] array];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v25 = [v4 objectForKeyedSubscript:@"leaderboards"];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v61 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v48;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v48 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = [[GKPlayerActivityRelationshipLeaderboard alloc] initWithDictionary:*(void *)(*((void *)&v47 + 1) + 8 * k)];
            [v24 addObject:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v61 count:16];
        }
        while (v27);
      }

      v5 = v42;
      [(GKPlayerActivityRelationships *)v42 setLeaderboards:v24];

      id v4 = v41;
    }
    v31 = [v4 objectForKeyedSubscript:@"achievements"];

    if (v31)
    {
      v32 = [MEMORY[0x1E4F1CA48] array];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v33 = [v4 objectForKeyedSubscript:@"achievements"];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v60 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v44;
        do
        {
          for (uint64_t m = 0; m != v35; ++m)
          {
            if (*(void *)v44 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = [[GKPlayerActivityRelationshipAchievement alloc] initWithDictionary:*(void *)(*((void *)&v43 + 1) + 8 * m)];
            [v32 addObject:v38];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v43 objects:v60 count:16];
        }
        while (v35);
      }

      v5 = v42;
      [(GKPlayerActivityRelationships *)v42 setAchievements:v32];

      id v4 = v41;
    }
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(GKPlayerActivityRelationships *)self players];
  v5 = [(GKPlayerActivityRelationships *)self games];
  v6 = [(GKPlayerActivityRelationships *)self leaderboards];
  id v7 = [(GKPlayerActivityRelationships *)self achievements];
  id v8 = [v3 stringWithFormat:@"players: %@ \ngames: %@ \nleaderboard: %@ \nachievements: %@", v4, v5, v6, v7];

  return v8;
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (NSArray)games
{
  return self->_games;
}

- (void)setGames:(id)a3
{
}

- (NSArray)leaderboards
{
  return self->_leaderboards;
}

- (void)setLeaderboards:(id)a3
{
}

- (NSArray)achievements
{
  return self->_achievements;
}

- (void)setAchievements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievements, 0);
  objc_storeStrong((id *)&self->_leaderboards, 0);
  objc_storeStrong((id *)&self->_games, 0);

  objc_storeStrong((id *)&self->_players, 0);
}

@end