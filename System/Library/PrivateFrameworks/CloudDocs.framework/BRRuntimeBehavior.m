@interface BRRuntimeBehavior
+ (BOOL)isInternalBuild;
+ (BOOL)isRunningInDaemonBundle;
+ (BOOL)isRunningOnIOS;
+ (BOOL)isRunningOnMacOS;
+ (BOOL)isSeedBuild;
@end

@implementation BRRuntimeBehavior

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_18);
  }
  return isInternalBuild_isInternalBuild;
}

uint64_t __36__BRRuntimeBehavior_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  isInternalBuild_isInternalBuild = result;
  return result;
}

+ (BOOL)isSeedBuild
{
  if (isSeedBuild_onceToken != -1) {
    dispatch_once(&isSeedBuild_onceToken, &__block_literal_global_3);
  }
  return isSeedBuild_isSeedBuild;
}

void __32__BRRuntimeBehavior_isSeedBuild__block_invoke()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getSDBuildInfoClass_softClass;
  uint64_t v6 = getSDBuildInfoClass_softClass;
  if (!getSDBuildInfoClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getSDBuildInfoClass_block_invoke;
    v2[3] = &unk_1E59AE908;
    v2[4] = &v3;
    __getSDBuildInfoClass_block_invoke((uint64_t)v2);
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  if (v1) {
    isSeedBuild_isSeedBuild = [v1 currentBuildIsSeed];
  }
}

+ (BOOL)isRunningInDaemonBundle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];

  LOBYTE(v2) = [v3 isEqualToString:@"com.apple.bird"];
  return (char)v2;
}

+ (BOOL)isRunningOnMacOS
{
  return 0;
}

+ (BOOL)isRunningOnIOS
{
  return 1;
}

@end