@interface RemoteUIListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RemoteUIListener)initWithMachServiceName:(id)a3;
- (id)_workQueue;
- (id)anonymousListener;
@end

@implementation RemoteUIListener

- (RemoteUIListener)initWithMachServiceName:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)RemoteUIListener;
  v3 = [(ListenerWithDelegate *)&v11 initWithMachServiceName:a3];
  v4 = v3;
  if (v3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000B308;
    v9[3] = &unk_100038B50;
    v5 = v3;
    v10 = v5;
    uint64_t v6 = sub_10000B308((uint64_t)v9);
    remoteUIHost = v5->_remoteUIHost;
    v5->_remoteUIHost = (LARemoteUIHost *)v6;
  }
  return v4;
}

- (id)anonymousListener
{
  v3 = +[NSXPCListener anonymousListener];
  [v3 setDelegate:self];
  v4 = [(RemoteUIListener *)self _workQueue];
  [v3 _setQueue:v4];

  [v3 resume];

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = LALogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v7;
    __int16 v18 = 1024;
    unsigned int v19 = [v7 hash];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "RemoteUIListener has accepted a new connection %{public}@ hash:%x", buf, 0x12u);
  }

  v9 = +[LAInternalProtocols interfaceWithInternalProtocol:&OBJC_PROTOCOL___LARemoteUIHost];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self->_remoteUIHost];
  v10 = [(RemoteUIListener *)self _workQueue];
  [v7 _setQueue:v10];

  [v7 resume];
  objc_initWeak((id *)buf, v7);
  objc_initWeak(&location, v6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B618;
  v12[3] = &unk_100038B98;
  objc_copyWeak(&v13, (id *)buf);
  objc_copyWeak(&v14, &location);
  [v7 setInvalidationHandler:v12];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (id)_workQueue
{
  v2 = +[DaemonUtils sharedInstance];
  v3 = [v2 serverQueue];

  return v3;
}

- (void).cxx_destruct
{
}

@end