@interface MLCConvolutionLayer(CoreMLModelSpecification)
+ (id)convolutionLayer:()CoreMLModelSpecification error:;
@end

@implementation MLCConvolutionLayer(CoreMLModelSpecification)

+ (id)convolutionLayer:()CoreMLModelSpecification error:
{
  if (*(void *)(a3 + 112)) {
    v6 = *(uint64_t **)(a3 + 112);
  }
  else {
    v6 = &CoreML::Specification::_WeightParams_default_instance_;
  }
  id v29 = 0;
  v7 = _validateAndGetData((uint64_t)v6, &v29);
  id v8 = v29;
  if (v7)
  {
    if (*(unsigned char *)(a3 + 153))
    {
      if (*(void *)(a3 + 120)) {
        v9 = *(uint64_t **)(a3 + 120);
      }
      else {
        v9 = &CoreML::Specification::_WeightParams_default_instance_;
      }
      id v28 = v8;
      v10 = _validateAndGetData((uint64_t)v9, &v28);
      id v11 = v28;

      if (!v10)
      {
        if (!a4)
        {
          v10 = 0;
          v12 = 0;
          goto LABEL_36;
        }
        v25 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v11 format:@"Failed to construct convolutional layer due to non supported bias type."];
        v10 = 0;
        goto LABEL_32;
      }
      id v8 = v11;
    }
    else
    {
      v10 = 0;
    }
    if (*(int *)(a3 + 16) < 1)
    {
      uint64_t v14 = 3;
      uint64_t v15 = 3;
    }
    else
    {
      uint64_t v13 = *(void *)(a3 + 24);
      uint64_t v14 = *(void *)(v13 + 8);
      uint64_t v15 = *(void *)(v13 + 16);
    }
    if (*(int *)(a3 + 40) < 1)
    {
      uint64_t v17 = 1;
      uint64_t v18 = 1;
    }
    else
    {
      uint64_t v16 = *(void *)(a3 + 48);
      uint64_t v17 = *(void *)(v16 + 8);
      uint64_t v18 = *(void *)(v16 + 16);
    }
    if (*(int *)(a3 + 64) < 1)
    {
      uint64_t v20 = 1;
      uint64_t v21 = 1;
    }
    else
    {
      uint64_t v19 = *(void *)(a3 + 72);
      uint64_t v20 = *(void *)(v19 + 8);
      uint64_t v21 = *(void *)(v19 + 16);
    }
    int v22 = *(_DWORD *)(a3 + 172);
    if (v22)
    {
      BOOL v23 = v22 != 51;
      unint64_t v24 = *(void *)(a3 + 144);
      if (v24 <= 1) {
        unint64_t v24 = 1;
      }
      LODWORD(v27) = v23;
      v12 = +[MLNeuralNetworkMLComputeLayer convolutionalLayerWithKernelHeight:v14 kernelWidth:v15 inputChannels:*(void *)(a3 + 136) outputChannels:*(void *)(a3 + 128) strideInX:v17 strideInY:v18 dilationRateInX:v20 dilationRateInY:v21 nGroups:v24 weight:v7 bias:v10 paddingPolicy:v27];
      goto LABEL_27;
    }
    if (!a4)
    {
      v12 = 0;
LABEL_27:
      id v11 = v8;
LABEL_36:

      id v8 = v11;
      goto LABEL_37;
    }
    v25 = +[MLModelErrorUtils updateErrorWithFormat:@"Convolution padding type not set or not supported", v15];
    id v11 = v8;
LABEL_32:
    v12 = 0;
    *a4 = v25;
    goto LABEL_36;
  }
  if (a4)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v8 format:@"Failed to construct convolutional layer due to non supported weight type."];
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_37:

  return v12;
}

@end