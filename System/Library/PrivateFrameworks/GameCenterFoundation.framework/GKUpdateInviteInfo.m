@interface GKUpdateInviteInfo
+ (id)secureCodedPropertyKeys;
- (NSData)sessionToken;
- (NSDictionary)playerTokenMap;
- (NSNumber)transportVersionToUse;
- (NSSet)gameParticipants;
- (NSSet)lobbyParticipants;
- (NSString)matchID;
- (NSString)sessionID;
- (id)description;
- (void)mergeWithUpdate:(id)a3;
- (void)setGameParticipants:(id)a3;
- (void)setLobbyParticipants:(id)a3;
- (void)setMatchID:(id)a3;
- (void)setPlayerTokenMap:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setTransportVersionToUse:(id)a3;
@end

@implementation GKUpdateInviteInfo

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_204 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_204, &__block_literal_global_206);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_203;

  return v2;
}

void __45__GKUpdateInviteInfo_secureCodedPropertyKeys__block_invoke()
{
  v10[7] = *MEMORY[0x1E4F143B8];
  v9[0] = @"gameParticipants";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v10[0] = v2;
  v9[1] = @"lobbyParticipants";
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v10[1] = v5;
  v9[2] = @"playerTokenMap";
  v6 = +[GKServiceInterface plistClasses];
  v10[2] = v6;
  v9[3] = @"sessionID";
  v10[3] = objc_opt_class();
  v9[4] = @"sessionToken";
  v10[4] = objc_opt_class();
  v9[5] = @"matchID";
  v10[5] = objc_opt_class();
  v9[6] = @"transportVersionToUse";
  v10[6] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:7];
  v8 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_203;
  secureCodedPropertyKeys_sSecureCodedKeys_203 = v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(GKUpdateInviteInfo *)self sessionID];
  v5 = [(GKUpdateInviteInfo *)self matchID];
  v6 = [(GKUpdateInviteInfo *)self lobbyParticipants];
  uint64_t v7 = [(GKUpdateInviteInfo *)self gameParticipants];
  v8 = [v3 stringWithFormat:@"GKUpdateInviteInfo[sessionID: %@, matchID: %@]\nLobbyParticipants: %@\nGameParticipants:%@", v4, v5, v6, v7];

  return v8;
}

- (void)mergeWithUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(GKUpdateInviteInfo *)self sessionID];
  v6 = [v4 sessionID];
  char v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    v9 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      [(GKUpdateInviteInfo *)(uint64_t)self mergeWithUpdate:v9];
    }
    lobbyParticipants = self->_lobbyParticipants;
    v11 = lobbyParticipants;
    if (!lobbyParticipants)
    {
      v11 = [MEMORY[0x1E4F1CAD0] set];
    }
    v12 = [v4 lobbyParticipants];
    v13 = [v11 setByAddingObjectsFromSet:v12];
    v14 = self->_lobbyParticipants;
    self->_lobbyParticipants = v13;

    if (!lobbyParticipants) {
    gameParticipants = self->_gameParticipants;
    }
    v16 = gameParticipants;
    if (!gameParticipants)
    {
      v16 = [MEMORY[0x1E4F1CAD0] set];
    }
    v17 = [v4 gameParticipants];
    v18 = [v16 setByAddingObjectsFromSet:v17];
    v19 = self->_gameParticipants;
    self->_gameParticipants = v18;

    if (!gameParticipants) {
  }
    }
  else
  {
    if (!os_log_GKGeneral) {
      id v20 = GKOSLoggers();
    }
    v21 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKUpdateInviteInfo mergeWithUpdate:](v21);
    }
  }
}

- (NSSet)gameParticipants
{
  return self->_gameParticipants;
}

- (void)setGameParticipants:(id)a3
{
}

- (NSSet)lobbyParticipants
{
  return self->_lobbyParticipants;
}

- (void)setLobbyParticipants:(id)a3
{
}

- (NSDictionary)playerTokenMap
{
  return self->_playerTokenMap;
}

- (void)setPlayerTokenMap:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_playerTokenMap, 0);
  objc_storeStrong((id *)&self->_lobbyParticipants, 0);

  objc_storeStrong((id *)&self->_gameParticipants, 0);
}

- (void)mergeWithUpdate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "Merging invite updates for %@ with %@", (uint8_t *)&v3, 0x16u);
}

- (void)mergeWithUpdate:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "Should not update invite update info for different session ID.", v1, 2u);
}

@end