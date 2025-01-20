@interface MLCBatchNormalizationLayer(CoreMLModelSpecification)
+ (id)batchNormLayer:()CoreMLModelSpecification error:;
@end

@implementation MLCBatchNormalizationLayer(CoreMLModelSpecification)

+ (id)batchNormLayer:()CoreMLModelSpecification error:
{
  if (*(void *)(a3 + 16)) {
    v6 = *(const CoreML::Specification::WeightParams **)(a3 + 16);
  }
  else {
    v6 = (const CoreML::Specification::WeightParams *)&CoreML::Specification::_WeightParams_default_instance_;
  }
  CoreML::Specification::WeightParams::WeightParams((CoreML::Specification::WeightParams *)v31, v6);
  if (*(void *)(a3 + 24)) {
    v7 = *(const CoreML::Specification::WeightParams **)(a3 + 24);
  }
  else {
    v7 = (const CoreML::Specification::WeightParams *)&CoreML::Specification::_WeightParams_default_instance_;
  }
  CoreML::Specification::WeightParams::WeightParams((CoreML::Specification::WeightParams *)v30, v7);
  if (*(void *)(a3 + 32)) {
    v8 = *(const CoreML::Specification::WeightParams **)(a3 + 32);
  }
  else {
    v8 = (const CoreML::Specification::WeightParams *)&CoreML::Specification::_WeightParams_default_instance_;
  }
  CoreML::Specification::WeightParams::WeightParams((CoreML::Specification::WeightParams *)v29, v8);
  if (*(void *)(a3 + 40)) {
    v9 = *(const CoreML::Specification::WeightParams **)(a3 + 40);
  }
  else {
    v9 = (const CoreML::Specification::WeightParams *)&CoreML::Specification::_WeightParams_default_instance_;
  }
  CoreML::Specification::WeightParams::WeightParams((CoreML::Specification::WeightParams *)v28, v9);
  if (*(void *)(a3 + 16)) {
    v10 = *(uint64_t **)(a3 + 16);
  }
  else {
    v10 = &CoreML::Specification::_WeightParams_default_instance_;
  }
  id v27 = 0;
  v11 = _validateAndGetData((uint64_t)v10, &v27);
  id v12 = v27;
  if (v11)
  {
    if (*(void *)(a3 + 24)) {
      v13 = *(uint64_t **)(a3 + 24);
    }
    else {
      v13 = &CoreML::Specification::_WeightParams_default_instance_;
    }
    id v26 = v12;
    v14 = _validateAndGetData((uint64_t)v13, &v26);
    id v15 = v26;

    if (v14)
    {
      if (*(void *)(a3 + 32)) {
        v16 = *(uint64_t **)(a3 + 32);
      }
      else {
        v16 = &CoreML::Specification::_WeightParams_default_instance_;
      }
      id v25 = v15;
      v17 = _validateAndGetData((uint64_t)v16, &v25);
      id v18 = v25;

      if (v17)
      {
        if (*(void *)(a3 + 40)) {
          v19 = *(uint64_t **)(a3 + 40);
        }
        else {
          v19 = &CoreML::Specification::_WeightParams_default_instance_;
        }
        id v24 = v18;
        v20 = _validateAndGetData((uint64_t)v19, &v24);
        id v15 = v24;

        if (v20)
        {
          LODWORD(v21) = *(_DWORD *)(a3 + 60);
          v22 = +[MLNeuralNetworkMLComputeLayer batchNormLayerWithFeatureChannels:*(void *)(a3 + 48) varianceEpsilon:v11 gamma:v14 beta:v17 mean:v20 variance:v21];
        }
        else if (a4)
        {
          +[MLModelErrorUtils errorWithCode:6 underlyingError:v15 format:@"Failed to construct batchnorm layer due to non supported variance weight type."];
          v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
      }
      else
      {
        if (a4)
        {
          +[MLModelErrorUtils errorWithCode:6 underlyingError:v18 format:@"Failed to construct batchnorm layer due to non supported mean weight type."];
          v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        id v15 = v18;
      }
    }
    else if (a4)
    {
      +[MLModelErrorUtils errorWithCode:6 underlyingError:v15 format:@"Failed to construct batchnorm layer due to non supported beta weight type."];
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

    id v12 = v15;
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v12 format:@"Failed to construct batchnorm layer due to non supported gamma weight type."];
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  CoreML::Specification::WeightParams::~WeightParams((CoreML::Specification::WeightParams *)v28);
  CoreML::Specification::WeightParams::~WeightParams((CoreML::Specification::WeightParams *)v29);
  CoreML::Specification::WeightParams::~WeightParams((CoreML::Specification::WeightParams *)v30);
  CoreML::Specification::WeightParams::~WeightParams((CoreML::Specification::WeightParams *)v31);

  return v22;
}

@end