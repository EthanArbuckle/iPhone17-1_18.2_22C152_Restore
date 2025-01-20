@interface APNetworkClient
+ (id)sharedAPNetworkClient;
+ (void)createSharedNetworkClientForUnitTest;
+ (void)createSharedNetworkClientWithConfig:(id)a3;
+ (void)setSharedAPNetworkClient:(id)a3;
- (APHTTPSessionManagerProtocol)serviceManager;
- (APNetworkClient)initWithConfig:(id)a3;
- (BOOL)cancelTasksForService:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)invalidateService:(id)a3 andCancelTasks:(BOOL)a4;
- (id)GET:(id)a3 client:(id)a4 headers:(id)a5 withCompletionHandler:(id)a6;
- (id)GET:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5;
- (id)GET:(id)a3 headers:(id)a4 withService:(id)a5 andCompletionHandler:(id)a6;
- (id)HEAD:(id)a3 client:(id)a4 headers:(id)a5 withCompletionHandler:(id)a6;
- (id)HEAD:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5;
- (id)HEAD:(id)a3 headers:(id)a4 withService:(id)a5 andCompletionHandler:(id)a6;
- (id)POST:(id)a3 client:(id)a4 headers:(id)a5 body:(id)a6 completionHandler:(id)a7;
- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withCompletionHandler:(id)a6;
- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withService:(id)a6 andCompletionHandler:(id)a7;
- (id)_billedSessionForRequester:(id)a3;
- (id)_createSessionForRequester:(id)a3 httpMaximumConnectionsPerHost:(int64_t)a4;
- (id)_defaultSessionConfig;
- (id)sendRequest:(id)a3;
- (id)sessionForClient:(id)a3;
- (id)temporarySessionForClient:(id)a3;
- (id)temporarySessionForDaemon;
- (id)urlSessionForService:(id)a3;
- (void)_invalidateAllServicesAndCancelTasks:(BOOL)a3;
- (void)setServiceManager:(id)a3;
@end

@implementation APNetworkClient

+ (id)sharedAPNetworkClient
{
  return (id)qword_1EB7898F0;
}

+ (void)createSharedNetworkClientForUnitTest
{
  v3 = objc_alloc_init(APNetworkClientConfig);
  [(APNetworkClientConfig *)v3 setUseFixedHttpSessionManager:0];
  [(APNetworkClientConfig *)v3 setLookBackWindow:5.0];
  [(APNetworkClientConfig *)v3 setHttpMaximumConnectionsPerHost:4];
  [(APNetworkClientConfig *)v3 setHttpMaximumConnectionsPerHostTempSession:1];
  [a1 createSharedNetworkClientWithConfig:v3];
}

+ (void)createSharedNetworkClientWithConfig:(id)a3
{
  if (!qword_1EB7898F0)
  {
    id v4 = a3;
    v5 = [[APNetworkClient alloc] initWithConfig:v4];

    [a1 setSharedAPNetworkClient:v5];
  }
}

+ (void)setSharedAPNetworkClient:(id)a3
{
}

- (APNetworkClient)initWithConfig:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)APNetworkClient;
  v5 = [(APNetworkClient *)&v18 init];
  if (v5)
  {
    if ([v4 useFixedHttpSessionManager])
    {
      v6 = objc_alloc_init(APFixedHTTPSessionManager);
      serviceManager = v5->_serviceManager;
      v5->_serviceManager = (APHTTPSessionManagerProtocol *)v6;

      v8 = APLogForCategory(0x1FuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        v9 = "Created fixed HTTP session manager.";
LABEL_7:
        _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)buf, 2u);
      }
    }
    else
    {
      v10 = [APFlexibleHTTPSessionManager alloc];
      [v4 lookBackWindow];
      uint64_t v12 = -[APFlexibleHTTPSessionManager initWithLookBackWindow:httpMaximumConnectionsPerHost:httpMaximumConnectionsPerHostTempSession:](v10, "initWithLookBackWindow:httpMaximumConnectionsPerHost:httpMaximumConnectionsPerHostTempSession:", [v4 httpMaximumConnectionsPerHost], objc_msgSend(v4, "httpMaximumConnectionsPerHostTempSession"), v11);
      v13 = v5->_serviceManager;
      v5->_serviceManager = (APHTTPSessionManagerProtocol *)v12;

      v8 = APLogForCategory(0x1FuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        v9 = "Created flexible HTTP session manager.";
        goto LABEL_7;
      }
    }

    objc_initWeak(buf, v5);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1D70DBC38;
    v15[3] = &unk_1E6A6BC50;
    objc_copyWeak(&v16, buf);
    [(APHTTPSessionManagerProtocol *)v5->_serviceManager setCreateSessionBlock:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }

  return v5;
}

- (BOOL)invalidateService:(id)a3 andCancelTasks:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = [(APNetworkClient *)self serviceManager];
  LOBYTE(v4) = [v7 invalidateService:v6 andCancelTasks:v4];

  return v4;
}

- (id)urlSessionForService:(id)a3
{
  v3 = [(APNetworkClient *)self _billedSessionForRequester:a3];
  uint64_t v4 = [v3 session];

  return v4;
}

- (BOOL)cancelTasksForService:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(APNetworkClient *)self serviceManager];
  char v9 = [v8 cancelTasksForService:v7 withCompletionHandler:v6];

  return v9;
}

- (void)_invalidateAllServicesAndCancelTasks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(APNetworkClient *)self serviceManager];
  [v4 invalidateAllServicesAndCancelTasks:v3];
}

- (id)sessionForClient:(id)a3
{
  id v4 = a3;
  v5 = [(APNetworkClient *)self serviceManager];
  id v6 = [v5 sessionForService:v4];

  return v6;
}

- (id)temporarySessionForClient:(id)a3
{
  id v4 = a3;
  v5 = [(APNetworkClient *)self serviceManager];
  id v6 = [v5 temporarySessionForService:v4];

  return v6;
}

- (id)temporarySessionForDaemon
{
  v2 = [(APNetworkClient *)self serviceManager];
  BOOL v3 = [v2 temporarySessionForService:@"com.apple.ap.promotedcontentd"];

  return v3;
}

- (id)sendRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 serviceName];
  id v6 = [(APNetworkClient *)self _billedSessionForRequester:v5];

  id v7 = [v6 sendRequest:v4];

  return v7;
}

- (id)GET:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_GET_client_headers_withCompletionHandler_);
}

- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withCompletionHandler:(id)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_POST_client_headers_body_completionHandler_);
}

- (id)HEAD:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_HEAD_client_headers_withCompletionHandler_);
}

- (id)GET:(id)a3 client:(id)a4 headers:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [(APNetworkClient *)self _billedSessionForRequester:a4];
  v14 = [v13 GET:v12 headers:v11 withCompletionHandler:v10];

  return v14;
}

- (id)POST:(id)a3 client:(id)a4 headers:(id)a5 body:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(APNetworkClient *)self _billedSessionForRequester:a4];
  v17 = [v16 POST:v15 headers:v14 body:v13 withCompletionHandler:v12];

  return v17;
}

- (id)HEAD:(id)a3 client:(id)a4 headers:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(APNetworkClient *)self _billedSessionForRequester:a4];
  id v14 = [v13 HEAD:v12 headers:v11 withCompletionHandler:v10];

  return v14;
}

- (id)GET:(id)a3 headers:(id)a4 withService:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(APNetworkClient *)self _billedSessionForRequester:a5];
  id v14 = [v13 GET:v12 headers:v11 withCompletionHandler:v10];

  return v14;
}

- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withService:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(APNetworkClient *)self _billedSessionForRequester:a6];
  v17 = [v16 POST:v15 headers:v14 body:v13 withCompletionHandler:v12];

  return v17;
}

- (id)HEAD:(id)a3 headers:(id)a4 withService:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(APNetworkClient *)self _billedSessionForRequester:a5];
  id v14 = [v13 HEAD:v12 headers:v11 withCompletionHandler:v10];

  return v14;
}

- (id)_billedSessionForRequester:(id)a3
{
  id v4 = a3;
  v5 = [(APNetworkClient *)self serviceManager];
  id v6 = [v5 sessionForService:v4];

  return v6;
}

- (id)_createSessionForRequester:(id)a3 httpMaximumConnectionsPerHost:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(APNetworkClient *)self _defaultSessionConfig];
  objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", v6);

  if (a4 >= 1) {
    [v7 setHTTPMaximumConnectionsPerHost:a4];
  }
  v8 = [[APHTTPSession alloc] initWithSessionConfiguration:v7];

  return v8;
}

- (id)_defaultSessionConfig
{
  v2 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F29078]) initWithMemoryCapacity:0 diskCapacity:0 diskPath:0];
  [v2 setURLCache:v3];

  return v2;
}

- (APHTTPSessionManagerProtocol)serviceManager
{
  return self->_serviceManager;
}

- (void)setServiceManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end