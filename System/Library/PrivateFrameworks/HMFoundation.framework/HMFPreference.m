@interface HMFPreference
+ (id)shortDescription;
- (BOOL)BOOLValue;
- (HMFPreference)init;
- (HMFPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5;
- (HMFPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5 parent:(id)a6;
- (HMFPreference)parent;
- (NSData)dataValue;
- (NSNumber)numberValue;
- (NSObject)value;
- (NSString)key;
- (NSString)stringValue;
- (id)shortDescription;
- (unint64_t)options;
- (void)setValue:(id)a3;
@end

@implementation HMFPreference

- (BOOL)BOOLValue
{
  if (__disabledDueToParent(self)) {
    return 0;
  }
  v4 = [(HMFPreference *)self value];
  if (v4)
  {
    v5 = [(HMFPreference *)self numberValue];
    v6 = v5;
    BOOL v3 = !v5 || [v5 BOOLValue];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (NSNumber)numberValue
{
  if (__disabledDueToParent(self))
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [(HMFPreference *)self value];
    if (v4)
    {
      objc_opt_class();
      int v5 = objc_opt_isKindOfClass() & 1;
      if (v5) {
        v6 = v4;
      }
      else {
        v6 = 0;
      }
      id v7 = v6;
      BOOL v3 = v4;
      if (!v5)
      {
        id v8 = v4;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v10 = (isKindOfClass & 1) != 0 ? v8 : 0;
        id v11 = v10;

        BOOL v3 = 0;
        if (isKindOfClass)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
          [v12 setNumberStyle:1];
          BOOL v3 = [v12 numberFromString:v8];
        }
      }
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return (NSNumber *)v3;
}

- (NSObject)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMFPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5 parent:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMFPreference;
  v13 = [(HMFPreference *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    key = v13->_key;
    v13->_key = (NSString *)v14;

    v13->_options = a4;
    uint64_t v16 = [v11 copy];
    value = v13->_value;
    v13->_value = v16;

    objc_storeWeak((id *)&v13->_parent, v12);
  }

  return v13;
}

- (HMFPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5
{
  return [(HMFPreference *)self initWithKey:a3 options:a4 defaultValue:a5 parent:0];
}

- (HMFPreference)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (HMFPreference *)WeakRetained;
}

- (HMFPreference)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  int v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  return @"Preference";
}

- (id)shortDescription
{
  uint64_t v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  int v5 = [(HMFPreference *)self key];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)stringValue
{
  if (__disabledDueToParent(self))
  {
    uint64_t v3 = 0;
  }
  else
  {
    v4 = [(HMFPreference *)self value];
    if (v4)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        v6 = v4;
      }
      else {
        v6 = 0;
      }
      id v7 = v6;
      if (isKindOfClass)
      {
        id v8 = [v4 stringValue];
      }
      else
      {
        id v9 = v4;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
        id v8 = v10;
      }
      uint64_t v3 = v8;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSData)dataValue
{
  if (__disabledDueToParent(self))
  {
    id v3 = 0;
  }
  else
  {
    v4 = [(HMFPreference *)self value];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v5 = v4;
      }
      else {
        int v5 = 0;
      }
      id v3 = v5;
    }
    else
    {
      id v3 = 0;
    }
  }
  return (NSData *)v3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end