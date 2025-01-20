@interface APSettingsStorageUserDefaults
- (APSettingsStorageUserDefaults)initWithDefaultValues:(id)a3;
- (NSDictionary)defaults;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)synchronize;
@end

@implementation APSettingsStorageUserDefaults

- (APSettingsStorageUserDefaults)initWithDefaultValues:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APSettingsStorageUserDefaults;
  v5 = [(APSettingsStorageUserDefaults *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  if (+[APSystemInternal isAppleInternalInstall])
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AdPlatforms"];
    uint64_t v7 = [v4 copy];
    defaults = v5->_defaults;
    v5->_defaults = (NSDictionary *)v7;

LABEL_4:
    v9 = v5;
    goto LABEL_8;
  }
  v10 = APLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "Support for user defaults storage is not supported for this case, please utilize another storage type.", v12, 2u);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_valueForKey_error_);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AdPlatforms"];
    uint64_t v7 = [v6 objectForKey:v5];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      v10 = [(APSettingsStorageUserDefaults *)self defaults];
      v11 = [v5 lastNamespacedComponent];
      id v9 = [v10 objectForKey:v11];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AdPlatforms"];
    v10 = [(APSettingsStorageUserDefaults *)self defaults];
    v11 = [v8 lastNamespacedComponent];
    v12 = [v10 objectForKey:v11];

    if ([v12 isEqual:v7])
    {
      [v9 setObject:0 forKey:v8];
    }
    else
    {
      [v9 setObject:v7 forKey:v8];
      v15 = @"Key";
      v16[0] = v8;
      objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"com.apple.AdPlatforms.defaultsDidChange" object:self userInfo:v13];
    }
  }
}

- (void)synchronize
{
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (void).cxx_destruct
{
}

@end