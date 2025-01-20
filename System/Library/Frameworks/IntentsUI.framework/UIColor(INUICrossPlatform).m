@interface UIColor(INUICrossPlatform)
+ (uint64_t)_inui_colorNamed:()INUICrossPlatform bundle:;
@end

@implementation UIColor(INUICrossPlatform)

+ (uint64_t)_inui_colorNamed:()INUICrossPlatform bundle:
{
  return [a1 colorNamed:a3 inBundle:a4 compatibleWithTraitCollection:0];
}

@end