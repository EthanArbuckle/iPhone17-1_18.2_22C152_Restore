@interface CAMCounterRotatingView
+ (Class)layerClass;
@end

@implementation CAMCounterRotatingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end