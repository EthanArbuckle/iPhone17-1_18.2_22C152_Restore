@interface HSConnection
- (HSConnection)initWithBaseURL:(id)a3;
- (HSConnection)initWithBaseURL:(id)a3 connectionType:(int64_t)a4;
- (HSFairPlayInfo)fairPlayInfo;
- (NSString)homeSharingGroupID;
- (NSURL)baseURL;
- (id)_onSerialQueue_connectionSession;
- (id)signedRequestFromURLRequest:(id)a3;
- (int64_t)connectionState;
- (int64_t)connectionType;
- (unsigned)_sapVersionForConnectionType;
- (unsigned)basePlaylistContainerID;
- (unsigned)databaseID;
- (unsigned)databaseRevision;
- (unsigned)sessionID;
- (void)_continueFPSetupNegotiationWithData:(id)a3 internalConnectionCompletionHandler:(id)a4;
- (void)_loadDatabaseWithInternalConnectionCompletionHandler:(id)a3;
- (void)_onSerialQueue_sendRequest:(id)a3 withInternalResponseHandler:(id)a4;
- (void)_sendRequest:(id)a3 withInternalResponseHandler:(id)a4;
- (void)checkForDatabaseUpdatesWithCompletionHandler:(id)a3;
- (void)connectWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)setBasePlaylistContainerID:(unsigned int)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setDatabaseID:(unsigned int)a3;
- (void)setDatabaseRevision:(unsigned int)a3;
- (void)setFairPlayInfo:(id)a3;
- (void)setHomeSharingGroupID:(id)a3;
- (void)setSessionID:(unsigned int)a3;
@end

@implementation HSConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeSharingGroupID, 0);
  objc_storeStrong((id *)&self->_fairPlayInfo, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_connectionSession, 0);
  objc_storeStrong((id *)&self->_activityTimerSource, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setBasePlaylistContainerID:(unsigned int)a3
{
  self->_basePlaylistContainerID = a3;
}

- (unsigned)basePlaylistContainerID
{
  return self->_basePlaylistContainerID;
}

- (void)setDatabaseRevision:(unsigned int)a3
{
  self->_databaseRevision = a3;
}

- (unsigned)databaseRevision
{
  return self->_databaseRevision;
}

- (void)setDatabaseID:(unsigned int)a3
{
  self->_databaseID = a3;
}

- (unsigned)databaseID
{
  return self->_databaseID;
}

- (void)setHomeSharingGroupID:(id)a3
{
}

- (NSString)homeSharingGroupID
{
  return self->_homeSharingGroupID;
}

- (void)setFairPlayInfo:(id)a3
{
}

- (HSFairPlayInfo)fairPlayInfo
{
  return self->_fairPlayInfo;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (id)_onSerialQueue_connectionSession
{
  connectionSession = self->_connectionSession;
  if (!connectionSession)
  {
    v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v4 setAllowsCellularAccess:0];
    [v4 setHTTPAdditionalHeaders:&unk_26C5EF670];
    [v4 setHTTPShouldUsePipelining:1];
    v5 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v4];
    v6 = self->_connectionSession;
    self->_connectionSession = v5;

    connectionSession = self->_connectionSession;
  }
  return connectionSession;
}

- (void)_onSerialQueue_sendRequest:(id)a3 withInternalResponseHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 action];
  v9 = [(HSConnection *)self homeSharingGroupID];
  if ([v9 length])
  {
    char v10 = [v8 isEqual:@"server-info"];

    if (v10) {
      goto LABEL_5;
    }
    v9 = [(HSConnection *)self homeSharingGroupID];
    [v6 setValue:v9 forArgument:@"hsgid"];
  }

LABEL_5:
  if (!self->_connectionType)
  {
    if (([v8 isEqual:@"logout"] & 1) == 0) {
      [v6 setValue:@"1" forArgument:@"daap-no-disconnect"];
    }
    [v6 setValue:@"1" forArgument:@"hs-mobile-device-client"];
  }
  v11 = objc_msgSend(v6, "URLRequestForBaseURL:sessionID:", self->_baseURL, -[HSConnection sessionID](self, "sessionID"));
  v12 = (void *)[v11 mutableCopy];

  if (([v8 isEqual:@"login"] & 1) == 0
    && ([v8 isEqual:@"logout"] & 1) == 0
    && ([v8 isEqual:@"fp-setup"] & 1) == 0
    && ([v8 isEqual:@"server-info"] & 1) == 0)
  {
    v13 = [(HSConnection *)self fairPlayInfo];
    v14 = [v12 URL];
    v15 = [v13 securityInfoForURL:v14];
    [v12 setValue:v15 forHTTPHeaderField:@"Client-Daap-Validation"];
  }
  v16 = os_log_create("com.apple.amp.HomeSharing", "Connections");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    if ([v6 method]) {
      v19 = @"POST";
    }
    else {
      v19 = @"GET";
    }
    v20 = [v6 action];
    *(_DWORD *)buf = 138544130;
    v32 = v18;
    __int16 v33 = 2048;
    id v34 = v6;
    __int16 v35 = 2114;
    v36 = v19;
    __int16 v37 = 2114;
    v38 = v20;
    _os_log_impl(&dword_2152C7000, v16, OS_LOG_TYPE_DEFAULT, "Sending request: <%{public}@: %p method=%{public}@ action=%{public}@>", buf, 0x2Au);
  }
  v21 = os_log_create("com.apple.amp.HomeSharing", "Connections_Oversize");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v12 allHTTPHeaderFields];
    *(_DWORD *)buf = 138543362;
    v32 = v22;
    _os_log_impl(&dword_2152C7000, v21, OS_LOG_TYPE_DEFAULT, "Request headers: %{public}@", buf, 0xCu);
  }
  v23 = [(HSConnection *)self _onSerialQueue_connectionSession];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __71__HSConnection__onSerialQueue_sendRequest_withInternalResponseHandler___block_invoke;
  v27[3] = &unk_26423A330;
  id v28 = v6;
  v29 = self;
  id v30 = v7;
  id v24 = v7;
  id v25 = v6;
  v26 = objc_msgSend(v23, "msv_dataTaskWithRequest:completionHandler:", v12, v27);

  [v26 resume];
}

void __71__HSConnection__onSerialQueue_sendRequest_withInternalResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v38 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v40 = v13;
      __int16 v41 = 2114;
      id v42 = v11;
      __int16 v43 = 2114;
      id v44 = v9;
      _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_ERROR, "Got no response for request %p, error %{public}@. NSURLSessionDataTask: %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v14 = [v10 allHeaderFields];
    uint64_t v15 = [v10 statusCode];
    v16 = [v14 objectForKey:@"Content-Type"];
    v17 = +[HSResponse responseWithCode:v15 headerFields:v14 data:v38 MIMEType:v16 error:0];
    v18 = [*(id *)(a1 + 32) canonicalResponseForResponse:v17];
    v19 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = v10;
      uint64_t v20 = *(void *)(a1 + 32);
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      uint64_t v33 = a1;
      v22 = id v34 = v14;
      v23 = v16;
      id v24 = v9;
      uint64_t v25 = [v17 responseCode];
      [v17 responseData];
      v26 = v36 = v18;
      *(_DWORD *)buf = 134219010;
      uint64_t v40 = v20;
      id v10 = v35;
      __int16 v41 = 2114;
      id v42 = v22;
      __int16 v43 = 2048;
      id v44 = v17;
      __int16 v45 = 2048;
      uint64_t v46 = v25;
      id v9 = v24;
      v16 = v23;
      __int16 v47 = 2048;
      uint64_t v48 = [v26 length];
      _os_log_impl(&dword_2152C7000, v19, OS_LOG_TYPE_DEFAULT, "Received request %p response: <%{public}@: %p code=%ld, length=%{bytes}lu>", buf, 0x34u);

      v18 = v36;
      a1 = v33;
      v14 = v34;
    }

    v27 = os_log_create("com.apple.amp.HomeSharing", "Connections_Oversize");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = (uint64_t)v14;
      _os_log_impl(&dword_2152C7000, v27, OS_LOG_TYPE_DEFAULT, "Response headers: %{public}@", buf, 0xCu);
    }

    if (v15 == 403 || v15 >= 500)
    {
      id v28 = os_log_create("com.apple.amp.HomeSharing", "Connections");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v40 = v15;
        __int16 v41 = 2114;
        id v42 = v9;
        _os_log_impl(&dword_2152C7000, v28, OS_LOG_TYPE_ERROR, "Disconnecting due to HTTP status code: %lu. NSURLSessionDataTask: %{public}@", buf, 0x16u);
      }

      v29 = os_log_create("com.apple.amp.HomeSharing", "Connections");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [[NSString alloc] initWithData:v38 encoding:4];
        __int16 v37 = v18;
        v31 = (void *)v30;
        if (v30) {
          uint64_t v32 = v30;
        }
        else {
          uint64_t v32 = (uint64_t)v38;
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v32;
        _os_log_impl(&dword_2152C7000, v29, OS_LOG_TYPE_ERROR, "Disconnecting response data: %{public}@", buf, 0xCu);

        v18 = v37;
      }

      [*(id *)(a1 + 40) disconnect];
      v18 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_sendRequest:(id)a3 withInternalResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HSConnection__sendRequest_withInternalResponseHandler___block_invoke;
  block[3] = &unk_26423A3C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

uint64_t __57__HSConnection__sendRequest_withInternalResponseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSerialQueue_sendRequest:withInternalResponseHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (unsigned)_sapVersionForConnectionType
{
  return 2;
}

- (void)_loadDatabaseWithInternalConnectionCompletionHandler:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke;
  v11[3] = &unk_26423A298;
  v11[4] = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x2166B7C00](v11);
  serialQueue = self->_serialQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_47;
  v9[3] = &unk_26423A398;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(serialQueue, v9);
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 responseCode] != 204)
  {
    id v7 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v4 error];
      *(_DWORD *)buf = 138543618;
      id v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = [v4 responseCode];
      _os_log_impl(&dword_2152C7000, v7, OS_LOG_TYPE_ERROR, "Got no homeSharingVerifyResponse: %{public}@ / http status code: %ld", buf, 0x16u);
    }
    [*(id *)(a1 + 32) disconnect];
    uint64_t v9 = *(void *)(a1 + 40);
    id v5 = [v4 error];
    (*(void (**)(uint64_t, void, HSDatabasesRequest *))(v9 + 16))(v9, 0, v5);
  }
  else
  {
    id v5 = objc_alloc_init(HSDatabasesRequest);
    id v6 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_2;
    v10[3] = &unk_26423A298;
    v10[4] = v6;
    id v11 = *(id *)(a1 + 40);
    [v6 _sendRequest:v5 withInternalResponseHandler:v10];
  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_47(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) homeSharingGroupID];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    id v5 = +[HSRequest request];
    [*(id *)(a1 + 32) _sendRequest:v5 withInternalResponseHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 responseCode] == 200)
  {
    id v4 = [v3 databases];
    id v5 = [v4 lastObject];

    id v6 = [v5 objectForKey:@"dmap.itemid"];
    objc_msgSend(*(id *)(a1 + 32), "setDatabaseID:", objc_msgSend(v6, "unsignedIntValue"));

    id v7 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = [*(id *)(a1 + 32) databaseID];
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v8;
      _os_log_impl(&dword_2152C7000, v7, OS_LOG_TYPE_INFO, "Using database with id: %u", buf, 8u);
    }

    uint64_t v9 = *(void **)(a1 + 32);
    if (!v9[7])
    {
      id v10 = +[HSContainersRequest requestWithDatabaseID:](HSContainersRequest, "requestWithDatabaseID:", [v9 databaseID]);
      [v10 setValue:@"dmap.itemid,daap.baseplaylist" forArgument:@"meta"];
      [v10 setValue:@"'daap.baseplaylist:1'" forArgument:@"query"];
      id v11 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_40;
      v14[3] = &unk_26423A298;
      v14[4] = v11;
      id v15 = *(id *)(a1 + 40);
      [v11 _sendRequest:v10 withInternalResponseHandler:v14];
    }
  }
  else
  {
    id v12 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = [v3 responseCode];
      _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_ERROR, "Got no base database response: %ld", buf, 0xCu);
    }

    [*(id *)(a1 + 32) disconnect];
    uint64_t v13 = *(void *)(a1 + 40);
    id v5 = [v3 error];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v5);
  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [v3 containers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = [v9 objectForKey:@"daap.baseplaylist"];
        int v11 = [v10 unsignedCharValue];

        if (v11)
        {
          id v12 = [v9 objectForKey:@"dmap.itemid"];
          objc_msgSend(*(id *)(a1 + 32), "setBasePlaylistContainerID:", objc_msgSend(v12, "unsignedIntValue"));

          uint64_t v13 = os_log_create("com.apple.amp.HomeSharing", "Connections");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v14 = [*(id *)(a1 + 32) basePlaylistContainerID];
            *(_DWORD *)buf = 67109120;
            int v26 = v14;
            _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_INFO, "Base playlist container ID is %u", buf, 8u);
          }

          id v15 = *(void **)(a1 + 32);
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_44;
          v19[3] = &unk_26423A370;
          v19[4] = v15;
          id v20 = *(id *)(a1 + 40);
          [v15 checkForDatabaseUpdatesWithCompletionHandler:v19];

          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if (![*(id *)(a1 + 32) basePlaylistContainerID])
  {
    uint64_t v16 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2152C7000, v16, OS_LOG_TYPE_ERROR, "Got no base playlistContainerID", buf, 2u);
    }

    [*(id *)(a1 + 32) disconnect];
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [v3 error];
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_44(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = 2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!*(void *)(*(void *)(a1 + 32) + 56))
  {
    v2 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v2);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    dispatch_time_t v6 = dispatch_time(0, 45000000000);
    dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16), v6, 0xA7A358200uLL, 0x37E11D600uLL);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(NSObject **)(v7 + 16);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_2_45;
    handler[3] = &unk_26423A410;
    handler[4] = v7;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_2_45(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 64) == 2)
  {
    uint64_t v5 = +[HSRequest request];
    [*(id *)(a1 + 32) sendRequest:v5 withResponseHandler:&__block_literal_global_1724];
    dispatch_source_t v3 = (void *)v5;
  }
  else
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 16));
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_source_t v3 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;
  }
}

- (void)_continueFPSetupNegotiationWithData:(id)a3 internalConnectionCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[HSRequest request];
  [v8 setBodyData:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__HSConnection__continueFPSetupNegotiationWithData_internalConnectionCompletionHandler___block_invoke;
  v10[3] = &unk_26423A298;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(HSConnection *)self _sendRequest:v8 withInternalResponseHandler:v10];
}

void __88__HSConnection__continueFPSetupNegotiationWithData_internalConnectionCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 responseCode] == 200)
  {
    char v9 = 0;
    uint64_t v4 = [*(id *)(a1 + 32) fairPlayInfo];
    uint64_t v5 = [*(id *)(a1 + 32) _sapVersionForConnectionType];
    id v6 = [v3 responseData];
    id v7 = [v4 continueNegotationWithSAPVersion:v5 data:v6 isComplete:&v9];

    int v8 = *(void **)(a1 + 32);
    if (v9) {
      [v8 _loadDatabaseWithInternalConnectionCompletionHandler:*(void *)(a1 + 40)];
    }
    else {
      [v8 _continueFPSetupNegotiationWithData:v7 internalConnectionCompletionHandler:*(void *)(a1 + 40)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) disconnect];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)checkForDatabaseUpdatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke;
  v11[3] = &unk_26423A270;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x2166B7C00](v11);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_3;
  block[3] = &unk_26423A398;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

void __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_26423A248;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

void __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = +[HSUpdateRequest requestWithDatabaseRevision:sessionID:connectionType:](HSUpdateRequest, "requestWithDatabaseRevision:sessionID:connectionType:", [*(id *)(a1 + 32) databaseRevision], objc_msgSend(*(id *)(a1 + 32), "sessionID"), *(void *)(*(void *)(a1 + 32) + 56));
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_4;
  v4[3] = &unk_26423A298;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v3 _sendRequest:v2 withInternalResponseHandler:v4];
}

void __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3 && *(void *)(*(void *)(a1 + 32) + 64) == 2)
  {
    unint64_t v5 = [v3 responseCode];
    id v6 = v4;
    id v7 = v6;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 0xC8)
    {
      uint64_t v8 = [v6 databaseRevision];
      BOOL v9 = [*(id *)(a1 + 32) databaseRevision] != v8;
      [*(id *)(a1 + 32) setDatabaseRevision:v8];
      if (!v8)
      {
        id v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v22 = *MEMORY[0x263F08320];
        long long v23 = @"Disconnected from Home Sharing because the server is shutting down.";
        char v11 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        id v12 = objc_msgSend(v10, "hs_homeSharingErrorWithCode:userInfo:", 1004, v11);

        [*(id *)(a1 + 32) setSessionID:0];
        [*(id *)(a1 + 32) disconnect];
LABEL_11:
        BOOL v9 = 0;
LABEL_17:
        (*(void (**)(void, BOOL, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9, v12);
        goto LABEL_18;
      }
    }
    else
    {
      if (v5 == 403 || v5 >= 0x1F4)
      {
        uint64_t v17 = os_log_create("com.apple.amp.HomeSharing", "Connections");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v21 = v5;
          _os_log_impl(&dword_2152C7000, v17, OS_LOG_TYPE_ERROR, "Disconnected from Home Sharing because of unrecovereable http status code: %lu", buf, 0xCu);
        }

        [*(id *)(a1 + 32) setSessionID:0];
        [*(id *)(a1 + 32) disconnect];
      }
      else if (v5 == 406)
      {
        id v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = *MEMORY[0x263F08320];
        v19 = @"Request was rejected by iTunes.";
        uint64_t v16 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        id v12 = objc_msgSend(v15, "hs_homeSharingErrorWithCode:userInfo:", 1003, v16);

        goto LABEL_11;
      }
      BOOL v9 = 0;
    }
    id v12 = 0;
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  int v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v24 = *MEMORY[0x263F08320];
  v25[0] = @"Home Sharing library is no longer connected.";
  id v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v12 = objc_msgSend(v14, "hs_homeSharingErrorWithCode:userInfo:", 1003, v7);
  (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v12);
LABEL_18:
}

uint64_t __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)signedRequestFromURLRequest:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  unint64_t v5 = [v4 allHTTPHeaderFields];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  BOOL v9 = v8;

  id v10 = [(HSConnection *)self fairPlayInfo];
  char v11 = [v4 URL];
  id v12 = [v10 securityInfoForURL:v11];

  if (v12)
  {
    uint64_t v13 = [(HSConnection *)self fairPlayInfo];
    int v14 = [v4 URL];
    id v15 = [v13 securityInfoForURL:v14];
    [v9 setObject:v15 forKeyedSubscript:@"Client-Daap-Validation"];

    [v4 setAllHTTPHeaderFields:v9];
    id v16 = v4;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__HSConnection_sendRequest_withResponseHandler___block_invoke;
  v10[3] = &unk_26423A2E8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  BOOL v9 = (void *)MEMORY[0x2166B7C00](v10);
  [(HSConnection *)self _sendRequest:v8 withInternalResponseHandler:v9];
}

void __48__HSConnection_sendRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    unint64_t v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__HSConnection_sendRequest_withResponseHandler___block_invoke_2;
    v6[3] = &unk_26423A398;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __48__HSConnection_sendRequest_withResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)disconnect
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__HSConnection_disconnect__block_invoke;
  block[3] = &unk_26423A410;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __26__HSConnection_disconnect__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) sessionID];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v3 connectionState] != 3)
    {
      [*(id *)(a1 + 32) setConnectionState:3];
      id v4 = [*(id *)(a1 + 32) fairPlayInfo];
      [v4 endSecuritySession];

      unint64_t v5 = *(void **)(a1 + 32);
      id v6 = objc_alloc_init(HSLogoutRequest);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __26__HSConnection_disconnect__block_invoke_2;
      v10[3] = &unk_26423A2C0;
      void v10[4] = *(void *)(a1 + 32);
      [v5 _sendRequest:v6 withInternalResponseHandler:v10];
    }
  }
  else
  {
    [v3 setDatabaseRevision:1];
    [*(id *)(a1 + 32) setConnectionState:0];
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (v7)
  {
    dispatch_source_cancel(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = 0;
  }
}

uint64_t __26__HSConnection_disconnect__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSessionID:0];
  [*(id *)(a1 + 32) setDatabaseRevision:1];
  int v2 = *(void **)(a1 + 32);
  return [v2 setConnectionState:0];
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__HSConnection_connectWithCompletionHandler___block_invoke;
  v11[3] = &unk_26423A270;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x2166B7C00](v11);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HSConnection_connectWithCompletionHandler___block_invoke_3;
  block[3] = &unk_26423A398;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

void __45__HSConnection_connectWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HSConnection_connectWithCompletionHandler___block_invoke_2;
  block[3] = &unk_26423A248;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __45__HSConnection_connectWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) connectionState])
  {
    int v2 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 64);
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = v3;
      _os_log_impl(&dword_2152C7000, v2, OS_LOG_TYPE_FAULT, "Unable to connect, current state: %ld", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setConnectionState:1];
    id v4 = +[HSRequest request];
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__HSConnection_connectWithCompletionHandler___block_invoke_5;
    v6[3] = &unk_26423A298;
    void v6[4] = v5;
    id v7 = *(id *)(a1 + 40);
    [v5 _sendRequest:v4 withInternalResponseHandler:v6];
  }
}

void __45__HSConnection_connectWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 responseCode];
  if (v4 == 200)
  {
    uint64_t v5 = [v3 sessionID];

    [*(id *)(a1 + 32) setSessionID:v5];
    id v6 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = [*(id *)(a1 + 32) sessionID];
      int v15 = 67109120;
      LODWORD(v16) = v7;
      _os_log_impl(&dword_2152C7000, v6, OS_LOG_TYPE_INFO, "Connected with session ID: %d", (uint8_t *)&v15, 8u);
    }

    id v8 = *(void **)(a1 + 32);
    if (v8[7])
    {
      [v8 _loadDatabaseWithInternalConnectionCompletionHandler:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v13 = [v8 fairPlayInfo];
      int v14 = objc_msgSend(v13, "beginNegotiationWithSAPVersion:", objc_msgSend(*(id *)(a1 + 32), "_sapVersionForConnectionType"));

      [*(id *)(a1 + 32) _continueFPSetupNegotiationWithData:v14 internalConnectionCompletionHandler:*(void *)(a1 + 40)];
    }
  }
  else
  {
    uint64_t v9 = v4;
    uint64_t v10 = [v3 error];

    id v11 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = [v10 domain];
      int v15 = 134218498;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = [v10 code];
      _os_log_impl(&dword_2152C7000, v11, OS_LOG_TYPE_ERROR, "Received non-200 login response: %ld error domain: %{public}@ error code: %ld", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 32) disconnect];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __45__HSConnection_connectWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)dealloc
{
  [(HSConnection *)self setHomeSharingGroupID:0];
  [(HSConnection *)self setFairPlayInfo:0];
  v3.receiver = self;
  v3.super_class = (Class)HSConnection;
  [(HSConnection *)&v3 dealloc];
}

- (HSConnection)initWithBaseURL:(id)a3 connectionType:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HSConnection;
  int v7 = [(HSConnection *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    baseURL = v7->_baseURL;
    v7->_baseURL = (NSURL *)v8;

    v7->_connectionType = a4;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.homesharing.HSConnection", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v10;

    v7->_databaseRevision = 1;
  }

  return v7;
}

- (HSConnection)initWithBaseURL:(id)a3
{
  return [(HSConnection *)self initWithBaseURL:a3 connectionType:0];
}

@end