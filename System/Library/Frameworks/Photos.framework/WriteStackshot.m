@interface WriteStackshot
@end

@implementation WriteStackshot

void *____WriteStackshot_block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  if (result)
  {
    result = dlsym(result, "WriteStackshotReport");
    __WriteStackshot_PHWriteStackshotReport = (uint64_t (*)(void, void))result;
  }
  return result;
}

@end