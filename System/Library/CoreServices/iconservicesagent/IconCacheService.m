@interface IconCacheService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ClearCacheOperation)clearOperation;
- (ISMutableIconCache)iconCache;
- (IconCacheService)initWithServiceName:(id)a3;
- (NSString)serviceName;
- (NSXPCListener)listener;
- (OS_dispatch_source)clearTimer;
- (OS_dispatch_workloop)workLoop;
- (id)generateStoreUnitWithRequest:(id)a3 validationToken:(id *)a4;
- (os_unfair_lock_s)clearOperationLock;
- (void)clearCache;
- (void)clearCachedItemsForBundeID:(id)a3 reply:(id)a4;
- (void)fetchCacheConfigurationWithReply:(id)a3;
- (void)generateImageWithRequest:(id)a3 reply:(id)a4;
- (void)scheduleCacheOperation:(unint64_t)a3;
- (void)start;
@end

@implementation IconCacheService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = _ISDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100004D38();
  }

  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ISIconCacheServiceProtocol];
  [v5 setExportedInterface:v7];
  [v5 setExportedObject:self];
  [v5 setInterruptionHandler:&stru_1000083E8];
  [v5 setInvalidationHandler:&stru_100008408];
  [v5 resume];

  return 1;
}

- (void)fetchCacheConfigurationWithReply:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = [(IconCacheService *)self iconCache];
  v6 = [v5 cacheURL];
  v7 = [v6 path];

  id v8 = v7;
  v9 = (const char *)[v8 UTF8String];
  if (!realpath_DARWIN_EXTSN(v9, v18))
  {
    v10 = _ISDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Failed to get the real path for: %s", (uint8_t *)&v16, 0xCu);
    }
  }
  uint64_t v11 = sandbox_extension_issue_file();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = +[NSString stringWithUTF8String:v11];
    free(v12);
  }
  else
  {
    v13 = 0;
  }
  id v14 = objc_alloc_init((Class)ISIconCacheConfiguration);
  v15 = +[NSURL fileURLWithPath:v8];
  [v14 setUrl:v15];

  [v14 setSandboxExtension:v13];
  v4[2](v4, v14);
}

- (ISMutableIconCache)iconCache
{
  return (ISMutableIconCache *)objc_getProperty(self, a2, 56, 1);
}

- (IconCacheService)initWithServiceName:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IconCacheService;
  id v5 = [(IconCacheService *)&v24 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = v6;

    dispatch_workloop_t v8 = dispatch_workloop_create("iconservicesagent workloop");
    workLoop = v5->_workLoop;
    v5->_workLoop = (OS_dispatch_workloop *)v8;

    v10 = +[ISDefaults sharedInstance];
    uint64_t v11 = [v10 cacheURL];

    objc_initWeak(&location, v5);
    v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    dispatch_source_set_timer(v12, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_100003454;
    v21 = &unk_1000083A8;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v12, &v18);
    objc_storeStrong((id *)&v5->_clearTimer, v12);
    dispatch_resume(v12);
    clearOperation = v5->_clearOperation;
    v5->_clearOperation = 0;

    v5->_clearOperationLock._os_unfair_lock_opaque = 0;
    id v14 = [ISMutableIconCache alloc];
    v15 = -[ISMutableIconCache initWithURL:](v14, "initWithURL:", v11, v18, v19, v20, v21);
    iconCache = v5->_iconCache;
    v5->_iconCache = v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)start
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_listener)
  {
    v2 = [(IconCacheService *)obj serviceName];

    if (v2)
    {
      id v3 = objc_alloc((Class)NSXPCListener);
      id v4 = [(IconCacheService *)obj serviceName];
      id v5 = (NSXPCListener *)[v3 initWithMachServiceName:v4];
      listener = obj->_listener;
      obj->_listener = v5;
    }
    else
    {
      uint64_t v7 = +[NSXPCListener anonymousListener];
      id v4 = obj->_listener;
      obj->_listener = (NSXPCListener *)v7;
    }

    -[NSXPCListener setDelegate:](obj->_listener, "setDelegate:");
    [(NSXPCListener *)obj->_listener resume];
  }
  objc_sync_exit(obj);
}

- (void)scheduleCacheOperation:(unint64_t)a3
{
  id v4 = [[ClearCacheOperation alloc] initWithCache:self->_iconCache operationType:a3];
  id v5 = _ISDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Scheduling: %@ ", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_lock(&self->_clearOperationLock);
  clearOperation = self->_clearOperation;
  self->_clearOperation = v4;
  uint64_t v7 = v4;

  os_unfair_lock_unlock(&self->_clearOperationLock);
  dispatch_source_set_timer((dispatch_source_t)self->_clearTimer, 0x3B9ACA00uLL, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
}

- (void)clearCache
{
  p_clearOperationLock = &self->_clearOperationLock;
  os_unfair_lock_lock(&self->_clearOperationLock);
  id v4 = self->_clearOperation;
  clearOperation = self->_clearOperation;
  self->_clearOperation = 0;

  os_unfair_lock_unlock(p_clearOperationLock);
  if (v4)
  {
    v6 = _ISDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100004CD0();
    }

    [(ClearCacheOperation *)v4 run];
  }
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_workloop)workLoop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_source)clearTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (os_unfair_lock_s)clearOperationLock
{
  return self->_clearOperationLock;
}

- (ClearCacheOperation)clearOperation
{
  return (ClearCacheOperation *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearOperation, 0);
  objc_storeStrong((id *)&self->_clearTimer, 0);
  objc_storeStrong((id *)&self->_workLoop, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_storeIndex, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (void)generateImageWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)os_transaction_create();
  v9 = +[NSXPCConnection currentConnection];
  unsigned int v10 = [v9 processIdentifier];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AB8;
  block[3] = &unk_100008430;
  unsigned int v21 = v10;
  id v17 = v6;
  v18 = self;
  id v19 = v8;
  id v20 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v15 = [(IconCacheService *)self workLoop];
  +[NSXPCConnection _handoffCurrentReplyToQueue:v15 block:v14];
}

- (void)clearCachedItemsForBundeID:(id)a3 reply:(id)a4
{
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (a3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(IconCacheService *)self scheduleCacheOperation:v6];
  v7[2](v7, 1, 0);
}

- (id)generateStoreUnitWithRequest:(id)a3 validationToken:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 icon];
  int v8 = [v6 imageDescriptor];
  v33 = [v8 digest];
  id v34 = 0;
  v9 = [v6 generateImageReturningRecordIdentifiers:&v34];

  id v32 = v34;
  unsigned int v10 = [v9 bitmapData];
  id v11 = [v7 digest];
  id v12 = [v9 validationToken];
  *a4 = v12;
  id v13 = [v12 bytes];
  dispatch_block_t v14 = _ISDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if (v13) {
      sub_100004F80((uint64_t)v13, (uint64_t)buf, (uint64_t)v7, v14);
    }
    else {
      sub_100004F18(buf, (uint64_t)v7, v14);
    }
  }

  v15 = [(IconCacheService *)self iconCache];
  int v16 = [v15 store];
  id v17 = [v16 addUnitWithData:v10];

  if ([v17 isValid])
  {
    [v8 scale];
    unsigned int v19 = v18;
    [v9 iconSize];
    uint64_t v21 = v20;
    [v9 minimumSize];
    uint64_t v23 = v22;
    [v9 iconSize];
    double v25 = v24;
    unsigned int v26 = [v9 largest];
    int v52 = 0;
    if (v26) {
      double v25 = 1.79769313e308;
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    *(_OWORD *)buf = 0u;
    *((void *)&v47 + 1) = v19;
    *(void *)&long long v47 = v21;
    [v33 getUUIDBytes:(char *)&v47 + 12];
    *(void *)&long long v46 = v23;
    *((double *)&v46 + 1) = v25;
    [v11 getUUIDBytes:buf];
    v27 = [v17 UUID];
    [v27 getUUIDBytes:(char *)&v48 + 12];

    [*a4 getBytes:(char *)&v49 + 12 length:40];
    v28 = [(IconCacheService *)self iconCache];
    [v28 registerRecordIdentifiers:v32 asSourceForUnit:v17];

    v29 = [(IconCacheService *)self iconCache];
    v30 = [v29 mutableStoreIndex];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000042B8;
    v35[3] = &unk_100008480;
    v35[4] = self;
    long long v41 = v49;
    long long v42 = v50;
    long long v43 = v51;
    int v44 = v52;
    long long v37 = *(_OWORD *)buf;
    long long v38 = v46;
    long long v39 = v47;
    long long v40 = v48;
    id v36 = v11;
    [v30 performBlock:v35];
  }

  return v17;
}

@end