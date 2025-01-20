@interface WKTransformView
+ (Class)layerClass;
@end

@implementation WKTransformView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end