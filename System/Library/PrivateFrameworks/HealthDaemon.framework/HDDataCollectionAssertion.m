@interface HDDataCollectionAssertion
- (HDDataCollectionObserverState)observerState;
- (id)description;
- (void)setObserverState:(id)a3;
@end

@implementation HDDataCollectionAssertion

- (void)setObserverState:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([v14 isEqual:self->_observerState])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v4 = (HDDataCollectionObserverState *)[v14 copy];
    observerState = self->_observerState;
    self->_observerState = v4;

    os_unfair_lock_unlock(&self->_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
    v7 = self;
    id v8 = v14;
    if (WeakRetained)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = WeakRetained;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2114;
        v16 = v8;
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Data collection observer %{public}@ changed to state %{public}@", buf, 0x20u);
      }
      if (!v8)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:sel__dataCollectionObserver_didChangeState_, WeakRetained, @"HDDataCollectionManager.m", 380, @"Invalid parameter not satisfying: %@", @"state != nil" object file lineNumber description];
      }
      v10 = +[HKDaemonTransaction transactionWithOwner:WeakRetained activityName:@"ObserverDidChangeState"];
      v11 = WeakRetained[17];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __66__HDDataCollectionManager__dataCollectionObserver_didChangeState___block_invoke;
      v16 = &unk_1E62F6A40;
      v17 = WeakRetained;
      v18 = v7;
      id v19 = v8;
      id v20 = v10;
      id v12 = v10;
      dispatch_async(v11, buf);
    }
  }
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDDataCollectionAssertion;
  v5 = [(HDAssertion *)&v8 description];
  v6 = [v4 stringWithFormat:@"<%@: %@, %@>", v5, self->_sampleTypes, self->_observerState];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (HDDataCollectionObserverState)observerState
{
  return self->_observerState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCollectionManager);
  objc_storeStrong((id *)&self->_sampleTypes, 0);

  objc_storeStrong((id *)&self->_observerState, 0);
}

@end