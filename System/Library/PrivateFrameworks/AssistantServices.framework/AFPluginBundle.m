@interface AFPluginBundle
- (AFPluginBundle)init;
- (BOOL)supportsClassIdentifier:(id)a3 forDomainKey:(id)a4 groupIdentifier:(id)a5;
- (Class)factoryClass;
- (NSMutableDictionary)classIdentifiers;
- (id)factoryInstance;
- (void)registerClassIdentifier:(id)a3 forDomain:(id)a4 inGroup:(id)a5;
- (void)setClassIdentifiers:(id)a3;
- (void)setFactoryClass:(Class)a3;
- (void)setFactoryInstance:(id)a3;
@end

@implementation AFPluginBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classIdentifiers, 0);
  objc_storeStrong(&self->_factoryInstance, 0);
  objc_storeStrong((id *)&self->_factoryClass, 0);
}

- (void)setClassIdentifiers:(id)a3
{
}

- (NSMutableDictionary)classIdentifiers
{
  return self->_classIdentifiers;
}

- (void)setFactoryInstance:(id)a3
{
}

- (id)factoryInstance
{
  return self->_factoryInstance;
}

- (void)setFactoryClass:(Class)a3
{
}

- (Class)factoryClass
{
  return self->_factoryClass;
}

- (BOOL)supportsClassIdentifier:(id)a3 forDomainKey:(id)a4 groupIdentifier:(id)a5
{
  if (!a3 || !a4 || !a5) {
    return 0;
  }
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(AFPluginBundle *)self classIdentifiers];
  v12 = [v11 objectForKeyedSubscript:v9];

  v13 = [v12 objectForKeyedSubscript:v8];

  LOBYTE(v8) = [v13 containsObject:v10];
  return (char)v8;
}

- (void)registerClassIdentifier:(id)a3 forDomain:(id)a4 inGroup:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v14 && v8 && v9)
  {
    id v10 = [(AFPluginBundle *)self classIdentifiers];
    v11 = [v10 objectForKeyedSubscript:v8];

    if (!v11)
    {
      v11 = [MEMORY[0x1E4F1CA60] dictionary];
      v12 = [(AFPluginBundle *)self classIdentifiers];
      [v12 setObject:v11 forKeyedSubscript:v8];
    }
    v13 = [v11 objectForKeyedSubscript:v9];
    if (!v13)
    {
      v13 = [MEMORY[0x1E4F1CA48] array];
      [v11 setObject:v13 forKeyedSubscript:v9];
    }
    [v13 addObject:v14];
  }
}

- (AFPluginBundle)init
{
  v6.receiver = self;
  v6.super_class = (Class)AFPluginBundle;
  v2 = [(AFPluginBundle *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    classIdentifiers = v2->_classIdentifiers;
    v2->_classIdentifiers = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end