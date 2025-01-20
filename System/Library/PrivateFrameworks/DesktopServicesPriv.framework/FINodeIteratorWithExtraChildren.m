@interface FINodeIteratorWithExtraChildren
- (BOOL)baseIteratorDone;
- (BOOL)fullyPopulated;
- (FINodeIterator)baseIterator;
- (FINodeIterator)extraIterator;
- (FINodeIteratorWithExtraChildren)initWithIterator:(id)a3 extraChildren:(id)a4 extraChildrenFullyPopulated:(BOOL)a5 options:(unsigned int)a6;
- (id)first;
- (id)next;
- (unint64_t)estimatedSize;
- (void)setBaseIterator:(id)a3;
- (void)setBaseIteratorDone:(BOOL)a3;
- (void)setExtraIterator:(id)a3;
@end

@implementation FINodeIteratorWithExtraChildren

- (FINodeIteratorWithExtraChildren)initWithIterator:(id)a3 extraChildren:(id)a4 extraChildrenFullyPopulated:(BOOL)a5 options:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FINodeIteratorWithExtraChildren;
  v13 = [(FINodeIteratorWithExtraChildren *)&v17 init];
  objc_storeStrong((id *)&v13->_baseIterator, a3);
  v14 = [[FIChildrenIterator alloc] initWithChildren:v12 fullyPopulated:v7 options:v6];
  extraIterator = v13->_extraIterator;
  v13->_extraIterator = (FINodeIterator *)v14;

  return v13;
}

- (id)first
{
  v3 = [(FINodeIterator *)self->_baseIterator first];
  if (!v3)
  {
    v3 = [(FINodeIterator *)self->_extraIterator first];
  }
  return v3;
}

- (id)next
{
  if (self->_baseIteratorDone)
  {
    v3 = [(FINodeIterator *)self->_extraIterator next];
  }
  else
  {
    v4 = [(FINodeIterator *)self->_baseIterator next];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      self->_baseIteratorDone = 1;
      id v6 = [(FINodeIterator *)self->_extraIterator first];
    }
    v3 = v6;
  }
  return v3;
}

- (BOOL)fullyPopulated
{
  BOOL v3 = [(FINodeIterator *)self->_baseIterator fullyPopulated];
  if (v3)
  {
    extraIterator = self->_extraIterator;
    LOBYTE(v3) = [(FINodeIterator *)extraIterator fullyPopulated];
  }
  return v3;
}

- (unint64_t)estimatedSize
{
  unint64_t v3 = [(FINodeIterator *)self->_baseIterator estimatedSize];
  return [(FINodeIterator *)self->_extraIterator estimatedSize] + v3;
}

- (FINodeIterator)baseIterator
{
  return self->_baseIterator;
}

- (void)setBaseIterator:(id)a3
{
}

- (BOOL)baseIteratorDone
{
  return self->_baseIteratorDone;
}

- (void)setBaseIteratorDone:(BOOL)a3
{
  self->_baseIteratorDone = a3;
}

- (FINodeIterator)extraIterator
{
  return self->_extraIterator;
}

- (void)setExtraIterator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraIterator, 0);
  objc_storeStrong((id *)&self->_baseIterator, 0);
}

@end