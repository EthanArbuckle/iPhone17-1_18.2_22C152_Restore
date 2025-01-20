@interface Te_c3seuakuh8
+ (id)URLOfModelInThisBundle;
+ (void)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (Te_c3seuakuh8)init;
- (Te_c3seuakuh8)initWithConfiguration:(id)a3 error:(id *)a4;
- (Te_c3seuakuh8)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (Te_c3seuakuh8)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (Te_c3seuakuh8)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromPlaceholder:(id)a3 error:(id *)a4;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation Te_c3seuakuh8

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"Te_c3seuakuh8" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[Te_c3seuakuh8 URLOfModelInThisBundle]();
    }
    v4 = 0;
  }

  return v4;
}

- (Te_c3seuakuh8)initWithMLModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)Te_c3seuakuh8;
  v6 = [(Te_c3seuakuh8 *)&v10 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model)) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (Te_c3seuakuh8)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(Te_c3seuakuh8 *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (Te_c3seuakuh8)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(Te_c3seuakuh8 *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (Te_c3seuakuh8)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(Te_c3seuakuh8 *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (Te_c3seuakuh8)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(Te_c3seuakuh8 *)self initWithMLModel:v6];
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
  v10[2] = __67__Te_c3seuakuh8_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_265221558;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263F00DC8];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(Te_c3seuakuh8 *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5 = [(MLModel *)self->_model predictionFromFeatures:a3 options:a4 error:a5];
  if (v5)
  {
    id v6 = [Te_c3seuakuh8Output alloc];
    id v7 = [v5 featureValueForName:@"RHYTHM_TYPE_HEAD/FC_1/fully_connected/BiasAdd"];
    id v8 = [v7 multiArrayValue];
    id v9 = [(Te_c3seuakuh8Output *)v6 initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)predictionFromPlaceholder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[Te_c3seuakuh8Input alloc] initWithPlaceholder:v6];

  id v8 = [(Te_c3seuakuh8 *)self predictionFromFeatures:v7 error:a4];

  return v8;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void *)[objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v8];
  id v11 = [(MLModel *)self->_model predictionsFromBatch:v10 options:v9 error:a5];
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    if ([v12 count] >= 1)
    {
      id v21 = v9;
      id v22 = v8;
      uint64_t v14 = 0;
      do
      {
        v15 = objc_msgSend(v12, "featuresAtIndex:", v14, v21, v22);
        v16 = [Te_c3seuakuh8Output alloc];
        v17 = [v15 featureValueForName:@"RHYTHM_TYPE_HEAD/FC_1/fully_connected/BiasAdd"];
        v18 = [v17 multiArrayValue];
        v19 = [(Te_c3seuakuh8Output *)v16 initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:v18];

        [v13 addObject:v19];
        ++v14;
      }
      while (v14 < [v12 count]);
      id v9 = v21;
      id v8 = v22;
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
  _os_log_error_impl(&dword_2477CF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load Te_c3seuakuh8.mlmodelc in the bundle resource", v0, 2u);
}

@end