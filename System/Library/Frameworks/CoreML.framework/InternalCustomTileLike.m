@interface InternalCustomTileLike
- (BOOL)evaluateOnCPUWithInputs:(id)a3 outputs:(id)a4 error:(id *)a5;
- (BOOL)setWeightData:(id)a3 error:(id *)a4;
- (InternalCustomTileLike)initWithParameterDictionary:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)outputShapesForInputShapes:(id)a3 error:(id *)a4;
- (unint64_t)inputRank;
- (vector<unsigned)inputShape;
- (vector<unsigned)multiples;
- (vector<unsigned)outputShape;
@end

@implementation InternalCustomTileLike

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_outputShape.__begin_;
  if (begin)
  {
    self->_outputShape.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_inputShape.__begin_;
  if (v4)
  {
    self->_inputShape.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_multiples.__begin_;
  if (v5)
  {
    self->_multiples.__end_ = v5;
    operator delete(v5);
  }
}

- (vector<unsigned)outputShape
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_outputShape.__begin_, (uint64_t)self->_outputShape.__end_, self->_outputShape.__end_- self->_outputShape.__begin_);
}

- (vector<unsigned)inputShape
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_inputShape.__begin_, (uint64_t)self->_inputShape.__end_, self->_inputShape.__end_ - self->_inputShape.__begin_);
}

- (vector<unsigned)multiples
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_multiples.__begin_, (uint64_t)self->_multiples.__end_, self->_multiples.__end_ - self->_multiples.__begin_);
}

- (unint64_t)inputRank
{
  return self->_inputRank;
}

- (BOOL)setWeightData:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)outputShapesForInputShapes:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectAtIndexedSubscript:0];
  self->_inputRank = [v6 count];

  std::vector<unsigned long>::resize(&self->_inputShape.__begin_, self->_inputRank);
  std::vector<unsigned long>::resize(&self->_outputShape.__begin_, self->_inputRank);
  if (self->_inputRank)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [v5 objectAtIndexedSubscript:0];
      v9 = [v8 objectAtIndexedSubscript:v7];
      self->_inputShape.__begin_[v7] = [v9 integerValue];

      ++v7;
    }
    while (v7 < self->_inputRank);
  }
  v10 = [v5 objectAtIndexedSubscript:2];
  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

- (InternalCustomTileLike)initWithParameterDictionary:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)InternalCustomTileLike;
  return [(InternalCustomTileLike *)&v5 init];
}

- (BOOL)evaluateOnCPUWithInputs:(id)a3 outputs:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 bytes];

  id v11 = [v8 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 mutableBytes];

  id v13 = [v7 objectAtIndexedSubscript:1];
  v14 = (float *)[v13 bytes];

  unint64_t inputRank = self->_inputRank;
  v22 = 0;
  long long v21 = 0uLL;
  if (inputRank)
  {
    std::vector<unsigned long>::__vallocate[abi:ne180100](&v21, inputRank);
    v16 = (void *)*((void *)&v21 + 1);
    uint64_t v17 = 4 * inputRank;
    do
    {
      float v18 = *v14++;
      *v16++ = (unint64_t)v18;
      v17 -= 4;
    }
    while (v17);
    *((void *)&v21 + 1) = v16;
  }
  begin = self->_multiples.__begin_;
  if (begin)
  {
    self->_multiples.__end_ = begin;
    operator delete(begin);
    self->_multiples.__begin_ = 0;
    self->_multiples.__end_ = 0;
    self->_multiples.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&self->_multiples.__begin_ = v21;
  self->_multiples.__end_cap_.__value_ = v22;
  BrickLayers::Tile((uint64_t)&self->_multiples, v10, (uint64_t **)&self->_inputShape, v12, (uint64_t *)&self->_outputShape);

  return 1;
}

@end