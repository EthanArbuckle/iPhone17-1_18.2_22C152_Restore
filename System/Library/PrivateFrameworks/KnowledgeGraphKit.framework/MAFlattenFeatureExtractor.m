@interface MAFlattenFeatureExtractor
- (MAFlattenFeatureExtractor)initWithName:(id)a3 featureExtractors:(id)a4;
- (NSArray)featureExtractors;
- (id)defaultFloatVectorWithError:(id *)a3;
- (id)featureNames;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)name;
@end

@implementation MAFlattenFeatureExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureExtractors, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)featureExtractors
{
  return self->_featureExtractors;
}

- (id)featureNames
{
  return self->_featureNames;
}

- (id)name
{
  return self->_name;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v8);
        }
        --v13;
      }
      while (v13);
      v11 += v10;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  v14 = +[MAFloatMatrix zerosWithRows:v11 columns:0];
  v15 = [(MAFlattenFeatureExtractor *)self featureExtractors];
  uint64_t v16 = [v15 count];

  v29 = v7;
  v31 = [v7 progressReportersForParallelOperationsWithCount:v16];
  id v17 = 0;
  if (v16)
  {
    uint64_t v18 = 0;
    uint64_t v19 = v16 - 1;
    v20 = v14;
    do
    {
      v21 = v17;
      v22 = (void *)MEMORY[0x1D25FA040]();
      v23 = [(MAFlattenFeatureExtractor *)self featureExtractors];
      v24 = [v23 objectAtIndexedSubscript:v18];

      v25 = [v31 objectAtIndexedSubscript:v18];
      id v33 = v17;
      v26 = [v24 floatMatrixWithEntities:v8 progressReporter:v25 error:&v33];
      id v17 = v33;

      if (v26)
      {
        v14 = [v20 matrixByAppendingColumnsOfMatrix:v26];
      }
      else
      {
        v14 = 0;
      }

      if (!v26) {
        break;
      }
      v20 = v14;
    }
    while (v19 != v18++);
  }
  if (a5) {
    *a5 = v17;
  }

  return v14;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = objc_alloc_init(MAMutableFloatVector);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(MAFlattenFeatureExtractor *)self featureExtractors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        v14 = (void *)MEMORY[0x1D25FA040]();
        id v17 = v12;
        v15 = [v13 defaultFloatVectorWithError:&v17];
        id v9 = v17;

        if (!v15)
        {

          v5 = 0;
          goto LABEL_12;
        }
        [(MAMutableFloatVector *)v5 appendVector:v15];

        ++v11;
        uint64_t v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_12:

  if (a3) {
    *a3 = v9;
  }

  return v5;
}

- (MAFlattenFeatureExtractor)initWithName:(id)a3 featureExtractors:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)MAFlattenFeatureExtractor;
  uint64_t v8 = [(MAFlattenFeatureExtractor *)&v38 init];
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = [v6 copy];
      name = v8->_name;
      v8->_name = (NSString *)v9;
    }
    else
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"Flatten["];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v35;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = [*(id *)(*((void *)&v34 + 1) + 8 * v16) name];
            [v11 appendFormat:@"...%@, ", v17];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v14);
      }

      [v11 appendString:@"]"];
      name = v8->_name;
      v8->_name = (NSString *)v11;
    }

    long long v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = v7;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v30 + 1) + 8 * v23) featureNames];
          [(NSArray *)v18 addObjectsFromArray:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v21);
    }

    featureNames = v8->_featureNames;
    v8->_featureNames = v18;
    v26 = v18;

    uint64_t v27 = [v19 copy];
    featureExtractors = v8->_featureExtractors;
    v8->_featureExtractors = (NSArray *)v27;
  }
  return v8;
}

@end