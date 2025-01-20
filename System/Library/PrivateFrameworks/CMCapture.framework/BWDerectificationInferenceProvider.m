@interface BWDerectificationInferenceProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWDerectificationInferenceProvider)initWithInputRequirement:(id)a3 opticalFlowInputRequirement:(id)a4 outputRequirement:(id)a5 resourceProvider:(id)a6 configuration:(id)a7;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)newStorage;
- (int)executionTarget;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWDerectificationInferenceProvider

+ (void)initialize
{
}

- (BWDerectificationInferenceProvider)initWithInputRequirement:(id)a3 opticalFlowInputRequirement:(id)a4 outputRequirement:(id)a5 resourceProvider:(id)a6 configuration:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)BWDerectificationInferenceProvider;
  v12 = [(BWDerectificationInferenceProvider *)&v14 init];
  if (v12)
  {
    v12->_metalInferenceContext = (BWMetalInferenceContext *)(id)[a6 defaultDeviceMetalContext];
    v12->_outputRequirement = (BWInferenceVideoRequirement *)a5;
    v12->_inputRequirement = (BWInferenceVideoRequirement *)a3;
    v12->_opticalFlowInputRequirement = (BWInferenceVideoRequirement *)a4;
    v12->_portType = (NSString *)(id)[a7 portType];
    v12->_lastIsQsubFrame = 0;
    v12->_applyRollingShutterCorrection = 1;
    v12->_canonicalDisparityScaleFactorOverride = 0.0;
  }
  return v12;
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWDerectificationInferenceProvider;
  [(BWDerectificationInferenceProvider *)&v4 dealloc];
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  objc_super v4 = [(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat];
  self->_inputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v4, "width"), -[BWInferenceVideoFormat height](v4, "height"), 0);
  self->_outputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v4, "width"), -[BWInferenceVideoFormat height](v4, "height"), 0);
  [(MTLTextureDescriptor *)self->_inputDescriptor setUsage:1];
  [(MTLTextureDescriptor *)self->_outputDescriptor setUsage:2];
  v5 = (GDCTransform *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55F70]), "initWithOptionalCommandQueue:", -[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"));
  self->_gdcTransform = v5;
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    LODWORD(opticalFlowInputRequirement) = -31702;
    return (int)opticalFlowInputRequirement;
  }
  uint64_t v26 = 0;
  id v6 = (id)-[MTLDevice newDefaultLibraryWithBundle:error:](-[BWMetalInferenceContext device](self->_metalInferenceContext, "device"), "newDefaultLibraryWithBundle:error:", [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()], &v26);
  if (v6)
  {
    self->_cropPipelineState = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](-[BWMetalInferenceContext device](self->_metalInferenceContext, "device"), "newComputePipelineStateWithFunction:error:", (id)[v6 newFunctionWithName:@"depthPadding"], &v26);
    opticalFlowInputRequirement = self->_opticalFlowInputRequirement;
    if (!opticalFlowInputRequirement) {
      return (int)opticalFlowInputRequirement;
    }
    v8 = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](opticalFlowInputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_opticalFlowInputRequirement, "videoFormat"), "height"), 0);
    self->_opticalFlowInputDescriptor = v8;
    [(MTLTextureDescriptor *)v8 setUsage:1];
    disparityPostProcessor = self->_disparityPostProcessor;
    if (disparityPostProcessor) {

    }
    NSUInteger v10 = [(MTLTextureDescriptor *)self->_inputDescriptor width];
    NSUInteger v11 = [(MTLTextureDescriptor *)self->_inputDescriptor height];
    NSUInteger v12 = [(MTLTextureDescriptor *)self->_opticalFlowInputDescriptor width];
    NSUInteger v13 = [(MTLTextureDescriptor *)self->_opticalFlowInputDescriptor height];
    NSUInteger v14 = [(MTLTextureDescriptor *)self->_inputDescriptor width];
    NSUInteger v15 = [(MTLTextureDescriptor *)self->_inputDescriptor height];
    id v16 = objc_alloc((Class)getPTDisparityPostProcessingClass());
    v17 = [(BWMetalInferenceContext *)self->_metalInferenceContext commandQueue];
    portType = self->_portType;
    v25[0] = v10;
    v25[1] = v11;
    v25[2] = 1;
    v24[0] = v14;
    v24[1] = v15;
    v24[2] = 1;
    v23[0] = v12;
    v23[1] = v13;
    v23[2] = 1;
    v19 = (PTDisparityPostProcessing *)[v16 initWithCommandQueue:v17 disparitySize:v25 filteredDisparitySize:v24 disparityPixelFormat:25 colorSize:v23 colorPixelFormat:71 sensorPort:portType];
    self->_disparityPostProcessor = v19;
    if (v19)
    {
      v20 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:v14 height:v15 mipmapped:0];
      [v20 setUsage:3];
      [v20 setResourceOptions:32];
      v21 = (MTLTexture *)[(MTLDevice *)[(BWMetalInferenceContext *)self->_metalInferenceContext device] newTextureWithDescriptor:v20];
      LODWORD(opticalFlowInputRequirement) = 0;
      self->_disparityIntermediate = v21;
      return (int)opticalFlowInputRequirement;
    }
    fig_log_get_emitter();
    goto LABEL_12;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  LODWORD(opticalFlowInputRequirement) = 0;
  return (int)opticalFlowInputRequirement;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  opticalFlowInputRequirement = self->_opticalFlowInputRequirement;
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
  CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F53070];
  if (!CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v62 = 0;
    v18 = 0;
    NSUInteger v14 = 0;
LABEL_43:
    uint64_t v41 = 4294935582;
    goto LABEL_55;
  }
  NSUInteger v14 = (void *)CMGetAttachment(a3, v13, 0);
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v62 = 0;
    v18 = 0;
    goto LABEL_43;
  }
  uint64_t v15 = [a4 pixelBufferForRequirement:self->_inputRequirement];
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v62 = 0;
    v18 = 0;
    NSUInteger v14 = 0;
    uint64_t v41 = 4294935584;
    goto LABEL_55;
  }
  id v16 = (__CVBuffer *)v15;
  v17 = (void *)[a4 pixelBufferPoolForRequirement:self->_outputRequirement];
  v18 = (__CVBuffer *)[v17 newPixelBuffer];
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v62 = 0;
    NSUInteger v14 = 0;
    uint64_t v41 = 4294935578;
    goto LABEL_55;
  }
  v56 = v17;
  v19 = [(BWMetalInferenceContext *)self->_metalInferenceContext commandQueue];
  cf = v18;
  v61 = (__CVBuffer *)objc_msgSend((id)-[MTLCommandQueue device](v19, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_inputDescriptor, CVPixelBufferGetIOSurface(v16), 0);
  v62 = objc_msgSend((id)-[MTLCommandQueue device](v19, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_outputDescriptor, CVPixelBufferGetIOSurface(v18), 0);
  id v58 = a4;
  id v59 = a7;
  if (opticalFlowInputRequirement)
  {
    v20 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_opticalFlowInputRequirement];
    if (!v20)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v21 = 0;
      uint64_t v41 = 4294935584;
      NSUInteger v14 = v18;
      v18 = v61;
      goto LABEL_55;
    }
    v21 = objc_msgSend((id)-[MTLCommandQueue device](v19, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_opticalFlowInputDescriptor, CVPixelBufferGetIOSurface(v20), 0);
  }
  else
  {
    v21 = 0;
  }
  v18 = v61;
  uint64_t v78 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v73 = 0u;
  memset(v72, 0, sizeof(v72));
  memset(v71, 0, 184);
  float32x2_t v70 = 0;
  v22 = (void *)CMGetAttachment(a3, @"unrectifyData", 0);
  unsigned int v23 = objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"refRollingShutterRowCount"), "intValue");
  objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"refRollingShutterHomographyStep"), "floatValue");
  unsigned int v25 = v24;
  objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"gdcParametersReference"), "getValue:", v72);
  objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"calModel"), "getValue:", v71);
  uint64_t v26 = (void *)[v22 objectForKeyedSubscript:@"orientationVector"];
  if ([v26 length] != 8)
  {
    fig_log_get_emitter();
LABEL_50:
    FigDebugAssert3();
    uint64_t v41 = 4294935595;
LABEL_54:
    a7 = v59;
    NSUInteger v14 = cf;
LABEL_55:
    if (a7) {
      (*((void (**)(id, uint64_t, BWDerectificationInferenceProvider *))a7 + 2))(a7, v41, self);
    }
    v48 = 0;
    if (v14) {
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  [v26 getBytes:&v70 length:8];
  HIDWORD(v27) = v70.i32[1];
  if (v70.f32[0] < 0.0) {
    goto LABEL_51;
  }
  LODWORD(v27) = v70.i32[1];
  if (v70.f32[1] < 0.0) {
    goto LABEL_51;
  }
  v28 = objc_msgSend(v22, "objectForKeyedSubscript:", @"refRollingShutterCorrectionHomographiesInv", v27);
  if ([v28 length] != 48 * (int)v23)
  {
    fig_log_get_emitter();
    goto LABEL_50;
  }
  uint64_t v29 = [v28 bytes];
  double v30 = (double)(unint64_t)[v62 width];
  double v31 = (double)(unint64_t)[v62 height];
  *((double *)&v73 + 1) = v30;
  *(double *)&long long v74 = v31;
  BYTE8(v74) = 1;
  HIDWORD(v74) = 1;
  BOOL applyRollingShutterCorrection = self->_applyRollingShutterCorrection;
  if (applyRollingShutterCorrection)
  {
    *(void *)&long long v75 = v29;
    *((void *)&v75 + 1) = __PAIR64__(v25, v23);
    LOBYTE(v76) = applyRollingShutterCorrection;
  }
  unint64_t v33 = [(__CVBuffer *)v61 width];
  float v34 = v71[19];
  *(float *)&unsigned int v57 = (float)v33 / v34;
  unint64_t v35 = [(__CVBuffer *)v61 height];
  float v36 = v71[20];
  float32x2_t v37 = vmul_f32(v70, (float32x2_t)__PAIR64__((float)v35 / v36, v57));
  float v38 = v71[18] / sqrtf(vaddv_f32(vmul_f32(v37, v37)));
  if (self->_canonicalDisparityScaleFactorOverride == 0.0) {
    float canonicalDisparityScaleFactorOverride = v38;
  }
  else {
    float canonicalDisparityScaleFactorOverride = self->_canonicalDisparityScaleFactorOverride;
  }
  BOOL v40 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1;
  if (self->_lastIsQsubFrame == v40 || !opticalFlowInputRequirement)
  {
    self->_lastIsQsubFrame = v40;
    uint64_t v41 = [(MTLCommandQueue *)v19 commandBuffer];
    gdcTransform = self->_gdcTransform;
    if (opticalFlowInputRequirement)
    {
      disparityIntermediate = self->_disparityIntermediate;
      int v43 = 1;
      goto LABEL_25;
    }
    int v43 = 0;
  }
  else
  {
    [(PTDisparityPostProcessing *)self->_disparityPostProcessor reset];
    self->_lastIsQsubFrame = v40;
    uint64_t v41 = [(MTLCommandQueue *)v19 commandBuffer];
    int v43 = 0;
    gdcTransform = self->_gdcTransform;
  }
  disparityIntermediate = (MTLTexture *)v62;
LABEL_25:
  *(float *)&double v42 = canonicalDisparityScaleFactorOverride;
  if ([(GDCTransform *)gdcTransform transformFrom:v61 to:disparityIntermediate withParameters:v72 withScale:2 withMode:v41 andCommandBuffer:v42])
  {
LABEL_51:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v41 = 4294935556;
    goto LABEL_54;
  }
  float64x2_t v69 = 0u;
  float64x2_t v68 = 0u;
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
    if (!v43
      || ![(PTDisparityPostProcessing *)self->_disparityPostProcessor temporalDisparityFilter:v41 inDisparity:self->_disparityIntermediate inDisplacement:v21 inDisparityFilteredPrev:self->_disparityIntermediate outDisparityFiltered:v62 disparityBias:0.0])
    {
      NSUInteger v14 = 0;
      v48 = 0;
      v47 = cf;
      goto LABEL_34;
    }
    goto LABEL_53;
  }
  v46 = (__CVBuffer *)[v56 newPixelBuffer];
  if (!v46)
  {
LABEL_53:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v41 = 4294935578;
    goto LABEL_54;
  }
  v47 = v46;
  v48 = objc_msgSend((id)-[MTLCommandQueue device](v19, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_outputDescriptor, CVPixelBufferGetIOSurface(v46), 0);
  v49 = (void *)[(id)v41 computeCommandEncoder];
  v50 = v49;
  v51 = (MTLTexture *)v62;
  if (v43) {
    v51 = self->_disparityIntermediate;
  }
  [v49 setTexture:v51 atIndex:0];
  [v50 setTexture:v48 atIndex:1];
  float32x4_t v67 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v68, *(float64x2_t *)&v71[19])), vdivq_f64(v69, *(float64x2_t *)&v71[19]));
  [v50 setBytes:&v67 length:16 atIndex:0];
  [v50 setComputePipelineState:self->_cropPipelineState];
  unint64_t v52 = [(MTLComputePipelineState *)self->_cropPipelineState threadExecutionWidth];
  unint64_t v53 = [(MTLComputePipelineState *)self->_cropPipelineState maxTotalThreadsPerThreadgroup]/ v52;
  v66[0] = [v62 width];
  v66[1] = [v62 height];
  v66[2] = 1;
  v65[0] = v52;
  v65[1] = v53;
  v65[2] = 1;
  [v50 dispatchThreads:v66 threadsPerThreadgroup:v65];
  [v50 endEncoding];
  NSUInteger v14 = v47;
  v18 = v61;
LABEL_34:
  [v58 setPixelBuffer:v47 forRequirement:self->_outputRequirement];
  if (*MEMORY[0x1E4F1EBA8])
  {
    v54 = objc_msgSend((id)objc_msgSend((id)v41, "commandQueue"), "commandBuffer");
    [v54 setLabel:@"KTRACE_MTLCMDBUF"];
    [v54 addCompletedHandler:&__block_literal_global_21];
    [v54 commit];
    [(id)v41 addCompletedHandler:&__block_literal_global_68];
  }
  if (v59)
  {
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __120__BWDerectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_3;
    v63[3] = &unk_1E5C24730;
    int v64 = 0;
    v63[4] = self;
    v63[5] = v59;
    [(id)v41 addScheduledHandler:v63];
  }
  [(id)v41 commit];
  CFRelease(cf);
  LODWORD(v41) = 0;
  if (v14) {
LABEL_39:
  }
    CFRelease(v14);
LABEL_40:

  return v41;
}

uint64_t __120__BWDerectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke()
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    return kdebug_trace();
  }
  return result;
}

uint64_t __120__BWDerectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 status] == 4)
  {
    [a2 GPUEndTime];
    uint64_t result = [a2 GPUStartTime];
  }
  else
  {
    uint64_t result = [a2 status];
  }
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    return kdebug_trace();
  }
  return result;
}

uint64_t __120__BWDerectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)newStorage
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [BWInferenceProviderStorage alloc];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_inputRequirement, self->_opticalFlowInputRequirement, 0);
  v6[0] = self->_outputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v3, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v4, [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
}

- (int)type
{
  return 112;
}

- (NSArray)inputVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_inputRequirement, self->_opticalFlowInputRequirement, 0);
}

- (NSArray)outputVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_outputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
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

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  CFTypeRef cf = 0;
  v8 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_outputRequirement];
  if (v8)
  {
    long long v10 = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    if (!BWSampleBufferCreateFromPixelBuffer(v8, (uint64_t)&v10, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&cf))
    {
      v9 = [(BWInferenceMediaRequirement *)self->_outputRequirement attachedMediaKey];
      BWSampleBufferSetAttachedMedia(a6, (uint64_t)v9, (uint64_t)cf);
      goto LABEL_4;
    }
    fig_log_get_emitter();
  }
  else
  {
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_4:
  if (cf) {
    CFRelease(cf);
  }
}

@end