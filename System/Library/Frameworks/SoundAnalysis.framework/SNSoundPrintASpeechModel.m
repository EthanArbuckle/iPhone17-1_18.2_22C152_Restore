@interface SNSoundPrintASpeechModel
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (SNSoundPrintASpeechModel)init;
- (SNSoundPrintASpeechModel)initWithConfiguration:(id)a3 error:(id *)a4;
- (SNSoundPrintASpeechModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (SNSoundPrintASpeechModel)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (SNSoundPrintASpeechModel)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromInput1:(id)a3 stateIn:(id)a4 detectedHistoryIn:(id)a5 error:(id *)a6;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation SNSoundPrintASpeechModel

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"SNSoundPrintASpeechModel" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1DC873000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not load SNSoundPrintASpeechModel.mlmodelc in the bundle resource", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (SNSoundPrintASpeechModel)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SNSoundPrintASpeechModel;
    v6 = [(SNSoundPrintASpeechModel *)&v10 init];
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

- (SNSoundPrintASpeechModel)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(SNSoundPrintASpeechModel *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (SNSoundPrintASpeechModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(SNSoundPrintASpeechModel *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (SNSoundPrintASpeechModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(SNSoundPrintASpeechModel *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (SNSoundPrintASpeechModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(SNSoundPrintASpeechModel *)self initWithMLModel:v6];
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
  id v8 = (void *)MEMORY[0x1E4F1E968];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DCB7FC84;
  v10[3] = &unk_1E6CA8290;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1E9E0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(SNSoundPrintASpeechModel *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(SNSoundPrintASpeechModel *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [SNSoundPrintASpeechModelOutput alloc];
    v13 = [v11 featureValueForName:@"input_1"];
    v14 = [v13 multiArrayValue];
    v15 = [v11 featureValueForName:@"Confidence"];
    v16 = [v15 multiArrayValue];
    v17 = [v11 featureValueForName:@"Detected"];
    v18 = [v17 multiArrayValue];
    v19 = [v11 featureValueForName:@"detectedHistoryOut"];
    v20 = [v19 multiArrayValue];
    v21 = [(SNSoundPrintASpeechModelOutput *)v12 initWithInput_1:v14 Confidence:v16 Detected:v18 detectedHistoryOut:v20];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SNSoundPrintASpeechModel *)self model];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DCB7FFF4;
  v10[3] = &unk_1E6CA82B8;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SNSoundPrintASpeechModel *)self model];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DCB80270;
  v13[3] = &unk_1E6CA82B8;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromInput1:(id)a3 stateIn:(id)a4 detectedHistoryIn:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[SNSoundPrintASpeechModelInput alloc] initWithInput1:v12 stateIn:v11 detectedHistoryIn:v10];

  id v14 = [(SNSoundPrintASpeechModel *)self predictionFromFeatures:v13 error:a6];

  return v14;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v8];
  id v11 = [(SNSoundPrintASpeechModel *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
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
        v15 = objc_msgSend(v12, "featuresAtIndex:", v14, v26, v27, v28);
        v16 = [SNSoundPrintASpeechModelOutput alloc];
        v31 = [v15 featureValueForName:@"input_1"];
        v17 = [v31 multiArrayValue];
        v18 = [v15 featureValueForName:@"Confidence"];
        v19 = [v18 multiArrayValue];
        v20 = [v15 featureValueForName:@"Detected"];
        v21 = [v20 multiArrayValue];
        v22 = [v15 featureValueForName:@"detectedHistoryOut"];
        v23 = [v22 multiArrayValue];
        v24 = [(SNSoundPrintASpeechModelOutput *)v16 initWithInput_1:v17 Confidence:v19 Detected:v21 detectedHistoryOut:v23];

        v13 = v29;
        id v12 = v30;

        [v29 addObject:v24];
        ++v14;
      }
      while (v14 < [v30 count]);
      id v9 = v27;
      id v8 = v28;
      id v10 = v26;
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

@end