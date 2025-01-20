@interface DMFDevicePropertiesResultObject
- (Class)classForCoder;
@end

@implementation DMFDevicePropertiesResultObject

- (Class)classForCoder
{
  v4.receiver = self;
  v4.super_class = (Class)DMFDevicePropertiesResultObject;
  v2 = [(DMFFetchDevicePropertiesResultObject *)&v4 classForCoder];
  return (Class)v2;
}

@end