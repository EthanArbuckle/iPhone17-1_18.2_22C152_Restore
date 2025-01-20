@interface CRKUserDefaultsObject
- (CRKKeyObjectStoring)store;
- (CRKUserDefaultsObject)initWithKey:(id)a3;
- (CRKUserDefaultsObject)initWithStore:(id)a3 key:(id)a4;
- (NSString)key;
- (id)value;
- (void)registerDefaultValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CRKUserDefaultsObject

- (CRKUserDefaultsObject)initWithKey:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA40];
  id v5 = a3;
  v6 = [v4 standardUserDefaults];
  v7 = [(CRKUserDefaultsObject *)self initWithStore:v6 key:v5];

  return v7;
}

- (CRKUserDefaultsObject)initWithStore:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKUserDefaultsObject;
  v9 = [(CRKUserDefaultsObject *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    uint64_t v11 = [v8 copy];
    key = v10->_key;
    v10->_key = (NSString *)v11;
  }
  return v10;
}

- (id)value
{
  v3 = [(CRKUserDefaultsObject *)self store];
  v4 = [(CRKUserDefaultsObject *)self key];
  id v5 = [v3 objectForKey:v4];

  return v5;
}

- (void)setValue:(id)a3
{
  id v6 = a3;
  v4 = [(CRKUserDefaultsObject *)self store];
  id v5 = [(CRKUserDefaultsObject *)self key];
  if (v6) {
    [v4 setObject:v6 forKey:v5];
  }
  else {
    [v4 removeObjectForKey:v5];
  }
}

- (void)registerDefaultValue:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CRKUserDefaultsObject *)self store];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRKUserDefaultsObject *)self store];
    id v8 = [(CRKUserDefaultsObject *)self key];
    v10 = v8;
    v11[0] = v4;
    v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 registerDefaults:v9];
  }
}

- (NSString)key
{
  return self->_key;
}

- (CRKKeyObjectStoring)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end