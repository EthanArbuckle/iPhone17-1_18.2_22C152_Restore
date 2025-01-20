@interface FFDefaultBuildVersionGetter
- (id)getBuildVersion;
@end

@implementation FFDefaultBuildVersionGetter

- (id)getBuildVersion
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  size_t v4 = 256;
  sysctlbyname("kern.osversion", v5, &v4, 0, 0);
  v2 = [NSString stringWithCString:v5 encoding:1];
  return v2;
}

@end