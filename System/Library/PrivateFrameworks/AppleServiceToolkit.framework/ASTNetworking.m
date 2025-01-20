@interface ASTNetworking
- (ASTNetworking)init;
- (ASTNetworking)initWithSOCKSProxyServer:(id)a3 port:(id)a4;
- (BOOL)_didRefetchProxyServer;
- (BOOL)_isValidEasyRider;
- (BOOL)_verifyMD5ForFileHandle:(id)a3 task:(id)a4;
- (BOOL)_verifyResultOfTask:(id)a3 connection:(id)a4;
- (NSMutableDictionary)networkStorage;
- (NSURLSession)session;
- (id)_downloadTaskWithDownloadConnection:(id)a3 error:(id *)a4;
- (id)_sessionConfigurationWithSOCKSProxyServer:(id)a3 port:(id)a4;
- (id)_taskWithConnection:(id)a3 error:(id *)a4;
- (int)_requestTimeInterval;
- (int)networkDisconnectRetryCount;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)_resetSessionToNewProxyServer;
- (void)addConnection:(id)a3;
- (void)cancelConnectionsOfClass:(Class)a3;
- (void)invalidate;
- (void)setNetworkStorage:(id)a3;
- (void)setSession:(id)a3;
- (void)updateConnectionState:(id)a3 newState:(int64_t)a4;
@end

@implementation ASTNetworking

- (ASTNetworking)initWithSOCKSProxyServer:(id)a3 port:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASTNetworking;
  v8 = [(ASTNetworking *)&v18 init];
  v9 = v8;
  if (v8)
  {
    v10 = [(ASTNetworking *)v8 _sessionConfigurationWithSOCKSProxyServer:v6 port:v7];
    v11 = (void *)MEMORY[0x263F08BF8];
    id v12 = objc_alloc_init(MEMORY[0x263F08A48]);
    uint64_t v13 = [v11 sessionWithConfiguration:v10 delegate:v9 delegateQueue:v12];
    session = v9->_session;
    v9->_session = (NSURLSession *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    networkStorage = v9->_networkStorage;
    v9->_networkStorage = (NSMutableDictionary *)v15;
  }
  return v9;
}

- (ASTNetworking)init
{
  return [(ASTNetworking *)self initWithSOCKSProxyServer:0 port:0];
}

- (id)_sessionConfigurationWithSOCKSProxyServer:(id)a3 port:(id)a4
{
  v16[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  [v8 setWaitsForConnectivity:1];
  objc_msgSend(v8, "setTimeoutIntervalForRequest:", (double)-[ASTNetworking _requestTimeInterval](self, "_requestTimeInterval"));
  if (v6 && v7)
  {
    [v8 setWaitsForConnectivity:0];
    v15[0] = @"SOCKSEnable";
    v15[1] = @"SOCKSPort";
    v16[0] = MEMORY[0x263EFFA88];
    v16[1] = v7;
    v15[2] = @"SOCKSProxy";
    v16[2] = v6;
    v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    [v8 setConnectionProxyDictionary:v9];

    v10 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v8 connectionProxyDictionary];
      int v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_23CA80000, v10, OS_LOG_TYPE_DEFAULT, "Configuring SOCKS proxy: %@", (uint8_t *)&v13, 0xCu);
    }
  }

  return v8;
}

- (int)_requestTimeInterval
{
  if (_requestTimeInterval_onceToken != -1) {
    dispatch_once(&_requestTimeInterval_onceToken, &__block_literal_global_1);
  }
  if (_requestTimeInterval_requestTimeInSeconds) {
    return 60;
  }
  else {
    return 0;
  }
}

void __37__ASTNetworking__requestTimeInterval__block_invoke()
{
  _requestTimeInterval_requestTimeInSeconds = 1;
}

- (void)addConnection:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_alloc_init(ASTNetworkObject);
  [(ASTNetworkObject *)v5 setConnection:v4];
  id v6 = ASTLogHandleForCategory(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    v9 = [v4 request];
    v10 = [v9 allHTTPHeaderFields];
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_23CA80000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Request Headers: %@", buf, 0x16u);
  }
  v11 = ASTLogHandleForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    v14 = [v4 request];
    uint64_t v15 = [v14 URL];
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_23CA80000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Request URL: %@", buf, 0x16u);
  }
  v16 = self;
  objc_sync_enter(v16);
  v17 = [(ASTNetworking *)v16 session];

  if (v17)
  {
    id v23 = 0;
    objc_super v18 = [(ASTNetworking *)v16 _taskWithConnection:v4 error:&v23];
    id v19 = v23;
    if (v18)
    {
      v20 = [(ASTNetworking *)v16 networkStorage];
      [v20 setObject:v5 forKeyedSubscript:v18];

      [v18 resume];
    }
    else
    {
      v21 = [v4 didReceiveResponse];
      ((void (**)(void, void, id))v21)[2](v21, 0, v19);

      v22 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ASTNetworking addConnection:]();
      }
    }
  }
  objc_sync_exit(v16);
}

- (void)cancelConnectionsOfClass:(Class)a3
{
  v5 = [(ASTNetworking *)self session];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__ASTNetworking_cancelConnectionsOfClass___block_invoke;
  v6[3] = &unk_264E7D7F0;
  v6[4] = self;
  v6[5] = a3;
  [v5 getAllTasksWithCompletionHandler:v6];
}

void __42__ASTNetworking_cancelConnectionsOfClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        v9 = [*(id *)(a1 + 32) networkStorage];
        v10 = [v9 objectForKeyedSubscript:v8];

        v11 = [v10 connection];
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [v8 cancel];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  v52[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ASTNetworking URLSession:task:didCompleteWithError:]((uint64_t)v8, v9);
  }

  v10 = [(ASTNetworking *)self networkStorage];
  v11 = [v10 objectForKeyedSubscript:v7];

  if (!v11)
  {
    uint64_t v28 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_36;
  }
  id v12 = [v11 connection];
  uint64_t v13 = [v7 response];
  if (v13)
  {
    long long v14 = (void *)v13;
    long long v15 = [v7 response];
    uint64_t v16 = [v15 statusCode];

    if (v16 == 200)
    {
      [(ASTNetworking *)self updateConnectionState:v12 newState:0];
      v17 = ASTLogHandleForCategory(2);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v7 response];
        id v19 = [v18 allHeaderFields];
        *(_DWORD *)buf = 138412290;
        v46 = v19;
        _os_log_impl(&dword_23CA80000, v17, OS_LOG_TYPE_DEFAULT, "Response Headers: %@", buf, 0xCu);
      }
      v20 = [v11 receivedData];
      if (v20)
      {
        v21 = (void *)[[NSString alloc] initWithData:v20 encoding:4];
        v22 = ASTLogHandleForCategory(3);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v7 currentRequest];
          v24 = [v23 URL];
          *(_DWORD *)buf = 138412546;
          v46 = v24;
          __int16 v47 = 2112;
          uint64_t v48 = (uint64_t)v21;
          _os_log_impl(&dword_23CA80000, v22, OS_LOG_TYPE_DEFAULT, "URL: %@\nResponse Body: %@", buf, 0x16u);
        }
        v25 = +[ASTTestAutomation sharedInstance];
        int v26 = [v25 testAutomationEnabled];

        if (v26)
        {
          v51 = @"payload";
          v52[0] = v21;
          v27 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
          +[ASTTestAutomation postServerResponse:v27];
        }
        id v44 = v8;
        uint64_t v28 = +[ASTEncodingUtilities parseJSONResponseWithData:v20 error:&v44];
        id v29 = v44;

        if (v28
          && !+[ASTConnectionUtilities isValidResponse:v28])
        {
          v30 = ASTLogHandleForCategory(1);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[ASTNetworking URLSession:task:didCompleteWithError:]();
          }

          uint64_t v28 = 0;
        }

        id v8 = v29;
      }
      else
      {
        uint64_t v28 = (void *)MEMORY[0x263EFFA78];
      }

      goto LABEL_28;
    }
  }
  v31 = [v7 response];
  uint64_t v32 = [v31 statusCode];

  v33 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v40 = [v7 originalRequest];
    v41 = [v40 URL];
    *(_DWORD *)buf = 138412802;
    v46 = v41;
    __int16 v47 = 2048;
    uint64_t v48 = v32;
    __int16 v49 = 2112;
    id v50 = v8;
    _os_log_error_impl(&dword_23CA80000, v33, OS_LOG_TYPE_ERROR, "%@ responded with status code %ld, error: %@", buf, 0x20u);
  }
  if (!+[ASTConnectionUtilities didEncounterNetworkDisconnectionError:](ASTConnectionUtilities, "didEncounterNetworkDisconnectionError:", v8)|| (-[ASTNetworking updateConnectionState:newState:](self, "updateConnectionState:newState:", v12, 1), ![v12 retryOnNetworkDisconnected]))
  {
    uint64_t v28 = 0;
LABEL_28:
    BOOL v35 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v12, "setNetworkDisconnectedRetryCount:", objc_msgSend(v12, "networkDisconnectedRetryCount") + 1);
  uint64_t v34 = [v12 networkDisconnectedRetryCount];
  uint64_t v28 = 0;
  BOOL v35 = v34 < [(ASTNetworking *)self networkDisconnectRetryCount];
LABEL_29:
  [(ASTNetworking *)self _verifyResultOfTask:v7 connection:v12];
  v36 = [(ASTNetworking *)self networkStorage];
  [v36 removeObjectForKey:v7];

  if (v35)
  {
    if ([(ASTNetworking *)self _isValidEasyRider]
      && [(ASTNetworking *)self _didRefetchProxyServer])
    {
      [(ASTNetworking *)self _resetSessionToNewProxyServer];
    }
    dispatch_time_t v37 = dispatch_time(0, 3000000000);
    v38 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__ASTNetworking_URLSession_task_didCompleteWithError___block_invoke;
    block[3] = &unk_264E7D680;
    block[4] = self;
    id v43 = v12;
    dispatch_after(v37, v38, block);
  }
  else
  {
    v39 = [v12 didReceiveResponse];
    ((void (**)(void, void *, id))v39)[2](v39, v28, v8);
  }
LABEL_36:
}

uint64_t __54__ASTNetworking_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addConnection:*(void *)(a1 + 40)];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  v10 = (void (**)(id, uint64_t, void))a6;
  id v11 = a4;
  id v12 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ASTNetworking URLSession:task:didReceiveChallenge:completionHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  v20 = [(ASTNetworking *)self networkStorage];
  v21 = [v20 objectForKeyedSubscript:v11];

  if (!v21) {
    goto LABEL_8;
  }
  v22 = [v21 connection];
  id v23 = [v9 protectionSpace];
  v24 = [v23 authenticationMethod];
  int v25 = [v24 isEqualToString:*MEMORY[0x263F08560]];

  if (!v25)
  {

LABEL_8:
    v10[2](v10, 1, 0);
    goto LABEL_13;
  }
  int v26 = [v9 protectionSpace];
  BOOL v27 = +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:](ASTConnectionUtilities, "trustIsValidWithProtectionSpace:rootOfTrust:", v26, [v22 rootOfTrust]);

  if (v27)
  {
    uint64_t v28 = (void *)MEMORY[0x263F08BB8];
    id v29 = [v9 protectionSpace];
    v30 = objc_msgSend(v28, "credentialForTrust:", objc_msgSend(v29, "serverTrust"));

    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v30);
  }
  else
  {
    v31 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ASTNetworking URLSession:task:didReceiveChallenge:completionHandler:]();
    }

    v10[2](v10, 2, 0);
  }

LABEL_13:
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11 = a4;
  id v12 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ASTNetworking URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  v20 = [(ASTNetworking *)self networkStorage];
  v21 = [v20 objectForKeyedSubscript:v11];

  if (v21)
  {
    v22 = [v21 connection];
    [(ASTNetworking *)self updateConnectionState:v22 newState:0];
    id v23 = [v22 delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      int v25 = [v22 delegate];
      [v25 connection:v22 didSendBodyData:a5 totalBytesSent:a6 totalBytesExpected:a7];
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7 = (void (**)(id, void *))a5;
  id v8 = a4;
  id v9 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ASTNetworking URLSession:task:needNewBodyStream:](v9, v10, v11, v12, v13, v14, v15, v16);
  }

  uint64_t v17 = [(ASTNetworking *)self networkStorage];
  uint64_t v18 = [v17 objectForKeyedSubscript:v8];

  if (v18)
  {
    uint64_t v19 = [v18 connection];
    if ([v19 conformsToProtocol:&unk_26F0BB3D8])
    {
      v20 = (void *)MEMORY[0x263EFF950];
      v21 = [v19 fileSteamLocationURL];
      v22 = [v20 inputStreamWithURL:v21];
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  v7[2](v7, v22);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v9 = a6;
  uint64_t v10 = (void (**)(id, void *))a7;
  uint64_t v11 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ASTNetworking URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  id v19 = v9;
  v20 = v19;
  v21 = v19;
  if (a5)
  {

    v21 = 0;
  }
  v10[2](v10, v21);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ASTNetworking URLSession:taskIsWaitingForConnectivity:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  uint64_t v14 = [(ASTNetworking *)self networkStorage];
  uint64_t v15 = [v14 objectForKeyedSubscript:v5];

  if (v15)
  {
    uint64_t v16 = [v15 connection];

    if (v16)
    {
      uint64_t v17 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v15 connection];
        int v20 = 138412546;
        v21 = v15;
        __int16 v22 = 2112;
        id v23 = v18;
        _os_log_impl(&dword_23CA80000, v17, OS_LOG_TYPE_DEFAULT, "Setting connection state to disconnected for network object {%@} with connection {%@}", (uint8_t *)&v20, 0x16u);
      }
      id v19 = [v15 connection];
      [(ASTNetworking *)self updateConnectionState:v19 newState:1];
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ASTNetworking URLSession:dataTask:didReceiveData:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  id v19 = [(ASTNetworking *)self networkStorage];
  int v20 = [v19 objectForKeyedSubscript:v9];

  if (v20)
  {
    v21 = [v20 connection];
    [(ASTNetworking *)self updateConnectionState:v21 newState:0];
    if ([v21 conformsToProtocol:&unk_26F0B9CA8])
    {
      id v22 = v21;
      id v23 = [v22 destinationFileHandle];
      [v23 writeData:v10];
    }
    else
    {
      uint64_t v24 = [v20 receivedData];

      if (!v24)
      {
        int v25 = [MEMORY[0x263EFF990] data];
        [v20 setReceivedData:v25];
      }
      id v22 = [v20 receivedData];
      [v22 appendData:v10];
    }
  }
}

- (void)updateConnectionState:(id)a3 newState:(int64_t)a4
{
  id v9 = a3;
  uint64_t v5 = [v9 state];
  [v9 setState:a4];
  if (v5 != [v9 state])
  {
    uint64_t v6 = [v9 delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [v9 delegate];
      objc_msgSend(v8, "connection:connectionStateChanged:", v9, objc_msgSend(v9, "state"));
    }
  }
}

- (void)invalidate
{
  id v3 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate current NSURLSession.", v6, 2u);
  }

  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(ASTNetworking *)v4 session];
  [v5 finishTasksAndInvalidate];

  [(ASTNetworking *)v4 setSession:0];
  objc_sync_exit(v4);
}

- (id)_taskWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_26F0B9CA8])
  {
    char v7 = [(ASTNetworking *)self _downloadTaskWithDownloadConnection:v6 error:a4];
  }
  else
  {
    int v8 = [v6 conformsToProtocol:&unk_26F0BB3D8];
    id v9 = [(ASTNetworking *)self session];
    id v10 = [v6 request];
    if (v8) {
      [v9 uploadTaskWithStreamedRequest:v10];
    }
    else {
    char v7 = [v9 dataTaskWithRequest:v10];
    }
  }

  return v7;
}

- (id)_downloadTaskWithDownloadConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [v6 destinationFileHandle];

  if (v7)
  {
    int v8 = [v6 destinationFileHandle];
    char v9 = [v8 isOpenForUpdating];

    if (v9)
    {
      id v10 = [v6 destinationFileHandle];
      [v10 truncateFileAtOffset:0];

      uint64_t v11 = [(ASTNetworking *)self session];
      uint64_t v12 = [v6 request];
      uint64_t v13 = [v11 dataTaskWithRequest:v12];

      goto LABEL_12;
    }
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-3000 userInfo:0];
    }
    uint64_t v14 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ASTNetworking _downloadTaskWithDownloadConnection:error:]();
    }
  }
  else
  {
    uint64_t v14 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ASTNetworking _downloadTaskWithDownloadConnection:error:]();
    }
  }

  uint64_t v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)_verifyResultOfTask:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_26F0B9CA8])
  {
    int v8 = [v7 destinationFileHandle];
    BOOL v9 = [(ASTNetworking *)self _verifyMD5ForFileHandle:v8 task:v6];
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_verifyMD5ForFileHandle:(id)a3 task:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 synchronizeFile];
  id v7 = +[ASTConnectionUtilities MD5HeaderValueForTask:v6];
  if (v7)
  {
    int v8 = +[ASTEncodingUtilities MD5ForFileHandle:v5];
    if (![v8 caseInsensitiveCompare:v7])
    {

      BOOL v10 = 1;
      goto LABEL_10;
    }
    BOOL v9 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASTNetworking _verifyMD5ForFileHandle:task:]();
    }
  }
  else
  {
    int v8 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ASTNetworking _verifyMD5ForFileHandle:task:]();
    }
  }

  [v5 truncateFileAtOffset:0];
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (int)networkDisconnectRetryCount
{
  if (networkDisconnectRetryCount_onceToken != -1) {
    dispatch_once(&networkDisconnectRetryCount_onceToken, &__block_literal_global_140);
  }
  return networkDisconnectRetryCount_networkDisconnectRetryCount;
}

void __44__ASTNetworking_networkDisconnectRetryCount__block_invoke()
{
  networkDisconnectRetryCount_networkDisconnectRetryCount = 200;
  id v0 = (id)MGCopyAnswer();
  if ([v0 intValue] == 7) {
    networkDisconnectRetryCount_networkDisconnectRetryCount = 10;
  }
}

- (BOOL)_isValidEasyRider
{
  if (_isValidEasyRider_onceToken != -1) {
    dispatch_once(&_isValidEasyRider_onceToken, &__block_literal_global_145);
  }
  return _isValidEasyRider_isEasyRider;
}

void __34__ASTNetworking__isValidEasyRider__block_invoke()
{
  if ([MEMORY[0x263F31AC0] isCheckerBoardActive])
  {
    id v0 = [MEMORY[0x263F31AC0] proxyServer];

    if (v0)
    {
      _isValidEasyRider_isEasyRider = 1;
      v1 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v2 = 0;
        _os_log_impl(&dword_23CA80000, v1, OS_LOG_TYPE_DEFAULT, "Valid EasyRider mode.", v2, 2u);
      }
    }
  }
}

- (BOOL)_didRefetchProxyServer
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (+[ASTLinking isCheckerBoardServicesFrameworkAvailable](ASTLinking, "isCheckerBoardServicesFrameworkAvailable")&& [MEMORY[0x263F31AC0] isCheckerBoardActive])
  {
    v2 = [MEMORY[0x263F31AC0] proxyServer];
    id v3 = [v2 server];
    uint64_t v4 = [v2 port];
    id v5 = (void *)v4;
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      BOOL v7 = 0;
LABEL_18:

      return v7;
    }
    int v8 = +[ASTEnvironment currentEnvironment];
    BOOL v9 = [v8 SOCKSProxyServer];
    if ([v9 isEqualToString:v3])
    {
      BOOL v10 = [v8 SOCKSProxyPort];
      char v11 = [v10 isEqualToNumber:v5];

      if (v11)
      {
        BOOL v7 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    [v8 setSOCKSProxyServer:v3];
    [v8 setSOCKSProxyPort:v5];
    uint64_t v12 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = +[ASTEnvironment currentEnvironment];
      uint64_t v14 = [v13 SOCKSProxyServer];
      uint64_t v15 = +[ASTEnvironment currentEnvironment];
      uint64_t v16 = [v15 SOCKSProxyPort];
      int v18 = 138412546;
      id v19 = v14;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_23CA80000, v12, OS_LOG_TYPE_DEFAULT, "Refetch ASTEnvironment to %@, %@", (uint8_t *)&v18, 0x16u);
    }
    BOOL v7 = 1;
    goto LABEL_17;
  }
  return 0;
}

- (void)_resetSessionToNewProxyServer
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "Resetting session to new proxy server.", (uint8_t *)&v15, 2u);
  }

  [(ASTNetworking *)self invalidate];
  uint64_t v4 = +[ASTEnvironment currentEnvironment];
  id v5 = [v4 SOCKSProxyServer];

  BOOL v6 = +[ASTEnvironment currentEnvironment];
  BOOL v7 = [v6 SOCKSProxyPort];

  int v8 = self;
  objc_sync_enter(v8);
  BOOL v9 = [(ASTNetworking *)v8 _sessionConfigurationWithSOCKSProxyServer:v5 port:v7];
  BOOL v10 = (void *)MEMORY[0x263F08BF8];
  id v11 = objc_alloc_init(MEMORY[0x263F08A48]);
  uint64_t v12 = [v10 sessionWithConfiguration:v9 delegate:v8 delegateQueue:v11];
  [(ASTNetworking *)v8 setSession:v12];

  uint64_t v13 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(ASTNetworking *)v8 session];
    int v15 = 138412802;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    int v18 = v5;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    _os_log_impl(&dword_23CA80000, v13, OS_LOG_TYPE_DEFAULT, "New session[%@] is created with proxy server %@, %@ ", (uint8_t *)&v15, 0x20u);
  }
  objc_sync_exit(v8);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSMutableDictionary)networkStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetworkStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkStorage, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)addConnection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Could not create task: %@", v2, v3, v4, v5, v6);
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Server response invalid: %@", v2, v3, v4, v5, v6);
}

- (void)URLSession:(uint64_t)a1 task:(NSObject *)a2 didCompleteWithError:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[ASTNetworking URLSession:task:didCompleteWithError:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_23CA80000, a2, OS_LOG_TYPE_DEBUG, "%s; %@", (uint8_t *)&v2, 0x16u);
}

- (void)URLSession:task:didReceiveChallenge:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Server cert validity check failed!", v2, v3, v4, v5, v6);
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 didReceiveChallenge:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 didSendBodyData:(uint64_t)a5 totalBytesSent:(uint64_t)a6 totalBytesExpectedToSend:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 needNewBodyStream:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 willPerformHTTPRedirection:(uint64_t)a5 newRequest:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)URLSession:(uint64_t)a3 taskIsWaitingForConnectivity:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)URLSession:dataTask:didReceiveData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Unable to write data to file: %@", v2, v3, v4, v5, v6);
}

- (void)URLSession:(uint64_t)a3 dataTask:(uint64_t)a4 didReceiveData:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_downloadTaskWithDownloadConnection:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Download connection is missing a file handle", v2, v3, v4, v5, v6);
}

- (void)_downloadTaskWithDownloadConnection:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Exception occurred trying to truncate file: %@", v2, v3, v4, v5, v6);
}

- (void)_downloadTaskWithDownloadConnection:error:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "File is not open for read+write.", v2, v3, v4, v5, v6);
}

- (void)_verifyMD5ForFileHandle:task:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "File download MD5 key not found", v2, v3, v4, v5, v6);
}

- (void)_verifyMD5ForFileHandle:task:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "File download MD5 comparison failed", v2, v3, v4, v5, v6);
}

- (void)_verifyMD5ForFileHandle:task:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Exception occurred trying to synchronize file: %@", v2, v3, v4, v5, v6);
}

@end