@interface _BKHIDEventDeliveryRoot
- (id)description;
@end

@implementation _BKHIDEventDeliveryRoot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionPaths, 0);
  objc_storeStrong((id *)&self->_deliveryChainByIdentity, 0);
  objc_storeStrong((id *)&self->_bufferingDispatchRules, 0);
  objc_storeStrong((id *)&self->_dispatchingRules, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)description
{
  return self->_identifier;
}

@end