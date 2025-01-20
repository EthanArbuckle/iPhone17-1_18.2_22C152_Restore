@interface AAURLSessionSharedCache
@end

@implementation AAURLSessionSharedCache

void ___AAURLSessionSharedCache_block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 32);
  id v2 = objc_alloc(MEMORY[0x1E4F18D78]);
  if (v1) {
    uint64_t v3 = 20971520;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [v2 _initWithMemoryCapacity:0x400000 diskCapacity:v3 relativePath:@"com.apple.AppleAccount"];
  v5 = (void *)_AAURLSessionSharedCache_sharedCache;
  _AAURLSessionSharedCache_sharedCache = v4;

  [(id)_AAURLSessionSharedCache_sharedCache _CFURLCache];
  uint64_t v6 = _CFURLCacheCopyCacheDirectory();
  if (v6)
  {
    v7 = (const void *)v6;
    v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      ___AAURLSessionSharedCache_block_invoke_cold_1();
    }

    CFRelease(v7);
  }
}

void ___AAURLSessionSharedCache_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Using shared cache at path: %{private}@", v2, v3, v4, v5, v6);
}

@end