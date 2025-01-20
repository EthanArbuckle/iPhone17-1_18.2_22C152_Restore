@interface StoreUIClient
- (StoreUIClient)init;
- (void)dealloc;
- (void)presentAuthenticateRequest:(id)a3 withResultHandler:(id)a4;
- (void)presentDialogRequest:(id)a3 withResultHandler:(id)a4;
- (void)presentEngagementRequest:(id)a3 withResultHandler:(id)a4;
@end

@implementation StoreUIClient

- (StoreUIClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)StoreUIClient;
  v2 = [(StoreUIClient *)&v7 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.AppStoreDaemon.StoreUIService"];
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___StoreUIServiceProtocol];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&stru_1003596B8];
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&stru_1003596D8];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)StoreUIClient;
  [(StoreUIClient *)&v3 dealloc];
}

- (void)presentAuthenticateRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FE98 != -1) {
    dispatch_once(&qword_10039FE98, &stru_100359748);
  }
  v8 = (void *)qword_10039FE50;
  if (os_log_type_enabled((os_log_t)qword_10039FE50, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [v6 logKey];
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting UI service present authentication: %@", buf, 0x16u);
  }
  connection = self->_connection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100069F1C;
  v20[3] = &unk_100357B28;
  id v12 = v6;
  id v21 = v12;
  id v13 = v7;
  id v22 = v13;
  v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100069FBC;
  v17[3] = &unk_100359700;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 presentAuthenticateRequest:v16 withResultHandler:v17];
}

- (void)presentDialogRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FE98 != -1) {
    dispatch_once(&qword_10039FE98, &stru_100359748);
  }
  v8 = (void *)qword_10039FE50;
  if (os_log_type_enabled((os_log_t)qword_10039FE50, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [v6 logKey];
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting UI service present dialog: %@", buf, 0x16u);
  }
  connection = self->_connection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006A324;
  v20[3] = &unk_100357B28;
  id v12 = v6;
  id v21 = v12;
  id v13 = v7;
  id v22 = v13;
  v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006A3C4;
  v17[3] = &unk_100357B78;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 presentDialogRequest:v16 withResultHandler:v17];
}

- (void)presentEngagementRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FE98 != -1) {
    dispatch_once(&qword_10039FE98, &stru_100359748);
  }
  v8 = (void *)qword_10039FE50;
  if (os_log_type_enabled((os_log_t)qword_10039FE50, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [v6 logKey];
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting UI service present engagement: %@", buf, 0x16u);
  }
  connection = self->_connection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006A72C;
  v20[3] = &unk_100357B28;
  id v12 = v6;
  id v21 = v12;
  id v13 = v7;
  id v22 = v13;
  v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006A7CC;
  v17[3] = &unk_100359728;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 presentEngagementRequest:v16 withResultHandler:v17];
}

- (void).cxx_destruct
{
}

@end