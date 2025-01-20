@interface APSettingsStorageFile
- (APSettingsStorageFile)initWithDefaultValues:(id)a3;
- (APUnfairLock)accessLock;
- (NSDictionary)defaults;
- (NSMutableDictionary)storage;
- (id)_filePathWithName:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (void)_readFileIfNecessaryUsingKey:(id)a3;
- (void)_writeFileUsingKey:(id)a3;
- (void)setStorage:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
@end

@implementation APSettingsStorageFile

- (APSettingsStorageFile)initWithDefaultValues:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APSettingsStorageFile;
  v5 = [(APSettingsStorageFile *)&v13 init];
  if (v5)
  {
    v6 = [[APUnfairLock alloc] initWithOptions:0];
    accessLock = v5->_accessLock;
    v5->_accessLock = v6;

    uint64_t v8 = [v4 copy];
    defaults = v5->_defaults;
    v5->_defaults = (NSDictionary *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    storage = v5->_storage;
    v5->_storage = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (id)_filePathWithName:(id)a3
{
  v3 = [a3 sha256hash];
  id v4 = [@"s/f" stringByAppendingPathComponent:v3];

  return v4;
}

- (void)_readFileIfNecessaryUsingKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(APSettingsStorageFile *)self storage];
  if (!v5)
  {
    v6 = [v4 componentsSeparatedByString:@"."];
    if ([v6 count] != 2)
    {
      v7 = [NSString stringWithFormat:@"The key (%@) must have two parts separated by the separator character '%@'", v4, @"."];
      APSimulateCrash(5, v7, 0);
    }
    uint64_t v8 = [v6 firstObject];
    v9 = [(APSettingsStorageFile *)self _filePathWithName:v8];

    uint64_t v10 = objc_alloc_init(APStorageManager);
    id v18 = 0;
    BOOL v11 = [(APStorageManager *)v10 fileExistsAtPath:v9 error:&v18];
    id v12 = v18;
    if (v12)
    {
      objc_super v13 = APLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v20 = v9;
        __int16 v21 = 2114;
        id v22 = v12;
        _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_ERROR, "Error finding EFS Settings object %{private}@: %{public}@", buf, 0x16u);
      }
    }
    if (v11)
    {
      id v17 = v12;
      v14 = [(APStorageManager *)v10 objectStoredAtPath:v9 error:&v17];
      id v15 = v17;

      v16 = (void *)[v14 mutableCopy];
      [(APSettingsStorageFile *)self setStorage:v16];

      id v12 = v15;
    }
  }
}

- (void)_writeFileUsingKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@"."];
  uint64_t v6 = [v5 count];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"We didn't get something useable as a filename from the key: '%@'", v4];
    v9 = APLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v20 = v4;
      _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "We didn't get something useable as a filename from the key: '%{private}@'", buf, 0xCu);
    }

    APSimulateCrash(5, v8, 0);
  }
  else
  {
    if (v6 != 2)
    {
      uint64_t v10 = [NSString stringWithFormat:@"The key (%@) must have two parts separated by the separator character '%@'", v4, @"."];
      BOOL v11 = APLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        id v20 = v4;
        __int16 v21 = 2113;
        id v22 = @".";
        _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_ERROR, "The key (%{private}@) must have two parts separated by the separator character '%{private}@'", buf, 0x16u);
      }

      APSimulateCrash(5, v10, 0);
    }
    uint64_t v8 = objc_alloc_init(APStorageManager);
    id v12 = [(APSettingsStorageFile *)self storage];
    objc_super v13 = (void *)[v12 copy];

    v14 = [v5 firstObject];
    id v15 = [(APSettingsStorageFile *)self _filePathWithName:v14];

    id v18 = 0;
    [(APStorageManager *)v8 storeObject:v13 atPath:v15 error:&v18];
    v16 = (__CFString *)v18;
    if (v16)
    {
      id v17 = APLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        id v20 = v15;
        __int16 v21 = 2114;
        id v22 = v16;
        _os_log_impl(&dword_1D70B2000, v17, OS_LOG_TYPE_ERROR, "Error storing EFS Settings object %{private}@: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_valueForKey_error_);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(APSettingsStorageFile *)self accessLock];
  [v6 lock];
  [(APSettingsStorageFile *)self _readFileIfNecessaryUsingKey:v5];
  BOOL v7 = [(APSettingsStorageFile *)self storage];
  uint64_t v8 = v7;
  if (!v7 || ([v7 objectForKey:v5], (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v10 = [(APSettingsStorageFile *)self defaults];
    BOOL v11 = [v5 lastNamespacedComponent];
    v9 = [v10 objectForKey:v11];
  }
  [v6 unlock];

  return v9;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) == 0))
  {
    id v17 = NSString;
    id v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    id v20 = NSStringFromSelector(a2);
    __int16 v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    uint64_t v23 = [v17 stringWithFormat:@"%@ %@ Non storable value type (%@) for property %@", v19, v20, v22, v9];

    v24 = APLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      v27 = NSStringFromSelector(a2);
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138478595;
      v31 = v26;
      __int16 v32 = 2112;
      v33 = v27;
      __int16 v34 = 2114;
      v35 = v29;
      __int16 v36 = 2114;
      id v37 = v9;
      _os_log_impl(&dword_1D70B2000, v24, OS_LOG_TYPE_ERROR, "%{private}@ %@ Non storable value type (%{public}@) for property %{public}@", buf, 0x2Au);
    }
    APSimulateCrash(5, v23, 0);
  }
  else
  {
    uint64_t v10 = [(APSettingsStorageFile *)self accessLock];
    [v10 lock];
    [(APSettingsStorageFile *)self _readFileIfNecessaryUsingKey:v9];
    BOOL v11 = [(APSettingsStorageFile *)self storage];
    if (!v11)
    {
      id v12 = [MEMORY[0x1E4F1CA60] dictionary];
      [(APSettingsStorageFile *)self setStorage:v12];
    }
    objc_super v13 = [(APSettingsStorageFile *)self defaults];
    v14 = [v9 lastNamespacedComponent];
    id v15 = [v13 objectForKey:v14];

    int v16 = [v15 isEqual:v8];
    if (!v8 || v16) {
      [v11 removeObjectForKey:v9];
    }
    else {
      [v11 setObject:v8 forKey:v9];
    }
    [(APSettingsStorageFile *)self _writeFileUsingKey:v9];
    [v10 unlock];
  }
}

- (APUnfairLock)accessLock
{
  return self->_accessLock;
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
}

@end