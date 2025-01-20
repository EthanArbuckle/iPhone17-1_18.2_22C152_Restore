@interface ComponentCameraRearSuperWide
- (BOOL)isPresent;
- (id)serialNumberComponentPropertyKey;
- (int64_t)cameraModuleType;
@end

@implementation ComponentCameraRearSuperWide

- (BOOL)isPresent
{
  v2 = [(ComponentCameraBase *)self IORegClassName];

  BOOL result = MGGetBoolAnswer();
  if (!v2) {
    return 0;
  }
  return result;
}

- (id)serialNumberComponentPropertyKey
{
  return @"BackSuperWideCameraModuleSerialNumString";
}

- (int64_t)cameraModuleType
{
  return 1;
}

@end