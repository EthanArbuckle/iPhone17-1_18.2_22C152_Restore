@interface CRKCatalystNetworkPowerAssertion
- (BOOL)isCanceled;
- (void)cancel;
- (void)dealloc;
- (void)setCanceled:(BOOL)a3;
@end

@implementation CRKCatalystNetworkPowerAssertion

- (void)dealloc
{
  [(CRKCatalystNetworkPowerAssertion *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKCatalystNetworkPowerAssertion;
  [(CRKCatalystNetworkPowerAssertion *)&v3 dealloc];
}

- (void)cancel
{
  if (![(CRKCatalystNetworkPowerAssertion *)self isCanceled])
  {
    [(CRKCatalystNetworkPowerAssertion *)self setCanceled:1];
    +[CRKNetworkPowerAssertion decrement];
  }
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

@end