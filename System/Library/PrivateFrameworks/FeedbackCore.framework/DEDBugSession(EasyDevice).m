@interface DEDBugSession(EasyDevice)
- (id)deviceFromManager:()EasyDevice;
@end

@implementation DEDBugSession(EasyDevice)

- (id)deviceFromManager:()EasyDevice
{
  id v4 = a3;
  v5 = [a1 deviceIdentifier];
  v6 = deviceWithIdentifier(v5, v4);

  return v6;
}

@end