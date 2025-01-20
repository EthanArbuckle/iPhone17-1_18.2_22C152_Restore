@interface CLBackgroundActivitySession
+ (CLBackgroundActivitySession)backgroundActivitySession;
+ (CLBackgroundActivitySession)backgroundActivitySessionWithLocationManager:(id)a3;
+ (CLBackgroundActivitySession)backgroundActivitySessionWithQueue:(id)a3 handler:(id)a4;
+ (CLBackgroundActivitySession)sessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5;
+ (CLBackgroundActivitySession)sessionWithLocationManager:(id)a3 requestPrivilege:(BOOL)a4 queue:(id)a5 handler:(id)a6;
- (BOOL)shouldBeRunning;
- (CLBackgroundActivitySession)initWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5;
- (CLLocationManager)manager;
- (NSData)storageToken;
- (NSString)identityToken;
- (id)weakClient;
- (void)createConnection;
- (void)dealloc;
- (void)destroyConnection;
- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)handleMessageDiagnostics:(shared_ptr<CLConnectionMessage>)a3;
- (void)invalidate;
- (void)manageConnection;
- (void)setHandler:(id)a3;
- (void)setIdentityToken:(id)a3;
- (void)setManager:(id)a3;
- (void)setShouldBeRunning:(BOOL)a3;
- (void)setStorageToken:(id)a3;
- (void)setWeakClient:(id)a3;
- (void)tearDown;
- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4;
@end

@implementation CLBackgroundActivitySession

- (void)setHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_clientCallback)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
    }
    v4 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289795;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2050;
      v15 = self;
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "_clientCallback == nullptr";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#backgroundActivitySession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
      }
    }
    v5 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289795;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2050;
      v15 = self;
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "_clientCallback == nullptr";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#backgroundActivitySession should initially be nil", "{\"msg%{public}.0s\":\"#backgroundActivitySession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
      }
    }
    v6 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289795;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2050;
      v15 = self;
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "_clientCallback == nullptr";
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#backgroundActivitySession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
LABEL_25:
    abort_report_np();
  }
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
    }
    v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289795;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2050;
      v15 = self;
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "handler != nullptr";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#backgroundActivitySession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
      }
    }
    v8 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289795;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2050;
      v15 = self;
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "handler != nullptr";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#backgroundActivitySession can't set a nil handler", "{\"msg%{public}.0s\":\"#backgroundActivitySession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
      }
    }
    v9 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289795;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2050;
      v15 = self;
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "handler != nullptr";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#backgroundActivitySession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
    goto LABEL_25;
  }
  self->_clientCallback = _Block_copy(a3);
}

- (void)handleMessageDiagnostics:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLBackgroundActivitySession *)self shouldBeRunning] && self->_clientCallback)
  {
    v6 = *(CLConnectionMessage **)var0;
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = (NSSet *)objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v6, v9);
    int v11 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290051;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2082;
      v21 = "activity";
      __int16 v22 = 2114;
      v23 = v13;
      __int16 v24 = 2050;
      v25 = self;
      __int16 v26 = 2113;
      v27 = DictionaryOfClasses;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    __int16 v14 = -[CLBackgroundActivitySessionDiagnostic initWithDiagnostics:]([CLBackgroundActivitySessionDiagnostic alloc], "initWithDiagnostics:", objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", @"kCLConnectionMessageDiagnosticsKey"), "unsignedLongValue"));
    (*((void (**)(void))self->_clientCallback + 2))();

    os_activity_scope_leave(&state);
  }
}

+ (CLBackgroundActivitySession)backgroundActivitySessionWithLocationManager:(id)a3
{
  return (CLBackgroundActivitySession *)MEMORY[0x1F4181798](CLBackgroundActivitySession, sel_sessionWithLocationManager_requestPrivilege_queue_handler_);
}

+ (CLBackgroundActivitySession)sessionWithLocationManager:(id)a3 requestPrivilege:(BOOL)a4 queue:(id)a5 handler:(id)a6
{
  return (CLBackgroundActivitySession *)MEMORY[0x1F4181798](CLBackgroundActivitySession, sel_sessionWithLocationManager_queue_handler_);
}

+ (CLBackgroundActivitySession)sessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  v6 = [[CLBackgroundActivitySession alloc] initWithLocationManager:a3 queue:a4 handler:a5];
  [a3 addIdentifiableClient:v6];
  return v6;
}

+ (CLBackgroundActivitySession)backgroundActivitySession
{
  +[CLLocationManager weakSharedInstance];

  return (CLBackgroundActivitySession *)MEMORY[0x1F4181798](CLBackgroundActivitySession, sel_backgroundActivitySessionWithLocationManager_);
}

+ (CLBackgroundActivitySession)backgroundActivitySessionWithQueue:(id)a3 handler:(id)a4
{
  +[CLLocationManager weakSharedInstance];

  return (CLBackgroundActivitySession *)MEMORY[0x1F4181798](CLBackgroundActivitySession, sel_sessionWithLocationManager_requestPrivilege_queue_handler_);
}

- (CLBackgroundActivitySession)initWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CLBackgroundActivitySession;
  v9 = [(CLBackgroundActivitySession *)&v16 init];
  if (v9)
  {
    v10 = _os_activity_create(&dword_1906B8000, "CL: CLBackgroundActivitySession #backgroundActivitySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v15);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
    }
    int v11 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290050;
      int v18 = 0;
      __int16 v19 = 2082;
      __int16 v20 = "";
      __int16 v21 = 2082;
      __int16 v22 = "activity";
      __int16 v23 = 2114;
      __int16 v24 = v12;
      __int16 v25 = 2050;
      __int16 v26 = v9;
      __int16 v27 = 2050;
      id v28 = a3;
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLBackgroundActivitySession #backgroundActivitySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"manager\":\"%{public}p\"}", buf, 0x3Au);
    }
    if (([a3 isMasquerading] & 1) == 0 && !sub_190717A7C()) {
      NSLog(&cfstr_ErrorClbackgro.isa);
    }
    [(CLBackgroundActivitySession *)v9 setShouldBeRunning:1];
    if (!a4)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
      }
      v13 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v18 = 0;
        __int16 v19 = 2082;
        __int16 v20 = "";
        __int16 v21 = 2050;
        __int16 v22 = (const char *)v9;
        _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#backgroundActivitySession, nil callback queue creating locally\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      }
      a4 = +[CLLocationManager sharedQueue];
    }
    v9->_silo = (CLDispatchSilo *)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a4];
    [(CLBackgroundActivitySession *)v9 setManager:a3];
    if (a5) {
      v9->_clientCallback = _Block_copy(a5);
    }
    os_activity_scope_leave(&v15);
  }
  return v9;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  silo = self->_silo;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907A8CC0;
  v5[3] = &unk_1E5696EE8;
  v5[4] = self;
  v5[5] = a3;
  -[CLDispatchSilo async:](silo, "async:", v5, a4);
}

- (void)tearDown
{
  self->_clientCallback = 0;
  [(CLBackgroundActivitySession *)self setManager:0];

  self->_silo = 0;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLBackgroundActivitySession #backgroundActivitySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
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
    os_activity_scope_state_s v15 = "activity";
    __int16 v16 = 2114;
    int v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLBackgroundActivitySession #backgroundActivitySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLBackgroundActivitySession *)self setShouldBeRunning:0];
  silo = self->_silo;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907A8F3C;
  v8[3] = &unk_1E5696BF0;
  v8[4] = self;
  [(CLDispatchSilo *)silo async:v8];
  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLBackgroundActivitySession #backgroundActivitySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    os_activity_scope_state_s v15 = "";
    __int16 v16 = 2082;
    int v17 = "activity";
    __int16 v18 = 2114;
    __int16 v19 = v6;
    __int16 v20 = 2050;
    __int16 v21 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLBackgroundActivitySession #backgroundActivitySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLBackgroundActivitySession *)self setShouldBeRunning:0];
  silo = self->_silo;
  locationdConnection = self->_locationdConnection;
  self->_locationdConnection = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907A916C;
  v10[3] = &unk_1E5696F38;
  v10[4] = self;
  v10[5] = locationdConnection;
  [(CLDispatchSilo *)silo async:v10];
  [(CLBackgroundActivitySession *)self tearDown];
  v9.receiver = self;
  v9.super_class = (Class)CLBackgroundActivitySession;
  [(CLBackgroundActivitySession *)&v9 dealloc];
  os_activity_scope_leave(&state);
}

- (void)manageConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLBackgroundActivitySession #backgroundActivitySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
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
    os_activity_scope_state_s v15 = v6;
    __int16 v16 = 2050;
    int v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLBackgroundActivitySession #backgroundActivitySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLBackgroundActivitySession *)self identityToken]
    && [(CLBackgroundActivitySession *)self shouldBeRunning])
  {
    [(CLBackgroundActivitySession *)self createConnection];
  }
  else
  {
    [(CLBackgroundActivitySession *)self destroyConnection];
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
    if ([(CLBackgroundActivitySession *)self identityToken]
      && ![(CLBackgroundActivitySession *)self shouldBeRunning])
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
      }
      v3 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)int v13 = 2082;
        *(void *)&v13[2] = "";
        __int16 v14 = 2082;
        os_activity_scope_state_s v15 = [(NSString *)[(CLBackgroundActivitySession *)self identityToken] UTF8String];
        __int16 v16 = 2050;
        int v17 = self;
        _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#backgroundActivitySession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
        }
      }
      v4 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        v5 = [(NSString *)[(CLBackgroundActivitySession *)self identityToken] UTF8String];
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)int v13 = 2082;
        *(void *)&v13[2] = "";
        __int16 v14 = 2082;
        os_activity_scope_state_s v15 = v5;
        __int16 v16 = 2050;
        int v17 = self;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#backgroundActivitySession destroyUponDisconnection(DIC)", "{\"msg%{public}.0s\":\"#backgroundActivitySession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
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
      dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
    }
    os_activity_scope_state_s v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NSString *)[(CLBackgroundActivitySession *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)int v13 = 2082;
      *(void *)&v13[2] = "";
      __int16 v14 = 2082;
      os_activity_scope_state_s v15 = v8;
      __int16 v16 = 2050;
      int v17 = self;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#backgroundActivitySession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
      }
    }
    int v9 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      __int16 v10 = [(NSString *)[(CLBackgroundActivitySession *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)int v13 = 2082;
      *(void *)&v13[2] = "";
      __int16 v14 = 2082;
      os_activity_scope_state_s v15 = v10;
      __int16 v16 = 2050;
      int v17 = self;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#backgroundActivitySession invalidated and destroyed connection", "{\"msg%{public}.0s\":\"#backgroundActivitySession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
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
    dispatch_once(&qword_1EB2713E8, &unk_1EE005A40);
  }
  os_activity_scope_state_s v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
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
    __int16 v23 = "";
    __int16 v24 = 2082;
    __int16 v25 = "activity";
    __int16 v26 = 2114;
    __int16 v27 = v8;
    __int16 v28 = 2050;
    uint64_t v29 = self;
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
    int v17 = *(CLConnectionMessage **)var0;
    uint64_t v18 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(CLBackgroundActivitySession *)self handleMessageDiagnostics:&v17];
    if (v18) {
      sub_1906BFE48(v18);
    }
  }
LABEL_28:
  os_activity_scope_leave(&state);
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

- (void).cxx_destruct
{
}

@end