@interface MLClassifier
+ (id)predictionFromFeatures:(id)a3 classifier:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_needsToEmulateAsyncClassificationUsingQueue:(id *)a3;
- (MLClassifier)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)classLabels;
- (id)classifierResultFromOutputFeatures:(id)a3 error:(id *)a4;
- (id)classify:(id)a3 options:(id)a4 error:(id *)a5;
- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation MLClassifier

- (void).cxx_destruct
{
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"classify:topK:error be implemented by derived class!", a4];
  }
  return 0;
}

- (id)classLabels
{
  return 0;
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "The input feature provider cannot be nil.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The input feature provider cannot be nil."];
  }
  if (v9)
  {
    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {
    id v9 = +[MLPredictionOptions defaultOptions];
    if (v10) {
      goto LABEL_12;
    }
  }
  v12 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "The completion handler cannot be nil.", buf, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completion handler cannot be nil."];
LABEL_12:
  id v24 = 0;
  BOOL v13 = [(MLClassifier *)self _needsToEmulateAsyncClassificationUsingQueue:&v24];
  v14 = v24;
  if (v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MLClassifier_predictionFromFeatures_options_completionHandler___block_invoke;
    block[3] = &unk_1E59A38C0;
    block[4] = self;
    id v21 = v8;
    id v22 = v9;
    id v23 = v10;
    dispatch_async(v14, block);
  }
  else
  {
    v15 = self;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__MLClassifier_predictionFromFeatures_options_completionHandler___block_invoke_2;
    v17[3] = &unk_1E59A38E8;
    v18 = v15;
    id v19 = v10;
    v16 = v15;
    [(MLClassifier *)v16 classify:v8 options:v9 completionHandler:v17];
  }
}

void __65__MLClassifier_predictionFromFeatures_options_completionHandler___block_invoke(void *a1)
{
  v2 = objc_opt_class();
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  id v8 = 0;
  v6 = [v2 predictionFromFeatures:v3 classifier:v4 options:v5 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(a1[7] + 16))();
}

void __65__MLClassifier_predictionFromFeatures_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    v6 = [*(id *)(a1 + 32) modelDescription];
    id v7 = [v6 predictedClassFeatureDescription];
    id v8 = [*(id *)(a1 + 32) modelDescription];
    id v9 = [v8 classProbabilityFeatureDescription];
    id v10 = [v11 asFeatureDictionaryWithPredictedClassDescription:v7 classProbabilityDescription:v9];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = +[MLPredictionOptions defaultOptions];
  }
  id v10 = +[MLClassifier predictionFromFeatures:v8 classifier:self options:v9 error:a5];

  return v10;
}

- (BOOL)_needsToEmulateAsyncClassificationUsingQueue:(id *)a3
{
  p_asyncClassifierQueueLock = &self->_asyncClassifierQueueLock;
  os_unfair_lock_lock(&self->_asyncClassifierQueueLock);
  BOOL supportsAsyncClassification = self->_supportsAsyncClassification;
  if (!self->_supportsAsyncClassification)
  {
    if (self->_asyncClassifierQueue)
    {
      BOOL supportsAsyncClassification = 0;
    }
    else
    {
      if ([(MLClassifier *)self conformsToProtocol:&unk_1EF125A78])
      {
        id v7 = 0;
        self->_BOOL supportsAsyncClassification = 1;
      }
      else
      {
        self->_BOOL supportsAsyncClassification = 0;
        id v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreml.AsyncClassifierQueue", 0);
      }
      asyncClassifierQueue = self->_asyncClassifierQueue;
      self->_asyncClassifierQueue = v7;

      BOOL supportsAsyncClassification = self->_supportsAsyncClassification;
    }
  }
  id v9 = self->_asyncClassifierQueue;
  os_unfair_lock_unlock(p_asyncClassifierQueueLock);
  if (a3) {
    *a3 = v9;
  }

  return !supportsAsyncClassification;
}

- (MLClassifier)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 validateAsClassifierDescriptionAndReturnError:a5])
  {
    v12.receiver = self;
    v12.super_class = (Class)MLClassifier;
    self = [(MLModel *)&v12 initWithDescription:v8 configuration:v9];
    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)classifierResultFromOutputFeatures:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MLModel *)self modelDescription];
  id v8 = [v7 predictedFeatureName];

  id v9 = [(MLModel *)self modelDescription];
  id v10 = [v9 outputDescriptionsByName];
  id v11 = [v10 objectForKeyedSubscript:v8];
  uint64_t v12 = [v11 type];

  if (!v8)
  {
    if (a4)
    {
      v20 = @"Cannot determine predictedFeatureName for this classifier";
LABEL_11:
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v20, v32);
      id v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
LABEL_12:
    id v19 = 0;
    goto LABEL_38;
  }
  if ((v12 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (a4)
    {
      v32 = v8;
      v20 = @"Invalid classifier: predicted feature '%@' is not described as int or string";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v13 = [(MLModel *)self modelDescription];
  v14 = [v13 predictedProbabilitiesName];

  v15 = [(MLModel *)self modelDescription];
  v16 = [v15 outputDescriptionsByName];
  v17 = [v16 objectForKeyedSubscript:v14];
  uint64_t v18 = [v17 type];

  if (v14 && v18 != 6)
  {
    if (a4)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:@"Invalid classifier: predicted probs '%@' is not described as dictionary", v14];
      id v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
    goto LABEL_37;
  }
  if (v14)
  {
    id v21 = [v6 featureValueForName:v14];
    if (v21)
    {
      id v22 = v21;
      if ([v21 type] == v18)
      {
        id v23 = [v22 dictionaryValue];
        if (v12 == 1) {
          +[MLClassifierResult resultWithIntClassProbability:v23 additionalFeatures:v6];
        }
        else {
        id v19 = +[MLClassifierResult resultWithStringClassProbability:v23 additionalFeatures:v6];
        }
        goto LABEL_35;
      }
      if (a4)
      {
        id v23 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v22 type]);
        v28 = +[MLFeatureTypeUtils descriptionForType:v18];
        *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Predicted probabilities '%@' is of type %@ not the expected %@", v8, v23, v28];

        id v19 = 0;
LABEL_35:

        goto LABEL_36;
      }
      goto LABEL_30;
    }
  }
  id v24 = [v6 featureValueForName:v8];
  id v22 = v24;
  if (v24)
  {
    if ([v24 type] == v12)
    {
      uint64_t v25 = [v22 type];
      if (v25 == 1)
      {
        id v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v22, "int64Value"));
        v33 = v23;
        v34 = &unk_1EF11A568;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        uint64_t v27 = +[MLClassifierResult resultWithIntClassProbability:v26];
        goto LABEL_34;
      }
      if (v25 == 3)
      {
        id v23 = [v22 stringValue];
        v35 = v23;
        v36[0] = &unk_1EF11A568;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
        uint64_t v27 = +[MLClassifierResult resultWithStringClassProbability:v26];
LABEL_34:
        id v19 = (void *)v27;

        goto LABEL_35;
      }
    }
    else if (a4)
    {
      v29 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v22 type]);
      v30 = +[MLFeatureTypeUtils descriptionForType:v12];
      *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Predicted feature '%@' is of type %@ not the expected %@", v8, v29, v30];
    }
LABEL_30:
    id v19 = 0;
    goto LABEL_36;
  }
  if (!a4) {
    goto LABEL_30;
  }
  +[MLModelErrorUtils featureTypeErrorWithFormat:@"Predicted feature named '%@' was not output by pipeline", v8];
  id v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

LABEL_37:
LABEL_38:

  return v19;
}

+ (id)predictionFromFeatures:(id)a3 classifier:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = [v9 classify:a3 options:a5 error:a6];
  id v11 = [v9 modelDescription];
  uint64_t v12 = [v11 predictedClassFeatureDescription];
  BOOL v13 = [v9 modelDescription];

  v14 = [v13 classProbabilityFeatureDescription];
  v15 = [v10 asFeatureDictionaryWithPredictedClassDescription:v12 classProbabilityDescription:v14];

  return v15;
}

- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MLClassifier;
  id v9 = [(MLModel *)&v15 initDescriptionOnlyWithSpecification:a3 configuration:v8 error:a5];
  id v10 = v9;
  if (v9
    && ([v9 modelDescription],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 validateAsClassifierDescriptionAndReturnError:a5],
        v11,
        (v12 & 1) == 0))
  {
    id v13 = 0;
  }
  else
  {
    id v13 = v10;
  }

  return v13;
}

@end