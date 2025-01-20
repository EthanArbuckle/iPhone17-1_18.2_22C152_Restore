@interface CHSServerSubscription
- (BOOL)_lock_createServerSubscriptionIfNecessary:(id *)a3 forcing:(BOOL)a4;
- (BOOL)_lock_updateSubscription:(id *)a3;
- (BOOL)isSubscribed;
- (BOOL)resubscribeIfNecessary;
- (CHSServerSubscription)initWithIdentifier:(id)a3 serverSubscriptionBlock:(id)a4;
- (NSObject)cachedValue;
- (NSString)identifier;
- (id)subscribeWithResult:(id *)a3 error:(id *)a4;
- (id)subscribeWithResult:(id *)a3 forcingServerUpdate:(BOOL)a4 error:(id *)a5;
- (id)updateSubscription:(id *)a3;
- (void)noteConnectionTerminated;
- (void)setCachedValue:(id)a3;
- (void)updateCachedValue:(id)a3;
@end

@implementation CHSServerSubscription

- (CHSServerSubscription)initWithIdentifier:(id)a3 serverSubscriptionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CHSServerSubscription;
  v8 = [(CHSServerSubscription *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_lock._os_unfair_lock_opaque = 0;
    lock_cachedValue = v8->_lock_cachedValue;
    v8->_lock_cachedValue = 0;

    uint64_t v12 = [v7 copy];
    id lock_subscriptionBlock = v8->_lock_subscriptionBlock;
    v8->_id lock_subscriptionBlock = (id)v12;
  }
  return v8;
}

- (NSObject)cachedValue
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__CHSServerSubscription_cachedValue__block_invoke;
  v5[3] = &unk_1E56C8600;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __36__CHSServerSubscription_cachedValue__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__CHSServerSubscription_cachedValue__block_invoke(uint64_t a1)
{
}

- (BOOL)isSubscribed
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  p_lock = &self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__CHSServerSubscription_isSubscribed__block_invoke;
  v4[3] = &unk_1E56C8600;
  v4[4] = self;
  v4[5] = &v5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __37__CHSServerSubscription_isSubscribed__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)p_lock;
}

uint64_t __37__CHSServerSubscription_isSubscribed__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)setCachedValue:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__CHSServerSubscription_setCachedValue___block_invoke;
  v7[3] = &unk_1E56C81F0;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __40__CHSServerSubscription_setCachedValue___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

void __40__CHSServerSubscription_setCachedValue___block_invoke(uint64_t a1)
{
}

- (void)updateCachedValue:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CHSServerSubscription_updateCachedValue___block_invoke;
  v7[3] = &unk_1E56C9340;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __43__CHSServerSubscription_updateCachedValue___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

void __43__CHSServerSubscription_updateCachedValue___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (id)subscribeWithResult:(id *)a3 error:(id *)a4
{
  return [(CHSServerSubscription *)self subscribeWithResult:a3 forcingServerUpdate:0 error:a4];
}

- (id)subscribeWithResult:(id *)a3 forcingServerUpdate:(BOOL)a4 error:(id *)a5
{
  uint64_t v9 = NSString;
  identifier = self->_identifier;
  id v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v9 stringWithFormat:@"<%@: %@>", identifier, v11];

  id v13 = objc_alloc(MEMORY[0x1E4F4F838]);
  v14 = self->_identifier;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke;
  v38[3] = &unk_1E56C9368;
  v38[4] = self;
  objc_super v15 = (void *)[v13 initWithIdentifier:v12 forReason:v14 invalidationBlock:v38];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  p_lock = &self->_lock;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_28;
  v21[3] = &unk_1E56C9390;
  v21[4] = self;
  id v17 = v15;
  id v22 = v17;
  v23 = &v32;
  BOOL v25 = a4;
  v24 = &v26;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_28((uint64_t)v21);
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = (id) v27[5];
  }
  if (a5) {
    *a5 = (id) v33[5];
  }
  v18 = v22;
  id v19 = v17;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

void __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(os_unfair_lock_s **)(a1 + 32);
  uint64_t v5 = v4 + 4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_2;
  v7[3] = &unk_1E56C81F0;
  v7[4] = v4;
  id v6 = v3;
  id v8 = v6;
  os_unfair_lock_assert_not_owner(v5);
  os_unfair_lock_lock(v5);
  __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_2((uint64_t)v7);
  os_unfair_lock_unlock(v5);
}

void __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = CHSLogSubscriptions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 8);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v3 + 32), "count"));
    int v11 = 138543618;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remaining local subscription count (post remove): %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v6 = CHSLogSubscriptions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      int v11 = 138543362;
      uint64_t v12 = v7;
      _os_log_impl(&dword_190C6F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating server subscription (no more subscribers)", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    [*(id *)(v9 + 40) invalidate];
    v10 = *(void **)(*(void *)v8 + 40);
    *(void *)(*(void *)v8 + 40) = 0;
  }
}

void __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_28(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  id v6 = CHSLogSubscriptions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 8);
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v7 + 32), "count"));
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl(&dword_190C6F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Local subscription count (post add): %{public}@", buf, 0x16u);
  }
  v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v11 + 40);
  objc_msgSend(v10, "_lock_createServerSubscriptionIfNecessary:forcing:", &obj, *(unsigned __int8 *)(a1 + 64));
  objc_storeStrong((id *)(v11 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v12 = CHSLogSubscriptions();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v14;
      _os_log_impl(&dword_190C6F000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error subscribing to server: %{public}@", buf, 0x16u);
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
}

- (id)updateSubscription:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  __int16 v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CHSServerSubscription_updateSubscription___block_invoke;
  v7[3] = &unk_1E56C85D8;
  v7[4] = self;
  void v7[5] = &v14;
  v7[6] = &v8;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __44__CHSServerSubscription_updateSubscription___block_invoke(v7);
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __44__CHSServerSubscription_updateSubscription___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_lock_updateSubscription:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
}

- (void)noteConnectionTerminated
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CHSLogSubscriptions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = identifier;
    _os_log_impl(&dword_190C6F000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Connection terminated; killing subscription.",
      buf,
      0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__CHSServerSubscription_noteConnectionTerminated__block_invoke;
  v5[3] = &unk_1E56C8238;
  v5[4] = self;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __49__CHSServerSubscription_noteConnectionTerminated__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);
}

void __49__CHSServerSubscription_noteConnectionTerminated__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (BOOL)resubscribeIfNecessary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CHSLogSubscriptions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = identifier;
    _os_log_impl(&dword_190C6F000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resubscribing to server if necessary", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__CHSServerSubscription_resubscribeIfNecessary__block_invoke;
  v12[3] = &unk_1E56C85B0;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &buf;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __47__CHSServerSubscription_resubscribeIfNecessary__block_invoke(v12);
  os_unfair_lock_unlock(&self->_lock);
  if (!*((unsigned char *)v14 + 24))
  {
    id v5 = CHSLogSubscriptions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = self->_identifier;
      *(_DWORD *)uint64_t v17 = 138543362;
      __int16 v18 = v6;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] No server subscription necessary.", v17, 0xCu);
    }
  }
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v7 = CHSLogSubscriptions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = self->_identifier;
      uint64_t v9 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v17 = 138543618;
      __int16 v18 = v8;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error re-subscribing to server: %{public}@", v17, 0x16u);
    }
  }
  BOOL v10 = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __47__CHSServerSubscription_resubscribeIfNecessary__block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = objc_msgSend(v2, "_lock_createServerSubscriptionIfNecessary:forcing:", &obj, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)_lock_createServerSubscriptionIfNecessary:(id *)a3 forcing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  NSUInteger v7 = [(NSHashTable *)self->_lock_localSubscriptions count];
  if (v7)
  {
    if (self->_lock_serverSubscription) {
      BOOL v8 = !v4;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      uint64_t v9 = CHSLogSubscriptions();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSHashTable count](self->_lock_localSubscriptions, "count"));
        int v13 = 138543618;
        uint64_t v14 = identifier;
        __int16 v15 = 2114;
        char v16 = v11;
        _os_log_impl(&dword_190C6F000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Subscribing to server... %{public}@ local subscriptions.", (uint8_t *)&v13, 0x16u);
      }
      LOBYTE(v7) = [(CHSServerSubscription *)self _lock_updateSubscription:a3];
    }
  }
  return v7;
}

- (BOOL)_lock_updateSubscription:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (*((void (**)(void))self->_lock_subscriptionBlock + 2))();
  if (v5)
  {
    id v6 = CHSLogSubscriptions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      int v20 = 138543362;
      v21 = identifier;
      _os_log_impl(&dword_190C6F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating subscription to server: success", (uint8_t *)&v20, 0xCu);
    }

    [(BSInvalidatable *)self->_lock_serverSubscription invalidate];
    BOOL v8 = [v5 assertion];
    lock_serverSubscription = self->_lock_serverSubscription;
    self->_lock_serverSubscription = v8;

    BOOL v10 = [v5 value];
    lock_cachedValue = self->_lock_cachedValue;
    self->_lock_cachedValue = v10;

    if (a3)
    {
      uint64_t v12 = [v5 error];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        uint64_t v14 = CHSLogSubscriptions();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = self->_identifier;
          char v16 = [v5 error];
          int v20 = 138543618;
          v21 = v15;
          __int16 v22 = 2114;
          v23 = v16;
          _os_log_impl(&dword_190C6F000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating subscription to server: failed: %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }
      *a3 = [v5 error];
    }
  }
  else
  {
    uint64_t v17 = CHSLogSubscriptions();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = self->_identifier;
      int v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_190C6F000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating nsubscription to server: failed for unknown reason", (uint8_t *)&v20, 0xCu);
    }
  }
  return v5 != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_subscriptionBlock, 0);
  objc_storeStrong((id *)&self->_lock_serverSubscription, 0);
  objc_storeStrong((id *)&self->_lock_localSubscriptions, 0);
  objc_storeStrong((id *)&self->_lock_cachedValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end