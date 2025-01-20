@interface SKUIOctaneBag
+ (id)shared;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (SKUIOctaneBag)init;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)_bagValueForKey:(id)a3 ofType:(unint64_t)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)_activePort;
- (void)_fetchBag;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)invalidate;
@end

@implementation SKUIOctaneBag

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002386C;
  block[3] = &unk_10004D5A8;
  block[4] = a1;
  if (qword_100067398 != -1) {
    dispatch_once(&qword_100067398, block);
  }
  v2 = (void *)qword_100067390;

  return v2;
}

- (SKUIOctaneBag)init
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIOctaneBag;
  v2 = [(SKUIOctaneBag *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreKit.UIService.OctaneBag.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023998;
  block[3] = &unk_10004CEB0;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (id)URLForKey:(id)a3
{
  return [(SKUIOctaneBag *)self _bagValueForKey:a3 ofType:5];
}

- (id)arrayForKey:(id)a3
{
  return [(SKUIOctaneBag *)self _bagValueForKey:a3 ofType:0];
}

- (id)BOOLForKey:(id)a3
{
  return [(SKUIOctaneBag *)self _bagValueForKey:a3 ofType:1];
}

- (void)createSnapshotWithCompletion:(id)a3
{
  dispatch_queue_t v4 = (void (**)(id, void *, id))a3;
  v5 = objc_opt_new();
  [v5 setData:self->_dictionary];
  v6 = +[NSDate distantFuture];
  [v5 setExpirationDate:v6];

  objc_super v7 = +[AMSProcessInfo currentProcess];
  [v5 setProcessInfo:v7];

  [v5 setProfile:@"appstored"];
  [v5 setProfileVersion:@"1"];
  id v10 = 0;
  v8 = [v5 buildWithError:&v10];
  id v9 = v10;
  v4[2](v4, v8, v9);
}

- (id)dictionaryForKey:(id)a3
{
  return [(SKUIOctaneBag *)self _bagValueForKey:a3 ofType:6];
}

- (id)doubleForKey:(id)a3
{
  return [(SKUIOctaneBag *)self _bagValueForKey:a3 ofType:2];
}

- (id)integerForKey:(id)a3
{
  return [(SKUIOctaneBag *)self _bagValueForKey:a3 ofType:3];
}

- (id)stringForKey:(id)a3
{
  return [(SKUIOctaneBag *)self _bagValueForKey:a3 ofType:4];
}

- (int64_t)_activePort
{
  connection = self->_connection;
  if (!connection)
  {
    dispatch_queue_t v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.storekit.configuration.xpc" options:4096];
    v5 = self->_connection;
    self->_connection = v4;

    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASDOctaneServiceProtocol];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    objc_super v7 = self->_connection;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100023CC8;
    v16[3] = &unk_10004CDC8;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v7 setInvalidationHandler:v16];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  id location = 0;
  p_id location = &location;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&stru_10004DAA0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100023D14;
  v11[3] = &unk_10004DAC8;
  v11[4] = &location;
  [v8 getActivePortWithCompletion:v11];

  int64_t v9 = (int64_t)p_location[3];
  _Block_object_dispose(&location, 8);
  return v9;
}

- (id)_bagValueForKey:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100023E74;
  v23 = sub_100023E84;
  id v24 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100023E8C;
  uint64_t v14 = &unk_10004DAF0;
  uint64_t v15 = self;
  id v17 = &v19;
  id v8 = v6;
  id v16 = v8;
  unint64_t v18 = a4;
  dispatch_sync(dispatchQueue, &v11);
  int64_t v9 = +[AMSBagValue frozenBagValueWithKey:value:valueType:](AMSBagValue, "frozenBagValueWithKey:value:valueType:", v8, v20[5], a4, v11, v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void)_fetchBag
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int64_t v3 = [(SKUIOctaneBag *)self _activePort];
  int64_t v4 = v3;
  if (!self->_dictionary || v3 != self->_port)
  {
    if (v3)
    {
      self->_port = v3;
      dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
      id v6 = +[NSString stringWithFormat:@"http://localhost:%ld/WebObjects/MZInit.woa/wa/initiateSession", v4];
      objc_super v7 = +[NSURL URLWithString:v6];

      id v8 = +[NSURLRequest requestWithURL:v7 cachePolicy:4 timeoutInterval:10.0];
      objc_initWeak(&location, self);
      int64_t v9 = +[NSURLSession sharedSession];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10002428C;
      v12[3] = &unk_10004DB18;
      objc_copyWeak(&v14, &location);
      id v10 = v5;
      v13 = v10;
      v11 = [v9 dataTaskWithRequest:v8 completionHandler:v12];

      [v11 resume];
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10002DD64();
    }
  }
}

- (NSDate)expirationDate
{
  return self->expirationDate;
}

- (BOOL)isExpired
{
  return self->expired;
}

- (NSString)profile
{
  return self->profile;
}

- (NSString)profileVersion
{
  return self->profileVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->profileVersion, 0);
  objc_storeStrong((id *)&self->profile, 0);
  objc_storeStrong((id *)&self->expirationDate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end