@interface _AVKitBundle
+ (id)bundle;
@end

@implementation _AVKitBundle

+ (id)bundle
{
  return (id)[MEMORY[0x1E4F28B50] bundleForClass:a1];
}

@end