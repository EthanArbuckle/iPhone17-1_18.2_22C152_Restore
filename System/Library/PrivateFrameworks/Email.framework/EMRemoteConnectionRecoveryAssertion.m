@interface EMRemoteConnectionRecoveryAssertion
- (EMRemoteConnectionRecoveryAssertion)initWithConnection:(id)a3;
- (EMRemoteConnectionRecoveryAssertionDelegate)delegate;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation EMRemoteConnectionRecoveryAssertion

- (EMRemoteConnectionRecoveryAssertion)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMRemoteConnectionRecoveryAssertion;
  v5 = [(EMRemoteConnectionRecoveryAssertion *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    [v4 voucherInitialized];
  }

  return v6;
}

- (void)dealloc
{
  [(EMRemoteConnectionRecoveryAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)EMRemoteConnectionRecoveryAssertion;
  [(EMRemoteConnectionRecoveryAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v2 = (EMRemoteConnectionRecoveryAssertion *)((char *)v2 + 16);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->super.isa);
  [WeakRetained voucherInvalidated];

  objc_storeWeak((id *)&v2->super.isa, 0);
  os_unfair_lock_unlock(p_lock);
}

- (EMRemoteConnectionRecoveryAssertionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EMRemoteConnectionRecoveryAssertionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end