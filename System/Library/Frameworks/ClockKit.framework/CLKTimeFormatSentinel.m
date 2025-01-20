@interface CLKTimeFormatSentinel
@end

@implementation CLKTimeFormatSentinel

void __59___CLKTimeFormatSentinel_listenForLocaleChangesIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__handleLocaleChange name:*MEMORY[0x263EFF458] object:0];
}

@end