@interface GKLeaderboardScore
+ (id)convertToGKScore:(id)a3;
- (GKPlayer)player;
- (NSInteger)value;
- (NSString)leaderboardID;
- (NSUInteger)context;
- (void)setContext:(NSUInteger)context;
- (void)setLeaderboardID:(NSString *)leaderboardID;
- (void)setPlayer:(GKPlayer *)player;
- (void)setValue:(NSInteger)value;
@end

@implementation GKLeaderboardScore

+ (id)convertToGKScore:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v10 player];

        if (v11)
        {
          v12 = [GKScore alloc];
          v13 = [v10 leaderboardID];
          v14 = [v10 player];
          v15 = [(GKScore *)v12 initWithLeaderboardIdentifier:v13 player:v14];
        }
        else
        {
          v15 = objc_alloc_init(GKScore);

          v13 = [v10 leaderboardID];
          [(GKScore *)v15 setLeaderboardIdentifier:v13];
        }
        v7 = v15;

        -[GKScore setValue:](v15, "setValue:", [v10 value]);
        -[GKScore setContext:](v15, "setContext:", [v10 context]);
        [v4 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v4;
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(GKPlayer *)player
{
}

- (NSInteger)value
{
  return self->_value;
}

- (void)setValue:(NSInteger)value
{
  self->_value = value;
}

- (NSUInteger)context
{
  return self->_context;
}

- (void)setContext:(NSUInteger)context
{
  self->_context = context;
}

- (NSString)leaderboardID
{
  return self->_leaderboardID;
}

- (void)setLeaderboardID:(NSString *)leaderboardID
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardID, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end