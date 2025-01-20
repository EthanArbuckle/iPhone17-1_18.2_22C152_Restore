@interface DBCursiveTextPath
- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5;
- (CGPath)pathForFraction:(double)a3 calculateLength:(BOOL)a4;
- (CGPath)pathForTime:(double)a3;
- (DBCursiveTextPath)initWithURL:(id)a3;
- (DBCursiveTextPath)initWithURL:(id)a3 resolution:(int64_t)a4;
- (double)duration;
@end

@implementation DBCursiveTextPath

- (DBCursiveTextPath)initWithURL:(id)a3
{
  return [(DBCursiveTextPath *)self initWithURL:a3 resolution:40];
}

- (DBCursiveTextPath)initWithURL:(id)a3 resolution:(int64_t)a4
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v141.receiver = self;
  v141.super_class = (Class)DBCursiveTextPath;
  v7 = [(DBCursiveTextPath *)&v141 init];
  v8 = (id *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 8) = xmmword_22D86EEA0;
    *((void *)v7 + 3) = 0x3FD0000000000000;
    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6];
    if (v9)
    {
      v10 = (void *)v9;
      id v140 = 0;
      v11 = [MEMORY[0x263F08AC0] propertyListWithData:v9 options:0 format:0 error:&v140];
      id v12 = v140;
      v13 = v12;
      if (v11)
      {
        int64_t v97 = a4;
        v99 = v12;
        v100 = v10;
        id v101 = v6;
        v14 = [v11 objectForKeyedSubscript:@"unitsPerEm"];
        [v14 floatValue];
        *((double *)v8 + 10) = v15;

        v16 = [v11 objectForKeyedSubscript:@"ascender"];
        [v16 floatValue];
        *((double *)v8 + 11) = v17;

        v18 = [v11 objectForKeyedSubscript:@"descender"];
        [v18 floatValue];
        *((double *)v8 + 12) = v19;

        id v20 = [v11 objectForKeyedSubscript:@"scale"];
        v21 = v20;
        float32x4_t v130 = 0u;
        if (v20)
        {
          float32x4_t v130 = 0u;
          if ([v20 count] == 4)
          {
            v22 = [v21 objectAtIndexedSubscript:0];
            [v22 floatValue];
            unsigned int v131 = v23;
            v24 = [v21 objectAtIndexedSubscript:1];
            [v24 floatValue];
            unsigned int v121 = v25;
            v26 = [v21 objectAtIndexedSubscript:2];
            [v26 floatValue];
            unsigned int v116 = v27;
            v28 = [v21 objectAtIndexedSubscript:3];
            [v28 floatValue];
            v29.i64[0] = __PAIR64__(v121, v131);
            v29.i64[1] = __PAIR64__(v30, v116);
            float32x4_t v130 = v29;
          }
        }

        v98 = v11;
        v31 = [v11 objectForKeyedSubscript:@"strokes"];
        v96 = (void *)[objc_alloc(MEMORY[0x263F08A90]) initWithOptions:0];
        uint64_t v32 = [objc_alloc(MEMORY[0x263F08A88]) initWithPointerFunctions:v96];
        id v33 = v8[13];
        v8[13] = (id)v32;

        v34 = (void *)[objc_alloc(MEMORY[0x263F08A90]) initWithOptions:1024];
        [v34 setSizeFunction:BezierCurveStructSize];
        v105 = v34;
        [v34 setRelinquishFunction:BezierCurveStructRelinquish];
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id obj = v31;
        uint64_t v106 = [obj countByEnumeratingWithState:&v136 objects:v143 count:16];
        if (v106)
        {
          uint64_t v103 = *(void *)v137;
          v104 = v8;
          do
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v137 != v103) {
                objc_enumerationMutation(obj);
              }
              uint64_t v107 = v35;
              v36 = *(void **)(*((void *)&v136 + 1) + 8 * v35);
              v115 = (void *)[objc_alloc(MEMORY[0x263F08A88]) initWithPointerFunctions:v105];
              long long v132 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              id v108 = v36;
              uint64_t v37 = [v108 countByEnumeratingWithState:&v132 objects:v142 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v133;
                do
                {
                  for (uint64_t i = 0; i != v38; ++i)
                  {
                    if (*(void *)v133 != v39) {
                      objc_enumerationMutation(v108);
                    }
                    id v41 = *(id *)(*((void *)&v132 + 1) + 8 * i);
                    v42 = (float32x4_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1000040FA0F61DDuLL);
                    id v43 = [v41 objectForKeyedSubscript:@"p0"];
                    v44 = v43;
                    float32x4_t v45 = 0uLL;
                    float32x4_t v117 = 0u;
                    if (v43)
                    {
                      uint64_t v46 = [v43 count];
                      float32x4_t v45 = 0uLL;
                      if (v46 == 4)
                      {
                        v47 = objc_msgSend(v44, "objectAtIndexedSubscript:", 0, 0.0);
                        [v47 floatValue];
                        unsigned int v122 = v48;
                        v49 = [v44 objectAtIndexedSubscript:1];
                        [v49 floatValue];
                        unsigned int v111 = v50;
                        v51 = [v44 objectAtIndexedSubscript:2];
                        [v51 floatValue];
                        unsigned int v109 = v52;
                        v53 = [v44 objectAtIndexedSubscript:3];
                        [v53 floatValue];
                        v54.i64[0] = __PAIR64__(v111, v122);
                        v54.i64[1] = __PAIR64__(v55, v109);
                        float32x4_t v123 = v54;

                        float32x4_t v45 = v123;
                      }
                    }
                    float32x4_t v124 = v45;

                    float32x4_t *v42 = vmulq_f32(v130, v124);
                    id v56 = [v41 objectForKeyedSubscript:@"p1"];
                    v57 = v56;
                    if (v56 && [v56 count] == 4)
                    {
                      v58 = [v57 objectAtIndexedSubscript:0];
                      [v58 floatValue];
                      unsigned int v118 = v59;
                      v60 = [v57 objectAtIndexedSubscript:1];
                      [v60 floatValue];
                      unsigned int v125 = v61;
                      v62 = [v57 objectAtIndexedSubscript:2];
                      [v62 floatValue];
                      unsigned int v112 = v63;
                      v64 = [v57 objectAtIndexedSubscript:3];
                      [v64 floatValue];
                      v65.i64[0] = __PAIR64__(v125, v118);
                      v65.i64[1] = __PAIR64__(v66, v112);
                      float32x4_t v117 = v65;
                    }
                    v42[1] = vmulq_f32(v130, v117);

                    id v67 = [v41 objectForKeyedSubscript:@"p2"];
                    v68 = v67;
                    float32x4_t v69 = 0uLL;
                    float32x4_t v119 = 0u;
                    if (v67)
                    {
                      uint64_t v70 = [v67 count];
                      float32x4_t v69 = 0uLL;
                      if (v70 == 4)
                      {
                        v71 = objc_msgSend(v68, "objectAtIndexedSubscript:", 0, 0.0);
                        [v71 floatValue];
                        unsigned int v126 = v72;
                        v73 = [v68 objectAtIndexedSubscript:1];
                        [v73 floatValue];
                        unsigned int v113 = v74;
                        v75 = [v68 objectAtIndexedSubscript:2];
                        [v75 floatValue];
                        unsigned int v110 = v76;
                        v77 = [v68 objectAtIndexedSubscript:3];
                        [v77 floatValue];
                        v78.i64[0] = __PAIR64__(v113, v126);
                        v78.i64[1] = __PAIR64__(v79, v110);
                        float32x4_t v127 = v78;

                        float32x4_t v69 = v127;
                      }
                    }
                    float32x4_t v128 = v69;

                    v42[2] = vmulq_f32(v130, v128);
                    id v80 = [v41 objectForKeyedSubscript:@"p3"];
                    v81 = v80;
                    if (v80 && [v80 count] == 4)
                    {
                      v82 = [v81 objectAtIndexedSubscript:0];
                      [v82 floatValue];
                      unsigned int v120 = v83;
                      v84 = [v81 objectAtIndexedSubscript:1];
                      [v84 floatValue];
                      unsigned int v129 = v85;
                      v86 = [v81 objectAtIndexedSubscript:2];
                      [v86 floatValue];
                      unsigned int v114 = v87;
                      v88 = [v81 objectAtIndexedSubscript:3];
                      [v88 floatValue];
                      v89.i64[0] = __PAIR64__(v129, v120);
                      v89.i64[1] = __PAIR64__(v90, v114);
                      float32x4_t v119 = v89;
                    }
                    v42[3] = vmulq_f32(v130, v119);

                    [v115 addPointer:v42];
                  }
                  uint64_t v38 = [v108 countByEnumeratingWithState:&v132 objects:v142 count:16];
                }
                while (v38);
              }

              v8 = v104;
              [v104[13] addPointer:v115];

              uint64_t v35 = v107 + 1;
            }
            while (v107 + 1 != v106);
            uint64_t v106 = [obj countByEnumeratingWithState:&v136 objects:v143 count:16];
          }
          while (v106);
        }

        v8[14] = (id)v97;
        *(CGRect *)(v8 + 6) = CGPathGetPathBoundingBox((CGPathRef)[v8 pathForFraction:1 calculateLength:0.0]);
        float v91 = *((double *)v8 + 4) / 3000.0;
        *((double *)v8 + 5) = (float)((float)(powf((float)(fminf(fmaxf(v91, 0.0), 10.0) / 10.0) + -1.0, 3.0) + 1.0) * 4.0);

        id v6 = v101;
        goto LABEL_34;
      }
      v94 = DBLogForCategory(0);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
        -[DBCursiveTextPath initWithURL:resolution:](v6, v13, v94);
      }
    }
    else
    {
      v93 = DBLogForCategory(0);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
        -[DBCursiveTextPath initWithURL:resolution:](v6, v93);
      }
    }
    v92 = 0;
    goto LABEL_42;
  }
LABEL_34:
  v92 = v8;
LABEL_42:

  return v92;
}

- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5
{
  BOOL v6 = a6;
  double descender = self->_descender;
  double v11 = self->_ascender - descender;
  double v12 = -descender / v11;
  double v13 = v11 / self->_unitsPerM * a5;
  double v33 = (CGRectGetHeight(a4) - v13) * 0.5;
  CGFloat x = self->_boundingBoxOfPath.origin.x;
  CGFloat y = self->_boundingBoxOfPath.origin.y;
  CGFloat width = self->_boundingBoxOfPath.size.width;
  CGFloat height = self->_boundingBoxOfPath.size.height;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat v19 = CGRectGetWidth(v40);
  CGAffineTransformMakeTranslation(retstr, -(MinX + v19 * 0.5), 0.0);
  double v20 = 1.0 - v12;
  if (!v6) {
    double v20 = v12;
  }
  double v21 = v33 + v20 * v13;
  double v22 = a5 / self->_unitsPerM;
  double v23 = -v22;
  if (!v6) {
    double v23 = a5 / self->_unitsPerM;
  }
  CGAffineTransformMakeScale(&t2, v22, v23);
  long long v24 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v24;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v38, &t1, &t2);
  long long v25 = *(_OWORD *)&v38.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v38.a;
  *(_OWORD *)&retstr->c = v25;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v38.tx;
  CGFloat v26 = a4.origin.x;
  *(CGFloat *)&long long v25 = a4.origin.y;
  CGFloat v27 = a4.size.width;
  CGFloat v28 = a4.size.height;
  CGFloat v29 = CGRectGetWidth(*(CGRect *)((char *)&v25 - 8));
  CGAffineTransformMakeTranslation(&v35, v29 * 0.5, v21);
  long long v30 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v30;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v38, &t1, &v35);
  long long v32 = *(_OWORD *)&v38.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v38.a;
  *(_OWORD *)&retstr->c = v32;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v38.tx;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (CGPath)pathForTime:(double)a3
{
  return [(DBCursiveTextPath *)self pathForFraction:0 calculateLength:a3 / self->_duration];
}

- (CGPath)pathForFraction:(double)a3 calculateLength:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v116 = *MEMORY[0x263EF8340];
  double rampTime = self->_rampTime;
  double duration = self->_duration;
  unint64_t v9 = 0x263F08000uLL;
  v94 = (void *)[objc_alloc(MEMORY[0x263F08A90]) initWithOptions:0];
  v10 = (void *)[objc_alloc(MEMORY[0x263F08A88]) initWithPointerFunctions:v94];
  double v11 = (void *)[objc_alloc(MEMORY[0x263F08A90]) initWithOptions:1024];
  [v11 setSizeFunction:PathPointStructSize];
  v95 = v11;
  [v11 setRelinquishFunction:PathPointStructRelinquish];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  *(_OWORD *)id obj = 0u;
  double v12 = self->_bezierArrays;
  uint64_t v90 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v110 objects:v115 count:16];
  if (v90)
  {
    char v13 = 0;
    char v14 = 0;
    double v15 = rampTime / duration;
    double v16 = 1.0;
    double v96 = v15 - (v15 - (v15 + 1.0) * a3);
    float v17 = -(v15 - (v15 + 1.0) * a3);
    float v18 = v15;
    double v19 = 0.0;
    __asm { FMOV            V1.4S, #3.0 }
    uint64_t v25 = *(void *)v111;
    __asm { FMOV            V0.4S, #-3.0 }
    float32x4_t v99 = _Q0;
    float32x4_t v100 = _Q1;
    __asm
    {
      FMOV            V1.4S, #-6.0
      FMOV            V0.4S, #6.0
    }
    float32x4_t v97 = _Q0;
    float32x4_t v98 = _Q1;
    v92 = v12;
    v93 = v10;
    uint64_t v89 = *(void *)v111;
    while (2)
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v111 != v25) {
          objc_enumerationMutation(v12);
        }
        uint64_t v91 = v29;
        long long v30 = *(void **)(*((void *)&v110 + 1) + 8 * v29);
        v31 = (void *)[objc_alloc(*(Class *)(v9 + 2696)) initWithPointerFunctions:v95];
        if ([v30 count])
        {
          unint64_t v32 = 0;
          long long v33 = *(_OWORD *)obj;
          while (1)
          {
            *(_OWORD *)obja = v33;
            uint64_t v34 = objc_msgSend(v30, "pointerAtIndex:", v32, v89);
            if ((vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)v34, *(float32x4_t *)(v34 + 48))) & 0x80000000) != 0) {
              break;
            }
            int64_t resolution = self->_resolution;
            float32x4_t v36 = *(float32x4_t *)obja;
            if ((resolution & 0x8000000000000000) == 0) {
              goto LABEL_12;
            }
            long long v37 = *(_OWORD *)obja;
LABEL_20:
            *(_OWORD *)objd = v37;
            ++v32;
            unint64_t v65 = [v30 count];
            long long v66 = *(_OWORD *)objd;
            char v13 = 1;
            long long v33 = *(_OWORD *)objd;
            if (v32 >= v65) {
              goto LABEL_23;
            }
          }
          int64_t resolution = 0;
          float32x4_t v36 = *(float32x4_t *)obja;
LABEL_12:
          uint64_t v38 = 0;
          int64_t v39 = resolution + 1;
          while (1)
          {
            float v40 = v16 / (double)self->_resolution * (double)v38;
            float32x4_t v41 = *(float32x4_t *)(v34 + 16);
            float32x4_t v42 = vmulq_f32(v41, v100);
            float32x4_t v43 = *(float32x4_t *)(v34 + 32);
            float32x4_t v44 = *(float32x4_t *)(v34 + 48);
            float32x4_t v45 = vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(v44, v40), v40), v40), vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v43, v100), v40), v40), 1.0 - v40), vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(v42, v40), 1.0 - v40), 1.0 - v40), vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(*(float32x4_t *)v34, 1.0 - v40), 1.0 - v40), 1.0 - v40))));
            float32x2_t v46 = (float32x2_t)vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v44, v100), v40), v40), vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v43, v99), v40), v40), vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v43, v97), 1.0 - v40), v40), vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v41, v98), 1.0 - v40), v40), vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(*(float32x4_t *)v34, v99), 1.0 - v40), 1.0 - v40), vmulq_n_f32(vmulq_n_f32(v42, 1.0 - v40), 1.0 - v40)))))).u64[0];
            float32_t v47 = -v46.f32[0];
            v46.i32[0] = vdup_lane_s32((int32x2_t)v46, 1).u32[0];
            v46.f32[1] = v47;
            float32x2_t v48 = vmul_f32(v46, v46);
            v48.i32[0] = vadd_f32(v48, (float32x2_t)vdup_lane_s32((int32x2_t)v48, 1)).u32[0];
            float32x2_t v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
            float32x2_t v50 = vmul_f32(v49, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)));
            int8x8_t v51 = (int8x8_t)vmul_n_f32(v46, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
            if (v14)
            {
              float32x4_t v52 = vsubq_f32(v45, v36);
              float32x4_t v53 = vmulq_f32(v52, v52);
              double v54 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1))).f32[0]);
              double v55 = 0.5;
              if ((v13 & 1) == 0) {
                double v55 = v16;
              }
              double v19 = v19 + v54 * v55;
              char v13 = 0;
            }
            double v56 = v19 / self->_length;
            if (!v4 && v56 > v96) {
              break;
            }
            int8x8_t v57 = vbsl_s8((int8x8_t)vdup_n_s32(0xFFFFFFFF), v51, (int8x8_t)0x3F80000000000000);
            float v58 = v56;
            *(float32x4_t *)objc = v45;
            float v59 = powf((float)(1.0 - fminf(fmaxf((float)(v58 - v17) / v18, 0.0), 1.0)) + -1.0, 3.0);
            float finalWeight = self->_finalWeight;
            float initialWeight = self->_initialWeight;
            float v62 = vmuls_lane_f32(initialWeight + (float)((float)(v59 + 1.0) * (float)(finalWeight - initialWeight)), *(float32x4_t *)objc, 3);
            char v14 = 1;
            v64 = (int8x8_t *)malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL);
            int8x8_t *v64 = (int8x8_t)objc[0];
            v64[1] = v57;
            *(float *)v64[2].i32 = v62;
            *(float *)&__int32 v63 = v19;
            v64[2].i32[1] = v63;
            double v16 = 1.0;
            [v31 addPointer:v64];
            long long v37 = *(_OWORD *)objc;
            ++v38;
            float32x4_t v36 = *(float32x4_t *)objc;
            if (v39 == v38) {
              goto LABEL_20;
            }
          }
          v10 = v93;
          objc_msgSend(v93, "addPointer:", v31, *(double *)&v51);

          double v12 = v92;
          goto LABEL_28;
        }
        long long v66 = *(_OWORD *)obj;
LABEL_23:
        *(_OWORD *)id obj = v66;
        v10 = v93;
        objc_msgSend(v93, "addPointer:", v31, v89);

        uint64_t v29 = v91 + 1;
        unint64_t v9 = 0x263F08000;
        double v12 = v92;
        uint64_t v25 = v89;
      }
      while (v91 + 1 != v90);
      uint64_t v90 = [(NSPointerArray *)v92 countByEnumeratingWithState:&v110 objects:v115 count:16];
      if (v90) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v19 = 0.0;
  }
LABEL_28:

  if (v4) {
    self->_length = v19;
  }
  Mutable = CGPathCreateMutable();
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id objb = v10;
  uint64_t v68 = [objb countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v107 != v70) {
          objc_enumerationMutation(objb);
        }
        unsigned int v72 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        uint64_t v73 = [v72 count];
        if (v73)
        {
          uint64_t v74 = v73;
          v75 = (float32x2_t *)[v72 pointerAtIndex:0];
          unint64_t v76 = v74 - 1;
          uint64_t v77 = [v72 pointerAtIndex:v74 - 1];
          float32x2_t v78 = vmla_n_f32(*v75, v75[1], v75[2].f32[0]);
          CGPathMoveToPoint(Mutable, 0, v78.f32[0], v78.f32[1]);
          if ((unint64_t)(v74 - 1) >= 2)
          {
            uint64_t v79 = 2;
            do
            {
              id v80 = (float32x2_t *)[v72 pointerAtIndex:v79 - 1];
              float32x2_t v81 = vmla_n_f32(*v80, v80[1], v80[2].f32[0]);
              CGPathAddLineToPoint(Mutable, 0, v81.f32[0], v81.f32[1]);
              ++v79;
            }
            while (v74 != v79);
          }
          float v82 = atan2f(COERCE_FLOAT(HIDWORD(*(void *)(v77 + 8))), COERCE_FLOAT(*(void *)(v77 + 8)));
          CGPathAddArc(Mutable, 0, COERCE_FLOAT(*(void *)v77), COERCE_FLOAT(HIDWORD(*(void *)v77)), *(float *)(v77 + 16), v82, v82 + 3.14159265, 0);
          if (v74 - 2 >= 1)
          {
            do
            {
              unsigned int v83 = (float32x2_t *)[v72 pointerAtIndex:--v76];
              v84.i32[0] = v83[2].i32[0];
              float32x2_t v85 = vmls_lane_f32(*v83, v83[1], v84, 0);
              CGPathAddLineToPoint(Mutable, 0, v85.f32[0], v85.f32[1]);
            }
            while (v76 > 1);
          }
          float v86 = atan2f(-COERCE_FLOAT(HIDWORD(*(void *)&v75[1])), -COERCE_FLOAT(*(void *)&v75[1]));
          CGPathAddArc(Mutable, 0, COERCE_FLOAT(*v75), COERCE_FLOAT(HIDWORD(*(unint64_t *)v75)), v75[2].f32[0], v86, v86 + 3.14159265, 0);
        }
      }
      uint64_t v69 = [objb countByEnumeratingWithState:&v106 objects:v114 count:16];
    }
    while (v69);
  }

  unsigned int v87 = (CGPath *)CFAutorelease(Mutable);
  return v87;
}

- (void).cxx_destruct
{
}

- (void)initWithURL:(void *)a1 resolution:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 absoluteString];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "CursiveTextPath: No data for url %@", (uint8_t *)&v4, 0xCu);
}

- (void)initWithURL:(NSObject *)a3 resolution:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = [a1 absoluteString];
  uint64_t v6 = [a2 description];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_22D6F0000, a3, OS_LOG_TYPE_ERROR, "CursiveTextPath: Indecipherable plist for url: %@, error: %@", (uint8_t *)&v7, 0x16u);
}

@end