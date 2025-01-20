@interface BWRectificationInferenceProvider
+ (void)initialize;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (BWInferencePropagatable)propagatable;
- (BWRectificationInferenceProvider)initWithRefInputRequirement:(id)a3 auxInputRequirement:(id)a4 refKeypointsInputRequirement:(id)a5 auxKeypointsInputRequirement:(id)a6 refOutputRequirement:(id)a7 auxOutputRequirement:(id)a8 opticalFlowOutputRequirement:(id)a9 originalRefRequirement:(id)a10 originalAuxRequirement:(id)a11 resourceProvider:(id)a12 configuration:(id)a13;
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
- (uint64_t)_applyRollingShutterCorrectionToKeypointsRef:(uint64_t)a3 andAux:(unsigned int)a4 withCount:(uint64_t)a5 inverseRefHomographies:(int)a6 refHomographyCount:(uint64_t)a7 refHomographyStep:(int)a8 inverseAuxHomographies:(float)a9 auxHomographyCount:(float)a10 auxHomographyStep:;
- (uint64_t)_detectKeypointsLKTFlowWithMagnification:(uint64_t)a3 preShift:(_DWORD *)a4 refTex:(float)a5 auxTex:(float32x2_t)a6 keypointsCountOut:;
- (unint64_t)_rscForBuffer:(void *)a3 withHomograhies:(void *)a4 andInverseHomographies:(float *)a5 withHomographyStep:;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
@end

@implementation BWRectificationInferenceProvider

+ (void)initialize
{
}

- (BWRectificationInferenceProvider)initWithRefInputRequirement:(id)a3 auxInputRequirement:(id)a4 refKeypointsInputRequirement:(id)a5 auxKeypointsInputRequirement:(id)a6 refOutputRequirement:(id)a7 auxOutputRequirement:(id)a8 opticalFlowOutputRequirement:(id)a9 originalRefRequirement:(id)a10 originalAuxRequirement:(id)a11 resourceProvider:(id)a12 configuration:(id)a13
{
  v21.receiver = self;
  v21.super_class = (Class)BWRectificationInferenceProvider;
  v19 = [(BWRectificationInferenceProvider *)&v21 init];
  if (v19)
  {
    *((void *)v19 + 1) = a3;
    *((void *)v19 + 2) = a4;
    *((void *)v19 + 3) = a5;
    *((void *)v19 + 4) = a6;
    *((void *)v19 + 5) = a7;
    *((void *)v19 + 6) = a8;
    *((void *)v19 + 7) = a9;
    *((void *)v19 + 8) = a10;
    *((void *)v19 + 9) = a11;
    *((void *)v19 + 89) = (id)[a13 cameraInfoByPortType];
    *((void *)v19 + 91) = (id)objc_msgSend((id)objc_msgSend(a12, "defaultDeviceMetalContext"), "commandQueue");
    v19[784] = 1;
    *((_DWORD *)v19 + 202) = 2;
    *((void *)v19 + 102) = 1;
    v19[832] = 1;
    *(void *)(v19 + 836) = 0;
    *(void *)(v19 + 844) = 0x3A83126F00000000;
    *(_OWORD *)(v19 + 792) = 0u;
  }
  return (BWRectificationInferenceProvider *)v19;
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  zoomedAux = self->_zoomedAux;
  if (zoomedAux) {
    CFRelease(zoomedAux);
  }

  adaptiveCorrectionKeypointsReferenceDistorted = self->_adaptiveCorrectionKeypointsReferenceDistorted;
  if (adaptiveCorrectionKeypointsReferenceDistorted)
  {
    self->_adaptiveCorrectionKeypointsReferenceDistorted = 0;
    free(adaptiveCorrectionKeypointsReferenceDistorted);
  }
  adaptiveCorrectionKeypointsAuxiliaryDistorted = self->_adaptiveCorrectionKeypointsAuxiliaryDistorted;
  if (adaptiveCorrectionKeypointsAuxiliaryDistorted)
  {
    self->_adaptiveCorrectionKeypointsAuxiliaryDistorted = 0;
    free(adaptiveCorrectionKeypointsAuxiliaryDistorted);
  }
  v7.receiver = self;
  v7.super_class = (Class)BWRectificationInferenceProvider;
  [(BWRectificationInferenceProvider *)&v7 dealloc];
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/VideoProcessors/DisparityV5.bundle"];
  if (!v4) {
    goto LABEL_26;
  }
  v5 = (void *)v4;
  self->_metalContext = (FigMetalContext *)[objc_alloc(MEMORY[0x1E4F55F60]) initWithbundle:v4 andOptionalCommandQueue:self->_commandQueue];
  if (![v5 classNamed:@"Calibration"]) {
    goto LABEL_26;
  }
  v6 = (Calibration *)objc_opt_new();
  self->_calibration = v6;
  if (!v6)
  {
    fig_log_get_emitter();
LABEL_32:
    FigDebugAssert3();
LABEL_20:
    LODWORD(opticalFlowOutputRequirement) = 0;
    return (int)opticalFlowOutputRequirement;
  }
  uint64_t v7 = [v5 classNamed:@"DisparityTuningParameters"];
  if (!v7) {
    goto LABEL_26;
  }
  v8 = (objc_class *)v7;
  uint64_t v9 = [v5 classNamed:@"LKTKeypointDetector"];
  if (!v9) {
    goto LABEL_26;
  }
  v10 = (objc_class *)v9;
  uint64_t v11 = [v5 classNamed:@"Demosaic"];
  if (!v11
    || (v12 = (objc_class *)v11,
        (v13 = -[FigCaptureCameraParameters cameraParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraParameters")) == 0)|| (uint64_t v14 = *MEMORY[0x1E4F535B0], v15 = objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F535B0]), "objectForKeyedSubscript:", @"Common"), "objectForKeyedSubscript:", @"StereoDisparity"), v16 = objc_msgSend(v15, "objectForKeyedSubscript:", objc_msgSend(NSString, "stringWithFormat:", @"V5")),
        v17 = (DisparityTuningParameters *)objc_msgSend([v8 alloc], "initWithTuningDictionary:cameraInfoByPortType:", objc_msgSend(v16, "objectForKeyedSubscript:", @"BaseConfiguration"), self->_cameraInfoByPortType), (self->_disparityTuningParameters = v17) == 0)|| -[DisparityTuningParameters updateTuningParametersWith:](v17, "updateTuningParametersWith:", objc_msgSend(v16, "objectForKeyedSubscript:", @"CinematicVideo")))
  {
LABEL_26:
    fig_log_get_emitter();
LABEL_34:
    FigDebugAssert3();
    LODWORD(opticalFlowOutputRequirement) = -31710;
    return (int)opticalFlowOutputRequirement;
  }
  uint64_t v18 = *MEMORY[0x1E4F53560];
  v51[0] = v14;
  v51[1] = v18;
  cameraInfoByPortType = self->_cameraInfoByPortType;
  v52[0] = v16;
  v52[1] = cameraInfoByPortType;
  self->_calibrationOptions = (NSDictionary *)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  v20 = [(BWInferenceVideoRequirement *)self->_refInputRequirement videoFormat];
  objc_super v21 = [(BWInferenceVideoRequirement *)self->_auxInputRequirement videoFormat];
  self->_rectificationWidth = [(BWInferenceVideoFormat *)v20 width];
  self->_rectificationHeight = [(BWInferenceVideoFormat *)v20 height];
  uint64_t v22 = [(DisparityTuningParameters *)self->_disparityTuningParameters lastScale];
  unsigned int v23 = self->_rectificationWidth >> v22;
  self->_keypointGridWidth = v23
                           / [(DisparityTuningParameters *)self->_disparityTuningParameters blockSize];
  unsigned int v24 = self->_rectificationHeight >> v22;
  unint64_t v25 = v24 / [(DisparityTuningParameters *)self->_disparityTuningParameters blockSize];
  self->_keypointGridHeight = v25;
  unsigned int v26 = v25 * LODWORD(self->_keypointGridWidth);
  [(Calibration *)self->_calibration allocateResourcesForMaxNumPoints:v26];
  unsigned int v27 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_originalRefInputRequirement videoFormat] width];
  unsigned int v28 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_originalRefInputRequirement videoFormat] height];
  self->_calibrationWidth = (int)v27;
  self->_calibrationHeight = (int)v28;
  -[Calibration setReferenceBufferDimensions:auxillaryBufferDimensions:normalizedReferenceFinalCropRect:](self->_calibration, "setReferenceBufferDimensions:auxillaryBufferDimensions:normalizedReferenceFinalCropRect:", v27 | ((unint64_t)v28 << 32), v27 | ((unint64_t)v28 << 32), *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  [(Calibration *)self->_calibration setTemporalCorrectionEnabled:1];
  [(Calibration *)self->_calibration setPixelBufferScalingEnabled:1];
  self->_adcFramesConverged = 0;
  v29 = (Demosaic *)[[v12 alloc] initWithMetalContext:self->_metalContext];
  self->_auxiliaryDemosaic = v29;
  if (!v29)
  {
    fig_log_get_emitter();
    goto LABEL_32;
  }
  self->_lktKeypointDetector = (LKTKeypointDetector *)[[v10 alloc] initWithMetalContext:self->_metalContext width:self->_rectificationWidth height:self->_rectificationHeight nscales:0xFFFFFFFFLL lastScale:v22];
  [(LKTKeypointDetector *)self->_lktKeypointDetector setNwarpings:[(DisparityTuningParameters *)self->_disparityTuningParameters nwarps]];
  uint64_t v30 = [(BWInferenceVideoFormat *)v20 width];
  if (v30 != [(BWInferenceVideoFormat *)v21 width]) {
    goto LABEL_33;
  }
  uint64_t v31 = [(BWInferenceVideoFormat *)v20 height];
  if (v31 != [(BWInferenceVideoFormat *)v21 height]) {
    goto LABEL_33;
  }
  self->_refInputDescriptor = (MTLTextureDescriptor *)(id)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:80 width:self->_rectificationWidth height:self->_rectificationHeight mipmapped:0];
  self->_auxInputDescriptor = (MTLTextureDescriptor *)(id)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:80 width:self->_rectificationWidth height:self->_rectificationHeight mipmapped:0];
  self->_refKeypointsInputDescriptor = (MTLTextureDescriptor *)(id)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:self->_rectificationWidth height:self->_rectificationHeight mipmapped:0];
  self->_auxKeypointsInputDescriptor = (MTLTextureDescriptor *)(id)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:self->_rectificationWidth height:self->_rectificationHeight mipmapped:0];
  self->_refOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_refOutputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_refOutputRequirement, "videoFormat"), "height"), 0);
  self->_auxOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_auxOutputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_auxOutputRequirement, "videoFormat"), "height"), 0);
  v32 = (GDCTransform *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55F70]), "initWithOptionalCommandQueue:", -[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
  self->_gdcTransform = v32;
  if (!v32
    || (self->_zoomedAux = (__CVBuffer *)CreatePixelBuffer(),
        size_t v33 = 16 * v26,
        v34 = (double *)malloc_type_malloc(v33, 0x677E66ECuLL),
        (self->_adaptiveCorrectionKeypointsReferenceDistorted = v34) == 0)
    || (v35 = (double *)malloc_type_malloc(v33, 0x201EC6E7uLL),
        (self->_adaptiveCorrectionKeypointsAuxiliaryDistorted = v35) == 0))
  {
LABEL_33:
    fig_log_get_emitter();
    goto LABEL_34;
  }
  opticalFlowOutputRequirement = self->_opticalFlowOutputRequirement;
  if (opticalFlowOutputRequirement)
  {
    self->_opticalFlowDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](opticalFlowOutputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_opticalFlowOutputRequirement, "videoFormat"), "height"), 0);
    disparityPostProcessor = self->_disparityPostProcessor;
    if (disparityPostProcessor) {

    }
    NSUInteger v38 = [(MTLTextureDescriptor *)self->_refOutputDescriptor width];
    NSUInteger v39 = [(MTLTextureDescriptor *)self->_refOutputDescriptor height];
    unint64_t v40 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_opticalFlowOutputRequirement videoFormat] width];
    unint64_t v41 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_opticalFlowOutputRequirement videoFormat] height];
    NSUInteger v42 = [(MTLTextureDescriptor *)self->_refOutputDescriptor width];
    NSUInteger v43 = [(MTLTextureDescriptor *)self->_refOutputDescriptor height];
    id v44 = objc_alloc((Class)getPTDisparityPostProcessingClass());
    uint64_t v45 = [(FigMetalContext *)self->_metalContext commandQueue];
    v50[0] = v38;
    v50[1] = v39;
    v50[2] = 1;
    v49[0] = v42;
    v49[1] = v43;
    v49[2] = 1;
    v48[0] = v40;
    v48[1] = v41;
    v48[2] = 1;
    v46 = (PTDisparityPostProcessing *)[v44 initWithCommandQueue:v45 disparitySize:v50 filteredDisparitySize:v49 disparityPixelFormat:25 colorSize:v48 colorPixelFormat:71 sensorPort:&stru_1EFA403E0];
    self->_disparityPostProcessor = v46;
    if (v46) {
      goto LABEL_20;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    LODWORD(opticalFlowOutputRequirement) = -31702;
  }
  return (int)opticalFlowOutputRequirement;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  p_calibrationWidth = (uint64x2_t *)&self->_calibrationWidth;
  v178 = 0;
  v179 = 0;
  v176 = 0;
  v177 = 0;
  uint64_t v175 = 0;
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
  CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F53070];
  uint64_t v14 = (__CVBuffer *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  v123 = (int64x2_t *)p_calibrationWidth;
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
LABEL_113:
    id v44 = 0;
    v129 = 0;
    v131 = 0;
    v133 = 0;
    uint64_t v45 = 0;
    pixelBuffera = 0;
    v47 = 0;
    char v114 = 0;
    uint64_t v113 = 0;
    goto LABEL_98;
  }
  id v15 = (id)CMGetAttachment(a3, v13, 0);
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v112 = 0;
    v128 = 0;
    v46 = 0;
    uint64_t v14 = 0;
    goto LABEL_113;
  }
  target = a3;
  id v116 = a4;
  v121 = v14;
  if (!self->_applyRollingShutterCorrection)
  {
    int v124 = 0;
    int v126 = 0;
    goto LABEL_18;
  }
  int v126 = -[BWRectificationInferenceProvider _rscForBuffer:withHomograhies:andInverseHomographies:withHomographyStep:]((uint64_t)self, a3, (void **)&v179, &v178, (float *)&v175 + 1);
  if (v126 <= 0)
  {
    fig_log_get_emitter();
LABEL_139:
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
    goto LABEL_140;
  }
  int v124 = -[BWRectificationInferenceProvider _rscForBuffer:withHomograhies:andInverseHomographies:withHomographyStep:]((uint64_t)self, AttachedMedia, (void **)&v177, (void **)&v176, (float *)&v175);
  if (v124 <= 0)
  {
    fig_log_get_emitter();
    goto LABEL_139;
  }
  int v16 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_originalAuxInputRequirement videoFormat] width];
  int v17 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_originalAuxInputRequirement videoFormat] height];
  float v18 = (float)self->_calibrationWidth / (float)v16;
  unint64_t calibrationHeight = self->_calibrationHeight;
  float v20 = (float)calibrationHeight / (float)v17;
  if (v18 != 1.0 || v20 != 1.0)
  {
    uint64_t v22 = 0;
    float32x4_t v23 = (float32x4_t)LODWORD(v18);
    v24.i32[0] = 0;
    v24.i64[1] = 0;
    v24.f32[1] = (float)calibrationHeight / (float)v17;
    float64x2_t v25 = 0uLL;
    float v118 = v24.f32[1];
    float v26 = 1.0 / v20;
    *(float *)&unsigned int v27 = 1.0 / v18;
    LODWORD(v28) = 0;
    *((float *)&v28 + 1) = v26;
    long long v130 = v28;
    long long v132 = v27;
    uint64_t v30 = v176;
    v29 = v177;
    float32x4_t v31 = (float32x4_t)xmmword_1A5DBD350;
    *(_OWORD *)v134 = v24.u64[0];
    *(_OWORD *)pixelBuffer = v23.u32[0];
    do
    {
      uint64_t v32 = 0;
      size_t v33 = (char *)v29 + 48 * v22;
      long long v34 = *((_OWORD *)v33 + 1);
      long long v35 = *((_OWORD *)v33 + 2);
      long long v180 = *(_OWORD *)v33;
      long long v181 = v34;
      long long v182 = v35;
      float64x2_t v143 = v25;
      float32x4_t v144 = (float32x4_t)v25;
      float32x4_t v145 = (float32x4_t)v25;
      do
      {
        *(float32x4_t *)((char *)&v143 + v32) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(long long *)((char *)&v180 + v32))), v24, *(float32x2_t *)((char *)&v180 + v32), 1), v31, *(float32x4_t *)((char *)&v180 + v32), 2);
        v32 += 16;
      }
      while (v32 != 48);
      uint64_t v36 = 0;
      float32x4_t v37 = (float32x4_t)v143;
      float32x4_t v38 = v144;
      float32x4_t v39 = v145;
      long long v180 = v132;
      long long v181 = v130;
      long long v182 = xmmword_1A5DBD350;
      float64x2_t v143 = v25;
      float32x4_t v144 = (float32x4_t)v25;
      float32x4_t v145 = (float32x4_t)v25;
      do
      {
        *(float32x4_t *)((char *)&v143 + v36) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, COERCE_FLOAT(*(long long *)((char *)&v180 + v36))), v38, *(float32x2_t *)((char *)&v180 + v36), 1), v39, *(float32x4_t *)((char *)&v180 + v36), 2);
        v36 += 16;
      }
      while (v36 != 48);
      float64_t v40 = v143.f64[0];
      float32x4_t v41 = v144;
      float32x4_t v42 = v145;
      *((_DWORD *)v33 + 2) = LODWORD(v143.f64[1]);
      *(float64_t *)size_t v33 = v40;
      *((_DWORD *)v33 + 6) = v41.i32[2];
      *((_DWORD *)v33 + 10) = v42.i32[2];
      *((void *)v33 + 2) = v41.i64[0];
      *((void *)v33 + 4) = v42.i64[0];
      NSUInteger v43 = &v30[48 * v22];
      simd_float3x3 v183 = __invert_f3(*(simd_float3x3 *)v33);
      *((_DWORD *)v43 + 2) = v183.columns[0].i32[2];
      *(void *)NSUInteger v43 = v183.columns[0].i64[0];
      *((_DWORD *)v43 + 6) = v183.columns[1].i32[2];
      *((void *)v43 + 2) = v183.columns[1].i64[0];
      *((_DWORD *)v43 + 10) = v183.columns[2].i32[2];
      ++v22;
      *((void *)v43 + 4) = v183.columns[2].i64[0];
      float32x4_t v24 = *(float32x4_t *)v134;
      float32x4_t v23 = *(float32x4_t *)pixelBuffer;
      float64x2_t v25 = 0uLL;
      float32x4_t v31 = (float32x4_t)xmmword_1A5DBD350;
    }
    while (v22 != v124);
    *(float *)&uint64_t v175 = v118 * *(float *)&v175;
    a4 = v116;
  }
LABEL_18:
  id v44 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_refInputRequirement];
  if (!v44)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
    uint64_t v14 = 0;
LABEL_142:
    v129 = 0;
    v131 = 0;
    v133 = 0;
    uint64_t v45 = 0;
    goto LABEL_143;
  }
  uint64_t v45 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_refKeypointsInputRequirement];
  if (!v45)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
    uint64_t v14 = 0;
    id v44 = 0;
    v129 = 0;
    v131 = 0;
    v133 = 0;
LABEL_143:
    pixelBuffera = 0;
    v47 = 0;
    char v114 = 0;
    uint64_t v113 = 4294935584;
    goto LABEL_98;
  }
  v46 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_auxInputRequirement];
  if (!v46)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
LABEL_140:
    uint64_t v14 = 0;
    goto LABEL_141;
  }
  uint64_t v14 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_auxKeypointsInputRequirement];
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
LABEL_141:
    id v44 = 0;
    goto LABEL_142;
  }
  v47 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_refOutputRequirement), "newPixelBuffer");
  if (!v47)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
    uint64_t v14 = 0;
    id v44 = 0;
LABEL_120:
    v129 = 0;
    v131 = 0;
    v133 = 0;
    uint64_t v45 = 0;
    pixelBuffera = 0;
    char v114 = 0;
    uint64_t v113 = 4294935578;
    goto LABEL_98;
  }
  v120 = v44;
  id v44 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_auxOutputRequirement), "newPixelBuffer");
  if (!v44)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
    uint64_t v14 = 0;
    goto LABEL_120;
  }
  [a4 setPixelBuffer:v47 forRequirement:self->_refOutputRequirement];
  pixelBuffera = v44;
  [a4 setPixelBuffer:v44 forRequirement:self->_auxOutputRequirement];
  v48 = (void *)[(FigMetalContext *)self->_metalContext commandQueue];
  v133 = objc_msgSend((id)objc_msgSend(v48, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_refKeypointsInputDescriptor, CVPixelBufferGetIOSurface(v45), 0);
  v131 = objc_msgSend((id)objc_msgSend(v48, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_auxKeypointsInputDescriptor, CVPixelBufferGetIOSurface(v14), 0);
  v129 = objc_msgSend((id)objc_msgSend(v48, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_auxKeypointsInputDescriptor, CVPixelBufferGetIOSurface(self->_zoomedAux), 0);
  calibrationOptions = self->_calibrationOptions;
  calibration = self->_calibration;
  disparityTuningParameters = self->_disparityTuningParameters;
  v135 = v47;
  if (disparityTuningParameters) {
    [(DisparityTuningParameters *)disparityTuningParameters adaptiveCorrectionConfig];
  }
  else {
    memset(v174, 0, sizeof(v174));
  }
  if ([(Calibration *)calibration extractParametersFromReferenceMetadata:v15 auxiliaryMetadata:v121 options:calibrationOptions adaptiveCorrectionConfig:v174 useReferenceFrame:1]|| [(Calibration *)self->_calibration computeInitialCalibration])
  {
    goto LABEL_148;
  }
  objc_msgSend((id)CMGetAttachment(target, @"TotalZoomFactor", 0), "floatValue");
  float v53 = v52;
  int v54 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
  BOOL v55 = vabds_f32(v53, self->_oldZoomFactor) > self->_zoomDeltaThreshold || v54 != self->_oldQuadraBinningFactor;
  self->_oldZoomFactor = v53;
  self->_oldQuadraBinningFactor = v54;
  if (!(self->_adcFrameCounter % self->_adcFrequency)
    && self->_adcSkipOnConflictWithSmartStyleLearning
    && [v15 objectForKeyedSubscript:*MEMORY[0x1E4F534F0]])
  {
    self->_adcSkipOnConflictWithSmartStyleLearning = 0;
    ++self->_adcFrameCounter;
  }
  int numFramesSinceAdcSkipOnConflictWithSmartStyleLearning = self->_numFramesSinceAdcSkipOnConflictWithSmartStyleLearning;
  self->_int numFramesSinceAdcSkipOnConflictWithSmartStyleLearning = numFramesSinceAdcSkipOnConflictWithSmartStyleLearning
                                                               + 1;
  if (numFramesSinceAdcSkipOnConflictWithSmartStyleLearning >= 59)
  {
    self->_int numFramesSinceAdcSkipOnConflictWithSmartStyleLearning = 0;
    self->_adcSkipOnConflictWithSmartStyleLearning = 1;
  }
  unsigned int v173 = 0;
  if (!v55
    && self->_adcFrameCounter % self->_adcFrequency
    && self->_adcFramesConverged >= self->_adcMinFramesToConverge)
  {
    [(Calibration *)self->_calibration applyCurrentTemporalState];
  }
  else
  {
    [(Calibration *)self->_calibration referenceMagnification];
    if (v57 <= 0.0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      id v15 = 0;
      v112 = 0;
      v128 = 0;
      v46 = 0;
      uint64_t v14 = 0;
      id v44 = 0;
      uint64_t v45 = 0;
LABEL_147:
      char v114 = 0;
      uint64_t v113 = 0;
      goto LABEL_97;
    }
    float v58 = v57;
    v143.f64[0] = 0.0;
    if ([(Calibration *)self->_calibration computeAuxiliaryImageShiftForKeypoints:&v143])goto LABEL_148; {
    [self->_auxiliaryDemosaic resampleLuma:v131 toLuma:v129 magnification:COERCE_DOUBLE(__PAIR64__(HIDWORD(v143.f64[0]), LODWORD(v58))) preShift:COERCE_DOUBLE(vmul_f32(*(float32x2_t *)&v143.f64[0], vdiv_f32(vcvt_f32_u32(*(uint32x2_t *)&self->_rectificationWidth), vcvt_f32_f64(vcvtq_f64_u64(*p_calibrationWidth)))))];
    }
    if (-[BWRectificationInferenceProvider _detectKeypointsLKTFlowWithMagnification:preShift:refTex:auxTex:keypointsCountOut:]((uint64_t)self, (uint64_t)v133, (uint64_t)v129, &v173, v58, *(float32x2_t *)&v143.f64[0]))goto LABEL_148; {
    uint64_t v59 = v173;
    }
    if (self->_applyRollingShutterCorrection)
    {
      if (-[BWRectificationInferenceProvider _applyRollingShutterCorrectionToKeypointsRef:andAux:withCount:inverseRefHomographies:refHomographyCount:refHomographyStep:inverseAuxHomographies:auxHomographyCount:auxHomographyStep:]((uint64_t)self, (uint64_t)self->_adaptiveCorrectionKeypointsReferenceDistorted, (uint64_t)self->_adaptiveCorrectionKeypointsAuxiliaryDistorted, v173, (uint64_t)v178, v126, (uint64_t)v176, v124, *((float *)&v175 + 1), *(float *)&v175))goto LABEL_148; {
    }
      }
    [(Calibration *)self->_calibration setKeypointsForReference:self->_adaptiveCorrectionKeypointsReferenceDistorted auxiliary:self->_adaptiveCorrectionKeypointsAuxiliaryDistorted keypointCount:v59];
    int v60 = [(Calibration *)self->_calibration computeCalibration];
    unint64_t adcFramesConverged = self->_adcFramesConverged;
    if (!v60) {
      ++adcFramesConverged;
    }
    self->_unint64_t adcFramesConverged = adcFramesConverged;
  }
  *(_OWORD *)self->_gdcParametersReference.distortPolynomCoefficients = 0u;
  self->_gdcParametersReference.originalCropRect.size.height = 0.0;
  *(_OWORD *)&self->_gdcParametersReference.BOOL applyRollingShutterCorrection = 0u;
  *(_OWORD *)&self->_gdcParametersReference.originalCropRect.origin.y = 0u;
  *(_OWORD *)&self->_gdcParametersReference.canvasResolution.height = 0u;
  *(_OWORD *)&self->_gdcParametersReference.rollingShutterCorrectionHomographies = 0u;
  *(_OWORD *)&self->_gdcParametersReference.inverseHomography[4] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.inverseHomography[8] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.homography[5] = 0u;
  *(_OWORD *)self->_gdcParametersReference.inverseHomography = 0u;
  *(_OWORD *)&self->_gdcParametersReference.originalImageWidth = 0u;
  *(_OWORD *)&self->_gdcParametersReference.homography[1] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.undistortPolynomCoefficients[4] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.centerX = 0u;
  *(_OWORD *)&self->_gdcParametersReference.distortPolynomCoefficients[4] = 0u;
  *(_OWORD *)self->_gdcParametersReference.undistortPolynomCoefficients = 0u;
  *(_OWORD *)self->_gdcParametersAuxiliary.distortPolynomCoefficients = 0u;
  self->_gdcParametersAuxiliary.originalCropRect.size.height = 0.0;
  *(_OWORD *)&self->_gdcParametersAuxiliary.distortPolynomCoefficients[4] = 0u;
  *(_OWORD *)self->_gdcParametersAuxiliary.undistortPolynomCoefficients = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.undistortPolynomCoefficients[4] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.centerX = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.originalImageWidth = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.homography[1] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.homography[5] = 0u;
  *(_OWORD *)self->_gdcParametersAuxiliary.inverseHomography = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.inverseHomography[4] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.inverseHomography[8] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.canvasResolution.height = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.rollingShutterCorrectionHomographies = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.BOOL applyRollingShutterCorrection = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.originalCropRect.origin.y = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  float32x4_t v165 = 0u;
  long long v166 = 0u;
  float64x2_t v163 = 0u;
  float32x4_t v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  float32x4_t v155 = 0u;
  long long v156 = 0u;
  float64x2_t v153 = 0u;
  float32x4_t v154 = 0u;
  v62 = self->_calibration;
  if (v62)
  {
    [(Calibration *)v62 distModelFor:0];
    v63 = self->_calibration;
    long long v169 = v149;
    long long v170 = v150;
    long long v171 = v151;
    long long v172 = v152;
    float32x4_t v165 = v145;
    long long v166 = v146;
    long long v167 = v147;
    long long v168 = v148;
    float64x2_t v163 = v143;
    float32x4_t v164 = v144;
    if (v63)
    {
      [(Calibration *)v63 undistModelFor:0];
      goto LABEL_54;
    }
  }
  else
  {
    long long v171 = 0uLL;
    long long v172 = 0uLL;
    long long v169 = 0uLL;
    long long v170 = 0uLL;
    long long v167 = 0uLL;
    long long v168 = 0uLL;
    float32x4_t v165 = 0uLL;
    long long v166 = 0uLL;
    float64x2_t v163 = 0uLL;
    float32x4_t v164 = 0uLL;
  }
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  float32x4_t v145 = 0u;
  long long v146 = 0u;
  float64x2_t v143 = 0u;
  float32x4_t v144 = 0u;
LABEL_54:
  long long v159 = v149;
  long long v160 = v150;
  long long v161 = v151;
  long long v162 = v152;
  float32x4_t v155 = v145;
  long long v156 = v146;
  long long v157 = v147;
  long long v158 = v148;
  float64x2_t v153 = v143;
  float32x4_t v154 = v144;
  if (fillGDCParametersFromDistortionModels(&v163, v153.f64, (uint64_t)&self->_gdcParametersReference, (float)self->_calibrationWidth, (float)self->_calibrationHeight))
  {
LABEL_148:
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
    uint64_t v14 = 0;
    id v44 = 0;
    goto LABEL_149;
  }
  v64 = self->_calibration;
  if (!v64)
  {
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    float32x4_t v165 = 0u;
    long long v166 = 0u;
    float64x2_t v163 = 0u;
    float32x4_t v164 = 0u;
    goto LABEL_59;
  }
  [(Calibration *)v64 distModelFor:1];
  v65 = self->_calibration;
  long long v169 = v149;
  long long v170 = v150;
  long long v171 = v151;
  long long v172 = v152;
  float32x4_t v165 = v145;
  long long v166 = v146;
  long long v167 = v147;
  long long v168 = v148;
  float64x2_t v163 = v143;
  float32x4_t v164 = v144;
  if (!v65)
  {
LABEL_59:
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    float32x4_t v145 = 0u;
    long long v146 = 0u;
    float64x2_t v143 = 0u;
    float32x4_t v144 = 0u;
    goto LABEL_60;
  }
  [(Calibration *)v65 undistModelFor:1];
LABEL_60:
  long long v159 = v149;
  long long v160 = v150;
  long long v161 = v151;
  long long v162 = v152;
  float32x4_t v155 = v145;
  long long v156 = v146;
  long long v157 = v147;
  long long v158 = v148;
  float64x2_t v153 = v143;
  float32x4_t v154 = v144;
  if (fillGDCParametersFromDistortionModels(&v163, v153.f64, (uint64_t)&self->_gdcParametersAuxiliary, (float)self->_calibrationWidth, (float)self->_calibrationHeight))goto LABEL_148; {
  LODWORD(v66) = 15.0;
  }
  if ([(Calibration *)self->_calibration computeStereoRectificationHomographies:7.67384672e21 alignedToAngle:v66])goto LABEL_148; {
  [(Calibration *)self->_calibration rectReferenceToReference];
  }
  uint64_t v67 = 0;
  homography = self->_gdcParametersReference.homography;
  float64x2_t v143 = v69;
  float32x4_t v144 = v70;
  float32x4_t v145 = v71;
  do
  {
    for (uint64_t i = 0; i != 3; ++i)
      homography[i] = *(float *)((unint64_t)(&v143 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v67 & 3)));
    ++v67;
    homography += 3;
  }
  while (v67 != 3);
  [(Calibration *)self->_calibration referenceToRectReference];
  uint64_t v73 = 0;
  inverseHomography = self->_gdcParametersReference.inverseHomography;
  float64x2_t v143 = v75;
  float32x4_t v144 = v76;
  float32x4_t v145 = v77;
  do
  {
    for (uint64_t j = 0; j != 3; ++j)
      inverseHomography[j] = *(float *)((unint64_t)(&v143 + j) & 0xFFFFFFFFFFFFFFF3 | (4 * (v73 & 3)));
    ++v73;
    inverseHomography += 3;
  }
  while (v73 != 3);
  float v79 = (float)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_auxOutputRequirement videoFormat] width];
  float v127 = v79
       / (float)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_refOutputRequirement videoFormat] width];
  unint64_t v80 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_auxOutputRequirement videoFormat] height];
  float v81 = (float)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_refOutputRequirement videoFormat] height];
  [(Calibration *)self->_calibration rectReferenceToAuxiliary];
  float32x4_t v122 = v82;
  float32x4_t v117 = v84;
  float32x4_t v119 = v83;
  [(Calibration *)self->_calibration auxiliaryPaddingHInv];
  uint64_t v85 = 0;
  long long v180 = v86;
  long long v181 = v87;
  long long v182 = v88;
  float64x2_t v143 = 0u;
  float32x4_t v144 = 0u;
  float32x4_t v145 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v143 + v85) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v122, COERCE_FLOAT(*(long long *)((char *)&v180 + v85))), v119, *(float32x2_t *)((char *)&v180 + v85), 1), v117, *(float32x4_t *)((char *)&v180 + v85), 2);
    v85 += 16;
  }
  while (v85 != 48);
  uint64_t v89 = 0;
  LODWORD(v90) = 0;
  *((float *)&v90 + 1) = (float)v80 / v81;
  float32x4_t v91 = (float32x4_t)v143;
  float32x4_t v92 = v144;
  float32x4_t v93 = v145;
  long long v180 = LODWORD(v127);
  long long v181 = v90;
  long long v182 = xmmword_1A5DBD350;
  float64x2_t v143 = 0u;
  float32x4_t v144 = 0u;
  float32x4_t v145 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v143 + v89) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v91, COERCE_FLOAT(*(long long *)((char *)&v180 + v89))), v92, *(float32x2_t *)((char *)&v180 + v89), 1), v93, *(float32x4_t *)((char *)&v180 + v89), 2);
    v89 += 16;
  }
  while (v89 != 48);
  uint64_t v94 = 0;
  float64x2_t v95 = v143;
  float32x4_t v96 = v144;
  float32x4_t v97 = v145;
  HIDWORD(v95.f64[1]) = 0;
  v96.i32[3] = 0;
  v97.i32[3] = 0;
  v98 = self->_gdcParametersAuxiliary.homography;
  float64x2_t v143 = v95;
  float32x4_t v144 = v96;
  float32x4_t v145 = v97;
  do
  {
    for (uint64_t k = 0; k != 3; ++k)
      v98[k] = *(float *)((unint64_t)(&v143 + k) & 0xFFFFFFFFFFFFFFF3 | (4 * (v94 & 3)));
    ++v94;
    v98 += 3;
  }
  while (v94 != 3);
  v100 = (void *)[v48 commandBuffer];
  uint64_t v101 = objc_msgSend((id)objc_msgSend(v48, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_auxInputDescriptor, CVPixelBufferGetIOSurface(v46), 0);
  if (!v101)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v128 = 0;
    v46 = 0;
    uint64_t v14 = 0;
    id v44 = 0;
LABEL_131:
    uint64_t v45 = 0;
LABEL_132:
    char v114 = 0;
    uint64_t v113 = 4294935584;
    goto LABEL_97;
  }
  v102 = (void *)v101;
  id v44 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v48, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_auxOutputDescriptor, CVPixelBufferGetIOSurface(v44), 0);
  v128 = v102;
  if (!v44)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v46 = 0;
LABEL_129:
    uint64_t v14 = 0;
    goto LABEL_131;
  }
  CGFloat v103 = (double)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_auxOutputRequirement videoFormat] width];
  double v104 = (double)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_auxOutputRequirement videoFormat] height];
  self->_gdcParametersAuxiliary.canvasResolution.width = v103;
  self->_gdcParametersAuxiliary.canvasResolution.height = v104;
  self->_gdcParametersAuxiliary.applyZTransform = 0;
  self->_gdcParametersAuxiliary.samplerType = 2;
  BOOL applyRollingShutterCorrection = self->_applyRollingShutterCorrection;
  if (applyRollingShutterCorrection)
  {
    self->_gdcParametersAuxiliary.rollingShutterCorrectionHomographies = v177;
    self->_gdcParametersAuxiliary.numRollingShutterCorrectionHomographies = v124;
    LODWORD(self->_gdcParametersAuxiliary.rollingShutterCorrectionHomographyStep) = v175;
    self->_gdcParametersAuxiliary.BOOL applyRollingShutterCorrection = applyRollingShutterCorrection;
  }
  LODWORD(v104) = 1.0;
  if ([(GDCTransform *)self->_gdcTransform transformFrom:v102 to:v44 withParameters:&self->_gdcParametersAuxiliary withScale:1 withMode:v100 andCommandBuffer:v104])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    v46 = 0;
    uint64_t v14 = 0;
LABEL_149:
    uint64_t v45 = 0;
    char v114 = 0;
    uint64_t v113 = 4294935586;
    goto LABEL_97;
  }
  v46 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v48, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_refInputDescriptor, CVPixelBufferGetIOSurface(v120), 0);
  if (!v46)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    goto LABEL_129;
  }
  uint64_t v14 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v48, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_refOutputDescriptor, CVPixelBufferGetIOSurface(v135), 0);
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    goto LABEL_131;
  }
  CGFloat v106 = (double)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_refOutputRequirement videoFormat] width];
  double v107 = (double)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_refOutputRequirement videoFormat] height];
  self->_gdcParametersReference.canvasResolution.width = v106;
  self->_gdcParametersReference.canvasResolution.height = v107;
  self->_gdcParametersReference.applyZTransform = 0;
  self->_gdcParametersReference.samplerType = 2;
  BOOL v108 = self->_applyRollingShutterCorrection;
  if (v108)
  {
    self->_gdcParametersReference.rollingShutterCorrectionHomographies = v179;
    self->_gdcParametersReference.numRollingShutterCorrectionHomographies = v126;
    self->_gdcParametersReference.rollingShutterCorrectionHomographyStep = *((float *)&v175 + 1);
    self->_gdcParametersReference.BOOL applyRollingShutterCorrection = v108;
  }
  LODWORD(v107) = 1.0;
  if ([(GDCTransform *)self->_gdcTransform transformFrom:v46 to:v14 withParameters:&self->_gdcParametersReference withScale:1 withMode:v100 andCommandBuffer:v107])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
    v112 = 0;
    goto LABEL_149;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", &self->_gdcParametersReference, "{?=[8f][8f]fffffff[9f][9f]{CGSize=dd}Bi^{?}ifBf{CGRect={CGPoint=dd}{CGSize=dd}}}"), @"gdcParametersReference");
  uint64_t v142 = 0;
  memset(v141, 0, sizeof(v141));
  v109 = self->_calibration;
  if (v109) {
    [(Calibration *)v109 correctedCalibration];
  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", v141, "{CalModel=[2d][2d][2d][12d]d[2d][2d]}"), @"calModel");
  [(Calibration *)self->_calibration orientationVector];
  uint64_t v140 = v110;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v140, 8), @"orientationVector");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v178, 48 * v126), @"refRollingShutterCorrectionHomographiesInv");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v126), @"refRollingShutterRowCount");
  LODWORD(v111) = HIDWORD(v175);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v111), @"refRollingShutterHomographyStep");
  CMSetAttachment(target, @"unrectifyData", v15, 1u);
  if (!self->_opticalFlowOutputRequirement)
  {
    v112 = 0;
    uint64_t v45 = 0;
    if (!a7) {
      goto LABEL_96;
    }
    goto LABEL_95;
  }
  uint64_t v45 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v116, "pixelBufferPoolForRequirement:"), "newPixelBuffer");
  if (!v45)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v112 = 0;
    char v114 = 0;
    uint64_t v113 = 4294935578;
    goto LABEL_97;
  }
  [v116 setPixelBuffer:v45 forRequirement:self->_opticalFlowOutputRequirement];
  v112 = objc_msgSend((id)objc_msgSend(v48, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_opticalFlowDescriptor, CVPixelBufferGetIOSurface(v45), 0);
  if (!v112)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_132;
  }
  if ([(PTDisparityPostProcessing *)self->_disparityPostProcessor computeOpticalFlow:v100 inRGBA:v46 outDisplacement:v112])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_147;
  }
  if (a7)
  {
LABEL_95:
    v138[0] = MEMORY[0x1E4F143A8];
    v138[1] = 3221225472;
    v138[2] = __118__BWRectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
    v138[3] = &unk_1E5C24730;
    int v139 = 0;
    v138[4] = self;
    v138[5] = a7;
    [v100 addScheduledHandler:v138];
  }
LABEL_96:
  [v100 commit];
  uint64_t v113 = 0;
  char v114 = 1;
LABEL_97:
  v47 = v135;
LABEL_98:
  v123[3] = vaddq_s64(v123[3], vdupq_n_s64(1uLL));
  if (a7 && (v114 & 1) == 0) {
    (*((void (**)(id, uint64_t, BWRectificationInferenceProvider *))a7 + 2))(a7, v113, self);
  }
  if (v47) {
    CFRelease(v47);
  }
  if (pixelBuffera) {
    CFRelease(pixelBuffera);
  }
  if (v45) {
    CFRelease(v45);
  }

  free(v179);
  free(v178);
  free(v177);
  free(v176);
  return v113;
}

- (unint64_t)_rscForBuffer:(void *)a3 withHomograhies:(void *)a4 andInverseHomographies:(float *)a5 withHomographyStep:
{
  if (!a1) {
    return 0;
  }
  v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55CB8], 0);
  unint64_t v9 = (unint64_t)v8;
  if (!v8)
  {
LABEL_14:
    fig_log_get_emitter();
    FigDebugAssert3();
    return v9;
  }
  unint64_t v10 = [v8 length];
  if (v10 <= 0x24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  unint64_t v11 = v10;
  v12 = (_DWORD *)[(id)v9 bytes];
  int v13 = v12[6];
  unint64_t v9 = v12[7];
  *a5 = (float)v13;
  if ((v9 - 50) <= 0xFFFFFFCE) {
    goto LABEL_14;
  }
  uint64_t v14 = v12;
  if (v12[8] != 1 || v13 <= 0 || v11 != 36 * v9 + 36) {
    goto LABEL_14;
  }
  *a3 = malloc_type_malloc(48 * v9, 0x1000040EED21634uLL);
  uint64_t v15 = 0;
  *a4 = malloc_type_malloc(48 * v9, 0x1000040EED21634uLL);
  int v16 = v14 + 17;
  do
  {
    int32x2_t v17 = *(int32x2_t *)(v16 - 8);
    v18.i32[0] = *(v16 - 6);
    int32x2_t v19 = *(int32x2_t *)(v16 - 5);
    float v20 = v16 - 3;
    uint64_t v21 = *((void *)v16 - 1);
    __int32 v22 = *v16;
    v16 += 9;
    float32x4_t v23 = (int32x2_t *)((char *)*a3 + v15);
    v18.i32[1] = *v20;
    v23[1].i32[0] = v21;
    *float32x4_t v23 = vzip1_s32(v17, v19);
    v23[3].i32[0] = HIDWORD(v21);
    v23[2] = vzip2_s32(v17, v19);
    v23[5].i32[0] = v22;
    v23[4] = v18;
    float32x4_t v24 = (char *)*a4 + v15;
    simd_float3x3 v26 = __invert_f3(*(simd_float3x3 *)((char *)*a3 + v15));
    *((_DWORD *)v24 + 2) = v26.columns[0].i32[2];
    *(void *)float32x4_t v24 = v26.columns[0].i64[0];
    *((_DWORD *)v24 + 6) = v26.columns[1].i32[2];
    *((void *)v24 + 2) = v26.columns[1].i64[0];
    *((_DWORD *)v24 + 10) = v26.columns[2].i32[2];
    v15 += 48;
    *((void *)v24 + 4) = v26.columns[2].i64[0];
  }
  while (48 * v9 != v15);
  return v9;
}

- (uint64_t)_detectKeypointsLKTFlowWithMagnification:(uint64_t)a3 preShift:(_DWORD *)a4 refTex:(float)a5 auxTex:(float32x2_t)a6 keypointsCountOut:
{
  if (result)
  {
    uint64_t v12 = result;
    unsigned __int16 v52 = 0;
    char v13 = [*(id *)(result + 80) lastScale];
    uint64x2_t v50 = *(uint64x2_t *)(v12 + 744);
    uint32x2_t v14 = *(uint32x2_t *)(v12 + 760);
    [*(id *)(v12 + 80) estimateFlowFromReference:a2 target:a3];
    uint64_t v15 = *(void **)(v12 + 80);
    uint64_t v16 = objc_msgSend(v15, "uv_fwd");
    uint64_t v17 = objc_msgSend(*(id *)(v12 + 80), "uv_bwd");
    uint64_t v18 = objc_msgSend(*(id *)(v12 + 80), "conf_fwd");
    uint64_t v19 = objc_msgSend(*(id *)(v12 + 80), "conf_bwd");
    [*(id *)(v12 + 96) bidirectionalError];
    int v21 = v20;
    [*(id *)(v12 + 96) confidenceRadialWeight];
    int v23 = v22;
    [*(id *)(v12 + 96) confidenceMinimum];
    int v25 = v24;
    uint64_t v26 = [*(id *)(v12 + 96) blockSize];
    LODWORD(v27) = v21;
    LODWORD(v28) = v23;
    LODWORD(v29) = v25;
    [v15 computeKeypointsFromForwardFlow:v16 backwardFlow:v17 forwardConfidence:v18 backwardConfidence:v19 bidirectionalError:v26 confidenceRadialWeight:&v52 confidenceMinimum:v27 blockSize:v28 outNumKeypoints:v29];
    [*(id *)(v12 + 80) waitUntilCompleted];
    if (*(void *)(v12 + 776) * *(void *)(v12 + 768) < (unint64_t)v52)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v34 = 0;
      result = 4294954516;
    }
    else
    {
      uint64_t v30 = objc_msgSend((id)objc_msgSend(*(id *)(v12 + 80), "keypoints"), "contents");
      uint64_t v31 = objc_msgSend((id)objc_msgSend(*(id *)(v12 + 80), "keypoints_confidence"), "contents");
      if (v52)
      {
        unint64_t v33 = 0;
        int v34 = 0;
        float v35 = 1.0 / a5;
        float32x2_t v36 = vcvt_f32_f64(vcvtq_f64_u64(v50));
        float32x2_t v37 = vdiv_f32(vmul_n_f32(v36, (float)(1 << v13)), vcvt_f32_u32(v14));
        float32x2_t v38 = vmul_n_f32(v37, v35);
        float32x2_t v39 = vmla_n_f32(a6, v36, (float)(1.0 - v35) * 0.5);
        float64_t v40 = (__int16 *)(v31 + 6);
        float32x4_t v41 = (__int32 *)(v30 + 4);
        do
        {
          LODWORD(v32.f64[0]) = *(v41 - 1);
          *(float32x2_t *)&v32.f64[0] = vadd_f32((float32x2_t)*(_OWORD *)&vcvtq_f32_f16(*(float16x4_t *)&v32.f64[0]), (float32x2_t)0x3F0000003F000000);
          float32x2_t v42 = vmul_f32(v37, *(float32x2_t *)&v32.f64[0]);
          if (fabsf(v42.f32[0]) != INFINITY)
          {
            float32x2_t v51 = v42;
            v6.i32[0] = *v41;
            _H0 = *v40;
            __asm { FCVT            S13, H0 }
            [*(id *)(v12 + 96) confidenceMinimum];
            if (*(float *)v32.f64 <= _S13)
            {
              uint64_t v49 = 16 * v34;
              *(float64x2_t *)(*(void *)(v12 + 616) + v49) = vcvtq_f64_f32(v51);
              float64x2_t v32 = vcvtq_f64_f32(vmla_f32(v39, v38, vadd_f32((float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v6), (float32x2_t)0x3F0000003F000000)));
              *(float64x2_t *)(*(void *)(v12 + 624) + v49) = v32;
              ++v34;
            }
          }
          ++v33;
          v40 += 4;
          v41 += 2;
        }
        while (v33 < v52);
      }
      else
      {
        int v34 = 0;
      }
      result = 0;
    }
    *a4 = v34;
  }
  return result;
}

- (uint64_t)_applyRollingShutterCorrectionToKeypointsRef:(uint64_t)a3 andAux:(unsigned int)a4 withCount:(uint64_t)a5 inverseRefHomographies:(int)a6 refHomographyCount:(uint64_t)a7 refHomographyStep:(int)a8 inverseAuxHomographies:(float)a9 auxHomographyCount:(float)a10 auxHomographyStep:
{
  if (result)
  {
    if (!a5 || !a7)
    {
LABEL_15:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 1;
    }
    if (a4)
    {
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = 8 * v10;
        uint64_t v12 = (float64x2_t *)(a2 + v11);
        uint64_t v14 = (v10 + 1);
        float v15 = *(double *)(a2 + 8 * v14);
        int v16 = (int)(float)(v15 / a9);
        if (v16 >= a6) {
          int v16 = a6 - 1;
        }
        uint64_t v17 = (float32x4_t *)(a5 + 48 * (v16 & ~(v16 >> 31)));
        float v13 = *(double *)(a2 + 8 * v10);
        int32x4_t v18 = (int32x4_t)vaddq_f32(v17[2], vmlaq_n_f32(vmulq_n_f32(*v17, v13), v17[1], v15));
        if (*(float *)&v18.i32[2] == 0.0) {
          break;
        }
        uint64_t v19 = (double *)(a3 + v11);
        float v20 = *(double *)(a3 + 8 * v14);
        int v21 = (int)(float)(v20 / a10);
        if (v21 >= a8) {
          int v21 = a8 - 1;
        }
        float v22 = *v19;
        int v23 = (float32x4_t *)(a7 + 48 * (v21 & ~(v21 >> 31)));
        int32x4_t v24 = (int32x4_t)vaddq_f32(v23[2], vmlaq_n_f32(vmulq_n_f32(*v23, v22), v23[1], v20));
        if (*(float *)&v24.i32[2] == 0.0) {
          break;
        }
        float64x2_t *v12 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_laneq_s32(v18, 2)));
        *(float64x2_t *)uint64_t v19 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v24.i8, (float32x2_t)vdup_laneq_s32(v24, 2)));
        v10 += 2;
        if (2 * a4 == v10) {
          return 0;
        }
      }
      goto LABEL_15;
    }
    return 0;
  }
  return result;
}

uint64_t __118__BWRectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
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

- (BWInferencePropagatable)propagatable
{
  return 0;
}

- (id)newStorage
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [BWInferenceProviderStorage alloc];
  long long v4 = *(_OWORD *)&self->_refKeypointsInputRequirement;
  v7[0] = *(_OWORD *)&self->_refInputRequirement;
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v3, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v5, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_refOutputRequirement, self->_auxOutputRequirement, self->_opticalFlowOutputRequirement, 0));
}

- (int)type
{
  return 113;
}

- (NSArray)inputVideoRequirements
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)&self->_refKeypointsInputRequirement;
  v4[0] = *(_OWORD *)&self->_refInputRequirement;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&self->_originalRefInputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
}

- (NSArray)outputVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_refOutputRequirement, self->_auxOutputRequirement, self->_opticalFlowOutputRequirement, 0);
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

@end