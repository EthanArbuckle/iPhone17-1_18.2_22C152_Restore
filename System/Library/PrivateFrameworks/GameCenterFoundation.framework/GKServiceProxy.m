@interface GKServiceProxy
- (BOOL)needsBuildUpServiceLookup;
- (GKDaemonProxy)baseProxy;
- (GKPlayerInternal)localPlayer;
- (GKServiceProxy)initWithPlayer:(id)a3;
- (GKThreadsafeDictionary)pendingRequests;
- (NSDictionary)serviceLookup;
- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)requestIdentifierForInvocation:(id)a3;
- (unsigned)serviceGeneration;
- (void)addService:(id)a3 forProtocol:(id)a4 toLookup:(id)a5;
- (void)buildServiceLookupIfNecessary;
- (void)forwardInvocation:(id)a3;
- (void)needsBuildUpServiceLookup;
- (void)replyToDuplicatesForRequest:(id)a3 withInvocation:(id)a4 queue:(id)a5;
- (void)setBaseProxy:(id)a3;
- (void)setLocalPlayer:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)setServiceGeneration:(unsigned int)a3;
- (void)setServiceLookup:(id)a3;
@end

@implementation GKServiceProxy

- (GKServiceProxy)initWithPlayer:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKServiceProxy;
  v5 = [(GKServiceProxy *)&v14 init];
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[GKServiceProxy initWithPlayer:]();
    if (!v5) {
      goto LABEL_11;
    }
  }
  else if (!v5)
  {
    goto LABEL_11;
  }
  v8 = [GKThreadsafeDictionary alloc];
  if (v4)
  {
    v9 = [v4 playerID];
  }
  else
  {
    v9 = @"global";
  }
  v10 = [@"com.apple.gamecenter.pendingRequests-" stringByAppendingString:v9];
  uint64_t v11 = [(GKThreadsafeDictionary *)v8 initWithName:v10];
  pendingRequests = v5->_pendingRequests;
  v5->_pendingRequests = (GKThreadsafeDictionary *)v11;

  if (v4) {
  objc_storeWeak((id *)&v5->_localPlayer, v4);
  }
LABEL_11:

  return v5;
}

- (void)addService:(id)a3 forProtocol:(id)a4 toLookup:(id)a5
{
  id v7 = a3;
  v8 = (Protocol *)a4;
  id v9 = a5;
  if (v7)
  {
    unsigned int outCount = 0;
    v10 = protocol_copyMethodDescriptionList(v8, 1, 1, &outCount);
    uint64_t v11 = v10;
    if (outCount)
    {
      unsigned int v12 = 0;
      p_name = &v10->name;
      do
      {
        objc_super v14 = NSStringFromSelector(*p_name);
        v15 = [v9 objectForKey:v14];

        if (!v15) {
          [v9 setObject:v7 forKey:v14];
        }

        ++v12;
        p_name += 2;
      }
      while (v12 < outCount);
    }
    free(v11);
    v16 = protocol_copyMethodDescriptionList(v8, 0, 1, &outCount);
    v17 = v16;
    if (outCount)
    {
      unsigned int v18 = 0;
      v19 = &v16->name;
      do
      {
        v20 = NSStringFromSelector(*v19);
        v21 = [v9 objectForKey:v20];

        if (!v21) {
          [v9 setObject:v7 forKey:v20];
        }

        ++v18;
        v19 += 2;
      }
      while (v18 < outCount);
    }
    free(v17);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)GKServiceProxy;
  v5 = -[GKServiceProxy methodSignatureForSelector:](&v16, sel_methodSignatureForSelector_);
  if (!v5)
  {
    v6 = NSStringFromSelector(a3);
    id v7 = [(GKServiceProxy *)self baseProxy];
    v8 = [v7 interfaceLookup];
    id v9 = [v8 objectForKeyedSubscript:v6];

    uint64_t v10 = [v9 protocol];
    if (!v10)
    {
      v13 = (void *)MEMORY[0x1E4F1CA00];
      v17 = @"selector";
      v18[0] = v6;
      objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v15 = [v13 exceptionWithName:@"GKNoSuchServiceException" reason:@"Attempted to dispatch a selector which is not recognized by any service" userInfo:v14];

      objc_exception_throw(v15);
    }
    uint64_t v11 = (void *)v10;
    v5 = [(GKServiceProxy *)self methodSignatureForProtocol:v10 selector:a3];
  }

  return v5;
}

- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4
{
  v5 = (Protocol *)a3;
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, a4, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name || (objc_method_description v8 = protocol_getMethodDescription(v5, a4, 0, 1), types = v8.types, v8.name))
  {
    id v9 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_2(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = (const char *)[a1[4] selector];
  v3 = NSStringFromSelector(v2);
  id v4 = [a1[4] _gkReplyHandlerInvocation];
  v5 = [a1[5] serviceLookup];
  v6 = [v5 objectForKey:v3];

  if (v6)
  {
    if (v4)
    {
      id v7 = [a1[5] requestIdentifierForInvocation:a1[4]];
      objc_method_description v8 = (void *)*((void *)a1[5] + 2);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __36__GKServiceProxy_forwardInvocation___block_invoke_3;
      v18[3] = &unk_1E6470528;
      id v19 = v7;
      id v20 = v3;
      id v21 = a1[4];
      id v22 = v4;
      id v23 = a1[6];
      id v9 = v6;
      id v10 = a1[5];
      id v24 = v9;
      id v25 = v10;
      v26 = v2;
      id v11 = v7;
      [v8 writeToDictionary:v18];
    }
    else
    {
      id v15 = [v6 remoteObjectProxy];
      if (!os_log_GKGeneral) {
        id v16 = GKOSLoggers();
      }
      v17 = os_log_GKPerf;
      if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v3;
        _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "Sending one-way request %@", buf, 0xCu);
      }
      [a1[4] _gkInvokeOnceWithTarget:v15];
      [a1[4] _gkClearCopiedArguments];
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    v13 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __36__GKServiceProxy_forwardInvocation___block_invoke_2_cold_1(v13, v2);
    }
    objc_super v14 = [MEMORY[0x1E4F28C58] userErrorForCode:3 underlyingError:0];
    [v4 _gkCallbackWithError:v14 queue:MEMORY[0x1E4F14428]];

    [a1[4] _gkClearCopiedArguments];
  }
}

- (id)requestIdentifierForInvocation:(id)a3
{
  return +[GKRequestIdentifier requestIdentifierForInvocation:a3];
}

- (void)replyToDuplicatesForRequest:(id)a3 withInvocation:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    pendingRequests = self->_pendingRequests;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke;
    v12[3] = &unk_1E6470550;
    id v13 = v8;
    id v14 = v10;
    id v15 = v9;
    [(GKThreadsafeDictionary *)pendingRequests writeToDictionary:v12];
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [(GKServiceProxy *)self buildServiceLookupIfNecessary];
  [v4 _gkCopyArguments];
  v5 = [(GKServiceProxy *)self baseProxy];
  v6 = NSString;
  id v7 = NSStringFromSelector((SEL)[v4 selector]);
  id v8 = [v6 stringWithFormat:@"forwarding %@", v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__GKServiceProxy_forwardInvocation___block_invoke;
  v11[3] = &unk_1E646F558;
  id v12 = v5;
  id v13 = v4;
  id v14 = self;
  id v9 = v4;
  id v10 = v5;
  +[GKActivity named:v8 execute:v11];
}

- (void)buildServiceLookupIfNecessary
{
  if ([(GKServiceProxy *)self needsBuildUpServiceLookup])
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    id v4 = NSString;
    v5 = [MEMORY[0x1E4F29060] callStackSymbols];
    v6 = [v4 stringWithFormat:@"[%@]Building service lookup from stack: %@", v3, v5];

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    id v8 = [(GKServiceProxy *)self baseProxy];
    id v9 = [v8 invocationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke;
    block[3] = &unk_1E646F1F0;
    block[4] = self;
    id v13 = v3;
    id v14 = v6;
    CFAbsoluteTime v15 = Current;
    id v10 = v6;
    id v11 = v3;
    dispatch_barrier_async(v9, block);
  }
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v2 = (void **)(a1 + 32);
  if ([*(id *)(a1 + 32) needsBuildUpServiceLookup])
  {
    v3 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v4 = GKOSLoggers();
      v3 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_5(a1, v2, v3);
    }
    v5 = dispatch_group_create();
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v45 = dispatch_queue_create("com.apple.gamekit.service", v7);

    id v8 = [*v2 baseProxy];
    objc_msgSend(*v2, "setServiceGeneration:", objc_msgSend(v8, "serviceGeneration"));

    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_475;
    aBlock[3] = &unk_1E646FFA8;
    aBlock[4] = &v62;
    id v9 = _Block_copy(aBlock);
    id v10 = [*v2 baseProxy];
    id v11 = [v10 connection];
    id v12 = [v11 remoteObjectProxyWithErrorHandler:v9];

    if (v12 && !*((unsigned char *)v63 + 24))
    {
      dispatch_group_enter(v5);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      id v14 = [*v2 baseProxy];
      uint64_t v15 = [v14 hostPID];
      id v16 = [*v2 localPlayer];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_476;
      v54[3] = &unk_1E64705A0;
      id v55 = *(id *)(a1 + 40);
      CFAbsoluteTime v60 = Current;
      v17 = v45;
      uint64_t v18 = *(void *)(a1 + 32);
      v56 = v17;
      uint64_t v57 = v18;
      id v58 = v6;
      v59 = v5;
      [v12 getServicesForPID:v15 localPlayer:v16 reply:v54];
    }
    id v19 = [*v2 baseProxy];
    id v20 = [v19 connection];
    id v21 = [v20 remoteObjectProxyWithErrorHandler:v9];

    if (v21 && !*((unsigned char *)v63 + 24))
    {
      dispatch_group_enter(v5);
      CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent();
      id v23 = [*v2 baseProxy];
      uint64_t v24 = [v23 hostPID];
      id v25 = [*v2 localPlayer];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_768;
      v46[3] = &unk_1E64705C8;
      CFAbsoluteTime v53 = v22;
      id v47 = *(id *)(a1 + 40);
      id v52 = v9;
      v48 = v5;
      v26 = v45;
      uint64_t v27 = *(void *)(a1 + 32);
      v49 = v26;
      uint64_t v50 = v27;
      id v51 = v6;
      [v21 getPrivateServicesForPID:v24 localPlayer:v25 reply:v46];
    }
    v28 = +[GKPreferences shared];
    int v29 = [v28 isInternalBuild];

    if (v29)
    {
      dispatch_time_t v30 = dispatch_time(0, 5000000000);
      intptr_t v31 = dispatch_group_wait(v5, v30);
      v32 = [MEMORY[0x1E4F28B50] mainBundle];
      v33 = [v32 bundleIdentifier];

      v34 = os_log_GKGeneral;
      if (v31)
      {
        if (!os_log_GKGeneral)
        {
          id v35 = GKOSLoggers();
          v34 = os_log_GKGeneral;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_4();
        }
        *((unsigned char *)v63 + 24) = 1;
      }
      else
      {
        if (!os_log_GKGeneral)
        {
          id v36 = GKOSLoggers();
          v34 = os_log_GKGeneral;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_3();
        }
      }
    }
    else
    {
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (!os_log_GKGeneral) {
      id v37 = GKOSLoggers();
    }
    v38 = (id)os_log_GKPerf;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      double v39 = CFAbsoluteTimeGetCurrent();
      __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_2(a1, (uint64_t)v67, v38, v39);
    }

    if (*((unsigned char *)v63 + 24))
    {
      id v40 = 0;
    }
    else
    {
      v41 = (void *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v42 = GKOSLoggers();
        v41 = (void *)os_log_GKGeneral;
      }
      v43 = v41;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v44 = [*(id *)(a1 + 40) UUIDString];
        __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_1(v44, (uint64_t)v6, (uint64_t)v66, v43);
      }

      id v40 = v6;
    }
    [*v2 setServiceLookup:v40];

    _Block_object_dispose(&v62, 8);
  }
}

- (GKDaemonProxy)baseProxy
{
  return (GKDaemonProxy *)objc_getProperty(self, a2, 24, 1);
}

- (GKPlayerInternal)localPlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localPlayer);

  return (GKPlayerInternal *)WeakRetained;
}

- (BOOL)needsBuildUpServiceLookup
{
  unsigned int v3 = [(GKServiceProxy *)self serviceGeneration];
  id v4 = [(GKServiceProxy *)self baseProxy];
  if (v3 == [v4 serviceGeneration])
  {
    v5 = [(GKServiceProxy *)self serviceLookup];

    if (v5) {
      return 0;
    }
  }
  else
  {
  }
  id v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    id v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(GKServiceProxy *)self needsBuildUpServiceLookup];
  }
  return 1;
}

- (unsigned)serviceGeneration
{
  return self->_serviceGeneration;
}

- (NSDictionary)serviceLookup
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

void __36__GKServiceProxy_forwardInvocation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) invocationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__GKServiceProxy_forwardInvocation___block_invoke_2;
  block[3] = &unk_1E646F558;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

- (void)setServiceLookup:(id)a3
{
}

- (void)setServiceGeneration:(unsigned int)a3
{
  self->_serviceGeneration = a3;
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 32)];
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = os_log_GKPerf;
    if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v7;
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Preventing duplicate load for %@ %@", buf, 0x16u);
    }
    id v9 = [*(id *)(a1 + 56) target];
    id v10 = [v9 copy];

    [v4 addObject:v10];
  }
  else
  {
    id v11 = [*(id *)(a1 + 64) concurrentRequestSemaphore];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    id v12 = [MEMORY[0x1E4F1CA48] array];
    [v3 setObject:v12 forKey:*(void *)(a1 + 32)];

    id v13 = *(void **)(a1 + 72);
    v27[0] = @"timestamp";
    id v14 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    uint64_t v15 = *(void *)(a1 + 32);
    v28[0] = v14;
    v28[1] = v15;
    v27[1] = @"requestID";
    v27[2] = @"subproxy";
    v28[2] = *(void *)(a1 + 80);
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __36__GKServiceProxy_forwardInvocation___block_invoke_465;
    v22[3] = &unk_1E6470500;
    uint64_t v17 = *(void *)(a1 + 88);
    v22[4] = *(void *)(a1 + 80);
    uint64_t v26 = v17;
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 32);
    id v10 = v11;
    id v25 = v10;
    uint64_t v18 = [v13 remoteObjectProxyWithUserInfo:v16 errorHandler:v22];

    if (!os_log_GKGeneral) {
      id v19 = GKOSLoggers();
    }
    id v20 = os_log_GKPerf;
    if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v21;
      _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "Sending request %@", buf, 0xCu);
    }
    [*(id *)(a1 + 48) _gkInvokeOnceWithTarget:v18];
  }
  [*(id *)(a1 + 48) _gkClearCopiedArguments];
}

- (void)setBaseProxy:(id)a3
{
}

void __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:a1[4]];
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_2;
    v5[3] = &unk_1E646CB08;
    id v6 = a1[4];
    id v7 = a1[5];
    id v8 = a1[6];
    [v4 enumerateObjectsUsingBlock:v5];
  }
  [v3 removeObjectForKey:a1[4]];
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_465(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 baseProxy];
  id v6 = [v5 replyQueueForRequestSelector:*(void *)(a1 + 64)];

  [*(id *)(a1 + 40) _gkCallbackWithError:v4 queue:v6];
  [*(id *)(a1 + 32) replyToDuplicatesForRequest:*(void *)(a1 + 48) withInvocation:*(void *)(a1 + 40) queue:v6];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_2_cold_1();
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_468;
  v7[3] = &unk_1E646EC80;
  id v5 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_468(uint64_t a1)
{
  return [*(id *)(a1 + 32) _gkInvokeOnceWithTarget:*(void *)(a1 + 40)];
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_475(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_475_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_476(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  id v44 = a2;
  id v43 = a3;
  id v42 = a4;
  id v41 = a5;
  id v40 = a6;
  id v38 = a7;
  id v36 = a8;
  id v34 = a9;
  id v32 = a10;
  id v31 = a11;
  uint64_t v18 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v19 = GKOSLoggers();
    uint64_t v18 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_476_cold_2();
  }
  if (!os_log_GKGeneral) {
    id v20 = GKOSLoggers();
  }
  uint64_t v21 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_476_cold_1(v21);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  queue = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_478;
  block[3] = &unk_1E6470578;
  CFAbsoluteTime v59 = Current;
  id v23 = *(void **)(a1 + 56);
  void block[4] = *(void *)(a1 + 48);
  id v46 = v44;
  id v47 = v23;
  id v48 = v43;
  id v49 = v42;
  id v50 = v41;
  id v51 = v40;
  id v52 = v38;
  id v53 = v36;
  id v54 = v34;
  id v55 = v32;
  id v56 = v31;
  id v57 = *(id *)(a1 + 32);
  id v58 = *(id *)(a1 + 64);
  id v24 = v31;
  id v33 = v32;
  id v35 = v34;
  id v37 = v36;
  id v39 = v38;
  id v25 = v40;
  id v26 = v41;
  id v27 = v42;
  id v28 = v43;
  id v29 = v44;
  dispatch_async(queue, block);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_478(uint64_t a1)
{
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_478_cold_3(v3);
  }
  CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 40) forProtocol:&unk_1F1EAE348 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 56) forProtocol:&unk_1F1EAB670 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 64) forProtocol:&unk_1F1EAC3B8 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 72) forProtocol:&unk_1F1EAE748 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 80) forProtocol:&unk_1F1EAEB50 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 88) forProtocol:&unk_1F1EAEE88 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 96) forProtocol:&unk_1F1EAF3B8 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 104) forProtocol:&unk_1F1EAF438 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 112) forProtocol:&unk_1F1EAF4A8 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 120) forProtocol:&unk_1F1EAF9A8 toLookup:*(void *)(a1 + 48)];
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_478_cold_2(v5);
  }
  id v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    id v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_478_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 136));
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_768(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  id v42 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v40 = a7;
  id v22 = a8;
  id v23 = a9;
  id v39 = a10;
  id v24 = a11;
  id v38 = a12;
  if (!os_log_GKGeneral) {
    id v25 = GKOSLoggers();
  }
  id v26 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_768_cold_3(v26);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v28 = os_log_GKGeneral;
  id v29 = v42;
  id v37 = v19;
  if (v42)
  {
    if (!os_log_GKGeneral) {
      id v30 = GKOSLoggers();
    }
    id v31 = v39;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_768_cold_2();
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    id v32 = v40;
    id v33 = v38;
  }
  else
  {
    double v34 = Current;
    if (!os_log_GKGeneral)
    {
      id v35 = GKOSLoggers();
      id v28 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_768_cold_1();
    }
    queue = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_770;
    block[3] = &unk_1E6470578;
    double v57 = v34;
    void block[4] = *(void *)(a1 + 56);
    id v44 = v18;
    id v45 = *(id *)(a1 + 64);
    id v46 = v19;
    id v47 = v20;
    id v48 = v21;
    id v32 = v40;
    id v49 = v40;
    id v50 = v22;
    id v51 = v23;
    id v31 = v39;
    id v52 = v39;
    id v53 = v24;
    id v33 = v38;
    id v54 = v38;
    id v55 = *(id *)(a1 + 32);
    id v56 = *(id *)(a1 + 40);
    dispatch_async(queue, block);

    id v29 = 0;
  }
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_770(uint64_t a1)
{
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_770_cold_3(v3);
  }
  CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 40) forProtocol:&unk_1F1EB3220 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 56) forProtocol:&unk_1F1EB3100 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 64) forProtocol:&unk_1F1EB31C0 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 72) forProtocol:&unk_1F1EB3280 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 80) forProtocol:&unk_1F1EB32E0 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 88) forProtocol:&unk_1F1EB3340 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 96) forProtocol:&unk_1F1EB33A0 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 104) forProtocol:&unk_1F1EB3400 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 112) forProtocol:&unk_1F1EB3460 toLookup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addService:*(void *)(a1 + 120) forProtocol:&unk_1F1EB34C0 toLookup:*(void *)(a1 + 48)];
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_770_cold_2(v5);
  }
  id v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    id v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_770_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 136));
}

- (GKThreadsafeDictionary)pendingRequests
{
  return (GKThreadsafeDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPendingRequests:(id)a3
{
}

- (void)setLocalPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLookup, 0);
  objc_destroyWeak((id *)&self->_localPlayer);
  objc_storeStrong((id *)&self->_baseProxy, 0);

  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

- (void)initWithPlayer:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, (uint64_t)v1, "%@ init player:%@", v2);
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_2_cold_1(void *a1, const char *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  __int16 v3 = a1;
  sel_getName(a2);
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_ERROR, "No gamed service found for selector %s", v4, 0xCu);
}

void __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "Replying to duplicate request for %@", v2, v3, v4, v5, v6);
}

- (void)needsBuildUpServiceLookup
{
  id v3 = a2;
  [a1 serviceGeneration];
  id v10 = [a1 serviceLookup];
  OUTLINED_FUNCTION_7_0(&dword_1C2D22000, v4, v5, "%@ needs to build up service lookup. serviceGeneration: %u, serviceLookup: %@", v6, v7, v8, v9, 2u);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_13(&dword_1C2D22000, a4, a3, "[%@]Setting service lookup to: %@", (uint8_t *)a3);
}

double __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3, double a4)
{
  double v4 = a4 - *(double *)(a1 + 56);
  *(_DWORD *)a2 = 136315394;
  *(void *)(a2 + 4) = "buildServiceLookupIfNecessary";
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_13(&dword_1C2D22000, a3, (uint64_t)a3, "%s elapsed seconds:%g", (uint8_t *)a2);
  return result;
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "[%@]Done building service lookup.", v2, v3, v4, v5, v6);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_4()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_5(uint64_t a1, void **a2, void *a3)
{
  uint64_t v3 = *a2;
  id v4 = a3;
  [v3 serviceGeneration];
  OUTLINED_FUNCTION_7_0(&dword_1C2D22000, v5, v6, "[%@]Building service lookup for proxy: %@, generation: %u", v7, v8, v9, v10, 2u);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_475_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Could not load services for GameKit. This likely means your game is missing the com.apple.developer.game-center entitlement. For more info see:\n https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_game-center\n\nERROR: %@", v2, v3, v4, v5, v6);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_476_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_476_cold_2()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "[%@]Adding publicProxy services.", v2, v3, v4, v5, v6);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_478_cold_1()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "[%@]Added publicProxy services.", v2, v3, v4, v5, v6);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_478_cold_2(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_478_cold_3(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_768_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "[%@]Adding privateProxy services.", v2, v3, v4, v5, v6);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_768_cold_2()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_ERROR, "[%@]Failed to get privateProxy services. error: %@", v1, 0x16u);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_768_cold_3(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_770_cold_1()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_1(&dword_1C2D22000, v0, v1, "[%@]Added privateProxy services.", v2, v3, v4, v5, v6);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_770_cold_2(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_770_cold_3(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

@end