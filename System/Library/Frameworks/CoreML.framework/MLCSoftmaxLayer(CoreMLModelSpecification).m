@interface MLCSoftmaxLayer(CoreMLModelSpecification)
+ (id)softmax;
@end

@implementation MLCSoftmaxLayer(CoreMLModelSpecification)

+ (id)softmax
{
  return +[MLNeuralNetworkMLComputeLayer softmax];
}

@end