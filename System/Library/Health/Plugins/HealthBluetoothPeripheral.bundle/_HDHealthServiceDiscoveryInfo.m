@interface _HDHealthServiceDiscoveryInfo
@end

@implementation _HDHealthServiceDiscoveryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong(&self->_discoveryHandler, 0);

  objc_storeStrong((id *)&self->_peripheralsUUIDs, 0);
}

@end