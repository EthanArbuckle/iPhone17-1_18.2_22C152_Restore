@interface NSKeyValueFastMutableSet1
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
@end

@implementation NSKeyValueFastMutableSet1

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableSet1;
  v5 = -[NSKeyValueFastMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[4] = (id)[a4 nonmutatingMethods];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueFastMutableSet1;
  [(NSKeyValueFastMutableSet *)&v3 _proxyNonGCFinalize];
  self->_nonmutatingMethods = 0;
}

- (unint64_t)count
{
  method_invoke();
  return result;
}

- (id)member:(id)a3
{
  method_invoke();
  return result;
}

- (id)objectEnumerator
{
  method_invoke();
  return result;
}

@end