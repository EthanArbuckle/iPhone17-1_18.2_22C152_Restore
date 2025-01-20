@interface BWDeferredTransactionBroker
+ (id)sharedInstance;
- (void)_openTransaction:(uint64_t)a3 pid:(uint64_t)a4 name:;
- (void)closeTransaction:(int)a3;
- (void)exitImmediately;
- (void)openTransaction:(int)a3;
- (void)openTransaction:(int)a3 name:(id)a4;
- (void)openTransaction:(int)a3 pid:(int)a4;
@end

@implementation BWDeferredTransactionBroker

- (void)_openTransaction:(uint64_t)a3 pid:(uint64_t)a4 name:
{
  if (a1)
  {
    if (a2 >= 5) {
      -[BWDeferredTransactionBroker _openTransaction:pid:name:]();
    }
    v7 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v8 = &a1[4 * a2];
    uint32_t os_unfair_lock_opaque = v8[6]._os_unfair_lock_opaque;
    v10 = v8 + 6;
    uint32_t v9 = os_unfair_lock_opaque;
    if (!os_unfair_lock_opaque)
    {
      uint64_t v12 = a2;
      id v13 = [NSString alloc];
      v14 = _transactionNames[v12];
      if (a4) {
        v15 = (__CFString *)[NSString stringWithFormat:@"-%@", a4];
      }
      else {
        v15 = &stru_1EFA403E0;
      }
      v16 = (void *)[v13 initWithFormat:@"FigCaptureDeferred-%s%@", v14, v15];
      [v16 cStringUsingEncoding:4];
      *(void *)&v10[-2]._uint32_t os_unfair_lock_opaque = FigOSTransactionCreate();

      uint32_t v9 = v10->_os_unfair_lock_opaque;
    }
    v10->_uint32_t os_unfair_lock_opaque = v9 + 1;
    os_unfair_lock_unlock(v7);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnceEngineToken != -1) {
    dispatch_once(&sharedInstance_sOnceEngineToken, &__block_literal_global_62);
  }
  return (id)sharedInstance_sBroker;
}

- (void)openTransaction:(int)a3 pid:(int)a4
{
}

- (void)openTransaction:(int)a3
{
}

BWDeferredTransactionBroker *__45__BWDeferredTransactionBroker_sharedInstance__block_invoke()
{
  result = [BWDeferredTransactionBroker alloc];
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)BWDeferredTransactionBroker;
    result = (BWDeferredTransactionBroker *)objc_msgSendSuper2(&v1, sel_init);
    if (result) {
      result->_lock._uint32_t os_unfair_lock_opaque = 0;
    }
  }
  sharedInstance_sBroker = (uint64_t)result;
  return result;
}

- (void)exitImmediately
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  for (uint64_t i = 16; i != 96; i += 16)
  {
    v5 = *(Class *)((char *)&self->super.isa + i);
    if (v5)
    {

      *(Class *)((char *)&self->super.isa + i) = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  if ((xpc_transaction_try_exit_clean() & 1) == 0) {
    _exit(0);
  }
}

- (void)openTransaction:(int)a3 name:(id)a4
{
}

- (void)closeTransaction:(int)a3
{
  if (a3 >= 5) {
    -[BWDeferredTransactionBroker _openTransaction:pid:name:]();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (char *)self + 16 * a3;
  int v9 = *((_DWORD *)v6 + 6);
  v7 = v6 + 24;
  int v8 = v9;
  if (v9)
  {
    int v10 = v8 - 1;
    _DWORD *v7 = v10;
    if (!v10)
    {
      v11 = v7 - 2;
      uint64_t v12 = (void *)*((void *)v7 - 1);
      if (v12)
      {

        void *v11 = 0;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_openTransaction:pid:name:.cold.1()
{
}

@end