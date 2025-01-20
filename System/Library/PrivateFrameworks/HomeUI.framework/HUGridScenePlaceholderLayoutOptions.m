@interface HUGridScenePlaceholderLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
@end

@implementation HUGridScenePlaceholderLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HUGridScenePlaceholderLayoutOptions;
  v3 = objc_msgSendSuper2(&v8, sel_defaultOptionsForCellSizeSubclass_, a3);
  if (!+[HUGraphicsUtilities shouldReduceVisualEffects])
  {
    v4 = (void *)MEMORY[0x1E4F42FE8];
    v5 = [MEMORY[0x1E4F427D8] effectWithStyle:16];
    v6 = [v4 effectForBlurEffect:v5 style:0];
    [v3 setVibrancyEffect:v6];
  }

  return v3;
}

@end