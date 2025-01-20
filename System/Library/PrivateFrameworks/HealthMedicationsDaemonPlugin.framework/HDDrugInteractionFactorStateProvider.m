@interface HDDrugInteractionFactorStateProvider
- (HDDaemon)daemon;
- (HDDrugInteractionFactorStateProvider)init;
- (HDDrugInteractionFactorStateProvider)initWithDaemon:(id)a3;
- (const)_lock_hasDrugInteractionFactor;
- (const)_lock_initalizeDrugInteractionFactorStates;
- (const)_lock_startMonitoringKeyValueDomain;
- (int64_t)hasDrugInteractionFactorInProfile:(id)a3;
- (uint64_t)_lock_updateDrugInteractionFactorForKey:(char)a3 newValue:;
- (uint64_t)_notifyObserversWithHasDrugInteractionFactor:(uint64_t)result;
- (void)_lock_updateChangeForKey:(uint64_t)a1;
- (void)addDrugInteractionFactorStateObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)didUpdateKeyValueDomain:(id)a3;
- (void)monitorDrugInteractionFactorsInProfile:(id)a3;
- (void)removeDrugInteractionFactorStateObserver:(id)a3;
@end

@implementation HDDrugInteractionFactorStateProvider

- (HDDrugInteractionFactorStateProvider)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDrugInteractionFactorStateProvider)initWithDaemon:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDrugInteractionFactorStateProvider;
  v5 = [(HDDrugInteractionFactorStateProvider *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v8 = HKLogHealthOntology();
    uint64_t v9 = [v7 initWithName:@"HDDrugInteractionFactorStateObserver" loggingCategory:v8];
    observers = v6->_observers;
    v6->_observers = (HDDrugInteractionFactorStateObserver *)v9;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    os_unfair_lock_assert_owner(p_lock);
    [(HDKeyValueDomain *)self->_lock_medicationsKeyValueDomain stopObservation:self];
  }
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)HDDrugInteractionFactorStateProvider;
  [(HDDrugInteractionFactorStateProvider *)&v4 dealloc];
}

- (void)monitorDrugInteractionFactorsInProfile:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_medicationsKeyValueDomain)
  {
    objc_msgSend(MEMORY[0x1E4F65B28], "hdmd_defaultDomainWithProfile:", v6);
    objc_super v4 = (HDKeyValueDomain *)objc_claimAutoreleasedReturnValue();
    lock_medicationsKeyValueDomain = self->_lock_medicationsKeyValueDomain;
    self->_lock_medicationsKeyValueDomain = v4;

    -[HDDrugInteractionFactorStateProvider _lock_startMonitoringKeyValueDomain]((const os_unfair_lock *)self);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (const)_lock_startMonitoringKeyValueDomain
{
  if (result)
  {
    v1 = result;
    v2 = result + 4;
    os_unfair_lock_assert_owner(result + 4);
    os_unfair_lock_assert_owner(v2);
    [*(id *)&v1[6]._os_unfair_lock_opaque startObservation:v1];
    return -[HDDrugInteractionFactorStateProvider _lock_initalizeDrugInteractionFactorStates](v1);
  }
  return result;
}

- (int64_t)hasDrugInteractionFactorInProfile:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v5 = -[HDDrugInteractionFactorStateProvider _lock_hasDrugInteractionFactor]((const os_unfair_lock *)self);
  lock_medicationsKeyValueDomain = self->_lock_medicationsKeyValueDomain;
  os_unfair_lock_unlock(p_lock);
  if (lock_medicationsKeyValueDomain) {
    return v5;
  }
  else {
    return 2;
  }
}

- (const)_lock_hasDrugInteractionFactor
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 4);
    if (LOBYTE(v1[8]._os_unfair_lock_opaque) || BYTE1(v1[8]._os_unfair_lock_opaque)) {
      return (const os_unfair_lock *)1;
    }
    else {
      return (const os_unfair_lock *)(BYTE2(v1[8]._os_unfair_lock_opaque) != 0);
    }
  }
  return result;
}

- (void)addDrugInteractionFactorStateObserver:(id)a3 queue:(id)a4
{
}

- (void)removeDrugInteractionFactorStateObserver:(id)a3
{
}

- (const)_lock_initalizeDrugInteractionFactorStates
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 4);
    LOBYTE(v1[8]._os_unfair_lock_opaque) = objc_msgSend(*(id *)&v1[6]._os_unfair_lock_opaque, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E4F66978]);
    BYTE1(v1[8]._os_unfair_lock_opaque) = objc_msgSend(*(id *)&v1[6]._os_unfair_lock_opaque, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E4F669D8]);
    result = (const os_unfair_lock *)objc_msgSend(*(id *)&v1[6]._os_unfair_lock_opaque, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E4F66A70]);
    BYTE2(v1[8]._os_unfair_lock_opaque) = (_BYTE)result;
  }
  return result;
}

- (void)didUpdateKeyValueDomain:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v5 = -[HDDrugInteractionFactorStateProvider _lock_hasDrugInteractionFactor]((const os_unfair_lock *)self);
  -[HDDrugInteractionFactorStateProvider _lock_updateChangeForKey:]((uint64_t)self, (void *)*MEMORY[0x1E4F66978]);
  -[HDDrugInteractionFactorStateProvider _lock_updateChangeForKey:]((uint64_t)self, (void *)*MEMORY[0x1E4F669D8]);
  -[HDDrugInteractionFactorStateProvider _lock_updateChangeForKey:]((uint64_t)self, (void *)*MEMORY[0x1E4F66A70]);
  unsigned int v6 = -[HDDrugInteractionFactorStateProvider _lock_hasDrugInteractionFactor]((const os_unfair_lock *)self);
  os_unfair_lock_unlock(p_lock);
  if (v5 != v6)
  {
    -[HDDrugInteractionFactorStateProvider _notifyObserversWithHasDrugInteractionFactor:]((uint64_t)self, v6);
  }
}

- (void)_lock_updateChangeForKey:(uint64_t)a1
{
  if (a1)
  {
    v3 = *(void **)(a1 + 24);
    id v4 = a2;
    -[HDDrugInteractionFactorStateProvider _lock_updateDrugInteractionFactorForKey:newValue:]((const os_unfair_lock *)a1, v4, objc_msgSend(v3, "hdmd_numberValueAsBoolForKey:", v4));
  }
}

- (uint64_t)_notifyObserversWithHasDrugInteractionFactor:(uint64_t)result
{
  if (result)
  {
    v2 = *(void **)(result + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __85__HDDrugInteractionFactorStateProvider__notifyObserversWithHasDrugInteractionFactor___block_invoke;
    v3[3] = &unk_1E6337C40;
    v3[4] = result;
    v3[5] = a2;
    return [v2 notifyObservers:v3];
  }
  return result;
}

- (uint64_t)_lock_updateDrugInteractionFactorForKey:(char)a3 newValue:
{
  uint64_t v5 = a2;
  unsigned int v6 = (void *)v5;
  if (a1)
  {
    uint64_t v9 = (void *)v5;
    os_unfair_lock_assert_owner(a1 + 4);
    unsigned int v6 = v9;
    if ((void *)*MEMORY[0x1E4F66978] == v9
      || *MEMORY[0x1E4F66978] && (v5 = objc_msgSend(v9, "isEqualToString:"), unsigned int v6 = v9, (v5 & 1) != 0))
    {
      uint64_t v7 = 32;
LABEL_14:
      *((unsigned char *)&a1->_os_unfair_lock_opaque + v7) = a3;
      goto LABEL_15;
    }
    if ((void *)*MEMORY[0x1E4F669D8] == v6
      || *MEMORY[0x1E4F669D8] && (v5 = objc_msgSend(v6, "isEqualToString:"), unsigned int v6 = v9, (v5 & 1) != 0))
    {
      uint64_t v7 = 33;
      goto LABEL_14;
    }
    if ((void *)*MEMORY[0x1E4F66A70] == v6
      || *MEMORY[0x1E4F66A70] && (v5 = objc_msgSend(v6, "isEqualToString:"), unsigned int v6 = v9, v5))
    {
      uint64_t v7 = 34;
      goto LABEL_14;
    }
  }
LABEL_15:
  return MEMORY[0x1F41817F8](v5, v6);
}

void __85__HDDrugInteractionFactorStateProvider__notifyObserversWithHasDrugInteractionFactor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 40));
  uint64_t v5 = [WeakRetained primaryProfile];
  [v4 drugInteractionFactorStateProvider:v3 didObserveChangeForProfile:v5 hasDrugInteractionFactor:*(void *)(a1 + 40)];
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_lock_medicationsKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end