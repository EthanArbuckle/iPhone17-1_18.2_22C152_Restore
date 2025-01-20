@interface NSKeyValueIvarMutableArray
- (id)_nonNilMutableArrayValueWithSelector:(SEL)a3;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)_raiseNilValueExceptionWithSelector:(SEL)a3;
- (void)addObject:(id)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
@end

@implementation NSKeyValueIvarMutableArray

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueIvarMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[3] = [a4 ivar];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueIvarMutableArray;
  [(NSKeyValueMutableArray *)&v3 _proxyNonGCFinalize];
  self->_ivar = 0;
}

- (unint64_t)count
{
  container = self->super._container;
  objc_super v3 = *(Class *)((char *)&container->isa + ivar_getOffset(self->_ivar));

  return [v3 count];
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)_nonNilMutableArrayValueWithSelector:(SEL)a3
{
  container = self->super._container;
  v6 = *(Class *)((char *)&container->isa + ivar_getOffset(self->_ivar));
  if (!v6) {
    [(NSKeyValueIvarMutableArray *)self _raiseNilValueExceptionWithSelector:a3];
  }
  return v6;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(NSKeyValueIvarMutableArray *)self _nonNilMutableArrayValueWithSelector:a2];

  objc_msgSend(v7, "getObjects:range:", a3, location, length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = [(NSKeyValueIvarMutableArray *)self _nonNilMutableArrayValueWithSelector:a2];

  return (id)[v4 objectAtIndex:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  id v4 = [(NSKeyValueIvarMutableArray *)self _nonNilMutableArrayValueWithSelector:a2];

  return (id)[v4 objectsAtIndexes:a3];
}

- (void)addObject:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = a3;
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6)
  {
    [v6 addObject:a3];
  }
  else
  {
    *(Class *)((char *)&container->isa + Offset) = (Class)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v7 count:1];
  }
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = a3;
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v10 = *(Class *)((char *)&container->isa + Offset);
  if (v10)
  {
    [v10 insertObject:a3 atIndex:a4];
  }
  else
  {
    if (a4) {
      -[NSKeyValueIvarMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2, v11[0]);
    }
    *(Class *)((char *)&container->isa + Offset) = (Class)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v11 count:1];
  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v10 = *(Class *)((char *)&container->isa + Offset);
  if (v10)
  {
    [v10 insertObjects:a3 atIndexes:a4];
    return;
  }
  if (!a3 || !a4)
  {
    v14 = _NSMethodExceptionProem((objc_class *)self, a2);
    v15 = @"passed-in array";
    if (a3) {
      v15 = @"index set";
    }
    v16 = +[NSString stringWithFormat:@"%@: the %@ must not be nil.", v14, v15, v17];
LABEL_18:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0]);
  }
  unint64_t v11 = [a3 count];
  uint64_t v12 = [a4 count];
  if (v11 != v12)
  {
    v16 = +[NSString stringWithFormat:@"%@: the counts of the passed-in array (%lu) and index set (%lu) must be identical.", _NSMethodExceptionProem((objc_class *)self, a2), v11, v12];
    goto LABEL_18;
  }
  unint64_t v13 = [a4 lastIndex];
  if (v13 < v11 || v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(Class *)((char *)&container->isa + Offset) = (Class)[a3 mutableCopy];
  }
  else
  {
    [(NSKeyValueIvarMutableArray *)self _raiseNilValueExceptionWithSelector:a2];
  }
}

- (void)removeLastObject
{
  id v2 = [(NSKeyValueIvarMutableArray *)self _nonNilMutableArrayValueWithSelector:a2];

  [v2 removeLastObject];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v4 = [(NSKeyValueIvarMutableArray *)self _nonNilMutableArrayValueWithSelector:a2];

  [v4 removeObjectAtIndex:a3];
}

- (void)removeObjectsAtIndexes:(id)a3
{
  id v4 = [(NSKeyValueIvarMutableArray *)self _nonNilMutableArrayValueWithSelector:a2];

  [v4 removeObjectsAtIndexes:a3];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = [(NSKeyValueIvarMutableArray *)self _nonNilMutableArrayValueWithSelector:a2];

  [v6 replaceObjectAtIndex:a3 withObject:a4];
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  id v6 = [(NSKeyValueIvarMutableArray *)self _nonNilMutableArrayValueWithSelector:a2];

  [v6 replaceObjectsAtIndexes:a3 withObjects:a4];
}

@end