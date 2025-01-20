@interface _BKHIDKeyCommandDeliveryRoot
@end

@implementation _BKHIDKeyCommandDeliveryRoot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryChainByIdentity, 0);
  objc_storeStrong((id *)&self->_dispatchingRule, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end