@interface GKVoiceChat
+ (BOOL)isVoIPAllowed;
- (BOOL)isActive;
- (GKViceroyVoiceChat)gkVoiceChat;
- (GKVoiceChat)initWithViceroyVoiceChat:(id)a3 players:(id)a4;
- (NSArray)playerIDs;
- (NSArray)players;
- (NSString)name;
- (float)volume;
- (void)playerIDs;
- (void)playerStateUpdateHandler;
- (void)playerVoiceChatStateDidChangeHandler;
- (void)setActive:(BOOL)active;
- (void)setGkVoiceChat:(id)a3;
- (void)setMute:(BOOL)isMuted forPlayer:(NSString *)playerID;
- (void)setPlayer:(GKPlayer *)player muted:(BOOL)isMuted;
- (void)setPlayerStateUpdateHandler:(void *)playerStateUpdateHandler;
- (void)setPlayerVoiceChatStateDidChangeHandler:(void *)playerVoiceChatStateDidChangeHandler;
- (void)setPlayers:(id)a3;
- (void)setVolume:(float)volume;
- (void)start;
- (void)stateUpdate:(int64_t)a3 forPlayerID:(id)a4;
- (void)stop;
@end

@implementation GKVoiceChat

- (GKVoiceChat)initWithViceroyVoiceChat:(id)a3 players:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKVoiceChat;
  v9 = [(GKVoiceChat *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gkVoiceChat, a3);
    [(GKViceroyVoiceChat *)v10->_gkVoiceChat setStateUpdateDelegate:v10];
    [v8 _gkValidatePlayersForReturnFromAPI];
    objc_storeStrong((id *)&v10->_players, a4);
  }
  v11 = +[GKReporter reporter];
  [v11 reportEvent:@"com.apple.GameKit.match" type:@"voiceChatInit"];

  v12 = +[GKAPIReporter reporter];
  [v12 recordVoiceChat];

  return v10;
}

- (void)start
{
  id v2 = [(GKVoiceChat *)self gkVoiceChat];
  [v2 start];
}

- (void)stop
{
  id v2 = [(GKVoiceChat *)self gkVoiceChat];
  [v2 stop];
}

- (void)setPlayer:(GKPlayer *)player muted:(BOOL)isMuted
{
  BOOL v4 = isMuted;
  v6 = player;
  id v9 = [(GKVoiceChat *)self gkVoiceChat];
  id v7 = [(GKPlayer *)v6 internal];

  id v8 = [v7 playerID];
  [v9 setMuted:v4 forPlayerID:v8];
}

- (void)setMute:(BOOL)isMuted forPlayer:(NSString *)playerID
{
  BOOL v4 = isMuted;
  v6 = playerID;
  id v7 = [(GKVoiceChat *)self gkVoiceChat];
  [v7 setMuted:v4 forPlayerID:v6];
}

- (NSString)name
{
  id v2 = [(GKVoiceChat *)self gkVoiceChat];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (void)setActive:(BOOL)active
{
  BOOL v3 = active;
  id v4 = [(GKVoiceChat *)self gkVoiceChat];
  [v4 setActive:v3];
}

- (BOOL)isActive
{
  id v2 = [(GKVoiceChat *)self gkVoiceChat];
  char v3 = [v2 isActive];

  return v3;
}

- (void)setVolume:(float)volume
{
  id v5 = [(GKVoiceChat *)self gkVoiceChat];
  *(float *)&double v4 = volume;
  [v5 setVolume:v4];
}

- (float)volume
{
  id v2 = [(GKVoiceChat *)self gkVoiceChat];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (void)stateUpdate:(int64_t)a3 forPlayerID:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(GKVoiceChat *)self playerVoiceChatStateDidChangeHandler];

  if (v7)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__0;
    v25 = __Block_byref_object_dispose__0;
    id v26 = 0;
    id v8 = [(GKVoiceChat *)self players];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __39__GKVoiceChat_stateUpdate_forPlayerID___block_invoke;
    v18 = &unk_1E646D6C8;
    id v9 = v6;
    id v19 = v9;
    v20 = &v21;
    [v8 enumerateObjectsUsingBlock:&v15];

    if (v22[5])
    {
      v10 = [(GKVoiceChat *)self playerVoiceChatStateDidChangeHandler];
      ((void (*)(NSObject *, uint64_t, int64_t))v10[2].isa)(v10, v22[5], a3);
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v13 = GKOSLoggers();
      }
      v10 = (id)os_log_GKMatch;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_super v14 = [(GKVoiceChat *)self players];
        *(_DWORD *)buf = 138412546;
        id v28 = v9;
        __int16 v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "cannot find player for participant %@ (%@)", buf, 0x16u);
      }
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v11 = [(GKVoiceChat *)self playerStateUpdateHandler];

    if (v11)
    {
      v12 = [(GKVoiceChat *)self playerStateUpdateHandler];
      ((void (**)(void, id, int64_t))v12)[2](v12, v6, a3);
    }
  }
}

void __39__GKVoiceChat_stateUpdate_forPlayerID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 internal];
  id v8 = [v7 playerID];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (BOOL)isVoIPAllowed
{
  if ((isVoIPAllowed_voipStatusIsCached & 1) == 0)
  {
    id v2 = (void *)MGCopyAnswer();
    float v3 = v2;
    if (v2) {
      isVoIPAllowed_voipIsAllowed = [v2 BOOLValue] ^ 1;
    }
    isVoIPAllowed_voipStatusIsCached = 1;
  }
  return isVoIPAllowed_voipIsAllowed;
}

- (NSArray)playerIDs
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    float v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKVoiceChat playerIDs](v4);
    }
    v8[0] = @"playerID is no longer available";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = [(GKVoiceChat *)self players];
    id v5 = [v6 _gkMapWithBlock:&__block_literal_global];
  }

  return (NSArray *)v5;
}

id __24__GKVoiceChat_playerIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 internal];
  id v3 = [v2 playerID];

  return v3;
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (void)playerStateUpdateHandler
{
  return self->_playerStateUpdateHandler;
}

- (void)setPlayerStateUpdateHandler:(void *)playerStateUpdateHandler
{
}

- (void)playerVoiceChatStateDidChangeHandler
{
  return self->_playerVoiceChatStateDidChangeHandler;
}

- (void)setPlayerVoiceChatStateDidChangeHandler:(void *)playerVoiceChatStateDidChangeHandler
{
}

- (GKViceroyVoiceChat)gkVoiceChat
{
  return self->_gkVoiceChat;
}

- (void)setGkVoiceChat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gkVoiceChat, 0);
  objc_storeStrong(&self->_playerVoiceChatStateDidChangeHandler, 0);
  objc_storeStrong(&self->_playerStateUpdateHandler, 0);

  objc_storeStrong((id *)&self->_players, 0);
}

- (void)playerIDs
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  id v2 = "-[GKVoiceChat playerIDs]";
  __int16 v3 = 2114;
  float v4 = @"14.0";
  __int16 v5 = 2114;
  id v6 = @"11.0";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

@end