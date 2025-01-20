@interface CSFMil2bnnsCompilationConfig
- (BOOL)debugInfo;
- (BOOL)optimizeForSize;
- (BOOL)singleThread;
- (CSFMil2bnnsCompilationConfig)initWithConfigPath:(id)a3 errOut:(id *)a4;
- (NSString)funcName;
- (unint64_t)predefinedOptimizations;
@end

@implementation CSFMil2bnnsCompilationConfig

- (void).cxx_destruct
{
}

- (BOOL)optimizeForSize
{
  return self->_optimizeForSize;
}

- (unint64_t)predefinedOptimizations
{
  return self->_predefinedOptimizations;
}

- (BOOL)debugInfo
{
  return self->_debugInfo;
}

- (BOOL)singleThread
{
  return self->_singleThread;
}

- (NSString)funcName
{
  return self->_funcName;
}

- (CSFMil2bnnsCompilationConfig)initWithConfigPath:(id)a3 errOut:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CSFMil2bnnsCompilationConfig;
  v7 = [(CSFMil2bnnsCompilationConfig *)&v32 init];
  if (!v7) {
    goto LABEL_29;
  }
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v8 fileExistsAtPath:v6] & 1) == 0)
  {
    if (a4)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v17 = [NSString stringWithFormat:@"config file not found for %@", v6];
      v40[0] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      *a4 = [v16 errorWithDomain:@"com.apple.corespeech" code:2452 userInfo:v18];
    }
    goto LABEL_28;
  }
  v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
  id v31 = 0;
  v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v31];
  id v11 = v31;
  if (!v11)
  {
    v19 = [v10 objectForKeyedSubscript:@"funcName"];
    if (v19)
    {
      uint64_t v20 = [v10 objectForKeyedSubscript:@"funcName"];
      funcName = v7->_funcName;
      v7->_funcName = (NSString *)v20;
    }
    else
    {
      funcName = v7->_funcName;
      v7->_funcName = (NSString *)@"main";
    }

    v22 = [v10 objectForKeyedSubscript:@"debugInfo"];
    if (v22)
    {
      v23 = [v10 objectForKeyedSubscript:@"debugInfo"];
      v7->_debugInfo = [v23 BOOLValue];
    }
    else
    {
      v7->_debugInfo = 0;
    }

    v24 = [v10 objectForKeyedSubscript:@"singleThread"];
    if (v24)
    {
      v25 = [v10 objectForKeyedSubscript:@"singleThread"];
      v7->_singleThread = [v25 BOOLValue];
    }
    else
    {
      v7->_singleThread = 1;
    }

    v26 = [v10 objectForKeyedSubscript:@"optimizeForSize"];
    if (v26)
    {
      v27 = [v10 objectForKeyedSubscript:@"optimizeForSize"];
      v7->_optimizeForSize = [v27 BOOLValue];
    }
    else
    {
      v7->_optimizeForSize = 0;
    }

    v14 = [v10 objectForKeyedSubscript:@"predefinedOptimizations"];
    if (v14)
    {
      v28 = [v10 objectForKeyedSubscript:@"predefinedOptimizations"];
      v7->_predefinedOptimizations = [v28 unsignedIntValue];
    }
    else
    {
      v7->_predefinedOptimizations = 0;
    }
    goto LABEL_26;
  }
  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSFMil2bnnsCompilationConfig initWithConfigPath:errOut:]";
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Cannot parse to mil2bnns model config: %@", buf, 0x16u);
  }
  if (a4)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v14 = [NSString stringWithFormat:@"Cannot parse to mil2bnns model config: %@", v6];
    v34 = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    *a4 = [v13 errorWithDomain:@"com.apple.corespeech" code:2452 userInfo:v15];

LABEL_26:
  }

  if (!v11)
  {
LABEL_29:
    v29 = v7;
    goto LABEL_30;
  }
LABEL_28:
  v29 = 0;
LABEL_30:

  return v29;
}

@end