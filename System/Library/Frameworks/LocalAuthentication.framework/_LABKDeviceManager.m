@interface _LABKDeviceManager
+ (id)availableDevices;
+ (id)availableDevicesWithFailure:(BOOL *)a3;
@end

@implementation _LABKDeviceManager

+ (id)availableDevices
{
  return (id)[a1 availableDevicesWithFailure:0];
}

+ (id)availableDevicesWithFailure:(BOOL *)a3
{
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = +[_LAAuthenticationBiometricMethodShim sharedInstance];
  v7 = [v6 biometricMethodState];
  int v8 = [v7 isTouchID];

  if (v8)
  {
    v9 = +[_LABKDeviceDescriptor deviceDescriptorForType:1];
    [v5 addObject:v9];
  }
  v10 = +[_LAAuthenticationBiometricMethodShim sharedInstance];
  v11 = [v10 biometricMethodState];
  int v12 = [v11 isFaceID];

  if (v12)
  {
    v13 = +[_LABKDeviceDescriptor deviceDescriptorForType:2];
    [v5 addObject:v13];
  }
  +[_LABKLog logClass:objc_opt_class(), a2, @"-> %@", v5 selector message];
  if (a3) {
    *a3 = 0;
  }
  v14 = (void *)[v5 copy];

  return v14;
}

@end