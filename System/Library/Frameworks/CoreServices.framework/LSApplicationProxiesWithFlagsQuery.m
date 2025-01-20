@interface LSApplicationProxiesWithFlagsQuery
@end

@implementation LSApplicationProxiesWithFlagsQuery

BOOL __73___LSApplicationProxiesWithFlagsQuery__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(_DWORD *)(a1 + 40) & ~*(_DWORD *)(a4 + 180)) == 0 && (*(void *)(a1 + 32) & ~*(void *)(a4 + 172)) == 0;
}

@end