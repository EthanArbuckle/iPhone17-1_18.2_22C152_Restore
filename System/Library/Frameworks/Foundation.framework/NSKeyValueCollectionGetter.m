@interface NSKeyValueCollectionGetter
- (NSKeyValueCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 methods:(id)a5 proxyClass:(Class)a6;
- (id)methods;
- (void)dealloc;
@end

@implementation NSKeyValueCollectionGetter

- (id)methods
{
  return self->_methods;
}

- (NSKeyValueCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 methods:(id)a5 proxyClass:(Class)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSKeyValueCollectionGetter;
  v7 = [(NSKeyValueProxyGetter *)&v9 initWithContainerClassID:a3 key:a4 proxyClass:a6];
  if (v7) {
    v7->_methods = (NSKeyValueNonmutatingCollectionMethodSet *)a5;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueCollectionGetter;
  [(NSKeyValueAccessor *)&v3 dealloc];
}

@end