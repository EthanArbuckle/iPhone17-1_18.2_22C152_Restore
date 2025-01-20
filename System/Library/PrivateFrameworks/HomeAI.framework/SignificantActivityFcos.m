@interface SignificantActivityFcos
+ (id)URLOfModelInThisBundle;
+ (void)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (SignificantActivityFcos)init;
- (SignificantActivityFcos)initWithConfiguration:(id)a3 error:(id *)a4;
- (SignificantActivityFcos)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (SignificantActivityFcos)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (SignificantActivityFcos)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromImage_Placeholder:(__CVBuffer *)a3 error:(id *)a4;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation SignificantActivityFcos

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"SignificantActivityFcos" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[SignificantActivityFcos URLOfModelInThisBundle]();
    }
    v4 = 0;
  }

  return v4;
}

- (SignificantActivityFcos)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SignificantActivityFcos;
    v6 = [(SignificantActivityFcos *)&v10 init];
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

- (SignificantActivityFcos)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(SignificantActivityFcos *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (SignificantActivityFcos)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(SignificantActivityFcos *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (SignificantActivityFcos)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(SignificantActivityFcos *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (SignificantActivityFcos)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(SignificantActivityFcos *)self initWithMLModel:v6];
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
  v10[2] = __77__SignificantActivityFcos_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_26477EDA0;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

void __77__SignificantActivityFcos_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[SignificantActivityFcos alloc] initWithMLModel:v4];
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
  id v9 = [(SignificantActivityFcos *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(SignificantActivityFcos *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v37 = [SignificantActivityFcosOutput alloc];
    v47 = [v11 featureValueForName:@"HomeSSD_class_prob0"];
    v64 = [v47 multiArrayValue];
    v46 = [v11 featureValueForName:@"HomeSSD_box0_offset0"];
    v63 = [v46 multiArrayValue];
    v45 = [v11 featureValueForName:@"HomeSSD_box1_offset0"];
    v62 = [v45 multiArrayValue];
    v44 = [v11 featureValueForName:@"HomeSSD_object_roll0"];
    v61 = [v44 multiArrayValue];
    v43 = [v11 featureValueForName:@"HomeSSD_object_yaw0"];
    v60 = [v43 multiArrayValue];
    v42 = [v11 featureValueForName:@"HomeSSD_class_prob1"];
    v59 = [v42 multiArrayValue];
    v41 = [v11 featureValueForName:@"HomeSSD_box0_offset1"];
    v58 = [v41 multiArrayValue];
    v40 = [v11 featureValueForName:@"HomeSSD_box1_offset1"];
    v57 = [v40 multiArrayValue];
    v39 = [v11 featureValueForName:@"HomeSSD_object_roll1"];
    v56 = [v39 multiArrayValue];
    v38 = [v11 featureValueForName:@"HomeSSD_object_yaw1"];
    v55 = [v38 multiArrayValue];
    v36 = [v11 featureValueForName:@"HomeSSD_class_prob2"];
    v54 = [v36 multiArrayValue];
    v35 = [v11 featureValueForName:@"HomeSSD_box0_offset2"];
    v53 = [v35 multiArrayValue];
    v34 = [v11 featureValueForName:@"HomeSSD_box1_offset2"];
    v52 = [v34 multiArrayValue];
    v33 = [v11 featureValueForName:@"HomeSSD_object_roll2"];
    v50 = [v33 multiArrayValue];
    v32 = [v11 featureValueForName:@"HomeSSD_object_yaw2"];
    v51 = [v32 multiArrayValue];
    v31 = [v11 featureValueForName:@"HomeSSD_class_prob3"];
    v49 = [v31 multiArrayValue];
    v30 = [v11 featureValueForName:@"HomeSSD_box0_offset3"];
    v25 = [v30 multiArrayValue];
    v29 = [v11 featureValueForName:@"HomeSSD_box1_offset3"];
    v48 = [v29 multiArrayValue];
    v28 = [v11 featureValueForName:@"HomeSSD_object_roll3"];
    v22 = [v28 multiArrayValue];
    v27 = [v11 featureValueForName:@"HomeSSD_object_yaw3"];
    v12 = [v27 multiArrayValue];
    v26 = [v11 featureValueForName:@"HomeSSD_class_prob4"];
    v21 = [v26 multiArrayValue];
    v24 = [v11 featureValueForName:@"HomeSSD_box0_offset4"];
    v13 = [v24 multiArrayValue];
    v23 = [v11 featureValueForName:@"HomeSSD_box1_offset4"];
    v14 = [v23 multiArrayValue];
    v15 = [v11 featureValueForName:@"HomeSSD_object_roll4"];
    v16 = [v15 multiArrayValue];
    v17 = [v11 featureValueForName:@"HomeSSD_object_yaw4"];
    v18 = [v17 multiArrayValue];
    v19 = -[SignificantActivityFcosOutput initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:](v37, "initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:", v64, v63, v62, v61, v60, v59, v58, v57, v56, v55, v54, v53, v52,
            v50,
            v51,
            v49,
            v25,
            v48,
            v22,
            v12,
            v21,
            v13,
            v14,
            v16,
            v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SignificantActivityFcos *)self model];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__SignificantActivityFcos_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_26477EDC8;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

void __68__SignificantActivityFcos_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v62 = a2;
  if (v62)
  {
    uint64_t v45 = a1;
    id v44 = a3;
    v32 = [SignificantActivityFcosOutput alloc];
    v43 = [v62 featureValueForName:@"HomeSSD_class_prob0"];
    v61 = [v43 multiArrayValue];
    v42 = [v62 featureValueForName:@"HomeSSD_box0_offset0"];
    v60 = [v42 multiArrayValue];
    v41 = [v62 featureValueForName:@"HomeSSD_box1_offset0"];
    v59 = [v41 multiArrayValue];
    v40 = [v62 featureValueForName:@"HomeSSD_object_roll0"];
    v58 = [v40 multiArrayValue];
    v39 = [v62 featureValueForName:@"HomeSSD_object_yaw0"];
    v57 = [v39 multiArrayValue];
    v38 = [v62 featureValueForName:@"HomeSSD_class_prob1"];
    v56 = [v38 multiArrayValue];
    v37 = [v62 featureValueForName:@"HomeSSD_box0_offset1"];
    v55 = [v37 multiArrayValue];
    v36 = [v62 featureValueForName:@"HomeSSD_box1_offset1"];
    v54 = [v36 multiArrayValue];
    v35 = [v62 featureValueForName:@"HomeSSD_object_roll1"];
    v53 = [v35 multiArrayValue];
    v34 = [v62 featureValueForName:@"HomeSSD_object_yaw1"];
    v52 = [v34 multiArrayValue];
    v31 = [v62 featureValueForName:@"HomeSSD_class_prob2"];
    v51 = [v31 multiArrayValue];
    v30 = [v62 featureValueForName:@"HomeSSD_box0_offset2"];
    v50 = [v30 multiArrayValue];
    v29 = [v62 featureValueForName:@"HomeSSD_box1_offset2"];
    v48 = [v29 multiArrayValue];
    v28 = [v62 featureValueForName:@"HomeSSD_object_roll2"];
    v49 = [v28 multiArrayValue];
    v27 = [v62 featureValueForName:@"HomeSSD_object_yaw2"];
    v21 = [v27 multiArrayValue];
    v26 = [v62 featureValueForName:@"HomeSSD_class_prob3"];
    v47 = [v26 multiArrayValue];
    v25 = [v62 featureValueForName:@"HomeSSD_box0_offset3"];
    v19 = [v25 multiArrayValue];
    v24 = [v62 featureValueForName:@"HomeSSD_box1_offset3"];
    v46 = [v24 multiArrayValue];
    v23 = [v62 featureValueForName:@"HomeSSD_object_roll3"];
    v17 = [v23 multiArrayValue];
    v22 = [v62 featureValueForName:@"HomeSSD_object_yaw3"];
    id v5 = [v22 multiArrayValue];
    v20 = [v62 featureValueForName:@"HomeSSD_class_prob4"];
    id v6 = [v20 multiArrayValue];
    v18 = [v62 featureValueForName:@"HomeSSD_box0_offset4"];
    v16 = [v18 multiArrayValue];
    id v7 = [v62 featureValueForName:@"HomeSSD_box1_offset4"];
    id v8 = [v7 multiArrayValue];
    id v9 = [v62 featureValueForName:@"HomeSSD_object_roll4"];
    objc_super v10 = [v9 multiArrayValue];
    id v11 = [v62 featureValueForName:@"HomeSSD_object_yaw4"];
    v12 = [v11 multiArrayValue];
    uint64_t v33 = -[SignificantActivityFcosOutput initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:](v32, "initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:", v61, v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v48,
            v49,
            v21,
            v47,
            v19,
            v46,
            v17,
            v5,
            v6,
            v16,
            v8,
            v10,
            v12);

    id v13 = (id)v33;
    (*(void (**)(void))(*(void *)(v45 + 32) + 16))();
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void (**)(uint64_t, void, id))(v14 + 16);
    id v13 = a3;
    v15(v14, 0, v13);
  }
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SignificantActivityFcos *)self model];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__SignificantActivityFcos_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_26477EDC8;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

void __76__SignificantActivityFcos_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v62 = a2;
  if (v62)
  {
    uint64_t v45 = a1;
    id v44 = a3;
    v32 = [SignificantActivityFcosOutput alloc];
    v43 = [v62 featureValueForName:@"HomeSSD_class_prob0"];
    v61 = [v43 multiArrayValue];
    v42 = [v62 featureValueForName:@"HomeSSD_box0_offset0"];
    v60 = [v42 multiArrayValue];
    v41 = [v62 featureValueForName:@"HomeSSD_box1_offset0"];
    v59 = [v41 multiArrayValue];
    v40 = [v62 featureValueForName:@"HomeSSD_object_roll0"];
    v58 = [v40 multiArrayValue];
    v39 = [v62 featureValueForName:@"HomeSSD_object_yaw0"];
    v57 = [v39 multiArrayValue];
    v38 = [v62 featureValueForName:@"HomeSSD_class_prob1"];
    v56 = [v38 multiArrayValue];
    v37 = [v62 featureValueForName:@"HomeSSD_box0_offset1"];
    v55 = [v37 multiArrayValue];
    v36 = [v62 featureValueForName:@"HomeSSD_box1_offset1"];
    v54 = [v36 multiArrayValue];
    v35 = [v62 featureValueForName:@"HomeSSD_object_roll1"];
    v53 = [v35 multiArrayValue];
    v34 = [v62 featureValueForName:@"HomeSSD_object_yaw1"];
    v52 = [v34 multiArrayValue];
    v31 = [v62 featureValueForName:@"HomeSSD_class_prob2"];
    v51 = [v31 multiArrayValue];
    v30 = [v62 featureValueForName:@"HomeSSD_box0_offset2"];
    v50 = [v30 multiArrayValue];
    v29 = [v62 featureValueForName:@"HomeSSD_box1_offset2"];
    v48 = [v29 multiArrayValue];
    v28 = [v62 featureValueForName:@"HomeSSD_object_roll2"];
    v49 = [v28 multiArrayValue];
    v27 = [v62 featureValueForName:@"HomeSSD_object_yaw2"];
    v21 = [v27 multiArrayValue];
    v26 = [v62 featureValueForName:@"HomeSSD_class_prob3"];
    v47 = [v26 multiArrayValue];
    v25 = [v62 featureValueForName:@"HomeSSD_box0_offset3"];
    v19 = [v25 multiArrayValue];
    v24 = [v62 featureValueForName:@"HomeSSD_box1_offset3"];
    v46 = [v24 multiArrayValue];
    v23 = [v62 featureValueForName:@"HomeSSD_object_roll3"];
    v17 = [v23 multiArrayValue];
    v22 = [v62 featureValueForName:@"HomeSSD_object_yaw3"];
    id v5 = [v22 multiArrayValue];
    v20 = [v62 featureValueForName:@"HomeSSD_class_prob4"];
    id v6 = [v20 multiArrayValue];
    v18 = [v62 featureValueForName:@"HomeSSD_box0_offset4"];
    v16 = [v18 multiArrayValue];
    id v7 = [v62 featureValueForName:@"HomeSSD_box1_offset4"];
    id v8 = [v7 multiArrayValue];
    id v9 = [v62 featureValueForName:@"HomeSSD_object_roll4"];
    id v10 = [v9 multiArrayValue];
    id v11 = [v62 featureValueForName:@"HomeSSD_object_yaw4"];
    id v12 = [v11 multiArrayValue];
    uint64_t v33 = -[SignificantActivityFcosOutput initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:](v32, "initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:", v61, v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v48,
            v49,
            v21,
            v47,
            v19,
            v46,
            v17,
            v5,
            v6,
            v16,
            v8,
            v10,
            v12);

    id v13 = (id)v33;
    (*(void (**)(void))(*(void *)(v45 + 32) + 16))();
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void (**)(uint64_t, void, id))(v14 + 16);
    id v13 = a3;
    v15(v14, 0, v13);
  }
}

- (id)predictionFromImage_Placeholder:(__CVBuffer *)a3 error:(id *)a4
{
  id v6 = [[SignificantActivityFcosInput alloc] initWithImage_Placeholder:a3];
  id v7 = [(SignificantActivityFcos *)self predictionFromFeatures:v6 error:a4];

  return v7;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v8];
  id v11 = [(SignificantActivityFcos *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    id v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    if ([v12 count] >= 1)
    {
      v26 = v10;
      id v27 = v9;
      id v28 = v8;
      v29 = v13;
      uint64_t v14 = 0;
      v30 = v12;
      do
      {
        uint64_t v75 = v14;
        v15 = [v12 featuresAtIndex:v14];
        uint64_t v45 = [SignificantActivityFcosOutput alloc];
        v57 = [v15 featureValueForName:@"HomeSSD_class_prob0"];
        v74 = [v57 multiArrayValue];
        v56 = [v15 featureValueForName:@"HomeSSD_box0_offset0"];
        v73 = [v56 multiArrayValue];
        v55 = [v15 featureValueForName:@"HomeSSD_box1_offset0"];
        v72 = [v55 multiArrayValue];
        v54 = [v15 featureValueForName:@"HomeSSD_object_roll0"];
        v71 = [v54 multiArrayValue];
        v53 = [v15 featureValueForName:@"HomeSSD_object_yaw0"];
        v70 = [v53 multiArrayValue];
        v52 = [v15 featureValueForName:@"HomeSSD_class_prob1"];
        v69 = [v52 multiArrayValue];
        v51 = [v15 featureValueForName:@"HomeSSD_box0_offset1"];
        v68 = [v51 multiArrayValue];
        v50 = [v15 featureValueForName:@"HomeSSD_box1_offset1"];
        v67 = [v50 multiArrayValue];
        v49 = [v15 featureValueForName:@"HomeSSD_object_roll1"];
        v66 = [v49 multiArrayValue];
        v48 = [v15 featureValueForName:@"HomeSSD_object_yaw1"];
        v65 = [v48 multiArrayValue];
        v47 = [v15 featureValueForName:@"HomeSSD_class_prob2"];
        v64 = [v47 multiArrayValue];
        id v44 = [v15 featureValueForName:@"HomeSSD_box0_offset2"];
        v63 = [v44 multiArrayValue];
        v43 = [v15 featureValueForName:@"HomeSSD_box1_offset2"];
        id v62 = [v43 multiArrayValue];
        v42 = [v15 featureValueForName:@"HomeSSD_object_roll2"];
        v61 = [v42 multiArrayValue];
        v41 = [v15 featureValueForName:@"HomeSSD_object_yaw2"];
        v60 = [v41 multiArrayValue];
        v40 = [v15 featureValueForName:@"HomeSSD_class_prob3"];
        v58 = [v40 multiArrayValue];
        v39 = [v15 featureValueForName:@"HomeSSD_box0_offset3"];
        v59 = [v39 multiArrayValue];
        v38 = [v15 featureValueForName:@"HomeSSD_box1_offset3"];
        uint64_t v33 = [v38 multiArrayValue];
        v37 = [v15 featureValueForName:@"HomeSSD_object_roll3"];
        v31 = [v37 multiArrayValue];
        v36 = [v15 featureValueForName:@"HomeSSD_object_yaw3"];
        v16 = [v36 multiArrayValue];
        v35 = [v15 featureValueForName:@"HomeSSD_class_prob4"];
        v17 = [v35 multiArrayValue];
        v34 = [v15 featureValueForName:@"HomeSSD_box0_offset4"];
        v18 = [v34 multiArrayValue];
        v32 = [v15 featureValueForName:@"HomeSSD_box1_offset4"];
        v19 = [v32 multiArrayValue];
        v20 = [v15 featureValueForName:@"HomeSSD_object_roll4"];
        v21 = [v20 multiArrayValue];
        v22 = [v15 featureValueForName:@"HomeSSD_object_yaw4"];
        v23 = [v22 multiArrayValue];
        v46 = -[SignificantActivityFcosOutput initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:](v45, "initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:", v74, v73, v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62,
                v61,
                v60,
                v58,
                v59,
                v33,
                v31,
                v16,
                v17,
                v18,
                v19,
                v21,
                v23);

        id v13 = v29;
        id v12 = v30;

        [v29 addObject:v46];
        uint64_t v24 = [v30 count];
        uint64_t v14 = v75 + 1;
      }
      while (v75 + 1 < v24);
      id v9 = v27;
      id v8 = v28;
      id v10 = v26;
    }
  }
  else
  {
    id v13 = 0;
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
  _os_log_error_impl(&dword_225DC6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load SignificantActivityFcos.mlmodelc in the bundle resource", v0, 2u);
}

@end