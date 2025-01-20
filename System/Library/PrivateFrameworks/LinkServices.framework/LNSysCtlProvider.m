@interface LNSysCtlProvider
+ (id)bootUUID;
+ (id)runningProcessIDs;
@end

@implementation LNSysCtlProvider

+ (id)runningProcessIDs
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  *(_OWORD *)v10 = xmmword_1A45048B8;
  uint64_t v11 = 0;
  size_t size = 0;
  v3 = 0;
  if (!sysctl(v10, 3u, 0, &size, 0, 0))
  {
    v4 = (unsigned int *)malloc_type_malloc(size, 0xB6B21148uLL);
    if (sysctl(v10, 3u, v4, &size, 0, 0))
    {
      free(v4);
      v3 = 0;
    }
    else
    {
      if (size >= 0x288)
      {
        size_t v5 = size / 0x288;
        v6 = v4 + 10;
        do
        {
          v7 = [MEMORY[0x1E4F28ED0] numberWithInt:*v6];
          [v2 addObject:v7];

          v6 += 162;
          --v5;
        }
        while (v5);
      }
      free(v4);
      v3 = (void *)[v2 copy];
    }
  }

  return v3;
}

+ (id)bootUUID
{
  if (bootUUID_onceToken != -1) {
    dispatch_once(&bootUUID_onceToken, &__block_literal_global_2112);
  }
  v2 = (void *)bootUUID_bootUUID;
  return v2;
}

void __28__LNSysCtlProvider_bootUUID__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)in = 0u;
  memset(v5, 0, sizeof(v5));
  size_t v2 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", in, &v2, 0, 0))
  {
    if (v2 != 37) {
      __assert_rtn("+[LNSysCtlProvider bootUUID]_block_invoke", "LNSysCtlProvider.m", 23, "len == sizeof(uuidString)");
    }
    memset(uu, 0, sizeof(uu));
    if (!uuid_parse(in, uu))
    {
      uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
      v1 = (void *)bootUUID_bootUUID;
      bootUUID_bootUUID = v0;
    }
  }
}

@end