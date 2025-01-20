@interface ICOSLogCreate
@end

@implementation ICOSLogCreate

void ____ICOSLogCreate_block_invoke()
{
  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  v0 = [v5 processName];
  v1 = (const char *)[(id)ICLoggingDomain UTF8String];
  id v2 = v0;
  os_log_t v3 = os_log_create(v1, (const char *)[v2 UTF8String]);
  v4 = (void *)_gICOSLog;
  _gICOSLog = (uint64_t)v3;
}

@end