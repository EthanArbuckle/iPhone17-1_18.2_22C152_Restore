@interface NSKeyValueSlowMutableOrderedSet
- (id)_createNonNilMutableOrderedSetValueWithSelector:(SEL)a3;
- (id)_nonNilOrderedSetValueWithSelector:(SEL)a3;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)_proxyNonGCFinalize;
- (void)_raiseNilValueExceptionWithSelector:(SEL)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
@end

@implementation NSKeyValueSlowMutableOrderedSet

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueSlowMutableOrderedSet;
  v5 = -[NSKeyValueMutableOrderedSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5)
  {
    v5[3] = (id)[a4 baseGetter];
    v5[4] = (id)[a4 baseSetter];
    *((unsigned char *)v5 + 40) = [a4 treatNilValuesLikeEmptyCollections];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueSlowMutableOrderedSet;
  [(NSKeyValueMutableOrderedSet *)&v3 _proxyNonGCFinalize];
  self->_valueGetter = 0;
  self->_valueSetter = 0;
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  if (self->_treatNilValuesLikeEmptyOrderedSets) {
    objc_super v3 = (void *)MEMORY[0x1E4F1C4A8];
  }
  else {
    objc_super v3 = (void *)MEMORY[0x1E4F1C3B8];
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*v3, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (unint64_t)count
{
  uint64_t v4 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa);
  if (!v4 && !self->_treatNilValuesLikeEmptyOrderedSets) {
    [(NSKeyValueSlowMutableOrderedSet *)self _raiseNilValueExceptionWithSelector:a2];
  }

  return [v4 count];
}

- (id)_nonNilOrderedSetValueWithSelector:(SEL)a3
{
  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa);
  if (!v5) {
    [(NSKeyValueSlowMutableOrderedSet *)self _raiseNilValueExceptionWithSelector:a3];
  }
  return v5;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(NSKeyValueSlowMutableOrderedSet *)self _nonNilOrderedSetValueWithSelector:a2];

  objc_msgSend(v7, "getObjects:range:", a3, location, length);
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = [(NSKeyValueSlowMutableOrderedSet *)self _nonNilOrderedSetValueWithSelector:a2];

  return [v4 indexOfObject:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = [(NSKeyValueSlowMutableOrderedSet *)self _nonNilOrderedSetValueWithSelector:a2];

  return (id)[v4 objectAtIndex:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  id v4 = [(NSKeyValueSlowMutableOrderedSet *)self _nonNilOrderedSetValueWithSelector:a2];

  return (id)[v4 objectsAtIndexes:a3];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v8 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa);
  if (v8)
  {
    v9 = objc_msgSend(v8, "mutableCopy", v10, v11);
    [v9 insertObject:a3 atIndex:a4];
  }
  else
  {
    if (a4 || !self->_treatNilValuesLikeEmptyOrderedSets) {
      -[NSKeyValueSlowMutableOrderedSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2, v10, v11);
    }
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:&v10 count:1];
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v9);
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  uint64_t v8 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa);
  if (v8)
  {
    id v16 = (id)[v8 mutableCopy];
    [v16 insertObjects:a3 atIndexes:a4];
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v16);
    goto LABEL_11;
  }
  if (!self->_treatNilValuesLikeEmptyOrderedSets) {
    goto LABEL_9;
  }
  if (!a3 || !a4)
  {
    v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    v13 = @"passed-in ordered set";
    if (a3) {
      v13 = @"index set";
    }
    v14 = +[NSString stringWithFormat:@"%@: the %@ must not be nil.", v12, v13, v15];
LABEL_18:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
  }
  unint64_t v9 = [a3 count];
  uint64_t v10 = [a4 count];
  if (v9 != v10)
  {
    v14 = +[NSString stringWithFormat:@"%@: the counts of the passed-in ordered set (%lu) and index set (%lu) must be identical.", _NSMethodExceptionProem((objc_class *)self, a2), v9, v10];
    goto LABEL_18;
  }
  unint64_t v11 = [a4 lastIndex];
  if (v11 >= v9 && v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_9:
    [(NSKeyValueSlowMutableOrderedSet *)self _raiseNilValueExceptionWithSelector:a2];
    id v16 = 0;
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, 0);
    goto LABEL_11;
  }
  id v16 = (id)[a3 mutableCopy];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v16);
LABEL_11:
}

- (id)_createNonNilMutableOrderedSetValueWithSelector:(SEL)a3
{
  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa);
  if (!v5) {
    [(NSKeyValueSlowMutableOrderedSet *)self _raiseNilValueExceptionWithSelector:a3];
  }

  return (id)[v5 mutableCopy];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v5 = [(NSKeyValueSlowMutableOrderedSet *)self _createNonNilMutableOrderedSetValueWithSelector:a2];
  [v5 removeObjectAtIndex:a3];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v5);
}

- (void)removeObjectsAtIndexes:(id)a3
{
  id v5 = [(NSKeyValueSlowMutableOrderedSet *)self _createNonNilMutableOrderedSetValueWithSelector:a2];
  [v5 removeObjectsAtIndexes:a3];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v5);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v7 = [(NSKeyValueSlowMutableOrderedSet *)self _createNonNilMutableOrderedSetValueWithSelector:a2];
  [v7 replaceObjectAtIndex:a3 withObject:a4];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v7);
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  id v7 = [(NSKeyValueSlowMutableOrderedSet *)self _createNonNilMutableOrderedSetValueWithSelector:a2];
  [v7 replaceObjectsAtIndexes:a3 withObjects:a4];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v7);
}

@end