@interface _GCGenericPhysicalDevicePending(GameController)
- (_GCDefaultPhysicalDevice)_onqueue_createDeviceWithModel:()GameController service:;
@end

@implementation _GCGenericPhysicalDevicePending(GameController)

- (_GCDefaultPhysicalDevice)_onqueue_createDeviceWithModel:()GameController service:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [_GCDefaultPhysicalDevice alloc];
  v9 = [a1 manager];
  v10 = [(_GCDefaultPhysicalDevice *)v8 initWithHIDDevice:v6 manager:v9];

  [(_GCDefaultPhysicalDevice *)v10 setDelegate:v7];
  objc_setAssociatedObject(v10, "Model", v7, (void *)0x301);

  return v10;
}

@end