@interface DOCThumbnailGenerator
+ (DOCThumbnailGenerator)sharedGenerator;
+ (void)setMaximumCachedThumbnailCount:(unint64_t)a3;
- (DOCThumbnailGenerator)init;
- (QLThumbnailGenerator)thumbnailGenerator;
- (id)_alternateThumbnailKeyForNode:(id)a3 descriptor:(id)a4;
- (id)_currentNodeThumbnailsBatch;
- (id)_endCurrentThumbnailsBatch;
- (id)_thumbnailFallbackForNode:(id)a3 descriptor:(id)a4 currentThumbnail:(id)a5;
- (id)_thumbnailForNode:(id)a3 descriptor:(id)a4 forceFetch:(BOOL)a5;
- (id)iconForNode:(id)a3 descriptor:(id)a4;
- (id)iconForURL:(id)a3 descriptor:(id)a4;
- (id)startBatching;
- (id)thumbnailForNode:(id)a3 descriptor:(id)a4;
- (id)thumbnailForNode:(id)a3 descriptor:(id)a4 forceFetch:(BOOL)a5;
- (void)endBatching:(id)a3;
- (void)markThumbnailAsRecentlyUsed:(id)a3;
- (void)performInBatch:(id)a3;
@end

@implementation DOCThumbnailGenerator

- (id)thumbnailForNode:(id)a3 descriptor:(id)a4
{
  return [(DOCThumbnailGenerator *)self thumbnailForNode:a3 descriptor:a4 forceFetch:0];
}

- (void)endBatching:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = [MEMORY[0x263F08B88] currentThread];
    v7 = [v6 threadDictionary];

    v8 = [v7 objectForKeyedSubscript:@"DOCThumbnailActiveBatchingTokensKey"];
    [v5 _setInvalidated:1];
    [v8 compact];
    if (![v8 count]) {
      goto LABEL_6;
    }
    uint64_t v9 = 0;
    while ((id)[v8 pointerAtIndex:v9] != v5)
    {
      if (++v9 >= (unint64_t)[v8 count]) {
        goto LABEL_6;
      }
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_6:
      v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"DOCThumbnailGenerator.m" lineNumber:363 description:@"an inactive batchingToken provided to endBatching:"];
    }
    else
    {
      [v8 removePointerAtIndex:v9];
    }
    if (![v8 count])
    {
      v11 = [(DOCThumbnailGenerator *)self _endCurrentThumbnailsBatch];
      if (!v11)
      {
        v13 = [MEMORY[0x263F08690] currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"DOCThumbnailGenerator.m" lineNumber:374 description:@"ending a batch without starting one"];
      }
      if ([v11 count])
      {
        thumbnailGenerator = self->_thumbnailGenerator;
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __37__DOCThumbnailGenerator_endBatching___block_invoke;
        v14[3] = &unk_264674790;
        id v15 = v11;
        [(QLThumbnailGenerator *)thumbnailGenerator performInBatch:v14];
      }
    }
  }
  else
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"DOCThumbnailGenerator.m", 345, @"Invalid parameter not satisfying: %@", @"batchingToken != nil" object file lineNumber description];
  }
}

- (id)_endCurrentThumbnailsBatch
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];

  v4 = [v3 objectForKeyedSubscript:@"DOCThumbnailGeneratorNodeThumbnailsBatchKey"];
  id v5 = (void *)[v4 copy];

  [v3 setObject:0 forKeyedSubscript:@"DOCThumbnailGeneratorNodeThumbnailsBatchKey"];
  return v5;
}

- (id)startBatching
{
  v4 = [MEMORY[0x263F08B88] currentThread];
  id v5 = [v4 threadDictionary];

  v6 = [v5 objectForKeyedSubscript:@"DOCThumbnailGeneratorNodeThumbnailsBatchKey"];
  v7 = [v5 objectForKeyedSubscript:@"DOCThumbnailActiveBatchingTokensKey"];
  if (![v7 count])
  {
    if (v6)
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"DOCThumbnailGenerator.m" lineNumber:329 description:@"starting a batch while already in a batch"];
    }
    uint64_t v8 = objc_opt_new();

    [v5 setObject:v8 forKeyedSubscript:@"DOCThumbnailGeneratorNodeThumbnailsBatchKey"];
    uint64_t v9 = [MEMORY[0x263F08A88] weakObjectsPointerArray];

    [v5 setObject:v9 forKeyedSubscript:@"DOCThumbnailActiveBatchingTokensKey"];
    v7 = (void *)v9;
    v6 = (void *)v8;
  }
  v10 = objc_opt_new();
  [v7 addPointer:v10];

  return v10;
}

void __37__DOCThumbnailGenerator_endBatching___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "thumbnail", (void)v8);
        objc_msgSend(v7, "fetchWithOptions:", objc_msgSend(v6, "fetchOptions"));
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (QLThumbnailGenerator)thumbnailGenerator
{
  return self->_thumbnailGenerator;
}

- (void)markThumbnailAsRecentlyUsed:(id)a3
{
  thumbnailCache = self->_thumbnailCache;
  id v4 = a3;
  id v6 = [(DOCThumbnailCache *)thumbnailCache recentlyUsedNodes];
  id v5 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v4];
  [v6 setObject:v4 forKey:v5];
}

- (id)_thumbnailFallbackForNode:(id)a3 descriptor:(id)a4 currentThumbnail:(id)a5
{
  id v80 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = self;
  objc_sync_enter(v11);
  [v9 size];
  double v13 = v12;
  [v9 scale];
  double v15 = v14;
  [v9 size];
  double v17 = v16;
  [v9 scale];
  double v19 = v18;
  memset(&enumerator, 0, sizeof(enumerator));
  v20 = [(DOCThumbnailCache *)v11->_thumbnailCache cachedThumbnailNodes];
  NSEnumerateMapTable(&enumerator, v20);
  obj = (id *)&v11->super.isa;
  v77 = v10;
  double v21 = v17 * v19 + v13 * v15;

  id v22 = 0;
  id v23 = 0;
  value = 0;
  key = 0;
LABEL_2:
  v78 = v22;
  v79 = v23;
  while (1)
  {
    do
    {
      if (!NSNextMapEnumeratorPair(&enumerator, &key, &value)) {
        goto LABEL_19;
      }
      v24 = key;

      v25 = value;
      uint64_t v26 = [v9 style];
      uint64_t v27 = [v25 style];
      v28 = [v80 thumbnailIdentifier];
      uint64_t v29 = [v25 nodeThumbnailIdentifier];
      uint64_t v5 = [v28 isEqual:v29];

      v30 = [v80 identifier];
      v31 = [v25 node];
      v32 = [v31 identifier];
      LODWORD(v29) = [v30 isEqual:v32];

      int v33 = [v25 isRepresentativeIcon];
      int v34 = v5 | v29;
      if (v26 != v27) {
        int v34 = 0;
      }
      id v23 = v25;
      id v22 = v24;
    }
    while ((v34 & v33) != 1);
    [v9 size];
    double v36 = v35;
    double v38 = v37;
    [v25 size];
    if (v36 == v40 && v38 == v39)
    {
      [v9 scale];
      double v42 = v41;
      [v25 scale];
      int v44 = v42 == v43 ? v5 : 0;
      if (v44 == 1) {
        break;
      }
    }
    if (!v79)
    {
      id v61 = v25;
      goto LABEL_17;
    }
    [v25 size];
    double v46 = v45;
    [v25 scale];
    double v48 = v47;
    [v25 size];
    double v50 = v49;
    [v25 scale];
    double v52 = v51;
    [v79 size];
    double v54 = v53;
    [v79 scale];
    double v56 = v55;
    [v79 size];
    double v58 = v57;
    [v79 scale];
    id v23 = v25;
    id v22 = v24;
    if (vabdd_f64(v50 * v52 + v46 * v48, v21) < vabdd_f64(v58 * v59 + v54 * v56, v21))
    {
      id v60 = v25;

LABEL_17:
      id v22 = v24;

      id v23 = v25;
      goto LABEL_2;
    }
  }
  id v23 = v25;

  id v22 = v24;
  v78 = v22;
  v79 = v23;
LABEL_19:
  NSEndMapTableEnumeration(&enumerator);
  if (!v79)
  {
LABEL_26:
    BOOL v67 = 1;
    goto LABEL_33;
  }
  if (v79 == v77)
  {
    v73 = [v77 fallback];
    if ([v73 isRepresentativeIcon]) {
      v74 = v73;
    }
    else {
      v74 = 0;
    }
    uint64_t v5 = v74;
    goto LABEL_32;
  }
  [v9 size];
  double v63 = v62;
  double v65 = v64;
  [v79 size];
  BOOL v67 = 1;
  if (v63 == v68 && v65 == v66)
  {
    [v9 scale];
    double v70 = v69;
    [v79 scale];
    if (v70 == v71)
    {
      v72 = [v79 thumbnailImage];

      if (v72)
      {
        [v79 setFallback:0];
        v73 = [obj[1] cachedThumbnailNodes];
        [v73 removeObjectForKey:v78];
LABEL_32:

        BOOL v67 = v79 != v77;
        goto LABEL_33;
      }
      goto LABEL_26;
    }
  }
LABEL_33:

  objc_sync_exit(obj);
  if (v67) {
    uint64_t v5 = v79;
  }

  return (id)v5;
}

- (id)_thumbnailForNode:(id)a3 descriptor:(id)a4 forceFetch:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [DOCThumbnailKey alloc];
  long long v11 = [v8 thumbnailIdentifier];
  double v12 = [(DOCThumbnailKey *)v10 initWithPrimaryKey:v11 descriptor:v9];

  double v13 = [(DOCThumbnailGenerator *)self _alternateThumbnailKeyForNode:v8 descriptor:v9];
  double v14 = self;
  objc_sync_enter(v14);
  double v15 = [(DOCThumbnailCache *)v14->_thumbnailCache cachedThumbnailNodes];
  double v16 = [v15 objectForKey:v12];

  if (!v16)
  {
    double v17 = [(DOCThumbnailCache *)v14->_thumbnailCache cachedThumbnailNodes];
    double v16 = [v17 objectForKey:v13];
  }
  objc_sync_exit(v14);

  double v18 = [(DOCThumbnailGenerator *)v14 _thumbnailFallbackForNode:v8 descriptor:v9 currentThumbnail:v16];
  if (!v18)
  {
    double v18 = [(DOCThumbnailGenerator *)v14 iconForNode:v8 descriptor:v9];
    if (v16) {
      goto LABEL_5;
    }
LABEL_11:
    id v23 = [[DOCNodeThumbnail alloc] initWithGenerator:v14 node:v8 descriptor:v9 fallback:v18];
    uint64_t v24 = [(DOCThumbnailGenerator *)v14 _currentNodeThumbnailsBatch];
    v25 = (void *)v24;
    if (v5) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 0;
    }
    if (v24)
    {
      uint64_t v27 = objc_opt_new();
      [v27 setThumbnail:v23];
      [v27 setFetchOptions:v26];
      [v25 addObject:v27];
    }
    else
    {
      [(DOCNodeThumbnail *)v23 fetchWithOptions:v26];
    }
    v28 = v14;
    objc_sync_enter(v28);
    uint64_t v29 = [(DOCThumbnailCache *)v14->_thumbnailCache cachedThumbnailNodes];
    [v29 setObject:v23 forKey:v12];

    v30 = [(DOCThumbnailCache *)v14->_thumbnailCache cachedThumbnailNodes];
    [v30 setObject:v23 forKey:v13];

    objc_sync_exit(v28);
    id v22 = v23;

    goto LABEL_18;
  }
  if (!v16) {
    goto LABEL_11;
  }
LABEL_5:
  [v16 setFallback:v18];
  double v19 = [v8 thumbnailIdentifier];
  [v16 updateNodeThumbnailIdentifierTo:v19];

  if (v5) {
    [v16 fetchWithOptions:3];
  }
  if (v13)
  {
    v20 = v14;
    objc_sync_enter(v20);
    double v21 = [(DOCThumbnailCache *)v14->_thumbnailCache cachedThumbnailNodes];
    [v21 setObject:v16 forKey:v13];

    objc_sync_exit(v20);
  }
  id v22 = v16;
LABEL_18:

  return v22;
}

- (id)iconForNode:(id)a3 descriptor:(id)a4
{
  id v4 = +[DOCThumbnailRequest iconRequestForNode:a3 descriptor:a4 thumbnailGenerator:self->_thumbnailGenerator];
  BOOL v5 = [[DOCIconPromise alloc] initWithRequest:v4];

  return v5;
}

- (id)_alternateThumbnailKeyForNode:(id)a3 descriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v6, "fpfs_fpItem");
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = 0;
  if (v7 && v7 != v6)
  {
    id v9 = [DOCThumbnailKey alloc];
    id v10 = [v7 thumbnailIdentifier];
    id v8 = [(DOCThumbnailKey *)v9 initWithPrimaryKey:v10 descriptor:v5];
  }
  return v8;
}

- (id)_currentNodeThumbnailsBatch
{
  uint64_t v2 = [MEMORY[0x263F08B88] currentThread];
  uint64_t v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKeyedSubscript:@"DOCThumbnailGeneratorNodeThumbnailsBatchKey"];

  return v4;
}

- (id)thumbnailForNode:(id)a3 descriptor:(id)a4 forceFetch:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  [v10 size];
  double v12 = v11;
  double v14 = v13;
  [v10 minimumSize];
  double v16 = v15;
  [v10 scale];
  double v18 = v17;
  if (v12 <= 0.0 || v14 <= 0.0 || v17 <= 0.0)
  {
    double v21 = [MEMORY[0x263F08690] currentHandler];
    v26.width = v12;
    v26.height = v14;
    id v22 = NSStringFromCGSize(v26);
    [v21 handleFailureInMethod:a2, self, @"DOCThumbnailGenerator.m", 114, @"Expected size and scale to be non-zero, got %@ @ %fx", v22, *(void *)&v18 object file lineNumber description];
  }
  if (v16 > v12 || v16 > v14)
  {
    id v23 = [MEMORY[0x263F08690] currentHandler];
    v27.width = v12;
    v27.height = v14;
    uint64_t v24 = NSStringFromCGSize(v27);
    [v23 handleFailureInMethod:a2, self, @"DOCThumbnailGenerator.m", 115, @"Expected minimum size should be smaller or equal to maximum size, got %f for %@", *(void *)&v16, v24 object file lineNumber description];
  }
  double v19 = [(DOCThumbnailGenerator *)self _thumbnailForNode:v9 descriptor:v10 forceFetch:v5];

  return v19;
}

+ (DOCThumbnailGenerator)sharedGenerator
{
  if (sharedGenerator_onceToken != -1) {
    dispatch_once(&sharedGenerator_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)sharedGenerator_sharedGenerator;
  return (DOCThumbnailGenerator *)v2;
}

uint64_t __40__DOCThumbnailGenerator_sharedGenerator__block_invoke()
{
  sharedGenerator_sharedGenerator = objc_alloc_init(DOCThumbnailGenerator);
  return MEMORY[0x270F9A758]();
}

- (DOCThumbnailGenerator)init
{
  v8.receiver = self;
  v8.super_class = (Class)DOCThumbnailGenerator;
  uint64_t v2 = [(DOCThumbnailGenerator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F160D0] sharedGenerator];
    thumbnailGenerator = v2->_thumbnailGenerator;
    v2->_thumbnailGenerator = (QLThumbnailGenerator *)v3;

    uint64_t v5 = objc_opt_new();
    thumbnailCache = v2->_thumbnailCache;
    v2->_thumbnailCache = (DOCThumbnailCache *)v5;
  }
  return v2;
}

+ (void)setMaximumCachedThumbnailCount:(unint64_t)a3
{
  maxCachedNodes = a3;
}

- (id)iconForURL:(id)a3 descriptor:(id)a4
{
  id v4 = +[DOCThumbnailRequest iconRequestForURL:a3 descriptor:a4 thumbnailGenerator:self->_thumbnailGenerator];
  uint64_t v5 = [[DOCIconPromise alloc] initWithRequest:v4];

  return v5;
}

- (void)performInBatch:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (v6)
  {
    uint64_t v5 = [(DOCThumbnailGenerator *)self startBatching];
    if (v5)
    {
      v6[2]();
      [(DOCThumbnailGenerator *)self endBatching:v5];
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"DOCThumbnailGenerator.m", 312, @"Invalid parameter not satisfying: %@", @"batchingBlock != nil" object file lineNumber description];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);
}

@end