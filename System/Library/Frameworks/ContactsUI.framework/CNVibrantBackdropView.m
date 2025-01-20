@interface CNVibrantBackdropView
+ (Class)layerClass;
@end

@implementation CNVibrantBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end