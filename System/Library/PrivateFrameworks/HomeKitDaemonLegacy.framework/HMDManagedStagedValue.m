@interface HMDManagedStagedValue
- (HMDManagedStagedValue)initWithValue:(id)a3 commitBlock:(id)a4;
- (HMFStagedValue)stagedValue;
- (id)commitBlock;
- (id)initialValue;
- (id)value;
- (int64_t)state;
- (void)_commitIfStaged:(id)a3;
- (void)_handleCommitCompletionWithStagedValue:(id)a3 success:(BOOL)a4 committingValue:(id)a5;
- (void)_resetStagedValue;
- (void)resetAndStagePriorValue;
- (void)setCommitBlock:(id)a3;
- (void)setStagedValue:(id)a3;
- (void)setState:(int64_t)a3;
- (void)stageValue:(id)a3;
@end

@implementation HMDManagedStagedValue

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_stagedValue, 0);
  objc_storeStrong(&self->_commitBlock, 0);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (id)initialValue
{
  return self->_initialValue;
}

- (void)setStagedValue:(id)a3
{
}

- (HMFStagedValue)stagedValue
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCommitBlock:(id)a3
{
}

- (id)commitBlock
{
  return self->_commitBlock;
}

- (void)_handleCommitCompletionWithStagedValue:(id)a3 success:(BOOL)a4 committingValue:(id)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  id v8 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v10 = [(HMDManagedStagedValue *)self stagedValue];

  if (v10 != v16) {
    goto LABEL_2;
  }
  [(HMDManagedStagedValue *)self setState:0];
  v11 = [v16 value];
  if ([v16 isStaged])
  {
    int v12 = HMFEqualObjects();
    char v13 = v12;
    if (!v6)
    {
      if (v12)
      {
        v14 = [v16 committedValue];
        [v16 commitValue:v14];

LABEL_13:
LABEL_2:
        os_unfair_lock_unlock(p_lock);
        goto LABEL_3;
      }
LABEL_14:
      char v15 = [v16 isStaged];

      os_unfair_lock_unlock(&self->_lock);
      if ((v15 & 1) == 0) {
        goto LABEL_3;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_14;
    }
    char v13 = 0;
  }
  [v16 commitValue:v8];
  if (v13) {
    goto LABEL_13;
  }
  [v16 stageValue:v11];

  os_unfair_lock_unlock(&self->_lock);
LABEL_17:
  [(HMDManagedStagedValue *)self _commitIfStaged:v16];
LABEL_3:
}

- (void)_commitIfStaged:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMDManagedStagedValue *)self stagedValue];

  if (v5 == v4 && [v4 isStaged] && !-[HMDManagedStagedValue state](self, "state"))
  {
    BOOL v6 = [v4 value];
    [(HMDManagedStagedValue *)self setState:1];
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak(&location, self);
    v7 = [(HMDManagedStagedValue *)self commitBlock];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__HMDManagedStagedValue__commitIfStaged___block_invoke;
    v9[3] = &unk_1E6A130C0;
    objc_copyWeak(&v12, &location);
    id v10 = v4;
    id v8 = v6;
    id v11 = v8;
    ((void (**)(void, id, void *))v7)[2](v7, v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

void __41__HMDManagedStagedValue__commitIfStaged___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleCommitCompletionWithStagedValue:*(void *)(a1 + 32) success:a2 committingValue:*(void *)(a1 + 40)];
}

- (void)_resetStagedValue
{
  id v3 = objc_alloc(MEMORY[0x1E4F65560]);
  id v4 = [(HMDManagedStagedValue *)self initialValue];
  id v5 = (void *)[v3 initWithValue:v4];
  [(HMDManagedStagedValue *)self setStagedValue:v5];

  [(HMDManagedStagedValue *)self setState:0];
}

- (void)resetAndStagePriorValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDManagedStagedValue *)self stagedValue];
  id v5 = [v4 value];

  [(HMDManagedStagedValue *)self _resetStagedValue];
  id v6 = [(HMDManagedStagedValue *)self stagedValue];
  [v6 stageValue:v5];

  os_unfair_lock_unlock(p_lock);
  [(HMDManagedStagedValue *)self _commitIfStaged:v6];
}

- (void)stageValue:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDManagedStagedValue *)self stagedValue];
  [v4 stageValue:v5];
  os_unfair_lock_unlock(&self->_lock);
  [(HMDManagedStagedValue *)self _commitIfStaged:v4];
}

- (id)value
{
  v2 = [(HMDManagedStagedValue *)self stagedValue];
  id v3 = [v2 value];

  return v3;
}

- (HMDManagedStagedValue)initWithValue:(id)a3 commitBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDManagedStagedValue;
  id v8 = [(HMDManagedStagedValue *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v6 copy];
    id initialValue = v9->_initialValue;
    v9->_id initialValue = (id)v10;

    uint64_t v12 = [v7 copy];
    id commitBlock = v9->_commitBlock;
    v9->_id commitBlock = (id)v12;

    [(HMDManagedStagedValue *)v9 _resetStagedValue];
  }

  return v9;
}

@end