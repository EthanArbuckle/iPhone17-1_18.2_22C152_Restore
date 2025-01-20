@interface UIView(MPUAdditions)
- (uint64_t)MPU_applyBoundsAndCenterForUntransformedFrame:()MPUAdditions;
@end

@implementation UIView(MPUAdditions)

- (uint64_t)MPU_applyBoundsAndCenterForUntransformedFrame:()MPUAdditions
{
  objc_msgSend(a1, "setBounds:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8));
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  double MidX = CGRectGetMidX(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  double MidY = CGRectGetMidY(v15);

  return objc_msgSend(a1, "setCenter:", MidX, MidY);
}

@end