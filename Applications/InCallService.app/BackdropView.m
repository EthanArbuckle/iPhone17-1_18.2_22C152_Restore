@interface BackdropView
+ (Class)layerClass;
@end

@implementation BackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end