@interface CADXPCProxyHelper
- (BOOL)_shouldResendInitializationOptionsForInvocation:(id)a3;
- (BOOL)_validateCADObjectIDsInInvocationArguments:(id)a3;
- (CADDatabaseInitializationOptions)initializationOptions;
- (CADXPCProxyHelper)initWithXPCConnection:(id)a3 protocol:(id)a4 synchronous:(BOOL)a5;
- (CADXPCProxyHelperDelegate)delegate;
- (id)_replaceReplyBlockInInvocation:(id)a3 retryingAfterInitializationWithContextHolder:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_callReplyHandler:(id)a3 ofInvocation:(id)a4 withErrorCode:(int64_t)a5;
- (void)_tryInvokeWithGenerationValidation:(id)a3 target:(id)a4 replyBlock:(id)a5 contextHolder:(id)a6;
- (void)forwardInvocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitializationOptions:(id)a3;
@end

@implementation CADXPCProxyHelper

- (void)setInitializationOptions:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CADXPCProxyHelper;
  v5 = -[CADXPCProxyHelper methodSignatureForSelector:](&v14, sel_methodSignatureForSelector_);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_7:
    v12 = v7;
    goto LABEL_8;
  }
  protocol = self->_protocol;
  if (protocol)
  {
    objc_method_description MethodDescription = protocol_getMethodDescription(protocol, a3, 1, 1);
    types = MethodDescription.types;
    if (MethodDescription.name
      || (objc_method_description v11 = protocol_getMethodDescription(self->_protocol, a3, 0, 1), types = v11.types, v11.name))
    {
      id v7 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
      goto LABEL_7;
    }
  }
  v12 = 0;
LABEL_8:

  return v12;
}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v25 = 0;
  [v3 getArgument:&v25 atIndex:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v4 + 24) || v25 != 1019)
  {
    [*(id *)(a1 + 32) clear];
    [v3 setTarget:*(void *)(a1 + 48)];
    [v3 invoke];
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_3;
    v20[3] = &unk_1E624E878;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    id v21 = v5;
    uint64_t v22 = v6;
    id v23 = v7;
    id v24 = *(id *)(a1 + 56);
    v8 = (void *)MEMORY[0x1C1867AB0](v20);
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = *(void **)(v9 + 8);
    if (*(unsigned char *)(v9 + 24)) {
      [v10 synchronousRemoteObjectProxyWithErrorHandler:v8];
    }
    else {
    objc_method_description v11 = [v10 remoteObjectProxyWithErrorHandler:v8];
    }
    v12 = [*(id *)(a1 + 40) initializationOptions];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_22;
    v15[3] = &unk_1E624E8A0;
    int8x16_t v14 = *(int8x16_t *)(a1 + 32);
    id v13 = (id)v14.i64[0];
    int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
    id v17 = v3;
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    [v11 CADDatabaseSetInitializationOptions:v12 reply:v15];
  }
}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 setDatabaseRestoreGeneration:a3];

  uint64_t v6 = [*(id *)(a1 + 40) proxy];
  if (v6)
  {
    [*(id *)(a1 + 32) _tryInvokeWithGenerationValidation:*(void *)(a1 + 64) target:v6 replyBlock:*(void *)(a1 + 56) contextHolder:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = getCADXPCProxyHelperLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_3(v7);
    }

    [*(id *)(a1 + 40) clear];
    [*(id *)(a1 + 48) setTarget:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) invoke];
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[MEMORY[0x1E4F57788] copyReplyBlockFromInvocation:v4];
  if (self->_connection)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    int v21 = 1;
    uint64_t v6 = objc_opt_new();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__CADXPCProxyHelper_forwardInvocation___block_invoke;
    v14[3] = &unk_1E624E828;
    id v7 = v5;
    id v15 = v7;
    id v19 = v20;
    id v8 = v6;
    id v16 = v8;
    id v17 = self;
    id v9 = v4;
    id v18 = v9;
    v10 = (void *)MEMORY[0x1C1867AB0](v14);
    connection = self->_connection;
    if (self->_synchronous) {
      [(CADXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
    }
    else {
    v12 = [(CADXPCConnection *)connection remoteObjectProxyWithErrorHandler:v10];
    }
    if (v12)
    {
      id v13 = [(CADXPCProxyHelper *)self _replaceReplyBlockInInvocation:v9 retryingAfterInitializationWithContextHolder:v8];
      if (v13) {
        [v8 retainProxy:v12 andArgumentsInInvocation:v9];
      }
      [(CADXPCProxyHelper *)self _tryInvokeWithGenerationValidation:v9 target:v12 replyBlock:v7 contextHolder:v8];
    }
    _Block_object_dispose(v20, 8);
  }
  else
  {
    [(CADXPCProxyHelper *)self _callReplyHandler:v5 ofInvocation:v4 withErrorCode:1021];
  }
}

- (void)_tryInvokeWithGenerationValidation:(id)a3 target:(id)a4 replyBlock:(id)a5 contextHolder:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11
    && ![(CADXPCProxyHelper *)self _validateCADObjectIDsInInvocationArguments:v13])
  {
    [v12 clear];
    [(CADXPCProxyHelper *)self _callReplyHandler:v11 ofInvocation:v13 withErrorCode:1010];
  }
  else
  {
    [v13 invokeWithTarget:v10];
  }
}

- (BOOL)_validateCADObjectIDsInInvocationArguments:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CADXPCProxyHelper *)self delegate];
  if (![v5 shouldValidateObjectIDs]
    || (int v6 = [v5 databaseRestoreGeneration], v6 == -1))
  {
    BOOL v15 = 1;
    goto LABEL_23;
  }
  int v7 = v6;
  id v8 = [v4 methodSignature];
  if (![v8 numberOfArguments])
  {
LABEL_20:
    BOOL v15 = 1;
    goto LABEL_21;
  }
  uint64_t v9 = 0;
  unint64_t v10 = 0x1E4F1C000uLL;
  int v25 = v7;
  while (1)
  {
    id v11 = v8;
    if (strcmp((const char *)[v11 getArgumentTypeAtIndex:v9], "@")) {
      goto LABEL_19;
    }
    id v26 = 0;
    [v4 getArgument:&v26 atIndex:v9];
    if (!v26) {
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v26;
      if ([v12 restoreGeneration] != -1
        && [v12 restoreGeneration] != v7)
      {
        id v17 = getCADXPCProxyHelperLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          Name = sel_getName((SEL)[v4 selector]);
          int v21 = [v12 restoreGeneration];
          *(_DWORD *)buf = 136447234;
          v28 = Name;
          __int16 v29 = 1024;
          int v30 = v9;
          __int16 v31 = 2112;
          v32 = v12;
          __int16 v33 = 1024;
          int v34 = v21;
          __int16 v35 = 1024;
          int v36 = v7;
          _os_log_debug_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_DEBUG, "Found CADObjectID argument with unexpected restore generation in call to selector %{public}s. index = %d, objectID = %@, generation = %d, expected = %d", buf, 0x28u);
        }
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_19:
    if (++v9 == [v11 numberOfArguments]) {
      goto LABEL_20;
    }
  }
  unint64_t v13 = v10;
  id v12 = v26;
  int8x16_t v14 = [v12 firstObject];
  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_17:

    unint64_t v10 = v13;
    int v7 = v25;
LABEL_18:

    goto LABEL_19;
  }
  id v24 = v14;
  if ([v24 restoreGeneration] == -1
    || [v24 restoreGeneration] == v25)
  {

    goto LABEL_17;
  }
  id v19 = getCADXPCProxyHelperLogHandle();
  id v17 = v24;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = sel_getName((SEL)[v4 selector]);
    int v23 = [v24 restoreGeneration];
    *(_DWORD *)buf = 136447234;
    v28 = v22;
    __int16 v29 = 1024;
    int v30 = v9;
    __int16 v31 = 2112;
    v32 = v24;
    __int16 v33 = 1024;
    int v34 = v23;
    __int16 v35 = 1024;
    int v36 = v25;
    _os_log_debug_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_DEBUG, "Found CADObjectID in array argument with unexpected restore generation in call to selector %{public}s. index = %d, objectID = %@, generation = %d, expected = %d", buf, 0x28u);
  }

LABEL_26:
  BOOL v15 = 0;
LABEL_21:

LABEL_23:
  return v15;
}

- (CADXPCProxyHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CADXPCProxyHelperDelegate *)WeakRetained;
}

- (id)_replaceReplyBlockInInvocation:(id)a3 retryingAfterInitializationWithContextHolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F57788] replyBlockArgumentIndex:v6];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = v8;
  id v11 = (void *)[MEMORY[0x1E4F57788] copyReplyBlockFromInvocation:v6];
  id v12 = _Block_signature(v11);
  if (!v12 || !*v12) {
    goto LABEL_8;
  }
  unint64_t v13 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:v12];
  if ((unint64_t)[v13 numberOfArguments] <= 1)
  {

LABEL_8:
    id v16 = getCADXPCProxyHelperLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[CADXPCProxyHelper _replaceReplyBlockInInvocation:retryingAfterInitializationWithContextHolder:](v6, v16);
    }

    id v9 = 0;
    goto LABEL_11;
  }
  id v14 = v13;
  int v15 = strcmp((const char *)[v14 getArgumentTypeAtIndex:1], "i");

  if (v15) {
    goto LABEL_8;
  }
  if ([(CADXPCProxyHelper *)self _shouldResendInitializationOptionsForInvocation:v6])
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_2;
    int v21 = &unk_1E624E8C8;
    id v22 = v7;
    id v23 = v11;
    id v24 = v6;
    id v33 = (id)__NSMakeSpecialForwardingCaptureBlock();

    _Block_object_dispose(v25, 8);
  }
  else
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    __int16 v29 = __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke;
    int v30 = &unk_1E624E850;
    id v31 = v7;
    id v32 = v11;
    id v33 = (id)__NSMakeSpecialForwardingCaptureBlock();
  }
  objc_msgSend(v6, "setArgument:atIndex:", &v33, v10, v18, v19, v20, v21);
  id v9 = v33;

LABEL_11:
LABEL_12:

  return v9;
}

- (BOOL)_shouldResendInitializationOptionsForInvocation:(id)a3
{
  return [a3 selector] != (void)sel_CADDatabaseSetInitializationOptions_reply_;
}

- (CADDatabaseInitializationOptions)initializationOptions
{
  return (CADDatabaseInitializationOptions *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initializationOptions, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (CADXPCProxyHelper)initWithXPCConnection:(id)a3 protocol:(id)a4 synchronous:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CADXPCProxyHelper;
  id v11 = [(CADXPCProxyHelper *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_protocol, a4);
    v12->_synchronous = a5;
  }

  return v12;
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    if ([v3 code] == 4097)
    {
      id v5 = (void *)*MEMORY[0x1E4F281F8];
      id v6 = [v4 domain];
      LODWORD(v5) = [v5 isEqualToString:v6];

      if (v5)
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= 1)
        {
          id v7 = getCADXPCProxyHelperLogHandle();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_4(v7);
          }

          --*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          uint64_t v8 = [*(id *)(a1 + 40) proxy];
          if (v8)
          {
            id v9 = (void *)v8;
            [*(id *)(a1 + 48) _tryInvokeWithGenerationValidation:*(void *)(a1 + 56) target:v8 replyBlock:*(void *)(a1 + 32) contextHolder:*(void *)(a1 + 40)];

            goto LABEL_18;
          }
          id v11 = getCADXPCProxyHelperLogHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_3(v11);
          }
        }
      }
    }
    id v12 = getCADXPCProxyHelperLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_2();
    }

    [*(id *)(a1 + 40) clear];
    objc_msgSend(*(id *)(a1 + 48), "_callReplyHandler:ofInvocation:withErrorCode:", *(void *)(a1 + 32), *(void *)(a1 + 56), objc_msgSend(v4, "code"));
  }
  else
  {
    id v10 = getCADXPCProxyHelperLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_1();
    }
  }
LABEL_18:
}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 clear];
  [v4 setTarget:*(void *)(a1 + 40)];
  [v4 invoke];
}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = getCADXPCProxyHelperLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_3_cold_1();
  }

  [*(id *)(a1 + 32) clear];
  objc_msgSend(*(id *)(a1 + 40), "_callReplyHandler:ofInvocation:withErrorCode:", *(void *)(a1 + 48), *(void *)(a1 + 56), objc_msgSend(v3, "code"));
}

- (void)_callReplyHandler:(id)a3 ofInvocation:(id)a4 withErrorCode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__CADXPCProxyHelper__callReplyHandler_ofInvocation_withErrorCode___block_invoke;
  v14[3] = &unk_1E624E558;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  int64_t v17 = a5;
  uint64_t v12 = MEMORY[0x1C1867AB0](v14);
  unint64_t v13 = (void *)v12;
  if (self->_synchronous)
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
  else
  {
    if (_callReplyHandler_ofInvocation_withErrorCode__onceToken != -1) {
      dispatch_once(&_callReplyHandler_ofInvocation_withErrorCode__onceToken, &__block_literal_global_12);
    }
    dispatch_async((dispatch_queue_t)_callReplyHandler_ofInvocation_withErrorCode__asyncQueue, v13);
  }
}

uint64_t __66__CADXPCProxyHelper__callReplyHandler_ofInvocation_withErrorCode___block_invoke(void *a1)
{
  return [MEMORY[0x1E4F57788] callReplyHandler:a1[4] ofInvocation:a1[5] withErrorCode:a1[6]];
}

void __66__CADXPCProxyHelper__callReplyHandler_ofInvocation_withErrorCode___block_invoke_2()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("EventKitXPCErrorReplyQueue", v2);
  v1 = (void *)_callReplyHandler_ofInvocation_withErrorCode__asyncQueue;
  _callReplyHandler_ofInvocation_withErrorCode__asyncQueue = (uint64_t)v0;
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BBC88000, v0, v1, "Received error from calaccessd connection, but there's no pending reply block.\n%@", v2, v3, v4, v5, v6);
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BBC88000, v0, v1, "Received error from calaccessd connection: %@. Attempting to call any reply handler.", v2, v3, v4, v5, v6);
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BBC88000, log, OS_LOG_TYPE_ERROR, "Proxy unexpectedly deallocated; unable to resend message.",
    v1,
    2u);
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1BBC88000, log, OS_LOG_TYPE_DEBUG, "Received NSXPCConnectionInterrupted from calaccessd connection. Attempting to resend message.", v1, 2u);
}

- (void)_replaceReplyBlockInInvocation:(void *)a1 retryingAfterInitializationWithContextHolder:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector((SEL)[a1 selector]);
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1BBC88000, a2, OS_LOG_TYPE_DEBUG, "Reply block does not have take an error as its first argument in method: %@", v4, 0xCu);
}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BBC88000, v0, v1, "Received error from calaccessd connection while trying to resend initialization options: %@. Attempting to call any reply handler.", v2, v3, v4, v5, v6);
}

@end