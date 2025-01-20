@interface SGQuickResponsesModel
+ (BOOL)shouldSampleForLabel:(id)a3 inLanguage:(id)a4 isDynamicLabel:(BOOL)a5;
+ (id)_sharedInvalidKeysCache;
+ (id)_sharedTransformerCache;
+ (id)_transformerCacheKeyForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5;
+ (id)configForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6;
+ (id)featuresOf:(id)a3 inLanguage:(id)a4 andMode:(unint64_t)a5;
+ (id)featuresOf:(id)a3 withFeaturizer:(id)a4 source:(id)a5;
+ (id)labelOf:(id)a3 inLanguage:(id)a4;
+ (id)labelOf:(id)a3 withLabeler:(id)a4;
+ (id)modelForLanguage:(id)a3 mode:(unint64_t)a4 chunkPath:(id)a5 plistPath:(id)a6 vocabPath:(id)a7;
+ (id)modelForLanguage:(id)a3 mode:(unint64_t)a4 chunkPath:(id)a5 plistPath:(id)a6 vocabPath:(id)a7 modelTypeAndSubModelKey:(id)a8;
+ (id)newTransformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6;
+ (id)transformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4;
+ (id)transformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6;
+ (void)_addModelAssetUpdateHandler;
+ (void)setGlobalTransformerForTesting:(id)a3;
- (BOOL)shouldSampleForLabel:(id)a3 isDynamicLabel:(BOOL)a4;
- (SGQuickResponsesModel)initWithEntity:(id)a3 type:(id)a4 mode:(unint64_t)a5 language:(id)a6 class:(Class)a7 modelPath:(id)a8 plistPath:(id)a9 vocabPath:(id)a10;
- (id)config;
- (id)featuresOf:(id)a3;
- (id)labelOf:(id)a3;
- (id)predict:(id)a3;
- (void)setTransformer:(id)a3;
@end

@implementation SGQuickResponsesModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)setTransformer:(id)a3
{
}

- (SGQuickResponsesModel)initWithEntity:(id)a3 type:(id)a4 mode:(unint64_t)a5 language:(id)a6 class:(Class)a7 modelPath:(id)a8 plistPath:(id)a9 vocabPath:(id)a10
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v47 = a4;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = (objc_class *)objc_opt_class();
  if (v18 && v21 == a7)
  {
    id v46 = v16;
    uint64_t v22 = +[SGMultiLabelEspressoClassifierCached classifierWithEspressoModelFile:v18];
  }
  else
  {
    if ((Class)objc_opt_class() != a7) {
      goto LABEL_16;
    }
    if (!v18)
    {
      id v23 = v19;
      id v24 = [NSString alloc];
      v25 = modelModeName(a5);
      id v18 = (id)[v24 initWithFormat:@"%@_%@_%@%@Model.chunk", v25, v17, v16, v47];

      uint64_t v26 = +[SGDefaultAssets checkFilesystemPathForFilename:v18];
      if (!v26)
      {
        id v19 = v23;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          id v18 = v18;
          *(_DWORD *)buf = 136315138;
          uint64_t v50 = [v18 UTF8String];
          _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to locate assets resource %s", buf, 0xCu);
        }
        goto LABEL_18;
      }
      v27 = (void *)v26;

      id v18 = v27;
      id v19 = v23;
    }
    id v46 = v16;
    uint64_t v22 = PMLReadChunkFile();
  }
  v28 = (void *)v22;
  if (!v22)
  {
    id v16 = v46;
LABEL_16:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      id v18 = v18;
      *(_DWORD *)buf = 136316162;
      uint64_t v50 = [v18 UTF8String];
      __int16 v51 = 2112;
      id v52 = v47;
      __int16 v53 = 2112;
      id v54 = v16;
      __int16 v55 = 2048;
      unint64_t v56 = a5;
      __int16 v57 = 2112;
      id v58 = v17;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to load model file resource %s, with type:%@, modelEntity:%@, mode:%lu, language:%@", buf, 0x34u);
    }
LABEL_18:
    v37 = 0;
    goto LABEL_27;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"SGQuickResponsesModel.m", 240, @"Chunk file at %@ not the same class as type %@", v18, v47 object file lineNumber description];
  }
  v29 = [(id)objc_opt_class() transformerInstanceForLanguage:v17 mode:a5 plistPath:v19 vocabPath:v20];
  v30 = v29;
  if (v29)
  {
    id v44 = v19;
    v31 = [v29 config];
    uint64_t v32 = [v31 mode];
    v33 = [v30 config];
    v34 = v33;
    if (v32 == 1)
    {
      v35 = [v33 replies];
      uint64_t v36 = [v35 modelCount];
    }
    else
    {
      v35 = [v33 labels];
      uint64_t v36 = [v35 count];
    }
    uint64_t v38 = v36;

    if ([v28 outputDimension] != v38)
    {
      v43 = [MEMORY[0x263F08690] currentHandler];
      [v43 handleFailureInMethod:a2, self, @"SGQuickResponsesModel.m", 250, @"Invalid parameter not satisfying: %@", @"model.outputDimension == configCount" object file lineNumber description];
    }
    v48.receiver = self;
    v48.super_class = (Class)SGQuickResponsesModel;
    v39 = [(SGQuickResponsesModel *)&v48 init];
    p_isa = (id *)&v39->super.isa;
    id v19 = v44;
    if (v39)
    {
      objc_storeStrong((id *)&v39->_model, v28);
      objc_storeStrong(p_isa + 2, v30);
    }
    self = p_isa;
    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  id v16 = v46;
LABEL_27:

  return v37;
}

- (BOOL)shouldSampleForLabel:(id)a3 isDynamicLabel:(BOOL)a4
{
  uint64_t v4 = a4;
  transformer = self->_transformer;
  id v6 = a3;
  v7 = [(SGQuickResponsesTransformerInstance *)transformer sampler];
  LOBYTE(v4) = [v7 shouldSampleForLabel:v6 isDynamicLabel:v4];

  return v4;
}

- (id)labelOf:(id)a3
{
  transformer = self->_transformer;
  id v4 = a3;
  v5 = [(SGQuickResponsesTransformerInstance *)transformer labeler];
  id v6 = +[SGQuickResponsesModel labelOf:v4 withLabeler:v5];

  return v6;
}

- (id)featuresOf:(id)a3
{
  transformer = self->_transformer;
  id v5 = a3;
  id v6 = [(SGQuickResponsesTransformerInstance *)transformer featurizer];
  v7 = [(SGQuickResponsesTransformerInstance *)self->_transformer source];
  v8 = +[SGQuickResponsesModel featuresOf:v5 withFeaturizer:v6 source:v7];

  return v8;
}

- (id)predict:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [v4 source];
  if ((objc_msgSend(v5, "isEqual:", objc_msgSend(v6, "modelClass")) & 1) == 0) {
    __assert_rtn("-[SGQuickResponsesModel predict:]", "SGQuickResponsesModel.m", 67, "[[self class] isEqual:features.source.modelClass]");
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  model = self->_model;
  v9 = [v4 vector];
  v10 = v9;
  if (isKindOfClass)
  {
    v11 = [v9 vectorWithConstantColumn];
    v12 = [(PMLMultiLabelClassifierProtocol *)model predict:v11];
  }
  else
  {
    v12 = [(PMLMultiLabelClassifierProtocol *)model predict:v9];
  }

  return v12;
}

- (id)config
{
  return [(SGQuickResponsesTransformerInstance *)self->_transformer config];
}

+ (void)setGlobalTransformerForTesting:(id)a3
{
}

+ (id)newTransformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  [v8 handleFailureInMethod:a2, a1, @"SGQuickResponsesModel.m", 345, @"%@ must implement +newTransformerInstanceForLanguage:mode:plistPath:", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (void)_addModelAssetUpdateHandler
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_addModelAssetUpdateHandler_onceToken_497 != -1) {
    dispatch_once(&_addModelAssetUpdateHandler_onceToken_497, block);
  }
}

uint64_t __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke_2;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = *(void *)(a1 + 32);
  return +[SGModelAsset registerOnUpdateBlock:v2];
}

void __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _sharedTransformerCache];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) _sharedInvalidKeysCache];
  [v3 runWithLockAcquired:&__block_literal_global_75];
}

uint64_t __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

+ (id)_sharedInvalidKeysCache
{
  if (_sharedInvalidKeysCache__pasOnceToken384 != -1) {
    dispatch_once(&_sharedInvalidKeysCache__pasOnceToken384, &__block_literal_global_67);
  }
  v2 = (void *)_sharedInvalidKeysCache__pasExprOnceResult;
  return (id)[v2 result];
}

void __48__SGQuickResponsesModel__sharedInvalidKeysCache__block_invoke()
{
  v0 = (void *)MEMORY[0x22A66BDC0]();
  uint64_t v1 = [objc_alloc(MEMORY[0x263F61E60]) initWithBlock:&__block_literal_global_70_499];
  v2 = (void *)_sharedInvalidKeysCache__pasExprOnceResult;
  _sharedInvalidKeysCache__pasExprOnceResult = v1;
}

id __48__SGQuickResponsesModel__sharedInvalidKeysCache__block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x263F61E70]);
  uint64_t v1 = objc_opt_new();
  v2 = (void *)[v0 initWithGuardedData:v1];

  return v2;
}

+ (id)_sharedTransformerCache
{
  if (_sharedTransformerCache__pasOnceToken383 != -1) {
    dispatch_once(&_sharedTransformerCache__pasOnceToken383, &__block_literal_global_501);
  }
  v2 = (void *)_sharedTransformerCache__pasExprOnceResult;
  return (id)[v2 result];
}

void __48__SGQuickResponsesModel__sharedTransformerCache__block_invoke()
{
  id v0 = (void *)MEMORY[0x22A66BDC0]();
  uint64_t v1 = [objc_alloc(MEMORY[0x263F61E60]) initWithBlock:&__block_literal_global_64 idleTimeout:600.0];
  v2 = (void *)_sharedTransformerCache__pasExprOnceResult;
  _sharedTransformerCache__pasExprOnceResult = v1;
}

id __48__SGQuickResponsesModel__sharedTransformerCache__block_invoke_2()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x263F61E50]) initWithCountLimit:6];
  return v0;
}

+ (id)_transformerCacheKeyForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5
{
  v8 = (objc_class *)NSString;
  v9 = (__CFString *)a5;
  v10 = (__CFString *)a3;
  id v11 = [v8 alloc];
  if (v10) {
    v12 = v10;
  }
  else {
    v12 = &stru_26DAF9368;
  }
  uint64_t v13 = NSStringFromClass((Class)a1);
  v14 = (void *)v13;
  if (v9) {
    v15 = v9;
  }
  else {
    v15 = &stru_26DAF9368;
  }
  id v16 = (void *)[v11 initWithFormat:@"%@%lu%@%@", v12, a4, v13, v15];

  return v16;
}

+ (id)transformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (__mockTransformerForTesting)
  {
    uint64_t v13 = objc_opt_class();
    v14 = [(id)__mockTransformerForTesting source];
    uint64_t v15 = [v14 modelClass];

    if (v13 == v15)
    {
      id v16 = [(id)__mockTransformerForTesting config];
      id v17 = [v16 language];
      if ([v17 isEqualToString:v10])
      {
        uint64_t v18 = [v16 mode];

        if (v18 == a4)
        {
          id v19 = (id)__mockTransformerForTesting;

          goto LABEL_16;
        }
      }
      else
      {
      }
    }
  }
  id v20 = (void *)MEMORY[0x22A66BDC0]();
  v21 = [a1 _transformerCacheKeyForLanguage:v10 mode:a4 plistPath:v11];
  if (a4 != 1 && !v11) {
    [a1 _addModelAssetUpdateHandler];
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__509;
  v45 = __Block_byref_object_dispose__510;
  id v46 = 0;
  uint64_t v22 = [a1 _sharedInvalidKeysCache];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __81__SGQuickResponsesModel_transformerInstanceForLanguage_mode_plistPath_vocabPath___block_invoke;
  v33[3] = &unk_2647EA5F8;
  id v23 = v21;
  id v34 = v23;
  uint64_t v38 = &v41;
  id v39 = a1;
  id v24 = v10;
  id v35 = v24;
  unint64_t v40 = a4;
  id v25 = v11;
  id v36 = v25;
  id v37 = v12;
  [v22 runWithLockAcquired:v33];

  uint64_t v26 = (void *)v42[5];
  if (!v26)
  {
    v27 = &_os_log_internal;
    id v28 = &_os_log_internal;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = modelModeName(a4);
      *(_DWORD *)buf = 138413058;
      id v48 = v31;
      __int16 v49 = 2112;
      id v50 = v24;
      __int16 v51 = 2112;
      id v52 = v32;
      __int16 v53 = 2112;
      id v54 = v25;
      _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "No transformer instance for model %@ in language %@ and mode %@ at path %@", buf, 0x2Au);
    }
    uint64_t v26 = (void *)v42[5];
  }
  id v19 = v26;

  _Block_object_dispose(&v41, 8);
LABEL_16:

  return v19;
}

void __81__SGQuickResponsesModel_transformerInstanceForLanguage_mode_plistPath_vocabPath___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (([v11 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 72) _sharedTransformerCache];
    uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v7 = [*(id *)(a1 + 72) newTransformerInstanceForLanguage:*(void *)(a1 + 40) mode:*(void *)(a1 + 80) plistPath:*(void *)(a1 + 48) vocabPath:*(void *)(a1 + 56)];
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        id v10 = [*(id *)(a1 + 72) _sharedTransformerCache];
        [v10 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:*(void *)(a1 + 32)];
      }
      else
      {
        [v11 addObject:*(void *)(a1 + 32)];
      }
    }
  }
}

+ (id)transformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4
{
  return (id)[a1 transformerInstanceForLanguage:a3 mode:a4 plistPath:0 vocabPath:0];
}

+ (id)modelForLanguage:(id)a3 mode:(unint64_t)a4 chunkPath:(id)a5 plistPath:(id)a6 vocabPath:(id)a7 modelTypeAndSubModelKey:(id)a8
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = v14;
  id v19 = [v17 first];
  int v20 = [v19 isEqualToString:@"quickResponsesBinaryLogisticMultiLabel"];

  if (v20)
  {
    v21 = [(SGQuickResponsesModel *)[SGQuickResponsesClassificationModel alloc] initWithEntity:@"quickResponses" type:@"BinaryLogisticMultiLabel" mode:a4 language:v13 class:objc_opt_class() modelPath:v18 plistPath:v15 vocabPath:v16];
  }
  else
  {
    uint64_t v22 = [v17 first];
    int v23 = [v22 isEqualToString:@"quickResponsesEspressoClassifierMultiLabel"];

    if (v23)
    {
      id v24 = [NSString alloc];
      id v25 = [v17 second];
      uint64_t v26 = (void *)[v24 initWithFormat:@"%@:%@", v18, v25];

      v21 = [(SGQuickResponsesModel *)[SGQuickResponsesClassificationModel alloc] initWithEntity:@"quickResponses" type:@"EspressoClassifierMultiLabel" mode:a4 language:v13 class:objc_opt_class() modelPath:v26 plistPath:v15 vocabPath:v16];
      goto LABEL_9;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v28 = [v17 first];
      *(_DWORD *)buf = 136315138;
      uint64_t v30 = [v28 UTF8String];
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown model name: %s", buf, 0xCu);
    }
    v21 = 0;
  }
  uint64_t v26 = v18;
LABEL_9:

  return v21;
}

+ (id)modelForLanguage:(id)a3 mode:(unint64_t)a4 chunkPath:(id)a5 plistPath:(id)a6 vocabPath:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[SGQuickResponsesConfig configWithLanguage:v12 mode:a4 plistPath:v14 vocabPath:v15];
  id v17 = v16;
  if (v16)
  {
    id v18 = [v16 predictionParams];
    id v19 = [v18 modelTypeName];

    int v20 = [v17 predictionParams];
    v21 = [v20 subModelKeyString];

    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F61EA8]) initWithFirst:v19 second:v21];
    int v23 = [a1 modelForLanguage:v12 mode:a4 chunkPath:v13 plistPath:v14 vocabPath:v15 modelTypeAndSubModelKey:v22];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412546;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "config not found for language %@ and plist path %@", (uint8_t *)&v25, 0x16u);
    }
    int v23 = 0;
  }

  return v23;
}

+ (BOOL)shouldSampleForLabel:(id)a3 inLanguage:(id)a4 isDynamicLabel:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  v9 = [a1 transformerInstanceForLanguage:a4 mode:0];
  id v10 = [v9 sampler];
  LOBYTE(v5) = [v10 shouldSampleForLabel:v8 isDynamicLabel:v5];

  return v5;
}

+ (id)labelOf:(id)a3 inLanguage:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 transformerInstanceForLanguage:a4 mode:0];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 labeler];
    id v10 = +[SGQuickResponsesModel labelOf:v6 withLabeler:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)labelOf:(id)a3 withLabeler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"SGQuickResponsesModel.m", 107, @"Invalid parameter not satisfying: %@", @"[data isKindOfClass:NSString.class]" object file lineNumber description];
  }
  v9 = (void *)MEMORY[0x22A66BDC0]();
  id v10 = [v8 transform:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SGQuickResponsesModel.m", 110, @"Invalid parameter not satisfying: %@", @"[label isKindOfClass:NSNumber.class]" object file lineNumber description];
  }

  return v10;
}

+ (id)featuresOf:(id)a3 inLanguage:(id)a4 andMode:(unint64_t)a5
{
  id v8 = a3;
  v9 = [a1 transformerInstanceForLanguage:a4 mode:a5];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 featurizer];
    id v12 = [v10 source];
    id v13 = +[SGQuickResponsesModel featuresOf:v8 withFeaturizer:v11 source:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)featuresOf:(id)a3 withFeaturizer:(id)a4 source:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"SGQuickResponsesModel.m", 80, @"Invalid parameter not satisfying: %@", @"[data isKindOfClass:NSString.class]" object file lineNumber description];
  }
  id v12 = (void *)MEMORY[0x22A66BDC0]();
  id v13 = [v10 transform:v9];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"SGQuickResponsesModel.m", 83, @"Invalid parameter not satisfying: %@", @"[vector isKindOfClass:PMLSparseVector.class]" object file lineNumber description];
  }
  id v14 = [[SGModelFeatures alloc] initWithSource:v11 vector:v13];

  return v14;
}

+ (id)configForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [(id)objc_opt_class() transformerInstanceForLanguage:v11 mode:a4 plistPath:v10 vocabPath:v9];

  id v13 = [v12 config];

  return v13;
}

@end