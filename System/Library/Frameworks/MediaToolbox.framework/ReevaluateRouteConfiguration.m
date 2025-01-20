@interface ReevaluateRouteConfiguration
@end

@implementation ReevaluateRouteConfiguration

uint64_t __playerairplay_ReevaluateRouteConfiguration_block_invoke(uint64_t a1)
{
  uint64_t result = pap_AirPlayState(*(const void **)(a1 + 40));
  if (result) {
    BOOL v3 = result == 10;
  }
  else {
    BOOL v3 = 1;
  }
  char v4 = !v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

@end