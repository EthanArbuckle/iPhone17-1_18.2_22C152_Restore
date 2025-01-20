@interface CLMonitor
+ (BOOL)isMonitorNameInUse:(id)a3;
+ (id)sharedMonitorSet;
+ (void)_requestMonitorWithConfiguration:(id)a3 locationManager:(id)a4 completion:(id)a5;
+ (void)addMonitorName:(id)a3;
+ (void)removeMonitorName:(id)a3;
+ (void)requestMonitorWithConfiguration:(CLMonitorConfiguration *)config completion:(void *)completionHandler;
+ (void)requestWithConfiguration:(id)a3 locationManager:(id)a4 completion:(id)a5;
- (CLLocationManager)manager;
- (CLMonitor)initWithLedgerName:(id)a3 path:(id)a4 onSilo:(id)a5 authIdentity:(id)a6 locationManager:(id)a7 handler:(id)a8;
- (CLMonitoringRecord)monitoringRecordForIdentifier:(NSString *)identifier;
- (NSArray)monitoredIdentifiers;
- (NSData)storageToken;
- (NSString)identityToken;
- (NSString)monitorName;
- (NSString)name;
- (id)_getMonitoredIdentifiers;
- (id)_getMonitoringRecords;
- (id)getMonitorConfiguration;
- (id)weakClient;
- (unint64_t)hash;
- (void)_addConditionForMonitoring:(id)a3 identifier:(id)a4 options:(unint64_t)a5 assumedState:(unint64_t)a6;
- (void)_removeConditionFromMonitoringWithIdentifier:(id)a3;
- (void)addConditionForMonitoring:(CLCondition *)condition identifier:(NSString *)identifier;
- (void)addConditionForMonitoring:(CLCondition *)condition identifier:(NSString *)identifier assumedState:(CLMonitoringState)state;
- (void)addConditionForMonitoring:(id)a3 identifier:(id)a4 options:(unint64_t)a5 assumedState:(unint64_t)a6;
- (void)addConstraintForMonitoring:(id)a3 identifier:(id)a4;
- (void)addConstraintForMonitoring:(id)a3 identifier:(id)a4 assumedState:(unint64_t)a5;
- (void)createConnection;
- (void)dealloc;
- (void)destroyConnection;
- (void)handleMessageMonitor:(shared_ptr<CLConnectionMessage>)a3;
- (void)manageConnection;
- (void)removeConditionFromMonitoringWithIdentifier:(NSString *)identifier;
- (void)setIdentityToken:(id)a3;
- (void)setManager:(id)a3;
- (void)setMonitoringEventHandler:(id)a3;
- (void)setStorageToken:(id)a3;
- (void)setWeakClient:(id)a3;
- (void)updateEvent:(id)a3 forIdentifier:(id)a4;
- (void)updateEventReceivedFromDaemon:(id)a3;
- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4;
@end

@implementation CLMonitor

- (id)_getMonitoringRecords
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_190806CB4;
  v11 = sub_190806CC4;
  uint64_t v12 = 0;
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [(CLDispatchSilo *)self->_silo queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190806D04;
  v6[3] = &unk_1E56983B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_getMonitoredIdentifiers
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_190806CB4;
  v11 = sub_190806CC4;
  uint64_t v12 = 0;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(CLDispatchSilo *)self->_silo queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190806CD0;
  v6[3] = &unk_1E56983B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (CLMonitor)initWithLedgerName:(id)a3 path:(id)a4 onSilo:(id)a5 authIdentity:(id)a6 locationManager:(id)a7 handler:(id)a8
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)CLMonitor;
  v15 = [(CLMonitor *)&v28 init];
  if (v15)
  {
    v16 = _os_activity_create(&dword_1906B8000, "CL: CLMonitor #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v16, &v27);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    v17 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290307;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      __int16 v35 = 2082;
      v36 = "activity";
      __int16 v37 = 2114;
      v38 = v18;
      __int16 v39 = 2050;
      v40 = v15;
      __int16 v41 = 2114;
      id v42 = a3;
      __int16 v43 = 2113;
      id v44 = a6;
      _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@, \"authIdentity\":%{private, location:escape_only}@}", buf, 0x44u);
    }
    v15->_name = (NSString *)[a3 copy];
    v15->_silo = (CLDispatchSilo *)a5;
    [(CLMonitor *)v15 setManager:a7];
    BOOL v19 = a4 != 0;
    uint64_t v20 = [a6 objectForKeyedSubscript:@"kCLMonitorIdentityTokenKey"];
    uint64_t v21 = [a6 objectForKeyedSubscript:@"kCLMonitorLedgerAccessKey"];
    v22 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    v30[0] = a3;
    v29[0] = @"kCLMonitorLedgerNameKey";
    v29[1] = @"kCLMonitorLedgerProcessNameKey";
    uint64_t v23 = [(CLLocationManager *)[(CLMonitor *)v15 manager] processName];
    v29[2] = @"kCLMonitorDispatchSiloKey";
    silo = v15->_silo;
    v30[1] = v23;
    v30[2] = silo;
    v29[3] = @"kCLMonitorIdentityTokenKey";
    v29[4] = @"kCLMonitorLedgerAccessKey";
    v30[3] = v20;
    v30[4] = v21;
    objc_msgSend(v22, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v30, v29, 5));
    if (a4)
    {
      v25 = (void *)[a4 copy];
      [v22 setObject:v25 forKeyedSubscript:@"kCLMonitorLedgerPathKey"];
    }
    [(CLMonitor *)v15 setIdentityToken:v20];
    [(CLMonitor *)v15 setStorageToken:v21];
    v15->_conditionLedger = [[CLConditionLedger alloc] initWithStoreType:v19 domain:v19 monitorConfiguration:v22];
    [(CLMonitor *)v15 setMonitoringEventHandler:a8];
    [(CLMonitor *)v15 createConnection];
    os_activity_scope_leave(&v27);
  }
  return v15;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLMonitor #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    uint64_t v7 = [(NSString *)[(CLMonitor *)self name] UTF8String];
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)v14 = 2082;
    *(void *)&v14[2] = "";
    *(_WORD *)&v14[10] = 2082;
    *(void *)&v14[12] = "activity";
    *(_WORD *)&v14[20] = 2114;
    *(void *)&v14[22] = v6;
    __int16 v15 = 2050;
    v16 = self;
    __int16 v17 = 2082;
    v18 = v7;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  [(CLLocationManager *)[(CLMonitor *)self manager] removeIdentifiableClient:self];
  _Block_release(self->_eventHandler);
  self->_eventHandler = 0;
  [(CLMonitor *)self setIdentityToken:0];
  [(CLMonitor *)self setStorageToken:0];

  self->_conditionLedger = 0;
  [(CLMonitor *)self setManager:0];
  +[CLMonitor removeMonitorName:self->_name];

  self->_name = 0;
  *(void *)buf = 0;
  *(void *)v14 = buf;
  *(void *)&v14[8] = 0x2020000000;
  silo = self->_silo;
  *(void *)&v14[16] = self->_locationdConnection;
  uint64_t v9 = [(CLDispatchSilo *)silo queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190806958;
  block[3] = &unk_1E56983B0;
  block[4] = silo;
  block[5] = buf;
  dispatch_async(v9, block);

  self->_silo = 0;
  v10.receiver = self;
  v10.super_class = (Class)CLMonitor;
  [(CLMonitor *)&v10 dealloc];
  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

- (unint64_t)hash
{
  v2 = [(CLMonitor *)self name];

  return [(NSString *)v2 hash];
}

- (NSArray)monitoredIdentifiers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLMonitor #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
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
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLDispatchSilo *)self->_silo assertInside];
  uint64_t v7 = [(CLConditionLedger *)self->_conditionLedger allMonitoringIdentifiers];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setMonitoringEventHandler:(id)a3
{
  v4 = _Block_copy(a3);
  id eventHandler = self->_eventHandler;
  if (eventHandler) {
    _Block_release(eventHandler);
  }
  self->_id eventHandler = v4;
}

- (void)addConditionForMonitoring:(id)a3 identifier:(id)a4 options:(unint64_t)a5 assumedState:(unint64_t)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  __int16 v12 = _os_activity_create(&dword_1906B8000, "CL: CLMonitor #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
  }
  v13 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290306;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v34 = 2082;
    __int16 v35 = "";
    __int16 v36 = 2082;
    __int16 v37 = "activity";
    __int16 v38 = 2114;
    uint64_t v39 = (uint64_t)v14;
    __int16 v40 = 2050;
    __int16 v41 = self;
    __int16 v42 = 2114;
    id v43 = a4;
    __int16 v44 = 2050;
    unint64_t v45 = a6;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"identifier\":%{public, location:escape_only}@, \"assumedState\":%{public, location:CLMonitoringState}lld}", buf, 0x44u);
  }
  [(CLDispatchSilo *)self->_silo assertInside];
  id v15 = [(CLConditionLedger *)self->_conditionLedger monitoringRecordForIdentifier:a4];
  __int16 v16 = v15;
  if (v15)
  {
    if (objc_msgSend((id)objc_msgSend(v15, "condition"), "isEqual:", a3))
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
      }
      uint64_t v17 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [a4 UTF8String];
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v34 = 2082;
        __int16 v35 = "";
        __int16 v36 = 2082;
        __int16 v37 = (const char *)v18;
        __int16 v38 = 2113;
        uint64_t v39 = (uint64_t)a3;
        uint64_t v19 = "{\"msg%{public}.0s\":\"#monitor given identifier and condition is currently monitored\", \"identifier\":%{"
              "public, location:escape_only}s, \"condition\":%{private, location:escape_only}@}";
        uint64_t v20 = v17;
        uint32_t v21 = 38;
LABEL_36:
        _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
        goto LABEL_37;
      }
      goto LABEL_37;
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    v22 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [a4 UTF8String];
      uint64_t v24 = [v16 condition];
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      __int16 v36 = 2082;
      __int16 v37 = (const char *)v23;
      __int16 v38 = 2113;
      uint64_t v39 = v24;
      _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor removing currently monitored condition\", \"identifier\":%{public, location:escape_only}s, \"toBeRemoved\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    [(CLMonitor *)self removeConditionFromMonitoringWithIdentifier:a4];
  }
  id v25 = [[CLMonitoringRecord alloc] initRecordWithCondition:a3 identifier:a4 options:a5 initialState:a6];
  [(CLConditionLedger *)self->_conditionLedger addRecordForMonitoring:v25 identifier:a4 persist:1];
  if (![(CLMonitor *)self identityToken])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    uint64_t v29 = qword_1EB2713E0;
    if (!os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    uint64_t v30 = [a4 UTF8String];
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v34 = 2082;
    __int16 v35 = "";
    __int16 v36 = 2082;
    __int16 v37 = (const char *)v30;
    uint64_t v19 = "{\"msg%{public}.0s\":\"#monitor Client is not authorized to monitor just yet.\", \"identifier\":%{public, loca"
          "tion:escape_only}s}";
LABEL_35:
    uint64_t v20 = v29;
    uint32_t v21 = 28;
    goto LABEL_36;
  }
  if (self->_locationdConnection)
  {
    v26 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v26, "setObject:forKeyedSubscript:", -[CLMonitor identityToken](self, "identityToken"), @"kCLConnectionMessageClientKeyForIdentityValidation");
    [v26 setObject:v25 forKeyedSubscript:@"kCLConnectionMessageMonitorMonitoringRecordKey"];
    objc_msgSend(v26, "addEntriesFromDictionary:", -[CLMonitor getMonitorConfiguration](self, "getMonitorConfiguration"));
    os_activity_scope_state_s v27 = (std::__shared_weak_count *)operator new(0x70uLL);
    v27->__shared_owners_ = 0;
    v27->__shared_weak_owners_ = 0;
    v27->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
    sub_1906D5C70(buf, "Monitor/kCLConnectionMessageMonitorAdd");
    MEMORY[0x192FCE840](&v27[1], buf, v26);
    if (SBYTE3(v37) < 0) {
      operator delete(*(void **)buf);
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    objc_super v28 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      __int16 v36 = 2114;
      __int16 v37 = (const char *)a4;
      __int16 v38 = 2113;
      uint64_t v39 = (uint64_t)v25;
      _os_log_impl(&dword_1906B8000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor add record for monitoring\", \"identifier\":%{public, location:escape_only}@, \"record\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
    CLConnection::sendMessage();
    if (v27) {
      sub_1906BFE48(v27);
    }

    sub_1906BFE48(v27);
    goto LABEL_37;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
  }
  uint64_t v29 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [a4 UTF8String];
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v34 = 2082;
    __int16 v35 = "";
    __int16 v36 = 2082;
    __int16 v37 = (const char *)v31;
    uint64_t v19 = "{\"msg%{public}.0s\":\"#monitor No valid connection to locationd to add for monitoring\", \"identifier\":%{pub"
          "lic, location:escape_only}s}";
    goto LABEL_35;
  }
LABEL_37:
  os_activity_scope_leave(&state);
}

- (void)addConditionForMonitoring:(CLCondition *)condition identifier:(NSString *)identifier assumedState:(CLMonitoringState)state
{
}

- (void)addConstraintForMonitoring:(id)a3 identifier:(id)a4
{
}

- (void)addConstraintForMonitoring:(id)a3 identifier:(id)a4 assumedState:(unint64_t)a5
{
}

- (void)_addConditionForMonitoring:(id)a3 identifier:(id)a4 options:(unint64_t)a5 assumedState:(unint64_t)a6
{
  objc_initWeak(&location, self);
  int v11 = [(CLDispatchSilo *)self->_silo queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1908074E4;
  v12[3] = &unk_1E56983D8;
  objc_copyWeak(v13, &location);
  v12[4] = a3;
  v12[5] = a4;
  v13[1] = (id)a5;
  v13[2] = (id)a6;
  dispatch_async(v11, v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)addConditionForMonitoring:(CLCondition *)condition identifier:(NSString *)identifier
{
}

- (void)removeConditionFromMonitoringWithIdentifier:(NSString *)identifier
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v6 = _os_activity_create(&dword_1906B8000, "CL: CLMonitor #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
  }
  uint64_t v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v18 = 2082;
    uint64_t v19 = "";
    __int16 v20 = 2082;
    uint32_t v21 = (NSString *)"activity";
    __int16 v22 = 2114;
    uint64_t v23 = v8;
    __int16 v24 = 2050;
    id v25 = self;
    __int16 v26 = 2114;
    os_activity_scope_state_s v27 = identifier;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"identifier\":%{public, location:escape_only}@}", buf, 0x3Au);
  }
  [(CLDispatchSilo *)self->_silo assertInside];
  [(CLConditionLedger *)self->_conditionLedger removeRecordFromMonitoringWithIdentifier:identifier];
  if ([(CLMonitor *)self identityToken])
  {
    if (self->_locationdConnection)
    {
      os_activity_scope_state_s v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(v9, "setObject:forKeyedSubscript:", -[CLMonitor identityToken](self, "identityToken"), @"kCLConnectionMessageClientKeyForIdentityValidation");
      [v9 setObject:identifier forKeyedSubscript:@"kCLConnectionMessageMonitorIdentifierKey"];
      objc_msgSend(v9, "addEntriesFromDictionary:", -[CLMonitor getMonitorConfiguration](self, "getMonitorConfiguration"));
      objc_super v10 = (std::__shared_weak_count *)operator new(0x70uLL);
      v10->__shared_owners_ = 0;
      v10->__shared_weak_owners_ = 0;
      v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
      sub_1906D5C70(buf, "Monitor/kCLConnectionMessageMonitorRemove");
      MEMORY[0x192FCE840](&v10[1], buf, v9);
      if (SBYTE3(v21) < 0) {
        operator delete(*(void **)buf);
      }
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
      }
      int v11 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v18 = 2082;
        uint64_t v19 = "";
        __int16 v20 = 2114;
        uint32_t v21 = identifier;
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor remove record with identifier from monitoring\", \"identifier\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      CLConnection::sendMessage();
      if (v10) {
        sub_1906BFE48(v10);
      }
      sub_1906BFE48(v10);
      goto LABEL_25;
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NSString *)identifier UTF8String];
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2082;
      uint32_t v21 = (NSString *)v15;
      __int16 v14 = "{\"msg%{public}.0s\":\"#monitor No valid connection to locationd to remove from monitoring\", \"identifier\""
            ":%{public, location:escape_only}s}";
      goto LABEL_24;
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(NSString *)identifier UTF8String];
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2082;
      uint32_t v21 = (NSString *)v13;
      __int16 v14 = "{\"msg%{public}.0s\":\"#monitor Client is not authorized to remove from monitor just yet.\", \"identifier\":"
            "%{public, location:escape_only}s}";
LABEL_24:
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x1Cu);
    }
  }
LABEL_25:
  os_activity_scope_leave(&state);
}

- (void)_removeConditionFromMonitoringWithIdentifier:(id)a3
{
  objc_initWeak(&location, self);
  v5 = [(CLDispatchSilo *)self->_silo queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190807A90;
  block[3] = &unk_1E5698400;
  objc_copyWeak(&v7, &location);
  block[4] = a3;
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)updateEvent:(id)a3 forIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v8 = _os_activity_create(&dword_1906B8000, "CL: CLMonitor #monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
  }
  os_activity_scope_state_s v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290306;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v18 = 2082;
    uint64_t v19 = "";
    __int16 v20 = 2082;
    uint32_t v21 = "activity";
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2050;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = a4;
    __int16 v28 = 2114;
    id v29 = a3;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"identifier\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}@}", buf, 0x44u);
  }
  [(CLConditionLedger *)self->_conditionLedger updateEvent:a3 forIdentifier:a4];
  if ([(CLMonitor *)self identityToken])
  {
    if (self->_locationdConnection)
    {
      int v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", -[CLMonitor identityToken](self, "identityToken"), @"kCLConnectionMessageClientKeyForIdentityValidation");
      [v11 setObject:a3 forKeyedSubscript:@"kCLConnectionMessageMonitorEventKey"];
      objc_msgSend(v11, "addEntriesFromDictionary:", -[CLMonitor getMonitorConfiguration](self, "getMonitorConfiguration"));
      __int16 v12 = (std::__shared_weak_count *)operator new(0x70uLL);
      v12->__shared_owners_ = 0;
      v12->__shared_weak_owners_ = 0;
      v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
      sub_1906D5C70(buf, "Monitor/kCLConnectionMessageMonitorUpdateEvent");
      MEMORY[0x192FCE840](&v12[1], buf, v11);
      if (SBYTE3(v21) < 0) {
        operator delete(*(void **)buf);
      }
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
      }
      v13 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v18 = 2082;
        uint64_t v19 = "";
        __int16 v20 = 2114;
        uint32_t v21 = (const char *)a4;
        __int16 v22 = 2113;
        id v23 = a3;
        _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor sync updated event to daemon\", \"identifier\":%{public, location:escape_only}@, \"event\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      CLConnection::sendMessage();
      if (v12) {
        sub_1906BFE48(v12);
      }
      sub_1906BFE48(v12);
      goto LABEL_25;
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    __int16 v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2114;
      uint32_t v21 = (const char *)a4;
      __int16 v22 = 2113;
      id v23 = a3;
      id v15 = "{\"msg%{public}.0s\":\"#monitor No valid connection to locationd to update event\", \"identifier\":%{public,"
            " location:escape_only}@, \"event\":%{private, location:escape_only}@}";
      goto LABEL_24;
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    __int16 v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2114;
      uint32_t v21 = (const char *)a4;
      __int16 v22 = 2113;
      id v23 = a3;
      id v15 = "{\"msg%{public}.0s\":\"#monitor Client is not authorized just yet.\", \"identifier\":%{public, location:esca"
            "pe_only}@, \"event\":%{private, location:escape_only}@}";
LABEL_24:
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x26u);
    }
  }
LABEL_25:
  os_activity_scope_leave(&state);
}

- (void)updateEventReceivedFromDaemon:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "lastEvent"), "identifier");
  v6 = [(CLMonitor *)self monitoringRecordForIdentifier:v5];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
  }
  id v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 68289539;
    v13[1] = 0;
    __int16 v14 = 2082;
    id v15 = "";
    __int16 v16 = 2113;
    id v17 = a3;
    __int16 v18 = 2113;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor updatingEventReceivedFromDaemon\", \"newRecordReceivedFromDaemon\":%{private, location:escape_only}@, \"existingRecord\":%{private, location:escape_only}@}", (uint8_t *)v13, 0x26u);
  }
  if (-[NSArray containsObject:](-[CLMonitor monitoredIdentifiers](self, "monitoredIdentifiers"), "containsObject:", v5)&& objc_msgSend((id)objc_msgSend(a3, "condition"), "isEqual:", -[CLMonitoringRecord condition](v6, "condition")))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "lastEvent"), "state"))
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "lastEvent"), "state");
      BOOL v9 = v8 != [(CLMonitoringEvent *)[(CLMonitoringRecord *)v6 lastEvent] state];
    }
    else
    {
      BOOL v9 = 0;
    }
    int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastEvent"), "refinement"), "isEqual:", -[CLMonitoringEvent refinement](-[CLMonitoringRecord lastEvent](v6, "lastEvent"), "refinement"));
    if (v9 || !v10) {
      int v11 = (CLMonitoringEvent *)[a3 lastEvent];
    }
    else {
      int v11 = -[CLMonitoringEvent initWithIdentifier:refinement:state:date:diagnostics:]([CLMonitoringEvent alloc], "initWithIdentifier:refinement:state:date:diagnostics:", v5, -[CLMonitoringEvent refinement](-[CLMonitoringRecord lastEvent](v6, "lastEvent"), "refinement"), -[CLMonitoringEvent state](-[CLMonitoringRecord lastEvent](v6, "lastEvent"), "state"), -[CLMonitoringEvent date](-[CLMonitoringRecord lastEvent](v6, "lastEvent"), "date"), objc_msgSend((id)objc_msgSend(a3, "lastEvent"), "diagnosticMask"));
    }
    __int16 v12 = v11;
    (*((void (**)(void))self->_eventHandler + 2))();
    [(CLMonitor *)self updateEvent:v12 forIdentifier:v5];
  }
  else
  {
    [(CLMonitor *)self removeConditionFromMonitoringWithIdentifier:v5];
  }
}

- (CLMonitoringRecord)monitoringRecordForIdentifier:(NSString *)identifier
{
  [(CLDispatchSilo *)self->_silo assertInside];
  conditionLedger = self->_conditionLedger;

  return (CLMonitoringRecord *)[(CLConditionLedger *)conditionLedger monitoringRecordForIdentifier:identifier];
}

- (void)manageConnection
{
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLMonitor *)self identityToken])
  {
    [(CLMonitor *)self createConnection];
  }
  else
  {
    [(CLMonitor *)self destroyConnection];
  }
}

- (void)createConnection
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if (!self->_locationdConnection)
  {
    if ([(CLMonitor *)self identityToken]) {
      operator new();
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    v3 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v5 = 2082;
      v6 = "";
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Client is not authorized just yet to create connection\"}", buf, 0x12u);
    }
  }
}

- (void)destroyConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  locationdConnection = (CLConnection *)self->_locationdConnection;
  if (locationdConnection)
  {
    self->_locationdConnection = 0;
    CLConnection::deferredDelete(locationdConnection);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    v4 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 68289282;
      v5[1] = 0;
      __int16 v6 = 2082;
      uint64_t v7 = "";
      __int16 v8 = 2050;
      BOOL v9 = locationdConnection;
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor destroying connection\", \"connection\":\"%{public}p\"}", (uint8_t *)v5, 0x1Cu);
    }
  }
}

- (void)handleMessageMonitor:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  __int16 v5 = (void *)CLConnectionMessage::name(*(CLConnectionMessage **)a3.var0);
  int v6 = *((char *)v5 + 23);
  if (v6 < 0)
  {
    if (v5[1] != 46)
    {
LABEL_7:
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
      }
      uint64_t v7 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        uint64_t v8 = CLConnectionMessage::name(*var0);
        uint64_t v9 = *(char *)(v8 + 23) >= 0 ? v8 : *(void *)v8;
        *(_DWORD *)buf = 68289282;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2082;
        uint64_t v20 = v9;
        _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unsupported message received\", \"message\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
        }
      }
      uint64_t v10 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        uint64_t v11 = CLConnectionMessage::name(*var0);
        if (*(char *)(v11 + 23) >= 0) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = *(void *)v11;
        }
        *(_DWORD *)buf = 68289282;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2082;
        uint64_t v20 = v12;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unsupported message received", "{\"msg%{public}.0s\":\"#monitor unsupported message received\", \"message\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      return;
    }
    __int16 v5 = (void *)*v5;
  }
  else if (v6 != 46)
  {
    goto LABEL_7;
  }
  if (memcmp(v5, "Monitor/kCLConnectionMessageMonitorUpdateEvent", 0x2EuLL)) {
    goto LABEL_7;
  }
  v13 = *var0;
  __int16 v14 = (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  objc_msgSend((id)CLConnectionMessage::getDictionaryOfClasses(v13, v14), "objectForKeyedSubscript:", @"kCLConnectionMessageMonitorMonitoringRecordKey");

  MEMORY[0x1F4181798](self, sel_updateEventReceivedFromDaemon_);
}

- (id)getMonitorConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[CLConditionLedger allMonitoringRecordsByIdentifier](self->_conditionLedger, "allMonitoringRecordsByIdentifier"), @"kCLConnectionMessageMonitorLedger");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[CLMonitor identityToken](self, "identityToken"), @"kCLConnectionMessageMonitorIdentityTokenKey");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[CLMonitor name](self, "name"), @"kCLConnectionMessageMonitorNameKey");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[CLLocationManager processName](-[CLMonitor manager](self, "manager"), "processName"), @"kCLConnectionMessageMonitorProcessNameKey");

  return v3;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  silo = self->_silo;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_190808CF0;
  v5[3] = &unk_1E5696FA8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  [(CLDispatchSilo *)silo async:v5];
}

+ (void)_requestMonitorWithConfiguration:(id)a3 locationManager:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  if ((sub_190717060((void *)[a3 name]) & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLMonitor.mm", 507, @"Monitor name is not valid");
  }
  if (!a5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLMonitor.mm", 510, @"Monitor completion handler is nil");
  }
  if (![a3 eventHandler]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLMonitor.mm", 513, @"Monitoring event handler is nil");
  }
  if (+[CLMonitor isMonitorNameInUse:](CLMonitor, "isMonitorNameInUse:", [a3 name])) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLMonitor.mm", 516, @"Monitor named %@ is already in use", objc_msgSend(a3, "name"));
  }
  if (!a4)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
    }
    uint64_t v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      int v16 = "";
      __int16 v17 = 2082;
      __int16 v18 = "assert";
      __int16 v19 = 2081;
      uint64_t v20 = "locationManager";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLLocationManager must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
      }
    }
    uint64_t v11 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      int v16 = "";
      __int16 v17 = 2082;
      __int16 v18 = "assert";
      __int16 v19 = 2081;
      uint64_t v20 = "locationManager";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLLocationManager must not be nil", "{\"msg%{public}.0s\":\"CLLocationManager must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002CC0);
      }
    }
    uint64_t v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      int v16 = "";
      __int16 v17 = 2082;
      __int16 v18 = "assert";
      __int16 v19 = 2081;
      uint64_t v20 = "locationManager";
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLLocationManager must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  if (([a4 isMasquerading] & 1) == 0 && !sub_190717A7C()) {
    NSLog(&cfstr_ErrorClmonitor.isa);
  }
  [a3 setManager:a4];
  [a3 setVendingHandler:a5];
  +[CLMonitor addMonitorName:](CLMonitor, "addMonitorName:", [a3 name]);
  [a4 addIdentifiableClient:a3];

  objc_sync_exit(a1);
}

+ (void)requestWithConfiguration:(id)a3 locationManager:(id)a4 completion:(id)a5
{
}

+ (void)requestMonitorWithConfiguration:(CLMonitorConfiguration *)config completion:(void *)completionHandler
{
  +[CLLocationManager weakSharedInstance];

  MEMORY[0x1F4181798](CLMonitor, sel__requestMonitorWithConfiguration_locationManager_completion_);
}

+ (id)sharedMonitorSet
{
  if (qword_1EB272578 != -1) {
    dispatch_once(&qword_1EB272578, &unk_1EE005E00);
  }
  return (id)qword_1EB272570;
}

+ (BOOL)isMonitorNameInUse:(id)a3
{
  LOBYTE(a3) = objc_msgSend(+[CLMonitor sharedMonitorSet](CLMonitor, "sharedMonitorSet"), "containsObject:", a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E92A0188);
  return (char)a3;
}

+ (void)addMonitorName:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E92A0188);
  objc_msgSend(+[CLMonitor sharedMonitorSet](CLMonitor, "sharedMonitorSet"), "addObject:", a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E92A0188);
}

+ (void)removeMonitorName:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E92A0188);
  objc_msgSend(+[CLMonitor sharedMonitorSet](CLMonitor, "sharedMonitorSet"), "removeObject:", a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E92A0188);
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

- (NSString)monitorName
{
  return self->_monitorName;
}

- (void).cxx_destruct
{
}

@end