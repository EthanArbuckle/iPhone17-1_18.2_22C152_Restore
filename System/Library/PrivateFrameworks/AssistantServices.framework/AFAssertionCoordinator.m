@interface AFAssertionCoordinator
- (AFAssertionCoordinator)initWithIdentifier:(id)a3 queue:(id)a4 delegate:(id)a5;
- (NSString)description;
- (NSString)identifier;
- (id)acquireRelinquishableAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4;
- (unint64_t)numberOfActiveAssertions;
- (unint64_t)numberOfPendingAndActiveAssertions;
- (void)_activateAssertionWithUUID:(id)a3;
- (void)_addAssertion:(id)a3;
- (void)_deactivateAndRemoveAssertionWithUUID:(id)a3 context:(id)a4 error:(id)a5 options:(unint64_t)a6;
- (void)_invalidate;
- (void)barrier:(id)a3;
- (void)dealloc;
- (void)getActiveAssertionsWithCompletion:(id)a3;
- (void)getPendingAndActiveAssertionsWithCompletion:(id)a3;
- (void)invalidate;
- (void)relinquishAsertionsPassingTest:(id)a3 context:(id)a4;
- (void)relinquishAsertionsPassingTest:(id)a3 error:(id)a4;
- (void)relinquishAssertionWithUUID:(id)a3 context:(id)a4 options:(unint64_t)a5;
- (void)relinquishAssertionWithUUID:(id)a3 error:(id)a4 options:(unint64_t)a5;
@end

@implementation AFAssertionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activeAssertionUUIDs, 0);
  objc_storeStrong((id *)&self->_assertionsByUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_invalidate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AFAssertionCoordinator _invalidate]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  v4 = [(NSMutableDictionary *)self->_assertionsByUUID allKeys];
  v5 = (void *)[v4 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        v11 = (void *)[[NSString alloc] initWithFormat:@"%@ Invalidated", self];
        v12 = +[AFError errorWithCode:42 description:v11];
        [(AFAssertionCoordinator *)self _deactivateAndRemoveAssertionWithUUID:v10 context:0 error:v12 options:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_deactivateAndRemoveAssertionWithUUID:(id)a3 context:(id)a4 error:(id)a5 options:(unint64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    v25 = v13;
    v26 = AFAssertionRelinquishmentOptionsGetNames(a6);
    int v27 = 136316162;
    v28 = "-[AFAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v10;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v11;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    v36 = v26;
    _os_log_debug_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_DEBUG, "%s assertionUUID = %@, context = %@, error = %@, options = %@", (uint8_t *)&v27, 0x34u);

    if (!v10) {
      goto LABEL_16;
    }
  }
  else if (!v10)
  {
    goto LABEL_16;
  }
  long long v14 = [(NSMutableDictionary *)self->_assertionsByUUID objectForKey:v10];
  if (v14)
  {
    int v15 = [(NSMutableSet *)self->_activeAssertionUUIDs containsObject:v10];
    if ((a6 & 1) != 0 && v15)
    {
      long long v16 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
      {
        int v27 = 136315394;
        v28 = "-[AFAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v14;
        _os_log_debug_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_DEBUG, "%s Skipped deactivating %@ because it is active and requested inactive only.", (uint8_t *)&v27, 0x16u);
      }
    }
    else
    {
      if (v15)
      {
        atomic_fetch_add(&self->_numberOfActiveAssertions, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v17 = [(NSMutableSet *)self->_activeAssertionUUIDs count];
        [(NSMutableSet *)self->_activeAssertionUUIDs removeObject:v10];
        uint64_t v18 = [(NSMutableSet *)self->_activeAssertionUUIDs count];
        v19 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
        {
          int v27 = 136315650;
          v28 = "-[AFAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
          __int16 v29 = 2048;
          uint64_t v30 = v17;
          __int16 v31 = 2048;
          uint64_t v32 = v18;
          _os_log_debug_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_DEBUG, "%s numberOfActiveAssertions: %llu -> %llu", (uint8_t *)&v27, 0x20u);
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained assertionCoordinator:self didDeactivateAssertion:v14 isLastAssertion:v18 == 0];
      }
      [v14 invokeRelinquishmentHandlerWithContext:v11 error:v12];
      uint64_t v21 = [(NSMutableDictionary *)self->_assertionsByUUID count];
      [(NSMutableDictionary *)self->_assertionsByUUID removeObjectForKey:v10];
      uint64_t v22 = [(NSMutableDictionary *)self->_assertionsByUUID count];
      v23 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
      {
        int v27 = 136315650;
        v28 = "-[AFAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
        __int16 v29 = 2048;
        uint64_t v30 = v21;
        __int16 v31 = 2048;
        uint64_t v32 = v22;
        _os_log_debug_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_DEBUG, "%s numberOfAssertions: %llu -> %llu", (uint8_t *)&v27, 0x20u);
      }
      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      [v24 assertionCoordinator:self didRemoveAssertion:v14 isLastAssertion:v22 == 0];
    }
  }

LABEL_16:
}

- (void)_activateAssertionWithUUID:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[AFAssertionCoordinator _activateAssertionWithUUID:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s assertionUUID = %@", buf, 0x16u);
    if (!v4) {
      goto LABEL_12;
    }
  }
  else if (!v4)
  {
    goto LABEL_12;
  }
  if (([(NSMutableSet *)self->_activeAssertionUUIDs containsObject:v4] & 1) == 0)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_assertionsByUUID objectForKey:v4];
    if (v6)
    {
      atomic_fetch_add(&self->_numberOfActiveAssertions, 1uLL);
      uint64_t v7 = [(NSMutableSet *)self->_activeAssertionUUIDs count];
      [(NSMutableSet *)self->_activeAssertionUUIDs addObject:v4];
      *(double *)&uint64_t v8 = COERCE_DOUBLE([(NSMutableSet *)self->_activeAssertionUUIDs count]);
      uint64_t v9 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[AFAssertionCoordinator _activateAssertionWithUUID:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2048;
        double v35 = *(double *)&v8;
        _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s numberOfActiveAssertions: %llu -> %llu", buf, 0x20u);
      }
      BOOL v10 = v7 == 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained assertionCoordinator:self didActivateAssertion:v6 isFirstAssertion:v10];

      id v12 = [v6 context];
      [v12 expirationDuration];
      double v14 = v13;

      if (v14 > 0.0)
      {
        objc_initWeak(&location, self);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __53__AFAssertionCoordinator__activateAssertionWithUUID___block_invoke;
        v29[3] = &unk_1E5925278;
        objc_copyWeak(&v32, &location);
        id v15 = v6;
        id v30 = v15;
        id v31 = v4;
        long long v16 = (void *)MEMORY[0x19F3A50D0](v29);
        uint64_t v17 = [v15 context];
        uint64_t v18 = [v17 effectiveDate];

        [v18 timeIntervalSinceNow];
        double v20 = v19;
        uint64_t v21 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[AFAssertionCoordinator _activateAssertionWithUUID:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2048;
          double v35 = v14 + v20;
          _os_log_debug_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_DEBUG, "%s Deactivating %@ in %f seconds...", buf, 0x20u);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        double v35 = COERCE_DOUBLE(__Block_byref_object_copy_);
        v36 = __Block_byref_object_dispose_;
        dispatch_source_t v37 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
        uint64_t v22 = *(NSObject **)(*(void *)&buf[8] + 40);
        dispatch_time_t v23 = AFDispatchTimeGetFromDateAndOffset(v18, v14);
        dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
        id v24 = *(NSObject **)(*(void *)&buf[8] + 40);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __53__AFAssertionCoordinator__activateAssertionWithUUID___block_invoke_113;
        v26[3] = &unk_1E592C058;
        id v27 = v16;
        v28 = buf;
        id v25 = v16;
        dispatch_source_set_event_handler(v24, v26);
        dispatch_resume(*(dispatch_object_t *)(*(void *)&buf[8] + 40));

        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_12:
}

void __53__AFAssertionCoordinator__activateAssertionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      uint64_t v8 = "-[AFAssertionCoordinator _activateAssertionWithUUID:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Deactivating %@ now...", (uint8_t *)&v7, 0x16u);
    }
    [WeakRetained _deactivateAndRemoveAssertionWithUUID:*(void *)(a1 + 40) context:v3 error:0 options:0];
  }
}

void __53__AFAssertionCoordinator__activateAssertionWithUUID___block_invoke_113(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[AFAssertionContext newWithBuilder:&__block_literal_global_2575];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    dispatch_source_cancel(v4);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __53__AFAssertionCoordinator__activateAssertionWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTimestamp:mach_absolute_time()];
  [v2 setReason:@"Expired on Schedule"];
}

- (void)_addAssertion:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[AFAssertionCoordinator _addAssertion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s assertion = %@", buf, 0x16u);
    if (!v4) {
      goto LABEL_22;
    }
  }
  else if (!v4)
  {
    goto LABEL_22;
  }
  uint64_t v6 = [v4 context];
  int v7 = [v6 effectiveDate];

  uint64_t v8 = [v4 context];
  [v8 expirationDuration];
  double v10 = v9;

  if (v10 >= 0.0)
  {
    [v7 timeIntervalSinceNow];
    double v14 = v13;
    if (v13 < 0.0 && v10 > 0.0 && (double v15 = v10 + v13, v15 < 0.0))
    {
      __int16 v29 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[AFAssertionCoordinator _addAssertion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2048;
        v39 = *(uint64_t (**)(uint64_t, uint64_t))&v15;
        _os_log_error_impl(&dword_19CF1D000, v29, OS_LOG_TYPE_ERROR, "%s %@ expired %f seconds ago.", buf, 0x20u);
      }
      id v12 = +[AFError errorWithCode:31 description:@"Expired effective date and expiration duration."];
      [v4 invokeRelinquishmentHandlerWithContext:0 error:v12];
    }
    else
    {
      long long v16 = [v4 uuid];
      uint64_t v17 = [(NSMutableDictionary *)self->_assertionsByUUID count];
      [(NSMutableDictionary *)self->_assertionsByUUID setObject:v4 forKey:v16];
      uint64_t v18 = [(NSMutableDictionary *)self->_assertionsByUUID count];
      double v19 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[AFAssertionCoordinator _addAssertion:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2048;
        v39 = (uint64_t (*)(uint64_t, uint64_t))v18;
        _os_log_debug_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_DEBUG, "%s numberOfAssertions: %llu -> %llu", buf, 0x20u);
      }
      BOOL v20 = v17 == 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained assertionCoordinator:self didAddAssertion:v4 isFirstAssertion:v20];

      objc_initWeak(&location, self);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __40__AFAssertionCoordinator__addAssertion___block_invoke;
      v33[3] = &unk_1E592A3E0;
      objc_copyWeak(&v36, &location);
      id v22 = v4;
      id v34 = v22;
      id v12 = v16;
      id v35 = v12;
      uint64_t v23 = MEMORY[0x19F3A50D0](v33);
      id v24 = (void *)v23;
      if (v14 <= 0.0)
      {
        (*(void (**)(uint64_t))(v23 + 16))(v23);
      }
      else
      {
        id v25 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[AFAssertionCoordinator _addAssertion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v22;
          *(_WORD *)&buf[22] = 2048;
          v39 = *(uint64_t (**)(uint64_t, uint64_t))&v14;
          _os_log_debug_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_DEBUG, "%s Activating %@ in %f seconds...", buf, 0x20u);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v39 = __Block_byref_object_copy_;
        v40 = __Block_byref_object_dispose_;
        dispatch_source_t v41 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
        v26 = *(NSObject **)(*(void *)&buf[8] + 40);
        dispatch_time_t v27 = AFDispatchTimeGetFromDateAndOffset(v7, 0.0);
        dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
        v28 = *(NSObject **)(*(void *)&buf[8] + 40);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __40__AFAssertionCoordinator__addAssertion___block_invoke_111;
        v30[3] = &unk_1E592C058;
        id v31 = v24;
        id v32 = buf;
        dispatch_source_set_event_handler(v28, v30);
        dispatch_resume(*(dispatch_object_t *)(*(void *)&buf[8] + 40));

        _Block_object_dispose(buf, 8);
      }

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v11 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[AFAssertionCoordinator _addAssertion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2048;
      v39 = *(uint64_t (**)(uint64_t, uint64_t))&v10;
      _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s %@ contains invalid expiration duration %f.", buf, 0x20u);
    }
    id v12 = +[AFError errorWithCode:31 description:@"Invalid Expiration Duration"];
    [v4 invokeRelinquishmentHandlerWithContext:0 error:v12];
  }

LABEL_22:
}

void __40__AFAssertionCoordinator__addAssertion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315394;
      uint64_t v6 = "-[AFAssertionCoordinator _addAssertion:]_block_invoke";
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s Activating %@ now...", (uint8_t *)&v5, 0x16u);
    }
    [WeakRetained _activateAssertionWithUUID:*(void *)(a1 + 40)];
  }
}

void __40__AFAssertionCoordinator__addAssertion___block_invoke_111(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v7 = "-[AFAssertionCoordinator invalidate]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AFAssertionCoordinator_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__AFAssertionCoordinator_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__AFAssertionCoordinator_barrier___block_invoke;
    block[3] = &unk_1E592C360;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

uint64_t __34__AFAssertionCoordinator_barrier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getActiveAssertionsWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__AFAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __60__AFAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  if (v2)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__AFAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E592C188;
    v10[4] = v7;
    id v9 = v6;
    id v11 = v9;
    [v8 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9, v3, v4, v5);
}

void __60__AFAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:a2];
  if (v3)
  {
    uint64_t v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v3 = v4;
  }
}

- (unint64_t)numberOfActiveAssertions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = atomic_load((unint64_t *)&self->_numberOfActiveAssertions);
  if ((v2 & 0x8000000000000000) != 0)
  {
    uint64_t v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[AFAssertionCoordinator numberOfActiveAssertions]";
      __int16 v7 = 2048;
      unint64_t v8 = v2;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s numberOfActiveAssertions is %lld", (uint8_t *)&v5, 0x16u);
    }
    return 0;
  }
  return v2;
}

- (void)getPendingAndActiveAssertionsWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__AFAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __70__AFAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (v2)
  {
    unint64_t v3 = v2;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) count];
    if (v4)
    {
      unint64_t v5 = v4;
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
      id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
      if (v3 >= v5) {
        unint64_t v8 = v3 - v5;
      }
      else {
        unint64_t v8 = 0;
      }
      uint64_t v9 = (void *)[v7 initWithCapacity:v8];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 32);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__AFAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke_2;
      v14[3] = &unk_1E5925250;
      v14[4] = v10;
      id v12 = v6;
      id v15 = v12;
      id v13 = v9;
      id v16 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v14];
    }
    else
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 32) allValues];
      id v12 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __70__AFAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v8 = a3;
  int v6 = [v5 containsObject:a2];
  uint64_t v7 = 48;
  if (v6) {
    uint64_t v7 = 40;
  }
  [*(id *)(a1 + v7) addObject:v8];
}

- (unint64_t)numberOfPendingAndActiveAssertions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = atomic_load((unint64_t *)&self->_numberOfAssertions);
  if ((v2 & 0x8000000000000000) != 0)
  {
    unint64_t v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      int v6 = "-[AFAssertionCoordinator numberOfPendingAndActiveAssertions]";
      __int16 v7 = 2048;
      unint64_t v8 = v2;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s numberOfPendingAndActiveAssertions is %lld", (uint8_t *)&v5, 0x16u);
    }
    return 0;
  }
  return v2;
}

- (void)relinquishAsertionsPassingTest:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v14 = "-[AFAssertionCoordinator relinquishAsertionsPassingTest:error:]";
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s error = %@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__AFAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke;
    block[3] = &unk_1E592C598;
    void block[4] = self;
    id v12 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __63__AFAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__AFAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke_2;
  v16[3] = &unk_1E5925228;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v18 = v4;
  v16[4] = v5;
  id v6 = v2;
  id v17 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(a1 + 32), "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), 0, *(void *)(a1 + 40), 0, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v9);
  }
}

void __63__AFAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  id v7 = a3;
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v7, [v6 containsObject:v8]);

  if (v5) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)relinquishAsertionsPassingTest:(id)a3 context:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v14 = "-[AFAssertionCoordinator relinquishAsertionsPassingTest:context:]";
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__AFAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke;
    block[3] = &unk_1E592C598;
    void block[4] = self;
    id v12 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __65__AFAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__AFAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke_2;
  v16[3] = &unk_1E5925228;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v18 = v4;
  v16[4] = v5;
  id v6 = v2;
  id v17 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(a1 + 32), "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), *(void *)(a1 + 40), 0, 0, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v9);
  }
}

void __65__AFAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  id v7 = a3;
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v7, [v6 containsObject:v8]);

  if (v5) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)relinquishAssertionWithUUID:(id)a3 error:(id)a4 options:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    long long v12 = AFAssertionRelinquishmentOptionsGetNames(a5);
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = "-[AFAssertionCoordinator relinquishAssertionWithUUID:error:options:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    dispatch_time_t v27 = v12;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s assertionUUID = %@, error = %@, options = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__AFAssertionCoordinator_relinquishAssertionWithUUID_error_options___block_invoke;
  v16[3] = &unk_1E5929398;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = a5;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

uint64_t __68__AFAssertionCoordinator_relinquishAssertionWithUUID_error_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateAndRemoveAssertionWithUUID:*(void *)(a1 + 40) context:0 error:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
}

- (void)relinquishAssertionWithUUID:(id)a3 context:(id)a4 options:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    long long v12 = AFAssertionRelinquishmentOptionsGetNames(a5);
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = "-[AFAssertionCoordinator relinquishAssertionWithUUID:context:options:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    dispatch_time_t v27 = v12;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s assertionUUID = %@, context = %@, options = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__AFAssertionCoordinator_relinquishAssertionWithUUID_context_options___block_invoke;
  v16[3] = &unk_1E5929398;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = a5;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

uint64_t __70__AFAssertionCoordinator_relinquishAssertionWithUUID_context_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateAndRemoveAssertionWithUUID:*(void *)(a1 + 40) context:*(void *)(a1 + 48) error:0 options:*(void *)(a1 + 56)];
}

- (id)acquireRelinquishableAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_time_t v27 = "-[AFAssertionCoordinator acquireRelinquishableAssertionWithContext:relinquishmentHandler:]";
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  atomic_fetch_add(&self->_numberOfAssertions, 1uLL);
  id v9 = [_AFAssertionImpl alloc];
  id v10 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__AFAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke;
  v24[3] = &unk_1E5925200;
  v24[4] = self;
  id v25 = v7;
  id v11 = v7;
  long long v12 = [(_AFAssertionImpl *)v9 initWithUUID:v10 context:v6 relinquishmentHandler:v24];

  queue = self->_queue;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __90__AFAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke_2;
  uint64_t v21 = &unk_1E592C710;
  __int16 v22 = self;
  id v23 = v12;
  id v14 = v12;
  dispatch_async(queue, &v18);
  id v15 = [_AFAssertionProxy alloc];
  id v16 = -[_AFAssertionProxy initWithImpl:coordinator:](v15, "initWithImpl:coordinator:", v14, self, v18, v19, v20, v21, v22);

  return v16;
}

uint64_t __90__AFAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke(uint64_t a1)
{
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __90__AFAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAssertion:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[AFAssertionCoordinator dealloc]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  [(AFAssertionCoordinator *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)AFAssertionCoordinator;
  [(AFAssertionCoordinator *)&v4 dealloc];
}

- (AFAssertionCoordinator)initWithIdentifier:(id)a3 queue:(id)a4 delegate:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AFAssertionCoordinator;
  id v11 = [(AFAssertionCoordinator *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assertionsByUUID = v11->_assertionsByUUID;
    v11->_assertionsByUUID = v14;

    id v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeAssertionUUIDs = v11->_activeAssertionUUIDs;
    v11->_activeAssertionUUIDs = v16;

    uint64_t v18 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[AFAssertionCoordinator initWithIdentifier:queue:delegate:]";
      __int16 v23 = 2112;
      __int16 v24 = v11;
      _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
  }

  return v11;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFAssertionCoordinator;
  objc_super v4 = [(AFAssertionCoordinator *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ {identifier = %@, numberOfAssertions = %llu/%llu}", v4, self->_identifier, -[AFAssertionCoordinator numberOfActiveAssertions](self, "numberOfActiveAssertions"), -[AFAssertionCoordinator numberOfPendingAndActiveAssertions](self, "numberOfPendingAndActiveAssertions")];

  return (NSString *)v5;
}

@end