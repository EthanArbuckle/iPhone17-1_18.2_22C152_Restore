@interface AXManagedAsset
+ (id)assetWithPolicy:(id)a3;
- (AXAssetPolicy)policy;
- (AXManagedAsset)initWithPolicy:(id)a3;
- (double)lastXCPActivityHandlerExecutionTime;
- (id)description;
- (void)_dequeueNextTask;
- (void)_enqueueTask:(id)a3;
- (void)checkInAssetUpdateXPCActivity;
- (void)enqueueAssetUpdateTaskWithContext:(id)a3;
- (void)enqueueCatalogRefreshTaskWithOverrideTimeout:(id)a3 forceCatalogRefresh:(BOOL)a4 context:(id)a5;
- (void)enqueueCleanseUnusedCompactResourcesTaskWithContext:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLastXCPActivityHandlerExecutionTime:(double)a3;
- (void)setPolicy:(id)a3;
@end

@implementation AXManagedAsset

+ (id)assetWithPolicy:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPolicy:v4];

  return v5;
}

- (AXManagedAsset)initWithPolicy:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AXManagedAsset;
  id v5 = [(AXManagedAsset *)&v21 init];
  v6 = v5;
  if (v5)
  {
    [(AXManagedAsset *)v5 setPolicy:v4];
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    id v9 = [v4 assetTypeSuffix];
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], v8);
    taskQueue = v6->_taskQueue;
    v6->_taskQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[NSMutableArray array];
    enqueuedTasks = v6->_enqueuedTasks;
    v6->_enqueuedTasks = (NSMutableArray *)v12;

    v6->_taskLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v6);
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, (dispatch_queue_t)v6->_taskQueue);
    taskQueueSignal = v6->_taskQueueSignal;
    v6->_taskQueueSignal = (OS_dispatch_source *)v14;

    v16 = v6->_taskQueueSignal;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006558;
    v18[3] = &unk_1000207E8;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v16, v18);
    dispatch_activate((dispatch_object_t)v6->_taskQueueSignal);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = [(AXManagedAsset *)self policy];
  id v5 = [v4 assetTypeSuffix];

  if (v3)
  {
    NSStringFromClass(v3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"<Unknown Class>";
  }
  v7 = +[NSString stringWithFormat:@"%@<%p> [%@]", v6, self, v5];

  return v7;
}

- (void)checkInAssetUpdateXPCActivity
{
  objc_initWeak(&location, self);
  xpc_object_t v3 = XPC_ACTIVITY_CHECK_IN;
  id v4 = [(AXManagedAsset *)self policy];
  id v5 = [v4 launchActivityIdentifier];
  v6 = (const char *)[v5 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100006778;
  handler[3] = &unk_1000208D8;
  objc_copyWeak(&v8, &location);
  handler[4] = self;
  xpc_activity_register(v6, v3, handler);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)enqueueCatalogRefreshTaskWithOverrideTimeout:(id)a3 forceCatalogRefresh:(BOOL)a4 context:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  dispatch_queue_t v10 = [AXCatalogRefreshTask alloc];
  v11 = [(AXManagedAsset *)self policy];
  uint64_t v12 = [(AXCatalogRefreshTask *)v10 initWithPolicy:v11 forceCatalogRefresh:v5 context:v8];

  [(AXCatalogRefreshTask *)v12 setOverrideTimeout:v9];
  [(AXManagedAsset *)self _enqueueTask:v12];
}

- (void)enqueueAssetUpdateTaskWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [AXUpdateAssetTask alloc];
  v6 = [(AXManagedAsset *)self policy];
  v7 = [(AXUpdateAssetTask *)v5 initWithPolicy:v6 context:v4];

  [(AXManagedAsset *)self _enqueueTask:v7];
}

- (void)enqueueCleanseUnusedCompactResourcesTaskWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [AXCleanseUnusedCompactResourcesTask alloc];
  v6 = [(AXManagedAsset *)self policy];
  v7 = [(AXCleanseUnusedCompactResourcesTask *)v5 initWithPolicy:v6 context:v4];

  [(AXManagedAsset *)self _enqueueTask:v7];
}

- (void)_enqueueTask:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AX_PERFORM_WITH_LOCK();
}

- (void)_dequeueNextTask
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100006E50;
  id v9 = sub_100006E60;
  id v10 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (void *)v6[5];
  if (v2)
  {
    objc_msgSend(v2, "taskBlock", _NSConcreteStackBlock, 3221225472, sub_100006E68, &unk_100020928, self, &v5);
    id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v3[2](v3, v6[5]);
  }
  _Block_object_dispose(&v5, 8);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100027790 == a6 && [v10 isEqualToString:@"finished"])
  {
    v13 = AXLogAssetDaemon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_source_t v14 = [(AXManagedAsset *)self policy];
      v15 = [v14 assetType];
      *(_DWORD *)buf = 138412546;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[AXManagedAsset: %@]: Notified task did finish: %@", buf, 0x16u);
    }
    dispatch_source_merge_data((dispatch_source_t)self->_taskQueueSignal, 1uLL);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)AXManagedAsset;
    [(AXManagedAsset *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (AXAssetPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (double)lastXCPActivityHandlerExecutionTime
{
  return self->_lastXCPActivityHandlerExecutionTime;
}

- (void)setLastXCPActivityHandlerExecutionTime:(double)a3
{
  self->_lastXCPActivityHandlerExecutionTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_activeTask, 0);
  objc_storeStrong((id *)&self->_enqueuedTasks, 0);
  objc_storeStrong((id *)&self->_taskQueueSignal, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
}

@end