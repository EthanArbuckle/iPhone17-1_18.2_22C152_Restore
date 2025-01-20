@interface PthreadKey
@end

@implementation PthreadKey

uint64_t ___PthreadKey_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_PthreadKey_key, 0);
}

@end