@interface InternalCustomGatherTree
- (BOOL)evaluateOnCPUWithInputs:(id)a3 outputs:(id)a4 error:(id *)a5;
- (BOOL)setWeightData:(id)a3 error:(id *)a4;
- (InternalCustomGatherTree)initWithParameterDictionary:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)outputShapesForInputShapes:(id)a3 error:(id *)a4;
- (vector<int,)shape;
@end

@implementation InternalCustomGatherTree

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_shape.__begin_;
  if (begin)
  {
    self->_shape.__end_ = begin;
    operator delete(begin);
  }
}

- (vector<int,)shape
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<int, std::allocator<int>> *)std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(retstr, self->_shape.__begin_, (uint64_t)self->_shape.__end_, self->_shape.__end_ - self->_shape.__begin_);
}

- (BOOL)setWeightData:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)outputShapesForInputShapes:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  self->_shape.__end_ = self->_shape.__begin_;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", 0, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) intValue];
        int v11 = v10;
        end = self->_shape.__end_;
        value = self->_shape.__end_cap_.__value_;
        if (end >= value)
        {
          begin = self->_shape.__begin_;
          uint64_t v16 = end - begin;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v18 = (char *)value - (char *)begin;
          if (v18 >> 1 > v17) {
            unint64_t v17 = v18 >> 1;
          }
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v17;
          }
          if (v19)
          {
            unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v19);
            begin = self->_shape.__begin_;
            end = self->_shape.__end_;
          }
          else
          {
            uint64_t v20 = 0;
          }
          v21 = (int *)(v19 + 4 * v16);
          int *v21 = v11;
          v14 = v21 + 1;
          while (end != begin)
          {
            int v22 = *--end;
            *--v21 = v22;
          }
          self->_shape.__begin_ = v21;
          self->_shape.__end_ = v14;
          self->_shape.__end_cap_.__value_ = (int *)(v19 + 4 * v20);
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          int *end = v10;
          v14 = end + 1;
        }
        self->_shape.__end_ = v14;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  v23 = [v5 objectAtIndexedSubscript:0];
  v30 = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];

  return v24;
}

- (InternalCustomGatherTree)initWithParameterDictionary:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)InternalCustomGatherTree;
  return [(InternalCustomGatherTree *)&v5 init];
}

- (BOOL)evaluateOnCPUWithInputs:(id)a3 outputs:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 bytes];

  id v11 = [v7 objectAtIndexedSubscript:1];
  uint64_t v12 = [v11 bytes];

  id v13 = [v7 objectAtIndexedSubscript:2];
  uint64_t v14 = [v13 bytes];

  id v15 = [v7 objectAtIndexedSubscript:3];
  float v16 = *(float *)[v15 bytes];

  id v17 = [v8 objectAtIndexedSubscript:0];
  uint64_t v18 = [v17 mutableBytes];

  begin = self->_shape.__begin_;
  uint64_t v20 = *begin;
  uint64_t v21 = begin[1];
  int v22 = begin[2];
  uint64_t v23 = (v21 * v20 * v22);
  float v24 = (float)(int)v16;
  if ((int)v23 >= 1)
  {
    v25 = (float *)v18;
    do
    {
      *v25++ = v24;
      --v23;
    }
    while (v23);
  }
  if ((int)v21 >= 1)
  {
    int v26 = 0;
    uint64_t v27 = 0;
    int v28 = v21 * v22;
    do
    {
      if (v22 >= 1)
      {
        int v29 = 0;
        int v30 = v26;
        do
        {
          if ((int)v20 >= (int)*(float *)(v14 + 4 * v27)) {
            int v31 = (int)*(float *)(v14 + 4 * v27);
          }
          else {
            int v31 = v20;
          }
          if (v31 >= 1)
          {
            int v32 = v29 + (v27 + (v31 - 1) * v21) * v22;
            *(_DWORD *)(v18 + 4 * v32) = *(_DWORD *)(v10 + 4 * v32);
            int v33 = (int)*(float *)(v12 + 4 * v32);
            if (v33 < 0 || v22 < v33) {
              goto LABEL_27;
            }
            if (v31 > 1)
            {
              uint64_t v34 = (v31 - 2);
              uint64_t v35 = v34 + 1;
              int v36 = v22 * (v27 + v21 * v34);
              while (1)
              {
                int v37 = v33 + v36;
                *(float *)(v18 + 4 * (v29 + v36)) = (float)(int)*(float *)(v10 + 4 * v37);
                int v33 = (int)*(float *)(v12 + 4 * v37);
                if (v33 < 0 || v22 < v33) {
                  break;
                }
                --v35;
                v36 -= v28;
                if (v35 < 1) {
                  goto LABEL_19;
                }
              }
LABEL_27:
              exception = __cxa_allocate_exception(0x10uLL);
              MEMORY[0x19F3C1380](exception, "Gather tree layer: Parent out of bound.");
              __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
LABEL_19:
            BOOL v38 = 0;
            int v39 = v30;
            uint64_t v40 = v20;
            do
            {
              if (v38)
              {
                *(float *)(v18 + 4 * v39) = v24;
                BOOL v38 = 1;
              }
              else
              {
                BOOL v38 = *(int *)(v18 + 4 * v39) == SLODWORD(v16);
              }
              v39 += v28;
              --v40;
            }
            while (v40);
          }
          ++v29;
          ++v30;
        }
        while (v29 != v22);
      }
      ++v27;
      v26 += v22;
    }
    while (v27 != v21);
  }

  return 1;
}

@end