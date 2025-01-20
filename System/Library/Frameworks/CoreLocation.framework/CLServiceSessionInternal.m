@interface CLServiceSessionInternal
+ (id)alwaysSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5;
+ (id)passiveSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5;
+ (id)sessionWithLocationManager:(id)a3 type:(int)a4 queue:(id)a5 handler:(id)a6;
+ (id)whenInUseSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5;
- (BOOL)shouldBeRunning;
- (CLLocationManager)manager;
- (CLServiceSessionInternal)initWithLocationManager:(id)a3 serviceSessionType:(int)a4 queue:(id)p_cache handler:(id)a6;
- (NSData)storageToken;
- (NSString)identityToken;
- (id)weakClient;
- (int)sessionType;
- (void)createConnection;
- (void)dealloc;
- (void)destroyConnection;
- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)handleMessageDiagnostics:(shared_ptr<CLConnectionMessage>)a3;
- (void)invalidate;
- (void)manageConnection;
- (void)setIdentityToken:(id)a3;
- (void)setManager:(id)a3;
- (void)setShouldBeRunning:(BOOL)a3;
- (void)setStorageToken:(id)a3;
- (void)setWeakClient:(id)a3;
- (void)tearDown;
- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4;
@end

@implementation CLServiceSessionInternal

+ (id)passiveSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1F4181798](CLServiceSessionInternal, sel_sessionWithLocationManager_type_queue_handler_);
}

+ (id)whenInUseSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1F4181798](CLServiceSessionInternal, sel_sessionWithLocationManager_type_queue_handler_);
}

+ (id)alwaysSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1F4181798](CLServiceSessionInternal, sel_sessionWithLocationManager_type_queue_handler_);
}

+ (id)sessionWithLocationManager:(id)a3 type:(int)a4 queue:(id)a5 handler:(id)a6
{
  v7 = [[CLServiceSessionInternal alloc] initWithLocationManager:a3 serviceSessionType:*(void *)&a4 queue:a5 handler:a6];
  [a3 addIdentifiableClient:v7];
  return v7;
}

- (CLServiceSessionInternal)initWithLocationManager:(id)a3 serviceSessionType:(int)a4 queue:(id)p_cache handler:(id)a6
{
  LODWORD(v8) = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)CLServiceSessionInternal;
  v11 = [(CLServiceSessionInternal *)&v23 init];
  if (!v11) {
    return v11;
  }
  if (!p_cache)
  {
    p_cache = CLCircularRegion.cache;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
    }
    a2 = (SEL)CLCircularRegion.cache;
    v17 = qword_1EB2713E0;
    a3 = &off_190881000;
    v8 = "assert";
    a6 = "queue";
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2082;
      v29 = "assert";
      __int16 v30 = 2081;
      v31 = "queue";
      _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"queue cannot be nil while creating ExplicitServiceSession\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
      }
    }
    v18 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289539;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2082;
      v29 = "assert";
      __int16 v30 = 2081;
      v31 = "queue";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "queue cannot be nil while creating ExplicitServiceSession", "{\"msg%{public}.0s\":\"queue cannot be nil while creating ExplicitServiceSession\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
      }
    }
    v11 = (CLServiceSessionInternal *)qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2082;
      v29 = "assert";
      __int16 v30 = 2081;
      v31 = "queue";
      _os_log_impl(&dword_1906B8000, &v11->super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"queue cannot be nil while creating ExplicitServiceSession\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v20 = 98;
    v21 = "-[CLServiceSessionInternal initWithLocationManager:serviceSessionType:queue:handler:]";
    v19 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreLocation/CLServiceSessionInternal.mm";
    abort_report_np();
    __break(1u);
    goto LABEL_28;
  }
  v12 = _os_activity_create(&dword_1906B8000, "CL: CLServiceSession #serviceSession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);

  if (qword_1EB2713E8 != -1) {
LABEL_28:
  }
    dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
  v13 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    int v25 = 0;
    __int16 v26 = 2082;
    v27 = "";
    __int16 v28 = 2082;
    v29 = "activity";
    __int16 v30 = 2114;
    v31 = (const char *)v14;
    __int16 v32 = 2050;
    v33 = v11;
    __int16 v34 = 2050;
    id v35 = a3;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLServiceSession #serviceSession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"manager\":\"%{public}p\"}", buf, 0x3Au);
  }
  if ((objc_msgSend(a3, "isMasquerading", v19, v20, v21) & 1) == 0)
  {
    if (!sub_190717A7C()) {
      NSLog(&cfstr_ErrorClservice.isa);
    }
    if (v8 == 2)
    {
      MainBundle = CFBundleGetMainBundle();
      if (MainBundle)
      {
        if (!CFBundleGetValueForInfoDictionaryKey(MainBundle, @"NSLocationAlwaysAndWhenInUseUsageDescription")) {
          NSLog(&cfstr_ErrorPrivilege.isa);
        }
      }
    }
  }
  [(CLServiceSessionInternal *)v11 setShouldBeRunning:1];
  v11->_silo = (CLDispatchSilo *)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:p_cache];
  [(CLServiceSessionInternal *)v11 setManager:a3];
  v11->_sessionType = (int)v8;
  if (a6) {
    v11->_clientCallback = _Block_copy(a6);
  }
  os_activity_scope_leave(&state);
  return v11;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  silo = self->_silo;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19079B618;
  v5[3] = &unk_1E5696EE8;
  v5[4] = self;
  v5[5] = a3;
  -[CLDispatchSilo async:](silo, "async:", v5, a4);
}

- (void)tearDown
{
  self->_clientCallback = 0;
  [(CLServiceSessionInternal *)self setManager:0];

  self->_silo = 0;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLServiceSession #serviceSession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    v13 = "";
    __int16 v14 = 2082;
    v15 = "activity";
    __int16 v16 = 2114;
    v17 = v6;
    __int16 v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLServiceSession #serviceSession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLServiceSessionInternal *)self setShouldBeRunning:0];
  silo = self->_silo;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19079B894;
  v8[3] = &unk_1E5696BF0;
  v8[4] = self;
  [(CLDispatchSilo *)silo async:v8];
  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLServiceSession #serviceSession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2082;
    v17 = "activity";
    __int16 v18 = 2114;
    v19 = v6;
    __int16 v20 = 2050;
    v21 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLServiceSession #serviceSession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLServiceSessionInternal *)self setShouldBeRunning:0];
  silo = self->_silo;
  locationdConnection = self->_locationdConnection;
  self->_locationdConnection = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19079BAC4;
  v10[3] = &unk_1E5696F38;
  v10[4] = self;
  v10[5] = locationdConnection;
  [(CLDispatchSilo *)silo async:v10];
  [(CLServiceSessionInternal *)self tearDown];
  v9.receiver = self;
  v9.super_class = (Class)CLServiceSessionInternal;
  [(CLServiceSessionInternal *)&v9 dealloc];
  os_activity_scope_leave(&state);
}

- (void)manageConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLServiceSession #serviceSession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2082;
    int v13 = "activity";
    __int16 v14 = 2114;
    v15 = v6;
    __int16 v16 = 2050;
    v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLServiceSession #serviceSession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLServiceSessionInternal *)self identityToken]
    && [(CLServiceSessionInternal *)self shouldBeRunning])
  {
    [(CLServiceSessionInternal *)self createConnection];
  }
  else
  {
    [(CLServiceSessionInternal *)self destroyConnection];
  }
  os_activity_scope_leave(&v7);
}

- (void)createConnection
{
  if (!self->_locationdConnection) {
    operator new();
  }
}

- (void)destroyConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if (self->_locationdConnection)
  {
    if ([(CLServiceSessionInternal *)self identityToken]
      && ![(CLServiceSessionInternal *)self shouldBeRunning])
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
      }
      v3 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)int v13 = 2082;
        *(void *)&v13[2] = "";
        __int16 v14 = 2082;
        v15 = [(NSString *)[(CLServiceSessionInternal *)self identityToken] UTF8String];
        __int16 v16 = 2050;
        v17 = self;
        _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#serviceSession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
        }
      }
      v4 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        v5 = [(NSString *)[(CLServiceSessionInternal *)self identityToken] UTF8String];
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)int v13 = 2082;
        *(void *)&v13[2] = "";
        __int16 v14 = 2082;
        v15 = v5;
        __int16 v16 = 2050;
        v17 = self;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession destroyUponDisconnection(DIC)", "{\"msg%{public}.0s\":\"#serviceSession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      }
      sub_19073BF10("kCLConnectionMessageDestroyUponDisconnection", buf);
      int v11 = *(std::__shared_weak_count **)v13;
      if (*(void *)v13) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)v13 + 8), 1uLL, memory_order_relaxed);
      }
      CLConnection::sendMessage();
      if (v11) {
        sub_1906BFE48(v11);
      }
      if (*(void *)v13) {
        sub_1906BFE48(*(std::__shared_weak_count **)v13);
      }
    }
    locationdConnection = (CLConnection *)self->_locationdConnection;
    self->_locationdConnection = 0;
    CLConnection::deferredDelete(locationdConnection);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
    }
    os_activity_scope_state_s v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(NSString *)[(CLServiceSessionInternal *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)int v13 = 2082;
      *(void *)&v13[2] = "";
      __int16 v14 = 2082;
      v15 = v8;
      __int16 v16 = 2050;
      v17 = self;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#serviceSession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
      }
    }
    int v9 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      __int16 v10 = [(NSString *)[(CLServiceSessionInternal *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)int v13 = 2082;
      *(void *)&v13[2] = "";
      __int16 v14 = 2082;
      v15 = v10;
      __int16 v16 = 2050;
      v17 = self;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession invalidated and destroyed connection", "{\"msg%{public}.0s\":\"#serviceSession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
  }
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v6 = _os_activity_create(&dword_1906B8000, "CL: CLBackgroundActivitySession #backgroundActivitySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0059A0);
  }
  os_activity_scope_state_s v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    uint64_t v9 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
    if (*(char *)(v9 + 23) >= 0) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = *(void *)v9;
    }
    *(_DWORD *)buf = 68290050;
    int v21 = 0;
    __int16 v22 = 2082;
    objc_super v23 = "";
    __int16 v24 = 2082;
    int v25 = "activity";
    __int16 v26 = 2114;
    v27 = v8;
    __int16 v28 = 2050;
    v29 = self;
    __int16 v30 = 2082;
    uint64_t v31 = v10;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLBackgroundActivitySession #backgroundActivitySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"message\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  uint64_t v11 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  int v12 = *(char *)(v11 + 23);
  if (v12 < 0)
  {
    if (*(void *)(v11 + 8) != 31) {
      goto LABEL_28;
    }
    uint64_t v11 = *(void *)v11;
  }
  else if (v12 != 31)
  {
    goto LABEL_28;
  }
  if (*(void *)v11 == 0x656E6E6F434C436BLL
    && *(void *)(v11 + 8) == 0x73654D6E6F697463
    && *(void *)(v11 + 16) == 0x6761694465676173
    && *(void *)(v11 + 23) == 0x73636974736F6E67)
  {
    __int16 v16 = (std::__shared_weak_count *)*((void *)var0 + 1);
    v17 = *(CLConnectionMessage **)var0;
    uint64_t v18 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(CLServiceSessionInternal *)self handleMessageDiagnostics:&v17];
    if (v18) {
      sub_1906BFE48(v18);
    }
  }
LABEL_28:
  os_activity_scope_leave(&state);
}

- (void)handleMessageDiagnostics:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLServiceSessionInternal *)self shouldBeRunning] && self->_clientCallback)
  {
    v5 = *(CLConnectionMessage **)var0;
    v6 = (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    objc_msgSend((id)objc_msgSend((id)CLConnectionMessage::getDictionaryOfClasses(v5, v6), "objectForKeyedSubscript:", @"kCLConnectionMessageDiagnosticsKey"), "unsignedLongValue");
    os_activity_scope_state_s v7 = (void (*)(void))*((void *)self->_clientCallback + 2);
    v7();
  }
}

- (NSString)identityToken
{
  return self->identityToken;
}

- (void)setIdentityToken:(id)a3
{
}

- (NSData)storageToken
{
  return self->storageToken;
}

- (void)setStorageToken:(id)a3
{
}

- (CLLocationManager)manager
{
  return self->manager;
}

- (void)setManager:(id)a3
{
}

- (id)weakClient
{
  return objc_loadWeak(&self->weakClient);
}

- (void)setWeakClient:(id)a3
{
}

- (BOOL)shouldBeRunning
{
  return self->_shouldBeRunning;
}

- (void)setShouldBeRunning:(BOOL)a3
{
  self->_shouldBeRunning = a3;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (void).cxx_destruct
{
}

@end