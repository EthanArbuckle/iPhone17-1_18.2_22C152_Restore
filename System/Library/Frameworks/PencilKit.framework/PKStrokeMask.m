@interface PKStrokeMask
- (CGRect)_boundsWithTransform:(CGAffineTransform *)a3;
- (NSData)rawValue;
- (PKStrokeMask)initWithArchive:(const void *)a3;
- (PKStrokeMask)initWithBezierPath:(id)a3 stroke:(id)a4;
- (PKStrokeMask)initWithMaskPaths:(const void *)a3 centerlineSlices:(const void *)a4;
- (PKStrokeMask)initWithRawValue:(id)a3;
- (id).cxx_construct;
- (id)bezierPath;
- (id)maskTransformedBy:(id)a3;
- (void)_transformBy:(id)a3;
- (void)calculateCenterlineSlices:(id)a3;
- (void)calculateCenterlineSlices:(uint64_t)a3;
- (void)centerlineSlices;
- (void)maskPaths;
- (void)saveToArchive:(void *)a3;
@end

@implementation PKStrokeMask

- (PKStrokeMask)initWithMaskPaths:(const void *)a3 centerlineSlices:(const void *)a4
{
  v25.receiver = self;
  v25.super_class = (Class)PKStrokeMask;
  v6 = [(PKStrokeMask *)&v25 init];
  v7 = v6;
  if (&v6->_maskPaths != a3) {
    std::vector<std::vector<ClipperLib::IntPoint>>::__assign_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((uint64_t)&v6->_maskPaths, *(void *)a3, *((void *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
  }
  p_centerlineSlices = &v6->_centerlineSlices;
  if (&v6->_centerlineSlices != a4)
  {
    v9 = *(char **)a4;
    v10 = (char *)*((void *)a4 + 1);
    int64_t v11 = (int64_t)&v10[-*(void *)a4];
    unint64_t v12 = v11 >> 4;
    uint64_t value = (uint64_t)v7->_centerlineSlices.__end_cap_.__value_;
    begin = v7->_centerlineSlices.__begin_;
    if (v11 >> 4 <= (unint64_t)((value - (uint64_t)begin) >> 4))
    {
      p_end = (void **)&v7->_centerlineSlices.__end_;
      end = v7->_centerlineSlices.__end_;
      unint64_t v20 = (end - begin) >> 4;
      if (v20 < v12)
      {
        v21 = &v9[16 * v20];
        if (end != begin)
        {
          memmove(v7->_centerlineSlices.__begin_, v9, end - begin);
          begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_end;
        }
        int64_t v11 = v10 - v21;
        if (v10 == v21) {
          goto LABEL_23;
        }
        v22 = begin;
        v23 = v21;
        goto LABEL_22;
      }
    }
    else
    {
      if (begin)
      {
        v7->_centerlineSlices.__end_ = begin;
        operator delete(begin);
        uint64_t value = 0;
        p_centerlineSlices->__begin_ = 0;
        p_centerlineSlices->__end_ = 0;
        p_centerlineSlices->__end_cap_.__value_ = 0;
      }
      if (v11 < 0) {
        goto LABEL_25;
      }
      uint64_t v15 = value >> 3;
      if (value >> 3 <= v12) {
        uint64_t v15 = v11 >> 4;
      }
      unint64_t v16 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v15;
      if (v16 >> 60) {
LABEL_25:
      }
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v16);
      v7->_centerlineSlices.__end_ = begin;
      p_end = (void **)&v7->_centerlineSlices.__end_;
      v7->_centerlineSlices.__begin_ = begin;
      v7->_centerlineSlices.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16 * v18);
    }
    if (v10 == v9)
    {
LABEL_23:
      *p_end = (char *)begin + v11;
      return v7;
    }
    v22 = begin;
    v23 = v9;
LABEL_22:
    memmove(v22, v23, v11);
    goto LABEL_23;
  }
  return v7;
}

- (PKStrokeMask)initWithBezierPath:(id)a3 stroke:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PKStrokeMask;
  [(PKStrokeMask *)&v9 init];
  PKClipperPathsFromCGPath((const CGPath *)objc_msgSend(v6, "PK_CGPath"), 100.0);
}

- (void)maskPaths
{
  return &self->_maskPaths;
}

- (void)centerlineSlices
{
  return &self->_centerlineSlices;
}

- (void)calculateCenterlineSlices:(id)a3
{
  id v4 = a3;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  *((void *)&v51 + 1) = &v84;
  v5 = (uint64_t (**)(ClipperLib::Clipper *__hidden))std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v84, 1uLL);
  v49 = v5;
  *(void *)&long long v50 = v5;
  *(void *)&long long v51 = &v5[3 * v6];
  *v5 = 0;
  v5[1] = 0;
  v5[2] = 0;
  *((void *)&v50 + 1) = v5 + 3;
  std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(&v82, &v49);
  uint64_t v7 = v83;
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)&v49);
  uint64_t v83 = v7;
  v8 = (void **)(v7 - 24);
  std::vector<ClipperLib::IntPoint>::reserve(v8, 10 * [v4 _pointsCount]);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v79 = 0u;
  if (v4) {
    [v4 _transform];
  }
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __42__PKStrokeMask_calculateCenterlineSlices___block_invoke;
  v74[3] = &__block_descriptor_88_e26_v40__0_CGPoint_dd_8d24_B32l;
  long long v75 = v79;
  long long v76 = v80;
  long long v77 = v81;
  v78 = v8;
  [v4 interpolatePointDataWithStep:v74 usingBlock:0.1];
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v71 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  objc_super v9 = &off_1F1FB03A8;
  v49 = &off_1F1FB03A8;
  v60 = off_1F1FB03F0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long __p = 0u;
  uint64_t v54 = 0;
  v55[0] = v55;
  v55[1] = v55;
  v55[2] = 0;
  char v56 = 0;
  char v63 = 0;
  char v57 = 0;
  char v58 = 0;
  __int16 v67 = 0;
  v59 = ZFillCallback;
  uint64_t v10 = v82;
  if (v83 != v82)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      (*(void (**)(char *, uint64_t, void, void))(*(void *)v13 + 16))(v13, v10 + v11, 0, 0);
      ++v12;
      uint64_t v10 = v82;
      v11 += 24;
    }
    while (v12 < 0xAAAAAAAAAAAAAAABLL * ((v83 - v82) >> 3));
    objc_super v9 = v49;
  }
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v49 + (void)*(v9 - 3), (uint64_t *)&self->_maskPaths, 1, 1);
  memset(v45, 0, sizeof(v45));
  long long v44 = 0u;
  long long v43 = 0u;
  uint64_t v41 = 0;
  v42 = &unk_1F1FB0448;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  v39 = 0;
  v40 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v49, 0, &v42, 0, 0);
  ClipperLib::OpenPathsFromPolyTree((uint64_t)&v42, (uint64_t *)&v39);
  v14 = v39;
  for (i = v40; v14 != i; v14 += 3)
  {
    uint64_t v16 = v14[1];
    if (0xAAAAAAAAAAAAAAABLL * ((v16 - *v14) >> 3) < 2) {
      continue;
    }
    float v17 = *(float *)(*v14 + 16);
    if (v17 < 0.0) {
      continue;
    }
    float v18 = *(float *)(v16 - 8);
    if (v18 < 0.0) {
      continue;
    }
    end = self->_centerlineSlices.__end_;
    uint64_t value = self->_centerlineSlices.__end_cap_.__value_;
    double v21 = v17;
    double v22 = v18;
    if (v17 >= v18)
    {
      if (end >= value)
      {
        begin = self->_centerlineSlices.__begin_;
        uint64_t v30 = (end - begin) >> 4;
        unint64_t v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v32 = value - begin;
        if (v32 >> 3 > v31) {
          unint64_t v31 = v32 >> 3;
        }
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v31;
        }
        if (v28)
        {
          unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v28);
          begin = self->_centerlineSlices.__begin_;
          end = self->_centerlineSlices.__end_;
        }
        else
        {
          uint64_t v29 = 0;
        }
        unint64_t v33 = v28 + 16 * v30;
        *(double *)unint64_t v33 = v22;
        *(double *)(v33 + 8) = v21;
        v34 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v33;
        if (end != begin)
        {
          do
          {
            *((_OWORD *)v34 - 1) = *((_OWORD *)end - 1);
            v34 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v34 - 16);
            end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
          }
          while (end != begin);
LABEL_40:
          begin = self->_centerlineSlices.__begin_;
        }
LABEL_41:
        v23 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v33 + 16);
        self->_centerlineSlices.__begin_ = v34;
        self->_centerlineSlices.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v33 + 16);
        self->_centerlineSlices.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v28 + 16 * v29);
        if (begin) {
          operator delete(begin);
        }
        goto LABEL_43;
      }
      *(double *)end = v22;
      *((double *)end + 1) = v21;
    }
    else
    {
      if (end >= value)
      {
        begin = self->_centerlineSlices.__begin_;
        uint64_t v25 = (end - begin) >> 4;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v27 = value - begin;
        if (v27 >> 3 > v26) {
          unint64_t v26 = v27 >> 3;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v28);
          begin = self->_centerlineSlices.__begin_;
          end = self->_centerlineSlices.__end_;
        }
        else
        {
          uint64_t v29 = 0;
        }
        unint64_t v33 = v28 + 16 * v25;
        *(double *)unint64_t v33 = v21;
        *(double *)(v33 + 8) = v22;
        v34 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v33;
        if (end != begin)
        {
          do
          {
            *((_OWORD *)v34 - 1) = *((_OWORD *)end - 1);
            v34 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v34 - 16);
            end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
          }
          while (end != begin);
          goto LABEL_40;
        }
        goto LABEL_41;
      }
      *(double *)end = v21;
      *((double *)end + 1) = v22;
    }
    v23 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 16);
LABEL_43:
    self->_centerlineSlices.__end_ = v23;
  }
  v35 = self->_centerlineSlices.__begin_;
  v36 = (double *)self->_centerlineSlices.__end_;
  unint64_t v37 = 126 - 2 * __clz(((char *)v36 - (char *)v35) >> 4);
  if (v36 == (double *)v35) {
    uint64_t v38 = 0;
  }
  else {
    uint64_t v38 = v37;
  }
  std::__introsort<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *,false>((unint64_t)v35, v36, v38, 1);
  v85 = (void **)&v39;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v85);
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&v42);
  std::__list_imp<long long>::clear(v55);
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (*((void *)&v51 + 1))
  {
    *(void *)&long long v52 = *((void *)&v51 + 1);
    operator delete(*((void **)&v51 + 1));
  }
  if ((void)v50)
  {
    *((void *)&v50 + 1) = v50;
    operator delete((void *)v50);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v60);
  v49 = (uint64_t (**)(ClipperLib::Clipper *__hidden))&v82;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
}

void __42__PKStrokeMask_calculateCenterlineSlices___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v4 = *(void *)(a1 + 80);
  int32x2_t v5 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)(a1 + 64), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 48), a3), *(float64x2_t *)(a1 + 32), a2)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
  *(void *)&long long v6 = v5.i32[0];
  *((void *)&v6 + 1) = v5.i32[1];
  long long v7 = v6;
  float v8 = a4;
  objc_super v9 = *(_OWORD **)(v4 + 8);
  unint64_t v10 = *(void *)(v4 + 16);
  if ((unint64_t)v9 >= v10)
  {
    unint64_t v12 = *(_OWORD **)v4;
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v9 - *(void *)v4) >> 3);
    unint64_t v14 = v13 + 1;
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - (void)v12) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      long long v22 = v7;
      float v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v4 + 16, v16);
      long long v7 = v22;
      float v18 = v17;
      unint64_t v12 = *(_OWORD **)v4;
      objc_super v9 = *(_OWORD **)(v4 + 8);
    }
    else
    {
      float v18 = 0;
    }
    v19 = &v18[24 * v13];
    unint64_t v20 = &v18[24 * v16];
    *(_OWORD *)v19 = v7;
    *((float *)v19 + 4) = v8;
    *((_DWORD *)v19 + 5) = -1082130432;
    uint64_t v11 = v19 + 24;
    if (v9 != v12)
    {
      do
      {
        long long v21 = *(_OWORD *)((char *)v9 - 24);
        *((void *)v19 - 1) = *((void *)v9 - 1);
        *(_OWORD *)(v19 - 24) = v21;
        v19 -= 24;
        objc_super v9 = (_OWORD *)((char *)v9 - 24);
      }
      while (v9 != v12);
      unint64_t v12 = *(_OWORD **)v4;
    }
    *(void *)uint64_t v4 = v19;
    *(void *)(v4 + 8) = v11;
    *(void *)(v4 + 16) = v20;
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    _OWORD *v9 = v7;
    *((float *)v9 + 4) = v8;
    *((_DWORD *)v9 + 5) = -1082130432;
    uint64_t v11 = (char *)v9 + 24;
  }
  *(void *)(v4 + 8) = v11;
}

- (PKStrokeMask)initWithArchive:(const void *)a3
{
  v70.receiver = self;
  v70.super_class = (Class)PKStrokeMask;
  v3 = [(PKStrokeMask *)&v70 init];
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve((uint64_t *)[(PKStrokeMask *)v3 maskPaths], (uint64_t)(*((void *)a3 + 9) - *((void *)a3 + 8)) >> 4);
  uint64_t v4 = *((void *)a3 + 9) - *((void *)a3 + 8);
  if (v4)
  {
    uint64_t v67 = 0;
    unint64_t v5 = v4 >> 4;
    if (v5 <= 1) {
      unint64_t v5 = 1;
    }
    unint64_t v65 = v5;
    float32x2_t v6 = (float32x2_t)vdup_n_s32(0x42C80000u);
    do
    {
      long long v7 = [(PKStrokeMask *)v3 maskPaths];
      unint64_t v8 = v7[2];
      objc_super v9 = (void *)v7[1];
      if ((unint64_t)v9 >= v8)
      {
        unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v9 - *v7) >> 3);
        unint64_t v12 = v11 + 1;
        if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v7) >> 3);
        if (2 * v13 > v12) {
          unint64_t v12 = 2 * v13;
        }
        if (v13 >= 0x555555555555555) {
          unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v14 = v12;
        }
        v71[4] = v7 + 2;
        if (v14) {
          unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)(v7 + 2), v14);
        }
        else {
          unint64_t v15 = 0;
        }
        unint64_t v16 = &v15[24 * v11];
        v71[0] = v15;
        v71[1] = v16;
        v71[3] = &v15[24 * v14];
        *(void *)unint64_t v16 = 0;
        *((void *)v16 + 1) = 0;
        *((void *)v16 + 2) = 0;
        v71[2] = v16 + 24;
        std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(v7, v71);
        unint64_t v10 = (void *)v7[1];
        std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v71);
      }
      else
      {
        void *v9 = 0;
        v9[1] = 0;
        v9[2] = 0;
        unint64_t v10 = v9 + 3;
        v7[1] = (uint64_t)(v9 + 3);
      }
      v7[1] = (uint64_t)v10;
      float v17 = (uint64_t *)(*((void *)a3 + 8) + 16 * v67);
      unint64_t v18 = v17[1];
      if (v18 >= 8)
      {
        uint64_t v19 = 0;
        uint64_t v20 = *v17;
        unint64_t v21 = v18 >> 3;
        do
        {
          uint64_t v22 = *(void *)([(PKStrokeMask *)v3 maskPaths] + 8);
          int64x2_t v23 = vcvtq_s64_f64(vcvtq_f64_f32(vmul_f32(*(float32x2_t *)(v20 + 8 * v19), v6)));
          v24 = *(int64x2_t **)(v22 - 16);
          unint64_t v25 = *(void *)(v22 - 8);
          if ((unint64_t)v24 >= v25)
          {
            int64x2_t v68 = v23;
            uint64_t v27 = *(int64x2_t **)(v22 - 24);
            unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24 - (char *)v27) >> 3);
            unint64_t v29 = v28 + 1;
            if (v28 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v25 - (void)v27) >> 3);
            if (2 * v30 > v29) {
              unint64_t v29 = 2 * v30;
            }
            if (v30 >= 0x555555555555555) {
              unint64_t v31 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v31 = v29;
            }
            if (v31)
            {
              uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v22 - 8, v31);
              uint64_t v27 = *(int64x2_t **)(v22 - 24);
              v24 = *(int64x2_t **)(v22 - 16);
            }
            else
            {
              uint64_t v32 = 0;
            }
            unint64_t v33 = &v32[24 * v28];
            *(int64x2_t *)unint64_t v33 = v68;
            *((void *)v33 + 2) = 0;
            v34 = v33;
            if (v24 != v27)
            {
              do
              {
                long long v35 = *(long long *)((char *)&v24[-2] + 8);
                *((void *)v34 - 1) = v24[-1].i64[1];
                *(_OWORD *)(v34 - 24) = v35;
                v34 -= 24;
                v24 = (int64x2_t *)((char *)v24 - 24);
              }
              while (v24 != v27);
              uint64_t v27 = *(int64x2_t **)(v22 - 24);
            }
            unint64_t v26 = v33 + 24;
            *(void *)(v22 - 24) = v34;
            *(void *)(v22 - 16) = v33 + 24;
            *(void *)(v22 - 8) = &v32[24 * v31];
            if (v27) {
              operator delete(v27);
            }
          }
          else
          {
            int64x2_t *v24 = v23;
            unint64_t v26 = &v24[1].i8[8];
            v24[1].i64[0] = 0;
          }
          *(void *)(v22 - 16) = v26;
          ++v19;
        }
        while (v19 != v21);
      }
      ++v67;
    }
    while (v67 != v65);
  }
  v36 = [(PKStrokeMask *)v3 centerlineSlices];
  uint64_t v37 = *((void *)a3 + 2) - *((void *)a3 + 1);
  unint64_t v38 = (unint64_t)(v37 >> 2) >> 1;
  v39 = (char *)*v36;
  if (v38 > ((unsigned char *)v36[2] - (unsigned char *)*v36) >> 4)
  {
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFDLL) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    v40 = v36[1];
    uint64_t v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v38);
    v42 = &v41[(v40 - v39) & 0xFFFFFFFFFFFFFFF0];
    long long v44 = &v41[16 * v43];
    uint64_t v46 = (char *)*v36;
    v45 = (char *)v36[1];
    uint64_t v47 = v42;
    if (v45 != *v36)
    {
      do
      {
        *((_OWORD *)v47 - 1) = *((_OWORD *)v45 - 1);
        v47 -= 16;
        v45 -= 16;
      }
      while (v45 != v46);
      v45 = (char *)*v36;
    }
    double *v36 = v47;
    v36[1] = v42;
    v36[2] = v44;
    if (v45) {
      operator delete(v45);
    }
  }
  uint64_t v48 = *((void *)a3 + 2) - *((void *)a3 + 1);
  if (v48)
  {
    unint64_t v49 = 0;
    unint64_t v50 = v48 >> 2;
    do
    {
      uint64_t v51 = [(PKStrokeMask *)v3 centerlineSlices];
      long long v52 = (float64x2_t **)v51;
      float64x2_t v53 = vcvtq_f64_f32(*(float32x2_t *)(*((void *)a3 + 1) + 4 * v49));
      v55 = *(float64x2_t **)(v51 + 8);
      unint64_t v54 = *(void *)(v51 + 16);
      if ((unint64_t)v55 >= v54)
      {
        float64x2_t v69 = v53;
        char v57 = *(float64x2_t **)v51;
        uint64_t v58 = v55 - *v52;
        unint64_t v59 = v58 + 1;
        if ((unint64_t)(v58 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v60 = v54 - (void)v57;
        if (v60 >> 3 > v59) {
          unint64_t v59 = v60 >> 3;
        }
        if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v61 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v61 = v59;
        }
        if (v61)
        {
          unint64_t v61 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v61);
          char v57 = *v52;
          v55 = v52[1];
        }
        else
        {
          uint64_t v62 = 0;
        }
        char v63 = (float64x2_t *)(v61 + 16 * v58);
        *char v63 = v69;
        char v56 = v63 + 1;
        if (v55 != v57)
        {
          do
          {
            v63[-1] = v55[-1];
            --v63;
            --v55;
          }
          while (v55 != v57);
          char v57 = *v52;
        }
        *long long v52 = v63;
        v52[1] = v56;
        v52[2] = (float64x2_t *)(v61 + 16 * v62);
        if (v57) {
          operator delete(v57);
        }
      }
      else
      {
        float64x2_t *v55 = v53;
        char v56 = v55 + 1;
      }
      v52[1] = v56;
      v49 += 2;
    }
    while (v49 < v50);
  }
  return v3;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v4 = [(PKStrokeMask *)self maskPaths];
  unint64_t v5 = *v4;
  long long v79 = v4[1];
  if (*v4 != v79)
  {
    v78 = (uint64_t *)((char *)a3 + 64);
    float32x2_t v6 = (float32x2_t)vdup_n_s32(0x42C80000u);
    do
    {
      uint64_t v7 = (char *)v5[1] - (char *)*v5;
      if (v7)
      {
        unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3);
        if (v8 >> 61) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        objc_super v9 = (float32x2_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<legacy_drawing::Command>>>(v8);
        unint64_t v11 = v9;
        unint64_t v13 = *v5;
        unint64_t v12 = v5[1];
        if (*v5 != v12)
        {
          unint64_t v14 = &v9[v10];
          unint64_t v15 = v9;
          do
          {
            float32x2_t v16 = vdiv_f32(vcvt_f32_f64(vcvtq_f64_s64(*v13)), v6);
            if (v15 >= v14)
            {
              uint64_t v18 = v15 - v11;
              unint64_t v19 = v18 + 1;
              if ((unint64_t)(v18 + 1) >> 61) {
                std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
              }
              if (((char *)v14 - (char *)v11) >> 2 > v19) {
                unint64_t v19 = ((char *)v14 - (char *)v11) >> 2;
              }
              if ((unint64_t)((char *)v14 - (char *)v11) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v20 = v19;
              }
              if (v20) {
                unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<legacy_drawing::Command>>>(v20);
              }
              else {
                uint64_t v21 = 0;
              }
              uint64_t v22 = (float32x2_t *)(v20 + 8 * v18);
              float32x2_t *v22 = v16;
              float v17 = v22 + 1;
              while (v15 != v11)
              {
                float32x2_t v23 = v15[-1];
                --v15;
                v22[-1] = v23;
                --v22;
              }
              unint64_t v14 = (float32x2_t *)(v20 + 8 * v21);
              if (v11) {
                operator delete(v11);
              }
              unint64_t v11 = v22;
            }
            else
            {
              *unint64_t v15 = v16;
              float v17 = v15 + 1;
            }
            unint64_t v13 = (int64x2_t *)((char *)v13 + 24);
            unint64_t v15 = v17;
          }
          while (v13 != v12);
        }
      }
      else
      {
        unint64_t v11 = 0;
      }
      PB::Data::Data((PB::Data *)&v80, (const unsigned __int8 *)v11);
      v24 = (void **)*((void *)a3 + 9);
      unint64_t v25 = *((void *)a3 + 10);
      if ((unint64_t)v24 >= v25)
      {
        uint64_t v28 = ((uint64_t)v24 - *v78) >> 4;
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v30 = v25 - *v78;
        if (v30 >> 3 > v29) {
          unint64_t v29 = v30 >> 3;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = v29;
        }
        v82[4] = (char *)a3 + 80;
        uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 80, v31);
        unint64_t v33 = (void **)&v32[16 * v28];
        v82[0] = v32;
        v82[1] = v33;
        v82[3] = &v32[16 * v34];
        *unint64_t v33 = v80;
        v33[1] = v81;
        long long v80 = 0;
        long long v81 = 0;
        v82[2] = v33 + 2;
        std::vector<PB::Data>::__swap_out_circular_buffer(v78, v82);
        uint64_t v27 = (void *)*((void *)a3 + 9);
        std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v82);
        unint64_t v26 = v80;
      }
      else
      {
        unint64_t v26 = 0;
        int64x2_t *v24 = v80;
        v24[1] = v81;
        long long v80 = 0;
        long long v81 = 0;
        uint64_t v27 = v24 + 2;
        *((void *)a3 + 9) = v24 + 2;
      }
      *((void *)a3 + 9) = v27;
      free(v26);
      if (v11) {
        operator delete(v11);
      }
      v5 += 3;
    }
    while (v5 != v79);
  }
  long long v35 = [(PKStrokeMask *)self centerlineSlices];
  uint64_t v37 = (void **)((char *)a3 + 8);
  uint64_t v36 = *((void *)a3 + 1);
  uint64_t v38 = v35[1] - *v35;
  v39 = (float **)((char *)a3 + 24);
  if (v38 >> 3 > (unint64_t)((*((void *)a3 + 3) - v36) >> 2))
  {
    if (v38 < 0) {
LABEL_83:
    }
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    uint64_t v40 = *((void *)a3 + 2) - v36;
    uint64_t v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)a3 + 24, v38 >> 3);
    v42 = &v41[v40 & 0xFFFFFFFFFFFFFFFCLL];
    long long v44 = &v41[4 * v43];
    v45 = (char *)*((void *)a3 + 1);
    uint64_t v46 = (char *)*((void *)a3 + 2);
    uint64_t v47 = v42;
    if (v46 != v45)
    {
      uint64_t v47 = v42;
      do
      {
        int v48 = *((_DWORD *)v46 - 1);
        v46 -= 4;
        *((_DWORD *)v47 - 1) = v48;
        v47 -= 4;
      }
      while (v46 != v45);
    }
    *((void *)a3 + 1) = v47;
    *((void *)a3 + 2) = v42;
    *((void *)a3 + 3) = v44;
    if (v45) {
      operator delete(v45);
    }
  }
  unint64_t v49 = [(PKStrokeMask *)self centerlineSlices];
  unint64_t v50 = *v49;
  uint64_t v51 = v49[1];
  if (*v49 != v51)
  {
    long long v52 = (float *)*((void *)a3 + 2);
    do
    {
      double v54 = *v50;
      double v53 = v50[1];
      v55 = *v39;
      if (v52 >= *v39)
      {
        uint64_t v58 = (float *)*v37;
        uint64_t v59 = ((char *)v52 - (unsigned char *)*v37) >> 2;
        unint64_t v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) >> 62) {
          goto LABEL_83;
        }
        uint64_t v61 = (char *)v55 - (char *)v58;
        if (v61 >> 1 > v60) {
          unint64_t v60 = v61 >> 1;
        }
        if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v62 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v62 = v60;
        }
        if (v62)
        {
          char v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)a3 + 24, v62);
          uint64_t v58 = (float *)*((void *)a3 + 1);
          long long v52 = (float *)*((void *)a3 + 2);
        }
        else
        {
          char v63 = 0;
        }
        uint64_t v64 = (float *)&v63[4 * v59];
        float v65 = v54;
        *uint64_t v64 = v65;
        char v57 = v64 + 1;
        while (v52 != v58)
        {
          int v66 = *((_DWORD *)v52-- - 1);
          *((_DWORD *)v64-- - 1) = v66;
        }
        v55 = (float *)&v63[4 * v62];
        *((void *)a3 + 1) = v64;
        *((void *)a3 + 2) = v57;
        *((void *)a3 + 3) = v55;
        if (v58)
        {
          operator delete(v58);
          v55 = *v39;
        }
      }
      else
      {
        float v56 = v54;
        *long long v52 = v56;
        char v57 = v52 + 1;
      }
      *((void *)a3 + 2) = v57;
      if (v57 >= v55)
      {
        int64x2_t v68 = (float *)*v37;
        uint64_t v69 = ((char *)v57 - (unsigned char *)*v37) >> 2;
        unint64_t v70 = v69 + 1;
        if ((unint64_t)(v69 + 1) >> 62) {
          goto LABEL_83;
        }
        uint64_t v71 = (char *)v55 - (char *)v68;
        if (v71 >> 1 > v70) {
          unint64_t v70 = v71 >> 1;
        }
        if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v72 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v72 = v70;
        }
        if (v72)
        {
          uint64_t v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)a3 + 24, v72);
          int64x2_t v68 = (float *)*((void *)a3 + 1);
          char v57 = (float *)*((void *)a3 + 2);
        }
        else
        {
          uint64_t v73 = 0;
        }
        v74 = (float *)&v73[4 * v69];
        float v75 = v53;
        float *v74 = v75;
        long long v52 = v74 + 1;
        while (v57 != v68)
        {
          int v76 = *((_DWORD *)v57-- - 1);
          *((_DWORD *)v74-- - 1) = v76;
        }
        *((void *)a3 + 1) = v74;
        *((void *)a3 + 2) = v52;
        *((void *)a3 + 3) = &v73[4 * v72];
        if (v68) {
          operator delete(v68);
        }
      }
      else
      {
        float v67 = v53;
        *char v57 = v67;
        long long v52 = v57 + 1;
      }
      *((void *)a3 + 2) = v52;
      v50 += 2;
    }
    while (v50 != v51);
  }
}

- (PKStrokeMask)initWithRawValue:(id)a3
{
  objc_super v9 = &unk_1F1FB0820;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v12 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v22 = 0;
  id v4 = a3;
  unint64_t v5 = (const unsigned __int8 *)[v4 bytes];
  [v4 length];
  PB::Reader::Reader((PB::Reader *)v8, v5);
  if (drawing::Stroke::readFrom((drawing::Stroke *)&v9, (PB::Reader *)v8))
  {
    self = [(PKStrokeMask *)self initWithArchive:&v9];
    float32x2_t v6 = self;
  }
  else
  {
    float32x2_t v6 = 0;
  }
  drawing::Stroke::~Stroke((drawing::Stroke *)&v9);

  return v6;
}

- (NSData)rawValue
{
  float32x2_t v6 = &unk_1F1FB0820;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v9 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v19 = 0;
  [(PKStrokeMask *)self saveToArchive:&v6];
  PB::Writer::Writer((PB::Writer *)&v4);
  drawing::Stroke::writeTo((drawing::Stroke *)&v6, (PB::Writer *)&v4);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:v4 - v5];
  PB::Writer::~Writer((PB::Writer *)&v4);
  drawing::Stroke::~Stroke((drawing::Stroke *)&v6);

  return (NSData *)v2;
}

- (id)bezierPath
{
  Mutable = CGPathCreateMutable();
  begin = (uint64_t **)self->_maskPaths.__begin_;
  for (i = (uint64_t **)self->_maskPaths.__end_; begin != i; begin += 3)
  {
    float32x2_t v6 = *begin;
    long long v7 = begin[1];
    if (*begin != v7)
    {
      char v8 = 1;
      do
      {
        if (v8) {
          CGPathMoveToPoint(Mutable, 0, (double)**begin / 100.0, (double)(*begin)[1] / 100.0);
        }
        else {
          CGPathAddLineToPoint(Mutable, 0, (double)*v6 / 100.0, (double)v6[1] / 100.0);
        }
        char v8 = 0;
        v6 += 3;
      }
      while (v6 != v7);
    }
    CGPathCloseSubpath(Mutable);
  }
  uint64_t v9 = [MEMORY[0x1E4FB14C0] bezierPathWithCGPath:Mutable];
  CGPathRelease(Mutable);

  return v9;
}

- (CGRect)_boundsWithTransform:(CGAffineTransform *)a3
{
  double a = a3->a;
  double b = a3->b;
  double c = a3->c;
  double d = a3->d;
  double tx = a3->tx;
  double ty = a3->ty;
  uint64_t v9 = [(PKStrokeMask *)self maskPaths];
  long long v10 = *v9;
  long long v11 = v9[1];
  if (*v9 == v11) {
    return *(CGRect *)*(void *)&MEMORY[0x1E4F1DB20];
  }
  double v12 = -1.79769313e308;
  double v13 = 1.79769313e308;
  double v14 = 1.79769313e308;
  double v15 = -1.79769313e308;
  do
  {
    long long v16 = *v10;
    while (v16 != v10[1])
    {
      uint64_t v17 = *v16;
      uint64_t v18 = v16[1];
      v16 += 3;
      double v19 = (double)v17 / 100.0;
      double v20 = (double)v18 / 100.0;
      double v21 = tx + c * v20 + a * v19;
      double v22 = ty + d * v20 + b * v19;
      if (v13 >= v21) {
        double v13 = v21;
      }
      if (v12 < v21) {
        double v12 = v21;
      }
      if (v14 >= v22) {
        double v14 = v22;
      }
      if (v15 < v22) {
        double v15 = v22;
      }
    }
    v10 += 3;
  }
  while (v10 != v11);
  if (v12 < v13 || v15 < v14)
  {
    return *(CGRect *)*(void *)&MEMORY[0x1E4F1DB20];
  }
  else
  {
    double v24 = v12 - v13;
    double v25 = v15 - v14;
    return CGRectIntegral(*(CGRect *)&v13);
  }
}

- (id)maskTransformedBy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PKStrokeMask alloc] initWithMaskPaths:&self->_maskPaths centerlineSlices:&self->_centerlineSlices];
  [(PKStrokeMask *)v5 _transformBy:v4];

  return v5;
}

- (void)_transformBy:(id)a3
{
  long long v11 = (double (**)(double, double))a3;
  begin = (uint64_t **)self->_maskPaths.__begin_;
  endouble d = (uint64_t **)self->_maskPaths.__end_;
  if (begin != end)
  {
    float64x2_t v10 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    do
    {
      float32x2_t v6 = *begin;
      long long v7 = begin[1];
      while (v6 != v7)
      {
        v8.f64[0] = v11[2]((double)*v6 / 100.0, (double)v6[1] / 100.0);
        v8.f64[1] = v9;
        *(int64x2_t *)float32x2_t v6 = vcvtq_s64_f64(vmulq_f64(v8, v10));
        v6 += 3;
      }
      begin += 3;
    }
    while (begin != end);
  }
}

- (void).cxx_destruct
{
  begin = self->_centerlineSlices.__begin_;
  if (begin)
  {
    self->_centerlineSlices.__end_ = begin;
    operator delete(begin);
  }
  p_maskPaths = &self->_maskPaths;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_maskPaths);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)calculateCenterlineSlices:(uint64_t)a3
{
  while (2)
  {
    unint64_t v10 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v10;
          uint64_t v11 = (uint64_t)a2 - v10;
          unint64_t v12 = (uint64_t)((uint64_t)a2 - v10) >> 4;
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                double v34 = *(a2 - 2);
                unint64_t v33 = a2 - 2;
                if (v34 < *(double *)v10)
                {
                  long long v85 = *(_OWORD *)v10;
                  *(_OWORD *)unint64_t v10 = *(_OWORD *)v33;
                  *(_OWORD *)unint64_t v33 = v85;
                }
                break;
              case 3uLL:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)(double *)v10 calculateCenterlineSlices:a2 - 2];
                break;
              case 4uLL:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>((double *)v10, (double *)(v10 + 16), (double *)(v10 + 32), (unint64_t *)a2 - 2);
                break;
              case 5uLL:
                long long v35 = (long long *)(v10 + 16);
                uint64_t v36 = (long long *)(v10 + 32);
                uint64_t v37 = (long long *)(v10 + 48);
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>((double *)v10, (double *)(v10 + 16), (double *)(v10 + 32), (unint64_t *)(v10 + 48));
                double v39 = *(a2 - 2);
                uint64_t v38 = a2 - 2;
                if (v39 < *(double *)(v10 + 48))
                {
                  long long v40 = *v37;
                  *uint64_t v37 = *(_OWORD *)v38;
                  *(_OWORD *)uint64_t v38 = v40;
                  if (*(double *)v37 < *(double *)v36)
                  {
                    long long v41 = *v36;
                    long long *v36 = *v37;
                    *uint64_t v37 = v41;
                    if (*(double *)v36 < *(double *)v35)
                    {
                      long long v42 = *v35;
                      long long *v35 = *v36;
                      long long *v36 = v42;
                      if (*(double *)(v10 + 16) < *(double *)v10)
                      {
                        long long v86 = *(_OWORD *)v10;
                        *(_OWORD *)unint64_t v10 = *v35;
                        long long *v35 = v86;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v11 <= 383)
          {
            uint64_t v43 = (double *)(v10 + 16);
            BOOL v45 = (double *)v10 == a2 || v43 == a2;
            if (a4)
            {
              if (!v45)
              {
                uint64_t v46 = 0;
                unint64_t v47 = v10;
                do
                {
                  int v48 = v43;
                  double v49 = *(double *)(v47 + 16);
                  if (v49 < *(double *)v47)
                  {
                    uint64_t v50 = *(void *)(v47 + 24);
                    uint64_t v51 = v46;
                    while (1)
                    {
                      *(_OWORD *)(v10 + v51 + 16) = *(_OWORD *)(v10 + v51);
                      if (!v51) {
                        break;
                      }
                      double v52 = *(double *)(v10 + v51 - 16);
                      v51 -= 16;
                      if (v49 >= v52)
                      {
                        uint64_t v53 = v10 + v51 + 16;
                        goto LABEL_81;
                      }
                    }
                    uint64_t v53 = v10;
LABEL_81:
                    *(double *)uint64_t v53 = v49;
                    *(void *)(v53 + 8) = v50;
                  }
                  uint64_t v43 = v48 + 2;
                  v46 += 16;
                  unint64_t v47 = (unint64_t)v48;
                }
                while (v48 + 2 != a2);
              }
            }
            else if (!v45)
            {
              do
              {
                unint64_t v77 = (unint64_t)v43;
                double v78 = *(double *)(a1 + 16);
                if (v78 < *(double *)a1)
                {
                  uint64_t v79 = *(void *)(a1 + 24);
                  long long v80 = v43;
                  do
                  {
                    *(_OWORD *)long long v80 = *((_OWORD *)v80 - 1);
                    double v81 = *(v80 - 4);
                    v80 -= 2;
                  }
                  while (v78 < v81);
                  *long long v80 = v78;
                  *((void *)v80 + 1) = v79;
                }
                v43 += 2;
                a1 = v77;
              }
              while ((double *)(v77 + 16) != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((double *)v10 != a2)
            {
              int64_t v54 = (v12 - 2) >> 1;
              int64_t v55 = v54;
              do
              {
                int64_t v56 = v55;
                if (v54 >= v55)
                {
                  uint64_t v57 = (2 * v55) | 1;
                  uint64_t v58 = (double *)(v10 + 16 * v57);
                  if (2 * v56 + 2 < (uint64_t)v12 && *v58 < v58[2])
                  {
                    v58 += 2;
                    uint64_t v57 = 2 * v56 + 2;
                  }
                  uint64_t v59 = (double *)(v10 + 16 * v56);
                  long long v60 = *(_OWORD *)v59;
                  if (*v58 >= *v59)
                  {
                    do
                    {
                      uint64_t v61 = v58;
                      *(_OWORD *)uint64_t v59 = *(_OWORD *)v58;
                      if (v54 < v57) {
                        break;
                      }
                      uint64_t v62 = 2 * v57;
                      uint64_t v57 = (2 * v57) | 1;
                      uint64_t v58 = (double *)(v10 + 16 * v57);
                      uint64_t v63 = v62 + 2;
                      if (v63 < (uint64_t)v12 && *v58 < v58[2])
                      {
                        v58 += 2;
                        uint64_t v57 = v63;
                      }
                      uint64_t v59 = v61;
                    }
                    while (*v58 >= *(double *)&v60);
                    *(_OWORD *)uint64_t v61 = v60;
                  }
                }
                int64_t v55 = v56 - 1;
              }
              while (v56);
              uint64_t v64 = (unint64_t)v11 >> 4;
              do
              {
                uint64_t v65 = 0;
                long long v87 = *(_OWORD *)v10;
                int v66 = (double *)v10;
                do
                {
                  float v67 = v66;
                  v66 += 2 * v65 + 2;
                  uint64_t v68 = 2 * v65;
                  uint64_t v65 = (2 * v65) | 1;
                  uint64_t v69 = v68 + 2;
                  if (v69 < v64 && *v66 < v66[2])
                  {
                    v66 += 2;
                    uint64_t v65 = v69;
                  }
                  *(_OWORD *)float v67 = *(_OWORD *)v66;
                }
                while (v65 <= (uint64_t)((unint64_t)(v64 - 2) >> 1));
                a2 -= 2;
                if (v66 == a2)
                {
                  *(_OWORD *)int v66 = v87;
                }
                else
                {
                  *(_OWORD *)int v66 = *(_OWORD *)a2;
                  *(_OWORD *)a2 = v87;
                  uint64_t v70 = (uint64_t)v66 - v10 + 16;
                  if (v70 >= 17)
                  {
                    unint64_t v71 = (((unint64_t)v70 >> 4) - 2) >> 1;
                    unint64_t v72 = (double *)(v10 + 16 * v71);
                    double v73 = *v66;
                    if (*v72 < *v66)
                    {
                      uint64_t v74 = *((void *)v66 + 1);
                      do
                      {
                        float v75 = v72;
                        *(_OWORD *)int v66 = *(_OWORD *)v72;
                        if (!v71) {
                          break;
                        }
                        unint64_t v71 = (v71 - 1) >> 1;
                        unint64_t v72 = (double *)(v10 + 16 * v71);
                        int v66 = v75;
                      }
                      while (*v72 < v73);
                      *float v75 = v73;
                      *((void *)v75 + 1) = v74;
                    }
                  }
                }
              }
              while (v64-- > 2);
            }
            return;
          }
          unint64_t v13 = v12 >> 1;
          double v14 = (double *)(v10 + 16 * (v12 >> 1));
          if ((unint64_t)v11 >= 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)(double *)a1 calculateCenterlineSlices:a2 - 2];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)(double *)(a1 + 16) calculateCenterlineSlices:a2 - 4];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)(double *)(a1 + 32) calculateCenterlineSlices:a2 - 6];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)v14 - 2 calculateCenterlineSlices:(double *)(a1 + 16 + 16 * v13)];
            long long v82 = *(_OWORD *)a1;
            *(_OWORD *)a1 = *(_OWORD *)v14;
            *(_OWORD *)double v14 = v82;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)(double *)(a1 + 16 * (v12 >> 1)) calculateCenterlineSlices:a2 - 2];
          }
          --a3;
          double v15 = *(double *)a1;
          if (a4) {
            break;
          }
          uint64_t v16 = *(void *)(a1 + 8);
          if (*(double *)(a1 - 16) < v15) {
            goto LABEL_12;
          }
          if (v15 >= *(a2 - 2))
          {
            unint64_t v28 = a1 + 16;
            do
            {
              unint64_t v10 = v28;
              if (v28 >= (unint64_t)a2) {
                break;
              }
              v28 += 16;
            }
            while (v15 >= *(double *)v10);
          }
          else
          {
            unint64_t v10 = a1;
            do
            {
              double v27 = *(double *)(v10 + 16);
              v10 += 16;
            }
            while (v15 >= v27);
          }
          unint64_t v29 = a2;
          if (v10 < (unint64_t)a2)
          {
            unint64_t v29 = a2;
            do
            {
              double v30 = *(v29 - 2);
              v29 -= 2;
            }
            while (v15 < v30);
          }
          while (v10 < (unint64_t)v29)
          {
            long long v84 = *(_OWORD *)v10;
            *(_OWORD *)unint64_t v10 = *(_OWORD *)v29;
            *(_OWORD *)unint64_t v29 = v84;
            do
            {
              double v31 = *(double *)(v10 + 16);
              v10 += 16;
            }
            while (v15 >= v31);
            do
            {
              double v32 = *(v29 - 2);
              v29 -= 2;
            }
            while (v15 < v32);
          }
          BOOL v4 = v10 - 16 >= a1;
          BOOL v5 = v10 - 16 == a1;
          if (v10 - 16 != a1) {
            *(_OWORD *)a1 = *(_OWORD *)(v10 - 16);
          }
          a4 = 0;
          *(double *)(v10 - 16) = v15;
          *(void *)(v10 - 8) = v16;
        }
        uint64_t v16 = *(void *)(a1 + 8);
LABEL_12:
        uint64_t v17 = 0;
        do
        {
          double v18 = *(double *)(a1 + v17 + 16);
          v17 += 16;
        }
        while (v18 < v15);
        unint64_t v19 = a1 + v17;
        double v20 = a2;
        if (v17 == 16)
        {
          double v20 = a2;
          do
          {
            if (v19 >= (unint64_t)v20) {
              break;
            }
            double v22 = *(v20 - 2);
            v20 -= 2;
          }
          while (v22 >= v15);
        }
        else
        {
          do
          {
            double v21 = *(v20 - 2);
            v20 -= 2;
          }
          while (v21 >= v15);
        }
        unint64_t v10 = a1 + v17;
        if (v19 < (unint64_t)v20)
        {
          uint64_t v23 = v20;
          do
          {
            long long v83 = *(_OWORD *)v10;
            *(_OWORD *)unint64_t v10 = *(_OWORD *)v23;
            *(_OWORD *)uint64_t v23 = v83;
            do
            {
              double v24 = *(double *)(v10 + 16);
              v10 += 16;
            }
            while (v24 < v15);
            do
            {
              double v25 = *(v23 - 2);
              v23 -= 2;
            }
            while (v25 >= v15);
          }
          while (v10 < (unint64_t)v23);
        }
        if (v10 - 16 != a1) {
          *(_OWORD *)a1 = *(_OWORD *)(v10 - 16);
        }
        *(double *)(v10 - 16) = v15;
        *(void *)(v10 - 8) = v16;
        if (v19 >= (unint64_t)v20) {
          break;
        }
LABEL_31:
        std::__introsort<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *,false>(a1, v10 - 16, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v26 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>((long long *)a1, (double *)(v10 - 16));
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>((long long *)v10, a2))
      {
        break;
      }
      if (!v26) {
        goto LABEL_31;
      }
    }
    a2 = (double *)(v10 - 16);
    if (!v26) {
      continue;
    }
    break;
  }
}

@end