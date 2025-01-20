@interface NSKeyValueSet
+ (id)_proxyShare;
- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)dealloc;
@end

@implementation NSKeyValueSet

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_2;
  if (!_proxyShare_proxyShare_2)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_2 = (uint64_t)result;
  }
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueSet;
  v6 = [(NSKeyValueSet *)&v8 init];
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)(id)[a4 key];
    v6->_methods = (NSKeyValueNonmutatingSetMethodSet *)(id)[a4 methods];
  }
  return v6;
}

- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator
{
  key = self->_key;
  container = self->_container;
  result.var1 = key;
  result.var0 = container;
  return result;
}

- (void)_proxyNonGCFinalize
{
  self->_container = 0;
  self->_key = 0;
  self->_methods = 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (_NSKeyValueProxyDeallocate(self))
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueSet;
    [(NSKeyValueSet *)&v3 dealloc];
  }
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