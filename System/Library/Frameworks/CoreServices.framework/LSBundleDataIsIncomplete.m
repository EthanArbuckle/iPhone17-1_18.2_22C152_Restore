@interface LSBundleDataIsIncomplete
@end

@implementation LSBundleDataIsIncomplete

void ___LSBundleDataIsIncomplete_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, unsigned char *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _LSGetPlugin(*(void *)(a1 + 32), a3);
  if (v7 && !*(_DWORD *)(v7 + 140))
  {
    if ((*(unsigned char *)(v7 + 164) & 1) != 0 && *(_DWORD *)(v7 + 12))
    {
      v8 = _LSDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)_CSStringCopyCFString();
        int v10 = 134218242;
        uint64_t v11 = a3;
        __int16 v12 = 2114;
        v13 = v9;
        _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "First-party plugin %llx (%{public}@) is malformed. Skipping during incompleteness check.", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

@end