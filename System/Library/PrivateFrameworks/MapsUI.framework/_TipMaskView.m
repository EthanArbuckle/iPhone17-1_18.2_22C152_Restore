@interface _TipMaskView
+ (Class)layerClass;
@end

@implementation _TipMaskView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end