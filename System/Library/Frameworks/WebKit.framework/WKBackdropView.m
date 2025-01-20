@interface WKBackdropView
+ (Class)layerClass;
@end

@implementation WKBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end