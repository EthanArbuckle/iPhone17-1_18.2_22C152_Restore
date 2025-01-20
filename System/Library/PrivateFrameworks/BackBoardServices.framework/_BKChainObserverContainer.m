@interface _BKChainObserverContainer
- (BKSEventDeferringChainIdentity)requestedChainIdentity;
- (BKSHIDEventDeliveryChainObserver)observerInterface;
- (BKSHIDEventDeliveryChainObserving)observingClient;
- (void)setObserverInterface:(id)a3;
- (void)setObservingClient:(id)a3;
- (void)setRequestedChainIdentity:(id)a3;
@end

@implementation _BKChainObserverContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedChainIdentity, 0);
  objc_storeStrong((id *)&self->_observerInterface, 0);
  objc_storeStrong((id *)&self->_observingClient, 0);
}

- (void)setRequestedChainIdentity:(id)a3
{
}

- (BKSEventDeferringChainIdentity)requestedChainIdentity
{
  return self->_requestedChainIdentity;
}

- (void)setObserverInterface:(id)a3
{
}

- (BKSHIDEventDeliveryChainObserver)observerInterface
{
  return self->_observerInterface;
}

- (void)setObservingClient:(id)a3
{
}

- (BKSHIDEventDeliveryChainObserving)observingClient
{
  return self->_observingClient;
}

@end