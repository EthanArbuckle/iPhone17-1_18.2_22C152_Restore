@interface ETQuadCurvePointFIFO
- (BOOL)emitInterpolatedPoints;
- (ETQuadCurvePointFIFO)initWithFIFO:(id)a3;
- (double)lastPoint;
- (float)unitSize;
- (id).cxx_construct;
- (id)emissionHandler;
- (vector<float)controlPoints;
- (vector<float)points;
- (vector<float)prevPoints;
- (void)addPoints:(ETQuadCurvePointFIFO *)self count:(SEL)a2;
- (void)clear;
- (void)flush;
- (void)setControlPoints:(vector<float)__attribute__((ext_vector_type(2;
- (void)setEmissionHandler:(id)a3;
- (void)setEmitInterpolatedPoints:(BOOL)a3;
- (void)setLastPoint:(ETQuadCurvePointFIFO *)self;
- (void)setPoints:(vector<float)__attribute__((ext_vector_type(2;
- (void)setPrevPoints:(vector<float)__attribute__((ext_vector_type(2;
- (void)setUnitSize:(float)a3;
@end

@implementation ETQuadCurvePointFIFO

- (ETQuadCurvePointFIFO)initWithFIFO:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ETQuadCurvePointFIFO;
  result = [(ETPointFIFO *)&v4 initWithFIFO:a3];
  if (result)
  {
    result->_unitSize = 1.0;
    result->_emitInterpolatedPoints = 1;
  }
  return result;
}

- (void)addPoints:(ETQuadCurvePointFIFO *)self count:(SEL)a2
{
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = v2;
    uint64_t v7 = 0;
    p_prevPoints = &self->_prevPoints;
    v104 = &self->_anon_30[8];
    uint64_t v105 = v3;
    unint64_t v9 = 0x268A6D000uLL;
    unint64_t v10 = 0x268A6D000uLL;
    do
    {
      var0 = p_prevPoints[1].var0;
      v11 = p_prevPoints[2].var0;
      if (var0 >= v11)
      {
        uint64_t v14 = var0 - p_prevPoints->var0;
        if ((unint64_t)(v14 + 1) >> 61) {
          _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v15 = (char *)v11 - (char *)p_prevPoints->var0;
        uint64_t v16 = v15 >> 2;
        if (v15 >> 2 <= (unint64_t)(v14 + 1)) {
          uint64_t v16 = v14 + 1;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v16;
        }
        if (v17) {
          v18 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)v104, v17);
        }
        else {
          v18 = 0;
        }
        v19 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v18[8 * v14];
        *v19 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)(v5 + 8 * v7);
        v13 = v19 + 1;
        v21 = p_prevPoints->var0;
        v20 = p_prevPoints[1].var0;
        if (v20 != p_prevPoints->var0)
        {
          do
          {
            v22 = *--v20;
            *--v19 = v22;
          }
          while (v20 != v21);
          v20 = p_prevPoints->var0;
        }
        p_prevPoints->var0 = v19;
        p_prevPoints[1].var0 = v13;
        p_prevPoints[2].var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v18[8 * v17];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *var0 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)(v5 + 8 * v7);
        v13 = var0 + 1;
      }
      p_prevPoints[1].var0 = v13;
      v23 = (float32x2_t *)p_prevPoints->var0;
      uint64_t v24 = v13 - p_prevPoints->var0;
      if (v24 == 1)
      {
        uint64_t v51 = *(int *)(v9 + 3276);
        v52 = (void **)((char *)&self->super.super.isa + v51);
        v53 = *(ETPointFIFO **)((char *)&self->super.super.isa + v51);
        *(ETPointFIFO **)((char *)&self->super._nextFIFO + v51) = v53;
        unint64_t v54 = *(void *)(&self->_emitInterpolatedPoints + v51);
        if ((unint64_t)v53 >= v54)
        {
          uint64_t v56 = v54 - (void)v53;
          uint64_t v57 = v56 >> 2;
          if ((unint64_t)(v56 >> 2) <= 1) {
            uint64_t v57 = 1;
          }
          if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v58 = v57;
          }
          v60 = _ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(&self->_emitInterpolatedPoints + v51), v58);
          void *v60 = *(void *)(v5 + 8 * v7);
          p_nextFIFO = (ETPointFIFO **)(v60 + 1);
          v62 = (char *)*v52;
          v61 = (char *)v52[1];
          v63 = v60;
          if (v61 != *v52)
          {
            do
            {
              uint64_t v64 = *((void *)v61 - 1);
              v61 -= 8;
              *--v63 = v64;
            }
            while (v61 != v62);
            v61 = (char *)*v52;
          }
          *v52 = v63;
          v52[1] = p_nextFIFO;
          v52[2] = &v60[v59];
          if (v61) {
            operator delete(v61);
          }
        }
        else
        {
          v53->super.Class isa = *(Class *)(v5 + 8 * v7);
          p_nextFIFO = &v53->_nextFIFO;
        }
        v52[1] = p_nextFIFO;
        *(Class *)((char *)&self->super.super.isa + *(int *)(v10 + 3280)) = *(Class *)(v5 + 8 * v7);
      }
      else if (v24 == 3)
      {
        float32x2_t v25 = v23[1];
        float32x2_t v26 = v23[2];
        uint64_t v27 = *(int *)(v10 + 3280);
        float32x2_t v28 = *(float32x2_t *)((char *)&self->super.super.isa + v27);
        if (v13 != (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v23[1]) {
          memmove(p_prevPoints->var0, &v23[1], (char *)v13 - (char *)&v23[1]);
        }
        v29 = (objc_class *)vmla_f32(v25, (float32x2_t)0x3F0000003F000000, vsub_f32(v26, v25));
        p_prevPoints[1].var0 = v13 - 1;
        v30 = (char *)self + *(int *)(v9 + 3276);
        v31 = *(float32x2_t **)v30;
        *((void *)v30 + 1) = *(void *)v30;
        if (self->_emitInterpolatedPoints)
        {
          float32x2_t v32 = vsub_f32(v28, v25);
          int32x2_t v33 = (int32x2_t)vmul_f32(v32, v32);
          float32x2_t v34 = vsub_f32(v25, (float32x2_t)v29);
          int32x2_t v35 = (int32x2_t)vmul_f32(v34, v34);
          float v36 = vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v33, v35), (float32x2_t)vzip2_s32(v33, v35))))
              / self->_unitSize;
          if (v36 > 0.0)
          {
            int v37 = 0;
            v38 = v30 + 16;
            float v39 = 0.0;
            do
            {
              float v40 = v39 / v36;
              float32x2_t v41 = vmla_n_f32(vmla_n_f32(vmul_n_f32(v25, v40 * (float)((float)(1.0 - v40) + (float)(1.0 - v40))), v28, (float)(1.0 - v40) * (float)(1.0 - v40)), (float32x2_t)v29, v40 * v40);
              if ((unint64_t)v31 >= *v38)
              {
                uint64_t v42 = ((uint64_t)v31 - *(void *)v30) >> 3;
                if ((unint64_t)(v42 + 1) >> 61) {
                  goto LABEL_108;
                }
                uint64_t v43 = *v38 - *(void *)v30;
                uint64_t v44 = v43 >> 2;
                if (v43 >> 2 <= (unint64_t)(v42 + 1)) {
                  uint64_t v44 = v42 + 1;
                }
                if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v45 = v44;
                }
                if (v45) {
                  v46 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v30 + 16), v45);
                }
                else {
                  v46 = 0;
                }
                v47 = (float32x2_t *)&v46[8 * v42];
                float32x2_t *v47 = v41;
                v31 = v47 + 1;
                v49 = *(char **)v30;
                v48 = (char *)*((void *)v30 + 1);
                if (v48 != *(char **)v30)
                {
                  do
                  {
                    float32x2_t v50 = *(float32x2_t *)(v48 - 8);
                    v48 -= 8;
                    v47[-1] = v50;
                    --v47;
                  }
                  while (v48 != v49);
                  v48 = *(char **)v30;
                }
                *(void *)v30 = v47;
                *((void *)v30 + 1) = v31;
                *((void *)v30 + 2) = &v46[8 * v45];
                if (v48) {
                  operator delete(v48);
                }
              }
              else
              {
                *v31++ = v41;
              }
              *((void *)v30 + 1) = v31;
              float v39 = (float)++v37;
            }
            while (v36 > (float)v37);
          }
        }
        else
        {
          float32x2_t v65 = vmul_f32(v25, 0);
          float32x2_t v66 = vmla_f32(vadd_f32(v65, v28), 0, (float32x2_t)v29);
          unint64_t v67 = *((void *)v30 + 2);
          if ((unint64_t)v31 >= v67)
          {
            uint64_t v69 = v67 - (void)v31;
            uint64_t v70 = v69 >> 2;
            if ((unint64_t)(v69 >> 2) <= 1) {
              uint64_t v70 = 1;
            }
            if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v71 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v71 = v70;
            }
            v73 = (float32x2_t *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v30 + 16), v71);
            float32x2_t *v73 = v66;
            v68 = v73 + 1;
            v75 = *(char **)v30;
            v74 = (char *)*((void *)v30 + 1);
            v76 = v73;
            if (v74 != *(char **)v30)
            {
              do
              {
                float32x2_t v77 = *(float32x2_t *)(v74 - 8);
                v74 -= 8;
                v76[-1] = v77;
                --v76;
              }
              while (v74 != v75);
              v74 = *(char **)v30;
            }
            *(void *)v30 = v76;
            *((void *)v30 + 1) = v68;
            *((void *)v30 + 2) = &v73[v72];
            if (v74) {
              operator delete(v74);
            }
          }
          else
          {
            float32x2_t *v31 = v66;
            v68 = v31 + 1;
          }
          *((void *)v30 + 1) = v68;
          float32x2_t v78 = vadd_f32((float32x2_t)v29, vmla_f32(v65, 0, v28));
          unint64_t v79 = *((void *)v30 + 2);
          if ((unint64_t)v68 >= v79)
          {
            uint64_t v81 = ((uint64_t)v68 - *(void *)v30) >> 3;
            if ((unint64_t)(v81 + 1) >> 61) {
              goto LABEL_108;
            }
            uint64_t v82 = v79 - *(void *)v30;
            uint64_t v83 = v82 >> 2;
            if (v82 >> 2 <= (unint64_t)(v81 + 1)) {
              uint64_t v83 = v81 + 1;
            }
            if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v84 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v84 = v83;
            }
            if (v84) {
              v85 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v30 + 16), v84);
            }
            else {
              v85 = 0;
            }
            v86 = (float32x2_t *)&v85[8 * v81];
            float32x2_t *v86 = v78;
            v80 = v86 + 1;
            v88 = *(char **)v30;
            v87 = (char *)*((void *)v30 + 1);
            if (v87 != *(char **)v30)
            {
              do
              {
                float32x2_t v89 = *(float32x2_t *)(v87 - 8);
                v87 -= 8;
                v86[-1] = v89;
                --v86;
              }
              while (v87 != v88);
              v87 = *(char **)v30;
            }
            *(void *)v30 = v86;
            *((void *)v30 + 1) = v80;
            *((void *)v30 + 2) = &v85[8 * v84];
            if (v87) {
              operator delete(v87);
            }
          }
          else
          {
            float32x2_t *v68 = v78;
            v80 = v68 + 1;
          }
          *((void *)v30 + 1) = v80;
        }
        p_controlPoints = &self->_controlPoints;
        Class isa = self[1].super.super.isa;
        nextFIFO = self[1].super._nextFIFO;
        if (isa >= (Class)nextFIFO)
        {
          uint64_t v94 = (isa - (Class)p_controlPoints->var0) >> 3;
          if ((unint64_t)(v94 + 1) >> 61) {
LABEL_108:
          }
            _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
          uint64_t v95 = (char *)nextFIFO - (char *)p_controlPoints->var0;
          uint64_t v96 = v95 >> 2;
          if (v95 >> 2 <= (unint64_t)(v94 + 1)) {
            uint64_t v96 = v94 + 1;
          }
          if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v97 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v97 = v96;
          }
          if (v97) {
            v98 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self[1].super._nextFIFO, v97);
          }
          else {
            v98 = 0;
          }
          unint64_t v9 = 0x268A6D000;
          v99 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v98[8 * v94];
          *v99 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v25;
          v93 = (objc_class *)(v99 + 1);
          v101 = p_controlPoints->var0;
          Class v100 = self[1].super.super.isa;
          if (v100 != (Class)p_controlPoints->var0)
          {
            do
            {
              v102 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)*((void *)v100 - 1);
              Class v100 = (Class)((char *)v100 - 8);
              *--v99 = v102;
            }
            while (v100 != (Class)v101);
            Class v100 = (Class)p_controlPoints->var0;
          }
          p_controlPoints->var0 = v99;
          self[1].super.super.Class isa = v93;
          self[1].super._nextFIFO = (ETPointFIFO *)&v98[8 * v97];
          if (v100) {
            operator delete(v100);
          }
        }
        else
        {
          *(float32x2_t *)Class isa = v25;
          v93 = (Class)((char *)isa + 8);
          unint64_t v9 = 0x268A6D000;
        }
        self[1].super.super.Class isa = v93;
        *(Class *)((char *)&self->super.super.isa + v27) = v29;
        uint64_t v4 = v105;
        unint64_t v10 = 0x268A6D000;
      }
      emissionHandler = (void (**)(void))self->_emissionHandler;
      if (emissionHandler) {
        emissionHandler[2]();
      }
      -[ETPointFIFO emitPoints:count:](self, "emitPoints:count:");
      ++v7;
    }
    while (v7 != v4);
  }
}

- (void)flush
{
  float32x2_t v69 = 0;
  p_prevPoints = &self->_prevPoints;
  uint64_t v4 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_30;
  if (v4 != self->_prevPoints.var0)
  {
    float32x2_t v5 = *(float32x2_t *)self->_lastPoint;
    float32x2_t v6 = (float32x2_t)*(v4 - 1);
    float32x2_t v7 = vmla_f32(v5, (float32x2_t)0x3F0000003F000000, vsub_f32(v6, v5));
    p_points = &self->_points;
    var0 = self->_points.var0;
    *(void *)self->_anon_48 = var0;
    if (self->_emitInterpolatedPoints)
    {
      float32x2_t v10 = vsub_f32(v5, v7);
      float32x2_t v11 = vsub_f32(v7, v6);
      float v12 = (float)(sqrtf(vaddv_f32(vmul_f32(v10, v10))) + sqrtf(vaddv_f32(vmul_f32(v11, v11)))) / self->_unitSize;
      if (v12 > 0.0)
      {
        int v13 = 0;
        uint64_t v14 = &self->_anon_48[8];
        float v15 = 0.0;
        do
        {
          float v16 = v15 / v12;
          float32x2_t v17 = vmla_n_f32(vmla_n_f32(vmul_n_f32(v7, v16 * (float)((float)(1.0 - v16) + (float)(1.0 - v16))), v5, (float)(1.0 - v16) * (float)(1.0 - v16)), v6, v16 * v16);
          if ((unint64_t)var0 >= *(void *)v14)
          {
            uint64_t v18 = var0 - p_points->var0;
            if ((unint64_t)(v18 + 1) >> 61) {
              goto LABEL_72;
            }
            uint64_t v19 = *(void *)v14 - (unint64_t)p_points->var0;
            uint64_t v20 = v19 >> 2;
            if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
              uint64_t v20 = v18 + 1;
            }
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v20;
            }
            if (v21) {
              v22 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&p_points[2], v21);
            }
            else {
              v22 = 0;
            }
            v23 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v22[8 * v18];
            float32x2_t *v23 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v17;
            var0 = v23 + 1;
            float32x2_t v25 = p_points->var0;
            uint64_t v24 = p_points[1].var0;
            if (v24 != p_points->var0)
            {
              do
              {
                float32x2_t v26 = *--v24;
                *--v23 = v26;
              }
              while (v24 != v25);
              uint64_t v24 = p_points->var0;
            }
            p_points->var0 = v23;
            p_points[1].var0 = var0;
            p_points[2].var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v22[8 * v21];
            if (v24) {
              operator delete(v24);
            }
          }
          else
          {
            *var0++ = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v17;
          }
          p_points[1].var0 = var0;
          float v15 = (float)++v13;
        }
        while (v12 > (float)v13);
      }
    }
    else
    {
      float32x2_t v27 = vmul_f32(v7, 0);
      float32x2_t v28 = vmla_f32(vadd_f32(v5, v27), 0, v6);
      unint64_t v29 = *(void *)&self->_anon_48[8];
      if ((unint64_t)var0 >= v29)
      {
        uint64_t v31 = v29 - (void)var0;
        uint64_t v32 = v31 >> 2;
        if ((unint64_t)(v31 >> 2) <= 1) {
          uint64_t v32 = 1;
        }
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v33 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v33 = v32;
        }
        float32x2_t v34 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_48[8], v33);
        float v36 = &v34[v35];
        *float32x2_t v34 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v28;
        v30 = v34 + 1;
        v38 = p_points->var0;
        int v37 = p_points[1].var0;
        if (v37 != p_points->var0)
        {
          do
          {
            float v39 = *--v37;
            *--float32x2_t v34 = v39;
          }
          while (v37 != v38);
          int v37 = p_points->var0;
        }
        p_points->var0 = v34;
        p_points[1].var0 = v30;
        p_points[2].var0 = v36;
        if (v37) {
          operator delete(v37);
        }
      }
      else
      {
        *var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v28;
        v30 = var0 + 1;
      }
      p_points[1].var0 = v30;
      float32x2_t v40 = vadd_f32(v6, vmla_f32(v27, 0, v5));
      float32x2_t v41 = p_points[2].var0;
      if (v30 >= v41)
      {
        uint64_t v43 = v30 - p_points->var0;
        if ((unint64_t)(v43 + 1) >> 61) {
          goto LABEL_72;
        }
        uint64_t v44 = (char *)v41 - (char *)p_points->var0;
        uint64_t v45 = v44 >> 2;
        if (v44 >> 2 <= (unint64_t)(v43 + 1)) {
          uint64_t v45 = v43 + 1;
        }
        if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v46 = v45;
        }
        if (v46) {
          v47 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&p_points[2], v46);
        }
        else {
          v47 = 0;
        }
        v48 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v47[8 * v43];
        v49 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v47[8 * v46];
        char *v48 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v40;
        uint64_t v42 = v48 + 1;
        uint64_t v51 = p_points->var0;
        float32x2_t v50 = p_points[1].var0;
        if (v50 != p_points->var0)
        {
          do
          {
            v52 = *--v50;
            *--v48 = v52;
          }
          while (v50 != v51);
          float32x2_t v50 = p_points->var0;
        }
        p_points->var0 = v48;
        p_points[1].var0 = v42;
        p_points[2].var0 = v49;
        if (v50) {
          operator delete(v50);
        }
      }
      else
      {
        char *v30 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v40;
        uint64_t v42 = v30 + 1;
      }
      p_points[1].var0 = v42;
    }
    p_controlPoints = &self->_controlPoints;
    Class isa = self[1].super.super.isa;
    nextFIFO = self[1].super._nextFIFO;
    if (isa < (Class)nextFIFO)
    {
      *(float32x2_t *)Class isa = v7;
      uint64_t v56 = (Class)((char *)isa + 8);
LABEL_68:
      self[1].super.super.Class isa = v56;
      float32x2_t v69 = v7;
      goto LABEL_69;
    }
    uint64_t v57 = (isa - (Class)p_controlPoints->var0) >> 3;
    if (!((unint64_t)(v57 + 1) >> 61))
    {
      uint64_t v58 = (char *)nextFIFO - (char *)p_controlPoints->var0;
      uint64_t v59 = v58 >> 2;
      if (v58 >> 2 <= (unint64_t)(v57 + 1)) {
        uint64_t v59 = v57 + 1;
      }
      if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v60 = v59;
      }
      if (v60) {
        v61 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self[1].super._nextFIFO, v60);
      }
      else {
        v61 = 0;
      }
      v62 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v61[8 * v57];
      v63 = (ETPointFIFO *)&v61[8 * v60];
      char *v62 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v7;
      uint64_t v56 = (objc_class *)(v62 + 1);
      float32x2_t v65 = p_controlPoints->var0;
      Class v64 = self[1].super.super.isa;
      if (v64 != (Class)p_controlPoints->var0)
      {
        do
        {
          float32x2_t v66 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)*((void *)v64 - 1);
          Class v64 = (Class)((char *)v64 - 8);
          *--v62 = v66;
        }
        while (v64 != (Class)v65);
        Class v64 = (Class)p_controlPoints->var0;
      }
      p_controlPoints->var0 = v62;
      self[1].super.super.Class isa = v56;
      self[1].super._nextFIFO = v63;
      if (v64) {
        operator delete(v64);
      }
      goto LABEL_68;
    }
LABEL_72:
    _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
  }
LABEL_69:
  emissionHandler = (void (**)(void))self->_emissionHandler;
  if (emissionHandler) {
    emissionHandler[2]();
  }
  -[ETPointFIFO emitPoints:count:](self, "emitPoints:count:");
  p_prevPoints[1].var0 = p_prevPoints->var0;
  v68.receiver = self;
  v68.super_class = (Class)ETQuadCurvePointFIFO;
  [(ETPointFIFO *)&v68 flush];
}

- (void)clear
{
  *(void *)self->_anon_30 = self->_prevPoints.var0;
  *(void *)self->_anon_48 = self->_points.var0;
  v2.receiver = self;
  v2.super_class = (Class)ETQuadCurvePointFIFO;
  [(ETPointFIFO *)&v2 clear];
}

- (float)unitSize
{
  return self->_unitSize;
}

- (void)setUnitSize:(float)a3
{
  self->_unitSize = a3;
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

- (vector<float)prevPoints
{
  v2[1] = 0;
  v2[2] = 0;
  *objc_super v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_prevPoints.var0, *(void *)self->_anon_30, (uint64_t)(*(void *)self->_anon_30 - (unint64_t)self->_prevPoints.var0) >> 3);
}

- (void)setPrevPoints:(vector<float)__attribute__((ext_vector_type(2
{
  p_prevPoints = (char *)&self->_prevPoints;
  if (p_prevPoints != (char *)a3.var0) {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_prevPoints, *(char **)a3.var0, *((void *)a3.var0 + 1), (uint64_t)(*((void *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
  }
}

- (vector<float)points
{
  v2[1] = 0;
  v2[2] = 0;
  *objc_super v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_points.var0, *(void *)self->_anon_48, (uint64_t)(*(void *)self->_anon_48 - (unint64_t)self->_points.var0) >> 3);
}

- (void)setPoints:(vector<float)__attribute__((ext_vector_type(2
{
  p_points = (char *)&self->_points;
  if (p_points != (char *)a3.var0) {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_points, *(char **)a3.var0, *((void *)a3.var0 + 1), (uint64_t)(*((void *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
  }
}

- (vector<float)controlPoints
{
  v2[1] = 0;
  v2[2] = 0;
  *objc_super v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_controlPoints.var0, (uint64_t)self[1].super.super.isa, (self[1].super.super.isa - (Class)self->_controlPoints.var0) >> 3);
}

- (void)setControlPoints:(vector<float)__attribute__((ext_vector_type(2
{
  p_controlPoints = (char *)&self->_controlPoints;
  if (p_controlPoints != (char *)a3.var0) {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_controlPoints, *(char **)a3.var0, *((void *)a3.var0 + 1), (uint64_t)(*((void *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
  }
}

- (double)lastPoint
{
  return *(double *)(a1 + 32);
}

- (void)setLastPoint:(ETQuadCurvePointFIFO *)self
{
  *(void *)self->_lastPoint = v2;
}

- (void).cxx_destruct
{
  p_controlPoints = &self->_controlPoints;
  var0 = self->_controlPoints.var0;
  if (var0)
  {
    p_controlPoints[1].var0 = var0;
    operator delete(var0);
  }
  float32x2_t v5 = self->_points.var0;
  if (v5)
  {
    *(void *)self->_anon_48 = v5;
    operator delete(v5);
  }
  float32x2_t v6 = self->_prevPoints.var0;
  if (v6)
  {
    *(void *)self->_anon_30 = v6;
    operator delete(v6);
  }

  objc_storeStrong(&self->_emissionHandler, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 11) = 0;
  return self;
}

@end