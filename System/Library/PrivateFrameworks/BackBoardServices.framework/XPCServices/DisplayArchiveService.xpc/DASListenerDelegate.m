@interface DASListenerDelegate
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation DASListenerDelegate

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  v6 = [v5 remoteProcess];
  if ([v6 hasEntitlement:@"com.apple.backboard.display.archive"])
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DASClientToServiceProtocol];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    [v7 setClasses:v10 forSelector:"nameAndDumpAllWithCompletion:" argumentIndex:0 ofReply:1];

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    [v7 setClasses:v13 forSelector:"dumpAllWithCompletion:" argumentIndex:0 ofReply:1];

    v14 = [v5 extractNSXPCConnectionWithConfigurator:&stru_100010360];

    [v14 setExportedInterface:v7];
    v15 = objc_opt_new();
    [v14 setExportedObject:v15];

    v16 = (void *)BSDispatchQueueCreateWithFixedPriority();
    [v14 _setQueue:v16];

    [v14 activate];
  }
  else
  {
    v17 = sub_100005E28();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "rejecting unauthorized access from %@", buf, 0xCu);
    }

    [v5 invalidate];
  }
}

@end