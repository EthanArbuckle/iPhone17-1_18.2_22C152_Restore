@interface IMDispatchTimer
- (BOOL)isValid;
- (BOOL)repeats;
- (IMDispatchTimer)initWithQueue:(id)a3 interval:(unint64_t)a4 repeats:(BOOL)a5 handlerBlock:(id)a6;
- (IMDispatchTimer)initWithQueue:(id)a3 interval:(unint64_t)a4 repeats:(BOOL)a5 userInfo:(id)a6 handlerBlock:(id)a7;
- (NSDate)fireDate;
- (OS_dispatch_source)timerSource;
- (double)timeInterval;
- (id)handlerBlock;
- (id)userInfo;
- (void)fire;
- (void)invalidate;
- (void)setFireDate:(id)a3;
- (void)setHandlerBlock:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setTimeInterval:(double)a3;
- (void)setTimerSource:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)stop;
- (void)updateTimerInterval:(unint64_t)a3 repeats:(BOOL)a4;
@end

@implementation IMDispatchTimer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong(&self->_userInfo, 0);
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_isValid)
  {
    if (self->_timerSource)
    {
      v5 = objc_msgSend_timer(IMIDSLog, a2, v2, v3);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        timerSource = self->_timerSource;
        int v10 = 134218242;
        v11 = self;
        __int16 v12 = 2112;
        v13 = timerSource;
        _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer invalidate] {self: %p, _timerSource: %@}", (uint8_t *)&v10, 0x16u);
      }

      dispatch_source_cancel((dispatch_source_t)self->_timerSource);
    }
    fireDate = self->_fireDate;
    self->_fireDate = 0;

    self->_timeInterval = 0.0;
    *(_WORD *)&self->_isValid = 0;
    id userInfo = self->_userInfo;
    self->_id userInfo = 0;

    id handlerBlock = self->_handlerBlock;
    self->_id handlerBlock = 0;
  }
}

- (IMDispatchTimer)initWithQueue:(id)a3 interval:(unint64_t)a4 repeats:(BOOL)a5 handlerBlock:(id)a6
{
  BOOL v7 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v10 = a3;
  id v11 = a6;
  v33.receiver = self;
  v33.super_class = (Class)IMDispatchTimer;
  __int16 v12 = [(IMDispatchTimer *)&v33 init];
  v13 = v12;
  if (v12)
  {
    id userInfo = v12->_userInfo;
    v12->_id userInfo = 0;

    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);
    timerSource = v13->_timerSource;
    v13->_timerSource = (OS_dispatch_source *)v15;

    v13->_isValid = 1;
    v17 = _Block_copy(v11);
    id handlerBlock = v13->_handlerBlock;
    v13->_id handlerBlock = v17;

    objc_msgSend_updateTimerInterval_repeats_(v13, v19, a4, v7);
    v20 = v13->_timerSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_191896140;
    handler[3] = &unk_1E5723198;
    v21 = v13;
    v30 = v21;
    id v31 = v11;
    unint64_t v32 = a4;
    dispatch_source_set_event_handler(v20, handler);
    v25 = objc_msgSend_timer(IMIDSLog, v22, v23, v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = @"NO";
      v27 = v13->_timerSource;
      *(_DWORD *)buf = 134219010;
      if (v7) {
        v26 = @"YES";
      }
      v35 = v21;
      __int16 v36 = 2048;
      unint64_t v37 = a4;
      __int16 v38 = 2112;
      v39 = v26;
      __int16 v40 = 2112;
      v41 = v27;
      __int16 v42 = 2112;
      v43 = v10;
      _os_log_impl(&dword_191892000, v25, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer init] {self: %p, interval: %llu, repeats: %@, _timerSource: %@, queue: %@}", buf, 0x34u);
    }

    dispatch_resume((dispatch_object_t)v13->_timerSource);
  }

  return v13;
}

- (IMDispatchTimer)initWithQueue:(id)a3 interval:(unint64_t)a4 repeats:(BOOL)a5 userInfo:(id)a6 handlerBlock:(id)a7
{
  BOOL v9 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = [IMDispatchTimer alloc];
  v18 = (IMDispatchTimer *)objc_msgSend_initWithQueue_interval_repeats_handlerBlock_(v16, v17, (uint64_t)v15, a4, v9, v14);

  if (v18) {
    objc_storeStrong(&v18->_userInfo, a6);
  }

  return v18;
}

- (void)updateTimerInterval:(unint64_t)a3 repeats:(BOOL)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_isValid)
  {
    BOOL v4 = a4;
    self->_timeInterval = (double)a3;
    BOOL v7 = a3 != -1 && a4;
    self->_repeats = v7;
    if (a3 == -1)
    {
      fireDate = self->_fireDate;
      self->_fireDate = 0;

      dispatch_time_t v11 = -1;
      unint64_t v10 = -1000000000;
    }
    else
    {
      objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], a2, a3, a4);
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      BOOL v9 = self->_fireDate;
      self->_fireDate = v8;

      unint64_t v10 = 1000000000 * a3;
      dispatch_time_t v11 = dispatch_time(0, 1000000000 * a3);
    }
    if (v7) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = -1;
    }
    dispatch_source_set_timer((dispatch_source_t)self->_timerSource, v11, v13, 0x5F5E100uLL);
    v17 = objc_msgSend_timer(IMIDSLog, v14, v15, v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      timerSource = self->_timerSource;
      v19 = @"NO";
      int v20 = 134219522;
      if (v4) {
        v19 = @"YES";
      }
      v21 = self;
      __int16 v22 = 2112;
      uint64_t v23 = timerSource;
      __int16 v24 = 2048;
      dispatch_time_t v25 = v11;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      __int16 v28 = 2048;
      uint64_t v29 = 100000000;
      __int16 v30 = 2048;
      unint64_t v31 = a3;
      __int16 v32 = 2112;
      objc_super v33 = v19;
      _os_log_impl(&dword_191892000, v17, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer update] {self: %p, _timerSource: %@, timerStart: %llu, timerInterval: %llu, timerLeeway: %llu, newInterval: %llu, repeats: %@}", (uint8_t *)&v20, 0x48u);
    }
  }
}

- (void)stop
{
}

- (void)fire
{
  if (self->_isValid)
  {
    (*((void (**)(void))self->_handlerBlock + 2))();
    if (!self->_repeats)
    {
      objc_msgSend_invalidate(self, v3, v4, v5);
    }
  }
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
}

@end