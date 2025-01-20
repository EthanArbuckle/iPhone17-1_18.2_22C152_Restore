@interface CoreTelephonyClientRemoteAsyncProxy
- (CoreTelephonyClientRemoteAsyncProxy)initWithXPCObject:(id)a3 userQueue:(queue)a4 errorHandler:(id)a5;
- (id).cxx_construct;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation CoreTelephonyClientRemoteAsyncProxy

uint64_t __57__CoreTelephonyClientRemoteAsyncProxy_forwardInvocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithTarget:*(void *)(a1 + 40)];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(CTXPCServiceInterface *)self->_target methodSignatureForSelector:a3];
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

void __57__CoreTelephonyClientRemoteAsyncProxy_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 retainArguments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CoreTelephonyClientRemoteAsyncProxy_forwardInvocation___block_invoke_2;
  v6[3] = &unk_1E5263048;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  v4 = *(NSObject **)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 methodSignature];
  unint64_t v6 = [v5 numberOfArguments];
  if (v6 < 3) {
    goto LABEL_7;
  }
  uint64_t v7 = 0;
  unint64_t v8 = v6 - 2;
  while (strcmp((const char *)[v5 getArgumentTypeAtIndex:v7 + 2], "@?"))
  {
    if (v8 == ++v7) {
      goto LABEL_7;
    }
  }
  if (v7 == 0x7FFFFFFFFFFFFFFDLL)
  {
LABEL_7:
    v9 = CTLogClient();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = NSStringFromSelector((SEL)[v4 selector]);
      [(CoreTelephonyClientRemoteAsyncProxy *)v10 forwardInvocation:v9];
    }
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = v7 + 2;
  }
  aBlock = 0;
  [v4 getArgument:&aBlock atIndex:v11];
  _Block_signature(aBlock);
  v12 = (void *)[aBlock copy];
  fObj = self->_userQueue.fObj.fObj;
  if (fObj) {
    dispatch_retain((dispatch_object_t)self->_userQueue.fObj.fObj);
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  if (fObj) {
    dispatch_retain(fObj);
  }
  id v14 = v12;
  id v16 = (id)__NSMakeSpecialForwardingCaptureBlock();
  objc_msgSend(v4, "setArgument:atIndex:", &v16, v11, v15, 3321888768, __57__CoreTelephonyClientRemoteAsyncProxy_forwardInvocation___block_invoke, &unk_1ECFD3D38);
  [v4 invokeWithTarget:self->_target];

  if (fObj)
  {
    dispatch_release(fObj);
    dispatch_release(fObj);
  }
}

- (CoreTelephonyClientRemoteAsyncProxy)initWithXPCObject:(id)a3 userQueue:(queue)a4 errorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x18531FC50]();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3321888768;
  v18[2] = __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke;
  v18[3] = &unk_1ECFD3D00;
  uint64_t v11 = *(NSObject **)a4.fObj.fObj;
  dispatch_object_t object = v11;
  if (v11) {
    dispatch_retain(v11);
  }
  id v12 = v9;
  id v19 = v12;
  v13 = [v8 remoteObjectProxyWithErrorHandler:v18];
  target = self->_target;
  self->_target = v13;

  if (object) {
    dispatch_release(object);
  }
  uint64_t v15 = *(dispatch_object_s **)a4.fObj.fObj;
  *(void *)a4.fObj.fObj = 0;
  fObj = self->_userQueue.fObj.fObj;
  self->_userQueue.fObj.fObj = v15;
  if (fObj) {
    dispatch_release(fObj);
  }

  return self;
}

- (void).cxx_destruct
{
  fObj = self->_userQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }

  objc_storeStrong((id *)&self->_target, 0);
}

void __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CTLogClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke_1;
  v8[3] = &unk_1E52629A0;
  id v5 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v5;
  unint64_t v6 = *(NSObject **)(a1 + 40);
  id v7 = v3;
  dispatch_async(v6, v8);
}

uint64_t __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "Remote object proxy returned error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)forwardInvocation:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_18444A000, log, OS_LOG_TYPE_FAULT, "CoreTelephonyClientRemoteAsyncProxy: Unable to find REQUIRED reply block for selector %@.", buf, 0xCu);
}

@end