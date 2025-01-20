@interface AAAbsintheSigner
+ (AAAbsintheSigner)sharedSigner;
+ (id)_contextCreationBlock;
+ (void)_setContextCreationBlock:(id)a3;
- (AAAbsintheContext)context;
- (AAAbsintheSigner)init;
- (AAAbsintheSigner)initWithCacheTimeout:(double)a3;
- (AAURLSession)session;
- (double)cacheTimeout;
- (id)_contextLock_contextInvalidatingIfNecessary;
- (void)_contextLock_contextInvalidatingIfNecessary;
- (void)_contextLock_dequeueContextCleanup;
- (void)_contextLock_enqueueContextCleanup;
- (void)_contextQueue_contextWithCompletion:(id)a3;
- (void)_contextWithCompletion:(id)a3;
- (void)_fetchCertificateDataWithCompletion:(id)a3;
- (void)_fetchSessionInfoWithRequestInfo:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setSession:(id)a3;
- (void)signatureForData:(id)a3 completion:(id)a4;
@end

@implementation AAAbsintheSigner

+ (AAAbsintheSigner)sharedSigner
{
  if (sharedSigner_onceToken != -1) {
    dispatch_once(&sharedSigner_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedSigner_sharedSigner;

  return (AAAbsintheSigner *)v2;
}

uint64_t __32__AAAbsintheSigner_sharedSigner__block_invoke()
{
  sharedSigner_sharedSigner = [[AAAbsintheSigner alloc] initWithCacheTimeout:540.0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_contextCreationBlock
{
  if (_contextCreationBlock_onceToken != -1) {
    dispatch_once(&_contextCreationBlock_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)MEMORY[0x1A622F430](_AAContextCreationBlock);

  return v2;
}

void __41__AAAbsintheSigner__contextCreationBlock__block_invoke()
{
  if (!_AAContextCreationBlock)
  {
    _AAContextCreationBlock = (uint64_t)&__block_literal_global_27;
  }
}

AAAbsintheContext *__41__AAAbsintheSigner__contextCreationBlock__block_invoke_2()
{
  v0 = objc_alloc_init(AAAbsintheContext);

  return v0;
}

+ (void)_setContextCreationBlock:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"AAAbsintheSigner.m", 70, @"Invalid parameter not satisfying: %@", @"contextCreationBlock" object file lineNumber description];
  }
  uint64_t v5 = MEMORY[0x1A622F430]();
  v6 = (void *)_AAContextCreationBlock;
  _AAContextCreationBlock = v5;
}

- (AAAbsintheSigner)init
{
  return [(AAAbsintheSigner *)self initWithCacheTimeout:540.0];
}

- (AAAbsintheSigner)initWithCacheTimeout:(double)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AAAbsintheSigner;
  v4 = [(AAAbsintheSigner *)&v13 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_cacheTimeout = a3;
    uint64_t v6 = +[AAURLSession sharedSession];
    session = v5->_session;
    v5->_session = (AAURLSession *)v6;

    v5->_contextLock._os_unfair_lock_opaque = 0;
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.AppleAccount.NACQ", v8);
    contextQueue = v5->_contextQueue;
    v5->_contextQueue = (OS_dispatch_queue *)v9;

    contextCache = v5->_contextCache;
    v5->_contextCache = 0;
  }
  return v5;
}

- (void)dealloc
{
  p_contextLock = &self->_contextLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AAAbsintheSigner_dealloc__block_invoke;
  v5[3] = &unk_1E5A48358;
  v5[4] = self;
  os_unfair_lock_lock(&self->_contextLock);
  __27__AAAbsintheSigner_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_contextLock);
  v4.receiver = self;
  v4.super_class = (Class)AAAbsintheSigner;
  [(AAAbsintheSigner *)&v4 dealloc];
}

void __27__AAAbsintheSigner_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_super v4 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"AAAbsintheSigner.m", 108, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__AAAbsintheSigner_signatureForData_completion___block_invoke;
  v12[3] = &unk_1E5A48858;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(AAAbsintheSigner *)self _contextWithCompletion:v12];
}

void __48__AAAbsintheSigner_signatureForData_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v7 = 0;
    objc_super v4 = [a2 cao1NI5PNJBn:v3 error:&v7];
    id v5 = v7;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

- (AAAbsintheContext)context
{
  p_contextLock = &self->_contextLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AAAbsintheSigner_context__block_invoke;
  v5[3] = &unk_1E5A48880;
  v5[4] = self;
  os_unfair_lock_lock(&self->_contextLock);
  uint64_t v3 = __27__AAAbsintheSigner_context__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_contextLock);

  return (AAAbsintheContext *)v3;
}

uint64_t __27__AAAbsintheSigner_context__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_contextLock_contextInvalidatingIfNecessary");
}

- (id)_contextLock_contextInvalidatingIfNecessary
{
  os_unfair_lock_assert_owner(&self->_contextLock);
  uint64_t v3 = [(AAAbsintheSignerContextCache *)self->_contextCache creationDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;
  double v6 = -self->_cacheTimeout;

  if (v5 < v6)
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AAAbsintheSigner _contextLock_contextInvalidatingIfNecessary]();
    }

    contextCache = self->_contextCache;
    self->_contextCache = 0;

    [(AAAbsintheSigner *)self _contextLock_dequeueContextCleanup];
  }
  id v9 = [(AAAbsintheSignerContextCache *)self->_contextCache context];

  return v9;
}

- (void)setContext:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__AAAbsintheSigner_setContext___block_invoke;
  v7[3] = &unk_1E5A488A8;
  p_contextLock = &self->_contextLock;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  os_unfair_lock_lock(p_contextLock);
  __31__AAAbsintheSigner_setContext___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_contextLock);
}

uint64_t __31__AAAbsintheSigner_setContext___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = +[AAAbsintheSignerContextCache cacheWithContext:](AAAbsintheSignerContextCache, "cacheWithContext:");
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    double v5 = *(void **)(a1 + 40);
    return objc_msgSend(v5, "_contextLock_enqueueContextCleanup");
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0;

    id v9 = *(void **)(a1 + 40);
    return objc_msgSend(v9, "_contextLock_dequeueContextCleanup");
  }
}

- (void)_contextLock_enqueueContextCleanup
{
  os_unfair_lock_assert_owner(&self->_contextLock);
  contextTimerSource = self->_contextTimerSource;
  if (contextTimerSource) {
    dispatch_source_cancel(contextTimerSource);
  }
  objc_initWeak(&location, self);
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_contextQueue);
  double v5 = self->_contextTimerSource;
  self->_contextTimerSource = v4;

  id v6 = self->_contextTimerSource;
  [(AAAbsintheSigner *)self cacheTimeout];
  dispatch_time_t v8 = dispatch_walltime(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  id v9 = self->_contextTimerSource;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AAAbsintheSigner__contextLock_enqueueContextCleanup__block_invoke;
  v10[3] = &unk_1E5A48308;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume((dispatch_object_t)self->_contextTimerSource);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__AAAbsintheSigner__contextLock_enqueueContextCleanup__block_invoke(uint64_t a1)
{
  uint64_t v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__AAAbsintheSigner__contextLock_enqueueContextCleanup__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setContext:0];
}

- (void)_contextLock_dequeueContextCleanup
{
  os_unfair_lock_assert_owner(&self->_contextLock);
  contextTimerSource = self->_contextTimerSource;
  if (contextTimerSource)
  {
    dispatch_source_cancel(contextTimerSource);
    id v4 = self->_contextTimerSource;
    self->_contextTimerSource = 0;
  }
}

- (void)_contextWithCompletion:(id)a3
{
  double v5 = (void (**)(id, void *, void))a3;
  if (!v5)
  {
    dispatch_time_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"AAAbsintheSigner.m", 206, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = [(AAAbsintheSigner *)self context];
  if (v6)
  {
    v5[2](v5, v6, 0);
  }
  else
  {
    contextQueue = self->_contextQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__AAAbsintheSigner__contextWithCompletion___block_invoke;
    block[3] = &unk_1E5A48470;
    block[4] = self;
    id v10 = v5;
    dispatch_async(contextQueue, block);
  }
}

uint64_t __43__AAAbsintheSigner__contextWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_contextQueue_contextWithCompletion:", *(void *)(a1 + 40));
}

- (void)_contextQueue_contextWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v5 = (void (**)(id, void *, void))a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"AAAbsintheSigner.m", 219, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_contextQueue);
  id v6 = [(AAAbsintheSigner *)self context];
  if (v6)
  {
    v5[2](v5, v6, 0);
  }
  else
  {
    double v7 = _AASignpostLogSystem();
    os_signpost_id_t v8 = _AASignpostCreate(v7);
    uint64_t v10 = v9;

    id v11 = _AASignpostLogSystem();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "InitializeAbsinthe", " enableTelemetry=YES ", buf, 2u);
    }

    id v13 = _AASignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v26 = v8;
      _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: InitializeAbsinthe  enableTelemetry=YES ", buf, 0xCu);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke;
    v21[3] = &unk_1E5A488D0;
    os_signpost_id_t v23 = v8;
    uint64_t v24 = v10;
    v21[4] = self;
    id v14 = v5;
    id v22 = v14;
    v15 = (void *)MEMORY[0x1A622F430](v21);
    dispatch_suspend((dispatch_object_t)self->_contextQueue);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52;
    v18[3] = &unk_1E5A48920;
    v18[4] = self;
    id v19 = v15;
    v20 = v14;
    id v16 = v15;
    [(AAAbsintheSigner *)self _fetchCertificateDataWithCompletion:v18];
  }
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  if ((v7 != 0) != (v8 == 0))
  {
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid exclusivity not satisfying: context ^ error" userInfo:0];
    objc_exception_throw(v22);
  }
  uint64_t v9 = v8;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v11 = _AASignpostLogSystem();
  v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 48);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v14 = _AAErrorUnderlyingError(v9);
    int v23 = 67240192;
    LODWORD(v24) = [v14 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_END, v13, "InitializeAbsinthe", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v23, 8u);
  }
  v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = (double)Nanoseconds / 1000000000.0;
    uint64_t v17 = *(void *)(a1 + 48);
    v18 = _AAErrorUnderlyingError(v9);
    int v19 = [v18 code];
    int v23 = 134218496;
    uint64_t v24 = v17;
    __int16 v25 = 2048;
    double v26 = v16;
    __int16 v27 = 1026;
    int v28 = v19;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: InitializeAbsinthe  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v23, 0x1Cu);
  }
  v20 = _AALogSystem();
  v21 = v20;
  if (v7)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) setContext:v7];
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_cold_2();
    }
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_5();
    }

    id v8 = +[AAAbsintheSigner _contextCreationBlock];
    uint64_t v9 = v8[2]();

    id v21 = 0;
    uint64_t v10 = [v9 TgBfoO2wtF5L:v5 error:&v21];
    id v11 = v21;
    v12 = _AALogSystem();
    os_signpost_id_t v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_4();
      }

      id v14 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53;
      v18[3] = &unk_1E5A488F8;
      id v19 = v9;
      id v20 = *(id *)(a1 + 40);
      [v14 _fetchSessionInfoWithRequestInfo:v10 completion:v18];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_3();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

LABEL_16:
    goto LABEL_17;
  }
  v15 = _AALogSystem();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (!v6)
  {
    if (v16) {
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_1();
    }

    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4402);
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v9);
    goto LABEL_16;
  }
  if (v16) {
    __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_2();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_17:
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AALogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53_cold_4();
    }

    uint64_t v9 = *(void **)(a1 + 32);
    id v14 = 0;
    int v10 = [v9 R6XtwiyjL3q2:v5 error:&v14];
    id v11 = v14;
    v12 = _AALogSystem();
    os_signpost_id_t v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53_cold_2();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53_cold_3();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_fetchCertificateDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "aa_URLWithEndpoint:", @"qualifyCert");
  session = self->_session;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__AAAbsintheSigner__fetchCertificateDataWithCompletion___block_invoke;
  v9[3] = &unk_1E5A48948;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(AAURLSession *)session dataTaskWithURL:v5 completion:v9];
  [v8 resume];
}

void __56__AAAbsintheSigner__fetchCertificateDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __56__AAAbsintheSigner__fetchCertificateDataWithCompletion___block_invoke_cold_1();
  }

  if (v8)
  {
    objc_opt_class();
    id v11 = v8;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if ([v12 statusCode] == 200)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (v7)
      {
        (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v7, 0);
LABEL_16:

        goto LABEL_17;
      }
      BOOL v16 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -4402, v9);
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v16);
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 32);
      BOOL v16 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -4402, v9);
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }

    goto LABEL_16;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4402);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v12);
    goto LABEL_16;
  }
  (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v9);
LABEL_17:
}

- (void)_fetchSessionInfoWithRequestInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = a3;
  id v9 = objc_msgSend(v7, "aa_URLWithEndpoint:", @"qualifySession");
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v9];
  id v11 = [v8 base64EncodedStringWithOptions:0];

  [v10 setValue:v11 forHTTPHeaderField:@"X-MMe-Nas-Session"];
  session = self->_session;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__AAAbsintheSigner__fetchSessionInfoWithRequestInfo_completion___block_invoke;
  v15[3] = &unk_1E5A48970;
  id v16 = v6;
  id v13 = v6;
  uint64_t v14 = [(AAURLSession *)session bodyTaskWithRequest:v10 completion:v15];
  [v14 resume];
}

void __64__AAAbsintheSigner__fetchSessionInfoWithRequestInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __64__AAAbsintheSigner__fetchSessionInfoWithRequestInfo_completion___block_invoke_cold_1();
  }

  objc_opt_class();
  id v11 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_8:
    uint64_t v14 = *(void *)(a1 + 32);
    if (v9)
    {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v9);
    }
    else
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4402);
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
    goto LABEL_18;
  }
  if (!v11) {
    goto LABEL_8;
  }
  objc_opt_class();
  id v12 = [v11 objectForKeyedSubscript:@"session-info"];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v13)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
    uint64_t v17 = *(void *)(a1 + 32);
    if (v16)
    {
      (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v16, 0);
    }
    else
    {
      id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -4402, v9);
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v19);
    }
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 32);
    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -4402, v9);
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v16);
  }

LABEL_18:
}

- (double)cacheTimeout
{
  return self->_cacheTimeout;
}

- (AAURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_contextCache, 0);
  objc_storeStrong((id *)&self->_contextTimerSource, 0);

  objc_storeStrong((id *)&self->_contextQueue, 0);
}

- (void)_contextLock_contextInvalidatingIfNecessary
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "NAC context expired, clearing context...", v2, v3, v4, v5, v6);
}

void __54__AAAbsintheSigner__contextLock_enqueueContextCleanup__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "NAC timer fired, clearing context...", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "Successfully initialized NAC session", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to initialize NAC session, error: %@", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A11D8000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch certificate with error with invalid server response", v1, 2u);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch certificate with error: %@", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch request info %@", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "Successfully fetched request info", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_52_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "Successfully fetched certificate", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch session info with error: %@", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "Successfully established key!", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to establish key with error: %@", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_53_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "Successfully fetched session info", v2, v3, v4, v5, v6);
}

void __56__AAAbsintheSigner__fetchCertificateDataWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Certificate fetch responded with %@ - %@");
}

void __64__AAAbsintheSigner__fetchSessionInfoWithRequestInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Session fetch responded with %@ - %@");
}

@end