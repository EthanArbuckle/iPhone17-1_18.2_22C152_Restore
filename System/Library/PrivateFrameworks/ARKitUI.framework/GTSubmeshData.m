@interface GTSubmeshData
- (id).cxx_construct;
- (unint64_t)indexCount;
- (unsigned)indexData;
- (void)addIndex:(unsigned int)a3;
@end

@implementation GTSubmeshData

- (void)addIndex:(unsigned int)a3
{
  p_end_cap = &self->_indexVector.__end_cap_;
  value = self->_indexVector.__end_cap_.__value_;
  end = self->_indexVector.__end_;
  if (end >= value)
  {
    begin = self->_indexVector.__begin_;
    uint64_t v10 = end - begin;
    if ((unint64_t)(v10 + 1) >> 62) {
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    unint64_t v11 = (char *)value - (char *)begin;
    unint64_t v12 = ((char *)value - (char *)begin) >> 1;
    if (v12 <= v10 + 1) {
      unint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)p_end_cap, v13);
      begin = self->_indexVector.__begin_;
      end = self->_indexVector.__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = (unsigned int *)&v14[4 * v10];
    v16 = (unsigned int *)&v14[4 * v13];
    unsigned int *v15 = a3;
    v8 = v15 + 1;
    while (end != begin)
    {
      unsigned int v17 = *--end;
      *--v15 = v17;
    }
    self->_indexVector.__begin_ = v15;
    self->_indexVector.__end_ = v8;
    self->_indexVector.__end_cap_.__value_ = v16;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    unsigned int *end = a3;
    v8 = end + 1;
  }
  self->_indexVector.__end_ = v8;
}

- (unsigned)indexData
{
  return self->_indexVector.__begin_;
}

- (unint64_t)indexCount
{
  return self->_indexVector.__end_ - self->_indexVector.__begin_;
}

- (void).cxx_destruct
{
  begin = self->_indexVector.__begin_;
  if (begin)
  {
    self->_indexVector.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end