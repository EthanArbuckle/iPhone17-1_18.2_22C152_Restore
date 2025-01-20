@interface CHQuadCurvePointFIFO
+ (double)interpolateFromPoint:(float32x4_t)a1 toPoint:(float32x4_t)a2 controlPoint:(float32x4_t)a3 time:(float)a4;
- (BOOL)emitInterpolatedPoints;
- (CGPath)path;
- (CHQuadCurvePointFIFO)initWithFIFO:(id)a3;
- (CHQuadCurvePointFIFO)initWithFIFO:(id)a3 drawingTarget:(id)a4;
- (double)lineWidth;
- (float)unitScale;
- (id).cxx_construct;
- (id)emissionHandler;
- (void)addPoint:(CHQuadCurvePointFIFO *)self;
- (void)clear;
- (void)dealloc;
- (void)flush;
- (void)setEmissionHandler:(id)a3;
- (void)setEmitInterpolatedPoints:(BOOL)a3;
- (void)setLineWidth:(double)a3;
- (void)setPath:(CGPath *)a3;
- (void)setUnitScale:(float)a3;
- (void)setUnitScaleForViewSize:(CGSize)a3 normalizedSize:(CGSize)a4 contentScaleFactor:(double)a5;
@end

@implementation CHQuadCurvePointFIFO

- (CHQuadCurvePointFIFO)initWithFIFO:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CHQuadCurvePointFIFO;
  v3 = [(CHPointFIFO *)&v7 initWithFIFO:a3];
  v4 = v3;
  if (v3)
  {
    v3->_unitScale = 1.0;
    v3->_emitInterpolatedPoints = 1;
    drawingTarget = v3->_drawingTarget;
    v3->_drawingTarget = 0;
  }
  return v4;
}

- (CHQuadCurvePointFIFO)initWithFIFO:(id)a3 drawingTarget:(id)a4
{
  id v7 = a4;
  uint64_t v12 = objc_msgSend_initWithFIFO_(self, v8, (uint64_t)a3, v9, v10, v11);
  v13 = (CHQuadCurvePointFIFO *)v12;
  if (v12) {
    objc_storeStrong((id *)(v12 + 48), a4);
  }

  return v13;
}

- (void)dealloc
{
  path = self->_path;
  if (path) {
    CGPathRelease(path);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHQuadCurvePointFIFO;
  [(CHQuadCurvePointFIFO *)&v4 dealloc];
}

+ (double)interpolateFromPoint:(float32x4_t)a1 toPoint:(float32x4_t)a2 controlPoint:(float32x4_t)a3 time:(float)a4
{
  *(void *)&double result = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a3, (float)((float)(1.0 - a4) + (float)(1.0 - a4)) * a4), a1, (float)(1.0 - a4) * (float)(1.0 - a4)), a2, a4 * a4).u64[0];
  return result;
}

- (void)setUnitScaleForViewSize:(CGSize)a3 normalizedSize:(CGSize)a4 contentScaleFactor:(double)a5
{
}

- (void)addPoint:(CHQuadCurvePointFIFO *)self
{
  float32x4_t v3 = v2;
  anon_50 = self->_anon_50;
  v6 = *(float32x4_t **)&self->_anon_50[8];
  float32x4_t v217 = v2;
  if (v6 == *(float32x4_t **)self->_anon_50)
  {
    path = self->_path;
    if (path) {
      CGPathRelease(path);
    }
    self->_path = CGPathCreateMutable();
    v6 = (float32x4_t *)*((void *)anon_50 + 1);
    unint64_t v7 = *((void *)anon_50 + 2);
    float32x4_t v3 = v217;
    if ((unint64_t)v6 < v7) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v7 = *(void *)&self->_anon_50[16];
    if ((unint64_t)v6 < v7)
    {
LABEL_3:
      float32x4_t *v6 = v3;
      v8 = (char *)&v6[1];
      goto LABEL_22;
    }
  }
  uint64_t v10 = *(float32x4_t **)anon_50;
  uint64_t v11 = ((uint64_t)v6 - *(void *)anon_50) >> 4;
  unint64_t v12 = v11 + 1;
  if ((unint64_t)(v11 + 1) >> 60) {
    goto LABEL_132;
  }
  uint64_t v13 = v7 - (void)v10;
  if (v13 >> 3 > v12) {
    unint64_t v12 = v13 >> 3;
  }
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v14 = v12;
  }
  if (v14)
  {
    if (v14 >> 60) {
      goto LABEL_133;
    }
    v15 = (char *)operator new(16 * v14);
    v3.i64[0] = v217.i64[0];
    v16 = &v15[16 * v11];
    v17 = &v15[16 * v14];
    *(float32x4_t *)v16 = v217;
    v8 = v16 + 16;
    if (v6 == v10) {
      goto LABEL_20;
    }
  }
  else
  {
    v16 = (char *)(16 * v11);
    v17 = 0;
    v18 = (float32x4_t *)(16 * v11);
    float32x4_t *v18 = v3;
    v8 = (char *)&v18[1];
    if (v6 == v10) {
      goto LABEL_20;
    }
  }
  do
  {
    float32x4_t v19 = v6[-1];
    --v6;
    *((float32x4_t *)v16 - 1) = v19;
    v16 -= 16;
  }
  while (v6 != v10);
  v6 = *(float32x4_t **)anon_50;
LABEL_20:
  *(void *)anon_50 = v16;
  *((void *)anon_50 + 1) = v8;
  *((void *)anon_50 + 2) = v17;
  if (v6)
  {
    operator delete(v6);
    v3.i64[0] = v217.i64[0];
  }
LABEL_22:
  *((void *)anon_50 + 1) = v8;
  v20 = *(float32x4_t **)anon_50;
  uint64_t v21 = (uint64_t)&v8[-*(void *)anon_50] >> 4;
  if (v21 != 3)
  {
    if (v21 != 1) {
      return;
    }
    double v22 = v3.f32[0];
    double v23 = v3.f32[1];
    CGPathMoveToPoint(self->_path, 0, v3.f32[0], v3.f32[1]);
    v29 = *(float32x4_t **)self->_anon_68;
    *(void *)&self->_anon_68[8] = v29;
    unint64_t v30 = *(void *)&self->_anon_68[16];
    if ((unint64_t)v29 < v30)
    {
      float32x4_t v31 = v217;
      float32x4_t *v29 = v217;
      f32 = (_OWORD *)v29[1].f32;
LABEL_56:
      *(void *)&self->_anon_68[8] = f32;
      *(float32x4_t *)self->_lastPoint = v31;
      if (self->_drawingTarget)
      {
        objc_msgSend_lineWidth(self, v24, v25, v26, v27, v28);
        double v69 = v22 - v68 * 0.5;
        objc_msgSend_lineWidth(self, v70, v71, v72, v73, v74);
        double v76 = v23 - v75 * 0.5;
        objc_msgSend_lineWidth(self, v77, v78, v79, v80, v81);
        double v83 = v82;
        objc_msgSend_lineWidth(self, v84, v85, v86, v87, v88);
        objc_msgSend_setNeedsDisplayInRect_(self->_drawingTarget, v89, v90, v91, v92, v93, v69, v76, v83, v94);
      }
      goto LABEL_122;
    }
    uint64_t v61 = v30 - (void)v29;
    uint64_t v62 = v61 >> 3;
    if ((unint64_t)(v61 >> 3) <= 1) {
      uint64_t v62 = 1;
    }
    BOOL v63 = (unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v64 = 0xFFFFFFFFFFFFFFFLL;
    if (!v63) {
      unint64_t v64 = v62;
    }
    if (!(v64 >> 60))
    {
      uint64_t v65 = v64;
      v66 = operator new(16 * v64);
      v67 = &v66[v65];
      float32x4_t v31 = v217;
      _OWORD *v66 = v217;
      f32 = v66 + 1;
      *(void *)self->_anon_68 = v66;
      *(void *)&self->_anon_68[8] = v66 + 1;
      *(void *)&self->_anon_68[16] = v67;
      if (v29)
      {
        operator delete(v29);
        float32x4_t v31 = v217;
      }
      goto LABEL_56;
    }
LABEL_133:
    sub_1C4949AA8();
  }
  uint64_t v210 = 64;
  float32x4_t v33 = v20[1];
  v34.i64[0] = 0x3F0000003F000000;
  v34.i64[1] = 0x3F0000003F000000;
  float32x4_t v35 = vmlaq_f32(v33, v34, vsubq_f32(v20[2], v33));
  size_t v36 = v8 - (char *)&v20[1];
  float32x4_t v218 = v33;
  float32x4_t r1_16 = *(float32x4_t *)self->_lastPoint;
  float32x4_t v216 = v35;
  if (v36)
  {
    memmove(v20, &v20[1], v36);
    v35.i64[0] = v216.i64[0];
    v33.i64[0] = v218.i64[0];
  }
  *((void *)anon_50 + 1) = (char *)v20 + v36;
  float v37 = v33.f32[1];
  float v38 = v35.f32[1];
  CGPathAddQuadCurveToPoint(self->_path, 0, v33.f32[0], v33.f32[1], v35.f32[0], v35.f32[1]);
  anon_68 = self->_anon_68;
  *(void *)&self->_anon_68[8] = *(void *)self->_anon_68;
  if (!self->_emitInterpolatedPoints)
  {
    objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v24, v25, v26, v27, v28, *(double *)r1_16.i64, *(double *)v216.i64, *(double *)v218.i64, 0.0);
    v103 = *(_OWORD **)&self->_anon_68[8];
    unint64_t v102 = *(void *)&self->_anon_68[16];
    if ((unint64_t)v103 < v102)
    {
      _OWORD *v103 = v100;
      v104 = v103 + 1;
      goto LABEL_75;
    }
    v105 = *(_OWORD **)anon_68;
    uint64_t v106 = ((uint64_t)v103 - *(void *)anon_68) >> 4;
    unint64_t v107 = v106 + 1;
    if ((unint64_t)(v106 + 1) >> 60) {
      goto LABEL_132;
    }
    uint64_t v108 = v102 - (void)v105;
    if (v108 >> 3 > v107) {
      unint64_t v107 = v108 >> 3;
    }
    if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v109 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v109 = v107;
    }
    if (v109)
    {
      long long r1a = v100;
      if (v109 >> 60) {
        goto LABEL_133;
      }
      v110 = (char *)operator new(16 * v109);
      v111 = &v110[16 * v106];
      v112 = &v110[16 * v109];
      *(_OWORD *)v111 = r1a;
      v104 = v111 + 16;
      if (v103 == v105) {
        goto LABEL_73;
      }
    }
    else
    {
      v111 = (char *)(16 * v106);
      v112 = 0;
      v113 = (_OWORD *)(16 * v106);
      _OWORD *v113 = v100;
      v104 = v113 + 1;
      if (v103 == v105) {
        goto LABEL_73;
      }
    }
    do
    {
      long long v114 = *--v103;
      *((_OWORD *)v111 - 1) = v114;
      v111 -= 16;
    }
    while (v103 != v105);
    v103 = *(_OWORD **)anon_68;
LABEL_73:
    *(void *)anon_68 = v111;
    *(void *)&self->_anon_68[8] = v104;
    *(void *)&self->_anon_68[16] = v112;
    if (v103) {
      operator delete(v103);
    }
LABEL_75:
    *(void *)&self->_anon_68[8] = v104;
    LODWORD(v101) = 1.0;
    objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v95, v96, v97, v98, v99, *(double *)r1_16.i64, *(double *)v216.i64, *(double *)v218.i64, v101, 64);
    v117 = *(_OWORD **)&self->_anon_68[8];
    unint64_t v116 = *(void *)&self->_anon_68[16];
    if ((unint64_t)v117 < v116)
    {
      _OWORD *v117 = v115;
      v118 = v117 + 1;
LABEL_92:
      CHPointFIFO v45 = (CHPointFIFO)v216;
      float32x4_t v41 = v218;
      *(void *)&self->_anon_68[8] = v118;
      goto LABEL_93;
    }
    v119 = *(_OWORD **)anon_68;
    uint64_t v120 = ((uint64_t)v117 - *(void *)anon_68) >> 4;
    unint64_t v121 = v120 + 1;
    if ((unint64_t)(v120 + 1) >> 60) {
      goto LABEL_132;
    }
    uint64_t v122 = v116 - (void)v119;
    if (v122 >> 3 > v121) {
      unint64_t v121 = v122 >> 3;
    }
    if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v123 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v123 = v121;
    }
    if (v123)
    {
      long long r1b = v115;
      if (v123 >> 60) {
        goto LABEL_133;
      }
      v124 = (char *)operator new(16 * v123);
      v125 = &v124[16 * v120];
      v126 = &v124[16 * v123];
      *(_OWORD *)v125 = r1b;
      v118 = v125 + 16;
      if (v117 == v119) {
        goto LABEL_90;
      }
    }
    else
    {
      v125 = (char *)(16 * v120);
      v126 = 0;
      v127 = (_OWORD *)(16 * v120);
      _OWORD *v127 = v115;
      v118 = v127 + 1;
      if (v117 == v119) {
        goto LABEL_90;
      }
    }
    do
    {
      long long v128 = *--v117;
      *((_OWORD *)v125 - 1) = v128;
      v125 -= 16;
    }
    while (v117 != v119);
    v117 = *(_OWORD **)anon_68;
LABEL_90:
    *(void *)anon_68 = v125;
    *(void *)&self->_anon_68[8] = v118;
    *(void *)&self->_anon_68[16] = v126;
    if (v117) {
      operator delete(v117);
    }
    goto LABEL_92;
  }
  HIDWORD(v40) = v216.i32[1];
  float32x4_t v41 = v218;
  float32x4_t v42 = vsubq_f32(r1_16, v218);
  float32x4_t v43 = vsubq_f32(v218, v216);
  float v44 = (float)(sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v42, v42)))
              + sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v43, v43))))
      / self->_unitScale;
  CHPointFIFO v45 = (CHPointFIFO)v216;
  if (v44 > 0.0)
  {
    int v46 = 0;
    float v47 = 0.0;
    while (1)
    {
      *(float *)&double v40 = v47 / v44;
      objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v24, v25, v26, v27, v28, *(double *)r1_16.i64, *(double *)&v45.super.isa, *(double *)v41.i64, v40, v210);
      v51 = *(_OWORD **)&self->_anon_68[8];
      unint64_t v50 = *(void *)&self->_anon_68[16];
      if ((unint64_t)v51 >= v50) {
        break;
      }
      _OWORD *v51 = v49;
      v48 = v51 + 1;
LABEL_32:
      CHPointFIFO v45 = (CHPointFIFO)v216;
      float32x4_t v41 = v218;
      *(void *)&self->_anon_68[8] = v48;
      float v47 = (float)++v46;
      if (v44 <= (float)v46) {
        goto LABEL_93;
      }
    }
    v52 = *(_OWORD **)anon_68;
    uint64_t v53 = ((uint64_t)v51 - *(void *)anon_68) >> 4;
    unint64_t v54 = v53 + 1;
    if ((unint64_t)(v53 + 1) >> 60) {
      goto LABEL_132;
    }
    uint64_t v55 = v50 - (void)v52;
    if (v55 >> 3 > v54) {
      unint64_t v54 = v55 >> 3;
    }
    if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v56 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v56 = v54;
    }
    if (v56)
    {
      long long r1 = v49;
      if (v56 >> 60) {
        goto LABEL_133;
      }
      v57 = (char *)operator new(16 * v56);
      v58 = &v57[16 * v53];
      *(_OWORD *)v58 = r1;
      v48 = v58 + 16;
      if (v51 == v52) {
        goto LABEL_47;
      }
    }
    else
    {
      v57 = 0;
      v58 = (char *)(16 * v53);
      v59 = (_OWORD *)(16 * v53);
      _OWORD *v59 = v49;
      v48 = v59 + 1;
      if (v51 == v52) {
        goto LABEL_47;
      }
    }
    do
    {
      long long v60 = *--v51;
      *((_OWORD *)v58 - 1) = v60;
      v58 -= 16;
    }
    while (v51 != v52);
    v51 = *(_OWORD **)anon_68;
LABEL_47:
    *(void *)anon_68 = v58;
    *(void *)&self->_anon_68[8] = v48;
    *(void *)&self->_anon_68[16] = &v57[16 * v56];
    if (v51) {
      operator delete(v51);
    }
    goto LABEL_32;
  }
LABEL_93:
  v129 = self + 1;
  nextFIFO = self[1].super._nextFIFO;
  unint64_t v130 = *(void *)&self[1]._emitInterpolatedPoints;
  if ((unint64_t)nextFIFO < v130)
  {
    CHPointFIFO *nextFIFO = (CHPointFIFO)v41;
    v132 = nextFIFO + 1;
    uint64_t v133 = v210;
    goto LABEL_108;
  }
  isa = (CHPointFIFO *)v129->super.super.isa;
  uint64_t v135 = ((char *)nextFIFO - (char *)v129->super.super.isa) >> 4;
  unint64_t v136 = v135 + 1;
  if ((unint64_t)(v135 + 1) >> 60) {
LABEL_132:
  }
    sub_1C494A220();
  uint64_t v137 = v130 - (void)isa;
  if (v137 >> 3 > v136) {
    unint64_t v136 = v137 >> 3;
  }
  if ((unint64_t)v137 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v138 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v138 = v136;
  }
  if (v138)
  {
    if (v138 >> 60) {
      goto LABEL_133;
    }
    v139 = (char *)operator new(16 * v138);
    CHPointFIFO v45 = (CHPointFIFO)v216;
    float32x4_t v41 = v218;
    v140 = (CHPointFIFO *)&v139[16 * v135];
    v141 = &v139[16 * v138];
    CHPointFIFO *v140 = (CHPointFIFO)v218;
    v132 = v140 + 1;
    if (nextFIFO != isa)
    {
LABEL_104:
      uint64_t v133 = v210;
      do
      {
        CHPointFIFO v142 = nextFIFO[-1];
        --nextFIFO;
        v140[-1] = v142;
        --v140;
      }
      while (nextFIFO != isa);
      nextFIFO = (CHPointFIFO *)v129->super.super.isa;
      v129->super.super.isa = (Class)v140;
      self[1].super._nextFIFO = v132;
      *(void *)&self[1]._emitInterpolatedPoints = v141;
      if (nextFIFO) {
        goto LABEL_107;
      }
      goto LABEL_108;
    }
  }
  else
  {
    v140 = (CHPointFIFO *)(16 * v135);
    v141 = 0;
    *(float32x4_t *)(16 * v135) = v41;
    v132 = (CHPointFIFO *)(16 * v135 + 16);
    if (nextFIFO != isa) {
      goto LABEL_104;
    }
  }
  uint64_t v133 = v210;
  v129->super.super.isa = (Class)v140;
  self[1].super._nextFIFO = v132;
  *(void *)&self[1]._emitInterpolatedPoints = v141;
  if (nextFIFO)
  {
LABEL_107:
    operator delete(nextFIFO);
    CHPointFIFO v45 = (CHPointFIFO)v216;
    float32x4_t v41 = v218;
  }
LABEL_108:
  self[1].super._nextFIFO = v132;
  *(CHPointFIFO *)((char *)&self->super + v133) = v45;
  if (self->_drawingTarget)
  {
    if (vmovn_s32(vcgtq_f32(v41, r1_16)).u8[0]) {
      float v143 = r1_16.f32[0];
    }
    else {
      float v143 = v41.f32[0];
    }
    double v144 = v143;
    objc_msgSend_lineWidth(self, v24, v25, v26, v27, v28, v210);
    double r1c = v144 - v150 * 0.5;
    if (r1_16.f32[1] >= v37) {
      float v151 = v37;
    }
    else {
      float v151 = r1_16.f32[1];
    }
    float v152 = v37;
    double v153 = v151;
    objc_msgSend_lineWidth(self, v145, v146, v147, v148, v149);
    double v155 = v153 - v154 * 0.5;
    objc_msgSend_lineWidth(self, v156, v157, v158, v159, v160);
    double v162 = v161 + fabsf(vsubq_f32(v218, r1_16).f32[0]);
    objc_msgSend_lineWidth(self, v163, v164, v165, v166, v167);
    double v174 = v173 + vabds_f32(v152, r1_16.f32[1]);
    if (vmovn_s32(vcgtq_f32(v216, v218)).u8[0]) {
      float v175 = v218.f32[0];
    }
    else {
      float v175 = v216.f32[0];
    }
    double v176 = v175;
    objc_msgSend_lineWidth(self, v168, v169, v170, v171, v172);
    double v183 = v176 - v182 * 0.5;
    if (v152 >= v38) {
      float v184 = v38;
    }
    else {
      float v184 = v152;
    }
    double v185 = v184;
    objc_msgSend_lineWidth(self, v177, v178, v179, v180, v181);
    CGFloat v187 = v185 - v186 * 0.5;
    objc_msgSend_lineWidth(self, v188, v189, v190, v191, v192);
    CGFloat v194 = v193 + fabsf(vsubq_f32(v216, v218).f32[0]);
    objc_msgSend_lineWidth(self, v195, v196, v197, v198, v199);
    v221.size.height = v200 + vabds_f32(v38, v152);
    v219.origin.x = r1c;
    v219.origin.y = v155;
    v219.size.width = v162;
    v219.size.height = v174;
    v221.origin.x = v183;
    v221.origin.y = v187;
    v221.size.width = v194;
    CGRect v220 = CGRectUnion(v219, v221);
    objc_msgSend_setNeedsDisplayInRect_(self->_drawingTarget, v201, v202, v203, v204, v205, v220.origin.x, v220.origin.y, v220.size.width, v220.size.height);
  }
LABEL_122:
  emissionHandler = (void (**)(void))self->_emissionHandler;
  if (emissionHandler)
  {
    emissionHandler[2]();
    v207 = self->_anon_68;
    uint64_t v208 = *(void *)self->_anon_68;
    if (*(void *)&self->_anon_68[8] == v208) {
      return;
    }
  }
  else
  {
    v207 = self->_anon_68;
    uint64_t v208 = *(void *)self->_anon_68;
    if (*(void *)&self->_anon_68[8] == v208) {
      return;
    }
  }
  unint64_t v209 = 0;
  do
  {
    objc_msgSend_emitPoint_(self, v24, v25, v26, v27, v28, *(double *)(v208 + 16 * v209++), v210);
    uint64_t v208 = *(void *)v207;
  }
  while (v209 < (uint64_t)(*((void *)v207 + 1) - *(void *)v207) >> 4);
}

- (void)flush
{
  CHPointFIFO v125 = (CHPointFIFO)0;
  anon_50 = self->_anon_50;
  uint64_t v4 = *(void *)&self->_anon_50[8];
  if (v4 == *(void *)self->_anon_50) {
    goto LABEL_87;
  }
  float32x4_t v5 = *(float32x4_t *)self->_lastPoint;
  float32x4_t v6 = *(float32x4_t *)(v4 - 16);
  v7.i64[0] = 0x3F0000003F000000;
  v7.i64[1] = 0x3F0000003F000000;
  float32x4_t v122 = v6;
  float32x4_t v123 = v5;
  float32x4_t v117 = vsubq_f32(v6, v5);
  float32x4_t v121 = vmlaq_f32(v5, v7, v117);
  LODWORD(v8) = HIDWORD(*(void *)(v4 - 16));
  CGPathAddLineToPoint(self->_path, 0, v6.f32[0], v6.f32[1]);
  anon_68 = self->_anon_68;
  *(void *)&self->_anon_68[8] = *(void *)self->_anon_68;
  if (!self->_emitInterpolatedPoints)
  {
    objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v9, v10, v11, v12, v13, *(double *)v123.i64, *(double *)v122.i64, *(double *)v121.i64, 0.0);
    float v44 = *(_OWORD **)&self->_anon_68[8];
    unint64_t v43 = *(void *)&self->_anon_68[16];
    if ((unint64_t)v44 < v43)
    {
      *float v44 = v41;
      CHPointFIFO v45 = v44 + 1;
      goto LABEL_40;
    }
    int v46 = *(_OWORD **)anon_68;
    uint64_t v47 = ((uint64_t)v44 - *(void *)anon_68) >> 4;
    unint64_t v48 = v47 + 1;
    if ((unint64_t)(v47 + 1) >> 60) {
      goto LABEL_88;
    }
    uint64_t v49 = v43 - (void)v46;
    if (v49 >> 3 > v48) {
      unint64_t v48 = v49 >> 3;
    }
    if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v50 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v50 = v48;
    }
    if (v50)
    {
      long long v119 = v41;
      if (v50 >> 60) {
        goto LABEL_89;
      }
      v51 = (char *)operator new(16 * v50);
      v52 = &v51[16 * v47];
      uint64_t v53 = &v51[16 * v50];
      *(_OWORD *)v52 = v119;
      CHPointFIFO v45 = v52 + 16;
      if (v44 == v46) {
        goto LABEL_38;
      }
    }
    else
    {
      v52 = (char *)(16 * v47);
      uint64_t v53 = 0;
      unint64_t v54 = (_OWORD *)(16 * v47);
      *unint64_t v54 = v41;
      CHPointFIFO v45 = v54 + 1;
      if (v44 == v46) {
        goto LABEL_38;
      }
    }
    do
    {
      long long v55 = *--v44;
      *((_OWORD *)v52 - 1) = v55;
      v52 -= 16;
    }
    while (v44 != v46);
    float v44 = *(_OWORD **)anon_68;
LABEL_38:
    *(void *)anon_68 = v52;
    *(void *)&self->_anon_68[8] = v45;
    *(void *)&self->_anon_68[16] = v53;
    if (v44) {
      operator delete(v44);
    }
LABEL_40:
    *(void *)&self->_anon_68[8] = v45;
    LODWORD(v42) = 1.0;
    objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v36, v37, v38, v39, v40, *(double *)v123.i64, *(double *)v122.i64, *(double *)v121.i64, v42, *(_OWORD *)&v117);
    v58 = *(_OWORD **)&self->_anon_68[8];
    unint64_t v57 = *(void *)&self->_anon_68[16];
    if ((unint64_t)v58 < v57)
    {
      _OWORD *v58 = v56;
      v59 = v58 + 1;
LABEL_57:
      __n128 v19 = (__n128)v122;
      __n128 v18 = (__n128)v123;
      *(void *)&self->_anon_68[8] = v59;
      CHPointFIFO v20 = (CHPointFIFO)v121;
      goto LABEL_58;
    }
    long long v60 = *(_OWORD **)anon_68;
    uint64_t v61 = ((uint64_t)v58 - *(void *)anon_68) >> 4;
    unint64_t v62 = v61 + 1;
    if ((unint64_t)(v61 + 1) >> 60) {
      goto LABEL_88;
    }
    uint64_t v63 = v57 - (void)v60;
    if (v63 >> 3 > v62) {
      unint64_t v62 = v63 >> 3;
    }
    if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v64 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v64 = v62;
    }
    if (v64)
    {
      long long v120 = v56;
      if (v64 >> 60) {
        goto LABEL_89;
      }
      uint64_t v65 = (char *)operator new(16 * v64);
      v66 = &v65[16 * v61];
      v67 = &v65[16 * v64];
      *(_OWORD *)v66 = v120;
      v59 = v66 + 16;
      if (v58 == v60) {
        goto LABEL_55;
      }
    }
    else
    {
      v66 = (char *)(16 * v61);
      v67 = 0;
      double v68 = (_OWORD *)(16 * v61);
      *double v68 = v56;
      v59 = v68 + 1;
      if (v58 == v60) {
        goto LABEL_55;
      }
    }
    do
    {
      long long v69 = *--v58;
      *((_OWORD *)v66 - 1) = v69;
      v66 -= 16;
    }
    while (v58 != v60);
    v58 = *(_OWORD **)anon_68;
LABEL_55:
    *(void *)anon_68 = v66;
    *(void *)&self->_anon_68[8] = v59;
    *(void *)&self->_anon_68[16] = v67;
    if (v58) {
      operator delete(v58);
    }
    goto LABEL_57;
  }
  float32x4_t v15 = vsubq_f32(v123, v121);
  float32x4_t v16 = vsubq_f32(v121, v122);
  float v17 = (float)(sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v15, v15)))
              + sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v16, v16))))
      / self->_unitScale;
  __n128 v18 = (__n128)v123;
  __n128 v19 = (__n128)v122;
  CHPointFIFO v20 = (CHPointFIFO)v121;
  if (v17 > 0.0)
  {
    int v21 = 0;
    double v22 = 0.0;
    while (1)
    {
      *(float *)&double v22 = *(float *)&v22 / v17;
      objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v9, v10, v11, v12, v13, v18.n128_f64[0], v19.n128_f64[0], *(double *)&v20.super.isa, v22, *(_OWORD *)&v117);
      uint64_t v26 = *(_OWORD **)&self->_anon_68[8];
      unint64_t v25 = *(void *)&self->_anon_68[16];
      if ((unint64_t)v26 >= v25) {
        break;
      }
      *uint64_t v26 = v24;
      double v23 = v26 + 1;
LABEL_6:
      __n128 v19 = (__n128)v122;
      __n128 v18 = (__n128)v123;
      *(void *)&self->_anon_68[8] = v23;
      *(float *)&double v22 = (float)++v21;
      CHPointFIFO v20 = (CHPointFIFO)v121;
      if (v17 <= (float)v21) {
        goto LABEL_58;
      }
    }
    uint64_t v27 = *(_OWORD **)anon_68;
    uint64_t v28 = ((uint64_t)v26 - *(void *)anon_68) >> 4;
    unint64_t v29 = v28 + 1;
    if ((unint64_t)(v28 + 1) >> 60) {
      goto LABEL_88;
    }
    uint64_t v30 = v25 - (void)v27;
    if (v30 >> 3 > v29) {
      unint64_t v29 = v30 >> 3;
    }
    if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v31 = v29;
    }
    if (v31)
    {
      long long v118 = v24;
      if (v31 >> 60) {
        goto LABEL_89;
      }
      v32 = (char *)operator new(16 * v31);
      float32x4_t v33 = &v32[16 * v28];
      *(_OWORD *)float32x4_t v33 = v118;
      double v23 = v33 + 16;
      if (v26 == v27) {
        goto LABEL_21;
      }
    }
    else
    {
      v32 = 0;
      float32x4_t v33 = (char *)(16 * v28);
      float32x4_t v34 = (_OWORD *)(16 * v28);
      *float32x4_t v34 = v24;
      double v23 = v34 + 1;
      if (v26 == v27) {
        goto LABEL_21;
      }
    }
    do
    {
      long long v35 = *--v26;
      *((_OWORD *)v33 - 1) = v35;
      v33 -= 16;
    }
    while (v26 != v27);
    uint64_t v26 = *(_OWORD **)anon_68;
LABEL_21:
    *(void *)anon_68 = v33;
    *(void *)&self->_anon_68[8] = v23;
    *(void *)&self->_anon_68[16] = &v32[16 * v31];
    if (v26) {
      operator delete(v26);
    }
    goto LABEL_6;
  }
LABEL_58:
  v70 = self + 1;
  nextFIFO = self[1].super._nextFIFO;
  unint64_t v71 = *(void *)&self[1]._emitInterpolatedPoints;
  if ((unint64_t)nextFIFO >= v71)
  {
    isa = (CHPointFIFO *)v70->super.super.isa;
    uint64_t v75 = ((char *)nextFIFO - (char *)v70->super.super.isa) >> 4;
    unint64_t v76 = v75 + 1;
    if (!((unint64_t)(v75 + 1) >> 60))
    {
      uint64_t v77 = v71 - (void)isa;
      if (v77 >> 3 > v76) {
        unint64_t v76 = v77 >> 3;
      }
      if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v78 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v78 = v76;
      }
      if (!v78)
      {
        uint64_t v80 = (CHPointFIFO *)(16 * v75);
        uint64_t v81 = 0;
        double v82 = (CHPointFIFO *)(16 * v75);
        *double v82 = v20;
        uint64_t v73 = v82 + 1;
        if (nextFIFO == isa) {
          goto LABEL_73;
        }
        do
        {
LABEL_71:
          CHPointFIFO v83 = nextFIFO[-1];
          --nextFIFO;
          v80[-1] = v83;
          --v80;
        }
        while (nextFIFO != isa);
        nextFIFO = (CHPointFIFO *)v70->super.super.isa;
LABEL_73:
        v70->super.super.isa = (Class)v80;
        self[1].super._nextFIFO = v73;
        *(void *)&self[1]._emitInterpolatedPoints = v81;
        if (nextFIFO)
        {
          operator delete(nextFIFO);
          CHPointFIFO v20 = (CHPointFIFO)v121;
          __n128 v19 = (__n128)v122;
          __n128 v18 = (__n128)v123;
        }
        goto LABEL_75;
      }
      if (!(v78 >> 60))
      {
        uint64_t v79 = (char *)operator new(16 * v78);
        __n128 v19 = (__n128)v122;
        __n128 v18 = (__n128)v123;
        CHPointFIFO v20 = (CHPointFIFO)v121;
        uint64_t v80 = (CHPointFIFO *)&v79[16 * v75];
        uint64_t v81 = &v79[16 * v78];
        *uint64_t v80 = (CHPointFIFO)v121;
        uint64_t v73 = v80 + 1;
        if (nextFIFO == isa) {
          goto LABEL_73;
        }
        goto LABEL_71;
      }
LABEL_89:
      sub_1C4949AA8();
    }
LABEL_88:
    sub_1C494A220();
  }
  CHPointFIFO *nextFIFO = v20;
  uint64_t v73 = nextFIFO + 1;
LABEL_75:
  self[1].super._nextFIFO = v73;
  CHPointFIFO v125 = v20;
  if (self->_drawingTarget)
  {
    if (vmovn_s32(vcgtq_f32((float32x4_t)v19, (float32x4_t)v18)).u8[0]) {
      v19.n128_f32[0] = v18.n128_f32[0];
    }
    double v84 = v19.n128_f32[0];
    objc_msgSend_lineWidth(self, v9, v10, v11, v12, v13, *(_OWORD *)&v117);
    double v91 = v84 - v90 * 0.5;
    if (v123.f32[1] >= v8) {
      float v92 = v8;
    }
    else {
      float v92 = v123.f32[1];
    }
    double v93 = v92;
    objc_msgSend_lineWidth(self, v85, v86, v87, v88, v89);
    double v95 = v93 - v94 * 0.5;
    objc_msgSend_lineWidth(self, v96, v97, v98, v99, v100);
    double v102 = v101 + fabsf(v117.f32[0]);
    objc_msgSend_lineWidth(self, v103, v104, v105, v106, v107);
    objc_msgSend_setNeedsDisplayInRect_(self->_drawingTarget, v109, v110, v111, v112, v113, v91, v95, v102, v108 + vabds_f32(v8, v123.f32[1]));
  }
  emissionHandler = (void (**)(__n128, __n128))self->_emissionHandler;
  if (emissionHandler) {
    emissionHandler[2](v18, v19);
  }
  long long v115 = *(_OWORD **)anon_68;
  if (*(void *)&self->_anon_68[8] != *(void *)self->_anon_68)
  {
    unint64_t v116 = 0;
    do
    {
      objc_msgSend_emitPoint_(self, v9, v10, v11, v12, v13, *(double *)&v115[v116++], v19.n128_f64[0], *(_OWORD *)&v117);
      long long v115 = *(_OWORD **)anon_68;
    }
    while (v116 < (uint64_t)(*(void *)&self->_anon_68[8] - *(void *)self->_anon_68) >> 4);
  }
LABEL_87:
  *((void *)anon_50 + 1) = *(void *)anon_50;
  v124.receiver = self;
  v124.super_class = (Class)CHQuadCurvePointFIFO;
  [(CHPointFIFO *)&v124 flush];
}

- (void)clear
{
  *(void *)&self->_anon_50[8] = *(void *)self->_anon_50;
  *(void *)&self->_anon_68[8] = *(void *)self->_anon_68;
  path = self->_path;
  if (path) {
    CGPathRelease(path);
  }
  self->_path = CGPathCreateMutable();
  v4.receiver = self;
  v4.super_class = (Class)CHQuadCurvePointFIFO;
  [(CHPointFIFO *)&v4 clear];
}

- (float)unitScale
{
  return self->_unitScale;
}

- (void)setUnitScale:(float)a3
{
  self->_unitScale = a3;
}

- (BOOL)emitInterpolatedPoints
{
  return self->_emitInterpolatedPoints;
}

- (void)setEmitInterpolatedPoints:(BOOL)a3
{
  self->_emitInterpolatedPoints = a3;
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setEmissionHandler:(id)a3
{
}

- (CGPath)path
{
  return self->_path;
}

- (void)setPath:(CGPath *)a3
{
  self->_path = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  float32x4_t v3 = self + 1;
  Class isa = self[1].super.super.isa;
  if (isa)
  {
    v3->super._nextFIFO = (CHPointFIFO *)isa;
    operator delete(isa);
  }
  float32x4_t v5 = *(void **)self->_anon_68;
  if (v5)
  {
    *(void *)&self->_anon_68[8] = v5;
    operator delete(v5);
  }
  float32x4_t v6 = *(void **)self->_anon_50;
  if (v6)
  {
    *(void *)&self->_anon_50[8] = v6;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_drawingTarget, 0);
  objc_storeStrong(&self->_emissionHandler, 0);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 16) = 0;
  return self;
}

@end