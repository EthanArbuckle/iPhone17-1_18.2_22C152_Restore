@interface ABAntialiasedImageView
+ (Class)layerClass;
@end

@implementation ABAntialiasedImageView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end