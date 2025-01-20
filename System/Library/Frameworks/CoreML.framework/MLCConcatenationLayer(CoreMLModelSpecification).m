@interface MLCConcatenationLayer(CoreMLModelSpecification)
+ (id)concatNDLayer:()CoreMLModelSpecification error:;
@end

@implementation MLCConcatenationLayer(CoreMLModelSpecification)

+ (id)concatNDLayer:()CoreMLModelSpecification error:
{
  if (*(void *)(a3 + 16) == 1)
  {
    v4 = +[MLNeuralNetworkMLComputeLayer concatNDLayerWithAxis:1];
  }
  else if (a4)
  {
    id v6 = +[MLModelErrorUtils errorWithCode:6 format:@"Concatenation along non-channel axis is not supported."];
    v4 = 0;
    *a4 = v6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end