@interface _FBSDisplayLayoutServiceAssertion
- (FBSDisplayLayout)currentLayout;
- (_FBSDisplayLayoutServiceAssertion)init;
- (_FBSDisplayLayoutServiceAssertion)initWithEndpoint:(id)a3 qos:(char)a4 observer:(id)a5;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _FBSDisplayLayoutServiceAssertion

- (FBSDisplayLayout)currentLayout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(_FBSDisplayLayoutService *)self->_lock_service currentLayout];
  os_unfair_lock_unlock(p_lock);

  return (FBSDisplayLayout *)v4;
}

- (_FBSDisplayLayoutServiceAssertion)initWithEndpoint:(id)a3 qos:(char)a4 observer:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_FBSDisplayLayoutServiceAssertion;
  v10 = [(_FBSDisplayLayoutServiceAssertion *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v12 = +[_FBSDisplayLayoutEndpointServices _checkoutServiceWithEndpoint:v8 qos:v6];
    lock_service = v11->_lock_service;
    v11->_lock_service = (_FBSDisplayLayoutService *)v12;

    if (v9) {
      [(_FBSDisplayLayoutService *)v11->_lock_service addObserver:v9 forKey:v11];
    }
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(_FBSDisplayLayoutServiceAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_FBSDisplayLayoutServiceAssertion;
  [(_FBSDisplayLayoutServiceAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_service = self->_lock_service;
  if (lock_service)
  {
    [(_FBSDisplayLayoutService *)lock_service removeObserverForKey:self];
    +[_FBSDisplayLayoutEndpointServices _checkinService:self->_lock_service];
    v5 = self->_lock_service;
    self->_lock_service = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

- (_FBSDisplayLayoutServiceAssertion)init
{
  return [(_FBSDisplayLayoutServiceAssertion *)self initWithEndpoint:0 qos:0 observer:0];
}

@end