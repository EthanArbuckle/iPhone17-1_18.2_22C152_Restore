@interface GKDiscoveryPeer
- (BOOL)parseServiceNameForInit:(id)a3;
- (BOOL)shouldSignalDiscovery;
- (GKDiscoveryPeer)initWithServiceName:(id)a3;
- (GKDiscoveryPeerConnection)connection;
- (GKDiscoveryPeerConnection)trialConnection;
- (GKSimpleTimer)resolveTimer;
- (NSMutableArray)attemptedInterfaces;
- (NSMutableArray)orderedInterfaces;
- (NSMutableArray)sendDataBuffer;
- (NSMutableSet)interfaces;
- (NSNumber)chosenInterface;
- (NSString)deviceID;
- (NSString)playerID;
- (NSString)serviceName;
- (OS_dispatch_queue)syncQueue;
- (double)discoveryTimeStamp;
- (id)description;
- (id)nextInterfaceIndex;
- (id)resolveTimeoutHandler;
- (id)stringForState:(int)a3;
- (int)state;
- (void)cleanUpForBrowse;
- (void)dealloc;
- (void)didLoseInterface:(id)a3;
- (void)flushDataBuffer;
- (void)invalidate;
- (void)sendData:(id)a3 withCompletionHandler:(id)a4;
- (void)setAttemptedInterfaces:(id)a3;
- (void)setChosenInterface:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDiscoveryTimeStamp:(double)a3;
- (void)setInterfaces:(id)a3;
- (void)setOrderedInterfaces:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setResolveTimeoutHandler:(id)a3;
- (void)setResolveTimer:(id)a3;
- (void)setSendDataBuffer:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setShouldSignalDiscovery:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setTrialConnection:(id)a3;
- (void)startResolveTimerWithHandler:(id)a3;
- (void)stopResolveTimer;
- (void)timeout:(id)a3;
@end

@implementation GKDiscoveryPeer

- (BOOL)parseServiceNameForInit:(id)a3
{
  if (a3)
  {
    -[GKDiscoveryPeer setServiceName:](self, "setServiceName:");
    v4 = (void *)[MEMORY[0x263F08B08] scannerWithString:self->_serviceName];
    id v8 = 0;
    int v5 = [v4 scanUpToString:@"+" intoString:&v8];
    if (v5)
    {
      [v4 scanString:@"+" intoString:0];
      id v7 = 0;
      [v4 scanUpToString:@"+" intoString:&v7];
      self->_deviceID = (NSString *)v8;
      self->_playerID = (NSString *)v7;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (GKDiscoveryPeer)initWithServiceName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKDiscoveryPeer;
  v4 = [(GKDiscoveryPeer *)&v7 init];
  int v5 = v4;
  if (v4)
  {
    if ([(GKDiscoveryPeer *)v4 parseServiceNameForInit:a3])
    {
      v5->_interfaces = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      v5->_orderedInterfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v5->_attemptedInterfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v5->_shouldSignalDiscovery = 1;
      v5->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[a3 UTF8String], 0);
      v5->_sendDataBuffer = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v5->_state = 0;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    int v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      Name = sel_getName(a2);
      serviceName = self->_serviceName;
      if (serviceName) {
        id v8 = [[(NSString *)serviceName description] UTF8String];
      }
      else {
        id v8 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      v14 = "-[GKDiscoveryPeer dealloc]";
      __int16 v15 = 1024;
      int v16 = 166;
      __int16 v17 = 2080;
      v18 = Name;
      __int16 v19 = 2080;
      v20 = v8;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: peer[%s] -dealloc", buf, 0x30u);
    }
  }

  syncQueue = self->_syncQueue;
  if (syncQueue) {
    dispatch_release(syncQueue);
  }

  self->_connection = 0;
  [(GKSimpleTimer *)self->_resolveTimer invalidate];

  self->_resolveTimer = 0;
  v10.receiver = self;
  v10.super_class = (Class)GKDiscoveryPeer;
  [(GKDiscoveryPeer *)&v10 dealloc];
}

- (id)stringForState:(int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3 < 4) {
    return off_2645B8100[a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    objc_super v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryPeer *)self serviceName]) {
        id v8 = [[(NSString *)[(GKDiscoveryPeer *)self serviceName] description] UTF8String];
      }
      else {
        id v8 = "<nil>";
      }
      int v9 = 136316162;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      uint64_t v12 = "-[GKDiscoveryPeer stringForState:]";
      __int16 v13 = 1024;
      int v14 = 209;
      __int16 v15 = 2080;
      int v16 = v8;
      __int16 v17 = 1024;
      int v18 = a3;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] unrecognized state [%d]", (uint8_t *)&v9, 0x2Cu);
    }
  }
  return @"unknown";
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"GKDiscoveryPeer: [deviceID = %@] [playerID = %@] [state = %@] [signal discovery = %d] [interfaces = %@] [chosenInterface = %@]", -[GKDiscoveryPeer deviceID](self, "deviceID"), -[GKDiscoveryPeer playerID](self, "playerID"), -[GKDiscoveryPeer stringForState:](self, "stringForState:", -[GKDiscoveryPeer state](self, "state")), -[GKDiscoveryPeer shouldSignalDiscovery](self, "shouldSignalDiscovery"), objc_msgSend((id)-[NSMutableSet allObjects](-[GKDiscoveryPeer interfaces](self, "interfaces"), "allObjects"), "componentsJoinedByString:", @",", -[GKDiscoveryPeer chosenInterface](self, "chosenInterface")];
}

- (void)setState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t state = self->_state;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    objc_super v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryPeer *)self serviceName]) {
        id v8 = [[(NSString *)[(GKDiscoveryPeer *)self serviceName] description] UTF8String];
      }
      else {
        id v8 = "<nil>";
      }
      if ([(GKDiscoveryPeer *)self stringForState:state]) {
        int v9 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryPeer stringForState:](self, "stringForState:", state), "description"), "UTF8String");
      }
      else {
        int v9 = "<nil>";
      }
      if ([(GKDiscoveryPeer *)self stringForState:v3]) {
        uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryPeer stringForState:](self, "stringForState:", v3), "description"), "UTF8String");
      }
      else {
        uint64_t v10 = "<nil>";
      }
      int v11 = 136316418;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      int v14 = "-[GKDiscoveryPeer setState:]";
      __int16 v15 = 1024;
      int v16 = 230;
      __int16 v17 = 2080;
      int v18 = v8;
      __int16 v19 = 2080;
      v20 = v9;
      __int16 v21 = 2080;
      v22 = v10;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] changing state from '%s' to '%s'", (uint8_t *)&v11, 0x3Au);
    }
  }
  self->_uint64_t state = v3;
}

- (id)nextInterfaceIndex
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  orderedInterfaces = self->_orderedInterfaces;
  uint64_t v4 = [(NSMutableArray *)orderedInterfaces countByEnumeratingWithState:&v16 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(orderedInterfaces);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([(NSMutableArray *)self->_attemptedInterfaces containsObject:v8] & 1) == 0)
        {
          [(NSMutableArray *)self->_attemptedInterfaces addObject:v8];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)orderedInterfaces countByEnumeratingWithState:&v16 objects:v32 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      if (serviceName) {
        uint64_t v12 = [[(NSString *)serviceName description] UTF8String];
      }
      else {
        uint64_t v12 = "<nil>";
      }
      if ([(NSMutableArray *)self->_orderedInterfaces description]) {
        __int16 v13 = (const char *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray description](self->_orderedInterfaces, "description"), "description"), "UTF8String");
      }
      else {
        __int16 v13 = "<nil>";
      }
      if ([v8 description]) {
        int v14 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "description"), "description"), "UTF8String");
      }
      else {
        int v14 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = v9;
      __int16 v22 = 2080;
      uint64_t v23 = "-[GKDiscoveryPeer nextInterfaceIndex]";
      __int16 v24 = 1024;
      int v25 = 247;
      __int16 v26 = 2080;
      v27 = v12;
      __int16 v28 = 2080;
      v29 = v13;
      __int16 v30 = 2080;
      v31 = v14;
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] _orderedInterfaces = %s next interface to resolve on = %s", buf, 0x3Au);
    }
  }
  if (v8) {
    [(NSMutableArray *)self->_orderedInterfaces removeObject:v8];
  }
  return v8;
}

- (void)startResolveTimerWithHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v5 = micro();
  if (!a3 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    objc_super v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      __int16 v15 = "-[GKDiscoveryPeer startResolveTimerWithHandler:]";
      __int16 v16 = 1024;
      int v17 = 260;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timeoutHandler is nil", (uint8_t *)&v12, 0x1Cu);
    }
  }
  -[GKDiscoveryPeer setResolveTimeoutHandler:](self, "setResolveTimeoutHandler:", (id)[a3 copy]);
  id v8 = objc_alloc_init(GKSimpleTimer);
  [(GKSimpleTimer *)v8 setDelegate:self];
  [(GKDiscoveryPeer *)self setResolveTimer:v8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryPeer *)self serviceName]) {
        int v11 = [[(NSString *)[(GKDiscoveryPeer *)self serviceName] description] UTF8String];
      }
      else {
        int v11 = "<nil>";
      }
      int v12 = 136316162;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      __int16 v15 = "-[GKDiscoveryPeer startResolveTimerWithHandler:]";
      __int16 v16 = 1024;
      int v17 = 269;
      __int16 v18 = 2080;
      long long v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = 0x404E000000000000;
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] starting resolve timer with timout [%f seconds]", (uint8_t *)&v12, 0x30u);
    }
  }
  [(GKSimpleTimer *)v8 fireIn:60.0 fromNow:v5];
}

- (void)stopResolveTimer
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_resolveTimer)
  {
    if (self->_resolveTimeoutHandler)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          if ([(GKDiscoveryPeer *)self serviceName]) {
            double v5 = [[(NSString *)[(GKDiscoveryPeer *)self serviceName] description] UTF8String];
          }
          else {
            double v5 = "<nil>";
          }
          int v6 = 136315906;
          uint64_t v7 = v3;
          __int16 v8 = 2080;
          uint64_t v9 = "-[GKDiscoveryPeer stopResolveTimer]";
          __int16 v10 = 1024;
          int v11 = 278;
          __int16 v12 = 2080;
          uint64_t v13 = v5;
          _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] resolve timer stopped", (uint8_t *)&v6, 0x26u);
        }
      }
    }
    [(GKDiscoveryPeer *)self setResolveTimeoutHandler:0];
    [(GKSimpleTimer *)[(GKDiscoveryPeer *)self resolveTimer] invalidate];
    [(GKDiscoveryPeer *)self setResolveTimer:0];
  }
}

- (void)didLoseInterface:(id)a3
{
  -[NSMutableSet removeObject:](self->_interfaces, "removeObject:");
  [(NSMutableArray *)self->_orderedInterfaces removeObject:a3];
  attemptedInterfaces = self->_attemptedInterfaces;
  [(NSMutableArray *)attemptedInterfaces removeObject:a3];
}

- (void)cleanUpForBrowse
{
  [(NSMutableSet *)self->_interfaces removeAllObjects];
  [(NSMutableArray *)self->_orderedInterfaces removeAllObjects];
  [(NSMutableArray *)self->_attemptedInterfaces removeAllObjects];
  sendDataBuffer = self->_sendDataBuffer;
  [(NSMutableArray *)sendDataBuffer removeAllObjects];
}

- (void)invalidate
{
  [(GKDiscoveryPeerConnection *)self->_connection invalidate];
  [(GKDiscoveryPeerConnection *)self->_trialConnection invalidate];
  [(GKDiscoveryPeer *)self cleanUpForBrowse];
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  v7[2] = *MEMORY[0x263EF8340];
  if (self->_state == 3)
  {
    connection = self->_connection;
    [(GKDiscoveryPeerConnection *)connection sendData:a3 withCompletionHandler:a4];
  }
  else
  {
    sendDataBuffer = self->_sendDataBuffer;
    v6[0] = @"GKDiscoveryPeerSendDataKey";
    v6[1] = @"GKDiscoveryPeerSendCompletionHandlerKey";
    v7[0] = a3;
    v7[1] = a4;
    -[NSMutableArray addObject:](sendDataBuffer, "addObject:", [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2]);
  }
}

- (void)flushDataBuffer
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  int state = self->_state;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (state == 3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        Name = sel_getName(a2);
        serviceName = self->_serviceName;
        if (serviceName) {
          __int16 v10 = [[(NSString *)serviceName description] UTF8String];
        }
        else {
          __int16 v10 = "<nil>";
        }
        int v15 = [(NSMutableArray *)self->_sendDataBuffer count];
        *(_DWORD *)buf = 136316418;
        uint64_t v42 = v6;
        __int16 v43 = 2080;
        v44 = "-[GKDiscoveryPeer flushDataBuffer]";
        __int16 v45 = 1024;
        int v46 = 322;
        __int16 v47 = 2080;
        v48 = Name;
        __int16 v49 = 2080;
        v50 = v10;
        __int16 v51 = 1024;
        int v52 = v15;
        _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: peer [%s] relaying buffered data (%d sendData calls) to the peer connection object)", buf, 0x36u);
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    sendDataBuffer = self->_sendDataBuffer;
    uint64_t v17 = [(NSMutableArray *)sendDataBuffer countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(sendDataBuffer);
          }
          -[GKDiscoveryPeerConnection sendData:withCompletionHandler:](self->_connection, "sendData:withCompletionHandler:", [*(id *)(*((void *)&v33 + 1) + 8 * i) objectForKeyedSubscript:@"GKDiscoveryPeerSendDataKey"], objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "objectForKeyedSubscript:", @"GKDiscoveryPeerSendCompletionHandlerKey"));
        }
        uint64_t v18 = [(NSMutableArray *)sendDataBuffer countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v18);
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = self->_serviceName;
        if (v13) {
          uint64_t v14 = [[(NSString *)v13 description] UTF8String];
        }
        else {
          uint64_t v14 = "<nil>";
        }
        int v21 = [(NSMutableArray *)self->_sendDataBuffer count];
        *(_DWORD *)buf = 136316162;
        uint64_t v42 = v11;
        __int16 v43 = 2080;
        v44 = "-[GKDiscoveryPeer flushDataBuffer]";
        __int16 v45 = 1024;
        int v46 = 331;
        __int16 v47 = 2080;
        v48 = v14;
        __int16 v49 = 1024;
        LODWORD(v50) = v21;
        _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] no connection; notify GK that data [%d] failed to send",
          buf,
          0x2Cu);
      }
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v22 = self->_sendDataBuffer;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      uint64_t v26 = *MEMORY[0x263F08320];
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = [*(id *)(*((void *)&v29 + 1) + 8 * j) objectForKeyedSubscript:@"GKDiscoveryPeerSendCompletionHandlerKey"];
          if (v28)
          {
            uint64_t v37 = v26;
            v38 = @"Unable to connect";
            (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v28, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryPeer", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1)));
          }
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v24);
    }
  }
  [(NSMutableArray *)self->_sendDataBuffer removeAllObjects];
}

- (void)timeout:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    double v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryPeer *)self serviceName]) {
        uint64_t v6 = [[(NSString *)[(GKDiscoveryPeer *)self serviceName] description] UTF8String];
      }
      else {
        uint64_t v6 = "<nil>";
      }
      int v8 = 136315906;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[GKDiscoveryPeer timeout:]";
      __int16 v12 = 1024;
      int v13 = 349;
      __int16 v14 = 2080;
      int v15 = v6;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] resolve timout fired", (uint8_t *)&v8, 0x26u);
    }
  }
  resolveTimeoutHandler = (void (**)(void))self->_resolveTimeoutHandler;
  if (resolveTimeoutHandler) {
    resolveTimeoutHandler[2]();
  }
  [(GKDiscoveryPeer *)self setResolveTimeoutHandler:0];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSMutableSet)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
}

- (NSMutableArray)orderedInterfaces
{
  return self->_orderedInterfaces;
}

- (void)setOrderedInterfaces:(id)a3
{
}

- (NSMutableArray)attemptedInterfaces
{
  return self->_attemptedInterfaces;
}

- (void)setAttemptedInterfaces:(id)a3
{
}

- (NSNumber)chosenInterface
{
  return self->_chosenInterface;
}

- (void)setChosenInterface:(id)a3
{
}

- (GKDiscoveryPeerConnection)trialConnection
{
  return self->_trialConnection;
}

- (void)setTrialConnection:(id)a3
{
}

- (BOOL)shouldSignalDiscovery
{
  return self->_shouldSignalDiscovery;
}

- (void)setShouldSignalDiscovery:(BOOL)a3
{
  self->_shouldSignalDiscovery = a3;
}

- (GKDiscoveryPeerConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableArray)sendDataBuffer
{
  return self->_sendDataBuffer;
}

- (void)setSendDataBuffer:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (double)discoveryTimeStamp
{
  return self->_discoveryTimeStamp;
}

- (void)setDiscoveryTimeStamp:(double)a3
{
  self->_discoveryTimeStamp = a3;
}

- (GKSimpleTimer)resolveTimer
{
  return self->_resolveTimer;
}

- (void)setResolveTimer:(id)a3
{
}

- (id)resolveTimeoutHandler
{
  return self->_resolveTimeoutHandler;
}

- (void)setResolveTimeoutHandler:(id)a3
{
}

@end