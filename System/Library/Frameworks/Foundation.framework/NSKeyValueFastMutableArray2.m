@interface NSKeyValueFastMutableArray2
- (id)_nonNilArrayValueWithSelector:(SEL)a3;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation NSKeyValueFastMutableArray2

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableArray2;
  v5 = -[NSKeyValueFastMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[4] = (id)[a4 baseGetter];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueFastMutableArray2;
  [(NSKeyValueFastMutableArray *)&v3 _proxyNonGCFinalize];
  self->_valueGetter = 0;
}

- (id)_nonNilArrayValueWithSelector:(SEL)a3
{
  id result = (id)_NSGetUsingKeyValueGetter((uint64_t)self->super.super._container, &self->_valueGetter->super.super.isa);
  if (!result)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super.super._key, self->super.super._container), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  return result;
}

- (unint64_t)count
{
  id v2 = [(NSKeyValueFastMutableArray2 *)self _nonNilArrayValueWithSelector:a2];

  return [v2 count];
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(NSKeyValueFastMutableArray2 *)self _nonNilArrayValueWithSelector:a2];

  objc_msgSend(v7, "getObjects:range:", a3, location, length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = [(NSKeyValueFastMutableArray2 *)self _nonNilArrayValueWithSelector:a2];

  return (id)[v4 objectAtIndex:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  id v4 = [(NSKeyValueFastMutableArray2 *)self _nonNilArrayValueWithSelector:a2];

  return (id)[v4 objectsAtIndexes:a3];
}

@end