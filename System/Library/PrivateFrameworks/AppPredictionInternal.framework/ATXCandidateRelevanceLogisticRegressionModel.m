@interface ATXCandidateRelevanceLogisticRegressionModel
+ (BOOL)supportsSecureCoding;
- (ATXCandidateRelevanceLogisticRegressionModel)initWithCoder:(id)a3;
- (ATXCandidateRelevanceLogisticRegressionModel)initWithModel:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXCandidateRelevanceLogisticRegressionModel:(id)a3;
- (PMLLogisticRegressionModel)model;
- (float)predictForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5;
- (id)description;
- (id)featureContributionsDuringInferenceDescriptionForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5;
- (id)featureContributionsDuringInferenceForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5;
- (id)featureImportanceDescriptionForFeaturizationManager:(id)a3;
- (id)featureImportancesForFeaturizationManager:(id)a3;
- (unint64_t)modelType;
- (unint64_t)numberOfModelWeights;
- (unint64_t)numberOfNonZeroModelWeights;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXCandidateRelevanceLogisticRegressionModel

- (ATXCandidateRelevanceLogisticRegressionModel)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceLogisticRegressionModel;
  v6 = [(ATXCandidateRelevanceLogisticRegressionModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (float)predictForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  v6 = [a5 sparseFeatureVectorForContext:a3 candidate:a4];
  v7 = [(PMLLogisticRegressionModel *)self->_model predict:v6];
  v8 = [v7 objectAtIndexedSubscript:0];
  [v8 floatValue];
  float v10 = v9;

  return v10;
}

- (id)featureContributionsDuringInferenceDescriptionForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = [(ATXCandidateRelevanceLogisticRegressionModel *)self featureContributionsDuringInferenceForContext:a3 candidate:a4 featurizationManager:a5];
  v6 = [v5 keysSortedByValueUsingComparator:&__block_literal_global_173];
  v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v5 objectForKeyedSubscript:v13];
        [v14 floatValue];
        if (v15 >= 0.0) {
          [v7 appendString:@" "];
        }
        [v14 floatValue];
        [v7 appendFormat:@"%f for %@\n", v16, v13, (void)v18];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

uint64_t __136__ATXCandidateRelevanceLogisticRegressionModel_featureContributionsDuringInferenceDescriptionForContext_candidate_featurizationManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)featureContributionsDuringInferenceForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v42 = (id)objc_opt_new();
  id v11 = objc_alloc(MEMORY[0x1E4F93800]);
  v35 = v9;
  v36 = v8;
  v12 = [v10 featuresForContext:v8 candidate:v9];
  v43 = (void *)[v11 initWithNumbers:v12];

  uint64_t v13 = [(PMLLogisticRegressionModel *)self->_model weights];
  v14 = [v13 asMutableDenseVector];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v34 = v10;
  obuint64_t j = [v10 featurizers];
  uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  unint64_t v15 = 0;
  if (v39)
  {
    uint64_t v38 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(obj);
        }
        v17 = [*(id *)(*((void *)&v48 + 1) + 8 * i) featureValueNames];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v41 = v17;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v40 = i;
          uint64_t v20 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              v22 = v14;
              if (*(void *)v45 != v20) {
                objc_enumerationMutation(v41);
              }
              uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * j);
              v24 = NSString;
              v25 = (objc_class *)objc_opt_class();
              v26 = NSStringFromClass(v25);
              v27 = [v24 stringWithFormat:@"%@ (%@)", v26, v23];

              v14 = v22;
              [v22 valueAt:v15 + j];
              float v29 = v28;
              [v43 valueAt:v15 + j];
              if ((float)(v29 * v30) != 0.0)
              {
                v31 = objc_msgSend(NSNumber, "numberWithFloat:");
                [v42 setObject:v31 forKeyedSubscript:v27];
              }
            }
            uint64_t v19 = [v41 countByEnumeratingWithState:&v44 objects:v52 count:16];
            v15 += j;
          }
          while (v19);
          uint64_t i = v40;
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v39);
  }

  if (v15 < [v14 count])
  {
    [v14 valueAt:v15];
    v32 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v42 setObject:v32 forKeyedSubscript:@"Bias"];
  }
  return v42;
}

- (unint64_t)modelType
{
  return 1;
}

- (id)description
{
  v3 = objc_opt_new();
  [v3 appendFormat:@"Model Type: PMLLogisticRegressionModel \n"];
  v4 = [(PMLLogisticRegressionModel *)self->_model weights];
  objc_msgSend(v3, "appendFormat:", @"# Model Weights: %d\n", objc_msgSend(v4, "length"));

  objc_msgSend(v3, "appendFormat:", @"# Non-Zero Model Weights: %lu", -[ATXCandidateRelevanceLogisticRegressionModel numberOfNonZeroModelWeights](self, "numberOfNonZeroModelWeights"));
  id v5 = (void *)[v3 copy];

  return v5;
}

- (unint64_t)numberOfModelWeights
{
  v2 = [(PMLLogisticRegressionModel *)self->_model weights];
  unint64_t v3 = (int)[v2 length];

  return v3;
}

- (unint64_t)numberOfNonZeroModelWeights
{
  id v3 = [(PMLLogisticRegressionModel *)self->_model weights];
  uint64_t v4 = [v3 values];

  id v5 = [(PMLLogisticRegressionModel *)self->_model weights];
  int v6 = [v5 length];

  if (v6 < 1) {
    return 0;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  do
  {
    float v9 = *(float *)(v4 + 4 * v7);
    uint64_t v10 = v9 > 0.0 || v9 < 0.0;
    v8 += v10;
    ++v7;
    id v11 = [(PMLLogisticRegressionModel *)self->_model weights];
    int v12 = [v11 length];
  }
  while (v7 < v12);
  return v8;
}

- (id)featureImportancesForFeaturizationManager:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v28 = (id)objc_opt_new();
  id v5 = [(PMLLogisticRegressionModel *)self->_model weights];
  int v6 = [v5 asMutableDenseVector];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v22 = v4;
  obuint64_t j = [v4 featurizers];
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  unint64_t v7 = 0;
  if (v25)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        float v9 = [*(id *)(*((void *)&v33 + 1) + 8 * i) featureValueNames];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v27 = v9;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v26 = i;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v27);
              }
              uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * j);
              unint64_t v15 = NSString;
              float v16 = (objc_class *)objc_opt_class();
              v17 = NSStringFromClass(v16);
              uint64_t v18 = [v15 stringWithFormat:@"%@ (%@)", v17, v14];

              [v6 valueAt:v7 + j];
              uint64_t v19 = objc_msgSend(NSNumber, "numberWithFloat:");
              [v28 setObject:v19 forKeyedSubscript:v18];
            }
            uint64_t v11 = [v27 countByEnumeratingWithState:&v29 objects:v37 count:16];
            v7 += j;
          }
          while (v11);
          uint64_t i = v26;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }

  if (v7 < [v6 count])
  {
    [v6 valueAt:v7];
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v28 setObject:v20 forKeyedSubscript:@"Bias"];
  }
  return v28;
}

- (id)featureImportanceDescriptionForFeaturizationManager:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXCandidateRelevanceLogisticRegressionModel *)self featureImportancesForFeaturizationManager:a3];
  id v4 = [v3 keysSortedByValueUsingComparator:&__block_literal_global_52];
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v3 objectForKeyedSubscript:v11];
        [v12 floatValue];
        if (v13 != 0.0)
        {
          [v12 floatValue];
          if (v14 >= 0.0) {
            [v5 appendString:@" "];
          }
          [v12 floatValue];
          [v5 appendFormat:@"%f * %@\n", v15, v11, (void)v17];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

uint64_t __100__ATXCandidateRelevanceLogisticRegressionModel_featureImportanceDescriptionForFeaturizationManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXCandidateRelevanceLogisticRegressionModel *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXCandidateRelevanceLogisticRegressionModel *)self isEqualToATXCandidateRelevanceLogisticRegressionModel:v5];

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceLogisticRegressionModel:(id)a3
{
  id v4 = self->_model;
  id v5 = v4;
  if (v4 == *((PMLLogisticRegressionModel **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[PMLLogisticRegressionModel isEqual:](v4, "isEqual:");
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  PMLBuildChunkFile();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 encodeObject:v4 forKey:@"logisticRegressionModelData"];
}

- (ATXCandidateRelevanceLogisticRegressionModel)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __atxlog_handle_relevance_model();
  uint64_t v8 = [v4 robustDecodeObjectOfClass:v6 forKey:@"logisticRegressionModelData" withCoder:v5 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXCandidateRelevanceLogisticRegressionModel" errorCode:-1 logHandle:v7];

  if (v8)
  {
    objc_opt_class();
    uint64_t v9 = PMLReadChunkData();
    if (v9)
    {
      self = [(ATXCandidateRelevanceLogisticRegressionModel *)self initWithModel:v9];
      uint64_t v10 = self;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (PMLLogisticRegressionModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end