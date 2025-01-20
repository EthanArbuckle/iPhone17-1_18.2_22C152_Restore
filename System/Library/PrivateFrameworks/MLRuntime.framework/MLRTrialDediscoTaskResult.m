@interface MLRTrialDediscoTaskResult
+ (id)baseKeyFromFormat:(id)a3 variables:(id)a4;
- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7;
- (BOOL)submitForTask:(id)a3 error:(id *)a4;
- (BOOL)submitWithTRIClient:(id)a3 error:(id *)a4;
- (MLRTrialDediscoTaskResult)initWithJSONResult:(id)a3 identifier:(id)a4;
- (MLRTrialDediscoTaskResult)initWithJSONResult:(id)a3 namespaceName:(id)a4 factorName:(id)a5 additionalKeyVariables:(id)a6;
- (NSDictionary)additionalKeyVariables;
- (NSString)namespaceName;
- (NSString)recipeFactorName;
- (id)description;
- (id)variablesFromTrialClient:(id)a3;
@end

@implementation MLRTrialDediscoTaskResult

+ (id)baseKeyFromFormat:(id)a3 variables:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v34 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"format cannot be nil" userInfo:0];
    objc_exception_throw(v34);
  }
  v7 = v6;
  v8 = [MEMORY[0x263F089D8] string];
  v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"{}$"];
  if (![v5 length])
  {
LABEL_21:
    id v30 = v8;
    goto LABEL_34;
  }
  unint64_t v10 = 0;
  v11 = @"%c";
  while (1)
  {
    uint64_t v12 = [v5 characterAtIndex:v10];
    if (v12 == 36) {
      break;
    }
    uint64_t v13 = v12;
    if (v12 != 92)
    {
      unint64_t v14 = v10 + 1;
LABEL_19:
      objc_msgSend(v8, "appendFormat:", v11, v13);
      unint64_t v10 = v14;
      goto LABEL_20;
    }
    unint64_t v14 = v10 + 1;
    if (v10 + 1 >= [v5 length] || objc_msgSend(v5, "characterAtIndex:", v10 + 1) != 36) {
      goto LABEL_19;
    }
    [v8 appendString:@"$"];
    v10 += 2;
LABEL_20:
    if (v10 >= [v5 length]) {
      goto LABEL_21;
    }
  }
  uint64_t v15 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v9, 0, v10 + 1, objc_msgSend(v5, "length") + ~v10);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:]();
    }
    goto LABEL_32;
  }
  uint64_t v17 = v15;
  uint64_t v18 = v16;
  if ([v5 characterAtIndex:v15] != 123)
  {
    v31 = [MEMORY[0x263F3A438] coreChannel];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_32:

      goto LABEL_33;
    }
LABEL_25:
    +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:].cold.5();
    goto LABEL_32;
  }
  uint64_t v19 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v9, 0, v17 + 1, objc_msgSend(v5, "length") - (v17 + v18));
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:]();
    }
    goto LABEL_32;
  }
  uint64_t v21 = v19;
  uint64_t v22 = v20;
  if ([v5 characterAtIndex:v19] != 125)
  {
    v31 = [MEMORY[0x263F3A438] coreChannel];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    goto LABEL_25;
  }
  if (v17 + 1 == v21)
  {
    v31 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:]();
    }
    goto LABEL_32;
  }
  v23 = objc_msgSend(v5, "substringWithRange:", v17 + 1, v21 + ~v17);
  v24 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v23;
    _os_log_debug_impl(&dword_21C376000, v24, OS_LOG_TYPE_DEBUG, "Expanding var=%@", buf, 0xCu);
  }

  v25 = [v7 objectForKeyedSubscript:v23];

  if (v25)
  {
    v26 = NSString;
    [v7 objectForKeyedSubscript:v23];
    v28 = v27 = v11;
    v29 = [v26 stringWithFormat:@"%@", v28];
    [v8 appendString:v29];

    v11 = v27;
    unint64_t v10 = v21 + v22;

    goto LABEL_20;
  }
  v33 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:].cold.4();
  }

LABEL_33:
  id v30 = 0;
LABEL_34:

  return v30;
}

- (MLRTrialDediscoTaskResult)initWithJSONResult:(id)a3 namespaceName:(id)a4 factorName:(id)a5 additionalKeyVariables:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v24 = (void *)MEMORY[0x263EFF940];
    uint64_t v25 = *MEMORY[0x263EFF4A0];
    v26 = @"JSONResult cannot be nil";
    goto LABEL_10;
  }
  if (!v11)
  {
    v24 = (void *)MEMORY[0x263EFF940];
    uint64_t v25 = *MEMORY[0x263EFF4A0];
    v26 = @"namespaceName cannot be nil";
    goto LABEL_10;
  }
  if (!v12)
  {
    v24 = (void *)MEMORY[0x263EFF940];
    uint64_t v25 = *MEMORY[0x263EFF4A0];
    v26 = @"factorName cannot be nil";
LABEL_10:
    id v27 = [v24 exceptionWithName:v25 reason:v26 userInfo:0];
    objc_exception_throw(v27);
  }
  unint64_t v14 = v13;
  v28.receiver = self;
  v28.super_class = (Class)MLRTrialDediscoTaskResult;
  uint64_t v15 = [(MLRTrialTaskResult *)&v28 initWithJSONResult:v10];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    namespaceName = v15->_namespaceName;
    v15->_namespaceName = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    recipeFactorName = v15->_recipeFactorName;
    v15->_recipeFactorName = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    additionalKeyVariables = v15->_additionalKeyVariables;
    v15->_additionalKeyVariables = (NSDictionary *)v20;

    uint64_t v22 = v15;
  }

  return v15;
}

- (MLRTrialDediscoTaskResult)initWithJSONResult:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"DediscoUploadPrototype"]) {
    v7 = [[MLRTrialDediscoTaskResult alloc] initWithJSONResult:v6 namespaceName:@"PPM_DIRECT_UPLOAD" factorName:@"DediscoUploadPrototype" additionalKeyVariables:0];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  namespaceName = self->_namespaceName;
  recipeFactorName = self->_recipeFactorName;
  v8 = [(MLRTrialTaskResult *)self JSONResult];
  v9 = [v3 stringWithFormat:@"%@\n(%@, %@\n\t%@)\n", v5, namespaceName, recipeFactorName, v8];

  return v9;
}

- (id)variablesFromTrialClient:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  v3 = [a3 experimentIdentifiersWithNamespaceName:self->_namespaceName];
  v4 = v3;
  if (v3)
  {
    v10[0] = @"experimentId";
    id v5 = [v3 experimentId];
    v11[0] = v5;
    v10[1] = @"deploymentId";
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "deploymentId"));
    v11[1] = v6;
    v10[2] = @"treatmentId";
    v7 = [v4 treatmentId];
    v11[2] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFFA78];
  }

  return v8;
}

- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v12 objectForKeyedSubscript:@"type"];
  [v15 isEqual:@"decimal"];

  uint64_t v16 = objc_opt_new();
  LOBYTE(a7) = [v16 record:v14 data:v13 encodingSchema:v12 metadata:v11 errorOut:a7];

  return (char)a7;
}

- (BOOL)submitWithTRIClient:(id)a3 error:(id *)a4
{
  v68[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!objc_opt_class())
  {
    id v47 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Trial Framework is not loaded" userInfo:0];
    objc_exception_throw(v47);
  }
  if (!v6)
  {
    v48 = (void *)MEMORY[0x263EFF940];
    uint64_t v49 = *MEMORY[0x263EFF4A0];
    v50 = [NSString stringWithFormat:@"Trial client must not be nil"];
    id v51 = [v48 exceptionWithName:v49 reason:v50 userInfo:0];

    objc_exception_throw(v51);
  }
  [v6 refresh];
  v7 = [v6 levelForFactor:self->_recipeFactorName withNamespaceName:self->_namespaceName];
  v8 = [v7 fileValue];
  char v9 = [v8 hasPath];

  if (v9)
  {
    id v10 = NSURL;
    id v11 = [v7 fileValue];
    id v12 = [v11 path];
    id v13 = [v10 fileURLWithPath:v12 isDirectory:0];

    id v57 = 0;
    id v14 = [[MLRTrialDediscoRecipe alloc] initWithAssetURL:v13 configOverride:0 error:&v57];
    id v15 = v57;
    if (v14)
    {
      v56 = a4;
      uint64_t v16 = [(MLRTrialDediscoTaskResult *)self variablesFromTrialClient:v6];
      uint64_t v17 = [(MLRTrialDediscoTaskResult *)self additionalKeyVariables];

      if (v17)
      {
        uint64_t v18 = (void *)[v16 mutableCopy];
        uint64_t v19 = [(MLRTrialDediscoTaskResult *)self additionalKeyVariables];
        [v18 addEntriesFromDictionary:v19];

        uint64_t v16 = v18;
      }
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = [(MLRTrialDediscoRecipe *)v14 baseKeyFormat];
      uint64_t v22 = [v20 baseKeyFromFormat:v21 variables:v16];

      if (v22)
      {
        v53 = v16;
        v55 = v13;
        v23 = [MEMORY[0x263F3A438] coreChannel];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v45 = [(MLRTrialTaskResult *)self JSONResult];
          v46 = [(MLRTrialDediscoRecipe *)v14 encodingSchema];
          *(_DWORD *)buf = 138412802;
          v60 = v45;
          __int16 v61 = 2112;
          v62 = v22;
          __int16 v63 = 2112;
          v64 = v46;
          _os_log_debug_impl(&dword_21C376000, v23, OS_LOG_TYPE_DEBUG, "Recording data=%@, key=%@, encodingSchema=%@", buf, 0x20u);
        }
        v24 = [(MLRTrialTaskResult *)self JSONResult];
        v58 = v24;
        uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
        v26 = [(MLRTrialDediscoRecipe *)v14 encodingSchema];
        id v27 = [(MLRTrialDediscoRecipe *)v14 mlrDediscoMetadata];
        BOOL v28 = [(MLRTrialDediscoTaskResult *)self record:v22 data:v25 encodingSchema:v26 metadata:v27 errorOut:v56];

        v29 = v53;
        id v13 = v55;
      }
      else
      {
        v36 = v13;
        v54 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F3A4A0];
        uint64_t v65 = *MEMORY[0x263F08320];
        uint64_t v37 = v16;
        v38 = NSString;
        v39 = [(MLRTrialDediscoRecipe *)v14 baseKeyFormat];
        v29 = v37;
        v40 = [v38 stringWithFormat:@"Fail to compute baseKey with format string=%@, variables=%@", v39, v37];
        v66 = v40;
        v41 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        v42 = [v54 errorWithDomain:v52 code:5007 userInfo:v41];

        v43 = [MEMORY[0x263F3A438] coreChannel];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[MLRTrialDediscoTaskResult submitWithTRIClient:error:]();
        }

        if (v56)
        {
          id v15 = v42;
          BOOL v28 = 0;
          id *v56 = v15;
        }
        else
        {
          BOOL v28 = 0;
          id v15 = v42;
        }
        id v13 = v36;
        uint64_t v22 = 0;
      }
    }
    else
    {
      v35 = [MEMORY[0x263F3A438] coreChannel];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[MLRTrialDediscoTaskResult submitWithTRIClient:error:]();
      }

      if (a4)
      {
        id v15 = v15;
        BOOL v28 = 0;
        *a4 = v15;
      }
      else
      {
        BOOL v28 = 0;
      }
    }
  }
  else
  {
    id v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F3A4A0];
    uint64_t v67 = *MEMORY[0x263F08320];
    v32 = [NSString stringWithFormat:@"Nil fileValue for TRILevel=%@, namespace=%@, factor=%@", v7, self->_namespaceName, self->_recipeFactorName];
    v68[0] = v32;
    v33 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
    id v15 = [v30 errorWithDomain:v31 code:5007 userInfo:v33];

    id v34 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLRTrialDediscoTaskResult submitWithTRIClient:error:]();
    }

    if (a4)
    {
      id v15 = v15;
      BOOL v28 = 0;
      *a4 = v15;
    }
    else
    {
      BOOL v28 = 0;
    }
  }

  return v28;
}

- (BOOL)submitForTask:(id)a3 error:(id *)a4
{
  id v6 = [a3 triClient];
  LOBYTE(a4) = [(MLRTrialDediscoTaskResult *)self submitWithTRIClient:v6 error:a4];

  return (char)a4;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (NSString)recipeFactorName
{
  return self->_recipeFactorName;
}

- (NSDictionary)additionalKeyVariables
{
  return self->_additionalKeyVariables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalKeyVariables, 0);
  objc_storeStrong((id *)&self->_recipeFactorName, 0);

  objc_storeStrong((id *)&self->_namespaceName, 0);
}

+ (void)baseKeyFromFormat:variables:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "No starting mark in format=%@", v2, v3, v4, v5, v6);
}

+ (void)baseKeyFromFormat:variables:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "No matching } in format=%@", v2, v3, v4, v5, v6);
}

+ (void)baseKeyFromFormat:variables:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Empty variable=%@", v2, v3, v4, v5, v6);
}

+ (void)baseKeyFromFormat:variables:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21C376000, v0, v1, "Find unsupported variable=%@, variables=%@");
}

+ (void)baseKeyFromFormat:variables:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Invalid format=%@", v2, v3, v4, v5, v6);
}

- (void)submitWithTRIClient:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21C376000, v0, v1, "Fail to read configuration from URL=%@, error=%@");
}

- (void)submitWithTRIClient:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

@end