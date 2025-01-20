@interface PKFloatArray
- (double)floatAtIndex:(uint64_t)a1;
- (double)lastFloat;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)setFloat:(double)a3 atIndex:;
- (void)initWithCapacity:(void *)a1;
@end

@implementation PKFloatArray

- (void)initWithCapacity:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)PKFloatArray;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[4] = a2;
    std::vector<double>::resize((uint64_t)(v3 + 1), a2);
  }
  return v4;
}

- (uint64_t)setFloat:(double)a3 atIndex:
{
  if (result)
  {
    if (*(void *)(result + 32) <= a2)
    {
      id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"index is out of bounds" userInfo:0];
      objc_exception_throw(v3);
    }
    *(double *)(*(void *)(result + 8) + 8 * a2) = a3;
  }
  return result;
}

- (double)floatAtIndex:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if (*(void *)(a1 + 32) <= a2)
  {
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"index is out of bounds" userInfo:0];
    objc_exception_throw(v3);
  }
  return *(double *)(*(void *)(a1 + 8) + 8 * a2);
}

- (double)lastFloat
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1)
  {
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"container is empty" userInfo:0];
    objc_exception_throw(v3);
  }

  return -[PKFloatArray floatAtIndex:](a1, v1 - 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (PKFloatArray *)-[PKFloatArray initWithCapacity:](v4, self->_capacity);
  objc_super v6 = v5;
  if (v5) {
    BOOL v7 = v5 == self;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v5->_vfloats, (char *)self->_vfloats.__begin_, (uint64_t)self->_vfloats.__end_, self->_vfloats.__end_ - self->_vfloats.__begin_);
  }
  return v6;
}

- (void).cxx_destruct
{
  begin = self->_vfloats.__begin_;
  if (begin)
  {
    self->_vfloats.__end_ = begin;
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