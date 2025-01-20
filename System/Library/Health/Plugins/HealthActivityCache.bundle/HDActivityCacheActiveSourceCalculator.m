@interface HDActivityCacheActiveSourceCalculator
- (HDActivityCacheActiveSource)_baseActiveSource;
- (HDActivityCacheActiveSourceCalculator)init;
- (id).cxx_construct;
- (vector<HDActivityCacheActiveSource,)createActiveSourceLog;
- (void)setActivationLogEntries:(void *)a3;
- (void)setLocalDeviceSourceIdentifier:(int64_t)a3;
- (void)setWorkouts:(void *)a3;
@end

@implementation HDActivityCacheActiveSourceCalculator

- (HDActivityCacheActiveSourceCalculator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDActivityCacheActiveSourceCalculator;
  result = [(HDActivityCacheActiveSourceCalculator *)&v3 init];
  if (result) {
    result->_baseSourceIdentifier = HDActivityCacheActiveSourceCalculatorDefaultBaseSourceIdentifier;
  }
  return result;
}

- (void)setLocalDeviceSourceIdentifier:(int64_t)a3
{
  self->_baseSourceIdentifier = a3;
}

- (void)setWorkouts:(void *)a3
{
  p_workouts = (char *)&self->_workouts;
  if (p_workouts != a3) {
    sub_DE00(p_workouts, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 6);
  }
}

- (void)setActivationLogEntries:(void *)a3
{
  p_activationLogEntries = (uint64_t *)&self->_activationLogEntries;
  if (p_activationLogEntries != a3) {
    sub_DF88(p_activationLogEntries, *(void *)a3, *((void *)a3 + 1), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
  }
}

- (vector<HDActivityCacheActiveSource,)createActiveSourceLog
{
  if (self)
  {
    int64_t baseSourceIdentifier = self->_baseSourceIdentifier;
    unint64_t v6 = 0xFFEFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t baseSourceIdentifier = 0;
    unint64_t v6 = 0;
  }
  v7 = operator new(0x18uLL);
  v9 = (__n128 *)(v7 + 3);
  v66 = (__n128 *)(v7 + 3);
  v67 = (__n128 *)(v7 + 3);
  void *v7 = v6;
  v7[1] = baseSourceIdentifier;
  v7[2] = 0;
  __p = (__n128 *)v7;
  begin = self->_activationLogEntries.__begin_;
  for (i = self->_activationLogEntries.__end_; begin != i; ++begin)
  {
    if (v9 >= v67)
    {
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)__p) >> 3);
      unint64_t v14 = v13 + 1;
      if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_DCEC();
      }
      if (0x5555555555555556 * (((char *)v67 - (char *)__p) >> 3) > v14) {
        unint64_t v14 = 0x5555555555555556 * (((char *)v67 - (char *)__p) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v67 - (char *)__p) >> 3) >= 0x555555555555555) {
        unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v15 = v14;
      }
      v16 = (char *)sub_E468((uint64_t)&v67, v15);
      v18 = &v16[24 * v13];
      v8.n128_u64[0] = *(void *)&begin->var0;
      int64_t var1 = begin->var1;
      *(double *)v18 = begin->var0;
      *((void *)v18 + 1) = var1;
      *((void *)v18 + 2) = 0;
      v20 = v66;
      v21 = (__n128 *)v18;
      if (v66 != __p)
      {
        do
        {
          __n128 v8 = *(__n128 *)((char *)v20 - 24);
          v21[-1].n128_u64[1] = v20[-1].n128_u64[1];
          *(__n128 *)((char *)v21 - 24) = v8;
          v21 = (__n128 *)((char *)v21 - 24);
          v20 = (__n128 *)((char *)v20 - 24);
        }
        while (v20 != __p);
        v20 = __p;
      }
      v9 = (__n128 *)(v18 + 24);
      __p = v21;
      v67 = (__n128 *)&v16[24 * v17];
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      v8.n128_u64[0] = *(void *)&begin->var0;
      int64_t v12 = begin->var1;
      v9->n128_u64[0] = *(void *)&begin->var0;
      v9->n128_u64[1] = v12;
      v9[1].n128_u64[0] = 0;
      v9 = (__n128 *)((char *)v9 + 24);
    }
    v66 = v9;
  }
  v23 = self->_workouts.__begin_;
  for (j = self->_workouts.__end_; v23 != j; v23 = (HDActivityCacheStatisticsBuilderWorkoutSample *)((char *)v23 + 64))
  {
    unint64_t v24 = *((void *)v23 + 5);
    unint64_t v26 = *(void *)v23;
    unint64_t v25 = *((void *)v23 + 1);
    v27 = (unint64_t *)v67;
    if (v9 >= v67)
    {
      v29 = __p;
      unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)__p) >> 3);
      unint64_t v31 = v30 + 1;
      if (v30 + 1 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_104;
      }
      if (0x5555555555555556 * (((char *)v67 - (char *)__p) >> 3) > v31) {
        unint64_t v31 = 0x5555555555555556 * (((char *)v67 - (char *)__p) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v67 - (char *)__p) >> 3) >= 0x555555555555555) {
        unint64_t v32 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v32 = v31;
      }
      if (v32)
      {
        v33 = (char *)sub_E468((uint64_t)&v67, v32);
        v29 = __p;
        v9 = v66;
      }
      else
      {
        v33 = 0;
      }
      v34 = (unint64_t *)&v33[24 * v30];
      unint64_t *v34 = v26;
      v34[1] = v24;
      v34[2] = 1;
      v35 = (__n128 *)v34;
      if (v9 != v29)
      {
        do
        {
          __n128 v8 = *(__n128 *)((char *)v9 - 24);
          v35[-1].n128_u64[1] = v9[-1].n128_u64[1];
          *(__n128 *)((char *)v35 - 24) = v8;
          v35 = (__n128 *)((char *)v35 - 24);
          v9 = (__n128 *)((char *)v9 - 24);
        }
        while (v9 != v29);
        v29 = __p;
      }
      v27 = (unint64_t *)&v33[24 * v32];
      v28 = v34 + 3;
      __p = v35;
      v67 = (__n128 *)v27;
      if (v29)
      {
        operator delete(v29);
        v27 = (unint64_t *)v67;
      }
    }
    else
    {
      v9->n128_u64[0] = v26;
      v28 = &v9[1].n128_u64[1];
      v9->n128_u64[1] = v24;
      v9[1].n128_u64[0] = 1;
    }
    if (v28 >= v27)
    {
      v36 = __p;
      unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * (((char *)v28 - (char *)__p) >> 3) + 1;
      if (v37 > 0xAAAAAAAAAAAAAAALL) {
LABEL_104:
      }
        sub_DCEC();
      unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)__p) >> 3);
      if (2 * v38 > v37) {
        unint64_t v37 = 2 * v38;
      }
      if (v38 >= 0x555555555555555) {
        unint64_t v39 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v39 = v37;
      }
      if (v39)
      {
        v40 = (char *)sub_E468((uint64_t)&v67, v39);
        v36 = __p;
      }
      else
      {
        v40 = 0;
      }
      v41 = &v40[8 * (((char *)v28 - (char *)__p) >> 3)];
      *(void *)v41 = v25;
      *((void *)v41 + 1) = v24;
      *((void *)v41 + 2) = 2;
      v42 = (__n128 *)v41;
      if (v28 != (unint64_t *)v36)
      {
        do
        {
          __n128 v8 = *(__n128 *)(v28 - 3);
          v42[-1].n128_u64[1] = *(v28 - 1);
          *(__n128 *)((char *)v42 - 24) = v8;
          v42 = (__n128 *)((char *)v42 - 24);
          v28 -= 3;
        }
        while (v28 != (unint64_t *)v36);
        v36 = __p;
      }
      v9 = (__n128 *)(v41 + 24);
      __p = v42;
      v67 = (__n128 *)&v40[24 * v39];
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      unint64_t *v28 = v25;
      v9 = (__n128 *)(v28 + 3);
      v28[1] = v24;
      v28[2] = 2;
    }
    v66 = v9;
  }
  unint64_t v43 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)__p) >> 3));
  if (v9 == __p) {
    uint64_t v44 = 0;
  }
  else {
    uint64_t v44 = v43;
  }
  sub_E4B0((uint64_t)__p, v9, (uint64_t)&v69, v44, 1, v8);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  uint64_t v68 = HDActivityCacheActiveSourceCalculatorDefaultBaseSourceIdentifier;
  v46 = __p;
  if (__p == v66) {
    goto LABEL_101;
  }
  end = 0;
  do
  {
    unint64_t v48 = v46[1].n128_u64[0];
    switch(v48)
    {
      case 2uLL:
        if (v69 != v70)
        {
          uint64_t v51 = 0;
          uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
          v53 = (char *)v69;
          do
          {
            uint64_t v54 = *(void *)v53;
            v53 += 8;
            if (v54 == v46->n128_u64[1]) {
              uint64_t v52 = v51;
            }
            ++v51;
          }
          while (v53 != v70);
          if (v52 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v55 = (char *)v69 + 8 * v52;
            int64_t v56 = v70 - (v55 + 8);
            if (v70 != v55 + 8)
            {
              memmove((char *)v69 + 8 * v52, v55 + 8, v70 - (v55 + 8));
              end = retstr->__end_;
            }
            v70 = &v55[v56];
          }
        }
        if (end < retstr->__end_cap_.__value_)
        {
          sub_F8FC((uint64_t)end, v46->n128_f64, &v68, (uint64_t)&v69);
LABEL_94:
          retstr->__end_ = ++end;
LABEL_96:
          retstr->__end_ = end;
          break;
        }
LABEL_95:
        end = (HDActivityCacheActiveSource *)sub_F7DC((uint64_t *)retstr, v46->n128_f64, &v68, (uint64_t)&v69);
        goto LABEL_96;
      case 1uLL:
        v49 = v70;
        if (v70 >= v71)
        {
          v57 = (char *)v69;
          uint64_t v58 = (v70 - (unsigned char *)v69) >> 3;
          unint64_t v59 = v58 + 1;
          if ((unint64_t)(v58 + 1) >> 61) {
            sub_DCEC();
          }
          uint64_t v60 = v71 - (unsigned char *)v69;
          if ((v71 - (unsigned char *)v69) >> 2 > v59) {
            unint64_t v59 = v60 >> 2;
          }
          if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v61 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v61 = v59;
          }
          if (v61)
          {
            v62 = (char *)sub_DD04((uint64_t)&v71, v61);
            v57 = (char *)v69;
            v49 = v70;
          }
          else
          {
            v62 = 0;
          }
          v63 = &v62[8 * v58];
          *(void *)v63 = v46->n128_u64[1];
          v50 = v63 + 8;
          while (v49 != v57)
          {
            uint64_t v64 = *((void *)v49 - 1);
            v49 -= 8;
            *((void *)v63 - 1) = v64;
            v63 -= 8;
          }
          v69 = v63;
          v70 = v50;
          v71 = &v62[8 * v61];
          if (v57) {
            operator delete(v57);
          }
        }
        else
        {
          *(void *)v70 = v46->n128_u64[1];
          v50 = v49 + 8;
        }
        v70 = v50;
        end = retstr->__end_;
        if (end < retstr->__end_cap_.__value_)
        {
          sub_F8FC((uint64_t)retstr->__end_, v46->n128_f64, &v68, (uint64_t)&v69);
          goto LABEL_94;
        }
        goto LABEL_95;
      case 0uLL:
        if (end >= retstr->__end_cap_.__value_)
        {
          end = (HDActivityCacheActiveSource *)sub_F3E4((uint64_t *)retstr, v46->n128_f64, &v46->n128_i64[1], (uint64_t)&v69);
        }
        else
        {
          sub_F504((uint64_t)end++, v46->n128_f64, &v46->n128_i64[1], (uint64_t)&v69);
          retstr->__end_ = end;
        }
        retstr->__end_ = end;
        uint64_t v68 = v46->n128_i64[1];
        break;
    }
    v46 = (__n128 *)((char *)v46 + 24);
  }
  while (v46 != v66);
  result = (vector<HDActivityCacheActiveSource, std::allocator<HDActivityCacheActiveSource>> *)v69;
  if (v69)
  {
    v70 = (char *)v69;
    operator delete(v69);
  }
  v46 = __p;
LABEL_101:
  if (v46) {
    operator delete(v46);
  }
  return result;
}

- (HDActivityCacheActiveSource)_baseActiveSource
{
  if (self)
  {
    int64_t baseSourceIdentifier = self->_baseSourceIdentifier;
    double v4 = -1.79769313e308;
  }
  else
  {
    int64_t baseSourceIdentifier = 0;
    double v4 = 0.0;
  }
  __p = 0;
  v7 = 0;
  uint64_t v8 = 0;
  HDActivityCacheActiveSource::HDActivityCacheActiveSource((uint64_t)retstr, baseSourceIdentifier, (uint64_t)&__p, v4);
  result = (HDActivityCacheActiveSource *)__p;
  if (__p)
  {
    v7 = __p;
    operator delete(__p);
  }
  return result;
}

- (void).cxx_destruct
{
  p_activationLogEntries = &self->_activationLogEntries;
  sub_F994((void ***)&p_activationLogEntries);
  begin = self->_workouts.__begin_;
  if (begin)
  {
    self->_workouts.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end