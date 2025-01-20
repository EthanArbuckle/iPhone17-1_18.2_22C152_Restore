@interface AKAuthorizationConnectionManager
+ (id)sharedManager;
- (AKAuthorizationConnectionManager)init;
- (id)_connectionWithProtocol:(id)a3 forBundleID:(id)a4;
- (id)bundleIDs;
- (id)remoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4;
- (id)remoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4 errorHandler:(id)a5;
- (id)synchronousRemoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4 errorHandler:(id)a5;
- (void)_removeConnectionWithProtocol:(id)a3 forBundleID:(id)a4;
- (void)_setConnection:(id)a3 forBundleID:(id)a4;
- (void)addConnection:(id)a3 forBundleID:(id)a4;
- (void)addConnectionForClient:(id)a3;
@end

@implementation AKAuthorizationConnectionManager

- (AKAuthorizationConnectionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationConnectionManager;
  v2 = [(AKAuthorizationConnectionManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    connectionsByBundleID = v3->_connectionsByBundleID;
    v3->_connectionsByBundleID = (NSMutableDictionary *)v4;
  }
  return v3;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096E84;
  block[3] = &unk_1002295D0;
  block[4] = a1;
  if (qword_100272518 != -1) {
    dispatch_once(&qword_100272518, block);
  }
  v2 = (void *)qword_100272510;

  return v2;
}

- (id)bundleIDs
{
  return [(NSMutableDictionary *)self->_connectionsByBundleID allKeys];
}

- (void)addConnectionForClient:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 xpcConnection];

  if (v4)
  {
    v5 = [v7 xpcConnection];
    v6 = [v7 bundleID];
    [(AKAuthorizationConnectionManager *)self _setConnection:v5 forBundleID:v6];
  }
}

- (void)addConnection:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  [(AKAuthorizationConnectionManager *)self _setConnection:v6 forBundleID:a4];
  [v6 resume];
}

- (id)remoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4
{
  uint64_t v4 = [(AKAuthorizationConnectionManager *)self _connectionWithProtocol:a3 forBundleID:a4];
  v5 = [v4 remoteObjectProxy];

  return v5;
}

- (id)remoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  v9 = [(AKAuthorizationConnectionManager *)self _connectionWithProtocol:a3 forBundleID:a4];
  v10 = [v9 remoteObjectProxyWithErrorHandler:v8];

  return v10;
}

- (id)synchronousRemoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  v9 = [(AKAuthorizationConnectionManager *)self _connectionWithProtocol:a3 forBundleID:a4];
  v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v8];

  return v10;
}

- (void)_setConnection:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 remoteObjectInterface];
  v9 = [v8 protocol];

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000972F4;
  v24[3] = &unk_10022A4A8;
  objc_copyWeak(&v27, &location);
  id v10 = v9;
  id v25 = v10;
  id v11 = v7;
  id v26 = v11;
  [v6 setInvalidationHandler:v24];
  p_lock = &self->_lock;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v18 = sub_100097344;
  v19 = &unk_10022A4D0;
  v20 = self;
  id v13 = v11;
  id v21 = v13;
  id v14 = v10;
  id v22 = v14;
  id v15 = v6;
  id v23 = v15;
  v16 = v17;
  os_unfair_lock_lock(p_lock);
  v18((uint64_t)v16);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_removeConnectionWithProtocol:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000974C0;
  v10[3] = &unk_100226BD8;
  p_lock = &self->_lock;
  v10[4] = self;
  id v11 = a4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v11;
  os_unfair_lock_lock(p_lock);
  sub_1000974C0((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);
}

- (id)_connectionWithProtocol:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100097644;
  v12[3] = &unk_10022A4F8;
  p_lock = &self->_lock;
  v12[4] = self;
  id v13 = a4;
  id v14 = v6;
  id v8 = v6;
  id v9 = v13;
  os_unfair_lock_lock(p_lock);
  id v10 = sub_100097644((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void).cxx_destruct
{
}

@end