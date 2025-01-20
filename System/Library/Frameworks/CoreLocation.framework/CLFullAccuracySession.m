@interface CLFullAccuracySession
+ (id)fullAccuracySessionWithLocationManager:(id)a3 purposeKey:(id)a4 queue:(id)a5 handler:(id)a6;
- (BOOL)shouldBeRunning;
- (CLFullAccuracySession)initWithLocationManager:(id)a3 purposeKey:(id)a4 queue:(id)a5 handler:(id)a6;
- (CLLocationManager)manager;
- (NSData)storageToken;
- (NSString)identityToken;
- (NSString)purposeKey;
- (id)weakClient;
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

@implementation CLFullAccuracySession

+ (id)fullAccuracySessionWithLocationManager:(id)a3 purposeKey:(id)a4 queue:(id)a5 handler:(id)a6
{
  v7 = [[CLFullAccuracySession alloc] initWithLocationManager:a3 purposeKey:a4 queue:a5 handler:a6];
  [a3 addIdentifiableClient:v7];
  return v7;
}

- (CLFullAccuracySession)initWithLocationManager:(id)a3 purposeKey:(id)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v12 = _os_activity_create(&dword_1906B8000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
  }
  v13 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    int v24 = 0;
    __int16 v25 = 2082;
    v26 = "";
    __int16 v27 = 2082;
    v28 = "activity";
    __int16 v29 = 2114;
    v30 = v14;
    __int16 v31 = 2050;
    v32 = self;
    __int16 v33 = 2050;
    id v34 = a3;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"manager\":\"%{public}p\"}", buf, 0x3Au);
  }
  v21.receiver = self;
  v21.super_class = (Class)CLFullAccuracySession;
  v15 = [(CLFullAccuracySession *)&v21 init];
  if (v15)
  {
    if (([a3 isMasquerading] & 1) == 0)
    {
      if (!sub_190717A7C()) {
        NSLog(&cfstr_ErrorClfullacc.isa);
      }
      MainBundle = CFBundleGetMainBundle();
      if (MainBundle)
      {
        CFDictionaryRef ValueForInfoDictionaryKey = (const __CFDictionary *)CFBundleGetValueForInfoDictionaryKey(MainBundle, @"NSLocationTemporaryUsageDescriptionDictionary");
        if (!ValueForInfoDictionaryKey || !CFDictionaryGetCount(ValueForInfoDictionaryKey)) {
          NSLog(&cfstr_ErrorNslocatio.isa);
        }
      }
    }
    v18 = a5;
    if (!a5)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
      }
      v19 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v24 = 0;
        __int16 v25 = 2082;
        v26 = "";
        __int16 v27 = 2050;
        v28 = (const char *)v15;
        _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#fullAccuracySession has nil callback queue; Creating locally\", \"self\":\"%{public}p\"}",
          buf,
          0x1Cu);
      }
      v18 = +[CLLocationManager sharedQueue];
    }
    v15->_silo = (CLDispatchSilo *)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:v18];
    if (v18 != a5) {
      dispatch_release(v18);
    }
    [(CLFullAccuracySession *)v15 setShouldBeRunning:1];
    v15->_purposeKey = (NSString *)[a4 copy];
    [(CLFullAccuracySession *)v15 setManager:a3];
    if (a6) {
      v15->_clientCallback = _Block_copy(a6);
    }
  }
  os_activity_scope_leave(&state);
  return v15;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v7 = _os_activity_create(&dword_1906B8000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
  }
  v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v14 = 0;
    __int16 v15 = 2082;
    v16 = "";
    __int16 v17 = 2082;
    v18 = "activity";
    __int16 v19 = 2114;
    v20 = v9;
    __int16 v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  silo = self->_silo;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1907AD890;
  v11[3] = &unk_1E5696EE8;
  v11[4] = self;
  v11[5] = a3;
  [(CLDispatchSilo *)silo async:v11];
  os_activity_scope_leave(&state);
}

- (void)manageConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    v11 = "";
    __int16 v12 = 2082;
    v13 = "activity";
    __int16 v14 = 2114;
    __int16 v15 = v6;
    __int16 v16 = 2050;
    __int16 v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLFullAccuracySession *)self identityToken]
    && [(CLFullAccuracySession *)self shouldBeRunning])
  {
    [(CLFullAccuracySession *)self createConnection];
  }
  else
  {
    [(CLFullAccuracySession *)self destroyConnection];
  }
  os_activity_scope_leave(&v7);
}

- (void)createConnection
{
  if (!self->_locationdConnection) {
    operator new();
  }
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v6 = _os_activity_create(&dword_1906B8000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
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
    uint64_t v23 = "";
    __int16 v24 = 2082;
    __int16 v25 = "activity";
    __int16 v26 = 2114;
    __int16 v27 = v8;
    __int16 v28 = 2050;
    __int16 v29 = self;
    __int16 v30 = 2082;
    uint64_t v31 = v10;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"message\":%{public, location:escape_only}s}", buf, 0x3Au);
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
    __int16 v17 = *(CLConnectionMessage **)var0;
    uint64_t v18 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(CLFullAccuracySession *)self handleMessageDiagnostics:&v17];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLFullAccuracySession *)self shouldBeRunning] && self->_clientCallback)
  {
    v6 = *(CLConnectionMessage **)var0;
    os_activity_scope_state_s v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = (NSSet *)objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v6, v9);
    uint64_t v11 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
    }
    int v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290051;
      int v16 = 0;
      __int16 v17 = 2082;
      uint64_t v18 = "";
      __int16 v19 = 2082;
      v20 = "activity";
      __int16 v21 = 2114;
      __int16 v22 = v13;
      __int16 v23 = 2050;
      __int16 v24 = self;
      __int16 v25 = 2113;
      __int16 v26 = DictionaryOfClasses;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", @"kCLConnectionMessageDiagnosticsKey"), "unsignedLongValue");
    (*((void (**)(void))self->_clientCallback + 2))();
    os_activity_scope_leave(&state);
  }
}

- (void)tearDown
{
  _Block_release(self->_clientCallback);
  self->_clientCallback = 0;
  [(CLFullAccuracySession *)self setManager:0];

  self->_silo = 0;
}

- (void)destroyConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if (self->_locationdConnection)
  {
    if ([(CLFullAccuracySession *)self identityToken]
      && ![(CLFullAccuracySession *)self shouldBeRunning])
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
      }
      v3 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v13 = 2082;
        *(void *)&v13[2] = "";
        __int16 v14 = 2082;
        __int16 v15 = [(NSString *)[(CLFullAccuracySession *)self identityToken] UTF8String];
        __int16 v16 = 2050;
        __int16 v17 = self;
        _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#fullAccuracySession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
        }
      }
      v4 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        v5 = [(NSString *)[(CLFullAccuracySession *)self identityToken] UTF8String];
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v13 = 2082;
        *(void *)&v13[2] = "";
        __int16 v14 = 2082;
        __int16 v15 = v5;
        __int16 v16 = 2050;
        __int16 v17 = self;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#fullAccuracySession destroyUponDisconnection(DIC)", "{\"msg%{public}.0s\":\"#fullAccuracySession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      }
      sub_19073BF10("kCLConnectionMessageDestroyUponDisconnection", buf);
      uint64_t v11 = *(std::__shared_weak_count **)v13;
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
      dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
    }
    os_activity_scope_state_s v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NSString *)[(CLFullAccuracySession *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)v13 = 2082;
      *(void *)&v13[2] = "";
      __int16 v14 = 2082;
      __int16 v15 = v8;
      __int16 v16 = 2050;
      __int16 v17 = self;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#fullAccuracySession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
      }
    }
    uint64_t v9 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      uint64_t v10 = [(NSString *)[(CLFullAccuracySession *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)v13 = 2082;
      *(void *)&v13[2] = "";
      __int16 v14 = 2082;
      __int16 v15 = v10;
      __int16 v16 = 2050;
      __int16 v17 = self;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#fullAccuracySession invalidated and destroyed connection", "{\"msg%{public}.0s\":\"#fullAccuracySession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
  }
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    __int16 v19 = v6;
    __int16 v20 = 2050;
    __int16 v21 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLFullAccuracySession *)self setShouldBeRunning:0];
  silo = self->_silo;
  locationdConnection = self->_locationdConnection;
  self->_locationdConnection = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907AEB44;
  v10[3] = &unk_1E5696F38;
  v10[4] = self;
  v10[5] = locationdConnection;
  [(CLDispatchSilo *)silo async:v10];
  [(CLFullAccuracySession *)self tearDown];
  v9.receiver = self;
  v9.super_class = (Class)CLFullAccuracySession;
  [(CLFullAccuracySession *)&v9 dealloc];
  os_activity_scope_leave(&state);
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005AA0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLFullAccuracySession *)self setShouldBeRunning:0];
  silo = self->_silo;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907AEF30;
  v8[3] = &unk_1E5696BF0;
  v8[4] = self;
  [(CLDispatchSilo *)silo async:v8];
  os_activity_scope_leave(&state);
}

- (NSData)storageToken
{
  return self->storageToken;
}

- (void)setStorageToken:(id)a3
{
}

- (NSString)identityToken
{
  return self->identityToken;
}

- (void)setIdentityToken:(id)a3
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

- (NSString)purposeKey
{
  return self->_purposeKey;
}

- (void).cxx_destruct
{
}

@end