@interface BOMExceptionMessageString
@end

@implementation BOMExceptionMessageString

uint64_t ____BOMExceptionMessageString_block_invoke()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&__BOMExceptionMessageString___key, MEMORY[0x1E4F14838]);
  if (result)
  {
    return _CUILog();
  }
  return result;
}

@end