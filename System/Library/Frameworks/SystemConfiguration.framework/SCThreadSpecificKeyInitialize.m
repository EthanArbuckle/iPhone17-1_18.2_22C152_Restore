@interface SCThreadSpecificKeyInitialize
@end

@implementation SCThreadSpecificKeyInitialize

uint64_t ____SCThreadSpecificKeyInitialize_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&tsDataKey, (void (__cdecl *)(void *))__SCThreadSpecificDataFinalize);
}

@end