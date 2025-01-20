@interface CNUILog
@end

@implementation CNUILog

CFIndex ___CNUILog_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(@"CNUILogLevel", (CFStringRef)*MEMORY[0x1E4F1D3D8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    uint64_t v1 = result;
  }
  else {
    uint64_t v1 = 0;
  }
  _CNUILog_logsEnabled = v1;
  return result;
}

@end