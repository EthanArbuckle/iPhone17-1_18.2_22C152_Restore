@interface _EARLazyDoubleArray
- (id).cxx_construct;
- (id)_initWithDoubleVector:(const void *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation _EARLazyDoubleArray

- (id)_initWithDoubleVector:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_EARLazyDoubleArray;
  v4 = [(_EARLazyDoubleArray *)&v8 init];
  v5 = v4;
  if (v4)
  {
    p_vec = (char *)&v4->_vec;
    if (&v5->_vec != a3) {
      std::vector<kaldi::CuWorkspace *>::__assign_with_size[abi:ne180100]<kaldi::CuWorkspace **,kaldi::CuWorkspace **>(p_vec, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
    }
  }
  return v5;
}

- (unint64_t)count
{
  return self->_vec.__end_ - self->_vec.__begin_;
}

- (id)objectAtIndex:(unint64_t)a3
{
  p_vec = &self->_vec;
  begin = self->_vec.__begin_;
  unint64_t v6 = self->_vec.__end_ - begin;
  if (v6 <= a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Requested index %zu out of bounds %zu", a3, v6);
    begin = p_vec->__begin_;
  }
  v7 = NSNumber;
  double v8 = begin[a3];
  return (id)[v7 numberWithDouble:v8];
}

- (void).cxx_destruct
{
  p_vec = &self->_vec;
  begin = self->_vec.__begin_;
  if (begin)
  {
    p_vec->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  return self;
}

@end