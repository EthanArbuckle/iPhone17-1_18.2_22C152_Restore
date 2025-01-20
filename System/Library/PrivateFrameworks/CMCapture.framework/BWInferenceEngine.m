@interface BWInferenceEngine
+ (BOOL)isNeuralEngineSupported;
+ (uint64_t)allowedPixelBufferCompressionType;
+ (unsigned)allowedBufferCompressionDirectionForExecutionTarget:(int)a3;
+ (void)initialize;
- (BOOL)backPressureDrivenPipelining;
- (BOOL)isConfiguredForInference;
- (BOOL)requiresDeviceOrientationMetadata;
- (BWInferenceEngine)initWithScheduler:(id)a3 priority:(unsigned int)a4;
- (BWInferenceEngine)initWithScheduler:(id)a3 priority:(unsigned int)a4 shareIntermediateBuffer:(BOOL)a5;
- (NSDictionary)providedVideoRequirementsByAttachedMediaKey;
- (id)defaultDeviceMetalContext;
- (id)espressoContextForExecutionTarget:(int)a3;
- (id)metalCommandBuffer;
- (id)newMetalEvent;
- (id)visionContextForExecutionTarget:(int)a3;
- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5;
- (int)enableIntermediateBufferSharingWithNetworksLoadedFromPath:(id)a3;
- (int)performInferencesOnSampleBuffer:(opaqueCMSampleBuffer *)a3 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (int)performInferencesOnSampleBuffer:(opaqueCMSampleBuffer *)a3 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a4 skippingInferencesWithTypes:(id)a5;
- (int)prepareForInferenceWithFormatProvider:(id)a3;
- (int)prepareForInferenceWithFormatProvider:(id)a3 pixelBufferPoolProvider:(id)a4;
- (int)prepareForInputInferenceVideoFormat:(id)a3 attachedMediaKey:(id)a4;
- (int)prepareForInputVideoFormat:(id)a3 attachedMediaKey:(id)a4;
- (int)prewarmInferencesUsingLimitedMemory:(BOOL)a3;
- (uint64_t)_addInferenceRequirementForProvider:(uint64_t)a3 configuration:;
- (uint64_t)_prepareDependenciesByRequirementIfNecessary;
- (void)_initWithScheduler:(uint64_t)a3 priority:(uint64_t)a4 shareIntermediateBuffer:;
- (void)_prepareProvidedVideoRequirementsIfNecessary;
- (void)dealloc;
- (void)setBackPressureDrivenPipelining:(BOOL)a3;
@end

@implementation BWInferenceEngine

- (uint64_t)_prepareDependenciesByRequirementIfNecessary
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "dependenciesByInputVideoRequirements"), "count");
    if (!result)
    {
      result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "count");
      if (!result)
      {
        unsigned int v40 = [*(id *)(v1 + 32) supportedPixelBufferCompressionType];
        self;
        BOOL v39 = FigCapturePlatformSupportsUniversalLossyCompression() != 0;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        obuint64_t j = *(id *)(v1 + 136);
        result = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
        uint64_t v36 = result;
        if (result)
        {
          uint64_t v35 = *(void *)v54;
          do
          {
            uint64_t v2 = 0;
            do
            {
              if (*(void *)v54 != v35) {
                objc_enumerationMutation(obj);
              }
              uint64_t v37 = v2;
              v3 = *(void **)(*((void *)&v53 + 1) + 8 * v2);
              v4 = (void *)[v3 provider];
              char v5 = [v4 allowedPixelBufferCompressionDirection];
              v38 = v4;
              v6 = (void *)[v4 inputVideoRequirements];
              long long v49 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v59 count:16];
              if (v7)
              {
                uint64_t v8 = v7;
                uint64_t v9 = *(void *)v50;
                do
                {
                  for (uint64_t i = 0; i != v8; ++i)
                  {
                    if (*(void *)v50 != v9) {
                      objc_enumerationMutation(v6);
                    }
                    v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                    if (v5)
                    {
                      id v12 = +[BWInferenceCompressedVideoRequirement newRequirementWithUncompressedRequirement:*(void *)(*((void *)&v49 + 1) + 8 * i) supportedCompressionType:v40 supportedLossyCompressionLevel:v39];
                      if (v12)
                      {
                        id v13 = v12;
                        [*(id *)(v1 + 144) addObject:v12];
                        v11 = v13;
                      }
                    }
                    id v14 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByInputVideoRequirements"), "objectForKey:", v11);
                    if (!v14)
                    {
                      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByInputVideoRequirements"), "setObject:forKey:", v14, v11);
                    }
                    v15 = [[BWInferenceDataDependency alloc] initWithInferenceRequirement:v3 dependentOnDataRequirement:v11];
                    [v14 addObject:v15];

                    if (!*(unsigned char *)(v1 + 192)) {
                      *(unsigned char *)(v1 + 192) = objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "deviceOriented");
                    }
                  }
                  uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v59 count:16];
                }
                while (v8);
              }
              v16 = (void *)[v38 outputVideoRequirements];
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v58 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v46;
                do
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v46 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    id v21 = *(id *)(*((void *)&v45 + 1) + 8 * j);
                    if ((v5 & 2) != 0)
                    {
                      id v22 = +[BWInferenceCompressedVideoRequirement newRequirementWithUncompressedRequirement:*(void *)(*((void *)&v45 + 1) + 8 * j) supportedCompressionType:v40 supportedLossyCompressionLevel:v39];
                      if (v22)
                      {
                        id v23 = v22;
                        [*(id *)(v1 + 144) addObject:v22];
                        id v21 = v23;
                      }
                    }
                    id v24 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "objectForKey:", v21);
                    if (!v24)
                    {
                      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "setObject:forKey:", v24, v21);
                    }
                    v25 = [[BWInferenceDataDependency alloc] initWithInferenceRequirement:v3 dependentOnDataRequirement:v21];
                    [v24 addObject:v25];
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v58 count:16];
                }
                while (v18);
              }
              v26 = (void *)[v38 cloneVideoRequirements];
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v57 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v42;
                do
                {
                  for (uint64_t k = 0; k != v28; ++k)
                  {
                    if (*(void *)v42 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    v31 = *(void **)(*((void *)&v41 + 1) + 8 * k);
                    id v32 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "objectForKey:", v31);
                    if (!v32)
                    {
                      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "setObject:forKey:", v32, v31);
                    }
                    v33 = -[BWInferenceDataDependency initWithInferenceRequirement:dependentOnDataRequirement:]([BWInferenceDataDependency alloc], "initWithInferenceRequirement:dependentOnDataRequirement:", v3, [v31 sourceVideoRequirement]);
                    [v32 addObject:v33];
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v57 count:16];
                }
                while (v28);
              }
              uint64_t v2 = v37 + 1;
            }
            while (v37 + 1 != v36);
            result = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
            uint64_t v36 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (void)_prepareProvidedVideoRequirementsIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1
    && ![*(id *)(a1 + 32) providedVideoRequirementsByAttachedMediaKey]
    && ![*(id *)(a1 + 184) count])
  {
    [*(id *)(a1 + 32) setSupportedPixelBufferCompressionType:+[BWInferenceEngine allowedPixelBufferCompressionType]()];
    -[BWInferenceEngine _prepareDependenciesByRequirementIfNecessary](a1);
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v3 = *(void **)(a1 + 152);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dependenciesByInputVideoRequirements"), "objectForKey:", v8);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dependenciesByOutputVideoRequirements"), "objectForKey:", v8), "count")&& !objc_msgSend(v9, "count"))
          {
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, objc_msgSend(v8, "attachedMediaKey"));
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "setProvidedVideoRequirementsByAttachedMediaKey:", (id)objc_msgSend(v2, "copy"));

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = *(void **)(a1 + 144);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v18 + 1) + 8 * j);
          uint64_t v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dependenciesByInputVideoRequirements"), "objectForKey:", v16);
          if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dependenciesByOutputVideoRequirements"), "objectForKey:", v16), "count"))
          {
            if ([v17 count]) {
              objc_msgSend(v10, "addObject:", objc_msgSend(v16, "attachedMediaKey"));
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v13);
    }
    objc_msgSend(*(id *)(a1 + 32), "setConsumedVideoAttachedMediaKeys:", (id)objc_msgSend(v10, "copy"));
  }
}

- (int)prepareForInputInferenceVideoFormat:(id)a3 attachedMediaKey:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_lazyInputVideoRequirementsByAttachedMediaKey objectForKey:a4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      int result = [*(id *)(*((void *)&v22 + 1) + 8 * v11) prepareForInputInferenceVideoFormat:a3];
      if (result) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v13 = (void *)[(NSMutableDictionary *)self->_lazyOutputVideoRequirementsByAttachedMediaKey objectForKey:a4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        int result = [*(id *)(*((void *)&v18 + 1) + 8 * v17) prepareForInputInferenceVideoFormat:a3];
        if (result) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      [(NSMutableSet *)self->_unresolvedAttachedMediaKeysPreventingProvidedVideoRequirements removeObject:a4];
      -[BWInferenceEngine _prepareProvidedVideoRequirementsIfNecessary]((uint64_t)self);
      return 0;
    }
  }
  return result;
}

- (NSDictionary)providedVideoRequirementsByAttachedMediaKey
{
  return [(BWInferenceDependencyProvider *)self->_dependencyProvider providedVideoRequirementsByAttachedMediaKey];
}

- (int)prepareForInputVideoFormat:(id)a3 attachedMediaKey:(id)a4
{
  LODWORD(v8) = 0;
  uint64_t v6 = [[BWInferenceVideoFormat alloc] initWithUnderlyingFormat:a3 isDeviceOriented:0 videoContentMode:0 includesInvalidContent:1 cropDescriptor:0 histogramRequest:0 rotationDegrees:v8];
  return [(BWInferenceEngine *)self prepareForInputInferenceVideoFormat:v6 attachedMediaKey:a4];
}

- (uint64_t)_addInferenceRequirementForProvider:(uint64_t)a3 configuration:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = (id *)result;
    uint64_t v5 = [[BWInferenceRequirement alloc] initWithProvider:a2 configuration:a3];
    [v4[17] addObject:v5];

    char v6 = [a2 allowedPixelBufferCompressionDirection];
    long long v23 = a2;
    uint64_t v7 = (void *)[a2 inputVideoRequirements];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(BWInferenceCompressibleLazyVideoRequirement **)(*((void *)&v28 + 1) + 8 * i);
          [v4[18] addObject:v12];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [(BWInferenceLazyVideoRequirement *)v12 preparedByAttachedMediaKey];
            if (v6) {
              uint64_t v12 = [[BWInferenceCompressibleLazyVideoRequirement alloc] initWithLazyVideoRequirement:v12];
            }
            id v14 = (id)[v4[20] objectForKey:v13];
            if (!v14)
            {
              id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v4[20] setObject:v14 forKey:v13];
            }
            [v14 addObject:v12];
            [v4[23] addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }
    uint64_t v15 = (void *)[v23 outputVideoRequirements];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          [v4[19] addObject:v20];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v21 = [v20 preparedByAttachedMediaKey];
            id v22 = (id)[v4[21] objectForKey:v21];
            if (!v22)
            {
              id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v4[21] setObject:v22 forKey:v21];
            }
            [v22 addObject:v20];
            [v4[23] addObject:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v17);
    }
    return objc_msgSend(v4[19], "addObjectsFromArray:", objc_msgSend(v23, "cloneVideoRequirements"));
  }
  return result;
}

+ (unsigned)allowedBufferCompressionDirectionForExecutionTarget:(int)a3
{
  int v4 = +[BWInferenceEngine allowedPixelBufferCompressionType]();
  int v5 = FigCapturePlatformSupportsUniversalCompression();
  int v6 = FigCapturePlatformSupportsHTPC16x8Compression();
  unsigned int v7 = 0;
  int v8 = FigCapturePlatformIdentifier();
  switch(a3)
  {
    case 1:
    case 5:
      BOOL v9 = v4 != 4 || v5 == 0;
      int v10 = 3;
      goto LABEL_12;
    case 3:
      if (v8 <= 8) {
        int v10 = 1;
      }
      else {
        int v10 = 3;
      }
      BOOL v9 = v4 != 4 || v5 == 0;
LABEL_12:
      if (v9) {
        unsigned int v7 = 0;
      }
      else {
        unsigned int v7 = v10;
      }
      break;
    case 4:
      unsigned int v7 = 3;
      if (!v5 || v4 != 4)
      {
        if (v4 != 1 || v6 == 0) {
          unsigned int v7 = 0;
        }
        else {
          unsigned int v7 = 3;
        }
      }
      break;
    default:
      return v7;
  }
  return v7;
}

+ (uint64_t)allowedPixelBufferCompressionType
{
  if (FigCapturePlatformSupportsUniversalCompression()) {
    return 4;
  }
  FigCapturePlatformSupportsHTPC16x8Compression();
  return 0;
}

- (id)defaultDeviceMetalContext
{
  return self->_defaultDeviceMetalContext;
}

- (BWInferenceEngine)initWithScheduler:(id)a3 priority:(unsigned int)a4 shareIntermediateBuffer:(BOOL)a5
{
  return (BWInferenceEngine *)-[BWInferenceEngine _initWithScheduler:priority:shareIntermediateBuffer:](self, a3, *(uint64_t *)&a4, a5);
}

- (void)_initWithScheduler:(uint64_t)a3 priority:(uint64_t)a4 shareIntermediateBuffer:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)BWInferenceEngine;
  unsigned int v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = [a2 registerInferenceConnection];
    *((_DWORD *)v7 + 6) = a3;
    v7[5] = objc_alloc_init(BWEspressoInferenceAdapter);
    v7[6] = objc_alloc_init(BWTiledEspressoInferenceAdapter);
    v7[7] = objc_alloc_init(BWTiledInferenceAdapter);
    v7[12] = objc_alloc_init(BWVisionInferenceAdapter);
    v7[14] = objc_alloc_init(BWVideoDepthInferenceAdapter);
    v7[15] = objc_alloc_init(BWFusionTrackerInferenceAdapter);
    v7[8] = [[BWEspressoInferenceContext alloc] initWithExecutionTarget:0];
    v7[9] = [[BWEspressoInferenceContext alloc] initWithExecutionTarget:1];
    v7[10] = [[BWEspressoInferenceContext alloc] initWithExecutionTarget:3 shareIntermediateBuffer:a4];
    v7[13] = objc_alloc_init(BWVisionInferenceContext);
    v7[11] = [[BWMetalInferenceContext alloc] initWithScheduler:a2 priority:a3];
    v7[16] = objc_alloc_init(BWVideoProcessingInferenceAdapter);
    v7[17] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7[18] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7[19] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7[20] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7[21] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7[23] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v7[4] = objc_alloc_init(BWInferenceDependencyProvider);
  }
  return v7;
}

+ (BOOL)isNeuralEngineSupported
{
  if (isNeuralEngineSupported_onceToken != -1) {
    dispatch_once(&isNeuralEngineSupported_onceToken, &__block_literal_global_93);
  }
  return isNeuralEngineSupported_neuralEngineSupported;
}

- (BWInferenceEngine)initWithScheduler:(id)a3 priority:(unsigned int)a4
{
  return [(BWInferenceEngine *)self initWithScheduler:a3 priority:*(void *)&a4 shareIntermediateBuffer:0];
}

- (id)visionContextForExecutionTarget:(int)a3
{
  return self->_visionContext;
}

- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5
{
  uint64_t v6 = *(void *)&a4.var0;
  uint64_t v7 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v29 = 0;
  [a5 setPriority:self->_priority];
  objc_super v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ((int)v7 > 149)
  {
    if ((int)v7 <= 200)
    {
      switch((int)v7)
      {
        case 150:
          fusionTrackerAdapter = self->_fusionTrackerAdapter;
          uint64_t v11 = v6 & 0xFFFFFFFFFFFFLL;
          uint64_t v12 = 150;
          goto LABEL_32;
        case 151:
        case 161:
          goto LABEL_30;
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 157:
        case 158:
          goto LABEL_35;
        case 159:
        case 160:
          goto LABEL_24;
        default:
          if ((v7 - 170) < 2) {
            goto LABEL_24;
          }
          goto LABEL_35;
      }
    }
    if ((v7 - 801) < 4)
    {
      if (os_variant_has_factory_content()) {
        return v29;
      }
      visionAdapter = self->_visionAdapter;
LABEL_25:
      uint64_t v14 = v6 & 0xFFFFFFFFFFFFLL;
      uint64_t v15 = v7;
LABEL_26:
      id v16 = (id)[visionAdapter inferenceProviderForType:v15 version:v14 configuration:a5 resourceProvider:self status:&v29];
      if (v16)
      {
LABEL_27:
        [v9 addObject:v16];
        goto LABEL_35;
      }
      return -31701;
    }
    if (v7 == 201)
    {
      if ((unsigned __int16)v6 == 1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v23 = a5;
        }
        else {
          id v23 = 0;
        }
        long long v24 = BWMattingInferenceProvider;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v23 = a5;
        }
        else {
          id v23 = 0;
        }
        long long v24 = BWMattingV2InferenceProvider;
      }
      id v16 = (id)[[v24 alloc] initWithConfiguration:v23];
      if (v16) {
        goto LABEL_27;
      }
      return -31701;
    }
    if (v7 == 2001)
    {
      visionAdapter = self->_videoProcessingAdapter;
      uint64_t v14 = v6 & 0xFFFFFFFFFFFFLL;
      uint64_t v15 = 2001;
      goto LABEL_26;
    }
    goto LABEL_35;
  }
  if ((int)v7 <= 107)
  {
    if ((v7 - 101) >= 6)
    {
      if (v7 != 107) {
        goto LABEL_35;
      }
LABEL_24:
      visionAdapter = self->_tiledEspressoAdapter;
      goto LABEL_25;
    }
    goto LABEL_30;
  }
  if ((int)v7 <= 115)
  {
    if (v7 == 108) {
      goto LABEL_30;
    }
    if (v7 == 109 || v7 == 111) {
      goto LABEL_19;
    }
LABEL_35:
    if ([v9 count])
    {
      if (!v29)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v18 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v26 != v20) {
                objc_enumerationMutation(v9);
              }
              -[BWInferenceEngine _addInferenceRequirementForProvider:configuration:]((uint64_t)self, *(void **)(*((void *)&v25 + 1) + 8 * i), (uint64_t)a5);
            }
            uint64_t v19 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v19);
        }
      }
    }
    return v29;
  }
  if ((int)v7 > 117)
  {
    if (v7 == 118 || v7 == 130) {
      goto LABEL_30;
    }
    goto LABEL_35;
  }
  if (v7 == 116)
  {
LABEL_30:
    fusionTrackerAdapter = self->_espressoAdapter;
    goto LABEL_31;
  }
LABEL_19:
  fusionTrackerAdapter = self->_videoDepthAdapter;
LABEL_31:
  uint64_t v11 = v6 & 0xFFFFFFFFFFFFLL;
  uint64_t v12 = v7;
LABEL_32:
  uint64_t v17 = [fusionTrackerAdapter inferenceProvidersForType:v12 version:v11 configuration:a5 resourceProvider:self status:&v29];
  if (v17 && !v29)
  {
    [v9 addObjectsFromArray:v17];
    goto LABEL_35;
  }
  return v29;
}

- (int)prepareForInferenceWithFormatProvider:(id)a3 pixelBufferPoolProvider:(id)a4
{
  if (!a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    objc_super v9 = NSString;
    int v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = [v9 stringWithFormat:@"Cannot prepare %@ with a nil formatProvider!", NSStringFromClass(v10)];
    goto LABEL_10;
  }
  if (!a4)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v12 = NSString;
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v11 = [v12 stringWithFormat:@"Cannot prepare %@ with a nil pixelBufferPoolProvider!", NSStringFromClass(v13)];
LABEL_10:
    objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v11 userInfo:0]);
  }
  int result = [(BWInferenceScheduler *)self->_scheduler prepareForInferenceRequirements:self->_inferenceRequirements dependencyProviderSource:self->_dependencyProvider formatProvider:a3 pixelBufferPoolProvider:a4 connection:self->_connection backPressureDrivenPipelining:self->_backPressureDrivenPipelining];
  if (!result)
  {
    aneContext = self->_aneContext;
    return [(BWEspressoInferenceContext *)aneContext enableIntermediateBufferSharingWithNetworksLoadedFromPath:0];
  }
  return result;
}

- (int)enableIntermediateBufferSharingWithNetworksLoadedFromPath:(id)a3
{
  return [(BWEspressoInferenceContext *)self->_aneContext enableIntermediateBufferSharingWithNetworksLoadedFromPath:a3];
}

- (id)espressoContextForExecutionTarget:(int)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v3 = 64;
      return *(Class *)((char *)&self->super.isa + v3);
    case 3:
      uint64_t v3 = 80;
      return *(Class *)((char *)&self->super.isa + v3);
    case 1:
      uint64_t v3 = 72;
      return *(Class *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (int)performInferencesOnSampleBuffer:(opaqueCMSampleBuffer *)a3 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a4 skippingInferencesWithTypes:(id)a5
{
  return [(BWInferenceScheduler *)self->_scheduler performInferencesForConnection:self->_connection usingInputSampleBuffer:a3 attachingResultsToSampleBuffer:a4 skippingInferencesWithTypes:a5];
}

- (BOOL)isConfiguredForInference
{
  return [(NSMutableArray *)self->_inferenceRequirements count] != 0;
}

uint64_t __44__BWInferenceEngine_isNeuralEngineSupported__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isNeuralEngineSupported_neuralEngineSupported = result;
  return result;
}

- (void)setBackPressureDrivenPipelining:(BOOL)a3
{
  self->_backPressureDrivenPipelining = a3;
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(BWInferenceScheduler *)self->_scheduler unregisterInferenceConnection:self->_connection];

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceEngine;
  [(BWInferenceEngine *)&v3 dealloc];
}

- (int)prepareForInferenceWithFormatProvider:(id)a3
{
  int v5 = objc_alloc_init(BWInferenceSingleBufferPoolProvider);
  return [(BWInferenceEngine *)self prepareForInferenceWithFormatProvider:a3 pixelBufferPoolProvider:v5];
}

- (int)performInferencesOnSampleBuffer:(opaqueCMSampleBuffer *)a3 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  return [(BWInferenceEngine *)self performInferencesOnSampleBuffer:a3 attachingResultsToSampleBuffer:a4 skippingInferencesWithTypes:0];
}

- (int)prewarmInferencesUsingLimitedMemory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  inferenceRequirements = self->_inferenceRequirements;
  uint64_t v5 = [(NSMutableArray *)inferenceRequirements countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(inferenceRequirements);
      }
      int v9 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "provider"), "prewarmUsingLimitedMemory:", v3);
    }
    int v10 = v9;
    uint64_t v6 = [(NSMutableArray *)inferenceRequirements countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);
  return v10;
}

- (id)newMetalEvent
{
  id v2 = [(BWMetalInferenceContext *)self->_defaultDeviceMetalContext device];
  return (id)[(MTLDevice *)v2 newEvent];
}

- (id)metalCommandBuffer
{
  id v2 = [(BWMetalInferenceContext *)self->_defaultDeviceMetalContext commandQueue];
  return (id)[(MTLCommandQueue *)v2 commandBuffer];
}

- (BOOL)requiresDeviceOrientationMetadata
{
  return self->_requiresDeviceOrientationMetadata;
}

- (BOOL)backPressureDrivenPipelining
{
  return self->_backPressureDrivenPipelining;
}

@end