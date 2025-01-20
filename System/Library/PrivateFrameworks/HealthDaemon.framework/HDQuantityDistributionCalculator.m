@interface HDQuantityDistributionCalculator
- (BOOL)validateDateSequenceForTesting:(id)a3;
- (HDQuantityDistributionCalculator)initWithStartDate:(id)a3 endDate:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6 histogramBucketAnchor:(double)a7 histogramBucketSize:(double)a8;
- (id).cxx_construct;
- (id)quantityDistributionsWithUnit:(id)a3;
- (void)addDataPoint:(double)a3 startTime:(double)a4 endTime:(double)a5;
@end

@implementation HDQuantityDistributionCalculator

- (HDQuantityDistributionCalculator)initWithStartDate:(id)a3 endDate:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6 histogramBucketAnchor:(double)a7 histogramBucketSize:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v66.receiver = self;
  v66.super_class = (Class)HDQuantityDistributionCalculator;
  v18 = [(HDQuantityDistributionCalculator *)&v66 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_40;
  }
  v65 = v18;
  id v20 = v14;
  id v63 = v15;
  id v21 = v15;
  id v62 = v16;
  id v22 = v16;
  id v61 = v17;
  id v23 = v17;
  v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v64 = v22;
  id v60 = v14;
  if (objc_msgSend(v20, "hk_isBeforeDate:"))
  {
    v25 = objc_msgSend(v23, "hk_negativeComponents");
    for (i = v64; objc_msgSend(i, "hk_isAfterDate:", v20); i = (void *)v27)
    {
      uint64_t v27 = [v24 dateByAddingComponents:v25 toDate:i options:4];
    }
  }
  else
  {
    for (i = v64; ; i = v25)
    {
      v25 = [v24 dateByAddingComponents:v23 toDate:i options:0];
      if (objc_msgSend(v25, "hk_isAfterDate:", v20)) {
        break;
      }
    }
  }

  id v28 = i;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  for (j = v28; objc_msgSend(j, "hk_isBeforeDate:", v21); j = (void *)v32)
  {
    uint64_t v32 = [v24 dateByAddingComponents:v23 toDate:j options:0];

    --v30;
    v29 -= 64;
  }
  p_histogramState = (uint64_t *)&v65->_histogramState;
  uint64_t begin = (uint64_t)v65->_histogramState._dateBuckets.__begin_;
  p_end_cap = &v65->_histogramState._dateBuckets.__end_cap_;
  unint64_t v36 = -v30;
  if (-v30 > (unint64_t)(((uint64_t)v65->_histogramState._dateBuckets.__end_cap_.__value_ - begin) >> 6))
  {
    if (v36 >> 58) {
      goto LABEL_41;
    }
    v58 = v65->_histogramState._dateBuckets.__begin_;
    end = v65->_histogramState._dateBuckets.__end_;
    v71 = &v65->_histogramState._dateBuckets.__end_cap_;
    v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HistogramBucket>>(v36);
    v68 = &v67[end - v58];
    v69 = v68;
    v70 = &v67[64 * v38];
    std::vector<HistogramBucket>::__swap_out_circular_buffer(p_histogramState, &v67);
    std::__split_buffer<HistogramBucket>::~__split_buffer((uint64_t)&v67);
    uint64_t begin = *p_histogramState;
    p_end_cap = &v65->_histogramState._dateBuckets.__end_cap_;
    unint64_t v36 = -v30;
  }
  v39 = v65->_histogramState._dateBuckets.__end_;
  unint64_t v40 = ((uint64_t)v39 - begin) >> 6;
  if (v40 >= v36)
  {
    if (v40 > v36)
    {
      v47 = (HistogramBucket *)(begin - v29);
      while (v47 != v39)
      {
        v48 = (void *)*((void *)v39 - 3);
        if (v48)
        {
          *((void *)v39 - 2) = v48;
          operator delete(v48);
        }
        v39 = (HistogramBucket *)((char *)v39 - 64);
      }
      v65->_histogramState._dateBuckets.__end_ = v47;
    }
    goto LABEL_32;
  }
  if (-(uint64_t)(v40 + v30) > (unint64_t)((p_end_cap->__value_ - v39) >> 6))
  {
    if (!(v36 >> 58))
    {
      uint64_t v41 = ((uint64_t)v39 - begin) >> 6;
      uint64_t v42 = (uint64_t)p_end_cap->__value_ - begin;
      uint64_t v43 = v42 >> 5;
      if (v42 >> 5 <= v36) {
        uint64_t v43 = v36;
      }
      if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v44 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v44 = v43;
      }
      v71 = p_end_cap;
      v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HistogramBucket>>(v44);
      v67 = v45;
      v68 = &v45[64 * v41];
      v70 = &v45[64 * v46];
      bzero(v68, -(v29 + (v41 << 6)));
      v69 = &v45[-v29];
      std::vector<HistogramBucket>::__swap_out_circular_buffer(p_histogramState, &v67);
      std::__split_buffer<HistogramBucket>::~__split_buffer((uint64_t)&v67);
      goto LABEL_32;
    }
LABEL_41:
    std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v49 = ((uint64_t)v39 - begin) >> 6;
  bzero(v65->_histogramState._dateBuckets.__end_, -(uint64_t)(v29 + (v40 << 6)));
  v65->_histogramState._dateBuckets.__end_ = (HistogramBucket *)((char *)v39 - v29 + -64 * v49);
LABEL_32:
  id v50 = v28;

  uint64_t v51 = 0;
  uint64_t v52 = 0;
  v59 = v50;
  while (1)
  {
    v53 = v50;
    if (!objc_msgSend(v50, "hk_isBeforeDate:", v21, v58)) {
      break;
    }
    [v50 timeIntervalSinceReferenceDate];
    uint64_t v55 = *p_histogramState;
    if (v51) {
      *(void *)(v55 + v52 - 56) = v54;
    }
    *(void *)(v55 + v52) = v54;
    id v50 = [v24 dateByAddingComponents:v23 toDate:v50 options:0];

    v52 += 64;
    --v51;
  }
  if (v51)
  {
    [v50 timeIntervalSinceReferenceDate];
    *(void *)(*p_histogramState + v52 - 56) = v56;
  }

  v19 = v65;
  v65->_histogramState._histogramBucketAnchor = a7;
  v65->_histogramState._histogramBucketSize = a8;
  id v14 = v60;
  id v17 = v61;
  id v16 = v62;
  id v15 = v63;
LABEL_40:

  return v19;
}

- (void)addDataPoint:(double)a3 startTime:(double)a4 endTime:(double)a5
{
  v93[7] = *MEMORY[0x1E4F143B8];
  uint64_t begin = self->_histogramState._dateBuckets.__begin_;
  uint64_t v6 = self->_histogramState._dateBuckets.__end_ - begin;
  int64_t currentStartDateBucket = self->_histogramState._currentStartDateBucket;
  if (currentStartDateBucket < v6 >> 6)
  {
    uint64_t v11 = v6 >> 6;
    for (i = (double *)((char *)begin + 64 * currentStartDateBucket + 8); *i <= a4; i += 8)
    {
      self->_histogramState._int64_t currentStartDateBucket = ++currentStartDateBucket;
      if (v11 == currentStartDateBucket) {
        return;
      }
    }
    if (currentStartDateBucket < v11)
    {
      double v13 = *(i - 1);
      if (v13 <= a4)
      {
        BOOL v14 = a4 == a5;
        if (v13 != a5) {
          BOOL v14 = 0;
        }
        if (v13 < a5 || v14)
        {
          uint64_t v89 = v11 - 1;
          int64x2_t v88 = vdupq_lane_s64(*(uint64_t *)&a3, 0);
          while (1)
          {
            unint64_t v92 = vcvtmd_s64_f64((a3 - self->_histogramState._histogramBucketAnchor) / self->_histogramState._histogramBucketSize);
            id v16 = (char *)begin + 64 * currentStartDateBucket;
            id v17 = (char **)(v16 + 40);
            v19 = (char **)(v16 + 48);
            v18 = (uint64_t *)*((void *)v16 + 6);
            if (v18 == *((uint64_t **)v16 + 5))
            {
              uint64_t v23 = *((void *)v16 + 7);
              id v22 = v16 + 56;
              if ((unint64_t)(v23 - (void)v18) > 0x1FF)
              {
                v24 = v17[1];
              }
              else
              {
                v24 = (char *)operator new(0x200uLL);
                *id v17 = v24;
                HDQuantityDistributionCalculator *v19 = v24;
                *id v22 = v24 + 512;
                if (v18)
                {
                  operator delete(v18);
                  v24 = *v19;
                }
              }
              uint64_t v25 = 0;
              *((void *)begin + 8 * currentStartDateBucket + 4) = 32 - v92;
              v18 = (uint64_t *)v24;
              do
              {
                if ((unint64_t)v18 >= *v22)
                {
                  v26 = *v17;
                  uint64_t v27 = ((char *)v18 - *v17) >> 3;
                  unint64_t v28 = v27 + 1;
                  if ((unint64_t)(v27 + 1) >> 61) {
                    goto LABEL_100;
                  }
                  uint64_t v29 = *v22 - (void)v26;
                  if (v29 >> 2 > v28) {
                    unint64_t v28 = v29 >> 2;
                  }
                  BOOL v30 = (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8;
                  unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
                  if (!v30) {
                    unint64_t v31 = v28;
                  }
                  if (v31)
                  {
                    unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v31);
                    v18 = (uint64_t *)*v19;
                    v26 = *v17;
                  }
                  else
                  {
                    uint64_t v32 = 0;
                  }
                  v33 = (char *)(v31 + 8 * v27);
                  *(void *)v33 = 0;
                  v34 = v33 + 8;
                  while (v18 != (uint64_t *)v26)
                  {
                    uint64_t v35 = *--v18;
                    *((void *)v33 - 1) = v35;
                    v33 -= 8;
                  }
                  *id v17 = v33;
                  HDQuantityDistributionCalculator *v19 = v34;
                  *id v22 = v31 + 8 * v32;
                  if (v26) {
                    operator delete(v26);
                  }
                  v18 = (uint64_t *)v34;
                }
                else
                {
                  *v18++ = 0;
                }
                HDQuantityDistributionCalculator *v19 = (char *)v18;
                ++v25;
              }
              while (v25 != 64);
              *((int64x2_t *)begin + 4 * currentStartDateBucket + 1) = v88;
            }
            else
            {
              double v20 = *((double *)v16 + 2);
              double v21 = *((double *)v16 + 3);
              if (v20 >= a3) {
                double v20 = a3;
              }
              if (v21 < a3) {
                double v21 = a3;
              }
              *((double *)v16 + 2) = v20;
              *((double *)v16 + 3) = v21;
            }
            unint64_t v36 = (char *)begin + 64 * currentStartDateBucket;
            uint64_t v37 = *((void *)v36 + 4) + v92;
            if (v37 < 0)
            {
              unint64_t v58 = 16 - v37;
              v90 = v36 + 32;
              *((void *)v36 + 4) = 16 - v92;
              v59 = *v17;
              v93[0] = 0;
              uint64_t v62 = *((void *)v36 + 7);
              id v61 = (char **)(v36 + 56);
              uint64_t v60 = v62;
              unint64_t v63 = ((char *)v18 - v59) >> 3;
              if (16 - v37 > (unint64_t)((v62 - (uint64_t)v18) >> 3))
              {
                uint64_t v87 = 16 - v37;
                unint64_t v64 = v63 + v58;
                if ((v63 + v58) >> 61) {
LABEL_100:
                }
                  std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
                uint64_t v65 = v60 - (void)v59;
                if (v65 >> 2 > v64) {
                  unint64_t v64 = v65 >> 2;
                }
                if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v66 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v66 = v64;
                }
                if (v66)
                {
                  v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v66);
                  uint64_t v69 = v68;
                  v53 = *v17;
                  bzero(v67, 128 - 8 * v37);
                  v70 = &v67[8 * v69];
                  if (v53 != v59)
                  {
                    uint64_t v71 = 0;
                    uint64_t v72 = 16 - v37;
                    do
                    {
                      *(void *)&v67[v71 - 8] = *(void *)&v59[v71 - 8];
                      v71 -= 8;
                    }
                    while (&v59[v71] != v53);
                    v73 = &v67[v71];
LABEL_89:
                    v81 = &v67[8 * v72];
                    uint64_t v82 = *v19 - v59;
                    if (*v19 != v59)
                    {
                      v83 = v70;
                      memmove(v81, v59, *v19 - v59);
                      v70 = v83;
                      v53 = *v17;
                    }
                    *id v17 = v73;
                    HDQuantityDistributionCalculator *v19 = &v81[v82];
                    *id v61 = v70;
                    if (!v53) {
                      goto LABEL_93;
                    }
                    goto LABEL_92;
                  }
                  v53 = v59;
                  v73 = v67;
                }
                else
                {
                  bzero(0, 128 - 8 * v37);
                  v70 = 0;
                  v67 = 0;
                  v73 = 0;
                  v53 = v59;
                }
                uint64_t v72 = v87;
                goto LABEL_89;
              }
              unint64_t v74 = v58 - v63;
              if (v58 <= v63)
              {
                v75 = (char *)v18;
                unint64_t v63 = 16 - v37;
LABEL_74:
                v76 = (uint64_t *)&v75[-8 * v58];
                v77 = v75;
                while (v76 < v18)
                {
                  uint64_t v78 = *v76++;
                  *(void *)v77 = v78;
                  v77 += 8;
                }
                v79 = &v59[8 * v58];
                HDQuantityDistributionCalculator *v19 = v77;
                if (v75 != v79) {
                  memmove(&v75[-8 * ((v75 - v79) >> 3)], v59, v75 - v79);
                }
                uint64_t v80 = v93[0];
                if (v59 > (char *)v93) {
                  uint64_t v80 = 0;
                }
                do
                {
                  *(void *)v59 = v80;
                  v59 += 8;
                  --v63;
                }
                while (v63);
                goto LABEL_93;
              }
              bzero(v18, 128 - 8 * (v63 + v37));
              v75 = (char *)&v18[v74];
              HDQuantityDistributionCalculator *v19 = v75;
              if (v18 != (uint64_t *)v59)
              {
                unint64_t v58 = 16 - v37;
                goto LABEL_74;
              }
            }
            else
            {
              uint64_t v38 = *v17;
              uint64_t v39 = (char *)v18 - *v17;
              if (v37 < (unint64_t)(v39 >> 3)) {
                goto LABEL_94;
              }
              v90 = v36 + 32;
              uint64_t v40 = v39 >> 3;
              unint64_t v41 = v37 + 16;
              unint64_t v42 = v37 + 16 - v40;
              uint64_t v43 = (char *)begin + 64 * currentStartDateBucket;
              uint64_t v46 = *((void *)v43 + 7);
              v45 = v43 + 56;
              uint64_t v44 = v46;
              if (v42 > (v46 - (uint64_t)v18) >> 3)
              {
                v86 = v45;
                if ((unint64_t)v37 >= 0x1FFFFFFFFFFFFFF0) {
                  goto LABEL_100;
                }
                uint64_t v47 = v44 - (void)v38;
                if (v47 >> 2 > v41) {
                  unint64_t v41 = v47 >> 2;
                }
                if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v48 = v41;
                }
                uint64_t v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v48);
                uint64_t v51 = v50;
                uint64_t v52 = *v19;
                v53 = *v17;
                uint64_t v54 = &v49[8 * v40];
                bzero(v54, 8 * v42);
                uint64_t v55 = v54;
                if (v52 == v53)
                {
                  uint64_t v56 = v86;
                }
                else
                {
                  uint64_t v56 = v86;
                  do
                  {
                    uint64_t v57 = *((void *)v52 - 1);
                    v52 -= 8;
                    *((void *)v55 - 1) = v57;
                    v55 -= 8;
                  }
                  while (v52 != v53);
                }
                *id v17 = v55;
                HDQuantityDistributionCalculator *v19 = &v54[8 * v42];
                *(void *)uint64_t v56 = &v49[8 * v51];
                if (!v53) {
                  goto LABEL_93;
                }
LABEL_92:
                operator delete(v53);
                goto LABEL_93;
              }
              bzero(v18, 8 * v42);
              HDQuantityDistributionCalculator *v19 = (char *)&v18[v42];
            }
LABEL_93:
            uint64_t v37 = *v90 + v92;
            uint64_t v38 = *v17;
LABEL_94:
            ++*(void *)&v38[8 * v37];
            if (currentStartDateBucket != v89)
            {
              BOOL v84 = a4 == a5;
              ++currentStartDateBucket;
              uint64_t begin = self->_histogramState._dateBuckets.__begin_;
              double v85 = *((double *)begin + 8 * currentStartDateBucket);
              if (v85 != a5) {
                BOOL v84 = 0;
              }
              if (v85 < a5 || v84) {
                continue;
              }
            }
            return;
          }
        }
      }
    }
  }
}

- (id)quantityDistributionsWithUnit:(id)a3
{
  id v33 = a3;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t begin = self->_histogramState._dateBuckets.__begin_;
  end = self->_histogramState._dateBuckets.__end_;
  if (begin != end)
  {
    unint64_t v5 = 0x1E4F1C000uLL;
    unint64_t v31 = self;
    do
    {
      double histogramBucketAnchor = self->_histogramState._histogramBucketAnchor;
      double histogramBucketSize = self->_histogramState._histogramBucketSize;
      id v8 = v33;
      id v9 = v8;
      if (*((void *)begin + 6) == *((void *)begin + 5))
      {

        id v22 = 0;
      }
      else
      {
        uint64_t v10 = [*(id *)(v5 + 2504) dateWithTimeIntervalSinceReferenceDate:*(double *)begin];
        uint64_t v11 = [*(id *)(v5 + 2504) dateWithTimeIntervalSinceReferenceDate:*((double *)begin + 1)];
        v12 = [MEMORY[0x1E4F2B370] quantityWithUnit:v9 doubleValue:*((double *)begin + 2)];
        uint64_t v13 = [MEMORY[0x1E4F2B370] quantityWithUnit:v9 doubleValue:*((double *)begin + 3)];
        uint64_t v14 = *((void *)begin + 5);
        uint64_t v15 = (*((void *)begin + 6) - v14) >> 3;
        if (*((void *)begin + 6) == v14)
        {
LABEL_10:
          uint64_t v16 = 0;
        }
        else
        {
          uint64_t v16 = 0;
          if ((unint64_t)v15 <= 1) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = (*((void *)begin + 6) - v14) >> 3;
          }
          while (!*(void *)(v14 + 8 * v16))
          {
            if (v17 == ++v16) {
              goto LABEL_10;
            }
          }
        }
        uint64_t v35 = (void *)v10;
        unint64_t v36 = v9;
        uint64_t v18 = (((*((void *)begin + 6) - v14) >> 3) & ((*((void *)begin + 6) - v14) >> 63)) - 1;
        uint64_t v19 = v14 - 8;
        while (1)
        {
          uint64_t v20 = v15 - 1;
          if (v15 < 1) {
            break;
          }
          if (*(void *)(v19 + 8 * v15--)) {
            goto LABEL_17;
          }
        }
        uint64_t v20 = v18;
LABEL_17:
        v34 = (void *)v13;
        uint64_t v23 = v20 & ~(v20 >> 63);
        v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v23 - v16 + 1];
        if (v23 >= v16)
        {
          uint64_t v25 = v23 + 1;
          uint64_t v26 = v16;
          do
          {
            uint64_t v27 = [NSNumber numberWithLong:*(void *)(*((void *)begin + 5) + 8 * v26)];
            [v24 addObject:v27];

            ++v26;
          }
          while (v25 != v26);
        }
        unint64_t v28 = [MEMORY[0x1E4F2B370] quantityWithUnit:v36 doubleValue:histogramBucketAnchor + (double)(v16 - *((void *)begin + 4)) * histogramBucketSize];
        id v22 = (void *)[objc_alloc(MEMORY[0x1E4F2B948]) initWithStartDate:v35 endDate:v11 minimumBucketValue:v28 minimumValue:v12 maximumValue:v34 averageValue:0 duration:0 histogramCounts:v24];

        if (v22) {
          [v30 addObject:v22];
        }
        self = v31;
        unint64_t v5 = 0x1E4F1C000;
      }

      uint64_t begin = (HistogramBucket *)((char *)begin + 64);
    }
    while (begin != end);
  }

  return v30;
}

- (BOOL)validateDateSequenceForTesting:(id)a3
{
  id v4 = a3;
  if ([v4 count] - 1 == (self->_histogramState._dateBuckets.__end_
                                       - self->_histogramState._dateBuckets.__begin_) >> 6)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [v4 count] - 1;
      BOOL v8 = v6 >= v7;
      if (v6 >= v7) {
        break;
      }
      id v9 = [v4 objectAtIndexedSubscript:v6];
      [v9 timeIntervalSinceReferenceDate];
      double v11 = v10;

      v12 = [v4 objectAtIndexedSubscript:v6 + 1];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;

      uint64_t begin = self->_histogramState._dateBuckets.__begin_;
      if (*(double *)((char *)begin + v5) != v11) {
        break;
      }
      double v16 = *(double *)((char *)begin + v5 + 8);
      v5 += 64;
      ++v6;
    }
    while (v16 == v14);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  uint64_t begin = self->_histogramState._dateBuckets.__begin_;
  if (begin)
  {
    end = self->_histogramState._dateBuckets.__end_;
    uint64_t v5 = self->_histogramState._dateBuckets.__begin_;
    if (end != begin)
    {
      do
      {
        unint64_t v6 = (void *)*((void *)end - 3);
        if (v6)
        {
          *((void *)end - 2) = v6;
          operator delete(v6);
        }
        end = (HistogramBucket *)((char *)end - 64);
      }
      while (end != begin);
      uint64_t v5 = self->_histogramState._dateBuckets.__begin_;
    }
    self->_histogramState._dateBuckets.__end_ = begin;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end