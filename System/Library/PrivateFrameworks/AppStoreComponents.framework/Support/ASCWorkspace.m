@interface ASCWorkspace
+ (ASCWorkspace)sharedWorkspace;
+ (OS_os_log)log;
+ (void)withSharedWorkspace:(id)a3 perform:(id)a4;
- (BOOL)isExtension;
- (NSMutableDictionary)pendingResults;
- (NSOperationQueue)openApplicationOperationQueue;
- (NSRecursiveLock)stateLock;
- (id)_init;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5;
- (id)openProductURL:(id)a3;
- (id)openSensitiveURL:(id)a3;
- (id)openSensitiveURL:(id)a3 frontBoardOptions:(id)a4;
- (id)openURL:(id)a3;
- (id)openURL:(id)a3 frontBoardOptions:(id)a4;
- (id)popPendingResultForOperationName:(id)a3;
- (void)enqueueOpenApplicationOperation:(id)a3 pendingResult:(id)a4;
- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 pendingResult:(id)a5;
- (void)openApplicationWithBundleIdentifier:(id)a3 usingOpenResourceOperationWithPayloadURL:(id)a4 options:(id)a5 pendingResult:(id)a6;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)setOpenApplicationOperationQueue:(id)a3;
@end

@implementation ASCWorkspace

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4
{
  return [(ASCWorkspace *)self openApplicationWithBundleIdentifier:a3 payloadURL:a4 universalLinkRequired:0];
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)AMSMutableBinaryPromise);
  v11 = +[NSDictionary dictionary];
  if (v9)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100026FE4;
    v16[3] = &unk_1001843B8;
    id v17 = v8;
    id v18 = v11;
    id v19 = v10;
    v20 = self;
    id v21 = v9;
    BOOL v22 = a5;
    +[LSAppLink getAppLinksWithURL:v21 completionHandler:v16];

    id v12 = v17;
  }
  else
  {
    v13 = +[ASCWorkspace log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No payload URL; opening application.", v15, 2u);
    }

    id v12 = objc_alloc_init((Class)_LSOpenConfiguration);
    [v12 setFrontBoardOptions:v11];
    [(ASCWorkspace *)self openApplicationWithBundleIdentifier:v8 configuration:v12 pendingResult:v10];
  }

  return v10;
}

- (void)openApplicationWithBundleIdentifier:(id)a3 usingOpenResourceOperationWithPayloadURL:(id)a4 options:(id)a5 pendingResult:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[LSApplicationWorkspace defaultWorkspace];
  v15 = [v14 operationToOpenResource:v12 usingApplication:v13 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:v11 delegate:self];

  v16 = +[ASCWorkspace log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Enqueuing open resource URL operation", buf, 2u);
  }

  [(ASCWorkspace *)self enqueueOpenApplicationOperation:v15 pendingResult:v10];
}

- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 pendingResult:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[LSApplicationWorkspace defaultWorkspace];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002767C;
  v12[3] = &unk_100183E28;
  id v13 = v7;
  id v11 = v7;
  [v10 openApplicationWithBundleIdentifier:v9 configuration:v8 completionHandler:v12];
}

- (id)openProductURL:(id)a3
{
  return [(ASCWorkspace *)self openURL:a3 frontBoardOptions:0];
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v4 = a3;
  v5 = +[ASCWorkspace log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Open resource URL operation completed", v8, 2u);
  }

  v6 = [v4 name];

  id v7 = [(ASCWorkspace *)self popPendingResultForOperationName:v6];

  [v7 finishWithSuccess];
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ASCWorkspace log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10013F968();
  }

  id v9 = [v7 name];

  id v10 = [(ASCWorkspace *)self popPendingResultForOperationName:v9];

  [v10 finishWithError:v6];
}

+ (OS_os_log)log
{
  if (qword_1001A60C0 != -1) {
    dispatch_once(&qword_1001A60C0, &stru_1001843D8);
  }
  v2 = (void *)qword_1001A60C8;

  return (OS_os_log *)v2;
}

+ (ASCWorkspace)sharedWorkspace
{
  v2 = (void *)qword_1001A60B8;
  if (!qword_1001A60B8)
  {
    if (qword_1001A60D0 != -1) {
      dispatch_once(&qword_1001A60D0, &stru_1001843F8);
    }
    v2 = (void *)qword_1001A60D8;
  }
  id v3 = v2;

  return (ASCWorkspace *)v3;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)ASCWorkspace;
  v2 = [(ASCWorkspace *)&v6 init];
  if (v2)
  {
    id v3 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    stateLock = v2->_stateLock;
    v2->_stateLock = v3;
  }
  return v2;
}

+ (void)withSharedWorkspace:(id)a3 perform:(id)a4
{
  id v9 = a3;
  objc_super v6 = (void (**)(void))a4;
  id v7 = (id)qword_1001A60B8;
  objc_storeStrong((id *)&qword_1001A60B8, a3);
  v6[2](v6);
  id v8 = (void *)qword_1001A60B8;
  qword_1001A60B8 = (uint64_t)v7;
}

- (id)openURL:(id)a3
{
  return [(ASCWorkspace *)self openURL:a3 frontBoardOptions:0];
}

- (id)openURL:(id)a3 frontBoardOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)AMSMutableBinaryPromise);
  id v8 = objc_alloc_init((Class)_LSOpenConfiguration);
  [v8 setFrontBoardOptions:v5];

  id v9 = +[LSApplicationWorkspace defaultWorkspace];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027C74;
  v12[3] = &unk_100184420;
  id v10 = v7;
  id v13 = v10;
  [v9 openURL:v6 configuration:v8 completionHandler:v12];

  return v10;
}

- (id)openSensitiveURL:(id)a3
{
  return [(ASCWorkspace *)self openSensitiveURL:a3 frontBoardOptions:0];
}

- (id)openSensitiveURL:(id)a3 frontBoardOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)AMSMutableBinaryPromise);
  id v8 = objc_alloc_init((Class)_LSOpenConfiguration);
  [v8 setSensitive:1];
  [v8 setFrontBoardOptions:v5];

  id v9 = +[LSApplicationWorkspace defaultWorkspace];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027DA8;
  v12[3] = &unk_100184420;
  id v10 = v7;
  id v13 = v10;
  [v9 openURL:v6 configuration:v8 completionHandler:v12];

  return v10;
}

- (void)enqueueOpenApplicationOperation:(id)a3 pendingResult:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(ASCWorkspace *)self stateLock];
  [v7 lock];

  if (!self->_openApplicationOperationQueue)
  {
    id v8 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    openApplicationOperationQueue = self->_openApplicationOperationQueue;
    self->_openApplicationOperationQueue = v8;
  }
  if (!self->_pendingResults)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingResults = self->_pendingResults;
    self->_pendingResults = v10;
  }
  [(NSOperationQueue *)self->_openApplicationOperationQueue setSuspended:1];
  id v12 = [v18 name];

  if (!v12)
  {
    id v13 = +[NSUUID UUID];
    v14 = [v13 UUIDString];
    [v18 setName:v14];
  }
  [(NSOperationQueue *)self->_openApplicationOperationQueue addOperation:v18];
  v15 = [(ASCWorkspace *)self pendingResults];
  v16 = [v18 name];
  [v15 setObject:v6 forKey:v16];

  [(NSOperationQueue *)self->_openApplicationOperationQueue setSuspended:0];
  id v17 = [(ASCWorkspace *)self stateLock];
  [v17 unlock];
}

- (id)popPendingResultForOperationName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ASCWorkspace *)self stateLock];
    [v5 lock];

    id v6 = [(ASCWorkspace *)self pendingResults];
    id v7 = [v6 objectForKey:v4];

    if (v7)
    {
      id v8 = [(ASCWorkspace *)self pendingResults];
      [v8 removeObjectForKey:v4];
    }
    id v9 = [(ASCWorkspace *)self stateLock];
    [v9 unlock];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isExtension
{
  return self->_extension;
}

- (NSMutableDictionary)pendingResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSOperationQueue)openApplicationOperationQueue
{
  return self->_openApplicationOperationQueue;
}

- (void)setOpenApplicationOperationQueue:(id)a3
{
}

- (NSRecursiveLock)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_openApplicationOperationQueue, 0);

  objc_storeStrong((id *)&self->_pendingResults, 0);
}

@end