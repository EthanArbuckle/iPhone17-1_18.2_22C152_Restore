@interface UIColor(AVAdditions)
+ (id)AV_indicatorBackgroundColor;
+ (id)AV_indicatorForegroundColor;
+ (id)avkit_tintColorForControlElementIsOverVideo:()AVAdditions withUserInterfaceStyle:;
+ (uint64_t)avkit_liveContentAccessoryViewColor;
@end

@implementation UIColor(AVAdditions)

+ (uint64_t)avkit_liveContentAccessoryViewColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.99609375 green:0.17578125 blue:0.33203125 alpha:1.0];
}

+ (id)avkit_tintColorForControlElementIsOverVideo:()AVAdditions withUserInterfaceStyle:
{
  if (a4 != 1 || a3)
  {
    v4 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }

  return v4;
}

+ (id)AV_indicatorForegroundColor
{
  if (AV_indicatorForegroundColor_onceToken != -1) {
    dispatch_once(&AV_indicatorForegroundColor_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)AV_indicatorForegroundColor__indicatorForegroundColor;

  return v0;
}

+ (id)AV_indicatorBackgroundColor
{
  if (AV_indicatorBackgroundColor_onceToken != -1) {
    dispatch_once(&AV_indicatorBackgroundColor_onceToken, &__block_literal_global_12096);
  }
  v0 = (void *)AV_indicatorBackgroundColor__indicatorBackgroundColor;

  return v0;
}

@end