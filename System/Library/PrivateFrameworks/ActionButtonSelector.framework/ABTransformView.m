@interface ABTransformView
+ (Class)layerClass;
- (id)transformLayer;
@end

@implementation ABTransformView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)transformLayer
{
  if (a1)
  {
    a1 = [a1 layer];
    uint64_t v1 = vars8;
  }
  return a1;
}

@end