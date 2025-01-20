@interface HDAppExtensionAssertion
- (BOOL)_unitTest_invalidated;
- (BOOL)shouldAssert;
- (BOOL)unitTest_timersWithShortTimeout;
- (HDAppExtensionAssertion)init;
- (HDAppExtensionAssertion)initWithBundleIdentifier:(id)a3 profile:(id)a4 queue:(id)a5;
- (HDAppExtensionAssertionDelegate)delegate;
- (NSObject)_newTimerWithDuration:(double)a3 handler:;
- (NSString)bundleIdentifier;
- (double)_unitTest_lastAssertionAttempt;
- (double)nextAssertionAttempt;
- (id)_unitTest_pendingDataTypeCodesToAnchors;
- (id)unitTest_errorCountDidIncrement;
- (id)unitTest_extensionWillTimeout;
- (int64_t)_unitTest_connectionErrorCount;
- (unint64_t)_unitTest_pendingAssertionCompletionsCount;
- (void)_incrementErrorCount;
- (void)_invalidate;
- (void)_lock_cancelTimeoutTimers;
- (void)assertAndUpdateWithCompletion:(id)a3;
- (void)extendForDataType:(int64_t)a3 anchor:(id)a4 completion:(id)a5;
- (void)extension;
- (void)invalidateForDataType:(int64_t)a3 anchor:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setUnitTest_errorCountDidIncrement:(id)a3;
- (void)setUnitTest_extensionWillTimeout:(id)a3;
- (void)setUnitTest_timersWithShortTimeout:(BOOL)a3;
@end

@implementation HDAppExtensionAssertion

- (HDAppExtensionAssertion)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDAppExtensionAssertion)initWithBundleIdentifier:(id)a3 profile:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDAppExtensionAssertion;
  v12 = [(HDAppExtensionAssertion *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_profile, v10);
    v13->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a3);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingDataTypeCodesToAnchors = v13->_pendingDataTypeCodesToAnchors;
    v13->_pendingDataTypeCodesToAnchors = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingAssertionCompletions = v13->_pendingAssertionCompletions;
    v13->_pendingAssertionCompletions = v16;
  }
  return v13;
}

- (void)extendForDataType:(int64_t)a3 anchor:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    id v11 = -[HDAppExtensionAssertion extension]((id *)&self->super.isa);

    if (v11)
    {
      if (!v8) {
        id v8 = &unk_1F17ECC60;
      }
      pendingDataTypeCodesToAnchors = self->_pendingDataTypeCodesToAnchors;
      v13 = [NSNumber numberWithInteger:a3];
      v14 = [(NSMutableDictionary *)pendingDataTypeCodesToAnchors objectForKeyedSubscript:v13];
      uint64_t v15 = [v14 compare:v8];

      if (v15 == 1)
      {
        _HKInitializeLogging();
        v16 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
        {
          int v23 = 134218242;
          int64_t v24 = a3;
          __int16 v25 = 2114;
          id v26 = v8;
          _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Ignoring attempt to set '%lu' to lower anchor '%{public}@'", (uint8_t *)&v23, 0x16u);
        }
      }
      else
      {
        v17 = self->_pendingDataTypeCodesToAnchors;
        v18 = [NSNumber numberWithInteger:a3];
        [(NSMutableDictionary *)v17 setObject:v8 forKeyedSubscript:v18];
      }
      objc_super v19 = (void *)[v9 copy];
      v20 = _Block_copy(v19);
      pendingAssertionCompletions = self->_pendingAssertionCompletions;
      v22 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)pendingAssertionCompletions setObject:v20 forKeyedSubscript:v22];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)extension
{
  v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v3 = [WeakRetained daemon];
    uint64_t v4 = [v3 extensionManager];
    v1 = [v4 extensionForBundleIdentifier:v1[3] error:0];
  }

  return v1;
}

- (void)assertAndUpdateWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_pendingAssertion)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_pendingAssertion = 1;
    os_unfair_lock_unlock(&self->_lock);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke;
    aBlock[3] = &unk_1E6300210;
    aBlock[4] = self;
    id v25 = v4;
    id v4 = _Block_copy(aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v6 = [WeakRetained daemon];
    v7 = [v6 extensionManager];
    bundleIdentifier = self->_bundleIdentifier;
    id v23 = 0;
    id v9 = [v7 extensionForBundleIdentifier:bundleIdentifier error:&v23];
    id v10 = v23;

    if (v9)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_285;
      v19[3] = &unk_1E62F2A18;
      id v20 = v9;
      v21 = self;
      id v22 = v4;
      [v20 connectWithCompletionHandler:v19];
    }
    else
    {
      -[HDAppExtensionAssertion _incrementErrorCount]((uint64_t)self);
      id v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      char v12 = [v11 applicationIsInstalled:self->_bundleIdentifier];

      _HKInitializeLogging();
      v13 = *MEMORY[0x1E4F29F00];
      v14 = *MEMORY[0x1E4F29F00];
      if (v12)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v18 = self->_bundleIdentifier;
          *(_DWORD *)buf = 138543618;
          uint64_t v27 = v18;
          __int16 v28 = 2114;
          id v29 = v10;
          _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Failed to assert app extension: '%{public}@' with error: %{public}@", buf, 0x16u);
        }
        (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0, 1);
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = self->_bundleIdentifier;
          *(_DWORD *)buf = 138543362;
          uint64_t v27 = v15;
          _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Failed to assert app extesnion: '%{public}@' since the app has been uninstalled.", buf, 0xCu);
        }
        id v16 = objc_loadWeakRetained((id *)&self->_profile);
        v17 = [v16 appSubscriptionManager];
        [v17 removeBundleID:self->_bundleIdentifier];

        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      }
    }
  }
}

uint64_t __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 96) = CFAbsoluteTimeGetCurrent();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_incrementErrorCount
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 12);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    ++*(void *)(a1 + 104);
    os_unfair_lock_unlock(v2);
    v3 = (void (**)(void))_Block_copy(*(const void **)(a1 + 32));
    if (v3)
    {
      id v4 = v3;
      v3[2]();
      v3 = v4;
    }
  }
}

void __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_285(uint64_t a1, int a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F00];
  v7 = *MEMORY[0x1E4F29F00];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = v6;
      id v10 = [v8 extensionIdentifier];
      *(_DWORD *)buf = 138543362;
      v35 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, "Connected to app extension: '%{public}@'", buf, 0xCu);
    }
    id v11 = (uint64_t *)(a1 + 40);
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
    -[HDAppExtensionAssertion _lock_cancelTimeoutTimers](*(void *)(a1 + 40));
    uint64_t v12 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v12 + 8)) {
      double v13 = 1.0;
    }
    else {
      double v13 = 15.0;
    }
    if (*(unsigned char *)(*(void *)(a1 + 40) + 8)) {
      double v14 = 1.0;
    }
    else {
      double v14 = 14.0;
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_286;
    v32[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v33, (id *)buf);
    uint64_t v15 = -[HDAppExtensionAssertion _newTimerWithDuration:handler:](v12, v32, v14);
    id v16 = *(void **)(*v11 + 80);
    *(void *)(*v11 + 80) = v15;

    uint64_t v17 = *v11;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_2;
    v29[3] = &unk_1E62F74E0;
    id v30 = *(id *)(a1 + 32);
    objc_copyWeak(&v31, (id *)buf);
    v18 = -[HDAppExtensionAssertion _newTimerWithDuration:handler:](v17, v29, v13);
    objc_super v19 = *(void **)(*v11 + 72);
    *(void *)(*v11 + 72) = v18;

    id v20 = (void *)[*(id *)(*v11 + 56) copy];
    [*(id *)(*(void *)(a1 + 40) + 56) removeAllObjects];
    *(void *)(*(void *)(a1 + 40) + 104) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_288;
    v26[3] = &unk_1E6300238;
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    id v27 = v21;
    uint64_t v28 = v22;
    [v20 enumerateKeysAndObjectsUsingBlock:v26];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v23 = *(void **)(a1 + 32);
      int64_t v24 = v6;
      id v25 = [v23 extensionIdentifier];
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      __int16 v36 = 2114;
      id v37 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Failed to connect to app extension: '%{public}@' with error: %{public}@", buf, 0x16u);
    }
    -[HDAppExtensionAssertion _incrementErrorCount](*(void *)(a1 + 40));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_lock_cancelTimeoutTimers
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
    v2 = *(NSObject **)(a1 + 72);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;
    }
    id v4 = *(NSObject **)(a1 + 80);
    if (v4)
    {
      dispatch_source_cancel(v4);
      id v5 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;
    }
  }
}

void __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_286(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = (const void **)WeakRetained;
    v2 = -[HDAppExtensionAssertion extension](WeakRetained);
    [v2 notifyExtensionOfUpcomingTimeout];

    v3 = _Block_copy(v5[5]);
    id v4 = v3;
    if (v3) {
      (*((void (**)(void *))v3 + 2))(v3);
    }

    id WeakRetained = (id *)v5;
  }
}

- (NSObject)_newTimerWithDuration:(double)a3 handler:
{
  if (!a1) {
    return 0;
  }
  id v4 = *(NSObject **)(a1 + 88);
  id v5 = a2;
  v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);
  return v6;
}

void __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29F00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 extensionIdentifier];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "Invalidating app extension assertion due to timeout for '%{public}@'", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[HDAppExtensionAssertion _invalidate]((uint64_t)WeakRetained);
}

- (void)_invalidate
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 12);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    if (*(unsigned char *)(a1 + 10))
    {
      os_unfair_lock_unlock(v2);
    }
    else
    {
      *(_WORD *)(a1 + 9) = 256;
      -[HDAppExtensionAssertion _lock_cancelTimeoutTimers](a1);
      os_unfair_lock_unlock(v2);
      v3 = -[HDAppExtensionAssertion extension]((id *)a1);
      [v3 disconnect];

      id v4 = [(id)a1 delegate];
      [v4 appExtensionAssertionDidInvalidate:a1];
    }
  }
}

void __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_288(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
  {
    int v7 = *(void **)(a1 + 32);
    id v8 = v6;
    uint64_t v9 = [v7 extensionIdentifier];
    *(_DWORD *)uint64_t v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v5;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "Updating app extension: '%{public}@' for data type code: '%{public}@'", v17, 0x16u);
  }
  id v10 = *(id **)(a1 + 40);
  uint64_t v11 = [v5 integerValue];
  if (v10)
  {
    uint64_t v12 = v11;
    double v13 = [MEMORY[0x1E4F2B448] dataTypeWithCode:v11];
    if (v13)
    {
      double v14 = -[HDAppExtensionAssertion extension](v10);
      uint64_t v15 = v14;
      if (v14)
      {
        *(void *)uint64_t v17 = MEMORY[0x1E4F143A8];
        *(void *)&v17[8] = 3221225472;
        *(void *)&v17[16] = __58__HDAppExtensionAssertion__notifyAppExtensionForDataType___block_invoke;
        v18 = &unk_1E6300260;
        objc_super v19 = v10;
        uint64_t v22 = v12;
        id v16 = v14;
        id v20 = v16;
        id v21 = v13;
        [v16 notifyExtensionOfUpdateForSampleType:v21 completionHandler:v17];
      }
    }
  }
}

- (void)invalidateForDataType:(int64_t)a3 anchor:(id)a4
{
  id v11 = a4;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDAppExtensionAssertion.m", 177, @"Invalid parameter not satisfying: %@", @"anchor != nil" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  int v7 = [NSNumber numberWithInteger:a3];
  id v8 = [(NSMutableDictionary *)self->_pendingDataTypeCodesToAnchors objectForKeyedSubscript:v7];
  if ([v8 compare:v11] != 1)
  {
    [(NSMutableDictionary *)self->_pendingDataTypeCodesToAnchors removeObjectForKey:v7];
    [(NSMutableDictionary *)self->_pendingAssertionCompletions removeObjectForKey:v7];
  }
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_pendingDataTypeCodesToAnchors count];
    os_unfair_lock_unlock(&self->_lock);
    if (!v9) {
      -[HDAppExtensionAssertion _invalidate]((uint64_t)self);
    }
  }
}

- (BOOL)shouldAssert
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = !v2->_pendingAssertion;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)nextAssertionAttempt
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lastAssertionAttempt = self->_lastAssertionAttempt;
  double v5 = lastAssertionAttempt + exp2((double)self->_connectionErrorCount) * 15.0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

void __58__HDAppExtensionAssertion__notifyAppExtensionForDataType___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v5 = a3;
  v6 = (os_unfair_lock_s *)a1[4];
  if (a2)
  {
    os_unfair_lock_lock(v6 + 3);
    int v7 = [NSNumber numberWithInteger:a1[7]];
    id v8 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:v7];
    [*(id *)(a1[4] + 64) removeObjectForKey:v7];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 12));
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
    {
      id v10 = (void *)a1[5];
      id v11 = v9;
      uint64_t v12 = [v10 extensionIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      id v25 = v7;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "Updated app extension: '%{public}@' with data type code: %{public}@ and anchor: %{public}@", buf, 0x20u);
    }
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F2B3D8]) initWithDataAnchor:v8 associationAnchor:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
    uint64_t v15 = [WeakRetained appSubscriptionManager];
    uint64_t v16 = *(void *)(a1[4] + 24);
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", a1[6], 0);
    v18 = [NSNumber numberWithLong:time(0)];
    [v15 ackForBundleID:v16 dataTypes:v17 anchor:v13 ackTime:v18];
  }
  else
  {
    -[HDAppExtensionAssertion _incrementErrorCount]((uint64_t)v6);
    _HKInitializeLogging();
    objc_super v19 = (void *)*MEMORY[0x1E4F29F00];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v20 = (void *)a1[5];
    int v7 = v19;
    id v21 = [v20 extensionIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v21;
    __int16 v24 = 2114;
    id v25 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Failed to update app extension: '%{public}@' with error: %{public}@", buf, 0x16u);
  }
LABEL_7:
}

- (unint64_t)_unitTest_pendingAssertionCompletionsCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableDictionary *)self->_pendingAssertionCompletions count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_unitTest_pendingDataTypeCodesToAnchors
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = (void *)[(NSMutableDictionary *)self->_pendingDataTypeCodesToAnchors copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)_unitTest_connectionErrorCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t connectionErrorCount = self->_connectionErrorCount;
  os_unfair_lock_unlock(p_lock);
  return connectionErrorCount;
}

- (double)_unitTest_lastAssertionAttempt
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lastAssertionAttempt = self->_lastAssertionAttempt;
  os_unfair_lock_unlock(p_lock);
  return lastAssertionAttempt;
}

- (BOOL)_unitTest_invalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HDAppExtensionAssertionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDAppExtensionAssertionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)unitTest_errorCountDidIncrement
{
  return self->_unitTest_errorCountDidIncrement;
}

- (void)setUnitTest_errorCountDidIncrement:(id)a3
{
}

- (id)unitTest_extensionWillTimeout
{
  return self->_unitTest_extensionWillTimeout;
}

- (void)setUnitTest_extensionWillTimeout:(id)a3
{
}

- (BOOL)unitTest_timersWithShortTimeout
{
  return self->_unitTest_timersWithShortTimeout;
}

- (void)setUnitTest_timersWithShortTimeout:(BOOL)a3
{
  self->_unitTest_timersWithShortTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_graceTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_pendingDataTypeCodesToAnchors, 0);
  objc_storeStrong((id *)&self->_pendingAssertionCompletions, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong(&self->_unitTest_extensionWillTimeout, 0);
  objc_storeStrong(&self->_unitTest_errorCountDidIncrement, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end