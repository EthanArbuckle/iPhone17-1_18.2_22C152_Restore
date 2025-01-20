@interface BBLocalDataProvider
+ (id)dataProviderWithDataProvider:(id)a3 serverQueue:(id)a4;
+ (id)dataProviderWithPrincipalClass:(Class)a3 serverQueue:(id)a4 initializationCompletion:(id)a5;
- (BBDataProvider)dataProvider;
- (BBLocalDataProvider)initWithDataProvider:(id)a3 serverQueue:(id)a4;
- (BBLocalDataProvider)initWithPrincipalClass:(Class)a3 serverQueue:(id)a4 initializationCompletion:(id)a5;
- (BOOL)canPerformMigration;
- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4;
- (id)_bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4;
- (id)_doSynchronousRemoteRequest:(id)a3 conditionalOn:(id)a4;
- (id)_initWithDataProvider:(id)a3 sectionID:(id)a4 serverQueue:(id)a5 initializationCompletion:(id)a6;
- (id)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4;
- (id)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4;
- (void)_doAsynchronousRemoteRequest:(id)a3 conditionalOn:(id)a4 completion:(id)a5;
- (void)_ping;
- (void)_watchdogFired;
- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5;
- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5;
- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4;
- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6;
- (void)dataProviderDidLoad;
- (void)dealloc;
- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4;
- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5;
- (void)invalidate;
- (void)noteSectionInfoDidChange:(id)a3;
- (void)reloadIdentityWithCompletion:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)startWatchdog;
- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5;
@end

@implementation BBLocalDataProvider

+ (id)dataProviderWithPrincipalClass:(Class)a3 serverQueue:(id)a4 initializationCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithPrincipalClass:a3 serverQueue:v9 initializationCompletion:v8];

  return v10;
}

+ (id)dataProviderWithDataProvider:(id)a3 serverQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithDataProvider:v7 serverQueue:v6];

  return v8;
}

- (id)_initWithDataProvider:(id)a3 sectionID:(id)a4 serverQueue:(id)a5 initializationCompletion:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v14)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_11:
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"BBDataProvider.m", 544, @"Invalid parameter not satisfying: %@", @"sectionID != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"BBDataProvider.m", 543, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_11;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_12:
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"BBDataProvider.m", 545, @"Invalid parameter not satisfying: %@", @"dataProvider != nil" object file lineNumber description];

LABEL_4:
  v16 = [(BBLocalDataProvider *)self init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_localQueue, a5);
    objc_storeStrong((id *)&v17->_dataProvider, a3);
    id v18 = [NSString stringWithFormat:@"BBDataProviderQueue:%@", v13];
    v19 = (const char *)[v18 UTF8String];
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
    remoteQueue = v17->_remoteQueue;
    v17->_remoteQueue = (OS_dispatch_queue *)v21;

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke;
    v35[3] = &unk_264295E50;
    v23 = v17;
    v36 = v23;
    id v37 = v12;
    v24 = (void *)MEMORY[0x21D44A270](v35);
    v25 = v24;
    v26 = v17->_remoteQueue;
    if (v15)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke_2;
      block[3] = &unk_264297228;
      id v33 = v24;
      v32 = v23;
      id v34 = v15;
      dispatch_async(v26, block);
    }
    else
    {
      dispatch_sync(v26, v24);
    }
  }
  return v17;
}

void __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = +[BBDataProviderIdentity identityForDataProvider:*(void *)(a1 + 40)];
  [v1 setIdentity:v2];
}

void __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke_3;
  block[3] = &unk_264296288;
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BBLocalDataProvider)initWithDataProvider:(id)a3 serverQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 sectionIdentifier];
  id v9 = [(BBLocalDataProvider *)self _initWithDataProvider:v7 sectionID:v8 serverQueue:v6 initializationCompletion:0];

  return v9;
}

- (BBLocalDataProvider)initWithPrincipalClass:(Class)a3 serverQueue:(id)a4 initializationCompletion:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_11:
    v17 = @"<null>";
    goto LABEL_12;
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"BBDataProvider.m", 576, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

  if (!a3) {
    goto LABEL_11;
  }
LABEL_3:
  if (([(objc_class *)a3 conformsToProtocol:&unk_26C7C3038] & 1) == 0)
  {
    NSStringFromClass(a3);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    NSLog(&cfstr_Bbdataprovider_18.isa, v17);

    v22 = 0;
    goto LABEL_13;
  }
  v11 = [MEMORY[0x263EFF910] date];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__11;
  v46 = __Block_byref_object_dispose__11;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__11;
  v40 = __Block_byref_object_dispose__11;
  id v41 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__11;
  v34[4] = __Block_byref_object_dispose__11;
  id v35 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__BBLocalDataProvider_initWithPrincipalClass_serverQueue_initializationCompletion___block_invoke;
  block[3] = &unk_264297250;
  v30 = v34;
  v31 = &v36;
  v32 = &v42;
  Class v33 = a3;
  id v14 = self;
  v26 = v14;
  id v27 = v9;
  id v29 = v10;
  id v15 = v12;
  v28 = v15;
  dispatch_async(v13, block);

  dispatch_time_t v16 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v15, v16)) {
    BBIsInternalDevice();
  }
  id v18 = (id)BBLogGeneral;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v37[5];
    [v11 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    uint64_t v49 = v19;
    __int16 v50 = 2048;
    double v51 = -v20;
    _os_log_impl(&dword_217675000, v18, OS_LOG_TYPE_DEFAULT, "BBDataProvider: provider <%{public}@> loaded in %.2f sec", buf, 0x16u);
  }

  id v21 = (id)v43[5];
  v22 = (BBLocalDataProvider *)v21;

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
LABEL_13:

  return v22;
}

intptr_t __83__BBLocalDataProvider_initWithPrincipalClass_serverQueue_initializationCompletion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(*(Class *)(a1 + 88));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) sectionIdentifier];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [*(id *)(a1 + 32) _initWithDataProvider:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) sectionID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) serverQueue:*(void *)(a1 + 40) initializationCompletion:*(void *)(a1 + 56)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  dispatch_semaphore_t v12 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v12);
}

void __83__BBLocalDataProvider_initWithPrincipalClass_serverQueue_initializationCompletion___block_invoke_420(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    NSLog(&cfstr_Exiting.isa, v2, v3);
    exit(1);
  }
}

- (void)dealloc
{
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    dispatch_source_cancel(watchdogTimer);
    id v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)BBLocalDataProvider;
  [(BBLocalDataProvider *)&v5 dealloc];
}

- (void)invalidate
{
  self->_invalidated = 1;
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    dispatch_source_cancel(watchdogTimer);
    id v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;
  }
}

- (void)_ping
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  remoteQueue = self->_remoteQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__BBLocalDataProvider__ping__block_invoke;
  block[3] = &unk_264295E50;
  objc_super v5 = v3;
  uint64_t v10 = v5;
  v11 = self;
  dispatch_async(remoteQueue, block);
  dispatch_time_t v6 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    localQueue = self->_localQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__BBLocalDataProvider__ping__block_invoke_3;
    v8[3] = &unk_264295E28;
    v8[4] = self;
    dispatch_async(localQueue, v8);
  }
}

void __28__BBLocalDataProvider__ping__block_invoke(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  dispatch_semaphore_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__BBLocalDataProvider__ping__block_invoke_2;
  block[3] = &unk_264295E28;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __28__BBLocalDataProvider__ping__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 0;
    id v2 = [*(id *)(a1 + 32) sectionIdentifier];
    NSLog(&cfstr_BbserverDataPr.isa, v2);
  }
}

uint64_t __28__BBLocalDataProvider__ping__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 48))
  {
    uint64_t v1 = result;
    result = BSIsBeingDebugged();
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(v1 + 32) + 48) = 1;
      id v2 = *(void **)(v1 + 32);
      return [v2 _watchdogFired];
    }
  }
  return result;
}

- (void)_watchdogFired
{
}

- (void)startWatchdog
{
  if (!self->_watchdogTimer)
  {
    dispatch_semaphore_t v3 = dispatch_get_global_queue(0, 0);
    id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
    watchdogTimer = self->_watchdogTimer;
    self->_watchdogTimer = v4;

    dispatch_time_t v6 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer((dispatch_source_t)self->_watchdogTimer, v6, 0x45D964B800uLL, 0x3B9ACA00uLL);
    uint64_t v7 = self->_watchdogTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __36__BBLocalDataProvider_startWatchdog__block_invoke;
    handler[3] = &unk_264295E28;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_watchdogTimer);
  }
}

uint64_t __36__BBLocalDataProvider_startWatchdog__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 48))
  {
    uint64_t v1 = result;
    result = BSIsBeingDebugged();
    if ((result & 1) == 0)
    {
      id v2 = *(void **)(v1 + 32);
      return [v2 _ping];
    }
  }
  return result;
}

- (void)dataProviderDidLoad
{
  remoteQueue = self->_remoteQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__BBLocalDataProvider_dataProviderDidLoad__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(remoteQueue, block);
}

void __42__BBLocalDataProvider_dataProviderDidLoad__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 32) _setDataProviderQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  }
  id v2 = [*(id *)(a1 + 32) identity];
  char v3 = [v2 traits];

  if ((v3 & 2) != 0)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 32);
    [v4 dataProviderDidLoad];
  }
}

- (id)_doSynchronousRemoteRequest:(id)a3 conditionalOn:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(void))a4;
  if (v7[2]())
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__11;
    v24 = __Block_byref_object_dispose__11;
    id v25 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    remoteQueue = self->_remoteQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__BBLocalDataProvider__doSynchronousRemoteRequest_conditionalOn___block_invoke;
    block[3] = &unk_264297278;
    uint64_t v19 = &v20;
    id v18 = v6;
    uint64_t v10 = v8;
    v17 = v10;
    dispatch_async(remoteQueue, block);
    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      dispatch_semaphore_t v12 = [(BBDataProvider *)self sectionIdentifier];
      NSLog(&cfstr_SynchronousReq.isa, v12, 5);

      id v13 = 0;
    }
    else
    {
      id v13 = (void *)v21[5];
    }
    id v14 = v13;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

intptr_t __65__BBLocalDataProvider__doSynchronousRemoteRequest_conditionalOn___block_invoke(void *a1)
{
  uint64_t v2 = (*(void (**)(void))(a1[5] + 16))();
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_super v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

- (void)_doAsynchronousRemoteRequest:(id)a3 conditionalOn:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  char v10 = (*((uint64_t (**)(id))a4 + 2))(a4);
  if (v8 && (v10 & 1) != 0)
  {
    remoteQueue = self->_remoteQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__BBLocalDataProvider__doAsynchronousRemoteRequest_conditionalOn_completion___block_invoke;
    block[3] = &unk_2642972C8;
    id v13 = v8;
    id v14 = v9;
    void block[4] = self;
    dispatch_async(remoteQueue, block);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __77__BBLocalDataProvider__doAsynchronousRemoteRequest_conditionalOn_completion___block_invoke(void *a1)
{
  uint64_t v2 = (*(void (**)(void))(a1[5] + 16))();
  uint64_t v3 = (void *)a1[6];
  if (v3)
  {
    uint64_t v4 = a1[4];
    objc_super v5 = *(NSObject **)(v4 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__BBLocalDataProvider__doAsynchronousRemoteRequest_conditionalOn_completion___block_invoke_2;
    block[3] = &unk_2642972A0;
    void block[4] = v4;
    id v8 = v3;
    id v7 = v2;
    dispatch_async(v5, block);
  }
}

void *__77__BBLocalDataProvider__doAsynchronousRemoteRequest_conditionalOn_completion___block_invoke_2(void *result)
{
  if (!*(unsigned char *)(result[4] + 49)) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16))(result[6], result[5]);
  }
  return result;
}

- (id)_bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBDataProvider *)self identity];
  if (([v8 traits] & 4) != 0)
  {
    uint64_t v10 = [(BBDataProvider *)self->_dataProvider bulletinsWithRequestParameters:v6 lastCleared:v7];
LABEL_5:
    id v9 = (void *)v10;
    goto LABEL_6;
  }
  if (([v6 publisherDestination] & 2) == 0)
  {
LABEL_3:
    id v9 = 0;
    goto LABEL_6;
  }
  if (([v8 traits] & 0x10) == 0)
  {
    if (([v8 traits] & 8) == 0) {
      goto LABEL_3;
    }
    uint64_t v10 = -[BBDataProvider bulletinsFilteredBy:count:lastCleared:](self->_dataProvider, "bulletinsFilteredBy:count:lastCleared:", 0, [v6 maximumCount], v7);
    goto LABEL_5;
  }
  dataProvider = self->_dataProvider;
  id v13 = [v6 enabledSectionIDs];
  id v9 = -[BBDataProvider bulletinsFilteredBy:enabledSectionIDs:count:lastCleared:](dataProvider, "bulletinsFilteredBy:enabledSectionIDs:count:lastCleared:", 0, v13, [v6 maximumCount], v7);

LABEL_6:
  return v9;
}

- (id)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared___block_invoke;
  v12[3] = &unk_2642972F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = [(BBLocalDataProvider *)self _doSynchronousRemoteRequest:v12 conditionalOn:&__block_literal_global_457];

  return v10;
}

uint64_t __66__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bulletinsWithRequestParameters:*(void *)(a1 + 40) lastCleared:*(void *)(a1 + 48)];
}

uint64_t __66__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared___block_invoke_2()
{
  return 1;
}

- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke;
  v12[3] = &unk_2642972F0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(BBLocalDataProvider *)self _doAsynchronousRemoteRequest:v12 conditionalOn:&__block_literal_global_459 completion:a5];
}

uint64_t __77__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bulletinsWithRequestParameters:*(void *)(a1 + 40) lastCleared:*(void *)(a1 + 48)];
}

uint64_t __77__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2()
{
  return 1;
}

- (id)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBDataProvider *)self identity];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo___block_invoke;
  v16[3] = &unk_264297338;
  id v17 = v8;
  id v18 = self;
  id v19 = v6;
  id v20 = v7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo___block_invoke_2;
  v14[3] = &unk_264297360;
  id v15 = v17;
  id v9 = v17;
  id v10 = v7;
  id v11 = v6;
  dispatch_semaphore_t v12 = [(BBLocalDataProvider *)self _doSynchronousRemoteRequest:v16 conditionalOn:v14];

  return v12;
}

id __63__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) traits] & 0x20) != 0)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) clearedInfoForBulletins:*(void *)(a1 + 48) lastClearedInfo:*(void *)(a1 + 56)];
  }
  else if (([*(id *)(a1 + 32) traits] & 0x100) != 0)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) clearedInfoForBulletins:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

uint64_t __63__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) traits] & 0x20) != 0) {
    return 1;
  }
  else {
    return ([*(id *)(a1 + 32) traits] >> 8) & 1;
  }
}

- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BBDataProvider *)self identity];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke;
  v17[3] = &unk_264297338;
  id v18 = v11;
  id v19 = self;
  id v20 = v8;
  id v21 = v9;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2;
  v15[3] = &unk_264297360;
  id v16 = v18;
  id v12 = v18;
  id v13 = v9;
  id v14 = v8;
  [(BBLocalDataProvider *)self _doAsynchronousRemoteRequest:v17 conditionalOn:v15 completion:v10];
}

id __74__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) traits] & 0x20) != 0)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) clearedInfoForBulletins:*(void *)(a1 + 48) lastClearedInfo:*(void *)(a1 + 56)];
  }
  else if (([*(id *)(a1 + 32) traits] & 0x100) != 0)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) clearedInfoForBulletins:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

uint64_t __74__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) traits] & 0x20) != 0) {
    return 1;
  }
  else {
    return ([*(id *)(a1 + 32) traits] >> 8) & 1;
  }
}

- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBDataProvider *)self identity];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__BBLocalDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke;
  v13[3] = &unk_264297388;
  v13[4] = self;
  id v14 = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__BBLocalDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2;
  v11[3] = &unk_264297360;
  id v12 = v8;
  id v9 = v8;
  id v10 = v6;
  [(BBLocalDataProvider *)self _doAsynchronousRemoteRequest:v13 conditionalOn:v11 completion:v7];
}

uint64_t __88__BBLocalDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) clearedInfoForClearingAllBulletinsWithLastClearedInfo:*(void *)(a1 + 40)];
}

uint64_t __88__BBLocalDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return ([*(id *)(a1 + 32) traits] >> 6) & 1;
}

- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(BBDataProvider *)self identity];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __97__BBLocalDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke;
  v21[3] = &unk_264297338;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __97__BBLocalDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2;
  v19[3] = &unk_264297360;
  id v20 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(BBLocalDataProvider *)self _doAsynchronousRemoteRequest:v21 conditionalOn:v19 completion:v13];
}

uint64_t __97__BBLocalDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 32) clearedInfoForClearingBulletinsFromDate:a1[5] toDate:a1[6] lastClearedInfo:a1[7]];
}

uint64_t __97__BBLocalDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return ([*(id *)(a1 + 32) traits] >> 6) & 1;
}

- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__BBLocalDataProvider_updateClearedInfoWithClearedInfo_handler_completion___block_invoke;
  v14[3] = &unk_2642973B0;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__BBLocalDataProvider_updateClearedInfoWithClearedInfo_handler_completion___block_invoke_2;
  v12[3] = &unk_2642973D8;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(BBLocalDataProvider *)self _doAsynchronousRemoteRequest:v14 conditionalOn:v12 completion:a5];
}

uint64_t __75__BBLocalDataProvider_updateClearedInfoWithClearedInfo_handler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

BOOL __75__BBLocalDataProvider_updateClearedInfoWithClearedInfo_handler_completion___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32) != 0;
}

- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__BBLocalDataProvider_updateSectionInfoWithSectionInfo_handler_completion___block_invoke;
  v14[3] = &unk_2642973B0;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__BBLocalDataProvider_updateSectionInfoWithSectionInfo_handler_completion___block_invoke_2;
  v12[3] = &unk_2642973D8;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(BBLocalDataProvider *)self _doAsynchronousRemoteRequest:v14 conditionalOn:v12 completion:a5];
}

uint64_t __75__BBLocalDataProvider_updateSectionInfoWithSectionInfo_handler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

BOOL __75__BBLocalDataProvider_updateSectionInfoWithSectionInfo_handler_completion___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32) != 0;
}

- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [v9 actionForResponse:v8];
  id v12 = [(BBDataProvider *)self identity];
  id v13 = [v11 internalBlock];
  if (v13 || ([v12 traits] & 0x100000) != 0) {
    unsigned int v14 = 1;
  }
  else {
    unsigned int v14 = ([v12 traits] >> 21) & 1;
  }

  if (!v11 || !v14)
  {
    id v16 = (void *)BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    {
      id v19 = v16;
      *(_DWORD *)buf = 138543874;
      id v29 = (id)objc_opt_class();
      __int16 v30 = 2114;
      v31 = v11;
      __int16 v32 = 1024;
      unsigned int v33 = v14;
      id v20 = v29;
      _os_log_error_impl(&dword_217675000, v19, OS_LOG_TYPE_ERROR, "%{public}@ could not deliver response for action %{public}@\tcanDeliver=%d", buf, 0x1Cu);

      if (!v10) {
        goto LABEL_15;
      }
    }
    else if (!v10)
    {
      goto LABEL_15;
    }
    v10[2](v10, 0);
    goto LABEL_15;
  }
  if (([v12 traits] & 0x100000) != 0 || (objc_msgSend(v12, "traits") & 0x200000) != 0)
  {
    id v15 = +[BBActionResponse actionResponseForResponse:v8 bulletinRequest:v9];
  }
  else
  {
    id v15 = 0;
  }
  remoteQueue = self->_remoteQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __73__BBLocalDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke;
  v21[3] = &unk_264297400;
  id v22 = v11;
  id v23 = v8;
  id v24 = v15;
  id v25 = v12;
  v26 = self;
  id v27 = v10;
  id v18 = v15;
  dispatch_async(remoteQueue, v21);

LABEL_15:
}

uint64_t __73__BBLocalDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) deliverResponse:*(void *)(a1 + 40)];
  if (v2) {
    goto LABEL_2;
  }
  if (*(void *)(a1 + 48))
  {
    if (([*(id *)(a1 + 56) traits] & 0x200000) != 0)
    {
      [*(id *)(*(void *)(a1 + 64) + 32) handleBulletinActionResponse:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 72)];
    }
    else if (([*(id *)(a1 + 56) traits] & 0x100000) != 0)
    {
      [*(id *)(*(void *)(a1 + 64) + 32) handleBulletinActionResponse:*(void *)(a1 + 48)];
LABEL_2:
      uint64_t v3 = 1;
      goto LABEL_9;
    }
  }
  uint64_t v3 = 0;
LABEL_9:
  uint64_t v4 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = v4;
    id v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138544130;
    id v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = v3;
    __int16 v16 = 1024;
    int v17 = v2;
    id v8 = v6;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ delivered response for action %{public}@ with success=%d; delivered=%d",
      (uint8_t *)&v10,
      0x22u);
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (BOOL)canPerformMigration
{
  int v2 = [(BBDataProvider *)self identity];
  unsigned int v3 = ([v2 traits] >> 13) & 1;

  return v3;
}

- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBDataProvider *)self identity];
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (([v8 traits] & 0x2000) != 0)
  {
    remoteQueue = self->_remoteQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__BBLocalDataProvider_migrateSectionInfo_oldSectionInfo___block_invoke;
    v12[3] = &unk_264297428;
    int v15 = &v16;
    void v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_sync(remoteQueue, v12);
  }
  char v10 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __57__BBLocalDataProvider_migrateSectionInfo_oldSectionInfo___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 32) migrateSectionInfo:a1[5] oldSectionInfo:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (void)reloadIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke;
  v8[3] = &unk_264297450;
  v8[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke_3;
  v6[3] = &unk_264297478;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBLocalDataProvider *)self _doAsynchronousRemoteRequest:v8 conditionalOn:&__block_literal_global_462 completion:v6];
}

id __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke(uint64_t a1)
{
  return +[BBDataProviderIdentity identityForDataProvider:*(void *)(*(void *)(a1 + 32) + 32)];
}

uint64_t __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke_2()
{
  return 1;
}

void __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  if (v3)
  {
    [v4 setIdentity:v3];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
  else
  {
    NSLog(&cfstr_Bbdataprovider_20.isa, v4);
  }
}

- (void)noteSectionInfoDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BBDataProvider *)self identity];
  if (([v5 traits] & 0x40000) != 0)
  {
    remoteQueue = self->_remoteQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__BBLocalDataProvider_noteSectionInfoDidChange___block_invoke;
    v7[3] = &unk_264295E50;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(remoteQueue, v7);
  }
}

uint64_t __48__BBLocalDataProvider_noteSectionInfoDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) noteSectionInfoDidChange:*(void *)(a1 + 40)];
}

- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBDataProvider *)self identity];
  if (([v8 traits] & 0x20000) != 0)
  {
    remoteQueue = self->_remoteQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__BBLocalDataProvider_deliverMessageWithName_userInfo___block_invoke;
    block[3] = &unk_264296418;
    void block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(remoteQueue, block);
  }
  else
  {
    id v9 = [(BBDataProvider *)self sectionIdentifier];
    NSLog(&cfstr_Bbdataprovider_21.isa, v9);
  }
}

uint64_t __55__BBLocalDataProvider_deliverMessageWithName_userInfo___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 32) receiveMessageWithName:a1[5] userInfo:a1[6]];
}

- (BBDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_remoteQueue, 0);
  objc_storeStrong((id *)&self->_localQueue, 0);
}

@end