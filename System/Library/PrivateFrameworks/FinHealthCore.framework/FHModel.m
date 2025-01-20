@interface FHModel
- (BOOL)_loadModel:(id)a3;
- (FHModel)initWithModelURL:(id)a3;
- (FHModel)initWithModelURL:(id)a3 modelName:(id)a4;
- (MLModel)mlModel;
- (NSString)modelName;
- (NSString)modelVersion;
- (NSURL)compiledModelURL;
- (id)_predict:(id)a3;
- (id)predictClassProbabilities:(id)a3;
- (void)_deleteModelFile:(id)a3;
- (void)cleanUp;
- (void)recordModelScore:(id)a3;
- (void)setCompiledModelURL:(id)a3;
- (void)setMlModel:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelVersion:(id)a3;
@end

@implementation FHModel

- (FHModel)initWithModelURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FHModel;
  v5 = [(FHModel *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_modelVersion, @"0");
    [(FHModel *)v6 _loadModel:v4];
  }

  return v6;
}

- (FHModel)initWithModelURL:(id)a3 modelName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FHModel;
  objc_super v8 = [(FHModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelVersion, @"0");
    objc_storeStrong((id *)&v9->_modelName, a4);
    [(FHModel *)v9 _loadModel:v6];
  }

  return v9;
}

- (BOOL)_loadModel:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v4 lastPathComponent];
    id v7 = [v6 stringByDeletingPathExtension];

    objc_super v8 = NSURL;
    uint64_t v9 = FHModelDirectory();
    v10 = [v8 fileURLWithPath:v9];

    id v45 = 0;
    LOBYTE(v9) = [v5 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v45];
    id v11 = v45;
    if (v9)
    {
      v12 = [NSString stringWithFormat:@"%@.mlmodelc", v7];
      v13 = [v10 URLByAppendingPathComponent:v12];
      compiledModelURL = self->_compiledModelURL;
      self->_compiledModelURL = v13;

      v15 = (void *)MEMORY[0x263F00D28];
      v16 = [MEMORY[0x263F00D30] defaultOptions];
      id v44 = v11;
      v17 = [v15 compileSpecificationAtURL:v4 toURL:v10 options:v16 error:&v44];
      id v18 = v44;

      if (v17)
      {
        v19 = objc_alloc_init(MEMORY[0x263F00D98]);
        v20 = [(FHModel *)self modelName];
        [v19 setModelDisplayName:v20];

        v21 = self->_compiledModelURL;
        id v43 = v18;
        v22 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v21 configuration:v19 error:&v43];
        id v11 = v43;

        mlModel = self->_mlModel;
        self->_mlModel = v22;

        BOOL v24 = v11 == 0;
        if (v11)
        {
          v25 = FinHealthLogObject(@"FinHealthCore");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v41 = [v10 path];
            uint64_t v26 = [v11 localizedDescription];
            *(_DWORD *)buf = 136315650;
            v47 = "-[FHModel _loadModel:]";
            __int16 v48 = 2112;
            id v49 = v41;
            __int16 v50 = 2112;
            uint64_t v51 = v26;
            v27 = (void *)v26;
            _os_log_impl(&dword_24E029000, v25, OS_LOG_TYPE_ERROR, "%s failed to load model %@ with error: %@", buf, 0x20u);
          }
        }
        else
        {
          v42 = v7;
          v32 = [(MLModel *)self->_mlModel modelDescription];
          v33 = [v32 metadata];
          uint64_t v34 = [v33 objectForKey:*MEMORY[0x263F00D08]];
          modelVersion = self->_modelVersion;
          p_modelVersion = (id *)&self->_modelVersion;
          id *p_modelVersion = (id)v34;

          if (!*p_modelVersion
            || (int v37 = [*p_modelVersion isEqualToString:&stru_27001CD40], v38 = p_modelVersion, v37))
          {
            v38 = (id *)defaultPredictedRealtimeVersion;
          }
          id v39 = *v38;
          v25 = *p_modelVersion;
          id *p_modelVersion = v39;
          id v7 = v42;
        }
      }
      else
      {
        v19 = FinHealthLogObject(@"FinHealthCore");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v30 = [v10 path];
          v31 = [v18 localizedDescription];
          *(_DWORD *)buf = 136315906;
          v47 = "-[FHModel _loadModel:]";
          __int16 v48 = 2112;
          id v49 = v4;
          __int16 v50 = 2112;
          uint64_t v51 = (uint64_t)v30;
          __int16 v52 = 2112;
          v53 = v31;
          _os_log_impl(&dword_24E029000, v19, OS_LOG_TYPE_ERROR, "%s failed to compile modelURL spec at path: %@ to tempDir path: %@ with error: %@", buf, 0x2Au);
        }
        BOOL v24 = 0;
        id v11 = v18;
      }
    }
    else
    {
      v17 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v28 = [v10 path];
        v29 = [v11 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v47 = "-[FHModel _loadModel:]";
        __int16 v48 = 2112;
        id v49 = v28;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v29;
        _os_log_impl(&dword_24E029000, v17, OS_LOG_TYPE_ERROR, "%s failed to create directory at path: %@ with error: %@", buf, 0x20u);
      }
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 1;
  }

  return v24;
}

- (id)_predict:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  mlModel = self->_mlModel;
  if (mlModel)
  {
    v5 = (objc_class *)MEMORY[0x263F00D38];
    id v6 = a3;
    id v17 = 0;
    id v7 = (void *)[[v5 alloc] initWithDictionary:v6 error:&v17];

    id v8 = v17;
    id v16 = v8;
    uint64_t v9 = [(MLModel *)mlModel predictionFromFeatures:v7 error:&v16];
    id v10 = v16;

    if (v10)
    {
      id v11 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        modelName = self->_modelName;
        v13 = [v10 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v19 = "-[FHModel _predict:]";
        __int16 v20 = 2112;
        v21 = modelName;
        __int16 v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_24E029000, v11, OS_LOG_TYPE_ERROR, "%s Error in getting predictions for model %@ Error %@", buf, 0x20u);
      }
      id v14 = 0;
    }
    else
    {
      id v14 = v9;
    }
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

- (id)predictClassProbabilities:(id)a3
{
  v3 = [(FHModel *)self _predict:a3];
  id v4 = [v3 featureValueForName:@"classProbability"];
  v5 = [v4 dictionaryValue];

  return v5;
}

- (void)cleanUp
{
}

- (void)_deleteModelFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v3 path];
    *(_DWORD *)buf = 136315394;
    id v14 = "-[FHModel _deleteModelFile:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_24E029000, v5, OS_LOG_TYPE_DEBUG, "%s Deleting file %@", buf, 0x16u);
  }
  id v12 = 0;
  int v7 = [v4 removeItemAtURL:v3 error:&v12];
  id v8 = v12;
  uint64_t v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    id v11 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[FHModel _deleteModelFile:]";
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_24E029000, v11, OS_LOG_TYPE_ERROR, "%s Error deleting file %@", buf, 0x16u);
    }
  }
}

- (void)recordModelScore:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __28__FHModel_recordModelScore___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1 = (void *)[objc_alloc(NSDictionary) initWithDictionary:*(void *)(a1 + 32)];
  v2 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    v5 = v1;
    _os_log_impl(&dword_24E029000, v2, OS_LOG_TYPE_DEBUG, "fhAnalyticsRecord: %@", (uint8_t *)&v4, 0xCu);
  }

  return v1;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (MLModel)mlModel
{
  return self->_mlModel;
}

- (void)setMlModel:(id)a3
{
}

- (NSURL)compiledModelURL
{
  return self->_compiledModelURL;
}

- (void)setCompiledModelURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiledModelURL, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end