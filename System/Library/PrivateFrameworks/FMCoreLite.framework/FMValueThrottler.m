@interface FMValueThrottler
- (BOOL)hasPendingValueChange;
- (FMCancelable)valueUpdateCancelationToken;
- (FMScheduler)updateScheduler;
- (FMValueThrottler)init;
- (FMValueThrottler)initWithThrottleInterval:(double)a3;
- (FMValueThrottler)initWithThrottleInterval:(double)a3 initialValue:(id)a4;
- (NSMutableSet)observerBlocks;
- (double)throttleInterval;
- (id)observeValueChangesWithBlock:(id)a3;
- (id)value;
- (void)_enqueueValueUpdateIfNecessary;
- (void)_notifyObserversOfValueUpdate;
- (void)dealloc;
- (void)flushValueChanges;
- (void)setUpdateScheduler:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueUpdateCancelationToken:(id)a3;
@end

@implementation FMValueThrottler

- (FMValueThrottler)initWithThrottleInterval:(double)a3
{
  return [(FMValueThrottler *)self initWithThrottleInterval:0 initialValue:a3];
}

- (FMValueThrottler)initWithThrottleInterval:(double)a3 initialValue:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FMValueThrottler;
  v8 = [(FMValueThrottler *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_throttleInterval = a3;
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    observerBlocks = v9->_observerBlocks;
    v9->_observerBlocks = (NSMutableSet *)v10;

    uint64_t v12 = +[FMScheduler mainThreadScheduler];
    updateScheduler = v9->_updateScheduler;
    v9->_updateScheduler = (FMScheduler *)v12;

    objc_storeStrong(&v9->_value, a4);
  }

  return v9;
}

- (FMValueThrottler)init
{
  return [(FMValueThrottler *)self initWithThrottleInterval:0.0];
}

- (void)dealloc
{
  v3 = [(FMValueThrottler *)self valueUpdateCancelationToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)FMValueThrottler;
  [(FMValueThrottler *)&v4 dealloc];
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  id value = self->_value;
  if (value != v5 && ([value isEqual:v5] & 1) == 0)
  {
    objc_storeStrong(&self->_value, a3);
    [(FMValueThrottler *)self _enqueueValueUpdateIfNecessary];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setUpdateScheduler:(id)a3
{
  id v7 = (FMScheduler *)a3;
  if (self->_updateScheduler != v7)
  {
    objc_storeStrong((id *)&self->_updateScheduler, a3);
    id v5 = [(FMValueThrottler *)self valueUpdateCancelationToken];

    if (v5)
    {
      v6 = [(FMValueThrottler *)self valueUpdateCancelationToken];
      [v6 cancel];

      [(FMValueThrottler *)self setValueUpdateCancelationToken:0];
      [(FMValueThrottler *)self _enqueueValueUpdateIfNecessary];
    }
  }
}

- (void)_enqueueValueUpdateIfNecessary
{
  v3 = [(FMValueThrottler *)self valueUpdateCancelationToken];

  if (!v3)
  {
    objc_initWeak(&location, self);
    objc_super v4 = [(FMValueThrottler *)self updateScheduler];
    [(FMValueThrottler *)self throttleInterval];
    double v6 = v5;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __50__FMValueThrottler__enqueueValueUpdateIfNecessary__block_invoke;
    v11 = &unk_1E60194B8;
    objc_copyWeak(&v12, &location);
    id v7 = [v4 afterDelay:&v8 performBlock:v6];
    -[FMValueThrottler setValueUpdateCancelationToken:](self, "setValueUpdateCancelationToken:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __50__FMValueThrottler__enqueueValueUpdateIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setValueUpdateCancelationToken:0];
  [WeakRetained _notifyObserversOfValueUpdate];
}

- (void)_notifyObserversOfValueUpdate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(FMValueThrottler *)self observerBlocks];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [(FMValueThrottler *)self value];
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)observeValueChangesWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  uint64_t v6 = [(FMValueThrottler *)self observerBlocks];
  uint64_t v7 = (void *)MEMORY[0x1B3EB3F00](v5);
  [v6 addObject:v7];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__FMValueThrottler_observeValueChangesWithBlock___block_invoke;
  v11[3] = &unk_1E6019558;
  objc_copyWeak(&v13, &location);
  id v8 = v5;
  id v12 = v8;
  uint64_t v9 = +[FMCancelationToken tokenWithCancelationBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __49__FMValueThrottler_observeValueChangesWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained observerBlocks];
  v3 = (void *)MEMORY[0x1B3EB3F00](*(void *)(a1 + 32));
  [v2 removeObject:v3];
}

- (void)flushValueChanges
{
  v3 = [(FMValueThrottler *)self valueUpdateCancelationToken];

  if (v3)
  {
    id v4 = [(FMValueThrottler *)self valueUpdateCancelationToken];
    [v4 cancel];

    [(FMValueThrottler *)self setValueUpdateCancelationToken:0];
    [(FMValueThrottler *)self _notifyObserversOfValueUpdate];
  }
}

- (BOOL)hasPendingValueChange
{
  v2 = [(FMValueThrottler *)self valueUpdateCancelationToken];
  BOOL v3 = v2 != 0;

  return v3;
}

- (double)throttleInterval
{
  return self->_throttleInterval;
}

- (FMScheduler)updateScheduler
{
  return self->_updateScheduler;
}

- (id)value
{
  return self->_value;
}

- (NSMutableSet)observerBlocks
{
  return self->_observerBlocks;
}

- (FMCancelable)valueUpdateCancelationToken
{
  return self->_valueUpdateCancelationToken;
}

- (void)setValueUpdateCancelationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueUpdateCancelationToken, 0);
  objc_storeStrong((id *)&self->_observerBlocks, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_updateScheduler, 0);
}

@end