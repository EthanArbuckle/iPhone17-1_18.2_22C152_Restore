@interface GKSessionInternal
- (BOOL)acceptConnectionFromPeer:(id)a3 error:(id *)a4;
- (BOOL)checkDNSConnection;
- (BOOL)filterService:(const char *)a3 withPID:(unsigned int)a4;
- (BOOL)isAvailable;
- (BOOL)isBusy;
- (BOOL)isPeerBusy:(id)a3;
- (BOOL)isShuttingDown;
- (BOOL)parseServiceName:(const char *)a3 intoDisplayName:(id *)a4 pid:(unsigned int *)a5 state:(id *)a6;
- (BOOL)passesSendDataSanityCheck:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6;
- (BOOL)sendAudioData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6;
- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 enableOOB:(BOOL)a6 error:(id *)a7;
- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6;
- (BOOL)sendDataToAllPeers:(id)a3 withDataMode:(unsigned int)a4 error:(id *)a5;
- (BOOL)sendVoiceChatData:(id)a3 toPeers:(id)a4 error:(id *)a5;
- (BOOL)tryConnectToPeer:(id)a3;
- (BOOL)wifiEnabled;
- (GKConnection)connection;
- (GKSessionDelegate)delegate;
- (GKSessionInternal)initWithConnection:(id)a3 session:(id)a4 delegate:(id)a5;
- (GKSessionInternal)initWithSessionID:(id)a3 displayName:(id)a4 session:(id)a5 sessionMode:(unsigned int)a6;
- (GKSessionPrivateDelegate)privateDelegate;
- (NSArray)connectedPeerIDs;
- (NSString)description;
- (NSString)displayName;
- (NSString)domain;
- (NSString)peerID;
- (NSString)serviceType;
- (NSString)sessionID;
- (OpaqueAGPSession)agpSessionRef;
- (OpaqueGCKSession)sessionRef;
- (double)disconnectTimeout;
- (id)dataReceiveHandler;
- (id)displayNameForPeer:(id)a3;
- (id)newNSErrorFromGKSessionError:(int)a3 description:(id)a4 reason:(id)a5;
- (id)newNSErrorFromHRESULT:(int)a3 description:(id)a4 reason:(id)a5;
- (id)peersWithConnectionState:(unsigned int)a3;
- (id)serviceName;
- (id)stringForGCKID:(unsigned int)a3;
- (id)voiceChatSessionListener;
- (unint64_t)maxPeers;
- (unint64_t)port;
- (unsigned)sessionMode;
- (void)browse;
- (void)cancelConnectToPeer:(id)a3;
- (void)cleanupExAvailablePeers;
- (void)connectToPeer:(id)a3 withTimeout:(double)a4;
- (void)dealloc;
- (void)denyConnectionFromPeer:(id)a3;
- (void)didFindService:(const char *)a3 fromIF:(const char *)a4 withError:(int)a5 moreComing:(BOOL)a6;
- (void)didLookupHostname:(_DNSServiceRef_t *)a3 forPeer:(id)a4 hostName:(const char *)a5 address:(const sockaddr_in *)a6 interface:(unsigned int)a7 withError:(int)a8 moreComing:(BOOL)a9;
- (void)didPublishWithError:(int)a3;
- (void)didRemoveService:(const char *)a3 fromIF:(const char *)a4 withError:(int)a5 moreComing:(BOOL)a6;
- (void)didResolveService:(_DNSServiceRef_t *)a3 forPeer:(id)a4 hostName:(const char *)a5 port:(unsigned __int16)a6 interface:(unsigned int)a7 txtLen:(unsigned __int16)a8 txtRecord:(const void *)a9 withError:(int)a10 moreComing:(BOOL)a11;
- (void)didUpdateTXTRecordForPeer:(id)a3 fromIF:(const char *)a4 txtLen:(unsigned __int16)a5 txtRecord:(const void *)a6 withError:(int)a7 moreComing:(BOOL)a8;
- (void)disconnectFromAllPeers;
- (void)disconnectPeerFromAllPeers:(id)a3;
- (void)handleEvents;
- (void)handleNewGKOOBAudioMessage:(id)a3 messageData:(id)a4 remotePID:(unsigned int)a5 callbackData:(id *)a6 maxCallbackCount:(int)a7 checkDelegateCallbackSelector:(BOOL *)a8 tellDelegateSelector:(SEL *)a9 callbackCount:(int *)a10;
- (void)lock;
- (void)processTXTRecordForPeer:(id)a3 txtLen:(unsigned __int16)a4 txtRecord:(const void *)a5;
- (void)publish;
- (void)receiveDOOB:(id)a3 fromPeer:(id)a4 inSession:(id)a5 context:(void *)a6;
- (void)reset;
- (void)sendCallbacksToDelegate:(id *)a3 remotePeer:(unsigned int)a4;
- (void)setAgpSessionRef:(OpaqueAGPSession *)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setBusy:(BOOL)a3;
- (void)setDOOBReceiveHandler:(id)a3 withContext:(void *)a4 inBand:(unsigned int)a5;
- (void)setDataReceiveHandler:(id)a3 withContext:(void *)a4;
- (void)setDelegate:(id)a3;
- (void)setDisconnectTimeout:(double)a3;
- (void)setDisplayName:(id)a3 forPeer:(unsigned int)a4;
- (void)setDomain:(id)a3;
- (void)setMaxPeers:(unint64_t)a3;
- (void)setPort:(unint64_t)a3;
- (void)setPrivateDelegate:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionRef:(OpaqueGCKSession *)a3;
- (void)setWifiEnabled:(BOOL)a3;
- (void)stopOldService;
- (void)stopResolvingAllPeers;
- (void)tellDelegate_connectionRequestToPeerFailed:(id)a3;
- (void)tellDelegate_didConnectPeer:(id)a3;
- (void)tellDelegate_didDisconnectPeer:(id)a3;
- (void)tellDelegate_didReceiveBand_RetryICE:(id)a3;
- (void)tellDelegate_didReceiveData:(id)a3;
- (void)tellDelegate_didReceiveDataFromPeerWithContext:(id)a3;
- (void)tellDelegate_gotInvited:(id)a3;
- (void)tellDelegate_initiateRelay:(id)a3;
- (void)tellDelegate_isConnectingPeer:(id)a3;
- (void)tellDelegate_networkStatisticsChanged:(id)a3;
- (void)tellDelegate_peerDidBecomeAvailable:(id)a3;
- (void)tellDelegate_peerDidBecomeBusy:(id)a3;
- (void)tellDelegate_peerDidBecomeUnavailable:(id)a3;
- (void)tellDelegate_sessionDidFailWithError:(id)a3;
- (void)tellDelegate_updateRelay:(id)a3;
- (void)timeoutConnectToPeer:(id)a3;
- (void)unlock;
@end

@implementation GKSessionInternal

- (BOOL)isShuttingDown
{
  return self->_shutdown;
}

- (id)newNSErrorFromHRESULT:(int)a3 description:(id)a4 reason:(id)a5
{
  v6 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a4 && a5)
  {
    id v9 = objc_alloc(NSDictionary);
    v6 = objc_msgSend(v9, "initWithObjectsAndKeys:", a4, *MEMORY[0x263F08320], a5, *MEMORY[0x263F08338], 0);
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.gamekit.GKSessionErrorDomain" code:a3 userInfo:v6];

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      v17 = "-[GKSessionInternal(_private) newNSErrorFromHRESULT:description:reason:]";
      __int16 v18 = 1024;
      int v19 = 733;
      __int16 v20 = 1024;
      int v21 = a3;
      __int16 v22 = 2112;
      uint64_t v23 = [v10 localizedDescription];
      _os_log_error_impl(&dword_221563000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Error: %d -- %@.", buf, 0x2Cu);
    }
  }
  return v10;
}

- (id)newNSErrorFromGKSessionError:(int)a3 description:(id)a4 reason:(id)a5
{
  v6 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a4 && a5)
  {
    id v9 = objc_alloc(NSDictionary);
    v6 = objc_msgSend(v9, "initWithObjectsAndKeys:", a4, *MEMORY[0x263F08320], a5, *MEMORY[0x263F08338], 0);
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.gamekit.GKSessionErrorDomain" code:a3 userInfo:v6];

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      v17 = "-[GKSessionInternal(_private) newNSErrorFromGKSessionError:description:reason:]";
      __int16 v18 = 1024;
      int v19 = 747;
      __int16 v20 = 1024;
      int v21 = a3;
      __int16 v22 = 2112;
      uint64_t v23 = [v10 localizedDescription];
      _os_log_error_impl(&dword_221563000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Error: %d -- %@.", buf, 0x2Cu);
    }
  }
  return v10;
}

- (void)setDisplayName:(id)a3 forPeer:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = [(GKTable *)self->_peerInfoTable objectForKey:*(void *)&a4];
  if (v7)
  {
    v8 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v8 displayName];
        displayName = self->_displayName;
        int v16 = 136316674;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        int v19 = "-[GKSessionInternal(_private) setDisplayName:forPeer:]";
        __int16 v20 = 1024;
        int v21 = 768;
        __int16 v22 = 1024;
        int v23 = v4;
        __int16 v24 = 2112;
        uint64_t v25 = v11;
        __int16 v26 = 2112;
        id v27 = a3;
        __int16 v28 = 2112;
        v29 = displayName;
        _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setDisplayNameForPeer: %d => %@ (try set to %@)  (this is %@)", (uint8_t *)&v16, 0x40u);
      }
    }
    [v8 tryDetruncateDisplayName:a3];
    a3 = (id)[v8 displayName];
  }
  [(GKTable *)self->_peerNameTable setObject:a3 forKey:v4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = self->_displayName;
      int v16 = 136316418;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      int v19 = "-[GKSessionInternal(_private) setDisplayName:forPeer:]";
      __int16 v20 = 1024;
      int v21 = 775;
      __int16 v22 = 1024;
      int v23 = v4;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)a3;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setDisplayNameForPeer: %d => %@  (this is %@)", (uint8_t *)&v16, 0x36u);
    }
  }
}

- (void)tellDelegate_sessionDidFailWithError:(id)a3
{
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_sessionDidFailWithError:]();
      }
    }
  }
  else
  {
    uint64_t v4 = [a3 objectForKeyedSubscript:@"NSError"];
    v5 = self;
    pthread_mutex_lock(&self->_delegateLock);
    v6 = [(GKSessionInternal *)self delegate];
    [(GKSessionDelegate *)v6 session:self->_session didFailWithError:v4];

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_didConnectPeer:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_didConnectPeer:]();
      }
    }
    goto LABEL_37;
  }
  v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
  int v28 = 0;
  v6 = (void *)[a3 objectForKeyedSubscript:@"data"];
  uint64_t v7 = 2;
  if (v6)
  {
    [v6 getBytes:&v28 length:4];
    if (v28) {
      uint64_t v7 = 5;
    }
    else {
      uint64_t v7 = 2;
    }
  }
  pthread_mutex_lock(&self->_delegateLock);
  v8 = [(GKSessionInternal *)self delegate];
  uint64_t v9 = [(GKSessionInternal *)self privateDelegate];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
      {
        id v27 = (const char *)objc_msgSend((id)-[GKSessionPrivateDelegate description](v9, "description"), "UTF8String");
        if (v8) {
          goto LABEL_13;
        }
      }
      else
      {
        id v27 = "<nil>";
        if (v8)
        {
LABEL_13:
          __int16 v26 = (const char *)objc_msgSend((id)-[GKSessionDelegate description](v8, "description"), "UTF8String");
          if (v5)
          {
LABEL_14:
            v12 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
LABEL_18:
            int v13 = [(GKList *)self->_peersConnected count];
            unint64_t maxPeers = self->maxPeers;
            *(_DWORD *)buf = 136316930;
            uint64_t v30 = v10;
            __int16 v31 = 2080;
            v32 = "-[GKSessionInternal(_private) tellDelegate_didConnectPeer:]";
            __int16 v33 = 1024;
            int v34 = 820;
            __int16 v35 = 2080;
            v36 = (void *)v27;
            __int16 v37 = 2080;
            v38 = v26;
            __int16 v39 = 2080;
            *(void *)v40 = v12;
            *(_WORD *)&v40[8] = 1024;
            int v41 = v13 + 1;
            __int16 v42 = 1024;
            int v43 = maxPeers;
            _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%s, %s]: didConnectToPeer: %s -- cur/max: %d/%d", buf, 0x46u);
            goto LABEL_19;
          }
LABEL_17:
          v12 = "<nil>";
          goto LABEL_18;
        }
      }
      __int16 v26 = "<nil>";
      if (v5) {
        goto LABEL_14;
      }
      goto LABEL_17;
    }
  }
LABEL_19:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v16 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        uint64_t v17 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        uint64_t v17 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v15;
      __int16 v31 = 2080;
      v32 = "-[GKSessionInternal(_private) tellDelegate_didConnectPeer:]";
      __int16 v33 = 1024;
      int v34 = 822;
      __int16 v35 = 2080;
      v36 = (void *)v17;
      _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d did-connect-to-peer.%s", buf, 0x26u);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      int v19 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = [(GKList *)self->_peersConnected count];
        unint64_t v21 = self->maxPeers;
        *(_DWORD *)buf = 136316674;
        uint64_t v30 = v18;
        __int16 v31 = 2080;
        v32 = "-[GKSessionInternal(_private) tellDelegate_didConnectPeer:]";
        __int16 v33 = 1024;
        int v34 = 825;
        __int16 v35 = 2112;
        v36 = v9;
        __int16 v37 = 2112;
        v38 = (const char *)v5;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = v20 + 1;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)&v40[6] = v21;
        _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: didConnectToPeer: %@ -- cur/max: %d/%d", buf, 0x3Cu);
      }
    }
    [(GKSessionPrivateDelegate *)v9 session:self->_session peer:v5 didChangeState:v7];
  }
  if (v8 != v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      int v23 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = [(GKList *)self->_peersConnected count];
        unint64_t v25 = self->maxPeers;
        *(_DWORD *)buf = 136316674;
        uint64_t v30 = v22;
        __int16 v31 = 2080;
        v32 = "-[GKSessionInternal(_private) tellDelegate_didConnectPeer:]";
        __int16 v33 = 1024;
        int v34 = 830;
        __int16 v35 = 2112;
        v36 = v8;
        __int16 v37 = 2112;
        v38 = (const char *)v5;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = v24 + 1;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)&v40[6] = v25;
        _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: didConnectToPeer: %@ -- cur/max: %d/%d", buf, 0x3Cu);
      }
    }
    [(GKSessionDelegate *)v8 session:self->_session peer:v5 didChangeState:v7];
  }

  pthread_mutex_unlock(&self->_delegateLock);
  [(GKVoiceChatSessionListener *)self->_voiceChatListener session:self peer:v5 didChangeState:v7];
LABEL_37:
}

- (void)tellDelegate_didDisconnectPeer:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_didDisconnectPeer:]();
      }
    }
    goto LABEL_27;
  }
  v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
  pthread_mutex_lock(&self->_delegateLock);
  v6 = [(GKSessionInternal *)self delegate];
  uint64_t v7 = [(GKSessionInternal *)self privateDelegate];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
      {
        uint64_t v18 = (const char *)objc_msgSend((id)-[GKSessionPrivateDelegate description](v7, "description"), "UTF8String");
        if (v6) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v18 = "<nil>";
        if (v6)
        {
LABEL_9:
          uint64_t v10 = (const char *)objc_msgSend((id)-[GKSessionDelegate description](v6, "description"), "UTF8String");
          if (v5)
          {
LABEL_10:
            uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
LABEL_14:
            int v12 = [(GKList *)self->_peersConnected count];
            unint64_t maxPeers = self->maxPeers;
            *(_DWORD *)buf = 136316930;
            uint64_t v20 = v8;
            __int16 v21 = 2080;
            uint64_t v22 = "-[GKSessionInternal(_private) tellDelegate_didDisconnectPeer:]";
            __int16 v23 = 1024;
            int v24 = 856;
            __int16 v25 = 2080;
            __int16 v26 = v18;
            __int16 v27 = 2080;
            int v28 = v10;
            __int16 v29 = 2080;
            uint64_t v30 = v11;
            __int16 v31 = 1024;
            int v32 = v12 + 1;
            __int16 v33 = 1024;
            int v34 = maxPeers;
            _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tell [%s, %s] didDisconnectFromPeer: %s -- cur/max: %d/%d", buf, 0x46u);
            goto LABEL_15;
          }
LABEL_13:
          uint64_t v11 = "<nil>";
          goto LABEL_14;
        }
      }
      uint64_t v10 = "<nil>";
      if (v5) {
        goto LABEL_10;
      }
      goto LABEL_13;
    }
  }
LABEL_15:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        int v16 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        int v16 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      uint64_t v22 = "-[GKSessionInternal(_private) tellDelegate_didDisconnectPeer:]";
      __int16 v23 = 1024;
      int v24 = 858;
      __int16 v25 = 2080;
      __int16 v26 = v16;
      _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d did-disconnect-from-peer.%s", buf, 0x26u);
    }
  }
  uint64_t v17 = self;
  if (objc_opt_respondsToSelector()) {
    [(GKSessionPrivateDelegate *)v7 session:self->_session peer:v5 didChangeState:3];
  }
  if (v6 != v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [(GKSessionDelegate *)v6 session:self->_session peer:v5 didChangeState:3];
  }

  pthread_mutex_unlock(&self->_delegateLock);
  [(GKVoiceChatSessionListener *)self->_voiceChatListener session:self peer:v5 didChangeState:3];

LABEL_27:
}

- (void)tellDelegate_isConnectingPeer:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_isConnectingPeer:]();
      }
    }
  }
  else
  {
    v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v8 = "<nil>";
        }
        int v14 = 136315906;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        uint64_t v17 = "-[GKSessionInternal(_private) tellDelegate_isConnectingPeer:]";
        __int16 v18 = 1024;
        int v19 = 891;
        __int16 v20 = 2080;
        __int16 v21 = v8;
        _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isConnectingPeer: %s", (uint8_t *)&v14, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v11 = "<nil>";
        }
        int v14 = 136315906;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        uint64_t v17 = "-[GKSessionInternal(_private) tellDelegate_isConnectingPeer:]";
        __int16 v18 = 1024;
        int v19 = 892;
        __int16 v20 = 2080;
        __int16 v21 = v11;
        _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d is-connecting-to-peer.%s", (uint8_t *)&v14, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    int v12 = [(GKSessionInternal *)self delegate];
    int v13 = [(GKSessionInternal *)self privateDelegate];
    if (objc_opt_respondsToSelector()) {
      [(GKSessionPrivateDelegate *)v13 session:self->_session peer:v5 didChangeState:4];
    }
    if (v12 != v13 && (objc_opt_respondsToSelector() & 1) != 0) {
      [(GKSessionDelegate *)v12 session:self->_session peer:v5 didChangeState:4];
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_peerDidBecomeAvailable:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_peerDidBecomeAvailable:]();
      }
    }
  }
  else
  {
    v5 = (char *)[a3 objectForKeyedSubscript:@"peerID"];
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        __int16 v16 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeAvailable:]";
        __int16 v17 = 1024;
        int v18 = 919;
        __int16 v19 = 2112;
        __int16 v20 = v5;
        _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerDidBecomeAvailable: %@", (uint8_t *)&v13, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v10 = "<nil>";
        }
        int v13 = 136315906;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        __int16 v16 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeAvailable:]";
        __int16 v17 = 1024;
        int v18 = 921;
        __int16 v19 = 2080;
        __int16 v20 = v10;
        _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer-did-become-available.%s", (uint8_t *)&v13, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    uint64_t v11 = [(GKSessionInternal *)self delegate];
    int v12 = [(GKSessionInternal *)self privateDelegate];
    if (objc_opt_respondsToSelector()) {
      [(GKSessionPrivateDelegate *)v12 session:self->_session peer:v5 didChangeState:0];
    }
    if (v11 != v12 && (objc_opt_respondsToSelector() & 1) != 0) {
      [(GKSessionDelegate *)v11 session:self->_session peer:v5 didChangeState:0];
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_peerDidBecomeUnavailable:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_peerDidBecomeUnavailable:]();
      }
    }
  }
  else
  {
    v5 = (char *)[a3 objectForKeyedSubscript:@"peerID"];
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        __int16 v16 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeUnavailable:]";
        __int16 v17 = 1024;
        int v18 = 948;
        __int16 v19 = 2112;
        __int16 v20 = v5;
        _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerDidBecomeUnavailable: %@", (uint8_t *)&v13, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v10 = "<nil>";
        }
        int v13 = 136315906;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        __int16 v16 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeUnavailable:]";
        __int16 v17 = 1024;
        int v18 = 950;
        __int16 v19 = 2080;
        __int16 v20 = v10;
        _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer-did-become-unavailable.%s", (uint8_t *)&v13, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    uint64_t v11 = [(GKSessionInternal *)self delegate];
    int v12 = [(GKSessionInternal *)self privateDelegate];
    if (objc_opt_respondsToSelector()) {
      [(GKSessionPrivateDelegate *)v12 session:self->_session peer:v5 didChangeState:1];
    }
    if (v11 != v12 && (objc_opt_respondsToSelector() & 1) != 0) {
      [(GKSessionDelegate *)v11 session:self->_session peer:v5 didChangeState:1];
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_didReceiveBand_RetryICE:(id)a3
{
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_didReceiveBand_RetryICE:]();
      }
    }
  }
  else
  {
    uint64_t v4 = [a3 objectForKeyedSubscript:@"peerID"];
    uint64_t v5 = [a3 objectForKeyedSubscript:@"data"];
    pthread_mutex_lock(&self->_delegateLock);
    uint64_t v6 = self->_doobReceiveHandler[1];
    if (v6) {
      [(GKSessionDOOBReceiveHandler *)v6 receiveDOOB:v5 fromPeer:v4 inSession:self->_session context:self->_doobReceiveHandlerContext[1]];
    }
    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_didReceiveData:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!self->_shutdown)
  {
    uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
    uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"data"];
    pthread_mutex_lock(&self->_delegateLock);
    id v7 = [(GKSessionInternal *)self dataReceiveHandler];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x263F21098];
      uint64_t v10 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v12 = v8;
          __int16 v13 = 2080;
          uint64_t v14 = "-[GKSessionInternal(_private) tellDelegate_didReceiveData:]";
          __int16 v15 = 1024;
          int v16 = 1000;
          __int16 v17 = 2048;
          int v18 = [(GKSessionInternal *)self delegate];
          __int16 v19 = 2048;
          __int16 v20 = [(GKSessionInternal *)self privateDelegate];
          __int16 v21 = 1024;
          int v22 = [v6 length];
          __int16 v23 = 2080;
          uint64_t v24 = [v5 UTF8String];
          _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate[%p, %p]_didReceiveData of length [%d] from [%s]", buf, 0x40u);
          if (!v7) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        uint64_t v14 = "-[GKSessionInternal(_private) tellDelegate_didReceiveData:]";
        __int16 v15 = 1024;
        int v16 = 1000;
        __int16 v17 = 2048;
        int v18 = [(GKSessionInternal *)self delegate];
        __int16 v19 = 2048;
        __int16 v20 = [(GKSessionInternal *)self privateDelegate];
        __int16 v21 = 1024;
        int v22 = [v6 length];
        __int16 v23 = 2080;
        uint64_t v24 = [v5 UTF8String];
        _os_log_debug_impl(&dword_221563000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d tellDelegate[%p, %p]_didReceiveData of length [%d] from [%s]", buf, 0x40u);
        if (!v7) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    if (!v7)
    {
LABEL_13:

      pthread_mutex_unlock(&self->_delegateLock);
      goto LABEL_14;
    }
LABEL_12:
    [v7 receiveData:v6 fromPeer:v5 inSession:self->_session context:self->_dataReceiveHandlerContext];
    goto LABEL_13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      -[GKSessionInternal(_private) tellDelegate_didReceiveData:]();
    }
  }
LABEL_14:
}

- (void)tellDelegate_didReceiveDataFromPeerWithContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_didReceiveDataFromPeerWithContext:]();
      }
    }
    goto LABEL_16;
  }
  uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
  uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"data"];
  id v7 = [(GKSessionInternal *)self dataReceiveHandler];
  if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
    goto LABEL_11;
  }
  uint64_t v8 = VRTraceErrorLogLevelToCSTR();
  uint64_t v9 = *MEMORY[0x263F21098];
  uint64_t v10 = *MEMORY[0x263F21098];
  if (*MEMORY[0x263F21088])
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316674;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      int v18 = "-[GKSessionInternal(_private) tellDelegate_didReceiveDataFromPeerWithContext:]";
      __int16 v19 = 1024;
      int v20 = 1024;
      __int16 v21 = 2048;
      *(void *)int v22 = [(GKSessionInternal *)self delegate];
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = [(GKSessionInternal *)self privateDelegate];
      __int16 v23 = 1024;
      int v24 = [v6 length];
      __int16 v25 = 2080;
      uint64_t v26 = [v5 UTF8String];
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate[%p, %p]_didReceiveData of length [%d] from [%s]", (uint8_t *)&v15, 0x40u);
      if (!v7) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
LABEL_11:
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_11;
  }
  int v15 = 136316674;
  uint64_t v16 = v8;
  __int16 v17 = 2080;
  int v18 = "-[GKSessionInternal(_private) tellDelegate_didReceiveDataFromPeerWithContext:]";
  __int16 v19 = 1024;
  int v20 = 1024;
  __int16 v21 = 2048;
  *(void *)int v22 = [(GKSessionInternal *)self delegate];
  *(_WORD *)&v22[8] = 2048;
  *(void *)&v22[10] = [(GKSessionInternal *)self privateDelegate];
  __int16 v23 = 1024;
  int v24 = [v6 length];
  __int16 v25 = 2080;
  uint64_t v26 = [v5 UTF8String];
  _os_log_debug_impl(&dword_221563000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d tellDelegate[%p, %p]_didReceiveData of length [%d] from [%s]", (uint8_t *)&v15, 0x40u);
  if (!v7) {
    goto LABEL_16;
  }
LABEL_12:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v6 length];
      uint64_t v14 = [v5 UTF8String];
      int v15 = 136316162;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      int v18 = "-[GKSessionInternal(_private) tellDelegate_didReceiveDataFromPeerWithContext:]";
      __int16 v19 = 1024;
      int v20 = 1027;
      __int16 v21 = 1024;
      *(_DWORD *)int v22 = v13;
      *(_WORD *)&v22[4] = 2080;
      *(void *)&v22[6] = v14;
      _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Inform handler did receiveVoiceChatData of length=%d from peerID=%s", (uint8_t *)&v15, 0x2Cu);
    }
  }
  [v7 receiveVoiceChatData:v6 fromPeer:v5];
LABEL_16:
}

- (void)tellDelegate_gotInvited:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_gotInvited:]();
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      id v7 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v8 = "<nil>";
        }
        int v15 = 136315906;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        int v18 = "-[GKSessionInternal(_private) tellDelegate_gotInvited:]";
        __int16 v19 = 1024;
        int v20 = 1043;
        __int16 v21 = 2080;
        int v22 = (void *)v8;
        _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d did-receive-connection-request-from-peer.%s", (uint8_t *)&v15, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    uint64_t v9 = [(GKSessionInternal *)self delegate];
    uint64_t v10 = [(GKSessionInternal *)self privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136316162;
          uint64_t v16 = v11;
          __int16 v17 = 2080;
          int v18 = "-[GKSessionInternal(_private) tellDelegate_gotInvited:]";
          __int16 v19 = 1024;
          int v20 = 1049;
          __int16 v21 = 2112;
          int v22 = v10;
          __int16 v23 = 2112;
          int v24 = v5;
          _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ didReceiveConnectionRequestFromPeer: %@", (uint8_t *)&v15, 0x30u);
        }
      }
      [(GKSessionPrivateDelegate *)v10 session:self->_session didReceiveConnectionRequestFromPeer:v5];
    }
    if (v9 != v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136316162;
          uint64_t v16 = v13;
          __int16 v17 = 2080;
          int v18 = "-[GKSessionInternal(_private) tellDelegate_gotInvited:]";
          __int16 v19 = 1024;
          int v20 = 1053;
          __int16 v21 = 2112;
          int v22 = v9;
          __int16 v23 = 2112;
          int v24 = v5;
          _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ didReceiveConnectionRequestFromPeer: %@", (uint8_t *)&v15, 0x30u);
        }
      }
      [(GKSessionDelegate *)v9 session:self->_session didReceiveConnectionRequestFromPeer:v5];
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_connectionRequestToPeerFailed:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_connectionRequestToPeerFailed:]();
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
    uint64_t v6 = [a3 objectForKeyedSubscript:@"NSError"];
    id v7 = self;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v10 = "<nil>";
        }
        int v17 = 136315906;
        uint64_t v18 = v8;
        __int16 v19 = 2080;
        int v20 = "-[GKSessionInternal(_private) tellDelegate_connectionRequestToPeerFailed:]";
        __int16 v21 = 1024;
        int v22 = 1076;
        __int16 v23 = 2080;
        int v24 = (void *)v10;
        _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connection-request-to-peer-failed.%s", (uint8_t *)&v17, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    uint64_t v11 = [(GKSessionInternal *)self delegate];
    uint64_t v12 = [(GKSessionInternal *)self privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136316162;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          int v20 = "-[GKSessionInternal(_private) tellDelegate_connectionRequestToPeerFailed:]";
          __int16 v21 = 1024;
          int v22 = 1082;
          __int16 v23 = 2112;
          int v24 = v12;
          __int16 v25 = 2112;
          uint64_t v26 = v5;
          _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ connectionRequestToPeerFailed: %@", (uint8_t *)&v17, 0x30u);
        }
      }
      [(GKSessionPrivateDelegate *)v12 session:self->_session connectionWithPeerFailed:v5 withError:v6];
    }
    if (v11 != v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136316162;
          uint64_t v18 = v15;
          __int16 v19 = 2080;
          int v20 = "-[GKSessionInternal(_private) tellDelegate_connectionRequestToPeerFailed:]";
          __int16 v21 = 1024;
          int v22 = 1086;
          __int16 v23 = 2112;
          int v24 = v11;
          __int16 v25 = 2112;
          uint64_t v26 = v5;
          _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ connectionRequestToPeerFailed: %@", (uint8_t *)&v17, 0x30u);
        }
      }
      [(GKSessionDelegate *)v11 session:self->_session connectionWithPeerFailed:v5 withError:v6];
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_peerDidBecomeBusy:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_peerDidBecomeBusy:]();
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      id v7 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v8 = "<nil>";
        }
        int v12 = 136315906;
        uint64_t v13 = v6;
        __int16 v14 = 2080;
        uint64_t v15 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeBusy:]";
        __int16 v16 = 1024;
        int v17 = 1107;
        __int16 v18 = 2080;
        __int16 v19 = (void *)v8;
        _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer-did-become-busy.%s", (uint8_t *)&v12, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    uint64_t v9 = [(GKSessionInternal *)self privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136316162;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          uint64_t v15 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeBusy:]";
          __int16 v16 = 1024;
          int v17 = 1112;
          __int16 v18 = 2112;
          __int16 v19 = v9;
          __int16 v20 = 2112;
          __int16 v21 = v5;
          _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: peerDidBecomeBusy: %@", (uint8_t *)&v12, 0x30u);
        }
      }
      [(GKSessionPrivateDelegate *)v9 session:self->_session peerDidBecomeBusy:v5];
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_initiateRelay:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_initiateRelay:]();
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
    uint64_t v6 = [a3 objectForKeyedSubscript:@"dict"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v9 = "<nil>";
        }
        int v17 = 136315906;
        uint64_t v18 = v7;
        __int16 v19 = 2080;
        __int16 v20 = "-[GKSessionInternal(_private) tellDelegate_initiateRelay:]";
        __int16 v21 = 1024;
        int v22 = 1130;
        __int16 v23 = 2080;
        int v24 = (void *)v9;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initiate-relay.%s", (uint8_t *)&v17, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        __int16 v20 = "-[GKSessionInternal(_private) tellDelegate_initiateRelay:]";
        __int16 v21 = 1024;
        int v22 = 1132;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate_initiateRelay", (uint8_t *)&v17, 0x1Cu);
      }
    }
    if (+[GKConnection isRelayEnabled])
    {
      pthread_mutex_lock(&self->_delegateLock);
      int v12 = [(GKSessionInternal *)self privateDelegate];
      if (objc_opt_respondsToSelector())
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          __int16 v14 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 136316418;
            uint64_t v18 = v13;
            __int16 v19 = 2080;
            __int16 v20 = "-[GKSessionInternal(_private) tellDelegate_initiateRelay:]";
            __int16 v21 = 1024;
            int v22 = 1141;
            __int16 v23 = 2112;
            int v24 = v12;
            __int16 v25 = 2112;
            uint64_t v26 = v6;
            __int16 v27 = 2112;
            int v28 = v5;
            _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: initiateRelay: %@ forPeer: %@", (uint8_t *)&v17, 0x3Au);
          }
        }
        [(GKSessionPrivateDelegate *)v12 session:self->_session initiateRelay:v6 forPeer:v5];
      }
      else if (objc_opt_respondsToSelector())
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          __int16 v16 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 136316418;
            uint64_t v18 = v15;
            __int16 v19 = 2080;
            __int16 v20 = "-[GKSessionInternal(_private) tellDelegate_initiateRelay:]";
            __int16 v21 = 1024;
            int v22 = 1146;
            __int16 v23 = 2112;
            int v24 = v12;
            __int16 v25 = 2112;
            uint64_t v26 = v6;
            __int16 v27 = 2112;
            int v28 = v5;
            _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: initiateRelay: %@ forPeer: %@", (uint8_t *)&v17, 0x3Au);
          }
        }
        [(GKSessionPrivateDelegate *)v12 session:self->_session initiateRelay:v6];
      }

      pthread_mutex_unlock(&self->_delegateLock);
    }
  }
}

- (void)tellDelegate_updateRelay:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_updateRelay:]();
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
    uint64_t v6 = [a3 objectForKeyedSubscript:@"dict"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v9 = "<nil>";
        }
        int v17 = 136315906;
        uint64_t v18 = v7;
        __int16 v19 = 2080;
        __int16 v20 = "-[GKSessionInternal(_private) tellDelegate_updateRelay:]";
        __int16 v21 = 1024;
        int v22 = 1162;
        __int16 v23 = 2080;
        int v24 = (void *)v9;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d update-relay.%s", (uint8_t *)&v17, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        __int16 v20 = "-[GKSessionInternal(_private) tellDelegate_updateRelay:]";
        __int16 v21 = 1024;
        int v22 = 1164;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate_updateRelay", (uint8_t *)&v17, 0x1Cu);
      }
    }
    if (+[GKConnection isRelayEnabled])
    {
      pthread_mutex_lock(&self->_delegateLock);
      int v12 = [(GKSessionInternal *)self privateDelegate];
      if (objc_opt_respondsToSelector())
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          __int16 v14 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 136316418;
            uint64_t v18 = v13;
            __int16 v19 = 2080;
            __int16 v20 = "-[GKSessionInternal(_private) tellDelegate_updateRelay:]";
            __int16 v21 = 1024;
            int v22 = 1173;
            __int16 v23 = 2112;
            int v24 = v12;
            __int16 v25 = 2112;
            uint64_t v26 = v6;
            __int16 v27 = 2112;
            int v28 = v5;
            _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: initiateRelay: %@ forPeer: %@", (uint8_t *)&v17, 0x3Au);
          }
        }
        [(GKSessionPrivateDelegate *)v12 session:self->_session initiateRelay:v6 forPeer:v5];
      }
      else if (objc_opt_respondsToSelector())
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          __int16 v16 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 136316418;
            uint64_t v18 = v15;
            __int16 v19 = 2080;
            __int16 v20 = "-[GKSessionInternal(_private) tellDelegate_updateRelay:]";
            __int16 v21 = 1024;
            int v22 = 1178;
            __int16 v23 = 2112;
            int v24 = v12;
            __int16 v25 = 2112;
            uint64_t v26 = v6;
            __int16 v27 = 2112;
            int v28 = v5;
            _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: updateRelay: %@ forPeer: %@", (uint8_t *)&v17, 0x3Au);
          }
        }
        [(GKSessionPrivateDelegate *)v12 session:self->_session updateRelay:v6];
      }

      pthread_mutex_unlock(&self->_delegateLock);
    }
  }
}

- (void)tellDelegate_networkStatisticsChanged:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal(_private) tellDelegate_networkStatisticsChanged:]();
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"peerID"];
    uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"dict"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v9 = "<nil>";
        }
        int v16 = 136315906;
        uint64_t v17 = v7;
        __int16 v18 = 2080;
        __int16 v19 = "-[GKSessionInternal(_private) tellDelegate_networkStatisticsChanged:]";
        __int16 v20 = 1024;
        int v21 = 1194;
        __int16 v22 = 2080;
        __int16 v23 = (void *)v9;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d network-stats-changed.%s", (uint8_t *)&v16, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v6) {
          int v12 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
        }
        else {
          int v12 = "<nil>";
        }
        int v16 = 136315906;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        __int16 v19 = "-[GKSessionInternal(_private) tellDelegate_networkStatisticsChanged:]";
        __int16 v20 = 1024;
        int v21 = 1196;
        __int16 v22 = 2080;
        __int16 v23 = (void *)v12;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate_networkStatisticsChanged: [%s]", (uint8_t *)&v16, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    uint64_t v13 = [(GKSessionInternal *)self privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136316162;
          uint64_t v17 = v14;
          __int16 v18 = 2080;
          __int16 v19 = "-[GKSessionInternal(_private) tellDelegate_networkStatisticsChanged:]";
          __int16 v20 = 1024;
          int v21 = 1201;
          __int16 v22 = 2112;
          __int16 v23 = v13;
          __int16 v24 = 2112;
          __int16 v25 = v6;
          _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: stats-changed: %@", (uint8_t *)&v16, 0x30u);
        }
      }
      [(GKSessionPrivateDelegate *)v13 session:self->_session networkStatisticsChanged:v6];
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (BOOL)parseServiceName:(const char *)a3 intoDisplayName:(id *)a4 pid:(unsigned int *)a5 state:(id *)a6
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  __int16 v62 = -21846;
  __int16 v60 = -21846;
  char v61 = -86;
  __int16 v59 = -21846;
  int v57 = -1431655766;
  int v58 = -1431655766;
  if (sscanf(a3, "%2c", &v62) <= 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x263F21098];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v64 = v11;
    __int16 v65 = 2080;
    v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
    __int16 v67 = 1024;
    int v68 = 1240;
    __int16 v69 = 2080;
    *(void *)v70 = a3;
    uint64_t v15 = " [%s] %s:%d parseServiceName: invalid format: %s";
    goto LABEL_38;
  }
  if (v62 - 65 > 0x19)
  {
    if (v62 - 97 > 0x19)
    {
      if (v62 == 95) {
        char v16 = 63;
      }
      else {
        char v16 = 64;
      }
      if (v62 == 45) {
        unsigned __int8 v10 = 62;
      }
      else {
        unsigned __int8 v10 = v16;
      }
      if (v62 - 48 < 0xA) {
        unsigned __int8 v10 = v62 - 48;
      }
    }
    else
    {
      unsigned __int8 v10 = v62 - 61;
    }
  }
  else
  {
    unsigned __int8 v10 = v62 - 55;
  }
  unsigned int v17 = v10;
  unsigned int v18 = HIBYTE(v62) - 48;
  if (HIBYTE(v62) == 95) {
    char v19 = 63;
  }
  else {
    char v19 = 64;
  }
  if (HIBYTE(v62) == 45) {
    char v19 = 62;
  }
  if (v18 >= 0xA) {
    LOBYTE(v18) = v19;
  }
  if (HIBYTE(v62) - 97 <= 0x19) {
    unsigned __int8 v20 = HIBYTE(v62) - 61;
  }
  else {
    unsigned __int8 v20 = v18;
  }
  unsigned __int8 v21 = HIBYTE(v62) - 55;
  if (HIBYTE(v62) - 65 > 0x19) {
    unsigned __int8 v21 = v20;
  }
  if (v17 > 0x3F || (int v22 = v21, v21 >= 0x40u))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x263F21098];
    BOOL v29 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v29) {
      return result;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v64 = v28;
    __int16 v65 = 2080;
    v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
    __int16 v67 = 1024;
    int v68 = 1246;
    __int16 v69 = 2080;
    *(void *)v70 = a3;
    uint64_t v15 = " [%s] %s:%d parseServiceName: invalid version: %s";
    goto LABEL_38;
  }
  if (v17 | v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      __int16 v24 = *MEMORY[0x263F21098];
      BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v25) {
        return result;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v64 = v23;
      __int16 v65 = 2080;
      v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
      __int16 v67 = 1024;
      int v68 = 1251;
      __int16 v69 = 1024;
      *(_DWORD *)v70 = v17;
      *(_WORD *)&v70[4] = 1024;
      *(_DWORD *)&v70[6] = v22;
      uint64_t v15 = " [%s] %s:%d parseServiceName: unsupported version: %d-%d";
      uint64_t v26 = v24;
      uint32_t v27 = 40;
      goto LABEL_39;
    }
    return 0;
  }
  if (sscanf(a3, "%*2c%6c%3c%n", &v58, &v60, &v57) <= 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x263F21098];
    BOOL v31 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v31)
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v64 = v30;
      __int16 v65 = 2080;
      v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
      __int16 v67 = 1024;
      int v68 = 1258;
      __int16 v69 = 2080;
      *(void *)v70 = a3;
      uint64_t v15 = " [%s] %s:%d parseServiceName: invalid format: %s";
LABEL_38:
      uint64_t v26 = v12;
      uint32_t v27 = 38;
LABEL_39:
      _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, v15, buf, v27);
      return 0;
    }
    return result;
  }
  if (v58 - 65 <= 0x19)
  {
    unsigned __int8 v32 = v58 - 55;
LABEL_54:
    int v33 = v32;
    goto LABEL_55;
  }
  if (v58 - 97 <= 0x19)
  {
    unsigned __int8 v32 = v58 - 61;
    goto LABEL_54;
  }
  unsigned __int8 v32 = v58 - 48;
  if (v58 - 48 < 0xA) {
    goto LABEL_54;
  }
  if (v58 != 95)
  {
    if (v58 != 45) {
      goto LABEL_110;
    }
    unsigned __int8 v32 = 62;
    goto LABEL_54;
  }
  int v33 = 63;
LABEL_55:
  if (BYTE1(v58) - 65 <= 0x19)
  {
    unsigned __int8 v34 = BYTE1(v58) - 55;
LABEL_63:
    int v35 = v34;
    goto LABEL_64;
  }
  if (BYTE1(v58) - 97 <= 0x19)
  {
    unsigned __int8 v34 = BYTE1(v58) - 61;
    goto LABEL_63;
  }
  unsigned __int8 v34 = BYTE1(v58) - 48;
  if (BYTE1(v58) - 48 < 0xA) {
    goto LABEL_63;
  }
  if (BYTE1(v58) != 95)
  {
    if (BYTE1(v58) != 45) {
      goto LABEL_110;
    }
    unsigned __int8 v34 = 62;
    goto LABEL_63;
  }
  int v35 = 63;
LABEL_64:
  if (BYTE2(v58) - 65 <= 0x19)
  {
    unsigned __int8 v36 = BYTE2(v58) - 55;
LABEL_72:
    int v37 = v36 << 12;
    goto LABEL_73;
  }
  if (BYTE2(v58) - 97 <= 0x19)
  {
    unsigned __int8 v36 = BYTE2(v58) - 61;
    goto LABEL_72;
  }
  unsigned __int8 v36 = BYTE2(v58) - 48;
  if (BYTE2(v58) - 48 < 0xA) {
    goto LABEL_72;
  }
  if (BYTE2(v58) != 95)
  {
    if (BYTE2(v58) != 45) {
      goto LABEL_110;
    }
    unsigned __int8 v36 = 62;
    goto LABEL_72;
  }
  int v37 = 258048;
LABEL_73:
  if (HIBYTE(v58) - 65 <= 0x19)
  {
    unsigned __int8 v38 = HIBYTE(v58) - 55;
LABEL_81:
    int v39 = v38 << 18;
    goto LABEL_82;
  }
  if (HIBYTE(v58) - 97 <= 0x19)
  {
    unsigned __int8 v38 = HIBYTE(v58) - 61;
    goto LABEL_81;
  }
  unsigned __int8 v38 = HIBYTE(v58) - 48;
  if (HIBYTE(v58) - 48 < 0xA) {
    goto LABEL_81;
  }
  if (HIBYTE(v58) != 95)
  {
    if (HIBYTE(v58) != 45) {
      goto LABEL_110;
    }
    unsigned __int8 v38 = 62;
    goto LABEL_81;
  }
  int v39 = 16515072;
LABEL_82:
  if (v59 - 65 <= 0x19)
  {
    unsigned int v40 = v59 - 55;
LABEL_90:
    int v41 = v40 << 24;
    goto LABEL_91;
  }
  if (v59 - 97 <= 0x19)
  {
    unsigned int v40 = v59 - 61;
    goto LABEL_90;
  }
  unsigned int v40 = v59 - 48;
  if (v40 < 0xA) {
    goto LABEL_90;
  }
  if (v59 != 95)
  {
    if (v59 == 45)
    {
      unsigned int v40 = 62;
      goto LABEL_90;
    }
LABEL_110:
    int v45 = -3;
    goto LABEL_111;
  }
  int v41 = 1056964608;
LABEL_91:
  if (HIBYTE(v59) - 65 <= 0x19)
  {
    char v42 = HIBYTE(v59) - 55;
    goto LABEL_95;
  }
  if (HIBYTE(v59) - 97 <= 0x19)
  {
    char v42 = HIBYTE(v59) - 61;
    goto LABEL_95;
  }
  unsigned int v46 = HIBYTE(v59) - 48;
  if (v46 >= 0xA)
  {
    if (HIBYTE(v59) != 45)
    {
      BOOL v43 = HIBYTE(v59) == 95;
      int v44 = -4;
LABEL_96:
      if (v43) {
        int v45 = v44;
      }
      else {
        int v45 = v44 + 1;
      }
      goto LABEL_111;
    }
    char v42 = 62;
LABEL_95:
    BOOL v43 = (v42 & 0x7C) == 4;
    int v44 = -5;
    goto LABEL_96;
  }
  if ((v46 & 0x7C) != 4 && v46 > 3u) {
    int v45 = -4;
  }
  else {
    int v45 = -5;
  }
  if (v46 >= 4u)
  {
LABEL_111:
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v49 = VRTraceErrorLogLevelToCSTR();
    v50 = *MEMORY[0x263F21098];
    BOOL v51 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v51)
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v64 = v49;
      __int16 v65 = 2080;
      v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
      __int16 v67 = 1024;
      int v68 = 1265;
      __int16 v69 = 2080;
      *(void *)v70 = a3;
      *(_WORD *)&v70[8] = 1024;
      int v71 = v45;
      uint64_t v15 = " [%s] %s:%d parseServiceName: invalid peer ID: %s (%d)";
      uint64_t v26 = v50;
      uint32_t v27 = 44;
      goto LABEL_39;
    }
    return result;
  }
  if (v60 == 65)
  {
    uint64_t v48 = MEMORY[0x263EFFA80];
    goto LABEL_123;
  }
  if (v60 == 66)
  {
    uint64_t v48 = MEMORY[0x263EFFA88];
LABEL_123:
    unsigned int v52 = v33 | (v35 << 6) | v37 | v39 | v41 | (v46 << 30);
    v53 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v48, @"busy", 0);
    *a5 = v52;
    id v54 = [NSString alloc];
    *a4 = (id)[v54 initWithUTF8String:&a3[v57]];
    *a6 = v53;
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return 0;
  }
  uint64_t v55 = VRTraceErrorLogLevelToCSTR();
  int v12 = *MEMORY[0x263F21098];
  BOOL v56 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v56)
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v64 = v55;
    __int16 v65 = 2080;
    v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
    __int16 v67 = 1024;
    int v68 = 1275;
    __int16 v69 = 2080;
    *(void *)v70 = a3;
    uint64_t v15 = " [%s] %s:%d parseServiceName: busy state missing: %s";
    goto LABEL_38;
  }
  return result;
}

- (id)serviceName
{
  char v2 = 0;
  uint64_t v3 = 0;
  __int16 v11 = -21846;
  int v10 = -1431655766;
  unsigned int pid = self->_pid;
  do
  {
    unsigned int v5 = (pid >> v2) & 0x3F;
    char v6 = v5 + 48;
    if (v5 >= 0xA) {
      char v6 = v5 + 55;
    }
    if (v5 >= 0x24) {
      char v6 = v5 + 61;
    }
    if (v5 == 63) {
      char v6 = 95;
    }
    if (v5 == 62) {
      char v7 = 45;
    }
    else {
      char v7 = v6;
    }
    *((unsigned char *)&v10 + v3++) = v7;
    v2 += 6;
  }
  while (v3 != 6);
  char v12 = 0;
  uint64_t v8 = 65;
  if (self->_isBusy) {
    uint64_t v8 = 66;
  }
  return (id)[NSString stringWithFormat:@"00%s%c..%@", &v10, v8, self->_displayName];
}

- (void)stopResolvingAllPeers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_connection)
  {
    [(GKTable *)self->_peerInfoTable makeObjectsPerformSelector:sel_clearResolving];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        dnsServiceResolveConnection = self->_dnsServiceResolveConnection;
        int v7 = 136315906;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        int v10 = "-[GKSessionInternal(_private) stopResolvingAllPeers]";
        __int16 v11 = 1024;
        int v12 = 1305;
        __int16 v13 = 1024;
        int v14 = (int)dnsServiceResolveConnection;
        _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_dnsServiceResolveConnection) (%08X)", (uint8_t *)&v7, 0x22u);
      }
    }
    char v6 = self->_dnsServiceResolveConnection;
    if (v6) {
      DNSServiceRefDeallocate(v6);
    }
    self->_dnsServiceResolveConnection = 0;
  }
}

- (void)didPublishWithError:(int)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    char v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v5;
      __int16 v19 = 2080;
      unsigned __int8 v20 = "-[GKSessionInternal(_private) didPublishWithError:]";
      __int16 v21 = 1024;
      int v22 = 1313;
      __int16 v23 = 1024;
      int v24 = a3;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didPublish: %d", buf, 0x22u);
    }
  }
  if (a3)
  {
    if (self->_service)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          service = self->_service;
          *(_DWORD *)buf = 136315906;
          uint64_t v18 = v7;
          __int16 v19 = 2080;
          unsigned __int8 v20 = "-[GKSessionInternal(_private) didPublishWithError:]";
          __int16 v21 = 1024;
          int v22 = 1317;
          __int16 v23 = 1024;
          int v24 = (int)service;
          _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_service) (%08X)", buf, 0x22u);
        }
      }
      DNSServiceRefDeallocate(self->_service);
      self->_service = 0;
    }
    if (self->_mode == 2 && self->_serviceBrowser)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        __int16 v11 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          serviceBrowser = self->_serviceBrowser;
          *(_DWORD *)buf = 136315906;
          uint64_t v18 = v10;
          __int16 v19 = 2080;
          unsigned __int8 v20 = "-[GKSessionInternal(_private) didPublishWithError:]";
          __int16 v21 = 1024;
          int v22 = 1322;
          __int16 v23 = 1024;
          int v24 = (int)serviceBrowser;
          _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X)", buf, 0x22u);
        }
      }
      DNSServiceRefDeallocate(self->_serviceBrowser);
      self->_serviceBrowser = 0;
    }
    if (self->_sessionStarted)
    {
      __int16 v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.gamekit.GKSessionErrorDomain" code:a3 userInfo:0];
      int v14 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v13, @"NSError", 0);
      pthread_mutex_lock(&self->_delegateLock);
      [(GKSessionInternal *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(GKSessionInternal *)self performSelectorOnMainThread:sel_tellDelegate_sessionDidFailWithError_ withObject:v14 waitUntilDone:0];
      }
      pthread_mutex_unlock(&self->_delegateLock);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        char v16 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          [(GKSessionInternal(_private) *)v15 didPublishWithError:v16];
        }
      }

      self->_sessionStarted = 0;
      self->_stopHandlingEvents = 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          -[GKSessionInternal(_private) didPublishWithError:]();
        }
      }
      [(GKSessionInternal *)self stopResolvingAllPeers];
    }
  }
  else
  {
    self->_isPublishing = 1;
  }
}

- (void)lock
{
  if (pthread_mutex_lock(&self->_lock) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      -[GKSessionInternal(_private) lock]();
    }
  }
}

- (void)unlock
{
  if (pthread_mutex_unlock(&self->_lock) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      -[GKSessionInternal(_private) unlock]();
    }
  }
}

- (void)handleNewGKOOBAudioMessage:(id)a3 messageData:(id)a4 remotePID:(unsigned int)a5 callbackData:(id *)a6 maxCallbackCount:(int)a7 checkDelegateCallbackSelector:(BOOL *)a8 tellDelegateSelector:(SEL *)a9 callbackCount:(int *)a10
{
  uint64_t v13 = *(void *)&a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(GKSessionInternal *)self dataReceiveHandler];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = *a10;
    if ((int)v17 >= a7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        int v22 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 136315650;
          uint64_t v24 = v21;
          __int16 v25 = 2080;
          uint64_t v26 = "-[GKSessionInternal(callback) handleNewGKOOBAudioMessage:messageData:remotePID:callbackData:maxCallbackC"
                "ount:checkDelegateCallbackSelector:tellDelegateSelector:callbackCount:]";
          __int16 v27 = 1024;
          int v28 = 1757;
          _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Already reached the max allowed delegate callback count", (uint8_t *)&v23, 0x1Cu);
        }
      }
    }
    else
    {
      a6[v17] = a4;
      uint64_t v18 = *a10;
      a8[v18] = 0;
      a9[v18] = sel_tellDelegate_didReceiveDataFromPeerWithContext_;
      *a10 = v18 + 1;
    }
  }
  else
  {
    voiceChatListener = self->_voiceChatListener;
    if (!voiceChatListener)
    {
      voiceChatListener = [[GKVoiceChatSessionListener alloc] initWithSession:self];
      self->_voiceChatListener = voiceChatListener;
    }
    id v20 = [(GKSessionInternal *)self stringForGCKID:v13];
    [(GKVoiceChatSessionListener *)voiceChatListener receivedNewVoiceChatOOBMessage:a3 fromPeerID:v20];
  }
}

- (void)sendCallbacksToDelegate:(id *)a3 remotePeer:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v193 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263F086B0]);
  memset(v190, 170, sizeof(v190));
  LOBYTE(v173) = -86;
  memset(v188, 170, sizeof(v188));
  v186 = (char *)0xAAAAAAAAAAAAAAAALL;
  v187 = (char *)0xAAAAAAAAAAAAAAAALL;
  int v172 = 0;
  if (a3->var0 != 4 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int var0 = a3->var0;
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v176 = 2080;
      v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
      __int16 v178 = 1024;
      int v179 = 1798;
      __int16 v180 = 1024;
      *(_DWORD *)v181 = var0;
      *(_WORD *)&v181[4] = 1024;
      *(_DWORD *)&v181[6] = v4;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendCallbacksToDelegate: %d for remotePID [%x]", buf, 0x28u);
    }
  }
  unint64_t v191 = 0xAAAAAAAAAAAAAAAALL;
  [(GKSessionInternal *)self lock];
  int v192 = 0;
  unint64_t v191 = 0;
  memset(v189, 0, sizeof(v189));
  __int16 v173 = 257;
  char v174 = 1;
  id v167 = [(GKAutoPeerIDTable *)self->_peerIDTable objectForKey:v4];
  id v10 = [(GKTable *)self->_peerInfoTable objectForKey:v4];
  char v11 = 0;
  switch(a3->var0)
  {
    case 0:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        __int16 v25 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v26 = a3->var0;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v24;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 1866;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v26;
          _os_log_impl(&dword_221563000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_Invited", buf, 0x22u);
        }
      }
      __int16 v27 = (void *)[[NSString alloc] initWithBytes:a3->var1 length:a3->var2 encoding:4];
      [(GKSessionInternal *)self setDisplayName:v27 forPeer:v4];
      if (!self->_sessionStarted)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v98 = VRTraceErrorLogLevelToCSTR();
          v99 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v98;
            __int16 v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            __int16 v178 = 1024;
            int v179 = 1872;
            _os_log_impl(&dword_221563000, v99, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d not available - rejecting incoming", buf, 0x1Cu);
          }
        }
        GCKSessionRespondToInvitation();
      }
      [(GKList *)self->_peersPendingIncomingInvitation addID:v4];
      v188[1] = sel_session_peer_didChangeState_;
      v188[2] = sel_session_didReceiveConnectionRequestFromPeer_;
      v186 = sel_tellDelegate_isConnectingPeer_;
      v187 = sel_tellDelegate_gotInvited_;
      int v172 = 2;

      goto LABEL_214;
    case 1:
    case 0xD:
      TimingLog(3, 0, (uint64_t)"Network connected...");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = a3->var0;
          BOOL isSearching = self->_isSearching;
          BOOL v16 = self->_serviceBrowser != 0;
          int var2 = a3->var2;
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = v12;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 1895;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v14;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = isSearching;
          __int16 v182 = 1024;
          unsigned int v183 = v16;
          __int16 v184 = 1024;
          int v185 = var2;
          _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_Connected (%d, %d) (namelen:%d)", buf, 0x34u);
        }
      }
      if (![(GKList *)self->_peersConnected hasID:v4])
      {
        v84 = (void *)[[NSString alloc] initWithBytes:a3->var1 length:a3->var2 encoding:4];
        [(GKSessionInternal *)self setDisplayName:v84 forPeer:v4];
        connection = self->_connection;
        if (connection) {
          [(GKConnection *)connection setParticipantID:v84 forPeerID:v167];
        }
        if (v10)
        {
          [v10 setNeedsToTimeout:0];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v86 = VRTraceErrorLogLevelToCSTR();
            v87 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = v86;
              __int16 v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              __int16 v178 = 1024;
              int v179 = 1913;
              __int16 v180 = 2112;
              *(void *)v181 = v84;
              _os_log_impl(&dword_221563000, v87, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ connected", buf, 0x26u);
            }
          }
          [v10 stopResolving];
        }
        [(GKList *)self->_peersConnected addID:v4];
        if ((int)*MEMORY[0x263F21080] > 6 || *MEMORY[0x263F21090])
        {
          *(void *)buf = [(GKList *)self->_peersConnected count];
          VRTraceVariable_();
        }
        [(GKList *)self->_peersPendingIncomingInvitation removeID:v4];
        [(GKList *)self->_peersPendingOutgoingInvitation removeID:v4];
        if (self->_isSearching && self->_serviceBrowser)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v88 = VRTraceErrorLogLevelToCSTR();
            v89 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              serviceBrowser = self->_serviceBrowser;
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = v88;
              __int16 v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              __int16 v178 = 1024;
              int v179 = 1926;
              __int16 v180 = 1024;
              *(_DWORD *)v181 = serviceBrowser;
              _os_log_impl(&dword_221563000, v89, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X)", buf, 0x22u);
            }
          }
          DNSServiceRefDeallocate(self->_serviceBrowser);
          self->_serviceBrowser = 0;
          self->_BOOL isSearching = 0;
          [(GKList *)self->_peersForCleanup addIDsFromList:self->_peersAvailable];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v91 = VRTraceErrorLogLevelToCSTR();
            v92 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v93 = [(GKList *)self->_peersAvailable count];
              int v94 = [(GKList *)self->_peersForCleanup count];
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v91;
              __int16 v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              __int16 v178 = 1024;
              int v179 = 1934;
              __int16 v180 = 1024;
              *(_DWORD *)v181 = v93;
              *(_WORD *)&v181[4] = 1024;
              *(_DWORD *)&v181[6] = v94;
              _os_log_impl(&dword_221563000, v92, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d moving %d available peers to future removal (%d)", buf, 0x28u);
            }
          }
          [(GKList *)self->_peersAvailable removeAllIDs];
          [(GKTable *)self->_peerInfoTable makeObjectsPerformSelector:sel_stopTXTRecordMonitoring];
        }
        v188[1] = sel_session_peer_didChangeState_;
        v186 = sel_tellDelegate_didConnectPeer_;
        *(_DWORD *)buf = a3->var0 == 13;
        v189[0] = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:4];
        int v172 = 1;

        goto LABEL_214;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_214;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x263F21098];
      BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
      char v11 = 0;
      if (v20)
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v18;
        __int16 v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        __int16 v178 = 1024;
        int v179 = 1899;
        __int16 v180 = 1024;
        *(_DWORD *)v181 = v4;
        uint64_t v21 = " [%s] %s:%d New peer (%d) already connected";
        goto LABEL_13;
      }
      goto LABEL_215;
    case 2:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        uint64_t v29 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v30 = a3->var0;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v28;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 1954;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v30;
          _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_Failed", buf, 0x22u);
        }
      }
      [(GKConnection *)self->_connection reportingAgent];
      reportingGKLog();
      if (v10)
      {
        [v10 setNeedsToTimeout:0];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v31 = VRTraceErrorLogLevelToCSTR();
          unsigned __int8 v32 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = [v10 displayName];
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v31;
            __int16 v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            __int16 v178 = 1024;
            int v179 = 1959;
            __int16 v180 = 2112;
            *(void *)v181 = v33;
            _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ failed to connect", buf, 0x26u);
          }
        }
        [v10 stopResolving];
      }
      unsigned __int8 v34 = self;
      if ([(GKList *)self->_peersPendingIncomingInvitation hasID:v4])
      {
        LODWORD(v191) = 30506;
        v190[3] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Failed while pending incoming invitation." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
        v190[0] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Failed while pending incoming invitation." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
        v188[1] = sel_session_connectionWithPeerFailed_withError_;
        v186 = sel_tellDelegate_connectionRequestToPeerFailed_;
        int v172 = 1;
        peersPendingIncomingInvitation = self->_peersPendingIncomingInvitation;
      }
      else
      {
        if (![(GKList *)self->_peersPendingOutgoingInvitation hasID:v4])
        {
          LODWORD(v191) = 30201;
          v190[3] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Failed while not pending." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
          v190[0] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Failed while not pending." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
          v188[1] = sel_session_connectionWithPeerFailed_withError_;
          v186 = sel_tellDelegate_connectionRequestToPeerFailed_;
          int v172 = 1;
          unsigned __int8 v34 = self;
          goto LABEL_153;
        }
        int var3_low = LOWORD(a3->var3);
        if (var3_low == 41)
        {
          LODWORD(v191) = 30510;
          v190[3] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Connection to peer already in progress after initially succeeding." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
          id v96 = GCKGameConnectivityKitBundle();
          v97 = @"Found in progress after success.";
        }
        else if (var3_low == 23)
        {
          LODWORD(v191) = 30503;
          v190[3] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Outgoing invitation timed out before TCP." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
          id v96 = GCKGameConnectivityKitBundle();
          v97 = @"Invitation timed out.";
        }
        else
        {
          LODWORD(v191) = 30505;
          v190[3] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Failed while pending outgoing invitation." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
          id v96 = GCKGameConnectivityKitBundle();
          v97 = @"Failed while pending outgoing invitation.";
        }
        v190[0] = [v96 localizedStringForKey:v97 value:&stru_26D39CAC0 table:@"GKSessionEvent"];
        v188[1] = sel_session_connectionWithPeerFailed_withError_;
        v186 = sel_tellDelegate_connectionRequestToPeerFailed_;
        int v172 = 1;
        unsigned __int8 v34 = self;
        peersPendingIncomingInvitation = self->_peersPendingOutgoingInvitation;
      }
      [(GKList *)peersPendingIncomingInvitation removeID:v4];
LABEL_153:
      if (v34->_connection
        || [(GKList *)v34->_peersConnected count]
        || [(GKList *)v34->_peersPendingIncomingInvitation count]
        || [(GKList *)v34->_peersPendingOutgoingInvitation count])
      {
        goto LABEL_244;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_243;
      }
      uint64_t v119 = VRTraceErrorLogLevelToCSTR();
      v120 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_243;
      }
      if (v10) {
        uint64_t v121 = [v10 displayName];
      }
      else {
        uint64_t v121 = 0;
      }
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v119;
      __int16 v176 = 2080;
      v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
      __int16 v178 = 1024;
      int v179 = 2017;
      __int16 v180 = 2112;
      *(void *)v181 = v121;
      v161 = " [%s] %s:%d ** Stop resolving ALL: %@ connection failed and no more connected/incoming/outgoing";
      goto LABEL_242;
    case 3:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v36 = VRTraceErrorLogLevelToCSTR();
        int v37 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v38 = a3->var0;
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v36;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 2025;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v38;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = v4;
          _os_log_impl(&dword_221563000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_Disconnected for peer %08X.", buf, 0x28u);
        }
      }
      [(GKConnection *)self->_connection reportingAgent];
      reportingGKLog();
      if (v10)
      {
        [v10 setNeedsToTimeout:0];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v39 = VRTraceErrorLogLevelToCSTR();
          unsigned int v40 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v41 = [v10 displayName];
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v39;
            __int16 v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            __int16 v178 = 1024;
            int v179 = 2032;
            __int16 v180 = 2112;
            *(void *)v181 = v41;
            _os_log_impl(&dword_221563000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ disconnected", buf, 0x26u);
          }
        }
        [v10 stopResolving];
      }
      if ((a3->var3 & 0x80000000) != 0)
      {
        int var3 = (unsigned __int16)a3->var3;
        BOOL v101 = [(GKList *)self->_peersConnected hasID:v4];
        if (var3 == 23)
        {
          if (!v101)
          {
            if ([(GKList *)self->_peersPendingOutgoingInvitation hasID:v4])
            {
              [(GKList *)self->_peersPendingOutgoingInvitation removeID:v4];
              LODWORD(v191) = 30503;
              id v117 = GCKGameConnectivityKitBundle();
              v118 = @"Outgoing invitation timed out.";
            }
            else
            {
              if (![(GKList *)self->_peersPendingIncomingInvitation hasID:v4])
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
                  goto LABEL_186;
                }
                uint64_t v148 = VRTraceErrorLogLevelToCSTR();
                v149 = *MEMORY[0x263F21098];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_186;
                }
                *(_DWORD *)buf = 136316162;
                *(void *)&uint8_t buf[4] = v148;
                __int16 v176 = 2080;
                v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
                __int16 v178 = 1024;
                int v179 = 2066;
                __int16 v180 = 1024;
                *(_DWORD *)v181 = 2066;
                *(_WORD *)&v181[4] = 1024;
                *(_DWORD *)&v181[6] = v4;
                v142 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Ge"
                       "cko/GKSession_Internal.m:%d: PID 0x%08X timed out, but not known to us.";
                v143 = v149;
                uint32_t v144 = 40;
                goto LABEL_208;
              }
              [(GKList *)self->_peersPendingIncomingInvitation removeID:v4];
              LODWORD(v191) = 30503;
              id v117 = GCKGameConnectivityKitBundle();
              v118 = @"Incoming invitation timed out.";
            }
            v190[3] = [v117 localizedStringForKey:v118 value:&stru_26D39CAC0 table:@"GKSessionEvent"];
            id v106 = GCKGameConnectivityKitBundle();
            v107 = @"Invitation timed out.";
LABEL_184:
            v190[0] = [v106 localizedStringForKey:v107 value:&stru_26D39CAC0 table:@"GKSessionEvent"];
            v188[1] = sel_session_connectionWithPeerFailed_withError_;
            v124 = sel_tellDelegate_connectionRequestToPeerFailed_;
            goto LABEL_185;
          }
          [(GKList *)self->_peersConnected removeID:v4];
          if ((int)*MEMORY[0x263F21080] > 6 || *MEMORY[0x263F21090])
          {
            *(void *)buf = [(GKList *)self->_peersConnected count];
            VRTraceVariable_();
          }
          LODWORD(v191) = 30503;
          v190[3] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Connection timed out." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
          id v102 = GCKGameConnectivityKitBundle();
          v103 = @"Connection timed out.";
        }
        else
        {
          if (!v101
            && ![(GKList *)self->_peersPendingOutgoingInvitation hasID:v4]
            && ![(GKList *)self->_peersPendingIncomingInvitation hasID:v4])
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
              goto LABEL_186;
            }
            uint64_t v145 = VRTraceErrorLogLevelToCSTR();
            v146 = *MEMORY[0x263F21098];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_186;
            }
            unsigned int v147 = a3->var3;
            *(_DWORD *)buf = 136316674;
            *(void *)&uint8_t buf[4] = v145;
            __int16 v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            __int16 v178 = 1024;
            int v179 = 2093;
            __int16 v180 = 1024;
            *(_DWORD *)v181 = 2093;
            *(_WORD *)&v181[4] = 1024;
            *(_DWORD *)&v181[6] = v147;
            __int16 v182 = 1024;
            unsigned int v183 = v147;
            __int16 v184 = 1024;
            int v185 = v4;
            v142 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/"
                   "GKSession_Internal.m:%d: Received unknown event->status %08x (%d) for an unknown PID (0x%08X)";
            v143 = v146;
            uint32_t v144 = 52;
            goto LABEL_208;
          }
          [(GKList *)self->_peersConnected removeID:v4];
          [(GKList *)self->_peersPendingOutgoingInvitation removeID:v4];
          [(GKList *)self->_peersPendingIncomingInvitation removeID:v4];
          if ((int)*MEMORY[0x263F21080] > 6 || *MEMORY[0x263F21090])
          {
            *(void *)buf = [(GKList *)self->_peersConnected count];
            VRTraceVariable_();
          }
          if ((a3->var3 & 0x40000000) != 0)
          {
            LODWORD(v191) = 30205;
            v122 = NSString;
            uint64_t v123 = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Connection error: system (%d)." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
            uint64_t v111 = objc_msgSend(v122, "stringWithFormat:", v123, *__error());
            v112 = @"Connection error: system error";
          }
          else
          {
            LODWORD(v191) = 30203;
            uint64_t v111 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", @"Connection error: internal (%08X).", &stru_26D39CAC0, @"GKSessionEvent"), a3->var3);
            v112 = @"Connection error: internal";
          }
          v190[3] = v111;
          id v102 = GCKGameConnectivityKitBundle();
          v103 = v112;
        }
        v190[0] = [v102 localizedStringForKey:v103 value:&stru_26D39CAC0 table:@"GKSessionEvent"];
LABEL_164:
        v188[1] = sel_session_peer_didChangeState_;
        v124 = sel_tellDelegate_didDisconnectPeer_;
LABEL_185:
        v186 = v124;
        int v172 = 1;
        goto LABEL_186;
      }
      if ([(GKList *)self->_peersConnected hasID:v4])
      {
        [(GKList *)self->_peersConnected removeID:v4];
        if ((int)*MEMORY[0x263F21080] > 6 || *MEMORY[0x263F21090])
        {
          *(void *)buf = [(GKList *)self->_peersConnected count];
          VRTraceVariable_();
        }
        BOOL v42 = [(GKList *)self->_peersAvailable hasID:v4];
        if (v10 && !v42) {
          [(GKTable *)self->_peerInfoTable removeObjectForKey:v4];
        }
        goto LABEL_164;
      }
      if ([(GKList *)self->_peersPendingOutgoingInvitation hasID:v4])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v104 = VRTraceErrorLogLevelToCSTR();
          v105 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v104;
            __int16 v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            __int16 v178 = 1024;
            int v179 = 2113;
            _os_log_impl(&dword_221563000, v105, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote declined", buf, 0x1Cu);
          }
        }
        [(GKList *)self->_peersPendingOutgoingInvitation removeID:v4];
        LODWORD(v191) = 30502;
        v190[3] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"The invited peer has declined the connection." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
        id v106 = GCKGameConnectivityKitBundle();
        v107 = @"Remote declined.";
        goto LABEL_184;
      }
      if ([(GKList *)self->_peersPendingIncomingInvitation hasID:v4])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v113 = VRTraceErrorLogLevelToCSTR();
          v114 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v113;
            __int16 v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            __int16 v178 = 1024;
            int v179 = 2126;
            _os_log_impl(&dword_221563000, v114, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote cancelled", buf, 0x1Cu);
          }
        }
        [(GKConnection *)self->_connection reportingAgent];
        reportingGKLog();
        [(GKList *)self->_peersPendingIncomingInvitation removeID:v4];
        LODWORD(v191) = 30504;
        v190[3] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"The invited peer has cancelled the connection." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
        v190[0] = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Remote cancelled." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
        v188[1] = sel_session_connectionWithPeerFailed_withError_;
        v186 = sel_tellDelegate_connectionRequestToPeerFailed_;
        int v172 = 1;
        goto LABEL_186;
      }
      if (!self->_connection)
      {
        if (v10) {
          [v10 setNeedsToTimeout:0];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v137 = VRTraceErrorLogLevelToCSTR();
          v138 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v137;
            __int16 v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            __int16 v178 = 1024;
            int v179 = 2146;
            _os_log_impl(&dword_221563000, v138, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Local accepted but disconnected", buf, 0x1Cu);
          }
        }
        [(GKList *)self->_peersPendingIncomingInvitation removeID:v4];
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_186;
        }
        uint64_t v139 = VRTraceErrorLogLevelToCSTR();
        v140 = *MEMORY[0x263F21098];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_186;
        }
        int v141 = a3->var0;
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v139;
        __int16 v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        __int16 v178 = 1024;
        int v179 = 2148;
        __int16 v180 = 1024;
        *(_DWORD *)v181 = 2148;
        *(_WORD *)&v181[4] = 1024;
        *(_DWORD *)&v181[6] = v4;
        __int16 v182 = 1024;
        unsigned int v183 = v141;
        v142 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKSe"
               "ssion_Internal.m:%d: Local side accepted but PID (0x%08X) disconnected. event->eventType = %d";
        v143 = v140;
        uint32_t v144 = 46;
LABEL_208:
        _os_log_impl(&dword_221563000, v143, OS_LOG_TYPE_DEFAULT, v142, buf, v144);
LABEL_186:
        if (!self->_connection
          && ![(GKList *)self->_peersConnected count]
          && ![(GKList *)self->_peersPendingIncomingInvitation count]
          && ![(GKList *)self->_peersPendingOutgoingInvitation count])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v135 = VRTraceErrorLogLevelToCSTR();
            v120 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if (v10) {
                uint64_t v136 = [v10 displayName];
              }
              else {
                uint64_t v136 = 0;
              }
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = v135;
              __int16 v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              __int16 v178 = 1024;
              int v179 = 2155;
              __int16 v180 = 2112;
              *(void *)v181 = v136;
              v161 = " [%s] %s:%d ** Stop resolving ALL: %@ disconnected and no more connected/incoming/outgoing";
LABEL_242:
              _os_log_impl(&dword_221563000, v120, OS_LOG_TYPE_DEFAULT, v161, buf, 0x26u);
            }
          }
LABEL_243:
          [(GKSessionInternal *)self stopResolvingAllPeers];
        }
LABEL_244:
        char v11 = 1;
        goto LABEL_215;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_214;
      }
      uint64_t v125 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x263F21098];
      BOOL v126 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
      char v11 = 0;
      if (v126)
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v125;
        __int16 v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        __int16 v178 = 1024;
        int v179 = 2140;
        __int16 v180 = 1024;
        *(_DWORD *)v181 = v4;
        uint64_t v21 = " [%s] %s:%d Cancelled peer (%d) already disconnected";
LABEL_13:
        int v22 = v19;
        uint32_t v23 = 34;
        goto LABEL_213;
      }
LABEL_215:
      char v165 = v11;

      v152 = self;
      [(GKSessionInternal *)self unlock];
      p_delegateLock = &self->_delegateLock;
      pthread_mutex_lock(&self->_delegateLock);
      if (v172 >= 1)
      {
        for (uint64_t i = 0; i < v172; ++i)
        {
          if (*((unsigned char *)&v173 + i))
          {
            [(GKSessionInternal *)v152 delegate];
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              [(GKSessionInternal *)v152 privateDelegate];
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                continue;
              }
            }
          }
          uint64_t v154 = *((unsigned int *)&v191 + i);
          if (v154)
          {
            id v155 = [(GKSessionInternal *)v152 newNSErrorFromGKSessionError:v154 description:v190[i + 3] reason:v190[i]];
            uint64_t v156 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v167, @"peerID", v155, @"NSError", 0, p_delegateLock);

            v152 = self;
          }
          else
          {
            uint64_t v157 = v189[i];
            id v158 = objc_alloc(NSDictionary);
            if (v157) {
              uint64_t v159 = objc_msgSend(v158, "initWithObjectsAndKeys:", v167, @"peerID", v189[i], @"data", 0);
            }
            else {
              uint64_t v159 = objc_msgSend(v158, "initWithObjectsAndKeys:", v167, @"peerID", 0, v162, v163);
            }
            uint64_t v156 = v159;
          }
          [(GKSessionInternal *)v152 performSelectorOnMainThread:(&v186)[i] withObject:v156 waitUntilDone:0];
        }
      }
      pthread_mutex_unlock(p_delegateLock);

      char v160 = v165 ^ 1;
      if (v152->_connection) {
        char v160 = 1;
      }
      if ((v160 & 1) == 0
        && ![(GKList *)v152->_peersConnected count]
        && v152->_mode - 1 <= 1
        && v152->_sessionStarted
        && !v152->_isSearching
        && !v152->_shutdown)
      {
        v152->_BOOL isSearching = 1;
        [(GKSessionInternal *)v152 browse];
      }
      [v6 drain];
      return;
    case 4:
      if (![(GKList *)self->_peersConnected hasID:v4]
        || !a3->var1
        || ![(GKSessionInternal *)self dataReceiveHandler])
      {
        goto LABEL_214;
      }
      uint64_t v43 = [MEMORY[0x263EFF8F8] dataWithBytes:a3->var1 length:a3->var2];
      char v11 = 0;
      v189[0] = v43;
      LOBYTE(v173) = 0;
      int v44 = sel_tellDelegate_didReceiveData_;
      goto LABEL_76;
    case 6:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v45 = VRTraceErrorLogLevelToCSTR();
        unsigned int v46 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v47 = a3->var0;
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v45;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 2210;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v47;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = v4;
          _os_log_impl(&dword_221563000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_IncomingOOBPacket from %X", buf, 0x28u);
        }
      }
      if (![(GKList *)self->_peersConnected hasID:v4]) {
        goto LABEL_214;
      }
      var1 = a3->var1;
      if (!var1) {
        goto LABEL_214;
      }
      uint64_t v49 = [MEMORY[0x263EFF8F8] dataWithBytes:var1 length:a3->var2];
      id v50 = +[GKOOBMessageFactory newMessageFromData:v49];
      if (v50)
      {
        BOOL v51 = v50;
        int v52 = [v50 type];
        if (v52 == 1500)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v127 = VRTraceErrorLogLevelToCSTR();
            v128 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = v127;
              __int16 v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              __int16 v178 = 1024;
              int v179 = 2222;
              _os_log_impl(&dword_221563000, v128, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionEvent_IncomingOOBPacket: disconnect from all peers", buf, 0x1Cu);
            }
          }
          [(GKSessionInternal *)self disconnectFromAllPeers];
          goto LABEL_177;
        }
        if (v52 == 1600)
        {
          [(GKSessionInternal *)self handleNewGKOOBAudioMessage:v51 messageData:v49 remotePID:v4 callbackData:v189 maxCallbackCount:3 checkDelegateCallbackSelector:&v173 tellDelegateSelector:&v186 callbackCount:&v172];
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_177;
          }
          uint64_t v53 = VRTraceErrorLogLevelToCSTR();
          id v54 = *MEMORY[0x263F21098];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_177;
          }
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v53;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 2219;
          uint64_t v55 = " [%s] %s:%d Incoming reliable audio packet";
          BOOL v56 = v54;
          uint32_t v57 = 28;
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_177;
          }
          uint64_t v129 = VRTraceErrorLogLevelToCSTR();
          v130 = *MEMORY[0x263F21098];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_177;
          }
          int v131 = [v51 type];
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v129;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 2226;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v131;
          uint64_t v55 = " [%s] %s:%d GCKSessionEvent_IncomingOOBPacket: unknown OOB packet type %d";
          BOOL v56 = v130;
          uint32_t v57 = 34;
        }
        _os_log_impl(&dword_221563000, v56, OS_LOG_TYPE_DEFAULT, v55, buf, v57);
LABEL_177:
        id v132 = v51;
        goto LABEL_214;
      }
      if (a3->var3 == 1)
      {
        if (self->_doobReceiveHandler[1])
        {
          v70 = (void *)MEMORY[0x263EFF8F8];
          goto LABEL_75;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_214;
        }
        uint64_t v150 = VRTraceErrorLogLevelToCSTR();
        v109 = *MEMORY[0x263F21098];
        BOOL v151 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
        char v11 = 0;
        if (!v151) {
          goto LABEL_215;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v150;
        __int16 v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        __int16 v178 = 1024;
        int v179 = 2243;
        uint64_t v21 = " [%s] %s:%d GCKOOBand_RetryICE: oob message no band handler registered ";
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        {
LABEL_214:
          char v11 = 0;
          goto LABEL_215;
        }
        uint64_t v133 = VRTraceErrorLogLevelToCSTR();
        v109 = *MEMORY[0x263F21098];
        BOOL v134 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
        char v11 = 0;
        if (!v134) {
          goto LABEL_215;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v133;
        __int16 v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        __int16 v178 = 1024;
        int v179 = 2252;
        uint64_t v21 = " [%s] %s:%d GCKSessionEvent_IncomingOOBPacket: oob message band specifier out-of-range...";
      }
LABEL_212:
      int v22 = v109;
      uint32_t v23 = 28;
LABEL_213:
      _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      goto LABEL_214;
    case 7:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v58 = VRTraceErrorLogLevelToCSTR();
        __int16 v59 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v60 = a3->var0;
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v58;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 2260;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v60;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = v4;
          _os_log_impl(&dword_221563000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_OutgoingOOBPacket to %X", buf, 0x28u);
        }
      }
      if (![(GKList *)self->_peersConnected hasID:v4] || !a3->var1) {
        goto LABEL_214;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v61 = VRTraceErrorLogLevelToCSTR();
        __int16 v62 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v63 = a3->var2;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v61;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 2262;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v63;
          _os_log_impl(&dword_221563000, v62, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionEvent_OutgoingOOBPacket: [buflen == %d]", buf, 0x22u);
        }
      }
      uint64_t v64 = [MEMORY[0x263EFF8F8] dataWithBytes:a3->var1 length:a3->var2];
      v169[0] = MEMORY[0x263EF8330];
      v169[1] = 3221225472;
      v169[2] = __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_301;
      v169[3] = &unk_2645B7C90;
      v169[4] = self;
      v169[5] = v64;
      v169[6] = v167;
      __int16 v65 = MEMORY[0x263EF83A0];
      v66 = v169;
      goto LABEL_87;
    case 8:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v67 = VRTraceErrorLogLevelToCSTR();
        int v68 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v69 = a3->var0;
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v67;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 2183;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v69;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = v4;
          _os_log_impl(&dword_221563000, v68, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_SendSelfOOBPacket from %X", buf, 0x28u);
        }
      }
      if (!a3->var1) {
        goto LABEL_214;
      }
      if (a3->var3 == 1)
      {
        if (self->_doobReceiveHandler[1])
        {
          v70 = (void *)MEMORY[0x263EFF8F8];
LABEL_75:
          uint64_t v71 = objc_msgSend(v70, "dataWithBytes:length:");
          char v11 = 0;
          v189[0] = v71;
          LOBYTE(v173) = 0;
          int v44 = sel_tellDelegate_didReceiveBand_RetryICE_;
LABEL_76:
          v186 = v44;
          int v172 = 1;
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_214;
          }
          uint64_t v115 = VRTraceErrorLogLevelToCSTR();
          v109 = *MEMORY[0x263F21098];
          BOOL v116 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
          char v11 = 0;
          if (v116)
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v115;
            __int16 v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            __int16 v178 = 1024;
            int v179 = 2196;
            uint64_t v21 = " [%s] %s:%d GCKOOBand_RetryICE: oob message no band handler registered ";
            goto LABEL_212;
          }
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_214;
        }
        uint64_t v108 = VRTraceErrorLogLevelToCSTR();
        v109 = *MEMORY[0x263F21098];
        BOOL v110 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
        char v11 = 0;
        if (v110)
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v108;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 2205;
          uint64_t v21 = " [%s] %s:%d GCKSessionEvent_SendSelfOOBPacket: oob message band specifier out-of-range...";
          goto LABEL_212;
        }
      }
      goto LABEL_215;
    case 9:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v72 = VRTraceErrorLogLevelToCSTR();
        v73 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v74 = a3->var0;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v72;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 1822;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v74;
          _os_log_impl(&dword_221563000, v73, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_RelayInitiate", buf, 0x22u);
        }
      }
      uint64_t v75 = objc_msgSend(MEMORY[0x263F08AC0], "propertyListFromData:mutabilityOption:format:errorDescription:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a3->var1, a3->var2), 0, 0, 0);
      v171[0] = MEMORY[0x263EF8330];
      v171[1] = 3221225472;
      v171[2] = __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke;
      v171[3] = &unk_2645B7C90;
      v171[4] = self;
      v171[5] = v167;
      v171[6] = v75;
      __int16 v65 = MEMORY[0x263EF83A0];
      v66 = v171;
      goto LABEL_87;
    case 0xA:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v76 = VRTraceErrorLogLevelToCSTR();
        v77 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v78 = a3->var0;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v76;
          __int16 v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          __int16 v178 = 1024;
          int v179 = 1844;
          __int16 v180 = 1024;
          *(_DWORD *)v181 = v78;
          _os_log_impl(&dword_221563000, v77, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_RelayUpdate", buf, 0x22u);
        }
      }
      uint64_t v79 = objc_msgSend(MEMORY[0x263F08AC0], "propertyListFromData:mutabilityOption:format:errorDescription:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a3->var1, a3->var2), 0, 0, 0);
      v170[0] = MEMORY[0x263EF8330];
      v170[1] = 3221225472;
      v170[2] = __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_223;
      v170[3] = &unk_2645B7C90;
      v170[4] = self;
      v170[5] = v167;
      v170[6] = v79;
      __int16 v65 = MEMORY[0x263EF83A0];
      v66 = v170;
      goto LABEL_87;
    case 0xC:
      v80 = malloc_type_malloc((a3->var2 + 24), 0x57C95598uLL);
      if (!v80) {
        goto LABEL_214;
      }
      v81 = v80;
      uint64_t v82 = *(void *)&a3->var2;
      _OWORD *v80 = *(_OWORD *)&a3->var0;
      v83 = (char *)v80 + 24;
      *((void *)v81 + 1) = v83;
      *((void *)v81 + 2) = v82;
      memcpy(v83, a3->var1, a3->var2);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_2;
      block[3] = &unk_2645B8090;
      block[4] = self;
      block[5] = v167;
      block[6] = v81;
      __int16 v65 = MEMORY[0x263EF83A0];
      v66 = block;
LABEL_87:
      dispatch_async(v65, v66);
      goto LABEL_214;
    default:
      goto LABEL_215;
  }
}

uint64_t __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke(void *a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  char v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v7[0] = @"peerID";
  v7[1] = @"dict";
  v8[0] = v1;
  uint64_t v3 = a1[6];
  uint64_t v5 = @"GKSRelayInitiateInfo";
  uint64_t v6 = v3;
  v8[1] = [NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  return objc_msgSend(v2, "tellDelegate_initiateRelay:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
}

uint64_t __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_223(void *a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  char v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v7[0] = @"peerID";
  v7[1] = @"dict";
  v8[0] = v1;
  uint64_t v3 = a1[6];
  uint64_t v5 = @"GKSRelayUpdateInfo";
  uint64_t v6 = v3;
  v8[1] = [NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  return objc_msgSend(v2, "tellDelegate_updateRelay:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
}

uint64_t __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_301(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  return objc_msgSend(v1, "sendData:toPeers:withDataMode:enableOOB:error:", v2, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v4, 1), 0, 1, 0);
}

void __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 48) + 16);
      *(_DWORD *)buf = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]_block_invoke_2";
      __int16 v9 = 1024;
      int v10 = 2282;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionEvent_ReportStatistics: [buflen == %d]", buf, 0x22u);
    }
  }
  GCKSessionDecodeChannelStatistics();
}

- (void)setDelegate:(id)a3
{
  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  objc_storeWeak(&self->_delegate, a3);
  pthread_mutex_unlock(p_delegateLock);
}

- (GKSessionDelegate)delegate
{
  return (GKSessionDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setPrivateDelegate:(id)a3
{
  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  objc_storeWeak(&self->_privateDelegate, a3);
  pthread_mutex_unlock(p_delegateLock);
}

- (GKSessionPrivateDelegate)privateDelegate
{
  return (GKSessionPrivateDelegate *)objc_loadWeak(&self->_privateDelegate);
}

- (NSString)description
{
}

- (GKSessionInternal)initWithConnection:(id)a3 session:(id)a4 delegate:(id)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)GKSessionInternal;
  uint64_t v8 = [(GKSessionInternal *)&v10 init];
  if (v8)
  {
    VRTraceReset();
    v8->_session = (GKSession *)a4;
    v8->_wifiEnabled = 1;
    v8->_sReset = -1;
    v8->_unsigned int pid = [a3 gckPID];
    v8->sessionRef = (OpaqueGCKSession *)[a3 gckSession];
    objc_storeWeak(&v8->_delegate, a5);
    [a3 setEventDelegate:v8];
    v8->_connection = (GKConnection *)a3;
    GCKSessionSetEventCallback();
  }
  return 0;
}

- (GKSessionInternal)initWithSessionID:(id)a3 displayName:(id)a4 session:(id)a5 sessionMode:(unsigned int)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)GKSessionInternal;
  objc_super v10 = [(GKSessionInternal *)&v18 init];
  if (v10)
  {
    VRTraceReset();
    v10->_session = (GKSession *)a5;
    v10->_connection = 0;
    v10->_mode = a6;
    v10->_wifiEnabled = 1;
    v10->_sReset = -1;
    if (![a4 length])
    {
      uint64_t v11 = NSString;
      uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      a4 = (id)[v11 stringWithFormat:@"%@%f", v12, v13];
    }
    if (![a3 length]) {
      a3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
    }
    v10->sessionID = (NSString *)a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        sessionID = v10->sessionID;
        buf[0] = 136316162;
        *(void *)&buf[1] = v14;
        __int16 v20 = 2080;
        uint64_t v21 = "-[GKSessionInternal initWithSessionID:displayName:session:sessionMode:]";
        __int16 v22 = 1024;
        int v23 = 2514;
        __int16 v24 = 2112;
        __int16 v25 = sessionID;
        __int16 v26 = 2112;
        id v27 = a4;
        _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initWithSessionID: %@ displayName: %@", (uint8_t *)buf, 0x30u);
      }
    }
    GCKSessionCreateUniqueID();
    if (!GCKSessionCreate(1)) {
      AGPSessionCreate();
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal initWithSessionID:displayName:session:sessionMode:]();
      }
    }

    return 0;
  }
  return v10;
}

- (void)reset
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      displayName = self->_displayName;
      int v24 = 136316162;
      uint64_t v25 = v3;
      __int16 v26 = 2080;
      id v27 = "-[GKSessionInternal reset]";
      __int16 v28 = 1024;
      int v29 = 2620;
      __int16 v30 = 2048;
      *(void *)uint64_t v31 = self;
      *(_WORD *)&v31[8] = 2112;
      unsigned __int8 v32 = displayName;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session[%p] [%@] reset", (uint8_t *)&v24, 0x30u);
    }
  }
  [(GKSessionInternal *)self lock];
  pthread_mutex_lock(&self->_delegateLock);
  self->_shutdown = 1;
  self->_stopHandlingEvents = 1;
  objc_storeWeak(&self->_privateDelegate, 0);
  objc_storeWeak(&self->_delegate, 0);
  self->_session = 0;
  id v6 = [(GKList *)self->_peersPendingIncomingInvitation allMatchingObjectsFromTable:self->_peerIDTable];
  if ([v6 count])
  {
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
    GCKSessionRespondToInvitation();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(GKTable *)self->_peerIDTable count];
      int v10 = [(GKTable *)self->_peerNameTable count];
      int v11 = [(GKTable *)self->_peerInfoTable count];
      int v24 = 136316418;
      uint64_t v25 = v7;
      __int16 v26 = 2080;
      id v27 = "-[GKSessionInternal reset]";
      __int16 v28 = 1024;
      int v29 = 2641;
      __int16 v30 = 1024;
      *(_DWORD *)uint64_t v31 = v9;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v10;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = v11;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _peerIDTable:%d, _peerNameTable:%d, _peerInfoTable:%d", (uint8_t *)&v24, 0x2Eu);
    }
  }
  [(GKTable *)self->_peerIDTable removeAllObjects];
  [(GKTable *)self->_peerNameTable removeAllObjects];
  [(GKTable *)self->_peerInfoTable removeAllObjects];
  [(GKList *)self->_peersAvailable removeAllIDs];
  [(GKList *)self->_peersConnected removeAllIDs];
  [(GKList *)self->_peersForCleanup removeAllIDs];
  [(GKList *)self->_peersPendingIncomingInvitation removeAllIDs];
  [(GKList *)self->_peersPendingOutgoingInvitation removeAllIDs];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [(GKTable *)self->_peerIDTable count];
      int v15 = [(GKTable *)self->_peerNameTable count];
      int v16 = [(GKTable *)self->_peerInfoTable count];
      int v24 = 136316418;
      uint64_t v25 = v12;
      __int16 v26 = 2080;
      id v27 = "-[GKSessionInternal reset]";
      __int16 v28 = 1024;
      int v29 = 2652;
      __int16 v30 = 1024;
      *(_DWORD *)uint64_t v31 = v14;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v15;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = v16;
      _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _peerIDTable:%d, _peerNameTable:%d, _peerInfoTable:%d", (uint8_t *)&v24, 0x2Eu);
    }
  }
  int sReset = self->_sReset;
  if (sReset != -1)
  {
    close(sReset);
    self->_int sReset = -1;
  }
  if (self->_dnsServiceConnection)
  {
    *(_WORD *)&self->_BOOL isSearching = 0;
    self->_serviceBrowser = 0;
    self->_service = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        dnsServiceConnection = self->_dnsServiceConnection;
        int v24 = 136315906;
        uint64_t v25 = v18;
        __int16 v26 = 2080;
        id v27 = "-[GKSessionInternal reset]";
        __int16 v28 = 1024;
        int v29 = 2664;
        __int16 v30 = 1024;
        *(_DWORD *)uint64_t v31 = dnsServiceConnection;
        _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_dnsServiceConnection) (%08X)", (uint8_t *)&v24, 0x22u);
      }
    }
    DNSServiceRefDeallocate(self->_dnsServiceConnection);
    self->_dnsServiceConnection = 0;
  }
  if (self->_dnsServiceResolveConnection)
  {
    [(GKTable *)self->_peerInfoTable makeObjectsPerformSelector:sel_clearResolving];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        dnsServiceResolveConnection = self->_dnsServiceResolveConnection;
        int v24 = 136315906;
        uint64_t v25 = v21;
        __int16 v26 = 2080;
        id v27 = "-[GKSessionInternal reset]";
        __int16 v28 = 1024;
        int v29 = 2670;
        __int16 v30 = 1024;
        *(_DWORD *)uint64_t v31 = dnsServiceResolveConnection;
        _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_dnsServiceResolveConnection) (%08X)", (uint8_t *)&v24, 0x22u);
      }
    }
    DNSServiceRefDeallocate(self->_dnsServiceResolveConnection);
    self->_dnsServiceResolveConnection = 0;
  }
  self->_isBusy = 0;
  self->_sessionStarted = 0;
  pthread_mutex_unlock(&self->_delegateLock);
  [(GKSessionInternal *)self unlock];
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      displayName = self->_displayName;
      *(_DWORD *)buf = 136316162;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      int v9 = "-[GKSessionInternal dealloc]";
      __int16 v10 = 1024;
      int v11 = 2682;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      int v15 = displayName;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session[%p] [%@] dealloc", buf, 0x30u);
    }
  }
  [(GKSessionInternal *)self reset];
  objc_storeWeak(&self->_dataReceiveHandler, 0);
  AGPSessionRelease();
}

- (NSString)displayName
{
  uint64_t v2 = self->_displayName;
  return v2;
}

- (id)displayNameForPeer:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 intValue];
  if (v4 != self->_pid)
  {
    __int16 v8 = [(GKTable *)self->_peerNameTable objectForKey:v4];
    if (v8)
    {
      uint64_t v5 = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return v5;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        return v5;
      }
      int v16 = 136316162;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      __int16 v19 = "-[GKSessionInternal displayNameForPeer:]";
      __int16 v20 = 1024;
      int v21 = 2728;
      __int16 v22 = 1024;
      int v23 = v4;
      __int16 v24 = 2112;
      uint64_t v25 = v5;
      int v11 = " [%s] %s:%d displayNameForPeer: %d = %@ (table)";
    }
    else
    {
      id v12 = [(GKTable *)self->_peerInfoTable objectForKey:v4];
      if (!v12 || (uint64_t v13 = [v12 displayName]) == 0)
      {
LABEL_17:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            -[GKSessionInternal displayNameForPeer:]();
          }
        }
        uint64_t v5 = 0;
        return v5;
      }
      uint64_t v5 = (NSString *)v13;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return v5;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        return v5;
      }
      int v16 = 136316162;
      uint64_t v17 = v14;
      __int16 v18 = 2080;
      __int16 v19 = "-[GKSessionInternal displayNameForPeer:]";
      __int16 v20 = 1024;
      int v21 = 2732;
      __int16 v22 = 1024;
      int v23 = v4;
      __int16 v24 = 2112;
      uint64_t v25 = v5;
      int v11 = " [%s] %s:%d displayNameForPeer: %d = %@ (peer)";
    }
    _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0x2Cu);
    return v5;
  }
  uint64_t v5 = [(GKSessionInternal *)self displayName];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136316162;
      uint64_t v17 = v6;
      __int16 v18 = 2080;
      __int16 v19 = "-[GKSessionInternal displayNameForPeer:]";
      __int16 v20 = 1024;
      int v21 = 2726;
      __int16 v22 = 1024;
      int v23 = v4;
      __int16 v24 = 2112;
      uint64_t v25 = v5;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d displayNameForPeer: %d = %@ (self)", (uint8_t *)&v16, 0x2Cu);
    }
  }
  if (!v5) {
    goto LABEL_17;
  }
  return v5;
}

- (BOOL)sendAudioData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6
{
  return [(GKSessionInternal *)self sendData:a3 toPeers:a4 withDataMode:*(void *)&a5 enableOOB:1 error:a6];
}

- (BOOL)passesSendDataSanityCheck:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6
{
  if (a4) {
    BOOL v6 = a5 > 1;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = v6 || a3 == 0;
  if (a6 && v8)
  {
    uint64_t v9 = @"Parameter mode is invalid.";
    if (!a4) {
      uint64_t v9 = @"Parameter peers is invalid.";
    }
    if (a3) {
      __int16 v10 = v9;
    }
    else {
      __int16 v10 = @"Parameter data is invalid.";
    }
    *a6 = [(GKSessionInternal *)self newNSErrorFromGKSessionError:30500 description:@"Invalid parameter for -sendData:toPeers:withDataMode:error:" reason:v10];
  }
  return v8 ^ 1;
}

- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6
{
  return [(GKSessionInternal *)self sendData:a3 toPeers:a4 withDataMode:*(void *)&a5 enableOOB:0 error:a6];
}

- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 enableOOB:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  unsigned int v9 = a5;
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (a7) {
    *a7 = 0;
  }
  BOOL v13 = [(GKSessionInternal *)self passesSendDataSanityCheck:a3 toPeers:a4 withDataMode:*(void *)&a5 error:a7];
  if (v13)
  {
    id v14 = a3;
    id v15 = a4;
    uint64_t v16 = [a3 bytes];
    int v31 = [a3 length];
    [(GKSessionInternal *)self lock];
    if ([a4 count])
    {
      int v29 = a7;
      uint64_t v32 = 0;
      uint64_t v17 = 0;
      unint64_t v18 = 0;
      unsigned int v30 = v9;
      do
      {
        uint64_t v19 = [a4 objectAtIndexedSubscript:v18];
        if (v19)
        {
          __int16 v20 = (void *)v19;
          if ([(NSString *)[(GKSession *)self->_session peerID] isEqualToString:v19])
          {
            -[GKSessionInternal performSelector:withObject:](self, "performSelector:withObject:", sel_tellDelegate_didReceiveData_, objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v20, @"peerID", a3, @"data", 0));
          }
          else
          {
            unsigned int v33 = -1431655766;
            unsigned int v33 = [v20 intValue];
            if (v8)
            {
              if (v9 == 1) {
                AGPSessionSendAudioTo();
              }
              int v21 = v31;
            }
            else
            {
              int v21 = v31;
            }
            uint64_t v22 = AGPSessionSendTo((uint64_t)self->agpSessionRef, (uint64_t)&v33, 1, v16, v21);
            if (v22)
            {
              ++v17;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v23 = v17;
                uint64_t v24 = v16;
                BOOL v25 = v8;
                uint64_t v26 = VRTraceErrorLogLevelToCSTR();
                id v27 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v35 = v26;
                  __int16 v36 = 2080;
                  int v37 = "-[GKSessionInternal sendData:toPeers:withDataMode:enableOOB:error:]";
                  __int16 v38 = 1024;
                  int v39 = 2821;
                  __int16 v40 = 2048;
                  uint64_t v41 = v33;
                  __int16 v42 = 2048;
                  uint64_t v43 = v22;
                  _os_log_impl(&dword_221563000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AGPSessionSendTo failed for peer:(%lx) error:(%lX)\n", buf, 0x30u);
                }
                BOOL v8 = v25;
                uint64_t v16 = v24;
                uint64_t v17 = v23;
                unsigned int v9 = v30;
              }
            }
            else
            {
              uint64_t v22 = v32;
            }
            uint64_t v32 = v22;
          }
        }
        ++v18;
      }
      while (v18 < [a4 count]);
      [(GKSessionInternal *)self unlock];
      if (v29 && v17) {
        id *v29 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30202, @"Send data error.", objc_msgSend(NSString, "stringWithFormat:", @"AGPSessionSendTo failed (%08X).", v32));
      }
    }
    else
    {
      [(GKSessionInternal *)self unlock];
      uint64_t v17 = 0;
    }

    LOBYTE(v13) = v17 != [a4 count];
  }
  return v13;
}

- (BOOL)sendDataToAllPeers:(id)a3 withDataMode:(unsigned int)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v7 = a3;
    [a3 bytes];
    [a3 length];
    [(GKSessionInternal *)self lock];
    AGPSessionBroadcast();
  }
  if (a5) {
    *a5 = [(GKSessionInternal *)self newNSErrorFromGKSessionError:30500 description:@"Invalid parameter for -sendDataToAllPeers:withDataMode:error:" reason:@"Parameter data is invalid."];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    unsigned int v9 = *MEMORY[0x263F21098];
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v10) {
      return result;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v13 = v8;
    __int16 v14 = 2080;
    id v15 = "-[GKSessionInternal sendDataToAllPeers:withDataMode:error:]";
    __int16 v16 = 1024;
    int v17 = 2850;
    _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendDataToAllPeers - bad parameter", buf, 0x1Cu);
  }
  return 0;
}

- (void)receiveDOOB:(id)a3 fromPeer:(id)a4 inSession:(id)a5 context:(void *)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136316418;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      id v15 = "-[GKSessionInternal receiveDOOB:fromPeer:inSession:context:]";
      __int16 v16 = 1024;
      int v17 = 2890;
      __int16 v18 = 1024;
      int v19 = [a3 length];
      __int16 v20 = 2048;
      uint64_t v21 = (int)[a4 intValue];
      __int16 v22 = 2112;
      uint64_t v23 = [a5 displayNameForPeer:a4];
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RetryICE:: gcksession:didReceiveDOOB: %d bytes fromPeer: %08lx %@", (uint8_t *)&v12, 0x36u);
    }
  }
  GCKSessionReceiveDOOB((uint64_t)self->sessionRef, [a4 intValue], (unsigned __int16 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (void)setDOOBReceiveHandler:(id)a3 withContext:(void *)a4 inBand:(unsigned int)a5
{
  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  if (a3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v10 = @"The out-of-band data handler does not respond to the correct selector.";
  }
  else
  {
    if (a5 == 1)
    {
      self->_doobReceiveHandler[1] = (GKSessionDOOBReceiveHandler *)a3;
      self->_doobReceiveHandlerContext[1] = a4;
      goto LABEL_11;
    }
    uint64_t v10 = @"The band specifier is out-of-range for this implementation or build version.";
  }
  id v11 = [(GKSessionInternal *)self newNSErrorFromGKSessionError:30500 description:@"Invalid parameter for -setOOBReceiveHandler:withContext:inBand" reason:v10];
  int v12 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v11, @"NSError", 0);
  [(GKSessionInternal *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    || ([(GKSessionInternal *)self privateDelegate], (objc_opt_respondsToSelector() & 1) != 0))
  {
    [(GKSessionInternal *)self performSelectorOnMainThread:sel_tellDelegate_sessionDidFailWithError_ withObject:v12 waitUntilDone:0];
  }

LABEL_11:
  pthread_mutex_unlock(p_delegateLock);
}

- (id)dataReceiveHandler
{
  return objc_loadWeak(&self->_dataReceiveHandler);
}

- (void)setDataReceiveHandler:(id)a3 withContext:(void *)a4
{
  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  if (a3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v8 = [(GKSessionInternal *)self newNSErrorFromGKSessionError:30500 description:@"Invalid parameter for -setDataReceiveHandler:withContext:" reason:@"The handler does not respond to the correct selector."];
    unsigned int v9 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v8, @"NSError", 0);
    [(GKSessionInternal *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      || ([(GKSessionInternal *)self privateDelegate], (objc_opt_respondsToSelector() & 1) != 0))
    {
      [(GKSessionInternal *)self performSelectorOnMainThread:sel_tellDelegate_sessionDidFailWithError_ withObject:v9 waitUntilDone:0];
    }
  }
  else
  {
    objc_storeWeak(&self->_dataReceiveHandler, a3);
    self->_dataReceiveHandlerContext = a4;
  }
  pthread_mutex_unlock(p_delegateLock);
}

- (void)timeoutConnectToPeer:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F086B0]);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  id v7 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    unsigned int v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      displayName = self->_displayName;
      [a3 connectTimeout];
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = v8;
      __int16 v24 = 2080;
      BOOL v25 = "-[GKSessionInternal timeoutConnectToPeer:]";
      __int16 v26 = 1024;
      int v27 = 2952;
      __int16 v28 = 2112;
      int v29 = displayName;
      __int16 v30 = 2048;
      *(void *)int v31 = v11;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%@] timeoutConnectToPeer: scheduled for %.3lf seconds in the future", buf, 0x30u);
    }
  }
  *(&v21.tv_usec + 1) = -1431655766;
  [a3 connectTimeout];
  double v13 = v12;
  v21.tv_sec = (uint64_t)v12;
  [a3 connectTimeout];
  v21.tv_usec = (int)((v14 - (double)(uint64_t)v13) * 1000000.0);
  select(0, 0, 0, 0, &v21);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    __int16 v16 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = self->_displayName;
      int v18 = [a3 pid];
      BOOL v19 = -[GKList hasID:](self->_peersConnected, "hasID:", [a3 pid]);
      int v20 = [a3 needsToTimeout];
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v15;
      __int16 v24 = 2080;
      BOOL v25 = "-[GKSessionInternal timeoutConnectToPeer:]";
      __int16 v26 = 1024;
      int v27 = 2959;
      __int16 v28 = 2112;
      int v29 = v17;
      __int16 v30 = 1024;
      *(_DWORD *)int v31 = v18;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v19;
      __int16 v32 = 1024;
      int v33 = v20;
      _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%@] timeoutConnectToPeer: %d - connected?(%d) needs to?(%d)", buf, 0x38u);
    }
  }
  if (!-[GKList hasID:](self->_peersConnected, "hasID:", [a3 pid])
    && [a3 needsToTimeout])
  {
    [a3 pid];
    GCKSessionCancelConnectToLocalService();
  }

  [v5 drain];
}

- (void)connectToPeer:(id)a3 withTimeout:(double)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a3 intValue];
  id v8 = [(GKTable *)self->_peerInfoTable objectForKey:v7];
  if (v8)
  {
    unsigned int v9 = v8;
    [(GKList *)self->_peersPendingOutgoingInvitation addID:v7];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v32 = v10;
        __int16 v33 = 2080;
        uint64_t v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
        __int16 v35 = 1024;
        int v36 = 3009;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving? potentially previous resolves", buf, 0x1Cu);
      }
    }
    [v9 stopResolving];
    double v12 = 30000000.0;
    if (a4 != 0.0) {
      double v12 = a4;
    }
    [v9 setConnectTimeout:v12];
    [v9 setNeedsToTimeout:1];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary"), "objectForKey:", @"CFBundleName");
    [(GKConnection *)self->_connection reportingAgent];
    connectingGKLog();
    [(GKConnection *)self->_connection reportingAgent];
    reportingGKAppInfo();
    if ([(GKSessionInternal *)self checkDNSConnection])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        double v14 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v32 = v13;
          __int16 v33 = 2080;
          uint64_t v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
          __int16 v35 = 1024;
          int v36 = 3053;
          uint64_t v15 = " [%s] %s:%d Connect: Unable to use DNS connection!";
          __int16 v16 = v14;
          uint32_t v17 = 28;
LABEL_27:
          _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        }
      }
    }
    else
    {
      DNSServiceRef sdRef = self->_dnsServiceResolveConnection;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        BOOL v19 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v32 = v18;
          __int16 v33 = 2080;
          uint64_t v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
          __int16 v35 = 1024;
          int v36 = 3029;
          __int16 v37 = 2112;
          *(void *)__int16 v38 = a3;
          _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ********** BEGIN RESOLVE: %@", buf, 0x26u);
        }
      }
      DNSServiceErrorType v20 = DNSServiceResolve(&sdRef, 0x24000u, 0, (const char *)objc_msgSend((id)objc_msgSend(v9, "serviceName"), "UTF8String"), -[NSString UTF8String](self->serviceType, "UTF8String"), "local.", (DNSServiceResolveReply)gkResolveCallback, v9);
      if (v20)
      {
        DNSServiceErrorType v21 = v20;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          uint64_t v23 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = objc_msgSend((id)objc_msgSend(v9, "serviceName"), "UTF8String");
            BOOL v25 = [(NSString *)self->serviceType UTF8String];
            *(_DWORD *)buf = 136316418;
            uint64_t v32 = v22;
            __int16 v33 = 2080;
            uint64_t v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
            __int16 v35 = 1024;
            int v36 = 3041;
            __int16 v37 = 1024;
            *(_DWORD *)__int16 v38 = v21;
            *(_WORD *)&v38[4] = 2080;
            *(void *)&v38[6] = v24;
            __int16 v39 = 2080;
            __int16 v40 = v25;
            uint64_t v15 = " [%s] %s:%d resolve failed right away: %d [%s][%s]";
            __int16 v16 = v23;
            uint32_t v17 = 54;
            goto LABEL_27;
          }
        }
      }
      else
      {
        [v9 setResolveService:sdRef];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          int v27 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = [v9 serviceName];
            *(_DWORD *)buf = 136316418;
            uint64_t v32 = v26;
            __int16 v33 = 2080;
            uint64_t v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
            __int16 v35 = 1024;
            int v36 = 3047;
            __int16 v37 = 2112;
            *(void *)__int16 v38 = v28;
            *(_WORD *)&v38[8] = 1024;
            *(_DWORD *)&v38[10] = sdRef;
            __int16 v39 = 1024;
            LODWORD(v40) = 0;
            uint64_t v15 = " [%s] %s:%d peer [%@]: pending resolve: %08X (shares from %08X)";
            __int16 v16 = v27;
            uint32_t v17 = 50;
            goto LABEL_27;
          }
        }
      }
    }
  }
  else if (a3)
  {
    [(GKSessionInternal *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      || ([(GKSessionInternal *)self privateDelegate], (objc_opt_respondsToSelector() & 1) != 0))
    {
      id v29 = [(GKSessionInternal *)self newNSErrorFromGKSessionError:30501 description:@"The peerID was not found." reason:@"Invalid peerID."];
      -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_connectionRequestToPeerFailed_, objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", a3, @"peerID", v29, @"NSError", 0), 0);
    }
  }
}

- (void)cancelConnectToPeer:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal cancelConnectToPeer:]();
      }
    }
  }
  else if (a3)
  {
    id v4 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", [a3 intValue]);
    if (v4)
    {
      id v5 = v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315906;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          uint64_t v11 = "-[GKSessionInternal cancelConnectToPeer:]";
          __int16 v12 = 1024;
          int v13 = 3070;
          __int16 v14 = 2112;
          uint64_t v15 = [v5 displayName];
          _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ local cancelled", (uint8_t *)&v8, 0x26u);
        }
      }
      [v5 stopResolving];
    }
    [(GKConnection *)self->_connection reportingAgent];
    reportingGKLog();
    GCKSessionCancelConnectToLocalService();
  }
}

- (BOOL)acceptConnectionFromPeer:(id)a3 error:(id *)a4
{
  if (self->_shutdown)
  {
    if (a4) {
      *a4 = [(GKSessionInternal *)self newNSErrorFromGKSessionError:30500 description:@"Session already released - invalid operation." reason:@"Session shutting down."];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal acceptConnectionFromPeer:error:]();
      }
    }
  }
  else
  {
    if (a3)
    {
      [a3 intValue];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary"), "objectForKey:", @"CFBundleName");
      [(GKConnection *)self->_connection reportingAgent];
      connectingGKLog();
      [(GKConnection *)self->_connection reportingAgent];
      reportingGKAppInfo();
      GCKSessionRespondToInvitation();
    }
    if (a4) {
      *a4 = [(GKSessionInternal *)self newNSErrorFromGKSessionError:30500 description:@"Invalid parameter for -acceptConnectionFromPeer:error:" reason:@"Parameter peerID is invalid."];
    }
  }
  return 0;
}

- (void)denyConnectionFromPeer:(id)a3
{
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKSessionInternal denyConnectionFromPeer:]();
      }
    }
  }
  else if (a3)
  {
    -[GKList removeID:](self->_peersPendingIncomingInvitation, "removeID:", [a3 intValue]);
    [(GKConnection *)self->_connection reportingAgent];
    reportingGKLog();
    GCKSessionRespondToInvitation();
  }
}

- (void)disconnectPeerFromAllPeers:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      id v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = v3;
        __int16 v24 = 2080;
        BOOL v25 = "-[GKSessionInternal disconnectPeerFromAllPeers:]";
        __int16 v26 = 1024;
        int v27 = 3129;
        id v5 = " [%s] %s:%d cannot disconnect peer after reset";
LABEL_5:
        _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
      }
    }
  }
  else if (a3)
  {
    unsigned int v21 = [a3 intValue];
    [(GKConnection *)self->_connection reportingAgent];
    reportingGKLog();
    uint64_t v7 = [[GKOOBMessage alloc] initWithMessageType:1500];
    if (v7)
    {
      int v8 = v7;
      id v9 = [(GKOOBMessage *)v7 data];
      if (v9)
      {
        __int16 v10 = v9;
        id v11 = v9;
        uint64_t v12 = [v10 bytes];
        int v13 = [v10 length];
        [(GKSessionInternal *)self lock];
        unsigned int v14 = AGPSessionSendTo((uint64_t)self->agpSessionRef, (uint64_t)&v21, 1, v12, v13);
        if (v14)
        {
          unsigned int v15 = v14;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            uint32_t v17 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v23 = v16;
              __int16 v24 = 2080;
              BOOL v25 = "-[GKSessionInternal disconnectPeerFromAllPeers:]";
              __int16 v26 = 1024;
              int v27 = 3165;
              __int16 v28 = 2048;
              uint64_t v29 = v21;
              __int16 v30 = 2048;
              uint64_t v31 = v15;
              _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d disconnectPeerFromAllPeers: AGPSessionSendTo failed for peer:(%lx) error:(%lX)\n", buf, 0x30u);
            }
          }
        }
        [(GKSessionInternal *)self unlock];
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        DNSServiceErrorType v20 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v23 = v19;
          __int16 v24 = 2080;
          BOOL v25 = "-[GKSessionInternal disconnectPeerFromAllPeers:]";
          __int16 v26 = 1024;
          int v27 = 3150;
          _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d disconnectPeerFromAllPeers: can't get message data", buf, 0x1Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      id v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = v18;
        __int16 v24 = 2080;
        BOOL v25 = "-[GKSessionInternal disconnectPeerFromAllPeers:]";
        __int16 v26 = 1024;
        int v27 = 3145;
        id v5 = " [%s] %s:%d disconnectPeerFromAllPeers: can't create message";
        goto LABEL_5;
      }
    }
  }
}

- (void)disconnectFromAllPeers
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot disconnect self after reset", v2, v3, v4, v5, v6);
}

- (void)setAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v52 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint8_t v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v42 = 2080;
      uint64_t v43 = "-[GKSessionInternal setAvailable:]";
      __int16 v44 = 1024;
      int v45 = 3189;
      __int16 v46 = 1024;
      int v47 = v3;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setAvailable: %d", buf, 0x22u);
    }
  }
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v7;
        __int16 v42 = 2080;
        uint64_t v43 = "-[GKSessionInternal setAvailable:]";
        __int16 v44 = 1024;
        int v45 = 3192;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cannot setavailable after reset", buf, 0x1Cu);
      }
    }
    return;
  }
  if (v3)
  {
    int v9 = +[GKBluetoothSupport bluetoothStatus];
    int v10 = v9;
    if (self->_wifiEnabled || v9 == 5)
    {
      if (!self->_wifiEnabled) {
        goto LABEL_45;
      }
      *(void *)buf = 0;
      int LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
      uint64_t v28 = *(void *)buf;
      if (LocalInterfaceListWithOptions >= 1)
      {
        uint64_t v29 = 0;
        uint64_t v30 = 40 * LocalInterfaceListWithOptions;
        while ((*(unsigned char *)(v28 + v29) & 1) != 0 || strcmp((const char *)(v28 + v29 + 4), "en0"))
        {
          v29 += 40;
          if (v30 == v29) {
            goto LABEL_42;
          }
        }
        FreeLocalInterfaceList();
        goto LABEL_45;
      }
LABEL_42:
      FreeLocalInterfaceList();
      if (v10 != 4)
      {
LABEL_45:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v31 = VRTraceErrorLogLevelToCSTR();
          uint64_t v32 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            BOOL sessionStarted = self->_sessionStarted;
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v31;
            __int16 v42 = 2080;
            uint64_t v43 = "-[GKSessionInternal setAvailable:]";
            __int16 v44 = 1024;
            int v45 = 3271;
            __int16 v46 = 1024;
            int v47 = sessionStarted;
            _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sessionStarted: %d", buf, 0x22u);
          }
        }
        if (!self->_sessionStarted)
        {
          self->_BOOL sessionStarted = 1;
          self->_isBusy = 0;
          unsigned int mode = self->_mode;
          if (mode - 1 <= 1)
          {
            if (self->_serviceBrowser)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v35 = VRTraceErrorLogLevelToCSTR();
                int v36 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  serviceBrowser = self->_serviceBrowser;
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = v35;
                  __int16 v42 = 2080;
                  uint64_t v43 = "-[GKSessionInternal setAvailable:]";
                  __int16 v44 = 1024;
                  int v45 = 3286;
                  __int16 v46 = 1024;
                  int v47 = (int)serviceBrowser;
                  _os_log_impl(&dword_221563000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X)", buf, 0x22u);
                }
              }
              DNSServiceRefDeallocate(self->_serviceBrowser);
              self->_serviceBrowser = 0;
            }
            self->_BOOL isSearching = 1;
            [(GKSessionInternal *)self browse];
            unsigned int mode = self->_mode;
          }
          if ((mode | 2) == 2)
          {
            [(id)g_GKSessionGlobals registerPID:self->_pid];
            if (self->_service)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v38 = VRTraceErrorLogLevelToCSTR();
                __int16 v39 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  service = self->_service;
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = v38;
                  __int16 v42 = 2080;
                  uint64_t v43 = "-[GKSessionInternal setAvailable:]";
                  __int16 v44 = 1024;
                  int v45 = 3298;
                  __int16 v46 = 1024;
                  int v47 = (int)service;
                  _os_log_impl(&dword_221563000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_service) (%08X)", buf, 0x22u);
                }
              }
              DNSServiceRefDeallocate(self->_service);
              self->_service = 0;
            }
            self->_BOOL isPublishing = 0;
            [(GKSessionInternal *)self publish];
          }
        }
        return;
      }
      id v11 = @"Network not available.";
      uint64_t v12 = @"WiFi and/or Bluetooth is required.";
    }
    else
    {
      id v11 = @"Bluetooth not available.";
      uint64_t v12 = @"Bluetooth is required.";
    }
    id v13 = [(GKSessionInternal *)self newNSErrorFromGKSessionError:30509 description:v11 reason:v12];
    unsigned int v14 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v13, @"NSError", 0);
    [(GKSessionInternal *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(GKSessionInternal *)self performSelectorOnMainThread:sel_tellDelegate_sessionDidFailWithError_ withObject:v14 waitUntilDone:0];
    }

    goto LABEL_45;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = self->_sessionStarted;
      BOOL isSearching = self->_isSearching;
      BOOL isPublishing = self->_isPublishing;
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v42 = 2080;
      uint64_t v43 = "-[GKSessionInternal setAvailable:]";
      __int16 v44 = 1024;
      int v45 = 3197;
      __int16 v46 = 1024;
      int v47 = v17;
      __int16 v48 = 1024;
      BOOL v49 = isSearching;
      __int16 v50 = 1024;
      BOOL v51 = isPublishing;
      _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sessionStarted: %d  (%d, %d)", buf, 0x2Eu);
    }
  }
  if (self->_sessionStarted)
  {
    unsigned int v20 = self->_mode;
    if (v20 - 1 <= 1 && self->_isSearching)
    {
      if (self->_serviceBrowser)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          uint64_t v22 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = self->_serviceBrowser;
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v21;
            __int16 v42 = 2080;
            uint64_t v43 = "-[GKSessionInternal setAvailable:]";
            __int16 v44 = 1024;
            int v45 = 3207;
            __int16 v46 = 1024;
            int v47 = (int)v23;
            _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X)", buf, 0x22u);
          }
        }
        DNSServiceRefDeallocate(self->_serviceBrowser);
      }
      self->_BOOL isSearching = 0;
      [(GKList *)self->_peersAvailable removeAllIDs];
      unsigned int v20 = self->_mode;
    }
    if ((v20 | 2) == 2)
    {
      [(id)g_GKSessionGlobals unregisterPID:self->_pid];
      if (self->_isPublishing)
      {
        if (self->_service)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v24 = VRTraceErrorLogLevelToCSTR();
            BOOL v25 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              __int16 v26 = self->_service;
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = v24;
              __int16 v42 = 2080;
              uint64_t v43 = "-[GKSessionInternal setAvailable:]";
              __int16 v44 = 1024;
              int v45 = 3219;
              __int16 v46 = 1024;
              int v47 = (int)v26;
              _os_log_impl(&dword_221563000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_service) (%08X)", buf, 0x22u);
            }
          }
          DNSServiceRefDeallocate(self->_service);
        }
        self->_BOOL isPublishing = 0;
      }
    }
    self->_BOOL sessionStarted = 0;
  }
}

- (BOOL)isAvailable
{
  return self->_sessionStarted;
}

- (id)peersWithConnectionState:(unsigned int)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0u:
      peersAvailable = self->_peersAvailable;
      goto LABEL_4;
    case 2u:
    case 5u:
      peersAvailable = self->_peersConnected;
LABEL_4:
      peerIDTable = self->_peerIDTable;
      return [(GKList *)peersAvailable allMatchingObjectsFromTable:peerIDTable];
    case 4u:
      id v3 = [(GKList *)self->_peersPendingIncomingInvitation allMatchingObjectsFromTable:self->_peerIDTable];
      objc_msgSend(v3, "addObjectsFromArray:", -[GKList allMatchingObjectsFromTable:](self->_peersPendingOutgoingInvitation, "allMatchingObjectsFromTable:", self->_peerIDTable));
      return v3;
    default:
      return v3;
  }
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)stopOldService
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v6 = xmmword_2215E8A00;
  DWORD2(v6) = 0;
  select(0, 0, 0, 0, (timeval *)&v6);
  oldService = self->_oldService;
  if (oldService)
  {
    self->_oldService = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        int v10 = "-[GKSessionInternal stopOldService]";
        __int16 v11 = 1024;
        int v12 = 3361;
        __int16 v13 = 1024;
        int v14 = (int)oldService;
        _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceToStop) (%08X)", buf, 0x22u);
      }
    }
    DNSServiceRefDeallocate(oldService);
  }
}

- (void)setBusy:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self->_isBusy != a3)
  {
    self->_isBusy = a3;
    [(GKSessionInternal *)self lock];
    if (self->_isPublishing)
    {
      txtRecord.ForceNaturalAlignment = (char *)0xAAAAAAAAAAAAAAAALL;
      *((void *)&txtRecord.ForceNaturalAlignment + 1) = 0xAAAAAAAAAAAAAAAALL;
      TXTRecordCreate(&txtRecord, 0, 0);
      DNSServiceErrorType v4 = TXTRecordSetValue(&txtRecord, "txtvers", 1u, "1");
      if (self->_isBusy) {
        uint64_t v5 = "B";
      }
      else {
        uint64_t v5 = "A";
      }
      BOOL v6 = (TXTRecordSetValue(&txtRecord, "state", 1u, v5) | v4) == 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          if (v6) {
            int Length = TXTRecordGetLength(&txtRecord);
          }
          else {
            int Length = 0;
          }
          int v16 = 136316162;
          uint64_t v17 = v7;
          __int16 v18 = 2080;
          uint64_t v19 = "-[GKSessionInternal setBusy:]";
          __int16 v20 = 1024;
          int v21 = 3401;
          __int16 v22 = 1024;
          *(_DWORD *)uint64_t v23 = v6;
          *(_WORD *)&v23[4] = 1024;
          *(_DWORD *)&v23[6] = Length;
          _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceUpdateRecord() (use?=%d len=%d)", (uint8_t *)&v16, 0x28u);
        }
      }
      service = self->_service;
      if (v6)
      {
        uint16_t v11 = TXTRecordGetLength(&txtRecord);
        BytesPtr = TXTRecordGetBytesPtr(&txtRecord);
      }
      else
      {
        uint16_t v11 = 0;
        BytesPtr = 0;
      }
      DNSServiceErrorType updated = DNSServiceUpdateRecord(service, 0, 0x20000u, v11, BytesPtr, 0);
      TXTRecordDeallocate(&txtRecord);
      if (updated && (int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315906;
          uint64_t v17 = v14;
          __int16 v18 = 2080;
          uint64_t v19 = "-[GKSessionInternal setBusy:]";
          __int16 v20 = 1024;
          int v21 = 3410;
          __int16 v22 = 2048;
          *(void *)uint64_t v23 = self;
          _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d failed to set busy state for session[%p]", (uint8_t *)&v16, 0x26u);
        }
      }
    }
    [(GKSessionInternal *)self unlock];
  }
}

- (BOOL)wifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setWifiEnabled:(BOOL)a3
{
  self->_wifiEnabled = a3;
  GCKSessionSetWifiEnabled();
}

- (BOOL)isPeerBusy:(id)a3
{
  id v3 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", [a3 intValue]);
  if (v3)
  {
    LOBYTE(v3) = [v3 isBusy];
  }
  return (char)v3;
}

- (void)setDisconnectTimeout:(double)a3
{
}

- (double)disconnectTimeout
{
  return self->disconnectTimeout;
}

- (void)handleEvents
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v57.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v57.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  id v3 = objc_alloc_init(MEMORY[0x263F086B0]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      buf.fds_bits[0] = 136315906;
      *(void *)&buf.fds_bits[1] = v4;
      LOWORD(buf.fds_bits[3]) = 2080;
      *(void *)((char *)&buf.fds_bits[3] + 2) = "-[GKSessionInternal handleEvents]";
      HIWORD(buf.fds_bits[5]) = 1024;
      buf.fds_bits[6] = 3465;
      LOWORD(buf.fds_bits[7]) = 1024;
      *(__int32_t *)((char *)&buf.fds_bits[7] + 2) = [(GKSessionInternal *)self retainCount];
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d handleEvents started (%d)", (uint8_t *)&buf, 0x22u);
    }
  }
  memset(&buf, 0, sizeof(buf));
  [(GKSessionInternal *)self lock];
  if (!self->_stopHandlingEvents)
  {
    int v56 = 0;
    *(void *)&long long v6 = 136315906;
    long long v55 = v6;
    do
    {
      if (self->_shutdown) {
        break;
      }
      int sReset = self->_sReset;
      if (sReset != -1) {
        close(sReset);
      }
      int v14 = socket(2, 1, 6);
      self->_int sReset = v14;
      if (v14 == -1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v44 = VRTraceErrorLogLevelToCSTR();
          uint64_t v8 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v58 = 136315650;
            uint64_t v59 = v44;
            __int16 v60 = 2080;
            uint64_t v61 = "-[GKSessionInternal handleEvents]";
            __int16 v62 = 1024;
            int v63 = 3487;
            __int16 v9 = " [%s] %s:%d handleEvents stop... (cannot create reset socket)";
            goto LABEL_8;
          }
        }
        goto LABEL_9;
      }
      int v15 = v14;
      if (__darwin_check_fd_set_overflow(v14, &buf, 0)) {
        *(__int32_t *)((char *)buf.fds_bits + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v15;
      }
      int v16 = self->_sReset;
      [(GKSessionInternal *)self unlock];
      dnsServiceConnection = self->_dnsServiceConnection;
      if (!dnsServiceConnection || (dnssd_sock_t v18 = DNSServiceRefSockFD(dnsServiceConnection), v18 == -1))
      {
        int v19 = -1;
      }
      else
      {
        int v19 = v18;
        if (__darwin_check_fd_set_overflow(v18, &buf, 0)) {
          *(__int32_t *)((char *)buf.fds_bits + (((unint64_t)v19 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v19;
        }
        if (v16 <= v19) {
          int v16 = v19;
        }
      }
      dnsServiceResolveConnection = self->_dnsServiceResolveConnection;
      if (!dnsServiceResolveConnection || (dnssd_sock_t v21 = DNSServiceRefSockFD(dnsServiceResolveConnection), v21 == -1))
      {
        int v22 = -1;
      }
      else
      {
        int v22 = v21;
        if (__darwin_check_fd_set_overflow(v21, &buf, 0)) {
          *(__int32_t *)((char *)buf.fds_bits + (((unint64_t)v22 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v22;
        }
        int v23 = v22;
        if (v16 < v22)
        {
LABEL_36:
          v57.tv_sec = 30;
          v57.tv_usec = 0;
          int v24 = select(v22 + 1, &buf, 0, 0, &v57);
          int v25 = v24;
          if (v24 < 0)
          {
            int v37 = *__error();
            int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
            if (v37 != 9)
            {
              if (ErrorLogLevelForModule >= 7)
              {
                uint64_t v45 = VRTraceErrorLogLevelToCSTR();
                __int16 v46 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  int v47 = *__error();
                  __int16 v48 = __error();
                  BOOL v49 = strerror(*v48);
                  *(_DWORD *)uint64_t v58 = 136316418;
                  uint64_t v59 = v45;
                  __int16 v60 = 2080;
                  uint64_t v61 = "-[GKSessionInternal handleEvents]";
                  __int16 v62 = 1024;
                  int v63 = 3585;
                  __int16 v64 = 1024;
                  int v65 = v25;
                  __int16 v66 = 1024;
                  int v67 = v47;
                  __int16 v68 = 2080;
                  int v69 = v49;
                  __int16 v50 = " [%s] %s:%d select failed (%d): %d: %s";
                  BOOL v51 = v46;
                  uint32_t v52 = 50;
LABEL_71:
                  _os_log_impl(&dword_221563000, v51, OS_LOG_TYPE_DEFAULT, v50, v58, v52);
                  goto LABEL_10;
                }
              }
              goto LABEL_10;
            }
            if (ErrorLogLevelForModule >= 7)
            {
              uint64_t v39 = VRTraceErrorLogLevelToCSTR();
              __int16 v40 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v58 = 136315650;
                uint64_t v59 = v39;
                __int16 v60 = 2080;
                uint64_t v61 = "-[GKSessionInternal handleEvents]";
                __int16 v62 = 1024;
                int v63 = 3580;
                uint64_t v34 = v40;
                uint64_t v35 = " [%s] %s:%d handleEvents: EBADF - retrying...";
                uint32_t v36 = 28;
LABEL_56:
                _os_log_impl(&dword_221563000, v34, OS_LOG_TYPE_DEFAULT, v35, v58, v36);
              }
            }
          }
          else if (v24)
          {
            if (v19 != -1)
            {
              if (__darwin_check_fd_set_overflow(v19, &buf, 0))
              {
                if ((*(unsigned int *)((char *)buf.fds_bits + (((unint64_t)v19 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v19))
                {
                  DNSServiceErrorType v26 = DNSServiceProcessResult(self->_dnsServiceConnection);
                  if (v26)
                  {
                    DNSServiceErrorType v27 = v26;
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
                      uint64_t v29 = *MEMORY[0x263F21098];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t v58 = v55;
                        uint64_t v59 = v28;
                        __int16 v60 = 2080;
                        uint64_t v61 = "-[GKSessionInternal handleEvents]";
                        __int16 v62 = 1024;
                        int v63 = 3594;
                        __int16 v64 = 1024;
                        int v65 = v27;
                        _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d process dnsservice conn failed: %d", v58, 0x22u);
                      }
                    }
                  }
                }
              }
            }
            if (v23 != -1)
            {
              if (__darwin_check_fd_set_overflow(v23, &buf, 0))
              {
                if ((*(unsigned int *)((char *)buf.fds_bits + (((unint64_t)v23 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v23))
                {
                  DNSServiceErrorType v30 = DNSServiceProcessResult(self->_dnsServiceResolveConnection);
                  if (v30)
                  {
                    DNSServiceErrorType v31 = v30;
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
                      __int16 v33 = *MEMORY[0x263F21098];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t v58 = v55;
                        uint64_t v59 = v32;
                        __int16 v60 = 2080;
                        uint64_t v61 = "-[GKSessionInternal handleEvents]";
                        __int16 v62 = 1024;
                        int v63 = 3600;
                        __int16 v64 = 1024;
                        int v65 = v31;
                        uint64_t v34 = v33;
                        uint64_t v35 = " [%s] %s:%d process dnsservice resolve conn failed: %d";
                        uint32_t v36 = 34;
                        goto LABEL_56;
                      }
                    }
                  }
                }
              }
            }
          }
          memset(&buf, 0, sizeof(buf));
          goto LABEL_58;
        }
      }
      int v23 = v22;
      int v22 = v16;
      if (v16 != -1) {
        goto LABEL_36;
      }
      int v41 = VRTraceGetErrorLogLevelForModule();
      if (v56 == 3)
      {
        if (v41 >= 7)
        {
          uint64_t v53 = VRTraceErrorLogLevelToCSTR();
          id v54 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v58 = 136315650;
            uint64_t v59 = v53;
            __int16 v60 = 2080;
            uint64_t v61 = "-[GKSessionInternal handleEvents]";
            __int16 v62 = 1024;
            int v63 = 3562;
            __int16 v50 = " [%s] %s:%d handleEvents: nothing to do - quitting";
            BOOL v51 = v54;
            uint32_t v52 = 28;
            goto LABEL_71;
          }
        }
        goto LABEL_10;
      }
      if (v41 >= 7)
      {
        uint64_t v42 = VRTraceErrorLogLevelToCSTR();
        uint64_t v43 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v58 = 136315650;
          uint64_t v59 = v42;
          __int16 v60 = 2080;
          uint64_t v61 = "-[GKSessionInternal handleEvents]";
          __int16 v62 = 1024;
          int v63 = 3567;
          _os_log_impl(&dword_221563000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d handleEvents: nothing to do - retry after 1 second", v58, 0x1Cu);
        }
      }
      ++v56;
      v57.tv_sec = 1;
      v57.tv_usec = 0;
      select(0, 0, 0, 0, &v57);
      memset(&buf, 0, sizeof(buf));
LABEL_58:
      [(GKSessionInternal *)self lock];
    }
    while (!self->_stopHandlingEvents);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v58 = 136315650;
      uint64_t v59 = v7;
      __int16 v60 = 2080;
      uint64_t v61 = "-[GKSessionInternal handleEvents]";
      __int16 v62 = 1024;
      int v63 = 3477;
      __int16 v9 = " [%s] %s:%d handleEvents stop...";
LABEL_8:
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, v9, v58, 0x1Cu);
    }
  }
LABEL_9:
  [(GKSessionInternal *)self unlock];
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint16_t v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(GKSessionInternal *)self retainCount];
      *(_DWORD *)uint64_t v58 = 136315906;
      uint64_t v59 = v10;
      __int16 v60 = 2080;
      uint64_t v61 = "-[GKSessionInternal handleEvents]";
      __int16 v62 = 1024;
      int v63 = 3658;
      __int16 v64 = 1024;
      int v65 = v12;
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d handleEvents ended (%d)", v58, 0x22u);
    }
  }
  *(_WORD *)&self->_handleEventsRunning = 0;
  [v3 drain];
}

- (BOOL)checkDNSConnection
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(GKSessionInternal *)self lock];
  if (self->_shutdown) {
    goto LABEL_2;
  }
  p_dnsServiceDNSServiceErrorType Connection = &self->_dnsServiceConnection;
  if (!self->_dnsServiceConnection)
  {
    DNSServiceErrorType Connection = DNSServiceCreateConnection(&self->_dnsServiceConnection);
    if (Connection)
    {
      DNSServiceErrorType v6 = Connection;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_2;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_2;
      }
      *(_DWORD *)int v15 = 136315906;
      *(void *)&v15[4] = v7;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[GKSessionInternal checkDNSConnection]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 3678;
      WORD2(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 6) = v6;
      __int16 v9 = " [%s] %s:%d DNSServiceCreateConnection failed: %d";
      goto LABEL_15;
    }
    int sReset = self->_sReset;
    if (sReset != -1)
    {
      close(sReset);
      self->_int sReset = -1;
    }
  }
  if (!self->_dnsServiceResolveConnection)
  {
    DNSServiceErrorType v10 = DNSServiceCreateConnection(&self->_dnsServiceResolveConnection);
    if (!v10)
    {
      int v14 = self->_sReset;
      if (v14 != -1)
      {
        close(v14);
        self->_int sReset = -1;
      }
      goto LABEL_5;
    }
    DNSServiceErrorType v11 = v10;
    DNSServiceRefDeallocate(*p_dnsServiceConnection);
    *p_dnsServiceDNSServiceErrorType Connection = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7
      || (uint64_t v12 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v8 = *MEMORY[0x263F21098],
          !os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)))
    {
LABEL_2:
      [(GKSessionInternal *)self unlock];
      return 1;
    }
    *(_DWORD *)int v15 = 136315906;
    *(void *)&v15[4] = v12;
    *(_WORD *)&v15[12] = 2080;
    *(void *)&v15[14] = "-[GKSessionInternal checkDNSConnection]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 3692;
    WORD2(v16) = 1024;
    *(_DWORD *)((char *)&v16 + 6) = v11;
    __int16 v9 = " [%s] %s:%d DNSServiceCreateConnection failed2: %d";
LABEL_15:
    _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, v9, v15, 0x22u);
    goto LABEL_2;
  }
LABEL_5:
  [(GKSessionInternal *)self unlock];
  return 0;
}

- (void)publish
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  int v4 = 3780;
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_error_impl(&dword_221563000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d publish failed: %d", v3, 0x22u);
}

- (BOOL)filterService:(const char *)a3 withPID:(unsigned int)a4
{
  return !self->_wifiEnabled
      && ([(id)g_GKSessionGlobals hasActivePID:*(void *)&a4] & 1) == 0
      && !strcmp(a3, "en0");
}

- (void)cleanupExAvailablePeers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v3 = [(GKList *)self->_peersForCleanup count];
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      __int16 v5 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)fd_set buf = 136315906;
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        __int16 v13 = "-[GKSessionInternal cleanupExAvailablePeers]";
        __int16 v14 = 1024;
        int v15 = 3817;
        __int16 v16 = 1024;
        int v17 = v3;
        _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cleanup previous available peers: (%d)", buf, 0x22u);
      }
    }
    id v6 = [(GKList *)self->_peersForCleanup allMatchingObjectsFromTable:self->_peerInfoTable];
    if ([v6 count])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = (void *)[v6 objectAtIndexedSubscript:v7];
        if (v8)
        {
          __int16 v9 = v8;
          if (!-[GKList hasID:](self->_peersConnected, "hasID:", [v8 pid])
            && !-[GKList hasID:](self->_peersAvailable, "hasID:", [v9 pid]))
          {
            -[GKTable removeObjectForKey:](self->_peerInfoTable, "removeObjectForKey:", [v9 pid]);
            [(GKSessionInternal *)self delegate];
            if ((objc_opt_respondsToSelector() & 1) != 0
              || ([(GKSessionInternal *)self privateDelegate], (objc_opt_respondsToSelector() & 1) != 0))
            {
              -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_peerDidBecomeUnavailable_, objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", objc_msgSend(v9, "pid")), @"peerID", 0), 0);
            }
          }
        }
        ++v7;
      }
      while (v7 < [v6 count]);
    }
    [(GKList *)self->_peersForCleanup removeAllIDs];
  }
}

- (void)processTXTRecordForPeer:(id)a3 txtLen:(unsigned __int16)a4 txtRecord:(const void *)a5
{
  int v6 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a4 && a5)
  {
    if (TXTRecordContainsKey(a4, a5, "state"))
    {
      valueLen[0] = -86;
      ValuePtr = (unsigned __int8 *)TXTRecordGetValuePtr(v6, a5, "state", valueLen);
      BOOL v10 = 0;
      if (ValuePtr && valueLen[0] == 1) {
        BOOL v10 = *ValuePtr == 66;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [a3 pid];
        int v16 = [a3 isBusy];
        *(_DWORD *)valueLen = 136316418;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        int v22 = "-[GKSessionInternal processTXTRecordForPeer:txtLen:txtRecord:]";
        __int16 v23 = 1024;
        int v24 = 3860;
        __int16 v25 = 1024;
        int v26 = v15;
        __int16 v27 = 1024;
        int v28 = v16;
        __int16 v29 = 1024;
        BOOL v30 = v10;
        _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** peer %d: oldbusy=%d, newbusy=%d", valueLen, 0x2Eu);
      }
    }
    if (v10 != [a3 isBusy])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", objc_msgSend(a3, "pid")), @"peerID", 0);
      [a3 setBusy:v10];
      if (v10) {
        uint64_t v18 = sel_tellDelegate_peerDidBecomeBusy_;
      }
      else {
        uint64_t v18 = sel_tellDelegate_peerDidBecomeAvailable_;
      }
      [(GKSessionInternal *)self performSelectorOnMainThread:v18 withObject:v17 waitUntilDone:0];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)valueLen = 136316162;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      int v22 = "-[GKSessionInternal processTXTRecordForPeer:txtLen:txtRecord:]";
      __int16 v23 = 1024;
      int v24 = 3846;
      __int16 v25 = 1024;
      int v26 = (int)a5;
      __int16 v27 = 1024;
      int v28 = v6;
      _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** no TXT record to process: txtRecord=%08X, txtLen=%u", valueLen, 0x28u);
    }
  }
}

- (void)didUpdateTXTRecordForPeer:(id)a3 fromIF:(const char *)a4 txtLen:(unsigned __int16)a5 txtRecord:(const void *)a6 withError:(int)a7 moreComing:(BOOL)a8
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      BOOL v10 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315906;
        uint64_t v23 = v9;
        __int16 v24 = 2080;
        __int16 v25 = "-[GKSessionInternal didUpdateTXTRecordForPeer:fromIF:txtLen:txtRecord:withError:moreComing:]";
        __int16 v26 = 1024;
        int v27 = 3874;
        __int16 v28 = 1024;
        LODWORD(v29) = a7;
        uint64_t v11 = " [%s] %s:%d Bonjour query error: %d";
        __int16 v12 = v10;
        uint32_t v13 = 34;
LABEL_9:
        _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, v13);
      }
    }
  }
  else
  {
    uint64_t v16 = a5;
    if (-[GKSessionInternal filterService:withPID:](self, "filterService:withPID:", a4, [a3 pid]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        __int16 v21 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 136315906;
          uint64_t v23 = v20;
          __int16 v24 = 2080;
          __int16 v25 = "-[GKSessionInternal didUpdateTXTRecordForPeer:fromIF:txtLen:txtRecord:withError:moreComing:]";
          __int16 v26 = 1024;
          int v27 = 3877;
          __int16 v28 = 2080;
          __int16 v29 = a4;
          uint64_t v11 = " [%s] %s:%d resolved to [%s] - skipping";
          __int16 v12 = v21;
          uint32_t v13 = 38;
          goto LABEL_9;
        }
      }
    }
    else
    {
      [(GKSessionInternal *)self processTXTRecordForPeer:a3 txtLen:v16 txtRecord:a6];
      if (!a8)
      {
        [(GKSessionInternal *)self cleanupExAvailablePeers];
      }
    }
  }
}

- (void)didFindService:(const char *)a3 fromIF:(const char *)a4 withError:(int)a5 moreComing:(BOOL)a6
{
  buf[127] = *MEMORY[0x263EF8340];
  id v44 = (id)0xAAAAAAAAAAAAAAAALL;
  unsigned int v43 = -1431655766;
  id v42 = (id)0xAAAAAAAAAAAAAAAALL;
  if ([(GKSessionInternal *)self parseServiceName:a3 intoDisplayName:&v44 pid:&v43 state:&v42])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = v43;
        BOOL v14 = [(GKList *)self->_peersForCleanup hasID:v43];
        LODWORD(buf[0]) = 136316162;
        *(void *)((char *)buf + 4) = v11;
        WORD2(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 6) = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
        HIWORD(buf[2]) = 1024;
        LODWORD(buf[3]) = 3918;
        WORD2(buf[3]) = 1024;
        *(_DWORD *)((char *)&buf[3] + 6) = v13;
        WORD1(buf[4]) = 1024;
        HIDWORD(buf[4]) = v14;
        _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _peersForCleanup: contains %d ?= %d", (uint8_t *)buf, 0x28u);
      }
    }
    [(GKList *)self->_peersForCleanup removeID:v43];
    if ([(GKSessionInternal *)self filterService:a4 withPID:v43])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      LODWORD(buf[0]) = 136316418;
      *(void *)((char *)buf + 4) = v15;
      WORD2(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 6) = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
      HIWORD(buf[2]) = 1024;
      LODWORD(buf[3]) = 3922;
      WORD2(buf[3]) = 2080;
      *(void *)((char *)&buf[3] + 6) = a3;
      HIWORD(buf[4]) = 2080;
      buf[5] = a4;
      LOWORD(buf[6]) = 1024;
      *(_DWORD *)((char *)&buf[6] + 2) = a5;
      uint64_t v17 = " [%s] %s:%d browse rejected: [%s] from [%s] (%d)";
      uint64_t v18 = v16;
      uint32_t v19 = 54;
LABEL_14:
      _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)buf, v19);
LABEL_15:

      return;
    }
    if (self->_mode == 2 && v43 == self->_pid)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      LODWORD(buf[0]) = 136315650;
      *(void *)((char *)buf + 4) = v20;
      WORD2(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 6) = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
      HIWORD(buf[2]) = 1024;
      LODWORD(buf[3]) = 3928;
      uint64_t v17 = " [%s] %s:%d didFind: skipping self";
      uint64_t v18 = v21;
      uint32_t v19 = 28;
      goto LABEL_14;
    }
    int v22 = (void *)[v42 objectForKeyedSubscript:@"busy"];
    if (v22) {
      uint64_t v23 = [v22 BOOLValue];
    }
    else {
      uint64_t v23 = 0;
    }

    __int16 v24 = (GKPeerInternal *)[(GKTable *)self->_peerInfoTable objectForKey:v43];
    if (v24)
    {
      __int16 v25 = v24;
      [(GKPeerInternal *)v24 setServiceCount:[(GKPeerInternal *)v24 serviceCount] + 1];
LABEL_37:

      goto LABEL_38;
    }
    __int16 v26 = [GKPeerInternal alloc];
    __int16 v25 = -[GKPeerInternal initWithPID:displayName:serviceName:](v26, "initWithPID:displayName:serviceName:", v43, v44, [NSString stringWithUTF8String:a3]);
    [(GKPeerInternal *)v25 setSession:self];
    [(GKPeerInternal *)v25 setBusy:v23];
    DNSServiceRef sdRef = self->_dnsServiceConnection;
    memset((char *)buf + 1, 170, 0x3F0uLL);
    LOBYTE(buf[0]) = 0;
    DNSServiceErrorType v27 = DNSServiceConstructFullName((char *const)buf, a3, [(NSString *)self->serviceType UTF8String], "local.");
    if (v27)
    {
      DNSServiceErrorType v28 = v27;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_30;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_DWORD *)uint64_t v45 = 136316162;
      uint64_t v46 = v29;
      __int16 v47 = 2080;
      __int16 v48 = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
      __int16 v49 = 1024;
      int v50 = 3984;
      __int16 v51 = 1024;
      *(_DWORD *)uint32_t v52 = v43;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v28;
      uint64_t v31 = " [%s] %s:%d ** cannot construct fullname! no busy state updates for peer %u (error=%d)";
      uint64_t v32 = v30;
      uint32_t v33 = 40;
    }
    else
    {
      DNSServiceErrorType v34 = DNSServiceQueryRecord(&sdRef, 0x24000u, 0, (const char *)buf, 0x10u, 1u, (DNSServiceQueryRecordReply)gkQueryRecordCallback, v25);
      if (!v34) {
        goto LABEL_31;
      }
      DNSServiceErrorType v35 = v34;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v36 = VRTraceErrorLogLevelToCSTR(),
            int v37 = *MEMORY[0x263F21098],
            !os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_30:
        DNSServiceRef sdRef = 0;
LABEL_31:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v38 = VRTraceErrorLogLevelToCSTR();
          uint64_t v39 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v45 = 136315906;
            uint64_t v46 = v38;
            __int16 v47 = 2080;
            __int16 v48 = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
            __int16 v49 = 1024;
            int v50 = 3997;
            __int16 v51 = 2080;
            *(void *)uint32_t v52 = buf;
            _os_log_impl(&dword_221563000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => called DNSServiceQueryRecord() (fullname=[%s])", v45, 0x26u);
          }
        }
        [(GKPeerInternal *)v25 setTxtRecordService:sdRef];
        [(GKSessionInternal *)self lock];
        [(GKTable *)self->_peerInfoTable setObject:v25 forKey:v43];
        [(GKList *)self->_peersAvailable addID:v43];
        [(GKSessionInternal *)self unlock];
        [(GKSessionInternal *)self delegate];
        if ((objc_opt_respondsToSelector() & 1) != 0
          || ([(GKSessionInternal *)self privateDelegate], (objc_opt_respondsToSelector() & 1) != 0))
        {
          id v40 = objc_alloc(NSDictionary);
          -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_peerDidBecomeAvailable_, objc_msgSend(v40, "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", v43), @"peerID", 0), 0);
        }
        goto LABEL_37;
      }
      *(_DWORD *)uint64_t v45 = 136316418;
      uint64_t v46 = v36;
      __int16 v47 = 2080;
      __int16 v48 = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
      __int16 v49 = 1024;
      int v50 = 3994;
      __int16 v51 = 2080;
      *(void *)uint32_t v52 = buf;
      *(_WORD *)&v52[8] = 1024;
      unsigned int v53 = v43;
      __int16 v54 = 1024;
      DNSServiceErrorType v55 = v35;
      uint64_t v31 = " [%s] %s:%d ** cannot query TXT record [%s]! no busy state updates for peer %u (error=%d)";
      uint64_t v32 = v37;
      uint32_t v33 = 50;
    }
    _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, v31, v45, v33);
    goto LABEL_30;
  }
LABEL_38:
  if (!a6) {
    [(GKSessionInternal *)self cleanupExAvailablePeers];
  }
}

- (void)didRemoveService:(const char *)a3 fromIF:(const char *)a4 withError:(int)a5 moreComing:(BOOL)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v30 = (id)0xAAAAAAAAAAAAAAAALL;
  unsigned int v29 = -1431655766;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  if (![(GKSessionInternal *)self parseServiceName:a3 intoDisplayName:&v30 pid:&v29 state:&v28])
  {
LABEL_27:
    if (!a6) {
      [(GKSessionInternal *)self cleanupExAvailablePeers];
    }
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = v29;
      BOOL v14 = [(GKList *)self->_peersForCleanup hasID:v29];
      *(_DWORD *)fd_set buf = 136316162;
      uint64_t v32 = v11;
      __int16 v33 = 2080;
      DNSServiceErrorType v34 = "-[GKSessionInternal didRemoveService:fromIF:withError:moreComing:]";
      __int16 v35 = 1024;
      int v36 = 4025;
      __int16 v37 = 1024;
      *(_DWORD *)uint64_t v38 = v13;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = v14;
      _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _peersForCleanup: contains %d ?= %d", buf, 0x28u);
    }
  }
  [(GKList *)self->_peersForCleanup removeID:v29];
  if ([(GKSessionInternal *)self filterService:a4 withPID:v29])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)fd_set buf = 136316418;
    uint64_t v32 = v15;
    __int16 v33 = 2080;
    DNSServiceErrorType v34 = "-[GKSessionInternal didRemoveService:fromIF:withError:moreComing:]";
    __int16 v35 = 1024;
    int v36 = 4029;
    __int16 v37 = 2080;
    *(void *)uint64_t v38 = a3;
    *(_WORD *)&v38[8] = 2080;
    uint64_t v39 = a4;
    __int16 v40 = 1024;
    int v41 = a5;
    uint64_t v17 = " [%s] %s:%d browse rejected: [%s] from [%s] (%d)";
    uint64_t v18 = v16;
    uint32_t v19 = 54;
LABEL_14:
    _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_15:

    return;
  }
  if (self->_mode == 2 && v29 == self->_pid)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)fd_set buf = 136315650;
    uint64_t v32 = v20;
    __int16 v33 = 2080;
    DNSServiceErrorType v34 = "-[GKSessionInternal didRemoveService:fromIF:withError:moreComing:]";
    __int16 v35 = 1024;
    int v36 = 4035;
    uint64_t v17 = " [%s] %s:%d didRemove: skipping self";
    uint64_t v18 = v21;
    uint32_t v19 = 28;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v24 = v29;
      BOOL v25 = [(GKList *)self->_peersConnected hasID:v29];
      *(_DWORD *)fd_set buf = 136316162;
      uint64_t v32 = v22;
      __int16 v33 = 2080;
      DNSServiceErrorType v34 = "-[GKSessionInternal didRemoveService:fromIF:withError:moreComing:]";
      __int16 v35 = 1024;
      int v36 = 4041;
      __int16 v37 = 1024;
      *(_DWORD *)uint64_t v38 = v24;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = v25;
      _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Peer [%d] removed? (%d).\n", buf, 0x28u);
    }
  }

  id v26 = [(GKTable *)self->_peerInfoTable objectForKey:v29];
  objc_msgSend(v26, "setServiceCount:", objc_msgSend(v26, "serviceCount") - 1);
  if ((int)[v26 serviceCount] <= 0)
  {
    [(GKList *)self->_peersAvailable removeID:v29];
    if (v26
      && ![(GKList *)self->_peersConnected hasID:v29]
      && ![(GKList *)self->_peersPendingOutgoingInvitation hasID:v29])
    {
      [(GKTable *)self->_peerInfoTable removeObjectForKey:v29];
    }
    [(GKSessionInternal *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      || ([(GKSessionInternal *)self privateDelegate], (objc_opt_respondsToSelector() & 1) != 0))
    {
      id v27 = objc_alloc(NSDictionary);
      -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_peerDidBecomeUnavailable_, objc_msgSend(v27, "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", v29), @"peerID", 0), 0);
    }
    goto LABEL_27;
  }
}

- (void)browse
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  [(GKSessionInternal *)self lock];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)fd_set buf = 136315650;
        uint64_t v31 = v3;
        __int16 v32 = 2080;
        __int16 v33 = "-[GKSessionInternal browse]";
        __int16 v34 = 1024;
        int v35 = 4124;
        __int16 v5 = " [%s] %s:%d cannot browse after reset";
LABEL_9:
        _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
      }
    }
  }
  else if ([(GKSessionInternal *)self checkDNSConnection])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)fd_set buf = 136315650;
        uint64_t v31 = v6;
        __int16 v32 = 2080;
        __int16 v33 = "-[GKSessionInternal browse]";
        __int16 v34 = 1024;
        int v35 = 4131;
        __int16 v5 = " [%s] %s:%d dns connection not initialized";
        goto LABEL_9;
      }
    }
  }
  else
  {
    if (self->_serviceBrowser)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          serviceBrowser = self->_serviceBrowser;
          *(_DWORD *)fd_set buf = 136315906;
          uint64_t v31 = v7;
          __int16 v32 = 2080;
          __int16 v33 = "-[GKSessionInternal browse]";
          __int16 v34 = 1024;
          int v35 = 4137;
          __int16 v36 = 1024;
          LODWORD(v37) = serviceBrowser;
          _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X) -- was already browsing?  closing old service...", buf, 0x22u);
        }
      }
      DNSServiceRefDeallocate(self->_serviceBrowser);
      [(GKList *)self->_peersForCleanup addIDsFromList:self->_peersAvailable];
      [(GKList *)self->_peersAvailable removeAllIDs];
    }
    self->_serviceBrowser = self->_dnsServiceConnection;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [(NSString *)self->serviceType UTF8String];
        *(_DWORD *)fd_set buf = 136315906;
        uint64_t v31 = v10;
        __int16 v32 = 2080;
        __int16 v33 = "-[GKSessionInternal browse]";
        __int16 v34 = 1024;
        int v35 = 4146;
        __int16 v36 = 2080;
        uint64_t v37 = (uint64_t)v12;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceBrowse() (servicetype=%s)", buf, 0x26u);
      }
    }
    DNSServiceErrorType v13 = DNSServiceBrowse(&self->_serviceBrowser, 0x24800u, 0, [(NSString *)self->serviceType UTF8String], "local.", (DNSServiceBrowseReply)gkBrowseCallback, self);
    if (v13)
    {
      DNSServiceErrorType v14 = v13;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)fd_set buf = 136315906;
          uint64_t v31 = v15;
          __int16 v32 = 2080;
          __int16 v33 = "-[GKSessionInternal browse]";
          __int16 v34 = 1024;
          int v35 = 4153;
          __int16 v36 = 1024;
          LODWORD(v37) = v14;
          _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d browse failed: %d", buf, 0x22u);
        }
      }
      self->_serviceBrowser = 0;
      if (self->_mode == 2 && self->_service)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          uint64_t v18 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            service = self->_service;
            *(_DWORD *)fd_set buf = 136315906;
            uint64_t v31 = v17;
            __int16 v32 = 2080;
            __int16 v33 = "-[GKSessionInternal browse]";
            __int16 v34 = 1024;
            int v35 = 4157;
            __int16 v36 = 1024;
            LODWORD(v37) = service;
            _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_service) (%08X)", buf, 0x22u);
          }
        }
        DNSServiceRefDeallocate(self->_service);
        self->_service = 0;
      }
      if (self->_sessionStarted)
      {
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.gamekit.GKSessionErrorDomain" code:v14 userInfo:0];
        __int16 v21 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v20, @"NSError", 0);
        [(GKSessionInternal *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [(GKSessionInternal *)self performSelectorOnMainThread:sel_tellDelegate_sessionDidFailWithError_ withObject:v21 waitUntilDone:0];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          uint64_t v23 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [v20 localizedDescription];
            *(_DWORD *)fd_set buf = 136315906;
            uint64_t v31 = v22;
            __int16 v32 = 2080;
            __int16 v33 = "-[GKSessionInternal browse]";
            __int16 v34 = 1024;
            int v35 = 4167;
            __int16 v36 = 2112;
            uint64_t v37 = v24;
            _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error: %@.", buf, 0x26u);
          }
        }

        self->_BOOL sessionStarted = 0;
        self->_stopHandlingEvents = 1;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v25 = VRTraceErrorLogLevelToCSTR();
          id v26 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)fd_set buf = 136315650;
            uint64_t v31 = v25;
            __int16 v32 = 2080;
            __int16 v33 = "-[GKSessionInternal browse]";
            __int16 v34 = 1024;
            int v35 = 4175;
            _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving ALL: browse error", buf, 0x1Cu);
          }
        }
        [(GKSessionInternal *)self stopResolvingAllPeers];
      }
    }
    else if (!self->_handleEventsRunning)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        id v28 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v29 = [(GKSessionInternal *)self retainCount];
          *(_DWORD *)fd_set buf = 136315906;
          uint64_t v31 = v27;
          __int16 v32 = 2080;
          __int16 v33 = "-[GKSessionInternal browse]";
          __int16 v34 = 1024;
          int v35 = 4183;
          __int16 v36 = 1024;
          LODWORD(v37) = v29;
          _os_log_impl(&dword_221563000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start handleEvents (%d)", buf, 0x22u);
        }
      }
      [MEMORY[0x263F08B88] detachNewThreadSelector:sel_handleEvents toTarget:self withObject:0];
      *(_WORD *)&self->_handleEventsRunning = 1;
    }
  }
  [(GKSessionInternal *)self unlock];
}

- (BOOL)tryConnectToPeer:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v15 = -1431655766;
  memset(v14, 170, sizeof(v14));
  if ([a3 usableAddrs])
  {
    [a3 removeAndReturnLookupList:&v14[2] andAddrList:&v14[1] andInterfaceList:v14 count:&v15];
    if (v15)
    {
      uint64_t v4 = malloc_type_malloc(8 * v15, 0x2004093837F09uLL);
      if (v15 >= 1)
      {
        uint64_t v5 = 0;
        int v6 = 0;
        do
        {
          DNSServiceRefDeallocate(*(DNSServiceRef *)(v14[2] + 8 * v5));
          uint64_t v7 = v14[1];
          if (*(void *)(v14[1] + 8 * v5))
          {
            *(_DWORD *)(v14[0] + 4 * v6) = *(_DWORD *)(v14[0] + 4 * v5);
            v4[v6++] = [*(id *)(v7 + 8 * v5) bytes];
          }
          ++v5;
        }
        while (v5 < v15);
      }
      [a3 pid];
      [a3 connectTimeout];
      GCKSessionConnectToLocalService();
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      DNSServiceErrorType v13 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)fd_set buf = 136315650;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        uint32_t v19 = "-[GKSessionInternal tryConnectToPeer:]";
        __int16 v20 = 1024;
        int v21 = 4209;
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d no usable addresses - wait for more", buf, 0x1Cu);
      }
    }
    +[GKPeerInternal freeLookupList:v14[2] andAddrList:v14[1] andInterfaceList:v14[0] count:v15];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v10) {
      return result;
    }
    *(_DWORD *)fd_set buf = 136315650;
    uint64_t v17 = v8;
    __int16 v18 = 2080;
    uint32_t v19 = "-[GKSessionInternal tryConnectToPeer:]";
    __int16 v20 = 1024;
    int v21 = 4201;
    _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d no usable addresses - wait for more", buf, 0x1Cu);
  }
  return 0;
}

- (void)didLookupHostname:(_DNSServiceRef_t *)a3 forPeer:(id)a4 hostName:(const char *)a5 address:(const sockaddr_in *)a6 interface:(unsigned int)a7 withError:(int)a8 moreComing:(BOOL)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v44 = *MEMORY[0x263EF8340];
  in_addr_t s_addr = a6->sin_addr.s_addr;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = bswap32(s_addr);
      *(_DWORD *)fd_set buf = 136317698;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      uint64_t v27 = "-[GKSessionInternal didLookupHostname:forPeer:hostName:address:interface:withError:moreComing:]";
      __int16 v28 = 1024;
      int v29 = 4275;
      __int16 v30 = 1024;
      *(_DWORD *)uint64_t v31 = a3;
      *(_WORD *)&v31[4] = 2080;
      *(void *)&v31[6] = a5;
      __int16 v32 = 1024;
      unsigned int v33 = HIBYTE(v18);
      __int16 v34 = 1024;
      int v35 = BYTE2(v18);
      __int16 v36 = 1024;
      int v37 = BYTE1(v18);
      __int16 v38 = 1024;
      int v39 = v18;
      __int16 v40 = 1024;
      int v41 = a8;
      __int16 v42 = 1024;
      BOOL v43 = a9;
      _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** %08x ** host[%s] lookup: %u.%u.%u.%u (%d) (more? %d)", buf, 0x50u);
    }
  }
  if (!a8)
  {
    id v19 = a4;
    if ([a4 containsLookupService:a3])
    {
      [a4 setAddr:a6 interface:v10 forLookupService:a3];
      if (!a9)
      {
        if ([(GKSessionInternal *)self tryConnectToPeer:a4])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v20 = VRTraceErrorLogLevelToCSTR();
            int v21 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if (v19) {
                uint64_t v22 = [v19 displayName];
              }
              else {
                uint64_t v22 = 0;
              }
              *(_DWORD *)fd_set buf = 136315906;
              uint64_t v25 = v20;
              __int16 v26 = 2080;
              uint64_t v27 = "-[GKSessionInternal didLookupHostname:forPeer:hostName:address:interface:withError:moreComing:]";
              __int16 v28 = 1024;
              int v29 = 4300;
              __int16 v30 = 2112;
              *(void *)uint64_t v31 = v22;
              _os_log_impl(&dword_221563000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stop resolving: %@ invitation started from getaddrinfo callback", buf, 0x26u);
            }
          }
          [v19 stopResolving];
        }
      }
    }
  }
}

- (void)didResolveService:(_DNSServiceRef_t *)a3 forPeer:(id)a4 hostName:(const char *)a5 port:(unsigned __int16)a6 interface:(unsigned int)a7 txtLen:(unsigned __int16)a8 txtRecord:(const void *)a9 withError:(int)a10 moreComing:(BOOL)a11
{
  uint64_t v11 = a8;
  unsigned int v47 = a6;
  uint64_t v62 = *MEMORY[0x263EF8340];
  memset(v61, 170, sizeof(v61));
  if (!if_indextoname(a7, v61)) {
    v61[0] = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)fd_set buf = 136316674;
      uint64_t v50 = v16;
      __int16 v51 = 2080;
      uint32_t v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
      __int16 v53 = 1024;
      int v54 = 4340;
      __int16 v55 = 1024;
      *(_DWORD *)int v56 = a3;
      *(_WORD *)&v56[4] = 1024;
      *(_DWORD *)&v56[6] = a7;
      __int16 v57 = 2080;
      uint64_t v58 = v61;
      __int16 v59 = 1024;
      BOOL v60 = a11;
      _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didResolveService: %x from %d [%s] (more? %d)", buf, 0x38u);
    }
  }
  if (a10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    {
LABEL_15:
      int v20 = 0;
      goto LABEL_17;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    id v19 = *MEMORY[0x263F21098];
    int v20 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)fd_set buf = 136315906;
      uint64_t v50 = v18;
      __int16 v51 = 2080;
      uint32_t v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
      __int16 v53 = 1024;
      int v54 = 4344;
      __int16 v55 = 1024;
      *(_DWORD *)int v56 = a10;
      int v21 = " [%s] %s:%d Bonjour resolve error: %d";
      uint64_t v22 = v19;
      uint32_t v23 = 34;
LABEL_14:
      _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      goto LABEL_15;
    }
  }
  else
  {
    if (!-[GKSessionInternal filterService:withPID:](self, "filterService:withPID:", v61, [a4 pid]))
    {
      int v20 = 1;
      goto LABEL_17;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    uint64_t v25 = *MEMORY[0x263F21098];
    int v20 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)fd_set buf = 136315906;
      uint64_t v50 = v24;
      __int16 v51 = 2080;
      uint32_t v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
      __int16 v53 = 1024;
      int v54 = 4347;
      __int16 v55 = 2080;
      *(void *)int v56 = v61;
      int v21 = " [%s] %s:%d resolved to [%s] - skipping";
      uint64_t v22 = v25;
      uint32_t v23 = 38;
      goto LABEL_14;
    }
  }
LABEL_17:
  [(GKSessionInternal *)self processTXTRecordForPeer:a4 txtLen:v11 txtRecord:a9];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    uint64_t v27 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v28 = [a4 pid];
      int v29 = [a4 resolveService];
      *(_DWORD *)fd_set buf = 136316418;
      uint64_t v50 = v26;
      __int16 v51 = 2080;
      uint32_t v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
      __int16 v53 = 1024;
      int v54 = 4355;
      __int16 v55 = 1024;
      *(_DWORD *)int v56 = v28;
      *(_WORD *)&v56[4] = 1024;
      *(_DWORD *)&v56[6] = v29;
      __int16 v57 = 1024;
      LODWORD(v58) = a3;
      _os_log_impl(&dword_221563000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d resolve check peer %d service %08x == %08x?", buf, 0x2Eu);
    }
  }
  if ((_DNSServiceRef_t *)[a4 resolveService] == a3)
  {
    [a4 setServicePort:v47];
    if (v20)
    {
      if ([(GKSessionInternal *)self checkDNSConnection])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          uint64_t v31 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)fd_set buf = 136315650;
            uint64_t v50 = v30;
            __int16 v51 = 2080;
            uint32_t v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
            __int16 v53 = 1024;
            int v54 = 4380;
            __int16 v32 = " [%s] %s:%d Lookup: Unable to use DNS connection!";
            unsigned int v33 = v31;
            uint32_t v34 = 28;
LABEL_33:
            _os_log_impl(&dword_221563000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
          }
        }
      }
      else
      {
        DNSServiceRef sdRef = self->_dnsServiceResolveConnection;
        DNSServiceErrorType AddrInfo = DNSServiceGetAddrInfo(&sdRef, 0x24000u, a7, 1u, a5, (DNSServiceGetAddrInfoReply)hostnameLookupCallback, a4);
        if (AddrInfo)
        {
          DNSServiceErrorType v36 = AddrInfo;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v37 = VRTraceErrorLogLevelToCSTR();
            __int16 v38 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)fd_set buf = 136315906;
              uint64_t v50 = v37;
              __int16 v51 = 2080;
              uint32_t v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
              __int16 v53 = 1024;
              int v54 = 4377;
              __int16 v55 = 1024;
              *(_DWORD *)int v56 = v36;
              __int16 v32 = " [%s] %s:%d hostname lookup failed (%d)";
              unsigned int v33 = v38;
              uint32_t v34 = 34;
              goto LABEL_33;
            }
          }
        }
        else
        {
          [a4 addLookup:sdRef];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v39 = VRTraceErrorLogLevelToCSTR();
            __int16 v40 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v41 = (int)sdRef;
              int v42 = [a4 resolveService];
              *(_DWORD *)fd_set buf = 136316162;
              uint64_t v50 = v39;
              __int16 v51 = 2080;
              uint32_t v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
              __int16 v53 = 1024;
              int v54 = 4375;
              __int16 v55 = 1024;
              *(_DWORD *)int v56 = v41;
              *(_WORD *)&v56[4] = 1024;
              *(_DWORD *)&v56[6] = v42;
              __int16 v32 = " [%s] %s:%d hostname lookup service %08X shares from %08X";
              unsigned int v33 = v40;
              uint32_t v34 = 40;
              goto LABEL_33;
            }
          }
        }
      }
    }
    if (!a11 && [(GKSessionInternal *)self tryConnectToPeer:a4])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v43 = VRTraceErrorLogLevelToCSTR();
        uint64_t v44 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          if (a4) {
            uint64_t v45 = [a4 displayName];
          }
          else {
            uint64_t v45 = 0;
          }
          *(_DWORD *)fd_set buf = 136315906;
          uint64_t v50 = v43;
          __int16 v51 = 2080;
          uint32_t v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
          __int16 v53 = 1024;
          int v54 = 4386;
          __int16 v55 = 2112;
          *(void *)int v56 = v45;
          _os_log_impl(&dword_221563000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stop resolving: %@ invitation started from resolve callback", buf, 0x26u);
        }
      }
      [a4 stopResolving];
    }
  }
}

- (id)stringForGCKID:(unsigned int)a3
{
  return [(GKAutoPeerIDTable *)self->_peerIDTable objectForKey:*(void *)&a3];
}

- (id)voiceChatSessionListener
{
  return self->_voiceChatListener;
}

- (NSString)peerID
{
  return (NSString *)[(GKAutoPeerIDTable *)self->_peerIDTable objectForKey:self->_pid];
}

- (NSArray)connectedPeerIDs
{
  return (NSArray *)[(GKSessionInternal *)self peersWithConnectionState:2];
}

- (BOOL)sendVoiceChatData:(id)a3 toPeers:(id)a4 error:(id *)a5
{
  return [(GKSessionInternal *)self sendData:a3 toPeers:a4 withDataMode:0 enableOOB:1 error:a5];
}

- (NSString)domain
{
  return self->domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)serviceType
{
  return self->serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (unint64_t)maxPeers
{
  return self->maxPeers;
}

- (void)setMaxPeers:(unint64_t)a3
{
  self->unint64_t maxPeers = a3;
}

- (OpaqueGCKSession)sessionRef
{
  return self->sessionRef;
}

- (void)setSessionRef:(OpaqueGCKSession *)a3
{
  self->sessionRef = a3;
}

- (OpaqueAGPSession)agpSessionRef
{
  return self->agpSessionRef;
}

- (void)setAgpSessionRef:(OpaqueAGPSession *)a3
{
  self->agpSessionRef = a3;
}

- (unint64_t)port
{
  return self->_port;
}

- (void)setPort:(unint64_t)a3
{
  self->_port = a3;
}

- (NSString)sessionID
{
  return self->sessionID;
}

- (unsigned)sessionMode
{
  return self->_mode;
}

- (GKConnection)connection
{
  return (GKConnection *)objc_getProperty(self, a2, 80, 1);
}

- (void)initWithConnection:session:delegate:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Error in GCKSessionSetEventCallback. *", v2, v3, v4, v5, v6);
}

- (void)initWithConnection:session:delegate:.cold.2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Error in AGPSessionCreate. *", v2, v3, v4, v5, v6);
}

- (void)initWithConnection:session:delegate:.cold.3()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Error in GCKSessionCreate. *", v2, v3, v4, v5, v6);
}

- (void)initWithSessionID:displayName:session:sessionMode:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Error in AGPSessionCreate.", v2, v3, v4, v5, v6);
}

- (void)initWithSessionID:displayName:session:sessionMode:.cold.2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Error in GCKSessionCreate.", v2, v3, v4, v5, v6);
}

- (void)displayNameForPeer:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  int v3 = 2737;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_221563000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d displayNameForPeer: %@ not found", v2, 0x26u);
}

- (void)cancelConnectToPeer:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot cancel after reset", v2, v3, v4, v5, v6);
}

- (void)acceptConnectionFromPeer:error:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot accept after reset", v2, v3, v4, v5, v6);
}

- (void)denyConnectionFromPeer:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot deny after reset", v2, v3, v4, v5, v6);
}

@end