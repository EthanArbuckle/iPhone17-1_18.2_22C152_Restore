@interface UIColor(GKDashboardUtils)
+ (uint64_t)_gkSelectedCellBackgroundColor;
+ (uint64_t)_gkSpeechViewTintColor;
+ (uint64_t)_gkvisualEffectTintColor;
@end

@implementation UIColor(GKDashboardUtils)

+ (uint64_t)_gkSelectedCellBackgroundColor
{
  return [MEMORY[0x1E4FB1618] quaternaryLabelColor];
}

+ (uint64_t)_gkSpeechViewTintColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (uint64_t)_gkvisualEffectTintColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.8 green:0.82 blue:0.84 alpha:0.05];
}

@end