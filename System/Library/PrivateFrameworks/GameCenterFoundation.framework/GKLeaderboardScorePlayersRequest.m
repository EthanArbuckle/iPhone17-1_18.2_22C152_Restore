@interface GKLeaderboardScorePlayersRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GKLeaderboardScorePlayersRequest)initWithCoder:(id)a3;
- (NSArray)playerInternals;
- (void)encodeWithCoder:(id)a3;
- (void)setPlayerInternals:(id)a3;
@end

@implementation GKLeaderboardScorePlayersRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLeaderboardScorePlayersRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKLeaderboardScorePlayersRequest;
  v5 = [(GKLeaderboardScoreRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"playerInternals"];
    playerInternals = v5->_playerInternals;
    v5->_playerInternals = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKLeaderboardScorePlayersRequest;
  id v4 = a3;
  [(GKLeaderboardScoreRequest *)&v6 encodeWithCoder:v4];
  v5 = -[NSArray _gkMapWithBlock:](self->_playerInternals, "_gkMapWithBlock:", &__block_literal_global_24, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"playerInternals"];
}

uint64_t __52__GKLeaderboardScorePlayersRequest_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 minimalInternal];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardScorePlayersRequest;
  if ([(GKLeaderboardScoreRequest *)&v9 isEqual:v4])
  {
    v5 = v4;
    playerInternals = self->_playerInternals;
    BOOL v7 = playerInternals == (NSArray *)v5[8] || -[NSArray isEqual:](playerInternals, "isEqual:");
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSArray)playerInternals
{
  return self->_playerInternals;
}

- (void)setPlayerInternals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end