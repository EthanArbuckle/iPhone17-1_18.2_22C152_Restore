@interface CLIndoorXPCProvider
+ (id)newConnectionFor:(id)a3;
- (CLIndoorXPCProvider)init;
- (CLIndoorXPCProvider)initWithConnection:(id)a3;
- (CLIndoorXPCProvider)initWithEndpoint:(id)a3;
- (id).cxx_construct;
- (id)_defaultErrHandler:(id)a3 forCaller:(id)a4;
- (id)_defaultErrHandlerForCaller:(id)a3;
- (int)withinQueueShouldReinitializeRemote:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock;
- (void)dealloc;
- (void)invalidate;
- (void)withinQueueHandleReconnect:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock;
- (void)withinQueueInitializeConnection;
- (void)withinQueueInterruptionHandler;
- (void)withinQueueInvalidate;
- (void)withinQueueReinitializeRemoteState;
- (void)withinQueueScheduleReconnect:(duration<long)long reason:()std:(1000000000>>)a3 :(id)a4 ratio<1;
@end

@implementation CLIndoorXPCProvider

+ (id)newConnectionFor:(id)a3
{
  id v3 = a3;
  v8 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v4, v5, v6, v7);
  id v9 = objc_alloc(MEMORY[0x263F08D68]);
  v14 = objc_msgSend_endpointName(v3, v10, v11, v12, v13);
  v18 = objc_msgSend_persistentDomainForName_(v8, v15, @"com.apple.pipelined.framework", v16, v17);
  v22 = objc_msgSend_objectForKey_(v18, v19, @"UnprivilegedDaemon", v20, v21);
  int v27 = objc_msgSend_BOOLValue(v22, v23, v24, v25, v26);

  if (!v27)
  {
    uint64_t v29 = 4096;
    goto LABEL_7;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
    v28 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v28 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_4:
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_221DDF000, v28, OS_LOG_TYPE_INFO, "UnprivilegedDaemon default found.  Connecting to service launched manually (i.e. not via launchd)", v34, 2u);
  }
LABEL_5:
  uint64_t v29 = 0;
LABEL_7:

  v32 = objc_msgSend_initWithMachServiceName_options_(v9, v30, (uint64_t)v14, v29, v31);
  return v32;
}

- (CLIndoorXPCProvider)init
{
  uint64_t v6 = objc_msgSend_impl(self, a2, v2, v3, v4);
  v10 = objc_msgSend_newConnectionFor_(CLIndoorXPCProvider, v7, (uint64_t)v6, v8, v9);

  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
    uint64_t v11 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v11 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_221DDF000, v11, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, init", v17, 2u);
  }
LABEL_4:
  v15 = (CLIndoorXPCProvider *)objc_msgSend_initWithConnection_(self, v12, (uint64_t)v10, v13, v14);

  return v15;
}

- (CLIndoorXPCProvider)initWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v9 = objc_msgSend_initWithListenerEndpoint_(v5, v6, (uint64_t)v4, v7, v8);
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
    v10 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v10 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_221DDF000, v10, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, initWithEndpoint", v16, 2u);
  }
LABEL_4:
  uint64_t v14 = (CLIndoorXPCProvider *)objc_msgSend_initWithConnection_(self, v11, (uint64_t)v9, v12, v13);

  return v14;
}

- (CLIndoorXPCProvider)initWithConnection:(id)a3
{
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLIndoorXPCProvider;
  uint64_t v6 = [(CLIndoorXPCProvider *)&v45 init];
  v10 = v6;
  uint64_t v11 = v6;
  if (v6)
  {
    if (objc_msgSend_conformsToProtocol_(v6, v7, (uint64_t)&unk_26D4719A0, v8, v9))
    {
      uint64_t v13 = (void *)MEMORY[0x223C92960]();
      uint64_t v14 = NSString;
      v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v20 = objc_msgSend_stringWithFormat_(v14, v17, @"com.apple.CoreIndoor.%@", v18, v19, v16);

      id v21 = v20;
      uint64_t v26 = (const char *)objc_msgSend_UTF8String(v21, v22, v23, v24, v25);
      dispatch_queue_t v27 = dispatch_queue_create(v26, 0);
      frameworkQueue = v11->_frameworkQueue;
      v11->_frameworkQueue = (OS_dispatch_queue *)v27;

      uint64_t v29 = v11->_frameworkQueue;
      if (!v29)
      {
        v10 = 0;
        goto LABEL_10;
      }
      objc_storeStrong((id *)&v10->_connection, a3);
      if (v11->_connection)
      {
        dispatch_queue_set_specific((dispatch_queue_t)v11->_frameworkQueue, &unk_221E50500, v11, 0);
        dispatch_source_t v31 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v11->_frameworkQueue);
        interruptReconnection = v11->_interruptReconnection;
        v11->_interruptReconnection = (OS_dispatch_source *)v31;

        objc_initWeak(&location, v11);
        v33 = v11->_interruptReconnection;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3321888768;
        handler[2] = sub_221E1F7CC;
        handler[3] = &unk_26D46B458;
        objc_copyWeak(to, &location);
        objc_copyWeak(&v43, to);
        dispatch_source_set_event_handler(v33, handler);
        objc_destroyWeak(to);
        dispatch_resume((dispatch_object_t)v11->_interruptReconnection);
        if (qword_26ABF4AF8 == -1)
        {
          v34 = qword_26ABF4AF0;
          if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
          {
LABEL_8:
            objc_msgSend_withinQueueInitializeConnection(v11, v35, v36, v37, v38);
            v10 = v11;
            objc_destroyWeak(&v43);
            objc_destroyWeak(&location);
            goto LABEL_10;
          }
        }
        else
        {
          dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
          v34 = qword_26ABF4AF0;
          if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
            goto LABEL_8;
          }
        }
        LOWORD(to[0]) = 0;
        _os_log_impl(&dword_221DDF000, v34, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, initWithConnection, re-initializing", (uint8_t *)to, 2u);
        goto LABEL_8;
      }
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v30, *MEMORY[0x263EFF4A0], @"Must provide a connection", 0);
    }
    else
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v12, *MEMORY[0x263EFF4A0], @"Concrete implementation of CLIndoorXPCProvider must conform to CLIndoorXPCProviderImplementation", 0);
    }
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
LABEL_10:

  return v10;
}

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_impl(self, a2, v2, v3, v4);
  objc_msgSend_endpointName(v6, v7, v8, v9, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_UTF8String(v11, v12, v13, v14, v15);

  if (dispatch_get_specific(&unk_221E50500) == self || !self->_frameworkQueue)
  {
    if (qword_26ABF4AF8 == -1)
    {
      uint64_t v20 = qword_26ABF4AF0;
      if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
      {
LABEL_10:
        objc_msgSend_withinQueueInvalidate(self, v21, v22, v23, v24);
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
      uint64_t v20 = qword_26ABF4AF0;
      if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = v16;
    _os_log_impl(&dword_221DDF000, v20, OS_LOG_TYPE_INFO, "dealloc connection to %{public}s", buf, 0xCu);
    goto LABEL_10;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
    uint64_t v17 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v17 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DDF000, v17, OS_LOG_TYPE_DEBUG, "dealloc begins", buf, 2u);
  }
LABEL_6:
  frameworkQueue = self->_frameworkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = sub_221E1FAE8;
  block[3] = &unk_26D46B488;
  dispatch_queue_t v27 = self;
  uint64_t v19 = v27;
  dispatch_sync(frameworkQueue, block);

LABEL_11:
  v25.receiver = self;
  v25.super_class = (Class)CLIndoorXPCProvider;
  [(CLIndoorXPCProvider *)&v25 dealloc];
}

- (void)invalidate
{
  frameworkQueue = self->_frameworkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = sub_221E1FC60;
  block[3] = &unk_26D46B4B8;
  id v5 = self;
  uint64_t v3 = v5;
  dispatch_sync(frameworkQueue, block);
}

- (void)withinQueueInvalidate
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
  }
  uint64_t v3 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    uint64_t v9 = objc_msgSend_impl(self, v4, v5, v6, v7);
    uint64_t v14 = objc_msgSend_endpointName(v9, v10, v11, v12, v13);
    int v36 = 134349314;
    uint64_t v37 = connection;
    __int16 v38 = 2114;
    v39 = v14;
    _os_log_impl(&dword_221DDF000, v3, OS_LOG_TYPE_INFO, "About to invalidate connection %{public}p to %{public}@", (uint8_t *)&v36, 0x16u);
  }
  objc_msgSend_setInterruptionHandler_(self->_connection, v15, 0, v16, v17);
  objc_msgSend_setInvalidationHandler_(self->_connection, v18, 0, v19, v20);
  objc_msgSend_invalidate(self->_connection, v21, v22, v23, v24);
  interruptReconnection = self->_interruptReconnection;
  if (interruptReconnection) {
    dispatch_source_cancel(interruptReconnection);
  }
  uint64_t v26 = self->_connection;
  self->_connection = 0;

  dispatch_source_t v31 = objc_msgSend_impl(self, v27, v28, v29, v30);
  objc_msgSend_withinQueueInvalidateState(v31, v32, v33, v34, v35);
}

- (void)withinQueueInitializeConnection
{
  uint64_t v6 = (void *)MEMORY[0x263F08D80];
  uint64_t v7 = objc_msgSend_impl(self, a2, v2, v3, v4);
  uint64_t v12 = objc_msgSend_remoteObjectProtocol(v7, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_interfaceWithProtocol_(v6, v13, (uint64_t)v12, v14, v15);
  objc_msgSend_setRemoteObjectInterface_(self->_connection, v17, (uint64_t)v16, v18, v19);

  objc_initWeak(&location, self);
  objc_copyWeak(&to, &location);
  uint64_t v36 = MEMORY[0x263EF8330];
  uint64_t v37 = 3321888768;
  __int16 v38 = sub_221E20CE8;
  v39 = &unk_26D46B558;
  objc_copyWeak(&v40, &to);
  uint64_t v20 = (void *)MEMORY[0x223C92B60](&v36);
  objc_destroyWeak(&v40);
  objc_msgSend_setInterruptionHandler_(self->_connection, v21, (uint64_t)v20, v22, v23);

  objc_destroyWeak(&to);
  objc_initWeak(&from, self);
  objc_copyWeak(&v32, &from);
  uint64_t v36 = MEMORY[0x263EF8330];
  uint64_t v37 = 3321888768;
  __int16 v38 = sub_221E20DA0;
  v39 = &unk_26D46B588;
  objc_copyWeak(&v40, &v32);
  uint64_t v24 = (void *)MEMORY[0x223C92B60](&v36);
  objc_destroyWeak(&v40);
  objc_msgSend_setInvalidationHandler_(self->_connection, v25, (uint64_t)v24, v26, v27);

  objc_destroyWeak(&v32);
  objc_msgSend_resume(self->_connection, v28, v29, v30, v31);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)withinQueueInterruptionHandler
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_impl(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_withinQueuePermanentShutdownReason(v6, v7, v8, v9, v10);

  if (v11)
  {
    if (qword_26ABF4AF8 != -1) {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
    }
    uint64_t v12 = (id)qword_26ABF4AF0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_msgSend_impl(self, v13, v14, v15, v16);
      uint64_t v22 = objc_msgSend_endpointName(v17, v18, v19, v20, v21);
      uint64_t v27 = objc_msgSend_description(v11, v23, v24, v25, v26);
      int v47 = 138543618;
      v48 = v22;
      __int16 v49 = 2114;
      v50 = v27;
      _os_log_impl(&dword_221DDF000, v12, OS_LOG_TYPE_INFO, "XPC connection invalidated by daemon to %{public}@: %{public}@", (uint8_t *)&v47, 0x16u);
    }
    objc_msgSend_withinQueueInvalidate(self, v28, v29, v30, v31);
  }
  else
  {
    if (qword_26ABF4AF8 != -1) {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
    }
    id v32 = (id)qword_26ABF4AF0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = objc_msgSend_impl(self, v33, v34, v35, v36);
      v42 = objc_msgSend_endpointName(v37, v38, v39, v40, v41);
      int v47 = 138543362;
      v48 = v42;
      _os_log_impl(&dword_221DDF000, v32, OS_LOG_TYPE_INFO, "pipelined interruption handler for %{public}@", (uint8_t *)&v47, 0xCu);
    }
    v43.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    objc_msgSend_withinQueueHandleReconnect_(self, v44, v43.__d_.__rep_, v45, v46);
  }
}

- (void)withinQueueHandleReconnect:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  int ShouldReinitializeRemote = objc_msgSend_withinQueueShouldReinitializeRemote_(self, a2, a3.var0.__rep_, v3, v4);
  if (ShouldReinitializeRemote == 1)
  {
    objc_msgSend_withinQueueReinitializeRemoteState(self, v8, v9, v10, v11);
    if (self->_lastReconnectTime.m_initialized)
    {
LABEL_5:
      *(time_point<std::chrono::steady_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) = a3;
      return;
    }
  }
  else
  {
    if (ShouldReinitializeRemote == 2) {
      objc_msgSend_withinQueueScheduleReconnect_reason_(self, v8, *(void *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) - a3.var0.__rep_ + 10000000000, @"deferred re-initialization", v11);
    }
    if (self->_lastReconnectTime.m_initialized) {
      goto LABEL_5;
    }
  }
  self->_lastReconnectTime.m_initialized = 1;
  *(time_point<std::chrono::steady_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) = a3;
}

- (int)withinQueueShouldReinitializeRemote:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_impl(self, a2, a3.var0.__rep_, v3, v4);
  char CanReinitializeRemoteState = objc_msgSend_withinQueueCanReinitializeRemoteState(v7, v8, v9, v10, v11);

  if (CanReinitializeRemoteState)
  {
    if (self->_lastReconnectTime.m_initialized
      && a3.var0.__rep_ - *(void *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) < 10000000000)
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    if (qword_26ABF4AF8 != -1) {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
    }
    uint64_t v14 = (id)qword_26ABF4AF0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = objc_msgSend_impl(self, v15, v16, v17, v18);
      uint64_t v24 = objc_msgSend_endpointName(v19, v20, v21, v22, v23);
      int v25 = 138543362;
      uint64_t v26 = v24;
      _os_log_impl(&dword_221DDF000, v14, OS_LOG_TYPE_INFO, "Already invalidated/no remote state - ignoring request to re-initialize %{public}@", (uint8_t *)&v25, 0xCu);
    }
    return 0;
  }
}

- (void)withinQueueReinitializeRemoteState
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
  }
  uint64_t v3 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = objc_msgSend_impl(self, v4, v5, v6, v7);
    uint64_t v13 = objc_msgSend_endpointName(v8, v9, v10, v11, v12);
    int v23 = 138543362;
    uint64_t v24 = v13;
    _os_log_impl(&dword_221DDF000, v3, OS_LOG_TYPE_DEBUG, "re-initializing pipelined connection to %{public}@ with existing state", (uint8_t *)&v23, 0xCu);
  }
  uint64_t v18 = objc_msgSend_impl(self, v14, v15, v16, v17);
  objc_msgSend_withinQueueReinitializeRemoteState(v18, v19, v20, v21, v22);
}

- (void)withinQueueScheduleReconnect:(duration<long)long reason:()std:(1000000000>>)a3 :(id)a4 ratio<1
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B538);
  }
  uint64_t v7 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = objc_msgSend_impl(self, v8, v9, v10, v11);
    uint64_t v17 = objc_msgSend_endpointName(v12, v13, v14, v15, v16);
    int v19 = 138543874;
    uint64_t v20 = v17;
    __int16 v21 = 2114;
    id v22 = v6;
    __int16 v23 = 2048;
    int64_t v24 = a3.__rep_ / 1000000;
    _os_log_impl(&dword_221DDF000, v7, OS_LOG_TYPE_INFO, "Connection to %{public}@ %{public}@ - retrying in %lld milliseconds", (uint8_t *)&v19, 0x20u);
  }
  dispatch_time_t v18 = dispatch_time(0, a3.__rep_);
  dispatch_source_set_timer((dispatch_source_t)self->_interruptReconnection, v18, 0xFFFFFFFFFFFFFFFFLL, 0x77359400uLL);
}

- (id)_defaultErrHandlerForCaller:(id)a3
{
  uint64_t v4 = objc_msgSend__defaultErrHandler_forCaller_(self, a2, (uint64_t)&unk_26D46B4E8, (uint64_t)a3, v3);
  return v4;
}

- (id)_defaultErrHandler:(id)a3 forCaller:(id)a4
{
  id v5 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3321888768;
  v12[2] = sub_221E20A78;
  v12[3] = &unk_26D46B508;
  id v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x223C92B60](a3);
  id v8 = v6;
  id v13 = v8;
  id v14 = (id)MEMORY[0x223C92B60](v7);
  uint64_t v9 = (void *)MEMORY[0x223C92B60](v12);

  uint64_t v10 = (void *)MEMORY[0x223C92B60](v9);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptReconnection, 0);
  if (self->_lastReconnectTime.m_initialized) {
    self->_lastReconnectTime.m_initialized = 0;
  }
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_frameworkQueue, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 24) = 0;
  return self;
}

@end