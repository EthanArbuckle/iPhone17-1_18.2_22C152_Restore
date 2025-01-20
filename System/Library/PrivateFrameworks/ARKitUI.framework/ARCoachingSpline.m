@interface ARCoachingSpline
+ (double)interpolate:(float32x4_t)a1 p1:(float32x4_t)a2 p2:(float32x4_t)a3 p3:(float32x4_t)a4 t:(float)a5;
+ (double)interpolateTangent:(float32x4_t)a1 p1:(float32x4_t)a2 p2:(float32x4_t)a3 p3:(float32x4_t)a4 t:(float)a5;
- ($3BA783FF50B239963188BE194EBFFEBA)controlPoints;
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)patchData;
- (ARCoachingSpline)initWithPoints:(ARCoachingSpline *)self numPoints:(SEL)a2 relativeThickness:pattern:mat:;
- (id).cxx_construct;
- (unsigned)indices;
- (unsigned)numControlPoints;
- (unsigned)numIndices;
- (unsigned)patchDataLength;
- (void)genLeftCapWithWidth:(float)a3;
- (void)genRightCapWithWidth:(float)a3;
- (void)genTubeIndicesWithPattern:(unint64_t)a3;
@end

@implementation ARCoachingSpline

- ($3BA783FF50B239963188BE194EBFFEBA)controlPoints
{
  if (self->_controlPoints.__begin_ == self->_controlPoints.__end_) {
    return 0;
  }
  else {
    return ($3BA783FF50B239963188BE194EBFFEBA *)self->_controlPoints.__begin_;
  }
}

- (unsigned)numControlPoints
{
  return (unint64_t)(self->_controlPoints.__end_ - self->_controlPoints.__begin_) >> 5;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)patchData
{
  if (self->_patchData.__begin_ == self->_patchData.__end_) {
    return 0;
  }
  else {
    return self->_patchData.__begin_;
  }
}

- (unsigned)patchDataLength
{
  return (unint64_t)(self->_patchData.__end_ - self->_patchData.__begin_) >> 3;
}

- (unsigned)indices
{
  if (self->_indices.__begin_ == self->_indices.__end_) {
    return 0;
  }
  else {
    return self->_indices.__begin_;
  }
}

- (unsigned)numIndices
{
  return (unint64_t)((char *)self->_indices.__end_ - (char *)self->_indices.__begin_) >> 1;
}

- (ARCoachingSpline)initWithPoints:(ARCoachingSpline *)self numPoints:(SEL)a2 relativeThickness:pattern:mat:
{
  uint64_t v10 = v4;
  int v11 = v3;
  float32x4_t v38 = v8;
  float32x4_t v39 = v9;
  float32x4_t v36 = v6;
  float32x4_t v37 = v7;
  float v12 = v5;
  uint64_t v13 = v2;
  v40.receiver = self;
  v40.super_class = (Class)ARCoachingSpline;
  v14 = [(ARCoachingSpline *)&v40 init];
  v15 = v14;
  if (v14)
  {
    v14->_cap_error = 0.25;
    v14->_float relativeThickness = v12;
    if (!v11) {
      __assert_rtn("-[ARCoachingSpline initWithPoints:numPoints:relativeThickness:pattern:mat:]", "ARCoachingSpline.mm", 104, "numPoints > 0");
    }
    uint64_t v16 = 0;
    p_controlPoints = &v14->_controlPoints;
    end = (float32x4_t *)v14->_controlPoints.__end_;
    do
    {
      float32x4_t v19 = vaddq_f32(v39, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, COERCE_FLOAT(*(_OWORD *)(v13 + 16 * v16))), v37, *(float32x2_t *)(v13 + 16 * v16), 1), v38, *(float32x4_t *)(v13 + 16 * v16), 2));
      float relativeThickness = v15->_relativeThickness;
      value = v15->_controlPoints.__end_cap_.__value_;
      if (end >= (float32x4_t *)value)
      {
        float32x4_t v35 = v19;
        uint64_t v22 = ((char *)end - (char *)p_controlPoints->__begin_) >> 5;
        if ((unint64_t)(v22 + 1) >> 59) {
          _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v23 = value - p_controlPoints->__begin_;
        uint64_t v24 = v23 >> 4;
        if (v23 >> 4 <= (unint64_t)(v22 + 1)) {
          uint64_t v24 = v22 + 1;
        }
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v25 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v25 = v24;
        }
        if (v25) {
          v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)&v15->_controlPoints.__end_cap_, v25);
        }
        else {
          v26 = 0;
        }
        v27 = (float32x4_t *)&v26[32 * v22];
        float32x4_t *v27 = v35;
        v27[1].f32[0] = relativeThickness;
        begin = v15->_controlPoints.__begin_;
        v28 = v15->_controlPoints.__end_;
        v30 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v27;
        if (v28 != begin)
        {
          do
          {
            long long v31 = *((_OWORD *)v28 - 1);
            *((_OWORD *)v30 - 2) = *((_OWORD *)v28 - 2);
            *((_OWORD *)v30 - 1) = v31;
            v30 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v30 - 32);
            v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v28 - 32);
          }
          while (v28 != begin);
          v28 = p_controlPoints->__begin_;
        }
        end = v27 + 2;
        v15->_controlPoints.__begin_ = v30;
        v15->_controlPoints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v27[2];
        v15->_controlPoints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v26[32 * v25];
        if (v28) {
          operator delete(v28);
        }
      }
      else
      {
        float32x4_t *end = v19;
        end[1].f32[0] = relativeThickness;
        end += 2;
      }
      v15->_controlPoints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)end;
      ++v16;
    }
    while (v16 != v11);
    [(ARCoachingSpline *)v15 genTubeIndicesWithPattern:v10];
    if (v10 != 2)
    {
      *(float *)&double v32 = v15->_relativeThickness * 0.05;
      [(ARCoachingSpline *)v15 genLeftCapWithWidth:v32];
      *(float *)&double v33 = v15->_relativeThickness * 0.05;
      [(ARCoachingSpline *)v15 genRightCapWithWidth:v33];
    }
  }
  return v15;
}

- (void)genLeftCapWithWidth:(float)a3
{
  float32x2_t v27 = *(float32x2_t *)&a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  p_controlPoints = (double **)&self->_controlPoints;
  +[ARCoachingSpline interpolate:**p_controlPoints p1:(*p_controlPoints)[4] p2:(*p_controlPoints)[8] p3:(*p_controlPoints)[12] t:0.0];
  float32x4_t v26 = v5;
  +[ARCoachingSpline interpolateTangent:**p_controlPoints p1:(*p_controlPoints)[4] p2:(*p_controlPoints)[8] p3:(*p_controlPoints)[12] t:0.0];
  int32x4_t v7 = (int32x4_t)vmulq_f32(v6, v6);
  v7.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1))).u32[0];
  float32x2_t v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
  float32x2_t v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
  float32x4_t v10 = vmulq_n_f32(v6, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]);
  float32x4_t v11 = vmlsq_lane_f32(v26, v10, v27, 0);
  _Q0 = vmulq_n_f32(v10, v27.f32[0]);
  float32x4_t v32 = v11;
  float32x4_t v30 = vmlaq_f32(v11, (float32x4_t)vdupq_n_s32(0xBA83126F), _Q0);
  int v31 = 0;
  v9.i32[0] = LODWORD(self->_cap_error);
  float relativeThickness = self->_relativeThickness;
  float32x4_t v34 = vmlaq_n_f32(v26, _Q0, v9.f32[0]);
  float v35 = relativeThickness;
  float32x4_t v36 = v34;
  float v37 = relativeThickness;
  long long v29 = xmmword_20B232250;
  __asm { FMOV            V0.2S, #1.0 }
  v28[0] = _Q0.i64[0];
  v28[1] = _Q0.i64[0];
  begin = self->_indices.__begin_;
  end = self->_indices.__end_;
  uint64_t v19 = (char *)end - (char *)begin;
  if (end != begin)
  {
    int v20 = 0;
    unint64_t v21 = v19 >> 1;
    do
    {
      *begin++ += 4;
      ++v20;
    }
    while (v21 > (unsigned __int16)v20);
  }
  for (uint64_t i = 96; i != -32; i -= 32)
    std::vector<ARCoachingControlPoint>::insert((uint64_t)&self->_controlPoints, (char *)*p_controlPoints, (char *)&v30 + i);
  for (uint64_t j = 14; j != -2; j -= 2)
    std::vector<unsigned short>::insert((uint64_t)&self->_indices, (char *)self->_indices.__begin_, (char *)&v29 + j);
  p_patchData = (char **)&self->_patchData;
  for (uint64_t k = 1; k != -1; --k)
    std::vector<ARCoachingPatchData>::insert((uint64_t)p_patchData, *p_patchData, (char *)&v28[k]);
}

- (void)genRightCapWithWidth:(float)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  begin = self->_controlPoints.__begin_;
  p_controlPoints = &self->_controlPoints;
  unint64_t v7 = (unint64_t)(self->_controlPoints.__end_ - begin) >> 5;
  uint64_t v8 = 32 * (unsigned __int16)(v7 - 4);
  uint64_t v9 = 32 * (unsigned __int16)(v7 - 3);
  uint64_t v10 = 32 * (unsigned __int16)(v7 - 2);
  uint64_t v11 = 32 * (unsigned __int16)(v7 - 1);
  LODWORD(v3) = 1.0;
  +[ARCoachingSpline interpolate:*(double *)((char *)begin + v8) p1:*(double *)((char *)begin + v9) p2:*(double *)((char *)begin + v10) p3:*(double *)((char *)begin + v11) t:v3];
  float32x4_t v70 = v12;
  LODWORD(v13) = 1.0;
  +[ARCoachingSpline interpolateTangent:*(double *)((char *)p_controlPoints->__begin_ + v8) p1:*(double *)((char *)p_controlPoints->__begin_ + v9) p2:*(double *)((char *)p_controlPoints->__begin_ + v10) p3:*(double *)((char *)p_controlPoints->__begin_ + v11) t:v13];
  uint64_t v14 = 0;
  int32x4_t v16 = (int32x4_t)vmulq_f32(v15, v15);
  v16.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1))).u32[0];
  float32x2_t v17 = vrsqrte_f32((float32x2_t)v16.u32[0]);
  float32x2_t v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v17, v17)));
  _Q0 = vmulq_n_f32(vmulq_n_f32(v15, vmul_f32(v18, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v18, v18))).f32[0]), a3);
  float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x3F7FBE77u);
  float32x4_t v21 = vmlaq_f32(v70, v20, _Q0);
  v20.i32[0] = HIDWORD(p_controlPoints[3].__begin_);
  int v75 = (int)p_controlPoints[3].__begin_;
  float32x4_t v76 = vmlsq_lane_f32(v70, _Q0, *(float32x2_t *)v20.f32, 0);
  int v77 = v75;
  float32x4_t v78 = v21;
  int v79 = v75;
  float32x4_t v80 = vmlaq_f32(v21, (float32x4_t)vdupq_n_s32(0x3C23D70Au), _Q0);
  int v81 = 0;
  int16x8_t v73 = (int16x8_t)xmmword_20B232260;
  float32x4_t v74 = v76;
  uint64_t v22 = (unsigned __int16 **)&p_controlPoints[2];
  int16x8_t v73 = vaddq_s16(vdupq_n_s16(*((unsigned __int16 *)p_controlPoints[2].__end_ - 1) + 1), (int16x8_t)xmmword_20B232260);
  __asm { FMOV            V0.2S, #1.0 }
  v72[0] = _Q0.i64[0];
  v72[1] = _Q0.i64[0];
  p_end_cap = &p_controlPoints->__end_cap_;
  end = p_controlPoints->__end_;
  do
  {
    long long v29 = (_OWORD *)&v74.f32[8 * v14];
    if (end >= p_end_cap->__value_)
    {
      uint64_t v31 = (end - p_controlPoints->__begin_) >> 5;
      if ((unint64_t)(v31 + 1) >> 59) {
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      }
      uint64_t v32 = p_end_cap->__value_ - p_controlPoints->__begin_;
      uint64_t v33 = v32 >> 4;
      if (v32 >> 4 <= (unint64_t)(v31 + 1)) {
        uint64_t v33 = v31 + 1;
      }
      if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v34 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v34 = v33;
      }
      if (v34) {
        float v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)&p_controlPoints->__end_cap_, v34);
      }
      else {
        float v35 = 0;
      }
      float32x4_t v36 = &v35[32 * v31];
      long long v37 = v29[1];
      *(_OWORD *)float32x4_t v36 = *v29;
      *((_OWORD *)v36 + 1) = v37;
      float32x4_t v39 = self->_controlPoints.__begin_;
      uint64_t v38 = self->_controlPoints.__end_;
      objc_super v40 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v36;
      if (v38 != v39)
      {
        do
        {
          long long v41 = *((_OWORD *)v38 - 1);
          *((_OWORD *)v40 - 2) = *((_OWORD *)v38 - 2);
          *((_OWORD *)v40 - 1) = v41;
          objc_super v40 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v40 - 32);
          uint64_t v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 - 32);
        }
        while (v38 != v39);
        uint64_t v38 = p_controlPoints->__begin_;
      }
      end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v36 + 32);
      self->_controlPoints.__begin_ = v40;
      self->_controlPoints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v36 + 32);
      self->_controlPoints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v35[32 * v34];
      if (v38) {
        operator delete(v38);
      }
    }
    else
    {
      long long v30 = v29[1];
      *(_OWORD *)end = *v29;
      *((_OWORD *)end + 1) = v30;
      end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 32);
    }
    self->_controlPoints.__end_ = end;
    ++v14;
  }
  while (v14 != 4);
  uint64_t v42 = 0;
  v43 = &self->_indices.__end_cap_;
  v44 = self->_indices.__end_;
  do
  {
    if (v44 >= v43->__value_)
    {
      v46 = *v22;
      uint64_t v47 = (char *)v44 - (char *)*v22;
      if (v47 <= -3) {
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      }
      uint64_t v48 = v47 >> 1;
      unint64_t v49 = (char *)v43->__value_ - (char *)v46;
      if (v49 <= (v47 >> 1) + 1) {
        uint64_t v50 = v48 + 1;
      }
      else {
        uint64_t v50 = (char *)v43->__value_ - (char *)v46;
      }
      if (v49 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v51 = v50;
      }
      if (v51)
      {
        v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v51);
        v46 = self->_indices.__begin_;
        v44 = self->_indices.__end_;
      }
      else
      {
        v52 = 0;
      }
      v53 = (unsigned __int16 *)&v52[2 * v48];
      unsigned __int16 *v53 = v73.u16[v42];
      v45 = v53 + 1;
      while (v44 != v46)
      {
        unsigned __int16 v54 = *--v44;
        *--v53 = v54;
      }
      self->_indices.__begin_ = v53;
      self->_indices.__end_ = v45;
      self->_indices.__end_cap_.__value_ = (unsigned __int16 *)&v52[2 * v51];
      if (v46) {
        operator delete(v46);
      }
    }
    else
    {
      unsigned __int16 *v44 = v73.u16[v42];
      v45 = v44 + 1;
    }
    self->_indices.__end_ = v45;
    ++v42;
    v44 = v45;
  }
  while (v42 != 8);
  uint64_t v55 = 0;
  p_patchData = &self->_patchData;
  v57 = &self->_patchData.__end_cap_;
  v58 = self->_patchData.__end_;
  char v59 = 1;
  do
  {
    char v60 = v59;
    if (v58 >= v57->__value_)
    {
      uint64_t v61 = (v58 - p_patchData->__begin_) >> 3;
      if ((unint64_t)(v61 + 1) >> 61) {
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      }
      uint64_t v62 = v57->__value_ - p_patchData->__begin_;
      uint64_t v63 = v62 >> 2;
      if (v62 >> 2 <= (unint64_t)(v61 + 1)) {
        uint64_t v63 = v61 + 1;
      }
      if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v64 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v64 = v63;
      }
      if (v64) {
        v65 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_patchData.__end_cap_, v64);
      }
      else {
        v65 = 0;
      }
      v66 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v65[8 * v61];
      *(void *)v66 = v72[v55];
      v58 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v66 + 8);
      v68 = self->_patchData.__begin_;
      v67 = self->_patchData.__end_;
      if (v67 != v68)
      {
        do
        {
          uint64_t v69 = *((void *)v67 - 1);
          v67 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v67 - 8);
          *((void *)v66 - 1) = v69;
          v66 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v66 - 8);
        }
        while (v67 != v68);
        v67 = p_patchData->__begin_;
      }
      self->_patchData.__begin_ = v66;
      self->_patchData.__end_ = v58;
      self->_patchData.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v65[8 * v64];
      if (v67) {
        operator delete(v67);
      }
    }
    else
    {
      *(void *)v58 = v72[v55];
      v58 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v58 + 8);
    }
    char v59 = 0;
    self->_patchData.__end_ = v58;
    uint64_t v55 = 1;
  }
  while ((v60 & 1) != 0);
}

- (void)genTubeIndicesWithPattern:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        int64_t v4 = self->_controlPoints.__end_ - self->_controlPoints.__begin_;
        if (v4)
        {
          unint64_t v5 = 0;
          unsigned __int16 v6 = 0;
          unint64_t v7 = v4 >> 5;
          p_indices = &self->_indices;
          p_end_cap = &self->_indices.__end_cap_;
          p_patchData = &self->_patchData;
          v309 = &self->_patchData.__end_cap_;
          do
          {
            unsigned __int16 v11 = v5 % (v7 - 1);
            end = self->_indices.__end_;
            value = self->_indices.__end_cap_.__value_;
            if (end >= value)
            {
              begin = p_indices->__begin_;
              uint64_t v16 = (char *)end - (char *)p_indices->__begin_;
              if (v16 <= -3) {
                goto LABEL_439;
              }
              uint64_t v17 = v16 >> 1;
              unint64_t v18 = (char *)value - (char *)begin;
              if (v18 <= (v16 >> 1) + 1) {
                unint64_t v19 = v17 + 1;
              }
              else {
                unint64_t v19 = v18;
              }
              if (v18 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v20 = v19;
              }
              if (v20)
              {
                float32x4_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v20);
                begin = self->_indices.__begin_;
                end = self->_indices.__end_;
              }
              else
              {
                float32x4_t v21 = 0;
              }
              uint64_t v22 = (unsigned __int16 *)&v21[2 * v17];
              *uint64_t v22 = v11;
              uint64_t v14 = v22 + 1;
              while (end != begin)
              {
                unsigned __int16 v23 = *--end;
                *--uint64_t v22 = v23;
              }
              value = (unsigned __int16 *)&v21[2 * v20];
              self->_indices.__begin_ = v22;
              self->_indices.__end_ = v14;
              self->_indices.__end_cap_.__value_ = value;
              if (begin)
              {
                operator delete(begin);
                value = p_end_cap->__value_;
              }
            }
            else
            {
              unsigned __int16 *end = v11;
              uint64_t v14 = end + 1;
            }
            self->_indices.__end_ = v14;
            unsigned __int16 v24 = (v6 + 1)
                % (unint64_t)(((self->_controlPoints.__end_ - self->_controlPoints.__begin_) >> 5) - 1);
            if (v14 >= value)
            {
              float32x4_t v26 = p_indices->__begin_;
              uint64_t v27 = (char *)v14 - (char *)p_indices->__begin_;
              if (v27 <= -3) {
                goto LABEL_439;
              }
              uint64_t v28 = v27 >> 1;
              unint64_t v29 = (char *)value - (char *)v26;
              if (v29 <= (v27 >> 1) + 1) {
                unint64_t v30 = v28 + 1;
              }
              else {
                unint64_t v30 = v29;
              }
              if (v29 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v31 = v30;
              }
              if (v31)
              {
                uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v31);
                float32x4_t v26 = self->_indices.__begin_;
                uint64_t v14 = self->_indices.__end_;
              }
              else
              {
                uint64_t v32 = 0;
              }
              uint64_t v33 = (unsigned __int16 *)&v32[2 * v28];
              *uint64_t v33 = v24;
              unint64_t v25 = v33 + 1;
              while (v14 != v26)
              {
                unsigned __int16 v34 = *--v14;
                *--uint64_t v33 = v34;
              }
              value = (unsigned __int16 *)&v32[2 * v31];
              self->_indices.__begin_ = v33;
              self->_indices.__end_ = v25;
              self->_indices.__end_cap_.__value_ = value;
              if (v26)
              {
                operator delete(v26);
                value = p_end_cap->__value_;
              }
            }
            else
            {
              unsigned __int16 *v14 = v24;
              unint64_t v25 = v14 + 1;
            }
            self->_indices.__end_ = v25;
            unsigned __int16 v35 = (v6 + 2)
                % (unint64_t)(((self->_controlPoints.__end_ - self->_controlPoints.__begin_) >> 5) - 1);
            if (v25 >= value)
            {
              long long v37 = p_indices->__begin_;
              uint64_t v38 = (char *)v25 - (char *)p_indices->__begin_;
              if (v38 <= -3) {
                goto LABEL_439;
              }
              uint64_t v39 = v38 >> 1;
              unint64_t v40 = (char *)value - (char *)v37;
              if (v40 <= (v38 >> 1) + 1) {
                unint64_t v41 = v39 + 1;
              }
              else {
                unint64_t v41 = v40;
              }
              if (v40 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v42 = v41;
              }
              if (v42)
              {
                v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v42);
                long long v37 = self->_indices.__begin_;
                unint64_t v25 = self->_indices.__end_;
              }
              else
              {
                v43 = 0;
              }
              v44 = (unsigned __int16 *)&v43[2 * v39];
              unsigned __int16 *v44 = v35;
              float32x4_t v36 = v44 + 1;
              while (v25 != v37)
              {
                unsigned __int16 v45 = *--v25;
                *--v44 = v45;
              }
              value = (unsigned __int16 *)&v43[2 * v42];
              self->_indices.__begin_ = v44;
              self->_indices.__end_ = v36;
              self->_indices.__end_cap_.__value_ = value;
              if (v37)
              {
                operator delete(v37);
                value = p_end_cap->__value_;
              }
            }
            else
            {
              *unint64_t v25 = v35;
              float32x4_t v36 = v25 + 1;
            }
            self->_indices.__end_ = v36;
            unsigned __int16 v46 = (v6 + 3)
                % (unint64_t)(((self->_controlPoints.__end_ - self->_controlPoints.__begin_) >> 5) - 1);
            if (v36 >= value)
            {
              uint64_t v48 = p_indices->__begin_;
              uint64_t v49 = (char *)v36 - (char *)p_indices->__begin_;
              if (v49 <= -3) {
                goto LABEL_439;
              }
              uint64_t v50 = v49 >> 1;
              unint64_t v51 = (char *)value - (char *)v48;
              if (v51 <= (v49 >> 1) + 1) {
                unint64_t v52 = v50 + 1;
              }
              else {
                unint64_t v52 = v51;
              }
              if (v51 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v53 = v52;
              }
              if (v53)
              {
                unsigned __int16 v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v53);
                uint64_t v48 = self->_indices.__begin_;
                float32x4_t v36 = self->_indices.__end_;
              }
              else
              {
                unsigned __int16 v54 = 0;
              }
              uint64_t v55 = (unsigned __int16 *)&v54[2 * v50];
              *uint64_t v55 = v46;
              uint64_t v47 = v55 + 1;
              while (v36 != v48)
              {
                unsigned __int16 v56 = *--v36;
                *--uint64_t v55 = v56;
              }
              self->_indices.__begin_ = v55;
              self->_indices.__end_ = v47;
              self->_indices.__end_cap_.__value_ = (unsigned __int16 *)&v54[2 * v53];
              if (v48) {
                operator delete(v48);
              }
            }
            else
            {
              *float32x4_t v36 = v46;
              uint64_t v47 = v36 + 1;
            }
            self->_indices.__end_ = v47;
            v58 = self->_patchData.__end_;
            v57 = self->_patchData.__end_cap_.__value_;
            if (v58 >= v57)
            {
              uint64_t v60 = (v58 - p_patchData->__begin_) >> 3;
              if ((unint64_t)(v60 + 1) >> 61) {
                _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
              }
              uint64_t v61 = v57 - p_patchData->__begin_;
              uint64_t v62 = v61 >> 2;
              if (v61 >> 2 <= (unint64_t)(v60 + 1)) {
                uint64_t v62 = v60 + 1;
              }
              if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v63 = v62;
              }
              if (v63) {
                unint64_t v64 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)v309, v63);
              }
              else {
                unint64_t v64 = 0;
              }
              v65 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v64[8 * v60];
              *(void *)v65 = 0x3F8000003F800000;
              char v59 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v65 + 8);
              v67 = self->_patchData.__begin_;
              v66 = self->_patchData.__end_;
              if (v66 != v67)
              {
                do
                {
                  uint64_t v68 = *((void *)v66 - 1);
                  v66 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v66 - 8);
                  *((void *)v65 - 1) = v68;
                  v65 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v65 - 8);
                }
                while (v66 != v67);
                v66 = p_patchData->__begin_;
              }
              self->_patchData.__begin_ = v65;
              self->_patchData.__end_ = v59;
              self->_patchData.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v64[8 * v63];
              if (v66) {
                operator delete(v66);
              }
            }
            else
            {
              *(void *)v58 = 0x3F8000003F800000;
              char v59 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v58 + 8);
            }
            self->_patchData.__end_ = v59;
            unint64_t v5 = ++v6;
            unint64_t v7 = (self->_controlPoints.__end_ - self->_controlPoints.__begin_) >> 5;
          }
          while (v7 > v6);
        }
      }
      return;
    }
    v130 = &self->_indices.__end_cap_;
    v129 = self->_indices.__end_cap_.__value_;
    v131 = &self->_indices;
    v132 = self->_indices.__end_;
    if (v132 >= v129)
    {
      v134 = v131->__begin_;
      uint64_t v135 = (char *)v132 - (char *)v131->__begin_;
      if (v135 <= -3) {
        goto LABEL_439;
      }
      uint64_t v136 = v135 >> 1;
      unint64_t v137 = (char *)v129 - (char *)v134;
      if (v137 <= (v135 >> 1) + 1) {
        unint64_t v138 = v136 + 1;
      }
      else {
        unint64_t v138 = v137;
      }
      if (v137 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v139 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v139 = v138;
      }
      if (v139)
      {
        v140 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v139);
        v134 = self->_indices.__begin_;
        v132 = self->_indices.__end_;
      }
      else
      {
        v140 = 0;
      }
      v141 = (unsigned __int16 *)&v140[2 * v136];
      v129 = (unsigned __int16 *)&v140[2 * v139];
      unsigned __int16 *v141 = 0;
      v133 = v141 + 1;
      while (v132 != v134)
      {
        unsigned __int16 v142 = *--v132;
        *--v141 = v142;
      }
      self->_indices.__begin_ = v141;
      self->_indices.__end_ = v133;
      self->_indices.__end_cap_.__value_ = v129;
      if (v134)
      {
        operator delete(v134);
        v129 = v130->__value_;
      }
    }
    else
    {
      unsigned __int16 *v132 = 0;
      v133 = v132 + 1;
    }
    self->_indices.__end_ = v133;
    if (v133 >= v129)
    {
      v144 = v131->__begin_;
      uint64_t v145 = (char *)v133 - (char *)v131->__begin_;
      if (v145 <= -3) {
        goto LABEL_439;
      }
      uint64_t v146 = v145 >> 1;
      unint64_t v147 = (char *)v129 - (char *)v144;
      if (v147 <= (v145 >> 1) + 1) {
        unint64_t v148 = v146 + 1;
      }
      else {
        unint64_t v148 = v147;
      }
      if (v147 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v149 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v149 = v148;
      }
      if (v149)
      {
        v150 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v149);
        v144 = self->_indices.__begin_;
        v133 = self->_indices.__end_;
      }
      else
      {
        v150 = 0;
      }
      v151 = (unsigned __int16 *)&v150[2 * v146];
      v129 = (unsigned __int16 *)&v150[2 * v149];
      unsigned __int16 *v151 = 1;
      v143 = v151 + 1;
      while (v133 != v144)
      {
        unsigned __int16 v152 = *--v133;
        *--v151 = v152;
      }
      self->_indices.__begin_ = v151;
      self->_indices.__end_ = v143;
      self->_indices.__end_cap_.__value_ = v129;
      if (v144)
      {
        operator delete(v144);
        v129 = v130->__value_;
      }
    }
    else
    {
      unsigned __int16 *v133 = 1;
      v143 = v133 + 1;
    }
    self->_indices.__end_ = v143;
    if (v143 >= v129)
    {
      v154 = v131->__begin_;
      uint64_t v155 = (char *)v143 - (char *)v131->__begin_;
      if (v155 <= -3) {
        goto LABEL_439;
      }
      uint64_t v156 = v155 >> 1;
      unint64_t v157 = (char *)v129 - (char *)v154;
      if (v157 <= (v155 >> 1) + 1) {
        unint64_t v158 = v156 + 1;
      }
      else {
        unint64_t v158 = v157;
      }
      if (v157 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v159 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v159 = v158;
      }
      if (v159)
      {
        v160 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v159);
        v154 = self->_indices.__begin_;
        v143 = self->_indices.__end_;
      }
      else
      {
        v160 = 0;
      }
      v161 = (unsigned __int16 *)&v160[2 * v156];
      v129 = (unsigned __int16 *)&v160[2 * v159];
      unsigned __int16 *v161 = 2;
      v153 = v161 + 1;
      while (v143 != v154)
      {
        unsigned __int16 v162 = *--v143;
        *--v161 = v162;
      }
      self->_indices.__begin_ = v161;
      self->_indices.__end_ = v153;
      self->_indices.__end_cap_.__value_ = v129;
      if (v154)
      {
        operator delete(v154);
        v129 = v130->__value_;
      }
    }
    else
    {
      unsigned __int16 *v143 = 2;
      v153 = v143 + 1;
    }
    self->_indices.__end_ = v153;
    if (v153 >= v129)
    {
      v164 = v131->__begin_;
      uint64_t v165 = (char *)v153 - (char *)v131->__begin_;
      if (v165 <= -3) {
        goto LABEL_439;
      }
      uint64_t v166 = v165 >> 1;
      unint64_t v167 = (char *)v129 - (char *)v164;
      if (v167 <= (v165 >> 1) + 1) {
        unint64_t v168 = v166 + 1;
      }
      else {
        unint64_t v168 = v167;
      }
      if (v167 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v169 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v169 = v168;
      }
      if (v169)
      {
        v170 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v169);
        v164 = self->_indices.__begin_;
        v153 = self->_indices.__end_;
      }
      else
      {
        v170 = 0;
      }
      v171 = (unsigned __int16 *)&v170[2 * v166];
      v172 = (unsigned __int16 *)&v170[2 * v169];
      unsigned __int16 *v171 = 3;
      v163 = v171 + 1;
      while (v153 != v164)
      {
        unsigned __int16 v173 = *--v153;
        *--v171 = v173;
      }
      self->_indices.__begin_ = v171;
      self->_indices.__end_ = v163;
      self->_indices.__end_cap_.__value_ = v172;
      if (v164) {
        operator delete(v164);
      }
    }
    else
    {
      unsigned __int16 *v153 = 3;
      v163 = v153 + 1;
    }
    v174 = self->_patchData.__end_cap_.__value_;
    self->_indices.__end_ = v163;
    v175 = &self->_patchData;
    v308 = &self->_patchData.__end_cap_;
    v176 = self->_patchData.__end_;
    if (v176 >= v174)
    {
      uint64_t v178 = (v176 - v175->__begin_) >> 3;
      if ((unint64_t)(v178 + 1) >> 61) {
        goto LABEL_442;
      }
      uint64_t v179 = v174 - v175->__begin_;
      uint64_t v180 = v179 >> 2;
      if (v179 >> 2 <= (unint64_t)(v178 + 1)) {
        uint64_t v180 = v178 + 1;
      }
      if ((unint64_t)v179 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v181 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v181 = v180;
      }
      if (v181) {
        v182 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)v308, v181);
      }
      else {
        v182 = 0;
      }
      v183 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v182[8 * v178];
      v184 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v182[8 * v181];
      *(void *)v183 = 0x3F8000003F800000;
      v177 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v183 + 8);
      v186 = self->_patchData.__begin_;
      v185 = self->_patchData.__end_;
      if (v185 != v186)
      {
        do
        {
          uint64_t v187 = *((void *)v185 - 1);
          v185 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v185 - 8);
          *((void *)v183 - 1) = v187;
          v183 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v183 - 8);
        }
        while (v185 != v186);
        v185 = v175->__begin_;
      }
      self->_patchData.__begin_ = v183;
      self->_patchData.__end_ = v177;
      self->_patchData.__end_cap_.__value_ = v184;
      if (v185) {
        operator delete(v185);
      }
    }
    else
    {
      *(void *)v176 = 0x3F8000003F800000;
      v177 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v176 + 8);
    }
    self->_patchData.__end_ = v177;
    if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->_controlPoints.__end_ - self->_controlPoints.__begin_) == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)96)
    {
      LOWORD(v188) = 3;
    }
    else
    {
      v311 = &self->_patchData;
      unsigned __int16 v189 = 0;
      do
      {
        unsigned __int16 v190 = v189;
        v192 = self->_indices.__end_;
        v191 = self->_indices.__end_cap_.__value_;
        if (v192 >= v191)
        {
          v194 = v131->__begin_;
          uint64_t v195 = (char *)v192 - (char *)v131->__begin_;
          if (v195 <= -3) {
            goto LABEL_439;
          }
          uint64_t v196 = v195 >> 1;
          unint64_t v197 = (char *)v191 - (char *)v194;
          if (v197 <= (v195 >> 1) + 1) {
            unint64_t v198 = v196 + 1;
          }
          else {
            unint64_t v198 = v197;
          }
          if (v197 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v199 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v199 = v198;
          }
          if (v199)
          {
            v200 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v199);
            v194 = self->_indices.__begin_;
            v192 = self->_indices.__end_;
          }
          else
          {
            v200 = 0;
          }
          v201 = (unsigned __int16 *)&v200[2 * v196];
          unsigned __int16 *v201 = v189;
          v193 = v201 + 1;
          while (v192 != v194)
          {
            unsigned __int16 v202 = *--v192;
            *--v201 = v202;
          }
          v191 = (unsigned __int16 *)&v200[2 * v199];
          self->_indices.__begin_ = v201;
          self->_indices.__end_ = v193;
          self->_indices.__end_cap_.__value_ = v191;
          if (v194)
          {
            operator delete(v194);
            v191 = v130->__value_;
          }
        }
        else
        {
          unsigned __int16 *v192 = v189;
          v193 = v192 + 1;
        }
        self->_indices.__end_ = v193;
        ++v189;
        if (v193 >= v191)
        {
          v204 = v131->__begin_;
          uint64_t v205 = (char *)v193 - (char *)v131->__begin_;
          if (v205 <= -3) {
            goto LABEL_439;
          }
          uint64_t v206 = v205 >> 1;
          unint64_t v207 = (char *)v191 - (char *)v204;
          if (v207 <= (v205 >> 1) + 1) {
            unint64_t v208 = v206 + 1;
          }
          else {
            unint64_t v208 = v207;
          }
          if (v207 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v209 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v209 = v208;
          }
          if (v209)
          {
            v210 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v209);
            v204 = self->_indices.__begin_;
            v193 = self->_indices.__end_;
          }
          else
          {
            v210 = 0;
          }
          v211 = (unsigned __int16 *)&v210[2 * v206];
          unsigned __int16 *v211 = v189;
          v203 = v211 + 1;
          while (v193 != v204)
          {
            unsigned __int16 v212 = *--v193;
            *--v211 = v212;
          }
          v191 = (unsigned __int16 *)&v210[2 * v209];
          self->_indices.__begin_ = v211;
          self->_indices.__end_ = v203;
          self->_indices.__end_cap_.__value_ = v191;
          if (v204)
          {
            operator delete(v204);
            v191 = v130->__value_;
          }
        }
        else
        {
          unsigned __int16 *v193 = v189;
          v203 = v193 + 1;
        }
        self->_indices.__end_ = v203;
        unsigned __int16 v213 = v190 + 2;
        if (v203 >= v191)
        {
          v215 = v131->__begin_;
          uint64_t v216 = (char *)v203 - (char *)v131->__begin_;
          if (v216 <= -3) {
            goto LABEL_439;
          }
          uint64_t v217 = v216 >> 1;
          unint64_t v218 = (char *)v191 - (char *)v215;
          if (v218 <= (v216 >> 1) + 1) {
            unint64_t v219 = v217 + 1;
          }
          else {
            unint64_t v219 = v218;
          }
          if (v218 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v220 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v220 = v219;
          }
          if (v220)
          {
            v221 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v220);
            v215 = self->_indices.__begin_;
            v203 = self->_indices.__end_;
          }
          else
          {
            v221 = 0;
          }
          v222 = (unsigned __int16 *)&v221[2 * v217];
          unsigned __int16 *v222 = v213;
          v214 = v222 + 1;
          while (v203 != v215)
          {
            unsigned __int16 v223 = *--v203;
            *--v222 = v223;
          }
          v191 = (unsigned __int16 *)&v221[2 * v220];
          self->_indices.__begin_ = v222;
          self->_indices.__end_ = v214;
          self->_indices.__end_cap_.__value_ = v191;
          if (v215)
          {
            operator delete(v215);
            v191 = v130->__value_;
          }
        }
        else
        {
          unsigned __int16 *v203 = v213;
          v214 = v203 + 1;
        }
        self->_indices.__end_ = v214;
        unsigned __int16 v224 = v190 + 3;
        if (v214 >= v191)
        {
          v226 = v131->__begin_;
          uint64_t v227 = (char *)v214 - (char *)v131->__begin_;
          if (v227 <= -3) {
            goto LABEL_439;
          }
          uint64_t v228 = v227 >> 1;
          unint64_t v229 = (char *)v191 - (char *)v226;
          if (v229 <= (v227 >> 1) + 1) {
            unint64_t v230 = v228 + 1;
          }
          else {
            unint64_t v230 = v229;
          }
          if (v229 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v231 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v231 = v230;
          }
          if (v231)
          {
            v232 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v231);
            v226 = self->_indices.__begin_;
            v214 = self->_indices.__end_;
          }
          else
          {
            v232 = 0;
          }
          v233 = (unsigned __int16 *)&v232[2 * v228];
          unsigned __int16 *v233 = v224;
          v225 = v233 + 1;
          while (v214 != v226)
          {
            unsigned __int16 v234 = *--v214;
            *--v233 = v234;
          }
          self->_indices.__begin_ = v233;
          self->_indices.__end_ = v225;
          self->_indices.__end_cap_.__value_ = (unsigned __int16 *)&v232[2 * v231];
          if (v226) {
            operator delete(v226);
          }
        }
        else
        {
          unsigned __int16 *v214 = v224;
          v225 = v214 + 1;
        }
        self->_indices.__end_ = v225;
        v236 = self->_patchData.__end_;
        v235 = self->_patchData.__end_cap_.__value_;
        if (v236 >= v235)
        {
          uint64_t v238 = (v236 - v311->__begin_) >> 3;
          if ((unint64_t)(v238 + 1) >> 61) {
            goto LABEL_440;
          }
          uint64_t v239 = v235 - v311->__begin_;
          uint64_t v240 = v239 >> 2;
          if (v239 >> 2 <= (unint64_t)(v238 + 1)) {
            uint64_t v240 = v238 + 1;
          }
          if ((unint64_t)v239 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v241 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v241 = v240;
          }
          if (v241) {
            v242 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)v308, v241);
          }
          else {
            v242 = 0;
          }
          v243 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v242[8 * v238];
          *(void *)v243 = 0x3F8000003F800000;
          v237 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v243 + 8);
          v245 = self->_patchData.__begin_;
          v244 = self->_patchData.__end_;
          if (v244 != v245)
          {
            do
            {
              uint64_t v246 = *((void *)v244 - 1);
              v244 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v244 - 8);
              *((void *)v243 - 1) = v246;
              v243 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v243 - 8);
            }
            while (v244 != v245);
            v244 = v311->__begin_;
          }
          self->_patchData.__begin_ = v243;
          self->_patchData.__end_ = v237;
          self->_patchData.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v242[8 * v241];
          if (v244) {
            operator delete(v244);
          }
        }
        else
        {
          *(void *)v236 = 0x3F8000003F800000;
          v237 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v236 + 8);
        }
        self->_patchData.__end_ = v237;
        int64_t v188 = (self->_controlPoints.__end_ - self->_controlPoints.__begin_) >> 5;
      }
      while (v188 - 3 > (unint64_t)v189);
      v175 = &self->_patchData;
    }
    unsigned __int16 v247 = v188 - 3;
    v249 = self->_indices.__end_;
    v248 = self->_indices.__end_cap_.__value_;
    if (v249 >= v248)
    {
      v251 = v131->__begin_;
      uint64_t v252 = (char *)v249 - (char *)v131->__begin_;
      if (v252 <= -3) {
        goto LABEL_439;
      }
      uint64_t v253 = v252 >> 1;
      unint64_t v254 = (char *)v248 - (char *)v251;
      if (v254 <= (v252 >> 1) + 1) {
        unint64_t v255 = v253 + 1;
      }
      else {
        unint64_t v255 = v254;
      }
      if (v254 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v256 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v256 = v255;
      }
      if (v256)
      {
        v257 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v256);
        v251 = self->_indices.__begin_;
        v249 = self->_indices.__end_;
      }
      else
      {
        v257 = 0;
      }
      v258 = (unsigned __int16 *)&v257[2 * v253];
      v248 = (unsigned __int16 *)&v257[2 * v256];
      unsigned __int16 *v258 = v247;
      v250 = v258 + 1;
      while (v249 != v251)
      {
        unsigned __int16 v259 = *--v249;
        *--v258 = v259;
      }
      self->_indices.__begin_ = v258;
      self->_indices.__end_ = v250;
      self->_indices.__end_cap_.__value_ = v248;
      if (v251)
      {
        operator delete(v251);
        v248 = v130->__value_;
      }
    }
    else
    {
      unsigned __int16 *v249 = v247;
      v250 = v249 + 1;
    }
    self->_indices.__end_ = v250;
    unsigned int v260 = ((LODWORD(self->_controlPoints.__end_) - LODWORD(self->_controlPoints.__begin_)) >> 5) - 2;
    if (v250 >= v248)
    {
      v262 = v131->__begin_;
      uint64_t v263 = (char *)v250 - (char *)v131->__begin_;
      if (v263 <= -3) {
        goto LABEL_439;
      }
      uint64_t v264 = v263 >> 1;
      unint64_t v265 = (char *)v248 - (char *)v262;
      if (v265 <= (v263 >> 1) + 1) {
        unint64_t v266 = v264 + 1;
      }
      else {
        unint64_t v266 = v265;
      }
      if (v265 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v267 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v267 = v266;
      }
      if (v267)
      {
        v268 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v267);
        v262 = self->_indices.__begin_;
        v250 = self->_indices.__end_;
      }
      else
      {
        v268 = 0;
      }
      v269 = (unsigned __int16 *)&v268[2 * v264];
      v248 = (unsigned __int16 *)&v268[2 * v267];
      unsigned __int16 *v269 = v260;
      v261 = v269 + 1;
      while (v250 != v262)
      {
        unsigned __int16 v270 = *--v250;
        *--v269 = v270;
      }
      self->_indices.__begin_ = v269;
      self->_indices.__end_ = v261;
      self->_indices.__end_cap_.__value_ = v248;
      if (v262)
      {
        operator delete(v262);
        v248 = v130->__value_;
      }
    }
    else
    {
      unsigned __int16 *v250 = v260;
      v261 = v250 + 1;
    }
    self->_indices.__end_ = v261;
    unsigned int v271 = ((LODWORD(self->_controlPoints.__end_) - LODWORD(self->_controlPoints.__begin_)) >> 5) - 1;
    if (v261 >= v248)
    {
      v273 = v131->__begin_;
      uint64_t v274 = (char *)v261 - (char *)v131->__begin_;
      if (v274 <= -3) {
        goto LABEL_439;
      }
      uint64_t v275 = v274 >> 1;
      unint64_t v276 = (char *)v248 - (char *)v273;
      if (v276 <= (v274 >> 1) + 1) {
        unint64_t v277 = v275 + 1;
      }
      else {
        unint64_t v277 = v276;
      }
      if (v276 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v278 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v278 = v277;
      }
      if (v278)
      {
        v279 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v278);
        v273 = self->_indices.__begin_;
        v261 = self->_indices.__end_;
      }
      else
      {
        v279 = 0;
      }
      v280 = (unsigned __int16 *)&v279[2 * v275];
      v248 = (unsigned __int16 *)&v279[2 * v278];
      unsigned __int16 *v280 = v271;
      v272 = v280 + 1;
      while (v261 != v273)
      {
        unsigned __int16 v281 = *--v261;
        *--v280 = v281;
      }
      self->_indices.__begin_ = v280;
      self->_indices.__end_ = v272;
      self->_indices.__end_cap_.__value_ = v248;
      if (v273)
      {
        operator delete(v273);
        v248 = v130->__value_;
      }
    }
    else
    {
      unsigned __int16 *v261 = v271;
      v272 = v261 + 1;
    }
    self->_indices.__end_ = v272;
    unsigned int v282 = ((LODWORD(self->_controlPoints.__end_) - LODWORD(self->_controlPoints.__begin_)) >> 5) - 1;
    if (v272 < v248)
    {
      unsigned __int16 *v272 = v282;
      v283 = v272 + 1;
LABEL_421:
      self->_indices.__end_ = v283;
      v295 = self->_patchData.__end_;
      v294 = self->_patchData.__end_cap_.__value_;
      if (v295 < v294)
      {
        *(void *)v295 = 0x3F8000003F800000;
        v296 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v295 + 8);
LABEL_437:
        self->_patchData.__end_ = v296;
        return;
      }
      uint64_t v297 = (v295 - v175->__begin_) >> 3;
      if (!((unint64_t)(v297 + 1) >> 61))
      {
        uint64_t v298 = v294 - v175->__begin_;
        uint64_t v299 = v298 >> 2;
        if (v298 >> 2 <= (unint64_t)(v297 + 1)) {
          uint64_t v299 = v297 + 1;
        }
        if ((unint64_t)v298 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v300 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v300 = v299;
        }
        if (v300) {
          v301 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)v308, v300);
        }
        else {
          v301 = 0;
        }
        v302 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v301[8 * v297];
        v303 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v301[8 * v300];
        *(void *)v302 = 0x3F8000003F800000;
        v296 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v302 + 8);
        v305 = self->_patchData.__begin_;
        v304 = self->_patchData.__end_;
        if (v304 != v305)
        {
          do
          {
            uint64_t v306 = *((void *)v304 - 1);
            v304 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v304 - 8);
            *((void *)v302 - 1) = v306;
            v302 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v302 - 8);
          }
          while (v304 != v305);
          v304 = v175->__begin_;
        }
        self->_patchData.__begin_ = v302;
        self->_patchData.__end_ = v296;
        self->_patchData.__end_cap_.__value_ = v303;
        if (v304) {
          operator delete(v304);
        }
        goto LABEL_437;
      }
LABEL_442:
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    v284 = v131->__begin_;
    uint64_t v285 = (char *)v272 - (char *)v131->__begin_;
    if (v285 > -3)
    {
      uint64_t v286 = v285 >> 1;
      unint64_t v287 = (char *)v248 - (char *)v284;
      if (v287 <= (v285 >> 1) + 1) {
        unint64_t v288 = v286 + 1;
      }
      else {
        unint64_t v288 = v287;
      }
      if (v287 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v289 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v289 = v288;
      }
      if (v289)
      {
        v290 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v289);
        v284 = self->_indices.__begin_;
        v272 = self->_indices.__end_;
      }
      else
      {
        v290 = 0;
      }
      v291 = (unsigned __int16 *)&v290[2 * v286];
      v292 = (unsigned __int16 *)&v290[2 * v289];
      unsigned __int16 *v291 = v282;
      v283 = v291 + 1;
      while (v272 != v284)
      {
        unsigned __int16 v293 = *--v272;
        *--v291 = v293;
      }
      self->_indices.__begin_ = v291;
      self->_indices.__end_ = v283;
      self->_indices.__end_cap_.__value_ = v292;
      if (v284) {
        operator delete(v284);
      }
      goto LABEL_421;
    }
LABEL_439:
    _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
  }
  if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->_controlPoints.__end_ - self->_controlPoints.__begin_) != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)96)
  {
    unsigned __int16 v69 = 0;
    float32x4_t v70 = &self->_indices;
    v71 = &self->_indices.__end_cap_;
    v307 = &self->_patchData.__end_cap_;
    v310 = &self->_patchData;
    do
    {
      unsigned __int16 v72 = v69;
      float32x4_t v74 = self->_indices.__end_;
      int16x8_t v73 = self->_indices.__end_cap_.__value_;
      if (v74 >= v73)
      {
        float32x4_t v76 = v70->__begin_;
        uint64_t v77 = (char *)v74 - (char *)v70->__begin_;
        if (v77 <= -3) {
          goto LABEL_439;
        }
        uint64_t v78 = v77 >> 1;
        unint64_t v79 = (char *)v73 - (char *)v76;
        if (v79 <= (v77 >> 1) + 1) {
          unint64_t v80 = v78 + 1;
        }
        else {
          unint64_t v80 = v79;
        }
        if (v79 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v81 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v81 = v80;
        }
        if (v81)
        {
          uint64_t v82 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v81);
          float32x4_t v76 = self->_indices.__begin_;
          float32x4_t v74 = self->_indices.__end_;
        }
        else
        {
          uint64_t v82 = 0;
        }
        v83 = (unsigned __int16 *)&v82[2 * v78];
        unsigned __int16 *v83 = v69;
        int v75 = v83 + 1;
        while (v74 != v76)
        {
          unsigned __int16 v84 = *--v74;
          *--v83 = v84;
        }
        int16x8_t v73 = (unsigned __int16 *)&v82[2 * v81];
        self->_indices.__begin_ = v83;
        self->_indices.__end_ = v75;
        self->_indices.__end_cap_.__value_ = v73;
        if (v76)
        {
          operator delete(v76);
          int16x8_t v73 = v71->__value_;
        }
      }
      else
      {
        *float32x4_t v74 = v69;
        int v75 = v74 + 1;
      }
      self->_indices.__end_ = v75;
      ++v69;
      if (v75 >= v73)
      {
        v86 = v70->__begin_;
        uint64_t v87 = (char *)v75 - (char *)v70->__begin_;
        if (v87 <= -3) {
          goto LABEL_439;
        }
        uint64_t v88 = v87 >> 1;
        unint64_t v89 = (char *)v73 - (char *)v86;
        if (v89 <= (v87 >> 1) + 1) {
          unint64_t v90 = v88 + 1;
        }
        else {
          unint64_t v90 = v89;
        }
        if (v89 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v91 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v91 = v90;
        }
        if (v91)
        {
          v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v91);
          v86 = self->_indices.__begin_;
          int v75 = self->_indices.__end_;
        }
        else
        {
          v92 = 0;
        }
        v93 = (unsigned __int16 *)&v92[2 * v88];
        unsigned __int16 *v93 = v69;
        v85 = v93 + 1;
        while (v75 != v86)
        {
          unsigned __int16 v94 = *--v75;
          *--v93 = v94;
        }
        int16x8_t v73 = (unsigned __int16 *)&v92[2 * v91];
        self->_indices.__begin_ = v93;
        self->_indices.__end_ = v85;
        self->_indices.__end_cap_.__value_ = v73;
        if (v86)
        {
          operator delete(v86);
          int16x8_t v73 = v71->__value_;
        }
      }
      else
      {
        *int v75 = v69;
        v85 = v75 + 1;
      }
      self->_indices.__end_ = v85;
      unsigned __int16 v95 = v72 + 2;
      if (v85 >= v73)
      {
        v97 = v70->__begin_;
        uint64_t v98 = (char *)v85 - (char *)v70->__begin_;
        if (v98 <= -3) {
          goto LABEL_439;
        }
        uint64_t v99 = v98 >> 1;
        unint64_t v100 = (char *)v73 - (char *)v97;
        if (v100 <= (v98 >> 1) + 1) {
          unint64_t v101 = v99 + 1;
        }
        else {
          unint64_t v101 = v100;
        }
        if (v100 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v102 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v102 = v101;
        }
        if (v102)
        {
          v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v102);
          v97 = self->_indices.__begin_;
          v85 = self->_indices.__end_;
        }
        else
        {
          v103 = 0;
        }
        v104 = (unsigned __int16 *)&v103[2 * v99];
        unsigned __int16 *v104 = v95;
        v96 = v104 + 1;
        while (v85 != v97)
        {
          unsigned __int16 v105 = *--v85;
          *--v104 = v105;
        }
        int16x8_t v73 = (unsigned __int16 *)&v103[2 * v102];
        self->_indices.__begin_ = v104;
        self->_indices.__end_ = v96;
        self->_indices.__end_cap_.__value_ = v73;
        if (v97)
        {
          operator delete(v97);
          int16x8_t v73 = v71->__value_;
        }
      }
      else
      {
        unsigned __int16 *v85 = v95;
        v96 = v85 + 1;
      }
      self->_indices.__end_ = v96;
      unsigned __int16 v106 = v72 + 3;
      if (v96 >= v73)
      {
        v108 = v70->__begin_;
        uint64_t v109 = (char *)v96 - (char *)v70->__begin_;
        if (v109 <= -3) {
          goto LABEL_439;
        }
        uint64_t v110 = v109 >> 1;
        unint64_t v111 = (char *)v73 - (char *)v108;
        if (v111 <= (v109 >> 1) + 1) {
          unint64_t v112 = v110 + 1;
        }
        else {
          unint64_t v112 = v111;
        }
        if (v111 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v113 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v113 = v112;
        }
        if (v113)
        {
          v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&self->_indices.__end_cap_, v113);
          v108 = self->_indices.__begin_;
          v96 = self->_indices.__end_;
        }
        else
        {
          v114 = 0;
        }
        v115 = (unsigned __int16 *)&v114[2 * v110];
        unsigned __int16 *v115 = v106;
        v107 = v115 + 1;
        while (v96 != v108)
        {
          unsigned __int16 v116 = *--v96;
          *--v115 = v116;
        }
        self->_indices.__begin_ = v115;
        self->_indices.__end_ = v107;
        self->_indices.__end_cap_.__value_ = (unsigned __int16 *)&v114[2 * v113];
        if (v108) {
          operator delete(v108);
        }
      }
      else
      {
        unsigned __int16 *v96 = v106;
        v107 = v96 + 1;
      }
      self->_indices.__end_ = v107;
      v118 = self->_patchData.__end_;
      v117 = self->_patchData.__end_cap_.__value_;
      if (v118 >= v117)
      {
        uint64_t v120 = (v118 - v310->__begin_) >> 3;
        if ((unint64_t)(v120 + 1) >> 61) {
LABEL_440:
        }
          _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
        uint64_t v121 = v117 - v310->__begin_;
        uint64_t v122 = v121 >> 2;
        if (v121 >> 2 <= (unint64_t)(v120 + 1)) {
          uint64_t v122 = v120 + 1;
        }
        if ((unint64_t)v121 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v123 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v123 = v122;
        }
        if (v123) {
          v124 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)v307, v123);
        }
        else {
          v124 = 0;
        }
        v125 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v124[8 * v120];
        *(void *)v125 = 0x3F8000003F800000;
        v119 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v125 + 8);
        v127 = self->_patchData.__begin_;
        v126 = self->_patchData.__end_;
        if (v126 != v127)
        {
          do
          {
            uint64_t v128 = *((void *)v126 - 1);
            v126 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v126 - 8);
            *((void *)v125 - 1) = v128;
            v125 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v125 - 8);
          }
          while (v126 != v127);
          v126 = v310->__begin_;
        }
        self->_patchData.__begin_ = v125;
        self->_patchData.__end_ = v119;
        self->_patchData.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v124[8 * v123];
        if (v126) {
          operator delete(v126);
        }
      }
      else
      {
        *(void *)v118 = 0x3F8000003F800000;
        v119 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v118 + 8);
      }
      self->_patchData.__end_ = v119;
    }
    while (((self->_controlPoints.__end_ - self->_controlPoints.__begin_) >> 5) - 3 > (unint64_t)v69);
  }
}

+ (double)interpolate:(float32x4_t)a1 p1:(float32x4_t)a2 p2:(float32x4_t)a3 p3:(float32x4_t)a4 t:(float)a5
{
  __asm { FMOV            V5.4S, #3.0 }
  float32x4_t v10 = vsubq_f32(vmlaq_f32(vmlsq_f32(a4, _Q5, a3), _Q5, a2), a1);
  __asm { FMOV            V6.4S, #-6.0 }
  float32x4_t v12 = vmlaq_f32(vmlaq_f32(vmulq_f32(a2, _Q6), _Q5, a3), _Q5, a1);
  __asm { FMOV            V7.4S, #-3.0 }
  float32x4_t v14 = vmlaq_f32(vmulq_f32(a1, _Q7), _Q5, a3);
  __asm { FMOV            V5.4S, #4.0 }
  float32x4_t v16 = vmlaq_n_f32(vaddq_f32(a1, vmlaq_f32(a3, _Q5, a2)), vmlaq_n_f32(v14, vmlaq_n_f32(v12, v10, a5), a5), a5);
  __asm { FMOV            V1.4S, #6.0 }
  *(void *)&double result = vdivq_f32(v16, _Q1).u64[0];
  return result;
}

+ (double)interpolateTangent:(float32x4_t)a1 p1:(float32x4_t)a2 p2:(float32x4_t)a3 p3:(float32x4_t)a4 t:(float)a5
{
  __asm { FMOV            V5.4S, #3.0 }
  float32x4_t v10 = vsubq_f32(vmlaq_f32(vmlsq_f32(a4, _Q5, a3), _Q5, a2), a1);
  __asm { FMOV            V6.4S, #-6.0 }
  float32x4_t v12 = vmlaq_f32(vmlaq_f32(vmulq_f32(a2, _Q6), _Q5, a3), _Q5, a1);
  __asm { FMOV            V6.4S, #-3.0 }
  float32x4_t v14 = vaddq_f32(vmlaq_f32(vmulq_f32(a1, _Q6), _Q5, a3), vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(v12, v10, a5), a5), vmlaq_n_f32(v12, vaddq_f32(v10, v10), a5), a5));
  __asm { FMOV            V1.4S, #6.0 }
  *(void *)&double result = vdivq_f32(v14, _Q1).u64[0];
  return result;
}

- (void).cxx_destruct
{
  begin = self->_indices.__begin_;
  if (begin)
  {
    self->_indices.__end_ = begin;
    operator delete(begin);
  }
  int64_t v4 = self->_patchData.__begin_;
  if (v4)
  {
    self->_patchData.__end_ = v4;
    operator delete(v4);
  }
  unint64_t v5 = self->_controlPoints.__begin_;
  if (v5)
  {
    self->_controlPoints.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end