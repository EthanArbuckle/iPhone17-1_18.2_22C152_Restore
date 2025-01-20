@interface HNDActiveClientHelper
- (BOOL)hasActiveClients;
- (HNDActiveClientHelper)init;
- (id)addActiveClientWithReason:(id)a3;
- (void)assertionCoordinator:(id)a3 assertionsDidBecomeActive:(BOOL)a4;
@end

@implementation HNDActiveClientHelper

- (HNDActiveClientHelper)init
{
  v9.receiver = self;
  v9.super_class = (Class)HNDActiveClientHelper;
  v2 = [(HNDActiveClientHelper *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)AXAssertionCoordinator);
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = (AXAssertionCoordinator *)[v3 initWithIdentifier:v5 delegate:v2];
    assertionCoordinator = v2->_assertionCoordinator;
    v2->_assertionCoordinator = v6;

    v2->_hasActiveClients = 0;
  }
  return v2;
}

- (id)addActiveClientWithReason:(id)a3
{
  return [(AXAssertionCoordinator *)self->_assertionCoordinator acquireAssertionWithReason:a3];
}

- (void)assertionCoordinator:(id)a3 assertionsDidBecomeActive:(BOOL)a4
{
  self->_hasActiveClients = a4;
  +[HNDVirtualHIDMouse reevaluateDeviceCleanupTimer];
}

- (BOOL)hasActiveClients
{
  return self->_hasActiveClients;
}

- (void).cxx_destruct
{
}

@end