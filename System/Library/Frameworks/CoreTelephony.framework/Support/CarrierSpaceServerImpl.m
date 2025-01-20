@interface CarrierSpaceServerImpl
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CarrierSpaceServerImpl)initWithRegistry:(const void *)a3 queue:(queue)a4 entitlementValidator:(void *)a5;
- (id).cxx_construct;
- (id)_endpoint;
- (void)appsInfoChangeNotification;
- (void)bootstrapWithListener:(id)a3 controller:(weak_ptr<CarrierSpaceControllerInterface>)a4;
- (void)capabilitiesChangeNotification:(id)a3;
- (void)dataPlanMetricsChangeNotification;
- (void)planPurchaseStatusNotification:(unsigned __int8)a3 plan:(id)a4;
- (void)plansInfoChangeNotification;
- (void)proxyDidBecomeInvalidated:(id)a3;
- (void)stop;
- (void)usageInfoChangeNotification;
- (void)userConsentFlowInfoChangeNotification;
@end

@implementation CarrierSpaceServerImpl

- (CarrierSpaceServerImpl)initWithRegistry:(const void *)a3 queue:(queue)a4 entitlementValidator:(void *)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CarrierSpaceServerImpl;
  v7 = [(CarrierSpaceServerImpl *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v10 = *(Registry **)a3;
    uint64_t v9 = *((void *)a3 + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v7->fRegistry.__cntrl_;
    v8->fRegistry.__ptr_ = v10;
    v8->fRegistry.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
    v12 = *(dispatch_object_s **)a4.fObj.fObj;
    *(void *)a4.fObj.fObj = 0;
    fObj = v8->fQueue.fObj.fObj;
    v8->fQueue.fObj.fObj = v12;
    if (fObj) {
      dispatch_release(fObj);
    }
    operator new();
  }
  return 0;
}

- (void)bootstrapWithListener:(id)a3 controller:(weak_ptr<CarrierSpaceControllerInterface>)a4
{
  ptr = a4.__ptr_;
  id v7 = a3;
  v8 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I Starting Carrier Space XPC service", buf, 2u);
  }
  weak_ptr<CarrierSpaceControllerInterface> v9 = *(weak_ptr<CarrierSpaceControllerInterface> *)ptr;
  *(void *)ptr = 0;
  *((void *)ptr + 1) = 0;
  cntrl = self->fController.__cntrl_;
  self->fController = v9;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->fXpcListener, a3);
  [(NSXPCListener *)self->fXpcListener setDelegate:self];
  [(NSXPCListener *)self->fXpcListener _setQueue:self->fQueue.fObj.fObj];
  [(NSXPCListener *)self->fXpcListener resume];
  v11 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I Carrier Space XPC service is ready", v12, 2u);
  }
}

- (void)stop
{
  v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Stopping Carrier Space XPC service", v6, 2u);
  }
  fXpcListener = self->fXpcListener;
  if (fXpcListener)
  {
    [(NSXPCListener *)fXpcListener invalidate];
    v5 = self->fXpcListener;
    self->fXpcListener = 0;
  }
}

- (void)capabilitiesChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 description];
    *(_DWORD *)buf = 136315138;
    id v17 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Capabilities changed, notifying clients: %s", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = self->fClients;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "notifyCapabilitiesChanged:", v4, (void)v11);
      }
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)userConsentFlowInfoChangeNotification
{
  v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I User consent flow info changed, notifying clients", buf, 2u);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = self->fClients;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "notifyUserConsentFlowInfoChanged", (void)v8);
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)usageInfoChangeNotification
{
  v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Network usage info changed, notifying clients", buf, 2u);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = self->fClients;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "notifyUsageChanged", (void)v8);
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)plansInfoChangeNotification
{
  v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Plans info changed, notifying clients", buf, 2u);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = self->fClients;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "notifyPlansChanged", (void)v8);
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)appsInfoChangeNotification
{
  v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Apps info changed, notifying clients", buf, 2u);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = self->fClients;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "notifyAppsChanged", (void)v8);
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)dataPlanMetricsChangeNotification
{
  v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Data plan metrics changed, notifying clients", buf, 2u);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = self->fClients;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "notifyDataPlanMetricsChanged", (void)v8);
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)planPurchaseStatusNotification:(unsigned __int8)a3 plan:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 > 4) {
      long long v8 = "???";
    }
    else {
      long long v8 = off_1019C9480[(char)v4];
    }
    id v9 = [v6 description];
    *(_DWORD *)buf = 136315394;
    v20 = v8;
    __int16 v21 = 2080;
    id v22 = [v9 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I Plan purchase status changed to %s, plan: %s", buf, 0x16u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v10 = self->fClients;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "notifyPlanPurchaseStatusChanged:status:", v6, v4, (void)v14);
      }
      id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (id)_endpoint
{
  return [(NSXPCListener *)self->fXpcListener endpoint];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = (CTCarrierSpaceClientProxy *)a4;
  long long v8 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v26 = v7;
    __int16 v27 = 1024;
    unsigned int v28 = [(CTCarrierSpaceClientProxy *)v7 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I Received new connection (%p) from pid %d", buf, 0x12u);
  }
  if (self->fXpcListener != v6)
  {
LABEL_4:
    BOOL v9 = 0;
    goto LABEL_27;
  }
  if (((*(uint64_t (**)(EntitlementValidator *, CTCarrierSpaceClientProxy *))(*(void *)self->fEntitlementValidator.__ptr_
                                                                                       + 16))(self->fEntitlementValidator.__ptr_, v7) & 1) == 0)
  {
    long long v17 = *(NSObject **)self->logger.__ptr_.__value_;
    BOOL v9 = 0;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 134217984;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#N Connection (%p) does not have carrier space entitlement.", buf, 0xCu);
    goto LABEL_4;
  }
  if (qword_101B0CDF0 != -1) {
    dispatch_once(&qword_101B0CDF0, &stru_1019C92F0);
  }
  [(CTCarrierSpaceClientProxy *)v7 setExportedInterface:qword_101B0CDE8];
  if (qword_101B0CE00 != -1) {
    dispatch_once(&qword_101B0CE00, &stru_1019C9310);
  }
  [(CTCarrierSpaceClientProxy *)v7 setRemoteObjectInterface:qword_101B0CDF8];
  [(CTCarrierSpaceClientProxy *)v7 _setQueue:self->fQueue.fObj.fObj];
  long long v10 = [CTCarrierSpaceClientProxy alloc];
  cntrl = self->fRegistry.__cntrl_;
  ptr = self->fRegistry.__ptr_;
  v24 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = self->fController.__cntrl_;
  __int16 v21 = self->fController.__ptr_;
  id v22 = (std::__shared_weak_count *)v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 2, 1uLL, memory_order_relaxed);
  }
  long long v13 = [(CTCarrierSpaceClientProxy *)v10 initWithConnection:v7 registry:&ptr controller:&v21 logger:self->logger.__ptr_.__value_];
  if (v22) {
    std::__shared_weak_count::__release_weak(v22);
  }
  if (v24) {
    sub_10004D2C8((std::__shared_weak_count *)v24);
  }
  long long v14 = self->fEntitlementValidator.__cntrl_;
  v19 = self->fEntitlementValidator.__ptr_;
  v20 = v14;
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v14 + 1, 1uLL, memory_order_relaxed);
  }
  [(CTCarrierSpaceClientProxy *)v13 setEntitlementValidator:&v19];
  if (v20) {
    sub_10004D2C8((std::__shared_weak_count *)v20);
  }
  -[CTCarrierSpaceClientProxy setDelegate:](v13, "setDelegate:", self, v19);
  [(CTCarrierSpaceClientProxy *)v7 setExportedObject:v13];
  [(NSMutableArray *)self->fClients addObject:v13];
  [(CTCarrierSpaceClientProxy *)v7 resume];
  long long v15 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = [(NSMutableArray *)self->fClients count];
    *(_DWORD *)buf = 134218240;
    v26 = v13;
    __int16 v27 = 1024;
    unsigned int v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I Added new client (%p) to list, new size %u", buf, 0x12u);
  }

  BOOL v9 = 1;
LABEL_27:

  return v9;
}

- (void)proxyDidBecomeInvalidated:(id)a3
{
  id v4 = a3;
  fClients = self->fClients;
  if (fClients)
  {
    [(NSMutableArray *)fClients removeObject:v4];
    id v6 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(NSMutableArray *)self->fClients count];
      int v8 = 134218240;
      id v9 = v4;
      __int16 v10 = 1024;
      unsigned int v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Client (%p) disconnected, new client list size %u", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void).cxx_destruct
{
  cntrl = self->fEntitlementValidator.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  sub_100119D1C((ctu::OsLogLogger **)&self->logger, 0);
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  id v5 = self->fRegistry.__cntrl_;
  if (v5) {
    sub_10004D2C8((std::__shared_weak_count *)v5);
  }
  id v6 = self->fController.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
  objc_storeStrong((id *)&self->fClients, 0);

  objc_storeStrong((id *)&self->fXpcListener, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end