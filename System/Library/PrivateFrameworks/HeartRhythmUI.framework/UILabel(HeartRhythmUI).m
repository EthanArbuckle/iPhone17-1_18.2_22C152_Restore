@interface UILabel(HeartRhythmUI)
+ (id)hrui_fontAdjustingLabel;
@end

@implementation UILabel(HeartRhythmUI)

+ (id)hrui_fontAdjustingLabel
{
  id v0 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setAdjustsFontForContentSizeCategory:1];
  [v0 setNumberOfLines:0];
  return v0;
}

@end