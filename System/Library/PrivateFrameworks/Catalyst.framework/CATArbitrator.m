@interface CATArbitrator
- (CATArbitrator)init;
- (id)debugDescription;
- (id)resourceForKey:(id)a3 exclusive:(BOOL)a4;
- (id)resourcesForKeys:(id)a3 exclusive:(BOOL)a4;
- (id)waitForResourcesForKeys:(id)a3 exclusive:(BOOL)a4 delegateQueue:(id)a5 completionBlock:(id)a6;
- (unint64_t)unregisterResourceForKey:(id)a3;
- (void)registerResource:(id)a3 forKey:(id)a4;
- (void)registerResource:(id)a3 forKey:(id)a4 maxConcurrentCount:(unint64_t)a5;
- (void)stopWaiting:(id)a3;
@end

@implementation CATArbitrator

- (CATArbitrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CATArbitrator;
  v2 = [(CATArbitrator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mRegistrationByKey = v2->mRegistrationByKey;
    v2->mRegistrationByKey = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)debugDescription
{
  uint64_t v3 = self->mRegistrationByKey;
  objc_sync_enter(v3);
  v4 = [(NSMutableDictionary *)self->mRegistrationByKey debugDescription];
  objc_sync_exit(v3);

  v5 = [NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, v4];

  return v5;
}

- (id)resourceForKey:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATArbitrator.m", 140, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  v13[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v9 = [(CATArbitrator *)self resourcesForKeys:v8 exclusive:v4];
  v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

- (id)resourcesForKeys:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![v6 count])
  {
    v19 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_23;
  }
  id v7 = objc_opt_new();
  context = (void *)MEMORY[0x2166930C0]();
  v8 = self->mRegistrationByKey;
  objc_sync_enter(v8);
  v24 = self;
  v9 = (void *)[(NSMutableDictionary *)self->mRegistrationByKey copy];
  objc_sync_exit(v8);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v25 = v6;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v11) {
    goto LABEL_22;
  }
  uint64_t v12 = *(void *)v28;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
      v15 = [v7 objectForKeyedSubscript:v14];

      if (!v15)
      {
        v16 = [v9 objectForKeyedSubscript:v14];
        v17 = v16;
        if (v16)
        {
          v18 = [v16 makeResourceProxyIfPossible:v4];
          if (v18)
          {
            [v7 setObject:v18 forKeyedSubscript:v14];

            continue;
          }
          v22 = [v7 allValues];
          [v22 makeObjectsPerformSelector:sel_invalidate];

          [v7 removeAllObjects];
          id v7 = v17;
        }
        else
        {
          if (_CATLogGeneral_onceToken != -1) {
            dispatch_once(&_CATLogGeneral_onceToken, &__block_literal_global);
          }
          v20 = _CATLogGeneral_logObj;
          if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v32 = v24;
            __int16 v33 = 2112;
            uint64_t v34 = v14;
            _os_log_impl(&dword_213B7F000, v20, OS_LOG_TYPE_INFO, "%@ is missing entry for %@", buf, 0x16u);
          }
          v21 = [v7 allValues];
          [v21 makeObjectsPerformSelector:sel_invalidate];

          [v7 removeAllObjects];
        }

        id v7 = 0;
        goto LABEL_22;
      }
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_22:

  v19 = (void *)[v7 copy];

  id v6 = v25;
LABEL_23:

  return v19;
}

- (id)waitForResourcesForKeys:(id)a3 exclusive:(BOOL)a4 delegateQueue:(id)a5 completionBlock:(id)a6
{
  BOOL v8 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    qos_class_t v14 = qos_class_self();
    dispatch_get_global_queue(v14, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v12;
  long long v27 = v13;
  v15 = [[_CATArbitratorWaitToken alloc] initWithDelegateQueue:v13 completionBlock:v12];
  if ([v10 count])
  {
    v16 = self->mRegistrationByKey;
    objc_sync_enter(v16);
    v17 = (void *)[(NSMutableDictionary *)self->mRegistrationByKey copy];
    objc_sync_exit(v16);

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v10;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v23 = [v17 objectForKeyedSubscript:v22];
          if (v23) {
            [(_CATArbitratorWaitToken *)v15 waitForRegistrationEntry:v23 forKey:v22 exclusive:v8];
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v19);
    }

    id v10 = v25;
  }
  [(_CATArbitratorWaitToken *)v15 resume];

  return v15;
}

- (void)stopWaiting:(id)a3
{
}

- (void)registerResource:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CATArbitrator.m", 229, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v9 = [MEMORY[0x263F08690] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"CATArbitrator.m", 230, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_3:
  [(CATArbitrator *)self registerResource:v10 forKey:v7 maxConcurrentCount:1];
}

- (void)registerResource:(id)a3 forKey:(id)a4 maxConcurrentCount:(unint64_t)a5
{
  id v19 = a3;
  id v9 = a4;
  if (v19)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    qos_class_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CATArbitrator.m", 239, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  id v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"CATArbitrator.m", 238, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

  if (!v9) {
    goto LABEL_10;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_11:
  v15 = [MEMORY[0x263F08690] currentHandler];
  v16 = NSStringFromSelector(a2);
  [v15 handleFailureInMethod:a2, self, @"CATArbitrator.m", 240, @"%@ cannot call %@ with maxConcurrentCount == 0", self, v16 object file lineNumber description];

LABEL_4:
  id v10 = [[_CATArbitratorRegistrationEntry alloc] initWithResource:v19 maxConcurrentCount:a5];
  id v11 = self->mRegistrationByKey;
  objc_sync_enter(v11);
  id v12 = [(NSMutableDictionary *)self->mRegistrationByKey objectForKeyedSubscript:v9];

  if (v12)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    id v18 = NSStringFromSelector(a2);
    [v17 handleFailureInMethod:a2, self, @"CATArbitrator.m", 245, @"%@ cannot call %@ when key (%@) is already registered", self, v18, v9 object file lineNumber description];
  }
  [(NSMutableDictionary *)self->mRegistrationByKey setObject:v10 forKeyedSubscript:v9];
  objc_sync_exit(v11);
}

- (unint64_t)unregisterResourceForKey:(id)a3
{
  id v4 = a3;
  v5 = self->mRegistrationByKey;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->mRegistrationByKey objectForKeyedSubscript:v4];
  if (v6)
  {
    [(NSMutableDictionary *)self->mRegistrationByKey removeObjectForKey:v4];
    unint64_t v7 = [v6 currentCount];
  }
  else
  {
    unint64_t v7 = 0;
  }
  objc_sync_exit(v5);

  [v6 invalidate];
  return v7;
}

- (void).cxx_destruct
{
}

@end