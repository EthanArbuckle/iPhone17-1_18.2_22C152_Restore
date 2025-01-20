@interface LSUnregisterAppWithBundleIDUsingContext
@end

@implementation LSUnregisterAppWithBundleIDUsingContext

void ___LSUnregisterAppWithBundleIDUsingContext_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _LSInstallLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "Failed to remove";
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 136446978;
    if (a2) {
      v7 = "Removed";
    }
    v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s all handler prefs for bundle ID %@: %{BOOL}i %@", (uint8_t *)&v9, 0x26u);
  }
}

@end