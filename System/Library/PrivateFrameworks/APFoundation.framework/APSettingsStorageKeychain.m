@interface APSettingsStorageKeychain
- (APSettingsStorageKeychain)initWithDefaultValues:(id)a3;
- (NSDictionary)defaults;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (id)valueForKey:(id)a3 settings:(id)a4 error:(id *)a5;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)setValue:(id)a3 forKey:(id)a4 settings:(id)a5 error:(id *)a6;
@end

@implementation APSettingsStorageKeychain

- (APSettingsStorageKeychain)initWithDefaultValues:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSettingsStorageKeychain;
  v5 = [(APSettingsStorageKeychain *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    defaults = v5->_defaults;
    v5->_defaults = (NSDictionary *)v6;
  }
  return v5;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_valueForKey_error_);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_valueForKey_settings_error_);
}

- (id)valueForKey:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v23 = 0;
    v10 = (id *)&v23;
    uint64_t v11 = +[APKeychainServices objectForKey:v8 settings:v9 error:&v23];
  }
  else
  {
    uint64_t v22 = 0;
    v10 = (id *)&v22;
    uint64_t v11 = +[APKeychainServices objectForKey:v8 error:&v22];
  }
  v12 = (void *)v11;
  id v13 = *v10;
  v14 = [(APSettingsStorageKeychain *)self defaults];
  v15 = [v8 lastNamespacedComponent];
  v16 = [v14 objectForKey:v15];

  if (v13) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v12 == 0;
  }
  if (!v17 || v16 == 0)
  {
    if (a5 && v13)
    {
      v19 = 0;
      *a5 = v13;
      goto LABEL_17;
    }
    id v20 = v12;
  }
  else
  {
    id v20 = v16;
  }
  v19 = v20;
LABEL_17:

  return v19;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
}

- (void)setValue:(id)a3 forKey:(id)a4 settings:(id)a5 error:(id *)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(APSettingsStorageKeychain *)self defaults];
  id v13 = [v10 lastNamespacedComponent];
  v14 = [v12 objectForKey:v13];

  if ([v14 isEqual:v16])
  {
    id v15 = 0;
    if (!v11) {
      goto LABEL_8;
    }
LABEL_6:
    +[APKeychainServices setObject:v15 forKey:v10 settings:v11 error:a6];
    goto LABEL_9;
  }
  if (v11)
  {
    id v15 = v16;
    goto LABEL_6;
  }
  id v15 = v16;
LABEL_8:
  +[APKeychainServices setObject:v15 forKey:v10 error:a6];
LABEL_9:
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (void).cxx_destruct
{
}

@end