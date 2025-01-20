@interface _AVSimplePlayerLayerView
+ (Class)layerClass;
+ (id)keyPathsForValuesAffectingPlayerLayer;
@end

@implementation _AVSimplePlayerLayerView

+ (id)keyPathsForValuesAffectingPlayerLayer
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"layer", 0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end