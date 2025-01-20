@interface NRDevice
- (NSUUID)bluetoothIdentifier;
@end

@implementation NRDevice

- (NSUUID)bluetoothIdentifier
{
  return (NSUUID *)-[NRDevice valueForProperty:](self, "valueForProperty:", _NRDevicePropertyBluetoothIdentifier, a2, self);
}

@end