@interface CFTSDInitialize
@end

@implementation CFTSDInitialize

uint64_t ____CFTSDInitialize_block_invoke()
{
  return pthread_key_create(&__CFTSDIndexKey, (void (__cdecl *)(void *))__CFTSDFinalize);
}

@end