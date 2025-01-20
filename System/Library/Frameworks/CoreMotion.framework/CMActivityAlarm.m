@interface CMActivityAlarm
+ (BOOL)activityAlarmAvailable;
+ (id)activityAlarmInfo;
- (BOOL)isValid;
- (CMActivityAlarm)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 withHandler:(id)a6;
- (CMActivityAlarm)initWithTrigger:(unsigned int)a3 duration:(double)a4 onRunLoop:(__CFRunLoop *)a5 withHandler:(id)a6;
- (double)activityDuration;
- (double)duration;
- (unsigned)trigger;
- (void)dealloc;
- (void)fire;
- (void)invalidate;
- (void)setActivityDuration:(double)a3;
- (void)setDuration:(double)a3;
- (void)setTrigger:(unsigned int)a3;
@end

@implementation CMActivityAlarm

+ (BOOL)activityAlarmAvailable
{
  if ((sub_1902BACB4() & 1) != 0 || !objc_msgSend_sharedInstance(CMActivityAlarmProxy, v2, v3)) {
    return 0;
  }
  v6 = objc_msgSend_sharedInstance(CMActivityAlarmProxy, v4, v5);

  return objc_msgSend_activityAlarmAvailable(v6, v7, v8);
}

+ (id)activityAlarmInfo
{
  v2 = (void *)sub_190552B90();

  return v2;
}

- (CMActivityAlarm)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 withHandler:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0x1C)
  {
    v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, *(uint64_t *)&a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CMActivityAlarm.mm", 54, @"Invalid parameter not satisfying: %@", @"trigger < kActivityAlarmTriggerCount");
  }
  if ((objc_msgSend_activityAlarmAvailable(CMActivityAlarm, a2, *(uint64_t *)&a3) & 1) == 0) {
    goto LABEL_11;
  }
  v26.receiver = self;
  v26.super_class = (Class)CMActivityAlarm;
  self = [(CMActivityAlarm *)&v26 init];
  if (!objc_msgSend_sharedInstance(CMActivityAlarmProxy, v11, v12))
  {
    if (qword_1E929D738 != -1) {
      dispatch_once(&qword_1E929D738, &unk_1EDFD2960);
    }
    v20 = qword_1E929D730;
    if (os_log_type_enabled((os_log_t)qword_1E929D730, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_FAULT, "Unable to create sharedInstance of CMActivityAlarmProxy.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D738 != -1) {
        dispatch_once(&qword_1E929D738, &unk_1EDFD2960);
      }
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMActivityAlarm initWithTrigger:duration:onQueue:withHandler:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
LABEL_11:

    return 0;
  }
  self->fIsValid = 1;
  self->fRunLoop = 0;
  dispatch_retain((dispatch_object_t)a5);
  self->fQueue = (OS_dispatch_queue *)a5;
  self->fHandler = _Block_copy(a6);
  objc_msgSend_setDuration_(self, v13, v14, a4);
  objc_msgSend_setTrigger_(self, v15, v9);
  v18 = objc_msgSend_sharedInstance(CMActivityAlarmProxy, v16, v17);
  objc_msgSend_listenForActivityAlarm_(v18, v19, (uint64_t)self);
  return self;
}

- (CMActivityAlarm)initWithTrigger:(unsigned int)a3 duration:(double)a4 onRunLoop:(__CFRunLoop *)a5 withHandler:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0x1C)
  {
    v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, *(uint64_t *)&a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CMActivityAlarm.mm", 89, @"Invalid parameter not satisfying: %@", @"trigger < kActivityAlarmTriggerCount");
  }
  if ((objc_msgSend_activityAlarmAvailable(CMActivityAlarm, a2, *(uint64_t *)&a3) & 1) == 0) {
    goto LABEL_11;
  }
  v26.receiver = self;
  v26.super_class = (Class)CMActivityAlarm;
  self = [(CMActivityAlarm *)&v26 init];
  if (!objc_msgSend_sharedInstance(CMActivityAlarmProxy, v11, v12))
  {
    if (qword_1E929D738 != -1) {
      dispatch_once(&qword_1E929D738, &unk_1EDFD2960);
    }
    v20 = qword_1E929D730;
    if (os_log_type_enabled((os_log_t)qword_1E929D730, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_FAULT, "Unable to create sharedInstance of CMActivityAlarmProxy.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D738 != -1) {
        dispatch_once(&qword_1E929D738, &unk_1EDFD2960);
      }
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMActivityAlarm initWithTrigger:duration:onRunLoop:withHandler:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
LABEL_11:

    return 0;
  }
  self->fIsValid = 1;
  self->fRunLoop = a5;
  self->fQueue = 0;
  self->fHandler = _Block_copy(a6);
  objc_msgSend_setDuration_(self, v13, v14, a4);
  objc_msgSend_setTrigger_(self, v15, v9);
  v18 = objc_msgSend_sharedInstance(CMActivityAlarmProxy, v16, v17);
  objc_msgSend_listenForActivityAlarm_(v18, v19, (uint64_t)self);
  return self;
}

- (void)setActivityDuration:(double)a3
{
  self->_activityDuration = a3;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CMActivityAlarm;
  [(CMActivityAlarm *)&v4 dealloc];
}

- (void)invalidate
{
  objc_sync_enter(self);
  if (self->fIsValid)
  {
    self->fIsValid = 0;
    _Block_release(self->fHandler);
    self->fHandler = 0;
    fQueue = self->fQueue;
    if (fQueue)
    {
      dispatch_release(fQueue);
      self->fQueue = 0;
    }
    self->fRunLoop = 0;
    objc_sync_exit(self);
    uint64_t v6 = objc_msgSend_sharedInstance(CMActivityAlarmProxy, v4, v5);
    MEMORY[0x1F4181798](v6, sel_stopListeningForActivityAlarm_, self);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (BOOL)isValid
{
  objc_sync_enter(self);
  BOOL fIsValid = self->fIsValid;
  objc_sync_exit(self);
  return fIsValid;
}

- (void)fire
{
  objc_sync_enter(self);
  if (self->fIsValid)
  {
    self->BOOL fIsValid = 0;
    if (self->fRunLoop)
    {
      uint64_t v3 = _Block_copy(self->fHandler);
      fRunLoop = self->fRunLoop;
      uint64_t v5 = (const void *)*MEMORY[0x1E4F1D418];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1905AE530;
      block[3] = &unk_1E568D320;
      block[4] = self;
      block[5] = v3;
      CFRunLoopPerformBlock(fRunLoop, v5, block);
      CFRunLoopWakeUp(self->fRunLoop);
      self->fRunLoop = 0;
    }
    if (self->fQueue)
    {
      uint64_t v6 = _Block_copy(self->fHandler);
      fQueue = self->fQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1905AE57C;
      v8[3] = &unk_1E568D320;
      v8[4] = self;
      v8[5] = v6;
      dispatch_async(fQueue, v8);
      dispatch_release((dispatch_object_t)self->fQueue);
      self->fQueue = 0;
    }
    _Block_release(self->fHandler);
    self->fHandler = 0;
  }
  objc_sync_exit(self);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unsigned)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unsigned int)a3
{
  self->_trigger = a3;
}

- (double)activityDuration
{
  return self->_activityDuration;
}

@end