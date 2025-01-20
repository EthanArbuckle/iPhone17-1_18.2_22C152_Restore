@interface SNSoundPrintASmokeAlarmModel
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (SNSoundPrintASmokeAlarmModel)init;
- (SNSoundPrintASmokeAlarmModel)initWithConfiguration:(id)a3 error:(id *)a4;
- (SNSoundPrintASmokeAlarmModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (SNSoundPrintASmokeAlarmModel)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (SNSoundPrintASmokeAlarmModel)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromInput1:(id)a3 stateIn:(id)a4 thresholdedHistoryIn:(id)a5 detectedHistoryIn:(id)a6 error:(id *)a7;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation SNSoundPrintASmokeAlarmModel

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"SNSoundPrintASmokeAlarmModel" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1DC873000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not load SNSoundPrintASmokeAlarmModel.mlmodelc in the bundle resource", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (SNSoundPrintASmokeAlarmModel)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SNSoundPrintASmokeAlarmModel;
    v6 = [(SNSoundPrintASmokeAlarmModel *)&v10 init];
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

- (SNSoundPrintASmokeAlarmModel)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(SNSoundPrintASmokeAlarmModel *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (SNSoundPrintASmokeAlarmModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(SNSoundPrintASmokeAlarmModel *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (SNSoundPrintASmokeAlarmModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(SNSoundPrintASmokeAlarmModel *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (SNSoundPrintASmokeAlarmModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(SNSoundPrintASmokeAlarmModel *)self initWithMLModel:v6];
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
  v10[2] = sub_1DCB79704;
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
  id v9 = [(SNSoundPrintASmokeAlarmModel *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(SNSoundPrintASmokeAlarmModel *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [SNSoundPrintASmokeAlarmModelOutput alloc];
    v26 = [v11 featureValueForName:@"input_1"];
    uint64_t v13 = [v26 multiArrayValue];
    v25 = [v11 featureValueForName:@"Confidence"];
    v14 = [v25 multiArrayValue];
    v15 = [v11 featureValueForName:@"Detected"];
    v16 = [v15 multiArrayValue];
    v17 = [v11 featureValueForName:@"thresholdedHistoryOut"];
    v18 = [v17 multiArrayValue];
    v19 = [v11 featureValueForName:@"detectedHistoryOut"];
    v20 = [v19 multiArrayValue];
    v21 = v12;
    v22 = (void *)v13;
    v23 = [(SNSoundPrintASmokeAlarmModelOutput *)v21 initWithInput_1:v13 Confidence:v14 Detected:v16 thresholdedHistoryOut:v18 detectedHistoryOut:v20];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SNSoundPrintASmokeAlarmModel *)self model];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DCB79AB8;
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
  id v11 = [(SNSoundPrintASmokeAlarmModel *)self model];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DCB79D70;
  v13[3] = &unk_1E6CA82B8;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromInput1:(id)a3 stateIn:(id)a4 thresholdedHistoryIn:(id)a5 detectedHistoryIn:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[SNSoundPrintASmokeAlarmModelInput alloc] initWithInput1:v15 stateIn:v14 thresholdedHistoryIn:v13 detectedHistoryIn:v12];

  v17 = [(SNSoundPrintASmokeAlarmModel *)self predictionFromFeatures:v16 error:a7];

  return v17;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v8];
  id v11 = [(SNSoundPrintASmokeAlarmModel *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    if ([v12 count] >= 1)
    {
      v24 = v10;
      id v25 = v9;
      id v26 = v8;
      v27 = v13;
      uint64_t v14 = 0;
      do
      {
        id v15 = [v12 featuresAtIndex:v14];
        v29 = [SNSoundPrintASmokeAlarmModelOutput alloc];
        v32 = [v15 featureValueForName:@"input_1"];
        v28 = [v32 multiArrayValue];
        v31 = [v15 featureValueForName:@"Confidence"];
        v16 = [v31 multiArrayValue];
        v30 = [v15 featureValueForName:@"Detected"];
        v17 = [v30 multiArrayValue];
        v18 = [v15 featureValueForName:@"thresholdedHistoryOut"];
        v19 = [v18 multiArrayValue];
        v20 = [v15 featureValueForName:@"detectedHistoryOut"];
        v21 = [v20 multiArrayValue];
        v22 = [(SNSoundPrintASmokeAlarmModelOutput *)v29 initWithInput_1:v28 Confidence:v16 Detected:v17 thresholdedHistoryOut:v19 detectedHistoryOut:v21];

        id v13 = v27;
        [v27 addObject:v22];

        ++v14;
      }
      while (v14 < [v12 count]);
      id v9 = v25;
      id v8 = v26;
      id v10 = v24;
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

@end