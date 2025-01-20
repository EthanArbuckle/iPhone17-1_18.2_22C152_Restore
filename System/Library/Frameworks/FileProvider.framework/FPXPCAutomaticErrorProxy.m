@interface FPXPCAutomaticErrorProxy
+ (BOOL)sanitizeErrors;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)sanitizeErrors;
- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7;
- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8;
- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8 requestDidBegin:(id)a9;
- (FPXPCAutomaticErrorProxy)initWithRemoteObjectProxy:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8 requestDidBegin:(id)a9;
- (id)_requestWillBegin:(SEL)a3 requestID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxy;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (int)requestEffectivePid;
- (unint64_t)timeoutState;
- (void)_requestDidBegin:(SEL)a3 progress:(id)a4 requestID:(id)a5;
- (void)_requestDidFinish:(id)a3 requestDidFinishBlock:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)setRequestEffectivePid:(int)a3;
- (void)setSanitizeErrors:(BOOL)a3;
- (void)setTimeoutState:(unint64_t)a3;
@end

@implementation FPXPCAutomaticErrorProxy

- (int)requestEffectivePid
{
  return self->_pid;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_target);
  objc_storeStrong((id *)(v4 + 16), self->_protocol);
  objc_storeStrong((id *)(v4 + 24), self->_error);
  objc_storeStrong((id *)(v4 + 48), self->_name);
  *(_DWORD *)(v4 + 84) = self->_pid;
  uint64_t v5 = [self->_requestWillBeginBlock copy];
  v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v5;

  uint64_t v7 = [self->_requestDidBeginBlock copy];
  v8 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v7;

  *(unsigned char *)(v4 + 64) = self->_isSynchronous;
  *(unsigned char *)(v4 + 80) = self->_sanitizeErrors;
  return (id)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retainSelfWhileMessageIsPending, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_requestDidBeginBlock, 0);
  objc_storeStrong(&self->_requestWillBeginBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  target = self->_target;
  if (target) {
    [(NSXPCProxyCreating *)target methodSignatureForSelector:a3];
  }
  else {
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", protocol_getMethodDescription((Protocol *)self[16], a3, 1, 1).types);
  }

  return v5;
}

- (unint64_t)timeoutState
{
  return self->_timeoutState;
}

- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = [a3 remoteObjectProxy];
  v19 = [(FPXPCAutomaticErrorProxy *)self initWithRemoteObjectProxy:v18 protocol:v17 orError:v16 name:v15 requestPid:v8 requestWillBegin:v14 requestDidBegin:0];

  return v19;
}

- (void)setSanitizeErrors:(BOOL)a3
{
  self->_sanitizeErrors = a3;
}

- (id)synchronousRemoteObjectProxy
{
  if (self->_isSynchronous)
  {
    v2 = self;
  }
  else
  {
    v2 = (FPXPCAutomaticErrorProxy *)[(FPXPCAutomaticErrorProxy *)self copy];
    v2->_isSynchronous = 1;
  }

  return v2;
}

- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8 requestDidBegin:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = [a3 remoteObjectProxy];
  v22 = [(FPXPCAutomaticErrorProxy *)self initWithRemoteObjectProxy:v21 protocol:v20 orError:v19 name:v18 requestPid:v10 requestWillBegin:v17 requestDidBegin:v16];

  return v22;
}

- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [a3 remoteObjectProxy];
  id v16 = [(FPXPCAutomaticErrorProxy *)self initWithRemoteObjectProxy:v15 protocol:v14 orError:v13 name:v12 requestPid:v7 requestWillBegin:0 requestDidBegin:0];

  return v16;
}

void __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_cold_1(&v9, a1, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  int v6 = [WeakRetained sanitizeErrors];

  if (v6) {
    objc_msgSend(v3, "fp_sanitizeError");
  }
  uint64_t v7 = (void *)MEMORY[0x1A6248B00](*(void *)(a1 + 56));
  [v3 setTarget:v7];

  [v3 invoke];
  if (!*(unsigned char *)(a1 + 88))
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 72));
    [v8 _requestDidFinish:*(void *)(a1 + 48) requestDidFinishBlock:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  __fp_leave_section_Debug((uint64_t)&v9);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34 = [v4 methodSignature];
  uint64_t v5 = objc_msgSend(v34, "fp_indexOfLastArgumentWithType:", "@?");
  int v6 = NSNumber;
  atomic_fetch_add_explicit(&_requestIDCounter, 1uLL, memory_order_relaxed);
  v35 = objc_msgSend(v6, "numberWithUnsignedLongLong:");
  id v55 = 0;
  BOOL v7 = self->_pid == 0;
  section = (void *)__fp_create_section();
  uint64_t v9 = fp_current_or_default_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v10)
    {
      v32 = NSStringFromSelector((SEL)[v4 selector]);
      name = self->_name;
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = section;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      v58 = (uint64_t (*)(uint64_t, uint64_t))name;
      _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx sending %{public}@ to %@", buf, 0x20u);
    }
  }
  else if (v10)
  {
    v11 = NSStringFromSelector((SEL)[v4 selector]);
    id v12 = self->_name;
    id v13 = FPExecutableNameForProcessIdentifier();
    int pid = self->_pid;
    *(_DWORD *)buf = 134219010;
    *(void *)&buf[4] = section;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v58 = (uint64_t (*)(uint64_t, uint64_t))v12;
    LOWORD(v59) = 2112;
    *(void *)((char *)&v59 + 2) = v13;
    WORD5(v59) = 1024;
    HIDWORD(v59) = pid;
    _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx sending %{public}@ to %@ on behalf of %@[%d]", buf, 0x30u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__25;
  *(void *)&long long v59 = __Block_byref_object_dispose__25;
  *((void *)&v59 + 1) = 0;
  *((void *)&v59 + 1) = -[FPXPCAutomaticErrorProxy _requestWillBegin:requestID:](self, "_requestWillBegin:requestID:", [v4 selector], v35);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = 0;
  }
  else
  {
    *(void *)v56 = 0;
    [v4 getArgument:v56 atIndex:v5];
    id v15 = (void *)MEMORY[0x1A6248B00](*(void *)v56);
    id v16 = _Block_signature(v15);
    id v17 = self->_name;
    id v18 = NSStringFromSelector((SEL)[v4 selector]);
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    v45 = __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke;
    v46 = &unk_1E5AF53E0;
    v52[1] = section;
    v47 = v17;
    id v48 = v18;
    objc_copyWeak(v52, &location);
    id v50 = v15;
    BOOL v53 = v5 == 0x7FFFFFFFFFFFFFFFLL;
    id v49 = v35;
    v51 = buf;
    id v19 = (void *)__NSMakeSpecialForwardingCaptureBlock();
    id v20 = v55;
    id v55 = v19;

    [v4 _addAttachedObject:v55];
    [v4 _addAttachedObject:self];
    [v4 setArgument:&v55 atIndex:v5];

    objc_destroyWeak(v52);
    objc_destroyWeak(&location);
  }
  int v21 = self->_pid;
  id location = 0;
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_12;
  v37[3] = &unk_1E5AF5408;
  v37[4] = self;
  id v22 = v4;
  BOOL v42 = v5 != 0x7FFFFFFFFFFFFFFFLL;
  id v38 = v22;
  v40 = v16;
  id v39 = v55;
  int v41 = v21;
  v23 = (void (**)(void, void))MEMORY[0x1A6248B00](v37);
  target = self->_target;
  if (target)
  {
    if (self->_isSynchronous) {
      [(NSXPCProxyCreating *)target synchronousRemoteObjectProxyWithErrorHandler:v23];
    }
    else {
    v25 = [(NSXPCProxyCreating *)target remoteObjectProxyWithErrorHandler:v23];
    }
    [v25 forwardInvocation:v22];
    id v26 = [v22 methodSignature];
    v27 = (const char *)[v26 methodReturnType];

    if (!strcmp(v27, "@"))
    {
      id v36 = 0;
      [v22 getReturnValue:&v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v36;
        goto LABEL_21;
      }
      v29 = fp_current_or_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_opt_class();
        *(_DWORD *)v56 = 138412290;
        *(void *)&v56[4] = v30;
        id v31 = v30;
        _os_log_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Unexpected return type from XPC call: %@", v56, 0xCu);
      }
    }
  }
  else
  {
    ((void (**)(void, NSError *))v23)[2](v23, self->_error);
    v25 = 0;
  }
  id v28 = 0;
LABEL_21:
  -[FPXPCAutomaticErrorProxy _requestDidBegin:progress:requestID:](self, "_requestDidBegin:progress:requestID:", [v22 selector], v28, v35);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    [(FPXPCAutomaticErrorProxy *)self _requestDidFinish:v35 requestDidFinishBlock:*(void *)(*(void *)&buf[8] + 40)];
  }

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

- (id)_requestWillBegin:(SEL)a3 requestID:(id)a4
{
  id v6 = a4;
  requestWillBeginBlock = (void (**)(id, FPXPCAutomaticErrorProxy *, SEL, id))self->_requestWillBeginBlock;
  if (requestWillBeginBlock)
  {
    id v8 = requestWillBeginBlock[2](requestWillBeginBlock, self, a3, v6);
    uint64_t v9 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)&self->_retainCounter, 1uLL)) {
    objc_storeStrong(&self->_retainSelfWhileMessageIsPending, self);
  }
  BOOL v10 = (void *)MEMORY[0x1A6248B00](v9);

  return v10;
}

- (void)_requestDidBegin:(SEL)a3 progress:(id)a4 requestID:(id)a5
{
  requestDidBeginBlock = (void (**)(id, FPXPCAutomaticErrorProxy *, SEL, id, id))self->_requestDidBeginBlock;
  if (requestDidBeginBlock) {
    requestDidBeginBlock[2](requestDidBeginBlock, self, a3, a5, a4);
  }
}

- (FPXPCAutomaticErrorProxy)initWithRemoteObjectProxy:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8 requestDidBegin:(id)a9
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)FPXPCAutomaticErrorProxy;
  id v20 = [(FPXPCAutomaticErrorProxy *)&v35 init];
  int v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_target, a3);
    objc_storeStrong((id *)&v21->_protocol, a4);
    if (v16)
    {
      id v22 = (NSError *)v16;
      error = v21->_error;
      v21->_error = v22;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F281F8];
      uint64_t v36 = *MEMORY[0x1E4F28228];
      v37[0] = @"FPXPCAutomaticErrorProxy started out with invalid object";
      error = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      uint64_t v26 = [v24 errorWithDomain:v25 code:4099 userInfo:error];
      v27 = v21->_error;
      v21->_error = (NSError *)v26;
    }
    objc_storeStrong((id *)&v21->_name, a6);
    v21->_int pid = a7;
    uint64_t v28 = [v18 copy];
    id requestWillBeginBlock = v21->_requestWillBeginBlock;
    v21->_id requestWillBeginBlock = (id)v28;

    uint64_t v30 = [v19 copy];
    id requestDidBeginBlock = v21->_requestDidBeginBlock;
    v21->_id requestDidBeginBlock = (id)v30;

    v21->_sanitizeErrors = [(id)objc_opt_class() sanitizeErrors];
  }

  return v21;
}

+ (BOOL)sanitizeErrors
{
  return 1;
}

- (BOOL)sanitizeErrors
{
  return self->_sanitizeErrors;
}

- (void)_requestDidFinish:(id)a3 requestDidFinishBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v6) {
    (*((void (**)(id, FPXPCAutomaticErrorProxy *, id))v6 + 2))(v6, self, v9);
  }
  if (atomic_fetch_add((atomic_ullong *volatile)&self->_retainCounter, 0xFFFFFFFFFFFFFFFFLL) == 1)
  {
    id retainSelfWhileMessageIsPending = self->_retainSelfWhileMessageIsPending;
    self->_id retainSelfWhileMessageIsPending = 0;
  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"FPXPCAutomaticErrorProxy.m" lineNumber:174 description:@"Use the methods from FPXPCAutomaticErrorProxy"];

  return 0;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"FPXPCAutomaticErrorProxy.m" lineNumber:180 description:@"Use the methods from FPXPCAutomaticErrorProxy"];

  return 0;
}

- (id)remoteObjectProxy
{
  if (self->_isSynchronous)
  {
    v2 = (FPXPCAutomaticErrorProxy *)[(FPXPCAutomaticErrorProxy *)self copy];
    v2->_isSynchronous = 0;
  }
  else
  {
    v2 = self;
  }

  return v2;
}

void __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_12(uint64_t a1, void *a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(a1 + 32) sanitizeErrors])
  {
    id v17 = v3;
    goto LABEL_11;
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = v3;
  id v6 = v4;
  BOOL v7 = [v5 domain];
  uint64_t v8 = *MEMORY[0x1E4F281F8];
  if (![v7 isEqualToString:*MEMORY[0x1E4F281F8]]
    || [v5 code] <= 4096
    || [v5 code] > 4223)
  {

    goto LABEL_9;
  }
  uint64_t v9 = [v6 selector];

  if (!v9)
  {
LABEL_9:
    id v17 = v5;
    goto LABEL_10;
  }
  BOOL v10 = NSString;
  v11 = NSStringFromSelector((SEL)[v6 selector]);
  id v12 = [v10 stringWithFormat:@"Error while sending %@", v11];

  id v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = [v5 code];
  uint64_t v15 = *MEMORY[0x1E4F28228];
  v32[0] = *MEMORY[0x1E4F28A50];
  v32[1] = v15;
  *(void *)buf = v5;
  *(void *)&buf[8] = v12;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v32 count:2];
  id v17 = [v13 errorWithDomain:v8 code:v14 userInfo:v16];

LABEL_10:
LABEL_11:
  if (*(unsigned char *)(a1 + 68))
  {
    id v18 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:*(void *)(a1 + 56)];
    id v19 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v18];
    objc_msgSend(v19, "fp_zeroOutReplyBlockArgumentsWithError:", v17);
    [v19 setTarget:*(void *)(a1 + 48)];
    [v19 invoke];
    int v20 = *(_DWORD *)(a1 + 64);
    int v21 = fp_current_or_default_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
    if (v20)
    {
      if (v22)
      {
        v23 = objc_msgSend(v3, "fp_prettyDescription");
        v24 = NSStringFromSelector((SEL)[*(id *)(a1 + 40) selector]);
        uint64_t v25 = FPExecutableNameForProcessIdentifier();
        int v26 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        __int16 v28 = 2114;
        v29 = v25;
        __int16 v30 = 1024;
        int v31 = v26;
        _os_log_debug_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Received error %@ while sending %{public}@ on behalf of %{public}@[%d]", buf, 0x26u);
      }
    }
    else if (v22)
    {
      __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_12_cold_1(v3, a1, v21);
    }
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_name];
}

- (void)setRequestEffectivePid:(int)a3
{
  self->_int pid = a3;
}

- (void)setTimeoutState:(unint64_t)a3
{
  self->_timeoutState = a3;
}

void __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  int v6 = 134218498;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received reply from %@ for %{public}@", (uint8_t *)&v6, 0x20u);
}

void __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_12_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a1, "fp_prettyDescription");
  int v6 = NSStringFromSelector((SEL)[*(id *)(a2 + 40) selector]);
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2114;
  __int16 v10 = v6;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Received error %@ while sending %{public}@", (uint8_t *)&v7, 0x16u);
}

@end