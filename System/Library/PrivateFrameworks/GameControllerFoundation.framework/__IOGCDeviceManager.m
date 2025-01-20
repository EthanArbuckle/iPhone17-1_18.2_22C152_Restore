@interface __IOGCDeviceManager
- (__IOGCDeviceManager)init;
- (void)dealloc;
@end

@implementation __IOGCDeviceManager

- (__IOGCDeviceManager)init
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)__IOGCDeviceManager;
  [(__IOGCDeviceManager *)&v2 dealloc];
}

@end