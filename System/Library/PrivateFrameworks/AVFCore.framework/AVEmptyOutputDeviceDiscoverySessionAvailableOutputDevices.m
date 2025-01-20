@interface AVEmptyOutputDeviceDiscoverySessionAvailableOutputDevices
- (NSArray)allDevices;
@end

@implementation AVEmptyOutputDeviceDiscoverySessionAvailableOutputDevices

- (NSArray)allDevices
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

@end