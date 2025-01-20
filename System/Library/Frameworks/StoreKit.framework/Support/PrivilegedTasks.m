@interface PrivilegedTasks
+ (id)copyIAPProductAtPath:(id)a3 toPath:(id)a4;
+ (id)installReceiptData:(id)a3 atBundlePath:(id)a4;
+ (id)removeIAPProductAtPath:(id)a3;
+ (id)sharedInstance;
- (id)_copyIAPProductAtPath:(id)a3 toPath:(id)a4;
- (id)_installReceiptData:(id)a3 atBundlePath:(id)a4;
- (id)_removeIAPProductAtPath:(id)a3;
- (id)_serviceConnection;
@end

@implementation PrivilegedTasks

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009E8D4;
  block[3] = &unk_1003572F0;
  block[4] = a1;
  if (qword_1003A0868[0] != -1) {
    dispatch_once(qword_1003A0868, block);
  }
  v2 = (void *)qword_1003A0860;

  return v2;
}

+ (id)copyIAPProductAtPath:(id)a3 toPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 sharedInstance];
  id v9 = [v8 _copyIAPProductAtPath:v7 toPath:v6];

  return v9;
}

+ (id)installReceiptData:(id)a3 atBundlePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 sharedInstance];
  id v9 = [v8 _installReceiptData:v7 atBundlePath:v6];

  return v9;
}

+ (id)removeIAPProductAtPath:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedInstance];
  id v6 = [v5 _removeIAPProductAtPath:v4];

  return v6;
}

- (id)_serviceConnection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.AppStoreDaemon.StorePrivilegedTaskService"];
    v5 = self->_connection;
    self->_connection = v4;

    id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___StorePrivilegedTaskInterface];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }

  return connection;
}

- (id)_copyIAPProductAtPath:(id)a3 toPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_10009EC9C;
  v18 = sub_10009ECAC;
  id v19 = 0;
  v8 = [(PrivilegedTasks *)self _serviceConnection];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009ECB4;
  v13[3] = &unk_10035A998;
  v13[4] = &v14;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009ECC4;
  v12[3] = &unk_10035A998;
  v12[4] = &v14;
  [v9 copyIAPProductAtPath:v6 toPath:v7 withReplyHandler:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

- (id)_installReceiptData:(id)a3 atBundlePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_10009EC9C;
  v18 = sub_10009ECAC;
  id v19 = 0;
  v8 = [(PrivilegedTasks *)self _serviceConnection];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009EE7C;
  v13[3] = &unk_10035A998;
  v13[4] = &v14;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009EE8C;
  v12[3] = &unk_10035A998;
  v12[4] = &v14;
  [v9 installReceiptData:v6 atBundlePath:v7 withReplyHandler:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v10;
}

- (id)_removeIAPProductAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10009EC9C;
  v15 = sub_10009ECAC;
  id v16 = 0;
  v5 = [(PrivilegedTasks *)self _serviceConnection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009F030;
  v10[3] = &unk_10035A998;
  v10[4] = &v11;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009F040;
  v9[3] = &unk_10035A998;
  v9[4] = &v11;
  [v6 removeIAPProductAtPath:v4 withReplyHandler:v9];
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void).cxx_destruct
{
}

@end