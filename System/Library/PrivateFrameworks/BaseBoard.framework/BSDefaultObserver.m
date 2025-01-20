@interface BSDefaultObserver
@end

@implementation BSDefaultObserver

uint64_t __69___BSDefaultObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  unsigned int v1 = atomic_load((unsigned int *)(result + 40));
  uint64_t v2 = *(void *)(result + 32);
  if (v1 == *(_DWORD *)(v2 + 44)) {
    return (*(uint64_t (**)(void))(*(void *)(v2 + 32) + 16))();
  }
  return result;
}

@end