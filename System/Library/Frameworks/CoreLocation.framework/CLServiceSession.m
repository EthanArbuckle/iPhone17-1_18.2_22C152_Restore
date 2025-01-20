@interface CLServiceSession
+ (id)disconnectedSessionRequiringAuthorization:(int64_t)a3;
+ (id)disconnectedSessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4;
+ (id)sessionRequiringAuthorization:(int64_t)a3;
+ (id)sessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4;
+ (id)sessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4 queue:(id)a5 handler:(id)a6;
+ (id)sessionRequiringAuthorization:(int64_t)a3 queue:(id)a4 handler:(id)a5;
+ (id)sessionWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6 handler:(id)a7;
- (CLServiceSession)initWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6 handler:(id)a7;
- (id)initDisconnectedSessionWithAuthorizationRequirement:(int64_t)a3 fullAccuracyPurposeKey:(id)a4;
- (void)dealloc;
- (void)handleDiagnosticUpdate;
- (void)invalidate;
- (void)setHandler:(id)a3;
- (void)setupSessionInternalWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6;
@end

@implementation CLServiceSession

+ (id)sessionRequiringAuthorization:(int64_t)a3
{
  v3 = [[CLServiceSession alloc] initWithLocationManager:+[CLLocationManager weakSharedInstance](CLLocationManager, "weakSharedInstance") authorizationRequirement:a3 fullAccuracyPurposeKey:0 queue:+[CLLocationManager sharedQueue] handler:0];

  return v3;
}

+ (id)disconnectedSessionRequiringAuthorization:(int64_t)a3
{
  id v3 = [[CLServiceSession alloc] initDisconnectedSessionWithAuthorizationRequirement:a3 fullAccuracyPurposeKey:0];

  return v3;
}

+ (id)sessionRequiringAuthorization:(int64_t)a3 queue:(id)a4 handler:(id)a5
{
  v5 = [[CLServiceSession alloc] initWithLocationManager:+[CLLocationManager weakSharedInstance] authorizationRequirement:a3 fullAccuracyPurposeKey:0 queue:a4 handler:a5];

  return v5;
}

+ (id)sessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4
{
  v4 = [[CLServiceSession alloc] initWithLocationManager:+[CLLocationManager weakSharedInstance](CLLocationManager, "weakSharedInstance") authorizationRequirement:a3 fullAccuracyPurposeKey:a4 queue:+[CLLocationManager sharedQueue] handler:0];

  return v4;
}

+ (id)disconnectedSessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4
{
  id v4 = [[CLServiceSession alloc] initDisconnectedSessionWithAuthorizationRequirement:a3 fullAccuracyPurposeKey:a4];

  return v4;
}

+ (id)sessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4 queue:(id)a5 handler:(id)a6
{
  v6 = [[CLServiceSession alloc] initWithLocationManager:+[CLLocationManager weakSharedInstance] authorizationRequirement:a3 fullAccuracyPurposeKey:a4 queue:a5 handler:a6];

  return v6;
}

+ (id)sessionWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6 handler:(id)a7
{
  v7 = [[CLServiceSession alloc] initWithLocationManager:a3 authorizationRequirement:a4 fullAccuracyPurposeKey:a5 queue:a6 handler:a7];

  return v7;
}

- (void)setupSessionInternalWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6
{
  id v6 = a6;
  id v9 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = +[CLLocationManager weakSharedInstance];
    if (v6) {
      goto LABEL_3;
    }
  }
  id v6 = +[CLLocationManager sharedQueue];
LABEL_3:
  switch(a4)
  {
    case 2:
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_1907E25AC;
      v17[3] = &unk_1E5697E68;
      v17[4] = self;
      v11 = +[CLServiceSessionInternal alwaysSessionWithLocationManager:v9 queue:v6 handler:v17];
      goto LABEL_11;
    case 1:
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1907E259C;
      v18[3] = &unk_1E5697E68;
      v18[4] = self;
      v11 = +[CLServiceSessionInternal whenInUseSessionWithLocationManager:v9 queue:v6 handler:v18];
      goto LABEL_11;
    case 0:
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1907E258C;
      v19[3] = &unk_1E5697E68;
      v19[4] = self;
      v11 = +[CLServiceSessionInternal passiveSessionWithLocationManager:v9 queue:v6 handler:v19];
LABEL_11:
      self->_serviceSessionInternal = v11;
      goto LABEL_12;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
  }
  v14 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
  {
    uint64_t buf = 68289282;
    __int16 v21 = 2082;
    v22 = "";
    __int16 v23 = 1026;
    int v24 = a4;
    _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Invalid AuthorizationRequirementType for CLServiceSession\", \"authorizationRequirement\":%{public}d}", (uint8_t *)&buf, 0x18u);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
    }
  }
  v15 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    uint64_t buf = 68289282;
    __int16 v21 = 2082;
    v22 = "";
    __int16 v23 = 1026;
    int v24 = a4;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Invalid AuthorizationRequirementType for CLServiceSession", "{\"msg%{public}.0s\":\"Invalid AuthorizationRequirementType for CLServiceSession\", \"authorizationRequirement\":%{public}d}", (uint8_t *)&buf, 0x18u);
  }
LABEL_12:
  if ([a5 length])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1907E25BC;
    v16[3] = &unk_1E5697E68;
    v16[4] = self;
    self->_fullAccuracySession = +[CLFullAccuracySession fullAccuracySessionWithLocationManager:v9 purposeKey:a5 queue:v6 handler:v16];
  }
  v12 = self->_serviceSessionInternal;
  v13 = self->_fullAccuracySession;
}

- (id)initDisconnectedSessionWithAuthorizationRequirement:(int64_t)a3 fullAccuracyPurposeKey:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLServiceSession;
  id v6 = [(CLServiceSession *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_aggregatedDiagnosticMask = -1;
    v6->_authorizationRequirement = a3;
    v6->_fullAccuracyPurposeKey = (NSString *)a4;
  }
  return v7;
}

- (CLServiceSession)initWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6 handler:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)CLServiceSession;
  v12 = [(CLServiceSession *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_aggregatedDiagnosticMask = -1;
    if (a7) {
      v12->_clientCallback = _Block_copy(a7);
    }
    [(CLServiceSession *)v13 setupSessionInternalWithLocationManager:a3 authorizationRequirement:a4 fullAccuracyPurposeKey:a5 queue:a6];
  }
  return v13;
}

- (void)setHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_clientCallback)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
    }
    v8 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 2050;
      v19 = self;
      __int16 v20 = 2082;
      __int16 v21 = "assert";
      __int16 v22 = 2081;
      __int16 v23 = "_clientCallback == nullptr";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#serviceSession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
      }
    }
    objc_super v9 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 2050;
      v19 = self;
      __int16 v20 = 2082;
      __int16 v21 = "assert";
      __int16 v22 = 2081;
      __int16 v23 = "_clientCallback == nullptr";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession should initially be nil", "{\"msg%{public}.0s\":\"#serviceSession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
      }
    }
    v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 2050;
      v19 = self;
      __int16 v20 = 2082;
      __int16 v21 = "assert";
      __int16 v22 = 2081;
      __int16 v23 = "_clientCallback == nullptr";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#serviceSession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
LABEL_27:
    abort_report_np();
  }
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
    }
    v11 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 2050;
      v19 = self;
      __int16 v20 = 2082;
      __int16 v21 = "assert";
      __int16 v22 = 2081;
      __int16 v23 = "handler != nullptr";
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#serviceSession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
      }
    }
    v12 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 2050;
      v19 = self;
      __int16 v20 = 2082;
      __int16 v21 = "assert";
      __int16 v22 = 2081;
      __int16 v23 = "handler != nullptr";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession can't set a nil handler", "{\"msg%{public}.0s\":\"#serviceSession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
      }
    }
    v13 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 2050;
      v19 = self;
      __int16 v20 = 2082;
      __int16 v21 = "assert";
      __int16 v22 = 2081;
      __int16 v23 = "handler != nullptr";
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#serviceSession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
    goto LABEL_27;
  }
  self->_clientCallback = _Block_copy(a3);
  id v4 = +[CLLocationManager weakSharedInstance];
  int64_t authorizationRequirement = self->_authorizationRequirement;
  fullAccuracyPurposeKey = self->_fullAccuracyPurposeKey;
  id v7 = +[CLLocationManager sharedQueue];

  [(CLServiceSession *)self setupSessionInternalWithLocationManager:v4 authorizationRequirement:authorizationRequirement fullAccuracyPurposeKey:fullAccuracyPurposeKey queue:v7];
}

- (void)handleDiagnosticUpdate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->_fullAccuracySessionDiagnosticMask | self->_serviceSessionDiagnosticMask;
  if (self->_aggregatedDiagnosticMask == v3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
    }
    uint64_t v4 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t aggregatedDiagnosticMask = self->_aggregatedDiagnosticMask;
      *(_DWORD *)uint64_t buf = 68289538;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = "";
      __int16 v15 = 2050;
      __int16 v16 = self;
      __int16 v17 = 1026;
      int v18 = aggregatedDiagnosticMask;
      id v6 = "{\"msg%{public}.0s\":\"#serviceSession skip diagnosticUpdate delivery - new and old aggregatedMask are same\""
           ", \"self\":\"%{public}p\", \"aggregatedDiagnosticMask\":%{public}d}";
      id v7 = v4;
      uint32_t v8 = 34;
LABEL_14:
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    self->_unint64_t aggregatedDiagnosticMask = v3;
    if (self->_clientCallback)
    {
      v10 = [[CLServiceSessionDiagnostic alloc] initWithDiagnostics:v3];
      (*((void (**)(void))self->_clientCallback + 2))();
    }
    else
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005CA0);
      }
      uint64_t v9 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v12 = 0;
        __int16 v13 = 2082;
        v14 = "";
        __int16 v15 = 2050;
        __int16 v16 = self;
        id v6 = "{\"msg%{public}.0s\":\"#serviceSession skip diagnosticUpdate delivery - no callback handler\", \"self\":\"%{public}p\"}";
        id v7 = v9;
        uint32_t v8 = 28;
        goto LABEL_14;
      }
    }
  }
}

- (void)invalidate
{
  [(CLServiceSessionInternal *)self->_serviceSessionInternal invalidate];
  fullAccuracySession = self->_fullAccuracySession;

  [(CLFullAccuracySession *)fullAccuracySession invalidate];
}

- (void)dealloc
{
  _Block_release(self->_clientCallback);
  self->_clientCallback = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLServiceSession;
  [(CLServiceSession *)&v3 dealloc];
}

@end