@interface ASDDiagnosticService
+ (id)defaultService;
+ (id)interface;
- (BOOL)pingWithError:(id *)a3;
- (BOOL)sendCommand:(int64_t)a3 withError:(id *)a4;
- (id)_asynchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)activeClientsWithError:(id *)a3;
- (id)sendDetailsCommand:(int64_t)a3 timeout:(id)a4 withError:(id *)a5;
- (id)sendDetailsCommand:(int64_t)a3 withError:(id *)a4;
- (void)addSubscriberWithEndpoint:(id)a3;
@end

@implementation ASDDiagnosticService

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C518];
}

+ (id)defaultService
{
  if (qword_1EB4D65B8 != -1) {
    dispatch_once(&qword_1EB4D65B8, &__block_literal_global_20);
  }
  v2 = (void *)_MergedGlobals_47;
  return v2;
}

void __38__ASDDiagnosticService_defaultService__block_invoke()
{
  v0 = [ASDDiagnosticService alloc];
  v1 = +[ASDServiceBroker defaultBroker];
  id v4 = v1;
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)ASDDiagnosticService;
    v2 = (ASDDiagnosticService *)objc_msgSendSuper2(&v5, sel_init);
    v0 = v2;
    if (v2) {
      objc_storeStrong((id *)&v2->_serviceBroker, v1);
    }
  }

  v3 = (void *)_MergedGlobals_47;
  _MergedGlobals_47 = (uint64_t)v0;
}

- (id)activeClientsWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__ASDDiagnosticService_activeClientsWithError___block_invoke;
  v15[3] = &unk_1E58B3108;
  v15[4] = &v16;
  id v4 = [(ASDDiagnosticService *)self _synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__ASDDiagnosticService_activeClientsWithError___block_invoke_2;
  v8[3] = &unk_1E58B4720;
  v8[4] = &v9;
  [v4 activeClientsWithReplyHandler:v8];
  if (a3)
  {
    objc_super v5 = (void *)v17[5];
    if (v5) {
      *a3 = v5;
    }
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __47__ASDDiagnosticService_activeClientsWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __47__ASDDiagnosticService_activeClientsWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)addSubscriberWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDDiagnosticService *)self _synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_18];
  [v5 addSubscriberWithEndpoint:v4];
}

void __50__ASDDiagnosticService_addSubscriberWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[DiagnosticService] Adding subscriber failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)pingWithError:(id *)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  uint64_t v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__ASDDiagnosticService_pingWithError___block_invoke;
  v13[3] = &unk_1E58B3108;
  v13[4] = &v14;
  int v4 = [(ASDDiagnosticService *)self _synchronousRemoteObjectProxyWithErrorHandler:v13];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__ASDDiagnosticService_pingWithError___block_invoke_2;
  v8[3] = &unk_1E58B3000;
  v8[4] = &v9;
  [v4 pingWithReplyHandler:v8];
  if (a3)
  {
    id v5 = (void *)v15[5];
    if (v5) {
      *a3 = v5;
    }
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __38__ASDDiagnosticService_pingWithError___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __38__ASDDiagnosticService_pingWithError___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)sendCommand:(int64_t)a3 withError:(id *)a4
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__ASDDiagnosticService_sendCommand_withError___block_invoke;
  v15[3] = &unk_1E58B3108;
  v15[4] = &v16;
  char v6 = [(ASDDiagnosticService *)self _synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__ASDDiagnosticService_sendCommand_withError___block_invoke_2;
  v10[3] = &unk_1E58B3000;
  v10[4] = &v11;
  [v6 sendCommandWithReplyHandler:a3 handler:v10];
  int v7 = *((unsigned __int8 *)v12 + 24);
  if (a4 && !*((unsigned char *)v12 + 24))
  {
    *a4 = (id) v17[5];
    int v7 = *((unsigned __int8 *)v12 + 24);
  }
  BOOL v8 = v7 != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __46__ASDDiagnosticService_sendCommand_withError___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __46__ASDDiagnosticService_sendCommand_withError___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)sendDetailsCommand:(int64_t)a3 withError:(id *)a4
{
  return [(ASDDiagnosticService *)self sendDetailsCommand:a3 timeout:&unk_1EEC56508 withError:a4];
}

- (id)sendDetailsCommand:(int64_t)a3 timeout:(id)a4 withError:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__10;
  v34 = __Block_byref_object_dispose__10;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __61__ASDDiagnosticService_sendDetailsCommand_timeout_withError___block_invoke;
  v29[3] = &unk_1E58B3108;
  v29[4] = &v30;
  v10 = [(ASDDiagnosticService *)self _asynchronousRemoteObjectProxyWithErrorHandler:v29];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__10;
  v27 = __Block_byref_object_dispose__10;
  id v28 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__ASDDiagnosticService_sendDetailsCommand_timeout_withError___block_invoke_2;
  v20[3] = &unk_1E58B4748;
  v22 = &v23;
  uint64_t v11 = v9;
  id v21 = v11;
  [v10 sendCommandWithDetailedReplyHandler:a3 handler:v20];
  if ((int)[v8 intValue] < 1)
  {
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  dispatch_time_t v12 = dispatch_time(0, 1000000000 * [v8 integerValue]);
  if (dispatch_semaphore_wait(v11, v12))
  {
    uint64_t v13 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v37 = v18;
      __int16 v38 = 2048;
      int64_t v39 = a3;
      id v19 = v18;
      _os_log_error_impl(&dword_19BF6A000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: Timed out attempting to diagnostic command %ld", buf, 0x16u);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.asclient.diagnostics" code:515 userInfo:&unk_1EEC56548];
    v15 = (void *)v31[5];
    v31[5] = v14;
  }
  if (a5) {
LABEL_9:
  }
    *a5 = (id) v31[5];
LABEL_10:
  id v16 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v30, 8);

  return v16;
}

void __61__ASDDiagnosticService_sendDetailsCommand_timeout_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __61__ASDDiagnosticService_sendDetailsCommand_timeout_withError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_asynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  serviceBroker = self->_serviceBroker;
  id v9 = 0;
  id v4 = (void (**)(id, id))a3;
  id v5 = [(ASDServiceBroker *)serviceBroker getDiagnosticServiceWithError:&v9];
  id v6 = v9;
  if (v5)
  {
    int v7 = [v5 remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v4[2](v4, v6);
    int v7 = 0;
  }

  return v7;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  serviceBroker = self->_serviceBroker;
  id v9 = 0;
  id v4 = (void (**)(id, id))a3;
  id v5 = [(ASDServiceBroker *)serviceBroker getDiagnosticServiceWithError:&v9];
  id v6 = v9;
  if (v5)
  {
    int v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v4[2](v4, v6);
    int v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end