@interface UIColor
+ (id)rpccui_colorForActivity:(id)a3;
@end

@implementation UIColor

+ (id)rpccui_colorForActivity:(id)a3
{
  v3 = [a3 activityColorName];
  SEL v4 = NSSelectorFromString(v3);

  if (objc_opt_respondsToSelector()) {
    id v5 = +[UIColor performSelector:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end