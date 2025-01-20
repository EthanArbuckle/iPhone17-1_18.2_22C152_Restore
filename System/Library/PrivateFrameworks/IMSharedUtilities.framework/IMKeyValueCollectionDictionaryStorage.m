@interface IMKeyValueCollectionDictionaryStorage
- (IMKeyValueCollectionDictionaryStorage)init;
- (IMKeyValueCollectionDictionaryStorage)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation IMKeyValueCollectionDictionaryStorage

- (NSDictionary)dictionary
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary copy];

  return (NSDictionary *)v2;
}

- (IMKeyValueCollectionDictionaryStorage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMKeyValueCollectionDictionaryStorage;
  v5 = [(IMKeyValueCollectionDictionaryStorage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (IMKeyValueCollectionDictionaryStorage)init
{
  return [(IMKeyValueCollectionDictionaryStorage *)self initWithDictionary:MEMORY[0x1E4F1CC08]];
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  dictionary = self->_dictionary;

  return (id)[v4 initWithDictionary:dictionary];
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)IMKeyValueCollectionDictionaryStorage;
  id v4 = [(IMKeyValueCollectionDictionaryStorage *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ :%@]", v4, self->_dictionary];

  return (NSString *)v5;
}

- (void).cxx_destruct
{
}

@end