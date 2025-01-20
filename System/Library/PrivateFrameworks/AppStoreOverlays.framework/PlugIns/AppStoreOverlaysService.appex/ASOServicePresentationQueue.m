@interface ASOServicePresentationQueue
+ (OS_os_log)log;
- (ASOServicePresentationQueue)init;
- (ASOServicePresentationQueueDelegate)delegate;
- (NSOperationQueue)queue;
- (OS_dispatch_queue)accessQueue;
- (void)queueDismissOverlay;
- (void)queuePresentOverlayWithConfiguration:(id)a3 delegate:(id)a4;
- (void)removePendingPresentationOperations;
- (void)setAccessQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ASOServicePresentationQueue

+ (OS_os_log)log
{
  if (qword_10002CB50 != -1) {
    dispatch_once(&qword_10002CB50, &stru_100025260);
  }
  v2 = (void *)qword_10002CB58;

  return (OS_os_log *)v2;
}

- (ASOServicePresentationQueue)init
{
  v9.receiver = self;
  v9.super_class = (Class)ASOServicePresentationQueue;
  v2 = [(ASOServicePresentationQueue *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppStoreOverlays.ViewService.presentation", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v6;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_queue setSuspended:0];
  }
  return v2;
}

- (void)removePendingPresentationOperations
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(ASOServicePresentationQueue *)self queue];
  v3 = [v2 operations];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v8 isExecuting] & 1) == 0
          && ([v8 isCancelled] & 1) == 0)
        {
          [v8 cancel];
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)queuePresentOverlayWithConfiguration:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[ASOServicePresentationQueue log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Queuing overlay presentation", buf, 2u);
  }

  long long v9 = [(ASOServicePresentationQueue *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BAA0;
  block[3] = &unk_100024EA0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)queueDismissOverlay
{
  v3 = +[ASOServicePresentationQueue log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Queuing overlay dismiss", buf, 2u);
  }

  id v4 = [(ASOServicePresentationQueue *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BBF4;
  block[3] = &unk_100025288;
  block[4] = self;
  dispatch_async(v4, block);
}

- (ASOServicePresentationQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASOServicePresentationQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end