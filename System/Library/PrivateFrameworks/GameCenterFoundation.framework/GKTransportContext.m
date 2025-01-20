@interface GKTransportContext
+ (id)secureCodedPropertyKeys;
+ (id)syncQueue;
- (BOOL)allowEarlyConnection;
- (BOOL)healthMonitorEnabled;
- (BOOL)inviteeShouldAwaitInviteUpdate;
- (BOOL)shouldDelayConnectionForMatchResponse:(id)a3;
- (BOOL)shouldFilterGuestWhenSendingToAll;
- (BOOL)shouldSendInviteUpdate;
- (BOOL)supportsTransportRequiredInTheInvite:(id)a3;
- (BOOL)supportsTransportVersion:(id)a3;
- (BOOL)validTransportSelected;
- (GKMultiplayerDaemonProxy)daemonProxy;
- (GKSupportedTransport)selectedTransport;
- (GKTransportContext)initWithLocalPlayerID:(id)a3 localPseudonym:(id)a4 sessionID:(id)a5;
- (GKTransportContext)initWithSupportedTransports:(id)a3;
- (GKTransportContext)initWithValidTransports:(id)a3 localPlayerID:(id)a4;
- (NSArray)peerDictionaries;
- (NSArray)representedPlayerIDs;
- (NSData)cdxTicket;
- (NSData)connectionData;
- (NSData)sessionToken;
- (NSDictionary)playerTokenMap;
- (NSNumber)defaultInviteVersionFromMinimumSupportedTransportVersion;
- (NSSet)gameParticipants;
- (NSSet)lobbyParticipants;
- (NSSet)playersAndPushTokens;
- (NSSet)supportedTransports;
- (NSString)localPlayerID;
- (NSString)matchID;
- (NSString)pseudonym;
- (NSString)sessionID;
- (id)defaultTransportWithForceEnabledTransports:(id)a3 forceDisabledTransports:(id)a4 andHealthMonitorEnabled:(BOOL)a5;
- (id)formAnInviteUpdate;
- (id)gameParticipantsServerRepresentationsWithSelfPseudonym:(id)a3;
- (id)supportedTransportVersions;
- (id)updatedParticipantsAfterRemoving:(id)a3 fromOldParticipants:(id)a4;
- (void)addGameParticipants:(id)a3;
- (void)addLobbyParticipants:(id)a3;
- (void)addTTRMultiplayerParticipant:(id)a3;
- (void)enrichConnectionDictionary:(id)a3 inviteResponse:(id)a4;
- (void)enrichServerRequest:(id)a3 andInviteResponse:(id)a4;
- (void)enrichServerRequest:(id)a3 withMatchRequest:(id)a4 selfPseudonym:(id)a5;
- (void)enrichServerRequestWithConnectionData:(id)a3;
- (void)performUpdateSync:(id)a3;
- (void)removeGameParticipantsIfExists:(id)a3;
- (void)removeLobbyParticipantsIfExists:(id)a3;
- (void)selectDefaultTransport;
- (void)selectTransportWith:(id)a3;
- (void)setHealthMonitorEnabled:(BOOL)a3;
- (void)setValidTransportSelected:(BOOL)a3;
- (void)updateAfterAcceptingRemoveInvite:(id)a3 acceptedResponse:(id)a4;
- (void)updateAfterInviteeAcceptedUserInfo:(id)a3;
- (void)updateForInviteAcceptWithConnectionData:(id)a3;
- (void)updateForInviteInitiationWithOnlineConnectionData:(id)a3;
- (void)updateForLegacyNearbyInvite;
- (void)updateForMatchRequestWithConnectionData:(id)a3;
- (void)updateForMatchResponse:(id)a3 serverHosted:(BOOL)a4;
- (void)updateWithForceEnabledTransports:(id)a3 forceDisabledTransports:(id)a4 andHealthMonitorEnabled:(BOOL)a5;
- (void)updateWithInfoFromTransport:(id)a3;
- (void)updateWithInviteInitiateResponse:(id)a3;
- (void)updateWithInviteUpdateInfo:(id)a3;
@end

@implementation GKTransportContext

- (GKTransportContext)initWithSupportedTransports:(id)a3
{
  id v4 = a3;
  if (+[GKEntitledContextProvider hasBooleanPublicGameCenterEntitlement])
  {
    v5 = [(GKTransportContext *)self initWithValidTransports:v4 localPlayerID:0];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA80] set];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__GKTransportContext_initWithSupportedTransports___block_invoke;
    v9[3] = &unk_1E6471110;
    id v10 = v6;
    id v7 = v6;
    [v4 enumerateObjectsUsingBlock:v9];
    v5 = [(GKTransportContext *)self initWithValidTransports:v7 localPlayerID:0];
  }
  return v5;
}

void __50__GKTransportContext_initWithSupportedTransports___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 version] == 2)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    v5 = os_log_GKFastSync;
    if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "Removing FastSync from supported transports since this game doesn't have Game Center entitlements.", v6, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (GKTransportContext)initWithValidTransports:(id)a3 localPlayerID:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GKTransportContext;
  id v10 = [(GKTransportContext *)&v17 init];
  if (v10)
  {
    v11 = v9;
    if (!v9)
    {
      id v4 = +[GKLocalPlayer local];
      v5 = [v4 internal];
      v11 = [v5 playerID];
    }
    objc_storeStrong((id *)&v10->_localPlayerID, v11);
    if (!v9)
    {
    }
    uint64_t v12 = [v8 copy];
    supportedTransports = v10->_supportedTransports;
    v10->_supportedTransports = (NSSet *)v12;

    v14 = objc_alloc_init(GKMultiplayerDaemonProxyHelper);
    daemonProxy = v10->_daemonProxy;
    v10->_daemonProxy = (GKMultiplayerDaemonProxy *)v14;
  }
  return v10;
}

- (GKTransportContext)initWithLocalPlayerID:(id)a3 localPseudonym:(id)a4 sessionID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [[GKSupportedTransport alloc] initWithVersionNumber:&unk_1F1E7EC78];
  v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  v14 = [(GKTransportContext *)self initWithValidTransports:v13 localPlayerID:v11];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_selectedTransport, v12);
    objc_storeStrong((id *)&v14->_sessionID, a5);
    objc_storeStrong((id *)&v14->_pseudonym, a4);
  }

  return v14;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_11 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_11, &__block_literal_global_44);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_11;

  return v2;
}

void __45__GKTransportContext_secureCodedPropertyKeys__block_invoke()
{
  v17[14] = *MEMORY[0x1E4F143B8];
  v16[0] = @"cdxTicket";
  v17[0] = objc_opt_class();
  v16[1] = @"matchID";
  v17[1] = objc_opt_class();
  v16[2] = @"connectionData";
  v17[2] = objc_opt_class();
  v16[3] = @"sessionID";
  v17[3] = objc_opt_class();
  v16[4] = @"peerDictionaries";
  v0 = +[GKServiceInterface plistClasses];
  v17[4] = v0;
  v16[5] = @"pseudonym";
  v17[5] = objc_opt_class();
  v16[6] = @"localPlayerID";
  v17[6] = objc_opt_class();
  v16[7] = @"selectedTransport";
  v17[7] = objc_opt_class();
  v16[8] = @"sessionToken";
  v17[8] = objc_opt_class();
  v16[9] = @"gameParticipants";
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  id v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v17[9] = v3;
  v16[10] = @"lobbyParticipants";
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v17[10] = v6;
  v16[11] = @"playerTokenMap";
  id v7 = +[GKServiceInterface plistClasses];
  v17[11] = v7;
  v16[12] = @"supportedTransports";
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v17[12] = v10;
  v16[13] = @"playersAndPushTokens";
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v17[13] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:14];

  v15 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_11;
  secureCodedPropertyKeys_sSecureCodedKeys_11 = v14;
}

+ (id)syncQueue
{
  if (syncQueue_onceToken_1 != -1) {
    dispatch_once(&syncQueue_onceToken_1, &__block_literal_global_61_0);
  }
  uint64_t v2 = (void *)syncQueue_sSyncQueue_1;

  return v2;
}

void __31__GKTransportContext_syncQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.GameKit.transportContext.updateQueue", v2);
  v1 = (void *)syncQueue_sSyncQueue_1;
  syncQueue_sSyncQueue_1 = (uint64_t)v0;
}

- (void)performUpdateSync:(id)a3
{
  dispatch_block_t block = a3;
  id v3 = [(id)objc_opt_class() syncQueue];
  id v4 = dispatch_get_current_queue();

  if (v4 == v3)
  {
    uint64_t v5 = NSString;
    label = dispatch_queue_get_label(v3);
    id v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v8 = [v5 stringWithFormat:@"%s invoked on the same queue(\"%s\", would deadlock at %@"), "-[GKTransportContext performUpdateSync:]", label, v7];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/Transport/GKTransportContext.m"];
    id v10 = [v9 lastPathComponent];
    id v11 = [v5 stringWithFormat:@"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]", v8, "-[GKTransportContext performUpdateSync:]", objc_msgSend(v10, "UTF8String"), 116];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
  }
  dispatch_sync(v3, block);
}

- (BOOL)allowEarlyConnection
{
  uint64_t v2 = [(GKTransportContext *)self selectedTransport];
  BOOL v3 = [v2 version] == 2;

  return v3;
}

- (BOOL)inviteeShouldAwaitInviteUpdate
{
  uint64_t v2 = [(GKTransportContext *)self selectedTransport];
  BOOL v3 = [v2 version] == 2;

  return v3;
}

- (BOOL)shouldFilterGuestWhenSendingToAll
{
  uint64_t v2 = [(GKTransportContext *)self selectedTransport];
  BOOL v3 = [v2 version] != 2;

  return v3;
}

- (BOOL)shouldDelayConnectionForMatchResponse:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GKTransportContext *)self selectedTransport];
  uint64_t v6 = [v5 version];

  if (v6 == 2)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    id v8 = [(GKTransportContext *)self pseudonym];

    if (v8)
    {
      v31 = self;
      uint64_t v9 = [(GKTransportContext *)self pseudonym];
      [v7 addObject:v9];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v32 = v4;
      id v10 = [v4 matches];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v16 = [v15 objectForKey:@"client-data"];
            uint64_t v17 = [v16 objectForKey:@"ps"];
            if (!v17)
            {
              if (!os_log_GKGeneral) {
                id v26 = GKOSLoggers();
              }
              v27 = os_log_GKMatch;
              id v4 = v32;
              if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
                -[GKTransportContext shouldDelayConnectionForMatchResponse:]((uint64_t)v15, v27);
              }

              goto LABEL_26;
            }
            v18 = (void *)v17;
            [v7 addObject:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      v19 = [v7 allObjects];
      v20 = [v19 sortedArrayUsingComparator:&__block_literal_global_80_0];

      if (!os_log_GKGeneral) {
        id v21 = GKOSLoggers();
      }
      v22 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        [(GKTransportContext *)(uint64_t)v20 shouldDelayConnectionForMatchResponse:v31];
      }
      v23 = [(GKTransportContext *)v31 pseudonym];
      v24 = [v20 firstObject];
      int v25 = [v23 isEqualToString:v24] ^ 1;

      id v4 = v32;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v28 = GKOSLoggers();
      }
      v29 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        -[GKTransportContext shouldDelayConnectionForMatchResponse:](v29);
      }
LABEL_26:
      LOBYTE(v25) = 0;
    }
  }
  else
  {
    LOBYTE(v25) = 0;
  }

  return v25;
}

uint64_t __60__GKTransportContext_shouldDelayConnectionForMatchResponse___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

- (BOOL)validTransportSelected
{
  BOOL v3 = [(GKTransportContext *)self selectedTransport];
  if (v3)
  {
    id v4 = [(GKTransportContext *)self selectedTransport];
    BOOL v5 = [v4 version] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)supportedTransportVersions
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKTransportContext *)self selectedTransport];
  if (v3
    && (id v4 = (void *)v3,
        [(GKTransportContext *)self selectedTransport],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 version],
        v5,
        v4,
        v6))
  {
    id v7 = NSNumber;
    id v8 = [(GKTransportContext *)self selectedTransport];
    uint64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "version"));
    v16[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = [(GKTransportContext *)self supportedTransports];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__GKTransportContext_supportedTransportVersions__block_invoke;
    v14[3] = &unk_1E6471110;
    id v10 = v11;
    id v15 = v10;
    [v12 enumerateObjectsUsingBlock:v14];

    id v8 = v15;
  }

  return v10;
}

void __48__GKTransportContext_supportedTransportVersions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "version"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (NSNumber)defaultInviteVersionFromMinimumSupportedTransportVersion
{
  uint64_t v2 = [(GKTransportContext *)self supportedTransportVersions];
  id v3 = [v2 valueForKeyPath:@"@min.self"];

  return (NSNumber *)v3;
}

- (BOOL)supportsTransportRequiredInTheInvite:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 transportVersionToUse];
  uint64_t v6 = [v5 integerValue];

  if (v6)
  {
    id v7 = [(GKTransportContext *)self supportedTransports];
    id v8 = [v7 allObjects];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__GKTransportContext_supportsTransportRequiredInTheInvite___block_invoke;
    v12[3] = &unk_1E6471158;
    id v13 = v4;
    uint64_t v9 = [v8 _gkFilterWithBlock:v12];

    BOOL v10 = [v9 count] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

id __59__GKTransportContext_supportsTransportRequiredInTheInvite___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 version];
  BOOL v5 = [*(id *)(a1 + 32) transportVersionToUse];
  if (v4 == [v5 integerValue]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)selectTransportWith:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(GKTransportContext *)self selectedTransport];

  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKTransportContext selectTransportWith:](v8, self);
    }
  }
  else if ([v5 version])
  {
    uint64_t v9 = +[GKPreferences shared];
    int v10 = [v9 fastSyncTransportEnabled];

    if (v10) {
      objc_storeStrong((id *)&self->_selectedTransport, a3);
    }
    else {
      [(GKTransportContext *)self selectDefaultTransport];
    }
    if (!os_log_GKGeneral) {
      id v13 = GKOSLoggers();
    }
    uint64_t v14 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      selectedTransport = self->_selectedTransport;
      *(_DWORD *)buf = 138412546;
      id v21 = selectedTransport;
      __int16 v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "Transport has been selected as: %@ for context: %@", buf, 0x16u);
    }
    v16 = [(GKTransportContext *)self daemonProxy];
    uint64_t v17 = NSString;
    v18 = [(GKSupportedTransport *)self->_selectedTransport name];
    v19 = [v17 stringWithFormat:@"Transport Selected: %@", v18];
    [v16 emitMultiplayerMessage:v19];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    uint64_t v12 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKTransportContext selectTransportWith:](v12);
    }
  }
}

- (void)selectDefaultTransport
{
  id v6 = [MEMORY[0x1E4F1C978] array];
  id v3 = [MEMORY[0x1E4F1C978] array];
  uint64_t v4 = [(GKTransportContext *)self defaultTransportWithForceEnabledTransports:v6 forceDisabledTransports:v3 andHealthMonitorEnabled:0];
  selectedTransport = self->_selectedTransport;
  self->_selectedTransport = v4;
}

- (void)updateForLegacyNearbyInvite
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__GKTransportContext_updateForLegacyNearbyInvite__block_invoke;
  v2[3] = &unk_1E646D7F0;
  v2[4] = self;
  [(GKTransportContext *)self performUpdateSync:v2];
}

void __49__GKTransportContext_updateForLegacyNearbyInvite__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) validTransportSelected])
  {
    uint64_t v2 = [*(id *)(a1 + 32) selectedTransport];
    uint64_t v3 = [v2 version];

    if (v3 == 2)
    {
      if (!os_log_GKGeneral) {
        id v4 = GKOSLoggers();
      }
      id v5 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        __49__GKTransportContext_updateForLegacyNearbyInvite__block_invoke_cold_1(v5);
      }
    }
  }
  else
  {
    id v6 = [[GKSupportedTransport alloc] initWithVersionNumber:&unk_1F1E7EC90];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 32);
    *(void *)(v7 + 32) = v6;
    MEMORY[0x1F41817F8](v6, v8);
  }
}

- (void)updateForInviteInitiationWithOnlineConnectionData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__GKTransportContext_updateForInviteInitiationWithOnlineConnectionData___block_invoke;
  v6[3] = &unk_1E646EC80;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(GKTransportContext *)self performUpdateSync:v6];
}

void __72__GKTransportContext_updateForInviteInitiationWithOnlineConnectionData___block_invoke(uint64_t a1)
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __72__GKTransportContext_updateForInviteInitiationWithOnlineConnectionData___block_invoke_cold_1();
  }
  id v4 = [*(id *)(a1 + 40) sessionID];
  id v5 = v4;
  if (!v4)
  {
    v1 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v1 UUIDString];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 96), v5);
  if (!v4)
  {
  }
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = (id *)(*(void *)(a1 + 40) + 64);
    objc_storeStrong(v7, v6);
  }
}

- (void)updateWithInviteInitiateResponse:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__GKTransportContext_updateWithInviteInitiateResponse___block_invoke;
  v6[3] = &unk_1E646EC80;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(GKTransportContext *)self performUpdateSync:v6];
}

void __55__GKTransportContext_updateWithInviteInitiateResponse___block_invoke(uint64_t a1)
{
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __55__GKTransportContext_updateWithInviteInitiateResponse___block_invoke_cold_1();
  }
  id v3 = *(void **)(a1 + 40);
  id v4 = [GKSupportedTransport alloc];
  id v5 = [*(id *)(a1 + 32) transportVersionToUse];
  id v6 = [(GKSupportedTransport *)v4 initWithVersionNumber:v5];
  [v3 selectTransportWith:v6];

  uint64_t v7 = [*(id *)(a1 + 32) selfPseudonym];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v7;

  int v10 = [*(id *)(a1 + 32) playerTokenMap];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = [*(id *)(a1 + 40) playerTokenMap];
    id v13 = (void *)[v12 mutableCopy];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v16 = v15;

    uint64_t v17 = [*(id *)(a1 + 32) playerTokenMap];
    [v16 addEntriesFromDictionary:v17];

    uint64_t v18 = *(void *)(a1 + 40);
    v19 = *(void **)(v18 + 104);
    *(void *)(v18 + 104) = v16;
  }
  v20 = [GKTransportParticipant alloc];
  id v21 = +[GKLocalPlayer local];
  __int16 v22 = [v21 internal];
  v23 = [v22 playerID];
  uint64_t v24 = [*(id *)(a1 + 40) pseudonym];
  int v25 = [(GKTransportParticipant *)v20 initWithPlayerID:v23 pseudonym:v24];

  id v26 = *(void **)(a1 + 40);
  v27 = [MEMORY[0x1E4F1CAD0] setWithObject:v25];
  [v26 addLobbyParticipants:v27];

  id v28 = *(void **)(a1 + 40);
  v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v25];
  [v28 addGameParticipants:v29];
}

- (void)updateForInviteAcceptWithConnectionData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__GKTransportContext_updateForInviteAcceptWithConnectionData___block_invoke;
  v6[3] = &unk_1E646EC80;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(GKTransportContext *)self performUpdateSync:v6];
}

void __62__GKTransportContext_updateForInviteAcceptWithConnectionData___block_invoke(uint64_t a1)
{
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __62__GKTransportContext_updateForInviteAcceptWithConnectionData___block_invoke_cold_1();
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = (id *)(*(void *)(a1 + 40) + 64);

  objc_storeStrong(v4, v3);
}

- (void)updateAfterAcceptingRemoveInvite:(id)a3 acceptedResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__GKTransportContext_updateAfterAcceptingRemoveInvite_acceptedResponse___block_invoke;
  v10[3] = &unk_1E646F558;
  id v11 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(GKTransportContext *)self performUpdateSync:v10];
}

void __72__GKTransportContext_updateAfterAcceptingRemoveInvite_acceptedResponse___block_invoke(uint64_t a1)
{
  v69[6] = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __72__GKTransportContext_updateAfterAcceptingRemoveInvite_acceptedResponse___block_invoke_cold_1();
  }
  uint64_t v3 = [*(id *)(a1 + 40) selfPseudonym];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  uint64_t v6 = [*(id *)(a1 + 40) sessionID];
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(void **)(v7 + 96);
  *(void *)(v7 + 96) = v6;

  id v9 = [*(id *)(a1 + 40) matchID];

  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 40) matchID];
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = *(void **)(v11 + 88);
    *(void *)(v11 + 88) = v10;
  }
  id v13 = [*(id *)(a1 + 32) internal];
  uint64_t v14 = [v13 sessionToken];
  uint64_t v15 = *(void *)(a1 + 48);
  v16 = *(void **)(v15 + 80);
  *(void *)(v15 + 80) = v14;

  v68[0] = @"peer-id";
  v63 = [*(id *)(a1 + 32) internal];
  v62 = [v63 peerID];
  v69[0] = v62;
  v68[1] = @"peer-blob";
  v61 = [*(id *)(a1 + 32) internal];
  v60 = [v61 peerBlob];
  v69[1] = v60;
  v68[2] = @"peer-push-token";
  uint64_t v17 = [*(id *)(a1 + 32) internal];
  uint64_t v18 = [v17 peerPushToken];
  v69[2] = v18;
  v68[3] = @"peer-nat-type";
  v19 = NSNumber;
  v20 = [*(id *)(a1 + 32) internal];
  id v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "peerNATType"));
  v69[3] = v21;
  v68[4] = @"peer-nat-ip";
  __int16 v22 = [*(id *)(a1 + 32) internal];
  v23 = [v22 peerNATIP];
  v69[4] = v23;
  v68[5] = @"session-token";
  uint64_t v24 = [*(id *)(a1 + 32) internal];
  int v25 = [v24 sessionToken];
  v69[5] = v25;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:6];
  v64 = (void *)[v26 mutableCopy];

  v27 = [*(id *)(a1 + 32) internal];
  id v28 = [v27 transportVersionToUse];

  if (![v28 integerValue])
  {
    v29 = NSString;
    v30 = [NSString stringWithFormat:@"Found undefined transport version from invite: %@", *(void *)(a1 + 32)];
    v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/Transport/GKTransportContext.m"];
    id v32 = [v31 lastPathComponent];
    long long v33 = [v29 stringWithFormat:@"%@ (transportVersionToUse.integerValue != GKSupportedTransportVersionUndefined)\n[%s (%s:%d)]", v30, "-[GKTransportContext updateAfterAcceptingRemoveInvite:acceptedResponse:]_block_invoke", objc_msgSend(v32, "UTF8String"), 319];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v33 format];
  }
  long long v34 = [*(id *)(a1 + 32) internal];
  long long v35 = [v34 peerPseudonym];

  long long v36 = [*(id *)(a1 + 32) internal];
  v37 = [v36 sessionID];

  if ([v28 integerValue] == 2)
  {
    uint64_t v38 = *(void **)(a1 + 48);
    v39 = [[GKSupportedTransport alloc] initWithVersionNumber:v28];
    [v38 selectTransportWith:v39];

    v40 = v64;
    [v64 setObject:v37 forKeyedSubscript:@"sid"];
    [v64 setObject:v35 forKeyedSubscript:@"ps"];
    v41 = [*(id *)(a1 + 32) internal];
    v42 = [v41 lobbyParticipants];
    uint64_t v43 = [v42 count];

    if (v43)
    {
      v44 = *(void **)(a1 + 48);
      v45 = [*(id *)(a1 + 32) internal];
      v46 = [v45 lobbyParticipants];
      [v44 addLobbyParticipants:v46];
    }
    v47 = [*(id *)(a1 + 32) internal];
    v48 = [v47 gameParticipants];
    uint64_t v49 = [v48 count];

    if (v49)
    {
      v50 = *(void **)(a1 + 48);
      v51 = [*(id *)(a1 + 32) internal];
      v52 = [v51 gameParticipants];
      [v50 addGameParticipants:v52];

LABEL_20:
    }
  }
  else
  {
    v40 = v64;
    if ([v28 integerValue])
    {
      v53 = *(void **)(a1 + 48);
      v54 = [[GKSupportedTransport alloc] initWithVersionNumber:&unk_1F1E7EC90];
      [v53 selectTransportWith:v54];

      if (!os_log_GKGeneral) {
        id v55 = GKOSLoggers();
      }
      v56 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        uint64_t v57 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v67 = v57;
        _os_log_impl(&dword_1C2D22000, v56, OS_LOG_TYPE_INFO, "Cannot find transportVersionToUse from response, so it must be coming from older devices than Dawn. Response: %@", buf, 0xCu);
      }
      v65 = v64;
      uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
      uint64_t v59 = *(void *)(a1 + 48);
      v51 = *(void **)(v59 + 72);
      *(void *)(v59 + 72) = v58;
      goto LABEL_20;
    }
  }
}

- (void)updateAfterInviteeAcceptedUserInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__GKTransportContext_updateAfterInviteeAcceptedUserInfo___block_invoke;
  v6[3] = &unk_1E646EC80;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(GKTransportContext *)self performUpdateSync:v6];
}

void __57__GKTransportContext_updateAfterInviteeAcceptedUserInfo___block_invoke(uint64_t a1)
{
  v39[6] = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __57__GKTransportContext_updateAfterInviteeAcceptedUserInfo___block_invoke_cold_1();
  }
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"peer-id"];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"peer-push-token"];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"pps"];
  v39[0] = v3;
  v38[0] = @"peer-id";
  v38[1] = @"peer-blob";
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v39[1] = v6;
  v39[2] = v4;
  v38[2] = @"peer-push-token";
  v38[3] = @"peer-nat-type";
  id v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v39[3] = v7;
  v38[4] = @"peer-nat-ip";
  id v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v39[4] = v8;
  v38[5] = @"session-token";
  id v9 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v39[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:6];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (v5) {
    [v11 setObject:v5 forKeyedSubscript:@"ps"];
  }
  uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"session-token"];
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void **)(v13 + 80);
  *(void *)(v13 + 80) = v12;

  v37 = v11;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void **)(v16 + 72);
  *(void *)(v16 + 72) = v15;

  uint64_t v18 = [*(id *)(a1 + 40) playerTokenMap];
  v19 = (void *)[v18 mutableCopy];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  __int16 v22 = v21;

  v23 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
  [v22 setObject:v23 forKeyedSubscript:v3];

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 104), v22);
  if (v3 && v5)
  {
    uint64_t v24 = [[GKTransportParticipant alloc] initWithPlayerID:v3 pseudonym:v5];
    int v25 = *(void **)(a1 + 40);
    id v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v24];
    [v25 addLobbyParticipants:v26];

    v27 = *(void **)(a1 + 40);
    id v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v24];
    [v27 addGameParticipants:v28];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v29 = GKOSLoggers();
    }
    v30 = os_log_GKFastSync;
    if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
    {
      int v33 = 138412546;
      long long v34 = v3;
      __int16 v35 = 2112;
      long long v36 = v5;
      _os_log_impl(&dword_1C2D22000, v30, OS_LOG_TYPE_INFO, "UpdateAfterInviteeAcceptedUserInfo cannot init participant. playerID(%@) or pseudonym(%@) is nil.", (uint8_t *)&v33, 0x16u);
    }
  }
  if (v3 && v4)
  {
    v31 = *(void **)(a1 + 40);
    id v32 = [[GKTTRMultiplayerParticipant alloc] initWithPlayerID:v3 pushToken:v4];
    [v31 addTTRMultiplayerParticipant:v32];
  }
}

- (void)updateForMatchRequestWithConnectionData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__GKTransportContext_updateForMatchRequestWithConnectionData___block_invoke;
  v6[3] = &unk_1E646EC80;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(GKTransportContext *)self performUpdateSync:v6];
}

void __62__GKTransportContext_updateForMatchRequestWithConnectionData___block_invoke(uint64_t a1)
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __62__GKTransportContext_updateForMatchRequestWithConnectionData___block_invoke_cold_1();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 64), *(id *)(a1 + 32));
  id v4 = [*(id *)(a1 + 40) sessionID];
  id v5 = v4;
  if (!v4)
  {
    v1 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v1 UUIDString];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 96), v5);
  if (!v4)
  {
  }
}

- (void)updateForMatchResponse:(id)a3 serverHosted:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__GKTransportContext_updateForMatchResponse_serverHosted___block_invoke;
  v8[3] = &unk_1E6470E80;
  BOOL v11 = a4;
  id v9 = v6;
  uint64_t v10 = self;
  id v7 = v6;
  [(GKTransportContext *)self performUpdateSync:v8];
}

void __58__GKTransportContext_updateForMatchResponse_serverHosted___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __58__GKTransportContext_updateForMatchResponse_serverHosted___block_invoke_cold_1(a1, v3);
  }
  uint64_t v4 = [*(id *)(a1 + 32) cdxTicket];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  uint64_t v7 = [*(id *)(a1 + 32) sessionToken];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v8 + 80);
  *(void *)(v8 + 80) = v7;

  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v10 = [*(id *)(a1 + 32) selfPseudonym];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = [GKSupportedTransport alloc];
    uint64_t v15 = [*(id *)(a1 + 32) transportVersionToUse];
    uint64_t v16 = [(GKSupportedTransport *)v14 initWithVersionNumber:v15];
    [v13 selectTransportWith:v16];

    uint64_t v17 = [*(id *)(a1 + 32) matchID];
    uint64_t v18 = *(void *)(a1 + 40);
    v19 = *(void **)(v18 + 88);
    *(void *)(v18 + 88) = v17;

    uint64_t v59 = [MEMORY[0x1E4F1CA48] array];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = [*(id *)(a1 + 32) matches];
    uint64_t v20 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (!v20) {
      goto LABEL_42;
    }
    uint64_t v22 = v20;
    uint64_t v60 = *(void *)v63;
    *(void *)&long long v21 = 138413058;
    long long v55 = v21;
    uint64_t v58 = a1;
    while (1)
    {
      uint64_t v23 = 0;
      uint64_t v56 = v22;
      do
      {
        if (*(void *)v63 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v62 + 1) + 8 * v23);
        int v25 = objc_msgSend(v24, "objectForKey:", @"client-data", v55);
        id v26 = [MEMORY[0x1E4F1CA60] dictionary];
        v27 = [v24 objectForKey:@"player-id"];
        uint64_t v28 = [v25 objectForKey:@"push-token"];
        id v29 = (void *)v28;
        if (v27)
        {
          [v26 setObject:v27 forKey:@"peer-id"];
          if (v29)
          {
            [v26 setObject:v29 forKey:@"peer-push-token"];
            v30 = *(void **)(a1 + 40);
            v31 = [[GKTTRMultiplayerParticipant alloc] initWithPlayerID:v27 pushToken:v29];
            [v30 addTTRMultiplayerParticipant:v31];
          }
        }
        else if (v28)
        {
          [v26 setObject:v28 forKey:@"peer-push-token"];
        }
        v61 = v29;
        id v32 = [v25 objectForKey:@"conn-blob"];
        if (v32) {
          [v26 setObject:v32 forKey:@"peer-blob"];
        }
        int v33 = [v25 objectForKey:@"nat-type"];

        if (v33) {
          [v26 setObject:v33 forKey:@"peer-nat-type"];
        }
        long long v34 = [v25 objectForKey:@"nat-ip"];

        if (v34) {
          [v26 setObject:v34 forKey:@"peer-nat-ip"];
        }
        __int16 v35 = [*(id *)(a1 + 32) sessionToken];

        if (v35)
        {
          long long v36 = [*(id *)(a1 + 32) sessionToken];
          [v26 setObject:v36 forKey:@"session-token"];
        }
        if (![v26 count]) {
          [v26 setObject:MEMORY[0x1E4F1CC38] forKey:@"missing-client-data"];
        }
        uint64_t v37 = [v24 objectForKey:@"num-players"];
        uint64_t v38 = (void *)v37;
        if (v37) {
          v39 = (void *)v37;
        }
        else {
          v39 = &unk_1F1E7ECA8;
        }
        [v26 setObject:v39 forKey:@"num-players"];
        v40 = [*(id *)(a1 + 32) transportVersionToUse];
        uint64_t v41 = [v40 integerValue];

        if (v41 != 2) {
          goto LABEL_34;
        }
        [v26 setObject:&unk_1F1E7EC78 forKey:@"stv"];
        v42 = [v25 objectForKey:@"sid"];
        uint64_t v43 = [v25 objectForKey:@"ps"];
        v44 = (void *)v43;
        if (v27 && v42 && v43)
        {
          [v26 setObject:v42 forKey:@"sid"];
          [v26 setObject:v44 forKey:@"ps"];
          v45 = *(void **)(v58 + 40);
          v46 = +[GKTransportParticipant participantsFrom:v25 withKey:@"gp"];
          v47 = v45;
          a1 = v58;
          [v47 addGameParticipants:v46];

          uint64_t v22 = v56;
LABEL_34:
          [v59 addObject:v26];
          goto LABEL_40;
        }
        if (!os_log_GKGeneral) {
          id v48 = GKOSLoggers();
        }
        uint64_t v49 = (void *)os_log_GKFastSync;
        if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
        {
          v50 = *(void **)(v58 + 40);
          v51 = v49;
          v52 = [v50 gameParticipants];
          *(_DWORD *)buf = v55;
          uint64_t v67 = v27;
          __int16 v68 = 2112;
          v69 = v42;
          __int16 v70 = 2112;
          v71 = v44;
          __int16 v72 = 2112;
          v73 = v52;
          _os_log_impl(&dword_1C2D22000, v51, OS_LOG_TYPE_INFO, "Ignoring incomplete participant update for playerID: %@, sessionID: %@, pseudonym: %@, current gameParticipants: %@", buf, 0x2Au);

          a1 = v58;
        }

        uint64_t v22 = v56;
LABEL_40:

        ++v23;
      }
      while (v22 != v23);
      uint64_t v22 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
      if (!v22)
      {
LABEL_42:

        uint64_t v53 = *(void *)(a1 + 40);
        v54 = *(void **)(v53 + 72);
        *(void *)(v53 + 72) = v59;

        return;
      }
    }
  }
}

- (void)updateWithInviteUpdateInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__GKTransportContext_updateWithInviteUpdateInfo___block_invoke;
  v6[3] = &unk_1E646EC80;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(GKTransportContext *)self performUpdateSync:v6];
}

void __49__GKTransportContext_updateWithInviteUpdateInfo___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v20 = 138412290;
    uint64_t v21 = v4;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "updateWithInviteUpdateInfo: %@", (uint8_t *)&v20, 0xCu);
  }
  id v5 = [*(id *)(a1 + 32) sessionID];
  id v6 = [*(id *)(a1 + 40) sessionID];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) lobbyParticipants];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = [*(id *)(a1 + 32) lobbyParticipants];
      [v10 addLobbyParticipants:v11];
    }
    uint64_t v12 = [*(id *)(a1 + 32) gameParticipants];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = [*(id *)(a1 + 32) gameParticipants];
      [v14 addGameParticipants:v15];
    }
    uint64_t v16 = [*(id *)(a1 + 32) matchID];

    if (v16)
    {
      uint64_t v17 = [*(id *)(a1 + 32) matchID];
      uint64_t v18 = *(void *)(a1 + 40);
      v19 = *(void **)(v18 + 88);
      *(void *)(v18 + 88) = v17;
    }
  }
}

- (void)updateWithForceEnabledTransports:(id)a3 forceDisabledTransports:(id)a4 andHealthMonitorEnabled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_selectedTransport)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __103__GKTransportContext_updateWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke;
    v10[3] = &unk_1E6470070;
    id v11 = v8;
    BOOL v14 = a5;
    id v12 = v9;
    uint64_t v13 = self;
    [(GKTransportContext *)self performUpdateSync:v10];
  }
}

void __103__GKTransportContext_updateWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __103__GKTransportContext_updateWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke_cold_3(a1, v3);
  }
  if ([*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __103__GKTransportContext_updateWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke_cold_2();
    }
    id v5 = (void *)[*(id *)(*(void *)(a1 + 48) + 48) mutableCopy];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [[GKSupportedTransport alloc] initWithVersionNumber:*(void *)(*((void *)&v30 + 1) + 8 * v10)];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * v16);
          uint64_t v18 = [GKSupportedTransport alloc];
          v19 = -[GKSupportedTransport initWithVersionNumber:](v18, "initWithVersionNumber:", v17, (void)v26);
          [v5 removeObject:v19];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v14);
    }

    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = *(void **)(v20 + 48);
    *(void *)(v20 + 48) = v5;
  }
  uint64_t v23 = *(void *)(a1 + 48);
  uint64_t v22 = a1 + 48;
  *(unsigned char *)(v23 + 9) = *(unsigned char *)(v22 + 8);
  if (!os_log_GKGeneral) {
    id v24 = GKOSLoggers();
  }
  int v25 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __103__GKTransportContext_updateWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke_cold_1((void **)v22, v25);
  }
}

- (BOOL)shouldSendInviteUpdate
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__GKTransportContext_shouldSendInviteUpdate__block_invoke;
  v4[3] = &unk_1E6471180;
  v4[4] = self;
  v4[5] = &v5;
  [(GKTransportContext *)self performUpdateSync:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __44__GKTransportContext_shouldSendInviteUpdate__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) selectedTransport];
  uint64_t v3 = [v2 version];

  if (v3 == 2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "lobbyParticipants", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) playerID];
          uint64_t v10 = [*(id *)(a1 + 32) localPlayerID];

          if (v9 != v10)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (id)formAnInviteUpdate
{
  uint64_t v3 = objc_alloc_init(GKUpdateInviteInfo);
  id v4 = [(GKTransportContext *)self gameParticipants];
  [(GKUpdateInviteInfo *)v3 setGameParticipants:v4];

  uint64_t v5 = [(GKTransportContext *)self lobbyParticipants];
  [(GKUpdateInviteInfo *)v3 setLobbyParticipants:v5];

  uint64_t v6 = [(GKTransportContext *)self playerTokenMap];
  [(GKUpdateInviteInfo *)v3 setPlayerTokenMap:v6];

  uint64_t v7 = [(GKTransportContext *)self sessionID];
  [(GKUpdateInviteInfo *)v3 setSessionID:v7];

  char v8 = [(GKTransportContext *)self sessionToken];
  [(GKUpdateInviteInfo *)v3 setSessionToken:v8];

  uint64_t v9 = [(GKTransportContext *)self matchID];

  if (v9)
  {
    uint64_t v10 = [(GKTransportContext *)self matchID];
    [(GKUpdateInviteInfo *)v3 setMatchID:v10];
  }
  long long v11 = NSNumber;
  long long v12 = [(GKTransportContext *)self selectedTransport];
  long long v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "version"));
  [(GKUpdateInviteInfo *)v3 setTransportVersionToUse:v13];

  return v3;
}

- (void)addGameParticipants:(id)a3
{
  id v4 = a3;
  gameParticipants = self->_gameParticipants;
  id v10 = v4;
  if (!gameParticipants)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v7 = self->_gameParticipants;
    self->_gameParticipants = v6;

    id v4 = v10;
    gameParticipants = self->_gameParticipants;
  }
  char v8 = [(NSSet *)gameParticipants setByAddingObjectsFromSet:v4];
  uint64_t v9 = self->_gameParticipants;
  self->_gameParticipants = v8;
}

- (void)addLobbyParticipants:(id)a3
{
  id v4 = a3;
  lobbyParticipants = self->_lobbyParticipants;
  id v10 = v4;
  if (!lobbyParticipants)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v7 = self->_lobbyParticipants;
    self->_lobbyParticipants = v6;

    id v4 = v10;
    lobbyParticipants = self->_lobbyParticipants;
  }
  char v8 = [(NSSet *)lobbyParticipants setByAddingObjectsFromSet:v4];
  uint64_t v9 = self->_lobbyParticipants;
  self->_lobbyParticipants = v8;
}

- (void)addTTRMultiplayerParticipant:(id)a3
{
  id v4 = a3;
  playersAndPushTokens = self->_playersAndPushTokens;
  id v10 = v4;
  if (!playersAndPushTokens)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v7 = self->_playersAndPushTokens;
    self->_playersAndPushTokens = v6;

    id v4 = v10;
    playersAndPushTokens = self->_playersAndPushTokens;
  }
  char v8 = [(NSSet *)playersAndPushTokens setByAddingObject:v4];
  uint64_t v9 = self->_playersAndPushTokens;
  self->_playersAndPushTokens = v8;
}

- (id)updatedParticipantsAfterRemoving:(id)a3 fromOldParticipants:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && [v5 count])
  {
    uint64_t v7 = (void *)[v6 mutableCopy];
    [v7 minusSet:v5];
    id v8 = (id)[v7 copy];
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (void)removeGameParticipantsIfExists:(id)a3
{
  id v4 = [(GKTransportContext *)self updatedParticipantsAfterRemoving:a3 fromOldParticipants:self->_gameParticipants];
  gameParticipants = self->_gameParticipants;
  self->_gameParticipants = v4;

  MEMORY[0x1F41817F8](v4, gameParticipants);
}

- (void)removeLobbyParticipantsIfExists:(id)a3
{
  id v4 = [(GKTransportContext *)self updatedParticipantsAfterRemoving:a3 fromOldParticipants:self->_lobbyParticipants];
  lobbyParticipants = self->_lobbyParticipants;
  self->_lobbyParticipants = v4;

  MEMORY[0x1F41817F8](v4, lobbyParticipants);
}

- (void)enrichServerRequest:(id)a3 withMatchRequest:(id)a4 selfPseudonym:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__GKTransportContext_enrichServerRequest_withMatchRequest_selfPseudonym___block_invoke;
  v14[3] = &unk_1E646F490;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(GKTransportContext *)self performUpdateSync:v14];
}

void __73__GKTransportContext_enrichServerRequest_withMatchRequest_selfPseudonym___block_invoke(uint64_t a1)
{
  v17[5] = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) supportedTransportVersions];
  [v2 setObject:v3 forKey:@"supported-transport-versions"];

  id v4 = (void *)MEMORY[0x1E4F1CA60];
  v16[0] = @"client-data-version";
  id v5 = [NSNumber numberWithInteger:1];
  v17[0] = v5;
  v16[1] = @"match-version";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "version"));
  v17[1] = v6;
  void v16[2] = @"conn-blob";
  uint64_t v7 = [*(id *)(a1 + 40) connectionData];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F1C9B8] data];
  }
  v17[2] = v8;
  v16[3] = @"nat-ip";
  id v9 = [*(id *)(a1 + 40) connectionData];
  id v10 = +[GKViceroyNATConfiguration externalAddressForSelfConnectionData:v9];
  v17[3] = v10;
  v16[4] = @"gp";
  id v11 = [*(id *)(a1 + 40) gameParticipantsServerRepresentationsWithSelfPseudonym:*(void *)(a1 + 56)];
  v17[4] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  id v13 = [v4 dictionaryWithDictionary:v12];

  if (!v7) {
  long long v14 = [*(id *)(a1 + 40) sessionID];
  }

  if (v14)
  {
    id v15 = [*(id *)(a1 + 40) sessionID];
    [v13 setObject:v15 forKey:@"sid"];
  }
  [*(id *)(a1 + 32) setObject:v13 forKey:@"client-data"];
}

- (id)gameParticipantsServerRepresentationsWithSelfPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = [GKTransportParticipant alloc];
  id v6 = [(GKTransportContext *)self localPlayerID];
  uint64_t v7 = [(GKTransportParticipant *)v5 initWithPlayerID:v6 pseudonym:v4];

  id v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = [(GKTransportParticipant *)v7 serverRepresentation];
  id v10 = [v8 arrayWithObject:v9];

  id v11 = (void *)MEMORY[0x1E4F1CA80];
  id v12 = [(GKTransportContext *)self localPlayerID];
  id v13 = [v11 setWithObject:v12];

  long long v14 = [(GKTransportContext *)self gameParticipants];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__GKTransportContext_gameParticipantsServerRepresentationsWithSelfPseudonym___block_invoke;
  v20[3] = &unk_1E64711A8;
  id v21 = v13;
  id v15 = v10;
  id v22 = v15;
  id v16 = v13;
  [v14 enumerateObjectsUsingBlock:v20];

  id v17 = v22;
  id v18 = v15;

  return v18;
}

void __77__GKTransportContext_gameParticipantsServerRepresentationsWithSelfPseudonym___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v10 = v3;
  id v5 = [v3 playerID];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [v10 serverRepresentation];
    [v6 addObject:v7];

    id v8 = *(void **)(a1 + 32);
    id v9 = [v10 playerID];
    [v8 addObject:v9];
  }
}

- (void)enrichConnectionDictionary:(id)a3 inviteResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__GKTransportContext_enrichConnectionDictionary_inviteResponse___block_invoke;
  v10[3] = &unk_1E646F558;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(GKTransportContext *)self performUpdateSync:v10];
}

void __64__GKTransportContext_enrichConnectionDictionary_inviteResponse___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) connectionData];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [NSNumber numberWithInt:1];
    [v3 setObject:v4 forKey:@"blob-type"];

    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) connectionData];
    id v7 = [v6 base64EncodedStringWithOptions:0];
    [v5 setObject:v7 forKey:@"self-blob"];

    id v8 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) connectionData];
    id v10 = +[GKViceroyNATConfiguration externalAddressForSelfConnectionData:v9];
    id v11 = [v10 base64EncodedStringWithOptions:0];
    [v8 setObject:v11 forKey:@"self-nat-ip"];
  }
  else
  {
    int v23 = 0;
    id v12 = *(void **)(a1 + 40);
    id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v23 length:4];
    long long v14 = [v13 base64EncodedStringWithOptions:0];
    [v12 setObject:v14 forKey:@"self-nat-ip"];

    id v15 = *(void **)(a1 + 40);
    id v16 = [MEMORY[0x1E4F1C9B8] data];
    id v17 = [v16 base64EncodedStringWithOptions:0];
    [v15 setObject:v17 forKey:@"self-blob"];

    id v18 = *(void **)(a1 + 40);
    v19 = [NSNumber numberWithInt:0];
    [v18 setObject:v19 forKey:@"blob-type"];
  }
  uint64_t v20 = *(void **)(a1 + 40);
  id v21 = [*(id *)(a1 + 32) sessionID];
  [v20 setObject:v21 forKey:@"sid"];

  id v22 = [*(id *)(a1 + 32) sessionID];
  [*(id *)(a1 + 48) setSessionID:v22];
}

- (void)enrichServerRequestWithConnectionData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__GKTransportContext_enrichServerRequestWithConnectionData___block_invoke;
  v6[3] = &unk_1E646EC80;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(GKTransportContext *)self performUpdateSync:v6];
}

void __60__GKTransportContext_enrichServerRequestWithConnectionData___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) connectionData];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [NSNumber numberWithInt:1];
    [v3 setObject:v4 forKey:@"blob-type"];

    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) connectionData];
    [v5 setObject:v6 forKey:@"self-blob"];

    id v7 = *(void **)(a1 + 40);
    id v15 = [*(id *)(a1 + 32) connectionData];
    id v8 = +[GKViceroyNATConfiguration externalAddressForSelfConnectionData:v15];
    [v7 setObject:v8 forKey:@"self-nat-ip"];
  }
  else
  {
    int v16 = 0;
    id v9 = *(void **)(a1 + 40);
    id v10 = [NSNumber numberWithInt:0];
    [v9 setObject:v10 forKey:@"blob-type"];

    id v11 = *(void **)(a1 + 40);
    id v12 = [MEMORY[0x1E4F1C9B8] data];
    [v11 setObject:v12 forKey:@"self-blob"];

    id v13 = *(void **)(a1 + 40);
    long long v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v16 length:4];
    [v13 setObject:v14 forKey:@"self-nat-ip"];
  }
}

- (void)enrichServerRequest:(id)a3 andInviteResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(GKTransportContext *)self enrichServerRequestWithConnectionData:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke;
  v10[3] = &unk_1E646F558;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(GKTransportContext *)self performUpdateSync:v10];
}

void __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke(id *a1)
{
  char v2 = [a1[4] objectForKeyedSubscript:@"client-data"];
  id v3 = [a1[5] sessionID];

  if (v3)
  {
    id v4 = [a1[5] sessionID];
    [v2 setObject:v4 forKey:@"sid"];
  }
  id v5 = a1[4];
  id v6 = [a1[5] supportedTransportVersions];
  [v5 setObject:v6 forKey:@"supported-transport-versions"];

  id v7 = [a1[5] sessionID];
  [a1[6] setSessionID:v7];

  id v8 = [a1[5] supportedTransportVersions];
  LODWORD(v6) = [v8 containsObject:&unk_1F1E7EC78];

  if (v6)
  {
    id v9 = [GKTransportParticipant alloc];
    id v10 = [a1[5] localPlayerID];
    id v11 = [a1[6] selfPseudonym];
    id v12 = [(GKTransportParticipant *)v9 initWithPlayerID:v10 pseudonym:v11];

    id v13 = (void *)MEMORY[0x1E4F1CA48];
    long long v14 = [(GKTransportParticipant *)v12 serverRepresentation];
    id v15 = [v13 arrayWithObject:v14];

    int v16 = [a1[5] gameParticipants];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke_2;
    v31[3] = &unk_1E64711D0;
    id v17 = v15;
    id v32 = v17;
    [v16 enumerateObjectsUsingBlock:v31];

    id v18 = (void *)MEMORY[0x1E4F1CA48];
    v19 = [(GKTransportParticipant *)v12 serverRepresentation];
    uint64_t v20 = [v18 arrayWithObject:v19];

    id v21 = [a1[5] lobbyParticipants];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    long long v28 = __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke_3;
    long long v29 = &unk_1E64711D0;
    id v22 = v20;
    id v30 = v22;
    [v21 enumerateObjectsUsingBlock:&v26];

    int v23 = objc_msgSend(v2, "objectForKeyedSubscript:", @"matchID", v26, v27, v28, v29);

    if (v23)
    {
      id v24 = [v2 objectForKeyedSubscript:@"matchID"];
      [v2 setObject:v24 forKey:@"matchID"];
    }
    int v25 = [a1[6] selfPseudonym];
    [v2 setObject:v25 forKey:@"ps"];

    [v2 setObject:v17 forKey:@"gp"];
    [v2 setObject:v22 forKey:@"lp"];
    if ([v17 count]) {
      [a1[6] setGameParticipantsInfo:v17];
    }
    if ([v22 count]) {
      [a1[6] setLobbyParticipantsInfo:v22];
    }
  }
}

void __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke_2(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [a2 serverRepresentation];
  [v2 addObject:v3];
}

void __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke_3(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [a2 serverRepresentation];
  [v2 addObject:v3];
}

- (BOOL)supportsTransportVersion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GKTransportContext *)self supportedTransports];
  id v6 = [v5 allObjects];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__GKTransportContext_supportsTransportVersion___block_invoke;
  v13[3] = &unk_1E64711F8;
  id v7 = v4;
  id v14 = v7;
  int v8 = [v6 _gkContainsObjectPassingTest:v13];

  if (!os_log_GKGeneral) {
    id v9 = GKOSLoggers();
  }
  id v10 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v11 = @"not ";
    if (v8) {
      id v11 = &stru_1F1E47DF8;
    }
    *(_DWORD *)buf = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "Transport version(%@) %@supported.", buf, 0x16u);
  }

  return v8;
}

BOOL __47__GKTransportContext_supportsTransportVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 version];
  return v3 == [*(id *)(a1 + 32) integerValue];
}

- (NSArray)representedPlayerIDs
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = __Block_byref_object_copy__14;
  id v9 = __Block_byref_object_dispose__14;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__GKTransportContext_representedPlayerIDs__block_invoke;
  v4[3] = &unk_1E646EB68;
  v4[4] = self;
  v4[5] = &v5;
  [(GKTransportContext *)self performUpdateSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __42__GKTransportContext_representedPlayerIDs__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lobbyParticipants];
  uint64_t v3 = [v2 allObjects];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__GKTransportContext_representedPlayerIDs__block_invoke_2;
  v7[3] = &unk_1E6471220;
  v7[4] = *(void *)(a1 + 32);
  uint64_t v4 = [v3 _gkFilterWithBlock:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __42__GKTransportContext_representedPlayerIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 playerID];
  uint64_t v5 = [*(id *)(a1 + 32) localPlayerID];
  if ([v4 isEqualToString:v5])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v3 playerID];
  }

  return v6;
}

- (void)updateWithInfoFromTransport:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__GKTransportContext_updateWithInfoFromTransport___block_invoke;
  v6[3] = &unk_1E646EC80;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(GKTransportContext *)self performUpdateSync:v6];
}

void __50__GKTransportContext_updateWithInfoFromTransport___block_invoke(uint64_t a1)
{
  id obj = [*(id *)(a1 + 32) objectForKeyedSubscript:@"sid"];
  if (obj) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 96), obj);
  }
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"matchID"];
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 88), v2);
  }
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"addedGameParticipants"];
  if ([v3 count]) {
    [*(id *)(a1 + 40) addGameParticipants:v3];
  }
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"addedLobbyParticipants"];
  if ([v4 count]) {
    [*(id *)(a1 + 40) addLobbyParticipants:v4];
  }
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"removedGameParticipants"];
  if ([v5 count]) {
    [*(id *)(a1 + 40) removeGameParticipantsIfExists:v5];
  }
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"removedLobbyParticipants"];
  if ([v6 count]) {
    [*(id *)(a1 + 40) removeLobbyParticipantsIfExists:v6];
  }
}

- (id)defaultTransportWithForceEnabledTransports:(id)a3 forceDisabledTransports:(id)a4 andHealthMonitorEnabled:(BOOL)a5
{
  [(GKTransportContext *)self updateWithForceEnabledTransports:a3 forceDisabledTransports:a4 andHealthMonitorEnabled:a5];
  id v6 = [(GKTransportContext *)self supportedTransports];
  id v7 = [v6 allObjects];
  int v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_172_0];

  id v9 = [v8 firstObject];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [GKSupportedTransport alloc];
    id v13 = [NSNumber numberWithInteger:1];
    id v11 = [(GKSupportedTransport *)v12 initWithVersionNumber:v13];
  }

  return v11;
}

uint64_t __113__GKTransportContext_defaultTransportWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 version];
  if (v6 >= [v5 version])
  {
    uint64_t v8 = [v4 version];
    uint64_t v7 = v8 > [v5 version];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (NSString)localPlayerID
{
  return self->_localPlayerID;
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (GKSupportedTransport)selectedTransport
{
  return self->_selectedTransport;
}

- (void)setValidTransportSelected:(BOOL)a3
{
  self->_validTransportSelected = a3;
}

- (BOOL)healthMonitorEnabled
{
  return self->_healthMonitorEnabled;
}

- (void)setHealthMonitorEnabled:(BOOL)a3
{
  self->_healthMonitorEnabled = a3;
}

- (GKMultiplayerDaemonProxy)daemonProxy
{
  return self->_daemonProxy;
}

- (NSSet)supportedTransports
{
  return self->_supportedTransports;
}

- (NSData)cdxTicket
{
  return self->_cdxTicket;
}

- (NSData)connectionData
{
  return self->_connectionData;
}

- (NSArray)peerDictionaries
{
  return self->_peerDictionaries;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (NSString)matchID
{
  return self->_matchID;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSDictionary)playerTokenMap
{
  return self->_playerTokenMap;
}

- (NSSet)playersAndPushTokens
{
  return self->_playersAndPushTokens;
}

- (NSSet)gameParticipants
{
  return self->_gameParticipants;
}

- (NSSet)lobbyParticipants
{
  return self->_lobbyParticipants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lobbyParticipants, 0);
  objc_storeStrong((id *)&self->_gameParticipants, 0);
  objc_storeStrong((id *)&self->_playersAndPushTokens, 0);
  objc_storeStrong((id *)&self->_playerTokenMap, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_peerDictionaries, 0);
  objc_storeStrong((id *)&self->_connectionData, 0);
  objc_storeStrong((id *)&self->_cdxTicket, 0);
  objc_storeStrong((id *)&self->_supportedTransports, 0);
  objc_storeStrong((id *)&self->_daemonProxy, 0);
  objc_storeStrong((id *)&self->_selectedTransport, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);

  objc_storeStrong((id *)&self->_localPlayerID, 0);
}

- (void)shouldDelayConnectionForMatchResponse:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "Nil pseudonym for local player.", v1, 2u);
}

- (void)shouldDelayConnectionForMatchResponse:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v11 = [a3 pseudonym];
  OUTLINED_FUNCTION_5_1(&dword_1C2D22000, v5, v6, "Sorted pseudonyms for stagger: %@, self pseudonym: %@", v7, v8, v9, v10, 2u);
}

- (void)shouldDelayConnectionForMatchResponse:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "Invalid matched player: %@", (uint8_t *)&v2, 0xCu);
}

- (void)selectTransportWith:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "Skip transport selection for undefined version.", v1, 2u);
}

- (void)selectTransportWith:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 selectedTransport];
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v5, v6, "Skip transport selection since we have already selected: %@.", v7, v8, v9, v10, 2u);
}

void __49__GKTransportContext_updateForLegacyNearbyInvite__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "Something went wrong. Transport context should not expect update of legacy nearby invite after v2 has been selected.", v1, 2u);
}

void __72__GKTransportContext_updateForInviteInitiationWithOnlineConnectionData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "updateForInviteInitiationWithOnlineConnectionData: %@", v2, v3, v4, v5, v6);
}

void __55__GKTransportContext_updateWithInviteInitiateResponse___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "updateWithInviteInitiateResponse: %@", v2, v3, v4, v5, v6);
}

void __62__GKTransportContext_updateForInviteAcceptWithConnectionData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "updateForInviteAcceptWithConnectionData: %@", v2, v3, v4, v5, v6);
}

void __72__GKTransportContext_updateAfterAcceptingRemoveInvite_acceptedResponse___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "updateAfterAcceptingRemoveInvite: %@, acceptedResponse: %@", v1, 0x16u);
}

void __57__GKTransportContext_updateAfterInviteeAcceptedUserInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "updateAfterInviteeAcceptedUserInfo: %@", v2, v3, v4, v5, v6);
}

void __62__GKTransportContext_updateForMatchRequestWithConnectionData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "updateForMatchRequestWithConnectionData: %@", v2, v3, v4, v5, v6);
}

void __58__GKTransportContext_updateForMatchResponse_serverHosted___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = a2;
  uint64_t v5 = [v2 numberWithBool:v3];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_1(&dword_1C2D22000, v6, v7, "updateForMatchResponse: %@, serverHosted: %@", v8, v9, v10, v11, v12);
}

void __103__GKTransportContext_updateWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  id v4 = [v2 supportedTransports];
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v5, v6, "Supported transport versions: %@", v7, v8, v9, v10, 2u);
}

void __103__GKTransportContext_updateWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "Overriding transport versions with forceEnabledTransports: %@, forceDisabledTransports: %@", v1, 0x16u);
}

void __103__GKTransportContext_updateWithForceEnabledTransports_forceDisabledTransports_andHealthMonitorEnabled___block_invoke_cold_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = NSNumber;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v5 = a2;
  uint64_t v6 = [v3 numberWithBool:v4];
  OUTLINED_FUNCTION_4_0();
  uint64_t v10 = v2;
  __int16 v11 = v7;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_DEBUG, "UpdateWithTransportOverrides. ForceEnabled: %@, ForceDisabled: %@, isHealthMonitorEnabled: %@", v9, 0x20u);
}

@end