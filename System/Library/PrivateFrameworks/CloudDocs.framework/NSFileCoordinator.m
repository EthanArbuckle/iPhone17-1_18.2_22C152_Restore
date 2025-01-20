@interface NSFileCoordinator
@end

@implementation NSFileCoordinator

void __56__NSFileCoordinator_BRAdditions__br_boostFilePresenter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs((uint64_t)"+[NSFileCoordinator(BRAdditions) br_boostFilePresenter:]_block_invoke", 22);
    v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [*(id *)(a1 + 32) presentedItemURL];
      v7 = [v6 path];
      v8 = objc_msgSend(v7, "fp_obfuscatedPath");
      int v9 = 138412802;
      v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed boosting file presenter at %@ - %@%@", (uint8_t *)&v9, 0x20u);
    }
  }
}

uint64_t __56__NSFileCoordinator_BRAdditions__br_boostFilePresenter___block_invoke_1(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObjResult:0 error:a2];
}

@end