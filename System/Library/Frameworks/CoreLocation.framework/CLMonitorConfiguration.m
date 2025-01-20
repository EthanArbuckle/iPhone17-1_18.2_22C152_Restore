@interface CLMonitorConfiguration
+ (CLMonitorConfiguration)configWithMonitorName:(NSString *)name queue:(dispatch_queue_t)queue eventHandler:(void *)eventHandler;
+ (id)_configWithMonitorName:(id)a3;
- (BOOL)useMonitorQueue;
- (CLLocationManager)manager;
- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onQueue:(id)a5 eventHandler:(id)a6;
- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onQueue:(id)a5 eventHandler:(id)a6 useMonitorQueueForVendingMonitor:(BOOL)a7 vendingHandler:(id)a8;
- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onSilo:(id)a5 eventHandler:(id)a6 useMonitorQueueForVendingMonitor:(BOOL)a7 vendingHandler:(id)a8;
- (NSData)storageToken;
- (NSString)identityToken;
- (NSString)name;
- (NSString)path;
- (dispatch_queue_t)queue;
- (id)vendingHandler;
- (id)weakClient;
- (unint64_t)hash;
- (void)dealloc;
- (void)eventHandler;
- (void)setEventHandler:(id)a3;
- (void)setIdentityToken:(id)a3;
- (void)setManager:(id)a3;
- (void)setStorageToken:(id)a3;
- (void)setUseMonitorQueue:(BOOL)a3;
- (void)setVendingHandler:(id)a3;
- (void)setWeakClient:(id)a3;
- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4;
- (void)vendMonitorWithIdentityAndAuthorizationAttributes:(id)a3;
@end

@implementation CLMonitorConfiguration

+ (CLMonitorConfiguration)configWithMonitorName:(NSString *)name queue:(dispatch_queue_t)queue eventHandler:(void *)eventHandler
{
  if (eventHandler)
  {
    if (queue) {
      goto LABEL_3;
    }
LABEL_8:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLMonitorConfiguration.m", 51, @"Monitoring queue is nil");
    if (name) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLMonitorConfiguration.m", 48, @"Monitoring event handler is nil");
  if (!queue) {
    goto LABEL_8;
  }
LABEL_3:
  if (name) {
    goto LABEL_4;
  }
LABEL_9:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLMonitorConfiguration.m", 54, @"Monitor name is nil");
LABEL_4:
  v10 = -[CLMonitorConfiguration initWithName:path:onSilo:eventHandler:useMonitorQueueForVendingMonitor:vendingHandler:]([CLMonitorConfiguration alloc], "initWithName:path:onSilo:eventHandler:useMonitorQueueForVendingMonitor:vendingHandler:", name, 0, (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:queue], eventHandler, 1, 0);

  return v10;
}

+ (id)_configWithMonitorName:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLMonitorConfiguration.m", 68, @"Monitor name is nil");
  }
  id v4 = +[CLLocationManager sharedQueue];
  v5 = -[CLMonitorConfiguration initWithName:path:onSilo:eventHandler:useMonitorQueueForVendingMonitor:vendingHandler:]([CLMonitorConfiguration alloc], "initWithName:path:onSilo:eventHandler:useMonitorQueueForVendingMonitor:vendingHandler:", a3, 0, (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:v4], 0, 1, 0);

  return v5;
}

- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onSilo:(id)a5 eventHandler:(id)a6 useMonitorQueueForVendingMonitor:(BOOL)a7 vendingHandler:(id)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CLMonitorConfiguration;
  v15 = [(CLMonitorConfiguration *)&v21 init];
  if (v15)
  {
    v16 = _os_activity_create(&dword_1906B8000, "CL: CLMonitorConfiguration #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v20.opaque[0] = 0;
    v20.opaque[1] = 0;
    os_activity_scope_enter(v16, &v20);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0055A0);
    }
    v17 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290050;
      int v23 = 0;
      __int16 v24 = 2082;
      v25 = "";
      __int16 v26 = 2082;
      v27 = "activity";
      __int16 v28 = 2114;
      v29 = v18;
      __int16 v30 = 2050;
      v31 = v15;
      __int16 v32 = 2114;
      id v33 = a3;
      _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitorConfiguration #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@}", buf, 0x3Au);
    }
    v15->_name = (NSString *)[a3 copy];
    v15->_path = (NSString *)[a4 copy];
    v15->_silo = (CLDispatchSilo *)a5;
    v15->_useMonitorQueue = a7;
    if (a6) {
      v15->_eventHandler = _Block_copy(a6);
    }
    if (a8) {
      v15->_vendingHandler = _Block_copy(a8);
    }
    os_activity_scope_leave(&v20);
  }
  return v15;
}

- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onQueue:(id)a5 eventHandler:(id)a6 useMonitorQueueForVendingMonitor:(BOOL)a7 vendingHandler:(id)a8
{
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a5];

  return [(CLMonitorConfiguration *)self initWithName:a3 path:a4 onSilo:v12 eventHandler:a6 useMonitorQueueForVendingMonitor:1 vendingHandler:0];
}

- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onQueue:(id)a5 eventHandler:(id)a6
{
  return (CLMonitorConfiguration *)MEMORY[0x1F4181798](self, sel_initWithName_path_onQueue_eventHandler_useMonitorQueueForVendingMonitor_vendingHandler_);
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLMonitorConfiguration #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0055A0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2082;
    v14 = "activity";
    __int16 v15 = 2114;
    v16 = v6;
    __int16 v17 = 2050;
    v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitorConfiguration #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }

  self->_name = 0;
  self->_path = 0;

  self->_silo = 0;
  _Block_release(self->_eventHandler);
  self->_eventHandler = 0;
  _Block_release(self->_vendingHandler);
  self->_vendingHandler = 0;
  [(CLMonitorConfiguration *)self setIdentityToken:0];
  [(CLMonitorConfiguration *)self setStorageToken:0];
  [(CLMonitorConfiguration *)self setManager:0];
  v7.receiver = self;
  v7.super_class = (Class)CLMonitorConfiguration;
  [(CLMonitorConfiguration *)&v7 dealloc];
  os_activity_scope_leave(&state);
}

- (unint64_t)hash
{
  v2 = [(CLMonitorConfiguration *)self name];

  return [(NSString *)v2 hash];
}

- (void)vendMonitorWithIdentityAndAuthorizationAttributes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v6 = _os_activity_create(&dword_1906B8000, "CL: CLMonitorConfiguration #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0055A0);
  }
  objc_super v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    __int16 v20 = 2050;
    objc_super v21 = self;
    __int16 v22 = 2113;
    id v23 = a3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitorConfiguration #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"vendingAttributes\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  [(CLLocationManager *)[(CLMonitorConfiguration *)self manager] removeIdentifiableClient:self];
  global_queue = [(CLDispatchSilo *)self->_silo queue];
  if (![(CLMonitorConfiguration *)self useMonitorQueue]) {
    global_queue = dispatch_get_global_queue(17, 0);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1906F51F0;
  v10[3] = &unk_1E5696EE8;
  v10[4] = self;
  v10[5] = a3;
  dispatch_async(global_queue, v10);
  os_activity_scope_leave(&state);
}

- (dispatch_queue_t)queue
{
  return (dispatch_queue_t)[(CLDispatchSilo *)self->_silo queue];
}

- (void)setVendingHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  objc_sync_enter(self);
  id vendingHandler = self->_vendingHandler;
  if (vendingHandler) {
    _Block_release(vendingHandler);
  }
  self->_id vendingHandler = v4;

  objc_sync_exit(self);
}

- (id)vendingHandler
{
  objc_sync_enter(self);
  id vendingHandler = self->_vendingHandler;
  objc_sync_exit(self);
  return vendingHandler;
}

- (void)setEventHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  objc_sync_enter(self);
  id eventHandler = self->_eventHandler;
  if (eventHandler) {
    _Block_release(eventHandler);
  }
  self->_id eventHandler = v4;

  objc_sync_exit(self);
}

- (void)eventHandler
{
  objc_sync_enter(self);
  id eventHandler = self->_eventHandler;
  objc_sync_exit(self);
  return eventHandler;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  [(CLMonitorConfiguration *)self setIdentityToken:a3];
  [(CLMonitorConfiguration *)self setStorageToken:a4];
  if ([(CLMonitorConfiguration *)self identityToken]
    && [(CLMonitorConfiguration *)self storageToken])
  {
    v15[0] = @"kCLMonitorIdentityTokenKey";
    v15[1] = @"kCLMonitorLedgerAccessKey";
    v16[0] = [(CLMonitorConfiguration *)self identityToken];
    v16[1] = [(CLMonitorConfiguration *)self storageToken];
    -[CLMonitorConfiguration vendMonitorWithIdentityAndAuthorizationAttributes:](self, "vendMonitorWithIdentityAndAuthorizationAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2]);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0055A0);
    }
    objc_super v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289538;
      v8[1] = 0;
      __int16 v9 = 2082;
      int v10 = "";
      __int16 v11 = 2114;
      id v12 = self;
      __int16 v13 = 2114;
      __int16 v14 = [(CLMonitorConfiguration *)self name];
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor completion handler called\", \"self\":%{public, location:escape_only}@, \"monitor\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x26u);
    }
  }
  objc_sync_exit(self);
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

- (NSString)name
{
  return self->_name;
}

- (BOOL)useMonitorQueue
{
  return self->_useMonitorQueue;
}

- (void)setUseMonitorQueue:(BOOL)a3
{
  self->_useMonitorQueue = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end