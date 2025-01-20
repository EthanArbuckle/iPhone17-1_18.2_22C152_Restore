@interface ARCoachingBlendableSplineGroup
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)patchData;
- (ARCoachingBlendableSplineGroup)initWithSplineGroups:(id)a3;
- (NSArray)controlPoints;
- (id).cxx_construct;
- (unsigned)indices;
- (unsigned)numIndices;
- (unsigned)patchDataLength;
@end

@implementation ARCoachingBlendableSplineGroup

- (NSArray)controlPoints
{
  return (NSArray *)self->_controlPoints;
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

- (ARCoachingBlendableSplineGroup)initWithSplineGroups:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v62 = a3;
  v69.receiver = self;
  v69.super_class = (Class)ARCoachingBlendableSplineGroup;
  v4 = [(ARCoachingBlendableSplineGroup *)&v69 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    controlPoints = v4->_controlPoints;
    v4->_controlPoints = (NSMutableArray *)v5;

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v7 = v62;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v66 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          v12 = [v7 objectAtIndexedSubscript:0];
          int v13 = [v12 numControlPoints];
          if (v13 != [v11 numControlPoints]) {
            __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 447, "splineGroups[0].numControlPoints == splineGroup.numControlPoints");
          }

          v14 = [v7 objectAtIndexedSubscript:0];
          int v15 = [v14 numIndices];
          if (v15 != [v11 numIndices]) {
            __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 448, "splineGroups[0].numIndices == splineGroup.numIndices");
          }

          v16 = [v7 objectAtIndexedSubscript:0];
          int v17 = [v16 patchDataLength];
          if (v17 != [v11 patchDataLength]) {
            __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 449, "splineGroups[0].patchDataLength == splineGroup.patchDataLength");
          }

          uint64_t v18 = 0;
          for (unint64_t j = 0; j < [v11 patchDataLength]; ++j)
          {
            v20 = [v7 objectAtIndexedSubscript:0];
            float v63 = COERCE_FLOAT(*(void *)([v20 patchData] + v18));
            if (v63 != COERCE_FLOAT(*(void *)([v11 patchData] + v18))) {
              __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 452, "splineGroups[0].patchData[i].factorScale.x == splineGroup.patchData[i].factorScale.x");
            }

            v21 = [v7 objectAtIndexedSubscript:0];
            LODWORD(v64) = HIDWORD(*(void *)([v21 patchData] + v18));
            if (v64 != *(float *)([v11 patchData] + v18 + 4)) {
              __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 453, "splineGroups[0].patchData[i].factorScale.y == splineGroup.patchData[i].factorScale.y");
            }

            v18 += 8;
          }
          v22 = -[ARCoachingControlPointContainer initWithControlPoints:numControlPoints:]([ARCoachingControlPointContainer alloc], "initWithControlPoints:numControlPoints:", [v11 controlPoints], objc_msgSend(v11, "numControlPoints"));
          [(NSMutableArray *)v4->_controlPoints addObject:v22];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v8);
    }

    unint64_t v23 = 0;
    p_begin = (void **)&v4->_indices.__begin_;
    while (1)
    {
      v25 = [v7 objectAtIndexedSubscript:0];
      BOOL v26 = v23 < [v25 numIndices];

      if (!v26) {
        break;
      }
      v27 = [v7 objectAtIndexedSubscript:0];
      uint64_t v28 = [v27 indices];
      uint64_t v29 = v28;
      end = v4->_indices.__end_;
      value = v4->_indices.__end_cap_.__value_;
      if (end >= value)
      {
        begin = (unsigned __int16 *)*p_begin;
        uint64_t v34 = (char *)end - (unsigned char *)*p_begin;
        if (v34 <= -3) {
          _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v35 = v34 >> 1;
        unint64_t v36 = (char *)value - (char *)begin;
        if (v36 <= (v34 >> 1) + 1) {
          unint64_t v37 = v35 + 1;
        }
        else {
          unint64_t v37 = v36;
        }
        if (v36 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v38 = v37;
        }
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v4->_indices.__end_cap_, v38);
          begin = v4->_indices.__begin_;
          end = v4->_indices.__end_;
        }
        else
        {
          v39 = 0;
        }
        v40 = (unsigned __int16 *)&v39[2 * v35];
        unsigned __int16 *v40 = *(_WORD *)(v29 + 2 * v23);
        v32 = v40 + 1;
        while (end != begin)
        {
          unsigned __int16 v41 = *--end;
          *--v40 = v41;
        }
        v4->_indices.__begin_ = v40;
        v4->_indices.__end_ = v32;
        v4->_indices.__end_cap_.__value_ = (unsigned __int16 *)&v39[2 * v38];
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        unsigned __int16 *end = *(_WORD *)(v28 + 2 * v23);
        v32 = end + 1;
      }
      v4->_indices.__end_ = v32;

      ++v23;
    }
    unint64_t v42 = 0;
    p_patchData = &v4->_patchData;
    while (1)
    {
      v44 = [v7 objectAtIndexedSubscript:0];
      BOOL v45 = v42 < [v44 patchDataLength];

      if (!v45) {
        break;
      }
      v46 = [v7 objectAtIndexedSubscript:0];
      uint64_t v47 = [v46 patchData];
      uint64_t v48 = v47;
      v50 = v4->_patchData.__end_;
      v49 = v4->_patchData.__end_cap_.__value_;
      if (v50 >= v49)
      {
        uint64_t v52 = (v50 - p_patchData->__begin_) >> 3;
        if ((unint64_t)(v52 + 1) >> 61) {
          _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v53 = v49 - p_patchData->__begin_;
        uint64_t v54 = v53 >> 2;
        if (v53 >> 2 <= (unint64_t)(v52 + 1)) {
          uint64_t v54 = v52 + 1;
        }
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v55 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v55 = v54;
        }
        if (v55) {
          v56 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v4->_patchData.__end_cap_, v55);
        }
        else {
          v56 = 0;
        }
        v57 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v56[8 * v52];
        *(void *)v57 = *(void *)(v48 + 8 * v42);
        v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v57 + 8);
        v59 = v4->_patchData.__begin_;
        v58 = v4->_patchData.__end_;
        if (v58 != v59)
        {
          do
          {
            uint64_t v60 = *((void *)v58 - 1);
            v58 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v58 - 8);
            *((void *)v57 - 1) = v60;
            v57 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v57 - 8);
          }
          while (v58 != v59);
          v58 = p_patchData->__begin_;
        }
        v4->_patchData.__begin_ = v57;
        v4->_patchData.__end_ = v51;
        v4->_patchData.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v56[8 * v55];
        if (v58) {
          operator delete(v58);
        }
      }
      else
      {
        *(void *)v50 = *(void *)(v47 + 8 * v42);
        v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v50 + 8);
      }
      v4->_patchData.__end_ = v51;

      ++v42;
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  begin = self->_indices.__begin_;
  if (begin)
  {
    self->_indices.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_patchData.__begin_;
  if (v4)
  {
    self->_patchData.__end_ = v4;
    operator delete(v4);
  }

  objc_storeStrong((id *)&self->_controlPoints, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end