@interface APSPowerAssertion_NoHold
+ (void)prepareForWake;
+ (void)setUseInteractivePowerAssertion:(BOOL)a3;
- (APSPowerAssertion_NoHold)initWithName:(id)a3 category:(int)a4;
- (APSPowerAssertion_NoHold)initWithName:(id)a3 category:(int)a4 holdDuration:(double)a5;
- (BOOL)isClear;
- (NSString)name;
- (int)category;
- (void)_clear;
- (void)_hold;
- (void)clear;
- (void)dealloc;
- (void)hold;
- (void)setCategory:(int)a3;
@end

@implementation APSPowerAssertion_NoHold

- (APSPowerAssertion_NoHold)initWithName:(id)a3 category:(int)a4
{
  return [(APSPowerAssertion_NoHold *)self initWithName:a3 category:*(void *)&a4 holdDuration:0.0];
}

- (APSPowerAssertion_NoHold)initWithName:(id)a3 category:(int)a4 holdDuration:(double)a5
{
  id v9 = a3;
  v22.receiver = self;
  v22.super_class = (Class)APSPowerAssertion_NoHold;
  v10 = [(APSPowerAssertion_NoHold *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_timeout = a5;
    v11->_powerAssertion = 0;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v11->_category = a4;
    if (a5 > 0.0)
    {
      dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      timer = v11->_timer;
      v11->_timer = (OS_dispatch_source *)v14;

      dispatch_source_set_timer((dispatch_source_t)v11->_timer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      v16 = +[CUTWeakReference weakRefWithObject:v11];
      v17 = v11->_timer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100062EC8;
      handler[3] = &unk_10012A5E0;
      id v21 = v16;
      id v18 = v16;
      dispatch_source_set_event_handler(v17, handler);
      dispatch_resume((dispatch_object_t)v11->_timer);
    }
  }

  return v11;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100062FB4;
    block[3] = &unk_10012A5E0;
    block[4] = self;
    dispatch_sync(queue, block);
    timer = self->_timer;
    if (timer) {
      dispatch_source_cancel(timer);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)APSPowerAssertion_NoHold;
  [(APSPowerAssertion_NoHold *)&v5 dealloc];
}

- (void)hold
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063030;
  block[3] = &unk_10012A5E0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hold
{
  p_unsigned int powerAssertion = &self->_powerAssertion;
  unsigned int powerAssertion = self->_powerAssertion;
  objc_super v5 = +[APSLog power];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (powerAssertion)
  {
    if (v6) {
      sub_1000CA370();
    }
  }
  else
  {
    if (v6) {
      sub_1000CA308();
    }

    v27[0] = @"AssertType";
    v27[1] = @"AssertName";
    name = self->_name;
    v28[0] = off_100159BB0;
    v28[1] = name;
    v27[2] = @"TimeoutSeconds";
    v8 = +[NSNumber numberWithDouble:self->_timeout];
    v28[2] = v8;
    v27[3] = @"Category";
    id v9 = +[NSNumber numberWithUnsignedInt:self->_category];
    v28[3] = v9;
    objc_super v5 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];

    IOReturn v10 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v5, p_powerAssertion);
    if (v10)
    {
      IOReturn v11 = v10;
      unsigned int *p_powerAssertion = 0;
      dispatch_queue_t v12 = +[APSLog power];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v20 = self->_name;
        int v21 = 138412802;
        objc_super v22 = self;
        __int16 v23 = 2112;
        v24 = v20;
        __int16 v25 = 1024;
        IOReturn v26 = v11;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%@: Failed to create power assertion %@ result = %d", (uint8_t *)&v21, 0x1Cu);
      }
    }
    else
    {
      atomic_fetch_add(&qword_10015A890, 1uLL);
    }
    v13 = +[APSLog power];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000CA28C();
    }
  }
  if (self->_timer)
  {
    dispatch_source_t v14 = +[APSLog power];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000CA208();
    }

    timer = self->_timer;
    dispatch_time_t v16 = dispatch_time(0, (unint64_t)(self->_timeout * 1000000000.0));
    dispatch_source_set_timer(timer, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  if (off_100159BB0 == @"InteractivePushServiceTask")
  {
    v17 = +[APSWakeStateManager wakeStateManager];
    unsigned int v18 = [v17 isGoingToSleep];

    if (v18)
    {
      v19 = +[APSLog power];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1000CA184();
      }

      byte_10015A898 = 1;
    }
  }
}

+ (void)prepareForWake
{
  if (byte_10015A898 == 1)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    if (v3 >= 20.0)
    {
      v4 = +[APSLog power];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000CA454((uint64_t)a1, v4, v12, v13, v14, v15, v16, v17);
      }
    }
    else
    {
      ++qword_10015A8A0;
      v4 = +[APSLog power];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000CA3D8();
      }
    }

    byte_10015A898 = 0;
  }
  else if (qword_10015A8A0)
  {
    objc_super v5 = +[APSLog power];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000CA4C0((uint64_t)a1, v5, v6, v7, v8, v9, v10, v11);
    }

    qword_10015A8A0 = 0;
  }
}

+ (void)setUseInteractivePowerAssertion:(BOOL)a3
{
  if (a3) {
    double v3 = @"InteractivePushServiceTask";
  }
  else {
    double v3 = @"ApplePushServiceTask";
  }
  if (v3 != off_100159BB0)
  {
    BOOL v4 = a3;
    unint64_t v6 = qword_10015A8A0;
    uint64_t v7 = +[APSLog power];
    uint64_t v8 = v7;
    if (v6 < 0xB || !v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1000CA52C((uint64_t)v3, v8, v10, v11, v12, v13, v14, v15);
      }

      off_100159BB0 = v3;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = a1;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Sleep reverted too often, ignoring request to change power assertion type", (uint8_t *)&v17, 0xCu);
      }
    }
  }
}

- (void)clear
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000635F4;
  block[3] = &unk_10012A5E0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_clear
{
  if (self->_powerAssertion)
  {
    double v3 = +[APSLog power];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000CA688();
    }

    if (atomic_fetch_add(&qword_10015A890, 0xFFFFFFFFFFFFFFFFLL) == 1)
    {
      BOOL v4 = +[APSLog power];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000CA600();
      }

      +[APSPowerAssertion_NoHold _lingerAfterLastPowerAssertionIsReleased];
    }
    if (self->_timer)
    {
      objc_super v5 = +[APSLog power];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_1000CA598();
      }

      dispatch_source_set_timer((dispatch_source_t)self->_timer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    }
    IOPMAssertionRelease(self->_powerAssertion);
    self->_unsigned int powerAssertion = 0;
  }
}

- (BOOL)isClear
{
  return self->_powerAssertion == 0;
}

- (NSString)name
{
  return self->_name;
}

- (int)category
{
  return self->_category;
}

- (void)setCategory:(int)a3
{
  self->_category = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end