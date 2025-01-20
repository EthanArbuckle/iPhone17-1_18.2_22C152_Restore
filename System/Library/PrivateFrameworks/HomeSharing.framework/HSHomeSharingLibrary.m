@interface HSHomeSharingLibrary
- (BOOL)_hasPendingUpdateRequest;
- (BOOL)isAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPassword;
- (HSConnection)connection;
- (HSHomeSharingLibrary)initWithName:(id)a3 uniqueIdentifier:(id)a4 version:(unsigned int)a5 baseURL:(id)a6 homeSharingGroupID:(id)a7 connectionType:(int64_t)a8;
- (NSNetService)service;
- (NSString)deviceGUID;
- (NSString)homeSharingGroupID;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (NSURL)baseURL;
- (id)securityInfoForURL:(id)a3;
- (id)signedRequestFromURLRequest:(id)a3;
- (id)urlForRequest:(id)a3;
- (int64_t)connectionState;
- (int64_t)connectionType;
- (unint64_t)hash;
- (unsigned)basePlaylistContainerID;
- (unsigned)databaseID;
- (unsigned)version;
- (void)_onQueue_ensureConnection;
- (void)_sendUpdateRequest;
- (void)connectWithCompletionHandler:(id)a3;
- (void)disconnect;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)setConnection:(id)a3;
- (void)setService:(id)a3;
- (void)set_hasPendingUpdateRequest:(BOOL)a3;
@end

@implementation HSHomeSharingLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_homeSharingGroupID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_connectionAccessQueue, 0);
}

- (void)setConnection:(id)a3
{
}

- (HSConnection)connection
{
  return self->_connection;
}

- (void)set_hasPendingUpdateRequest:(BOOL)a3
{
  self->__hasPendingUpdateRequest = a3;
}

- (BOOL)_hasPendingUpdateRequest
{
  return self->__hasPendingUpdateRequest;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setService:(id)a3
{
}

- (NSNetService)service
{
  return self->_service;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSString)homeSharingGroupID
{
  return self->_homeSharingGroupID;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)_sendUpdateRequest
{
  if ([(HSHomeSharingLibrary *)self _hasPendingUpdateRequest])
  {
    v3 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2152C7000, v3, OS_LOG_TYPE_ERROR, "Outstanding update request when attempting to send new update request.", buf, 2u);
    }
  }
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HSHomeSharingLibrary__sendUpdateRequest__block_invoke;
  block[3] = &unk_26423A410;
  block[4] = self;
  dispatch_async(connectionAccessQueue, block);
}

void __42__HSHomeSharingLibrary__sendUpdateRequest__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_ensureConnection");
  if ([*(id *)(a1 + 32) isAvailable])
  {
    objc_msgSend(*(id *)(a1 + 32), "set_hasPendingUpdateRequest:", 1);
    v2 = [*(id *)(a1 + 32) connection];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __42__HSHomeSharingLibrary__sendUpdateRequest__block_invoke_2;
    v5[3] = &unk_26423A460;
    v5[4] = *(void *)(a1 + 32);
    [v2 checkForDatabaseUpdatesWithCompletionHandler:v5];
  }
  else
  {
    v2 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v3 = *(void *)(a1 + 32);
    v6 = @"HSHomeSharingLibraryKey";
    v7[0] = v3;
    v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 postNotificationName:@"HSHomeSharingLibraryDidBecomeUnavailableNotification" object:v3 userInfo:v4];
  }
}

uint64_t __42__HSHomeSharingLibrary__sendUpdateRequest__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "set_hasPendingUpdateRequest:", 0);
  if (!a3)
  {
    if (a2)
    {
      v7 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v8 = *(void *)(a1 + 32);
      v10 = @"HSHomeSharingLibraryKey";
      v11[0] = v8;
      v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      [v7 postNotificationName:@"HSHomeSharingLibraryDidUpdateRevisionNumberNotification" object:v8 userInfo:v9];
    }
    return [*(id *)(a1 + 32) _sendUpdateRequest];
  }
  return result;
}

- (void)_onQueue_ensureConnection
{
  if (self->_available)
  {
    connection = self->_connection;
    if (!connection)
    {
      v4 = [HSConnection alloc];
      v5 = [(HSHomeSharingLibrary *)self baseURL];
      v6 = [(HSConnection *)v4 initWithBaseURL:v5 connectionType:[(HSHomeSharingLibrary *)self connectionType]];
      v7 = self->_connection;
      self->_connection = v6;

      uint64_t v8 = [(HSHomeSharingLibrary *)self homeSharingGroupID];
      [(HSConnection *)self->_connection setHomeSharingGroupID:v8];

      v9 = objc_alloc_init(HSFairPlayInfo);
      [(HSConnection *)self->_connection setFairPlayInfo:v9];

      connection = self->_connection;
    }
    if ([(HSConnection *)connection connectionState] != 2)
    {
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      v11 = self->_connection;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __49__HSHomeSharingLibrary__onQueue_ensureConnection__block_invoke;
      v14[3] = &unk_26423A770;
      v14[4] = self;
      v12 = v10;
      v15 = v12;
      [(HSConnection *)v11 connectWithCompletionHandler:v14];
      dispatch_time_t v13 = dispatch_time(0, 3000000000);
      if (dispatch_semaphore_wait(v12, v13)) {
        self->_available = 0;
      }
    }
  }
}

intptr_t __49__HSHomeSharingLibrary__onQueue_ensureConnection__block_invoke(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = a2;
  if (a2) {
    [*(id *)(a1 + 32) _sendUpdateRequest];
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v3);
}

- (NSString)deviceGUID
{
  v2 = (void *)MGCopyAnswer();
  return (NSString *)v2;
}

- (int64_t)connectionState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__HSHomeSharingLibrary_connectionState__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(connectionAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__HSHomeSharingLibrary_connectionState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 connectionState];
}

- (unsigned)basePlaylistContainerID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__HSHomeSharingLibrary_basePlaylistContainerID__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(connectionAccessQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__HSHomeSharingLibrary_basePlaylistContainerID__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 basePlaylistContainerID];
}

- (unsigned)databaseID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__HSHomeSharingLibrary_databaseID__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(connectionAccessQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__HSHomeSharingLibrary_databaseID__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 databaseID];
}

- (unint64_t)hash
{
  id v2 = [(HSHomeSharingLibrary *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(HSHomeSharingLibrary *)self uniqueIdentifier];
    v7 = [v5 uniqueIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)disconnect
{
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HSHomeSharingLibrary_disconnect__block_invoke;
  block[3] = &unk_26423A410;
  block[4] = self;
  dispatch_async(connectionAccessQueue, block);
}

uint64_t __34__HSHomeSharingLibrary_disconnect__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) disconnect];
  [*(id *)(a1 + 32) setConnection:0];
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "set_hasPendingUpdateRequest:", 0);
}

- (id)urlForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_time_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1853;
  v16 = __Block_byref_object_dispose__1854;
  id v17 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HSHomeSharingLibrary_urlForRequest___block_invoke;
  block[3] = &unk_26423A3E8;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(connectionAccessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __38__HSHomeSharingLibrary_urlForRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeSharingGroupID];
  if ([v2 length])
  {
    unint64_t v3 = [*(id *)(a1 + 40) action];
    char v4 = [v3 isEqual:@"server-info"];

    if (v4) {
      goto LABEL_5;
    }
    id v5 = *(void **)(a1 + 40);
    id v2 = [*(id *)(a1 + 32) homeSharingGroupID];
    [v5 setValue:v2 forArgument:@"hsgid"];
  }

LABEL_5:
  id v6 = [*(id *)(a1 + 32) connection];
  uint64_t v7 = [v6 connectionType];

  if (!v7)
  {
    char v8 = [*(id *)(a1 + 40) action];
    uint64_t v9 = [v8 isEqual:@"logout"];

    if ((v9 & 1) == 0) {
      [*(id *)(a1 + 40) setValue:@"1" forArgument:@"daap-no-disconnect"];
    }
    [*(id *)(a1 + 40) setValue:@"1" forArgument:@"hs-mobile-device-client"];
  }
  id v10 = *(void **)(a1 + 40);
  id v14 = [*(id *)(*(void *)(a1 + 32) + 72) baseURL];
  uint64_t v11 = objc_msgSend(v10, "requestURLForBaseURL:sessionID:", v14, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "sessionID"));
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (id)signedRequestFromURLRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_time_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1853;
  v16 = __Block_byref_object_dispose__1854;
  id v17 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HSHomeSharingLibrary_signedRequestFromURLRequest___block_invoke;
  block[3] = &unk_26423A3E8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(connectionAccessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __52__HSHomeSharingLibrary_signedRequestFromURLRequest___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) connection];
  uint64_t v2 = [v5 signedRequestFromURLRequest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)securityInfoForURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_time_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1853;
  v16 = __Block_byref_object_dispose__1854;
  id v17 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HSHomeSharingLibrary_securityInfoForURL___block_invoke;
  block[3] = &unk_26423A3E8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(connectionAccessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__HSHomeSharingLibrary_securityInfoForURL___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) connection];
  uint64_t v2 = [v6 fairPlayInfo];
  uint64_t v3 = [v2 securityInfoForURL:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HSHomeSharingLibrary_sendRequest_withResponseHandler___block_invoke;
  block[3] = &unk_26423A3C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(connectionAccessQueue, block);
}

void __56__HSHomeSharingLibrary_sendRequest_withResponseHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_ensureConnection");
  if ([*(id *)(a1 + 32) isAvailable])
  {
    id v3 = [*(id *)(a1 + 32) connection];
    [v3 sendRequest:*(void *)(a1 + 40) withResponseHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  connectionAccessQueue = self->_connectionAccessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __53__HSHomeSharingLibrary_connectWithCompletionHandler___block_invoke;
  v7[3] = &unk_26423A398;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionAccessQueue, v7);
}

void __53__HSHomeSharingLibrary_connectWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[9])
  {
    id v3 = [HSConnection alloc];
    id v4 = [*(id *)(a1 + 32) baseURL];
    uint64_t v5 = -[HSConnection initWithBaseURL:connectionType:](v3, "initWithBaseURL:connectionType:", v4, [*(id *)(a1 + 32) connectionType]);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = v5;

    id v8 = [*(id *)(a1 + 32) homeSharingGroupID];
    [*(id *)(*(void *)(a1 + 32) + 72) setHomeSharingGroupID:v8];

    id v9 = objc_alloc_init(HSFairPlayInfo);
    [*(id *)(*(void *)(a1 + 32) + 72) setFairPlayInfo:v9];

    uint64_t v2 = *(void **)(a1 + 32);
  }
  id v10 = [v2 connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__HSHomeSharingLibrary_connectWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_26423A370;
  uint64_t v11 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  [v10 connectWithCompletionHandler:v12];
}

void __53__HSHomeSharingLibrary_connectWithCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) _sendUpdateRequest];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HSHomeSharingLibrary)initWithName:(id)a3 uniqueIdentifier:(id)a4 version:(unsigned int)a5 baseURL:(id)a6 homeSharingGroupID:(id)a7 connectionType:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v35.receiver = self;
  v35.super_class = (Class)HSHomeSharingLibrary;
  v18 = [(HSHomeSharingLibrary *)&v35 init];
  v19 = v18;
  if (v18)
  {
    v18->_available = 1;
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.homesharing.HSHomeSharingLibrary.connectionAccessQueue", 0);
    connectionAccessQueue = v19->_connectionAccessQueue;
    v19->_connectionAccessQueue = (OS_dispatch_queue *)v20;

    v22 = [[HSConnection alloc] initWithBaseURL:v16 connectionType:a8];
    connection = v19->_connection;
    v19->_connection = v22;

    [(HSConnection *)v19->_connection setHomeSharingGroupID:v17];
    v24 = objc_alloc_init(HSFairPlayInfo);
    [(HSConnection *)v19->_connection setFairPlayInfo:v24];

    if ([v14 hasSuffix:@"_PW"])
    {
      uint64_t v25 = objc_msgSend(v14, "substringWithRange:", 0, objc_msgSend(v14, "length") - 3);

      v19->_requiresPassword = 1;
    }
    else
    {
      if ([v14 rangeOfString:@"_"] == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_7:
        uint64_t v26 = [v14 copy];
        name = v19->_name;
        v19->_name = (NSString *)v26;

        uint64_t v28 = [v15 copy];
        uniqueIdentifier = v19->_uniqueIdentifier;
        v19->_uniqueIdentifier = (NSString *)v28;

        v19->_version = a5;
        uint64_t v30 = [v16 copy];
        baseURL = v19->_baseURL;
        v19->_baseURL = (NSURL *)v30;

        uint64_t v32 = [v17 copy];
        homeSharingGroupID = v19->_homeSharingGroupID;
        v19->_homeSharingGroupID = (NSString *)v32;

        v19->_connectionType = a8;
        goto LABEL_8;
      }
      uint64_t v25 = objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "rangeOfString:", @"_"));
    }
    id v14 = (id)v25;
    goto LABEL_7;
  }
LABEL_8:

  return v19;
}

@end