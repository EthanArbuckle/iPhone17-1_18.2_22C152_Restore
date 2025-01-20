@interface GKGameSession
+ (BOOL)supportsSecureCoding;
+ (void)createSessionInContainer:(NSString *)containerName withTitle:(NSString *)title maxConnectedPlayers:(NSInteger)maxPlayers completionHandler:(void *)completionHandler;
+ (void)loadSessionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler;
+ (void)loadSessionsInContainer:(NSString *)containerName completionHandler:(void *)completionHandler;
+ (void)removeSessionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler;
- (GKCloudPlayer)lastModifiedPlayer;
- (GKCloudPlayer)owner;
- (GKGameSession)initWithCoder:(id)a3;
- (NSArray)badgedPlayers;
- (NSArray)players;
- (NSArray)playersWithConnectionState:(GKConnectionState)state;
- (NSDate)lastModifiedDate;
- (NSInteger)maxNumberOfConnectedPlayers;
- (NSMutableDictionary)playerStates;
- (NSString)identifier;
- (NSString)serverChangeTag;
- (NSString)title;
- (void)clearBadgeForPlayers:(NSArray *)players completionHandler:(void *)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)getShareURLWithCompletionHandler:(void *)completionHandler;
- (void)loadDataWithCompletionHandler:(void *)completionHandler;
- (void)saveData:(NSData *)data completionHandler:(void *)completionHandler;
- (void)sendData:(NSData *)data withTransportType:(GKTransportType)transport completionHandler:(void *)completionHandler;
- (void)sendMessageWithLocalizedFormatKey:(NSString *)key arguments:(NSArray *)arguments data:(NSData *)data toPlayers:(NSArray *)players badgePlayers:(BOOL)badgePlayers completionHandler:(void *)completionHandler;
- (void)setConnectionState:(GKConnectionState)state completionHandler:(void *)completionHandler;
- (void)setIdentifier:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setLastModifiedPlayer:(id)a3;
- (void)setMaxNumberOfConnectedPlayers:(int64_t)a3;
- (void)setOwner:(id)a3;
- (void)setPlayerStates:(id)a3;
- (void)setPlayers:(id)a3;
- (void)setServerChangeTag:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GKGameSession

+ (void)createSessionInContainer:(NSString *)containerName withTitle:(NSString *)title maxConnectedPlayers:(NSInteger)maxPlayers completionHandler:(void *)completionHandler
{
  v6 = (void *)MEMORY[0x1E4F28C58];
  v7 = completionHandler;
  v8 = [v6 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v9 = GKOSLoggers();
  }
  v10 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v10, v11, v12, v13, v14, v15, v16, v17);
  }
  v7[2](v7, 0, v8);
}

+ (void)loadSessionsInContainer:(NSString *)containerName completionHandler:(void *)completionHandler
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = completionHandler;
  v6 = [v4 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  v8 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v5[2](v5, 0, v6);
}

+ (void)loadSessionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = completionHandler;
  v6 = [v4 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  v8 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v5[2](v5, 0, v6);
}

+ (void)removeSessionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = completionHandler;
  v6 = [v4 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  v8 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v5[2](v5, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGameSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GKGameSession;
  v5 = [(GKGameSession *)&v26 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(GKGameSession *)v5 setIdentifier:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(GKGameSession *)v5 setTitle:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owner"];
    [(GKGameSession *)v5 setOwner:v8];

    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"players"];
    [(GKGameSession *)v5 setPlayers:v12];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedDate"];
    [(GKGameSession *)v5 setLastModifiedDate:v13];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedPlayer"];
    [(GKGameSession *)v5 setLastModifiedPlayer:v14];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverChangeTag"];
    [(GKGameSession *)v5 setServerChangeTag:v15];

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v23 = [v4 decodeObjectOfClasses:v22 forKey:@"playerStates"];
    [(GKGameSession *)v5 setPlayerStates:v23];

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxNumberOfConnectedPlayers"];
    -[GKGameSession setMaxNumberOfConnectedPlayers:](v5, "setMaxNumberOfConnectedPlayers:", [v24 integerValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GKGameSession *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(GKGameSession *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  id v7 = [(GKGameSession *)self owner];
  [v4 encodeObject:v7 forKey:@"owner"];

  v8 = [(GKGameSession *)self players];
  [v4 encodeObject:v8 forKey:@"players"];

  uint64_t v9 = [(GKGameSession *)self lastModifiedDate];
  [v4 encodeObject:v9 forKey:@"lastModifiedDate"];

  uint64_t v10 = [(GKGameSession *)self lastModifiedPlayer];
  [v4 encodeObject:v10 forKey:@"lastModifiedPlayer"];

  uint64_t v11 = [(GKGameSession *)self serverChangeTag];
  [v4 encodeObject:v11 forKey:@"serverChangeTag"];

  uint64_t v12 = [(GKGameSession *)self playerStates];
  [v4 encodeObject:v12 forKey:@"playerStates"];

  objc_msgSend(NSNumber, "numberWithInteger:", -[GKGameSession maxNumberOfConnectedPlayers](self, "maxNumberOfConnectedPlayers"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"maxNumberOfConnectedPlayers"];
}

- (void)getShareURLWithCompletionHandler:(void *)completionHandler
{
  v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = completionHandler;
  v5 = [v3 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v6 = GKOSLoggers();
  }
  id v7 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v4[2](v4, 0, v5);
}

- (void)loadDataWithCompletionHandler:(void *)completionHandler
{
  v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = completionHandler;
  v5 = [v3 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v6 = GKOSLoggers();
  }
  id v7 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v4[2](v4, 0, v5);
}

- (void)saveData:(NSData *)data completionHandler:(void *)completionHandler
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = completionHandler;
  id v6 = [v4 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  uint64_t v8 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v5[2](v5, 0, v6);
}

- (void)setConnectionState:(GKConnectionState)state completionHandler:(void *)completionHandler
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = completionHandler;
  id v6 = [v4 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  uint64_t v8 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v5[2](v5, v6);
}

- (NSArray)playersWithConnectionState:(GKConnectionState)state
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)sendData:(NSData *)data withTransportType:(GKTransportType)transport completionHandler:(void *)completionHandler
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = completionHandler;
  uint64_t v7 = [v5 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v9, v10, v11, v12, v13, v14, v15, v16);
  }
  v6[2](v6, v7);
}

- (void)sendMessageWithLocalizedFormatKey:(NSString *)key arguments:(NSArray *)arguments data:(NSData *)data toPlayers:(NSArray *)players badgePlayers:(BOOL)badgePlayers completionHandler:(void *)completionHandler
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = completionHandler;
  uint64_t v10 = [v8 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v11 = GKOSLoggers();
  }
  uint64_t v12 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
  }
  v9[2](v9, v10);
}

- (void)clearBadgeForPlayers:(NSArray *)players completionHandler:(void *)completionHandler
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = completionHandler;
  uint64_t v6 = [v4 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  id v8 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKGameSession createSessionInContainer:withTitle:maxConnectedPlayers:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v5[2](v5, v6);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (GKCloudPlayer)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (GKCloudPlayer)lastModifiedPlayer
{
  return self->_lastModifiedPlayer;
}

- (void)setLastModifiedPlayer:(id)a3
{
}

- (NSInteger)maxNumberOfConnectedPlayers
{
  return self->_maxNumberOfConnectedPlayers;
}

- (void)setMaxNumberOfConnectedPlayers:(int64_t)a3
{
  self->_maxNumberOfConnectedPlayers = a3;
}

- (NSArray)badgedPlayers
{
  return self->_badgedPlayers;
}

- (NSString)serverChangeTag
{
  return self->_serverChangeTag;
}

- (void)setServerChangeTag:(id)a3
{
}

- (NSMutableDictionary)playerStates
{
  return self->_playerStates;
}

- (void)setPlayerStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerStates, 0);
  objc_storeStrong((id *)&self->_serverChangeTag, 0);
  objc_storeStrong((id *)&self->_badgedPlayers, 0);
  objc_storeStrong((id *)&self->_lastModifiedPlayer, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)createSessionInContainer:(uint64_t)a3 withTitle:(uint64_t)a4 maxConnectedPlayers:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end