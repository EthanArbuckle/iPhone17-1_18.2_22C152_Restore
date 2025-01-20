@interface MTRClusterBridgedDeviceBasic
- (MTRClusterBridgedDeviceBasic)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
@end

@implementation MTRClusterBridgedDeviceBasic

- (MTRClusterBridgedDeviceBasic)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  v9 = queue;
  v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  v13 = (MTRClusterBridgedDeviceBasic *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end