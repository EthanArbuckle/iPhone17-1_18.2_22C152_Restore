@interface NSBundle
+ (id)hw_handwritingPluginBundle;
@end

@implementation NSBundle

+ (id)hw_handwritingPluginBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

@end