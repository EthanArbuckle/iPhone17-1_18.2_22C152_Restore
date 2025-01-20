@interface _DPDeviceInfo
+ (BOOL)isDataCollectionEnabled;
+ (BOOL)isDisabledByTaskingForCrashCopier;
+ (BOOL)isDisabledByTaskingForDedisco;
+ (BOOL)isDisabledByTaskingForTransport:(unint64_t)a3;
+ (BOOL)isInternalBuild;
+ (BOOL)isRunningAsLaunchDaemon;
+ (BOOL)isRunningUnitTests;
+ (id)osVersion;
@end

@implementation _DPDeviceInfo

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_11);
  }
  return isInternalBuild_isInternalBuild;
}

+ (id)osVersion
{
  v2 = (__CFString *)MGCopyAnswer();
  v3 = (__CFString *)MGCopyAnswer();
  if (v2) {
    v4 = v2;
  }
  else {
    v4 = @"???";
  }
  v5 = v4;
  if (v3) {
    v6 = v3;
  }
  else {
    v6 = @"???";
  }
  v7 = v6;
  v8 = [NSString stringWithFormat:@"%@ %@ (%@)", @"iPhone OS", v5, v7];
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    CFRelease(v3);
  }

  return v8;
}

+ (BOOL)isDataCollectionEnabled
{
  if (isDataCollectionEnabled_onceToken != -1) {
    dispatch_once(&isDataCollectionEnabled_onceToken, &__block_literal_global_18);
  }
  return isDataCollectionEnabled_dataCollectionEnabled;
}

+ (BOOL)isDisabledByTaskingForTransport:(unint64_t)a3
{
  if (a3 == 4) {
    return [a1 isDisabledByTaskingForDedisco];
  }
  if (a3 == 1) {
    return [a1 isDisabledByTaskingForCrashCopier];
  }
  return 0;
}

+ (BOOL)isDisabledByTaskingForCrashCopier
{
  if ([(id)objc_opt_class() isRunningUnitTests]) {
    return 0;
  }
  v3 = (void *)MEMORY[0x1E019F810]();
  v4 = OSAGetDATaskingValue();
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (BOOL)isDisabledByTaskingForDedisco
{
  v2 = (void *)MEMORY[0x1E019F810](a1, a2);
  v3 = OSAGetDATaskingValue();
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)isRunningUnitTests
{
  if (isRunningUnitTests_onceToken != -1) {
    dispatch_once(&isRunningUnitTests_onceToken, &__block_literal_global_26);
  }
  return isRunningUnitTests_runningTests;
}

+ (BOOL)isRunningAsLaunchDaemon
{
  return 0;
}

@end