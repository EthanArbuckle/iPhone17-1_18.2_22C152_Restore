@interface MLCPoolingLayer(CoreMLModelSpecification)
+ (id)poolingLayer:()CoreMLModelSpecification error:;
@end

@implementation MLCPoolingLayer(CoreMLModelSpecification)

+ (id)poolingLayer:()CoreMLModelSpecification error:
{
  if (*(int *)(a3 + 16) < 1)
  {
    uint64_t v11 = 3;
    uint64_t v10 = 3;
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 24);
    uint64_t v11 = *(void *)(v9 + 8);
    uint64_t v10 = *(void *)(v9 + 16);
  }
  if (*(int *)(a3 + 40) < 1)
  {
    uint64_t v13 = 1;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v12 = *(void *)(a3 + 48);
    uint64_t v13 = *(void *)(v12 + 8);
    uint64_t v14 = *(void *)(v12 + 16);
  }
  int v15 = *(_DWORD *)(a3 + 60);
  if (v15 == 1) {
    unsigned int v16 = 2;
  }
  else {
    unsigned int v16 = 1;
  }
  if (v15 == 2) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = v16;
  }
  int v18 = *(_DWORD *)(a3 + 84);
  if (!v18 || v18 == 32)
  {
    id v20 = +[MLModelErrorUtils updateErrorWithFormat:@"Convolution padding type not set or not supported", v11, v13, v14, a7, v17];
    v19 = 0;
    *a4 = v20;
  }
  else
  {
    v19 = +[MLNeuralNetworkMLComputeLayer poolingLayerWithKernelWidth:v10 kernelHeight:v11 strideInX:v13 strideInY:v14 paddingPolicy:v18 != 31 poolingType:v17];
  }

  return v19;
}

@end