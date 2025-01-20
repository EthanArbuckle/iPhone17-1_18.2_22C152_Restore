@interface AFRCLog
@end

@implementation AFRCLog

uint64_t __AFRCLog_OpenStallModeLog_block_invoke()
{
  return pthread_mutex_init(&g_fpStallModeDumpOpenCloseLock, 0);
}

@end