@interface GEOConfigChangedBlockListener
@end

@implementation GEOConfigChangedBlockListener

uint64_t __46___GEOConfigChangedBlockListener_callListener__block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

@end