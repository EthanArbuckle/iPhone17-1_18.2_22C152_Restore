@interface NSKeyValueArray
+ (id)_proxyShare;
- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)dealloc;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation NSKeyValueArray

- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator
{
  key = self->_key;
  container = self->_container;
  result.var1 = key;
  result.var0 = container;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (_NSKeyValueProxyDeallocate(self))
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueArray;
    [(NSKeyValueArray *)&v3 dealloc];
  }
}

- (void)_proxyNonGCFinalize
{
  self->_container = 0;
  self->_key = 0;
  self->_methods = 0;
}

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare;
  if (!_proxyShare_proxyShare)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare = (uint64_t)result;
  }
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueArray;
  v6 = [(NSKeyValueArray *)&v8 init];
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)(id)[a4 key];
    v6->_methods = (NSKeyValueNonmutatingArrayMethodSet *)(id)[a4 methods];
  }
  return v6;
}

- (unint64_t)count
{
  method_invoke();
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_methods->objectAtIndex)
  {
    method_invoke();
  }
  else
  {
    uint64_t v4 = [[NSIndexSet alloc] initWithIndex:a3];
    method_invoke();
    v6 = v5;

    return (id)[v6 objectAtIndex:0];
  }
  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_methods->getObjectsRange)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueArray;
    -[NSKeyValueArray getObjects:range:](&v4, sel_getObjects_range_, a3, a4.location, a4.length);
  }
}

- (id)objectsAtIndexes:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_methods->objectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueArray;
    return [(NSKeyValueArray *)&v4 objectsAtIndexes:a3];
  }
  return result;
}

@end