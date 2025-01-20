@interface CLGyroCalibrationDatabaseAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetBiasFit:(id *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetGyroStatsWithBias:(id *)a3 slope:(id *)a4 l2Error:(id *)a5 isDynamic:(BOOL)a6 deltaBias:(id *)a7 deltaSlope:(id *)a8 deltaError:(id *)a9 isDeltaDynamic:(BOOL)a10;
- (BOOL)syncgetInsertWithBias:(id *)a3 variance:(id *)a4 temperature:(float)a5 timestamp:(double)a6;
- (BOOL)syncgetSupportsMiniCalibration;
- (BOOL)syncgetWipeDatabase;
- (CLGyroCalibrationDatabaseAdapter)init;
- (double)syncgetLastMiniCalibration;
- (int)syncgetMaxDynamicTemperature;
- (int)syncgetNonFactoryRoundCount;
- (int)syncgetNumTemperatures;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)dumpDatabase:(id)a3 onCompletion:(id)a4;
- (void)endService;
- (void)getBiasFitWithReply:(id)a3;
- (void)startFactoryGYTT;
@end

@implementation CLGyroCalibrationDatabaseAdapter

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
  if (qword_1EB3BF6D8 != -1) {
    dispatch_once(&qword_1EB3BF6D8, &unk_1EDFD2800);
  }
  return (id)qword_1EB3BF6D0;
}

- (CLGyroCalibrationDatabaseAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLGyroCalibrationDatabaseAdapter;
  return [(CLIntersiloService *)&v3 initWithInboundProtocol:&unk_1EE012160 outboundProtocol:&unk_1EE01ABA8];
}

- (void)beginService
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_universe(self, a2, v2);
  uint64_t v5 = sub_1904B71C0(v4);
  objc_msgSend_setAdaptedNotifier_(self, v6, v5);
  if (!objc_msgSend_notifier(self, v7, v8))
  {
    if (qword_1E929D728 != -1) {
      dispatch_once(&qword_1E929D728, &unk_1EDFC3708);
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
        dispatch_once(&qword_1E929D728, &unk_1EDFC3708);
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
        dispatch_once(&qword_1E929D728, &unk_1EDFC3708);
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
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1EDFC3E70, (const struct __class_type_info *)&unk_1EDFC4378, 0);
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

+ (BOOL)isSupported
{
  if (qword_1EB3BF6E0 != -1) {
    dispatch_once(&qword_1EB3BF6E0, &unk_1EDFC35E8);
  }
  return byte_1EB3BF6C8;
}

- (BOOL)syncgetGyroStatsWithBias:(id *)a3 slope:(id *)a4 l2Error:(id *)a5 isDynamic:(BOOL)a6 deltaBias:(id *)a7 deltaSlope:(id *)a8 deltaError:(id *)a9 isDeltaDynamic:(BOOL)a10
{
  BOOL v10 = a6;
  uint64_t v15 = objc_msgSend_adaptee(self, a2, (uint64_t)a3);
  int v16 = (*(uint64_t (**)(uint64_t, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, BOOL))(*(void *)v15 + 256))(v15, a3, a4, a5, v10);
  if (v16)
  {
    v19 = *(uint64_t (**)(void))(*objc_msgSend_adaptee(self, v17, v18) + 256);
    LOBYTE(v16) = v19();
  }
  return v16;
}

- (int)syncgetMaxDynamicTemperature
{
  objc_super v3 = *(uint64_t (**)(void))(*objc_msgSend_adaptee(self, a2, v2) + 264);

  return v3();
}

- (void)startFactoryGYTT
{
  objc_super v3 = *(void (**)(void))(*objc_msgSend_adaptee(self, a2, v2) + 248);

  v3();
}

- (BOOL)syncgetBiasFit:(id *)a3
{
  objc_super v3 = *(uint64_t (**)(void))(*objc_msgSend_adaptee(self, a2, (uint64_t)a3) + 216);

  return v3();
}

- (void)getBiasFitWithReply:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(__src, 0, sizeof(__src));
  uint64_t v4 = objc_msgSend_adaptee(self, a2, (uint64_t)a3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, _OWORD *))(*(void *)v4 + 216))(v4, __src);
  memcpy(v6, __src, sizeof(v6));
  (*((void (**)(id, uint64_t, unsigned char *))a3 + 2))(a3, v5, v6);
}

- (int)syncgetNonFactoryRoundCount
{
  objc_super v3 = *(uint64_t (**)(void))(*objc_msgSend_adaptee(self, a2, v2) + 296);

  return v3();
}

- (BOOL)syncgetSupportsMiniCalibration
{
  objc_super v3 = *(uint64_t (**)(void))(*objc_msgSend_adaptee(self, a2, v2) + 272);

  return v3();
}

- (double)syncgetLastMiniCalibration
{
  double v5 = 0.0;
  uint64_t v3 = objc_msgSend_adaptee(self, a2, v2);
  (*(void (**)(uint64_t, double *))(*(void *)v3 + 288))(v3, &v5);
  return v5;
}

- (BOOL)syncgetInsertWithBias:(id *)a3 variance:(id *)a4 temperature:(float)a5 timestamp:(double)a6
{
  uint64_t v8 = *(uint64_t (**)(__n128, __n128))(*objc_msgSend_adaptee(self, a2, (uint64_t)a3) + 208);
  v9.n128_f32[0] = a5;
  v10.n128_f64[0] = a6;

  return v8(v9, v10);
}

- (void)dumpDatabase:(id)a3 onCompletion:(id)a4
{
  uint64_t v6 = objc_msgSend_adaptee(self, a2, (uint64_t)a3);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, id))(*(void *)v6 + 224))(v6, a3);
  uint64_t v8 = (void (*)(id, uint64_t))*((void *)a4 + 2);

  v8(a4, v7);
}

- (BOOL)syncgetWipeDatabase
{
  uint64_t v3 = *(uint64_t (**)(void))(*objc_msgSend_adaptee(self, a2, v2) + 232);

  return v3();
}

- (int)syncgetNumTemperatures
{
  uint64_t v3 = *(uint64_t (**)(void))(*objc_msgSend_adaptee(self, a2, v2) + 240);

  return v3();
}

@end