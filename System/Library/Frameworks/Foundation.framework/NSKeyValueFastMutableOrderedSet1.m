@interface NSKeyValueFastMutableOrderedSet1
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)_proxyNonGCFinalize;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation NSKeyValueFastMutableOrderedSet1

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableOrderedSet1;
  v5 = -[NSKeyValueFastMutableOrderedSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[4] = (id)[a4 nonmutatingMethods];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueFastMutableOrderedSet1;
  [(NSKeyValueFastMutableOrderedSet *)&v3 _proxyNonGCFinalize];
  self->_nonmutatingMethods = 0;
}

- (unint64_t)count
{
  method_invoke();
  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_nonmutatingMethods->getObjectsRange)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableOrderedSet1;
    -[NSKeyValueFastMutableOrderedSet1 getObjects:range:](&v4, sel_getObjects_range_, a3, a4.location, a4.length);
  }
}

- (unint64_t)indexOfObject:(id)a3
{
  method_invoke();
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_nonmutatingMethods->objectAtIndex)
  {
    method_invoke();
  }
  else
  {
    objc_super v4 = [[NSIndexSet alloc] initWithIndex:a3];
    method_invoke();
    v6 = v5;

    return (id)[v6 objectAtIndex:0];
  }
  return result;
}

- (id)objectsAtIndexes:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_nonmutatingMethods->objectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableOrderedSet1;
    return [(NSKeyValueFastMutableOrderedSet1 *)&v4 objectsAtIndexes:a3];
  }
  return result;
}

@end