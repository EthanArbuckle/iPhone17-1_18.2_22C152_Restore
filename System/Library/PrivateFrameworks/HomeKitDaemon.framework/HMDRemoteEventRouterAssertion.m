@interface HMDRemoteEventRouterAssertion
- (BOOL)isActive;
- (HMDRemoteEventRouterAssertion)initWithAssertionController:(id)a3;
- (HMDRemoteEventRouterClientActiveStateDelegate)activeStateDelegate;
- (void)cancel;
- (void)dealloc;
- (void)setActiveStateDelegate:(id)a3;
- (void)setIsActive:(BOOL)a3;
@end

@implementation HMDRemoteEventRouterAssertion

- (void).cxx_destruct
{
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setActiveStateDelegate:(id)a3
{
}

- (HMDRemoteEventRouterClientActiveStateDelegate)activeStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeStateDelegate);
  return (HMDRemoteEventRouterClientActiveStateDelegate *)WeakRetained;
}

- (void)dealloc
{
  [(HMDRemoteEventRouterAssertion *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)HMDRemoteEventRouterAssertion;
  [(HMDRemoteEventRouterAssertion *)&v3 dealloc];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = [(HMDRemoteEventRouterAssertion *)self isActive];
  [(HMDRemoteEventRouterAssertion *)self setIsActive:0];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = [(HMDRemoteEventRouterAssertion *)self activeStateDelegate];
    [v5 assertionDidBecomeInactive:self];
  }
}

- (HMDRemoteEventRouterAssertion)initWithAssertionController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)HMDRemoteEventRouterAssertion;
    v6 = [(HMDRemoteEventRouterAssertion *)&v11 init];
    v7 = v6;
    if (v6)
    {
      objc_storeWeak((id *)&v6->_activeStateDelegate, v5);
      v7->_isActive = 1;
      v7->_lock._os_unfair_lock_opaque = 0;
    }

    return v7;
  }
  else
  {
    v9 = (HMDRemoteEventRouterAssertionController *)_HMFPreconditionFailure();
    [(HMDRemoteEventRouterAssertionController *)v9 .cxx_destruct];
  }
  return result;
}

@end