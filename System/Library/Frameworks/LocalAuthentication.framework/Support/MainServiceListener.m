@interface MainServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MainServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = LALogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 1024;
    unsigned int v18 = [v6 hash];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "MainServiceListener has accepted a new connection: %{public}@ hash:%x", buf, 0x12u);
  }

  v8 = +[Daemon sharedInstance];
  v9 = +[LAInternalProtocols interfaceWithInternalProtocol:&OBJC_PROTOCOL___LADaemonXPC];
  [v6 setExportedInterface:v9];

  [v6 setExportedObject:v8];
  v10 = +[DaemonUtils sharedInstance];
  v11 = [v10 serverQueue];
  [v6 _setQueue:v11];

  [v6 resume];
  objc_initWeak((id *)buf, v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004C34;
  v13[3] = &unk_100038B28;
  objc_copyWeak(&v14, (id *)buf);
  [v6 setInvalidationHandler:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

  return 1;
}

@end