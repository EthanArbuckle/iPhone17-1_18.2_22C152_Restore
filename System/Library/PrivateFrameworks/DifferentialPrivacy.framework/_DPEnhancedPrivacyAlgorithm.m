@interface _DPEnhancedPrivacyAlgorithm
+ (BOOL)isEnhancedPrivacyAlgorithm:(id)a3;
+ (BOOL)isMetadataValid:(id)a3;
+ (BOOL)verifyEnhancedDPParamsForKey:(id)a3 withMetadata:(id)a4;
+ (id)allowedDataTypesForKey:(id)a3 withMetadata:(id)a4;
+ (id)findMultipleDonationForKey:(id)a3 inRecords:(id)a4;
@end

@implementation _DPEnhancedPrivacyAlgorithm

+ (id)allowedDataTypesForKey:(id)a3 withMetadata:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a4 objectForKeyedSubscript:@"AllowedDataTypes"];
  v8 = +[_DPKeyNames keyPropertiesForKey:v6];
  v9 = [v8 namespaceName];
  if (v9)
  {
    v10 = +[_DPNamespaceParameters initParametersForNamespace:v9];
    v11 = [v10 allowedDataTypes];
    v12 = v11;
    if (v11 && [v11 count])
    {
      if (![v7 count])
      {
        v20 = +[_DPLog framework];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DC55E000, v20, OS_LOG_TYPE_INFO, "No allowed data types passed; default is selected",
            buf,
            2u);
        }

        id v17 = v12;
        goto LABEL_9;
      }
      v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
      int v14 = [v7 isSubsetOfSet:v13];

      if (v14)
      {
        v15 = (void *)MEMORY[0x1E4F1C978];
        v16 = [v7 allObjects];
        id v17 = [v15 arrayWithArray:v16];

LABEL_9:
        goto LABEL_13;
      }
      v18 = +[_DPLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v21 = NSStringFromSelector(a2);
        v26 = [v7 allObjects];
        v22 = [v26 componentsJoinedByString:@", "];
        v23 = [v12 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138413314;
        v28 = v21;
        __int16 v29 = 2112;
        id v30 = v22;
        __int16 v31 = 2112;
        id v32 = v23;
        __int16 v33 = 2112;
        v34 = v9;
        __int16 v35 = 2112;
        id v36 = v6;
        _os_log_error_impl(&dword_1DC55E000, v18, OS_LOG_TYPE_ERROR, "%@: Recieved data types [%@] are not a subset of approved data types [%@] for namespace %@ with key %@", buf, 0x34u);

LABEL_22:
      }
    }
    else
    {
      v18 = +[_DPLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v21 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v28 = v21;
        __int16 v29 = 2112;
        id v30 = v9;
        __int16 v31 = 2112;
        id v32 = v6;
        _os_log_error_impl(&dword_1DC55E000, v18, OS_LOG_TYPE_ERROR, "%@: No allowed list of data types found for namespace %@ with key %@", buf, 0x20u);
        goto LABEL_22;
      }
    }

    id v17 = 0;
    goto LABEL_9;
  }
  v10 = +[_DPLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v24 = NSStringFromSelector(a2);
    v25 = [v8 propertiesName];
    *(_DWORD *)buf = 138412802;
    v28 = v24;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v25;
    _os_log_error_impl(&dword_1DC55E000, v10, OS_LOG_TYPE_ERROR, "%@: No namespace name found for key: %@ with property name: %@", buf, 0x20u);
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

+ (BOOL)isEnhancedPrivacyAlgorithm:(id)a3
{
  if (a3)
  {
    v4 = [a3 objectForKeyedSubscript:@"EnhancedDifferentialPrivacyParameters"];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 objectForKeyedSubscript:@"useEnhancedDifferentialPrivacyAlgorithm"];
      BOOL v7 = v6 != 0;

      if (!v6)
      {
        v10 = +[_DPLog framework];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          +[_DPEnhancedPrivacyAlgorithm isEnhancedPrivacyAlgorithm:](a2, v10);
        }
        goto LABEL_11;
      }
      v8 = [v5 objectForKeyedSubscript:@"useEnhancedDifferentialPrivacyAlgorithm"];
      int v9 = [v8 BOOLValue];

      if (v9)
      {
        v10 = +[_DPLog framework];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1DC55E000, v10, OS_LOG_TYPE_INFO, "Enhanced differential privacy budget control is set", v12, 2u);
        }
LABEL_11:

        goto LABEL_12;
      }
    }
    BOOL v7 = 0;
LABEL_12:

    return v7;
  }
  return 0;
}

+ (BOOL)isMetadataValid:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v19[0] = @"EnhancedDifferentialPrivacyParameters";
    v19[1] = @"AllowedDataTypes";
    v19[2] = @"DonationID";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v9, (void)v14);

          if (!v10)
          {
            v12 = +[_DPLog framework];
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              +[_DPEnhancedPrivacyAlgorithm isMetadataValid:](v9, v12);
            }

            BOOL v11 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_14:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)verifyEnhancedDPParamsForKey:(id)a3 withMetadata:(id)a4
{
  v53[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:@"EnhancedDifferentialPrivacyParameters"];
  v53[0] = @"localDifferentialPrivacyBudget";
  v53[1] = @"cohortAggregateDifferentialPrivacyBudget";
  v53[2] = @"minCohortSize";
  v53[3] = @"useEnhancedDifferentialPrivacyAlgorithm";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * i)];

        if (!v14)
        {
          v20 = +[_DPLog framework];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            +[_DPEnhancedPrivacyAlgorithm verifyEnhancedDPParamsForKey:withMetadata:]((uint64_t)v6, v20);
          }
          BOOL v29 = 0;
          long long v15 = v9;
          goto LABEL_29;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v52 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v15 = [a1 allowedDataTypesForKey:v6 withMetadata:v7];
  if (v15)
  {
    long long v16 = [v7 objectForKeyedSubscript:@"EnhancedDifferentialPrivacyParameters"];
    long long v17 = [v16 objectForKeyedSubscript:@"localDifferentialPrivacyBudget"];
    [v17 floatValue];
    float v19 = v18;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v20 = v15;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v34 = v7;
      id v35 = v6;
      v23 = 0;
      uint64_t v24 = *(void *)v38;
      obj = v20;
      while (2)
      {
        uint64_t v25 = 0;
        v26 = v23;
        do
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * v25);
          v23 = +[_DPDataTypeParameters initParametersForDataType:v27];

          [v23 localPrivacyBudget];
          BOOL v29 = v19 <= v28;
          if (v19 > v28)
          {
            float v30 = v28;
            __int16 v31 = +[_DPLog framework];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218498;
              double v46 = v19;
              __int16 v47 = 2112;
              uint64_t v48 = v27;
              __int16 v49 = 2048;
              double v50 = v30;
              _os_log_error_impl(&dword_1DC55E000, v31, OS_LOG_TYPE_ERROR, "Query local privacy budget %f is greater than that of %@ data type, %f.", buf, 0x20u);
            }

            v20 = obj;
            goto LABEL_26;
          }
          ++v25;
          v26 = v23;
        }
        while (v22 != v25);
        v20 = obj;
        uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
        if (v22) {
          continue;
        }
        break;
      }
LABEL_26:

      long long v15 = v20;
      id v7 = v34;
      id v6 = v35;
    }
    else
    {
      BOOL v29 = 1;
      long long v15 = v20;
    }
LABEL_29:
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

+ (id)findMultipleDonationForKey:(id)a3 inRecords:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v5 = a4;
  id v6 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v11 metadata];
        v13 = [v12 objectForKeyedSubscript:@"DonationID"];
        if (v13)
        {
          id v14 = [NSString stringWithFormat:@"%@_%@", v21, v13];
        }
        else
        {
          id v14 = v21;
        }
        long long v15 = v14;
        long long v16 = [v6 objectForKeyedSubscript:v14];

        if (!v16)
        {
          long long v17 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          [v6 setObject:v17 forKeyedSubscript:v15];
        }
        float v18 = [v6 objectForKeyedSubscript:v15];
        [v18 addObject:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (void)isEnhancedPrivacyAlgorithm:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromSelector(a1);
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = @"useEnhancedDifferentialPrivacyAlgorithm";
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "%@: Malformed enhanced differential privacy parameters; no value found for the key; %@",
    (uint8_t *)&v4,
    0x16u);
}

+ (void)isMetadataValid:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Malformed enhanced differential privacy metadata; %@ not found.",
    (uint8_t *)&v2,
    0xCu);
}

+ (void)verifyEnhancedDPParamsForKey:(uint64_t)a1 withMetadata:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Malformed enhanced differential privacy parameters. %@ not found.", (uint8_t *)&v2, 0xCu);
}

@end