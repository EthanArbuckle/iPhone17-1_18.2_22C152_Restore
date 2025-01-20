@interface HDAppLauncher
- (BOOL)unitTest_hasAssertionForBundleIdentifier:(id)a3;
- (HDAppLauncher)initWithProcessStateManager:(id)a3 openApplicationService:(id)a4;
- (id)_queue_assertionsForClientBundleIdentifier:(uint64_t)a1;
- (id)takeKeepAliveAssertionForApplicationBundleIdentifier:(id)a3 processBundleIdentifier:(id)a4 payloadOptions:(id)a5;
- (uint64_t)_queue_clientRequiresLaunch:(void *)a3 assertions:;
- (void)_queue_launchClientIfNeeded:(uint64_t)a1;
- (void)_queue_scheduleLaunchForClient:(uint64_t)a1;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)processTerminated:(id)a3;
- (void)unitTest_setBaseLaunchDelay:(double)a3 launchCountResetThreshold:(double)a4 maxLaunchCount:(int64_t)a5;
@end

@implementation HDAppLauncher

- (HDAppLauncher)initWithProcessStateManager:(id)a3 openApplicationService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDAppLauncher;
  v9 = [(HDAppLauncher *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processStateManager, a3);
    objc_storeStrong((id *)&v10->_openApplicationService, a4);
    uint64_t v11 = HKCreateSerialDispatchQueue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v13 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v10->_assertionManager;
    v10->_assertionManager = v13;

    [(HDAssertionManager *)v10->_assertionManager addObserver:v10 forAssertionIdentifier:@"HDAppLaunchClientKeepAliveAssertionIdentifier" queue:v10->_queue];
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registeredAssertionsByIdentifier = v10->_registeredAssertionsByIdentifier;
    v10->_registeredAssertionsByIdentifier = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    monitoredProcessBundleIdentifiers = v10->_monitoredProcessBundleIdentifiers;
    v10->_monitoredProcessBundleIdentifiers = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    launchingProcessBundleIdentifiers = v10->_launchingProcessBundleIdentifiers;
    v10->_launchingProcessBundleIdentifiers = v19;

    v10->_baseLaunchDelay = 8.0;
    v10->_maxLaunchCount = 6;
    self;
    v10->_launchCountResetThreshold = 1037.9707;
  }

  return v10;
}

- (id)takeKeepAliveAssertionForApplicationBundleIdentifier:(id)a3 processBundleIdentifier:(id)a4 payloadOptions:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 length])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v18 = __Block_byref_object_copy__105;
    v19 = __Block_byref_object_dispose__105;
    id v20 = 0;
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __109__HDAppLauncher_takeKeepAliveAssertionForApplicationBundleIdentifier_processBundleIdentifier_payloadOptions___block_invoke;
    v13[3] = &unk_1E62F7240;
    v13[4] = self;
    id v14 = v7;
    id v15 = v8;
    v16 = buf;
    dispatch_sync(queue, v13);
    id v10 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring attempt to request keep-alive for invalide bundle identifier %{public}@", buf, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

void __109__HDAppLauncher_takeKeepAliveAssertionForApplicationBundleIdentifier_processBundleIdentifier_payloadOptions___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v34;
    double v7 = 0.0;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v2);
        }
        v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        if (v9) {
          id v10 = (void *)v9[13];
        }
        else {
          id v10 = 0;
        }
        if ((objc_msgSend(v10, "isEqual:", *(void *)(a1 + 48), (void)v33) & 1) == 0)
        {
          _HKInitializeLogging();
          id v15 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = *(void *)(a1 + 32);
            uint64_t v32 = *(void *)(a1 + 40);
            *(_DWORD *)v37 = 138543618;
            *(void *)&v37[4] = v31;
            *(_WORD *)&v37[12] = 2112;
            *(void *)&v37[14] = v32;
            _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Taking assertion on processs %@ with different payload", v37, 0x16u);
          }

          goto LABEL_43;
        }
        if (v9) {
          uint64_t v11 = (void *)v9[11];
        }
        else {
          uint64_t v11 = 0;
        }
        [v11 timeIntervalSinceReferenceDate];
        if (v7 < v12) {
          double v7 = v12;
        }
        if (v9) {
          uint64_t v13 = v9[10];
        }
        else {
          uint64_t v13 = 0;
        }
        if (v5 <= v13) {
          uint64_t v5 = v13;
        }
        ++v8;
      }
      while (v4 != v8);
      uint64_t v14 = [v2 countByEnumeratingWithState:&v33 objects:v38 count:16];
      uint64_t v4 = v14;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v5 = 0;
    double v7 = 0.0;
  }

  v16 = [HDClientKeepAliveAssertion alloc];
  v17 = *(void **)(a1 + 48);
  id v18 = *(id *)(a1 + 40);
  id v19 = v17;
  if (v16)
  {
    *(void *)v37 = v16;
    *(void *)&v37[8] = HDClientKeepAliveAssertion;
    v16 = (HDClientKeepAliveAssertion *)objc_msgSendSuper2((objc_super *)v37, sel_initWithAssertionIdentifier_ownerIdentifier_, @"HDAppLaunchClientKeepAliveAssertionIdentifier", v18);
    if (v16)
    {
      uint64_t v20 = [v18 copy];
      clientBundleIdentifier = v16->_clientBundleIdentifier;
      v16->_clientBundleIdentifier = (NSString *)v20;

      objc_storeStrong((id *)&v16->_payloadOptions, v17);
    }
  }

  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v16;

  uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v24) {
    *(void *)(v24 + 80) = v5;
  }
  if (v7 > 0.0)
  {
    v26 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7];
    v27 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v27) {
      objc_setProperty_nonatomic_copy(v27, v25, v26, 88);
    }
  }
  _HKInitializeLogging();
  v28 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = *(void *)(a1 + 32);
    uint64_t v30 = *(void *)(a1 + 40);
    *(_DWORD *)v37 = 138543618;
    *(void *)&v37[4] = v29;
    *(_WORD *)&v37[12] = 2114;
    *(void *)&v37[14] = v30;
    _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_INFO, "%{public}@: Taking keep-alive assertion for %{public}@", v37, 0x16u);
  }
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "takeAssertion:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), (void)v33))
  {
    if (([*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)] & 1) == 0) {
      [*(id *)(*(void *)(a1 + 32) + 8) registerObserver:*(void *)(a1 + 32) forBundleIdentifier:*(void *)(a1 + 40)];
    }
    -[HDAppLauncher _queue_launchClientIfNeeded:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
LABEL_43:
}

- (id)_queue_assertionsForClientBundleIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    uint64_t v4 = [*(id *)(a1 + 32) activeAssertionsForIdentifier:@"HDAppLaunchClientKeepAliveAssertionIdentifier"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__HDAppLauncher__queue_assertionsForClientBundleIdentifier___block_invoke;
    v6[3] = &unk_1E6301B48;
    id v7 = v3;
    a1 = objc_msgSend(v4, "hk_filter:", v6);
  }

  return (id)a1;
}

- (void)_queue_launchClientIfNeeded:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    uint64_t v4 = -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:](a1, v3);
    if (-[HDAppLauncher _queue_clientRequiresLaunch:assertions:](a1, v3, v4))
    {
      [*(id *)(a1 + 56) addObject:v3];
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v22 = v4;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7)
      {
        uint64_t v9 = v7;
        id v10 = 0;
        uint64_t v11 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(v6);
            }
            uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            if (v13)
            {
              objc_setProperty_nonatomic_copy(*(id *)(*((void *)&v27 + 1) + 8 * i), v8, v5, 88);
              ++*(void *)(v13 + 80);
              uint64_t v14 = *(void **)(v13 + 104);
              if (v14)
              {
                id v15 = v14;

                id v10 = v15;
              }
            }
          }
          uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v9);
      }
      else
      {
        id v10 = 0;
      }

      v17 = [v6 anyObject];
      id v18 = [v17 ownerIdentifier];

      _HKInitializeLogging();
      id v19 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = a1;
        __int16 v34 = 2114;
        id v35 = v18;
        _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to launch %{public}@.", buf, 0x16u);
      }
      uint64_t v20 = *(void **)(a1 + 16);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __45__HDAppLauncher__queue_launchClientIfNeeded___block_invoke;
      v23[3] = &unk_1E6301B70;
      id v24 = v18;
      uint64_t v25 = a1;
      id v26 = v3;
      id v21 = v18;
      objc_msgSend(v20, "hd_openApplication:optionsDictionary:completion:", v21, v10, v23);

      uint64_t v4 = v22;
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = a1;
        __int16 v34 = 2114;
        id v35 = v3;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Not attempting to launch %{public}@; does not require launch.",
          buf,
          0x16u);
      }
    }
  }
}

uint64_t __60__HDAppLauncher__queue_assertionsForClientBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v3) {
      uint64_t v4 = (void *)v3[12];
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)_queue_clientRequiresLaunch:(void *)a3 assertions:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (![v6 count])
  {
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29FB8];
    uint64_t v10 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v16 = 138543618;
    uint64_t v17 = a1;
    __int16 v18 = 2114;
    id v19 = v5;
    uint64_t v11 = "%{public}@: %{public}@ has no active assertions.";
    goto LABEL_10;
  }
  int v7 = [*(id *)(a1 + 8) processIdentifierForApplicationIdentifier:v5];
  if (v7 < 1)
  {
    if (![*(id *)(a1 + 56) containsObject:v5])
    {
      uint64_t v10 = 1;
      goto LABEL_13;
    }
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29FB8];
    uint64_t v10 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v16 = 138543618;
    uint64_t v17 = a1;
    __int16 v18 = 2114;
    id v19 = v5;
    uint64_t v11 = "%{public}@: %{public}@ is already being launched.";
LABEL_10:
    double v12 = v14;
    uint32_t v13 = 22;
    goto LABEL_11;
  }
  int v8 = v7;
  _HKInitializeLogging();
  uint64_t v9 = *MEMORY[0x1E4F29FB8];
  uint64_t v10 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543874;
    uint64_t v17 = a1;
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 1026;
    int v21 = v8;
    uint64_t v11 = "%{public}@: %{public}@ is already running with pid %{public}d.";
    double v12 = v9;
    uint32_t v13 = 28;
LABEL_11:
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    uint64_t v10 = 0;
  }
LABEL_13:

  return v10;
}

void __45__HDAppLauncher__queue_launchClientIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = *(NSObject **)(v7 + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__HDAppLauncher__queue_launchClientIfNeeded___block_invoke_287;
  v10[3] = &unk_1E62F31C0;
  v10[4] = v7;
  id v11 = *(id *)(a1 + 48);
  dispatch_async(v8, v10);
}

void __45__HDAppLauncher__queue_launchClientIfNeeded___block_invoke_287(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);

  -[HDAppLauncher _queue_scheduleLaunchForClient:](v2, v3);
}

- (void)_queue_scheduleLaunchForClient:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    uint64_t v4 = -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:](a1, v3);
    if ((-[HDAppLauncher _queue_clientRequiresLaunch:assertions:](a1, v3, v4) & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v31 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = a1;
        __int16 v44 = 2114;
        double v45 = *(double *)&v3;
        _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Not scheduling launch %{public}@; does not require launch.",
          buf,
          0x16u);
      }
      goto LABEL_35;
    }
    __int16 v34 = [MEMORY[0x1E4F1C9C8] date];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id obj = v5;
      uint64_t v8 = a1;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v38;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = v9;
        do
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * v12);
          if (v14) {
            id v15 = *(void **)(v14 + 88);
          }
          else {
            id v15 = 0;
          }
          id v16 = v15;
          [v34 timeIntervalSinceDate:v16];
          double v18 = v17;
          double v19 = *(double *)(v8 + 64);

          if (v18 > v19 && v14) {
            *(void *)(v14 + 80) = 0;
          }
          uint64_t v9 = HKDateMax();

          if (v14) {
            uint64_t v20 = *(void *)(v14 + 80);
          }
          else {
            uint64_t v20 = 0;
          }
          if (v11 >= v20) {
            uint64_t v11 = v20;
          }
          ++v12;
          uint64_t v13 = v9;
        }
        while (v7 != v12);
        uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        uint64_t v7 = v21;
      }
      while (v21);

      a1 = v8;
      if (v11 < *(void *)(v8 + 80))
      {
        double v22 = *(double *)(v8 + 72);
        long double v23 = pow(1.5, (double)v11) * v22;
        [v9 timeIntervalSinceReferenceDate];
        long double v25 = v24 + v23;
        [v34 timeIntervalSinceReferenceDate];
        double v27 = v25 - v26;
        if (v27 <= 0.0)
        {
          -[HDAppLauncher _queue_launchClientIfNeeded:](v8, v3);
        }
        else
        {
          _HKInitializeLogging();
          long long v28 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v43 = a1;
            __int16 v44 = 2048;
            double v45 = v27;
            _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling launch in %0.2lfs.", buf, 0x16u);
          }
          dispatch_time_t v29 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
          long long v30 = *(NSObject **)(a1 + 24);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __48__HDAppLauncher__queue_scheduleLaunchForClient___block_invoke;
          block[3] = &unk_1E62F31C0;
          block[4] = a1;
          id v36 = v3;
          dispatch_after(v29, v30, block);
        }
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
    }
    else
    {

      uint64_t v9 = 0;
    }
    _HKInitializeLogging();
    uint64_t v32 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = a1;
      _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Too many terminations; not rescheduling a launch.",
        buf,
        0xCu);
    }
    goto LABEL_34;
  }
LABEL_36:
}

uint64_t __48__HDAppLauncher__queue_scheduleLaunchForClient___block_invoke(uint64_t a1)
{
  return -[HDAppLauncher _queue_launchClientIfNeeded:](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v5) {
      uint64_t v6 = (void *)v5[12];
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      int v11 = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "%{public}@: Invalidated keep-alive assertion for %{public}@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:]((uint64_t)self, v7);
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      [(NSMutableSet *)self->_monitoredProcessBundleIdentifiers removeObject:v7];
      [(HDProcessStateManager *)self->_processStateManager unregisterObserver:self forBundleIdentifier:v7];
    }
  }
}

- (void)processTerminated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__HDAppLauncher_processTerminated___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __35__HDAppLauncher_processTerminated___block_invoke(uint64_t a1)
{
}

- (void)unitTest_setBaseLaunchDelay:(double)a3 launchCountResetThreshold:(double)a4 maxLaunchCount:(int64_t)a5
{
  self->_launchCountResetThreshold = a4;
  self->_baseLaunchDelay = a3;
  self->_maxLaunchCount = a5;
}

- (BOOL)unitTest_hasAssertionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HDAppLauncher_unitTest_hasAssertionForBundleIdentifier___block_invoke;
  block[3] = &unk_1E62FEE30;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __58__HDAppLauncher_unitTest_hasAssertionForBundleIdentifier___block_invoke(uint64_t a1)
{
  -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 count] != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchingProcessBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_monitoredProcessBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_registeredAssertionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_openApplicationService, 0);

  objc_storeStrong((id *)&self->_processStateManager, 0);
}

@end