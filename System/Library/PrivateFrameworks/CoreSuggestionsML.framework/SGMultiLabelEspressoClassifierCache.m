@interface SGMultiLabelEspressoClassifierCache
+ (id)sharedInstance;
- (BOOL)setCachedEspressoClassifierWithFile:(id)a3;
- (SGMultiLabelEspressoClassifierCache)init;
- (id)predict:(id)a3 withFile:(id)a4;
- (unint64_t)outputDimensionWithFile:(id)a3;
@end

@implementation SGMultiLabelEspressoClassifierCache

- (void).cxx_destruct
{
}

- (unint64_t)outputDimensionWithFile:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  currentClassifier = self->_currentClassifier;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SGMultiLabelEspressoClassifierCache_outputDimensionWithFile___block_invoke;
  v9[3] = &unk_2647EA1C8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(_PASLock *)currentClassifier runWithLockAcquired:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__SGMultiLabelEspressoClassifierCache_outputDimensionWithFile___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) setCachedEspressoClassifierWithFile:*(void *)(a1 + 40)])
  {
    v3 = [v5 classifier];
    id v4 = [v3 result];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 outputDimension];
  }
}

- (id)predict:(id)a3 withFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__65;
  v21 = __Block_byref_object_dispose__66;
  id v22 = 0;
  currentClassifier = self->_currentClassifier;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SGMultiLabelEspressoClassifierCache_predict_withFile___block_invoke;
  v13[3] = &unk_2647EA1A0;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  v16 = &v17;
  id v10 = v6;
  id v15 = v10;
  [(_PASLock *)currentClassifier runWithLockAcquired:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __56__SGMultiLabelEspressoClassifierCache_predict_withFile___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) setCachedEspressoClassifierWithFile:*(void *)(a1 + 40)])
  {
    v3 = [v8 classifier];
    id v4 = [v3 result];
    uint64_t v5 = [v4 predict:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (BOOL)setCachedEspressoClassifierWithFile:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  currentClassifier = self->_currentClassifier;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__SGMultiLabelEspressoClassifierCache_setCachedEspressoClassifierWithFile___block_invoke;
  v8[3] = &unk_2647EA178;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(_PASLock *)currentClassifier runWithLockAcquired:v8];
  LOBYTE(currentClassifier) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)currentClassifier;
}

void __75__SGMultiLabelEspressoClassifierCache_setCachedEspressoClassifierWithFile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 espressoModelFile];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = [v3 classifier];
    id v7 = [v6 result];

    if (v7) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x22A66BDC0]();
    [v3 setEspressoModelFile:0];
    [v3 setClassifier:0];
    id v9 = objc_alloc(MEMORY[0x263F61E60]);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__SGMultiLabelEspressoClassifierCache_setCachedEspressoClassifierWithFile___block_invoke_2;
    v12[3] = &unk_2647EA150;
    id v13 = *(id *)(a1 + 32);
    id v10 = (void *)[v9 initWithBlock:v12 idleTimeout:60.0];
    uint64_t v11 = [v10 result];

    if (v11)
    {
      [v3 setEspressoModelFile:*(void *)(a1 + 32)];
      [v3 setClassifier:v10];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

uint64_t __75__SGMultiLabelEspressoClassifierCache_setCachedEspressoClassifierWithFile___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x263F61958] classifierWithEspressoModelFile:*(void *)(a1 + 32)];
}

- (SGMultiLabelEspressoClassifierCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGMultiLabelEspressoClassifierCache;
  v2 = [(SGMultiLabelEspressoClassifierCache *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F61E70]);
    id v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    currentClassifier = v2->_currentClassifier;
    v2->_currentClassifier = (_PASLock *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_70);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __53__SGMultiLabelEspressoClassifierCache_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A66BDC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end