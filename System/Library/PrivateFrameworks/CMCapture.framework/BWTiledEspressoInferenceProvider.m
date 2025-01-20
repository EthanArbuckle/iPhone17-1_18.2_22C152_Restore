@interface BWTiledEspressoInferenceProvider
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
- (BWTiledEspressoInferenceProvider)initWithConfiguration:(id)a3 inputVideoRequirements:(id)a4 outputVideoRequirements:(id)a5 resourceProvider:(id)a6;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)newStorage;
- (id)outputRequirementsToProduceForInputSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:;
- (int)executionTarget;
- (int)loadNetworkWithURL:(id)a3 configName:(id)a4 inferenceType:(int)a5 maxTileCount:(id)a6 inputFormatsByBindingName:(id)a7 outputFormatsByBindingName:(id)a8 additionalVideoRequirements:;
- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5;
- (int)purgeIntermediateResources;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7 currentTileCount:;
- (int)type;
- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWTiledEspressoInferenceProvider

- (NSArray)outputVideoRequirements
{
  return self->_outputVideoRequirements;
}

- (NSArray)inputVideoRequirements
{
  return self->_inputVideoRequirements;
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 appliesFinalCropRect:
{
  return (id)[a1 videoFormatWithPixelFormat:*(void *)&a3 size:a4 sliceCount:0 includesInvalidContent:0 appliesFinalCropRect:v4];
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(void *)&a3);
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

- (BWTiledEspressoInferenceProvider)initWithConfiguration:(id)a3 inputVideoRequirements:(id)a4 outputVideoRequirements:(id)a5 resourceProvider:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)BWTiledEspressoInferenceProvider;
  v10 = [(BWTiledEspressoInferenceProvider *)&v12 init];
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

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  espressoProvider = self->_espressoProvider;
  if (espressoProvider)
  {
    int v6 = -[BWEspressoInferenceProvider prepareForSubmissionWithWorkQueue:](espressoProvider, "prepareForSubmissionWithWorkQueue:");
    if (v6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      self->_espressoWorkQueue = (OS_dispatch_queue *)a3;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v6;
}

- (int)loadNetworkWithURL:(id)a3 configName:(id)a4 inferenceType:(int)a5 maxTileCount:(id)a6 inputFormatsByBindingName:(id)a7 outputFormatsByBindingName:(id)a8 additionalVideoRequirements:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (self->_espressoProvider) {
    return 0;
  }
  int v11 = (int)a6;
  v16 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  v43 = (void *)[MEMORY[0x1E4F1CA48] array];
  v42 = (void *)[MEMORY[0x1E4F1CA48] array];
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
  unsigned int v41 = a5;
  id v18 = a3;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) == 0)goto LABEL_28; {
  v39 = (void *)v17;
  }
  id v40 = a8;
  uint64_t v19 = [objc_loadWeak((id *)&self->_resourceProvider) espressoContextForExecutionTarget:3];
  *(_DWORD *)self->_maxTileCount = v11;
  v20 = [BWEspressoInferenceProvider alloc];
  id v21 = v18;
  id v22 = a4;
  uint64_t v23 = [(BWInferenceConfiguration *)self->_configuration priority];
  uint64_t v24 = [MEMORY[0x1E4F1CAD0] set];
  id Weak = objc_loadWeak((id *)&self->_resourceProvider);
  LODWORD(v38) = [(BWTiledEspressoInferenceProvider *)self allowedPixelBufferCompressionDirection];
  v26 = [(BWEspressoInferenceProvider *)v20 initWithType:v41 networkURL:v21 networkConfiguration:v22 context:v19 executionTarget:3 schedulerPriority:v23 preventionReasons:v24 resourceProvider:Weak allowedCompressionDirection:v38 concurrentSubmissionLimit:2];
  self->_espressoProvider = v26;
  if (v26)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v27 = [a7 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v49;
LABEL_11:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(a7);
        }
        uint64_t v31 = *(void *)(*((void *)&v48 + 1) + 8 * v30);
        [v43 addObject:v31];
        [v16 addObject:-[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](self->_espressoProvider, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v31, objc_msgSend(NSString, "stringWithFormat:", @"TileInput_%i_%@", -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType"), v31), objc_msgSend(a7, "objectForKeyedSubscript:", v31))];
        if (![v16 lastObject]) {
          break;
        }
        if (v28 == ++v30)
        {
          uint64_t v28 = [a7 countByEnumeratingWithState:&v48 objects:v53 count:16];
          if (v28) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      self->_tileInputBindingNames = (NSArray *)v43;
      self->_tileInputVideoRequirements = (NSArray *)v16;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v32 = [v40 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (!v32)
      {
LABEL_25:
        self->_tileOutputBindingNames = (NSArray *)v42;
        self->_tileOutputVideoRequirements = (NSArray *)v39;
        v37 = v56;
        int result = 0;
        self->_additionalVideoRequirements = v37;
        return result;
      }
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v45;
LABEL_19:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v40);
        }
        uint64_t v36 = *(void *)(*((void *)&v44 + 1) + 8 * v35);
        [v42 addObject:v36];
        [v39 addObject:-[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](self->_espressoProvider, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v36, objc_msgSend(NSString, "stringWithFormat:", @"TileOutput_%i_%@", -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType"), v36), objc_msgSend(v40, "objectForKeyedSubscript:", v36))];
        if (![v39 lastObject]) {
          break;
        }
        if (v33 == ++v35)
        {
          uint64_t v33 = [v40 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v33) {
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

- (BWInferenceExecutable)executable
{
  return 0;
}

+ (void)initialize
{
}

- (int)type
{
  return [(BWInferenceConfiguration *)self->_configuration inferenceType];
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 includesInvalidContent:(BOOL)a5 appliesFinalCropRect:
{
  return (id)[a1 videoFormatWithPixelFormat:*(void *)&a3 size:a4 sliceCount:0 includesInvalidContent:a5 appliesFinalCropRect:v5];
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(void *)&a3, *(void *)&a4);
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWTiledEspressoInferenceProvider;
  [(BWTiledEspressoInferenceProvider *)&v3 dealloc];
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7 currentTileCount:
{
  unsigned int v8 = v7;
  int v11 = self;
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v12 = -[BWTiledEspressoInferenceProvider outputRequirementsToProduceForInputSampleBuffer:](self, "outputRequirementsToProduceForInputSampleBuffer:", a3, a4, a5, a6);
  unsigned int v13 = [(NSArray *)v11->_inputVideoRequirements count];
  unsigned int v14 = [(NSArray *)v11->_tileInputVideoRequirements count];
  unsigned int v91 = [v12 count];
  unsigned int v15 = [(NSArray *)v11->_tileOutputVideoRequirements count];
  if (objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "count") != 2
    || (unsigned __int16)v8 > *(unsigned __int16 *)v11->_maxTileCount
    || HIWORD(v8) > *(unsigned __int16 *)&v11->_maxTileCount[2])
  {
    uint64_t v17 = 0;
    goto LABEL_110;
  }
  unsigned int v83 = HIWORD(v8);
  unsigned int v79 = v8;
  int v80 = (unsigned __int16)v8;
  v95 = v12;
  uint64_t v16 = v13;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v13];
  id v18 = (CFTypeRef *)malloc_type_calloc(2 * v14, 8uLL, 0x2004093837F09uLL);
  if (!v18)
  {
LABEL_110:
    uint64_t v62 = FigSignalErrorAt();
    v98 = 0;
    v99 = 0;
    v20 = 0;
    v97 = 0;
    int v69 = 1;
    goto LABEL_93;
  }
  uint64_t v19 = v18;
  uint64_t v94 = v14;
  v97 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:");
  v98 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](v11->_additionalVideoRequirements, "count"));
  uint64_t v86 = v15;
  v99 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:");
  v20 = (char *)malloc_type_calloc(v91, 8uLL, 0x2004093837F09uLL);
  v90 = v17;
  if (!v20) {
    goto LABEL_107;
  }
  if (v13)
  {
    uint64_t v21 = 0;
    while (1)
    {
      uint64_t v22 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v11->_inputVideoRequirements, "objectAtIndexedSubscript:", v21), "attachedMediaKey");
      objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(a4, "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](v11->_inputVideoRequirements, "objectAtIndexedSubscript:", v21)), v22);
      if (![v17 objectForKeyedSubscript:v22]) {
        break;
      }
      if (v16 == ++v21) {
        goto LABEL_10;
      }
    }
LABEL_107:
    uint64_t v62 = FigSignalErrorAt();
    int v69 = 1;
    goto LABEL_81;
  }
LABEL_10:
  v96 = v20;
  unsigned int v89 = v14;
  if (v14)
  {
    uint64_t v23 = 0;
    do
    {
      uint64_t v24 = v11;
      uint64_t v25 = [(NSArray *)v11->_tileInputVideoRequirements objectAtIndexedSubscript:v23];
      uint64_t v26 = 0;
      char v27 = 1;
      do
      {
        char v28 = v27;
        uint64_t v29 = v26 | (2 * v23);
        uint64_t v30 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v25), "newPixelBuffer");
        v19[v29] = (CFTypeRef)v30;
        if (!v30)
        {
          uint64_t v62 = FigSignalErrorAt();
          int v69 = 1;
          int v11 = v24;
          goto LABEL_80;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v26), "setPixelBuffer:forRequirement:", v19[v29], v25);
        char v27 = 0;
        uint64_t v26 = 1;
      }
      while ((v28 & 1) != 0);
      ++v23;
      int v11 = v24;
    }
    while (v23 != v94);
  }
  id v82 = a7;
  uint64_t v31 = 0;
  char v32 = 1;
  do
  {
    char v92 = v32;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    tileOutputVideoRequirements = v11->_tileOutputVideoRequirements;
    uint64_t v34 = [(NSArray *)tileOutputVideoRequirements countByEnumeratingWithState:&v110 objects:v115 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v111 != v36) {
            objc_enumerationMutation(tileOutputVideoRequirements);
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v31), "setPixelBufferPool:forRequirement:", objc_msgSend(a4, "pixelBufferPoolForRequirement:", *(void *)(*((void *)&v110 + 1) + 8 * i)), *(void *)(*((void *)&v110 + 1) + 8 * i));
        }
        uint64_t v35 = [(NSArray *)tileOutputVideoRequirements countByEnumeratingWithState:&v110 objects:v115 count:16];
      }
      while (v35);
    }
    long long v109 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v106 = 0u;
    additionalVideoRequirements = v11->_additionalVideoRequirements;
    uint64_t v39 = [(NSArray *)additionalVideoRequirements countByEnumeratingWithState:&v106 objects:v114 count:16];
    if (v39)
    {
      uint64_t v41 = v39;
      uint64_t v42 = *(void *)v107;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v107 != v42) {
            objc_enumerationMutation(additionalVideoRequirements);
          }
          uint64_t v44 = *(void *)(*((void *)&v106 + 1) + 8 * j);
          uint64_t v45 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v44), "newPixelBuffer");
          if (!v45)
          {
            uint64_t v62 = FigSignalErrorAt();
            int v69 = 1;
            a7 = v82;
LABEL_80:
            unsigned int v14 = v89;
            v20 = v96;
            goto LABEL_81;
          }
          long long v46 = (const void *)v45;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v31), "setPixelBuffer:forRequirement:", v45, v44);
          CFRelease(v46);
        }
        uint64_t v41 = [(NSArray *)additionalVideoRequirements countByEnumeratingWithState:&v106 objects:v114 count:16];
      }
      while (v41);
    }
    char v32 = 0;
    uint64_t v31 = 1;
  }
  while ((v92 & 1) != 0);
  uint64_t v47 = v91;
  long long v48 = v97;
  unsigned int v14 = v89;
  v20 = v96;
  if (v91)
  {
    for (uint64_t k = 0;
          k != v91;
          -[BWTiledEspressoInferenceProvider preProcessOutputBuffer:forMediaKey:](v11, "preProcessOutputBuffer:forMediaKey:", v50, objc_msgSend((id)objc_msgSend(v95, "objectAtIndexedSubscript:", k++), "attachedMediaKey")))
    {
      uint64_t v50 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", objc_msgSend(v95, "objectAtIndexedSubscript:", k)), "newPixelBuffer");
      *(void *)&v96[8 * k] = v50;
      if (!v50)
      {
        uint64_t v62 = FigSignalErrorAt();
        int v69 = 1;
        goto LABEL_106;
      }
    }
  }
  if (!v80)
  {
    v77 = 0;
LABEL_98:
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", 0), "clear");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", 1), "clear");
    v20 = v96;
    if (v91)
    {
      uint64_t v75 = 0;
      do
      {
        objc_msgSend(a4, "setPixelBuffer:forRequirement:", *(void *)&v96[8 * v75], objc_msgSend(v95, "objectAtIndexedSubscript:", v75));
        ++v75;
      }
      while (v47 != v75);
    }
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __135__BWTiledEspressoInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount___block_invoke_2;
    v101[3] = &unk_1E5C24730;
    int v102 = 0;
    a7 = v82;
    v101[4] = v11;
    v101[5] = v82;
    [v77 addScheduledHandler:v101];
    [v77 commit];
    [(BWTiledEspressoInferenceProvider *)v11 purgeIntermediateResources];
    int v69 = 0;
    uint64_t v62 = 0;
    goto LABEL_81;
  }
  __int32 v85 = 0;
  BOOL v51 = 0;
  v77 = 0;
  int v52 = v83;
  unsigned int v78 = v83 - 1;
  if (v83 <= 1) {
    int v52 = 1;
  }
  int v81 = v52;
  while (v79 < 0x10000)
  {
LABEL_76:
    if (++v85 == v80) {
      goto LABEL_98;
    }
  }
  int v93 = 0;
  v40.i32[0] = v85;
  unsigned __int16 v84 = vmovl_u16(v40).u16[0];
  while (1)
  {
    id v105 = 0;
    if (v14)
    {
      uint64_t v53 = 0;
      uint64_t v54 = &v19[v51];
      do
      {
        uint64_t v55 = (uint64_t)*v54;
        v54 += 2;
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v55, -[NSArray objectAtIndexedSubscript:](v11->_tileInputBindingNames, "objectAtIndexedSubscript:", v53++));
      }
      while (v94 != v53);
    }
    HIWORD(v100) = v93;
    LOWORD(v100) = v84;
    uint64_t v56 = [(BWTiledEspressoInferenceProvider *)v11 createInputTiles:v48 withInputs:v90 atPosition:v100 cmdBuffer:&v105];
    if (v56) {
      goto LABEL_103;
    }
    [v105 commit];
    [v105 waitUntilScheduled];
    BOOL v57 = [(BWTiledEspressoInferenceConfiguration *)v11->_configuration forceSynchronousInference];
    espressoProvider = v11->_espressoProvider;
    uint64_t v59 = objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v51);
    if (v57)
    {
      long long v103 = *(_OWORD *)&a5->var0;
      int64_t var3 = a5->var3;
      uint64_t v60 = [(BWEspressoInferenceProvider *)espressoProvider executeOnSampleBuffer:a3 usingStorage:v59 withExecutionTime:&v103 completionHandler:0];
    }
    else
    {
      espressoWorkQueue = v11->_espressoWorkQueue;
      long long v103 = *(_OWORD *)&a5->var0;
      int64_t var3 = a5->var3;
      uint64_t v60 = [(BWEspressoInferenceProvider *)espressoProvider submitForSampleBuffer:a3 usingStorage:v59 withSubmissionTime:&v103 workQueue:espressoWorkQueue completionHandler:0];
    }
    uint64_t v62 = v60;
    if (v60) {
      goto LABEL_104;
    }
    if (v86)
    {
      uint64_t v63 = 0;
      do
      {
        objc_msgSend(v99, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v51), "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](v11->_tileOutputVideoRequirements, "objectAtIndexedSubscript:", v63)), -[NSArray objectAtIndexedSubscript:](v11->_tileOutputBindingNames, "objectAtIndexedSubscript:", v63));
        if (!objc_msgSend(v99, "objectForKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](v11->_tileOutputBindingNames, "objectAtIndexedSubscript:", v63)))goto LABEL_102; {
      }
        }
      while (v86 != ++v63);
    }
    if ([(NSArray *)v11->_additionalVideoRequirements count])
    {
      uint64_t v64 = 0;
      while (1)
      {
        uint64_t v65 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v11->_additionalVideoRequirements, "objectAtIndexedSubscript:", v64), "attachedMediaKey");
        objc_msgSend(v98, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v51), "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](v11->_additionalVideoRequirements, "objectAtIndexedSubscript:", v64)), v65);
        if (![v98 objectForKeyedSubscript:v65]) {
          break;
        }
        if ([(NSArray *)v11->_additionalVideoRequirements count] <= ++v64) {
          goto LABEL_59;
        }
      }
LABEL_102:
      uint64_t v62 = FigSignalErrorAt();
      goto LABEL_105;
    }
LABEL_59:
    if (v91) {
      break;
    }
    v67 = 0;
    long long v48 = v97;
LABEL_71:
    [v67 addCompletedHandler:&__block_literal_global_82];
    unsigned int v14 = v89;
    if (v80 - 1 == v85 && v78 == v93) {
      v77 = v67;
    }
    else {
      [v67 commit];
    }
    uint64_t v47 = v91;
    BOOL v51 = !v51;
    [v48 removeAllObjects];
    [v98 removeAllObjects];
    [v99 removeAllObjects];
    if (++v93 == v81) {
      goto LABEL_76;
    }
  }
  uint64_t v66 = 0;
  v67 = 0;
  long long v48 = v97;
  while (1)
  {
    *(void *)&long long v103 = 0;
    LODWORD(v76) = v100;
    uint64_t v56 = -[BWTiledEspressoInferenceProvider writeOutputFor:to:fromNetworkOutputTiles:withAdditionalPixelBuffers:withInputTilePixelBuffers:withInputFullPixelBuffers:atPosition:cmdBuffer:](v11, "writeOutputFor:to:fromNetworkOutputTiles:withAdditionalPixelBuffers:withInputTilePixelBuffers:withInputFullPixelBuffers:atPosition:cmdBuffer:", objc_msgSend((id)objc_msgSend(v95, "objectAtIndexedSubscript:", v66), "attachedMediaKey"), *(void *)&v96[8 * v66], v99, v98, v48, v90, v76, &v103);
    if (v56) {
      break;
    }
    v68 = (void *)v103;
    if ((void)v103)
    {
      long long v48 = v97;
      if (v67)
      {
        [v67 commit];
        v68 = (void *)v103;
      }
    }
    else
    {
      long long v48 = v97;
    }
    if (v68) {
      v67 = v68;
    }
    if (v91 == ++v66) {
      goto LABEL_71;
    }
  }
LABEL_103:
  uint64_t v62 = v56;
LABEL_104:
  FigSignalErrorAt();
LABEL_105:
  int v69 = 1;
  unsigned int v14 = v89;
  v20 = v96;
LABEL_106:
  a7 = v82;
LABEL_81:
  uint64_t v70 = 2 * v14;
  if (v70)
  {
    v71 = v19;
    do
    {
      if (*v71) {
        CFRelease(*v71);
      }
      ++v71;
      --v70;
    }
    while (v70);
  }
  free(v19);
  if (v20 && v91)
  {
    uint64_t v72 = 0;
    do
    {
      v73 = *(const void **)&v20[v72];
      if (v73) {
        CFRelease(v73);
      }
      v72 += 8;
    }
    while (8 * v91 != v72);
  }
  uint64_t v17 = v90;
LABEL_93:
  free(v20);

  if (a7 && v69) {
    (*((void (**)(id, uint64_t, BWTiledEspressoInferenceProvider *))a7 + 2))(a7, v62, v11);
  }
  return v62;
}

uint64_t __135__BWTiledEspressoInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount___block_invoke_2(uint64_t a1)
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
  return [(BWTiledEspressoInferenceProvider *)self submitForSampleBuffer:a3 usingStorage:a4 withSubmissionTime:&v9 workQueue:a6 completionHandler:a7 currentTileCount:v7];
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = [(BWTiledEspressoInferenceProvider *)self outputRequirementsToProduceForInputSampleBuffer:a5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(BWTiledEspressoInferenceProvider *)self propagateInferenceResultForOutputRequirement:*(void *)(*((void *)&v14 + 1) + 8 * v13++) storage:a4 propagationSampleBuffer:a6];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_espressoProvider)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ([(NSArray *)self->_inputVideoRequirements count])
    {
      unint64_t v5 = 0;
      do
        objc_msgSend(v4, "addObject:", -[NSArray objectAtIndexedSubscript:](self->_inputVideoRequirements, "objectAtIndexedSubscript:", v5++));
      while (v5 < [(NSArray *)self->_inputVideoRequirements count]);
    }
    int v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ([(NSArray *)self->_outputVideoRequirements count])
    {
      unint64_t v7 = 0;
      do
        objc_msgSend(v6, "addObject:", -[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v7++));
      while (v7 < [(NSArray *)self->_outputVideoRequirements count]);
    }
    uint64_t v8 = 0;
    char v9 = 1;
    do
    {
      char v10 = v9;
      objc_msgSend(v3, "addObject:", -[BWEspressoInferenceProvider newStorage](self->_espressoProvider, "newStorage"));
      objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v8), "requirementsNeedingPixelBuffers"));
      objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v8), "requirementsNeedingPixelBufferPools"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      additionalVideoRequirements = self->_additionalVideoRequirements;
      uint64_t v12 = [(NSArray *)additionalVideoRequirements countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(additionalVideoRequirements);
            }
            [v6 addObject:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          }
          uint64_t v13 = [(NSArray *)additionalVideoRequirements countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
      char v9 = 0;
      uint64_t v8 = 1;
    }
    while ((v10 & 1) != 0);
    return [[BWTiledEspressoInferenceStorage alloc] initWithRequirementsNeedingPixelBuffers:v4 requirementsNeedingPixelBufferPools:v6 espressoStorages:v3];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (id)outputRequirementsToProduceForInputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return self->_outputVideoRequirements;
}

- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4
{
  return 0;
}

- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:
{
}

- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:
{
}

- (int)purgeIntermediateResources
{
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
}

- (void).cxx_destruct
{
}

@end