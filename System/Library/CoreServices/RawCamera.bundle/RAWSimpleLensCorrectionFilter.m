@interface RAWSimpleLensCorrectionFilter
+ (id)customAttributes;
- (id)customAttributes;
- (id)outputImage;
@end

@implementation RAWSimpleLensCorrectionFilter

+ (id)customAttributes
{
  v35[4] = *MEMORY[0x1E4F143B8];
  v34[0] = @"inputDistortionScaleHalfMinorRadius";
  uint64_t v3 = *MEMORY[0x1E4F1E0E8];
  v26[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v2 = v26[0];
  v26[1] = v3;
  v32[0] = &unk_1F39AFCB8;
  v32[1] = &unk_1F39AFCC8;
  uint64_t v5 = *MEMORY[0x1E4F1E0D0];
  uint64_t v27 = *MEMORY[0x1E4F1E0E0];
  uint64_t v4 = v27;
  uint64_t v28 = v5;
  v32[2] = &unk_1F39AFCD8;
  v32[3] = &unk_1F39AFCE8;
  uint64_t v7 = *MEMORY[0x1E4F1E0C8];
  uint64_t v29 = *MEMORY[0x1E4F1E098];
  uint64_t v6 = v29;
  uint64_t v30 = v7;
  v32[4] = &unk_1F39AFCF8;
  v32[5] = &unk_1F39AFCF8;
  uint64_t v31 = *MEMORY[0x1E4F1E0F0];
  uint64_t v8 = v31;
  uint64_t v33 = *MEMORY[0x1E4F1E158];
  uint64_t v9 = v33;
  v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v32, (uint64_t)v26, 7);
  v35[0] = v19;
  v34[1] = @"inputDistortionScaleMinorRadius";
  v24[0] = v2;
  v24[1] = v3;
  v25[0] = &unk_1F39AFCB8;
  v25[1] = &unk_1F39AFCC8;
  v24[2] = v4;
  v24[3] = v5;
  v25[2] = &unk_1F39AFCD8;
  v25[3] = &unk_1F39AFCE8;
  v24[4] = v6;
  v24[5] = v7;
  v25[4] = &unk_1F39AFCF8;
  v25[5] = &unk_1F39AFCF8;
  v24[6] = v8;
  v25[6] = v9;
  v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v25, (uint64_t)v24, 7);
  v35[1] = v18;
  v34[2] = @"inputDistortionScaleMajorRadius";
  v22[0] = v2;
  v22[1] = v3;
  v23[0] = &unk_1F39AFCB8;
  v23[1] = &unk_1F39AFCC8;
  v22[2] = v4;
  v22[3] = v5;
  v23[2] = &unk_1F39AFCD8;
  v23[3] = &unk_1F39AFCE8;
  v22[4] = v6;
  v22[5] = v7;
  v23[4] = &unk_1F39AFCF8;
  v23[5] = &unk_1F39AFCF8;
  v22[6] = v8;
  v23[6] = v9;
  v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v23, (uint64_t)v22, 7);
  v35[2] = v12;
  v34[3] = @"inputDistortionScaleMaxRadius";
  v20[0] = v2;
  v20[1] = v3;
  v21[0] = &unk_1F39AFCB8;
  v21[1] = &unk_1F39AFCC8;
  v20[2] = v4;
  v20[3] = v5;
  v21[2] = &unk_1F39AFCD8;
  v21[3] = &unk_1F39AFCE8;
  v20[4] = v6;
  v20[5] = v7;
  v21[4] = &unk_1F39AFCF8;
  v21[5] = &unk_1F39AFCF8;
  v20[6] = v8;
  v21[6] = v9;
  v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v21, (uint64_t)v20, 7);
  v35[3] = v14;
  v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v35, (uint64_t)v34, 4);

  return v16;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputImage
{
  uint64_t v251 = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWSimpleLensCorrectionFilter", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v244[0] = MEMORY[0x1E4F143A8];
    v244[1] = 3221225472;
    v244[2] = sub_1DDAF4FD8;
    v244[3] = &unk_1E6D04A58;
    v244[4] = self;
    v217 = (void (**)(void))MEMORY[0x1E01C46E0](v244);
    objc_msgSend_extent(self->inputImage, v5, v6, v7, v8);
    double v224 = v10;
    double v225 = v9;
    long double v222 = v12;
    long double v223 = v11;
    *(float *)&double v9 = v11;
    float v13 = *(float *)&v9 * 0.5;
    *(float *)&double v10 = v12;
    float v14 = *(float *)&v10 * 0.5;
    if (v13 >= v14) {
      float v15 = v14;
    }
    else {
      float v15 = v13;
    }
    if (v13 <= v14) {
      float v16 = v14;
    }
    else {
      float v16 = v13;
    }
    float v17 = hypotf(v13, v14);
    *(_DWORD *)buf = 0;
    float v18 = (float)(v15 * 0.5) / v17;
    float v19 = v15 / v17;
    v250.i64[0] = __PAIR64__(LODWORD(v19), LODWORD(v18));
    float v20 = v16 / v17;
    v250.f32[2] = v16 / v17;
    v250.i32[3] = 1065353216;
    int v247 = 0;
    *(void *)v246 = 0;
    *(void *)&v246[8] = 0;
    objc_msgSend_floatValue(self->inputDistortionScaleHalfMinorRadius, v21, v22, v23, v24);
    float v26 = v25 * v18;
    v248.f32[0] = v25 * v18;
    objc_msgSend_floatValue(self->inputDistortionScaleMinorRadius, v27, v28, v29, v30);
    float v32 = fminf(v31, 1.0) * v19;
    v248.f32[1] = v32;
    objc_msgSend_floatValue(self->inputDistortionScaleMajorRadius, v33, v34, v35, v36);
    float v38 = fminf(v37, 1.0) * v20;
    v248.f32[2] = v38;
    objc_msgSend_floatValue(self->inputDistortionScaleMaxRadius, v39, v40, v41, v42);
    float v44 = fminf(v43, 1.0);
    v248.f32[3] = v44;
    v45 = malloc_type_calloc(5uLL, 4uLL, 0x100004052888210uLL);
    v46 = malloc_type_calloc(5uLL, 4uLL, 0x100004052888210uLL);
    v47 = v46;
    uint64_t v48 = 0;
    _DWORD *v46 = 0;
    _DWORD *v45 = 0;
    float v49 = v26;
    float v50 = v18;
    do
    {
      float v51 = *(float *)&buf[v48 * 4];
      float v52 = v50 - v51;
      float v53 = v250.f32[v48 + 1];
      float v54 = v53 - v51;
      float v55 = v248.f32[v48 + 1];
      float v56 = (float)(v55 - v49) / (float)(v53 - v50);
      float v57 = (float)((float)(v52 / v54) * *(float *)&v45[v48]) + 2.0;
      float v58 = (float)(v49 - *(float *)((char *)&v247 + v48 * 4)) / v52;
      *(float *)&v45[v48 + 1] = (float)((float)(v52 / v54) + -1.0) / v57;
      *(float *)&v46[v48 + 1] = (float)((float)((float)((float)(v56 - v58) * 6.0) / v54)
                                      - (float)((float)(v52 / v54) * *(float *)&v46[v48]))
                              / v57;
      ++v48;
      float v49 = v55;
      float v50 = v53;
    }
    while (v48 != 3);
    float v218 = v26;
    *(_DWORD *)&v246[16] = 0;
    float v59 = 0.0;
    do
    {
      float v59 = *(float *)&v46[v48] + (float)(*(float *)&v45[v48] * v59);
      *(float *)&v246[v48 * 4] = v59;
      --v48;
    }
    while (v48 != -1);
    v60 = (const float *)v246;
    int8x16_t v61 = (int8x16_t)vld1q_dup_f32(v60);
    float32x4_t v62 = vsubq_f32(v250, (float32x4_t)vextq_s8((int8x16_t)0, (int8x16_t)v250, 0xCuLL));
    __asm { FMOV            V3.4S, #3.0 }
    float32x4_t v68 = vdivq_f32((float32x4_t)vextq_s8(v61, *(int8x16_t *)&v246[4], 0xCuLL), _Q3);
    __asm { FMOV            V3.4S, #6.0 }
    float32x4_t v230 = vmlsq_f32(vdivq_f32(vsubq_f32(v248, (float32x4_t)vextq_s8((int8x16_t)0, (int8x16_t)v248, 0xCuLL)), v62), vaddq_f32(v68, vdivq_f32(*(float32x4_t *)&v246[4], _Q3)), v62);
    float v226 = v44;
    float v228 = v38;
    float v70 = v44 - v38;
    float v71 = *(float *)&v246[12] / 6.0;
    float v72 = *(float *)&v246[16] / 3.0;
    free(v45);
    free(v47);
    _V6.D[1] = v230.i64[1];
    _S4 = 981668463;
    __asm { FMLA            S1, S4, V6.S[2] }
    if (_S1 <= (float)(v19 + 0.001)) {
      float v214 = v230.f32[2];
    }
    else {
      float v214 = (float)((float)(v19 + 0.001) - v32) / 0.001;
    }
    __asm { FMLA            S3, S4, V6.S[3] }
    if (_S3 <= (float)(v20 + 0.001)) {
      float v80 = v230.f32[3];
    }
    else {
      float v80 = (float)((float)(v20 + 0.001) - v228) / 0.001;
    }
    float v81 = (float)(v70 / (float)(1.0 - v20)) + (float)((float)(1.0 - v20) * (float)(v71 + v72));
    if ((float)(v228 + (float)(v80 * -0.001)) > (float)(v20 + -0.001)) {
      float v80 = (float)((float)(v20 + -0.001) - v228) / -0.001;
    }
    float v212 = v80;
    if ((float)(v226 + (float)(v81 * -0.001)) > 0.999) {
      float v81 = (float)(0.999 - v226) / -0.001;
    }
    v221 = objc_msgSend_kernelWithName_(LCKernels, v73, @"simpleLens", v74, v75);
    v220 = objc_msgSend_kernelWithName_(LCKernels, v82, @"simpleLensDraft", v83, v84);
    float v85 = hypot(v223, v222);
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v86, v87, v88, v89, (double)(v225 + v223 * 0.5), (double)(v224 + v222 * 0.5), (float)(2.0 / v85), 1.0);
    v210 = double v90 = v20;
    v216 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v91, v92, v93, v94, v18, v19, v20, 1.0);
    sub_1DDAF5060(0.0, 0.0, v230.f32[0], v18, v218, v230.f32[1], (uint64_t)v216, v95, v96, v97, v98);
    double v99 = v32;
    v209 = double v100 = v214;
    v215 = sub_1DDAF5060(v18, v218, v230.f32[1], v19, v99, v214, (uint64_t)v209, v101, v102, v103, v104);
    double v105 = v212;
    v213 = sub_1DDAF5060(v19, v99, v100, v90, v228, v212, (uint64_t)v215, v106, v107, v108, v109);
    v114 = sub_1DDAF5060(v90, v228, v105, 1.0, v226, v81, (uint64_t)v213, v110, v111, v112, v113);
    v237[0] = MEMORY[0x1E4F143A8];
    v237[1] = 3221225472;
    v237[2] = sub_1DDAF5168;
    v237[3] = &unk_1E6D053E8;
    id v115 = v210;
    id v238 = v115;
    id v227 = v209;
    id v239 = v227;
    id v229 = v215;
    id v240 = v229;
    id v116 = v213;
    id v241 = v116;
    id v231 = v114;
    id v242 = v231;
    id v219 = v216;
    id v243 = v219;
    v117 = (void *)MEMORY[0x1E01C46E0](v237);
    v234[0] = MEMORY[0x1E4F143A8];
    v234[1] = 3221225472;
    v234[2] = sub_1DDAF52FC;
    v234[3] = &unk_1E6D05410;
    id v118 = v115;
    id v235 = v118;
    v119 = v117;
    id v236 = v119;
    v211 = (void *)MEMORY[0x1E01C46E0](v234);
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB8B1E8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EAB8B1E8))
    {
      byte_1EAB8B1E0 = getenv("RAWCAMERA_SIMPLELENSCORRECTION_LOGGING") != 0;
      __cxa_guard_release(&qword_1EAB8B1E8);
    }
    if (byte_1EAB8B1E0)
    {
      objc_msgSend_floatValue(self->inputFocalLength, v120, v121, v122, v123);
      printf("%g, array(", v124);
      float v125 = v119[2](v119, 0.001);
      printf("0.0, %.5f, ", (float)(v125 / 0.001));
      float v126 = v250.f32[0];
      float v127 = v250.f32[0] * 0.5;
      float v128 = v119[2](v119, v250.f32[0] * 0.5);
      printf("%.5f, %.5f, ", v127, (float)(v128 / v127));
      float v129 = v248.f32[0];
      printf("%.5f, %.5f, ", v126, (float)(v248.f32[0] / v126));
      float v130 = v250.f32[1];
      float v131 = (float)(v126 + v250.f32[1]) * 0.5;
      float v132 = v119[2](v119, v131);
      printf("%.5f, %.5f, ", v131, (float)(v132 / v131));
      float v133 = v248.f32[1];
      printf("%.5f, %.5f, ", v130, (float)(v248.f32[1] / v130));
      float v134 = v250.f32[2];
      float v135 = (float)(v130 + v250.f32[2]) * 0.5;
      float v136 = v119[2](v119, v135);
      printf("%.5f, %.5f, ", v135, (float)(v136 / v135));
      float v137 = v248.f32[2];
      printf("%.5f, %.5f, ", v134, (float)(v248.f32[2] / v134));
      float v138 = v250.f32[3];
      float v139 = (float)(v134 + v250.f32[3]) * 0.5;
      float v140 = v119[2](v119, v139);
      printf("%.5f, %.5f, ", v139, (float)(v140 / v139));
      float v141 = v248.f32[3];
      printf("1.0, %.5f", (float)(v248.f32[3] / v138));
      objc_msgSend_floatValue(self->inputDistortionScaleHalfMinorRadius, v142, v143, v144, v145);
      v248.f32[0] = v129 * v146;
      objc_msgSend_floatValue(self->inputDistortionScaleMinorRadius, v147, v148, v149, v150);
      v248.f32[1] = v133 * fminf(v151, 1.0);
      objc_msgSend_floatValue(self->inputDistortionScaleMajorRadius, v152, v153, v154, v155);
      v248.f32[2] = v137 * fminf(v156, 1.0);
      objc_msgSend_floatValue(self->inputDistortionScaleMaxRadius, v157, v158, v159, v160);
      v248.f32[3] = v141 * fminf(v161, 1.0);
      printf(") <!-- ");
      objc_msgSend_floatValue(self->inputDistortionScaleHalfMinorRadius, v162, v163, v164, v165);
      printf("%.4f ", v166);
      objc_msgSend_floatValue(self->inputDistortionScaleMinorRadius, v167, v168, v169, v170);
      printf("%.4f ", fminf(v171, 1.0));
      objc_msgSend_floatValue(self->inputDistortionScaleMajorRadius, v172, v173, v174, v175);
      printf("%.4f ", fminf(v176, 1.0));
      objc_msgSend_floatValue(self->inputDistortionScaleMaxRadius, v177, v178, v179, v180);
      printf("%.4f ", fminf(v181, 1.0));
      puts("-->");
    }
    v232[0] = MEMORY[0x1E4F143A8];
    v232[1] = 3221225472;
    v232[2] = sub_1DDAF53C4;
    v232[3] = &unk_1E6D05438;
    id v182 = v211;
    id v233 = v182;
    v183 = (void *)MEMORY[0x1E01C46E0](v232);
    v188 = objc_msgSend_imageByClampingToExtent(self->inputImage, v184, v185, v186, v187);
    int v193 = objc_msgSend_BOOLValue(self->inputDraftMode, v189, v190, v191, v192);
    double v194 = *MEMORY[0x1E4F1DB10];
    double v195 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v196 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v197 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v245[0] = v118;
    v245[1] = v219;
    v245[2] = v227;
    v245[3] = v229;
    v245[4] = v116;
    v245[5] = v231;
    v201 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v198, (uint64_t)v245, 6, v199);
    if (v193) {
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v200, (uint64_t)v220, (uint64_t)v188, (uint64_t)v183, v201, self->inputColorSpace, v194, v195, v196, v197);
    }
    else {
    v202 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v200, (uint64_t)v221, (uint64_t)v188, (uint64_t)v183, v201, self->inputColorSpace, v194, v195, v196, v197);
    }

    v207 = objc_msgSend_imageByCroppingToRect_(v202, v203, v204, v205, v206, v225, v224, (double)v223, (double)v222);

    v217[2](v217);
  }
  else
  {
    v207 = 0;
  }

  return v207;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputFocalLength, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong((id *)&self->inputDistortionScaleMaxRadius, 0);
  objc_storeStrong((id *)&self->inputDistortionScaleMajorRadius, 0);
  objc_storeStrong((id *)&self->inputDistortionScaleMinorRadius, 0);
  objc_storeStrong((id *)&self->inputDistortionScaleHalfMinorRadius, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end