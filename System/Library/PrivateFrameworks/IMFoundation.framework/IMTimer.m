@interface IMTimer
- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8;
- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 queue:(id)a9;
- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 useCurrentRunLoop:(BOOL)a9;
- (NSDate)fireDate;
- (id)_initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 useCurrentRunLoop:(BOOL)a9 queue:(id)a10;
- (id)userInfo;
- (void)_reschedulePCPersistentTimer;
- (void)dealloc;
- (void)invalidate;
- (void)setFireTimeInterval:(double)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation IMTimer

- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8
{
  return (IMTimer *)MEMORY[0x1F4181798](self, sel_initWithTimeInterval_name_shouldWake_target_selector_userInfo_useCurrentRunLoop_, a4, a5);
}

- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 useCurrentRunLoop:(BOOL)a9
{
  return (IMTimer *)objc_msgSend__initWithTimeInterval_name_shouldWake_target_selector_userInfo_useCurrentRunLoop_queue_(self, a2, (uint64_t)a4, a5, a6, a7, a8, a9, a3, 0);
}

- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 queue:(id)a9
{
  return (IMTimer *)objc_msgSend__initWithTimeInterval_name_shouldWake_target_selector_userInfo_useCurrentRunLoop_queue_(self, a2, (uint64_t)a4, a5, a6, a7, a8, 0, a3, a9);
}

- (id)_initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 useCurrentRunLoop:(BOOL)a9 queue:(id)a10
{
  id v35 = a4;
  id v37 = a6;
  id v18 = a8;
  id v19 = a10;
  if (a3 < 0.001) {
    a3 = 5.0;
  }
  v38.receiver = self;
  v38.super_class = (Class)IMTimer;
  v20 = [(IMTimer *)&v38 init];
  v21 = v20;
  if (v20)
  {
    v20->_wakeDevice = a5;
    objc_storeStrong(&v20->_target, a6);
    if (a7) {
      SEL v22 = a7;
    }
    else {
      SEL v22 = 0;
    }
    v21->_selector = v22;
    v21->_timeInterval = a3;
    v21->_useCurrentRunLoop = a9;
    objc_storeStrong(&v21->_userInfo, a8);
    objc_storeStrong((id *)&v21->_name, a4);
    if (v19) {
      objc_storeStrong((id *)&v21->_queue, a10);
    }
    if (a5 || v21->_queue)
    {
      objc_msgSend__reschedulePCPersistentTimer(v21, v23, v24, v25);
    }
    else
    {
      uint64_t v27 = objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x1E4F1CB00], v23, (uint64_t)v37, (uint64_t)a7, v18, 0, a3);
      id timer = v21->_timer;
      v21->_id timer = (id)v27;

      if (a9 || !objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v29, v30, v31))
      {
        v32 = objc_msgSend_mainRunLoop(MEMORY[0x1E4F1CAC0], v29, v30, v31);
      }
      else
      {
        v32 = objc_msgSend_currentRunLoop(MEMORY[0x1E4F1CAC0], v29, v30, v31);
      }
      v34 = v32;
      objc_msgSend_addTimer_forMode_(v32, v33, (uint64_t)v21->_timer, *MEMORY[0x1E4F1C3A0]);
    }
  }

  return v21;
}

- (void)setFireTimeInterval:(double)a3
{
  self->_timeInterval = a3;
  if (self->_wakeDevice || self->_queue)
  {
    objc_msgSend__reschedulePCPersistentTimer(self, a2, v3, v4);
  }
  else
  {
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], a2, v3, v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFireDate_(self->_timer, v6, (uint64_t)v8, v7);
  }
}

- (void)_reschedulePCPersistentTimer
{
  uint64_t v3 = (void *)MEMORY[0x192FDE5A0](self, a2);
  objc_msgSend_invalidate(self->_timer, v4, v5, v6);
  id timer = self->_timer;
  self->_id timer = 0;

  v11 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v8, v9, v10, self->_timeInterval);
  v12 = (objc_class *)qword_1E92DB0D0;
  if (!qword_1E92DB0D0)
  {
    v12 = (objc_class *)IMWeakLinkClass();
    qword_1E92DB0D0 = (uint64_t)v12;
  }
  id v13 = [v12 alloc];
  SEL selector = self->_selector;
  id target = self->_target;
  name = self->_name;
  if (selector) {
    id v18 = objc_msgSend_initWithFireDate_serviceIdentifier_target_selector_userInfo_(v13, v14, (uint64_t)v11, (uint64_t)name, target, selector, self->_userInfo);
  }
  else {
    id v18 = objc_msgSend_initWithFireDate_serviceIdentifier_target_selector_userInfo_(v13, v14, (uint64_t)v11, (uint64_t)name, target, 0, self->_userInfo);
  }
  id v19 = self->_timer;
  self->_id timer = v18;

  objc_msgSend_setMinimumEarlyFireProportion_(self->_timer, v20, v21, v22, 1.0);
  objc_msgSend_setDisableSystemWaking_(self->_timer, v23, !self->_wakeDevice, v24);
  queue = self->_queue;
  if (queue)
  {
    objc_msgSend_scheduleInQueue_(self->_timer, v25, (uint64_t)queue, v26);
  }
  else
  {
    if (!self->_useCurrentRunLoop) {
      _IMWarn(@"creating an IMTimer with shouldWake = YES and useCurrentRunLoop = NO is not supported! Forcing to main run loop anyway", (uint64_t)v25, 0, v26, v27, v28, v29, v30, v40);
    }
    int isMainThread = objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v25, (uint64_t)queue, v26);
    id v36 = self->_timer;
    if (isMainThread) {
      objc_msgSend_currentRunLoop(MEMORY[0x1E4F1CAC0], v32, v33, v34);
    }
    else {
    id v37 = objc_msgSend_mainRunLoop(MEMORY[0x1E4F1CAC0], v32, v33, v34);
    }
    objc_msgSend_scheduleInRunLoop_(v36, v38, (uint64_t)v37, v39);
  }
}

- (NSDate)fireDate
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = objc_msgSend_fireDate(self->_timer, v3, v4, v5);
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend_fireTime(self->_timer, v7, v8, v9);
    uint64_t v6 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v10, v11, v12);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSDate *)v6;
}

- (void)invalidate
{
  objc_msgSend_invalidate(self->_timer, a2, v2, v3);
}

- (void)dealloc
{
  objc_msgSend_invalidate(self->_timer, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMTimer;
  [(IMTimer *)&v5 dealloc];
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong(&self->_timer, 0);
}

@end