@interface DRRequestPassesTailspinHysteresis
@end

@implementation DRRequestPassesTailspinHysteresis

uint64_t ___DRRequestPassesTailspinHysteresis_block_invoke(uint64_t a1)
{
  uint64_t v2 = mach_continuous_time();
  uint64_t result = _doesPassHysteresis(gPreviousAcceptedTailspinRequestMCT, v2, *(double *)(a1 + 40));
  if (result) {
    gPreviousAcceptedTailspinRequestMCT = v2;
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

@end