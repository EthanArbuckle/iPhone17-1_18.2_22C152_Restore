@interface CMMotionActivityManager
+ (BOOL)isActivityAvailable;
+ (BOOL)isActivityLiteAvailable;
+ (CMAuthorizationStatus)authorizationStatus;
+ (void)paginateDatesIntoDatesFrom:(id)a3 datesTo:(id)a4 start:(id)a5 end:(id)a6 intervalLength:(double)a7;
- (CMMotionActivityManager)init;
- (id)filterActivities:(id)a3 withAttribute:(int64_t)a4;
- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5;
- (void)dealloc;
- (void)queryActivityStartingFromDate:(NSDate *)start toDate:(NSDate *)end toQueue:(NSOperationQueue *)queue withHandler:(CMMotionActivityQueryHandler)handler;
- (void)queryActivityWithAttribute:(int64_t)a3 fromDate:(id)a4 toDate:(id)a5 toQueue:(id)a6 withHandler:(id)a7;
- (void)startActivityLiteUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startActivityUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMMotionActivityHandler)handler;
- (void)startPeriodicActivityUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)stopActivityLiteUpdates;
- (void)stopActivityUpdates;
- (void)stopPeriodicActivityUpdates;
@end

@implementation CMMotionActivityManager

+ (BOOL)isActivityAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }
  if ((sub_1902CD6B0() & 0x400000) != 0) {
    return 1;
  }

  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageMotionActivityAvailable");
}

+ (CMAuthorizationStatus)authorizationStatus
{
  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2);
}

- (CMMotionActivityManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMMotionActivityManager;
  uint64_t v2 = [(CMMotionActivityManager *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->fQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMMotionActivityManager", v3);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  id fHandler = self->fHandler;
  if (fHandler) {
    _Block_release(fHandler);
  }

  if (self->fLocationConnection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
  }
  fQueue = self->fQueue;
  self->fQueue = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190443200;
  block[3] = &unk_1E568D118;
  block[4] = fQueue;
  dispatch_async(fQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)CMMotionActivityManager;
  [(CMMotionActivityManager *)&v6 dealloc];
}

+ (void)paginateDatesIntoDatesFrom:(id)a3 datesTo:(id)a4 start:(id)a5 end:(id)a6 intervalLength:(double)a7
{
  uint64_t v9 = (uint64_t)a5;
  objc_msgSend_timeIntervalSinceDate_(a6, a2, (uint64_t)a5);
  if (v13 <= a7)
  {
    uint64_t v14 = v9;
  }
  else
  {
    do
    {
      uint64_t v14 = objc_msgSend_dateWithTimeInterval_sinceDate_(MEMORY[0x1E4F1C9C8], v12, v9, a7);
      objc_msgSend_addObject_(a3, v15, v9);
      objc_msgSend_addObject_(a4, v16, v14);
      objc_msgSend_timeIntervalSinceDate_(a6, v17, v14);
      uint64_t v9 = v14;
    }
    while (v18 > a7);
  }
  objc_msgSend_addObject_(a3, v12, v14);

  objc_msgSend_addObject_(a4, v19, (uint64_t)a6);
}

- (void)queryActivityStartingFromDate:(NSDate *)start toDate:(NSDate *)end toQueue:(NSOperationQueue *)queue withHandler:(CMMotionActivityQueryHandler)handler
{
  if (start)
  {
    if (end) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 148, @"Invalid parameter not satisfying: %@", @"start");
    if (end)
    {
LABEL_3:
      if (queue) {
        goto LABEL_4;
      }
LABEL_8:
      v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 150, @"Invalid parameter not satisfying: %@", @"queue");
      if (handler) {
        goto LABEL_5;
      }
LABEL_9:
      v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 151, @"Invalid parameter not satisfying: %@", @"handler");
      goto LABEL_5;
    }
  }
  v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 149, @"Invalid parameter not satisfying: %@", @"end");
  if (!queue) {
    goto LABEL_8;
  }
LABEL_4:
  if (!handler) {
    goto LABEL_9;
  }
LABEL_5:
  id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v12, v13, 16);
  id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v17 = objc_msgSend_initWithCapacity_(v15, v16, 16);
  objc_msgSend_paginateDatesIntoDatesFrom_datesTo_start_end_intervalLength_(CMMotionActivityManager, v18, (uint64_t)v14, v17, start, end, 21600.0);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1904434E4;
  v28[3] = &unk_1E568D3E8;
  v28[4] = self;
  v28[5] = v14;
  v28[6] = v17;
  v28[7] = queue;
  v28[8] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v19, (uint64_t)v28);
}

- (void)startActivityUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMMotionActivityHandler)handler
{
  if (!queue)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 208, @"Invalid parameter not satisfying: %@", @"queue");
    if (handler) {
      goto LABEL_3;
    }
LABEL_5:
    v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)queue);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 209, @"Invalid parameter not satisfying: %@", @"handler");
    goto LABEL_3;
  }
  if (!handler) {
    goto LABEL_5;
  }
LABEL_3:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_190443A98;
  v12[3] = &unk_1E568D410;
  v12[5] = queue;
  v12[6] = handler;
  v12[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v12);
}

- (void)stopActivityUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_190443CE0;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5
{
  var1 = a3.var1;
  if (*(void *)a3.var0)
  {
    var0 = (CLConnectionMessage **)a3.var0;
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v14 = (char *)objc_msgSend_setWithObjects_(v8, v13, v9, v10, v11, v12, 0);
    if (*var0
      && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, (NSSet *)v14)) != 0)
    {
      v16 = DictionaryOfClasses;
      uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v14, @"CMErrorMessage");
      uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v18, @"CMMotionActivityDataArray");
      if (v17)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = sub_1904441D8;
        v23[3] = &unk_1E568D320;
        v23[4] = v17;
        v23[5] = a4;
        objc_msgSend_addOperationWithBlock_(var1, v20, (uint64_t)v23);
      }
      else if (v19)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = sub_190444250;
        v22[3] = &unk_1E568D320;
        v22[4] = v19;
        v22[5] = a4;
        objc_msgSend_addOperationWithBlock_(var1, v20, (uint64_t)v22);
      }
      else
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = sub_190444268;
        v21[3] = &unk_1E568D2D0;
        v21[4] = a4;
        objc_msgSend_addOperationWithBlock_(var1, v20, (uint64_t)v21);
      }
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_190444174;
      v24[3] = &unk_1E568D2D0;
      v24[4] = a4;
      objc_msgSend_addOperationWithBlock_(var1, v14, (uint64_t)v24);
    }
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_190444110;
    v25[3] = &unk_1E568D2D0;
    v25[4] = a4;
    objc_msgSend_addOperationWithBlock_(a3.var1, a2, (uint64_t)v25);
  }
}

- (void)startPeriodicActivityUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  if (!a3)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 286, @"Invalid parameter not satisfying: %@", @"queue");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 287, @"Invalid parameter not satisfying: %@", @"handler");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1904443E4;
  v12[3] = &unk_1E568D410;
  v12[5] = a3;
  v12[6] = a4;
  v12[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v12);
}

- (void)stopPeriodicActivityUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_190444620;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

+ (BOOL)isActivityLiteAvailable
{
  return ((unint64_t)sub_1902CD6B0() >> 23) & 1;
}

- (void)startActivityLiteUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  objc_super v5 = a3;
  SEL v6 = a2;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_isActivityLiteAvailable(CMMotionActivityManager, a2, (uint64_t)a3) & 1) == 0)
  {
    if (qword_1E929D7A0 != -1) {
      dispatch_once(&qword_1E929D7A0, &unk_1EDFD14A0);
    }
    uint64_t v10 = qword_1E929D7A8;
    SEL v6 = "";
    self = (CMMotionActivityManager *)"assert";
    a4 = "[CMMotionActivityManager isActivityLiteAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1E929D7A8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      __int16 v24 = 2082;
      v25 = "assert";
      __int16 v26 = 2081;
      v27 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D7A0 != -1) {
        dispatch_once(&qword_1E929D7A0, &unk_1EDFD14A0);
      }
    }
    uint64_t v11 = qword_1E929D7A8;
    if (os_signpost_enabled((os_log_t)qword_1E929D7A8))
    {
      *(_DWORD *)buf = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      __int16 v24 = 2082;
      v25 = "assert";
      __int16 v26 = 2081;
      v27 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Activity Lite is unavailable on this platform", "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D7A0 != -1) {
        dispatch_once(&qword_1E929D7A0, &unk_1EDFD14A0);
      }
    }
    objc_super v5 = qword_1E929D7A8;
    if (os_log_type_enabled((os_log_t)qword_1E929D7A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      __int16 v24 = 2082;
      v25 = "assert";
      __int16 v26 = 2081;
      v27 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v17 = 334;
    double v18 = "-[CMMotionActivityManager startActivityLiteUpdatesToQueue:withHandler:]";
    v16 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/Activity/CMMotionActivityManager.mm";
    abort_report_np();
LABEL_16:
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v16, v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)v6, self, @"CMMotionActivityManager.mm", 336, @"Invalid parameter not satisfying: %@", @"queue");
    if (a4) {
      goto LABEL_4;
    }
LABEL_17:
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)v6, self, @"CMMotionActivityManager.mm", 337, @"Invalid parameter not satisfying: %@", @"handler");
    goto LABEL_4;
  }
  if (!v5) {
    goto LABEL_16;
  }
  if (!a4) {
    goto LABEL_17;
  }
LABEL_4:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_190444B48;
  v19[3] = &unk_1E568D410;
  v19[5] = v5;
  v19[6] = a4;
  v19[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v8, (uint64_t)v19);
}

- (void)stopActivityLiteUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_isActivityLiteAvailable(CMMotionActivityManager, a2, v2) & 1) == 0)
  {
    if (qword_1E929D7A0 != -1) {
      dispatch_once(&qword_1E929D7A0, &unk_1EDFD14A0);
    }
    objc_super v5 = qword_1E929D7A8;
    if (os_log_type_enabled((os_log_t)qword_1E929D7A8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      v16 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D7A0 != -1) {
        dispatch_once(&qword_1E929D7A0, &unk_1EDFD14A0);
      }
    }
    SEL v6 = qword_1E929D7A8;
    if (os_signpost_enabled((os_log_t)qword_1E929D7A8))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      v16 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Activity Lite is unavailable on this platform", "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D7A0 != -1) {
        dispatch_once(&qword_1E929D7A0, &unk_1EDFD14A0);
      }
    }
    v7 = qword_1E929D7A8;
    if (os_log_type_enabled((os_log_t)qword_1E929D7A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      v16 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190444FD4;
  v8[3] = &unk_1E568D118;
  v8[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v4, (uint64_t)v8);
}

- (id)filterActivities:(id)a3 withAttribute:(int64_t)a4
{
  id v6 = (id)objc_opt_new();
  id v7 = (id)objc_opt_new();
  if (objc_msgSend_count(a3, v8, v9))
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, v11);
      __int16 v15 = objc_msgSend_copy(v12, v13, v14);
      objc_msgSend_evaluateNextActivity_attribute_result_(v6, v16, (uint64_t)v15, a4, v7);

      ++v11;
    }
    while (v11 < objc_msgSend_count(a3, v17, v18));
  }
  return v7;
}

- (void)queryActivityWithAttribute:(int64_t)a3 fromDate:(id)a4 toDate:(id)a5 toQueue:(id)a6 withHandler:(id)a7
{
  if (!a7)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMMotionActivityManager.mm", 402, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_190445338;
  v16[3] = &unk_1E568D438;
  v16[4] = a4;
  v16[5] = a5;
  v16[6] = self;
  v16[7] = a7;
  v16[8] = a3;
  objc_msgSend_queryActivityStartingFromDate_toDate_toQueue_withHandler_(self, a2, (uint64_t)a4, a5, a6, v16);
}

@end