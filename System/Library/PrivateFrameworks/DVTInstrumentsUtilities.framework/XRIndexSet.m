@interface XRIndexSet
+ (id)indexSetWithIndex:(unint64_t)a3;
+ (id)indexSetWithIndexesInRange:(_XRIndexRange)a3;
- (BOOL)containsIndex:(unint64_t)a3;
- (BOOL)countEquals:(unint64_t)a3;
- (BOOL)intersectsIndexesInRange:(_XRIndexRange)a3;
- (BOOL)isEmpty;
- (XRIndexSet)initWithIndex:(unint64_t)a3;
- (XRIndexSet)initWithIndexes:(_XRIndexRange)a3;
- (id).cxx_construct;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)firstIndex;
- (unint64_t)lastIndex;
- (void)enumerateIndexesUsingBlock:(id)a3;
- (void)enumerateRangesUsingBlock:(id)a3;
@end

@implementation XRIndexSet

- (XRIndexSet)initWithIndex:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)XRIndexSet;
  v4 = [(XRIndexSet *)&v7 init];
  v5 = v4;
  if (v4)
  {
    *(void *)&long long v8 = a3;
    *((void *)&v8 + 1) = a3;
    sub_23457DEF8((uint64_t)&v4->_impl, &v8);
    v5->_impl._cacheIsValid = 0;
    sub_23457D014((uint64_t)&v5->_impl);
  }
  return v5;
}

- (XRIndexSet)initWithIndexes:(_XRIndexRange)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v9.receiver = self;
  v9.super_class = (Class)XRIndexSet;
  v5 = [(XRIndexSet *)&v9 init];
  v6 = v5;
  if (v5)
  {
    uint64_t p_impl = (uint64_t)&v5->_impl;
    if (var1)
    {
      *(void *)&long long v10 = var0;
      *((void *)&v10 + 1) = var0 + var1 - 1;
      sub_23457DEF8((uint64_t)&v5->_impl, &v10);
      v6->_impl._cacheIsValid = 0;
    }
    sub_23457D014(p_impl);
  }
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(XRMutableIndexSet);
  id v5 = sub_23457D190(v4, self);
  return v4;
}

+ (id)indexSetWithIndex:(unint64_t)a3
{
  v4 = [XRIndexSet alloc];
  long long v8 = [v4 initWithIndex:v5 a3:v6 v7:v7];

  return v8;
}

+ (id)indexSetWithIndexesInRange:(_XRIndexRange)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v5 = [XRIndexSet alloc];
  long long v8 = [v5 initWithIndexes:v6 indexes:var0 indexes:var1 length:v7];

  return v8;
}

- (BOOL)isEmpty
{
  return self->_impl._ranges.__tree_.__pair3_.__value_ == 0;
}

- (unint64_t)count
{
  p_pair1 = &self->_impl._ranges.__tree_.__pair1_;
  begin_node = (XRIndexSet *)self->_impl._ranges.__tree_.__begin_node_;
  if (begin_node == (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_) {
    return 0;
  }
  unint64_t result = 0;
  do
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)begin_node->_impl._ranges.__tree_.__begin_node_;
    uint64_t v6 = begin_node;
    if (left)
    {
      do
      {
        uint64_t v7 = left;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)left->__value_.__left_;
      }
      while (left);
    }
    else
    {
      do
      {
        uint64_t v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)v6->_impl._ranges.__tree_.__pair1_.__value_.__left_;
        BOOL v8 = v7->__value_.__left_ == v6;
        uint64_t v6 = (XRIndexSet *)v7;
      }
      while (!v8);
    }
    unint64_t result = result + begin_node->_impl._cache.__elems_[0].last - begin_node->_impl._cache.__elems_[0].first + 1;
    begin_node = (XRIndexSet *)v7;
  }
  while (v7 != p_pair1);
  return result;
}

- (BOOL)countEquals:(unint64_t)a3
{
  begin_node = (XRIndexSet *)self->_impl._ranges.__tree_.__begin_node_;
  if (begin_node == (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_)
  {
    unint64_t v4 = 0;
    BOOL v5 = 1;
  }
  else
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v4 = v4 + begin_node->_impl._cache.__elems_[0].last - begin_node->_impl._cache.__elems_[0].first + 1;
      BOOL v5 = v4 <= a3;
      if (v4 > a3) {
        break;
      }
      isa = (XRIndexSet *)begin_node->_impl._ranges.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (XRIndexSet *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (XRIndexSet *)begin_node->_impl._ranges.__tree_.__pair1_.__value_.__left_;
          BOOL v8 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v8);
      }
      begin_node = left;
    }
    while (left != (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_);
  }
  return v4 == a3 && v5;
}

- (unint64_t)firstIndex
{
  if (!self->_impl._ranges.__tree_.__pair3_.__value_)
  {
    BOOL v8 = [MEMORY[0x263F08690] a2:v2 v3:v4];
    [v8 _handleFailureInMethod:v9 object:a2 file:@"XRIndexSet.mm" lineNumber:91 description:@"firstIndex called on empty index set"];
  }
  return *((void *)self->_impl._ranges.__tree_.__begin_node_ + 4);
}

- (unint64_t)lastIndex
{
  if (!self->_impl._ranges.__tree_.__pair3_.__value_)
  {
    BOOL v8 = [MEMORY[0x263F08690] a2:v2 v3:v4];
    [v8 _handleFailureInMethod:v9 object:a2 file:self lineNumber:96 description:@"lastIndex called on empty index set"];
  }

  return sub_23457D4E4((uint64_t)&self->_impl);
}

- (BOOL)containsIndex:(unint64_t)a3
{
  return sub_23457D590((uint64_t)&self->_impl, a3);
}

- (BOOL)intersectsIndexesInRange:(_XRIndexRange)a3
{
  return sub_23457D650((uint64_t)&self->_impl, a3.var0, a3.var1);
}

- (void)enumerateIndexesUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  char v10 = 0;
  begin_node = (XRIndexSet *)self->_impl._ranges.__tree_.__begin_node_;
  v8[0] = begin_node;
  v8[1] = &self->_impl._ranges.__tree_.__pair1_;
  if (begin_node == (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_) {
    unint64_t first = 0;
  }
  else {
    unint64_t first = begin_node->_impl._cache.__elems_[0].first;
  }
  unint64_t v9 = first;
  while ((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)v8[0] != &self->_impl._ranges.__tree_.__pair1_
       || v9 != 0)
  {
    v4[2](v4);
    if (v10) {
      break;
    }
    sub_23457D760(v8);
  }
}

- (void)enumerateRangesUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  begin_node = (XRIndexSet *)self->_impl._ranges.__tree_.__begin_node_;
  if (begin_node != (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_)
  {
    do
    {
      v4[2](v4);
      isa = (XRIndexSet *)begin_node->_impl._ranges.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (XRIndexSet *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (XRIndexSet *)begin_node->_impl._ranges.__tree_.__pair1_.__value_.__left_;
          BOOL v8 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v8);
      }
      begin_node = left;
    }
    while (left != (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((unsigned char *)self + 96) = 0;
  return self;
}

@end