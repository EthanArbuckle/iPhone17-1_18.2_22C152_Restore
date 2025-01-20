@interface NSKeyValueIvarMutableCollectionGetter
- (NSKeyValueIvarMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6 proxyClass:(Class)a7;
- (objc_ivar)ivar;
@end

@implementation NSKeyValueIvarMutableCollectionGetter

- (NSKeyValueIvarMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6 proxyClass:(Class)a7
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSKeyValueIvarMutableCollectionGetter;
  result = [(NSKeyValueProxyGetter *)&v9 initWithContainerClassID:a3 key:a4 proxyClass:a7];
  if (result) {
    result->_ivar = a6;
  }
  return result;
}

- (objc_ivar)ivar
{
  return self->_ivar;
}

@end