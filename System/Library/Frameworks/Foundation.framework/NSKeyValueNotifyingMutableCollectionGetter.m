@interface NSKeyValueNotifyingMutableCollectionGetter
- (NSKeyValueNotifyingMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 mutableCollectionGetter:(id)a5 proxyClass:(Class)a6;
- (id)mutableCollectionGetter;
- (void)dealloc;
@end

@implementation NSKeyValueNotifyingMutableCollectionGetter

- (NSKeyValueNotifyingMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 mutableCollectionGetter:(id)a5 proxyClass:(Class)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSKeyValueNotifyingMutableCollectionGetter;
  v7 = [(NSKeyValueProxyGetter *)&v9 initWithContainerClassID:a3 key:a4 proxyClass:a6];
  if (v7) {
    v7->_mutableCollectionGetter = (NSKeyValueProxyGetter *)a5;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueNotifyingMutableCollectionGetter;
  [(NSKeyValueAccessor *)&v3 dealloc];
}

- (id)mutableCollectionGetter
{
  return self->_mutableCollectionGetter;
}

@end