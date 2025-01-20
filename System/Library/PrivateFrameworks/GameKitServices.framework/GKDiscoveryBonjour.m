@interface GKDiscoveryBonjour
- (BOOL)isAppleTV;
- (GKDiscoveryBonjour)init;
- (GKDiscoveryBonjour)initWithDomain:(id)a3 type:(id)a4;
- (NSMutableArray)launchdSources;
- (NSMutableDictionary)resolveContainers;
- (NSString)serviceDomain;
- (NSString)serviceType;
- (OS_dispatch_queue)resolveContainersSyncQueue;
- (_DNSServiceRef_t)advertiseRef;
- (_DNSServiceRef_t)browseRef;
- (id)browseCallback;
- (id)connectionCallback;
- (id)serviceNameCollisionCallback;
- (int)ipV4Socket;
- (int)ipV6Socket;
- (int)resolveName:(id)a3 onIndex:(unsigned int)a4 withCompletionHandler:(id)a5;
- (int)startBrowsing:(id)a3;
- (void)closeListeningSockets;
- (void)createDispatchEventWithSocket:(int)a3;
- (void)dealloc;
- (void)ipV4Socket;
- (void)ipV6Socket;
- (void)sendBonjourRegistrationEvent:(id)a3 discoveryInfo:(id)a4;
- (void)setAdvertiseRef:(_DNSServiceRef_t *)a3;
- (void)setBrowseCallback:(id)a3;
- (void)setBrowseRef:(_DNSServiceRef_t *)a3;
- (void)setConnectionCallback:(id)a3;
- (void)setLaunchdSources:(id)a3;
- (void)setResolveContainers:(id)a3;
- (void)setResolveContainersSyncQueue:(id)a3;
- (void)setServiceDomain:(id)a3;
- (void)setServiceNameCollisionCallback:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setupBothListeningSockets;
- (void)setupListeningSockets;
- (void)startAdvertisingServiceName:(id)a3 discoveryInfo:(id)a4;
- (void)stopAdvertising;
- (void)stopBrowsing;
- (void)stopResolve:(id)a3;
@end

@implementation GKDiscoveryBonjour

- (GKDiscoveryBonjour)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKDiscoveryBonjour;
  [(GKDiscoveryBonjour *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (GKDiscoveryBonjour)initWithDomain:(id)a3 type:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKDiscoveryBonjour;
  v6 = [(GKDiscoveryBonjour *)&v8 init];
  if (v6)
  {
    v6->_serviceDomain = (NSString *)[a3 copy];
    v6->_serviceType = (NSString *)[a4 copy];
    v6->_launchdSources = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v6->_resolveContainers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->_resolveContainersSyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamed.GKDiscoveryBonjour.resolveContanersSyncQueue", 0);
  }
  return v6;
}

- (BOOL)isAppleTV
{
  if (isAppleTV_predicate != -1) {
    dispatch_once(&isAppleTV_predicate, &__block_literal_global_1);
  }
  return isAppleTV_deviceClass == 4;
}

void __31__GKDiscoveryBonjour_isAppleTV__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  isAppleTV_deviceClass = [v0 intValue];
  if (v0)
  {
    CFRelease(v0);
  }
}

- (void)dealloc
{
  browseRef = self->_browseRef;
  if (browseRef) {
    DNSServiceRefDeallocate(browseRef);
  }
  advertiseRef = self->_advertiseRef;
  if (advertiseRef)
  {
    DNSServiceRefDeallocate(advertiseRef);
  }
  [(GKDiscoveryBonjour *)self closeListeningSockets];

  resolveContainersSyncQueue = self->_resolveContainersSyncQueue;
  if (resolveContainersSyncQueue) {
    dispatch_release(resolveContainersSyncQueue);
  }
  v6.receiver = self;
  v6.super_class = (Class)GKDiscoveryBonjour;
  [(GKDiscoveryBonjour *)&v6 dealloc];
}

- (int)startBrowsing:(id)a3
{
  p_browseRef = &self->_browseRef;
  if (self->_browseRef) {
    [(GKDiscoveryBonjour *)self stopBrowsing];
  }
  [(GKDiscoveryBonjour *)self setBrowseCallback:a3];
  DNSServiceErrorType v6 = DNSServiceBrowse(p_browseRef, 0x20000u, 0, [(NSString *)self->_serviceType UTF8String], [(NSString *)self->_serviceDomain UTF8String], (DNSServiceBrowseReply)gkDiscoveryBrowseCallback, self);
  if (v6)
  {
    DNSServiceErrorType v7 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryBonjour startBrowsing:]();
      }
    }
  }
  else
  {
    DNSServiceErrorType v7 = DNSServiceSetDispatchQueue(*p_browseRef, MEMORY[0x263EF83A0]);
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          -[GKDiscoveryBonjour startBrowsing:]();
        }
      }
    }
  }
  return v7;
}

- (void)stopBrowsing
{
  browseRef = self->_browseRef;
  if (browseRef)
  {
    DNSServiceRefDeallocate(browseRef);
    self->_browseRef = 0;
  }
  [(GKDiscoveryBonjour *)self setBrowseCallback:0];
}

- (int)resolveName:(id)a3 onIndex:(unsigned int)a4 withCompletionHandler:(id)a5
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -1431655766;
  resolveContainersSyncQueue = self->_resolveContainersSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke;
  block[3] = &unk_2645B8338;
  block[4] = self;
  block[5] = a3;
  block[6] = a5;
  block[7] = &v10;
  unsigned int v9 = a4;
  dispatch_sync(resolveContainersSyncQueue, block);
  int v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(GKDiscoveryBonjourResolveContainer);
  [(GKDiscoveryBonjourResolveContainer *)v2 setResolveCompletionHandler:*(void *)(a1 + 48)];
  [(GKDiscoveryBonjourResolveContainer *)v2 setContext:*(void *)(a1 + 32)];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolveContainers"), "setObject:forKey:", v2, *(void *)(a1 + 40));
  DNSServiceRef sdRef = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = DNSServiceResolve(&sdRef, 0x20000u, *(_DWORD *)(a1 + 64), (const char *)[*(id *)(a1 + 40) UTF8String], (const char *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "UTF8String"), (const char *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "UTF8String"), (DNSServiceResolveReply)gkDiscoveryResolveCallback, v2);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke_cold_2();
      }
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = DNSServiceSetDispatchQueue(sdRef, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 96));
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
LABEL_11:
    if (sdRef)
    {
      objc_super v3 = [(GKDiscoveryBonjourResolveContainer *)v2 serviceRefList];
      -[NSMutableArray addObject:](v3, "addObject:", [MEMORY[0x263F08D40] valueWithPointer:sdRef]);
    }
    goto LABEL_13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke_cold_1();
    }
  }
  if (sdRef)
  {
    DNSServiceRefDeallocate(sdRef);
    DNSServiceRef sdRef = 0;
  }
LABEL_13:
}

- (void)stopResolve:(id)a3
{
  resolveContainersSyncQueue = self->_resolveContainersSyncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__GKDiscoveryBonjour_stopResolve___block_invoke;
  v4[3] = &unk_2645B7C68;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(resolveContainersSyncQueue, v4);
}

uint64_t __34__GKDiscoveryBonjour_stopResolve___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) resolveContainers];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 removeObjectForKey:v3];
}

- (void)createDispatchEventWithSocket:(int)a3
{
  v5 = dispatch_source_create(MEMORY[0x263EF83E8], a3, 0, MEMORY[0x263EF83A0]);
  id v6 = [(GKDiscoveryBonjour *)self connectionCallback];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __52__GKDiscoveryBonjour_createDispatchEventWithSocket___block_invoke;
  handler[3] = &unk_2645B8360;
  int v11 = a3;
  handler[4] = v6;
  dispatch_source_set_event_handler(v5, handler);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__GKDiscoveryBonjour_createDispatchEventWithSocket___block_invoke_2;
  v8[3] = &__block_descriptor_36_e5_v8__0l;
  int v9 = a3;
  dispatch_source_set_cancel_handler(v5, v8);
  dispatch_resume(v5);
  DNSServiceErrorType v7 = [(GKDiscoveryBonjour *)self launchdSources];
  -[NSMutableArray addObject:](v7, "addObject:", [MEMORY[0x263F08D40] valueWithPointer:v5]);
}

uint64_t __52__GKDiscoveryBonjour_createDispatchEventWithSocket___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(void *)&v2.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v2.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  sockaddr v11 = v2;
  sockaddr v12 = v2;
  sockaddr v9 = v2;
  sockaddr v10 = v2;
  sockaddr v7 = v2;
  sockaddr v8 = v2;
  sockaddr v5 = v2;
  sockaddr v6 = v2;
  socklen_t v4 = -1431655766;
  uint64_t result = accept(*(_DWORD *)(a1 + 40), &v5, &v4);
  if (result != -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __52__GKDiscoveryBonjour_createDispatchEventWithSocket___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (int)ipV4Socket
{
  int v5 = 1;
  int v2 = socket(2, 1, 0);
  if (v2 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryBonjour ipV4Socket]();
      }
    }
    return -1;
  }
  int v3 = v2;
  if (setsockopt(v2, 0xFFFF, 4, &v5, 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryBonjour ipV4Socket]();
      }
    }
    close(v3);
    return -1;
  }
  return v3;
}

- (int)ipV6Socket
{
  int v5 = 1;
  int v2 = socket(30, 1, 0);
  if (v2 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryBonjour ipV6Socket]();
      }
    }
    return -1;
  }
  int v3 = v2;
  if (setsockopt(v2, 0xFFFF, 4, &v5, 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryBonjour ipV6Socket]();
      }
    }
    goto LABEL_13;
  }
  if (setsockopt(v3, 41, 27, &v5, 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryBonjour ipV6Socket]();
      }
    }
LABEL_13:
    close(v3);
    return -1;
  }
  return v3;
}

- (void)setupBothListeningSockets
{
  OUTLINED_FUNCTION_12();
  __error();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_221563000, v0, v1, " [%s] %s:%d listen() failed for ipV6 local gaming advertising (%d)", v2, v3, v4, v5, v6);
}

- (void)setupListeningSockets
{
  [(GKDiscoveryBonjour *)self closeListeningSockets];
  [(GKDiscoveryBonjour *)self setupBothListeningSockets];
}

- (void)closeListeningSockets
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  launchdSources = self->_launchdSources;
  uint64_t v4 = [(NSMutableArray *)launchdSources countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(launchdSources);
        }
        sockaddr v8 = [*(id *)(*((void *)&v9 + 1) + 8 * i) pointerValue];
        dispatch_source_cancel(v8);
        if (v8) {
          dispatch_release(v8);
        }
      }
      uint64_t v5 = [(NSMutableArray *)launchdSources countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_launchdSources removeAllObjects];
}

- (void)sendBonjourRegistrationEvent:(id)a3 discoveryInfo:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  txtRecord.ForceNaturalAlignment = (char *)0xAAAAAAAAAAAAAAAALL;
  *((void *)&txtRecord.ForceNaturalAlignment + 1) = 0xAAAAAAAAAAAAAAAALL;
  TXTRecordCreate(&txtRecord, 0, 0);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = (void *)[a4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v10 = (void *)[a4 valueForKey:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v11 = (const char *)[v10 UTF8String];
          long long v12 = (const char *)[v9 UTF8String];
          uint8_t v13 = strlen(v11);
          DNSServiceErrorType v14 = TXTRecordSetValue(&txtRecord, v12, v13, v11);
          if (v14)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v15 = VRTraceErrorLogLevelToCSTR();
              v16 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = v15;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[GKDiscoveryBonjour sendBonjourRegistrationEvent:discoveryInfo:]";
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v32) = 762;
                WORD2(v32) = 1024;
                *(_DWORD *)((char *)&v32 + 6) = v14;
                _os_log_error_impl(&dword_221563000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d txt record set value failed with error [%d]", buf, 0x22u);
              }
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v6);
  }
  p_advertiseRef = &self->_advertiseRef;
  advertiseRef = self->_advertiseRef;
  if (advertiseRef)
  {
    DNSServiceRefDeallocate(advertiseRef);
    *p_advertiseRef = 0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  *(void *)&long long v32 = __Block_byref_object_copy__0;
  *((void *)&v32 + 1) = __Block_byref_object_dispose__0;
  v33 = self;

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __65__GKDiscoveryBonjour_sendBonjourRegistrationEvent_discoveryInfo___block_invoke;
  v26[3] = &unk_2645B8388;
  v26[4] = a4;
  v26[5] = buf;
  self->_collisionCallback = (id)[v26 copy];
  v19 = (const char *)[a3 UTF8String];
  v20 = [(NSString *)self->_serviceType UTF8String];
  unsigned int listeningPort_low = LOWORD(self->_listeningPort);
  uint16_t txtLen = TXTRecordGetLength(&txtRecord);
  BytesPtr = TXTRecordGetBytesPtr(&txtRecord);
  if (DNSServiceRegister(p_advertiseRef, 0x20008u, 0, v19, v20, 0, 0, bswap32(listeningPort_low) >> 16, txtLen, BytesPtr, (DNSServiceRegisterReply)gkDiscoveryRegisterCallback, self->_collisionCallback))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryBonjour sendBonjourRegistrationEvent:discoveryInfo:]();
      }
    }
  }
  else if (DNSServiceSetDispatchQueue(*p_advertiseRef, MEMORY[0x263EF83A0]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryBonjour sendBonjourRegistrationEvent:discoveryInfo:]();
      }
    }
  }
  TXTRecordDeallocate(&txtRecord);
  _Block_object_dispose(buf, 8);
}

uint64_t __65__GKDiscoveryBonjour_sendBonjourRegistrationEvent_discoveryInfo___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) serviceNameCollisionCallback];
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v4 = (*(uint64_t (**)(void))([v3 serviceNameCollisionCallback] + 16))();
    uint64_t v5 = *(void *)(a1 + 32);
    return [v3 sendBonjourRegistrationEvent:v4 discoveryInfo:v5];
  }
  return result;
}

- (void)startAdvertisingServiceName:(id)a3 discoveryInfo:(id)a4
{
  [(GKDiscoveryBonjour *)self setupListeningSockets];
  [(GKDiscoveryBonjour *)self sendBonjourRegistrationEvent:a3 discoveryInfo:a4];
}

- (void)stopAdvertising
{
  advertiseRef = self->_advertiseRef;
  if (advertiseRef)
  {
    DNSServiceRefDeallocate(advertiseRef);

    self->_collisionCallback = 0;
    self->_advertiseRef = 0;
    [(GKDiscoveryBonjour *)self closeListeningSockets];
  }
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceDomain
{
  return self->_serviceDomain;
}

- (void)setServiceDomain:(id)a3
{
}

- (_DNSServiceRef_t)browseRef
{
  return self->_browseRef;
}

- (void)setBrowseRef:(_DNSServiceRef_t *)a3
{
  self->_browseRef = a3;
}

- (_DNSServiceRef_t)advertiseRef
{
  return self->_advertiseRef;
}

- (void)setAdvertiseRef:(_DNSServiceRef_t *)a3
{
  self->_advertiseRef = a3;
}

- (NSMutableArray)launchdSources
{
  return self->_launchdSources;
}

- (void)setLaunchdSources:(id)a3
{
}

- (NSMutableDictionary)resolveContainers
{
  return self->_resolveContainers;
}

- (void)setResolveContainers:(id)a3
{
}

- (id)browseCallback
{
  return self->_browseCallback;
}

- (void)setBrowseCallback:(id)a3
{
}

- (id)connectionCallback
{
  return self->_connectionCallback;
}

- (void)setConnectionCallback:(id)a3
{
}

- (OS_dispatch_queue)resolveContainersSyncQueue
{
  return self->_resolveContainersSyncQueue;
}

- (void)setResolveContainersSyncQueue:(id)a3
{
}

- (id)serviceNameCollisionCallback
{
  return self->_serviceNameCollisionCallback;
}

- (void)setServiceNameCollisionCallback:(id)a3
{
}

- (void)startBrowsing:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
}

- (void)startBrowsing:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d service browse failed with error [%d]", v2, v3, v4, v5);
}

void __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
}

void __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_13_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d DNS service resolve failed with error [%d]", v2, v3, v4, v5);
}

- (void)ipV4Socket
{
  OUTLINED_FUNCTION_12();
  __error();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_221563000, v0, v1, " [%s] %s:%d setsockopt() failed for ipV4 local gaming advertising (%d)", v2, v3, v4, v5, v6);
}

- (void)ipV6Socket
{
  OUTLINED_FUNCTION_12();
  __error();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_221563000, v0, v1, " [%s] %s:%d setsockopt(IPV6_V6ONLY) failed for ipV6 local gaming advertising (%d)", v2, v3, v4, v5, v6);
}

- (void)sendBonjourRegistrationEvent:discoveryInfo:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
}

- (void)sendBonjourRegistrationEvent:discoveryInfo:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d service registration failed with error [%d]", v2, v3, v4, v5);
}

@end