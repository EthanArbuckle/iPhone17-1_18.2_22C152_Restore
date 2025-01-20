@interface ComponentCameraIRBase
- (BOOL)isPresent;
- (id)serialNumberComponentPropertyKey;
- (int64_t)cameraModuleType;
@end

@implementation ComponentCameraIRBase

- (BOOL)isPresent
{
  v3 = [(ComponentCameraBase *)self IORegClassName];

  v4 = [(ComponentCameraBase *)self serialNumber];
  v5 = v4;
  LOBYTE(v6) = 0;
  if (v3 && v4) {
    unsigned int v6 = [v4 isEqualToString:&stru_1000A3028] ^ 1;
  }

  return v6;
}

- (id)serialNumberComponentPropertyKey
{
  return @"JasperSNUM";
}

- (int64_t)cameraModuleType
{
  return 1;
}

@end