@interface MLCActivationLayer(CoreMLModelSpecification)
+ (id)activationLayer:()CoreMLModelSpecification;
+ (id)clampedReluLayer:()CoreMLModelSpecification error:;
+ (id)leakyRelu;
+ (id)relu;
+ (id)sigmoid;
@end

@implementation MLCActivationLayer(CoreMLModelSpecification)

+ (id)sigmoid
{
  return +[MLNeuralNetworkMLComputeLayer sigmoid];
}

+ (id)leakyRelu
{
  return +[MLNeuralNetworkMLComputeLayer leakyRelu];
}

+ (id)relu
{
  return +[MLNeuralNetworkMLComputeLayer relu];
}

+ (id)clampedReluLayer:()CoreMLModelSpecification error:
{
  LODWORD(a1) = *(_DWORD *)(a5 + 16);
  LODWORD(a2) = *(_DWORD *)(a5 + 20);
  return +[MLNeuralNetworkMLComputeLayer reluNLayerWithAlpha:a1 beta:a2];
}

+ (id)activationLayer:()CoreMLModelSpecification
{
  int v3 = *(_DWORD *)(a3 + 28);
  switch(v3)
  {
    case 40:
      v4 = +[MLNeuralNetworkMLComputeLayer sigmoid];
      break;
    case 15:
      v4 = +[MLNeuralNetworkMLComputeLayer leakyRelu];
      break;
    case 10:
      v4 = +[MLNeuralNetworkMLComputeLayer relu];
      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

@end