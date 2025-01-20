@interface DESNumericStatsRecorder
+ (id)constructErrorWith:(id)a3;
- (BOOL)donateData:(id)a3 toKey:(id)a4 withMetadata:(id)a5 recorder:(id)a6;
- (BOOL)record:(id)a3 data:(id)a4 dataTypeContent:(id)a5 metadata:(id)a6 errorOut:(id *)a7;
- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7;
@end

@implementation DESNumericStatsRecorder

- (BOOL)record:(id)a3 data:(id)a4 dataTypeContent:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v12 count]
    && ([v12 objectAtIndexedSubscript:0],
        v15 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) != 0))
  {
    v17 = objc_alloc_init(DESDecimalEncoder);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obj = v12;
    uint64_t v37 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v37)
    {
      id v33 = v12;
      uint64_t v36 = *(void *)v42;
      id v34 = v14;
      v35 = v17;
      v39 = a7;
LABEL_5:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v41 + 1) + 8 * v18);
        v20 = [(DESDecimalEncoder *)v17 encodeDecimalData:v19 forKey:v11 withSchemas:v13 errorOut:a7];
        v21 = +[DESLogging coreChannel];
        v22 = v21;
        if (!v20) {
          break;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
          *(_DWORD *)buf = 138412546;
          v46 = v11;
          __int16 v47 = 2112;
          v48 = v30;
          _os_log_debug_impl(&dword_1BECCB000, v22, OS_LOG_TYPE_DEBUG, "key=%@, encoded data length %@ successfully", buf, 0x16u);
        }
        v23 = objc_alloc_init(DESNumericMetadataEncoder);
        v24 = -[DESNumericMetadataEncoder encodeNumberVector:toLength:](v23, "encodeNumberVector:toLength:", v20, [v20 count]);
        v25 = objc_alloc_init(DESDPFloatValueRecorder);
        BOOL v26 = [(DESNumericStatsRecorder *)self donateData:v24 toKey:v11 withMetadata:v14 recorder:v25];
        if (v26)
        {
          v27 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v11;
            _os_log_debug_impl(&dword_1BECCB000, v27, OS_LOG_TYPE_DEBUG, "key=%@, successfully recorded data", buf, 0xCu);
          }
        }
        else
        {
          id v28 = v13;
          v27 = [NSString stringWithFormat:@"key=%@, failed to record data", v11];
          v29 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v27;
            _os_log_error_impl(&dword_1BECCB000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          if (v39)
          {
            id *v39 = [(id)objc_opt_class() constructErrorWith:v27];
          }
          id v13 = v28;
          id v14 = v34;
        }

        if (!v26)
        {
          BOOL v31 = 0;
          id v12 = v33;
          v17 = v35;
          goto LABEL_28;
        }
        ++v18;
        v17 = v35;
        a7 = v39;
        if (v37 == v18)
        {
          BOOL v31 = 1;
          uint64_t v37 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v37) {
            goto LABEL_5;
          }
          goto LABEL_33;
        }
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[DESNumericStatsRecorder record:data:dataTypeContent:metadata:errorOut:](v19, (uint64_t)v11, v22);
      }

      BOOL v31 = 0;
LABEL_33:
      id v12 = v33;
      goto LABEL_28;
    }
    BOOL v31 = 1;
  }
  else
  {
    [NSString stringWithFormat:@"key=%@, data to be encoded is malformed, should be a non-empty array of dictionaries", v11];
    v17 = (DESDecimalEncoder *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      *a7 = [(id)objc_opt_class() constructErrorWith:v17];
    }
    obj = +[DESLogging coreChannel];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[DESSparsification reportErrorWithErrorStr:error:]((uint64_t)v17, obj);
    }
    BOOL v31 = 0;
  }
LABEL_28:

  return v31;
}

- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [v14 objectForKeyedSubscript:@"dataContentTypes"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = [v14 objectForKeyedSubscript:@"dataTypeContent"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = *MEMORY[0x1E4F1C3C8];
      v22 = [NSString stringWithFormat:@"key=%@, '%@' or '%@' has wrong type, value=%@", v12, @"dataContentTypes", @"dataTypeContent", v17];
      id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];

      objc_exception_throw(v23);
    }
    v16 = (void *)v17;
  }
  BOOL v18 = [(DESNumericStatsRecorder *)self record:v12 data:v13 dataTypeContent:v16 metadata:v15 errorOut:a7];

  return v18;
}

+ (id)constructErrorWith:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v3 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2013 userInfo:v6];

  return v7;
}

- (BOOL)donateData:(id)a3 toKey:(id)a4 withMetadata:(id)a5 recorder:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((unint64_t)[v9 length] > 0xE7EF0)
  {
    id v13 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v37 = v10;
      __int16 v38 = 2048;
      uint64_t v39 = [v9 length];
      __int16 v40 = 1024;
      int v41 = 950000;
      _os_log_error_impl(&dword_1BECCB000, v13, OS_LOG_TYPE_ERROR, "key=%@, data length %lu bytes is larger than limit %u", buf, 0x1Cu);
    }
LABEL_16:
    char v32 = 0;
    goto LABEL_17;
  }
  id v14 = [v11 objectForKeyedSubscript:@"epsilon"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_14:
    id v13 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[DESNumericStatsRecorder donateData:toKey:withMetadata:recorder:]((uint64_t)v10, v13);
    }
    goto LABEL_16;
  }
  id v15 = [v11 objectForKeyedSubscript:@"delta"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_14;
  }
  id v13 = [v11 objectForKeyedSubscript:@"MomentsAccountantParameters"];

  if (v13)
  {
    uint64_t v17 = [v11 objectForKeyedSubscript:@"MomentsAccountantParameters"];
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
    {
      id v13 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[DESNumericStatsRecorder donateData:toKey:withMetadata:recorder:]((uint64_t)v10, v13);
      }
      goto LABEL_16;
    }
    id v13 = [v11 objectForKeyedSubscript:@"MomentsAccountantParameters"];
  }
  v19 = [v11 objectForKeyedSubscript:@"epsilon"];
  [v19 doubleValue];
  double v21 = v20;

  v22 = [v11 objectForKeyedSubscript:@"delta"];
  [v22 doubleValue];
  double v24 = v23;

  v25 = [[DESGaussianAlgorithmParameters alloc] initWith:v10 epsilon:v13 delta:v21 clippingBound:v24 momentsAccountantParameters:1.0];
  BOOL v26 = v25;
  if (v25)
  {
    [(DESGaussianAlgorithmParameters *)v25 addPerChunkParametersWith:1 numChunks:1.0];
    v27 = (void *)MEMORY[0x1E4F1CA60];
    id v28 = [(DESGaussianAlgorithmParameters *)v26 parameters];
    v35[1] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:2];
    v30 = [v27 dictionaryWithDictionary:v29];

    BOOL v31 = [v11 objectForKeyedSubscript:@"DediscoTaskConfig"];
    if (v31) {
      [v30 setObject:v31 forKeyedSubscript:@"DediscoTaskConfig"];
    }
    char v32 = [v12 record:v10 data:v9 metadata:v30];
  }
  else
  {
    v30 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[DESNumericStatsRecorder donateData:toKey:withMetadata:recorder:]((uint64_t)v10, v30);
    }
    char v32 = 0;
  }

LABEL_17:
  return v32;
}

- (void)record:(NSObject *)a3 data:dataTypeContent:metadata:errorOut:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 description];
  int v6 = 138412546;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1BECCB000, a3, OS_LOG_TYPE_ERROR, "key=%@, failed to encode decimals: '%@'", (uint8_t *)&v6, 0x16u);
}

- (void)donateData:(uint64_t)a1 toKey:(NSObject *)a2 withMetadata:recorder:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "key=%@, failed to initialize privacy parameters", (uint8_t *)&v2, 0xCu);
}

- (void)donateData:(uint64_t)a1 toKey:(NSObject *)a2 withMetadata:recorder:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  id v5 = @"MomentsAccountantParameters";
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "key=%@, metadata '%@' is malformed, if present, must be a dictionary", (uint8_t *)&v2, 0x16u);
}

- (void)donateData:(uint64_t)a1 toKey:(NSObject *)a2 withMetadata:recorder:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 138412802;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  id v5 = @"epsilon";
  __int16 v6 = 2112;
  uint64_t v7 = @"delta";
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "key=%@, metadata '%@' or '%@' is malformed, must be valid real numbers", (uint8_t *)&v2, 0x20u);
}

@end