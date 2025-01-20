@interface CIPhotoEffect3DSilverplate
- (int)_defaultVersion;
- (int)_maxVersion;
@end

@implementation CIPhotoEffect3DSilverplate

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least();
}

- (int)_maxVersion
{
  return 1;
}

@end