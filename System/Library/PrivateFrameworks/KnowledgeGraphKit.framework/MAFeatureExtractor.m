@interface MAFeatureExtractor
+ (BOOL)shouldRetryFailures;
+ (void)setShouldRetryFailures:(BOOL)a3;
- (NSArray)featureNames;
- (NSString)name;
- (id)defaultFloatVectorWithError:(id *)a3;
- (id)featureVectorWithEntity:(id)a3 error:(id *)a4;
- (id)featureVectorsWithEntities:(id)a3 entityLabels:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)floatVectorWithRetryForEntity:(id)a3 error:(id *)a4;
@end

@implementation MAFeatureExtractor

+ (void)setShouldRetryFailures:(BOOL)a3
{
  _shouldRetryFailures = a3;
}

+ (BOOL)shouldRetryFailures
{
  return _shouldRetryFailures;
}

- (id)featureVectorsWithEntities:(id)a3 entityLabels:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = [(MAFeatureExtractor *)self floatMatrixWithEntities:a3 progressReporter:a5 error:a6];
  v12 = [MADataFrame alloc];
  v13 = [(MAFeatureExtractor *)self name];
  v14 = [(MAFeatureExtractor *)self featureNames];
  v15 = [(MADataFrame *)v12 initWithName:v13 rowLabels:v10 columnLabels:v14 matrix:v11];

  return v15;
}

- (id)floatVectorWithRetryForEntity:(id)a3 error:(id *)a4
{
  int v7 = 3;
  while (1)
  {
    v8 = [(MAFeatureExtractor *)self floatVectorWithEntity:a3 error:a4];
    if (v8) {
      break;
    }
    if (!--v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
  }
  if (a4) {
    *a4 = 0;
  }
LABEL_7:
  return v8;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MAMutableFloatMatrix);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v22 = v9;
    v23 = a5;
    id v13 = 0;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      uint64_t v15 = 0;
      v16 = v13;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * v15);
        v18 = (void *)MEMORY[0x1D25FA040]();
        if ([(id)objc_opt_class() shouldRetryFailures])
        {
          v26 = v16;
          v19 = &v26;
          [(MAFeatureExtractor *)self floatVectorWithRetryForEntity:v17 error:&v26];
        }
        else
        {
          v25 = v16;
          v19 = &v25;
          [(MAFeatureExtractor *)self floatVectorWithEntity:v17 error:&v25];
        v20 = };
        id v13 = *v19;

        if (!v20)
        {

          id v10 = 0;
          goto LABEL_14;
        }
        [(MAMutableFloatMatrix *)v10 appendRow:v20];

        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
LABEL_14:
    id v9 = v22;
    a5 = v23;
  }
  else
  {
    id v13 = 0;
  }

  if (a5 && !v10) {
    *a5 = v13;
  }

  return v10;
}

- (id)featureVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(MAFeatureExtractor *)self name];
  id v8 = [(MAFeatureExtractor *)self featureNames];
  id v9 = [(MAFeatureExtractor *)self floatVectorWithEntity:v6 error:a4];

  id v10 = [[MASeries alloc] initWithName:v7 labels:v8 vector:v9];
  return v10;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:&v13 count:1];
  id v9 = +[MAProgressReporter ignoreProgress];

  id v10 = [(MAFeatureExtractor *)self floatMatrixWithEntities:v8 progressReporter:v9 error:a4];
  uint64_t v11 = [v10 row:0];

  return v11;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  KGAbstractMethodException(self, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSArray)featureNames
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)name
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end