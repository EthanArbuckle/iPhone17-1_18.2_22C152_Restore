@interface NSKeyValueSlowMutableSet
- (id)_createMutableSetValueWithSelector:(SEL)a3;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)_setValueWithSelector:(SEL)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)_raiseNilValueExceptionWithSelector:(SEL)a3;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation NSKeyValueSlowMutableSet

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueSlowMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)NSKeyValueSlowMutableSet;
  [(NSKeyValueMutableSet *)&v3 _proxyNonGCFinalize];
  self->_valueGetter = 0;
  self->_valueSetter = 0;
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)_setValueWithSelector:(SEL)a3
{
  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa);
  if (!v5 && !self->_treatNilValuesLikeEmptySets) {
    [(NSKeyValueSlowMutableSet *)self _raiseNilValueExceptionWithSelector:a3];
  }
  return v5;
}

- (unint64_t)count
{
  id v2 = [(NSKeyValueSlowMutableSet *)self _setValueWithSelector:a2];

  return [v2 count];
}

- (id)member:(id)a3
{
  id v4 = [(NSKeyValueSlowMutableSet *)self _setValueWithSelector:a2];

  return (id)[v4 member:a3];
}

- (id)objectEnumerator
{
  id v2 = [(NSKeyValueSlowMutableSet *)self _setValueWithSelector:a2];
  if (v2)
  {
    return (id)[v2 objectEnumerator];
  }
  else
  {
    id v4 = objc_alloc_init(NSKeyValueNilSetEnumerator);
    return v4;
  }
}

- (id)_createMutableSetValueWithSelector:(SEL)a3
{
  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa);
  if (!v5 && !self->_treatNilValuesLikeEmptySets) {
    [(NSKeyValueSlowMutableSet *)self _raiseNilValueExceptionWithSelector:a3];
  }

  return (id)[v5 mutableCopy];
}

- (void)addObject:(id)a3
{
  id v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2, a3, *MEMORY[0x1E4F143B8]);
  if (v5)
  {
    v6 = v5;
    [v5 addObject:a3];
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:&v7 count:1];
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
}

- (void)addObjectsFromArray:(id)a3
{
  id v5 = [(NSKeyValueSlowMutableSet *)self _createMutableSetValueWithSelector:a2];
  if (v5)
  {
    id v6 = v5;
    [v5 addObjectsFromArray:a3];
  }
  else
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:a3];
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
}

- (void)intersectSet:(id)a3
{
  id v5 = [(NSKeyValueSlowMutableSet *)self _createMutableSetValueWithSelector:a2];
  if (v5)
  {
    id v6 = v5;
    [v5 intersectSet:a3];
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
  }
}

- (void)minusSet:(id)a3
{
  id v5 = [(NSKeyValueSlowMutableSet *)self _createMutableSetValueWithSelector:a2];
  if (v5)
  {
    id v6 = v5;
    [v5 minusSet:a3];
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
  }
}

- (void)removeAllObjects
{
  if (!self->_treatNilValuesLikeEmptySets
    && !_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa))
  {
    [(NSKeyValueSlowMutableSet *)self _raiseNilValueExceptionWithSelector:a2];
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v4);
}

- (void)removeObject:(id)a3
{
  id v5 = [(NSKeyValueSlowMutableSet *)self _createMutableSetValueWithSelector:a2];
  if (v5)
  {
    id v6 = v5;
    [v5 removeObject:a3];
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
  }
}

- (void)setSet:(id)a3
{
  if (!self->_treatNilValuesLikeEmptySets
    && !_NSGetUsingKeyValueGetter((uint64_t)self->super._container, &self->_valueGetter->super.super.isa))
  {
    [(NSKeyValueSlowMutableSet *)self _raiseNilValueExceptionWithSelector:a2];
  }
  container = self->super._container;
  valueSetter = self->_valueSetter;

  _NSSetUsingKeyValueSetter((uint64_t)container, (uint64_t)valueSetter, (uint64_t)a3);
}

- (void)unionSet:(id)a3
{
  id v5 = [(NSKeyValueSlowMutableSet *)self _createMutableSetValueWithSelector:a2];
  if (v5)
  {
    id v6 = v5;
    [v5 unionSet:a3];
  }
  else
  {
    id v6 = (id)[a3 mutableCopy];
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
}

@end