@interface AXReleasePortFromCache
@end

@implementation AXReleasePortFromCache

uint64_t ___AXReleasePortFromCache_block_invoke(uint64_t a1)
{
  return mach_port_deallocate(*MEMORY[0x1E4F14960], *(_DWORD *)(a1 + 32));
}

@end