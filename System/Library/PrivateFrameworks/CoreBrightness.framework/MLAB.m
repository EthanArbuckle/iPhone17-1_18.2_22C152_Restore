@interface MLAB
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLAB)init;
- (MLAB)initWithConfiguration:(id)a3 error:(id *)a4;
- (MLAB)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (MLAB)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (MLAB)initWithMLModel:(id)a3;
- (MLModel)model;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromInput_x:(id)a3 target_lux:(id)a4 target_nits:(id)a5 target_weight:(id)a6 error:(id *)a7;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation MLAB

+ (id)URLOfModelInThisBundle
{
  v10[2] = a1;
  v10[1] = (id)a2;
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10[0] = (id)[v6 pathForResource:@"MLAB" ofType:@"mlmodelc"];

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
      _os_log_error_impl(&dword_1BA438000, log, type, "Could not load MLAB.mlmodelc in the bundle resource", v7, 2u);
    }
    objc_storeStrong(&location, 0);
    id v11 = 0;
  }
  objc_storeStrong(v10, 0);
  v2 = v11;

  return v2;
}

- (MLAB)initWithMLModel:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v7;
  id v7 = 0;
  v5.receiver = v3;
  v5.super_class = (Class)MLAB;
  id v7 = [(MLAB *)&v5 init];
  objc_storeStrong(&v7, v7);
  if (v7)
  {
    objc_storeStrong((id *)v7 + 1, location[0]);
    if (*((void *)v7 + 1)) {
      char v8 = (MLAB *)v7;
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

- (MLAB)init
{
  id v6 = self;
  id v4 = (id)[(id)objc_opt_class() URLOfModelInThisBundle];
  id v6 = 0;
  id v6 = -[MLAB initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:");
  objc_super v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (MLAB)initWithConfiguration:(id)a3 error:(id *)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v5 = v9;
  id v6 = (id)[(id)objc_opt_class() URLOfModelInThisBundle];
  v9 = 0;
  v9 = -[MLAB initWithContentsOfURL:configuration:error:](v5, "initWithContentsOfURL:configuration:error:");
  id v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (MLAB)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = (id)[getMLModelClass_1() modelWithContentsOfURL:location[0] error:a4];
  if (v7[0])
  {
    id v4 = v9;
    id v9 = 0;
    id v9 = (id)[v4 initWithMLModel:v7[0]];
    v10 = (MLAB *)v9;
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

- (MLAB)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v9[1] = a5;
  v9[0] = (id)[getMLModelClass_1() modelWithContentsOfURL:location[0] configuration:v10 error:a5];
  if (v9[0])
  {
    id v5 = v12;
    id v12 = 0;
    id v12 = (id)[v5 initWithMLModel:v9[0]];
    v13 = (MLAB *)v12;
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
  id MLModelClass_1 = getMLModelClass_1();
  id v7 = location[0];
  id v8 = v17;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  int v11 = -1073741824;
  int v12 = 0;
  v13 = __58__MLAB_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v14 = &unk_1E6219E18;
  id v15 = v16;
  objc_msgSend(MLModelClass_1, "loadContentsOfURL:configuration:completionHandler:", v7, v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __58__MLAB_loadContentsOfURL_configuration_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  if (location[0])
  {
    id v3 = [MLAB alloc];
    v6[0] = [(MLAB *)v3 initWithMLModel:location[0]];
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
  id v7 = objc_alloc_init((Class)getMLPredictionOptionsClass_1());
  id v8 = -[MLAB predictionFromFeatures:options:error:](v6, "predictionFromFeatures:options:error:", v5);

  objc_storeStrong(location, 0);

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v41 = a4;
  v42 = a5;
  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v46 = 0;
  objc_storeStrong(&v46, v41);
  v45[1] = v42;
  v43 = [(MLAB *)v48 model];
  v45[0] = [(MLModel *)v43 predictionFromFeatures:location[0] options:v46 error:v42];

  if (v45[0])
  {
    id v9 = [MLABOutput alloc];
    id v40 = (id)[v45[0] featureValueForName:@"Identity"];
    id v39 = (id)[v40 multiArrayValue];
    id v38 = (id)[v45[0] featureValueForName:@"LTM_output_E"];
    id v37 = (id)[v38 multiArrayValue];
    id v36 = (id)[v45[0] featureValueForName:@"Identity_10"];
    id v35 = (id)[v36 multiArrayValue];
    id v34 = (id)[v45[0] featureValueForName:@"Identity_11"];
    id v33 = (id)[v34 multiArrayValue];
    id v32 = (id)[v45[0] featureValueForName:@"Identity_12"];
    id v31 = (id)[v32 multiArrayValue];
    id v30 = (id)[v45[0] featureValueForName:@"Identity_13"];
    id v29 = (id)[v30 multiArrayValue];
    id v28 = (id)[v45[0] featureValueForName:@"Identity_14"];
    id v27 = (id)[v28 multiArrayValue];
    id v26 = (id)[v45[0] featureValueForName:@"LTM_output_L"];
    id v25 = (id)[v26 multiArrayValue];
    id v24 = (id)[v45[0] featureValueForName:@"LTM_output_S"];
    id v23 = (id)[v24 multiArrayValue];
    id v22 = (id)[v45[0] featureValueForName:@"Identity_4"];
    id v21 = (id)[v22 multiArrayValue];
    id v20 = (id)[v45[0] featureValueForName:@"Identity_5"];
    id v19 = (id)[v20 multiArrayValue];
    id v18 = (id)[v45[0] featureValueForName:@"STM_output_E"];
    id v17 = (id)[v18 multiArrayValue];
    id v16 = (id)[v45[0] featureValueForName:@"STM_output_L"];
    id v15 = (id)[v16 multiArrayValue];
    id v14 = (id)[v45[0] featureValueForName:@"STM_output_S"];
    id v13 = (id)[v14 multiArrayValue];
    id v12 = (id)[v45[0] featureValueForName:@"Identity_9"];
    id v11 = (id)[v12 multiArrayValue];
    uint64_t v10 = &v7;
    uint64_t v49 = [(MLABOutput *)v9 initWithIdentity:v39 LTM_output_E:v37 Identity_10:v35 Identity_11:v33 Identity_12:v31 Identity_13:v29 Identity_14:v27 LTM_output_L:v25 LTM_output_S:v23 Identity_4:v21 Identity_5:v19 STM_output_E:v17 STM_output_L:v15 STM_output_S:v13 Identity_9:v11];
  }
  else
  {
    uint64_t v49 = 0;
  }
  int v44 = 1;
  id obj = 0;
  objc_storeStrong(v45, 0);
  objc_storeStrong(&v46, obj);
  objc_storeStrong(location, obj);
  id v5 = (void *)v49;

  return v5;
}

- (id)predictionFromInput_x:(id)a3 target_lux:(id)a4 target_nits:(id)a5 target_weight:(id)a6 error:(id *)a7
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v15 = 0;
  objc_storeStrong(&v15, a6);
  v14[1] = a7;
  uint64_t v7 = [MLABInput alloc];
  v14[0] = [(MLABInput *)v7 initWithInput_x:location[0] target_lux:v17 target_nits:v16 target_weight:v15];
  id v13 = [(MLAB *)v19 predictionFromFeatures:v14[0] error:a7];
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);

  return v13;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v51 = a4;
  v52 = a5;
  v63 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v61 = 0;
  objc_storeStrong(&v61, v51);
  v60[1] = v52;
  id v5 = objc_alloc((Class)getMLArrayBatchProviderClass_1());
  v60[0] = (id)[v5 initWithFeatureProviderArray:location[0]];
  v53 = [(MLAB *)v63 model];
  id v59 = [(MLModel *)v53 predictionsFromBatch:v60[0] options:v61 error:v52];

  if (v59)
  {
    uint64_t v50 = MEMORY[0x1E4F1CA48];
    id v57 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v59, "count"));
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v49 = i;
      uint64_t v6 = [v59 count];
      if (v49 >= v6) {
        break;
      }
      id v7 = (id)[v59 featuresAtIndex:i];
      v47 = &v55;
      id v55 = v7;
      id v14 = [MLABOutput alloc];
      id v45 = (id)[v55 featureValueForName:@"Identity"];
      id v44 = (id)[v45 multiArrayValue];
      id v43 = (id)[v55 featureValueForName:@"LTM_output_E"];
      id v42 = (id)[v43 multiArrayValue];
      id v41 = (id)[v55 featureValueForName:@"Identity_10"];
      id v40 = (id)[v41 multiArrayValue];
      id v39 = (id)[v55 featureValueForName:@"Identity_11"];
      id v38 = (id)[v39 multiArrayValue];
      id v37 = (id)[v55 featureValueForName:@"Identity_12"];
      id v36 = (id)[v37 multiArrayValue];
      id v35 = (id)[v55 featureValueForName:@"Identity_13"];
      id v34 = (id)[v35 multiArrayValue];
      id v33 = (id)[v55 featureValueForName:@"Identity_14"];
      id v32 = (id)[v33 multiArrayValue];
      id v31 = (id)[v55 featureValueForName:@"LTM_output_L"];
      id v30 = (id)[v31 multiArrayValue];
      id v29 = (id)[v55 featureValueForName:@"LTM_output_S"];
      id v28 = (id)[v29 multiArrayValue];
      id v27 = (id)[v55 featureValueForName:@"Identity_4"];
      id v26 = (id)[v27 multiArrayValue];
      id v25 = (id)[v55 featureValueForName:@"Identity_5"];
      id v24 = (id)[v25 multiArrayValue];
      id v23 = (id)[v55 featureValueForName:@"STM_output_E"];
      id v22 = (id)[v23 multiArrayValue];
      id v21 = (id)[v55 featureValueForName:@"STM_output_L"];
      id v20 = (id)[v21 multiArrayValue];
      id v19 = (id)[v55 featureValueForName:@"STM_output_S"];
      id v18 = (id)[v19 multiArrayValue];
      id v17 = (id)[v55 featureValueForName:@"Identity_9"];
      id v16 = (id)[v17 multiArrayValue];
      id v15 = &v11;
      uint64_t v8 = [(MLABOutput *)v14 initWithIdentity:v44 LTM_output_E:v42 Identity_10:v40 Identity_11:v38 Identity_12:v36 Identity_13:v34 Identity_14:v32 LTM_output_L:v30 LTM_output_S:v28 Identity_4:v26 Identity_5:v24 STM_output_E:v22 STM_output_L:v20 STM_output_S:v18 Identity_9:v16];
      id v46 = (id *)&v54;
      uint64_t v54 = v8;

      [v57 addObject:v54];
      id v48 = 0;
      objc_storeStrong(v46, 0);
      objc_storeStrong(v47, v48);
    }
    id v13 = &v57;
    id v64 = v57;
    int v58 = 1;
    objc_storeStrong(v13, 0);
  }
  else
  {
    id v64 = 0;
    int v58 = 1;
  }
  id obj = 0;
  objc_storeStrong(&v59, 0);
  objc_storeStrong(v60, obj);
  objc_storeStrong(&v61, obj);
  objc_storeStrong(location, obj);
  id v9 = v64;

  return v9;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end