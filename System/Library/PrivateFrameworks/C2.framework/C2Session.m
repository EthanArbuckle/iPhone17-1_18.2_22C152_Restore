@interface C2Session
+ (id)portFromURL:(id)a3;
- (BOOL)isComplete;
- (BOOL)shouldInvalidateAndCancel;
- (BOOL)shouldRemoveEmptySession;
- (C2RequestOptions)options;
- (C2Session)initWithSessionConfigurationName:(id)a3 routeHost:(id)a4 options:(id)a5 sessionDelegate:(id)a6;
- (C2SessionDelegate)sessionDelegate;
- (NSMutableDictionary)wrappedTaskByTaskIdentifier;
- (NSMutableSet)didCompleteWithErrorRunningTasks;
- (NSOperationQueue)queue;
- (NSString)originalHost;
- (NSString)routeHost;
- (NSString)sessionConfigurationName;
- (NSURLSession)session;
- (double)routeLastUpdated;
- (id)addTask:(id)a3 withDescription:(id)a4 request:(id)a5;
- (id)createTaskWithOptions:(id)a3 delegate:(id)a4;
- (id)testBehavior_callbackHung;
- (id)testBehavior_cleanupRetainCycle;
- (id)testBehavior_sessionInvalidated_cfnetwork;
- (id)testBehavior_sessionInvalidated_shouldInvalidate;
- (int64_t)emptyTimestamp;
- (void)C2Session:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)C2Session:(id)a3 sessionTask:(id)a4 updatedRoute:(id)a5;
- (void)C2Session:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 _taskIsWaitingForConnection:(id)a4;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_recalculateSessionDelegateQueuePriority;
- (void)cleanupRetainCycle;
- (void)dealloc;
- (void)invalidateAndCancel;
- (void)removeTask:(id)a3;
- (void)sessionTaskDelegateCallbackHelper:(id)a3 task:(id)a4 block:(id)a5;
- (void)setDidCompleteWithErrorRunningTasks:(id)a3;
- (void)setEmptyTimestamp:(int64_t)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setOriginalHost:(id)a3;
- (void)setRouteHost:(id)a3;
- (void)setRouteLastUpdated:(double)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setTestBehavior_callbackHung:(id)a3;
- (void)setTestBehavior_cleanupRetainCycle:(id)a3;
- (void)setTestBehavior_sessionInvalidated_cfnetwork:(id)a3;
- (void)setTestBehavior_sessionInvalidated_shouldInvalidate:(id)a3;
- (void)testBehavior_setSessionExpiry:(int64_t)a3;
- (void)testBehavior_triggerCallbackHang;
- (void)testBehavior_triggerSessionExpiry;
@end

@implementation C2Session

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_134);
  }
  v9 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v29 = self;
    __int16 v30 = 2114;
    id v31 = v7;
    __int16 v32 = 2114;
    id v33 = v8;
    _os_log_impl(&dword_1DD523000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ URLSession:%{public}@ didBecomeInvalidWithError:%{public}@]", buf, 0x20u);
  }
  v10 = self;
  objc_sync_enter(v10);
  if (!v10)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:0 file:@"C2Session.m" lineNumber:412 description:@"C2Session must not be nil."];
  }
  if (!v7)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:v10 file:@"C2Session.m" lineNumber:412 description:@"NSURLSession must not be nil."];
  }
  v11 = [(C2Session *)v10 session];
  v12 = [v11 configuration];
  uint64_t v13 = [v12 identifier];

  v14 = [v7 configuration];
  uint64_t v15 = [v14 identifier];

  if (![(C2Session *)v10 isComplete])
  {
    if (v13 | v15)
    {
      if (!v13)
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2 object:v10 file:@"C2Session.m" lineNumber:412 description:@"C2Session missing background configuration identifier."];
      }
      if (!v15)
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2 object:v10 file:@"C2Session.m" lineNumber:412 description:@"NSURLSession missing background configuration identifier."];
      }
      if ([(id)v13 isEqual:v15]) {
        goto LABEL_18;
      }
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v10, @"C2Session.m", 412, @"Callbacks should only occur for member session. %@ != %@", v13, v15 object file lineNumber description];
    }
    else
    {
      id v17 = [(C2Session *)v10 session];
      BOOL v18 = v17 == v7;

      if (v18) {
        goto LABEL_18;
      }
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = [(C2Session *)v10 session];
      [v16 handleFailureInMethod:a2, v10, @"C2Session.m", 412, @"Callbacks should only occur for member session. %@ != %@", v27, v7 object file lineNumber description];
    }
LABEL_18:
    v19 = [MEMORY[0x1E4F28F08] currentQueue];
    v20 = [(C2Session *)v10 queue];
    char v21 = [v19 isEqual:v20];

    if ((v21 & 1) == 0)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:v10 file:@"C2Session.m" lineNumber:412 description:@"Callbacks should always occur on member queue"];
    }
  }

  objc_sync_exit(v10);
  [(C2Session *)v10 C2Session:v10 didBecomeInvalidWithError:v8];
}

- (void)_recalculateSessionDelegateQueuePriority
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 9;
  v3 = [(C2Session *)self wrappedTaskByTaskIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__C2Session__recalculateSessionDelegateQueuePriority__block_invoke;
  v12[3] = &unk_1E6CCC610;
  v12[4] = &v13;
  [v3 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v4 = v14[3];
  v5 = [(C2Session *)self session];
  v6 = [v5 delegateQueue];
  LOBYTE(v4) = v4 == [v6 qualityOfService];

  if ((v4 & 1) == 0)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_46_0);
    }
    id v7 = (id)C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = +[C2RequestOptions stringForQualityOfService:v14[3]];
      *(_DWORD *)buf = 138543618;
      BOOL v18 = self;
      __int16 v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_INFO, "%{public}@ Changing delegate callback queue QoS to %{public}@", buf, 0x16u);
    }
    uint64_t v9 = v14[3];
    v10 = [(C2Session *)self session];
    v11 = [v10 delegateQueue];
    [v11 setQualityOfService:v9];
  }
  _Block_object_dispose(&v13, 8);
}

- (void)sessionTaskDelegateCallbackHelper:(id)a3 task:(id)a4 block:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  context = (void *)MEMORY[0x1E01B8AF0]();
  v11 = self;
  objc_sync_enter(v11);
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
  if (v12)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_31:
    __int16 v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:0 file:@"C2Session.m" lineNumber:426 description:@"C2Session must not be nil."];

    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_32;
  }
  id v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, v11, @"C2Session.m", 425, @"task %@ should always have a task identifier", v9 object file lineNumber description];

  if (!v11) {
    goto LABEL_31;
  }
LABEL_3:
  if (v8) {
    goto LABEL_4;
  }
LABEL_32:
  id v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2 object:v11 file:@"C2Session.m" lineNumber:426 description:@"NSURLSession must not be nil."];

LABEL_4:
  uint64_t v13 = [(C2Session *)v11 session];
  v14 = [v13 configuration];
  uint64_t v15 = [v14 identifier];

  uint64_t v16 = [v8 configuration];
  uint64_t v17 = [v16 identifier];

  if ([(C2Session *)v11 isComplete]) {
    goto LABEL_13;
  }
  if (v15 | v17)
  {
    if (v15)
    {
      if (v17)
      {
LABEL_8:
        if ([(id)v15 isEqual:v17]) {
          goto LABEL_11;
        }
        BOOL v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2, v11, @"C2Session.m", 426, @"Callbacks should only occur for member session. %@ != %@", v15, v17 object file lineNumber description];
        goto LABEL_36;
      }
    }
    else
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2 object:v11 file:@"C2Session.m" lineNumber:426 description:@"C2Session missing background configuration identifier."];

      if (v17) {
        goto LABEL_8;
      }
    }
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:v11 file:@"C2Session.m" lineNumber:426 description:@"NSURLSession missing background configuration identifier."];

    goto LABEL_8;
  }
  id v19 = [(C2Session *)v11 session];

  if (v19 == v8) {
    goto LABEL_11;
  }
  BOOL v18 = [MEMORY[0x1E4F28B00] currentHandler];
  v38 = [(C2Session *)v11 session];
  [v18 handleFailureInMethod:a2, v11, @"C2Session.m", 426, @"Callbacks should only occur for member session. %@ != %@", v38, v8 object file lineNumber description];

LABEL_36:
LABEL_11:
  v20 = [MEMORY[0x1E4F28F08] currentQueue];
  uint64_t v21 = [(C2Session *)v11 queue];
  char v22 = [v20 isEqual:v21];

  if ((v22 & 1) == 0)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:v11 file:@"C2Session.m" lineNumber:426 description:@"Callbacks should always occur on member queue"];
  }
LABEL_13:

  v23 = [(NSMutableDictionary *)v11->_wrappedTaskByTaskIdentifier objectForKeyedSubscript:v12];
  objc_sync_exit(v11);

  if (v23)
  {
    v24 = [v23 taskDescription];
    if (!v24)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2, v11, @"C2Session.m", 431, @"wrappedTask %@ should always have a task description", v23 object file lineNumber description];
    }
    v25 = [v9 taskDescription];
    v26 = v25;
    if (v25)
    {
      if (([v25 isEqual:v24] & 1) == 0)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:a2, v11, @"C2Session.m", 436, @"taskDescription (%@) inconsistent with expected taskDescription (%@)", v26, v24 object file lineNumber description];
      }
    }
    else
    {
      if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_160_0);
      }
      v29 = C2_DEFAULT_LOG_INTERNAL_5;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v12;
        _os_log_impl(&dword_1DD523000, v29, OS_LOG_TYPE_ERROR, "task %{public}@ lost its task description", buf, 0xCu);
      }
    }
    __int16 v30 = [(C2Session *)v11 options];
    [v30 handleCallbackForSessionTask:v23 dataTask:v9 callback:v10];
  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_166_0);
    }
    v28 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v12;
      _os_log_impl(&dword_1DD523000, v28, OS_LOG_TYPE_ERROR, "ignoring callback for unknown task %{public}@", buf, 0xCu);
    }
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (C2RequestOptions)options
{
  return self->_options;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

void __88__C2Session_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_183);
  }
  id v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    v12 = (const void *)a1[8];
    uint64_t v13 = v7;
    v14 = _Block_copy(v12);
    int v15 = 138544386;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1DD523000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ _willSendRequestForEstablishedConnection:%{public}@ completionHandler:%{public}@]", (uint8_t *)&v15, 0x34u);
  }
  if (v6) {
    objc_msgSend(v6, "URLSession:task:_willSendRequestForEstablishedConnection:completionHandler:", a1[5], a1[6], a1[7], a1[8]);
  }
  else {
    (*(void (**)(void))(a1[8] + 16))();
  }
}

void __85__C2Session_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_173);
  }
  id v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    uint64_t v12 = a1[8];
    uint64_t v13 = a1[9];
    int v14 = 138544642;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    __int16 v22 = 2048;
    uint64_t v23 = v12;
    __int16 v24 = 2048;
    uint64_t v25 = v13;
    _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ didSendBodyData:%lld totalBytesSent:%lld totalBytesExpectedToSend:%lld]", (uint8_t *)&v14, 0x3Eu);
  }
  [v6 URLSession:a1[5] task:a1[6] didSendBodyData:a1[7] totalBytesSent:a1[8] totalBytesExpectedToSend:a1[9]];
}

void __70__C2Session_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_191);
  }
  id v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    uint64_t v12 = (const void *)a1[8];
    uint64_t v13 = v7;
    int v14 = _Block_copy(v12);
    int v15 = 138544386;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    __int16 v24 = v14;
    _os_log_impl(&dword_1DD523000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ dataTask:%{public}@ didReceiveResponse:%{public}@ completionHandler:%{public}@]", (uint8_t *)&v15, 0x34u);
  }
  if (v6) {
    [v6 URLSession:a1[5] dataTask:a1[6] didReceiveResponse:a1[7] completionHandler:a1[8]];
  }
  else {
    (*(void (**)(void))(a1[8] + 16))();
  }
}

void __67__C2Session_URLSession_dataTask__didReceiveData_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_195);
  }
  id v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v11 = a1[6];
    uint64_t v10 = (void *)a1[7];
    uint64_t v12 = v7;
    int v17 = 138544130;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = [v10 length];
    _os_log_impl(&dword_1DD523000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ dataTask:%{public}@ _didReceiveData:(binary data of length %lld)]", (uint8_t *)&v17, 0x2Au);
  }
  char v13 = objc_opt_respondsToSelector();
  uint64_t v14 = a1[5];
  uint64_t v15 = a1[6];
  uint64_t v16 = a1[7];
  if (v13)
  {
    objc_msgSend(v6, "URLSession:dataTask:_didReceiveData:completionHandler:", v14, v15, v16, a1[8]);
  }
  else
  {
    [v6 URLSession:v14 dataTask:v15 didReceiveData:v16];
    (*(void (**)(void))(a1[8] + 16))();
  }
}

void __56__C2Session_URLSession_task_didFinishCollectingMetrics___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_175);
  }
  id v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    int v12 = 138544131;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2113;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ didFinishCollectingMetrics:%{private}@]", (uint8_t *)&v12, 0x2Au);
  }
  [v5 didFinishCollectingMetrics:a1[7]];
}

void __50__C2Session_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_177_0);
  }
  id v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    int v19 = 138544130;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    uint64_t v24 = v10;
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ didCompleteWithError:%{public}@]", (uint8_t *)&v19, 0x2Au);
  }
  if (!*(void *)(a1 + 56))
  {
    int v12 = [*(id *)(a1 + 48) response];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v14 = [*(id *)(a1 + 48) response];
      uint64_t v15 = [v14 allHeaderFields];
      __int16 v16 = [v15 objectForKey:@"x-apple-c2-route"];

      if (v16 && [v16 length]) {
        [*(id *)(a1 + 32) C2Session:*(void *)(a1 + 32) sessionTask:v5 updatedRoute:v16];
      }
    }
  }
  [v5 captureMetricsWithError:*(void *)(a1 + 56) eventType:1];
  if (v5)
  {
    id v17 = *(id *)(a1 + 32);
    objc_sync_enter(v17);
    [*(id *)(*(void *)(a1 + 32) + 72) addObject:v5];
    objc_sync_exit(v17);
  }
  [v5 C2Session:*(void *)(a1 + 32) task:v5 didCompleteWithError:*(void *)(a1 + 56)];
  [v6 URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 56)];
  if (v5)
  {
    id v18 = *(id *)(a1 + 32);
    objc_sync_enter(v18);
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:v5];
    objc_sync_exit(v18);
  }
}

- (BOOL)shouldInvalidateAndCancel
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  mach_absolute_time();
  v39 = objc_opt_new();
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableDictionary *)v4->_wrappedTaskByTaskIdentifier count];
  if (!v4->_sessionDelegate)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_112);
    }
    uint64_t v8 = C2_DEFAULT_LOG_INTERNAL_5;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    sessionDelegate = v4->_sessionDelegate;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = sessionDelegate;
    uint64_t v9 = "[%@ shouldInvalidateAndCancel] - Session State Undefined, _sessionDelegate:%@";
LABEL_13:
    _os_log_impl(&dword_1DD523000, v8, OS_LOG_TYPE_DEBUG, v9, buf, 0x16u);
    goto LABEL_23;
  }
  uint64_t v6 = v5;
  int64_t emptyTimestamp = v4->_emptyTimestamp;
  if (v5)
  {
    if (emptyTimestamp != -1)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
    }
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_109);
    }
    uint64_t v8 = C2_DEFAULT_LOG_INTERNAL_5;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    uint64_t v9 = "[%@ shouldInvalidateAndCancel] - %lld outstanding tasks";
    goto LABEL_13;
  }
  if (emptyTimestamp == -1)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  TMConvertTicksToSeconds();
  double v12 = v11;
  [(C2RequestOptions *)v4->_options emptySessionExpiryInSeconds];
  if (v12 > v13)
  {
    __int16 v14 = v4->_sessionDelegate;
    v4->_sessionDelegate = 0;

    objc_sync_exit(v4);
    BOOL v15 = 1;
    goto LABEL_39;
  }
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_100);
  }
  __int16 v16 = (id)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int64_t v17 = v4->_emptyTimestamp;
    [(C2RequestOptions *)v4->_options emptySessionExpiryInSeconds];
    uint64_t v19 = v18;
    [(C2RequestOptions *)v4->_options emptySessionExpiryInSeconds];
    double v21 = v20;
    TMConvertTicksToSeconds();
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v17;
    __int16 v47 = 2048;
    uint64_t v48 = v19;
    __int16 v49 = 2048;
    double v50 = v21 - v22;
    _os_log_impl(&dword_1DD523000, v16, OS_LOG_TYPE_DEBUG, "[%@ shouldInvalidateAndCancel] - emptyTimestamp:%llu expirySeconds:%.0f secondsRemaining:%.0f", buf, 0x2Au);
  }

LABEL_23:
  __int16 v23 = [(NSMutableDictionary *)v4->_wrappedTaskByTaskIdentifier allValues];
  [v39 addObjectsFromArray:v23];

  uint64_t v24 = [(NSMutableSet *)v4->_didCompleteWithErrorRunningTasks allObjects];
  [v39 addObjectsFromArray:v24];

  objc_sync_exit(v4);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v39;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v42;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = *(void **)(*((void *)&v41 + 1) + 8 * v28);
        uint64_t v30 = [v29 callbackHung];
        if (v30)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          id v31 = [v29 activity];
          os_activity_scope_enter(v31, (os_activity_scope_state_t)buf);

          if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_115);
          }
          __int16 v32 = C2_DEFAULT_LOG_INTERNAL_5;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v40 = 0;
            _os_log_impl(&dword_1DD523000, v32, OS_LOG_TYPE_FAULT, "C2 callback hung.", v40, 2u);
          }
          os_activity_scope_leave((os_activity_scope_state_t)buf);
        }
        testBehavior_callbackHung = (void (**)(id, uint64_t))v4->_testBehavior_callbackHung;
        if (testBehavior_callbackHung) {
          testBehavior_callbackHung[2](testBehavior_callbackHung, v30);
        }
        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v26);
  }

  BOOL v15 = 0;
LABEL_39:
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_118);
  }
  uint64_t v34 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v35 = @"false";
    if (v15) {
      v35 = @"true";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v35;
    _os_log_impl(&dword_1DD523000, v34, OS_LOG_TYPE_DEBUG, "[%@ shouldInvalidateAndCancel] --> %{public}@", buf, 0x16u);
  }

  return v15;
}

- (C2Session)initWithSessionConfigurationName:(id)a3 routeHost:(id)a4 options:(id)a5 sessionDelegate:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  __int16 v14 = (C2Session *)a6;
  v61.receiver = self;
  v61.super_class = (Class)C2Session;
  BOOL v15 = [(C2Session *)&v61 init];
  p_info = C2RequestOptions.info;
  int64_t v17 = C2RequestOptions.info;
  if (!v15) {
    goto LABEL_36;
  }
  if (!v11 || !v13 || !v14)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_11);
    }
    uint64_t v27 = C2_DEFAULT_LOG_INTERNAL_5;
    BOOL v28 = os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR);
    int64_t v17 = C2RequestOptions.info;
    p_info = C2RequestOptions.info;
    if (v28)
    {
      *(_DWORD *)buf = 138412802;
      id v63 = v11;
      __int16 v64 = 2112;
      id v65 = v13;
      __int16 v66 = 2112;
      v67 = v14;
      _os_log_impl(&dword_1DD523000, v27, OS_LOG_TYPE_ERROR, "missing required arguments - [C2Session initWithSessionConfigurationName:%@ options:%@ sessionDelegate:%@]", buf, 0x20u);
      p_info = C2RequestOptions.info;
      int64_t v17 = C2RequestOptions.info;
    }
    goto LABEL_36;
  }
  uint64_t v18 = [v13 sessionConfigurationWithName:v11];
  if (!v18)
  {
    v29 = C2RequestOptions.info;
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_6);
      v29 = (__objc2_class_ro **)(C2RequestOptions + 32);
    }
    uint64_t v30 = v29[152];
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    int64_t v17 = (__objc2_class_ro **)(C2RequestOptions + 32);
    p_info = (__objc2_class_ro **)(C2RequestOptions + 32);
    if (v31)
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v13;
      _os_log_impl(&dword_1DD523000, v30, OS_LOG_TYPE_ERROR, "failed to create NSURLSessionConfiguration for C2Session from Options %@", buf, 0xCu);
      p_info = (__objc2_class_ro **)(C2RequestOptions + 32);
      int64_t v17 = (__objc2_class_ro **)(C2RequestOptions + 32);
    }
    goto LABEL_36;
  }
  uint64_t v19 = (void *)v18;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v20)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_9_0);
    }
    __int16 v32 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD523000, v32, OS_LOG_TYPE_ERROR, "failed to create NSMutableDictionary for C2Session", buf, 2u);
    }
    goto LABEL_35;
  }
  id v60 = v20;
  id obj = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (!obj)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_13);
    }
    id v33 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD523000, v33, OS_LOG_TYPE_ERROR, "failed to create NSMutableSet for C2Session", buf, 2u);
    }
    goto LABEL_34;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  if (!v21)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_17_0);
    }
    uint64_t v34 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD523000, v34, OS_LOG_TYPE_ERROR, "failed to create NSOperationQueue for C2Session", buf, 2u);
    }

LABEL_34:
LABEL_35:

    int64_t v17 = C2RequestOptions.info;
    p_info = C2RequestOptions.info;
LABEL_36:
    if (p_info[143] != (__objc2_class_ro *)-1)
    {
      uint64_t v51 = v17;
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_25_0);
      int64_t v17 = v51;
    }
    v35 = v17[152];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD523000, v35, OS_LOG_TYPE_ERROR, "failed to create C2Session", buf, 2u);
    }
    v15->_isComplete = 1;

    BOOL v15 = 0;
    goto LABEL_41;
  }
  id v55 = v12;
  v58 = v19;
  double v22 = v21;
  uint64_t v54 = [(C2Session *)v14 underlyingDelegateQueue];
  if (v54)
  {
    __int16 v23 = [(C2Session *)v14 underlyingDelegateQueue];
    [v22 setUnderlyingQueue:v23];
  }
  id v56 = v22;
  [v22 setQualityOfService:9];
  uint64_t v24 = objc_opt_class();
  id v25 = [v13 networkingDelegate];

  if (v25) {
    uint64_t v26 = objc_opt_class();
  }
  else {
    uint64_t v26 = (void *)v24;
  }
  v57 = [v26 sessionWithConfiguration:v58 delegate:v15 delegateQueue:v56];
  if (v57)
  {
    v37 = [v13 networkingDelegate];

    if (v37)
    {
      v38 = [v13 networkingDelegate];
      [v57 setNetworkingDelegate:v38];
    }
    uint64_t v39 = [v58 identifier];
    if (v39) {
      id v40 = (id)v39;
    }
    else {
      id v40 = v11;
    }
    objc_msgSend(v57, "setSessionDescription:", v40, v39);
    objc_storeStrong((id *)&v15->_sessionConfigurationName, a3);
    objc_storeStrong((id *)&v15->_routeHost, a4);
    v15->_routeLastUpdated = 0.0;
    objc_storeStrong((id *)&v15->_didCompleteWithErrorRunningTasks, obj);
    id v41 = a5;
    long long v42 = obj;
    objc_storeStrong((id *)&v15->_options, v41);
    objc_storeStrong((id *)&v15->_session, v57);
    objc_storeStrong((id *)&v15->_wrappedTaskByTaskIdentifier, v60);
    long long v43 = v56;
    objc_storeStrong((id *)&v15->_queue, v56);
    v15->_isComplete = 0;
    objc_storeStrong((id *)&v15->_sessionDelegate, a6);
    v15->_int64_t emptyTimestamp = -1;
    id testBehavior_sessionInvalidated_cfnetwork = v15->_testBehavior_sessionInvalidated_cfnetwork;
    v15->_id testBehavior_sessionInvalidated_cfnetwork = 0;

    id testBehavior_sessionInvalidated_shouldInvalidate = v15->_testBehavior_sessionInvalidated_shouldInvalidate;
    v15->_id testBehavior_sessionInvalidated_shouldInvalidate = 0;

    id testBehavior_cleanupRetainCycle = v15->_testBehavior_cleanupRetainCycle;
    v15->_id testBehavior_cleanupRetainCycle = 0;

    __int16 v47 = (void *)v54;
    id v12 = v55;
  }
  else
  {
    aClass = (objc_class *)v26;
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_22_0);
    }
    long long v42 = obj;
    __int16 v47 = (void *)v54;
    uint64_t v48 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
    id v12 = v55;
    long long v43 = v56;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      __int16 v49 = v48;
      double v50 = NSStringFromClass(aClass);
      *(_DWORD *)buf = 138413058;
      id v63 = v50;
      __int16 v64 = 2112;
      id v65 = v58;
      __int16 v66 = 2112;
      v67 = v15;
      __int16 v68 = 2112;
      id v69 = v56;
      _os_log_impl(&dword_1DD523000, v49, OS_LOG_TYPE_ERROR, "failed to create NSURLSession for C2Session - [%@ sessionWithConfiguration:%@ delegate:%@ delegateQueue:%@]", buf, 0x2Au);
    }
  }

  int64_t v17 = (__objc2_class_ro **)(C2RequestOptions + 32);
  p_info = (__objc2_class_ro **)(C2RequestOptions + 32);
  if (!v57) {
    goto LABEL_36;
  }
LABEL_41:

  return v15;
}

- (id)createTaskWithOptions:(id)a3 delegate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSURLSession *)a3;
  id v7 = a4;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_36_0);
  }
  uint64_t v8 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138543874;
    int64_t v17 = self;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_1DD523000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@ createDataTaskWithOptions:%{public}@ delegate:%{public}@]", (uint8_t *)&v16, 0x20u);
  }
  if (v6 && v7)
  {
    uint64_t v9 = [[C2SessionTask alloc] initWithOptions:v6 delegate:v7 sessionTaskDelegate:self];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_43_0);
      }
      id v13 = C2_DEFAULT_LOG_INTERNAL_5;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
      {
        session = self->_session;
        int v16 = 138543618;
        int64_t v17 = self;
        __int16 v18 = 2114;
        uint64_t v19 = session;
        _os_log_impl(&dword_1DD523000, v13, OS_LOG_TYPE_ERROR, "%{public}@ can't create a new wrapped data task in session %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_39_0);
    }
    id v12 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543874;
      int64_t v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v6;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl(&dword_1DD523000, v12, OS_LOG_TYPE_ERROR, "missing required arguments - [%{public}@ createTaskWithOptions:%{public}@ delegate:%{public}@]", (uint8_t *)&v16, 0x20u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)C2Session:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (C2Session *)a3;
  id v10 = a4;
  id v11 = a5;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_132);
  }
  id v12 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138544130;
    BOOL v15 = self;
    __int16 v16 = 2114;
    int64_t v17 = v9;
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_1DD523000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@ C2Session:%{public}@ task:%{public}@ didCompleteWithError:%{public}@]", (uint8_t *)&v14, 0x2Au);
  }
  if (v9 != self)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:385 description:@"Callbacks should only occur for self."];
  }
  [(C2Session *)self removeTask:v10];
}

- (void)removeTask:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"C2Session.m", 215, @"task must not be nil.", 0);
  }
  uint64_t v6 = [v5 taskIdentifier];
  if (!v6)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:217 description:@"Task identifier should always be set."];
  }
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_88);
  }
  id v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 2114;
    __int16 v23 = v6;
    _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ removeTask:%{public}@] - withIdentifier:%{public}@", buf, 0x20u);
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMutableDictionary *)v8->_wrappedTaskByTaskIdentifier objectForKeyedSubscript:v6];
  BOOL v10 = v9 == v5;

  if (!v10)
  {
    BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v16 = [(NSMutableDictionary *)v8->_wrappedTaskByTaskIdentifier objectForKeyedSubscript:v6];
    [v15 handleFailureInMethod:a2, v8, @"C2Session.m", 220, @"taskIdentifier(%@) should be map to task (%@) but mapped to (%@) ", v6, v5, v16 object file lineNumber description];
  }
  [(NSMutableDictionary *)v8->_wrappedTaskByTaskIdentifier setObject:0 forKeyedSubscript:v6];
  id v11 = [(NSMutableDictionary *)v8->_wrappedTaskByTaskIdentifier objectForKeyedSubscript:v6];
  BOOL v12 = v11 == 0;

  if (!v12)
  {
    int64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:v8 file:@"C2Session.m" lineNumber:222 description:@"wrapped task should no longer be present"];
  }
  [(C2Session *)v8 _recalculateSessionDelegateQueuePriority];
  if (![(NSMutableDictionary *)v8->_wrappedTaskByTaskIdentifier count]) {
    v8->_int64_t emptyTimestamp = mach_absolute_time();
  }
  objc_sync_exit(v8);

  [(C2Session *)v8 cleanupRetainCycle];
}

- (void)cleanupRetainCycle
{
  id obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isComplete)
  {
    v3 = [(C2Session *)obj wrappedTaskByTaskIdentifier];
    v2 = obj;
    if (v3)
    {
      uint64_t v4 = [(C2Session *)obj wrappedTaskByTaskIdentifier];
      uint64_t v5 = [v4 count];

      v2 = obj;
      if (!v5)
      {
        session = obj->_session;
        obj->_session = 0;

        queue = obj->_queue;
        obj->_queue = 0;

        v2 = obj;
        id testBehavior_cleanupRetainCycle = (void (**)(void))obj->_testBehavior_cleanupRetainCycle;
        if (testBehavior_cleanupRetainCycle)
        {
          testBehavior_cleanupRetainCycle[2]();
          id v9 = obj->_testBehavior_cleanupRetainCycle;
          obj->_id testBehavior_cleanupRetainCycle = 0;

          v2 = obj;
        }
      }
    }
  }
  objc_sync_exit(v2);
}

- (id)addTask:(id)a3 withDescription:(id)a4 request:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  BOOL v10 = (NSURLSession *)a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_28:
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:179 description:@"taskDescription must not be nil."];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_29;
  }
  BOOL v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:178 description:@"task must not be nil."];

  if (!v10) {
    goto LABEL_28;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_29:
  uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:180 description:@"request must not be nil."];

LABEL_4:
  BOOL v12 = [(NSURLSession *)self->_session dataTaskWithRequest:v11];
  if (v12)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_67);
    }
    id v13 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v38 = self;
      __int16 v39 = 2114;
      id v40 = v9;
      __int16 v41 = 2114;
      long long v42 = v10;
      __int16 v43 = 2114;
      id v44 = v11;
      _os_log_impl(&dword_1DD523000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ addTask:%{public}@ withDescription:%{public}@ request:%{public}@]", buf, 0x2Au);
    }
    [v12 setTaskDescription:v10];
    [v9 setTask:v12];
  }
  int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "taskIdentifier"));
  if (!v14)
  {
    BOOL v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:196 description:@"Task identifier should always be set."];
  }
  if (v12)
  {
    BOOL v15 = self;
    objc_sync_enter(v15);
    __int16 v16 = [(C2Session *)v15 wrappedTaskByTaskIdentifier];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      __int16 v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:v15 file:@"C2Session.m" lineNumber:202 description:@"task mapping must not be nil"];
    }
    __int16 v18 = [(C2Session *)v15 wrappedTaskByTaskIdentifier];
    id v19 = [v18 objectForKeyedSubscript:v14];
    BOOL v20 = v19 == 0;

    if (!v20)
    {
      id v33 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v34 = [(C2Session *)v15 wrappedTaskByTaskIdentifier];
      v35 = [v34 objectForKeyedSubscript:v14];
      [v33 handleFailureInMethod:a2, v15, @"C2Session.m", 203, @"A delegate for task %@ has already been set: %@", v14, v35 object file lineNumber description];
    }
    id v21 = [(C2Session *)v15 wrappedTaskByTaskIdentifier];
    [v21 setObject:v9 forKeyedSubscript:v14];

    __int16 v22 = [(C2Session *)v15 wrappedTaskByTaskIdentifier];
    __int16 v23 = [v22 objectForKeyedSubscript:v14];
    BOOL v24 = v23 == 0;

    if (v24)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2 object:v15 file:@"C2Session.m" lineNumber:205 description:@"invariant broken."];
    }
    [(C2Session *)v15 _recalculateSessionDelegateQueuePriority];
    v15->_int64_t emptyTimestamp = -1;
    objc_sync_exit(v15);
  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_77);
    }
    id v25 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      session = self->_session;
      *(_DWORD *)buf = 138543874;
      v38 = self;
      __int16 v39 = 2114;
      id v40 = v11;
      __int16 v41 = 2114;
      long long v42 = session;
      _os_log_impl(&dword_1DD523000, v25, OS_LOG_TYPE_ERROR, "%{public}@ can't create a new data task with request %{public}@ in session %{public}@", buf, 0x20u);
    }
  }

  return v12;
}

- (NSMutableDictionary)wrappedTaskByTaskIdentifier
{
  return self->_wrappedTaskByTaskIdentifier;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__C2Session_URLSession_task_didCompleteWithError___block_invoke;
  v14[3] = &unk_1E6CCC6B0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v13 task:v12 block:v14];
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__C2Session_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
  v18[3] = &unk_1E6CCC6D8;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v17 task:v16 block:v18];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__C2Session_URLSession_dataTask__didReceiveData_completionHandler___block_invoke;
  v18[3] = &unk_1E6CCC6D8;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v17 task:v16 block:v18];
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__C2Session_URLSession_task_didFinishCollectingMetrics___block_invoke;
  v14[3] = &unk_1E6CCC6B0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v13 task:v12 block:v14];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__C2Session_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v18[3] = &unk_1E6CCC6D8;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v17 task:v16 block:v18];
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__C2Session_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  v16[3] = &unk_1E6CCC688;
  v16[4] = self;
  id v17 = v12;
  id v18 = v13;
  int64_t v19 = a5;
  int64_t v20 = a6;
  int64_t v21 = a7;
  id v14 = v13;
  id v15 = v12;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v15 task:v14 block:v16];
}

void __53__C2Session__recalculateSessionDelegateQueuePriority__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 options];
  uint64_t v5 = [v4 qualityOfService];

  if (v5 <= 16)
  {
    if (v5 == -1)
    {
      int v6 = 2;
      goto LABEL_13;
    }
    if (v5 == 9)
    {
      int v6 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    switch(v5)
    {
      case 33:
        int v6 = 4;
        goto LABEL_13;
      case 25:
        int v6 = 3;
        goto LABEL_13;
      case 17:
        int v6 = 1;
        goto LABEL_13;
    }
  }
  int v6 = -1;
LABEL_13:
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8 <= 16)
  {
    if (v8 == -1)
    {
      int v9 = 2;
      goto LABEL_25;
    }
    if (v8 == 9)
    {
      int v9 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    switch(v8)
    {
      case 33:
        int v9 = 4;
        goto LABEL_25;
      case 25:
        int v9 = 3;
        goto LABEL_25;
      case 17:
        int v9 = 1;
        goto LABEL_25;
    }
  }
  int v9 = -1;
LABEL_25:
  if (v6 > v9) {
    *(void *)(v7 + 24) = v5;
  }
}

- (NSString)sessionConfigurationName
{
  return self->_sessionConfigurationName;
}

- (void)invalidateAndCancel
{
}

- (void)dealloc
{
  if (!self->_isComplete)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:133 description:@"C2Session should always be complete at this point."];
  }
  v5.receiver = self;
  v5.super_class = (Class)C2Session;
  [(C2Session *)&v5 dealloc];
}

- (void)C2Session:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v18 = (C2Session *)a3;
  id v7 = a4;
  if (v18 != self)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:358 description:@"Callbacks should only occur for self."];
  }
  id testBehavior_sessionInvalidated_shouldInvalidate = (void (**)(void))self->_testBehavior_sessionInvalidated_shouldInvalidate;
  if (testBehavior_sessionInvalidated_shouldInvalidate)
  {
    testBehavior_sessionInvalidated_shouldInvalidate[2]();
    id v9 = self->_testBehavior_sessionInvalidated_shouldInvalidate;
    self->_id testBehavior_sessionInvalidated_shouldInvalidate = 0;
  }
  id v10 = self;
  objc_sync_enter(v10);
  id v11 = v10->_sessionDelegate;
  sessionDelegate = v10->_sessionDelegate;
  v10->_sessionDelegate = 0;

  objc_sync_exit(v10);
  id testBehavior_sessionInvalidated_cfnetwork = (void (**)(void))v10->_testBehavior_sessionInvalidated_cfnetwork;
  if (testBehavior_sessionInvalidated_cfnetwork)
  {
    testBehavior_sessionInvalidated_cfnetwork[2]();
    id v14 = v10->_testBehavior_sessionInvalidated_cfnetwork;
    v10->_id testBehavior_sessionInvalidated_cfnetwork = 0;
  }
  [(C2SessionDelegate *)v11 C2Session:v10 didBecomeInvalidWithError:v7];
  id v15 = v10;
  objc_sync_enter(v15);
  if (v15->_isComplete)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:v15 file:@"C2Session.m" lineNumber:375 description:@"received duplicate callbacks"];
  }
  v15->_isComplete = 1;
  objc_sync_exit(v15);

  [(C2Session *)v15 cleanupRetainCycle];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testBehavior_callbackHung, 0);
  objc_storeStrong(&self->_testBehavior_cleanupRetainCycle, 0);
  objc_storeStrong(&self->_testBehavior_sessionInvalidated_shouldInvalidate, 0);
  objc_storeStrong(&self->_testBehavior_sessionInvalidated_cfnetwork, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wrappedTaskByTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionDelegate, 0);
  objc_storeStrong((id *)&self->_didCompleteWithErrorRunningTasks, 0);
  objc_storeStrong((id *)&self->_routeHost, 0);
  objc_storeStrong((id *)&self->_originalHost, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionConfigurationName, 0);
}

uint64_t __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_4()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_7()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_11()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_15()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_20()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_23()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __44__C2Session_createTaskWithOptions_delegate___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __44__C2Session_createTaskWithOptions_delegate___block_invoke_37()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __44__C2Session_createTaskWithOptions_delegate___block_invoke_41()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __53__C2Session__recalculateSessionDelegateQueuePriority__block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

+ (id)portFromURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 port];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [v3 scheme];
    char v8 = [v7 isEqual:@"http"];

    if (v8)
    {
      id v6 = &unk_1F38C4ED8;
    }
    else
    {
      id v9 = [v3 scheme];
      int v10 = [v9 isEqual:@"https"];

      if (v10) {
        id v6 = &unk_1F38C4EF0;
      }
      else {
        id v6 = 0;
      }
    }
  }

  return v6;
}

uint64_t __45__C2Session_addTask_withDescription_request___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __45__C2Session_addTask_withDescription_request___block_invoke_68()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __45__C2Session_addTask_withDescription_request___block_invoke_75()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __24__C2Session_removeTask___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (int64_t)emptyTimestamp
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t emptyTimestamp = v2->_emptyTimestamp;
  objc_sync_exit(v2);

  return emptyTimestamp;
}

- (BOOL)shouldRemoveEmptySession
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t emptyTimestamp = v2->_emptyTimestamp;
  if (emptyTimestamp != -1)
  {
    sessionDelegate = v2->_sessionDelegate;
    v2->_sessionDelegate = 0;
  }
  objc_sync_exit(v2);

  return emptyTimestamp != -1;
}

uint64_t __38__C2Session_shouldInvalidateAndCancel__block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__C2Session_shouldInvalidateAndCancel__block_invoke_107()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__C2Session_shouldInvalidateAndCancel__block_invoke_110()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__C2Session_shouldInvalidateAndCancel__block_invoke_113()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__C2Session_shouldInvalidateAndCancel__block_invoke_116()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)testBehavior_setSessionExpiry:(int64_t)a3
{
  id obj = self;
  objc_sync_enter(obj);
  if (![(NSMutableDictionary *)obj->_wrappedTaskByTaskIdentifier count]) {
    obj->_int64_t emptyTimestamp = a3;
  }
  objc_sync_exit(obj);
}

- (void)testBehavior_triggerSessionExpiry
{
  id obj = self;
  objc_sync_enter(obj);
  if (![(NSMutableDictionary *)obj->_wrappedTaskByTaskIdentifier count]) {
    obj->_int64_t emptyTimestamp = 0;
  }
  objc_sync_exit(obj);
}

- (void)testBehavior_triggerCallbackHang
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(NSMutableDictionary *)v2->_wrappedTaskByTaskIdentifier allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v6++), "testBehavior_triggerCallbackHang");
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v4);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v2->_didCompleteWithErrorRunningTasks;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "testBehavior_triggerCallbackHang", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v2);
}

- (void)C2Session:(id)a3 sessionTask:(id)a4 updatedRoute:(id)a5
{
  int64_t v19 = (C2Session *)a3;
  id v9 = a4;
  id v10 = a5;
  if (v19 != self)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"C2Session.m" lineNumber:326 description:@"Callbacks should only occur for self."];
  }
  long long v11 = [v9 options];
  int v12 = [v11 allowRouting];

  if (v12)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    long long v14 = self;
    objc_sync_enter(v14);
    if (Current <= v14->_routeLastUpdated + 900.0)
    {
      objc_sync_exit(v14);
    }
    else
    {
      v14->_routeLastUpdated = Current;
      objc_sync_exit(v14);

      sessionDelegate = v14->_sessionDelegate;
      long long v16 = [v9 options];
      long long v17 = [(C2Session *)v16 originalHost];
      [(C2SessionDelegate *)sessionDelegate C2Session:v14 originalHost:v17 updatedRoute:v10];

      long long v14 = v16;
    }
  }
}

uint64_t __49__C2Session_C2Session_task_didCompleteWithError___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __50__C2Session_URLSession_didBecomeInvalidWithError___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __58__C2Session_sessionTaskDelegateCallbackHelper_task_block___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __58__C2Session_sessionTaskDelegateCallbackHelper_task_block___block_invoke_164()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__C2Session_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v22[3] = &unk_1E6CCC638;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v21 task:v20 block:v22];
}

void __85__C2Session_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_168);
  }
  id v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    uint64_t v13 = a1[8];
    id v12 = (const void *)a1[9];
    id v14 = v7;
    id v15 = _Block_copy(v12);
    int v16 = 138544642;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    __int16 v24 = 2114;
    uint64_t v25 = v13;
    __int16 v26 = 2114;
    id v27 = v15;
    _os_log_impl(&dword_1DD523000, v14, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ willPerformHTTPRedirection:%{public}@ newRequest:%{public}@ completionHandler:%{public}@]", (uint8_t *)&v16, 0x3Eu);
  }
  if (v6) {
    [v6 URLSession:a1[5] task:a1[6] willPerformHTTPRedirection:a1[7] newRequest:a1[8] completionHandler:a1[9]];
  }
  else {
    (*(void (**)(void))(a1[9] + 16))();
  }
}

uint64_t __85__C2Session_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__C2Session_URLSession_task_needNewBodyStream___block_invoke;
  v14[3] = &unk_1E6CCC660;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v13 task:v12 block:v14];
}

void __47__C2Session_URLSession_task_needNewBodyStream___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_171);
  }
  id v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v11 = a1[6];
    id v10 = (const void *)a1[7];
    id v12 = v7;
    id v13 = _Block_copy(v10);
    int v14 = 138544130;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    _os_log_impl(&dword_1DD523000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ needNewBodyStream:%{public}@]", (uint8_t *)&v14, 0x2Au);
  }
  if (v6) {
    [v6 URLSession:a1[5] task:a1[6] needNewBodyStream:a1[7]];
  }
  else {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

uint64_t __47__C2Session_URLSession_task_needNewBodyStream___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __85__C2Session_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __56__C2Session_URLSession_task_didFinishCollectingMetrics___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __50__C2Session_URLSession_task_didCompleteWithError___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __88__C2Session_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)URLSession:(id)a3 _taskIsWaitingForConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__C2Session_URLSession__taskIsWaitingForConnection___block_invoke;
  v10[3] = &unk_1E6CCC700;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v9 task:v8 block:v10];
}

void __52__C2Session_URLSession__taskIsWaitingForConnection___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_185);
  }
  id v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ _taskIsWaitingForConnection:%{public}@]", (uint8_t *)&v11, 0x20u);
  }
  objc_msgSend(v6, "URLSession:_taskIsWaitingForConnection:", a1[5], a1[6]);
}

uint64_t __52__C2Session_URLSession__taskIsWaitingForConnection___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__C2Session_URLSession_task__conditionalRequirementsChanged___block_invoke;
  v12[3] = &unk_1E6CCC728;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  BOOL v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v11 task:v10 block:v12];
}

void __61__C2Session_URLSession_task__conditionalRequirementsChanged___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_187);
  }
  id v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 56)) {
      id v11 = "true";
    }
    else {
      id v11 = "false";
    }
    int v12 = 138544130;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2082;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ _conditionalRequirementsChanged:%{public}s]", (uint8_t *)&v12, 0x2Au);
  }
  objc_msgSend(v6, "URLSession:task:_conditionalRequirementsChanged:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __61__C2Session_URLSession_task__conditionalRequirementsChanged___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __70__C2Session_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__C2Session_URLSession_dataTask_didReceiveData___block_invoke;
  v14[3] = &unk_1E6CCC6B0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v13 task:v12 block:v14];
}

void __48__C2Session_URLSession_dataTask_didReceiveData___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_193);
  }
  id v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v11 = a1[6];
    id v10 = (void *)a1[7];
    id v12 = v7;
    int v13 = 138544130;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v11;
    __int16 v19 = 2048;
    uint64_t v20 = [v10 length];
    _os_log_impl(&dword_1DD523000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ dataTask:%{public}@ didReceiveData:(binary data of length %lld)]", (uint8_t *)&v13, 0x2Au);
  }
  [v6 URLSession:a1[5] dataTask:a1[6] didReceiveData:a1[7]];
}

uint64_t __48__C2Session_URLSession_dataTask_didReceiveData___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __67__C2Session_URLSession_dataTask__didReceiveData_completionHandler___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__C2Session_URLSession__willRetryBackgroundDataTask_withError___block_invoke;
  v14[3] = &unk_1E6CCC6B0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(C2Session *)self sessionTaskDelegateCallbackHelper:v13 task:v12 block:v14];
}

void __63__C2Session_URLSession__willRetryBackgroundDataTask_withError___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_199);
  }
  id v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    int v12 = 138544130;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ _willRetryBackgroundDataTask:%{public}@ withError:%{public}@]", (uint8_t *)&v12, 0x2Au);
  }
  [v5 captureMetricsWithError:a1[7] eventType:2];
  objc_msgSend(v6, "URLSession:_willRetryBackgroundDataTask:withError:", a1[5], a1[6], a1[7]);
}

uint64_t __63__C2Session_URLSession__willRetryBackgroundDataTask_withError___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)setEmptyTimestamp:(int64_t)a3
{
  self->_int64_t emptyTimestamp = a3;
}

- (NSString)originalHost
{
  return self->_originalHost;
}

- (void)setOriginalHost:(id)a3
{
}

- (NSString)routeHost
{
  return self->_routeHost;
}

- (void)setRouteHost:(id)a3
{
}

- (double)routeLastUpdated
{
  return self->_routeLastUpdated;
}

- (void)setRouteLastUpdated:(double)a3
{
  self->_routeLastUpdated = a3;
}

- (NSMutableSet)didCompleteWithErrorRunningTasks
{
  return self->_didCompleteWithErrorRunningTasks;
}

- (void)setDidCompleteWithErrorRunningTasks:(id)a3
{
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (C2SessionDelegate)sessionDelegate
{
  return self->_sessionDelegate;
}

- (void)setSessionDelegate:(id)a3
{
}

- (id)testBehavior_sessionInvalidated_cfnetwork
{
  return self->_testBehavior_sessionInvalidated_cfnetwork;
}

- (void)setTestBehavior_sessionInvalidated_cfnetwork:(id)a3
{
}

- (id)testBehavior_sessionInvalidated_shouldInvalidate
{
  return self->_testBehavior_sessionInvalidated_shouldInvalidate;
}

- (void)setTestBehavior_sessionInvalidated_shouldInvalidate:(id)a3
{
}

- (id)testBehavior_cleanupRetainCycle
{
  return self->_testBehavior_cleanupRetainCycle;
}

- (void)setTestBehavior_cleanupRetainCycle:(id)a3
{
}

- (id)testBehavior_callbackHung
{
  return self->_testBehavior_callbackHung;
}

- (void)setTestBehavior_callbackHung:(id)a3
{
}

@end