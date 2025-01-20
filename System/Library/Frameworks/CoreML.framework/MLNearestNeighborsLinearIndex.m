@interface MLNearestNeighborsLinearIndex
+ (BOOL)supportsSecureCoding;
- (BOOL)updateWithData:(const void *)a3 error:(id *)a4;
- (MLNearestNeighborsLinearIndex)initWithCoder:(id)a3;
- (MLNearestNeighborsLinearIndex)initWithDataset:()vector<float numberOfDimensions:(std:(unint64_t)a4 :allocator<float>> *)a3;
- (id).cxx_construct;
- (unint64_t)numDataPoints;
- (unint64_t)numDimensions;
- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsLinearIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toIndex:(unint64_t)a5;
- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsLinearIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toQueryPoint:(const void *)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setNumDataPoints:(unint64_t)a3;
- (void)setNumDimensions:(unint64_t)a3;
@end

@implementation MLNearestNeighborsLinearIndex

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  begin = self->vDataL2Squared.__begin_;
  if (begin)
  {
    self->vDataL2Squared.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->vData.__begin_;
  if (v4)
  {
    self->vData.__end_ = v4;
    operator delete(v4);
  }
}

- (void)setNumDimensions:(unint64_t)a3
{
  self->_numDimensions = a3;
}

- (unint64_t)numDimensions
{
  return self->_numDimensions;
}

- (void)setNumDataPoints:(unint64_t)a3
{
  self->_numDataPoints = a3;
}

- (unint64_t)numDataPoints
{
  return self->_numDataPoints;
}

- (MLNearestNeighborsLinearIndex)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MLNearestNeighborsLinearIndex;
  id v5 = [(MLNearestNeighborsLinearIndex *)&v19 init];
  if (v5)
  {
    *((void *)v5 + 7) = [v4 decodeInt64ForKey:@"kNumDataPoints"];
    *((void *)v5 + 8) = [v4 decodeInt64ForKey:@"kNumDimensions"];
    uint64_t v18 = 0;
    id v6 = v4;
    v7 = (const void *)[v6 decodeBytesForKey:@"kVPoints" returnedLength:&v18];
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    v15 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v15, v7, (uint64_t)v7 + (v18 & 0xFFFFFFFFFFFFFFFCLL), v18 >> 2);
    v8 = v15;
    std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v5 + 8, v15, v16, (v16 - (uint64_t)v15) >> 2);
    if ([v6 containsValueForKey:@"kVPointsL2Squared"])
    {
      v9 = (const void *)[v6 decodeBytesForKey:@"kVPointsL2Squared" returnedLength:&v18];
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      v12 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v12, v9, (uint64_t)v9 + (v18 & 0xFFFFFFFFFFFFFFFCLL), v18 >> 2);
      v10 = v12;
      std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v5 + 32, v12, v13, (v13 - (uint64_t)v12) >> 2);
      if (v10) {
        operator delete(v10);
      }
    }
    if (v8) {
      operator delete(v8);
    }
  }

  return (MLNearestNeighborsLinearIndex *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints"), @"kNumDataPoints");
  objc_msgSend(v4, "encodeInt64:forKey:", -[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions"), @"kNumDimensions");
  [v4 encodeBytes:self->vData.__begin_ length:(char *)self->vData.__end_ - (char *)self->vData.__begin_ forKey:@"kVPoints"];
  [v4 encodeBytes:self->vDataL2Squared.__begin_ length:(char *)self->vDataL2Squared.__end_ - (char *)self->vDataL2Squared.__begin_ forKey:@"kVPointsL2Squared"];
}

- (BOOL)updateWithData:(const void *)a3 error:(id *)a4
{
  unint64_t v7 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2;
  if (v7 % [(MLNearestNeighborsLinearIndex *)self numDimensions])
  {
    if (a4)
    {
      v8 = @"Unexpected dimensionality of update data";
LABEL_4:
      +[MLModelErrorUtils genericErrorWithFormat:v8];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    return 0;
  }
  uint64_t v10 = *((void *)a3 + 1);
  uint64_t v11 = v10 - *(void *)a3;
  if (v10 == *(void *)a3)
  {
    if (a4)
    {
      v8 = @"Training data is empty";
      goto LABEL_4;
    }
    return 0;
  }
  unint64_t v12 = [(MLNearestNeighborsLinearIndex *)self numDimensions];
  unint64_t v13 = (v11 >> 2) / v12;
  unint64_t v14 = [(MLNearestNeighborsLinearIndex *)self numDataPoints];
  std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>>((void **)&self->vData.__begin_, (char *)self->vData.__end_, *(char **)a3, *((char **)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
  [(MLNearestNeighborsLinearIndex *)self setNumDataPoints:[(MLNearestNeighborsLinearIndex *)self numDataPoints] + v13];
  p_vDataL2Squared = &self->vDataL2Squared;
  std::vector<float>::resize((char **)&self->vDataL2Squared, [(MLNearestNeighborsLinearIndex *)self numDataPoints]);
  unint64_t v16 = [(MLNearestNeighborsLinearIndex *)self numDimensions];
  begin = self->vData.__begin_;
  unint64_t v18 = [(MLNearestNeighborsLinearIndex *)self numDimensions];
  if (v12 > v11 >> 2) {
    return 1;
  }
  vDSP_Length v19 = v18;
  v20 = &p_vDataL2Squared->__begin_[v14];
  v21 = &begin[v16 * v14];
  uint64_t v22 = 4 * v18;
  do
  {
    BOOL v9 = 1;
    vDSP_svesq(v21, 1, v20++, v19);
    v21 = (const float *)((char *)v21 + v22);
    --v13;
  }
  while (v13);
  return v9;
}

- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsLinearIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toIndex:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(MLNearestNeighborsLinearIndex *)self dataPointCount] <= a4)
  {
    std::to_string(&__p, a4);
    unint64_t v18 = std::string::insert(&__p, 0, "invalid k=");
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v23.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    v20 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = &v23;
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v21 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
      _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&__p, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v23);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
  }
  begin = self->vData.__begin_;
  uint64_t v10 = &begin[[(MLNearestNeighborsLinearIndex *)self numDimensions] * a5];
  unint64_t v11 = [(MLNearestNeighborsLinearIndex *)self numDimensions];
  memset(&v23, 0, sizeof(v23));
  std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(&v23, v10, (uint64_t)&v10[v11], v11);
  unint64_t v12 = a4 + 1;
  [(MLNearestNeighborsLinearIndex *)self findNearestNeighbors:v12 toQueryPoint:&v23];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  std::string::size_type size = __p.__r_.__value_.__l.__size_;
  unint64_t v13 = (_OWORD *)__p.__r_.__value_.__r.__words[0];
  v24 = retstr;
  if (__p.__r_.__value_.__r.__words[0] == __p.__r_.__value_.__l.__size_)
  {
    var0 = 0;
    var1 = 0;
  }
  else
  {
    do
    {
      if (*(void *)v13 != a5) {
        std::back_insert_iterator<std::vector<std::pair<unsigned long,float>>>::operator=[abi:ne180100]((void ***)&v24, v13);
      }
      ++v13;
    }
    while (v13 != (_OWORD *)size);
    var0 = retstr->var0;
    var1 = retstr->var1;
  }
  if (v12 == (var1 - var0) >> 4) {
    retstr->var1 = var1 - 16;
  }
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  result = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)v23.__r_.__value_.__r.__words[0];
  if (v23.__r_.__value_.__r.__words[0])
  {
    v23.__r_.__value_.__l.__size_ = v23.__r_.__value_.__r.__words[0];
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  return result;
}

- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsLinearIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toQueryPoint:(const void *)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *((void *)a5 + 1) - *(void *)a5;
  if ([(MLNearestNeighborsLinearIndex *)self numDimensions] != v9 >> 2)
  {
    std::to_string(&__C, (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 2);
    v59 = std::string::insert(&__C, 0, "invalid queryPoint.size()=");
    long long v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v60;
    v59->__r_.__value_.__l.__size_ = 0;
    v59->__r_.__value_.__r.__words[2] = 0;
    v59->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__C.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__C.__r_.__value_.__l.__data_);
    }
    v61 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      LODWORD(__C.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__C.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
      _os_log_error_impl(&dword_19E58B000, v61, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&__C, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &__p);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
  }
  std::vector<float>::vector(&__p, [(MLNearestNeighborsLinearIndex *)self numDataPoints]);
  vDSP_Length v10 = [(MLNearestNeighborsLinearIndex *)self numDimensions];
  vDSP_Length v11 = [(MLNearestNeighborsLinearIndex *)self numDataPoints];
  unint64_t v12 = *(const float **)a5;
  unint64_t v13 = (float *)__p.__r_.__value_.__r.__words[0];
  begin = self->vDataL2Squared.__begin_;
  LODWORD(v66) = v11;
  std::string::size_type v65 = __p.__r_.__value_.__r.__words[0];
  LODWORD(v64) = v10;
  cblas_sgemm_NEWLAPACK();
  vDSP_vadd(begin, 1, v13, 1, v13, 1, v11);
  LODWORD(__C.__r_.__value_.__l.__data_) = 0;
  vDSP_svesq(v12, 1, (float *)&__C, v10);
  vDSP_vsadd(v13, 1, (const float *)&__C, v13, 1, v11);
  unint64_t v15 = [(MLNearestNeighborsLinearIndex *)self numDataPoints];
  unint64_t v16 = v15;
  if (v15)
  {
    if (v15 >> 60) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v15);
    *(void *)&long long v19 = v17;
    v20 = v17;
    do
    {
      *(void *)v20 = 0;
      *((_DWORD *)v20 + 2) = 0;
      v20 += 16;
    }
    while (v20 != &v17[16 * v16]);
    v21 = &v17[16 * v18];
    *((void *)&v19 + 1) = &v17[16 * v16];
  }
  else
  {
    v21 = 0;
    long long v19 = 0uLL;
  }
  uint64_t v22 = (float *)*((void *)&v19 + 1);
  long long v67 = v19;
  std::string v23 = (float *)v19;
  if (*((void *)&v19 + 1) != (void)v19)
  {
    uint64_t v24 = 0;
    unint64_t v25 = (uint64_t)(*((void *)&v19 + 1) - v19) >> 4;
    std::string::size_type v26 = __p.__r_.__value_.__r.__words[0];
    if (v25 <= 1) {
      unint64_t v25 = 1;
    }
    v27 = (_DWORD *)(v19 + 8);
    do
    {
      int v28 = *(_DWORD *)(v26 + 4 * v24);
      *((void *)v27 - 1) = v24;
      _DWORD *v27 = v28;
      v27 += 4;
      ++v24;
    }
    while (v25 != v24);
  }
  unint64_t v29 = [(MLNearestNeighborsLinearIndex *)self numDataPoints];
  if (v29 < a4) {
    a4 = v29;
  }
  if (a4 >= [(MLNearestNeighborsLinearIndex *)self numDataPoints])
  {
    *(_OWORD *)&retstr->var0 = v67;
    retstr->var2.var0 = v21;
    goto LABEL_50;
  }
  if (!a4)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    if (!v23) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  v30 = &v23[4 * a4];
  if ((uint64_t)a4 >= 2)
  {
    unint64_t v31 = (a4 - 2) >> 1;
    unint64_t v32 = v31 + 1;
    v33 = &v23[4 * v31];
    do
    {
      std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CoreML::CompareIndexDistancePairs &,std::__wrap_iter<std::pair<unsigned long,float> *>>((uint64_t)v23, a4, v33);
      v33 -= 4;
      --v32;
    }
    while (v32);
  }
  if (v30 != v22)
  {
    v34 = &v23[4 * a4];
    do
    {
      float v35 = v34[2];
      float v36 = v23[2];
      if (v35 < v36)
      {
        uint64_t v37 = *(void *)v34;
        *(void *)v34 = *(void *)v23;
        *(void *)std::string v23 = v37;
        v34[2] = v36;
        v23[2] = v35;
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CoreML::CompareIndexDistancePairs &,std::__wrap_iter<std::pair<unsigned long,float> *>>((uint64_t)v23, a4, v23);
      }
      v34 += 4;
    }
    while (v34 != v22);
  }
  if ((uint64_t)a4 >= 2)
  {
    int64_t v38 = a4 & 0xFFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v39 = 0;
      uint64_t v40 = *(void *)v23;
      int v41 = *((_DWORD *)v23 + 2);
      v42 = v23;
      do
      {
        v43 = v42;
        v42 += 4 * v39 + 4;
        uint64_t v44 = 2 * v39;
        uint64_t v39 = (2 * v39) | 1;
        int64_t v45 = v44 + 2;
        if (v45 < v38 && v42[2] < v42[6])
        {
          v42 += 4;
          uint64_t v39 = v45;
        }
        *(void *)v43 = *(void *)v42;
        v43[2] = v42[2];
      }
      while (v39 <= (uint64_t)((unint64_t)(v38 - 2) >> 1));
      if (v42 == v30 - 4)
      {
        *(void *)v42 = v40;
        *((_DWORD *)v42 + 2) = v41;
      }
      else
      {
        *(void *)v42 = *((void *)v30 - 2);
        v42[2] = *(v30 - 2);
        *((void *)v30 - 2) = v40;
        *((_DWORD *)v30 - 2) = v41;
        uint64_t v46 = (char *)v42 - (char *)v23 + 16;
        if (v46 >= 17)
        {
          unint64_t v47 = (unint64_t)((v46 >> 4) - 2) >> 1;
          v48 = &v23[4 * v47];
          float v49 = v42[2];
          if (v48[2] < v49)
          {
            uint64_t v50 = *(void *)v42;
            do
            {
              v51 = v42;
              v42 = v48;
              *(void *)v51 = *(void *)v48;
              v51[2] = v48[2];
              if (!v47) {
                break;
              }
              unint64_t v47 = (v47 - 1) >> 1;
              v48 = &v23[4 * v47];
            }
            while (v48[2] < v49);
            *(void *)v42 = v50;
            v42[2] = v49;
          }
        }
      }
      v30 -= 4;
    }
    while (v38-- > 2);
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (a4 >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  v53 = std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(a4);
  retstr->var0 = v53;
  retstr->var1 = v53;
  retstr->var2.var0 = &v53[v54];
  unint64_t v55 = 16 * a4;
  v56 = v23;
  do
  {
    long long v57 = *(_OWORD *)v56;
    v56 += 4;
    *v53++ = v57;
    v55 -= 16;
  }
  while (v55);
  retstr->var1 = v53;
  if (v23) {
LABEL_49:
  }
    operator delete(v23);
LABEL_50:
  result = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)__p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return result;
}

- (MLNearestNeighborsLinearIndex)initWithDataset:()vector<float numberOfDimensions:(std:(unint64_t)a4 :allocator<float>> *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MLNearestNeighborsLinearIndex;
  id v6 = [(MLNearestNeighborsLinearIndex *)&v15 init];
  unint64_t v7 = v6;
  if (v6)
  {
    p_begin = (const float **)&v6->vData.__begin_;
    if (&v6->vData != a3) {
      std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)&v6->vData, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
    }
    unint64_t v9 = a3->__end_ - a3->__begin_;
    v7->_unint64_t numDataPoints = v9 / a4;
    v7->_vDSP_Length numDimensions = a4;
    if (v9 >= a4)
    {
      std::vector<float>::resize((char **)&v7->vDataL2Squared, v9 / a4);
      unint64_t numDataPoints = v7->_numDataPoints;
      if (numDataPoints)
      {
        vDSP_Length numDimensions = v7->_numDimensions;
        begin = v7->vDataL2Squared.__begin_;
        unint64_t v13 = *p_begin;
        do
        {
          vDSP_svesq(v13, 1, begin++, numDimensions);
          v13 += numDimensions;
          --numDataPoints;
        }
        while (numDataPoints);
      }
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end