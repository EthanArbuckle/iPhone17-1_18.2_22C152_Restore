@interface GKLeaderboardScoreRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestForPlayerInternals:(id)a3;
+ (id)requestForRankRange:(_NSRange)a3;
- (BOOL)friendsOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrefetch;
- (GKLeaderboardScoreRequest)initWithCoder:(id)a3;
- (GKPlayerInternal)playerInternal;
- (NSString)gameBundleID;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (int64_t)timeScope;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFriendsOnly:(BOOL)a3;
- (void)setGameBundleID:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPlayerInternal:(id)a3;
- (void)setPrefetch:(BOOL)a3;
- (void)setTimeScope:(int64_t)a3;
@end

@implementation GKLeaderboardScoreRequest

+ (id)requestForRankRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = objc_alloc_init(GKLeaderboardScoreRangeRequest);
  -[GKLeaderboardScoreRangeRequest setRange:](v5, "setRange:", location, length);

  return v5;
}

+ (id)requestForPlayerInternals:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardScorePlayersRequest);
  [(GKLeaderboardScorePlayersRequest *)v4 setPlayerInternals:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLeaderboardScoreRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKLeaderboardScoreRequest;
  v5 = [(GKLeaderboardScoreRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerInternal"];
    playerInternal = v5->_playerInternal;
    v5->_playerInternal = (GKPlayerInternal *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gameBundleID"];
    gameBundleID = v5->_gameBundleID;
    v5->_gameBundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v12;

    v5->_timeScope = (int)[v4 decodeInt32ForKey:@"timeScope"];
    v5->_friendsOnly = [v4 decodeBoolForKey:@"friendsOnly"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  playerInternal = self->_playerInternal;
  id v6 = a3;
  v5 = [(GKPlayerInternal *)playerInternal minimalInternal];
  [v6 encodeObject:v5 forKey:@"playerInternal"];

  [v6 encodeObject:self->_gameBundleID forKey:@"gameBundleID"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  [v6 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
  [v6 encodeInt32:LODWORD(self->_timeScope) forKey:@"timeScope"];
  [v6 encodeBool:self->_friendsOnly forKey:@"friendsOnly"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSString *)self->_groupIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NSString **)v4;
    identifier = self->_identifier;
    BOOL v10 = (identifier == v5[3] || -[NSString isEqualToString:](identifier, "isEqualToString:"))
       && ((groupIdentifier = self->_groupIdentifier, groupIdentifier == v5[4])
        || -[NSString isEqualToString:](groupIdentifier, "isEqualToString:"))
       && ((playerInternal = self->_playerInternal, playerInternal == (GKPlayerInternal *)v5[1])
        || -[GKPlayerInternal isEqual:](playerInternal, "isEqual:"))
       && ((gameBundleID = self->_gameBundleID, gameBundleID == v5[2])
        || -[NSString isEqualToString:](gameBundleID, "isEqualToString:"))
       && (NSString *)self->_timeScope == v5[6]
       && self->_friendsOnly == *((unsigned __int8 *)v5 + 40);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (GKPlayerInternal)playerInternal
{
  return self->_playerInternal;
}

- (void)setPlayerInternal:(id)a3
{
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void)setGameBundleID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (BOOL)friendsOnly
{
  return self->_friendsOnly;
}

- (void)setFriendsOnly:(BOOL)a3
{
  self->_friendsOnly = a3;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (BOOL)isPrefetch
{
  return self->_prefetch;
}

- (void)setPrefetch:(BOOL)a3
{
  self->_prefetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_gameBundleID, 0);

  objc_storeStrong((id *)&self->_playerInternal, 0);
}

@end