@interface UIColor(DMCProfilesUI)
+ (uint64_t)DMCProfileRedColor;
+ (uint64_t)DMCProfileSecondaryLabelColor;
+ (uint64_t)DMCProfileVerifiedColor;
@end

@implementation UIColor(DMCProfilesUI)

+ (uint64_t)DMCProfileVerifiedColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.8 blue:0.278431373 alpha:1.0];
}

+ (uint64_t)DMCProfileRedColor
{
  return [MEMORY[0x263F1C550] systemRedColor];
}

+ (uint64_t)DMCProfileSecondaryLabelColor
{
  return [MEMORY[0x263F1C550] secondaryLabelColor];
}

@end