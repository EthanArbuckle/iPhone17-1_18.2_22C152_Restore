@interface HDAssertion
- (BOOL)_consumeFromBudgetThroughTime:(double)a3;
- (BOOL)_lock_setBudget:(double)a3 error:(id *)a4;
- (HDAssertion)initWithAssertionIdentifier:(id)a3 ownerIdentifier:(id)a4;
- (NSString)assertionIdentifier;
- (NSString)ownerIdentifier;
- (NSUUID)UUID;
- (double)_lock_remainingBudget;
- (double)budget;
- (double)remainingBudget;
- (id)_lock_cloneWithOwnerIdentifier:(id)a3;
- (id)_lock_description;
- (id)_lock_setBudgetIntervalStartTime:(double)a3;
- (id)cloneWithOwnerIdentifier:(id)a3;
- (id)description;
- (int64_t)_lock_consumeBudgetThroughTime:(double)a3 error:(id *)a4;
- (int64_t)_lock_state;
- (int64_t)_takeWithManager:(id)a3;
- (int64_t)rawState;
- (int64_t)state;
- (void)_invalidateAndRelease:(BOOL)a3;
- (void)_setBudgetIntervalStartTime:(double)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setBudget:(double)a3;
@end

@implementation HDAssertion

- (id)_lock_cloneWithOwnerIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(HDAssertion *)self _lock_state] == 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [[HDAssertion alloc] initWithAssertionIdentifier:self->_assertionIdentifier ownerIdentifier:v4];
    if (self->_budget > 0.0)
    {
      [(HDAssertion *)self _lock_remainingBudget];
      v5->_budget = v6;
      v5->_remainingBudget = v6;
    }
  }

  return v5;
}

- (HDAssertion)initWithAssertionIdentifier:(id)a3 ownerIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDAssertion.m", 33, @"Invalid parameter not satisfying: %@", @"assertionIdentifier.length > 0" object file lineNumber description];
  }
  if (![v8 length])
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDAssertion.m", 34, @"Invalid parameter not satisfying: %@", @"ownerIdentifier.length > 0" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HDAssertion;
  v9 = [(HDAssertion *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    v11 = (void *)*((void *)v9 + 6);
    *((void *)v9 + 6) = v10;

    uint64_t v12 = [v7 copy];
    v13 = (void *)*((void *)v9 + 7);
    *((void *)v9 + 7) = v12;

    uint64_t v14 = [v8 copy];
    v15 = (void *)*((void *)v9 + 8);
    *((void *)v9 + 8) = v14;

    *((void *)v9 + 2) = 1;
    *((void *)v9 + 9) = 0;
    *(_OWORD *)(v9 + 24) = xmmword_21BFF4450;
    *((_DWORD *)v9 + 10) = 0;
  }

  return (HDAssertion *)v9;
}

- (void)_invalidateAndRelease:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  double v6 = HKLogAssertions();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    id v8 = HKLogAssertions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[HDAssertion _invalidateAndRelease:](self, v8);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  if (self->_state == 3)
  {
    self->_remainingBudget = 0.0;
    self->_budgetIntervalStartTime = 0.0;
    objc_storeWeak((id *)&self->_manager, 0);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_remainingBudget = 0.0;
    self->_budgetIntervalStartTime = 0.0;
    self->_state = 3;
    objc_storeWeak((id *)&self->_manager, 0);
    os_unfair_lock_unlock(p_lock);
    if (v3 && WeakRetained) {
      [WeakRetained _releaseAssertion:self];
    }
  }
}

- (NSString)assertionIdentifier
{
  return self->_assertionIdentifier;
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(HDAssertion *)self _lock_state];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)_lock_state
{
  os_unfair_lock_assert_owner(&self->_lock);
  [(HDAssertion *)self _lock_remainingBudget];
  if (v3 <= 0.0 && self->_state == 2) {
    return 3;
  }
  else {
    return self->_state;
  }
}

- (double)_lock_remainingBudget
{
  os_unfair_lock_assert_owner(&self->_lock);
  double remainingBudget = self->_remainingBudget;
  if (self->_budgetIntervalStartTime != 0.0)
  {
    HKMachAbsoluteTimeGetCurrent();
    double remainingBudget = remainingBudget - (v4 - self->_budgetIntervalStartTime);
  }
  double result = 0.0;
  if (remainingBudget >= 0.0) {
    return remainingBudget;
  }
  return result;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (int64_t)_takeWithManager:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 1)
  {
    self->_int64_t state = 2;
    objc_storeWeak((id *)&self->_manager, v4);
    _HKInitializeLogging();
    double v6 = HKLogAssertions();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    if (v7)
    {
      id v8 = HKLogAssertions();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(HDAssertion *)self _takeWithManager:v8];
      }
    }
  }
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);

  return state;
}

- (void)invalidate
{
}

- (void)dealloc
{
  if ([(HDAssertion *)self rawState] == 2)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"HDAssertion.m", 53, @"Assertion %@ must be invalidated prior to deallocation", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)HDAssertion;
  [(HDAssertion *)&v5 dealloc];
}

- (int64_t)rawState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_destroyWeak((id *)&self->_manager);
}

- (void)setBudget:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = 0;
  BOOL v6 = [(HDAssertion *)self _lock_setBudget:&v8 error:a3];
  id v7 = v8;
  os_unfair_lock_unlock(p_lock);
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Unable to set assertion budget: %@", v7 format];
  }
}

- (BOOL)_lock_setBudget:(double)a3 error:(id *)a4
{
  os_unfair_lock_assert_owner(&self->_lock);
  int64_t state = self->_state;
  if (state == 1)
  {
    if (a3 > 0.0)
    {
      self->_budget = a3;
      self->_double remainingBudget = a3;
      return 1;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Cannot give assertion a non-postive budget of %f", *(void *)&a3, v11);
  }
  else
  {
    v9 = @"active";
    if (state != 2) {
      v9 = @"ready";
    }
    if (state == 3) {
      uint64_t v10 = @"invalidated";
    }
    else {
      uint64_t v10 = v9;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Assertion state '%@', but expected '%@'", v10, @"ready");
  }
  return 0;
}

- (id)cloneWithOwnerIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  BOOL v6 = [(HDAssertion *)self _lock_cloneWithOwnerIdentifier:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HDAssertion *)self _lock_description];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (double)remainingBudget
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_budgetIntervalStartTime == 0.0)
  {
    double remainingBudget = self->_remainingBudget;
  }
  else
  {
    HKMachAbsoluteTimeGetCurrent();
    double remainingBudget = v4 - self->_budgetIntervalStartTime;
  }
  if (remainingBudget >= 0.0) {
    double v6 = remainingBudget;
  }
  else {
    double v6 = 0.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_setBudgetIntervalStartTime:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(HDAssertion *)self _lock_setBudgetIntervalStartTime:a3];
  os_unfair_lock_unlock(p_lock);
  if (v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Unable to set budget consumption interval start: %@", v6 format];
  }

  MEMORY[0x270F9A758]();
}

- (BOOL)_consumeFromBudgetThroughTime:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = 0;
  int64_t v6 = [(HDAssertion *)self _lock_consumeBudgetThroughTime:&v9 error:a3];
  id v7 = v9;
  os_unfair_lock_unlock(p_lock);
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Unable to end budget consumption interval: %@", v7 format];
  }

  return v6 == 1;
}

- (id)_lock_description
{
  os_unfair_lock_assert_owner(&self->_lock);
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSUUID *)self->_UUID UUIDString];
  assertionIdentifier = self->_assertionIdentifier;
  int64_t state = self->_state;
  id v8 = @"ready";
  if (state == 2) {
    id v8 = @"active";
  }
  if (state == 3) {
    id v9 = @"invalidated";
  }
  else {
    id v9 = v8;
  }
  uint64_t v10 = v9;
  double budget = self->_budget;
  if (budget <= 0.0)
  {
    uint64_t v12 = &stru_26CC1AE10;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @" (%.3fs/%.3fs)", *(void *)&self->_remainingBudget, *(void *)&budget);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = [v3 stringWithFormat:@"<%@ %@ %@ %@%@: %@>", v4, v5, assertionIdentifier, v10, v12, self->_ownerIdentifier];
  if (budget > 0.0) {

  }
  return v13;
}

- (id)_lock_setBudgetIntervalStartTime:(double)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_state != 2 || self->_budget <= 0.0)
  {
    int64_t v6 = 0;
    goto LABEL_10;
  }
  if (self->_budgetIntervalStartTime == 0.0)
  {
    if (a3 > 0.0)
    {
      int64_t v6 = 0;
      self->_budgetIntervalStartTime = a3;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Budget interval start (%f) must be positive"", *(void *)&a3, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Budget interval already started with time (%f) cannot set to (%f)"", *(void *)&self->_budgetIntervalStartTime, *(void *)&a3);
  int64_t v6 = };
LABEL_10:

  return v6;
}

- (int64_t)_lock_consumeBudgetThroughTime:(double)a3 error:(id *)a4
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_state != 2 || self->_budget <= 0.0) {
    return 2;
  }
  double budgetIntervalStartTime = self->_budgetIntervalStartTime;
  if (budgetIntervalStartTime == 0.0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Cannot end budget time interval (%f) before starting it", *(void *)&a3, v10);
    return 0;
  }
  if (budgetIntervalStartTime > a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Cannot end budget time interval (%f) before interval start (%f)", *(void *)&a3, *(void *)&budgetIntervalStartTime);
    return 0;
  }
  self->_double budgetIntervalStartTime = 0.0;
  double v9 = self->_remainingBudget - (a3 - budgetIntervalStartTime);
  if (v9 < 0.0) {
    double v9 = 0.0;
  }
  self->_double remainingBudget = v9;
  if (v9 <= 0.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (double)budget
{
  return self->_budget;
}

- (void)_takeWithManager:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(a1, "_lock_description");
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_21BFB4000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Taken at %{public}@.", (uint8_t *)&v6, 0x16u);
}

- (void)_invalidateAndRelease:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v3 = objc_msgSend(a1, "_lock_description");
  int v4 = 138543362;
  id v5 = v3;
  _os_log_debug_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Invalidated.", (uint8_t *)&v4, 0xCu);
}

@end