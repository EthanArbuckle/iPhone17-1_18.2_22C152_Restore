@interface _MKSpatialColliderPairSet
- (_MKSpatialColliderPairSet)initWithCapacity:(unint64_t)a3;
- (id).cxx_construct;
@end

@implementation _MKSpatialColliderPairSet

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

- (_MKSpatialColliderPairSet)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MKSpatialColliderPairSet;
  v4 = [(_MKSpatialColliderPairSet *)&v7 init];
  v5 = v4;
  if (v4) {
    std::__hash_table<_MKAnnotationViewPair,std::hash<_MKAnnotationViewPair>,std::equal_to<_MKAnnotationViewPair>,std::allocator<_MKAnnotationViewPair>>::__rehash<true>((uint64_t)&v4->_pairs, vcvtps_u32_f32((float)a3 / v4->_pairs.__table_.__p3_.__value_));
  }
  return v5;
}

- (void).cxx_destruct
{
  next = self->_pairs.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_pairs.__table_.__bucket_list_.__ptr_.__value_;
  self->_pairs.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

@end