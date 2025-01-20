@interface UIRemotePidManagerAccessibility
@end

@implementation UIRemotePidManagerAccessibility

void __50___UIRemotePidManagerAccessibility_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_UIRemotePidManagerAccessibility);
  v1 = (void *)sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;
}

void __40___UIRemotePidManagerAccessibility_init__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = v1;
}

uint64_t __69___UIRemotePidManagerAccessibility_unsuspendPid_forAssertionPointer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_unsuspendPid:forAssertionPointer:", *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), a1, a1);
}

uint64_t __67___UIRemotePidManagerAccessibility_suspendPid_forAssertionPointer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_suspendPid:forAssertionPointer:", *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), a1, a1);
}

@end