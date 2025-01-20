@interface FBSSystemAppProxy
+ (id)checkoutProxyWithEndpoint:(id)a3;
- (BOOL)isPasscodeLockedOrBlocked;
- (id)clientCallbackQueue;
- (id)processHandleForBundleID:(id)a3;
- (id)systemApplicationBundleIdentifier;
- (void)_handleConnect:(id)a3;
- (void)_handleTerminationReply:(id)a3 targetDescription:(id)a4 withCompletion:(id)a5;
- (void)_sendMessageType:(int64_t)a3 withMessage:(id)a4 withReplyHandler:(id)a5 waitForReply:(BOOL)a6;
- (void)checkin;
- (void)fireCompletion:(id)a3 error:(id)a4;
- (void)fireCompletion:(id)a3 openAppErrorCode:(int64_t)a4;
- (void)handleMessage:(id)a3 withType:(int64_t)a4;
- (void)sendActions:(id)a3 withResult:(id)a4;
- (void)setKeyboardFocusApplication:(int)a3 deferringToken:(id)a4 completion:(id)a5;
- (void)shutdownWithOptions:(id)a3;
- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
@end

@implementation FBSSystemAppProxy

- (void)checkin
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __28__FBSSystemAppProxy_checkin__block_invoke;
  v2[3] = &unk_1E58F7148;
  v2[4] = self;
  __accessProxiesWithBlock(v2);
}

+ (id)checkoutProxyWithEndpoint:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = +[FBSServiceFacilityClient defaultShellEndpoint];
    if (!v5)
    {
      v9 = [NSString stringWithFormat:@"cannot checkout proxy without an endpoint"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[FBSSystemAppProxy checkoutProxyWithEndpoint:(uint64_t)v9];
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
    }
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__FBSSystemAppProxy_checkoutProxyWithEndpoint___block_invoke;
  v10[3] = &unk_1E58F7120;
  v12 = &v13;
  id v6 = v5;
  id v11 = v6;
  __accessProxiesWithBlock(v10);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __47__FBSSystemAppProxy_checkoutProxyWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    ++*(void *)(v7 + 88);
  }
  else
  {
    v8 = [FBSSystemAppProxy alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__FBSSystemAppProxy_checkoutProxyWithEndpoint___block_invoke_2;
    v14[3] = &unk_1E58F6448;
    id v15 = *(id *)(a1 + 32);
    uint64_t v9 = [(FBSServiceFacilityClient *)v8 initWithConfigurator:v14];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v12)
    {
      [v3 setObject:v12 forKey:*(void *)(a1 + 32)];
      objc_storeStrong((id *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 80), *(id *)(a1 + 32));
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      ++*(void *)(v13 + 88);
    }
  }
}

void __28__FBSSystemAppProxy_checkin__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = v2[11];
  if (v3 < 2)
  {
    id v5 = a2;
    [v2 invalidate];
    [v5 removeObjectForKey:*(void *)(*(void *)(a1 + 32) + 80)];
  }
  else
  {
    v2[11] = v3 - 1;
  }
}

void __47__FBSSystemAppProxy_checkoutProxyWithEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setEndpoint:v2];
  [v3 setIdentifier:@"com.apple.frontboardservices.system-app-proxy"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (id)systemApplicationBundleIdentifier
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11;
  uint64_t v9 = __Block_byref_object_dispose__11;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__FBSSystemAppProxy_systemApplicationBundleIdentifier__block_invoke_2;
  v4[3] = &unk_1E58F5310;
  v4[4] = &v5;
  [(FBSSystemAppProxy *)self _sendMessageType:0 withMessage:&__block_literal_global_23 withReplyHandler:v4 waitForReply:1];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_sendMessageType:(int64_t)a3 withMessage:(id)a4 withReplyHandler:(id)a5 waitForReply:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__FBSSystemAppProxy__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke;
  v16[3] = &unk_1E58F5400;
  id v12 = v10;
  id v17 = v12;
  uint64_t v13 = +[FBSXPCMessage messageWithPacker:v16];
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__FBSSystemAppProxy__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke_2;
    v14[3] = &unk_1E58F5428;
    id v15 = v11;
    [(FBSServiceFacilityClient *)self sendMessage:v13 withType:a3 replyHandler:v14 waitForReply:v6 timeout:0.0];

    uint64_t v13 = v15;
  }
  else
  {
    [(FBSServiceFacilityClient *)self sendMessage:v13 withType:a3 replyHandler:0 waitForReply:v6 timeout:0.0];
  }
}

void __80__FBSSystemAppProxy__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 payload];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __80__FBSSystemAppProxy__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54__FBSSystemAppProxy_systemApplicationBundleIdentifier__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BSDeserializeStringFromXPCDictionaryWithKey();
  }
}

- (BOOL)isPasscodeLockedOrBlocked
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__FBSSystemAppProxy_isPasscodeLockedOrBlocked__block_invoke;
  v4[3] = &unk_1E58F7170;
  v4[4] = self;
  void v4[5] = &v5;
  [(FBSSystemAppProxy *)self _sendMessageType:1 withMessage:0 withReplyHandler:v4 waitForReply:1];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __46__FBSSystemAppProxy_isPasscodeLockedOrBlocked__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = xpc_dictionary_get_value(v3, "result-BOOL");
    BOOL v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E4F14570])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_BOOL_get_value(v6);
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  uint64_t v7 = FBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __46__FBSSystemAppProxy_isPasscodeLockedOrBlocked__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_9:
}

- (id)processHandleForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  id v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__FBSSystemAppProxy_processHandleForBundleID___block_invoke;
  v9[3] = &unk_1E58F5278;
  id v5 = v4;
  id v10 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__FBSSystemAppProxy_processHandleForBundleID___block_invoke_2;
  v8[3] = &unk_1E58F5310;
  v8[4] = &v11;
  [(FBSSystemAppProxy *)self _sendMessageType:2 withMessage:v9 withReplyHandler:v8 waitForReply:1];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __46__FBSSystemAppProxy_processHandleForBundleID___block_invoke()
{
}

void __46__FBSSystemAppProxy_processHandleForBundleID___block_invoke_2()
{
}

- (void)sendActions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__FBSSystemAppProxy_sendActions_withResult___block_invoke;
  v12[3] = &unk_1E58F5278;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__FBSSystemAppProxy_sendActions_withResult___block_invoke_2;
  v10[3] = &unk_1E58F52C8;
  void v10[4] = self;
  id v11 = v7;
  id v8 = v7;
  id v9 = v6;
  [(FBSSystemAppProxy *)self _sendMessageType:3 withMessage:v12 withReplyHandler:v10 waitForReply:0];
}

void __44__FBSSystemAppProxy_sendActions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    [*(id *)(a1 + 32) allObjects];
    objc_claimAutoreleasedReturnValue();
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
  }
}

void __44__FBSSystemAppProxy_sendActions_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (v3
    && (xpc_dictionary_get_value(v3, "result-int"),
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "result-int");
  }
  else
  {
    int64_t int64 = 0;
  }
  [*(id *)(a1 + 32) fireCompletion:*(void *)(a1 + 40) openAppErrorCode:int64];
}

- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = FBLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v29 = (id)objc_opt_class();
    __int16 v30 = 2114;
    id v31 = v12;
    id v16 = v29;
    _os_log_impl(&dword_19C680000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending request to terminate application %{public}@", buf, 0x16u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__FBSSystemAppProxy_terminateApplication_forReason_andReport_withDescription_completion___block_invoke;
  v23[3] = &unk_1E58F7198;
  id v25 = v13;
  int64_t v26 = a4;
  BOOL v27 = a5;
  id v24 = v12;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__FBSSystemAppProxy_terminateApplication_forReason_andReport_withDescription_completion___block_invoke_2;
  v20[3] = &unk_1E58F71C0;
  v20[4] = self;
  id v21 = v24;
  id v22 = v14;
  id v17 = v14;
  id v18 = v24;
  id v19 = v13;
  [(FBSSystemAppProxy *)self _sendMessageType:4 withMessage:v23 withReplyHandler:v20 waitForReply:0];
}

void __89__FBSSystemAppProxy_terminateApplication_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, "bundleID", (const char *)[*(id *)(a1 + 32) UTF8String]);
  xpc_dictionary_set_int64(xdict, "t-reason", *(void *)(a1 + 48));
  xpc_dictionary_set_BOOL(xdict, "t-report", *(unsigned char *)(a1 + 56));
  id v3 = *(void **)(a1 + 40);
  if (v3) {
    xpc_dictionary_set_string(xdict, "t-desc", (const char *)[v3 UTF8String]);
  }
}

uint64_t __89__FBSSystemAppProxy_terminateApplication_forReason_andReport_withDescription_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTerminationReply:a2 targetDescription:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = FBLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    id v16 = v15;
    id v17 = FBSApplicationTerminationGroupDescription(a3);
    *(_DWORD *)buf = 138543618;
    id v29 = v15;
    __int16 v30 = 2114;
    id v31 = v17;
    _os_log_impl(&dword_19C680000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending request to terminate %{public}@", buf, 0x16u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__FBSSystemAppProxy_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke;
  v23[3] = &unk_1E58F71E8;
  int64_t v25 = a3;
  int64_t v26 = a4;
  BOOL v27 = a5;
  id v24 = v12;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__FBSSystemAppProxy_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke_2;
  v20[3] = &unk_1E58F7210;
  id v21 = v13;
  int64_t v22 = a3;
  v20[4] = self;
  id v18 = v13;
  id v19 = v12;
  [(FBSSystemAppProxy *)self _sendMessageType:5 withMessage:v23 withReplyHandler:v20 waitForReply:0];
}

void __94__FBSSystemAppProxy_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, "t-group", *(void *)(a1 + 40));
  xpc_dictionary_set_int64(xdict, "t-reason", *(void *)(a1 + 48));
  xpc_dictionary_set_BOOL(xdict, "t-report", *(unsigned char *)(a1 + 56));
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    xpc_dictionary_set_string(xdict, "t-desc", (const char *)[v3 UTF8String]);
  }
}

void __94__FBSSystemAppProxy_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  FBSApplicationTerminationGroupDescription(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 _handleTerminationReply:v5 targetDescription:v6 withCompletion:a1[5]];
}

- (void)shutdownWithOptions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__FBSSystemAppProxy_shutdownWithOptions___block_invoke;
  v6[3] = &unk_1E58F5278;
  id v7 = v4;
  id v5 = v4;
  [(FBSSystemAppProxy *)self _sendMessageType:6 withMessage:v6 withReplyHandler:0 waitForReply:0];
}

void __41__FBSSystemAppProxy_shutdownWithOptions___block_invoke()
{
}

- (void)setKeyboardFocusApplication:(int)a3 deferringToken:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = FBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[FBSSystemAppProxy setKeyboardFocusApplication:deferringToken:completion:]();
  }

  if (v6)
  {
    id v8 = [(FBSSystemAppProxy *)self clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__FBSSystemAppProxy_setKeyboardFocusApplication_deferringToken_completion___block_invoke;
    block[3] = &unk_1E58F5040;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __75__FBSSystemAppProxy_setKeyboardFocusApplication_deferringToken_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleConnect:(id)a3
{
}

- (void)_handleTerminationReply:(id)a3 targetDescription:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = xpc_dictionary_get_value(v8, "result-int");
    id v12 = v11;
    if (v11)
    {
      int value = xpc_int64_get_value(v11);
      if (!value)
      {
        id v14 = 0;
        goto LABEL_8;
      }
    }
    else
    {
      int value = -1;
    }
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28798];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke;
    v27[3] = &unk_1E58F7238;
    id v28 = v9;
    id v29 = v8;
    int v30 = value;
    id v14 = [v17 bs_errorWithDomain:v18 code:value configuration:v27];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28798];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke_2;
    v24[3] = &unk_1E58F60A0;
    id v25 = v9;
    int64_t v26 = self;
    id v14 = [v15 bs_errorWithDomain:v16 code:64 configuration:v24];
    id v12 = v25;
  }
LABEL_8:

  if (v14)
  {
    id v19 = FBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FBSSystemAppProxy _handleTerminationReply:targetDescription:withCompletion:]((uint64_t)self, v14, v19);
    }
  }
  if (v10)
  {
    v20 = [(FBSSystemAppProxy *)self clientCallbackQueue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke_26;
    v21[3] = &unk_1E58F5450;
    id v23 = v10;
    id v22 = v14;
    dispatch_async(v20, v21);
  }
}

void __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [NSString stringWithFormat:@"The request to terminate \"%@\" failed.", *(void *)(a1 + 32)];
  [v4 setFailureDescription:v3];

  BSDeserializeStringFromXPCDictionaryWithKey();
}

void __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [NSString stringWithFormat:@"The request to terminate \"%@\" failed.", *(void *)(a1 + 32)];
  [v6 setFailureDescription:v3];

  id v4 = *(void **)(*(void *)(a1 + 40) + 96);
  if (v4)
  {
    id v5 = FBSProcessPrettyDescription(v4);
    [v6 setFailureReason:@"The system shell (%@) probably crashed.", v5];
  }
  else
  {
    [v6 setFailureReason:@"The system shell probably crashed."];
  }
  [v6 setCodeDescription:@"host down"];
}

uint64_t __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)handleMessage:(id)a3 withType:(int64_t)a4
{
  if (!a4) {
    [(FBSSystemAppProxy *)self _handleConnect:a3];
  }
}

- (id)clientCallbackQueue
{
  return +[FBSSystemService clientCallbackQueue];
}

- (void)fireCompletion:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(FBSSystemAppProxy *)self clientCallbackQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__FBSSystemAppProxy_fireCompletion_error___block_invoke;
    v9[3] = &unk_1E58F5450;
    id v11 = v6;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
}

uint64_t __42__FBSSystemAppProxy_fireCompletion_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)fireCompletion:(id)a3 openAppErrorCode:(int64_t)a4
{
  id v13 = a3;
  if (a4)
  {
    a4 = FBSOpenApplicationErrorCreate((void *)a4, 0, v6, v7, v8, v9, v10, v11, v12);
  }
  [(FBSSystemAppProxy *)self fireCompletion:v13 error:a4];
}

+ (void)checkoutProxyWithEndpoint:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"FBSSystemAppProxy.m";
  __int16 v16 = 1024;
  int v17 = 54;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

void __46__FBSSystemAppProxy_isPasscodeLockedOrBlocked__block_invoke_cold_1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_15(&dword_19C680000, v1, v2, "%{public}@: request to get passcode/blocked status timed out - assuming locked", v3, v4, v5, v6, 2u);
}

- (void)setKeyboardFocusApplication:deferringToken:completion:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_15(&dword_19C680000, v1, v2, "%{public}@: setKeyboardFocusApplication: is no longer supported", v3, v4, v5, v6, 2u);
}

- (void)_handleTerminationReply:(uint64_t)a1 targetDescription:(void *)a2 withCompletion:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v7 = [a2 descriptionWithMultilinePrefix:0];
  int v8 = 138543618;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_19C680000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Error reported for termination request: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end