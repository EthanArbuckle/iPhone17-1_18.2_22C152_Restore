@interface IFDeviceInfo
+ (id)sharedInstance;
- (IFDeviceInfo)init;
- (int)deviceClass;
@end

@implementation IFDeviceInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __30__IFDeviceInfo_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(IFDeviceInfo);

  return MEMORY[0x1F41817F8]();
}

- (IFDeviceInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)IFDeviceInfo;
  v2 = [(IFDeviceInfo *)&v5 init];
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v2->_deviceClass = [v3 intValue];
  }
  return v2;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

@end