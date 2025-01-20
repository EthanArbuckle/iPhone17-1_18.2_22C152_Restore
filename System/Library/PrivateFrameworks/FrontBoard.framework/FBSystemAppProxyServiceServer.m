@interface FBSystemAppProxyServiceServer
+ (id)sharedInstance;
+ (id)targetQueue;
- (id)_initWithQueue:(id)a3;
- (void)_handleActions:(id)a3 forClient:(id)a4;
- (void)_handleGetPasscodeLockedOrBlockedStatus:(id)a3 forClient:(id)a4;
- (void)_handleGetProcessHandle:(id)a3 forClient:(id)a4;
- (void)_handleShutdown:(id)a3 forClient:(id)a4;
- (void)_handleSystemApplicationBundleIdentifier:(id)a3 forClient:(id)a4;
- (void)_handleTerminateApplication:(id)a3 forClient:(id)a4;
- (void)_handleTerminateApplicationGroup:(id)a3 forClient:(id)a4;
- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4;
- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5;
@end

@implementation FBSystemAppProxyServiceServer

void __84__FBSystemAppProxyServiceServer__handleSystemApplicationBundleIdentifier_forClient___block_invoke(uint64_t a1, void *a2)
{
  v2 = (const char *)*MEMORY[0x1E4F62780];
  id v3 = a2;
  id v4 = FBSystemAppBundleID();
  xpc_dictionary_set_string(v3, v2, (const char *)[v4 UTF8String]);
}

+ (id)targetQueue
{
  v2 = [a1 sharedInstance];
  id v3 = [v2 queue];

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) { {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  }
  v2 = (void *)sharedInstance___SharedInstance;

  return v2;
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v12 = a3;
  id v9 = a5;
  if (v9)
  {
    v10 = v9;
    switch(a4)
    {
      case 0:
        [(FBSystemAppProxyServiceServer *)self _handleSystemApplicationBundleIdentifier:v12 forClient:v9];
        break;
      case 1:
        [(FBSystemAppProxyServiceServer *)self _handleGetPasscodeLockedOrBlockedStatus:v12 forClient:v9];
        break;
      case 2:
        [(FBSystemAppProxyServiceServer *)self _handleGetProcessHandle:v12 forClient:v9];
        break;
      case 3:
        [(FBSystemAppProxyServiceServer *)self _handleActions:v12 forClient:v9];
        break;
      case 4:
        [(FBSystemAppProxyServiceServer *)self _handleTerminateApplication:v12 forClient:v9];
        break;
      case 5:
        [(FBSystemAppProxyServiceServer *)self _handleTerminateApplicationGroup:v12 forClient:v9];
        break;
      case 6:
        [(FBSystemAppProxyServiceServer *)self _handleShutdown:v12 forClient:v9];
        break;
      default:
        break;
    }
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"client"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemAppProxyServiceServer noteDidReceiveMessage:withType:fromClient:](a2, (uint64_t)self, (uint64_t)v11);
    }
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_handleSystemApplicationBundleIdentifier:(id)a3 forClient:(id)a4
{
}

void __47__FBSystemAppProxyServiceServer_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x1E4F62820] serial];
  v1 = [v0 serviceClass:25];
  id v6 = (id)BSDispatchQueueCreate();

  v2 = [FBSystemAppProxyServiceServer alloc];
  id v3 = [MEMORY[0x1E4F62AC8] _queueWithSerialDispatchQueue:v6];
  uint64_t v4 = [(FBSystemAppProxyServiceServer *)v2 _initWithQueue:v3];
  v5 = (void *)sharedInstance___SharedInstance;
  sharedInstance___SharedInstance = v4;
}

- (id)_initWithQueue:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F62760];
  v9.receiver = self;
  v9.super_class = (Class)FBSystemAppProxyServiceServer;
  v5 = [(FBSServiceFacility *)&v9 initWithIdentifier:v4 queue:a3];
  if (v5)
  {
    id v6 = [[FBServiceClientAuthenticator alloc] initWithEntitlement:@"com.apple.frontboard.shutdown"];
    shutdownAuthenticator = v5->_shutdownAuthenticator;
    v5->_shutdownAuthenticator = v6;
  }
  return v5;
}

- (void)_handleGetPasscodeLockedOrBlockedStatus:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  v5 = +[FBSystemService sharedInstance];
  id v6 = [v5 queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke;
  v9[3] = &unk_1E5C497A0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performAsync:v9];
}

void __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke_2;
  v2[3] = &unk_1E5C49778;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 isPasscodeLockedOrBlockedWithResult:v2];
}

uint64_t __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke_2(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke_3;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleGetProcessHandle:(id)a3 forClient:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 processHandle];
  char v8 = [v7 hasEntitlement:@"com.apple.frontboard.application-process-handle"];

  if (v8)
  {
    objc_super v9 = [v5 payload];
    id v10 = BSDeserializeStringFromXPCDictionaryWithKey();

    if (v10)
    {
      id v11 = +[FBProcessManager sharedInstance];
      id v12 = [v11 processesForBundleIdentifier:v10];
      v13 = [v12 firstObject];

      if (!v13)
      {
        v14 = (void *)MEMORY[0x1E4F963E8];
        v15 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v10];
        v16 = [v14 handleForPredicate:v15 error:0];

        if (v16)
        {
          v17 = +[FBProcessManager sharedInstance];
          [v16 auditToken];
          v13 = [v17 registerProcessForAuditToken:v23];
        }
        else
        {
          v13 = 0;
        }
      }
    }
    else
    {
      v13 = 0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __67__FBSystemAppProxyServiceServer__handleGetProcessHandle_forClient___block_invoke;
    v21[3] = &unk_1E5C497C8;
    id v22 = v13;
    id v20 = v13;
    [v5 sendReplyMessageWithPacker:v21];
  }
  else
  {
    id v10 = FBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v6 processHandle];
      v19 = FBSProcessPrettyDescription();
      *(_DWORD *)buf = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1A62FC000, v10, OS_LOG_TYPE_DEFAULT, "[FBSystemService] %{public}@ is not permitted to acquire application process handles.", buf, 0xCu);
    }
  }
}

void __67__FBSystemAppProxyServiceServer__handleGetProcessHandle_forClient___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 handle];
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void)_handleActions:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 payload];
  char v8 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  objc_super v9 = [v6 processHandle];

  id v10 = [v9 auditToken];

  id v11 = +[FBSystemService sharedInstance];
  id v12 = [v11 queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke;
  v17[3] = &unk_1E5C49838;
  id v18 = v11;
  id v19 = v8;
  id v20 = v10;
  id v21 = v5;
  id v13 = v5;
  id v14 = v10;
  id v15 = v8;
  id v16 = v11;
  [v12 performAsync:v17];
}

void __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke_2;
  v5[3] = &unk_1E5C49810;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 handleActions:v3 source:v4 withResult:v5];
}

uint64_t __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke_3;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v4[4] = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  int64_t v2 = *(void *)(a1 + 32);
  if (v2) { {
    xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F62788], v2);
  }
  }
}

- (void)_handleTerminateApplication:(id)a3 forClient:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 processHandle];
  id v7 = [v6 auditToken];

  if ([v7 hasEntitlement:@"com.apple.multitasking.termination"])
  {
    char v8 = [v5 payload];
    objc_super v9 = BSDeserializeStringFromXPCDictionaryWithKey();
    if (v9)
    {
      int int64 = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E4F627B0]);
      BOOL v11 = xpc_dictionary_get_BOOL(v8, (const char *)*MEMORY[0x1E4F627B8]);
      id v12 = BSDeserializeStringFromXPCDictionaryWithKey();
      id v13 = FBLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [v7 pid];
        BSProcessDescriptionForPID();
        id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        id v20 = v14;
        __int16 v21 = 2114;
        id v22 = v9;
        __int16 v23 = 2114;
        v24 = v12;
        _os_log_impl(&dword_1A62FC000, v13, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Request received from %{public}@ to terminate application %{public}@: \"%{public}@\"", buf, 0x20u);
      }
      id v15 = +[FBSystemService sharedInstance];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_21;
      v17[3] = &unk_1E5C49778;
      id v18 = v5;
      [v15 terminateApplication:v9 forReason:int64 andReport:v11 withDescription:v12 completion:v17];
    }
    else
    {
      [v5 sendReplyMessageWithPacker:&__block_literal_global_19];
    }
  }
  else
  {
    id v16 = FBLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = @"com.apple.multitasking.termination";
      _os_log_impl(&dword_1A62FC000, v16, OS_LOG_TYPE_DEFAULT, "Entitlement %@ required to kill applications.", buf, 0xCu);
    }

    [v5 sendReplyMessageWithPacker:&__block_literal_global_16];
  }
}

void __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = (const char *)*MEMORY[0x1E4F62788];
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, v2, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F62798], "client not entitled");
}

void __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_2(uint64_t a1, void *a2)
{
  int64_t v2 = (const char *)*MEMORY[0x1E4F62788];
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, v2, 22);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F62798], "invalid bundle identifier");
}

uint64_t __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_21(uint64_t a1, char a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_2_22;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_2_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32)) { {
    int64_t v4 = 0;
  }
  }
  else {
    int64_t v4 = 3;
  }
  xpc_object_t xdict = v3;
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F62788], v4);
  if (!*(unsigned char *)(a1 + 32)) { {
    xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F62798], "found nothing to terminate");
  }
  }
}

- (void)_handleTerminateApplicationGroup:(id)a3 forClient:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 processHandle];
  id v7 = [v6 auditToken];

  if ([v7 hasEntitlement:@"com.apple.multitasking.termination"])
  {
    char v8 = [v5 payload];
    LODWORD(v9) = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E4F627A8]);
    int int64 = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E4F627B0]);
    BOOL v11 = xpc_dictionary_get_BOOL(v8, (const char *)*MEMORY[0x1E4F627B8]);
    id v12 = BSDeserializeStringFromXPCDictionaryWithKey();
    id v13 = FBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      [v7 pid];
      BSProcessDescriptionForPID();
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (int)v9;
      id v15 = FBSApplicationTerminationGroupDescription();
      *(_DWORD *)buf = 138543874;
      __int16 v21 = v14;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      _os_log_impl(&dword_1A62FC000, v13, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Request received from %{public}@ to terminate %{public}@: \"%{public}@\"", buf, 0x20u);
    }
    else
    {
      uint64_t v9 = (int)v9;
    }

    v17 = +[FBSystemService sharedInstance];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke_26;
    v18[3] = &unk_1E5C49778;
    id v19 = v5;
    [v17 terminateApplicationGroup:v9 forReason:int64 andReport:v11 withDescription:v12 completion:v18];
  }
  else
  {
    id v16 = FBLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v21 = @"com.apple.multitasking.termination";
      _os_log_impl(&dword_1A62FC000, v16, OS_LOG_TYPE_DEFAULT, "Entitlement %@ required to kill applications.", buf, 0xCu);
    }

    [v5 sendReplyMessageWithPacker:&__block_literal_global_25];
  }
}

void __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = (const char *)*MEMORY[0x1E4F62788];
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, v2, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F62798], "client not entitled");
}

uint64_t __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke_26(uint64_t a1, char a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32)) { {
    int64_t v4 = 0;
  }
  }
  else {
    int64_t v4 = 3;
  }
  xpc_object_t xdict = v3;
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F62788], v4);
  if (!*(unsigned char *)(a1 + 32)) { {
    xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F62798], "found nothing to terminate");
  }
  }
}

- (void)_handleShutdown:(id)a3 forClient:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  shutdownAuthenticator = self->_shutdownAuthenticator;
  id v22 = 0;
  BOOL v9 = [(FBServiceClientAuthenticator *)shutdownAuthenticator authenticateClient:v7 error:&v22];
  id v10 = v22;
  if (v9)
  {
    BOOL v11 = +[FBSystemService sharedInstance];
    id v12 = [v11 queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__FBSystemAppProxyServiceServer__handleShutdown_forClient___block_invoke;
    v18[3] = &unk_1E5C49860;
    id v19 = v6;
    id v20 = v7;
    id v21 = v11;
    id v13 = v11;
    [v12 performAsync:v18];
  }
  else
  {
    id v13 = FBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v7 processHandle];
      id v15 = FBSProcessPrettyDescription();
      id v16 = [v10 userInfo];
      v17 = [v16 objectForKey:*MEMORY[0x1E4F28588]];
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v15;
      __int16 v25 = 2114;
      uint64_t v26 = v17;
      _os_log_impl(&dword_1A62FC000, v13, OS_LOG_TYPE_DEFAULT, "[FBSystemService] %{public}@ is not permitted to initate system shutdown: %{public}@", buf, 0x16u);
    }
  }
}

void __59__FBSystemAppProxyServiceServer__handleShutdown_forClient___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [*(id *)(a1 + 32) payload];
  id v3 = BSDeserializeBSXPCEncodableObjectFromXPCDictionary();

  int64_t v4 = FBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    BOOL v11 = v3;
    _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Request received to shutdown system from client: %{public}@ with options: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = *(void **)(a1 + 48);
  id v7 = [*(id *)(a1 + 40) processHandle];
  [v6 shutdownWithOptions:v3 origin:v7];
}

- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F62B40];
  id v6 = a3;
  id v8 = [v5 messageWithPacker:&__block_literal_global_29];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];

  [(FBSServiceFacility *)self sendMessage:v8 withType:0 toClients:v7];
}

void __66__FBSystemAppProxyServiceServer_noteClientDidConnect_withMessage___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = (void *)MEMORY[0x1E4F62878];
  id v3 = a2;
  id v4 = [v2 processHandle];
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void).cxx_destruct
{
}

- (void)noteDidReceiveMessage:(const char *)a1 withType:(uint64_t)a2 fromClient:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  BOOL v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"FBSystemAppProxyServiceServer.m";
  __int16 v16 = 1024;
  int v17 = 252;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end