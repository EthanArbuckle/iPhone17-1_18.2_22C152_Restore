@interface MLModelAssetDescription
- (BOOL)usesMultiFunctionSyntax;
- (MLModelAssetDescription)initWithCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4;
- (MLModelAssetDescription)initWithModelDescription:(id)a3;
- (MLModelAssetDescription)initWithModelDescriptionsByFunctionName:(id)a3 functionNames:(id)a4 defaultFunctionName:(id)a5;
- (MLModelAssetDescription)initWithRawModelDescription:(id)a3;
- (MLModelDescription)defaultModelDescription;
- (NSArray)functionNames;
- (NSDictionary)modelDescriptionsByFunctionName;
- (NSString)defaultFunctionName;
- (id)assetDescriptionBySettingClassLabels:(id)a3;
- (id)assetDescriptionBySettingClassLabels:(id)a3 functionName:(id)a4;
- (id)description;
- (id)initFromModelDescriptionSpecification:(_MLModelDescriptionSpecification *)a3;
- (id)initFromModelSpecification:(_MLModelSpecification *)a3;
- (id)modelDescriptionOfFunctionNamed:(id)a3;
@end

@implementation MLModelAssetDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFunctionName, 0);
  objc_storeStrong((id *)&self->_modelDescriptionsByFunctionName, 0);

  objc_storeStrong((id *)&self->_functionNames, 0);
}

- (id)assetDescriptionBySettingClassLabels:(id)a3
{
  id v4 = a3;
  v5 = [(MLModelAssetDescription *)self defaultFunctionName];
  v6 = [(MLModelAssetDescription *)self assetDescriptionBySettingClassLabels:v4 functionName:v5];

  return v6;
}

- (MLModelAssetDescription)initWithCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4
{
  id v5 = [[MLModelDescription alloc] initFromRawCompiledModelArchive:a3 error:a4];
  if (v5)
  {
    self = [(MLModelAssetDescription *)self initWithRawModelDescription:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MLModelAssetDescription)initWithRawModelDescription:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28 = self;
  id v5 = [v4 metadata];
  v6 = [v4 functionDescriptions];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v13 = [v12 modelDescriptionBySettingMetadata:v5];
        v14 = [v12 functionName];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  if (![v7 count]) {
    [v7 setObject:v4 forKeyedSubscript:&stru_1EF0E81D0];
  }

  id v15 = v4;
  v16 = (void *)MEMORY[0x1E4F1CA48];
  v17 = [v15 functionDescriptions];
  v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v19 = [v15 functionDescriptions];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = [*(id *)(*((void *)&v29 + 1) + 8 * j) functionName];
        [v18 addObject:v23];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }

  v24 = [v15 defaultFunctionName];
  if (v24)
  {
    v25 = [v15 defaultFunctionName];
  }
  else
  {
    v25 = &stru_1EF0E81D0;
  }

  v26 = [(MLModelAssetDescription *)v28 initWithModelDescriptionsByFunctionName:v7 functionNames:v18 defaultFunctionName:v25];
  return v26;
}

- (id)assetDescriptionBySettingClassLabels:(id)a3 functionName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v9 = [(MLModelAssetDescription *)self modelDescriptionsByFunctionName];
  uint64_t v10 = (void *)[v8 initWithDictionary:v9 copyItems:1];

  v11 = [v10 objectForKeyedSubscript:v7];
  [v11 setClassLabels:v6];
  v12 = [MLModelAssetDescription alloc];
  v13 = [(MLModelAssetDescription *)self functionNames];
  v14 = [(MLModelAssetDescription *)self defaultFunctionName];
  id v15 = [(MLModelAssetDescription *)v12 initWithModelDescriptionsByFunctionName:v10 functionNames:v13 defaultFunctionName:v14];

  return v15;
}

- (NSArray)functionNames
{
  return self->_functionNames;
}

- (MLModelDescription)defaultModelDescription
{
  v3 = [(MLModelAssetDescription *)self defaultFunctionName];
  id v4 = [(MLModelAssetDescription *)self modelDescriptionsByFunctionName];
  id v5 = [v4 objectForKeyedSubscript:v3];

  return (MLModelDescription *)v5;
}

- (NSString)defaultFunctionName
{
  return self->_defaultFunctionName;
}

- (NSDictionary)modelDescriptionsByFunctionName
{
  return self->_modelDescriptionsByFunctionName;
}

- (MLModelAssetDescription)initWithModelDescriptionsByFunctionName:(id)a3 functionNames:(id)a4 defaultFunctionName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MLModelAssetDescription;
  v12 = [(MLModelAssetDescription *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelDescriptionsByFunctionName, a3);
    objc_storeStrong((id *)&v13->_functionNames, a4);
    objc_storeStrong((id *)&v13->_defaultFunctionName, a5);
  }

  return v13;
}

- (BOOL)usesMultiFunctionSyntax
{
  v2 = [(MLModelAssetDescription *)self functionNames];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(MLModelAssetDescription *)self functionNames];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(MLModelAssetDescription *)self defaultFunctionName];
    [v3 appendFormat:@"Multi-function model (default function: %@)\n", v6];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    obuint64_t j = [(MLModelAssetDescription *)self functionNames];
    uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v11 = [(MLModelAssetDescription *)self modelDescriptionOfFunctionNamed:v10];
          [v3 appendFormat:@"Function: %@:\n", v10];
          v12 = [v11 description];
          v13 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  "];
          [v3 appendFormat:@"%@", v13];

          [v3 appendFormat:@"\n"];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v14 = [(MLModelAssetDescription *)self defaultModelDescription];
    objc_super v15 = [v14 description];
    [v3 appendFormat:@"%@", v15];
  }

  return v3;
}

- (id)modelDescriptionOfFunctionNamed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MLModelAssetDescription *)self functionNames];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = [(MLModelAssetDescription *)self functionNames];
      objc_super v15 = [v14 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      long long v19 = v15;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "The specified function name: %@ is not among the available function names: [%@].", buf, 0x16u);
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    id v9 = [(MLModelAssetDescription *)self functionNames];
    uint64_t v10 = [v9 componentsJoinedByString:@","];
    [v8 raise:*MEMORY[0x1E4F1C3C8], @"The specified function name: %@ is not among the available function names: [%@].", v4, v10 format];
  }
  id v11 = [(MLModelAssetDescription *)self modelDescriptionsByFunctionName];
  v12 = [v11 objectForKeyedSubscript:v4];

  return v12;
}

- (id)initFromModelDescriptionSpecification:(_MLModelDescriptionSpecification *)a3
{
  id v4 = [[MLModelDescription alloc] initFromRawModelDescriptionSpecification:a3];
  if (v4)
  {
    self = [(MLModelAssetDescription *)self initWithRawModelDescription:v4];
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)initFromModelSpecification:(_MLModelSpecification *)a3
{
  id v4 = [[MLModelDescription alloc] initFromRawModelSpecification:a3];
  if (v4)
  {
    self = [(MLModelAssetDescription *)self initWithRawModelDescription:v4];
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (MLModelAssetDescription)initWithModelDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 functionDescriptions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
    }
  }
  uint64_t v8 = [(MLModelAssetDescription *)self initWithRawModelDescription:v4];

  return v8;
}

@end