@interface LaunchAppStore
@end

@implementation LaunchAppStore

void ___LaunchAppStore_block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (a2 & 1) == 0)
  {
    v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      v7 = "_LaunchAppStore_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to open App Store : %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

@end