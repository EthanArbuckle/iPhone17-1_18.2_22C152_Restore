@interface BDSXPCEventRelay
+ (void)_registerNotificationEventHandler;
+ (void)start;
@end

@implementation BDSXPCEventRelay

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000626A0;
  block[3] = &unk_10025F9D0;
  block[4] = a1;
  if (qword_1002975A8 != -1) {
    dispatch_once(&qword_1002975A8, block);
  }
}

+ (void)_registerNotificationEventHandler
{
  v2 = dispatch_get_global_queue(21, 0);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v2, &stru_100261B28);

  v3 = sub_1000063E8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registered handler for notification events", v4, 2u);
  }
}

@end