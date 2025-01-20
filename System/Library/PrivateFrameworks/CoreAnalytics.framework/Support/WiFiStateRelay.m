@interface WiFiStateRelay
- (BOOL)wiFiActiveAndUsingPersonalHotspot;
- (CWFInterface)coreWiFiInterface;
- (WiFiStateRelay)initWithMonitoring:(WiFiStateDelegate *)a3;
- (char)retrieveWiFILQM:(id)a3;
- (id).cxx_construct;
- (optional<std::string>)retrieveRadioTech;
- (queue)getQueue;
- (void)configureCWFInterfaceEventHandler;
- (void)configureSCDynamicStore;
- (void)dealloc;
- (void)deregisterForCWEventTypes;
- (void)refreshWiFiLQM;
- (void)refreshWiFiLQM:(id)a3;
- (void)refreshWiFiRadioTech;
- (void)registerForCWEventTypes;
- (void)registerForSCDynamicStoreLQMUpdates;
- (void)setCoreWiFiInterface:(id)a3;
- (void)teardownSCDynamicStore;
- (void)updateDelegateWithInitialStates;
@end

@implementation WiFiStateRelay

- (WiFiStateRelay)initWithMonitoring:(WiFiStateDelegate *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WiFiStateRelay;
  id v4 = [(WiFiStateRelay *)&v12 init];
  if (!v4) {
    goto LABEL_4;
  }
  if (objc_opt_class())
  {
    *((void *)v4 + 1) = a3;
    dispatch_queue_t v5 = dispatch_queue_create("analyticsd.NetworkingStateResolver.WiFiStateRelay.myQueue", 0);
    v6 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = v5;

    [v4 configureSCDynamicStore];
    *(_OWORD *)buf = xmmword_100119C48;
    uint64_t v14 = 1;
    sub_100067204((char *)v4 + 32, (char *)buf, (uint64_t)&v15, 3uLL);
    id v7 = objc_alloc_init((Class)CWFInterface);
    v8 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v7;

    [v4 configureCWFInterfaceEventHandler];
    [*((id *)v4 + 8) activate];
    [v4 registerForCWEventTypes];
    [v4 registerForSCDynamicStoreLQMUpdates];
    [v4 updateDelegateWithInitialStates];
LABEL_4:
    v9 = (WiFiStateRelay *)v4;
    goto LABEL_8;
  }
  v10 = qword_10015EF78;
  if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[WiFiStateRelay] WARNING: Failed to get CoreWiFiInterface", buf, 2u);
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (void)dealloc
{
  fObj = self->_stateRelayQueue.fObj.fObj;
  p_stateRelayQueue = &self->_stateRelayQueue;
  if (fObj)
  {
    dispatch_queue_t v5 = sub_10000FD1C((id *)&p_stateRelayQueue->fObj.fObj);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100065FA4;
    block[3] = &unk_100153F58;
    block[4] = self;
    dispatch_sync(v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)WiFiStateRelay;
  [(WiFiStateRelay *)&v6 dealloc];
}

- (queue)getQueue
{
  v3 = v2;
  id v4 = self->_stateRelayQueue.fObj.fObj;
  *v3 = v4;
  return (queue)v4;
}

- (void)registerForCWEventTypes
{
  if (self->_coreWiFiInterface)
  {
    begin = self->_registeredCWEventTypes.__begin_;
    end = self->_registeredCWEventTypes.__end_;
    while (begin != end)
    {
      uint64_t v5 = *begin++;
      [(CWFInterface *)self->_coreWiFiInterface startMonitoringEventType:v5 error:0];
    }
  }
}

- (void)teardownSCDynamicStore
{
  if (self->_scDynamicStore)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = self->_scKeyPatterns;
    id v4 = (char *)[(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v7 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        objc_super v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          SCDynamicStoreRemoveWatchedKey();
          ++v6;
        }
        while (v4 != v6);
        id v4 = (char *)[(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v7 count:16];
      }
      while (v4);
    }

    CFRelease(self->_scDynamicStore);
  }
}

- (void)deregisterForCWEventTypes
{
  if (self->_coreWiFiInterface)
  {
    begin = self->_registeredCWEventTypes.__begin_;
    end = self->_registeredCWEventTypes.__end_;
    while (begin != end)
    {
      uint64_t v5 = *begin++;
      [(CWFInterface *)self->_coreWiFiInterface stopMonitoringEventType:v5];
    }
  }
}

- (void)configureSCDynamicStore
{
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  v3 = SCDynamicStoreCreate(0, @"com.apple.analyticsd.WiFiAnalytics", (SCDynamicStoreCallBack)sub_10006632C, &context);
  self->_scDynamicStore = v3;
  if (v3)
  {
    id v4 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
    SCDynamicStoreSetDispatchQueue(v3, v4);

    uint64_t v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    scKeyPatterns = self->_scKeyPatterns;
    self->_scKeyPatterns = v5;
  }
  else
  {
    id v7 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[WiFiStateRelay] WARNING: Failed to create SCDynamicStore", buf, 2u);
    }
  }
}

- (void)registerForSCDynamicStoreLQMUpdates
{
  if (self->_scDynamicStore)
  {
    NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, @"(en)[^/]+", kSCEntNetLinkQuality);
    if (NetworkInterfaceEntity)
    {
      if (SCDynamicStoreAddWatchedKey())
      {
        [(NSMutableArray *)self->_scKeyPatterns addObject:NetworkInterfaceEntity];
      }
      else
      {
        uint64_t v5 = qword_10015EF78;
        if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
          sub_1000FA92C(v5);
        }
      }
    }
    else
    {
      id v4 = qword_10015EF78;
      if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
        sub_1000FA8A8(v4);
      }
    }
  }
}

- (void)updateDelegateWithInitialStates
{
  v3 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000667B4;
  v4[3] = &unk_100153F58;
  v4[4] = self;
  dispatch_async(v3, v4);
}

- (void)refreshWiFiLQM
{
  coreWiFiInterface = self->_coreWiFiInterface;
  if (coreWiFiInterface)
  {
    uint64_t v4 = [(CWFInterface *)self->_coreWiFiInterface interfaceName];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(WiFiStateRelay *)self refreshWiFiLQM:v4];
  if (coreWiFiInterface)
  {
  }
}

- (void)refreshWiFiLQM:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NWInterface) initWithInterfaceName:v4];
    objc_super v6 = v5;
    if (v5 && [v5 type] == (id)1 && objc_msgSend(v6, "subtype") == (id)1001)
    {
      (*((void (**)(id *__return_ptr, WiFiStateDelegate *, uint64_t))self->delegate->var0 + 2))(&v9, self->delegate, [(WiFiStateRelay *)self retrieveWiFILQM:v4] | 0x100);
      id v7 = v9;
      id v9 = 0;
    }
  }
  else
  {
    (*((void (**)(void **__return_ptr))self->delegate->var0 + 2))(&v10);
    long long v8 = v10;
    long long v10 = 0;

    objc_super v6 = v10;
  }
}

- (void)configureCWFInterfaceEventHandler
{
  if (objc_opt_class())
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100066B58;
    v4[3] = &unk_100153F80;
    objc_copyWeak(&v5, &location);
    [(CWFInterface *)self->_coreWiFiInterface setEventHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    v3 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
    {
      LOWORD(location) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[WiFiStateRelay] WARNING: Failed to get CoreWiFiEvent", (uint8_t *)&location, 2u);
    }
  }
}

- (void)refreshWiFiRadioTech
{
  delegate = self->delegate;
  [(WiFiStateRelay *)self retrieveRadioTech];
  (*((void (**)(id *__return_ptr, WiFiStateDelegate *, void **))delegate->var0 + 3))(&v4, delegate, &__p);
  id v3 = v4;
  id v4 = 0;

  if (v7)
  {
    if (v6 < 0) {
      operator delete(__p);
    }
  }
}

- (optional<std::string>)retrieveRadioTech
{
  uint64_t v2 = v1;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&retstr->var0.var0 = v4;
  *((_OWORD *)&retstr->var0.var1.__r_.__value_.var0.var1 + 1) = v4;
  retstr->var0.var0 = 0;
  LOBYTE(retstr->var0.var1.__r_.var0) = 0;
  result = *(optional<std::string> **)(v1 + 64);
  if (!result) {
    return result;
  }
  if ((unk_1001607A8(result, "powerOn") & 1) == 0)
  {
    id v9 = (const std::string *)&unk_10015ED50;
    return (optional<std::string> *)sub_100066EEC((std::string *)retstr, v9);
  }
  char v6 = [*(id *)(v2 + 64) networkName];

  if (!v6)
  {
    id v9 = (const std::string *)&unk_10015ED68;
    return (optional<std::string> *)sub_100066EEC((std::string *)retstr, v9);
  }
  char v7 = [*(id *)(v2 + 64) maxPHYModeDescription];
  long long v8 = v7;
  if (v7)
  {
    long long v10 = (std::string::value_type *)[v7 UTF8String];
    sub_100066F58((std::string *)retstr, &v10);
  }

  return result;
}

- (char)retrieveWiFILQM:(id)a3
{
  long long v4 = (__CFString *)a3;
  if (self->_scDynamicStore)
  {
    uint64_t v5 = kSCEntNetLinkQuality;
    NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v4, kSCEntNetLinkQuality);
    if (NetworkInterfaceEntity)
    {
      char v7 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, NetworkInterfaceEntity);
      long long v8 = v7;
      if (v7)
      {
        id v9 = [v7 objectForKey:v5];
        char v10 = [v9 intValue];
      }
      else
      {
        char v10 = -1;
      }
    }
    else
    {
      long long v11 = qword_10015EF78;
      if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
        sub_1000FA99C(v11);
      }
      char v10 = -1;
    }
  }
  else
  {
    char v10 = -1;
  }

  return v10;
}

- (BOOL)wiFiActiveAndUsingPersonalHotspot
{
  id v3 = [(CWFInterface *)self->_coreWiFiInterface NANData];
  long long v4 = v3;
  if (v3 && ([v3 currentKnownNetworkProfile], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(CWFInterface *)self->_coreWiFiInterface currentKnownNetworkProfile],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned __int8 v6 = [v5 isPersonalHotspot];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (CWFInterface)coreWiFiInterface
{
  return self->_coreWiFiInterface;
}

- (void)setCoreWiFiInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreWiFiInterface, 0);
  fObj = self->_stateRelayQueue.fObj.fObj;
  self->_stateRelayQueue.fObj.fObj = 0;

  begin = self->_registeredCWEventTypes.__begin_;
  if (begin)
  {
    self->_registeredCWEventTypes.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_scKeyPatterns, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

@end