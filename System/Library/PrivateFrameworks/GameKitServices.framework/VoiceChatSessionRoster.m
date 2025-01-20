@interface VoiceChatSessionRoster
- (BOOL)hasFocus;
- (BOOL)recalculateFocusRating;
- (GKVoiceChatPeerInfoProvider)gameStateSession;
- (VoiceChatSessionRoster)initWithGameStateSession:(id)a3 peerID:(id)a4 voiceChatSession:(id)a5 sendQueue:(id)a6;
- (id)subscribedPeers;
- (unsigned)focusID;
- (void)calculateFocus:(id)a3;
- (void)cleanup;
- (void)configureDeviceRating;
- (void)dealloc;
- (void)peer:(id)a3 didChangeState:(unsigned int)a4;
- (void)processSubscribeBeacon:(tagVoiceChatBeacon *)a3 beaconState:(id)a4 fromPeer:(id)a5;
- (void)processUnsubscribeBeacon:(tagVoiceChatBeacon *)a3 beaconState:(id)a4 fromPeer:(id)a5;
- (void)receivedBeacon:(id)a3 fromPeer:(id)a4;
- (void)sendBeacon:(tagVoiceChatBeacon *)a3 ToPeer:(id)a4;
- (void)sendBeacons;
- (void)startBeacon;
- (void)stopBeacon;
- (void)updateBeacon;
@end

@implementation VoiceChatSessionRoster

- (GKVoiceChatPeerInfoProvider)gameStateSession
{
  return (GKVoiceChatPeerInfoProvider *)objc_loadWeak((id *)&self->_gameStateSession);
}

- (VoiceChatSessionRoster)initWithGameStateSession:(id)a3 peerID:(id)a4 voiceChatSession:(id)a5 sendQueue:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)VoiceChatSessionRoster;
  v10 = [(VoiceChatSessionRoster *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_gkvs = (GKVoiceChatSessionInternal *)a5;
    objc_storeWeak((id *)&v10->_gameStateSession, a3);
    v11->_peerID = (NSString *)[a4 copy];
    v11->_connectedPeers = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "connectedPeerIDs"), "mutableCopy");
    dispatch_retain((dispatch_object_t)a6);
    v11->_sendQueue = (OS_dispatch_queue *)a6;
    pthread_mutex_init(&v11->resMutex, 0);
    *(_WORD *)&v11->_needsUpdateBeaconList = 1;
    *(void *)&v11->_chosenFocusRating = 0;
    *(void *)&v11->_deviceRating = 0;
    v11->_isBeaconUp = 0;
    [(VoiceChatSessionRoster *)v11 configureDeviceRating];
    v11->_peerStateTable = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
    v11->_hasFocus = 0;
  }
  return v11;
}

- (void)dealloc
{
  sendQueue = self->_sendQueue;
  if (sendQueue)
  {
    dispatch_release(sendQueue);
    self->_sendQueue = 0;
  }
  objc_storeWeak((id *)&self->_gameStateSession, 0);

  self->_peerID = 0;
  self->_connectedPeers = 0;

  self->_peerStateTable = 0;
  v4.receiver = self;
  v4.super_class = (Class)VoiceChatSessionRoster;
  [(VoiceChatSessionRoster *)&v4 dealloc];
}

- (void)cleanup
{
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  self->_gkvs = 0;
  pthread_mutex_unlock(p_resMutex);
}

- (unsigned)focusID
{
  return self->_focusID;
}

- (void)configureDeviceRating
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  *(_OWORD *)v19 = 0u;
  long long v20 = 0u;
  size_t v8 = 64;
  sysctlbyname("hw.model", v19, &v8, 0, 0);
  if (!strncasecmp("j1", v19, 2uLL)
    || !strncasecmp("j2", v19, 2uLL)
    || !strncasecmp("n94", v19, 3uLL)
    || !strncasecmp("k93", v19, 3uLL)
    || !strncasecmp("k94", v19, 3uLL)
    || !strncasecmp("k95", v19, 3uLL))
  {
    unsigned int v3 = 40;
    goto LABEL_13;
  }
  if (!strncasecmp("n90", v19, 3uLL) || !strncasecmp("n92", v19, 3uLL) || !strncasecmp("n81", v19, 3uLL))
  {
    unsigned int v7 = 30;
  }
  else
  {
    if (strncasecmp("n88", v19, 3uLL))
    {
      unsigned int v3 = 45;
LABEL_13:
      self->_unsigned int deviceRating = v3;
      [(GKVoiceChatSessionInternal *)self->_gkvs setIsUsingSuppression:0];
      goto LABEL_14;
    }
    unsigned int v7 = 15;
  }
  self->_unsigned int deviceRating = v7;
LABEL_14:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int deviceRating = self->_deviceRating;
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      v12 = "-[VoiceChatSessionRoster configureDeviceRating]";
      __int16 v13 = 1024;
      int v14 = 1256;
      __int16 v15 = 2080;
      v16 = v19;
      __int16 v17 = 1024;
      unsigned int v18 = deviceRating;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d hwModel %s device rating is %u", buf, 0x2Cu);
    }
  }
}

- (BOOL)recalculateFocusRating
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  uint64_t v4 = self->_gkvs;
  pthread_mutex_unlock(p_resMutex);
  unsigned int v5 = [(GKVoiceChatSessionInternal *)v4 peerCount];
  unsigned int v6 = [(GKVoiceChatSessionInternal *)v4 goodChannels];
  unsigned int v7 = [(GKVoiceChatSessionInternal *)v4 talkingPeersLimit];

  if (v5 - 4 >= 5) {
    unsigned int v8 = v5 >> 1;
  }
  else {
    unsigned int v8 = dword_2215E8A20[v5 - 4];
  }
  if (v6 >= v8) {
    unsigned int v9 = v5;
  }
  else {
    unsigned int v9 = v6;
  }
  if (v9 >= v7) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = v9;
  }
  unsigned int focusRating = self->_focusRating;
  unsigned int v12 = self->_deviceRating | (v10 << 8);
  if (v12 != focusRating)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int deviceRating = self->_deviceRating;
        unsigned int v15 = self->_focusRating;
        int v19 = 136316674;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        long long v22 = "-[VoiceChatSessionRoster recalculateFocusRating]";
        __int16 v23 = 1024;
        int v24 = 1300;
        __int16 v25 = 1024;
        unsigned int v26 = v15;
        __int16 v27 = 1024;
        unsigned int v28 = v12;
        __int16 v29 = 1024;
        unsigned int v30 = v10;
        __int16 v31 = 1024;
        unsigned int v32 = deviceRating;
        _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Focus rating updated from %d to %d (%d and %d)", (uint8_t *)&v19, 0x34u);
      }
    }
    pthread_mutex_lock(p_resMutex);
    self->_unsigned int focusRating = v12;
    unsigned int focusID = self->_focusID;
    if (focusID == [(NSString *)self->_peerID longLongValue]) {
      self->_chosenFocusRating = self->_focusRating;
    }
    pthread_mutex_unlock(p_resMutex);
  }
  return v12 != focusRating;
}

- (void)startBeacon
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(VoiceChatSessionRoster *)self recalculateFocusRating];
  pthread_mutex_lock(&self->resMutex);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  connectedPeers = self->_connectedPeers;
  uint64_t v4 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(connectedPeers);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        unsigned int v9 = (VoiceChatSessionBeaconState *)[(NSMutableDictionary *)self->_peerStateTable objectForKeyedSubscript:v8];
        if (!v9)
        {
          unsigned int v9 = objc_alloc_init(VoiceChatSessionBeaconState);
          [(NSMutableDictionary *)self->_peerStateTable setObject:v9 forKeyedSubscript:v8];
        }
        [(VoiceChatSessionBeaconState *)v9 setNeedsSend:1];
        [(VoiceChatSessionBeaconState *)v9 setTypeToSend:0];
        self->_needsUpdateBeaconList = 1;
      }
      uint64_t v5 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  if (!self->_isBeaconUp) {
    self->_isBeaconUp = 1;
  }
  [(VoiceChatSessionRoster *)self sendBeacons];
  self->_chosenFocusRating = 0;
  self->_unsigned int focusID = 0;
  self->_hasFocus = 0;
  if (!self->_waitingToCalculateFocus)
  {
    self->_waitingToCalculateFocus = 1;
    objc_msgSend(MEMORY[0x263F08B88], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 0.5));
  }
  pthread_mutex_unlock(&self->resMutex);
}

- (void)updateBeacon
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  connectedPeers = self->_connectedPeers;
  uint64_t v5 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(connectedPeers);
        }
        unsigned int v9 = (void *)[(NSMutableDictionary *)self->_peerStateTable objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9)
        {
          long long v10 = v9;
          [v9 setNeedsSend:1];
          [v10 setTypeToSend:0];
          self->_needsUpdateBeaconList = 1;
        }
      }
      uint64_t v6 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(VoiceChatSessionRoster *)self sendBeacons];
  if (!self->_waitingToCalculateFocus)
  {
    self->_waitingToCalculateFocus = 1;
    objc_msgSend(MEMORY[0x263F08B88], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 0.5));
  }
  pthread_mutex_unlock(p_resMutex);
}

- (void)stopBeacon
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  connectedPeers = self->_connectedPeers;
  uint64_t v5 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(connectedPeers);
        }
        unsigned int v9 = (void *)[(NSMutableDictionary *)self->_peerStateTable objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        [v9 setNeedsSend:1];
        [v9 setTypeToSend:1];
      }
      uint64_t v6 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  if (self->_isBeaconUp)
  {
    [(VoiceChatSessionRoster *)self sendBeacons];
    self->_isBeaconUp = 0;
  }
  self->_chosenFocusRating = 0;
  self->_unsigned int focusID = 0;
  self->_hasFocus = 0;
  pthread_mutex_unlock(p_resMutex);
}

- (void)sendBeacon:(tagVoiceChatBeacon *)a3 ToPeer:(id)a4
{
  uint64_t v6 = -[GKVoiceChatSessionMessage initWithPayload:conferenceID:subtype:]([GKVoiceChatSessionMessage alloc], "initWithPayload:conferenceID:subtype:", [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a3 length:20 freeWhenDone:0], -[GKVoiceChatSessionInternal conferenceID](self->_gkvs, "conferenceID"), 1);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:a4];
  uint64_t v8 = [(VoiceChatSessionRoster *)self gameStateSession];
  sendQueue = self->_sendQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__VoiceChatSessionRoster_sendBeacon_ToPeer___block_invoke;
  block[3] = &unk_2645B7C90;
  block[4] = v8;
  block[5] = v6;
  block[6] = v7;
  dispatch_async(sendQueue, block);
}

uint64_t __44__VoiceChatSessionRoster_sendBeacon_ToPeer___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendVoiceChatData:toPeers:error:", objc_msgSend(*(id *)(a1 + 40), "data"), *(void *)(a1 + 48), &v2);
}

- (void)sendBeacons
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (self->_isBeaconUp)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F086B0]);
    unsigned int v3 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    connectedPeers = self->_connectedPeers;
    uint64_t v6 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v6)
    {
      unint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v22;
      for (uint64_t i = *(void *)v22; ; uint64_t i = *(void *)v22)
      {
        if (i != v9) {
          objc_enumerationMutation(connectedPeers);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        long long v12 = (void *)[(NSMutableDictionary *)self->_peerStateTable objectForKeyedSubscript:v11];
        if ([v12 needsSend])
        {
          [v4 addObject:v11];
          memset(buf, 170, 20);
          *(_DWORD *)&uint8_t buf[4] = bswap32([v12 typeToSend]);
          unsigned int v13 = [v12 receivedState];
          unsigned int v14 = bswap32(self->_focusID);
          *(_DWORD *)&buf[12] = bswap32(self->_focusRating);
          *(_DWORD *)&buf[16] = v14;
          *(_DWORD *)buf = bswap32(v13);
          *(_DWORD *)&buf[8] = 0x1000000;
          if ([v3 count]) {
            [v3 setObject:v11 atIndexedSubscript:0];
          }
          else {
            [v3 addObject:v11];
          }
          [(VoiceChatSessionRoster *)self sendBeacon:buf ToPeer:v3];
          [v12 setNeedsSend:0];
          if ([v12 typeToSend]) {
            uint64_t v15 = 2;
          }
          else {
            uint64_t v15 = 1;
          }
          [v12 setSentState:v15];
        }
        if (++v8 >= v7)
        {
          uint64_t v16 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v21 objects:v30 count:16];
          if (!v16) {
            break;
          }
          unint64_t v7 = v16;
          uint64_t v8 = 0;
        }
      }
    }
    self->_needsUpdateBeaconList = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      unsigned int v18 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v4) {
          int v19 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
        }
        else {
          int v19 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VoiceChatSessionRoster sendBeacons]";
        __int16 v26 = 1024;
        int v27 = 1475;
        __int16 v28 = 2080;
        __int16 v29 = v19;
        _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendBeacons : sendPeerList %s ", buf, 0x26u);
      }
    }
  }
}

- (void)calculateFocus:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v24 = objc_alloc_init(MEMORY[0x263F086B0]);
  [MEMORY[0x263F08B88] sleepUntilDate:a3];
  pthread_mutex_lock(&self->resMutex);
  unsigned int chosenFocusRating = self->_chosenFocusRating;
  unsigned int focusID = self->_focusID;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  connectedPeers = self->_connectedPeers;
  uint64_t v8 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(connectedPeers);
        }
        long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unsigned int v13 = (void *)[(NSMutableDictionary *)self->_peerStateTable objectForKeyedSubscript:v12];
        if ([v13 receivedState] == 1)
        {
          uint64_t v14 = [v13 lastReceivedBeacon];
          unsigned int v15 = *(_DWORD *)(v14 + 12);
          if (v15 > chosenFocusRating
            || v15 == chosenFocusRating && focusID > [v12 longLongValue])
          {
            unsigned int focusID = [v12 longLongValue];
            unsigned int chosenFocusRating = *(_DWORD *)(v14 + 12);
          }
        }
      }
      uint64_t v9 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v9);
  }
  unsigned int focusRating = self->_focusRating;
  if (focusRating <= chosenFocusRating)
  {
    if (chosenFocusRating != focusRating) {
      goto LABEL_18;
    }
    p_peerID = &self->_peerID;
    if (focusID <= [(NSString *)self->_peerID longLongValue]) {
      goto LABEL_18;
    }
  }
  else
  {
    p_peerID = &self->_peerID;
    unsigned int chosenFocusRating = self->_focusRating;
  }
  unsigned int focusID = [(NSString *)*p_peerID longLongValue];
LABEL_18:
  if (focusID == self->_focusID)
  {
    int v18 = 0;
  }
  else
  {
    self->_unsigned int focusID = focusID;
    int v18 = 1;
  }
  self->_unsigned int chosenFocusRating = chosenFocusRating;
  self->_waitingToCalculateFocus = 0;
  self->_hasFocus = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    id v20 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = self->_chosenFocusRating;
      unsigned int v21 = self->_focusID;
      *(_DWORD *)buf = 136316418;
      uint64_t v30 = v19;
      __int16 v31 = 2080;
      unsigned int v32 = "-[VoiceChatSessionRoster calculateFocus:]";
      __int16 v33 = 1024;
      int v34 = 1545;
      __int16 v35 = 1024;
      unsigned int v36 = v21;
      __int16 v37 = 1024;
      unsigned int v38 = v22;
      __int16 v39 = 1024;
      int v40 = v18;
      _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The focus that we calculated is %u with value %d.  did change? %d", buf, 0x2Eu);
    }
  }
  long long v23 = self->_gkvs;
  pthread_mutex_unlock(&self->resMutex);
  [(GKVoiceChatSessionInternal *)v23 updatedFocusID:self->_focusID];
}

- (void)peer:(id)a3 didChangeState:(unsigned int)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  if (a4 == 5)
  {
LABEL_4:
    if (([(NSMutableArray *)self->_connectedPeers containsObject:a3] & 1) == 0)
    {
      self->_needsUpdateBeaconList = 1;
      uint64_t v8 = (void *)[a3 copy];
      [(NSMutableArray *)self->_connectedPeers addObject:v8];
      uint64_t v9 = objc_alloc_init(VoiceChatSessionBeaconState);
      [(VoiceChatSessionBeaconState *)v9 setNeedsSend:1];
      [(VoiceChatSessionBeaconState *)v9 setTypeToSend:0];
      [(NSMutableDictionary *)self->_peerStateTable setObject:v9 forKeyedSubscript:v8];
    }
    goto LABEL_12;
  }
  if (a4 != 3)
  {
    if (a4 == 2) {
      goto LABEL_4;
    }
LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  if (![(NSMutableArray *)self->_connectedPeers containsObject:a3]) {
    goto LABEL_12;
  }
  int v10 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", a3), "receivedState");
  BOOL v11 = v10 == 1;
  if (v10 == 1)
  {
    unsigned int focusID = self->_focusID;
    if (focusID == [a3 longLongValue])
    {
      self->_unsigned int chosenFocusRating = 0;
      self->_unsigned int focusID = 0;
      self->_hasFocus = 0;
      if (!self->_waitingToCalculateFocus)
      {
        self->_waitingToCalculateFocus = 1;
        objc_msgSend(MEMORY[0x263F08B88], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 0.5));
      }
    }
  }
  [(NSMutableArray *)self->_connectedPeers removeObject:a3];
  [(NSMutableDictionary *)self->_peerStateTable removeObjectForKey:a3];
LABEL_13:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      connectedPeers = self->_connectedPeers;
      if (connectedPeers) {
        uint64_t v16 = (const char *)objc_msgSend((id)-[NSMutableArray description](connectedPeers, "description"), "UTF8String");
      }
      else {
        uint64_t v16 = "<nil>";
      }
      int v18 = 136315906;
      uint64_t v19 = v13;
      __int16 v20 = 2080;
      unsigned int v21 = "-[VoiceChatSessionRoster peer:didChangeState:]";
      __int16 v22 = 1024;
      int v23 = 1606;
      __int16 v24 = 2080;
      long long v25 = v16;
      _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VoiceChatSessionRoster: is connected %s", (uint8_t *)&v18, 0x26u);
    }
  }
  if (self->_needsUpdateBeaconList) {
    [(VoiceChatSessionRoster *)self sendBeacons];
  }
  uint64_t v17 = self->_gkvs;
  pthread_mutex_unlock(p_resMutex);
  if (v11) {
    [(GKVoiceChatSessionInternal *)v17 updatedSubscribedBeaconList:[(VoiceChatSessionRoster *)self subscribedPeers]];
  }
}

- (void)receivedBeacon:(id)a3 fromPeer:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
  pthread_mutex_lock(&self->resMutex);
  uint64_t v8 = [a3 bytes];
  *(int8x8_t *)uint64_t v8 = vrev32_s8(*(int8x8_t *)v8);
  *(int8x8_t *)(v8 + 12) = vrev32_s8(*(int8x8_t *)(v8 + 12));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(_DWORD *)(v8 + 4);
      if (a4) {
        long long v12 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        long long v12 = "<nil>";
      }
      int v18 = 136316162;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      unsigned int v21 = "-[VoiceChatSessionRoster receivedBeacon:fromPeer:]";
      __int16 v22 = 1024;
      int v23 = 1635;
      __int16 v24 = 1024;
      int v25 = v11;
      __int16 v26 = 2080;
      long long v27 = v12;
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Session sent stream %u from %s", (uint8_t *)&v18, 0x2Cu);
    }
  }
  if (a4 && [(NSMutableArray *)self->_connectedPeers containsObject:a4])
  {
    uint64_t v13 = (void *)[(NSMutableDictionary *)self->_peerStateTable objectForKeyedSubscript:a4];
    [v13 setLastReceivedBeacon:v8];
    int v14 = *(_DWORD *)(v8 + 4);
    if (v14 == 1)
    {
      [(VoiceChatSessionRoster *)self processUnsubscribeBeacon:v8 beaconState:v13 fromPeer:a4];
    }
    else if (v14)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315650;
          uint64_t v19 = v15;
          __int16 v20 = 2080;
          unsigned int v21 = "-[VoiceChatSessionRoster receivedBeacon:fromPeer:]";
          __int16 v22 = 1024;
          int v23 = 1655;
          _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Don't understand beacon type", (uint8_t *)&v18, 0x1Cu);
        }
      }
    }
    else
    {
      [(VoiceChatSessionRoster *)self processSubscribeBeacon:v8 beaconState:v13 fromPeer:a4];
    }
  }
  if (self->_needsUpdateBeaconList) {
    [(VoiceChatSessionRoster *)self sendBeacons];
  }
  uint64_t v17 = self->_gkvs;
  pthread_mutex_unlock(&self->resMutex);
  [(GKVoiceChatSessionInternal *)v17 updatedSubscribedBeaconList:[(VoiceChatSessionRoster *)self subscribedPeers]];
}

- (void)processUnsubscribeBeacon:(tagVoiceChatBeacon *)a3 beaconState:(id)a4 fromPeer:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v9 = [(VoiceChatSessionRoster *)self gameStateSession];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKVoiceChatPeerInfoProvider *)v9 displayNameForPeer:[(GKVoiceChatSessionInternal *)self->_gkvs encodePeerID:a5]])
      {
        long long v12 = (const char *)objc_msgSend((id)objc_msgSend((id)-[GKVoiceChatPeerInfoProvider displayNameForPeer:](v9, "displayNameForPeer:", -[GKVoiceChatSessionInternal encodePeerID:](self->_gkvs, "encodePeerID:", a5)), "description"), "UTF8String");
        if (a5)
        {
LABEL_5:
          uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
LABEL_8:
          unsigned int focusID = self->_focusID;
          int v16 = 136316418;
          uint64_t v17 = v10;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VoiceChatSessionRoster processUnsubscribeBeacon:beaconState:fromPeer:]";
          __int16 v20 = 1024;
          int v21 = 1681;
          __int16 v22 = 2080;
          int v23 = v12;
          __int16 v24 = 2080;
          int v25 = v13;
          __int16 v26 = 1024;
          unsigned int v27 = focusID;
          _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processUnsubscribeBeacon from %s (%s), _unsigned int focusID = %u", (uint8_t *)&v16, 0x36u);
          goto LABEL_9;
        }
      }
      else
      {
        long long v12 = "<nil>";
        if (a5) {
          goto LABEL_5;
        }
      }
      uint64_t v13 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  if (a3->var1 == 1)
  {
    unsigned int v15 = self->_focusID;
    if (v15 == [a5 longLongValue])
    {
      self->_unsigned int chosenFocusRating = 0;
      self->_unsigned int focusID = 0;
      self->_hasFocus = 0;
      if (!self->_waitingToCalculateFocus)
      {
        self->_waitingToCalculateFocus = 1;
        objc_msgSend(MEMORY[0x263F08B88], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 0.5));
      }
    }
    [a4 setReceivedState:2];
  }
}

- (void)processSubscribeBeacon:(tagVoiceChatBeacon *)a3 beaconState:(id)a4 fromPeer:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!a3->var1)
  {
    if (self->_focusID == [a5 longLongValue])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int chosenFocusRating = self->_chosenFocusRating;
          unsigned int focusID = self->_focusID;
          unsigned int var3 = a3->var3;
          int v19 = 136316418;
          uint64_t v20 = v8;
          __int16 v21 = 2080;
          __int16 v22 = "-[VoiceChatSessionRoster processSubscribeBeacon:beaconState:fromPeer:]";
          __int16 v23 = 1024;
          int v24 = 1709;
          __int16 v25 = 1024;
          unsigned int v26 = focusID;
          __int16 v27 = 1024;
          unsigned int v28 = chosenFocusRating;
          __int16 v29 = 1024;
          unsigned int v30 = var3;
          _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processSubscribeBeacon: Our focus %d changed rating from %d to %d", (uint8_t *)&v19, 0x2Eu);
        }
      }
      unsigned int v13 = a3->var3;
      self->_unsigned int chosenFocusRating = v13;
    }
    else
    {
      unsigned int v13 = self->_chosenFocusRating;
    }
    if (a3->var3 >= v13 && !self->_waitingToCalculateFocus)
    {
      self->_waitingToCalculateFocus = 1;
      objc_msgSend(MEMORY[0x263F08B88], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 0.5));
    }
    unsigned int var0 = a3->var0;
    if (var0 != [a4 sentState])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        int v16 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v17 = a3->var0;
          unsigned int v18 = [a4 sentState];
          int v19 = 136316162;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          __int16 v22 = "-[VoiceChatSessionRoster processSubscribeBeacon:beaconState:fromPeer:]";
          __int16 v23 = 1024;
          int v24 = 1725;
          __int16 v25 = 1024;
          unsigned int v26 = v17;
          __int16 v27 = 1024;
          unsigned int v28 = v18;
          _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d beaconHeader->receivedState = %d, beaconState.sentState = %d", (uint8_t *)&v19, 0x28u);
        }
      }
      [a4 setNeedsSend:1];
      self->_needsUpdateBeaconList = 1;
    }
    [a4 setReceivedState:1];
  }
}

- (id)subscribedPeers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  uint64_t v4 = (void *)[MEMORY[0x263EFF980] arrayWithArray:self->_connectedPeers];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  connectedPeers = self->_connectedPeers;
  uint64_t v6 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(connectedPeers);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", v10), "receivedState") != 1)objc_msgSend(v4, "removeObject:", v10); {
      }
        }
      uint64_t v7 = [(NSMutableArray *)connectedPeers countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  pthread_mutex_unlock(p_resMutex);
  return v4;
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

@end