@interface _NSKeyValueDebugging
- (_NSKeyValueDebugging)init;
- (void)_checkConsistency;
- (void)_checkConsistencyForStatsWhileOutOfLock:(id)a3 forPair:(id)a4 timingDescription:(id)a5;
- (void)_clearWillDidTable;
- (void)_object:(id)a3 trackChangeForKeyOrKeys:(id)a4 operation:(int64_t)a5;
- (void)dealloc;
- (void)object:(void *)a3 willAddObserver:(void *)a4 forKeyPath:(uint64_t)a5 context:;
- (void)object:(void *)a3 willRemoveObserver:(uint64_t)a4 forKeyPath:(uint64_t)a5 context:;
@end

@implementation _NSKeyValueDebugging

- (void)object:(void *)a3 willAddObserver:(void *)a4 forKeyPath:(uint64_t)a5 context:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v10 = [_NSKeyValueObjectBox alloc];
    if (v10)
    {
      v18.receiver = v10;
      v18.super_class = (Class)_NSKeyValueObjectBox;
      v11 = (id *)[(os_unfair_lock_s *)&v18 init];
      if (v11)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(a3, sel_allowsWeakReference) & 1) == 0)
        {
        }
        else
        {
          objc_storeWeak(v11 + 1, a3);
          v11[2] = a3;
          v11[3] = object_getClass(a3);
          id v12 = -[_NSKeyValueObjectAndKeyPair initWithObject:key:context:]([_NSKeyValueObjectAndKeyPair alloc], a2, a4, a5);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke;
          v17[3] = &unk_1E51FAD68;
          v17[4] = a1;
          v17[5] = v11;
          v17[6] = v12;
          os_unfair_lock_lock(a1 + 2);
          __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke(v17);
          os_unfair_lock_unlock(a1 + 2);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke_2;
          v16[3] = &unk_1E51FAE28;
          v16[4] = a1;
          v16[5] = v11;
          uint64_t v13 = self;
          v14 = (void *)MEMORY[0x185308110](v13);
          +[_NSKeyValueDebuggingDeallocSentinel _invalidateSentinelWithKey:&_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey fromObject:a3];
          v15 = [[_NSKeyValueDebuggingDeallocSentinel alloc] initWithObjectPointer:a3 callbackBlock:v16];
          objc_setAssociatedObject(a3, &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey, v15, (void *)0x301);
        }
      }
    }
  }
}

- (void)object:(void *)a3 willRemoveObserver:(uint64_t)a4 forKeyPath:(uint64_t)a5 context:
{
  v9[8] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [self _invalidateSentinelWithKey:&_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey fromObject:a3];
    objc_setAssociatedObject(a3, &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey, 0, (void *)0x301);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke;
    v9[3] = &unk_1E51FAE78;
    v9[4] = a1;
    v9[5] = a3;
    v9[6] = a2;
    v9[7] = a5;
    os_unfair_lock_lock(a1 + 2);
    __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke((uint64_t)v9);
    os_unfair_lock_unlock(a1 + 2);
  }
}

- (_NSKeyValueDebugging)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_NSKeyValueDebugging;
  v2 = [(_NSKeyValueDebugging *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_willDidCountTable = (NSMutableDictionary *)objc_opt_new();
    v3->_consistencyTable = (NSMutableDictionary *)objc_opt_new();
    v3->_observedKeyPathsByObserver = (NSMutableDictionary *)objc_opt_new();
    v4 = (NSTimer *)(id)[MEMORY[0x1E4F1CB00] timerWithTimeInterval:v3 target:sel__checkConsistency selector:0 userInfo:1 repeats:1.0];
    v3->_consistencyCheckTimer = v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28___NSKeyValueDebugging_init__block_invoke;
    v6[3] = &unk_1E51F71D0;
    v6[4] = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSTimer *)self->_consistencyCheckTimer invalidate];

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueDebugging;
  [(_NSKeyValueDebugging *)&v3 dealloc];
}

- (void)_clearWillDidTable
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42___NSKeyValueDebugging__clearWillDidTable__block_invoke;
  v7[3] = &unk_1E51F6678;
  v7[4] = self;
  v7[5] = v3;
  os_unfair_lock_lock(&self->_lock);
  __42___NSKeyValueDebugging__clearWillDidTable__block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        -[_NSKeyValueDebugging _checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:](self, "_checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:", [v3 objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v6)], *(void *)(*((void *)&v9 + 1) + 8 * v6), @"at the next run loop spin after the 'did'");
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v4);
  }
}

- (void)_checkConsistencyForStatsWhileOutOfLock:(id)a3 forPair:(id)a4 timingDescription:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_132) {
    NSLog((NSString *)@"<KVODebugging>: %@ -- Checking for consistency now (%@).", a2, a4, a5);
  }
  if (qword_1EB1ED918 != -1) {
    dispatch_once(&qword_1EB1ED918, &__block_literal_global_183);
  }
  long long v9 = qword_1EB1ED910;
  if (os_log_type_enabled((os_log_t)qword_1EB1ED910, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = a4;
    __int16 v22 = 2114;
    id v23 = a5;
    _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_INFO, "%{public}@ -- Checking for consistency now (%{public}@).", buf, 0x16u);
  }
  if (a3)
  {
    ++*((void *)a3 + 5);
    long long v10 = -[_NSKeyValueObjectAndKeyPair newCurrentValue](*((_Unwind_Exception **)a3 + 1));
    if (!v10) {
      goto LABEL_26;
    }
    long long v11 = (_Unwind_Exception *)(id)[a3 currentValue];
    long long v12 = v11;
    if (*((void *)a3 + 4))
    {
      if ([(_Unwind_Exception *)v11 isEqual:v10])
      {
LABEL_11:

        goto LABEL_26;
      }
    }
    else if (v11 == v10)
    {
      goto LABEL_11;
    }
    uint64_t v13 = v12;
    v14 = v10;
    [a3 setCurrentValue:v10];

    if (v12 && (v15 = _NSKeyValueRetainedObservationInfoForObject(v12, 0)) != 0)
    {

      if (_MergedGlobals_132) {
        NSLog((NSString *)@"<KVODebugging> KVO ISSUE: %@ -- MAY CAUSE CRASHES -- The value for this key pair seems to have changed outside of a will/did pair AND IT IS OBSERVED BY OTHER OBJECTS!!!; last observed value was '%@', current value is '%@'",
      }
          a4,
          v13,
          v14);
      if (qword_1EB1ED918 != -1) {
        dispatch_once(&qword_1EB1ED918, &__block_literal_global_183);
      }
      v16 = qword_1EB1ED910;
      if (os_log_type_enabled((os_log_t)qword_1EB1ED910, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v21 = a4;
        __int16 v22 = 2114;
        id v23 = v13;
        __int16 v24 = 2114;
        v25 = v14;
        v17 = "KVO ISSUE: %{public}@ -- MAY CAUSE CRASHES -- The value for this key pair seems to have changed outside of"
              " a will/did pair AND IT IS OBSERVED BY OTHER OBJECTS!!!; last observed value was '%{public}@', current val"
              "ue is '%{public}@'";
LABEL_38:
        _os_log_error_impl(&dword_181795000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
      }
    }
    else
    {
      if (_MergedGlobals_132) {
        NSLog((NSString *)@"<KVODebugging> KVO ISSUE: %@ -- The value for this key pair seems to have changed outside of a will/did pair, which makes this key unsafe to observe within a longer key path; last observed value was '%@', current value is '%@'",
      }
          a4,
          v13,
          v14);
      if (qword_1EB1ED918 != -1) {
        dispatch_once(&qword_1EB1ED918, &__block_literal_global_183);
      }
      v16 = qword_1EB1ED910;
      if (os_log_type_enabled((os_log_t)qword_1EB1ED910, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v21 = a4;
        __int16 v22 = 2114;
        id v23 = v13;
        __int16 v24 = 2114;
        v25 = v14;
        v17 = "KVO ISSUE: %{public}@ -- The value for this key pair seems to have changed outside of a will/did pair, whi"
              "ch makes this key unsafe to observe within a longer key path; last observed value was '%{public}@', curren"
              "t value is '%{public}@'";
        goto LABEL_38;
      }
    }
LABEL_26:
    if ((!*((unsigned char *)a3 + 16) || [a3 currentValue]) && *((uint64_t *)a3 + 5) < 4) {
      return;
    }
  }
  if (_MergedGlobals_132) {
    NSLog((NSString *)@"<KVODebugging>: %@ -- No longer tracking for consistency changes.", a4);
  }
  if (qword_1EB1ED918 != -1) {
    dispatch_once(&qword_1EB1ED918, &__block_literal_global_183);
  }
  objc_super v18 = qword_1EB1ED910;
  if (os_log_type_enabled((os_log_t)qword_1EB1ED910, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = a4;
    _os_log_impl(&dword_181795000, v18, OS_LOG_TYPE_INFO, "%{public}@ -- No longer tracking for consistency changes.", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90___NSKeyValueDebugging__checkConsistencyForStatsWhileOutOfLock_forPair_timingDescription___block_invoke;
  v19[3] = &unk_1E51FAD68;
  v19[4] = self;
  v19[5] = a4;
  v19[6] = a3;
  os_unfair_lock_lock(&self->_lock);
  __90___NSKeyValueDebugging__checkConsistencyForStatsWhileOutOfLock_forPair_timingDescription___block_invoke(v19);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_checkConsistency
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3052000000;
  long long v12 = __Block_byref_object_copy__18;
  uint64_t v13 = __Block_byref_object_dispose__18;
  uint64_t v14 = 0;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41___NSKeyValueDebugging__checkConsistency__block_invoke;
  v8[3] = &unk_1E51FAD90;
  v8[4] = self;
  v8[5] = &v9;
  os_unfair_lock_lock(&self->_lock);
  __41___NSKeyValueDebugging__checkConsistency__block_invoke((uint64_t)v8);
  os_unfair_lock_unlock(p_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = (void *)v10[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        -[_NSKeyValueDebugging _checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:](self, "_checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:", [(id)v10[5] objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)], *(void *)(*((void *)&v16 + 1) + 8 * i), @"periodically for a short time every second after the 'did'");
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_object:(id)a3 trackChangeForKeyOrKeys:(id)a4 operation:(int64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  long long v12 = __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke;
  uint64_t v13 = &unk_1E51FADE0;
  v15 = self;
  int64_t v16 = a5;
  id v14 = a3;
  if ([a4 conformsToProtocol:&unk_1ECAC72B0])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [a4 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(a4);
          }
          long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (_NSIsNSString()) {
            v12((uint64_t)v11, v10);
          }
        }
        uint64_t v7 = [a4 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else if (_NSIsNSString())
  {
    v12((uint64_t)v11, a4);
  }
}

@end