@interface _BKEventObserverConnectionRecord
@end

@implementation _BKEventObserverConnectionRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alreadySeenDeliveryChains, 0);

  objc_storeStrong((id *)&self->_observingChainIdentities, 0);
}

@end