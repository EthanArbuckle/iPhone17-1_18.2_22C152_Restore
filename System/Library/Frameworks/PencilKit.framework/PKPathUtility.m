@interface PKPathUtility
+ (BOOL)edge:(Edge)a3 intersectsEdge:(Edge)a4;
+ (BOOL)edgeSet:(const void *)a3 containsEdge:(Edge)a4;
+ (BOOL)newEdgeWithPoint:(CGPoint)a3 betweenEdge:(Edge)a4 intersectsOtherEdgesInHull:(const void *)a5;
+ (BOOL)vector:(const void *)a3 containsPoint:(CGPoint)a4;
+ (CGPoint)pointWithMinAngleForEdge:(Edge)a3 fromPoints:(const void *)a4 minAngle:(double *)a5;
+ (Edge)longestEdgeInHull:(const void *)a3 atIndex:(int *)a4 visitedEdges:(const void *)a5;
+ (double)averageDistanceForEdge:(Edge)a3 withPoints:(const void *)a4;
+ (id)bezierPathFromPoints:(const void *)a3;
+ (vector<CGPoint,)centripetalCatmullRomPointsFromConvexHull:(id)a2 alpha:(SEL)a3 granularity:(const void *)a4;
+ (vector<CGPoint,)smoothedHullForPoints:(id)a2;
+ (vector<CGPoint,)smoothedHullForPoints:(id)a2 alpha:(SEL)a3 granularity:(const void *)a4 minAngleFactor:(double)a5 maxLengthThreshold:(double)a6 edgeRemovalConstant:(double)a7;
+ (vector<CGPoint,)unorderedSimplifiedPointsFromPoints:(id)a2 factor:(SEL)a3;
+ (void)convexHull:(void *)a3 forPoints:(const void *)a4;
+ (void)openConvexHullToConcave:(void *)a3 points:(const void *)a4 minAngleFactor:(double)a5 maxLengthThreshold:(double)a6 edgeRemovalConstant:(double)a7;
+ (void)smoothedHullForPoints:(const void *)a3 completion:(id)a4;
@end

@implementation PKPathUtility

+ (vector<CGPoint,)unorderedSimplifiedPointsFromPoints:(id)a2 factor:(SEL)a3
{
  long long v50 = 0u;
  long long v51 = 0u;
  float v52 = 1.0;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  std::vector<CGPoint>::reserve((void **)&retstr->__begin_, (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4);
  v9 = *(double **)a4;
  v10 = (double *)*((void *)a4 + 1);
  if (*(double **)a4 != v10)
  {
    while (1)
    {
      double v12 = *v9;
      double v11 = v9[1];
      double v13 = floor(*v9 / a5);
      double v14 = floor(v11 / a5);
      *(double *)&long long v49 = v13;
      *((double *)&v49 + 1) = v14;
      unint64_t v15 = PKHashBytes((uint64_t)&v49, 16);
      unint64_t v16 = v15;
      unint64_t v17 = *((void *)&v50 + 1);
      if (*((void *)&v50 + 1))
      {
        uint8x8_t v18 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v50 + 8));
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          unint64_t v19 = v15;
          if (v15 >= *((void *)&v50 + 1)) {
            unint64_t v19 = v15 % *((void *)&v50 + 1);
          }
        }
        else
        {
          unint64_t v19 = (*((void *)&v50 + 1) - 1) & v15;
        }
        v20 = *(double ***)(v50 + 8 * v19);
        if (v20)
        {
          for (i = *v20; i; i = *(double **)i)
          {
            unint64_t v22 = *((void *)i + 1);
            if (v22 == v15)
            {
              if (i[2] == v13 && i[3] == v14) {
                goto LABEL_81;
              }
            }
            else
            {
              if (v18.u32[0] > 1uLL)
              {
                if (v22 >= *((void *)&v50 + 1)) {
                  v22 %= *((void *)&v50 + 1);
                }
              }
              else
              {
                v22 &= *((void *)&v50 + 1) - 1;
              }
              if (v22 != v19) {
                break;
              }
            }
          }
        }
        if (v18.u32[0] > 1uLL)
        {
          unint64_t v5 = v15;
          if (v15 >= *((void *)&v50 + 1)) {
            unint64_t v5 = v15 % *((void *)&v50 + 1);
          }
        }
        else
        {
          unint64_t v5 = (*((void *)&v50 + 1) - 1) & v15;
        }
        v24 = *(double ***)(v50 + 8 * v5);
        if (v24)
        {
          for (j = *v24; j; j = *(double **)j)
          {
            unint64_t v26 = *((void *)j + 1);
            if (v26 == v15)
            {
              if (j[2] == v13 && j[3] == v14) {
                goto LABEL_64;
              }
            }
            else
            {
              if (v18.u32[0] > 1uLL)
              {
                if (v26 >= *((void *)&v50 + 1)) {
                  v26 %= *((void *)&v50 + 1);
                }
              }
              else
              {
                v26 &= *((void *)&v50 + 1) - 1;
              }
              if (v26 != v5) {
                break;
              }
            }
          }
        }
      }
      v28 = operator new(0x20uLL);
      void *v28 = 0;
      v28[1] = v16;
      *((_OWORD *)v28 + 1) = v49;
      float v29 = (float)(unint64_t)(*((void *)&v51 + 1) + 1);
      if (!v17 || (float)(v52 * (float)v17) < v29)
      {
        BOOL v30 = v17 < 3 || (v17 & (v17 - 1)) != 0;
        unint64_t v31 = v30 | (2 * v17);
        unint64_t v32 = vcvtps_u32_f32(v29 / v52);
        if (v31 <= v32) {
          size_t v33 = v32;
        }
        else {
          size_t v33 = v31;
        }
        unint64_t v17 = *((void *)&v50 + 1);
        if ((*((void *)&v50 + 1) & (*((void *)&v50 + 1) - 1)) != 0)
        {
          if (v16 >= *((void *)&v50 + 1)) {
            unint64_t v5 = v16 % *((void *)&v50 + 1);
          }
          else {
            unint64_t v5 = v16;
          }
        }
        else
        {
          unint64_t v5 = (*((void *)&v50 + 1) - 1) & v16;
        }
      }
      uint64_t v34 = v50;
      v35 = *(void **)(v50 + 8 * v5);
      if (v35) {
        break;
      }
      void *v28 = v51;
      *(void *)&long long v51 = v28;
      *(void *)(v34 + 8 * v5) = &v51;
      if (*v28)
      {
        unint64_t v36 = *(void *)(*v28 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v36 >= v17) {
            v36 %= v17;
          }
        }
        else
        {
          v36 &= v17 - 1;
        }
        v35 = (void *)(v50 + 8 * v36);
        goto LABEL_62;
      }
LABEL_63:
      ++*((void *)&v51 + 1);
LABEL_64:
      end = retstr->__end_;
      value = retstr->__end_cap_.__value_;
      if (end >= value)
      {
        begin = retstr->__begin_;
        uint64_t v41 = end - retstr->__begin_;
        unint64_t v42 = v41 + 1;
        if ((unint64_t)(v41 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v43 = (char *)value - (char *)begin;
        if (v43 >> 3 > v42) {
          unint64_t v42 = v43 >> 3;
        }
        if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v44 = v42;
        }
        if (v44)
        {
          v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&retstr->__end_cap_, v44);
          begin = retstr->__begin_;
          end = retstr->__end_;
        }
        else
        {
          v45 = 0;
        }
        v46 = (CGPoint *)&v45[16 * v41];
        v46->x = v12;
        v46->y = v11;
        v47 = v46;
        if (end != begin)
        {
          do
          {
            v47[-1] = end[-1];
            --v47;
            --end;
          }
          while (end != begin);
          begin = retstr->__begin_;
        }
        v39 = v46 + 1;
        retstr->__begin_ = v47;
        retstr->__end_ = v46 + 1;
        retstr->__end_cap_.__value_ = (CGPoint *)&v45[16 * v44];
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        end->x = v12;
        end->y = v11;
        v39 = end + 1;
      }
      retstr->__end_ = v39;
LABEL_81:
      v9 += 2;
      if (v9 == v10) {
    }
      }
    void *v28 = *v35;
LABEL_62:
    void *v35 = v28;
    goto LABEL_63;
  }
}

+ (void)smoothedHullForPoints:(const void *)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  if (*(void *)a3 == *((void *)a3 + 1))
  {
    v8 = [MEMORY[0x1E4FB14C0] bezierPath];
    v6[2](v6, v8);
  }
  else
  {
    [a1 smoothedHullForPoints:a3 alpha:0.5 granularity:100.0 minAngleFactor:1.57079633 maxLengthThreshold:5.0 edgeRemovalConstant:0.3];
    v7 = [a1 bezierPathFromPoints:__p];
    v6[2](v6, v7);

    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
}

+ (id)bezierPathFromPoints:(const void *)a3
{
  if (*((void *)a3 + 1) - *(void *)a3 < 0x11uLL)
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v4, "moveToPoint:", **(double **)a3, *(double *)(*(void *)a3 + 8));
    unint64_t v5 = *(double **)a3;
    if (*((void *)a3 + 1) - *(void *)a3 >= 0x11uLL)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 1;
      do
      {
        objc_msgSend(v4, "addLineToPoint:", v5[v6 + 2], v5[v6 + 3]);
        ++v7;
        unint64_t v5 = *(double **)a3;
        v6 += 2;
      }
      while (v7 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
    }
    [v4 closePath];
  }

  return v4;
}

+ (vector<CGPoint,)smoothedHullForPoints:(id)a2
{
  return (vector<CGPoint, std::allocator<CGPoint>> *)[a2 smoothedHullForPoints:a4 alpha:0.5 granularity:100.0 minAngleFactor:1.57079633 maxLengthThreshold:5.0 edgeRemovalConstant:0.3];
}

+ (vector<CGPoint,)smoothedHullForPoints:(id)a2 alpha:(SEL)a3 granularity:(const void *)a4 minAngleFactor:(double)a5 maxLengthThreshold:(double)a6 edgeRemovalConstant:(double)a7
{
  __p = 0;
  uint8x8_t v18 = 0;
  uint64_t v19 = 0;
  +[PKPathUtility convexHull:&__p forPoints:a4];
  [a2 openConvexHullToConcave:&__p points:a4 minAngleFactor:a7 maxLengthThreshold:a8 edgeRemovalConstant:a9];
  [a2 centripetalCatmullRomPointsFromConvexHull:&__p alpha:a5 granularity:a6];
  result = (vector<CGPoint, std::allocator<CGPoint>> *)__p;
  if (__p)
  {
    uint8x8_t v18 = __p;
    operator delete(__p);
  }
  return result;
}

+ (void)convexHull:(void *)a3 forPoints:(const void *)a4
{
  v131 = 0;
  v132 = 0;
  uint64_t v133 = 0;
  std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&v131, *(const void **)a4, *((void *)a4 + 1), (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4);
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v8 = (char *)v131;
  if (v132 == v131)
  {
    int v10 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    int v10 = 0;
    unint64_t v11 = (v132 - (unsigned char *)v131) >> 4;
    if (v11 <= 1) {
      unint64_t v11 = 1;
    }
    double v12 = (double *)((char *)v131 + 8);
    v5.n128_u64[0] = 0xFFEFFFFFFFFFFFFFLL;
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v14 = *MEMORY[0x1E4F1DAD8];
    do
    {
      double v6 = *(v12 - 1);
      double v7 = *v12;
      if (*v12 <= v5.n128_f64[0])
      {
        if (*v12 == v5.n128_f64[0] && v6 < v14)
        {
          int v10 = v9;
        }
        else
        {
          double v6 = v14;
          double v7 = v13;
        }
      }
      else
      {
        int v10 = v9;
        v5.n128_f64[0] = *v12;
      }
      ++v9;
      v12 += 2;
      double v13 = v7;
      double v14 = v6;
    }
    while (v11 != v9);
  }
  unint64_t v16 = (char *)v131 + 16 * v10;
  int64_t v17 = v132 - (v16 + 16);
  if (v132 != v16 + 16)
  {
    memmove((char *)v131 + 16 * v10, v16 + 16, v132 - (v16 + 16));
    v8 = (char *)v131;
  }
  uint8x8_t v18 = &v16[v17];
  v132 = &v16[v17];
  uint64_t v19 = &v16[v17] - v8;
  if (&v16[v17] == v8)
  {
    v20 = 0;
    v21 = 0;
  }
  else
  {
    if (v19 < 0) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    v20 = (__n128 *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::LocalMinimum>>(v19 >> 4);
    v21 = (__n128 *)((char *)v20 + 24 * v22);
    v8 = (char *)v131;
    uint8x8_t v18 = v132;
  }
  if (v8 >= v18)
  {
    v23 = v20;
  }
  else
  {
    v23 = v20;
    do
    {
      double v25 = *(double *)v8;
      double v24 = *((double *)v8 + 1);
      v5.n128_f64[0] = atan2(v24 - v7, *(double *)v8 - v6);
      unint64_t v26 = v5.n128_u64[0];
      if (v23 >= v21)
      {
        unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3) + 1;
        if (v27 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v21 - (char *)v20) >> 3) > v27) {
          unint64_t v27 = 0x5555555555555556 * (((char *)v21 - (char *)v20) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (char *)v20) >> 3) >= 0x555555555555555) {
          unint64_t v28 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v28 = v27;
        }
        if (v28) {
          unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::LocalMinimum>>(v28);
        }
        else {
          uint64_t v29 = 0;
        }
        unint64_t v30 = v28 + 8 * (((char *)v23 - (char *)v20) >> 3);
        *(double *)unint64_t v30 = v25;
        *(double *)(v30 + 8) = v24;
        *(void *)(v30 + 16) = v26;
        if (v23 == v20)
        {
          unint64_t v32 = (__n128 *)(v28 + 8 * (((char *)v23 - (char *)v20) >> 3));
        }
        else
        {
          unint64_t v31 = v28 + 8 * (((char *)v23 - (char *)v20) >> 3);
          do
          {
            __n128 v5 = *(__n128 *)((char *)v23 - 24);
            unint64_t v32 = (__n128 *)(v31 - 24);
            *(void *)(v31 - 8) = v23[-1].n128_u64[1];
            *(__n128 *)(v31 - 24) = v5;
            v23 = (__n128 *)((char *)v23 - 24);
            v31 -= 24;
          }
          while (v23 != v20);
        }
        v21 = (__n128 *)(v28 + 24 * v29);
        v23 = (__n128 *)(v30 + 24);
        if (v20) {
          operator delete(v20);
        }
        v20 = v32;
      }
      else
      {
        v23->n128_f64[0] = v25;
        v23->n128_f64[1] = v24;
        v23[1].n128_u64[0] = v5.n128_u64[0];
        v23 = (__n128 *)((char *)v23 + 24);
      }
      v8 += 16;
    }
    while (v8 < v132);
  }
  if ((char *)v23 - (char *)v20 < 3073)
  {
LABEL_50:
    std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(v20, v23, 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3), 0, 0, v5);
  }
  else
  {
    size_t v33 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3);
    while (1)
    {
      v35 = operator new(24 * v34, v33);
      if (v35) {
        break;
      }
      BOOL v36 = v34 > 1;
      v34 >>= 1;
      if (!v36) {
        goto LABEL_50;
      }
    }
    v37 = v35;
    std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(v20, v23, 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3), (uint64_t)v35, v34, v5);
    operator delete(v37);
  }
  if (v23 != v20)
  {
    uint64_t v38 = 0;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3) <= 1) {
      unint64_t v39 = 1;
    }
    else {
      unint64_t v39 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3);
    }
    v40 = v20;
    do
    {
      __n128 v41 = *v40;
      v40 = (__n128 *)((char *)v40 + 24);
      *(__n128 *)((char *)v131 + v38) = v41;
      v38 += 16;
      --v39;
    }
    while (v39);
  }
  __p = 0;
  v129 = 0;
  v130 = 0;
  std::vector<CGPoint>::reserve(&__p, (v132 - (unsigned char *)v131) >> 4);
  unint64_t v42 = v129;
  if (v129 >= v130)
  {
    unint64_t v44 = (double *)__p;
    uint64_t v45 = ((char *)v129 - (unsigned char *)__p) >> 4;
    unint64_t v46 = v45 + 1;
    if ((unint64_t)(v45 + 1) >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v47 = (char *)v130 - (unsigned char *)__p;
    if (((char *)v130 - (unsigned char *)__p) >> 3 > v46) {
      unint64_t v46 = v47 >> 3;
    }
    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v48 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v48 = v46;
    }
    if (v48)
    {
      long long v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v130, v48);
      unint64_t v44 = (double *)__p;
      unint64_t v42 = v129;
    }
    else
    {
      long long v49 = 0;
    }
    long long v50 = (double *)&v49[16 * v45];
    long long v51 = &v49[16 * v48];
    *long long v50 = v6;
    v50[1] = v7;
    uint64_t v43 = v50 + 2;
    if (v42 != v44)
    {
      do
      {
        *((_OWORD *)v50 - 1) = *((_OWORD *)v42 - 1);
        v50 -= 2;
        v42 -= 2;
      }
      while (v42 != v44);
      unint64_t v44 = (double *)__p;
    }
    __p = v50;
    v129 = v43;
    v130 = (double *)v51;
    if (v44) {
      operator delete(v44);
    }
  }
  else
  {
    double *v129 = v6;
    v42[1] = v7;
    uint64_t v43 = v42 + 2;
  }
  v129 = v43;
  v53 = (char *)v131;
  float v52 = v132;
  if (v132 - (unsigned char *)v131 != 16)
  {
    unint64_t v54 = 0;
    do
    {
      long long v55 = *(_OWORD *)&v53[16 * v54++];
      long long v126 = v55;
      if (fabs((*((double *)&v55 + 1) - v7) * (*(double *)&v53[16 * v54] - *(double *)&v55)- (*(double *)&v55 - v6) * (*(double *)&v53[16 * v54 + 8] - *((double *)&v55 + 1))) >= 0.000001)
      {
        if (v43 >= v130)
        {
          v57 = (double *)__p;
          uint64_t v58 = ((char *)v43 - (unsigned char *)__p) >> 4;
          unint64_t v59 = v58 + 1;
          if ((unint64_t)(v58 + 1) >> 60) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v60 = (char *)v130 - (unsigned char *)__p;
          if (((char *)v130 - (unsigned char *)__p) >> 3 > v59) {
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
            v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v130, v61);
            v57 = (double *)__p;
            uint64_t v43 = v129;
          }
          else
          {
            v62 = 0;
          }
          v63 = (double *)&v62[16 * v58];
          *(_OWORD *)v63 = v126;
          v56 = v63 + 2;
          if (v43 != v57)
          {
            do
            {
              *((_OWORD *)v63 - 1) = *((_OWORD *)v43 - 1);
              v63 -= 2;
              v43 -= 2;
            }
            while (v43 != v57);
            v57 = (double *)__p;
          }
          __p = v63;
          v129 = v56;
          v130 = (double *)&v62[16 * v61];
          if (v57) {
            operator delete(v57);
          }
        }
        else
        {
          *(_OWORD *)uint64_t v43 = v55;
          v56 = v43 + 2;
        }
        v129 = v56;
        uint64_t v43 = v56;
        v53 = (char *)v131;
        float v52 = v132;
      }
    }
    while (((v52 - v53) >> 4) - 1 > v54);
  }
  long long v127 = *((_OWORD *)v52 - 1);
  if (v43 >= v130)
  {
    uint64_t v65 = ((char *)v43 - (unsigned char *)__p) >> 4;
    if ((unint64_t)(v65 + 1) >> 60) {
      goto LABEL_201;
    }
    unint64_t v66 = ((char *)v130 - (unsigned char *)__p) >> 3;
    if (v66 <= v65 + 1) {
      unint64_t v66 = v65 + 1;
    }
    if ((unint64_t)((char *)v130 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v67 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v67 = v66;
    }
    if (v67) {
      v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v130, v67);
    }
    else {
      v68 = 0;
    }
    v69 = &v68[16 * v65];
    v70 = &v68[16 * v67];
    *(_OWORD *)v69 = v127;
    uint64_t v64 = (uint64_t)(v69 + 16);
    v72 = (char *)__p;
    v71 = (char *)v129;
    if (v129 != __p)
    {
      do
      {
        *((_OWORD *)v69 - 1) = *((_OWORD *)v71 - 1);
        v69 -= 16;
        v71 -= 16;
      }
      while (v71 != v72);
      v71 = (char *)__p;
    }
    __p = v69;
    v129 = (double *)v64;
    v130 = (double *)v70;
    if (v71) {
      operator delete(v71);
    }
  }
  else
  {
    *(_OWORD *)uint64_t v43 = *((_OWORD *)v52 - 1);
    uint64_t v64 = (uint64_t)(v43 + 2);
  }
  v129 = (double *)v64;
  v73 = (double *)__p;
  if ((unint64_t)(v64 - (void)__p) <= 0x2F)
  {
    if (&__p != a3)
    {
      std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)a3, (char *)__p, v64, (v64 - (uint64_t)__p) >> 4);
      v73 = (double *)__p;
    }
    goto LABEL_189;
  }
  std::vector<CGPoint>::reserve((void **)a3, (v64 - (uint64_t)__p) >> 4);
  v75 = (double **)((char *)a3 + 16);
  v74 = (double *)*((void *)a3 + 2);
  v76 = (double *)*((void *)a3 + 1);
  if (v76 >= v74)
  {
    v78 = *(double **)a3;
    uint64_t v79 = ((uint64_t)v76 - *(void *)a3) >> 4;
    unint64_t v80 = v79 + 1;
    if ((unint64_t)(v79 + 1) >> 60) {
      goto LABEL_201;
    }
    uint64_t v81 = (char *)v74 - (char *)v78;
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
      v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v82);
      v78 = *(double **)a3;
      v76 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v83 = 0;
    }
    v84 = (double *)&v83[16 * v79];
    v74 = (double *)&v83[16 * v82];
    double *v84 = v6;
    v84[1] = v7;
    v77 = v84 + 2;
    if (v76 != v78)
    {
      do
      {
        *((_OWORD *)v84 - 1) = *((_OWORD *)v76 - 1);
        v84 -= 2;
        v76 -= 2;
      }
      while (v76 != v78);
      v78 = *(double **)a3;
    }
    *(void *)a3 = v84;
    *((void *)a3 + 1) = v77;
    *((void *)a3 + 2) = v74;
    if (v78)
    {
      operator delete(v78);
      v74 = *v75;
    }
  }
  else
  {
    double *v76 = v6;
    v76[1] = v7;
    v77 = v76 + 2;
  }
  *((void *)a3 + 1) = v77;
  v85 = (char *)__p + 16;
  if (v77 >= v74)
  {
    uint64_t v87 = ((uint64_t)v77 - *(void *)a3) >> 4;
    if ((unint64_t)(v87 + 1) >> 60) {
      goto LABEL_201;
    }
    uint64_t v88 = (uint64_t)v74 - *(void *)a3;
    uint64_t v89 = v88 >> 3;
    if (v88 >> 3 <= (unint64_t)(v87 + 1)) {
      uint64_t v89 = v87 + 1;
    }
    if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v90 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v90 = v89;
    }
    if (v90) {
      v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v90);
    }
    else {
      v91 = 0;
    }
    v92 = &v91[16 * v87];
    v93 = &v91[16 * v90];
    *(_OWORD *)v92 = *v85;
    v86 = v92 + 16;
    v95 = *(double **)a3;
    v94 = (double *)*((void *)a3 + 1);
    if (v94 != *(double **)a3)
    {
      do
      {
        *((_OWORD *)v92 - 1) = *((_OWORD *)v94 - 1);
        v92 -= 16;
        v94 -= 2;
      }
      while (v94 != v95);
      v94 = *(double **)a3;
    }
    *(void *)a3 = v92;
    *((void *)a3 + 1) = v86;
    *((void *)a3 + 2) = v93;
    if (v94) {
      operator delete(v94);
    }
  }
  else
  {
    *(_OWORD *)v77 = *v85;
    v86 = v77 + 2;
  }
  *((void *)a3 + 1) = v86;
  v96 = (char *)__p + 32;
  unint64_t v97 = *((void *)a3 + 2);
  if ((unint64_t)v86 >= v97)
  {
    uint64_t v99 = ((uint64_t)v86 - *(void *)a3) >> 4;
    if (!((unint64_t)(v99 + 1) >> 60))
    {
      uint64_t v100 = v97 - *(void *)a3;
      uint64_t v101 = v100 >> 3;
      if (v100 >> 3 <= (unint64_t)(v99 + 1)) {
        uint64_t v101 = v99 + 1;
      }
      if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v102 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v102 = v101;
      }
      if (v102) {
        v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v102);
      }
      else {
        v103 = 0;
      }
      v104 = &v103[16 * v99];
      v105 = &v103[16 * v102];
      *(_OWORD *)v104 = *v96;
      v98 = (double *)(v104 + 16);
      v107 = *(double **)a3;
      v106 = (double *)*((void *)a3 + 1);
      if (v106 != *(double **)a3)
      {
        do
        {
          *((_OWORD *)v104 - 1) = *((_OWORD *)v106 - 1);
          v104 -= 16;
          v106 -= 2;
        }
        while (v106 != v107);
        v106 = *(double **)a3;
      }
      *(void *)a3 = v104;
      *((void *)a3 + 1) = v98;
      *((void *)a3 + 2) = v105;
      if (v106) {
        operator delete(v106);
      }
      goto LABEL_162;
    }
LABEL_201:
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  }
  _OWORD *v86 = *v96;
  v98 = (double *)(v86 + 1);
LABEL_162:
  *((void *)a3 + 1) = v98;
  v73 = (double *)__p;
  if ((unint64_t)((char *)v129 - (unsigned char *)__p) >= 0x31)
  {
    unint64_t v108 = 3;
    do
    {
      v109 = *(double **)a3;
      v110 = &v73[2 * v108];
      double v111 = *v110;
      double v112 = v110[1];
      for (uint64_t i = (uint64_t)v98 - *(void *)a3; ; i -= 16)
      {
        double v114 = (*(double *)((char *)v109 + i - 8) - *(double *)((char *)v109 + i - 24))
             * (v111 - *(double *)((char *)v109 + i - 16))
             - (*(double *)((char *)v109 + i - 16) - *(double *)((char *)v109 + i - 32))
             * (v112 - *(double *)((char *)v109 + i - 8));
        double v115 = fabs(v114);
        BOOL v116 = v114 > 0.0 || v115 < 0.000001;
        if (!v116 || (unint64_t)i < 0x21) {
          break;
        }
        v98 -= 2;
        *((void *)a3 + 1) = v98;
      }
      if (v98 >= *v75)
      {
        uint64_t v117 = i >> 4;
        unint64_t v118 = (i >> 4) + 1;
        if (v118 >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v119 = (char *)*v75 - (char *)v109;
        if (v119 >> 3 > v118) {
          unint64_t v118 = v119 >> 3;
        }
        if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v120 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v120 = v118;
        }
        if (v120) {
          v121 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v120);
        }
        else {
          v121 = 0;
        }
        v122 = &v121[16 * v117];
        *(_OWORD *)v122 = *(_OWORD *)v110;
        v124 = *(double **)a3;
        v123 = (double *)*((void *)a3 + 1);
        v125 = v122;
        if (v123 != *(double **)a3)
        {
          do
          {
            *((_OWORD *)v125 - 1) = *((_OWORD *)v123 - 1);
            v125 -= 16;
            v123 -= 2;
          }
          while (v123 != v124);
          v123 = *(double **)a3;
        }
        v98 = (double *)(v122 + 16);
        *(void *)a3 = v125;
        *((void *)a3 + 1) = v122 + 16;
        *((void *)a3 + 2) = &v121[16 * v120];
        if (v123) {
          operator delete(v123);
        }
      }
      else
      {
        *(_OWORD *)v98 = *(_OWORD *)v110;
        v98 += 2;
      }
      *((void *)a3 + 1) = v98;
      ++v108;
      v73 = (double *)__p;
    }
    while (v108 < ((char *)v129 - (unsigned char *)__p) >> 4);
  }
LABEL_189:
  if (v73)
  {
    v129 = v73;
    operator delete(v73);
  }
  if (v20) {
    operator delete(v20);
  }
  if (v131)
  {
    v132 = (char *)v131;
    operator delete(v131);
  }
}

+ (vector<CGPoint,)centripetalCatmullRomPointsFromConvexHull:(id)a2 alpha:(SEL)a3 granularity:(const void *)a4
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  std::vector<CGPoint>::reserve((void **)&retstr->__begin_, 0);
  double v11 = **(double **)a4;
  double v10 = *(double *)(*(void *)a4 + 8);
  p_end_cap = &retstr->__end_cap_;
  value = retstr->__end_cap_.__value_;
  end = retstr->__end_;
  if (end >= value)
  {
    result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
    uint64_t v16 = end - retstr->__begin_;
    unint64_t v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v18 = (char *)value - (char *)result;
    if (v18 >> 3 > v17) {
      unint64_t v17 = v18 >> 3;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v17;
    }
    if (v19)
    {
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&retstr->__end_cap_, v19);
      result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
      end = retstr->__end_;
    }
    else
    {
      v20 = 0;
    }
    v21 = (CGPoint *)&v20[16 * v16];
    uint64_t v22 = (CGPoint *)&v20[16 * v19];
    v21->x = v11;
    v21->y = v10;
    unint64_t v15 = v21 + 1;
    if (end != (CGPoint *)result)
    {
      do
      {
        v21[-1] = end[-1];
        --v21;
        --end;
      }
      while (end != (CGPoint *)result);
      result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
    }
    retstr->__begin_ = v21;
    retstr->__end_ = v15;
    retstr->__end_cap_.__value_ = v22;
    if (result) {
      operator delete(result);
    }
  }
  else
  {
    end->x = v11;
    end->y = v10;
    unint64_t v15 = end + 1;
  }
  retstr->__end_ = v15;
  v23 = *(double **)a4;
  uint64_t v24 = *((void *)a4 + 1);
  if (v24 != *(void *)a4)
  {
    unint64_t v25 = 0;
    unint64_t v26 = (unint64_t)(v24 - *(void *)a4) >> 4;
    float v27 = a5;
    double v28 = 0.0;
    float v73 = v27;
    do
    {
      double v29 = v28;
      int v30 = v25 + 2;
      unsigned int v31 = (int)v25 % (int)v26;
      if (v25) {
        unint64_t v32 = v25;
      }
      else {
        unint64_t v32 = v26;
      }
      ++v25;
      size_t v33 = (double *)((char *)v23 + ((uint64_t)((v32 << 32) - 0x100000000) >> 28));
      unint64_t v34 = &v23[2 * v31];
      double v35 = *v34;
      double v36 = v34[1];
      v37 = &v23[2 * ((int)v25 % (int)v26)];
      double v38 = *v37;
      double v39 = v37[1];
      v40 = &v23[2 * (v30 % (int)v26)];
      double v86 = v33[1];
      double v87 = *v33;
      double v84 = v36;
      double v85 = v35;
      double v41 = sqrt((v39 - v36) * (v39 - v36) + (v38 - v35) * (v38 - v35));
      double v82 = v39;
      double v83 = *v37;
      double v80 = v40[1];
      double v81 = *v40;
      double v42 = sqrt((v80 - v39) * (v80 - v39) + (v81 - v38) * (v81 - v38));
      float v43 = sqrt((v36 - v86) * (v36 - v86) + (v35 - v87) * (v35 - v87));
      double v28 = v28 + powf(v43, v27);
      float v44 = v41;
      double v45 = v28 + powf(v44, v27);
      float v46 = v42;
      float v47 = powf(v46, v27);
      if (v28 < v45)
      {
        double v48 = v10;
        double v49 = v11;
        double v76 = v28 - v29;
        double v77 = v45 + v47;
        double v50 = v45 - v28;
        double v51 = v77 - v45;
        double v78 = v29;
        double v79 = v28;
        double v52 = v45 - v29;
        double v53 = v77 - v28;
        double v75 = (v45 - v28) / a6;
        do
        {
          double v54 = (v79 - v28) / v76;
          double v55 = (v28 - v78) / v76;
          double v56 = v87 * v54 + v85 * v55;
          double v57 = v86 * v54 + v84 * v55;
          double v58 = (v45 - v28) / v50;
          double v59 = (v28 - v79) / v50;
          double v60 = (v77 - v28) / v51;
          double v61 = (v28 - v45) / v51;
          double v62 = (v45 - v28) / v52;
          double v63 = (v28 - v78) / v52;
          double v64 = (v77 - v28) / v53;
          double v65 = (v28 - v79) / v53;
          double v11 = v58 * (v62 * v56 + v63 * (v85 * v58 + v83 * v59))
              + v59 * (v64 * (v85 * v58 + v83 * v59) + v65 * (v83 * v60 + v81 * v61));
          double v10 = v58 * (v62 * v57 + v63 * (v84 * v58 + v82 * v59))
              + v59 * (v64 * (v84 * v58 + v82 * v59) + v65 * (v82 * v60 + v80 * v61));
          if (floor(v49) == floor(v11) && floor(v48) == floor(v10))
          {
            double v11 = v49;
            double v10 = v48;
          }
          else
          {
            if (v15 >= p_end_cap->__value_)
            {
              result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
              uint64_t v66 = v15 - retstr->__begin_;
              unint64_t v67 = v66 + 1;
              if ((unint64_t)(v66 + 1) >> 60) {
                std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v68 = (char *)p_end_cap->__value_ - (char *)result;
              if (v68 >> 3 > v67) {
                unint64_t v67 = v68 >> 3;
              }
              if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v69 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v69 = v67;
              }
              if (v69)
              {
                v70 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&retstr->__end_cap_, v69);
                result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
                unint64_t v15 = retstr->__end_;
              }
              else
              {
                v70 = 0;
              }
              v71 = (CGPoint *)&v70[16 * v66];
              v71->x = v11;
              v71->y = v10;
              v72 = v71;
              if (v15 != (CGPoint *)result)
              {
                do
                {
                  v72[-1] = v15[-1];
                  --v72;
                  --v15;
                }
                while (v15 != (CGPoint *)result);
                result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
              }
              unint64_t v15 = v71 + 1;
              retstr->__begin_ = v72;
              retstr->__end_ = v71 + 1;
              retstr->__end_cap_.__value_ = (CGPoint *)&v70[16 * v69];
              if (result) {
                operator delete(result);
              }
            }
            else
            {
              v15->x = v11;
              v15->y = v10;
              ++v15;
            }
            retstr->__end_ = v15;
            double v48 = v10;
            double v49 = v11;
          }
          double v28 = v75 + v28;
        }
        while (v28 < v45);
        v23 = *(double **)a4;
        uint64_t v24 = *((void *)a4 + 1);
        float v27 = v73;
        double v28 = v79;
      }
    }
    while (v25 < (v24 - (uint64_t)v23) >> 4);
  }
  return result;
}

+ (double)averageDistanceForEdge:(Edge)a3 withPoints:(const void *)a4
{
  v4 = *(double **)a4;
  __n128 v5 = (double *)*((void *)a4 + 1);
  if (*(double **)a4 == v5)
  {
    int v6 = 0;
    double v7 = 0.0;
  }
  else
  {
    int v6 = 0;
    double v7 = 0.0;
    do
    {
      double v8 = v4[1];
      if (*v4 != a3.var0.x || v8 != a3.var0.y)
      {
        double v10 = sqrt((a3.var0.y - v8) * (a3.var0.y - v8) + (a3.var0.x - *v4) * (a3.var0.x - *v4));
        if (v10 >= 150.0) {
          double v10 = -0.0;
        }
        else {
          ++v6;
        }
        double v7 = v7 + v10;
      }
      v4 += 2;
    }
    while (v4 != v5);
  }
  return v7 / (double)v6;
}

+ (CGPoint)pointWithMinAngleForEdge:(Edge)a3 fromPoints:(const void *)a4 minAngle:(double *)a5
{
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v8 = *((void *)a4 + 1) - *(void *)a4;
  if (v8)
  {
    unint64_t v9 = v8 >> 4;
    double v10 = 1.0
        / sqrt((a3.var0.y - a3.var1.y) * (a3.var0.y - a3.var1.y) + (a3.var0.x - a3.var1.x) * (a3.var0.x - a3.var1.x));
    double v26 = (a3.var0.y - a3.var1.y) * v10;
    double v27 = (a3.var0.x - a3.var1.x) * v10;
    if (v9 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v9;
    }
    double v12 = (double *)(*(void *)a4 + 8);
    double v13 = 1.79769313e308;
    do
    {
      double v15 = *(v12 - 1);
      double v14 = *v12;
      CGFloat v16 = a3.var0.y - *v12;
      double v17 = 1.0 / sqrt(v16 * v16 + (a3.var0.x - v15) * (a3.var0.x - v15));
      CGFloat v18 = (a3.var0.x - v15) * v17;
      CGFloat v19 = v16 * v17;
      double v20 = *v12 - a3.var1.y;
      double v21 = 1.0 / sqrt(v20 * v20 + (v15 - a3.var1.x) * (v15 - a3.var1.x));
      double v29 = v20 * v21;
      double v30 = (v15 - a3.var1.x) * v21;
      double v22 = acos(v26 * v19 + v18 * v27);
      double v23 = acos(v19 * v29 + v18 * v30);
      if (v22 > v23) {
        double v23 = v22;
      }
      if (v23 < v13)
      {
        double v13 = v23;
        double v7 = v15;
        double v6 = v14;
      }
      v12 += 2;
      --v11;
    }
    while (v11);
  }
  else
  {
    double v13 = 1.79769313e308;
  }
  *a5 = v13;
  double v24 = v7;
  double v25 = v6;
  result.y = v25;
  result.x = v24;
  return result;
}

+ (Edge)longestEdgeInHull:(const void *)a3 atIndex:(int *)a4 visitedEdges:(const void *)a5
{
  __n128 v5 = *(double **)a3;
  uint64_t v6 = *((void *)a3 + 1);
  double v8 = **(double **)a3;
  double v7 = *(double *)(*(void *)a3 + 8);
  unint64_t v9 = v6 - *(void *)a3;
  double v11 = *(double *)(v6 - 16);
  double v10 = *(double *)(v6 - 8);
  *a4 = (v9 >> 4) - 1;
  double v28 = v10;
  if (v9 != 32)
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    double v18 = sqrt((v7 - v10) * (v7 - v10) + (v8 - v11) * (v8 - v11));
    do
    {
      CGFloat v19 = &v5[v16];
      double v20 = *v19;
      double v21 = v19[1];
      double v22 = v19[2];
      double v23 = v19[3];
      if ((objc_msgSend(a1, "edgeSet:containsEdge:", a5, *v19, v21, v22, v23) & 1) == 0
        && sqrt((v21 - v23) * (v21 - v23) + (v20 - v22) * (v20 - v22)) > v18)
      {
        *a4 = v17;
        double v28 = v23;
        double v11 = v22;
        double v7 = v21;
        double v8 = v20;
      }
      ++v17;
      __n128 v5 = *(double **)a3;
      v16 += 2;
    }
    while (((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4) - 2 > v17);
  }
  double v24 = v8;
  double v25 = v7;
  double v26 = v11;
  double v27 = v28;
  result.var1.y = v27;
  result.var1.x = v26;
  result.var0.y = v25;
  result.var0.x = v24;
  return result;
}

+ (void)openConvexHullToConcave:(void *)a3 points:(const void *)a4 minAngleFactor:(double)a5 maxLengthThreshold:(double)a6 edgeRemovalConstant:(double)a7
{
  int v38 = 0;
  memset(v36, 0, sizeof(v36));
  int v37 = 1065353216;
  +[PKPathUtility longestEdgeInHull:a3 atIndex:&v38 visitedEdges:v36];
  while (1)
  {
    double v16 = v12;
    double v17 = v13;
    double v18 = v14;
    double v19 = v15;
    v35[0] = v12;
    v35[1] = v13;
    v35[2] = v14;
    v35[3] = v15;
    if (sqrt((v13 - v15) * (v13 - v15) + (v12 - v14) * (v12 - v14)) <= a6
      || +[PKPathUtility edgeSet:containsEdge:](PKPathUtility, "edgeSet:containsEdge:", v36, v12, v13, v14, v15))
    {
      break;
    }
    +[PKPathUtility averageDistanceForEdge:withPoints:](PKPathUtility, "averageDistanceForEdge:withPoints:", a4, v16, v17, v18, v19);
    if (sqrt((v17 - v19) * (v17 - v19) + (v16 - v18) * (v16 - v18)) <= v20 * a7
      || (double v33 = 0.0,
          double v34 = 0.0,
          double v32 = 0.0,
          +[PKPathUtility pointWithMinAngleForEdge:fromPoints:minAngle:](PKPathUtility, "pointWithMinAngleForEdge:fromPoints:minAngle:", a4, &v34, v16, v17, v18, v19), double v32 = v21, v33 = v22, v34 >= a5)|| +[PKPathUtility vector:containsPoint:](PKPathUtility, "vector:containsPoint:", a3)|| +[PKPathUtility newEdgeWithPoint:betweenEdge:intersectsOtherEdgesInHull:](PKPathUtility, "newEdgeWithPoint:betweenEdge:intersectsOtherEdgesInHull:", a3, v32, v33, v16,
           v17,
           v18,
           v19))
    {
    }
    else
    {
      std::vector<CGPoint>::insert((uint64_t)a3, (char *)(*(void *)a3 + 16 * v38 + 16), (char *)&v32);
    }
    +[PKPathUtility longestEdgeInHull:a3 atIndex:&v38 visitedEdges:v36];
  }
  uint64_t v23 = *(void *)a3;
  double v24 = (float64x2_t *)*((void *)a3 + 1);
  if ((unint64_t)v24 - *(void *)a3 >= 0x11)
  {
    int v25 = 0;
    unint64_t v26 = 1;
    int v27 = 1;
    do
    {
      double v28 = (float64x2_t *)(v23 + 16 * v25);
      int32x2_t v29 = vmovn_s64(vceqq_f64(vrndmq_f64(*v28), vrndmq_f64(*(float64x2_t *)(v23 + 16 * v26))));
      if (v29.i32[0] & v29.i32[1])
      {
        double v30 = v28 + 1;
        int64_t v31 = (char *)v24 - (char *)&v28[2];
        if (v24 != &v28[2])
        {
          memmove(&v28[1], &v28[2], (char *)v24 - (char *)&v28[2]);
          uint64_t v23 = *(void *)a3;
        }
        double v24 = (float64x2_t *)((char *)v30 + v31);
        *((void *)a3 + 1) = (char *)v30 + v31;
      }
      else
      {
        int v25 = v27;
      }
      int v27 = v25 + 1;
      unint64_t v26 = v25 + 1;
    }
    while (v26 < ((uint64_t)v24 - v23) >> 4);
  }
}

+ (BOOL)newEdgeWithPoint:(CGPoint)a3 betweenEdge:(Edge)a4 intersectsOtherEdgesInHull:(const void *)a5
{
  double x = a4.var1.x;
  uint64_t v6 = *(void *)a5;
  uint64_t v5 = *((void *)a5 + 1);
  if (v5 - *(void *)a5 == 16) {
    return 0;
  }
  double y = a4.var1.y;
  double v9 = a4.var0.y;
  double v10 = a4.var0.x;
  CGFloat v11 = a3.y;
  double v12 = a3.x;
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  double v28 = a4.var1.y;
  while (1)
  {
    uint64_t v15 = v6 + v13;
    double v16 = *(double *)(v6 + v13);
    double v17 = *(double *)(v6 + v13 + 8);
    if (v16 == v10 && v17 == v9) {
      goto LABEL_22;
    }
    double v19 = *(double *)(v15 + 16);
    double v20 = *(double *)(v15 + 24);
    if (v19 == x && v20 == y) {
      goto LABEL_22;
    }
    if (v19 == v10 && v20 == v9) {
      goto LABEL_22;
    }
    if (v16 == x && v17 == y) {
      goto LABEL_22;
    }
    CGFloat v24 = v11;
    if (+[PKPathUtility edge:intersectsEdge:](PKPathUtility, "edge:intersectsEdge:", v10, v9, v12)) {
      return 1;
    }
    double v25 = v24;
    double y = v28;
    if (+[PKPathUtility edge:intersectsEdge:](PKPathUtility, "edge:intersectsEdge:", v12, v25, x, v28, v16, v17, v19, v20))
    {
      return 1;
    }
    uint64_t v6 = *(void *)a5;
    uint64_t v5 = *((void *)a5 + 1);
    double v12 = a3.x;
    CGFloat v11 = a3.y;
LABEL_22:
    ++v14;
    v13 += 16;
    if (((v5 - v6) >> 4) - 1 <= v14) {
      return 0;
    }
  }
}

+ (BOOL)edge:(Edge)a3 intersectsEdge:(Edge)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  Edge v9 = a3;
  Edge v8 = a4;
  return DKDIntersectionOfLines(&v9.var0.x, &v8.var0.x, (double *)&v6, &v7, v5, 0, 0);
}

+ (BOOL)vector:(const void *)a3 containsPoint:(CGPoint)a4
{
  v4 = *(double **)a3;
  uint64_t v5 = *((void *)a3 + 1) - *(void *)a3;
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v5 >> 4;
  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  if (*v4 == a4.x && v4[1] == a4.y) {
    return 1;
  }
  Edge v9 = v4 + 3;
  uint64_t v10 = 1;
  do
  {
    unint64_t v11 = v10;
    if (v7 == v10) {
      break;
    }
    double v12 = *(v9 - 1);
    double v13 = *v9;
    ++v10;
    v9 += 2;
  }
  while (v12 != a4.x || v13 != a4.y);
  return v6 > v11;
}

+ (BOOL)edgeSet:(const void *)a3 containsEdge:(Edge)a4
{
  double y = a4.var1.y;
  double x = a4.var1.x;
  double v6 = a4.var0.y;
  double v7 = a4.var0.x;
  Edge v18 = a4;
  unint64_t v9 = PKHashBytes((uint64_t)&v18, 32);
  int8x8_t v10 = *(int8x8_t *)((char *)a3 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v12 = v9;
      if (v9 >= *(void *)&v10) {
        unint64_t v12 = v9 % *(void *)&v10;
      }
    }
    else
    {
      unint64_t v12 = (*(void *)&v10 - 1) & v9;
    }
    uint64_t i = *(double **)(*(void *)a3 + 8 * v12);
    if (i)
    {
      for (uint64_t i = *(double **)i; i; uint64_t i = *(double **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v9 == v14)
        {
          if (i[2] == v7 && i[3] == v6 && i[4] == x && i[5] == y) {
            return i != 0;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= *(void *)&v10) {
              v14 %= *(void *)&v10;
            }
          }
          else
          {
            v14 &= *(void *)&v10 - 1;
          }
          if (v14 != v12) {
            goto LABEL_27;
          }
        }
      }
    }
  }
  else
  {
LABEL_27:
    uint64_t i = 0;
  }
  return i != 0;
}

@end