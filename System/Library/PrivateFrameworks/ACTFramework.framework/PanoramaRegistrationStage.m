@interface PanoramaRegistrationStage
- (BOOL)_isRetrogradeMotion:(__n128)a3 tolerance:(double)a4;
- (BOOL)hasHomographyFailureFlag;
- (BOOL)hasRetrogradeMotion;
- (BOOL)hasRetrogradeMotionFlag;
- (BOOL)homographyFailure;
- (CGRect)roi;
- (MTLCommandQueue)metalCommandQueue;
- (MTLTexture)RegistrationMask;
- (MTLTexture)registrationWeights;
- (NSDictionary)cameraInfoByPortType;
- (PanoramaRegistrationStage)initWithContext:(id)a3;
- (__CVBuffer)residualFlow;
- (__n128)registerNewSlice:(float32x4_t)a3 withHFromGyro:(float32x4_t)a4 registrationCallback:(uint64_t)a5;
- (double)homography;
- (float32x4_t)_setRegistrationParams:(float32x4_t)a3 initTransform:(float32x4_t)a4;
- (int)_getICPDecimationFactor;
- (int)_getLKTFlowUpperMostScale;
- (int)prepareRegistrationWithDevice:(id)a3 library:(id)a4 commandQueue:(id)a5 width:(unint64_t)a6 height:(unint64_t)a7;
- (int)resetState;
- (int)setDirection:(int)a3;
- (uint64_t)_checkForNaNs:;
- (uint64_t)_computeRegistration:(double)a3 metadata:(double)a4 initTransform:(uint64_t)a5;
- (uint64_t)_isTranslationOutlier:(uint64_t)a3;
- (uint64_t)_logTransform:(void *)a3 metadata:(uint64_t)a4 message:(int)a5 error:;
- (void)_resetHomographyFailureFlagToFalse;
- (void)_resetRetrogradeMotionFlagToFalse;
- (void)_setHomographyFailureFlag;
- (void)_setRetrogradeMotionFlag;
- (void)dealloc;
- (void)replacePreviousSlice:(__CVBuffer *)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setHasRetrogradeMotion:(BOOL)a3;
- (void)setHomography:(__n128)a3;
- (void)setHomographyFailure:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setRegistrationWeights:(id)a3;
- (void)setResidualFlow:(__CVBuffer *)a3;
@end

@implementation PanoramaRegistrationStage

- (PanoramaRegistrationStage)initWithContext:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PanoramaRegistrationStage;
  v6 = [(PanoramaRegistrationStage *)&v23 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v8 = [PanoramaRegistrationShaders alloc];
  uint64_t v11 = objc_msgSend_initWithContext_(v8, v9, (uint64_t)v5, v10);
  shaders = v7->_shaders;
  v7->_shaders = (PanoramaRegistrationShaders *)v11;

  if (!v7->_shaders) {
    goto LABEL_6;
  }
  lkt = v7->_lkt;
  v7->_lkt = 0;

  v7->_direction = 1;
  unsigned int LKTFlowUpperMostScale = objc_msgSend__getLKTFlowUpperMostScale(v7, v14, v15, v16);
  v7->_flowUpperMostScale = LKTFlowUpperMostScale;
  if (LKTFlowUpperMostScale <= 1)
  {
    v7->_lastSlice = 0;
    uint64_t v18 = MEMORY[0x263EF89A0];
    long long v19 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    *(_OWORD *)&v7[1].super.isa = *MEMORY[0x263EF89A0];
    *(_OWORD *)&v7[1]._shaders = v19;
    *(_OWORD *)&v7[1]._direction = *(_OWORD *)(v18 + 32);
    *(_OWORD *)v7->_translationsMagnitude = 0u;
    *(_OWORD *)&v7->_translationsMagnitude[4] = 0u;
    *(_OWORD *)((char *)&v7->_translationsMagnitude[7] + 1) = 0u;
    registrationWeights = v7->_registrationWeights;
    v7->_residualFlow = 0;
    v7->_registrationWeights = 0;

    fig_note_initialize_category_with_default_work();
    v21 = v7;
  }
  else
  {
LABEL_6:
    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  lastSlice = self->_lastSlice;
  if (lastSlice) {
    CVPixelBufferRelease(lastSlice);
  }
  self->_lastSlice = 0;
  residualFlow = self->_residualFlow;
  if (residualFlow) {
    CVPixelBufferRelease(residualFlow);
  }
  self->_residualFlow = 0;
  v5.receiver = self;
  v5.super_class = (Class)PanoramaRegistrationStage;
  [(PanoramaRegistrationStage *)&v5 dealloc];
}

- (int)resetState
{
  lastSlice = self->_lastSlice;
  if (lastSlice) {
    CVPixelBufferRelease(lastSlice);
  }
  v6 = (_OWORD *)MEMORY[0x263EF89A0];
  self->_lastSlice = 0;
  long long v7 = v6[1];
  *(_OWORD *)&self[1].super.isa = *v6;
  *(_OWORD *)&self[1]._shaders = v7;
  *(_OWORD *)&self[1]._direction = v6[2];
  *(_WORD *)&self->_homographyFailure = 0;
  self->_direction = 1;
  self->_slicesProcessed = 0;
  objc_msgSend_reset(self->_lkt, a2, v2, v3);
  return 0;
}

- (int)_getLKTFlowUpperMostScale
{
  return 1;
}

- (int)_getICPDecimationFactor
{
  return 4;
}

- (int)prepareRegistrationWithDevice:(id)a3 library:(id)a4 commandQueue:(id)a5 width:(unint64_t)a6 height:(unint64_t)a7
{
  v47[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v15 = a5;
  if (!self->_lkt)
  {
    uint64_t v16 = [LKTFlowGPU alloc];
    uint64_t v18 = (LKTFlowGPU *)objc_msgSend_initWithMetalContext_ICPtransform_width_height_nscales_flowUpperMostScale_(v16, v17, (uint64_t)self->_metal, 8, a6, a7, 0xFFFFFFFFLL, self->_flowUpperMostScale);
    lkt = self->_lkt;
    self->_lkt = v18;

    objc_msgSend_setInputPixelFormat_(self->_lkt, v20, 2, v21);
    objc_msgSend_setUseNonLocalRegularization_(self->_lkt, v22, 0, v23);
  }
  p_residualFlow = (uint64_t *)&self->_residualFlow;
  char v25 = self->_flowUpperMostScale > 0;
  unint64_t v26 = a7 >> v25;
  unint64_t v27 = a6 >> v25;
  if (!self->_residualFlow)
  {
    uint64_t v46 = *MEMORY[0x263F04130];
    v47[0] = MEMORY[0x263EFFA78];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v47, (uint64_t)&v46, 1);
    CFDictionaryRef v28 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
    CVPixelBufferCreate(0, (int)v27, (int)v26, 0x32433068u, v28, &self->_residualFlow);
    if (!*p_residualFlow) {
      goto LABEL_12;
    }
    objc_msgSend_setOutputUV_(self->_lkt, v29, *p_residualFlow, v30);
  }
  if (!self->_registrationWeights)
  {
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v14, 55, v27, v26, 0);
    CFDictionaryRef v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsage_(v28, v32, 3, v33);
    v37 = objc_msgSend_device(self->_metal, v34, v35, v36);
    v40 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v37, v38, (uint64_t)v28, v39);
    registrationWeights = self->_registrationWeights;
    self->_registrationWeights = v40;

    v44 = self->_registrationWeights;
    if (v44)
    {
      objc_msgSend_setICPWeights_(self->_lkt, v42, (uint64_t)v44, v43);
      int v31 = 0;
LABEL_10:

      goto LABEL_11;
    }
LABEL_12:
    int v31 = 2;
    goto LABEL_10;
  }
  int v31 = 0;
LABEL_11:

  return v31;
}

- (uint64_t)_checkForNaNs:
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    for (uint64_t j = 0; j != 3; ++j)
      ;
  }
  return 0;
}

- (uint64_t)_isTranslationOutlier:(uint64_t)a3
{
  unsigned __int32 v19 = a5.n128_u32[2];
  if (objc_msgSend__checkForNaNs_(a1, a2, a3, a4, *(_OWORD *)&a6)) {
    return 1;
  }
  _S0 = v19;
  __asm { FMLA            S1, S0, V2.S[2] }
  float v13 = sqrtf(_S1);
  int v14 = a1[22];
  id v15 = a1 + 12;
  if (v14 >= 10)
  {
    uint64_t v16 = 0;
    float v17 = 0.0;
    do
      float v17 = v17 + *(float *)&v15[v16++];
    while (v16 != 10);
    if (vabds_f32(v17 / 10.0, v13) > 4032.0) {
      return 1;
    }
  }
  uint64_t result = 0;
  *(float *)&v15[v14 % 10] = v13;
  a1[22] = v14 + 1;
  return result;
}

- (void)_setHomographyFailureFlag
{
  self->_homographyFailure = 1;
}

- (void)_resetHomographyFailureFlagToFalse
{
  self->_homographyFailure = 0;
}

- (BOOL)hasHomographyFailureFlag
{
  return self->_homographyFailure;
}

- (BOOL)_isRetrogradeMotion:(__n128)a3 tolerance:(double)a4
{
  if (*(_DWORD *)(a1 + 32) == 1) {
    return a3.n128_f32[2] < (float)-a5;
  }
  else {
    return a3.n128_f32[2] > a5;
  }
}

- (void)_setRetrogradeMotionFlag
{
  self->_hasRetrogradeMotion = 1;
}

- (void)_resetRetrogradeMotionFlagToFalse
{
  self->_hasRetrogradeMotion = 0;
}

- (BOOL)hasRetrogradeMotionFlag
{
  return self->_hasRetrogradeMotion;
}

- (uint64_t)_logTransform:(void *)a3 metadata:(uint64_t)a4 message:(int)a5 error:
{
  v6 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"SliceNumber", a4);
  uint64_t v10 = objc_msgSend_intValue(v6, v7, v8, v9);

  if (a5)
  {
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    double HostTime = getHostTime();
    return panoLog(4, "FrameID:%04d time %.3f: %s %9.6f %9.6f %9.6f  %9.6f %9.6f %9.6f  %9.6f %9.6f %9.6f\n", v10, *(void *)&HostTime);
  }
  else
  {
    double v12 = getHostTime();
    return panoLog(32, "FrameID:%04d time %.3f: %s %9.6f %9.6f %9.6f  %9.6f %9.6f %9.6f  %9.6f %9.6f %9.6f\n", v10, *(void *)&v12);
  }
}

- (float32x4_t)_setRegistrationParams:(float32x4_t)a3 initTransform:(float32x4_t)a4
{
  id v7 = a6;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v7, v9, @"PreviousFrameDropped", v10);
  int v15 = objc_msgSend_BOOLValue(v11, v12, v13, v14);

  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v7, v16, @"SliceNumber", v17);
  int v22 = objc_msgSend_intValue(v18, v19, v20, v21);

  float32x4_t v26 = (float32x4_t)vdupq_n_s32(0x2EDBE6FFu);
  uint32x4_t v27 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v26, vabdq_f32(a3, *(float32x4_t *)(MEMORY[0x263EF89A0] + 16))), (int8x16_t)vcgeq_f32(v26, vabdq_f32(a2, *MEMORY[0x263EF89A0]))), (int8x16_t)vcgeq_f32(v26, vabdq_f32(a4, *(float32x4_t *)(MEMORY[0x263EF89A0] + 32))));
  v27.i32[3] = v27.i32[2];
  if ((vminvq_u32(v27) & 0x80000000) != 0)
  {
    a2 = *(float32x4_t *)(a1 + 176);
    float v28 = 0.0000001;
  }
  else
  {
    float v28 = 0.0001;
  }
  if ((int)objc_msgSend_getMaxNumberOfScales(*(void **)(a1 + 24), v23, v24, v25) >= 1)
  {
    int v33 = 0;
    do
    {
      *(float *)&double v32 = v28;
      v34 = objc_msgSend_numberWithFloat_(NSNumber, v29, v30, v31, v32);
      objc_msgSend_addObject_(v8, v35, (uint64_t)v34, v36);

      ++v33;
    }
    while (v33 < (int)objc_msgSend_getMaxNumberOfScales(*(void **)(a1 + 24), v37, v38, v39));
  }
  v40 = *(void **)(a1 + 24);
  uint64_t ICPDecimationFactor = objc_msgSend__getICPDecimationFactor((void *)a1, v29, v30, v31);
  objc_msgSend_setPresetICP_withRegularizerTerms_decimation_factor_(v40, v42, 5, (uint64_t)v8, ICPDecimationFactor);
  double HostTime = getHostTime();
  LODWORD(v40) = objc_msgSend_nscales_icp(*(void **)(a1 + 24), v44, v45, v46);
  int v50 = objc_msgSend_warping_scheme_icp(*(void **)(a1 + 24), v47, v48, v49);
  panoLog(32, "FrameID:%04d time %.3f: registration settings scales=%d warps=%d reg_term=%.10f prevFrameDropped=%d\n", v22, HostTime, v40, v50, v28, v15);

  return a2;
}

- (uint64_t)_computeRegistration:(double)a3 metadata:(double)a4 initTransform:(uint64_t)a5
{
  id v9 = a7;
  if (*(void *)(a1 + 24))
  {
    int Width = CVPixelBufferGetWidth(a6);
    int Height = CVPixelBufferGetHeight(a6);
    objc_msgSend__resetHomographyFailureFlagToFalse((void *)a1, v12, v13, v14);
    objc_msgSend__resetRetrogradeMotionFlagToFalse((void *)a1, v15, v16, v17);
    objc_msgSend__setRegistrationParams_initTransform_((void *)a1, v18, (uint64_t)v9, v19, a2, a3, a4);
    double v23 = convertCoordMetalToLKT(v20, v21, v22, (float)Width, (float)Height);
    double v58 = v24;
    double v61 = v23;
    double v55 = v25;
    objc_msgSend__logTransform_metadata_message_error_((void *)a1, v26, (uint64_t)v9, (uint64_t)"transform init    ", 0);
    objc_msgSend_estimatePanoRegistration_metadata_initTForm_(*(void **)(a1 + 24), v27, (uint64_t)a6, (uint64_t)v9, v61, v58, v55);
    objc_msgSend_getParametricTransform(*(void **)(a1 + 24), v28, v29, v30);
    int32x4_t v59 = v32;
    int32x4_t v62 = v31;
    int32x4_t v56 = v33;
    objc_msgSend__logTransform_metadata_message_error_((void *)a1, v34, (uint64_t)v9, (uint64_t)"transform computed", 0);
    if (objc_msgSend__isTranslationOutlier_((void *)a1, v35, v36, v37, *(double *)v62.i64, *(double *)v59.i64, *(double *)v56.i64))
    {
      objc_msgSend__setHomographyFailureFlag((void *)a1, v38, v39, v40);
      objc_msgSend__logTransform_metadata_message_error_((void *)a1, v41, (uint64_t)v9, (uint64_t)"transform computed", 1, *(double *)v62.i64, *(double *)v59.i64, *(double *)v56.i64);
    }
    if (objc_msgSend__isRetrogradeMotion_tolerance_((void *)a1, v38, v39, v40, *(double *)v62.i64, *(double *)v59.i64, *(double *)v56.i64, 0.0))objc_msgSend__setRetrogradeMotionFlag((void *)a1, v42, v43, v44); {
    v45.f32[0] = (float)Width;
    }
    double v46 = convertCoordLKTToMetal(v62, v59, v56, v45, (float)Height);
    uint64_t v47 = 0;
    *(_DWORD *)(a1 + 184) = v48;
    *(_DWORD *)(a1 + 200) = v49;
    *(double *)(a1 + 176) = v46;
    *(void *)(a1 + 192) = v50;
    *(_DWORD *)(a1 + 216) = v51;
    *(void *)(a1 + 208) = v52;
  }
  else
  {
    uint64_t v47 = 2;
  }

  return v47;
}

- (__n128)registerNewSlice:(float32x4_t)a3 withHFromGyro:(float32x4_t)a4 registrationCallback:(uint64_t)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a7;
  ImageBuffer = CMSampleBufferGetImageBuffer(a6);
  float32x4_t v32 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 16);
  __n128 v34 = *(__n128 *)MEMORY[0x263EF89A0];
  float32x4_t v30 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 32);
  double v12 = CMGetAttachment(a6, @"MetadataDictionary", 0);
  if (!*(void *)(a1 + 40))
  {
    uint32x4_t v13 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3, v32), (int8x16_t)vceqq_f32(a2, (float32x4_t)v34)), (int8x16_t)vceqq_f32(a4, v30));
    v13.i32[3] = v13.i32[2];
    if ((vminvq_u32(v13) & 0x80000000) == 0)
    {
      uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(void *)(a1 + 40) = ImageBuffer;
    CVPixelBufferRetain(ImageBuffer);
  }
  if (*(unsigned char *)(a1 + 93))
  {
    uint64_t v15 = 0;
    float32x4_t v16 = *(float32x4_t *)(a1 + 176);
    float32x4_t v17 = *(float32x4_t *)(a1 + 192);
    float32x4_t v18 = *(float32x4_t *)(a1 + 208);
    v38[0] = a2;
    v38[1] = a3;
    v38[2] = a4;
    long long v35 = 0u;
    long long v36 = 0u;
    *(_OWORD *)uint64_t v37 = 0u;
    do
    {
      *(long long *)((char *)&v35 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, COERCE_FLOAT(*(_OWORD *)&v38[v15])), v17, *(float32x2_t *)v38[v15].f32, 1), v18, v38[v15], 2);
      ++v15;
    }
    while (v15 != 3);
    int inited = objc_msgSend__computeRegistration_metadata_initTransform_((void *)a1, v11, (uint64_t)ImageBuffer, (uint64_t)v12, *(double *)&v35, *(double *)&v36, v37[0]);
  }
  else
  {
    int inited = objc_msgSend__computeRegistration_metadata_initTransform_((void *)a1, v11, (uint64_t)ImageBuffer, (uint64_t)v12, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64);
  }
  if (!inited)
  {
    __n128 v33 = *(__n128 *)(a1 + 192);
    __n128 v34 = *(__n128 *)(a1 + 176);
    __n128 v31 = *(__n128 *)(a1 + 208);
    if ((objc_msgSend_hasHomographyFailureFlag((void *)a1, v20, v21, v22) & 1) == 0
      && (objc_msgSend_hasRetrogradeMotionFlag((void *)a1, v23, v24, v25) & 1) == 0)
    {
      objc_msgSend_replacePreviousSlice_((void *)a1, v23, (uint64_t)ImageBuffer, v25);
      if (!v9) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    objc_msgSend_resetCurrentFrameIndex(*(void **)(a1 + 24), v23, v24, v25);
    if (v9) {
LABEL_14:
    }
      v9[2](v9, *(void *)(a1 + 120), v34, v33, v31);
  }
LABEL_15:

  return v34;
}

- (void)replacePreviousSlice:(__CVBuffer *)a3
{
  lastSlice = self->_lastSlice;
  if (lastSlice) {
    CVPixelBufferRelease(lastSlice);
  }
  self->_lastSlice = a3;
  CVPixelBufferRetain(a3);
}

- (int)setDirection:(int)a3
{
  self->_direction = a3;
  return 0;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (MTLTexture)RegistrationMask
{
  return self->_RegistrationMask;
}

- (CGRect)roi
{
  double x = self->_roi.origin.x;
  double y = self->_roi.origin.y;
  double width = self->_roi.size.width;
  double height = self->_roi.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)homography
{
  objc_copyStruct(&v2, (const void *)(a1 + 176), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setHomography:(__n128)a3
{
  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 176), v4, 48, 1, 0);
}

- (BOOL)homographyFailure
{
  return self->_homographyFailure;
}

- (void)setHomographyFailure:(BOOL)a3
{
  self->_homographyFailure = a3;
}

- (BOOL)hasRetrogradeMotion
{
  return self->_hasRetrogradeMotion;
}

- (void)setHasRetrogradeMotion:(BOOL)a3
{
  self->_hasRetrogradeMotion = a3;
}

- (__CVBuffer)residualFlow
{
  return self->_residualFlow;
}

- (void)setResidualFlow:(__CVBuffer *)a3
{
  self->_residualFlow = a3;
}

- (MTLTexture)registrationWeights
{
  return (MTLTexture *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRegistrationWeights:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationWeights, 0);
  objc_storeStrong((id *)&self->_RegistrationMask, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_lkt, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end