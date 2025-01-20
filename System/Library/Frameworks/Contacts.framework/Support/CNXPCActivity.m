@interface CNXPCActivity
+ (const)activityIdentifier;
+ (id)_stringFromXPCActivityState:(int64_t)a3;
+ (void)registerActivity;
+ (void)run;
@end

@implementation CNXPCActivity

+ (void)registerActivity
{
  v3 = (const char *)[a1 activityIdentifier];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000F268;
  handler[3] = &unk_100024EB8;
  id v6 = [objc_alloc((Class)NSString) initWithUTF8String:v3];
  v7 = v3;
  id v8 = a1;
  id v4 = v6;
  xpc_activity_register(v3, XPC_ACTIVITY_CHECK_IN, handler);
}

+ (id)_stringFromXPCActivityState:(int64_t)a3
{
  if ((unint64_t)a3 < 6) {
    return off_100024ED8[a3];
  }
  v5 = +[CNContactsDaemonLogs xpc];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016530(a3, v5);
  }

  return 0;
}

+ (const)activityIdentifier
{
  id v2 = a1;
  CNUnimplementedMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (void)run
{
  id v2 = a1;
  CNUnimplementedMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end