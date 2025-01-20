@interface BKSHIDEventDeliveryPolicyObserver
- (BKSHIDEventDeferringEnvironment)deferringEnvironment;
- (BKSHIDEventDeferringToken)deferringToken;
- (BKSHIDEventDeliveryPolicyObserver)init;
- (BKSHIDEventDisplay)display;
- (BOOL)canReceiveEvents;
- (NSString)debugDescription;
- (NSString)description;
- (id)_initWithObserver:(id)a3;
- (id)_lock_description;
- (id)_lock_updateStateWithBlock:(id)a3;
- (int64_t)_lock_policyStatus;
- (int64_t)policyStatus;
- (void)_lock_appendDescriptionToStream:(id)a3;
- (void)addObserver:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)deferringResolutionsChanged;
- (void)removeObserver:(id)a3;
- (void)setDeferringEnvironment:(id)a3;
- (void)setDeferringToken:(id)a3;
- (void)setDisplay:(id)a3;
@end

@implementation BKSHIDEventDeliveryPolicyObserver

- (int64_t)_lock_policyStatus
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = self->_lock_observations;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
      pid_t v10 = getpid();
      if (v10 == objc_msgSend(v9, "pid", (void)v22))
      {
        lock_display = self->_lock_display;
        if (!lock_display
          || ([v9 display],
              v12 = objc_claimAutoreleasedReturnValue(),
              BOOL v13 = [(BKSHIDEventDisplay *)lock_display isEqual:v12],
              v12,
              v13))
        {
          lock_environment = self->_lock_environment;
          if (!lock_environment
            || ([v9 environment],
                v15 = objc_claimAutoreleasedReturnValue(),
                BOOL v16 = [(BKSHIDEventDeferringEnvironment *)lock_environment isEqual:v15],
                v15,
                v16))
          {
            lock_token = self->_lock_token;
            if (!lock_token
              || ([v9 token],
                  v18 = objc_claimAutoreleasedReturnValue(),
                  int v19 = [(BKSHIDEventDeferringToken *)lock_token isEqual:v18],
                  v18,
                  v19))
            {
              uint64_t v20 = [v9 policyStatus];
              if (v20 > v6) {
                int64_t v6 = v20;
              }
              if (v6 == 2) {
                break;
              }
            }
          }
        }
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 style];
  uint64_t v5 = [v4 clientInformation];
  int v6 = [v5 containsObject:@"_BKSHIDEventDeliveryPolicyObserver_locked"];

  if (v6)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    [(BKSHIDEventDeliveryPolicyObserver *)self _lock_appendDescriptionToStream:v7];
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    [(BKSHIDEventDeliveryPolicyObserver *)self _lock_appendDescriptionToStream:v7];

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_lock_appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__BKSHIDEventDeliveryPolicyObserver__lock_appendDescriptionToStream___block_invoke;
  v8[3] = &unk_1E5441BB0;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [v5 appendProem:self block:v8];
  if ([v5 hasDebugStyle])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__BKSHIDEventDeliveryPolicyObserver__lock_appendDescriptionToStream___block_invoke_2;
    v6[3] = &unk_1E5441BB0;
    v6[4] = self;
    id v7 = v5;
    [v7 appendBodySectionWithName:0 block:v6];
  }
}

- (void)deferringResolutionsChanged
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__BKSHIDEventDeliveryPolicyObserver_deferringResolutionsChanged__block_invoke;
  v18[3] = &unk_1E5441710;
  v18[4] = self;
  id v4 = [(BKSHIDEventDeliveryPolicyObserver *)self _lock_updateStateWithBlock:v18];
  os_unfair_lock_unlock(p_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        pid_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = BKLogEventDelivery();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = objc_opt_class();
          *(_DWORD *)buf = 134218498;
          uint64_t v20 = self;
          __int16 v21 = 2114;
          long long v22 = v12;
          __int16 v23 = 2048;
          long long v24 = v10;
          id v13 = v12;
          _os_log_impl(&dword_18AA0B000, v11, OS_LOG_TYPE_DEFAULT, "observerPolicyDidChange: %p -> <%{public}@: %p>", buf, 0x20u);
        }
        [v10 observerDeliveryPolicyDidChange:self];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v25 count:16];
    }
    while (v7);
  }
}

- (id)_lock_updateStateWithBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a3;
  if (!v5)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v16 = NSStringFromSelector(a2);
      long long v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138544642;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      long long v22 = v18;
      __int16 v23 = 2048;
      long long v24 = self;
      __int16 v25 = 2114;
      uint64_t v26 = @"BKSHIDEventDeliveryPolicyObserver.m";
      __int16 v27 = 1024;
      int v28 = 206;
      __int16 v29 = 2114;
      v30 = v15;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA17C34);
  }
  uint64_t v6 = v5;
  os_unfair_lock_assert_owner(&self->_lock);
  unint64_t lock_policyStatus = self->_lock_policyStatus;
  v6[2](v6);
  int64_t v8 = [(BKSHIDEventDeliveryPolicyObserver *)self _lock_policyStatus];
  self->_unint64_t lock_policyStatus = v8;
  if (v8 == lock_policyStatus)
  {
    id v9 = 0;
  }
  else
  {
    pid_t v10 = BKLogEventDelivery();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(BKSHIDEventDeliveryPolicyObserver *)self _lock_description];
      v12 = NSStringFromBKSHIDEventDeferringPolicyStatus(lock_policyStatus);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      long long v22 = v12;
      _os_log_impl(&dword_18AA0B000, v10, OS_LOG_TYPE_DEFAULT, "policyStatus:%{public}@ was:%{public}@", buf, 0x16u);
    }
    id v13 = [(NSHashTable *)self->_lock_observers allObjects];
    id v9 = (void *)[v13 copy];
  }
  return v9;
}

void __64__BKSHIDEventDeliveryPolicyObserver_deferringResolutionsChanged__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) deferringObservations];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

void __69__BKSHIDEventDeliveryPolicyObserver__lock_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[4];
  if (v3)
  {
    id v4 = (id)[*(id *)(a1 + 40) appendObject:v2[4] withName:@"display"];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t v5 = v2[5];
  if (v5)
  {
    id v6 = (id)[*(id *)(a1 + 40) appendObject:v5 withName:@"environment"];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 48);
    if (!v7) {
      goto LABEL_8;
    }
LABEL_7:
    id v8 = (id)[*(id *)(a1 + 40) appendObject:v7 withName:@"token"];
    goto LABEL_8;
  }
  uint64_t v7 = v2[6];
  if (v7) {
    goto LABEL_7;
  }
  if (!v3) {
    [*(id *)(a1 + 40) appendString:@"process scope" withName:0];
  }
LABEL_8:
  id v9 = *(void **)(a1 + 40);
  NSStringFromBKSHIDEventDeferringPolicyStatus(*(void *)(*(void *)(a1 + 32) + 64));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v9 appendString:v10 withName:@"status"];
}

- (id)_lock_description
{
  if (_lock_description_onceToken != -1) {
    dispatch_once(&_lock_description_onceToken, &__block_literal_global_2368);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = _lock_description_lockedStyle;
  return (id)[v3 descriptionForRootObject:self withStyle:v4];
}

uint64_t __55__BKSHIDEventDeliveryPolicyObserver_setDeferringToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v3 + 48) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

void __55__BKSHIDEventDeliveryPolicyObserver__initWithObserver___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) deferringObservations];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

- (int64_t)policyStatus
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_policyStatus = self->_lock_policyStatus;
  os_unfair_lock_unlock(p_lock);
  return lock_policyStatus;
}

uint64_t __54__BKSHIDEventDeliveryPolicyObserver__lock_description__block_invoke()
{
  _lock_description_lockedStyle = [MEMORY[0x1E4F4F728] build:&__block_literal_global_53];
  return MEMORY[0x1F41817F8]();
}

void __54__BKSHIDEventDeliveryPolicyObserver__lock_description__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = a2;
  id v4 = [v2 setWithObject:@"_BKSHIDEventDeliveryPolicyObserver_locked"];
  [v3 setClientInformation:v4];
}

- (BKSHIDEventDeliveryPolicyObserver)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    id v8 = [NSString stringWithFormat:@"BKSHIDEventDeliveryPolicyObserver does not support subclassing"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v9 = NSStringFromSelector(a2);
      id v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      long long v15 = v11;
      __int16 v16 = 2048;
      long long v17 = self;
      __int16 v18 = 2114;
      int v19 = @"BKSHIDEventDeliveryPolicyObserver.m";
      __int16 v20 = 1024;
      int v21 = 54;
      __int16 v22 = 2114;
      __int16 v23 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1F1E4);
  }
  id v5 = +[BKSHIDEventObserver sharedInstance];
  id v6 = [(BKSHIDEventDeliveryPolicyObserver *)self _initWithObserver:v5];

  return v6;
}

- (id)_initWithObserver:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    __int16 v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v17 = NSStringFromSelector(a2);
      __int16 v18 = (objc_class *)objc_opt_class();
      int v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      uint64_t v24 = v17;
      __int16 v25 = 2114;
      uint64_t v26 = v19;
      __int16 v27 = 2048;
      int v28 = self;
      __int16 v29 = 2114;
      v30 = @"BKSHIDEventDeliveryPolicyObserver.m";
      __int16 v31 = 1024;
      int v32 = 59;
      __int16 v33 = 2114;
      v34 = v16;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1F43CLL);
  }
  uint64_t v7 = v6;
  v22.receiver = self;
  v22.super_class = (Class)BKSHIDEventDeliveryPolicyObserver;
  id v8 = [(BKSHIDEventDeliveryPolicyObserver *)&v22 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_observer, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    lock_observers = v9->_lock_observers;
    v9->_lock_observers = (NSHashTable *)v10;

    uint64_t v12 = [(BKSHIDEventObserver *)v9->_observer addDeferringObserver:v9];
    observingAssertion = v9->_observingAssertion;
    v9->_observingAssertion = (BSInvalidatable *)v12;

    os_unfair_lock_lock(&v9->_lock);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__BKSHIDEventDeliveryPolicyObserver__initWithObserver___block_invoke;
    v20[3] = &unk_1E5441710;
    int v21 = v9;
    id v14 = [(BKSHIDEventDeliveryPolicyObserver *)v21 _lock_updateStateWithBlock:v20];
    os_unfair_lock_unlock(&v9->_lock);
  }
  return v9;
}

- (void)addObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(a2);
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      __int16 v12 = 2114;
      id v13 = v8;
      __int16 v14 = 2048;
      long long v15 = self;
      __int16 v16 = 2114;
      long long v17 = @"BKSHIDEventDeliveryPolicyObserver.m";
      __int16 v18 = 1024;
      int v19 = 158;
      __int16 v20 = 2114;
      int v21 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA23AD0);
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers addObject:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDeferringToken:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = NSString;
      id v8 = (objc_class *)[v5 classForCoder];
      if (!v8) {
        id v8 = (objc_class *)objc_opt_class();
      }
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      __int16 v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"token", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = NSStringFromSelector(a2);
        __int16 v14 = (objc_class *)objc_opt_class();
        long long v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        int v19 = v13;
        __int16 v20 = 2114;
        int v21 = v15;
        __int16 v22 = 2048;
        __int16 v23 = self;
        __int16 v24 = 2114;
        __int16 v25 = @"BKSHIDEventDeliveryPolicyObserver.m";
        __int16 v26 = 1024;
        int v27 = 131;
        __int16 v28 = 2114;
        __int16 v29 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA241E0);
    }
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ((BSEqualObjects() & 1) == 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__BKSHIDEventDeliveryPolicyObserver_setDeferringToken___block_invoke;
    v16[3] = &unk_1E5441BB0;
    v16[4] = self;
    id v17 = v5;
    id v6 = [(BKSHIDEventDeliveryPolicyObserver *)self _lock_updateStateWithBlock:v16];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_observations, 0);
  objc_storeStrong((id *)&self->_lock_token, 0);
  objc_storeStrong((id *)&self->_lock_environment, 0);
  objc_storeStrong((id *)&self->_lock_display, 0);
  objc_storeStrong((id *)&self->_observingAssertion, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

id __69__BKSHIDEventDeliveryPolicyObserver__lock_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 56) count]) {
    id v2 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 56) withName:@"observations"];
  }
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 72) count];
  if (result) {
    return (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 72) withName:@"observers"];
  }
  return result;
}

- (NSString)debugDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] debugStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)removeObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(a2);
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      __int16 v12 = 2114;
      id v13 = v8;
      __int16 v14 = 2048;
      long long v15 = self;
      __int16 v16 = 2114;
      id v17 = @"BKSHIDEventDeliveryPolicyObserver.m";
      __int16 v18 = 1024;
      int v19 = 166;
      __int16 v20 = 2114;
      int v21 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3729CLL);
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)canReceiveEvents
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = v2->_lock_policyStatus == 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BKSHIDEventDeferringToken)deferringToken
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v4 = self->_lock_token;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeferringEnvironment:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = NSString;
      id v8 = (objc_class *)[v5 classForCoder];
      if (!v8) {
        id v8 = (objc_class *)objc_opt_class();
      }
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      __int16 v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"environment", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = NSStringFromSelector(a2);
        __int16 v14 = (objc_class *)objc_opt_class();
        long long v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        int v19 = v13;
        __int16 v20 = 2114;
        int v21 = v15;
        __int16 v22 = 2048;
        __int16 v23 = self;
        __int16 v24 = 2114;
        __int16 v25 = @"BKSHIDEventDeliveryPolicyObserver.m";
        __int16 v26 = 1024;
        int v27 = 111;
        __int16 v28 = 2114;
        __int16 v29 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA375B4);
    }
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ((BSEqualObjects() & 1) == 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__BKSHIDEventDeliveryPolicyObserver_setDeferringEnvironment___block_invoke;
    v16[3] = &unk_1E5441BB0;
    v16[4] = self;
    id v17 = v5;
    id v6 = [(BKSHIDEventDeliveryPolicyObserver *)self _lock_updateStateWithBlock:v16];
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __61__BKSHIDEventDeliveryPolicyObserver_setDeferringEnvironment___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BKSHIDEventDeferringEnvironment)deferringEnvironment
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v4 = self->_lock_environment;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDisplay:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = NSString;
      id v8 = (objc_class *)[v5 classForCoder];
      if (!v8) {
        id v8 = (objc_class *)objc_opt_class();
      }
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      __int16 v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = NSStringFromSelector(a2);
        __int16 v14 = (objc_class *)objc_opt_class();
        long long v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        int v19 = v13;
        __int16 v20 = 2114;
        int v21 = v15;
        __int16 v22 = 2048;
        __int16 v23 = self;
        __int16 v24 = 2114;
        __int16 v25 = @"BKSHIDEventDeliveryPolicyObserver.m";
        __int16 v26 = 1024;
        int v27 = 91;
        __int16 v28 = 2114;
        __int16 v29 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA378C4);
    }
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ((BSEqualObjects() & 1) == 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__BKSHIDEventDeliveryPolicyObserver_setDisplay___block_invoke;
    v16[3] = &unk_1E5441BB0;
    v16[4] = self;
    id v17 = v5;
    id v6 = [(BKSHIDEventDeliveryPolicyObserver *)self _lock_updateStateWithBlock:v16];
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __48__BKSHIDEventDeliveryPolicyObserver_setDisplay___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(v3 + 32) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BKSHIDEventDisplay)display
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v4 = self->_lock_display;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_observingAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDeliveryPolicyObserver;
  [(BKSHIDEventDeliveryPolicyObserver *)&v3 dealloc];
}

@end