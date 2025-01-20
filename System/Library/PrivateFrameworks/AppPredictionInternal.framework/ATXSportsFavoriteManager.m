@interface ATXSportsFavoriteManager
+ (void)favoritesWithCompletion:(id)a3;
+ (void)isOnboarded:(id)a3;
@end

@implementation ATXSportsFavoriteManager

+ (void)favoritesWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB5160] defaultManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__ATXSportsFavoriteManager_favoritesWithCompletion___block_invoke;
  v6[3] = &unk_1E68B3830;
  id v7 = v3;
  id v5 = v3;
  [v4 favoritesWithCompletion:v6];
}

uint64_t __52__ATXSportsFavoriteManager_favoritesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 | a4)
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v5();
  }
  else
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __52__ATXSportsFavoriteManager_favoritesWithCompletion___block_invoke_cold_1(v7);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)isOnboarded:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB5160] defaultManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__ATXSportsFavoriteManager_isOnboarded___block_invoke;
  v6[3] = &unk_1E68B3858;
  id v7 = v3;
  id v5 = v3;
  [v4 isOnboarded:v6];
}

uint64_t __40__ATXSportsFavoriteManager_isOnboarded___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__ATXSportsFavoriteManager_favoritesWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "-[WLKSportsFavoriteManager favoritesWithCompletion:] returned a nil response and error", v1, 2u);
}

@end