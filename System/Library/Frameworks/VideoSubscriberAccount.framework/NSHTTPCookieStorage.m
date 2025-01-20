@interface NSHTTPCookieStorage
@end

@implementation NSHTTPCookieStorage

uint64_t __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke()
{
  vs_sharedCookieStorage___vs_lazy_init_variable = __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

id __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke_2()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
  uint64_t v9 = 0;
  v1 = (const char *)container_system_group_path_for_identifier();
  if (v1)
  {
    v2 = (void *)[[NSString alloc] initWithBytesNoCopy:v1 length:strlen(v1) encoding:4 freeWhenDone:1];
    v3 = [v2 stringByAppendingPathComponent:@"Library"];

    v4 = [v3 stringByAppendingPathComponent:@"Caches"];

    v5 = [v4 stringByAppendingPathComponent:@"VSSharedCookies.binarycookies"];

    v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Using cookie storage %@", buf, 0xCu);
    }

    if (v5)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D18] _csff:v5];

      v0 = (void *)v7;
    }
  }
  else
  {
    v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke_2_cold_1(&v9, v5);
    }
  }

  if (!v0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The sharedCookieStorage parameter must not be nil."];
  }

  return v0;
}

void __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithUnsignedLongLong:*a1];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error obtaining system group path: %@", (uint8_t *)&v4, 0xCu);
}

@end