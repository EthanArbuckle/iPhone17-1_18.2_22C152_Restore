@interface _GCControllerShapeView
+ (Class)layerClass;
@end

@implementation _GCControllerShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end