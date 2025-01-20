@interface CLAssertion
- (CLAssertion)initWithRegistrationMessageName:(const char *)a3 messageDictionary:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CLAssertion

- (CLAssertion)initWithRegistrationMessageName:(const char *)a3 messageDictionary:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v8 = _os_activity_create(&dword_1906B8000, "CL: CLAssertion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060E0);
  }
  v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    int v19 = 0;
    __int16 v20 = 2082;
    v21 = "";
    __int16 v22 = 2082;
    v23 = "activity";
    __int16 v24 = 2114;
    v25 = v10;
    __int16 v26 = 2050;
    v27 = self;
    __int16 v28 = 2082;
    v29 = a3;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAssertion\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  v16.receiver = self;
  v16.super_class = (Class)CLAssertion;
  v11 = [(CLAssertion *)&v16 init];
  if (v11)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060E0);
    }
    v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 2114;
      v23 = (const char *)a4;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Requesting new assertion\", \"messageDictionary\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v13 = dispatch_queue_create("CLAssertionInternalQueue", 0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1906DD8A8;
    v15[3] = &unk_1E56988B8;
    v15[4] = v11;
    v15[5] = v13;
    v15[6] = a4;
    v15[7] = a3;
    dispatch_sync(v13, v15);
    dispatch_release(v13);
  }
  os_activity_scope_leave(&state);
  return v11;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLAssertion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060E0);
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
    int v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAssertion\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  var0 = self->_internal->var0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190868854;
  block[3] = &unk_1E5696BF0;
  block[4] = self;
  dispatch_sync(var0, block);
  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLAssertion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060E0);
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
    int v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAssertion\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  if (internal)
  {
    sub_190868860((uint64_t)self->_internal);
    dispatch_release((dispatch_object_t)internal->var0);
    MEMORY[0x192FCEAD0](internal, 0xA0C40BD48D6D6);
  }
  v8.receiver = self;
  v8.super_class = (Class)CLAssertion;
  [(CLAssertion *)&v8 dealloc];
  os_activity_scope_leave(&state);
}

@end