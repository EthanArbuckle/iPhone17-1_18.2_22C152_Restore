@interface GKMatchedPlayers
- (GKMatchedPlayers)initWithMatch:(id)a3 players:(id)a4;
- (NSArray)players;
- (NSDictionary)playerProperties;
- (NSDictionary)properties;
- (id)description;
@end

@implementation GKMatchedPlayers

- (GKMatchedPlayers)initWithMatch:(id)a3 players:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GKMatchedPlayers;
  v8 = [(GKMatchedPlayers *)&v16 init];
  if (v8)
  {
    v9 = [v6 properties];
    if ([v9 count])
    {
      uint64_t v10 = [v6 properties];
      properties = v8->_properties;
      v8->_properties = (NSDictionary *)v10;
    }
    else
    {
      properties = v8->_properties;
      v8->_properties = 0;
    }

    objc_storeStrong((id *)&v8->_players, a4);
    v12 = [v6 playerProperties];
    if ([v12 count])
    {
      uint64_t v13 = [v6 playerProperties];
      playerProperties = v8->_playerProperties;
      v8->_playerProperties = (NSDictionary *)v13;
    }
    else
    {
      playerProperties = v8->_playerProperties;
      v8->_playerProperties = 0;
    }
  }
  return v8;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(GKMatchedPlayers *)self properties];
  [v3 appendFormat:@"<%@ %p properties:%@, players[properties]:\n", v5, self, v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(GKMatchedPlayers *)self players];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v12 description];
        v14 = [(GKMatchedPlayers *)self playerProperties];
        v15 = [v14 objectForKeyedSubscript:v12];
        [v3 appendFormat:@"    %@[%@]", v13, v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSArray)players
{
  return self->_players;
}

- (NSDictionary)playerProperties
{
  return self->_playerProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerProperties, 0);
  objc_storeStrong((id *)&self->_players, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end