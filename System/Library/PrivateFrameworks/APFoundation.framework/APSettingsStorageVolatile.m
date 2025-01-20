@interface APSettingsStorageVolatile
- (APSettingsStorageVolatile)initWithDefaultValues:(id)a3;
- (NSDictionary)defaults;
- (NSMutableDictionary)volatileData;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
@end

@implementation APSettingsStorageVolatile

- (APSettingsStorageVolatile)initWithDefaultValues:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSettingsStorageVolatile;
  v5 = [(APSettingsStorageVolatile *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    defaults = v5->_defaults;
    v5->_defaults = (NSDictionary *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    volatileData = v5->_volatileData;
    v5->_volatileData = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_valueForKey_error_);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(APSettingsStorageVolatile *)self volatileData];
  v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v9 = [(APSettingsStorageVolatile *)self defaults];
    v10 = [v5 lastNamespacedComponent];
    id v8 = [v9 objectForKey:v10];
  }
  return v8;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = [(APSettingsStorageVolatile *)self defaults];
  v9 = [v7 lastNamespacedComponent];
  v10 = [v8 objectForKey:v9];

  int v11 = [v10 isEqual:v14];
  v12 = [(APSettingsStorageVolatile *)self volatileData];
  v13 = v12;
  if (!v14 || v11) {
    [v12 setValue:0 forKey:v7];
  }
  else {
    [v12 setObject:v14 forKey:v7];
  }
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (NSMutableDictionary)volatileData
{
  return self->_volatileData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volatileData, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end