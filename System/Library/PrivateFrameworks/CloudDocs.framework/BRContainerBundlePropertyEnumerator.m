@interface BRContainerBundlePropertyEnumerator
- (BRContainerBundlePropertyEnumerator)initWithContainerPlist:(id)a3 propertyKey:(id)a4 valuesOfClass:(Class)a5;
- (id)nextObject;
@end

@implementation BRContainerBundlePropertyEnumerator

- (BRContainerBundlePropertyEnumerator)initWithContainerPlist:(id)a3 propertyKey:(id)a4 valuesOfClass:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRContainerBundlePropertyEnumerator;
  v11 = [(BRContainerBundlePropertyEnumerator *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_plist, a3);
    v13 = [[BRContainerBundleIdentifiersEnumerator alloc] initWithContainerPlist:v9];
    enumerator = v12->_enumerator;
    v12->_enumerator = &v13->super;

    objc_storeStrong((id *)&v12->_propertyKey, a4);
    v12->_valueClass = a5;
  }

  return v12;
}

- (id)nextObject
{
  v3 = [(NSEnumerator *)self->_enumerator nextObject];
  if (!v3)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_8;
  }
  while (1)
  {
    v4 = [(NSDictionary *)self->_plist objectForKey:v3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_5:

    uint64_t v6 = [(NSEnumerator *)self->_enumerator nextObject];

    v3 = (void *)v6;
    if (!v6) {
      goto LABEL_6;
    }
  }
  v5 = [v4 objectForKey:self->_propertyKey];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }

LABEL_8:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyKey, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);

  objc_storeStrong((id *)&self->_plist, 0);
}

@end