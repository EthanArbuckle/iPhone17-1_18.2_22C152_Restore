@interface BWRenderList
+ (id)shallowDepthOfFieldFilterName;
+ (void)initialize;
- (BOOL)affectsMetadata;
- (BOOL)hasMetalColorCubeRenderer;
- (BOOL)isPrepared;
- (BOOL)producesOriginalRender;
- (BOOL)shouldAllowOriginalRenderFromNode:(BWRenderListRendererNode *)a3;
- (BOOL)supportsAnimation;
- (BWRenderList)initWithAnimationSupported:(BOOL)a3 affectsMetadata:(BOOL)a4;
- (BWRenderList)initWithResourceProvider:(id)a3 originalFilters:(id)a4 processedFilters:(id)a5 optimizationStrategy:(signed __int16)a6 stillImageSettings:(id)a7;
- (BWRenderListParameterList)parameterList;
- (BWRenderListRendererList)rendererList;
- (NSSet)originalFilterNames;
- (NSSet)processedFilterNames;
- (NSString)description;
- (uint64_t)_appendBatchRendererFromProvider:(void *)a3 toRendererList:(void *)a4 parameterList:(uint64_t)a5 withContext:;
- (uint64_t)_appendSingleRendererOfType:(uint64_t)a3 forFilter:(void *)a4 fromProvider:(void *)a5 toRendererList:(void *)a6 parameterList:(uint64_t)a7 withContext:;
- (uint64_t)_continueOptimizingRendererList:(void *)a3 parameterList:(void *)a4 withFilter:(void *)a5 fromProvider:(uint64_t)a6 context:;
- (uint64_t)_finishOptimizingRendererList:(void *)a3 parameterList:(void *)a4 fromProvider:(__int16 *)a5 context:(void *)a6 stillImageSettings:;
- (uint64_t)_shouldStreamingSDOFRendererConsumeFilter:(uint64_t)a1;
- (uint64_t)_shouldUseMetalRendererForFilterWithName:(uint64_t)a1;
- (void)dealloc;
- (void)prepareWithParameters:(id)a3 forInputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (void)setPrepared:(BOOL)a3;
@end

@implementation BWRenderList

uint64_t __26__BWRenderList_isPrepared__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56);
  return result;
}

uint64_t __28__BWRenderList_setPrepared___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 56) = *(unsigned char *)(result + 40);
  return result;
}

- (void)prepareWithParameters:(id)a3 forInputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  if (![(BWRenderList *)self isPrepared])
  {
    if (a3) {
      p_parameterList = (BWRenderListParameterList *)[a3 parameterList];
    }
    else {
      p_parameterList = &self->_parameterList;
    }
    p_rendererList = &self->_rendererList;
    while (1)
    {
      p_rendererList = (BWRenderListRendererList *)p_rendererList->slh_first;
      if (!p_rendererList) {
        break;
      }
      p_parameterList = (BWRenderListParameterList *)p_parameterList->slh_first;
      if ([(BWRenderListRendererNode *)p_rendererList[1].slh_first prepareForRenderingWithParameters:p_parameterList[1].slh_first inputVideoFormat:a4 inputMediaPropertiesByAttachedMediaKey:a5])
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return;
      }
    }
    [(BWRenderList *)self setPrepared:1];
  }
}

- (BOOL)isPrepared
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  preparationIsolationQueue = self->_preparationIsolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__BWRenderList_isPrepared__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(preparationIsolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPrepared:(BOOL)a3
{
  preparationIsolationQueue = self->_preparationIsolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__BWRenderList_setPrepared___block_invoke;
  v4[3] = &unk_1E5C24B78;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(preparationIsolationQueue, v4);
}

- (BWRenderListParameterList)parameterList
{
  return &self->_parameterList;
}

- (BWRenderListRendererList)rendererList
{
  return &self->_rendererList;
}

- (void)dealloc
{
  p_rendererList = &self->_rendererList;
  slh_first = self->_rendererList.slh_first;
  self->_originalMarkerRendererNode = 0;
  if (slh_first)
  {
    do
    {
      var0 = slh_first->var0.var0;

      uint64_t v6 = p_rendererList->slh_first;
      v7 = p_rendererList;
      while (v6 != slh_first)
      {
        v7 = (BWRenderListRendererList *)v6;
        uint64_t v6 = v6->var0.var0;
      }
      v7->slh_first = slh_first->var0.var0;
      free(slh_first);
      slh_first = var0;
    }
    while (var0);
  }
  uint64_t v8 = self->_parameterList.slh_first;
  if (v8)
  {
    do
    {
      char v9 = *(BWRenderListParameterNode **)v8;

      v10 = self->_parameterList.slh_first;
      p_parameterList = &self->_parameterList;
      while (v10 != v8)
      {
        p_parameterList = (BWRenderListParameterList *)v10;
        v10 = *(BWRenderListParameterNode **)v10;
      }
      p_parameterList->slh_first = *(BWRenderListParameterNode **)v8;
      free(v8);
      uint64_t v8 = v9;
    }
    while (v9);
  }

  v12.receiver = self;
  v12.super_class = (Class)BWRenderList;
  [(BWRenderList *)&v12 dealloc];
}

- (BWRenderList)initWithAnimationSupported:(BOOL)a3 affectsMetadata:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWRenderList;
  uint64_t v6 = [(BWRenderList *)&v8 init];
  if (v6)
  {
    v6->_preparationIsolationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.bwrenderlist.preparation-isolation", 0);
    v6->_originalMarkerRendererNode = 0;
    v6->_parameterList.slh_first = 0;
    v6->_rendererList.slh_first = 0;
    v6->_affectsMetadata = a4;
    v6->_supportsAnimation = a3;
  }
  return v6;
}

- (BOOL)affectsMetadata
{
  return self->_affectsMetadata;
}

- (BWRenderList)initWithResourceProvider:(id)a3 originalFilters:(id)a4 processedFilters:(id)a5 optimizationStrategy:(signed __int16)a6 stillImageSettings:(id)a7
{
  int v8 = a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)BWRenderList;
  objc_super v12 = [(BWRenderList *)&v42 init];
  if (v12)
  {
    id v27 = a7;
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.coremedia.bwrenderlist.preparation-isolation", 0);
    v12->_rendererList.slh_first = 0;
    p_rendererList = &v12->_rendererList;
    v12->_preparationIsolationQueue = (OS_dispatch_queue *)v13;
    v12->_parameterList.slh_first = 0;
    uint64_t v41 = 0;
    long long v40 = 4uLL;
    long long v36 = (unsigned __int16)v8;
    long long v37 = 0uLL;
    uint64_t v38 = [a4 lastObject];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v15 = [a4 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(a4);
          }
          -[BWRenderList _continueOptimizingRendererList:parameterList:withFilter:fromProvider:context:]((uint64_t)v12, &v12->_rendererList.slh_first, &v12->_parameterList.slh_first, *(void **)(*((void *)&v32 + 1) + 8 * i), a3, (uint64_t)&v36);
        }
        uint64_t v16 = [a4 countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v16);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v19 = [a5 countByEnumeratingWithState:&v28 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(a5);
          }
          -[BWRenderList _continueOptimizingRendererList:parameterList:withFilter:fromProvider:context:]((uint64_t)v12, &v12->_rendererList.slh_first, &v12->_parameterList.slh_first, *(void **)(*((void *)&v28 + 1) + 8 * j), a3, (uint64_t)&v36);
        }
        uint64_t v20 = [a5 countByEnumeratingWithState:&v28 objects:v43 count:16];
      }
      while (v20);
    }
    -[BWRenderList _finishOptimizingRendererList:parameterList:fromProvider:context:stillImageSettings:]((uint64_t)v12, &v12->_rendererList.slh_first, &v12->_parameterList.slh_first, a3, (__int16 *)&v36, v27);
    if (v8 == 4)
    {
      slh_first = p_rendererList->slh_first;
      if (p_rendererList->slh_first)
      {
        unsigned int v24 = 0;
        do
        {
          objc_opt_class();
          v24 += objc_opt_isKindOfClass() & 1;
          slh_first = slh_first->var0.var0;
        }
        while (slh_first);
        char v25 = v24 < 2;
      }
      else
      {
        char v25 = 1;
      }
      BYTE1(v41) = v25;
    }
    else
    {
      char v25 = BYTE1(v41);
    }
    v12->_originalMarkerRendererNode = (BWRenderListRendererNode *)*((void *)&v37 + 1);
    v12->_affectsMetadata = v41;
    v12->_supportsAnimation = v25;
    v12->_originalFilterNames = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", objc_msgSend(a4, "valueForKeyPath:", @"name"));
    v12->_processedFilterNames = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", objc_msgSend(a5, "valueForKeyPath:", @"name"));
  }
  return v12;
}

- (uint64_t)_finishOptimizingRendererList:(void *)a3 parameterList:(void *)a4 fromProvider:(__int16 *)a5 context:(void *)a6 stillImageSettings:
{
  if (result)
  {
    uint64_t v11 = result;
    -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](result, a4, a2, a3, (uint64_t)a5);
    uint64_t v12 = *((void *)a5 + 7);
    if (v12)
    {
      unsigned int v13 = *a5 - 1;
      if (v13 <= 2) {
        -[BWRenderList _appendSingleRendererOfType:forFilter:fromProvider:toRendererList:parameterList:withContext:](v11, (0x400040002uLL >> (16 * v13)) & 6, v12, a4, a2, a3, (uint64_t)a5);
      }
    }
    if (!FigCaptureCurrentProcessIsDeferredmediad()
      && FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata()
      && (objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "produceDeferredPhotoProxyImage") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "deliverDeferredPhotoProxyImage");
    }
    result = BWIsSmartStyleAllowedForAdjustedImage(a6);
    if (result)
    {
      return -[BWRenderList _appendSingleRendererOfType:forFilter:fromProvider:toRendererList:parameterList:withContext:](v11, 6, 0, a4, a2, a3, (uint64_t)a5);
    }
  }
  return result;
}

- (uint64_t)_appendBatchRendererFromProvider:(void *)a3 toRendererList:(void *)a4 parameterList:(uint64_t)a5 withContext:
{
  if (result)
  {
    if (a5)
    {
      char v9 = *(void **)(a5 + 40);
      result = [v9 count];
      if (result)
      {
        uint64_t v10 = *(__int16 *)(a5 + 48);
        int v11 = *(unsigned __int8 *)(a5 + 50);
        uint64_t v12 = *(void *)(a5 + 32);
        id v19 = 0;
        id v20 = 0;
        result = rl_concreteRendererWithParametersForType(v10, a2, (uint64_t *)&v20, (uint64_t *)&v19, v9, v12, v11);
        if (v20)
        {
          unsigned int v13 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
          v13[1] = v20;
          v14 = *(void **)(a5 + 8);
          if (!v14) {
            v14 = a3;
          }
          *unsigned int v13 = *v14;
          void *v14 = v13;
          *(void *)(a5 + 8) = v13;
          uint64_t v15 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
          v15[1] = v19;
          uint64_t v16 = *(void **)(a5 + 16);
          if (!v16) {
            uint64_t v16 = a4;
          }
          *uint64_t v15 = *v16;
          *uint64_t v16 = v15;
          *(void *)(a5 + 16) = v15;
          if (v11) {
            *(void *)(a5 + 24) = v13;
          }
          if (*(unsigned char *)(a5 + 64)) {
            char v17 = 1;
          }
          else {
            char v17 = [v20 adjustsMetadata];
          }
          *(unsigned char *)(a5 + 64) = v17;
          if (*(unsigned char *)(a5 + 65)) {
            char v18 = 1;
          }
          else {
            char v18 = [v20 supportsAnimation];
          }
          *(unsigned char *)(a5 + 65) = v18;
          result = [v9 removeAllObjects];
          *(unsigned char *)(a5 + 50) = 0;
        }
      }
    }
  }
  return result;
}

- (BOOL)supportsAnimation
{
  return self->_supportsAnimation;
}

+ (void)initialize
{
}

- (uint64_t)_continueOptimizingRendererList:(void *)a3 parameterList:(void *)a4 withFilter:(void *)a5 fromProvider:(uint64_t)a6 context:
{
  if (!result) {
    return result;
  }
  uint64_t v11 = result;
  uint64_t v12 = (void *)[a4 name];
  uint64_t v13 = [(id)objc_opt_class() shallowDepthOfFieldFilterName];
  int v14 = [v12 isEqualToString:@"CIDepthEffectMakeBlurMap"];
  int v15 = [v12 isEqualToString:v13];
  int v16 = -[BWRenderList _shouldUseMetalRendererForFilterWithName:](v11);
  if (!*(_WORD *)(a6 + 48))
  {
    if (-[BWRenderList _shouldStreamingSDOFRendererConsumeFilter:](v11))
    {
      [*(id *)(a6 + 40) addObject:a4];
      if (*(void **)(a6 + 32) == a4) {
        *(unsigned char *)(a6 + 50) = 1;
      }
      return -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
    }
    -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
  }
  if (v15 | v14)
  {
    result = -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
    switch(*(_WORD *)a6)
    {
      case 0:
      case 4:
        *(_WORD *)(a6 + 48) = 0;
        goto LABEL_19;
      case 1:
        *(void *)(a6 + 56) = a4;
        uint64_t v18 = v11;
        uint64_t v19 = 1;
        goto LABEL_25;
      case 2:
        if ((objc_msgSend((id)objc_msgSend(a4, "name"), "isEqualToString:", @"CIDepthEffectMakeBlurMap") & 1) == 0) {
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"CIFilter must be of type CIDepthEffectMakeBlurMap.  Received: %@.", objc_msgSend(a4, "name")), 0 reason userInfo]);
        }
        uint64_t v18 = v11;
        uint64_t v19 = 3;
        goto LABEL_25;
      default:
        return result;
    }
  }
  else
  {
    int v17 = *(unsigned __int16 *)(a6 + 48);
    if (v16)
    {
      if (v17 != 5)
      {
        -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
        *(_WORD *)(a6 + 48) = 5;
      }
      uint64_t v18 = v11;
      uint64_t v19 = 5;
LABEL_25:
      return -[BWRenderList _appendSingleRendererOfType:forFilter:fromProvider:toRendererList:parameterList:withContext:](v18, v19, (uint64_t)a4, a5, a2, a3, a6);
    }
    else
    {
      if (v17 != 4)
      {
        -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
        *(_WORD *)(a6 + 48) = 4;
      }
LABEL_19:
      result = [*(id *)(a6 + 40) addObject:a4];
      if (*(void **)(a6 + 32) == a4) {
        *(unsigned char *)(a6 + 50) = 1;
      }
    }
  }
  return result;
}

- (NSString)description
{
  char v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
  if ([(NSSet *)self->_originalFilterNames count]) {
    [v3 appendFormat:@", Original:[%@]", -[NSArray componentsJoinedByString:](-[NSSet allObjects](self->_originalFilterNames, "allObjects"), "componentsJoinedByString:", @","];
  }
  if ([(NSSet *)self->_processedFilterNames count]) {
    [v3 appendFormat:@", Processed:[%@]", -[NSArray componentsJoinedByString:](-[NSSet allObjects](self->_processedFilterNames, "allObjects"), "componentsJoinedByString:", @","];
  }
  slh_first = self->_rendererList.slh_first;
  if (slh_first) {
    BOOL v5 = @", Renderers: ";
  }
  else {
    BOOL v5 = @", No Renderers";
  }
  [v3 appendString:v5];
  if (slh_first)
  {
    uint64_t v6 = 0;
    do
    {
      v7 = (objc_class *)objc_opt_class();
      [v3 appendFormat:@"[%u] %@ ", v6, NSStringFromClass(v7)];
      slh_first = slh_first->var0.var0;
      uint64_t v6 = (v6 + 1);
    }
    while (slh_first);
  }
  int v8 = self->_parameterList.slh_first;
  if (v8) {
    char v9 = @", Parameters: ";
  }
  else {
    char v9 = @", No Parameters";
  }
  [v3 appendString:v9];
  if (v8)
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      [v3 appendFormat:@"[%u] %@ ", v10, NSStringFromClass(v11)];
      int v8 = *(BWRenderListParameterNode **)v8;
      uint64_t v10 = (v10 + 1);
    }
    while (v8);
  }
  return (NSString *)v3;
}

- (BOOL)producesOriginalRender
{
  return self->_originalMarkerRendererNode != 0;
}

- (BOOL)shouldAllowOriginalRenderFromNode:(BWRenderListRendererNode *)a3
{
  return self->_originalMarkerRendererNode == a3;
}

- (uint64_t)_shouldUseMetalRendererForFilterWithName:(uint64_t)a1
{
  if (a1)
  {
    NSClassFromString(&cfstr_Ciphotoeffect.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
    NSClassFromString(&cfstr_Ciphotoeffect3_1.isa);
    char v2 = objc_opt_isKindOfClass();
    NSClassFromString(&cfstr_Cicolorcubewit.isa);
    if (objc_opt_isKindOfClass())
    {
      char v3 = 1;
    }
    else
    {
      NSClassFromString(&cfstr_Cicolorcubesmi.isa);
      char v3 = objc_opt_isKindOfClass();
    }
    if (isKindOfClass) {
      char v4 = 1;
    }
    else {
      char v4 = v2 | v3;
    }
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_shouldStreamingSDOFRendererConsumeFilter:(uint64_t)a1
{
  if (a1)
  {
    NSClassFromString(&cfstr_Ciphotoeffect.isa);
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
    NSClassFromString(&cfstr_Ciphotoeffect3_1.isa);
    unsigned __int8 v2 = objc_opt_isKindOfClass();
    NSClassFromString(&cfstr_Ciportraiteffe_8.isa);
    if (objc_opt_isKindOfClass())
    {
      char v3 = 1;
    }
    else
    {
      NSClassFromString(&cfstr_Ciportraiteffe_9.isa);
      char v3 = objc_opt_isKindOfClass();
    }
    NSClassFromString(&cfstr_Cicolorcubewit.isa);
    if (objc_opt_isKindOfClass())
    {
      char v4 = 1;
    }
    else
    {
      NSClassFromString(&cfstr_Cicolorcubesmi.isa);
      char v4 = objc_opt_isKindOfClass();
    }
    if ((isKindOfClass | v2)) {
      char v5 = 1;
    }
    else {
      char v5 = v3 | v4;
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (uint64_t)_appendSingleRendererOfType:(uint64_t)a3 forFilter:(void *)a4 fromProvider:(void *)a5 toRendererList:(void *)a6 parameterList:(uint64_t)a7 withContext:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v12 = *(void *)(a7 + 32);
    BOOL v13 = a3 && v12 == a3;
    int v14 = v13;
    id v21 = 0;
    id v22 = 0;
    if (a3)
    {
      v23[0] = a3;
      int v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 1, v21);
    }
    else
    {
      int v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    result = rl_concreteRendererWithParametersForType(a2, a4, (uint64_t *)&v22, (uint64_t *)&v21, v15, v12, v14);
    if (v22)
    {
      int v16 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
      v16[1] = v22;
      int v17 = *(void **)(a7 + 8);
      if (!v17) {
        int v17 = a5;
      }
      *int v16 = *v17;
      *int v17 = v16;
      *(void *)(a7 + 8) = v16;
      uint64_t v18 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
      v18[1] = v21;
      uint64_t v19 = *(void **)(a7 + 16);
      if (!v19) {
        uint64_t v19 = a6;
      }
      *uint64_t v18 = *v19;
      *uint64_t v19 = v18;
      *(void *)(a7 + 16) = v18;
      if (v14) {
        *(void *)(a7 + 24) = v16;
      }
      if (*(unsigned char *)(a7 + 64)) {
        char v20 = 1;
      }
      else {
        char v20 = [v22 adjustsMetadata];
      }
      *(unsigned char *)(a7 + 64) = v20;
      if (*(unsigned char *)(a7 + 65)) {
        result = 1;
      }
      else {
        result = [v22 supportsAnimation];
      }
      *(unsigned char *)(a7 + 65) = result;
    }
  }
  return result;
}

+ (id)shallowDepthOfFieldFilterName
{
  return @"CIDepthEffect";
}

- (BOOL)hasMetalColorCubeRenderer
{
  p_rendererList = &self->_rendererList;
  do
  {
    p_rendererList = (BWRenderListRendererList *)p_rendererList->slh_first;
    if (!p_rendererList) {
      break;
    }
    objc_opt_class();
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  return p_rendererList != 0;
}

- (NSSet)originalFilterNames
{
  return self->_originalFilterNames;
}

- (NSSet)processedFilterNames
{
  return self->_processedFilterNames;
}

@end