@interface FINodeIterator
- (BOOL)fullyPopulated;
- (FINodeIterator)initWithIterator:(OpaqueNodeIterator *)a3;
- (id)first;
- (id)next;
- (unint64_t)estimatedSize;
- (void)dealloc;
@end

@implementation FINodeIterator

- (BOOL)fullyPopulated
{
  return NodeIteratorFullyPopulated((uint64_t)self->_iterator);
}

- (void)dealloc
{
  NodeDisposeIterator((uint64_t)self->_iterator);
  v3.receiver = self;
  v3.super_class = (Class)FINodeIterator;
  [(FINodeIterator *)&v3 dealloc];
}

- (id)first
{
  v4 = NodeIteratorFirst((TNodeIterator *)self->_iterator);
  v2 = +[FINode nodeFromNodeRef:v4];
  TRef<OpaqueNodeRef *,TRetainReleasePolicy<OpaqueNodeRef *>>::~TRef((const void **)&v4);
  return v2;
}

- (id)next
{
  v4 = NodeIteratorNext((TNodeIterator *)self->_iterator);
  v2 = +[FINode nodeFromNodeRef:v4];
  TRef<OpaqueNodeRef *,TRetainReleasePolicy<OpaqueNodeRef *>>::~TRef((const void **)&v4);
  return v2;
}

- (FINodeIterator)initWithIterator:(OpaqueNodeIterator *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FINodeIterator;
  result = [(FINodeIterator *)&v5 init];
  result->_iterator = a3;
  return result;
}

- (unint64_t)estimatedSize
{
  return NodeIteratorSize((uint64_t)self->_iterator);
}

@end