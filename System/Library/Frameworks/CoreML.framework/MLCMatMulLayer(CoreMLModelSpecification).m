@interface MLCMatMulLayer(CoreMLModelSpecification)
+ (id)matrixMultiplicationLayerUsingParameters:()CoreMLModelSpecification;
@end

@implementation MLCMatMulLayer(CoreMLModelSpecification)

+ (id)matrixMultiplicationLayerUsingParameters:()CoreMLModelSpecification
{
  return +[MLNeuralNetworkMLComputeLayer matMulLayerWithTransposesX:*(unsigned __int8 *)(a3 + 48) transposesY:*(unsigned __int8 *)(a3 + 49)];
}

@end