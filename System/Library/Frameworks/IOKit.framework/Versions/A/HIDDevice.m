@interface HIDDevice
- (id)description;
- (void)dealloc;
@end

@implementation HIDDevice

- (void)dealloc
{
  _IOHIDDeviceReleasePrivate((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HIDDevice;
  [(HIDDevice *)&v3 dealloc];
}

- (id)description
{
  v2 = IOHIDDeviceCopyDescription((io_object_t *)self);

  return v2;
}

@end