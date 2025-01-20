@interface CPLCloudKitOperationsTracker
- (BOOL)isOperationBlocked:(id)a3;
- (CPLCloudKitOperationsTracker)init;
- (id)_bundleIdentifiersFromCKOperation:(id)a3;
- (id)_pendingTaskStatus;
- (id)status;
- (id)statusDictionary;
- (void)_emitLogForCurrentTasks;
- (void)cancelAllOperationsWithCompletionHandler:(id)a3;
- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3;
- (void)operation:(id)a3 updateContextWithBlock:(id)a4;
- (void)operation:(id)a3 updateProgress:(double)a4;
- (void)operationDidFinish:(id)a3;
- (void)operationDidProgressOneBatch:(id)a3;
- (void)operationHasBeenCancelled:(id)a3;
- (void)operationWillStart:(id)a3 forTask:(id)a4 withContext:(id)a5;
- (void)operationWillStart:(id)a3 forTask:(id)a4 withContext:(id)a5 bundleIdentifiers:(id)a6;
- (void)taskDidFinish:(id)a3;
- (void)taskHasBeenCancelled:(id)a3;
- (void)taskWillStart:(id)a3;
- (void)waitForAllTasksToFinishWithCompletionHandler:(id)a3;
@end

@implementation CPLCloudKitOperationsTracker

- (CPLCloudKitOperationsTracker)init
{
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudKitOperationsTracker;
  v2 = [(CPLCloudKitOperationsTracker *)&v11 init];
  if (v2)
  {
    v3 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cpl.cloudkit.operations", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tasks = v2->_tasks;
    v2->_tasks = v6;

    v8 = objc_alloc_init(CPLCloudKitOperationCounter);
    operationCounter = v2->_operationCounter;
    v2->_operationCounter = v8;
  }
  return v2;
}

- (id)_pendingTaskStatus
{
  if ([(NSMutableArray *)self->_tasks count])
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    dispatch_queue_t v4 = self->_tasks;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) trackingContext];
          v10 = [v9 statusPerOperationType];
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1000611B4;
          v15[3] = &unk_100277C50;
          id v16 = v3;
          [v10 enumerateKeysAndObjectsUsingBlock:v15];
        }
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100061258;
    v13[3] = &unk_100278890;
    objc_super v11 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"Pending CloudKit operations:"];
    v14 = v11;
    [v3 enumerateKeysAndObjectsUsingBlock:v13];
  }
  else
  {
    objc_super v11 = @"No pending CloudKit operations";
  }
  return v11;
}

- (void)_emitLogForCurrentTasks
{
  id v3 = sub_1000613C8();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4 && !_CPLSilentLogging)
  {
    id v5 = sub_1000613C8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [(CPLCloudKitOperationsTracker *)self _pendingTaskStatus];
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)taskWillStart:(id)a3
{
  id v5 = a3;
  id v6 = +[NSDate date];
  [(CPLCloudKitOperationCounter *)self->_operationCounter beginTask:v5];
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100061578;
  v13[3] = &unk_100275CC8;
  id v14 = v5;
  v15 = self;
  id v16 = v6;
  SEL v17 = a2;
  v8 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v19 = v8;
  v9 = queue;
  id v10 = v6;
  id v11 = v5;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v12);
}

- (id)_bundleIdentifiersFromCKOperation:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
  id v5 = [v3 configuration];
  id v6 = [v5 applicationBundleIdentifierOverrideForNetworkAttribution];

  if (v6) {
    [v4 addObject:v6];
  }
  int v7 = [v3 configuration];
  v8 = [v7 applicationBundleIdentifierOverrideForContainerAccess];

  if (v8) {
    [v4 addObject:v8];
  }
  v9 = [v4 allObjects];

  return v9;
}

- (void)operationWillStart:(id)a3 forTask:(id)a4 withContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CPLCloudKitOperationsTracker *)self _bundleIdentifiersFromCKOperation:v10];
  [(CPLCloudKitOperationsTracker *)self operationWillStart:v10 forTask:v9 withContext:v8 bundleIdentifiers:v11];
}

- (void)operationWillStart:(id)a3 forTask:(id)a4 withContext:(id)a5 bundleIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (CPLCloudKitOperationContext *)a5;
  id v14 = a6;
  id v15 = [v11 resolvedConfiguration];
  id v16 = +[NSDate date];
  objc_msgSend(v11, "cpl_setTask:", v12);
  if (!v13) {
    v13 = objc_alloc_init(CPLCloudKitOperationContext);
  }
  [(CPLCloudKitOperationContext *)v13 setOperation:v11];
  [(CPLCloudKitOperationContext *)v13 setBundleIdentifiers:v14];
  [(CPLCloudKitOperationContext *)v13 setStartDate:v16];
  queue = self->_queue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100061998;
  v25[3] = &unk_1002788B8;
  id v26 = v12;
  id v27 = v11;
  v28 = self;
  id v29 = v14;
  v30 = v13;
  SEL v31 = a2;
  long long v18 = v25;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v33 = v18;
  id v19 = queue;
  long long v20 = v13;
  id v21 = v14;
  id v22 = v11;
  id v23 = v12;
  dispatch_block_t v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v19, v24);
}

- (void)operationDidProgressOneBatch:(id)a3
{
  id v5 = a3;
  id v6 = +[NSDate date];
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100061CB8;
  v13[3] = &unk_100275CC8;
  void v13[4] = self;
  id v14 = v5;
  id v15 = v6;
  SEL v16 = a2;
  id v8 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v18 = v8;
  id v9 = queue;
  id v10 = v6;
  id v11 = v5;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v12);
}

- (BOOL)isOperationBlocked:(id)a3
{
  id v5 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100061E0C;
  v9[3] = &unk_100277478;
  v9[4] = self;
  id v10 = v5;
  id v11 = &v13;
  SEL v12 = a2;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

- (void)operation:(id)a3 updateProgress:(double)a4
{
  id v7 = a3;
  id v8 = v7;
  double v9 = 100.0;
  if (a4 <= 100.0) {
    double v9 = a4;
  }
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100061FD0;
  v15[3] = &unk_1002788E0;
  void v15[4] = self;
  id v16 = v7;
  SEL v17 = a2;
  double v18 = fmax(v9, 0.0);
  id v11 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v20 = v11;
  SEL v12 = queue;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v14);
}

- (void)operation:(id)a3 updateContextWithBlock:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  id v7 = v5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v11 = v7;
  id v8 = queue;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v9);
}

- (void)operationDidFinish:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000621B4;
  block[3] = &unk_100277218;
  id v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)operationHasBeenCancelled:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100062454;
  v11[3] = &unk_100277218;
  v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)taskHasBeenCancelled:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000625F8;
  v11[3] = &unk_100277218;
  SEL v13 = self;
  SEL v14 = a2;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v16 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)taskDidFinish:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100062788;
  v11[3] = &unk_100277218;
  SEL v13 = self;
  SEL v14 = a2;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v16 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)cancelAllOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100062A54;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062D10;
  v7[3] = &unk_100278908;
  v7[4] = self;
  BOOL v8 = a3;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v10 = v4;
  id v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (id)status
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_block_t v9 = sub_100060CE0;
  id v10 = sub_100060CF0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100062FB4;
  v5[3] = &unk_1002768A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)statusDictionary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_block_t v9 = sub_100060CE0;
  id v10 = sub_100060CF0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000631AC;
  v5[3] = &unk_1002768A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)waitForAllTasksToFinishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100063484;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064354;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTasksCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_operationCounter, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end