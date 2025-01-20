@interface UIFont(UIFont_JFXAdditions)
+ (id)jfx_fontWithName:()UIFont_JFXAdditions;
@end

@implementation UIFont(UIFont_JFXAdditions)

+ (id)jfx_fontWithName:()UIFont_JFXAdditions
{
  v3 = (void *)MEMORY[0x263F1C658];
  id v4 = a3;
  [v3 systemFontSize];
  double v6 = v5;
  if ([v4 hasPrefix:@"."]) {
    objc_msgSend(MEMORY[0x263F1C658], "pv_fontWithName:size:transform:", v4, 0, v6);
  }
  else {
  v7 = [MEMORY[0x263F1C658] fontWithName:v4 size:v6];
  }

  return v7;
}

@end