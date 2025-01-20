@interface NSKeyValueMutableArray
+ (id)_proxyShare;
- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (void)_proxyNonGCFinalize;
- (void)dealloc;
- (void)setArray:(id)a3;
@end

@implementation NSKeyValueMutableArray

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_0;
  if (!_proxyShare_proxyShare_0)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_0 = (uint64_t)result;
  }
  return result;
}

- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator
{
  key = self->_key;
  container = self->_container;
  result.var1 = key;
  result.var0 = container;
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueMutableArray;
  v6 = [(NSKeyValueMutableArray *)&v8 init];
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)objc_msgSend((id)objc_msgSend(a4, "key"), "copy");
  }
  return v6;
}

- (void)_proxyNonGCFinalize
{
  self->_container = 0;
  self->_key = 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (_NSKeyValueProxyDeallocate(self))
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueMutableArray;
    [(NSKeyValueMutableArray *)&v3 dealloc];
  }
}

- (void)setArray:(id)a3
{
  [(NSKeyValueMutableArray *)self removeAllObjects];

  [(NSKeyValueMutableArray *)self addObjectsFromArray:a3];
}

@end