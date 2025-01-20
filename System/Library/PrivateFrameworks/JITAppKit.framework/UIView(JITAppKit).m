@interface UIView(JITAppKit)
+ (id)jitappkit:()JITAppKit;
@end

@implementation UIView(JITAppKit)

+ (id)jitappkit:()JITAppKit
{
  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v4 = +[TKApplication shared];
  id v5 = (id)[v4 loadView:location[0]];

  objc_storeStrong(location, 0);
  return v5;
}

@end