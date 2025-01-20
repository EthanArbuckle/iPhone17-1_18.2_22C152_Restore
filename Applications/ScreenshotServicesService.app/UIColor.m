@interface UIColor
+ (id)sss_dittoBackgroundColor;
+ (id)sss_miniatureBorderColor;
@end

@implementation UIColor

+ (id)sss_miniatureBorderColor
{
  return +[UIColor whiteColor];
}

+ (id)sss_dittoBackgroundColor
{
  return +[UIColor colorWithWhite:0.9 alpha:1.0];
}

@end