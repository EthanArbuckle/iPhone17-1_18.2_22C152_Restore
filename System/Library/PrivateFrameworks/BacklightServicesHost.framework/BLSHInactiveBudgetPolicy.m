@interface BLSHInactiveBudgetPolicy
- (BLSHInactiveBudgetPolicy)initWithBudgetFactory:(id)a3;
- (BLSHInactiveBudgetPolicy)initWithOSTimerProvider:(id)a3;
- (NSString)description;
- (id)budgetForEnvironment:(uint64_t)a1;
- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 forEnvironment:(id)a5;
- (int64_t)allowedFidelityAtDate:(id)a3 forEnvironment:(id)a4 expectedFidelity:(int64_t)a5;
- (void)chargeRenderedSpecifier:(id)a3;
- (void)invalidateAtRequestDate:(id)a3 forEnvironment:(id)a4 invalidationBlock:(id)a5;
- (void)performInvalidation;
- (void)purgeStaleDataForNowDate:(id)a3;
- (void)resetBudgetForProcess:(id)a3 reason:(id)a4;
- (void)resetFutureSpecifiers;
@end

@implementation BLSHInactiveBudgetPolicy

- (BLSHInactiveBudgetPolicy)initWithOSTimerProvider:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__BLSHInactiveBudgetPolicy_initWithOSTimerProvider___block_invoke;
  v8[3] = &unk_264533000;
  id v9 = v4;
  id v5 = v4;
  v6 = [(BLSHInactiveBudgetPolicy *)self initWithBudgetFactory:v8];

  return v6;
}

BLSHInactiveProcessBudget *__52__BLSHInactiveBudgetPolicy_initWithOSTimerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [BLSHInactiveProcessBudget alloc];
  id v5 = [v3 identifier];

  v6 = [(BLSHInactiveProcessBudget *)v4 initWithIdentifier:v5 osTimerProvider:*(void *)(a1 + 32)];

  return v6;
}

- (BLSHInactiveBudgetPolicy)initWithBudgetFactory:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHInactiveBudgetPolicy;
  id v5 = [(BLSHInactiveBudgetPolicy *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    budgets = v5->_budgets;
    v5->_budgets = (NSMutableDictionary *)v6;

    uint64_t v8 = MEMORY[0x223C5E2B0](v4);
    id budgetFactory = v5->_budgetFactory;
    v5->_id budgetFactory = (id)v8;

    v10 = objc_alloc_init(BLSHNullInactiveProcessBudget);
    nullBudget = v5->_nullBudget;
    v5->_nullBudget = v10;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendDictionarySection:self->_budgets withName:@"budgets" skipIfEmpty:1];
  id v4 = [v3 build];

  return (NSString *)v4;
}

- (int64_t)allowedFidelityAtDate:(id)a3 forEnvironment:(id)a4 expectedFidelity:(int64_t)a5
{
  id v8 = a3;
  id v9 = -[BLSHInactiveBudgetPolicy budgetForEnvironment:]((uint64_t)self, a4);
  int64_t v10 = [v9 allowedFidelityAtDate:v8 expectedFidelity:a5];

  return v10;
}

- (id)budgetForEnvironment:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 budgetProcessIdentity];
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      id v6 = [*(id *)(a1 + 8) objectForKey:v5];
      if (!v6)
      {
        (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 8) setObject:v6 forKey:v5];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    }
    else
    {
      id v6 = *(id *)(a1 + 24);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 forEnvironment:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = BLSDefaultFidelityForBacklightState(1, v8);
  v12 = -[BLSHInactiveBudgetPolicy budgetForEnvironment:]((uint64_t)self, v8);

  objc_super v13 = [v12 validateAndChargeFutureSpecifier:v10 nextSpecifier:v9 expectedFidelity:v11];

  return v13;
}

- (void)resetFutureSpecifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_budgets enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __49__BLSHInactiveBudgetPolicy_resetFutureSpecifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 resetFutureSpecifiers];
}

- (void)chargeRenderedSpecifier:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__BLSHInactiveBudgetPolicy_chargeRenderedSpecifier___block_invoke;
  v3[3] = &unk_264533048;
  v3[4] = self;
  [a3 enumerateDateSpecifiersUsingBlock:v3];
}

void __52__BLSHInactiveBudgetPolicy_chargeRenderedSpecifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = BLSDefaultFidelityForBacklightState(1, v5);
  -[BLSHInactiveBudgetPolicy budgetForEnvironment:](*(void *)(a1 + 32), v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v8 chargeRenderedSpecifier:v6 expectedFidelity:v7];
}

- (void)invalidateAtRequestDate:(id)a3 forEnvironment:(id)a4 invalidationBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = BLSDefaultFidelityForBacklightState(1, v9);
  -[BLSHInactiveBudgetPolicy budgetForEnvironment:]((uint64_t)self, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [v12 invalidateAtRequestDate:v10 expectedFidelity:v11 invalidationBlock:v8];
}

- (void)performInvalidation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_budgets copy];
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __47__BLSHInactiveBudgetPolicy_performInvalidation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 performInvalidation];
}

- (void)resetBudgetForProcess:(id)a3 reason:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = bls_budget_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 134218498;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v6;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_INFO, "%p will reset budget for process:%{public}@ reason:%{public}@", (uint8_t *)&v9, 0x20u);
    }

    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_budgets removeObjectForKey:v6];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)purgeStaleDataForNowDate:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)[(NSMutableDictionary *)self->_budgets copy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__BLSHInactiveBudgetPolicy_purgeStaleDataForNowDate___block_invoke;
  v8[3] = &unk_264533070;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  os_unfair_lock_unlock(p_lock);
}

void __53__BLSHInactiveBudgetPolicy_purgeStaleDataForNowDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (([a3 stillTrackingAfterPurgingStaleDataForNowDate:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nullBudget, 0);
  objc_storeStrong(&self->_budgetFactory, 0);

  objc_storeStrong((id *)&self->_budgets, 0);
}

@end