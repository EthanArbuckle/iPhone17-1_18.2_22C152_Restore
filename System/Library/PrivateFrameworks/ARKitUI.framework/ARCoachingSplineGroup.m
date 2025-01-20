@interface ARCoachingSplineGroup
- ($3BA783FF50B239963188BE194EBFFEBA)controlPoints;
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)patchData;
- (ARCoachingSplineGroup)initWithSplines:(id)a3;
- (id).cxx_construct;
- (unsigned)indices;
- (unsigned)numControlPoints;
- (unsigned)numIndices;
- (unsigned)patchDataLength;
@end

@implementation ARCoachingSplineGroup

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

- (ARCoachingSplineGroup)initWithSplines:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v57 = a3;
  v66.receiver = self;
  v66.super_class = (Class)ARCoachingSplineGroup;
  v4 = [(ARCoachingSplineGroup *)&v66 init];
  if (v4)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obunint64_t j = v57;
    uint64_t v60 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v60)
    {
      p_controlPoints = &v4->_controlPoints;
      p_patchData = &v4->_patchData;
      uint64_t v59 = *(void *)v63;
      p_begin = (void **)&v4->_indices.__begin_;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v63 != v59) {
            objc_enumerationMutation(obj);
          }
          unint64_t v8 = 0;
          v9 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          unint64_t v10 = v4->_controlPoints.__end_ - v4->_controlPoints.__begin_;
          while (v8 < [v9 numControlPoints])
          {
            v11 = (_OWORD *)([v9 controlPoints] + 32 * v8);
            end = v4->_controlPoints.__end_;
            value = v4->_controlPoints.__end_cap_.__value_;
            if (end >= value)
            {
              uint64_t v16 = (end - p_controlPoints->__begin_) >> 5;
              unint64_t v17 = v16 + 1;
              if ((unint64_t)(v16 + 1) >> 59) {
                _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
              }
              uint64_t v18 = value - p_controlPoints->__begin_;
              if (v18 >> 4 > v17) {
                unint64_t v17 = v18 >> 4;
              }
              if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v19 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v19 = v17;
              }
              if (v19) {
                v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)&v4->_controlPoints.__end_cap_, v19);
              }
              else {
                v20 = 0;
              }
              v21 = &v20[32 * v16];
              long long v22 = v11[1];
              *(_OWORD *)v21 = *v11;
              *((_OWORD *)v21 + 1) = v22;
              begin = v4->_controlPoints.__begin_;
              v23 = v4->_controlPoints.__end_;
              v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v21;
              if (v23 != begin)
              {
                do
                {
                  long long v26 = *((_OWORD *)v23 - 1);
                  *((_OWORD *)v25 - 2) = *((_OWORD *)v23 - 2);
                  *((_OWORD *)v25 - 1) = v26;
                  v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v25 - 32);
                  v23 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v23 - 32);
                }
                while (v23 != begin);
                v23 = p_controlPoints->__begin_;
              }
              v15 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v21 + 32);
              v4->_controlPoints.__begin_ = v25;
              v4->_controlPoints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v21 + 32);
              v4->_controlPoints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v20[32 * v19];
              if (v23) {
                operator delete(v23);
              }
            }
            else
            {
              long long v14 = v11[1];
              *(_OWORD *)end = *v11;
              *((_OWORD *)end + 1) = v14;
              v15 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 32);
            }
            v4->_controlPoints.__end_ = v15;
            ++v8;
          }
          for (unint64_t j = 0; j < [v9 patchDataLength]; ++j)
          {
            uint64_t v28 = [v9 patchData];
            uint64_t v29 = v28;
            v31 = v4->_patchData.__end_;
            v30 = v4->_patchData.__end_cap_.__value_;
            if (v31 >= v30)
            {
              uint64_t v33 = (v31 - p_patchData->__begin_) >> 3;
              if ((unint64_t)(v33 + 1) >> 61) {
                _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
              }
              uint64_t v34 = v30 - p_patchData->__begin_;
              uint64_t v35 = v34 >> 2;
              if (v34 >> 2 <= (unint64_t)(v33 + 1)) {
                uint64_t v35 = v33 + 1;
              }
              if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v36 = v35;
              }
              if (v36) {
                v37 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v4->_patchData.__end_cap_, v36);
              }
              else {
                v37 = 0;
              }
              v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v37[8 * v33];
              *(void *)v38 = *(void *)(v29 + 8 * j);
              v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 + 8);
              v40 = v4->_patchData.__begin_;
              v39 = v4->_patchData.__end_;
              if (v39 != v40)
              {
                do
                {
                  uint64_t v41 = *((void *)v39 - 1);
                  v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v39 - 8);
                  *((void *)v38 - 1) = v41;
                  v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 - 8);
                }
                while (v39 != v40);
                v39 = p_patchData->__begin_;
              }
              v4->_patchData.__begin_ = v38;
              v4->_patchData.__end_ = v32;
              v4->_patchData.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v37[8 * v36];
              if (v39) {
                operator delete(v39);
              }
            }
            else
            {
              *(void *)v31 = *(void *)(v28 + 8 * j);
              v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 + 8);
            }
            v4->_patchData.__end_ = v32;
          }
          for (unint64_t k = 0; k < [v9 numIndices]; ++k)
          {
            unsigned __int16 v43 = *(_WORD *)([v9 indices] + 2 * k) + (v10 >> 5);
            v45 = v4->_indices.__end_;
            v44 = v4->_indices.__end_cap_.__value_;
            if (v45 >= v44)
            {
              v47 = (unsigned __int16 *)*p_begin;
              uint64_t v48 = (char *)v45 - (unsigned char *)*p_begin;
              if (v48 <= -3) {
                _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
              }
              uint64_t v49 = v48 >> 1;
              unint64_t v50 = (char *)v44 - (char *)v47;
              if (v50 <= (v48 >> 1) + 1) {
                unint64_t v51 = v49 + 1;
              }
              else {
                unint64_t v51 = v50;
              }
              if (v50 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v52 = v51;
              }
              if (v52)
              {
                v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v4->_indices.__end_cap_, v52);
                v47 = v4->_indices.__begin_;
                v45 = v4->_indices.__end_;
              }
              else
              {
                v53 = 0;
              }
              v54 = (unsigned __int16 *)&v53[2 * v49];
              unsigned __int16 *v54 = v43;
              v46 = v54 + 1;
              while (v45 != v47)
              {
                unsigned __int16 v55 = *--v45;
                *--v54 = v55;
              }
              v4->_indices.__begin_ = v54;
              v4->_indices.__end_ = v46;
              v4->_indices.__end_cap_.__value_ = (unsigned __int16 *)&v53[2 * v52];
              if (v47) {
                operator delete(v47);
              }
            }
            else
            {
              unsigned __int16 *v45 = v43;
              v46 = v45 + 1;
            }
            v4->_indices.__end_ = v46;
          }
        }
        uint64_t v60 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
      }
      while (v60);
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
  v5 = self->_controlPoints.__begin_;
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