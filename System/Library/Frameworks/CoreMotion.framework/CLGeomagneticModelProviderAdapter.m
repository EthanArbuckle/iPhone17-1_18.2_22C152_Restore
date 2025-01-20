@interface CLGeomagneticModelProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLGeomagneticModelProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchGeomagneticModelData:(id)a3;
@end

@implementation CLGeomagneticModelProviderAdapter

+ (BOOL)isSupported
{
  if (qword_1EB3BF548 != -1) {
    dispatch_once(&qword_1EB3BF548, &unk_1EDFD2F20);
  }
  return byte_1EB3BF540;
}

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

+ (id)getSilo
{
  if (qword_1EB3BF558 != -1) {
    dispatch_once(&qword_1EB3BF558, &unk_1EDFD2200);
  }
  return (id)qword_1EB3BF550;
}

- (CLGeomagneticModelProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLGeomagneticModelProviderAdapter;
  return [(CLIntersiloService *)&v3 initWithInboundProtocol:&unk_1EE00E7B0 outboundProtocol:&unk_1EE01AAE8];
}

- (void)beginService
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_universe(self, a2, v2);
  uint64_t v5 = sub_19053AB30(v4);
  objc_msgSend_setAdaptedNotifier_(self, v6, v5);
  if (!objc_msgSend_notifier(self, v7, v8))
  {
    if (qword_1E929D728 != -1) {
      dispatch_once(&qword_1E929D728, &unk_1EDFC3568);
    }
    v9 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "__null != self.notifier";
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFC3568);
      }
    }
    v10 = qword_1E929D720;
    if (os_signpost_enabled((os_log_t)qword_1E929D720))
    {
      *(_DWORD *)buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "__null != self.notifier";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFC3568);
      }
    }
    v11 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      __int16 v16 = 2082;
      v17 = "assert";
      __int16 v18 = 2081;
      v19 = "__null != self.notifier";
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
}

- (void)endService
{
  objc_super v3 = *(void (**)(void))(*objc_msgSend_notifier(self, a2, v2) + 16);

  v3();
}

- (void)adaptee
{
  result = objc_msgSend_notifier(self, a2, v2);
  if (result)
  {
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1EDFC3E70, (const struct __class_type_info *)&unk_1EDFC4390, 0);
  }
  return result;
}

- (void)doAsync:(id)a3
{
  uint64_t v4 = objc_msgSend_adaptee(self, a2, (uint64_t)a3);
  uint64_t v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  uint64_t v6 = objc_msgSend_adaptee(self, a2, (uint64_t)a3);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
  v7 = (void (*)(id))*((void *)a4 + 2);

  v7(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  uint64_t v4 = objc_msgSend_adaptee(self, a2, (uint64_t)a3);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
  return 0;
}

- (void)fetchGeomagneticModelData:(id)a3
{
  uint64_t v4 = objc_msgSend_adaptee(self, a2, (uint64_t)a3);
  (*(void (**)(void *__return_ptr))(*(void *)v4 + 208))(v5);
  (*((void (**)(id, void *))a3 + 2))(a3, v5);
}

@end