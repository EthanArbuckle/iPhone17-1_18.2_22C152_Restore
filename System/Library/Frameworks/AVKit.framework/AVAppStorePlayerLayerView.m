@interface AVAppStorePlayerLayerView
+ (Class)layerClass;
@end

@implementation AVAppStorePlayerLayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end