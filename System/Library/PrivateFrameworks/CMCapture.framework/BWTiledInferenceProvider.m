@interface BWTiledInferenceProvider
+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:;
+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 appliesFinalCropRect:;
+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 includesInvalidContent:;
+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 includesInvalidContent:(BOOL)a5 appliesFinalCropRect:;
+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:;
+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 appliesFinalCropRect:;
+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 includesInvalidContent:;
+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 includesInvalidContent:(BOOL)a6 appliesFinalCropRect:;
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (BWTiledInferenceProvider)initWithConfiguration:(id)a3 inputVideoRequirements:(id)a4 outputVideoRequirements:(id)a5 resourceProvider:(id)a6;
- (CVMetalTextureRef)_cachedTexturesFromPixelBuffer:(uint64_t)a3 usage:;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)newStorage;
- (int)createInputTileFor:(id)a3 to:(id)a4 withInputs:(id)a5 atPosition:(id)a6 encodeToCmdBuffer:;
- (int)executionTarget;
- (int)loadNetworkWithURL:(id)a3 configName:(id)a4 inferenceType:(int)a5 maxTileCount:(id)a6 inputFormatsByBindingName:(id)a7 outputFormatsByBindingName:(id)a8 additionalVideoRequirements:;
- (int)preProcessOutputTexture:(id)a3 forMediaKey:(id)a4 encodeToCmdBuffer:(id)a5;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5;
- (int)purgeIntermediateResources;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7 currentTileCount:;
- (int)type;
- (int)writeOutputFor:(id)a3 to:(id)a4 fromNetworkOutputTiles:(id)a5 withAdditionalTextures:(id)a6 withInputTileTextures:(id)a7 withInputFullTextures:(id)a8 atPosition:(id)a9 encodeToCmdBuffer:;
- (uint64_t)_metalTextureFormatFromPixelBufferFormat:(int)a3 forPlane:;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWTiledInferenceProvider

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 includesInvalidContent:(BOOL)a5 appliesFinalCropRect:
{
  return (id)[a1 videoFormatWithPixelFormat:*(void *)&a3 size:a4 sliceCount:0 includesInvalidContent:a5 appliesFinalCropRect:v5];
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 includesInvalidContent:(BOOL)a6 appliesFinalCropRect:
{
  int v7 = v6;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v11 = *(void *)&a3;
  v16[1] = *MEMORY[0x1E4F143B8];
  v12 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v12 setWidth:(unsigned __int16)a4];
  [(BWVideoFormatRequirements *)v12 setHeight:HIWORD(a4)];
  [(BWVideoFormatRequirements *)v12 setSliceCount:v9];
  if (v7) {
    id v13 = +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:@"TiledEspresso"];
  }
  else {
    id v13 = 0;
  }
  [(BWInferenceVideoFormatRequirements *)v12 setCropDescriptor:v13];
  v16[0] = [NSNumber numberWithInt:v11];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1]);
  [(BWInferenceVideoFormatRequirements *)v12 setDeviceOriented:0];
  [(BWVideoFormatRequirements *)v12 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v12 setIncludesInvalidContent:v8];
  v15 = v12;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1]);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(void *)&a3);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(void *)&a3, *(void *)&a4);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 appliesFinalCropRect:
{
  return (id)[a1 videoFormatWithPixelFormat:*(void *)&a3 size:a4 sliceCount:0 includesInvalidContent:0 appliesFinalCropRect:v4];
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 appliesFinalCropRect:
{
  return (id)[a1 videoFormatWithPixelFormat:*(void *)&a3 size:*(void *)&a4 sliceCount:a5 includesInvalidContent:0 appliesFinalCropRect:v5];
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 includesInvalidContent:
{
  return (id)[a1 videoFormatWithPixelFormat:*(void *)&a3 size:a4 sliceCount:0 includesInvalidContent:v4 appliesFinalCropRect:0];
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 includesInvalidContent:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(void *)&a3, *(void *)&a4, a5);
}

+ (void)initialize
{
}

- (BWTiledInferenceProvider)initWithConfiguration:(id)a3 inputVideoRequirements:(id)a4 outputVideoRequirements:(id)a5 resourceProvider:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)BWTiledInferenceProvider;
  v10 = [(BWTiledInferenceProvider *)&v12 init];
  if (v10)
  {
    v10->_configuration = (BWTiledEspressoInferenceConfiguration *)a3;
    objc_storeWeak((id *)&v10->_resourceProvider, a6);
    v10->_inputVideoRequirements = (NSArray *)a4;
    v10->_outputVideoRequirements = (NSArray *)a5;
    *(_DWORD *)v10->_maxTileCount = 0;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWTiledInferenceProvider;
  [(BWTiledInferenceProvider *)&v3 dealloc];
}

- (NSArray)inputVideoRequirements
{
  return self->_inputVideoRequirements;
}

- (NSArray)outputVideoRequirements
{
  return self->_outputVideoRequirements;
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)loadNetworkWithURL:(id)a3 configName:(id)a4 inferenceType:(int)a5 maxTileCount:(id)a6 inputFormatsByBindingName:(id)a7 outputFormatsByBindingName:(id)a8 additionalVideoRequirements:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (self->_espressoProvider) {
    return 0;
  }
  uint64_t v11 = *(void *)&a5;
  int v35 = (int)a6;
  v15 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  v38 = (void *)[MEMORY[0x1E4F1CA48] array];
  v37 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (![(NSArray *)self->_inputVideoRequirements count]) {
    goto LABEL_28;
  }
  if (![(NSArray *)self->_outputVideoRequirements count]) {
    goto LABEL_28;
  }
  if (![a7 count]) {
    goto LABEL_28;
  }
  if (![a8 count]) {
    goto LABEL_28;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) == 0)goto LABEL_28; {
  v33 = (void *)v16;
  }
  id v34 = a8;
  uint64_t v17 = [objc_loadWeak((id *)&self->_resourceProvider) espressoContextForExecutionTarget:3];
  *(_DWORD *)self->_maxTileCount = v35;
  uint64_t v18 = v11;
  v19 = [BWEspressoInferenceProvider alloc];
  unsigned int v36 = [(BWInferenceConfiguration *)self->_configuration priority];
  LODWORD(v32) = 0;
  v20 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v19, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", v18, a3, a4, v17, 3, v36, [MEMORY[0x1E4F1CAD0] set], objc_loadWeak((id *)&self->_resourceProvider), v32, 2);
  self->_espressoProvider = v20;
  if (v20)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v21 = [a7 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v44;
LABEL_11:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(a7);
        }
        uint64_t v25 = *(void *)(*((void *)&v43 + 1) + 8 * v24);
        [v38 addObject:v25];
        [v15 addObject:-[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](self->_espressoProvider, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v25, objc_msgSend(NSString, "stringWithFormat:", @"TileInput_%@", v25), objc_msgSend(a7, "objectForKeyedSubscript:", v25))];
        if (![v15 lastObject]) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [a7 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v22) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      self->_tileInputBindingNames = (NSArray *)v38;
      self->_tileInputVideoRequirements = (NSArray *)v15;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v26 = [v34 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (!v26)
      {
LABEL_25:
        self->_tileOutputBindingNames = (NSArray *)v37;
        self->_tileOutputVideoRequirements = (NSArray *)v33;
        v31 = v51;
        int result = 0;
        self->_additionalVideoRequirements = v31;
        return result;
      }
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
LABEL_19:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v34);
        }
        uint64_t v30 = *(void *)(*((void *)&v39 + 1) + 8 * v29);
        [v37 addObject:v30];
        [v33 addObject:-[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](self->_espressoProvider, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v30, objc_msgSend(NSString, "stringWithFormat:", @"TileOutput_%@", v30), objc_msgSend(v34, "objectForKeyedSubscript:", v30))];
        if (![v33 lastObject]) {
          break;
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [v34 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v27) {
            goto LABEL_19;
          }
          goto LABEL_25;
        }
      }
    }
    return FigSignalErrorAt();
  }
  else
  {
LABEL_28:
    return FigSignalErrorAt();
  }
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7 currentTileCount:
{
  unsigned int v8 = v7;
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  unsigned int v12 = [(NSArray *)self->_inputVideoRequirements count];
  unsigned int v13 = [(NSArray *)self->_tileInputVideoRequirements count];
  unsigned int v14 = [(NSArray *)self->_outputVideoRequirements count];
  unsigned int v15 = [(NSArray *)self->_tileOutputVideoRequirements count];
  if (objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "count") != 2
    || (unsigned __int16)v8 > *(unsigned __int16 *)self->_maxTileCount
    || HIWORD(v8) > *(unsigned __int16 *)&self->_maxTileCount[2])
  {
    v109 = 0;
    goto LABEL_122;
  }
  unsigned int v95 = HIWORD(v8);
  int v90 = (unsigned __int16)v8;
  v109 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
  v110 = (CFTypeRef *)malloc_type_calloc(2 * v13, 8uLL, 0x2004093837F09uLL);
  if (!v110)
  {
LABEL_122:
    uint64_t v83 = FigSignalErrorAt();
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    v105 = 0;
    v107 = 0;
    v108 = 0;
    BOOL v84 = 1;
    goto LABEL_98;
  }
  uint64_t v16 = malloc_type_calloc(2 * v13, 8uLL, 0x80040B8603338uLL);
  unsigned int v98 = v14;
  unsigned int v101 = v13;
  if (!v16)
  {
    uint64_t v83 = FigSignalErrorAt();
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    v105 = 0;
    v107 = 0;
    v108 = 0;
    goto LABEL_125;
  }
  unsigned int v89 = v8;
  uint64_t v106 = v13;
  v108 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:");
  v107 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_additionalVideoRequirements, "count"));
  uint64_t v104 = v15;
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:");
  uint64_t v18 = (char *)malloc_type_calloc(v14, 8uLL, 0x2004093837F09uLL);
  if (!v18 || (v19 = malloc_type_calloc(v14, 8uLL, 0x80040B8603338uLL)) == 0)
  {
    uint64_t v83 = FigSignalErrorAt();
    v105 = 0;
    goto LABEL_125;
  }
  v105 = v19;
  v97 = v18;
  v100 = v17;
  if (v12)
  {
    uint64_t v20 = 0;
    while (1)
    {
      id v21 = [(NSArray *)self->_inputVideoRequirements objectAtIndexedSubscript:v20];
      uint64_t v22 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inputVideoRequirements, "objectAtIndexedSubscript:", v20), "attachedMediaKey");
      int v23 = [v21 videoStorageType];
      if (v23 == 1) {
        break;
      }
      if (!v23)
      {
        CVMetalTextureRef v24 = -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, (__CVBuffer *)[a4 pixelBufferForRequirement:v21], 17);
LABEL_14:
        [v109 setObject:v24 forKeyedSubscript:v22];
      }
      if (![v109 objectForKeyedSubscript:v22])
      {
        uint64_t v83 = FigSignalErrorAt();
        BOOL v84 = 1;
LABEL_85:
        uint64_t v17 = v100;
LABEL_86:
        uint64_t v18 = v97;
        goto LABEL_87;
      }
      if (v12 == ++v20) {
        goto LABEL_17;
      }
    }
    long long v127 = *(_OWORD *)objc_msgSend((id)objc_msgSend(a4, "textureStorage"), "entryForRequirement:", v21);
    CVMetalTextureRef v24 = (CVMetalTextureRef)[MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:2];
    goto LABEL_14;
  }
LABEL_17:
  uint64_t v103 = v14;
  id v94 = a7;
  if (v101)
  {
    for (uint64_t i = 0; i != v106; ++i)
    {
      id v26 = [(NSArray *)self->_tileInputVideoRequirements objectAtIndexedSubscript:i];
      uint64_t v27 = 0;
      uint64_t v28 = 2 * i;
      char v29 = 1;
      do
      {
        char v30 = v29;
        v31 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v26), "newPixelBuffer");
        if (!v31)
        {
LABEL_84:
          uint64_t v83 = FigSignalErrorAt();
          BOOL v84 = 1;
          a7 = v94;
          goto LABEL_85;
        }
        uint64_t v32 = v31;
        v110[v27 | v28] = v31;
        v16[v27 | v28] = -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, v31, 23);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v27), "setPixelBuffer:forRequirement:", v32, v26);
        char v29 = 0;
        uint64_t v27 = 1;
      }
      while ((v30 & 1) != 0);
    }
  }
  uint64_t v33 = 0;
  char v34 = 1;
  do
  {
    char v102 = v34;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    tileOutputVideoRequirements = self->_tileOutputVideoRequirements;
    uint64_t v36 = [(NSArray *)tileOutputVideoRequirements countByEnumeratingWithState:&v121 objects:v126 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v122;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v122 != v38) {
            objc_enumerationMutation(tileOutputVideoRequirements);
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v33), "setPixelBufferPool:forRequirement:", objc_msgSend(a4, "pixelBufferPoolForRequirement:", *(void *)(*((void *)&v121 + 1) + 8 * j)), *(void *)(*((void *)&v121 + 1) + 8 * j));
        }
        uint64_t v37 = [(NSArray *)tileOutputVideoRequirements countByEnumeratingWithState:&v121 objects:v126 count:16];
      }
      while (v37);
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    additionalVideoRequirements = self->_additionalVideoRequirements;
    uint64_t v41 = [(NSArray *)additionalVideoRequirements countByEnumeratingWithState:&v117 objects:v125 count:16];
    if (v41)
    {
      uint64_t v43 = v41;
      uint64_t v44 = *(void *)v118;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v118 != v44) {
            objc_enumerationMutation(additionalVideoRequirements);
          }
          uint64_t v46 = *(void *)(*((void *)&v117 + 1) + 8 * k);
          uint64_t v47 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v46), "newPixelBuffer");
          if (!v47) {
            goto LABEL_84;
          }
          v48 = (const void *)v47;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v33), "setPixelBuffer:forRequirement:", v47, v46);
          CFRelease(v48);
        }
        uint64_t v43 = [(NSArray *)additionalVideoRequirements countByEnumeratingWithState:&v117 objects:v125 count:16];
      }
      while (v43);
    }
    char v34 = 0;
    uint64_t v33 = 1;
  }
  while ((v102 & 1) != 0);
  a7 = v94;
  uint64_t v17 = v100;
  if (!v98)
  {
LABEL_48:
    if (v90)
    {
      __int32 v91 = 0;
      BOOL v99 = 0;
      v54 = 0;
      unsigned int v55 = v101;
      int v56 = v95;
      unsigned int v86 = v95 - 1;
      if (v95 <= 1) {
        int v56 = 1;
      }
      int v87 = v56;
      while (v89 < 0x10000)
      {
LABEL_82:
        if (++v91 == v90) {
          goto LABEL_103;
        }
      }
      unsigned int v57 = 0;
      v42.i32[0] = v91;
      unsigned __int32 v88 = vmovl_u16(v42).u32[0];
      while (1)
      {
        unsigned int v58 = v57;
        unint64_t v96 = __PAIR64__(v57, v88);
        if (v55)
        {
          uint64_t v59 = 0;
          HIWORD(v112) = v57;
          LOWORD(v112) = v88;
          int v60 = v99;
          while (1)
          {
            v61 = objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
            uint64_t v62 = [(BWTiledInferenceProvider *)self createInputTileFor:[(NSArray *)self->_tileInputBindingNames objectAtIndexedSubscript:v59] to:v16[v60] withInputs:v109 atPosition:v112 encodeToCmdBuffer:v61];
            if (v62) {
              break;
            }
            objc_msgSend(v108, "setObject:forKeyedSubscript:", v16[v60], -[NSArray objectAtIndexedSubscript:](self->_tileInputBindingNames, "objectAtIndexedSubscript:", v59));
            [v61 commit];
            if (v101 - 1 == v59) {
              [v61 waitUntilScheduled];
            }
            ++v59;
            v60 += 2;
            if (v106 == v59) {
              goto LABEL_60;
            }
          }
          uint64_t v83 = v62;
          FigSignalErrorAt();
          goto LABEL_115;
        }
LABEL_60:
        BOOL v63 = [(BWTiledEspressoInferenceConfiguration *)self->_configuration forceSynchronousInference];
        espressoProvider = self->_espressoProvider;
        uint64_t v65 = objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v99);
        if (v63)
        {
          long long v115 = *(_OWORD *)&a5->var0;
          int64_t var3 = a5->var3;
          uint64_t v66 = [(BWEspressoInferenceProvider *)espressoProvider executeOnSampleBuffer:a3 usingStorage:v65 withExecutionTime:&v115 completionHandler:0];
        }
        else
        {
          espressoWorkQueue = self->_espressoWorkQueue;
          long long v115 = *(_OWORD *)&a5->var0;
          int64_t var3 = a5->var3;
          uint64_t v66 = [(BWEspressoInferenceProvider *)espressoProvider submitForSampleBuffer:a3 usingStorage:v65 withSubmissionTime:&v115 workQueue:espressoWorkQueue completionHandler:0];
        }
        uint64_t v83 = v66;
        uint64_t v17 = v100;
        if (v66) {
          goto LABEL_117;
        }
        if (v104)
        {
          uint64_t v68 = 0;
          while (1)
          {
            v69 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v99), "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](self->_tileOutputVideoRequirements, "objectAtIndexedSubscript:", v68));
            if (!v69) {
              break;
            }
            objc_msgSend(v100, "setObject:forKeyedSubscript:", -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, v69, 17), -[NSArray objectAtIndexedSubscript:](self->_tileOutputBindingNames, "objectAtIndexedSubscript:", v68++));
            if (v104 == v68) {
              goto LABEL_68;
            }
          }
          uint64_t v83 = FigSignalErrorAt();
          goto LABEL_118;
        }
LABEL_68:
        if ([(NSArray *)self->_additionalVideoRequirements count])
        {
          uint64_t v70 = 0;
          while (1)
          {
            uint64_t v71 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_additionalVideoRequirements, "objectAtIndexedSubscript:", v70), "attachedMediaKey");
            v72 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v99), "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](self->_additionalVideoRequirements, "objectAtIndexedSubscript:", v70));
            if (!v72) {
              break;
            }
            objc_msgSend(v107, "setObject:forKeyedSubscript:", -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, v72, 23), v71);
            if ([(NSArray *)self->_additionalVideoRequirements count] <= ++v70) {
              goto LABEL_72;
            }
          }
          uint64_t v83 = FigSignalErrorAt();
LABEL_115:
          BOOL v84 = 1;
          uint64_t v17 = v100;
          goto LABEL_119;
        }
LABEL_72:
        uint64_t v17 = v100;
        unsigned int v55 = v101;
        v73 = v105;
        if (v98) {
          break;
        }
LABEL_78:
        [v54 addCompletedHandler:&__block_literal_global_31];
        if (v90 - 1 != v91 || v86 != v58) {
          [v54 commit];
        }
        BOOL v99 = !v99;
        [v108 removeAllObjects];
        [v107 removeAllObjects];
        [v100 removeAllObjects];
        unsigned int v57 = v58 + 1;
        if (v58 + 1 == v87) {
          goto LABEL_82;
        }
      }
      uint64_t v74 = 0;
      HIWORD(v111) = WORD2(v96);
      LOWORD(v111) = v96;
      while (1)
      {
        v54 = objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
        LODWORD(v85) = v111;
        uint64_t v75 = -[BWTiledInferenceProvider writeOutputFor:to:fromNetworkOutputTiles:withAdditionalTextures:withInputTileTextures:withInputFullTextures:atPosition:encodeToCmdBuffer:](self, "writeOutputFor:to:fromNetworkOutputTiles:withAdditionalTextures:withInputTileTextures:withInputFullTextures:atPosition:encodeToCmdBuffer:", objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v74), "attachedMediaKey"), v73[v74], v100, v107, v108, v109, v85, v54);
        if (v75) {
          break;
        }
        if (v98 - 1 != v74) {
          [v54 commit];
        }
        ++v74;
        v73 = v105;
        if (v103 == v74) {
          goto LABEL_78;
        }
      }
      uint64_t v83 = v75;
LABEL_117:
      FigSignalErrorAt();
LABEL_118:
      BOOL v84 = 1;
LABEL_119:
      uint64_t v18 = v97;
      a7 = v94;
    }
    else
    {
      v54 = 0;
LABEL_103:
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", 0), "clear");
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", 1), "clear");
      if (v98)
      {
        uint64_t v81 = 0;
        do
        {
          objc_msgSend(a4, "setPixelBuffer:forRequirement:", *(void *)&v97[8 * v81], -[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v81));
          ++v81;
        }
        while (v103 != v81);
      }
      BOOL v84 = v54 == 0;
      uint64_t v18 = v97;
      a7 = v94;
      if (v54)
      {
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v113[2] = __127__BWTiledInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount___block_invoke_2;
        v113[3] = &unk_1E5C24730;
        int v114 = 0;
        v113[4] = self;
        v113[5] = v94;
        [v54 addScheduledHandler:v113];
        [v54 commit];
      }
      textureCache = self->_textureCache;
      if (textureCache) {
        CVMetalTextureCacheFlush(textureCache, 0);
      }
      [(BWTiledInferenceProvider *)self purgeIntermediateResources];
      uint64_t v83 = 0;
    }
    goto LABEL_87;
  }
  uint64_t v49 = 0;
  while (1)
  {
    id v50 = [(NSArray *)self->_outputVideoRequirements objectAtIndexedSubscript:v49];
    int v51 = [v50 videoStorageType];
    if (!v51) {
      break;
    }
    if (v51 == 1)
    {
      uint64_t v83 = FigSignalErrorAt();
      BOOL v84 = 1;
      goto LABEL_86;
    }
LABEL_47:
    v53 = objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
    -[BWTiledInferenceProvider preProcessOutputTexture:forMediaKey:encodeToCmdBuffer:](self, "preProcessOutputTexture:forMediaKey:encodeToCmdBuffer:", v105[v49], objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v49), "attachedMediaKey"), v53);
    [v53 commit];
    if (v103 == ++v49) {
      goto LABEL_48;
    }
  }
  v52 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v50), "newPixelBuffer");
  uint64_t v18 = v97;
  if (v52)
  {
    *(void *)&v97[8 * v49] = v52;
    v105[v49] = -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, v52, 22);
    goto LABEL_47;
  }
  uint64_t v83 = FigSignalErrorAt();
LABEL_125:
  BOOL v84 = 1;
LABEL_87:
  uint64_t v76 = 2 * v101;
  if (v76)
  {
    v77 = v110;
    do
    {
      if (*v77) {
        CFRelease(*v77);
      }
      ++v77;
      --v76;
    }
    while (v76);
  }
  free(v110);
  if (v18 && v98)
  {
    uint64_t v78 = 0;
    do
    {
      v79 = *(const void **)&v18[v78];
      if (v79) {
        CFRelease(v79);
      }
      v78 += 8;
    }
    while (8 * v98 != v78);
  }
LABEL_98:
  free(v18);
  free(v105);
  free(v16);

  if (a7 && v84) {
    (*((void (**)(id, uint64_t, BWTiledInferenceProvider *))a7 + 2))(a7, v83, self);
  }
  return v83;
}

- (CVMetalTextureRef)_cachedTexturesFromPixelBuffer:(uint64_t)a3 usage:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    CVMetalTextureRef image = 0;
    int result = (CVMetalTextureRef)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    if (result)
    {
      CVMetalTextureRef v5 = result;
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
      size_t PlaneCount = CVPixelBufferGetPlaneCount(a2);
      size_t v8 = 0;
      unsigned int v9 = 0;
      if (PlaneCount <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = PlaneCount;
      }
      unint64_t v17 = v10;
      int v20 = PixelFormatType;
      char v11 = PixelFormatType == 1647719528;
      uint64_t v18 = *MEMORY[0x1E4F24C88];
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      while (1)
      {
        unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a2, v8);
        unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a2, v8);
        uint64_t v15 = -[BWTiledInferenceProvider _metalTextureFormatFromPixelBufferFormat:forPlane:](v4, v20, v9);
        if (!v15) {
          break;
        }
        MTLPixelFormat v16 = v15;
        uint64_t v22 = v18;
        v23[0] = [NSNumber numberWithUnsignedInteger:a3];
        if (CVMetalTextureCacheCreateTextureFromImage(v12, *(CVMetalTextureCacheRef *)(v4 + 112), a2, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1], v16, WidthOfPlane >> v11, HeightOfPlane >> v11, v8, &image))
        {
          break;
        }
        [(__CVBuffer *)v5 setObject:CVMetalTextureGetTexture(image) atIndexedSubscript:v8];
        if (![(__CVBuffer *)v5 objectAtIndexedSubscript:v8]) {
          break;
        }
        if (image) {
          CFRelease(image);
        }
        size_t v8 = ++v9;
        if (v17 <= v9) {
          return v5;
        }
      }

      int result = image;
      if (image)
      {
        CFRelease(image);
        return 0;
      }
    }
  }
  return result;
}

uint64_t __127__BWTiledInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v7 = *(unsigned int *)self->_maxTileCount;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  return [(BWTiledInferenceProvider *)self submitForSampleBuffer:a3 usingStorage:a4 withSubmissionTime:&v9 workQueue:a6 completionHandler:a7 currentTileCount:v7];
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (!self->_espressoProvider)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F55F60]);
  int v6 = (FigMetalContext *)objc_msgSend(v5, "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), -[BWTiledEspressoInferenceConfiguration metalCommandQueue](self->_configuration, "metalCommandQueue"));
  self->_metalContext = v6;
  if (!v6) {
    return -12786;
  }
  uint64_t v10 = *MEMORY[0x1E4F24C78];
  v11[0] = &unk_1EFAFE628;
  CFDictionaryRef v7 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  if (CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, (id)[(FigMetalContext *)self->_metalContext device], 0, &self->_textureCache))
  {
    return 0;
  }
  int v8 = [(BWEspressoInferenceProvider *)self->_espressoProvider prepareForSubmissionWithWorkQueue:a3];
  if (v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_espressoWorkQueue = (OS_dispatch_queue *)a3;
  }
  return v8;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  uint64_t v10 = [(NSArray *)outputVideoRequirements countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(outputVideoRequirements);
        }
        [(BWTiledInferenceProvider *)self propagateInferenceResultForOutputRequirement:*(void *)(*((void *)&v14 + 1) + 8 * i) storage:a4 propagationSampleBuffer:a6];
      }
      uint64_t v11 = [(NSArray *)outputVideoRequirements countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (id)newStorage
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_espressoProvider)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ([(NSArray *)self->_inputVideoRequirements count])
    {
      unint64_t v5 = 0;
      do
      {
        id v6 = [(NSArray *)self->_inputVideoRequirements objectAtIndexedSubscript:v5];
        if (![v6 videoStorageType]) {
          [v4 addObject:v6];
        }
        ++v5;
      }
      while (v5 < [(NSArray *)self->_inputVideoRequirements count]);
    }
    CFDictionaryRef v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ([(NSArray *)self->_outputVideoRequirements count])
    {
      unint64_t v8 = 0;
      do
      {
        id v9 = [(NSArray *)self->_outputVideoRequirements objectAtIndexedSubscript:v8];
        if (![v9 videoStorageType]) {
          [v7 addObject:v9];
        }
        ++v8;
      }
      while (v8 < [(NSArray *)self->_outputVideoRequirements count]);
    }
    uint64_t v10 = 0;
    char v11 = 1;
    do
    {
      char v12 = v11;
      objc_msgSend(v3, "addObject:", -[BWEspressoInferenceProvider newStorage](self->_espressoProvider, "newStorage"));
      objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v10), "requirementsNeedingPixelBuffers"));
      objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v10), "requirementsNeedingPixelBufferPools"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      additionalVideoRequirements = self->_additionalVideoRequirements;
      uint64_t v14 = [(NSArray *)additionalVideoRequirements countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(additionalVideoRequirements);
            }
            [v7 addObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          }
          uint64_t v15 = [(NSArray *)additionalVideoRequirements countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v15);
      }
      char v11 = 0;
      uint64_t v10 = 1;
    }
    while ((v12 & 1) != 0);
    return [[BWTiledInferenceStorage alloc] initWithRequirementsNeedingPixelBuffers:v4 requirementsNeedingPixelBufferPools:v7 espressoStorages:v3];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (int)preProcessOutputTexture:(id)a3 forMediaKey:(id)a4 encodeToCmdBuffer:(id)a5
{
  return 0;
}

- (int)createInputTileFor:(id)a3 to:(id)a4 withInputs:(id)a5 atPosition:(id)a6 encodeToCmdBuffer:
{
}

- (int)writeOutputFor:(id)a3 to:(id)a4 fromNetworkOutputTiles:(id)a5 withAdditionalTextures:(id)a6 withInputTileTextures:(id)a7 withInputFullTextures:(id)a8 atPosition:(id)a9 encodeToCmdBuffer:
{
}

- (int)purgeIntermediateResources
{
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
}

- (uint64_t)_metalTextureFormatFromPixelBufferFormat:(int)a3 forPlane:
{
  if (result)
  {
    if (a2 > 1111970368)
    {
      if (a2 > 1647719527)
      {
        if (a2 <= 2019963439)
        {
          if (a2 != 1647719528)
          {
            if (a2 != 1751527984)
            {
              int v3 = 1885745712;
              goto LABEL_29;
            }
            BOOL v5 = a3 == 0;
            uint64_t v6 = 65;
            uint64_t v7 = 25;
            goto LABEL_32;
          }
          return 115;
        }
        if (a2 == 2019963440)
        {
          BOOL v5 = a3 == 0;
          uint64_t v6 = 60;
          uint64_t v7 = 20;
LABEL_32:
          if (v5) {
            return v7;
          }
          else {
            return v6;
          }
        }
        if (a2 != 2084070960)
        {
          int v3 = 2088265264;
          goto LABEL_29;
        }
        goto LABEL_31;
      }
      if (a2 <= 1278226533)
      {
        if (a2 == 1111970369) {
          return 80;
        }
        if (a2 == 1278226488) {
          return 10;
        }
        return 0;
      }
      switch(a2)
      {
        case 1278226534:
          return 55;
        case 1278226536:
          return 25;
        case 1380411457:
          return 115;
      }
      return 0;
    }
    if (a2 > 796419631)
    {
      if (a2 > 843264103)
      {
        if (a2 == 843264104) {
          return 65;
        }
        if (a2 == 875704422) {
          goto LABEL_31;
        }
        int v4 = 875704438;
LABEL_22:
        if (a2 == v4) {
          goto LABEL_31;
        }
        return 0;
      }
      if (a2 != 796419632)
      {
        if (a2 == 843264056) {
          return 30;
        }
        return 0;
      }
    }
    else
    {
      if (a2 <= 758670895)
      {
        if (a2 != 641230384)
        {
          int v3 = 645424688;
LABEL_29:
          if (a2 != v3) {
            return 0;
          }
          goto LABEL_41;
        }
        goto LABEL_31;
      }
      if (a2 == 758670896)
      {
LABEL_31:
        BOOL v5 = a3 == 0;
        uint64_t v6 = 30;
        uint64_t v7 = 10;
        goto LABEL_32;
      }
      if (a2 != 762865200)
      {
        int v4 = 792225328;
        goto LABEL_22;
      }
    }
LABEL_41:
    if (a3) {
      return 589;
    }
    else {
      return 588;
    }
  }
  return result;
}

- (int)type
{
  return self->type;
}

- (void).cxx_destruct
{
}

@end