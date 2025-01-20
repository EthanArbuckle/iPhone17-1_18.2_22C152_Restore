@interface HDStatisticsCollectionCalculatorAttenuatedDataSource
- (BOOL)_attenuationSamplesWindowContainsSample:(id *)a3;
- (BOOL)_attenuationSamplesWindowContainsSampleStart:(id *)a3;
- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7;
- (HDQuantitySampleAttenuationEngine)attenuationEngine;
- (HDQuantitySampleAttenuationProvider)attenuationProvider;
- (deque<HDQuantitySampleAttenuationEngineSample,)attenuationSamplesWindow;
- (id).cxx_construct;
- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6 attenuationType:(id)a7;
- (queue<HDQuantitySampleAttenuationEngineSample,)_extractAttenuatedSamplesFrom:()queue<HDQuantitySampleAttenuationEngineSample;
- (void)_appendToAttenuationSamplesWindowUsingSourceSample:(id *)a3 attenuatedSample:(id *)a4;
- (void)_attenuationSamplesWindowAdvanceToSample:(id *)a3;
- (void)setAttenuationSamplesWindow:()deque<HDQuantitySampleAttenuationEngineSample;
@end

@implementation HDStatisticsCollectionCalculatorAttenuatedDataSource

- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6 attenuationType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDStatisticsCollectionCalculatorAttenuatedDataSource;
  v17 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)&v23 initForProfile:v12 quantityType:v13 predicate:v14 restrictedSourceEntities:v15];
  if (v17)
  {
    v18 = [[HDQuantitySampleAttenuationProvider alloc] initWithQuantityType:v16 profile:v12];
    v19 = (void *)v17[12];
    v17[12] = v18;

    v20 = [[HDQuantitySampleAttenuationEngine alloc] initWithAttenuationEngineDelegate:v17[12]];
    v21 = (void *)v17[13];
    v17[13] = v20;
  }
  return v17;
}

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __127__HDStatisticsCollectionCalculatorAttenuatedDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke;
  v27[3] = &unk_1E630DE00;
  v27[4] = self;
  id v14 = v12;
  id v28 = v14;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __127__HDStatisticsCollectionCalculatorAttenuatedDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2;
  v25[3] = &unk_1E63033D0;
  id v15 = v13;
  id v26 = v15;
  v24.receiver = self;
  v24.super_class = (Class)HDStatisticsCollectionCalculatorAttenuatedDataSource;
  if ([(HDStatisticsCollectionCalculatorDefaultDataSource *)&v24 collectionCalculator:a3 queryForInterval:a4 error:a5 sampleHandler:v27 mergeHandler:v25])
  {
    attenuationEngine = self->_attenuationEngine;
    id v23 = 0;
    BOOL v17 = [(HDQuantitySampleAttenuationEngine *)attenuationEngine delegateLoadingWasSuccessful:&v23];
    id v18 = v23;
    v19 = v18;
    if (!v17)
    {
      id v20 = v18;
      v21 = v20;
      if (v20)
      {
        if (a5) {
          *a5 = v20;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

uint64_t __127__HDStatisticsCollectionCalculatorAttenuatedDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4, double a5, double a6)
{
  double v8 = a5;
  *(_DWORD *)((char *)v65 + 3) = 0;
  v65[0] = 0;
  if (a3)
  {
    v11 = *(void **)(a1 + 32);
    *(double *)v61 = a5;
    *(double *)&v61[1] = a6;
    *(double *)&v61[2] = a4;
    char v62 = 1;
    memset(v63, 0, sizeof(v63));
    uint64_t v64 = a2;
    [v11 _attenuationSamplesWindowAdvanceToSample:v61];
  }
  id v12 = *(void **)(a1 + 32);
  *(double *)v57 = v8;
  *(double *)&v57[1] = a6;
  *(double *)&v57[2] = a4;
  char v58 = 1;
  memset(v59, 0, sizeof(v59));
  uint64_t v60 = a2;
  char v13 = [v12 _attenuationSamplesWindowContainsSample:v57];
  id v14 = *(void **)(a1 + 32);
  *(double *)v53 = v8;
  *(double *)&v53[1] = a6;
  *(double *)&v53[2] = a4;
  char v54 = 1;
  memset(v55, 0, sizeof(v55));
  uint64_t v56 = a2;
  int v15 = [v14 _attenuationSamplesWindowContainsSampleStart:v53];
  if ((v13 & 1) != 0 || v15)
  {
    int v29 = v15;
    BOOL v17 = *(void **)(a1 + 32);
    *(double *)v46 = v8;
    *(double *)&v46[1] = a6;
    *(double *)&v46[2] = a4;
    char v47 = 1;
    memset(v48, 0, sizeof(v48));
    uint64_t v49 = a2;
    if (v17)
    {
      [v17 _extractAttenuatedSamplesFrom:v46];
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v50 = 0u;
    }
    while (*((void *)&v52 + 1))
    {
      id v18 = (double *)(*(void *)(*((void *)&v50 + 1) + 8 * ((unint64_t)v52 / 0x66))
                     + 40 * ((unint64_t)v52 % 0x66));
      double v19 = *v18;
      double v20 = v18[1];
      double v21 = v18[2];
      *(void *)&long long v52 = v52 + 1;
      --*((void *)&v52 + 1);
      if ((unint64_t)v52 >= 0xCC)
      {
        operator delete(**((void ***)&v50 + 1));
        *((void *)&v50 + 1) += 8;
        *(void *)&long long v52 = v52 - 102;
      }
      if (((*(uint64_t (**)(double, double, double))(*(void *)(a1 + 40) + 16))(v21, v19, v20) & 1) == 0)
      {
        std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](&v50);
        return 0;
      }
    }
    std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](&v50);
    int v15 = v29;
    if (v13) {
      return 1;
    }
  }
  else if (v13)
  {
    return 1;
  }
  v22 = *(void **)(a1 + 32);
  uint64_t v23 = a2;
  if (v15)
  {
    uint64_t v23 = 0;
    unint64_t v24 = v22[19] + v22[18] - 1;
    double v8 = *(double *)(*(void *)(v22[15] + 8 * (v24 / 0x66)) + 40 * (v24 % 0x66) + 8);
  }
  *(void *)&long long v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  v25 = (void *)v22[13];
  *(double *)v42 = v8;
  *(double *)&v42[1] = a6;
  *(double *)&v42[2] = a4;
  uint64_t v16 = 1;
  char v43 = 1;
  memset(v44, 0, sizeof(v44));
  uint64_t v45 = v23;
  if (v25)
  {
    [v25 attenuateSample:v42];
    if (*((double *)&v50 + 1) - *(double *)&v50 > 0.000001)
    {
      long long v30 = xmmword_1BD329BE0;
      do
      {
        id v26 = *(void **)(a1 + 32);
        *(double *)v38 = v8;
        *(double *)&v38[1] = a6;
        *(double *)&v38[2] = a4;
        char v39 = 1;
        *(_DWORD *)v40 = v65[0];
        *(_DWORD *)&v40[3] = *(_DWORD *)((char *)v65 + 3);
        uint64_t v41 = v23;
        v36[0] = v50;
        v36[1] = v51;
        uint64_t v37 = v52;
        objc_msgSend(v26, "_appendToAttenuationSamplesWindowUsingSourceSample:attenuatedSample:", v38, v36, (void)v30);
        uint64_t v16 = (*(uint64_t (**)(double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)&v51, *(double *)&v50, *((double *)&v50 + 1));
        if (!v16 || a6 - *((double *)&v50 + 1) <= 0.000001) {
          break;
        }
        v27 = *(void **)(*(void *)(a1 + 32) + 104);
        v31[0] = *((void *)&v50 + 1);
        *(double *)&v31[1] = a6;
        *(double *)&v31[2] = a4;
        long long v32 = v30;
        if (v27)
        {
          [v27 attenuateSample:v31];
        }
        else
        {
          uint64_t v35 = 0;
          long long v33 = 0u;
          long long v34 = 0u;
        }
        long long v50 = v33;
        long long v51 = v34;
        *(void *)&long long v52 = v35;
      }
      while (*((double *)&v33 + 1) - *(double *)&v33 > 0.000001);
    }
  }
  return v16;
}

uint64_t __127__HDStatisticsCollectionCalculatorAttenuatedDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_appendToAttenuationSamplesWindowUsingSourceSample:(id *)a3 attenuatedSample:(id *)a4
{
  long long v4 = *(_OWORD *)&a4->var0;
  double v5 = a3->var2 - a4->var2;
  long long v6 = xmmword_1BD329BE0;
  std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(&self->_attenuationSamplesWindow.__map_.__first_, (uint64_t)&v4);
}

- (BOOL)_attenuationSamplesWindowContainsSample:(id *)a3
{
  unint64_t value = self->_attenuationSamplesWindow.__size_.__value_;
  BOOL result = value
        && (begin = self->_attenuationSamplesWindow.__map_.__begin_,
            unint64_t start = self->_attenuationSamplesWindow.__start_,
            *((double *)begin[start / 0x66] + 5 * (start % 0x66)) <= a3->var0)
        && *((double *)begin[(value + start - 1) / 0x66] + 5 * ((value + start - 1) % 0x66) + 1) >= a3->var1;
  return result;
}

- (BOOL)_attenuationSamplesWindowContainsSampleStart:(id *)a3
{
  unint64_t value = self->_attenuationSamplesWindow.__size_.__value_;
  BOOL result = value
        && (begin = self->_attenuationSamplesWindow.__map_.__begin_,
            unint64_t start = self->_attenuationSamplesWindow.__start_,
            *((double *)begin[start / 0x66] + 5 * (start % 0x66)) <= a3->var0)
        && (double v6 = *((double *)begin[(value + start - 1) / 0x66] + 5 * ((value + start - 1) % 0x66) + 1), v6 < a3->var1)
        && a3->var0 < v6;
  return result;
}

- (queue<HDQuantitySampleAttenuationEngineSample,)_extractAttenuatedSamplesFrom:()queue<HDQuantitySampleAttenuationEngineSample
{
  *(_OWORD *)&retstr->var0.__map_.__end_ = 0u;
  *(_OWORD *)&retstr->var0.__start_ = 0u;
  *(_OWORD *)&retstr->var0.__map_.__first_ = 0u;
  p_end = &self[2].var0.__map_.__end_;
  if (self[3].var0.__map_.__begin_)
  {
    unint64_t v7 = 0;
    do
    {
      double v8 = (double *)((char *)p_end[1][((unint64_t)p_end[4] + v7) / 0x66]
                    + 40 * (((unint64_t)p_end[4] + v7) % 0x66));
      double v9 = *v8;
      double v10 = v8[1];
      double v11 = fmax(a4->var2 - v8[2], 0.0);
      double var0 = a4->var0;
      if (*v8 > a4->var0 || v10 <= var0)
      {
        if (v9 >= var0)
        {
          double var1 = a4->var1;
          if (v10 <= var1)
          {
            double v19 = *v8;
            double v20 = v10;
            double v21 = v11;
            BOOL var3 = a4->var3;
            int64_t var4 = a4->var4;
            BOOL v22 = var3;
            std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(retstr, (uint64_t)&v19);
          }
          else if (v9 < var1)
          {
            if (v10 < var1) {
              double var1 = v8[1];
            }
            double v19 = *v8;
            double v20 = var1;
            double v21 = v11;
            BOOL v15 = a4->var3;
            int64_t var4 = a4->var4;
            BOOL v22 = v15;
            std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(retstr, (uint64_t)&v19);
          }
        }
      }
      else
      {
        double v16 = a4->var1;
        if (v10 < v16) {
          double v16 = v8[1];
        }
        double v19 = a4->var0;
        double v20 = v16;
        double v21 = v11;
        BOOL v17 = a4->var3;
        int64_t var4 = a4->var4;
        BOOL v22 = v17;
        std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(retstr, (uint64_t)&v19);
      }
      if (v10 >= a4->var1) {
        break;
      }
      ++v7;
    }
    while ((unint64_t)p_end[5] > v7);
  }
  return self;
}

- (void)_attenuationSamplesWindowAdvanceToSample:(id *)a3
{
  p_attenuationSamplesWindow = &self->_attenuationSamplesWindow;
  unint64_t value = self->_attenuationSamplesWindow.__size_.__value_;
  if (value)
  {
    begin = (void **)self->_attenuationSamplesWindow.__map_.__begin_;
    unint64_t start = self->_attenuationSamplesWindow.__start_;
    double v8 = (double *)((char *)begin[start / 0x66] + 40 * (start % 0x66));
    double var0 = a3->var0;
    if (*v8 > a3->var0 || *((double *)begin[(value + start - 1) / 0x66] + 5 * ((value + start - 1) % 0x66) + 1) <= var0)
    {
      end = self->_attenuationSamplesWindow.__map_.__end_;
      self->_attenuationSamplesWindow.__size_.__value_ = 0;
      unint64_t v11 = (char *)end - (char *)begin;
      if (v11 >= 0x11)
      {
        do
        {
          operator delete(*begin);
          id v12 = p_attenuationSamplesWindow->__map_.__end_;
          begin = (void **)(p_attenuationSamplesWindow->__map_.__begin_ + 1);
          p_attenuationSamplesWindow->__map_.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)begin;
          unint64_t v11 = (char *)v12 - (char *)begin;
        }
        while (v11 > 0x10);
      }
      if (v11 >> 3 == 1)
      {
        uint64_t v13 = 51;
      }
      else
      {
        if (v11 >> 3 != 2) {
          return;
        }
        uint64_t v13 = 102;
      }
      p_attenuationSamplesWindow->__start_ = v13;
    }
    else if (v8[1] <= var0)
    {
      do
      {
        if (*((double *)begin[start / 0x66] + 5 * (start % 0x66) + 1) > a3->var0) {
          break;
        }
        --value;
        p_attenuationSamplesWindow->__start_ = ++start;
        p_attenuationSamplesWindow->__size_.__value_ = value;
        if (start >= 0xCC)
        {
          operator delete(*begin);
          begin = (void **)(p_attenuationSamplesWindow->__map_.__begin_ + 1);
          p_attenuationSamplesWindow->__map_.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)begin;
          unint64_t value = p_attenuationSamplesWindow->__size_.__value_;
          unint64_t start = p_attenuationSamplesWindow->__start_ - 102;
          p_attenuationSamplesWindow->__start_ = start;
        }
      }
      while (value);
    }
  }
}

- (HDQuantitySampleAttenuationProvider)attenuationProvider
{
  return self->_attenuationProvider;
}

- (HDQuantitySampleAttenuationEngine)attenuationEngine
{
  return self->_attenuationEngine;
}

- (deque<HDQuantitySampleAttenuationEngineSample,)attenuationSamplesWindow
{
  *(_OWORD *)&retstr->__map_.__first_ = 0u;
  *(_OWORD *)&retstr->__map_.__end_ = 0u;
  *(_OWORD *)&retstr->__start_ = 0u;
  unint64_t start = self->_attenuationSamplesWindow.__start_;
  begin = self->_attenuationSamplesWindow.__map_.__begin_;
  double v6 = &begin[start / 0x66];
  if (self->_attenuationSamplesWindow.__map_.__end_ == begin)
  {
    unint64_t v7 = 0;
    unint64_t v10 = 0;
    double v9 = &begin[(self->_attenuationSamplesWindow.__size_.__value_ + start) / 0x66];
  }
  else
  {
    unint64_t v7 = (long long *)((char *)begin[start / 0x66] + 40 * (start % 0x66));
    unint64_t v8 = self->_attenuationSamplesWindow.__size_.__value_ + start;
    double v9 = &begin[v8 / 0x66];
    unint64_t v10 = (unint64_t)*v9 + 40 * (v8 % 0x66);
  }
  if ((long long *)v10 == v7) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = 102 * (v9 - v6)
  }
        - 0x3333333333333333 * ((uint64_t)(v10 - (void)*v9) >> 3)
        + 0x3333333333333333 * (((char *)v7 - (char *)*v6) >> 3);
  return (deque<HDQuantitySampleAttenuationEngineSample, std::allocator<HDQuantitySampleAttenuationEngineSample>> *)std::deque<HDQuantitySampleAttenuationEngineSample>::__append_with_size[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>>(retstr, v6, v7, v11);
}

- (void)setAttenuationSamplesWindow:()deque<HDQuantitySampleAttenuationEngineSample
{
  p_attenuationSamplesWindow = &self->_attenuationSamplesWindow;
  if (&self->_attenuationSamplesWindow == a3) {
    return;
  }
  unint64_t start = a3->__start_;
  begin = a3->__map_.__begin_;
  double v6 = (uint64_t *)&begin[start / 0x66];
  if (a3->__map_.__end_ == begin)
  {
    unint64_t v7 = 0;
    unint64_t v10 = 0;
    double v9 = &begin[(a3->__size_.__value_ + start) / 0x66];
  }
  else
  {
    unint64_t v7 = (long long *)((char *)begin[start / 0x66] + 40 * (start % 0x66));
    unint64_t v8 = a3->__size_.__value_ + start;
    double v9 = &begin[v8 / 0x66];
    unint64_t v10 = (unint64_t)*v9 + 40 * (v8 % 0x66);
  }
  if ((long long *)v10 == v7)
  {
    unint64_t v11 = 0;
    p_size = &self->_attenuationSamplesWindow.__size_;
  }
  else
  {
    unint64_t v11 = 102 * (((char *)v9 - (char *)v6) >> 3)
        - 0x3333333333333333 * ((uint64_t)(v10 - (void)*v9) >> 3)
        + 0x3333333333333333 * (((uint64_t)v7 - *v6) >> 3);
    p_size = &self->_attenuationSamplesWindow.__size_;
    unint64_t value = self->_attenuationSamplesWindow.__size_.__value_;
    if (value < v11)
    {
      uint64_t v41 = v6;
      v42 = v7;
      std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>::operator+=[abi:ne180100](&v41, value);
      id v14 = v41;
      BOOL v15 = v42;
      unint64_t v16 = p_attenuationSamplesWindow->__start_;
      BOOL v17 = p_attenuationSamplesWindow->__map_.__begin_;
      id v18 = (uint64_t *)&v17[v16 / 0x66];
      if (p_attenuationSamplesWindow->__map_.__end_ == v17) {
        unint64_t v19 = 0;
      }
      else {
        unint64_t v19 = *v18 + 40 * (v16 % 0x66);
      }
      uint64_t v41 = v18;
      v42 = (long long *)v19;
      std::__for_each_segment[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>>>(v6, v7, v14, v15, (uint64_t)&v41);
      std::deque<HDQuantitySampleAttenuationEngineSample>::__append_with_size[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>>(p_attenuationSamplesWindow, v14, v15, v11 - p_attenuationSamplesWindow->__size_.__value_);
      return;
    }
  }
  unint64_t v20 = self->_attenuationSamplesWindow.__start_;
  double v21 = self->_attenuationSamplesWindow.__map_.__begin_;
  BOOL v22 = &v21[v20 / 0x66];
  if (self->_attenuationSamplesWindow.__map_.__end_ == v21) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = (unint64_t)*v22 + 40 * (v20 % 0x66);
  }
  uint64_t v41 = v6;
  v42 = v7;
  std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>::operator+=[abi:ne180100](&v41, v11);
  unint64_t v24 = v41;
  v25 = v42;
  uint64_t v41 = (uint64_t *)v22;
  v42 = (long long *)v23;
  std::__for_each_segment[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>>>(v6, v7, v24, v25, (uint64_t)&v41);
  unint64_t v26 = p_attenuationSamplesWindow->__start_;
  unint64_t v27 = p_attenuationSamplesWindow->__size_.__value_;
  id v28 = p_attenuationSamplesWindow->__map_.__begin_;
  uint64_t end = (uint64_t)p_attenuationSamplesWindow->__map_.__end_;
  long long v30 = &v28[(v26 + v27) / 0x66];
  if (($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end == v28) {
    unint64_t v31 = 0;
  }
  else {
    unint64_t v31 = (unint64_t)*v30 + 40 * ((v26 + v27) % 0x66);
  }
  if ((long long *)v31 != v42)
  {
    uint64_t v32 = 102 * (((char *)v30 - (char *)v41) >> 3) - 0x3333333333333333 * ((uint64_t)(v31 - (void)*v30) >> 3);
    uint64_t v33 = ((uint64_t)v42 - *v41) >> 3;
    uint64_t v34 = v32 + 0x3333333333333333 * v33;
    if (v34 >= 1)
    {
      uint64_t v35 = &v28[v26 / 0x66];
      unint64_t v36 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end == v28 ? 0 : (unint64_t)*v35 + 40 * (v26 % 0x66);
      uint64_t v37 = v42 == (long long *)v36
          ? 0
          : 102 * (((char *)v41 - (char *)v35) >> 3)
          - 0x3333333333333333 * v33
          + 0x3333333333333333 * ((uint64_t)(v36 - (void)*v35) >> 3);
      uint64_t v41 = (uint64_t *)&v28[v26 / 0x66];
      v42 = (long long *)v36;
      uint64_t v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end == v28 ? 0 : 102 * ((end - (uint64_t)v28) >> 3) - 1;
      std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>::operator+=[abi:ne180100](&v41, v37);
      p_size->__value_ = v27 - v34;
      if (v38 - v26 - (v27 - v34) >= 0xCC)
      {
        do
        {
          operator delete(*(void **)(end - 8));
          char v39 = p_attenuationSamplesWindow->__map_.__begin_;
          uint64_t end = (uint64_t)(p_attenuationSamplesWindow->__map_.__end_ - 1);
          uint64_t v40 = 102 * ((end - (uint64_t)v39) >> 3) - 1;
          p_attenuationSamplesWindow->__map_.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end;
          if (($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end == v39) {
            uint64_t v40 = 0;
          }
        }
        while (v40 - (p_attenuationSamplesWindow->__size_.__value_ + p_attenuationSamplesWindow->__start_) > 0xCB);
      }
    }
  }
}

- (void).cxx_destruct
{
  std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](&self->_attenuationSamplesWindow.__map_.__first_);
  objc_storeStrong((id *)&self->_attenuationEngine, 0);

  objc_storeStrong((id *)&self->_attenuationProvider, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  return self;
}

@end