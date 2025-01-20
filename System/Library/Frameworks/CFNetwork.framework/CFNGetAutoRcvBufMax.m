@interface CFNGetAutoRcvBufMax
@end

@implementation CFNGetAutoRcvBufMax

uint64_t ____CFNGetAutoRcvBufMax_block_invoke()
{
  size_t v3 = 8;
  unint64_t v4 = 0;
  uint64_t result = sysctlbyname("hw.memsize", &v4, &v3, 0, 0);
  if (result) {
    BOOL v1 = 0;
  }
  else {
    BOOL v1 = v3 == 8;
  }
  if (v1)
  {
    uint64_t v2 = 0x200000;
    if (v4 > 0xC0000000) {
      uint64_t v2 = 0x400000;
    }
    __CFNGetAutoRcvBufMax::value = v2;
  }
  return result;
}

@end