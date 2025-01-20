@interface VNRuntimeUtilities
+ (int)linkTimeVersion;
+ (int)runTimeVersion;
@end

@implementation VNRuntimeUtilities

uint64_t __37__VNRuntimeUtilities_linkTimeVersion__block_invoke()
{
  uint64_t result = NSVersionOfLinkTimeLibrary("Vision");
  linkTimeVersion_version = result;
  return result;
}

uint64_t __36__VNRuntimeUtilities_runTimeVersion__block_invoke()
{
  uint64_t result = NSVersionOfRunTimeLibrary("Vision");
  runTimeVersion_version = result;
  return result;
}

+ (int)runTimeVersion
{
  if (runTimeVersion_onceToken != -1) {
    dispatch_once(&runTimeVersion_onceToken, &__block_literal_global_3);
  }
  return runTimeVersion_version;
}

+ (int)linkTimeVersion
{
  if (linkTimeVersion_onceToken != -1) {
    dispatch_once(&linkTimeVersion_onceToken, &__block_literal_global_3963);
  }
  return linkTimeVersion_version;
}

@end