@interface HDHeartRateRecoveryManager
- (HDHeartRateRecoveryManager)init;
- (id)createAndTakeAssertionForOwnerIdentifier:(id)a3 sessionStateController:(id)a4;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)assertionManager:(id)a3 assertionTaken:(id)a4;
- (void)dealloc;
@end

@implementation HDHeartRateRecoveryManager

- (HDHeartRateRecoveryManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDHeartRateRecoveryManager;
  v2 = [(HDHeartRateRecoveryManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v5;

    [(HDAssertionManager *)v2->_assertionManager resumeBudgetConsumption];
    [(HDAssertionManager *)v2->_assertionManager addObserver:v2 forAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierHeartRateRecovery" queue:v2->_queue];
  }
  return v2;
}

- (void)dealloc
{
  [(HDPowerAssertion *)self->_powerAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDHeartRateRecoveryManager;
  [(HDHeartRateRecoveryManager *)&v3 dealloc];
}

- (id)createAndTakeAssertionForOwnerIdentifier:(id)a3 sessionStateController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [_HDHeartRateRecoveryAssertion alloc];
  id v9 = v6;
  if (v8)
  {
    v14.receiver = v8;
    v14.super_class = (Class)_HDHeartRateRecoveryAssertion;
    v10 = [(HDHeartRateRecoveryManager *)&v14 initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierHeartRateRecovery" ownerIdentifier:v7];
    objc_super v8 = (_HDHeartRateRecoveryAssertion *)v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10[2]._assertionManager, v9);
      [(HDAssertion *)v8 setBudget:*MEMORY[0x1E4F2BFC0]];
    }
  }

  if ([(HDAssertionManager *)self->_assertionManager takeAssertion:v8]) {
    v11 = v8;
  }
  else {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (void)assertionManager:(id)a3 assertionTaken:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_powerAssertion)
  {
    v5 = +[HDPowerAssertion powerAssertionWithIdentifier:@"Workout Heart Rate Recovery" timeout:0 timeoutHandler:*MEMORY[0x1E4F2BFC0] + 60.0];
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = v5;
  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  queue = self->_queue;
  id v6 = (id *)a4;
  dispatch_assert_queue_V2(queue);
  if (v6) {
    id WeakRetained = objc_loadWeakRetained(v6 + 10);
  }
  else {
    id WeakRetained = 0;
  }

  [WeakRetained endHeartRateRecovery];
  if (self->_powerAssertion)
  {
    objc_super v8 = [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"HDWorkoutSessionAssertionIdentifierHeartRateRecovery"];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      [(HDPowerAssertion *)self->_powerAssertion invalidate];
      powerAssertion = self->_powerAssertion;
      self->_powerAssertion = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end