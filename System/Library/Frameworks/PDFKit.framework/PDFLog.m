@interface PDFLog
@end

@implementation PDFLog

uint64_t ___PDFLog_block_invoke()
{
  v0 = getprogname();
  os_log_t v1 = os_log_create("com.apple.PDFKit", v0);
  uint64_t v2 = sLog;
  sLog = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

@end