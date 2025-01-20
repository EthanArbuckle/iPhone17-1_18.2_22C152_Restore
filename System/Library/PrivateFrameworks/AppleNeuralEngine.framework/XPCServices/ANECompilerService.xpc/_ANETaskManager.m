@interface _ANETaskManager
+ (void)registerTask:(id)a3;
+ (void)unregisterTask:(id)a3;
@end

@implementation _ANETaskManager

+ (void)registerTask:(id)a3
{
  id v3 = a3;
  v4 = +[_ANELog daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Registered CTS task %@", buf, 0xCu);
  }

  id v5 = [v3 name];
  v6 = (const char *)[v5 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000296A8;
  handler[3] = &unk_10004D180;
  id v9 = v3;
  id v7 = v3;
  xpc_activity_register(v6, XPC_ACTIVITY_CHECK_IN, handler);
}

+ (void)unregisterTask:(id)a3
{
  id v3 = [a3 name];
  xpc_activity_unregister((const char *)[v3 UTF8String]);
}

@end