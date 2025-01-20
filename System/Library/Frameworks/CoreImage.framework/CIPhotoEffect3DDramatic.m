@interface CIPhotoEffect3DDramatic
- (int)_defaultVersion;
- (int)_maxVersion;
@end

@implementation CIPhotoEffect3DDramatic

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least();
}

- (int)_maxVersion
{
  return 1;
}

@end