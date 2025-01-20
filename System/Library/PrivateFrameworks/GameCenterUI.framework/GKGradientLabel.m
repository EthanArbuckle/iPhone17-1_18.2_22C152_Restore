@interface GKGradientLabel
+ (Class)layerClass;
@end

@implementation GKGradientLabel

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end