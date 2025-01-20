@interface GTBatchedCounterManager
+ (BOOL)isInitialized;
+ (id)semaphore;
+ (id)semaphoreRequests;
+ (void)initialize;
- (BOOL)_addBatchAtEncoderIndex:(unsigned int)a3 inEncoderArray:(id)a4;
- (BOOL)nextPerEncoderBatchListForHighPriorityBatches:(id)a3 withHighPriorityInfo:(id)a4;
- (GTBatchedCounterManager)initWithEncoderBatchPriorityList:(id)a3;
- (id).cxx_construct;
- (id)nextPerEncoderBatchList:(id)a3;
- (void)_clearData;
- (void)_initializeData:(id)a3;
- (void)cleanup;
- (void)pause;
- (void)resume;
@end

@implementation GTBatchedCounterManager

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

- (void).cxx_destruct
{
  p_highPriorityArray = &self->_highPriorityArray;
  begin = self->_highPriorityArray.__begin_;
  if (begin)
  {
    std::vector<std::pair<NSDictionary * {__strong},NSArray * {__strong}>>::__base_destruct_at_end[abi:nn180100]((uint64_t)&self->_highPriorityArray, (uint64_t)begin);
    operator delete(p_highPriorityArray->__begin_);
  }
  v5 = self->_perEncoderBatchQueue.__begin_;
  if (v5)
  {
    uint64_t end = (uint64_t)self->_perEncoderBatchQueue.__end_;
    v7 = self->_perEncoderBatchQueue.__begin_;
    if ((void *)end != v5)
    {
      do
        uint64_t end = std::deque<unsigned int>::~deque[abi:nn180100](end - 48);
      while ((void *)end != v5);
      v7 = self->_perEncoderBatchQueue.__begin_;
    }
    self->_perEncoderBatchQueue.__end_ = v5;
    operator delete(v7);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_batchToEncoderMap);
  v8 = self->_processedBatches.__begin_;
  if (v8)
  {
    uint64_t v9 = (uint64_t)self->_processedBatches.__end_;
    v10 = self->_processedBatches.__begin_;
    if ((void *)v9 != v8)
    {
      do
        uint64_t v9 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(v9 - 40);
      while ((void *)v9 != v8);
      v10 = self->_processedBatches.__begin_;
    }
    self->_processedBatches.__end_ = v8;
    operator delete(v10);
  }
}

- (void)resume
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_paused);
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&self->_paused);
    v3 = +[GTBatchedCounterManager semaphoreRequests];
    dispatch_semaphore_signal(v3);
  }
}

- (void)pause
{
}

- (BOOL)nextPerEncoderBatchListForHighPriorityBatches:(id)a3 withHighPriorityInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[GTBatchedCounterManager semaphore];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t end = (char *)self->_highPriorityArray.__end_;
  value = (char *)self->_highPriorityArray.__end_cap_.__value_;
  if (end < value)
  {
    *(void *)uint64_t end = v7;
    *((void *)end + 1) = v6;
    v11 = end + 16;
    goto LABEL_20;
  }
  begin = self->_highPriorityArray.__begin_;
  uint64_t v13 = (end - begin) >> 4;
  if ((unint64_t)(v13 + 1) >> 60) {
    abort();
  }
  uint64_t v14 = value - begin;
  uint64_t v15 = v14 >> 3;
  if (v14 >> 3 <= (unint64_t)(v13 + 1)) {
    uint64_t v15 = v13 + 1;
  }
  if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v16 = v15;
  }
  if (v16)
  {
    if (v16 >> 60) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    v17 = (char *)operator new(16 * v16);
  }
  else
  {
    v17 = 0;
  }
  v18 = &v17[16 * v13];
  v19 = &v17[16 * v16];
  *(void *)v18 = v7;
  *((void *)v18 + 1) = v6;
  v11 = v18 + 16;
  v20 = self->_highPriorityArray.__begin_;
  v21 = self->_highPriorityArray.__end_;
  if (v21 == v20)
  {
    self->_highPriorityArray.__begin_ = v18;
    self->_highPriorityArray.__end_ = v11;
    self->_highPriorityArray.__end_cap_.__value_ = v19;
    if (!v21) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  do
  {
    long long v22 = *((_OWORD *)v21 - 1);
    v21 -= 2;
    void *v21 = 0;
    v21[1] = 0;
    *((_OWORD *)v18 - 1) = v22;
    v18 -= 16;
  }
  while (v21 != v20);
  v23 = self->_highPriorityArray.__begin_;
  v21 = self->_highPriorityArray.__end_;
  self->_highPriorityArray.__begin_ = v18;
  self->_highPriorityArray.__end_ = v11;
  self->_highPriorityArray.__end_cap_.__value_ = v19;
  if (v21 != v23)
  {
    do
    {

      v24 = (void *)*(v21 - 2);
      v21 -= 2;
    }
    while (v21 != v23);
    v21 = v23;
  }
  if (v21) {
LABEL_19:
  }
    operator delete(v21);
LABEL_20:
  self->_highPriorityArray.__end_ = v11;
  v25 = +[GTBatchedCounterManager semaphore];
  dispatch_semaphore_signal(v25);

  v26 = +[GTBatchedCounterManager semaphoreRequests];
  dispatch_semaphore_signal(v26);

  return 1;
}

- (id)nextPerEncoderBatchList:(id)a3
{
  id v25 = a3;
  v4 = +[GTBatchedCounterManager semaphoreRequests];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if (+[GTBatchedCounterManager isInitialized])
  {
    v5 = +[GTBatchedCounterManager semaphore];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

    v27 = objc_opt_new();
    uint64_t end = (id *)self->_highPriorityArray.__end_;
    if (self->_highPriorityArray.__begin_ == end)
    {
      [v25 removeAllObjects];
      if (self->_perEncoderBatchQueue.__end_ == self->_perEncoderBatchQueue.__begin_)
      {
        int v17 = 0;
      }
      else
      {
        unint64_t v16 = 0;
        int v17 = 0;
        do
          v17 += [(GTBatchedCounterManager *)self _addBatchAtEncoderIndex:v16++ inEncoderArray:v27];
        while (v16 < 0xAAAAAAAAAAAAAAABLL
                    * (((char *)self->_perEncoderBatchQueue.__end_ - (char *)self->_perEncoderBatchQueue.__begin_) >> 4));
      }
      v19 = +[GTBatchedCounterManager semaphore];
      dispatch_semaphore_signal(v19);

      unsigned __int8 v20 = atomic_load((unsigned __int8 *)&self->_paused);
      if ((v20 & 1) == 0)
      {
        v21 = +[GTBatchedCounterManager semaphoreRequests];
        dispatch_semaphore_signal(v21);
      }
      if (v17) {
        id v15 = v27;
      }
      else {
        id v15 = 0;
      }
    }
    else
    {
      id v23 = *(end - 2);
      id v7 = *(end - 1);
      std::vector<std::pair<NSDictionary * {__strong},NSArray * {__strong}>>::__base_destruct_at_end[abi:nn180100]((uint64_t)&self->_highPriorityArray, (uint64_t)self->_highPriorityArray.__end_ - 16);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obj = v7;
      id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = 0;
        uint64_t v10 = *(void *)v29;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(id *)(*((void *)&v28 + 1) + 8 * i);
            id v13 = [v12 unsignedIntValue];
            if (v13 == -1
              || std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((void *)self->_processedBatches.__begin_ + 5 * (v9 + i), v13))
            {
              -[GTBatchedCounterManager _addBatchAtEncoderIndex:inEncoderArray:](self, "_addBatchAtEncoderIndex:inEncoderArray:", (char *)i + v9, v27, v23);
            }
            else
            {
              uint64_t v14 = +[NSNumber numberWithUnsignedInt:v13];
              [v27 addObject:v14];

              std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)self->_processedBatches.__begin_ + 40 * (v9 + i), v13, (int)v13);
            }
          }
          id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
          uint64_t v9 = (v9 + i);
        }
        while (v8);
      }

      if ([v27 count])
      {
        id v15 = v27;
        [v25 setDictionary:v23];
      }
      else
      {
        id v15 = 0;
      }
      v18 = +[GTBatchedCounterManager semaphore];
      dispatch_semaphore_signal(v18);
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)_addBatchAtEncoderIndex:(unsigned int)a3 inEncoderArray:(id)a4
{
  id v6 = a4;
  begin = (char *)self->_perEncoderBatchQueue.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_perEncoderBatchQueue.__end_ - (char *)begin) >> 4) <= a3) {
    goto LABEL_7;
  }
  unsigned int v8 = a3;
  uint64_t v9 = (int64x2_t *)&begin[48 * a3];
  if (!v9[2].i64[1])
  {
LABEL_6:
    [v6 addObject:&off_759990];
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  long long v17 = xmmword_4C7D20;
  while (1)
  {
    uint64_t v10 = ((unint64_t)v9[2].i64[0] >> 7) & 0x1FFFFFFFFFFFFF8;
    uint64_t v11 = v9[2].i64[0] & 0x3FF;
    uint64_t v12 = *(unsigned int *)(*(void *)(v9->i64[1] + v10) + 4 * v11);
    if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((void *)self->_processedBatches.__begin_ + 5 * v8, *(_DWORD *)(*(void *)(v9->i64[1] + v10) + 4 * v11)))break; {
    v9[2] = vaddq_s64(v9[2], (int64x2_t)xmmword_4C7D20);
    }
    std::deque<unsigned int>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v9);
    if (!v9[2].i64[1]) {
      goto LABEL_6;
    }
  }
  id v15 = +[NSNumber numberWithUnsignedInt:v12];
  [v6 addObject:v15];

  unsigned int v16 = *(_DWORD *)(*(void *)(v9->i64[1] + (((unint64_t)v9[2].i64[0] >> 7) & 0x1FFFFFFFFFFFFF8))
                  + 4 * (v9[2].i64[0] & 0x3FF));
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)self->_processedBatches.__begin_ + 40 * v8, v16, v16);
  v9[2] = vaddq_s64(v9[2], (int64x2_t)xmmword_4C7D20);
  std::deque<unsigned int>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v9);
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (void)_initializeData:(id)a3
{
  id v111 = a3;
  unint64_t value = self->_batchToEncoderMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value) {
    float v5 = (float)self->_batchToEncoderMap.__table_.__p2_.__value_ / (float)value;
  }
  else {
    float v5 = 0.0;
  }
  self->_batchToEncoderMap.__table_.__p3_.__value_ = fmaxf(v5, 0.4);
  p_batchToEncoderMap = &self->_batchToEncoderMap;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&self->_batchToEncoderMap, vcvtps_u32_f32((float)(unint64_t)((void)objc_msgSend(v111, "count", v111) << 8)/ self->_batchToEncoderMap.__table_.__p3_.__value_));
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id obj = v112;
  id v116 = [obj countByEnumeratingWithState:&v131 objects:v137 count:16];
  if (v116)
  {
    unsigned int v7 = 0;
    int v8 = 0;
    uint64_t v115 = *(void *)v132;
    v114 = self;
    v118 = &self->_batchToEncoderMap;
    do
    {
      v117 = 0;
      do
      {
        if (*(void *)v132 != v115) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v131 + 1) + 8 * (void)v117);
        long long v129 = 0u;
        long long v130 = 0u;
        long long v128 = 0u;
        uint64_t end = (char *)self->_perEncoderBatchQueue.__end_;
        uint64_t v10 = (char *)self->_perEncoderBatchQueue.__end_cap_.__value_;
        if (end >= v10)
        {
          begin = (char *)self->_perEncoderBatchQueue.__begin_;
          unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 4) + 1;
          if (v14 > 0x555555555555555) {
            abort();
          }
          unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v10 - begin) >> 4);
          if (2 * v15 > v14) {
            unint64_t v14 = 2 * v15;
          }
          if (v15 >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v16 = 0x555555555555555;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16)
          {
            if (v16 > 0x555555555555555) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            long long v17 = (char *)operator new(48 * v16);
          }
          else
          {
            long long v17 = 0;
          }
          v18 = &v17[16 * ((end - begin) >> 4)];
          *(_OWORD *)v18 = 0u;
          *((_OWORD *)v18 + 1) = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          v19 = &v17[48 * v16];
          *((void *)v18 + 4) = 0;
          *((void *)v18 + 5) = 0;
          long long v130 = 0uLL;
          uint64_t v12 = v18 + 48;
          if (end == begin)
          {
            self->_perEncoderBatchQueue.__begin_ = v18;
            self->_perEncoderBatchQueue.__end_ = v12;
            self->_perEncoderBatchQueue.__end_cap_.__value_ = v19;
          }
          else
          {
            uint64_t v20 = 0;
            do
            {
              v21 = &v18[v20];
              long long v22 = &end[v20];
              *((void *)v21 - 6) = *(void *)&end[v20 - 48];
              *((void *)v21 - 5) = *(void *)&end[v20 - 40];
              *((void *)v21 - 4) = *(void *)&end[v20 - 32];
              *((void *)v21 - 3) = *(void *)&end[v20 - 24];
              *((_OWORD *)v22 - 3) = 0uLL;
              *((_OWORD *)v22 - 2) = 0uLL;
              *((void *)v21 - 2) = *(void *)&end[v20 - 16];
              *((void *)v21 - 1) = *(void *)&end[v20 - 8];
              *((void *)v22 - 2) = 0;
              *((void *)v22 - 1) = 0;
              v20 -= 48;
            }
            while (&end[v20] != begin);
            uint64_t end = (char *)self->_perEncoderBatchQueue.__begin_;
            uint64_t v23 = (uint64_t)self->_perEncoderBatchQueue.__end_;
            self->_perEncoderBatchQueue.__begin_ = &v18[v20];
            self->_perEncoderBatchQueue.__end_ = v12;
            self->_perEncoderBatchQueue.__end_cap_.__value_ = v19;
            while ((char *)v23 != end)
              uint64_t v23 = std::deque<unsigned int>::~deque[abi:nn180100](v23 - 48);
          }
          if (end) {
            operator delete(end);
          }
        }
        else
        {
          *(void *)uint64_t end = 0;
          *((void *)end + 1) = *((void *)&v128 + 1);
          *((_OWORD *)end + 1) = v129;
          long long v128 = 0uLL;
          long long v129 = 0uLL;
          *((_OWORD *)end + 2) = v130;
          long long v130 = 0uLL;
          uint64_t v12 = end + 48;
        }
        self->_perEncoderBatchQueue.__end_ = v12;
        std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)&v128);
        long long v128 = 0u;
        long long v129 = 0u;
        LODWORD(v130) = 1065353216;
        id v24 = self->_processedBatches.__end_;
        id v25 = self->_processedBatches.__end_cap_.__value_;
        if (v24 < v25)
        {
          v26 = (void *)(std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)v24, (uint64_t *)&v128)+ 40);
          self->_processedBatches.__end_ = v26;
          goto LABEL_49;
        }
        v27 = self->_processedBatches.__begin_;
        unint64_t v28 = 0xCCCCCCCCCCCCCCCDLL * ((v24 - v27) >> 3);
        unint64_t v29 = v28 + 1;
        if (v28 + 1 > 0x666666666666666) {
          abort();
        }
        unint64_t v30 = 0xCCCCCCCCCCCCCCCDLL * ((v25 - v27) >> 3);
        if (2 * v30 > v29) {
          unint64_t v29 = 2 * v30;
        }
        if (v30 >= 0x333333333333333) {
          unint64_t v31 = 0x666666666666666;
        }
        else {
          unint64_t v31 = v29;
        }
        if (v31)
        {
          if (v31 > 0x666666666666666) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v32 = (char *)operator new(40 * v31);
        }
        else
        {
          v32 = 0;
        }
        v33 = &v32[40 * v31];
        v34 = (char *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)&v32[40 * v28], (uint64_t *)&v128);
        v26 = v34 + 40;
        v36 = (uint64_t *)self->_processedBatches.__begin_;
        v35 = (uint64_t *)self->_processedBatches.__end_;
        if (v35 == v36)
        {
          self->_processedBatches.__begin_ = v34;
          self->_processedBatches.__end_ = v26;
          self->_processedBatches.__end_cap_.__value_ = v33;
          if (v35) {
            goto LABEL_48;
          }
        }
        else
        {
          do
          {
            v35 -= 5;
            v34 = (char *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)(v34 - 40), v35);
          }
          while (v35 != v36);
          v37 = (uint64_t *)self->_processedBatches.__begin_;
          v35 = (uint64_t *)self->_processedBatches.__end_;
          self->_processedBatches.__begin_ = v34;
          self->_processedBatches.__end_ = v26;
          self->_processedBatches.__end_cap_.__value_ = v33;
          if (v35 != v37)
          {
            do
            {
              v35 -= 5;
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v35);
            }
            while (v35 != v37);
            v35 = v37;
          }
          if (v35) {
LABEL_48:
          }
            operator delete(v35);
        }
LABEL_49:
        self->_processedBatches.__end_ = v26;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v128);
        v38 = (float *)self->_processedBatches.__end_;
        unint64_t v39 = *((void *)v38 - 4);
        if (v39) {
          float v40 = (float)*((unint64_t *)v38 - 2) / (float)v39;
        }
        else {
          float v40 = 0.0;
        }
        *(v38 - 2) = fmaxf(v40, 0.4);
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)(v38 - 10), vcvtps_u32_f32((float)(unint64_t)[v9 count] / *(v38 - 2)));
        v41 = self->_perEncoderBatchQueue.__end_;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        id v42 = v9;
        id v43 = [v42 countByEnumeratingWithState:&v124 objects:v136 count:16];
        if (v43)
        {
          v44 = v41 - 6;
          id v120 = v42;
          uint64_t v121 = *(void *)v125;
          v45 = (char **)(v41 - 3);
          int v119 = v8;
          do
          {
            v46 = 0;
            id v122 = v43;
            do
            {
              if (*(void *)v125 != v121) {
                objc_enumerationMutation(v42);
              }
              unsigned int v123 = v7;
              unsigned int v47 = [*(id *)(*((void *)&v124 + 1) + 8 * (void)v46) unsignedIntValue];
              v48 = (char *)*(v41 - 4);
              v49 = (char *)*(v41 - 5);
              if (v48 == v49) {
                uint64_t v50 = 0;
              }
              else {
                uint64_t v50 = ((v48 - v49) << 7) - 1;
              }
              unint64_t v52 = *(v41 - 2);
              uint64_t v51 = *(v41 - 1);
              unint64_t v53 = v51 + v52;
              if (v50 == v51 + v52)
              {
                if (v52 >= 0x400)
                {
                  *(v41 - 2) = v52 - 1024;
                  uint64_t v56 = *(void *)v49;
                  v54 = v49 + 8;
                  uint64_t v55 = v56;
                  *(v41 - 5) = v54;
                  v57 = (char *)*(v41 - 4);
                  if (v57 == (char *)*(v41 - 3))
                  {
                    uint64_t v58 = (uint64_t)&v54[-*v44];
                    if ((unint64_t)v54 > *v44) {
                      goto LABEL_64;
                    }
                    if (v57 == (char *)*v44) {
                      unint64_t v91 = 1;
                    }
                    else {
                      unint64_t v91 = (uint64_t)&v57[-*v44] >> 2;
                    }
                    v92 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v91);
                    v94 = &v92[8 * (v91 >> 2)];
                    v95 = (uint64_t *)*(v41 - 5);
                    v57 = v94;
                    uint64_t v96 = *(v41 - 4) - (void)v95;
                    if (v96)
                    {
                      v57 = &v94[v96 & 0xFFFFFFFFFFFFFFF8];
                      uint64_t v97 = 8 * (v96 >> 3);
                      v98 = &v92[8 * (v91 >> 2)];
                      do
                      {
                        uint64_t v99 = *v95++;
                        *(void *)v98 = v99;
                        v98 += 8;
                        v97 -= 8;
                      }
                      while (v97);
                    }
LABEL_104:
                    v100 = (void *)*(v41 - 6);
                    *(v41 - 6) = v92;
                    *(v41 - 5) = v94;
                    *(v41 - 4) = v57;
                    *(v41 - 3) = &v92[8 * v93];
                    if (v100)
                    {
                      operator delete(v100);
                      v57 = (char *)*(v41 - 4);
                    }
                  }
                  goto LABEL_107;
                }
                unint64_t v65 = (v48 - v49) >> 3;
                v66 = *v45;
                uint64_t v67 = (uint64_t)&(*v45)[-*v44];
                if (v65 >= v67 >> 3)
                {
                  if (v66 == (char *)*v44) {
                    unint64_t v68 = 1;
                  }
                  else {
                    unint64_t v68 = v67 >> 2;
                  }
                  *(void *)&long long v130 = v41 - 3;
                  *(void *)&long long v128 = std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v68);
                  *((void *)&v128 + 1) = v128 + 8 * v65;
                  *(void *)&long long v129 = *((void *)&v128 + 1);
                  *((void *)&v129 + 1) = v128 + 8 * v69;
                  v135 = operator new(0x1000uLL);
                  std::__split_buffer<GTMMappedBuffer::UsedBlock *>::push_back(&v128, &v135);
                  uint64_t v70 = *(v41 - 4);
                  v71 = (char *)*((void *)&v128 + 1);
                  v72 = (char *)v128;
                  v74 = (char *)*((void *)&v129 + 1);
                  v73 = (char *)v129;
                  while (v70 != *(v41 - 5))
                  {
                    if (v71 == v72)
                    {
                      if (v73 >= v74)
                      {
                        if (v74 == v72) {
                          unint64_t v80 = 1;
                        }
                        else {
                          unint64_t v80 = (v74 - v72) >> 2;
                        }
                        v81 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v80);
                        v83 = v81;
                        v71 = &v81[(2 * v80 + 6) & 0xFFFFFFFFFFFFFFF8];
                        uint64_t v84 = v73 - v72;
                        BOOL v78 = v73 == v72;
                        v73 = v71;
                        if (!v78)
                        {
                          v73 = &v71[v84 & 0xFFFFFFFFFFFFFFF8];
                          uint64_t v85 = 8 * (v84 >> 3);
                          v86 = v71;
                          v87 = v72;
                          do
                          {
                            uint64_t v88 = *(void *)v87;
                            v87 += 8;
                            *(void *)v86 = v88;
                            v86 += 8;
                            v85 -= 8;
                          }
                          while (v85);
                        }
                        v74 = &v81[8 * v82];
                        if (v72) {
                          operator delete(v72);
                        }
                        v72 = v83;
                      }
                      else
                      {
                        uint64_t v75 = (v74 - v73) >> 3;
                        if (v75 >= -1) {
                          unint64_t v76 = v75 + 1;
                        }
                        else {
                          unint64_t v76 = v75 + 2;
                        }
                        v77 = &v73[8 * (v76 >> 1)];
                        v71 = &v77[-(v73 - v72)];
                        size_t v79 = v73 - v72;
                        BOOL v78 = v73 == v72;
                        v73 = v77;
                        if (!v78) {
                          memmove(v71, v72, v79);
                        }
                      }
                    }
                    uint64_t v89 = *(void *)(v70 - 8);
                    v70 -= 8;
                    *((void *)v71 - 1) = v89;
                    v71 -= 8;
                  }
                  *(void *)&long long v128 = v72;
                  *((void *)&v128 + 1) = v71;
                  *(void *)&long long v129 = v73;
                  *((void *)&v129 + 1) = v74;
                  v90 = (void *)*(v41 - 6);
                  *((_OWORD *)v41 - 3) = v128;
                  *((_OWORD *)v41 - 2) = v129;
                  if (v90) {
                    operator delete(v90);
                  }
                  p_batchToEncoderMap = v118;
                  int v8 = v119;
                  v44 = v41 - 6;
                  id v42 = v120;
                }
                else if (v66 == v48)
                {
                  *(void *)&long long v128 = operator new(0x1000uLL);
                  std::__split_buffer<GTMMappedBuffer::UsedBlock *>::push_front((uint64_t)v44, &v128);
                  v101 = (void *)*(v41 - 5);
                  v57 = (char *)*(v41 - 4);
                  uint64_t v102 = *v101;
                  v54 = (char *)(v101 + 1);
                  uint64_t v55 = v102;
                  *(v41 - 5) = v54;
                  if (v57 == (char *)*(v41 - 3))
                  {
                    uint64_t v58 = (uint64_t)&v54[-*v44];
                    if ((unint64_t)v54 <= *v44)
                    {
                      if (v57 == (char *)*v44) {
                        unint64_t v103 = 1;
                      }
                      else {
                        unint64_t v103 = (uint64_t)&v57[-*v44] >> 2;
                      }
                      v92 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v103);
                      v94 = &v92[8 * (v103 >> 2)];
                      v104 = (uint64_t *)*(v41 - 5);
                      v57 = v94;
                      uint64_t v105 = *(v41 - 4) - (void)v104;
                      if (v105)
                      {
                        v57 = &v94[v105 & 0xFFFFFFFFFFFFFFF8];
                        uint64_t v106 = 8 * (v105 >> 3);
                        v107 = &v92[8 * (v103 >> 2)];
                        do
                        {
                          uint64_t v108 = *v104++;
                          *(void *)v107 = v108;
                          v107 += 8;
                          v106 -= 8;
                        }
                        while (v106);
                      }
                      goto LABEL_104;
                    }
LABEL_64:
                    uint64_t v59 = v58 >> 3;
                    BOOL v60 = v58 >> 3 < -1;
                    uint64_t v61 = (v58 >> 3) + 2;
                    if (v60) {
                      uint64_t v62 = v61;
                    }
                    else {
                      uint64_t v62 = v59 + 1;
                    }
                    v63 = &v54[-8 * (v62 >> 1)];
                    int64_t v64 = v57 - v54;
                    if (v57 != v54)
                    {
                      memmove(&v54[-8 * (v62 >> 1)], v54, v57 - v54);
                      v54 = (char *)*(v41 - 5);
                    }
                    v57 = &v63[v64];
                    *(v41 - 5) = &v54[-8 * (v62 >> 1)];
                    *(v41 - 4) = &v63[v64];
                    v44 = v41 - 6;
                    id v42 = v120;
                  }
LABEL_107:
                  *(void *)v57 = v55;
                  *(v41 - 4) += 8;
                }
                else
                {
                  *(void *)&long long v128 = operator new(0x1000uLL);
                  std::__split_buffer<GTMMappedBuffer::UsedBlock *>::push_back(v44, &v128);
                }
                v49 = (char *)*(v41 - 5);
                uint64_t v51 = *(v41 - 1);
                unint64_t v53 = *(v41 - 2) + v51;
              }
              *(_DWORD *)(*(void *)&v49[(v53 >> 7) & 0x1FFFFFFFFFFFFF8] + 4 * (v53 & 0x3FF)) = v47;
              *(v41 - 1) = v51 + 1;
              LODWORD(v128) = v123;
              unsigned int v7 = v123 + 1;
              *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)p_batchToEncoderMap, v123, &v128)+ 5) = v8;
              v46 = (char *)v46 + 1;
            }
            while (v46 != v122);
            id v109 = [v42 countByEnumeratingWithState:&v124 objects:v136 count:16];
            id v43 = v109;
          }
          while (v109);
        }

        ++v8;
        v117 = (char *)v117 + 1;
        self = v114;
      }
      while (v117 != v116);
      id v110 = [obj countByEnumeratingWithState:&v131 objects:v137 count:16];
      id v116 = v110;
    }
    while (v110);
  }

  gInitialized = 1;
}

- (void)_clearData
{
  uint64_t end = (uint64_t)self->_processedBatches.__end_;
  begin = self->_processedBatches.__begin_;
  while ((void *)end != begin)
    uint64_t end = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(end - 40);
  self->_processedBatches.__end_ = begin;
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(&self->_batchToEncoderMap.__table_.__bucket_list_.__ptr_.__value_);
  id v6 = self->_perEncoderBatchQueue.__begin_;
  for (uint64_t i = (uint64_t)self->_perEncoderBatchQueue.__end_;
        (void *)i != v6;
  self->_perEncoderBatchQueue.__end_ = v6;
}

- (void)cleanup
{
  gInitialized = 0;
  [(GTBatchedCounterManager *)self _clearData];
  unsigned __int8 v2 = +[GTBatchedCounterManager semaphore];
  dispatch_semaphore_signal(v2);

  v3 = +[GTBatchedCounterManager semaphoreRequests];
  dispatch_semaphore_signal(v3);
}

- (GTBatchedCounterManager)initWithEncoderBatchPriorityList:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTBatchedCounterManager;
  float v5 = [(GTBatchedCounterManager *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(GTBatchedCounterManager *)v5 _initializeData:v4];
    atomic_store(1u, (unsigned __int8 *)&v6->_paused);
  }

  return v6;
}

+ (BOOL)isInitialized
{
  return gInitialized;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(1);
    float v5 = (void *)gSemaphore;
    gSemaphore = (uint64_t)v4;

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    unsigned int v7 = (void *)gSemaphoreRequests;
    gSemaphoreRequests = (uint64_t)v6;
  }
}

+ (id)semaphoreRequests
{
  return (id)gSemaphoreRequests;
}

+ (id)semaphore
{
  return (id)gSemaphore;
}

@end