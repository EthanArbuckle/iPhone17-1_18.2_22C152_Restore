@interface IPProgressServer
+ (id)defaultAccessAdjudicator;
+ (id)defaultBehavior;
- (BOOL)serverBehavior:(id)a3 shouldAcceptConnection:(id)a4;
- (IPProgressServer)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (IPProgressServer)initWithDelegate:(id)a3 delegateQueue:(id)a4 accessAdjudicator:(id)a5 behavior:(id)a6;
- (IPProgressServerDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (id)_progressForIdentity:(id)a3 createIfMissing:(BOOL)a4;
- (id)_queue_progressForIdentity:(id)a3 createIfMissing:(BOOL)a4;
- (id)activeInstallationsForBehavior:(id)a3;
- (id)initiateProgressForIdentity:(id)a3;
- (id)resumeProgressForIdentity:(id)a3;
- (id)serverBehavior:(id)a3 progressForIdentity:(id)a4 error:(id *)a5;
- (void)_queue_removePublishedProgress:(id)a3;
- (void)identityProgress:(id)a3 didChangeProgressData:(id)a4;
- (void)identityProgress:(id)a3 didFinishWithState:(unint64_t)a4;
- (void)identityWasUninstalled:(id)a3;
- (void)resume;
- (void)serverBehavior:(id)a3 acceptedClient:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
@end

@implementation IPProgressServer

+ (id)defaultBehavior
{
  if (defaultBehavior_onceToken != -1) {
    dispatch_once(&defaultBehavior_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)defaultBehavior_sharedBehavior;

  return v2;
}

uint64_t __35__IPProgressServer_defaultBehavior__block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    v8 = +[IPServerXPCTransport defaultXPCTransport];
    v0 = [IPXPCEventStateUpdateStream alloc];
    v1 = [v8 serviceQueue];
    v2 = [(IPXPCEventStateUpdateStream *)v0 initWithStreamName:@"com.apple.InstallProgress.events" queue:v1];

    v3 = [IPProgressServerDefaultBehavior alloc];
    v4 = [(IPXPCEventStateUpdateStream *)v2 sink];
    uint64_t v5 = [(IPProgressServerDefaultBehavior *)v3 initWithTransport:v8 stateUpdateSink:v4];
    v6 = (void *)defaultBehavior_sharedBehavior;
    defaultBehavior_sharedBehavior = v5;
  }
  else
  {
    defaultBehavior_sharedBehavior = [[IPProgressStubBehavior alloc] initWithEventStreamName:@"com.apple.InstallProgress.events"];
  }

  return MEMORY[0x270F9A758]();
}

+ (id)defaultAccessAdjudicator
{
  if (defaultAccessAdjudicator_onceToken != -1) {
    dispatch_once(&defaultAccessAdjudicator_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)defaultAccessAdjudicator_sharedAdjudicator;

  return v2;
}

uint64_t __44__IPProgressServer_defaultAccessAdjudicator__block_invoke()
{
  defaultAccessAdjudicator_sharedAdjudicator = objc_alloc_init(IPProductionAccessAdjudicator);

  return MEMORY[0x270F9A758]();
}

- (IPProgressServer)initWithDelegate:(id)a3 delegateQueue:(id)a4 accessAdjudicator:(id)a5 behavior:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IPProgressServer;
  v14 = [(IPProgressServer *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v13 queue];
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    activeProgresses = v14->_activeProgresses;
    v14->_activeProgresses = v17;

    [(IPProgressServer *)v14 setDelegate:v10];
    [(IPProgressServer *)v14 setDelegateQueue:v11];
    objc_storeStrong((id *)&v14->_behavior, a6);
    [(IPProgressServerBehavior *)v14->_behavior setDelegate:v14];
    objc_storeStrong((id *)&v14->_accessAdjudicator, a5);
  }

  return v14;
}

- (IPProgressServer)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[IPProgressServer defaultAccessAdjudicator];
  v9 = +[IPProgressServer defaultBehavior];
  id v10 = [(IPProgressServer *)self initWithDelegate:v7 delegateQueue:v6 accessAdjudicator:v8 behavior:v9];

  return v10;
}

- (id)_queue_progressForIdentity:(id)a3 createIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [(NSMutableDictionary *)self->_activeProgresses objectForKey:v6];

  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    v9 = [[IPPublishedIdentityProgress alloc] initWithAppIdentity:v6 observer:self];
    [(NSMutableDictionary *)self->_activeProgresses setObject:v9 forKey:v6];
  }
  id v10 = [(NSMutableDictionary *)self->_activeProgresses objectForKey:v6];

  return v10;
}

- (void)_queue_removePublishedProgress:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  activeProgresses = self->_activeProgresses;
  id v7 = [v5 miIdentity];

  [(NSMutableDictionary *)activeProgresses removeObjectForKey:v7];
}

- (id)_progressForIdentity:(id)a3 createIfMissing:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__IPProgressServer__progressForIdentity_createIfMissing___block_invoke;
  v11[3] = &unk_26538FB78;
  id v12 = v6;
  id v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __57__IPProgressServer__progressForIdentity_createIfMissing___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_progressForIdentity:createIfMissing:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

  return MEMORY[0x270F9A758]();
}

- (id)initiateProgressForIdentity:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _IPServerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_252AA9000, v5, OS_LOG_TYPE_DEFAULT, "initiating progress for %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__IPProgressServer_initiateProgressForIdentity___block_invoke;
  block[3] = &unk_26538FA20;
  id v11 = v4;
  p_long long buf = &buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __48__IPProgressServer_initiateProgressForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_progressForIdentity:createIfMissing:", *(void *)(a1 + 40), 1);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) lsIdentity];
  if (*(void *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 24) progressForIdentityInitiated:v5];
  }
  else
  {
    id v6 = _IPServerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48__IPProgressServer_initiateProgressForIdentity___block_invoke_cold_1();
    }
  }
}

- (id)resumeProgressForIdentity:(id)a3
{
  return [(IPProgressServer *)self _progressForIdentity:a3 createIfMissing:1];
}

- (void)identityWasUninstalled:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__IPProgressServer_identityWasUninstalled___block_invoke;
  v7[3] = &unk_26538F700;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __43__IPProgressServer_identityWasUninstalled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = 0;
  uint64_t v3 = IPLSIdentityFromMIIdentity(v2, &v6);
  id v4 = v6;
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 40) + 24) identityWasUninstalled:v3];
  }
  else
  {
    id v5 = _IPDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __43__IPProgressServer_identityWasUninstalled___block_invoke_cold_1();
    }
  }
}

- (void)resume
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    behavior = self->_behavior;
    *(_DWORD *)long long buf = 138412290;
    id v8 = behavior;
    _os_log_impl(&dword_252AA9000, v3, OS_LOG_TYPE_DEFAULT, "Starting progress server with behavior %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__IPProgressServer_resume__block_invoke;
  block[3] = &unk_26538F930;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __26__IPProgressServer_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) resume];
}

- (BOOL)serverBehavior:(id)a3 shouldAcceptConnection:(id)a4
{
  return [(IPAccessAdjudicator *)self->_accessAdjudicator progressServer:self shouldAcceptConnection:a4];
}

- (void)serverBehavior:(id)a3 acceptedClient:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = _IPServerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_252AA9000, v5, OS_LOG_TYPE_DEFAULT, "new client %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)activeInstallationsForBehavior:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_activeProgresses;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        id v18 = 0;
        id v11 = IPLSIdentityFromMIIdentity(v10, &v18);
        id v12 = v18;
        if (v10)
        {
          id v13 = [[IPInstallableStateData alloc] initWithIdentity:v11 isInstalling:1];
          [v4 addObject:v13];
        }
        else
        {
          _IPDefaultLog();
          id v13 = (IPInstallableStateData *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
          {
            id v17 = [0 bundleID];
            uint64_t v14 = [0 personaUniqueString];
            *(_DWORD *)long long buf = 138412802;
            v24 = v17;
            __int16 v25 = 2112;
            uint64_t v26 = v14;
            uint64_t v15 = (void *)v14;
            __int16 v27 = 2112;
            id v28 = v12;
            _os_log_error_impl(&dword_252AA9000, &v13->super, OS_LOG_TYPE_ERROR, "could not find identity for %@/%@: %@", buf, 0x20u);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)serverBehavior:(id)a3 progressForIdentity:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = self->_activeProgresses;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      uint64_t v14 = IPLSIdentityFromMIIdentity(v13, 0);
      if ([v14 isEqual:v7]) {
        break;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v15 = [(NSMutableDictionary *)self->_activeProgresses objectForKey:v13];
    v16 = [v15 currentProgress];

    if (!v16) {
      goto LABEL_12;
    }
    id v17 = 0;
  }
  else
  {
LABEL_9:

LABEL_12:
    id v25 = 0;
    id v18 = [v7 findApplicationRecordFetchingPlaceholder:2 error:&v25];
    id v17 = v25;
    if (v18 && ([v18 isPlaceholder] & 1) == 0)
    {
      v16 = objc_alloc_init(IPInstallableProgressData);
      [(IPInstallableProgressData *)v16 setInstallPhase:6];
      [(IPInstallableProgressData *)v16 setFinalPhase:3];
      v34[0] = &unk_2702FDC50;
      v34[1] = &unk_2702FDC80;
      v35[0] = &unk_2702FDC68;
      v35[1] = &unk_2702FDC68;
      v23 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
      [(IPInstallableProgressData *)v16 setTotalUnitCountsForPhases:v23];

      [(IPInstallableProgressData *)v16 setCompletedUnitCount:10 forPhase:2];
      [(IPInstallableProgressData *)v16 setCompletedUnitCount:10 forPhase:3];
    }
    else
    {
      int v19 = [v18 isPlaceholder];
      long long v20 = _IPServerLog();
      long long v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v33 = v7;
          _os_log_impl(&dword_252AA9000, v21, OS_LOG_TYPE_DEFAULT, "asked for progress for identity %@ for which we do not have active progress but a placeholder exists. Returning a resonable ersatz progress.", buf, 0xCu);
        }

        v16 = objc_alloc_init(IPInstallableProgressData);
        [(IPInstallableProgressData *)v16 setInstallPhase:2];
        [(IPInstallableProgressData *)v16 setFinalPhase:3];
        v30[0] = &unk_2702FDC50;
        v30[1] = &unk_2702FDC80;
        v31[0] = &unk_2702FDC68;
        v31[1] = &unk_2702FDC68;
        long long v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
        [(IPInstallableProgressData *)v16 setTotalUnitCountsForPhases:v22];
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[IPProgressServer serverBehavior:progressForIdentity:error:]((uint64_t)v7, (uint64_t)v17, v21);
        }

        v16 = 0;
      }
    }

    if (a5 && !v16)
    {
      id v17 = v17;
      *a5 = v17;
    }
  }

  return v16;
}

- (void)identityProgress:(id)a3 didChangeProgressData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__IPProgressServer_identityProgress_didChangeProgressData___block_invoke;
  block[3] = &unk_26538FAB8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __59__IPProgressServer_identityProgress_didChangeProgressData___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lsIdentity];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 40) + 24) progressForIdentity:v2 changed:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v3 = _IPServerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__IPProgressServer_identityProgress_didChangeProgressData___block_invoke_cold_1();
    }
  }
}

- (void)identityProgress:(id)a3 didFinishWithState:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__IPProgressServer_identityProgress_didFinishWithState___block_invoke;
  block[3] = &unk_26538FAE0;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

void __56__IPProgressServer_identityProgress_didFinishWithState___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_queue_removePublishedProgress:", *(void *)(a1 + 40));
  uint64_t v3 = [*v2 lsIdentity];
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) progressForIdentity:v3 finishedWithState:*(void *)(a1 + 48)];
  }
  else
  {
    id v4 = _IPServerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__IPProgressServer_identityProgress_didFinishWithState___block_invoke_cold_1();
    }
  }
}

- (IPProgressServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IPProgressServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessAdjudicator, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_activeProgresses, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__IPProgressServer_initiateProgressForIdentity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_252AA9000, v0, v1, "published progress %@ had no identity in %s", v2, v3, v4, v5, v6);
}

void __43__IPProgressServer_identityWasUninstalled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v3 = 138412546;
  uint64_t v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = v1;
  _os_log_fault_impl(&dword_252AA9000, v2, OS_LOG_TYPE_FAULT, "could not make LS identity from MI identity %@: %@", (uint8_t *)&v3, 0x16u);
}

- (void)serverBehavior:(uint64_t)a1 progressForIdentity:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_252AA9000, log, OS_LOG_TYPE_ERROR, "asked for progress for totally unknown identity %@: %@", (uint8_t *)&v3, 0x16u);
}

void __59__IPProgressServer_identityProgress_didChangeProgressData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_252AA9000, v0, v1, "published progress %@ had no identity in %s", v2, v3, v4, v5, v6);
}

void __56__IPProgressServer_identityProgress_didFinishWithState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_252AA9000, v0, v1, "published progress %@ had no identity in %s", v2, v3, v4, v5, v6);
}

@end