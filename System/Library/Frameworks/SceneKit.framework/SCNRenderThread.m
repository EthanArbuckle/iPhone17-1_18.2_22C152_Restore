@interface SCNRenderThread
@end

@implementation SCNRenderThread

uint64_t ____SCNRenderThread_start___block_invoke()
{
  return pthread_key_create((pthread_key_t *)&__SCNRenderThread_start___block_key, (void (__cdecl *)(void *))__SCNRenderThread_dispose__);
}

@end