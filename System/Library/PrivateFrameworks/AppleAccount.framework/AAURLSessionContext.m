@interface AAURLSessionContext
+ (BOOL)supportsSecureCoding;
+ (id)_relevantHTTPStatusCodes;
- (AAAbsintheSigner)absintheSigner;
- (AARemoteServer)remoteServer;
- (AAURLSessionContext)init;
- (AAURLSessionContext)initWithCoder:(id)a3;
- (BOOL)requiresSigning;
- (id)_initRequiringSigning:(BOOL)a3 appleIDSession:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initRequiringSigning:(BOOL)a3;
- (id)relevantHTTPStatusCodes;
- (void)URLSession:(id)a3 task:(id)a4 getAppleIDHeadersForResponse:(id)a5 completionHandler:(id)a6;
- (void)_additionalAbsintheHeadersForData:(id)a3 completion:(id)a4;
- (void)_additionalHeadersForRequest:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsintheSigner:(id)a3;
- (void)setRemoteServer:(id)a3;
@end

@implementation AAURLSessionContext

- (id)relevantHTTPStatusCodes
{
  v2 = [(AKAppleIDSession *)self->_appleIDSession relevantHTTPStatusCodes];
  v3 = [(id)objc_opt_class() _relevantHTTPStatusCodes];
  if (v2)
  {
    uint64_t v4 = [v2 setByAddingObjectsFromSet:v3];

    v3 = (void *)v4;
  }

  return v3;
}

+ (id)_relevantHTTPStatusCodes
{
  if (_relevantHTTPStatusCodes_onceToken != -1) {
    dispatch_once(&_relevantHTTPStatusCodes_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_relevantHTTPStatusCodes_relevantStatusCodes;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteServer, 0);
  objc_storeStrong((id *)&self->_absintheSigner, 0);
  objc_storeStrong((id *)&self->_signingQueue, 0);

  objc_storeStrong((id *)&self->_appleIDSession, 0);
}

- (id)initRequiringSigning:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F4EF78]);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = (void *)[v5 initWithIdentifier:v7];

  id v9 = [(AAURLSessionContext *)self _initRequiringSigning:v3 appleIDSession:v8];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)-[AKAppleIDSession copyWithZone:](self->_appleIDSession, "copyWithZone:");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initRequiringSigning:appleIDSession:", self->_requiresSigning, v5);

  return v6;
}

- (id)_initRequiringSigning:(BOOL)a3 appleIDSession:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AAURLSessionContext;
  v8 = [(AAURLSessionContext *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    v8->_requiresSigning = a3;
    objc_storeStrong((id *)&v8->_appleIDSession, a4);
    v9->_signerLock._os_unfair_lock_opaque = 0;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = v9;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.appleaccount.URLSigningQ", v10);
    signingQueue = v11->_signingQueue;
    v11->_signingQueue = (OS_dispatch_queue *)v12;
  }
  return v9;
}

uint64_t __47__AAURLSessionContext__relevantHTTPStatusCodes__block_invoke()
{
  _relevantHTTPStatusCodes_relevantStatusCodes = [MEMORY[0x1E4F1CAD0] set];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAURLSessionContext)init
{
  return (AAURLSessionContext *)[(AAURLSessionContext *)self initRequiringSigning:0];
}

- (AAURLSessionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AAURLSessionContext;
  id v5 = [(AAURLSessionContext *)&v13 init];
  if (v5)
  {
    v5->_requiresSigning = [v4 decodeBoolForKey:@"RequiresSigning"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppleIDSession"];
    appleIDSession = v5->_appleIDSession;
    v5->_appleIDSession = (AKAppleIDSession *)v6;

    v5->_signerLock._os_unfair_lock_opaque = 0;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = v5;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appleaccount.URLSigningQ", v8);
    signingQueue = v9->_signingQueue;
    v9->_signingQueue = (OS_dispatch_queue *)v10;
  }
  return v5;
}

- (AARemoteServer)remoteServer
{
  p_signerLock = &self->_signerLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__AAURLSessionContext_remoteServer__block_invoke;
  v5[3] = &unk_1E5A486F8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_signerLock);
  BOOL v3 = __35__AAURLSessionContext_remoteServer__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_signerLock);

  return (AARemoteServer *)v3;
}

id __35__AAURLSessionContext_remoteServer__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = +[AARemoteServer sharedServer];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }

  return v2;
}

- (AAAbsintheSigner)absintheSigner
{
  p_signerLock = &self->_signerLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AAURLSessionContext_absintheSigner__block_invoke;
  v5[3] = &unk_1E5A486F8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_signerLock);
  uint64_t v3 = __37__AAURLSessionContext_absintheSigner__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_signerLock);

  return (AAAbsintheSigner *)v3;
}

id __37__AAURLSessionContext_absintheSigner__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = +[AAAbsintheSigner sharedSigner];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }

  return v2;
}

- (void)_additionalHeadersForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_AAURLSessionDefaultHeaders_onceToken != -1) {
    dispatch_once(&_AAURLSessionDefaultHeaders_onceToken, &__block_literal_global_163);
  }
  v8 = (void *)[(id)_AAURLSessionDefaultHeaders_defaultHeaders mutableCopy];
  if ([(AAURLSessionContext *)self requiresSigning])
  {
    id v9 = objc_msgSend(v6, "aa_HTTPBody");
    dispatch_queue_t v10 = [(AAURLSessionContext *)self remoteServer];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke;
    v12[3] = &unk_1E5A48798;
    id v13 = v8;
    v14 = self;
    id v15 = v9;
    id v16 = v7;
    id v11 = v9;
    [v10 configurationWithCompletion:v12];
  }
  else
  {
    id v11 = (id)[v8 copy];
    (*((void (**)(id, id, void))v7 + 2))(v7, v11, 0);
  }
}

void __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (_AAURLSessionAdditionalDeviceHeaders_onceToken != -1) {
    dispatch_once(&_AAURLSessionAdditionalDeviceHeaders_onceToken, &__block_literal_global_170);
  }
  id v7 = (id)_AAURLSessionAdditionalDeviceHeaders_additionalDeviceHeaders;
  if (v7) {
    [*(id *)(a1 + 32) addEntriesFromDictionary:v7];
  }
  dispatch_group_t v8 = dispatch_group_create();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_2;
  v18[3] = &unk_1E5A48748;
  int8x16_t v14 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v14.i64[0];
  int8x16_t v19 = vextq_s8(v14, v14, 8uLL);
  dispatch_queue_t v10 = v8;
  v20 = v10;
  id v11 = (void *)MEMORY[0x1A622F430](v18);
  dispatch_queue_t v12 = [v5 absintheEnable];
  [v12 unsignedIntegerValue];
  dispatch_group_enter(v10);
  [*(id *)(a1 + 40) _additionalAbsintheHeadersForData:*(void *)(a1 + 48) completion:v11];
  id v13 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_4;
  block[3] = &unk_1E5A48770;
  id v17 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 32);
  dispatch_group_notify(v10, v13, block);
}

void __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_3;
  block[3] = &unk_1E5A48720;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_sync(v4, block);
}

void __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:");
  }
  v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)_additionalAbsintheHeadersForData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AAURLSessionContext *)self absintheSigner];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__AAURLSessionContext__additionalAbsintheHeadersForData_completion___block_invoke;
  v10[3] = &unk_1E5A487C0;
  id v11 = v6;
  id v9 = v6;
  [v8 signatureForData:v7 completion:v10];
}

void __68__AAURLSessionContext__additionalAbsintheHeadersForData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a3;
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  id v8 = [v6 base64EncodedStringWithOptions:0];

  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:@"X-MMe-Nas-Qualify"];
  }
  id v9 = _AAErrorUnderlyingError(v16);
  dispatch_queue_t v10 = v9;
  if (v9)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "code"));
    dispatch_queue_t v12 = [v11 stringValue];
    [v7 setObject:v12 forKeyedSubscript:@"X-MMe-Nas-E"];
  }
  uint64_t v13 = [v7 count];
  uint64_t v14 = *(void *)(a1 + 32);
  if (v13)
  {
    id v15 = (void *)[v7 copy];
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v16);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v16);
  }
}

- (void)encodeWithCoder:(id)a3
{
  BOOL requiresSigning = self->_requiresSigning;
  id v5 = a3;
  [v5 encodeBool:requiresSigning forKey:@"RequiresSigning"];
  [v5 encodeObject:self->_appleIDSession forKey:@"AppleIDSession"];
}

- (void)URLSession:(id)a3 task:(id)a4 getAppleIDHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"AAURLSessionContext.m", 267, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"AAURLSessionContext.m", 268, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  id v15 = [MEMORY[0x1E4F18DC0] sharedSession];
  id v16 = [v12 currentRequest];
  id v17 = [v15 dataTaskWithRequest:v16];

  appleIDSession = self->_appleIDSession;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __86__AAURLSessionContext_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke;
  v24[3] = &unk_1E5A48810;
  id v25 = v17;
  v26 = self;
  id v27 = v12;
  id v28 = v14;
  id v19 = v14;
  id v20 = v12;
  id v21 = v17;
  [(AKAppleIDSession *)appleIDSession URLSession:v11 task:v21 getAppleIDHeadersForResponse:v13 completionHandler:v24];
}

void __86__AAURLSessionContext_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) cancel];
  if (a2)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) currentRequest];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__AAURLSessionContext_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_2;
    v8[3] = &unk_1E5A487E8;
    id v9 = v5;
    id v10 = *(id *)(a1 + 56);
    [v6 _additionalHeadersForRequest:v7 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __86__AAURLSessionContext_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v11;
  id v7 = v5;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v11 && v8)
  {
    id v10 = objc_msgSend(v8, "aaf_dictionaryByAddingEntriesFromDictionary:");
    (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, 1, v10);
  }
  else
  {
    if (v8) {
      id v6 = v8;
    }
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, 1, v6);
  }
}

- (BOOL)requiresSigning
{
  return self->_requiresSigning;
}

- (void)setAbsintheSigner:(id)a3
{
}

- (void)setRemoteServer:(id)a3
{
}

@end