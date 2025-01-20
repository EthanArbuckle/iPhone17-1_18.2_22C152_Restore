@interface GKConnectionInternal
- (BOOL)convertParticipantID:(id)a3 toPeerID:(id *)a4;
- (BOOL)convertPeerID:(id)a3 toParticipantID:(id *)a4;
- (BOOL)localGamingCheckEstablishConnection:(id)a3 connectionData:(id)a4;
- (BOOL)shouldWeInitiateRelayWithPID:(unsigned int)a3;
- (BOOL)startListeningForLocalGamingCDX;
- (CDXClient)cdxClient;
- (GKConnectionInternal)initWithParticipantID:(id)a3;
- (NSMutableDictionary)cdxSessions;
- (NSMutableDictionary)pidToConnectTimeoutSource;
- (OpaqueGCKSession)gckSession;
- (id)asyncWorkQueue;
- (id)createInitiateRelayDictionaryForParticipant:(id)a3 remotePeerID:(id)a4;
- (id)createInsecureTicketUsingSortedConnectionsFromList:(id)a3;
- (id)eventDelegate;
- (id)extractBlobUsingData:(id)a3 withSourcePID:(unsigned int)a4 destPID:(unsigned int)a5;
- (id)getLocalConnectionDataForLocalGaming;
- (id)networkStatistics;
- (id)networkStatisticsDictionaryForGCKStats:(void *)a3;
- (id)newRelayUpdateDictionaryForParticipant:(id)a3 didInitiate:(BOOL)a4;
- (id)timerQueue;
- (opaqueRTCReporting)reportingAgent;
- (unsigned)gckPID;
- (void)CDXClient:(id)a3 error:(id)a4;
- (void)CDXClient:(id)a3 preblob:(id)a4;
- (void)CDXClientSession:(id)a3 receivedData:(id)a4 from:(int64_t)a5;
- (void)addEvent:(id *)a3 remotePeer:(unsigned int)a4;
- (void)cancelConnectParticipant:(id)a3;
- (void)connectParticipantsWithConnectionData:(id)a3 withSessionInfo:(id)a4;
- (void)connectPendingConnectionsFromList:(id)a3 sessionInfo:(id)a4;
- (void)dealloc;
- (void)doRelayCheckForRemotePeerID:(id)a3;
- (void)eventDelegate;
- (void)gckPID;
- (void)getLocalConnectionDataForLocalGaming;
- (void)getLocalConnectionDataWithCompletionHandler:(id)a3;
- (void)initiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6;
- (void)internalInitiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6;
- (void)internalUpdateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6;
- (void)internal_setRemoteConnectionData:(id)a3 fromParticipantID:(id)a4 pendingConnectionPIDList:(id)a5;
- (void)localGamingReceiveDataHandler:(id)a3 data:(id)a4 time:(double)a5 error:(id)a6;
- (void)preRelease;
- (void)setCdxClient:(id)a3;
- (void)setCdxSessions:(id)a3;
- (void)setEventDelegate:(id)a3;
- (void)setParticipantID:(id)a3 forPeerID:(id)a4;
- (void)setPidToConnectTimeoutSource:(id)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)startListeningForLocalGamingCDX;
- (void)updateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6;
@end

@implementation GKConnectionInternal

- (GKConnectionInternal)initWithParticipantID:(id)a3
{
  VRTraceReset();
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"GKVerboseLogging", @"com.apple.gamekit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    VRTraceSetErrorLogLevel();
  }
  v11.receiver = self;
  v11.super_class = (Class)GKConnectionInternal;
  v7 = [(GKConnectionInternal *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_cdxSessions = 0;
    *(void *)&v7->_gckPID = a3;
    *(&v8->super._pid + 1) = GCKSessionCreateUniqueID();
    if (GCKSessionCreate(0))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          -[GKConnectionInternal initWithParticipantID:]();
        }
      }
      return 0;
    }
    else
    {
      LODWORD(v8->_updateRelayQueue) = 0;
      v8->_gckSession = (OpaqueGCKSession *)objc_alloc_init(MEMORY[0x263EFF980]);
      GCKSessionSetLocalName((uint64_t)v8->_pidGUID, [a3 UTF8String], objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4));
      pthread_mutex_init((pthread_mutex_t *)&v8->_preblobCallbackCancelTime, 0);
      pthread_cond_init((pthread_cond_t *)&v8->_xPreblobFetch.__opaque[48], 0);
      pthread_mutex_init((pthread_mutex_t *)&v8->_cPreblobFetch.__opaque[32], 0);
      pthread_cond_init((pthread_cond_t *)&v8->_xPrepareThread.__opaque[48], 0);
      pthread_mutex_init((pthread_mutex_t *)&v8->_pidToConnectTimeoutSource, 0);
      *(void *)&v8->_wakeTime = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_pidToPreblobMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_preblobToPIDMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_pidToConnectionDataMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF980]);
      v8->_allowRelayPIDList = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      *(void *)&v8->_xRelay.__opaque[48] = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_pidToRelayConnectionDataMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_pidToRelayInitiateInfoMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_pidToRelayUpdateInfoMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_initRelayQueue = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      *(void *)&v8->_fAllowMoreRelay = objc_alloc_init(MEMORY[0x263EFF980]);
      if (+[GKConnection isRelayEnabled]) {
        LOBYTE(v8->_pendingConnectionPIDList) = 1;
      }
      v8->_localGamingCDXListenSource = (OS_dispatch_source *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_localGamingSocketToPIDMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8->_localGamingSocketToConnectionDataMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      -[NSMutableArray setObject:forKeyedSubscript:](v8->_allowRelayPIDList, "setObject:forKeyedSubscript:", a3, objc_msgSend(NSString, "stringWithFormat:", @"%d", *(&v8->super._pid + 1)));
      -[GKConnectionInternal setCdxSessions:](v8, "setCdxSessions:", [MEMORY[0x263EFF9A0] dictionary]);
      CFAllocatorRef v9 = CFGetAllocator(v8);
      v8->_pidToPlayerIDMap = (NSMutableDictionary *)CFDictionaryCreateMutable(v9, 0, MEMORY[0x263EFFF88], &dispatch_value_callbacks);
      if ([off_2645B7A10 getAddressForService:*(void *)off_2645B7910]) {
        [(GKConnectionInternal *)v8 setCdxClient:[[CDXClient alloc] initWithOptions:0 delegate:v8]];
      }
      HIDWORD(v8->_updateRelayQueue) = -1;
      v8->_reportingAgent = (opaqueRTCReporting *)objc_alloc_init(MEMORY[0x263F21070]);
    }
  }
  return v8;
}

- (void)preRelease
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x263F21098];
    BOOL v6 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          v7 = "<nil>";
        }
        int v9 = 136316162;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        v12 = "-[GKConnectionInternal preRelease]";
        __int16 v13 = 1024;
        int v14 = 512;
        __int16 v15 = 2080;
        v16 = v7;
        __int16 v17 = 2080;
        Name = sel_getName(a2);
        _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d -[%s %s]", (uint8_t *)&v9, 0x30u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      if (objc_opt_class()) {
        v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        v8 = "<nil>";
      }
      int v9 = 136316162;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      v12 = "-[GKConnectionInternal preRelease]";
      __int16 v13 = 1024;
      int v14 = 512;
      __int16 v15 = 2080;
      v16 = v8;
      __int16 v17 = 2080;
      Name = sel_getName(a2);
      _os_log_debug_impl(&dword_221563000, v5, OS_LOG_TYPE_DEBUG, " [%s] %s:%d -[%s %s]", (uint8_t *)&v9, 0x30u);
    }
  }
  LODWORD(self->_updateRelayQueue) = 1;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a2 + 24) UTF8String];
  int v8 = 136316162;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  int v10 = 517;
  __int16 v11 = 2048;
  uint64_t v12 = a2;
  __int16 v13 = v6;
  uint64_t v14 = v7;
  _os_log_debug_impl(&dword_221563000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKConnectionInternal(%p) -dealloc (localParticipant: %s)", (uint8_t *)&v8, 0x30u);
}

- (id)timerQueue
{
  return (id)MEMORY[0x263EF83A0];
}

- (id)asyncWorkQueue
{
  return dispatch_get_global_queue(0, 0);
}

- (void)getLocalConnectionDataWithCompletionHandler:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  TimingLog(3, 1, (uint64_t)"Getting local connection data");
  perfTimerStart();
  p_preblobCallbackCancelTime = &self->_preblobCallbackCancelTime;
  pthread_mutex_lock((pthread_mutex_t *)&self->_preblobCallbackCancelTime);
  if (self->_preblob)
  {
    __int16 v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08338];
    v31[0] = @"Previous getLocalConnectionData not completed yet";
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    int v8 = v6;
    uint64_t v9 = 510;
LABEL_3:
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, [v8 errorWithDomain:@"GKConnection" code:v9 userInfo:v7]);
    goto LABEL_17;
  }
  if (![(GKConnectionInternal *)self cdxClient])
  {
    if (![off_2645B7A10 getAddressForService:*(void *)off_2645B7910])
    {
      __int16 v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08338];
      v29 = @"CDX settings are not set";
      uint64_t v7 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      int v8 = v17;
      uint64_t v9 = 509;
      goto LABEL_3;
    }
    [(GKConnectionInternal *)self setCdxClient:[[CDXClient alloc] initWithOptions:0 delegate:self]];
  }
  if (self->_cdxSessions)
  {
    unsigned int v19 = bswap32(*(&self->super._pid + 1));
    int v10 = (void *)[MEMORY[0x263EFF990] dataWithBytes:&v19 length:4];
    [v10 appendData:self->_cdxSessions];
    TimingLog(3, 0, (uint64_t)"Got local connection data - passing data to app");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x263F21098];
      __int16 v13 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v10 length];
          *(_DWORD *)buf = 136315906;
          uint64_t v21 = v11;
          __int16 v22 = 2080;
          v23 = "-[GKConnectionInternal getLocalConnectionDataWithCompletionHandler:]";
          __int16 v24 = 1024;
          int v25 = 609;
          __int16 v26 = 2048;
          uint64_t v27 = v14;
          _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got local connection data size=%lu", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[GKConnectionInternal getLocalConnectionDataWithCompletionHandler:](v11, v10);
      }
    }
    (*((void (**)(id, void *, void))a3 + 2))(a3, v10, 0);
    TimingLog(3, 0, (uint64_t)"Got local connection data - done");
    perfTimerStop();
  }
  else
  {
    self->_preblob = (NSData *)[a3 copy];
    *(double *)&self->_preblobCallback = micro() + 60.0;
    dispatch_time_t v15 = dispatch_time(0, 60000000000);
    v16 = [(GKConnectionInternal *)self asyncWorkQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__GKConnectionInternal_getLocalConnectionDataWithCompletionHandler___block_invoke;
    v18[3] = &unk_2645B7C20;
    v18[4] = self;
    dispatch_after(v15, v16, v18);
  }
LABEL_17:
  pthread_mutex_unlock((pthread_mutex_t *)p_preblobCallbackCancelTime);
}

uint64_t __68__GKConnectionInternal_getLocalConnectionDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 96));
  double v2 = micro();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 80) && v2 > *(double *)(v3 + 88))
  {
    TimingLog(3, 0, (uint64_t)"Got local connection data - timeout");
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
    uint64_t v6 = *MEMORY[0x263F08338];
    v7[0] = @"getLocalConnectionData timed out";
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKConnection", 503, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));

    *(void *)(*(void *)(a1 + 32) + 80) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(v3 + 96));
}

- (void)connectPendingConnectionsFromList:(id)a3 sessionInfo:(id)a4
{
  v67[2] = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [a3 count];
      int v10 = *(&self->super._pid + 1);
      int v11 = [(NSMutableDictionary *)self->_preblobToPIDMap count];
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v57 = 2080;
      v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
      __int16 v59 = 1024;
      int v60 = 646;
      __int16 v61 = 1024;
      *(_DWORD *)v62 = v9;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = v10;
      __int16 v63 = 1024;
      LODWORD(v64[0]) = v11;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectPendingConnections: connecting %d (from %u) (_pidToPreblobMap: %d)", buf, 0x2Eu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() > 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x263F21098];
    uint64_t v14 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v57 = 2080;
        v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
        __int16 v59 = 1024;
        int v60 = 648;
        __int16 v61 = 2080;
        *(void *)v62 = v15;
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectPendingConnections: sessionInfo: %s", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:](v12, a4);
    }
  }
  if (![a3 count]) {
    goto LABEL_52;
  }
  v16 = (void *)[MEMORY[0x263EFF980] arrayWithArray:a3];
  objc_msgSend(v16, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(&self->super._pid + 1)));
  id obj = v16;
  [v16 sortUsingSelector:sel_compare_];
  __int16 v17 = (void *)[a4 objectForKeyedSubscript:@"GKSSessionTicket"];
  uint64_t v18 = [a4 objectForKeyedSubscript:@"GKSSessionToken"];
  if ((int)*MEMORY[0x263F21080] > 6 || *MEMORY[0x263F21090] != 0)
  {
    *(void *)buf = [a3 count];
    VRTraceVariable_();
  }
  if (!v17) {
    goto LABEL_27;
  }
  self;
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v17 CDXTicketWellFormed] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      __int16 v26 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_msgSend((id)objc_msgSend(v17, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v25;
        __int16 v57 = 2080;
        v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
        __int16 v59 = 1024;
        int v60 = 667;
        __int16 v61 = 2080;
        *(void *)v62 = v27;
        _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Malformed GKSSessionTicketData in sessionInfo! %s", buf, 0x26u);
      }
    }
    goto LABEL_26;
  }
  uint64_t v20 = [v17 CDXTicketPCNT];
  if (v20 != [v16 count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        int v23 = [v17 CDXTicketPCNT];
        int v24 = [v16 count];
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v21;
        __int16 v57 = 2080;
        v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
        __int16 v59 = 1024;
        int v60 = 670;
        __int16 v61 = 1024;
        *(_DWORD *)v62 = v23;
        *(_WORD *)&v62[4] = 1024;
        *(_DWORD *)&v62[6] = v24;
        _os_log_error_impl(&dword_221563000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d CDX PCNT Mismatch! [cdxTicket CDXTicketPCNT] = %d, [connectionPIDList count] = %d", buf, 0x28u);
      }
    }
LABEL_26:
    __int16 v17 = 0;
  }
LABEL_27:
  id v28 = (id)[v17 CDXTicketTrimmed];
  if (v18)
  {
    self;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        uint64_t v30 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = objc_msgSend((id)objc_msgSend(v28, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v29;
          __int16 v57 = 2080;
          v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
          __int16 v59 = 1024;
          int v60 = 680;
          __int16 v61 = 2080;
          *(void *)v62 = v31;
          _os_log_impl(&dword_221563000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Malformed GKSSessionTokenData in sessionInfo! %s", buf, 0x26u);
        }
      }
      uint64_t v18 = 0;
    }
  }
  if (!v28)
  {
    id v28 = [(GKConnectionInternal *)self createInsecureTicketUsingSortedConnectionsFromList:v16];
    if (!v28) {
      goto LABEL_53;
    }
  }
  id v32 = [(CDXClient *)[(GKConnectionInternal *)self cdxClient] createSessionWithTicket:v28 sessionKey:v18];
  [v32 setDelegate:self];
  if (!v32)
  {
LABEL_52:
    id v28 = 0;
LABEL_53:
    v43 = 0;
    goto LABEL_51;
  }
  v66[0] = @"cdxClientSession";
  v66[1] = @"connectionPIDList";
  v67[0] = v32;
  v67[1] = obj;
  v50 = v28;
  -[NSMutableDictionary setObject:forKey:](-[GKConnectionInternal cdxSessions](self, "cdxSessions"), "setObject:forKey:", [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2], objc_msgSend(v28, "valueForKey:", @"CDXTicketSID"));
  id v28 = objc_alloc_init(MEMORY[0x263EFF990]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v53 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        v38 = (void *)[(NSMutableDictionary *)self->_pidToPreblobMap objectForKeyedSubscript:v37];
        if ([v38 length])
        {
          [v28 appendData:v38];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v39 = VRTraceErrorLogLevelToCSTR();
            v40 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v41 = [v38 length];
              int v42 = [v28 length];
              *(_DWORD *)buf = 136316418;
              *(void *)&uint8_t buf[4] = v39;
              __int16 v57 = 2080;
              v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
              __int16 v59 = 1024;
              int v60 = 712;
              __int16 v61 = 1024;
              *(_DWORD *)v62 = v41;
              *(_WORD *)&v62[4] = 1024;
              *(_DWORD *)&v62[6] = v42;
              __int16 v63 = 2112;
              v64[0] = v37;
              _os_log_impl(&dword_221563000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d appending nextBlob=%d => combined=%d=, for pid=%@", buf, 0x32u);
            }
          }
          perfTimerStart();
          reportingGKLog();
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v34);
  }
  TimingLog(3, 0, (uint64_t)"starting CDX");
  v43 = v32;
  [v32 sendData:v28];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v46 = [v50 length];
      int v47 = [v28 length];
      int v48 = [obj count];
      int v49 = [(NSMutableDictionary *)self->_pidToPreblobMap count];
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v44;
      __int16 v57 = 2080;
      v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
      __int16 v59 = 1024;
      int v60 = 733;
      __int16 v61 = 1024;
      *(_DWORD *)v62 = v46;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = v47;
      __int16 v63 = 1024;
      LODWORD(v64[0]) = v48;
      WORD2(v64[0]) = 1024;
      *(_DWORD *)((char *)v64 + 6) = v49;
      _os_log_impl(&dword_221563000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting CDX: ticket(%d) and data(%d) from %d preblobs (%d total CDs)", buf, 0x34u);
    }
  }
LABEL_51:
}

- (BOOL)shouldWeInitiateRelayWithPID:(unsigned int)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  memset(md, 170, sizeof(md));
  memset(v26, 170, sizeof(v26));
  unsigned int data = bswap32(*(&self->super._pid + 1));
  unsigned int v30 = bswap32(a3);
  v28[0] = v30;
  v28[1] = data;
  CC_MD5(&data, 8u, md);
  CC_MD5(v28, 8u, v26);
  unint64_t v5 = bswap64(*(unint64_t *)md);
  unint64_t v6 = bswap64(*(unint64_t *)v26);
  if (v5 == v6 && (v5 = bswap64(*(unint64_t *)&md[8]), unint64_t v6 = bswap64(*(unint64_t *)&v26[8]), v5 == v6))
  {
    int v7 = 0;
  }
  else if (v5 < v6)
  {
    int v7 = -1;
  }
  else
  {
    int v7 = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(&self->super._pid + 1);
      int v11 = @"should not";
      int v14 = 136316418;
      uint64_t v15 = v8;
      if (v7 < 0) {
        int v11 = @"should";
      }
      __int16 v16 = 2080;
      __int16 v17 = "-[GKConnectionInternal shouldWeInitiateRelayWithPID:]";
      __int16 v18 = 1024;
      int v19 = 752;
      __int16 v20 = 1024;
      int v21 = v10;
      __int16 v22 = 2112;
      int v23 = v11;
      __int16 v24 = 1024;
      unsigned int v25 = a3;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d shouldWeInitiateRelayWithPID: Local participant='%d' %@ initiate relay with remote participant='%d'", (uint8_t *)&v14, 0x32u);
    }
  }
  return v7 >> 31;
}

- (void)connectParticipantsWithConnectionData:(id)a3 withSessionInfo:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unint64_t v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)&self->_gckPID;
      int v8 = *(&self->super._pid + 1);
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 757;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v7;
      *(_WORD *)&buf[38] = 1024;
      *(_DWORD *)&buf[40] = v8;
      *(_WORD *)&buf[44] = 2112;
      *(void *)&buf[46] = a3;
      __int16 v76 = 2112;
      id v77 = a4;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnectionInternal(%@ (%d)) connectParticipantsWithConnectionData is '%@', sessionInfo is '%@'", buf, 0x40u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 759;
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start-p2p-hole-punch", buf, 0x1Cu);
    }
  }
  TimingLog(3, 1, (uint64_t)"Start holepunching for peer to peer");
  object = dispatch_group_create();
  if (object)
  {
    id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
    id obj = (id)[a3 allKeys];
    if (a4)
    {
      objc_sync_enter(self);
      if (LOBYTE(self->_pendingConnectionPIDList) && [obj count] == 1)
      {
        int v11 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(obj, "objectAtIndexedSubscript:", 0));
        if ((unint64_t)[v11 length] < 4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v34 = VRTraceErrorLogLevelToCSTR();
            uint64_t v35 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
              -[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:](objc_msgSend((id)objc_msgSend(obj, "objectAtIndex:", 0), "UTF8String"), buf, v34, v35);
            }
          }
        }
        else
        {
          unsigned int v12 = *(_DWORD *)[v11 bytes];
          __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", bswap32(v12));
          [*(id *)&self->_fAllowMoreRelay addObject:v13];

          LOBYTE(self->_pendingConnectionPIDList) = 0;
        }
      }
      objc_sync_exit(self);
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v36 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v59 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            v40 = (void *)[a3 objectForKeyedSubscript:v39];
            int v41 = v40;
            if (v40)
            {
              uint64_t v42 = bswap32(*(_DWORD *)[v40 bytes]);
              uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v42);
              [(GKConnectionInternal *)self setParticipantID:v39 forPeerID:v43];
              connectingGKLog();
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary"), "objectForKey:", @"CFBundleName");
              reportingGKAppInfo();
              uint64_t v44 = [(GKConnectionInternal *)self asyncWorkQueue];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_200;
              block[3] = &unk_2645B8018;
              block[4] = self;
              block[5] = v39;
              block[6] = v43;
              block[7] = v41;
              block[8] = v52;
              int v57 = v42;
              dispatch_group_async(object, v44, block);
            }
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
        }
        while (v36);
      }
      v45 = [(GKConnectionInternal *)self asyncWorkQueue];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_204;
      v55[3] = &unk_2645B7C90;
      v55[4] = self;
      v55[5] = v52;
      v55[6] = a4;
      dispatch_group_notify(object, v45, v55);

      dispatch_release(object);
    }
    else
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      unint64_t v49 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
      if (v49)
      {
        uint64_t v51 = 0;
        uint64_t v46 = *(void *)v65;
        for (uint64_t j = *(void *)v65; ; uint64_t j = *(void *)v65)
        {
          if (j != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v64 + 1) + 8 * v51);
          __int16 v16 = (void *)[a3 objectForKeyedSubscript:v15];
          if ((unint64_t)[v16 length] > 5)
          {
            unsigned int v21 = *(_DWORD *)[v16 bytes];
            unsigned int v47 = *(unsigned __int16 *)([v16 bytes] + 4);
            if ([(GKConnectionInternal *)self shouldWeInitiateRelayWithPID:bswap32(v21)])
            {
              __int16 v22 = (void *)[MEMORY[0x263EFF9C0] set];
              uint64_t v23 = [v16 bytes];
              if ((unint64_t)([v16 length] - 11) <= 0xFFFFFFFFFFFFFFFALL)
              {
                uint64_t v24 = 6;
                do
                {
                  unint64_t v73 = 0xAAAAAAAAAAAAAAAALL;
                  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
                  int v25 = *(unsigned __int8 *)(v23 + v24);
                  if (v25 == 4)
                  {
                    unint64_t v73 = 0;
                    unint64_t v72 = 528;
                    HIDWORD(v72) = *(_DWORD *)(v23 + v24 + 1);
                    TimingLog(3, 0, (uint64_t)"starting local CDX tcp connection (connect)");
                    __int16 v26 = objc_alloc_init(GKAsyncSocket);
                    v24 += 5;
                    if (v26)
                    {
                      [v22 addObject:v26];
                      v63[0] = MEMORY[0x263EF8330];
                      v63[1] = 3221225472;
                      v63[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke;
                      v63[3] = &unk_2645B7F58;
                      v63[4] = self;
                      v63[5] = v26;
                      [(GKAsyncSocket *)v26 setReceiveDataHandler:v63];
                      v62[0] = MEMORY[0x263EF8330];
                      v62[1] = 3221225472;
                      v62[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_2;
                      v62[3] = &unk_2645B7FA0;
                      v62[4] = v22;
                      v62[5] = v26;
                      v62[6] = self;
                      [(GKAsyncSocket *)v26 setConnectedHandler:v62];
                      *(void *)&buf[46] = 0xAAAAAAAAAAAAAAAALL;
                      *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
                      *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      *(_OWORD *)&buf[16] = v27;
                      *(_OWORD *)&buf[32] = v27;
                      *(_OWORD *)buf = v27;
                      unint64_t v71 = 0xAAAAAAAAAAAAAAAALL;
                      long long v69 = v27;
                      long long v70 = v27;
                      id v28 = NSString;
                      uint64_t v29 = *(&self->super._pid + 1);
                      SAToIPPORT();
                      -[GKAsyncSocket setSocketName:](v26, "setSocketName:", objc_msgSend(v28, "stringWithFormat:", @"localCDX[%u][%08X] (connect-to[%s]) (ptr=%p)", v29, v29, IPPORTToStringWithSize(), v26));
                      [(GKAsyncSocket *)v26 setTargetQueue:MEMORY[0x263EF83A0]];
                      [(GKAsyncSocket *)v26 tcpConnectSockAddr:&v72 port:v47];
                    }
                  }
                  else
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
                      uint64_t v31 = *MEMORY[0x263F21098];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315906;
                        *(void *)&uint8_t buf[4] = v30;
                        *(_WORD *)&unsigned char buf[12] = 2080;
                        *(void *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
                        *(_WORD *)&buf[22] = 1024;
                        *(_DWORD *)&buf[24] = 848;
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = v25;
                        _os_log_error_impl(&dword_221563000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d unknown ip address size (%u)", buf, 0x22u);
                      }
                    }
                    ++v24;
                  }
                }
                while ((unint64_t)([v16 length] - v24) > 4);
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v32 = VRTraceErrorLogLevelToCSTR();
              uint64_t v33 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = v32;
                *(_WORD *)&unsigned char buf[12] = 2080;
                *(void *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 792;
                _os_log_impl(&dword_221563000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d other side to start local gaming CDX", buf, 0x1Cu);
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            __int16 v18 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
            {
              int v19 = "<nil>";
              if (v15) {
                int v19 = (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
              }
              int v20 = [v16 length];
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v17;
              *(_WORD *)&unsigned char buf[12] = 2080;
              *(void *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 777;
              *(_WORD *)&buf[28] = 2080;
              *(void *)&buf[30] = v19;
              *(_WORD *)&buf[38] = 1024;
              *(_DWORD *)&buf[40] = v20;
              _os_log_error_impl(&dword_221563000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d not enough connection data for %s (%u)", buf, 0x2Cu);
            }
          }
          if (++v51 >= v49)
          {
            unint64_t v49 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
            if (!v49) {
              break;
            }
            uint64_t v51 = 0;
          }
        }
      }
      dispatch_release(object);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      -[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]();
    }
  }
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "localGamingReceiveDataHandler:data:time:error:", *(void *)(a1 + 40), a2, a3);
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        unint64_t v6 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      }
      else {
        unint64_t v6 = "<nil>";
      }
      unsigned int v10 = 136315906;
      uint64_t v11 = v4;
      __int16 v12 = 2080;
      __int16 v13 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke_2";
      __int16 v14 = 1024;
      int v15 = 823;
      __int16 v16 = 2080;
      uint64_t v17 = v6;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connected local CDX (%s)", (uint8_t *)&v10, 0x26u);
    }
  }
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  if (a2) {
    return [*(id *)(a1 + 40) invalidate];
  }
  [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_0];
  [*(id *)(a1 + 32) removeAllObjects];
  uint64_t v9 = a1 + 40;
  int v8 = *(void **)(a1 + 40);
  unsigned int v10 = bswap32(*(_DWORD *)(*(void *)(v9 + 8) + 20));
  return objc_msgSend(v8, "sendData:withCompletionHandler:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", &v10, 4), 0);
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_187(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_200(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v2 = [*(id *)(a1 + 32) timerQueue];
  uint64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v2);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_2_201;
  v19[3] = &unk_2645B7FC8;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  unsigned int v21 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  __int16 v22 = v4;
  uint64_t v23 = v6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_202;
  v18[3] = &unk_2645B7FF0;
  v18[4] = v20;
  void v18[5] = v4;
  v18[6] = v6;
  v18[7] = v3;
  v18[8] = v19;
  objc_msgSend(v4, "internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:", v5);
  if (v3)
  {
    uint64_t v7 = [*(id *)(a1 + 32) timerQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_203;
    v17[3] = &unk_2645B7C90;
    v17[4] = *(void *)(a1 + 32);
    v17[5] = v3;
    v17[6] = *(void *)(a1 + 48);
    dispatch_sync(v7, v17);
    int v8 = [*(id *)(a1 + 32) shouldWeInitiateRelayWithPID:*(unsigned int *)(a1 + 72)];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v8)
    {
      int64_t v10 = 5000000000;
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        __int16 v12 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = v11;
          __int16 v26 = 2080;
          long long v27 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke_2";
          __int16 v28 = 1024;
          int v29 = 990;
          _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectParticipantsWithConnectionData: This side is initiating relay", buf, 0x1Cu);
        }
      }
      __int16 v13 = v18;
    }
    else
    {
      int64_t v10 = 120000000000;
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        int v15 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = v14;
          __int16 v26 = 2080;
          long long v27 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 1000;
          _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectParticipantsWithConnectionData: This side is not initiating relay", buf, 0x1Cu);
        }
      }
      __int16 v13 = v19;
    }
    dispatch_time_t v16 = dispatch_time(0, v10);
    dispatch_source_set_timer(v3, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(v3, v13);
    dispatch_resume(v3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_200_cold_1();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_FAULT))
    {
      __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_200_cold_2();
    }
  }
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_2_201(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      v5[0] = 136315906;
      *(void *)&v5[1] = v2;
      __int16 v6 = 2080;
      uint64_t v7 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke_2";
      __int16 v8 = 1024;
      int v9 = 896;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ************************************ connect_timeout_block Timer hit for '%@'", (uint8_t *)v5, 0x26u);
    }
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  [*(id *)(a1 + 56) intValue];
  GCKSessionIsParticipantConnected();
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_202(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v14 = 136315906;
      uint64_t v15 = v2;
      __int16 v16 = 2080;
      uint64_t v17 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 919;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ************************************ relay_setup_block Timer hit for '%@'", (uint8_t *)&v14, 0x26u);
    }
  }
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 464);
  objc_sync_enter(v5);
  uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 464) objectForKeyedSubscript:*(void *)(a1 + 48)];
  objc_sync_exit(v5);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v6)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        uint64_t v17 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 930;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d relay_setup_block relayInitiateInfo is nil", (uint8_t *)&v14, 0x1Cu);
      }
    }
    [*(id *)(a1 + 48) intValue];
    GCKSessionIsParticipantConnected();
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      uint64_t v15 = v8;
      __int16 v16 = 2080;
      uint64_t v17 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 942;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d relay_setup_block relayInitiateInfo is not nil", (uint8_t *)&v14, 0x1Cu);
    }
  }
  dispatch_source_set_event_handler(*(dispatch_source_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
  uint64_t v12 = *(NSObject **)(a1 + 56);
  dispatch_time_t v13 = dispatch_time(0, 120000000000);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_203(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "pidToConnectTimeoutSource"), "setObject:forKey:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v2 = *(NSObject **)(a1 + 40);
  dispatch_release(v2);
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_204(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
  [*(id *)(a1 + 32) connectPendingConnectionsFromList:*(void *)(a1 + 40) sessionInfo:*(void *)(a1 + 48)];
  uint64_t v2 = (pthread_mutex_t *)(*(void *)(a1 + 32) + 208);
  return pthread_mutex_unlock(v2);
}

- (void)internal_setRemoteConnectionData:(id)a3 fromParticipantID:(id)a4 pendingConnectionPIDList:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  int v9 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [*(id *)&self->_gckPID UTF8String];
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      __int16 v18 = "-[GKConnectionInternal internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:]";
      __int16 v19 = 1024;
      int v20 = 1031;
      __int16 v21 = 2080;
      uint64_t v22 = v12;
      __int16 v23 = 2080;
      uint64_t v24 = [a4 UTF8String];
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnectionInternal(%s) -setRemoteConnectionData (%s)", buf, 0x30u);
    }
  }
  int v14 = 0;
  int v13 = 1350;
  [a3 bytes];
  perfTimerStart();
  TimingLog(3, 0, (uint64_t)"Set remote preblob: holepunching for peer to peer\n");
  GCKSessionPrepareConnection();
}

- (OpaqueGCKSession)gckSession
{
  return (OpaqueGCKSession *)self->_pidGUID;
}

- (void)addEvent:(id *)a3 remotePeer:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  if ((GKConnectionInternal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_18;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x263F21098];
    uint64_t v10 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v20 = 136315650;
      uint64_t v21 = v8;
      __int16 v22 = 2080;
      __int16 v23 = "-[GKConnectionInternal addEvent:remotePeer:]";
      __int16 v24 = 1024;
      int v25 = 1107;
      uint64_t v11 = " [%s] %s:%d ";
      uint64_t v12 = v9;
      uint32_t v13 = 28;
LABEL_13:
      _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, v13);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[GKConnectionInternal addEvent:remotePeer:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(GKConnectionInternal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_26D39CAC0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x263F21098];
      uint64_t v16 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        int v20 = 136316162;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        __int16 v23 = "-[GKConnectionInternal addEvent:remotePeer:]";
        __int16 v24 = 1024;
        int v25 = 1107;
        __int16 v26 = 2112;
        long long v27 = v7;
        __int16 v28 = 2048;
        int v29 = self;
        uint64_t v11 = " [%s] %s:%d %@(%p) ";
        uint64_t v12 = v15;
        uint32_t v13 = 48;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 136316162;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        __int16 v23 = "-[GKConnectionInternal addEvent:remotePeer:]";
        __int16 v24 = 1024;
        int v25 = 1107;
        __int16 v26 = 2112;
        long long v27 = v7;
        __int16 v28 = 2048;
        int v29 = self;
        _os_log_debug_impl(&dword_221563000, v15, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", (uint8_t *)&v20, 0x30u);
      }
    }
  }
LABEL_18:
  gckSession = self->_gckSession;
  objc_sync_enter(gckSession);
  gckEventList = self->_gckEventList;
  if (gckEventList)
  {
    [(NSMutableArray *)gckEventList sendCallbacksToDelegate:a3 remotePeer:v4];
  }
  else
  {
    __int16 v19 = [[GCKEventItem alloc] initWithEvent:a3 remotePeer:v4];
    [(OpaqueGCKSession *)self->_gckSession addObject:v19];
  }
  objc_sync_exit(gckSession);
}

- (void)setEventDelegate:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ((GKConnectionInternal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_18;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x263F21098];
    uint64_t v8 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = v6;
      __int16 v27 = 2080;
      __int16 v28 = "-[GKConnectionInternal setEventDelegate:]";
      __int16 v29 = 1024;
      int v30 = 1120;
      int v9 = " [%s] %s:%d ";
      uint64_t v10 = v7;
      uint32_t v11 = 28;
LABEL_13:
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[GKConnectionInternal setEventDelegate:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(GKConnectionInternal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_26D39CAC0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint32_t v13 = *MEMORY[0x263F21098];
      uint64_t v14 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = v12;
        __int16 v27 = 2080;
        __int16 v28 = "-[GKConnectionInternal setEventDelegate:]";
        __int16 v29 = 1024;
        int v30 = 1120;
        __int16 v31 = 2112;
        uint64_t v32 = v5;
        __int16 v33 = 2048;
        uint64_t v34 = self;
        int v9 = " [%s] %s:%d %@(%p) ";
        uint64_t v10 = v13;
        uint32_t v11 = 48;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = v12;
        __int16 v27 = 2080;
        __int16 v28 = "-[GKConnectionInternal setEventDelegate:]";
        __int16 v29 = 1024;
        int v30 = 1120;
        __int16 v31 = 2112;
        uint64_t v32 = v5;
        __int16 v33 = 2048;
        uint64_t v34 = self;
        _os_log_debug_impl(&dword_221563000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", buf, 0x30u);
      }
    }
  }
LABEL_18:
  id obj = self->_gckSession;
  objc_sync_enter(obj);
  self->_gckEventList = (NSMutableArray *)a3;
  if (a3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    gckSession = self->_gckSession;
    uint64_t v16 = [(OpaqueGCKSession *)gckSession countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(gckSession);
          }
          -[NSMutableArray sendCallbacksToDelegate:remotePeer:](self->_gckEventList, "sendCallbacksToDelegate:remotePeer:", [*(id *)(*((void *)&v20 + 1) + 8 * i) event], objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "pid"));
        }
        uint64_t v16 = [(OpaqueGCKSession *)gckSession countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
    [(OpaqueGCKSession *)self->_gckSession removeAllObjects];
  }
  objc_sync_exit(obj);
}

- (id)eventDelegate
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((GKConnectionInternal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x263F21098];
      uint64_t v6 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315650;
          uint64_t v15 = v4;
          __int16 v16 = 2080;
          uint64_t v17 = "-[GKConnectionInternal eventDelegate]";
          __int16 v18 = 1024;
          int v19 = 1133;
          uint64_t v7 = " [%s] %s:%d ";
          uint64_t v8 = v5;
          uint32_t v9 = 28;
LABEL_13:
          _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[GKConnectionInternal eventDelegate]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(GKConnectionInternal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_26D39CAC0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint32_t v11 = *MEMORY[0x263F21098];
      uint64_t v12 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136316162;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          uint64_t v17 = "-[GKConnectionInternal eventDelegate]";
          __int16 v18 = 1024;
          int v19 = 1133;
          __int16 v20 = 2112;
          long long v21 = v3;
          __int16 v22 = 2048;
          long long v23 = self;
          uint64_t v7 = " [%s] %s:%d %@(%p) ";
          uint64_t v8 = v11;
          uint32_t v9 = 48;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136316162;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        uint64_t v17 = "-[GKConnectionInternal eventDelegate]";
        __int16 v18 = 1024;
        int v19 = 1133;
        __int16 v20 = 2112;
        long long v21 = v3;
        __int16 v22 = 2048;
        long long v23 = self;
        _os_log_debug_impl(&dword_221563000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", (uint8_t *)&v14, 0x30u);
      }
    }
  }
  return self->_gckEventList;
}

- (unsigned)gckPID
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((GKConnectionInternal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x263F21098];
      uint64_t v6 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315650;
          uint64_t v15 = v4;
          __int16 v16 = 2080;
          uint64_t v17 = "-[GKConnectionInternal gckPID]";
          __int16 v18 = 1024;
          int v19 = 1138;
          uint64_t v7 = " [%s] %s:%d ";
          uint64_t v8 = v5;
          uint32_t v9 = 28;
LABEL_13:
          _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[GKConnectionInternal gckPID]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(GKConnectionInternal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_26D39CAC0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint32_t v11 = *MEMORY[0x263F21098];
      uint64_t v12 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136316162;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          uint64_t v17 = "-[GKConnectionInternal gckPID]";
          __int16 v18 = 1024;
          int v19 = 1138;
          __int16 v20 = 2112;
          long long v21 = v3;
          __int16 v22 = 2048;
          long long v23 = self;
          uint64_t v7 = " [%s] %s:%d %@(%p) ";
          uint64_t v8 = v11;
          uint32_t v9 = 48;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136316162;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        uint64_t v17 = "-[GKConnectionInternal gckPID]";
        __int16 v18 = 1024;
        int v19 = 1138;
        __int16 v20 = 2112;
        long long v21 = v3;
        __int16 v22 = 2048;
        long long v23 = self;
        _os_log_debug_impl(&dword_221563000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", (uint8_t *)&v14, 0x30u);
      }
    }
  }
  return *(&self->super._pid + 1);
}

- (void)setCdxClient:(id)a3
{
  id eventDelegate = self->_eventDelegate;
  if (eventDelegate != a3)
  {
    [self->_eventDelegate setDelegate:0];
    id v6 = a3;
    self->_id eventDelegate = v6;
    [v6 setDelegate:self];

    if ([self->_eventDelegate preblob])
    {
      id v7 = self->_eventDelegate;
      uint64_t v8 = [v7 preblob];
      [(GKConnectionInternal *)self CDXClient:v7 preblob:v8];
    }
  }
}

- (id)createInsecureTicketUsingSortedConnectionsFromList:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  long long v61 = xmmword_2215E89C0;
  uint64_t v60 = 0x706050403020100;
  size_t v48 = 1500;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v50 = v4;
      __int16 v51 = 2080;
      id v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
      __int16 v53 = 1024;
      int v54 = 1178;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d <radar:7609403> remains unfixed.", buf, 0x1Cu);
    }
  }
  if (![a3 count]) {
    return 0;
  }
  id v6 = (void **)CDXVendorCreateWithSingleKey((unsigned int *)&v61);
  id v7 = malloc_type_calloc(1uLL, 0x5DCuLL, 0x3EE178B8uLL);
  if (!v7)
  {
LABEL_51:
    uint64_t v35 = 0;
    if (!v6) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  uint64_t v43 = (void *)[MEMORY[0x263EFF990] data];
  unsigned __int8 v8 = [a3 count];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v44 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unsigned __int8 v37 = v8;
    v38 = v7;
    uint64_t v39 = v6;
    int v11 = 0;
    unsigned __int8 v12 = -1;
    int v13 = 50462976;
    uint64_t v42 = *(void *)v45;
    while (1)
    {
      uint64_t v14 = 0;
      int v15 = v11;
      do
      {
        if (*(void *)v45 != v42) {
          objc_enumerationMutation(a3);
        }
        __int16 v16 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
        v13 ^= bswap32([v16 unsignedLongValue]);
        LODWORD(v60) = v13;
        if ([v16 unsignedLongValue] == *(&self->super._pid + 1)) {
          unsigned __int8 v12 = v15 + v14;
        }
        uint64_t v17 = (void *)[(NSMutableDictionary *)self->_preblobToPIDMap objectForKeyedSubscript:v16];
        __int16 v18 = v17;
        if (!v17
          || (int v19 = CDXGetPreblobLength((unsigned __int8 *)[v17 bytes])) == 0
          || (unint64_t v20 = (unint64_t)v19, (unint64_t)v19 > [v18 length]))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_18;
          }
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          __int16 v22 = *MEMORY[0x263F21098];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          __int16 v33 = "<nil>";
          if (v18) {
            __int16 v33 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v50 = v21;
          __int16 v51 = 2080;
          id v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
          __int16 v53 = 1024;
          int v54 = 1208;
          __int16 v55 = 2080;
          uint64_t v56 = (uint64_t)v33;
          __int16 v31 = v22;
          uint64_t v32 = " [%s] %s:%d Preblob is too small: %s";
LABEL_41:
          _os_log_error_impl(&dword_221563000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x26u);
LABEL_18:
          [v43 appendBytes:"" length:1];
          goto LABEL_19;
        }
        if (v20 < [v18 length])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v40 = VRTraceErrorLogLevelToCSTR();
            long long v23 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
              *(_DWORD *)buf = 136316162;
              uint64_t v50 = v40;
              __int16 v51 = 2080;
              id v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
              __int16 v53 = 1024;
              int v54 = 1221;
              __int16 v55 = 2080;
              uint64_t v56 = v24;
              __int16 v57 = 1024;
              int v58 = v20;
              _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Trimming preblob %s to %d bytes", buf, 0x2Cu);
            }
          }
          __int16 v18 = objc_msgSend(v18, "subdataWithRange:", 0, v20);
        }
        if ((CDXVerifyPreblob((unsigned __int8 *)[v18 bytes], objc_msgSend(v18, "length")) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_18;
          }
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          __int16 v29 = *MEMORY[0x263F21098];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          int v30 = "<nil>";
          if (v18) {
            int v30 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v50 = v28;
          __int16 v51 = 2080;
          id v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
          __int16 v53 = 1024;
          int v54 = 1226;
          __int16 v55 = 2080;
          uint64_t v56 = (uint64_t)v30;
          __int16 v31 = v29;
          uint64_t v32 = " [%s] %s:%d Invalid preblob: %s";
          goto LABEL_41;
        }
        if (*(unsigned char *)[v18 bytes] == 1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            uint64_t v25 = VRTraceErrorLogLevelToCSTR();
            uint64_t v26 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if (v18) {
                __int16 v27 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
              }
              else {
                __int16 v27 = "<nil>";
              }
              *(_DWORD *)buf = 136315906;
              uint64_t v50 = v25;
              __int16 v51 = 2080;
              id v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
              __int16 v53 = 1024;
              int v54 = 1236;
              __int16 v55 = 2080;
              uint64_t v56 = (uint64_t)v27;
              _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Rejecting anonymous preblob: %s", buf, 0x26u);
            }
          }
          goto LABEL_18;
        }
        [v43 appendData:v18];
LABEL_19:
        ++v14;
      }
      while (v10 != v14);
      int v11 = v15 + v10;
      uint64_t v34 = [a3 countByEnumeratingWithState:&v44 objects:v59 count:16];
      uint64_t v10 = v34;
      if (!v34)
      {
        id v7 = v38;
        id v6 = v39;
        unsigned __int8 v8 = v37;
        goto LABEL_47;
      }
    }
  }
  unsigned __int8 v12 = -1;
LABEL_47:
  if (CDXVendorCreateTicket((uint64_t)v6, v7, &v48, &v60, (const void *)[v43 bytes], objc_msgSend(v43, "length"), v8, v12, 300, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]();
      }
    }
    goto LABEL_51;
  }
  uint64_t v35 = (void *)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v7 length:v48 freeWhenDone:1];
  id v7 = 0;
  if (v6) {
LABEL_52:
  }
    CDXVendorRelease(v6);
LABEL_53:
  if (v7) {
    free(v7);
  }
  return v35;
}

- (void)CDXClient:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    id v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      int v11 = "-[GKConnectionInternal CDXClient:error:]";
      __int16 v12 = 1024;
      int v13 = 1282;
      __int16 v14 = 2080;
      Name = sel_getName(a2);
      __int16 v16 = 2080;
      uint64_t v17 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      _os_log_error_impl(&dword_221563000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d [GKConnection %s]: %s", (uint8_t *)&v8, 0x30u);
    }
  }
}

- (void)CDXClient:(id)a3 preblob:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      int v19 = "-[GKConnectionInternal CDXClient:preblob:]";
      __int16 v20 = 1024;
      int v21 = 1286;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d got-a-preblob", buf, 0x1Cu);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)&self->_preblobCallbackCancelTime);
  cdxSessions = self->_cdxSessions;
  if (cdxSessions) {

  }
  self->_cdxSessions = (NSMutableDictionary *)a4;
  uint64_t v10 = [NSNumber numberWithUnsignedInt:*(&self->super._pid + 1)];
  [*(id *)&self->_wakeTime setObject:v10 forKeyedSubscript:self->_cdxSessions];
  [(NSMutableDictionary *)self->_preblobToPIDMap setObject:self->_cdxSessions forKeyedSubscript:v10];
  if (self->_preblob)
  {
    unsigned int v15 = bswap32(*(&self->super._pid + 1));
    int v11 = (void *)[MEMORY[0x263EFF990] dataWithBytes:&v15 length:4];
    [v11 appendData:self->_cdxSessions];
    TimingLog(3, 0, (uint64_t)"Got local connection data - passing data to app");
    ((void (*)(void))self->_preblob[2].super.isa)();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v11 length];
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        int v19 = "-[GKConnectionInternal CDXClient:preblob:]";
        __int16 v20 = 1024;
        int v21 = 1303;
        __int16 v22 = 2048;
        id v23 = a3;
        __int16 v24 = 2048;
        uint64_t v25 = v14;
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CDXClient=%p Got local connection data size=%lu", buf, 0x30u);
      }
    }

    self->_preblob = 0;
  }
  pthread_cond_signal((pthread_cond_t *)&self->_xPreblobFetch.__opaque[48]);
  pthread_mutex_unlock((pthread_mutex_t *)&self->_preblobCallbackCancelTime);
}

- (id)extractBlobUsingData:(id)a3 withSourcePID:(unsigned int)a4 destPID:(unsigned int)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v7 = (unsigned __int16 *)[a3 bytes];
  id v23 = a3;
  unint64_t v8 = (unint64_t)v7 + [a3 length];
  __int16 v24 = (char *)v7;
  while ((unint64_t)v7 < v8)
  {
    uint64_t v9 = v7 + 5;
    if ((unint64_t)(v7 + 5) > v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_16;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      int v19 = [v23 length];
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = v17;
      __int16 v28 = 2080;
      __int16 v29 = "-[GKConnectionInternal extractBlobUsingData:withSourcePID:destPID:]";
      __int16 v30 = 1024;
      int v31 = 1340;
      __int16 v32 = 1024;
      int v33 = v19;
      __int16 v34 = 1024;
      int v35 = v7 - v24;
      __int16 v36 = 1024;
      int v37 = 10;
      __int16 v20 = " [%s] %s:%d Unable to read blob header (total=%d, offset=%d, headerLength=%d)";
      goto LABEL_20;
    }
    uint64_t v10 = bswap32(*v7) >> 16;
    int v11 = (unsigned __int16 *)((char *)v7 + v10);
    if ((unint64_t)v7 + v10 > v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_16;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      int v22 = [v23 length];
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = v21;
      __int16 v28 = 2080;
      __int16 v29 = "-[GKConnectionInternal extractBlobUsingData:withSourcePID:destPID:]";
      __int16 v30 = 1024;
      int v31 = 1347;
      __int16 v32 = 1024;
      int v33 = v22;
      __int16 v34 = 1024;
      int v35 = v7 - v24;
      __int16 v36 = 1024;
      int v37 = v10;
      __int16 v20 = " [%s] %s:%d GKConnection: bad blobs? (total=%d, offset=%d, blobLength=%d)";
LABEL_20:
      _os_log_error_impl(&dword_221563000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x2Eu);
LABEL_16:
      reportingGKLog();
      return 0;
    }
    unsigned int v12 = bswap32(*(_DWORD *)(v7 + 1));
    unsigned int v13 = bswap32(*(_DWORD *)(v7 + 3));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      unsigned int v15 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v27 = v14;
        __int16 v28 = 2080;
        __int16 v29 = "-[GKConnectionInternal extractBlobUsingData:withSourcePID:destPID:]";
        __int16 v30 = 1024;
        int v31 = 1357;
        __int16 v32 = 1024;
        int v33 = v9 - v24;
        __int16 v34 = 1024;
        int v35 = v10;
        __int16 v36 = 1024;
        int v37 = v12;
        __int16 v38 = 1024;
        unsigned int v39 = v13;
        _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnection:receivedData @%d (+%d): dstPID(%u), srcPID(%u)", buf, 0x34u);
      }
    }
    uint64_t v7 = v11;
    if (v12 == a5)
    {
      uint64_t v7 = v11;
      if (v13 == a4) {
        return (id)objc_msgSend(v23, "subdataWithRange:", (char *)v9 - v24, v10 - 10);
      }
    }
  }
  return 0;
}

- (void)CDXClientSession:(id)a3 receivedData:(id)a4 from:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = v9;
      __int16 v19 = 2080;
      __int16 v20 = "-[GKConnectionInternal CDXClientSession:receivedData:from:]";
      __int16 v21 = 1024;
      int v22 = 1379;
      __int16 v23 = 1024;
      int v24 = [a4 length];
      __int16 v25 = 1024;
      int v26 = a5;
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnection:receivedData(%d):from=%d", buf, 0x28u);
    }
  }
  int v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](-[GKConnectionInternal cdxSessions](self, "cdxSessions"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "ticket"), "valueForKey:", @"CDXTicketSID"));
  if (v11)
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"connectionPIDList"), "objectAtIndex:", a5), "unsignedLongValue");
    id v13 = [(GKConnectionInternal *)self extractBlobUsingData:a4 withSourcePID:v12 destPID:*(&self->super._pid + 1)];
    if (v13)
    {
      uint64_t v14 = v13;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        __int16 v16 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v18 = v15;
          __int16 v19 = 2080;
          __int16 v20 = "-[GKConnectionInternal CDXClientSession:receivedData:from:]";
          __int16 v21 = 1024;
          int v22 = 1395;
          __int16 v23 = 1024;
          int v24 = v12;
          _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d starting-ice.%d", buf, 0x22u);
        }
      }
      TimingLog(3, 0, (uint64_t)"CDX done - starting ICE");
      perfTimerStop();
      perfTimerStart();
      reportingGKLog();
      [v14 bytes];
      [v14 length];
      GCKSessionEstablishConnection();
    }
  }
}

uint64_t __59__GKConnectionInternal_CDXClientSession_receivedData_from___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) internalInitiateRelayWithParticipant:*(void *)(a1 + 40) withConnectionData:*(void *)(a1 + 48) withRelayInfo:*(void *)(a1 + 56) didInitiate:*(unsigned __int8 *)(a1 + 64)];
}

uint64_t __59__GKConnectionInternal_CDXClientSession_receivedData_from___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) internalUpdateRelayWithParticipant:*(void *)(a1 + 40) withConnectionData:*(void *)(a1 + 48) withRelayInfo:*(void *)(a1 + 56) didInitiate:*(unsigned __int8 *)(a1 + 64)];
}

- (BOOL)convertParticipantID:(id)a3 toPeerID:(id *)a4
{
  allowRelayPIDList = self->_allowRelayPIDList;
  objc_sync_enter(allowRelayPIDList);
  unint64_t v8 = (void *)[(NSMutableArray *)self->_allowRelayPIDList allKeysForObject:a3];
  uint64_t v9 = [v8 count];
  if (v9) {
    id v10 = (id)[v8 objectAtIndexedSubscript:0];
  }
  else {
    id v10 = 0;
  }
  *a4 = v10;
  objc_sync_exit(allowRelayPIDList);
  return v9 != 0;
}

- (BOOL)convertPeerID:(id)a3 toParticipantID:(id *)a4
{
  allowRelayPIDList = self->_allowRelayPIDList;
  objc_sync_enter(allowRelayPIDList);
  unint64_t v8 = (void *)[(NSMutableArray *)self->_allowRelayPIDList objectForKeyedSubscript:a3];
  uint64_t v9 = v8;
  if (v8) {
    *a4 = v8;
  }
  objc_sync_exit(allowRelayPIDList);
  return v9 != 0;
}

- (void)setParticipantID:(id)a3 forPeerID:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(NSMutableArray *)self->_allowRelayPIDList objectForKeyedSubscript:a4];
  if (a3)
  {
    __int16 v21 = (void *)v7;
    id obj = self->_allowRelayPIDList;
    objc_sync_enter(obj);
    unint64_t v8 = (void *)[(NSMutableArray *)self->_allowRelayPIDList allKeysForObject:a3];
    id v22 = a3;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (v12 && ([*(id *)(*((void *)&v24 + 1) + 8 * i) isEqualToString:a4] & 1) == 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v13 = VRTraceErrorLogLevelToCSTR();
              uint64_t v14 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v15 = [v12 UTF8String];
                *(_DWORD *)buf = 136315906;
                uint64_t v29 = v13;
                __int16 v30 = 2080;
                int v31 = "-[GKConnectionInternal setParticipantID:forPeerID:]";
                __int16 v32 = 1024;
                int v33 = 1493;
                __int16 v34 = 2080;
                uint64_t v35 = v15;
                _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnection: removeObjectForKey(forPeerID)[%s]", buf, 0x26u);
              }
            }
            [(NSMutableArray *)self->_allowRelayPIDList removeObjectForKey:v12];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v40 count:16];
      }
      while (v9);
    }
    objc_sync_exit(obj);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v22 UTF8String];
        uint64_t v19 = [a4 UTF8String];
        if (v21) {
          __int16 v20 = (const char *)[v21 UTF8String];
        }
        else {
          __int16 v20 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v29 = v16;
        __int16 v30 = 2080;
        int v31 = "-[GKConnectionInternal setParticipantID:forPeerID:]";
        __int16 v32 = 1024;
        int v33 = 1499;
        __int16 v34 = 2080;
        uint64_t v35 = v18;
        __int16 v36 = 2080;
        uint64_t v37 = v19;
        __int16 v38 = 2080;
        unsigned int v39 = v20;
        _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnection: setParticipantID:[%s] forPeerID[%s] (old participantID:[%s])", buf, 0x3Au);
      }
    }
    [(NSMutableArray *)self->_allowRelayPIDList setObject:v22 forKeyedSubscript:a4];
  }
}

- (id)createInitiateRelayDictionaryForParticipant:(id)a3 remotePeerID:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!+[GKConnection isRelayEnabled])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v17 = v9;
    __int16 v18 = 2080;
    uint64_t v19 = "-[GKConnectionInternal createInitiateRelayDictionaryForParticipant:remotePeerID:]";
    __int16 v20 = 1024;
    int v21 = 1510;
    __int16 v22 = 2080;
    Name = sel_getName(a2);
    int v11 = " [%s] %s:%d **************************** %s: relay not enabled";
    uint64_t v12 = v10;
    uint32_t v13 = 38;
    goto LABEL_10;
  }
  uint64_t v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_preblobToPIDMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a4, "intValue")));
  if (v7) {
    return (id)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", self->_cdxSessions, *(void *)off_2645B7968, +[GKConnection externalAddressForCDXSelfConnectionData:](GKConnectionInternal, "externalAddressForCDXSelfConnectionData:", self->_cdxSessions), *(void *)off_2645B7970, &unk_26D3A40B8, *(void *)off_2645B7978, v7, *(void *)off_2645B7940, +[GKConnection externalAddressForCDXSelfConnectionData:](GKConnectionInternal, "externalAddressForCDXSelfConnectionData:", v7), *(void *)off_2645B7948, &unk_26D3A40B8,
  }
                 *(void *)off_2645B7950,
                 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v14;
      __int16 v18 = 2080;
      uint64_t v19 = "-[GKConnectionInternal createInitiateRelayDictionaryForParticipant:remotePeerID:]";
      __int16 v20 = 1024;
      int v21 = 1525;
      __int16 v22 = 2080;
      Name = sel_getName(a2);
      __int16 v24 = 1024;
      int v25 = [a4 intValue];
      int v11 = " [%s] %s:%d **************************** %s: no preblob found for %d";
      uint64_t v12 = v15;
      uint32_t v13 = 44;
LABEL_10:
      _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
  return 0;
}

- (id)newRelayUpdateDictionaryForParticipant:(id)a3 didInitiate:(BOOL)a4
{
  if (!+[GKConnection isRelayEnabled]) {
    return 0;
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  if (![(GKConnectionInternal *)self convertParticipantID:a3 toPeerID:&v10]) {
    return 0;
  }
  uint64_t v6 = *(void **)&self->_xRelay.__opaque[48];
  objc_sync_enter(v6);
  id v7 = (id)[*(id *)&self->_xRelay.__opaque[48] objectForKeyedSubscript:v10];
  objc_sync_exit(v6);
  if (!v7) {
    return 0;
  }
  unint64_t v8 = (void *)[v7 mutableCopy];
  [v8 setObject:&unk_26D3A40D0 forKeyedSubscript:*(void *)off_2645B79A8];
  [v8 setObject:-[NSMutableDictionary objectForKeyedSubscript:](self->_pidToRelayInitiateInfoMap, "objectForKeyedSubscript:", objc_msgSend(@">", "stringByAppendingString:", v10)), *(void *)off_2645B7930 forKeyedSubscript];
  return v8;
}

- (void)doRelayCheckForRemotePeerID:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  pidToRelayConnectionDataMap = self->_pidToRelayConnectionDataMap;
  objc_sync_enter(pidToRelayConnectionDataMap);
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pidToRelayConnectionDataMap, "objectForKeyedSubscript:", [@">" stringByAppendingString:a3]);
  id v8 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pidToRelayConnectionDataMap, "objectForKeyedSubscript:", [@"<" stringByAppendingString:a3]);
  objc_sync_exit(pidToRelayConnectionDataMap);
  if (v8) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v12 = (void *)[v8 objectForKeyedSubscript:*(void *)off_2645B7930];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315906;
        uint64_t v17 = v14;
        __int16 v18 = 2080;
        uint64_t v19 = "-[GKConnectionInternal doRelayCheckForRemotePeerID:]";
        __int16 v20 = 1024;
        int v21 = 1605;
        __int16 v22 = 2080;
        Name = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d before GCKSessionEstablishConnectionWithRelayInfo: remote dict:%s", (uint8_t *)&v16, 0x26u);
      }
    }
    [a3 intValue];
    [v12 bytes];
    [v12 length];
    GCKSessionEstablishConnectionWithRelayInfo();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136316674;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      uint64_t v19 = "-[GKConnectionInternal doRelayCheckForRemotePeerID:]";
      __int16 v20 = 1024;
      int v21 = 1622;
      __int16 v22 = 2080;
      Name = sel_getName(a2);
      __int16 v24 = 2080;
      uint64_t v25 = [a3 UTF8String];
      __int16 v26 = 2048;
      id v27 = v8;
      __int16 v28 = 2048;
      id v29 = v7;
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s (remote:%s) - remoteRelayUpdateInfo[%p] localRelayUpdateInfo[%p]", (uint8_t *)&v16, 0x44u);
    }
  }
}

- (void)internalInitiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (+[GKConnection isRelayEnabled])
  {
    id v40 = (id)0xAAAAAAAAAAAAAAAALL;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayIn"
                              "fo:didInitiate:]";
        __int16 v42 = 1024;
        int v43 = 1635;
        __int16 v44 = 2080;
        Name = sel_getName(a2);
        __int16 v46 = 2080;
        *(void *)long long v47 = [a3 UTF8String];
        _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - remote participant[%s]", buf, 0x30u);
      }
    }
    if ([(GKConnectionInternal *)self convertParticipantID:a3 toPeerID:&v40])
    {
      perfTimerStart();
      BOOL v13 = [a5 objectForKeyedSubscript:@"GKSTargetPeerID"] == 0;
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v13)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          __int16 v22 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            __int16 v23 = sel_getName(a2);
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v21;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRel"
                                  "ayInfo:didInitiate:]";
            __int16 v42 = 1024;
            int v43 = 1647;
            __int16 v44 = 2080;
            Name = v23;
            _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - checking intended target via dictionary: no value", buf, 0x26u);
          }
        }
      }
      else
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          int v16 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = sel_getName(a2);
            int v18 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"GKSTargetPeerID"), "intValue");
            int v19 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"GKSOriginPeerID"), "intValue");
            int v20 = *(&self->super._pid + 1);
            *(_DWORD *)buf = 136316674;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRel"
                                  "ayInfo:didInitiate:]";
            __int16 v42 = 1024;
            int v43 = 1641;
            __int16 v44 = 2080;
            Name = v17;
            __int16 v46 = 1024;
            *(_DWORD *)long long v47 = v18;
            *(_WORD *)&v47[4] = 1024;
            *(_DWORD *)&v47[6] = v19;
            __int16 v48 = 1024;
            int v49 = v20;
            _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - checking intended target via dictionary (%d/%d == %d ?)", buf, 0x38u);
          }
        }
        if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"GKSTargetPeerID"), "unsignedIntValue") != *(&self->super._pid + 1)&& objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"GKSOriginPeerID"), "unsignedIntValue") != *(&self->super._pid + 1))
        {
          return;
        }
      }
      __int16 v24 = *(void **)&self->_xRelay.__opaque[48];
      objc_sync_enter(v24);
      uint64_t v25 = [*(id *)&self->_xRelay.__opaque[48] objectForKeyedSubscript:v40];
      objc_sync_exit(v24);
      if (v25) {
        return;
      }
      __int16 v26 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a5];
      in_addr_t v39 = inet_addr("72.247.44.23");
      uint64_t v27 = [MEMORY[0x263EFF8F8] dataWithBytes:&v39 length:4];
      int v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"GeckoFixRelayInfo"), "BOOLValue");
      uint64_t v29 = *(void *)off_2645B7958;
      if (v28)
      {
        [v26 setObject:v27 forKeyedSubscript:*(void *)off_2645B7958];
        [v26 setObject:&unk_26D3A40E8 forKeyedSubscript:*(void *)off_2645B7960];
        [v26 setObject:v27 forKeyedSubscript:*(void *)off_2645B7980];
        [v26 setObject:&unk_26D3A40E8 forKeyedSubscript:*(void *)off_2645B7990];
        uint64_t v30 = *(void *)off_2645B7998;
      }
      else
      {
        if (![v26 objectForKeyedSubscript:*(void *)off_2645B7958]) {
          [v26 setObject:v27 forKeyedSubscript:v29];
        }
        uint64_t v31 = *(void *)off_2645B7960;
        if (![v26 objectForKeyedSubscript:*(void *)off_2645B7960]) {
          [v26 setObject:&unk_26D3A40E8 forKeyedSubscript:v31];
        }
        uint64_t v32 = *(void *)off_2645B7980;
        if (![v26 objectForKeyedSubscript:*(void *)off_2645B7980]) {
          [v26 setObject:v27 forKeyedSubscript:v32];
        }
        uint64_t v33 = *(void *)off_2645B7990;
        if (![v26 objectForKeyedSubscript:*(void *)off_2645B7990]) {
          [v26 setObject:&unk_26D3A40E8 forKeyedSubscript:v33];
        }
        uint64_t v30 = *(void *)off_2645B7998;
        if ([v26 objectForKeyedSubscript:*(void *)off_2645B7998]) {
          goto LABEL_30;
        }
      }
      qmemcpy(buf, "ABCDEFGHIJABCDEFGHIJ", 20);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 20), v30);
      if (v28)
      {
        [v26 removeObjectForKey:*(void *)off_2645B7938];
        uint64_t v34 = *(void *)off_2645B79A0;
        goto LABEL_31;
      }
LABEL_30:
      uint64_t v34 = *(void *)off_2645B79A0;
      if ([v26 objectForKeyedSubscript:*(void *)off_2645B79A0])
      {
LABEL_32:
        uint64_t v35 = *(void **)&self->_xRelay.__opaque[48];
        objc_sync_enter(v35);
        [*(id *)&self->_xRelay.__opaque[48] setObject:v26 forKeyedSubscript:v40];
        objc_sync_exit(v35);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __106__GKConnectionInternal_internalInitiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke;
        block[3] = &unk_2645B8068;
        block[4] = self;
        block[5] = v26;
        block[7] = a3;
        block[8] = a2;
        block[6] = v40;
        BOOL v38 = a6;
        dispatch_async(global_queue, block);
        return;
      }
LABEL_31:
      *(void *)&uint8_t buf[4] = 0;
      *(_DWORD *)buf = bswap32([v40 intValue] ^ *(&self->super._pid + 1));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 8), v34);
      goto LABEL_32;
    }
  }
}

void __106__GKConnectionInternal_internalInitiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  int v5 = 1350;
  perfTimerStart();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "description"), "UTF8String");
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 1721;
      __int16 v13 = 2080;
      uint64_t v14 = v4;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d before GCKSessionPrepareConnectionWithRelayInfo: dict:%s", buf, 0x26u);
    }
  }
  [*(id *)(a1 + 48) intValue];
  GCKSessionPrepareConnectionWithRelayInfo();
}

- (void)initiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  if (a5)
  {
    BOOL v6 = a6;
    p_pidToConnectTimeoutSource = &self->_pidToConnectTimeoutSource;
    pthread_mutex_lock((pthread_mutex_t *)&self->_pidToConnectTimeoutSource);
    id v12 = (id)[objc_alloc(NSDictionary) initWithDictionary:a5 copyItems:1];
    if ([(NSMutableDictionary *)self->_pidToRelayUpdateInfoMap objectForKeyedSubscript:a3])
    {
      __int16 v13 = [(GKConnectionInternal *)self asyncWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __98__GKConnectionInternal_initiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke;
      block[3] = &unk_2645B8040;
      block[4] = self;
      block[5] = a3;
      block[6] = a4;
      block[7] = v12;
      BOOL v17 = v6;
      dispatch_async(v13, block);
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v15 = v14;
      if (a4) {
        [v14 setObject:a4 forKeyedSubscript:@"participantConnectionData"];
      }
      if (v12) {
        [v15 setObject:v12 forKeyedSubscript:@"relayInfo"];
      }
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v6), @"didInitiate");
      [(NSMutableDictionary *)self->_pidToRelayUpdateInfoMap setObject:v15 forKeyedSubscript:a3];
    }
    pthread_mutex_unlock((pthread_mutex_t *)p_pidToConnectTimeoutSource);
  }
}

uint64_t __98__GKConnectionInternal_initiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) internalInitiateRelayWithParticipant:*(void *)(a1 + 40) withConnectionData:*(void *)(a1 + 48) withRelayInfo:*(void *)(a1 + 56) didInitiate:*(unsigned __int8 *)(a1 + 64)];
}

- (void)internalUpdateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  v39[2] = *MEMORY[0x263EF8340];
  if (+[GKConnection isRelayEnabled])
  {
    unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[GKConnectionInternal internalUpdateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]";
        __int16 v34 = 1024;
        int v35 = 1809;
        __int16 v36 = 2080;
        Name = sel_getName(a2);
        __int16 v38 = 2080;
        v39[0] = [a3 UTF8String];
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - remote[%s]", buf, 0x30u);
      }
    }
    if ([(GKConnectionInternal *)self convertParticipantID:a3 toPeerID:&v32])
    {
      BOOL v12 = [a5 objectForKeyedSubscript:@"GKSTargetPeerID"] == 0;
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (!v12)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          uint64_t v15 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v16 = sel_getName(a2);
            int v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"GKSTargetPeerID"), "intValue");
            int v18 = *(&self->super._pid + 1);
            *(_DWORD *)buf = 136316418;
            *(void *)&uint8_t buf[4] = v14;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[GKConnectionInternal internalUpdateRelayWithParticipant:withConnectionData:withRelay"
                                  "Info:didInitiate:]";
            __int16 v34 = 1024;
            int v35 = 1815;
            __int16 v36 = 2080;
            Name = v16;
            __int16 v38 = 1024;
            LODWORD(v39[0]) = v17;
            WORD2(v39[0]) = 1024;
            *(_DWORD *)((char *)v39 + 6) = v18;
            _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - checking intended target via dictionary (%d == %d ?)", buf, 0x32u);
          }
        }
        if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"GKSTargetPeerID"), "unsignedIntValue") != *(&self->super._pid + 1))return; {
LABEL_16:
        }
        __int16 v23 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a5];
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"GeckoFixRelayInfo"), "BOOLValue"))
        {
          qmemcpy(buf, "ABCDEFGHIJABCDEFGHIJ", 20);
          objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 20), *(void *)off_2645B7998);
          [v23 removeObjectForKey:*(void *)off_2645B7938];
        }
        else
        {
          uint64_t v24 = *(void *)off_2645B7998;
          if (![v23 objectForKeyedSubscript:*(void *)off_2645B7998])
          {
            qmemcpy(buf, "ABCDEFGHIJABCDEFGHIJ", 20);
            objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 20), v24);
          }
        }
        pidToRelayConnectionDataMap = self->_pidToRelayConnectionDataMap;
        objc_sync_enter(pidToRelayConnectionDataMap);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pidToRelayConnectionDataMap, "setObject:forKeyedSubscript:", v23, [@"<" stringByAppendingString:v32]);
        objc_sync_exit(pidToRelayConnectionDataMap);
        global_queue = dispatch_get_global_queue(0, 0);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __104__GKConnectionInternal_internalUpdateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke;
        v29[3] = &unk_2645B7C68;
        v29[4] = self;
        v29[5] = v32;
        dispatch_async(global_queue, v29);
        return;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        int v20 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = sel_getName(a2);
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[GKConnectionInternal internalUpdateRelayWithParticipant:withConnectionData:withRelayIn"
                                "fo:didInitiate:]";
          __int16 v34 = 1024;
          int v35 = 1820;
          __int16 v36 = 2080;
          Name = v21;
          _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - checking intended target via data", buf, 0x26u);
        }
      }
      __int16 v22 = (void *)[a5 objectForKeyedSubscript:*(void *)off_2645B7930];
      int v31 = -1431655766;
      char v30 = 0;
      [v22 bytes];
      [v22 length];
      ICEGetCallInfoForConnectionData();
      if (*(&self->super._pid + 1) == -1431655766) {
        goto LABEL_16;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        int v28 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v27;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[GKConnectionInternal internalUpdateRelayWithParticipant:withConnectionData:withRelayIn"
                                "fo:didInitiate:]";
          __int16 v34 = 1024;
          int v35 = 1826;
          _os_log_impl(&dword_221563000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d this update not for me", buf, 0x1Cu);
        }
      }
    }
  }
}

uint64_t __104__GKConnectionInternal_internalUpdateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doRelayCheckForRemotePeerID:*(void *)(a1 + 40)];
}

- (void)updateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  if (a5)
  {
    BOOL v6 = a6;
    p_pidToConnectTimeoutSource = &self->_pidToConnectTimeoutSource;
    pthread_mutex_lock((pthread_mutex_t *)&self->_pidToConnectTimeoutSource);
    id v12 = (id)[objc_alloc(NSDictionary) initWithDictionary:a5 copyItems:1];
    if ([(NSMutableDictionary *)self->_initRelayQueue objectForKeyedSubscript:a3])
    {
      __int16 v13 = [(GKConnectionInternal *)self asyncWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __96__GKConnectionInternal_updateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke;
      block[3] = &unk_2645B8040;
      block[4] = self;
      block[5] = a3;
      block[6] = a4;
      block[7] = v12;
      BOOL v17 = v6;
      dispatch_async(v13, block);
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v15 = v14;
      if (a4) {
        [v14 setObject:a4 forKeyedSubscript:@"participantConnectionData"];
      }
      if (v12) {
        [v15 setObject:v12 forKeyedSubscript:@"relayInfo"];
      }
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v6), @"didInitiate");
      [(NSMutableDictionary *)self->_initRelayQueue setObject:v15 forKeyedSubscript:a3];
    }
    pthread_mutex_unlock((pthread_mutex_t *)p_pidToConnectTimeoutSource);
  }
}

uint64_t __96__GKConnectionInternal_updateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) internalUpdateRelayWithParticipant:*(void *)(a1 + 40) withConnectionData:*(void *)(a1 + 48) withRelayInfo:*(void *)(a1 + 56) didInitiate:*(unsigned __int8 *)(a1 + 64)];
}

- (void)cancelConnectParticipant:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        id v7 = "<nil>";
      }
      *(_DWORD *)uint64_t v8 = 136315906;
      *(void *)&v8[4] = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[GKConnectionInternal cancelConnectParticipant:]";
      __int16 v11 = 1024;
      int v12 = 1887;
      __int16 v13 = 2080;
      id v14 = v7;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cancel-connect-participant.%s", v8, 0x26u);
    }
  }
  *(void *)uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  if ([(GKConnectionInternal *)self convertParticipantID:a3 toPeerID:v8])
  {
    [*(id *)v8 intValue];
    GCKSessionIsParticipantConnected();
  }
}

- (id)networkStatisticsDictionaryForGCKStats:(void *)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = (void *)[(NSMutableArray *)self->_allowRelayPIDList allKeys];
  id v31 = (id)[(NSMutableArray *)self->_allowRelayPIDList allKeys];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  uint64_t v28 = [v5 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        id v7 = *(void **)(*((void *)&v36 + 1) + 8 * v6);
        id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        char v30 = v8;
        [v9 setObject:v8 forKeyedSubscript:@"GKSStatsLinks"];
        [v27 setObject:v9 forKeyedSubscript:v7];
        if (a3)
        {
          uint64_t v10 = (unsigned int *)a3;
          do
          {
            int v11 = *v10;
            if (v11 == [v7 intValue])
            {
              long long v34 = 0u;
              long long v35 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              uint64_t v12 = [v31 countByEnumeratingWithState:&v32 objects:v42 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v33;
                do
                {
                  uint64_t v15 = 0;
                  do
                  {
                    if (*(void *)v33 != v14) {
                      objc_enumerationMutation(v31);
                    }
                    int v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
                    BOOL v17 = a3;
                    while (1)
                    {
                      unsigned int v18 = v10[17];
                      if (v18 == [v16 intValue]
                        && ([v7 isEqual:v16] & 1) == 0)
                      {
                        break;
                      }
                      BOOL v17 = (void *)v17[18];
                      if (!v17) {
                        goto LABEL_20;
                      }
                    }
                    v40[0] = @"GKSStatsUpTime";
                    LODWORD(v19) = v10[10];
                    v41[0] = [NSNumber numberWithFloat:v19];
                    v40[1] = @"GKSStatsRecvRate";
                    LODWORD(v20) = v10[11];
                    v41[1] = [NSNumber numberWithFloat:v20];
                    v40[2] = @"GKSStatsSendRate";
                    LODWORD(v21) = v10[12];
                    v41[2] = [NSNumber numberWithFloat:v21];
                    v40[3] = @"GKSStatsRecvPLR";
                    LODWORD(v22) = v10[13];
                    v41[3] = [NSNumber numberWithFloat:v22];
                    v40[4] = @"GKSStatsSendPLR";
                    LODWORD(v23) = v10[14];
                    v41[4] = [NSNumber numberWithFloat:v23];
                    v40[5] = @"GKSStatsRecvBWE";
                    v41[5] = [NSNumber numberWithUnsignedInt:v10[8]];
                    v40[6] = @"GKSStatsSendBWE";
                    v41[6] = [NSNumber numberWithUnsignedInt:v10[9]];
                    v40[7] = @"GKSStatsRTT";
                    v41[7] = [NSNumber numberWithUnsignedInt:v10[3]];
                    v40[8] = @"GKSStatsBytesReceived";
                    v41[8] = [NSNumber numberWithUnsignedLongLong:*((void *)v10 + 2)];
                    v40[9] = @"GKSStatsBytesSent";
                    v41[9] = [NSNumber numberWithUnsignedLongLong:*((void *)v10 + 3)];
                    objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 10), v16);
LABEL_20:
                    ++v15;
                  }
                  while (v15 != v13);
                  uint64_t v13 = [v31 countByEnumeratingWithState:&v32 objects:v42 count:16];
                }
                while (v13);
              }
            }
            uint64_t v10 = (unsigned int *)*((void *)v10 + 18);
          }
          while (v10);
        }
        uint64_t v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v28);
  }
  return v27;
}

- (id)networkStatistics
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = (void *)[(NSMutableArray *)self->_allowRelayPIDList allKeys];
  uint64_t v4 = (void *)[(NSMutableArray *)self->_allowRelayPIDList allKeys];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = [v3 countByEnumeratingWithState:&v24 objects:v35 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v3);
        }
        uint64_t v19 = v5;
        uint64_t v6 = *(void **)(*((void *)&v24 + 1) + 8 * v5);
        v31[0] = @"GKSStatsRecvRate";
        v31[1] = @"GKSStatsSendRate";
        v32[0] = &unk_26D3A4148;
        v32[1] = &unk_26D3A4148;
        long long v33 = @"fake0";
        uint64_t v34 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
        uint64_t v7 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v9 setObject:v7 forKeyedSubscript:@"GKSStatsInterfaces"];
        [v9 setObject:v8 forKeyedSubscript:@"GKSStatsLinks"];
        [v17 setObject:v9 forKeyedSubscript:v6];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v10 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v4);
              }
              uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              if (([v6 isEqual:v14] & 1) == 0)
              {
                v28[0] = @"GKSStatsUpTime";
                v28[1] = @"GKSStatsBytesReceived";
                v29[0] = &unk_26D3A4158;
                v29[1] = &unk_26D3A40D0;
                _DWORD v28[2] = @"GKSStatsBytesSent";
                v28[3] = @"GKSStatsRecvRate";
                v29[2] = &unk_26D3A40D0;
                v29[3] = &unk_26D3A4168;
                v28[4] = @"GKSStatsSendRate";
                v29[4] = &unk_26D3A4168;
                objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 5), v14);
              }
            }
            uint64_t v11 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
          }
          while (v11);
        }
        uint64_t v5 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [v3 countByEnumeratingWithState:&v24 objects:v35 count:16];
    }
    while (v18);
  }
  return v17;
}

- (BOOL)localGamingCheckEstablishConnection:(id)a3 connectionData:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [a3 unsignedLongValue];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      int v14 = 136316162;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      id v17 = "-[GKConnectionInternal localGamingCheckEstablishConnection:connectionData:]";
      __int16 v18 = 1024;
      int v19 = 2003;
      __int16 v20 = 2080;
      long long v21 = v7;
      __int16 v22 = 1024;
      int v23 = [a4 length];
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteConnectionData: [%s], total size=%u", (uint8_t *)&v14, 0x2Cu);
    }
  }
  if ((unint64_t)[a4 length] >= 5)
  {
    unsigned int v8 = bswap32(*(_DWORD *)[a4 bytes]);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        }
        else {
          uint64_t v11 = "<nil>";
        }
        int v12 = [a4 length];
        int v14 = 136316418;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        id v17 = "-[GKConnectionInternal localGamingCheckEstablishConnection:connectionData:]";
        __int16 v18 = 1024;
        int v19 = 2007;
        __int16 v20 = 2080;
        long long v21 = v11;
        __int16 v22 = 1024;
        int v23 = v12;
        __int16 v24 = 1024;
        unsigned int v25 = v8;
        _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteConnectionData: [%s], total size=%u (expect %u)", (uint8_t *)&v14, 0x32u);
      }
    }
    if ([a4 length] - 4 >= (unint64_t)v8)
    {
      TimingLog(3, 0, (uint64_t)"local CDX done - starting ICE");
      [a4 bytes];
      [a4 length];
      GCKSessionEstablishConnection();
    }
  }
  return 0;
}

- (void)localGamingReceiveDataHandler:(id)a3 data:(id)a4 time:(double)a5 error:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (!a4 || a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (a6) {
          id v17 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
        }
        else {
          id v17 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v36 = v15;
        __int16 v37 = 2080;
        long long v38 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
        __int16 v39 = 1024;
        int v40 = 2030;
        __int16 v41 = 2080;
        *(void *)__int16 v42 = v17;
        _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localGamingReceiveDataHandler: error=[%s].  Invalidating..", buf, 0x26u);
      }
    }
    [a3 invalidate];
  }
  else
  {
    uint64_t v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_localGamingSocketToPIDMap, "objectForKeyedSubscript:", [a3 socketName]);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v11)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        int v14 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v36 = v13;
          __int16 v37 = 2080;
          long long v38 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
          __int16 v39 = 1024;
          int v40 = 2042;
          __int16 v41 = 2080;
          *(void *)__int16 v42 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
          *(_WORD *)&v42[8] = 2080;
          *(void *)&v42[10] = objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
          *(_WORD *)&v42[18] = 1024;
          *(_DWORD *)&v42[20] = [a4 length];
          __int16 v43 = 2048;
          double v44 = a5;
          _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localGamingReceiveDataHandler: got [%s] (append to [%s]), size=%u, t=%.6lf", buf, 0x40u);
        }
      }
      [v11 appendData:a4];
    }
    else
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        int v19 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v36 = v18;
          __int16 v37 = 2080;
          long long v38 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
          __int16 v39 = 1024;
          int v40 = 2038;
          __int16 v41 = 2080;
          *(void *)__int16 v42 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
          *(_WORD *)&v42[8] = 1024;
          *(_DWORD *)&v42[10] = [a4 length];
          *(_WORD *)&v42[14] = 2048;
          *(double *)&v42[16] = a5;
          _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localGamingReceiveDataHandler: got [%s], size=%u, t=%.6lf", buf, 0x36u);
        }
      }
      uint64_t v11 = (void *)[MEMORY[0x263EFF990] dataWithData:a4];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localGamingSocketToPIDMap, "setObject:forKeyedSubscript:", v11, [a3 socketName]);
    }
    __int16 v20 = (void *)-[OS_dispatch_source objectForKeyedSubscript:](self->_localGamingCDXListenSource, "objectForKeyedSubscript:", [a3 socketName]);
    if (v20)
    {
      long long v21 = v20;
      [v20 unsignedLongValue];
      if ([(GKConnectionInternal *)self localGamingCheckEstablishConnection:v21 connectionData:v11])
      {
        -[OS_dispatch_source removeObjectForKey:](self->_localGamingCDXListenSource, "removeObjectForKey:", [a3 socketName]);
        -[NSMutableDictionary removeObjectForKey:](self->_localGamingSocketToPIDMap, "removeObjectForKey:", [a3 socketName]);
        dispatch_time_t v22 = dispatch_time(0, 10000000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __70__GKConnectionInternal_localGamingReceiveDataHandler_data_time_error___block_invoke;
        block[3] = &unk_2645B7C20;
        block[4] = a3;
        dispatch_after(v22, MEMORY[0x263EF83A0], block);
      }
    }
    else if ((unint64_t)[v11 length] > 3)
    {
      uint64_t v24 = bswap32(*(_DWORD *)[v11 bytes]);
      uint64_t v25 = [NSNumber numberWithUnsignedInt:v24];
      -[OS_dispatch_source setObject:forKeyedSubscript:](self->_localGamingCDXListenSource, "setObject:forKeyedSubscript:", v25, [a3 socketName]);
      objc_msgSend(v11, "replaceBytesInRange:withBytes:length:", 0, 4, 0, 0);
      if ((int)VRTraceGetErrorLogLevelForModule() > 6)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        long long v27 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          localGamingSocketToConnectionDataMap = self->_localGamingSocketToConnectionDataMap;
          if (localGamingSocketToConnectionDataMap) {
            uint64_t v29 = (const char *)objc_msgSend((id)-[NSMutableDictionary description](localGamingSocketToConnectionDataMap, "description"), "UTF8String");
          }
          else {
            uint64_t v29 = "<nil>";
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v36 = v26;
          __int16 v37 = 2080;
          long long v38 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
          __int16 v39 = 1024;
          int v40 = 2064;
          __int16 v41 = 1024;
          *(_DWORD *)__int16 v42 = v24;
          *(_WORD *)&v42[4] = 2080;
          *(void *)&v42[6] = v29;
          _os_log_impl(&dword_221563000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Checking if peer (%08X) is in prepared set [%s]", buf, 0x2Cu);
        }
      }
      if (![(NSMutableDictionary *)self->_localGamingSocketToConnectionDataMap containsObject:v25])
      {
        uint64_t v34 = 0;
        int v33 = 1350;
        TimingLog(3, 0, (uint64_t)"local CDX start\n");
        GCKSessionPrepareConnectionWithRelayInfo();
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        id v31 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v36 = v30;
          __int16 v37 = 2080;
          long long v38 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
          __int16 v39 = 1024;
          int v40 = 2066;
          __int16 v41 = 1024;
          *(_DWORD *)__int16 v42 = v24;
          _os_log_impl(&dword_221563000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Already prepared conenction for peer (%08X) - cancel this localCDX socket", buf, 0x22u);
        }
      }
      [a3 invalidate];
      -[OS_dispatch_source removeObjectForKey:](self->_localGamingCDXListenSource, "removeObjectForKey:", [a3 socketName]);
      -[NSMutableDictionary removeObjectForKey:](self->_localGamingSocketToPIDMap, "removeObjectForKey:", [a3 socketName]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:](v23, a4);
      }
    }
  }
}

uint64_t __70__GKConnectionInternal_localGamingReceiveDataHandler_data_time_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)startListeningForLocalGamingCDX
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (HIDWORD(self->_updateRelayQueue) != -1) {
    return 1;
  }
  *(void *)&v44.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v44.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  int v4 = socket(2, 1, 6);
  HIDWORD(self->_updateRelayQueue) = v4;
  if (v4 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKConnectionInternal startListeningForLocalGamingCDX]();
      }
    }
  }
  else
  {
    int v5 = 0;
    *(void *)&v44.sa_data[6] = 0;
    *(_WORD *)&v44.sa_len = 528;
    *(_DWORD *)&v44.sa_data[2] = 0;
    uint64_t v6 = (unsigned char *)MEMORY[0x263F21088];
    uint64_t v7 = (os_log_t *)MEMORY[0x263F21098];
    uint64_t v8 = 512;
    while (1)
    {
      *(_WORD *)((char *)&self->super.super.isa + v8) = 16470 - v5;
      *(_WORD *)v44.sa_unsigned int data = bswap32(16470 - v5) >> 16;
      if (bind(HIDWORD(self->_updateRelayQueue), &v44, 0x10u) != -1) {
        break;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *v7;
        uint64_t v11 = *v7;
        if (*v6)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = v6;
            uint64_t v13 = v7;
            int v14 = *(unsigned __int16 *)((char *)&self->super.super.isa + v8);
            int v15 = *__error();
            *(_DWORD *)buf = 136316162;
            uint64_t v35 = v9;
            __int16 v36 = 2080;
            __int16 v37 = "-[GKConnectionInternal startListeningForLocalGamingCDX]";
            __int16 v38 = 1024;
            int v39 = 2130;
            __int16 v40 = 1024;
            int v41 = v14;
            uint64_t v7 = v13;
            uint64_t v6 = v12;
            __int16 v42 = 1024;
            int v43 = v15;
            _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bind() to port %u failed for local gaming CDX (%d), retrying...", buf, 0x28u);
          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = v8;
          id v17 = v6;
          uint64_t v18 = v7;
          int v19 = *(unsigned __int16 *)((char *)&self->super.super.isa + v16);
          int v20 = *__error();
          *(_DWORD *)buf = 136316162;
          uint64_t v35 = v9;
          __int16 v36 = 2080;
          __int16 v37 = "-[GKConnectionInternal startListeningForLocalGamingCDX]";
          __int16 v38 = 1024;
          int v39 = 2130;
          __int16 v40 = 1024;
          int v41 = v19;
          uint64_t v7 = v18;
          uint64_t v6 = v17;
          uint64_t v8 = v16;
          __int16 v42 = 1024;
          int v43 = v20;
          _os_log_debug_impl(&dword_221563000, v10, OS_LOG_TYPE_DEBUG, " [%s] %s:%d bind() to port %u failed for local gaming CDX (%d), retrying...", buf, 0x28u);
        }
      }
      if (++v5 == 10)
      {
        int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (ErrorLogLevelForModule >= 8)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          uint64_t v23 = v6;
          uint64_t v24 = v22;
          uint64_t v25 = *v7;
          uint64_t v26 = *v7;
          if (*v23)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              int v27 = *__error();
              *(_DWORD *)buf = 136315906;
              uint64_t v35 = v24;
              __int16 v36 = 2080;
              __int16 v37 = "-[GKConnectionInternal startListeningForLocalGamingCDX]";
              __int16 v38 = 1024;
              int v39 = 2133;
              __int16 v40 = 1024;
              int v41 = v27;
              _os_log_impl(&dword_221563000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bind() failed for local gaming CDX (%d), trying ANY...", buf, 0x22u);
            }
          }
          else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            -[GKConnectionInternal startListeningForLocalGamingCDX].cold.6();
          }
        }
        *(_WORD *)v44.sa_unsigned int data = 0;
        if (bind(HIDWORD(self->_updateRelayQueue), &v44, 0x10u) == -1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
              -[GKConnectionInternal startListeningForLocalGamingCDX]();
            }
          }
          *(_WORD *)((char *)&self->super.super.isa + v8) = 0;
          goto LABEL_44;
        }
        *(_DWORD *)buf = 16;
        if (getsockname(HIDWORD(self->_updateRelayQueue), &v44, (socklen_t *)buf) == -1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
              -[GKConnectionInternal startListeningForLocalGamingCDX]();
            }
          }
          goto LABEL_44;
        }
        *(_WORD *)((char *)&self->super.super.isa + v8) = bswap32(*(unsigned __int16 *)v44.sa_data) >> 16;
        break;
      }
    }
    if (listen(HIDWORD(self->_updateRelayQueue), 4) == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
          -[GKConnectionInternal startListeningForLocalGamingCDX].cold.4();
        }
      }
    }
    else
    {
      uint64_t v28 = dispatch_source_create(MEMORY[0x263EF83E8], SHIDWORD(self->_updateRelayQueue), 0, MEMORY[0x263EF83A0]);
      *(void *)&self->_localGamingCDXPort = v28;
      if (v28)
      {
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __55__GKConnectionInternal_startListeningForLocalGamingCDX__block_invoke;
        handler[3] = &unk_2645B7C20;
        handler[4] = self;
        dispatch_source_set_event_handler(v28, handler);
        dispatch_resume(*(dispatch_object_t *)&self->_localGamingCDXPort);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          uint64_t v30 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            int v31 = *(unsigned __int16 *)((char *)&self->super.super.isa + v8);
            *(_DWORD *)buf = 136315906;
            uint64_t v35 = v29;
            __int16 v36 = 2080;
            __int16 v37 = "-[GKConnectionInternal startListeningForLocalGamingCDX]";
            __int16 v38 = 1024;
            int v39 = 2192;
            __int16 v40 = 1024;
            int v41 = v31;
            _os_log_impl(&dword_221563000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d startListeningForLocalGamingCDX: listening on %u", buf, 0x22u);
          }
        }
        return 1;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
          -[GKConnectionInternal startListeningForLocalGamingCDX].cold.5();
        }
      }
    }
  }
LABEL_44:
  int updateRelayQueue_high = HIDWORD(self->_updateRelayQueue);
  if (updateRelayQueue_high == -1) {
    return 0;
  }
  close(updateRelayQueue_high);
  BOOL result = 0;
  HIDWORD(self->_updateRelayQueue) = -1;
  return result;
}

GKAsyncSocket *__55__GKConnectionInternal_startListeningForLocalGamingCDX__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)&buf[0].sa_len = 136315650;
      *(void *)&buf[0].sa_data[2] = v2;
      *(_WORD *)&buf[0].sa_data[10] = 2080;
      *(void *)&buf[0].sa_data[12] = "-[GKConnectionInternal startListeningForLocalGamingCDX]_block_invoke";
      *(_WORD *)&buf[1].sa_data[4] = 1024;
      *(_DWORD *)&buf[1].sa_data[6] = 2162;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _localGamingCDXListenSource callback", &buf[0].sa_len, 0x1Cu);
    }
  }
  *(void *)&v4.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v4.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  buf[6] = v4;
  buf[7] = v4;
  uint8_t buf[4] = v4;
  buf[5] = v4;
  buf[2] = v4;
  buf[3] = v4;
  buf[0] = v4;
  buf[1] = v4;
  socklen_t v13 = 128;
  BOOL result = (GKAsyncSocket *)accept(*(_DWORD *)(*(void *)(a1 + 32) + 508), buf, &v13);
  if (result != -1)
  {
    uint64_t v6 = result;
    TimingLog(3, 0, (uint64_t)"starting local CDX tcp connection (accept)");
    BOOL result = objc_alloc_init(GKAsyncSocket);
    if (result)
    {
      uint64_t v7 = result;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__GKConnectionInternal_startListeningForLocalGamingCDX__block_invoke_255;
      v12[3] = &unk_2645B7F58;
      v12[4] = *(void *)(a1 + 32);
      v12[5] = result;
      [(GKAsyncSocket *)result setReceiveDataHandler:v12];
      *(void *)((char *)v19 + 14) = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v19[0] = v8;
      long long v17 = v8;
      long long v18 = v8;
      unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
      long long v14 = v8;
      long long v15 = v8;
      uint64_t v9 = NSString;
      uint64_t v10 = *(unsigned int *)(*(void *)(a1 + 32) + 20);
      SAToIPPORT();
      [v7 setSocketName:objc_msgSend(v9, "stringWithFormat:", @"localCDX[%u][%08X] (connect-from[%s]) (ptr=%p) (listener)", v10, v10, IPPORTToStringWithSize(), v7)];
      [v7 setTargetQueue:MEMORY[0x263EF83A0]];
      [v7 tcpAttachSocketDescriptor:v6];
      unsigned int v11 = bswap32(*(_DWORD *)(*(void *)(a1 + 32) + 20));
      return (GKAsyncSocket *)objc_msgSend(v7, "sendData:withCompletionHandler:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", &v11, 4), 0);
    }
  }
  return result;
}

uint64_t __55__GKConnectionInternal_startListeningForLocalGamingCDX__block_invoke_255(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "localGamingReceiveDataHandler:data:time:error:", *(void *)(a1 + 40), a2, a3);
}

- (id)getLocalConnectionDataForLocalGaming
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  uint64_t v3 = (void *)[MEMORY[0x263EFF990] data];
  char v17 = -86;
  [(GKConnectionInternal *)self startListeningForLocalGamingCDX];
  unsigned int v19 = bswap32(*(&self->super._pid + 1));
  objc_msgSend(v3, "appendData:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", &v19, 4));
  __int16 v18 = bswap32(LOWORD(self->_fPreReleased)) >> 16;
  objc_msgSend(v3, "appendData:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", &v18, 2));
  int LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v6 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    long long v8 = *v6;
    uint64_t v9 = *v6;
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v7;
        __int16 v23 = 2080;
        uint64_t v24 = "-[GKConnectionInternal getLocalConnectionDataForLocalGaming]";
        __int16 v25 = 1024;
        int v26 = 2227;
        __int16 v27 = 1024;
        int v28 = LocalInterfaceListWithOptions;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d After GetLocalInterfaceListWithOptions iNumInt=%d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[GKConnectionInternal getLocalConnectionDataForLocalGaming]();
    }
  }
  if (LocalInterfaceListWithOptions >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = v20;
      if (strcmp((const char *)(v20 + v10 + 4), "lo0") && (*(unsigned char *)(v11 + v10) & 1) == 0)
      {
        char v17 = 4;
        objc_msgSend(v3, "appendData:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", &v17, 1));
        *(_DWORD *)buf = -1431655766;
        *(_DWORD *)buf = bswap32(*(_DWORD *)(v20 + v10 + 20));
        objc_msgSend(v3, "appendData:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 4));
      }
      v10 += 40;
    }
    while (40 * LocalInterfaceListWithOptions != v10);
  }
  FreeLocalInterfaceList();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    socklen_t v13 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v3 length];
      if (v3) {
        long long v15 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      }
      else {
        long long v15 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v12;
      __int16 v23 = 2080;
      uint64_t v24 = "-[GKConnectionInternal getLocalConnectionDataForLocalGaming]";
      __int16 v25 = 1024;
      int v26 = 2248;
      __int16 v27 = 1024;
      int v28 = v14;
      __int16 v29 = 2080;
      uint64_t v30 = v15;
      _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d getLocalConnectionDataForLocalGaming returned %d bytes (%s)", buf, 0x2Cu);
    }
  }
  return v3;
}

- (NSMutableDictionary)pidToConnectTimeoutSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPidToConnectTimeoutSource:(id)a3
{
}

- (opaqueRTCReporting)reportingAgent
{
  return (opaqueRTCReporting *)self->_pidsPreparedForConnection;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  self->_pidsPreparedForConnection = (NSMutableSet *)a3;
}

- (CDXClient)cdxClient
{
  return (CDXClient *)self->_eventDelegate;
}

- (NSMutableDictionary)cdxSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCdxSessions:(id)a3
{
}

- (void)initWithParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Error in GCKSessionCreate.", v2, v3, v4, v5, v6);
}

- (void)getLocalConnectionDataWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  [a2 length];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_221563000, v2, v3, " [%s] %s:%d Got local connection data size=%lu", v4, v5, v6, v7, 2u);
}

- (void)connectPendingConnectionsFromList:(uint64_t)a1 sessionInfo:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_221563000, v2, v3, " [%s] %s:%d connectPendingConnections: sessionInfo: %s", v4, v5, v6, v7, 2u);
}

- (void)connectParticipantsWithConnectionData:withSessionInfo:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d CANNOT CREATE DISPATCH GROUP", v2, v3, v4, v5, v6);
}

- (void)connectParticipantsWithConnectionData:(uint64_t)a3 withSessionInfo:(os_log_t)log .cold.2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 874;
  *((_WORD *)buf + 14) = 2080;
  *(void *)(buf + 30) = a1;
  _os_log_error_impl(&dword_221563000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Participant connection data NOT found for %s", buf, 0x26u);
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_200_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Unable to create timer dispatch source", v2, v3, v4, v5, v6);
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_200_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13_0();
  _os_log_fault_impl(&dword_221563000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Unable to create timer dispatch source", v1, 0x1Cu);
}

- (void)internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[GKConnectionInternal internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_1(&dword_221563000, v0, (uint64_t)v0, " [%s] %s:%d GCKSessionPrepareConnection FAILED(%08X)", v1);
}

- (void)addEvent:remotePeer:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)setEventDelegate:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)eventDelegate
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)gckPID
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)createInsecureTicketUsingSortedConnectionsFromList:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_1(&dword_221563000, v0, (uint64_t)v0, " [%s] %s:%d Unable to generate ticket! error = %d", v1);
}

- (void)CDXClientSession:receivedData:from:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[GKConnectionInternal CDXClientSession:receivedData:from:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_1(&dword_221563000, v0, (uint64_t)v0, " [%s] %s:%d GKConnection: GCKSessionEstablishConnection failed (%08X)", v1);
}

void __106__GKConnectionInternal_internalInitiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_1(&dword_221563000, v0, (uint64_t)v0, " [%s] %s:%d Cannot get relay candidates (%08X)", v1);
}

- (void)localGamingReceiveDataHandler:(uint64_t)a1 data:(void *)a2 time:error:.cold.1(uint64_t a1, void *a2)
{
  [a2 length];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_221563000, v2, v3, " [%s] %s:%d expecting at least 4 bytes of data (%d)", v4, v5, v6, v7, 2u);
}

- (void)startListeningForLocalGamingCDX
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = *MEMORY[0x263EF8340];
  __error();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  _os_log_debug_impl(&dword_221563000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d bind() failed for local gaming CDX (%d), trying ANY...", v1, 0x22u);
}

- (void)getLocalConnectionDataForLocalGaming
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[GKConnectionInternal getLocalConnectionDataForLocalGaming]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_221563000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d After GetLocalInterfaceListWithOptions iNumInt=%d", v1, 0x22u);
}

@end