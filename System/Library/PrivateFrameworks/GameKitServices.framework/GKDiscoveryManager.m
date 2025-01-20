@interface GKDiscoveryManager
+ (id)parseDeviceIDFromServiceName:(id)a3;
- (GKDiscoveryBonjour)bonjour;
- (GKDiscoveryManager)init;
- (GKDiscoveryManager)initWithDomain:(id)a3 type:(id)a4;
- (NSMutableDictionary)peers;
- (NSString)deviceID;
- (NSString)playerID;
- (id)generateDeviceID;
- (id)localServiceName;
- (id)peersList;
- (id)playerFoundHandler;
- (id)playerLostHandler;
- (id)receiveDataHandler;
- (id)serviceNameforDeviceID:(id)a3 playerID:(id)a4;
- (id)startAdvertisingLocalPlayer:(id)a3 discoveryInfo:(id)a4;
- (void)addInterface:(unsigned int)a3 withDiscoveryInfo:(id)a4 forPeerWithServiceName:(id)a5;
- (void)cleanUpPeersForBrowse;
- (void)connectToSockAddr:(sockaddr *)a3 port:(unsigned __int16)a4 forPeer:(id)a5;
- (void)dealloc;
- (void)didLosePeer:(id)a3;
- (void)forgetParticipant:(id)a3 deviceID:(id)a4;
- (void)passDataToGKLayer:(id)a3 fromPeer:(id)a4;
- (void)processEvent:(int)a3 forPeer:(id)a4 withUserInfo:(id)a5;
- (void)removeInterface:(unsigned int)a3 forPeerWithServiceName:(id)a4;
- (void)resolveForPeer:(id)a3;
- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 withCompletionHandler:(id)a6;
- (void)setBonjour:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setPeers:(id)a3;
- (void)setPlayerFoundHandler:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setPlayerLostHandler:(id)a3;
- (void)setReceiveDataHandler:(id)a3;
- (void)startBrowsingLocalPlayer:(id)a3;
- (void)stopAdvertising;
- (void)stopBrowsing;
@end

@implementation GKDiscoveryManager

- (GKDiscoveryManager)init
{
  return [(GKDiscoveryManager *)self initWithDomain:@"local." type:@"_gamecenter._tcp"];
}

- (GKDiscoveryManager)initWithDomain:(id)a3 type:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKDiscoveryManager;
  v6 = [(GKDiscoveryManager *)&v8 init];
  if (v6)
  {
    v6->_bonjour = [[GKDiscoveryBonjour alloc] initWithDomain:a3 type:a4];
    v6->_peers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->_peersQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamed.GKDiscoveryManager.peersQueue", 0);
    v6->_deviceID = (NSString *)[(GKDiscoveryManager *)v6 generateDeviceID];
  }
  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_peersQueue);
  v3.receiver = self;
  v3.super_class = (Class)GKDiscoveryManager;
  [(GKDiscoveryManager *)&v3 dealloc];
}

- (id)generateDeviceID
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFUUIDRef v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  CFRelease(v3);
  memset(md, 170, sizeof(md));
  CC_MD5((const void *)[(__CFString *)v4 UTF8String], [(__CFString *)v4 length], md);

  v5 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:16];
  for (uint64_t i = 0; i != 8; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02X", md[i]);
  return v5;
}

- (void)resolveForPeer:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = (void *)[a3 nextInterfaceIndex];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v5)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      objc_super v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([a3 serviceName]) {
          uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "serviceName"), "description"), "UTF8String");
        }
        else {
          uint64_t v9 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[GKDiscoveryManager resolveForPeer:]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v21) = 163;
        WORD2(v21) = 2080;
        *(void *)((char *)&v21 + 6) = v9;
        HIWORD(v21) = 1024;
        LODWORD(v22) = [v5 intValue];
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] attempting to resolve on interface [%d]", buf, 0x2Cu);
      }
    }
    [a3 setChosenInterface:v5];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    *(void *)&long long v21 = __Block_byref_object_copy_;
    *((void *)&v21 + 1) = __Block_byref_object_dispose_;
    id v22 = a3;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke;
    v19[3] = &unk_2645B8128;
    v19[4] = self;
    v19[5] = buf;
    [a3 startResolveTimerWithHandler:v19];
    bonjour = self->_bonjour;
    uint64_t v14 = [a3 serviceName];
    uint64_t v15 = [v5 intValue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_3;
    v18[3] = &unk_2645B8150;
    v18[4] = a3;
    v18[5] = self;
    v18[6] = v5;
    [(GKDiscoveryBonjour *)bonjour resolveName:v14 onIndex:v15 withCompletionHandler:v18];
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([a3 serviceName]) {
          v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "serviceName"), "description"), "UTF8String");
        }
        else {
          v12 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[GKDiscoveryManager resolveForPeer:]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v21) = 227;
        WORD2(v21) = 2080;
        *(void *)((char *)&v21 + 6) = v12;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] no more interfaces available to resolve on", buf, 0x26u);
      }
    }
    peersQueue = self->_peersQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_26;
    block[3] = &unk_2645B7C68;
    block[4] = self;
    block[5] = a3;
    dispatch_async(peersQueue, block);
  }
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_2;
  v3[3] = &unk_2645B8128;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_async(*(dispatch_queue_t *)(v4 + 64), v3);
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "stopResolve:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "serviceName"));
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) processEvent:1002 forPeer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withUserInfo:0];
}

void __37__GKDiscoveryManager_resolveForPeer___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) stopResolveTimer];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "stopResolve:", objc_msgSend(*(id *)(a1 + 32), "serviceName"));
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (a5)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        if ([*(id *)(a1 + 32) serviceName]) {
          v27 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        }
        else {
          v27 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v34 = v11;
        __int16 v35 = 2080;
        v36 = "-[GKDiscoveryManager resolveForPeer:]_block_invoke_3";
        __int16 v37 = 1024;
        int v38 = 190;
        __int16 v39 = 2080;
        v40 = v27;
        __int16 v41 = 1024;
        int v42 = a5;
        _os_log_error_impl(&dword_221563000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d peer [%s] resolve callback errorCode = %d.", buf, 0x2Cu);
      }
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(NSObject **)(v13 + 64);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_13;
    v30[3] = &unk_2645B7C68;
    uint64_t v15 = *(void *)(a1 + 32);
    v30[4] = v13;
    v30[5] = v15;
    v16 = v30;
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([*(id *)(a1 + 32) serviceName]) {
          v19 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        }
        else {
          v19 = "<nil>";
        }
        int v20 = [*(id *)(a1 + 48) intValue];
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v17;
        __int16 v35 = 2080;
        v36 = "-[GKDiscoveryManager resolveForPeer:]_block_invoke_2";
        __int16 v37 = 1024;
        int v38 = 201;
        __int16 v39 = 2080;
        v40 = v19;
        __int16 v41 = 1024;
        int v42 = v20;
        __int16 v43 = 1024;
        int v44 = a2;
        _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] resolved successfully on interface [%d] (interface returned [%d])", buf, 0x32u);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setChosenInterface:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a2));
    uint64_t v21 = [MEMORY[0x263EFF8F8] dataWithSockAddr:a3];
    if (v21)
    {
      v32[0] = v21;
      v31[0] = @"GKDiscoveryManagerUserInfoSocketAddressKey";
      v31[1] = @"GKDiscoveryManagerUserInfoPortKey";
      v32[1] = [NSNumber numberWithUnsignedShort:a4];
      uint64_t v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
      uint64_t v23 = *(void *)(a1 + 40);
      v24 = *(NSObject **)(v23 + 64);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_24;
      v28[3] = &unk_2645B7C90;
      uint64_t v25 = *(void *)(a1 + 32);
      v28[4] = v23;
      v28[5] = v25;
      v28[6] = v22;
      v16 = v28;
      uint64_t v14 = v24;
    }
    else
    {
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v14 = *(NSObject **)(v26 + 64);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_16;
      block[3] = &unk_2645B7C68;
      block[4] = *(void *)(a1 + 32);
      block[5] = v26;
      v16 = block;
    }
  }
  dispatch_async(v14, v16);
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) processEvent:1002 forPeer:*(void *)(a1 + 40) withUserInfo:0];
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke_16(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      __37__GKDiscoveryManager_resolveForPeer___block_invoke_16_cold_1();
    }
  }
  return [*(id *)(a1 + 40) processEvent:1002 forPeer:*(void *)(a1 + 32) withUserInfo:0];
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) processEvent:1003 forPeer:*(void *)(a1 + 40) withUserInfo:*(void *)(a1 + 48)];
}

void __37__GKDiscoveryManager_resolveForPeer___block_invoke_26(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID")))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "interfaces"), "count"))
    {
      if ([*(id *)(a1 + 40) state] != 3)
      {
        [*(id *)(a1 + 32) processEvent:1006 forPeer:*(void *)(a1 + 40) withUserInfo:0];
        CFAllocatorRef v2 = *(void **)(a1 + 40);
        [v2 flushDataBuffer];
      }
    }
    else
    {
      v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      [v6 didLosePeer:v7];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    long long v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([*(id *)(a1 + 40) serviceName]) {
        v5 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "serviceName"), "description"), "UTF8String");
      }
      else {
        v5 = "<nil>";
      }
      int v8 = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      uint64_t v11 = "-[GKDiscoveryManager resolveForPeer:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 232;
      __int16 v14 = 2080;
      uint64_t v15 = v5;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] not in dictionary anymore.", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)connectToSockAddr:(sockaddr *)a3 port:(unsigned __int16)a4 forPeer:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v9 = [[GKDiscoveryPeerConnection alloc] initWithLocalServiceName:[(GKDiscoveryManager *)self localServiceName]];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke;
  v19[3] = &unk_2645B81A0;
  v19[4] = a5;
  v19[5] = self;
  void v19[6] = v9;
  [(GKDiscoveryPeerConnection *)v9 setConnectedHandler:v19];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v11 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      if ([a5 serviceName]) {
        __int16 v14 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "serviceName"), "description"), "UTF8String");
      }
      else {
        __int16 v14 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v12;
      __int16 v22 = 2080;
      uint64_t v23 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]";
      __int16 v24 = 1024;
      int v25 = 362;
      __int16 v26 = 2080;
      v27 = v14;
      _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] attempting to connect", buf, 0x26u);
    }
  }
  [(GKDiscoveryPeerConnection *)v9 connectToSockAddr:a3 port:v6];
  [a5 setTrialConnection:v9];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      if ([a5 serviceName]) {
        uint64_t v17 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "serviceName"), "description"), "UTF8String");
      }
      else {
        uint64_t v17 = "<nil>";
      }
      int v18 = [(GKDiscoveryPeerConnection *)v9 retainCount];
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      uint64_t v23 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]";
      __int16 v24 = 1024;
      int v25 = 366;
      __int16 v26 = 2080;
      v27 = v17;
      __int16 v28 = 1024;
      int v29 = v18;
      _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] peerConnection retain count [%d]", buf, 0x2Cu);
    }
  }
}

void __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      }
      else {
        uint64_t v12 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v46 = v10;
      __int16 v47 = 2080;
      v48 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
      __int16 v49 = 1024;
      int v50 = 255;
      __int16 v51 = 2080;
      v52 = v12;
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerConnection connectedHandler (browser side), remote serviceName [%s]", buf, 0x26u);
    }
  }
  int v13 = (void (**)(id, void))(id)[a4 copy];
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        if ([*(id *)(a1 + 32) serviceName]) {
          int v25 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        }
        else {
          int v25 = "<nil>";
        }
        if ([a5 localizedDescription]) {
          __int16 v26 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "localizedDescription"), "description"), "UTF8String");
        }
        else {
          __int16 v26 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v46 = v14;
        __int16 v47 = 2080;
        v48 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        __int16 v49 = 1024;
        int v50 = 261;
        __int16 v51 = 2080;
        v52 = v25;
        __int16 v53 = 2080;
        v54 = v26;
        _os_log_error_impl(&dword_221563000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d peer [%s] error in connectedHandler [%s]", buf, 0x30u);
      }
    }
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(NSObject **)(v16 + 64);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_28;
    block[3] = &unk_2645B7C68;
    block[4] = *(void *)(a1 + 32);
    block[5] = v16;
    dispatch_async(v17, block);
LABEL_11:
    if (v13) {
      v13[2](v13, 0);
    }
    return;
  }
  int v18 = (id *)(a1 + 32);
  if ((objc_msgSend(+[GKDiscoveryManager parseDeviceIDFromServiceName:](GKDiscoveryManager, "parseDeviceIDFromServiceName:", a2), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "deviceID")) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_cold_1();
      }
    }
    goto LABEL_11;
  }
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_31;
  v42[3] = &unk_2645B7F58;
  int8x16_t v43 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  if (a3)
  {
    [*(id *)(a1 + 48) setReceiveDataHandler:v42];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([*v18 serviceName]) {
          uint64_t v21 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v18, "serviceName"), "description"), "UTF8String");
        }
        else {
          uint64_t v21 = "<nil>";
        }
        v27 = *(const char **)(a1 + 48);
        if (objc_msgSend(*(id *)(a1 + 32), "stringForState:", objc_msgSend(*(id *)(a1 + 32), "state"))) {
          __int16 v28 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v18, "stringForState:", objc_msgSend(*v18, "state")), "description"), "UTF8String");
        }
        else {
          __int16 v28 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v46 = v19;
        __int16 v47 = 2080;
        v48 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        __int16 v49 = 1024;
        int v50 = 321;
        __int16 v51 = 2080;
        v52 = v21;
        __int16 v53 = 2048;
        v54 = v27;
        __int16 v55 = 2080;
        v56 = v28;
        _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectionHandler [%s] (browser side) shouldForceConnect == YES; peer.connection [%p] state [%s]",
          buf,
          0x3Au);
      }
    }
    uint64_t v31 = *(void *)(a1 + 40);
    v32 = *(NSObject **)(v31 + 64);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_34;
    v41[3] = &unk_2645B7C90;
    uint64_t v33 = *(void *)(a1 + 32);
    v41[4] = v31;
    v41[5] = v33;
    v41[6] = *(void *)(a1 + 48);
    dispatch_async(v32, v41);
    if (v13) {
      v13[2](v13, 1);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([*v18 serviceName]) {
          __int16 v24 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v18, "serviceName"), "description"), "UTF8String");
        }
        else {
          __int16 v24 = "<nil>";
        }
        int v29 = *(const char **)(a1 + 48);
        if (objc_msgSend(*(id *)(a1 + 32), "stringForState:", objc_msgSend(*(id *)(a1 + 32), "state"))) {
          uint64_t v30 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v18, "stringForState:", objc_msgSend(*v18, "state")), "description"), "UTF8String");
        }
        else {
          uint64_t v30 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v46 = v22;
        __int16 v47 = 2080;
        v48 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke_2";
        __int16 v49 = 1024;
        int v50 = 333;
        __int16 v51 = 2080;
        v52 = v24;
        __int16 v53 = 2048;
        v54 = v29;
        __int16 v55 = 2080;
        v56 = v30;
        _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectionHandler [%s] (browser side) shouldForceConnect == NO; peer.connection [%p] state [%s]",
          buf,
          0x3Au);
      }
    }
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    int8x16_t v34 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    uint64_t v35 = *(void *)(a1 + 40);
    v37[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_38;
    v37[3] = &unk_2645B8178;
    v37[4] = *(void *)(a1 + 32);
    v36 = *(NSObject **)(v35 + 64);
    int8x16_t v38 = v34;
    __int16 v39 = v42;
    v40 = v13;
    dispatch_async(v36, v37);
  }
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_28(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trialConnection"), "invalidate");
  [*(id *)(a1 + 32) setTrialConnection:0];
  uint64_t v3 = *(void *)(a1 + 32);
  CFAllocatorRef v2 = *(void **)(a1 + 40);
  return [v2 processEvent:1004 forPeer:v3 withUserInfo:0];
}

void __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_31(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 64);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_2;
    block[3] = &unk_2645B7C90;
    block[4] = *(void *)(a1 + 40);
    block[5] = a3;
    void block[6] = v4;
    dispatch_async(v5, block);
  }
  else
  {
    if (!a2)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
      uint64_t v8 = *(void *)(a1 + 32);
      v14[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_32;
      v14[3] = &unk_2645B7C68;
      uint64_t v9 = *(NSObject **)(v8 + 64);
      int8x16_t v15 = v7;
      dispatch_async(v9, v14);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([*(id *)(a1 + 40) serviceName]) {
          uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "serviceName"), "description"), "UTF8String");
        }
        else {
          uint64_t v12 = "<nil>";
        }
        int v13 = [a2 length];
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        int v20 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 312;
        __int16 v23 = 2080;
        __int16 v24 = v12;
        __int16 v25 = 1024;
        int v26 = v13;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] passing data (length=%u) to GK", buf, 0x2Cu);
      }
    }
    [*(id *)(a1 + 32) passDataToGKLayer:a2 fromPeer:*(void *)(a1 + 40)];
  }
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_2(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_2_cold_1(v2, a1);
    }
  }
  return [*(id *)(a1 + 48) processEvent:1006 forPeer:*(void *)(a1 + 32) withUserInfo:0];
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_32(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([*(id *)(a1 + 32) serviceName]) {
        uint64_t v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
      }
      else {
        uint64_t v4 = "<nil>";
      }
      int v8 = 136315906;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      uint64_t v11 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 302;
      __int16 v14 = 2080;
      int8x16_t v15 = v4;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] connection closed. Setting peer.connection to nil", (uint8_t *)&v8, 0x26u);
    }
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interfaces"), "count");
  uint64_t v6 = *(void **)(a1 + 40);
  if (v5) {
    return [v6 processEvent:1006 forPeer:*(void *)(a1 + 32) withUserInfo:0];
  }
  else {
    return [v6 didLosePeer:*(void *)(a1 + 32)];
  }
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_34(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v5 = @"GKDiscoveryManagerUserInfoConnectionKey";
  v6[0] = v3;
  return objc_msgSend(v1, "processEvent:forPeer:withUserInfo:", 1005, v2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_38(uint64_t a1)
{
  v26[1] = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) state];
  if (v2 == 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([*(id *)(a1 + 32) serviceName]) {
          uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        }
        else {
          uint64_t v9 = "<nil>";
        }
        int v15 = 136315906;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        uint64_t v18 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 350;
        __int16 v21 = 2080;
        int v22 = v9;
        __int16 v10 = " [%s] %s:%d peer [%s] (browser side) decision == NO.";
        goto LABEL_14;
      }
    }
  }
  else
  {
    [*(id *)(a1 + 40) setReceiveDataHandler:*(void *)(a1 + 56)];
    __int16 v25 = @"GKDiscoveryManagerUserInfoConnectionKey";
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 48);
    v26[0] = *(void *)(a1 + 40);
    objc_msgSend(v4, "processEvent:forPeer:withUserInfo:", 1005, v3, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([*(id *)(a1 + 32) serviceName]) {
          int8x16_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        }
        else {
          int8x16_t v7 = "<nil>";
        }
        int v15 = 136315906;
        uint64_t v16 = v5;
        __int16 v17 = 2080;
        uint64_t v18 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 347;
        __int16 v21 = 2080;
        int v22 = v7;
        __int16 v10 = " [%s] %s:%d peer [%s] (browser side) connected successfully.";
LABEL_14:
        _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, 0x26u);
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([*(id *)(a1 + 32) serviceName]) {
        int v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
      }
      else {
        int v13 = "<nil>";
      }
      int v15 = 136316162;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 352;
      __int16 v21 = 2080;
      int v22 = v13;
      __int16 v23 = 1024;
      BOOL v24 = v2 != 3;
      _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] (browser side) about to return decision == %d", (uint8_t *)&v15, 0x2Cu);
    }
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 != 3);
  }
  return result;
}

- (void)processEvent:(int)a3 forPeer:(id)a4 withUserInfo:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peers, "objectForKeyedSubscript:", [a4 deviceID]);
  if (v9)
  {
    if (v9 == a4)
    {
      switch(a3)
      {
        case 1000:
          double v16 = micro();
          [a4 setDiscoveryTimeStamp:v16];
          return;
        case 1001:
          double v19 = micro();
          [a4 discoveryTimeStamp];
          double v21 = v20 - v19 + 3.0;
          if (v21 >= 0.0) {
            double v22 = v21;
          }
          else {
            double v22 = 0.0;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v23 = VRTraceErrorLogLevelToCSTR();
            BOOL v24 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if ([a4 serviceName]) {
                __int16 v25 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "serviceName"), "description"), "UTF8String");
              }
              else {
                __int16 v25 = "<nil>";
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v35 = v23;
              __int16 v36 = 2080;
              __int16 v37 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]";
              __int16 v38 = 1024;
              int v39 = 404;
              __int16 v40 = 2080;
              __int16 v41 = v25;
              __int16 v42 = 2048;
              double v43 = v22;
              _os_log_impl(&dword_221563000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] time to wait before resolve [%f]", buf, 0x30u);
            }
          }
          dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
          peersQueue = self->_peersQueue;
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __56__GKDiscoveryManager_processEvent_forPeer_withUserInfo___block_invoke;
          v33[3] = &unk_2645B7C68;
          v33[4] = a4;
          v33[5] = self;
          dispatch_after(v31, peersQueue, v33);
          id v17 = a4;
          uint64_t v18 = 1;
          goto LABEL_19;
        case 1002:
          [a4 stopResolveTimer];
          if ([a4 state] != 3) {
            goto LABEL_38;
          }
          return;
        case 1003:
          if ([a4 state] == 1)
          {
            -[GKDiscoveryManager connectToSockAddr:port:forPeer:](self, "connectToSockAddr:port:forPeer:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"GKDiscoveryManagerUserInfoSocketAddressKey"), "sockAddr"), (unsigned __int16)objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"GKDiscoveryManagerUserInfoPortKey"), "unsignedIntValue"), a4);
            [a4 setState:2];
          }
          return;
        case 1004:
          if ([a4 state] == 3) {
            return;
          }
          [a4 setState:1];
LABEL_38:
          [(GKDiscoveryManager *)self resolveForPeer:a4];
          break;
        case 1005:
          uint64_t v26 = [a5 objectForKeyedSubscript:@"GKDiscoveryManagerUserInfoConnectionKey"];
          if (v26)
          {
            uint64_t v27 = v26;
            [a4 setConnection:v26];
            if ([a4 trialConnection] != v27) {
              objc_msgSend((id)objc_msgSend(a4, "trialConnection"), "invalidate");
            }
            [a4 setTrialConnection:0];
          }
          [a4 setState:3];
          [a4 flushDataBuffer];
          return;
        case 1006:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v28 = VRTraceErrorLogLevelToCSTR();
            int v29 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if ([a4 serviceName]) {
                uint64_t v30 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "serviceName"), "description"), "UTF8String");
              }
              else {
                uint64_t v30 = "<nil>";
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v35 = v28;
              __int16 v36 = 2080;
              __int16 v37 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]";
              __int16 v38 = 1024;
              int v39 = 471;
              __int16 v40 = 2080;
              __int16 v41 = v30;
              __int16 v42 = 1024;
              LODWORD(v43) = objc_msgSend((id)objc_msgSend(a4, "connection"), "retainCount");
              _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] PeerDisconnected event! peerConnection retain count [%d]", buf, 0x2Cu);
            }
          }
          goto LABEL_18;
        default:
          return;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          if ([a4 serviceName]) {
            __int16 v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "serviceName"), "description"), "UTF8String");
          }
          else {
            __int16 v12 = "<nil>";
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v35 = v10;
          __int16 v36 = 2080;
          __int16 v37 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]";
          __int16 v38 = 1024;
          int v39 = 381;
          __int16 v40 = 2080;
          __int16 v41 = v12;
          _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] zombie object - this should never happen!.", buf, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(a4, "sendDataBuffer"), "removeAllObjects");
LABEL_18:
      objc_msgSend((id)objc_msgSend(a4, "connection"), "invalidate");
      [a4 setConnection:0];
      id v17 = a4;
      uint64_t v18 = 0;
LABEL_19:
      [v17 setState:v18];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    __int16 v14 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([a4 serviceName]) {
        int v15 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "serviceName"), "description"), "UTF8String");
      }
      else {
        int v15 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v35 = v13;
      __int16 v36 = 2080;
      __int16 v37 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]";
      __int16 v38 = 1024;
      int v39 = 375;
      __int16 v40 = 2080;
      __int16 v41 = v15;
      __int16 v42 = 1024;
      LODWORD(v43) = a3;
      _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] event [%d] not in dictionary anymore.", buf, 0x2Cu);
    }
  }
}

void __56__GKDiscoveryManager_processEvent_forPeer_withUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([*(id *)(a1 + 32) serviceName]) {
        uint64_t v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
      }
      else {
        uint64_t v4 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      uint64_t v11 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 409;
      __int16 v14 = 2080;
      int v15 = v4;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] ready to start interface selection", buf, 0x26u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(NSObject **)(v5 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__GKDiscoveryManager_processEvent_forPeer_withUserInfo___block_invoke_40;
  v7[3] = &unk_2645B7C68;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = v5;
  dispatch_async(v6, v7);
}

uint64_t __56__GKDiscoveryManager_processEvent_forPeer_withUserInfo___block_invoke_40(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOrderedInterfaces:", objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", +[GKInterfacePrioritizer prioritizeLocalInterfaces:](GKInterfacePrioritizer, "prioritizeLocalInterfaces:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interfaces"), "allObjects"))));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attemptedInterfaces"), "removeAllObjects");
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 resolveForPeer:v3];
}

- (void)passDataToGKLayer:(id)a3 fromPeer:(id)a4
{
  peersQueue = self->_peersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__GKDiscoveryManager_passDataToGKLayer_fromPeer___block_invoke;
  block[3] = &unk_2645B7C90;
  block[4] = self;
  block[5] = a4;
  void block[6] = a3;
  dispatch_async(peersQueue, block);
}

void __49__GKDiscoveryManager_passDataToGKLayer_fromPeer___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "serviceNameforDeviceID:playerID:", objc_msgSend(*(id *)(a1 + 40), "deviceID"), objc_msgSend(*(id *)(a1 + 40), "playerID"));
  if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    if (v2) {
      __int16 v10 = (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
    }
    else {
      __int16 v10 = "<nil>";
    }
    int v16 = 136315906;
    uint64_t v17 = v8;
    __int16 v18 = 2080;
    double v19 = "-[GKDiscoveryManager passDataToGKLayer:fromPeer:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 489;
    __int16 v22 = 2080;
    uint64_t v23 = v10;
    int v13 = " [%s] %s:%d received data from [%s], but peer not in dictionary anymore.";
    __int16 v14 = v9;
    uint32_t v15 = 38;
LABEL_15:
    _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
    return;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v16 = 136315650;
    uint64_t v17 = v11;
    __int16 v18 = 2080;
    double v19 = "-[GKDiscoveryManager passDataToGKLayer:fromPeer:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 495;
    int v13 = " [%s] %s:%d receiveDataHandler is not set, cannot pass data to the GameKit layer.";
    __int16 v14 = v12;
    uint32_t v15 = 28;
    goto LABEL_15;
  }
  uint64_t v4 = [*(id *)(a1 + 40) playerID];
  uint64_t v5 = [*(id *)(a1 + 40) deviceID];
  uint64_t v6 = *(void *)(a1 + 48);
  int8x16_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 16);
  v7(v3, v4, v5, v6);
}

- (id)startAdvertisingLocalPlayer:(id)a3 discoveryInfo:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  -[GKDiscoveryManager setPlayerID:](self, "setPlayerID:");
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v11 = "<nil>";
      }
      if ([(GKDiscoveryManager *)self localServiceName])
      {
        __int16 v12 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager localServiceName](self, "localServiceName"), "description"), "UTF8String");
        if (a4)
        {
LABEL_8:
          int v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_11:
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v9;
          __int16 v24 = 2080;
          __int16 v25 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]";
          __int16 v26 = 1024;
          int v27 = 505;
          __int16 v28 = 2080;
          int v29 = v11;
          __int16 v30 = 2080;
          dispatch_time_t v31 = v12;
          __int16 v32 = 2080;
          uint64_t v33 = v13;
          _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am [%s] [%s] discoveryInfo [%s]", buf, 0x3Au);
          goto LABEL_12;
        }
      }
      else
      {
        __int16 v12 = "<nil>";
        if (a4) {
          goto LABEL_8;
        }
      }
      int v13 = "<nil>";
      goto LABEL_11;
    }
  }
LABEL_12:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint32_t v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryManager *)self peersList]) {
        int v16 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
      }
      else {
        int v16 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v14;
      __int16 v24 = 2080;
      __int16 v25 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]";
      __int16 v26 = 1024;
      int v27 = 506;
      __int16 v28 = 2080;
      int v29 = v16;
      _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d startAdvertising peers=[%s]", buf, 0x26u);
    }
  }
  bonjour = self->_bonjour;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke;
  v21[3] = &unk_2645B8218;
  v21[4] = self;
  [(GKDiscoveryBonjour *)bonjour setConnectionCallback:v21];
  __int16 v18 = self->_bonjour;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_49;
  v20[3] = &unk_2645B8240;
  v20[4] = self;
  [(GKDiscoveryBonjour *)v18 setServiceNameCollisionCallback:v20];
  [(GKDiscoveryBonjour *)self->_bonjour startAdvertisingServiceName:[(GKDiscoveryManager *)self localServiceName] discoveryInfo:a4];
  return 0;
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)&v22[13] = *MEMORY[0x263EF8340];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v5 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule > 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int8x16_t v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      if ([*(id *)(a1 + 32) localServiceName]) {
        uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "localServiceName"), "description"), "UTF8String");
      }
      else {
        uint64_t v8 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      __int16 v18 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 510;
      __int16 v21 = 1024;
      *(_DWORD *)__int16 v22 = a2;
      v22[2] = 2080;
      *(void *)&v22[3] = v8;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d advertising connection callback, socket [%d] localServiceName [%s]", buf, 0x2Cu);
    }
  }
  uint64_t v9 = -[GKDiscoveryPeerConnection initWithLocalServiceName:]([GKDiscoveryPeerConnection alloc], "initWithLocalServiceName:", [*(id *)(a1 + 32) localServiceName]);
  int LocalIFIndexForBoundSocket = GetLocalIFIndexForBoundSocket();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_43;
  v13[3] = &unk_2645B81F0;
  v13[4] = *(void *)(a1 + 32);
  v13[5] = v9;
  int v14 = LocalIFIndexForBoundSocket;
  [(GKDiscoveryPeerConnection *)v9 setConnectedHandler:v13];
  [(GKDiscoveryPeerConnection *)v9 attachSocketDescriptor:a2];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      __int16 v18 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 627;
      __int16 v21 = 2048;
      *(void *)__int16 v22 = v9;
      _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerConnection (advertiser side) created (%p)", buf, 0x26u);
    }
  }
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_43(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      }
      else {
        uint64_t v11 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      __int16 v21 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 518;
      __int16 v24 = 2080;
      __int16 v25 = v11;
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerConnection connectedHandler (advertiser side), remote ServiceName [%s]", buf, 0x26u);
    }
  }
  __int16 v12 = (void (**)(id, void))(id)[a4 copy];
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)))
    {
      __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_43_cold_1();
      if (v12) {
        goto LABEL_11;
      }
    }
    else if (v12)
    {
LABEL_11:
      v12[2](v12, 0);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_44;
    block[3] = &unk_2645B81C8;
    block[4] = a2;
    long long v15 = *(_OWORD *)(a1 + 32);
    int v13 = *(NSObject **)(v15 + 64);
    int v17 = *(_DWORD *)(a1 + 48);
    uint64_t v16 = v12;
    dispatch_async(v13, block);
  }
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_44(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = +[GKDiscoveryManager parseDeviceIDFromServiceName:*(void *)(a1 + 32)];
  uint64_t v4 = (GKDiscoveryPeer *)(id)[*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v3];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = [(GKDiscoveryPeer *)v4 state];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (*v2) {
          uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(*v2, "description"), "UTF8String");
        }
        else {
          uint64_t v9 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v39 = v7;
        __int16 v40 = 2080;
        __int16 v41 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 553;
        __int16 v44 = 2080;
        uint64_t v45 = v9;
        __int16 v46 = 1024;
        int v47 = [(GKDiscoveryPeer *)v5 state];
        __int16 v48 = 1024;
        BOOL v49 = v6 != 3;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] (advertiser side) peer already in dictionary [state = %d], decision = %d.", buf, 0x32u);
      }
    }
    if (v6 != 3)
    {
      [*(id *)(a1 + 40) processEvent:1006 forPeer:v5 withUserInfo:0];
LABEL_18:
      uint64_t v14 = 1;
      goto LABEL_24;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (*v2) {
          __int16 v12 = (const char *)objc_msgSend((id)objc_msgSend(*v2, "description"), "UTF8String");
        }
        else {
          __int16 v12 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = v10;
        __int16 v40 = 2080;
        __int16 v41 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 540;
        __int16 v44 = 2080;
        uint64_t v45 = v12;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] (advertiser side) peer not in dictionary, creating one, decision = YES.", buf, 0x26u);
      }
    }
    int v13 = [[GKDiscoveryPeer alloc] initWithServiceName:*v2];
    if (v13)
    {
      uint64_t v5 = v13;
      [*(id *)(*(void *)(a1 + 40) + 48) setObject:v13 forKeyedSubscript:v3];
      goto LABEL_18;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_44_cold_1(v15, (id *)(a1 + 32));
      }
    }
    uint64_t v5 = 0;
  }
  uint64_t v14 = 0;
LABEL_24:
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  __int16 v32 = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_46;
  uint64_t v33 = &unk_2645B7F58;
  uint64_t v34 = *(void *)(a1 + 40);
  uint64_t v35 = v5;
  if (v14)
  {
    [*(id *)(a1 + 48) setReceiveDataHandler:&v30];
    int v17 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    __int16 v36 = @"GKDiscoveryManagerUserInfoConnectionKey";
    uint64_t v37 = v16;
    objc_msgSend(v17, "processEvent:forPeer:withUserInfo:", 1005, v5, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, v30, v31, v32, v33, v34, v35));
    if (*(_DWORD *)(a1 + 64))
    {
      __int16 v18 = [(GKDiscoveryPeer *)v5 interfaces];
      -[NSMutableSet addObject:](v18, "addObject:", [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)]);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([(GKDiscoveryPeer *)v5 serviceName]) {
          __int16 v21 = [[(NSString *)[(GKDiscoveryPeer *)v5 serviceName] description] UTF8String];
        }
        else {
          __int16 v21 = "<nil>";
        }
        int v25 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 136316162;
        uint64_t v39 = v19;
        __int16 v40 = 2080;
        __int16 v41 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 615;
        __int16 v44 = 2080;
        uint64_t v45 = v21;
        __int16 v46 = 1024;
        int v47 = v25;
        uint64_t v26 = " [%s] %s:%d peer [%s] connected (advertiser side, interface index [%d]) successfully.";
        int v27 = v20;
        uint32_t v28 = 44;
LABEL_39:
        _os_log_impl(&dword_221563000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    int v23 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryPeer *)v5 serviceName]) {
        __int16 v24 = [[(NSString *)[(GKDiscoveryPeer *)v5 serviceName] description] UTF8String];
      }
      else {
        __int16 v24 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v39 = v22;
      __int16 v40 = 2080;
      __int16 v41 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 617;
      __int16 v44 = 2080;
      uint64_t v45 = v24;
      uint64_t v26 = " [%s] %s:%d peer [%s] (advertiser side) decision == NO.";
      int v27 = v23;
      uint32_t v28 = 38;
      goto LABEL_39;
    }
  }
  uint64_t v29 = *(void *)(a1 + 56);
  if (v29) {
    (*(void (**)(uint64_t, uint64_t))(v29 + 16))(v29, v14);
  }
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_46(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_2;
    block[3] = &unk_2645B7C90;
    long long v13 = *(_OWORD *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v13 + 64);
    uint64_t v14 = a3;
    dispatch_async(v4, block);
  }
  else
  {
    if (!a2)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_47;
      v10[3] = &unk_2645B7C68;
      long long v11 = *(_OWORD *)(a1 + 32);
      dispatch_async(*(dispatch_queue_t *)(v11 + 64), v10);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([*(id *)(a1 + 40) serviceName]) {
          uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "serviceName"), "description"), "UTF8String");
        }
        else {
          uint64_t v8 = "<nil>";
        }
        int v9 = [a2 length];
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        __int16 v18 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 589;
        __int16 v21 = 2080;
        uint64_t v22 = v8;
        __int16 v23 = 1024;
        int v24 = v9;
        _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] passing received data (length=%u) to GK", buf, 0x2Cu);
      }
    }
    [*(id *)(a1 + 32) passDataToGKLayer:a2 fromPeer:*(void *)(a1 + 40)];
  }
}

uint64_t __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_2(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_2_cold_1();
    }
  }
  return [*(id *)(a1 + 32) processEvent:1006 forPeer:*(void *)(a1 + 40) withUserInfo:0];
}

uint64_t __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_47(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_47_cold_1();
    }
  }
  return [*(id *)(a1 + 32) processEvent:1006 forPeer:*(void *)(a1 + 40) withUserInfo:0];
}

uint64_t __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_49(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDeviceID:", objc_msgSend(*(id *)(a1 + 32), "generateDeviceID"));
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 localServiceName];
}

- (id)serviceNameforDeviceID:(id)a3 playerID:(id)a4
{
  if (a3 && a4) {
    return (id)[NSString stringWithFormat:@"%@+%@", a3, a4];
  }
  if (a3) {
    return (id)[NSString stringWithFormat:@"%@", a3, v5];
  }
  return 0;
}

- (id)localServiceName
{
  return [(GKDiscoveryManager *)self serviceNameforDeviceID:self->_deviceID playerID:self->_playerID];
}

+ (id)parseDeviceIDFromServiceName:(id)a3
{
  uint64_t v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:", a3), "scanUpToString:intoString:", @"+", &v4);
  return v4;
}

- (void)stopAdvertising
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryManager *)self peersList]) {
        uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
      }
      else {
        uint64_t v5 = "<nil>";
      }
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      int v9 = "-[GKDiscoveryManager stopAdvertising]";
      __int16 v10 = 1024;
      int v11 = 664;
      __int16 v12 = 2080;
      long long v13 = v5;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stop advertising - peers=[\n%s]", (uint8_t *)&v6, 0x26u);
    }
  }
  [(GKDiscoveryBonjour *)self->_bonjour stopAdvertising];
}

- (void)cleanUpPeersForBrowse
{
  peersQueue = self->_peersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__GKDiscoveryManager_cleanUpPeersForBrowse__block_invoke;
  block[3] = &unk_2645B7C20;
  void block[4] = self;
  dispatch_async(peersQueue, block);
}

uint64_t __43__GKDiscoveryManager_cleanUpPeersForBrowse__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t result = [v2 countByEnumeratingWithState:&v20 objects:v34 count:16];
  if (result)
  {
    uint64_t v5 = result;
    int v6 = "";
    uint64_t v7 = (os_log_t *)MEMORY[0x263F21098];
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v4 = 136316162;
    long long v18 = v4;
    uint64_t v19 = v1;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v2);
        }
        __int16 v10 = objc_msgSend(*(id *)(*(void *)(v1 + 32) + 48), "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * v9), v18);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          __int16 v12 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = v6;
            uint64_t v14 = v2;
            uint64_t v15 = v7;
            if ([v10 playerID]) {
              uint64_t v16 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "playerID"), "description"), "UTF8String");
            }
            else {
              uint64_t v16 = "<nil>";
            }
            if ([v10 deviceID]) {
              __int16 v17 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "deviceID"), "description"), "UTF8String");
            }
            else {
              __int16 v17 = "<nil>";
            }
            *(_DWORD *)buf = v18;
            uint64_t v25 = v11;
            __int16 v26 = 2080;
            int v27 = "-[GKDiscoveryManager cleanUpPeersForBrowse]_block_invoke";
            __int16 v28 = 1024;
            int v29 = 672;
            __int16 v30 = 2080;
            uint64_t v31 = v16;
            __int16 v32 = 2080;
            uint64_t v33 = v17;
            _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d invalidating peer: %s device: %s", buf, 0x30u);
            uint64_t v7 = v15;
            uint64_t v2 = v14;
            int v6 = v13;
            uint64_t v1 = v19;
          }
        }
        [v10 cleanUpForBrowse];
        [v10 setShouldSignalDiscovery:1];
        ++v9;
      }
      while (v5 != v9);
      uint64_t result = [v2 countByEnumeratingWithState:&v20 objects:v34 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)startBrowsingLocalPlayer:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryManager *)self peersList]) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      long long v13 = "-[GKDiscoveryManager startBrowsingLocalPlayer:]";
      __int16 v14 = 1024;
      int v15 = 680;
      __int16 v16 = 2080;
      __int16 v17 = v7;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start browsing - peers=[\n%s]", buf, 0x26u);
    }
  }
  [(GKDiscoveryManager *)self cleanUpPeersForBrowse];
  [(GKDiscoveryManager *)self setPlayerID:a3];
  bonjour = self->_bonjour;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke;
  v9[3] = &unk_2645B82B8;
  v9[4] = self;
  [(GKDiscoveryBonjour *)bonjour startBrowsing:v9];
}

void __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke(uint64_t a1, int a2, uint64_t a3, int a4, void *a5, int a6)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = +[GKDiscoveryManager parseDeviceIDFromServiceName:](GKDiscoveryManager, "parseDeviceIDFromServiceName:");
  if (a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_cold_1(v13, a6, v14);
      }
    }
  }
  else if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "isEqualToString:", v12))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v28 = v15;
        __int16 v29 = 2080;
        __int16 v30 = "-[GKDiscoveryManager startBrowsingLocalPlayer:]_block_invoke";
        __int16 v31 = 1024;
        int v32 = 695;
        _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ignoring self for now.", buf, 0x1Cu);
      }
    }
  }
  else if (a3)
  {
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(NSObject **)(v17 + 64);
    if (a2)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_62;
      v25[3] = &unk_2645B8268;
      int v26 = a4;
      v25[4] = v17;
      v25[5] = a5;
      v25[6] = a3;
      uint64_t v19 = v25;
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_2;
      block[3] = &unk_2645B8290;
      int v24 = a4;
      void block[4] = v17;
      void block[5] = a3;
      uint64_t v19 = block;
    }
    dispatch_async(v18, v19);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    long long v21 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        long long v22 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      }
      else {
        long long v22 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v20;
      __int16 v29 = 2080;
      __int16 v30 = "-[GKDiscoveryManager startBrowsingLocalPlayer:]_block_invoke";
      __int16 v31 = 1024;
      int v32 = 698;
      __int16 v33 = 1024;
      int v34 = a4;
      __int16 v35 = 2080;
      __int16 v36 = v22;
      _os_log_error_impl(&dword_221563000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d serviceName is nil - ignoring peer - interface [%d] discoveryInfo [%s]", buf, 0x2Cu);
    }
  }
}

uint64_t __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_62(uint64_t a1)
{
  return [*(id *)(a1 + 32) addInterface:*(unsigned int *)(a1 + 56) withDiscoveryInfo:*(void *)(a1 + 40) forPeerWithServiceName:*(void *)(a1 + 48)];
}

uint64_t __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeInterface:*(unsigned int *)(a1 + 48) forPeerWithServiceName:*(void *)(a1 + 40)];
}

- (void)stopBrowsing
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    long long v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryManager *)self peersList]) {
        uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
      }
      else {
        uint64_t v5 = "<nil>";
      }
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[GKDiscoveryManager stopBrowsing]";
      __int16 v10 = 1024;
      int v11 = 718;
      __int16 v12 = 2080;
      uint64_t v13 = v5;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stop browsing - peers=[\n%s]", (uint8_t *)&v6, 0x26u);
    }
  }
  [(GKDiscoveryBonjour *)self->_bonjour stopBrowsing];
}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
      {
        uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        if (a4)
        {
LABEL_5:
          uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_8:
          *(_DWORD *)buf = 136316418;
          uint64_t v19 = v11;
          __int16 v20 = 2080;
          long long v21 = "-[GKDiscoveryManager sendDataToParticipant:deviceID:data:withCompletionHandler:]";
          __int16 v22 = 1024;
          int v23 = 723;
          __int16 v24 = 2080;
          uint64_t v25 = v13;
          __int16 v26 = 2080;
          int v27 = v14;
          __int16 v28 = 2048;
          uint64_t v29 = [a5 length];
          _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d to playerID [%s] deviceID [%s] dataSize [%lu]", buf, 0x3Au);
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v13 = "<nil>";
        if (a4) {
          goto LABEL_5;
        }
      }
      uint64_t v14 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  id v15 = (id)[a6 copy];
  peersQueue = self->_peersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__GKDiscoveryManager_sendDataToParticipant_deviceID_data_withCompletionHandler___block_invoke;
  block[3] = &unk_2645B82E0;
  void block[4] = self;
  void block[5] = a4;
  void block[7] = a5;
  block[8] = v15;
  void block[6] = a3;
  dispatch_async(peersQueue, block);
}

void __80__GKDiscoveryManager_sendDataToParticipant_deviceID_data_withCompletionHandler___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    if (![v2 state]) {
      [*(id *)(a1 + 32) processEvent:1001 forPeer:v3 withUserInfo:0];
    }
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    [v3 sendData:v4 withCompletionHandler:v5];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        __80__GKDiscoveryManager_sendDataToParticipant_deviceID_data_withCompletionHandler___block_invoke_cold_1(v6, a1);
      }
    }
    if (*(void *)(a1 + 64))
    {
      uint64_t v7 = *MEMORY[0x263F08320];
      v8[0] = @"Peer does not exist";
      objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryManager", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

- (void)forgetParticipant:(id)a3 deviceID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = [(GKDiscoveryManager *)self serviceNameforDeviceID:a4 playerID:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        __int16 v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      }
      else {
        __int16 v10 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      __int16 v16 = "-[GKDiscoveryManager forgetParticipant:deviceID:]";
      __int16 v17 = 1024;
      int v18 = 754;
      __int16 v19 = 2080;
      __int16 v20 = v10;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forget peer [%s]", buf, 0x26u);
    }
  }
  peersQueue = self->_peersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__GKDiscoveryManager_forgetParticipant_deviceID___block_invoke;
  block[3] = &unk_2645B7C90;
  void block[4] = self;
  void block[5] = a4;
  void block[6] = a3;
  dispatch_async(peersQueue, block);
}

void __49__GKDiscoveryManager_forgetParticipant_deviceID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 invalidate];
    [*(id *)(a1 + 32) processEvent:1006 forPeer:v3 withUserInfo:0];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
    [v5 removeObjectForKey:v4];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    id v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(a1 + 48);
      if (v8) {
        uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      __int16 v10 = *(void **)(a1 + 40);
      if (v10) {
        uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
      }
      else {
        uint64_t v11 = "<nil>";
      }
      int v12 = 136316162;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      __int16 v15 = "-[GKDiscoveryManager forgetParticipant:deviceID:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 759;
      __int16 v18 = 2080;
      __int16 v19 = v9;
      __int16 v20 = 2080;
      uint64_t v21 = v11;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d can't remove peer with %s with device id %s, no such peer exists", (uint8_t *)&v12, 0x30u);
    }
  }
}

- (void)addInterface:(unsigned int)a3 withDiscoveryInfo:(id)a4 forPeerWithServiceName:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([(GKDiscoveryManager *)self peersList])
      {
        int v12 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
        if (a5)
        {
LABEL_5:
          uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
LABEL_8:
          int v46 = 136316418;
          uint64_t v47 = v10;
          __int16 v48 = 2080;
          BOOL v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
          __int16 v50 = 1024;
          int v51 = 774;
          __int16 v52 = 2080;
          *(void *)__int16 v53 = v12;
          *(_WORD *)&v53[8] = 1024;
          *(_DWORD *)&v53[10] = a3;
          *(_WORD *)&v53[14] = 2080;
          *(void *)&v53[16] = v13;
          _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peers=[\n%s] add interface [%d] for serviceName [%s]", (uint8_t *)&v46, 0x36u);
          goto LABEL_9;
        }
      }
      else
      {
        int v12 = "<nil>";
        if (a5) {
          goto LABEL_5;
        }
      }
      uint64_t v13 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  id v14 = +[GKDiscoveryManager parseDeviceIDFromServiceName:a5];
  __int16 v15 = (void *)[(NSMutableDictionary *)self->_peers objectForKeyedSubscript:v14];
  if (v15)
  {
    __int16 v16 = v15;
    if (objc_msgSend((id)objc_msgSend(v15, "interfaces"), "containsObject:", v9))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        __int16 v18 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = [v9 intValue];
          if (a5) {
            __int16 v20 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
          }
          else {
            __int16 v20 = "<nil>";
          }
          int v46 = 136316162;
          uint64_t v47 = v17;
          __int16 v48 = 2080;
          BOOL v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
          __int16 v50 = 1024;
          int v51 = 812;
          __int16 v52 = 1024;
          *(_DWORD *)__int16 v53 = v19;
          *(_WORD *)&v53[4] = 2080;
          *(void *)&v53[6] = v20;
          __int16 v35 = " [%s] %s:%d asked to add already existing interface (%d) for service name %s";
          __int16 v36 = v18;
          uint32_t v37 = 44;
          goto LABEL_46;
        }
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v16, "interfaces"), "addObject:", v9);
      if (objc_msgSend((id)objc_msgSend(v16, "orderedInterfaces"), "count")
        || objc_msgSend((id)objc_msgSend(v16, "attemptedInterfaces"), "count"))
      {
        objc_msgSend((id)objc_msgSend(v16, "orderedInterfaces"), "addObject:", v9);
        objc_msgSend(v16, "setOrderedInterfaces:", objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", +[GKInterfacePrioritizer prioritizeLocalInterfaces:](GKInterfacePrioritizer, "prioritizeLocalInterfaces:", objc_msgSend(v16, "orderedInterfaces"))));
      }
      if ([v16 shouldSignalDiscovery] && self->_playerFoundHandler)
      {
        if (![v16 state]) {
          [(GKDiscoveryManager *)self processEvent:1000 forPeer:v16 withUserInfo:0];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          __int16 v31 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            if (a5) {
              int v32 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
            }
            else {
              int v32 = "<nil>";
            }
            int v46 = 136315906;
            uint64_t v47 = v30;
            __int16 v48 = 2080;
            BOOL v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
            __int16 v50 = 1024;
            int v51 = 832;
            __int16 v52 = 2080;
            *(void *)__int16 v53 = v32;
            _os_log_impl(&dword_221563000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d signaling discovery of an existing peer [%s] to GK", (uint8_t *)&v46, 0x26u);
          }
        }
        (*((void (**)(id, uint64_t, uint64_t, id))self->_playerFoundHandler + 2))(self->_playerFoundHandler, [v16 playerID], objc_msgSend(v16, "deviceID"), a4);
        [v16 setShouldSignalDiscovery:0];
      }
    }
  }
  else
  {
    id v21 = [(GKDiscoveryManager *)self localServiceName];
    if (v21)
    {
      uint64_t v22 = v21;
      int v23 = [[GKDiscoveryPeer alloc] initWithServiceName:a5];
      if (v23)
      {
        __int16 v24 = v23;
        [(NSMutableSet *)[(GKDiscoveryPeer *)v23 interfaces] addObject:v9];
        [(NSMutableDictionary *)self->_peers setObject:v24 forKeyedSubscript:v14];
        uint64_t v25 = [(GKDiscoveryPeer *)v24 playerID];
        __int16 v26 = [(GKDiscoveryPeer *)v24 deviceID];
        if (self->_playerFoundHandler)
        {
          [(GKDiscoveryManager *)self processEvent:1000 forPeer:v24 withUserInfo:0];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v27 = VRTraceErrorLogLevelToCSTR();
            __int16 v28 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if (a5) {
                uint64_t v29 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
              }
              else {
                uint64_t v29 = "<nil>";
              }
              int v46 = 136315906;
              uint64_t v47 = v27;
              __int16 v48 = 2080;
              BOOL v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
              __int16 v50 = 1024;
              int v51 = 802;
              __int16 v52 = 2080;
              *(void *)__int16 v53 = v29;
              _os_log_impl(&dword_221563000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d signaling discovery of a new peer [%s] to GK", (uint8_t *)&v46, 0x26u);
            }
          }
          (*((void (**)(void))self->_playerFoundHandler + 2))();
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v41 = VRTraceErrorLogLevelToCSTR();
          __int16 v42 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            if (v25) {
              int v43 = [[(NSString *)v25 description] UTF8String];
            }
            else {
              int v43 = "<nil>";
            }
            if (v26) {
              uint64_t v45 = [[(NSString *)v26 description] UTF8String];
            }
            else {
              uint64_t v45 = "<nil>";
            }
            int v46 = 136316162;
            uint64_t v47 = v41;
            __int16 v48 = 2080;
            BOOL v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
            __int16 v50 = 1024;
            int v51 = 805;
            __int16 v52 = 2080;
            *(void *)__int16 v53 = v43;
            *(_WORD *)&v53[8] = 2080;
            *(void *)&v53[10] = v45;
            _os_log_error_impl(&dword_221563000, v42, OS_LOG_TYPE_ERROR, " [%s] %s:%d playerFoundHandler is not set, found %s with device id %s, but cannot inform the GameKit layer.", (uint8_t *)&v46, 0x30u);
          }
        }
        [(GKDiscoveryPeer *)v24 setShouldSignalDiscovery:0];
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v38 = VRTraceErrorLogLevelToCSTR();
        uint64_t v39 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
        {
          if (a5) {
            __int16 v40 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
          }
          else {
            __int16 v40 = "<nil>";
          }
          uint64_t v44 = objc_msgSend((id)objc_msgSend(v22, "description"), "UTF8String");
          int v46 = 136316162;
          uint64_t v47 = v38;
          __int16 v48 = 2080;
          BOOL v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
          __int16 v50 = 1024;
          int v51 = 790;
          __int16 v52 = 2080;
          *(void *)__int16 v53 = v40;
          *(_WORD *)&v53[8] = 2080;
          *(void *)&v53[10] = v44;
          _os_log_error_impl(&dword_221563000, v39, OS_LOG_TYPE_ERROR, " [%s] %s:%d peer initialization for serviceName: %s and localServiceName: %s failed", (uint8_t *)&v46, 0x30u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      int v34 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v46 = 136315650;
        uint64_t v47 = v33;
        __int16 v48 = 2080;
        BOOL v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
        __int16 v50 = 1024;
        int v51 = 785;
        __int16 v35 = " [%s] %s:%d localServiceName is nil; ignoring browseCallback";
        __int16 v36 = v34;
        uint32_t v37 = 28;
LABEL_46:
        _os_log_impl(&dword_221563000, v36, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&v46, v37);
      }
    }
  }
}

- (id)peersList
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263F089D8] string];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  peers = self->_peers;
  uint64_t v5 = [(NSMutableDictionary *)peers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(peers);
        }
        [v3 appendFormat:@"\"%@\" - %@\n", *(void *)(*((void *)&v10 + 1) + 8 * i), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peers, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i)), "description")];
      }
      uint64_t v6 = [(NSMutableDictionary *)peers countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)didLosePeer:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if ([a3 serviceName]) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "serviceName"), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      int v14 = 136315906;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      uint64_t v17 = "-[GKDiscoveryManager didLosePeer:]";
      __int16 v18 = 1024;
      int v19 = 850;
      __int16 v20 = 2080;
      id v21 = v7;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] peer lost!", (uint8_t *)&v14, 0x26u);
    }
  }
  [(GKDiscoveryManager *)self processEvent:1006 forPeer:a3 withUserInfo:0];
  [a3 flushDataBuffer];
  id playerLostHandler = self->_playerLostHandler;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (playerLostHandler)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if ([a3 serviceName]) {
          long long v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "serviceName"), "description"), "UTF8String");
        }
        else {
          long long v12 = "<nil>";
        }
        int v14 = 136315906;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        uint64_t v17 = "-[GKDiscoveryManager didLosePeer:]";
        __int16 v18 = 1024;
        int v19 = 861;
        __int16 v20 = 2080;
        id v21 = v12;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] about to notify GK that the peer was lost", (uint8_t *)&v14, 0x26u);
      }
    }
    (*((void (**)(id, uint64_t, uint64_t))self->_playerLostHandler + 2))(self->_playerLostHandler, [a3 playerID], objc_msgSend(a3, "deviceID"));
    [a3 invalidate];
    -[NSMutableDictionary removeObjectForKey:](self->_peers, "removeObjectForKey:", [a3 deviceID]);
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      -[GKDiscoveryManager didLosePeer:](v13, a3);
    }
  }
}

- (void)removeInterface:(unsigned int)a3 forPeerWithServiceName:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_peers objectForKeyedSubscript:+[GKDiscoveryManager parseDeviceIDFromServiceName:a4]];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v15 = [v7 intValue];
    if (a4) {
      __int16 v16 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    }
    else {
      __int16 v16 = "<nil>";
    }
    int v24 = 136316162;
    uint64_t v25 = v13;
    __int16 v26 = 2080;
    uint64_t v27 = "-[GKDiscoveryManager removeInterface:forPeerWithServiceName:]";
    __int16 v28 = 1024;
    int v29 = 874;
    __int16 v30 = 1024;
    *(_DWORD *)__int16 v31 = v15;
    *(_WORD *)&v31[4] = 2080;
    *(void *)&v31[6] = v16;
    __int16 v20 = " [%s] %s:%d cannot remove interface (%d) because service name %s does not exist";
LABEL_22:
    _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v24, 0x2Cu);
    return;
  }
  uint64_t v9 = v8;
  if ((objc_msgSend((id)objc_msgSend(v8, "interfaces"), "containsObject:", v7) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v18 = [v7 intValue];
    if (a4) {
      int v19 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    }
    else {
      int v19 = "<nil>";
    }
    int v24 = 136316162;
    uint64_t v25 = v17;
    __int16 v26 = 2080;
    uint64_t v27 = "-[GKDiscoveryManager removeInterface:forPeerWithServiceName:]";
    __int16 v28 = 1024;
    int v29 = 879;
    __int16 v30 = 1024;
    *(_DWORD *)__int16 v31 = v18;
    *(_WORD *)&v31[4] = 2080;
    *(void *)&v31[6] = v19;
    __int16 v20 = " [%s] %s:%d cannot remove interface (%d) for service name %s because it is not in the interfaces set";
    goto LABEL_22;
  }
  [v9 didLoseInterface:v7];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        long long v12 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        long long v12 = "<nil>";
      }
      if (objc_msgSend(v9, "stringForState:", objc_msgSend(v9, "state"))) {
        id v21 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "stringForState:", objc_msgSend(v9, "state")), "description"), "UTF8String");
      }
      else {
        id v21 = "<nil>";
      }
      uint64_t v22 = [v9 connection];
      if (objc_msgSend((id)objc_msgSend(v9, "interfaces"), "description")) {
        int v23 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "interfaces"), "description"), "description"), "UTF8String");
      }
      else {
        int v23 = "<nil>";
      }
      int v24 = 136316930;
      uint64_t v25 = v10;
      __int16 v26 = 2080;
      uint64_t v27 = "-[GKDiscoveryManager removeInterface:forPeerWithServiceName:]";
      __int16 v28 = 1024;
      int v29 = 886;
      __int16 v30 = 2080;
      *(void *)__int16 v31 = v12;
      *(_WORD *)&v31[8] = 2080;
      *(void *)&v31[10] = v21;
      __int16 v32 = 1024;
      unsigned int v33 = a3;
      __int16 v34 = 2048;
      uint64_t v35 = v22;
      __int16 v36 = 2080;
      uint32_t v37 = v23;
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] state [%s] removed interface [%d] peerConnection [%p] remaining interfaces [%s]", (uint8_t *)&v24, 0x4Au);
    }
  }
  if (objc_msgSend((id)objc_msgSend(v9, "chosenInterface"), "isEqualToNumber:", v7)
    && [v9 state] == 3)
  {
    [(GKDiscoveryManager *)self processEvent:1006 forPeer:v9 withUserInfo:0];
  }
  if (!objc_msgSend((id)objc_msgSend(v9, "interfaces"), "count") && !objc_msgSend(v9, "state")) {
    [(GKDiscoveryManager *)self didLosePeer:v9];
  }
}

- (NSMutableDictionary)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
}

- (id)playerFoundHandler
{
  return self->_playerFoundHandler;
}

- (void)setPlayerFoundHandler:(id)a3
{
}

- (id)playerLostHandler
{
  return self->_playerLostHandler;
}

- (void)setPlayerLostHandler:(id)a3
{
}

- (id)receiveDataHandler
{
  return self->_receiveDataHandler;
}

- (void)setReceiveDataHandler:(id)a3
{
}

- (GKDiscoveryBonjour)bonjour
{
  return self->_bonjour;
}

- (void)setBonjour:(id)a3
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

void __37__GKDiscoveryManager_resolveForPeer___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  if ([*(id *)(v1 + 32) serviceName]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v0 + 32), "serviceName"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v2, v3, " [%s] %s:%d peer [%s] invalid sockaddr", v4, v5, v6, v7, v8);
}

void __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  if ([*v1 serviceName]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v0, "serviceName"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v2, v3, " [%s] %s:%d stale service name [%s] advertised - closing connection", v4, v5, v6, v7, v8);
}

void __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a2 + 32) serviceName]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 32), "serviceName"), "description"), "UTF8String");
  }
  if ([*(id *)(a2 + 40) localizedDescription]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 40), "localizedDescription"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_221563000, v3, v4, " [%s] %s:%d peer [%s] data received with error %s", v5, v6, v7, v8, v9);
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_43_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  if ([v1 localizedDescription]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v0, "localizedDescription"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v2, v3, " [%s] %s:%d peerConnection connectedHandler (advertiser side) - error [%s]", v4, v5, v6, v7, v8);
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_44_cold_1(uint64_t a1, id *a2)
{
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v2, v3, " [%s] %s:%d unrecognized remoteServiceName [%s] - peer init failed", v4, v5, v6, v7, v8);
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  [*(id *)(v1 + 40) deviceID];
  uint64_t v2 = OUTLINED_FUNCTION_8_2();
  if (OUTLINED_FUNCTION_5_2(v2))
  {
    [*(id *)(v0 + 40) deviceID];
    uint64_t v3 = OUTLINED_FUNCTION_8_2();
    objc_msgSend((id)objc_msgSend((id)OUTLINED_FUNCTION_5_2(v3), "description"), "UTF8String");
  }
  if ([*(id *)(v0 + 48) localizedDescription]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v0 + 48), "localizedDescription"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_1(&dword_221563000, v4, v5, " [%s] %s:%d data from peer [%s] received with error %s", v6, v7, v8, v9, v10);
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  [*(id *)(v1 + 40) deviceID];
  uint64_t v2 = OUTLINED_FUNCTION_8_2();
  if (OUTLINED_FUNCTION_5_2(v2))
  {
    [*(id *)(v0 + 40) deviceID];
    uint64_t v3 = OUTLINED_FUNCTION_8_2();
    objc_msgSend((id)objc_msgSend((id)OUTLINED_FUNCTION_5_2(v3), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v4, v5, " [%s] %s:%d nil data from peer [%s] received -- should not happen", v6, v7, v8, v9, v10);
}

void __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = "-[GKDiscoveryManager startBrowsingLocalPlayer:]_block_invoke";
  __int16 v7 = 1024;
  int v8 = 690;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_221563000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d browsing callback returned an error (%d) - currently not handled.", (uint8_t *)&v3, 0x22u);
}

void __80__GKDiscoveryManager_sendDataToParticipant_deviceID_data_withCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 48);
  if (v2) {
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_221563000, v3, v4, " [%s] %s:%d can't send data to participant %s: peer does not exist", v5, v6, v7, v8, v9);
}

- (void)didLosePeer:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  if ([a2 playerID]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "playerID"), "description"), "UTF8String");
  }
  if ([a2 deviceID]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "deviceID"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_221563000, v3, v4, " [%s] %s:%d playerLostHandler is not set, removed %s with device id %s, but cannot inform the GameKit layer.", v5, v6, v7, v8, v9);
}

@end