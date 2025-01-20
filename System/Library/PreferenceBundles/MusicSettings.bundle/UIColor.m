@interface UIColor
+ (id)musicTintColor;
@end

@implementation UIColor

+ (id)musicTintColor
{
  return +[UIColor colorWithDynamicProvider:&stru_18BD0];
}

@end