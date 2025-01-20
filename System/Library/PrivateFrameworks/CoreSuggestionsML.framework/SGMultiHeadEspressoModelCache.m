@interface SGMultiHeadEspressoModelCache
+ (id)sharedInstance;
- (BOOL)setCachedEspressoClassifierWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5;
- (SGMultiHeadEspressoModelCache)init;
- (id)headDimensionalityWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5;
- (id)predict:(id)a3 heads:(id)a4 withFile:(id)a5 inputName:(id)a6 headDimensionality:(id)a7;
- (id)predict:(id)a3 withFile:(id)a4 inputName:(id)a5 headDimensionality:(id)a6;
- (unint64_t)inputNumParametersWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5;
@end

@implementation SGMultiHeadEspressoModelCache

- (void).cxx_destruct
{
}

- (id)headDimensionalityWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1639;
  v26 = __Block_byref_object_dispose__1640;
  id v27 = 0;
  currentModel = self->_currentModel;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__SGMultiHeadEspressoModelCache_headDimensionalityWithFile_inputName_headDimensionality___block_invoke;
  v17[3] = &unk_2647EB150;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v10;
  id v20 = v14;
  v21 = &v22;
  [(_PASLock *)currentModel runWithLockAcquired:v17];
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __89__SGMultiHeadEspressoModelCache_headDimensionalityWithFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) setCachedEspressoClassifierWithFile:*(void *)(a1 + 40) inputName:*(void *)(a1 + 48) headDimensionality:*(void *)(a1 + 56)])
  {
    v3 = [v8 model];
    v4 = [v3 result];
    uint64_t v5 = [v4 headDimensionality];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (unint64_t)inputNumParametersWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  currentModel = self->_currentModel;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__SGMultiHeadEspressoModelCache_inputNumParametersWithFile_inputName_headDimensionality___block_invoke;
  v17[3] = &unk_2647EB150;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v10;
  id v20 = v14;
  v21 = &v22;
  [(_PASLock *)currentModel runWithLockAcquired:v17];
  unint64_t v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __89__SGMultiHeadEspressoModelCache_inputNumParametersWithFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) setCachedEspressoClassifierWithFile:*(void *)(a1 + 40) inputName:*(void *)(a1 + 48) headDimensionality:*(void *)(a1 + 56)])
  {
    v3 = [v5 model];
    v4 = [v3 result];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 inputNumParameters];
  }
}

- (id)predict:(id)a3 heads:(id)a4 withFile:(id)a5 inputName:(id)a6 headDimensionality:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1639;
  v36 = __Block_byref_object_dispose__1640;
  id v37 = 0;
  currentModel = self->_currentModel;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __85__SGMultiHeadEspressoModelCache_predict_heads_withFile_inputName_headDimensionality___block_invoke;
  v25[3] = &unk_2647EB128;
  v25[4] = self;
  id v18 = v14;
  id v26 = v18;
  id v19 = v15;
  id v27 = v19;
  id v20 = v16;
  id v28 = v20;
  v31 = &v32;
  id v21 = v12;
  id v29 = v21;
  id v22 = v13;
  id v30 = v22;
  [(_PASLock *)currentModel runWithLockAcquired:v25];
  id v23 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v23;
}

void __85__SGMultiHeadEspressoModelCache_predict_heads_withFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) setCachedEspressoClassifierWithFile:*(void *)(a1 + 40) inputName:*(void *)(a1 + 48) headDimensionality:*(void *)(a1 + 56)])
  {
    v3 = [v8 model];
    v4 = [v3 result];
    uint64_t v5 = [v4 predict:*(void *)(a1 + 64) heads:*(void *)(a1 + 72)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)predict:(id)a3 withFile:(id)a4 inputName:(id)a5 headDimensionality:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__1639;
  v31 = __Block_byref_object_dispose__1640;
  id v32 = 0;
  currentModel = self->_currentModel;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__SGMultiHeadEspressoModelCache_predict_withFile_inputName_headDimensionality___block_invoke;
  v21[3] = &unk_2647EB100;
  v21[4] = self;
  id v15 = v11;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  id v26 = &v27;
  id v18 = v10;
  id v25 = v18;
  [(_PASLock *)currentModel runWithLockAcquired:v21];
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __79__SGMultiHeadEspressoModelCache_predict_withFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) setCachedEspressoClassifierWithFile:*(void *)(a1 + 40) inputName:*(void *)(a1 + 48) headDimensionality:*(void *)(a1 + 56)])
  {
    v3 = [v8 model];
    v4 = [v3 result];
    uint64_t v5 = [v4 predict:*(void *)(a1 + 64)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (BOOL)setCachedEspressoClassifierWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  currentModel = self->_currentModel;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__SGMultiHeadEspressoModelCache_setCachedEspressoClassifierWithFile_inputName_headDimensionality___block_invoke;
  v16[3] = &unk_2647EB0D8;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  id v20 = &v21;
  [(_PASLock *)currentModel runWithLockAcquired:v16];
  LOBYTE(v8) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)v8;
}

void __98__SGMultiHeadEspressoModelCache_setCachedEspressoClassifierWithFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 espressoModelFile];
  if (![v4 isEqualToString:*(void *)(a1 + 32)]) {
    goto LABEL_7;
  }
  uint64_t v5 = [v3 inputName];
  if (([v5 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v6 = [v3 headDimensionality];
  int v7 = [v6 isEqualToDictionary:*(void *)(a1 + 48)];

  if (v7)
  {
    id v8 = [v3 model];
    id v9 = [v8 result];

    if (v9) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    goto LABEL_11;
  }
LABEL_8:
  id v10 = (void *)MEMORY[0x22A66BDC0]();
  [v3 setEspressoModelFile:0];
  [v3 setInputName:0];
  [v3 setHeadDimensionality:0];
  [v3 setModel:0];
  id v11 = objc_alloc(MEMORY[0x263F61E60]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__SGMultiHeadEspressoModelCache_setCachedEspressoClassifierWithFile_inputName_headDimensionality___block_invoke_2;
  v14[3] = &unk_2647EB0B0;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v12 = (void *)[v11 initWithBlock:v14 idleTimeout:60.0];
  id v13 = [v12 result];

  if (v13)
  {
    [v3 setEspressoModelFile:*(void *)(a1 + 32)];
    [v3 setInputName:*(void *)(a1 + 40)];
    [v3 setHeadDimensionality:*(void *)(a1 + 48)];
    [v3 setModel:v12];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }

LABEL_11:
}

id __98__SGMultiHeadEspressoModelCache_setCachedEspressoClassifierWithFile_inputName_headDimensionality___block_invoke_2(void *a1)
{
  return +[SGMultiHeadEspressoModel classifierWithEspressoModelFile:a1[4] inputName:a1[5] headDimensionality:a1[6]];
}

- (SGMultiHeadEspressoModelCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGMultiHeadEspressoModelCache;
  v2 = [(SGMultiHeadEspressoModelCache *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F61E70]);
    v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    currentModel = v2->_currentModel;
    v2->_currentModel = (_PASLock *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_1650 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_1650, &__block_literal_global_1651);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_1652;
  return v2;
}

void __47__SGMultiHeadEspressoModelCache_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A66BDC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1652;
  sharedInstance__pasExprOnceResult_1652 = v1;
}

@end