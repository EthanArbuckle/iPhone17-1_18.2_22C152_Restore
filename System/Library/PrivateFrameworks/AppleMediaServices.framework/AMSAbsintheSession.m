@interface AMSAbsintheSession
+ (AMSAbsintheSession)defaultSession;
- (AMSAbsintheSession)init;
- (AMSPromiseSerialQueue)queue;
- (BOOL)clearSession;
- (BOOL)verifyData:(id)a3 bag:(id)a4 error:(id *)a5;
- (NSString)servKey;
- (PSCSessionInternal_)sessionRef;
- (id)_prepareContextWithBag:(id)a3;
- (id)asynchronouslyClearSession;
- (id)signData:(id)a3 bag:(id)a4;
- (id)signData:(id)a3 bag:(id)a4 error:(id *)a5;
- (void)PSCHelloV4Override;
- (void)setPSCHelloV4Override:(void *)a3;
- (void)setServKey:(id)a3;
- (void)setSessionRef:(PSCSessionInternal_ *)a3;
@end

@implementation AMSAbsintheSession

- (AMSAbsintheSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSAbsintheSession;
  v2 = [(AMSAbsintheSession *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AMSPromiseSerialQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    v2->_sessionRef = 0;
  }
  return v2;
}

+ (AMSAbsintheSession)defaultSession
{
  if (_MergedGlobals_75 != -1) {
    dispatch_once(&_MergedGlobals_75, &__block_literal_global_1);
  }
  v2 = (void *)qword_1EB38D568;
  return (AMSAbsintheSession *)v2;
}

uint64_t __36__AMSAbsintheSession_defaultSession__block_invoke()
{
  qword_1EB38D568 = objc_alloc_init(AMSAbsintheSession);
  return MEMORY[0x1F41817F8]();
}

- (id)asynchronouslyClearSession
{
  v3 = [(AMSAbsintheSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__AMSAbsintheSession_asynchronouslyClearSession__block_invoke;
  v6[3] = &unk_1E559E860;
  v6[4] = self;
  v4 = [v3 runBinaryPromiseBlock:v6];

  return v4;
}

void __48__AMSAbsintheSession_asynchronouslyClearSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) sessionRef];
  v5 = *(void **)(a1 + 32);
  if (!v4) {
    goto LABEL_9;
  }
  int v6 = ZyNF2D9([v5 sessionRef]);
  if (!v6)
  {
    v5 = *(void **)(a1 + 32);
LABEL_9:
    [v5 setSessionRef:0];
    [*(id *)(a1 + 32) setServKey:0];
    v3[2](v3, 1, 0);
    goto LABEL_10;
  }
  int v7 = v6;
  v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    v11 = AMSLogKey();
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to clear session with status: %ld", (uint8_t *)&v13, 0x20u);
  }
  [*(id *)(a1 + 32) setSessionRef:0];
  [*(id *)(a1 + 32) setServKey:0];
  v12 = AMSError(0, @"Absinthe Session Failure", @"Failed to clear session", 0);
  ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v12);

LABEL_10:
}

- (id)signData:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(AMSAbsintheSession *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__AMSAbsintheSession_signData_bag___block_invoke;
    v11[3] = &unk_1E559E8D8;
    id v12 = v6;
    int v13 = self;
    id v14 = v7;
    v9 = [v8 runPromiseBlock:v11];
  }
  else
  {
    v8 = AMSError(2, @"Absinthe Session Failure", @"Bag was not provided", 0);
    v9 = +[AMSPromise promiseWithError:v8];
  }

  return v9;
}

void __35__AMSAbsintheSession_signData_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AMSLogKey();
  if ([*(id *)(a1 + 32) length])
  {
    v5 = 0;
  }
  else
  {
    id v6 = AMSError(2, @"Absinthe Session Failure", @"Invalid data", 0);
    v5 = +[AMSBinaryPromise promiseWithError:v6];
  }
  if ([*(id *)(a1 + 40) sessionRef]
    && ([*(id *)(a1 + 40) servKey], id v7 = objc_claimAutoreleasedReturnValue(),
                                                   v7,
                                                   v7))
  {
    v8 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    v9 = [*(id *)(a1 + 40) _prepareContextWithBag:*(void *)(a1 + 48)];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __35__AMSAbsintheSession_signData_bag___block_invoke_2;
    v21[3] = &unk_1E559E888;
    id v10 = v4;
    uint64_t v11 = *(void *)(a1 + 40);
    id v22 = v10;
    uint64_t v23 = v11;
    v8 = [v9 thenWithBlock:v21];
  }
  id v12 = [v8 promiseAdapter];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35__AMSAbsintheSession_signData_bag___block_invoke_3;
  v19[3] = &unk_1E559E578;
  int8x16_t v16 = *(int8x16_t *)(a1 + 32);
  id v13 = (id)v16.i64[0];
  int8x16_t v20 = vextq_s8(v16, v16, 8uLL);
  id v14 = [v12 thenWithBlock:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __35__AMSAbsintheSession_signData_bag___block_invoke_56;
  v17[3] = &unk_1E559E8B0;
  v17[4] = *(void *)(a1 + 40);
  id v18 = v3;
  id v15 = v3;
  [v14 addFinishBlock:v17];
}

id __35__AMSAbsintheSession_signData_bag___block_invoke_2(uint64_t a1)
{
  id v2 = AMSSetLogKey(*(void **)(a1 + 32));
  if ([*(id *)(a1 + 40) sessionRef]
    && ([*(id *)(a1 + 40) servKey], id v3 = objc_claimAutoreleasedReturnValue(),
                                                   v3,
                                                   v3))
  {
    uint64_t v4 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 40) sessionRef] != 0;
    id v6 = [*(id *)(a1 + 40) servKey];
    [v6 length];
    id v12 = AMSErrorWithFormat(2, @"Absinthe Session Failure", @"Invalid session and/or servKey. hasSession: %d servKeyLength: %ld", v7, v8, v9, v10, v11, v5);
    uint64_t v4 = +[AMSBinaryPromise promiseWithError:v12];
  }
  return v4;
}

id __35__AMSAbsintheSession_signData_bag___block_invoke_3(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    id v2 = +[AMSLogConfig sharedConfig];
    if (!v2)
    {
      id v2 = +[AMSLogConfig sharedConfig];
    }
    id v3 = [v2 OSLogObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_opt_class();
      BOOL v5 = [*(id *)(a1 + 40) base64EncodedStringWithOptions:0];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v4;
      __int16 v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Signing message: %@", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  unsigned int v26 = 0;
  uint64_t v25 = 0;
  unsigned int v24 = 0;
  int v6 = qSCskg([*(id *)(a1 + 32) sessionRef], objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)buf, (uint64_t)&v26, (uint64_t)&v25, (uint64_t)&v24);
  if (v6) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v26 == 0;
  }
  if (v12 || v24 == 0)
  {
    __int16 v17 = AMSErrorWithFormat(0, @"Absinthe Session Failure", @"Failed to generate signature. Status: %ld", v7, v8, v9, v10, v11, v6);
    id v14 = +[AMSPromise promiseWithError:v17];
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    int8x16_t v16 = (void *)[v15 initWithBytes:*(void *)buf length:v26];
    __int16 v17 = [v16 base64EncodedStringWithOptions:0];
    id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v19 = (void *)[v18 initWithBytes:v25 length:v24];
    int8x16_t v20 = [v19 base64EncodedStringWithOptions:0];

    if (v17
      && v20
      && (v21 = objc_alloc_init(AMSAbsintheSignature),
          [(AMSAbsintheSignature *)v21 setSignature:v17],
          [(AMSAbsintheSignature *)v21 setServKey:v20],
          v21))
    {
      uint64_t v22 = +[AMSPromise promiseWithResult:v21];
    }
    else
    {
      AMSError(0, @"Absinthe Session Failure", @"Signing finished without a result or error", 0);
      v21 = (AMSAbsintheSignature *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = +[AMSPromise promiseWithError:v21];
    }
    id v14 = (void *)v22;
  }
  return v14;
}

void __35__AMSAbsintheSession_signData_bag___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = AMSLogKey();
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        uint64_t v3 = AMSLogKey();
        [v11 stringWithFormat:@"%@: [%@] ", v13, v3];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      id v14 = };
      id v15 = AMSLogableError(v7);
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v14;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to sign data. error = %{public}@", buf, 0x16u);
      if (v10)
      {

        id v14 = (void *)v3;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)verifyData:(id)a3 bag:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)_prepareContextWithBag:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    BOOL v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&unsigned char buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provisioning session", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v9 = [v4 URLForKey:@"absinthe-handshake"];
  uint64_t v10 = [v9 valuePromise];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__AMSAbsintheSession__prepareContextWithBag___block_invoke;
  v18[3] = &unk_1E559E900;
  v18[4] = self;
  uint64_t v20 = buf;
  id v11 = v4;
  id v19 = v11;
  uint64_t v12 = [v10 thenWithBlock:v18];
  uint64_t v13 = [v12 thenWithBlock:&__block_literal_global_83];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__AMSAbsintheSession__prepareContextWithBag___block_invoke_2;
  v17[3] = &unk_1E559E948;
  v17[4] = self;
  void v17[5] = buf;
  id v14 = [v13 thenWithBlock:v17];
  id v15 = [v14 binaryPromiseAdapter];

  _Block_object_dispose(buf, 8);
  return v15;
}

id __45__AMSAbsintheSession__prepareContextWithBag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned int v27 = 0;
  uint64_t v26 = 0;
  if (+[AMSUnitTests isRunningUnitTests]
    && [*(id *)(a1 + 32) PSCHelloV4Override])
  {
    int v4 = ((uint64_t (*)(uint64_t, uint64_t *, unsigned int *, uint64_t))[*(id *)(a1 + 32) PSCHelloV4Override])(*(void *)(*(void *)(a1 + 48) + 8) + 24, &v26, &v27, 2);
  }
  else
  {
    int v4 = SwZuQte6Dm(*(void *)(*(void *)(a1 + 48) + 8) + 24, (uint64_t)&v26, (uint64_t)&v27, 2);
  }
  if (v4) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v27 == 0;
  }
  if (v10 || !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v11 = AMSErrorWithFormat(0, @"Absinthe Session Failure", @"Failed to create hello message. Status: %ld hasSession: %d MsgLength: %ld", v5, v6, v7, v8, v9, v4);
    uint64_t v20 = +[AMSPromise promiseWithError:v11];
  }
  else
  {
    id v11 = +[AMSDevice deviceGUID];
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v13 = (void *)[v12 initWithBytes:v26 length:v27];
      uint64_t v14 = [v13 base64EncodedStringWithOptions:0];
      id v15 = (void *)v14;
      int8x16_t v16 = &stru_1EDCA7308;
      if (v14) {
        int8x16_t v16 = (__CFString *)v14;
      }
      __int16 v17 = v16;

      v28[0] = @"udid";
      v28[1] = @"request-message";
      v29[0] = v11;
      v29[1] = v17;
      __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      id v19 = [[AMSURLRequestEncoder alloc] initWithBag:*(void *)(a1 + 40)];

      [(AMSURLRequestEncoder *)v19 setRequestEncoding:3];
      uint64_t v20 = [(AMSURLRequestEncoder *)v19 requestWithMethod:4 URL:v3 parameters:v18];
    }
    else
    {
      v21 = +[AMSLogConfig sharedConfig];
      if (!v21)
      {
        v21 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = objc_opt_class();
        unsigned int v24 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v23;
        __int16 v32 = 2114;
        v33 = v24;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to detemine unique device identifier", buf, 0x16u);
      }
      uint64_t v13 = AMSError(5, @"Absinthe Session Failure", @"Failed to determine unique device identifier", 0);
      uint64_t v20 = +[AMSPromise promiseWithError:v13];
    }
  }
  return v20;
}

id __45__AMSAbsintheSession__prepareContextWithBag___block_invoke_80(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  id v3 = +[AMSURLSession defaultSession];
  int v4 = [v3 dataTaskPromiseWithRequest:v2];

  return v4;
}

id __45__AMSAbsintheSession__prepareContextWithBag___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (!v4)
    {
      id v6 = 0;
      goto LABEL_21;
    }
    uint64_t v5 = [v4 objectForKeyedSubscript:@"serv-key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;

      if (v6)
      {
        id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
        goto LABEL_10;
      }
    }
    else
    {

      id v6 = 0;
    }
    id v3 = 0;
LABEL_10:
    uint64_t v7 = [v4 objectForKeyedSubscript:@"response"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;

      if (v8)
      {
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
        goto LABEL_15;
      }
    }
    else
    {

      id v8 = 0;
    }
    uint64_t v9 = 0;
LABEL_15:
    if ([v9 length])
    {
      if ([v3 length])
      {
        uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        id v10 = v9;
        uint64_t v11 = [v10 bytes];
        int v12 = [v10 length];
        id v13 = v3;
        int v14 = xtiKg(v34, v11, v12, [v13 bytes], objc_msgSend(v13, "length"));
        if (v14)
        {
          uint64_t v20 = AMSErrorWithFormat(0, @"Absinthe Session Failure", @"Failed to setup session. Status: %ld", v15, v16, v17, v18, v19, v14);
          v21 = +[AMSPromise promiseWithError:v20];

          goto LABEL_31;
        }
      }
    }

    goto LABEL_20;
  }
  id v4 = 0;
  id v6 = 0;
LABEL_20:

LABEL_21:
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    BOOL v26 = 0;
LABEL_30:
    [v6 length];
    __int16 v32 = AMSErrorWithFormat(0, @"Absinthe Session Failure", @"Failed to create session. (sessionExists: %d servKeyLength: %ld)", v27, v28, v29, v30, v31, v26);
    v21 = +[AMSPromise promiseWithError:v32];

    goto LABEL_31;
  }
  if (![v6 length])
  {
    BOOL v26 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
    goto LABEL_30;
  }
  uint64_t v22 = +[AMSLogConfig sharedConfig];
  if (!v22)
  {
    uint64_t v22 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v23 = [v22 OSLogObject];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v24;
    __int16 v37 = 2114;
    v38 = v25;
    _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provisioning succeeded", buf, 0x16u);
  }
  [*(id *)(a1 + 32) setSessionRef:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) setServKey:v6];
  v21 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
LABEL_31:

  return v21;
}

- (BOOL)clearSession
{
  id v2 = [(AMSAbsintheSession *)self asynchronouslyClearSession];
  char v3 = [v2 resultWithError:0];

  return v3;
}

- (id)signData:(id)a3 bag:(id)a4 error:(id *)a5
{
  id v6 = [(AMSAbsintheSession *)self signData:a3 bag:a4];
  uint64_t v7 = [v6 resultWithError:a5];

  return v7;
}

- (void)PSCHelloV4Override
{
  return self->_PSCHelloV4Override;
}

- (void)setPSCHelloV4Override:(void *)a3
{
  self->_PSCHelloV4Override = a3;
}

- (AMSPromiseSerialQueue)queue
{
  return self->_queue;
}

- (PSCSessionInternal_)sessionRef
{
  return self->_sessionRef;
}

- (void)setSessionRef:(PSCSessionInternal_ *)a3
{
  self->_sessionRef = a3;
}

- (NSString)servKey
{
  return self->_servKey;
}

- (void)setServKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end