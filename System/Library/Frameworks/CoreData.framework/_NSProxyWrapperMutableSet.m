@interface _NSProxyWrapperMutableSet
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableSet:(void *)a5 mutationMethods:;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation _NSProxyWrapperMutableSet

- (void)dealloc
{
  self->_mutationMethods = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSProxyWrapperMutableSet;
  [(_NSNotifyingWrapperMutableSet *)&v3 dealloc];
}

- (void)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableSet:(void *)a5 mutationMethods:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_NSProxyWrapperMutableSet;
  v6 = objc_msgSendSuper2(&v8, sel_initWithContainer_key_mutableSet_, a2, a3, a4);
  if (v6) {
    v6[4] = a5;
  }
  return v6;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  if (self->_mutationMethods->_addObjectMethod)
  {
    method_invoke();
  }
  else
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v4 count:1];
    method_invoke();
  }
}

- (void)addObjectsFromArray:(id)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a3];
  mutationMethods = self->_mutationMethods;
  id v6 = v4;
  if (mutationMethods->_addMethod) {
    method_invoke();
  }
  else {
    _PFInvokeMutationMethodForEachMemberOfSet((uint64_t)self->super._container, (uint64_t)mutationMethods->_addObjectMethod, v4);
  }
}

- (void)intersectSet:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_mutationMethods->_intersectMethod)
  {
    method_invoke();
  }
  else
  {
    unint64_t v5 = [(_NSNotifyingWrapperMutableSet *)self count];
    if (v5)
    {
      unint64_t v6 = v5;
      if (v5 >= 0x201) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = v5;
      }
      unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0;
      v9 = (char *)v12 - v8;
      if (v5 > 0x200) {
        v9 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v12 - v8, 8 * v5);
      }
      [(_NSNotifyingWrapperMutableSet *)self getObjects:v9];
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v11 = *(void *)&v9[8 * i];
        if (([a3 containsObject:v11] & 1) == 0) {
          [(_NSProxyWrapperMutableSet *)self removeObject:v11];
        }
      }
      if (v6 >= 0x201) {
        NSZoneFree(0, v9);
      }
    }
  }
}

- (void)minusSet:(id)a3
{
  mutationMethods = self->_mutationMethods;
  container = self->super._container;
  if (mutationMethods->_removeMethod) {
    method_invoke();
  }
  else {
    _PFInvokeMutationMethodForEachMemberOfSet((uint64_t)container, (uint64_t)mutationMethods->_removeObjectMethod, a3);
  }
}

- (void)removeAllObjects
{
  if (self->_mutationMethods->_setMethod) {
    method_invoke();
  }
  else {
    [(_NSProxyWrapperMutableSet *)self minusSet:self->super._mutableSet];
  }
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  if (self->_mutationMethods->_removeObjectMethod)
  {
    method_invoke();
  }
  else
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v4 count:1];
    method_invoke();
  }
}

- (void)setSet:(id)a3
{
  if (self->_mutationMethods->_setMethod)
  {
    method_invoke();
  }
  else
  {
    id v4 = a3;
    [(_NSProxyWrapperMutableSet *)self minusSet:self->super._mutableSet];
    [(_NSProxyWrapperMutableSet *)self unionSet:a3];
  }
}

- (void)unionSet:(id)a3
{
  mutationMethods = self->_mutationMethods;
  container = self->super._container;
  if (mutationMethods->_addMethod) {
    method_invoke();
  }
  else {
    _PFInvokeMutationMethodForEachMemberOfSet((uint64_t)container, (uint64_t)mutationMethods->_addObjectMethod, a3);
  }
}

@end