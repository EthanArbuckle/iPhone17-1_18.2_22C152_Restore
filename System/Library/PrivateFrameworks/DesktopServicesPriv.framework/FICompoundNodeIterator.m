@interface FICompoundNodeIterator
- (BOOL)fullyPopulated;
- (FICompoundNodeIterator)initWithFINodes:(id)a3 options:(unsigned int)a4;
- (id).cxx_construct;
- (id)first;
- (id)next;
- (unint64_t)estimatedSize;
@end

@implementation FICompoundNodeIterator

- (FICompoundNodeIterator)initWithFINodes:(id)a3 options:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FICompoundNodeIterator;
  v7 = [(FICompoundNodeIterator *)&v12 init];
  IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)&obj, v6);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v13, -1, v6);
  v21 = (char **)(v7 + 8);
  while (obj != (id)v13[0] || v19 != v13[16])
  {
    id v8 = *(id *)(v15[1] + 8 * v18);
    id v20 = [v8 iteratorWithOptions:v4];
    std::back_insert_iterator<std::vector<NSObject  {objcproto14FINodeIterator}* {__strong}>>::operator=[abi:ne180100](&v21, (uint64_t *)&v20);

    uint64_t v9 = v18;
    if (v18 >= v17 - 1)
    {
      uint64_t v10 = [obj countByEnumeratingWithState:v15 objects:v16 count:4];
      uint64_t v9 = -1;
      uint64_t v17 = v10;
      uint64_t v18 = -1;
    }
    if (v16[4] != *(void *)v15[2])
    {
      objc_enumerationMutation(obj);
      uint64_t v9 = v18;
    }
    uint64_t v18 = v9 + 1;
    ++v19;
  }

  return (FICompoundNodeIterator *)v7;
}

- (id)first
{
  self->fCurrentIterator = 0;
  begin = self->_subIterators.__begin_;
  var0 = self->_subIterators.var0;
  if (begin == var0)
  {
LABEL_4:
    id v6 = 0;
  }
  else
  {
    while (1)
    {
      v5 = *begin;
      id v6 = [(__end_ *)v5 first];
      if (v6) {
        break;
      }
      ++self->fCurrentIterator;

      if (++begin == var0) {
        goto LABEL_4;
      }
    }
  }
  return v6;
}

- (id)next
{
  unint64_t fCurrentIterator = self->fCurrentIterator;
  begin = self->_subIterators.__begin_;
  if (fCurrentIterator >= self->_subIterators.var0 - begin)
  {
LABEL_8:
    id v8 = 0;
  }
  else
  {
    char v5 = 0;
    while (1)
    {
      id v6 = begin[fCurrentIterator];
      v7 = v6;
      if (v5) {
        [(__end_ *)v6 first];
      }
      else {
      id v8 = [(__end_ *)v6 next];
      }
      if (v8) {
        break;
      }
      ++self->fCurrentIterator;

      unint64_t fCurrentIterator = self->fCurrentIterator;
      begin = self->_subIterators.__begin_;
      char v5 = 1;
      if (fCurrentIterator >= self->_subIterators.var0 - begin) {
        goto LABEL_8;
      }
    }
  }
  return v8;
}

- (BOOL)fullyPopulated
{
  begin = self->_subIterators.__begin_;
  var0 = self->_subIterators.var0;
  if (begin == var0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v4 = begin + 1;
    do
    {
      int v5 = [(__end_cap_ *)*(v4 - 1) fullyPopulated];
      if (v5) {
        BOOL v6 = v4 == var0;
      }
      else {
        BOOL v6 = 1;
      }
      ++v4;
    }
    while (!v6);
  }
  return v5;
}

- (unint64_t)estimatedSize
{
  begin = self->_subIterators.__begin_;
  var0 = self->_subIterators.var0;
  if (begin == var0) {
    return 0;
  }
  int v4 = 0;
  do
  {
    int v5 = *begin++;
    v4 += [v5 estimatedSize];
  }
  while (begin != var0);
  return v4;
}

- (void).cxx_destruct
{
  p_subIterators = &self->_subIterators;
  std::vector<TNodePtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_subIterators);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end