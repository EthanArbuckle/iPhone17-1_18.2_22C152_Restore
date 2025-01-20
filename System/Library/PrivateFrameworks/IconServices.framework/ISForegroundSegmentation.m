@interface ISForegroundSegmentation
- (BOOL)computeMaskWithWidth:(int)a3 height:(int)a4 ucharSamplesAndMask:;
- (ISForegroundSegmentation)initWithStrict:(BOOL)a3;
@end

@implementation ISForegroundSegmentation

- (ISForegroundSegmentation)initWithStrict:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ISForegroundSegmentation;
  result = [(ISForegroundSegmentation *)&v7 init];
  if (result)
  {
    result->_strict = v3;
    *(_OWORD *)&result->_numberOfClusters = xmmword_1AE7C0E00;
    result->_clusterGroupingDistanceThreshold = 1.0;
    float v5 = 0.17647;
    if (v3)
    {
      float v5 = 0.015686;
      int v6 = 2;
    }
    else
    {
      int v6 = 150;
    }
    result->_borderNoiseScale = v5;
    result->_BOOLeanThreshold = v6;
  }
  return result;
}

- (BOOL)computeMaskWithWidth:(int)a3 height:(int)a4 ucharSamplesAndMask:
{
  uint64_t v6 = v4;
  uint64_t v7 = *(void *)&a3;
  v8 = self;
  uint64_t v9 = 0;
  v392[12] = *MEMORY[0x1E4F143B8];
  v5.i32[0] = a3 / 3;
  if (a3 >= 0) {
    int v10 = a3;
  }
  else {
    int v10 = a3 + 1;
  }
  LODWORD(v11) = v10 >> 1;
  float32x4_t v12 = v5;
  v12.i32[1] = 1;
  v392[0] = v12.i64[0];
  v392[1] = (v10 >> 1) | 0x100000000;
  LODWORD(v13) = 4 * a3 / 6;
  HIDWORD(v13) = 1;
  LODWORD(v14) = 1;
  LODWORD(v15) = 1;
  HIDWORD(v15) = a4 / 3;
  v392[2] = v13;
  v392[3] = v15;
  if (a4 >= 0) {
    int v16 = a4;
  }
  else {
    int v16 = a4 + 1;
  }
  int v17 = v16 >> 1;
  LODWORD(v18) = 1;
  HIDWORD(v18) = v17;
  HIDWORD(v14) = 4 * a4 / 6;
  LODWORD(v19) = a3 - 2;
  v392[4] = v18;
  v392[5] = v14;
  LODWORD(v18) = a3 - 2;
  HIDWORD(v18) = a4 / 3;
  LODWORD(v20) = a3 - 2;
  HIDWORD(v20) = v17;
  HIDWORD(v19) = 4 * a4 / 6;
  v392[6] = v18;
  v392[7] = v20;
  LODWORD(v21) = a3 / 3;
  HIDWORD(v21) = a4 - 2;
  v392[8] = v19;
  v392[9] = v21;
  HIDWORD(v11) = a4 - 2;
  HIDWORD(v22) = a4 - 2;
  v392[10] = v11;
  LODWORD(v22) = 4 * a3 / 6;
  v392[11] = v22;
  float32x4_t v23 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    v24 = (unsigned __int8 *)(v4 + 4 * (int)(v392[v9] + HIDWORD(v392[v9]) * a3));
    v12.i32[0] = *v24;
    v12.i32[1] = v24[1];
    *(float32x2_t *)v12.f32 = vcvt_f32_u32(*(uint32x2_t *)v12.f32);
    LOBYTE(v21) = v24[2];
    *(float *)&uint64_t v21 = (float)v21;
    v12.i32[2] = v21;
    float32x4_t v12 = vdivq_f32(v12, v23);
    *(float32x4_t *)&v390[4 * v9++ + 1] = v12;
  }
  while (v9 != 12);
  uint64_t v25 = 0;
  int v26 = 2 * a3;
  int v27 = a3 - 1;
  float32x4_t v28 = 0uLL;
  do
  {
    float32x4_t v28 = vaddq_f32(v28, *(float32x4_t *)&v390[v25 + 1]);
    v25 += 4;
  }
  while (v25 != 48);
  uint64_t v29 = 0;
  __asm { FMOV            V2.4S, #12.0 }
  float32x4_t v35 = vdivq_f32(v28, _Q2);
  float v36 = 0.0;
  do
  {
    float32x4_t v37 = vsubq_f32(*(float32x4_t *)&v390[v29 + 1], v35);
    float32x4_t v38 = vmulq_f32(v37, v37);
    v38.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0]);
    float v36 = v36 + (float)(v38.f32[0] * v38.f32[0]);
    v29 += 4;
  }
  while (v29 != 48);
  int v39 = a4 - 1;
  LODWORD(v40) = v26 / 3;
  LODWORD(v41) = v26 / 3;
  HIDWORD(v41) = a4 / 12;
  LODWORD(v42) = v26 / 3;
  HIDWORD(v42) = a4 / 10;
  LODWORD(v43) = a3 / 3;
  HIDWORD(v43) = a4 / 10;
  v391[0] = __PAIR64__(a4 / 12, v5.u32[0]);
  v391[1] = v41;
  v391[2] = v42;
  v391[3] = v43;
  LODWORD(v44) = a3 / 12;
  LODWORD(v41) = a3 / 12;
  HIDWORD(v41) = a4 / 3;
  HIDWORD(v44) = 2 * a4 / 3;
  v391[4] = v41;
  v391[5] = v44;
  LODWORD(v44) = a3 / 10;
  LODWORD(v41) = a3 / 10;
  HIDWORD(v41) = a4 / 3;
  LODWORD(v42) = v27 - a3 / 12;
  LODWORD(v43) = v42;
  HIDWORD(v43) = a4 / 3;
  v391[6] = v41;
  v391[7] = v44;
  HIDWORD(v42) = HIDWORD(v44);
  v391[8] = v43;
  v391[9] = v42;
  LODWORD(v44) = v27 - a3 / 10;
  LODWORD(v41) = v44;
  HIDWORD(v41) = a4 / 3;
  HIDWORD(v44) = HIDWORD(v42);
  v391[10] = v41;
  v391[11] = v44;
  LODWORD(v44) = a3 / 3;
  HIDWORD(v44) = a4 - 1 - a4 / 12;
  LODWORD(v41) = v26 / 3;
  HIDWORD(v41) = HIDWORD(v44);
  v5.i32[1] = a4 - 1 - a4 / 10;
  v391[12] = v44;
  v391[13] = v41;
  HIDWORD(v40) = v5.i32[1];
  double v45 = (double)a3 / 8.5;
  double v46 = (double)a4 / 8.5;
  LODWORD(v42) = (int)v45;
  int v47 = (int)((double)v27 - v45);
  LODWORD(v45) = (int)v45;
  HIDWORD(v45) = (int)v46;
  v391[14] = v5.i64[0];
  v391[15] = v40;
  LODWORD(v48) = v47;
  LODWORD(v40) = v47;
  HIDWORD(v40) = (int)v46;
  *(double *)&v391[16] = v45;
  v391[17] = v40;
  HIDWORD(v42) = (int)((double)(a4 - 1) - v46);
  HIDWORD(v48) = HIDWORD(v42);
  v391[18] = v42;
  v391[19] = v48;
  MEMORY[0x1F4188790](self);
  uint64_t v56 = 0;
  float32x4_t v57 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    v58 = (unsigned __int8 *)(v6 + 4 * (int)(v391[v56] + HIDWORD(v391[v56]) * v7));
    v54.i32[0] = *v58;
    v54.i32[1] = v58[1];
    *(float32x2_t *)v54.f32 = vcvt_f32_u32(*(uint32x2_t *)v54.f32);
    LOBYTE(v55) = v58[2];
    float v55 = (float)LODWORD(v55);
    v54.f32[2] = v55;
    float32x4_t v54 = vdivq_f32(v54, v57);
    *(float32x4_t *)&v372[16 * v56++] = v54;
  }
  while (v56 != 20);
  uint64_t v59 = 0;
  uint64_t v60 = (v49 * v7);
  float32x4_t v61 = 0uLL;
  do
  {
    float32x4_t v61 = vaddq_f32(v61, *(float32x4_t *)&v372[v59]);
    v59 += 16;
  }
  while (v59 != 320);
  uint64_t v62 = 0;
  __asm { FMOV            V3.4S, #20.0 }
  float32x4_t v64 = vdivq_f32(v61, _Q3);
  double v65 = 0.0;
  do
  {
    float32x4_t v66 = vsubq_f32(*(float32x4_t *)&v372[v62], v64);
    float32x4_t v67 = vmulq_f32(v66, v66);
    v67.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v67, 2), vaddq_f32(v67, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v67.f32, 1))).f32[0]);
    *(float *)&double v65 = *(float *)&v65 + (float)(v67.f32[0] * v67.f32[0]);
    v62 += 16;
  }
  while (v62 != 320);
  int v68 = 0;
  float32x4_t v69 = vsubq_f32(v53, v64);
  float32x4_t v70 = vmulq_f32(v69, v69);
  float32x4_t v71 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v70, 2), vaddq_f32(v70, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v70.f32, 1)));
  uint64_t v382 = 2;
  if (sqrtf(v71.f32[0]) > 0.196078431)
  {
    v52.i32[1] = 1064308752;
    if ((float)(v52.f32[0] / 12.0) <= 0.00392156863)
    {
      double v65 = (float)(*(float *)&v65 / 20.0);
      if (v65 <= 0.00392156863)
      {
        uint64_t v382 = v51;
        int v68 = v51;
      }
      else
      {
        int v68 = 0;
        uint64_t v382 = 2;
      }
    }
  }
  int borderSamplingWidth = v8->_borderSamplingWidth;
  LODWORD(v65) = *(_DWORD *)(v6 + 4 * ((int)v382 + (int)v382 * (int)v7));
  int16x4_t v73 = (int16x4_t)vmovl_u8(*(uint8x8_t *)&v65).u64[0];
  int v74 = v27 - v68;
  if (v27 - v68 <= v68)
  {
LABEL_30:
    if (borderSamplingWidth < 1)
    {
LABEL_36:
      if (v74 <= v68)
      {
LABEL_42:
        if (borderSamplingWidth < 1)
        {
LABEL_48:
          v52.f32[0] = (float)v73.u16[0];
          v71.i32[0] = v73.u16[1];
          v71.i32[1] = v73.u16[2];
          *(float32x2_t *)v71.f32 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v71.f32, (int8x8_t)0xFF000000FFLL));
          float32x4_t v92 = vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v52, (int8x16_t)v52, 4uLL), (int8x16_t)v71, 0xCuLL), (float32x4_t)vdupq_n_s32(0x437F0000u));
          v92.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v92, 2), vaddq_f32(v92, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v92.f32, 1))).f32[0]/ 3.0;
          v93.f32[0] = (float)(v92.f32[0] * -1.1) + 7.41;
          float v94 = (float)(v92.f32[0] * -37.0) + 139.52;
          if (v8->_strict) {
            float v94 = v93.f32[0];
          }
          if ((int)v60 >= 1)
          {
            *(uint64_t *)((char *)v52.i64 + 4) = v71.i64[0];
            v95 = (char *)(v6 + 3);
            do
            {
              v71.i32[0] = *(v95 - 3);
              v71.i32[1] = *(v95 - 2);
              *(float32x2_t *)v71.f32 = vcvt_f32_u32(*(uint32x2_t *)v71.f32);
              v93.i8[0] = *(v95 - 1);
              v71.f32[2] = (float)v93.u32[0];
              float32x4_t v96 = vsubq_f32(v71, v52);
              float32x4_t v97 = vmulq_f32(v96, v96);
              float32x4_t v93 = vaddq_f32(v97, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v97.f32, 1));
              float32x4_t v71 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v97, 2), v93);
              if (sqrtf(v71.f32[0]) <= v94) {
                char v98 = 0;
              }
              else {
                char v98 = -1;
              }
              char *v95 = v98;
              v95 += 4;
              --v60;
            }
            while (v60);
          }
          return 1;
        }
        uint64_t v88 = (int)v382;
        v89 = (__int32 *)(v6 + 4 * ((int)v382 + v68 * (uint64_t)(int)v7));
        while (1)
        {
          v90 = v89;
          int v91 = ~(2 * v68) + v49;
          if (~v68 + v49 > v68) {
            break;
          }
LABEL_47:
          ++v88;
          ++v89;
          if (v88 >= borderSamplingWidth + (int)v382) {
            goto LABEL_48;
          }
        }
        while (1)
        {
          v52.i32[0] = *v90;
          float32x4_t v52 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v52.f32);
          *(int16x4_t *)v52.f32 = vceq_s16(*(int16x4_t *)v52.f32, v73);
          v52.i8[1] = v52.i8[2];
          v52.i8[2] = v52.i8[4];
          v52.i8[3] = v52.i8[4];
          v52.i16[2] = v52.i16[0];
          v52.i8[6] = v52.i8[3];
          v52.i8[7] = v52.i8[3];
          if ((vminv_u8(*(uint8x8_t *)v52.f32) & 0x80) == 0) {
            break;
          }
          v90 += (int)v7;
          if (!--v91) {
            goto LABEL_47;
          }
        }
      }
      else
      {
        int v83 = ~v382 + v49;
        uint64_t v84 = v68;
        v85 = (__int32 *)(v6 + 4 * (v68 + (int)v7 * (uint64_t)(v83 - borderSamplingWidth)));
        while (1)
        {
          v86 = v85;
          uint64_t v87 = v83 - borderSamplingWidth;
          if (borderSamplingWidth >= 1) {
            break;
          }
LABEL_41:
          ++v84;
          ++v85;
          if (v74 == v84) {
            goto LABEL_42;
          }
        }
        while (1)
        {
          v52.i32[0] = *v86;
          float32x4_t v52 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v52.f32);
          *(int16x4_t *)v52.f32 = vceq_s16(*(int16x4_t *)v52.f32, v73);
          v52.i8[1] = v52.i8[2];
          v52.i8[2] = v52.i8[4];
          v52.i8[3] = v52.i8[4];
          v52.i16[2] = v52.i16[0];
          v52.i8[6] = v52.i8[3];
          v52.i8[7] = v52.i8[3];
          if ((vminv_u8(*(uint8x8_t *)v52.f32) & 0x80) == 0) {
            break;
          }
          ++v87;
          v86 += (int)v7;
          if (v87 >= v83) {
            goto LABEL_41;
          }
        }
      }
    }
    else
    {
      uint64_t v79 = v27 - (int)v382 - borderSamplingWidth;
      v80 = (__int32 *)(v6 + 4 * (v79 + v68 * (uint64_t)(int)v7));
      while (1)
      {
        v81 = v80;
        int v82 = ~(2 * v68) + v49;
        if (~v68 + v49 > v68) {
          break;
        }
LABEL_35:
        ++v79;
        ++v80;
        if (v79 >= v27 - (int)v382) {
          goto LABEL_36;
        }
      }
      while (1)
      {
        v52.i32[0] = *v81;
        float32x4_t v52 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v52.f32);
        *(int16x4_t *)v52.f32 = vceq_s16(*(int16x4_t *)v52.f32, v73);
        v52.i8[1] = v52.i8[2];
        v52.i8[2] = v52.i8[4];
        v52.i8[3] = v52.i8[4];
        v52.i16[2] = v52.i16[0];
        v52.i8[6] = v52.i8[3];
        v52.i8[7] = v52.i8[3];
        if ((vminv_u8(*(uint8x8_t *)v52.f32) & 0x80) == 0) {
          break;
        }
        v81 += (int)v7;
        if (!--v82) {
          goto LABEL_35;
        }
      }
    }
  }
  else
  {
    uint64_t v75 = v68;
    v76 = (__int32 *)(v6 + 4 * (v68 + (int)v382 * (uint64_t)(int)v7));
    while (1)
    {
      v77 = v76;
      uint64_t v78 = (int)v382;
      if (borderSamplingWidth >= 1) {
        break;
      }
LABEL_29:
      ++v75;
      ++v76;
      if (v74 == v75) {
        goto LABEL_30;
      }
    }
    while (1)
    {
      v52.i32[0] = *v77;
      float32x4_t v52 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v52.f32);
      *(int16x4_t *)v52.f32 = vceq_s16(*(int16x4_t *)v52.f32, v73);
      v52.i8[1] = v52.i8[2];
      v52.i8[2] = v52.i8[4];
      v52.i8[3] = v52.i8[4];
      v52.i16[2] = v52.i16[0];
      v52.i8[6] = v52.i8[3];
      v52.i8[7] = v52.i8[3];
      if ((vminv_u8(*(uint8x8_t *)v52.f32) & 0x80) == 0) {
        break;
      }
      ++v78;
      v77 += (int)v7;
      if (v78 >= borderSamplingWidth + (int)v382) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v381 = (v49 * v7);
  int v376 = v49;
  uint64_t v373 = v50;
  unint64_t v100 = (unint64_t)malloc_type_malloc(16 * v8->_maxNumberOfClusteringSamples, 0x1000040451B5BE8uLL);
  v379 = (float32x4_t *)v100;
  v390[0] = 10;
  int maxNumberOfClusteringSamples = v8->_maxNumberOfClusteringSamples;
  uint64_t v383 = v6;
  v384 = v8;
  uint64_t v385 = v7;
  if (maxNumberOfClusteringSamples < 4)
  {
    int v103 = 0;
  }
  else
  {
    int v102 = 0;
    int v103 = 0;
    float v104 = (float)v68;
    float v105 = (float)(int)v382;
    *(float *)v388.i32 = (float)(v7 - v68) - (float)v68;
    int v106 = v7;
    v375 = (int *)(int)v7;
    int32x4_t v387 = vdupq_n_s32(0x437F0000u);
    uint64_t v107 = v6 - 4;
    uint64_t v108 = 4 * v106;
    float32x4_t v386 = (float32x4_t)vdupq_n_s32(0xC37F0000);
    do
    {
      int v109 = rand_r(v390);
      int v110 = (int)(float)(v104 + (float)((float)((float)v109 * 4.6566e-10) * *(float *)v388.i32));
      float v111 = (float)(v8->_borderSamplingWidth + v382);
      int v112 = rand_r(v390);
      *(float *)&unsigned int v113 = v111 - v105;
      int v114 = (int)(float)(v105 + (float)((float)((float)v112 * 4.6566e-10) * (float)(v111 - v105)));
      v115 = (unsigned __int8 *)(v383 + 4 * (v110 + v114 * (int)v385));
      v116.i32[0] = *v115;
      v116.i32[1] = v115[1];
      *(float32x2_t *)v117.f32 = vcvt_f32_u32(v116);
      LOBYTE(v113) = v115[2];
      v117.f32[2] = (float)v113;
      float32x4_t v389 = vdivq_f32(v117, (float32x4_t)v387);
      double v118 = ISSegmentationMathUtils_luma(v389);
      float v119 = *(float *)&v118;
      unint64_t v100 = rand_r(v390);
      if ((float)((float)(int)v100 * 4.6566e-10) <= (float)((float)(v119 * -0.47619) + 1.0)
        && (v110 <= 1 ? (uint64_t v122 = 1) : (uint64_t v122 = v110),
            v110 + 1 < v27 ? (int v123 = v110 + 1) : (int v123 = v27),
            (int)v122 - 1 <= v123))
      {
        int v125 = 0;
        if (v114 <= 1) {
          uint64_t v126 = 1;
        }
        else {
          uint64_t v126 = v114;
        }
        int v127 = v126 - 1;
        if (v114 + 1 < v39) {
          int v128 = v114 + 1;
        }
        else {
          int v128 = v39;
        }
        uint64_t v129 = v108 * (v126 - 1) + 4 * v122;
        uint64_t v130 = v122 - 1;
        uint64_t v131 = (v123 + 1);
        v132 = (__int32 *)(v107 + v129);
        uint64_t v133 = (v128 + 1) - v126 + 1;
        v8 = v384;
        do
        {
          uint64_t v134 = v133;
          v135 = v132;
          if (v127 <= v128)
          {
            do
            {
              v120.i32[0] = *v135;
              int8x16_t v136 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v120.f32);
              unint64_t v100 = v136.u16[1];
              v121.f32[0] = (float)v136.u16[0];
              v137.i32[0] = v136.u16[1];
              v137.i32[1] = v136.u16[2];
              *(float32x2_t *)v136.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v137, (int8x8_t)0xFF000000FFLL));
              float32x4_t v138 = vaddq_f32(v389, vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v121, (int8x16_t)v121, 4uLL), v136, 0xCuLL), v386));
              float32x4_t v139 = vmulq_f32(v138, v138);
              float32x4_t v121 = vaddq_f32(v139, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v139.f32, 1));
              float32x4_t v120 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v139, 2), v121);
              *(double *)v120.i64 = sqrtf(v120.f32[0]);
              if (*(double *)v120.i64 <= 0.0431372549) {
                ++v125;
              }
              v135 = (__int32 *)((char *)v135 + v108);
              --v134;
            }
            while (v134);
          }
          ++v130;
          ++v132;
        }
        while (v130 != v131);
        if (v125 >= 6)
        {
          v120.i32[0] = LODWORD(v384->_borderNoiseScale);
          int32x4_t v380 = (int32x4_t)v120;
          *(float *)&uint64_t v140 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
          v378.i64[0] = v140;
          *(float *)&uint64_t v141 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
          v377.i64[0] = v141;
          float v142 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
          float32x4_t v143 = v378;
          v143.i32[1] = v377.i32[0];
          v143.f32[2] = v142;
          v379[v103++] = vaddq_f32(v389, vmulq_n_f32(v143, *(float *)v380.i32));
        }
      }
      else
      {
        v8 = v384;
      }
      ++v102;
      int v124 = v8->_maxNumberOfClusteringSamples;
    }
    while (v102 < v124 / 4);
    if (v124 >= 4)
    {
      int v144 = 0;
      int v145 = v385 - v382;
      float v146 = (float)(v385 - v382);
      *(float *)v387.i32 = (float)(v376 - v68) - v104;
      uint64_t v147 = 4 * (void)v375;
      float32x4_t v386 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      int32x4_t v380 = vdupq_n_s32(0xC37F0000);
      do
      {
        float v148 = (float)(v145 - v8->_borderSamplingWidth);
        int v149 = (int)(float)(v148 + (float)((float)((float)rand_r(v390) * 4.6566e-10) * (float)(v146 - v148)));
        int v150 = rand_r(v390);
        unsigned int v151 = v387.i32[0];
        int v152 = (int)(float)(v104 + (float)((float)((float)v150 * 4.6566e-10) * *(float *)v387.i32));
        v153 = (unsigned __int8 *)(v383 + 4 * (v149 + v152 * (int)v385));
        v154.i32[0] = *v153;
        v154.i32[1] = v153[1];
        *(float32x2_t *)v155.f32 = vcvt_f32_u32(v154);
        LOBYTE(v151) = v153[2];
        v155.f32[2] = (float)v151;
        float32x4_t v389 = vdivq_f32(v155, v386);
        double v156 = ISSegmentationMathUtils_luma(v389);
        float v157 = *(float *)&v156;
        unint64_t v100 = rand_r(v390);
        if ((float)((float)(int)v100 * 4.6566e-10) <= (float)((float)(v157 * -0.47619) + 1.0)
          && (v149 <= 1 ? (uint64_t v160 = 1) : (uint64_t v160 = v149),
              v149 + 1 < v27 ? (int v161 = v149 + 1) : (int v161 = v27),
              (int)v160 - 1 <= v161))
        {
          int v163 = 0;
          if (v152 <= 1) {
            uint64_t v164 = 1;
          }
          else {
            uint64_t v164 = v152;
          }
          int v165 = v164 - 1;
          if (v152 + 1 < v39) {
            int v166 = v152 + 1;
          }
          else {
            int v166 = v39;
          }
          uint64_t v167 = v147 * (v164 - 1) + 4 * v160;
          uint64_t v168 = v160 - 1;
          uint64_t v169 = (v161 + 1);
          v170 = (__int32 *)(v107 + v167);
          uint64_t v171 = (v166 + 1) - v164 + 1;
          v8 = v384;
          do
          {
            uint64_t v172 = v171;
            v173 = v170;
            if (v165 <= v166)
            {
              do
              {
                v158.i32[0] = *v173;
                int8x16_t v174 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v158.f32);
                unint64_t v100 = v174.u16[1];
                v159.f32[0] = (float)v174.u16[0];
                v175.i32[0] = v174.u16[1];
                v175.i32[1] = v174.u16[2];
                *(float32x2_t *)v174.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v175, (int8x8_t)0xFF000000FFLL));
                float32x4_t v176 = vaddq_f32(v389, vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v159, (int8x16_t)v159, 4uLL), v174, 0xCuLL), (float32x4_t)v380));
                float32x4_t v177 = vmulq_f32(v176, v176);
                float32x4_t v159 = vaddq_f32(v177, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v177.f32, 1));
                float32x4_t v158 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v177, 2), v159);
                *(double *)v158.i64 = sqrtf(v158.f32[0]);
                if (*(double *)v158.i64 <= 0.0431372549) {
                  ++v163;
                }
                v173 = (__int32 *)((char *)v173 + v147);
                --v172;
              }
              while (v172);
            }
            ++v168;
            ++v170;
          }
          while (v168 != v169);
          if (v163 >= 6)
          {
            v158.i32[0] = LODWORD(v384->_borderNoiseScale);
            float32x4_t v378 = v158;
            *(float *)&uint64_t v178 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
            v377.i64[0] = v178;
            *(float *)&v179 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
            v375 = v179;
            float v180 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
            float32x4_t v181 = v377;
            v181.i32[1] = (int)v375;
            v181.f32[2] = v180;
            v379[v103++] = vaddq_f32(v389, vmulq_n_f32(v181, v378.f32[0]));
          }
        }
        else
        {
          v8 = v384;
        }
        ++v144;
        int v162 = v8->_maxNumberOfClusteringSamples;
      }
      while (v144 < v162 / 4);
      if (v162 >= 4)
      {
        int v182 = 0;
        int v183 = v376 - v382;
        float v184 = (float)(v376 - v382);
        float32x4_t v386 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        int32x4_t v380 = vdupq_n_s32(0xC37F0000);
        do
        {
          int v185 = rand_r(v390);
          int v186 = (int)(float)(v104 + (float)((float)((float)v185 * 4.6566e-10) * *(float *)v388.i32));
          float v187 = (float)(v183 - v8->_borderSamplingWidth);
          int v188 = rand_r(v390);
          *(float *)&unsigned int v189 = v184 - v187;
          int v190 = (int)(float)(v187 + (float)((float)((float)v188 * 4.6566e-10) * (float)(v184 - v187)));
          v191 = (unsigned __int8 *)(v383 + 4 * (v186 + v190 * (int)v385));
          v192.i32[0] = *v191;
          v192.i32[1] = v191[1];
          *(float32x2_t *)v193.f32 = vcvt_f32_u32(v192);
          LOBYTE(v189) = v191[2];
          v193.f32[2] = (float)v189;
          float32x4_t v389 = vdivq_f32(v193, v386);
          double v194 = ISSegmentationMathUtils_luma(v389);
          float v195 = *(float *)&v194;
          unint64_t v100 = rand_r(v390);
          if ((float)((float)(int)v100 * 4.6566e-10) <= (float)((float)(v195 * -0.47619) + 1.0)
            && (v186 <= 1 ? (uint64_t v198 = 1) : (uint64_t v198 = v186),
                v186 + 1 < v27 ? (int v199 = v186 + 1) : (int v199 = v27),
                (int)v198 - 1 <= v199))
          {
            int v201 = 0;
            if (v190 <= 1) {
              uint64_t v202 = 1;
            }
            else {
              uint64_t v202 = v190;
            }
            int v203 = v202 - 1;
            if (v190 + 1 < v39) {
              int v204 = v190 + 1;
            }
            else {
              int v204 = v39;
            }
            uint64_t v205 = v147 * (v202 - 1) + 4 * v198;
            uint64_t v206 = v198 - 1;
            uint64_t v207 = (v199 + 1);
            v208 = (__int32 *)(v107 + v205);
            uint64_t v209 = (v204 + 1) - v202 + 1;
            v8 = v384;
            do
            {
              uint64_t v210 = v209;
              v211 = v208;
              if (v203 <= v204)
              {
                do
                {
                  v196.i32[0] = *v211;
                  int8x16_t v212 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v196.f32);
                  unint64_t v100 = v212.u16[1];
                  v197.f32[0] = (float)v212.u16[0];
                  v213.i32[0] = v212.u16[1];
                  v213.i32[1] = v212.u16[2];
                  *(float32x2_t *)v212.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v213, (int8x8_t)0xFF000000FFLL));
                  float32x4_t v214 = vaddq_f32(v389, vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v197, (int8x16_t)v197, 4uLL), v212, 0xCuLL), (float32x4_t)v380));
                  float32x4_t v215 = vmulq_f32(v214, v214);
                  float32x4_t v197 = vaddq_f32(v215, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v215.f32, 1));
                  float32x4_t v196 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v215, 2), v197);
                  *(double *)v196.i64 = sqrtf(v196.f32[0]);
                  if (*(double *)v196.i64 <= 0.0431372549) {
                    ++v201;
                  }
                  v211 = (__int32 *)((char *)v211 + v147);
                  --v210;
                }
                while (v210);
              }
              ++v206;
              ++v208;
            }
            while (v206 != v207);
            if (v201 >= 6)
            {
              v196.i32[0] = LODWORD(v384->_borderNoiseScale);
              float32x4_t v378 = v196;
              *(float *)&uint64_t v216 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
              v377.i64[0] = v216;
              *(float *)&v217 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
              v375 = v217;
              float v218 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
              float32x4_t v219 = v377;
              v219.i32[1] = (int)v375;
              v219.f32[2] = v218;
              v379[v103++] = vaddq_f32(v389, vmulq_n_f32(v219, v378.f32[0]));
            }
          }
          else
          {
            v8 = v384;
          }
          ++v182;
          int v200 = v8->_maxNumberOfClusteringSamples;
        }
        while (v182 < v200 / 4);
        if (v200 >= 4)
        {
          int v220 = 0;
          int32x4_t v388 = vdupq_n_s32(0x437F0000u);
          uint64_t v221 = v383;
          float32x4_t v386 = (float32x4_t)vdupq_n_s32(0xC37F0000);
          do
          {
            float v222 = (float)(v8->_borderSamplingWidth + v382);
            int v223 = (int)(float)(v105 + (float)((float)((float)rand_r(v390) * 4.6566e-10) * (float)(v222 - v105)));
            int v224 = rand_r(v390);
            unsigned int v225 = v387.i32[0];
            int v226 = (int)(float)(v104 + (float)((float)((float)v224 * 4.6566e-10) * *(float *)v387.i32));
            v227 = (unsigned __int8 *)(v221 + 4 * (v223 + v226 * (int)v385));
            v228.i32[0] = *v227;
            v228.i32[1] = v227[1];
            *(float32x2_t *)v229.f32 = vcvt_f32_u32(v228);
            LOBYTE(v225) = v227[2];
            v229.f32[2] = (float)v225;
            float32x4_t v389 = vdivq_f32(v229, (float32x4_t)v388);
            double v230 = ISSegmentationMathUtils_luma(v389);
            float v231 = *(float *)&v230;
            unint64_t v100 = rand_r(v390);
            if ((float)((float)(int)v100 * 4.6566e-10) <= (float)((float)(v231 * -0.47619) + 1.0)
              && (v223 <= 1 ? (uint64_t v234 = 1) : (uint64_t v234 = v223),
                  v223 + 1 < v27 ? (int v235 = v223 + 1) : (int v235 = v27),
                  (int)v234 - 1 <= v235))
            {
              int v236 = 0;
              if (v226 <= 1) {
                uint64_t v237 = 1;
              }
              else {
                uint64_t v237 = v226;
              }
              int v238 = v237 - 1;
              if (v226 + 1 < v39) {
                int v239 = v226 + 1;
              }
              else {
                int v239 = v39;
              }
              uint64_t v240 = v147 * (v237 - 1) + 4 * v234;
              uint64_t v241 = v234 - 1;
              uint64_t v242 = (v235 + 1);
              v243 = (__int32 *)(v107 + v240);
              uint64_t v244 = (v239 + 1) - v237 + 1;
              v8 = v384;
              do
              {
                uint64_t v245 = v244;
                v246 = v243;
                if (v238 <= v239)
                {
                  do
                  {
                    v232.i32[0] = *v246;
                    int8x16_t v247 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v232.f32);
                    unint64_t v100 = v247.u16[1];
                    v233.f32[0] = (float)v247.u16[0];
                    v248.i32[0] = v247.u16[1];
                    v248.i32[1] = v247.u16[2];
                    *(float32x2_t *)v247.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v248, (int8x8_t)0xFF000000FFLL));
                    float32x4_t v249 = vaddq_f32(v389, vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v233, (int8x16_t)v233, 4uLL), v247, 0xCuLL), v386));
                    float32x4_t v250 = vmulq_f32(v249, v249);
                    float32x4_t v233 = vaddq_f32(v250, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v250.f32, 1));
                    float32x4_t v232 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v250, 2), v233);
                    *(double *)v232.i64 = sqrtf(v232.f32[0]);
                    if (*(double *)v232.i64 <= 0.0431372549) {
                      ++v236;
                    }
                    v246 = (__int32 *)((char *)v246 + v147);
                    --v245;
                  }
                  while (v245);
                }
                ++v241;
                ++v243;
              }
              while (v241 != v242);
              if (v236 >= 6)
              {
                v232.i32[0] = LODWORD(v384->_borderNoiseScale);
                int32x4_t v380 = (int32x4_t)v232;
                *(float *)&uint64_t v251 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
                v378.i64[0] = v251;
                *(float *)&uint64_t v252 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
                v377.i64[0] = v252;
                float v253 = ISSegmentationMathUtils_sampleNormalDistribution(v390);
                float32x4_t v254 = v378;
                v254.i32[1] = v377.i32[0];
                v254.f32[2] = v253;
                v379[v103++] = vaddq_f32(v389, vmulq_n_f32(v254, *(float *)v380.i32));
              }
            }
            else
            {
              v8 = v384;
            }
            ++v220;
          }
          while (v220 < v8->_maxNumberOfClusteringSamples / 4);
        }
      }
    }
  }
  uint64_t v255 = MEMORY[0x1F4188790](v100);
  v257 = (float32x4_t *)&v372[-16 * v256];
  uint64_t v258 = MEMORY[0x1F4188790](v255);
  v260 = &v372[-16 * v259];
  uint64_t v261 = MEMORY[0x1F4188790](v258);
  v263 = &v372[-16 * v262];
  MEMORY[0x1F4188790](v261);
  v265 = (float *)&v372[-((v264 + 15) & 0x7FFFFFFF0)];
  v267 = (float32x4_t *)malloc_type_malloc(4 * v266 * v103, 0x100004052888210uLL);
  int numberOfClusters = v8->_numberOfClusters;
  int numberOfClusteringSteps = v8->_numberOfClusteringSteps;
  v270 = v379;
  v380.i64[0] = (uint64_t)v260;
  v377.i64[0] = (uint64_t)v263;
  ISSegmentationMathUtils_gmm(v103, numberOfClusters, numberOfClusteringSteps, v379, v257, (uint64_t)v260, (uint64_t)v263, v265, v267);
  free(v270);
  free(v267);
  uint64_t v272 = v8->_numberOfClusters;
  if ((int)v272 <= 1)
  {
    int v273 = 0;
  }
  else
  {
    int v273 = 0;
    float v274 = *v265;
    for (uint64_t i = 1; i != v272; ++i)
    {
      if (v265[i] > v274)
      {
        int v273 = i;
        float v274 = v265[i];
      }
    }
  }
  uint64_t v276 = MEMORY[0x1F4188790](v271);
  v378.i64[0] = (uint64_t)&v372[-v277];
  uint64_t v278 = MEMORY[0x1F4188790](v276);
  v375 = (int *)&v372[-((4 * v272 + 15) & 0x7FFFFFFF0)];
  uint64_t v279 = MEMORY[0x1F4188790](v278);
  v379 = (float32x4_t *)&v372[-16 * v272];
  MEMORY[0x1F4188790](v279);
  v374 = (float32x4_t *)&v372[-16 * v280];
  float clusterGroupingDistanceThreshold = v8->_clusterGroupingDistanceThreshold;
  if ((int)v272 >= 1)
  {
    uint64_t v282 = 0;
    uint64_t v283 = v380.i64[0] + 32;
    uint64_t v284 = v378.i64[0];
    do
    {
      uint64_t v285 = 0;
      uint64_t v286 = v380.i64[0] + 48 * v282;
      float32x4_t v287 = *(float32x4_t *)(v286 + 32);
      int32x4_t v388 = *(int32x4_t *)(v286 + 16);
      float32x4_t v389 = v287;
      float32x4_t v288 = *(float32x4_t *)v286;
      float32x4_t v386 = v257[v282];
      int32x4_t v387 = (int32x4_t)v288;
      v289 = (float32x4_t *)v283;
      do
      {
        *(float *)(v284 + 4 * v285) = ISSegmentationMathUtils_bhattacharyyaDistance(v386, (float32x4_t)v387, (float32x4_t)v388, v389, v257[v285], v289[-2], v289[-1], *v289);
        ++v285;
        v289 += 3;
      }
      while (v272 != v285);
      ++v282;
      v284 += 4 * v272;
    }
    while (v282 != v272);
  }
  v290 = objc_opt_new();
  v291 = objc_opt_new();
  v292 = objc_opt_new();
  if ((int)v272 >= 1)
  {
    uint64_t v293 = 0;
    float32x4_t v294 = v257[v273];
    __asm { FMOV            V0.4S, #-1.0 }
    float32x4_t v296 = vaddq_f32(v294, _Q0);
    float32x4_t v297 = vmulq_f32(v296, v296);
    float32x4_t v389 = v294;
    float32x4_t v298 = vmulq_f32(v294, v294);
    double v299 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v297, 2), vaddq_f32(v297, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v297.f32, 1))).f32[0])* 0.19;
    double v300 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v298, 2), vaddq_f32(v298, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v298.f32, 1))).f32[0])* 0.19;
    __asm { FMOV            V0.4S, #1.0 }
    int32x4_t v380 = (int32x4_t)_Q0;
    do
    {
      int32x4_t v388 = (int32x4_t)v257[v293];
      *(double *)v302.i64 = ISSegmentationMathUtils_clampedProject((float32x4_t)v388, v389, (float32x4_t)v380);
      int32x4_t v387 = (int32x4_t)v302;
      *(double *)v303.i64 = ISSegmentationMathUtils_clampedProject((float32x4_t)v388, v389, (float32x4_t)0);
      float32x4_t v304 = vsubq_f32((float32x4_t)v388, (float32x4_t)v387);
      float32x4_t v305 = vmulq_f32(v304, v304);
      _NF = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v305, 2), vaddq_f32(v305, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v305.f32, 1))).f32[0]) < 0.0196078431;
      float32x4_t v306 = vsubq_f32(v389, (float32x4_t)v387);
      float32x4_t v307 = vmulq_f32(v306, v306);
      double v308 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v307, 2), vaddq_f32(v307, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v307.f32, 1))).f32[0]);
      BOOL v309 = !_NF || v299 <= v308;
      if (!v309
        || ((float32x4_t v310 = vsubq_f32((float32x4_t)v388, v303),
             float32x4_t v311 = vmulq_f32(v310, v310),
             float32x4_t v312 = vsubq_f32(v389, v303),
             float32x4_t v303 = vmulq_f32(v312, v312),
             *(double *)v303.i64 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v303, 2), vaddq_f32(v303, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v303.f32, 1))).f32[0]), sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v311, 2), vaddq_f32(v311, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v311.f32, 1))).f32[0]) < 0.0196078431)? (BOOL v313 = v300 <= *(double *)v303.i64): (BOOL v313 = 1), !v313))
      {
        v314 = objc_msgSend(NSNumber, "numberWithInt:", v293, *(double *)v303.i64);
        [v291 addObject:v314];

        v315 = [NSNumber numberWithInt:v293];
        [v292 addObject:v315];
      }
      ++v293;
    }
    while (v272 != v293);
  }
  if ([v292 count])
  {
    v386.i64[0] = (uint64_t)v290;
    do
    {
      v316 = [v292 lastObject];
      uint64_t v317 = [v316 intValue];

      [v292 removeLastObject];
      v318 = [NSNumber numberWithInt:v317];
      [v290 addObject:v318];

      if ((int)v272 >= 1)
      {
        uint64_t v319 = 0;
        uint64_t v320 = v378.i64[0] + 4 * (int)v317 * (int)v272;
        do
        {
          v321 = [NSNumber numberWithInt:v319];
          char v322 = [v291 containsObject:v321];

          if ((v322 & 1) == 0 && *(float *)(v320 + 4 * v319) <= clusterGroupingDistanceThreshold)
          {
            v323 = [NSNumber numberWithInt:v319];
            [v291 addObject:v323];

            v324 = [NSNumber numberWithInt:v319];
            [v292 addObject:v324];
          }
          ++v319;
        }
        while (v272 != v319);
      }
      uint64_t v325 = [v292 count];
      v290 = (void *)v386.i64[0];
    }
    while (v325);
  }
  uint64_t v326 = [v290 count];
  v327 = v375;
  if (v326)
  {
    unint64_t v328 = 0;
    do
    {
      v329 = [v290 objectAtIndexedSubscript:v328];
      v327[v328] = [v329 intValue];

      ++v328;
    }
    while ([v290 count] > v328);
  }
  int v330 = [v290 count];

  uint64_t v332 = v377.i64[0];
  v333 = v374;
  if (v330 >= 1)
  {
    uint64_t v334 = v330;
    v335 = v379;
    v336 = v374;
    do
    {
      uint64_t v337 = *v327++;
      *v335++ = v257[v337];
      v338 = (float32x4_t *)(v332 + 48 * (int)v337);
      float32x4_t v331 = v338[1];
      float32x4_t *v336 = *v338;
      v336[1] = v331;
      v336[2] = v338[2];
      v336 += 3;
      --v334;
    }
    while (v334);
  }
  uint64_t v339 = v383;
  if ((int)v381 >= 1)
  {
    uint64_t v340 = 0;
    v341 = v333 + 2;
    float32x4_t v342 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    int32x4_t v388 = (int32x4_t)v342;
    do
    {
      if (v330 < 1)
      {
        float v344 = 1.0;
      }
      else
      {
        v343 = (unsigned __int8 *)(v339 + 4 * v340);
        v342.i32[0] = *v343;
        v342.i32[1] = v343[1];
        *(float32x2_t *)v342.f32 = vcvt_f32_u32(*(uint32x2_t *)v342.f32);
        v331.i8[0] = v343[2];
        v342.f32[2] = (float)v331.u32[0];
        float32x4_t v389 = vdivq_f32(v342, (float32x4_t)v388);
        float v344 = 1.0;
        v345 = v379;
        v346 = v341;
        uint64_t v347 = v330;
        do
        {
          float32x4_t v348 = *v345++;
          float v349 = ISSegmentationMathUtils_squaredMahalanobisDistance_inversedCovariance(v389, v348, v346[-2], v346[-1], *v346);
          *(double *)v342.i64 = ISSegmentationMathUtils_chi2cdf3(v349);
          float v344 = v344 * v342.f32[0];
          v346 += 3;
          --v347;
        }
        while (v347);
      }
      *(unsigned char *)(v339 + 4 * v340++ + 3) = (int)(float)(v344 * 255.0);
    }
    while (v340 != v381);
  }
  int v350 = v384->_borderSamplingWidth;
  if ((int)v385 < 1)
  {
    int v353 = 0;
    int v352 = 0;
    int v355 = v376;
  }
  else
  {
    uint64_t v351 = 0;
    int v352 = 0;
    int v353 = 0;
    unint64_t v354 = v339 + 4 * (int)v382 * (unint64_t)v385 + 3;
    int v355 = v376;
    do
    {
      if (v350 >= 1)
      {
        v356 = (unsigned __int8 *)v354;
        uint64_t v357 = (int)v382;
        do
        {
          if (v384->_BOOLeanThreshold >= *v356) {
            ++v352;
          }
          else {
            ++v353;
          }
          ++v357;
          v356 += 4 * v385;
        }
        while (v357 < v350 + (int)v382);
      }
      ++v351;
      v354 += 4;
    }
    while (v351 != v385);
  }
  if (v350 >= 1)
  {
    uint64_t v358 = (int)v385 - (int)v382 - v350;
    uint64_t v359 = v339 + 4 * v358 + 3;
    do
    {
      if (v355 >= 1)
      {
        uint64_t v360 = v355;
        v361 = (unsigned __int8 *)v359;
        do
        {
          if (v384->_BOOLeanThreshold >= *v361) {
            ++v352;
          }
          else {
            ++v353;
          }
          v361 += 4 * (int)v385;
          --v360;
        }
        while (v360);
      }
      ++v358;
      v359 += 4;
    }
    while (v358 < (int)v385 - (int)v382);
  }
  if ((int)v385 >= 1)
  {
    uint64_t v362 = 0;
    int v363 = v355 - v382;
    unint64_t v364 = v339 + 4 * (v355 - (int)v382 - v350) * (unint64_t)v385 + 3;
    do
    {
      if (v350 >= 1)
      {
        v365 = (unsigned __int8 *)v364;
        uint64_t v366 = v363 - v350;
        do
        {
          if (v384->_BOOLeanThreshold >= *v365) {
            ++v352;
          }
          else {
            ++v353;
          }
          ++v366;
          v365 += 4 * v385;
        }
        while (v366 < v363);
      }
      ++v362;
      v364 += 4;
    }
    while (v362 != v385);
  }
  if (v350 >= 1)
  {
    uint64_t v367 = (int)v382;
    uint64_t v368 = v350 + (int)v382;
    uint64_t v369 = v339 + 4 * (int)v382 + 3;
    do
    {
      if (v355 >= 1)
      {
        uint64_t v370 = v355;
        v371 = (unsigned __int8 *)v369;
        do
        {
          if (v384->_BOOLeanThreshold >= *v371) {
            ++v352;
          }
          else {
            ++v353;
          }
          v371 += 4 * (int)v385;
          --v370;
        }
        while (v370);
      }
      ++v367;
      v369 += 4;
    }
    while (v367 < v368);
  }
  return v353 <= v352;
}

@end