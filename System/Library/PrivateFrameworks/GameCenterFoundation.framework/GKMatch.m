@interface GKMatch
- (BOOL)canPromptTapToRadar;
- (BOOL)fastStartStateActive;
- (BOOL)hostScoreForQuery;
- (BOOL)initiallyStarted;
- (BOOL)needHostScore;
- (BOOL)recentlyBecameActive;
- (BOOL)sendData:(NSData *)data toPlayers:(NSArray *)playerIDs withDataMode:(GKMatchSendDataMode)mode error:(NSError *)error;
- (BOOL)sendData:(NSData *)data toPlayers:(NSArray *)players dataMode:(GKMatchSendDataMode)mode error:(NSError *)error;
- (BOOL)sendDataToAllPlayers:(NSData *)data withDataMode:(GKMatchSendDataMode)mode error:(NSError *)error;
- (BOOL)sendPacketDataToAll:(id)a3 packetType:(unsigned __int8)a4 dataMode:(int64_t)a5 error:(id *)a6;
- (GKMatch)initWithMatchmaker:(id)a3;
- (GKMatch)initWithTransport:(id)a3 context:(id)a4 reporter:(id)a5 matchmaker:(id)a6;
- (GKMatchDelegatePrivate)inviteDelegate;
- (GKMatchmaker)matchmaker;
- (GKMultiplayerActivityReporter)multiplayerActivityReporter;
- (GKThreadsafeDictionary)playersByIdentifier;
- (GKThreadsafeDictionary)playersByJoinType;
- (GKThreadsafeDictionary)propertiesByPlayerID;
- (GKTransportContext)transportContext;
- (GKTransportMonitor)healthMonitor;
- (GKTransportProtocol)transport;
- (GKVoiceChat)voiceChatWithName:(NSString *)name;
- (NSArray)guestPlayers;
- (NSArray)playerIDs;
- (NSArray)players;
- (NSDictionary)networkStatistics;
- (NSDictionary)playerProperties;
- (NSDictionary)properties;
- (NSMutableArray)opponentIDs;
- (NSMutableArray)reinvitedPlayers;
- (NSMutableDictionary)hostScores;
- (NSMutableDictionary)playerEventQueues;
- (NSMutableDictionary)playerPushTokens;
- (NSMutableSet)connectedPlayerIDs;
- (NSString)groupIdentifier;
- (NSString)rematchID;
- (NSUInteger)expectedPlayerCount;
- (OS_dispatch_queue)stateChangeQueue;
- (_TtC20GameCenterFoundation22ExponentialBackoffTask)pendingConnectionChecker;
- (id)allIDs;
- (id)chooseHostCompletion;
- (id)connectedPlayers;
- (id)dataFromBase64String:(id)a3;
- (id)delegate;
- (id)description;
- (id)getConnectionContextForPlayerID:(id)a3;
- (id)makeInviteMessageDoneData;
- (id)matchPacketWithPacketType:(unsigned __int8)a3 sequence:(int64_t)a4;
- (id)nearbyConnectionData;
- (id)packet:(unsigned __int8)a3 data:(id)a4;
- (id)pendingInviteesOfLocalPlayer;
- (id)playerFromID:(id)a3;
- (id)playerFromID:(id)a3 includingLocal:(BOOL)a4;
- (id)stringForGKPeerConnectionState:(int)a3;
- (id)stringForGKPlayerConnectionState:(int64_t)a3;
- (id)updateConnectionInfo:(id)a3 forPlayerID:(id)a4;
- (int64_t)rematchCount;
- (int64_t)sequenceFromPacket:(id)a3;
- (unint64_t)currentPlayerCount;
- (unint64_t)currentPlayerCountIncludingLocalPlayer;
- (unsigned)packetSequenceNumber;
- (unsigned)version;
- (void)_delegate:(id)a3 didReceiveData:(id)a4 forRecipient:(id)a5 fromPlayer:(id)a6;
- (void)acceptRelayResponse:(id)a3 player:(id)a4;
- (void)addPlayerToGroup:(id)a3;
- (void)addPlayers:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillTerminateNotification:(id)a3;
- (void)cancelPendingConnectionCheckWithReason:(id)a3;
- (void)chooseBestHostPlayerWithCompletionHandler:(void *)completionHandler;
- (void)chooseBestHostingPlayerWithCompletionHandler:(void *)completionHandler;
- (void)cleanupForTerminationWithReason:(int64_t)a3;
- (void)clearSessionWithReason:(int64_t)a3;
- (void)conditionallyReinvitePlayer:(id)a3 sessionToken:(id)a4;
- (void)conditionallyRelaunchPlayer:(id)a3;
- (void)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4;
- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4;
- (void)connectToPlayers:(id)a3 version:(unsigned __int8)a4 invitedByLocalPlayer:(BOOL)a5 completionHandler:(id)a6;
- (void)connectionDidChangeWithState:(int)a3 playerID:(id)a4;
- (void)connectionDidFailWithError:(id)a3;
- (void)dealloc;
- (void)deferStateCallbackForPlayer:(id)a3 state:(int64_t)a4;
- (void)deliverData:(id)a3 forRecipient:(id)a4 fromPlayer:(id)a5;
- (void)disconnect;
- (void)getLocalConnectionDataWithCompletionHandler:(id)a3;
- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4;
- (void)localPlayerDidChange:(id)a3;
- (void)monitorStatsUpdated:(id)a3;
- (void)playerIDs;
- (void)preLoadInviter:(id)a3 sessionToken:(id)a4;
- (void)preemptRelay:(id)a3;
- (void)promptRadarAndRequestRemoteLogsWithDescriptionAddition:(id)a3;
- (void)putMultiplayerGroup;
- (void)queueData:(id)a3 withEventQueueForPlayer:(id)a4 forRecipient:(id)a5;
- (void)receivedPlayerSyncData:(id)a3;
- (void)refreshPendingConnectionCheckIfNeeded;
- (void)reinviteeAcceptedNotification:(id)a3;
- (void)reinviteeDeclinedNotification:(id)a3;
- (void)relayDidReceivePushData:(id)a3 completionHandler:(id)a4;
- (void)rematchWithCompletionHandler:(void *)completionHandler;
- (void)reportInviteSentWithApproach:(unint64_t)a3 isHosted:(BOOL)a4 recipients:(id)a5;
- (void)retryLimitHit;
- (void)sendConnectingStateCallbackToDelegate:(id)a3 forPlayers:(id)a4;
- (void)sendInviteData:(id)a3;
- (void)sendInviteData:(id)a3 withScope:(int64_t)a4;
- (void)sendMeasurementData:(id)a3 packetType:(unsigned __int8)a4 toPlayerID:(id)a5;
- (void)sendPingTo:(id)a3 sequence:(int64_t)a4;
- (void)sendPongTo:(id)a3 sequence:(int64_t)a4;
- (void)sendQueuedPacketsForPlayer:(id)a3;
- (void)sendQueuedStatesAndPackets;
- (void)sendStateCallbackForPlayer:(id)a3 state:(int64_t)a4;
- (void)sendStateCallbackToDelegate:(id)a3 forPlayer:(id)a4 state:(int64_t)a5;
- (void)sendVersionData:(unsigned __int8)a3;
- (void)sendVersionData:(unsigned __int8)a3 toPlayer:(id)a4;
- (void)setAutomatchPlayerCount:(int64_t)a3;
- (void)setCanPromptTapToRadar:(BOOL)a3;
- (void)setChooseHostCompletion:(id)a3;
- (void)setConnectedPlayerIDs:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setFastStartStateActive:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHealthMonitor:(id)a3;
- (void)setHostScoreForQuery:(BOOL)a3;
- (void)setHostScores:(id)a3;
- (void)setInitiallyStarted:(BOOL)a3;
- (void)setInviteDelegate:(id)a3;
- (void)setMatchmaker:(id)a3;
- (void)setMultiplayerActivityReporter:(id)a3;
- (void)setNeedHostScore:(BOOL)a3;
- (void)setNetworkStatistics:(id)a3;
- (void)setOpponentIDs:(id)a3;
- (void)setPacketSequenceNumber:(unsigned int)a3;
- (void)setPendingConnectionChecker:(id)a3;
- (void)setPlayerEventQueues:(id)a3;
- (void)setPlayerPushTokens:(id)a3;
- (void)setPlayersByIdentifier:(id)a3;
- (void)setPlayersByJoinType:(id)a3;
- (void)setPropertiesByPlayerID:(id)a3;
- (void)setRecentlyBecameActive:(BOOL)a3;
- (void)setReinvitedPlayers:(id)a3;
- (void)setRematchCount:(int64_t)a3;
- (void)setRematchID:(id)a3;
- (void)setStateChangeQueue:(id)a3;
- (void)setTransport:(id)a3;
- (void)setTransportContext:(id)a3;
- (void)setVersion:(unsigned __int8)a3;
- (void)setupWithTransport:(id)a3 context:(id)a4 reporter:(id)a5 matchmaker:(id)a6;
- (void)syncPlayers:(id)a3 forJoinType:(int)a4 toInvitees:(id)a5;
- (void)transportDidFailWithError:(id)a3;
- (void)transportDidReceivePacket:(id)a3 fromPlayerID:(id)a4 remoteRecipientID:(id)a5;
- (void)transportDidUpdateWithInfo:(id)a3;
- (void)updateEventQueueForInviter:(id)a3;
- (void)updateJoinedPlayer:(id)a3 joinType:(int)a4;
- (void)updateProperties:(id)a3 playerID:(id)a4;
- (void)updateRematchID;
- (void)updateStateForPlayer:(id)a3 state:(int64_t)a4;
- (void)withEventQueueForPlayer:(id)a3 create:(id)a4 perform:(id)a5;
- (void)withEventQueueForPlayer:(id)a3 createIfNeeded:(BOOL)a4 perform:(id)a5;
- (void)withEventQueueForPlayer:(id)a3 perform:(id)a4;
@end

@implementation GKMatch

- (id)description
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p expected count: %u seqnum: %d\n", v5, self, -[GKMatch expectedPlayerCount](self, "expectedPlayerCount"), -[GKMatch packetSequenceNumber](self, "packetSequenceNumber")];

  obj = self->_playerEventQueues;
  objc_sync_enter(obj);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = [(NSMutableDictionary *)self->_playerEventQueues allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        [v3 appendFormat:@"    %@:", v10];
        v11 = [(NSMutableDictionary *)self->_playerEventQueues objectForKey:v10];
        v12 = v11;
        if (v11)
        {
          unint64_t v13 = [v11 playerState];
          if (v13 >= 3) {
            goto LABEL_11;
          }
          v14 = off_1E646F3C8[v13];
        }
        else
        {
          v14 = @"?no queue?";
        }
        [v3 appendString:v14];
LABEL_11:
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  objc_sync_exit(obj);
  v15 = [(GKMatch *)self reinvitedPlayers];
  v16 = [(GKMatch *)self properties];
  v17 = [(GKMatch *)self playerProperties];
  [v3 appendFormat:@"reinvitedPlayers:%@, properties:%@, playerProperties:%@>", v15, v16, v17];

  return v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (id)pendingInviteesOfLocalPlayer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = self->_playerEventQueues;
  objc_sync_enter(v3);
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(NSMutableDictionary *)self->_playerEventQueues allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 invitedByLocalPlayer] && objc_msgSend(v9, "playerState") != 1)
        {
          uint64_t v10 = [v9 player];
          [v4 addObject:v10];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = (void *)[v4 copy];
  objc_sync_exit(v3);

  return v11;
}

- (void)refreshPendingConnectionCheckIfNeeded
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = [a2 transportContext];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v3, v5, "Should not send invite update for this context: %@", v6);
}

void __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [*(id *)(a1 + 32) transportContext];
  uint64_t v6 = [v5 daemonProxy];
  uint64_t v7 = [WeakRetained transportContext];
  uint64_t v8 = [v7 formAnInviteUpdate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2;
  v10[3] = &unk_1E646E098;
  id v11 = v3;
  id v9 = v3;
  [v6 sendInvitationUpdate:v8 handler:v10];
}

void __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_176(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained pendingInviteesOfLocalPlayer];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_176_cold_1();
    }
  }

  return v3 == 0;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = delegate;
  objc_storeWeak((id *)&self->_delegate, v4);
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Set match delegate to: %@", (uint8_t *)&v7, 0xCu);
  }
  if (v4) {
    [(GKMatch *)self sendQueuedStatesAndPackets];
  }
}

- (NSArray)players
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = self->_playerEventQueues;
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMutableDictionary *)self->_playerEventQueues allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 playerState] == 1)
        {
          uint64_t v10 = [v9 player];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);

  return (NSArray *)v3;
}

- (NSDictionary)properties
{
  v2 = [(GKMatch *)self propertiesByPlayerID];
  uint64_t v3 = +[GKLocalPlayer local];
  id v4 = [v3 internal];
  id v5 = [v4 playerID];
  uint64_t v6 = [v2 objectForKey:v5];

  return (NSDictionary *)v6;
}

- (NSDictionary)playerProperties
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v24 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v25 = self;
  uint64_t v3 = [(GKMatch *)self propertiesByPlayerID];
  id v4 = [v3 allObjects];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v23 = v4;
  id v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v27;
    *(void *)&long long v7 = 138412290;
    long long v22 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v12 = +[GKLocalPlayer local];
        long long v13 = [v12 internal];
        long long v14 = [v13 playerID];
        char v15 = [v11 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          long long v16 = [(GKMatch *)v25 playerFromID:v11];
          if (v16)
          {
            uint64_t v17 = [v23 objectForKeyedSubscript:v11];
            [v24 setObject:v17 forKey:v16];
          }
          else
          {
            if (!os_log_GKGeneral) {
              id v18 = GKOSLoggers();
            }
            v19 = os_log_GKMatch;
            if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              v31 = v11;
              _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "Ignoring properties for unknown playerID: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);
  }

  if ([v24 count])
  {
    long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v24];
  }
  else
  {
    long long v20 = 0;
  }

  return (NSDictionary *)v20;
}

- (BOOL)sendData:(NSData *)data toPlayers:(NSArray *)players dataMode:(GKMatchSendDataMode)mode error:(NSError *)error
{
  uint64_t v10 = data;
  id v11 = players;
  long long v12 = v10;
  if ([(GKMatch *)self version])
  {
    if (mode == GKMatchSendDataUnreliable) {
      uint64_t v13 = 64;
    }
    else {
      uint64_t v13 = (mode == GKMatchSendDataReliable) << 7;
    }
    long long v12 = [(GKMatch *)self packet:v13 data:v10];
  }
  long long v14 = [(GKMatch *)self transport];
  char v15 = [(GKMatch *)self transportContext];
  char v16 = [v14 sendScopedData:v12 toPlayers:v11 dataMode:mode dataScope:0 transportContext:v15 error:error];

  if (error && *error)
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatch sendData:toPlayers:dataMode:error:]();
    }
  }

  return v16;
}

- (BOOL)sendDataToAllPlayers:(NSData *)data withDataMode:(GKMatchSendDataMode)mode error:(NSError *)error
{
  uint64_t v8 = data;
  uint64_t v9 = [(GKMatch *)self transportContext];
  char v10 = [v9 shouldFilterGuestWhenSendingToAll];

  if (v10)
  {
    id v11 = [(GKMatch *)self players];
    long long v12 = [(NSData *)v11 _gkNonGuestPlayersFromPlayers];
    char v13 = [(GKMatch *)self sendData:v8 toPlayers:v12 dataMode:mode error:error];
  }
  else
  {
    id v11 = v8;
    if ([(GKMatch *)self version])
    {
      if (mode == GKMatchSendDataUnreliable) {
        uint64_t v14 = 64;
      }
      else {
        uint64_t v14 = (mode == GKMatchSendDataReliable) << 7;
      }
      uint64_t v15 = [(GKMatch *)self packet:v14 data:v11];

      id v11 = (NSData *)v15;
    }
    char v16 = [(GKMatch *)self transport];
    id v17 = [(GKMatch *)self transportContext];
    char v13 = [v16 sendScopedDataToAll:v11 dataMode:mode dataScope:0 transportContext:v17 error:error];

    if (error && *error)
    {
      if (!os_log_GKGeneral) {
        id v18 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        -[GKMatch sendDataToAllPlayers:withDataMode:error:]();
      }
    }
  }

  return v13;
}

- (GKVoiceChat)voiceChatWithName:(NSString *)name
{
  id v4 = name;
  id v5 = +[GKPreferences shared];
  if (![v5 shouldAllowCustomCommunication])
  {
    char v10 = 0;
    goto LABEL_5;
  }
  uint64_t v6 = +[GKPreferences shared];
  uint64_t v7 = [v6 multiplayerAllowedPlayerType];

  if (v7)
  {
    id v5 = [(GKMatch *)self transport];
    uint64_t v8 = [(GKMatch *)self players];
    uint64_t v9 = [(GKMatch *)self transportContext];
    char v10 = [v5 voiceChatWithName:v4 players:v8 transportContext:v9];

LABEL_5:
    goto LABEL_7;
  }
  char v10 = 0;
LABEL_7:

  return (GKVoiceChat *)v10;
}

- (void)chooseBestHostingPlayerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = [(GKMatch *)self transport];
  uint64_t v6 = [(GKMatch *)self transportContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__GKMatch_chooseBestHostingPlayerWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E646EED8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 chooseBestHostingPlayerWithTransportContext:v6 completionHandler:v8];
}

void __56__GKMatch_chooseBestHostingPlayerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) playerFromID:a2 includingLocal:1];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __56__GKMatch_chooseBestHostingPlayerWithCompletionHandler___block_invoke_cold_1();
    }
  }
}

- (void)rematchWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = [(GKMatch *)self matchmaker];
  [v5 findRematchForMatch:self completionHandler:v4];
}

- (void)disconnect
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "GKMatch: disconnect", v6, 2u);
  }
  [(GKMatch *)self clearSessionWithReason:2];
  id v5 = [(GKMatch *)self matchmaker];
  [v5 leaveGroupActivity];
}

- (void)promptRadarAndRequestRemoteLogsWithDescriptionAddition:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v3 = +[GKPreferences shared];
  int v4 = [v3 isInternalBuild];

  if (v4)
  {
    if ([(GKMatch *)self canPromptTapToRadar])
    {
      if (!os_log_GKGeneral) {
        id v5 = GKOSLoggers();
      }
      uint64_t v6 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v29;
        _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Starting prompting TTR then requesting remote logs with description: %@", buf, 0xCu);
      }
      v30 = [MEMORY[0x1E4F1CA48] array];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v7 = [(GKMatch *)self transportContext];
      uint64_t v8 = [v7 playersAndPushTokens];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v35 != v10) {
              objc_enumerationMutation(v8);
            }
            long long v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            char v13 = [v12 playerID];
            uint64_t v14 = [v12 pushToken];
            uint64_t v15 = (void *)v14;
            if (v13) {
              BOOL v16 = v14 == 0;
            }
            else {
              BOOL v16 = 1;
            }
            if (!v16)
            {
              v38[0] = @"playerID";
              v38[1] = @"pushToken";
              v39[0] = v13;
              v39[1] = v14;
              id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
              [v30 addObject:v17];
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v9);
      }

      id v18 = (void *)MEMORY[0x1E4F28DB0];
      v19 = (void *)[v30 copy];
      id v33 = 0;
      long long v20 = [v18 archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v33];
      id v21 = v33;

      if (v21)
      {
        if (!os_log_GKGeneral) {
          id v22 = GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
          -[GKMatch promptRadarAndRequestRemoteLogsWithDescriptionAddition:]();
        }
      }
      else
      {
        uint64_t v25 = [v20 base64EncodedStringWithOptions:0];
        objc_initWeak((id *)buf, self);
        long long v26 = [(GKMatch *)self transportContext];
        long long v27 = [v26 daemonProxy];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __66__GKMatch_promptRadarAndRequestRemoteLogsWithDescriptionAddition___block_invoke;
        v31[3] = &unk_1E646EF00;
        objc_copyWeak(&v32, (id *)buf);
        [v27 fileMultiplayerTTRWithCallBackIdentifier:v25 descriptionAddition:v29 handler:v31];

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v23 = GKOSLoggers();
      }
      v24 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2D22000, v24, OS_LOG_TYPE_INFO, "Already prompted tap to radar. Skip.", buf, 2u);
      }
    }
  }
}

void __66__GKMatch_promptRadarAndRequestRemoteLogsWithDescriptionAddition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCanPromptTapToRadar:0];
}

- (NSArray)playerIDs
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKMatch playerIDs]();
    }
    v18[0] = @"playerID is no longer available";
    int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    int v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(GKMatch *)self players];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) internal];
          id v11 = [v10 playerID];
          [v4 addObject:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }

  return (NSArray *)v4;
}

- (void)chooseBestHostPlayerWithCompletionHandler:(void *)completionHandler
{
  int v4 = completionHandler;
  if (v4)
  {
    if (GKApplicationLinkedOnOrAfter(917504, 659456))
    {
      if (!os_log_GKGeneral) {
        id v5 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        -[GKMatch chooseBestHostPlayerWithCompletionHandler:]();
      }
      v4[2](v4, @"playerID is no longer available");
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __53__GKMatch_chooseBestHostPlayerWithCompletionHandler___block_invoke;
      v6[3] = &unk_1E646EF28;
      uint64_t v7 = v4;
      [(GKMatch *)self chooseBestHostingPlayerWithCompletionHandler:v6];
    }
  }
}

void __53__GKMatch_chooseBestHostPlayerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 internal];
  id v3 = [v4 playerID];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (BOOL)sendData:(NSData *)data toPlayers:(NSArray *)playerIDs withDataMode:(GKMatchSendDataMode)mode error:(NSError *)error
{
  uint64_t v10 = data;
  id v11 = playerIDs;
  if (!GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    long long v15 = [(GKMatch *)self players];
    long long v16 = [v15 _gkMapDictionaryWithKeyPath:@"playerID"];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__GKMatch_sendData_toPlayers_withDataMode_error___block_invoke;
    v19[3] = &unk_1E646EF50;
    id v20 = v16;
    long long v13 = v16;
    id v17 = [(NSArray *)v11 _gkFilterWithBlock:v19];
    BOOL v14 = [(GKMatch *)self sendData:v10 toPlayers:v17 dataMode:mode error:error];

    goto LABEL_8;
  }
  if (!os_log_GKGeneral) {
    id v12 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
  {
    -[GKMatch sendData:toPlayers:withDataMode:error:]();
    if (error) {
      goto LABEL_6;
    }
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_9;
  }
  if (!error) {
    goto LABEL_11;
  }
LABEL_6:
  long long v13 = [MEMORY[0x1E4F28C58] userErrorForCode:34 underlyingError:0];
  BOOL v14 = 0;
  *error = v13;
LABEL_8:

LABEL_9:
  return v14;
}

uint64_t __49__GKMatch_sendData_toPlayers_withDataMode_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKey:a2];
}

- (GKMatch)initWithMatchmaker:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKMatch;
  id v5 = [(GKMatch *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [GKTransportContext alloc];
    uint64_t v7 = +[GKGame currentGame];
    uint64_t v8 = [v7 internal];
    uint64_t v9 = [v8 supportedTransports];
    uint64_t v10 = [(GKTransportContext *)v6 initWithSupportedTransports:v9];

    id v11 = [GKMultiplayerActivityReporter alloc];
    id v12 = +[GKLocalPlayer local];
    long long v13 = [v12 internal];
    BOOL v14 = [v13 playerID];
    long long v15 = +[GKAPIReporter reporter];
    long long v16 = [(GKMultiplayerActivityReporter *)v11 initWithLocalPlayerID:v14 matchDataDelegate:v5 apiReporter:v15];

    id v17 = [[GKCompositeTransport alloc] initWithClientDelegate:v5 matchDataDelegate:v5 reporter:v16 transportContext:v10];
    [(GKMatch *)v5 setupWithTransport:v17 context:v10 reporter:v16 matchmaker:v4];
  }
  return v5;
}

- (GKMatch)initWithTransport:(id)a3 context:(id)a4 reporter:(id)a5 matchmaker:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)GKMatch;
  BOOL v14 = [(GKMatch *)&v17 init];
  long long v15 = v14;
  if (v14) {
    [(GKMatch *)v14 setupWithTransport:v10 context:v11 reporter:v12 matchmaker:v13];
  }

  return v15;
}

- (void)setupWithTransport:(id)a3 context:(id)a4 reporter:(id)a5 matchmaker:(id)a6
{
  id v10 = (GKTransportProtocol *)a3;
  id v11 = (GKTransportContext *)a4;
  id v12 = (GKMultiplayerActivityReporter *)a5;
  id v13 = (void *)MEMORY[0x1E4F1CA80];
  id v14 = a6;
  long long v15 = [v13 set];
  connectedPlayerIDs = self->_connectedPlayerIDs;
  self->_connectedPlayerIDs = v15;

  *(_WORD *)&self->_fastStartStateActive = 0;
  self->_canPromptTapToRadar = 1;
  multiplayerActivityReporter = self->_multiplayerActivityReporter;
  self->_multiplayerActivityReporter = v12;
  id v18 = v12;

  objc_storeWeak((id *)&self->_matchmaker, v14);
  objc_super v19 = [MEMORY[0x1E4F1CA48] array];
  opponentIDs = self->_opponentIDs;
  self->_opponentIDs = v19;

  id v21 = [_TtC20GameCenterFoundation22ExponentialBackoffTask alloc];
  id v22 = [(GKMatch *)self matchmaker];
  id v23 = [v22 invitationQueue];
  v24 = [(ExponentialBackoffTask *)v21 initWithName:@"GKMatch.pendingConnectionChecker" queue:v23 initialDelay:10 maxDelay:1.0 maxRetryCount:4.0];
  pendingConnectionChecker = self->_pendingConnectionChecker;
  self->_pendingConnectionChecker = v24;

  [(ExponentialBackoffTask *)self->_pendingConnectionChecker setDelegate:self];
  long long v26 = [MEMORY[0x1E4F1CA60] dictionary];
  playerEventQueues = self->_playerEventQueues;
  self->_playerEventQueues = v26;

  long long v28 = [MEMORY[0x1E4F1CA60] dictionary];
  playerPushTokens = self->_playerPushTokens;
  self->_playerPushTokens = v28;

  v30 = [[GKThreadsafeDictionary alloc] initWithName:@"com.apple.gamecenter.match.playersbyidentifier"];
  playersByIdentifier = self->_playersByIdentifier;
  self->_playersByIdentifier = v30;

  id v32 = [[GKThreadsafeDictionary alloc] initWithName:@"com.apple.gamecenter.match.playersByJoinType"];
  playersByJoinType = self->_playersByJoinType;
  self->_playersByJoinType = v32;

  long long v34 = [[GKThreadsafeDictionary alloc] initWithName:@"com.apple.gamecenter.match.propertiesByPlayerID"];
  propertiesByPlayerID = self->_propertiesByPlayerID;
  self->_propertiesByPlayerID = v34;

  long long v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  reinvitedPlayers = self->_reinvitedPlayers;
  self->_reinvitedPlayers = v36;

  v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v39 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamecenter.match.statechangequeue", v38);
  stateChangeQueue = self->_stateChangeQueue;
  self->_stateChangeQueue = v39;

  transport = self->_transport;
  self->_transport = v10;
  id v42 = v10;

  transportContext = self->_transportContext;
  self->_transportContext = v11;
  v44 = v11;

  self->_version = 1;
  id v52 = [MEMORY[0x1E4F28EB8] defaultCenter];
  NSNotificationName v45 = GKPlayerAuthenticationDidChangeNotificationName;
  v46 = +[GKLocalPlayer localPlayer];
  [v52 addObserver:self selector:sel_localPlayerDidChange_ name:v45 object:v46];

  v47 = +[GKApplicationNotificationNames willTerminate];
  [v52 addObserver:self selector:sel_applicationWillTerminateNotification_ name:v47 object:0];

  v48 = +[GKApplicationNotificationNames didEnterBackground];
  [v52 addObserver:self selector:sel_applicationDidEnterBackground_ name:v48 object:0];

  v49 = +[GKApplicationNotificationNames willEnterForeground];
  [v52 addObserver:self selector:sel_applicationWillEnterForeground_ name:v49 object:0];

  v50 = [[GKTransportMonitor alloc] initWithMaxIteration:200 pingInterval:5000 pingTimeout:5000 reportFrequency:20];
  healthMonitor = self->_healthMonitor;
  self->_healthMonitor = v50;

  [(GKTransportMonitor *)self->_healthMonitor setClientDelegate:self];
}

- (void)applicationWillTerminateNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "need to clear session after receiving applicationWillTerminateNotification", v8, 2u);
  }
  [(GKMatch *)self cleanupForTerminationWithReason:0];
  uint64_t v7 = [(GKMatch *)self matchmaker];
  [v7 leaveGroupActivity];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3 = +[GKMatchBackgroundAssertionManager shared];
  [v3 acquire];
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = +[GKMatchBackgroundAssertionManager shared];
  [v4 invalidate];

  [(GKMatch *)self setRecentlyBecameActive:1];
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GKMatch_applicationWillEnterForeground___block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

uint64_t __42__GKMatch_applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRecentlyBecameActive:0];
}

- (void)cleanupForTerminationWithReason:(int64_t)a3
{
  dispatch_time_t v5 = +[GKMatchBackgroundAssertionManager shared];
  [v5 invalidate];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  [(GKMatch *)self clearSessionWithReason:a3];
}

- (void)clearSessionWithReason:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F29060];
    uint64_t v8 = v6;
    uint64_t v9 = [v7 callStackSymbols];
    int v23 = 134218242;
    int64_t v24 = a3;
    __int16 v25 = 2112;
    long long v26 = v9;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "match clearSession reason: %ld. call stack: %@", (uint8_t *)&v23, 0x16u);
  }
  if ([(GKMatch *)self initiallyStarted])
  {
    id v10 = [(GKMatch *)self multiplayerActivityReporter];
    id v11 = [(GKMatch *)self transportContext];
    [v10 onGameplayEndedWithReason:a3 error:0 transportContext:v11];
  }
  id v12 = [(GKMatch *)self transport];
  id v13 = [(GKMatch *)self transportContext];
  [v12 disconnectAllWithTransportContext:v13 completionHandler:&__block_literal_global_22];

  if (a3 != 1) {
    [(GKMatch *)self cancelPendingConnectionCheckWithReason:@"clearSession"];
  }
  id v14 = [(GKMatch *)self transportContext];
  long long v15 = [v14 daemonProxy];
  [v15 removeInviteSession];

  long long v16 = +[GKReporter reporter];
  [v16 reportCurrentRealtimeMatchPersistenceDuration];

  objc_super v17 = [(GKMatch *)self transportContext];
  id v18 = [v17 daemonProxy];
  [v18 completeMatchRecording:@"failure" matchType:0];

  objc_super v19 = [(GKMatch *)self transportContext];
  id v20 = [v19 daemonProxy];
  [v20 completeGameRecording];

  id v21 = [(GKMatch *)self healthMonitor];

  if (v21)
  {
    id v22 = [(GKMatch *)self healthMonitor];
    [v22 stopMonitoringAll];

    [(GKMatch *)self setHealthMonitor:0];
  }
}

void __34__GKMatch_clearSessionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __34__GKMatch_clearSessionWithReason___block_invoke_cold_1();
    }
  }
}

- (void)dealloc
{
  [(GKMatch *)self cleanupForTerminationWithReason:1];
  transport = self->_transport;
  self->_transport = 0;

  v4.receiver = self;
  v4.super_class = (Class)GKMatch;
  [(GKMatch *)&v4 dealloc];
}

- (void)setInitiallyStarted:(BOOL)a3
{
  if (!self->_initiallyStarted && a3)
  {
    uint64_t v6 = [(GKMatch *)self multiplayerActivityReporter];
    uint64_t v7 = [(GKMatch *)self transportContext];
    [v6 onGameplayStartedWithTransportContext:v7];
  }
  self->_initiallyStarted = a3;
}

- (void)setInviteDelegate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_storeWeak((id *)&self->_inviteDelegateWeak, v4);
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Set match inviteDelegate to: %@", (uint8_t *)&v7, 0xCu);
  }
  if (v4) {
    [(GKMatch *)self sendQueuedStatesAndPackets];
  }
}

- (void)_delegate:(id)a3 didReceiveData:(id)a4 forRecipient:(id)a5 fromPlayer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  connectedPlayerIDs = self->_connectedPlayerIDs;
  long long v15 = [v13 internal];
  long long v16 = [v15 playerID];
  LOBYTE(connectedPlayerIDs) = [(NSMutableSet *)connectedPlayerIDs containsObject:v16];

  if (connectedPlayerIDs)
  {
    if (objc_opt_respondsToSelector())
    {
      [v10 match:self didReceiveData:v11 forRecipient:v12 fromRemotePlayer:v13];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v10 match:self didReceiveData:v11 fromRemotePlayer:v13];
    }
    else if (objc_opt_respondsToSelector())
    {
      if (GKApplicationLinkedOnOrAfter(917504, 659456))
      {
        if (!os_log_GKGeneral) {
          id v19 = GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
          -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:]();
        }
      }
      else
      {
        __int16 v25 = [v13 internal];
        long long v26 = [v25 playerID];
        [v10 match:self didReceiveData:v11 fromPlayer:v26];
      }
    }
    else
    {
      uint64_t v20 = [(GKMatch *)self delegate];
      if (v20)
      {
        id v21 = (void *)v20;
        id v22 = [(GKMatch *)self delegate];
        int v23 = [v10 isEqual:v22];

        if (v23)
        {
          if (!os_log_GKGeneral) {
            id v24 = GKOSLoggers();
          }
          if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
            -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:]();
          }
        }
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    id v18 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:](v18);
    }
  }
}

- (void)addPlayers:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Adding players: %@", buf, 0xCu);
  }
  int v7 = [(GKMatch *)self playersByIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __22__GKMatch_addPlayers___block_invoke;
  v9[3] = &unk_1E646EFA0;
  id v10 = v4;
  id v8 = v4;
  [v7 writeToDictionary:v9];
}

void __22__GKMatch_addPlayers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __22__GKMatch_addPlayers___block_invoke_2;
  v6[3] = &unk_1E646EF78;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __22__GKMatch_addPlayers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 internal];
  id v4 = [v5 playerID];
  [v2 setObject:v3 forKey:v4];
}

- (unint64_t)currentPlayerCount
{
  id v2 = [(GKMatch *)self players];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)currentPlayerCountIncludingLocalPlayer
{
  unint64_t v3 = [(GKMatch *)self players];
  id v4 = +[GKLocalPlayer localPlayer];
  uint64_t v5 = [v3 containsObject:v4] ^ 1;

  uint64_t v6 = [(GKMatch *)self players];
  unint64_t v7 = [v6 count] + v5;

  return v7;
}

- (id)allIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = self->_playerEventQueues;
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_playerEventQueues allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_playerEventQueues objectForKey:v9];
        if (v10) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);

  return v3;
}

- (NSArray)guestPlayers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = self->_playerEventQueues;
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_playerEventQueues allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 playerState] == 1)
        {
          id v10 = [v9 hostPlayer];
          BOOL v11 = v10 == 0;

          if (!v11)
          {
            long long v12 = [v9 player];
            [v3 addObject:v12];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);

  return (NSArray *)v3;
}

- (id)playerFromID:(id)a3 includingLocal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = +[GKLocalPlayer local];
    id v8 = [v7 internal];
    uint64_t v9 = [v8 playerID];
    if ([v9 isEqualToString:v6]) {
      +[GKLocalPlayer local];
    }
    else {
    id v10 = [(GKThreadsafeDictionary *)self->_playersByIdentifier objectForKey:v6];
    }
  }
  else
  {
    id v10 = [(GKThreadsafeDictionary *)self->_playersByIdentifier objectForKey:v6];
  }

  return v10;
}

- (id)playerFromID:(id)a3
{
  return [(GKMatch *)self playerFromID:a3 includingLocal:0];
}

- (void)updateProperties:(id)a3 playerID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(GKMatch *)self propertiesByPlayerID];
  id v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (void)withEventQueueForPlayer:(id)a3 perform:(id)a4
{
}

- (void)withEventQueueForPlayer:(id)a3 createIfNeeded:(BOOL)a4 perform:(id)a5
{
  if (a4) {
    uint64_t v5 = &__block_literal_global_258;
  }
  else {
    uint64_t v5 = 0;
  }
  [(GKMatch *)self withEventQueueForPlayer:a3 create:v5 perform:a5];
}

- (void)withEventQueueForPlayer:(id)a3 create:(id)a4 perform:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, GKMatchEventQueue *))a4;
  id v10 = (void (**)(id, GKMatchEventQueue *))a5;
  if (!v8)
  {
    BOOL v11 = NSString;
    long long v12 = GKStackTraceWithFrameLimit(10);
    long long v13 = [v11 stringWithFormat:@"nil player for queue request at:%@", v12];
    long long v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatch.m"];
    id v15 = [v14 lastPathComponent];
    long long v16 = [v11 stringWithFormat:@"%@ (player != nil)\n[%s (%s:%d)]", v13, "-[GKMatch withEventQueueForPlayer:create:perform:]", objc_msgSend(v15, "UTF8String"), 882];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v16 format];
  }
  long long v17 = [v8 internal];
  id v18 = [v17 playerID];

  uint64_t v19 = self->_playerEventQueues;
  objc_sync_enter(v19);
  uint64_t v20 = [(NSMutableDictionary *)self->_playerEventQueues objectForKey:v18];
  id v21 = (GKMatchEventQueue *)v20;
  if (v9 && !v20)
  {
    id v21 = objc_alloc_init(GKMatchEventQueue);
    [(GKMatchEventQueue *)v21 setPlayer:v8];
    v9[2](v9, v21);
    [(NSMutableDictionary *)self->_playerEventQueues setObject:v21 forKey:v18];
    [(NSMutableSet *)self->_connectedPlayerIDs addObject:v18];
    if (!os_log_GKGeneral) {
      id v22 = GKOSLoggers();
    }
    int v23 = (id)os_log_GKMatch;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      [v8 internal];
      [(id)objc_claimAutoreleasedReturnValue() debugDescription];
      objc_claimAutoreleasedReturnValue();
      -[GKMatch withEventQueueForPlayer:create:perform:]();
    }
  }
  if (!v21)
  {
    if (!os_log_GKGeneral) {
      id v24 = GKOSLoggers();
    }
    __int16 v25 = (id)os_log_GKMatch;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      [v8 internal];
      [(id)objc_claimAutoreleasedReturnValue() debugDescription];
      objc_claimAutoreleasedReturnValue();
      -[GKMatch withEventQueueForPlayer:create:perform:]();
    }
  }
  if (v10) {
    v10[2](v10, v21);
  }

  objc_sync_exit(v19);
}

- (void)preLoadInviter:(id)a3 sessionToken:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  id v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    BOOL v11 = [v6 internal];
    long long v12 = [v11 debugDescription];
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "preLoadInviter - inviting player: %@ sessionToken:%@", buf, 0x16u);
  }
  id v17 = v6;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [(GKMatch *)self addPlayers:v13];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__GKMatch_preLoadInviter_sessionToken___block_invoke;
  v15[3] = &unk_1E646EFE8;
  id v16 = v7;
  id v14 = v7;
  [(GKMatch *)self withEventQueueForPlayer:v6 create:v15 perform:0];
}

void __39__GKMatch_preLoadInviter_sessionToken___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 dictionaryWithObject:v3 forKey:@"session-token"];
  [v4 setConnectionInfo:v5];
}

- (void)updateRematchID
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Cannot update rematch ID because localPlayer has no playerID!", v2, v3, v4, v5, v6);
}

uint64_t __26__GKMatch_updateRematchID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 internal];
  uint8_t v6 = [v5 playerID];
  id v7 = [v4 internal];

  id v8 = [v7 playerID];
  uint64_t v9 = [v6 caseInsensitiveCompare:v8];

  return v9;
}

- (void)updateJoinedPlayer:(id)a3 joinType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v24 = self;
  id v6 = a3;
  id v7 = [(GKMatch *)self playersByJoinType];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v4 && v8) {
    goto LABEL_4;
  }
  uint64_t v9 = +[GKLocalPlayer local];
  id v10 = [v9 internal];
  BOOL v11 = [v10 playerID];
  char v12 = [v6 isEqualToString:v11];

  if (v12)
  {
LABEL_4:
    if (!os_log_GKGeneral) {
      id v13 = GKOSLoggers();
    }
    id v14 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v15 = NSNumber;
      id v16 = v14;
      id v17 = [v15 numberWithUnsignedInt:v4];
      id v18 = [(GKMatch *)v24 playersByJoinType];
      *(_DWORD *)buf = 134218754;
      long long v26 = &v24;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      v30 = v17;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "GKMatch: %p should not update joined player: %@, for joinType: %@, self.playersByJoinType: %@", buf, 0x2Au);

LABEL_12:
    }
  }
  else
  {
    uint64_t v19 = [NSNumber numberWithInt:v4];
    __int16 v20 = [(GKMatch *)self playersByJoinType];
    [v20 setObject:v19 forKeyedSubscript:v6];

    [(GKMatch *)self addPlayerToGroup:v6];
    if (!os_log_GKGeneral) {
      id v21 = GKOSLoggers();
    }
    uint64_t v22 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      int v23 = NSNumber;
      id v16 = v22;
      id v17 = [v23 numberWithUnsignedInt:v4];
      *(_DWORD *)buf = 134218498;
      long long v26 = &v24;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "GKMatch: %p should update joined player: %@, for joinType: %@", buf, 0x20u);
      goto LABEL_12;
    }
  }
}

- (void)localPlayerDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Local player changed with notification: %@", (uint8_t *)&v16, 0xCu);
  }
  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKey:@"GKPlayerDidAuthenticateOldPlayerID"];

  uint64_t v9 = +[GKLocalPlayer localPlayer];
  if ([v9 isAuthenticated])
  {
    id v10 = +[GKLocalPlayer localPlayer];
    BOOL v11 = [v10 internal];
    char v12 = [v11 playerID];
    char v13 = [v12 isEqualToString:v8];

    if (v13) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  if (!os_log_GKGeneral) {
    id v14 = GKOSLoggers();
  }
  id v15 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "Local player is no longer authenticated or local player changed. Will disconnect.", (uint8_t *)&v16, 2u);
  }
  [(GKMatch *)self disconnect];
LABEL_14:
}

- (void)putMultiplayerGroup
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKMatch *)self groupIdentifier];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v4 UUIDString];
    [(GKMatch *)self setGroupIdentifier:v5];
  }
  if (!os_log_GKGeneral) {
    id v6 = GKOSLoggers();
  }
  id v7 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    uint64_t v9 = [(GKMatch *)self groupIdentifier];
    *(_DWORD *)buf = 138412290;
    v41 = v9;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Creating group for game: %@", buf, 0xCu);
  }
  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  BOOL v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    char v12 = v11;
    char v13 = [(GKMatch *)self playersByJoinType];
    *(_DWORD *)buf = 138412290;
    v41 = v13;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "playersByJoinType - %@", buf, 0xCu);
  }
  id v14 = [(GKMatch *)self connectedPlayers];
  id v15 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v35 + 1) + 8 * v20) internal];
        uint64_t v22 = [v21 playerID];

        if (v22)
        {
          int v23 = [(GKMatch *)self playersByJoinType];
          id v24 = [v23 objectForKeyedSubscript:v22];

          if (v24 && [v24 integerValue] != 4 && objc_msgSend(v24, "integerValue")) {
            [v15 addObject:v22];
          }
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }

  if ([v15 count])
  {
    long long v34 = [(GKMatch *)self transportContext];
    __int16 v25 = [v34 daemonProxy];
    long long v26 = [(GKMatch *)self groupIdentifier];
    __int16 v27 = [MEMORY[0x1E4F1C9C8] now];
    [v27 timeIntervalSince1970];
    uint64_t v29 = (uint64_t)(v28 * 1000.0);
    v30 = [MEMORY[0x1E4F28B50] mainBundle];
    __int16 v31 = [v30 bundleIdentifier];
    id v32 = [(GKMatch *)self matchmaker];
    uint64_t v33 = [v32 autoMatchedPlayers];
    objc_msgSend(v25, "putMultiPlayerGroup:participants:playedAt:bundleID:numberOfAutomatched:handler:", v26, v15, v29, v31, objc_msgSend(v33, "count"), &__block_literal_global_286);
  }
}

- (void)addPlayerToGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Attempting to update a group with playerID: %@", buf, 0xCu);
    }
    id v7 = [(GKMatch *)self playersByJoinType];
    id v8 = [v7 objectForKeyedSubscript:v4];

    if (v8 && [v8 integerValue] != 4 && objc_msgSend(v8, "integerValue"))
    {
      objc_initWeak((id *)buf, self);
      uint64_t v9 = [(GKMatch *)self transportContext];
      id v10 = [v9 daemonProxy];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __28__GKMatch_addPlayerToGroup___block_invoke;
      v11[3] = &unk_1E646F038;
      objc_copyWeak(&v13, (id *)buf);
      id v12 = v4;
      [v10 getMultiPlayerGroups:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __28__GKMatch_addPlayerToGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v38 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
      BOOL v11 = [v10 groupID];
      id v12 = [WeakRetained groupIdentifier];
      char v13 = [v11 isEqualToString:v12];

      if (v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v10;

    if (!v14) {
      goto LABEL_16;
    }
    if (!os_log_GKGeneral) {
      id v15 = GKOSLoggers();
    }
    uint64_t v16 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v16;
      uint64_t v18 = [v14 groupID];
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v18;
      _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "Group already exists for game, updating: %@", buf, 0xCu);
    }
    uint64_t v33 = [v14 participants];
    uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v33];
    uint64_t v20 = (void *)[v19 mutableCopy];

    id v32 = v20;
    [v20 addObject:*(void *)(a1 + 32)];
    __int16 v31 = [WeakRetained transportContext];
    id v21 = [v31 daemonProxy];
    uint64_t v22 = [v14 groupID];
    int v23 = [v20 allObjects];
    id v24 = [MEMORY[0x1E4F28B50] mainBundle];
    __int16 v25 = [v24 bundleIdentifier];
    uint64_t v26 = [v14 numberOfAutomached];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __28__GKMatch_addPlayerToGroup___block_invoke_288;
    v34[3] = &unk_1E646F010;
    id v35 = v14;
    id v36 = *(id *)(a1 + 32);
    id v27 = v14;
    [v21 putMultiPlayerGroup:v22 participants:v23 playedAt:0 bundleID:v25 numberOfAutomatched:v26 handler:v34];
  }
  else
  {
LABEL_9:

LABEL_16:
    if (!os_log_GKGeneral) {
      id v28 = GKOSLoggers();
    }
    uint64_t v29 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v30 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v30;
      _os_log_impl(&dword_1C2D22000, v29, OS_LOG_TYPE_INFO, "Group does not exist yet, waiting for it to be created when game starts, not adding %@ yet", buf, 0xCu);
    }
  }
}

void __28__GKMatch_addPlayerToGroup___block_invoke_288(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    id v5 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __28__GKMatch_addPlayerToGroup___block_invoke_288_cold_1(a1, v5);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    uint64_t v7 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = v7;
      id v10 = [v8 groupID];
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138412546;
      char v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "Group %@ updated adding player: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (id)getConnectionContextForPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMatch *)self playerFromID:v4];
  if (v5)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x3032000000;
    __int16 v14 = __Block_byref_object_copy__6;
    uint64_t v15 = __Block_byref_object_dispose__6;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__GKMatch_getConnectionContextForPlayerID___block_invoke;
    v8[3] = &unk_1E646F060;
    id v10 = &v11;
    id v9 = v4;
    [(GKMatch *)self withEventQueueForPlayer:v5 perform:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __43__GKMatch_getConnectionContextForPlayerID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "player event queue does not exist for %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)updateConnectionInfo:(id)a3 forPlayerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(GKMatch *)self playerFromID:v7];
  if (v8)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__6;
    uint64_t v19 = __Block_byref_object_dispose__6;
    id v20 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__GKMatch_updateConnectionInfo_forPlayerID___block_invoke;
    v11[3] = &unk_1E646F088;
    id v12 = v6;
    __int16 v14 = &v15;
    id v13 = v7;
    [(GKMatch *)self withEventQueueForPlayer:v8 perform:v11];
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __44__GKMatch_updateConnectionInfo_forPlayerID___block_invoke(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 connectionInfo];
    [v6 addEntriesFromDictionary:a1[4]];

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    int v8 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[5];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "player event queue does not exist for %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)getLocalConnectionDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatch: getLocalConnectionDataWithCompletionHandler:", v8, 2u);
  }
  id v7 = [(GKMatch *)self transport];
  [v7 localConnectionDataWithCompletionHandler:v4];
}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  uint64_t v5 = [(GKMatch *)self inviteDelegate];
  if (v5
    && (id v6 = (void *)v5,
        [(GKMatch *)self inviteDelegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v10 = [(GKMatch *)self inviteDelegate];
    [v10 setAutomatchPlayerCount:a3];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v9 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatch setAutomatchPlayerCount:]();
    }
  }
}

- (void)updateEventQueueForInviter:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Update with inviter: %@", buf, 0xCu);
  }
  id v9 = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  [(GKMatch *)self addPlayers:v7];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__GKMatch_updateEventQueueForInviter___block_invoke;
  v8[3] = &unk_1E646EFE8;
  void v8[4] = self;
  [(GKMatch *)self withEventQueueForPlayer:v4 createIfNeeded:1 perform:v8];
}

uint64_t __38__GKMatch_updateEventQueueForInviter___block_invoke(uint64_t result)
{
  return result;
}

- (void)cancelPendingConnectionCheckWithReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Canceling existing match pending connection checker for: %@.", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(GKMatch *)self pendingConnectionChecker];
  [v7 cancel];
}

- (void)connectToPlayers:(id)a3 version:(unsigned __int8)a4 invitedByLocalPlayer:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  unsigned int v53 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if (!os_log_GKGeneral) {
    id v11 = GKOSLoggers();
  }
  uint64_t v12 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v66 = v9;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "connect to players: %@", buf, 0xCu);
  }
  if (!os_log_GKGeneral) {
    id v13 = GKOSLoggers();
  }
  __int16 v14 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    id v16 = [(GKMatch *)self transportContext];
    uint64_t v17 = [v16 peerDictionaries];
    *(_DWORD *)buf = 138412290;
    id v66 = v17;
    _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "make connection with peerDictionaries %@", buf, 0xCu);
  }
  uint64_t v18 = +[GKReporter reporter];
  [v18 recordConnectingDevicesTimestamp];

  uint64_t v19 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touchdowns on level 1\"";
  if ([v9 count])
  {
    id v51 = v10;
    id v52 = v9;
    [(GKMatch *)self addPlayers:v9];
    if ([(GKMatch *)self version] > v53)
    {
      [(GKMatch *)self sendVersionData:v53];
      [(GKMatch *)self setVersion:v53];
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v20 = [(GKMatch *)self transport];
    id v21 = [(GKMatch *)self transportContext];
    uint64_t v22 = [v21 peerDictionaries];
    int v23 = [v20 enrichPeerDictionariesForPlayersConnection:v22];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v29 = [v28 objectForKey:@"player-id"];
          v30 = [(GKThreadsafeDictionary *)self->_playersByIdentifier objectForKey:v29];
          if (v30)
          {
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke;
            v57[3] = &unk_1E646F0B0;
            char v58 = v53;
            BOOL v59 = v7;
            v57[4] = v28;
            v57[5] = self;
            [(GKMatch *)self withEventQueueForPlayer:v30 createIfNeeded:1 perform:v57];
            if (v7)
            {
              if (!os_log_GKGeneral) {
                id v31 = GKOSLoggers();
              }
              id v32 = os_log_GKMatch;
              if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v66 = v52;
                _os_log_debug_impl(&dword_1C2D22000, v32, OS_LOG_TYPE_DEBUG, "Perform a pending connection check for invitees: %@.", buf, 0xCu);
              }
              [(GKMatch *)self refreshPendingConnectionCheckIfNeeded];
            }
          }
          else
          {
            if (!os_log_GKGeneral) {
              id v33 = GKOSLoggers();
            }
            long long v34 = os_log_GKMatch;
            if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v66 = v29;
              _os_log_impl(&dword_1C2D22000, v34, OS_LOG_TYPE_INFO, "Missing player for playerID: %@ while connecting to players", buf, 0xCu);
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v64 count:16];
      }
      while (v25);
    }

    id v35 = [(GKMatch *)self inviteDelegate];

    id v10 = v51;
    if (v35)
    {
      id v36 = [(GKMatch *)self inviteDelegate];
      id v9 = v52;
      [(GKMatch *)self sendConnectingStateCallbackToDelegate:v36 forPlayers:v52];

      long long v37 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touch"
            "downs on level 1\"";
      uint64_t v19 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touch"
            "downs on level 1\"";
    }
    else
    {
      id v9 = v52;
      long long v37 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touch"
            "downs on level 1\"";
      uint64_t v19 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touch"
            "downs on level 1\"";
      if (!os_log_GKGeneral) {
        id v39 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        -[GKMatch connectToPlayers:version:invitedByLocalPlayer:completionHandler:]();
      }
    }
    long long v40 = +[GKReporter reporter];
    objc_msgSend(v40, "reportEvent:type:count:", @"com.apple.GameKit.multiplayer.realtime.connectionType", @"realtime.allConnectionAttempt", objc_msgSend(v9, "count"));

    if (!os_log_GKGeneral) {
      id v41 = GKOSLoggers();
    }
    uint64_t v42 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v43 = NSNumber;
      unint64_t expectedPlayerCount = self->_expectedPlayerCount;
      NSNotificationName v45 = v42;
      v46 = [v43 numberWithUnsignedInteger:expectedPlayerCount];
      *(_DWORD *)buf = *((void *)v37 + 470);
      id v66 = v46;
      _os_log_impl(&dword_1C2D22000, v45, OS_LOG_TYPE_INFO, "Connecting to peers, expecting: %@", buf, 0xCu);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v38 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKMatch connectToPlayers:version:invitedByLocalPlayer:completionHandler:]();
    }
  }
  if ([v9 count]
    || ([(GKMatch *)self transportContext],
        v47 = objc_claimAutoreleasedReturnValue(),
        char v48 = [v47 allowEarlyConnection],
        v47,
        (v48 & 1) != 0))
  {
    v49 = [(GKMatch *)self transport];
    v50 = [(GKMatch *)self transportContext];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = *((void *)v19 + 462);
    v54[2] = __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_301;
    v54[3] = &unk_1E646D978;
    id v55 = v9;
    id v56 = v10;
    [v49 connectToPlayersWithTransportContext:v50 completionHandler:v54];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 connectionInfo];

  if (v4)
  {
    id v5 = [v3 connectionInfo];
    [v5 addEntriesFromDictionary:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 32)];
    [v3 setConnectionInfo:v5];
  }

  id v6 = [v3 connectionInfo];
  BOOL v7 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 48)];
  [v6 setObject:v7 forKey:@"match-version"];

  [v3 setInvitedByLocalPlayer:*(unsigned __int8 *)(a1 + 49)];
  int v8 = [*(id *)(a1 + 32) objectForKey:@"num-players"];
  unsigned int v9 = [v8 intValue];

  if (v9 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v11 = a1 + 40;
  *(void *)(v12 + 176) += (int)v10;
  if (!os_log_GKGeneral) {
    id v13 = GKOSLoggers();
  }
  __int16 v14 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_cold_1(v14, v10, v11);
  }
}

void __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_301(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_301_cold_1();
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Connection requested handler for players: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    uint64_t v11 = [v6 internal];
    uint64_t v12 = [v11 debugDescription];
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "Connect to guest player - player: %@ hostPlayer:%@", buf, 0x16u);
  }
  id v13 = [(GKMatch *)self transport];
  int v14 = [v13 connectToGuestPlayer:v6 withHostPlayer:v7];

  if (v14)
  {
    id v20 = v6;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [(GKMatch *)self addPlayers:v15];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__GKMatch_connectToGuestPlayer_withHostPlayer___block_invoke;
    v17[3] = &unk_1E646F0D8;
    id v18 = v6;
    id v19 = v7;
    [(GKMatch *)self withEventQueueForPlayer:v18 createIfNeeded:1 perform:v17];
    id v16 = +[GKReporter reporter];
    [v16 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionType" type:@"realtime.allConnectionAttempt" count:2];
  }
}

void __47__GKMatch_connectToGuestPlayer_withHostPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPlayerState:1];
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __47__GKMatch_connectToGuestPlayer_withHostPlayer___block_invoke_cold_1(a1, v5);
  }
  [v3 setHostPlayer:*(void *)(a1 + 40)];
}

- (id)nearbyConnectionData
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "GKMatch: nearbyConnectionData", v8, 2u);
  }
  id v5 = [(GKMatch *)self transport];
  id v6 = [v5 nearbyConnectionData];

  return v6;
}

- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    uint64_t v11 = [v6 internal];
    uint64_t v12 = [v11 debugDescription];
    *(_DWORD *)buf = 138412290;
    id v38 = v12;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "Connect to nearby player: %@", buf, 0xCu);
  }
  id v13 = +[GKReporter reporter];
  [v13 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.allMatchTotal"];

  int v14 = +[GKReporter reporter];
  [v14 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.nearbyMatchTotal"];

  id v36 = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  [(GKMatch *)self addPlayers:v15];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__GKMatch_connectToNearbyPlayer_withConnectionData___block_invoke;
  v31[3] = &unk_1E646F100;
  id v16 = v6;
  id v32 = v16;
  id v17 = v7;
  id v33 = v17;
  long long v34 = self;
  [(GKMatch *)self withEventQueueForPlayer:v16 createIfNeeded:1 perform:v31];
  if (!os_log_GKGeneral) {
    id v18 = GKOSLoggers();
  }
  id v19 = (void *)os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    id v20 = v19;
    id v21 = [v16 internal];
    uint64_t v22 = [v21 debugDescription];
    *(_DWORD *)buf = 138412290;
    id v38 = v22;
    _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "GKMatch: connectToNearbyPlayer: %@ - connecting to participant with session info: nil", buf, 0xCu);
  }
  __int16 v23 = [(GKMatch *)self inviteDelegate];

  if (v23)
  {
    id v24 = [(GKMatch *)self inviteDelegate];
    id v35 = v16;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    [(GKMatch *)self sendConnectingStateCallbackToDelegate:v24 forPlayers:v25];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v26 = GKOSLoggers();
    }
    id v27 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKMatch connectToNearbyPlayer:withConnectionData:](v27);
    }
  }
  id v28 = [(GKMatch *)self transportContext];
  [v28 updateForLegacyNearbyInvite];

  uint64_t v29 = [(GKMatch *)self transport];
  [v29 connectToNearbyPlayer:v16 withConnectionData:v17];

  v30 = +[GKReporter reporter];
  [v30 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionType" type:@"realtime.allConnectionAttempt"];
}

void __52__GKMatch_connectToNearbyPlayer_withConnectionData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) referenceKey];
  id v5 = [v3 connectionInfo];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v3 setConnectionInfo:v6];
  }
  id v7 = [v3 connectionInfo];
  [v7 setObject:v4 forKey:@"peer-id"];

  id v8 = [v3 connectionInfo];
  [v8 setObject:*(void *)(a1 + 40) forKey:@"peer-blob"];

  uint64_t v9 = [v3 connectionInfo];
  uint64_t v11 = *(void **)(a1 + 48);
  uint64_t v10 = (id *)(a1 + 48);
  uint64_t v12 = [v11 nearbyConnectionData];
  [v9 setObject:v12 forKey:@"self-blob"];

  id v13 = [v3 connectionInfo];
  int v14 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(*v10, "version"));
  [v13 setObject:v14 forKey:@"match-version"];

  uint64_t v15 = [v3 connectionInfo];
  id v16 = [NSNumber numberWithBool:1];
  [v15 setObject:v16 forKey:@"nearby"];

  ++*((void *)*v10 + 22);
  if (!os_log_GKGeneral) {
    id v17 = GKOSLoggers();
  }
  id v18 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __52__GKMatch_connectToNearbyPlayer_withConnectionData___block_invoke_cold_1((uint64_t)v10, v18);
  }
}

- (id)packet:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(GKMatchPacket);
  [(GKMatchPacket *)v7 setPacketType:v4];
  id v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(GKMatch *)v8 packetSequenceNumber] + 1;
  [(GKMatch *)v8 setPacketSequenceNumber:v9];
  objc_sync_exit(v8);

  [(GKMatchPacket *)v7 setSequenceNumber:v9];
  [(GKMatchPacket *)v7 setData:v6];
  uint64_t v10 = [(GKMatchPacket *)v7 message];

  return v10;
}

- (void)syncPlayers:(id)a3 forJoinType:(int)a4 toInvitees:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v9 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke;
    v10[3] = &unk_1E646F128;
    id v11 = v9;
    int v14 = a4;
    id v12 = v8;
    id v13 = self;
    +[GKPlayer loadPlayersForLegacyIdentifiers:v11 withCompletionHandler:v10];
  }
}

void __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke_cold_2();
    }
  }
  else
  {
    v31[0] = @"GKMatchJoinType";
    id v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    v31[1] = @"playerIDs";
    v32[0] = v9;
    v32[1] = *(void *)(a1 + 40);
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

    id v22 = 0;
    id v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:&v22];
    id v7 = v22;
    if (v7)
    {
      if (!os_log_GKGeneral) {
        id v12 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke_cold_1();
      }
    }
    else
    {
      id v13 = [*(id *)(a1 + 48) packet:8 data:v11];
      int v14 = [*(id *)(a1 + 48) transport];
      uint64_t v15 = [*(id *)(a1 + 48) transportContext];
      id v21 = 0;
      [v14 sendScopedData:v13 toPlayers:v5 dataMode:0 dataScope:0 transportContext:v15 error:&v21];
      id v16 = v21;

      if (v16)
      {
        if (!os_log_GKGeneral) {
          id v17 = GKOSLoggers();
        }
        id v18 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          id v24 = v5;
          __int16 v25 = 2112;
          id v26 = v10;
          __int16 v27 = 2112;
          id v28 = v13;
          __int16 v29 = 2112;
          uint64_t v30 = 0;
          _os_log_error_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_ERROR, "Failed to sync data to players: %@, dict: %@, data: %@, error: %@", buf, 0x2Au);
        }
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v19 = GKOSLoggers();
        }
        id v20 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v24 = v5;
          __int16 v25 = 2112;
          id v26 = v10;
          __int16 v27 = 2112;
          id v28 = v13;
          _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "Sent sync data to players: %@, dict: %@, data: %@", buf, 0x20u);
        }
      }
    }
  }
}

- (void)receivedPlayerSyncData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v17 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v17];
  id v5 = v17;
  id v6 = [v4 objectForKeyedSubscript:@"GKMatchJoinType"];
  uint64_t v7 = [v6 integerValue];

  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  id v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = NSNumber;
    id v11 = v9;
    id v12 = [v10 numberWithUnsignedInt:v7];
    *(_DWORD *)buf = 138412546;
    id v19 = v4;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "receivedPlayerSyncData, dict: %@, joinType: %@", buf, 0x16u);
  }
  id v13 = [v4 objectForKeyedSubscript:@"playerIDs"];
  int v14 = [v13 allObjects];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __34__GKMatch_receivedPlayerSyncData___block_invoke;
  v15[3] = &unk_1E646F150;
  int v16 = v7;
  void v15[4] = self;
  +[GKPlayer loadPlayersForLegacyIdentifiers:v14 withCompletionHandler:v15];
}

void __34__GKMatch_receivedPlayerSyncData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = *(_DWORD *)(a1 + 40);
  if ((v7 - 1) < 3 || v7 == 5)
  {
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = [v5 _gkPlayersIDsFromPlayers];
    id v11 = [v9 setWithArray:v10];

    id v12 = [*(id *)(a1 + 32) matchmaker];
    id v13 = [v12 siblingInvitees];
    [v13 unionSet:v11];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    int v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(a1 + 32), "updateJoinedPlayer:joinType:", *(void *)(*((void *)&v33 + 1) + 8 * i), 5, (void)v33);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v16);
    }

    goto LABEL_14;
  }
  if (v7 == 4)
  {
    id v19 = [*(id *)(a1 + 32) matchmaker];
    __int16 v20 = [v19 autoMatchedPlayers];
    id v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = [v5 _gkPlayersIDsFromPlayers];
    __int16 v23 = [v21 setWithArray:v22];
    [v20 unionSet:v23];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    int v14 = [v5 _gkPlayersIDsFromPlayers];
    uint64_t v24 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(a1 + 32) updateJoinedPlayer:*(void *)(*((void *)&v37 + 1) + 8 * j) joinType:4];
        }
        uint64_t v25 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v25);
    }
    goto LABEL_14;
  }
  if (!os_log_GKGeneral) {
    id v28 = GKOSLoggers();
  }
  __int16 v29 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = NSNumber;
    uint64_t v31 = *(unsigned int *)(a1 + 40);
    int v14 = v29;
    id v32 = [v30 numberWithUnsignedInt:v31];
    *(_DWORD *)buf = 138412546;
    uint64_t v42 = v32;
    __int16 v43 = 2112;
    id v44 = v5;
    _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "receivedPlayerSyncData, joinType: %@ not doing anything for players: %@", buf, 0x16u);

LABEL_14:
  }
}

- (id)makeInviteMessageDoneData
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(GKMatch *)self propertiesByPlayerID];
  id v5 = [v4 allObjects];
  id v6 = [v3 makeInviteMessageDoneWithProperties:v5];

  return v6;
}

- (void)sendInviteData:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMatch *)self transportContext];
  int v6 = [v5 validTransportSelected];

  if (v6)
  {
    [(GKMatch *)self sendInviteData:v4 withScope:0];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKMatch sendInviteData:](v8);
    }
  }
}

- (void)sendInviteData:(id)a3 withScope:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if ([(GKMatch *)self version])
  {
    id v7 = [(GKMatch *)self packet:2 data:v6];
  }
  id v8 = [(GKMatch *)self transport];
  id v9 = [(GKMatch *)self transportContext];
  id v13 = 0;
  [v8 sendScopedDataToAll:v7 dataMode:0 dataScope:a4 transportContext:v9 error:&v13];
  id v10 = v13;

  if (v10)
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    id v12 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Failed to send invite data, error: %@", buf, 0xCu);
    }
  }
}

- (BOOL)sendPacketDataToAll:(id)a3 packetType:(unsigned __int8)a4 dataMode:(int64_t)a5 error:(id *)a6
{
  id v9 = [(GKMatch *)self packet:a4 data:a3];
  id v10 = [(GKMatch *)self transport];
  id v11 = [(GKMatch *)self transportContext];
  LOBYTE(a6) = [v10 sendScopedDataToAll:v9 dataMode:a5 dataScope:0 transportContext:v11 error:a6];

  return (char)a6;
}

- (void)sendVersionData:(unsigned __int8)a3
{
  unsigned __int8 v14 = a3;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "GKMatch: sendVersionData", buf, 2u);
  }
  if ([(GKMatch *)self version])
  {
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v14 length:1];
    id v7 = [(GKMatch *)self packet:1 data:v6];

    id v8 = [(GKMatch *)self transport];
    id v9 = [(GKMatch *)self transportContext];
    id v12 = 0;
    [v8 sendScopedDataToAll:v7 dataMode:0 dataScope:0 transportContext:v9 error:&v12];
    id v10 = v12;

    if (v10)
    {
      if (!os_log_GKGeneral) {
        id v11 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        -[GKMatch sendVersionData:]();
      }
    }
  }
}

- (void)sendVersionData:(unsigned __int8)a3 toPlayer:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v15 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v15 length:1];
  id v7 = [(GKMatch *)self packet:1 data:v6];

  id v8 = [(GKMatch *)self transport];
  v16[0] = v5;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v10 = [(GKMatch *)self transportContext];
  id v14 = 0;
  [v8 sendScopedData:v7 toPlayers:v9 dataMode:0 dataScope:0 transportContext:v10 error:&v14];
  id v11 = v14;

  if (v11)
  {
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    id v13 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      -[GKMatch sendVersionData:toPlayer:](v13);
    }
  }
}

- (void)queueData:(id)a3 withEventQueueForPlayer:(id)a4 forRecipient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__GKMatch_queueData_withEventQueueForPlayer_forRecipient___block_invoke;
  v12[3] = &unk_1E646F0D8;
  id v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  [(GKMatch *)self withEventQueueForPlayer:a4 perform:v12];
}

void __58__GKMatch_queueData_withEventQueueForPlayer_forRecipient___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v5 = objc_alloc_init(GKMatchEvent);
    [(GKMatchEvent *)v5 setRecipientPlayer:*(void *)(a1 + 32)];
    [(GKMatchEvent *)v5 setData:*(void *)(a1 + 40)];
    id v4 = [v3 events];

    [v4 addObject:v5];
  }
}

- (void)deliverData:(id)a3 forRecipient:(id)a4 fromPlayer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __47__GKMatch_deliverData_forRecipient_fromPlayer___block_invoke;
  id v18 = &unk_1E646F178;
  uint64_t v22 = &v23;
  id v11 = v10;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  id v13 = v8;
  id v21 = v13;
  [(GKMatch *)self withEventQueueForPlayer:v11 createIfNeeded:1 perform:&v15];
  if (*((unsigned char *)v24 + 24))
  {
    id v14 = [(GKMatch *)self delegate];
    [(GKMatch *)self _delegate:v14 didReceiveData:v13 forRecipient:v12 fromPlayer:v11];
  }
  _Block_object_dispose(&v23, 8);
}

void __47__GKMatch_deliverData_forRecipient_fromPlayer___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if ([v3 okToSend])
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v5 = GKOSLoggers();
      }
      id v6 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        id v7 = (void *)a1[4];
        id v8 = v6;
        id v9 = [v7 internal];
        id v10 = [v9 conciseDescription];
        int v13 = 138412290;
        id v14 = v10;
        _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Queuing data for player: %@ (not ready)", (uint8_t *)&v13, 0xCu);
      }
      id v11 = objc_alloc_init(GKMatchEvent);
      [(GKMatchEvent *)v11 setRecipientPlayer:a1[5]];
      [(GKMatchEvent *)v11 setData:a1[6]];
      id v12 = [v4 events];
      [v12 addObject:v11];
    }
  }
}

- (void)sendQueuedStatesAndPackets
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(GKMatch *)self players];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v22;
    *(void *)&long long v3 = 138412546;
    long long v16 = v3;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v6 = objc_msgSend(v5, "internal", v16);
        id v7 = [v6 playerID];

        id v8 = self->_playerEventQueues;
        objc_sync_enter(v8);
        id v9 = [(NSMutableDictionary *)self->_playerEventQueues objectForKey:v7];
        id v10 = v9;
        if (v9)
        {
          uint64_t v11 = [v9 deferedPlayerState];
          uint64_t v12 = [v10 playerState];
          [v10 setDeferedPlayerState:0];
          if (!os_log_GKGeneral) {
            id v13 = GKOSLoggers();
          }
          id v14 = (id)os_log_GKMatch;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = [v5 internal];
            uint64_t v15 = [v17 debugDescription];
            *(_DWORD *)buf = v16;
            char v26 = v15;
            __int16 v27 = 2112;
            id v28 = &unk_1F1E7EB28;
            _os_log_debug_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_DEBUG, "_playerEventQueues for player %@ changed deferedPlayerState to %@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v12 = 0;
          uint64_t v11 = 0;
        }

        objc_sync_exit(v8);
        if (v11) {
          [(GKMatch *)self sendStateCallbackForPlayer:v5 state:v11];
        }
        if (v12 == 1) {
          [(GKMatch *)self sendQueuedPacketsForPlayer:v5];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v20);
  }
}

- (void)sendQueuedPacketsForPlayer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__GKMatch_sendQueuedPacketsForPlayer___block_invoke;
  v6[3] = &unk_1E646F0D8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(GKMatch *)self withEventQueueForPlayer:v5 perform:v6];
}

void __38__GKMatch_sendQueuedPacketsForPlayer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v3;
    obuint64_t j = [v3 events];
    uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (!os_log_GKGeneral) {
            id v8 = GKOSLoggers();
          }
          id v9 = os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "Calling delegate with saved peer data", buf, 2u);
          }
          id v10 = *(void **)(a1 + 32);
          uint64_t v11 = [v10 delegate];
          uint64_t v12 = [v7 data];
          id v13 = [v7 recipientPlayer];
          [v10 _delegate:v11 didReceiveData:v12 forRecipient:v13 fromPlayer:*(void *)(a1 + 40)];
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v4);
    }

    id v14 = [v17 events];
    [v14 removeAllObjects];

    [v17 setOkToSend:1];
    id v15 = *(id *)(*(void *)(a1 + 32) + 88);
    objc_sync_enter(v15);
    long long v16 = [*(id *)(a1 + 40) referenceKey];
    if (([*(id *)(*(void *)(a1 + 32) + 88) containsObject:v16] & 1) == 0) {
      [*(id *)(*(void *)(a1 + 32) + 88) addObject:v16];
    }

    objc_sync_exit(v15);
    id v3 = v17;
  }
}

- (void)deferStateCallbackForPlayer:(id)a3 state:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  id v8 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [(GKMatch *)self stringForGKPlayerConnectionState:a4];
    uint64_t v11 = [v6 internal];
    uint64_t v12 = [v11 debugDescription];
    *(_DWORD *)buf = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    long long v20 = v12;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "defering GKPlayerConnectionState: %@ callback for player: %@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke;
  v14[3] = &unk_1E646F1A0;
  id v15 = v6;
  int64_t v16 = a4;
  id v13 = v6;
  [(GKMatch *)self withEventQueueForPlayer:v13 perform:v14];
}

void __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke_cold_1();
  }
  uint64_t v4 = v3;
  [v3 setDeferedPlayerState:*(void *)(a1 + 40)];
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke_cold_2(a1, v6, (void *)(a1 + 40));
  }
}

- (void)updateStateForPlayer:(id)a3 state:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  id v8 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [v6 internal];
    uint64_t v11 = [v10 debugDescription];
    uint64_t v12 = [(GKMatch *)self stringForGKPlayerConnectionState:a4];
    *(_DWORD *)buf = 138412546;
    long long v24 = v11;
    __int16 v25 = 2112;
    char v26 = v12;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "Updating GKPlayerConnectionState for player: %@ to %@", buf, 0x16u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__GKMatch_updateStateForPlayer_state___block_invoke;
  v20[3] = &unk_1E646F1C8;
  v20[4] = self;
  int64_t v22 = a4;
  id v13 = v6;
  id v21 = v13;
  [(GKMatch *)self withEventQueueForPlayer:v13 createIfNeeded:1 perform:v20];
  if (!os_log_GKGeneral) {
    id v14 = GKOSLoggers();
  }
  id v15 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int64_t v16 = NSNumber;
    unint64_t expectedPlayerCount = self->_expectedPlayerCount;
    id v18 = v15;
    __int16 v19 = [v16 numberWithUnsignedInteger:expectedPlayerCount];
    *(_DWORD *)buf = 138412290;
    long long v24 = v19;
    _os_log_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_INFO, "expecting %@ more players", buf, 0xCu);
  }
}

void __38__GKMatch_updateStateForPlayer_state___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    if (([v3 counted] & 1) == 0)
    {
      id v6 = (id *)(a1 + 4);
      uint64_t v5 = a1[4];
      uint64_t v7 = *(void *)(v5 + 176);
      if (v7)
      {
        *(void *)(v5 + ++*(void *)(*(void *)(result + 32) + 176) = v7 - 1;
        if (!os_log_GKGeneral) {
          id v8 = GKOSLoggers();
        }
        id v9 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
          __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_3((uint64_t)(a1 + 4), v9);
        }
        if (!*((void *)*v6 + 22))
        {
          if (!os_log_GKGeneral) {
            id v10 = GKOSLoggers();
          }
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
            __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_2();
          }
          [*v6 updateRematchID];
        }
      }
      [v4 setCounted:1];
    }
    if (a1[6] == 2)
    {
      uint64_t v12 = (void *)a1[5];
      uint64_t v11 = (uint64_t)(a1 + 5);
      id v13 = [v12 internal];
      id v14 = [v13 playerID];

      [*(id *)(*(void *)(v11 - 8) + 56) removeObjectForKey:v14];
      [*(id *)(*(void *)(v11 - 8) + 32) removeObject:v14];
      if (!os_log_GKGeneral) {
        id v15 = GKOSLoggers();
      }
      int64_t v16 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_1(v11, v16);
      }
    }
  }
}

- (void)sendStateCallbackForPlayer:(id)a3 state:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_expectedPlayerCount)
  {
    uint64_t v7 = +[GKReporter reporter];
    [v7 reportConnectingDevicesDuration];

    id v8 = +[GKReporter reporter];
    [v8 reportProgramaticInviteDuration];
  }
  id v9 = [(GKMatch *)self delegate];
  if (v9)
  {

LABEL_6:
    uint64_t v11 = [(GKMatch *)self delegate];

    if (v11)
    {
      uint64_t v12 = [(GKMatch *)self delegate];
      [(GKMatch *)self sendStateCallbackToDelegate:v12 forPlayer:v6 state:a4];
    }
    id v13 = [(GKMatch *)self inviteDelegate];

    if (v13)
    {
      id v14 = [(GKMatch *)self inviteDelegate];
      [(GKMatch *)self sendStateCallbackToDelegate:v14 forPlayer:v6 state:a4];
    }
    goto LABEL_10;
  }
  id v10 = [(GKMatch *)self inviteDelegate];

  if (v10) {
    goto LABEL_6;
  }
  if (!os_log_GKGeneral) {
    id v15 = GKOSLoggers();
  }
  int64_t v16 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
  {
    id v17 = v16;
    id v18 = [v6 internal];
    __int16 v19 = [v18 debugDescription];
    long long v20 = [NSNumber numberWithInteger:a4];
    int v21 = 138412802;
    int64_t v22 = v19;
    __int16 v23 = 2112;
    long long v24 = v20;
    __int16 v25 = 2048;
    char v26 = self;
    _os_log_error_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_ERROR, "Cannot send state call back for player: %@, state: %@, due to missing delegates set for GKMatch: %p", (uint8_t *)&v21, 0x20u);
  }
LABEL_10:
}

- (void)sendStateCallbackToDelegate:(id)a3 forPlayer:(id)a4 state:(int64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(GKMatch *)self updateStateForPlayer:v9 state:a5];
  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  uint64_t v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v11;
    id v13 = [(GKMatch *)self stringForGKPlayerConnectionState:a5];
    id v14 = [v9 internal];
    id v15 = [v14 debugDescription];
    *(_DWORD *)buf = 138412802;
    id v38 = v8;
    __int16 v39 = 2112;
    long long v40 = v13;
    __int16 v41 = 2112;
    uint64_t v42 = v15;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Informing state change to delegate %@: The GKPlayerConnectionState = %@, for player: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __55__GKMatch_sendStateCallbackToDelegate_forPlayer_state___block_invoke;
    void v32[3] = &unk_1E646F1F0;
    id v33 = v8;
    long long v34 = self;
    id v35 = v9;
    int64_t v36 = a5;
    [v35 updateScopedIDs:v32];
  }
  else if (objc_opt_respondsToSelector())
  {
    if (GKApplicationLinkedOnOrAfter(917504, 659456))
    {
      if (!os_log_GKGeneral) {
        id v16 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        -[GKMatch sendStateCallbackToDelegate:forPlayer:state:]();
      }
    }
    else
    {
      long long v24 = [v9 internal];
      __int16 v25 = [v24 playerID];
      [v8 match:self player:v25 didChangeState:a5];
    }
  }
  else
  {
    uint64_t v17 = [(GKMatch *)self delegate];
    if (v17)
    {
      id v18 = (void *)v17;
      __int16 v19 = [(GKMatch *)self delegate];
      int v20 = [v19 isEqual:v8];

      if (v20)
      {
        if (!os_log_GKGeneral) {
          id v21 = GKOSLoggers();
        }
        int64_t v22 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v22, OS_LOG_TYPE_INFO, "Delegate doesn't respond to state change callback", buf, 2u);
        }
        if (!os_log_GKGeneral) {
          id v23 = GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
          -[GKMatch sendStateCallbackToDelegate:forPlayer:state:]();
        }
      }
    }
  }
  if (a5 == 1)
  {
    if ([(GKMatch *)self fastStartStateActive])
    {
      char v26 = [(GKMatch *)self connectedPlayers];
      unint64_t v27 = [v26 count];
      id v28 = [(GKMatch *)self matchmaker];
      __int16 v29 = [v28 currentMatchRequest];
      unint64_t v30 = [v29 minPlayers];

      if (v27 >= v30)
      {
        uint64_t v31 = [(GKMatch *)self makeInviteMessageDoneData];
        [(GKMatch *)self sendInviteData:v31];
      }
    }
  }
}

void __55__GKMatch_sendStateCallbackToDelegate_forPlayer_state___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__GKMatch_sendStateCallbackToDelegate_forPlayer_state___block_invoke_2;
  v7[3] = &unk_1E646F1F0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v8 = v2;
  uint64_t v9 = v3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __55__GKMatch_sendStateCallbackToDelegate_forPlayer_state___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) match:*(void *)(a1 + 40) player:*(void *)(a1 + 48) didChangeConnectionState:*(void *)(a1 + 56)];
}

- (id)connectedPlayers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = self->_playerEventQueues;
  objc_sync_enter(v4);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(GKMatch *)self players];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) internal];
        id v10 = [v9 playerID];

        uint64_t v11 = [(NSMutableDictionary *)self->_playerEventQueues objectForKey:v10];
        uint64_t v12 = v11;
        if (v11 && [v11 playerState] == 1)
        {
          id v13 = [v12 player];
          [v3 addObject:v13];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);

  return v3;
}

- (void)sendConnectingStateCallbackToDelegate:(id)a3 forPlayers:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v17 = v6;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (!os_log_GKGeneral) {
            id v12 = GKOSLoggers();
          }
          id v13 = (void *)os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            id v14 = v13;
            long long v15 = [v11 internal];
            long long v16 = [v15 debugDescription];
            *(_DWORD *)buf = 138412290;
            long long v24 = v16;
            _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "Informing match inviteDelegate to set connecting state for player %@", buf, 0xCu);
          }
          [v5 setConnectingStateForPlayer:v11];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v8);
    }

    id v6 = v17;
  }
}

- (void)reinviteeAcceptedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"peer-id"];
  if (!os_log_GKGeneral) {
    id v6 = GKOSLoggers();
  }
  uint64_t v7 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v15 = v5;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "Got reinvite acception notification: player(ID: %@) would like to reconnect to this  match...", buf, 0xCu);
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"invite-version"];
  uint64_t v9 = [v8 unsignedCharValue];

  id v10 = [(GKMatch *)self transportContext];
  [v10 updateAfterInviteeAcceptedUserInfo:v4];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__GKMatch_reinviteeAcceptedNotification___block_invoke;
  v12[3] = &unk_1E646F010;
  void v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(GKMatch *)self connectToPlayers:0 version:v9 invitedByLocalPlayer:1 completionHandler:v12];
}

void __41__GKMatch_reinviteeAcceptedNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) handleRelayPushData:*(void *)(a1 + 40) onlyIfPreemptive:1];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32) name:@"GKInviteeAcceptedGameInvite" object:0];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*(void *)(a1 + 32) name:@"GKInviteeDeclinedGameInvite" object:0];
}

- (void)reinviteeDeclinedNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  long long v20 = [v19 userInfo];
  uint64_t v4 = [v20 objectForKey:@"I"];
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v27 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Got reinvite declined notification: player %@ has refused a reconnect to this match...", buf, 0xCu);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:@"GKInviteeAcceptedGameInvite" object:0];

  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:@"GKInviteeDeclinedGameInvite" object:0];

  uint64_t v9 = self->_reinvitedPlayers;
  objc_sync_enter(v9);
  id v10 = self->_reinvitedPlayers;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v10;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v16 = [v15 internal];
        id v17 = [v16 playerID];
        int v18 = [v17 isEqualToString:v4];

        if (v18)
        {
          [(NSMutableArray *)v11 removeObject:v15];
          goto LABEL_15;
        }
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  objc_sync_exit(v9);
}

- (void)conditionallyReinvitePlayer:(id)a3 sessionToken:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  playerPushTokens = self->_playerPushTokens;
  uint64_t v9 = [v6 internal];
  id v10 = [v9 playerID];
  id v11 = [(NSMutableDictionary *)playerPushTokens objectForKey:v10];

  if (v11)
  {
    uint64_t v12 = [(GKMatch *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      int v13 = [v12 match:self shouldReinviteDisconnectedPlayer:v6];
      if (v7)
      {
LABEL_4:
        if (v13)
        {
          id v14 = +[GCFLocalizedStrings GAME_RECONNECT_MESSAGE];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke;
          aBlock[3] = &unk_1E646F240;
          aBlock[4] = self;
          id v27 = v14;
          id v28 = v6;
          id v29 = v7;
          id v30 = v11;
          id v15 = v14;
          uint64_t v16 = _Block_copy(aBlock);
          [(GKMatch *)self getLocalConnectionDataWithCompletionHandler:v16];
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if (!os_log_GKGeneral) {
          id v18 = GKOSLoggers();
        }
        id v19 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          long long v20 = v19;
          long long v21 = [v6 internal];
          long long v22 = [v21 debugDescription];
          *(_DWORD *)buf = 138412290;
          id v32 = v22;
          _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "Player %@ disconnected: do not reinvite...", buf, 0xCu);
        }
        if (!os_log_GKGeneral) {
          id v23 = GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
          -[GKMatch conditionallyReinvitePlayer:sessionToken:]();
        }
        goto LABEL_20;
      }
      if (GKApplicationLinkedOnOrAfter(917504, 659456))
      {
        if (!os_log_GKGeneral) {
          id v17 = GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
          -[GKMatch conditionallyReinvitePlayer:sessionToken:]();
        }
        goto LABEL_20;
      }
      long long v24 = [v6 internal];
      __int16 v25 = [v24 playerID];
      int v13 = [v12 match:self shouldReinvitePlayer:v25];

      if (v7) {
        goto LABEL_4;
      }
    }
LABEL_20:
  }
}

void __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v8 = [*(id *)(a1 + 32) transportContext];
    uint64_t v9 = [v8 daemonProxy];
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [*(id *)(a1 + 48) internal];
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke_2;
    v16[3] = &unk_1E646F218;
    id v17 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 40);
    objc_copyWeak(&v19, &location);
    [v9 sendReconnectInvitation:v10 toPlayer:v11 connectionData:v5 sessionToken:v12 pushToken:v13 handler:v16];

    if (!os_log_GKGeneral) {
      id v14 = GKOSLoggers();
    }
    id v15 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = 0;
      _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "error getLocalConnectionData for re-invite = %@", buf, 0xCu);
    }
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
}

void __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke_2_cold_1();
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      uint64_t v9 = [v7 internal];
      uint64_t v10 = [v9 conciseDescription];
      uint64_t v11 = *(void *)(a1 + 40);
      int v17 = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "re-invite request sent == [%@, %@]...", (uint8_t *)&v17, 0x16u);
    }
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    id v13 = WeakRetained[8];
    objc_sync_enter(v13);
    if (([WeakRetained[8] containsObject:*(void *)(a1 + 32)] & 1) == 0) {
      [WeakRetained[8] addObject:*(void *)(a1 + 32)];
    }
    objc_sync_exit(v13);

    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v15 = +[GKLocalPlayer localPlayer];
    [v14 addObserver:WeakRetained selector:sel_reinviteeAcceptedNotification_ name:@"GKInviteeAcceptedGameInvite" object:v15];

    uint64_t v16 = +[GKLocalPlayer localPlayer];
    [v14 addObserver:WeakRetained selector:sel_reinviteeDeclinedNotification_ name:@"GKInviteeDeclinedGameInvite" object:v16];
  }
}

- (void)conditionallyRelaunchPlayer:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_reinvitedPlayers;
  objc_sync_enter(v5);
  id v6 = self->_reinvitedPlayers;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isEqual:", v4, (void)v18)) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    playerPushTokens = self->_playerPushTokens;
    id v13 = [v4 internal];
    id v14 = [v13 playerID];
    id v15 = [(NSMutableDictionary *)playerPushTokens objectForKey:v14];

    [(NSMutableArray *)v7 removeObject:v11];
    objc_sync_exit(v5);

    if (!v15) {
      goto LABEL_17;
    }
    if (!os_log_GKGeneral) {
      id v16 = GKOSLoggers();
    }
    int v17 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKMatch conditionallyRelaunchPlayer:](v17, v4);
    }
    id v5 = [(GKMatch *)self makeInviteMessageDoneData];
    [(GKMatch *)self sendInviteData:v5];
  }
  else
  {
LABEL_9:

    objc_sync_exit(v5);
  }

LABEL_17:
}

- (void)acceptRelayResponse:(id)a3 player:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(GKMatch *)self transport];
  uint64_t v8 = [v6 internal];

  uint64_t v9 = [v8 playerID];
  [v10 acceptRelayResponse:v7 playerID:v9];
}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(GKMatch *)self transport];
  [v7 handleRelayPushData:v6 onlyIfPreemptive:v4];
}

- (void)preemptRelay:(id)a3
{
  id v4 = a3;
  id v7 = [(GKMatch *)self transport];
  id v5 = [v4 internal];

  id v6 = [v5 playerID];
  [v7 preemptRelay:v6];
}

- (void)relayDidReceivePushData:(id)a3 completionHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  uint64_t v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "relayPush - push notification's userInfo: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v9 = [v6 objectForKey:@"I"];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  char v48 = __Block_byref_object_copy__6;
  v49 = __Block_byref_object_dispose__6;
  id v50 = 0;
  uint64_t v38 = 0;
  __int16 v39 = &v38;
  uint64_t v40 = 0x3032000000;
  __int16 v41 = __Block_byref_object_copy__6;
  uint64_t v42 = __Block_byref_object_dispose__6;
  id v43 = 0;
  id v10 = self->_playerEventQueues;
  objc_sync_enter(v10);
  uint64_t v11 = [(NSMutableDictionary *)self->_playerEventQueues objectForKey:v9];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = [v11 connectionInfo];
    uint64_t v14 = [v13 objectForKey:@"session-token"];
    id v15 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v14;

    if (!os_log_GKGeneral) {
      id v16 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKMatch relayDidReceivePushData:completionHandler:]();
    }
    uint64_t v17 = [v12 player];
    long long v18 = (void *)v39[5];
    v39[5] = v17;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v19 = GKOSLoggers();
    }
    long long v20 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v44 = 138412290;
      NSNotificationName v45 = v9;
      _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "player event queue does not exist for %@", v44, 0xCu);
    }
  }

  objc_sync_exit(v10);
  long long v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatch.m", 1753, "-[GKMatch relayDidReceivePushData:completionHandler:]");
  uint64_t v22 = +[GKDispatchGroup dispatchGroupWithName:v21];

  if (!v39[5])
  {
    if (!os_log_GKGeneral) {
      id v23 = GKOSLoggers();
    }
    long long v24 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v44 = 0;
      _os_log_impl(&dword_1C2D22000, v24, OS_LOG_TYPE_INFO, "no player, bootstrapping player (loading player from identifier)", v44, 2u);
    }
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke;
    v34[3] = &unk_1E646F290;
    int64_t v36 = self;
    long long v37 = &v38;
    id v35 = v9;
    [v22 perform:v34];
  }
  __int16 v25 = dispatch_get_global_queue(0, 0);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_363;
  v29[3] = &unk_1E646F2B8;
  id v32 = &v38;
  p_long long buf = &buf;
  v29[4] = self;
  id v26 = v6;
  id v30 = v26;
  id v27 = v28;
  id v31 = v27;
  [v22 notifyOnQueue:v25 block:v29];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&buf, 8);
}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke(int8x16_t *a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v12[0] = a1[2].i64[0];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_2;
  v8[3] = &unk_1E646F268;
  uint64_t v11 = a1[3].i64[0];
  int8x16_t v7 = a1[2];
  id v5 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  id v10 = v3;
  id v6 = v3;
  +[GKPlayer loadPlayersForIdentifiersPrivate:v4 withCompletionHandler:v8];
}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = [v5 firstObject];
    uint64_t v8 = *(void *)(a1[7] + 8);
    int8x16_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = *(id *)(a1[4] + 56);
    objc_sync_enter(v10);
    uint64_t v11 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
    uint64_t v12 = v11;
    if (v11) {
      [v11 setPlayer:*(void *)(*(void *)(a1[7] + 8) + 40)];
    }

    objc_sync_exit(v10);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v13 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_363(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
LABEL_15:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v4 = [*(id *)(a1 + 40) objectForKey:@"s"];
  id v5 = [v2 dataFromBase64String:v4];
  LOBYTE(v3) = [v3 isEqualToData:v5];

  if ((v3 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    int8x16_t v9 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v12 = *(void **)(a1 + 32);
      id v13 = *(void **)(a1 + 40);
      uint64_t v14 = v9;
      id v15 = [v13 objectForKey:@"s"];
      id v16 = [v12 dataFromBase64String:v15];
      *(_DWORD *)long long buf = 134218498;
      id v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      id v23 = v16;
      _os_log_error_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_ERROR, "relayPush for match: %p - session token doesn't match with this session! - sessionToken from relay push: %@ - sessionToken in this match: %@", buf, 0x20u);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      if (!os_log_GKGeneral) {
        id v10 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_363_cold_1();
      }
    }
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) internal];
  uint64_t v7 = [v17 playerID];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (void)connectionDidChangeWithState:(int)a3 playerID:(id)a4
{
  id v6 = a4;
  stateChangeQueue = self->_stateChangeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke;
  block[3] = &unk_1E646F380;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(stateChangeQueue, block);
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2
    && ([v2 allValues],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
    id v6 = [v5 firstObject];

    uint64_t v7 = [v6 connectionInfo];
    id v8 = [v7 objectForKeyedSubscript:@"session-token"];
  }
  else
  {
    id v8 = @"Unknown";
  }
  if (!os_log_GKGeneral) {
    id v9 = GKOSLoggers();
  }
  id v10 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(unsigned int *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = [v11 stringForGKPeerConnectionState:v12];
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 134218754;
    uint64_t v33 = v11;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    uint64_t v37 = v15;
    __int16 v38 = 2112;
    __int16 v39 = v8;
    _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "GKTransportClientDelegate call back for match: %p - new state: %@ - playerID: %@ - sessionToken: %@.", buf, 0x2Au);
  }
  id v16 = +[GKDispatchGroup dispatchGroupWithName:@"com.apple.gamecenter.match.changestategroup"];
  id v17 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  [v16 setObject:v17 forKeyedSubscript:@"player"];
  if (!v17)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_376;
    v27[3] = &unk_1E646F330;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 32);
    id v28 = v18;
    uint64_t v29 = v19;
    int v31 = *(_DWORD *)(a1 + 48);
    id v30 = v16;
    [v30 perform:v27];
  }
  __int16 v20 = dispatch_get_global_queue(0, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_381;
  v23[3] = &unk_1E646F380;
  uint64_t v21 = *(void *)(a1 + 32);
  id v24 = v16;
  uint64_t v25 = v21;
  int v26 = *(_DWORD *)(a1 + 48);
  id v22 = v16;
  [v22 notifyOnQueue:v20 block:v23];
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_376(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v34 = v6;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "fetching player with playerID: %@", buf, 0xCu);
  }
  if (+[GKPlayer isGuestPlayerID:*(void *)(a1 + 32)])
  {
    id v7 = [*(id *)(a1 + 32) componentsSeparatedByString:@"_"];
    id v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = [v7 objectAtIndexedSubscript:1];
    if (!os_log_GKGeneral) {
      id v10 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_376_cold_1();
    }
    id v32 = v8;
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_377;
    v25[3] = &unk_1E646F2E0;
    id v26 = v9;
    int v30 = *(_DWORD *)(a1 + 56);
    int8x16_t v18 = *(int8x16_t *)(a1 + 32);
    id v12 = (id)v18.i64[0];
    int8x16_t v27 = vextq_s8(v18, v18, 8uLL);
    id v28 = *(id *)(a1 + 48);
    id v29 = v3;
    id v13 = v3;
    id v14 = v9;
    +[GKPlayer loadPlayersForIdentifiersPrivate:v11 withCompletionHandler:v25];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v15 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_376_cold_2();
    }
    uint64_t v31 = *(void *)(a1 + 32);
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_379;
    v20[3] = &unk_1E646F308;
    id v21 = *(id *)(a1 + 48);
    int v24 = *(_DWORD *)(a1 + 56);
    int8x16_t v19 = *(int8x16_t *)(a1 + 32);
    id v17 = (id)v19.i64[0];
    int8x16_t v22 = vextq_s8(v19, v19, 8uLL);
    id v23 = v3;
    id v7 = v3;
    +[GKPlayer loadPlayersForIdentifiersPrivate:v16 withCompletionHandler:v20];

    id v8 = v21;
  }
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_377(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 firstObject];
  id v4 = [GKAnonymousGuestPlayerInternal alloc];
  id v5 = [v3 internal];
  uint64_t v6 = [(GKAnonymousGuestPlayerInternal *)v4 initWithHostPlayerInternal:v5 guestIdentifier:*(void *)(a1 + 32)];

  id v7 = [[GKPlayer alloc] initWithInternalRepresentation:v6];
  id v8 = *(void **)(a1 + 40);
  v10[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v8 addPlayers:v9];

  [*(id *)(a1 + 40) connectionDidChangeWithState:*(unsigned int *)(a1 + 72) playerID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:@"player"];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_379(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!+[GKMatchmaker canPlayMultiplayerGameWithPlayers:v3])
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_379_cold_1();
    }
    uint64_t v6 = [MEMORY[0x1E4F28C58] userErrorForCode:10 userInfo:0];
    [*(id *)(a1 + 32) setError:v6];
    goto LABEL_9;
  }
  [*(id *)(a1 + 40) addPlayers:v3];
  id v4 = +[GKReporter reporter];
  [v4 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.allMatchTotal"];

  id v5 = +[GKReporter reporter];
  [v5 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.indirectMatchTotal"];

  [*(id *)(a1 + 40) connectionDidChangeWithState:*(unsigned int *)(a1 + 64) playerID:*(void *)(a1 + 48)];
  if ([v3 count])
  {
    uint64_t v6 = [v3 firstObject];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"player"];
LABEL_9:
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_381(uint64_t a1)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"player"];
  id v4 = [*v2 error];
  uint64_t v5 = [v4 code];

  if (v5 != 10)
  {
    if (!v3) {
      goto LABEL_67;
    }
    int v6 = 0;
    int v7 = *(_DWORD *)(a1 + 48);
    uint64_t v8 = 1;
    int v80 = 1;
    if (v7 != 2 && v7 != 5)
    {
      int v80 = 0;
      if (v7 == 3)
      {
        int v6 = 1;
        uint64_t v8 = 2;
      }
      else
      {
        int v6 = 0;
        uint64_t v8 = 0;
      }
    }
    int v78 = v6;
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x2020000000;
    char v105 = 0;
    uint64_t v98 = 0;
    v99 = &v98;
    uint64_t v100 = 0x2020000000;
    char v101 = 0;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x3032000000;
    v95 = __Block_byref_object_copy__6;
    v96 = __Block_byref_object_dispose__6;
    id v97 = 0;
    id v9 = *(void **)(a1 + 40);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_2;
    v85[3] = &unk_1E646F358;
    v88 = &v98;
    v89 = &v92;
    uint64_t v79 = v8;
    uint64_t v91 = v8;
    id v10 = v3;
    uint64_t v11 = *(void *)(a1 + 40);
    id v86 = v10;
    uint64_t v87 = v11;
    v90 = &v102;
    [v9 withEventQueueForPlayer:v10 createIfNeeded:1 perform:v85];
    if (!*((unsigned char *)v103 + 24))
    {
LABEL_66:

      _Block_object_dispose(&v92, 8);
      _Block_object_dispose(&v98, 8);
      _Block_object_dispose(&v102, 8);
      goto LABEL_67;
    }
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    id v13 = (id)os_log_GKMatch;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v72 = [v10 internal];
      v73 = [v72 debugDescription];
      v74 = [*(id *)(a1 + 40) stringForGKPlayerConnectionState:v79];
      *(_DWORD *)long long buf = 138412546;
      v108 = v73;
      __int16 v109 = 2112;
      v110 = v74;
      _os_log_debug_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_DEBUG, "EventQueue for player %@ changed playerState to %@", buf, 0x16u);
    }
    id v14 = [*(id *)(a1 + 40) transportContext];
    id v15 = [v14 daemonProxy];
    id v16 = NSString;
    id v17 = [v10 alias];
    int8x16_t v18 = [*(id *)(a1 + 40) stringForGKPeerConnectionState:*(unsigned int *)(a1 + 48)];
    int8x16_t v19 = [v16 stringWithFormat:@"%@ -> %@", v17, v18];
    [v15 emitMultiplayerMessage:v19];

    if (v80)
    {
      unsigned int v20 = *((unsigned __int8 *)v99 + 24);
      if (v20 > [*(id *)(a1 + 40) version]) {
        objc_msgSend(*(id *)(a1 + 40), "sendVersionData:toPlayer:", objc_msgSend(*(id *)(a1 + 40), "version"), v10);
      }
      id v21 = *(void **)(a1 + 40);
      int8x16_t v22 = [v10 internal];
      id v23 = [v22 playerID];
      [v21 addPlayerToGroup:v23];

      int v24 = +[GKReporter reporter];
      [v24 reportEvent:@"com.apple.GameKit.match" type:@"connect"];

      uint64_t v25 = [*(id *)(a1 + 40) matchmaker];
      id v26 = [v10 internal];
      int8x16_t v27 = [v26 playerID];
      [v25 reportPlayerConnectedWithPlayerID:v27 forMatch:*(void *)(a1 + 40)];

      id v28 = [*(id *)(a1 + 40) matchmaker];
      id v29 = [v28 allInvitedInvitees];
      int v30 = [v29 allObjects];

      uint64_t v31 = [v10 internal];
      id v32 = [v31 playerID];
      LODWORD(v29) = [v30 containsObject:v32];

      if (v29)
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v33 = v30;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v81 objects:v106 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v82 != v35) {
                objc_enumerationMutation(v33);
              }
              uint64_t v37 = *(void *)(*((void *)&v81 + 1) + 8 * i);
              __int16 v38 = [*(id *)(a1 + 40) playersByJoinType];
              __int16 v39 = [v38 objectForKeyedSubscript:v37];

              if (v39) {
                [*(id *)(a1 + 40) syncPlayers:v33 forJoinType:5 toInvitees:v33];
              }
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v81 objects:v106 count:16];
          }
          while (v34);
        }
      }
      int v40 = *(_DWORD *)(a1 + 48);
      if (v40 == 2)
      {
        __int16 v41 = +[GKReporter reporter];
        [v41 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionType" type:@"realtime.p2pSuccess"];
      }
      else if (v40 == 5)
      {
        __int16 v41 = +[GKReporter reporter];
        [v41 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionType" type:@"realtime.relaySuccess"];
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v54 = GKOSLoggers();
        }
        __int16 v41 = (id)os_log_GKMatch;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v75 = [v10 internal];
          v76 = [v75 debugDescription];
          v77 = [*(id *)(a1 + 40) stringForGKPeerConnectionState:*(unsigned int *)(a1 + 48)];
          *(_DWORD *)long long buf = 138412546;
          v108 = v76;
          __int16 v109 = 2112;
          v110 = v77;
          _os_log_error_impl(&dword_1C2D22000, v41, OS_LOG_TYPE_ERROR, "Connection state not match for player: %@, state=%@, playerState=GKPlayerStateConnected", buf, 0x16u);
        }
      }

      id v55 = [*(id *)(a1 + 40) transportContext];
      int v56 = [v55 healthMonitorEnabled];

      if (!v56) {
        goto LABEL_49;
      }
      if (!os_log_GKGeneral) {
        id v57 = GKOSLoggers();
      }
      char v58 = (id)os_log_GKMatch;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        [v10 internal];
        [(id)objc_claimAutoreleasedReturnValue() debugDescription];
        objc_claimAutoreleasedReturnValue();
        __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_381_cold_1();
      }

      id v52 = [*(id *)(a1 + 40) healthMonitor];
      unsigned int v53 = [v10 internal];
      BOOL v59 = [v53 playerID];
      [v52 startMonitor:v59];
    }
    else
    {
      uint64_t v42 = +[GKReporter reporter];
      [v42 reportEvent:@"com.apple.GameKit.match" type:@"disconnect"];

      id v43 = [*(id *)(a1 + 40) matchmaker];
      [v43 playerDisconnected:v10];

      id v44 = *(void **)(a1 + 40);
      NSNotificationName v45 = NSString;
      v46 = [v10 internal];
      uint64_t v47 = [v46 alias];
      char v48 = [v45 stringWithFormat:@"Player disconnection detected: %@. If unexpected, Tap here to report.", v47];
      [v44 promptRadarAndRequestRemoteLogsWithDescriptionAddition:v48];

      v49 = [*(id *)(a1 + 40) transportContext];
      LODWORD(v47) = [v49 healthMonitorEnabled];

      if (!v47)
      {
LABEL_50:
        uint64_t v60 = [*(id *)(a1 + 40) delegate];
        uint64_t v61 = [*(id *)(a1 + 40) inviteDelegate];
        if (v60 | v61)
        {
          if (v60)
          {
            long long v62 = (void *)MEMORY[0x1E4F1CA48];
            long long v63 = [*(id *)(a1 + 40) allIDs];
            v64 = [v62 arrayWithArray:v63];

            v65 = +[GKLocalPlayer localPlayer];
            id v66 = [v65 internal];
            uint64_t v67 = [v66 playerID];
            [v64 removeObject:v67];

            [*(id *)(a1 + 40) sendStateCallbackForPlayer:v10 state:v79];
            if (v80)
            {
              [*(id *)(a1 + 40) conditionallyRelaunchPlayer:v10];
              [*(id *)(a1 + 40) sendQueuedPacketsForPlayer:v10];
            }
            else if (v78)
            {
              if ((unint64_t)[*(id *)(*(void *)(a1 + 40) + 88) count] <= 1
                && ([*(id *)(a1 + 40) recentlyBecameActive] & 1) == 0)
              {
                if (v93[5])
                {
                  if ([v64 count] == 1)
                  {
                    v68 = [v64 objectAtIndex:0];
                    v69 = [v10 internal];
                    v70 = [v69 playerID];
                    int v71 = [v68 isEqualToString:v70];

                    if (v71) {
                      [*(id *)(a1 + 40) conditionallyReinvitePlayer:v10 sessionToken:v93[5]];
                    }
                  }
                }
              }
            }
          }
          if (v61)
          {
            [*(id *)(a1 + 40) updateStateForPlayer:v10 state:v79];
            [*(id *)(a1 + 40) sendStateCallbackToDelegate:v61 forPlayer:v10 state:v79];
          }
        }
        else
        {
          [*(id *)(a1 + 40) deferStateCallbackForPlayer:v10 state:v79];
        }

        goto LABEL_66;
      }
      if (!os_log_GKGeneral) {
        id v50 = GKOSLoggers();
      }
      uint64_t v51 = (id)os_log_GKMatch;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        [v10 internal];
        [(id)objc_claimAutoreleasedReturnValue() debugDescription];
        objc_claimAutoreleasedReturnValue();
        __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_381_cold_2();
      }

      int v30 = [*(id *)(a1 + 40) healthMonitor];
      id v52 = [v10 internal];
      unsigned int v53 = [v52 playerID];
      [v30 stopMonitor:v53];
    }

LABEL_49:
    goto LABEL_50;
  }
  [*(id *)(a1 + 40) disconnect];
LABEL_67:
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 connectionInfo];
  uint64_t v5 = [v4 objectForKey:@"match-version"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 integerValue];

  int v6 = [v3 connectionInfo];
  uint64_t v7 = [v6 objectForKey:@"session-token"];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if ([v3 playerState] != *(void *)(a1 + 72))
  {
    if (!os_log_GKGeneral) {
      id v10 = GKOSLoggers();
    }
    uint64_t v11 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    {
      id v12 = *(void **)(a1 + 32);
      id v13 = v11;
      id v14 = [v12 internal];
      id v15 = [v14 debugDescription];
      id v16 = objc_msgSend(*(id *)(a1 + 40), "stringForGKPlayerConnectionState:", objc_msgSend(v3, "playerState"));
      id v17 = [*(id *)(a1 + 40) stringForGKPlayerConnectionState:*(void *)(a1 + 72)];
      int v18 = 138412802;
      int8x16_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v17;
      _os_log_debug_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_DEBUG, "EventQueue for player %@ changing playerState from: %@ to %@", (uint8_t *)&v18, 0x20u);
    }
    [v3 setPlayerState:*(void *)(a1 + 72)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (void)connectionDidFailWithError:(id)a3
{
  id v3 = a3;
  id v4 = +[GKReporter reporter];
  [v4 reportEvent:@"com.apple.GameKit.match" type:@"connectionFail"];

  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
    -[GKMatch connectionDidFailWithError:]();
  }
}

- (void)transportDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = +[GKReporter reporter];
  [v5 reportEvent:@"com.apple.GameKit.match" type:@"fail"];

  if (!os_log_GKGeneral) {
    id v6 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
    -[GKMatch connectionDidFailWithError:]();
  }
  uint64_t v7 = [(GKMatch *)self delegate];

  if (v7)
  {
    uint64_t v8 = [(GKMatch *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(GKMatch *)self delegate];
      [v10 match:self didFailWithError:v4];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v11 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        -[GKMatch transportDidFailWithError:]();
      }
    }
  }
  [(GKMatch *)self clearSessionWithReason:3];
  id v12 = NSString;
  id v13 = [v4 localizedDescription];
  id v14 = [v12 stringWithFormat:@"Error detected in transport. Error: %@", v13];
  [(GKMatch *)self promptRadarAndRequestRemoteLogsWithDescriptionAddition:v14];
}

- (void)transportDidReceivePacket:(id)a3 fromPlayerID:(id)a4 remoteRecipientID:(id)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GKThreadsafeDictionary *)self->_playersByIdentifier objectForKey:v9];
  if (v11)
  {
    if (v10)
    {
      if (!os_log_GKGeneral) {
        id v12 = GKOSLoggers();
      }
      id v13 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v80 = v10;
        _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "Got data intended for remoteRecipientID = %@", buf, 0xCu);
      }
      uint64_t v14 = [(GKThreadsafeDictionary *)self->_playersByIdentifier objectForKey:v10];
    }
    else
    {
      uint64_t v14 = +[GKLocalPlayer localPlayer];
    }
    id v17 = (void *)v14;
    if (!os_log_GKGeneral) {
      id v18 = GKOSLoggers();
    }
    v72 = v11;
    int8x16_t v19 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKMatch transportDidReceivePacket:fromPlayerID:remoteRecipientID:].cold.5(v19);
    }
    uint64_t v20 = [(GKMatch *)self delegate];
    uint64_t v73 = [(GKMatch *)self inviteDelegate];
    int v21 = [(GKMatch *)self version];
    int v22 = [v8 valid];
    if (v21)
    {
      if (!v22)
      {
        uint64_t v24 = (void *)v20;
        if (!os_log_GKGeneral) {
          id v38 = GKOSLoggers();
        }
        BOOL v39 = os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG);
        id v11 = v72;
        id v33 = (void *)v73;
        if (!v39) {
          goto LABEL_67;
        }
        -[GKMatch transportDidReceivePacket:fromPlayerID:remoteRecipientID:].cold.4();
        goto LABEL_66;
      }
      int v23 = [v8 packetType];
      uint64_t v24 = (void *)v20;
      if (v23 <= 15)
      {
        if (v23 == 1)
        {
          id v50 = [v8 data];
          -[GKMatch setVersion:](self, "setVersion:", *(unsigned __int8 *)[v50 bytes]);

          id v11 = v72;
          goto LABEL_66;
        }
        if (v23 == 2)
        {
          if ([v17 isLocalPlayer])
          {
            int v71 = v17;
            id v54 = [v8 data];
            id v55 = +[GKInviteMessageSupport extractPropertiesWithData:v54];

            if (v55)
            {
              id v68 = v10;
              id v69 = v9;
              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              int v56 = [v55 allKeys];
              uint64_t v57 = [v56 countByEnumeratingWithState:&v74 objects:v78 count:16];
              if (v57)
              {
                uint64_t v58 = v57;
                uint64_t v59 = *(void *)v75;
                do
                {
                  for (uint64_t i = 0; i != v58; ++i)
                  {
                    if (*(void *)v75 != v59) {
                      objc_enumerationMutation(v56);
                    }
                    uint64_t v61 = *(void *)(*((void *)&v74 + 1) + 8 * i);
                    long long v62 = [v55 objectForKeyedSubscript:v61];
                    [(GKMatch *)self updateProperties:v62 playerID:v61];
                  }
                  uint64_t v58 = [v56 countByEnumeratingWithState:&v74 objects:v78 count:16];
                }
                while (v58);
              }

              id v10 = v68;
              id v9 = v69;
            }

            id v17 = v71;
            uint64_t v24 = (void *)v20;
          }
          long long v63 = [v8 data];
          id v11 = v72;
          [(GKMatch *)self _delegate:v73 didReceiveData:v63 forRecipient:v17 fromPlayer:v72];

          id v33 = (void *)v73;
          goto LABEL_67;
        }
        id v11 = v72;
        if (v23 != 8) {
          goto LABEL_69;
        }
        v46 = [v8 data];
        [(GKMatch *)self receivedPlayerSyncData:v46];
LABEL_65:

        goto LABEL_66;
      }
      id v11 = v72;
      if (v23 <= 63)
      {
        if (v23 == 16)
        {
          int64_t v49 = [(GKMatch *)self sequenceFromPacket:v8];
          id v26 = [(GKMatch *)self healthMonitor];
          int8x16_t v27 = [v72 internal];
          id v28 = [v27 playerID];
          [v26 receivedPing:v28 sequenceNumber:v49];
          goto LABEL_60;
        }
        if (v23 == 17)
        {
          int64_t v25 = [(GKMatch *)self sequenceFromPacket:v8];
          id v26 = [(GKMatch *)self healthMonitor];
          int8x16_t v27 = [v72 internal];
          id v28 = [v27 playerID];
          [v26 receivedPong:v28 sequenceNumber:v25];
LABEL_60:

LABEL_66:
          id v33 = (void *)v73;
          goto LABEL_67;
        }
LABEL_69:
        if (!os_log_GKGeneral) {
          id v51 = GKOSLoggers();
        }
        id v52 = (void *)os_log_GKMatch;
        BOOL v53 = os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG);
        id v33 = (void *)v73;
        if (!v53) {
          goto LABEL_67;
        }
        -[GKMatch transportDidReceivePacket:fromPlayerID:remoteRecipientID:](v52);
        goto LABEL_66;
      }
      if (v23 != 64)
      {
        if (v23 != 128) {
          goto LABEL_69;
        }
        v46 = [v8 data];
        if (!v24)
        {
          [(GKMatch *)self queueData:v46 withEventQueueForPlayer:v72 forRecipient:v17];
          goto LABEL_65;
        }
LABEL_64:
        [(GKMatch *)self deliverData:v46 forRecipient:v17 fromPlayer:v72];
        goto LABEL_65;
      }
      id v33 = (void *)v73;
      if (v24)
      {
        v46 = [v8 data];
        goto LABEL_64;
      }
    }
    else
    {
      if (v22)
      {
        if (!os_log_GKGeneral) {
          id v29 = GKOSLoggers();
        }
        int v30 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = v30;
          int v32 = [v8 version];
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v80) = v32;
          _os_log_impl(&dword_1C2D22000, v31, OS_LOG_TYPE_INFO, "packet version: %d, expecting version 0", buf, 8u);
        }
      }
      id v33 = (void *)v73;
      if (!(v20 | v73))
      {
        if (!os_log_GKGeneral) {
          id v40 = GKOSLoggers();
        }
        __int16 v41 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          uint64_t v42 = v41;
          id v43 = [v72 internal];
          id v44 = [v43 conciseDescription];
          *(_DWORD *)long long buf = 138412290;
          id v80 = v44;
          _os_log_impl(&dword_1C2D22000, v42, OS_LOG_TYPE_INFO, "Queuing data for player; %@ (no delegate)", buf, 0xCu);
        }
        NSNotificationName v45 = [v8 data];
        [(GKMatch *)self queueData:v45 withEventQueueForPlayer:v72 forRecipient:v17];

        uint64_t v24 = (void *)v20;
        id v11 = v72;
        goto LABEL_66;
      }
      uint64_t v34 = v20;
      uint64_t v24 = (void *)v20;
      id v11 = v72;
      if (v34)
      {
        uint64_t v35 = [v8 data];
        [(GKMatch *)self deliverData:v35 forRecipient:v17 fromPlayer:v72];

        id v33 = (void *)v73;
      }
      if (!v33) {
        goto LABEL_67;
      }
      v70 = v17;
      __int16 v36 = v33;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v37 = [v8 data];
        [v36 match:self didReceiveData:v37 fromRemotePlayer:v72];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          id v17 = v70;
          if (!os_log_GKGeneral) {
            id v64 = GKOSLoggers();
          }
          BOOL v65 = os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR);
          id v33 = (void *)v73;
          if (!v65) {
            goto LABEL_67;
          }
          -[GKMatch transportDidReceivePacket:fromPlayerID:remoteRecipientID:]();
          goto LABEL_66;
        }
        if (GKApplicationLinkedOnOrAfter(917504, 659456))
        {
          id v17 = v70;
          if (!os_log_GKGeneral) {
            id v47 = GKOSLoggers();
          }
          BOOL v48 = os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR);
          id v33 = (void *)v73;
          if (!v48) {
            goto LABEL_67;
          }
          -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:]();
          goto LABEL_66;
        }
        uint64_t v37 = [v8 data];
        id v66 = [v72 internal];
        uint64_t v67 = [v66 playerID];
        __int16 v36 = (void *)v73;
        [(id)v73 match:self didReceiveData:v37 fromPlayer:v67];
      }
      id v33 = v36;
      id v17 = v70;
    }
LABEL_67:

    goto LABEL_68;
  }
  if (!os_log_GKGeneral) {
    id v15 = GKOSLoggers();
  }
  id v16 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v80 = v9;
    _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "Data from playerID: %@ without player mapping", buf, 0xCu);
  }
LABEL_68:
}

- (void)transportDidUpdateWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMatch *)self transportContext];
  [v5 updateWithInfoFromTransport:v4];
}

- (void)retryLimitHit
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "We have reached the limit of retry for pending connection checker.", v5, 2u);
  }
  [(GKMatch *)self promptRadarAndRequestRemoteLogsWithDescriptionAddition:@"Invitation failed after retry. Please tap to file a radar."];
}

- (void)sendPingTo:(id)a3 sequence:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(GKMatch *)self matchPacketWithPacketType:16 sequence:a4];
  [(GKMatch *)self sendMeasurementData:v7 packetType:16 toPlayerID:v6];
}

- (void)sendPongTo:(id)a3 sequence:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(GKMatch *)self matchPacketWithPacketType:17 sequence:a4];
  [(GKMatch *)self sendMeasurementData:v7 packetType:17 toPlayerID:v6];
}

- (void)monitorStatsUpdated:(id)a3
{
  id v4 = a3;
  [v4 overallLatency];
  uint64_t v6 = v5;
  [v4 overallAverageLatency];
  uint64_t v8 = v7;
  [v4 overallPacketLoss];
  double v10 = v9;

  id v11 = [NSString stringWithFormat:@"AVG: %.2fms, CUR: %.2fms, LOSS: %.2f%%", v8, v6, v10 * 100.0];
  objc_initWeak(&location, self);
  id v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__GKMatch_monitorStatsUpdated___block_invoke;
  block[3] = &unk_1E646F3A8;
  objc_copyWeak(&v16, &location);
  id v15 = v11;
  id v13 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __31__GKMatch_monitorStatsUpdated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __31__GKMatch_monitorStatsUpdated___block_invoke_cold_1();
  }
  id v4 = [WeakRetained transportContext];
  uint64_t v5 = [v4 daemonProxy];
  [v5 emitMultiplayerMessage:*(void *)(a1 + 32)];
}

- (id)matchPacketWithPacketType:(unsigned __int8)a3 sequence:(int64_t)a4
{
  int64_t v6 = a4;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v6 length:8];

  return v4;
}

- (int64_t)sequenceFromPacket:(id)a3
{
  id v3 = [a3 data];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = *(void *)[v3 bytes];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatch sequenceFromPacket:]();
    }
    int64_t v5 = -1;
  }

  return v5;
}

- (void)sendMeasurementData:(id)a3 packetType:(unsigned __int8)a4 toPlayerID:(id)a5
{
  uint64_t v5 = a4;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = [(GKMatch *)self packet:v5 data:a3];
  double v10 = [(GKThreadsafeDictionary *)self->_playersByIdentifier objectForKey:v8];
  if (v10)
  {
    id v11 = [(GKMatch *)self transport];
    v19[0] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v13 = [(GKMatch *)self transportContext];
    id v18 = 0;
    [v11 sendScopedData:v9 toPlayers:v12 dataMode:1 dataScope:0 transportContext:v13 error:&v18];
    id v14 = v18;

    if (v14)
    {
      if (!os_log_GKGeneral) {
        id v15 = GKOSLoggers();
      }
      id v16 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        -[GKMatch sendMeasurementData:packetType:toPlayerID:](v16);
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatch sendMeasurementData:packetType:toPlayerID:]();
    }
    [(GKMatch *)self setHealthMonitor:0];
    id v14 = 0;
  }
}

- (id)dataFromBase64String:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  return v5;
}

- (id)stringForGKPlayerConnectionState:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 < 3) {
    return off_1E646F3E0[a3];
  }
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSNumber;
    id v8 = v6;
    double v9 = [v7 numberWithInteger:a3];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Invalid connection state: GKPlayerConnectionState %@", (uint8_t *)&v10, 0xCu);
  }
  return 0;
}

- (id)stringForGKPeerConnectionState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 < 6) {
    return off_1E646F3F8[a3];
  }
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSNumber;
    id v8 = v6;
    double v9 = [v7 numberWithInt:v3];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Invalid connection state: GKPeerConnectionState %@", (uint8_t *)&v10, 0xCu);
  }
  return 0;
}

- (void)reportInviteSentWithApproach:(unint64_t)a3 isHosted:(BOOL)a4 recipients:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v10 = [(GKMatch *)self multiplayerActivityReporter];
  double v9 = [(GKMatch *)self transportContext];
  [v10 onInviteSentWithApproach:a3 isHosted:v5 recipients:v8 transportContext:v9];
}

- (GKThreadsafeDictionary)playersByIdentifier
{
  return self->_playersByIdentifier;
}

- (void)setPlayersByIdentifier:(id)a3
{
}

- (NSMutableSet)connectedPlayerIDs
{
  return self->_connectedPlayerIDs;
}

- (void)setConnectedPlayerIDs:(id)a3
{
}

- (OS_dispatch_queue)stateChangeQueue
{
  return self->_stateChangeQueue;
}

- (void)setStateChangeQueue:(id)a3
{
}

- (NSMutableDictionary)playerEventQueues
{
  return self->_playerEventQueues;
}

- (void)setPlayerEventQueues:(id)a3
{
}

- (NSMutableArray)reinvitedPlayers
{
  return self->_reinvitedPlayers;
}

- (void)setReinvitedPlayers:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

- (GKMatchDelegatePrivate)inviteDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inviteDelegateWeak);

  return (GKMatchDelegatePrivate *)WeakRetained;
}

- (unsigned)packetSequenceNumber
{
  return self->_packetSequenceNumber;
}

- (void)setPacketSequenceNumber:(unsigned int)a3
{
  self->_packetSequenceNumber = a3;
}

- (NSMutableDictionary)playerPushTokens
{
  return self->_playerPushTokens;
}

- (void)setPlayerPushTokens:(id)a3
{
}

- (NSMutableArray)opponentIDs
{
  return self->_opponentIDs;
}

- (void)setOpponentIDs:(id)a3
{
}

- (NSString)rematchID
{
  return self->_rematchID;
}

- (void)setRematchID:(id)a3
{
}

- (int64_t)rematchCount
{
  return self->_rematchCount;
}

- (void)setRematchCount:(int64_t)a3
{
  self->_rematchCount = a3;
}

- (NSDictionary)networkStatistics
{
  return self->_networkStatistics;
}

- (void)setNetworkStatistics:(id)a3
{
}

- (NSMutableDictionary)hostScores
{
  return self->_hostScores;
}

- (void)setHostScores:(id)a3
{
}

- (BOOL)needHostScore
{
  return self->_needHostScore;
}

- (void)setNeedHostScore:(BOOL)a3
{
  self->_needHostScore = a3;
}

- (BOOL)hostScoreForQuery
{
  return self->_hostScoreForQuery;
}

- (void)setHostScoreForQuery:(BOOL)a3
{
  self->_hostScoreForQuery = a3;
}

- (id)chooseHostCompletion
{
  return self->_chooseHostCompletion;
}

- (void)setChooseHostCompletion:(id)a3
{
}

- (BOOL)recentlyBecameActive
{
  return self->_recentlyBecameActive;
}

- (void)setRecentlyBecameActive:(BOOL)a3
{
  self->_recentlyBecameActive = a3;
}

- (BOOL)fastStartStateActive
{
  return self->_fastStartStateActive;
}

- (void)setFastStartStateActive:(BOOL)a3
{
  self->_fastStartStateActive = a3;
}

- (BOOL)initiallyStarted
{
  return self->_initiallyStarted;
}

- (BOOL)canPromptTapToRadar
{
  return self->_canPromptTapToRadar;
}

- (void)setCanPromptTapToRadar:(BOOL)a3
{
  self->_canPromptTapToRadar = a3;
}

- (GKTransportProtocol)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (GKTransportContext)transportContext
{
  return self->_transportContext;
}

- (void)setTransportContext:(id)a3
{
}

- (GKMultiplayerActivityReporter)multiplayerActivityReporter
{
  return self->_multiplayerActivityReporter;
}

- (void)setMultiplayerActivityReporter:(id)a3
{
}

- (_TtC20GameCenterFoundation22ExponentialBackoffTask)pendingConnectionChecker
{
  return self->_pendingConnectionChecker;
}

- (void)setPendingConnectionChecker:(id)a3
{
}

- (GKMatchmaker)matchmaker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matchmaker);

  return (GKMatchmaker *)WeakRetained;
}

- (void)setMatchmaker:(id)a3
{
}

- (NSUInteger)expectedPlayerCount
{
  return self->_expectedPlayerCount;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (GKThreadsafeDictionary)playersByJoinType
{
  return self->_playersByJoinType;
}

- (void)setPlayersByJoinType:(id)a3
{
}

- (GKThreadsafeDictionary)propertiesByPlayerID
{
  return self->_propertiesByPlayerID;
}

- (void)setPropertiesByPlayerID:(id)a3
{
}

- (GKTransportMonitor)healthMonitor
{
  return self->_healthMonitor;
}

- (void)setHealthMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthMonitor, 0);
  objc_storeStrong((id *)&self->_propertiesByPlayerID, 0);
  objc_storeStrong((id *)&self->_playersByJoinType, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_destroyWeak((id *)&self->_matchmaker);
  objc_storeStrong((id *)&self->_pendingConnectionChecker, 0);
  objc_storeStrong((id *)&self->_multiplayerActivityReporter, 0);
  objc_storeStrong((id *)&self->_transportContext, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong(&self->_chooseHostCompletion, 0);
  objc_storeStrong((id *)&self->_hostScores, 0);
  objc_storeStrong((id *)&self->_networkStatistics, 0);
  objc_storeStrong((id *)&self->_rematchID, 0);
  objc_storeStrong((id *)&self->_opponentIDs, 0);
  objc_storeStrong((id *)&self->_playerPushTokens, 0);
  objc_destroyWeak((id *)&self->_inviteDelegateWeak);
  objc_storeStrong((id *)&self->_reinvitedPlayers, 0);
  objc_storeStrong((id *)&self->_playerEventQueues, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateChangeQueue, 0);
  objc_storeStrong((id *)&self->_connectedPlayerIDs, 0);

  objc_storeStrong((id *)&self->_playersByIdentifier, 0);
}

void __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to send invitation update after sending match request. Error: %@", v2, v3, v4, v5, v6);
}

void __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_176_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Pending connection check is done.", v2, v3, v4, v5, v6);
}

- (void)sendData:toPlayers:dataMode:error:.cold.1()
{
  OUTLINED_FUNCTION_20(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to send data, error: %@", v2, v3, v4, v5, v6);
}

- (void)sendDataToAllPlayers:withDataMode:error:.cold.1()
{
  OUTLINED_FUNCTION_20(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to send data to all, error: %@", v2, v3, v4, v5, v6);
}

void __56__GKMatch_chooseBestHostingPlayerWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "Failed to find host player", v2, v3, v4, v5, v6);
}

- (void)promptRadarAndRequestRemoteLogsWithDescriptionAddition:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to encode players and their tokens: %@", v2, v3, v4, v5, v6);
}

- (void)playerIDs
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)chooseBestHostPlayerWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)sendData:toPlayers:withDataMode:error:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

void __34__GKMatch_clearSessionWithReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to disconnect all, error: %@", v2, v3, v4, v5, v6);
}

- (void)_delegate:didReceiveData:forRecipient:fromPlayer:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: delegate registered for the '%{public}@'. Game Center doesn't invoke this obsolete delegate method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)_delegate:didReceiveData:forRecipient:fromPlayer:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "<Warning>: need to implement one of the following methods in GKMatchDelegate: match:didReceiveData:forRecipient:fromRemotePlayer:, match:didReceiveData:fromRemotePlayer:", v2, v3, v4, v5, v6);
}

- (void)_delegate:(void *)a1 didReceiveData:forRecipient:fromPlayer:.cold.3(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() internal];
  uint64_t v4 = [v3 playerID];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_ERROR, "received data from playerID: %@ who is NOT connected!", v5, 0xCu);
}

- (void)withEventQueueForPlayer:create:perform:.cold.1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_16(v2, v3, 5.7779e-34);
  _os_log_error_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_ERROR, "No GKMatchEventQueue for player: %@", v5, 0xCu);
}

- (void)withEventQueueForPlayer:create:perform:.cold.2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_16(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v4, (uint64_t)v4, "_playerEventQueues created for player: %@", v5);
}

void __28__GKMatch_addPlayerToGroup___block_invoke_288_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = [(id)OUTLINED_FUNCTION_21() groupID];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11(&dword_1C2D22000, v5, v6, "Error attempting to update group to the server: %@ %@", v7, v8, v9, v10, v11);
}

- (void)setAutomatchPlayerCount:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "Cannot set automatch player count as there is no inviteDelegate set yet, or the invite delegate doesn't respond to selector: setAutomatchPlayerCount:", v2, v3, v4, v5, v6);
}

- (void)connectToPlayers:version:invitedByLocalPlayer:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Skip adding players for early connection setup.", v2, v3, v4, v5, v6);
}

- (void)connectToPlayers:version:invitedByLocalPlayer:completionHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v0, v1, "cannot set connecting state for players: %@, as there is no inviteDelegate set yet. The state might directly change to Ready when we set the inviteDelegate later and call sendQueuedStatesAndPackets.", v2);
}

void __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  uint8_t v6 = a1;
  uint64_t v7 = [v5 numberWithInt:a2];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)a3 + 176)];
  int v10 = 138412546;
  uint8_t v11 = v7;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v6, v9, "Calculating _expectedPlayerCount + %@ = %@", (uint8_t *)&v10);
}

void __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_301_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "connectToPlayersWithTransportContext failed, error: %@", v2, v3, v4, v5, v6);
}

void __47__GKMatch_connectToGuestPlayer_withHostPlayer___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_12() internal];
  uint64_t v5 = [v4 debugDescription];
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = &unk_1F1E7EB10;
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v2, v6, "EventQueue for player %@ changed playerState to %@", v7);
}

- (void)connectToNearbyPlayer:(void *)a1 withConnectionData:.cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_12() internal];
  uint64_t v4 = [v3 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v1, v5, "cannot set connecting state for player: %@, as there is no inviteDelegate set yet. The state might directly change to Ready when we set the inviteDelegate later and call sendQueuedStatesAndPackets.", v6);
}

void __52__GKMatch_connectToNearbyPlayer_withConnectionData___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = NSNumber;
  uint64_t v3 = *(void *)(*(void *)a1 + 176);
  uint64_t v4 = a2;
  uint64_t v5 = [v2 numberWithUnsignedInteger:v3];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v4, v6, "Calculating _expectedPlayerCount + 1 = %@", v7);
}

void __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_17(&dword_1C2D22000, v0, v1, "syncPlayers error dataWithPropertyList: %@, error: %@");
}

void __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "syncPlayers failed to loadPlayersForLegacyIdentifiers for invitees: %@", v2, v3, v4, v5, v6);
}

- (void)sendInviteData:(void *)a1 .cold.1(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() transportContext];
  uint64_t v4 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v6 = 138412546;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v5, "Invalid action. Tried to send invite data when there is no valid transport selected yet, transportContext: %@ Call stack: %@", (uint8_t *)&v6);
}

- (void)sendVersionData:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to send version data, error: %@", v2, v3, v4, v5, v6);
}

- (void)sendVersionData:(void *)a1 toPlayer:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_21() internal];
  uint64_t v4 = [v3 playerID];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11(&dword_1C2D22000, v5, v6, "Failed to send version data to playerID: %@, error: %@", v7, v8, v9, v10, v11);
}

void __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke_cold_1()
{
  __assert_rtn("-[GKMatch deferStateCallbackForPlayer:state:]_block_invoke", "GKMatch.m", 1486, "queue != nil");
}

void __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 internal];
  uint64_t v7 = [v6 debugDescription];
  uint64_t v8 = [NSNumber numberWithInteger:*a3];
  int v10 = 138412546;
  uint8_t v11 = v7;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v5, v9, "GKMatch Queue for player %@ changed deferedPlayerState to %@", (uint8_t *)&v10);
}

void __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_12() internal];
  uint64_t v5 = [v4 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v2, v6, "_playerEventQueues removed queue for player: %@", v7);
}

void __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Calculating (updateStateForPlayer) _expectedPlayerCount is 0. Need update rematchID", v2, v3, v4, v5, v6);
}

void __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(*(void *)a1 + 176);
  uint64_t v4 = a2;
  uint64_t v5 = [v2 numberWithUnsignedInteger:v3];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v4, v6, "Calculating (updateStateForPlayer) _expectedPlayerCount - 1 = %@", v7);
}

- (void)sendStateCallbackToDelegate:forPlayer:state:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: delegate registered for the '%{public}@'. Game Center doesn't invoke this obsolete delegate method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)sendStateCallbackToDelegate:forPlayer:state:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "<Warning>: match:player:didChangeConnectionState: delegate method not implemented for GKMatchDelegate", v2, v3, v4, v5, v6);
}

- (void)conditionallyReinvitePlayer:sessionToken:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: delegate registered for the '%{public}@'. Game Center doesn't invoke this obsolete delegate method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)conditionallyReinvitePlayer:sessionToken:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "<Warning>: match:shouldReinviteDisconnectedPlayer: delegate method not implemented for GKMatchDelegate", v2, v3, v4, v5, v6);
}

void __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "error sending re-invite = %@", v2, v3, v4, v5, v6);
}

- (void)conditionallyRelaunchPlayer:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 internal];
  uint64_t v5 = [v4 conciseDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v3, v6, "Sending invite data to re-launch player %@", v7);
}

- (void)relayDidReceivePushData:completionHandler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, (uint64_t)v1, "relaypush for match: %p - assigning sessionToken to %@", v2);
}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17(&dword_1C2D22000, v0, v1, "relayPush will not act on push notification because couldn't load player (%@) due to error: %@");
}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_363_cold_1()
{
  OUTLINED_FUNCTION_20(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_18();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_ERROR, "relayPush for match: %p - No session token was not stored in player event queue: %@", v2, 0x16u);
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_376_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v0, v1, "loading player using guest hostPlayerID: %@", v2);
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_376_cold_2()
{
  OUTLINED_FUNCTION_20(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v0, v1, "loading player using playerID: %@", v2);
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_379_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "Cannot create match with player because playing with non-friends is restricted.", v2, v3, v4, v5, v6);
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_381_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_16(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v4, (uint64_t)v4, "Starting monitor for player: %@", v5);
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_381_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_16(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v4, (uint64_t)v4, "Stopping monitor for player: %@", v5);
}

- (void)connectionDidFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "GKTransportClientDelegate - did fail with error %@", v2, v3, v4, v5, v6);
}

- (void)transportDidFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "<Warning>: match:didFailWithError: delegate method not implemented for GKMatchDelegate", v2, v3, v4, v5, v6);
}

- (void)transportDidReceivePacket:fromPlayerID:remoteRecipientID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "<Warning>: match:didReceiveData:fromRemotePlayer: delegate method not implemented for GKMatch.inviteDelegate", v2, v3, v4, v5, v6);
}

- (void)transportDidReceivePacket:(void *)a1 fromPlayerID:remoteRecipientID:.cold.3(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  v3[0] = 67109120;
  v3[1] = [(id)OUTLINED_FUNCTION_12() packetType];
  _os_log_debug_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_DEBUG, "Ignoring data packet type: %d", (uint8_t *)v3, 8u);
}

- (void)transportDidReceivePacket:fromPlayerID:remoteRecipientID:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Ignoring invalid data packet", v2, v3, v4, v5, v6);
}

- (void)transportDidReceivePacket:(void *)a1 fromPlayerID:remoteRecipientID:.cold.5(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_21() internal];
  uint64_t v4 = [v3 playerID];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v5, "Data intended for playerID: %@ from playerID: %@", v6);
}

void __31__GKMatch_monitorStatsUpdated___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_4(&dword_1C2D22000, v0, v1, "%@", v2);
}

- (void)sequenceFromPacket:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "Invalid ping type data received.", v2, v3, v4, v5, v6);
}

- (void)sendMeasurementData:packetType:toPlayerID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Error occurred when sending measurement data. %@ not exists.", v2, v3, v4, v5, v6);
}

- (void)sendMeasurementData:(void *)a1 packetType:toPlayerID:.cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_21() internal];
  uint64_t v4 = [v3 playerID];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11(&dword_1C2D22000, v5, v6, "Failed to send measurement data to playerID: %@, error: %@", v7, v8, v9, v10, v11);
}

@end