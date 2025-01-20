@interface MKPlaceCompactCollectionOverlayView
+ (Class)layerClass;
@end

@implementation MKPlaceCompactCollectionOverlayView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end