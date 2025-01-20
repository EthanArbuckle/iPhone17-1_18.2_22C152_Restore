@interface ASVISAI
+ (BOOL)isAppleInternalInstall;
@end

@implementation ASVISAI

+ (BOOL)isAppleInternalInstall
{
  if (isAppleInternalInstall_onceToken != -1) {
    dispatch_once(&isAppleInternalInstall_onceToken, &__block_literal_global_0);
  }
  return isAppleInternalInstall_isAppleInternalInstall;
}

uint64_t __33__ASVISAI_isAppleInternalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isAppleInternalInstall_isAppleInternalInstall = result;
  return result;
}

@end