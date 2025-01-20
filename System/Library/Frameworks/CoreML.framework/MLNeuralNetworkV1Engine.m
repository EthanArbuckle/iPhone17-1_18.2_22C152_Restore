@interface MLNeuralNetworkV1Engine
+ (Class)containerClass;
@end

@implementation MLNeuralNetworkV1Engine

+ (Class)containerClass
{
  return (Class)objc_opt_class();
}

@end