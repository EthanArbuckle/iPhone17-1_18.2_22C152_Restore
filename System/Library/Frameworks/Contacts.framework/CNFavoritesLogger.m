@interface CNFavoritesLogger
@end

@implementation CNFavoritesLogger

void __39___CNFavoritesLogger_readingFavorites___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD3A40]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39___CNFavoritesLogger_readingFavorites___block_invoke(uint64_t a1)
{
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __39___CNFavoritesLogger_writingFavorites___block_invoke(uint64_t a1)
{
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __39___CNFavoritesLogger_writingFavorites___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD3A40]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42___CNFavoritesLogger_rematchingFavorites___block_invoke(uint64_t a1)
{
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __42___CNFavoritesLogger_rematchingFavorites___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD3A40]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end