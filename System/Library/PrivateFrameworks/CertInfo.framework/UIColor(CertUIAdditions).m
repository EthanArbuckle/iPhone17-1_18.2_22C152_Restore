@interface UIColor(CertUIAdditions)
+ (uint64_t)CertUIVerifiedColor;
@end

@implementation UIColor(CertUIAdditions)

+ (uint64_t)CertUIVerifiedColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.8 blue:0.278431373 alpha:1.0];
}

@end