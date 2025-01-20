@interface _DKKeyValueStore
+ (id)standardUserDefaultsKeyValueStore;
- (BOOL)BOOLForKey:(id)a3;
- (_DKKeyValueStore)initWithSimpleKeyValueStore:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)dateForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)numberForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 havingClass:(Class)a4;
- (id)stringForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _DKKeyValueStore

- (_DKKeyValueStore)initWithSimpleKeyValueStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKKeyValueStore;
  v6 = [(_DKKeyValueStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

+ (id)standardUserDefaultsKeyValueStore
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [[_DKKeyValueStore alloc] initWithSimpleKeyValueStore:v2];

  return v3;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(_DKKeyValueStore *)self objectForKey:v4 havingClass:objc_opt_class()];

  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  v3 = [(_DKKeyValueStore *)self numberForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(_DKKeyValueStore *)self setNumber:v8 forKey:v7];
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(_DKKeyValueStore *)self objectForKey:v4 havingClass:objc_opt_class()];

  return v5;
}

- (id)dateForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(_DKKeyValueStore *)self objectForKey:v4 havingClass:objc_opt_class()];

  return v5;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(_DKKeyValueStore *)self objectForKey:v4 havingClass:objc_opt_class()];

  return v5;
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(_DKKeyValueStore *)self objectForKey:v4 havingClass:objc_opt_class()];

  return v5;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(_DKKeyValueStore *)self objectForKey:v4 havingClass:objc_opt_class()];

  return v5;
}

- (id)objectForKey:(id)a3
{
  return (id)[(_DKSimpleKeyValueStore *)self->_store objectForKey:a3];
}

- (id)objectForKey:(id)a3 havingClass:(Class)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_DKSimpleKeyValueStore *)self->_store objectForKey:v6];
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = objc_opt_class();
    }
    else {
      uint64_t v8 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v10 = 138413058;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      Class v17 = a4;
      _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@: Object %@ of wrong class, found %@ instead of %@", (uint8_t *)&v10, 0x2Au);
    }

    id v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end