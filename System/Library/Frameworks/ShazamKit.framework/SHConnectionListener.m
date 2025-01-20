@interface SHConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connectionHandles;
- (NSXPCListener)listener;
- (SHConnectionListener)initWithServiceProvider:(id)a3 listener:(id)a4;
- (SHServiceProvider)serviceProvider;
- (os_unfair_lock_s)lock;
- (void)listen;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)stopListening;
@end

@implementation SHConnectionListener

- (SHConnectionListener)initWithServiceProvider:(id)a3 listener:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SHConnectionListener;
  v9 = [(SHConnectionListener *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProvider, a3);
    objc_storeStrong((id *)&v10->_listener, a4);
    [(NSXPCListener *)v10->_listener setDelegate:v10];
    uint64_t v11 = +[NSMutableArray array];
    connectionHandles = v10->_connectionHandles;
    v10->_connectionHandles = (NSMutableArray *)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)listen
{
  id v2 = [(SHConnectionListener *)self listener];
  [v2 resume];
}

- (void)stopListening
{
  id v2 = [(SHConnectionListener *)self listener];
  [v2 invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[SHClientCredentials alloc] initWithConnection:v7];
  v9 = [(SHConnectionListener *)self serviceProvider];
  v10 = [v9 handleForConnection:v7 withClientCredentials:v8];

  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = [(SHConnectionListener *)self connectionHandles];
  [v11 addObject:v10];

  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100007F30;
  v33[3] = &unk_100074E10;
  objc_copyWeak(&v35, location);
  id v12 = v10;
  id v34 = v12;
  v13 = objc_retainBlock(v33);
  LODWORD(v11) = [v7 processIdentifier];
  objc_super v14 = [(SHClientCredentials *)v8 attribution];
  v15 = [v14 bundleIdentifier];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000080D0;
  v29[3] = &unk_100074E38;
  v29[4] = self;
  id v16 = v15;
  id v30 = v16;
  int v32 = (int)v11;
  v17 = v13;
  id v31 = v17;
  [v7 setInterruptionHandler:v29];
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_1000081A4;
  v24 = &unk_100074E38;
  v25 = self;
  id v18 = v16;
  id v26 = v18;
  int v28 = (int)v11;
  v19 = v17;
  id v27 = v19;
  [v7 setInvalidationHandler:&v21];
  objc_msgSend(v7, "resume", v21, v22, v23, v24, v25);

  objc_destroyWeak(&v35);
  objc_destroyWeak(location);

  return 1;
}

- (NSMutableArray)connectionHandles
{
  return self->_connectionHandles;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (SHServiceProvider)serviceProvider
{
  return self->_serviceProvider;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_connectionHandles, 0);
}

@end