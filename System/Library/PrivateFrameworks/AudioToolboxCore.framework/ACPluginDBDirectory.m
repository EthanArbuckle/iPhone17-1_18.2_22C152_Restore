@interface ACPluginDBDirectory
@end

@implementation ACPluginDBDirectory

uint64_t __50___ACPluginDBDirectory_eventStreamCallback_flags___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(v3 + 8) == *(void *)(result + 88))
  {
    [(id)result bundlesChanged:*(void *)(result + 80) shouldRescan:*(unsigned __int8 *)(result + 96)];
    *(void *)(*(void *)(a1 + 32) + 88) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
    v4 = *(void **)(*(void *)(a1 + 32) + 80);
    return [v4 removeAllObjects];
  }
  return result;
}

@end