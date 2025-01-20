@interface NSKeyValueFastMutableArray
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (void)_proxyNonGCFinalize;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
@end

@implementation NSKeyValueFastMutableArray

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[3] = (id)[a4 mutatingMethods];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueFastMutableArray;
  [(NSKeyValueMutableArray *)&v3 _proxyNonGCFinalize];
  self->_mutatingMethods = 0;
}

- (void)addObject:(id)a3
{
  uint64_t v5 = [(NSKeyValueFastMutableArray *)self count];

  [(NSKeyValueFastMutableArray *)self insertObject:a3 atIndex:v5];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_mutatingMethods->insertObjectAtIndex)
  {
    method_invoke();
  }
  else
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v8 count:1];
    v6 = [NSIndexSet alloc];
    objc_super v7 = -[NSIndexSet initWithIndex:](v6, "initWithIndex:", a4, v8, v9);
    method_invoke();
  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_mutatingMethods->insertObjectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableArray;
    [(NSKeyValueFastMutableArray *)&v4 insertObjects:a3 atIndexes:a4];
  }
}

- (void)removeLastObject
{
  uint64_t v3 = [(NSKeyValueFastMutableArray *)self count] - 1;

  [(NSKeyValueFastMutableArray *)self removeObjectAtIndex:v3];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if (self->_mutatingMethods->removeObjectAtIndex)
  {
    method_invoke();
  }
  else
  {
    uint64_t v3 = [[NSIndexSet alloc] initWithIndex:a3];
    method_invoke();
  }
}

- (void)removeObjectsAtIndexes:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->_mutatingMethods->removeObjectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueFastMutableArray;
    [(NSKeyValueFastMutableArray *)&v3 removeObjectsAtIndexes:a3];
  }
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = a4;
  mutatingMethods = self->_mutatingMethods;
  if (mutatingMethods->replaceObjectAtIndex)
  {
    method_invoke();
  }
  else if (mutatingMethods->replaceObjectsAtIndexes)
  {
    id v8 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3, v10[0]);
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v10 count:1];
    method_invoke();
  }
  else
  {
    -[NSKeyValueFastMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a3, v10[0]);
    [(NSKeyValueFastMutableArray *)self insertObject:a4 atIndex:a3];
  }
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_mutatingMethods->replaceObjectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableArray;
    [(NSKeyValueFastMutableArray *)&v4 replaceObjectsAtIndexes:a3 withObjects:a4];
  }
}

@end