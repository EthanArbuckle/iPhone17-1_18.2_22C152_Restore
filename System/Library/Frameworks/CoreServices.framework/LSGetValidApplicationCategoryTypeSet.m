@interface LSGetValidApplicationCategoryTypeSet
@end

@implementation LSGetValidApplicationCategoryTypeSet

void ___LSGetValidApplicationCategoryTypeSet_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(a3 + 8) & 0x20) != 0)
  {
    v4 = (const void *)_CSStringCopyCFString();
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), v4);
    CFRelease(v4);
  }
}

void ___LSGetValidApplicationCategoryTypeSet_block_invoke_69(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ___LSGetValidApplicationCategoryTypeSet_block_invoke_69_cold_1((uint64_t)v2, v3);
  }
}

void ___LSGetValidApplicationCategoryTypeSet_block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (v6)
  {
    v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ___LSGetValidApplicationCategoryTypeSet_block_invoke_71_cold_1((uint64_t)v6, v9);
    }
  }
}

void ___LSGetValidApplicationCategoryTypeSet_block_invoke_69_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Error on connection finding category type identifiers from lsd: %@", (uint8_t *)&v2, 0xCu);
}

void ___LSGetValidApplicationCategoryTypeSet_block_invoke_71_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Error finding category type identifiers from lsd: %@", (uint8_t *)&v2, 0xCu);
}

@end