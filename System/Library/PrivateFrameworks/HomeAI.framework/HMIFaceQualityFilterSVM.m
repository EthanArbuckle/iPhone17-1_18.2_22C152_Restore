@interface HMIFaceQualityFilterSVM
+ (id)dataScalerInputName;
+ (id)dataScalerOutputName;
+ (id)defaultAestheticQualityDataScalerPath;
+ (id)defaultAestheticQualityModelPath;
+ (id)defaultRecognizabilityDataScalerPath;
+ (id)defaultRecognizabilityModelPath;
+ (id)modelPathForResource:(id)a3;
+ (id)svmInputName;
+ (id)svmOutputName;
- (BOOL)predict:(id)a3 output:(double *)a4 error:(id *)a5;
- (HMIFaceQualityFilterSVM)initWithModelPath:(id)a3 dataScalerPath:(id)a4 error:(id *)a5;
- (MLModel)mlModel;
- (MLModel)scalerModel;
@end

@implementation HMIFaceQualityFilterSVM

+ (id)dataScalerInputName
{
  return @"input";
}

+ (id)dataScalerOutputName
{
  return @"transformed_features";
}

+ (id)svmInputName
{
  return @"input";
}

+ (id)svmOutputName
{
  return @"classProbability";
}

- (HMIFaceQualityFilterSVM)initWithModelPath:(id)a3 dataScalerPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMIFaceQualityFilterSVM;
  v10 = [(HMIFaceQualityFilterSVM *)&v23 init];
  if (!v10) {
    goto LABEL_5;
  }
  v11 = [NSURL fileURLWithPath:v8];
  id v22 = 0;
  uint64_t v12 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v11 error:&v22];
  id v13 = v22;
  mlModel = v10->_mlModel;
  v10->_mlModel = (MLModel *)v12;

  if (v10->_mlModel)
  {
    v15 = [NSURL fileURLWithPath:v9];

    id v21 = v13;
    uint64_t v16 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v15 error:&v21];
    id v17 = v21;

    scalerModel = v10->_scalerModel;
    v10->_scalerModel = (MLModel *)v16;

    if (v10->_scalerModel)
    {

LABEL_5:
      v19 = v10;
      goto LABEL_10;
    }
    id v13 = v17;
    v11 = v15;
  }
  if (a5)
  {
    id v13 = v13;
    *a5 = v13;
  }
  HMIErrorLog(v10, v13);

  v19 = 0;
LABEL_10:

  return v19;
}

- (BOOL)predict:(id)a3 output:(double *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 objectAtIndexedSubscript:2];
  [v9 doubleValue];
  double v11 = fabs(v10);

  uint64_t v12 = [NSNumber numberWithDouble:v11];
  [v8 setObject:v12 atIndexedSubscript:2];

  id v13 = [v8 objectAtIndexedSubscript:3];
  [v13 doubleValue];
  double v15 = v14;

  double v16 = 100000.0;
  if (v15 <= 100000.0) {
    double v16 = v15;
  }
  id v17 = [NSNumber numberWithDouble:v16];
  [v8 setObject:v17 atIndexedSubscript:3];

  v18 = [HMIFaceQualityFilterModelInput alloc];
  v19 = +[HMIFaceQualityFilterSVM dataScalerInputName];
  v20 = [(HMIFaceQualityFilterModelInput *)v18 initWithInput:v8 inputName:v19];

  id v21 = [(HMIFaceQualityFilterSVM *)self scalerModel];
  id v49 = 0;
  id v22 = [v21 predictionFromFeatures:v20 error:&v49];
  id v23 = v49;

  if (!v22 || v23)
  {
    v40 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1019 underlyingError:v23];
    v41 = v40;
    if (a5) {
      *a5 = v40;
    }
    HMIErrorLog(self, v41);

    id v32 = v23;
    BOOL v34 = 0;
    *a5 = v32;
  }
  else
  {
    v45 = a4;
    v24 = +[HMIFaceQualityFilterSVM dataScalerOutputName];
    v25 = [v22 featureValueForName:v24];

    v47 = v25;
    uint64_t v26 = [v25 multiArrayValue];
    v27 = [HMIFaceQualityFilterModelInput alloc];
    v28 = +[HMIFaceQualityFilterSVM svmInputName];
    v46 = (void *)v26;
    v29 = [(HMIFaceQualityFilterModelInput *)v27 initWithInput:v26 inputName:v28];

    v30 = [(HMIFaceQualityFilterSVM *)self mlModel];
    id v48 = 0;
    v31 = [v30 predictionFromFeatures:v29 error:&v48];
    id v32 = v48;

    if (v31) {
      BOOL v33 = v32 == 0;
    }
    else {
      BOOL v33 = 0;
    }
    BOOL v34 = v33;
    if (v33)
    {
      v35 = +[HMIFaceQualityFilterSVM svmOutputName];
      v36 = [v31 featureValueForName:v35];
      v37 = [v36 dictionaryValue];

      v38 = [v37 objectForKeyedSubscript:&unk_26D9A91E0];
      [v38 doubleValue];
      *(void *)v45 = v39;
    }
    else
    {
      v42 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1019 underlyingError:v32];
      v43 = v42;
      if (a5) {
        *a5 = v42;
      }
      HMIErrorLog(self, v43);

      *a5 = v32;
    }
  }
  return v34;
}

+ (id)modelPathForResource:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 pathForResource:v4 ofType:@"mlmodelc"];

  return v6;
}

+ (id)defaultRecognizabilityModelPath
{
  return (id)[a1 modelPathForResource:@"FaceRecognizabilityFilterSVM"];
}

+ (id)defaultRecognizabilityDataScalerPath
{
  return (id)[a1 modelPathForResource:@"FaceRecognizabilityFilterSVMDataScaler"];
}

+ (id)defaultAestheticQualityModelPath
{
  return (id)[a1 modelPathForResource:@"FaceAestheticQualityFilterSVM"];
}

+ (id)defaultAestheticQualityDataScalerPath
{
  return (id)[a1 modelPathForResource:@"FaceAestheticQualityFilterSVMDataScaler"];
}

- (MLModel)mlModel
{
  return (MLModel *)objc_getProperty(self, a2, 8, 1);
}

- (MLModel)scalerModel
{
  return (MLModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalerModel, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
}

@end