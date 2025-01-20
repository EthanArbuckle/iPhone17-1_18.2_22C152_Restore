@interface BCVSUtilities
+ (id)classBundle;
@end

@implementation BCVSUtilities

+ (id)classBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

@end