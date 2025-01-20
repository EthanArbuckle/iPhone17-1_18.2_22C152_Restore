@interface UILabel(HKAdditions)
+ (id)hk_fontAdjustingLabel;
@end

@implementation UILabel(HKAdditions)

+ (id)hk_fontAdjustingLabel
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setAdjustsFontForContentSizeCategory:1];
  [v0 setNumberOfLines:0];
  return v0;
}

@end