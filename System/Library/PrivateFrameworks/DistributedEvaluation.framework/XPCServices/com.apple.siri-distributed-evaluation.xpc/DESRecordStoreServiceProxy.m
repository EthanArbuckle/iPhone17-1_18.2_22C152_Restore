@interface DESRecordStoreServiceProxy
- (DESRecordStoreServiceProxy)initWithXPCConnection:(id)a3;
- (void)createForwardConnection;
- (void)dealloc;
- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4;
- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5;
- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3;
- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4;
- (void)performOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4;
- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4;
- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6;
@end

@implementation DESRecordStoreServiceProxy

- (DESRecordStoreServiceProxy)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DESRecordStoreServiceProxy;
  v6 = [(DESRecordStoreServiceProxy *)&v16 init];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("DESServiceConnection", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    [v5 _setQueue:v7->_queue];
    objc_initWeak(&location, v7);
    [v5 setInterruptionHandler:&stru_1000041E8];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000018A4;
    v13[3] = &unk_100004210;
    objc_copyWeak(&v14, &location);
    [v5 setInvalidationHandler:v13];
    v8 = v7;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_forwardConnection invalidate];
  forwardConnection = self->_forwardConnection;
  self->_forwardConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)DESRecordStoreServiceProxy;
  [(DESRecordStoreServiceProxy *)&v4 dealloc];
}

- (void)createForwardConnection
{
  id v3 = objc_alloc((Class)NSXPCConnection);
  objc_super v4 = (NSXPCConnection *)[v3 initWithMachServiceName:DESFullServiceName options:4096];
  forwardConnection = self->_forwardConnection;
  self->_forwardConnection = v4;

  v6 = self->_forwardConnection;
  v7 = DESServiceGetXPCInterface();
  [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

  [(NSXPCConnection *)self->_forwardConnection setInterruptionHandler:&stru_100004230];
  objc_initWeak(&location, self);
  v8 = self->_forwardConnection;
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_100001B28;
  v12 = &unk_100004210;
  objc_copyWeak(&v13, &location);
  [(NSXPCConnection *)v8 setInvalidationHandler:&v9];
  [(NSXPCConnection *)self->_forwardConnection resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)performOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4
{
  v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  forwardConnection = self->_forwardConnection;
  if (!forwardConnection)
  {
    [(DESRecordStoreServiceProxy *)self createForwardConnection];
    forwardConnection = self->_forwardConnection;
  }
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  objc_super v16 = sub_100001DE4;
  v17 = &unk_100004280;
  id v9 = v7;
  id v18 = v9;
  uint64_t v10 = [(NSXPCConnection *)forwardConnection synchronousRemoteObjectProxyWithErrorHandler:&v14];
  if (v10)
  {
    if (v6) {
      v6[2](v6, v10);
    }
  }
  else
  {
    v11 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100002BC8();
    }

    if (v9)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"Fail to create remote object proxy.";
      v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v12];
      (*((void (**)(id, void *))v9 + 2))(v9, v13);
    }
  }
}

- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3
{
  id v4 = a3;
  if (+[DESServiceAccess hasToolEntitlement:self->_connection])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002050;
    v10[3] = &unk_1000042A8;
    id v11 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000205C;
    v8[3] = &unk_100004280;
    id v9 = v11;
    [(DESRecordStoreServiceProxy *)self performOnRemoteObjecWithBlock:v10 errorHandler:v8];

    id v5 = v11;
  }
  else
  {
    v6 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100002C80();
    }

    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"fetchInstalledBundlesIdsWithCompletion may only be called by des_tool";
    id v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v7 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v5];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    connection = self->_connection;
    id v25 = 0;
    unsigned __int8 v15 = +[DESServiceAccess hasRecordAccessToBundleId:v10 connection:connection error:&v25];
    id v16 = v25;
    if (v15)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000022E8;
      v20[3] = &unk_1000042D0;
      id v21 = v10;
      id v22 = v11;
      id v23 = v12;
      id v24 = v13;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000022F8;
      v18[3] = &unk_100004280;
      id v19 = v24;
      [(DESRecordStoreServiceProxy *)self performOnRemoteObjecWithBlock:v20 errorHandler:v18];
    }
    else
    {
      (*((void (**)(id, void, id))v13 + 2))(v13, 0, v16);
    }
  }
  else
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"invalid arguments passed to service; programmer error!";
    id v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v17 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v16];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v17);
  }
}

- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002428;
  v10[3] = &unk_1000042F8;
  id v11 = a3;
  id v12 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002434;
  v8[3] = &unk_100004280;
  id v9 = v12;
  id v6 = v12;
  id v7 = v11;
  [(DESRecordStoreServiceProxy *)self performOnRemoteObjecWithBlock:v10 errorHandler:v8];
}

- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  id v16 = 0;
  unsigned __int8 v9 = +[DESServiceAccess hasRecordAccessToBundleId:v6 connection:connection error:&v16];
  id v10 = v16;
  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000025B4;
    v13[3] = &unk_1000042F8;
    id v14 = v6;
    id v15 = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000025C0;
    v11[3] = &unk_100004280;
    id v12 = v15;
    [(DESRecordStoreServiceProxy *)self performOnRemoteObjecWithBlock:v13 errorHandler:v11];
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v10);
  }
}

- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connection = self->_connection;
  id v20 = 0;
  unsigned __int8 v12 = +[DESServiceAccess hasRecordAccessToBundleId:v8 connection:connection error:&v20];
  id v13 = v20;
  if (v12)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100002758;
    v16[3] = &unk_100004320;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100002768;
    v14[3] = &unk_100004280;
    id v15 = v19;
    [(DESRecordStoreServiceProxy *)self performOnRemoteObjecWithBlock:v16 errorHandler:v14];
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }
}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002890;
  v10[3] = &unk_1000042F8;
  id v11 = a3;
  id v12 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000289C;
  v8[3] = &unk_100004280;
  id v9 = v12;
  id v6 = v12;
  id v7 = v11;
  [(DESRecordStoreServiceProxy *)self performOnRemoteObjecWithBlock:v10 errorHandler:v8];
}

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connection = self->_connection;
  id v21 = 0;
  unsigned __int8 v12 = +[DESServiceAccess hasRecordAccessToBundleId:v9 connection:connection error:&v21];
  id v13 = v21;
  if (v12)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100002AC4;
    v17[3] = &unk_100004320;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100002AD4;
    v15[3] = &unk_100004280;
    id v16 = v20;
    [(DESRecordStoreServiceProxy *)self performOnRemoteObjecWithBlock:v17 errorHandler:v15];
  }
  else
  {
    id v14 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Uh oh %@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_forwardConnection, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end