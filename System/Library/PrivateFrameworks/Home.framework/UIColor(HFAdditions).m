@interface UIColor(HFAdditions)
+ (id)hf_homePodControlCellBackgroundColor;
+ (uint64_t)hf_alarmAndTimerControlCellSecondaryColor;
+ (uint64_t)hf_keyColor;
+ (uint64_t)hf_mediaPlatterBackgroundColor;
+ (uint64_t)hf_quickControlBackgroundGrayColor;
- (BOOL)isEqualToColor:()HFAdditions;
@end

@implementation UIColor(HFAdditions)

+ (uint64_t)hf_keyColor
{
  return [MEMORY[0x263F1C550] systemOrangeColor];
}

+ (uint64_t)hf_mediaPlatterBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0941176471 alpha:0.04];
}

+ (uint64_t)hf_quickControlBackgroundGrayColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
}

+ (id)hf_homePodControlCellBackgroundColor
{
  if (+[HFUtilities shouldUseControlCenterMaterials])
  {
    v0 = [MEMORY[0x263F1C550] clearColor];
  }
  else
  {
    v1 = [MEMORY[0x263F1C920] mainScreen];
    v2 = [v1 traitCollection];
    uint64_t v3 = [v2 userInterfaceStyle];

    if (v3 == 2) {
      [MEMORY[0x263F1C550] colorWithWhite:0.15 alpha:1.0];
    }
    else {
    v0 = [MEMORY[0x263F1C550] systemGroupedBackgroundColor];
    }
  }
  return v0;
}

+ (uint64_t)hf_alarmAndTimerControlCellSecondaryColor
{
  return [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.2];
}

- (BOOL)isEqualToColor:()HFAdditions
{
  double v12 = 0.0;
  double v13 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  id v4 = a3;
  [a1 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];
  [v4 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];

  return vabdd_f64(v13, v9) < 0.00000011920929
      && vabdd_f64(v12, v8) < 0.00000011920929
      && vabdd_f64(v11, v7) < 0.00000011920929
      && vabdd_f64(v10, v6) < 0.00000011920929;
}

@end