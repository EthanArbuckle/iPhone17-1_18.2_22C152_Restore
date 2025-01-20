@interface CLBBrightnessManager
+ (id)sharedInstance;
- (CLBBrightnessManager)init;
- (float)brightness;
- (void)releaseTransaction;
- (void)setBrightness:(float)a3;
- (void)startTransactionIfNeeded;
@end

@implementation CLBBrightnessManager

+ (id)sharedInstance
{
  if (qword_100180FC8 != -1) {
    dispatch_once(&qword_100180FC8, &stru_10015BF48);
  }
  v2 = (void *)qword_100180FC0;

  return v2;
}

- (CLBBrightnessManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLBBrightnessManager;
  v2 = [(CLBBrightnessManager *)&v5 init];
  if (v2)
  {
    BKSDisplayBrightnessGetCurrent();
    v2->_brightness = v3;
  }
  return v2;
}

- (void)setBrightness:(float)a3
{
  uint64_t v5 = qword_100180FD0;
  v6 = +[CLFLog commonLog];
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      double v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting brightness %f", (uint8_t *)&v9, 0xCu);
    }

    float v8 = 1.0;
    if (a3 <= 1.0) {
      float v8 = a3;
    }
    if (v8 <= 0.1) {
      float v8 = 0.1;
    }
    self->_brightness = v8;
    BKSDisplayBrightnessSet();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF000(v7);
    }
  }
}

- (void)startTransactionIfNeeded
{
  if (!qword_100180FD0)
  {
    v2 = +[CLFLog commonLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Creating brightness transaction", v3, 2u);
    }

    qword_100180FD0 = BKSDisplayBrightnessTransactionCreate();
  }
}

- (void)releaseTransaction
{
  if (qword_100180FD0)
  {
    v2 = +[CLFLog commonLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Releasing brightness transaction", v3, 2u);
    }

    CFRelease((CFTypeRef)qword_100180FD0);
    qword_100180FD0 = 0;
  }
}

- (float)brightness
{
  return self->_brightness;
}

@end