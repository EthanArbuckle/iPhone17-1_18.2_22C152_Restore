@interface NSKeyValueSlowMutableCollectionGetter
- (BOOL)treatNilValuesLikeEmptyCollections;
- (NSKeyValueSlowMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 baseGetter:(id)a5 baseSetter:(id)a6 containerIsa:(Class)a7 proxyClass:(Class)a8;
- (id)baseGetter;
- (id)baseSetter;
- (void)dealloc;
@end

@implementation NSKeyValueSlowMutableCollectionGetter

- (NSKeyValueSlowMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 baseGetter:(id)a5 baseSetter:(id)a6 containerIsa:(Class)a7 proxyClass:(Class)a8
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)NSKeyValueSlowMutableCollectionGetter;
  v13 = [(NSKeyValueProxyGetter *)&v17 initWithContainerClassID:a3 key:a4 proxyClass:a8];
  if (v13)
  {
    self;
    if (objc_opt_isKindOfClass()) {
      v14 = [[NSKeyValueSlowGetter alloc] initWithContainerClassID:a3 key:a4 containerIsa:a7];
    }
    else {
      v14 = (NSKeyValueSlowGetter *)a5;
    }
    v13->_baseGetter = &v14->super;
    self;
    if (objc_opt_isKindOfClass()) {
      v15 = [[NSKeyValueSlowSetter alloc] initWithContainerClassID:a3 key:a4 containerIsa:a7];
    }
    else {
      v15 = (NSKeyValueSlowSetter *)a6;
    }
    v13->_baseSetter = &v15->super;
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueSlowMutableCollectionGetter;
  [(NSKeyValueAccessor *)&v3 dealloc];
}

- (id)baseGetter
{
  return self->_baseGetter;
}

- (id)baseSetter
{
  return self->_baseSetter;
}

- (BOOL)treatNilValuesLikeEmptyCollections
{
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end