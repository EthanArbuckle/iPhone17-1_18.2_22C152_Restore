@interface MLShufflingBatchProvider
- (MLBatchProvider)batchProvider;
- (MLShufflingBatchProvider)initWithBatchProvider:(id)a3 seed:(id)a4;
- (id).cxx_construct;
- (id)featuresAtIndex:(int64_t)a3;
- (int64_t)count;
- (void)setBatchProvider:(id)a3;
- (void)shuffle;
@end

@implementation MLShufflingBatchProvider

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((_DWORD *)self + 8) = 1;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchProvider, 0);
  begin = self->indices.__begin_;
  if (begin)
  {
    self->indices.__end_ = begin;
    operator delete(begin);
  }
}

- (void)setBatchProvider:(id)a3
{
}

- (MLBatchProvider)batchProvider
{
  return (MLBatchProvider *)objc_getProperty(self, a2, 40, 1);
}

- (id)featuresAtIndex:(int64_t)a3
{
  int64_t v3 = self->indices.__begin_[a3];
  v4 = [(MLShufflingBatchProvider *)self batchProvider];
  v5 = [v4 featuresAtIndex:v3];

  return v5;
}

- (int64_t)count
{
  v2 = [(MLShufflingBatchProvider *)self batchProvider];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)shuffle
{
}

- (MLShufflingBatchProvider)initWithBatchProvider:(id)a3 seed:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)MLShufflingBatchProvider;
  id v8 = [(MLShufflingBatchProvider *)&v44 init];
  if (v8)
  {
    for (uint64_t i = 0; i < [v6 count]; ++i)
    {
      v11 = (uint64_t *)*((void *)v8 + 2);
      unint64_t v10 = *((void *)v8 + 3);
      if ((unint64_t)v11 >= v10)
      {
        v13 = (uint64_t *)*((void *)v8 + 1);
        uint64_t v14 = v11 - v13;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v10 - (void)v13;
        if (v16 >> 2 > v15) {
          unint64_t v15 = v16 >> 2;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v17);
          v13 = (uint64_t *)*((void *)v8 + 1);
          v11 = (uint64_t *)*((void *)v8 + 2);
        }
        else
        {
          uint64_t v18 = 0;
        }
        v19 = (uint64_t *)(v17 + 8 * v14);
        uint64_t *v19 = i;
        v12 = v19 + 1;
        while (v11 != v13)
        {
          uint64_t v20 = *--v11;
          *--v19 = v20;
        }
        *((void *)v8 + 1) = v19;
        *((void *)v8 + 2) = v12;
        *((void *)v8 + 3) = v17 + 8 * v18;
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        uint64_t *v11 = i;
        v12 = v11 + 1;
      }
      *((void *)v8 + 2) = v12;
    }
    [v8 setBatchProvider:v6];
    *((_DWORD *)v8 + 8) = 1;
    if (v7)
    {
      int v21 = [v7 unsignedIntegerValue];
      v22 = std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(1uLL);
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      _DWORD *v22 = v21;
      int v46 = -582287778;
      unsigned int v47 = -1953789045;
      unint64_t v45 = 0xDD4AFE5D51BF72D3;
      uint64_t v25 = 3;
      uint64_t v26 = 1;
      uint64_t v27 = 2;
      do
      {
        if (v24 == 3) {
          uint64_t v24 = 0;
        }
        else {
          ++v24;
        }
        if (v25 == 3) {
          uint64_t v25 = 0;
        }
        else {
          ++v25;
        }
        if (v26 == 3) {
          uint64_t v26 = 0;
        }
        else {
          ++v26;
        }
        int v28 = *((_DWORD *)&v45 + v26);
        unsigned int v29 = *((_DWORD *)&v45 + v24) ^ *((_DWORD *)&v45 + v25) ^ v28;
        int v30 = 1664525 * (v29 ^ (v29 >> 27));
        *((_DWORD *)&v45 + v26) = v30 + v28;
        if (v27 == 3) {
          uint64_t v27 = 0;
        }
        else {
          ++v27;
        }
        int v31 = v22[v23] + v24 + v30;
        *((_DWORD *)&v45 + v27) += v31;
        *((_DWORD *)&v45 + v24) = v31;
        ++v23;
      }
      while (v23 != 1);
      uint64_t v32 = 2;
      do
      {
        if (v24 == 3) {
          uint64_t v24 = 0;
        }
        else {
          ++v24;
        }
        if (v25 == 3) {
          uint64_t v25 = 0;
        }
        else {
          ++v25;
        }
        if (v26 == 3) {
          uint64_t v26 = 0;
        }
        else {
          ++v26;
        }
        if (v27 == 3) {
          uint64_t v27 = 0;
        }
        else {
          ++v27;
        }
        int v33 = *((_DWORD *)&v45 + v26);
        unsigned int v34 = *((_DWORD *)&v45 + v24) ^ *((_DWORD *)&v45 + v25) ^ v33;
        int v35 = 1664525 * (v34 ^ (v34 >> 27));
        *((_DWORD *)&v45 + v26) = v35 + v33;
        int v36 = v35 + v24;
        *((_DWORD *)&v45 + v27) += v36;
        *((_DWORD *)&v45 + v24) = v36;
        --v32;
      }
      while (v32);
      uint64_t v37 = 4;
      do
      {
        if (v24 == 3) {
          uint64_t v24 = 0;
        }
        else {
          ++v24;
        }
        if (v25 == 3) {
          uint64_t v25 = 0;
        }
        else {
          ++v25;
        }
        if (v26 == 3) {
          uint64_t v26 = 0;
        }
        else {
          ++v26;
        }
        if (v27 == 3) {
          uint64_t v27 = 0;
        }
        else {
          ++v27;
        }
        int v38 = *((_DWORD *)&v45 + v26);
        unsigned int v39 = v38 + *((_DWORD *)&v45 + v24) + *((_DWORD *)&v45 + v25);
        int v40 = 1566083941 * (v39 ^ (v39 >> 27));
        *((_DWORD *)&v45 + v26) = v40 ^ v38;
        int v41 = v40 - v24;
        *((_DWORD *)&v45 + v27) ^= v41;
        *((_DWORD *)&v45 + v24) = v41;
        --v37;
      }
      while (v37);
      unsigned int v42 = v47 + ((v47 / 0x7FFFFFFF) | ((v47 / 0x7FFFFFFF) << 31));
      if (v42 <= 1) {
        unsigned int v42 = 1;
      }
      *((_DWORD *)v8 + 8) = v42;
      operator delete(v22);
    }
    std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<long *>,std::__wrap_iter<long *>,std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u> &>(*((void *)v8 + 1), *((void *)v8 + 2), (uint64_t)v8 + 32);
  }

  return (MLShufflingBatchProvider *)v8;
}

@end