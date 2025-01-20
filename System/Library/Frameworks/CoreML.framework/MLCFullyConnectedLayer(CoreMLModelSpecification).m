@interface MLCFullyConnectedLayer(CoreMLModelSpecification)
+ (id)innerProductLayer:()CoreMLModelSpecification error:;
+ (id)innerProductLayerWithBatchedMatMulParams:()CoreMLModelSpecification error:;
@end

@implementation MLCFullyConnectedLayer(CoreMLModelSpecification)

+ (id)innerProductLayerWithBatchedMatMulParams:()CoreMLModelSpecification error:
{
  uint64_t v6 = *(void *)(a3 + 32);
  uint64_t v7 = *(void *)(a3 + 40);
  if (*(void *)(a3 + 16)) {
    v8 = *(uint64_t **)(a3 + 16);
  }
  else {
    v8 = &CoreML::Specification::_WeightParams_default_instance_;
  }
  id v18 = 0;
  v9 = _validateAndGetData((uint64_t)v8, &v18);
  id v10 = v18;
  if (v9)
  {
    if (*(unsigned char *)(a3 + 50))
    {
      if (*(void *)(a3 + 24)) {
        v11 = *(uint64_t **)(a3 + 24);
      }
      else {
        v11 = &CoreML::Specification::_WeightParams_default_instance_;
      }
      id v17 = v10;
      uint64_t v12 = _validateAndGetData((uint64_t)v11, &v17);
      id v13 = v17;

      if (!v12)
      {
        if (a4)
        {
          +[MLModelErrorUtils errorWithCode:6 underlyingError:v13 format:@"Failed to construct innerProduct layer from batchedMatMulLayer Params due to non supported bias type."];
          v15 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        id v10 = v13;
        goto LABEL_20;
      }
      id v10 = v13;
      v14 = (void *)v12;
    }
    else
    {
      v14 = 0;
    }
    v15 = +[MLNeuralNetworkMLComputeLayer fullyConnectedLayerWithKernelWidth:1 kernelHeight:1 inputChannels:v6 outputChannels:v7 weight:v9 bias:v14];
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v10 format:@"Failed to construct innerProduct layer from batchedMatMulLayer Params due to non supported weight type."];
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_20:

  return v15;
}

+ (id)innerProductLayer:()CoreMLModelSpecification error:
{
  if (*(void *)(a3 + 16)) {
    uint64_t v6 = *(uint64_t **)(a3 + 16);
  }
  else {
    uint64_t v6 = &CoreML::Specification::_WeightParams_default_instance_;
  }
  id v16 = 0;
  uint64_t v7 = _validateAndGetData((uint64_t)v6, &v16);
  id v8 = v16;
  if (v7)
  {
    if (*(unsigned char *)(a3 + 48))
    {
      if (*(void *)(a3 + 24)) {
        v9 = *(uint64_t **)(a3 + 24);
      }
      else {
        v9 = &CoreML::Specification::_WeightParams_default_instance_;
      }
      id v15 = v8;
      uint64_t v10 = _validateAndGetData((uint64_t)v9, &v15);
      id v11 = v15;

      if (!v10)
      {
        if (a4)
        {
          +[MLModelErrorUtils errorWithCode:6 underlyingError:v11 format:@"Failed to construct innerproduct layer due to non supported bias type."];
          id v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v13 = 0;
        }
        id v8 = v11;
        goto LABEL_20;
      }
      id v8 = v11;
      uint64_t v12 = (void *)v10;
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v13 = +[MLNeuralNetworkMLComputeLayer fullyConnectedLayerWithKernelWidth:1 kernelHeight:1 inputChannels:*(void *)(a3 + 32) outputChannels:*(void *)(a3 + 40) weight:v7 bias:v12];
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v8 format:@"Failed to construct innerproduct layer due to non supported weight type."];
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
LABEL_20:

  return v13;
}

@end