@interface _GCGenericDeviceDB
- (BOOL)_onqueue_updateConfigurationBundles;
- (_GCGenericDeviceDB)init;
- (_GCGenericDeviceDB)initWithProvider:(id)a3;
- (id)configurationBundles;
- (id)hasModelForDevice:(id)a3;
- (id)modelForDevice:(id)a3;
- (id)preparedModelForDevice:(id)a3;
- (id)preparedModelForDevice:(id)a3 error:(id *)a4;
- (void)_configurationBundlesDidChange:(id)a3;
- (void)_onqueue_loadConfigurationBundlesIfNeeded;
- (void)_onqueue_updateConfigurationBundles;
- (void)dealloc;
- (void)hasModelForDevice:(id)a3 reply:(id)a4;
- (void)preparedModelForDevice:(id)a3 reply:(id)a4;
@end

@implementation _GCGenericDeviceDB

- (void)hasModelForDevice:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, BOOL, void))a4;
  v8 = _os_activity_create(&dword_20AD04000, "[_GCGenericDeviceDB/XPC] Has Model For Device", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(_GCGenericDeviceDB *)self modelForDevice:v6];
  v7[2](v7, v9 != 0, 0);

  os_activity_scope_leave(&v10);
}

- (void)preparedModelForDevice:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = _os_activity_create(&dword_20AD04000, "[_GCGenericDeviceDB/XPC] Model For Device", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v12 = 0;
  v9 = [(_GCGenericDeviceDB *)self preparedModelForDevice:v6 error:&v12];
  id v10 = v12;
  v11 = v10;
  if (!v9 && v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    -[_GCGenericDeviceDB(XPC) preparedModelForDevice:reply:]((uint64_t)v11);
  }
  v7[2](v7, v9, v11);

  os_activity_scope_leave(&state);
}

- (_GCGenericDeviceDB)initWithProvider:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_GCGenericDeviceDB;
  id v5 = [(_GCGenericDeviceDB *)&v29 init];
  dispatch_workloop_t v6 = dispatch_workloop_create("Workloop.GenericDeviceDB");
  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  dispatch_queue_t v8 = dispatch_queue_create("GenericDevice.DB", 0);
  v9 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v8;

  uint64_t v10 = objc_opt_new();
  v11 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v10;

  objc_initWeak(&location, v5);
  id v12 = +[NSNotificationCenter defaultCenter];
  id v13 = v4;
  v14 = (objc_class *)objc_opt_class();
  v15 = GCLookupService(v13, v14, 0, 1);

  uint64_t v16 = [v15 configurationBundleLocatorForType:0x26BED8440];
  v17 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v16;

  dispatch_source_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, *((dispatch_queue_t *)v5 + 1));
  v19 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v18;

  v20 = *((void *)v5 + 4);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __39___GCGenericDeviceDB_initWithProvider___block_invoke;
  handler[3] = &unk_26BEC49A8;
  objc_copyWeak(&v27, &location);
  dispatch_source_set_event_handler(v20, handler);
  dispatch_activate(*((dispatch_object_t *)v5 + 4));
  [v12 addObserver:v5 selector:sel__configurationBundlesDidChange_ name:0x26BEDB500 object:*((void *)v5 + 3)];
  objc_destroyWeak(&v27);

  v21 = *((void *)v5 + 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39___GCGenericDeviceDB_initWithProvider___block_invoke_3;
  block[3] = &unk_26BEC49A8;
  objc_copyWeak(&v25, &location);
  dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, -10, block);
  dispatch_async(v21, v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return (_GCGenericDeviceDB *)v5;
}

- (_GCGenericDeviceDB)init
{
  return 0;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:0x26BEDB500 object:self->_configurationBundleLocator];

  dispatch_source_cancel((dispatch_source_t)self->_configurationBundleLocatorUpdatedSource);
  v4.receiver = self;
  v4.super_class = (Class)_GCGenericDeviceDB;
  [(_GCGenericDeviceDB *)&v4 dealloc];
}

- (id)configurationBundles
{
  v2 = objc_getProperty(self, a2, 40, 1);
  v3 = [v2 configurationBundles];

  return v3;
}

- (void)_onqueue_loadConfigurationBundlesIfNeeded
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v2 = [*(id *)(a1 + 40) configurationBundles];
    uint64_t v3 = [v2 count];

    if (!v3)
    {
      objc_msgSend((id)a1, "_onqueue_updateConfigurationBundles");
    }
  }
}

- (BOOL)_onqueue_updateConfigurationBundles
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_super v4 = [(_GCConfigurationBundleLocator *)self->_configurationBundleLocator fetchBundles];
  if ([v4 waitUntilFinished] == 1)
  {
    id v5 = _gc_log_devicedb();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_GCGenericDeviceDB *)v4 _onqueue_updateConfigurationBundles];
    }
    char v6 = 0;
  }
  else
  {
    id v5 = [v4 result];
    v7 = [(_GCDeviceOnDiskDB *)self->_onDiskDB configurationBundles];
    char v8 = [v7 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      v9 = [[_GCDeviceOnDiskDB alloc] initWithBundles:v5];
      uint64_t v10 = _gc_log_devicedb();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        [(_GCGenericDeviceDB *)(uint64_t)v9 _onqueue_updateConfigurationBundles];
      }

      objc_setProperty_atomic(self, a2, v9, 40);
    }
    char v6 = v8 ^ 1;
  }

  return v6;
}

- (void)_configurationBundlesDidChange:(id)a3
{
}

- (id)modelForDevice:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __37___GCGenericDeviceDB_modelForDevice___block_invoke;
  block[3] = &unk_26BEC3CA8;
  void block[4] = self;
  id v6 = a3;
  dispatch_async_and_wait(queue, block);
  v7 = objc_getProperty(self, a2, 40, 1);
  char v8 = [v7 bestModelMatchingDevice:v6];

  return v8;
}

- (id)preparedModelForDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(_GCGenericDeviceDB *)self modelForDevice:v6];
  if (v7)
  {
    char v8 = [v6 elements];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__17;
    dispatch_block_t v22 = __Block_byref_object_dispose__17;
    id v23 = 0;
    v9 = [v7 driver];
    uint64_t v10 = [v9 elements];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __51___GCGenericDeviceDB_preparedModelForDevice_error___block_invoke;
    v15[3] = &unk_26BEC5258;
    id v11 = v8;
    id v16 = v11;
    v17 = &v18;
    [v10 enumerateObjectsUsingBlock:v15];

    id v12 = (void *)v19[5];
    if (v12)
    {
      id v13 = 0;
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      id v13 = v7;
    }

    _Block_object_dispose(&v18, 8);
    goto LABEL_9;
  }
  if (a4)
  {
    v24[0] = NSLocalizedDescriptionKey;
    v24[1] = NSLocalizedFailureReasonErrorKey;
    v25[0] = @"Error retrieving model for device.";
    v25[1] = @"No compatible model found.";
    id v11 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 2, v11);
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

- (id)hasModelForDevice:(id)a3
{
  uint64_t v3 = [(_GCGenericDeviceDB *)self modelForDevice:a3];
  BOOL v4 = v3 != 0;

  id v5 = +[NSNumber numberWithBool:v4];
  id v6 = +[GCFuture futureWithResult:v5];

  return v6;
}

- (id)preparedModelForDevice:(id)a3
{
  id v7 = 0;
  uint64_t v3 = [(_GCGenericDeviceDB *)self preparedModelForDevice:a3 error:&v7];
  id v4 = v7;
  if (v3) {
    +[GCFuture futureWithResult:v3];
  }
  else {
  id v5 = +[GCFuture futureWithError:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDiskDB, 0);
  objc_storeStrong((id *)&self->_configurationBundleLocatorUpdatedSource, 0);
  objc_storeStrong((id *)&self->_configurationBundleLocator, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_workloop, 0);
}

- (void)_onqueue_updateConfigurationBundles
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20AD04000, a2, OS_LOG_TYPE_DEBUG, "New DB: %@.", (uint8_t *)&v2, 0xCu);
}

@end