@interface HMDClientConnectionDataSource
- (BOOL)supportsDeviceLock;
- (HMDCarPlayDataSource)carPlayDataSource;
- (HMDClientConnectionDataSource)init;
@end

@implementation HMDClientConnectionDataSource

- (void).cxx_destruct
{
}

- (HMDCarPlayDataSource)carPlayDataSource
{
  return (HMDCarPlayDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)supportsDeviceLock
{
  return +[HMDDeviceCapabilities supportsDeviceLock];
}

- (HMDClientConnectionDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDClientConnectionDataSource;
  v2 = [(HMDClientConnectionDataSource *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(HMDCarPlayDataSource);
    carPlayDataSource = v2->_carPlayDataSource;
    v2->_carPlayDataSource = v3;
  }
  return v2;
}

@end