@interface CNUserDefaults
+ (id)inMemoryPreferences;
+ (id)preferencesWithApplicationID:(id)a3;
+ (id)standardPreferences;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (BOOL)synchronize;
- (BOOL)userHasOptedOutOfPreference:(id)a3;
- (CNUserDefaults)initWithApplicationID:(id)a3;
- (CNUserDefaults)initWithPrimitiveDefaults:(id)a3;
- (NSDictionary)registeredDefaults;
- (double)doubleForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)primitiveDefaults;
- (id)primitiveObjectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (void)primitiveRemoveObjectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPrimitiveObject:(id)a3 forKey:(id)a4;
- (void)setRegisteredDefaults:(id)a3;
- (void)setupAutosync;
@end

@implementation CNUserDefaults

- (BOOL)userHasOptedOutOfPreference:(id)a3
{
  char v5 = 0;
  BOOL v3 = ![(CNUserDefaults *)self BOOLForKey:a3 keyExists:&v5];
  return v5 && v3;
}

+ (id)standardPreferences
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CNUserDefaults_standardPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (standardPreferences_cn_once_token_1 != -1) {
    dispatch_once(&standardPreferences_cn_once_token_1, block);
  }
  v2 = (void *)standardPreferences_cn_once_object_1;

  return v2;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char v5 = [(CNUserDefaults *)self objectForKey:v4];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  char v9 = 0;
  int64_t v5 = [(CNUserDefaults *)self primitiveIntegerValueForKey:v4 keyExists:&v9];
  if (!v9)
  {
    v6 = [(CNUserDefaults *)self registeredDefaults];
    id v7 = [v6 objectForKey:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v5 = [v7 integerValue];
    }
  }
  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  char v9 = 0;
  char v5 = [(CNUserDefaults *)self primitiveBoolValueForKey:v4 keyExists:&v9];
  if (!v9)
  {
    v6 = [(CNUserDefaults *)self registeredDefaults];
    id v7 = [v6 objectForKey:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [v7 BOOLValue];
    }
  }
  return v5;
}

- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  return [(CNPrimitiveUserDefaults *)self->_primitiveDefaults primitiveBoolValueForKey:a3 keyExists:a4];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(CNUserDefaults *)self primitiveObjectForKey:v4];
  if (!v5)
  {
    v6 = [(CNUserDefaults *)self registeredDefaults];
    id v7 = [v6 objectForKey:v4];
    char v5 = (void *)[v7 copy];
  }

  return v5;
}

- (NSDictionary)registeredDefaults
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (id)primitiveObjectForKey:(id)a3
{
  return (id)[(CNPrimitiveUserDefaults *)self->_primitiveDefaults primitiveObjectForKey:a3];
}

- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  return [(CNPrimitiveUserDefaults *)self->_primitiveDefaults primitiveIntegerValueForKey:a3 keyExists:a4];
}

- (CNUserDefaults)initWithApplicationID:(id)a3
{
  id v4 = a3;
  char v5 = [[CNCFPreferencesPrimitiveUserDefaults alloc] initWithApplicationID:v4];

  v6 = [(CNUserDefaults *)self initWithPrimitiveDefaults:v5];
  return v6;
}

uint64_t __37__CNUserDefaults_standardPreferences__block_invoke(uint64_t a1)
{
  standardPreferences_cn_once_object_1 = [objc_alloc(*(Class *)(a1 + 32)) initWithApplicationID:0];

  return MEMORY[0x1F41817F8]();
}

- (CNUserDefaults)initWithPrimitiveDefaults:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUserDefaults;
  v6 = [(CNUserDefaults *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_primitiveDefaults, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)preferencesWithApplicationID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithApplicationID:v4];

  return v5;
}

- (id)primitiveDefaults
{
  return self->_primitiveDefaults;
}

- (void)setPrimitiveObject:(id)a3 forKey:(id)a4
{
}

- (void)primitiveRemoveObjectForKey:(id)a3
{
}

- (BOOL)synchronize
{
  return [(CNPrimitiveUserDefaults *)self->_primitiveDefaults synchronize];
}

- (void)setupAutosync
{
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  [(CNUserDefaults *)self setPrimitiveObject:a3 forKey:a4];

  [(CNUserDefaults *)self setupAutosync];
}

- (void)removeObjectForKey:(id)a3
{
  [(CNUserDefaults *)self primitiveRemoveObjectForKey:a3];

  [(CNUserDefaults *)self setupAutosync];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    id v4 = (void *)MEMORY[0x1E4F1CFC8];
  }
  [(CNUserDefaults *)self setObject:*v4 forKey:a4];
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(CNUserDefaults *)self setObject:v8 forKey:v7];
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(CNUserDefaults *)self objectForKey:v4];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(CNUserDefaults *)self setObject:v8 forKey:v7];
}

- (void)setRegisteredDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredDefaults, 0);

  objc_storeStrong((id *)&self->_primitiveDefaults, 0);
}

+ (id)inMemoryPreferences
{
  v2 = objc_alloc_init(_CNInMemoryUserDefaults);

  return v2;
}

@end