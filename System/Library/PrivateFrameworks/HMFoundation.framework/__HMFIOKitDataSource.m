@interface __HMFIOKitDataSource
- (NSString)modelIdentifier;
- (NSString)serialNumber;
- (int64_t)productClass;
- (int64_t)productPlatform;
- (int64_t)productVariant;
@end

@implementation __HMFIOKitDataSource

- (NSString)serialNumber
{
  return (NSString *)__getPlatformInformationForKey(@"IOPlatformSerialNumber");
}

- (int64_t)productPlatform
{
  return 0;
}

- (int64_t)productClass
{
  v2 = __getPlatformInformationForKey(@"model");
  int64_t v3 = HMFProductClassFromString(v2);

  return v3;
}

- (int64_t)productVariant
{
  return 0;
}

- (NSString)modelIdentifier
{
  return (NSString *)__getPlatformInformationForKey(@"model");
}

@end