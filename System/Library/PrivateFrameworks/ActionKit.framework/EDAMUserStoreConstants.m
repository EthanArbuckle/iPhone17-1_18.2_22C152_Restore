@interface EDAMUserStoreConstants
+ (signed)EDAM_VERSION_MAJOR;
+ (signed)EDAM_VERSION_MINOR;
@end

@implementation EDAMUserStoreConstants

+ (signed)EDAM_VERSION_MINOR
{
  return 28;
}

+ (signed)EDAM_VERSION_MAJOR
{
  return 1;
}

@end