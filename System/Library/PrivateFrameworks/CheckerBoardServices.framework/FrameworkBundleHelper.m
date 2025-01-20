@interface FrameworkBundleHelper
+ (id)getBundle;
@end

@implementation FrameworkBundleHelper

+ (id)getBundle
{
  return (id)[MEMORY[0x263F086E0] bundleForClass:a1];
}

@end