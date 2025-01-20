@interface HMDThreadNetworkPeripheralDeviceNodeTypeEvent
- (HMDThreadNetworkPeripheralDeviceNodeTypeEvent)initWithPeripheralDeviceNodeType:(int64_t)a3;
- (int64_t)peripheralDeviceNodeType;
@end

@implementation HMDThreadNetworkPeripheralDeviceNodeTypeEvent

- (int64_t)peripheralDeviceNodeType
{
  return self->_peripheralDeviceNodeType;
}

- (HMDThreadNetworkPeripheralDeviceNodeTypeEvent)initWithPeripheralDeviceNodeType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDThreadNetworkPeripheralDeviceNodeTypeEvent;
  result = [(HMDThreadNetworkPeripheralDeviceNodeTypeEvent *)&v5 init];
  if (result) {
    result->_peripheralDeviceNodeType = a3;
  }
  return result;
}

@end