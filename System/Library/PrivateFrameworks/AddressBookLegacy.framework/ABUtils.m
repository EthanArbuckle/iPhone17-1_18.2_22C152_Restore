@interface ABUtils
+ (id)mainBundleID;
+ (id)processName;
@end

@implementation ABUtils

+ (id)mainBundleID
{
  v2 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
  return (id)[v2 bundleIdentifier];
}

+ (id)processName
{
  v2 = (void *)[MEMORY[0x1E4F28F80] processInfo];
  return (id)[v2 processName];
}

@end