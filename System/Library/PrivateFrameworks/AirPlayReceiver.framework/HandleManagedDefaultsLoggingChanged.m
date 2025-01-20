@interface HandleManagedDefaultsLoggingChanged
@end

@implementation HandleManagedDefaultsLoggingChanged

uint64_t ___HandleManagedDefaultsLoggingChanged_block_invoke()
{
  int v0 = IsAppleInternalBuild();
  uint64_t result = LogControl();
  if (v0)
  {
    return LogControl();
  }
  return result;
}

@end