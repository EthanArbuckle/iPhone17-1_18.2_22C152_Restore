@interface FaceAestheticQualityFilterSVM
+ (id)URLOfModelInThisBundle;
+ (void)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (FaceAestheticQualityFilterSVM)init;
- (FaceAestheticQualityFilterSVM)initWithConfiguration:(id)a3 error:(id *)a4;
- (FaceAestheticQualityFilterSVM)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (FaceAestheticQualityFilterSVM)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (FaceAestheticQualityFilterSVM)initWithMLModel:(id)a3;
- (MLModel)model;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromInput:(id)a3 error:(id *)a4;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation FaceAestheticQualityFilterSVM

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"FaceAestheticQualityFilterSVM" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[FaceAestheticQualityFilterSVM URLOfModelInThisBundle]();
    }
    v4 = 0;
  }

  return v4;
}

- (FaceAestheticQualityFilterSVM)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)FaceAestheticQualityFilterSVM;
    v6 = [(FaceAestheticQualityFilterSVM *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_model, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (FaceAestheticQualityFilterSVM)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(FaceAestheticQualityFilterSVM *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (FaceAestheticQualityFilterSVM)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(FaceAestheticQualityFilterSVM *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (FaceAestheticQualityFilterSVM)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(FaceAestheticQualityFilterSVM *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (FaceAestheticQualityFilterSVM)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(FaceAestheticQualityFilterSVM *)self initWithMLModel:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 URLOfModelInThisBundle];
  [a1 loadContentsOfURL:v8 configuration:v7 completionHandler:v6];
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F00D80];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__FaceAestheticQualityFilterSVM_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_26477EDA0;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

void __83__FaceAestheticQualityFilterSVM_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[FaceAestheticQualityFilterSVM alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263F00DC8];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(FaceAestheticQualityFilterSVM *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(FaceAestheticQualityFilterSVM *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [FaceAestheticQualityFilterSVMOutput alloc];
    v13 = [v11 featureValueForName:@"classLabel"];
    uint64_t v14 = [v13 int64Value];
    v15 = [v11 featureValueForName:@"classProbability"];
    v16 = [v15 dictionaryValue];
    v17 = [(FaceAestheticQualityFilterSVMOutput *)v12 initWithClassLabel:v14 classProbability:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FaceAestheticQualityFilterSVM *)self model];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__FaceAestheticQualityFilterSVM_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_26477EDC8;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

void __74__FaceAestheticQualityFilterSVM_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    id v6 = [FaceAestheticQualityFilterSVMOutput alloc];
    id v7 = [v14 featureValueForName:@"classLabel"];
    uint64_t v8 = [v7 int64Value];
    id v9 = [v14 featureValueForName:@"classProbability"];
    objc_super v10 = [v9 dictionaryValue];
    id v11 = [(FaceAestheticQualityFilterSVMOutput *)v6 initWithClassLabel:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void (**)(uint64_t, void, FaceAestheticQualityFilterSVMOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FaceAestheticQualityFilterSVM *)self model];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__FaceAestheticQualityFilterSVM_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_26477EDC8;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

void __82__FaceAestheticQualityFilterSVM_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    id v6 = [FaceAestheticQualityFilterSVMOutput alloc];
    id v7 = [v14 featureValueForName:@"classLabel"];
    uint64_t v8 = [v7 int64Value];
    id v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(FaceAestheticQualityFilterSVMOutput *)v6 initWithClassLabel:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void (**)(uint64_t, void, FaceAestheticQualityFilterSVMOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

- (id)predictionFromInput:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[FaceAestheticQualityFilterSVMInput alloc] initWithInput:v6];

  uint64_t v8 = [(FaceAestheticQualityFilterSVM *)self predictionFromFeatures:v7 error:a4];

  return v8;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v8];
  id v11 = [(FaceAestheticQualityFilterSVM *)self model];
  uint64_t v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    if ([v12 count] >= 1)
    {
      v23 = v10;
      id v24 = v9;
      id v25 = v8;
      uint64_t v14 = 0;
      do
      {
        v15 = [v12 featuresAtIndex:v14];
        v16 = [FaceAestheticQualityFilterSVMOutput alloc];
        v17 = [v15 featureValueForName:@"classLabel"];
        uint64_t v18 = [v17 int64Value];
        v19 = [v15 featureValueForName:@"classProbability"];
        v20 = [v19 dictionaryValue];
        v21 = [(FaceAestheticQualityFilterSVMOutput *)v16 initWithClassLabel:v18 classProbability:v20];

        [v13 addObject:v21];
        ++v14;
      }
      while (v14 < [v12 count]);
      id v9 = v24;
      id v8 = v25;
      id v10 = v23;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

+ (void)URLOfModelInThisBundle
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225DC6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load FaceAestheticQualityFilterSVM.mlmodelc in the bundle resource", v0, 2u);
}

@end