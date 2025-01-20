@interface CDContactFavoritesUtilities
@end

@implementation CDContactFavoritesUtilities

void __46___CDContactFavoritesUtilities_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192FB2F20]();
  v1 = objc_alloc_init(_CDContactFavoritesUtilities);
  v2 = (void *)sharedInstance__pasExprOnceResult_2;
  sharedInstance__pasExprOnceResult_2 = (uint64_t)v1;
}

void __54___CDContactFavoritesUtilities_favoriteContactEntries__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 entries];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __50___CDContactFavoritesUtilities_entriesForContact___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 entriesForContact:*(void *)(a1 + 32)];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end