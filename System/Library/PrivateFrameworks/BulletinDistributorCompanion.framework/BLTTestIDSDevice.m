@interface BLTTestIDSDevice
- (BOOL)isCloudReachable;
- (BOOL)isConnected;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isNearby;
- (void)setIsCloudReachable:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsDefaultPairedDevice:(BOOL)a3;
- (void)setIsNearby:(BOOL)a3;
@end

@implementation BLTTestIDSDevice

- (BOOL)isDefaultPairedDevice
{
  return self->_isDefaultPairedDevice;
}

- (void)setIsDefaultPairedDevice:(BOOL)a3
{
  self->_isDefaultPairedDevice = a3;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void)setIsNearby:(BOOL)a3
{
  self->_isNearby = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isCloudReachable
{
  return self->_isCloudReachable;
}

- (void)setIsCloudReachable:(BOOL)a3
{
  self->_isCloudReachable = a3;
}

@end