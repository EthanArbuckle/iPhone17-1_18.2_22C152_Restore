@interface MKSpatialCollider
- (MKSpatialCollider)initWithAnnotationViews:(id)a3 previousCollissions:(id)a4 options:(int64_t)a5;
- (double)viewsCollidingWithAnnotationView:(uint64_t)a1 inCollidableList:;
- (double)viewsCollidingWithAnnotationView:(uint64_t)a1 inCollidableList:fromIndex:length:;
- (double)viewsCollidingWithAnnotationViewAtIndex:(uint64_t)a1;
- (id).cxx_construct;
- (id)annotationViewAtIndex:(unint64_t)a3;
- (id)registeredCollissions;
- (id)viewsCollidingWithAnnotationView:(id)a3 inCollidableList:(BOOL)a4;
- (id)viewsCollidingWithAnnotationView:(id)a3 inCollidableList:(BOOL)a4 fromIndex:(int64_t)a5 length:(double)a6;
- (id)viewsCollidingWithAnnotationViewAtIndex:(unint64_t)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)insertAnnotationView:(id)a3;
- (unint64_t)viewCount;
- (void)dealloc;
@end

@implementation MKSpatialCollider

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_sortedAnnotationViews.__begin_;
  if (begin)
  {
    self->_sortedAnnotationViews.var0 = begin;
    operator delete(begin);
  }
}

- (id)registeredCollissions
{
  v2 = self->_registeredCollisonPairs;

  return v2;
}

- (MKSpatialCollider)initWithAnnotationViews:(id)a3 previousCollissions:(id)a4 options:(int64_t)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)MKSpatialCollider;
  v8 = [(MKSpatialCollider *)&v54 init];
  v9 = v8;
  if (v8)
  {
    v8->_options = a5;
    if (a4) {
      v10 = (_MKSpatialColliderPairSet *)a4;
    }
    else {
      v10 = (_MKSpatialColliderPairSet *)objc_opt_new();
    }
    v9->_previousCollisionPairs = v10;
    v9->_registeredCollisonPairs = -[_MKSpatialColliderPairSet initWithCapacity:]([_MKSpatialColliderPairSet alloc], "initWithCapacity:", [a3 count]);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "anyObject"), "superview"), "bounds");
    v9->_isVertical = v12 < v11;
    unint64_t v13 = [a3 count];
    begin = v9->_sortedAnnotationViews.__begin_;
    if (v13 > ((char *)v9->_sortedAnnotationViews.var1.__value_ - (char *)begin) >> 3)
    {
      if (v13 >> 61) {
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      }
      var0 = v9->_sortedAnnotationViews.var0;
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v13);
      v17 = (__end_cap_ **)&v16[8 * (var0 - begin)];
      v19 = (id *)&v16[8 * v18];
      v20 = v9->_sortedAnnotationViews.var0;
      v21 = v9->_sortedAnnotationViews.__begin_;
      v22 = v17;
      if (v20 != v21)
      {
        do
        {
          v23 = *--v20;
          *--v22 = v23;
        }
        while (v20 != v21);
        v20 = v9->_sortedAnnotationViews.__begin_;
      }
      v9->_sortedAnnotationViews.__begin_ = v22;
      v9->_sortedAnnotationViews.var0 = v17;
      v9->_sortedAnnotationViews.var1.__value_ = v19;
      if (v20) {
        operator delete(v20);
      }
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v24 = [a3 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(a3);
          }
          v27 = *(double **)(*((void *)&v50 + 1) + 8 * i);
          double v28 = v27[84];
          double v29 = v27[85];
          v31 = v9->_sortedAnnotationViews.var0;
          value = v9->_sortedAnnotationViews.var1.__value_;
          if (v31 >= (__end_cap_ **)value)
          {
            v33 = v9->_sortedAnnotationViews.__begin_;
            uint64_t v34 = v31 - v33;
            if ((unint64_t)(v34 + 1) >> 61) {
              std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v35 = (char *)value - (char *)v33;
            uint64_t v36 = v35 >> 2;
            if (v35 >> 2 <= (unint64_t)(v34 + 1)) {
              uint64_t v36 = v34 + 1;
            }
            if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v36;
            }
            if (v37) {
              unint64_t v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v37);
            }
            else {
              uint64_t v38 = 0;
            }
            v39 = (__end_ **)(v37 + 8 * v34);
            *v39 = (__end_ *)v27;
            v32 = v39 + 1;
            v41 = v9->_sortedAnnotationViews.__begin_;
            v40 = v9->_sortedAnnotationViews.var0;
            if (v40 != v41)
            {
              do
              {
                v42 = *--v40;
                *--v39 = v42;
              }
              while (v40 != v41);
              v40 = v9->_sortedAnnotationViews.__begin_;
            }
            v9->_sortedAnnotationViews.__begin_ = v39;
            v9->_sortedAnnotationViews.var0 = v32;
            v9->_sortedAnnotationViews.var1.__value_ = (id *)(v37 + 8 * v38);
            if (v40) {
              operator delete(v40);
            }
          }
          else
          {
            *v31 = (__end_cap_ *)v27;
            v32 = v31 + 1;
          }
          v9->_sortedAnnotationViews.var0 = v32;
          double maxLength = v9->_maxLength;
          if (v9->_isVertical) {
            double v44 = v29;
          }
          else {
            double v44 = v28;
          }
          if (maxLength < v44) {
            double maxLength = v44;
          }
          v9->_double maxLength = maxLength;
        }
        uint64_t v24 = [a3 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v24);
    }
    uint64_t v45 = (uint64_t)v9->_sortedAnnotationViews.__begin_;
    v46 = (uint64_t *)v9->_sortedAnnotationViews.var0;
    unint64_t v47 = 126 - 2 * __clz(((uint64_t)v46 - v45) >> 3);
    if (v46 == (uint64_t *)v45) {
      uint64_t v48 = 0;
    }
    else {
      uint64_t v48 = v47;
    }
    if (v9->_isVertical) {
      std::__introsort<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **,false>(v45, v46, v48, 1);
    }
    else {
      std::__introsort<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **,false>(v45, v46, v48, 1);
    }
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MKSpatialCollider;
  [(MKSpatialCollider *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  begin = self->_sortedAnnotationViews.__begin_;
  var0 = self->_sortedAnnotationViews.var0;
  a3->var0 = 1;
  a3->var1 = (id *)begin;
  a3->var2 = &self->mutator;
  return var0 - begin;
}

- (unint64_t)viewCount
{
  return self->_sortedAnnotationViews.var0 - self->_sortedAnnotationViews.__begin_;
}

- (id)annotationViewAtIndex:(unint64_t)a3
{
  return self->_sortedAnnotationViews.__begin_[a3];
}

- (unint64_t)insertAnnotationView:(id)a3
{
  long long v50 = (double *)a3;
  ++self->mutator;
  begin = self->_sortedAnnotationViews.__begin_;
  var0 = self->_sortedAnnotationViews.var0;
  if (self->_isVertical)
  {
    if (var0 != begin)
    {
      unint64_t v7 = var0 - begin;
      double v8 = *((double *)a3 + 83);
      v9 = self->_sortedAnnotationViews.__begin_;
      do
      {
        unint64_t v10 = v7 >> 1;
        double v11 = &v9[v7 >> 1];
        double v12 = *((double *)*v11 + 83);
        if (v12 < v8 || ((uint64_t)*v11 < (uint64_t)a3 ? (BOOL v13 = v12 == v8) : (BOOL v13 = 0), v13))
        {
          v9 = v11 + 1;
          unint64_t v10 = v7 + ~v10;
        }
        unint64_t v7 = v10;
      }
      while (v10);
      goto LABEL_25;
    }
LABEL_24:
    v9 = self->_sortedAnnotationViews.__begin_;
    goto LABEL_25;
  }
  if (var0 == begin) {
    goto LABEL_24;
  }
  unint64_t v14 = var0 - begin;
  double v15 = *((double *)a3 + 82);
  v9 = self->_sortedAnnotationViews.__begin_;
  do
  {
    unint64_t v16 = v14 >> 1;
    v17 = &v9[v14 >> 1];
    double v18 = *((double *)*v17 + 82);
    if (v18 < v15 || ((uint64_t)*v17 < (uint64_t)a3 ? (BOOL v19 = v18 == v15) : (BOOL v19 = 0), v19))
    {
      v9 = v17 + 1;
      unint64_t v16 = v14 + ~v16;
    }
    unint64_t v14 = v16;
  }
  while (v16);
LABEL_25:
  uint64_t v20 = (char *)v9 - (char *)begin;
  int64_t v21 = v9 - begin;
  v22 = (__end_ **)((char *)begin + (((char *)v9 - (char *)begin) & 0xFFFFFFFFFFFFFFF8));
  value = self->_sortedAnnotationViews.var1.__value_;
  if (var0 >= (__end_cap_ **)value)
  {
    unint64_t v28 = var0 - begin + 1;
    if (v28 >> 61) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v29 = (char *)value - (char *)begin;
    if (v29 >> 2 > v28) {
      unint64_t v28 = v29 >> 2;
    }
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v30 = v28;
    }
    if (v30)
    {
      v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v30);
    }
    else
    {
      v32 = 0;
      uint64_t v31 = 0;
    }
    uint64_t v34 = (__end_ **)&v32[8 * v21];
    uint64_t v35 = (id *)&v32[8 * v31];
    if (v21 == v31)
    {
      if (v20 < 1)
      {
        if (begin == v9) {
          unint64_t v37 = 1;
        }
        else {
          unint64_t v37 = v20 >> 2;
        }
        uint64_t v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v37);
        uint64_t v34 = (__end_ **)&v38[8 * (v37 >> 2)];
        uint64_t v35 = (id *)&v38[8 * v39];
        if (v32) {
          operator delete(v32);
        }
      }
      else
      {
        unint64_t v36 = v21 + 2;
        if (v21 >= -1) {
          unint64_t v36 = v21 + 1;
        }
        v34 -= v36 >> 1;
      }
    }
    *uint64_t v34 = (__end_ *)a3;
    v40 = (char *)(v34 + 1);
    v41 = self->_sortedAnnotationViews.__begin_;
    if (v41 != v22)
    {
      v42 = v22;
      do
      {
        v43 = *--v42;
        *--uint64_t v34 = v43;
      }
      while (v42 != v41);
    }
    double v44 = self->_sortedAnnotationViews.var0;
    int64_t v45 = (char *)v44 - (char *)v22;
    if (v44 != v22) {
      memmove(v40, v22, (char *)v44 - (char *)v22);
    }
    v46 = self->_sortedAnnotationViews.__begin_;
    self->_sortedAnnotationViews.__begin_ = v34;
    self->_sortedAnnotationViews.var0 = (__end_cap_ **)&v40[v45];
    self->_sortedAnnotationViews.var1.__value_ = v35;
    if (v46) {
      operator delete(v46);
    }
  }
  else if (v22 == var0)
  {
    *var0 = (__end_cap_ *)a3;
    self->_sortedAnnotationViews.var0 = var0 + 1;
  }
  else
  {
    uint64_t v24 = v22 + 1;
    uint64_t v25 = var0 - 1;
    v26 = self->_sortedAnnotationViews.var0;
    while (v25 < var0)
    {
      v27 = *v25++;
      *v26++ = v27;
    }
    self->_sortedAnnotationViews.var0 = v26;
    if (var0 != v24) {
      memmove(&var0[-(var0 - v24)], (char *)begin + (((char *)v9 - (char *)begin) & 0xFFFFFFFFFFFFFFF8), (char *)var0 - (char *)v24);
    }
    v33 = (__end_ *)v50;
    if (v22 > (__end_ **)&v50) {
      v33 = (__end_ *)a3;
    }
    *v22 = v33;
  }
  unint64_t v47 = v50 + 85;
  double maxLength = self->_maxLength;
  if (!self->_isVertical) {
    unint64_t v47 = v50 + 84;
  }
  if (maxLength < *v47) {
    double maxLength = *v47;
  }
  self->_double maxLength = maxLength;
  return v21;
}

- (id)viewsCollidingWithAnnotationView:(id)a3 inCollidableList:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_isVertical) {
    unint64_t v7 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:]::$_0::__invoke;
  }
  else {
    unint64_t v7 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:]::$_1::__invoke;
  }
  double v8 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:]::$_2::__invoke;
  if (!self->_isVertical) {
    double v8 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:]::$_3::__invoke;
  }
  long long v9 = *((_OWORD *)a3 + 42);
  long long v29 = *((_OWORD *)a3 + 41);
  long long v30 = v9;
  double v10 = ((double (*)(long long *, SEL))v8)(&v30, a2);
  long long v11 = *((_OWORD *)a3 + 42);
  long long v29 = *((_OWORD *)a3 + 41);
  long long v30 = v11;
  double v12 = v7((uint64_t)&v29);
  double maxLength = self->_maxLength;
  double v14 = v12 - maxLength;
  begin = self->_sortedAnnotationViews.__begin_;
  var0 = self->_sortedAnnotationViews.var0;
  if (self->_isVertical)
  {
    if (var0 != begin)
    {
      unint64_t v17 = var0 - begin;
      double v18 = self->_sortedAnnotationViews.__begin_;
      do
      {
        unint64_t v19 = v17 >> 1;
        uint64_t v20 = &v18[v17 >> 1];
        v22 = *v20;
        int64_t v21 = v20 + 1;
        v17 += ~(v17 >> 1);
        if (*((double *)v22 + 83) < v14) {
          double v18 = v21;
        }
        else {
          unint64_t v17 = v19;
        }
      }
      while (v17);
      goto LABEL_22;
    }
LABEL_21:
    double v18 = self->_sortedAnnotationViews.var0;
    var0 = self->_sortedAnnotationViews.__begin_;
    goto LABEL_22;
  }
  if (var0 == begin) {
    goto LABEL_21;
  }
  unint64_t v23 = var0 - begin;
  double v18 = self->_sortedAnnotationViews.__begin_;
  do
  {
    unint64_t v24 = v23 >> 1;
    uint64_t v25 = &v18[v23 >> 1];
    v27 = *v25;
    v26 = v25 + 1;
    v23 += ~(v23 >> 1);
    if (*((double *)v27 + 82) < v14) {
      double v18 = v26;
    }
    else {
      unint64_t v23 = v24;
    }
  }
  while (v23);
LABEL_22:
  if (var0 == v18) {
    return 0;
  }
  else {
    return [(MKSpatialCollider *)self viewsCollidingWithAnnotationView:a3 inCollidableList:v4 fromIndex:v18 - begin length:v10 + maxLength];
  }
}

- (id)viewsCollidingWithAnnotationViewAtIndex:(unint64_t)a3
{
  v5 = -[MKSpatialCollider viewsCollidingWithAnnotationViewAtIndex:]::$_4::__invoke;
  if (!self->_isVertical) {
    v5 = -[MKSpatialCollider viewsCollidingWithAnnotationViewAtIndex:]::$_5::__invoke;
  }
  v6 = self->_sortedAnnotationViews.__begin_[a3];
  long long v8 = *((_OWORD *)v6 + 42);
  ((void (*)(long long *, SEL))v5)(&v8, a2);
  return -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:](self, "viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:", v6, 1, a3);
}

- (id)viewsCollidingWithAnnotationView:(id)a3 inCollidableList:(BOOL)a4 fromIndex:(int64_t)a5 length:(double)a6
{
  BOOL v90 = a4;
  unint64_t v8 = (unint64_t)a3;
  long long v9 = self;
  ++self->mutator;
  double v10 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:]::$_6::__invoke;
  unint64_t v11 = 0x1E914D000uLL;
  CGSize v12 = (CGSize)*((_OWORD *)a3 + 42);
  if (!self->_isVertical) {
    double v10 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:]::$_7::__invoke;
  }
  v101.origin = (CGPoint)*((_OWORD *)a3 + 41);
  v101.size = v12;
  v97 = v10;
  ((void (*)(CGRect *, SEL))v10)(&v101, a2);
  int64_t v88 = a5;
  double v14 = &v9->_sortedAnnotationViews.__begin_[a5];
  if (v14 != v9->_sortedAnnotationViews.var0)
  {
    double v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    char v98 = 0;
    uint64_t v99 = 0;
    uint64_t v18 = 0;
    double v19 = v13 + a6;
    registeredCollisonPairs = v9->_registeredCollisonPairs;
    p_pairs = &registeredCollisonPairs->_pairs;
    v92 = v9;
    previousCollisionPairs = (int8x8_t *)v9->_previousCollisionPairs;
    v94 = registeredCollisonPairs;
    p_p1 = &registeredCollisonPairs->_pairs.__table_.__p1_;
    v96 = (void *)v8;
    while (1)
    {
      unint64_t v21 = (unint64_t)*v14;
      if (*v14 == (__end_cap_ *)v8)
      {
        if (v16 >= v15)
        {
          uint64_t v32 = v16 - v17;
          unint64_t v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 61) {
            std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v15 - (char *)v17) >> 2 > v33) {
            unint64_t v33 = ((char *)v15 - (char *)v17) >> 2;
          }
          if ((unint64_t)((char *)v15 - (char *)v17) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v33;
          }
          if (v34) {
            unint64_t v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v34);
          }
          else {
            uint64_t v35 = 0;
          }
          v41 = (unint64_t *)(v34 + 8 * v32);
          unint64_t *v41 = v8;
          uint64_t v31 = v41 + 1;
          if (v16 != v17)
          {
            do
            {
              unint64_t v42 = *--v16;
              *--v41 = v42;
            }
            while (v16 != v17);
            unint64_t v16 = v17;
          }
          unint64_t v17 = v41;
          double v15 = (unint64_t *)(v34 + 8 * v35);
          if (v16) {
            operator delete(v16);
          }
        }
        else
        {
          unint64_t *v16 = v8;
          uint64_t v31 = v16 + 1;
        }
        uint64_t v43 = v14 - v9->_sortedAnnotationViews.__begin_;
        goto LABEL_58;
      }
      memset(&v100, 0, sizeof(v100));
      unint64_t v22 = v21 + *(int *)(v11 + 3312);
      CGSize v23 = *(CGSize *)(v22 + 16);
      v100.origin = *(CGPoint *)v22;
      v100.size = v23;
      if (v97((uint64_t)&v100) > v19) {
        goto LABEL_123;
      }
      if (!CGRectIntersectsRect(v101, v100)) {
        goto LABEL_103;
      }
      unint64_t v95 = (unint64_t)v15;
      if (v21 <= v8) {
        unint64_t v24 = v21;
      }
      else {
        unint64_t v24 = v8;
      }
      if (v21 <= v8) {
        unint64_t v25 = v8;
      }
      else {
        unint64_t v25 = v21;
      }
      unint64_t v26 = std::hash<_MKAnnotationViewPair>::operator()(v24, v25);
      unint64_t v27 = v26;
      int8x8_t v28 = previousCollisionPairs[2];
      if (v28)
      {
        uint8x8_t v29 = (uint8x8_t)vcnt_s8(v28);
        v29.i16[0] = vaddlv_u8(v29);
        if (v29.u32[0] > 1uLL)
        {
          unint64_t v30 = v26;
          if (v26 >= *(void *)&v28) {
            unint64_t v30 = v26 % *(void *)&v28;
          }
        }
        else
        {
          unint64_t v30 = (*(void *)&v28 - 1) & v26;
        }
        uint64_t i = *(void **)(*(void *)&previousCollisionPairs[1] + 8 * v30);
        if (i)
        {
          for (uint64_t i = (void *)*i; i; uint64_t i = (void *)*i)
          {
            unint64_t v37 = i[1];
            if (v37 == v26)
            {
              BOOL v38 = i[2] == v24 && i[3] == v25;
              if (v38) {
                break;
              }
            }
            else
            {
              if (v29.u32[0] > 1uLL)
              {
                if (v37 >= *(void *)&v28) {
                  v37 %= *(void *)&v28;
                }
              }
              else
              {
                v37 &= *(void *)&v28 - 1;
              }
              if (v37 != v30) {
                goto LABEL_45;
              }
            }
          }
        }
      }
      else
      {
LABEL_45:
        uint64_t i = 0;
      }
      if (([v96 isCollidingWithAnnotationView:v21 previouslyCollided:i != 0] & 1) == 0)
      {
        long long v9 = v92;
        double v15 = (unint64_t *)v95;
        unint64_t v8 = (unint64_t)v96;
LABEL_102:
        unint64_t v11 = 0x1E914D000;
        goto LABEL_103;
      }
      unint64_t value = v94->_pairs.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        uint8x8_t v40 = (uint8x8_t)vcnt_s8((int8x8_t)value);
        v40.i16[0] = vaddlv_u8(v40);
        if (v40.u32[0] > 1uLL)
        {
          unint64_t v8 = v27;
          if (v27 >= value) {
            unint64_t v8 = v27 % value;
          }
        }
        else
        {
          unint64_t v8 = (value - 1) & v27;
        }
        double v44 = p_pairs->__table_.__bucket_list_.__ptr_.__value_[v8];
        if (v44)
        {
          for (j = (void *)*v44; j; j = (void *)*j)
          {
            unint64_t v46 = j[1];
            if (v46 == v27)
            {
              if (j[2] == v24 && j[3] == v25) {
                goto LABEL_98;
              }
            }
            else
            {
              if (v40.u32[0] > 1uLL)
              {
                if (v46 >= value) {
                  v46 %= value;
                }
              }
              else
              {
                v46 &= value - 1;
              }
              if (v46 != v8) {
                break;
              }
            }
          }
        }
      }
      uint64_t v48 = operator new(0x20uLL);
      *uint64_t v48 = 0;
      v48[1] = v27;
      v48[2] = v24;
      v48[3] = v25;
      float v49 = (float)(v94->_pairs.__table_.__p2_.__value_ + 1);
      float v50 = v94->_pairs.__table_.__p3_.__value_;
      if (!value || (float)(v50 * (float)value) < v49)
      {
        BOOL v51 = (value & (value - 1)) != 0;
        if (value < 3) {
          BOOL v51 = 1;
        }
        unint64_t v52 = v51 | (2 * value);
        unint64_t v53 = vcvtps_u32_f32(v49 / v50);
        if (v52 <= v53) {
          size_t v54 = v53;
        }
        else {
          size_t v54 = v52;
        }
        std::__hash_table<_MKAnnotationViewPair,std::hash<_MKAnnotationViewPair>,std::equal_to<_MKAnnotationViewPair>,std::allocator<_MKAnnotationViewPair>>::__rehash<true>((uint64_t)p_pairs, v54);
        unint64_t value = v94->_pairs.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if ((value & (value - 1)) != 0)
        {
          if (v27 >= value) {
            unint64_t v8 = v27 % value;
          }
          else {
            unint64_t v8 = v27;
          }
        }
        else
        {
          unint64_t v8 = (value - 1) & v27;
        }
      }
      v55 = p_pairs->__table_.__bucket_list_.__ptr_.__value_;
      uint64_t v56 = (void **)p_pairs->__table_.__bucket_list_.__ptr_.__value_[v8];
      if (v56)
      {
        *uint64_t v48 = *v56;
      }
      else
      {
        *uint64_t v48 = p_p1->__value_.__next_;
        p_p1->__value_.__next_ = v48;
        v55[v8] = p_p1;
        if (!*v48) {
          goto LABEL_97;
        }
        unint64_t v57 = *(void *)(*v48 + 8);
        if ((value & (value - 1)) != 0)
        {
          if (v57 >= value) {
            v57 %= value;
          }
        }
        else
        {
          v57 &= value - 1;
        }
        uint64_t v56 = &p_pairs->__table_.__bucket_list_.__ptr_.__value_[v57];
      }
      *uint64_t v56 = v48;
LABEL_97:
      ++v94->_pairs.__table_.__p2_.__value_;
LABEL_98:
      double v15 = (unint64_t *)v95;
      if ((unint64_t)v16 < v95)
      {
        *v16++ = v21;
        long long v9 = v92;
        uint64_t v18 = v14 - v92->_sortedAnnotationViews.__begin_;
        uint64_t v58 = v99;
        if ((v98 & 1) == 0) {
          uint64_t v58 = v14 - v92->_sortedAnnotationViews.__begin_;
        }
        uint64_t v99 = v58;
        char v98 = 1;
        unint64_t v8 = (unint64_t)v96;
        goto LABEL_102;
      }
      uint64_t v59 = v16 - v17;
      unint64_t v60 = v59 + 1;
      long long v9 = v92;
      unint64_t v8 = (unint64_t)v96;
      unint64_t v11 = 0x1E914D000;
      if ((unint64_t)(v59 + 1) >> 61) {
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      }
      if ((uint64_t)(v95 - (void)v17) >> 2 > v60) {
        unint64_t v60 = (uint64_t)(v95 - (void)v17) >> 2;
      }
      if (v95 - (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v61 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v61 = v60;
      }
      if (v61)
      {
        v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v61);
        uint64_t v64 = v63;
        long long v9 = v92;
        unint64_t v8 = (unint64_t)v96;
      }
      else
      {
        v62 = 0;
        uint64_t v64 = 0;
      }
      v65 = (unint64_t *)&v62[8 * v59];
      unint64_t *v65 = v21;
      uint64_t v31 = v65 + 1;
      if (v16 != v17)
      {
        do
        {
          unint64_t v66 = *--v16;
          *--v65 = v66;
        }
        while (v16 != v17);
        unint64_t v16 = v17;
      }
      unint64_t v17 = v65;
      if (v16) {
        operator delete(v16);
      }
      double v15 = (unint64_t *)&v62[8 * v64];
      uint64_t v18 = v14 - v9->_sortedAnnotationViews.__begin_;
      uint64_t v43 = v99;
      if ((v98 & 1) == 0) {
        uint64_t v43 = v14 - v9->_sortedAnnotationViews.__begin_;
      }
LABEL_58:
      uint64_t v99 = v43;
      char v98 = 1;
      unint64_t v16 = v31;
LABEL_103:
      if (++v14 == v9->_sortedAnnotationViews.var0) {
        goto LABEL_123;
      }
    }
  }
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v99 = 0;
LABEL_123:
  uint64_t v67 = v16 - v17;
  if (v67)
  {
    if (v67 != 1)
    {
      if (v9->_options)
      {
        begin = v9->_sortedAnnotationViews.__begin_;
        v70 = &begin[v88];
        v71 = &begin[v18];
        v72 = v71 + 1;
        if (v70 != v71 + 1)
        {
          uint64_t v73 = 8 * v18 - 8 * v88;
          while (*v70 != (__end_ *)*v17)
          {
            v73 -= 8;
            BOOL v38 = v70++ == v71;
            if (v38) {
              goto LABEL_156;
            }
          }
          if (v70 == v72 || v70 == v71)
          {
            v83 = v70;
          }
          else
          {
            v81 = (__end_ **)(v17 + 1);
            uint64_t v82 = 1;
            v83 = v70;
            do
            {
              v84 = v70[v82];
              if (v84 == *v81) {
                ++v81;
              }
              else {
                *v83++ = v84;
              }
              ++v82;
              v73 -= 8;
            }
            while (v73);
          }
          if (v83 != v72)
          {
            v85 = v72;
            var0 = v9->_sortedAnnotationViews.var0;
            int64_t v87 = (char *)var0 - (char *)v85;
            if (var0 != v85) {
              memmove(v83, v85, (char *)var0 - (char *)v85);
            }
            v9->_sortedAnnotationViews.var0 = (__end_ **)((char *)v83 + v87);
          }
        }
      }
LABEL_156:
      uint64_t v80 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, v16 - v17, v88);
LABEL_157:
      v78 = (void *)v80;
      if (!v17) {
        return v78;
      }
      goto LABEL_140;
    }
    int64_t options = v9->_options;
    if (v90)
    {
      if ((options & 2) == 0) {
        goto LABEL_139;
      }
    }
    else if ((options & 1) == 0)
    {
LABEL_142:
      uint64_t v80 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 1, v88);
      goto LABEL_157;
    }
    v74 = v9->_sortedAnnotationViews.__begin_;
    v75 = v9->_sortedAnnotationViews.var0;
    v76 = &v74[v99];
    v77 = (char *)((char *)v75 - (char *)(v76 + 1));
    if (v75 != v76 + 1) {
      memmove(&v74[v99], v76 + 1, (char *)v75 - (char *)(v76 + 1));
    }
    v9->_sortedAnnotationViews.var0 = (__end_cap_ **)&v77[(void)v76];
    if (v90) {
      goto LABEL_139;
    }
    goto LABEL_142;
  }
LABEL_139:
  v78 = 0;
  if (v17) {
LABEL_140:
  }
    operator delete(v17);
  return v78;
}

- (double)viewsCollidingWithAnnotationView:(uint64_t)a1 inCollidableList:
{
  return *(double *)a1;
}

- (double)viewsCollidingWithAnnotationViewAtIndex:(uint64_t)a1
{
  return *(double *)a1;
}

- (double)viewsCollidingWithAnnotationView:(uint64_t)a1 inCollidableList:fromIndex:length:
{
  return *(double *)a1;
}

@end