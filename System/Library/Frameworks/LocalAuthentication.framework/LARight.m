@interface LARight
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LARight)init;
- (LARight)initWithAccessKey:(id)a3;
- (LARight)initWithIdentifier:(id)a3 accessKey:(id)a4;
- (LARight)initWithRequirement:(LAAuthenticationRequirement *)requirement;
- (LARightState)state;
- (NSInteger)tag;
- (NSString)description;
- (id)accessKey;
- (id)context;
- (id)identifier;
- (void)_authorizeWithOptions:(void *)a3 completionHandler:;
- (void)authorizeWithLocalizedReason:(NSString *)localizedReason completion:(void *)handler;
- (void)authorizeWithOptions:(id)a3 completion:(id)a4;
- (void)checkCanAuthorizeWithCompletion:(void *)handler;
- (void)dealloc;
- (void)deauthorizeWithCompletion:(void *)handler;
- (void)rightContextDidBecomeInvalid;
- (void)setContext:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTag:(NSInteger)tag;
@end

@implementation LARight

- (LARight)init
{
  v3 = +[LAAuthenticationRequirement defaultRequirement];
  v4 = [(LARight *)self initWithRequirement:v3];

  return v4;
}

- (LARight)initWithRequirement:(LAAuthenticationRequirement *)requirement
{
  v4 = [(LAAuthenticationRequirement *)requirement key];
  v5 = [(LARight *)self initWithAccessKey:v4];

  return v5;
}

- (LARight)initWithAccessKey:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [v6 UUIDString];
  v8 = [(LARight *)self initWithIdentifier:v7 accessKey:v5];

  return v8;
}

- (LARight)initWithIdentifier:(id)a3 accessKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LARight;
  v9 = [(LARight *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_accessKey, a4);
    v11 = [[LARightContextHandler alloc] initWithDelegate:v10];
    contextHandler = v10->_contextHandler;
    v10->_contextHandler = v11;

    v10->_state = 0;
    uint64_t v13 = [MEMORY[0x1E4F72F38] createDefaultSerialQueueWithIdentifier:@"LARight"];
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    v15 = [MEMORY[0x1E4F30B98] sharedInstance];
    v10->_instanceID = [v15 nextInstanceIDInDomain:@"LARight"];

    v16 = LA_LOG();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1BED06000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = LA_LOG();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)LARight;
  [(LARight *)&v4 dealloc];
}

- (void)authorizeWithLocalizedReason:(NSString *)localizedReason completion:(void *)handler
{
  v6 = localizedReason;
  uint64_t v7 = handler;
  os_activity_t v8 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.authorizeWithLocalizedReason", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__LARight_authorizeWithLocalizedReason_completion___block_invoke;
  v12[3] = &unk_1E63C40F0;
  v12[4] = self;
  uint64_t v13 = v6;
  os_activity_t v14 = v8;
  id v15 = v7;
  id v9 = v7;
  v10 = v8;
  v11 = v6;
  os_activity_apply(v10, v12);
}

void __51__LARight_authorizeWithLocalizedReason_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v3;
    __int16 v16 = 2114;
    uint64_t v17 = v4;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ authorizeWithLocalizedReason '%{public}@' started", buf, 0x16u);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v12 = &unk_1F19EC6B8;
  uint64_t v13 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__LARight_authorizeWithLocalizedReason_completion___block_invoke_75;
  v8[3] = &unk_1E63C40C8;
  id v9 = *(id *)(a1 + 48);
  objc_copyWeak(&v11, (id *)buf);
  id v10 = *(id *)(a1 + 56);
  [v5 authorizeWithOptions:v7 completion:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __51__LARight_authorizeWithLocalizedReason_completion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__LARight_authorizeWithLocalizedReason_completion___block_invoke_2;
  block[3] = &unk_1E63C40A0;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 40);
  os_activity_apply(v4, block);

  objc_destroyWeak(&v9);
}

uint64_t __51__LARight_authorizeWithLocalizedReason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG();
  if (*(void *)(a1 + 32)) {
    os_log_type_t v3 = LALogTypeForInternalError();
  }
  else {
    os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
  }
  if (os_log_type_enabled(v2, v3))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      uint64_t v6 = [NSString stringWithFormat:@"(err:%@)", *(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v6 = @"successfully";
    }
    *(_DWORD *)buf = 138543618;
    id v9 = WeakRetained;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_1BED06000, v2, v3, "%{public}@ authorizeWithLocalizedReason finished %{public}@", buf, 0x16u);
    if (v5) {
  }
    }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkCanAuthorizeWithCompletion:(void *)handler
{
  uint64_t v4 = handler;
  uint64_t v5 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.checkCanAuthorizeWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__LARight_checkCanAuthorizeWithCompletion___block_invoke;
  v7[3] = &unk_1E63C4118;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __43__LARight_checkCanAuthorizeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ checkCanAuthorizeWithCompletion started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = &unk_1F19EC6D0;
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__LARight_checkCanAuthorizeWithCompletion___block_invoke_87;
  v6[3] = &unk_1E63C3E38;
  objc_copyWeak(&v8, (id *)buf);
  id v7 = *(id *)(a1 + 40);
  -[LARight _authorizeWithOptions:completionHandler:](v4, v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __43__LARight_checkCanAuthorizeWithCompletion___block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v6 = LA_LOG();
    goto LABEL_6;
  }
  int v4 = [MEMORY[0x1E4F30B90] error:v3 hasCode:-1004];
  uint64_t v5 = LA_LOG();
  id v6 = v5;
  if (v4)
  {
LABEL_6:
    os_log_type_t v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v6, v9)) {
      goto LABEL_12;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v10 = [NSString stringWithFormat:@"(err:%@)", v3];
    int v8 = 1;
    goto LABEL_8;
  }
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = 0;
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  uint64_t v10 = @"successfully";
LABEL_8:
  *(_DWORD *)buf = 138543618;
  id v12 = WeakRetained;
  __int16 v13 = 2114;
  os_activity_t v14 = v10;
  _os_log_impl(&dword_1BED06000, v6, v9, "%{public}@ checkCanAuthorizeWithCompletion finished %{public}@", buf, 0x16u);
  if (v8)
  {
  }
  else
  {
  }
LABEL_12:

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_authorizeWithOptions:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v7 = a1[4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__LARight__authorizeWithOptions_completionHandler___block_invoke;
    v8[3] = &unk_1E63C4168;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    id v9 = v5;
    dispatch_async(v7, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)deauthorizeWithCompletion:(void *)handler
{
  int v4 = handler;
  id v5 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.deauthorizeWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__LARight_deauthorizeWithCompletion___block_invoke;
  v7[3] = &unk_1E63C4118;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

uint64_t __37__LARight_deauthorizeWithCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAContext);
  [*(id *)(a1 + 32) setContext:v2];

  if (*(void *)(*(void *)(a1 + 32) + 48) != 3) {
    __37__LARight_deauthorizeWithCompletion___block_invoke_cold_1();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)authorizeWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_t v8 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.authorizeWithOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__LARight_authorizeWithOptions_completion___block_invoke;
  v12[3] = &unk_1E63C4140;
  v12[4] = self;
  id v13 = v6;
  os_activity_t v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  os_activity_apply(v9, v12);
}

void __43__LARight_authorizeWithOptions_completion___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    id v21 = v3;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ authorizeWithOptions %{public}@ started", buf, 0x16u);
  }

  id v5 = [a1[5] objectForKeyedSubscript:&unk_1F19EC6B8];
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = [a1[5] objectForKeyedSubscript:&unk_1F19EC6B8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  os_activity_t v8 = [a1[5] objectForKeyedSubscript:&unk_1F19EC6B8];
  id v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v10 = [v8 stringByTrimmingCharactersInSet:v9];
  BOOL v11 = [v10 length] == 0;

  if (!v11)
  {
    objc_initWeak((id *)buf, a1[4]);
    [a1[4] setState:1];
    id v12 = a1[4];
    id v13 = a1[5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__LARight_authorizeWithOptions_completion___block_invoke_96;
    v16[3] = &unk_1E63C40C8;
    id v17 = a1[6];
    objc_copyWeak(&v19, (id *)buf);
    id v18 = a1[7];
    -[LARight _authorizeWithOptions:completionHandler:](v12, v13, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_7:
    os_activity_t v14 = (void (**)(id, void *))a1[7];
    id v15 = +[LAAuthorizationError genericErrorWithMessage:@"Missing required 'LAOptionAuthenticationReason' option"];
    v14[2](v14, v15);
  }
}

void __43__LARight_authorizeWithOptions_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__LARight_authorizeWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E63C40A0;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 40);
  os_activity_apply(v4, block);

  objc_destroyWeak(&v9);
}

void __43__LARight_authorizeWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG();
  if (*(void *)(a1 + 32)) {
    os_log_type_t v3 = LALogTypeForInternalError();
  }
  else {
    os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
  }
  if (os_log_type_enabled(v2, v3))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      id v6 = [NSString stringWithFormat:@"(err:%@)", *(void *)(a1 + 32)];
    }
    else
    {
      id v6 = @"successfully";
    }
    *(_DWORD *)buf = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1BED06000, v2, v3, "%{public}@ authorizeWithOptions finished %{public}@", buf, 0x16u);
    if (v5) {
  }
    }
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = v7;
  if (v7)
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
    [v7 setState:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    uint64_t v5 = NSStringFromSelector(sel_state);
    [(LARight *)self willChangeValueForKey:v5];

    self->_state = a3;
    NSStringFromSelector(sel_state);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(LARight *)self didChangeValueForKey:v6];
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_state);
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___LARight;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setContext:(id)a3
{
  [(LARightContextHandler *)self->_contextHandler setContext:a3];

  [(LARight *)self setState:3];
}

- (id)context
{
  return [(LARightContextHandler *)self->_contextHandler context];
}

- (id)accessKey
{
  return self->_accessKey;
}

- (void)rightContextDidBecomeInvalid
{
}

void __51__LARight__authorizeWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  os_log_type_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[2];
    uint64_t v5 = [WeakRetained context];
    [v4 armInContext:v5 options:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else
  {
    char v6 = LA_LOG();
    os_log_type_t v7 = LALogTypeForInternalError();
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1BED06000, v6, v7, "Operation interrupted", v10, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    objc_super v9 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    char v6 = [v5 accessKey];
    os_log_type_t v7 = [(LARight *)self accessKey];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      objc_super v9 = [v5 context];
      id v10 = [(LARight *)self context];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"LARight[%u]", self->_instanceID);
}

- (LARightState)state
{
  return self->_state;
}

- (NSInteger)tag
{
  return self->_tag;
}

- (void)setTag:(NSInteger)tag
{
  self->_tag = tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_contextHandler, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

void __37__LARight_deauthorizeWithCompletion___block_invoke_cold_1()
{
  __assert_rtn("-[LARight deauthorizeWithCompletion:]_block_invoke", "LARight.m", 168, "_state == LARightStateNotAuthorized");
}

@end