@interface ComponentCameraRear
- (id)serialNumberComponentPropertyKey;
- (int64_t)cameraModuleType;
@end

@implementation ComponentCameraRear

- (id)serialNumberComponentPropertyKey
{
  return @"BackCameraModuleSerialNumString";
}

- (int64_t)cameraModuleType
{
  return 1;
}

@end