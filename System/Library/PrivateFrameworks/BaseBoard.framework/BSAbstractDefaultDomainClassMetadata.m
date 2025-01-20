@interface BSAbstractDefaultDomainClassMetadata
- (BSAbstractDefaultDomainClassMetadata)init;
- (id)description;
- (void)initWithClass:(void *)a1;
@end

@implementation BSAbstractDefaultDomainClassMetadata

- (BSAbstractDefaultDomainClassMetadata)init
{
  return (BSAbstractDefaultDomainClassMetadata *)-[BSAbstractDefaultDomainClassMetadata initWithClass:](self, 0);
}

- (void)initWithClass:(void *)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel_initWithClass_, a1, @"_BSAbstractDefaultDomainClassMetadata.m", 23, @"Invalid parameter not satisfying: %@", @"clazz" object file lineNumber description];
  }
  v12.receiver = a1;
  v12.super_class = (Class)BSAbstractDefaultDomainClassMetadata;
  v4 = objc_msgSendSuper2(&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4[1] = a2;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = (void *)v5[2];
    v5[2] = v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = (void *)v5[3];
    v5[3] = v8;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p propertyNameToPropertyMap: %@\nselectorToPropertyMap: %@>", v5, self, self->_propertyNameToPropertyMap, self->_selectorToPropertyMap];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorToPropertyMap, 0);
  objc_storeStrong((id *)&self->_propertyNameToPropertyMap, 0);
}

@end