@interface GradientBuffer
+ (void)initialize;
- (GradientBuffer)initWithTensorBefore:(id)a3 tensorAfter:(id)a4 withScale:(float)a5 shouldSparsify:(BOOL)a6 error:(id *)a7;
- (float)l2norm;
- (id).cxx_construct;
- (id)description;
- (unint64_t)size;
- (void)accumulateDifferenceBetweenTensorBefore:(id)a3 andTensorAfter:(id)a4 withScale:(float)a5 error:(id *)a6;
- (void)applyToTensor:(id)a3 scale:(float)a4 error:(id *)a5;
- (void)multiply:(float)a3;
- (void)reset;
@end

@implementation GradientBuffer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "GradientBuffer");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;
  }
}

- (GradientBuffer)initWithTensorBefore:(id)a3 tensorAfter:(id)a4 withScale:(float)a5 shouldSparsify:(BOOL)a6 error:(id *)a7
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v52 = a4;
  v58.receiver = self;
  v58.super_class = (Class)GradientBuffer;
  v13 = [(GradientBuffer *)&v58 init];
  if (!v13)
  {
LABEL_33:
    v40 = v13;
    v15 = v52;
    goto LABEL_37;
  }
  v14 = [v12 shape];
  v15 = v52;
  v16 = [v52 shape];
  char v17 = [v14 isEqual:v16];

  if (v17)
  {
    v13->_isSparse = a6;
    v13->_size = 1;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v18 = [v12 shape];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v55 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(id *)(*((void *)&v54 + 1) + 8 * i);
          v13->_size *= (int)[v22 intValue];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v19);
    }

    uint64_t v23 = [v12 dataPointer];
    uint64_t v24 = [v52 dataPointer];
    if (v13->_size)
    {
      uint64_t v25 = v24;
      unint64_t v26 = 0;
      p_begin = (void **)&v13->_data.__begin_;
      do
      {
        float v28 = (float)(*(float *)(v25 + 4 * v26) - *(float *)(v23 + 4 * v26)) * a5;
        if (v13->_isSparse)
        {
          if (v28 != 0.0)
          {
            int v53 = v26;
            v59 = &v53;
            *((float *)std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int &&>,std::tuple<>>((uint64_t)&v13->_sparseData, &v53, (uint64_t)&std::piecewise_construct, &v59)+ 5) = v28;
          }
        }
        else
        {
          end = v13->_data.__end_;
          value = v13->_data.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (float *)*p_begin;
            uint64_t v33 = ((char *)end - (unsigned char *)*p_begin) >> 2;
            unint64_t v34 = v33 + 1;
            if ((unint64_t)(v33 + 1) >> 62) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v35 = (char *)value - (char *)begin;
            if (v35 >> 1 > v34) {
              unint64_t v34 = v35 >> 1;
            }
            if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v36 = v34;
            }
            if (v36)
            {
              v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v13->_data.__end_cap_, v36);
              begin = v13->_data.__begin_;
              end = v13->_data.__end_;
            }
            else
            {
              v37 = 0;
            }
            v38 = (float *)&v37[4 * v33];
            float *v38 = v28;
            v31 = v38 + 1;
            while (end != begin)
            {
              int v39 = *((_DWORD *)end-- - 1);
              *((_DWORD *)v38-- - 1) = v39;
            }
            v13->_data.__begin_ = v38;
            v13->_data.__end_ = v31;
            v13->_data.__end_cap_.__value_ = (float *)&v37[4 * v36];
            if (begin) {
              operator delete(begin);
            }
          }
          else
          {
            float *end = v28;
            v31 = end + 1;
          }
          v13->_data.__end_ = v31;
        }
        ++v26;
      }
      while (v26 < v13->_size);
    }
    goto LABEL_33;
  }
  v41 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
    -[GradientBuffer initWithTensorBefore:tensorAfter:withScale:shouldSparsify:error:](v41, v42, v43, v44, v45, v46, v47, v48);
  }
  v49 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v61 = *MEMORY[0x1E4F28568];
  v62[0] = @"unable to compute difference between two tensors of different shapes";
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
  *a7 = [v49 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:1 userInfo:v50];

  v40 = 0;
LABEL_37:

  return v40;
}

- (void)accumulateDifferenceBetweenTensorBefore:(id)a3 andTensorAfter:(id)a4 withScale:(float)a5 error:(id *)a6
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 shape];
  id v12 = [v10 shape];
  char v13 = [v11 isEqual:v12];

  if ((v13 & 1) == 0)
  {
    v21 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[GradientBuffer initWithTensorBefore:tensorAfter:withScale:shouldSparsify:error:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v59 = *MEMORY[0x1E4F28568];
    v60[0] = @"unable to compute difference between two tensors of different shapes";
    v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1, a6);
    v31 = [v29 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v30];
    goto LABEL_30;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v14 = [v9 shape];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v52;
    uint64_t v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(id *)(*((void *)&v51 + 1) + 8 * i);
        int v20 = [v19 intValue];

        v17 *= v20;
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v17 = 1;
  }

  if (v17 != self->_size)
  {
    int v39 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[GradientBuffer accumulateDifferenceBetweenTensorBefore:andTensorAfter:withScale:error:](v39, v40, v41, v42, v43, v44, v45, v46);
    }
    uint64_t v47 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    long long v57 = @"unable to accumulate difference of mismatch size";
    v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1, a6);
    v31 = [v47 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v30];
LABEL_30:
    void *v49 = v31;

    goto LABEL_31;
  }
  uint64_t v32 = objc_msgSend(v9, "dataPointer", a6);
  uint64_t v33 = [v10 dataPointer];
  unint64_t size = self->_size;
  if (size)
  {
    uint64_t v35 = v33;
    for (unint64_t j = 0; j < size; ++j)
    {
      float v37 = (float)(*(float *)(v35 + 4 * j) - *(float *)(v32 + 4 * j)) * a5;
      if (self->_isSparse)
      {
        if (v37 != 0.0)
        {
          int v50 = j;
          v38 = std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_, &v50);
          if (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_, &v50)&& (float v37 = v37 + *((float *)v38 + 5), v37 == 0.0))
          {
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::erase(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_, v38);
          }
          else
          {
            long long v55 = &v50;
            *((float *)std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int &&>,std::tuple<>>((uint64_t)&self->_sparseData, &v50, (uint64_t)&std::piecewise_construct, &v55)+ 5) = v37;
          }
          unint64_t size = self->_size;
        }
      }
      else
      {
        self->_data.__begin_[j] = v37 + self->_data.__begin_[j];
      }
    }
  }
LABEL_31:
}

- (void)applyToTensor:(id)a3 scale:(float)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = objc_msgSend(v8, "shape", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v42;
    uint64_t v12 = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v41 + 1) + 8 * i);
        int v15 = [v14 intValue];

        v12 *= v15;
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v12 = 1;
  }

  if (v12 != self->_size)
  {
    uint64_t v25 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[GradientBuffer applyToTensor:scale:error:](v25, v26, v27, v28, v29, v30, v31, v32);
    }
    uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    int v50 = @"Unable to apply gradient to mismatch tensor";
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    uint64_t v24 = [v33 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:1 userInfo:v23];
LABEL_21:
    *a5 = v24;

    goto LABEL_22;
  }
  uint64_t v16 = [v8 dataPointer];
  uint64_t v17 = (float *)v16;
  if (!self->_isSparse)
  {
    begin = self->_data.__begin_;
    uint64_t v35 = (char *)self->_data.__end_ - (char *)begin;
    if (!v35) {
      goto LABEL_22;
    }
    uint64_t v36 = 0;
    unint64_t v37 = v35 >> 2;
    if (v37 <= 1) {
      unint64_t v37 = 1;
    }
    while (1)
    {
      float v38 = *v17 + (float)(begin[v36] * a4);
      *uint64_t v17 = v38;
      if ((LODWORD(v38) & 0x7FFFFFFFu) >= 0x7F800000) {
        break;
      }
      ++v36;
      ++v17;
      if (v37 == v36) {
        goto LABEL_22;
      }
    }
    int v39 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[GradientBuffer applyToTensor:scale:error:](v36, v17, v39);
    }
    uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    uint64_t v46 = @"inf/nan found during accumulation";
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    uint64_t v24 = [v40 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:1 userInfo:v23];
    goto LABEL_21;
  }
  p_p1 = &self->_sparseData.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, float>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, float>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    uint64_t next_low = SLODWORD(p_p1[2].__value_.__next_);
    float v20 = *(float *)(v16 + 4 * next_low) + (float)(*((float *)&p_p1[2].__value_.__next_ + 1) * a4);
    *(float *)(v16 + 4 * next_low) = v20;
    if ((LODWORD(v20) & 0x7FFFFFFFu) >= 0x7F800000)
    {
      v21 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
        -[GradientBuffer applyToTensor:scale:error:](&v17[next_low], next_low, v21);
      }
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      uint64_t v48 = @"inf/nan found during accumulation";
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      uint64_t v24 = [v22 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:1 userInfo:v23];
      goto LABEL_21;
    }
  }
LABEL_22:
}

- (void)reset
{
  if (self->_isSparse)
  {
    std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::clear(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_);
  }
  else
  {
    p_data = &self->_data;
    begin = self->_data.__begin_;
    uint64_t v4 = (char *)p_data->__end_ - (char *)begin;
    if (v4)
    {
      unint64_t v5 = v4 >> 2;
      if (v5 <= 1) {
        unint64_t v5 = 1;
      }
      bzero(begin, 4 * v5);
    }
  }
}

- (float)l2norm
{
  if (self->_isSparse)
  {
    next = (float *)self->_sparseData.__table_.__p1_.__value_.__next_;
    if (next)
    {
      float v3 = 0.0;
      do
      {
        float v3 = v3 + (float)(next[5] * next[5]);
        next = *(float **)next;
      }
      while (next);
      return sqrtf(v3);
    }
LABEL_12:
    float v3 = 0.0;
    return sqrtf(v3);
  }
  begin = self->_data.__begin_;
  uint64_t v5 = (char *)self->_data.__end_ - (char *)begin;
  if (!v5) {
    goto LABEL_12;
  }
  unint64_t v6 = v5 >> 2;
  if (v6 <= 1) {
    unint64_t v6 = 1;
  }
  float v3 = 0.0;
  do
  {
    float v7 = *begin++;
    float v3 = v3 + (float)(v7 * v7);
    --v6;
  }
  while (v6);
  return sqrtf(v3);
}

- (void)multiply:(float)a3
{
  if (self->_isSparse)
  {
    for (uint64_t i = (float *)self->_sparseData.__table_.__p1_.__value_.__next_; i; uint64_t i = *(float **)i)
      i[5] = i[5] * a3;
  }
  else
  {
    begin = self->_data.__begin_;
    uint64_t v5 = (char *)self->_data.__end_ - (char *)begin;
    if (v5)
    {
      unint64_t v6 = v5 >> 2;
      if (v6 <= 1) {
        unint64_t v6 = 1;
      }
      do
      {
        float *begin = *begin * a3;
        ++begin;
        --v6;
      }
      while (v6);
    }
  }
}

- (id)description
{
  if (self->_isSparse) {
    objc_msgSend(NSString, "stringWithFormat:", @"sparse gradient of size %lu with %lu non-zero values", self->_size, self->_sparseData.__table_.__p2_.__value_);
  }
  else {
  os_log_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"dense gradient with %lu values", self->_size, v4);
  }
  return v2;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&self->_sparseData);
  begin = self->_data.__begin_;
  if (begin)
  {
    self->_data.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

- (void)initWithTensorBefore:(uint64_t)a3 tensorAfter:(uint64_t)a4 withScale:(uint64_t)a5 shouldSparsify:(uint64_t)a6 error:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)accumulateDifferenceBetweenTensorBefore:(uint64_t)a3 andTensorAfter:(uint64_t)a4 withScale:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyToTensor:(uint64_t)a1 scale:(float *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, float *a2, NSObject *a3)
{
  LOWORD(v3) = 2048;
  *(double *)((char *)&v3 + 2) = *a2;
  OUTLINED_FUNCTION_1_1(&dword_1B1A86000, (uint64_t)a2, a3, "ptr[%d] == %f", 67109376, *(double *)&v3);
}

- (void)applyToTensor:(float *)a1 scale:(uint64_t)a2 error:(NSObject *)a3 .cold.2(float *a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 2048;
  *(double *)((char *)&v3 + 2) = *a1;
  OUTLINED_FUNCTION_1_1(&dword_1B1A86000, a2, a3, "ptr[%d] == %f", 67109376, *(double *)&v3);
}

- (void)applyToTensor:(uint64_t)a3 scale:(uint64_t)a4 error:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end