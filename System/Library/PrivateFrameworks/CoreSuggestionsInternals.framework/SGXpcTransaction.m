@interface SGXpcTransaction
+ (SGXpcTransaction)transactionWithName:(const void *)a3;
- (BOOL)doneReturningWasDone;
- (SGXpcTransaction)initWithName:(const void *)a3;
- (void)dealloc;
- (void)setTimeout:(double)a3;
@end

@implementation SGXpcTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)dealloc
{
  [(SGXpcTransaction *)self done];
  v3.receiver = self;
  v3.super_class = (Class)SGXpcTransaction;
  [(SGXpcTransaction *)&v3 dealloc];
}

- (BOOL)doneReturningWasDone
{
  unsigned __int8 v2 = atomic_exchange(&self->_done._Value, 1u);
  if ((v2 & 1) == 0)
  {
    transaction = self->_transaction;
    self->_transaction = 0;

    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_source_cancel(timeoutTimer);
      v6 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
  }
  return v2 & 1;
}

- (void)setTimeout:(double)a3
{
  if (!self->_transaction)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGXpcTransaction.m", 41, @"Invalid parameter not satisfying: %@", @"_transaction != nil" object file lineNumber description];
  }
  if (self->_timeoutTimer)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGXpcTransaction.m", 42, @"Invalid parameter not satisfying: %@", @"_timeoutTimer == nil" object file lineNumber description];
  }
  double v6 = fmax(a3, 0.0);
  v7 = dispatch_get_global_queue(25, 0);
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v8;

  id location = 0;
  objc_initWeak(&location, self);
  v10 = self->_timeoutTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __31__SGXpcTransaction_setTimeout___block_invoke;
  handler[3] = &unk_1E65C0018;
  objc_copyWeak(&v20, &location);
  dispatch_source_set_event_handler(v10, handler);
  dispatch_time_t v11 = 0;
  v12 = self->_timeoutTimer;
  if (v6 > 0.0)
  {
    if (v6 <= 9223372040.0) {
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    }
    else {
      dispatch_time_t v11 = -1;
    }
  }
  double v13 = v6 / 10.0;
  if (v6 / 10.0 < 0.001) {
    double v13 = 0.001;
  }
  double v14 = v13 * 1000000000.0;
  BOOL v15 = v13 < 60.0;
  double v16 = 6.0e10;
  if (v15) {
    double v16 = v14;
  }
  dispatch_source_set_timer(v12, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v16);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __31__SGXpcTransaction_setTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained done];
}

- (SGXpcTransaction)initWithName:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SGXpcTransaction;
  objc_super v3 = [(SGXpcTransaction *)&v7 init];
  if (v3)
  {
    uint64_t v4 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v4;
  }
  return v3;
}

+ (SGXpcTransaction)transactionWithName:(const void *)a3
{
  objc_super v3 = [[SGXpcTransaction alloc] initWithName:a3];
  return v3;
}

@end