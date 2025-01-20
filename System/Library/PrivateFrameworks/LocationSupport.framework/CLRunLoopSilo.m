@interface CLRunLoopSilo
- (BOOL)inPermissiveMode;
- (BOOL)isSuspended;
- (CLRunLoopSilo)initWithCurrentRunLoopAndIdentifier:(id)a3;
- (CLRunLoopSilo)initWithCurrentRunLoopAndIdentifier:(id)a3 bePermissive:(BOOL)a4;
- (CLRunLoopSilo)initWithIdentifier:(id)a3;
- (CLRunLoopSilo)initWithUnderlyingRunLoop:(__CFRunLoop *)a3;
- (double)currentLatchedAbsoluteTimestamp;
- (id)debugDescription;
- (id)getTimeCoercibleVariantInstance;
- (id)newTimer;
- (id)runloop;
- (void)afterInterval:(double)a3 async:(id)a4;
- (void)assertInside;
- (void)assertOutside;
- (void)async:(id)a3;
- (void)heartBeat:(id)a3;
- (void)resume;
- (void)suspend;
- (void)sync:(id)a3;
@end

@implementation CLRunLoopSilo

- (void)async:(id)a3
{
  id v4 = a3;
  v5 = [(CLRunLoopSiloThread *)self->_siloThread underlyingRunLoop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A454AAA4;
  v7[3] = &unk_1E5B3E948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (CLRunLoopSilo)initWithCurrentRunLoopAndIdentifier:(id)a3 bePermissive:(BOOL)a4
{
  result = [(CLRunLoopSilo *)self initWithCurrentRunLoopAndIdentifier:a3];
  if (result) {
    result->_useCLPermissiveTimer = a4;
  }
  return result;
}

- (CLRunLoopSilo)initWithCurrentRunLoopAndIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLRunLoopSilo;
  v3 = [(CLSilo *)&v8 initWithIdentifier:a3];
  if (v3
    && (id v4 = [[CLRunLoopSiloThread alloc] initWithCurrentThread], siloThread = v3->_siloThread, v3->_siloThread = v4, siloThread, !v3->_siloThread))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (CLRunLoopSilo)initWithIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLRunLoopSilo;
  v5 = [(CLSilo *)&v20 initWithIdentifier:v4];
  if (v5)
  {
    id v6 = +[CLSilo globalConfiguration];
    v7 = [v6 objectForKeyedSubscript:@"NameToCohortMap"];

    objc_super v8 = [v7 objectForKeyedSubscript:v4];
    if (!v8)
    {
      objc_super v8 = [v7 objectForKeyedSubscript:@"default"];
      if (!v8)
      {
        v11 = objc_alloc_init(CLRunLoopSiloThread);
        siloThread = v5->_siloThread;
        v5->_siloThread = v11;

        goto LABEL_6;
      }
    }
    v9 = [NSString stringWithFormat:@"%@(%@)", v4, v8];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v16 = sub_1A45565B0;
    v17 = &unk_1E5B3E920;
    v18 = v5;
    objc_super v8 = v8;
    v19 = v8;
    if (qword_1EB30D010 != -1) {
      goto LABEL_17;
    }
    while (1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB30D000);
      v16((uint64_t)v15, (void *)qword_1EB30D008);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB30D000);

      id v4 = v9;
LABEL_6:
      if (v5->_siloThread) {
        break;
      }
      v13 = sub_1A4555E7C();
      objc_super v8 = &off_1A4566000;
      v9 = &unk_1A45670B7;
      v7 = "_siloThread";
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        int v22 = 0;
        __int16 v23 = 2082;
        v24 = &unk_1A45670B7;
        __int16 v25 = 2082;
        v26 = "assert";
        __int16 v27 = 2081;
        v28 = "_siloThread";
        _os_log_impl(&dword_1A4540000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSiloThread failed to init\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      v14 = sub_1A4555E7C();
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 68289539;
        int v22 = 0;
        __int16 v23 = 2082;
        v24 = &unk_1A45670B7;
        __int16 v25 = 2082;
        v26 = "assert";
        __int16 v27 = 2081;
        v28 = "_siloThread";
        _os_signpost_emit_with_name_impl(&dword_1A4540000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSiloThread failed to init", "{\"msg%{public}.0s\":\"CLRunLoopSiloThread failed to init\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      sub_1A4555E7C();
      v5 = (CLRunLoopSilo *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        int v22 = 0;
        __int16 v23 = 2082;
        v24 = &unk_1A45670B7;
        __int16 v25 = 2082;
        v26 = "assert";
        __int16 v27 = 2081;
        v28 = "_siloThread";
        _os_log_impl(&dword_1A4540000, &v5->super.super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSiloThread failed to init\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      abort_report_np();
LABEL_17:
      dispatch_once(&qword_1EB30D010, &unk_1EF7F50A0);
    }
  }
  return v5;
}

- (CLRunLoopSilo)initWithUnderlyingRunLoop:(__CFRunLoop *)a3
{
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"RunLoop: %p", a3);
  if (CFRunLoopGetCurrent() == a3)
  {
    id v6 = [(CLRunLoopSilo *)self initWithCurrentRunLoopAndIdentifier:v5];
LABEL_6:
    id v6 = v6;
    v9 = v6;
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)CLRunLoopSilo;
  id v6 = [(CLSilo *)&v11 initWithIdentifier:v5];
  if (!v6) {
    goto LABEL_6;
  }
  v7 = [[CLRunLoopSiloThread alloc] initWithRunLoop:a3];
  siloThread = v6->_siloThread;
  v6->_siloThread = v7;

  if (v6->_siloThread) {
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)runloop
{
  return [(CLRunLoopSiloThread *)self->_siloThread underlyingRunLoop];
}

- (id)getTimeCoercibleVariantInstance
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support time coercion. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
    }
    v3 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSilo doesn't support time coercion. See rdar://problem/45973444", "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support time coercion. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
    }
    id v4 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support time coercion. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
  }
}

- (BOOL)inPermissiveMode
{
  return self->_useCLPermissiveTimer;
}

- (void)assertInside
{
  id v3 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  if (v3 ! = [(CLRunLoopSiloThread *)self->_siloThread underlyingRunLoop]; {
    __assert_rtn("-[CLRunLoopSilo assertInside]", "CLRunLoopSilo.m", 285, "[NSRunLoop currentRunLoop] == _siloThread.underlyingRunLoop");
  }
}

- (void)assertOutside
{
  id v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  id v3 = [(CLRunLoopSiloThread *)self->_siloThread underlyingRunLoop];
  if (v4 == v3) {
    __assert_rtn("-[CLRunLoopSilo assertOutside]", "CLRunLoopSilo.m", 290, "[NSRunLoop currentRunLoop] != _siloThread.underlyingRunLoop");
  }
}

- (void)suspend
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
    }
    id v3 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSilo doesn't support suspend. See rdar://problem/45973444", "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
    }
    id v4 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
  }
}

- (void)resume
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support resume. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
    }
    id v3 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSilo doesn't support resume. See rdar://problem/45973444", "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support resume. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
    }
    id v4 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support resume. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
  }
}

- (BOOL)isSuspended
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend or resume yet. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
    }
    id v3 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSilo doesn't support suspend or resume yet. See rdar://problem/45973444", "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend or resume yet. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
    }
    id v4 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      objc_super v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend or resume yet. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
  }
}

- (double)currentLatchedAbsoluteTimestamp
{
  return self->super._currentLatchedAbsoluteTimestamp;
}

- (id)newTimer
{
  id v3 = [[CLRunLoopTimerScheduler alloc] initWithRunLoopSilo:self];
  if (self->_useCLPermissiveTimer) {
    id v4 = off_1E5B3E5D8;
  }
  else {
    id v4 = &off_1E5B3E600;
  }
  v5 = (void *)[objc_alloc(*v4) initInSilo:self withScheduler:v3];

  return v5;
}

- (void)sync:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = 0;
  [(CLRunLoopSiloThread *)self->_siloThread threadId];
  pthread_dependency_init_np();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A4557278;
  v6[3] = &unk_1E5B3E970;
  id v7 = v4;
  objc_super v8 = v9;
  id v5 = v4;
  [(CLRunLoopSilo *)self async:v6];
  pthread_dependency_wait_np();
}

- (void)afterInterval:(double)a3 async:(id)a4
{
  siloThread = self->_siloThread;
  id v6 = a4;
  id v8 = [(CLRunLoopSiloThread *)siloThread underlyingRunLoop];
  id v7 = _Block_copy(v6);

  [v8 performSelector:sel_async_ withObject:v7 afterDelay:a3];
}

- (id)debugDescription
{
  v2 = NSString;
  identifier = self->super._identifier;
  id v4 = [(CLRunLoopSiloThread *)self->_siloThread underlyingRunLoop];
  id v5 = [v2 stringWithFormat:@"CLRunLoopSilo: %@ - %@", identifier, v4];

  return v5;
}

- (void)heartBeat:(id)a3
{
  id v4 = a3;
  id v5 = [(CLRunLoopSiloThread *)self->_siloThread underlyingRunLoop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A45574A0;
  v7[3] = &unk_1E5B3E998;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void).cxx_destruct
{
}

@end