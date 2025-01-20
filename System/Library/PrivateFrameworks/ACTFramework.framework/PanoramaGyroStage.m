@interface PanoramaGyroStage
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (PanoramaGyroStage)init;
- toHomography;
- (__n128)translationToHomography;
- (double)ISPMotionToHomography;
- (double)transformToHomography;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (int)update:(id)a3 sliceType:(int)a4 sliceWidth:(float)a5 sliceHeight:(float)a6 sliceID:(int)a7;
- (int)updateWithDebugISPMedian:(id *)a3;
- (int)updateWithTransformMatrix:(float *)a3 sliceType:(int)a4;
- (int)updateWithTranslation:(float *)a3 sliceType:(int)a4;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation PanoramaGyroStage

- (PanoramaGyroStage)init
{
  objc_msgSend_resetState(self, a2, v2, v3);
  fig_note_initialize_category_with_default_work();
  return self;
}

- (int)resetState
{
  self->_isTranslationValid = 0;
  *(_OWORD *)self->_translationRate = 0u;
  *(_OWORD *)self->_translation = 0u;
  *(_OWORD *)self->_rotation = 0u;
  self->_curTime = -1.0;
  *(void *)&self->_focalLength = 0x457C000041CD999ALL;
  *(void *)&self->_sliceWidth = 1161625600;
  *(void *)self->_txty = 0;
  *(void *)&self->_txty[8] = 0;
  uint64_t v2 = MEMORY[0x263EF89A0];
  long long v3 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)self->_anon_60 = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self->_anon_60[16] = v3;
  *(_OWORD *)&self->_anon_60[32] = *(_OWORD *)(v2 + 32);
  return 0;
}

- (int)update:(id)a3 sliceType:(int)a4 sliceWidth:(float)a5 sliceHeight:(float)a6 sliceID:(int)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v12 = a3;
  v15 = v12;
  if (!v12)
  {
    LODWORD(BytePtr) = 2;
    goto LABEL_27;
  }
  v16 = objc_msgSend_objectForKey_(v12, v13, @"FocalLenIn35mmFilm", v14);

  if (v16)
  {
    v19 = objc_msgSend_objectForKeyedSubscript_(v15, v17, @"FocalLenIn35mmFilm", v18);
    objc_msgSend_floatValue(v19, v20, v21, v22);
    self->_focalLength = v23 / 17.5;
  }
  self->_sliceHeight = a6;
  self->_sliceWidth = a5;
  self->_motionSource = 0;
  if (!USE_ISP_MOTION)
  {
LABEL_11:
    LODWORD(BytePtr) = 0;
    goto LABEL_12;
  }
  objc_msgSend_objectForKey_(v15, v17, @"DebugMotionDataFromISP", v18);
  BytePtr = (unsigned int *)objc_claimAutoreleasedReturnValue();

  if (BytePtr)
  {
    objc_msgSend_objectForKeyedSubscript_(v15, v17, @"DebugMotionDataFromISP", v18);
    CFDataRef v25 = (const __CFData *)(id)objc_claimAutoreleasedReturnValue();
    BytePtr = (unsigned int *)CFDataGetBytePtr(v25);
    uint64_t v26 = 104 * BytePtr[1] + 8;
    if (CFDataGetLength(v25) == v26 && BytePtr[1] >= 2)
    {
      LODWORD(BytePtr) = objc_msgSend_updateWithDebugISPMedian_(self, v17, (uint64_t)BytePtr, v18);
      if (!BytePtr) {
        self->_motionSource |= 1u;
      }
      double HostTime = getHostTime();
      panoLog(32, "FrameID:%04d time %.3f: gyro updated with debug motion data\n", a7, HostTime);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:
  v28 = objc_msgSend_objectForKey_(v15, v17, @"TransformMatrix", v18);

  if (v28)
  {
    v31 = objc_msgSend_objectForKeyedSubscript_(v15, v29, @"TransformMatrix", v30);
    if (objc_msgSend_length(v31, v32, v33, v34) == 36)
    {
      objc_msgSend_getBytes_length_(v31, v35, (uint64_t)v51, 36);
      LODWORD(BytePtr) = objc_msgSend_updateWithTransformMatrix_sliceType_(self, v36, (uint64_t)v51, v10);
      if (!BytePtr) {
        self->_motionSource |= 2u;
      }
      double v37 = getHostTime();
      panoLog(32, "FrameID:%04d time %.3f: gyro updated with TransformMatrix\n", a7, v37);
    }
  }
  v38 = objc_msgSend_objectForKey_(v15, v29, @"Translation", v30);

  if (v38)
  {
    v41 = objc_msgSend_objectForKeyedSubscript_(v15, v39, @"Translation", v40);
    if (objc_msgSend_length(v41, v42, v43, v44) == 8)
    {
      objc_msgSend_getBytes_length_(v41, v45, (uint64_t)v51, 8);
      LODWORD(BytePtr) = objc_msgSend_updateWithTranslation_sliceType_(self, v46, (uint64_t)v51, v10);
      if (!BytePtr) {
        self->_motionSource |= 4u;
      }
      double v47 = getHostTime();
      panoLog(32, "FrameID:%04d time %.3f: gyro updated with txty = %f %f\n", a7, v47, v51[0], v51[1]);
    }
  }
  if (!self->_motionSource)
  {
    v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    double v49 = getHostTime();
    panoLog(4, "FrameID:%04d time %.3f: NO motion data available\n", a7, v49);
  }
LABEL_27:

  return (int)BytePtr;
}

- (int)updateWithTranslation:(float *)a3 sliceType:(int)a4
{
  *(void *)&long long v4 = *(void *)a3;
  if (a4) {
    float32x2_t v5 = vsub_f32(*(float32x2_t *)&v4, *(float32x2_t *)self->_txty);
  }
  else {
    float32x2_t v5 = 0;
  }
  *((float32x2_t *)&v4 + 1) = v5;
  *(_OWORD *)self->_txty = v4;
  return 0;
}

- (int)updateWithTransformMatrix:(float *)a3 sliceType:(int)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v5 = 0;
      anon_60 = self->_anon_60;
      do
      {
        *(float *)&anon_60[4 * i] = a3[v5++];
        anon_60 += 16;
      }
      while (v5 != 3);
      a3 += 3;
    }
  }
  return 0;
}

- (int)updateWithDebugISPMedian:(id *)a3
{
  uint64_t var1 = a3->var1;
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  v260 = objc_msgSend_initWithCapacity_(v5, v6, var1, v7);
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  v261 = objc_msgSend_initWithCapacity_(v8, v9, var1, v10);
  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  v263 = objc_msgSend_initWithCapacity_(v11, v12, var1, v13);
  id v14 = objc_alloc(MEMORY[0x263EFF980]);
  v267 = objc_msgSend_initWithCapacity_(v14, v15, var1, v16);
  id v17 = objc_alloc(MEMORY[0x263EFF980]);
  v269 = objc_msgSend_initWithCapacity_(v17, v18, var1, v19);
  id v20 = objc_alloc(MEMORY[0x263EFF980]);
  v272 = objc_msgSend_initWithCapacity_(v20, v21, var1, v22);
  unsigned int v258 = var1;
  if (var1)
  {
    unsigned int v266 = 0;
    p_var21 = &a3->var2[0].var3.var2.var21;
    double v26 = 0.0;
    do
    {
      int v28 = *(p_var21 - 14);
      int v27 = *(p_var21 - 13);
      int v273 = *(p_var21 - 12);
      int v30 = *(p_var21 - 7);
      int v29 = *(p_var21 - 6);
      int v31 = *(p_var21 - 5);
      int v32 = *((unsigned __int16 *)p_var21 - 8);
      int v33 = *(p_var21 - 2);
      int v275 = *(p_var21 - 1);
      int v277 = *p_var21;
      int64_t v34 = FigHostTimeToNanoseconds();
      CMTimeMake(&time, v34, 1000000000);
      Float64 Seconds = CMTimeGetSeconds(&time);
      double v39 = Seconds;
      if (v32 == 1)
      {
        *(float *)&Float64 Seconds = -(float)(v30 - v28);
        uint64_t v40 = objc_msgSend_numberWithFloat_(NSNumber, v35, v36, v37, Seconds);
        objc_msgSend_addObject_(v260, v41, (uint64_t)v40, v42);

        *(float *)&double v43 = -(float)(v29 - v27);
        double v47 = objc_msgSend_numberWithFloat_(NSNumber, v44, v45, v46, v43);
        objc_msgSend_addObject_(v261, v48, (uint64_t)v47, v49);

        *(float *)&double v50 = (float)(v31 - v273);
        v54 = objc_msgSend_numberWithFloat_(NSNumber, v51, v52, v53, v50);
        objc_msgSend_addObject_(v263, v55, (uint64_t)v54, v56);

        ++v266;
      }
      double v26 = v26 + v39;
      p_var21 += 26;
      *(float *)&Float64 Seconds = -(float)v33;
      v57 = objc_msgSend_numberWithFloat_(NSNumber, v35, v36, v37, Seconds);
      objc_msgSend_addObject_(v267, v58, (uint64_t)v57, v59);

      *(float *)&double v60 = -(float)v275;
      v64 = objc_msgSend_numberWithFloat_(NSNumber, v61, v62, v63, v60);
      objc_msgSend_addObject_(v269, v65, (uint64_t)v64, v66);

      *(float *)&double v67 = -(float)v277;
      v71 = objc_msgSend_numberWithFloat_(NSNumber, v68, v69, v70, v67);
      objc_msgSend_addObject_(v272, v72, (uint64_t)v71, v73);

      --var1;
    }
    while (var1);
  }
  else
  {
    unsigned int v266 = 0;
    double v26 = 0.0;
  }
  v74 = self;
  double v75 = v26 / (double)v258;
  double curTime = self->_curTime;
  float v77 = v75 - curTime;
  BOOL v78 = curTime <= 0.0;
  float v79 = 0.0333;
  if (!v78) {
    float v79 = v77;
  }
  float v278 = v79;
  self->_double curTime = v75;
  v80 = objc_msgSend_sortedArrayUsingSelector_(v260, v23, (uint64_t)sel_compare_, v24);
  v84 = objc_msgSend_mutableCopy(v80, v81, v82, v83);

  v87 = objc_msgSend_sortedArrayUsingSelector_(v261, v85, (uint64_t)sel_compare_, v86);
  v91 = objc_msgSend_mutableCopy(v87, v88, v89, v90);

  v94 = objc_msgSend_sortedArrayUsingSelector_(v263, v92, (uint64_t)sel_compare_, v93);
  v98 = objc_msgSend_mutableCopy(v94, v95, v96, v97);

  uint64_t v101 = v266 >> 1;
  v274 = v98;
  v276 = v91;
  if (v266)
  {
    v147 = objc_msgSend_objectAtIndex_(v84, v99, v266 >> 1, v100);
    objc_msgSend_floatValue(v147, v148, v149, v150);
    v265.i64[0] = v151;

    v154 = objc_msgSend_objectAtIndex_(v91, v152, v101, v153);
    objc_msgSend_floatValue(v154, v155, v156, v157);
    float v264 = v158;

    v134 = objc_msgSend_objectAtIndex_(v98, v159, v101, v160);
    objc_msgSend_floatValue(v134, v161, v162, v163);
    float v262 = v164;
  }
  else
  {
    v102 = objc_msgSend_objectAtIndex_(v84, v99, (v101 - 1), v100);
    objc_msgSend_floatValue(v102, v103, v104, v105);
    float v107 = v106;
    objc_msgSend_objectAtIndex_(v84, v108, v101, v109);
    v111 = v110 = v84;
    objc_msgSend_floatValue(v111, v112, v113, v114);
    v116.f32[0] = (float)(v107 + v115) * 0.5;
    float32x4_t v265 = v116;

    v119 = objc_msgSend_objectAtIndex_(v91, v117, (v101 - 1), v118);
    objc_msgSend_floatValue(v119, v120, v121, v122);
    float v124 = v123;
    v127 = objc_msgSend_objectAtIndex_(v91, v125, v101, v126);
    objc_msgSend_floatValue(v127, v128, v129, v130);
    float v264 = (float)(v124 + v131) * 0.5;

    v84 = v110;
    v134 = objc_msgSend_objectAtIndex_(v98, v132, (v101 - 1), v133);
    objc_msgSend_floatValue(v134, v135, v136, v137);
    float v139 = v138;
    v142 = objc_msgSend_objectAtIndex_(v98, v140, v101, v141);
    objc_msgSend_floatValue(v142, v143, v144, v145);
    float v262 = (float)(v139 + v146) * 0.5;
  }
  float32x4_t v165 = v265;
  v165.f32[1] = v264;
  v165.f32[2] = v262;
  float32x4_t v166 = vmulq_f32(vmulq_f32(v165, (float32x4_t)vdupq_n_s32(0x411CCCCDu)), (float32x4_t)vdupq_n_s32(0x37800000u));
  v167.i64[0] = 0x3F0000003F000000;
  v167.i64[1] = 0x3F0000003F000000;
  float32x4_t v168 = vmulq_n_f32(vmlaq_n_f32(*(float32x4_t *)self->_translationRate, vmulq_f32(v166, v167), v278), v278);
  *(float32x4_t *)self->_translationRate = vmlaq_n_f32(*(float32x4_t *)self->_translationRate, v166, v278);
  *(float32x4_t *)self->_translation = v168;
  v171 = objc_msgSend_sortedArrayUsingSelector_(v267, v169, (uint64_t)sel_compare_, v170);
  v175 = objc_msgSend_mutableCopy(v171, v172, v173, v174);

  v178 = objc_msgSend_sortedArrayUsingSelector_(v269, v176, (uint64_t)sel_compare_, v177);
  v182 = objc_msgSend_mutableCopy(v178, v179, v180, v181);

  v185 = objc_msgSend_sortedArrayUsingSelector_(v272, v183, (uint64_t)sel_compare_, v184);
  v189 = objc_msgSend_mutableCopy(v185, v186, v187, v188);

  unsigned int v192 = v258 >> 1;
  if (v258)
  {
    v237 = objc_msgSend_objectAtIndex_(v175, v190, v192, v191);
    objc_msgSend_floatValue(v237, v238, v239, v240);
    v271.i64[0] = v241;

    v244 = objc_msgSend_objectAtIndex_(v182, v242, v192, v243);
    objc_msgSend_floatValue(v244, v245, v246, v247);
    float v270 = v248;

    v224 = objc_msgSend_objectAtIndex_(v189, v249, v192, v250);
    objc_msgSend_floatValue(v224, v251, v252, v253);
    float v268 = v254;
  }
  else
  {
    v193 = objc_msgSend_objectAtIndex_(v175, v190, v192 - 1, v191);
    objc_msgSend_floatValue(v193, v194, v195, v196);
    float v198 = v197;
    v201 = objc_msgSend_objectAtIndex_(v175, v199, v192, v200);
    objc_msgSend_floatValue(v201, v202, v203, v204);
    v206.f32[0] = (float)(v198 + v205) * 0.5;
    float32x4_t v271 = v206;

    v209 = objc_msgSend_objectAtIndex_(v182, v207, v192 - 1, v208);
    objc_msgSend_floatValue(v209, v210, v211, v212);
    float v214 = v213;
    v217 = objc_msgSend_objectAtIndex_(v182, v215, v192, v216);
    objc_msgSend_floatValue(v217, v218, v219, v220);
    float v270 = (float)(v214 + v221) * 0.5;

    v74 = self;
    v224 = objc_msgSend_objectAtIndex_(v189, v222, v192 - 1, v223);
    objc_msgSend_floatValue(v224, v225, v226, v227);
    float v229 = v228;
    v232 = objc_msgSend_objectAtIndex_(v189, v230, v192, v231);
    objc_msgSend_floatValue(v232, v233, v234, v235);
    float v268 = (float)(v229 + v236) * 0.5;
  }
  float32x4_t v255 = v271;
  v255.f32[1] = v270;
  v255.f32[2] = v268;
  float32x4_t v256 = vmulq_n_f32(vmulq_f32(v255, (float32x4_t)vdupq_n_s32(0x37800000u)), v278);
  *(float32x4_t *)v74->_rotation = v256;
  if (!v74->_isTranslationValid) {
    *(_OWORD *)v74->_translation = COERCE_UNSIGNED_INT(vmuls_lane_f32(0.1, *(float32x2_t *)v256.f32, 1));
  }

  return 0;
}

- toHomography
{
  int v4;

  long long v4 = result[39];
  if (v4) {
    return (_DWORD *)objc_msgSend_ISPMotionToHomography(result, a2, a3, a4);
  }
  if ((v4 & 4) != 0) {
    return (_DWORD *)objc_msgSend_translationToHomography(result, a2, a3, a4);
  }
  return result;
}

- (double)transformToHomography
{
  uint64_t v7 = 0;
  long long v9 = *MEMORY[0x263EF89A0];
  float32x4_t v8 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 16);
  LODWORD(v10) = a1[9].i32[1];
  a7.f32[0] = 1.0 / *(float *)&v10;
  DWORD1(v10) = HIDWORD(*MEMORY[0x263EF89A0]);
  DWORD2(v10) = *(void *)(MEMORY[0x263EF89A0] + 8);
  LODWORD(v11) = v8.i32[0];
  DWORD1(v11) = a1[9].i32[2];
  DWORD2(v11) = *(void *)(MEMORY[0x263EF89A0] + 24);
  a7.i32[1] = DWORD1(v10);
  a7.i32[2] = DWORD2(v10);
  float32x4_t v13 = v8;
  v13.f32[1] = 1.0 / *((float *)&v11 + 1);
  float32x4_t v12 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 32);
  v13.i32[2] = DWORD2(v11);
  float32x4_t v20 = a1[8];
  float32x4_t v21 = 0u;
  float32x4_t v22 = 0u;
  float32x4_t v23 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v21 + v7 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a7, COERCE_FLOAT(v19[v7])), v13, *(float32x2_t *)&v19[v7], 1), v12, (float32x4_t)v19[v7], 2);
    ++v7;
  }
  while (v7 != 3);
  uint64_t v14 = 0;
  HIDWORD(v10) = HIDWORD(v9);
  HIDWORD(v11) = v8.i32[3];
  float32x4_t v15 = v21;
  float32x4_t v16 = v22;
  float32x4_t v17 = v23;
  v19[0] = v10;
  v19[1] = v11;
  float32x4_t v20 = v12;
  float32x4_t v21 = 0u;
  float32x4_t v22 = 0u;
  float32x4_t v23 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v21 + v14 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(v19[v14])), v16, *(float32x2_t *)&v19[v14], 1), v17, (float32x4_t)v19[v14], 2);
    ++v14;
  }
  while (v14 != 3);
  return *(double *)v21.i64;
}

- (__n128)translationToHomography
{
  return *(__n128 *)MEMORY[0x263EF89A0];
}

- (double)ISPMotionToHomography
{
  __float2 v2 = __sincosf_stret(*(float *)(a1 + 64));
  __int32 cosval_low = LODWORD(v2.__cosval);
  LODWORD(v42) = *(void *)&v2;
  __float2 v3 = __sincosf_stret(*(float *)(a1 + 68));
  unint64_t v4 = (unint64_t)__sincosf_stret(*(float *)(a1 + 72));
  uint64_t v5 = 0;
  v6.i32[0] = 0;
  v6.i32[3] = 0;
  v6.i32[1] = cosval_low;
  v7.i32[0] = 0;
  v7.i32[3] = 0;
  v7.f32[1] = v42;
  v8.i64[0] = LODWORD(v3.__cosval);
  v8.i64[1] = LODWORD(v3.__sinval);
  v9.i32[1] = 0;
  v9.f32[0] = -v3.__sinval;
  v9.i64[1] = LODWORD(v3.__cosval);
  v10.i64[1] = 0;
  v10.i32[0] = HIDWORD(v4);
  v46.columns[0] = v8;
  v46.columns[1] = (simd_float3)xmmword_235A11360;
  v46.columns[2] = v9;
  simd_float3 v47 = 0u;
  simd_float3 v48 = 0u;
  simd_float3 v49 = 0u;
  do
  {
    v10.f32[1] = -*(float *)&v4;
    *(float32x4_t *)((char *)&v47 + v5 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(*(_OWORD *)&v46.columns[v5])), (float32x4_t)v4, *(float32x2_t *)v46.columns[v5].f32, 1), (float32x4_t)xmmword_235A11350, (float32x4_t)v46.columns[v5], 2);
    ++v5;
  }
  while (v5 != 3);
  uint64_t v11 = 0;
  v6.f32[2] = -v42;
  v7.i32[2] = cosval_low;
  float32x4_t v12 = (float32x4_t)v47;
  float32x4_t v13 = (float32x4_t)v48;
  float32x4_t v14 = (float32x4_t)v49;
  v46.columns[0] = (simd_float3)xmmword_235A11370;
  v46.columns[1] = v6;
  v46.columns[2] = v7;
  simd_float3 v47 = 0u;
  simd_float3 v48 = 0u;
  simd_float3 v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v11 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(*(_OWORD *)&v46.columns[v11])), v13, *(float32x2_t *)v46.columns[v11].f32, 1), v14, (float32x4_t)v46.columns[v11], 2);
    ++v11;
  }
  while (v11 != 3);
  uint64_t v15 = 0;
  float32x4_t v16 = (float32x4_t)v47;
  float32x4_t v17 = (float32x4_t)v48;
  float32x4_t v18 = (float32x4_t)v49;
  long long v19 = *(_OWORD *)(a1 + 48);
  v20.i32[0] = 0;
  v20.i32[3] = 0;
  *(uint64_t *)((char *)v20.i64 + 4) = HIDWORD(*(void *)(a1 + 48));
  v21.i32[3] = 0;
  v22.i64[0] = 0;
  v22.i64[1] = *(void *)(a1 + 56);
  v46.columns[0] = (simd_float3)v19;
  v46.columns[1] = v20;
  v46.columns[2] = v22;
  simd_float3 v47 = 0u;
  simd_float3 v48 = 0u;
  simd_float3 v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v15 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)&v46.columns[v15])), v18, *(float32x2_t *)v46.columns[v15].f32, 1), v18, (float32x4_t)v46.columns[v15], 2);
    ++v15;
  }
  while (v15 != 3);
  uint64_t v23 = 0;
  float32x4_t v24 = vmulq_n_f32(v18, 1.0 - *((float *)&v19 + 2));
  float32x4_t v25 = vaddq_f32(vmulq_n_f32(v16, 1.0 - *((float *)&v19 + 2)), (float32x4_t)v47);
  float32x4_t v26 = vaddq_f32(vmulq_n_f32(v17, 1.0 - *((float *)&v19 + 2)), (float32x4_t)v48);
  long long v28 = *MEMORY[0x263EF89A0];
  float32x4_t v27 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 16);
  v18.i32[0] = v27.i32[0];
  v18.i32[1] = *(_DWORD *)(a1 + 144);
  v30.f32[0] = v18.f32[1] * (float)(*(float *)(a1 + 148) / *(float *)(a1 + 152));
  float32x4_t v31 = v27;
  v31.f32[1] = 1.0 / v18.f32[1];
  float32x4_t v29 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 32);
  v21.f32[0] = 1.0 / v30.f32[0];
  v30.i32[1] = HIDWORD(*MEMORY[0x263EF89A0]);
  v30.i32[2] = *(void *)(MEMORY[0x263EF89A0] + 8);
  v18.i32[2] = *(void *)(MEMORY[0x263EF89A0] + 24);
  v21.i32[1] = v30.i32[1];
  v21.i32[2] = v30.i32[2];
  v31.i32[2] = v18.i32[2];
  v46.columns[0] = (simd_float3)v25;
  v46.columns[1] = (simd_float3)v26;
  v46.columns[2] = (simd_float3)vaddq_f32(v24, (float32x4_t)v49);
  simd_float3 v47 = 0u;
  simd_float3 v48 = 0u;
  simd_float3 v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v23 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)&v46.columns[v23])), v31, *(float32x2_t *)v46.columns[v23].f32, 1), v29, (float32x4_t)v46.columns[v23], 2);
    ++v23;
  }
  while (v23 != 3);
  uint64_t v32 = 0;
  v30.i32[3] = HIDWORD(v28);
  v18.i32[3] = v27.i32[3];
  float32x4_t v33 = (float32x4_t)v47;
  float32x4_t v34 = (float32x4_t)v48;
  float32x4_t v35 = (float32x4_t)v49;
  v46.columns[0] = v30;
  v46.columns[1] = (simd_float3)v18;
  v46.columns[2] = (simd_float3)v29;
  simd_float3 v47 = 0u;
  simd_float3 v48 = 0u;
  simd_float3 v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v32 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, COERCE_FLOAT(*(_OWORD *)&v46.columns[v32])), v34, *(float32x2_t *)v46.columns[v32].f32, 1), v35, (float32x4_t)v46.columns[v32], 2);
    ++v32;
  }
  while (v32 != 3);
  int32x4_t v36 = vzip1q_s32((int32x4_t)v47, (int32x4_t)v48);
  v36.i32[2] = v49.i32[0];
  int32x4_t v37 = vzip2q_s32((int32x4_t)v47, (int32x4_t)v48);
  v37.i32[2] = v49.i32[2];
  float32x4_t v44 = (float32x4_t)v37;
  float32x4_t v45 = (float32x4_t)v36;
  float32x4_t v43 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v47, (int32x4_t)v49), vdupq_lane_s32(*(int32x2_t *)v48.f32, 1));
  simd_float3x3 v50 = __invert_f3(*(simd_float3x3 *)byte_235A11750);
  uint64_t v38 = 0;
  simd_float3x3 v46 = v50;
  simd_float3 v47 = 0u;
  simd_float3 v48 = 0u;
  simd_float3 v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v38 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)&v46.columns[v38])), v43, *(float32x2_t *)v46.columns[v38].f32, 1), v44, (float32x4_t)v46.columns[v38], 2);
    ++v38;
  }
  while (v38 != 3);
  uint64_t v39 = 0;
  v46.columns[0] = v47;
  v46.columns[1] = v48;
  v46.columns[2] = v49;
  simd_float3 v47 = 0u;
  simd_float3 v48 = 0u;
  simd_float3 v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v39 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_235A11720, COERCE_FLOAT(*(_OWORD *)&v46.columns[v39])), (float32x4_t)xmmword_235A11730, *(float32x2_t *)v46.columns[v39].f32, 1), (float32x4_t)xmmword_235A11740, (float32x4_t)v46.columns[v39], 2);
    ++v39;
  }
  while (v39 != 3);
  *(void *)&double result = vmulq_n_f32((float32x4_t)v47, 1.0 / v49.f32[2]).u64[0];
  return result;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
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

- (int)setup
{
  return 0;
}

- (int)finishProcessing
{
  return 0;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
}

@end