@interface CIPhotoEffectMono
- (int)_defaultVersion;
- (int)_maxVersion;
@end

@implementation CIPhotoEffectMono

- (int)_defaultVersion
{
  if (dyld_program_sdk_at_least()) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int)_maxVersion
{
  return 2;
}

@end