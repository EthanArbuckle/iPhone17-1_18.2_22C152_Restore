@interface PanoramaProcessor
+ (void)prewarm;
- (BOOL)doParallaxCorrection;
- (CGRect)autocropMask;
- (MTLCommandQueue)commandQueue;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSNumber)defaultBlendingConfig;
- (NSNumber)defaultDirection;
- (NSNumber)defaultFallback;
- (NSNumber)defaultPrediction;
- (NSNumber)defaultPredictionMethod;
- (NSNumber)defaultRegistrationMethod;
- (NSNumber)maxWidth;
- (NSNumber)previewHeight;
- (NSNumber)previewScale;
- (NSNumber)previewWidth;
- (NSNumber)writeSlicesToDisc;
- (PanoRegistrationProvider)registrationProvider;
- (PanoramaOutput)output;
- (PanoramaPreviewOutput)previewOutput;
- (float32x4_t)refineInitialHomography:(float32x4_t)a3;
- (id)encodedResult;
- (id)init:(id *)a3;
- (id)metalContext;
- (int)_addLastSlice;
- (int)_commonInitWithContext:(id)a3 NRFversion:(int)a4;
- (int)_createDummyOutput;
- (int)addFrame:(opaqueCMSampleBuffer *)a3 registrationCallback:(id)a4;
- (int)addFrameWithoutStitching:(opaqueCMSampleBuffer *)a3 registrationCallback:(id)a4;
- (int)finishProcessing;
- (int)getMaskAsBuffer:(char *)a3 widthOut:(unint64_t *)a4 heightOut:(unint64_t *)a5;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcess_PanoSpecific:(unsigned int)a3 frameWidth:(unint64_t)a4 frameHeight:(unint64_t)a5;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setDirection:(int)a3;
- (int)setPanoramaParameters:(id *)a3;
- (int)setup;
- (uint64_t)addFrameForStitching:(double)a3 withInitialHomography:(double)a4 registrationCallback:(uint64_t)a5;
- (unint64_t)nbFramesDropped;
- (unint64_t)nbFramesReceived;
- (unint64_t)nbFramesSkipped;
- (void)_setPreviousFrameDroppedFlag:(opaqueCMSampleBuffer *)a3 dropped:(BOOL)a4;
- (void)dealloc;
- (void)getRegistrationWidth:(unint64_t *)a3 height:(unint64_t *)a4;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDoParallaxCorrection:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutput:(id)a3;
- (void)setPreviewOutput:(id)a3;
- (void)setRegistrationProvider:(id)a3;
- (void)setTuningParameters:(id)a3;
- (void)setWriteSlicesToDisc:(id)a3;
@end

@implementation PanoramaProcessor

+ (void)prewarm
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v2, v4, v3, v5);
  id v7 = objc_alloc(MEMORY[0x263F2EE30]);
  inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v7, v8, (uint64_t)v6, 0);
  v10 = [PanoramaRegistrationStage alloc];
  v13 = objc_msgSend_initWithContext_(v10, v11, (uint64_t)inited, v12);
  if (!v13)
  {
    v17 = 0;
    goto LABEL_9;
  }
  v14 = [PanoramaParallaxStage alloc];
  v17 = objc_msgSend_initWithContext_(v14, v15, (uint64_t)inited, v16);
  if (!v17)
  {
LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  v18 = [PanoramaStitchingStage alloc];
  v21 = objc_msgSend_initWithContext_(v18, v19, (uint64_t)inited, v20);
  if (!v21)
  {
LABEL_10:
    v24 = 0;
    goto LABEL_7;
  }
  v22 = [PanoramaAssemblyStage alloc];
  long long v32 = xmmword_235A10A60;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v33 = 0;
  uint64_t v36 = 2;
  v24 = objc_msgSend_initWithContext_robustPanoParams_(v22, v23, (uint64_t)inited, (uint64_t)&v32);
  if (v24)
  {
    v25 = [ACTPanoGPUDownscaler alloc];
    uint64_t v28 = objc_msgSend_initWithContext_(v25, v26, (uint64_t)inited, v27);
    if (v28)
    {
      v29 = (void *)v28;
      v30 = [LKTFlowGPU alloc];
    }
  }
LABEL_7:
}

- (id)init:(id *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PanoramaProcessor;
  v4 = [(PanoramaProcessor *)&v20 init];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F086E0];
    uint64_t v6 = objc_opt_class();
    v9 = objc_msgSend_bundleForClass_(v5, v7, v6, v8);
    long long v10 = *(_OWORD *)&a3->var2;
    v19[0] = *(_OWORD *)&a3->var0;
    v19[1] = v10;
    v19[2] = *(_OWORD *)&a3->var6;
    objc_msgSend_setPanoramaParameters_(v4, v11, (uint64_t)v19, v12);
    id v13 = objc_alloc(MEMORY[0x263F2EE30]);
    inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v13, v14, (uint64_t)v9, 0);
    if (objc_msgSend__commonInitWithContext_NRFversion_(v4, v16, (uint64_t)inited, a3->var8))
    {
      v17 = 0;
    }
    else
    {
      fig_note_initialize_category_with_default_work();
      v17 = v4;
    }
  }
  else
  {
    v17 = 0;
    v9 = 0;
    inited = 0;
  }

  return v17;
}

- (int)_commonInitWithContext:(id)a3 NRFversion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v120[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_storeStrong((id *)&self->_metal, a3);
  v11 = objc_msgSend_sharedInstance(MEMORY[0x263F2BFE8], v8, v9, v10);
  objc_msgSend_cameraParameters(v11, v12, v13, v14);
  v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cameraSetupPlist = self->_cameraSetupPlist;
  self->_cameraSetupPlist = v15;

  v17 = objc_opt_new();
  objc_msgSend_setPreviewOutput_(self, v18, (uint64_t)v17, v19);

  objc_super v20 = [PanoramaRegistrationStage alloc];
  v23 = (PanoramaRegistrationStage *)objc_msgSend_initWithContext_(v20, v21, (uint64_t)self->_metal, v22);
  registrationStage = self->_registrationStage;
  self->_registrationStage = v23;

  if (!self->_registrationStage) {
    goto LABEL_19;
  }
  v25 = [PanoramaParallaxStage alloc];
  uint64_t v28 = (PanoramaParallaxStage *)objc_msgSend_initWithContext_(v25, v26, (uint64_t)self->_metal, v27);
  parallaxStage = self->_parallaxStage;
  self->_parallaxStage = v28;

  if (!self->_parallaxStage) {
    goto LABEL_19;
  }
  v30 = [PanoramaStitchingStage alloc];
  uint64_t v33 = (PanoramaStitchingStage *)objc_msgSend_initWithContext_(v30, v31, (uint64_t)self->_metal, v32);
  stitchingStage = self->_stitchingStage;
  self->_stitchingStage = v33;

  if (!self->_stitchingStage) {
    goto LABEL_19;
  }
  uint64_t v35 = [PanoramaAssemblyStage alloc];
  metal = self->_metal;
  long long v37 = *(_OWORD *)&self->_panoramaParams.enableTranslationCorrection;
  v110[0] = *(_OWORD *)&self->_panoramaParams.frameWidth;
  v110[1] = v37;
  v110[2] = *(_OWORD *)&self->_panoramaParams.atlasTranslationShiftHighThreshold;
  v39 = (PanoramaAssemblyStage *)objc_msgSend_initWithContext_robustPanoParams_(v35, v38, (uint64_t)metal, (uint64_t)v110);
  assemblyStage = self->_assemblyStage;
  self->_assemblyStage = v39;

  if (!self->_assemblyStage) {
    goto LABEL_19;
  }
  objc_msgSend_setRegistrationProvider_(self, v41, (uint64_t)self->_registrationStage, v42);
  v43 = [ACTPanoGPUDownscaler alloc];
  v46 = (ACTPanoGPUDownscaler *)objc_msgSend_initWithContext_(v43, v44, (uint64_t)self->_metal, v45);
  downscaler = self->_downscaler;
  self->_downscaler = v46;

  if (!self->_downscaler) {
    goto LABEL_19;
  }
  v48 = (OS_dispatch_queue *)dispatch_queue_create("PanoramaProcessing", 0);
  processingQueue = self->_processingQueue;
  self->_processingQueue = v48;

  if (!self->_processingQueue
    || (v50 = objc_alloc_init(PanoramaGyroStage),
        gyroStage = self->_gyroStage,
        self->_gyroStage = v50,
        gyroStage,
        !self->_gyroStage))
  {
LABEL_19:
    id v62 = 0;
    v59 = 0;
    goto LABEL_21;
  }
  OSStatus v52 = VTPixelTransferSessionCreate(0, &self->_vtSession);
  if (v52)
  {
    CVReturn v96 = v52;
    id v62 = 0;
    v59 = 0;
    goto LABEL_17;
  }
  self->_doParallaxCorrection = 1;
  self->_direction = 1;
  v55 = (void *)MEMORY[0x263F086E0];
  v56 = objc_msgSend_stringWithFormat_(NSString, v53, @"/System/Library/VideoProcessors/NRFV%d.bundle", v54, v4);
  v59 = objc_msgSend_bundleWithPath_(v55, v57, (uint64_t)v56, v58);

  if (!v59) {
    goto LABEL_20;
  }
  id v109 = 0;
  objc_msgSend_loadAndReturnError_(v59, v60, (uint64_t)&v109, v61);
  id v62 = v109;
  if (v62)
  {
LABEL_21:
    CVReturn v96 = 2;
    goto LABEL_17;
  }
  v65 = objc_msgSend_stringWithFormat_(NSString, v63, @"NRFProcessorV%d", v64, v4);
  uint64_t v68 = objc_msgSend_classNamed_(v59, v66, (uint64_t)v65, v67);

  if (!v68)
  {
LABEL_20:
    id v62 = 0;
    goto LABEL_21;
  }
  v69 = (NRFProcessor *)objc_opt_new();
  nrfProcessor = self->_nrfProcessor;
  self->_nrfProcessor = v69;

  v73 = objc_msgSend_objectForKeyedSubscript_(self->_cameraSetupPlist, v71, @"TuningParameters", v72);
  objc_msgSend_setTuningParameters_(self, v74, (uint64_t)v73, v75);
  uint64_t v76 = *MEMORY[0x263F2EBF8];
  v119[0] = *MEMORY[0x263F2C618];
  v119[1] = v76;
  v120[0] = v73;
  v120[1] = &unk_26E8E7598;
  uint64_t v77 = *MEMORY[0x263F2EC00];
  v119[2] = *MEMORY[0x263F2EBF0];
  v119[3] = v77;
  v120[2] = &unk_26E8E75B0;
  v120[3] = &unk_26E8E75C8;
  v79 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v78, (uint64_t)v120, (uint64_t)v119, 4);
  CVReturn v82 = objc_msgSend_setupWithOptions_(self->_nrfProcessor, v80, (uint64_t)v79, v81);
  if (v82)
  {
    CVReturn v96 = v82;

    id v62 = 0;
  }
  else
  {
    v107 = v59;
    id v108 = v7;
    objc_msgSend_setFusionMode_(self->_nrfProcessor, v83, 1, v84);
    objc_msgSend_setNrfProcessor_(self->_assemblyStage, v85, (uint64_t)self->_nrfProcessor, v86);

    uint64_t v87 = *MEMORY[0x263F041C0];
    uint64_t v117 = *MEMORY[0x263F041C0];
    v118 = &unk_26E8E75E0;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v88, (uint64_t)&v118, (uint64_t)&v117, 1);
    CFDictionaryRef v89 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v90 = *MEMORY[0x263F04130];
    uint64_t v91 = *MEMORY[0x263F04240];
    v115[0] = *MEMORY[0x263F04130];
    v115[1] = v91;
    v116[0] = MEMORY[0x263EFFA78];
    v116[1] = &unk_26E8E75F8;
    uint64_t v92 = *MEMORY[0x263F04118];
    uint64_t v93 = *MEMORY[0x263F04180];
    v115[2] = *MEMORY[0x263F04118];
    v115[3] = v93;
    v116[2] = &unk_26E8E7610;
    v116[3] = &unk_26E8E7628;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v94, (uint64_t)v116, (uint64_t)v115, 4);
    CFDictionaryRef v95 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CVReturn v96 = CVPixelBufferPoolCreate(0, v89, v95, &self->_downsampledRegistrationPool);

    if (v96) {
      goto LABEL_15;
    }
    uint64_t v113 = v87;
    v114 = &unk_26E8E75E0;
    v98 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v97, (uint64_t)&v114, (uint64_t)&v113, 1);
    v111[0] = v90;
    v111[1] = v91;
    v112[0] = MEMORY[0x263EFFA78];
    v112[1] = &unk_26E8E7640;
    v111[2] = v92;
    v111[3] = v93;
    v112[2] = &unk_26E8E7658;
    v112[3] = &unk_26E8E7628;
    v100 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v99, (uint64_t)v112, (uint64_t)v111, 4);
    CFDictionaryRef v101 = v98;
    CFDictionaryRef v102 = v100;
    CVReturn v96 = CVPixelBufferPoolCreate(0, v101, v102, &self->_inputSlicePool);

    if (v96)
    {
LABEL_15:
      id v62 = 0;
    }
    else
    {
      id v62 = 0;
      long long v104 = *MEMORY[0x263EF89A0];
      long long v105 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      long long v106 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
      self->_poolOccupancy = 0;
      self->_prevFrameDropped = 0;
      *(_OWORD *)&self->_anon_110[16] = v105;
      *(_OWORD *)&self->_anon_110[32] = v106;
      *(_OWORD *)self->_anon_e0 = v104;
      *(_OWORD *)&self->_anon_e0[16] = v105;
      *(_OWORD *)&self->_anon_e0[32] = v106;
      *(_OWORD *)self->_anon_110 = v104;
      self->_toACTFramework = 0;
      self->_nbFramesDropped = 0;
      self->_nbFramesReceived = 0;
      self->_nbFramesSkipped = 0;
    }
    v59 = v107;
    id v7 = v108;
  }
LABEL_17:

  return v96;
}

- (void)dealloc
{
  toACTFramework = self->_toACTFramework;
  if (toACTFramework)
  {
    CVPixelBufferRelease(toACTFramework);
    self->_toACTFramework = 0;
  }
  vtSession = self->_vtSession;
  if (vtSession)
  {
    VTPixelTransferSessionInvalidate(vtSession);
    CFRelease(self->_vtSession);
    self->_vtSession = 0;
  }
  downsampledRegistrationPool = self->_downsampledRegistrationPool;
  if (downsampledRegistrationPool)
  {
    CVPixelBufferPoolRelease(downsampledRegistrationPool);
    self->_downsampledRegistrationPool = 0;
  }
  inputSlicePool = self->_inputSlicePool;
  if (inputSlicePool)
  {
    CVPixelBufferPoolRelease(inputSlicePool);
    self->_inputSlicePool = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)PanoramaProcessor;
  [(PanoramaProcessor *)&v7 dealloc];
}

- (id)metalContext
{
  return self->_metal;
}

- (float32x4_t)refineInitialHomography:(float32x4_t)a3
{
  uint32x4_t v4 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3, *(float32x4_t *)(MEMORY[0x263EF89A0] + 16)), (int8x16_t)vceqq_f32(result, *MEMORY[0x263EF89A0])), (int8x16_t)vceqq_f32(a4, *(float32x4_t *)(MEMORY[0x263EF89A0] + 32)));
  v4.i32[3] = v4.i32[2];
  if ((vminvq_u32(v4) & 0x80000000) != 0) {
    return (float32x4_t)a1[17];
  }
  return result;
}

- (void)getRegistrationWidth:(unint64_t *)a3 height:(unint64_t *)a4
{
  *a3 >>= 2;
  *a4 >>= 2;
}

- (uint64_t)addFrameForStitching:(double)a3 withInitialHomography:(double)a4 registrationCallback:(uint64_t)a5
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  id v138 = a7;
  CVPixelBufferRef pixelBufferOut = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(a6);
  uint64_t v10 = CMGetAttachment(a6, @"MetadataDictionary", 0);
  v11 = CMGetAttachment(ImageBuffer, @"MetadataDictionary", 0);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v10, v12, @"SliceNumber", v13);
  int v18 = objc_msgSend_intValue(v14, v15, v16, v17);

  double HostTime = getHostTime();
  CMSampleBufferGetPresentationTimeStamp(&time, a6);
  Float64 Seconds = CMTimeGetSeconds(&time);
  panoLog(32, "FrameID:%04d time %.3f: starting processing PTS:%.3f\n", v18, HostTime, Seconds);
  uint64_t v21 = *MEMORY[0x263F2D4E0];
  v24 = objc_msgSend_objectForKey_(v10, v22, *MEMORY[0x263F2D4E0], v23);

  v139 = v11;
  if (!v24)
  {
    uint64_t v28 = objc_msgSend_mutableCopy(v10, v25, v26, v27);
    objc_msgSend_objectForKeyedSubscript_(v11, v29, *MEMORY[0x263F2DF98], v30);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!v33) {
      id v33 = (id)*MEMORY[0x263F2C240];
    }
    uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 376), v31, @"DefaultSensorIDs", v32);
    long long v37 = objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)v33, v36);

    v142[0] = -559038737;
    v40 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v38, (uint64_t)v37, v39);
    objc_msgSend_scanHexInt_(v40, v41, (uint64_t)v142, v42);

    uint64_t v45 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v43, v142[0], v44);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v46, (uint64_t)v45, v21);

    uint64_t v50 = objc_msgSend_copy(v28, v47, v48, v49);
    uint64_t v10 = (void *)v50;
    v11 = v139;
  }
  CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)(a1 + 80), &pixelBufferOut);
  if (pixelBufferOut)
  {
    SampleBuffer = (const void *)CreateSampleBuffer();
    CVPixelBufferRelease(pixelBufferOut);
    if (SampleBuffer)
    {
      objc_msgSend_downsample_to_(*(void **)(a1 + 64), v52, (uint64_t)ImageBuffer, (uint64_t)pixelBufferOut);
      v56 = objc_msgSend_copy(v10, v53, v54, v55);
      uint64_t v57 = 1;
      CMSetAttachment(SampleBuffer, @"MetadataDictionary", v56, 1u);

      *(void *)(a1 + 112) = CVPixelBufferGetWidth((CVPixelBufferRef)ImageBuffer);
      *(void *)(a1 + 120) = CVPixelBufferGetHeight((CVPixelBufferRef)ImageBuffer);
      double v58 = getHostTime();
      panoLog(32, "FrameID:%04d time %.3f: starting registration\n", v18, v58);
      v60 = *(void **)(a1 + 392);
      if (v60)
      {
        uint64_t v61 = v138;
        objc_msgSend_registerNewSlice_withHFromGyro_registrationCallback_(v60, v59, (uint64_t)SampleBuffer, (uint64_t)v138, a2, a3, a4);
        double v135 = v63;
        double v137 = v62;
        double v133 = v64;
        if (objc_msgSend_hasHomographyFailureFlag(*(void **)(a1 + 16), v65, v66, v67))
        {
          v71 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          getHostTime();
          panoLog(4, "FrameID:%04d time %.3f: registration has FAILURE flag\n");
LABEL_20:
          v110 = 0;
          uint64_t v57 = 0;
LABEL_25:
          CFRelease(SampleBuffer);

          v11 = v139;
          goto LABEL_26;
        }
        if (objc_msgSend_hasRetrogradeMotionFlag(*(void **)(a1 + 16), v68, v69, v70))
        {
          uint64_t v72 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          getHostTime();
          panoLog(4, "FrameID:%04d time %.3f: registration detected possible retrograde motion\n");
          goto LABEL_20;
        }
        double v73 = getHostTime();
        panoLog(32, "FrameID:%04d time %.3f: starting stitching\n", v18, v73);
        uint64_t v76 = objc_msgSend_objectForKeyedSubscript_(v10, v74, @"SliceType", v75);
        uint64_t v80 = objc_msgSend_intValue(v76, v77, v78, v79);

        uint64_t v82 = objc_msgSend_addSlice_sliceHomography_sliceType_(*(void **)(a1 + 32), v81, (uint64_t)ImageBuffer, v80, v137, v135, v133);
        if (v82)
        {
          uint64_t v57 = v82;
        }
        else
        {
          uint64_t v86 = objc_msgSend_registrationWeights(*(void **)(a1 + 16), v83, v84, v85);
          objc_msgSend_setMotionMask_(*(void **)(a1 + 32), v87, (uint64_t)v86, v88);

          if (!*(unsigned char *)(a1 + 352) || !v80)
          {
            uint64_t v109 = objc_msgSend_stitchingMask(*(void **)(a1 + 32), v89, v90, v91);
LABEL_18:
            v110 = (void *)v109;
            double v111 = getHostTime();
            panoLog(32, "FrameID:%04d time %.3f: starting assembly\n", v18, v111);
            v112 = *(void **)(a1 + 40);
            v116 = objc_msgSend_registrationWeights(*(void **)(a1 + 16), v113, v114, v115);
            objc_msgSend_roi(*(void **)(a1 + 32), v117, v118, v119);
            uint64_t v57 = objc_msgSend_addSlice_metadata_sliceHomography_stitchingMask_motionCue_roi_sliceType_(v112, v120, (uint64_t)ImageBuffer, (uint64_t)v10, v110, v116, v80, v137, v135, v133, v121, v122, v123, v124);

            if (!v57)
            {
              uint64_t v128 = objc_msgSend_copy(v10, v125, v126, v127);
              v129 = *(void **)(a1 + 336);
              *(void *)(a1 + 336) = v128;
            }
            goto LABEL_24;
          }
          double v92 = getHostTime();
          panoLog(32, "FrameID:%04d time %.3f: starting parallax correction\n", v18, v92);
          uint64_t v93 = *(void **)(a1 + 24);
          v97 = objc_msgSend_stitchingMask(*(void **)(a1 + 32), v94, v95, v96);
          uint64_t v101 = objc_msgSend_residualFlow(*(void **)(a1 + 392), v98, v99, v100);
          uint64_t v57 = objc_msgSend_addSlice_mask_homography_residualFlow_(v93, v102, (uint64_t)ImageBuffer, (uint64_t)v97, v101, v137, v135, v133);

          if (!v57)
          {
            ImageBuffer = objc_msgSend_warpedFrame(*(void **)(a1 + 24), v103, v104, v105);
            uint64_t v109 = objc_msgSend_warpedMask(*(void **)(a1 + 24), v106, v107, v108);
            goto LABEL_18;
          }
        }
      }
      v110 = 0;
LABEL_24:
      uint64_t v61 = v138;
      goto LABEL_25;
    }
  }
  uint64_t v57 = 2;
  uint64_t v61 = v138;
LABEL_26:
  double v130 = getHostTime();
  panoLog(32, "FrameID:%04d time %.3f: processing done\n\n", v18, v130);

  return v57;
}

- (int)addFrameWithoutStitching:(opaqueCMSampleBuffer *)a3 registrationCallback:(id)a4
{
  return 0;
}

- (void)_setPreviousFrameDroppedFlag:(opaqueCMSampleBuffer *)a3 dropped:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = CMGetAttachment(a3, @"MetadataDictionary", 0);
  if (v6)
  {
    uint64_t v10 = v6;
    value = objc_msgSend_mutableCopy(v6, v7, v8, v9);
  }
  else
  {
    value = objc_opt_new();
  }
  if (v4) {
    objc_msgSend_setObject_forKeyedSubscript_(value, v11, MEMORY[0x263EFFA88], @"PreviousFrameDropped");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(value, v11, MEMORY[0x263EFFA80], @"PreviousFrameDropped");
  }
  CMSetAttachment(a3, @"MetadataDictionary", value, 1u);
}

- (int)addFrame:(opaqueCMSampleBuffer *)a3 registrationCallback:(id)a4
{
  id v6 = a4;
  CVPixelBufferRef pixelBufferOut = 0;
  objc_super v7 = CMGetAttachment(a3, @"MetadataDictionary", 0);
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  ++self->_nbFramesReceived;
  uint64_t v9 = CMGetAttachment(a3, @"ClientSpecifiedMetadata", 0);
  uint64_t v13 = objc_msgSend_mutableCopy(v9, v10, v11, v12);

  uint64_t v16 = objc_msgSend_objectForKey_(v7, v14, @"DebugMotionDataFromISP", v15);

  if (v16)
  {
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v7, v17, @"DebugMotionDataFromISP", v18);
    objc_msgSend_setObject_forKeyedSubscript_(v13, v20, (uint64_t)v19, @"DebugMotionDataFromISP");
  }
  uint64_t v21 = objc_msgSend_objectForKey_(v7, v17, @"FocalLenIn35mmFilm", v18);

  if (v21)
  {
    v24 = objc_msgSend_objectForKeyedSubscript_(v7, v22, @"FocalLenIn35mmFilm", v23);
    objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, @"FocalLenIn35mmFilm");
  }
  double v58 = v6;
  uint64_t v26 = objc_msgSend_objectForKey_(v7, v22, @"SkipFrame", v23);
  uint64_t v30 = v26;
  if (v26 && objc_msgSend_BOOLValue(v26, v27, v28, v29))
  {
    ++self->_nbFramesSkipped;
    id v33 = objc_msgSend_objectForKeyedSubscript_(v7, v31, @"SliceNumber", v32);
    int v37 = objc_msgSend_intValue(v33, v34, v35, v36);
    double HostTime = getHostTime();
    CMSampleBufferGetPresentationTimeStamp(&time, a3);
    Float64 Seconds = CMTimeGetSeconds(&time);
    panoLog(32, "FrameID:%04d time %.3f: frame skipped PTS:%.3f , total frames skipped %zu\n", v37, HostTime, Seconds, self->_nbFramesSkipped);

    SampleBuffer = 0;
    char v41 = 1;
  }
  else
  {
    CVPixelBufferPoolCreatePixelBuffer(0, self->_inputSlicePool, &pixelBufferOut);
    scalePixelBuffer(self->_vtSession, ImageBuffer, pixelBufferOut);
    ++self->_poolOccupancy;
    SampleBuffer = (const void *)CreateSampleBuffer();
    CVPixelBufferRelease(pixelBufferOut);
    uint64_t v45 = objc_msgSend_copy(v7, v42, v43, v44);
    CMSetAttachment(SampleBuffer, @"MetadataDictionary", v45, 1u);

    CVPixelBufferRef v46 = pixelBufferOut;
    uint64_t v50 = objc_msgSend_copy(v13, v47, v48, v49);
    CMSetAttachment(v46, @"MetadataDictionary", v50, 1u);

    CMPropagateAttachments(ImageBuffer, pixelBufferOut);
    char v41 = 0;
  }
  if (a3) {
    CFRelease(a3);
  }
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2359E4CD0;
  block[3] = &unk_264C64D20;
  id v52 = v7;
  id v64 = v52;
  v65 = self;
  id v53 = v13;
  id v66 = v53;
  float v67 = (float)Width;
  float v68 = (float)Height;
  dispatch_async(processingQueue, block);
  if ((v41 & 1) == 0)
  {
    uint64_t v54 = self->_processingQueue;
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = sub_2359E4E58;
    v59[3] = &unk_264C64D48;
    v59[4] = self;
    id v60 = v52;
    double v62 = SampleBuffer;
    id v61 = v58;
    dispatch_async(v54, v59);
  }
  return 0;
}

- (int)_addLastSlice
{
  stitchingStage = self->_stitchingStage;
  uint64_t v6 = objc_msgSend_warpedFrame(self->_parallaxStage, a2, v2, v3);
  long long v33 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v34 = *MEMORY[0x263EF89A0];
  long long v32 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  int result = objc_msgSend_addSlice_sliceHomography_sliceType_(stitchingStage, v7, v6, 2);
  if (!result)
  {
    assemblyStage = self->_assemblyStage;
    uint64_t v13 = objc_msgSend_warpedFrame(self->_parallaxStage, v9, v10, v11);
    lastMetadata = self->_lastMetadata;
    uint64_t v18 = objc_msgSend_stitchingMask(self->_stitchingStage, v15, v16, v17);
    uint64_t v22 = objc_msgSend_registrationWeights(self->_registrationStage, v19, v20, v21);
    objc_msgSend_roi(self->_stitchingStage, v23, v24, v25);
    int v31 = objc_msgSend_addSlice_metadata_sliceHomography_stitchingMask_motionCue_roi_sliceType_(assemblyStage, v26, v13, (uint64_t)lastMetadata, v18, v22, 2, *(double *)&v34, *(double *)&v33, *(double *)&v32, v27, v28, v29, v30);

    return v31;
  }
  return result;
}

- (int)finishProcessing
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  processingQueue = self->_processingQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2359E5330;
  v16[3] = &unk_264C64D70;
  v16[4] = self;
  v16[5] = &v17;
  dispatch_sync(processingQueue, v16);
  int v7 = *((_DWORD *)v18 + 6);
  if (!v7)
  {
    objc_msgSend_cropRect(self->_assemblyStage, v4, v5, v6);
    objc_msgSend_setCropRect_(self->_output, v12, v13, v14, (v8 + 0.300000012) * (double)self->_sliceWidth, (v9 + 0.075000003) * (double)self->_sliceHeight, (v10 + -0.150000006) * (double)self->_sliceWidth, (v11 + -0.150000006) * (double)self->_sliceHeight);
    int v7 = *((_DWORD *)v18 + 6);
  }
  _Block_object_dispose(&v17, 8);
  return v7;
}

- (int)_createDummyOutput
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  uint64_t v11 = *MEMORY[0x263F04130];
  v12[0] = MEMORY[0x263EFFA78];
  uint64_t v3 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v12, (uint64_t)&v11, 1);
  BOOL v4 = (PanoramaOutput *)objc_opt_new();
  CFDictionaryRef v5 = v3;
  CVPixelBufferCreate(0, 0x1226uLL, 0x3FFEuLL, 0x34323066u, v5, (CVPixelBufferRef *)&v10);
  objc_msgSend_setPixelBuffer_(v4, v6, v10, v7);
  output = self->_output;
  self->_output = v4;

  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2359E5590;
  block[3] = &unk_264C64D98;
  unsigned int v7 = a3;
  void block[4] = self;
  block[5] = &v8;
  dispatch_sync(processingQueue, block);
  int v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (int)prepareToProcess_PanoSpecific:(unsigned int)a3 frameWidth:(unint64_t)a4 frameHeight:(unint64_t)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  processingQueue = self->_processingQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2359E57C0;
  v8[3] = &unk_264C64DC0;
  v8[6] = a4;
  v8[7] = a5;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(processingQueue, v8);
  int v6 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)encodedResult
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_2359E59A8;
  uint64_t v11 = sub_2359E59B8;
  id v12 = (id)objc_opt_new();
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2359E59C0;
  v6[3] = &unk_264C64D70;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(processingQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (int)prewarm
{
  return 0;
}

- (int)process
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)resetState
{
  objc_msgSend_resetState(self->_registrationStage, a2, v2, v3);
  objc_msgSend_resetState(self->_parallaxStage, v5, v6, v7);
  objc_msgSend_resetState(self->_stitchingStage, v8, v9, v10);
  objc_msgSend_resetState(self->_assemblyStage, v11, v12, v13);
  objc_msgSend_resetState(self->_gyroStage, v14, v15, v16);
  self->_poolOccupancy = 0;
  self->_prevFrameDropped = 0;
  self->_nbFramesDropped = 0;
  self->_nbFramesReceived = 0;
  self->_nbFramesSkipped = 0;
  long long v17 = *MEMORY[0x263EF89A0];
  long long v18 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v19 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  *(_OWORD *)&self->_anon_110[16] = v18;
  *(_OWORD *)&self->_anon_110[32] = v19;
  *(_OWORD *)self->_anon_e0 = v17;
  *(_OWORD *)&self->_anon_e0[16] = v18;
  *(_OWORD *)&self->_anon_e0[32] = v19;
  *(_OWORD *)self->_anon_110 = v17;
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)setDirection:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  self->_direction = a3;
  objc_msgSend_setDirection_(self->_registrationStage, a2, *(uint64_t *)&a3, v3);
  objc_msgSend_setDirection_(self->_parallaxStage, v6, v4, v7);
  objc_msgSend_setDirection_(self->_stitchingStage, v8, v4, v9);
  objc_msgSend_setDirection_(self->_assemblyStage, v10, v4, v11);
  return 0;
}

- (int)setPanoramaParameters:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_panoramaParams.atlasTranslationShiftHighThreshold = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_panoramaParams.enableTranslationCorrection = v4;
  *(_OWORD *)&self->_panoramaParams.framesize_t Width = v3;
  return 0;
}

- (int)getMaskAsBuffer:(char *)a3 widthOut:(unint64_t *)a4 heightOut:(unint64_t *)a5
{
  return objc_msgSend_getMaskAsBuffer_widthOut_heightOut_(self->_assemblyStage, a2, (uint64_t)a3, (uint64_t)a4, a5);
}

- (CGRect)autocropMask
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2359E5D3C;
  block[3] = &unk_264C64DE8;
  void block[4] = self;
  dispatch_sync(processingQueue, block);
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (PanoRegistrationProvider)registrationProvider
{
  return self->_registrationProvider;
}

- (void)setRegistrationProvider:(id)a3
{
}

- (BOOL)doParallaxCorrection
{
  return self->_doParallaxCorrection;
}

- (void)setDoParallaxCorrection:(BOOL)a3
{
  self->_doParallaxCorrection = a3;
}

- (PanoramaPreviewOutput)previewOutput
{
  return self->_previewOutput;
}

- (void)setPreviewOutput:(id)a3
{
}

- (PanoramaOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (NSNumber)writeSlicesToDisc
{
  return self->_writeSlicesToDisc;
}

- (void)setWriteSlicesToDisc:(id)a3
{
}

- (NSNumber)previewScale
{
  return self->_previewScale;
}

- (NSNumber)maxWidth
{
  return self->_maxWidth;
}

- (NSNumber)previewWidth
{
  return self->_previewWidth;
}

- (NSNumber)previewHeight
{
  return self->_previewHeight;
}

- (NSNumber)defaultDirection
{
  return self->_defaultDirection;
}

- (NSNumber)defaultRegistrationMethod
{
  return self->_defaultRegistrationMethod;
}

- (NSNumber)defaultPredictionMethod
{
  return self->_defaultPredictionMethod;
}

- (NSNumber)defaultPrediction
{
  return self->_defaultPrediction;
}

- (NSNumber)defaultFallback
{
  return self->_defaultFallback;
}

- (NSNumber)defaultBlendingConfig
{
  return self->_defaultBlendingConfig;
}

- (unint64_t)nbFramesReceived
{
  return self->_nbFramesReceived;
}

- (unint64_t)nbFramesSkipped
{
  return self->_nbFramesSkipped;
}

- (unint64_t)nbFramesDropped
{
  return self->_nbFramesDropped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBlendingConfig, 0);
  objc_storeStrong((id *)&self->_defaultFallback, 0);
  objc_storeStrong((id *)&self->_defaultPrediction, 0);
  objc_storeStrong((id *)&self->_defaultPredictionMethod, 0);
  objc_storeStrong((id *)&self->_defaultRegistrationMethod, 0);
  objc_storeStrong((id *)&self->_defaultDirection, 0);
  objc_storeStrong((id *)&self->_previewHeight, 0);
  objc_storeStrong((id *)&self->_previewWidth, 0);
  objc_storeStrong((id *)&self->_maxWidth, 0);
  objc_storeStrong((id *)&self->_previewScale, 0);
  objc_storeStrong((id *)&self->_writeSlicesToDisc, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_previewOutput, 0);
  objc_storeStrong((id *)&self->_registrationProvider, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->metalCommandQueue, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_nrfProcessor, 0);
  objc_storeStrong((id *)&self->_lastMetadata, 0);
  objc_storeStrong((id *)&self->_cameraSetupPlist, 0);
  objc_storeStrong((id *)&self->_downscaler, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_gyroStage, 0);
  objc_storeStrong((id *)&self->_assemblyStage, 0);
  objc_storeStrong((id *)&self->_stitchingStage, 0);
  objc_storeStrong((id *)&self->_parallaxStage, 0);
  objc_storeStrong((id *)&self->_registrationStage, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end