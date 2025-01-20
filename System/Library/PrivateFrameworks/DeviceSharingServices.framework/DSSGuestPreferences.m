@interface DSSGuestPreferences
- (DSSGuestPreferences)init;
- (DSSGuestPreferences)initWithCoder:(id)a3;
- (id)objectForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation DSSGuestPreferences

- (DSSGuestPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)DSSGuestPreferences;
  v2 = [(DSSGuestPreferences *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    store = v2->_store;
    v2->_store = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_store objectForKeyedSubscript:a3];
}

- (void)removeObjectForKey:(id)a3
{
}

- (DSSGuestPreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSSGuestPreferences;
  v5 = [(DSSGuestPreferences *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"store"];
    store = v5->_store;
    v5->_store = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end