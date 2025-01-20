@interface HKFeatureSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFeatureSettings)initWithCoder:(id)a3;
- (HKFeatureSettings)initWithDictionary:(id)a3;
- (NSDictionary)keyValueStorage;
- (id)dataForKey:(id)a3;
- (id)dataForKey:(id)a3 error:(id *)a4;
- (id)description;
- (id)numberForKey:(id)a3;
- (id)numberForKey:(id)a3 error:(id *)a4;
- (id)stringForKey:(id)a3;
- (id)stringForKey:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureSettings

- (HKFeatureSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureSettings;
  v5 = [(HKFeatureSettings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    keyValueStorage = v5->_keyValueStorage;
    v5->_keyValueStorage = (NSDictionary *)v6;
  }
  return v5;
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HKFeatureSettings *)self keyValueStorage];
  v8 = [v7 valueForKey:v6];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to retrieve value for key %@ as NSData.", v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HKFeatureSettings *)self keyValueStorage];
  v8 = [v7 valueForKey:v6];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to retrieve value for key %@ as NSString.", v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (id)numberForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HKFeatureSettings *)self keyValueStorage];
  v8 = [v7 valueForKey:v6];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to retrieve value for key %@ as NSNumber.", v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (id)dataForKey:(id)a3
{
  id v8 = 0;
  v3 = [(HKFeatureSettings *)self dataForKey:a3 error:&v8];
  id v4 = v8;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT)) {
      -[HKFeatureSettings dataForKey:](v5, v4);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v8 = 0;
  v3 = [(HKFeatureSettings *)self stringForKey:a3 error:&v8];
  id v4 = v8;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT)) {
      -[HKFeatureSettings dataForKey:](v5, v4);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)numberForKey:(id)a3
{
  id v8 = 0;
  v3 = [(HKFeatureSettings *)self numberForKey:a3 error:&v8];
  id v4 = v8;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT)) {
      -[HKFeatureSettings dataForKey:](v5, v4);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureSettings;
  if ([(HKFeatureSettings *)&v9 isEqual:v4]) {
    goto LABEL_2;
  }
  if (![v4 isMemberOfClass:objc_opt_class()])
  {
LABEL_7:
    char v5 = 0;
    goto LABEL_8;
  }
  keyValueStorage = self->_keyValueStorage;
  v7 = (NSDictionary *)v4[1];
  if (keyValueStorage != v7)
  {
    if (v7)
    {
      char v5 = -[NSDictionary isEqual:](keyValueStorage, "isEqual:");
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_2:
  char v5 = 1;
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_keyValueStorage hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_keyValueStorage];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureSettings;
  char v5 = [(HKFeatureSettings *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"keyValueStorage"];
    keyValueStorage = v5->_keyValueStorage;
    v5->_keyValueStorage = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)keyValueStorage
{
  return self->_keyValueStorage;
}

- (void).cxx_destruct
{
}

- (void)dataForKey:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  OUTLINED_FUNCTION_0_0(&dword_19C023000, v5, v6, "Reading setting failed with error: %{public}@", v7, v8, v9, v10, 2u);
}

@end