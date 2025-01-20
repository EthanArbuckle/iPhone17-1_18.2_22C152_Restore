@interface MAGraphSpecification
- (Class)defaultEdgeClass;
- (Class)defaultNodeClass;
- (Class)edgeClassWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (Class)nodeClassWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (MAGraphReference)rootGraphReference;
- (MAGraphSpecification)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)persistenceOptions;
- (void)setDefaultEdgeClass:(Class)a3;
- (void)setDefaultNodeClass:(Class)a3;
- (void)setPersistenceOptions:(int64_t)a3;
- (void)setRootGraphReference:(id)a3;
@end

@implementation MAGraphSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootGraphReference, 0);
  objc_storeStrong((id *)&self->_defaultEdgeClass, 0);
  objc_storeStrong((id *)&self->_defaultNodeClass, 0);
}

- (void)setRootGraphReference:(id)a3
{
}

- (MAGraphReference)rootGraphReference
{
  return self->_rootGraphReference;
}

- (void)setDefaultEdgeClass:(Class)a3
{
}

- (Class)defaultEdgeClass
{
  return (Class)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultNodeClass:(Class)a3
{
}

- (Class)defaultNodeClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersistenceOptions:(int64_t)a3
{
  self->_persistenceOptions = a3;
}

- (int64_t)persistenceOptions
{
  return self->_persistenceOptions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  *(void *)(v4 + 8) = self->_persistenceOptions;
  objc_storeStrong((id *)(v4 + 16), self->_defaultNodeClass);
  objc_storeStrong((id *)(v4 + 24), self->_defaultEdgeClass);
  objc_storeStrong((id *)(v4 + 32), self->_rootGraphReference);
  return (id)v4;
}

- (Class)edgeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return self->_defaultEdgeClass;
}

- (Class)nodeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return self->_defaultNodeClass;
}

- (MAGraphSpecification)init
{
  v8.receiver = self;
  v8.super_class = (Class)MAGraphSpecification;
  v2 = [(MAGraphSpecification *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    Class defaultNodeClass = v2->_defaultNodeClass;
    v2->_Class defaultNodeClass = (Class)v3;

    uint64_t v5 = objc_opt_class();
    Class defaultEdgeClass = v2->_defaultEdgeClass;
    v2->_Class defaultEdgeClass = (Class)v5;
  }
  return v2;
}

@end