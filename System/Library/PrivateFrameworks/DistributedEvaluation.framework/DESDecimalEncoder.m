@interface DESDecimalEncoder
+ (id)constructErrorWith:(id)a3;
- (id)encodeDecimalData:(id)a3 forKey:(id)a4 withSchemas:(id)a5 errorOut:(id *)a6;
@end

@implementation DESDecimalEncoder

- (id)encodeDecimalData:(id)a3 forKey:(id)a4 withSchemas:(id)a5 errorOut:(id *)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 allKeys];
  v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_0];

  unint64_t v13 = [v12 count];
  v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    float v18 = sqrtf((float)v13);
    uint64_t v19 = *(void *)v57;
    v53 = v15;
    id v54 = v10;
    id v51 = v9;
    v55 = v14;
LABEL_3:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v57 != v19) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void *)(*((void *)&v56 + 1) + 8 * v20);
      v22 = [v10 objectForKeyedSubscript:v21];
      if (!v22) {
        break;
      }
      v23 = v22;
      v24 = [v22 objectForKeyedSubscript:@"upperBound"];
      v25 = [v23 objectForKeyedSubscript:@"lowerBound"];
      if (!v24 || ([v24 floatValue], objc_msgSend(v24, "floatValue"), fabsf(v26) == INFINITY))
      {
        id v9 = v51;
        v33 = [NSString stringWithFormat:@"key=%@, missing or malformed '%@' in encoding schema for data '%@', must be a real or integer number", v51, @"upperBound", v21];
        v41 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v33;
          goto LABEL_43;
        }
LABEL_22:

LABEL_23:
        if (a6)
        {
          *a6 = [(id)objc_opt_class() constructErrorWith:v33];
        }
LABEL_30:

        id v10 = v54;
        v14 = v55;
LABEL_31:

        id v40 = 0;
        goto LABEL_32;
      }
      if (!v25 || ([v25 floatValue], objc_msgSend(v25, "floatValue"), fabsf(v27) == INFINITY))
      {
        id v9 = v51;
        v33 = [NSString stringWithFormat:@"key=%@, missing or malformed '%@' in encoding schema for data '%@', must be a real or integer number", v51, @"lowerBound", v21];
        v41 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v33;
LABEL_43:
          _os_log_error_impl(&dword_1BECCB000, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      [v25 floatValue];
      float v29 = v28;
      [v24 floatValue];
      float v31 = *(float *)&v30;
      if (v29 >= *(float *)&v30)
      {
        v46 = NSString;
        v47 = [NSNumber numberWithFloat:v30];
        *(float *)&double v48 = v29;
        v49 = [NSNumber numberWithFloat:v48];
        id v9 = v51;
        v33 = [v46 stringWithFormat:@"key=%@, malformed encoding schema for data '%@', '%@'=%@ must be higher than '%@'=%@", v51, v21, @"upperBound", v47, @"lowerBound", v49];

        v50 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v33;
          _os_log_error_impl(&dword_1BECCB000, v50, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        id v15 = v53;
        goto LABEL_23;
      }
      v32 = [v8 objectForKeyedSubscript:v21];
      v33 = v32;
      if (!v32 || ([v32 floatValue], objc_msgSend(v33, "floatValue"), fabsf(v34) == INFINITY))
      {
        id v9 = v51;
        v42 = [NSString stringWithFormat:@"key=%@, malformed data for '%@', must be a valid real number", v51, v21];
        v43 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v42;
          _os_log_error_impl(&dword_1BECCB000, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        if (a6)
        {
          *a6 = [(id)objc_opt_class() constructErrorWith:v42];
        }

        id v15 = v53;
        goto LABEL_30;
      }
      v35 = NSNumber;
      [v33 floatValue];
      *(float *)&double v37 = (float)((float)((float)((float)(v36 - v29) + (float)(v36 - v29)) / (float)(v31 - v29)) + -1.0)
                     / v18;
      v38 = [v35 numberWithFloat:v37];

      v39 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v61 = v51;
        __int16 v62 = 2112;
        uint64_t v63 = v21;
        __int16 v64 = 2112;
        v65 = v38;
        _os_log_debug_impl(&dword_1BECCB000, v39, OS_LOG_TYPE_DEBUG, "key=%@, encoded metric '%@' to value '%@'", buf, 0x20u);
      }

      [v55 addObject:v38];
      ++v20;
      id v15 = v53;
      id v10 = v54;
      if (v17 == v20)
      {
        uint64_t v17 = [v53 countByEnumeratingWithState:&v56 objects:v66 count:16];
        id v9 = v51;
        v14 = v55;
        if (v17) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    id v9 = v51;
    v23 = [NSString stringWithFormat:@"key=%@, data element '%@' has no schema", v51, v21];
    v45 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[DESSparsification reportErrorWithErrorStr:error:]((uint64_t)v23, v45);
    }

    v14 = v55;
    if (a6)
    {
      *a6 = [(id)objc_opt_class() constructErrorWith:v23];
    }
    goto LABEL_31;
  }
LABEL_18:

  id v40 = v14;
LABEL_32:

  return v40;
}

uint64_t __67__DESDecimalEncoder_encodeDecimalData_forKey_withSchemas_errorOut___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
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

@end