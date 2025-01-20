@interface DRRequestResetTailspinHysteresis
@end

@implementation DRRequestResetTailspinHysteresis

void ___DRRequestResetTailspinHysteresis_block_invoke()
{
  gPreviousAcceptedTailspinRequestMCT = 0;
}

@end