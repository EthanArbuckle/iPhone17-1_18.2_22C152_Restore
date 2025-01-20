@interface VNParabolaDetection
+ (BOOL)updateMinMaxXYOfParabola:(double *)a3 withPoint:;
- (BOOL)isValidRadius:(float)a3 withPrecedingRadius:;
- (VNParabolaDetection)init;
- (float)getRsquareOfEquation:(double *)a3 yValues:(float *)a4 equationConstants:;
- (float32x2_t)computeEquationCoefficients:(uint64_t)a3 yValues:(uint64_t)a4;
- (id).cxx_construct;
- (uint64_t)processContoursForParabolas:(uint64_t)a3 withPTS:(uint64_t)a4 objectMinimumPixelSize:(uint64_t)a5 bufferWidth:(uint64_t)a6 bufferHeight:(int32x4_t)a7;
@end

@implementation VNParabolaDetection

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 2) = (char *)self + 24;
  *((void *)self + 5) = 0x50000000ELL;
  *((_DWORD *)self + 12) = 5;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((void *)self + 13) = 0x300000003;
  *((void *)self + 14) = 0x41A0000041200000;
  *((_DWORD *)self + 30) = 1125515264;
  *(void *)((char *)self + 124) = 0x43800000780;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)((char *)self + 132) = _D0;
  *((_DWORD *)self + 35) = 10;
  *((_OWORD *)self + 9) = xmmword_1A410C2D0;
  *((_OWORD *)self + 10) = xmmword_1A410C2E0;
  *((_DWORD *)self + 44) = 0x40000000;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 23) = (char *)self + 192;
  *((_DWORD *)self + 52) = 1114636288;
  *(_OWORD *)((char *)self + 212) = xmmword_1A410C2F0;
  *(void *)((char *)self + 228) = 0xE00000064;
  *((_DWORD *)self + 59) = 5;
  return self;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<int,ObservedParabola>,std::__map_value_compare<int,std::__value_type<int,ObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,ObservedParabola>>>::destroy((void *)self->_observedParabolas.__tree_.__pair1_.__value_.__left_);
  begin = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_;
  end = self->parabolaSearchBuffer.contourPointsQ.__map_.__end_;
  if (end == begin)
  {
    p_size = &self->parabolaSearchBuffer.contourPointsQ.__size_;
    end = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_;
  }
  else
  {
    p_size = &self->parabolaSearchBuffer.contourPointsQ.__size_;
    unint64_t start = self->parabolaSearchBuffer.contourPointsQ.__start_;
    v7 = &begin[start / 0xAA];
    unint64_t v8 = (unint64_t)*v7;
    unint64_t v9 = (unint64_t)*v7 + 24 * (start % 0xAA);
    unint64_t v10 = (unint64_t)begin[(self->parabolaSearchBuffer.contourPointsQ.__size_.__value_ + start) / 0xAA]
        + 24 * ((self->parabolaSearchBuffer.contourPointsQ.__size_.__value_ + start) % 0xAA);
    if (v9 != v10)
    {
      do
      {
        v11 = *(void **)v9;
        if (*(void *)v9)
        {
          *(void *)(v9 + 8) = v11;
          operator delete(v11);
          unint64_t v8 = (unint64_t)*v7;
        }
        v9 += 24;
        if (v9 - v8 == 4080)
        {
          unint64_t v12 = (unint64_t)v7[1];
          ++v7;
          unint64_t v8 = v12;
          unint64_t v9 = v12;
        }
      }
      while (v9 != v10);
      begin = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_;
      end = self->parabolaSearchBuffer.contourPointsQ.__map_.__end_;
    }
  }
  p_size->__value_ = 0;
  unint64_t v13 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->parabolaSearchBuffer.contourPointsQ.__map_.__end_;
      begin = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_ + 1;
      self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_ = begin;
      unint64_t v13 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  unint64_t v14 = v13 >> 3;
  if (v14 == 1)
  {
    unint64_t v15 = 85;
    goto LABEL_16;
  }
  if (v14 == 2)
  {
    unint64_t v15 = 170;
LABEL_16:
    self->parabolaSearchBuffer.contourPointsQ.__start_ = v15;
  }
  if (begin != end)
  {
    do
    {
      v16 = *begin++;
      operator delete(v16);
    }
    while (begin != end);
    v18 = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_;
    v17 = self->parabolaSearchBuffer.contourPointsQ.__map_.__end_;
    if (v17 != v18) {
      self->parabolaSearchBuffer.contourPointsQ.__map_.__end_ = (void **)((char *)v17
    }
                                                                        + (((char *)v18 - (char *)v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->parabolaSearchBuffer.contourPointsQ.__map_.__first_;
  if (first) {
    operator delete(first);
  }
  left = self->internalParabolas.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::destroy(left);
}

- (VNParabolaDetection)init
{
  v7.receiver = self;
  v7.super_class = (Class)VNParabolaDetection;
  v2 = [(VNParabolaDetection *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->UID_counter = 0;
    p_pair1 = &v2->internalParabolas.__tree_.__pair1_;
    std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::destroy((void *)v2->internalParabolas.__tree_.__pair1_.__value_.__left_);
    v3->internalParabolas.__tree_.__begin_node_ = p_pair1;
    v3->internalParabolas.__tree_.__pair3_.__value_ = 0;
    p_pair1->__value_.__left_ = 0;
    std::__tree<std::__value_type<int,ObservedParabola>,std::__map_value_compare<int,std::__value_type<int,ObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,ObservedParabola>>>::destroy((void *)v3->_observedParabolas.__tree_.__pair1_.__value_.__left_);
    v3->_observedParabolas.__tree_.__begin_node_ = &v3->_observedParabolas.__tree_.__pair1_;
    v3->_observedParabolas.__tree_.__pair3_.__value_ = 0;
    v3->_observedParabolas.__tree_.__pair1_.__value_.__left_ = 0;
    v5 = v3;
  }

  return v3;
}

- (uint64_t)processContoursForParabolas:(uint64_t)a3 withPTS:(uint64_t)a4 objectMinimumPixelSize:(uint64_t)a5 bufferWidth:(uint64_t)a6 bufferHeight:(int32x4_t)a7
{
  uint64_t v639 = *MEMORY[0x1E4F143B8];
  uint64_t v596 = result;
  if (!result) {
    return result;
  }
  objc_super v7 = (uint64_t *)*a2;
  unint64_t v8 = (uint64_t *)a2[1];
  if (v8 == (uint64_t *)*a2)
  {
    result += 184;
    return result;
  }
  if (a4) {
    *(_DWORD *)(result + 236) = a4;
  }
  if (*(_DWORD *)(result + 124) != a5 || *(_DWORD *)(result + 128) != a6)
  {
    *(_DWORD *)(result + 124) = a5;
    *(_DWORD *)(result + 128) = a6;
    *(float32x2_t *)a7.i8 = vcvt_f32_s32((int32x2_t)__PAIR64__(a6, a5));
    uint64_t v10 = 152;
    if ((int)a5 <= (int)a6) {
      uint64_t v11 = 152;
    }
    else {
      uint64_t v11 = 148;
    }
    if ((int)a5 <= (int)a6) {
      uint64_t v10 = 148;
    }
    v12.i32[0] = *(_DWORD *)(result + v11);
    v12.i32[1] = *(_DWORD *)(result + v10);
    *(float32x2_t *)a7.i8 = vdiv_f32(*(float32x2_t *)a7.i8, v12);
    *(void *)(result + 132) = a7.i64[0];
    *(int32x4_t *)(result + 216) = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(a7, a7), vcvtq_f32_s32(*(int32x4_t *)(result + 216))));
    int32x2_t v13 = *(int32x2_t *)(result + 104);
    float32x2_t v14 = vmul_lane_f32(*(float32x2_t *)(result + 112), *(float32x2_t *)a7.i8, 1);
    *(float *)(result + 120) = vmuls_lane_f32(*(float *)(result + 120), *(float32x2_t *)a7.i8, 1);
    int32x2_t v15 = vcvt_s32_f32(vmul_f32(*(float32x2_t *)a7.i8, vcvt_f32_s32(v13)));
    *(int32x2_t *)(result + 104) = v15;
    *(float32x2_t *)(result + 112) = v14;
    *(int32x2_t *)(result + 44) = v15;
    *(float *)(result + 164) = fmaxf(*(float *)a7.i32, *(float *)&a7.i32[1]) * *(float *)(result + 164);
    objc_super v7 = (uint64_t *)*a2;
    unint64_t v8 = (uint64_t *)a2[1];
  }
  __src[1] = 0;
  __src[0] = 0;
  *(void *)v632 = 0;
  v16 = (_OWORD *)MEMORY[0x1E4F1DAD8];
  if (v7 != v8)
  {
    v17 = 0;
    unint64_t v18 = 0;
    v19 = 0;
    do
    {
      uint64_t v20 = *v7;
      uint64_t v21 = v7[1];
      int v22 = *((_DWORD *)v7 + 4);
      *(_OWORD *)v599 = *(_OWORD *)a3;
      v600 = *(double **)(a3 + 16);
      CMTimeMake((CMTime *)&v603[16], 0, 30);
      *(void *)v603 = v20;
      *(void *)&v603[8] = v21;
      *(_OWORD *)&v603[16] = *(_OWORD *)v599;
      *(void *)&v603[32] = v600;
      *(_DWORD *)&v603[40] = v22;
      if ((unint64_t)v19 >= v18)
      {
        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v19 - v17) >> 4) + 1;
        if (v25 > 0x555555555555555)
        {
          __src[0] = v17;
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((uint64_t)(v18 - (void)v17) >> 4) > v25) {
          unint64_t v25 = 0x5555555555555556 * ((uint64_t)(v18 - (void)v17) >> 4);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18 - (void)v17) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v26 = 0x555555555555555;
        }
        else {
          unint64_t v26 = v25;
        }
        if (v26) {
          unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v26);
        }
        else {
          uint64_t v27 = 0;
        }
        v28 = (_OWORD *)(v26 + 16 * ((v19 - v17) >> 4));
        long long v29 = *(_OWORD *)v603;
        long long v30 = *(_OWORD *)&v603[32];
        v28[1] = *(_OWORD *)&v603[16];
        v28[2] = v30;
        _OWORD *v28 = v29;
        if (v19 == v17)
        {
          v34 = (char *)(v26 + 16 * ((v19 - v17) >> 4));
        }
        else
        {
          unint64_t v31 = v26 + 16 * ((v19 - v17) >> 4);
          do
          {
            long long v32 = *((_OWORD *)v19 - 3);
            long long v33 = *((_OWORD *)v19 - 2);
            v34 = (char *)(v31 - 48);
            *(_OWORD *)(v31 - 20) = *(_OWORD *)(v19 - 20);
            *(_OWORD *)(v31 - 48) = v32;
            *(_OWORD *)(v31 - 32) = v33;
            v19 -= 48;
            v31 -= 48;
          }
          while (v19 != v17);
        }
        unint64_t v18 = v26 + 48 * v27;
        v19 = (char *)(v28 + 3);
        if (v17) {
          operator delete(v17);
        }
        v17 = v34;
      }
      else
      {
        long long v23 = *(_OWORD *)v603;
        long long v24 = *(_OWORD *)&v603[32];
        *((_OWORD *)v19 + 1) = *(_OWORD *)&v603[16];
        *((_OWORD *)v19 + 2) = v24;
        *(_OWORD *)v19 = v23;
        v19 += 48;
      }
      v7 += 3;
    }
    while (v7 != v8);
    *(void *)v632 = v18;
    __src[1] = v19;
    __src[0] = v17;
    v16 = (_OWORD *)MEMORY[0x1E4F1DAD8];
  }
  v35 = (void *)(v596 + 56);
  unint64_t v36 = *(void *)(v596 + 96);
  if (!v36)
  {
    sanitize((double **)v603, (long long **)__src, *(_DWORD *)(v596 + 44), *(_DWORD *)(v596 + 48));
    v48 = *(void **)&v603[8];
    v49 = *(void **)v603;
    if (*(void *)&v603[8] != *(void *)v603)
    {
LABEL_65:
      std::deque<std::vector<CGPointWithPts>>::push_back(v35, (uint64_t)v603);
      if (!v49) {
        goto LABEL_79;
      }
      goto LABEL_68;
    }
    goto LABEL_67;
  }
  unint64_t v37 = *(void *)(v596 + 88);
  v38 = *(void ***)(v596 + 64);
  uint64_t v39 = *((void *)v38[(v36 + v37 - 1) / 0xAA] + 3 * ((v36 + v37 - 1) % 0xAA));
  if ((float)((float)*(uint64_t *)a3 / (float)*(int *)(a3 + 8))
     - (float)((float)*(uint64_t *)(v39 + 16) / (float)*(int *)(v39 + 24)) <= (double)*(int *)(v596 + 40))
  {
    if (v36 == 5)
    {
      v50 = v38[v37 / 0xAA];
      v51 = (void *)v50[3 * (v37 % 0xAA)];
      if (v51)
      {
        v50[3 * (v37 % 0xAA) + 1] = v51;
        operator delete(v51);
        uint64_t v52 = v596;
        unint64_t v37 = *(void *)(v596 + 88);
        unint64_t v36 = *(void *)(v596 + 96);
      }
      else
      {
        uint64_t v52 = v596;
      }
      *(void *)(v52 + 88) = v37 + 1;
      *(void *)(v52 + 96) = v36 - 1;
      if (v37 + 1 >= 0x154)
      {
        operator delete(**(void ***)(v52 + 64));
        *(void *)(v52 + 64) += 8;
        *(void *)(v52 + 88) -= 170;
      }
      memset(v603, 0, 24);
      sanitize((double **)&__p, (long long **)__src, *(_DWORD *)(v52 + 44), *(_DWORD *)(v52 + 48));
      v53 = __p;
      sanitizeAllFrames((void **)&__p, v35, (uint64_t)__p, (uint64_t)__p_8[0], *(_DWORD *)(v52 + 44), *(_DWORD *)(v52 + 48));
      v54 = __p;
      *(void *)v603 = __p;
      *(_OWORD *)&v603[8] = *(_OWORD *)__p_8;
      if (__p_8[0] == __p) {
        goto LABEL_74;
      }
    }
    else
    {
      if (v36 > 4) {
        goto LABEL_79;
      }
      memset(v603, 0, 24);
      sanitize((double **)&__p, (long long **)__src, *(_DWORD *)(v596 + 44), *(_DWORD *)(v596 + 48));
      v53 = __p;
      sanitizeAllFrames((void **)&__p, v35, (uint64_t)__p, (uint64_t)__p_8[0], *(_DWORD *)(v596 + 44), *(_DWORD *)(v596 + 48));
      v54 = __p;
      *(void *)v603 = __p;
      *(_OWORD *)&v603[8] = *(_OWORD *)__p_8;
      if (__p_8[0] == __p)
      {
LABEL_74:
        if (v53)
        {
          operator delete(v53);
          v54 = *(void **)v603;
        }
        if (!v54) {
          goto LABEL_79;
        }
        v58 = v54;
        goto LABEL_78;
      }
    }
    std::deque<std::vector<CGPointWithPts>>::push_back(v35, (uint64_t)v603);
    goto LABEL_74;
  }
  v40 = *(void ***)(v596 + 72);
  if (v40 == v38)
  {
    v40 = *(void ***)(v596 + 64);
    goto LABEL_56;
  }
  v41 = &v38[v37 / 0xAA];
  unint64_t v42 = (unint64_t)*v41;
  unint64_t v43 = (unint64_t)*v41 + 24 * (v37 % 0xAA);
  unint64_t v44 = (unint64_t)v38[(v37 + v36) / 0xAA] + 24 * ((v37 + v36) % 0xAA);
  if (v43 == v44)
  {
LABEL_56:
    uint64_t v47 = v596;
    goto LABEL_57;
  }
  do
  {
    v45 = *(void **)v43;
    if (*(void *)v43)
    {
      *(void *)(v43 + 8) = v45;
      operator delete(v45);
      unint64_t v42 = (unint64_t)*v41;
    }
    v43 += 24;
    if (v43 - v42 == 4080)
    {
      unint64_t v46 = (unint64_t)v41[1];
      ++v41;
      unint64_t v42 = v46;
      unint64_t v43 = v46;
    }
  }
  while (v43 != v44);
  uint64_t v47 = v596;
  v38 = *(void ***)(v596 + 64);
  v40 = *(void ***)(v596 + 72);
LABEL_57:
  *(void *)(v47 + 96) = 0;
  unint64_t v55 = (char *)v40 - (char *)v38;
  if ((unint64_t)((char *)v40 - (char *)v38) >= 0x11)
  {
    do
    {
      operator delete(*v38);
      uint64_t v56 = *(void *)(v596 + 72);
      v38 = (void **)(*(void *)(v596 + 64) + 8);
      *(void *)(v596 + 64) = v38;
      unint64_t v55 = v56 - (void)v38;
    }
    while (v55 > 0x10);
  }
  if (v55 >> 3 == 1)
  {
    uint64_t v57 = 85;
  }
  else
  {
    if (v55 >> 3 != 2) {
      goto LABEL_64;
    }
    uint64_t v57 = 170;
  }
  *(void *)(v596 + 88) = v57;
LABEL_64:
  sanitize((double **)v603, (long long **)__src, *(_DWORD *)(v596 + 44), *(_DWORD *)(v596 + 48));
  v48 = *(void **)&v603[8];
  v49 = *(void **)v603;
  if (*(void *)&v603[8] != *(void *)v603) {
    goto LABEL_65;
  }
LABEL_67:
  v49 = v48;
  if (v48)
  {
LABEL_68:
    v58 = v49;
LABEL_78:
    operator delete(v58);
  }
LABEL_79:
  if (__src[0]) {
    operator delete(__src[0]);
  }
  if (!*(void *)(v596 + 32)) {
    goto LABEL_505;
  }
  uint64_t v59 = *(void *)a3;
  int v60 = *(_DWORD *)(a3 + 8);
  uint64_t v601 = *(void *)(a3 + 12);
  unsigned int v602 = *(_DWORD *)(a3 + 20);
  v61 = *(uint64_t ***)(v596 + 16);
  v555 = (uint64_t **)(v596 + 16);
  v62 = (uint64_t **)(v596 + 24);
  if (v61 == (uint64_t **)(v596 + 24))
  {
    v562 = 0;
    goto LABEL_417;
  }
  __dst = 0;
  v63 = 0;
  v64 = 0;
  uint64_t v573 = v59;
  int v571 = v60;
  float v65 = (float)v59 / (float)v60;
  double v66 = v65;
  float v564 = v65;
  double v561 = v65;
  do
  {
    float v67 = (float)v61[7][20] / (float)*((int *)v61[7] + 42);
    if (v65 <= v67) {
      goto LABEL_200;
    }
    v68 = (int *)(v61 + 4);
    double v69 = (v66 - v67) * *(float *)(v596 + 208);
    if (v69 > (double)*(int *)(v596 + 232))
    {
      if (v63 >= __dst)
      {
        uint64_t v96 = v63 - v64;
        unint64_t v97 = v96 + 1;
        if ((unint64_t)(v96 + 1) >> 62) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        if (((char *)__dst - (char *)v64) >> 1 > v97) {
          unint64_t v97 = ((char *)__dst - (char *)v64) >> 1;
        }
        if ((unint64_t)((char *)__dst - (char *)v64) >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v98 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v98 = v97;
        }
        if (v98) {
          unint64_t v98 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v98);
        }
        else {
          uint64_t v99 = 0;
        }
        v100 = (int *)(v98 + 4 * v96);
        int *v100 = *v68;
        v101 = v100 + 1;
        while (v63 != v64)
        {
          int v102 = *--v63;
          *--v100 = v102;
        }
        __dst = (int *)(v98 + 4 * v99);
        if (v64) {
          operator delete(v64);
        }
        v63 = v101;
        v64 = v100;
      }
      else
      {
        *v63++ = *v68;
      }
      goto LABEL_200;
    }
    float v70 = *(float *)(v596 + 144);
    long long v582 = *((_OWORD *)v61 + 5);
    *(_OWORD *)v603 = *v16;
    CMTimeMake((CMTime *)&v603[16], 0, 30);
    v577 = (int *)(v61 + 4);
    *(void *)&v603[16] = v573;
    *(_DWORD *)&v603[24] = v571;
    *(void *)&v603[28] = v601;
    *(void *)&v603[36] = v602;
    *(_OWORD *)__src = *v16;
    CMTimeMake((CMTime *)v632, 0, 30);
    int v71 = 0;
    v588 = v61 + 7;
    v559 = (float *)(v61 + 6);
    float v72 = fmin(v69, v70);
    float v584 = v72;
    *(void *)v632 = v573;
    *(_DWORD *)&v632[24] = 0;
    *(_DWORD *)&v632[8] = v571;
    *(void *)&v632[12] = v601;
    *(_DWORD *)&v632[20] = v602;
    float32x4_t v592 = *((float32x4_t *)v61 + 34);
    v74 = (float64x2_t *)v61[91];
    v61[92] = (uint64_t *)v74;
    do
    {
      v73 = (const float *)(v61 + 28);
      float32x4x4_t v640 = vld4q_f32(v73);
      v75 = (const float *)(v61 + 36);
      float32x4x4_t v641 = vld4q_f32(v75);
      float32x4_t v592 = vaddq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v640.val[0], v592.f32[0]), v640.val[1], *(float32x2_t *)v592.f32, 1), v640.val[2], v592, 2), v640.val[3], v592, 3), vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v641.val[0], COERCE_FLOAT(*((_OWORD *)v61 + 43))), v641.val[1], (float32x2_t)v61[86], 1), v641.val[2], *((float32x4_t *)v61 + 43), 2),
                 v641.val[3],
                 *((float32x4_t *)v61 + 43),
                 3));
      float64x2_t v76 = vcvtq_f64_f32(*(float32x2_t *)v592.f32);
      unint64_t v77 = (unint64_t)v61[93];
      if ((unint64_t)v74 >= v77)
      {
        float64x2_t v590 = v76;
        v78 = (float64x2_t *)v61[91];
        uint64_t v79 = v74 - v78;
        unint64_t v80 = v79 + 1;
        if ((unint64_t)(v79 + 1) >> 60) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v81 = v77 - (void)v78;
        if (v81 >> 3 > v80) {
          unint64_t v80 = v81 >> 3;
        }
        if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v82 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v82 = v80;
        }
        if (v82)
        {
          unint64_t v82 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v82);
          v74 = (float64x2_t *)v61[92];
          v78 = (float64x2_t *)v61[91];
        }
        else
        {
          uint64_t v83 = 0;
        }
        v84 = (float64x2_t *)(v82 + 16 * v79);
        float64x2_t *v84 = v590;
        v85 = (uint64_t *)&v84[1];
        if (v74 != v78)
        {
          do
          {
            v84[-1] = v74[-1];
            --v84;
            --v74;
          }
          while (v74 != v78);
          v78 = (float64x2_t *)v61[91];
        }
        v61[91] = (uint64_t *)v84;
        v61[92] = v85;
        v61[93] = (uint64_t *)(v82 + 16 * v83);
        if (v78) {
          operator delete(v78);
        }
        v74 = (float64x2_t *)v85;
      }
      else
      {
        *v74++ = v76;
      }
      v61[92] = (uint64_t *)v74;
      ++v71;
    }
    while (v71 != 20);
    v86 = v64;
    v87 = v61[7];
    v88 = (double *)v61[91];
    if (v88 == (double *)v74)
    {
      BOOL v91 = 0;
      BOOL v94 = 0;
      int v593 = 1;
      goto LABEL_137;
    }
    int v89 = 0;
    BOOL v90 = 0;
    BOOL v91 = 0;
    double v92 = *((double *)v87 + 18);
    while (1)
    {
      double v93 = v88[1];
      BOOL v94 = *v88 > v92;
      if (*v88 <= v92)
      {
        if (v90)
        {
          int v593 = 0;
          BOOL v94 = 1;
          goto LABEL_137;
        }
      }
      else if (v89 != 0 && !v90)
      {
        int v593 = 0;
        BOOL v94 = 0;
        goto LABEL_137;
      }
      double v95 = *((double *)v87 + 19);
      if (v93 > v95)
      {
        if (v89 != 0 && !v91)
        {
          BOOL v91 = 0;
          int v593 = 0;
          goto LABEL_137;
        }
        goto LABEL_117;
      }
      if (v91) {
        break;
      }
LABEL_117:
      --v89;
      v88 += 2;
      BOOL v90 = v94;
      BOOL v91 = v93 > v95;
      if (v88 == (double *)v74)
      {
        int v593 = 1;
        BOOL v91 = v93 > v95;
        goto LABEL_137;
      }
    }
    int v593 = 0;
    BOOL v91 = 1;
LABEL_137:
    uint64_t v104 = *a2;
    uint64_t v103 = a2[1];
    if (*a2 == v103)
    {
      float v108 = 3.4028e38;
      float v107 = 3.4028e38;
      float v106 = 3.4028e38;
      float v123 = 3.4028e38;
    }
    else
    {
      float v105 = 3.4028e38;
      float v106 = 3.4028e38;
      float v107 = 3.4028e38;
      float v108 = 3.4028e38;
      do
      {
        double v109 = *(double *)v104;
        double v110 = vabdd_f64(*(double *)v104, *((double *)v87 + 18));
        if (v110 >= (double)*(int *)(v596 + 220)) {
          goto LABEL_182;
        }
        double v111 = *(double *)(v104 + 8);
        double v112 = vabdd_f64(v111, *((double *)v87 + 19));
        if (v112 >= (double)*(int *)(v596 + 228)
          || v110 <= (double)*(int *)(v596 + 216) && v112 <= (double)*(int *)(v596 + 224))
        {
          goto LABEL_182;
        }
        float v113 = *(float *)(v104 + 16);
        if (!-[VNParabolaDetection isValidRadius:withPrecedingRadius:]((float *)v596, v113, *((float *)v61 + 200))) {
          goto LABEL_182;
        }
        if (v593
          && (v94 && v109 > *((double *)*v588 + 18) && (v114 = (double *)v61[91], v109 >= *v114)
           || v91 && v111 > *((double *)*v588 + 19) && (v114 = (double *)v61[91], v111 >= v114[1])
           || !v94 && v109 < *((double *)*v588 + 18) && (v114 = (double *)v61[91], v109 <= *v114)
           || !v91 && v111 < *((double *)*v588 + 19) && (v114 = (double *)v61[91], v111 <= v114[1])))
        {
          v116 = (double *)v61[92];
          if (v116 == v114)
          {
            char v118 = 0;
          }
          else
          {
            unint64_t v117 = 0;
            char v118 = 0;
            do
            {
              float64x2_t v119 = vsubq_f64(*(float64x2_t *)&v114[2 * v117], *(float64x2_t *)v104);
              double v120 = sqrt(vaddvq_f64(vmulq_f64(v119, v119)));
              if (v120 < v106 && v120 < (double)(2 * *(_DWORD *)(v596 + 236)))
              {
                *(_OWORD *)__src = *(_OWORD *)v104;
                *(float *)&v632[24] = v113;
                float v106 = v120;
                char v118 = 1;
              }
              ++v117;
            }
            while (v117 < ((char *)v116 - (char *)v114) >> 4);
          }
          int v115 = v118 & 1;
        }
        else
        {
          int v115 = 0;
        }
        if ((*((unsigned char *)v61 + 772) & 1) == 0 || (double v121 = *(double *)v104, *(double *)v104 <= *((double *)*v588 + 18)))
        {
          if ((*((unsigned char *)v61 + 772) & 2) == 0) {
            goto LABEL_182;
          }
          double v121 = *(double *)v104;
          if (*(double *)v104 >= *((double *)*v588 + 18)) {
            goto LABEL_182;
          }
        }
        float v122 = *(double *)(v104 + 8)
             - (v121 * *((float *)&v582 + 1)
              + v121 * *(float *)&v582 * v121
              + *((float *)&v582 + 2));
        float v123 = fabsf(v122);
        if (v123 > (float)(int)ceilf(*((float *)v61 + 52) * v584)) {
          goto LABEL_182;
        }
        self;
        if (*(double *)v104 >= *((float *)v61 + 44))
        {
          double v124 = *(double *)(v104 + 8);
          if (v124 >= *((float *)v61 + 46) && *(double *)v104 <= *((float *)v61 + 45) && v124 <= *((float *)v61 + 47)) {
            goto LABEL_182;
          }
        }
        if (v115) {
          float v107 = v123;
        }
        if (v105 > v123)
        {
          *(_OWORD *)v603 = *(_OWORD *)v104;
          *(_DWORD *)&v603[40] = *(_DWORD *)(v104 + 16);
          if (v115) {
            float v108 = v106;
          }
        }
        else
        {
LABEL_182:
          float v123 = v105;
        }
        v104 += 24;
        float v105 = v123;
      }
      while (v104 != v103);
    }
    float v125 = *(float *)(v596 + 120);
    if (v123 >= v125)
    {
      v127 = v63;
      v64 = v86;
      v62 = (uint64_t **)(v596 + 24);
      v16 = (_OWORD *)MEMORY[0x1E4F1DAD8];
      goto LABEL_199;
    }
    v64 = v86;
    v62 = (uint64_t **)(v596 + 24);
    v16 = (_OWORD *)MEMORY[0x1E4F1DAD8];
    if (*(double *)__src != *(double *)v603)
    {
      BOOL v126 = *(double *)&__src[1] == *(double *)&v603[8] || v108 <= v125;
      if (!v126)
      {
        if (v107 >= v125)
        {
          float v106 = 3.4028e38;
        }
        else
        {
          *(_OWORD *)v603 = *(_OWORD *)__src;
          *(_OWORD *)&v603[16] = *(_OWORD *)v632;
          *(_OWORD *)&v603[28] = *(_OWORD *)&v632[12];
          float v123 = v107;
        }
      }
    }
    float v128 = *((float *)v61 + 200) * 0.5;
    float v129 = fminf(v584, *(float *)(v596 + 168));
    if (fmax((float)(*((float *)v61 + 192) + (float)(v128 * v129)), (double)*(int *)(v596 + 140)) < v123
      || v123 > fmaxf(*((float *)v61 + 201) * 4.0, v128 * v129))
    {
      v127 = v63;
      goto LABEL_199;
    }
    *((float *)v61 + 192) = v123;
    if (v106 >= v125 || v106 >= v123)
    {
LABEL_218:
      v127 = v63;
      goto LABEL_219;
    }
    v134 = v61[13];
    v133 = v61[14];
    float v135 = v106 + fmaxf(v128, 4.0);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v133 - (char *)v134) >> 4) > 9 || v123 <= v135) {
      goto LABEL_217;
    }
    int64_t v159 = (char *)v133 - (char *)(v134 + 6);
    if (v133 != v134 + 6) {
      memmove(v61[13], v134 + 6, v159 - 4);
    }
    v61[14] = (uint64_t *)((char *)v134 + v159);
    v161 = v61[16];
    v160 = v61[17];
    int64_t v162 = (char *)v160 - (char *)(v161 + 1);
    if (v160 != v161 + 1) {
      memmove(v61[16], v161 + 1, (char *)v160 - (char *)(v161 + 1));
    }
    v61[17] = (uint64_t *)((char *)v161 + v162);
    v164 = v61[19];
    v163 = v61[20];
    int64_t v165 = (char *)v163 - (char *)(v164 + 1);
    if (v163 != v164 + 1) {
      memmove(v61[19], v164 + 1, (char *)v163 - (char *)(v164 + 1));
    }
    v61[20] = (uint64_t *)((char *)v164 + v165);
    v166 = (double *)v61[13];
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v61[14] - (char *)v166) >> 4) < 4) {
      goto LABEL_217;
    }
    double v167 = v166[6];
    double v168 = v166[12];
    double v169 = v166[18];
    if (*v166 <= v167 || v167 <= v168 || v168 <= v169)
    {
      int v170 = *v166 < v167;
      if (v167 >= v168) {
        int v170 = 0;
      }
      if (v168 >= v169) {
        int v170 = 0;
      }
    }
    else
    {
      int v170 = 2;
    }
    double v230 = v166[1];
    double v231 = v166[7];
    double v232 = v166[13];
    double v233 = v166[19];
    if (v230 <= v231 || v231 <= v232 || v232 <= v233)
    {
      if (v232 < v233 && v231 < v232 && v230 < v231) {
        unsigned int v234 = v170 | 4;
      }
      else {
        unsigned int v234 = v170;
      }
    }
    else
    {
      unsigned int v234 = v170 | 8;
    }
    _ZF = v234 > 8 || ((1 << v234) & 0x111) == 0;
    if (_ZF)
    {
      *((unsigned char *)v61 + 772) = v234;
      int v238 = 1;
LABEL_380:
      v127 = v63;
    }
    else
    {
      if (v63 < __dst)
      {
        int v238 = 0;
        *v63++ = *v577;
        goto LABEL_380;
      }
      uint64_t v239 = v63 - v86;
      unint64_t v240 = v239 + 1;
      if ((unint64_t)(v239 + 1) >> 62) {
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      }
      if (((char *)__dst - (char *)v86) >> 1 > v240) {
        unint64_t v240 = ((char *)__dst - (char *)v86) >> 1;
      }
      if ((unint64_t)((char *)__dst - (char *)v86) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v241 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v241 = v240;
      }
      if (v241) {
        unint64_t v241 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v241);
      }
      else {
        uint64_t v242 = 0;
      }
      v244 = (int *)(v241 + 4 * v239);
      int *v244 = *v577;
      v127 = v244 + 1;
      while (v63 != v64)
      {
        int v245 = *--v63;
        *--v244 = v245;
      }
      __dst = (int *)(v241 + 4 * v242);
      if (v64) {
        operator delete(v64);
      }
      int v238 = 0;
      v64 = v244;
    }
    if (v234 > 8 || ((1 << v234) & 0x111) == 0)
    {
      v63 = v127;
      v62 = (uint64_t **)(v596 + 24);
LABEL_217:
      *(_OWORD *)v603 = *(_OWORD *)__src;
      *(_OWORD *)&v603[16] = *(_OWORD *)v632;
      *(_OWORD *)&v603[28] = *(_OWORD *)&v632[12];
      goto LABEL_218;
    }
    v62 = (uint64_t **)(v596 + 24);
    if (!v238) {
      goto LABEL_199;
    }
LABEL_219:
    v138 = v61[13];
    v137 = v61[14];
    unint64_t v139 = 0xAAAAAAAAAAAAAAABLL * (((char *)v137 - (char *)v138) >> 4);
    float v140 = *((float *)v61 + 52);
    *((float *)v61 + 201) = (float)(v123 + (float)(*((float *)v61 + 201) * 3.0)) * 0.25;
    if (v140 >= (float)*(int *)(v596 + 236))
    {
      float v143 = (float)(v123 + (float)(v140 * (float)(int)v139)) / (float)((int)v139 + 1);
    }
    else
    {
      float v141 = (float)(v123 + (float)(v140 * (float)(int)v139)) / (float)((int)v139 + 1);
      float v142 = v141 + v141 * 0.5;
      float v143 = v142;
    }
    *((float *)v61 + 52) = v143;
    unsigned int v144 = *((unsigned __int8 *)v61 + 772);
    if (v144)
    {
      if (*(double *)v603 < *((double *)*v588 + 18))
      {
        int v145 = 254;
LABEL_228:
        v144 &= v145;
        *((unsigned char *)v61 + 772) = v144;
      }
    }
    else if ((v144 & 2) != 0 && *(double *)v603 > *((double *)*v588 + 18))
    {
      int v145 = 253;
      goto LABEL_228;
    }
    if ((v144 & 4) != 0)
    {
      if (*(double *)&v603[8] < *((double *)*v588 + 19))
      {
        int v146 = 251;
LABEL_235:
        v144 &= v146;
        *((unsigned char *)v61 + 772) = v144;
      }
    }
    else if ((v144 & 8) != 0 && *(double *)&v603[8] > *((double *)*v588 + 19))
    {
      int v146 = 247;
      goto LABEL_235;
    }
    if (v144 <= 8 && ((1 << v144) & 0x111) != 0)
    {
      if (v127 < __dst) {
        goto LABEL_239;
      }
      uint64_t v147 = v127 - v64;
      unint64_t v148 = v147 + 1;
      if (!((unint64_t)(v147 + 1) >> 62))
      {
        if (((char *)__dst - (char *)v64) >> 1 > v148) {
          unint64_t v148 = ((char *)__dst - (char *)v64) >> 1;
        }
        if ((unint64_t)((char *)__dst - (char *)v64) >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v149 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v149 = v148;
        }
        if (v149) {
          unint64_t v149 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v149);
        }
        else {
          uint64_t v150 = 0;
        }
        v156 = (int *)(v149 + 4 * v147);
        int *v156 = *v577;
        v157 = v156 + 1;
        while (v127 != v64)
        {
          int v158 = *--v127;
          *--v156 = v158;
        }
        goto LABEL_376;
      }
LABEL_830:
      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v151 = (unint64_t)v61[15];
    if ((unint64_t)v137 >= v151)
    {
      unint64_t v171 = v139 + 1;
      if (v139 + 1 > 0x555555555555555) {
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v172 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v151 - (void)v138) >> 4);
      if (2 * v172 > v171) {
        unint64_t v171 = 2 * v172;
      }
      if (v172 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v173 = 0x555555555555555;
      }
      else {
        unint64_t v173 = v171;
      }
      if (v173) {
        unint64_t v173 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v173);
      }
      else {
        uint64_t v174 = 0;
      }
      v175 = (uint64_t *)(v173 + 48 * v139);
      long long v176 = *(_OWORD *)v603;
      long long v177 = *(_OWORD *)&v603[32];
      *((_OWORD *)v175 + 1) = *(_OWORD *)&v603[16];
      *((_OWORD *)v175 + 2) = v177;
      *(_OWORD *)v175 = v176;
      v179 = v61[13];
      v178 = v61[14];
      v180 = v175;
      if (v178 == v179)
      {
        v155 = v61 + 7;
      }
      else
      {
        v155 = v61 + 7;
        do
        {
          long long v181 = *((_OWORD *)v178 - 3);
          long long v182 = *((_OWORD *)v178 - 2);
          *(_OWORD *)((char *)v180 - 20) = *(_OWORD *)((char *)v178 - 20);
          *((_OWORD *)v180 - 3) = v181;
          *((_OWORD *)v180 - 2) = v182;
          v180 -= 6;
          v178 -= 6;
        }
        while (v178 != v179);
        v178 = v61[13];
      }
      v154 = v175 + 6;
      v61[13] = v180;
      v61[14] = v175 + 6;
      v61[15] = (uint64_t *)(v173 + 48 * v174);
      if (v178) {
        operator delete(v178);
      }
    }
    else
    {
      long long v152 = *(_OWORD *)v603;
      long long v153 = *(_OWORD *)&v603[32];
      *((_OWORD *)v137 + 1) = *(_OWORD *)&v603[16];
      *((_OWORD *)v137 + 2) = v153;
      *(_OWORD *)v137 = v152;
      v154 = v137 + 6;
      v155 = v61 + 7;
    }
    v61[14] = v154;
    v183 = (char *)(v154 - 24);
    uint64_t v184 = (uint64_t)v61[9];
    v185 = v61[7];
    if (0xAAAAAAAAAAAAAAABLL * ((v184 - (uint64_t)v185) >> 4) >= 4)
    {
      v191 = v61[8];
      unint64_t v192 = 0xAAAAAAAAAAAAAAABLL * (((char *)v191 - (char *)v185) >> 4);
      if (v192 > 3)
      {
        v190 = v61[7];
        goto LABEL_296;
      }
      if (v191 != v185)
      {
        memmove(v61[7], v183, (char *)v191 - (char *)v185 - 4);
        v183 = (char *)(v154 - 24);
        v185 = v61[8];
      }
      v193 = &v183[48 * v192];
      uint64_t v194 = (char *)v154 - v193;
      if (v194) {
        memmove(v185, v193, v194 - 4);
      }
    }
    else
    {
      v186 = (char *)(v154 - 24);
      if (v185)
      {
        v61[8] = v185;
        operator delete(v185);
        uint64_t v184 = 0;
        void *v155 = 0;
        v155[1] = 0;
        v155[2] = 0;
      }
      unint64_t v187 = 0xAAAAAAAAAAAAAAABLL * (v184 >> 4);
      uint64_t v188 = 2 * v187;
      if (2 * v187 <= 4) {
        uint64_t v188 = 4;
      }
      if (v187 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v189 = 0x555555555555555;
      }
      else {
        unint64_t v189 = v188;
      }
      std::vector<CGPointWithPts>::__vallocate[abi:ne180100](v155, v189);
      v185 = v61[8];
      v190 = v185;
      v183 = v186;
LABEL_296:
      memmove(v190, v183, 0xBCuLL);
      uint64_t v194 = 192;
    }
    v61[8] = (uint64_t *)((char *)v185 + v194);
    v195 = (void **)(v61 + 16);
    v197 = (char *)v61[17];
    unint64_t v196 = (unint64_t)v61[18];
    if ((unint64_t)v197 < v196)
    {
      *(void *)v197 = *(void *)v603;
      v198 = (uint64_t *)(v197 + 8);
      goto LABEL_312;
    }
    v199 = (char *)*v195;
    uint64_t v200 = (v197 - (unsigned char *)*v195) >> 3;
    unint64_t v201 = v200 + 1;
    if ((unint64_t)(v200 + 1) >> 61) {
      goto LABEL_831;
    }
    uint64_t v202 = v196 - (void)v199;
    if (v202 >> 2 > v201) {
      unint64_t v201 = v202 >> 2;
    }
    _CF = (unint64_t)v202 >= 0x7FFFFFFFFFFFFFF8;
    unint64_t v204 = 0x1FFFFFFFFFFFFFFFLL;
    if (!_CF) {
      unint64_t v204 = v201;
    }
    if (v204)
    {
      unint64_t v204 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v204);
      v199 = (char *)v61[16];
      v197 = (char *)v61[17];
    }
    else
    {
      uint64_t v205 = 0;
    }
    v206 = (uint64_t *)(v204 + 8 * v200);
    uint64_t *v206 = *(void *)v603;
    v198 = v206 + 1;
    while (v197 != v199)
    {
      uint64_t v207 = *((void *)v197 - 1);
      v197 -= 8;
      *--v206 = v207;
    }
    v61[16] = v206;
    v61[17] = v198;
    v61[18] = (uint64_t *)(v204 + 8 * v205);
    if (v199) {
      operator delete(v199);
    }
LABEL_312:
    v61[17] = v198;
    v209 = (char *)v61[20];
    unint64_t v208 = (unint64_t)v61[21];
    if ((unint64_t)v209 >= v208)
    {
      v211 = (char *)v61[19];
      uint64_t v212 = (v209 - v211) >> 3;
      unint64_t v213 = v212 + 1;
      if (!((unint64_t)(v212 + 1) >> 61))
      {
        uint64_t v214 = v208 - (void)v211;
        if (v214 >> 2 > v213) {
          unint64_t v213 = v214 >> 2;
        }
        _CF = (unint64_t)v214 >= 0x7FFFFFFFFFFFFFF8;
        unint64_t v215 = 0x1FFFFFFFFFFFFFFFLL;
        if (!_CF) {
          unint64_t v215 = v213;
        }
        if (v215)
        {
          unint64_t v215 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v215);
          v211 = (char *)v61[19];
          v209 = (char *)v61[20];
        }
        else
        {
          uint64_t v216 = 0;
        }
        v217 = (uint64_t *)(v215 + 8 * v212);
        uint64_t *v217 = *(void *)&v603[8];
        v210 = v217 + 1;
        while (v209 != v211)
        {
          uint64_t v218 = *((void *)v209 - 1);
          v209 -= 8;
          *--v217 = v218;
        }
        v61[19] = v217;
        v61[20] = v210;
        v61[21] = (uint64_t *)(v215 + 8 * v216);
        if (v211) {
          operator delete(v211);
        }
        goto LABEL_327;
      }
LABEL_831:
      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
    }
    *(void *)v209 = *(void *)&v603[8];
    v210 = (uint64_t *)(v209 + 8);
LABEL_327:
    v61[20] = v210;
    v219 = v61[97];
    *((float *)v61 + 200) = (float)((float)((float)(*((float *)v219 + 1) + *((float *)v219 + 2)) + *((float *)v219 + 3))
                                  + *(float *)&v603[40])
                          * 0.25;
    uint64_t *v219 = *(uint64_t *)((char *)v219 + 4);
    *((_DWORD *)v219 + 2) = *((_DWORD *)v219 + 3);
    *((_DWORD *)v219 + 3) = *(_DWORD *)&v603[40];
    float v220 = *((float *)v61 + 200);
    if (v220 < *(float *)(v596 + 164)) {
      float v220 = v220 * 2.5;
    }
    *((float *)v61 + 52) = v220;
    +[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, v559, (double *)v603);
    *(float32x2_t *)&long long v226 = -[VNParabolaDetection computeEquationCoefficients:yValues:]((uint64_t)(v61 + 16), (double *)v61[19], v221, v222, v223, v224, v225);
    *((_OWORD *)v61 + 5) = v226;
    *((float *)v61 + 24) = -[VNParabolaDetection getRsquareOfEquation:yValues:equationConstants:]((double *)v61[16], (double *)v61[19], (double *)v61[20], (float *)v61 + 20);
    KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)(v61 + 28), *(CGPoint *)v603);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v61[14] - (char *)v61[13]) >> 4) > *(int *)(v596 + 212)
      || *((float *)v61 + 24) >= 0.9)
    {
      v229 = std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v555, *v577, v577);
      InternalObservedParabola::operator=((uint64_t)(v229 + 6), (uint64_t)v559);
    }
    else if (v127 < __dst)
    {
LABEL_239:
      *v127++ = *v577;
    }
    else
    {
      uint64_t v227 = v127 - v64;
      unint64_t v228 = v227 + 1;
      if ((unint64_t)(v227 + 1) >> 62) {
        goto LABEL_830;
      }
      if (((char *)__dst - (char *)v64) >> 1 > v228) {
        unint64_t v228 = ((char *)__dst - (char *)v64) >> 1;
      }
      if ((unint64_t)((char *)__dst - (char *)v64) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v149 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v149 = v228;
      }
      if (v149) {
        unint64_t v149 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v149);
      }
      else {
        uint64_t v150 = 0;
      }
      v156 = (int *)(v149 + 4 * v227);
      int *v156 = *v577;
      v157 = v156 + 1;
      while (v127 != v64)
      {
        int v243 = *--v127;
        *--v156 = v243;
      }
LABEL_376:
      __dst = (int *)(v149 + 4 * v150);
      if (v64) {
        operator delete(v64);
      }
      v127 = v157;
      v64 = v156;
    }
LABEL_199:
    v63 = v127;
    float v65 = v564;
    double v66 = v561;
LABEL_200:
    v130 = v61[1];
    if (v130)
    {
      do
      {
        v131 = (uint64_t **)v130;
        v130 = (uint64_t *)*v130;
      }
      while (v130);
    }
    else
    {
      do
      {
        v131 = (uint64_t **)v61[2];
        _ZF = *v131 == (uint64_t *)v61;
        v61 = v131;
      }
      while (!_ZF);
    }
    v61 = v131;
  }
  while (v131 != v62);
  if (v63 == v64)
  {
    v562 = v63;
  }
  else
  {
    v246 = v64;
    do
    {
      v247 = *v62;
      if (!*v62) {
        goto LABEL_405;
      }
      int v248 = *v246;
      v249 = v62;
      v250 = *v62;
      do
      {
        int v251 = *((_DWORD *)v250 + 8);
        BOOL v252 = v251 < v248;
        if (v251 >= v248) {
          v253 = (uint64_t **)v250;
        }
        else {
          v253 = (uint64_t **)(v250 + 1);
        }
        if (!v252) {
          v249 = (uint64_t **)v250;
        }
        v250 = *v253;
      }
      while (*v253);
      if (v249 == v62 || v248 < *((_DWORD *)v249 + 8)) {
LABEL_405:
      }
        v249 = v62;
      v254 = v249[1];
      v255 = (uint64_t *)v249;
      if (v254)
      {
        do
        {
          v256 = v254;
          v254 = (uint64_t *)*v254;
        }
        while (v254);
      }
      else
      {
        do
        {
          v256 = (uint64_t *)v255[2];
          _ZF = *v256 == (void)v255;
          v255 = v256;
        }
        while (!_ZF);
      }
      if (*v555 == (uint64_t *)v249) {
        *v555 = v256;
      }
      --*(void *)(v596 + 32);
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v247, (uint64_t *)v249);
      InternalObservedParabola::~InternalObservedParabola((InternalObservedParabola *)(v249 + 6));
      operator delete(v249);
      ++v246;
    }
    while (v246 != v63);
    v562 = v64;
  }
LABEL_417:
  std::__tree<std::__value_type<int,ObservedParabola>,std::__map_value_compare<int,std::__value_type<int,ObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,ObservedParabola>>>::destroy(*(void **)(v596 + 192));
  *(void *)(v596 + 184) = v596 + 192;
  v574 = (uint64_t *)(v596 + 192);
  *(void *)(v596 + 192) = 0;
  *(void *)(v596 + 200) = 0;
  v257 = *(uint64_t ***)(v596 + 16);
  if (v257 != v62)
  {
    __asm { FMOV            V0.4S, #1.0 }
    uint64_t v595 = *((void *)&_Q0 + 1);
    do
    {
      *(_DWORD *)v603 = *((_DWORD *)v257 + 8);
      *(void *)&v603[16] = v257[6];
      memset(&v603[24], 0, 24);
      std::vector<CGPointWithPts>::__init_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>(&v603[24], v257[7], (uint64_t)v257[8], 0xAAAAAAAAAAAAAAABLL * (((char *)v257[8] - (char *)v257[7]) >> 4));
      *(_OWORD *)v604 = *((_OWORD *)v257 + 5);
      LODWORD(v605) = *((_DWORD *)v257 + 24);
      v607 = 0;
      v608 = 0;
      v606 = 0;
      std::vector<CGPointWithPts>::__init_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>(&v606, v257[13], (uint64_t)v257[14], 0xAAAAAAAAAAAAAAABLL * (((char *)v257[14] - (char *)v257[13]) >> 4));
      v609 = 0;
      v610 = 0;
      v611 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v609, v257[16], (uint64_t)v257[17], v257[17] - v257[16]);
      v612 = 0;
      v613 = 0;
      uint64_t v614 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v612, v257[19], (uint64_t)v257[20], v257[20] - v257[19]);
      long long v260 = *((_OWORD *)v257 + 12);
      long long v615 = *((_OWORD *)v257 + 11);
      long long v616 = v260;
      v617[0] = *((_DWORD *)v257 + 52);
      memcpy(v618, v257 + 28, sizeof(v618));
      v620 = 0;
      v621 = 0;
      v619 = 0;
      std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&v619, v257[88], (uint64_t)v257[89], ((char *)v257[89] - (char *)v257[88]) >> 4);
      v622 = 0;
      v623 = 0;
      uint64_t v624 = 0;
      std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&v622, v257[91], (uint64_t)v257[92], ((char *)v257[92] - (char *)v257[91]) >> 4);
      long long v625 = *((_OWORD *)v257 + 47);
      LODWORD(v626) = *((_DWORD *)v257 + 192);
      BYTE4(v626) = *((unsigned char *)v257 + 772);
      v628 = 0;
      uint64_t v629 = 0;
      v627 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v627, v257[97], (uint64_t)v257[98], ((char *)v257[98] - (char *)v257[97]) >> 2);
      v630 = v257[100];
      if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v607 - (unsigned char *)v606) >> 4) >= *(int *)(v596 + 212))
      {
        uint64_t v261 = v596 + 192;
        uint64_t v262 = *v574;
        v263 = (uint64_t **)(v596 + 192);
        if (*v574)
        {
          while (1)
          {
            while (1)
            {
              uint64_t v261 = v262;
              int v264 = *(_DWORD *)(v262 + 32);
              if (*(int *)v603 >= v264) {
                break;
              }
              uint64_t v262 = *(void *)v261;
              v263 = (uint64_t **)v261;
              if (!*(void *)v261) {
                goto LABEL_427;
              }
            }
            if (v264 >= *(int *)v603) {
              break;
            }
            uint64_t v262 = *(void *)(v261 + 8);
            if (!v262)
            {
              v263 = (uint64_t **)(v261 + 8);
              goto LABEL_427;
            }
          }
        }
        else
        {
LABEL_427:
          v265 = operator new(0xC0uLL);
          __src[1] = (void *)(v596 + 192);
          v265[8] = *(_DWORD *)v603;
          *((_OWORD *)v265 + 3) = 0u;
          *((_OWORD *)v265 + 4) = 0u;
          *((_OWORD *)v265 + 5) = 0u;
          *((_OWORD *)v265 + 6) = 0u;
          *((_OWORD *)v265 + 7) = 0u;
          *((_OWORD *)v265 + 8) = 0u;
          *((_OWORD *)v265 + 9) = 0u;
          *((_OWORD *)v265 + 10) = 0u;
          *((_OWORD *)v265 + 11) = 0u;
          v632[0] = 1;
          std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::__insert_node_at((uint64_t **)(v596 + 184), v261, v263, (uint64_t *)v265);
          __src[0] = 0;
          std::unique_ptr<std::__tree_node<std::__value_type<int,ObservedParabola>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,ObservedParabola>,void *>>>>::reset[abi:ne180100]((uint64_t)__src);
          uint64_t v261 = (uint64_t)v265;
        }
        objc_storeStrong((id *)(v261 + 48), *(id *)&v603[16]);
        v266 = 0;
        v267 = 0;
        if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v607 - (unsigned char *)v606) >> 4) >= 5) {
          int64_t v268 = 5;
        }
        else {
          int64_t v268 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v607 - (unsigned char *)v606) >> 4);
        }
        if (v268)
        {
          unint64_t v269 = 0;
          do
          {
            float32_t v270 = *((double *)v606 + 6 * (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v607 - (unsigned char *)v606) >> 4) - v268));
            v271.i64[1] = v595;
            v271.f32[0] = v270 * v270;
            v271.f32[1] = v270;
            float32x4_t v272 = vmulq_f32(v271, *(float32x4_t *)v604);
            double v273 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v272, 2), vaddq_f32(v272, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v272.f32, 1))).f32[0];
            double v274 = v270;
            if ((unint64_t)v267 >= v269)
            {
              uint64_t v275 = ((char *)v267 - (char *)v266) >> 4;
              unint64_t v276 = v275 + 1;
              if ((unint64_t)(v275 + 1) >> 60) {
                std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v269 - (void)v266) >> 3 > v276) {
                unint64_t v276 = (uint64_t)(v269 - (void)v266) >> 3;
              }
              if (v269 - (unint64_t)v266 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v277 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v277 = v276;
              }
              if (v277) {
                unint64_t v277 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v277);
              }
              else {
                uint64_t v278 = 0;
              }
              v279 = (double *)(v277 + 16 * v275);
              double *v279 = v274;
              v279[1] = v273;
              if (v267 == v266)
              {
                v281 = (double *)(v277 + 16 * v275);
              }
              else
              {
                unint64_t v280 = v277 + 16 * v275;
                do
                {
                  v281 = (double *)(v280 - 16);
                  *(_OWORD *)(v280 - 16) = *((_OWORD *)v267 - 1);
                  v267 -= 2;
                  v280 -= 16;
                }
                while (v267 != v266);
              }
              unint64_t v269 = v277 + 16 * v278;
              v267 = v279 + 2;
              if (v266) {
                operator delete(v266);
              }
              v266 = v281;
            }
            else
            {
              double *v267 = v274;
              v267[1] = v273;
              v267 += 2;
            }
            BOOL v126 = v268-- <= 1;
          }
          while (!v126);
        }
        std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)(v261 + 56), (char *)v266, (uint64_t)v267, ((char *)v267 - (char *)v266) >> 4);
        v62 = (uint64_t **)(v596 + 24);
        long long v282 = 0uLL;
        if (*(_DWORD *)(v596 + 124) && *(_DWORD *)(v596 + 128))
        {
          __src[0] = 0;
          std::vector<double>::vector(v599, ((unsigned char *)v610 - (unsigned char *)v609) >> 3, __src);
          __src[0] = 0;
          std::vector<double>::vector(&__p, ((char *)v613 - (unsigned char *)v612) >> 3, __src);
          v286 = (double *)v609;
          v287 = (double *)v610;
          v288 = v599[0];
          if (v609 != v610)
          {
            v289 = v599[0];
            float v290 = 1.0 / (float)*(int *)(v596 + 124);
            do
            {
              double v291 = *v286++;
              float v292 = v291;
              *v289++ = (float)(v290 * v292);
            }
            while (v286 != v287);
          }
          v293 = (double *)v612;
          v294 = v613;
          v295 = (double *)__p;
          if (v612 != v613)
          {
            v296 = (double *)__p;
            float v297 = 1.0 / (float)*(int *)(v596 + 128);
            do
            {
              double v298 = *v293++;
              float v299 = v298;
              *v296++ = (float)(v297 * v299);
            }
            while (v293 != v294);
          }
          polynomialFit((const double *)__src, v288, v295, v599[1] - v288, v283, v284, v285);
          std::function<std::vector<double> ()(double)>::operator()(*v599[0], (uint64_t)&v633, *(uint64_t *)&v632[8]);
          v300 = v633;
          double v302 = v633[2];
          double v301 = v633[3];
          double v303 = v633[1];
          *(double *)&long long v304 = v303 + v301 * -2.0 * v302;
          long long v565 = v304;
          float64_t v566 = v302;
          double v305 = *v633 + v302 * (v301 * v301) - v303 * v301;
          double *v633 = v305;
          *((void *)v300 + 1) = v304;
          std::__function::__value_func<std::vector<double> ()(double)>::~__value_func[abi:ne180100](__src);
          if (__p)
          {
            __p_8[0] = __p;
            operator delete(__p);
          }
          if (v599[0])
          {
            v599[1] = v599[0];
            operator delete(v599[0]);
          }
          v306.f64[0] = v566;
          *(void *)&v306.f64[1] = v565;
          *(float32x2_t *)&long long v307 = vcvt_f32_f64(v306);
          *(float *)v306.f64 = v305;
          *((void *)&v307 + 1) = __PAIR64__(HIDWORD(v565), LODWORD(v306.f64[0]));
          long long v567 = v307;
          operator delete(v300);
          long long v282 = v567;
        }
        *(_OWORD *)(v261 + 112) = v282;
        unint64_t v308 = ((unsigned char *)v607 - (unsigned char *)v606) / 48;
        if (v308 >= *(int *)(v596 + 212)) {
          unint64_t v309 = *(int *)(v596 + 212);
        }
        else {
          unint64_t v309 = ((unsigned char *)v607 - (unsigned char *)v606) / 48;
        }
        if (v309)
        {
          if (v309 >> 60) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          v310 = std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v309);
          bzero(v310, 16 * v309);
          uint64_t v311 = (uint64_t)v310 + 16 * v309;
        }
        else
        {
          v310 = 0;
          uint64_t v311 = 0;
        }
        if (v308 < v309)
        {
          LODWORD(v309) = 0;
          double v313 = 0.0;
        }
        else
        {
          uint64_t v312 = 48 * v308 - 48 * v309;
          double v313 = 0.0;
          unint64_t v314 = v309;
          v315 = v310;
          do
          {
            v316 = (float *)((char *)v606 + v312);
            *v315++ = *(_OWORD *)((char *)v606 + v312);
            double v313 = v313 + v316[10];
            v312 += 48;
            --v314;
          }
          while (v314);
        }
        *(float *)(v261 + 128) = fmaxf(*(float *)&v605, 0.0);
        std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)(v261 + 80), (char *)v310, v311, (v311 - (uint64_t)v310) >> 4);
        *(double *)(v261 + 104) = v313 / (double)(int)v309;
        v317 = v607;
        uint64_t v318 = *((void *)v606 + 4);
        *(_OWORD *)(v261 + 132) = *((_OWORD *)v606 + 1);
        *(void *)(v261 + 148) = v318;
        uint64_t v319 = *(v317 - 2);
        *(_OWORD *)(v261 + 156) = *((_OWORD *)v317 - 2);
        *(void *)(v261 + 172) = v319;
        if (v310) {
          operator delete(v310);
        }
        if (v266) {
          operator delete(v266);
        }
      }
      if (v627)
      {
        v628 = v627;
        operator delete(v627);
      }
      if (v622)
      {
        v623 = v622;
        operator delete(v622);
      }
      if (v619)
      {
        v620 = v619;
        operator delete(v619);
      }
      if (v612)
      {
        v613 = (double *)v612;
        operator delete(v612);
      }
      if (v609)
      {
        v610 = v609;
        operator delete(v609);
      }
      if (v606)
      {
        v607 = v606;
        operator delete(v606);
      }
      if (*(void *)&v603[24])
      {
        *(void *)&v603[32] = *(void *)&v603[24];
        operator delete(*(void **)&v603[24]);
      }

      v320 = v257[1];
      if (v320)
      {
        do
        {
          v321 = (uint64_t **)v320;
          v320 = (uint64_t *)*v320;
        }
        while (v320);
      }
      else
      {
        do
        {
          v321 = (uint64_t **)v257[2];
          _ZF = *v321 == (uint64_t *)v257;
          v257 = v321;
        }
        while (!_ZF);
      }
      v257 = v321;
    }
    while (v321 != v62);
  }
  if (v562) {
    operator delete(v562);
  }
LABEL_505:
  uint64_t v322 = v596;
  if (*(void *)(v596 + 96) >= 5uLL)
  {
    unint64_t v548 = 0;
    v560 = 0;
    __src[1] = 0;
    __src[0] = 0;
    v537 = (uint64_t **)(v596 + 16);
    *(void *)v632 = 0;
    uint64_t v532 = 0;
    v599[1] = 0;
    v599[0] = 0;
    v600 = 0;
    v533 = (_DWORD *)(v596 + 8);
    uint64_t v323 = 1;
    uint64_t v324 = 2;
    v536 = (uint64_t *)(v596 + 24);
    do
    {
      uint64_t v529 = v324;
      uint64_t v530 = v323;
      unint64_t v325 = v323;
      do
      {
        uint64_t v531 = v324;
        if (v325 <= 2)
        {
          v563 = (char *)v324;
          unint64_t v534 = v325;
          do
          {
            v326 = (uint64_t *)(*(void *)(*(void *)(v596 + 64) + 8 * ((*(void *)(v596 + 88) + v532) / 0xAAuLL))
                             + 24 * ((*(void *)(v596 + 88) + v532) % 0xAAuLL));
            uint64_t v327 = *v326;
            uint64_t v535 = v326[1];
            if (*v326 != v535)
            {
              do
              {
                double v328 = *(double *)v327;
                double v329 = *(double *)(v327 + 8);
                uint64_t v330 = *(void *)(v327 + 16);
                v633 = *(double **)(v327 + 28);
                int v634 = *(_DWORD *)(v327 + 36);
                v331 = (uint64_t *)(*(void *)(*(void *)(v596 + 64) + 8 * ((*(void *)(v596 + 88) + v325) / 0xAA))
                                 + 24 * ((*(void *)(v596 + 88) + v325) % 0xAA));
                uint64_t v332 = *v331;
                uint64_t v333 = v331[1];
                uint64_t v538 = v327;
                if (*v331 != v333)
                {
                  float v334 = *(float *)(v327 + 40);
                  int v544 = *(_DWORD *)(v327 + 44);
                  int v545 = *(_DWORD *)(v327 + 24);
                  uint64_t v546 = v330;
                  double v550 = (float)((float)v330 / (float)v545);
                  double v542 = v329;
                  double v543 = v328;
                  uint64_t v540 = v331[1];
                  float v541 = v334;
                  do
                  {
                    double v336 = *(double *)v332;
                    double v335 = *(double *)(v332 + 8);
                    uint64_t v337 = *(void *)(v332 + 16);
                    uint64_t v637 = *(void *)(v332 + 28);
                    int v638 = *(_DWORD *)(v332 + 36);
                    int v338 = *(_DWORD *)(v332 + 24);
                    v339 = (CMTime **)(*(void *)(*(void *)(v596 + 64)
                                                 + 8 * ((unint64_t)&v563[*(void *)(v596 + 88)] / 0xAA))
                                     + 24 * ((unint64_t)&v563[*(void *)(v596 + 88)] % 0xAA));
                    v341 = *v339;
                    v340 = v339[1];
                    if (*v339 != v340)
                    {
                      float v342 = *(float *)(v332 + 40);
                      int v556 = *(_DWORD *)(v332 + 44);
                      double v343 = vabdd_f64(v328, v336);
                      double v594 = v335;
                      double v591 = vabdd_f64(v329, v335);
                      double v554 = (float)((float)v337 / (float)v338);
                      double v575 = vabdd_f64(v336, v328);
                      double v580 = v336;
                      do
                      {
                        double v345 = *(double *)&v341->value;
                        double v344 = *(double *)&v341->timescale;
                        uint64_t epoch = v341->epoch;
                        int value = v341[1].value;
                        uint64_t v635 = *(CMTimeValue *)((char *)&v341[1].value + 4);
                        CMTimeFlags flags = v341[1].flags;
                        double v348 = (double)*(int *)(v596 + 220);
                        if (v343 < v348)
                        {
                          double v349 = (double)*(int *)(v596 + 228);
                          double v350 = vabdd_f64(v336, v345);
                          BOOL v351 = v591 < v349 && v350 < v348;
                          double v352 = vabdd_f64(v594, v344);
                          if (v351 && v352 < v349)
                          {
                            double v354 = v336;
                            float v355 = *(float *)&v341[1].epoch;
                            BOOL v356 = v329 < v594;
                            BOOL v357 = v329 > v594;
                            BOOL v358 = v328 < v354;
                            BOOL v359 = v328 > v354;
                            if (v354 <= v345) {
                              BOOL v359 = 0;
                            }
                            if (v354 >= v345) {
                              BOOL v358 = 0;
                            }
                            BOOL v589 = v358;
                            if (v594 <= v344) {
                              BOOL v357 = 0;
                            }
                            BOOL __dsta = v357;
                            if (v594 >= v344) {
                              BOOL v356 = 0;
                            }
                            BOOL v585 = v356;
                            BOOL v583 = v359;
                            if (v359 || v358 || v357 || v356)
                            {
                              int epoch_high = HIDWORD(v341[1].epoch);
                              double v572 = v343;
                              v570 = v340;
                              int v576 = v338;
                              uint64_t v578 = v337;
                              if (-[VNParabolaDetection isValidRadius:withPrecedingRadius:]((float *)v596, v342, v334))
                              {
                                if (-[VNParabolaDetection isValidRadius:withPrecedingRadius:]((float *)v596, v355, v342))
                                {
                                  uint64_t v547 = v332;
                                  v360 = v599[0];
                                  v361 = v600;
                                  v599[1] = v599[0];
                                  if (v599[0] >= v600)
                                  {
                                    unint64_t v363 = ((char *)v600 - (char *)v599[0]) >> 2;
                                    if (v363 <= 1) {
                                      unint64_t v363 = 1;
                                    }
                                    if ((unint64_t)((char *)v600 - (char *)v599[0]) >= 0x7FFFFFFFFFFFFFF8) {
                                      unint64_t v364 = 0x1FFFFFFFFFFFFFFFLL;
                                    }
                                    else {
                                      unint64_t v364 = v363;
                                    }
                                    v365 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v364);
                                    double *v365 = v328;
                                    v362 = v365 + 1;
                                    v361 = &v365[v366];
                                    v599[0] = v365;
                                    v600 = v361;
                                    if (v360) {
                                      operator delete(v360);
                                    }
                                  }
                                  else
                                  {
                                    *v599[0] = v328;
                                    v362 = v360 + 1;
                                  }
                                  unint64_t v367 = v548;
                                  uint64_t v368 = v578;
                                  int v369 = v576;
                                  v599[1] = v362;
                                  if ((unint64_t)v560 >= v548)
                                  {
                                    unint64_t v371 = (uint64_t)(v548 - (void)v560) >> 2;
                                    if (v371 <= 1) {
                                      unint64_t v371 = 1;
                                    }
                                    if (v548 - (unint64_t)v560 >= 0x7FFFFFFFFFFFFFF8) {
                                      unint64_t v372 = 0x1FFFFFFFFFFFFFFFLL;
                                    }
                                    else {
                                      unint64_t v372 = v371;
                                    }
                                    v374 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v372);
                                    unint64_t v367 = (unint64_t)&v374[v373];
                                    double *v374 = v329;
                                    v370 = v374 + 1;
                                    if (v560)
                                    {
                                      v375 = &v374[v373];
                                      operator delete(v560);
                                      unint64_t v367 = (unint64_t)v375;
                                      v362 = v599[1];
                                      v361 = v600;
                                    }
                                    v560 = v374;
                                    uint64_t v368 = v578;
                                    int v369 = v576;
                                  }
                                  else
                                  {
                                    double *v560 = v329;
                                    v370 = v560 + 1;
                                  }
                                  if (v362 >= v361)
                                  {
                                    unint64_t v377 = v367;
                                    v378 = v599[0];
                                    uint64_t v379 = v362 - v599[0];
                                    unint64_t v380 = v379 + 1;
                                    if ((unint64_t)(v379 + 1) >> 61) {
                                      goto LABEL_821;
                                    }
                                    if (((char *)v361 - (char *)v599[0]) >> 2 > v380) {
                                      unint64_t v380 = ((char *)v361 - (char *)v599[0]) >> 2;
                                    }
                                    if ((unint64_t)((char *)v361 - (char *)v599[0]) >= 0x7FFFFFFFFFFFFFF8) {
                                      unint64_t v381 = 0x1FFFFFFFFFFFFFFFLL;
                                    }
                                    else {
                                      unint64_t v381 = v380;
                                    }
                                    if (v381) {
                                      unint64_t v381 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v381);
                                    }
                                    else {
                                      uint64_t v382 = 0;
                                    }
                                    v383 = (double *)(v381 + 8 * v379);
                                    double *v383 = v580;
                                    v376 = v383 + 1;
                                    while (v362 != v378)
                                    {
                                      uint64_t v384 = *((void *)v362-- - 1);
                                      *((void *)v383-- - 1) = v384;
                                    }
                                    v361 = (double *)(v381 + 8 * v382);
                                    v599[0] = v383;
                                    v600 = v361;
                                    if (v378) {
                                      operator delete(v378);
                                    }
                                    unint64_t v367 = v377;
                                    uint64_t v368 = v578;
                                    int v369 = v576;
                                  }
                                  else
                                  {
                                    double *v362 = v580;
                                    v376 = v362 + 1;
                                  }
                                  v599[1] = v376;
                                  if ((unint64_t)v370 >= v367)
                                  {
                                    unint64_t v386 = v367;
                                    uint64_t v387 = v370 - v560;
                                    unint64_t v388 = v387 + 1;
                                    if ((unint64_t)(v387 + 1) >> 61) {
                                      goto LABEL_821;
                                    }
                                    if ((uint64_t)(v386 - (void)v560) >> 2 > v388) {
                                      unint64_t v388 = (uint64_t)(v386 - (void)v560) >> 2;
                                    }
                                    if (v386 - (unint64_t)v560 >= 0x7FFFFFFFFFFFFFF8) {
                                      unint64_t v389 = 0x1FFFFFFFFFFFFFFFLL;
                                    }
                                    else {
                                      unint64_t v389 = v388;
                                    }
                                    if (v389) {
                                      unint64_t v389 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v389);
                                    }
                                    else {
                                      uint64_t v390 = 0;
                                    }
                                    v385 = (double *)(v389 + 8 * v387);
                                    double *v385 = v594;
                                    v391 = v385;
                                    if (v370 != v560)
                                    {
                                      v391 = v385;
                                      do
                                      {
                                        uint64_t v392 = *((void *)v370-- - 1);
                                        *((void *)v391-- - 1) = v392;
                                      }
                                      while (v370 != v560);
                                    }
                                    unint64_t v393 = v389 + 8 * v390;
                                    operator delete(v560);
                                    unint64_t v367 = v393;
                                    v376 = v599[1];
                                    v361 = v600;
                                    v560 = v391;
                                    uint64_t v368 = v578;
                                    int v369 = v576;
                                  }
                                  else
                                  {
                                    double *v370 = v594;
                                    v385 = v370;
                                  }
                                  if (v376 >= v361)
                                  {
                                    unint64_t v395 = v367;
                                    v396 = v599[0];
                                    uint64_t v397 = v376 - v599[0];
                                    unint64_t v398 = v397 + 1;
                                    if ((unint64_t)(v397 + 1) >> 61) {
                                      goto LABEL_821;
                                    }
                                    if (((char *)v361 - (char *)v599[0]) >> 2 > v398) {
                                      unint64_t v398 = ((char *)v361 - (char *)v599[0]) >> 2;
                                    }
                                    if ((unint64_t)((char *)v361 - (char *)v599[0]) >= 0x7FFFFFFFFFFFFFF8) {
                                      unint64_t v399 = 0x1FFFFFFFFFFFFFFFLL;
                                    }
                                    else {
                                      unint64_t v399 = v398;
                                    }
                                    if (v399) {
                                      unint64_t v399 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v399);
                                    }
                                    else {
                                      uint64_t v400 = 0;
                                    }
                                    v401 = (double *)(v399 + 8 * v397);
                                    double *v401 = v345;
                                    for (i = v401 + 1; v376 != v396; --v401)
                                    {
                                      uint64_t v402 = *((void *)v376-- - 1);
                                      *((void *)v401 - 1) = v402;
                                    }
                                    v599[0] = v401;
                                    v600 = (double *)(v399 + 8 * v400);
                                    if (v396) {
                                      operator delete(v396);
                                    }
                                    unint64_t v367 = v395;
                                    uint64_t v368 = v578;
                                    int v369 = v576;
                                  }
                                  else
                                  {
                                    double *v376 = v345;
                                    i = v376 + 1;
                                  }
                                  v403 = v385 + 1;
                                  v599[1] = i;
                                  if ((unint64_t)(v385 + 1) >= v367)
                                  {
                                    unint64_t v404 = v367;
                                    uint64_t v405 = v403 - v560;
                                    unint64_t v406 = v405 + 1;
                                    if ((unint64_t)(v405 + 1) >> 61) {
LABEL_821:
                                    }
                                      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                    if ((uint64_t)(v404 - (void)v560) >> 2 > v406) {
                                      unint64_t v406 = (uint64_t)(v404 - (void)v560) >> 2;
                                    }
                                    if (v404 - (unint64_t)v560 >= 0x7FFFFFFFFFFFFFF8) {
                                      unint64_t v407 = 0x1FFFFFFFFFFFFFFFLL;
                                    }
                                    else {
                                      unint64_t v407 = v406;
                                    }
                                    if (v407) {
                                      unint64_t v407 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v407);
                                    }
                                    else {
                                      uint64_t v408 = 0;
                                    }
                                    v409 = (double *)(v407 + 8 * v405);
                                    double *v409 = v344;
                                    v410 = v409 + 1;
                                    if (v403 == v560)
                                    {
                                      v411 = v560;
                                    }
                                    else
                                    {
                                      v411 = v560;
                                      do
                                      {
                                        uint64_t v412 = *((void *)v403-- - 1);
                                        *((void *)v409-- - 1) = v412;
                                      }
                                      while (v403 != v560);
                                    }
                                    v539 = v410;
                                    unint64_t v413 = v407 + 8 * v408;
                                    operator delete(v411);
                                    unint64_t v367 = v413;
                                    v560 = v409;
                                    uint64_t v368 = v578;
                                    int v369 = v576;
                                  }
                                  else
                                  {
                                    v385[1] = v344;
                                    v539 = v385 + 2;
                                  }
                                  unint64_t v548 = v367;
                                  v414 = (double *)__src[0];
                                  unint64_t v415 = *(void *)v632;
                                  __src[1] = __src[0];
                                  if (__src[0] >= (void *)*(void *)v632)
                                  {
                                    unint64_t v417 = 0x5555555555555556
                                         * ((uint64_t)(*(void *)v632 - (unint64_t)__src[0]) >> 4);
                                    if (v417 <= 1) {
                                      unint64_t v417 = 1;
                                    }
                                    if (0xAAAAAAAAAAAAAAABLL
                                       * ((uint64_t)(*(void *)v632 - (unint64_t)__src[0]) >> 4) >= 0x2AAAAAAAAAAAAAALL)
                                      unint64_t v418 = 0x555555555555555;
                                    else {
                                      unint64_t v418 = v417;
                                    }
                                    v419 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v418);
                                    *(double *)v419 = v328;
                                    *((double *)v419 + 1) = v329;
                                    unint64_t v415 = (unint64_t)&v419[48 * v420];
                                    *((void *)v419 + 2) = v546;
                                    *((_DWORD *)v419 + 6) = v545;
                                    *(void *)(v419 + 28) = v633;
                                    *((_DWORD *)v419 + 9) = v634;
                                    *((float *)v419 + 10) = v334;
                                    *((_DWORD *)v419 + 11) = v544;
                                    v416 = (double *)(v419 + 48);
                                    __src[0] = v419;
                                    *(void *)v632 = v415;
                                    if (v414) {
                                      operator delete(v414);
                                    }
                                    v414 = (double *)v419;
                                    uint64_t v368 = v578;
                                    int v369 = v576;
                                  }
                                  else
                                  {
                                    *(double *)__src[0] = v328;
                                    v414[1] = v329;
                                    *((void *)v414 + 2) = v546;
                                    *((_DWORD *)v414 + 6) = v545;
                                    *(void *)((char *)v414 + 28) = v633;
                                    *((_DWORD *)v414 + 9) = v634;
                                    *((float *)v414 + 10) = v334;
                                    *((_DWORD *)v414 + 11) = v544;
                                    v416 = v414 + 6;
                                  }
                                  __src[1] = v416;
                                  if ((unint64_t)v416 >= v415)
                                  {
                                    unint64_t v422 = 0xAAAAAAAAAAAAAAABLL * (((char *)v416 - (char *)v414) >> 4) + 1;
                                    if (v422 > 0x555555555555555) {
                                      goto LABEL_822;
                                    }
                                    if (0x5555555555555556 * ((uint64_t)(v415 - (void)v414) >> 4) > v422) {
                                      unint64_t v422 = 0x5555555555555556 * ((uint64_t)(v415 - (void)v414) >> 4);
                                    }
                                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v415 - (void)v414) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
                                      unint64_t v423 = 0x555555555555555;
                                    }
                                    else {
                                      unint64_t v423 = v422;
                                    }
                                    if (v423) {
                                      unint64_t v423 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v423);
                                    }
                                    else {
                                      uint64_t v424 = 0;
                                    }
                                    v421 = (double *)(v423 + 16 * (((char *)v416 - (char *)v414) >> 4));
                                    double *v421 = v580;
                                    v421[1] = v594;
                                    *((void *)v421 + 2) = v578;
                                    *((_DWORD *)v421 + 6) = v576;
                                    *(void *)((char *)v421 + 28) = v637;
                                    *((_DWORD *)v421 + 9) = v638;
                                    *((float *)v421 + 10) = v342;
                                    *((_DWORD *)v421 + 11) = v556;
                                    v425 = v421;
                                    if (v416 != v414)
                                    {
                                      unint64_t v426 = v423 + 16 * (((char *)v416 - (char *)v414) >> 4);
                                      do
                                      {
                                        long long v427 = *((_OWORD *)v416 - 3);
                                        long long v428 = *((_OWORD *)v416 - 2);
                                        v425 = (double *)(v426 - 48);
                                        *(_OWORD *)(v426 - 20) = *(_OWORD *)((char *)v416 - 20);
                                        *(_OWORD *)(v426 - 48) = v427;
                                        *(_OWORD *)(v426 - 32) = v428;
                                        v416 -= 6;
                                        v426 -= 48;
                                      }
                                      while (v416 != v414);
                                    }
                                    unint64_t v415 = v423 + 48 * v424;
                                    __src[0] = v425;
                                    *(void *)v632 = v415;
                                    operator delete(v414);
                                    v414 = v425;
                                  }
                                  else
                                  {
                                    double *v416 = v580;
                                    v416[1] = v594;
                                    *((void *)v416 + 2) = v368;
                                    *((_DWORD *)v416 + 6) = v369;
                                    *(void *)((char *)v416 + 28) = v637;
                                    *((_DWORD *)v416 + 9) = v638;
                                    *((float *)v416 + 10) = v342;
                                    *((_DWORD *)v416 + 11) = v556;
                                    v421 = v416;
                                  }
                                  v429 = v421 + 6;
                                  __src[1] = v421 + 6;
                                  if ((unint64_t)(v421 + 6) >= v415)
                                  {
                                    unint64_t v431 = 0xAAAAAAAAAAAAAAABLL * (((char *)v429 - (char *)v414) >> 4) + 1;
                                    if (v431 > 0x555555555555555) {
LABEL_822:
                                    }
                                      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                    if (0x5555555555555556 * ((uint64_t)(v415 - (void)v414) >> 4) > v431) {
                                      unint64_t v431 = 0x5555555555555556 * ((uint64_t)(v415 - (void)v414) >> 4);
                                    }
                                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v415 - (void)v414) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
                                      unint64_t v432 = 0x555555555555555;
                                    }
                                    else {
                                      unint64_t v432 = v431;
                                    }
                                    if (v432) {
                                      unint64_t v432 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v432);
                                    }
                                    else {
                                      uint64_t v433 = 0;
                                    }
                                    unint64_t v434 = v432 + 16 * (((char *)v429 - (char *)v414) >> 4);
                                    *(double *)unint64_t v434 = v345;
                                    *(double *)(v434 + 8) = v344;
                                    *(void *)(v434 + 16) = epoch;
                                    *(_DWORD *)(v434 + 24) = value;
                                    *(void *)(v434 + 28) = v635;
                                    *(_DWORD *)(v434 + 36) = flags;
                                    *(float *)(v434 + 40) = v355;
                                    *(_DWORD *)(v434 + 44) = epoch_high;
                                    if (v429 == v414)
                                    {
                                      v438 = (void *)(v432 + 16 * (((char *)v429 - (char *)v414) >> 4));
                                    }
                                    else
                                    {
                                      unint64_t v435 = v432 + 16 * (((char *)v429 - (char *)v414) >> 4);
                                      do
                                      {
                                        long long v436 = *((_OWORD *)v429 - 3);
                                        long long v437 = *((_OWORD *)v429 - 2);
                                        v438 = (void *)(v435 - 48);
                                        *(_OWORD *)(v435 - 20) = *(_OWORD *)((char *)v429 - 20);
                                        *(_OWORD *)(v435 - 48) = v436;
                                        *(_OWORD *)(v435 - 32) = v437;
                                        v429 -= 6;
                                        v435 -= 48;
                                      }
                                      while (v429 != v414);
                                    }
                                    v430 = (void *)(v434 + 48);
                                    __src[0] = v438;
                                    __src[1] = (void *)(v434 + 48);
                                    *(void *)v632 = v432 + 48 * v433;
                                    operator delete(v414);
                                    v414 = (double *)__src[0];
                                  }
                                  else
                                  {
                                    v421[6] = v345;
                                    v421[7] = v344;
                                    *((void *)v421 + 8) = epoch;
                                    *((_DWORD *)v421 + 18) = value;
                                    *(void *)((char *)v421 + 76) = v635;
                                    *((_DWORD *)v421 + 21) = flags;
                                    *((float *)v421 + 22) = v355;
                                    *((_DWORD *)v421 + 23) = epoch_high;
                                    v430 = v421 + 12;
                                  }
                                  __src[1] = v430;
                                  __p = 0;
                                  *(_OWORD *)__p_8 = 0uLL;
                                  std::vector<CGPointWithPts>::__assign_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>((char *)&__p, (char *)v414, (uint64_t)v430, 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v430 - (unsigned char *)v414) >> 4));
                                  float32x2_t v444 = -[VNParabolaDetection computeEquationCoefficients:yValues:]((uint64_t)v599, v560, v439, v440, v441, v442, v443);
                                  if ((unint64_t)v563 > 3)
                                  {
                                    char v549 = 0;
                                    float v557 = 3.4028e38;
                                  }
                                  else
                                  {
                                    char v549 = 0;
                                    double v552 = v444.f32[1];
                                    double v553 = v444.f32[0];
                                    double v551 = v445;
                                    double v569 = vabdd_f64(v345, v580);
                                    double v568 = (float)((float)epoch / (float)value);
                                    float v557 = 3.4028e38;
                                    unint64_t v446 = (unint64_t)v563;
                                    do
                                    {
                                      v447 = (uint64_t *)(*(void *)(*(void *)(v596 + 64)
                                                                   + 8 * ((*(void *)(v596 + 88) + v446 + 1) / 0xAA))
                                                       + 24 * ((*(void *)(v596 + 88) + v446 + 1) % 0xAA));
                                      uint64_t v448 = *v447;
                                      uint64_t v449 = v447[1];
                                      while (v448 != v449)
                                      {
                                        double v450 = *(double *)v448;
                                        double v451 = *(double *)(v448 + 8);
                                        uint64_t v452 = *(void *)(v448 + 16);
                                        int v453 = *(_DWORD *)(v448 + 24);
                                        *(void *)v603 = *(void *)(v448 + 28);
                                        *(_DWORD *)&v603[8] = *(_DWORD *)(v448 + 36);
                                        double v454 = vabdd_f64(v450, v345);
                                        if (v454 < (double)*(int *)(v596 + 220))
                                        {
                                          double v455 = vabdd_f64(v451, v344);
                                          if (v455 < (double)*(int *)(v596 + 228))
                                          {
                                            int v456 = *(_DWORD *)(v448 + 40);
                                            int v457 = *(_DWORD *)(v448 + 44);
                                            if ((v454 > (double)*(int *)(v596 + 216)
                                               || v455 > (double)*(int *)(v596 + 224))
                                              && -[VNParabolaDetection isValidRadius:withPrecedingRadius:]((float *)v596, *(float *)(v448 + 40), v355))
                                            {
                                              int v458 = v589;
                                              if (v345 >= v450) {
                                                int v458 = 0;
                                              }
                                              if (v583 && v345 > v450) {
                                                int v459 = 2;
                                              }
                                              else {
                                                int v459 = v458;
                                              }
                                              BOOL v460 = __dsta;
                                              if (v344 <= v451) {
                                                BOOL v460 = 0;
                                              }
                                              if (v585 && v344 < v451) {
                                                int v461 = v459 | 4;
                                              }
                                              else {
                                                int v461 = v459;
                                              }
                                              int v462 = v459 | 8;
                                              if (v460) {
                                                unsigned int v463 = v462;
                                              }
                                              else {
                                                unsigned int v463 = v461;
                                              }
                                              if (v463 > 8 || ((1 << v463) & 0x111) == 0)
                                              {
                                                float v465 = *(float *)(v596 + 208);
                                                float v466 = v575 / ((v554 - v550) * v465);
                                                float v467 = v569 / ((v568 - v554) * v465);
                                                double v468 = (float)((float)v452 / (float)v453) - v568;
                                                float v469 = v454 / (v468 * v465);
                                                float v470 = (float)((float)(v466 + v467) + v469) / 3.0;
                                                if (sqrtf((float)((float)((float)((float)((float)(v466 - v470)* (float)(v466 - v470))+ 0.0)+ (float)((float)(v467 - v470)* (float)(v467 - v470)))+ (float)((float)(v469 - v470) * (float)(v469 - v470)))/ 3.0) <= *(float *)(v596 + 172))
                                                {
                                                  float v471 = v451 - (v450 * v552 + v553 * (v450 * v450) + v551);
                                                  float v472 = fabsf(v471);
                                                  float v473 = v468;
                                                  if (v472 <= (float)(fminf(v465 * v473, *(float *)(v596 + 144))
                                                                     * *(float *)(v596 + 112))
                                                    && v557 > v472)
                                                  {
                                                    v474 = (char *)__p_8[0];
                                                    if (__p_8[0] >= __p_8[1])
                                                    {
                                                      v477 = __p;
                                                      unint64_t v478 = 0xAAAAAAAAAAAAAAABLL
                                                           * (((char *)__p_8[0] - (char *)__p) >> 4)
                                                           + 1;
                                                      if (v478 > 0x555555555555555) {
                                                        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                                      }
                                                      unint64_t v558 = 0xAAAAAAAAAAAAAAABLL
                                                           * (((char *)__p_8[0] - (char *)__p) >> 4);
                                                      if (0x5555555555555556
                                                         * (((char *)__p_8[1] - (char *)__p) >> 4) > v478)
                                                        unint64_t v478 = 0x5555555555555556
                                                             * (((char *)__p_8[1] - (char *)__p) >> 4);
                                                      if (0xAAAAAAAAAAAAAAABLL
                                                         * (((char *)__p_8[1] - (char *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL)
                                                        unint64_t v479 = 0x555555555555555;
                                                      else {
                                                        unint64_t v479 = v478;
                                                      }
                                                      if (v479) {
                                                        unint64_t v479 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v479);
                                                      }
                                                      else {
                                                        uint64_t v480 = 0;
                                                      }
                                                      v481 = (char *)(v479 + 48 * v558);
                                                      *(double *)v481 = v450;
                                                      *((double *)v481 + 1) = v451;
                                                      *((void *)v481 + 2) = v452;
                                                      *((_DWORD *)v481 + 6) = v453;
                                                      *(void *)(v481 + 28) = *(void *)v603;
                                                      *((_DWORD *)v481 + 9) = *(_DWORD *)&v603[8];
                                                      *((_DWORD *)v481 + 10) = v456;
                                                      *((_DWORD *)v481 + 11) = v457;
                                                      v476 = v481;
                                                      if (v474 != v477)
                                                      {
                                                        do
                                                        {
                                                          long long v482 = *((_OWORD *)v474 - 3);
                                                          long long v483 = *((_OWORD *)v474 - 2);
                                                          *(_OWORD *)(v476 - 20) = *(_OWORD *)(v474 - 20);
                                                          *((_OWORD *)v476 - 3) = v482;
                                                          *((_OWORD *)v476 - 2) = v483;
                                                          v476 -= 48;
                                                          v474 -= 48;
                                                        }
                                                        while (v474 != v477);
                                                        v474 = v477;
                                                      }
                                                      uint64_t v475 = (uint64_t)(v481 + 48);
                                                      __p = v476;
                                                      __p_8[1] = (void *)(v479 + 48 * v480);
                                                      if (v474) {
                                                        operator delete(v474);
                                                      }
                                                    }
                                                    else
                                                    {
                                                      *(double *)__p_8[0] = v450;
                                                      *((double *)v474 + 1) = v451;
                                                      *((void *)v474 + 2) = v452;
                                                      *((_DWORD *)v474 + 6) = v453;
                                                      *(void *)(v474 + 28) = *(void *)v603;
                                                      *((_DWORD *)v474 + 9) = *(_DWORD *)&v603[8];
                                                      *((_DWORD *)v474 + 10) = v456;
                                                      *((_DWORD *)v474 + 11) = v457;
                                                      uint64_t v475 = (uint64_t)(v474 + 48);
                                                      v476 = __p;
                                                    }
                                                    __p_8[0] = (void *)v475;
                                                    std::vector<CGPointWithPts>::__assign_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>((char *)__src, v476, v475, 0xAAAAAAAAAAAAAAABLL * ((v475 - (uint64_t)v476) >> 4));
                                                    __p_8[0] = (char *)__p_8[0] - 48;
                                                    char v549 = v463;
                                                    float v557 = v472;
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                        v448 += 48;
                                      }
                                      _CF = v446++ >= 3;
                                    }
                                    while (!_CF);
                                  }
                                  v484 = (double *)__src[0];
                                  if (0xAAAAAAAAAAAAAAABLL * (((char *)__src[1] - (char *)__src[0]) >> 4) <= 3)
                                  {
                                    double v329 = v542;
                                    double v328 = v543;
                                    uint64_t v332 = v547;
                                    uint64_t v333 = v540;
                                    float v334 = v541;
                                    double v336 = v580;
                                    double v343 = v572;
                                  }
                                  else
                                  {
                                    v485 = *v537;
                                    double v329 = v542;
                                    double v328 = v543;
                                    float v334 = v541;
                                    double v336 = v580;
                                    double v343 = v572;
                                    if (*v537 == v536)
                                    {
LABEL_734:
                                      InternalObservedParabola::InternalObservedParabola((InternalObservedParabola *)v603);
                                      if (+[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, (float *)v603, v484)&& +[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, (float *)v603, v484 + 6)&& +[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, (float *)v603, v484 + 12)&& (v493 = v484 + 18, +[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, (float *)v603, v484 + 18)))
                                      {
                                        v494 = v599[1];
                                        if (v599[1] >= v600)
                                        {
                                          v496 = v599[0];
                                          int64_t v497 = v599[1] - v599[0];
                                          unint64_t v498 = v497 + 1;
                                          if ((unint64_t)(v497 + 1) >> 61) {
                                            goto LABEL_824;
                                          }
                                          uint64_t v499 = (char *)v600 - (char *)v599[0];
                                          if (((char *)v600 - (char *)v599[0]) >> 2 > v498) {
                                            unint64_t v498 = v499 >> 2;
                                          }
                                          if ((unint64_t)v499 >= 0x7FFFFFFFFFFFFFF8) {
                                            unint64_t v500 = 0x1FFFFFFFFFFFFFFFLL;
                                          }
                                          else {
                                            unint64_t v500 = v498;
                                          }
                                          if (v500) {
                                            unint64_t v500 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v500);
                                          }
                                          else {
                                            uint64_t v501 = 0;
                                          }
                                          v502 = (double *)(v500 + 8 * v497);
                                          double *v502 = *v493;
                                          v495 = v502 + 1;
                                          while (v494 != v496)
                                          {
                                            uint64_t v503 = *((void *)v494-- - 1);
                                            *((void *)v502-- - 1) = v503;
                                          }
                                          v599[0] = v502;
                                          v600 = (double *)(v500 + 8 * v501);
                                          if (v496) {
                                            operator delete(v496);
                                          }
                                        }
                                        else
                                        {
                                          *v599[1] = *v493;
                                          v495 = v494 + 1;
                                        }
                                        v599[1] = v495;
                                        if ((unint64_t)v539 >= v548)
                                        {
                                          uint64_t v505 = v539 - v560;
                                          unint64_t v506 = v505 + 1;
                                          if ((unint64_t)(v505 + 1) >> 61) {
LABEL_824:
                                          }
                                            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                          if ((uint64_t)(v548 - (void)v560) >> 2 > v506) {
                                            unint64_t v506 = (uint64_t)(v548 - (void)v560) >> 2;
                                          }
                                          if (v548 - (unint64_t)v560 >= 0x7FFFFFFFFFFFFFF8) {
                                            unint64_t v507 = 0x1FFFFFFFFFFFFFFFLL;
                                          }
                                          else {
                                            unint64_t v507 = v506;
                                          }
                                          if (v507) {
                                            unint64_t v507 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v507);
                                          }
                                          else {
                                            uint64_t v508 = 0;
                                          }
                                          v509 = (double *)(v507 + 8 * v505);
                                          double *v509 = v484[19];
                                          v504 = v509 + 1;
                                          v510 = v539;
                                          if (v539 == v560)
                                          {
                                            v511 = v560;
                                          }
                                          else
                                          {
                                            v511 = v560;
                                            do
                                            {
                                              uint64_t v512 = *((void *)v510-- - 1);
                                              *((void *)v509-- - 1) = v512;
                                            }
                                            while (v510 != v560);
                                          }
                                          unint64_t v548 = v507 + 8 * v508;
                                          operator delete(v511);
                                          v560 = v509;
                                        }
                                        else
                                        {
                                          double *v539 = v484[19];
                                          v504 = v539 + 1;
                                        }
                                        uint64_t v513 = [MEMORY[0x1E4F29128] UUID];
                                        v514 = *(void **)v603;
                                        *(void *)v603 = v513;

                                        v515 = (char *)__src[0];
                                        v516 = __src[1];
                                        unint64_t v517 = 0xAAAAAAAAAAAAAAABLL * (((char *)__src[1] - (char *)__src[0]) >> 4);
                                        std::vector<CGPointWithPts>::__assign_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>(&v603[8], (char *)__src[0], (uint64_t)__src[1], v517);
                                        std::vector<CGPointWithPts>::__assign_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>((char *)&v604[1], v515, (uint64_t)v516, v517);
                                        *(float32x2_t *)&long long v523 = -[VNParabolaDetection computeEquationCoefficients:yValues:]((uint64_t)v599, v560, v518, v519, v520, v521, v522);
                                        *(_OWORD *)&v603[32] = v523;
                                        v524 = (char *)v599[0];
                                        LODWORD(v604[0]) = -[VNParabolaDetection getRsquareOfEquation:yValues:equationConstants:](v599[0], v560, v504, (float *)&v603[32]);
                                        std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)&v607, v524, (uint64_t)v599[1], ((char *)v599[1] - v524) >> 3);
                                        std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)&v610, (char *)v560, (uint64_t)v504, v504 - v560);
                                        v525 = (CGPoint *)__src[0];
                                        KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)v617, *(CGPoint *)__src[0]);
                                        KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)v617, v525[3]);
                                        KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)v617, v525[6]);
                                        KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)v617, v525[9]);
                                        float v526 = fmax(v557 + v557 * 0.5, fmax(*(float *)(v596 + 116), (double)(2 * *(_DWORD *)(v596 + 236))));
                                        *(float *)&long long v616 = v526;
                                        *(float *)&long long v625 = v526;
                                        BYTE4(v625) = v549;
                                        v527 = (_DWORD *)*((void *)&v625 + 1);
                                        **((_DWORD **)&v625 + 1) = LODWORD(v525[2].y);
                                        v527[1] = LODWORD(v525[5].y);
                                        v527[2] = LODWORD(v525[8].y);
                                        v527[3] = LODWORD(v525[11].y);
                                        *(float *)&v628 = (float)((float)((float)(*(float *)&v525[2].y
                                                                                + *(float *)&v525[5].y)
                                                                        + *(float *)&v525[8].y)
                                                                + *(float *)&v525[11].y)
                                                        * 0.25;
                                        *((float *)&v628 + 1) = v557;
                                        v528 = std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v537, *(_DWORD *)(v596 + 8), v533);
                                        InternalObservedParabola::operator=((uint64_t)(v528 + 6), (uint64_t)v603);
                                        __src[1] = v525;
                                        ++*v533;
                                        if (*((void *)&v625 + 1))
                                        {
                                          uint64_t v626 = *((void *)&v625 + 1);
                                          operator delete(*((void **)&v625 + 1));
                                        }
                                        uint64_t v332 = v547;
                                        uint64_t v333 = v540;
                                        if (v620)
                                        {
                                          v621 = v620;
                                          operator delete(v620);
                                        }
                                        if (v618[58])
                                        {
                                          v618[59] = v618[58];
                                          operator delete(v618[58]);
                                        }
                                        if (v610)
                                        {
                                          v611 = v610;
                                          operator delete(v610);
                                        }
                                        if (v607)
                                        {
                                          v608 = v607;
                                          operator delete(v607);
                                        }
                                        if (v604[1])
                                        {
                                          v605 = v604[1];
                                          operator delete(v604[1]);
                                        }
                                        if (*(void *)&v603[8])
                                        {
                                          *(void *)&v603[16] = *(void *)&v603[8];
                                          operator delete(*(void **)&v603[8]);
                                        }
                                      }
                                      else
                                      {
                                        if (*((void *)&v625 + 1))
                                        {
                                          uint64_t v626 = *((void *)&v625 + 1);
                                          operator delete(*((void **)&v625 + 1));
                                        }
                                        uint64_t v332 = v547;
                                        uint64_t v333 = v540;
                                        if (v620)
                                        {
                                          v621 = v620;
                                          operator delete(v620);
                                        }
                                        if (v618[58])
                                        {
                                          v618[59] = v618[58];
                                          operator delete(v618[58]);
                                        }
                                        if (v610)
                                        {
                                          v611 = v610;
                                          operator delete(v610);
                                        }
                                        if (v607)
                                        {
                                          v608 = v607;
                                          operator delete(v607);
                                        }
                                        if (v604[1])
                                        {
                                          v605 = v604[1];
                                          operator delete(v604[1]);
                                        }
                                        if (*(void *)&v603[8])
                                        {
                                          *(void *)&v603[16] = *(void *)&v603[8];
                                          operator delete(*(void **)&v603[8]);
                                        }
                                      }
                                    }
                                    else
                                    {
                                      while (1)
                                      {
                                        if (__src[0] != __src[1])
                                        {
                                          unsigned int v486 = 0;
                                          v487 = (double *)__src[0];
                                          do
                                          {
                                            double v488 = *v487;
                                            double v489 = v487[1];
                                            v487 += 6;
                                            if (*(_DWORD *)(v596 + 236) >= (int)vabdd_f64(v489, v488 * *((float *)v485 + 21)+ v488 * *((float *)v485 + 20) * v488+ *((float *)v485 + 22)))++v486; {
                                          }
                                            }
                                          while (v487 != __src[1]);
                                          if (v486 > 1)
                                          {
                                            float v490 = ((float)((float)*((uint64_t *)__src[0] + 20)
                                                          / (float)*((int *)__src[0] + 42))
                                                  - (float)((float)*(uint64_t *)(v485[14] - 32)
                                                          / (float)*(int *)(v485[14] - 24)))
                                                 * *(float *)(v596 + 208);
                                            if ((float)(*(float *)(v596 + 144) * *(float *)(v596 + 176)) > v490) {
                                              break;
                                            }
                                          }
                                        }
                                        v491 = (uint64_t *)v485[1];
                                        if (v491)
                                        {
                                          do
                                          {
                                            v492 = v491;
                                            v491 = (uint64_t *)*v491;
                                          }
                                          while (v491);
                                        }
                                        else
                                        {
                                          do
                                          {
                                            v492 = (uint64_t *)v485[2];
                                            _ZF = *v492 == (void)v485;
                                            v485 = v492;
                                          }
                                          while (!_ZF);
                                        }
                                        v485 = v492;
                                        if (v492 == v536) {
                                          goto LABEL_734;
                                        }
                                      }
                                      uint64_t v332 = v547;
                                      uint64_t v333 = v540;
                                    }
                                  }
                                  if (__p) {
                                    operator delete(__p);
                                  }
                                  uint64_t v337 = v578;
                                  int v338 = v576;
                                  v340 = v570;
                                }
                                else
                                {
                                  double v336 = v580;
                                  uint64_t v337 = v578;
                                  int v338 = v576;
                                  v340 = v570;
                                }
                              }
                              else
                              {
                                double v336 = v580;
                                uint64_t v337 = v578;
                                int v338 = v576;
                                v340 = v570;
                              }
                            }
                            else
                            {
                              double v336 = v580;
                            }
                          }
                        }
                        v341 += 2;
                      }
                      while (v341 != v340);
                    }
                    v332 += 48;
                  }
                  while (v332 != v333);
                }
                uint64_t v327 = v538 + 48;
                unint64_t v325 = v534;
              }
              while (v538 + 48 != v535);
            }
            _CF = (unint64_t)v563++ >= 3;
          }
          while (!_CF);
        }
        ++v325;
        uint64_t v324 = v531 + 1;
      }
      while (v325 != 3);
      uint64_t v324 = v529 + 1;
      uint64_t v323 = v530 + 1;
      uint64_t v532 = 1;
    }
    while (v530 != 2);
    if (v560) {
      operator delete(v560);
    }
    if (v599[0]) {
      operator delete(v599[0]);
    }
    if (__src[0]) {
      operator delete(__src[0]);
    }
    uint64_t v322 = v596;
  }
  return v322 + 184;
}

- (float32x2_t)computeEquationCoefficients:(uint64_t)a3 yValues:(uint64_t)a4
{
  v17[4] = *(double *)MEMORY[0x1E4F143B8];
  polynomialFit(v17, *(double **)a1, a2, (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3, a5, a6, a7);
  std::function<std::vector<double> ()(double)>::operator()(**(double **)a1, (uint64_t)&v16, *(uint64_t *)&v17[3]);
  unint64_t v8 = v16;
  double v10 = v16[2];
  double v9 = v16[3];
  double v11 = v16[1];
  double v14 = v11 + v9 * -2.0 * v10;
  float64_t v15 = v10;
  double *v16 = *v16 + v10 * (v9 * v9) - v11 * v9;
  v8[1] = v14;
  std::__function::__value_func<std::vector<double> ()(double)>::~__value_func[abi:ne180100](v17);
  operator delete(v8);
  v12.f64[0] = v15;
  v12.f64[1] = v14;
  return vcvt_f32_f64(v12);
}

- (BOOL)isValidRadius:(float)a3 withPrecedingRadius:
{
  float v3 = a1[41];
  BOOL v4 = v3 < a3;
  if (v3 >= a2) {
    BOOL v4 = 0;
  }
  float v5 = a1[39];
  if (v3 >= a3)
  {
    return fmaxf((float)(v5 * 1.25) * a3, v3) >= a2 && a2 > 0.0;
  }
  else if ((float)(v5 * a3) >= a2)
  {
    float v7 = 0.75;
    if (v4) {
      float v7 = 1.0;
    }
    return (float)((float)(v7 * a1[40]) * a3) <= a2;
  }
  else
  {
    return 0;
  }
}

+ (BOOL)updateMinMaxXYOfParabola:(double *)a3 withPoint:
{
  self;
  double v5 = a2[32];
  double v6 = *a3;
  BOOL result = *a3 < v5;
  float v8 = *a3;
  if (*a3 < v5) {
    a2[32] = v8;
  }
  double v9 = a3[1];
  float v10 = v9;
  if (v9 < a2[34])
  {
    a2[34] = v10;
    BOOL result = 1;
  }
  if (v6 > a2[33])
  {
    a2[33] = v8;
    BOOL result = 1;
  }
  if (v9 > a2[35])
  {
    a2[35] = v10;
    return 1;
  }
  return result;
}

- (float)getRsquareOfEquation:(double *)a3 yValues:(float *)a4 equationConstants:
{
  uint64_t v4 = (char *)a3 - (char *)a2;
  if (a3 == a2)
  {
    float v17 = NAN;
  }
  else
  {
    uint64_t v5 = v4 >> 3;
    if ((unint64_t)(v4 >> 3) <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v4 >> 3;
    }
    float v7 = 0.0;
    float v8 = a2;
    uint64_t v9 = v6;
    do
    {
      double v10 = *v8++;
      float v7 = v10 + v7;
      --v9;
    }
    while (v9);
    double v11 = (float)(v7 / (float)(unint64_t)v5);
    float v12 = 0.0;
    float v13 = 0.0;
    do
    {
      double v14 = *a1++;
      float v15 = v14 * a4[1] + *a4 * (v14 * v14) + a4[2];
      double v16 = *a2++;
      float v13 = (v16 - v15) * (v16 - v15) + v13;
      float v12 = (v16 - v11) * (v16 - v11) + v12;
      --v6;
    }
    while (v6);
    float v17 = v13 / v12;
  }
  return 1.0 - v17;
}

@end