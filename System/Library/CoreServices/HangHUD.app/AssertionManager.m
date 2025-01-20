@interface AssertionManager
- (AssertionManager)init;
- (id)acquireKeepAliveAssertion;
- (id)createInstance;
- (void)invalidateKeepAliveAssertion;
@end

@implementation AssertionManager

- (AssertionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AssertionManager;
  v2 = [(AssertionManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    keepAliveAssertion = v2->_keepAliveAssertion;
    v2->_keepAliveAssertion = 0;

    v3->_assertionLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (id)acquireKeepAliveAssertion
{
  p_keepAliveAssertion = (id *)&self->_keepAliveAssertion;
  keepAliveAssertion = self->_keepAliveAssertion;
  if (keepAliveAssertion)
  {
LABEL_6:
    v14 = keepAliveAssertion;
    goto LABEL_7;
  }
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  objc_super v6 = [(AssertionManager *)self createInstance];
  v7 = self->_keepAliveAssertion;
  self->_keepAliveAssertion = v6;

  os_unfair_lock_unlock(p_assertionLock);
  v8 = self->_keepAliveAssertion;
  id v16 = 0;
  unsigned __int8 v9 = [(RBSAssertion *)v8 acquireWithError:&v16];
  id v10 = v16;
  v11 = sub_10000E760();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = *p_keepAliveAssertion;
      *(_DWORD *)buf = 134217984;
      id v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Acquired render assertion: %p", buf, 0xCu);
    }

    keepAliveAssertion = (RBSAssertion *)*p_keepAliveAssertion;
    goto LABEL_6;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10001C55C(p_keepAliveAssertion, (uint64_t)v10, v12);
  }

  v14 = 0;
LABEL_7:

  return v14;
}

- (void)invalidateKeepAliveAssertion
{
  if (self->_keepAliveAssertion)
  {
    p_assertionLock = &self->_assertionLock;
    os_unfair_lock_lock(&self->_assertionLock);
    [(RBSAssertion *)self->_keepAliveAssertion invalidate];
    v4 = sub_10000E760();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      keepAliveAssertion = self->_keepAliveAssertion;
      int v7 = 134217984;
      v8 = keepAliveAssertion;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Invalidated render assertion: %p", (uint8_t *)&v7, 0xCu);
    }

    objc_super v6 = self->_keepAliveAssertion;
    self->_keepAliveAssertion = 0;

    os_unfair_lock_unlock(p_assertionLock);
  }
}

- (id)createInstance
{
  v2 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.frontboard" name:@"SystemShell"];
  id v3 = objc_alloc((Class)RBSAssertion);
  v4 = +[RBSProcessIdentity identityOfCurrentProcess];
  v5 = +[RBSTarget targetWithProcessIdentity:v4];
  v14 = v2;
  objc_super v6 = +[NSArray arrayWithObjects:&v14 count:1];
  id v7 = [v3 initWithExplanation:@"HangHUD is rendering HUD" target:v5 attributes:v6];

  v8 = sub_10000E760();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218242;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Created render assertion: %p withAttributes: %@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end