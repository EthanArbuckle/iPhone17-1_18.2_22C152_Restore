@interface CTXPCServer
- (BOOL)_handleAppStateChanged_sync:(int)a3 state:(int)a4 isDaemon:(BOOL)a5;
- (BOOL)_sendNotification_sync:(id)a3 connection:(id)a4;
- (BOOL)clientHandler:(id)a3 hasEntitlement:(int)a4;
- (CTXPCContexts)activeSubs;
- (CTXPCFactoryInterface)factory;
- (CTXPCListener)listener;
- (CTXPCNotificationProxy)notificationProxy;
- (CTXPCServer)initWithRegistry:(shared_ptr<const Registry>)a3 factory:(id)a4 queue:(queue)a5;
- (CTXPCServerDelegate)delegate;
- (CTXPCServerEntitlementProvider)entitlementProvider;
- (CTXPCServiceSubscriptionInfo)allSubInfo;
- (CTXPCServiceSubscriptionInfo)subInfo;
- (id).cxx_construct;
- (id)activeSubscriptions;
- (id)allSubscriptions;
- (id)clientProxyForConnection:(id)a3;
- (id)contextForSlot:(int)a3;
- (id)contextForUUID:(id)a3;
- (id)resolveContext:(id)a3;
- (id)subscriptionInfo;
- (map<NSXPCConnection)clients;
- (os_state_data_s)_dumpState_sync:(os_state_hints_s *)a3;
- (shared_ptr<(anonymous)_getOrCreateProcInfo_sync:(anonymous)namespace;
- (shared_ptr<(anonymous)_getProcInfo_sync:(anonymous)namespace;
- (shared_ptr<const)registry;
- (void)_handleActiveSubscriptionsChanged_sync:(const void *)a3;
- (void)_handleAppRunningTransitioned_sync:(const void *)a3 isForeground:(BOOL)a4;
- (void)_handleAppSuspended_sync:(int)a3;
- (void)_handleGetClientsQuery_sync:(command_responder_t<xpc::dict> *)a3;
- (void)_handleSubscriptionInfoChanged_sync:(const void *)a3;
- (void)_processAppEntitlement_sync:(const void *)a3 appInfo:(const AppInfoResponse *)a4;
- (void)_processAppState_sync:(int)a3 state:(int)a4 isDaemon:(BOOL)a5 isBackgroundEntitled:(BOOL)a6;
- (void)_registerRestObservers_sync;
- (void)_registerRestProviders_sync;
- (void)_setupAppState_sync:(const void *)a3;
- (void)_updateAppNotificationState_sync:(int)a3 isBackgroundEntitled:(BOOL)a4;
- (void)anyClientRespondsToSelector:(SEL)a3 completion:(id)a4;
- (void)bootstrap:(group_session)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)connectionDidBecomeInterrupted:(id)a3;
- (void)connectionDidBecomeInvalidated:(id)a3;
- (void)connectionDidTriggerFault:(id)a3 logString:(id)a4;
- (void)processNotification:(id)a3;
- (void)receivedSelectors:(id)a3 forConnection:(id)a4;
- (void)resetAppCategory:(void *)a3;
- (void)setActiveSubs:(id)a3;
- (void)setAllSubInfo:(id)a3;
- (void)setApplicationCategory:(shared_ptr<CTXPCConnectionWrapper>)a3 category:(unint64_t)a4;
- (void)setAssertionForConnection:(shared_ptr<CTXPCConnectionWrapper>)a3 dataConnectionType:(int)a4 enable:(BOOL)a5;
- (void)setClients:(map<NSXPCConnection *);
- (void)setDelegate:(id)a3;
- (void)setEntitlementProvider:(id)a3;
- (void)setFactory:(id)a3;
- (void)setListener:(id)a3;
- (void)setNotificationProxy:(id)a3;
- (void)setRegistry:(shared_ptr<const Registry>)a3;
- (void)setSubInfo:(id)a3;
- (void)shutdown:(group_session)a3;
- (void)start;
@end

@implementation CTXPCServer

- (void)resetAppCategory:(void *)a3
{
  if (*(void *)a3)
  {
    ServiceMap = (std::mutex *)Registry::getServiceMap(self->_registry.__ptr_);
    v5 = ServiceMap;
    if ((v6 & 0x8000000000000000) != 0)
    {
      v7 = (unsigned __int8 *)(v6 & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v8 = 5381;
      do
      {
        unint64_t v6 = v8;
        unsigned int v9 = *v7++;
        uint64_t v8 = (33 * v8) ^ v9;
      }
      while (v9);
    }
    std::mutex::lock(ServiceMap);
    unint64_t v15 = v6;
    v10 = sub_10004D37C(&v5[1].__m_.__sig, &v15);
    if (v10)
    {
      uint64_t v12 = v10[3];
      v11 = (std::__shared_weak_count *)v10[4];
      if (v11)
      {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v5);
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v11);
        char v13 = 0;
        if (!v12)
        {
LABEL_13:
          if ((v13 & 1) == 0) {
            sub_10004D2C8(v11);
          }
          return;
        }
LABEL_11:
        uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 872))(v12);
        if (v14) {
          (*(void (**)(uint64_t, void, void))(*(void *)v14 + 120))(v14, **(unsigned int **)a3, 0);
        }
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    std::mutex::unlock(v5);
    v11 = 0;
    char v13 = 1;
    if (!v12) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
}

- (void)connectionDidBecomeInvalidated:(id)a3
{
  id v4 = a3;
  uint64_t v44 = 0;
  v45 = 0;
  [(CTXPCServer *)self _getOrCreateProcInfo_sync:v4];
  p_clients = &self->_clients;
  p_pair1 = &self->_clients.__tree_.__pair1_;
  left = (uint64_t *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    uint64_t v8 = &self->_clients.__tree_.__pair1_;
    unsigned int v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)self->_clients.__tree_.__pair1_.__value_.__left_;
    do
    {
      unint64_t v10 = (unint64_t)v9[4].__value_.__left_;
      BOOL v11 = v10 >= (unint64_t)v4;
      if (v10 >= (unint64_t)v4) {
        uint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)v9;
      }
      else {
        uint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)&v9[1];
      }
      if (v11) {
        uint64_t v8 = v9;
      }
      unsigned int v9 = *v12;
    }
    while (*v12);
    if (v8 != p_pair1 && v8[4].__value_.__left_ <= v4)
    {
      uint64_t v14 = (uint64_t *)v8[10].__value_.__left_;
      char v13 = (uint64_t *)v8[11].__value_.__left_;
      if (v14 != v13)
      {
        v41 = (uint64_t *)v8[11].__value_.__left_;
        while (1)
        {
          uint64_t v15 = *v14;
          v16 = (std::__shared_weak_count *)v14[1];
          if (v16) {
            atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (!v15 || *(_DWORD *)(v15 + 16) != 19) {
            goto LABEL_30;
          }
          ServiceMap = (std::mutex *)Registry::getServiceMap(self->_registry.__ptr_);
          v18 = ServiceMap;
          v19 = "22CellularPlanController";
          if (((unint64_t)"22CellularPlanController" & 0x8000000000000000) != 0)
          {
            v20 = (unsigned __int8 *)((unint64_t)"22CellularPlanController" & 0x7FFFFFFFFFFFFFFFLL);
            uint64_t v21 = 5381;
            do
            {
              v19 = (const char *)v21;
              unsigned int v22 = *v20++;
              uint64_t v21 = (33 * v21) ^ v22;
            }
            while (v22);
          }
          std::mutex::lock(ServiceMap);
          *(void *)buf = v19;
          v23 = sub_10004D37C(&v18[1].__m_.__sig, (unint64_t *)buf);
          if (!v23) {
            break;
          }
          uint64_t v25 = v23[3];
          v24 = (std::__shared_weak_count *)v23[4];
          if (!v24) {
            goto LABEL_26;
          }
          atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
          std::mutex::unlock(v18);
          atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
          char v13 = v41;
          sub_10004D2C8(v24);
          char v26 = 0;
          if (v25) {
            goto LABEL_27;
          }
LABEL_28:
          if ((v26 & 1) == 0) {
            sub_10004D2C8(v24);
          }
LABEL_30:
          if (v16) {
            sub_10004D2C8(v16);
          }
          v14 += 2;
          if (v14 == v13) {
            goto LABEL_33;
          }
        }
        uint64_t v25 = 0;
LABEL_26:
        std::mutex::unlock(v18);
        v24 = 0;
        char v26 = 1;
        if (!v25) {
          goto LABEL_28;
        }
LABEL_27:
        (*(void (**)(uint64_t))(*(void *)v25 + 968))(v25);
        goto LABEL_28;
      }
LABEL_33:
      -[CTXPCServer resetAppCategory:](self, "resetAppCategory:", &v8[5], &self->_clients.__tree_.__pair1_, &self->_clients);
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v39;
      p_clients = v40;
      left = *v39;
    }
    if (left)
    {
      v27 = (uint64_t *)p_pair1;
      v28 = left;
      do
      {
        unint64_t v29 = v28[4];
        BOOL v30 = v29 >= (unint64_t)v4;
        if (v29 >= (unint64_t)v4) {
          v31 = (uint64_t **)v28;
        }
        else {
          v31 = (uint64_t **)(v28 + 1);
        }
        if (v30) {
          v27 = v28;
        }
        v28 = *v31;
      }
      while (*v31);
      if (v27 != (uint64_t *)p_pair1 && v27[4] <= (unint64_t)v4)
      {
        v32 = (uint64_t *)v27[1];
        if (v32)
        {
          do
          {
            v33 = v32;
            v32 = (uint64_t *)*v32;
          }
          while (v32);
        }
        else
        {
          v34 = v27;
          do
          {
            v33 = (uint64_t *)v34[2];
            BOOL v35 = *v33 == (void)v34;
            v34 = v33;
          }
          while (!v35);
        }
        if (p_clients->__tree_.__begin_node_ == v27) {
          p_clients->__tree_.__begin_node_ = v33;
        }
        --p_clients->__tree_.__pair3_.__value_;
        sub_10005EE6C(left, v27);
        sub_10005ED58((uint64_t)(v27 + 4));
        operator delete(v27);
      }
    }
  }
  [(CTXPCServer *)self getLogContext];
  v36 = *(NSObject **)&buf[8];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B74C(__p, v44);
    v37 = v43 >= 0 ? __p : (void **)__p[0];
    unint64_t value = p_clients->__tree_.__pair3_.__value_;
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v4;
    __int16 v47 = 2048;
    unint64_t v48 = value;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Client [%s] disconnected (conn=%p), client list size %zu", buf, 0x20u);
    if (v43 < 0) {
      operator delete(__p[0]);
    }
  }
  if (v45) {
    sub_10004D2C8(v45);
  }
}

- (void)_processAppEntitlement_sync:(const void *)a3 appInfo:(const AppInfoResponse *)a4
{
  int v7 = (*(uint64_t (**)(void, uint64_t))(**(void **)(*(void *)a3 + 32) + 16))(*(void *)(*(void *)a3 + 32), 6);
  int v8 = (*(uint64_t (**)(void, uint64_t))(**(void **)(*(void *)a3 + 32) + 16))(*(void *)(*(void *)a3 + 32), 3);
  if (v7 != 1 && v8 != 1)
  {
LABEL_8:
    [(CTXPCServer *)self _processAppState_sync:**(unsigned int **)a3 state:a4->var0 isDaemon:a4->var2 isBackgroundEntitled:a4->var1];
    return;
  }
  if (a4->var3)
  {
    [(CTXPCServer *)self getLogContext];
    unint64_t v10 = v18;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&__p);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      sub_10004B74C(&__p, *(void *)a3);
      if (v19 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = (void **)__p;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = p_p;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Ignoring no restrictions for XPC service: %{public}s", buf, 0xCu);
      if (v19 < 0) {
        operator delete(__p);
      }
    }
    goto LABEL_8;
  }
  [(CTXPCServer *)self getLogContext];
  BOOL v11 = v18;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&__p);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    sub_10004B74C(&__p, *(void *)a3);
    int v13 = v19;
    uint64_t v14 = (void **)__p;
    uint64_t v15 = asString();
    v16 = &__p;
    if (v13 < 0) {
      v16 = v14;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v21 = v16;
    __int16 v22 = 2080;
    uint64_t v23 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "App state[%{public}s] set to %s due to internal entitlements", buf, 0x16u);
    if (v19 < 0) {
      operator delete(__p);
    }
  }
  *(_DWORD *)(*(void *)a3 + 48) = 1;
}

- (id)subscriptionInfo
{
  return self->_subInfo;
}

- (id)activeSubscriptions
{
  return self->_activeSubs;
}

- (void)processNotification:(id)a3
{
  id v4 = a3;
  [v4 retainArguments];
  v5 = self;
  id v6 = v4;
  v7[0] = off_101A321C0;
  v7[1] = v5;
  v7[2] = v6;
  v7[3] = v7;
  [(CTXPCServer *)v5 executeFunction:v7];
  sub_10003B34C(v7);
}

- (id)contextForSlot:(int)a3
{
  id v5 = [(CTXPCServiceSubscriptionInfo *)self->_subInfo subscriptions];

  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(CTXPCServiceSubscriptionInfo *)self->_subInfo subscriptions];
    id v5 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v13;
      if (a3 == 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = 2 * (a3 == 2);
      }
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v6);
          }
          unint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 slotID] == (id)v8)
          {
            id v5 = v10;
            goto LABEL_14;
          }
        }
        id v5 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }

  return v5;
}

- (id)clientProxyForConnection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  p_clients = &self->_clients;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)self->_clients.__tree_.__pair1_.__value_.__left_;
  p_pair1 = (uint64_t **)&self->_clients.__tree_.__pair1_;
  unsigned int v9 = &self->_clients.__tree_.__pair1_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        unsigned int v9 = left;
        unint64_t v10 = (unint64_t)left[4].__value_.__left_;
        if (v10 <= (unint64_t)v4) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v9->__value_.__left_;
        p_pair1 = (uint64_t **)v9;
        if (!v9->__value_.__left_) {
          goto LABEL_8;
        }
      }
      if (v10 >= (unint64_t)v4) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v9[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = (uint64_t **)&v9[1];
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    *(void *)&buf[16] = 1;
    BOOL v11 = (char *)operator new(0x78uLL);
    *(void *)&buf[8] = &self->_clients.__tree_.__pair1_;
    *((void *)v11 + 4) = v5;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    sub_100046C38((uint64_t **)&self->_clients, (uint64_t)v9, p_pair1, (uint64_t *)v11);
    *(void *)buf = 0;
    sub_10003C22C((uint64_t)buf);
    unsigned int v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v11;
  }
  [(CTXPCServer *)self _getOrCreateProcInfo_sync:v5];
  long long v12 = *(_OWORD *)buf;
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  long long v13 = (std::__shared_weak_count *)v9[6].__value_.__left_;
  *(_OWORD *)&v9[5].__value_.__left_ = v12;
  if (v13)
  {
    sub_10004D2C8(v13);
    if (*(void *)&buf[8]) {
      sub_10004D2C8(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  [v5 setDelegate:self];
  long long v14 = [CTXPCClientProxy alloc];
  [(CTXPCServer *)self getQueue];
  long long v15 = [(CTXPCClientProxy *)v14 initWithRegistry:&self->_registry queue:&object connection:v5];
  if (object) {
    dispatch_release(object);
  }
  [(CTXPCClientHandler *)v15 setDelegate:self];
  [(CTXPCClientHandler *)v15 setDataProviderDelegate:self];
  [(CTXPCServer *)self getLogContext];
  v16 = *(NSObject **)&buf[8];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B74C(__p, (uint64_t)v9[5].__value_.__left_);
    v17 = v21 >= 0 ? __p : (void **)__p[0];
    unint64_t value = p_clients->__tree_.__pair3_.__value_;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v5;
    *(_WORD *)&unsigned char buf[22] = 2048;
    unint64_t v24 = value;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Added new client [%s] (conn=%p), client list size %zu", buf, 0x20u);
    if (v21 < 0) {
      operator delete(__p[0]);
    }
  }

  return v15;
}

- (shared_ptr<(anonymous)_getOrCreateProcInfo_sync:(anonymous)namespace
{
  id v5 = v3;
  id v6 = a3;
  void *v5 = 0;
  v5[1] = 0;
  -[CTXPCServer _getProcInfo_sync:](self, "_getProcInfo_sync:", [v6 processIdentifier]);
  if (*v5) {
    goto LABEL_37;
  }
  unsigned int v7 = [v6 processIdentifier];
  uint64_t v8 = (char *)operator new(0x50uLL);
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)uint64_t v8 = off_101A320F0;
  *((_DWORD *)v8 + 6) = v7;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *(_OWORD *)(v8 + 60) = 0u;
  unsigned int v9 = (std::__shared_weak_count *)v5[1];
  void *v5 = v8 + 24;
  v5[1] = v8;
  if (v9) {
    sub_10004D2C8(v9);
  }
  unint64_t v10 = [(CTXPCServer *)self factory];
  [(CTXPCServer *)self registry];
  id v11 = [v6 _xpcConnection];
  *(void *)dispatch_object_t object = v11;
  if (!v11)
  {
    *(void *)dispatch_object_t object = xpc_null_create();
    if (v10) {
      goto LABEL_6;
    }
LABEL_8:
    long long v12 = 0uLL;
    goto LABEL_9;
  }
  xpc_retain(v11);
  if (!v10) {
    goto LABEL_8;
  }
LABEL_6:
  [v10 createEntitlementChecker:v33 forConnection:object];
  long long v12 = *(_OWORD *)__p;
LABEL_9:
  uint64_t v13 = *v5;
  __p[0] = 0;
  __p[1] = 0;
  long long v14 = *(std::__shared_weak_count **)(v13 + 40);
  *(_OWORD *)(v13 + 32) = v12;
  if (v14)
  {
    sub_10004D2C8(v14);
    if (__p[1]) {
      sub_10004D2C8((std::__shared_weak_count *)__p[1]);
    }
  }
  xpc_release(*(xpc_object_t *)object);
  if (v34) {
    sub_10004D2C8(v34);
  }

  [(CTXPCServer *)self getLogContext];
  long long v15 = __p[1];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)__p);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(void **__return_ptr))(**(void **)(*v5 + 32) + 40))(__p);
    v16 = v32 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)dispatch_object_t object = 136315138;
    *(void *)&object[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, " -- connection has entitlements: %s", object, 0xCu);
    if (SHIBYTE(v32) < 0) {
      operator delete(__p[0]);
    }
  }
  [(CTXPCServer *)self registry];
  ServiceMap = (std::mutex *)Registry::getServiceMap((Registry *)__p[0]);
  v18 = ServiceMap;
  if (v19 < 0)
  {
    v20 = (unsigned __int8 *)(v19 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v21 = 5381;
    do
    {
      uint64_t v19 = v21;
      unsigned int v22 = *v20++;
      uint64_t v21 = (33 * v21) ^ v22;
    }
    while (v22);
  }
  std::mutex::lock(ServiceMap);
  *(void *)dispatch_object_t object = v19;
  uint64_t v23 = sub_10004D37C(&v18[1].__m_.__sig, (unint64_t *)object);
  if (!v23)
  {
    uint64_t v25 = 0;
    goto LABEL_27;
  }
  uint64_t v25 = v23[3];
  unint64_t v24 = (std::__shared_weak_count *)v23[4];
  if (!v24)
  {
LABEL_27:
    std::mutex::unlock(v18);
    unint64_t v24 = 0;
    char v26 = 1;
    goto LABEL_28;
  }
  atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v18);
  atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v24);
  char v26 = 0;
LABEL_28:
  if (__p[1]) {
    sub_10004D2C8((std::__shared_weak_count *)__p[1]);
  }
  if (v25)
  {
    (*(void (**)(void **__return_ptr, uint64_t, id))(*(void *)v25 + 24))(__p, v25, [v6 processIdentifier]);
    uint64_t v27 = *v5 + 8;
    if (*(char *)(*v5 + 31) < 0) {
      operator delete(*(void **)v27);
    }
    long long v28 = *(_OWORD *)__p;
    *(void *)(v27 + 16) = v32;
    *(_OWORD *)uint64_t v27 = v28;
  }
  if ((v26 & 1) == 0) {
    sub_10004D2C8(v24);
  }
  [(CTXPCServer *)self _setupAppState_sync:v5];
LABEL_37:

  result.var1 = v30;
  result.var0 = v29;
  return result;
}

- (shared_ptr<const)registry
{
  cntrl = self->_registry.__cntrl_;
  *v2 = self->_registry.__ptr_;
  v2[1] = (Registry *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Registry *)self;
  return result;
}

- (void)_setupAppState_sync:(const void *)a3
{
  uint64_t v15 = 0;
  *(_OWORD *)__p = 0u;
  long long v14 = 0u;
  LODWORD(__p[0]) = **(_DWORD **)a3;
  BYTE4(__p[0]) = 1;
  id location = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  id v5 = (std::__shared_weak_count *)*((void *)a3 + 1);
  unsigned int v9 = *(_DWORD **)a3;
  unint64_t v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(CTXPCServer *)self getLogContext];
  xpc_object_t v23 = 0;
  rest::write_rest_value();
  sub_100058DB0(&v21, "/cc/requests/get_app_state");
  xpc_object_t object = v23;
  xpc_object_t v23 = xpc_null_create();
  objc_moveWeak(&to, &v8);
  v17 = v9;
  v18 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::OsLogContext();
  uint64_t v25 = 0;
  id v6 = (id *)operator new(0x30uLL);
  *id v6 = off_101A32140;
  objc_moveWeak(v6 + 1, &to);
  unsigned int v7 = v18;
  v6[2] = v17;
  v6[3] = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::OsLogContext();
  uint64_t v25 = v6;
  ctu::RestModule::sendRequest();
  sub_10003F600(v24);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v19);
  if (v18) {
    sub_10004D2C8(v18);
  }
  objc_destroyWeak(&to);
  xpc_release(object);
  xpc_object_t object = 0;
  if (v22 < 0) {
    operator delete(v21);
  }
  xpc_release(v23);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v11);
  if (v10) {
    sub_10004D2C8(v10);
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  if ((_BYTE)v15)
  {
    if (SHIBYTE(v14) < 0) {
      operator delete(__p[1]);
    }
  }
}

- (BOOL)clientHandler:(id)a3 hasEntitlement:(int)a4
{
  id v5 = a3;
  id v6 = [v5 connection];
  unsigned int v7 = v6;
  if (v6)
  {
    id v8 = [v6 processIdentifier];
    [(CTXPCServer *)self _getProcInfo_sync:v8];
    [(CTXPCServer *)self getLogContext];
    unsigned int v9 = v13;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = (int)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received request with no process info from pid %d!", buf, 8u);
    }
  }

  return 0;
}

- (void)receivedSelectors:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  v42 = self;
  p_pair1 = &self->_clients.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    uint64_t v11 = &self->_clients.__tree_.__pair1_;
    do
    {
      unint64_t v12 = (unint64_t)left[4].__value_.__left_;
      BOOL v13 = v12 >= (unint64_t)v7;
      if (v12 >= (unint64_t)v7) {
        long long v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)left;
      }
      else {
        long long v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)&left[1];
      }
      if (v13) {
        uint64_t v11 = left;
      }
      left = *v14;
    }
    while (*v14);
    if (v11 != p_pair1 && v11[4].__value_.__left_ <= v7)
    {
      if (v6)
      {
        id v40 = v6;
        id v41 = v7;
        unint64_t v15 = (unint64_t)[v6 count];
        if (v15)
        {
          if (v15 >> 61) {
            sub_10006A748();
          }
          v16 = (SEL *)sub_100048350(v15);
          v18 = &v16[v17];
        }
        else
        {
          v16 = 0;
          v18 = 0;
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id obj = v6;
        id v21 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v45;
          xpc_object_t v23 = v16;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v25 = *(NSString **)(*((void *)&v44 + 1) + 8 * i);
              SEL v26 = NSSelectorFromString(v25);
              SEL v27 = v26;
              if (v26)
              {
                if (v23 >= v18)
                {
                  uint64_t v30 = v23 - v16;
                  unint64_t v31 = v30 + 1;
                  if ((unint64_t)(v30 + 1) >> 61) {
                    sub_10006A748();
                  }
                  if (((char *)v18 - (char *)v16) >> 2 > v31) {
                    unint64_t v31 = ((char *)v18 - (char *)v16) >> 2;
                  }
                  if ((unint64_t)((char *)v18 - (char *)v16) >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v32 = v31;
                  }
                  if (v32) {
                    unint64_t v32 = (unint64_t)sub_100048350(v32);
                  }
                  else {
                    uint64_t v33 = 0;
                  }
                  v34 = (SEL *)(v32 + 8 * v30);
                  SEL *v34 = v27;
                  BOOL v35 = v34 + 1;
                  while (v23 != v16)
                  {
                    v36 = *--v23;
                    *--v34 = v36;
                  }
                  v18 = (SEL *)(v32 + 8 * v33);
                  if (v16) {
                    operator delete(v16);
                  }
                  v16 = v34;
                  xpc_object_t v23 = v35;
                }
                else
                {
                  *v23++ = v26;
                }
              }
              else
              {
                [(CTXPCServer *)v42 getLogContext];
                long long v28 = *(NSObject **)&__p[8];
                ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)__p);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  sub_10004B74C(buf, (uint64_t)v11[5].__value_.__left_);
                  unint64_t v29 = buf;
                  if (v51 < 0) {
                    unint64_t v29 = *(unsigned char **)buf;
                  }
                  *(_DWORD *)__p = 138412802;
                  *(void *)&__p[4] = v25;
                  *(_WORD *)&__p[12] = 2080;
                  *(void *)&__p[14] = v29;
                  __int16 v53 = 2048;
                  uint64_t v54 = (uint64_t)v41;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received selector \"%@\" from [%s] (conn=%p), but it was not found", __p, 0x20u);
                  if (v51 < 0) {
                    operator delete(*(void **)buf);
                  }
                }
              }
            }
            id v21 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
          }
          while (v21);
        }
        else
        {
          xpc_object_t v23 = v16;
        }

        id v6 = v40;
        [(CTXPCServer *)v42 getLogContext];
        v37 = *(NSObject **)&__p[8];
        ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)__p);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004B74C(buf, (uint64_t)v11[5].__value_.__left_);
          v38 = v51 >= 0 ? buf : *(unsigned char **)buf;
          *(_DWORD *)__p = 136315650;
          *(void *)&__p[4] = v38;
          *(_WORD *)&__p[12] = 2048;
          *(void *)&__p[14] = v41;
          __int16 v53 = 2048;
          uint64_t v54 = v23 - v16;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Client [%s] (conn=%p) registered for %zu notification(s)", __p, 0x20u);
          if (v51 < 0) {
            operator delete(*(void **)buf);
          }
        }
        v39 = v11[7].__value_.__left_;
        if (v39)
        {
          v11[8].__value_.__left_ = v39;
          operator delete(v39);
          v11[7].__value_.__left_ = 0;
          v11[8].__value_.__left_ = 0;
          v11[9].__value_.__left_ = 0;
        }
        v11[7].__value_.__left_ = v16;
        v11[8].__value_.__left_ = v23;
        v11[9].__value_.__left_ = v18;
        id v8 = v41;
      }
      else
      {
        v11[8].__value_.__left_ = v11[7].__value_.__left_;
        [(CTXPCServer *)v42 getLogContext];
        uint64_t v19 = *(NSObject **)&__p[8];
        ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)__p);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004B74C(__p, (uint64_t)v11[5].__value_.__left_);
          v20 = v53 >= 0 ? __p : *(unsigned char **)__p;
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = v20;
          __int16 v49 = 2048;
          v50 = v8;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Client [%s] (conn=%p) deregistered for all notifications", buf, 0x16u);
          if (SHIBYTE(v53) < 0) {
            operator delete(*(void **)__p);
          }
        }
      }
    }
  }
}

- (BOOL)_sendNotification_sync:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_28;
  }
  p_pair1 = &self->_clients.__tree_.__pair1_;
  do
  {
    unint64_t v11 = (unint64_t)left[4].__value_.__left_;
    BOOL v12 = v11 >= (unint64_t)v7;
    if (v11 >= (unint64_t)v7) {
      BOOL v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)left;
    }
    else {
      BOOL v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)&left[1];
    }
    if (v12) {
      p_pair1 = left;
    }
    left = *v13;
  }
  while (*v13);
  if (p_pair1 == &self->_clients.__tree_.__pair1_ || p_pair1[4].__value_.__left_ > v7) {
    goto LABEL_28;
  }
  long long v14 = (id *)p_pair1[7].__value_.__left_;
  unint64_t v15 = (id *)p_pair1[8].__value_.__left_;
  id v16 = [v6 selector];
  if (v14 != v15)
  {
    while (*v14 != v16)
    {
      if (++v14 == v15)
      {
        long long v14 = v15;
        break;
      }
    }
  }
  if (v14 == p_pair1[8].__value_.__left_) {
    goto LABEL_28;
  }
  if (*((_DWORD *)p_pair1[5].__value_.__left_ + 12) == 4)
  {
    if (!LOBYTE(p_pair1[13].__value_.__left_))
    {
      [(CTXPCServer *)self getLogContext];
      id v21 = v33;
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&__p);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        sub_10004B74C(&__p, (uint64_t)p_pair1[5].__value_.__left_);
        SEL v26 = v34 >= 0 ? &__p : (void **)__p;
        *(_DWORD *)buf = 136446466;
        v36 = v26;
        __int16 v37 = 2050;
        v38 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Scheduling send barrier for client in background [%{public}s] (conn=%{public}p)", buf, 0x16u);
        if (v34 < 0) {
          operator delete(__p);
        }
      }
      LOBYTE(p_pair1[13].__value_.__left_) = 1;
      uint64_t v22 = [(CTXPCServer *)self factory];
      xpc_object_t v23 = [v22 createSensitiveObjectClassifier];

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100A5FDD4;
      v27[3] = &unk_101A31BC8;
      v27[4] = self;
      unint64_t v31 = p_pair1;
      id v28 = v8;
      id v29 = v6;
      id v30 = v23;
      id v24 = v23;
      [v28 scheduleSendBarrierBlock:v27];

      goto LABEL_28;
    }
    [(CTXPCServer *)self getLogContext];
    uint64_t v17 = v33;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&__p);
    BOOL v18 = 0;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B74C(&__p, (uint64_t)p_pair1[5].__value_.__left_);
      if (v34 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = (void **)__p;
      }
      *(_DWORD *)buf = 136446466;
      v36 = p_p;
      __int16 v37 = 2050;
      v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Dropping notification to client [%{public}s] (conn=%{public}p) due to backpressure barrier", buf, 0x16u);
      if (v34 < 0) {
        operator delete(__p);
      }
LABEL_28:
      BOOL v18 = 0;
    }
  }
  else
  {
    ++p_pair1[14].__value_.__left_;
    v20 = [v8 remoteObjectProxy];
    [v6 invokeWithTarget:v20];

    BOOL v18 = 1;
  }

  return v18;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = v9;
  if (v5)
  {
    [v9 invoke];
    goto LABEL_17;
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(self->_registry.__ptr_);
  BOOL v12 = ServiceMap;
  if (v13 < 0)
  {
    long long v14 = (unsigned __int8 *)(v13 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v15 = 5381;
    do
    {
      uint64_t v13 = v15;
      unsigned int v16 = *v14++;
      uint64_t v15 = (33 * v15) ^ v16;
    }
    while (v16);
  }
  std::mutex::lock(ServiceMap);
  *(void *)buf = v13;
  uint64_t v17 = sub_10004D37C(&v12[1].__m_.__sig, (unint64_t *)buf);
  if (v17)
  {
    uint64_t v18 = v17[3];
    uint64_t v19 = (std::__shared_weak_count *)v17[4];
    if (v19)
    {
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v12);
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v19);
      char v20 = 0;
      if (!v18) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  std::mutex::unlock(v12);
  uint64_t v19 = 0;
  char v20 = 1;
  if (v18) {
LABEL_12:
  }
    (*(void (**)(uint64_t))(*(void *)v18 + 32))(v18);
LABEL_13:
  if ((v20 & 1) == 0) {
    sub_10004D2C8(v19);
  }
  id v21 = [v8 processIdentifier];
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  [(CTXPCServer *)self _getProcInfo_sync:v21];
  [(CTXPCServer *)self getLogContext];
  uint64_t v22 = v26;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received request with no process info from pid %d!", buf, 8u);
  }
LABEL_17:
}

- (CTXPCFactoryInterface)factory
{
  return self->_factory;
}

- (shared_ptr<(anonymous)_getProcInfo_sync:(anonymous)namespace
{
  p_pair1 = &self->_clients.__tree_.__pair1_;
  begin_node = (CTXPCServer *)self->_clients.__tree_.__begin_node_;
  if (begin_node != (CTXPCServer *)&self->_clients.__tree_.__pair1_)
  {
    while (1)
    {
      begin = begin_node->_activeSubsSink.fValue.fSubscriptions.__begin_;
      if (begin)
      {
        if (*(_DWORD *)begin == a3) {
          break;
        }
      }
      unint64_t value = begin_node->_restModule.__ptr_.__value_;
      if (value)
      {
        do
        {
          id v8 = (CTXPCServer *)value;
          unint64_t value = (RestModule *)value->fState.__ptr_;
        }
        while (value);
      }
      else
      {
        do
        {
          id v8 = (CTXPCServer *)begin_node->_subInfoSink.fValue.fSubscriptions.__tree_.__begin_node_;
          BOOL v9 = *(void *)v8->OCSharedLoggable_opaque == (void)begin_node;
          begin_node = v8;
        }
        while (!v9);
      }
      begin_node = v8;
      if (v8 == (CTXPCServer *)p_pair1) {
        goto LABEL_15;
      }
    }
  }
  if (begin_node == (CTXPCServer *)p_pair1)
  {
LABEL_15:
    void *v3 = 0;
    v3[1] = 0;
  }
  else
  {
    end = begin_node->_activeSubsSink.fValue.fSubscriptions.__end_;
    void *v3 = begin_node->_activeSubsSink.fValue.fSubscriptions.__begin_;
    v3[1] = end;
    if (end) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)end + 1, 1uLL, memory_order_relaxed);
    }
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ProcInfo *)self;
  return result;
}

- (BOOL)_handleAppStateChanged_sync:(int)a3 state:(int)a4 isDaemon:(BOOL)a5
{
  return 0;
}

- (CTXPCServer)initWithRegistry:(shared_ptr<const Registry>)a3 factory:(id)a4 queue:(queue)a5
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  BOOL v9 = a3.__cntrl_;
  dispatch_object_t object = *(dispatch_object_t *)a4;
  *(void *)a4 = 0;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v19, kCtLoggingSystemName, "ct.server");
  v18.receiver = self;
  v18.super_class = (Class)CTXPCServer;
  id v10 = [(CTXPCServer *)&v18 initWithQueue:&object logContext:v19];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v19);
  if (object) {
    dispatch_release(object);
  }
  if (v10)
  {
    long long v11 = *(_OWORD *)ptr;
    *(void *)ptr = 0;
    *((void *)ptr + 1) = 0;
    BOOL v12 = (std::__shared_weak_count *)*((void *)v10 + 19);
    *((_OWORD *)v10 + 9) = v11;
    if (v12) {
      sub_10004D2C8(v12);
    }
    objc_storeStrong((id *)v10 + 12, cntrl);
    uint64_t v13 = [v10 factory];
    [v10 getQueue];
    [v10 getLogContext];
    uint64_t v14 = [v13 createListener:v21 name:"CTXPCServer" logContext:v17];
    uint64_t v15 = (void *)*((void *)v10 + 13);
    *((void *)v10 + 13) = v14;

    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v17);
    if (v21[0]) {
      dispatch_release(v21[0]);
    }

    [v10 getQueue];
    operator new();
  }

  return 0;
}

- (void)bootstrap:(group_session)a3
{
  id v4 = self;
  BOOL v5 = *(NSObject **)a3.var0.fObj;
  if (v5)
  {
    dispatch_retain(v5);
    dispatch_group_enter(v5);
  }
  v7[0] = off_101A31C48;
  id v6 = v4;
  v7[1] = v6;
  v7[2] = v5;
  v7[3] = v7;
  [(CTXPCServer *)v6 executeFunction:v7];
  sub_10003B34C(v7);
}

- (void)start
{
  v2 = off_101A31DF0;
  v3 = self;
  id v4 = &v2;
  [(CTXPCServer *)v3 executeFunction:&v2];
  sub_10003B34C(&v2);
}

- (void)shutdown:(group_session)a3
{
  id v4 = self;
  BOOL v5 = *(NSObject **)a3.var0.fObj;
  if (v5)
  {
    dispatch_retain(v5);
    dispatch_group_enter(v5);
  }
  v7[0] = off_101A31E70;
  id v6 = v4;
  v7[1] = v6;
  v7[2] = v5;
  v7[3] = v7;
  [(CTXPCServer *)v6 executeFunction:v7];
  sub_10003B34C(v7);
}

- (void)setAssertionForConnection:(shared_ptr<CTXPCConnectionWrapper>)a3 dataConnectionType:(int)a4 enable:(BOOL)a5
{
  if (*(void *)a3.var0)
  {
    char v5 = a4;
    int var1 = (int)a3.var1;
    var0 = a3.var0;
    id v8 = self;
    uint64_t v10 = *(void *)var0;
    uint64_t v9 = *((void *)var0 + 1);
    uint64_t v14 = v8;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    char v15 = v5;
    long long v11 = operator new(0x28uLL);
    void *v11 = off_101A31EF0;
    BOOL v12 = v8;
    v11[1] = v12;
    v11[2] = v10;
    v11[3] = v9;
    *((_DWORD *)v11 + 8) = var1;
    *((unsigned char *)v11 + 36) = v15;
    v18[3] = v11;
    -[CTXPCServer executeFunction:](v12, "executeFunction:", v18, v14, 0, 0);
    sub_10003B34C(v18);
  }
  else
  {
    [(CTXPCServer *)self getLogContext];
    uint64_t v13 = v17;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "invalid connection", buf, 2u);
    }
  }
}

- (void)setApplicationCategory:(shared_ptr<CTXPCConnectionWrapper>)a3 category:(unint64_t)a4
{
  if (*(void *)a3.var0)
  {
    int var1 = a3.var1;
    var0 = a3.var0;
    id v6 = self;
    uint64_t v8 = *(void *)var0;
    uint64_t v7 = *((void *)var0 + 1);
    BOOL v12 = v6;
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = operator new(0x28uLL);
    *uint64_t v9 = off_101A31F70;
    uint64_t v10 = v6;
    v9[1] = v10;
    v9[2] = v8;
    v9[3] = v7;
    v9[4] = var1;
    v15[3] = v9;
    -[CTXPCServer executeFunction:](v10, "executeFunction:", v15, v12, 0, 0, var1);
    sub_10003B34C(v15);
  }
  else
  {
    [(CTXPCServer *)self getLogContext];
    long long v11 = v14;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "invalid connection", buf, 2u);
    }
  }
}

- (void)_registerRestObservers_sync
{
  id location = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&to, &location);
  sub_100058DB0(&__p, "/cc/events/app_state_changed");
  objc_moveWeak(&from, &to);
  uint64_t v9 = 0;
  uint64_t v7 = off_101A31FF0;
  objc_moveWeak(&v8, &from);
  uint64_t v9 = &v7;
  objc_destroyWeak(&from);
  ctu::RestModule::observeEvent();
  sub_10003F600(&v7);
  if (v6 < 0) {
    operator delete(__p);
  }
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
}

- (void)_registerRestProviders_sync
{
  ServiceMap = (std::mutex *)Registry::getServiceMap((uint64_t *)0x90, self->_registry.__ptr_);
  id v4 = ServiceMap;
  if ((v5 & 0x8000000000000000) != 0)
  {
    char v6 = (unsigned __int8 *)(v5 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v7 = 5381;
    do
    {
      unint64_t v5 = v7;
      unsigned int v8 = *v6++;
      uint64_t v7 = (33 * v7) ^ v8;
    }
    while (v8);
  }
  std::mutex::lock(ServiceMap);
  v17[0] = v5;
  uint64_t v9 = sub_10004D37C(&v4[1].__m_.__sig, v17);
  if (v9)
  {
    uint64_t v11 = v9[3];
    uint64_t v10 = (std::__shared_weak_count *)v9[4];
    if (v10)
    {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v4);
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v10);
      char v12 = 0;
      if (!v11) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  std::mutex::unlock(v4);
  uint64_t v10 = 0;
  char v12 = 1;
  if (!v11) {
    goto LABEL_14;
  }
LABEL_10:
  if ((*(uint64_t (**)(uint64_t))(*(void *)v11 + 32))(v11))
  {
    uint64_t v13 = self;
    sub_100058DB0(&__p, "/cc/requests/get_xpc_clients");
    uint64_t v14 = v13;
    v17[0] = (unint64_t)off_101A32070;
    v17[1] = (unint64_t)v14;
    v17[3] = (unint64_t)v17;
    ctu::RestModule::registerAsRequestSink();
    sub_1001F23E0(v17);
    if (v16 < 0) {
      operator delete(__p);
    }
  }
LABEL_14:
  if ((v12 & 1) == 0) {
    sub_10004D2C8(v10);
  }
}

- (void)_handleGetClientsQuery_sync:(command_responder_t<xpc::dict> *)a3
{
  sub_100A5E748(&object, &self->_clients.__tree_.__begin_node_);
  id v4 = (dispatch_object_s *)object;
  if (object && xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v4);
    unint64_t v5 = v4;
  }
  else
  {
    unint64_t v5 = (dispatch_object_s *)xpc_null_create();
  }
  xpc_object_t v6 = xpc_null_create();
  fObj = a3->var0.fObj.fObj;
  a3->var0.fObj.fObj = v5;
  xpc_release(fObj);
  xpc_release(v6);
  xpc_release(v4);
}

- (void)_handleSubscriptionInfoChanged_sync:(const void *)a3
{
  p_subInfoSink = &self->_subInfoSink;
  if (rest::operator==())
  {
    [(CTXPCServer *)self getLogContext];
    unint64_t v5 = *(NSObject **)&v21[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v20);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Subscription info remains unchanged", (uint8_t *)&v20, 2u);
    }
  }
  else
  {
    xpc_object_t v6 = self->_subInfo;
    uint64_t v7 = (CTXPCServiceSubscriptionInfo *)objc_opt_new();
    subInfo = self->_subInfo;
    self->_subInfo = v7;

    if (p_subInfoSink->fValue.fSubscriptions.__tree_.__pair3_.__value_)
    {
      uint64_t v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::SubscriptionContext>, void *>>> *)p_subInfoSink->fValue.fSubscriptions.__tree_.__begin_node_;
      p_pair1 = &p_subInfoSink->fValue.fSubscriptions.__tree_.__pair1_;
      uint64_t v11 = begin_node;
      if (begin_node != p_pair1)
      {
        do
        {
          uint64_t v13 = sub_1005AF1B4((uint64_t)&v11[5]);
          [v9 addObject:v13];

          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::SubscriptionContext>, void *>>> *)v11[1].__value_.__left_;
          if (left)
          {
            do
            {
              char v15 = left;
              left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::SubscriptionContext>, void *>>> *)left->__value_.__left_;
            }
            while (left);
          }
          else
          {
            do
            {
              char v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<subscriber::SimSlot, rest::SubscriptionContext>, void *>>> *)v11[2].__value_.__left_;
              BOOL v16 = v15->__value_.__left_ == v11;
              uint64_t v11 = v15;
            }
            while (!v16);
          }
          uint64_t v11 = v15;
        }
        while (v15 != p_pair1);
      }
      [(CTXPCServiceSubscriptionInfo *)self->_subInfo setSubscriptions:v9];
    }
    [(CTXPCServer *)self getLogContext];
    uint64_t v17 = *(NSObject **)&v21[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v20);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      *(void *)id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Subscription info is changing from %@", (uint8_t *)&v20, 0xCu);
    }
    [(CTXPCServer *)self getLogContext];
    objc_super v18 = *(NSObject **)&v21[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = self->_subInfo;
      int v20 = 138412290;
      *(void *)id v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Subscription info is changing to %@", (uint8_t *)&v20, 0xCu);
    }
    [(CTXPCNotificationProxy *)self->_notificationProxy subscriptionInfoDidChange];
  }
}

- (void)_handleActiveSubscriptionsChanged_sync:(const void *)a3
{
  p_allSubInfo = &self->_allSubInfo;
  unint64_t v5 = self->_allSubInfo;
  xpc_object_t v6 = objc_opt_new();
  p_activeSubs = &self->_activeSubs;
  unsigned int v8 = self->_activeSubs;
  uint64_t v9 = objc_opt_new();
  p_activeSubsSink = &self->_activeSubsSink;
  int64_t v11 = self->_activeSubsSink.fValue.fSubscriptions.__end_ - self->_activeSubsSink.fValue.fSubscriptions.__begin_;
  if (v11)
  {
    id v30 = v5;
    unint64_t v31 = v6;
    char v12 = +[NSMutableArray arrayWithCapacity:0x2E8BA2E8BA2E8BA3 * (v11 >> 4)];
    id v29 = p_allSubInfo;
    uint64_t v13 = +[NSMutableArray arrayWithCapacity:0x2E8BA2E8BA2E8BA3* ((self->_activeSubsSink.fValue.fSubscriptions.__end_ - self->_activeSubsSink.fValue.fSubscriptions.__begin_) >> 4)];
    end = self->_activeSubsSink.fValue.fSubscriptions.__end_;
    if (p_activeSubsSink->fValue.fSubscriptions.__begin_ != end)
    {
      uint64_t v15 = (uint64_t)p_activeSubsSink->fValue.fSubscriptions.__begin_ + 112;
      do
      {
        uint64_t v16 = v15 - 112;
        uint64_t v17 = sub_1005AF1B4(v15 - 112);
        [v12 addObject:v17];

        objc_super v18 = sub_1005AF40C(v15 - 112);
        [v13 addObject:v18];

        if (*(_DWORD *)(v15 + 24) == 2)
        {
          id v19 = objc_alloc((Class)NSUUID);
          uint64_t v20 = v15;
          if (*(char *)(v15 + 23) < 0) {
            uint64_t v20 = *(void *)v15;
          }
          id v21 = +[NSString stringWithUTF8String:v20];
          id v22 = [v19 initWithUUIDString:v21];
          [v9 setDataPreferred:v22];
        }
        if (*(_DWORD *)(v15 + 28) == 2)
        {
          id v23 = objc_alloc((Class)NSUUID);
          uint64_t v24 = v15;
          if (*(char *)(v15 + 23) < 0) {
            uint64_t v24 = *(void *)v15;
          }
          uint64_t v25 = +[NSString stringWithUTF8String:v24];
          id v26 = [v23 initWithUUIDString:v25];
          [v9 setVoicePreferred:v26];
        }
        v15 += 176;
      }
      while ((SubscriptionContext *)(v16 + 176) != end);
    }
    xpc_object_t v6 = v31;
    if ([v12 count]) {
      [v31 setSubscriptions:v12];
    }
    if ([v13 count]) {
      [v9 setSubscriptions:v13];
    }

    unint64_t v5 = v30;
    p_activeSubs = &self->_activeSubs;
    p_allSubInfo = v29;
  }
  objc_storeStrong((id *)p_allSubInfo, v6);
  objc_storeStrong((id *)p_activeSubs, v9);
  if (([(CTXPCContexts *)v8 isEqual:*p_activeSubs] & 1) == 0)
  {
    [(CTXPCServer *)self getLogContext];
    SEL v27 = *(NSObject **)&v33[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = *p_activeSubs;
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v33 = v8;
      *(_WORD *)&unsigned char v33[8] = 2112;
      *(void *)&v33[10] = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Active contexts are changing from %@ to %@", buf, 0x16u);
    }
    [(CTXPCNotificationProxy *)self->_notificationProxy activeSubscriptionsDidChange];
  }
}

- (void)_updateAppNotificationState_sync:(int)a3 isBackgroundEntitled:(BOOL)a4
{
}

- (void)_processAppState_sync:(int)a3 state:(int)a4 isDaemon:(BOOL)a5 isBackgroundEntitled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a3;
  if ([(CTXPCServer *)self _handleAppStateChanged_sync:*(void *)&a3 state:*(void *)&a4 isDaemon:a5])
  {
    [(CTXPCServer *)self _updateAppNotificationState_sync:v7 isBackgroundEntitled:v6];
  }
}

- (void)_handleAppSuspended_sync:(int)a3
{
  p_pair1 = &self->_clients.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)self->_clients.__tree_.__begin_node_;
  if (begin_node != &self->_clients.__tree_.__pair1_)
  {
    char v8 = 0;
    *(void *)&long long v3 = 136446210;
    long long v14 = v3;
    do
    {
      if (*(_DWORD *)begin_node[5].__value_.__left_ == a3)
      {
        if ((v8 & 1) == 0)
        {
          [(CTXPCServer *)self getLogContext];
          uint64_t v9 = __p[1];
          ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)__p);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            sub_10004B74C(__p, (uint64_t)begin_node[5].__value_.__left_);
            uint64_t v10 = v16 >= 0 ? __p : (void **)__p[0];
            *(_DWORD *)buf = v14;
            objc_super v18 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App state[%{public}s] is suspended", buf, 0xCu);
            if (v16 < 0) {
              operator delete(__p[0]);
            }
          }
        }
        objc_msgSend(begin_node[4].__value_.__left_, "invalidate", v14);
        char v8 = 1;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          char v12 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          char v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v13 = v12->__value_.__left_ == begin_node;
          begin_node = v12;
        }
        while (!v13);
      }
      begin_node = v12;
    }
    while (v12 != p_pair1);
  }
}

- (void)_handleAppRunningTransitioned_sync:(const void *)a3 isForeground:(BOOL)a4
{
  uint64_t v6 = *(void *)a3;
  unsigned int v7 = *(_DWORD *)(*(void *)a3 + 48);
  if (v7 <= 5)
  {
    if (((1 << v7) & 0xD) != 0)
    {
      BOOL v8 = !a4;
      int v9 = 2;
      goto LABEL_6;
    }
    if (((1 << v7) & 0x30) != 0)
    {
      BOOL v8 = !a4;
      int v9 = 4;
LABEL_6:
      if (v8) {
        unsigned int v7 = v9;
      }
      else {
        unsigned int v7 = v9 + 1;
      }
      goto LABEL_9;
    }
    [(CTXPCServer *)self getLogContext];
    long long v14 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    uint64_t v6 = *(void *)a3;
    if (v15)
    {
      sub_10004B74C(buf, v6);
      if (v20 >= 0) {
        char v16 = buf;
      }
      else {
        char v16 = *(unsigned char **)buf;
      }
      *(_DWORD *)__p = 136446210;
      *(void *)&__p[4] = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Ignoring app state [%{public}s] transition due to no restrictions", __p, 0xCu);
      if (SHIBYTE(v20) < 0) {
        operator delete(*(void **)buf);
      }
      uint64_t v6 = *(void *)a3;
    }
    unsigned int v7 = 1;
  }
LABEL_9:
  if (v7 != *(_DWORD *)(v6 + 48))
  {
    [(CTXPCServer *)self getLogContext];
    uint64_t v10 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B74C(__p, *(void *)a3);
      if (v18 >= 0) {
        int64_t v11 = __p;
      }
      else {
        int64_t v11 = *(unsigned char **)__p;
      }
      uint64_t v12 = asString();
      uint64_t v13 = asString();
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v12;
      __int16 v20 = 2080;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "App state[%{public}s] is moving from %s to %s", buf, 0x20u);
      if (v18 < 0) {
        operator delete(*(void **)__p);
      }
    }
    *(_DWORD *)(*(void *)a3 + 48) = v7;
  }
}

- (void)connectionDidBecomeInterrupted:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  char v18 = 0;
  [(CTXPCServer *)self _getOrCreateProcInfo_sync:v4];
  p_clients = &self->_clients;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_clients.__tree_.__pair1_;
    do
    {
      unint64_t v8 = (unint64_t)left[4].__value_.__left_;
      BOOL v9 = v8 >= (unint64_t)v4;
      if (v8 >= (unint64_t)v4) {
        uint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)left;
      }
      else {
        uint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)&left[1];
      }
      if (v9) {
        p_pair1 = left;
      }
      left = *v10;
    }
    while (*v10);
    if (p_pair1 != &self->_clients.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= v4)
    {
      int64_t v11 = p_pair1 + 5;
      sub_10019E028((uint64_t *)&p_pair1[10]);
      [(CTXPCServer *)self resetAppCategory:v11];
      [(CTXPCServer *)self getLogContext];
      uint64_t v12 = *(NSObject **)&v20[4];
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004B74C(__p, v17);
        uint64_t v13 = v16 >= 0 ? __p : (void **)__p[0];
        unint64_t value = p_clients->__tree_.__pair3_.__value_;
        *(_DWORD *)buf = 136315650;
        *(void *)__int16 v20 = v13;
        *(_WORD *)&v20[8] = 2048;
        *(void *)&v20[10] = v4;
        __int16 v21 = 2048;
        unint64_t v22 = value;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client [%s] interrupted (conn=%p), client list size %zu", buf, 0x20u);
        if (v16 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }
  if (v18) {
    sub_10004D2C8(v18);
  }
}

- (id)allSubscriptions
{
  return self->_allSubInfo;
}

- (id)contextForUUID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CTXPCServiceSubscriptionInfo *)self->_allSubInfo subscriptions];

  if (v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v6 = [(CTXPCServiceSubscriptionInfo *)self->_allSubInfo subscriptions];
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v26;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        int64_t v11 = [v10 uuid];
        unsigned __int8 v12 = [v11 isEqual:v4];

        if (v12) {
          goto LABEL_21;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  uint64_t v13 = [(CTXPCServiceSubscriptionInfo *)self->_subInfo subscriptions];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [(CTXPCServiceSubscriptionInfo *)self->_subInfo subscriptions];
    id v15 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v15)
    {
LABEL_22:

      goto LABEL_24;
    }
    uint64_t v16 = *(void *)v22;
LABEL_14:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v22 != v16) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
      char v18 = [v10 uuid];
      unsigned __int8 v19 = [v18 isEqual:v4];

      if (v19) {
        break;
      }
      if (v15 == (id)++v17)
      {
        id v15 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v15) {
          goto LABEL_14;
        }
        goto LABEL_22;
      }
    }
LABEL_21:
    id v15 = v10;
    goto LABEL_22;
  }
  id v15 = 0;
LABEL_24:

  return v15;
}

- (id)resolveContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 uuid];

    if (v6)
    {
      id v7 = [v5 uuid];
      uint64_t v8 = [(CTXPCServer *)self contextForUUID:v7];
    }
    else
    {
      id v9 = [v5 slotID];
      if (v9 == (id)2) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = v9 == (id)1;
      }
      uint64_t v8 = [(CTXPCServer *)self contextForSlot:v10];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)anyClientRespondsToSelector:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A60714;
  v8[3] = &unk_101A31BF0;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CTXPCServer *)self executeBlock:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (os_state_data_s)_dumpState_sync:(os_state_hints_s *)a3
{
  if (a3->var2 == 3)
  {
    long long v21 = 0;
    sub_100A5E748((xpc_object_t *)&v21, &self->_clients.__tree_.__begin_node_);
    CFPropertyListRef propertyList = 0;
    id v4 = v21;
    ctu::xpc_to_cf((uint64_t *)&error, v21, v5);
    sub_10004EFE4(&propertyList, (CFTypeRef *)&error);
    sub_1000577C4((const void **)&error);
    CFErrorRef err = 0;
    *(void *)&long long error = 0;
    *((void *)&error + 1) = &err;
    CFDataRef Data = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&error);
    theCFDataRef Data = Data;
    sub_100128064((const void **)&error);
    if (Data) {
      id v7 = sub_10008324C;
    }
    else {
      id v7 = 0;
    }
    if (v7)
    {
      size_t Length = CFDataGetLength(Data);
      [(CTXPCServer *)self getLogContext];
      id v9 = *((void *)&error + 1);
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&error);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(error) = 134217984;
        *(void *)((char *)&error + 4) = Length;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Created %zu bytes of CF serialized data", (uint8_t *)&error, 0xCu);
      }
      uint64_t v10 = (os_state_data_s *)malloc_type_calloc(1uLL, Length + 200, 0xB8D7B3E9uLL);
      v10->var0 = 1;
      v10->var1.int var1 = Length;
      strlcpy(v10->var3, "CTXPCServer", 0x40uLL);
      BytePtr = CFDataGetBytePtr(theData);
      memcpy(v10->var4, BytePtr, Length);
    }
    else
    {
      CFStringRef v17 = CFErrorCopyDescription(err);
      [(CTXPCServer *)self getLogContext];
      id v15 = *((void *)&error + 1);
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&error);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(error) = 138412290;
        *(void *)((char *)&error + 4) = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not convert current cells to serialized CF representation: %@", (uint8_t *)&error, 0xCu);
      }
      sub_1000558F4((const void **)&v17);
      uint64_t v10 = 0;
    }
    sub_100030068((const void **)&theData);
    sub_100127D74((const void **)&err);
    sub_100057D78(&propertyList);
    xpc_release(v4);
  }
  else
  {
    [(CTXPCServer *)self getLogContext];
    uint64_t v13 = *((void *)&error + 1);
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&error);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int var2 = a3->var2;
      LODWORD(error) = 67109120;
      DWORD1(error) = var2;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skipping state handler for %d", (uint8_t *)&error, 8u);
    }
    return 0;
  }
  return v10;
}

- (void)connectionDidTriggerFault:(id)a3 logString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_12;
  }
  p_pair1 = &self->_clients.__tree_.__pair1_;
  do
  {
    unint64_t v10 = (unint64_t)left[4].__value_.__left_;
    BOOL v11 = v10 >= (unint64_t)v6;
    if (v10 >= (unint64_t)v6) {
      unsigned __int8 v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)left;
    }
    else {
      unsigned __int8 v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> **)&left[1];
    }
    if (v11) {
      p_pair1 = left;
    }
    left = *v12;
  }
  while (*v12);
  if (p_pair1 != &self->_clients.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= v6)
  {
    [(CTXPCServer *)self getLogContext];
    BOOL v14 = *(NSObject **)&v20[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B74C(__p, (uint64_t)p_pair1[5].__value_.__left_);
      id v15 = v18 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136315650;
      *(void *)__int16 v20 = v15;
      *(_WORD *)&v20[8] = 2048;
      *(void *)&v20[10] = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Triggering fault for client [%s] (conn=%p): %@", buf, 0x20u);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
    }
    uint64_t v16 = [v6 remoteObjectProxy];
    [v16 clientDidTriggerFault:v7];
  }
  else
  {
LABEL_12:
    [(CTXPCServer *)self getLogContext];
    uint64_t v13 = *(NSObject **)&v20[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)__int16 v20 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to send fault to connection %p", buf, 0xCu);
    }
  }
}

- (CTXPCNotificationProxy)notificationProxy
{
  return self->_notificationProxy;
}

- (void)setNotificationProxy:(id)a3
{
}

- (CTXPCServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CTXPCServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setRegistry:(shared_ptr<const Registry>)a3
{
  p_registry = &self->_registry;
  unint64_t v5 = *(Registry **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_registry.__cntrl_;
  p_registry->__ptr_ = v5;
  p_registry->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
}

- (void)setFactory:(id)a3
{
}

- (map<NSXPCConnection)clients
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = &retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  unint64_t v5 = self + 7;
  unint64_t value = (map<NSXPCConnection *, (anonymous namespace)::ClientInfo, std::less<NSXPCConnection *>, std::allocator<std::pair<NSXPCConnection *const, (anonymous namespace)::ClientInfo>>> *)self[6].__tree_.__pair3_.__value_;
  if (value != &self[7])
  {
    id v7 = 0;
    uint64_t v8 = &retstr->__tree_.__pair1_;
    while (1)
    {
      id v9 = &value[1].__tree_.__pair1_;
      unint64_t v10 = &retstr->__tree_.__pair1_;
      if (v8 == p_pair1) {
        goto LABEL_9;
      }
      left = v7;
      unsigned __int8 v12 = &retstr->__tree_.__pair1_;
      if (v7)
      {
        do
        {
          unint64_t v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)left[1].__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          unint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v12[2].__value_.__left_;
          BOOL v13 = v10->__value_.__left_ == v12;
          unsigned __int8 v12 = v10;
        }
        while (v13);
      }
      BOOL v14 = v9->__value_.__left_;
      if (v10[4].__value_.__left_ < v9->__value_.__left_)
      {
LABEL_9:
        if (v7) {
          id v15 = v10;
        }
        else {
          id v15 = &retstr->__tree_.__pair1_;
        }
        if (v7) {
          uint64_t v16 = (uint64_t **)&v10[1];
        }
        else {
          uint64_t v16 = (uint64_t **)&retstr->__tree_.__pair1_;
        }
        if (!*v16)
        {
LABEL_24:
          memset(v20, 0, sizeof(v20));
          sub_100A61B74(v20, (uint64_t)retstr, (uint64_t)v9);
          sub_100046C38((uint64_t **)retstr, (uint64_t)v15, v16, v20[0]);
          v20[0] = 0;
          self = (map<NSXPCConnection *, (anonymous namespace)::ClientInfo, std::less<NSXPCConnection *>, std::allocator<std::pair<NSXPCConnection *const, (anonymous namespace)::ClientInfo>>> *)sub_10003C22C((uint64_t)v20);
        }
      }
      else
      {
        uint64_t v16 = (uint64_t **)&retstr->__tree_.__pair1_;
        id v15 = &retstr->__tree_.__pair1_;
        if (!v7) {
          goto LABEL_24;
        }
        while (1)
        {
          while (1)
          {
            id v15 = v7;
            CFStringRef v17 = v7[4].__value_.__left_;
            if (v14 >= v17) {
              break;
            }
            id v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v15->__value_.__left_;
            uint64_t v16 = (uint64_t **)v15;
            if (!v15->__value_.__left_) {
              goto LABEL_24;
            }
          }
          if (v17 >= v14) {
            break;
          }
          id v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v15[1].__value_.__left_;
          if (!v7)
          {
            uint64_t v16 = (uint64_t **)&v15[1];
            goto LABEL_24;
          }
        }
      }
      begin_node = (map<NSXPCConnection *, (anonymous namespace)::ClientInfo, std::less<NSXPCConnection *>, std::allocator<std::pair<NSXPCConnection *const, (anonymous namespace)::ClientInfo>>> *)value->__tree_.__pair1_.__value_.__left_;
      if (begin_node)
      {
        do
        {
          unsigned __int8 v19 = begin_node;
          begin_node = (map<NSXPCConnection *, (anonymous namespace)::ClientInfo, std::less<NSXPCConnection *>, std::allocator<std::pair<NSXPCConnection *const, (anonymous namespace)::ClientInfo>>> *)begin_node->__tree_.__begin_node_;
        }
        while (begin_node);
      }
      else
      {
        do
        {
          unsigned __int8 v19 = (map<NSXPCConnection *, (anonymous namespace)::ClientInfo, std::less<NSXPCConnection *>, std::allocator<std::pair<NSXPCConnection *const, (anonymous namespace)::ClientInfo>>> *)value->__tree_.__pair3_.__value_;
          BOOL v13 = v19->__tree_.__begin_node_ == value;
          unint64_t value = v19;
        }
        while (!v13);
      }
      if (v19 == v5) {
        return self;
      }
      uint64_t v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)retstr->__tree_.__begin_node_;
      id v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)retstr->__tree_.__pair1_.__value_.__left_;
      unint64_t value = v19;
    }
  }
  return self;
}

- (void)setClients:(map<NSXPCConnection *)
{
  p_clients = &self->_clients;
  if (&self->_clients != a3)
  {
    p_pair1 = &a3->__tree_.__pair1_;
    begin_node = (uint64_t *)a3->__tree_.__begin_node_;
    if (self->_clients.__tree_.__pair3_.__value_)
    {
      v56 = 0;
      id v6 = (uint64_t *)p_clients->__tree_.__begin_node_;
      left = self->_clients.__tree_.__pair1_.__value_.__left_;
      self->_clients.__tree_.__begin_node_ = &self->_clients.__tree_.__pair1_;
      left[2] = 0;
      __int16 v53 = &self->_clients.__tree_.__pair1_;
      uint64_t v54 = (uint64_t *)&self->_clients;
      self->_clients.__tree_.__pair1_.__value_.__left_ = 0;
      self->_clients.__tree_.__pair3_.__value_ = 0;
      if (v6[1]) {
        id v6 = (uint64_t *)v6[1];
      }
      v55 = v6;
      sub_100A61DDC((uint64_t)&v54);
      uint64_t v8 = v56;
      if (v56 && begin_node != (uint64_t *)p_pair1)
      {
        v52 = p_pair1;
        while (1)
        {
          objc_storeStrong((id *)v8 + 4, (id)begin_node[4]);
          uint64_t v10 = begin_node[5];
          uint64_t v9 = begin_node[6];
          if (v9) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
          }
          BOOL v11 = (std::__shared_weak_count *)v8[6];
          void v8[5] = v10;
          v8[6] = v9;
          if (v11) {
            sub_10004D2C8(v11);
          }
          if (v8 == begin_node) {
            goto LABEL_60;
          }
          unsigned __int8 v12 = (unsigned char *)v8[7];
          BOOL v14 = (unsigned char *)begin_node[7];
          BOOL v13 = (unsigned char *)begin_node[8];
          size_t v15 = v13 - v14;
          unint64_t v16 = (v13 - v14) >> 3;
          uint64_t v17 = v8[9];
          if (v16 <= (v17 - (uint64_t)v12) >> 3)
          {
            __int16 v20 = (unsigned char *)v8[8];
            unint64_t v21 = (v20 - v12) >> 3;
            if (v21 < v16)
            {
              if (v20 != v12)
              {
                memmove((void *)v8[7], (const void *)begin_node[7], v20 - v12);
                unsigned __int8 v12 = (unsigned char *)v8[8];
              }
              id v22 = &v14[8 * v21];
              size_t v15 = v13 - v22;
              if (v13 == v22) {
                goto LABEL_31;
              }
              long long v23 = v12;
              goto LABEL_30;
            }
          }
          else
          {
            if (v12)
            {
              v8[8] = (uint64_t)v12;
              operator delete(v12);
              uint64_t v17 = 0;
              v8[7] = 0;
              v8[8] = 0;
              v8[9] = 0;
            }
            if ((v15 & 0x8000000000000000) != 0) {
              sub_10006A748();
            }
            uint64_t v18 = v17 >> 2;
            if (v17 >> 2 <= v16) {
              uint64_t v18 = (v13 - v14) >> 3;
            }
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v19 = v18;
            }
            sub_100A61D08(v8 + 7, v19);
            unsigned __int8 v12 = (unsigned char *)v8[8];
          }
          if (v13 == v14) {
            goto LABEL_31;
          }
          long long v23 = v12;
          id v22 = v14;
LABEL_30:
          memmove(v23, v22, v15);
LABEL_31:
          long long v25 = (void **)(v8 + 10);
          long long v24 = (void *)v8[10];
          v8[8] = (uint64_t)&v12[v15];
          long long v27 = (uint64_t *)begin_node[10];
          long long v26 = (uint64_t *)begin_node[11];
          unint64_t v28 = ((char *)v26 - (char *)v27) >> 4;
          uint64_t v29 = v8[12];
          if (v28 <= (v29 - (uint64_t)v24) >> 4)
          {
            unint64_t v34 = (v8[11] - (uint64_t)v24) >> 4;
            if (v34 >= v28)
            {
              v38 = sub_10019E238((uint64_t *)begin_node[10], (uint64_t *)begin_node[11], v24);
              v39 = (void *)v8[11];
              for (p_pair1 = v52; v39 != v38; v39 -= 2)
              {
                id v40 = (std::__shared_weak_count *)*(v39 - 1);
                if (v40) {
                  sub_10004D2C8(v40);
                }
              }
              v8[11] = (uint64_t)v38;
            }
            else
            {
              BOOL v35 = &v27[2 * v34];
              sub_10019E238((uint64_t *)begin_node[10], v35, v24);
              v36 = (uint64_t *)v8[11];
              if (v35 == v26)
              {
                p_pair1 = v52;
              }
              else
              {
                p_pair1 = v52;
                do
                {
                  uint64_t *v36 = *v35;
                  uint64_t v37 = v35[1];
                  v36[1] = v37;
                  if (v37) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v37 + 8), 1uLL, memory_order_relaxed);
                  }
                  v36 += 2;
                  v35 += 2;
                }
                while (v35 != v26);
              }
              v8[11] = (uint64_t)v36;
            }
          }
          else
          {
            if (v24)
            {
              sub_10019E028(v8 + 10);
              operator delete(*v25);
              uint64_t v29 = 0;
              *long long v25 = 0;
              v8[11] = 0;
              v8[12] = 0;
            }
            if ((char *)v26 - (char *)v27 < 0) {
              sub_10006A748();
            }
            uint64_t v30 = v29 >> 3;
            if (v29 >> 3 <= v28) {
              uint64_t v30 = ((char *)v26 - (char *)v27) >> 4;
            }
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v31 = v30;
            }
            sub_100A61D48(v8 + 10, v31);
            unint64_t v32 = (uint64_t *)v8[11];
            while (v27 != v26)
            {
              uint64_t *v32 = *v27;
              uint64_t v33 = v27[1];
              v32[1] = v33;
              if (v33) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v33 + 8), 1uLL, memory_order_relaxed);
              }
              v32 += 2;
              v27 += 2;
            }
            v8[11] = (uint64_t)v32;
            p_pair1 = v52;
          }
LABEL_60:
          *(_OWORD *)(v8 + 13) = *(_OWORD *)(begin_node + 13);
          id v41 = (uint64_t **)v53;
          v42 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v53->__value_.__left_;
          char v43 = v53;
          if (v53->__value_.__left_)
          {
            do
            {
              while (1)
              {
                char v43 = v42;
                if ((void *)v56[4] >= v42[4].__value_.__left_) {
                  break;
                }
                v42 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v42->__value_.__left_;
                id v41 = (uint64_t **)v43;
                if (!v43->__value_.__left_) {
                  goto LABEL_66;
                }
              }
              v42 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v42[1].__value_.__left_;
            }
            while (v42);
            id v41 = (uint64_t **)&v43[1];
          }
LABEL_66:
          sub_100046C38((uint64_t **)p_clients, (uint64_t)v43, v41, v56);
          sub_100A61DDC((uint64_t)&v54);
          long long v44 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)begin_node[1];
          if (v44)
          {
            do
            {
              long long v45 = v44;
              long long v44 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v44->__value_.__left_;
            }
            while (v44);
          }
          else
          {
            do
            {
              long long v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)begin_node[2];
              BOOL v46 = v45->__value_.__left_ == begin_node;
              begin_node = (uint64_t *)v45;
            }
            while (!v46);
          }
          uint64_t v8 = v56;
          if (v56) {
            BOOL v46 = v45 == p_pair1;
          }
          else {
            BOOL v46 = 1;
          }
          begin_node = (uint64_t *)v45;
          if (v46) {
            goto LABEL_78;
          }
        }
      }
      long long v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)begin_node;
LABEL_78:
      sub_100A61E3C((uint64_t)&v54);
      begin_node = (uint64_t *)v45;
    }
    if (begin_node != (uint64_t *)p_pair1)
    {
      do
      {
        uint64_t v54 = 0;
        v55 = 0;
        v56 = 0;
        sub_100A61B74(&v54, (uint64_t)p_clients, (uint64_t)(begin_node + 4));
        long long v47 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)p_clients->__tree_.__pair1_.__value_.__left_;
        unint64_t v48 = &p_clients->__tree_.__pair1_;
        __int16 v49 = (uint64_t **)&p_clients->__tree_.__pair1_;
        if (v47)
        {
          do
          {
            while (1)
            {
              unint64_t v48 = v47;
              if ((void *)v54[4] >= v47[4].__value_.__left_) {
                break;
              }
              long long v47 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v47->__value_.__left_;
              __int16 v49 = (uint64_t **)v48;
              if (!v48->__value_.__left_) {
                goto LABEL_86;
              }
            }
            long long v47 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v47[1].__value_.__left_;
          }
          while (v47);
          __int16 v49 = (uint64_t **)&v48[1];
        }
LABEL_86:
        sub_100046C38((uint64_t **)p_clients, (uint64_t)v48, v49, v54);
        uint64_t v54 = 0;
        sub_10003C22C((uint64_t)&v54);
        v50 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)begin_node[1];
        if (v50)
        {
          do
          {
            char v51 = v50;
            v50 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)v50->__value_.__left_;
          }
          while (v50);
        }
        else
        {
          do
          {
            char v51 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<NSXPCConnection *, (anonymous namespace)::ClientInfo>, void *>>> *)begin_node[2];
            BOOL v46 = v51->__value_.__left_ == begin_node;
            begin_node = (uint64_t *)v51;
          }
          while (!v46);
        }
        begin_node = (uint64_t *)v51;
      }
      while (v51 != p_pair1);
    }
  }
}

- (CTXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (CTXPCServerEntitlementProvider)entitlementProvider
{
  return self->_entitlementProvider;
}

- (void)setEntitlementProvider:(id)a3
{
}

- (CTXPCServiceSubscriptionInfo)subInfo
{
  return self->_subInfo;
}

- (void)setSubInfo:(id)a3
{
}

- (CTXPCServiceSubscriptionInfo)allSubInfo
{
  return self->_allSubInfo;
}

- (void)setAllSubInfo:(id)a3
{
}

- (CTXPCContexts)activeSubs
{
  return self->_activeSubs;
}

- (void)setActiveSubs:(id)a3
{
}

- (void).cxx_destruct
{
  sub_100A61D88((void *)self->_clients.__tree_.__pair1_.__value_.__left_);
  cntrl = self->_registry.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_activeSubs, 0);
  objc_storeStrong((id *)&self->_allSubInfo, 0);
  objc_storeStrong((id *)&self->_subInfo, 0);
  objc_storeStrong((id *)&self->_entitlementProvider, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationProxy, 0);
  objc_storeStrong((id *)&self->_clientBehaviorTracker, 0);
  p_activeSubsSink = &self->_activeSubsSink;
  sub_1007034E0((void ***)&p_activeSubsSink);
  sub_10030A9DC((uint64_t)&self->_subInfoSink, (void *)self->_subInfoSink.fValue.fSubscriptions.__tree_.__pair1_.__value_.__left_);
  unint64_t value = self->_restModule.__ptr_.__value_;
  self->_restModule.__ptr_.__value_ = 0;
  if (value) {
    sub_1001F20B0((uint64_t)&self->_restModule, (uint64_t)value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 2) = (char *)self + 24;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 20) = (char *)self + 168;
  return self;
}

@end