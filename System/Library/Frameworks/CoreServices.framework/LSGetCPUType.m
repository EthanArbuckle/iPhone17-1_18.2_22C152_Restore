@interface LSGetCPUType
@end

@implementation LSGetCPUType

uint64_t ___LSGetCPUType_block_invoke()
{
  int v3 = 0;
  size_t v2 = 4;
  uint64_t result = sysctlbyname("hw.cputype", &v3, &v2, 0, 0);
  if (!result)
  {
    int v1 = v3;
    if (v3 == 7) {
      int v1 = 16777223;
    }
    _LSGetCPUType::type = v1;
  }
  return result;
}

@end