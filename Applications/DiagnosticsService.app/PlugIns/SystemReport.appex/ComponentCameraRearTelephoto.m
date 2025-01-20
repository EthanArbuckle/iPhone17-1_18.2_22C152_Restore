@interface ComponentCameraRearTelephoto
- (BOOL)isPresent;
- (id)serialNumberComponentPropertyKey;
- (int64_t)cameraModuleType;
@end

@implementation ComponentCameraRearTelephoto

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
  return @"BackTeleCameraModuleSerialNumString";
}

- (int64_t)cameraModuleType
{
  return 1;
}

@end