@interface ISIconSegmentation
- (BOOL)_computeImageWithCGImage:(ISIconSegmentation *)self ucharTintable:(SEL)a2 ucharDark:(CGImage *)a3 feedback:(char *)a4;
- (BOOL)_computeImageWithWidth:(int)a3 height:(int)a4 strict:(BOOL)a5 ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:;
- (BOOL)_computeImageWithWidth:(int)a3 height:(int)a4 ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:;
- (BOOL)enableColorEnhancementInDarkImage;
- (BOOL)enableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage;
- (CGImage)createDarkImageWithCGImage:(CGImage *)a3;
- (CGImage)createTintableImageWithCGImage:(CGImage *)a3;
- (ISIconSegmentation)init;
- (void)setEnableColorEnhancementInDarkImage:(BOOL)a3;
- (void)setEnableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage:(BOOL)a3;
@end

@implementation ISIconSegmentation

- (ISIconSegmentation)init
{
  v10.receiver = self;
  v10.super_class = (Class)ISIconSegmentation;
  v2 = [(ISIconSegmentation *)&v10 init];
  if (v2)
  {
    v3 = [[ISForegroundSegmentation alloc] initWithStrict:1];
    strictForegroundSegmentation = v2->_strictForegroundSegmentation;
    v2->_strictForegroundSegmentation = v3;

    v5 = [[ISForegroundSegmentation alloc] initWithStrict:0];
    looseForegroundSegmentation = v2->_looseForegroundSegmentation;
    v2->_looseForegroundSegmentation = v5;

    uint64_t v7 = objc_opt_new();
    grayscaleConversion = v2->_grayscaleConversion;
    v2->_grayscaleConversion = (ISBiasedGrayscaleConversion *)v7;

    v2->_maxNumberOfClusteringSamples = 8000;
    *(_WORD *)&v2->_enableColorEnhancementInDarkImage = 0;
  }
  return v2;
}

- (BOOL)_computeImageWithWidth:(int)a3 height:(int)a4 strict:(BOOL)a5 ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:
{
  uint64_t v457 = v7;
  uint64_t v8 = v6;
  v9 = v5;
  BOOL v10 = a5;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  uint64_t v463 = *MEMORY[0x1E4F143B8];
  id v14 = v464;
  uint64_t v15 = 16;
  if (v10) {
    uint64_t v15 = 8;
  }
  v458.i64[0] = (uint64_t)self;
  id v16 = *(id *)((char *)&self->super.isa + v15);
  if (![v16 computeMaskWithWidth:v12 height:v11 ucharSamplesAndMask:v9])
  {
    BOOL v168 = 0;
    goto LABEL_171;
  }
  uint64_t v451 = v8;
  id v452 = v16;
  id v456 = v14;
  uint64_t v17 = 274877907 * (int)v11 * (int)v12;
  v455.i64[0] = v17 >> 38;
  v454.i64[0] = (unint64_t)v17 >> 63;
  uint64_t v453 = v17 >> 39;
  v450.i64[0] = (v11 * v12);
  v448.i64[0] = (int)v11 * (int)v12;
  v18 = (float32x4_t *)malloc_type_malloc(v448.u64[0], 0x100004077774924uLL);
  v22 = (int *)&kISForegroundSegmentationLooseBooleanThreshold;
  v449.i32[0] = v10;
  if (v10) {
    v22 = (int *)&kISForegroundSegmentationStrictBooleanThreshold;
  }
  int v23 = v12 - 1;
  uint64_t v459 = v11;
  if ((int)v12 >= 1)
  {
    uint64_t v24 = 0;
    int v25 = *v22;
    int v26 = v11 - 1;
    uint64_t v27 = 4 * v12;
    uint64_t v28 = v11;
    do
    {
      if ((int)v24 <= 1) {
        uint64_t v29 = 1;
      }
      else {
        uint64_t v29 = v24;
      }
      if ((int)v11 <= 0)
      {
        uint64_t v33 = v24 + 1;
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v31 = v29 - 1;
        int v32 = v29 - 1;
        uint64_t v33 = v24 + 1;
        if ((int)v24 + 1 >= v23) {
          int v34 = v12 - 1;
        }
        else {
          int v34 = v24 + 1;
        }
        uint64_t v35 = (uint64_t)&v9[4 * v29 - 1];
        do
        {
          if ((int)v30 <= 1) {
            uint64_t v36 = 1;
          }
          else {
            uint64_t v36 = v30;
          }
          uint64_t v37 = v24 + v30 * v12;
          ++v30;
          if (v25 >= v9[4 * v37 + 3])
          {
            if (v32 <= v34)
            {
              int v40 = 0;
              int v39 = 0;
              uint64_t v41 = v36 - 2;
              v42 = (unsigned __int8 *)(v35 + v27 * (v36 - 1));
              if ((int)v30 >= v26) {
                int v43 = v26;
              }
              else {
                int v43 = v30;
              }
              int v44 = v36 - 1;
              uint64_t v45 = v31;
              do
              {
                v46 = v42;
                uint64_t v47 = v41;
                if (v44 <= v43)
                {
                  do
                  {
                    ++v40;
                    if (v25 < *v46) {
                      ++v39;
                    }
                    ++v47;
                    v46 += v27;
                  }
                  while (v47 < v43);
                }
                v42 += 4;
                BOOL v278 = v45++ < v34;
              }
              while (v278);
            }
            else
            {
              int v39 = 0;
              int v40 = 0;
            }
            BOOL v38 = v39 >= v40 - 1;
          }
          else
          {
            BOOL v38 = 1;
          }
          v18->i8[v37] = v38;
        }
        while (v30 != v28);
        LODWORD(v11) = v459;
      }
      uint64_t v24 = v33;
    }
    while (v33 != v12);
    uint64_t v48 = 0;
    while (1)
    {
      uint64_t v49 = (int)v48 <= 1 ? 1 : v48;
      if ((int)v11 > 0) {
        break;
      }
      uint64_t v53 = v48 + 1;
LABEL_73:
      uint64_t v48 = v53;
      if (v53 == v12)
      {
        uint64_t v71 = 0;
        float32x4_t v72 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        uint64_t v73 = 4 * v12;
        float32x4_t v74 = (float32x4_t)vdupq_n_s32(0xC37F0000);
        do
        {
          if ((int)v71 <= 1) {
            uint64_t v75 = 1;
          }
          else {
            uint64_t v75 = v71;
          }
          if ((int)v11 <= 0)
          {
            uint64_t v79 = v71 + 1;
          }
          else
          {
            uint64_t v76 = 0;
            uint64_t v77 = v75 - 1;
            int v78 = v75 - 1;
            uint64_t v79 = v71 + 1;
            if ((int)v71 + 1 >= v23) {
              int v80 = v12 - 1;
            }
            else {
              int v80 = v71 + 1;
            }
            uint64_t v81 = (uint64_t)&v9[4 * v75 - 2];
            do
            {
              if ((int)v76 <= 1) {
                uint64_t v82 = 1;
              }
              else {
                uint64_t v82 = v76;
              }
              uint64_t v83 = v71 + v76 * v12;
              __int8 v84 = v18->i8[v83];
              if (v84)
              {
                ++v76;
                if (v78 <= v80)
                {
                  int v85 = 0;
                  v86 = &v9[4 * v83];
                  v19.i32[0] = *v86;
                  v19.i32[1] = v86[1];
                  *(float32x2_t *)v19.f32 = vcvt_f32_u32(*(uint32x2_t *)v19.f32);
                  v20.i8[0] = v86[2];
                  v20.f32[0] = (float)v20.u32[0];
                  v19.i32[2] = v20.i32[0];
                  float32x4_t v19 = vdivq_f32(v19, v72);
                  if ((int)v76 >= v26) {
                    int v87 = v26;
                  }
                  else {
                    int v87 = v76;
                  }
                  int v88 = v82 - 1;
                  uint64_t v89 = v82 - 2;
                  v90 = (__int8 *)(v81 + v73 * (v82 - 1));
                  uint64_t v91 = v77;
                  do
                  {
                    v92 = v90;
                    uint64_t v93 = v89;
                    if (v88 <= v87)
                    {
                      do
                      {
                        v20.i32[0] = *(v92 - 2);
                        v20.i32[1] = *(v92 - 1);
                        *(float32x2_t *)v20.f32 = vcvt_f32_u32(*(uint32x2_t *)v20.f32);
                        v21.i8[0] = *v92;
                        v20.f32[2] = (float)v21.u32[0];
                        float32x4_t v94 = vaddq_f32(v19, vdivq_f32(v20, v74));
                        float32x4_t v95 = vmulq_f32(v94, v94);
                        float32x4_t v21 = vaddq_f32(v95, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v95.f32, 1));
                        float32x4_t v20 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v95, 2), v21);
                        *(double *)v20.i64 = sqrtf(v20.f32[0]);
                        if (*(double *)v20.i64 <= 0.0392156863) {
                          ++v85;
                        }
                        ++v93;
                        v92 += v73;
                      }
                      while (v93 < v87);
                    }
                    v90 += 4;
                    BOOL v278 = v91++ < v80;
                  }
                  while (v278);
                  if (v85 > 5) {
                    v18->i8[v83] = v84 | 0x10;
                  }
                }
              }
              else
              {
                v18->i8[v83] = v84 | 0x10;
                ++v76;
              }
            }
            while (v76 != v28);
            LODWORD(v11) = v459;
          }
          uint64_t v71 = v79;
        }
        while (v79 != v12);
        goto LABEL_104;
      }
    }
    uint64_t v50 = 0;
    uint64_t v51 = v49 - 1;
    int v52 = v49 - 1;
    uint64_t v53 = v48 + 1;
    if ((int)v48 + 1 >= v23) {
      int v54 = v12 - 1;
    }
    else {
      int v54 = v48 + 1;
    }
    while (1)
    {
      if ((int)v50 <= 1) {
        uint64_t v55 = 1;
      }
      else {
        uint64_t v55 = v50;
      }
      uint64_t v56 = v55 - 2;
      v57 = (char *)v18 + v12 * (v55 - 1);
      uint64_t v58 = v48 + v50 * v12;
      ++v50;
      if (v18->i8[v58])
      {
        if (v52 > v54) {
          goto LABEL_69;
        }
        int v59 = 0;
        int v60 = 0;
        if ((int)v50 >= v26) {
          int v66 = v26;
        }
        else {
          int v66 = v50;
        }
        int v67 = v55 - 1;
        uint64_t v68 = v51;
        do
        {
          v69 = v57;
          uint64_t v70 = v56;
          if (v67 <= v66)
          {
            do
            {
              ++v60;
              v59 += v69[v68] & 1;
              ++v70;
              v69 += v12;
            }
            while (v70 < v66);
          }
          BOOL v278 = v68++ < v54;
        }
        while (v278);
      }
      else
      {
        if (v52 > v54) {
          goto LABEL_69;
        }
        int v59 = 0;
        int v60 = 0;
        if ((int)v50 >= v26) {
          int v61 = v26;
        }
        else {
          int v61 = v50;
        }
        int v62 = v55 - 1;
        uint64_t v63 = v51;
        do
        {
          v64 = v57;
          uint64_t v65 = v56;
          if (v62 <= v61)
          {
            do
            {
              ++v60;
              if ((v64[v63] & 1) == 0) {
                ++v59;
              }
              ++v65;
              v64 += v12;
            }
            while (v65 < v61);
          }
          BOOL v278 = v63++ < v54;
        }
        while (v278);
      }
      if (v59 == v60) {
LABEL_69:
      }
        v18->i8[v58] |= 2u;
      if (v50 == v28)
      {
        LODWORD(v11) = v459;
        goto LABEL_73;
      }
    }
  }
LABEL_104:
  __int32 v96 = v453 + v454.i32[0];
  double v97 = (double)(int)v12;
  for (unsigned int i = 11; i != 18; ++i)
  {
    signed int v99 = 0;
    unsigned int v100 = 0;
    unsigned int v101 = 0;
    int v102 = 0;
    double v103 = (double)(int)i;
    int v104 = -i;
    do
    {
      int v105 = 0;
      int v106 = 0;
      if (v102) {
        int v107 = 1;
      }
      else {
        int v107 = -1;
      }
      do
      {
        if (v18->i8[(int)(((float)v102 + 0.5) * v97 / v103) * (int)v12 + (int)(((float)v106 + 0.5) * v97 / v103)]) {
          int v108 = v107;
        }
        else {
          int v108 = -v107;
        }
        v105 += v108;
        ++v106;
      }
      while (i != v106);
      v99 += v105;
      if (v105 == i) {
        ++v100;
      }
      int v109 = v105 == v104 && v105 != i;
      v101 += v109;
      ++v102;
    }
    while (v102 != i);
    int v110 = 0;
    unsigned int v111 = 0;
    int v112 = 0;
    int v113 = 0;
    do
    {
      int v114 = 0;
      int v115 = 0;
      if (v113) {
        int v116 = 1;
      }
      else {
        int v116 = -1;
      }
      do
      {
        if (v18->i8[(int)(((float)v113 + 0.5) * v97 / v103) + (int)(((float)v115 + 0.5) * v97 / v103) * (int)v12]) {
          int v117 = v116;
        }
        else {
          int v117 = -v116;
        }
        v114 += v117;
        ++v115;
      }
      while (i != v115);
      v110 += v114;
      if (v114 == i) {
        ++v111;
      }
      int v118 = v114 == v104 && v114 != i;
      v112 += v118;
      ++v113;
    }
    while (v113 != i);
    unsigned int v119 = i * i;
    if (v99 >= (int)((i * i) >> 1) && v100 >= i >> 1 && !v101
      || (signed int v120 = v119 >> 1, v121 = -(v119 >> 1), v99 <= v121) && v101 >= i >> 1 && !v100
      || v110 >= v120 && (v111 >= i >> 1 ? (_ZF = v112 == 0) : (_ZF = 0), _ZF)
      || v110 <= v121 && v101 >= i >> 1 && !v111)
    {
      v169 = v18;
LABEL_169:
      free(v169);
      BOOL v168 = 0;
      goto LABEL_170;
    }
  }
  v454.i32[0] += v455.i32[0];
  v123 = (float32x4_t *)malloc_type_malloc(16 * *(int *)(v458.i64[0] + 32), 0x1000040451B5BE8uLL);
  unsigned int v462 = 10;
  if (*(int *)(v458.i64[0] + 32) < 1) {
    goto LABEL_168;
  }
  int v124 = 0;
  int v125 = 0;
  uint64_t v126 = 0;
  float v127 = (float)(int)v12;
  float v128 = (float)(int)v459;
  int32x4_t v455 = vdupq_n_s32(0x437F0000u);
  do
  {
    int v129 = (int)(float)((float)(v127 * (float)rand_r(&v462)) * 4.6566e-10);
    v130.f32[0] = (float)(v128 * (float)rand_r(&v462)) * 4.6566e-10;
    int v132 = v129 + (int)v130.f32[0] * v12;
    int v133 = v18->u8[v132];
    if ((~v133 & 0x12) == 0)
    {
      v134 = &v9[4 * v132];
      v130.i32[0] = *v134;
      v130.i32[1] = v134[1];
      *(float32x2_t *)v130.f32 = vcvt_f32_u32(*(uint32x2_t *)v130.f32);
      LOBYTE(v131) = v134[2];
      v130.f32[2] = (float)LODWORD(v131);
      double v131 = *(double *)v455.i64;
      float32x4_t v130 = vdivq_f32(v130, (float32x4_t)v455);
      if (v133)
      {
        v123[(int)v126] = v130;
        uint64_t v126 = (v126 + 1);
      }
      else
      {
        ++v125;
        v123[*(_DWORD *)(v458.i64[0] + 32) - v125] = v130;
      }
    }
    ++v124;
    int v135 = *(_DWORD *)(v458.i64[0] + 32);
  }
  while (v124 < v135 && ((int)v126 < 1100 || v125 < 1100));
  if ((int)v126 < 10 || v125 < 10)
  {
LABEL_168:
    free(v18);
    v169 = v123;
    goto LABEL_169;
  }
  v136 = &v123[v135 - v125];
  *(double *)v137.i64 = ISSegmentationMathUtils_mean(v126, v123, *(double *)v130.i64, v131);
  float32x4_t v461 = v137;
  float32x4_t v444 = v137;
  *(double *)v144.i64 = ISSegmentationMathUtils_covariance(v126, v123, v137, v138, v139, v140, v141, v142, v143);
  int32x4_t v447 = (int32x4_t)v144;
  float32x4_t v445 = v145;
  __n128 v446 = v146;
  *(double *)v147.i64 = ISSegmentationMathUtils_mean(v125, v136, *(double *)v144.i64, *(double *)v145.i64);
  int32x4_t v455 = (int32x4_t)v147;
  *(double *)v154.i64 = ISSegmentationMathUtils_covariance(v125, v136, v147, v148, v149, v150, v151, v152, v153);
  float32x4_t v160 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v446, 2);
  v161.i64[0] = vaddq_f32(v160, vaddq_f32((float32x4_t)v447, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v445.f32, 1))).u64[0];
  v154.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v155, 2), vaddq_f32(v154, (float32x4_t)vdupq_lane_s32(v162, 1))).f32[0];
  double v163 = v161.f32[0];
  double v164 = v154.f32[0];
  unsigned int v165 = -350469331;
  uint64_t v453 = (uint64_t)v123;
  if (v161.f32[0] <= 0.0004 && v164 <= 0.0004)
  {
    float32x4_t v460 = v444;
    if ((!v457
       || shouldGenerateDark_singleForegroundColor_singleBackgroundColor(*(unsigned __int8 *)(v458.i64[0] + 36), (int32x4_t *)&v460, v444, (float32x4_t)v455))&& computeMask_foregroundMultipleColors_backgroundSingleColor(v12, v459, 1u, &v461, (uint64_t)v9, (uint64_t)v18, v451, &v460, (float32x4_t)0, v457))
    {
      id v166 = v456;
      [v456 setObject:@"IconSegmentationForegroundStyleSingleColor" forKeyedSubscript:@"IconSegmentationForegroundStyleKey"];
      [v456 setObject:&unk_1F064AC00 forKeyedSubscript:@"IconSegmentationForegroundNumberOfColorsKey"];
      v167 = @"IconSegmentationBackgroundStyleSingleColor";
      goto LABEL_165;
    }
LABEL_285:
    BOOL v168 = 0;
    goto LABEL_286;
  }
  if (v163 > 0.0004 && v164 <= 0.0004)
  {
    if (!v449.i32[0]) {
      goto LABEL_285;
    }
    if ((int)v12 < 1)
    {
      int v199 = 0;
      int v198 = 0;
      float32x4_t v172 = (float32x4_t)v455;
    }
    else
    {
      uint64_t v171 = 0;
      float32x4_t v172 = (float32x4_t)v455;
      float32x4_t v173 = vmulq_f32(v172, v172);
      float32x4_t v174 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v173, 2), vaddq_f32(v173, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v173.f32, 1)));
      unsigned int v175 = v459;
      v176 = v9 + 2;
      float32x4_t v177 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      v161.i32[0] = 1.0;
      v160.i32[1] = 1072210903;
      v156.i32[0] = 404232216;
      v178 = v18;
      do
      {
        v179 = v178;
        v180 = v176;
        uint64_t v181 = v175;
        int v182 = v459 - 1;
        if ((int)v459 >= 1)
        {
          do
          {
            if (v179->i8[0])
            {
              v157.i32[0] = *(v180 - 2);
              v157.i32[1] = *(v180 - 1);
              *(float32x2_t *)v157.f32 = vcvt_f32_u32(*(uint32x2_t *)v157.f32);
              v158.i8[0] = *v180;
              v157.f32[2] = (float)v158.u32[0];
              float32x4_t v157 = vdivq_f32(v157, v177);
              float32x4_t v183 = vmulq_f32(v172, v157);
              float32x4_t v159 = vaddq_f32(v183, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v183.f32, 1));
              float32x4_t v158 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v183, 2), v159), v174);
              v158.f32[0] = fminf(fmaxf(v158.f32[0], 0.0), 1.0);
              if (v158.f32[0] >= 0.77)
              {
                float32x4_t v159 = vmlaq_n_f32((float32x4_t)0, v172, v158.f32[0]);
                float32x4_t v184 = vsubq_f32(v157, v159);
                float32x4_t v185 = vmulq_f32(v184, v184);
                float32x4_t v158 = vaddq_f32(v185, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v185.f32, 1));
                float32x4_t v157 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v185, 2), v158);
                *(double *)v157.i64 = sqrtf(v157.f32[0]);
                if (*(double *)v157.i64 < 0.0117647059) {
                  v179->i8[0] |= 0x20u;
                }
              }
            }
            v180 += 4 * v12;
            v179 = (float32x4_t *)((char *)v179 + v12);
            --v181;
          }
          while (v181);
        }
        ++v171;
        v176 += 4;
        v178 = (float32x4_t *)((char *)v178 + 1);
      }
      while (v171 != v12);
      unint64_t v186 = 0;
      float32x4_t v187 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      v188 = (unsigned __int8 *)v9;
      do
      {
        if ((int)v459 >= 1)
        {
          uint64_t v189 = 0;
          unint64_t v190 = v186;
          v191 = v188;
          do
          {
            if (v186)
            {
              if (v186 < (v12 - 1))
              {
                if (v189)
                {
                  if (v189 < v182
                    && (v18->i8[v190] & 0x20) != 0
                    && (v18->i8[v190 - 1] & 0x21) != 1
                    && (v18->i8[v190 + 1] & 0x21) != 1
                    && (v18->i8[v190 - v12] & 0x21) != 1
                    && (v18->i8[v12 + v190] & 0x21) != 1)
                  {
                    v155.i32[0] = *v191;
                    v155.i32[1] = v191[1];
                    *(float32x2_t *)v155.f32 = vcvt_f32_u32(*(uint32x2_t *)v155.f32);
                    v161.i8[0] = v191[2];
                    v155.f32[2] = (float)v161.u32[0];
                    float32x4_t v192 = vdivq_f32(v155, v187);
                    v161.i32[0] = *(_DWORD *)&v9[4 * v190 + -4 * v12];
                    v160.i32[0] = *(_DWORD *)&v9[4 * v12 + 4 * v190];
                    int8x16_t v193 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v161.f32);
                    v156.i32[0] = *(v191 - 4);
                    v156.i32[1] = *(v191 - 3);
                    int8x16_t v194 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v160.f32);
                    *(float32x2_t *)v156.f32 = vcvt_f32_u32(*(uint32x2_t *)v156.f32);
                    v157.i8[0] = *(v191 - 2);
                    v156.f32[2] = (float)v157.u32[0];
                    v157.i32[0] = v191[4];
                    v157.i32[1] = v191[5];
                    *(float32x2_t *)v157.f32 = vcvt_f32_u32(*(uint32x2_t *)v157.f32);
                    v158.i8[0] = v191[6];
                    v157.f32[2] = (float)v158.u32[0];
                    v158.f32[0] = (float)v193.u16[0];
                    v159.i32[0] = v193.u16[1];
                    v159.i32[1] = v193.u16[2];
                    *(float32x2_t *)v193.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v159.f32, (int8x8_t)0xFF000000FFLL));
                    v159.f32[0] = (float)v194.u16[0];
                    float32x4_t v195 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v158, (int8x16_t)v158, 4uLL), v193, 0xCuLL);
                    v196.i32[0] = v194.u16[1];
                    float32x4_t v161 = vdivq_f32(v195, v187);
                    v196.i32[1] = v194.u16[2];
                    *(float32x2_t *)v194.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v196, (int8x8_t)0xFF000000FFLL));
                    float32x4_t v158 = (float32x4_t)vextq_s8((int8x16_t)v159, (int8x16_t)v159, 4uLL);
                    float32x4_t v157 = vsubq_f32(vdivq_f32(v157, v187), v192);
                    float32x4_t v156 = vmulq_f32(vsubq_f32(v192, vdivq_f32(v156, v187)), v157);
                    v157.f32[0] = fminf(v156.f32[0], v156.f32[2]);
                    v156.f32[0] = fminf(v157.f32[0], v156.f32[1]);
                    float32x4_t v160 = vsubq_f32(vdivq_f32((float32x4_t)vextq_s8((int8x16_t)v158, v194, 0xCuLL), v187), v192);
                    float32x4_t v155 = vmulq_f32(vsubq_f32(v192, v161), v160);
                    v161.f32[0] = fminf(v155.f32[0], v155.f32[2]);
                    if (fmaxf(v156.f32[0], fminf(v161.f32[0], v155.f32[1])) > 0.0) {
                      v18->i8[v190] |= 0x40u;
                    }
                  }
                }
              }
            }
            ++v189;
            v191 += 4 * v12;
            v190 += v12;
          }
          while (v175 != v189);
        }
        ++v186;
        v188 += 4;
      }
      while (v186 != v12);
      uint64_t v197 = 0;
      int v198 = 0;
      int v199 = 0;
      v200 = v18;
      do
      {
        uint64_t v201 = v175;
        v202 = v200;
        if ((int)v459 >= 1)
        {
          do
          {
            unsigned int v203 = v202->u8[0];
            v199 += (v203 >> 5) & 1;
            v198 += (v203 >> 6) & 1;
            v202 = (float32x4_t *)((char *)v202 + v12);
            --v201;
          }
          while (v201);
        }
        ++v197;
        v200 = (float32x4_t *)((char *)v200 + 1);
      }
      while (v197 != v12);
    }
    if ((float)((float)v198 / (float)v450.i32[0]) <= 0.14)
    {
      v158.i32[0] = 1.0;
      if (v198 <= v454.i32[0])
      {
        v277 = (float32x4_t *)v453;
        goto LABEL_266;
      }
      double v276 = (float)((float)v198 / (float)v199);
      v277 = (float32x4_t *)v453;
      if (v276 <= 0.525)
      {
        if (v276 > 0.32)
        {
          BOOL v278 = (float)((float)v199 / (float)v450.i32[0]) >= 0.038 || v450.i32[0] <= 0;
          if (!v278) {
            goto LABEL_262;
          }
        }
      }
      else
      {
        if (v450.i32[0] < 1) {
          goto LABEL_266;
        }
LABEL_262:
        float32x4_t v279 = vmulq_f32(v172, v172);
        float32x4_t v280 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v279, 2), vaddq_f32(v279, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v279.f32, 1)));
        v281 = v9 + 2;
        float32x4_t v282 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        unint64_t v283 = v450.i64[0];
        v284 = v18;
        v158.i32[0] = 1.0;
        do
        {
          char v285 = v284->i8[0];
          v284 = (float32x4_t *)((char *)v284 + 1);
          if ((v285 & 0x20) != 0)
          {
            v160.i32[0] = *(v281 - 2);
            v160.i32[1] = *(v281 - 1);
            *(float32x2_t *)v160.f32 = vcvt_f32_u32(*(uint32x2_t *)v160.f32);
            v156.i8[0] = *v281;
            v160.f32[2] = (float)v156.u32[0];
            float32x4_t v286 = vmulq_f32(v172, vdivq_f32(v160, v282));
            float32x4_t v156 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v286.f32, 1);
            float32x4_t v160 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v286, 2), vaddq_f32(v286, v156)), v280);
            v158.f32[0] = fminf(v158.f32[0], fminf(fmaxf(v160.f32[0], 0.0), 1.0));
          }
          v281 += 4;
          --v283;
        }
        while (v283);
      }
LABEL_266:
      double v287 = v158.f32[0];
      if (v158.f32[0] >= 0.92)
      {
        float32x4_t v441 = v158;
        v288 = (int *)malloc_type_malloc(4 * v126, 0x100004052888210uLL);
        uint64_t v289 = ISSegmentationMathUtils_dbscan(v126, 10, (uint64_t)v277, v288, 0.043137);
        if ((int)v289 < 1)
        {
          free(v288);
        }
        else
        {
          v454.i32[0] = v96;
          v440[1] = v440;
          v445.i64[0] = v126;
          uint64_t v290 = v289;
          uint64_t v291 = MEMORY[0x1F4188790](v289);
          v293 = (int *)((char *)v440 - v292);
          v440[0] = v291;
          size_t v294 = 16 * v291;
          MEMORY[0x1F4188790](v291);
          v295 = (float32x4_t *)&v440[-2 * v290];
          bzero(v293, v296);
          bzero(v295, v294);
          unint64_t v298 = v445.i64[0];
          uint64_t v299 = 0;
          signed int v300 = 0;
          int v301 = ISSegmentationMathUtils_dbscan_noiseClusterIndex;
          int32x4_t v302 = v455;
          do
          {
            uint64_t v303 = v288[v299];
            if (v303 == v301)
            {
              ++v300;
            }
            else
            {
              float32x4_t v297 = vaddq_f32(v277[v299], v295[v303]);
              v295[v303] = v297;
              ++v293[v303];
            }
            ++v299;
          }
          while (v298 != v299);
          for (uint64_t j = 0; j != v290; ++j)
          {
            v297.f32[0] = (float)v293[j];
            float32x4_t v297 = vdivq_f32(v295[j], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v297.f32, 0));
            v295[j] = v297;
          }
          if (v300 < (int)(v126 / 0xA))
          {
            v306.n64_u64[0] = ISSegmentationMathUtils_rgb2hsv(v302).n64_u64[0];
            uint64_t v308 = 0;
            float v309 = 3.4028e38;
            do
            {
              float32x4_t v310 = vsubq_f32(v295[v308], (float32x4_t)v455);
              float32x4_t v311 = vmulq_f32(v310, v310);
              float v312 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v311, 2), vaddq_f32(v311, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v311.f32, 1))).f32[0]);
              if (v312 < v309) {
                float v309 = v312;
              }
              ++v308;
            }
            while (v290 != v308);
            float v313 = v307 >= 0.5 ? flt_1AE7C0A58[v306.n64_f32[1] < 0.5] : 0.10588;
            if (v309 >= v313)
            {
              MEMORY[0x1F4188790](v305.n64_u64[0]);
              v443 = (float32x4_t *)&v440[-2 * v315];
              v316 = v443 + 2;
              uint64_t v317 = v290;
              do
              {
                v316[-2].i32[2] = 0;
                v316[-2].i64[0] = 0;
                v316[-1].i32[2] = 0;
                v316[-1].i64[0] = 0;
                v316->i32[2] = 0;
                v316->i64[0] = 0;
                v316 += 3;
                --v317;
              }
              while (v317);
              uint64_t v318 = 0;
              int v319 = ISSegmentationMathUtils_dbscan_noiseClusterIndex;
              uint64_t v442 = v290;
              do
              {
                uint64_t v320 = v288[v318];
                if (v320 != v319)
                {
                  float32x4_t v321 = vsubq_f32(v277[v318], v295[v320]);
                  v322 = v288;
                  v323 = v277;
                  v324 = &v443[3 * (int)v320];
                  *(double *)v325.i64 = ISSegmentationMathUtils_outer(v321, v321.f32[0]);
                  unint64_t v314 = v445.i64[0];
                  float32x4_t v326 = vaddq_f32(*v324, v325);
                  v325.i32[3] = v446.n128_i32[3];
                  float32x4_t v328 = vaddq_f32(v324[1], v327);
                  v327.i32[3] = v447.i32[3];
                  float32x4_t v330 = vaddq_f32(v324[2], v329);
                  v329.i32[3] = v449.i32[3];
                  v324->i32[2] = v326.i32[2];
                  v324->i64[0] = v326.i64[0];
                  v324[1].i32[2] = v328.i32[2];
                  v324[2].i32[2] = v330.i32[2];
                  v324[1].i64[0] = v328.i64[0];
                  v324[2].i64[0] = v330.i64[0];
                  v277 = v323;
                  v288 = v322;
                  uint64_t v290 = v442;
                  int v319 = ISSegmentationMathUtils_dbscan_noiseClusterIndex;
                  float32x4_t v449 = v329;
                  int32x4_t v447 = (int32x4_t)v327;
                  __n128 v446 = (__n128)v325;
                }
                ++v318;
              }
              while (v314 != v318);
              v331 = v443 + 2;
              uint64_t v332 = v290;
              do
              {
                int v333 = *v293++;
                float32x4_t v334 = *v331;
                float v335 = 1.0 / (double)v333;
                float32x4_t v336 = vmulq_n_f32(v331[-2], v335);
                float32x4_t v337 = vmulq_n_f32(v331[-1], v335);
                v331[-2].i32[2] = v336.i32[2];
                v331[-2].i64[0] = v336.i64[0];
                float32x4_t v338 = vmulq_n_f32(v334, v335);
                v331[-1].i32[2] = v337.i32[2];
                v331[-1].i64[0] = v337.i64[0];
                v331->i32[2] = v338.i32[2];
                v331->i64[0] = v338.i64[0];
                v331 += 3;
                --v332;
              }
              while (v332);
              v339 = &v443[1].f32[1];
              uint64_t v340 = 1;
              do
              {
                double v341 = (float)((float)(*(v339 - 5) + *v339) + v339[5]);
                v339 += 12;
              }
              while (v341 <= 0.0004 && v340++ < SLODWORD(v440[0]));
              if (v341 <= 0.0004)
              {
                float32x4_t v460 = v444;
                if (!v457)
                {
LABEL_389:
                  if (SLODWORD(v440[0]) >= 2) {
                    computeIconSegmentationFlagForExtraConfidence(v12, v459, (uint64_t)v18);
                  }
                  goto LABEL_391;
                }
                if (LODWORD(v440[0]) == 1)
                {
                  BOOL Dark_singleForegroundColor_singleBackgroundColor = shouldGenerateDark_singleForegroundColor_singleBackgroundColor(*(unsigned __int8 *)(v458.i64[0] + 36), (int32x4_t *)&v460, v444, (float32x4_t)v455);
                  v277 = (float32x4_t *)v453;
                  if (!Dark_singleForegroundColor_singleBackgroundColor) {
                    goto LABEL_399;
                  }
LABEL_391:
                  [*(id *)(v458.i64[0] + 24) computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:v126 representativeSamples:v277];
                  if (LODWORD(v440[0]) == 1) {
                    v435 = &v460;
                  }
                  else {
                    v435 = 0;
                  }
                  if (computeMask_foregroundMultipleColors_backgroundSingleColor(v12, v459, v440[0], v295, (uint64_t)v9, (uint64_t)v18, v451, v435, v434, v457))
                  {
                    uint64_t v436 = v440[0];
                    if (LODWORD(v440[0]) == 1) {
                      v437 = @"IconSegmentationForegroundStyleSingleColor";
                    }
                    else {
                      v437 = @"IconSegmentationForegroundStyleMultipleColors";
                    }
                    id v438 = v456;
                    [v456 setObject:v437 forKeyedSubscript:@"IconSegmentationForegroundStyleKey"];
                    v439 = [NSNumber numberWithInt:v436];
                    [v438 setObject:v439 forKeyedSubscript:@"IconSegmentationForegroundNumberOfColorsKey"];

                    [v438 setObject:@"IconSegmentationBackgroundStyleSingleColor" forKeyedSubscript:@"IconSegmentationBackgroundStyleKey"];
                    int v402 = 1;
LABEL_400:
                    free(v288);
LABEL_355:
                    BOOL v168 = v402 != 0;
                    goto LABEL_286;
                  }
                }
                else
                {
                  float32x4_t v428 = vmulq_f32((float32x4_t)v455, (float32x4_t)v455);
                  if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v428, 2), vaddq_f32(v428, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v428.f32, 1))).f32[0]) <= 0.235294118)
                  {
                    v432 = (__n128 *)v295;
                    v277 = (float32x4_t *)v453;
                    uint64_t v433 = v442;
LABEL_387:
                    while (ISSegmentationMathUtils_contrastRatio(*v432, (__n128)vdupq_n_s32(0x3DA0902Eu)) >= 3.0)
                    {
                      ++v432;
                      if (!--v433) {
                        goto LABEL_389;
                      }
                    }
                  }
                  else
                  {
                    __asm { FMOV            V1.4S, #-1.0 }
                    float32x4_t v430 = vaddq_f32((float32x4_t)v455, _Q1);
                    float32x4_t v431 = vmulq_f32(v430, v430);
                    v432 = (__n128 *)v295;
                    v277 = (float32x4_t *)v453;
                    uint64_t v433 = v442;
                    if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v431, 2), vaddq_f32(v431, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v431.f32, 1))).f32[0]) <= 0.235294118)goto LABEL_387; {
                  }
                    }
                }
LABEL_399:
                int v402 = 0;
                goto LABEL_400;
              }
            }
          }
          free(v288);
          __int32 v96 = v454.i32[0];
        }
        int v344 = v459;
        computeIconSegmentationFlagForMoreConfidence(v12, v459, (uint64_t)v18);
        computeIconSegmentationFlagForExtraConfidence(v12, v344, (uint64_t)v18);
        float32x4_t v172 = (float32x4_t)v455;
        v158.i32[0] = v441.i32[0];
      }
      __int32 v345 = v96;
      float32x4_t v449 = vmulq_n_f32(v172, v158.f32[0]);
      v346 = (float32x4_t *)malloc_type_malloc(v448.u64[0], 0x100004077774924uLL);
      computeIconSegmentationAdditionalGradientFlag(v12, v459, v287 < 0.92, (uint64_t)v9, (uint64_t)v18, (uint64_t)v346, v347, v348, v349, v350, v351, v352, v353);
      *(__n64 *)v355.f32 = ISSegmentationMathUtils_rgb2hsv(v455);
      float32x4_t v362 = v355;
      unint64_t v363 = v450.i64[0];
      if (v450.i32[0] < 1)
      {
        float v365 = 3.4028e38;
        int v368 = v459;
        float32x4_t v369 = (float32x4_t)v455;
      }
      else
      {
        v364 = v9 + 2;
        float v365 = 3.4028e38;
        float32x4_t v357 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        v366 = v18;
        v367 = (char *)v346;
        int v368 = v459;
        float32x4_t v369 = (float32x4_t)v455;
        float32x4_t v448 = v355;
        int32x4_t v447 = (int32x4_t)v357;
        do
        {
          char v371 = v366->i8[0];
          v366 = (float32x4_t *)((char *)v366 + 1);
          char v370 = v371;
          char v372 = v371;
          if (v287 < 0.92) {
            char v372 = *v367;
          }
          if ((v370 & 1) != 0 && (v372 & 4) != 0)
          {
            v355.i32[0] = *(v364 - 2);
            v355.i32[1] = *(v364 - 1);
            *(float32x2_t *)v355.f32 = vcvt_f32_u32(*(uint32x2_t *)v355.f32);
            v356.i8[0] = *v364;
            v355.f32[2] = (float)v356.u32[0];
            float32x4_t v373 = vdivq_f32(v355, v357);
            if (v287 >= 0.92)
            {
              float32x4_t v375 = vsubq_f32(v373, v369);
            }
            else
            {
              float32x4_t v454 = v373;
              *(double *)v374.i64 = ISSegmentationMathUtils_clampedProject(v373, v369, v449);
              float32x4_t v357 = (float32x4_t)v447;
              float32x4_t v362 = v448;
              float32x4_t v369 = (float32x4_t)v455;
              int v368 = v459;
              float32x4_t v375 = vsubq_f32(v454, v374);
            }
            float32x4_t v376 = vmulq_f32(v375, v375);
            float32x4_t v356 = vaddq_f32(v376, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v376.f32, 1));
            float32x4_t v355 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v376, 2), v356);
            v355.f32[0] = sqrtf(v355.f32[0]);
            if (v355.f32[0] < v365) {
              float v365 = v355.f32[0];
            }
          }
          v364 += 4;
          ++v367;
          --v363;
        }
        while (v363);
      }
      v356.i32[0] = v362.i32[2];
      if (v362.f32[2] >= 0.5)
      {
        v356.i32[0] = v362.i32[1];
        v355.f32[0] = flt_1AE7C0A58[v362.f32[1] < 0.5];
      }
      else
      {
        v355.i32[0] = 1037621465;
      }
      uint64_t v377 = v453;
      if (v365 >= v355.f32[0])
      {
        if ((int)v12 < 1)
        {
          __int32 v379 = 0;
        }
        else
        {
          unint64_t v378 = 0;
          __int32 v379 = 0;
          v355.i64[0] = 0xFF000000FFLL;
          float32x4_t v356 = (float32x4_t)vdupq_n_s32(0x437F0000u);
          v362.i64[0] = 0xC0000000C0000000;
          v362.i64[1] = 0xC0000000C0000000;
          v357.i32[0] = 0.25;
          v358.n64_u32[0] = 993257242;
          v380 = (unsigned __int32 *)v9;
          v354.n64_u64[0] = (unint64_t)&v9[-4 * v12];
          do
          {
            if ((int)v459 >= 1)
            {
              uint64_t v381 = 0;
              v382 = v380;
              unint64_t v383 = v378;
              do
              {
                if (v378)
                {
                  if (v378 < (v12 - 1))
                  {
                    if (v381)
                    {
                      if (v381 < v368 - 1
                        && (~v18->u8[v383] & 3) == 0
                        && (v346->i8[v383] & 1) == 0
                        && (~v18->u8[v383 - 1] & 3) == 0
                        && (v346->i8[v383 - 1] & 1) == 0
                        && (~v18->u8[v383 + 1] & 3) == 0
                        && (v346->i8[v383 + 1] & 1) == 0
                        && (~v18->u8[v383 - v12] & 3) == 0
                        && (v346->i8[v383 - v12] & 1) == 0
                        && (~v18->u8[v12 + v383] & 3) == 0
                        && (v346->i8[v12 + v383] & 1) == 0)
                      {
                        v359.n64_u32[0] = *v382;
                        v360.i32[0] = v382[1];
                        int8x16_t v384 = (int8x16_t)vmovl_u8((uint8x8_t)v359.n64_u64[0]);
                        v359.n64_u32[0] = *(v382 - 1);
                        uint16x8_t v385 = vmovl_u8((uint8x8_t)v359.n64_u64[0]);
                        uint16x8_t v386 = vmovl_u8(*(uint8x8_t *)v360.f32);
                        v359.n64_u32[0] = *(_DWORD *)(v354.n64_u64[0] + 4 * v383);
                        int8x16_t v387 = (int8x16_t)vmovl_u8((uint8x8_t)v359.n64_u64[0]);
                        v359.n64_u32[0] = *(_DWORD *)&v9[4 * v12 + 4 * v383];
                        uint16x8_t v388 = vmovl_u8((uint8x8_t)v359.n64_u64[0]);
                        v360.f32[0] = (float)v384.u16[0];
                        v361.i32[0] = v384.u16[1];
                        v361.i32[1] = v384.u16[2];
                        *(float32x2_t *)v384.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v361.i8, (int8x8_t)0xFF000000FFLL));
                        *(float *)v361.i32 = (float)v385.u16[0];
                        float32x4_t v389 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v360, (int8x16_t)v360, 4uLL), v384, 0xCuLL);
                        v384.i32[0] = v385.u16[1];
                        float32x4_t v390 = vdivq_f32(v389, v356);
                        v384.i32[1] = v385.u16[2];
                        *(float32x2_t *)v384.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v384.i8, (int8x8_t)0xFF000000FFLL));
                        int8x16_t v391 = vextq_s8(v361, v361, 4uLL);
                        *(float *)v361.i32 = (float)v386.u16[0];
                        float32x4_t v392 = (float32x4_t)vextq_s8(v391, v384, 0xCuLL);
                        v391.i32[0] = v386.u16[1];
                        v391.i32[1] = v386.u16[2];
                        *(float32x2_t *)v391.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v391.i8, (int8x8_t)0xFF000000FFLL));
                        int8x16_t v393 = vextq_s8(v361, v361, 4uLL);
                        float32x4_t v394 = vdivq_f32((float32x4_t)vextq_s8(v393, v391, 0xCuLL), v356);
                        *(float *)v393.i32 = (float)v387.u16[0];
                        v361.i32[0] = v387.u16[1];
                        v361.i32[1] = v387.u16[2];
                        *(float32x2_t *)v387.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v361.i8, (int8x8_t)0xFF000000FFLL));
                        *(float *)v361.i32 = (float)v388.u16[0];
                        float32x4_t v395 = (float32x4_t)vextq_s8(vextq_s8(v393, v393, 4uLL), v387, 0xCuLL);
                        v387.i32[0] = v388.u16[1];
                        __int32 v396 = v388.u16[2];
                        float32x4_t v397 = vdivq_f32(v395, v356);
                        v387.i32[1] = v396;
                        *(float32x2_t *)v395.f32 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v387.i8, (int8x8_t)0xFF000000FFLL));
                        float32x4_t v398 = vmlaq_f32(vaddq_f32(vdivq_f32(v392, v356), v394), v362, v390);
                        float32x4_t v399 = vmulq_f32(v398, v398);
                        float32x4_t v400 = vmlaq_f32(vaddq_f32(v397, vdivq_f32((float32x4_t)vextq_s8(vextq_s8(v361, v361, 4uLL), (int8x16_t)v395, 0xCuLL), v356)), v362, v390);
                        float32x4_t v401 = vmulq_f32(v400, v400);
                        float32x4_t v360 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v401.f32, 1);
                        v359.n64_u64[0] = vaddq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v399, 2), vaddq_f32(v399, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v399.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v401, 2), vaddq_f32(v401, v360))).u64[0];
                        if ((float)(0.25 * v359.n64_f32[0]) > 0.0027451) {
                          ++v379;
                        }
                      }
                    }
                  }
                }
                ++v381;
                v383 += v12;
                v382 += v12;
              }
              while (v368 != v381);
            }
            ++v378;
            ++v380;
          }
          while (v378 != v12);
        }
        if (v379 <= v345)
        {
          if (!v457) {
            goto LABEL_381;
          }
          float32x4_t v403 = vmulq_f32(v369, v369);
          double v404 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v403, 2), vaddq_f32(v403, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v403.f32, 1))).f32[0]);
          if (v404 <= 0.235294118) {
            goto LABEL_403;
          }
          __asm { FMOV            V1.4S, #-1.0 }
          float32x4_t v409 = vaddq_f32(v369, _Q1);
          float32x4_t v410 = vmulq_f32(v409, v409);
          double v404 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v410, 2), vaddq_f32(v410, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v410.f32, 1))).f32[0]);
          if (v404 <= 0.235294118)
          {
LABEL_403:
            unint64_t v411 = v450.i64[0];
            if (v450.i32[0] < 1)
            {
              int v415 = 0;
              int v414 = 0;
              __int32 v413 = 0;
              int v412 = 0;
            }
            else
            {
              int v412 = 0;
              __int32 v413 = 0;
              int v414 = 0;
              int v415 = 0;
              v416 = v9 + 2;
              int32x4_t v447 = vdupq_n_s32(0x437F0000u);
              float32x4_t v417 = (float32x4_t)vdupq_n_s32(0x3DA0902Eu);
              __n128 v446 = (__n128)v417;
              v418 = v18;
              v419 = v346;
              do
              {
                char v420 = v418->i8[0];
                if (v287 < 0.92) {
                  char v420 = v419->i8[0];
                }
                if ((v418->i8[0] & 1) != 0 && (v420 & 4) != 0)
                {
                  v421 = v287 >= 0.92 ? v418 : v419;
                  if ((v421->i8[0] & 8) == 0)
                  {
                    v417.i32[0] = *(v416 - 2);
                    v417.i32[1] = *(v416 - 1);
                    *(float32x2_t *)v417.f32 = vcvt_f32_u32(*(uint32x2_t *)v417.f32);
                    LOBYTE(v404) = *v416;
                    v417.f32[2] = (float)LODWORD(v404);
                    ++v415;
                    v450.i64[0] = v411;
                    v454.i32[0] = v413;
                    v448.i32[0] = v414;
                    v417.f32[0] = ISSegmentationMathUtils_contrastRatio((__n128)vdivq_f32(v417, (float32x4_t)v447), v446);
                    int v414 = v448.i32[0];
                    __int32 v413 = v454.i32[0];
                    unint64_t v411 = v450.i64[0];
                    if (v417.f32[0] >= 3.0) {
                      int v414 = v448.i32[0] + 1;
                    }
                    double v422 = v417.f32[0];
                    if (v422 < 1.8) {
                      __int32 v413 = v454.i32[0] + 1;
                    }
                    if (v422 < 1.2) {
                      ++v412;
                    }
                  }
                }
                v416 += 4;
                v419 = (float32x4_t *)((char *)v419 + 1);
                v418 = (float32x4_t *)((char *)v418 + 1);
                --v411;
              }
              while (v411);
            }
            float v423 = (float)v415;
            uint64_t v377 = v453;
            if ((float)((float)v414 / (float)v415) >= 0.4)
            {
              v362.i64[0] = 0x3FB47AE147AE147BLL;
              if ((float)((float)v413 / v423) <= 0.08)
              {
                *(double *)v355.i64 = (float)((float)v412 / v423);
                v356.i64[0] = 0x3F947AE147AE147BLL;
                if (*(double *)v355.i64 <= 0.02)
                {
LABEL_381:
                  objc_msgSend(*(id *)(v458.i64[0] + 24), "computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:", v126, v377, v354.n64_u64[0], *(double *)v355.i64, *(double *)v356.i64, *(double *)v362.i64, *(double *)v357.i64, v358.n64_f64[0]);
                  if (computeMask_foregroundContinuousGradient_backgroundSingleColor(v12, v459, v287 < 0.92, (uint64_t)v9, (uint64_t)v18, (char *)v346, v451, v457, v424, (float32x4_t)v455, v449, v425, v426))
                  {
                    id v427 = v456;
                    [v456 setObject:@"IconSegmentationForegroundStyleContinuousGradient" forKeyedSubscript:@"IconSegmentationForegroundStyleKey"];
                    [v427 setObject:@"IconSegmentationBackgroundStyleSingleColor" forKeyedSubscript:@"IconSegmentationBackgroundStyleKey"];
                    free(v346);
                    int v402 = 1;
                    goto LABEL_355;
                  }
                }
              }
            }
          }
        }
      }
      free(v346);
    }
    int v402 = 0;
    goto LABEL_355;
  }
  BOOL v168 = 0;
  if (v163 > 0.0004) {
    goto LABEL_286;
  }
  v454.i32[0] = v96;
  if (v164 <= 0.0004) {
    goto LABEL_286;
  }
  computeIconSegmentationFlagForExtraConfidence(v12, v459, (uint64_t)v18);
  if (v457)
  {
    if (!*(unsigned char *)(v458.i64[0] + 37)) {
      goto LABEL_285;
    }
    BOOL v168 = 0;
    if ((v18->i8[0] & 3) != 2) {
      goto LABEL_286;
    }
    uint64_t v207 = (int)v12 - 1;
    if (v18->i8[v207]) {
      goto LABEL_286;
    }
    if ((v18->i8[v207] & 2) == 0) {
      goto LABEL_286;
    }
    uint64_t v208 = (int)v459 - 1;
    if (v18->i8[v208 * (int)v12]) {
      goto LABEL_286;
    }
    if ((v18->i8[v208 * (int)v12] & 2) == 0) {
      goto LABEL_286;
    }
    uint64_t v209 = v450.i32[0] - 1;
    if ((v18->i8[v209] & 1) != 0 || (v18->i8[v209] & 2) == 0) {
      goto LABEL_286;
    }
    v204.i8[0] = *v9;
    v204.f32[0] = (float)v204.u32[0];
    LOBYTE(v205) = v9[1];
    LOBYTE(v206) = v9[2];
    v204.f32[1] = (float)v205;
    v204.f32[2] = (float)v206;
    float32x4_t v458 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v210 = &v9[4 * v207];
    unsigned int v211 = *v210;
    unsigned int v212 = v210[1];
    LOBYTE(v165) = v210[2];
    v213 = &v9[4 * v208 * (int)v12];
    v449.i32[0] = *v213;
    v450.i32[0] = v213[1];
    LOBYTE(v128) = v213[2];
    v214 = &v9[4 * v209];
    v447.i32[0] = *v214;
    v448.i32[0] = v214[1];
    LOBYTE(v127) = v214[2];
    __n128 v446 = (__n128)vdivq_f32(v204, v458);
    int32x4_t v455 = vdupq_n_s32(0x3DA0902Eu);
    if (ISSegmentationMathUtils_contrastRatio(v446, (__n128)v455) < 3.0) {
      goto LABEL_285;
    }
    *(float32x2_t *)v215.f32 = vcvt_f32_u32((uint32x2_t)__PAIR64__(v212, v211));
    v215.f32[2] = (float)v165;
    float32x4_t v445 = vdivq_f32(v215, v458);
    if (ISSegmentationMathUtils_contrastRatio((__n128)v445, (__n128)v455) < 3.0) {
      goto LABEL_285;
    }
    *(float32x2_t *)v216.f32 = vcvt_f32_u32((uint32x2_t)__PAIR64__(v450.u32[0], v449.u32[0]));
    v216.f32[2] = (float)LODWORD(v128);
    float32x4_t v450 = vdivq_f32(v216, v458);
    int32x4_t v455 = vdupq_n_s32(0x3DA0902Eu);
    if (ISSegmentationMathUtils_contrastRatio((__n128)v450, (__n128)v455) < 3.0) {
      goto LABEL_285;
    }
    *(float32x2_t *)v217.f32 = vcvt_f32_u32((uint32x2_t)__PAIR64__(v448.u32[0], v447.u32[0]));
    v217.f32[2] = (float)LODWORD(v127);
    float32x4_t v458 = vdivq_f32(v217, v458);
    if (ISSegmentationMathUtils_contrastRatio((__n128)v458, (__n128)v455) < 3.0) {
      goto LABEL_285;
    }
    if ((int)v459 >= 1)
    {
      unint64_t v221 = 0;
      int v222 = 0;
      float32x4_t v223 = vsubq_f32(v458, v450);
      float32x4_t v224 = vsubq_f32(v445, (float32x4_t)v446);
      float32x4_t v225 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      v226 = v9;
      v227 = v18;
      do
      {
        if ((int)v12 >= 1)
        {
          uint64_t v228 = 0;
          v218.f32[0] = (float)(int)v221 / (float)(int)v208;
          float32x4_t v218 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v218.f32, 0);
          do
          {
            if ((v227->i8[v228] & 9) == 8)
            {
              *(float *)v219.i32 = (float)(int)v228 / (float)(int)v207;
              float32x4_t v229 = vmlaq_n_f32(v450, v223, *(float *)v219.i32);
              float32x4_t v230 = vmlaq_n_f32((float32x4_t)v446, v224, *(float *)v219.i32);
              v219.i32[0] = *(_DWORD *)&v226[4 * v228];
              int8x16_t v231 = (int8x16_t)vmovl_u8(v219);
              *(float *)v220.i32 = (float)v231.u16[0];
              float32x4_t v232 = vmlaq_f32(v230, vsubq_f32(v229, v230), v218);
              v229.i32[0] = v231.u16[1];
              v229.i32[1] = v231.u16[2];
              *(float32x2_t *)v231.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v229.f32, (int8x8_t)0xFF000000FFLL));
              float32x4_t v233 = vsubq_f32(vdivq_f32((float32x4_t)vextq_s8(vextq_s8(v220, v220, 4uLL), v231, 0xCuLL), v225), v232);
              float32x4_t v234 = vmulq_f32(v233, v233);
              uint8x8_t v219 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v234, 2), vaddq_f32(v234, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v234.f32, 1))).u64[0];
              if (sqrtf(*(float *)v219.i32) > 0.20392) {
                ++v222;
              }
            }
            ++v228;
          }
          while (v12 != v228);
        }
        if (v222 > 60) {
          break;
        }
        ++v221;
        v227 = (float32x4_t *)((char *)v227 + (int)v12);
        v226 += 4 * (int)v12;
      }
      while (v221 < v459);
      if (v222 > 60) {
        goto LABEL_285;
      }
    }
  }
  *(__n64 *)v235.i8 = ISSegmentationMathUtils_rgb2hsv((int32x4_t)v444);
  v235.i32[0] = vextq_s8(v235, v235, 8uLL).u32[0];
  *(int8x8_t *)v235.i8 = vmvn_s8((int8x8_t)vcge_f32(*(float32x2_t *)v235.i8, (float32x2_t)0x3F0000003F000000));
  if (((v235.i32[1] | v235.i32[0]) & 1) == 0) {
    goto LABEL_285;
  }
  uint64_t v240 = v125;
  float v241 = 3.4028e38;
  do
  {
    float32x4_t v242 = *v136++;
    float32x4_t v243 = vsubq_f32(v444, v242);
    float32x4_t v244 = vmulq_f32(v243, v243);
    float32x4_t v245 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v244, 2);
    float v246 = sqrtf(vaddq_f32(v245, vaddq_f32(v244, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v244.f32, 1))).f32[0]);
    if (v246 < v241) {
      float v241 = v246;
    }
    --v240;
  }
  while (v240);
  v247.i32[0] = 1041536149;
  if (v241 < 0.1451) {
    goto LABEL_285;
  }
  if ((int)v12 < 5)
  {
    __int32 v249 = 0;
  }
  else
  {
    uint64_t v248 = 0;
    __int32 v249 = 0;
    v250 = (char *)v18 + 2 * v12;
    v251 = v250 + 3;
    uint64_t v252 = (uint64_t)&v9[8 * v12 + 8];
    uint64_t v253 = (uint64_t)&v250[v12 + 2];
    float32x4_t v247 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v245.i64[0] = 0xC0000000C0000000;
    v245.i64[1] = 0xC0000000C0000000;
    v244.i32[0] = 0.25;
    v236.i32[0] = 993257242;
    uint64_t v254 = 2;
    do
    {
      v255 = (__int32 *)v252;
      uint64_t v256 = v248;
      uint64_t v257 = (v459 - 2) - 2;
      if ((int)v459 >= 5)
      {
        do
        {
          if ((v251[v256 - 1] & 9) == 8
            && (v251[v256 - 2] & 9) == 8
            && (v251[v256] & 9) == 8
            && (v18->i8[v12 + 2 + v256] & 9) == 8
            && (*(unsigned char *)(v253 + v256) & 9) == 8)
          {
            v237.i32[0] = *v255;
            v238.i32[0] = v255[1];
            int8x16_t v258 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v237.f32);
            v237.i32[0] = *(v255 - 1);
            uint16x8_t v259 = vmovl_u8(*(uint8x8_t *)v237.f32);
            uint16x8_t v260 = vmovl_u8(*(uint8x8_t *)v238.f32);
            v237.i32[0] = *(_DWORD *)&v9[4 * v12 + 8 + 4 * v256];
            int8x16_t v261 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v237.f32);
            v237.i32[0] = *(_DWORD *)&v9[12 * v12 + 8 + 4 * v256];
            uint16x8_t v262 = vmovl_u8(*(uint8x8_t *)v237.f32);
            v238.f32[0] = (float)v258.u16[0];
            v239.i32[0] = v258.u16[1];
            v239.i32[1] = v258.u16[2];
            *(float32x2_t *)v258.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v239.i8, (int8x8_t)0xFF000000FFLL));
            *(float *)v239.i32 = (float)v259.u16[0];
            float32x4_t v263 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v238, (int8x16_t)v238, 4uLL), v258, 0xCuLL);
            v258.i32[0] = v259.u16[1];
            float32x4_t v264 = vdivq_f32(v263, v247);
            v258.i32[1] = v259.u16[2];
            *(float32x2_t *)v258.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v258.i8, (int8x8_t)0xFF000000FFLL));
            int8x16_t v265 = vextq_s8(v239, v239, 4uLL);
            *(float *)v239.i32 = (float)v260.u16[0];
            float32x4_t v266 = (float32x4_t)vextq_s8(v265, v258, 0xCuLL);
            v265.i32[0] = v260.u16[1];
            v265.i32[1] = v260.u16[2];
            *(float32x2_t *)v265.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v265.i8, (int8x8_t)0xFF000000FFLL));
            int8x16_t v267 = vextq_s8(v239, v239, 4uLL);
            float32x4_t v268 = vdivq_f32((float32x4_t)vextq_s8(v267, v265, 0xCuLL), v247);
            *(float *)v267.i32 = (float)v261.u16[0];
            v239.i32[0] = v261.u16[1];
            v239.i32[1] = v261.u16[2];
            *(float32x2_t *)v261.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v239.i8, (int8x8_t)0xFF000000FFLL));
            *(float *)v239.i32 = (float)v262.u16[0];
            float32x4_t v269 = (float32x4_t)vextq_s8(vextq_s8(v267, v267, 4uLL), v261, 0xCuLL);
            v261.i32[0] = v262.u16[1];
            __int32 v270 = v262.u16[2];
            float32x4_t v271 = vdivq_f32(v269, v247);
            v261.i32[1] = v270;
            *(float32x2_t *)v269.f32 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v261.i8, (int8x8_t)0xFF000000FFLL));
            float32x4_t v272 = vmlaq_f32(vaddq_f32(vdivq_f32(v266, v247), v268), v245, v264);
            float32x4_t v273 = vmulq_f32(v272, v272);
            float32x4_t v274 = vmlaq_f32(vaddq_f32(v271, vdivq_f32((float32x4_t)vextq_s8(vextq_s8(v239, v239, 4uLL), (int8x16_t)v269, 0xCuLL), v247)), v245, v264);
            float32x4_t v275 = vmulq_f32(v274, v274);
            float32x4_t v238 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v275.f32, 1);
            float32x4_t v237 = vaddq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v273, 2), vaddq_f32(v273, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v273.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v275, 2), vaddq_f32(v275, v238)));
            v237.f32[0] = 0.25 * v237.f32[0];
            if (v237.f32[0] > 0.0027451) {
              ++v249;
            }
          }
          v256 += v12;
          v255 += v12;
          --v257;
        }
        while (v257);
      }
      ++v254;
      ++v248;
      v252 += 4;
    }
    while (v254 != v12 - 2);
  }
  if (v249 > v454.i32[0]) {
    goto LABEL_285;
  }
  computeMask_foregroundSingleColor_backgroundContinuousGradient(v12, v459, v9, v451, v457, v444, v241, v247.f32[0], v245, v244, v236, v237, v238.f32[0]);
  id v166 = v456;
  [v456 setObject:@"IconSegmentationForegroundStyleSingleColor" forKeyedSubscript:@"IconSegmentationForegroundStyleKey"];
  [v456 setObject:&unk_1F064AC00 forKeyedSubscript:@"IconSegmentationForegroundNumberOfColorsKey"];
  v167 = @"IconSegmentationBackgroundStyleContinuousGradient";
LABEL_165:
  [v166 setObject:v167 forKeyedSubscript:@"IconSegmentationBackgroundStyleKey"];
  BOOL v168 = 1;
LABEL_286:
  free(v18);
  free((void *)v453);
LABEL_170:
  id v14 = v456;
  id v16 = v452;
LABEL_171:

  return v168;
}

- (BOOL)_computeImageWithWidth:(int)a3 height:(int)a4 ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:
{
  uint64_t v8 = v7;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  uint64_t v11 = v4;
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v15 = objc_opt_new();
  id v16 = v15;
  if (v8) {
    *uint64_t v8 = v15;
  }
  BOOL v17 = 1;
  if (![(ISIconSegmentation *)self _computeImageWithWidth:v13 height:v12 strict:1 ucharSamplesAndForegroundMask:v11 ucharTintable:v10 ucharDark:v9 feedback:v16])BOOL v17 = [(ISIconSegmentation *)self _computeImageWithWidth:v13 height:v12 strict:0 ucharSamplesAndForegroundMask:v11 ucharTintable:v10 ucharDark:v9 feedback:v16]; {

  }
  return v17;
}

- (BOOL)_computeImageWithCGImage:(ISIconSegmentation *)self ucharTintable:(SEL)a2 ucharDark:(CGImage *)a3 feedback:(char *)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  if (CGImageGetBitsPerComponent(a3) != 8) {
    return 0;
  }
  if (CGImageGetBitsPerPixel(a3) != 32) {
    return 0;
  }
  DataProvider = CGImageGetDataProvider(a3);
  if (!DataProvider) {
    return 0;
  }
  CFDataRef v12 = CGDataProviderCopyData(DataProvider);
  if (!v12) {
    return 0;
  }
  CFDataRef v13 = v12;
  BytePtr = CFDataGetBytePtr(v12);
  if (!BytePtr)
  {
    CFRelease(v13);
    return 0;
  }
  uint64_t v15 = BytePtr;
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  uint64_t v18 = (Height * Width);
  float32x4_t v19 = malloc_type_malloc(4 * (int)v18, 0x100004052888210uLL);
  float32x4_t v20 = v19;
  if ((int)v18 >= 1)
  {
    float32x4_t v21 = v19;
    do
    {
      int v22 = *(_DWORD *)v15;
      v15 += 4;
      *v21++ = v22;
      --v18;
    }
    while (v18);
  }
  CFRelease(v13);
  BOOL v23 = [(ISIconSegmentation *)self _computeImageWithWidth:Width height:Height ucharSamplesAndForegroundMask:v20 ucharTintable:a4 ucharDark:v7 feedback:v6];
  free(v20);
  return v23;
}

- (CGImage)createTintableImageWithCGImage:(CGImage *)a3
{
  int Width = CGImageGetWidth(a3);
  int Height = CGImageGetHeight(a3);
  uint64_t v7 = malloc_type_malloc(Width * Height, 0x100004077774924uLL);
  BOOL v8 = [(ISIconSegmentation *)self _computeImageWithCGImage:a3 ucharTintable:v7 ucharDark:0 feedback:0];
  uint64_t v9 = 0;
  if (v8) {
    uint64_t v9 = ISCreateCGImageMaskUchar(Width, Height, (uint64_t)v7);
  }
  free(v7);
  return v9;
}

- (CGImage)createDarkImageWithCGImage:(CGImage *)a3
{
  int Width = CGImageGetWidth(a3);
  int Height = CGImageGetHeight(a3);
  uint64_t v7 = malloc_type_malloc(4 * Width * Height, 0x100004052888210uLL);
  BOOL v8 = [(ISIconSegmentation *)self _computeImageWithCGImage:a3 ucharTintable:0 ucharDark:v7 feedback:0];
  uint64_t v9 = 0;
  if (v8) {
    uint64_t v9 = ISCreateCGImageUchar4AlphaPremultiplied(Width, Height, (uint64_t)v7);
  }
  free(v7);
  return v9;
}

- (BOOL)enableColorEnhancementInDarkImage
{
  return self->_enableColorEnhancementInDarkImage;
}

- (void)setEnableColorEnhancementInDarkImage:(BOOL)a3
{
  self->_enableColorEnhancementInDarkImage = a3;
}

- (BOOL)enableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage
{
  return self->_enableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage;
}

- (void)setEnableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage:(BOOL)a3
{
  self->_enableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grayscaleConversion, 0);
  objc_storeStrong((id *)&self->_looseForegroundSegmentation, 0);
  objc_storeStrong((id *)&self->_strictForegroundSegmentation, 0);
}

@end