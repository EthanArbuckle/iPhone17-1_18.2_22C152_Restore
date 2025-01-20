@interface MPAVRouteConnection
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isInvalidated;
- (MPAVRouteConnection)initWithExternalDeviceObject:(id)a3;
- (MRExternalDevice)externalDeviceObject;
- (id)description;
- (id)invalidationHandler;
- (void)_connectionStateDidChange:(unsigned int)a3 error:(id)a4;
- (void)_externalDeviceConnectionStateDidChangeNotification:(id)a3;
- (void)connectWithCompletion:(id)a3;
- (void)connectWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)connectWithOptions:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5;
- (void)connectWithUserInfo:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)externalDevice;
- (void)reset;
- (void)sendCustomData:(id)a3;
- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation MPAVRouteConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)_externalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKey:*MEMORY[0x1E4F771A0]];
  int v7 = [v6 unsignedIntValue];

  v8 = [v4 userInfo];

  v9 = [v8 objectForKey:*MEMORY[0x1E4F28A50]];

  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MPAVRouteConnection__externalDeviceConnectionStateDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F1FE8;
  int v14 = v7;
  block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(calloutQueue, block);
}

uint64_t __75__MPAVRouteConnection__externalDeviceConnectionStateDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionStateDidChange:*(unsigned int *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_connectionStateDidChange:(unsigned int)a3 error:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  switch(a3)
  {
    case 1u:
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v11 = v10;
      v12 = @"_MPAVRouteConnectionDidAttemptConnectionNotification";
LABEL_7:
      [v10 postNotificationName:v12 object:self];

      break;
    case 2u:
      accessQueue = self->_accessQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__MPAVRouteConnection__connectionStateDidChange_error___block_invoke_2;
      v14[3] = &unk_1E57F9EA8;
      v14[4] = self;
      dispatch_sync(accessQueue, v14);
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v11 = v10;
      v12 = @"_MPAVRouteConnectionDidConnectNotification";
      goto LABEL_7;
    case 3u:
      v8 = self->_accessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__MPAVRouteConnection__connectionStateDidChange_error___block_invoke;
      block[3] = &unk_1E57F9F98;
      block[4] = self;
      id v16 = v6;
      dispatch_sync(v8, block);
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"_MPAVRouteConnectionDidInvalidateNotification" object:self];

      break;
  }
}

uint64_t __55__MPAVRouteConnection__connectionStateDidChange_error___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = 1;
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 40);
  if (v1) {
    return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)(*(void *)(result + 32) + 40), *(void *)(result + 40));
  }
  return result;
}

uint64_t __55__MPAVRouteConnection__connectionStateDidChange_error___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(MRExternalDevice *)self->_externalDevice customOrigin];
  if (v9)
  {
    id v10 = v8;
    MRMediaRemoteSendCommandToApp();
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __76__MPAVRouteConnection_sendMediaRemoteCommand_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)sendCustomData:(id)a3
{
}

- (void)reset
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MPAVRouteConnection_reset__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __28__MPAVRouteConnection_reset__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

- (BOOL)isInvalidated
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MPAVRouteConnection_isInvalidated__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__MPAVRouteConnection_isInvalidated__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)connectWithOptions:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke;
  v19[3] = &unk_1E57F8500;
  v19[4] = self;
  id v20 = v9;
  id v10 = v9;
  id v11 = (void *)MEMORY[0x19971E0F0](v19);
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_3;
  v15[3] = &unk_1E57F1F98;
  v15[4] = self;
  id v16 = v8;
  id v17 = v11;
  unint64_t v18 = a3;
  id v13 = v8;
  id v14 = v11;
  dispatch_async(accessQueue, v15);
}

void __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_2;
    v6[3] = &unk_1E57F9140;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[24])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPAVRouteConnectionErrorDomain" code:2 userInfo:0];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else if ([v2 isConnected])
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"%@:%p", objc_opt_class(), *(void *)(a1 + 32)];
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"MPAVRouteConnectionReasonUserInfoKey"];
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"MPAVRouteConnectionCorrelationIDUserInfoKey"];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F29128] UUID];
      id v10 = [v11 UUIDString];
    }
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"MPAVRouteConnection"];
    id v13 = v12;
    if (v7) {
      [v12 appendFormat:@"-%@", v7];
    }
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"MPRouteConnection.connectWithOptions", v10];
    v15 = v14;
    if (v6) {
      [v14 appendFormat:@" for %@", v6];
    }
    if (v7) {
      [v15 appendFormat:@" because %@", v7];
    }
    id v16 = _MRLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v15;
      _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    id v17 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v18 = *(_DWORD *)(a1 + 56) & 1;
    uint64_t v19 = *MEMORY[0x1E4F76F40];
    v30[0] = *MEMORY[0x1E4F76F48];
    v30[1] = v19;
    v31[0] = v13;
    v31[1] = v10;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_85;
    v25[3] = &unk_1E57F1F70;
    id v26 = v6;
    id v27 = v10;
    id v28 = v5;
    id v29 = *(id *)(a1 + 48);
    id v21 = v5;
    id v22 = v10;
    id v23 = v6;
    [v17 connectWithOptions:v18 userInfo:v20 completion:v25];

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

void __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_85(void *a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[4];
  v5 = _MRLogForCategory();
  uint64_t v6 = v5;
  if (!v3)
  {
    BOOL v15 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v15) {
        goto LABEL_15;
      }
      id v17 = (void *)a1[4];
      uint64_t v16 = a1[5];
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[6]];
      int v32 = 138544130;
      v33 = @"MPRouteConnection.connectWithOptions";
      __int16 v34 = 2114;
      uint64_t v35 = v16;
      __int16 v36 = 2114;
      id v37 = v17;
      __int16 v38 = 2048;
      uint64_t v39 = v18;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v20 = v6;
      uint32_t v21 = 42;
    }
    else
    {
      if (!v15) {
        goto LABEL_15;
      }
      uint64_t v24 = a1[5];
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[6]];
      int v32 = 138543874;
      v33 = @"MPRouteConnection.connectWithOptions";
      __int16 v34 = 2114;
      uint64_t v35 = v24;
      __int16 v36 = 2048;
      id v37 = v25;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v20 = v6;
      uint32_t v21 = 32;
    }
    _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v32, v21);
    goto LABEL_14;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7)
    {
      uint64_t v9 = a1[4];
      uint64_t v8 = a1[5];
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[6]];
      int v32 = 138544386;
      v33 = @"MPRouteConnection.connectWithOptions";
      __int16 v34 = 2114;
      uint64_t v35 = v8;
      __int16 v36 = 2114;
      id v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v9;
      __int16 v40 = 2048;
      uint64_t v41 = v11;
      v12 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      id v13 = v6;
      uint32_t v14 = 52;
LABEL_10:
      _os_log_error_impl(&dword_1952E8000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v32, v14);
LABEL_14:
    }
  }
  else if (v7)
  {
    uint64_t v22 = a1[5];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceDate:a1[6]];
    int v32 = 138544130;
    v33 = @"MPRouteConnection.connectWithOptions";
    __int16 v34 = 2114;
    uint64_t v35 = v22;
    __int16 v36 = 2114;
    id v37 = v3;
    __int16 v38 = 2048;
    uint64_t v39 = v23;
    v12 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    id v13 = v6;
    uint32_t v14 = 42;
    goto LABEL_10;
  }
LABEL_15:

  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[7] + 16))(a1[7], v3, v26, v27, v28, v29, v30, v31);
}

uint64_t __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)connectWithUserInfo:(id)a3 completion:(id)a4
{
}

- (void)connectWithOptions:(unint64_t)a3 completion:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"MPAVRouteConnectionReasonUserInfoKey";
  v10[0] = @"deprecated";
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  uint64_t v8 = [v6 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(MPAVRouteConnection *)self connectWithOptions:a3 userInfo:v8 completion:v7];
}

- (void)connectWithCompletion:(id)a3
{
}

- (BOOL)isConnecting
{
  return [(MRExternalDevice *)self->_externalDevice connectionState] == 1;
}

- (BOOL)isConnected
{
  return [(MRExternalDevice *)self->_externalDevice isConnected];
}

- (MRExternalDevice)externalDeviceObject
{
  return self->_externalDevice;
}

- (void)externalDevice
{
  return self->_externalDevice;
}

- (id)description
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__22541;
  uint64_t v8 = __Block_byref_object_dispose__22542;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __34__MPAVRouteConnection_description__block_invoke(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 24)) {
    v5 = @"NO";
  }
  else {
    v5 = @"YES";
  }
  if ([*(id *)(a1 + 32) isConnected]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v7 = [v2 stringWithFormat:@"<%@: %p valid: %@, connected: %@ %@>", v3, v4, v5, v6, *(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77198] object:self->_externalDevice];

  v4.receiver = self;
  v4.super_class = (Class)MPAVRouteConnection;
  [(MPAVRouteConnection *)&v4 dealloc];
}

- (MPAVRouteConnection)initWithExternalDeviceObject:(id)a3
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPAVRouteConnection;
  uint64_t v7 = [(MPAVRouteConnection *)&v15 init];
  if (v7)
  {
    if (!v6)
    {
      uint32_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v7, @"MPAVRouteConnection.m", 54, @"Invalid parameter not satisfying: %@", @"externalDevice" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_externalDevice, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlayerFramework.MPAVRouteConnection.accessQueue", 0);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaPlayerFramework.MPAVRouteConnection.calloutQueue", 0);
    calloutQueue = v7->_calloutQueue;
    v7->_calloutQueue = (OS_dispatch_queue *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__externalDeviceConnectionStateDidChangeNotification_ name:*MEMORY[0x1E4F77198] object:v6];
  }
  return v7;
}

@end