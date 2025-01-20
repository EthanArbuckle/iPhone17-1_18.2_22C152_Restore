@interface NWURLSession
+ (void)_disableAppSSO;
+ (void)_strictTrustEvaluate:(id)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)initialize;
- (BOOL)isKindOfClass:(Class)a3;
- (NSOperationQueue)delegateQueue;
- (NSString)sessionDescription;
- (NSURLSessionConfiguration)configuration;
- (NSURLSessionDelegate)delegate;
- (NWURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (OS_nw_context)_networkContext;
- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4;
- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4;
- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_uploadTaskWithRequest:(id)a3 fromData:(id)a4 delegate:(id)a5 completionHandler:(id)a6;
- (id)_uploadTaskWithRequest:(id)a3 fromFile:(id)a4 delegate:(id)a5 completionHandler:(id)a6;
- (id)dataTaskWithRequest:(id)a3;
- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)dataTaskWithURL:(id)a3;
- (id)dataTaskWithURL:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithRequest:(id)a3;
- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithResumeData:(id)a3;
- (id)downloadTaskWithResumeData:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithURL:(id)a3;
- (id)downloadTaskWithURL:(id)a3 completionHandler:(id)a4;
- (id)preparedRequestFromRequest:(void *)a3 bodyInfo:;
- (id)streamTaskWithHostName:(id)a3 port:(int64_t)a4;
- (id)streamTaskWithNetService:(id)a3;
- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4;
- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4 completionHandler:(id)a5;
- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4;
- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4 completionHandler:(id)a5;
- (id)uploadTaskWithStreamedRequest:(id)a3;
- (id)webSocketTaskWithRequest:(id)a3;
- (id)webSocketTaskWithURL:(id)a3;
- (id)webSocketTaskWithURL:(id)a3 protocols:(id)a4;
- (void)checkForCompletion;
- (void)finishTasksAndInvalidate;
- (void)flushWithCompletionHandler:(id)a3;
- (void)getAllTasksWithCompletionHandler:(id)a3;
- (void)getTasksWithCompletionHandler:(id)a3;
- (void)invalidateAndCancel;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setSessionDescription:(id)a3;
- (void)taskCompleted:(os_unfair_lock_s *)a1;
- (void)taskStarted:(os_unfair_lock_s *)a1;
- (void)teardownAllConnections;
- (void)withLock:(os_unfair_lock_s *)a1;
@end

@implementation NWURLSession

void __26__NWURLSession_initialize__block_invoke()
{
  unsigned int outCount = 0;
  v0 = (objc_class *)objc_opt_class();
  v1 = class_copyMethodList(v0, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      if ((+[NWURLSession instancesRespondToSelector:method_getName(v1[i])] & 1) == 0)
      {
        Implementation = method_getImplementation(v1[i]);
        v4 = (char *)dyld_image_path_containing_address();
        if (v4)
        {
          v5 = v4;
          if (!strstr(v4, "CFNetwork.framework") && !strstr(v5, "FoundationNetworking.framework"))
          {
            Name = method_getName(v1[i]);
            TypeEncoding = method_getTypeEncoding(v1[i]);
            v8 = (objc_class *)objc_opt_class();
            class_addMethod(v8, Name, Implementation, TypeEncoding);
          }
        }
      }
    }
  }
  free(v1);
  v9 = (objc_class *)objc_opt_class();
  v10 = class_copyMethodList(v9, &outCount);
  if (outCount)
  {
    for (unint64_t j = 0; j < outCount; ++j)
    {
      if ((+[NWURLSessionTask instancesRespondToSelector:method_getName(v10[j])] & 1) == 0)
      {
        v12 = method_getImplementation(v10[j]);
        v13 = (char *)dyld_image_path_containing_address();
        if (v13)
        {
          v14 = v13;
          if (!strstr(v13, "CFNetwork.framework") && !strstr(v14, "FoundationNetworking.framework"))
          {
            v15 = method_getName(v10[j]);
            v16 = method_getTypeEncoding(v10[j]);
            v17 = (objc_class *)objc_opt_class();
            class_addMethod(v17, v15, v12, v16);
          }
        }
      }
    }
  }
  free(v10);
}

- (NWURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v58.receiver = self;
  v58.super_class = (Class)NWURLSession;
  v11 = [(NWURLSession *)&v58 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_31;
  }
  uuid_generate_random(v11->uuid);
  v12->lock._os_unfair_lock_opaque = 0;
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.NWURLSession", 0);
  queue = v12->_queue;
  v12->_queue = (OS_dispatch_queue *)v13;

  BOOL v15 = -[NWConcrete_nw_context initWithIdentifier:]([NWConcrete_nw_context alloc], "NWURLSession");
  context = v12->_context;
  v12->_context = (OS_nw_context *)v15;

  nw_context_set_isolate_protocol_cache(v12->_context, 1);
  nw_context_set_privacy_level(v12->_context, [v8 _loggingPrivacyLevel]);
  nw_context_activate(v12->_context);
  nw_queue_context_target_dispatch_queue(v12->_context, v12->_queue);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v17 = [v8 _proxyConfigurations];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v55 != v20) {
          objc_enumerationMutation(v17);
        }
        nw_context_add_proxy(v12->_context, *(void **)(*((void *)&v54 + 1) + 8 * i));
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v19);
  }

  v51 = v8;
  if (v8)
  {
    uint64_t v22 = [v8 copy];
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  }
  internalConfiguration = v12->_internalConfiguration;
  v12->_internalConfiguration = (NSURLSessionConfiguration *)v22;

  v24 = [NWURLSessionDelegateWrapper alloc];
  v25 = v12->_queue;
  v26 = v12;
  v27 = v25;
  id v53 = v9;
  id v28 = v9;
  id v52 = v10;
  id v29 = v10;
  if (v24)
  {
    v59.receiver = v24;
    v59.super_class = (Class)NWURLSessionDelegateWrapper;
    id v30 = [(NWURLSession *)&v59 init];
    v24 = (NWURLSessionDelegateWrapper *)v30;
    if (v30)
    {
      *((void *)v30 + 4) = v26;
      objc_storeStrong((id *)v30 + 5, v25);
      objc_storeStrong((id *)&v24->_wrappedDelegate, a4);
      v31 = [NWURLSessionDelegateQueue alloc];
      id v32 = v29;
      if (!v31) {
        goto LABEL_21;
      }
      v60.receiver = v31;
      v60.super_class = (Class)NWURLSessionDelegateQueue;
      id v33 = [(NWURLSession *)&v60 init];
      v31 = (NWURLSessionDelegateQueue *)v33;
      if (!v33) {
        goto LABEL_21;
      }
      objc_storeStrong((id *)v33 + 2, a5);
      id v34 = [MEMORY[0x1E4F28F08] mainQueue];

      if (v34 == v32)
      {
        uint64_t v38 = getMainQueue();
        dispatchQueue = v31->__dispatchQueue;
        v31->__dispatchQueue = (OS_dispatch_queue *)v38;
      }
      else
      {
        if (v32)
        {
LABEL_21:

          delegateQueueWrapper = v24->_delegateQueueWrapper;
          v24->_delegateQueueWrapper = v31;

          goto LABEL_22;
        }
        dispatchQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v36 = dispatch_queue_create("com.apple.NSURLSession-delegate", dispatchQueue);
        v37 = v31->__dispatchQueue;
        v31->__dispatchQueue = (OS_dispatch_queue *)v36;
      }
      goto LABEL_21;
    }
  }
LABEL_22:

  delegateWrapper = v26->_delegateWrapper;
  v26->_delegateWrapper = v24;

  uint64_t v41 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  weakUnresumedTasks = v26->_weakUnresumedTasks;
  v26->_weakUnresumedTasks = (NSHashTable *)v41;

  v43 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  runningTasks = v26->_runningTasks;
  v26->_runningTasks = v43;

  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  trustExceptions = v26->_trustExceptions;
  v26->_trustExceptions = v45;

  id v8 = v51;
  id v10 = v52;
  id v9 = v53;
  if ([v51 _disableAPWakeOnIdleConnections])
  {
    v60.receiver = 0;
    LODWORD(v59.receiver) = 0;
    io_connect_t v47 = IORegisterForSystemPower(v26, (IONotificationPortRef *)&v60, (IOServiceInterestCallback)_systemPowerNotificationsCallback, (io_object_t *)&v59);
    v26->_rootPort = v47;
    if (v47)
    {
      receiver = (IONotificationPort *)v60.receiver;
      v26->_notifyPortRef = (IONotificationPort *)v60.receiver;
      v26->_notifierObject = v59.receiver;
      IONotificationPortSetDispatchQueue(receiver, (dispatch_queue_t)v12->_queue);
    }
    else
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      v49 = (id)gurlLogObj;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1830D4000, v49, OS_LOG_TYPE_ERROR, "Failed to register power notifications", buf, 2u);
      }
    }
    objc_storeStrong(&v26->_retainedSelf, v12);
  }
LABEL_31:

  return v12;
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_44205);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_trustExceptions, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_weakUnresumedTasks, 0);
  objc_storeStrong((id *)&self->_internalConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionDescription, 0);
  objc_storeStrong((id *)&self->_connectionProxyArray, 0);
  objc_storeStrong((id *)&self->_altSvcStorage, 0);
  objc_storeStrong((id *)&self->_URLCredentialCache, 0);
  objc_storeStrong((id *)&self->_URLCredentialStorage, 0);

  objc_storeStrong((id *)&self->_HTTPCookieStorage, 0);
}

- (void)setSessionDescription:(id)a3
{
}

- (NSString)sessionDescription
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (OS_nw_context)_networkContext
{
  if (self) {
    self = (NWURLSession *)self->_context;
  }
  return (OS_nw_context *)self;
}

- (id)_downloadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionDownloadTask created with nil resume data" userInfo:0];
    objc_exception_throw(v23);
  }
  v11 = v10;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__44102;
  id v33 = __Block_byref_object_dispose__44103;
  id v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__NWURLSession__downloadTaskWithResumeData_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E5241D78;
  v24[4] = self;
  id v12 = v8;
  id v25 = v12;
  id v13 = v11;
  id v27 = v13;
  id v28 = &v29;
  id v14 = v9;
  id v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  uint64_t v15 = v30[5];
  if (v15)
  {
    uint64_t v16 = 248;
    if (!*(void *)(v15 + 248)) {
      uint64_t v16 = 240;
    }
    v17 = *(id *)(v15 + v16);
    if (v17)
    {
      id v18 = (id)v30[5];
      uint64_t v20 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didCreateTask];
      [v20 URLSession:v17[4] didCreateTask:v18];
    }
  }
  else
  {
    v17 = 0;
  }

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

void __71__NWURLSession__downloadTaskWithResumeData_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionDownloadTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v19);
  }
  +[NWURLSessionDownloadResumeInfo infoWithResumeData:]((uint64_t)NWURLSessionDownloadResumeInfo, *(void **)(a1 + 40));
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    uint64_t v20 = v3;
    v4 = [NWURLSessionResponseConsumerDownload alloc];
    id v5 = v20[9];
    v6 = -[NWURLSessionResponseConsumerDownload initWithResumeInfo:completionHandler:]((id *)&v4->super.isa, v5, *(void **)(a1 + 56));

    v7 = [NWURLSessionDownloadTask alloc];
    uint64_t v8 = [v6 countOfBytesReceived];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      int v10 = *(_DWORD *)(v9 + 32) + 1;
      *(_DWORD *)(v9 + 32) = v10;
      v11 = *(void **)(a1 + 32);
    }
    else
    {
      v11 = 0;
      int v10 = 1;
    }
    id v12 = -[NWURLSessionDownloadTask initWithResumeInfo:fromOffset:identifier:session:]((id *)&v7->super.super.isa, v20, v8, v10, v11);
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v15)
    {
      objc_storeStrong((id *)(v15 + 424), v6);
      uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    else
    {
      uint64_t v16 = 0;
    }
    [v16 setDelegate:*(void *)(a1 + 48)];
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      id v18 = *(void **)(v17 + 104);
    }
    else {
      id v18 = 0;
    }
    [v18 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

    v3 = v20;
  }
}

- (void)withLock:(os_unfair_lock_s *)a1
{
  v4 = a2;
  if (a1)
  {
    v3 = a1 + 6;
    os_unfair_lock_lock(v3);
    v4[2]();
    os_unfair_lock_unlock(v3);
  }
}

- (id)_downloadTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v23);
  }
  v11 = v10;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__44102;
  id v33 = __Block_byref_object_dispose__44103;
  id v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__NWURLSession__downloadTaskWithURL_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E5241D78;
  v24[4] = self;
  id v12 = v8;
  id v25 = v12;
  id v28 = &v29;
  id v13 = v11;
  id v27 = v13;
  id v14 = v9;
  id v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  uint64_t v15 = v30[5];
  if (v15)
  {
    uint64_t v16 = 248;
    if (!*(void *)(v15 + 248)) {
      uint64_t v16 = 240;
    }
    uint64_t v17 = *(id *)(v15 + v16);
    if (v17)
    {
      id v18 = (id)v30[5];
      uint64_t v20 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didCreateTask];
      [v20 URLSession:v17[4] didCreateTask:v18];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

void __64__NWURLSession__downloadTaskWithURL_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v18);
  }
  v3 = [MEMORY[0x1E4F18D50] requestWithURL:*(void *)(a1 + 40)];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [NWURLSessionDownloadTask alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v6 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v6;
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
    int v6 = 1;
  }
  id v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v19, v6, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  v11 = [NWURLSessionResponseConsumerDownload alloc];
  id v12 = *(id *)(a1 + 56);
  if (v11)
  {
    v20.receiver = v11;
    v20.super_class = (Class)NWURLSessionResponseConsumerDownload;
    v11 = (NWURLSessionResponseConsumerDownload *)objc_msgSendSuper2(&v20, sel_init);
    if (v11)
    {
      id v13 = _Block_copy(v12);
      id completionHandler = v11->_completionHandler;
      v11->_id completionHandler = v13;
    }
  }

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v15) {
    objc_storeStrong((id *)(v15 + 424), v11);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    uint64_t v17 = *(void **)(v16 + 104);
  }
  else {
    uint64_t v17 = 0;
  }
  [v17 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (id)preparedRequestFromRequest:(void *)a3 bodyInfo:
{
  id v5 = a2;
  int v6 = a3;
  if (a1)
  {
    id v7 = a1[12];
    id v8 = [v7 HTTPAdditionalHeaders];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__NWURLSession_preparedRequestFromRequest_bodyInfo___block_invoke;
    v23[3] = &unk_1E5241DA0;
    id v9 = v5;

    id v24 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v23];

    id v10 = [v9 valueForHTTPHeaderField:@"Connection"];

    if (v10)
    {
      [v9 setValue:0 forHTTPHeaderField:@"Connection"];
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      v11 = (id)gurlLogObj;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1830D4000, v11, OS_LOG_TYPE_ERROR, "HTTP/1-only header field \"Connection\" should not be set on the request.", buf, 2u);
      }
    }
    id v12 = [v9 valueForHTTPHeaderField:@"Transfer-Encoding"];

    if (v12)
    {
      [v9 setValue:0 forHTTPHeaderField:@"Transfer-Encoding"];
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v13 = (id)gurlLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_ERROR, "HTTP/1-only header field \"Transfer-Encoding\" should not be set on the request.", buf, 2u);
      }
    }
    if (!v6 || v6[1] != -1)
    {
      if (!v9) {
        goto LABEL_30;
      }
      id v14 = [v9 HTTPMethod];
      uint64_t v15 = [v14 caseInsensitiveCompare:@"GET"];

      if (v15)
      {
        uint64_t v17 = [v9 HTTPMethod];
        uint64_t v18 = [v17 caseInsensitiveCompare:@"HEAD"];

        if (v18)
        {
LABEL_30:
          id v19 = [v9 valueForHTTPHeaderField:@"Content-Length"];

          if (!v19)
          {
            if (v6) {
              uint64_t v20 = v6[1];
            }
            else {
              uint64_t v20 = 0;
            }
            id v21 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v20);
            [v9 setValue:v21 forHTTPHeaderField:@"Content-Length"];
          }
        }
      }
    }
    a1 = (id *)v9;
  }

  return a1;
}

void __52__NWURLSession_preparedRequestFromRequest_bodyInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) valueForHTTPHeaderField:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setValue:v5 forHTTPHeaderField:v7];
  }
}

- (id)_downloadTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 URL];

  if (!v11)
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v23);
  }
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__44102;
  id v33 = __Block_byref_object_dispose__44103;
  id v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__NWURLSession__downloadTaskWithRequest_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E5241D78;
  v24[4] = self;
  id v12 = v8;
  id v25 = v12;
  id v28 = &v29;
  id v13 = v10;
  id v27 = v13;
  id v14 = v9;
  id v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  uint64_t v15 = v30[5];
  if (v15)
  {
    uint64_t v16 = 248;
    if (!*(void *)(v15 + 248)) {
      uint64_t v16 = 240;
    }
    uint64_t v17 = *(id *)(v15 + v16);
    if (v17)
    {
      id v18 = (id)v30[5];
      uint64_t v20 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didCreateTask];
      [v20 URLSession:v17[4] didCreateTask:v18];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

void __68__NWURLSession__downloadTaskWithRequest_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v24);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 144);
  }
  else {
    id v5 = 0;
  }
  obunint64_t j = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, *(void **)(a1 + 40), v5);
  int v6 = *(id **)(a1 + 32);
  id v7 = (void *)[*(id *)(a1 + 40) mutableCopy];
  id v8 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);

  id v9 = [NWURLSessionDownloadTask alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    int v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    id v12 = *(void **)(a1 + 32);
  }
  else
  {
    id v12 = 0;
    int v11 = 1;
  }
  id v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.isa, v8, v11, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v16) {
    objc_storeStrong((id *)(v16 + 416), obj);
  }
  uint64_t v17 = [NWURLSessionResponseConsumerDownload alloc];
  id v18 = *(id *)(a1 + 56);
  if (v17)
  {
    v26.receiver = v17;
    v26.super_class = (Class)NWURLSessionResponseConsumerDownload;
    uint64_t v17 = (NWURLSessionResponseConsumerDownload *)objc_msgSendSuper2(&v26, sel_init);
    if (v17)
    {
      id v19 = _Block_copy(v18);
      id completionHandler = v17->_completionHandler;
      v17->_id completionHandler = v19;
    }
  }

  uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v21) {
    objc_storeStrong((id *)(v21 + 424), v17);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    id v23 = *(void **)(v22 + 104);
  }
  else {
    id v23 = 0;
  }
  [v23 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (id)_uploadTaskWithRequest:(id)a3 fromData:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 URL];

  if (!v14)
  {
    id v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v29 = @"URLSessionTask created with nil URL";
    goto LABEL_13;
  }
  if (!v11)
  {
    id v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v29 = @"URLSessionTask created with nil bodyData";
LABEL_13:
    id v30 = [v27 exceptionWithName:v28 reason:v29 userInfo:0];
    objc_exception_throw(v30);
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__44102;
  v45 = __Block_byref_object_dispose__44103;
  id v46 = 0;
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  id v33 = __75__NWURLSession__uploadTaskWithRequest_fromData_delegate_completionHandler___block_invoke;
  id v34 = &unk_1E5241D50;
  v35 = self;
  id v15 = v11;
  id v36 = v15;
  id v16 = v10;
  id v37 = v16;
  v40 = &v41;
  id v17 = v13;
  id v39 = v17;
  id v18 = v12;
  id v38 = v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v31);
  uint64_t v19 = v42[5];
  if (v19)
  {
    uint64_t v20 = 248;
    if (!*(void *)(v19 + 248)) {
      uint64_t v20 = 240;
    }
    uint64_t v21 = *(id *)(v19 + v20);
    if (v21)
    {
      id v22 = (id)v42[5];
      id v24 = [(NWURLSessionDelegateWrapper *)v21 delegateFor_didCreateTask];
      objc_msgSend(v24, "URLSession:didCreateTask:", v21[4], v22, v31, v32, v33, v34, v35, v36, v37);
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  id v25 = (id)v42[5];
  _Block_object_dispose(&v41, 8);

  return v25;
}

void __75__NWURLSession__uploadTaskWithRequest_fromData_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v23);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  id v4 = *(id *)(a1 + 40);
  if (v3
    && (v25.receiver = v3,
        v25.super_class = (Class)NWURLSessionRequestBodyInfo,
        (id v5 = objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    obunint64_t j = v5;
    uint64_t v6 = [v4 _createDispatchData];
    id v7 = (void *)obj[2];
    obj[2] = v6;

    obj[1] = [v4 length];
  }
  else
  {
    obunint64_t j = 0;
  }

  id v8 = *(id **)(a1 + 32);
  id v9 = (void *)[*(id *)(a1 + 48) mutableCopy];
  id v10 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v8, v9, obj);

  id v11 = [NWURLSessionUploadTask alloc];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    int v13 = *(_DWORD *)(v12 + 32) + 1;
    *(_DWORD *)(v12 + 32) = v13;
    uint64_t v14 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v14 = 0;
    int v13 = 1;
  }
  id v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v10, v13, v14);
  uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v18) {
    objc_storeStrong((id *)(v18 + 416), obj);
  }
  uint64_t v19 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]((id *)[NWURLSessionResponseConsumerDataCompletionHandler alloc], *(void **)(a1 + 64));
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v20) {
    objc_storeStrong((id *)(v20 + 424), v19);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDelegate:*(void *)(a1 + 56)];
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    id v22 = *(void **)(v21 + 104);
  }
  else {
    id v22 = 0;
  }
  [v22 addObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
}

- (id)_uploadTaskWithRequest:(id)a3 fromFile:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 URL];

  if (!v14)
  {
    id v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v29 = @"URLSessionTask created with nil URL";
    goto LABEL_15;
  }
  if (!v11)
  {
    id v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v29 = @"URLSessionTask created with nil fileURL";
    goto LABEL_15;
  }
  if (([v11 isFileURL] & 1) == 0)
  {
    id v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v29 = @"URLSessionTask created with invalid fileURL";
LABEL_15:
    id v30 = [v27 exceptionWithName:v28 reason:v29 userInfo:0];
    objc_exception_throw(v30);
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__44102;
  v45 = __Block_byref_object_dispose__44103;
  id v46 = 0;
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  id v33 = __75__NWURLSession__uploadTaskWithRequest_fromFile_delegate_completionHandler___block_invoke;
  id v34 = &unk_1E5241D50;
  v35 = self;
  id v15 = v11;
  id v36 = v15;
  id v16 = v10;
  id v37 = v16;
  v40 = &v41;
  id v17 = v13;
  id v39 = v17;
  id v18 = v12;
  id v38 = v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v31);
  uint64_t v19 = v42[5];
  if (v19)
  {
    uint64_t v20 = 248;
    if (!*(void *)(v19 + 248)) {
      uint64_t v20 = 240;
    }
    uint64_t v21 = *(id *)(v19 + v20);
    if (v21)
    {
      id v22 = (id)v42[5];
      id v24 = [(NWURLSessionDelegateWrapper *)v21 delegateFor_didCreateTask];
      objc_msgSend(v24, "URLSession:didCreateTask:", v21[4], v22, v31, v32, v33, v34, v35, v36, v37);
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  id v25 = (id)v42[5];
  _Block_object_dispose(&v41, 8);

  return v25;
}

void __75__NWURLSession__uploadTaskWithRequest_fromFile_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v21);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 144);
  }
  else {
    id v5 = 0;
  }
  obunint64_t j = -[NWURLSessionRequestBodyInfo initWithFileURL:queue:]((id *)&v3->super.isa, *(void **)(a1 + 40), v5);
  uint64_t v6 = *(id **)(a1 + 32);
  id v7 = (void *)[*(id *)(a1 + 48) mutableCopy];
  id v8 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);

  id v9 = [NWURLSessionUploadTask alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    int v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    id v12 = *(void **)(a1 + 32);
  }
  else
  {
    id v12 = 0;
    int v11 = 1;
  }
  id v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.super.isa, v8, v11, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v16) {
    objc_storeStrong((id *)(v16 + 416), obj);
  }
  id v17 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]((id *)[NWURLSessionResponseConsumerDataCompletionHandler alloc], *(void **)(a1 + 64));
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v18) {
    objc_storeStrong((id *)(v18 + 424), v17);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDelegate:*(void *)(a1 + 56)];
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    uint64_t v20 = *(void **)(v19 + 104);
  }
  else {
    uint64_t v20 = 0;
  }
  [v20 addObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
}

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v23);
  }
  int v11 = v10;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__44102;
  id v33 = __Block_byref_object_dispose__44103;
  id v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__NWURLSession__dataTaskWithURL_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E5241D78;
  v24[4] = self;
  id v12 = v8;
  id v25 = v12;
  uint64_t v28 = &v29;
  id v13 = v11;
  id v27 = v13;
  id v14 = v9;
  id v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  uint64_t v15 = v30[5];
  if (v15)
  {
    uint64_t v16 = 248;
    if (!*(void *)(v15 + 248)) {
      uint64_t v16 = 240;
    }
    id v17 = *(id *)(v15 + v16);
    if (v17)
    {
      id v18 = (id)v30[5];
      uint64_t v20 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didCreateTask];
      [v20 URLSession:v17[4] didCreateTask:v18];
    }
  }
  else
  {
    id v17 = 0;
  }

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

void __60__NWURLSession__dataTaskWithURL_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v15);
  }
  v3 = [MEMORY[0x1E4F18D50] requestWithURL:*(void *)(a1 + 40)];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = [NWURLSessionDataTask alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v6 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v6;
    id v7 = *(void **)(a1 + 32);
  }
  else
  {
    id v7 = 0;
    int v6 = 1;
  }
  id v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  int v11 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]((id *)[NWURLSessionResponseConsumerDataCompletionHandler alloc], *(void **)(a1 + 56));
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v12) {
    objc_storeStrong((id *)(v12 + 424), v11);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    id v14 = *(void **)(v13 + 104);
  }
  else {
    id v14 = 0;
  }
  [v14 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 URL];

  if (!v11)
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v23);
  }
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__44102;
  id v33 = __Block_byref_object_dispose__44103;
  id v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__NWURLSession__dataTaskWithRequest_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E5241D78;
  v24[4] = self;
  id v12 = v8;
  id v25 = v12;
  uint64_t v28 = &v29;
  id v13 = v10;
  id v27 = v13;
  id v14 = v9;
  id v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  uint64_t v15 = v30[5];
  if (v15)
  {
    uint64_t v16 = 248;
    if (!*(void *)(v15 + 248)) {
      uint64_t v16 = 240;
    }
    id v17 = *(id *)(v15 + v16);
    if (v17)
    {
      id v18 = (id)v30[5];
      uint64_t v20 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didCreateTask];
      [v20 URLSession:v17[4] didCreateTask:v18];
    }
  }
  else
  {
    id v17 = 0;
  }

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

void __64__NWURLSession__dataTaskWithRequest_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v21);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 144);
  }
  else {
    uint64_t v5 = 0;
  }
  obunint64_t j = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, *(void **)(a1 + 40), v5);
  int v6 = *(id **)(a1 + 32);
  id v7 = (void *)[*(id *)(a1 + 40) mutableCopy];
  id v8 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);

  id v9 = [NWURLSessionDataTask alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    int v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    id v12 = *(void **)(a1 + 32);
  }
  else
  {
    id v12 = 0;
    int v11 = 1;
  }
  id v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.isa, v8, v11, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v16) {
    objc_storeStrong((id *)(v16 + 416), obj);
  }
  id v17 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]((id *)[NWURLSessionResponseConsumerDataCompletionHandler alloc], *(void **)(a1 + 56));
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v18) {
    objc_storeStrong((id *)(v18 + 424), v17);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    uint64_t v20 = *(void **)(v19 + 104);
  }
  else {
    uint64_t v20 = 0;
  }
  [v20 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v19);
  }
  id v8 = v7;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__44102;
  uint64_t v32 = __Block_byref_object_dispose__44103;
  id v33 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __42__NWURLSession__dataTaskWithURL_delegate___block_invoke;
  id v23 = &unk_1E5241D28;
  id v24 = self;
  id v9 = v6;
  id v25 = v9;
  id v27 = &v28;
  id v10 = v8;
  id v26 = v10;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v20);
  uint64_t v11 = v29[5];
  if (v11)
  {
    uint64_t v12 = 248;
    if (!*(void *)(v11 + 248)) {
      uint64_t v12 = 240;
    }
    id v13 = *(id *)(v11 + v12);
    if (v13)
    {
      id v14 = (id)v29[5];
      uint64_t v16 = [(NWURLSessionDelegateWrapper *)v13 delegateFor_didCreateTask];
      objc_msgSend(v16, "URLSession:didCreateTask:", v13[4], v14, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    id v13 = 0;
  }

  id v17 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v17;
}

void __42__NWURLSession__dataTaskWithURL_delegate___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v15);
  }
  v3 = [MEMORY[0x1E4F18D50] requestWithURL:a1[5]];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = [NWURLSessionDataTask alloc];
  uint64_t v5 = a1[4];
  if (v5)
  {
    int v6 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v6;
    id v7 = (void *)a1[4];
  }
  else
  {
    id v7 = 0;
    int v6 = 1;
  }
  id v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  uint64_t v12 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (v12) {
    objc_storeStrong((id *)(v12 + 424), v11);
  }

  [*(id *)(*(void *)(a1[7] + 8) + 40) setDelegate:a1[6]];
  uint64_t v13 = a1[4];
  if (v13) {
    id v14 = *(void **)(v13 + 104);
  }
  else {
    id v14 = 0;
  }
  [v14 addObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 URL];

  if (!v8)
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v19);
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__44102;
  uint64_t v32 = __Block_byref_object_dispose__44103;
  id v33 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __46__NWURLSession__dataTaskWithRequest_delegate___block_invoke;
  id v23 = &unk_1E5241D28;
  id v24 = self;
  id v9 = v6;
  id v25 = v9;
  id v27 = &v28;
  id v10 = v7;
  id v26 = v10;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v20);
  uint64_t v11 = v29[5];
  if (v11)
  {
    uint64_t v12 = 248;
    if (!*(void *)(v11 + 248)) {
      uint64_t v12 = 240;
    }
    uint64_t v13 = *(id *)(v11 + v12);
    if (v13)
    {
      id v14 = (id)v29[5];
      id v16 = [(NWURLSessionDelegateWrapper *)v13 delegateFor_didCreateTask];
      objc_msgSend(v16, "URLSession:didCreateTask:", v13[4], v14, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  id v17 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v17;
}

void __46__NWURLSession__dataTaskWithRequest_delegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v21);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 144);
  }
  else {
    uint64_t v5 = 0;
  }
  obunint64_t j = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, *(void **)(a1 + 40), v5);
  id v6 = *(id **)(a1 + 32);
  id v7 = (void *)[*(id *)(a1 + 40) mutableCopy];
  id v8 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);

  id v9 = [NWURLSessionDataTask alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    int v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    uint64_t v12 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v12 = 0;
    int v11 = 1;
  }
  uint64_t v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.isa, v8, v11, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v16) {
    objc_storeStrong((id *)(v16 + 416), obj);
  }
  id v17 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v18) {
    objc_storeStrong((id *)(v18 + 424), v17);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    uint64_t v20 = *(void **)(v19 + 104);
  }
  else {
    uint64_t v20 = 0;
  }
  [v20 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (id)downloadTaskWithResumeData:(id)a3 completionHandler:(id)a4
{
  return [(NWURLSession *)self _downloadTaskWithResumeData:a3 delegate:0 completionHandler:a4];
}

- (id)downloadTaskWithURL:(id)a3 completionHandler:(id)a4
{
  return [(NWURLSession *)self _downloadTaskWithURL:a3 delegate:0 completionHandler:a4];
}

- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return [(NWURLSession *)self _downloadTaskWithRequest:a3 delegate:0 completionHandler:a4];
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4 completionHandler:(id)a5
{
  return [(NWURLSession *)self _uploadTaskWithRequest:a3 fromData:a4 delegate:0 completionHandler:a5];
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4 completionHandler:(id)a5
{
  return [(NWURLSession *)self _uploadTaskWithRequest:a3 fromFile:a4 delegate:0 completionHandler:a5];
}

- (id)dataTaskWithURL:(id)a3 completionHandler:(id)a4
{
  return [(NWURLSession *)self _dataTaskWithURL:a3 delegate:0 completionHandler:a4];
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return [(NWURLSession *)self _dataTaskWithRequest:a3 delegate:0 completionHandler:a4];
}

- (id)webSocketTaskWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 URL];

  if (!v5)
  {
    id v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    uint64_t v19 = @"URLSessionTask created with nil URL";
    goto LABEL_14;
  }
  id v6 = [v4 URL];
  id v7 = [v6 scheme];

  if ([v7 caseInsensitiveCompare:@"ws"]
    && [v7 caseInsensitiveCompare:@"wss"])
  {
    id v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    uint64_t v19 = @"URLSessionTask created with invalid URL scheme";
LABEL_14:
    id v20 = [v17 exceptionWithName:v18 reason:v19 userInfo:0];
    objc_exception_throw(v20);
  }
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__44102;
  uint64_t v28 = __Block_byref_object_dispose__44103;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__NWURLSession_webSocketTaskWithRequest___block_invoke;
  v21[3] = &unk_1E5242570;
  v21[4] = self;
  id v8 = v4;
  id v22 = v8;
  id v23 = &v24;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v21);
  uint64_t v9 = v25[5];
  if (v9)
  {
    uint64_t v10 = 248;
    if (!*(void *)(v9 + 248)) {
      uint64_t v10 = 240;
    }
    int v11 = *(id *)(v9 + v10);
    if (v11)
    {
      id v12 = (id)v25[5];
      uint64_t v14 = [(NWURLSessionDelegateWrapper *)v11 delegateFor_didCreateTask];
      [v14 URLSession:v11[4] didCreateTask:v12];
    }
  }
  else
  {
    int v11 = 0;
  }

  id v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __41__NWURLSession_webSocketTaskWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(unsigned char *)(v2 + 28))
    {
      id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
      objc_exception_throw(v20);
    }
    v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
    id v4 = (id *)v2;
  }
  else
  {
    v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
    id v4 = 0;
  }
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v4, v3, 0);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  +[NWURLSessionWebSocketTask addWebSocketHeadersToRequest:]((uint64_t)NWURLSessionWebSocketTask, v21);
  uint64_t v5 = [NWURLSessionWebSocketTask alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    int v7 = *(_DWORD *)(v6 + 32) + 1;
    *(_DWORD *)(v6 + 32) = v7;
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = v21;
    if (v5) {
      goto LABEL_6;
    }
LABEL_16:
    int v11 = 0;
    goto LABEL_8;
  }
  id v8 = 0;
  int v7 = 1;
  uint64_t v9 = v21;
  if (!v5) {
    goto LABEL_16;
  }
LABEL_6:
  uint64_t v10 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v5->super.super.isa, v9, v7, v8);
  int v11 = v10;
  if (v10)
  {
    v10[59] = (id)0x100000;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v13 = v11[64];
    v11[64] = v12;

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = v11[66];
    v11[66] = v14;
  }
LABEL_8:
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v11;

  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    uint64_t v19 = *(void **)(v18 + 104);
  }
  else {
    uint64_t v19 = 0;
  }
  [v19 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (id)webSocketTaskWithURL:(id)a3 protocols:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    id v22 = @"URLSessionTask created with nil URL";
    goto LABEL_16;
  }
  id v8 = v7;
  uint64_t v9 = [v6 scheme];
  if ([v9 caseInsensitiveCompare:@"ws"]
    && [v9 caseInsensitiveCompare:@"wss"])
  {
    id v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    id v22 = @"URLSessionTask created with invalid URL scheme";
LABEL_16:
    id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
  if (!v8)
  {
    id v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    id v22 = @"URLSessionTask created with nil protocols";
    goto LABEL_16;
  }
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__44102;
  id v36 = __Block_byref_object_dispose__44103;
  id v37 = 0;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __47__NWURLSession_webSocketTaskWithURL_protocols___block_invoke;
  id v27 = &unk_1E5241D28;
  uint64_t v28 = self;
  id v10 = v6;
  id v29 = v10;
  id v11 = v8;
  id v30 = v11;
  uint64_t v31 = &v32;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v24);
  uint64_t v12 = v33[5];
  if (v12)
  {
    uint64_t v13 = 248;
    if (!*(void *)(v12 + 248)) {
      uint64_t v13 = 240;
    }
    id v14 = *(id *)(v12 + v13);
    if (v14)
    {
      id v15 = (id)v33[5];
      id v17 = [(NWURLSessionDelegateWrapper *)v14 delegateFor_didCreateTask];
      objc_msgSend(v17, "URLSession:didCreateTask:", v14[4], v15, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    id v14 = 0;
  }

  id v18 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __47__NWURLSession_webSocketTaskWithURL_protocols___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v19);
  }
  id v20 = [MEMORY[0x1E4F18D50] requestWithURL:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) count])
  {
    v3 = [*(id *)(a1 + 48) componentsJoinedByString:@", "];
    [v20 addValue:v3 forHTTPHeaderField:@"Sec-WebSocket-Protocol"];
  }
  id v4 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](*(id **)(a1 + 32), v20, 0);
  +[NWURLSessionWebSocketTask addWebSocketHeadersToRequest:]((uint64_t)NWURLSessionWebSocketTask, v4);
  uint64_t v5 = [NWURLSessionWebSocketTask alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    int v7 = *(_DWORD *)(v6 + 32) + 1;
    *(_DWORD *)(v6 + 32) = v7;
    id v8 = *(void **)(a1 + 32);
    if (v5) {
      goto LABEL_7;
    }
LABEL_16:
    id v10 = 0;
    goto LABEL_9;
  }
  id v8 = 0;
  int v7 = 1;
  if (!v5) {
    goto LABEL_16;
  }
LABEL_7:
  uint64_t v9 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v5->super.super.isa, v4, v7, v8);
  id v10 = v9;
  if (v9)
  {
    v9[59] = (id)0x100000;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = v10[64];
    v10[64] = v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = v10[66];
    v10[66] = v13;
  }
LABEL_9:
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v10;

  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    id v18 = *(void **)(v17 + 104);
  }
  else {
    id v18 = 0;
  }
  [v18 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (id)webSocketTaskWithURL:(id)a3
{
  return [(NWURLSession *)self webSocketTaskWithURL:a3 protocols:MEMORY[0x1E4F1CBF0]];
}

- (id)streamTaskWithNetService:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"NetService is not supported by the new loader" userInfo:0];
  objc_exception_throw(v4);
}

- (id)streamTaskWithHostName:(id)a3 port:(int64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    id v18 = @"URLSessionTask created with nil hostname";
    goto LABEL_13;
  }
  if ((unint64_t)(a4 - 0x10000) <= 0xFFFFFFFFFFFF0000)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    id v18 = @"URLSessionTask created with invalid port";
LABEL_13:
    id v19 = [v16 exceptionWithName:v17 reason:v18 userInfo:0];
    objc_exception_throw(v19);
  }
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__44102;
  uint64_t v32 = __Block_byref_object_dispose__44103;
  id v33 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __44__NWURLSession_streamTaskWithHostName_port___block_invoke;
  id v23 = &unk_1E5242458;
  uint64_t v24 = self;
  uint64_t v26 = &v28;
  id v7 = v6;
  id v25 = v7;
  int64_t v27 = a4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v20);
  uint64_t v8 = v29[5];
  if (v8)
  {
    uint64_t v9 = 248;
    if (!*(void *)(v8 + 248)) {
      uint64_t v9 = 240;
    }
    id v10 = *(id *)(v8 + v9);
    if (v10)
    {
      id v11 = (id)v29[5];
      id v13 = [(NWURLSessionDelegateWrapper *)v10 delegateFor_didCreateTask];
      objc_msgSend(v13, "URLSession:didCreateTask:", v10[4], v11, v20, v21, v22, v23, v24);
    }
  }
  else
  {
    id v10 = 0;
  }

  id v14 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v14;
}

uint64_t __44__NWURLSession_streamTaskWithHostName_port___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v43 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v43);
  }
  id v3 = [NWURLSessionStreamTask alloc];
  int64_t v4 = a1[7];
  uint64_t v5 = a1[4];
  id v6 = (void *)a1[5];
  if (v5)
  {
    int v7 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v7;
    uint64_t v8 = (void *)a1[4];
  }
  else
  {
    uint64_t v8 = 0;
    int v7 = 1;
  }
  obunint64_t j = v6;
  id v9 = v6;
  if (v3)
  {
    id v10 = (objc_class *)MEMORY[0x1E4F29088];
    id v11 = v8;
    id v12 = objc_alloc_init(v10);
    [v12 setScheme:@"tcp"];
    [v12 setHost:v9];
    id v13 = [NSNumber numberWithInteger:v4];
    [v12 setPort:v13];

    id v14 = (void *)MEMORY[0x1E4F18DA8];
    uint64_t v15 = [v12 URL];
    uint64_t v16 = [v14 requestWithURL:v15];

    uint64_t v17 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v3->super.super.isa, v16, v7, v11);
    if (v17)
    {
      id v18 = [NWURLSessionTaskConfiguration alloc];
      id v19 = (id *)v17[50];
      uint64_t v20 = v19;
      int64_t v44 = v4;
      if (v19) {
        id v21 = v19[12];
      }
      else {
        id v21 = 0;
      }
      id v22 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:]((id *)&v18->super.isa, v21, v17, 0);
      id v23 = v17[51];
      v17[51] = v22;

      uint64_t v24 = [NWURLLoaderTCP alloc];
      id v25 = v17[51];
      id v26 = v17[29];
      id v27 = v26;
      id v28 = v25;
      id v46 = v9;
      id v45 = v9;
      id v29 = v28;
      id v30 = v27;
      uint64_t v31 = v17;
      if (v24)
      {
        v48.receiver = v24;
        v48.super_class = (Class)NWURLLoaderTCP;
        uint64_t v32 = (NWURLLoaderTCP *)objc_msgSendSuper2(&v48, sel_init);
        uint64_t v24 = v32;
        if (v32)
        {
          objc_storeStrong((id *)&v32->_hostname, obj);
          v24->_port = v44;
          objc_storeStrong((id *)&v24->_configuration, v25);
          objc_storeStrong((id *)&v24->_client, v17);
          objc_storeStrong((id *)&v24->_queue, v26);
          id v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          pendingWork = v24->_pendingWork;
          v24->_pendingWork = v33;
        }
      }

      id v35 = v31[33];
      v31[33] = v24;

      id v9 = v46;
    }
    id v36 = v17;
  }
  else
  {
    id v36 = 0;
  }

  uint64_t v37 = *(void *)(a1[6] + 8);
  id v38 = *(void **)(v37 + 40);
  *(void *)(v37 + 40) = v36;

  uint64_t v39 = a1[4];
  if (v39) {
    v40 = *(void **)(v39 + 104);
  }
  else {
    v40 = 0;
  }
  uint64_t v41 = *(void *)(*(void *)(a1[6] + 8) + 40);

  return [v40 addObject:v41];
}

- (id)downloadTaskWithResumeData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionDownloadTask created with nil resume data" userInfo:0];
    objc_exception_throw(v14);
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__44102;
  id v22 = __Block_byref_object_dispose__44103;
  id v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __43__NWURLSession_downloadTaskWithResumeData___block_invoke;
  v15[3] = &unk_1E5242570;
  v15[4] = self;
  id v5 = v4;
  id v16 = v5;
  uint64_t v17 = &v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v15);
  uint64_t v6 = v19[5];
  if (v6)
  {
    uint64_t v7 = 248;
    if (!*(void *)(v6 + 248)) {
      uint64_t v7 = 240;
    }
    uint64_t v8 = *(id *)(v6 + v7);
    if (v8)
    {
      id v9 = (id)v19[5];
      id v11 = [(NWURLSessionDelegateWrapper *)v8 delegateFor_didCreateTask];
      [v11 URLSession:v8[4] didCreateTask:v9];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __43__NWURLSession_downloadTaskWithResumeData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionDownloadTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v18);
  }
  +[NWURLSessionDownloadResumeInfo infoWithResumeData:]((uint64_t)NWURLSessionDownloadResumeInfo, *(void **)(a1 + 40));
  id v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v19 = v3;
    id v4 = [NWURLSessionResponseConsumerDownload alloc];
    id v5 = v19[9];
    uint64_t v6 = -[NWURLSessionResponseConsumerDownload initWithResumeInfo:completionHandler:]((id *)&v4->super.isa, v5, 0);

    uint64_t v7 = [NWURLSessionDownloadTask alloc];
    uint64_t v8 = [v6 countOfBytesReceived];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      int v10 = *(_DWORD *)(v9 + 32) + 1;
      *(_DWORD *)(v9 + 32) = v10;
      id v11 = *(void **)(a1 + 32);
    }
    else
    {
      id v11 = 0;
      int v10 = 1;
    }
    id v12 = -[NWURLSessionDownloadTask initWithResumeInfo:fromOffset:identifier:session:]((id *)&v7->super.super.isa, v19, v8, v10, v11);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v15) {
      objc_storeStrong((id *)(v15 + 424), v6);
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v17 = *(void **)(v16 + 104);
    }
    else {
      uint64_t v17 = 0;
    }
    [v17 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    id v3 = v19;
  }
}

- (id)downloadTaskWithURL:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v14);
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__44102;
  id v22 = __Block_byref_object_dispose__44103;
  id v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __36__NWURLSession_downloadTaskWithURL___block_invoke;
  v15[3] = &unk_1E5242570;
  v15[4] = self;
  id v5 = v4;
  id v16 = v5;
  uint64_t v17 = &v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v15);
  uint64_t v6 = v19[5];
  if (v6)
  {
    uint64_t v7 = 248;
    if (!*(void *)(v6 + 248)) {
      uint64_t v7 = 240;
    }
    uint64_t v8 = *(id *)(v6 + v7);
    if (v8)
    {
      id v9 = (id)v19[5];
      id v11 = [(NWURLSessionDelegateWrapper *)v8 delegateFor_didCreateTask];
      [v11 URLSession:v8[4] didCreateTask:v9];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __36__NWURLSession_downloadTaskWithURL___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v15);
  }
  id v3 = [MEMORY[0x1E4F18D50] requestWithURL:a1[5]];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [NWURLSessionDownloadTask alloc];
  uint64_t v5 = a1[4];
  if (v5)
  {
    int v6 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v6;
    uint64_t v7 = (void *)a1[4];
  }
  else
  {
    uint64_t v7 = 0;
    int v6 = 1;
  }
  uint64_t v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  uint64_t v9 = *(void *)(a1[6] + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setPrefersIncrementalDelivery:0];
  id v11 = objc_alloc_init(NWURLSessionResponseConsumerDownload);
  uint64_t v12 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v12) {
    objc_storeStrong((id *)(v12 + 424), v11);
  }

  uint64_t v13 = a1[4];
  if (v13) {
    id v14 = *(void **)(v13 + 104);
  }
  else {
    id v14 = 0;
  }
  [v14 addObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (id)downloadTaskWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 URL];

  if (!v5)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v15);
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__44102;
  id v23 = __Block_byref_object_dispose__44103;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__NWURLSession_downloadTaskWithRequest___block_invoke;
  v16[3] = &unk_1E5242570;
  v16[4] = self;
  id v6 = v4;
  id v17 = v6;
  uint64_t v18 = &v19;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v16);
  uint64_t v7 = v20[5];
  if (v7)
  {
    uint64_t v8 = 248;
    if (!*(void *)(v7 + 248)) {
      uint64_t v8 = 240;
    }
    uint64_t v9 = *(id *)(v7 + v8);
    if (v9)
    {
      id v10 = (id)v20[5];
      uint64_t v12 = [(NWURLSessionDelegateWrapper *)v9 delegateFor_didCreateTask];
      [v12 URLSession:v9[4] didCreateTask:v10];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __40__NWURLSession_downloadTaskWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v21);
  }
  id v3 = [NWURLSessionRequestBodyInfo alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 144);
  }
  else {
    uint64_t v5 = 0;
  }
  obunint64_t j = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, *(void **)(a1 + 40), v5);
  id v6 = *(id **)(a1 + 32);
  uint64_t v7 = (void *)[*(id *)(a1 + 40) mutableCopy];
  uint64_t v8 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);

  uint64_t v9 = [NWURLSessionDownloadTask alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    int v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    uint64_t v12 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v12 = 0;
    int v11 = 1;
  }
  id v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.isa, v8, v11, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPrefersIncrementalDelivery:0];
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v16) {
    objc_storeStrong((id *)(v16 + 416), obj);
  }
  id v17 = objc_alloc_init(NWURLSessionResponseConsumerDownload);
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v18) {
    objc_storeStrong((id *)(v18 + 424), v17);
  }

  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    uint64_t v20 = *(void **)(v19 + 104);
  }
  else {
    uint64_t v20 = 0;
  }
  [v20 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (id)uploadTaskWithStreamedRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 URL];

  if (!v5)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"URLSessionTask created with nil URL" userInfo:0];
    objc_exception_throw(v15);
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__44102;
  id v23 = __Block_byref_object_dispose__44103;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__NWURLSession_uploadTaskWithStreamedRequest___block_invoke;
  v16[3] = &unk_1E5242570;
  v16[4] = self;
  id v6 = v4;
  id v17 = v6;
  uint64_t v18 = &v19;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v16);
  uint64_t v7 = v20[5];
  if (v7)
  {
    uint64_t v8 = 248;
    if (!*(void *)(v7 + 248)) {
      uint64_t v8 = 240;
    }
    uint64_t v9 = *(id *)(v7 + v8);
    if (v9)
    {
      id v10 = (id)v20[5];
      uint64_t v12 = [(NWURLSessionDelegateWrapper *)v9 delegateFor_didCreateTask];
      [v12 URLSession:v9[4] didCreateTask:v10];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __46__NWURLSession_uploadTaskWithStreamedRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v23);
  }
  id v3 = [NWURLSessionRequestBodyInfo alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 144);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v3
    && (v25.receiver = v3,
        v25.super_class = (Class)NWURLSessionRequestBodyInfo,
        (uint64_t v7 = (id *)objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    obunint64_t j = v7;
    objc_storeStrong(v7 + 4, 0);
    obj[1] = (id)-1;
    objc_storeStrong(obj + 5, v5);
  }
  else
  {
    obunint64_t j = 0;
  }

  uint64_t v8 = *(id **)(a1 + 32);
  uint64_t v9 = (void *)[*(id *)(a1 + 40) mutableCopy];
  id v10 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v8, v9, obj);

  int v11 = [NWURLSessionUploadTask alloc];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    int v13 = *(_DWORD *)(v12 + 32) + 1;
    *(_DWORD *)(v12 + 32) = v13;
    uint64_t v14 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v14 = 0;
    int v13 = 1;
  }
  id v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v10, v13, v14);
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v18) {
    objc_storeStrong((id *)(v18 + 416), obj);
  }
  uint64_t v19 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v20) {
    objc_storeStrong((id *)(v20 + 424), v19);
  }

  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    id v22 = *(void **)(v21 + 104);
  }
  else {
    id v22 = 0;
  }
  [v22 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 URL];

  if (!v8)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = @"URLSessionTask created with nil URL";
    goto LABEL_13;
  }
  if (!v7)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = @"URLSessionTask created with nil bodyData";
LABEL_13:
    id v22 = [v19 exceptionWithName:v20 reason:v21 userInfo:0];
    objc_exception_throw(v22);
  }
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__44102;
  id v35 = __Block_byref_object_dispose__44103;
  id v36 = 0;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  objc_super v25 = __47__NWURLSession_uploadTaskWithRequest_fromData___block_invoke;
  id v26 = &unk_1E5241D28;
  id v27 = self;
  id v9 = v7;
  id v28 = v9;
  id v10 = v6;
  id v29 = v10;
  id v30 = &v31;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v23);
  uint64_t v11 = v32[5];
  if (v11)
  {
    uint64_t v12 = 248;
    if (!*(void *)(v11 + 248)) {
      uint64_t v12 = 240;
    }
    int v13 = *(id *)(v11 + v12);
    if (v13)
    {
      id v14 = (id)v32[5];
      uint64_t v16 = [(NWURLSessionDelegateWrapper *)v13 delegateFor_didCreateTask];
      objc_msgSend(v16, "URLSession:didCreateTask:", v13[4], v14, v23, v24, v25, v26, v27, v28);
    }
  }
  else
  {
    int v13 = 0;
  }

  id v17 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __47__NWURLSession_uploadTaskWithRequest_fromData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v23);
  }
  id v3 = [NWURLSessionRequestBodyInfo alloc];
  id v4 = *(id *)(a1 + 40);
  if (v3
    && (v25.receiver = v3,
        v25.super_class = (Class)NWURLSessionRequestBodyInfo,
        (uint64_t v5 = objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    obunint64_t j = v5;
    uint64_t v6 = [v4 _createDispatchData];
    id v7 = (void *)obj[2];
    obj[2] = v6;

    obj[1] = [v4 length];
  }
  else
  {
    obunint64_t j = 0;
  }

  uint64_t v8 = *(id **)(a1 + 32);
  id v9 = (void *)[*(id *)(a1 + 48) mutableCopy];
  id v10 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v8, v9, obj);

  uint64_t v11 = [NWURLSessionUploadTask alloc];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    int v13 = *(_DWORD *)(v12 + 32) + 1;
    *(_DWORD *)(v12 + 32) = v13;
    id v14 = *(void **)(a1 + 32);
  }
  else
  {
    id v14 = 0;
    int v13 = 1;
  }
  id v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v10, v13, v14);
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v18) {
    objc_storeStrong((id *)(v18 + 416), obj);
  }
  uint64_t v19 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v20) {
    objc_storeStrong((id *)(v20 + 424), v19);
  }

  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    id v22 = *(void **)(v21 + 104);
  }
  else {
    id v22 = 0;
  }
  [v22 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 URL];

  if (!v8)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = @"URLSessionTask created with nil URL";
    goto LABEL_15;
  }
  if (!v7)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = @"URLSessionTask created with nil fileURL";
    goto LABEL_15;
  }
  if (([v7 isFileURL] & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = @"URLSessionTask created with invalid fileURL";
LABEL_15:
    id v22 = [v19 exceptionWithName:v20 reason:v21 userInfo:0];
    objc_exception_throw(v22);
  }
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__44102;
  id v35 = __Block_byref_object_dispose__44103;
  id v36 = 0;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  objc_super v25 = __47__NWURLSession_uploadTaskWithRequest_fromFile___block_invoke;
  id v26 = &unk_1E5241D28;
  id v27 = self;
  id v9 = v7;
  id v28 = v9;
  id v10 = v6;
  id v29 = v10;
  id v30 = &v31;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v23);
  uint64_t v11 = v32[5];
  if (v11)
  {
    uint64_t v12 = 248;
    if (!*(void *)(v11 + 248)) {
      uint64_t v12 = 240;
    }
    int v13 = *(id *)(v11 + v12);
    if (v13)
    {
      id v14 = (id)v32[5];
      uint64_t v16 = [(NWURLSessionDelegateWrapper *)v13 delegateFor_didCreateTask];
      objc_msgSend(v16, "URLSession:didCreateTask:", v13[4], v14, v23, v24, v25, v26, v27, v28);
    }
  }
  else
  {
    int v13 = 0;
  }

  id v17 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __47__NWURLSession_uploadTaskWithRequest_fromFile___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 28))
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    objc_exception_throw(v21);
  }
  id v3 = [NWURLSessionRequestBodyInfo alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 144);
  }
  else {
    uint64_t v5 = 0;
  }
  obunint64_t j = -[NWURLSessionRequestBodyInfo initWithFileURL:queue:]((id *)&v3->super.isa, *(void **)(a1 + 40), v5);
  id v6 = *(id **)(a1 + 32);
  id v7 = (void *)[*(id *)(a1 + 48) mutableCopy];
  uint64_t v8 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);

  id v9 = [NWURLSessionUploadTask alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    int v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    uint64_t v12 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v12 = 0;
    int v11 = 1;
  }
  int v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.super.isa, v8, v11, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v16) {
    objc_storeStrong((id *)(v16 + 416), obj);
  }
  id v17 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v18) {
    objc_storeStrong((id *)(v18 + 424), v17);
  }

  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    uint64_t v20 = *(void **)(v19 + 104);
  }
  else {
    uint64_t v20 = 0;
  }
  [v20 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (id)dataTaskWithURL:(id)a3
{
  return [(NWURLSession *)self _dataTaskWithURL:a3 delegate:0];
}

- (id)dataTaskWithRequest:(id)a3
{
  return [(NWURLSession *)self _dataTaskWithRequest:a3 delegate:0];
}

- (void)getAllTasksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E524B950;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v6);
}

void __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[14];
  }
  id v3 = v2;
  id v4 = [v3 allObjects];
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[13];
  }
  id v6 = v5;
  id v7 = [v6 allObjects];
  uint64_t v8 = [v4 arrayByAddingObjectsFromArray:v7];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 152);
  }
  else {
    uint64_t v10 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E524B950;
  id v11 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v11;
  id v12 = v8;
  int v13 = v12;
  if (v10)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(v10 + 48), v14);
    int v13 = v15;
  }
}

uint64_t __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getTasksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__NWURLSession_getTasksWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E524B950;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v6);
  (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
}

void __46__NWURLSession_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v34 = a1;
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[13];
  }
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * v10);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        int v13 = v4;
        if ((isKindOfClass & 1) != 0
          || (objc_opt_class(), v14 = objc_opt_isKindOfClass(), int v13 = v3, (v14 & 1) != 0)
          || (objc_opt_class(), v15 = objc_opt_isKindOfClass(), int v13 = v2, (v15 & 1) != 0))
        {
          [v13 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v8);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = *(void **)(v34 + 32);
  if (v16) {
    id v16 = (void *)v16[14];
  }
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v40 + 1) + 8 * v21);
        objc_opt_class();
        char v23 = objc_opt_isKindOfClass();
        uint64_t v24 = v4;
        if ((v23 & 1) != 0
          || (objc_opt_class(), char v25 = objc_opt_isKindOfClass(), v24 = v3, (v25 & 1) != 0)
          || (objc_opt_class(), char v26 = objc_opt_isKindOfClass(), v24 = v2, (v26 & 1) != 0))
        {
          [v24 addObject:v22];
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v19);
  }

  uint64_t v27 = *(void *)(v34 + 32);
  if (v27) {
    uint64_t v28 = *(void *)(v27 + 152);
  }
  else {
    uint64_t v28 = 0;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __46__NWURLSession_getTasksWithCompletionHandler___block_invoke_2;
  v35[3] = &unk_1E5249BF8;
  id v29 = *(id *)(v34 + 40);
  id v36 = v2;
  id v37 = v3;
  id v38 = v4;
  id v39 = v29;
  id v30 = v4;
  id v31 = v3;
  id v32 = v2;
  uint64_t v33 = v30;
  if (v28)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(v28 + 48), v35);
    uint64_t v33 = v38;
  }
}

void __46__NWURLSession_getTasksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v5 = (id)[*(id *)(a1 + 32) copy];
  id v3 = (void *)[*(id *)(a1 + 40) copy];
  id v4 = (void *)[*(id *)(a1 + 48) copy];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

- (void)flushWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  id v5 = (id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v11 = 16;
    __int16 v12 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> flush", buf, 0x12u);
  }

  if (self) {
    self = (NWURLSession *)self->_delegateWrapper;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NWURLSession_flushWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E524AFA8;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = v6;
  if (self)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:]((void *)self->_HTTPCookieStorage, v8);
    uint64_t v7 = v9;
  }
}

uint64_t __43__NWURLSession_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  id v5 = (id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v11 = 16;
    __int16 v12 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> reset", buf, 0x12u);
  }

  if (self) {
    self = (NWURLSession *)self->_delegateWrapper;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NWURLSession_resetWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E524AFA8;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = v6;
  if (self)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:]((void *)self->_HTTPCookieStorage, v8);
    uint64_t v7 = v9;
  }
}

uint64_t __43__NWURLSession_resetWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateAndCancel
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  id v3 = (id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v7 = 16;
    __int16 v8 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> invalidate and cancel", buf, 0x12u);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__NWURLSession_invalidateAndCancel__block_invoke;
  v5[3] = &unk_1E524BAA8;
  v5[4] = self;
  id v4 = self;
  -[NWURLSession withLock:]((os_unfair_lock_s *)v4, v5);
}

void __35__NWURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[13];
  }
  id v3 = v2;
  id v4 = [v3 anyObject];
  if (v4)
  {

LABEL_8:
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      id v9 = *(NSObject **)(v8 + 144);
    }
    else {
      id v9 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__NWURLSession_invalidateAndCancel__block_invoke_2;
    block[3] = &unk_1E524BAA8;
    block[4] = v8;
    dispatch_async(v9, block);
    goto LABEL_11;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    id v6 = *(void **)(v5 + 112);
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = [v6 count];

  if (v7) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    if (*(unsigned char *)(v10 + 28)) {
      return;
    }
    *(unsigned char *)(v10 + 28) = 1;
    uint64_t v11 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v11 = 0;
  }
  -[NWURLSession checkForCompletion](v11);
}

void __35__NWURLSession_invalidateAndCancel__block_invoke_2(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__NWURLSession_invalidateAndCancel__block_invoke_3;
  v2[3] = &unk_1E524BAA8;
  v2[4] = v1;
  -[NWURLSession withLock:](v1, v2);
}

- (void)checkForCompletion
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 24));
    if (*(unsigned char *)(a1 + 28))
    {
      id v11 = *(id *)(a1 + 104);
      uint64_t v2 = [v11 anyObject];
      if (v2)
      {
      }
      else
      {
        uint64_t v3 = [*(id *)(a1 + 112) count];

        if (!v3)
        {
          id v4 = *(void **)(a1 + 160);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __34__NWURLSession_checkForCompletion__block_invoke;
          v16[3] = &unk_1E524BAA8;
          v16[4] = a1;
          nw_queue_context_async_if_needed(v4, v16);
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          int v13 = __34__NWURLSession_checkForCompletion__block_invoke_2;
          uint64_t v14 = &unk_1E524BAA8;
          uint64_t v15 = a1;
          uint64_t v5 = v12;
          id v6 = *(void **)(a1 + 136);
          *(void *)(a1 + 136) = 0;

          if (*(_DWORD *)(a1 + 36))
          {
            IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 128), 0);
            if (*(_DWORD *)(a1 + 40))
            {
              io_object_t notifier = *(_DWORD *)(a1 + 40);
              *(_DWORD *)(a1 + 40) = 0;
              IOReturn v7 = IODeregisterForSystemPower(&notifier);
              if (v7)
              {
                IOReturn v8 = v7;
                if (__nwlog_url_log::onceToken != -1) {
                  dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
                }
                id v9 = (id)gurlLogObj;
                if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  IOReturn v19 = v8;
                  _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "Failed to deregister power notifications: %d", buf, 8u);
                }
              }
            }
            IOServiceClose(*(_DWORD *)(a1 + 36));
            *(_DWORD *)(a1 + 36) = 0;
            uint64_t v10 = *(IONotificationPort **)(a1 + 128);
            if (v10)
            {
              IONotificationPortDestroy(v10);
              *(void *)(a1 + 128) = 0;
            }
            dispatch_async(*(dispatch_queue_t *)(a1 + 144), v5);
          }
          else
          {
            ((void (*)(void *))v13)(v5);
          }
        }
      }
    }
  }
}

void __34__NWURLSession_checkForCompletion__block_invoke(uint64_t a1)
{
}

void __34__NWURLSession_checkForCompletion__block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 152);
    if (v4)
    {
      id v6 = [(NWURLSessionDelegateWrapper *)*(unsigned char **)(v3 + 152) delegateFor_sessionDidBecomeInvalidWithError];
      if (v6)
      {
        id v7 = *(id *)(v4 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        void v12[2] = __57__NWURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke;
        v12[3] = &unk_1E524A1D0;
        id v13 = v6;
        id v14 = v7;
        id v15 = 0;
        uint64_t v16 = v4;
        IOReturn v8 = *(void **)(v4 + 48);
        id v9 = v7;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v8, v12);
      }
      else
      {
        objc_setProperty_atomic((id)v4, v5, 0, 16);
      }
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    id v11 = *(void **)(v10 + 152);
    if (v11)
    {
      objc_setProperty_atomic(v11, a2, 0, 16);
    }
  }
}

- (void)teardownAllConnections
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v1 = nw_context_copy_cache_context(*(void **)(a1 + 160));
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (nw_protocol_http_messaging_identifier::onceToken[0] != -1) {
      dispatch_once(nw_protocol_http_messaging_identifier::onceToken, &__block_literal_global_77555);
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __38__NWURLSession_teardownAllConnections__block_invoke;
    v29[3] = &unk_1E5241DC8;
    id v3 = (id)v1;
    id v30 = v3;
    id v4 = v2;
    id v31 = v4;
    nw_protocol_enumerate_instances(nw_protocol_http_messaging_identifier::protocol_identifier, (uint64_t)v29);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          nw_protocol_http_messaging_teardown([*(id *)(*((void *)&v25 + 1) + 8 * i) unsignedIntegerValue], 0);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v7);
    }

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (nw_protocol_http_client_bottom_identifier::onceToken[0] != -1) {
      dispatch_once(nw_protocol_http_client_bottom_identifier::onceToken, &__block_literal_global_22479);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __38__NWURLSession_teardownAllConnections__block_invoke_2;
    v22[3] = &unk_1E5241DC8;
    id v11 = v3;
    id v23 = v11;
    id v12 = v10;
    id v24 = v12;
    nw_protocol_enumerate_instances(&nw_protocol_http_client_bottom_identifier::protocol_identifier, (uint64_t)v22);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          nw_protocol_http_client_bottom_teardown(objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "unsignedIntegerValue", (void)v18));
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v32 count:16];
      }
      while (v15);
    }
  }
}

void __38__NWURLSession_teardownAllConnections__block_invoke(uint64_t a1, uint64_t a2)
{
  nw_protocol_get_parameters(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = nw_parameters_copy_context(v8);
  id v5 = *(id *)(a1 + 32);

  if (v4 == v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
    [v6 addObject:v7];
  }
}

void __38__NWURLSession_teardownAllConnections__block_invoke_2(uint64_t a1, uint64_t a2)
{
  nw_protocol_get_parameters(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = nw_parameters_copy_context(v8);
  id v5 = *(id *)(a1 + 32);

  if (v4 == v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
    [v6 addObject:v7];
  }
}

void __35__NWURLSession_invalidateAndCancel__block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[13];
  }
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[14];
  }
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "cancel", (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)finishTasksAndInvalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  id v3 = (id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v7 = 16;
    __int16 v8 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> finish tasks and invalidate", buf, 0x12u);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NWURLSession_finishTasksAndInvalidate__block_invoke;
  v5[3] = &unk_1E524BAA8;
  v5[4] = self;
  uint64_t v4 = self;
  -[NWURLSession withLock:]((os_unfair_lock_s *)v4, v5);
}

void __40__NWURLSession_finishTasksAndInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (!*(unsigned char *)(v1 + 28))
    {
      *(unsigned char *)(v1 + 28) = 1;
      -[NWURLSession checkForCompletion](*(void *)(a1 + 32));
    }
  }
  else
  {
    -[NWURLSession checkForCompletion](0);
  }
}

- (NSURLSessionDelegate)delegate
{
  if (self && (delegateWrapper = self->_delegateWrapper) != 0) {
    return (NSURLSessionDelegate *)objc_getProperty(delegateWrapper, a2, 16, 1);
  }
  else {
    return 0;
  }
}

- (NSOperationQueue)delegateQueue
{
  if (self)
  {
    delegateWrapper = self->_delegateWrapper;
    if (delegateWrapper && (delegateQueueWrapper = (os_unfair_lock_s *)delegateWrapper->_delegateQueueWrapper) != 0)
    {
      if (!objc_getProperty(delegateWrapper->_delegateQueueWrapper, a2, 16, 1))
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        id v9 = __42__NWURLSessionDelegateQueue_delegateQueue__block_invoke;
        uint64_t v10 = &unk_1E524BAA8;
        uint64_t v11 = delegateQueueWrapper;
        int v7 = v8;
        os_unfair_lock_lock(delegateQueueWrapper + 2);
        ((void (*)(void *))v9)(v7);

        os_unfair_lock_unlock(delegateQueueWrapper + 2);
      }
      self = (NWURLSession *)objc_getProperty(delegateQueueWrapper, v5, 16, 1);
    }
    else
    {
      self = 0;
    }
    uint64_t v2 = vars8;
  }
  return (NSOperationQueue *)self;
}

- (NSURLSessionConfiguration)configuration
{
  if (self) {
    self = (NWURLSession *)self->_internalConfiguration;
  }
  uint64_t v2 = (void *)[(NWURLSession *)self copy];

  return (NSURLSessionConfiguration *)v2;
}

void __62__NWURLSession_systemPowerChangedNotification_notificationID___block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  uint64_t v2 = (id)gurlLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_1830D4000, v2, OS_LOG_TYPE_INFO, "Continuing system sleep", (uint8_t *)v8, 2u);
  }

  uint64_t v3 = a1[4];
  if (v3) {
    io_connect_t v4 = *(_DWORD *)(v3 + 36);
  }
  else {
    io_connect_t v4 = 0;
  }
  IOReturn v5 = IOAllowPowerChange(v4, a1[6]);
  if (v5)
  {
    IOReturn v6 = v5;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    int v7 = (id)gurlLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v6;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_ERROR, "Failed to continue system sleep: %d", (uint8_t *)v8, 8u);
    }
  }
  nw_queue_cancel_source(*(void *)(*(void *)(a1[5] + 8) + 24));
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NWURLSession;
  if (-[NWURLSession isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

+ (void)_disableAppSSO
{
}

+ (void)_strictTrustEvaluate:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
}

- (void)taskStarted:(os_unfair_lock_s *)a1
{
  id v3 = a2;
  io_connect_t v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __28__NWURLSession_taskStarted___block_invoke;
    v5[3] = &unk_1E524B9A0;
    v5[4] = a1;
    id v6 = v3;
    -[NWURLSession withLock:](a1, v5);
  }
}

uint64_t __28__NWURLSession_taskStarted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 104);
  }
  else {
    id v3 = 0;
  }
  [v3 removeObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    objc_super v5 = *(void **)(v4 + 112);
  }
  else {
    objc_super v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v5 addObject:v6];
}

- (void)taskCompleted:(os_unfair_lock_s *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __30__NWURLSession_taskCompleted___block_invoke;
    v5[3] = &unk_1E524B9A0;
    v5[4] = a1;
    id v6 = v3;
    -[NWURLSession withLock:](a1, v5);
  }
}

void __30__NWURLSession_taskCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 104);
  }
  else {
    id v3 = 0;
  }
  [v3 removeObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    objc_super v5 = *(void **)(v4 + 112);
  }
  else {
    objc_super v5 = 0;
  }
  [v5 removeObject:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);

  -[NWURLSession checkForCompletion](v6);
}

@end