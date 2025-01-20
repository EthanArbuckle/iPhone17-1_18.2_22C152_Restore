@interface CLNotifierClientAdapter
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLNotifierClientAdapter)init;
- (CLNotifierClientAdapter)initWithClient:(CLNotifierClientBase *)a3;
- (NSString)debugDescription;
- (void)invalidate;
- (void)onNotification:(int)a3 withData:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLNotifierClientAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  uint64_t v5 = a4 + 1;
  if (a4 + 1 < objc_msgSend_count(a3, a2, (uint64_t)a3))
  {
    v7 = objc_msgSend_objectAtIndexedSubscript_(a3, v6, v5);
    objc_msgSend_becameFatallyBlocked_index_(v7, v8, (uint64_t)a3, v5);
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

- (CLNotifierClientAdapter)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D728 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1902AF000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D20);
      }
    }
    v3 = qword_1E929D720;
    if (os_signpost_enabled((os_log_t)qword_1E929D720))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D20);
      }
    }
    v4 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E929D728, &unk_1EDFD2D20);
  }
}

- (CLNotifierClientAdapter)initWithClient:(CLNotifierClientBase *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLNotifierClientAdapter;
  v4 = [(CLNotifierClientAdapter *)&v8 init];
  int v6 = v4;
  if (v4) {
    v4->_client = a3;
  }
  objc_msgSend_setValid_(v4, v5, 1);
  return v6;
}

- (void)invalidate
{
  self->_client = 0;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  client = self->_client;
  if (!client)
  {
    if (qword_1E929D728 != -1) {
      dispatch_once(&qword_1E929D728, &unk_1EDFD2D20);
    }
    int v6 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "_client";
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D20);
      }
    }
    __int16 v7 = qword_1E929D720;
    if (os_signpost_enabled((os_log_t)qword_1E929D720))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "_client";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D20);
      }
    }
    objc_super v8 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "_client";
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  uint64_t v5 = (void (*)(void))*((void *)client->var0 + 2);

  v5();
}

- (NSString)debugDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLNotifierClientAdapter;
  v4 = [(CLNotifierClientAdapter *)&v7 debugDescription];
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v5, @"%@\nCLNotifierClientBase: %p", v4, self->_client);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end