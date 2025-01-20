@interface BSUserDefaultsTestDoubleDictionaryImpl
- (BOOL)BOOLForKey:(id)a3;
- (BSUserDefaultsTestDoubleDictionaryImpl)init;
- (double)doubleForKey:(id)a3;
- (float)floatForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringArrayForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setURL:(id)a3 forKey:(id)a4;
@end

@implementation BSUserDefaultsTestDoubleDictionaryImpl

- (BSUserDefaultsTestDoubleDictionaryImpl)init
{
  v6.receiver = self;
  v6.super_class = (Class)BSUserDefaultsTestDoubleDictionaryImpl;
  v2 = [(BSUserDefaultsTestDoubleDictionaryImpl *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_dictionary objectForKey:a3];
  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)stringForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  return v3;
}

- (id)arrayForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  return v3;
}

- (id)dictionaryForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  return v3;
}

- (id)dataForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  return v3;
}

- (id)stringArrayForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  return v3;
}

- (int64_t)integerForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (float)floatForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (double)doubleForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  v3 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)URLForKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  char v4 = [(BSUserDefaultsTestDoubleDictionaryImpl *)self objectForKey:a3];
  double v5 = [v3 URLWithString:v4];

  return v5;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v7 = a4;
  objc_super v6 = [NSNumber numberWithInteger:a3];
  [(BSUserDefaultsTestDoubleDictionaryImpl *)self setObject:v6 forKey:v7];
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  id v8 = a4;
  *(float *)&double v6 = a3;
  id v7 = [NSNumber numberWithFloat:v6];
  [(BSUserDefaultsTestDoubleDictionaryImpl *)self setObject:v7 forKey:v8];
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v7 = a4;
  double v6 = [NSNumber numberWithDouble:a3];
  [(BSUserDefaultsTestDoubleDictionaryImpl *)self setObject:v6 forKey:v7];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  double v6 = [NSNumber numberWithBool:v4];
  [(BSUserDefaultsTestDoubleDictionaryImpl *)self setObject:v6 forKey:v7];
}

- (void)setURL:(id)a3 forKey:(id)a4
{
  id v7 = a4;
  double v6 = [a3 absoluteString];
  [(BSUserDefaultsTestDoubleDictionaryImpl *)self setObject:v6 forKey:v7];
}

- (void).cxx_destruct
{
}

@end