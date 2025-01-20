@interface MLCLossLayer(CoreMLModelSpecification)
+ (id)categoricalCrossEntropyWithLossLayerParams:()CoreMLModelSpecification numberOfClasses:;
+ (id)meanSquaredErrorWithLossLayerParams:()CoreMLModelSpecification;
@end

@implementation MLCLossLayer(CoreMLModelSpecification)

+ (id)meanSquaredErrorWithLossLayerParams:()CoreMLModelSpecification
{
  return +[MLNeuralNetworkMLComputeLayer meanSquaredErrorLoss];
}

+ (id)categoricalCrossEntropyWithLossLayerParams:()CoreMLModelSpecification numberOfClasses:
{
  return +[MLNeuralNetworkMLComputeLayer categoricalCrossEntropyLossWithNumberOfClasses:a4];
}

@end