@interface CNDictionaryPrimitiveUserDefaults
- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (BOOL)synchronize;
- (CNDictionaryPrimitiveUserDefaults)init;
- (id)primitiveObjectForKey:(id)a3;
- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (unint64_t)setupAutosyncCount;
- (unint64_t)synchronizeCount;
- (void)primitiveRemoveObjectForKey:(id)a3;
- (void)setPrimitiveObject:(id)a3 forKey:(id)a4;
- (void)setupAutosync;
@end

@implementation CNDictionaryPrimitiveUserDefaults

- (CNDictionaryPrimitiveUserDefaults)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNDictionaryPrimitiveUserDefaults;
  v2 = [(CNDictionaryPrimitiveUserDefaults *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    preferences = v2->_preferences;
    v2->_preferences = v3;

    v5 = v2;
  }

  return v2;
}

- (id)primitiveObjectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_preferences objectForKey:a3];
}

- (void)setPrimitiveObject:(id)a3 forKey:(id)a4
{
  preferences = self->_preferences;
  if (a3) {
    [(NSMutableDictionary *)preferences setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)preferences removeObjectForKey:a4];
  }
}

- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  v5 = [(NSMutableDictionary *)self->_preferences objectForKey:a3];
  v6 = v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  char v7 = [v5 BOOLValue];

  return v7;
}

- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  v5 = [(NSMutableDictionary *)self->_preferences objectForKey:a3];
  v6 = v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  int64_t v7 = [v5 integerValue];

  return v7;
}

- (void)primitiveRemoveObjectForKey:(id)a3
{
}

- (BOOL)synchronize
{
  return 1;
}

- (void)setupAutosync
{
}

- (unint64_t)synchronizeCount
{
  return self->_synchronizeCount;
}

- (unint64_t)setupAutosyncCount
{
  return self->_setupAutosyncCount;
}

- (void).cxx_destruct
{
}

@end