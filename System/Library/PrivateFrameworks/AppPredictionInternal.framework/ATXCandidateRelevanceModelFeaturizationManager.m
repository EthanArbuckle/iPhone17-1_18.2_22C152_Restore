@interface ATXCandidateRelevanceModelFeaturizationManager
+ (BOOL)supportsSecureCoding;
+ (id)denseLabelVectorFromDataPoints:(id)a3;
+ (id)labelsFromDataPoints:(id)a3;
- (ATXCandidateRelevanceModelFeaturizationManager)initWithCoder:(id)a3;
- (ATXCandidateRelevanceModelFeaturizationManager)initWithFeaturizers:(id)a3;
- (ATXCandidateRelevanceModelFeaturizationManager)initWithImmutableFeaturizers:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXCandidateRelevanceModelFeaturizationManager:(id)a3;
- (NSArray)featurizers;
- (id)featureNames;
- (id)featuresForContext:(id)a3 candidate:(id)a4;
- (id)sparseFeatureMatrixFromDataPoints:(id)a3;
- (id)sparseFeatureVectorForContext:(id)a3 candidate:(id)a4;
- (unint64_t)numberOfInputDimensions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXCandidateRelevanceModelFeaturizationManager

- (ATXCandidateRelevanceModelFeaturizationManager)initWithFeaturizers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "immutableCopy", (void)v14);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [(ATXCandidateRelevanceModelFeaturizationManager *)self initWithImmutableFeaturizers:v5];
  return v12;
}

- (ATXCandidateRelevanceModelFeaturizationManager)initWithImmutableFeaturizers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelFeaturizationManager;
  id v6 = [(ATXCandidateRelevanceModelFeaturizationManager *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featurizers, a3);
  }

  return v7;
}

- (id)featureNames
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(ATXCandidateRelevanceModelFeaturizationManager *)self featurizers];
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v4;
        id v5 = *(void **)(*((void *)&v25 + 1) + 8 * v4);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v6 = [v5 featureValueNames];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              v12 = NSString;
              v13 = (objc_class *)objc_opt_class();
              long long v14 = NSStringFromClass(v13);
              long long v15 = [v12 stringWithFormat:@"%@ (%@)", v14, v11];

              [v3 addObject:v15];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }

  return v3;
}

- (unint64_t)numberOfInputDimensions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(ATXCandidateRelevanceModelFeaturizationManager *)self featurizers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) dimensions];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)featuresForContext:(id)a3 candidate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v9 = [(ATXCandidateRelevanceModelFeaturizationManager *)self featurizers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) featureVectorForContext:v6 candidate:v7];
        [v8 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)labelsFromDataPoints:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "engaged", (void)v12));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXCandidateRelevanceModelFeaturizationManager *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXCandidateRelevanceModelFeaturizationManager *)self isEqualToATXCandidateRelevanceModelFeaturizationManager:v5];

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceModelFeaturizationManager:(id)a3
{
  uint64_t v4 = (id *)a3;
  unint64_t v5 = [(ATXCandidateRelevanceModelFeaturizationManager *)self numberOfInputDimensions];
  if (v5 == [v4 numberOfInputDimensions]
    && (NSUInteger v6 = -[NSArray count](self->_featurizers, "count"), v6 == [v4[1] count]))
  {
    if ([(NSArray *)self->_featurizers count])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [(NSArray *)self->_featurizers objectAtIndexedSubscript:v7];
        long long v9 = [v4[1] objectAtIndexedSubscript:v7];
        char v10 = [v8 isEqual:v9];

        if ((v10 & 1) == 0) {
          break;
        }
        ++v7;
      }
      while ([(NSArray *)self->_featurizers count] > v7);
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXCandidateRelevanceModelFeaturizationManager)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = (void *)MEMORY[0x1E4F93B90];
  long long v9 = __atxlog_handle_relevance_model();
  char v10 = [v8 robustDecodeObjectOfClasses:v7 forKey:@"featurizationManagerFeaturizers" withCoder:v5 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXCandidateRelevanceModelFeaturizationManager" errorCode:-1 logHandle:v9];

  if (v10)
  {
    self = [(ATXCandidateRelevanceModelFeaturizationManager *)self initWithImmutableFeaturizers:v10];
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSArray)featurizers
{
  return self->_featurizers;
}

- (void).cxx_destruct
{
}

+ (id)denseLabelVectorFromDataPoints:(id)a3
{
  id v3 = [a1 labelsFromDataPoints:a3];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F93800]) initWithNumbers:v3];

  return v4;
}

- (id)sparseFeatureVectorForContext:(id)a3 candidate:(id)a4
{
  uint64_t v4 = [(ATXCandidateRelevanceModelFeaturizationManager *)self featuresForContext:a3 candidate:a4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F93800]) initWithNumbers:v4];
  uint64_t v6 = [MEMORY[0x1E4F93850] sparseVectorFromDense:v5];

  return v6;
}

- (id)sparseFeatureMatrixFromDataPoints:(id)a3
{
  id v23 = a3;
  sparse_dimension v4 = [v23 count];
  long long v22 = self;
  sparse_dimension v5 = [(ATXCandidateRelevanceModelFeaturizationManager *)self numberOfInputDimensions];
  uint64_t v6 = sparse_matrix_create_float(v4, v5);
  sparse_dimension v21 = v4;
  if (v4)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      context = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v8 = [v23 objectAtIndexedSubscript:i];
      long long v9 = [v8 context];
      char v10 = [v8 candidate];
      uint64_t v11 = [(ATXCandidateRelevanceModelFeaturizationManager *)v22 featuresForContext:v9 candidate:v10];

      if ([v11 count] == v5)
      {
        if (v5) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, v22, @"ATXCandidateRelevanceModelFeaturizationManager.m", 144, @"Invalid shape, all rows must be the same length (row %lu length: %lu, first row length: %lu)", i, objc_msgSend(v11, "count"), v5 object file lineNumber description];

        if (v5)
        {
LABEL_5:
          uint64_t v12 = 0;
          for (uint64_t j = 0; j != v5; ++j)
          {
            long long v14 = [v11 objectAtIndexedSubscript:j];
            [v14 floatValue];
            float v16 = v15;

            if (v16 != 0.0) {
              sparse_insert_entry_float(v6, v16, (int)i, v12 >> 32);
            }
            v12 += 0x100000000;
          }
        }
      }
    }
  }
  sparse_commit(v6);
  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F93848]) initWithSparseMatrix:v6];

  return v18;
}

@end