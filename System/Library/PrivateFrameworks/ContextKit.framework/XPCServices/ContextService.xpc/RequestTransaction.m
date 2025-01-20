@interface RequestTransaction
- (RequestTransaction)initWithTransactionId:(id)a3 decPending:(BOOL)a4;
- (void)dealloc;
- (void)discard;
@end

@implementation RequestTransaction

- (RequestTransaction)initWithTransactionId:(id)a3 decPending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RequestTransaction;
  v7 = [(RequestTransaction *)&v13 init];
  if (v7)
  {
    [v6 UTF8String];
    uint64_t v8 = os_transaction_create();
    tx = v7->_tx;
    v7->_tx = (OS_os_transaction *)v8;

    uint64_t add = atomic_fetch_add(&qword_100563018, 1uLL);
    uint64_t v11 = add + 1;
    if (add <= -2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1002B1A48();
      }
      uint64_t v11 = 0;
    }
    [(id)qword_100563020 setActiveGauge:v11];
    if (v4) {
      [(id)qword_100563020 decPending];
    }
  }

  return v7;
}

- (void)discard
{
  if ((atomic_exchange(&self->_discarded._Value, 1u) & 1) == 0)
  {
    uint64_t add = atomic_fetch_add(&qword_100563018, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v3 = add - 1;
    if (add <= 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1002B1AC4();
      }
      uint64_t v3 = 0;
    }
    [(id)qword_100563020 setActiveGauge:v3];
    [(id)qword_100563020 notify];
  }
}

- (void)dealloc
{
  [(RequestTransaction *)self discard];
  v3.receiver = self;
  v3.super_class = (Class)RequestTransaction;
  [(RequestTransaction *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end