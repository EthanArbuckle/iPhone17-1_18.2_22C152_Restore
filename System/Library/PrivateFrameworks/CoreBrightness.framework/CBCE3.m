@interface CBCE3
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (CBCE3)init;
- (CBCE3)initWithConfiguration:(id)a3 error:(id *)a4;
- (CBCE3)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (CBCE3)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (CBCE3)initWithMLModel:(id)a3;
- (MLModel)model;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromInput:(id)a3 error:(id *)a4;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation CBCE3

+ (id)URLOfModelInThisBundle
{
  v10[2] = a1;
  v10[1] = (id)a2;
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10[0] = (id)[v6 pathForResource:@"CBCE3" ofType:@"mlmodelc"];

  if (v10[0])
  {
    id v11 = (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:v10[0]];
  }
  else
  {
    id location = MEMORY[0x1E4F14500];
    char v8 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_error_impl(&dword_1BA438000, log, type, "Could not load CBCE3.mlmodelc in the bundle resource", v7, 2u);
    }
    objc_storeStrong(&location, 0);
    id v11 = 0;
  }
  objc_storeStrong(v10, 0);
  v2 = v11;

  return v2;
}

- (CBCE3)initWithMLModel:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v7;
  id v7 = 0;
  v5.receiver = v3;
  v5.super_class = (Class)CBCE3;
  id v7 = [(CBCE3 *)&v5 init];
  objc_storeStrong(&v7, v7);
  if (v7)
  {
    objc_storeStrong((id *)v7 + 1, location[0]);
    if (*((void *)v7 + 1)) {
      char v8 = (CBCE3 *)v7;
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v8;
}

- (CBCE3)init
{
  id v6 = self;
  id v4 = (id)[(id)objc_opt_class() URLOfModelInThisBundle];
  id v6 = 0;
  id v6 = -[CBCE3 initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:");
  objc_super v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (CBCE3)initWithConfiguration:(id)a3 error:(id *)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v5 = v9;
  id v6 = (id)[(id)objc_opt_class() URLOfModelInThisBundle];
  v9 = 0;
  v9 = -[CBCE3 initWithContentsOfURL:configuration:error:](v5, "initWithContentsOfURL:configuration:error:");
  id v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (CBCE3)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = (id)[getMLModelClass() modelWithContentsOfURL:location[0] error:a4];
  if (v7[0])
  {
    id v4 = v9;
    id v9 = 0;
    id v9 = (id)[v4 initWithMLModel:v7[0]];
    v10 = (CBCE3 *)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

- (CBCE3)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v9[1] = a5;
  v9[0] = (id)[getMLModelClass() modelWithContentsOfURL:location[0] configuration:v10 error:a5];
  if (v9[0])
  {
    id v5 = v12;
    id v12 = 0;
    id v12 = (id)[v5 initWithMLModel:v9[0]];
    v13 = (CBCE3 *)v12;
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v13;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = v9;
  id v6 = (id)[v9 URLOfModelInThisBundle];
  objc_msgSend(v5, "loadContentsOfURL:configuration:completionHandler:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id MLModelClass = getMLModelClass();
  id v7 = location[0];
  id v8 = v17;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  int v11 = -1073741824;
  int v12 = 0;
  v13 = __59__CBCE3_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v14 = &unk_1E6219030;
  id v15 = v16;
  objc_msgSend(MLModelClass, "loadContentsOfURL:configuration:completionHandler:", v7, v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __59__CBCE3_loadContentsOfURL_configuration_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  if (location[0])
  {
    id v3 = [CBCE3 alloc];
    v6[0] = [(CBCE3 *)v3 initWithMLModel:location[0]];
    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v6, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = v10;
  id v5 = location[0];
  id v7 = objc_alloc_init((Class)getMLPredictionOptionsClass());
  id v8 = -[CBCE3 predictionFromFeatures:options:error:](v6, "predictionFromFeatures:options:error:", v5);

  objc_storeStrong(location, 0);

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  v25[1] = a5;
  v24 = [(CBCE3 *)v28 model];
  v25[0] = [(MLModel *)v24 predictionFromFeatures:location[0] options:v26 error:a5];

  if (v25[0])
  {
    id v7 = [CBCE3Output alloc];
    id v21 = (id)[v25[0] featureValueForName:@"CBCE3_Q0_output"];
    id v20 = (id)[v21 multiArrayValue];
    id v19 = (id)[v25[0] featureValueForName:@"CBCE3_Q1_output"];
    id v18 = (id)[v19 multiArrayValue];
    id v17 = (id)[v25[0] featureValueForName:@"CBCE3_Q2_output"];
    id v16 = (id)[v17 multiArrayValue];
    id v15 = (id)[v25[0] featureValueForName:@"CBCE3_Q3_output"];
    id v14 = (id)[v15 multiArrayValue];
    id v13 = (id)[v25[0] featureValueForName:@"CBCE3_Q4_output"];
    id v12 = (id)[v13 multiArrayValue];
    id v11 = (id)[v25[0] featureValueForName:@"strength_output"];
    id v10 = (id)[v11 multiArrayValue];
    id v9 = (id)[v25[0] featureValueForName:@"uncertainty"];
    id v8 = (id)[v9 multiArrayValue];
    uint64_t v29 = [(CBCE3Output *)v7 initWithCBCE3_Q0_output:v20 CBCE3_Q1_output:v18 CBCE3_Q2_output:v16 CBCE3_Q3_output:v14 CBCE3_Q4_output:v12 strength_output:v10 uncertainty:v8];
  }
  else
  {
    uint64_t v29 = 0;
  }
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  id v5 = (void *)v29;

  return v5;
}

- (id)predictionFromInput:(id)a3 error:(id *)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8[1] = a4;
  id v4 = [CBCE3Input alloc];
  v8[0] = [(CBCE3Input *)v4 initWithInput:location[0]];
  id v7 = [(CBCE3 *)v10 predictionFromFeatures:v8[0] error:a4];
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  v33[1] = a5;
  id v5 = objc_alloc((Class)getMLArrayBatchProviderClass());
  v33[0] = (id)[v5 initWithFeatureProviderArray:location[0]];
  id v26 = [(CBCE3 *)v36 model];
  id v32 = [(MLModel *)v26 predictionsFromBatch:v33[0] options:v34 error:a5];

  if (v32)
  {
    id v30 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v23 = i;
      if (v23 >= [v32 count]) {
        break;
      }
      id v28 = (id)[v32 featuresAtIndex:i];
      id v8 = [CBCE3Output alloc];
      id v22 = (id)[v28 featureValueForName:@"CBCE3_Q0_output"];
      id v21 = (id)[v22 multiArrayValue];
      id v20 = (id)[v28 featureValueForName:@"CBCE3_Q1_output"];
      id v19 = (id)[v20 multiArrayValue];
      id v18 = (id)[v28 featureValueForName:@"CBCE3_Q2_output"];
      id v17 = (id)[v18 multiArrayValue];
      id v16 = (id)[v28 featureValueForName:@"CBCE3_Q3_output"];
      id v15 = (id)[v16 multiArrayValue];
      id v14 = (id)[v28 featureValueForName:@"CBCE3_Q4_output"];
      id v13 = (id)[v14 multiArrayValue];
      id v12 = (id)[v28 featureValueForName:@"strength_output"];
      id v11 = (id)[v12 multiArrayValue];
      id v10 = (id)[v28 featureValueForName:@"uncertainty"];
      id v9 = (id)[v10 multiArrayValue];
      v27 = [(CBCE3Output *)v8 initWithCBCE3_Q0_output:v21 CBCE3_Q1_output:v19 CBCE3_Q2_output:v17 CBCE3_Q3_output:v15 CBCE3_Q4_output:v13 strength_output:v11 uncertainty:v9];

      [v30 addObject:v27];
      objc_storeStrong((id *)&v27, 0);
      objc_storeStrong(&v28, 0);
    }
    id v37 = v30;
    int v31 = 1;
    objc_storeStrong(&v30, 0);
  }
  else
  {
    id v37 = 0;
    int v31 = 1;
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  id v6 = v37;

  return v6;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end