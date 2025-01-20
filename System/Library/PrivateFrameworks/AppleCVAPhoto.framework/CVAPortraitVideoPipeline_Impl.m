@interface CVAPortraitVideoPipeline_Impl
+ (int)pixelBufferPoolCreateWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 pool:(__CVPixelBufferPool *)a6;
+ (void)drawDisparity:(const __CVBuffer *)a3 onColor:(__CVBuffer *)a4 canonical:(BOOL)a5 rawShiftInvalidThreshold:(int)a6 focusMachineState:(int)a7 offsetX:(unint64_t)a8 offsetY:(unint64_t)a9;
- (BOOL)validateDisparityPostprocessingRequest:(id)a3 error:(id *)a4;
- (BOOL)validateMattingRequest:(id)a3 error:(id *)a4;
- (BOOL)validatePortraitRequest:(id)a3 error:(id *)a4;
- (BOOL)validateSegmentationPixelBuffer:(__CVBuffer *)a3 matchFormat:(id)a4 error:(id *)a5;
- (CVAPortraitVideoPipeline_Impl)initWithProperties:(id)a3 commandQueue:(id)a4 notificationQueue:(id)a5 error:(id *)a6;
- (CVAPortraitVideoPipeline_Impl)initWithProperties:(id)a3 error:(id *)a4;
- (CVAVideoPipelineProperties)videoPipelineProperties;
- (id).cxx_construct;
- (id)internal_extractMatteWithRequest:(id)a3 disparityPostprocessingResult:(id)a4 usePostprocessedDisparity:(BOOL)a5 dilateForegroundMask:(BOOL)a6 gravity:(CVAVector)a7 transitionData:(const TransitionData *)a8 isMattingNeeded:(BOOL)a9 mattingCompletionHandler:(id)a10 isFinalStage:(BOOL)a11 status:(int *)a12;
- (id)internal_extractMatteWithRequest:(id)a3 disparityPostprocessingResult:(id)a4 usePostprocessedDisparity:(BOOL)a5 dilateForegroundMask:(BOOL)a6 gravity:(CVAVector)a7 transitionData:(const TransitionData *)a8 mattingCompletionHandler:(id)a9 isFinalStage:(BOOL)a10 status:(int *)a11;
- (id)internal_postprocessDisparityWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 isFinalStage:(BOOL)a5 status:(int *)a6;
- (int)extractMatteWithRequest:(id)a3;
- (int)extractMatteWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 mattingCompletionHandler:(id)a5;
- (int)internal_fixFocusPositionWithDisparityPostprocessingRequest:(id)a3;
- (int)makeMetalContextWithOptionalCommandQueue:(id)a3 error:(id *)a4;
- (int)postprocessDisparityWithRequest:(id)a3;
- (int)postprocessDisparityWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4;
- (int)renderSingleEffectWithRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 error:(id *)a5 disparityPostprocessingCompletionHandler:(id)a6 mattingCompletionHandler:(id)a7 portraitCompletionHandler:(id)a8 requestFrom:(id)a9 requestTo:(id)a10;
- (int)renderWithRequest:(id)a3;
- (int)renderWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 mattingCompletionHandler:(id)a5 portraitCompletionHandler:(id)a6;
- (int)renderWithRequest:(id)a3 requestTo:(id)a4 mixValue:(float)a5 destinationColorPixelBuffer:(__CVBuffer *)a6 error:(id *)a7 disparityPostprocessingCompletionHandler:(id)a8 mattingCompletionHandler:(id)a9 portraitCompletionHandler:(id)a10;
- (int)renderWithRequest:(id)a3 requestTo:(id)a4 mixValue:(float)a5 destinationColorPixelBuffer:(__CVBuffer *)a6 error:(id *)a7 sceneMonitorUsesDisparityStatistics:(BOOL)a8 disparityPostprocessingCompletionHandler:(id)a9 mattingCompletionHandler:(id)a10 portraitCompletionHandler:(id)a11;
- (void)dealloc;
- (void)internal_relightWithRequest:(id)a3 intermediateSourceBuffer:(__CVBuffer *)a4 faceKitProcessOutput:(id)a5 portraitStyleStrength:(float)a6 mattingResult:(id)a7 singleCubeData:(id)a8 portraitCompletionHandler:(id)a9 timestamp:(int64_t)a10 status:(int *)a11;
- (void)internal_renderStageLightWithRequest:(id)a3 mattingResult:(id)a4 portraitCompletionHandler:(id)a5 status:(int *)a6;
- (void)internal_renderWithRequest:(id)a3 dstBuffer:(__CVBuffer *)a4 mattingResult:(id)a5 portraitCompletionHandler:(id)a6 status:(int *)a7 timestamp:(int64_t)a8;
- (void)setVideoPipelineProperties:(id)a3;
@end

@implementation CVAPortraitVideoPipeline_Impl

- (id).cxx_construct
{
  self->_vmPostprocessingParams.useFaceAsFocus = 0;
  self->_vmPostprocessingParams.faceSizeRatioInFocus = 1.0;
  self->_vmPostprocessingParams.fillLargeHolesWithBackground = 0;
  *(void *)&self->_vmPostprocessingParams.disparityIntervalInHoleSearch = 1050673152;
  self->_vmPostprocessingParams.useTemporalRejection = 1;
  v3 = +[CVAPreferenceManager defaults];
  uint64_t v4 = [v3 integerForKey:@"colorWidth"];

  if (v4 != (int)v4)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v4, 0x80000000, 0x7FFFFFFF);
    LODWORD(v4) = 0;
  }
  self->_vmStaticParams.colorWidth = v4;
  v5 = +[CVAPreferenceManager defaults];
  uint64_t v6 = [v5 integerForKey:@"colorHeight"];

  if (v6 != (int)v6)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v6, 0x80000000, 0x7FFFFFFF);
    LODWORD(v6) = 0;
  }
  self->_vmStaticParams.colorHeight = v6;
  v7 = +[CVAPreferenceManager defaults];
  uint64_t v8 = [v7 integerForKey:@"shiftWidth"];

  if (v8 != (int)v8)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v8, 0x80000000, 0x7FFFFFFF);
    LODWORD(v8) = 0;
  }
  self->_vmStaticParams.shiftWidth = v8;
  v9 = +[CVAPreferenceManager defaults];
  uint64_t v10 = [v9 integerForKey:@"shiftHeight"];

  if (v10 != (int)v10)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v10, 0x80000000, 0x7FFFFFFF);
    LODWORD(v10) = 0;
  }
  self->_vmStaticParams.shiftHeight = v10;
  v11 = +[CVAPreferenceManager defaults];
  uint64_t v12 = [v11 integerForKey:@"alphaWidth"];

  if (v12 != (int)v12)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v12, 0x80000000, 0x7FFFFFFF);
    LODWORD(v12) = 0;
  }
  self->_vmStaticParams.alphaWidth = v12;
  v13 = +[CVAPreferenceManager defaults];
  uint64_t v14 = [v13 integerForKey:@"alphaHeight"];

  if (v14 != (int)v14)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v14, 0x80000000, 0x7FFFFFFF);
    LODWORD(v14) = 0;
  }
  self->_vmStaticParams.alphaHeight = v14;
  v15 = +[CVAPreferenceManager defaults];
  uint64_t v16 = [v15 integerForKey:@"kernelSize"];

  if (v16 != (int)v16)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v16, 0x80000000, 0x7FFFFFFF);
    LODWORD(v16) = 0;
  }
  self->_vmStaticParams.kernelSize = v16;
  v17 = +[CVAPreferenceManager defaults];
  [v17 floatForKey:@"referenceShift"];
  float v19 = v18;

  self->_vmStaticParams.referenceShift = v19;
  v20 = +[CVAPreferenceManager defaults];
  [v20 floatForKey:@"guidedFilterUnconfidentWeight"];
  float v22 = v21;

  self->_vmStaticParams.guidedFilterUnconfidentWeight = v22;
  v23 = +[CVAPreferenceManager defaults];
  [v23 floatForKey:@"guidedFilterMinDistToDeweight"];
  float v25 = v24;

  self->_vmStaticParams.guidedFilterMinDistToDeweight = v25;
  v26 = +[CVAPreferenceManager defaults];
  [v26 floatForKey:@"alphaMaxLaplacian"];
  float v28 = v27;

  self->_vmStaticParams.alphaMaxLaplacian = v28;
  v29 = +[CVAPreferenceManager defaults];
  [v29 floatForKey:@"alphaContrastExponent"];
  float v31 = v30;

  self->_vmStaticParams.alphaContrastExponent = v31;
  v32 = +[CVAPreferenceManager defaults];
  [v32 floatForKey:@"shiftFilterColorStd"];
  float v34 = v33;

  self->_vmStaticParams.shiftFilterColorStd = v34;
  v35 = +[CVAPreferenceManager defaults];
  [v35 floatForKey:@"shiftFilterUpdateRate"];
  float v37 = v36;

  self->_vmStaticParams.shiftFilterUpdateRate = v37;
  v38 = +[CVAPreferenceManager defaults];
  [v38 floatForKey:@"maxShiftFillingInconsistency"];
  float v40 = v39;

  self->_vmStaticParams.maxShiftFillingInconsistency = v40;
  v41 = +[CVAPreferenceManager defaults];
  [v41 floatForKey:@"maxShiftFillingDistFromFg"];
  float v43 = v42;

  self->_vmStaticParams.maxShiftFillingDistFromFg = v43;
  v44 = +[CVAPreferenceManager defaults];
  uint64_t v45 = [v44 integerForKey:@"maxDistToPushShiftEdgesFwd"];

  if (v45 != (int)v45)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v45, 0x80000000, 0x7FFFFFFF);
    LODWORD(v45) = 0;
  }
  self->_vmStaticParams.maxDistToPushShiftEdgesFwd = v45;
  v46 = +[CVAPreferenceManager defaults];
  uint64_t v47 = [v46 integerForKey:@"maxDistToPushShiftEdgesRev"];

  if (v47 != (int)v47)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v47, 0x80000000, 0x7FFFFFFF);
    LODWORD(v47) = 0;
  }
  self->_vmStaticParams.maxDistToPushShiftEdgesRev = v47;
  v48 = +[CVAPreferenceManager defaults];
  uint64_t v49 = [v48 integerForKey:@"shiftPushingBgToFgShiftDifference"];

  if (v49 != (int)v49)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v49, 0x80000000, 0x7FFFFFFF);
    LODWORD(v49) = 0;
  }
  self->_vmStaticParams.shiftPushingBgToFgShiftDifference = v49;
  self->_vmDynamicParams.doDisparityHoleFilling = 1;
  self->_transitionData._inTransition = 0;
  *(_OWORD *)&self->_disparityConversion.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_focusStatsPostprocessing.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_disparityStatistics.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_stageLightStateMachine.__ptr_.__value_ = 0u;
  self->_intermediateTransitionBufferFrom.m_ptr = 0;
  self->_intermediateTransitionBufferTo.m_ptr = 0;
  self->_intermediateRelightSourceBuffer.m_ptr = 0;
  *(_OWORD *)&self->_metalContext.device = 0u;
  *(_OWORD *)&self->_metalContext.library = 0u;
  self->_metalContext.captureScope = 0;
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yuvSourceDownsampledAlias, 0);
  value = self->_metalContext.profiler.__ptr_.__value_;
  self->_metalContext.profiler.__ptr_.__value_ = 0;
  if (value)
  {

    std::mutex::~mutex((std::mutex *)((char *)value + 80));
    if (*((unsigned char *)value + 56)) {
      *((unsigned char *)value + 56) = 0;
    }
    uint64_t v4 = (char *)*((void *)value + 4);
    if (v4)
    {
      do
      {
        v5 = *(char **)v4;
        uint64_t v6 = (std::__shared_weak_count *)*((void *)v4 + 6);
        if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
        if (v4[39] < 0) {
          operator delete(*((void **)v4 + 2));
        }
        operator delete(v4);
        uint64_t v4 = v5;
      }
      while (v5);
    }
    v7 = (void *)*((void *)value + 2);
    *((void *)value + 2) = 0;
    if (v7) {
      operator delete(v7);
    }
    MEMORY[0x1BA9F12C0](value, 0x10A0C4075515932);
  }

  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_faceKitProcessOutput, 0);
  m_ptr = self->_intermediateTransitionBufferTo.m_ptr;
  self->_intermediateTransitionBufferTo.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v9 = self->_intermediateTransitionBufferFrom.m_ptr;
  self->_intermediateTransitionBufferFrom.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = self->_intermediateRelightSourceBuffer.m_ptr;
  self->_intermediateRelightSourceBuffer.m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  objc_storeStrong((id *)&self->_filterAlphaBlend, 0);
  objc_storeStrong((id *)&self->_vrAccelerator, 0);
  objc_storeStrong((id *)&self->_vmAccelerator, 0);
  v11 = self->_sdofIntensityStateMachine.__ptr_.__value_;
  self->_sdofIntensityStateMachine.__ptr_.__value_ = 0;
  if (v11) {
    MEMORY[0x1BA9F12C0](v11, 0x1000C4095CF6A33);
  }
  uint64_t v12 = self->_stageLightStateMachine.__ptr_.__value_;
  self->_stageLightStateMachine.__ptr_.__value_ = 0;
  if (v12) {
    MEMORY[0x1BA9F12C0](v12, 0x1000C4021716A34);
  }
  v13 = self->_focusStateMachine.__ptr_.__value_;
  self->_focusStateMachine.__ptr_.__value_ = 0;
  if (v13) {
    MEMORY[0x1BA9F12C0](v13, 0x1000C40A86A77D5);
  }
  uint64_t v14 = self->_disparityStatistics.__ptr_.__value_;
  self->_disparityStatistics.__ptr_.__value_ = 0;
  if (v14)
  {
    uint64_t v15 = sub_1BA83302C((uint64_t)v14);
    MEMORY[0x1BA9F12C0](v15, 0x10A0C401CF549CELL);
  }
  uint64_t v16 = self->_disparityAutofocus.__ptr_.__value_;
  self->_disparityAutofocus.__ptr_.__value_ = 0;
  if (v16)
  {
    v17 = (void *)*((void *)v16 + 6);
    if (v17)
    {
      *((void *)v16 + 7) = v17;
      operator delete(v17);
    }
    float v18 = (void *)*((void *)v16 + 3);
    if (v18)
    {
      *((void *)v16 + 4) = v18;
      operator delete(v18);
    }
    MEMORY[0x1BA9F12C0](v16, 0x1080C400297598BLL);
  }
  float v19 = self->_focusStatsPostprocessing.__ptr_.__value_;
  self->_focusStatsPostprocessing.__ptr_.__value_ = 0;
  if (v19)
  {
    v20 = sub_1BA84F8F4((CVPixelBufferRef *)v19);
    MEMORY[0x1BA9F12C0](v20, 0x1020C4097AB94F3);
  }
  float v21 = self->_disparityGeometricTransformation.__ptr_.__value_;
  self->_disparityGeometricTransformation.__ptr_.__value_ = 0;
  if (v21)
  {
    CVPixelBufferRelease(*((CVPixelBufferRef *)v21 + 7));
    *((void *)v21 + 7) = 0;
    CVPixelBufferRelease(*((CVPixelBufferRef *)v21 + 6));
    *((void *)v21 + 6) = 0;
    MEMORY[0x1BA9F12C0](v21, 0x1020C40FBAF4977);
  }
  float v22 = self->_disparityConversion.__ptr_.__value_;
  self->_disparityConversion.__ptr_.__value_ = 0;
  if (v22)
  {
    CVPixelBufferRelease(*(CVPixelBufferRef *)v22);
    *(void *)float v22 = 0;
    CVPixelBufferRelease(*((CVPixelBufferRef *)v22 + 1));
    *((void *)v22 + 1) = 0;
    CVPixelBufferRelease(*((CVPixelBufferRef *)v22 + 2));
    *((void *)v22 + 2) = 0;
    MEMORY[0x1BA9F12C0](v22, 0x1020C4092A1A721);
  }
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (int)renderWithRequest:(id)a3 requestTo:(id)a4 mixValue:(float)a5 destinationColorPixelBuffer:(__CVBuffer *)a6 error:(id *)a7 sceneMonitorUsesDisparityStatistics:(BOOL)a8 disparityPostprocessingCompletionHandler:(id)a9 mattingCompletionHandler:(id)a10 portraitCompletionHandler:(id)a11
{
  BOOL v12 = a8;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  v113 = self;
  id v17 = a3;
  id v93 = a4;
  id v89 = a9;
  id v90 = a10;
  id v91 = a11;
  v92 = v17;
  sub_1BA862B0C(v120, (uint64_t)&self->_metalContext, self->_debugGPUCaptureFrameNumber);
  if (a7) {
    *a7 = 0;
  }
  v94 = a7;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties setSceneMonitorUsesDisparityStatistics:v12];
  float v18 = NSString;
  float v19 = [NSString stringWithFormat:@"API: requestFrom is nil."];
  v20 = [v18 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 3291, v19];
  sub_1BA8161F4(v17 == 0, a7, 0, 4294944393, v20);

  if (!v17) {
    goto LABEL_10;
  }
  BOOL v21 = a5 > 1.0 || (unint64_t)(a5 < 0.0);
  float v22 = NSString;
  v23 = [NSString stringWithFormat:@"API: 0 <= mixValue <= 1 is false."];
  float v24 = [v22 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 3300, v23];
  sub_1BA8161F4(v21, a7, 0, 4294944393, v24);

  if (v21) {
    goto LABEL_10;
  }
  float v25 = v17;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  v26 = v93;
  if (v93)
  {
    objc_opt_class();
    unsigned __int8 v86 = objc_opt_isKindOfClass();
    float v27 = NSString;
    float v28 = [NSString stringWithFormat:@"API: requestFrom and requestTo should be of the same kind."];
    v29 = [v27 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 3314, v28];
    sub_1BA8161F4((isKindOfClass ^ v86) & 1, a7, 0, 4294944393, v29);

    float v25 = v17;
    v26 = v93;
    if ((isKindOfClass ^ v86))
    {
LABEL_10:
      int v30 = -22903;
      goto LABEL_11;
    }
  }
  else
  {
    unsigned __int8 v86 = 0;
  }
  if (v113->_debugLogTransition)
  {
    uint64_t v32 = ++dword_1E9F76208;
    if (v113->_debugLogTransitionPrintTrivial01 || a5 != 0.0 && a5 != 1.0)
    {
      NSLog(&cfstr_TransitionRend.isa, v32, v25, a5);
      if (v26)
      {
        v119[0] = v25;
        v119[1] = v26;
        uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
      }
      else
      {
        v118 = v25;
        uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
      }
      float v34 = (void *)v33;
      for (unint64_t i = 0; i < [v34 count]; ++i)
      {
        uint64_t v36 = [v34 objectAtIndexedSubscript:i];
        float v37 = (void *)v36;
        if (i == 1) {
          NSLog(&cfstr_TransitionRqto.isa, v36);
        }
        if (v37)
        {
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          uint64_t v38 = [&unk_1F143F7F0 countByEnumeratingWithState:&v109 objects:v117 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v110;
            do
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v110 != v39) {
                  objc_enumerationMutation(&unk_1F143F7F0);
                }
                uint64_t v41 = *(void *)(*((void *)&v109 + 1) + 8 * j);
                float v42 = [v37 valueForKey:v41];
                NSLog(&cfstr_Transition.isa, v41, v42);
              }
              uint64_t v38 = [&unk_1F143F7F0 countByEnumeratingWithState:&v109 objects:v117 count:16];
            }
            while (v38);
          }
        }
      }
      float v25 = v92;
      v26 = v93;
    }
  }
  BOOL v43 = a5 <= 0.5 || v26 == 0;
  if ((v43 && (v44 = v25, ((isKindOfClass ^ 1) & 1) == 0) || (v44 = v26, ((a5 > 0.5) & v86) == 1))
    && (id v45 = v44) != 0)
  {
    v46 = v45;
    uint64_t v47 = [v45 portraitVideoPipeline];
    uint64_t v48 = [v46 sourceColorPixelBuffer];
    uint64_t v49 = [v46 cubeData];
    v50 = +[CVAVideoPipelineLibrary colorCubePortraitRequestForPortraitVideoPipeline:v47 withWithSourceColorPixelBuffer:v48 destinationColorPixelBuffer:a6 cubeData:v49];

    [v50 setParentGenericRequestFrom:v92];
    [v50 setParentGenericRequestTo:v93];
    int v51 = [(CVAPortraitVideoPipeline_Impl *)v113 renderWithRequest:v50 disparityPostprocessingCompletionHandler:v89 mattingCompletionHandler:v90 portraitCompletionHandler:v91];
    int v30 = v51;
    if (v94 && v51 == -22914)
    {
      id *v94 = +[CVAPhotoExceptionMetalResourceUnavailable error];
    }
  }
  else
  {
    v52 = v113;
    v113->_transitionData._inTransition = 0;
    v114[0] = &unk_1F142EDD8;
    v114[1] = &v113;
    v114[3] = v114;
    v116 = v115;
    v115[0] = &unk_1F142EDD8;
    v115[1] = &v113;
    if (a5 == 0.0 || a5 == 1.0)
    {
      if (a5 == 0.0) {
        v75 = v25;
      }
      else {
        v75 = v26;
      }
      if (v26) {
        v76 = v75;
      }
      else {
        v76 = v25;
      }
      int v30 = [(CVAPortraitVideoPipeline_Impl *)v52 renderSingleEffectWithRequest:v76 destinationColorPixelBuffer:a6 error:v94 disparityPostprocessingCompletionHandler:v89 mattingCompletionHandler:v90 portraitCompletionHandler:v91 requestFrom:v25 requestTo:v26];
    }
    else
    {
      if (v26)
      {
        id v53 = v25;
        id v54 = v26;
        v55 = [v53 background];
        objc_opt_class();
        int v56 = objc_opt_isKindOfClass();
        v57 = [v54 background];
        objc_opt_class();
        int v58 = objc_opt_isKindOfClass();

        if ((v56 ^ v58)) {
          goto LABEL_57;
        }
        v59 = [v53 background];
        objc_opt_class();
        int v60 = objc_opt_isKindOfClass();
        v61 = [v54 background];
        objc_opt_class();
        int v62 = objc_opt_isKindOfClass();

        if ((v60 ^ v62)) {
          goto LABEL_57;
        }
        v63 = [v53 background];
        objc_opt_class();
        int v64 = objc_opt_isKindOfClass();
        v65 = [v54 background];
        objc_opt_class();
        int v66 = objc_opt_isKindOfClass();

        if ((v64 ^ v66))
        {
LABEL_57:
          BOOL v67 = a5 > 0.0;
          if (a5 >= 1.0) {
            BOOL v67 = 0;
          }
          v113->_transitionData._inTransition = v67;
        }

        v52 = v113;
        float v25 = v92;
        v26 = v93;
      }
      if (!v52->_intermediateTransitionBufferFrom.m_ptr)
      {
        sub_1BA81ACE4(v107, a6);
        v52 = v113;
        m_ptr = v113->_intermediateTransitionBufferFrom.m_ptr;
        v113->_intermediateTransitionBufferFrom.m_ptr = (void *)v107[0];
        if (m_ptr)
        {
          CFRelease(m_ptr);
          v52 = v113;
        }
      }
      int v30 = -[CVAPortraitVideoPipeline_Impl renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:](v52, "renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:", v25, v25, v26);
      if (!v30)
      {
        if (!v113->_intermediateTransitionBufferTo.m_ptr)
        {
          sub_1BA81ACE4(v107, a6);
          v69 = v113->_intermediateTransitionBufferTo.m_ptr;
          v113->_intermediateTransitionBufferTo.m_ptr = (void *)v107[0];
          if (v69) {
            CFRelease(v69);
          }
        }
        v107[0] = 0;
        v107[1] = v107;
        v107[2] = 0x3032000000;
        v107[3] = sub_1BA81AEA4;
        v107[4] = sub_1BA81AEB4;
        id v108 = 0;
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = sub_1BA81AEBC;
        v106[3] = &unk_1E62284D8;
        v106[4] = v107;
        v70 = (void *)MEMORY[0x1BA9F1850](v106);
        if (!v26
          || (int v30 = -[CVAPortraitVideoPipeline_Impl renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:](v113, "renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:", v92, v93)) == 0)
        {
          if (a6) {
            CFRetain(a6);
          }
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = sub_1BA81AED0;
          v99[3] = &unk_1E6228500;
          id v103 = v91;
          v104 = v107;
          v105 = a6;
          id v71 = v92;
          id v100 = v71;
          id v101 = v93;
          v102 = v113;
          v72 = (void *)MEMORY[0x1BA9F1850](v99);
          CFTypeRef v98 = 0;
          if (v93)
          {
            v73 = a6;
            sub_1BA81AFF0(&v98, v113->_intermediateTransitionBufferTo.m_ptr);
          }
          else
          {
            v77 = [v71 background];
            v78 = [v77 mattingRequest];
            v79 = [v78 disparityPostprocessingRequest];
            sub_1BA81AFF0(&v98, (CFTypeRef)[v79 sourceColorPixelBuffer]);

            v73 = a6;
          }
          if (v113->_preferences.bypassGPUProcessing)
          {
            dispatch_async((dispatch_queue_t)v113->_notificationQueue, v72);
          }
          else
          {
            filterAlphaBlend = v113->_filterAlphaBlend;
            v81 = v113->_intermediateTransitionBufferFrom.m_ptr;
            CFTypeRef v97 = v81;
            if (v81) {
              CFRetain(v81);
            }
            CFTypeRef v96 = v98;
            if (v98) {
              CFRetain(v98);
            }
            CFTypeRef v95 = v73;
            if (v73) {
              CFRetain(v73);
            }
            *(float *)&double v74 = a5;
            [(CVAFilterAlphaBlend *)filterAlphaBlend alphaBlendPixelBuffer:&v97 inPixelBufferSecond:&v96 outPixelBuffer:&v95 alpha:v113->_notificationQueue callbackQueue:v72 callback:v74];
            CFTypeRef v82 = v95;
            CFTypeRef v95 = 0;
            if (v82) {
              CFRelease(v82);
            }
            CFTypeRef v83 = v96;
            CFTypeRef v96 = 0;
            if (v83) {
              CFRelease(v83);
            }
            CFTypeRef v84 = v97;
            CFTypeRef v97 = 0;
            if (v84) {
              CFRelease(v84);
            }
          }
          CFTypeRef v85 = v98;
          CFTypeRef v98 = 0;
          if (v85) {
            CFRelease(v85);
          }

          if (v73) {
            CFRelease(a6);
          }
          int v30 = 0;
        }

        _Block_object_dispose(v107, 8);
      }
    }
    if (!v116)
    {
LABEL_107:
      sub_1BA816504();
      __break(1u);
      JUMPOUT(0x1BA81A950);
    }
    (*(void (**)(void *))(*v116 + 48))(v116);
    if (v116 == v115)
    {
      (*(void (**)(void *))(v115[0] + 32))(v115);
    }
    else if (v116)
    {
      (*(void (**)(void))(*v116 + 40))();
    }
  }
LABEL_11:
  if (!v121) {
    goto LABEL_107;
  }
  (*(void (**)(void *))(*v121 + 48))(v121);
  if (v121 == v120)
  {
    (*(void (**)(void *))(v120[0] + 32))(v120);
  }
  else if (v121)
  {
    (*(void (**)(void *))(*v121 + 40))(v121);
  }

  return v30;
}

- (int)renderWithRequest:(id)a3 requestTo:(id)a4 mixValue:(float)a5 destinationColorPixelBuffer:(__CVBuffer *)a6 error:(id *)a7 disparityPostprocessingCompletionHandler:(id)a8 mattingCompletionHandler:(id)a9 portraitCompletionHandler:(id)a10
{
  return -[CVAPortraitVideoPipeline_Impl renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:](self, "renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:", a3, a4, a6, a7, 1, a8, a9, a10);
}

- (int)renderSingleEffectWithRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 error:(id *)a5 disparityPostprocessingCompletionHandler:(id)a6 mattingCompletionHandler:(id)a7 portraitCompletionHandler:(id)a8 requestFrom:(id)a9 requestTo:(id)a10
{
  id v16 = a3;
  id v89 = a6;
  id v88 = a7;
  id v87 = a8;
  id v90 = a9;
  id v17 = a10;
  float v18 = [v16 post];
  if (v18
    && ([v16 post],
        float v19 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v19,
        v18,
        (isKindOfClass & 1) != 0))
  {
    BOOL v21 = [v16 post];
  }
  else
  {
    BOOL v21 = 0;
  }
  float v22 = [v16 background];
  objc_opt_class();
  char v23 = objc_opt_isKindOfClass();

  if (v23)
  {
    float v24 = [v16 background];
    uint64_t v25 = [v24 sourceColorPixelBuffer];
    if (v21)
    {
      v26 = [v21 singleColorCube];
    }
    else
    {
      v26 = 0;
    }
    v29 = +[CVAVideoPipelineLibrary colorCubePortraitRequestForPortraitVideoPipeline:self withWithSourceColorPixelBuffer:v25 destinationColorPixelBuffer:a4 cubeData:v26];
    if (v21) {

    }
    [v29 setParentGenericRequestFrom:v90];
    [v29 setParentGenericRequestTo:v17];
    int v30 = self;
    uint64_t v32 = v88;
    float v31 = v89;
    uint64_t v33 = v87;
    int v34 = [(CVAPortraitVideoPipeline_Impl *)v30 renderWithRequest:v29 disparityPostprocessingCompletionHandler:v89 mattingCompletionHandler:v88 portraitCompletionHandler:v87];
    int v35 = v34;
    if (a5 && v34 == -22914)
    {
      *a5 = +[CVAPhotoExceptionMetalResourceUnavailable error];
      int v35 = -22914;
    }
    goto LABEL_64;
  }
  float v27 = [v16 background];
  objc_opt_class();
  HIDWORD(v85) = objc_opt_isKindOfClass();

  if (v21)
  {
    float v28 = [v21 singleColorCube];

    if (v28)
    {
      v29 = [v21 singleColorCube];
      [v21 singleColorCube];
    }
    else
    {
      v29 = [v21 foregroundColorCube];
      [v21 backgroundColorCube];
    unsigned __int8 v86 = };
  }
  else
  {
    unsigned __int8 v86 = 0;
    v29 = 0;
  }
  uint64_t v36 = [v16 background];
  objc_opt_class();
  char v37 = objc_opt_isKindOfClass();

  if (v37)
  {
    uint64_t v38 = [v16 background];
    [v38 simulatedFocalRatio];
    float v40 = v39;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76698, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76698))
    {
      CFTypeRef v82 = +[CVAPreferenceManager defaults];
      LODWORD(v85) = [v82 BOOLForKey:@"CVAPhotoFSliderOverridesPortraitStyleStrength"];

      byte_1E9F76560 = v85;
      __cxa_guard_release(&qword_1E9F76698);
    }
    if (byte_1E9F76560
      && ([v16 light], uint64_t v41 = objc_claimAutoreleasedReturnValue(), v41, v41))
    {
      [v38 simulatedFocalRatio];
      float v43 = (float)((float)(v42 + -1.4) / 14.6) + 0.0;
      float v44 = fminf(v43, 1.0);
      if (v43 >= 0.0) {
        float v45 = v44;
      }
      else {
        float v45 = 0.0;
      }
      float v40 = 4.5;
    }
    else
    {
      float v45 = NAN;
    }
    objc_msgSend(v38, "sbufMetadata", v85);
    uint64_t v48 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    metadata = self->_metadata;
    self->_metadata = v48;

    v50 = [v38 sbufMetadata];
    [(VideoMattingMetal *)self->_vmAccelerator setSbufMetadata:v50];

    [v38 primaryCaptureRect];
    if (CGRectIsNull(v91))
    {
      unint64_t v51 = [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferWidth];
      unint64_t v52 = [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferHeight];
      double v53 = (double)v51;
      double v54 = (double)v52;
      double v55 = 0.0;
      double v56 = 0.0;
    }
    else
    {
      [v38 primaryCaptureRect];
    }
    -[VideoMattingMetal setPrimaryCaptureRect:](self->_vmAccelerator, "setPrimaryCaptureRect:", v55, v56, v53, v54);
    v46 = [v38 mattingRequest];
    [v38 sourceColorGain];
    int v58 = v57;
    [v38 sourceColorLux];
    LODWORD(v60) = v59;
    LODWORD(v61) = 0.5;
    *(float *)&double v62 = v40;
    LODWORD(v63) = v58;
    float v24 = +[CVAVideoPipelineLibrary syntheticDepthOfFieldPortraitRequestWithMattingRequest:v46 destinationColorPixelBuffer:a4 backgroundColorCube:v86 foregroundColorCube:v29 colorCubeIntensity:v61 simulatedFocalRatio:v62 sourceColorGain:v63 sourceColorLux:v60];
  }
  else
  {
    if ((v85 & 0x100000000) == 0)
    {
      float v24 = 0;
      float v45 = NAN;
      goto LABEL_37;
    }
    uint64_t v38 = [v16 background];
    v46 = [v38 mattingRequest];
    LODWORD(v47) = 1.0;
    float v24 = +[CVAVideoPipelineLibrary syntheticDepthOfFieldPortraitRequestWithMattingRequest:v46 destinationColorPixelBuffer:a4 backgroundColorCube:0 foregroundColorCube:v29 colorCubeIntensity:0.0 simulatedFocalRatio:v47 sourceColorGain:0.0 sourceColorLux:0.0];
    float v45 = NAN;
  }

LABEL_37:
  int v64 = [v16 light];

  if (v64)
  {
    v65 = [v16 light];
    int v66 = [v65 faceKitProcessOutput];
    faceKitProcessOutput = self->_faceKitProcessOutput;
    self->_faceKitProcessOutput = v66;

    self->_portraitStyleStrength = v45;
    v68 = [v16 light];
    objc_opt_class();
    char v69 = objc_opt_isKindOfClass();

    if (v69)
    {
      if ((v85 & 0x100000000) != 0) {
        uint64_t v70 = 5;
      }
      else {
        uint64_t v70 = 1;
      }
LABEL_55:
      [(CVAVideoPipelinePropertiesSPI *)self->_properties setRelightDisplayMode:v70];
      goto LABEL_56;
    }
    v72 = [v16 light];
    objc_opt_class();
    char v73 = objc_opt_isKindOfClass();

    if (v73)
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76990, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76990))
      {
        CFTypeRef v83 = +[CVAPreferenceManager defaults];
        char v84 = [v83 BOOLForKey:@"CVAPhotoEnforceNewAPI"] ^ 1;

        byte_1E9F76988 = v84;
        __cxa_guard_release(&qword_1E9F76990);
      }
      if (byte_1E9F76988)
      {
        double v74 = [v16 post];
        if (v74)
        {
          v75 = [v16 post];
          objc_opt_class();
          char v76 = objc_opt_isKindOfClass();

          if (v76) {
            goto LABEL_48;
          }
        }
      }
      else
      {
        v78 = [v16 post];
        int v79 = [v78 isMono];

        if (v79)
        {
LABEL_48:
          unsigned int v77 = 4;
          goto LABEL_52;
        }
      }
      unsigned int v77 = 3;
LABEL_52:
      if ((v85 & 0x100000000) != 0) {
        uint64_t v70 = v77;
      }
      else {
        uint64_t v70 = 2;
      }
      goto LABEL_55;
    }
  }
  else
  {
    id v71 = self->_faceKitProcessOutput;
    self->_faceKitProcessOutput = 0;

    self->_portraitStyleStrength = NAN;
  }
  [(CVAVideoPipelinePropertiesSPI *)self->_properties setRelightDisplayMode:0];
LABEL_56:
  if ([v16 isTmpConfig]) {
    [(CVAVideoPipelinePropertiesSPI *)self->_properties setRelightDisplayMode:0x7FFFFFFFLL];
  }
  [v24 setParentGenericRequestFrom:v90];
  [v24 setParentGenericRequestTo:v17];
  if (v24)
  {
    int v35 = [(CVAPortraitVideoPipeline_Impl *)self renderWithRequest:v24 disparityPostprocessingCompletionHandler:v89 mattingCompletionHandler:v88 portraitCompletionHandler:v87];
    v80 = self->_faceKitProcessOutput;
    self->_faceKitProcessOutput = 0;

    if (a5 && v35 == -22914)
    {
      *a5 = +[CVAPhotoExceptionMetalResourceUnavailable error];
      int v35 = -22914;
    }
  }
  else
  {
    int v35 = -22913;
  }

  uint64_t v32 = v88;
  float v31 = v89;
  uint64_t v33 = v87;
LABEL_64:

  return v35;
}

- (int)renderWithRequest:(id)a3
{
  return [(CVAPortraitVideoPipeline_Impl *)self renderWithRequest:a3 disparityPostprocessingCompletionHandler:0 mattingCompletionHandler:0 portraitCompletionHandler:0];
}

- (int)renderWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 mattingCompletionHandler:(id)a5 portraitCompletionHandler:(id)a6
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v114 = a4;
  id v113 = a5;
  id v111 = a6;
  sub_1BA862B0C(v119, (uint64_t)&self->_metalContext, self->_debugGPUCaptureFrameNumber);
  v110.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76668, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76668))
  {
    qword_1E9F766D8 = [NSNumber numberWithBool:1];
    __cxa_guard_release(&qword_1E9F76668);
  }
  if ((byte_1E9F766E8 & 1) == 0)
  {
    HIBYTE(__p[2]) = 10;
    strcpy((char *)__p, "enableSDoF");
    sub_1BA81CE64((uint64_t)&qword_1E9F766D8, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    byte_1E9F766E8 = 1;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76678, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76678))
  {
    qword_1E9F766E0 = [NSNumber numberWithBool:0];
    __cxa_guard_release(&qword_1E9F76678);
  }
  if ((byte_1E9F766F0 & 1) == 0)
  {
    HIBYTE(__p[2]) = 16;
    strcpy((char *)__p, "enableRelighting");
    sub_1BA81CE64((uint64_t)&qword_1E9F766E0, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    byte_1E9F766F0 = 1;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76688, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76688))
  {
    qword_1E9F76700 = [NSNumber numberWithBool:1];
    __cxa_guard_release(&qword_1E9F76688);
  }
  if ((byte_1E9F766F8 & 1) == 0)
  {
    __p[0] = operator new(0x28uLL);
    *(_OWORD *)&__p[1] = xmmword_1BA86C0F0;
    strcpy((char *)__p[0], "enableInfimumConvolutionInRelighting");
    sub_1BA81CE64((uint64_t)&qword_1E9F76700, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    byte_1E9F766F8 = 1;
  }
  int v11 = [(CVAVideoPipelinePropertiesSPI *)self->_properties relightDisplayMode];
  if ((byte_1E9F76C09 & 1) == 0)
  {
    int v12 = v11;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76578, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76578))
    {
      sub_1BA81ED8C();
      __cxa_atexit((void (*)(void *))sub_1BA81F3B8, &xmmword_1E9F76580, &dword_1BA813000);
      __cxa_guard_release(&qword_1E9F76578);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76710, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76710))
    {
      if (v12 == 0x7FFFFFFF) {
        int v99 = 0;
      }
      else {
        int v99 = v12 + 1;
      }
      dword_1E9F769A0 = v99;
      __cxa_guard_release(&qword_1E9F76710);
    }
    if (dword_1E9F769A0 != v12)
    {
      dword_1E9F769A0 = v12;
      if (v12 == 0x7FFFFFFF)
      {
        v13 = (void *)qword_1E9F76608;
        qword_1E9F76608 = 0;

        uint64_t v14 = (void *)qword_1E9F765F8;
        qword_1E9F765F8 = 0;

        if (!byte_1E9F76620) {
          goto LABEL_29;
        }
        uint64_t v15 = 0x7FFFFFFFLL;
        goto LABEL_27;
      }
      if ([(id)qword_1E9F76600 count])
      {
        uint64_t v15 = (v12 % (int)[(id)qword_1E9F76600 count]);
        if ((v15 & 0x80000000) != 0) {
          uint64_t v15 = v15 + [(id)qword_1E9F76600 count];
        }
        id v16 = (void *)qword_1E9F76610;
        id v17 = [(id)qword_1E9F76600 objectAtIndexedSubscript:(int)v15];
        uint64_t v18 = [v16 stringByAppendingString:v17];
        float v19 = (void *)qword_1E9F76608;
        qword_1E9F76608 = v18;

        v20 = (void *)qword_1E9F765F8;
        qword_1E9F765F8 = 0;

        if (byte_1E9F76620) {
LABEL_27:
        }
          NSLog(&cfstr_FileconfigSwit.isa, &xmmword_1E9F76580, v15);
      }
      else
      {
        BOOL v21 = (void *)qword_1E9F76608;
        qword_1E9F76608 = 0;
      }
    }
  }
LABEL_29:
  sub_1BA81D108();
  unint64_t v22 = [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferWidth];
  unint64_t v23 = [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferHeight];
  float v24 = [v10 mattingRequest];
  [v24 primaryCaptureRect];
  BOOL IsEmpty = CGRectIsEmpty(v122);

  if (IsEmpty)
  {
    double v26 = (double)v22;
    double v27 = (double)v23;
    double v28 = 0.0;
    double v29 = 0.0;
  }
  else
  {
    int v30 = [v10 mattingRequest];
    [v30 primaryCaptureRect];
    double v28 = v31;
    double v29 = v32;
    double v26 = v33;
    double v27 = v34;
  }
  -[VideoMattingMetal setPrimaryCaptureRect:](self->_vmAccelerator, "setPrimaryCaptureRect:", v28, v29, v26, v27);
  -[VideoRelightingMetal setPrimaryCaptureRect:](self->_vrAccelerator, "setPrimaryCaptureRect:", v28, v29, v26, v27);
  int v117 = 0;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v36 = objc_opt_isKindOfClass();
  id v116 = 0;
  BOOL v37 = [(CVAPortraitVideoPipeline_Impl *)self validatePortraitRequest:v10 error:&v116];
  id v112 = v116;
  if (v37)
  {
    int v108 = [(id)qword_1E9F766D8 BOOLValue];
    if (isKindOfClass)
    {
      int v38 = [(id)qword_1E9F766E0 BOOLValue] & (v36 ^ 1);
      if (v36 & 1 | ((v38 & 1) == 0))
      {
        char v39 = v36;
        if ((v36 & 1) == 0)
        {
LABEL_36:
          int v40 = v38 & (v108 ^ 1);
          goto LABEL_42;
        }
      }
      else
      {
        char v39 = [(id)qword_1E9F76700 BOOLValue];
        if ((v36 & 1) == 0) {
          goto LABEL_36;
        }
      }
    }
    else
    {
      int v38 = 0;
      char v39 = v36;
      if ((v36 & 1) == 0) {
        goto LABEL_36;
      }
    }
    int v40 = 1;
LABEL_42:
    BOOL v107 = ([(id)qword_1E9F766D8 BOOLValue] & 1) == 0 && sub_1BA81E754("enableSDoF");
    if (v39)
    {
      float v42 = [v10 mattingRequest];
      float v43 = [v42 disparityPostprocessingRequest];
      [v43 sourceColorPixelBufferGravity];
      __p[0] = v44;
      __p[1] = v45;
      __p[2] = v46;

      double v47 = sub_1BA831B54((double *)__p);
      double v49 = v48;
      double v51 = v50;
    }
    else
    {
      double v47 = NAN;
      double v49 = NAN;
      double v51 = NAN;
    }
    unint64_t v52 = [v10 mattingRequest];
    if ([v52 segmentationPixelBuffer])
    {
      char v53 = [(CVAVideoPipelinePropertiesSPI *)self->_properties sceneMonitorUsesDisparityStatistics];

      if ((v53 & 1) == 0)
      {
        vmAccelerator = self->_vmAccelerator;
        double v55 = [v10 mattingRequest];
        uint64_t v56 = [v55 segmentationPixelBuffer];
        notificationQueue = self->_notificationQueue;
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = sub_1BA81EA60;
        void v115[3] = &unk_1E62284B0;
        v115[4] = self;
        [(VideoMattingMetal *)vmAccelerator segmentationAverage:v56 callbackQueue:notificationQueue callback:v115];

        if (v40 & 1 | ((isKindOfClass & 1) == 0)) {
          goto LABEL_59;
        }
        goto LABEL_54;
      }
    }
    else
    {
    }
    self->_previousFramePersonSegmentationRatio = 1.0;
    if (v40 & 1 | ((isKindOfClass & 1) == 0))
    {
LABEL_59:
      if (v40)
      {
        double v61 = self->_vmAccelerator;
        if (v36)
        {
          double v62 = [v10 proxyCubeData];
          double v63 = [v10 cubeData];
          [(VideoMattingMetal *)v61 setStageLightProxyCubeData:v62 cubeData:v63];
        }
        else
        {
          [(VideoMattingMetal *)self->_vmAccelerator setStageLightProxyCubeData:0 cubeData:0];
        }
      }
      int v64 = [v10 mattingRequest];
      v65 = [v64 disparityPostprocessingRequest];
      long long v109 = [(CVAPortraitVideoPipeline_Impl *)self internal_postprocessDisparityWithRequest:v65 disparityPostprocessingCompletionHandler:v114 isFinalStage:0 status:&v117];

      unint64_t v66 = sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]);
      unint64_t v67 = (v66 >> 40) & (v66 == 1);
      if ((v66 >> 40) & (v66 == 1) | v40 & 1)
      {
        BOOL v68 = 1;
      }
      else if (v66)
      {
        BOOL v68 = 0;
      }
      else
      {
        char v69 = [v10 mattingRequest];
        BOOL v68 = [v69 segmentationPixelBuffer] == 0;
      }
      BOOL v70 = ((v40 | v38) & 1) != 0 || !self->_renderForegroundBlur;
      id v71 = [v10 mattingRequest];
      LOBYTE(v106) = v40;
      v72 = -[CVAPortraitVideoPipeline_Impl internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:isMattingNeeded:mattingCompletionHandler:isFinalStage:status:](self, "internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:isMattingNeeded:mattingCompletionHandler:isFinalStage:status:", v71, v109, v68, v67, &self->_transitionData, v70, v47, v49, v51, v113, v106, &v117);

      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76680, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76680))
      {
        id v100 = +[CVAPreferenceManager defaults];
        char v101 = [v100 BOOLForKey:@"CVAPhotoDebugBuffers"];

        byte_1E9F76969 = v101;
        __cxa_guard_release(&qword_1E9F76680);
      }
      if (byte_1E9F76969)
      {
        char v73 = [v72 disparityPostprocessingResult];
        double v74 = [v10 mattingRequest];
        v75 = [v74 disparityPostprocessingRequest];
        sub_1BA81ECAC(@"IN.colorPixelBuffer", (__CVBuffer *)[v75 sourceColorPixelBuffer]);

        char v76 = [v10 mattingRequest];
        unsigned int v77 = [v76 disparityPostprocessingRequest];
        BOOL v78 = [v77 fixedPointDisparityPixelBuffer] == 0;

        if (!v78)
        {
          int v79 = [v10 mattingRequest];
          v80 = [v79 disparityPostprocessingRequest];
          sub_1BA81ECAC(@"IN.fixedPointDisparityPixelBuffer", (__CVBuffer *)[v80 fixedPointDisparityPixelBuffer]);
        }
        v81 = [v10 mattingRequest];
        BOOL v82 = [v81 segmentationPixelBuffer] == 0;

        if (!v82)
        {
          CFTypeRef v83 = [v10 mattingRequest];
          sub_1BA81ECAC(@"IN.segmentationPixelBuffer", (__CVBuffer *)[v83 segmentationPixelBuffer]);
        }
        char v84 = [v10 mattingRequest];
        BOOL v85 = [v84 skinSegmentationPixelBuffer] == 0;

        if (!v85)
        {
          unsigned __int8 v86 = [v10 mattingRequest];
          sub_1BA81ECAC(@"IN.skinSegmentationPixelBuffer", (__CVBuffer *)[v86 skinSegmentationPixelBuffer]);
        }
        if (v73 && [v73 postprocessedDisparityPixelBuffer]) {
          sub_1BA81ECAC(@"OUT.postprocessedDisparityPixelBuffer", (__CVBuffer *)[v73 postprocessedDisparityPixelBuffer]);
        }
        if ([v72 alphaMattePixelBuffer]) {
          sub_1BA81ECAC(@"OUT.alphaMattePixelBuffer", (__CVBuffer *)[v72 alphaMattePixelBuffer]);
        }
        if ([v10 destinationColorPixelBuffer]) {
          sub_1BA81ECAC(@"OUT.colorPixelBuffer", (__CVBuffer *)[v10 destinationColorPixelBuffer]);
        }
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76670, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76670))
      {
        v102 = +[CVAPreferenceManager defaults];
        char v103 = [v102 BOOLForKey:@"CVAPhotoLogValidation"];

        byte_1E9F76970 = v103;
        __cxa_guard_release(&qword_1E9F76670);
      }
      if (byte_1E9F76970)
      {
        if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76980, memory_order_acquire) & 1) == 0
          && __cxa_guard_acquire(&qword_1E9F76980))
        {
          v104 = +[CVAPreferenceManager defaults];
          char v105 = [v104 BOOLForKey:@"CVAPhotoLogValidationPassed"];

          byte_1E9F76978 = v105;
          __cxa_guard_release(&qword_1E9F76980);
        }
        if ((sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) & 0x1000000000000) != 0)
        {
          id v87 = [v10 mattingRequest];
          BOOL v88 = [v87 segmentationPixelBuffer] == 0;

          if (v88)
          {
            NSLog(&cfstr_SMattingreques.isa, "> > > CVAPhoto validation FAILED:");
          }
          else if (byte_1E9F76978)
          {
            NSLog(&cfstr_SMattingreques_0.isa, "> > > CVAPhoto validation PASSED:");
          }
        }
      }
      std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v89 = v110.__d_.__rep_ / 1000;
      if (v38)
      {
        if (v108)
        {
          if (!self->_intermediateRelightSourceBuffer.m_ptr)
          {
            sub_1BA81ACE4(__p, (CVPixelBufferRef)[v10 destinationColorPixelBuffer]);
            m_ptr = self->_intermediateRelightSourceBuffer.m_ptr;
            self->_intermediateRelightSourceBuffer.m_ptr = __p[0];
            if (m_ptr) {
              CFRelease(m_ptr);
            }
          }
          -[CVAPortraitVideoPipeline_Impl internal_renderWithRequest:dstBuffer:mattingResult:portraitCompletionHandler:status:timestamp:](self, "internal_renderWithRequest:dstBuffer:mattingResult:portraitCompletionHandler:status:timestamp:", v10);
          CGRect v91 = self->_intermediateRelightSourceBuffer.m_ptr;
        }
        else
        {
          CGRect v91 = 0;
        }
        v92 = [(CVAVideoPipelinePropertiesSPI *)self->_properties faceKitProcessOutputOverride];
        if (v92)
        {
          faceKitProcessOutput = [(CVAVideoPipelinePropertiesSPI *)self->_properties faceKitProcessOutputOverride];
        }
        else
        {
          faceKitProcessOutput = self->_faceKitProcessOutput;
        }
        [(CVAVideoPipelinePropertiesSPI *)self->_properties portraitStyleStrengthOverride];
        [(CVAVideoPipelinePropertiesSPI *)self->_properties portraitStyleStrengthOverride];
        int v95 = v94;
        CFTypeRef v96 = [v10 foregroundColorCube];
        LODWORD(v97) = v95;
        [(CVAPortraitVideoPipeline_Impl *)self internal_relightWithRequest:v10 intermediateSourceBuffer:v91 faceKitProcessOutput:faceKitProcessOutput portraitStyleStrength:v72 mattingResult:v96 singleCubeData:v111 portraitCompletionHandler:v97 timestamp:v89 status:&v117];

        if (v92) {
      }
        }
      else if (v36 & 1 | !v107)
      {
        if (isKindOfClass)
        {
          -[CVAPortraitVideoPipeline_Impl internal_renderWithRequest:dstBuffer:mattingResult:portraitCompletionHandler:status:timestamp:](self, "internal_renderWithRequest:dstBuffer:mattingResult:portraitCompletionHandler:status:timestamp:", v10, [v10 destinationColorPixelBuffer], v72, v111, &v117, v89);
        }
        else if (v36)
        {
          [(CVAPortraitVideoPipeline_Impl *)self internal_renderStageLightWithRequest:v10 mattingResult:v72 portraitCompletionHandler:v111 status:&v117];
        }
      }
      int v41 = v117;

      goto LABEL_112;
    }
LABEL_54:
    int v58 = self->_vmAccelerator;
    if (v38)
    {
      [(VideoMattingMetal *)self->_vmAccelerator setPortraitForegroundCubeData:0 backgroundCubeData:0];
    }
    else
    {
      int v59 = [v10 foregroundColorCube];
      double v60 = [v10 backgroundColorCube];
      [(VideoMattingMetal *)v58 setPortraitForegroundCubeData:v59 backgroundCubeData:v60];
    }
    goto LABEL_59;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LODWORD(__p[0]) = 138412290;
    *(void **)((char *)__p + 4) = v112;
    _os_log_fault_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@", (uint8_t *)__p, 0xCu);
  }
  int v41 = [v112 code];
LABEL_112:

  if (v120)
  {
    (*(void (**)(void *))(*v120 + 48))(v120);
    if (v120 == v119)
    {
      (*(void (**)(void *))(v119[0] + 32))(v119);
    }
    else if (v120)
    {
      (*(void (**)(void))(*v120 + 40))();
    }

    return v41;
  }
  else
  {
    int result = sub_1BA816504();
    __break(1u);
  }
  return result;
}

- (int)extractMatteWithRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v14 = 0;
  id v13 = 0;
  BOOL v5 = [(CVAPortraitVideoPipeline_Impl *)self validateMattingRequest:v4 error:&v13];
  id v6 = v13;
  if (v5)
  {
    v7 = [v4 disparityPostprocessingRequest];
    uint64_t v8 = [(CVAPortraitVideoPipeline_Impl *)self internal_postprocessDisparityWithRequest:v7 disparityPostprocessingCompletionHandler:0 isFinalStage:0 status:&v14];

    buf[0] = 0;
    LOBYTE(v12) = 1;
    id v9 = -[CVAPortraitVideoPipeline_Impl internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:mattingCompletionHandler:isFinalStage:status:](self, "internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:mattingCompletionHandler:isFinalStage:status:", v4, v8, 1, 0, buf, 0, NAN, NAN, NAN, v12, &v14);
    int v10 = v14;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_fault_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    int v10 = [v6 code];
  }

  return v10;
}

- (int)extractMatteWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 mattingCompletionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v20 = 0;
  id v19 = 0;
  BOOL v11 = [(CVAPortraitVideoPipeline_Impl *)self validateMattingRequest:v8 error:&v19];
  id v12 = v19;
  if (v11)
  {
    id v13 = [v8 disparityPostprocessingRequest];
    int v14 = [(CVAPortraitVideoPipeline_Impl *)self internal_postprocessDisparityWithRequest:v13 disparityPostprocessingCompletionHandler:v9 isFinalStage:0 status:&v20];

    buf[0] = 0;
    LOBYTE(v18) = 1;
    id v15 = -[CVAPortraitVideoPipeline_Impl internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:mattingCompletionHandler:isFinalStage:status:](self, "internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:mattingCompletionHandler:isFinalStage:status:", v8, v14, 1, 0, buf, v10, NAN, NAN, NAN, v18, &v20);
    int v16 = v20;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_fault_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    int v16 = [v12 code];
  }

  return v16;
}

- (int)postprocessDisparityWithRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v11 = 0;
  id v10 = 0;
  BOOL v5 = [(CVAPortraitVideoPipeline_Impl *)self validateDisparityPostprocessingRequest:v4 error:&v10];
  id v6 = v10;
  if (v5)
  {
    id v7 = [(CVAPortraitVideoPipeline_Impl *)self internal_postprocessDisparityWithRequest:v4 disparityPostprocessingCompletionHandler:0 isFinalStage:1 status:&v11];
    int v8 = v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_fault_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    int v8 = [v6 code];
  }

  return v8;
}

- (int)postprocessDisparityWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v14 = 0;
  id v13 = 0;
  BOOL v8 = [(CVAPortraitVideoPipeline_Impl *)self validateDisparityPostprocessingRequest:v6 error:&v13];
  id v9 = v13;
  if (v8)
  {
    id v10 = [(CVAPortraitVideoPipeline_Impl *)self internal_postprocessDisparityWithRequest:v6 disparityPostprocessingCompletionHandler:v7 isFinalStage:1 status:&v14];
    int v11 = v14;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_fault_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    int v11 = [v9 code];
  }

  return v11;
}

- (void)internal_relightWithRequest:(id)a3 intermediateSourceBuffer:(__CVBuffer *)a4 faceKitProcessOutput:(id)a5 portraitStyleStrength:(float)a6 mattingResult:(id)a7 singleCubeData:(id)a8 portraitCompletionHandler:(id)a9 timestamp:(int64_t)a10 status:(int *)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  id v62 = a8;
  id v20 = a9;
  BOOL v21 = [v19 disparityPostprocessingResult];
  id v22 = [CVAPortraitResult_Impl alloc];
  uint64_t v23 = [v17 destinationColorPixelBuffer];
  [(VideoRelightingMetal *)self->_vrAccelerator relightingStability];
  LODWORD(v25) = v24;
  LODWORD(v26) = 1.0;
  double v61 = [(CVAPortraitResult_Impl *)v22 initWithMattingResult:v19 portraitPixelBuffer:v23 portraitStability:v26 relightingStability:v25];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76958, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76958))
  {
    qword_1E9F76950 = [NSNumber numberWithBool:0];
    __cxa_guard_release(&qword_1E9F76958);
  }
  if ((byte_1E9F76960 & 1) == 0)
  {
    HIBYTE(v72[2]) = 21;
    strcpy((char *)v72, "drawDisparityOverride");
    sub_1BA81CE64((uint64_t)&qword_1E9F76950, (uint64_t)v72);
    if (SHIBYTE(v72[2]) < 0) {
      operator delete(v72[0]);
    }
    byte_1E9F76960 = 1;
  }
  if (sub_1BA81E754("drawDisparityOverride"))
  {
    int overlayShiftOnRendering = [(id)qword_1E9F76950 BOOLValue];
    double v28 = v18;
  }
  else
  {
    double v28 = v18;
    int overlayShiftOnRendering = self->_preferences.overlayShiftOnRendering;
  }
  BOOL v29 = overlayShiftOnRendering != 0;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = sub_1BA820CA4;
  v65[3] = &unk_1E6228460;
  v65[4] = self;
  id v64 = v17;
  id v66 = v64;
  BOOL v71 = v29;
  id v30 = v21;
  id v67 = v30;
  id v31 = v20;
  id v69 = v31;
  double v32 = v61;
  BOOL v68 = v32;
  int64_t v70 = a10;
  double v33 = (void *)MEMORY[0x1BA9F1850](v65);
  double v63 = v33;
  if (self->_preferences.bypassGPUProcessing)
  {
    dispatch_async((dispatch_queue_t)self->_notificationQueue, v33);
    double v34 = v62;
  }
  else
  {
    int v59 = v28;
    id v57 = v19;
    unsigned int v35 = sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]);
    char v56 = v36;
    unsigned int v37 = v35;
    vrAccelerator = self->_vrAccelerator;
    int v58 = a4;
    if (!a4)
    {
      double v50 = [v64 mattingRequest];
      double v49 = [v50 disparityPostprocessingRequest];
      int v58 = (__CVBuffer *)[v49 sourceColorPixelBuffer];
    }
    uint64_t v55 = [v19 alphaMattePixelBuffer];
    double v54 = vrAccelerator;
    if (v37 == 1)
    {
      BOOL v53 = 0;
    }
    else
    {
      double v51 = [v64 mattingRequest];
      BOOL v53 = [v51 segmentationPixelBuffer] != 0;
    }
    uint64_t v39 = v37;
    yuvSourceDownsampledAlias = self->_yuvSourceDownsampledAlias;
    int v40 = [v64 mattingRequest];
    uint64_t v41 = [v40 skinSegmentationPixelBuffer];
    uint64_t v42 = [v64 destinationColorPixelBuffer];
    float v43 = [(VideoMattingMetal *)self->_vmAccelerator colorSim];
    float v44 = [(VideoMattingMetal *)self->_vmAccelerator filteredBeforeSmoothDisparity];
    notificationQueue = self->_notificationQueue;
    properties = self->_properties;
    *(float *)&double v47 = 1.0 / self->_vmDynamicParams.focusCanonicalDisparity;
    double v34 = v62;
    *(float *)&double v48 = a6;
    [(VideoRelightingMetal *)v54 renderWithSrcImage:v58 srcAlpha:v55 trustAlpha:v53 isAfterPreviewStitcher:v56 & 1 yuvSourceDownsampled:yuvSourceDownsampledAlias skinSegmentation:v41 dstImage:v48 faceKitProcessOutput:v47 portraitStyleStrength:v42 colorSim:v59 disparity:v43 focusDistance:v44 singleCubeData:v62 properties:properties callbackQueue:notificationQueue callback:v63];

    if (v39 != 1) {
    double v28 = v59;
    }
    id v19 = v57;
    if (!a4)
    {
    }
  }
  if (a11) {
    *a11 = 0;
  }
}

- (void)internal_renderStageLightWithRequest:(id)a3 mattingResult:(id)a4 portraitCompletionHandler:(id)a5 status:(int *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 disparityPostprocessingResult];
  int v13 = *((_DWORD *)self->_stageLightStateMachine.__ptr_.__value_ + 5);
  [v9 vignetteIntensity];
  [v9 vignetteIntensity];
  int v15 = v14;
  [v9 stageLightIntensity];
  [v9 stageLightIntensity];
  int v17 = v16;
  id v18 = [CVAPortraitResult_Impl alloc];
  uint64_t v19 = [v9 destinationColorPixelBuffer];
  LODWORD(v20) = v13;
  int v40 = [(CVAPortraitResult_Impl *)v18 initWithMattingResult:v10 portraitPixelBuffer:v19 portraitStability:v20];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76940, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76940))
  {
    qword_1E9F76938 = [NSNumber numberWithBool:0];
    __cxa_guard_release(&qword_1E9F76940);
  }
  if ((byte_1E9F76948 & 1) == 0)
  {
    HIBYTE(v48[2]) = 21;
    strcpy((char *)v48, "drawDisparityOverride");
    sub_1BA81CE64((uint64_t)&qword_1E9F76938, (uint64_t)v48);
    if (SHIBYTE(v48[2]) < 0) {
      operator delete(v48[0]);
    }
    byte_1E9F76948 = 1;
  }
  if (sub_1BA81E754("drawDisparityOverride")) {
    char v21 = [(id)qword_1E9F76938 BOOLValue];
  }
  else {
    char v21 = self->_preferences.overlayShiftOnRendering != 0;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1BA821308;
  v42[3] = &unk_1E6228488;
  v42[4] = self;
  id v22 = v9;
  id v43 = v22;
  char v47 = v21;
  id v23 = v12;
  id v44 = v23;
  id v24 = v11;
  id v46 = v24;
  double v25 = v40;
  float v45 = v25;
  double v26 = (void *)MEMORY[0x1BA9F1850](v42);
  double v27 = v26;
  if (!self->_preferences.bypassGPUProcessing)
  {
    vmAccelerator = self->_vmAccelerator;
    uint64_t v39 = v10;
    [v22 mattingRequest];
    v38 = unsigned int v37 = vmAccelerator;
    id v30 = [v38 disparityPostprocessingRequest];
    uint64_t v36 = [v30 sourceColorPixelBuffer];
    uint64_t v31 = [v39 alphaMattePixelBuffer];
    uint64_t v32 = [v23 canonicalDisparityPixelBuffer];
    uint64_t v33 = [v22 destinationColorPixelBuffer];
    LODWORD(v34) = v17;
    LODWORD(v35) = v15;
    [(VideoMattingMetal *)v37 renderStageLightWithSource:v36 alpha:v31 canonicalDisparity:v32 dstColor:v33 blackBackgroundIntensity:1 vignetteIntensity:self->_notificationQueue isFinalStage:v34 callbackQueue:v35 withCallback:v27];

    id v10 = v39;
    double v28 = a6;
    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  dispatch_async((dispatch_queue_t)self->_notificationQueue, v26);
  double v28 = a6;
  if (a6) {
LABEL_11:
  }
    *double v28 = 0;
LABEL_12:
}

- (void)internal_renderWithRequest:(id)a3 dstBuffer:(__CVBuffer *)a4 mattingResult:(id)a5 portraitCompletionHandler:(id)a6 status:(int *)a7 timestamp:(int64_t)a8
{
  id v13 = a3;
  id v14 = a5;
  id v131 = a6;
  v135 = v14;
  v133 = v13;
  v132 = [v14 disparityPostprocessingResult];
  [(CVAVideoPipelinePropertiesSPI *)self->_properties offsetNoiseBitCalculation];
  float v16 = v15;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties gainMultiplierNoiseBitCalculation];
  float v18 = v17;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties luxMultiplierNoiseBitCalculation];
  float v20 = v19;
  [v13 sourceColorGain];
  float v22 = v21;
  [v13 sourceColorLux];
  float v24 = v23;
  float v25 = log2f(fmaxf(v22, 1.0));
  float v26 = log2f(fmaxf(v24, 1.0));
  float focusCanonicalDisparity = self->_vmDynamicParams.focusCanonicalDisparity;
  float sdofDeltaCanonicalDisparity = self->_vmDynamicParams.sdofDeltaCanonicalDisparity;
  [v132 focusDisparity];
  float v30 = v29;
  if (sub_1BA849834())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"sdof.cutoffCanonicalDisparity = %5.3f", (float)(v30 - self->_vmDynamicParams.sdofDeltaCanonicalDisparity));
  }
  int fNumber_tenths = self->_preferences.fNumber_tenths;
  if (fNumber_tenths < 1) {
    [v13 simulatedFocalRatio];
  }
  else {
    float v32 = (float)fNumber_tenths / 10.0;
  }
  float v128 = v32;
  value = self->_sdofIntensityStateMachine.__ptr_.__value_;
  double v34 = [v13 mattingRequest];
  double v35 = [v34 disparityPostprocessingRequest];
  v134 = a4;
  int v36 = [v35 isFocalPlaneLocked];
  int v37 = *(_DWORD *)self->_focusStateMachine.__ptr_.__value_;
  int v38 = [v13 mattingRequest];
  uint64_t v39 = [v38 disparityPostprocessingRequest];
  [v39 sourceColorPixelBufferOrientation];
  v143[0] = v40;
  v143[1] = v41;
  v143[2] = v42;
  v143[3] = v43;
  v144[0] = sub_1BA81708C(v143);
  v144[1] = v44;
  v144[2] = v45;
  v144[3] = v46;
  double v47 = sub_1BA817178((double *)value + 3, v144);
  if (((v37 != 0) & ~v36) != 0 || (double v48 = (float *)value, v47 >= *((double *)value + 1))) {
    double v48 = (float *)((char *)value + 4);
  }
  *((float *)value + 4) = fmaxf(fminf(*v48 + *((float *)value + 4), 1.0), 0.0);
  float v127 = sdofDeltaCanonicalDisparity;
  *((double *)value + 3) = sub_1BA81708C(v143);
  *((void *)value + 4) = v49;
  *((void *)value + 5) = v50;
  *((void *)value + 6) = v51;
  float v52 = *((float *)value + 4);

  BOOL v53 = v133;
  double v54 = [v133 mattingRequest];
  uint64_t v55 = v132;
  [v54 primaryCaptureRect];
  char v56 = v134;
  float v123 = v26;
  float v124 = focusCanonicalDisparity;
  float v125 = v25;
  float v126 = v20;
  self->_vmDynamicParams.primaryCaptureRect.origin.x = v57;
  self->_vmDynamicParams.primaryCaptureRect.origin.y = v58;
  self->_vmDynamicParams.primaryCaptureRect.size.width = v59;
  self->_vmDynamicParams.primaryCaptureRect.size.height = v60;

  [v132 backgroundDisparitySumVariance];
  float v62 = v61;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties stableBackgroundDisparitySumVariance];
  float v64 = v63;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties unstableBackgroundDisparitySumVariance];
  float v66 = (float)(v62 - v64) / (float)(v65 - v64);
  float v67 = fminf(v66, 1.0);
  BOOL v68 = v66 < 0.0;
  float v69 = 0.0;
  if (!v68) {
    float v69 = v67;
  }
  float v122 = v69;
  [v132 invalidDisparityRatio];
  float v71 = v70;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties stableInvalidDisparityRatio];
  float v73 = v72;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties unstableInvalidDisparityRatio];
  float v75 = (float)(v71 - v73) / (float)(v74 - v73);
  float v76 = fminf(v75, 1.0);
  if (v75 >= 0.0) {
    float v77 = v76;
  }
  else {
    float v77 = 0.0;
  }
  if ([(CVAVideoPipelinePropertiesSPI *)self->_properties modulateFocalRatio])
  {
    float v78 = 2.0 - v52;
  }
  else
  {
    [(CVAVideoPipelinePropertiesSPI *)self->_properties fNumberMultiplier];
    float v78 = v79;
  }
  v80 = [CVAPortraitResult_Impl alloc];
  *(float *)&double v81 = v52;
  v129 = [(CVAPortraitResult_Impl *)v80 initWithMattingResult:v14 portraitPixelBuffer:v134 portraitStability:v81];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76638, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76638))
  {
    qword_1E9F766B0 = [NSNumber numberWithBool:0];
    __cxa_guard_release(&qword_1E9F76638);
    uint64_t v55 = v132;
    BOOL v53 = v133;
    char v56 = v134;
  }
  if ((byte_1E9F766A8 & 1) == 0)
  {
    HIBYTE(v144[2]) = 21;
    strcpy((char *)v144, "drawDisparityOverride");
    sub_1BA81CE64((uint64_t)&qword_1E9F766B0, (uint64_t)v144);
    if (SHIBYTE(v144[2]) < 0) {
      operator delete(*(void **)&v144[0]);
    }
    byte_1E9F766A8 = 1;
  }
  if (sub_1BA81E754("drawDisparityOverride")) {
    int overlayShiftOnRendering = [(id)qword_1E9F766B0 BOOLValue];
  }
  else {
    int overlayShiftOnRendering = self->_preferences.overlayShiftOnRendering;
  }
  BOOL v83 = overlayShiftOnRendering != 0;
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = sub_1BA821D58;
  v136[3] = &unk_1E6228460;
  v136[4] = self;
  id v84 = v53;
  id v137 = v84;
  BOOL v142 = v83;
  id v85 = v55;
  id v138 = v85;
  id v86 = v131;
  id v140 = v86;
  id v87 = v129;
  v139 = v87;
  int64_t v141 = a8;
  BOOL v88 = (void *)MEMORY[0x1BA9F1850](v136);
  if (self->_preferences.bypassGPUProcessing)
  {
    if ((__CVBuffer *)[v84 destinationColorPixelBuffer] == v56) {
      dispatch_async((dispatch_queue_t)self->_notificationQueue, v88);
    }
  }
  else
  {
    float v119 = v77;
    [(CVAVideoPipelinePropertiesSPI *)self->_properties renderingDisparityUpdateRate];
    if (self->_transitionData._inTransition) {
      float v90 = 1.0;
    }
    else {
      float v90 = v89;
    }
    if (sub_1BA821F74()) {
      NSLog(&cfstr_CvaphotoTransi_1.isa, v90);
    }
    if (self->_renderForegroundBlur
      && !sub_1BA84F794(@"CVAPhotoDeadzoneInCinematic", @"com.apple.coremedia", 0))
    {
      uint64_t v91 = [v85 postprocessedDisparityPixelBuffer];
    }
    else
    {
      uint64_t v91 = [v85 canonicalDisparityPixelBuffer];
    }
    uint64_t v92 = v91;
    vmAccelerator = self->_vmAccelerator;
    uint64_t v121 = [v84 mattingRequest];
    [v121 disparityPostprocessingRequest];
    int v117 = vmAccelerator;
    uint64_t v118 = v92;
    v120 = float v94 = v30;
    uint64_t v116 = [v120 sourceColorPixelBuffer];
    int v95 = [v84 mattingRequest];
    uint64_t v96 = [v95 segmentationPixelBuffer];
    uint64_t v97 = [v135 alphaMattePixelBuffer];
    [(CVAVideoPipelinePropertiesSPI *)self->_properties focusThresholdHardness];
    int v99 = v98;
    [v84 colorCubeIntensity];
    float v101 = v100;
    p_notificationQueue = &self->_notificationQueue;
    notificationQueue = self->_notificationQueue;
    v102 = p_notificationQueue[1];
    uint64_t v105 = [v84 destinationColorPixelBuffer];
    *(float *)&double v112 = fmaxf((float)(v16 + (float)(v18 * v125)) + (float)(v126 * v123), 1.0);
    LODWORD(v113) = 1.0;
    if ((__CVBuffer *)v105 == v134) {
      id v114 = v88;
    }
    else {
      id v114 = 0;
    }
    LOBYTE(v115) = 1;
    *(float *)&double v107 = v94;
    *(float *)&double v109 = v90;
    LODWORD(v110) = v99;
    *(float *)&double v106 = v124 - v127;
    *(float *)&double v108 = v128 * v78;
    *(float *)&double v111 = (float)((float)(v52
                                    * (float)(1.0 - (float)((float)(v122 * v122) * (float)((float)(v122 * -2.0) + 3.0))))
                            * (float)(1.0 - (float)((float)(v119 * v119) * (float)((float)(v119 * -2.0) + 3.0))))
                    * v101;
    -[VideoMattingMetal renderContinuousWithSource:segmentationPixelBuffer:alpha:canonicalDisparity:disparityInFocus:focusCanonicalDisparity:fNumber:infConvolutionScale:noiseBits:disparityUpdateRate:focusThresholdHardness:cubeIntensity:usePostprocessedDisparity:dstColor:isFinalStage:properties:callbackQueue:withCallback:](v117, "renderContinuousWithSource:segmentationPixelBuffer:alpha:canonicalDisparity:disparityInFocus:focusCanonicalDisparity:fNumber:infConvolutionScale:noiseBits:disparityUpdateRate:focusThresholdHardness:cubeIntensity:usePostprocessedDisparity:dstColor:isFinalStage:properties:callbackQueue:withCallback:", v116, v96, v97, v118, 1, v106, v107, v108, v113, v112, v109, v110, v111, v115, v102,
      notificationQueue,
      v114);
  }
  if (a7) {
    *a7 = 0;
  }
}

- (id)internal_extractMatteWithRequest:(id)a3 disparityPostprocessingResult:(id)a4 usePostprocessedDisparity:(BOOL)a5 dilateForegroundMask:(BOOL)a6 gravity:(CVAVector)a7 transitionData:(const TransitionData *)a8 isMattingNeeded:(BOOL)a9 mattingCompletionHandler:(id)a10 isFinalStage:(BOOL)a11 status:(int *)a12
{
  double z = a7.z;
  double y = a7.y;
  double x = a7.x;
  id v20 = a3;
  id v21 = a4;
  id v75 = a10;
  float mattingCoeffUpdateRate = self->_vmDynamicMetaParams.mattingCoeffUpdateRate;
  float mattingCoeffColorStd = self->_vmDynamicMetaParams.mattingCoeffColorStd;
  float v24 = [v20 disparityPostprocessingRequest];
  char v25 = [v24 isFocalPlaneLocked];

  if ((v25 & 1) == 0)
  {
    if (*(_DWORD *)self->_focusStateMachine.__ptr_.__value_ == 1
      || *((float *)self->_sdofIntensityStateMachine.__ptr_.__value_ + 4) < 0.5)
    {
      float mattingCoeffUpdateRate = self->_vmDynamicMetaParams.mattingCoeffUpdateRateFast;
      float mattingCoeffColorStd = self->_vmDynamicMetaParams.mattingCoeffColorStdFast;
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76780, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76780))
      {
        LODWORD(v65) = -1.0;
        qword_1E9F76888 = [NSNumber numberWithFloat:v65];
        __cxa_guard_release(&qword_1E9F76780);
      }
      if ((byte_1E9F76858 & 1) == 0)
      {
        id v84 = (char *)operator new(0x20uLL);
        long long v85 = xmmword_1BA86C100;
        strcpy(v84, "mattingUpdateRateFastOverride");
        sub_1BA81CE64((uint64_t)&qword_1E9F76888, (uint64_t)&v84);
        if (SHIBYTE(v85) < 0) {
          operator delete(v84);
        }
        byte_1E9F76858 = 1;
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76770, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76770))
      {
        LODWORD(v66) = -1.0;
        qword_1E9F76878 = [NSNumber numberWithFloat:v66];
        __cxa_guard_release(&qword_1E9F76770);
      }
      if ((byte_1E9F76860 & 1) == 0)
      {
        id v84 = (char *)operator new(0x20uLL);
        long long v85 = xmmword_1BA86C110;
        strcpy(v84, "mattingColorStdFastOverride");
        sub_1BA81CE64((uint64_t)&qword_1E9F76878, (uint64_t)&v84);
        if (SHIBYTE(v85) < 0) {
          operator delete(v84);
        }
        byte_1E9F76860 = 1;
      }
      if (sub_1BA81E754("mattingUpdateRateFastOverride"))
      {
        [(id)qword_1E9F76888 floatValue];
        float mattingCoeffUpdateRate = v26;
      }
      if (sub_1BA81E754("mattingColorStdFastOverride"))
      {
        [(id)qword_1E9F76878 floatValue];
LABEL_32:
        float mattingCoeffColorStd = v27;
      }
    }
    else
    {
      float mattingCoeffUpdateRate = self->_vmDynamicMetaParams.mattingCoeffUpdateRate;
      float mattingCoeffColorStd = self->_vmDynamicMetaParams.mattingCoeffColorStd;
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76788, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76788))
      {
        LODWORD(v67) = -1.0;
        qword_1E9F76890 = [NSNumber numberWithFloat:v67];
        __cxa_guard_release(&qword_1E9F76788);
      }
      if ((byte_1E9F76868 & 1) == 0)
      {
        id v84 = (char *)operator new(0x20uLL);
        long long v85 = xmmword_1BA86C100;
        strcpy(v84, "mattingUpdateRateSlowOverride");
        sub_1BA81CE64((uint64_t)&qword_1E9F76890, (uint64_t)&v84);
        if (SHIBYTE(v85) < 0) {
          operator delete(v84);
        }
        byte_1E9F76868 = 1;
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76778, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76778))
      {
        LODWORD(v68) = -1.0;
        qword_1E9F76880 = [NSNumber numberWithFloat:v68];
        __cxa_guard_release(&qword_1E9F76778);
      }
      if ((byte_1E9F76870 & 1) == 0)
      {
        id v84 = (char *)operator new(0x20uLL);
        long long v85 = xmmword_1BA86C110;
        strcpy(v84, "mattingColorStdSlowOverride");
        sub_1BA81CE64((uint64_t)&qword_1E9F76880, (uint64_t)&v84);
        if (SHIBYTE(v85) < 0) {
          operator delete(v84);
        }
        byte_1E9F76870 = 1;
      }
      if (sub_1BA81E754("mattingUpdateRateSlowOverride"))
      {
        [(id)qword_1E9F76890 floatValue];
        float mattingCoeffUpdateRate = v28;
      }
      if (sub_1BA81E754("mattingColorStdSlowOverride"))
      {
        [(id)qword_1E9F76880 floatValue];
        goto LABEL_32;
      }
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76760, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76760))
  {
    float v61 = +[CVAPreferenceManager defaults];
    char v62 = [v61 BOOLForKey:@"CVAPhotoDebugStyle"];

    byte_1E9F76929 = v62;
    __cxa_guard_release(&qword_1E9F76760);
  }
  if (byte_1E9F76929)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"mattingUpdateRate = %.3f", mattingCoeffUpdateRate);

    objc_msgSend(NSString, "stringWithFormat:", @"mattingColorStd = %.3f", mattingCoeffColorStd);
  }
  if (a8->_inTransition) {
    float mattingCoeffUpdateRate = 1.0;
  }
  if (sub_1BA821F74()) {
    NSLog(&cfstr_CvaphotoTransi_0.isa, mattingCoeffUpdateRate);
  }
  self->_vmDynamicParams.updateRate = mattingCoeffUpdateRate;
  self->_vmDynamicParams.alphaCoeffFilterColorStd = mattingCoeffColorStd;
  [v21 focusDisparity];
  self->_vmDynamicParams.float focusCanonicalDisparity = v29;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties focusThresholdHardness];
  BOOL v72 = a5;
  float v30 = y;
  float v31 = x;
  float v32 = z;
  self->_vmDynamicParams.thresholdHardness = v33;
  self->_vmDynamicParams.gravity.__elems_[0] = -v30;
  self->_vmDynamicParams.gravity.__elems_[1] = -v31;
  self->_vmDynamicParams.gravity.__elems_[2] = -v32;
  double v34 = -[CVAMattingResult_Impl initWithDisparityPostprocessingResult:alphaMattePixelBuffer:]([CVAMattingResult_Impl alloc], "initWithDisparityPostprocessingResult:alphaMattePixelBuffer:", v21, [v20 destinationAlphaMattePixelBuffer]);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76768, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76768))
  {
    float v63 = +[CVAPreferenceManager defaults];
    char v64 = [v63 BOOLForKey:@"CVAPhotoDebugSceneMonitorValues"];

    byte_1E9F76930 = v64;
    __cxa_guard_release(&qword_1E9F76768);
  }
  if (byte_1E9F76930)
  {
    double v35 = NSString;
    [v21 backgroundDisparitySum];
    objc_msgSend(v35, "stringWithFormat:", @"backgroundDisparitySum: %f", v36);

    int v37 = NSString;
    [v21 invalidDisparityRatio];
    objc_msgSend(v37, "stringWithFormat:", @"invalidDisparityRatio: %f", v38);

    uint64_t v39 = NSString;
    [v21 closeCanonicalDisparityAverage];
    objc_msgSend(v39, "stringWithFormat:", @"closeCanonicalDisparityAverage: %f", v40);

    double v41 = NSString;
    double v42 = [v21 faceCanonicalDisparityAverage];
    [v41 stringWithFormat:@"faceCanonicalDisparityAverage: %@", v42];

    double v43 = NSString;
    [v21 erodedForegroundRatio];
    objc_msgSend(v43, "stringWithFormat:", @"erodedForegroundRatio: %f", v44);

    double v45 = NSString;
    [v21 foregroundRatio];
    objc_msgSend(v45, "stringWithFormat:", @"foregroundRatio: %f", v46);
  }
  if ([v20 segmentationPixelBuffer])
  {
    double v47 = [(CVAVideoPipelinePropertiesSPI *)self->_properties supportedInputSegmentationPixelBufferPixelFormats];
    double v48 = objc_msgSend(NSNumber, "numberWithInt:", CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v20, "segmentationPixelBuffer")));
    if ([v47 containsObject:v48]) {
      uint64_t v49 = [v20 segmentationPixelBuffer];
    }
    else {
      uint64_t v49 = 0;
    }

    if (self->_preferences.bypassGPUProcessing) {
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v49 = 0;
    if (self->_preferences.bypassGPUProcessing) {
      goto LABEL_52;
    }
  }
  if (a9)
  {
    vmAccelerator = self->_vmAccelerator;
    uint64_t v51 = [v21 postprocessedDisparityPixelBuffer];
    [v20 disparityPostprocessingRequest];
    v70 = float v74 = v34;
    id v71 = v21;
    uint64_t v52 = [v70 sourceColorPixelBuffer];
    uint64_t v53 = [v20 destinationAlphaMattePixelBuffer];
    notificationQueue = self->_notificationQueue;
    properties = self->_properties;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = sub_1BA822B8C;
    v76[3] = &unk_1E6228438;
    id v79 = v75;
    id v77 = v20;
    float v78 = v74;
    BYTE2(v69) = a6;
    BYTE1(v69) = a11;
    LOBYTE(v69) = v72;
    -[VideoMattingMetal alphaMattingWithPostprocessedDisparity:source:inSegmentation:alpha:staticParams:dynamicParams:usePostprocessedDisparity:isFinalStage:dilateForegroundMask:properties:callbackQueue:callback:](vmAccelerator, "alphaMattingWithPostprocessedDisparity:source:inSegmentation:alpha:staticParams:dynamicParams:usePostprocessedDisparity:isFinalStage:dilateForegroundMask:properties:callbackQueue:callback:", v51, v52, v49, v53, &self->_vmStaticParams, &self->_vmDynamicParams, v69, properties, notificationQueue, v76);
    char v56 = &v79;
    CGFloat v57 = &v77;
    CGFloat v58 = (id *)&v78;

    id v21 = v71;
    double v34 = v74;
    goto LABEL_53;
  }
LABEL_52:
  CGFloat v59 = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BA822B6C;
  block[3] = &unk_1E6228438;
  char v56 = &v83;
  id v83 = v75;
  CGFloat v57 = &v81;
  id v81 = v20;
  CGFloat v58 = (id *)&v82;
  BOOL v82 = v34;
  dispatch_async(v59, block);
LABEL_53:

  [v20 segmentationPixelBuffer];
  [v20 skinSegmentationPixelBuffer];
  if (a12) {
    *a12 = 0;
  }

  return v34;
}

- (id)internal_extractMatteWithRequest:(id)a3 disparityPostprocessingResult:(id)a4 usePostprocessedDisparity:(BOOL)a5 dilateForegroundMask:(BOOL)a6 gravity:(CVAVector)a7 transitionData:(const TransitionData *)a8 mattingCompletionHandler:(id)a9 isFinalStage:(BOOL)a10 status:(int *)a11
{
  LOBYTE(v13) = a10;
  id v11 = -[CVAPortraitVideoPipeline_Impl internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:isMattingNeeded:mattingCompletionHandler:isFinalStage:status:](self, "internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:isMattingNeeded:mattingCompletionHandler:isFinalStage:status:", a3, a4, a5, a6, a8, 1, a7.x, a7.y, a7.z, a9, v13, a11);

  return v11;
}

- (int)internal_fixFocusPositionWithDisparityPostprocessingRequest:(id)a3
{
  id v4 = a3;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties focusUpdateRateFast];
  float v6 = v5;
  int v7 = [(CVAVideoPipelinePropertiesSPI *)self->_properties maxFramesWithoutFace];
  [v4 currentFocusPosition];
  float v9 = v8;
  value = self->_focusStateMachine.__ptr_.__value_;
  if (*((float *)value + 2) >= INFINITY) {
    *((float *)value + 2) = v8;
  }
  int v11 = ((uint64_t (*)(char *, char *, float))off_1F142EE10[*(_DWORD *)value])((char *)value + 4, (char *)value + 12, v8);
  *(_DWORD *)value = v11;
  if (self->_referenceLensPosition_um >= INFINITY)
  {
    self->_referenceLensPosition_um = v9;
    float v6 = 1.0;
    goto LABEL_8;
  }
  int v12 = v11;
  if (![v4 isFocalPlaneLocked])
  {
    if (v12 == 2)
    {
      syslog(3, "NUM_STATES is not a state. You're doing it wrong.");
      goto LABEL_8;
    }
    if (v12 == 1)
    {
      [(CVAVideoPipelinePropertiesSPI *)self->_properties focusUpdateRateFast];
    }
    else
    {
      if (v12) {
        goto LABEL_8;
      }
      [(CVAVideoPipelinePropertiesSPI *)self->_properties focusUpdateRateSlow];
    }
    float v6 = v47;
    goto LABEL_8;
  }
  float v6 = 0.0;
  if (self->_renderForegroundBlur)
  {
LABEL_8:
    id v14 = [v4 focusRegion];
    if (v14
      && ([v4 focusRegion],
          float v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [v15 count],
          v15,
          v14,
          v16))
    {
      float v17 = [v4 focusRegion];
      float v18 = [v4 focusRegion];
      float v19 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v18, "count") - 1);
      id v20 = [v19 objectForKeyedSubscript:@"X"];
      [v20 floatValue];
      float v22 = v21;

      float v56 = v22;
      float v23 = [v4 focusRegion];
      float v24 = [v4 focusRegion];
      char v25 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") - 1);
      float v26 = [v25 objectForKeyedSubscript:@"Y"];
      [v26 floatValue];
      float v28 = v27;

      float v55 = v28;
      float v29 = [v4 focusRegion];
      float v30 = [v4 focusRegion];
      float v31 = objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v30, "count") - 1);
      float v32 = [v31 objectForKeyedSubscript:@"Width"];
      [v32 floatValue];
      float v34 = v33;

      float v54 = v34;
      float v53 = 0.0;
      double v35 = [v4 focusRegion];
      float v36 = [v4 focusRegion];
      int v37 = objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v36, "count") - 1);
      float v38 = [v37 objectForKeyedSubscript:@"Height"];
      [v38 floatValue];
      float v40 = v39;

      if ((sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) & 0x100000000000000) != 0)
      {
        int v41 = sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]);
        float v42 = (float)(v28 + (float)(v40 * 0.5)) + -1.0;
        float v43 = -v42;
        float v44 = v42 + 1.0;
        if (v41) {
          float v44 = v43;
        }
        float v53 = v34;
        float v54 = v40;
        float v55 = (float)(v22 + (float)(v34 * 0.5)) - (float)(v34 * 0.5);
        float v56 = v44 - (float)(v40 * 0.5);
        sub_1BA82323C(&v56, &v55, &v54, &v53, self->_metadata);
        float v40 = v53;
        float v34 = v54;
      }
      if (v34 > 0.0 && v40 > 0.0)
      {
        if (v34 > 1.0 || v40 > 1.0)
        {
          float v55 = v55 / 1000.0;
          float v56 = v56 / 1000.0;
          float v34 = v34 / 1000.0;
          float v40 = v40 / 1000.0;
        }
        if ((sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) & 0x100000000000000) == 0)
        {
          if (self->_renderForegroundBlur)
          {
            if ([v4 focusRegionType] == 2)
            {
              float v45 = fmaxf(v40, 0.2);
              float v46 = fmaxf(v34, 0.2);
            }
            else
            {
              float v45 = 0.2;
              float v46 = 0.2;
            }
          }
          else
          {
            float v46 = fmaxf(v34, 0.2);
            float v45 = fmaxf(v40, 0.2);
          }
          float v55 = fmaxf(v55 - (float)((float)(v45 - v40) * 0.5), 0.0);
          float v56 = fmaxf(v56 - (float)((float)(v46 - v34) * 0.5), 0.0);
          float v40 = v45;
          float v34 = v46;
        }
        if ((sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) & 0x100000000) != 0
          && [v4 focusRegionType] != 1)
        {
          if (v6 < 0.0 || v6 > 1.0) {
            goto LABEL_46;
          }
          int v52 = 0;
          uint64_t v49 = self->_disparityAutofocus.__ptr_.__value_;
          float v34 = 0.5;
          float v50 = 0.25;
          float v51 = 0.25;
          float v40 = 0.5;
        }
        else
        {
          uint64_t v49 = self->_disparityAutofocus.__ptr_.__value_;
          float v51 = v55;
          float v50 = v56;
          int v52 = [v4 focusRegionType];
          if (v6 < 0.0 || v6 > 1.0)
          {
LABEL_46:
            syslog(3, "Fusion update rate (%.2f) not in [0,1]", v6);
            int v13 = -22900;
            goto LABEL_30;
          }
        }
        int v13 = 0;
        *((float *)v49 + 21) = v50;
        *((float *)v49 + 22) = v51;
        *((float *)v49 + 23) = v34;
        *((float *)v49 + 24) = v40;
        *((_DWORD *)v49 + 25) = -1082130432;
        *((_DWORD *)v49 + 26) = v52;
        *((float *)v49 + 27) = v6;
        *((_DWORD *)v49 + 28) = v7;
        goto LABEL_30;
      }
      syslog(3, "Invalid focus region (%.3f %.3f %.3f %.3f)", v56, v55, v34, v40);
    }
    else
    {
      syslog(3, "Focus region not present");
    }
    int v13 = -22903;
    goto LABEL_30;
  }
  int v13 = 0;
LABEL_30:

  return v13;
}

- (id)internal_postprocessDisparityWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 isFinalStage:(BOOL)a5 status:(int *)a6
{
  void (*v43)(uint64_t *__return_ptr, DisparityAutofocus *, CVPixelBufferRef, BOOL, void **, float);
  __CFString *v44;
  __CFString *v45;
  void *v46;
  float v47;
  void *v48;
  float v49;
  id v50;
  id v51;
  int v52;
  int v53;
  int v54;
  __int16 v55;
  __int16 v56;
  unsigned __int16 v57;
  unsigned __int16 v58;
  float v59;
  float v60;
  float v61;
  float v62;
  void *v63;
  __CVBuffer *v64;
  DisparityAutofocus *v65;
  unsigned char *v66;
  unsigned char *v67;
  size_t v68;
  void *v69;
  void *v70;
  float v71;
  void *v72;
  float v73;
  __CVBuffer *v74;
  __CVBuffer *v75;
  __CVBuffer *untransformedCanonicalDisparityPixelBuffer;
  signed int v77;
  float32x2_t *BaseAddress;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  char *v82;
  size_t v83;
  float *v84;
  float *v85;
  float v86;
  double v87;
  float v88;
  float v89;
  double v90;
  float v91;
  float v92;
  double v93;
  float v94;
  float v95;
  float v96;
  double v97;
  float v98;
  float v99;
  double v100;
  float v101;
  float v102;
  double v103;
  float v104;
  uint64_t v105;
  void *v106;
  unsigned char *v107;
  unsigned char *v108;
  size_t v109;
  void *v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  void *v123;
  float v124;
  void *v125;
  float v126;
  void *v127;
  float v128;
  void *v129;
  float v130;
  void *v131;
  float v132;
  uint64_t v133;
  int8x16_t *v134;
  float32x2_t *v135;
  float64x2_t v136;
  int8x16_t v142;
  float *v143;
  float *v144;
  float32x2_t *v145;
  int8x16_t *v146;
  unint64_t v147;
  float *v148;
  float *v149;
  size_t v150;
  float v151;
  float v152;
  int8x16_t v153;
  uint64_t v154;
  int8x16_t *v155;
  float32x2_t *v156;
  float64x2_t v157;
  int8x16_t v159;
  float32x2_t *v160;
  char *v161;
  unint64_t v162;
  float32x2_t *v163;
  int8x16_t *v164;
  unint64_t v165;
  int8x16_t v166;
  size_t v167;
  uint64_t v168;
  float *v169;
  float *v170;
  float v171;
  float v172;
  __CVBuffer *v173;
  size_t v174;
  size_t v175;
  size_t v176;
  char *v177;
  size_t v178;
  unsigned char *v179;
  size_t v180;
  unint64_t j;
  unint64_t k;
  char v185;
  __CVBuffer *v186;
  char *v187;
  size_t v188;
  size_t v189;
  size_t v190;
  size_t v191;
  size_t v192;
  size_t v193;
  size_t v194;
  unint64_t v195;
  uint64_t v196;
  double v197;
  double v198;
  double v199;
  double v200;
  int v201;
  unint64_t v202;
  char *v203;
  int64_t v204;
  uint64_t v205;
  uint64_t v206;
  unint64_t v207;
  int v208;
  unsigned int v209;
  uint64_t v210;
  size_t v211;
  unint64_t v212;
  uint64_t v213;
  char *v214;
  int v215;
  unint64_t v216;
  int v217;
  unsigned int v218;
  char *v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t v222;
  unint64_t v223;
  uint64_t v224;
  unint64_t v225;
  unint64_t v226;
  unint64_t v227;
  uint64_t v228;
  unsigned int v229;
  unint64_t v230;
  uint64_t v231;
  char *v232;
  unint64_t v233;
  unint64_t v234;
  char *v235;
  unint64_t v236;
  size_t v237;
  void *v238;
  float v239;
  float v240;
  uint64_t v241;
  long long v242;
  int v243;
  DisparityAutofocus *v244;
  int v245;
  DisparityAutofocus *v246;
  float v247;
  int v248;
  DisparityAutofocus *v249;
  float v250;
  float v251;
  StageLightStateMachine *v252;
  int v253;
  int v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  float v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  double v263;
  float *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  SdofStateMachine *v268;
  int v269;
  int v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  double v278;
  float *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  void *v284;
  void *v285;
  double v286;
  _DWORD *v287;
  _DWORD *m;
  void *v289;
  _DWORD *v290;
  _DWORD *n;
  void *v292;
  void *v293;
  void *v294;
  CVADisparityPostprocessingResult_Impl *v295;
  uint64_t v296;
  CVPixelBufferRef v297;
  float focusCanonicalDisparity;
  int v299;
  uint64_t v300;
  double v301;
  uint64_t v302;
  void *v303;
  void *v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  CVADisparityPostprocessingResult_Impl *v313;
  NSObject *notificationQueue;
  CVPixelBufferRef v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  OS_dispatch_queue *v319;
  MTLTexture *v320;
  MTLTexture *yuvSourceDownsampledAlias;
  CVADisparityPostprocessingResult_Impl *v322;
  void *v324;
  char v325;
  void *v326;
  char v327;
  void *v328;
  char v329;
  void *v330;
  char v331;
  uint64_t v332;
  uint64_t v333;
  __CVBuffer *v334;
  unsigned int v335;
  __CVBuffer *pixelBuffer;
  uint64_t (*v337)(uint64_t, CVPixelBufferRef, __CVBuffer *);
  GeometricTransformation *v338;
  void (*v339)(uint64_t *__return_ptr, DisparityAutofocus *, CVPixelBufferRef, BOOL, void **, float);
  size_t v340;
  size_t v341;
  int v342;
  char *v343;
  uint64_t (*v344)(uint64_t, CVPixelBufferRef, uint64_t, float, float, float);
  DisparityStatistics *v345;
  unsigned __int16 v346;
  char *v347;
  void (*v348)(CVPixelBufferRef@<X1>, float *@<X0>, int@<W2>, uint64_t@<X8>);
  unsigned __int16 v350;
  size_t v351;
  unint64_t v352;
  VideoMattingMetal *vmAccelerator;
  DisparityAutofocus *v354;
  id v355;
  id v357;
  float v358;
  unsigned __int16 *v359;
  DisparityConversion *v360;
  char *v361;
  id v362;
  void *v363;
  void v364[4];
  id v365;
  CVADisparityPostprocessingResult_Impl *v366;
  id v367;
  void block[4];
  id v369;
  CVADisparityPostprocessingResult_Impl *v370;
  id v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376[3];
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  uint64_t v381[3];
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  uint64_t v386[3];
  void *v387;
  void *v388;
  void *__p;
  void *v390;
  uint64_t v391[3];
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  long long v396;
  double v397;
  double v398;
  uint64_t v399;
  int v400;
  void *v401[2];
  void *v402[2];
  long long v403;
  float v404;
  float v405;
  long long v406;
  long long v407;
  long long v408;
  long long v409;
  void *v410;
  float *v411;
  float *v412;
  CVPixelBufferRef pixelBufferOut;
  unsigned char v414[24];
  uint64_t v415;
  unsigned char v416[128];
  uint64_t v417;
  uint64_t vars8;

  v417 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v357 = a4;
  pixelBufferOut = 0;
  v411 = 0;
  v410 = 0;
  v412 = 0;
  v363 = v8;
  float v9 = [v8 facesArray];

  if (v9)
  {
    v408 = 0u;
    v409 = 0u;
    v406 = 0u;
    v407 = 0u;
    id v10 = [v8 facesArray];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v406 objects:v416 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v407;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v407 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v406 + 1) + 8 * i) getValue:&v396 size:32];
          float v15 = *((double *)&v396 + 1);
          *(float *)&v372 = v15;
          double v16 = v397;
          float v17 = v398;
          v404 = v17;
          float v18 = *(double *)&v396;
          float v19 = v397;
          if ((sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) & 0x100000000000000) != 0)
          {
            int v20 = sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]);
            float v21 = (float)((float)(v17 * 0.5) + v15) + -1.0;
            float v22 = -v21;
            float v23 = v21 + 1.0;
            if (v20) {
              float v23 = v22;
            }
            v405 = v17;
            v404 = v16;
            *(float *)v414 = v23 - (float)(v17 * 0.5);
            *(float *)&v372 = (float)((float)(v19 * 0.5) + v18) - (float)(v19 * 0.5);
            sub_1BA82323C((float *)v414, (float *)&v372, &v405, &v404, self->_metadata);
            float v18 = *(float *)v414;
            float v19 = v405;
          }
          float v24 = v18 + (float)(v19 * 0.5);
          if (v24 <= 1.0 && v24 >= 0.0)
          {
            int v25 = v372;
            float v26 = v404;
            float v27 = *(float *)&v372 + (float)(v404 * 0.5);
            if (v27 <= 1.0 && v27 >= 0.0)
            {
              float v28 = (char *)v411;
              if (v411 < v412)
              {
                *v411 = v18;
                *((_DWORD *)v28 + 1) = v25;
                id v14 = (float *)(v28 + 16);
                *((float *)v28 + 2) = v19;
                *((float *)v28 + 3) = v26;
              }
              else
              {
                float v29 = (char *)v410;
                uint64_t v30 = ((char *)v411 - (unsigned char *)v410) >> 4;
                unint64_t v31 = v30 + 1;
                if ((unint64_t)(v30 + 1) >> 60) {
                  abort();
                }
                uint64_t v32 = (char *)v412 - (unsigned char *)v410;
                if (((char *)v412 - (unsigned char *)v410) >> 3 > v31) {
                  unint64_t v31 = v32 >> 3;
                }
                if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v33 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v33 = v31;
                }
                if (v33)
                {
                  if (v33 >> 60) {
                    sub_1BA81F974();
                  }
                  float v34 = (char *)operator new(16 * v33);
                }
                else
                {
                  float v34 = 0;
                }
                double v35 = (float *)&v34[16 * v30];
                float *v35 = v18;
                *((_DWORD *)v35 + 1) = v25;
                v35[2] = v19;
                v35[3] = v26;
                float v36 = v35;
                if (v28 != v29)
                {
                  do
                  {
                    *((_OWORD *)v36 - 1) = *((_OWORD *)v28 - 1);
                    v36 -= 4;
                    v28 -= 16;
                  }
                  while (v28 != v29);
                  float v28 = (char *)v410;
                }
                id v14 = v35 + 4;
                v410 = v36;
                v411 = v35 + 4;
                v412 = (float *)&v34[16 * v33];
                if (v28) {
                  operator delete(v28);
                }
              }
              v411 = v14;
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v406 objects:v416 count:16];
      }
      while (v11);
    }
  }
  v398 = 0.0;
  *(_OWORD *)v401 = 0u;
  *(_OWORD *)v402 = 0u;
  v403 = 0u;
  value = self->_disparityConversion.__ptr_.__value_;
  float v38 = self->_disparityGeometricTransformation.__ptr_.__value_;
  v354 = self->_disparityAutofocus.__ptr_.__value_;
  if (!self->_treatFixedPointDisparityAsDense)
  {
    v345 = self->_disparityStatistics.__ptr_.__value_;
    CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    canonicalDisparityPixelBufferPool = self->_canonicalDisparityPixelBufferPool;
LABEL_41:
    int v41 = sub_1BA84E5A4;
    float v42 = sub_1BA860930;
    float v43 = sub_1BA84849C;
    v348 = sub_1BA84BB80;
    v344 = sub_1BA8330A8;
    CVPixelBufferPoolCreatePixelBuffer(v39, canonicalDisparityPixelBufferPool, &pixelBufferOut);
    goto LABEL_42;
  }
  CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  canonicalDisparityPixelBufferPool = self->_canonicalDisparityPixelBufferPool;
  if (!self->_useSixteenBitPrecisionForDenseStereoDisparityConversion)
  {
    v345 = self->_disparityStatistics.__ptr_.__value_;
    goto LABEL_41;
  }
  CVPixelBufferPoolCreatePixelBuffer(v39, canonicalDisparityPixelBufferPool, &pixelBufferOut);
  value = self->_disparityConversion.__ptr_.__value_;
  float v38 = self->_disparityGeometricTransformation.__ptr_.__value_;
  v354 = self->_disparityAutofocus.__ptr_.__value_;
  int v41 = sub_1BA84EE70;
  float v42 = sub_1BA860EC0;
  float v43 = sub_1BA84A254;
  v348 = sub_1BA84C2A0;
  v344 = sub_1BA83434C;
  v345 = self->_disparityStatistics.__ptr_.__value_;
LABEL_42:
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76658, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76658))
  {
    v324 = +[CVAPreferenceManager defaults];
    v325 = [v324 BOOLForKey:@"CVAPhotoDebugDrawDisparityConversionSettings"];

    byte_1E9F76902 = v325;
    __cxa_guard_release(&qword_1E9F76658);
  }
  if (byte_1E9F76902)
  {
    if (self->_treatFixedPointDisparityAsDense) {
      float v44 = @"true";
    }
    else {
      float v44 = @"false";
    }
    [NSString stringWithFormat:@"_treatFixedPointDisparityAsDense: %@", v44];

    if (self->_useSixteenBitPrecisionForDenseStereoDisparityConversion) {
      float v45 = @"true";
    }
    else {
      float v45 = @"false";
    }
    [NSString stringWithFormat:@"_useSixteenBitPrecisionFor...Conversion: %@", v45];

    float v46 = NSString;
    [(CVAVideoPipelinePropertiesSPI *)self->_properties depthPixelBufferMaxLeftOcclusionDisparityChange];
    objc_msgSend(v46, "stringWithFormat:", @"depthPixelBufferMaxLeftOcclusionDisparityChange: %f", v47);

    double v48 = NSString;
    [(CVAVideoPipelinePropertiesSPI *)self->_properties depthPixelBufferMaxRightOcclusionDisparityChange];
    objc_msgSend(v48, "stringWithFormat:", @"depthPixelBufferMaxRightOcclusionDisparityChange: %f", v49);

    objc_msgSend(NSString, "stringWithFormat:", @"_disparityOffset: %f", self->_disparityOffset);
  }
  if (self->_preferences.bypassCPUProcessing)
  {
    float v50 = 0;
    float v51 = 0;
    v358 = 0.0;
    goto LABEL_238;
  }
  if (sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) == 2)
  {
    *(_DWORD *)v414 = 0;
    v359 = (unsigned __int16 *)self->_focusStatsPostprocessing.__ptr_.__value_;
    v350 = [v363 focusTileXOffset];
    v346 = [v363 focusTileYOffset];
    v342 = [v363 focusTileWidth];
    int v52 = [v363 focusTileHeight];
    float v53 = [v363 focusMapWidth];
    float v54 = [v363 focusMapHeight];
    float v55 = [v363 totalSensorCropXOffset];
    float v56 = [v363 totalSensorCropYOffset];
    CGFloat v57 = [v363 totalSensorCropWidth];
    CGFloat v58 = [v363 totalSensorCropHeight];
    [v363 phaseToBlurFactor];
    CGFloat v60 = v59;
    [v363 focusDistanceToMaxAllowedFocusDistanceRatio];
    char v62 = v61;
    float v63 = [v363 focusTileData];
    char v64 = (__CVBuffer *)[v363 segmentationPixelBuffer];
    sub_1BA84F9B4(v359, v350, v346, v342, v52, v53, v54, v55, v60, v62, v56, v57, v58, v63, v64, pixelBufferOut, v414);

    double v65 = self->_disparityAutofocus.__ptr_.__value_;
    *(_DWORD *)double v65 = *(_DWORD *)v414;
    double v67 = (unsigned char *)*((void *)v65 + 3);
    double v66 = (unsigned char *)*((void *)v65 + 4);
    double v68 = v66 - v67;
    if (v66 == v67)
    {
      uint64_t v69 = 0;
    }
    else
    {
      if ((v68 & 0x8000000000000000) != 0) {
        abort();
      }
      uint64_t v69 = operator new(v66 - v67);
      memcpy(v69, v67, v68);
    }
    double v108 = (unsigned char *)*((void *)v65 + 6);
    double v107 = (unsigned char *)*((void *)v65 + 7);
    double v109 = v107 - v108;
    if (v107 != v108)
    {
      if ((v109 & 0x8000000000000000) != 0) {
        abort();
      }
      double v110 = operator new(v107 - v108);
      memcpy(v110, v108, v109);
      operator delete(v110);
    }
    if (!v69) {
      goto LABEL_194;
    }
    double v106 = v69;
    goto LABEL_98;
  }
  if (sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) == 3)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76910, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76910))
    {
      v328 = +[CVAPreferenceManager defaults];
      v329 = [v328 BOOLForKey:@"CVAPhotoDebugDrawAutofocus"];

      byte_1E9F76908 = v329;
      __cxa_guard_release(&qword_1E9F76910);
    }
    if (byte_1E9F76908)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"properties.rawShiftInvalidThreshold: %d", -[CVAVideoPipelinePropertiesSPI rawShiftInvalidThreshold](self->_properties, "rawShiftInvalidThreshold"));

      float v70 = NSString;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityStereoFocalLengthPixels];
      objc_msgSend(v70, "stringWithFormat:", @"properties.disparityStereoFocalLengthPixels: %f", v71);

      BOOL v72 = NSString;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityStereoBaselineMeters];
      objc_msgSend(v72, "stringWithFormat:", @"properties.disparityStereoBaselineMeters: %f", v73);
    }
    v360 = self->_disparityConversion.__ptr_.__value_;
    float v74 = (__CVBuffer *)[v363 networkDisparityPixelBuffer];
    id v75 = (__CVBuffer *)[v363 segmentationPixelBuffer];
    untransformedCanonicalDisparityPixelBuffer = self->_untransformedCanonicalDisparityPixelBuffer;
    id v77 = [(CVAVideoPipelinePropertiesSPI *)self->_properties segmentationBinarizationThreshold];
    v335 = [(CVAVideoPipelinePropertiesSPI *)self->_properties depthErosionRadius];
    v337 = v42;
    v338 = v38;
    v339 = (void (*)(uint64_t *__return_ptr, DisparityAutofocus *, CVPixelBufferRef, BOOL, void **, float))v43;
    CVPixelBufferLockBaseAddress(v74, 1uLL);
    CVPixelBufferLockBaseAddress(untransformedCanonicalDisparityPixelBuffer, 0);
    BaseAddress = (float32x2_t *)CVPixelBufferGetBaseAddress(v74);
    Height = CVPixelBufferGetHeight(v74);
    Width = CVPixelBufferGetWidth(v74);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v74);
    BOOL v82 = (char *)CVPixelBufferGetBaseAddress(untransformedCanonicalDisparityPixelBuffer);
    CVPixelBufferGetHeight(untransformedCanonicalDisparityPixelBuffer);
    CVPixelBufferGetWidth(untransformedCanonicalDisparityPixelBuffer);
    id v83 = CVPixelBufferGetBytesPerRow(untransformedCanonicalDisparityPixelBuffer);
    if (Height && Width)
    {
      if (Width > 7)
      {
        if (Width == (Width & 0xFFFFFFFFFFFFFFF8))
        {
          v133 = 0;
          v134 = (int8x16_t *)(v82 + 16);
          v135 = BaseAddress + 2;
          v136 = (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL);
          __asm { FMOV            V3.4S, #1.0 }
          BOOL v142 = (int8x16_t)vdupq_n_s32(0x42C80000u);
          v143 = (float *)BaseAddress;
          v144 = (float *)v82;
          do
          {
            v145 = v135;
            v146 = v134;
            v147 = Width & 0xFFFFFFFFFFFFFFF8;
            if ((unint64_t)(&v82[v133 * v83] - ((char *)BaseAddress + v133 * BytesPerRow)) >= 0x20)
            {
              do
              {
                v153 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v136, vcvtq_f64_f32(*v145)), (int32x4_t)vcgtq_f64(v136, vcvt_hight_f64_f32(*(float32x4_t *)v145->f32))), v142, (int8x16_t)vdivq_f32(_Q3, *(float32x4_t *)v145->f32));
                v146[-1] = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v136, vcvtq_f64_f32(v145[-2])), (int32x4_t)vcgtq_f64(v136, vcvt_hight_f64_f32(*(float32x4_t *)v145[-2].f32))), v142, (int8x16_t)vdivq_f32(_Q3, *(float32x4_t *)v145[-2].f32));
                *v146 = v153;
                v146 += 2;
                v145 += 4;
                v147 -= 8;
              }
              while (v147);
            }
            else
            {
              v148 = v143;
              v149 = v144;
              v150 = Width;
              do
              {
                v151 = *v148++;
                v152 = 1.0 / v151;
                if (v151 < 0.01) {
                  v152 = 100.0;
                }
                *v149++ = v152;
                --v150;
              }
              while (v150);
            }
            ++v133;
            v134 = (int8x16_t *)((char *)v134 + v83);
            v135 = (float32x2_t *)((char *)v135 + BytesPerRow);
            v144 = (float *)((char *)v144 + v83);
            v143 = (float *)((char *)v143 + BytesPerRow);
          }
          while (v133 != Height);
        }
        else
        {
          v154 = 0;
          v155 = (int8x16_t *)(v82 + 16);
          v156 = BaseAddress + 2;
          v157 = (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL);
          __asm { FMOV            V3.4S, #1.0 }
          v159 = (int8x16_t)vdupq_n_s32(0x42C80000u);
          v160 = BaseAddress;
          v161 = v82;
          do
          {
            if ((unint64_t)(&v82[v154 * v83] - ((char *)BaseAddress + v154 * BytesPerRow)) >= 0x20)
            {
              v163 = v156;
              v164 = v155;
              v165 = Width & 0xFFFFFFFFFFFFFFF8;
              do
              {
                v166 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v157, vcvtq_f64_f32(*v163)), (int32x4_t)vcgtq_f64(v157, vcvt_hight_f64_f32(*(float32x4_t *)v163->f32))), v159, (int8x16_t)vdivq_f32(_Q3, *(float32x4_t *)v163->f32));
                v164[-1] = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v157, vcvtq_f64_f32(v163[-2])), (int32x4_t)vcgtq_f64(v157, vcvt_hight_f64_f32(*(float32x4_t *)v163[-2].f32))), v159, (int8x16_t)vdivq_f32(_Q3, *(float32x4_t *)v163[-2].f32));
                *v164 = v166;
                v164 += 2;
                v163 += 4;
                v165 -= 8;
              }
              while (v165);
              v162 = Width & 0xFFFFFFFFFFFFFFF8;
            }
            else
            {
              v162 = 0;
            }
            v167 = Width - v162;
            v168 = 4 * v162;
            v169 = (float *)&v161[4 * v162];
            v170 = (float *)((char *)v160 + v168);
            do
            {
              v171 = *v170++;
              v172 = 1.0 / v171;
              if (v171 < 0.01) {
                v172 = 100.0;
              }
              *v169++ = v172;
              --v167;
            }
            while (v167);
            ++v154;
            v155 = (int8x16_t *)((char *)v155 + v83);
            v156 = (float32x2_t *)((char *)v156 + BytesPerRow);
            v161 += v83;
            v160 = (float32x2_t *)((char *)v160 + BytesPerRow);
          }
          while (v154 != Height);
        }
      }
      else
      {
        id v84 = (float *)&BaseAddress[1] + 1;
        long long v85 = (float *)(v82 + 12);
        do
        {
          id v86 = *(v84 - 3);
          id v87 = v86;
          BOOL v88 = 1.0 / v86;
          if (v87 < 0.01) {
            BOOL v88 = 100.0;
          }
          *(v85 - 3) = v88;
          if (Width != 1)
          {
            float v89 = *(v84 - 2);
            float v90 = v89;
            uint64_t v91 = 1.0 / v89;
            if (v90 < 0.01) {
              uint64_t v91 = 100.0;
            }
            *(v85 - 2) = v91;
            if (Width != 2)
            {
              uint64_t v92 = *(v84 - 1);
              id v93 = v92;
              float v94 = 1.0 / v92;
              if (v93 < 0.01) {
                float v94 = 100.0;
              }
              *(v85 - 1) = v94;
              if (Width != 3)
              {
                int v95 = 1.0 / *v84;
                if (*v84 < 0.01) {
                  int v95 = 100.0;
                }
                *long long v85 = v95;
                if (Width != 4)
                {
                  uint64_t v96 = v84[1];
                  uint64_t v97 = v96;
                  int v98 = 1.0 / v96;
                  if (v97 < 0.01) {
                    int v98 = 100.0;
                  }
                  v85[1] = v98;
                  if (Width != 5)
                  {
                    int v99 = v84[2];
                    float v100 = v99;
                    float v101 = 1.0 / v99;
                    if (v100 < 0.01) {
                      float v101 = 100.0;
                    }
                    v85[2] = v101;
                    if (Width != 6)
                    {
                      v102 = v84[3];
                      char v103 = v102;
                      v104 = 1.0 / v102;
                      if (v103 < 0.01) {
                        v104 = 100.0;
                      }
                      v85[3] = v104;
                    }
                  }
                }
              }
            }
          }
          id v84 = (float *)((char *)v84 + BytesPerRow);
          long long v85 = (float *)((char *)v85 + v83);
          --Height;
        }
        while (Height);
      }
    }
    if (v75)
    {
      pixelBuffer = untransformedCanonicalDisparityPixelBuffer;
      v334 = v74;
      v173 = (__CVBuffer *)*((void *)v360 + 2);
      CVPixelBufferLockBaseAddress(v75, 1uLL);
      CVPixelBufferLockBaseAddress(v173, 0);
      v351 = CVPixelBufferGetWidth(v75);
      v174 = CVPixelBufferGetHeight(v75);
      v175 = CVPixelBufferGetWidth(v173);
      v176 = CVPixelBufferGetHeight(v173);
      v177 = (char *)CVPixelBufferGetBaseAddress(v75);
      CVPixelBufferGetHeight(v75);
      CVPixelBufferGetWidth(v75);
      v178 = CVPixelBufferGetBytesPerRow(v75);
      v179 = CVPixelBufferGetBaseAddress(v173);
      CVPixelBufferGetHeight(v173);
      CVPixelBufferGetWidth(v173);
      v180 = CVPixelBufferGetBytesPerRow(v173);
      if (v176 && v175)
      {
        for (uint64_t j = 0; j != v176; ++j)
        {
          for (k = 0; k != v175; ++k)
          {
            _H5 = *(_WORD *)&v177[2 * (int)(((double)k + 0.5) * (double)v351 / (double)v175)
                                + v178 * (int)(((double)j + 0.5) * (double)v174 / (double)v176)];
            __asm { FCVT            S5, H5 }
            if (v77 <= (int)llroundf(_S5 * 255.0)) {
              v185 = 32;
            }
            else {
              v185 = 16;
            }
            v179[k] = v185;
          }
          v179 += v180;
        }
      }
      CVPixelBufferUnlockBaseAddress(v75, 1uLL);
      CVPixelBufferUnlockBaseAddress(v173, 0);
      v186 = (__CVBuffer *)*((void *)v360 + 2);
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      CVPixelBufferLockBaseAddress(v186, 1uLL);
      v187 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
      v188 = CVPixelBufferGetHeight(pixelBuffer);
      v189 = CVPixelBufferGetWidth(pixelBuffer);
      v190 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      v347 = (char *)CVPixelBufferGetBaseAddress(v186);
      v191 = CVPixelBufferGetHeight(v186);
      v192 = CVPixelBufferGetWidth(v186);
      v193 = CVPixelBufferGetBytesPerRow(v186);
      if (v188)
      {
        v194 = v189;
        if (v189)
        {
          v341 = v188;
          v343 = v187;
          v195 = 0;
          v196 = v335;
          v197 = (double)v191;
          v198 = (double)v188;
          v199 = (double)v192;
          v200 = (double)v189;
          v201 = v189 - 1;
          v340 = v193;
          do
          {
            v202 = 0;
            v361 = &v343[v190 * v195];
            v352 = v195;
            v203 = &v347[v193 * (int)(((double)v195 + 0.5) * v197 / v198)];
            v204 = (unint64_t)v335 << 32;
            do
            {
              v205 = (v202 - v335) & ~((int)(v202 - v335) >> 31);
              v206 = v204 >> 32;
              if (v204 >> 32 >= v201) {
                v206 = v201;
              }
              v207 = v206 + 1;
              if (v207 <= v205 + 1) {
                v207 = v205 + 1;
              }
              v208 = (int)(((double)v202 + 0.5) * v199 / v200);
              if (v208 >= 1 && v203[v208] != v203[v208 - 1])
              {
                v209 = v196 + v202;
                if (v201 < (int)v196 + (int)v202) {
                  v209 = v189 - 1;
                }
                if (v205 <= v209)
                {
                  v210 = v196;
                  v211 = v194;
                  memset_pattern16(&v361[4 * v205], &unk_1BA86C270, 4 * (v207 - v205));
                  v194 = v211;
                  v196 = v210;
                }
              }
              ++v202;
              v204 += 0x100000000;
            }
            while (v194 != v202);
            v195 = v352 + 1;
            v193 = v340;
          }
          while (v352 + 1 != v341);
          v212 = 0;
          v213 = (int)v341 - 1;
          v214 = v343;
          while (1)
          {
            v215 = (int)(((double)v212 + 0.5) * v199 / v200);
            if (v215 >= 1) {
              break;
            }
LABEL_158:
            ++v212;
            v214 += 4;
            if (v212 == v194) {
              goto LABEL_186;
            }
          }
          v216 = 0;
          v217 = -v335;
          v218 = v335;
          v219 = &v347[v215];
          while (1)
          {
            v220 = v217 & ~(v217 >> 31);
            v221 = (int)v218;
            if ((int)v218 >= v213) {
              v221 = (int)v341 - 1;
            }
            v222 = v221 + 1;
            if (v222 <= v220 + 1) {
              v223 = v220 + 1;
            }
            else {
              v223 = v222;
            }
            v224 = (int)v216 + (int)v196;
            if (v224 >= v213) {
              v224 = (int)v341 - 1;
            }
            v225 = v224 + 1;
            v226 = (v216 - v335) & ~((int)(v216 - v335) >> 31);
            if (v225 <= v226 + 1) {
              v227 = v226 + 1;
            }
            else {
              v227 = v225;
            }
            v228 = (int)(((double)v216 + 0.5) * v197 / v198);
            if ((int)v228 < 1 || v219[v340 * v228] == v219[v340 * (v228 - 1)]) {
              goto LABEL_161;
            }
            v229 = v335 + v216;
            if ((int)v213 < (int)(v335 + v216)) {
              v229 = v341 - 1;
            }
            if (v226 > v229) {
              goto LABEL_161;
            }
            v230 = v227 - v226;
            if (v230 >= 2 && v190 == 1)
            {
              v231 = 0;
              v232 = &v214[v220];
              v233 = (v223 - v220) & 0xFFFFFFFFFFFFFFFELL;
              v234 = v230 & 0xFFFFFFFFFFFFFFFELL;
              do
              {
                v235 = &v232[v231];
                *(_DWORD *)v235 = 1157627904;
                *(_DWORD *)(v235 + 1) = 1157627904;
                v231 += 2;
              }
              while (v233 != v231);
              if (v230 == v234) {
                goto LABEL_161;
              }
              v226 += v234;
            }
            v236 = (int)v229;
            v237 = v190 * v226;
            do
            {
              *(_DWORD *)&v214[v237] = 1157627904;
              ++v226;
              v237 += v190;
            }
            while (v226 <= v236);
LABEL_161:
            ++v216;
            ++v218;
            ++v217;
            if (v216 == v341) {
              goto LABEL_158;
            }
          }
        }
      }
LABEL_186:
      CVPixelBufferUnlockBaseAddress(v186, 1uLL);
      untransformedCanonicalDisparityPixelBuffer = pixelBuffer;
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      float v74 = v334;
    }
    CVPixelBufferUnlockBaseAddress(v74, 1uLL);
    CVPixelBufferUnlockBaseAddress(untransformedCanonicalDisparityPixelBuffer, 0);
    v337((uint64_t)v338, self->_untransformedCanonicalDisparityPixelBuffer, pixelBufferOut);
    [(CVAPortraitVideoPipeline_Impl *)self internal_fixFocusPositionWithDisparityPostprocessingRequest:v363];
    v339(v391, v354, pixelBufferOut, self->_vmPostprocessingParams.useFaceAsFocus, &v410, self->_vmPostprocessingParams.faceSizeRatioInFocus);
    if (v394)
    {
      v395 = v394;
      operator delete(v394);
    }
    if (v392)
    {
      v393 = v392;
      operator delete(v392);
    }
    [(CVAVideoPipelinePropertiesSPI *)self->_properties focusDistanceOverride];
    if (byte_1E9F76908)
    {
      v238 = NSString;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties focusDistanceOverride];
      objc_msgSend(v238, "stringWithFormat:", @"properties.focusDistanceOverride: %f", v239);
    }
LABEL_193:
    [(CVAVideoPipelinePropertiesSPI *)self->_properties focusDistanceOverride];
    *(float *)self->_disparityAutofocus.__ptr_.__value_ = 1.0 / v240;
    goto LABEL_194;
  }
  if (!self->_renderForegroundBlur)
  {
    [v363 disparityNormalizationMultiplier];
    [v363 disparityNormalizationMultiplier];
    double v112 = v111;
    [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityStereoFocalLengthPixels];
    id v114 = v113;
    [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityStereoBaselineMeters];
    uint64_t v116 = 1.0 / (float)((float)(v112 * v114) * v115);
    [v363 disparityNormalizationOffset];
    [v363 disparityNormalizationOffset];
    uint64_t v118 = v117;
    [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityStereoFocalLengthPixels];
    v120 = v119;
    [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityStereoBaselineMeters];
    float v122 = (float)(v118 * v120) * v121;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76640, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76640))
    {
      v330 = +[CVAPreferenceManager defaults];
      v331 = [v330 BOOLForKey:@"CVAPhotoDebugDrawAutofocus"];

      byte_1E9F76918 = v331;
      __cxa_guard_release(&qword_1E9F76640);
    }
    if (byte_1E9F76918)
    {
      float v123 = NSString;
      [v363 disparityNormalizationMultiplier];
      objc_msgSend(v123, "stringWithFormat:", @"disparityNormalizationMultiplier: %f", v124);

      float v125 = NSString;
      [v363 disparityNormalizationOffset];
      objc_msgSend(v125, "stringWithFormat:", @"disparityNormalizationOffset: %f", v126);

      objc_msgSend(NSString, "stringWithFormat:", @"properties.rawShiftInvalidThreshold: %d", -[CVAVideoPipelinePropertiesSPI rawShiftInvalidThreshold](self->_properties, "rawShiftInvalidThreshold"));
      float v127 = NSString;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityStereoFocalLengthPixels];
      objc_msgSend(v127, "stringWithFormat:", @"properties.disparityStereoFocalLengthPixels: %f", v128);

      v129 = NSString;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityStereoBaselineMeters];
      objc_msgSend(v129, "stringWithFormat:", @"properties.disparityStereoBaselineMeters: %f", v130);
    }
    v41((uint64_t)value, (CVPixelBufferRef)[v363 fixedPointDisparityPixelBuffer], -[CVAVideoPipelinePropertiesSPI rawShiftInvalidThreshold](self->_properties, "rawShiftInvalidThreshold"), self->_untransformedCanonicalDisparityPixelBuffer, v116, v122);
    v42((uint64_t)v38, self->_untransformedCanonicalDisparityPixelBuffer, pixelBufferOut);
    [(CVAPortraitVideoPipeline_Impl *)self internal_fixFocusPositionWithDisparityPostprocessingRequest:v363];
    ((void (*)(uint64_t *__return_ptr, DisparityAutofocus *, CVPixelBufferRef, BOOL, void **, float))v43)(v381, v354, pixelBufferOut, self->_vmPostprocessingParams.useFaceAsFocus, &v410, self->_vmPostprocessingParams.faceSizeRatioInFocus);
    if (v384)
    {
      v385 = v384;
      operator delete(v384);
    }
    if (v382)
    {
      v383 = v382;
      operator delete(v382);
    }
    [(CVAVideoPipelinePropertiesSPI *)self->_properties focusDistanceOverride];
    if (byte_1E9F76918)
    {
      id v131 = NSString;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties focusDistanceOverride];
      objc_msgSend(v131, "stringWithFormat:", @"properties.focusDistanceOverride: %f", v132);
    }
    goto LABEL_193;
  }
  uint64_t v105 = [v363 fixedPointDisparityPixelBuffer];
  v42((uint64_t)v38, (CVPixelBufferRef)v105, pixelBufferOut);
  [(CVAPortraitVideoPipeline_Impl *)self internal_fixFocusPositionWithDisparityPostprocessingRequest:v363];
  ((void (*)(uint64_t *__return_ptr, DisparityAutofocus *, CVPixelBufferRef, BOOL, void **, float))v43)(v386, v354, pixelBufferOut, self->_vmPostprocessingParams.useFaceAsFocus, &v410, self->_vmPostprocessingParams.faceSizeRatioInFocus);
  if (__p)
  {
    v390 = __p;
    operator delete(__p);
  }
  double v106 = v387;
  if (!v387) {
    goto LABEL_194;
  }
  v388 = v387;
LABEL_98:
  operator delete(v106);
LABEL_194:
  ((void (*)(uint64_t *__return_ptr, DisparityAutofocus *, CVPixelBufferRef, void))v348)(v376, v354, pixelBufferOut, 0);
  if (v379)
  {
    v380 = v379;
    operator delete(v379);
  }
  if (v377)
  {
    v378 = v377;
    operator delete(v377);
  }
  if ([(CVAVideoPipelinePropertiesSPI *)self->_properties sceneMonitorUsesDisparityStatistics])
  {
    v241 = v344((uint64_t)v345, pixelBufferOut, (uint64_t)self->_disparityAutofocus.__ptr_.__value_ + 16, *(float *)self->_disparityAutofocus.__ptr_.__value_, *((float *)self->_disparityAutofocus.__ptr_.__value_ + 2), self->_vmPostprocessingParams.disparityIntervalInHoleSearch);
    v242 = *(_OWORD *)v241;
    v397 = *(double *)(v241 + 16);
    v396 = v242;
    v398 = *(double *)(v241 + 24);
    v243 = *(_DWORD *)(v241 + 40);
    v399 = *(void *)(v241 + 32);
    v400 = v243;
    if (&v396 != (long long *)v241)
    {
      sub_1BA825694(v401, *(char **)(v241 + 48), *(char **)(v241 + 56), (uint64_t)(*(void *)(v241 + 56) - *(void *)(v241 + 48)) >> 2);
      sub_1BA825694(&v402[1], *(char **)(v241 + 72), *(char **)(v241 + 80), (uint64_t)(*(void *)(v241 + 80) - *(void *)(v241 + 72)) >> 2);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76648, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76648))
    {
      v326 = +[CVAPreferenceManager defaults];
      v327 = [v326 BOOLForKey:@"CVAPhotoDebugDrawDisparityStatistics"];

      byte_1E9F76920 = v327;
      __cxa_guard_release(&qword_1E9F76648);
    }
    if (byte_1E9F76920)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"bgShiftSum: %f", *(float *)&v396);

      objc_msgSend(NSString, "stringWithFormat:", @"bgShiftSumVariance: %f", *((float *)&v396 + 1));
      objc_msgSend(NSString, "stringWithFormat:", @"bgShiftArea: %f", *((float *)&v396 + 2));

      objc_msgSend(NSString, "stringWithFormat:", @"invalidPixelCount: %d", HIDWORD(v396));
      objc_msgSend(NSString, "stringWithFormat:", @"invalidShiftRatio: %f", *(float *)&v397);

      objc_msgSend(NSString, "stringWithFormat:", @"invalidShiftRatioVariance: %f", *((float *)&v397 + 1));
      objc_msgSend(NSString, "stringWithFormat:", @"depthQuality: (%f %f)", *(float *)&v398, *((float *)&v398 + 1));

      objc_msgSend(NSString, "stringWithFormat:", @"backgroundSeparationLikelihood: %f", *(float *)&v399);
      objc_msgSend(NSString, "stringWithFormat:", @"closeCanonicalDisparityAverage: %f", *((float *)&v399 + 1));
    }
  }
  v244 = self->_disparityAutofocus.__ptr_.__value_;
  self->_vmDynamicParams.float focusCanonicalDisparity = *(float *)v244;
  self->_vmDynamicParams.backgroundCanonicalDisparitdouble y = *((float *)v244 + 2);
  self->_vmDynamicParams.doDisparityHoleFilling = !self->_treatFixedPointDisparityAsDense;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76660, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76660))
  {
    qword_1E9F766D0 = [NSNumber numberWithBool:0];
    __cxa_guard_release(&qword_1E9F76660);
  }
  if ((byte_1E9F766B8 & 1) == 0)
  {
    *(void *)v414 = operator new(0x28uLL);
    *(_OWORD *)&v414[8] = xmmword_1BA86C120;
    strcpy(*(char **)v414, "useMinLinearFgBgSeparationForAlphaMatte");
    sub_1BA81CE64((uint64_t)&qword_1E9F766D0, (uint64_t)v414);
    if ((v414[23] & 0x80000000) != 0) {
      operator delete(*(void **)v414);
    }
    byte_1E9F766B8 = 1;
  }
  v245 = [(id)qword_1E9F766D0 BOOLValue];
  v246 = self->_disparityAutofocus.__ptr_.__value_;
  if (v245) {
    v247 = fmaxf(*((float *)v246 + 3), *((float *)v246 + 1));
  }
  else {
    v247 = *((float *)v246 + 1);
  }
  self->_vmDynamicParams.alphaMatteDeltaCanonicalDisparitdouble y = v247;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76650, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76650))
  {
    qword_1E9F766C8 = [NSNumber numberWithBool:0];
    __cxa_guard_release(&qword_1E9F76650);
  }
  if ((byte_1E9F766C0 & 1) == 0)
  {
    *(void *)v414 = operator new(0x28uLL);
    *(_OWORD *)&v414[8] = xmmword_1BA86C130;
    strcpy(*(char **)v414, "useMinLinearFgBgSeparationForSDOF");
    sub_1BA81CE64((uint64_t)&qword_1E9F766C8, (uint64_t)v414);
    if ((v414[23] & 0x80000000) != 0) {
      operator delete(*(void **)v414);
    }
    byte_1E9F766C0 = 1;
  }
  v248 = [(id)qword_1E9F766C8 BOOLValue];
  v249 = self->_disparityAutofocus.__ptr_.__value_;
  v250 = *((float *)v249 + 1);
  if (v248) {
    v251 = fmaxf(*((float *)v249 + 3), v250);
  }
  else {
    v251 = *((float *)v249 + 1);
  }
  self->_vmDynamicParams.float sdofDeltaCanonicalDisparity = v251;
  v252 = self->_stageLightStateMachine.__ptr_.__value_;
  v253 = [v363 isFocalPlaneLocked];
  v254 = *(_DWORD *)self->_focusStateMachine.__ptr_.__value_;
  [v363 sourceColorPixelBufferOrientation];
  v372 = v255;
  v373 = v256;
  v374 = v257;
  v375 = v258;
  v259 = *(float *)&v399;
  *(void *)v414 = sub_1BA81708C((double *)&v372);
  *(void *)&v414[8] = v260;
  *(void *)&v414[16] = v261;
  v415 = v262;
  v263 = sub_1BA817178((double *)v252 + 3, (double *)v414);
  if (((v254 != 0) & ~v253) != 0
    || v263 >= *((double *)v252 + 1)
    || (v264 = (float *)v252, *((float *)v252 + 4) >= v259))
  {
    v264 = (float *)((char *)v252 + 4);
  }
  *((float *)v252 + 5) = fmaxf(fminf(*v264 + *((float *)v252 + 5), 1.0), 0.0);
  *((double *)v252 + 3) = sub_1BA81708C((double *)&v372);
  *((void *)v252 + 4) = v265;
  *((void *)v252 + 5) = v266;
  *((void *)v252 + 6) = v267;
  v268 = self->_sdofIntensityStateMachine.__ptr_.__value_;
  v269 = [v363 isFocalPlaneLocked];
  v270 = *(_DWORD *)self->_focusStateMachine.__ptr_.__value_;
  [v363 sourceColorPixelBufferOrientation];
  v372 = v271;
  v373 = v272;
  v374 = v273;
  v375 = v274;
  *(void *)v414 = sub_1BA81708C((double *)&v372);
  *(void *)&v414[8] = v275;
  *(void *)&v414[16] = v276;
  v415 = v277;
  v278 = sub_1BA817178((double *)v268 + 3, (double *)v414);
  if (((v270 != 0) & ~v269) != 0 || (v279 = (float *)v268, v278 >= *((double *)v268 + 1))) {
    v279 = (float *)((char *)v268 + 4);
  }
  *((float *)v268 + 4) = fmaxf(fminf(*v279 + *((float *)v268 + 4), 1.0), 0.0);
  *((double *)v268 + 3) = sub_1BA81708C((double *)&v372);
  *((void *)v268 + 4) = v280;
  *((void *)v268 + 5) = v281;
  *((void *)v268 + 6) = v282;
  v283 = [MEMORY[0x1E4F1CA48] array];
  v284 = v283;
  v285 = [MEMORY[0x1E4F1CA48] array];
  v287 = v401[0];
  for (m = v401[1]; v287 != m; ++v287)
  {
    LODWORD(v286) = *v287;
    v289 = [NSNumber numberWithFloat:v286];
    [v283 addObject:v289];
  }
  v290 = v402[1];
  for (n = (_DWORD *)v403; v290 != n; ++v290)
  {
    LODWORD(v286) = *v290;
    v292 = [NSNumber numberWithFloat:v286];
    [v285 addObject:v292];
  }
  if ([v283 count]) {
    v293 = v283;
  }
  else {
    v293 = 0;
  }
  float v51 = v293;

  if ([v285 count]) {
    v294 = v285;
  }
  else {
    v294 = 0;
  }
  float v50 = v294;

  v358 = v250;
LABEL_238:
  v295 = [CVADisparityPostprocessingResult_Impl alloc];
  v296 = [v363 destinationDisparityPixelBuffer];
  v297 = pixelBufferOut;
  float focusCanonicalDisparity = self->_vmDynamicParams.focusCanonicalDisparity;
  v299 = v400;
  v300 = *(void *)((char *)&v396 + 4);
  v301 = v397;
  v302 = v399;
  v303 = [MEMORY[0x1E4F1C978] arrayWithArray:v51];
  v304 = [MEMORY[0x1E4F1C978] arrayWithArray:v50];
  HIDWORD(v332) = LODWORD(self->_previousFramePersonSegmentationRatio);
  LODWORD(v332) = 0;
  *(float *)&v305 = focusCanonicalDisparity;
  LODWORD(v306) = v299;
  LODWORD(v308) = HIDWORD(v300);
  LODWORD(v307) = v300;
  LODWORD(v310) = HIDWORD(v301);
  LODWORD(v309) = LODWORD(v301);
  *(float *)&v311 = v358;
  LODWORD(v312) = v302;
  v313 = -[CVADisparityPostprocessingResult_Impl initWithPostprocessedDisparityBuffer:canonicalDisparityPixelBuffer:focusCanonicalDisparity:backgroundDisparitySum:backgroundDisparitySumVariance:backgroundDisparityRatio:invalidDisparityRatio:invalidDisparityRatioVariance:deltaCanonicalDisparity:backgroundSeparationLikelihood:closeCanonicalDisparityAverage:faceCanonicalDisparityAverage:faceInvalidDisparityRatio:foregroundRatio:erodedForegroundRatio:personSegmentationRatio:](v295, "initWithPostprocessedDisparityBuffer:canonicalDisparityPixelBuffer:focusCanonicalDisparity:backgroundDisparitySum:backgroundDisparitySumVariance:backgroundDisparityRatio:invalidDisparityRatio:invalidDisparityRatioVariance:deltaCanonicalDisparity:backgroundSeparationLikelihood:closeCanonicalDisparityAverage:faceCanonicalDisparityAverage:faceInvalidDisparityRatio:foregroundRatio:erodedForegroundRatio:personSegmentationRatio:", v296, v297, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, HIDWORD(v302), v332);

  if (self->_preferences.bypassGPUProcessing)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1BA8257D8;
    block[3] = &unk_1E6228438;
    v371 = v357;
    v369 = v363;
    v370 = v313;
    dispatch_async(notificationQueue, block);
  }
  else
  {
    v355 = v50;
    *(_OWORD *)v414 = *(_OWORD *)&self->_vmPostprocessingParams.useFaceAsFocus;
    *(void *)&v414[16] = *(void *)&self->_vmPostprocessingParams.backgroundFillMarginFromValidDisparity_px;
    if (self->_transitionData._inTransition) {
      v414[20] = 0;
    }
    v362 = v51;
    if (sub_1BA821F74()) {
      NSLog(&cfstr_CvaphotoTransi.isa, v414[20]);
    }
    vmAccelerator = self->_vmAccelerator;
    v315 = pixelBufferOut;
    v316 = [v363 sourceColorPixelBuffer];
    v317 = [v363 destinationDisparityPixelBuffer];
    v318 = [v363 facesArray];
    v319 = self->_notificationQueue;
    v364[0] = MEMORY[0x1E4F143A8];
    v364[1] = 3221225472;
    v364[2] = sub_1BA8257F8;
    v364[3] = &unk_1E6228438;
    v367 = v357;
    v365 = v363;
    v366 = v313;
    LOBYTE(v333) = a5;
    v320 = [(VideoMattingMetal *)vmAccelerator disparityPostprocessingWithCanonicalDisparity:v315 color:v316 postProcessedDisparity:v317 staticParams:&self->_vmStaticParams dynamicParams:&self->_vmDynamicParams postProcessingParams:v414 facesArray:v318 faceModel:0 isFinalStage:v333 callbackQueue:v319 callback:v364];
    yuvSourceDownsampledAlias = self->_yuvSourceDownsampledAlias;
    self->_yuvSourceDownsampledAlias = v320;

    float v51 = v362;
    float v50 = v355;
  }
  if (a6) {
    *a6 = 0;
  }
  [v363 fixedPointDisparityPixelBuffer];
  [v363 networkDisparityPixelBuffer];
  [v363 sourceColorPixelBuffer];
  CVPixelBufferRelease(pixelBufferOut);
  v322 = v313;

  if (v402[1])
  {
    *(void **)&v403 = v402[1];
    operator delete(v402[1]);
  }
  if (v401[0])
  {
    v401[1] = v401[0];
    operator delete(v401[0]);
  }
  if (v410)
  {
    v411 = (float *)v410;
    operator delete(v410);
  }

  return v322;
}

- (BOOL)validatePortraitRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 mattingRequest];
  id v8 = NSString;
  float v9 = [NSString stringWithFormat:@"CVAPortraitRequest.mattingRequest is nil"];
  id v10 = [v8 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1439, v9];
  sub_1BA8161F4(v7 == 0, a4, 0, 4294944393, v10);

  if (!v7) {
    goto LABEL_35;
  }
  uint64_t v11 = [v6 mattingRequest];
  BOOL v12 = [(CVAPortraitVideoPipeline_Impl *)self validateMattingRequest:v11 error:a4];

  if (!v12) {
    goto LABEL_35;
  }
  uint64_t v13 = [v6 destinationColorPixelBuffer];
  id v14 = NSString;
  float v15 = [NSString stringWithFormat:@"CVAPortraitRequest.destinationColorPixelBuffer is nil"];
  double v16 = [v14 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1453, v15];
  sub_1BA8161F4(v13 == 0, a4, 0, 4294944393, v16);

  if (!v13) {
    goto LABEL_35;
  }
  uint64_t v17 = [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferWidth];
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v6 destinationColorPixelBuffer]);
  float v19 = NSString;
  int v20 = [NSString stringWithFormat:@"Unexpected width of destinationColor"];
  float v21 = [v19 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1464, v20];
  sub_1BA8161F4(v17 != Width, a4, 0, 4294944393, v21);

  if (v17 != Width) {
    goto LABEL_35;
  }
  uint64_t v22 = [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferHeight];
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v6 destinationColorPixelBuffer]);
  float v24 = NSString;
  int v25 = [NSString stringWithFormat:@"Unexpected height of destinationColor"];
  float v26 = [v24 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1473, v25];
  sub_1BA8161F4(v22 != Height, a4, 0, 4294944393, v26);

  if (v22 != Height) {
    goto LABEL_35;
  }
  float v27 = [(CVAVideoPipelinePropertiesSPI *)self->_properties supportedColorPixelBufferPixelFormats];
  float v28 = objc_msgSend(NSNumber, "numberWithInt:", CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v6, "destinationColorPixelBuffer")));
  uint64_t v29 = [v27 containsObject:v28];
  uint64_t v30 = NSString;
  unint64_t v31 = [NSString stringWithFormat:@"Unexpected pixel format for destinationColor"];
  uint64_t v32 = [v30 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1483, v31];
  sub_1BA8161F4(v29 ^ 1, a4, 0, 4294944393, v32);

  if ((v29 & 1) == 0) {
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v6;
    [v33 simulatedFocalRatio];
    float v35 = v34;
    float v36 = NSString;
    int v37 = [NSString stringWithFormat:@"simulatedFocalRatio outside allowable range"];
    float v38 = [v36 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1496, v37];
    sub_1BA8161F4(v35 < 1.0, a4, 0, 4294944393, v38);

    if (v35 >= 1.0)
    {
      [v33 sourceColorGain];
      float v40 = v39;
      int v41 = NSString;
      float v42 = [NSString stringWithFormat:@"srcColorGain outside allowable range [0, inf"]);
      float v43 = [v41 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1504, v42];
      sub_1BA8161F4(v40 < 0.0, a4, 0, 4294944393, v43);

      if (v40 >= 0.0)
      {
        [v33 sourceColorLux];
        float v45 = v44;
        float v46 = NSString;
        float v47 = [NSString stringWithFormat:@"srcColorLux outside allowable range [0, inf"]);
        double v48 = [v46 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1512, v47];
        sub_1BA8161F4(v45 < 0.0, a4, 0, 4294944393, v48);

        if (v45 >= 0.0)
        {
          uint64_t v49 = [v33 backgroundColorCube];
          if (v49)
          {
            double v67 = [v33 backgroundColorCube];
            BOOL v50 = sub_1BA8261A4(v67);
          }
          else
          {
            BOOL v50 = 1;
          }
          float v63 = NSString;
          char v64 = [NSString stringWithFormat:@"Invalid background color cube data"];
          uint64_t v29 = [v63 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1520, v64];
          sub_1BA8161F4(!v50, a4, 0, 4294944393, (void *)v29);

          if (v49) {
          if (v50)
          }
          {
            CGFloat v57 = [v33 foregroundColorCube];
            if (v57)
            {
              uint64_t v29 = [v33 foregroundColorCube];
              BOOL v58 = sub_1BA8261A4((void *)v29);
            }
            else
            {
              BOOL v58 = 1;
            }
            double v66 = NSString;
            CGFloat v60 = [NSString stringWithFormat:@"Invalid foreground color cube data"];
            float v61 = [v66 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1528, v60];
            sub_1BA8161F4(!v58, a4, 0, 4294944393, v61);
LABEL_24:

            if (v57) {
            if (v58)
            }
              goto LABEL_27;
LABEL_35:
            BOOL v62 = 0;
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v51 = v6;
    double v68 = v51;
    int v52 = [v51 proxyCubeData];
    if (v52)
    {
      uint64_t v29 = [v51 proxyCubeData];
      BOOL v53 = sub_1BA8261A4((void *)v29);
    }
    else
    {
      BOOL v53 = 1;
    }
    float v54 = NSString;
    float v55 = [NSString stringWithFormat:@"Invalid background color cube data"];
    float v56 = [v54 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1540, v55];
    sub_1BA8161F4(!v53, a4, 0, 4294944393, v56);

    if (v52) {
    id v33 = v68;
    }
    if (v53)
    {
      CGFloat v57 = [v68 proxyCubeData];
      if (v57)
      {
        uint64_t v29 = [v68 cubeData];
        BOOL v58 = sub_1BA8261A4((void *)v29);
      }
      else
      {
        BOOL v58 = 1;
      }
      CGFloat v59 = NSString;
      CGFloat v60 = [NSString stringWithFormat:@"Invalid background color cube data"];
      float v61 = [v59 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1548, v60];
      sub_1BA8161F4(!v58, a4, 0, 4294944393, v61);
      goto LABEL_24;
    }
LABEL_34:

    goto LABEL_35;
  }
LABEL_27:
  BOOL v62 = 1;
LABEL_36:

  return v62;
}

- (BOOL)validateMattingRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 disparityPostprocessingRequest];
  id v8 = NSString;
  float v9 = [NSString stringWithFormat:@"CVAMattingRequest.disparityPostprocessingRequest is nil"];
  id v10 = [v8 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1351, v9];
  sub_1BA8161F4(v7 == 0, a4, 0, 4294944393, v10);

  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v11 = [v6 disparityPostprocessingRequest];
  BOOL v12 = [(CVAPortraitVideoPipeline_Impl *)self validateDisparityPostprocessingRequest:v11 error:a4];

  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v13 = [v6 segmentationPixelBuffer];
  id v14 = [(CVAVideoPipelinePropertiesSPI *)self->_properties supportedInputSegmentationPixelBufferPixelFormats];
  LOBYTE(v13) = [(CVAPortraitVideoPipeline_Impl *)self validateSegmentationPixelBuffer:v13 matchFormat:v14 error:a4];

  if ((v13 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v15 = [v6 skinSegmentationPixelBuffer];
  double v16 = [(CVAVideoPipelinePropertiesSPI *)self->_properties supportedInputSegmentationPixelBufferPixelFormats];
  LOBYTE(v15) = [(CVAPortraitVideoPipeline_Impl *)self validateSegmentationPixelBuffer:v15 matchFormat:v16 error:a4];

  if ((v15 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v17 = [v6 destinationAlphaMattePixelBuffer];
  float v18 = NSString;
  float v19 = [NSString stringWithFormat:@"CVAMattingRequest.destinationAlphaMattePixelBuffer is nil"];
  int v20 = [v18 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1380, v19];
  sub_1BA8161F4(v17 == 0, a4, 0, 4294944393, v20);

  if (!v17) {
    goto LABEL_8;
  }
  uint64_t v21 = [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaMattePixelBufferWidth];
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v6 destinationAlphaMattePixelBuffer]);
  float v23 = NSString;
  float v24 = [NSString stringWithFormat:@"Unexpected width of destinationAlpha"];
  int v25 = [v23 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1390, v24];
  sub_1BA8161F4(v21 != Width, a4, 0, 4294944393, v25);

  if (v21 != Width) {
    goto LABEL_8;
  }
  uint64_t v26 = [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaMattePixelBufferHeight];
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v6 destinationAlphaMattePixelBuffer]);
  float v28 = NSString;
  uint64_t v29 = [NSString stringWithFormat:@"Unexpected height of destinationAlpha"];
  uint64_t v30 = [v28 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1398, v29];
  sub_1BA8161F4(v26 != Height, a4, 0, 4294944393, v30);

  if (v26 == Height)
  {
    int v33 = [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaMattePixelBufferPixelFormat];
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v6 destinationAlphaMattePixelBuffer]);
    float v35 = NSString;
    float v36 = [NSString stringWithFormat:@"Unexpected pixel format for destinationAlpha"];
    int v37 = [v35 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1407, v36];
    sub_1BA8161F4(v33 != PixelFormatType, a4, 0, 4294944393, v37);
    BOOL v31 = v33 == PixelFormatType;
  }
  else
  {
LABEL_8:
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)validateDisparityPostprocessingRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 sourceColorPixelBuffer];
  id v8 = NSString;
  float v9 = [NSString stringWithFormat:@"CVADisparityPostprocessingRequest.sourceColorPixelBuffer is nil"];
  id v10 = [v8 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1174, v9];
  sub_1BA8161F4(v7 == 0, a4, 0, 4294944393, v10);

  if (!v7) {
    goto LABEL_24;
  }
  if (sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) == 2)
  {
    uint64_t v11 = [v6 segmentationPixelBuffer];
    BOOL v12 = NSString;
    uint64_t v13 = [NSString stringWithFormat:@"CVADisparityPostprocessingRequest.segmentationPixelBuffer is nil"];
    id v14 = [v12 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1185, v13];
    sub_1BA8161F4(v11 == 0, a4, 0, 4294944393, v14);

    if (!v11) {
      goto LABEL_24;
    }
    uint64_t v15 = [v6 focusTileData];
    double v16 = NSString;
    uint64_t v17 = [NSString stringWithFormat:@"CVADisparityPostprocessingRequest.focusTileData is nil"];
    float v18 = [v16 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1194, v17];
    sub_1BA8161F4(v15 == 0, a4, 0, 4294944393, v18);

    if (!v15) {
      goto LABEL_24;
    }
  }
  else
  {
    if (sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) == 3)
    {
      uint64_t v19 = [v6 networkDisparityPixelBuffer];
      int v20 = NSString;
      uint64_t v21 = [NSString stringWithFormat:@"CVADisparityPostprocessingRequest.networkDisparityPixelBuffer is nil"];
      uint64_t v22 = [v20 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1206, v21];
      sub_1BA8161F4(v19 == 0, a4, 0, 4294944393, v22);

      if (!v19) {
        goto LABEL_24;
      }
      uint64_t v23 = [v6 segmentationPixelBuffer];
      float v24 = NSString;
      int v25 = [NSString stringWithFormat:@"CVADisparityPostprocessingRequest.segmentationPixelBuffer is nil"];
      uint64_t v26 = [v24 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1215, v25];
      sub_1BA8161F4(v23 == 0, a4, 0, 4294944393, v26);
    }
    else
    {
      uint64_t v23 = [v6 fixedPointDisparityPixelBuffer];
      float v27 = NSString;
      int v25 = [NSString stringWithFormat:@"CVADisparityPostprocessingRequest.fixedPointDisparityPixelBuffer is nil"];
      uint64_t v26 = [v27 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1227, v25];
      sub_1BA8161F4(v23 == 0, a4, 0, 4294944393, v26);
    }

    if (!v23) {
      goto LABEL_24;
    }
  }
  uint64_t v28 = [v6 destinationDisparityPixelBuffer];
  uint64_t v29 = NSString;
  uint64_t v30 = [NSString stringWithFormat:@"CVADisparityPostprocessingRequest.destinationDisparityPixelBuffer is nil"];
  BOOL v31 = [v29 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1237, v30];
  sub_1BA8161F4(v28 == 0, a4, 0, 4294944393, v31);

  if (v28)
  {
    uint64_t v32 = [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferWidth];
    size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v6 sourceColorPixelBuffer]);
    float v34 = NSString;
    float v35 = [NSString stringWithFormat:@"Unexpected width of srcColor"];
    float v36 = [v34 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1248, v35];
    sub_1BA8161F4(v32 != Width, a4, 0, 4294944393, v36);

    if (v32 == Width)
    {
      uint64_t v37 = [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferHeight];
      size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v6 sourceColorPixelBuffer]);
      float v39 = NSString;
      float v40 = [NSString stringWithFormat:@"Unexpected height of srcColor"];
      int v41 = [v39 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1257, v40];
      sub_1BA8161F4(v37 != Height, a4, 0, 4294944393, v41);

      if (v37 == Height)
      {
        uint64_t v42 = [v6 segmentationPixelBuffer];
        float v43 = [(CVAVideoPipelinePropertiesSPI *)self->_properties supportedInputSegmentationPixelBufferPixelFormats];
        LOBYTE(v42) = [(CVAPortraitVideoPipeline_Impl *)self validateSegmentationPixelBuffer:v42 matchFormat:v43 error:a4];

        if (v42)
        {
          if (sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]) != 1&& sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]))
          {
            goto LABEL_29;
          }
          uint64_t v44 = [(CVAVideoPipelinePropertiesSPI *)self->_properties inputDisparityPixelBufferWidth];
          size_t v45 = CVPixelBufferGetWidth((CVPixelBufferRef)[v6 fixedPointDisparityPixelBuffer]);
          float v46 = NSString;
          float v47 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected width of fixedPointDisparity: %zu != %zu", -[CVAVideoPipelinePropertiesSPI inputDisparityPixelBufferWidth](self->_properties, "inputDisparityPixelBufferWidth"), CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "fixedPointDisparityPixelBuffer")));
          double v48 = [v46 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1275, v47];
          sub_1BA8161F4(v44 != v45, a4, 0, 4294944393, v48);

          if (v44 == v45)
          {
            uint64_t v49 = [(CVAVideoPipelinePropertiesSPI *)self->_properties inputDisparityPixelBufferHeight];
            size_t v50 = CVPixelBufferGetHeight((CVPixelBufferRef)[v6 fixedPointDisparityPixelBuffer]);
            id v51 = NSString;
            int v52 = [NSString stringWithFormat:@"Unexpected height of fixedPointDisparity"];
            BOOL v53 = [v51 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1283, v52];
            sub_1BA8161F4(v49 != v50, a4, 0, 4294944393, v53);

            if (v49 == v50)
            {
              int v54 = [(CVAVideoPipelinePropertiesSPI *)self->_properties inputDisparityPixelBufferPixelFormat];
              OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v6 fixedPointDisparityPixelBuffer]);
              float v56 = NSString;
              CGFloat v57 = [NSString stringWithFormat:@"Unexpected pixel format for fixedPointDisparity"];
              BOOL v58 = [v56 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1291, v57];
              sub_1BA8161F4(v54 != PixelFormatType, a4, 0, 4294944393, v58);

              if (v54 == PixelFormatType)
              {
LABEL_29:
                uint64_t v59 = [(CVAVideoPipelinePropertiesSPI *)self->_properties outputDisparityPixelBufferWidth];
                size_t v60 = CVPixelBufferGetWidth((CVPixelBufferRef)[v6 destinationDisparityPixelBuffer]);
                float v61 = NSString;
                BOOL v62 = [NSString stringWithFormat:@"Unexpected width of destinationDisparity"];
                float v63 = [v61 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1300, v62];
                sub_1BA8161F4(v59 != v60, a4, 0, 4294944393, v63);

                if (v59 == v60)
                {
                  uint64_t v64 = [(CVAVideoPipelinePropertiesSPI *)self->_properties outputDisparityPixelBufferHeight];
                  size_t v65 = CVPixelBufferGetHeight((CVPixelBufferRef)[v6 destinationDisparityPixelBuffer]);
                  double v66 = NSString;
                  double v67 = [NSString stringWithFormat:@"Unexpected height of destinationDisparity"];
                  double v68 = [v66 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1308, v67];
                  sub_1BA8161F4(v64 != v65, a4, 0, 4294944393, v68);

                  if (v64 == v65)
                  {
                    BOOL v88 = [(CVAVideoPipelinePropertiesSPI *)self->_properties supportedColorPixelBufferPixelFormats];
                    uint64_t v69 = objc_msgSend(NSNumber, "numberWithInt:", CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v6, "sourceColorPixelBuffer")));
                    int v70 = [v88 containsObject:v69];
                    id v71 = NSString;
                    BOOL v72 = [NSString stringWithFormat:@"Unexpected pixel format for srcColor"];
                    float v73 = [v71 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1316, v72];
                    sub_1BA8161F4(v70 ^ 1u, a4, 0, 4294944393, v73);

                    if (v70)
                    {
                      int v74 = [(CVAVideoPipelinePropertiesSPI *)self->_properties outputDisparityPixelBufferPixelFormat];
                      OSType v75 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v6 destinationDisparityPixelBuffer]);
                      float v76 = NSString;
                      id v77 = [NSString stringWithFormat:@"Unexpected pixel format for destinationDisparity"];
                      float v78 = [v76 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1324, v77];
                      sub_1BA8161F4(v74 != v75, a4, 0, 4294944393, v78);

                      if (v74 == v75)
                      {
                        [v6 sourceColorPixelBufferGravity];
                        [v6 sourceColorPixelBufferGravity];
                        BOOL v84 = sqrt(v81 * v81 + v82 * v82 + v83 * v83) <= 0.00000011920929;
                        long long v85 = NSString;
                        id v86 = [NSString stringWithFormat:@"Gravity vector should be NAN or have nonzero length"];
                        id v87 = [v85 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1333, v86];
                        sub_1BA8161F4(v84, a4, 0, 4294944393, v87);

                        BOOL v79 = !v84;
                        goto LABEL_25;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_24:
  BOOL v79 = 0;
LABEL_25:

  return v79;
}

- (BOOL)validateSegmentationPixelBuffer:(__CVBuffer *)a3 matchFormat:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (a3)
  {
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    float v9 = [NSNumber numberWithInt:PixelFormatType];
    int v10 = [v7 containsObject:v9];
    uint64_t v11 = NSString;
    BOOL v12 = [v7 componentsJoinedByString:@","];
    uint64_t v13 = [NSNumber numberWithInt:PixelFormatType];
    id v14 = [v11 stringWithFormat:@"Unexpected pixel format for inputSegmentation. Supported formats: %@ was %@", v12, v13];
    uint64_t v15 = [v11 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl validateSegmentationPixelBuffer:matchFormat:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1155, v14];
    sub_1BA8161F4(v10 ^ 1u, a5, 0, 4294944393, v15);
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (CVAVideoPipelineProperties)videoPipelineProperties
{
  v2 = (void *)[(CVAVideoPipelinePropertiesSPI *)self->_properties copy];

  return (CVAVideoPipelineProperties *)v2;
}

- (void)setVideoPipelineProperties:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 conformsToProtocol:&unk_1F14467C0]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = [v5 colorPixelBufferWidth];
  if (v7 != [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferWidth])
  {
    id v77 = [MEMORY[0x1E4F28B00] currentHandler];
    [v77 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1010 description:@"Dynamic resolution change is unsupported"];
  }
  uint64_t v8 = [v5 colorPixelBufferHeight];
  if (v8 != [(CVAVideoPipelinePropertiesSPI *)self->_properties colorPixelBufferHeight])
  {
    float v78 = [MEMORY[0x1E4F28B00] currentHandler];
    [v78 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1012 description:@"Dynamic resolution change is unsupported"];
  }
  uint64_t v9 = [v5 alphaMattePixelBufferWidth];
  if (v9 != [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaMattePixelBufferWidth])
  {
    BOOL v79 = [MEMORY[0x1E4F28B00] currentHandler];
    [v79 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1014 description:@"Dynamic resolution change is unsupported"];
  }
  uint64_t v10 = [v5 alphaMattePixelBufferHeight];
  if (v10 != [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaMattePixelBufferHeight])
  {
    v80 = [MEMORY[0x1E4F28B00] currentHandler];
    [v80 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1016 description:@"Dynamic resolution change is unsupported"];
  }
  uint64_t v11 = [v5 inputDisparityPixelBufferWidth];
  if (v11 != [(CVAVideoPipelinePropertiesSPI *)self->_properties inputDisparityPixelBufferWidth])
  {
    double v81 = [MEMORY[0x1E4F28B00] currentHandler];
    [v81 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1018 description:@"Dynamic resolution change is unsupported"];
  }
  uint64_t v12 = [v5 inputDisparityPixelBufferHeight];
  if (v12 != [(CVAVideoPipelinePropertiesSPI *)self->_properties inputDisparityPixelBufferHeight])
  {
    double v82 = [MEMORY[0x1E4F28B00] currentHandler];
    [v82 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1020 description:@"Dynamic resolution change is unsupported"];
  }
  uint64_t v13 = [v5 outputDisparityPixelBufferWidth];
  if (v13 != [(CVAVideoPipelinePropertiesSPI *)self->_properties outputDisparityPixelBufferWidth])
  {
    double v83 = [MEMORY[0x1E4F28B00] currentHandler];
    [v83 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1022 description:@"Dynamic resolution change is unsupported"];
  }
  uint64_t v14 = [v5 outputDisparityPixelBufferHeight];
  if (v14 == [(CVAVideoPipelinePropertiesSPI *)self->_properties outputDisparityPixelBufferHeight])
  {
    if (!v6)
    {
LABEL_48:
      uint64_t v52 = sub_1BA81EA6C([(CVAVideoPipelinePropertiesSPI *)self->_properties videoPipelineDevice]);
      [(CVAVideoPipelinePropertiesSPI *)self->_properties guidedFilterUnconfidentWeight];
      self->_vmStaticParams.guidedFilterUnconfidentWeight = v53;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties guidedFilterMinDistToDeweight];
      self->_vmStaticParams.guidedFilterMinDistToDeweight = v54;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties referenceDisparity];
      self->_vmStaticParams.referenceShift = v55;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaMaxLaplacian];
      self->_vmStaticParams.alphaMaxLaplacian = v56;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaContrastExponent];
      self->_vmStaticParams.alphaContrastExponent = v57;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityFilterColorStd];
      self->_vmStaticParams.shiftFilterColorStd = v58;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityFilterUpdateRate];
      self->_vmStaticParams.shiftFilterUpdateRate = v59;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties minimumConfidenceToKeepDisparity];
      self->_vmStaticParams.minimumConfidenceToKeepDisparitdouble y = v60;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties maximumSimilarityToKeepDisparity];
      self->_vmStaticParams.maximumSimilarityToKeepDisparitdouble y = v61;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties maxDisparityFillingInconsistency];
      self->_vmStaticParams.maxShiftFillingInconsistencdouble y = v62;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties maxDisparityFillingDistFromForeground];
      self->_vmStaticParams.maxShiftFillingDistFromFg = v63;
      self->_vmStaticParams.maxDistToPushShiftEdgesFwd = [(CVAVideoPipelinePropertiesSPI *)self->_properties maxDistToPushDisparityEdgesFwd];
      self->_vmStaticParams.maxDistToPushShiftEdgesRev = [(CVAVideoPipelinePropertiesSPI *)self->_properties maxDistToPushDisparityEdgesRev];
      self->_vmStaticParams.shiftPushingBgToFgShiftDifference = [(CVAVideoPipelinePropertiesSPI *)self->_properties disparityPushingBackgroundToForegroundDisparityDifference];
      [(CVAVideoPipelinePropertiesSPI *)self->_properties foregroundMaskDilationRadius];
      self->_vmStaticParams.foregroundMaskDilationRadius = v64;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties infConvolutionDownsampling];
      self->_vmStaticParams.infConvolutionDownsampling = v65;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties mattingUpdateRate];
      self->_vmDynamicMetaParams.float mattingCoeffUpdateRate = v66;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties mattingUpdateRateFast];
      self->_vmDynamicMetaParams.mattingCoeffUpdateRateFast = v67;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaCoeffFilterColorStd];
      self->_vmDynamicMetaParams.float mattingCoeffColorStd = v68;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaCoeffFilterColorStdFast];
      self->_vmDynamicMetaParams.mattingCoeffColorStdFast = v69;
      self->_vmDynamicParams.updateRate = self->_vmDynamicMetaParams.mattingCoeffUpdateRate;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties deltaCanonicalDisparity];
      self->_vmDynamicParams.float sdofDeltaCanonicalDisparity = v70;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties deltaCanonicalDisparity];
      self->_vmDynamicParams.alphaMatteDeltaCanonicalDisparitdouble y = v71;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties alphaGammaExponent];
      self->_vmDynamicParams.alphaGammaExponent = v72;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties focusThresholdHardness];
      self->_vmDynamicParams.thresholdHardness = v73;
      BOOL v74 = BYTE4(v52) & (v52 == 0);
      if (v52 == 3) {
        BOOL v74 = 1;
      }
      self->_vmPostprocessingParams.useFaceAsFocus = v74;
      [(CVAVideoPipelinePropertiesSPI *)self->_properties faceSizeRatioInFocus];
      self->_vmPostprocessingParams.faceSizeRatioInFocus = v75;
      self->_vmPostprocessingParams.fillLargeHolesWithBackground = v52 == 0;
      float v76 = 10.0;
      if (!v52) {
        float v76 = 0.0;
      }
      self->_vmPostprocessingParams.backgroundFillMarginFromValidDisparity_pdouble x = v76;
      self->_vmPostprocessingParams.useTemporalRejection = v52 == 1;
      goto LABEL_56;
    }
  }
  else
  {
    BOOL v84 = [MEMORY[0x1E4F28B00] currentHandler];
    [v84 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1024 description:@"Dynamic resolution change is unsupported"];

    if (!v6) {
      goto LABEL_48;
    }
  }
  [v6 backgroundDisparityUpdateRate];
  float v16 = v15;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties backgroundDisparityUpdateRate];
  if (v16 != v17)
  {
    long long v85 = [MEMORY[0x1E4F28B00] currentHandler];
    [v85 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1032 description:@"Dynamic change to backgroundDisparityUpdateRate is unsupported"];
  }
  int v18 = [v6 backgroundDisparityStatsWindowSize];
  if (v18 != [(CVAVideoPipelinePropertiesSPI *)self->_properties backgroundDisparityStatsWindowSize])
  {
    id v86 = [MEMORY[0x1E4F28B00] currentHandler];
    [v86 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1034 description:@"Dynamic change to backgroundDisparityStatsWindowSize is unsupported"];
  }
  [v6 minDeltaCanonicalDisparity];
  float v20 = v19;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties minDeltaCanonicalDisparity];
  if (v20 != v21)
  {
    id v87 = [MEMORY[0x1E4F28B00] currentHandler];
    [v87 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1036 description:@"Dynamic change to minDeltaCanonicalDisparity is unsupported"];
  }
  [v6 maxDeltaCanonicalDisparity];
  float v23 = v22;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties maxDeltaCanonicalDisparity];
  if (v23 != v24)
  {
    BOOL v88 = [MEMORY[0x1E4F28B00] currentHandler];
    [v88 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1038 description:@"Dynamic change to maxDeltaCanonicalDisparity is unsupported"];
  }
  [v6 dsCanonicalLowThld];
  float v26 = v25;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties dsCanonicalLowThld];
  if (v26 != v27)
  {
    float v89 = [MEMORY[0x1E4F28B00] currentHandler];
    [v89 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1040 description:@"Dynamic change to dsCanonicalLowThld is unsupported"];
  }
  [v6 dsCanonicalLowScale];
  float v29 = v28;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties dsCanonicalLowScale];
  if (v29 != v30)
  {
    float v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1042 description:@"Dynamic change to dsCanonicalLowScale is unsupported"];
  }
  [v6 dsCanonicalHighThld];
  float v32 = v31;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties dsCanonicalHighThld];
  if (v32 != v33)
  {
    uint64_t v91 = [MEMORY[0x1E4F28B00] currentHandler];
    [v91 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1044 description:@"Dynamic change to dsCanonicalHighThld is unsupported"];
  }
  [v6 dsCanonicalHighScale];
  float v35 = v34;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties dsCanonicalHighScale];
  if (v35 != v36)
  {
    uint64_t v92 = [MEMORY[0x1E4F28B00] currentHandler];
    [v92 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1046 description:@"Dynamic change to dsCanonicalHighScale is unsupported"];
  }
  int v37 = [v6 depthPixelBufferXPadding];
  if (v37 != [(CVAVideoPipelinePropertiesSPI *)self->_properties depthPixelBufferXPadding])
  {
    id v93 = [MEMORY[0x1E4F28B00] currentHandler];
    [v93 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1048 description:@"Dynamic change to depthPixelBufferXPadding is unsupported"];
  }
  int v38 = [v6 depthPixelBufferYPadding];
  if (v38 != [(CVAVideoPipelinePropertiesSPI *)self->_properties depthPixelBufferYPadding])
  {
    float v94 = [MEMORY[0x1E4F28B00] currentHandler];
    [v94 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1050 description:@"Dynamic change to depthPixelBufferYPadding is unsupported"];
  }
  [v6 foregroundPercentile];
  float v40 = v39;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties foregroundPercentile];
  if (v40 != v41)
  {
    int v95 = [MEMORY[0x1E4F28B00] currentHandler];
    [v95 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1052 description:@"Dynamic change to foregroundPercentile is unsupported"];
  }
  [v6 closeDisparityPercentile];
  float v43 = v42;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties closeDisparityPercentile];
  if (v43 != v44)
  {
    uint64_t v96 = [MEMORY[0x1E4F28B00] currentHandler];
    [v96 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1054 description:@"Dynamic change to closeDisparityPercentile is unsupported"];
  }
  [v6 deltaDepth];
  float v46 = v45;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties deltaDepth];
  if (v46 != v47)
  {
    uint64_t v97 = [MEMORY[0x1E4F28B00] currentHandler];
    [v97 handleFailureInMethod:a2 object:self file:@"CVAVideoPipeline.mm" lineNumber:1056 description:@"Dynamic change to deltaDepth is unsupported"];
  }
  id v98 = 0;
  char v48 = [v6 validateWithError:&v98];
  id v49 = v98;
  if (v48)
  {
    size_t v50 = (CVAVideoPipelinePropertiesSPI *)[v6 copy];
    properties = self->_properties;
    self->_properties = v50;

    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v100 = v49;
    _os_log_fault_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
  }

LABEL_56:
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_untransformedCanonicalDisparityPixelBuffer);
  CVPixelBufferPoolRelease(self->_canonicalDisparityPixelBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)CVAPortraitVideoPipeline_Impl;
  [(CVAPortraitVideoPipeline_Impl *)&v3 dealloc];
}

- (CVAPortraitVideoPipeline_Impl)initWithProperties:(id)a3 commandQueue:(id)a4 notificationQueue:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v40.receiver = self;
  v40.super_class = (Class)CVAPortraitVideoPipeline_Impl;
  uint64_t v14 = [(CVAPortraitVideoPipeline_Impl *)&v40 init];
  if (v14)
  {
    if (v13)
    {
      id v15 = v13;
      float v16 = *((void *)v14 + 2);
      *((void *)v14 + 2) = v15;
    }
    else
    {
      float v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v17 = dispatch_queue_create("CVAPortraitPipelineResultQueue", v16);
      int v18 = (void *)*((void *)v14 + 2);
      *((void *)v14 + 2) = v17;
    }
    if (![v14 makeMetalContextWithOptionalCommandQueue:v12 error:a6])
    {
      if (([v11 conformsToProtocol:&unk_1F14467C0] & 1) == 0)
      {
        int v38 = [MEMORY[0x1E4F28B00] currentHandler];
      }
      uint64_t v19 = [v11 copy];
      float v20 = (void *)*((void *)v14 + 3);
      *((void *)v14 + 3) = v19;

      if ([*((id *)v14 + 3) validateWithError:a6])
      {
        int v39 = sub_1BA81EA6C([*((id *)v14 + 3) videoPipelineDevice]);
        int v21 = sub_1BA84F794(@"guided_depth_restoration_enabled", @"com.apple.coremedia", 0);
        int v22 = sub_1BA84F794(@"CVAPhotoForceDensePipeline", @"com.apple.coremedia", 0);
        int v23 = sub_1BA84F794(@"portraitPreviewDisableForegroundBlur", @"com.apple.coremedia", 0);
        if ([*((id *)v14 + 3) supportsForegroundBlur])
        {
          if (sub_1BA84F794(@"enableFGBlur", @"com.apple.coremedia", 1)) {
            BOOL v24 = v23 == 0;
          }
          else {
            BOOL v24 = 0;
          }
          int v25 = v24;
        }
        else
        {
          int v25 = 0;
        }
        v14[34] = v25;
        if (v39 == 1 && v21)
        {
          char v27 = [*((id *)v14 + 3) canSkipDisparityHoleFillingAndTemporalRejection];
          if (v22) {
            char v28 = 1;
          }
          else {
            char v28 = v27;
          }
          if ((v28 & 1) == 0)
          {
            int v25 = v14[34];
LABEL_29:
            BOOL v29 = v25 != 0;
            goto LABEL_30;
          }
        }
        else if (!v22)
        {
          goto LABEL_29;
        }
        BOOL v29 = 1;
LABEL_30:
        v14[32] = v29;
        int v30 = sub_1BA84F794(@"CVAPhotoForceHighPrecisionForDenseDisparityConversion", @"com.apple.coremedia", 0);
        v14[33] = v30 == 0;
        if (!v14[32] || v30)
        {
          size_t v31 = [*((id *)v14 + 3) inputDisparityPixelBufferWidth];
          size_t v32 = [*((id *)v14 + 3) inputDisparityPixelBufferHeight];
          OSType v33 = 1278226534;
        }
        else
        {
          size_t v31 = [*((id *)v14 + 3) inputDisparityPixelBufferWidth];
          size_t v32 = [*((id *)v14 + 3) inputDisparityPixelBufferHeight];
          OSType v33 = 1751411059;
        }
        CVPixelBufferCreate(0, v31, v32, v33, 0, (CVPixelBufferRef *)v14 + 5);
        if (v14[32] && v14[33])
        {
          uint64_t v34 = [*((id *)v14 + 3) outputDisparityPixelBufferWidth];
          uint64_t v35 = [*((id *)v14 + 3) outputDisparityPixelBufferHeight];
          uint64_t v36 = 1751411059;
        }
        else
        {
          uint64_t v34 = [*((id *)v14 + 3) outputDisparityPixelBufferWidth];
          uint64_t v35 = [*((id *)v14 + 3) outputDisparityPixelBufferHeight];
          uint64_t v36 = 1278226534;
        }
        +[CVAPortraitVideoPipeline_Impl pixelBufferPoolCreateWithWidth:v34 height:v35 pixelFormat:v36 pool:v14 + 48];
        [*((id *)v14 + 3) inputDisparityPixelBufferWidth];
        [*((id *)v14 + 3) inputDisparityPixelBufferHeight];
        [*((id *)v14 + 3) outputDisparityPixelBufferWidth];
        [*((id *)v14 + 3) outputDisparityPixelBufferHeight];
        [*((id *)v14 + 3) depthPixelBufferXPadding];
        [*((id *)v14 + 3) depthPixelBufferYPadding];
        if (!v14[34])
        {
          [*((id *)v14 + 3) depthPixelBufferXReplication];
          if (!v14[34]) {
            [*((id *)v14 + 3) depthPixelBufferYReplication];
          }
        }
        [*((id *)v14 + 3) depthPixelBufferMaxRightOcclusionDisparityChange];
        [*((id *)v14 + 3) depthPixelBufferMaxLeftOcclusionDisparityChange];
        [v11 outputDisparityOffset];
        *((_DWORD *)v14 + 9) = v37;
        [*((id *)v14 + 3) disparityStereoFocalLengthPixels];
        [*((id *)v14 + 3) disparityStereoBaselineMeters];
        operator new();
      }
    }
  }
  else if (a6)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-22900 userInfo:0];
  }

  return 0;
}

- (CVAPortraitVideoPipeline_Impl)initWithProperties:(id)a3 error:(id *)a4
{
  return [(CVAPortraitVideoPipeline_Impl *)self initWithProperties:a3 commandQueue:0 notificationQueue:0 error:a4];
}

- (int)makeMetalContextWithOptionalCommandQueue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 device];
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v8 = MTLCreateSystemDefaultDevice();
    uint64_t v19 = NSString;
    float v20 = [NSString stringWithFormat:@"MTLCreateSystemDefaultDevice() is nil"];
    int v21 = [v19 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl makeMetalContextWithOptionalCommandQueue:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 650, v20];
    sub_1BA8161F4(v8 == 0, a4, 0, 4294944382, v21);

    if (!v8)
    {
      uint64_t v9 = 0;
      int v18 = -22914;
      goto LABEL_10;
    }
    uint64_t v9 = (void *)[v8 newCommandQueue];
    int v22 = NSString;
    int v23 = [NSString stringWithFormat:@"[(_Nonnull id<MTLDeviceSPI>) newCommandQueue] is nil"];
    BOOL v24 = [v22 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl makeMetalContextWithOptionalCommandQueue:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 659, v23];
    sub_1BA8161F4(v9 == 0, a4, 0, 4294944382, v24);

    if (!v9)
    {
      int v18 = -22914;
      goto LABEL_10;
    }
  }
  objc_storeStrong((id *)&self->_metalContext.device, v8);
  objc_storeStrong((id *)&self->_metalContext.commandQueue, v9);
  uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [v10 URLForResource:@"cvadepth-iOS" withExtension:@"metallib"];

  device = self->_metalContext.device;
  id v26 = 0;
  id v13 = (void *)[(MTLDeviceSPI *)device newLibraryWithURL:v11 error:&v26];
  id v14 = v26;
  id v15 = NSString;
  float v16 = [NSString stringWithFormat:@"Error creating metal library"];
  dispatch_queue_t v17 = [v15 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPortraitVideoPipeline_Impl makeMetalContextWithOptionalCommandQueue:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 675, v16];
  sub_1BA8161F4(v13 == 0, a4, v14, 4294944382, v17);

  if (v13)
  {
    objc_storeStrong((id *)&self->_metalContext.library, v13);
    int v18 = 0;
  }
  else
  {
    int v18 = -22914;
  }

LABEL_10:
  return v18;
}

+ (int)pixelBufferPoolCreateWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 pool:(__CVPixelBufferPool *)a6
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v17[0] = MEMORY[0x1E4F1CC08];
  uint64_t v9 = *MEMORY[0x1E4F24D70];
  v16[0] = *MEMORY[0x1E4F24D20];
  v16[1] = v9;
  uint64_t v10 = [NSNumber numberWithUnsignedInt:*(void *)&a5];
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E4F24E10];
  id v11 = [NSNumber numberWithUnsignedLong:a3];
  v17[2] = v11;
  v16[3] = *MEMORY[0x1E4F24D08];
  id v12 = [NSNumber numberWithUnsignedLong:a4];
  v17[3] = v12;
  CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  CVReturn v14 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v13, a6);
  if (v14)
  {
    NSLog(&cfstr_UnableToCreate.isa);
    *a6 = 0;
  }

  return v14;
}

+ (void)drawDisparity:(const __CVBuffer *)a3 onColor:(__CVBuffer *)a4 canonical:(BOOL)a5 rawShiftInvalidThreshold:(int)a6 focusMachineState:(int)a7 offsetX:(unint64_t)a8 offsetY:(unint64_t)a9
{
  BOOL v55 = a5;
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
  size_t v16 = CVPixelBufferGetHeightOfPlane(a4, 1uLL);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  size_t v18 = CVPixelBufferGetBytesPerRowOfPlane(a4, 1uLL);
  pixelBuffer = a3;
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  float v20 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 1uLL);
  if (BaseAddress)
  {
    if (BaseAddressOfPlane)
    {
      if (v20)
      {
        if (Width <= BytesPerRowOfPlane && Width <= v18)
        {
          unint64_t v22 = Height;
          if (Height < HeightOfPlane)
          {
            unint64_t v23 = Height >> 1;
            if (Height >> 1 < v16)
            {
              uint64_t v52 = v20;
              if (v55)
              {
                if ((int)Width < 89 || (int)Height < 24)
                {
                  syslog(1, "drawText(): text does not fit: (%d..%d,%d..%d) not a subrect of (0..%d, 0..%d)", 8, 88, 8, 23, Width, Height);
                  unint64_t v23 = Height >> 1;
                  unint64_t v22 = Height;
                }
                else
                {
                  uint64_t v24 = 0;
                  uint64_t v25 = 102;
                  uint64_t v26 = 115;
                  if (!a7) {
                    uint64_t v25 = 115;
                  }
                  uint64_t v27 = 97;
                  if (!a7)
                  {
                    uint64_t v27 = 108;
                    uint64_t v26 = 111;
                  }
                  uint64_t v28 = 116;
                  if (!a7) {
                    uint64_t v28 = 119;
                  }
                  uint64_t v29 = (uint64_t)&BaseAddress[2 * (int)BytesPerRow + 42];
                  do
                  {
                    uint64_t v30 = (int)v24 / 5;
                    size_t v31 = &byte_1BA86C290[9 * v25];
                    if (v31[3 * v30])
                    {
                      *(void *)(v29 - 136) = 0;
                      *(void *)(v29 - 128) = 0;
                      *(_DWORD *)(v29 - 120) = 0;
                    }
                    if (v31[3 * v30 + 1])
                    {
                      *(void *)(v29 - 108) = 0;
                      *(void *)(v29 - 116) = 0;
                      *(_DWORD *)(v29 - 100) = 0;
                    }
                    if (byte_1BA86C290[9 * v25 + 2 + 3 * v30])
                    {
                      *(void *)(v29 - 96) = 0;
                      *(void *)(v29 - 88) = 0;
                      *(_DWORD *)(v29 - 80) = 0;
                    }
                    size_t v32 = &byte_1BA86C290[9 * v27];
                    if (v32[3 * v30])
                    {
                      *(void *)(v29 - 56) = 0;
                      *(void *)(v29 - 48) = 0;
                      *(_DWORD *)(v29 - 40) = 0;
                    }
                    if (v32[3 * v30 + 1])
                    {
                      *(void *)(v29 - 28) = 0;
                      *(void *)(v29 - 36) = 0;
                      *(_DWORD *)(v29 - 20) = 0;
                    }
                    if (byte_1BA86C290[9 * v27 + 2 + 3 * v30])
                    {
                      *(void *)(v29 - 16) = 0;
                      *(void *)(v29 - 8) = 0;
                      *(_DWORD *)uint64_t v29 = 0;
                    }
                    OSType v33 = &byte_1BA86C290[9 * v26];
                    if (v33[3 * v30])
                    {
                      *(void *)(v29 + 24) = 0;
                      *(void *)(v29 + 32) = 0;
                      *(_DWORD *)(v29 + 40) = 0;
                    }
                    if (v33[3 * v30 + 1])
                    {
                      *(void *)(v29 + 48) = 0;
                      *(void *)(v29 + 56) = 0;
                      *(_DWORD *)(v29 + 44) = 0;
                    }
                    if (byte_1BA86C290[9 * v26 + 2 + 3 * v30])
                    {
                      *(void *)(v29 + 64) = 0;
                      *(void *)(v29 + 72) = 0;
                      *(_DWORD *)(v29 + 80) = 0;
                    }
                    uint64_t v34 = &byte_1BA86C290[9 * v28];
                    if (v34[3 * v30])
                    {
                      *(void *)(v29 + 104) = 0;
                      *(void *)(v29 + 112) = 0;
                      *(_DWORD *)(v29 + 120) = 0;
                    }
                    if (v34[3 * v30 + 1])
                    {
                      *(void *)(v29 + 128) = 0;
                      *(void *)(v29 + 136) = 0;
                      *(_DWORD *)(v29 + 124) = 0;
                    }
                    if (byte_1BA86C290[9 * v28 + 2 + 3 * v30])
                    {
                      *(void *)(v29 + 144) = 0;
                      *(void *)(v29 + 152) = 0;
                      *(_DWORD *)(v29 + 160) = 0;
                    }
                    ++v24;
                    v29 += (int)BytesPerRow;
                  }
                  while (v24 != 15);
                }
              }
              size_t v51 = BytesPerRowOfPlane;
              unint64_t v35 = a9 >> 1;
              if (v22 >= 2)
              {
                if (v23 <= 1) {
                  uint64_t v36 = 1;
                }
                else {
                  uint64_t v36 = v23;
                }
                int v37 = &v52[a8 + v18 * v35];
                do
                {
                  memset(v37, 128, Width);
                  v37 += v18;
                  --v36;
                }
                while (v36);
              }
              if (Height && Width)
              {
                int v38 = &v52[a8];
                if (v55)
                {
                  unint64_t v39 = 0;
                  objc_super v40 = &BaseAddressOfPlane[a8 + v51 * a9];
                  while (1)
                  {
                    for (uint64_t i = 0; i != Width; ++i)
                    {
                      float v44 = BaseAddress[i] / 6.6667;
                      int v45 = (int)(float)(v44 * 255.0);
                      if (v44 > 1.0) {
                        LOBYTE(v45) = -1;
                      }
                      if (v44 < 0.0) {
                        LOBYTE(v45) = 0;
                      }
                      v40[i] = v45;
                      float v46 = BaseAddress[i];
                      if (v46 < 0.0)
                      {
                        __int16 v42 = -27648;
                        char v43 = -31;
LABEL_57:
                        v40[i] = v43;
                        *(_WORD *)&v38[(v35 + (v39 >> 1)) * v18 + (i & 0xFFFFFFFFFFFFFFFELL)] = v42;
                        continue;
                      }
                      if (v46 == 2048.0)
                      {
                        __int16 v42 = -5420;
                        char v43 = 105;
                        goto LABEL_57;
                      }
                    }
                    ++v39;
                    v40 += v51;
                    BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
                    if (v39 == Height) {
                      goto LABEL_76;
                    }
                  }
                }
                unint64_t v47 = 0;
                char v48 = &BaseAddressOfPlane[a8 + v51 * a9];
                do
                {
                  for (uint64_t j = 0; j != Width; ++j)
                  {
                    LOWORD(v21) = *((_WORD *)BaseAddress + j);
                    float v21 = (float)LODWORD(v21) / (float)a6;
                    int v50 = (int)(float)(v21 * 255.0);
                    if (v21 > 1.0) {
                      LOBYTE(v50) = -1;
                    }
                    if (v21 < 0.0) {
                      LOBYTE(v50) = 0;
                    }
                    v48[j] = v50;
                    if (*((unsigned __int16 *)BaseAddress + j) >= a6)
                    {
                      v48[j] = 105;
                      *(_WORD *)&v38[(v35 + (v47 >> 1)) * v18 + (j & 0xFFFFFFFFFFFFFFFELL)] = -5420;
                    }
                  }
                  ++v47;
                  v48 += v51;
                  BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
                }
                while (v47 != Height);
              }
            }
          }
        }
      }
    }
  }
LABEL_76:
  CVPixelBufferUnlockBaseAddress(a4, 0);

  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
}

@end