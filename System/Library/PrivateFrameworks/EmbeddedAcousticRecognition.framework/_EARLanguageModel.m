@interface _EARLanguageModel
- (float)totalWeight;
- (id).cxx_construct;
- (void)addDataSource:(id)a3 weight:(float)a4;
- (void)enumerateDataSourcesAndWeightsUsingBlock:(id)a3;
@end

@implementation _EARLanguageModel

- (void)addDataSource:(id)a3 weight:(float)a4
{
  id v6 = a3;
  if (a4 < 0.0 || a4 > 1.0) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"weight must be between 0 and 1 inclusive (weight=%f)", a4);
  }
  float totalWeight = self->_totalWeight;
  if ((float)(totalWeight + a4) > 1.0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"total weight must be between 0 and 1 inclusive (weight=%f, current total weight=%f)", a4, totalWeight format];
  }
  id v9 = v6;
  value = (float *)self->_dataSources.__end_cap_.__value_;
  end = (float *)self->_dataSources.__end_;
  if (end >= value)
  {
    begin = self->_dataSources.__begin_;
    uint64_t v14 = ((char *)end - begin) >> 4;
    if ((unint64_t)(v14 + 1) >> 60) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = (char *)value - begin;
    unint64_t v16 = ((char *)value - begin) >> 3;
    if (v16 <= v14 + 1) {
      unint64_t v16 = v14 + 1;
    }
    if (v15 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v16;
    }
    v27[4] = &self->_dataSources.__end_cap_;
    v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,unsigned long>>>((uint64_t)&self->_dataSources.__end_cap_, v17);
    v20 = (float *)&v18[16 * v14];
    *(void *)v20 = v9;
    v20[2] = a4;
    v22 = (char *)self->_dataSources.__begin_;
    v21 = (char *)self->_dataSources.__end_;
    v23 = v20;
    if (v21 != v22)
    {
      v24 = (char *)self->_dataSources.__end_;
      do
      {
        uint64_t v25 = *((void *)v24 - 2);
        v24 -= 16;
        *(void *)v24 = 0;
        *((void *)v23 - 2) = v25;
        v23 -= 4;
        v23[2] = *((float *)v24 + 2);
      }
      while (v24 != v22);
    }
    v12 = v20 + 4;
    self->_dataSources.__begin_ = v23;
    self->_dataSources.__end_ = v20 + 4;
    v26 = self->_dataSources.__end_cap_.__value_;
    self->_dataSources.__end_cap_.__value_ = &v18[16 * v19];
    v27[2] = v21;
    v27[3] = v26;
    v27[0] = v22;
    v27[1] = v22;
    std::__split_buffer<std::pair<objc_object  {objcproto27_EARLanguageModelDataSource}* {__strong},float>>::~__split_buffer((uint64_t)v27);
  }
  else
  {
    *(void *)end = v9;
    end[2] = a4;
    v12 = end + 4;
  }
  self->_dataSources.__end_ = v12;
  self->_float totalWeight = self->_totalWeight + a4;
}

- (void)enumerateDataSourcesAndWeightsUsingBlock:(id)a3
{
  v4 = (void (**)(id, id, unsigned char *, float))a3;
  unsigned __int8 v10 = 0;
  begin = (id *)self->_dataSources.__begin_;
  end = (id *)self->_dataSources.__end_;
  if (begin != end)
  {
    do
    {
      id v7 = *begin;
      v4[2](v4, v7, &v10, *((float *)begin + 2));
      int v8 = v10;

      begin += 2;
      if (v8) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = begin == end;
      }
    }
    while (!v9);
  }
}

- (float)totalWeight
{
  return self->_totalWeight;
}

- (void).cxx_destruct
{
  p_dataSources = &self->_dataSources;
  std::vector<std::pair<objc_object  {objcproto27_EARLanguageModelDataSource}* {__strong},float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_dataSources);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end