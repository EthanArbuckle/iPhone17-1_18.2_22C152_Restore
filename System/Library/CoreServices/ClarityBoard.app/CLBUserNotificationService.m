@interface CLBUserNotificationService
+ (void)dispatchUserNotification:(id)a3 flags:(int)a4 replyPort:(unsigned int)a5 auditToken:(id)a6 presenter:(id)a7;
+ (void)startWithAlertPresenter:(id)a3;
@end

@implementation CLBUserNotificationService

+ (void)dispatchUserNotification:(id)a3 flags:(int)a4 replyPort:(unsigned int)a5 auditToken:(id)a6 presenter:(id)a7
{
  if ((a4 & 8) != 0) {
    _objc_msgSend(a7, "cancelAlertFromDictionary:", a3, *(void *)&a4);
  }
  else {
    _[a7 addAlertFromDictionary:a3 replyPort:*(void *)&a5];
  }
}

+ (void)startWithAlertPresenter:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016C2C;
  block[3] = &unk_10015BEB8;
  id v3 = a3;
  id v8 = v3;
  if (qword_100181048 != -1) {
    dispatch_once(&qword_100181048, block);
  }
  [@"com.apple.SBUserNotification" UTF8String];
  if (bootstrap_check_in2())
  {
    v6 = +[CLFLog commonLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FFCB8(v6);
    }

    abort();
  }
  uint64_t v4 = dispatch_mach_create();
  v5 = (void *)qword_100181050;
  qword_100181050 = v4;

  dispatch_mach_connect();
}

@end