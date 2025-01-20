@interface CARGetMinimumScaleForProposedScaleForScreenInfo
@end

@implementation CARGetMinimumScaleForProposedScaleForScreenInfo

void ___CARGetMinimumScaleForProposedScaleForScreenInfo_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  [v9 safeFrame];
  if (v6 < 1122.0) {
    goto LABEL_5;
  }
  [v9 safeFrame];
  double v7 = 2.0;
  if (v8 >= 684.0) {
    double v7 = 3.0;
  }
  if (v7 < 3.0)
  {
LABEL_5:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0x40000000;
    *a4 = 1;
  }
}

@end