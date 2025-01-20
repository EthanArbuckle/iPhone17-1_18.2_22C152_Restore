@interface GKVoiceChatSessionInternal
+ (void)brokenHash:(id)a3 response:(char *)a4;
- (BOOL)getMuteStateForPeer:(id)a3;
- (BOOL)isActiveSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsingSuppression;
- (GKVoiceChatPeerInfoProvider)gameStateSession;
- (GKVoiceChatSessionDelegate)delegate;
- (GKVoiceChatSessionInternal)initWithGameStateSession:(id)a3 publicWrapper:(id)a4 sessionName:(id)a5;
- (NSArray)peerList;
- (NSString)sessionName;
- (float)sessionVolume;
- (id)decodePeerID:(id)a3;
- (id)encodePeerID:(id)a3;
- (id)participantID;
- (int)calculateChannelQualities;
- (int)goodChannels;
- (unsigned)conferenceID;
- (unsigned)peerCount;
- (unsigned)talkingPeersLimit;
- (void)addPeerToFocusPausedList:(id)a3;
- (void)calculateConferenceID;
- (void)cleanup;
- (void)cleanupProc:(id)a3;
- (void)dealloc;
- (void)didStartSpeaking:(id)a3;
- (void)didStopSpeaking:(id)a3;
- (void)handlePeerDisconnected:(id)a3;
- (void)informClientVoiceChatConnecting:(id)a3;
- (void)informClientVoiceChatCouldNotConnect:(id)a3;
- (void)informClientVoiceChatDidStart:(id)a3;
- (void)informClientVoiceChatDidStop:(id)a3;
- (void)informClientVoiceChatFocusChange:(id)a3;
- (void)informClientVoiceChatSilent:(id)a3;
- (void)informClientVoiceChatSpeaking:(id)a3;
- (void)interfaceStateDidChangeWithWifiUp:(BOOL)a3 cellUp:(BOOL)a4;
- (void)lossRate:(float)a3 forParticipantID:(id)a4;
- (void)parseConnectedPeers:(id)a3;
- (void)parseMutedPeers:(id)a3 forPeer:(id)a4;
- (void)pauseAll;
- (void)pruneBadLinks;
- (void)removeFromFocusPausedList:(id)a3;
- (void)sendConnectedPeers;
- (void)sendMutedPeers;
- (void)session:(id)a3 didReceiveOOBAudioPacket:(id)a4 fromPeerID:(id)a5;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(unsigned int)a5;
- (void)setActiveSession:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUsingSuppression:(BOOL)a3;
- (void)setMute:(BOOL)a3 forPeer:(id)a4;
- (void)setSessionVolume:(float)a3;
- (void)setTalkingPeersLimit:(unsigned int)a3;
- (void)startSession;
- (void)startSessionInternal;
- (void)stopSession;
- (void)stopSessionInternal;
- (void)unPauseAll;
- (void)updatedConnectedPeers:(id)a3;
- (void)updatedFocusID:(unsigned int)a3;
- (void)updatedFocusPeers:(id)a3;
- (void)updatedMutedPeers:(id)a3 forPeer:(id)a4;
- (void)updatedSubscribedBeaconList:(id)a3;
- (void)voiceChatService:(id)a3 didNotStartWithParticipantID:(id)a4 error:(id)a5;
- (void)voiceChatService:(id)a3 didReceiveInvitationFromParticipantID:(id)a4 callID:(unsigned int)a5;
- (void)voiceChatService:(id)a3 didStartWithParticipantID:(id)a4;
- (void)voiceChatService:(id)a3 didStopWithParticipantID:(id)a4 error:(id)a5;
- (void)voiceChatService:(id)a3 sendData:(id)a4 toParticipantID:(id)a5;
@end

@implementation GKVoiceChatSessionInternal

- (GKVoiceChatPeerInfoProvider)gameStateSession
{
  return (GKVoiceChatPeerInfoProvider *)objc_loadWeak((id *)&self->_gameStateSession);
}

- (void)interfaceStateDidChangeWithWifiUp:(BOOL)a3 cellUp:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[GKVoiceChatSessionInternal interfaceStateDidChangeWithWifiUp:cellUp:]";
      __int16 v13 = 1024;
      int v14 = 79;
      __int16 v15 = 1024;
      BOOL v16 = v4;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatSesion_Internal current wifi state: %d", (uint8_t *)&v9, 0x22u);
    }
  }
  [(GKRWLock *)self->_rwLock wrlock];
  self->_currentWifiState = v4;
  unsigned int sessionState = self->_sessionState;
  if (v4)
  {
    if (!sessionState)
    {
      [(GKRWLock *)self->_rwLock unlock];
      [(GKVoiceChatSessionInternal *)self startSessionInternal];
      return;
    }
  }
  else if (sessionState == 1)
  {
    [(GKRWLock *)self->_rwLock unlock];
    [(GKVoiceChatSessionInternal *)self stopSessionInternal];
    return;
  }
  [(GKRWLock *)self->_rwLock unlock];
}

- (GKVoiceChatSessionInternal)initWithGameStateSession:(id)a3 publicWrapper:(id)a4 sessionName:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)GKVoiceChatSessionInternal;
  v8 = [(GKVoiceChatSessionInternal *)&v12 init];
  if (v8)
  {
    *((void *)v8 + 1) = [a5 copy];
    objc_storeWeak((id *)v8 + 4, a3);
    *((_DWORD *)v8 + 6) = 1065353216;
    [v8 calculateConferenceID];
    *((void *)v8 + 5) = objc_msgSend((id)objc_msgSend(a3, "peerID"), "copy");
    *((void *)v8 + 15) = objc_alloc_init(GKRWLock);
    *((void *)v8 + 6) = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    *((void *)v8 + 7) = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    *((void *)v8 + 8) = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    *((void *)v8 + 9) = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    *((void *)v8 + 11) = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    v8[96] = 1;
    *(void *)(v8 + 100) = 0xFFFFFFFF7FFFFFFFLL;
    v8[108] = 1;
    *((_DWORD *)v8 + 28) = 3;
    *((void *)v8 + 18) = dispatch_queue_create("com.apple.GKVoiceChatSession.sendQueue", 0);
    *((void *)v8 + 21) = a4;
    *((void *)v8 + 17) = [[VoiceChatSessionRoster alloc] initWithGameStateSession:a3 peerID:*((void *)v8 + 5) voiceChatSession:v8 sendQueue:*((void *)v8 + 18)];
    Boolean keyExistsAndHasValidFormat = 0;
    v8[28] = CFPreferencesGetAppBooleanValue(@"focusCallbacks", @"com.apple.VideoConference", &keyExistsAndHasValidFormat) != 0;
    id v9 = objc_alloc_init((Class)off_2645B79F8);
    *((void *)v8 + 22) = v9;
    [v9 setInterfaceListenerDelegate:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend((id)objc_msgSend(a3, "voiceChatSessionListener"), "registerNewGKVoiceChatSession:", v8);
    }
  }
  return (GKVoiceChatSessionInternal *)v8;
}

+ (void)brokenHash:(id)a3 response:(char *)a4
{
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.data[13] = v6;
  *(_OWORD *)&v7.data[6] = v6;
  *(_OWORD *)&v7.data[10] = v6;
  *(_OWORD *)&v7.Nl = v6;
  *(_OWORD *)&v7.data[2] = v6;
  *(_OWORD *)&v7.A = v6;
  CC_MD5_Init(&v7);
  CC_MD5_Update(&v7, (const void *)[a3 UTF8String], objc_msgSend(a3, "length"));
  CC_MD5_Final((unsigned __int8 *)a4, &v7);
}

- (void)calculateConferenceID
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  +[GKVoiceChatSessionInternal brokenHash:self->_sessionName response:&v3];
  self->_conferenceID = HIDWORD(v4);
}

- (id)encodePeerID:(id)a3
{
  if (!a3) {
    return 0;
  }
  unsigned int v4 = [a3 longLongValue];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu", v4 | ((unint64_t)self->_conferenceID << 32));
}

- (id)decodePeerID:(id)a3
{
  if (a3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%u", strtoull((const char *)objc_msgSend(a3, "UTF8String"), 0, 10));
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];

  self->_roster = 0;
  objc_storeWeak((id *)&self->_gameStateSession, 0);

  self->_peerID = 0;
  self->_rwLock = 0;

  self->_myPausedList = 0;
  self->_connectedPeers = 0;

  self->_connectedVoicePeers = 0;
  self->_connectedFocusPeers = 0;

  self->_mutedPeers = 0;
  self->_peerChannelQuality = 0;
  sendQueue = self->_sendQueue;
  if (sendQueue)
  {
    dispatch_release(sendQueue);
    self->_sendQueue = 0;
  }

  self->_sessionName = 0;
  self->_vcService = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[GKVoiceChatSessionInternal dealloc]";
      __int16 v11 = 1024;
      int v12 = 205;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatSessionInternal getting dealloced", buf, 0x1Cu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)GKVoiceChatSessionInternal;
  [(GKVoiceChatSessionInternal *)&v6 dealloc];
}

- (void)cleanup
{
  [(GKVoiceChatSessionInternal *)self stopSession];
  [(GKRWLock *)self->_rwLock wrlock];
  self->_unsigned int sessionState = 4;
  [(VoiceChatSessionRoster *)self->_roster cleanup];
  [(GKRWLock *)self->_rwLock unlock];
  unint64_t v3 = (void *)MEMORY[0x263F08B88];
  [v3 detachNewThreadSelector:sel_cleanupProc_ toTarget:self withObject:0];
}

- (void)cleanupProc:(id)a3
{
  [(GKRWLock *)self->_rwLock wrlock];
  [(GKVoiceChatServicePrivate *)self->_vcService setClient:0];
  [(GKVoiceChatServiceFocus *)self->_vcService setSpeakingDelegate:0];
  [(GKVoiceChatServiceFocus *)self->_vcService setQualityDelegate:0];
  [(GKVoiceChatServicePrivate *)self->_vcService cleanup];
  [(GKRWLock *)self->_rwLock unlock];
  uint64_t v4 = [(GKVoiceChatSessionInternal *)self gameStateSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (void *)[(GKVoiceChatPeerInfoProvider *)v4 voiceChatSessionListener];
    [v5 removeSession:self];
  }
}

- (void)startSession
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(GKRWLock *)self->_rwLock wrlock];
  if (self->_sessionState >= 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v4;
        __int16 v10 = 2080;
        __int16 v11 = "-[GKVoiceChatSessionInternal startSession]";
        __int16 v12 = 1024;
        int v13 = 247;
        _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start-voice-chat-session", (uint8_t *)&v8, 0x1Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      CC_MD5_CTX v7 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        __int16 v11 = "-[GKVoiceChatSessionInternal startSession]";
        __int16 v12 = 1024;
        int v13 = 248;
        _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Calling startSession!", (uint8_t *)&v8, 0x1Cu);
      }
    }
    self->_unsigned int sessionState = 0;
    [(GKInterfaceListener *)self->_wifiListener hasConnectionWithWifi:&self->_currentWifiState cell:0];
    [(GKInterfaceListener *)self->_wifiListener startChangeListener];
    [(GKRWLock *)self->_rwLock unlock];
    [(GKVoiceChatSessionInternal *)self startSessionInternal];
  }
  else
  {
    rwLock = self->_rwLock;
    [(GKRWLock *)rwLock unlock];
  }
}

- (void)startSessionInternal
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[GKVoiceChatSessionInternal startSessionInternal]";
  __int16 v6 = 1024;
  int v7 = 280;
  _os_log_error_impl(&dword_221563000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Not starting voicechat. Don't have permission to use microphone", (uint8_t *)&v2, 0x1Cu);
}

- (void)stopSession
{
  [(GKRWLock *)self->_rwLock wrlock];
  if (self->_sessionState == 3)
  {
    rwLock = self->_rwLock;
    [(GKRWLock *)rwLock unlock];
  }
  else
  {
    self->_unsigned int sessionState = 3;
    [(GKInterfaceListener *)self->_wifiListener stopChangeListener];
    [(GKRWLock *)self->_rwLock unlock];
    [(GKVoiceChatSessionInternal *)self stopSessionInternal];
  }
}

- (void)stopSessionInternal
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(GKRWLock *)self->_rwLock wrlock];
  if (self->_sessionState == 1) {
    self->_unsigned int sessionState = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  connectedFocusPeers = self->_connectedFocusPeers;
  uint64_t v4 = [(NSMutableArray *)connectedFocusPeers countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(connectedFocusPeers);
        }
        [(GKVoiceChatSessionInternal *)self performSelectorOnMainThread:sel_informClientVoiceChatDidStop_ withObject:*(void *)(*((void *)&v17 + 1) + 8 * i) waitUntilDone:0];
      }
      uint64_t v5 = [(NSMutableArray *)connectedFocusPeers countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  connectedPeers = self->_connectedPeers;
  uint64_t v9 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(connectedPeers);
        }
        [(GKVoiceChatServicePrivate *)self->_vcService stopVoiceChatWithParticipantID:[(GKVoiceChatSessionInternal *)self encodePeerID:*(void *)(*((void *)&v13 + 1) + 8 * j)]];
      }
      uint64_t v10 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
  [(GKVoiceChatServiceFocus *)self->_vcService setFocus:0];
  [(GKVoiceChatServiceFocus *)self->_vcService setCurrentFocus:0];
  [(VoiceChatSessionRoster *)self->_roster stopBeacon];
  [(NSMutableArray *)self->_myPausedList removeAllObjects];
  [(NSMutableArray *)self->_connectedPeers removeAllObjects];
  [(NSMutableArray *)self->_connectedVoicePeers removeAllObjects];
  [(NSMutableArray *)self->_connectedFocusPeers removeAllObjects];
  [(NSMutableDictionary *)self->_peerChannelQuality removeAllObjects];
  [(GKRWLock *)self->_rwLock unlock];
}

- (void)setMute:(BOOL)a3 forPeer:(id)a4
{
  BOOL v5 = a3;
  [(GKRWLock *)self->_rwLock wrlock];
  mutedPeers = self->_mutedPeers;
  if (v5)
  {
    if (([(NSMutableArray *)mutedPeers containsObject:a4] & 1) == 0) {
      [(NSMutableArray *)self->_mutedPeers addObject:a4];
    }
  }
  else
  {
    [(NSMutableArray *)mutedPeers removeObject:a4];
  }
  if (self->_sessionState == 1)
  {
    if ([(GKVoiceChatServicePrivate *)self->_vcService isFocus]) {
      [(GKVoiceChatSessionInternal *)self updatedMutedPeers:self->_mutedPeers forPeer:0];
    }
    else {
      [(GKVoiceChatSessionInternal *)self sendMutedPeers];
    }
  }
  rwLock = self->_rwLock;
  [(GKRWLock *)rwLock unlock];
}

- (BOOL)getMuteStateForPeer:(id)a3
{
  LOBYTE(a3) = [(NSMutableArray *)self->_mutedPeers containsObject:a3];
  [(GKRWLock *)self->_rwLock unlock];
  return (char)a3;
}

- (NSArray)peerList
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_connectedFocusPeers];
}

- (void)setActiveSession:(BOOL)a3
{
  vcService = self->_vcService;
  if (vcService)
  {
    -[GKVoiceChatServiceFocus setHasMic:](vcService, "setHasMic:");
    self->activeSession = a3;
  }
}

- (BOOL)isActiveSession
{
  vcService = self->_vcService;
  if (!vcService) {
    return self->activeSession;
  }
  BOOL result = [(GKVoiceChatServiceFocus *)vcService hasMic];
  self->activeSession = result;
  return result;
}

- (NSString)sessionName
{
  int v2 = (void *)[(NSString *)self->_sessionName copy];
  return (NSString *)v2;
}

- (unsigned)conferenceID
{
  return self->_conferenceID;
}

- (float)sessionVolume
{
  vcService = self->_vcService;
  if (!vcService) {
    return self->sessionVolume;
  }
  [(GKVoiceChatServicePrivate *)vcService remoteParticipantVolume];
  self->sessionVolume = result;
  return result;
}

- (void)setSessionVolume:(float)a3
{
  LODWORD(v3) = 1.0;
  if (a3 <= 1.0) {
    *(float *)&double v3 = a3;
  }
  if (a3 >= 0.0) {
    float v5 = *(float *)&v3;
  }
  else {
    float v5 = 0.0;
  }
  -[GKVoiceChatServicePrivate setRemoteParticipantVolume:](self->_vcService, "setRemoteParticipantVolume:", COERCE_DOUBLE((unint64_t)LODWORD(v5)), v3);
  self->sessionVolume = v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5) {
    LOBYTE(v5) = [a3 conferenceID] == self->_conferenceID;
  }
  return v5;
}

- (void)handlePeerDisconnected:(id)a3
{
  -[NSMutableArray removeObject:](self->_connectedVoicePeers, "removeObject:");
  [(NSMutableDictionary *)self->_peerChannelQuality removeObjectForKey:a3];
  self->needsRecalculateGoodChannels = 1;
  if ([(GKVoiceChatServicePrivate *)self->_vcService isFocus]
    && [(NSMutableArray *)self->_connectedFocusPeers containsObject:a3])
  {
    [(NSMutableArray *)self->_connectedFocusPeers removeObject:a3];
    [(GKVoiceChatSessionInternal *)self sendConnectedPeers];
    [(GKVoiceChatSessionInternal *)self updatedConnectedPeers:self->_connectedFocusPeers];
    [(GKVoiceChatSessionInternal *)self performSelectorOnMainThread:sel_informClientVoiceChatDidStop_ withObject:a3 waitUntilDone:0];
  }
}

- (void)updatedSubscribedBeaconList:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        int v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        int v7 = "<nil>";
      }
      connectedPeers = self->_connectedPeers;
      if (connectedPeers) {
        uint64_t v9 = (const char *)objc_msgSend((id)-[NSMutableArray description](connectedPeers, "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      peerID = self->_peerID;
      if (peerID) {
        uint64_t v11 = [[(NSString *)peerID description] UTF8String];
      }
      else {
        uint64_t v11 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v46 = 2080;
      v47 = "-[GKVoiceChatSessionInternal updatedSubscribedBeaconList:]";
      __int16 v48 = 1024;
      int v49 = 464;
      __int16 v50 = 2080;
      v51 = v7;
      __int16 v52 = 2080;
      v53 = v9;
      __int16 v54 = 2080;
      v55 = v11;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatSession_Internal: updatedSubscribedBeaconList: newSubscribedList = %s (our existing members = %s) us (%s)", buf, 0x3Au);
    }
  }
  [(GKRWLock *)self->_rwLock wrlock];
  if (self->_sessionState == 1)
  {
    __int16 v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v13 = self->_connectedPeers;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          if (([a3 containsObject:v18] & 1) == 0) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v15);
    }
    *(void *)buf = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v19 = [a3 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(a3);
          }
          uint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          if (([(NSMutableArray *)self->_connectedPeers containsObject:v23] & 1) == 0)
          {
            unsigned int v24 = [(NSString *)self->_peerID longLongValue];
            if (v24 < [v23 longLongValue]) {
              [(GKVoiceChatServiceFocus *)self->_vcService startVoiceChatWithParticipantID:[(GKVoiceChatSessionInternal *)self encodePeerID:v23] error:buf];
            }
            [(NSMutableArray *)self->_connectedPeers addObject:v23];
            [(GKVoiceChatSessionInternal *)self informClientVoiceChatConnecting:v23];
          }
        }
        uint64_t v20 = [a3 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v20);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v25 = [v12 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v12);
          }
          uint64_t v29 = *(void *)(*((void *)&v30 + 1) + 8 * k);
          [(GKVoiceChatServicePrivate *)self->_vcService stopVoiceChatWithParticipantID:[(GKVoiceChatSessionInternal *)self encodePeerID:v29]];
          [(NSMutableArray *)self->_connectedPeers removeObject:v29];
          [(GKVoiceChatSessionInternal *)self handlePeerDisconnected:v29];
        }
        uint64_t v26 = [v12 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v26);
    }
  }
  [(GKRWLock *)self->_rwLock unlock];
}

- (void)updatedFocusID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = self->_sessionState == 1;
      int v8 = [(NSString *)self->_peerID longLongValue];
      *(_DWORD *)buf = 136316418;
      uint64_t v9 = "NO";
      uint64_t v12 = v5;
      uint64_t v14 = "-[GKVoiceChatSessionInternal updatedFocusID:]";
      __int16 v13 = 2080;
      __int16 v15 = 1024;
      if (v8 == v3) {
        uint64_t v9 = "YES";
      }
      int v16 = 510;
      __int16 v17 = 1024;
      int v18 = v3;
      __int16 v19 = 1024;
      BOOL v20 = v7;
      __int16 v21 = 2080;
      v22 = v9;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d My new focus = %u, _sessionState == kVoiceChatSessionRunning = %d.  Am I the focus?  %s", buf, 0x32u);
    }
  }
  [(GKRWLock *)self->_rwLock wrlock];
  if (self->_sessionState == 1)
  {
    [(GKVoiceChatServiceFocus *)self->_vcService setFocus:[(NSString *)self->_peerID longLongValue] == v3];
    -[GKVoiceChatServiceFocus setCurrentFocus:](self->_vcService, "setCurrentFocus:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", objc_msgSend(NSString, "stringWithFormat:", @"%u", -[VoiceChatSessionRoster focusID](self->_roster, "focusID"))));
    [(GKVoiceChatSessionInternal *)self unPauseAll];
    if ([(GKVoiceChatServicePrivate *)self->_vcService isFocus])
    {
      [(GKVoiceChatSessionInternal *)self updatedMutedPeers:self->_mutedPeers forPeer:0];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_connectedVoicePeers];
      [v10 insertObject:self->_peerID atIndex:0];
      [v10 removeObjectsInArray:self->_myPausedList];
      [(GKVoiceChatSessionInternal *)self updatedFocusPeers:v10];

      [(GKVoiceChatSessionInternal *)self sendConnectedPeers];
      [(GKVoiceChatSessionInternal *)self updatedConnectedPeers:self->_connectedFocusPeers];
    }
    else
    {
      [(GKVoiceChatSessionInternal *)self sendMutedPeers];
    }
    if (self->focusCallbacks) {
      -[GKVoiceChatSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatFocusChange_, objc_msgSend(NSString, "stringWithFormat:", @"%u", v3), 0);
    }
  }
  [(GKRWLock *)self->_rwLock unlock];
}

- (void)updatedMutedPeers:(id)a3 forPeer:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v7, "addObject:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", *(void *)(*((void *)&v12 + 1) + 8 * v11++)));
      }
      while (v9 != v11);
      uint64_t v9 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  [(GKVoiceChatServiceFocus *)self->_vcService updatedMutedPeers:v7 forParticipantID:[(GKVoiceChatSessionInternal *)self encodePeerID:a4]];
}

- (void)sendMutedPeers
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v1, v2, " [%s] %s:%d sendMutedPeers failed to serialize. %s", v3, v4, v5, v6, v7);
}

uint64_t __44__GKVoiceChatSessionInternal_sendMutedPeers__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendVoiceChatData:toPeers:error:", objc_msgSend(*(id *)(a1 + 40), "data"), *(void *)(a1 + 48), &v2);
}

- (void)parseMutedPeers:(id)a3 forPeer:(id)a4
{
  id v8 = 0;
  uint64_t v6 = [MEMORY[0x263F08AC0] propertyListFromData:a3 mutabilityOption:0 format:0 errorDescription:&v8];
  if (v6)
  {
    uint64_t v7 = v6;
    [(GKRWLock *)self->_rwLock wrlock];
    [(GKVoiceChatSessionInternal *)self updatedMutedPeers:v7 forPeer:a4];
    [(GKRWLock *)self->_rwLock unlock];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKVoiceChatSessionInternal parseMutedPeers:forPeer:]();
      }
    }
  }
}

- (void)pauseAll
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  connectedVoicePeers = self->_connectedVoicePeers;
  uint64_t v4 = [(NSMutableArray *)connectedVoicePeers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(connectedVoicePeers);
        }
        [(GKVoiceChatServiceFocus *)self->_vcService pauseAudio:1 toParticipantID:[(GKVoiceChatSessionInternal *)self encodePeerID:*(void *)(*((void *)&v8 + 1) + 8 * i)]];
      }
      uint64_t v5 = [(NSMutableArray *)connectedVoicePeers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)unPauseAll
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  connectedVoicePeers = self->_connectedVoicePeers;
  uint64_t v4 = [(NSMutableArray *)connectedVoicePeers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(connectedVoicePeers);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if (![(NSMutableArray *)self->_myPausedList containsObject:v8]
          || ![(GKVoiceChatServicePrivate *)self->_vcService isFocus])
        {
          [(GKVoiceChatServiceFocus *)self->_vcService pauseAudio:0 toParticipantID:[(GKVoiceChatSessionInternal *)self encodePeerID:v8]];
        }
      }
      uint64_t v5 = [(NSMutableArray *)connectedVoicePeers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)pruneBadLinks
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  connectedVoicePeers = self->_connectedVoicePeers;
  uint64_t v4 = [(NSMutableArray *)connectedVoicePeers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(connectedVoicePeers);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerChannelQuality, "objectForKeyedSubscript:", v9), "floatValue");
        if (v10 > 0.25
          && (([(NSMutableArray *)self->_myPausedList containsObject:v9] | v6) & 1) == 0)
        {
          [(GKVoiceChatSessionInternal *)self addPeerToFocusPausedList:v9];
          long long v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_connectedVoicePeers];
          [v11 insertObject:self->_peerID atIndex:0];
          [v11 removeObjectsInArray:self->_myPausedList];
          [(GKVoiceChatSessionInternal *)self updatedFocusPeers:v11];

          [(GKVoiceChatSessionInternal *)self sendConnectedPeers];
          [(GKVoiceChatSessionInternal *)self updatedConnectedPeers:self->_connectedFocusPeers];
          int v6 = 1;
        }
        [(NSMutableDictionary *)self->_peerChannelQuality setObject:&unk_26D3A4178 forKeyedSubscript:v9];
      }
      uint64_t v5 = [(NSMutableArray *)connectedVoicePeers countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  self->needsRecalculateGoodChannels = 1;
  [(GKVoiceChatSessionInternal *)self goodChannels];
}

- (void)addPeerToFocusPausedList:(id)a3
{
  myPausedList = self->_myPausedList;
  if (!myPausedList)
  {
    myPausedList = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:16];
    self->_myPausedList = myPausedList;
  }
  [(NSMutableArray *)myPausedList addObject:a3];
  id v6 = [(GKVoiceChatSessionInternal *)self encodePeerID:a3];
  vcService = self->_vcService;
  [(GKVoiceChatServiceFocus *)vcService pauseAudio:1 toParticipantID:v6];
}

- (void)removeFromFocusPausedList:(id)a3
{
  -[NSMutableArray removeObject:](self->_myPausedList, "removeObject:");
  id v5 = [(GKVoiceChatSessionInternal *)self encodePeerID:a3];
  vcService = self->_vcService;
  [(GKVoiceChatServiceFocus *)vcService pauseAudio:0 toParticipantID:v5];
}

- (void)updatedFocusPeers:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:a3];
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_connectedFocusPeers];
  if ([a3 containsObject:self->_peerID])
  {
    [v5 removeObjectsInArray:self->_connectedFocusPeers];
    [v5 removeObject:self->_peerID];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v5);
          }
          [(GKVoiceChatSessionInternal *)self performSelectorOnMainThread:sel_informClientVoiceChatDidStart_ withObject:*(void *)(*((void *)&v24 + 1) + 8 * i) waitUntilDone:0];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v8);
    }
    [v6 removeObjectsInArray:a3];
    [v6 removeObject:self->_peerID];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = [v6 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v6);
          }
          [(GKVoiceChatSessionInternal *)self performSelectorOnMainThread:sel_informClientVoiceChatDidStop_ withObject:*(void *)(*((void *)&v20 + 1) + 8 * j) waitUntilDone:0];
        }
        uint64_t v12 = [v6 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v12);
    }
    [(NSMutableArray *)self->_connectedFocusPeers setArray:a3];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    connectedFocusPeers = self->_connectedFocusPeers;
    uint64_t v16 = [(NSMutableArray *)connectedFocusPeers countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(connectedFocusPeers);
          }
          [(GKVoiceChatSessionInternal *)self performSelectorOnMainThread:sel_informClientVoiceChatDidStop_ withObject:*(void *)(*((void *)&v28 + 1) + 8 * k) waitUntilDone:0];
        }
        uint64_t v17 = [(NSMutableArray *)connectedFocusPeers countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v17);
    }
    [(NSMutableArray *)self->_connectedFocusPeers removeAllObjects];
  }
}

- (void)updatedConnectedPeers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v5, "addObject:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", *(void *)(*((void *)&v10 + 1) + 8 * v9++)));
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (![(GKVoiceChatServicePrivate *)self->_vcService isFocus]
    && ([a3 containsObject:self->_peerID] & 1) == 0)
  {
    [(GKVoiceChatServiceFocus *)self->_vcService pauseAudio:1 toParticipantID:[(GKVoiceChatServiceFocus *)self->_vcService currentFocus]];
  }
  [(GKVoiceChatServiceFocus *)self->_vcService updatedConnectedPeers:v5];
}

- (void)sendConnectedPeers
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v1, v2, " [%s] %s:%d sendConnectedPeers failed to serialize. %s", v3, v4, v5, v6, v7);
}

uint64_t __48__GKVoiceChatSessionInternal_sendConnectedPeers__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendVoiceChatData:toPeers:error:", objc_msgSend(*(id *)(a1 + 40), "data"), *(void *)(a1 + 48), &v2);
}

- (void)parseConnectedPeers:(id)a3
{
  id v6 = 0;
  uint64_t v4 = [MEMORY[0x263F08AC0] propertyListFromData:a3 mutabilityOption:0 format:0 errorDescription:&v6];
  if (v4)
  {
    uint64_t v5 = v4;
    [(GKRWLock *)self->_rwLock wrlock];
    [(GKVoiceChatSessionInternal *)self updatedFocusPeers:v5];
    [(GKVoiceChatSessionInternal *)self updatedConnectedPeers:v5];
    [(GKRWLock *)self->_rwLock unlock];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKVoiceChatSessionInternal parseConnectedPeers:]();
      }
    }
  }
}

- (unsigned)peerCount
{
  return [(NSMutableArray *)self->_connectedVoicePeers count];
}

- (void)setTalkingPeersLimit:(unsigned int)a3
{
  self->talkingPeersLimit = a3;
  -[GKVoiceChatServiceFocus setTalkingPeersLimit:](self->_vcService, "setTalkingPeersLimit:");
}

- (unsigned)talkingPeersLimit
{
  return self->talkingPeersLimit;
}

- (void)setIsUsingSuppression:(BOOL)a3
{
  self->isUsingSuppression = a3;
  -[GKVoiceChatServiceFocus setIsUsingSuppression:](self->_vcService, "setIsUsingSuppression:");
}

- (BOOL)isUsingSuppression
{
  return self->isUsingSuppression;
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        long long v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        long long v10 = "<nil>";
      }
      BOOL v11 = v5 == 2 || v5 == 5;
      *(_DWORD *)long long v14 = 136316162;
      int v12 = v11;
      *(void *)&v14[4] = v8;
      __int16 v15 = 2080;
      uint64_t v16 = "-[GKVoiceChatSessionInternal(GKSessionVoiceChatDelegate) session:peer:didChangeState:]";
      __int16 v17 = 1024;
      int v18 = 791;
      __int16 v19 = 2080;
      long long v20 = v10;
      __int16 v21 = 1024;
      int v22 = v12;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerID %s didChangeState == connected (%d)", v14, 0x2Cu);
    }
  }
  [(GKRWLock *)self->_rwLock wrlock];
  if (v5 == 3 && [(NSMutableArray *)self->_connectedPeers containsObject:a4])
  {
    [(GKVoiceChatServiceFocus *)self->_vcService remoteCancelled:[(GKVoiceChatSessionInternal *)self encodePeerID:a4]];
    [(NSMutableArray *)self->_connectedPeers removeObject:a4];
    [(GKVoiceChatSessionInternal *)self handlePeerDisconnected:a4];
  }
  long long v13 = self->_roster;
  [(GKRWLock *)self->_rwLock unlock];
  [(VoiceChatSessionRoster *)v13 peer:a4 didChangeState:v5];
}

- (void)session:(id)a3 didReceiveOOBAudioPacket:(id)a4 fromPeerID:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [a4 subtype];
      if (a5) {
        BOOL v11 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      }
      else {
        BOOL v11 = "<nil>";
      }
      if ([(GKVoiceChatSessionInternal *)self encodePeerID:a5]) {
        int v12 = (const char *)objc_msgSend((id)objc_msgSend(-[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a5), "description"), "UTF8String");
      }
      else {
        int v12 = "<nil>";
      }
      int v14 = 136316418;
      uint64_t v15 = v8;
      __int16 v16 = 2080;
      __int16 v17 = "-[GKVoiceChatSessionInternal(GKSessionVoiceChatDelegate) session:didReceiveOOBAudioPacket:fromPeerID:]";
      __int16 v18 = 1024;
      int v19 = 817;
      __int16 v20 = 1024;
      int v21 = v10;
      __int16 v22 = 2080;
      uint64_t v23 = v11;
      __int16 v24 = 2080;
      long long v25 = v12;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Session didReceiveOOBAudioPacket of type %u from %s %s", (uint8_t *)&v14, 0x36u);
    }
  }
  [(GKRWLock *)self->_rwLock rdlock];
  unsigned int sessionState = self->_sessionState;
  [(GKRWLock *)self->_rwLock unlock];
  if (sessionState != 4)
  {
    switch([a4 subtype])
    {
      case 0u:
        -[GKVoiceChatServiceFocus receivedData:fromParticipantID:](self->_vcService, "receivedData:fromParticipantID:", [a4 payload], -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a5));
        break;
      case 1u:
        -[VoiceChatSessionRoster receivedBeacon:fromPeer:](self->_roster, "receivedBeacon:fromPeer:", [a4 payload], a5);
        break;
      case 2u:
        -[GKVoiceChatSessionInternal parseConnectedPeers:](self, "parseConnectedPeers:", [a4 payload]);
        break;
      case 3u:
        -[GKVoiceChatSessionInternal parseMutedPeers:forPeer:](self, "parseMutedPeers:forPeer:", [a4 payload], a5);
        break;
      default:
        return;
    }
  }
}

- (void)informClientVoiceChatDidStart:(id)a3
{
}

- (void)informClientVoiceChatConnecting:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __87__GKVoiceChatSessionInternal_VoiceChatClientInternal__informClientVoiceChatConnecting___block_invoke;
  v3[3] = &unk_2645B7C68;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __87__GKVoiceChatSessionInternal_VoiceChatClientInternal__informClientVoiceChatConnecting___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) gkVoiceChatSession:*(void *)(*(void *)(a1 + 32) + 168) stateUpdate:4 forPeer:*(void *)(a1 + 40)];
}

- (void)informClientVoiceChatCouldNotConnect:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __92__GKVoiceChatSessionInternal_VoiceChatClientInternal__informClientVoiceChatCouldNotConnect___block_invoke;
  v3[3] = &unk_2645B7C68;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __92__GKVoiceChatSessionInternal_VoiceChatClientInternal__informClientVoiceChatCouldNotConnect___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) gkVoiceChatSession:*(void *)(*(void *)(a1 + 32) + 168) stateUpdate:5 forPeer:*(void *)(a1 + 40)];
}

- (void)informClientVoiceChatDidStop:(id)a3
{
}

- (void)informClientVoiceChatSpeaking:(id)a3
{
}

- (void)informClientVoiceChatSilent:(id)a3
{
}

- (void)informClientVoiceChatFocusChange:(id)a3
{
}

- (void)voiceChatService:(id)a3 sendData:(id)a4 toParticipantID:(id)a5
{
  uint8_t v7 = [[GKVoiceChatSessionMessage alloc] initWithPayload:a4 conferenceID:self->_conferenceID subtype:0];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", -[GKVoiceChatSessionInternal decodePeerID:](self, "decodePeerID:", a5), 0);
  uint64_t v9 = [(GKVoiceChatSessionInternal *)self gameStateSession];
  sendQueue = self->_sendQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__GKVoiceChatSessionInternal_VoiceChatClient__voiceChatService_sendData_toParticipantID___block_invoke;
  block[3] = &unk_2645B7C90;
  block[4] = v9;
  block[5] = v7;
  block[6] = v8;
  dispatch_async(sendQueue, block);
}

uint64_t __89__GKVoiceChatSessionInternal_VoiceChatClient__voiceChatService_sendData_toParticipantID___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendVoiceChatData:toPeers:error:", objc_msgSend(*(id *)(a1 + 40), "data"), *(void *)(a1 + 48), &v2);
}

- (id)participantID
{
  return [(GKVoiceChatSessionInternal *)self encodePeerID:self->_peerID];
}

- (void)voiceChatService:(id)a3 didStartWithParticipantID:(id)a4
{
  id v6 = [(GKVoiceChatSessionInternal *)self decodePeerID:a4];
  [(GKRWLock *)self->_rwLock wrlock];
  if (self->_sessionState == 1)
  {
    if (([(NSMutableArray *)self->_connectedVoicePeers containsObject:v6] & 1) == 0)
    {
      [(NSMutableArray *)self->_connectedVoicePeers addObject:v6];
      [(NSMutableDictionary *)self->_peerChannelQuality setObject:&unk_26D3A4178 forKeyedSubscript:v6];
      self->needsRecalculateGoodChannels = 1;
    }
    if ([(GKVoiceChatServicePrivate *)self->_vcService isFocus])
    {
      if (([(NSMutableArray *)self->_connectedFocusPeers containsObject:v6] & 1) == 0)
      {
        [(NSMutableArray *)self->_connectedFocusPeers addObject:v6];
        [(GKVoiceChatSessionInternal *)self sendConnectedPeers];
        [(GKVoiceChatSessionInternal *)self updatedConnectedPeers:self->_connectedFocusPeers];
        [(GKVoiceChatSessionInternal *)self performSelectorOnMainThread:sel_informClientVoiceChatDidStart_ withObject:v6 waitUntilDone:0];
        if (self->congestionState == 1) {
          [(GKVoiceChatServiceFocus *)self->_vcService pauseAudio:1 toParticipantID:a4];
        }
      }
    }
    if ([(VoiceChatSessionRoster *)self->_roster recalculateFocusRating]) {
      [(VoiceChatSessionRoster *)self->_roster updateBeacon];
    }
  }
  rwLocuint64_t k = self->_rwLock;
  [(GKRWLock *)rwLock unlock];
}

- (void)voiceChatService:(id)a3 didNotStartWithParticipantID:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint8_t v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      }
      else {
        uint64_t v8 = "<nil>";
      }
      int v9 = 136315906;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      int v12 = "-[GKVoiceChatSessionInternal(VoiceChatClient) voiceChatService:didNotStartWithParticipantID:error:]";
      __int16 v13 = 1024;
      int v14 = 939;
      __int16 v15 = 2080;
      __int16 v16 = v8;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d voiceChatService:didNotStartWithParticipantID %s", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (void)voiceChatService:(id)a3 didStopWithParticipantID:(id)a4 error:(id)a5
{
  id v6 = [(GKVoiceChatSessionInternal *)self decodePeerID:a4];
  [(GKRWLock *)self->_rwLock wrlock];
  if (self->_sessionState == 1)
  {
    [(GKVoiceChatSessionInternal *)self handlePeerDisconnected:v6];
    if ([(VoiceChatSessionRoster *)self->_roster recalculateFocusRating]) {
      [(VoiceChatSessionRoster *)self->_roster updateBeacon];
    }
  }
  rwLocuint64_t k = self->_rwLock;
  [(GKRWLock *)rwLock unlock];
}

- (void)voiceChatService:(id)a3 didReceiveInvitationFromParticipantID:(id)a4 callID:(unsigned int)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = 0;
  unsigned int sessionState = self->_sessionState;
  vcService = self->_vcService;
  if (sessionState == 1)
  {
    if (![(GKVoiceChatServiceFocus *)vcService acceptCallID:*(void *)&a5 error:&v10]
      && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v10) {
          int v9 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
        }
        else {
          int v9 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        int v14 = "-[GKVoiceChatSessionInternal(VoiceChatClient) voiceChatService:didReceiveInvitationFromParticipantID:callID:]";
        __int16 v15 = 1024;
        int v16 = 961;
        __int16 v17 = 2080;
        __int16 v18 = v9;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We have a problem when accepting the call %s", buf, 0x26u);
      }
    }
  }
  else
  {
    -[GKVoiceChatServiceFocus denyCallID:](vcService, "denyCallID:", *(void *)&a5, a4);
  }
}

- (GKVoiceChatSessionDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  [(GKRWLock *)self->_rwLock wrlock];
  self->delegate = (GKVoiceChatSessionDelegate *)a3;
  rwLocuint64_t k = self->_rwLock;
  [(GKRWLock *)rwLock unlock];
}

- (void)didStartSpeaking:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__GKVoiceChatSessionInternal_VideoConferenceSpeakingDelegate__didStartSpeaking___block_invoke;
  v3[3] = &unk_2645B7C68;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __80__GKVoiceChatSessionInternal_VideoConferenceSpeakingDelegate__didStartSpeaking___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    id v2 = (id)objc_msgSend(*(id *)(a1 + 40), "decodePeerID:");
  }
  else {
    id v2 = (id)[v1[5] copy];
  }
  return [v1 informClientVoiceChatSpeaking:v2];
}

- (void)didStopSpeaking:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__GKVoiceChatSessionInternal_VideoConferenceSpeakingDelegate__didStopSpeaking___block_invoke;
  v3[3] = &unk_2645B7C68;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __79__GKVoiceChatSessionInternal_VideoConferenceSpeakingDelegate__didStopSpeaking___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    id v2 = (id)objc_msgSend(*(id *)(a1 + 40), "decodePeerID:");
  }
  else {
    id v2 = (id)[v1[5] copy];
  }
  return [v1 informClientVoiceChatSilent:v2];
}

- (int)calculateChannelQualities
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = [(NSMutableArray *)self->_connectedVoicePeers count];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  peerChannelQuality = self->_peerChannelQuality;
  uint64_t v5 = [(NSMutableDictionary *)peerChannelQuality countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(peerChannelQuality);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (([(NSMutableArray *)self->_myPausedList containsObject:v9] & 1) == 0)
        {
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerChannelQuality, "objectForKeyedSubscript:", v9), "floatValue");
          if (v10 <= 0.25) {
            continue;
          }
        }
        --v3;
      }
      uint64_t v6 = [(NSMutableDictionary *)peerChannelQuality countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  self->needsRecalculateGoodChannels = 0;
  return v3;
}

- (int)goodChannels
{
  if (!self->needsRecalculateGoodChannels) {
    return self->goodChannels;
  }
  int result = [(GKVoiceChatSessionInternal *)self calculateChannelQualities];
  self->goodChannels = result;
  return result;
}

- (void)lossRate:(float)a3 forParticipantID:(id)a4
{
  id v6 = [(GKVoiceChatSessionInternal *)self decodePeerID:a4];
  [(GKRWLock *)self->_rwLock rdlock];
  if (a3 > 0.25)
  {
    [(GKRWLock *)self->_rwLock unlock];
    [(GKRWLock *)self->_rwLock wrlock];
    int v7 = [(GKVoiceChatSessionInternal *)self calculateChannelQualities];
    if ([(GKVoiceChatServicePrivate *)self->_vcService isFocus] && !self->congestionState)
    {
      self->congestionState = 1;
      *(float *)&double v8 = a3;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_peerChannelQuality, "setObject:forKeyedSubscript:", [NSNumber numberWithFloat:v8], v6);
      [(GKVoiceChatSessionInternal *)self pauseAll];
      dispatch_time_t v9 = dispatch_time(0, 4000000000);
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __95__GKVoiceChatSessionInternal_VideoConferenceChannelQualityDelegate__lossRate_forParticipantID___block_invoke;
      block[3] = &unk_2645B7C20;
      block[4] = self;
      dispatch_after(v9, global_queue, block);
    }
    if (!self->congestionState && self->goodChannels != v7)
    {
      self->goodChannels = v7;
      if ([(VoiceChatSessionRoster *)self->_roster recalculateFocusRating]) {
        [(VoiceChatSessionRoster *)self->_roster updateBeacon];
      }
    }
  }
  [(GKRWLock *)self->_rwLock unlock];
}

uint64_t __95__GKVoiceChatSessionInternal_VideoConferenceChannelQualityDelegate__lossRate_forParticipantID___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 120) wrlock];
  if ([*(id *)(*(void *)(a1 + 32) + 128) isFocus]) {
    [*(id *)(a1 + 32) pruneBadLinks];
  }
  [*(id *)(a1 + 32) unPauseAll];
  *(_DWORD *)(*(void *)(a1 + 32) + 160) = 2;
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__GKVoiceChatSessionInternal_VideoConferenceChannelQualityDelegate__lossRate_forParticipantID___block_invoke_2;
  block[3] = &unk_2645B7C20;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, global_queue, block);
  return [*(id *)(*(void *)(a1 + 32) + 120) unlock];
}

uint64_t __95__GKVoiceChatSessionInternal_VideoConferenceChannelQualityDelegate__lossRate_forParticipantID___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 160) = 0;
  [*(id *)(*(void *)(a1 + 32) + 120) wrlock];
  if ([*(id *)(*(void *)(a1 + 32) + 136) recalculateFocusRating]) {
    [*(id *)(*(void *)(a1 + 32) + 136) updateBeacon];
  }
  dispatch_time_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  return [v2 unlock];
}

- (void)parseMutedPeers:forPeer:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v1, v2, " [%s] %s:%d parseMutedPeers failed to deserialize. %s", v3, v4, v5, v6, v7);
}

- (void)parseConnectedPeers:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v1, v2, " [%s] %s:%d parseConnectedPeers failed to deserialize. %s", v3, v4, v5, v6, v7);
}

@end