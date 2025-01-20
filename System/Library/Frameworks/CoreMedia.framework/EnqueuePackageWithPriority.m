@interface EnqueuePackageWithPriority
@end

@implementation EnqueuePackageWithPriority

intptr_t __ids_EnqueuePackageWithPriority_block_invoke(uint64_t a1)
{
  **(void **)(a1 + 32) = 0;
  uint64_t v2 = *(int *)(a1 + 56);
  **(void **)(*(void *)(a1 + 40) + 16 * v2 + 104) = *(void *)(a1 + 32);
  *(void *)(*(void *)(a1 + 40) + 16 * v2 + 104) = *(void *)(a1 + 32);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v3 = *(NSObject **)(*(void *)(a1 + 40) + 152);

  return dispatch_semaphore_signal(v3);
}

void __tcp_EnqueuePackageWithPriority_block_invoke(uint64_t a1)
{
  **(void **)(a1 + 32) = 0;
  uint64_t v2 = 3 * *(int *)(a1 + 56);
  **(void **)(*(void *)(a1 + 40) + 24 * *(int *)(a1 + 56) + 136) = *(void *)(a1 + 32);
  *(void *)(*(void *)(a1 + 40) + 8 * v2 + 136) = *(void *)(a1 + 32);
  write(*(_DWORD *)(*(void *)(a1 + 40) + 92), "", 1uLL);
  v3 = *(const void **)(a1 + 48);

  CFRelease(v3);
}

@end