@interface HKGradient(HeartRhythmUI)
+ (id)hrui_resultsSeparatorGradient;
@end

@implementation HKGradient(HeartRhythmUI)

+ (id)hrui_resultsSeparatorGradient
{
  v0 = [MEMORY[0x263F1C550] whiteColor];
  v1 = [MEMORY[0x263F1C550] colorWithRed:0.949019611 green:0.949019611 blue:0.949019611 alpha:1.0];
  v2 = (void *)[objc_alloc(MEMORY[0x263F46770]) initWithTopColor:v0 bottomColor:v1];

  return v2;
}

@end