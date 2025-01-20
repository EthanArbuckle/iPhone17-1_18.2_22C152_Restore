@interface DiagnosticClock
- (DiagnosticClock)init;
- (NSDate)now;
- (void)dealloc;
@end

@implementation DiagnosticClock

- (DiagnosticClock)init
{
  v9.receiver = self;
  v9.super_class = (Class)DiagnosticClock;
  v2 = [(DiagnosticClock *)&v9 init];
  if (v2)
  {
    v2->_double timeOffset = sub_1003F282C();
    v3 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double timeOffset = v2->_timeOffset;
      *(_DWORD *)buf = 134217984;
      double v11 = timeOffset;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Diagnostic clock enabled, current offset: %.0f", buf, 0xCu);
    }

    v2->_notifyToken = -1;
    v5 = dispatch_get_global_queue(21, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100402BDC;
    handler[3] = &unk_1005259F8;
    v8 = v2;
    notify_register_dispatch("com.apple.appstored.defaultschange", &v2->_notifyToken, v5, handler);
  }
  return v2;
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)DiagnosticClock;
  [(DiagnosticClock *)&v4 dealloc];
}

- (NSDate)now
{
  return +[NSDate dateWithTimeIntervalSinceNow:self->_timeOffset];
}

@end