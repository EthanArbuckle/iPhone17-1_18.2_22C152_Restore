@interface LCFModelStore
- (BOOL)clear;
- (BOOL)deleteModel:(id)a3;
- (BOOL)markModelTrained:(id)a3;
- (BOOL)setModelMetadata:(id)a3 key:(id)a4 value:(id)a5;
- (LCFModelStoreModelMetadataProvider)modelMetadataProvider;
- (NSString)key;
- (NSURL)emptyModelURL;
- (NSURL)modelStoreRootURL;
- (NSURL)modelStoreRootWithKeyURL;
- (NSURL)originalEmptyModelURL;
- (id)getBaseModelURL:(id)a3 modelConfig:(id)a4;
- (id)getModelConfig:(id)a3;
- (id)getModelMetadata:(id)a3;
- (id)getModelURL:(id)a3;
- (id)init:(id)a3 modelStoreRootURL:(id)a4;
- (id)init:(id)a3 modelStoreRootURL:(id)a4 originalEmptyModelURL:(id)a5;
- (id)listModelNames;
- (id)storeModel:(id)a3;
- (id)storeModel:(id)a3 modelConfig:(id)a4;
- (void)clear;
- (void)listModelNames;
@end

@implementation LCFModelStore

- (id)init:(id)a3 modelStoreRootURL:(id)a4 originalEmptyModelURL:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v52.receiver = self;
  v52.super_class = (Class)LCFModelStore;
  v12 = [(LCFModelStore *)&v52 init];
  if (v12)
  {
    LCFModelStoreLoggingUtilsInit();
    objc_storeStrong((id *)&v12->_key, a3);
    objc_storeStrong((id *)&v12->_modelStoreRootURL, a4);
    uint64_t v13 = [(NSURL *)v12->_modelStoreRootURL URLByAppendingPathComponent:v9];
    modelStoreRootWithKeyURL = v12->_modelStoreRootWithKeyURL;
    v12->_modelStoreRootWithKeyURL = (NSURL *)v13;

    v15 = [MEMORY[0x263F08850] defaultManager];
    v16 = v12->_modelStoreRootWithKeyURL;
    id v51 = 0;
    char v17 = [v15 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v51];
    id v18 = v51;

    v19 = LCFLogModelStore;
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
      {
        v20 = v12->_modelStoreRootWithKeyURL;
        *(_DWORD *)buf = 138412290;
        v54 = v20;
        _os_log_impl(&dword_2545B3000, v19, OS_LOG_TYPE_INFO, "created store directory %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
    {
      -[LCFModelStore init:modelStoreRootURL:originalEmptyModelURL:]();
    }
    v21 = [[LCFModelStoreModelMetadataProvider alloc] init:v12->_modelStoreRootWithKeyURL];
    modelMetadataProvider = v12->_modelMetadataProvider;
    v12->_modelMetadataProvider = v21;

    if (v11)
    {
      p_originalEmptyModelURL = &v12->_originalEmptyModelURL;
      objc_storeStrong((id *)&v12->_originalEmptyModelURL, a5);
      v24 = v12->_modelStoreRootWithKeyURL;
      v25 = [(NSURL *)v12->_originalEmptyModelURL lastPathComponent];
      uint64_t v26 = [(NSURL *)v24 URLByAppendingPathComponent:v25];
      p_emptyModelURL = &v12->_emptyModelURL;
      emptyModelURL = v12->_emptyModelURL;
      v12->_emptyModelURL = (NSURL *)v26;

      v29 = v12->_emptyModelURL;
      id v50 = v18;
      BOOL v30 = [(NSURL *)v29 checkResourceIsReachableAndReturnError:&v50];
      id v31 = v50;

      if (v30)
      {
        v32 = LCFLogModelStore;
        if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
        {
          v33 = *p_emptyModelURL;
          *(_DWORD *)buf = 138412290;
          v54 = v33;
          _os_log_impl(&dword_2545B3000, v32, OS_LOG_TYPE_INFO, "emptyModel exists in %@", buf, 0xCu);
        }
        id v18 = v31;
      }
      else
      {
        v34 = [MEMORY[0x263F08850] defaultManager];
        v35 = *p_originalEmptyModelURL;
        v36 = *p_emptyModelURL;
        id v49 = v31;
        char v37 = [v34 copyItemAtURL:v35 toURL:v36 error:&v49];
        id v18 = v49;

        v38 = LCFLogModelStore;
        if (v37)
        {
          if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
          {
            v39 = *p_originalEmptyModelURL;
            v40 = *p_emptyModelURL;
            *(_DWORD *)buf = 138412546;
            v54 = v39;
            __int16 v55 = 2112;
            v56 = v40;
            _os_log_impl(&dword_2545B3000, v38, OS_LOG_TYPE_INFO, "copied emptyModel from %@ to %@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
        {
          -[LCFModelStore init:modelStoreRootURL:originalEmptyModelURL:]();
        }
      }
      v41 = v12->_modelMetadataProvider;
      v42 = [(NSURL *)v12->_emptyModelURL lastPathComponent];
      v43 = [(LCFModelStoreModelMetadataProvider *)v41 getModelMetadata:v42];

      [v43 setIsOriginalEmptyModel:1];
      [v43 setIsAvailable:1];
      v44 = [MEMORY[0x263EFF910] now];
      [v43 setDateCreated:v44];

      v45 = +[LCFModelStoreUtils sha256ForURL:v12->_emptyModelURL];
      [v43 setSha256:v45];

      v46 = v12->_modelMetadataProvider;
      v47 = [(NSURL *)v12->_emptyModelURL lastPathComponent];
      [(LCFModelStoreModelMetadataProvider *)v46 setModelMetadata:v47 metadata:v43];
    }
  }

  return v12;
}

- (id)init:(id)a3 modelStoreRootURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)LCFModelStore;
  id v9 = [(LCFModelStore *)&v23 init];
  if (v9)
  {
    LCFModelStoreLoggingUtilsInit();
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v9->_modelStoreRootURL, a4);
    uint64_t v10 = [(NSURL *)v9->_modelStoreRootURL URLByAppendingPathComponent:v7];
    modelStoreRootWithKeyURL = v9->_modelStoreRootWithKeyURL;
    v9->_modelStoreRootWithKeyURL = (NSURL *)v10;

    v12 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v13 = v9->_modelStoreRootWithKeyURL;
    id v22 = 0;
    char v14 = [v12 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v15 = v22;

    v16 = LCFLogModelStore;
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
      {
        char v17 = v9->_modelStoreRootWithKeyURL;
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl(&dword_2545B3000, v16, OS_LOG_TYPE_INFO, "created store directory %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
    {
      -[LCFModelStore init:modelStoreRootURL:originalEmptyModelURL:]();
    }
    id v18 = [[LCFModelStoreModelMetadataProvider alloc] init:v9->_modelStoreRootWithKeyURL];
    modelMetadataProvider = v9->_modelMetadataProvider;
    v9->_modelMetadataProvider = v18;

    originalEmptyModelURL = v9->_originalEmptyModelURL;
    v9->_originalEmptyModelURL = 0;
  }
  return v9;
}

- (id)storeModel:(id)a3
{
  return [(LCFModelStore *)self storeModel:a3 modelConfig:0];
}

- (id)storeModel:(id)a3 modelConfig:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  modelStoreRootWithKeyURL = self->_modelStoreRootWithKeyURL;
  id v9 = [v6 lastPathComponent];
  uint64_t v10 = [(NSURL *)modelStoreRootWithKeyURL URLByAppendingPathComponent:v9];

  id v11 = [v10 path];
  v12 = [v6 path];
  int v13 = [v11 isEqualToString:v12];

  if (!v13)
  {
    id v15 = [MEMORY[0x263F08850] defaultManager];
    v16 = [v10 path];
    int v17 = [v15 fileExistsAtPath:v16];

    if (v17)
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
        -[LCFModelStore storeModel:modelConfig:]();
      }
    }
    else
    {
      id v18 = [MEMORY[0x263F08850] defaultManager];
      id v37 = 0;
      int v19 = [v18 copyItemAtURL:v6 toURL:v10 error:&v37];
      id v20 = v37;

      v21 = LCFLogModelStore;
      if (v19)
      {
        if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v39 = v6;
          __int16 v40 = 2112;
          v41 = v10;
          _os_log_impl(&dword_2545B3000, v21, OS_LOG_TYPE_INFO, "copied model from %@ to %@", buf, 0x16u);
        }

        goto LABEL_11;
      }
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
        -[LCFModelStore storeModel:modelConfig:]();
      }
    }
    v35 = 0;
    goto LABEL_20;
  }
  char v14 = LCFLogModelStore;
  if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v6;
    _os_log_impl(&dword_2545B3000, v14, OS_LOG_TYPE_INFO, "sourceModelURL %@ already exists.", buf, 0xCu);
  }
LABEL_11:
  uint64_t v22 = v13 ^ 1u;
  modelMetadataProvider = self->_modelMetadataProvider;
  v24 = [v10 lastPathComponent];
  v25 = [(LCFModelStoreModelMetadataProvider *)modelMetadataProvider getModelMetadata:v24];

  [v25 setIsImported:v22];
  [v25 setIsAvailable:1];
  uint64_t v26 = [MEMORY[0x263EFF910] now];
  [v25 setDateCreated:v26];

  v27 = +[LCFModelStoreUtils sha256ForURL:v10];
  [v25 setSha256:v27];

  v28 = self->_modelMetadataProvider;
  v29 = [v10 lastPathComponent];
  [(LCFModelStoreModelMetadataProvider *)v28 setModelMetadata:v29 metadata:v25];

  if (v7)
  {
    BOOL v30 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v7 encodeWithCoder:v30];
    [v30 finishEncoding];
    id v31 = [v30 encodedData];
    v32 = [v10 URLByDeletingPathExtension];
    v33 = [v32 URLByAppendingPathExtension:@"modelconfig"];

    v34 = LCFLogModelStore;
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v33;
      _os_log_impl(&dword_2545B3000, v34, OS_LOG_TYPE_INFO, "save model config to %@", buf, 0xCu);
    }
    [v31 writeToURL:v33 atomically:1];
  }
  v35 = [v10 lastPathComponent];

LABEL_20:
  return v35;
}

- (id)getBaseModelURL:(id)a3 modelConfig:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSURL *)self->_modelStoreRootWithKeyURL URLByAppendingPathComponent:v6];
  id v9 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
      -[LCFModelStore getBaseModelURL:modelConfig:]();
    }
    id v12 = 0;
  }
  else
  {
    int v13 = [MEMORY[0x263F08850] defaultManager];
    emptyModelURL = self->_emptyModelURL;
    id v32 = 0;
    char v15 = [v13 copyItemAtURL:emptyModelURL toURL:v8 error:&v32];
    id v16 = v32;

    int v17 = LCFLogModelStore;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
      {
        id v18 = self->_emptyModelURL;
        *(_DWORD *)buf = 138412546;
        v34 = v18;
        __int16 v35 = 2112;
        v36 = v8;
        _os_log_impl(&dword_2545B3000, v17, OS_LOG_TYPE_INFO, "copied model from %@ to %@", buf, 0x16u);
      }
      modelMetadataProvider = self->_modelMetadataProvider;
      id v20 = [v8 lastPathComponent];
      v21 = [(LCFModelStoreModelMetadataProvider *)modelMetadataProvider getModelMetadata:v20];

      [v21 setIsLocal:1];
      [v21 setIsAvailable:1];
      uint64_t v22 = [MEMORY[0x263EFF910] now];
      [v21 setDateCreated:v22];

      objc_super v23 = +[LCFModelStoreUtils sha256ForURL:v8];
      [v21 setSha256:v23];

      v24 = self->_modelMetadataProvider;
      v25 = [v8 lastPathComponent];
      [(LCFModelStoreModelMetadataProvider *)v24 setModelMetadata:v25 metadata:v21];

      if (v7)
      {
        uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
        [v7 encodeWithCoder:v26];
        [v26 finishEncoding];
        v27 = [v26 encodedData];
        v28 = [v8 URLByDeletingPathExtension];
        v29 = [v28 URLByAppendingPathExtension:@"modelconfig"];

        BOOL v30 = LCFLogModelStore;
        if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v29;
          _os_log_impl(&dword_2545B3000, v30, OS_LOG_TYPE_INFO, "save model config to %@", buf, 0xCu);
        }
        [v27 writeToURL:v29 atomically:1];
      }
      id v12 = v8;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
        -[LCFModelStore getBaseModelURL:modelConfig:]();
      }
      id v12 = 0;
    }
  }
  return v12;
}

- (id)getModelURL:(id)a3
{
  return [(NSURL *)self->_modelStoreRootWithKeyURL URLByAppendingPathComponent:a3];
}

- (id)getModelConfig:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(NSURL *)self->_modelStoreRootWithKeyURL URLByAppendingPathComponent:a3];
  v4 = [v3 URLByDeletingPathExtension];
  v5 = [v4 URLByAppendingPathExtension:@"modelconfig"];

  id v6 = LCFLogModelStore;
  if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_2545B3000, v6, OS_LOG_TYPE_INFO, "get model config to %@", buf, 0xCu);
  }
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v8 = [v5 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
    if (v10)
    {
      id v23 = 0;
      int v11 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v10 error:&v23];
      id v12 = v23;
      int v13 = (void *)[objc_alloc(MEMORY[0x263F00D98]) initWithCoder:v11];
      if ((!v13 || v12) && os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
        -[LCFModelStore getModelConfig:]();
      }
    }
    else
    {
      int v13 = 0;
    }
  }
  else
  {
    char v14 = LCFLogModelStore;
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
      -[LCFModelStore getModelConfig:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    int v13 = 0;
  }

  return v13;
}

- (BOOL)markModelTrained:(id)a3
{
  modelStoreRootWithKeyURL = self->_modelStoreRootWithKeyURL;
  id v5 = a3;
  id v6 = [(NSURL *)modelStoreRootWithKeyURL URLByAppendingPathComponent:v5];
  id v7 = [(LCFModelStoreModelMetadataProvider *)self->_modelMetadataProvider getModelMetadata:v5];
  [v7 setIsLocal:1];
  [v7 setIsAvailable:1];
  id v8 = [MEMORY[0x263EFF910] now];
  [v7 setDateTrained:v8];

  char v9 = +[LCFModelStoreUtils sha256ForURL:v6];
  [v7 setSha256:v9];

  [(LCFModelStoreModelMetadataProvider *)self->_modelMetadataProvider setModelMetadata:v5 metadata:v7];
  return 1;
}

- (BOOL)deleteModel:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self->_modelStoreRootWithKeyURL URLByAppendingPathComponent:v4];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    char v9 = [MEMORY[0x263F08850] defaultManager];
    id v20 = 0;
    char v10 = [v9 removeItemAtURL:v5 error:&v20];
    id v11 = v20;

    if (v10)
    {
      [(LCFModelStoreModelMetadataProvider *)self->_modelMetadataProvider removeModelMetadata:v4];
    }
    else
    {
      id v12 = LCFLogModelStore;
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
        -[LCFModelStore deleteModel:]((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
      -[LCFModelStore deleteModel:]();
    }
    char v10 = 0;
  }

  return v10;
}

- (BOOL)clear
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  modelStoreRootWithKeyURL = self->_modelStoreRootWithKeyURL;
  id v8 = 0;
  char v5 = [v3 removeItemAtURL:modelStoreRootWithKeyURL error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
    -[LCFModelStore clear]();
  }

  return v5;
}

- (id)listModelNames
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [(LCFModelStoreModelMetadataProvider *)self->_modelMetadataProvider getMetadata];
  if (v2)
  {
    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [v2 allKeys];
    uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v23 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v8 = [v2 objectForKeyedSubscript:v7];
          char v9 = [v8 objectForKeyedSubscript:@"isAvailable"];
          int v10 = [v9 isEqual:&unk_2703E8388];

          if (v10) {
            [v20 addObject:v7];
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v11 = LCFLogModelStore;
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
      [(LCFModelStore *)v11 listModelNames];
    }
    id v20 = 0;
  }

  return v20;
}

- (id)getModelMetadata:(id)a3
{
  return [(LCFModelStoreModelMetadataProvider *)self->_modelMetadataProvider getModelMetadata:a3];
}

- (BOOL)setModelMetadata:(id)a3 key:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(LCFModelStoreModelMetadataProvider *)self->_modelMetadataProvider getModelMetadata:v8];
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v13 = [v11 custom];
    uint64_t v14 = (void *)[v12 initWithDictionary:v13];

    [v14 setObject:v10 forKeyedSubscript:v9];
    [v11 setCustom:v14];
    BOOL v15 = [(LCFModelStoreModelMetadataProvider *)self->_modelMetadataProvider setModelMetadata:v8 metadata:v11];
  }
  else
  {
    uint64_t v16 = LCFLogModelStore;
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR)) {
      [(LCFModelStore *)v16 listModelNames];
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (NSString)key
{
  return self->_key;
}

- (NSURL)modelStoreRootURL
{
  return self->_modelStoreRootURL;
}

- (NSURL)emptyModelURL
{
  return self->_emptyModelURL;
}

- (LCFModelStoreModelMetadataProvider)modelMetadataProvider
{
  return self->_modelMetadataProvider;
}

- (NSURL)originalEmptyModelURL
{
  return self->_originalEmptyModelURL;
}

- (NSURL)modelStoreRootWithKeyURL
{
  return self->_modelStoreRootWithKeyURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStoreRootWithKeyURL, 0);
  objc_storeStrong((id *)&self->_originalEmptyModelURL, 0);
  objc_storeStrong((id *)&self->_modelMetadataProvider, 0);
  objc_storeStrong((id *)&self->_emptyModelURL, 0);
  objc_storeStrong((id *)&self->_modelStoreRootURL, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)init:modelStoreRootURL:originalEmptyModelURL:.cold.1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = v0;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *v1;
  OUTLINED_FUNCTION_0(&dword_2545B3000, (uint64_t)v1, v2, "failed to copy emptyModel from %@ to %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

- (void)init:modelStoreRootURL:originalEmptyModelURL:.cold.2()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2(&dword_2545B3000, v0, v1, "failed to create store directory %@", v2, v3, v4, v5, 2u);
}

- (void)storeModel:modelConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2545B3000, v0, v1, "the model name already exists %@ %@");
}

- (void)storeModel:modelConfig:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2545B3000, v0, v1, "failed to copy model from %@ to %@");
}

- (void)getBaseModelURL:modelConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2545B3000, v0, v1, "a model already exist %@ %@");
}

- (void)getBaseModelURL:modelConfig:.cold.2()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_2545B3000, v0, v1, "failed to copy model from %@ to %@");
}

- (void)getModelConfig:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_2545B3000, v0, v1, "failed to copy model from %@ to %@");
}

- (void)getModelConfig:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteModel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteModel:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2545B3000, v0, v1, "a model does not exist %@ %@");
}

- (void)clear
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2(&dword_2545B3000, v0, v1, "failed to delete store directory %@", v2, v3, v4, v5, 2u);
}

- (void)listModelNames
{
}

@end