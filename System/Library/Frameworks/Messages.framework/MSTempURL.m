@interface MSTempURL
@end

@implementation MSTempURL

void __21___MSTempURL_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  char v4 = [v2 removeItemAtPath:v3 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    v6 = ms_defaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1E4A76000, v6, OS_LOG_TYPE_DEFAULT, "Cleanup: Failed to remove temp file with error: %@", buf, 0xCu);
    }
  }
}

@end