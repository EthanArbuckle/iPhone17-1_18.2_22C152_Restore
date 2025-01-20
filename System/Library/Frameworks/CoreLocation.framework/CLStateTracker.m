@interface CLStateTracker
+ (const)trackerStateTypeName;
+ (unint64_t)trackerStateSize;
- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5;
- (CLStateTracker)initWithQueue:(id)a3;
- (void)dealloc;
- (void)identifier;
@end

@implementation CLStateTracker

- (CLStateTracker)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLStateTracker;
  v3 = [(CLStateTracker *)&v7 init];
  if (v3)
  {
    objc_initWeak(&location, v3);
    objc_copyWeak(&v5, &location);
    v3->_handle = os_state_add_handler();
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)CLStateTracker;
  [(CLStateTracker *)&v3 dealloc];
}

- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE005F00);
  }
  objc_super v7 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
  {
    int v12 = 68289538;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2082;
    ClassName = object_getClassName(self);
    __int16 v18 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v12, 0x26u);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005F00);
    }
  }
  v8 = qword_1EB2713D0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
  {
    v9 = object_getClassName(self);
    v10 = sel_getName(a2);
    int v12 = 68289538;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2082;
    ClassName = v9;
    __int16 v18 = 2082;
    Name = v10;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Subclass should have overriden this", "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v12, 0x26u);
  }
  return 0;
}

+ (unint64_t)trackerStateSize
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE005F00);
  }
  v4 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
  {
    int v9 = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    ClassName = object_getClassName(a1);
    __int16 v15 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005F00);
    }
  }
  id v5 = qword_1EB2713D0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
  {
    v6 = object_getClassName(a1);
    objc_super v7 = sel_getName(a2);
    int v9 = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    ClassName = v6;
    __int16 v15 = 2082;
    Name = v7;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Subclass should have overriden this", "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
  }
  return 0;
}

+ (const)trackerStateTypeName
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE005F00);
  }
  v4 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
  {
    int v9 = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    ClassName = object_getClassName(a1);
    __int16 v15 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005F00);
    }
  }
  id v5 = qword_1EB2713D0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
  {
    v6 = object_getClassName(a1);
    objc_super v7 = sel_getName(a2);
    int v9 = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    ClassName = v6;
    __int16 v15 = 2082;
    Name = v7;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Subclass should have overriden this", "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
  }
  return "UnknownStateTracker";
}

- (void)identifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE005F00);
  }
  v4 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
  {
    int v9 = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    ClassName = object_getClassName(self);
    __int16 v15 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005F00);
    }
  }
  id v5 = qword_1EB2713D0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
  {
    v6 = object_getClassName(self);
    objc_super v7 = sel_getName(a2);
    int v9 = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    ClassName = v6;
    __int16 v15 = 2082;
    Name = v7;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Subclass should have overriden this", "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
  }
  return self;
}

@end