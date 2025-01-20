@interface VNDetectionprintMLFeatureProvider
+ (id)VNDetectionprintTensorKeyForFeatureName:(id)a3;
- (NSSet)featureNames;
- (VNDetectionprintMLFeatureProvider)initWithDetectionprint:(id)a3 featureDescriptions:(id)a4 originalFeatureProvider:(id)a5;
- (id)featureValueForName:(id)a3;
@end

@implementation VNDetectionprintMLFeatureProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFeatureProvider, 0);
  objc_storeStrong((id *)&self->_detectionprintFeatureDescriptions, 0);

  objc_storeStrong((id *)&self->_detectionprint, 0);
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_detectionprintFeatureDescriptions objectForKey:v4];
  if (v5)
  {
    v6 = [(id)objc_opt_class() VNDetectionprintTensorKeyForFeatureName:v4];
    if (v6)
    {
      detectionprint = self->_detectionprint;
      id v32 = 0;
      v8 = [(VNDetectionprint *)detectionprint tensorForKey:v6 error:&v32];
      id v9 = v32;
      if (v8)
      {
        v10 = [v5 multiArrayConstraint];
        id v31 = 0;
        v11 = [v8 VNEspressoModelImageprintMLMultiArrayWithConstraint:v10 error:&v31];
        id v12 = v31;

        if (v11)
        {
          v13 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v11];
        }
        else
        {
          id v21 = [v5 description];
          uint64_t v22 = [v21 UTF8String];
          id v23 = [v12 localizedDescription];
          [v23 UTF8String];
          VNValidatedLog(4, @"Unable to create detectionprint %s - %s", v24, v25, v26, v27, v28, v29, v22);

          v13 = 0;
        }
      }
      else
      {
        uint64_t v14 = [v6 UTF8String];
        id v12 = [v9 localizedDescription];
        [v12 UTF8String];
        VNValidatedLog(4, @"Unable to obtain detection print tensor %s - %s", v15, v16, v17, v18, v19, v20, v14);
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = [(MLFeatureProvider *)self->_originalFeatureProvider featureValueForName:v4];
  }

  return v13;
}

- (NSSet)featureNames
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v4 = [(NSDictionary *)self->_detectionprintFeatureDescriptions allKeys];
  v5 = (void *)[v3 initWithArray:v4];

  originalFeatureProvider = self->_originalFeatureProvider;
  if (originalFeatureProvider)
  {
    v7 = [(MLFeatureProvider *)originalFeatureProvider featureNames];
    [v5 unionSet:v7];
  }

  return (NSSet *)v5;
}

- (VNDetectionprintMLFeatureProvider)initWithDetectionprint:(id)a3 featureDescriptions:(id)a4 originalFeatureProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VNDetectionprintMLFeatureProvider;
  id v12 = [(VNDetectionprintMLFeatureProvider *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_detectionprint, a3);
    uint64_t v14 = [v10 copy];
    detectionprintFeatureDescriptions = v13->_detectionprintFeatureDescriptions;
    v13->_detectionprintFeatureDescriptions = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_originalFeatureProvider, a5);
  }

  return v13;
}

+ (id)VNDetectionprintTensorKeyForFeatureName:(id)a3
{
  id v3 = a3;
  if (+[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::onceToken != -1) {
    dispatch_once(&+[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::onceToken, &__block_literal_global_127);
  }
  id v4 = [(id)+[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::tensorKeyForFeatureName objectForKey:v3];

  return v4;
}

void __77__VNDetectionprintMLFeatureProvider_VNDetectionprintTensorKeyForFeatureName___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"mixed2";
  v2[1] = @"mixed6";
  v3[0] = @"VNDetectionprintTensorKeyMixed2";
  v3[1] = @"VNDetectionprintTensorKeyMixed6";
  v2[2] = @"stride8Feature";
  v2[3] = @"stride16Feature";
  v3[2] = @"VNDetectionprintTensorKeyStride8FeatureMap";
  v3[3] = @"VNDetectionprintTensorKeyStride16FeatureMap";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)+[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::tensorKeyForFeatureName;
  +[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::tensorKeyForFeatureName = v0;
}

@end