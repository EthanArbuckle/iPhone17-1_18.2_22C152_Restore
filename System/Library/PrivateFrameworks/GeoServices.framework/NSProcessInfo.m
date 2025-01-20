@interface NSProcessInfo
@end

@implementation NSProcessInfo

void __44__NSProcessInfo_GEOExtras__processStartTime__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  int v1 = [v0 processIdentifier];

  *(void *)v6 = 0xE00000001;
  int v7 = 1;
  int v8 = v1;
  memset(v5, 0, 512);
  size_t v4 = 648;
  sysctl(v6, 4u, v5, &v4, 0, 0);
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)*(uint64_t *)&v5[0]];
  v3 = (void *)_MergedGlobals_218;
  _MergedGlobals_218 = v2;
}

void __43__NSProcessInfo_GEOExtras__systemStartTime__block_invoke()
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  [v0 systemUptime];
  uint64_t v2 = [v4 dateByAddingTimeInterval:-v1];
  v3 = (void *)qword_1EB29F8B0;
  qword_1EB29F8B0 = v2;
}

@end