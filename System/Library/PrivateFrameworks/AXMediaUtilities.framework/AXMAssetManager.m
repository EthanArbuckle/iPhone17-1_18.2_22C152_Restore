@interface AXMAssetManager
+ (id)defaultManager;
- (id)_compiledModelsDirectoryForType:(unint64_t)a3;
- (id)_modelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4 compiled:(BOOL)a5;
- (id)_modelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5 compiled:(BOOL)a6;
- (id)_modelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4 compiled:(BOOL)a5;
- (id)_modelsDirectoryForType:(unint64_t)a3 compiled:(BOOL)a4;
- (id)_photoCaptionAssetsDirectory;
- (id)_uncompiledModelsDirectoryForType:(unint64_t)a3;
- (id)compiledModelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4;
- (id)compiledModelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5;
- (id)compiledModelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4;
- (id)modelWithName:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5 compileIfNeeded:(BOOL)a6 persistCompiledModel:(BOOL)a7 error:(id *)a8;
- (id)uncompiledModelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4;
- (id)uncompiledModelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5;
- (id)uncompiledModelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4;
@end

@implementation AXMAssetManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultManager__Shared;

  return v2;
}

void __33__AXMAssetManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(AXMAssetManager);
  v1 = (void *)defaultManager__Shared;
  defaultManager__Shared = (uint64_t)v0;
}

- (id)_photoCaptionAssetsDirectory
{
  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:AXCPSharedResourcesDirectory()];
  v3 = [v2 URLByAppendingPathComponent:@"Library/Accessibility/PhotoCaptionAssets"];

  return v3;
}

- (id)_uncompiledModelsDirectoryForType:(unint64_t)a3
{
  return [(AXMAssetManager *)self _modelsDirectoryForType:a3 compiled:0];
}

- (id)_compiledModelsDirectoryForType:(unint64_t)a3
{
  return [(AXMAssetManager *)self _modelsDirectoryForType:a3 compiled:1];
}

- (id)_modelsDirectoryForType:(unint64_t)a3 compiled:(BOOL)a4
{
  if (a3 == 1)
  {
    BOOL v4 = a4;
    v5 = [(AXMAssetManager *)self _photoCaptionAssetsDirectory];
    v6 = v5;
    if (v4) {
      v7 = @"CompiledModels";
    }
    else {
      v7 = @"UncompiledModels";
    }
    v8 = [v5 URLByAppendingPathComponent:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)compiledModelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4
{
  return [(AXMAssetManager *)self _modelAssetURLsOfType:a3 sources:a4 compiled:1];
}

- (id)uncompiledModelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4
{
  return [(AXMAssetManager *)self _modelAssetURLsOfType:a3 sources:a4 compiled:0];
}

- (id)_modelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4 compiled:(BOOL)a5
{
  BOOL v5 = a5;
  char v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v9 = [MEMORY[0x1E4F1CA48] array];
  if (a3 == 1 && (v6 & 1) != 0)
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    v11 = [(AXMAssetManager *)self _modelsDirectoryForType:1 compiled:v5];
    id v32 = 0;
    v12 = [v10 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:0 options:1 error:&v32];
    id v13 = v32;
    if (v13)
    {
      v14 = AXMediaLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:]((uint64_t)v13, v14);
      }
    }
    else
    {
      v26 = v11;
      v27 = v10;
      v15 = @"mlmodel";
      if (v5) {
        v15 = @"mlmodelc";
      }
      v14 = v15;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v25 = v12;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v22 = [v21 pathExtension];
            int v23 = [v22 isEqualToString:v14];

            if (v23) {
              [v9 addObject:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v18);
      }

      v11 = v26;
      v10 = v27;
      v12 = v25;
    }
  }

  return v9;
}

- (id)_modelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4 compiled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v9 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:](self, "_modelAssetURLsOfType:sources:compiled:", a3, a4, v5, 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) URLByDeletingPathExtension];
        id v16 = [v15 lastPathComponent];
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)compiledModelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4
{
  return [(AXMAssetManager *)self _modelAssetNamesOfType:a3 sources:a4 compiled:1];
}

- (id)uncompiledModelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4
{
  return [(AXMAssetManager *)self _modelAssetNamesOfType:a3 sources:a4 compiled:0];
}

- (id)compiledModelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5
{
  return [(AXMAssetManager *)self _modelAssetURLForModelNamed:a3 ofType:a4 sources:a5 compiled:1];
}

- (id)uncompiledModelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5
{
  return [(AXMAssetManager *)self _modelAssetURLForModelNamed:a3 ofType:a4 sources:a5 compiled:0];
}

- (id)_modelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5 compiled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  [(AXMAssetManager *)self _modelAssetURLsOfType:a4 sources:a5 compiled:v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "URLByDeletingPathExtension", (void)v19);
        uint64_t v17 = [v16 lastPathComponent];

        if ([v17 isEqualToString:v10])
        {
          id v12 = v15;

          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)modelWithName:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5 compileIfNeeded:(BOOL)a6 persistCompiledModel:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  uint64_t v15 = [(AXMAssetManager *)self compiledModelAssetURLForModelNamed:v14 ofType:a4 sources:a5];
  if (v15)
  {
    id v16 = (void *)v15;
    id v44 = 0;
    uint64_t v17 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v15 error:&v44];
    id v18 = v44;
    id v19 = v18;
    if (v18)
    {
      if (a8) {
        *a8 = v18;
      }
    }
    else
    {
      id v32 = AXMediaLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v46 = v14;
        __int16 v47 = 2112;
        v48 = v16;
        _os_log_impl(&dword_1B57D5000, v32, OS_LOG_TYPE_INFO, "Using pre-compiled model for name '%@': %@", buf, 0x16u);
      }
    }
    id v33 = v17;
    goto LABEL_23;
  }
  if (!v10) {
    goto LABEL_21;
  }
  uint64_t v20 = [(AXMAssetManager *)self uncompiledModelAssetURLForModelNamed:v14 ofType:a4 sources:a5];
  if (!v20)
  {
    if (a8)
    {
      _AXMMakeError(0, @"No uncompiled model found with name: %@", v21, v22, v23, v24, v25, v26, (uint64_t)v14);
      id v16 = 0;
      uint64_t v34 = 0;
      id v19 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_21:
    id v16 = 0;
    uint64_t v34 = 0;
    id v19 = 0;
    goto LABEL_22;
  }
  id v16 = (void *)v20;
  v27 = AXMediaLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v16;
    _os_log_impl(&dword_1B57D5000, v27, OS_LOG_TYPE_DEFAULT, "Will compile MLModel at URLL: %@", buf, 0xCu);
  }

  id v43 = 0;
  long long v28 = [MEMORY[0x1E4F1E968] compileModelAtURL:v16 error:&v43];
  id v29 = v43;
  long long v30 = AXMediaLogCommon();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v28;
    _os_log_impl(&dword_1B57D5000, v30, OS_LOG_TYPE_DEFAULT, "Will compile MLModel. Result URL: %@", buf, 0xCu);
  }

  if (v29)
  {
    if (a8)
    {
      id v29 = v29;
      *a8 = v29;
    }
LABEL_14:

    long long v31 = 0;
    id v19 = v29;
    goto LABEL_24;
  }
  if (v9)
  {
    v36 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v37 = [(AXMAssetManager *)self _compiledModelsDirectoryForType:a4];
    v38 = [v28 lastPathComponent];
    v39 = [(id)v37 URLByAppendingPathComponent:v38];

    id v42 = 0;
    LOBYTE(v37) = [v36 moveItemAtURL:v28 toURL:v39 error:&v42];
    id v40 = v42;
    id v29 = v40;
    if ((v37 & 1) == 0)
    {
      if (a8) {
        *a8 = v40;
      }

      goto LABEL_14;
    }

    long long v28 = v39;
  }
  else
  {
    id v29 = 0;
  }
  id v41 = v29;
  uint64_t v34 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v28 error:&v41];
  id v19 = v41;

  if (a8 && v19) {
    *a8 = v19;
  }

LABEL_22:
  id v33 = v34;
LABEL_23:
  long long v31 = v33;
LABEL_24:

  return v31;
}

- (void)_modelAssetURLsOfType:(uint64_t)a1 sources:(NSObject *)a2 compiled:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Could not fetch uncompiled photo caption models: %@", (uint8_t *)&v2, 0xCu);
}

@end