@interface BLSHInactiveProcessBudget
- (BLSHInactiveProcessBudget)initWithIdentifier:(id)a3 osTimerProvider:(id)a4;
- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5;
- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4;
- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4;
- (void)dealloc;
- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5;
- (void)performInvalidation;
- (void)resetFutureSpecifiers;
@end

@implementation BLSHInactiveProcessBudget

- (BLSHInactiveProcessBudget)initWithIdentifier:(id)a3 osTimerProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BLSHInactiveProcessBudget;
  v8 = [(BLSHInactiveProcessBudget *)&v19 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = [[BLSHInactiveProcessSecondsBudget alloc] initWithIdentifier:v6 osTimerProvider:v7];
    secondsBudget = v8->_secondsBudget;
    v8->_secondsBudget = v11;

    v13 = [[BLSHInactiveProcessMinutesBudget alloc] initWithIdentifier:v6 osTimerProvider:v7];
    minutesBudget = v8->_minutesBudget;
    v8->_minutesBudget = v13;

    objc_initWeak(&location, v8);
    id v16 = v6;
    objc_copyWeak(&v17, &location);
    v8->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }

  return v8;
}

uint64_t __64__BLSHInactiveProcessBudget_initWithIdentifier_osTimerProvider___block_invoke(uint64_t a1)
{
  v2 = [NSString stringWithFormat:@"BLSHInactiveProcessBudget : %@", *(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained debugDescription];
  uint64_t v5 = BLSStateDataWithTitleDescriptionAndHints();

  return v5;
}

- (void)dealloc
{
  if (self->_stateHandler) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)BLSHInactiveProcessBudget;
  [(BLSHInactiveProcessBudget *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __40__BLSHInactiveProcessBudget_description__block_invoke;
  v10 = &unk_2645322D0;
  id v11 = v3;
  v12 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:&stru_26D1758B0 block:&v7];
  uint64_t v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return (NSString *)v5;
}

id __40__BLSHInactiveProcessBudget_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"minutesBudget"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"secondsBudget"];
}

- (NSString)debugDescription
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __45__BLSHInactiveProcessBudget_debugDescription__block_invoke;
  v10 = &unk_2645322D0;
  id v11 = v3;
  v12 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:&stru_26D1758B0 block:&v7];
  uint64_t v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return (NSString *)v5;
}

void __45__BLSHInactiveProcessBudget_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(*(void *)(a1 + 40) + 24) debugDescription];
  id v4 = (id)[v2 appendObject:v3 withName:@"minutesBudget"];

  uint64_t v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(*(void *)(a1 + 40) + 16) debugDescription];
  id v6 = (id)[v5 appendObject:v7 withName:@"secondsBudget"];
}

- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4
{
  if (a4 == 1) {
    return -[BLSHInactiveProcessMinutesBudget allowedFidelityAtDate:expectedFidelity:](self->_minutesBudget, "allowedFidelityAtDate:expectedFidelity:", a3);
  }
  else {
    return a4;
  }
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    if (a5 == 2)
    {
      secondsBudget = self->_secondsBudget;
      id v14 = v8;
      id v15 = v9;
      int64_t v16 = 2;
    }
    else
    {
      if (a5 == 3)
      {
        id v10 = v8;
LABEL_11:
        v12 = v10;
        goto LABEL_12;
      }
      secondsBudget = self->_minutesBudget;
      id v14 = v8;
      id v15 = v9;
      int64_t v16 = a5;
    }
    id v10 = [secondsBudget validateAndChargeFutureSpecifier:v14 nextSpecifier:v15 expectedFidelity:v16];
    goto LABEL_11;
  }
  id v11 = bls_budget_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BLSHInactiveProcessBudget validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:]((uint64_t)self, (uint64_t)v8, v11);
  }

  v12 = 0;
LABEL_12:

  return v12;
}

- (void)resetFutureSpecifiers
{
  [(BLSHInactiveProcessSecondsBudget *)self->_secondsBudget resetFutureSpecifiers];
  minutesBudget = self->_minutesBudget;

  [(BLSHInactiveProcessMinutesBudget *)minutesBudget resetFutureSpecifiers];
}

- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 2)
  {
    uint64_t v8 = 16;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    uint64_t v8 = 24;
  }
  id v9 = v6;
  id v6 = (id)[*(id *)((char *)&self->super.isa + v8) chargeRenderedSpecifier:v6 expectedFidelity:a4];
  id v7 = v9;
LABEL_6:

  MEMORY[0x270F9A758](v6, v7);
}

- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = v9;
  if (a4 == 1)
  {
    minutesBudget = self->_minutesBudget;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __88__BLSHInactiveProcessBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke_2;
    v14[3] = &unk_264532668;
    id v15 = v9;
    [(BLSHInactiveProcessMinutesBudget *)minutesBudget invalidateAtRequestDate:v8 expectedFidelity:1 invalidationBlock:v14];
    v12 = v15;
  }
  else
  {
    if (a4 != 2)
    {
      v9[2](v9);
      goto LABEL_7;
    }
    secondsBudget = self->_secondsBudget;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __88__BLSHInactiveProcessBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke;
    v16[3] = &unk_264532668;
    id v17 = v9;
    [(BLSHInactiveProcessSecondsBudget *)secondsBudget invalidateAtRequestDate:v8 expectedFidelity:2 invalidationBlock:v16];
    v12 = v17;
  }

LABEL_7:
}

uint64_t __88__BLSHInactiveProcessBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__BLSHInactiveProcessBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performInvalidation
{
  [(BLSHInactiveProcessMinutesBudget *)self->_minutesBudget performInvalidation];
  secondsBudget = self->_secondsBudget;

  [(BLSHInactiveProcessSecondsBudget *)secondsBudget performInvalidation];
}

- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BLSHInactiveProcessSecondsBudget *)self->_secondsBudget stillTrackingAfterPurgingStaleDataForNowDate:v4]|| [(BLSHInactiveProcessMinutesBudget *)self->_minutesBudget stillTrackingAfterPurgingStaleDataForNowDate:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minutesBudget, 0);
  objc_storeStrong((id *)&self->_secondsBudget, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)validateAndChargeFutureSpecifier:(uint64_t)a1 nextSpecifier:(uint64_t)a2 expectedFidelity:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 134218498;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEBUG, "%p:%{public}@ expectedFidelity:BLSUpdateFidelityNever specifier:%{public}@ denied", (uint8_t *)&v4, 0x20u);
}

@end