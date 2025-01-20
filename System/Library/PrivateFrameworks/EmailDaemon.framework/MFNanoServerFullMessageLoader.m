@interface MFNanoServerFullMessageLoader
- (BOOL)_isProtectedDataAvailable;
- (BOOL)isNetworkUp;
- (BOOL)isProtectedDataAvailable;
- (BOOL)isRetryScheduled;
- (MFNanoServerFullMessageLoader)init;
- (MFNanoServerFullMessageLoader)initWithCallbackQueue:(id)a3;
- (NSMutableArray)requests;
- (NSMutableDictionary)failedMessageIdsByRequest;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)privateQueue;
- (double)_exponentialBackoff;
- (double)currentBackoff;
- (id)_dequeueMessageIdsFromFirstRequestAvailable:(id *)a3;
- (id)_libraryMessagesKeyedByStore:(id)a3;
- (id)_loadFullMessageForMessageIds:(id)a3 isProtectedMessage:(BOOL *)a4 deletedMessagesIds:(id *)a5;
- (id)networkObserverId;
- (void)_dispatchOperation;
- (void)_enqueueMessageIds:(id)a3 forRequest:(id)a4;
- (void)_handleResultsAdded:(id)a3 deleted:(id)a4 forRequest:(id)a5 isProtectedMessage:(BOOL)a6;
- (void)_libraryAvailabilityChanged;
- (void)_networkStatusChanged;
- (void)_processPendingRequests;
- (void)_registerForLibraryAvailabilityNotifications;
- (void)_scheduleRetryForFailedMessageIds:(id)a3 failedRequest:(id)a4;
- (void)_setupNetworkObserver;
- (void)_suspendOrResumeOperationQueue;
- (void)attemptToCancelFullMessageLoadForMessageIds:(id)a3;
- (void)cancelAllPendingOperations;
- (void)dealloc;
- (void)loadFullMessagesForMessageIds:(id)a3 completion:(id)a4;
- (void)resetExponentialBackoff;
- (void)setCallbackQueue:(id)a3;
- (void)setCurrentBackoff:(double)a3;
- (void)setFailedMessageIdsByRequest:(id)a3;
- (void)setIsNetworkUp:(BOOL)a3;
- (void)setIsProtectedDataAvailable:(BOOL)a3;
- (void)setIsRetryScheduled:(BOOL)a3;
- (void)setNetworkObserverId:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRequests:(id)a3;
- (void)start;
@end

@implementation MFNanoServerFullMessageLoader

- (MFNanoServerFullMessageLoader)init
{
}

- (MFNanoServerFullMessageLoader)initWithCallbackQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFNanoServerFullMessageLoader;
  v6 = [(MFNanoServerFullMessageLoader *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MobileMail.NanoServerFullMessageLoader", v8);
    privateQueue = v7->_privateQueue;
    v7->_privateQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requests = v7->_requests;
    v7->_requests = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    failedMessageIdsByRequest = v7->_failedMessageIdsByRequest;
    v7->_failedMessageIdsByRequest = v13;

    v15 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v15;

    [(NSOperationQueue *)v7->_operationQueue setQualityOfService:25];
    [(NSOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:1];
    v7->_currentBackoff = -1.0;
    v17 = +[MFMailMessageLibrary defaultInstance];
    v7->_isProtectedDataAvailable = [v17 protectedDataAvailability] == 0;

    [(MFNanoServerFullMessageLoader *)v7 _suspendOrResumeOperationQueue];
    [(MFNanoServerFullMessageLoader *)v7 _setupNetworkObserver];
    [(MFNanoServerFullMessageLoader *)v7 _registerForLibraryAvailabilityNotifications];
  }

  return v7;
}

- (void)_registerForLibraryAvailabilityNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_libraryAvailabilityChanged" name:MailMessageLibraryDidBecomeAvailable object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_libraryAvailabilityChanged" name:MailMessageLibraryWillBecomeUnavailable object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_libraryAvailabilityChanged" name:MailMessageLibraryDidFinishReconciliation object:0];
}

- (void)_setupNetworkObserver
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008CD4C;
  v5[3] = &unk_10013A038;
  objc_copyWeak(&v6, &location);
  id v3 = +[MFNetworkController addNetworkObserverBlock:v5 queue:self->_privateQueue];
  id networkObserverId = self->_networkObserverId;
  self->_id networkObserverId = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  +[MFNetworkController removeNetworkObserver:self->_networkObserverId];
  v3.receiver = self;
  v3.super_class = (Class)MFNanoServerFullMessageLoader;
  [(MFNanoServerFullMessageLoader *)&v3 dealloc];
}

- (void)loadFullMessagesForMessageIds:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [(MFNanoServerFullMessageLoader *)self privateQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008CFA8;
    v13[3] = &unk_10013C458;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    id v9 = v7;
    dispatch_async(v8, v13);

    v10 = v14;
  }
  else
  {
    v11 = [(MFNanoServerFullMessageLoader *)self callbackQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008CF90;
    block[3] = &unk_10013D240;
    id v17 = v7;
    id v12 = v7;
    dispatch_async(v11, block);

    v10 = v17;
  }
}

- (void)attemptToCancelFullMessageLoadForMessageIds:(id)a3
{
  id v4 = a3;
  id v5 = [(MFNanoServerFullMessageLoader *)self privateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008D1A0;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelAllPendingOperations
{
  objc_super v3 = [(MFNanoServerFullMessageLoader *)self privateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D3EC;
  block[3] = &unk_100139C48;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)start
{
  id v3 = +[MFNetworkController sharedInstance];
  self->_isNetworkUp = [v3 isNetworkUp];
}

- (void)_processPendingRequests
{
  id v29 = 0;
  id v3 = [(MFNanoServerFullMessageLoader *)self _dequeueMessageIdsFromFirstRequestAvailable:&v29];
  id v22 = v29;
  if ([v3 count])
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 count];
      *(_DWORD *)buf = 134218242;
      id v32 = v5;
      __int16 v33 = 2112;
      id v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: Message header request started - message count: %ld - request: %@", buf, 0x16u);
    }

    unsigned __int8 v28 = 0;
    id v27 = 0;
    id v6 = [(MFNanoServerFullMessageLoader *)self _loadFullMessageForMessageIds:v3 isProtectedMessage:&v28 deletedMessagesIds:&v27];
    id v7 = v27;
    if ([v6 count] || objc_msgSend(v7, "count"))
    {
      id v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v3 count];
        id v10 = [v7 count];
        *(_DWORD *)buf = 134218498;
        id v32 = v9;
        __int16 v33 = 2048;
        id v34 = v10;
        __int16 v35 = 2112;
        id v36 = v22;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: Message header requests finished successfully - message count: %ld - deleted count: %ld - request: %@", buf, 0x20u);
      }

      v11 = [v6 allValues];
      id v12 = [v7 allObjects];
      [(MFNanoServerFullMessageLoader *)self _handleResultsAdded:v11 deleted:v12 forRequest:v22 isProtectedMessage:v28];
    }
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v6, "count") + (void)objc_msgSend(v7, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v3;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_super v19 = [v6 objectForKeyedSubscript:v18];
          if (v19)
          {
          }
          else if (([v7 containsObject:v18] & 1) == 0)
          {
            [v13 addObject:v18];
          }
        }
        id v15 = [v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v15);
    }

    if ([v13 count])
    {
      v20 = MFLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v14 count];
        *(_DWORD *)buf = 134218498;
        id v32 = v21;
        __int16 v33 = 2112;
        id v34 = v22;
        __int16 v35 = 2114;
        id v36 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#Nano MFNanoServerFullMessageLoader: Message header requests failed - message count: %ld - request: %@ - messagesIds: %{public}@", buf, 0x20u);
      }

      [(MFNanoServerFullMessageLoader *)self _scheduleRetryForFailedMessageIds:v13 failedRequest:v22];
    }
  }
}

- (id)_loadFullMessageForMessageIds:(id)a3 isProtectedMessage:(BOOL *)a4 deletedMessagesIds:(id *)a5
{
  id v40 = a3;
  unsigned __int8 v57 = [(MFNanoServerFullMessageLoader *)self _isProtectedDataAvailable];
  id v8 = +[MFMailMessageLibrary defaultInstance];
  v38 = a4;
  v39 = [v8 libraryMessagesForMessageIds:v40 protectedDataAvailable:&v57];

  unsigned __int8 v9 = [(MFNanoServerFullMessageLoader *)self _isProtectedDataAvailable];
  if (v57) {
    unsigned __int8 v10 = v9;
  }
  else {
    unsigned __int8 v10 = 0;
  }
  unsigned __int8 v57 = v10;
  id v11 = [v39 count];
  if (v11 != [v40 count])
  {
    id v12 = [objc_alloc((Class)NSMutableSet) initWithArray:v40];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v13 = v39;
    id v14 = [v13 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v54;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = [*(id *)(*((void *)&v53 + 1) + 8 * i) messageID];
          [v12 removeObject:v17];
        }
        id v14 = [v13 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v14);
    }

    if (a5) {
      *a5 = v12;
    }
    uint64_t v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000C2180((uint64_t)v12, buf, (uint64_t)[v12 count], v18);
    }
  }
  id v19 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v40, "count"));
  if (v57)
  {
    v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1000C213C(v20);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v21 = v39;
    id v22 = [v21 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v50;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v50 != v23) {
            objc_enumerationMutation(v21);
          }
          long long v25 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
          long long v26 = [v25 nanoMessage];
          id v27 = [v25 nanoMessageId];
          [v19 setObject:v26 forKeyedSubscript:v27];
        }
        id v22 = [v21 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v22);
    }

    BOOL *v38 = 1;
  }
  else
  {
    unsigned __int8 v28 = MFLogGeneral();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_1000C20F8(v28);
    }

    id v29 = +[MFPowerController sharedInstance];
    [v29 retainAssertionWithIdentifier:@"com.apple.mobileMail.nanoServerFullMessageLoader"];

    [(MFNanoServerFullMessageLoader *)self _libraryMessagesKeyedByStore:v39];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    v42 = long long v46 = 0u;
    id obj = [v42 allKeys];
    id v30 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v46;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v46 != v31) {
            objc_enumerationMutation(obj);
          }
          __int16 v33 = *(void **)(*((void *)&v45 + 1) + 8 * (void)k);
          id v34 = [v42 objectForKeyedSubscript:v33];
          __int16 v35 = [v33 _downloadHeadersForMessages:v34];

          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10008DF6C;
          v43[3] = &unk_10013D268;
          id v44 = v19;
          [v35 enumerateKeysAndObjectsUsingBlock:v43];
        }
        id v30 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v30);
    }

    BOOL *v38 = 0;
    id v36 = +[MFPowerController sharedInstance];
    [v36 releaseAssertionWithIdentifier:@"com.apple.mobileMail.nanoServerFullMessageLoader"];
  }

  return v19;
}

- (BOOL)_isProtectedDataAvailable
{
  v2 = self;
  id v3 = [(MFNanoServerFullMessageLoader *)self privateQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(MFNanoServerFullMessageLoader *)v2 privateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008E124;
  v6[3] = &unk_10013B160;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (id)_dequeueMessageIdsFromFirstRequestAvailable:(id *)a3
{
  id v5 = [(MFNanoServerFullMessageLoader *)self privateQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10008E2FC;
  v20 = sub_10008E30C;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10008E2FC;
  id v14 = sub_10008E30C;
  id v15 = 0;
  id v6 = [(MFNanoServerFullMessageLoader *)self privateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E314;
  block[3] = &unk_10013D290;
  void block[4] = self;
  void block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v6, block);

  *a3 = (id) v11[5];
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (void)_scheduleRetryForFailedMessageIds:(id)a3 failedRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFNanoServerFullMessageLoader *)self privateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E568;
  block[3] = &unk_10013ABC8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)_handleResultsAdded:(id)a3 deleted:(id)a4 forRequest:(id)a5 isProtectedMessage:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(MFNanoServerFullMessageLoader *)self privateQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008EB2C;
  v14[3] = &unk_10013A980;
  v14[4] = self;
  id v15 = v9;
  BOOL v17 = a6;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, v14);
}

- (void)_dispatchOperation
{
  id v3 = objc_alloc_init((Class)NSBlockOperation);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v3);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_10008F074;
  id v7 = &unk_10013D2B8;
  objc_copyWeak(&v8, &from);
  objc_copyWeak(&v9, &location);
  [v3 addExecutionBlock:&v4];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v3, v4, v5, v6, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_enqueueMessageIds:(id)a3 forRequest:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 enqueueMessageIds:v7]) {
    [(MFNanoServerFullMessageLoader *)self _dispatchOperation];
  }
}

- (void)_networkStatusChanged
{
  id v3 = +[MFNetworkController sharedInstance];
  self->_isNetworkUp = [v3 isNetworkUp];

  [(MFNanoServerFullMessageLoader *)self _suspendOrResumeOperationQueue];
}

- (void)_suspendOrResumeOperationQueue
{
  if (self->_isNetworkUp || self->_isProtectedDataAvailable)
  {
    p_operationQueue = &self->_operationQueue;
    if (![(NSOperationQueue *)self->_operationQueue isSuspended]) {
      return;
    }
    if (![(NSMutableArray *)self->_requests count])
    {
      uint64_t v6 = 0;
      goto LABEL_10;
    }
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(NSMutableArray *)self->_requests count];
      int v8 = 134217984;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: OperationQueue resumed - Request count: %ld", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v6 = 0;
LABEL_8:

LABEL_10:
    [(NSOperationQueue *)*p_operationQueue setSuspended:v6];
    return;
  }
  p_operationQueue = &self->_operationQueue;
  if (![(NSOperationQueue *)self->_operationQueue isSuspended])
  {
    if (![(NSMutableArray *)self->_requests count])
    {
      uint64_t v6 = 1;
      goto LABEL_10;
    }
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(NSMutableArray *)self->_requests count];
      int v8 = 134217984;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: OperationQueue suspended - Request count: %ld", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v6 = 1;
    goto LABEL_8;
  }
}

- (double)_exponentialBackoff
{
  double result = self->_currentBackoff;
  double v3 = 0.0;
  if (result >= 0.0)
  {
    double v3 = 10.0;
    if (result != 0.0)
    {
      if (result >= 3600.0) {
        return result;
      }
      double v3 = fmin(result + result, 3600.0);
    }
  }
  self->_currentBackoff = v3;
  return v3;
}

- (void)resetExponentialBackoff
{
  self->_currentBackoff = -1.0;
  [(MFNanoServerFullMessageLoader *)self setIsRetryScheduled:0];
}

- (void)_libraryAvailabilityChanged
{
  privateQueue = self->_privateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F438;
  block[3] = &unk_100139C48;
  void block[4] = self;
  dispatch_async(privateQueue, block);
}

- (id)_libraryMessagesKeyedByStore:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "mailbox", (void)v14);
        id v11 = [v10 store];

        if (v11)
        {
          id v12 = [v4 objectForKeyedSubscript:v11];
          if (!v12)
          {
            id v12 = objc_alloc_init((Class)NSMutableArray);
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
          [v12 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v4;
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (id)networkObserverId
{
  return self->_networkObserverId;
}

- (void)setNetworkObserverId:(id)a3
{
}

- (BOOL)isProtectedDataAvailable
{
  return self->_isProtectedDataAvailable;
}

- (void)setIsProtectedDataAvailable:(BOOL)a3
{
  self->_isProtectedDataAvailable = a3;
}

- (BOOL)isNetworkUp
{
  return self->_isNetworkUp;
}

- (void)setIsNetworkUp:(BOOL)a3
{
  self->_isNetworkUp = a3;
}

- (NSMutableDictionary)failedMessageIdsByRequest
{
  return self->_failedMessageIdsByRequest;
}

- (void)setFailedMessageIdsByRequest:(id)a3
{
}

- (BOOL)isRetryScheduled
{
  return self->_isRetryScheduled;
}

- (void)setIsRetryScheduled:(BOOL)a3
{
  self->_isRetryScheduled = a3;
}

- (double)currentBackoff
{
  return self->_currentBackoff;
}

- (void)setCurrentBackoff:(double)a3
{
  self->_currentBackoff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedMessageIdsByRequest, 0);
  objc_storeStrong(&self->_networkObserverId, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

@end